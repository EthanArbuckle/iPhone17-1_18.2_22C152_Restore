@interface BuddyAppleIDAuthManager
+ (id)_contextForPrimaryAccount;
+ (id)_contextForPrimaryAccountSilentAuth;
+ (id)_contextFromAuthenticationResults:(id)a3 requiresAppleMAID:(BOOL)a4;
+ (id)managerWithNavigationController:(id)a3 passcodeCacheManager:(id)a4;
+ (void)_authWithContext:(id)a3 completion:(id)a4;
+ (void)silentAuthenticationForPrimaryAccountWithCompletion:(id)a3;
+ (void)silentAuthenticationWithAuthenticationResults:(id)a3 requiresAppleMAID:(BOOL)a4 completion:(id)a5;
- (ACAccount)accountToUpgrade;
- (BOOL)firstTimeLogin;
- (BOOL)hasContinuationKey;
- (BOOL)shouldOfferSecurityUpgrade;
- (BYPasscodeCacheManager)passcodeCacheManager;
- (BuddyAppleIDAuthManager)initWithNavigationController:(id)a3 passcodeCacheManager:(id)a4;
- (NSString)passwordForCreating;
- (NSString)usernameForCreating;
- (id)authContext;
- (int64_t)serviceType;
- (void)_authenticateWithSignInController:(id)a3 completion:(id)a4;
- (void)authenticateWithSignInController:(id)a3 username:(id)a4 password:(id)a5 altDSID:(id)a6 completion:(id)a7;
- (void)authenticateWithSignInController:(id)a3 username:(id)a4 password:(id)a5 completion:(id)a6;
- (void)fetchAuthModeForUsername:(id)a3 requiresAppleMAID:(BOOL)a4 completion:(id)a5;
- (void)setAccountToUpgrade:(id)a3;
- (void)setFirstTimeLogin:(BOOL)a3;
- (void)setHasContinuationKey:(BOOL)a3;
- (void)setPasscodeCacheManager:(id)a3;
- (void)setServiceType:(int64_t)a3;
- (void)setShouldOfferSecurityUpgrade:(BOOL)a3;
@end

@implementation BuddyAppleIDAuthManager

+ (id)managerWithNavigationController:(id)a3 passcodeCacheManager:(id)a4
{
  Class v13 = (Class)a1;
  SEL v12 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  if (!location)
  {
    v5 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v5 handleFailureInMethod:v12, v13, @"BuddyAppleIDAuthManager.m", 50, @"Invalid parameter not satisfying: %@", @"navigationController != nil" object file lineNumber description];
  }
  id v6 = [v13 alloc];
  id v9 = [v6 initWithNavigationController:location passcodeCacheManager:v10];
  id v7 = v9;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&location, 0);
  return v7;
}

- (BuddyAppleIDAuthManager)initWithNavigationController:(id)a3 passcodeCacheManager:(id)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id obj = 0;
  objc_storeStrong(&obj, a4);
  id v5 = v11;
  id v11 = 0;
  v8.receiver = v5;
  v8.super_class = (Class)BuddyAppleIDAuthManager;
  id v11 = [(BuddyAppleIDAuthManager *)&v8 init];
  objc_storeStrong(&v11, v11);
  if (v11)
  {
    objc_storeWeak((id *)v11 + 2, location[0]);
    objc_storeStrong((id *)v11 + 7, obj);
  }
  id v6 = (BuddyAppleIDAuthManager *)v11;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v11, 0);
  return v6;
}

+ (void)silentAuthenticationForPrimaryAccountWithCompletion:(id)a3
{
  id v6 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(id)objc_opt_class() _contextForPrimaryAccountSilentAuth];
  [v6 _authWithContext:v3 completion:location[0], v3];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

+ (void)silentAuthenticationWithAuthenticationResults:(id)a3 requiresAppleMAID:(BOOL)a4 completion:(id)a5
{
  id v12 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v10 = a4;
  id v9 = 0;
  objc_storeStrong(&v9, a5);
  id v7 = [(id)objc_opt_class() _contextFromAuthenticationResults:location[0] requiresAppleMAID:v10];
  [v12 _authWithContext:v7 completion:v9, v7];
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

+ (void)_authWithContext:(id)a3 completion:(id)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  id v5 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  [v5 authenticateWithContext:location[0] completion:v6];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

+ (id)_contextForPrimaryAccountSilentAuth
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = [a1 _contextForPrimaryAccount];
  [location[0] setShouldPreventInteractiveAuth:1];
  [location[0] setIsUsernameEditable:0];
  id v2 = location[0];
  objc_storeStrong(location, 0);
  return v2;
}

+ (id)_contextFromAuthenticationResults:(id)a3 requiresAppleMAID:(BOOL)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v11 = a4;
  id v10 = (id)objc_opt_new();
  id v5 = [location[0] objectForKeyedSubscript:AKAuthenticationUsernameKey];
  [v10 setUsername:v5];

  id v6 = [location[0] objectForKeyedSubscript:AKAuthenticationAlternateDSIDKey];
  [v10 setAltDSID:v6];

  [v10 setAuthenticationType:1];
  [v10 setIsUsernameEditable:0];
  id v7 = [location[0] objectForKeyedSubscript:AKAuthenticationIdentityTokenKey];
  [v10 _setIdentityToken:v7];

  if (v11
    && (+[DMCFeatureOverrides allowAnyMAIDToSignIn] & 1) == 0)
  {
    [v10 setAppProvidedContext:kAppleMAIDSignInProvidedContext];
  }
  id v8 = v10;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v8;
}

+ (id)_contextForPrimaryAccount
{
  v8[2] = a1;
  v8[1] = (id)a2;
  v8[0] = objc_alloc_init((Class)ACAccountStore);
  id v7 = [v8[0] aa_primaryAppleAccount];
  id location = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  id v2 = [v7 aa_altDSID];
  [location setAltDSID:v2];

  id v3 = [v7 username];
  [location setUsername:v3];

  id v4 = location;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(v8, 0);
  return v4;
}

- (NSString)usernameForCreating
{
  return (NSString *)[(AKAppleIDAuthenticationPurpleBuddyContext *)self->_authContext usernameForCreating];
}

- (NSString)passwordForCreating
{
  return (NSString *)[(AKAppleIDAuthenticationPurpleBuddyContext *)self->_authContext passwordForCreating];
}

- (id)authContext
{
  v15 = self;
  location[1] = (id)a2;
  if (!self->_authContext)
  {
    uint64_t v2 = objc_opt_new();
    authContext = v15->_authContext;
    v15->_authContext = (AKAppleIDAuthenticationPurpleBuddyContext *)v2;

    id v4 = v15->_authContext;
    id WeakRetained = objc_loadWeakRetained((id *)&v15->_nav);
    [(AKAppleIDAuthenticationPurpleBuddyContext *)v4 setPresentingViewController:WeakRetained];

    [(AKAppleIDAuthenticationPurpleBuddyContext *)v15->_authContext setShouldOfferSecurityUpgrade:v15->_shouldOfferSecurityUpgrade];
    [(AKAppleIDAuthenticationPurpleBuddyContext *)v15->_authContext setFirstTimeLogin:v15->_firstTimeLogin];
    if (v15->_serviceType) {
      uint64_t serviceType = v15->_serviceType;
    }
    else {
      uint64_t serviceType = 1;
    }
    [(AKAppleIDAuthenticationPurpleBuddyContext *)v15->_authContext setServiceType:serviceType];
    if ([(BuddyAppleIDAuthManager *)v15 hasContinuationKey])
    {
      [(AKAppleIDAuthenticationPurpleBuddyContext *)v15->_authContext setShouldForceInteractiveAuth:0];
      [(AKAppleIDAuthenticationPurpleBuddyContext *)v15->_authContext setShouldPreventInteractiveAuth:1];
      [(AKAppleIDAuthenticationPurpleBuddyContext *)v15->_authContext setIsUsernameEditable:0];
    }
    id v7 = [(AKAppleIDAuthenticationPurpleBuddyContext *)v15->_authContext httpHeadersForRemoteUI];
    id v8 = [v7 mutableCopy];
    id v9 = v8;
    char v12 = 0;
    if (!v8)
    {
      id v8 = (id)objc_opt_new();
      id v13 = v8;
      char v12 = 1;
    }
    location[0] = v8;
    if (v12) {

    }
    if (+[BYWarranty shouldDisplay]) {
      [location[0] setObject:@"true" forKey:@"X-MMe-Show-Warranty"];
    }
    [(AKAppleIDAuthenticationPurpleBuddyContext *)v15->_authContext setHttpHeadersForRemoteUI:location[0]];
    objc_storeStrong(location, 0);
  }
  id v10 = v15->_authContext;

  return v10;
}

- (void)_authenticateWithSignInController:(id)a3 completion:(id)a4
{
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  objc_storeWeak((id *)&v24->_signInController, location[0]);
  [location[0] setEnabled:0];
  id v21 = (id)objc_opt_new();
  id v5 = [(BuddyAppleIDAuthManager *)v24 authContext];
  [v5 setAnticipateEscrowAttempt:1];

  id v6 = [(BuddyAppleIDAuthManager *)v24 authContext];
  [v6 setShouldRequestConfigurationInfo:1];

  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = oslog;
    os_log_type_t v8 = v19;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Starting authenticateWithContext...", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v9 = v21;
  id v10 = [(BuddyAppleIDAuthManager *)v24 authContext];
  BOOL v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  v14 = sub_1000C0538;
  v15 = &unk_1002B2630;
  id v16 = location[0];
  id v17 = v22;
  [v9 authenticateWithContext:v10 completion:&v11];

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)authenticateWithSignInController:(id)a3 username:(id)a4 password:(id)a5 completion:(id)a6
{
  int v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v10 = 0;
  objc_storeStrong(&v10, a5);
  id v9 = 0;
  objc_storeStrong(&v9, a6);
  [(BuddyAppleIDAuthManager *)v13 authenticateWithSignInController:location[0] username:v11 password:v10 altDSID:0 completion:v9];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)authenticateWithSignInController:(id)a3 username:(id)a4 password:(id)a5 altDSID:(id)a6 completion:(id)a7
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
  id v22 = 0;
  objc_storeStrong(&v22, a7);
  objc_storeStrong((id *)&v27->_authContext, 0);
  id v11 = v25;
  int v12 = +[NSCharacterSet whitespaceCharacterSet];
  id v13 = [v11 stringByTrimmingCharactersInSet:v12];
  id v14 = v25;
  id v25 = v13;

  id v15 = [(BuddyAppleIDAuthManager *)v27 authContext];
  [v15 setUsername:v25];

  id v16 = [(BuddyAppleIDAuthManager *)v27 authContext];
  [v16 _setPassword:v24];

  if (v27->_accountToUpgrade)
  {
    authContext = v27->_authContext;
    id v18 = [(ACAccount *)v27->_accountToUpgrade aa_personID];
    [(AKAppleIDAuthenticationPurpleBuddyContext *)authContext setDSID:v18];

    os_log_type_t v19 = v27->_authContext;
    id v20 = [(ACAccount *)v27->_accountToUpgrade aa_altDSID];
    [(AKAppleIDAuthenticationPurpleBuddyContext *)v19 setAltDSID:v20];
  }
  else if (v23)
  {
    id v21 = [(BuddyAppleIDAuthManager *)v27 authContext];
    [v21 setAltDSID:v23];
  }
  [(BuddyAppleIDAuthManager *)v27 _authenticateWithSignInController:location[0] completion:v22];
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

- (void)fetchAuthModeForUsername:(id)a3 requiresAppleMAID:(BOOL)a4 completion:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v26 = a4;
  id v25 = 0;
  objc_storeStrong(&v25, a5);
  id v24 = (id)objc_opt_new();
  id v7 = location[0];
  os_log_type_t v8 = +[NSCharacterSet whitespaceCharacterSet];
  id v9 = [v7 stringByTrimmingCharactersInSet:v8];
  id v10 = location[0];
  location[0] = v9;

  [v24 setUsername:location[0]];
  if (v26) {
    [v24 setAppProvidedContext:kAppleMAIDSignInProvidedContext];
  }
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = oslog;
    os_log_type_t v12 = v22;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Fetching auth mode for account", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v20 = (id)objc_opt_new();
  id v13 = v24;
  id v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  id v17 = sub_1000C105C;
  id v18 = &unk_1002B2680;
  id v19 = v25;
  [v20 fetchAuthModeWithContext:v13 completion:&v14];
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)shouldOfferSecurityUpgrade
{
  return self->_shouldOfferSecurityUpgrade;
}

- (void)setShouldOfferSecurityUpgrade:(BOOL)a3
{
  self->_shouldOfferSecurityUpgrade = a3;
}

- (BOOL)firstTimeLogin
{
  return self->_firstTimeLogin;
}

- (void)setFirstTimeLogin:(BOOL)a3
{
  self->_firstTimeLogin = a3;
}

- (ACAccount)accountToUpgrade
{
  return self->_accountToUpgrade;
}

- (void)setAccountToUpgrade:(id)a3
{
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_uint64_t serviceType = a3;
}

- (BOOL)hasContinuationKey
{
  return self->_hasContinuationKey;
}

- (void)setHasContinuationKey:(BOOL)a3
{
  self->_hasContinuationKey = a3;
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end