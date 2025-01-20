@interface BuddyProximityAppleIDSignInTask
- (BOOL)enableFindMy;
- (BOOL)ignoreLockAssertErrors;
- (BOOL)makeStoreServiceActive;
- (BOOL)restoreFromBackupMode;
- (BYAnalyticsManager)analyticsManager;
- (BYPasscodeCacheManager)cacheManager;
- (BuddyAppleIDSignInTask)signInTask;
- (BuddyFeatureFlags)featureFlags;
- (BuddyProximityAppleIDSignInTask)init;
- (BuddyProximityAppleIDSignInTask)initWithSession:(id)a3 analyticsManager:(id)a4 featureFlags:(id)a5;
- (CUMessageSession)messageSession;
- (SASProximitySession)proximitySession;
- (UINavigationController)navigationController;
- (void)_authenticateWithUsername:(id)a3 companionDevice:(id)a4 anisetteDataProvider:(id)a5 completion:(id)a6;
- (void)_createAccountWithCompletion:(id)a3;
- (void)_saveAccount:(id)a3 completion:(id)a4;
- (void)authenticateThenSignInWithCompletion:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setCacheManager:(id)a3;
- (void)setEnableFindMy:(BOOL)a3;
- (void)setIgnoreLockAssertErrors:(BOOL)a3;
- (void)setMakeStoreServiceActive:(BOOL)a3;
- (void)setMessageSession:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setProximitySession:(id)a3;
- (void)setRestoreFromBackupMode:(BOOL)a3;
- (void)setSignInTask:(id)a3;
@end

@implementation BuddyProximityAppleIDSignInTask

- (BuddyProximityAppleIDSignInTask)init
{
  SEL v5 = a2;
  id location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyProximityAppleIDSignInTask;
  id location = [(BuddyProximityAppleIDSignInTask *)&v4 init];
  objc_storeStrong(&location, location);
  if (location) {
    *((unsigned char *)location + 11) = 1;
  }
  v2 = (BuddyProximityAppleIDSignInTask *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (BuddyProximityAppleIDSignInTask)initWithSession:(id)a3 analyticsManager:(id)a4 featureFlags:(id)a5
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id obj = 0;
  objc_storeStrong(&obj, a4);
  id v10 = 0;
  objc_storeStrong(&v10, a5);
  id v7 = v13;
  id v13 = 0;
  id v13 = [v7 init];
  objc_storeStrong(&v13, v13);
  if (v13)
  {
    objc_storeStrong((id *)v13 + 6, location[0]);
    objc_storeStrong((id *)v13 + 8, obj);
    objc_storeStrong((id *)v13 + 4, v10);
  }
  v8 = (BuddyProximityAppleIDSignInTask *)v13;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v13, 0);
  return v8;
}

- (void)authenticateThenSignInWithCompletion:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = oslog;
    os_log_type_t v4 = v14;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Beginning proximity sign in...", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  SEL v5 = v17;
  v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_10016BBF0;
  id v10 = &unk_1002B3D68;
  id v12 = location[0];
  v11 = v17;
  [(BuddyProximityAppleIDSignInTask *)v5 _createAccountWithCompletion:&v6];
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)_createAccountWithCompletion:(id)a3
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = objc_alloc_init((Class)SASProximityCompanionAuthRequestAction);
  v3 = [(BuddyProximityAppleIDSignInTask *)v25 proximitySession];
  id v22 = [(SASProximitySession *)v3 sendAction:v23];

  if (v22)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      char v18 = 0;
      char v16 = 0;
      if (_BYIsInternalInstall())
      {
        os_log_type_t v4 = (NSString *)v22;
      }
      else
      {
        id v19 = [v22 domain];
        char v18 = 1;
        os_log_type_t v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v19, [v22 code]);
        id v17 = v4;
        char v16 = 1;
      }
      sub_10004BB7C((uint64_t)buf, (uint64_t)v4);
      _os_log_impl((void *)&_mh_execute_header, oslog, v20, "Failed to get data for companion auth: %{public}@", buf, 0xCu);
      if (v16) {

      }
      if (v18) {
    }
      }
    objc_storeStrong((id *)&oslog, 0);
    (*((void (**)(id, void, void, id))location[0] + 2))(location[0], 0, 0, v22);
    int v15 = 1;
  }
  else
  {
    id v14 = [v23 account];
    SEL v5 = v25;
    v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    v9 = sub_10016CBA8;
    id v10 = &unk_1002B3D90;
    id v13 = location[0];
    id v11 = v14;
    id v12 = v23;
    [(BuddyProximityAppleIDSignInTask *)v5 _saveAccount:v14 completion:&v6];
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
    int v15 = 0;
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

- (void)_authenticateWithUsername:(id)a3 companionDevice:(id)a4 anisetteDataProvider:(id)a5 completion:(id)a6
{
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = 0;
  objc_storeStrong(&v25, a4);
  id v24 = 0;
  objc_storeStrong(&v24, a5);
  id v23 = 0;
  objc_storeStrong(&v23, a6);
  v9 = [(BuddyProximityAppleIDSignInTask *)v27 signInTask];
  id v10 = location[0];
  id v11 = v25;
  id v12 = v24;
  id v13 = _NSConcreteStackBlock;
  int v14 = -1073741824;
  int v15 = 0;
  char v16 = sub_10016CFB0;
  id v17 = &unk_1002B3DB8;
  char v18 = v27;
  id v19 = location[0];
  id v20 = v25;
  id v21 = v24;
  id v22 = v23;
  [(BuddyAppleIDSignInTask *)v9 authenticateWithUsername:v10 companionDevice:v11 anisetteDataProvider:v12 completion:&v13];

  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

- (void)_saveAccount:(id)a3 completion:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v5 = +[ACAccountStore defaultStore];
  id v6 = [location[0] accountType];
  id v7 = [v6 identifier];
  id v9 = [v5 accountTypeWithAccountTypeIdentifier:v7];

  [location[0] setAccountType:v9];
  [location[0] _setObjectID:0];
  [location[0] markAllPropertiesDirty];
  id v8 = +[ACAccountStore defaultStore];
  [v8 saveAccount:location[0] withCompletionHandler:v10];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (BOOL)ignoreLockAssertErrors
{
  return self->_ignoreLockAssertErrors;
}

- (void)setIgnoreLockAssertErrors:(BOOL)a3
{
  self->_ignoreLockAssertErrors = a3;
}

- (BOOL)makeStoreServiceActive
{
  return self->_makeStoreServiceActive;
}

- (void)setMakeStoreServiceActive:(BOOL)a3
{
  self->_makeStoreServiceActive = a3;
}

- (BOOL)enableFindMy
{
  return self->_enableFindMy;
}

- (void)setEnableFindMy:(BOOL)a3
{
  self->_enableFindMy = a3;
}

- (BOOL)restoreFromBackupMode
{
  return self->_restoreFromBackupMode;
}

- (void)setRestoreFromBackupMode:(BOOL)a3
{
  self->_restoreFromBackupMode = a3;
}

- (CUMessageSession)messageSession
{
  return self->_messageSession;
}

- (void)setMessageSession:(id)a3
{
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (BYPasscodeCacheManager)cacheManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cacheManager);

  return (BYPasscodeCacheManager *)WeakRetained;
}

- (void)setCacheManager:(id)a3
{
}

- (SASProximitySession)proximitySession
{
  return self->_proximitySession;
}

- (void)setProximitySession:(id)a3
{
}

- (BuddyAppleIDSignInTask)signInTask
{
  return self->_signInTask;
}

- (void)setSignInTask:(id)a3
{
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end