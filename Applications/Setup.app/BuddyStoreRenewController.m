@interface BuddyStoreRenewController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (AAUISignInFlowControllerDelegate)flowControllerDelegate;
- (ACAccount)activeStoreAccount;
- (BFFFlowItemDelegate)delegate;
- (BFFNavigationController)navigationController;
- (BOOL)_canSkipAccount:(id)a3;
- (BOOL)_isActiveBuddyStoreAccount:(id)a3;
- (BOOL)_isActiveBuddyStoreAccountWithUsername:(id)a3 orAltDSID:(id)a4;
- (BOOL)_isPrimaryAccount:(id)a3;
- (BOOL)_isPrimaryAccountWithUsername:(id)a3 orAltDSID:(id)a4;
- (BOOL)controllerNeedsToRun;
- (BOOL)shouldOnlySetActiveStoreAccount;
- (BYAnalyticsManager)analyticsManager;
- (BYPasscodeCacheManager)passcodeCacheManager;
- (BYPreferencesController)buddyPreferencesInternal;
- (BYRunState)runState;
- (BuddyAppleIDController)storeAppleIDController;
- (BuddyAppleIDSignInController)signInController;
- (BuddyMiscState)miscState;
- (BuddyNetworkProvider)networkProvider;
- (BuddyStoreAccount)activeBuddyStoreAccount;
- (BuddyStoreRenewController)init;
- (CDPUIController)cdpUIController;
- (NSDictionary)storeAccountMap;
- (NSMutableArray)storeAccountsToSignIn;
- (NSNumber)mediaLinkedAccountDSID;
- (ProximitySetupController)proximitySetupController;
- (id)_amsAccountStore;
- (id)_amsStoreAccountForUsername:(id)a3 altDSID:(id)a4;
- (id)_localizedExtraStoresSignInTextForStoreContentMap:(id)a3;
- (id)_localizedExtraStoresSignInTextKeyForStoreContentMap:(id)a3;
- (id)_primaryAccount;
- (id)_primaryAccountInfo;
- (id)viewController;
- (void)_authenticateAccount:(id)a3;
- (void)_authenticateNextAccount;
- (void)_authenticateThenSignInNextAccount;
- (void)_didAuthenticateWithAuthenticationResults:(id)a3;
- (void)_didSignInUsername:(id)a3 altDSID:(id)a4;
- (void)_familyMembersForAccount:(id)a3 completion:(id)a4;
- (void)_fetchAccountsWithCompletion:(id)a3;
- (void)_fetchMediaLinkedAccountDSIDWithCompletion:(id)a3;
- (void)_makeStoreAccountActiveForAccount:(id)a3 completion:(id)a4;
- (void)_removeAccountsToSignIn:(id)a3;
- (void)_startSpinningWithIdentifier:(id)a3;
- (void)_stopSpinningForIdentifier:(id)a3;
- (void)appleIDController:(id)a3 didAuthenticateForCredentialRecovery:(id)a4;
- (void)appleIDControllerFinished:(id)a3;
- (void)fetchAccounts:(id)a3;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setActiveBuddyStoreAccount:(id)a3;
- (void)setActiveStoreAccount:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setBuddyPreferencesInternal:(id)a3;
- (void)setCdpUIController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFlowControllerDelegate:(id)a3;
- (void)setMediaLinkedAccountDSID:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setNetworkProvider:(id)a3;
- (void)setPasscodeCacheManager:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setRunState:(id)a3;
- (void)setShouldOnlySetActiveStoreAccount:(BOOL)a3;
- (void)setSignInController:(id)a3;
- (void)setStoreAccountMap:(id)a3;
- (void)setStoreAccountsToSignIn:(id)a3;
- (void)setStoreAppleIDController:(id)a3;
- (void)startFlowItem:(BOOL)a3;
@end

@implementation BuddyStoreRenewController

- (BuddyStoreRenewController)init
{
  SEL v5 = a2;
  id location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyStoreRenewController;
  id location = [(BuddyStoreRenewController *)&v4 init];
  objc_storeStrong(&location, location);
  if (location) {
    *((unsigned char *)location + 8) = 1;
  }
  v2 = (BuddyStoreRenewController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)fetchAccounts:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)_authenticateThenSignInNextAccount
{
  v19 = self;
  location[1] = (id)a2;
  v2 = [(BuddyStoreRenewController *)self storeAccountsToSignIn];
  location[0] = [(NSMutableArray *)v2 firstObject];

  if (location[0])
  {
    if ([(BuddyStoreRenewController *)v19 shouldOnlySetActiveStoreAccount]
      && [(BuddyStoreRenewController *)v19 _isActiveBuddyStoreAccount:location[0]])
    {
      v12 = _NSConcreteStackBlock;
      int v13 = -1073741824;
      int v14 = 0;
      v15 = sub_1001914F8;
      v16 = &unk_1002B0FF0;
      v17 = v19;
      [(BuddyStoreRenewController *)v19 _makeStoreAccountActiveForAccount:location[0] completion:&v12];
      objc_storeStrong((id *)&v17, 0);
    }
    else if ([(BuddyStoreRenewController *)v19 _canSkipAccount:location[0]])
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_10004B238((uint64_t)buf, (uint64_t)location[0]);
        _os_log_impl((void *)&_mh_execute_header, oslog, v10, "Skipping %@...", buf, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v3 = [(BuddyStoreRenewController *)v19 storeAccountsToSignIn];
      [(NSMutableArray *)v3 removeObjectAtIndex:0];

      [(BuddyStoreRenewController *)v19 _authenticateThenSignInNextAccount];
    }
    else
    {
      [(BuddyStoreRenewController *)v19 _authenticateNextAccount];
    }
  }
  else
  {
    os_log_t v9 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v4 = v9;
      os_log_type_t v5 = v8;
      sub_10004B24C(v7);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "No store accounts remaining to sign-in", (uint8_t *)v7, 2u);
    }
    objc_storeStrong((id *)&v9, 0);
    [(BuddyStoreRenewController *)v19 setStoreAccountsToSignIn:0];
    v6 = [(BuddyStoreRenewController *)v19 delegate];
    [(BFFFlowItemDelegate *)v6 flowItemDone:v19];
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_canSkipAccount:(id)a3
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v17 = [(BuddyStoreRenewController *)v19 _isActiveBuddyStoreAccount:location[0]];
  char v16 = [(BuddyStoreRenewController *)v19 _isPrimaryAccount:location[0]];
  if (!v16 || (v17 & 1) != 0)
  {
    char v14 = 0;
    char v12 = 0;
    BOOL v7 = 0;
    if ((v16 & 1) == 0)
    {
      v15 = [(BuddyStoreRenewController *)v19 mediaLinkedAccountDSID];
      char v14 = 1;
      BOOL v7 = 0;
      if (v15)
      {
        id v13 = [location[0] dsid];
        char v12 = 1;
        BOOL v7 = v13 != 0;
      }
    }
    if (v12) {

    }
    if (v14) {
    if (v7)
    }
    {
      os_log_type_t v8 = [(BuddyStoreRenewController *)v19 mediaLinkedAccountDSID];
      os_log_t v9 = [(NSNumber *)v8 stringValue];
      id v10 = [location[0] dsid];
      char v20 = [(NSString *)v9 isEqualToString:v10];
    }
    else
    {
      char v20 = 0;
    }
  }
  else
  {
    v3 = v19;
    id v4 = [location[0] username];
    id v5 = [location[0] altDSID];
    id v6 = [(BuddyStoreRenewController *)v3 _amsStoreAccountForUsername:v4 altDSID:v5];
    char v20 = ([v6 isActive] ^ 1) & 1;
  }
  objc_storeStrong(location, 0);
  return v20 & 1;
}

- (void)_makeStoreAccountActiveForAccount:(id)a3 completion:(id)a4
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  id v5 = v25;
  id v6 = [location[0] username];
  id v7 = [location[0] altDSID];
  id v22 = [(BuddyStoreRenewController *)v5 _amsStoreAccountForUsername:v6 altDSID:v7];

  if (v22)
  {
    [v22 setActive:1];
    id v18 = [(BuddyStoreRenewController *)v25 _amsAccountStore];
    id v10 = _NSConcreteStackBlock;
    int v11 = -1073741824;
    int v12 = 0;
    id v13 = sub_100191AAC;
    char v14 = &unk_1002B3D18;
    v15 = v25;
    id v16 = v22;
    id v17 = v23;
    [v18 saveAccount:v22 withCompletionHandler:&v10];
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong((id *)&v15, 0);
    objc_storeStrong(&v18, 0);
    int v19 = 0;
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v20 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_10004B238((uint64_t)buf, (uint64_t)location[0]);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v20, "Failed to find store account for active store account: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v23)
    {
      os_log_type_t v8 = (void (**)(id, NSError *))v23;
      os_log_t v9 = +[NSError errorWithDomain:ACErrorDomain code:6 userInfo:0];
      v8[2](v8, v9);
    }
    int v19 = 1;
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

- (void)_removeAccountsToSignIn:(id)a3
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyStoreRenewController *)v16 storeAccountsToSignIn];
  id v4 = [(NSMutableArray *)v3 count];

  if (v4)
  {
    memset(__b, 0, sizeof(__b));
    id v5 = location[0];
    id v6 = [v5 countByEnumeratingWithState:__b objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)__b[2];
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v6; ++i)
        {
          if (*(void *)__b[2] != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v13 = *(void *)(__b[1] + 8 * i);
          os_log_t v9 = [BuddyStoreAccount alloc];
          id v11 = [(BuddyStoreAccount *)v9 initWithUsername:v13 dsid:0 altDSID:0];
          id v10 = [(BuddyStoreRenewController *)v16 storeAccountsToSignIn];
          [(NSMutableArray *)v10 removeObject:v11];

          objc_storeStrong(&v11, 0);
        }
        id v6 = [v5 countByEnumeratingWithState:__b objects:v17 count:16];
      }
      while (v6);
    }

    int v14 = 0;
  }
  else
  {
    int v14 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)_familyMembersForAccount:(id)a3 completion:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  id v5 = +[AMSFamilyInfoLookupTask bagKeySet];
  id v6 = +[AMSFamilyInfoLookupTask bagSubProfile];
  id v7 = +[AMSFamilyInfoLookupTask bagSubProfileVersion];
  +[AMSBagKeySet registerBagKeySet:v5 forProfile:v6 profileVersion:v7];

  id v8 = +[AMSFamilyInfoLookupTask bagSubProfile];
  id v9 = +[AMSFamilyInfoLookupTask bagSubProfileVersion];
  id v19 = +[AMSBag bagForProfile:v8 profileVersion:v9];

  id v10 = objc_alloc((Class)AMSFamilyInfoLookupTask);
  id v18 = [v10 initWithAccount:location[0] bag:v19];
  id v17 = [v18 performFamilyInfoLookup];
  id v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  int v14 = sub_1001921A4;
  v15 = &unk_1002B4240;
  id v16 = v20;
  [v17 addFinishBlock:&v11];
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)_authenticateNextAccount
{
  id v4 = self;
  location[1] = (id)a2;
  v2 = [(BuddyStoreRenewController *)self storeAccountsToSignIn];
  location[0] = [(NSMutableArray *)v2 firstObject];

  [(BuddyStoreRenewController *)v4 _authenticateAccount:location[0]];
  objc_storeStrong(location, 0);
}

- (void)_authenticateAccount:(id)a3
{
  v64 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [BuddyAppleIDController alloc];
  id v4 = [(BuddyStoreRenewController *)v64 passcodeCacheManager];
  id v5 = [(BuddyStoreRenewController *)v64 analyticsManager];
  id v6 = [(BuddyStoreRenewController *)v64 runState];
  id v7 = +[BuddyFeatureFlags currentFlags];
  id v8 = [(BuddyAppleIDController *)v3 initWithAccount:0 passcodeCacheManager:v4 analyticsManager:v5 runState:v6 featureFlags:v7];
  [(BuddyStoreRenewController *)v64 setStoreAppleIDController:v8];

  id v9 = [(BuddyStoreRenewController *)v64 storeAppleIDController];
  [(BuddyAppleIDController *)v9 setDelegate:v64];

  id v10 = [(BuddyStoreRenewController *)v64 delegate];
  id v11 = [(BuddyStoreRenewController *)v64 storeAppleIDController];
  [(BuddyAppleIDController *)v11 setFlowItemDelegate:v10];

  int v12 = [(BuddyStoreRenewController *)v64 storeAppleIDController];
  int v13 = [(BuddyStoreRenewController *)v64 navigationController];
  [(BuddyAppleIDController *)v12 setNavigationController:v13];

  int v14 = [(BuddyStoreRenewController *)v64 proximitySetupController];
  LOBYTE(v13) = [(ProximitySetupController *)v14 hasConnection];
  v15 = [(BuddyStoreRenewController *)v64 storeAppleIDController];
  [(BuddyAppleIDController *)v15 setHasProximityConnection:v13 & 1];

  id v16 = [(BuddyStoreRenewController *)v64 navigationController];
  id v17 = [(BuddyStoreRenewController *)v64 passcodeCacheManager];
  id v18 = +[BuddyAppleIDSignInController federatedAuthSignInControllerInNavigationController:v16 mode:6 passcodeCacheManager:v17];
  [(BuddyStoreRenewController *)v64 setSignInController:v18];

  id v19 = [(BuddyStoreRenewController *)v64 signInController];
  id v20 = [location[0] username];
  [(BuddyAppleIDSignInController *)v19 setUsername:v20];

  v21 = v64;
  id v22 = [(BuddyStoreRenewController *)v64 storeAccountMap];
  id v23 = [location[0] username];
  id v24 = [(NSDictionary *)v22 objectForKeyedSubscript:v23];
  id v62 = [(BuddyStoreRenewController *)v21 _localizedExtraStoresSignInTextForStoreContentMap:v24];

  if (v62)
  {
    v25 = +[NSBundle mainBundle];
    v26 = [(NSBundle *)v25 localizedStringForKey:@"STORE_ACCOUNT_UPGRADE_TEXT_%@" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
    v27 = [(BuddyStoreRenewController *)v64 signInController];
    v28 = [(BuddyAppleIDSignInController *)v27 username];
    id v29 = +[AKUsernameFormatter formattedUsernameFromUsername:v28];
    id v61 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v26, v29);

    v30 = +[NSString localizedStringWithFormat:@"%@\n\n%@", v62, v61];
    v31 = [(BuddyStoreRenewController *)v64 signInController];
    [(BuddyAppleIDSignInController *)v31 setDetailText:v30];

    objc_storeStrong(&v61, 0);
  }
  v32 = [(BuddyStoreRenewController *)v64 signInController];
  v33 = +[NSBundle mainBundle];
  v34 = [(NSBundle *)v33 localizedStringForKey:@"FORGOT_PASSWORD_QUESTION" value:&stru_1002B4E18 table:@"Localizable"];
  v55 = _NSConcreteStackBlock;
  int v56 = -1073741824;
  int v57 = 0;
  v58 = sub_100192E90;
  v59 = &unk_1002B0D20;
  v60 = v64;
  [(BuddyAppleIDSignInController *)v32 setiForgotText:v34 handler:&v55];

  objc_initWeak(&from, v64);
  v35 = [(BuddyStoreRenewController *)v64 signInController];
  v48 = _NSConcreteStackBlock;
  int v49 = -1073741824;
  int v50 = 0;
  v51 = sub_100192F58;
  v52 = &unk_1002B0CA8;
  objc_copyWeak(&v53, &from);
  [(BuddyAppleIDSignInController *)v35 setAppearanceHandler:&v48];

  v36 = [(BuddyStoreRenewController *)v64 signInController];
  v41 = _NSConcreteStackBlock;
  int v42 = -1073741824;
  int v43 = 0;
  v44 = sub_100192FEC;
  v45 = &unk_1002B4268;
  objc_copyWeak(&v47, &from);
  id v46 = location[0];
  [(BuddyAppleIDSignInController *)v36 setHandler:&v41];

  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v37 = [location[0] username];
    sub_10004B238((uint64_t)buf, (uint64_t)v37);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Showing sign-in for %@...", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v38 = [(BuddyStoreRenewController *)v64 navigationController];
  v39 = [(BuddyStoreRenewController *)v64 signInController];
  [(BFFNavigationController *)v38 pushViewController:v39 animated:1];

  objc_storeStrong(&v46, 0);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&v53);
  objc_destroyWeak(&from);
  objc_storeStrong((id *)&v60, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(location, 0);
}

- (void)_didAuthenticateWithAuthenticationResults:(id)a3
{
  int v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v41 = [location[0] objectForKeyedSubscript:AKAuthenticationUsernameKey];
  id v40 = [location[0] objectForKeyedSubscript:AKAuthenticationAlternateDSIDKey];
  id v3 = objc_alloc((Class)CDPUIController);
  id v4 = [(BuddyStoreRenewController *)v43 navigationController];
  id v5 = [v3 initWithPresentingViewController:v4];
  [(BuddyStoreRenewController *)v43 setCdpUIController:v5];

  id v6 = [(BuddyStoreRenewController *)v43 cdpUIController];
  [(CDPUIController *)v6 setForceInlinePresentation:1];

  id v7 = objc_alloc((Class)AAUISignInFlowControllerDelegate);
  id v8 = [(BuddyStoreRenewController *)v43 navigationController];
  id v9 = [v7 initWithPresentingViewController:v8];
  [(BuddyStoreRenewController *)v43 setFlowControllerDelegate:v9];

  id v10 = [(BuddyStoreRenewController *)v43 flowControllerDelegate];
  [(AAUISignInFlowControllerDelegate *)v10 setShouldStashLoginResponse:1];

  id v39 = objc_alloc_init((Class)AMSSignInContext);
  char v38 = [(BuddyStoreRenewController *)v43 _isActiveBuddyStoreAccountWithUsername:v41 orAltDSID:v40];
  char v37 = [(BuddyStoreRenewController *)v43 _isPrimaryAccountWithUsername:v41 orAltDSID:v40];
  [v39 setIgnoreAccountConversion:1];
  [v39 setCanMakeAccountActive:v38 & 1];
  char v11 = 0;
  if (v37) {
    char v11 = v38;
  }
  [v39 setSkipAuthentication:v11 & 1];
  [v39 setDebugReason:@"Setup Assistant"];
  id v36 = objc_alloc_init((Class)AIDAMutableServiceContext);
  [v36 setAuthenticationResults:location[0]];
  int v12 = [(BuddyStoreRenewController *)v43 navigationController];
  [v36 setViewController:v12];

  int v13 = [(BuddyStoreRenewController *)v43 cdpUIController];
  [v36 setCdpUiProvider:v13];

  [v36 setShouldForceOperation:0];
  [v36 setOperationUIPermissions:1];
  v44[0] = AIDAServiceTypeCloud;
  int v14 = [(BuddyStoreRenewController *)v43 flowControllerDelegate];
  v45[0] = v14;
  v44[1] = AIDAServiceTypeStore;
  v45[1] = v39;
  v15 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
  [v36 setSignInContexts:v15];

  id v16 = objc_alloc((Class)AIDAServiceOwnersManager);
  id v17 = +[ACAccountStore defaultStore];
  id v35 = [v16 initWithAccountStore:v17];

  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = oslog;
    os_log_type_t v19 = v33;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Beginning sign-in for store account...", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(BuddyStoreRenewController *)v43 _startSpinningWithIdentifier:@"signin"];
  id v20 = v35;
  uint64_t v21 = AIDAServiceTypeStore;
  id v22 = v36;
  id v23 = _NSConcreteStackBlock;
  int v24 = -1073741824;
  int v25 = 0;
  v26 = sub_100193D0C;
  v27 = &unk_1002B42B8;
  v28 = v43;
  id v29 = v35;
  id v30 = v41;
  id v31 = v40;
  [v20 signInService:v21 withContext:v22 completion:&v23];
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong((id *)&v28, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
}

- (void)_didSignInUsername:(id)a3 altDSID:(id)a4
{
  id v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v29 = 0;
  objc_storeStrong(&v29, a4);
  id v5 = [(BuddyStoreRenewController *)v31 storeAccountsToSignIn];
  [(NSMutableArray *)v5 removeObjectAtIndex:0];

  if ([(BuddyStoreRenewController *)v31 _isActiveBuddyStoreAccountWithUsername:location[0] orAltDSID:v29])
  {
    char v28 = 1;
    id v6 = [(BuddyStoreRenewController *)v31 activeStoreAccount];
    BOOL v7 = v6 == 0;

    if (v7)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = oslog;
        os_log_type_t v9 = v26;
        sub_10004B24C(buf);
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Skipping fetching family members as there is no active store account", buf, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      char v28 = 0;
    }
    id v10 = [(BuddyStoreRenewController *)v31 storeAccountsToSignIn];
    id v11 = [(NSMutableArray *)v10 count];

    if (!v11)
    {
      os_log_t v24 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = v24;
        os_log_type_t v13 = v23;
        sub_10004B24C(v22);
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "Skipping fetching family members as there are no more accounts to authenticate", v22, 2u);
      }
      objc_storeStrong((id *)&v24, 0);
      char v28 = 0;
    }
    if (v28)
    {
      [(BuddyStoreRenewController *)v31 _startSpinningWithIdentifier:@"family"];
      int v14 = v31;
      v15 = [(BuddyStoreRenewController *)v31 activeStoreAccount];
      id v16 = _NSConcreteStackBlock;
      int v17 = -1073741824;
      int v18 = 0;
      os_log_type_t v19 = sub_100194490;
      id v20 = &unk_1002B42E0;
      uint64_t v21 = v31;
      [(BuddyStoreRenewController *)v14 _familyMembersForAccount:v15 completion:&v16];

      objc_storeStrong((id *)&v21, 0);
    }
    else
    {
      [(BuddyStoreRenewController *)v31 _authenticateThenSignInNextAccount];
    }
  }
  else
  {
    [(BuddyStoreRenewController *)v31 _authenticateThenSignInNextAccount];
  }
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (id)_localizedExtraStoresSignInTextForStoreContentMap:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = [(BuddyStoreRenewController *)v8 _localizedExtraStoresSignInTextKeyForStoreContentMap:location[0]];
  if (v6)
  {
    id v3 = +[NSBundle mainBundle];
    os_log_type_t v9 = [(NSBundle *)v3 localizedStringForKey:v6 value:&stru_1002B4E18 table:@"RestoreFromBackup"];
  }
  else
  {
    os_log_type_t v9 = 0;
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  id v4 = v9;

  return v4;
}

- (id)_localizedExtraStoresSignInTextKeyForStoreContentMap:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = [location[0] objectForKeyedSubscript:@"dataClasses"];
  id v5 = +[NSMutableString stringWithString:@"EXTRA_STORES"];
  if ([v6 containsObject:@"Book"]) {
    [v5 appendString:@"_IBOOKS"];
  }
  if ([v6 containsObject:@"Media"]) {
    [v5 appendString:@"_ITUNES"];
  }
  if ([v6 containsObject:@"Application"]) {
    [v5 appendString:@"_APP"];
  }
  id v3 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v3;
}

- (void)_startSpinningWithIdentifier:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyStoreRenewController *)v10 navigationController];
  id v4 = [(BFFNavigationController *)v3 topViewController];
  id v5 = [v4 view];
  id v6 = [v5 window];
  [v6 setUserInteractionEnabled:0];

  BOOL v7 = [(BuddyStoreRenewController *)v10 navigationController];
  id v8 = [(BFFNavigationController *)v7 topViewController];
  +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:v8 identifier:location[0]];

  objc_storeStrong(location, 0);
}

- (void)_stopSpinningForIdentifier:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyStoreRenewController *)v8 navigationController];
  id v4 = [(BFFNavigationController *)v3 topViewController];
  id v5 = [v4 view];
  id v6 = [v5 window];
  [v6 setUserInteractionEnabled:1];

  +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:location[0]];
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (BOOL)controllerNeedsToRun
{
  id v20 = self;
  SEL v19 = a2;
  v2 = [(BuddyStoreRenewController *)self buddyPreferencesInternal];
  char v17 = 0;
  char v15 = 0;
  BOOL v3 = 0;
  if (v2)
  {
    int v18 = [(BuddyStoreRenewController *)v20 buddyPreferencesInternal];
    char v17 = 1;
    id v16 = [(BYPreferencesController *)v18 objectForKey:@"ams-force-run" includeCache:0];
    char v15 = 1;
    BOOL v3 = v16 != 0;
  }
  if (v15) {

  }
  if (v17) {
  if (v3)
  }
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    char v13 = 2;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      id v4 = oslog;
      os_log_type_t v5 = v13;
      sub_10004B24C(buf);
      _os_log_debug_impl((void *)&_mh_execute_header, v4, v5, "AMSAccount fetchMedialLinkedAccountDSID force run flag found", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    return 1;
  }
  else
  {
    id v6 = [(BuddyStoreRenewController *)v20 networkProvider];
    unsigned __int8 v7 = [(BuddyNetworkProvider *)v6 networkReachable];
    char v10 = 0;
    char v8 = 1;
    if ((v7 & 1) == 0)
    {
      id v11 = [(BuddyStoreRenewController *)v20 miscState];
      char v10 = 1;
      char v8 = ![(BuddyMiscState *)v11 userSkippedWiFi];
    }
    BOOL v21 = v8 & 1;
    if (v10) {
  }
    }
  return v21;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v27 = dispatch_group_create();
  dispatch_group_enter((dispatch_group_t)v27);
  BOOL v3 = v29;
  BOOL v21 = _NSConcreteStackBlock;
  int v22 = -1073741824;
  int v23 = 0;
  os_log_t v24 = sub_100194FD8;
  int v25 = &unk_1002B0D20;
  id v26 = v27;
  [(BuddyStoreRenewController *)v3 _fetchAccountsWithCompletion:&v21];
  dispatch_group_enter((dispatch_group_t)v27);
  id v4 = v29;
  int v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  char v17 = sub_100195004;
  int v18 = &unk_1002B4308;
  SEL v19 = v29;
  id v20 = v27;
  [(BuddyStoreRenewController *)v4 _fetchMediaLinkedAccountDSIDWithCompletion:&v14];
  os_log_type_t v5 = v27;
  id v6 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  char v10 = sub_100195060;
  id v11 = &unk_1002B1780;
  id v13 = location[0];
  int v12 = v29;
  dispatch_group_notify(v5, (dispatch_queue_t)v6, &block);

  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

- (void)_fetchAccountsWithCompletion:(id)a3
{
  int v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v3 = v12;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  unsigned __int8 v7 = sub_1001951F4;
  int v8 = &unk_1002B4380;
  int v9 = v12;
  id v10 = location[0];
  [(BuddyStoreRenewController *)v3 fetchAccounts:&v4];
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_fetchMediaLinkedAccountDSIDWithCompletion:(id)a3
{
  v66 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v64 = [(BuddyStoreRenewController *)v66 _primaryAccount];
  id v3 = [v64 ams_DSID];

  if (v3)
  {
    id v63 = (id)_BYLoggingFacility();
    os_log_type_t v62 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v63, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v64 username];
      id v5 = [v64 ams_DSID];
      sub_1000DC614((uint64_t)buf, (uint64_t)v4, (uint64_t)v5);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v63, v62, "Fetching media link account DSID for %@: %{public}@", buf, 0x16u);
    }
    objc_storeStrong(&v63, 0);
    id v6 = objc_alloc((Class)AMSAccountIdentity);
    id v7 = [v64 ams_DSID];
    id v8 = [v64 ams_altDSID];
    id v61 = [v6 initWithDSID:v7 altDSID:v8];

    uint64_t v54 = 0;
    v55 = &v54;
    int v56 = 838860800;
    int v57 = 48;
    v58 = sub_100196478;
    v59 = sub_1001964A4;
    id v60 = 0;
    v50[0] = 0;
    v50[1] = v50;
    int v51 = 0x20000000;
    int v52 = 32;
    char v53 = 0;
    int v43 = _NSConcreteStackBlock;
    int v44 = -1073741824;
    int v45 = 0;
    id v46 = sub_1001964B0;
    id v47 = &unk_1002B43D0;
    v48[1] = &v54;
    v48[2] = v50;
    v48[0] = location[0];
    id v49 = objc_retainBlock(&v43);
    block = _NSConcreteStackBlock;
    int v38 = -1073741824;
    int v39 = 0;
    id v40 = sub_100196860;
    id v41 = &unk_1002B0D70;
    id v42 = v49;
    dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    id v10 = (void *)v55[5];
    v55[5] = (uint64_t)v9;

    dispatch_time_t v11 = dispatch_time(0, 15000000000);
    int v12 = &_dispatch_main_q;
    id v31 = _NSConcreteStackBlock;
    int v32 = -1073741824;
    int v33 = 0;
    v34 = sub_10019691C;
    id v35 = &unk_1002B1248;
    id v36 = &v54;
    dispatch_after(v11, (dispatch_queue_t)v12, &v31);

    id v13 = +[AMSAccountCachedServerData sharedInstance];
    id v14 = v61;
    os_log_t v24 = _NSConcreteStackBlock;
    int v25 = -1073741824;
    int v26 = 0;
    id v27 = sub_100196964;
    char v28 = &unk_1002B43F8;
    id v29 = v49;
    id v30 = [(AMSAccountCachedServerData *)v13 intForKey:2 accountID:v14 updateBlock:&v24];

    id v15 = v30;
    int v18 = _NSConcreteStackBlock;
    int v19 = -1073741824;
    int v20 = 0;
    BOOL v21 = sub_100196BE0;
    int v22 = &unk_1002B43F8;
    id v23 = v49;
    [v15 addFinishBlock:&v18];
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v42, 0);
    objc_storeStrong(&v49, 0);
    objc_storeStrong(v48, 0);
    _Block_object_dispose(v50, 8);
    _Block_object_dispose(&v54, 8);
    objc_storeStrong(&v60, 0);
    objc_storeStrong(&v61, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      id v16 = [v64 username];
      sub_10004B238((uint64_t)v67, (uint64_t)v16);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Skip fetch media linked account. Failed to determine DSID for primary account: %@", v67, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (location[0]) {
      (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    }
  }
  objc_storeStrong(&v64, 0);
  objc_storeStrong(location, 0);
}

- (void)startFlowItem:(BOOL)a3
{
}

- (id)viewController
{
  return [(BuddyStoreRenewController *)self signInController];
}

- (void)appleIDControllerFinished:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)appleIDController:(id)a3 didAuthenticateForCredentialRecovery:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(BuddyStoreRenewController *)v7 _didAuthenticateWithAuthenticationResults:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_isActiveBuddyStoreAccount:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v8;
  id v4 = [location[0] username];
  id v5 = [location[0] altDSID];
  LOBYTE(v3) = [(BuddyStoreRenewController *)v3 _isActiveBuddyStoreAccountWithUsername:v4 orAltDSID:v5];

  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (BOOL)_isActiveBuddyStoreAccountWithUsername:(id)a3 orAltDSID:(id)a4
{
  int v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v5 = location[0];
  id v6 = [(BuddyStoreRenewController *)v18 activeBuddyStoreAccount];
  id v7 = [(BuddyStoreAccount *)v6 username];
  unsigned __int8 v8 = [v5 isEqualToString:v7];
  char v14 = 0;
  char v12 = 0;
  unsigned __int8 v9 = 1;
  if ((v8 & 1) == 0)
  {
    id v10 = v16;
    id v15 = [(BuddyStoreRenewController *)v18 activeBuddyStoreAccount];
    char v14 = 1;
    id v13 = [(BuddyStoreAccount *)v15 altDSID];
    char v12 = 1;
    unsigned __int8 v9 = [v10 isEqualToString:];
  }
  char v19 = v9 & 1;
  if (v12) {

  }
  if (v14) {
  objc_storeStrong(&v16, 0);
  }
  objc_storeStrong(location, 0);
  return v19 & 1;
}

- (BOOL)_isPrimaryAccount:(id)a3
{
  unsigned __int8 v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v8;
  id v4 = [location[0] username];
  id v5 = [location[0] altDSID];
  LOBYTE(v3) = [(BuddyStoreRenewController *)v3 _isPrimaryAccountWithUsername:v4 orAltDSID:v5];

  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (BOOL)_isPrimaryAccountWithUsername:(id)a3 orAltDSID:(id)a4
{
  int v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v5 = location[0];
  id v6 = [(BuddyStoreRenewController *)v18 _primaryAccountInfo];
  id v7 = [v6 username];
  unsigned __int8 v8 = [v5 isEqualToString:v7];
  char v14 = 0;
  char v12 = 0;
  unsigned __int8 v9 = 1;
  if ((v8 & 1) == 0)
  {
    id v10 = v16;
    id v15 = [(BuddyStoreRenewController *)v18 _primaryAccountInfo];
    char v14 = 1;
    id v13 = [v15 altDSID];
    char v12 = 1;
    unsigned __int8 v9 = [v10 isEqualToString:];
  }
  char v19 = v9 & 1;
  if (v12) {

  }
  if (v14) {
  objc_storeStrong(&v16, 0);
  }
  objc_storeStrong(location, 0);
  return v19 & 1;
}

- (id)_amsAccountStore
{
  return +[ACAccountStore ams_sharedAccountStore];
}

- (id)_amsStoreAccountForUsername:(id)a3 altDSID:(id)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v7 = [(BuddyStoreRenewController *)v10 _amsAccountStore];
  if (v8) {
    id v11 = [v7 ams_iTunesAccountWithAltDSID:v8];
  }
  else {
    id v11 = [v7 ams_iTunesAccountWithUsername:location[0]];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  id v5 = v11;

  return v5;
}

- (id)_primaryAccount
{
  id v2 = +[ACAccountStore defaultStore];
  id v3 = [v2 aa_primaryAppleAccount];

  return v3;
}

- (id)_primaryAccountInfo
{
  return +[BFFAppleAccountInfo primaryAccountInfo];
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
}

- (BFFNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
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

- (BYPreferencesController)buddyPreferencesInternal
{
  return self->_buddyPreferencesInternal;
}

- (void)setBuddyPreferencesInternal:(id)a3
{
}

- (CDPUIController)cdpUIController
{
  return self->_cdpUIController;
}

- (void)setCdpUIController:(id)a3
{
}

- (AAUISignInFlowControllerDelegate)flowControllerDelegate
{
  return self->_flowControllerDelegate;
}

- (void)setFlowControllerDelegate:(id)a3
{
}

- (NSMutableArray)storeAccountsToSignIn
{
  return self->_storeAccountsToSignIn;
}

- (void)setStoreAccountsToSignIn:(id)a3
{
}

- (NSDictionary)storeAccountMap
{
  return self->_storeAccountMap;
}

- (void)setStoreAccountMap:(id)a3
{
}

- (BOOL)shouldOnlySetActiveStoreAccount
{
  return self->_shouldOnlySetActiveStoreAccount;
}

- (void)setShouldOnlySetActiveStoreAccount:(BOOL)a3
{
  self->_shouldOnlySetActiveStoreAccount = a3;
}

- (BuddyAppleIDController)storeAppleIDController
{
  return self->_storeAppleIDController;
}

- (void)setStoreAppleIDController:(id)a3
{
}

- (BuddyAppleIDSignInController)signInController
{
  return self->_signInController;
}

- (void)setSignInController:(id)a3
{
}

- (BuddyStoreAccount)activeBuddyStoreAccount
{
  return self->_activeBuddyStoreAccount;
}

- (void)setActiveBuddyStoreAccount:(id)a3
{
}

- (ACAccount)activeStoreAccount
{
  return self->_activeStoreAccount;
}

- (void)setActiveStoreAccount:(id)a3
{
}

- (NSNumber)mediaLinkedAccountDSID
{
  return self->_mediaLinkedAccountDSID;
}

- (void)setMediaLinkedAccountDSID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end