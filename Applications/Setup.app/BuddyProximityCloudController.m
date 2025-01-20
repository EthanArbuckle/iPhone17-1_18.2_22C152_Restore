@interface BuddyProximityCloudController
+ (id)cloudConfigSkipKey;
- (BOOL)hasInitiatedLogin;
- (BOOL)isEphemeral;
- (BOOL)shouldAllowStartOver;
- (BYAnalyticsManager)analyticsManager;
- (BYPasscodeCacheManager)passcodeCacheManager;
- (BuddyFeatureFlags)featureFlags;
- (BuddyMiscState)miscState;
- (BuddyProximityAppleIDSignInTask)signInTask;
- (BuddyProximityCloudController)init;
- (LockdownModeProvider)lockdownModeProvider;
- (ProximitySetupController)proximitySetupController;
- (void)_beginSignIn;
- (void)_signInCompleted:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setHasInitiatedLogin:(BOOL)a3;
- (void)setLockdownModeProvider:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setPasscodeCacheManager:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setSignInTask:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation BuddyProximityCloudController

- (BuddyProximityCloudController)init
{
  SEL v11 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"PROXIMITY_SETUP_SETTING_UP_APPLE_ID" value:&stru_1002B4E18 table:@"Localizable"];
  id location = 0;
  v10.receiver = self;
  v10.super_class = (Class)BuddyProximityCloudController;
  v5 = [(BuddyProximityCloudController *)&v10 initWithSpinnerText:v4];
  id location = v5;
  objc_storeStrong(&location, v5);

  if (v5)
  {
    id v6 = [location navigationItem];
    [v6 setTitle:&stru_1002B4E18];

    id v7 = [location navigationItem];
    [v7 setHidesBackButton:1 animated:0];
  }
  v8 = (BuddyProximityCloudController *)location;
  objc_storeStrong(&location, 0);
  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  v27 = self;
  SEL v26 = a2;
  BOOL v25 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BuddyProximityCloudController;
  [(BuddyProximityCloudController *)&v24 viewDidAppear:a3];
  if (![(BuddyProximityCloudController *)v27 hasInitiatedLogin])
  {
    [(BuddyProximityCloudController *)v27 setHasInitiatedLogin:1];
    v3 = [(BuddyProximityCloudController *)v27 miscState];
    id v23 = [(BuddyMiscState *)v3 migrationManager];

    if ([v23 willMigrate])
    {
      id location = (id)_BYLoggingFacility();
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
      {
        v4 = location;
        os_log_type_t v5 = v21;
        sub_10004B24C(buf);
        _os_log_impl((void *)&_mh_execute_header, v4, v5, "Waiting for keychain transfer and import...", buf, 2u);
      }
      objc_storeStrong(&location, 0);
      id v6 = v23;
      v14 = _NSConcreteStackBlock;
      int v15 = -1073741824;
      int v16 = 0;
      v17 = sub_100123120;
      v18 = &unk_1002B0FF0;
      v19 = v27;
      [v6 waitForKeychain:&v14];
      objc_storeStrong((id *)&v19, 0);
    }
    else
    {
      id v7 = dispatch_get_global_queue(0, 0);
      v8 = _NSConcreteStackBlock;
      int v9 = -1073741824;
      int v10 = 0;
      SEL v11 = sub_1001231E4;
      v12 = &unk_1002B0D20;
      v13 = v27;
      dispatch_async(v7, &v8);

      objc_storeStrong((id *)&v13, 0);
    }
    objc_storeStrong(&v23, 0);
  }
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (BOOL)isEphemeral
{
  return 0;
}

- (void)_beginSignIn
{
  id v24 = self;
  oslog[1] = (os_log_t)a2;
  v2 = [(BuddyProximityCloudController *)self proximitySetupController];
  id v3 = [(ProximitySetupController *)v2 createSignInTask];
  [v24 setSignInTask:v3];

  id v4 = [v24 navigationController];
  id v5 = [v24 signInTask];
  [v5 setNavigationController:v4];

  id v6 = [v24 miscState];
  id v7 = [v6 migrationManager];
  unsigned __int8 v8 = [v7 isMigrating];
  id v9 = [v24 signInTask];
  [v9 setIgnoreLockAssertErrors:v8 & 1];

  id v10 = [v24 featureFlags];
  LOBYTE(v7) = [v10 isUseCDPContextSecretInsteadOfSBDSecretEnabled];

  if (v7)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v24 passcodeCacheManager];
      id v12 = [v24 signInTask];
      sub_1000E4F20((uint64_t)buf, (uint64_t)"-[BuddyProximityCloudController _beginSignIn]", (uint64_t)v11, (uint64_t)v12);
      _os_log_impl((void *)&_mh_execute_header, oslog[0], v22, "%s: Setting cache manager %@ on sign in task %@", buf, 0x20u);
    }
    objc_storeStrong((id *)oslog, 0);
    id v13 = [v24 passcodeCacheManager];
    id v14 = [v24 signInTask];
    [v14 setCacheManager:v13];
  }
  id v15 = [v24 signInTask];
  int v16 = _NSConcreteStackBlock;
  int v17 = -1073741824;
  int v18 = 0;
  v19 = sub_100123570;
  v20 = &unk_1002B0FF0;
  id v21 = v24;
  [v15 authenticateThenSignInWithCompletion:&v16];

  objc_storeStrong(&v21, 0);
}

- (void)_signInCompleted:(id)a3
{
  id v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v3 = dispatch_get_global_queue(0, 0);
    block = _NSConcreteStackBlock;
    int v21 = -1073741824;
    int v22 = 0;
    id v23 = sub_100123974;
    id v24 = &unk_1002B0D20;
    id v25 = v27;
    dispatch_async(v3, &block);

    objc_storeStrong(&v25, 0);
  }
  else
  {
    id v4 = [v27 lockdownModeProvider];
    [v4 fetchAccountStateWithCompletionHandler:&stru_1002B3570];

    id v5 = [v27 proximitySetupController];
    [v5 setSignedIniCloudAccount:1];
  }
  id v6 = [v27 analyticsManager];
  v28[0] = @"success";
  id v7 = +[NSNumber numberWithInt:location[0] == 0];
  v29[0] = v7;
  v28[1] = @"error";
  id v8 = [location[0] domain];
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (%ld)", v8, [location[0] code]);
  v29[1] = v9;
  v28[2] = @"connected";
  id v10 = [v27 proximitySetupController];
  id v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)[v10 hasConnection] & 1);
  v29[2] = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
  [v6 addEvent:@"com.apple.setupassistant.ios.proximity.proximity.appleid" withPayload:v12 persist:1];

  id v13 = &_dispatch_main_q;
  id v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  int v17 = sub_1001239D8;
  int v18 = &unk_1002B0D20;
  id v19 = v27;
  dispatch_async((dispatch_queue_t)v13, &v14);

  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (LockdownModeProvider)lockdownModeProvider
{
  return self->_lockdownModeProvider;
}

- (void)setLockdownModeProvider:(id)a3
{
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
}

- (BOOL)hasInitiatedLogin
{
  return self->_hasInitiatedLogin;
}

- (void)setHasInitiatedLogin:(BOOL)a3
{
  self->_hasInitiatedLogin = a3;
}

- (BuddyProximityAppleIDSignInTask)signInTask
{
  return self->_signInTask;
}

- (void)setSignInTask:(id)a3
{
}

- (void).cxx_destruct
{
}

@end