@interface BuddyRestoreRenewController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)forceReauthentication;
- (BYAnalyticsManager)analyticsManager;
- (BYPasscodeCacheManager)passcodeCacheManager;
- (BYRunState)runState;
- (BuddyAppleIDController)appleIDController;
- (ProximitySetupController)proximitySetupController;
- (UINavigationController)navigationController;
- (UIViewController)signInController;
- (id)viewController;
- (void)appleIDControllerFinished:(id)a3;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setAppleIDController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForceReauthentication:(BOOL)a3;
- (void)setNavigationController:(id)a3;
- (void)setPasscodeCacheManager:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setRunState:(id)a3;
- (void)setSignInController:(id)a3;
@end

@implementation BuddyRestoreRenewController

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0]) {
    (*((void (**)(id, unint64_t))location[0] + 2))(location[0], [(BuddyRestoreRenewController *)v4 forceReauthentication]);
  }
  objc_storeStrong(location, 0);
}

- (id)viewController
{
  v29 = self;
  v28[1] = (id)a2;
  v2 = [(BuddyRestoreRenewController *)self signInController];

  if (v2)
  {
    v30 = [(BuddyRestoreRenewController *)v29 signInController];
  }
  else
  {
    v28[0] = (id)objc_opt_new();
    id location = [v28[0] aa_primaryAppleAccount];
    if (location)
    {
      v5 = [BuddyAppleIDController alloc];
      v6 = [(BuddyRestoreRenewController *)v29 passcodeCacheManager];
      v7 = [(BuddyRestoreRenewController *)v29 analyticsManager];
      v8 = [(BuddyRestoreRenewController *)v29 runState];
      id v9 = +[BuddyFeatureFlags currentFlags];
      v10 = [(BuddyAppleIDController *)v5 initWithAccount:location passcodeCacheManager:v6 analyticsManager:v7 runState:v8 featureFlags:v9];
      [(BuddyRestoreRenewController *)v29 setAppleIDController:v10];

      v11 = [(BuddyRestoreRenewController *)v29 appleIDController];
      [(BuddyAppleIDController *)v11 setDelegate:v29];

      v12 = [(BuddyRestoreRenewController *)v29 delegate];
      v13 = [(BuddyRestoreRenewController *)v29 appleIDController];
      [(BuddyAppleIDController *)v13 setFlowItemDelegate:v12];

      v14 = [(BuddyRestoreRenewController *)v29 navigationController];
      v15 = [(BuddyRestoreRenewController *)v29 appleIDController];
      [(BuddyAppleIDController *)v15 setNavigationController:v14];

      v16 = [(BuddyRestoreRenewController *)v29 proximitySetupController];
      LOBYTE(v15) = [(ProximitySetupController *)v16 hasConnection];
      v17 = [(BuddyRestoreRenewController *)v29 appleIDController];
      [(BuddyAppleIDController *)v17 setHasProximityConnection:v15 & 1];

      v18 = [(BuddyRestoreRenewController *)v29 appleIDController];
      id v19 = [location username];
      [(BuddyAppleIDController *)v18 setExistingAccountUsername:v19 accountType:1];

      v20 = [(BuddyRestoreRenewController *)v29 appleIDController];
      id v21 = [(BuddyAppleIDController *)v20 upgradeAccountForRestoreAfterSoftwareUpdateSignInViewController];
      [(BuddyRestoreRenewController *)v29 setSignInController:v21];

      v30 = [(BuddyRestoreRenewController *)v29 signInController];
    }
    else
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v3 = oslog;
        os_log_type_t v4 = v25;
        sub_10004B24C(buf);
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "No primary account to use for post-software-update restore!", buf, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v30 = 0;
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(v28, 0);
  }
  v22 = v30;

  return v22;
}

- (void)appleIDControllerFinished:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (BuddyAppleIDController *)location[0];
  os_log_type_t v4 = [(BuddyRestoreRenewController *)v7 appleIDController];

  if (v3 == v4)
  {
    v5 = [(BuddyRestoreRenewController *)v7 delegate];
    [(BFFFlowItemDelegate *)v5 flowItemDone:v7];
  }
  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)forceReauthentication
{
  return self->_forceReauthentication;
}

- (void)setForceReauthentication:(BOOL)a3
{
  self->_forceReauthentication = a3;
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNavigationController:(id)a3
{
}

- (BuddyAppleIDController)appleIDController
{
  return (BuddyAppleIDController *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAppleIDController:(id)a3
{
}

- (UIViewController)signInController
{
  return (UIViewController *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSignInController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end