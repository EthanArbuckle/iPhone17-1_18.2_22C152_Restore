@interface BuddyAppleIDHostController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)_forceInteractiveAuthFromPreTigrisUpgrade;
- (BOOL)controllerAllowsNavigatingBack;
- (BOOL)ranSilentUpdateProperties;
- (BOOL)responsibleForViewController:(id)a3;
- (BOOL)shouldAllowStartOver;
- (BYAnalyticsManager)analyticsManager;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (BYPasscodeCacheManager)passcodeCacheManager;
- (BYPreferencesController)buddyPreferences;
- (BYRunState)runState;
- (BuddyAppleIDHostController)initWithAccount:(id)a3;
- (BuddyAppleIDHostController)initWithAccount:(id)a3 mode:(unint64_t)a4;
- (BuddyMiscState)miscState;
- (LockdownModeProvider)lockdownModeProvider;
- (ProximitySetupController)proximitySetupController;
- (id)viewController;
- (void)appleIDControllerFinished:(id)a3;
- (void)appleIDControllerWantsChoiceController:(id)a3;
- (void)controllerWasPopped;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExistingAccountUsername:(id)a3 accountType:(unint64_t)a4;
- (void)setLockdownModeProvider:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)setPasscodeCacheManager:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setRanSilentUpdateProperties:(BOOL)a3;
- (void)setRunState:(id)a3;
@end

@implementation BuddyAppleIDHostController

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupAppleID;
}

+ (unint64_t)applicableDispositions
{
  return 4;
}

- (BuddyAppleIDHostController)initWithAccount:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v7;
  id v7 = 0;
  id v7 = [v3 initWithAccount:location[0] mode:0];
  v4 = (BuddyAppleIDHostController *)v7;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v7, 0);
  return v4;
}

- (BuddyAppleIDHostController)initWithAccount:(id)a3 mode:(unint64_t)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v11 = a4;
  id v5 = v13;
  id v13 = 0;
  v10.receiver = v5;
  v10.super_class = (Class)BuddyAppleIDHostController;
  id v13 = [(BuddyAppleIDHostController *)&v10 init];
  objc_storeStrong(&v13, v13);
  if (v13)
  {
    *((void *)v13 + 2) = v11;
    objc_storeStrong((id *)v13 + 6, location[0]);
    id v6 = [location[0] accountStore];
    id v7 = (void *)*((void *)v13 + 5);
    *((void *)v13 + 5) = v6;
  }
  v8 = (BuddyAppleIDHostController *)v13;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v13, 0);
  return v8;
}

- (void)setNavigationController:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyAppleIDController *)v4->_appleIDController setNavigationController:location[0]];
  objc_storeStrong(location, 0);
}

- (void)setDelegate:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v4->_delegate, location[0]);
  [(BuddyAppleIDController *)v4->_appleIDController setFlowItemDelegate:location[0]];
  objc_storeStrong(location, 0);
}

- (BOOL)controllerAllowsNavigatingBack
{
  return self->_allowBack;
}

- (BOOL)shouldAllowStartOver
{
  return [(BuddyAppleIDController *)self->_appleIDController shouldAllowStartOver];
}

- (BOOL)_forceInteractiveAuthFromPreTigrisUpgrade
{
  char HasCompletedInitialRun = BYSetupAssistantHasCompletedInitialRun();
  char v6 = 0;
  BOOL v3 = 0;
  if (HasCompletedInitialRun)
  {
    id v7 = +[NSUserDefaults standardUserDefaults];
    char v6 = 1;
    NSInteger v4 = [(NSUserDefaults *)v7 integerForKey:BYBuddyIOSVersionKey];
    BOOL v3 = v4 < BYTigrisVersion;
  }
  BOOL v8 = v3;
  if (v6) {

  }
  return v8;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v81 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyAppleIDHostController *)v81 setRanSilentUpdateProperties:0];
  BOOL v3 = [BuddyAppleIDController alloc];
  account = v81->_account;
  id v5 = [(BuddyAppleIDHostController *)v81 passcodeCacheManager];
  char v6 = [(BuddyAppleIDHostController *)v81 analyticsManager];
  id v7 = [(BuddyAppleIDHostController *)v81 runState];
  id v8 = +[BuddyFeatureFlags currentFlags];
  v9 = [(BuddyAppleIDController *)v3 initWithAccount:account passcodeCacheManager:v5 analyticsManager:v6 runState:v7 featureFlags:v8];
  appleIDController = v81->_appleIDController;
  v81->_appleIDController = v9;

  [(BuddyAppleIDController *)v81->_appleIDController setDelegate:v81];
  unint64_t v11 = [(BuddyAppleIDHostController *)v81 delegate];
  [(BuddyAppleIDController *)v81->_appleIDController setFlowItemDelegate:v11];

  v12 = [(BuddyAppleIDHostController *)v81 proximitySetupController];
  unsigned __int8 v13 = [(ProximitySetupController *)v12 hasConnection];
  [(BuddyAppleIDController *)v81->_appleIDController setHasProximityConnection:v13 & 1];

  v14 = [(BuddyAppleIDHostController *)v81 lockdownModeProvider];
  [(BuddyAppleIDController *)v81->_appleIDController setLockdownModeProvider:v14];

  BOOL v79 = 0;
  id v15 = [(ACAccount *)v81->_account aa_authToken];
  char v77 = 0;
  BOOL v16 = 1;
  if (!v15)
  {
    id v78 = [(ACAccount *)v81->_account aa_password];
    char v77 = 1;
    BOOL v16 = v78 != 0;
  }
  if (v77) {

  }
  BOOL v79 = v16;
  id v17 = +[BYAppleIDAccountsManager sharedManager];
  id v76 = [v17 storedLoginContext];

  BOOL v75 = 0;
  id v18 = [v76 appleID];
  char v73 = 0;
  char v71 = 0;
  BOOL v19 = 0;
  if (v18)
  {
    id v74 = [v76 rawPassword];
    char v73 = 1;
    BOOL v19 = 1;
    if (!v74)
    {
      id v72 = [v76 continuationKey];
      char v71 = 1;
      BOOL v19 = v72 != 0;
    }
  }
  if (v71) {

  }
  if (v73) {
  BOOL v75 = v19;
  }
  if (v81->_account)
  {
    v20 = v81->_appleIDController;
    v21 = [(ACAccount *)v81->_account username];
    [(BuddyAppleIDController *)v20 setExistingAccountUsername:v21 accountType:1];
  }
  if (v81->_mode == 1 || !v75)
  {
    if ([(BuddyAppleIDHostController *)v81 _forceInteractiveAuthFromPreTigrisUpgrade])
    {
      os_log_t v67 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v66 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        v24 = v67;
        os_log_type_t v25 = v66;
        sub_10004B24C(v65);
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "AppleIDHost: Forcing interactive Apple ID upgrade auth", v65, 2u);
      }
      objc_storeStrong((id *)&v67, 0);
      (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
    }
    else
    {
      id v26 = +[BYSetupStateManager sharedManager];
      id v27 = [v26 restoreType];

      if (v27 == (id)1)
      {
        os_log_t v64 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v63 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          v28 = v64;
          os_log_type_t v29 = v63;
          sub_10004B24C(v62);
          _os_log_impl((void *)&_mh_execute_header, v28, v29, "AppleIDHost: Running post-iTunes-Restore interactive Apple ID renew", v62, 2u);
        }
        objc_storeStrong((id *)&v64, 0);
        (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
      }
      else
      {
        v30 = [(BuddyAppleIDHostController *)v81 miscState];
        unsigned __int8 v31 = [(BuddyMiscState *)v30 forcePrimaryAppleIDAuthentication];

        if (v31)
        {
          os_log_t v61 = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v60 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            v32 = v61;
            os_log_type_t v33 = v60;
            sub_10004B24C(v59);
            _os_log_impl((void *)&_mh_execute_header, v32, v33, "AppleIDHost: Running forced interactive Apple ID renew", v59, 2u);
          }
          objc_storeStrong((id *)&v61, 0);
          (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
        }
        else if (v81->_mode == 2)
        {
          os_log_t v58 = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v57 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            v34 = v58;
            os_log_type_t v35 = v57;
            sub_10004B24C(v56);
            _os_log_impl((void *)&_mh_execute_header, v34, v35, "AppleIDHost: Running Apple ID security upgrade", v56, 2u);
          }
          objc_storeStrong((id *)&v58, 0);
          (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
        }
        else if (v81->_mode == 1 || !v79)
        {
          if (v81->_mode == 1)
          {
            v40 = [(BuddyAppleIDHostController *)v81 miscState];
            id v43 = [(BuddyMiscState *)v40 iCloudAppleIdFromActivation];

            if (!v43)
            {
              v41 = [(BuddyAppleIDHostController *)v81 proximitySetupController];
              v42 = [(ProximitySetupController *)v41 information];
              id v43 = [(SASProximityInformation *)v42 appleID];
            }
            -[BuddyAppleIDController setExistingAccountUsername:accountType:](v81->_appleIDController, "setExistingAccountUsername:accountType:", v43, 1, v43);
            (*((void (**)(id, BOOL))location[0] + 2))(location[0], v81->_account == 0);
            objc_storeStrong(&v43, 0);
          }
          else
          {
            (*((void (**)(id, BOOL))location[0] + 2))(location[0], v81->_account == 0);
          }
        }
        else
        {
          id v55 = objc_alloc_init((Class)ACAccountStore);
          os_log_t v54 = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v53 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            v36 = v54;
            os_log_type_t v37 = v53;
            sub_10004B24C(v52);
            _os_log_impl((void *)&_mh_execute_header, v36, v37, "AppleIDHost: Attempting silent -upgradeProperties...", v52, 2u);
          }
          objc_storeStrong((id *)&v54, 0);
          id v38 = v55;
          v39 = v81->_account;
          v44 = _NSConcreteStackBlock;
          int v45 = -1073741824;
          int v46 = 0;
          v47 = sub_1001BD35C;
          v48 = &unk_1002B3D18;
          id v49 = v55;
          v50 = v81;
          id v51 = location[0];
          [v38 aa_updatePropertiesForAppleAccount:v39 completion:&v44];
          objc_storeStrong(&v51, 0);
          objc_storeStrong((id *)&v50, 0);
          objc_storeStrong(&v49, 0);
          objc_storeStrong(&v55, 0);
        }
      }
    }
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v69 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v22 = oslog;
      os_log_type_t v23 = v69;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "AppleIDHost: Transient storage has credentials", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
  }
  objc_storeStrong(&v76, 0);
  objc_storeStrong(location, 0);
}

- (id)viewController
{
  v22 = self;
  location[1] = (id)a2;
  if (!self->_viewController)
  {
    if (v22->_mode == 1)
    {
      v2 = (UIViewController *)[(BuddyAppleIDController *)v22->_appleIDController signInViewControllerForRestore];
      viewController = v22->_viewController;
      v22->_viewController = v2;

      v22->_allowBack = 1;
    }
    else if (v22->_account)
    {
      if (v22->_mode == 2)
      {
        NSInteger v4 = (UIViewController *)[(BuddyAppleIDController *)v22->_appleIDController securityUpgradeAccountSignInViewController];
        id v5 = v22->_viewController;
        v22->_viewController = v4;

        v22->_allowBack = 1;
      }
      else
      {
        id v6 = +[BYAppleIDAccountsManager sharedManager];
        location[0] = [v6 storedLoginContext];

        id v7 = [location[0] appleID];
        char v19 = 0;
        char v17 = 0;
        BOOL v8 = 0;
        if (v7)
        {
          id v20 = [location[0] rawPassword];
          char v19 = 1;
          BOOL v8 = 1;
          if (!v20)
          {
            id v18 = [location[0] continuationKey];
            char v17 = 1;
            BOOL v8 = v18 != 0;
          }
        }
        if (v17) {

        }
        if (v19) {
        if (v8)
        }
        {
          v9 = (UIViewController *)[(BuddyAppleIDController *)v22->_appleIDController silentUpgradeViewControllerWithLoginContext:location[0]];
          objc_super v10 = v22->_viewController;
          v22->_viewController = v9;

          v22->_allowBack = 0;
        }
        else
        {
          unint64_t v11 = (UIViewController *)[(BuddyAppleIDController *)v22->_appleIDController upgradeAccountSignInViewController];
          v12 = v22->_viewController;
          v22->_viewController = v11;

          v22->_allowBack = 1;
        }
        objc_storeStrong(location, 0);
      }
    }
    else
    {
      unsigned __int8 v13 = (UIViewController *)[(BuddyAppleIDController *)v22->_appleIDController signInViewController];
      v14 = v22->_viewController;
      v22->_viewController = v13;
    }
  }
  id v15 = v22->_viewController;

  return v15;
}

- (BOOL)responsibleForViewController:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = [(BuddyAppleIDController *)v6->_appleIDController responsibleForViewController:location[0]];
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (void)setExistingAccountUsername:(id)a3 accountType:(unint64_t)a4
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyAppleIDController setExistingAccountUsername:accountType:](v6->_appleIDController, "setExistingAccountUsername:accountType:", location[0], a4, a4);
  objc_storeStrong(location, 0);
}

- (void)controllerWasPopped
{
  v2 = [(BuddyAppleIDHostController *)self buddyPreferences];
  [(BYPreferencesController *)v2 setObject:&__kCFBooleanFalse forKey:@"AppleIDPB10Presented"];
}

- (void)appleIDControllerWantsChoiceController:(id)a3
{
  unint64_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11->_allowBack = 1;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v3 = oslog;
    os_log_type_t v4 = v8;
    sub_10004B24C(v7);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "BuddyAppleIDHostController wants choice controller", (uint8_t *)v7, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v5 = [(BuddyAppleIDHostController *)v11 buddyPreferences];
  [(BYPreferencesController *)v5 setObject:&__kCFBooleanTrue forKey:@"AppleIDPB10Presented"];

  id WeakRetained = objc_loadWeakRetained((id *)&v11->_delegate);
  [WeakRetained flowItemDone:v11 nextItemClass:objc_opt_class()];

  objc_storeStrong(location, 0);
}

- (void)appleIDControllerFinished:(id)a3
{
  unsigned __int8 v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v31->_mode == 1)
  {
    v31->_allowBack = 1;
    id v29 = objc_alloc_init((Class)ACAccountStore);
    id v28 = [v29 aa_primaryAppleAccount];
    if (v28)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v31->_delegate);
      [WeakRetained flowItemDone:v31];
    }
    else
    {
      unsigned __int8 v3 = +[NSBundle mainBundle];
      os_log_type_t v4 = [(NSBundle *)v3 localizedStringForKey:@"CANT_LOGIN_APPLEID_GENERIC_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
      id v5 = +[NSBundle mainBundle];
      id v6 = [(NSBundle *)v5 localizedStringForKey:@"CANT_LOGIN_APPLEID_UNKNOWN_ERROR" value:&stru_1002B4E18 table:@"Localizable"];
      id v27 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

      id v7 = v27;
      os_log_type_t v8 = +[NSBundle mainBundle];
      v9 = [(NSBundle *)v8 localizedStringForKey:@"OK" value:&stru_1002B4E18 table:@"Localizable"];
      v21 = _NSConcreteStackBlock;
      int v22 = -1073741824;
      int v23 = 0;
      v24 = sub_1001BE0E0;
      os_log_type_t v25 = &unk_1002B1040;
      id v26 = v31;
      objc_super v10 = +[UIAlertAction actionWithTitle:v9 style:0 handler:&v21];
      [v7 addAction:v10];

      [(UIViewController *)v31->_viewController presentViewController:v27 animated:1 completion:0];
      objc_storeStrong((id *)&v26, 0);
      objc_storeStrong(&v27, 0);
    }
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
  }
  else
  {
    v31->_allowBack = 0;
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = oslog;
      os_log_type_t v13 = v19;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "BuddyAppleIDHostController finished!", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v14 = [(BuddyAppleIDHostController *)v31 buddyPreferences];
    [(BYPreferencesController *)v14 setObject:&__kCFBooleanTrue forKey:@"AppleIDPB10Presented"];

    id v17 = +[NSNumber numberWithInt:v31->_mode == 2];
    id v15 = [(BuddyAppleIDHostController *)v31 paneFeatureAnalyticsManager];
    [(BYPaneFeatureAnalyticsManager *)v15 recordActionWithValue:&__kCFBooleanTrue previousValue:v17 forFeature:14];

    id v16 = objc_loadWeakRetained((id *)&v31->_delegate);
    [v16 flowItemDone:v31];

    objc_storeStrong(&v17, 0);
  }
  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BOOL)ranSilentUpdateProperties
{
  return self->_ranSilentUpdateProperties;
}

- (void)setRanSilentUpdateProperties:(BOOL)a3
{
  self->_ranSilentUpdateProperties = a3;
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
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

- (LockdownModeProvider)lockdownModeProvider
{
  return self->_lockdownModeProvider;
}

- (void)setLockdownModeProvider:(id)a3
{
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end