@interface AppInstallsDatabaseChangeset
- (AppInstallsDatabaseChangeset)init;
@end

@implementation AppInstallsDatabaseChangeset

- (AppInstallsDatabaseChangeset)init
{
  v3.receiver = self;
  v3.super_class = (Class)AppInstallsDatabaseChangeset;
  return [(AppInstallsDatabaseChangeset *)&v3 init];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoresToPrioritize, 0);
  objc_storeStrong((id *)&self->_restoresToHydrate, 0);
  objc_storeStrong((id *)&self->_metricsToPost, 0);
  objc_storeStrong((id *)&self->_legacyNotifications, 0);
  objc_storeStrong((id *)&self->_ledgerEvents, 0);
  objc_storeStrong((id *)&self->_installationEvents, 0);
  objc_storeStrong((id *)&self->_finishProgress, 0);
  objc_storeStrong((id *)&self->_failedTestFlightInstalls, 0);
  objc_storeStrong((id *)&self->_coordinatorResume, 0);
  objc_storeStrong((id *)&self->_coordinatorReasons, 0);
  objc_storeStrong((id *)&self->_coordinatorPause, 0);
  objc_storeStrong((id *)&self->_cancelProgress, 0);
  objc_storeStrong((id *)&self->_asyncTasks, 0);
  objc_storeStrong((id *)&self->_appUpdatesPackageType, 0);
  objc_storeStrong((id *)&self->_appUpdatesToFinish, 0);
}

@end