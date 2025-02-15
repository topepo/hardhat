% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/blueprint.R
\name{refresh_blueprint}
\alias{refresh_blueprint}
\title{Refresh a preprocessing blueprint}
\usage{
refresh_blueprint(blueprint)
}
\arguments{
\item{blueprint}{A preprocessing blueprint.}
}
\value{
\code{blueprint} is returned after a call to the corresponding constructor.
}
\description{
\code{refresh_blueprint()} is a developer facing generic function that is called
at the end of \code{\link[=update_blueprint]{update_blueprint()}}. It simply is a wrapper around the
method specific \code{new_*_blueprint()} function that runs the updated blueprint
through the constructor again to ensure that all of the elements of the
blueprint are still valid after the update.
}
\details{
If you implement your own custom \code{blueprint}, you should export a
\code{refresh_blueprint()} method that just calls the constructor for your blueprint
and passes through all of the elements of the blueprint to the constructor.
}
\examples{

blueprint <- default_xy_blueprint()

# This should never be done manually, but is essentially
# what `update_blueprint(blueprint, intercept = TRUE)` does for you
blueprint$intercept <- TRUE

# Then update_blueprint() will call refresh_blueprint()
# to ensure that the structure is correct
refresh_blueprint(blueprint)

# So you can't do something like...
blueprint_bad <- blueprint
blueprint_bad$intercept <- 1

# ...because the constructor will catch it
\dontrun{
refresh_blueprint(blueprint_bad)
}

# And update_blueprint() catches this automatically
\dontrun{
update_blueprint(blueprint, intercept = 1)
}

}
