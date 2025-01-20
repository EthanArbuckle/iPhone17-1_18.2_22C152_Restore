@interface BuddyAppleIDController
- (ACAccount)accountToUpgrade;
- (BFFFlowItemDelegate)flowItemDelegate;
- (BOOL)_isRestore;
- (BOOL)accountToUpgradeIsPrimary;
- (BOOL)assumeResponsibilityForRUIPage;
- (BOOL)controllerNeedsToRunForClass:(Class)a3;
- (BOOL)hasProximityConnection;
- (BOOL)isFlowItemOnTop:(id)a3;
- (BOOL)responsibleForViewController:(id)a3;
- (BOOL)shouldAllowStartOver;
- (BYAnalyticsManager)analyticsManager;
- (BYPasscodeCacheManager)passcodeCacheManager;
- (BYRunState)runState;
- (BuddyAppleIDAuthManager)authManager;
- (BuddyAppleIDController)initWithAccount:(id)a3 passcodeCacheManager:(id)a4 analyticsManager:(id)a5 runState:(id)a6 featureFlags:(id)a7;
- (BuddyAppleIDControllerDelegate)delegate;
- (BuddyAppleIDSignInController)twoAccountsiCloudSignInController;
- (BuddyAppleIDSignInTask)signInTask;
- (BuddyFeatureFlags)featureFlags;
- (LockdownModeProvider)lockdownModeProvider;
- (NSMutableDictionary)spinnerAppearanceHandlers;
- (NSPointerArray)responsibilityViewControllers;
- (NSString)existingAccountUsername;
- (UINavigationController)modalNavigationController;
- (UINavigationController)navigationController;
- (UIViewController)authAttemptLandingViewController;
- (id)_authenticationContextForSecurityUpgrade;
- (id)popToBuddyControllerWithClass:(Class)a3 animated:(BOOL)a4;
- (id)popToBuddyControllerWithClass:(Class)a3 withOffset:(unint64_t)a4 animated:(BOOL)a5;
- (id)securityUpgradeAccountSignInViewController;
- (id)signInViewController;
- (id)signInViewControllerForRestore;
- (id)silentUpgradeViewControllerWithLoginContext:(id)a3;
- (id)upgradeAccountForRestoreAfterSoftwareUpdateSignInViewController;
- (id)upgradeAccountSignInViewController;
- (unint64_t)countOfResponsibilityViewControllerPushSessions;
- (unint64_t)existingAccountType;
- (unint64_t)operationType;
- (void)_appleIDControllerCompletedShouldProceed:(BOOL)a3 error:(id)a4;
- (void)_authCompletedShouldProceed:(BOOL)a3 error:(id)a4;
- (void)_beginPostUpgradeAppleIDLoginWithUsername:(id)a3 password:(id)a4 continuationKey:(id)a5 signInController:(id)a6;
- (void)_beginPostUpgradeAppleIDLoginWithUsername:(id)a3 password:(id)a4 signInController:(id)a5;
- (void)_createMeCard;
- (void)_didFinishResponsibilityViewControllerPushSeesion;
- (void)_loadSecurityUpgradeUI;
- (void)_nameDevice;
- (void)_popBackToAuthAttemptLandingPage;
- (void)_pushNextViewController:(id)a3;
- (void)_removeBackToViewControllerMatchingBlock:(id)a3 withOffset:(int64_t)a4;
- (void)_setAppearanceHandler:(id)a3 forSpinnerPage:(id)a4;
- (void)_setLogInOptionsForBuddyAppleIDAuthMode:(int)a3 signInController:(id)a4;
- (void)_setupAccountForSecurityUpgrade;
- (void)_showProximityiCloudSignInController:(id)a3;
- (void)_showSpinnerPage:(id)a3 appearanceHandler:(id)a4;
- (void)_showSpinnerPageWithIdentifier:(id)a3 handler:(id)a4;
- (void)_showTwoAccountsiCloudSignInController;
- (void)_showTwoAccountsiTunesSignInController;
- (void)_signInFailedWithError:(id)a3;
- (void)_signInSucceeded;
- (void)_upgradeAccountWithAuthenticationResults:(id)a3 completion:(id)a4;
- (void)_willStartResponsibilityViewControllerPushSession;
- (void)buddyAppleIDSpinnerPageDidAppear:(id)a3;
- (void)cancelAuthentication;
- (void)flowItemCancelled:(id)a3;
- (void)flowItemDone:(id)a3;
- (void)flowItemDone:(id)a3 nextItem:(id)a4;
- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4;
- (void)markFlowItemDone:(id)a3;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)pushFlowItem:(id)a3 animated:(BOOL)a4;
- (void)pushFlowItem:(id)a3 inFlow:(id)a4 animated:(BOOL)a5;
- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6;
- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6 willPushFlowItem:(id)a7;
- (void)removeViewControllersOnNextPush:(id)a3;
- (void)setAccountToUpgrade:(id)a3;
- (void)setAccountToUpgradeIsPrimary:(BOOL)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setAssumeResponsibilityForRUIPage:(BOOL)a3;
- (void)setAuthAttemptLandingViewController:(id)a3;
- (void)setAuthManager:(id)a3;
- (void)setCountOfResponsibilityViewControllerPushSessions:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setExistingAccountType:(unint64_t)a3;
- (void)setExistingAccountUsername:(id)a3;
- (void)setExistingAccountUsername:(id)a3 accountType:(unint64_t)a4;
- (void)setFlowItemDelegate:(id)a3;
- (void)setHasProximityConnection:(BOOL)a3;
- (void)setLockdownModeProvider:(id)a3;
- (void)setModalNavigationController:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setOperationType:(unint64_t)a3;
- (void)setPasscodeCacheManager:(id)a3;
- (void)setResponsibilityViewControllers:(id)a3;
- (void)setRunState:(id)a3;
- (void)setSignInTask:(id)a3;
- (void)setSpinnerAppearanceHandlers:(id)a3;
- (void)setTwoAccountsiCloudSignInController:(id)a3;
- (void)showCreateAppleID;
- (void)showCredentialRecovery;
@end

@implementation BuddyAppleIDController

- (BuddyAppleIDController)initWithAccount:(id)a3 passcodeCacheManager:(id)a4 analyticsManager:(id)a5 runState:(id)a6 featureFlags:(id)a7
{
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id obj = 0;
  objc_storeStrong(&obj, a4);
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  id v18 = 0;
  objc_storeStrong(&v18, a6);
  id v17 = 0;
  objc_storeStrong(&v17, a7);
  id v11 = v22;
  id v22 = 0;
  v16.receiver = v11;
  v16.super_class = (Class)BuddyAppleIDController;
  id v22 = [(BuddyAppleIDController *)&v16 init];
  objc_storeStrong(&v22, v22);
  if (v22)
  {
    objc_storeStrong((id *)v22 + 14, obj);
    objc_storeStrong((id *)v22 + 20, v19);
    objc_storeStrong((id *)v22 + 21, v18);
    *((void *)v22 + 15) = 0;
    v12 = +[NSPointerArray weakObjectsPointerArray];
    v13 = (void *)*((void *)v22 + 16);
    *((void *)v22 + 16) = v12;

    objc_storeStrong((id *)v22 + 8, v17);
    if (location[0]) {
      objc_storeStrong((id *)v22 + 9, location[0]);
    }
  }
  v14 = (BuddyAppleIDController *)v22;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v22, 0);
  return v14;
}

- (BFFFlowItemDelegate)flowItemDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setExistingAccountUsername:(id)a3 accountType:(unint64_t)a4
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyAppleIDController *)v6 setExistingAccountUsername:location[0]];
  [(BuddyAppleIDController *)v6 setExistingAccountType:a4];
  objc_storeStrong(location, 0);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    if (location[0] != v4->_navigationController)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [location[0] addDelegateObserver:v4];
      }
    }
  }
  objc_storeStrong((id *)&v4->_navigationController, location[0]);
  objc_storeStrong(location, 0);
}

- (void)showCredentialRecovery
{
  id v30 = self;
  oslog[1] = (os_log_t)a2;
  v2 = [(BuddyAppleIDController *)self navigationController];
  v3 = [(UINavigationController *)v2 topViewController];
  [v30 setAuthAttemptLandingViewController:v3];

  v4 = [BuddyAppleIDSignInTask alloc];
  id v5 = [v30 featureFlags];
  id v6 = +[BuddyAccountTools sharedBuddyAccountTools];
  v7 = [(BuddyAppleIDSignInTask *)v4 initWithFeatureFlags:v5 accountTools:v6];
  [v30 setSignInTask:v7];

  id v8 = [v30 navigationController];
  id v9 = [v30 signInTask];
  [v9 setNavigationController:v8];

  LOBYTE(v8) = [v30 _isRestore];
  id v10 = [v30 signInTask];
  [v10 setRestoreFromBackupMode:v8 & 1];

  id v11 = [v30 featureFlags];
  LOBYTE(v10) = [v11 isUseCDPContextSecretInsteadOfSBDSecretEnabled];

  if (v10)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v30 passcodeCacheManager];
      id v13 = [v30 signInTask];
      sub_1000E4F20((uint64_t)buf, (uint64_t)"-[BuddyAppleIDController showCredentialRecovery]", (uint64_t)v12, (uint64_t)v13);
      _os_log_impl((void *)&_mh_execute_header, oslog[0], v28, "%s: Setting cache manager %@ on sign in task %@", buf, 0x20u);
    }
    objc_storeStrong((id *)oslog, 0);
    id v14 = [v30 passcodeCacheManager];
    id v15 = [v30 signInTask];
    [v15 setCacheManager:v14];
  }
  os_log_t v27 = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v16 = v27;
    os_log_type_t v17 = v26;
    sub_10004B24C(v25);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Beginning credential recovery...", v25, 2u);
  }
  objc_storeStrong((id *)&v27, 0);
  id v18 = [v30 signInTask];
  id v19 = _NSConcreteStackBlock;
  int v20 = -1073741824;
  int v21 = 0;
  id v22 = sub_1000FAAD8;
  v23 = &unk_1002B2EA8;
  id v24 = v30;
  [v18 authenticateForCredentialRecoveryWithCompletion:&v19];

  objc_storeStrong(&v24, 0);
}

- (void)showCreateAppleID
{
  id v30 = self;
  oslog[1] = (os_log_t)a2;
  v2 = [(BuddyAppleIDController *)self navigationController];
  v3 = [(UINavigationController *)v2 topViewController];
  [v30 setAuthAttemptLandingViewController:v3];

  v4 = [BuddyAppleIDSignInTask alloc];
  id v5 = [v30 featureFlags];
  id v6 = +[BuddyAccountTools sharedBuddyAccountTools];
  v7 = [(BuddyAppleIDSignInTask *)v4 initWithFeatureFlags:v5 accountTools:v6];
  [v30 setSignInTask:v7];

  id v8 = [v30 navigationController];
  id v9 = [v30 signInTask];
  [v9 setNavigationController:v8];

  LOBYTE(v8) = [v30 _isRestore];
  id v10 = [v30 signInTask];
  [v10 setRestoreFromBackupMode:v8 & 1];

  id v11 = [v30 featureFlags];
  LOBYTE(v10) = [v11 isUseCDPContextSecretInsteadOfSBDSecretEnabled];

  if (v10)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v30 passcodeCacheManager];
      id v13 = [v30 signInTask];
      sub_1000E4F20((uint64_t)buf, (uint64_t)"-[BuddyAppleIDController showCreateAppleID]", (uint64_t)v12, (uint64_t)v13);
      _os_log_impl((void *)&_mh_execute_header, oslog[0], v28, "%s: Setting cache manager %@ on sign in task %@", buf, 0x20u);
    }
    objc_storeStrong((id *)oslog, 0);
    id v14 = [v30 passcodeCacheManager];
    id v15 = [v30 signInTask];
    [v15 setCacheManager:v14];
  }
  os_log_t v27 = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v16 = v27;
    os_log_type_t v17 = v26;
    sub_10004B24C(v25);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Beginning account creation...", v25, 2u);
  }
  objc_storeStrong((id *)&v27, 0);
  id v18 = [v30 signInTask];
  id v19 = _NSConcreteStackBlock;
  int v20 = -1073741824;
  int v21 = 0;
  id v22 = sub_1000FB868;
  v23 = &unk_1002B2EA8;
  id v24 = v30;
  [v18 authenticateForAccountCreationWithCompletion:&v19];

  objc_storeStrong(&v24, 0);
}

- (void)_willStartResponsibilityViewControllerPushSession
{
  v2 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v2);

  [(BuddyAppleIDController *)self setCountOfResponsibilityViewControllerPushSessions:(char *)[(BuddyAppleIDController *)self countOfResponsibilityViewControllerPushSessions]+ 1];
}

- (void)_didFinishResponsibilityViewControllerPushSeesion
{
  v2 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v2);

  if ([(BuddyAppleIDController *)self countOfResponsibilityViewControllerPushSessions])
  {
    [(BuddyAppleIDController *)self setCountOfResponsibilityViewControllerPushSessions:(char *)[(BuddyAppleIDController *)self countOfResponsibilityViewControllerPushSessions]- 1];
  }
}

- (BOOL)responsibleForViewController:(id)a3
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(BuddyAppleIDController *)v13 assumeResponsibilityForRUIPage]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v14 = 1;
    int v11 = 1;
  }
  else
  {
    memset(__b, 0, sizeof(__b));
    v3 = [(BuddyAppleIDController *)v13 responsibilityViewControllers];
    v4 = [(NSPointerArray *)v3 allObjects];

    id v5 = [(NSArray *)v4 countByEnumeratingWithState:__b objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)__b[2];
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v5; ++i)
        {
          if (*(void *)__b[2] != v6) {
            objc_enumerationMutation(v4);
          }
          id v10 = *(id *)(__b[1] + 8 * i);
          if (v10 == location[0])
          {
            char v14 = 1;
            int v11 = 1;
            goto LABEL_14;
          }
        }
        id v5 = [(NSArray *)v4 countByEnumeratingWithState:__b objects:v15 count:16];
      }
      while (v5);
    }
    int v11 = 0;
LABEL_14:

    if (!v11)
    {
      objc_opt_class();
      char v14 = objc_opt_isKindOfClass() & 1;
      int v11 = 1;
    }
  }
  objc_storeStrong(location, 0);
  return v14 & 1;
}

- (void)cancelAuthentication
{
  v7 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    os_log_type_t v3 = v5;
    sub_10004B24C(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Cancelling authentication...", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  [(BuddyAppleIDController *)v7 _authCompletedShouldProceed:0 error:0];
}

- (id)upgradeAccountSignInViewController
{
  v37 = self;
  v36[1] = (id)a2;
  v2 = [(BuddyAppleIDController *)self navigationController];
  os_log_type_t v3 = [(BuddyAppleIDController *)v37 passcodeCacheManager];
  v36[0] = +[BuddyAppleIDSignInController federatedAuthSignInControllerInNavigationController:v2 mode:4 passcodeCacheManager:v3];

  v4 = [(BuddyAppleIDController *)v37 existingAccountUsername];
  [v36[0] setUsername:v4];

  os_log_type_t v5 = +[NSBundle mainBundle];
  uint64_t v6 = [(NSBundle *)v5 localizedStringForKey:@"FORGOT_PASSWORD_QUESTION" value:&stru_1002B4E18 table:@"Localizable"];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000FC8F4;
  v34[3] = &unk_1002B0D20;
  v35 = v37;
  [v36[0] setiForgotText:v6 handler:v34];

  objc_initWeak(&location, v36[0]);
  id v7 = v36[0];
  os_log_type_t v26 = _NSConcreteStackBlock;
  int v27 = -1073741824;
  int v28 = 0;
  v29 = sub_1000FC9A0;
  id v30 = &unk_1002B1408;
  objc_copyWeak(&v32, &location);
  v31 = v37;
  [v7 setAppearanceHandler:&v26];
  id v8 = v36[0];
  id v19 = _NSConcreteStackBlock;
  int v20 = -1073741824;
  int v21 = 0;
  id v22 = sub_1000FCA04;
  v23 = &unk_1002B2ED0;
  id v24 = v37;
  objc_copyWeak(v25, &location);
  [v8 setHandler:&v19];
  id v9 = v36[0];
  char v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  objc_super v16 = sub_1000FCB34;
  os_log_type_t v17 = &unk_1002B2EA8;
  id v18 = v37;
  [v9 setProximityLoginHandler:&v14];
  id v10 = v37;
  id v11 = objc_loadWeakRetained(&location);
  -[BuddyAppleIDController _setLogInOptionsForBuddyAppleIDAuthMode:signInController:](v10, "_setLogInOptionsForBuddyAppleIDAuthMode:signInController:", 4, v11, v14, v15, v16, v17);

  id v12 = v36[0];
  objc_storeStrong((id *)&v18, 0);
  objc_destroyWeak(v25);
  objc_storeStrong((id *)&v24, 0);
  objc_storeStrong((id *)&v31, 0);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
  objc_storeStrong((id *)&v35, 0);
  objc_storeStrong(v36, 0);
  return v12;
}

- (id)upgradeAccountForRestoreAfterSoftwareUpdateSignInViewController
{
  v33 = self;
  v32[1] = (id)a2;
  v2 = [(BuddyAppleIDController *)self navigationController];
  os_log_type_t v3 = [(BuddyAppleIDController *)v33 passcodeCacheManager];
  v32[0] = +[BuddyAppleIDSignInController federatedAuthSignInControllerInNavigationController:v2 mode:7 passcodeCacheManager:v3];

  v4 = [(BuddyAppleIDController *)v33 existingAccountUsername];
  [v32[0] setUsername:v4];

  os_log_type_t v5 = +[NSBundle mainBundle];
  uint64_t v6 = [(NSBundle *)v5 localizedStringForKey:@"FORGOT_PASSWORD_QUESTION" value:&stru_1002B4E18 table:@"Localizable"];
  os_log_type_t v26 = _NSConcreteStackBlock;
  int v27 = -1073741824;
  int v28 = 0;
  v29 = sub_1000FD1D0;
  id v30 = &unk_1002B0D20;
  v31 = v33;
  [v32[0] setiForgotText:v6 handler:&v26];

  objc_initWeak(&location, v32[0]);
  id v7 = v32[0];
  id v18 = _NSConcreteStackBlock;
  int v19 = -1073741824;
  int v20 = 0;
  int v21 = sub_1000FD27C;
  id v22 = &unk_1002B1408;
  objc_copyWeak(&v24, &location);
  v23 = v33;
  [v7 setAppearanceHandler:&v18];
  id v8 = v32[0];
  id v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  char v14 = sub_1000FD2E0;
  uint64_t v15 = &unk_1002B2ED0;
  objc_super v16 = v33;
  objc_copyWeak(v17, &location);
  [v8 setHandler:&v11];
  id v9 = v32[0];
  objc_destroyWeak(v17);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong((id *)&v23, 0);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
  objc_storeStrong((id *)&v31, 0);
  objc_storeStrong(v32, 0);
  return v9;
}

- (id)securityUpgradeAccountSignInViewController
{
  id v7 = self;
  location[1] = (id)a2;
  [(BuddyAppleIDController *)self setOperationType:4];
  v2 = [(BuddyAppleIDController *)v7 navigationController];
  os_log_type_t v3 = [(UINavigationController *)v2 topViewController];
  [(BuddyAppleIDController *)v7 setAuthAttemptLandingViewController:v3];

  location[0] = [[BuddyAppleIDSpinnerPage alloc] initWithAccountMode:[(BuddyAppleIDController *)v7 operationType]];
  [location[0] setDelegate:v7];
  [(BuddyAppleIDController *)v7 _loadSecurityUpgradeUI];
  id v4 = location[0];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)silentUpgradeViewControllerWithLoginContext:(id)a3
{
  uint64_t v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = [[BuddyAppleIDSpinnerPage alloc] initForSilentAuthentication];
  [v13 setDelegate:v15];
  os_log_type_t v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_1000FD634;
  id v9 = &unk_1002B12F0;
  id v10 = v15;
  id v11 = location[0];
  id v12 = objc_retainBlock(&v5);
  [(BuddyAppleIDController *)v15 _setAppearanceHandler:v12 forSpinnerPage:v13];
  id v3 = v13;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v3;
}

- (id)signInViewController
{
  v73 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility();
  os_log_type_t v71 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = location[0];
    os_log_type_t v3 = v71;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Showing sign in UI", buf, 2u);
  }
  objc_storeStrong(location, 0);
  [(BuddyAppleIDController *)v73 setOperationType:1];
  id v4 = [(BuddyAppleIDController *)v73 navigationController];
  os_log_type_t v5 = [(BuddyAppleIDController *)v73 passcodeCacheManager];
  id v69 = +[BuddyAppleIDSignInController federatedAuthSignInControllerInNavigationController:v4 mode:1 passcodeCacheManager:v5];

  int v6 = [(BuddyAppleIDController *)v73 existingAccountUsername];
  [v69 setUsername:v6];

  if ([(BuddyAppleIDController *)v73 existingAccountType] < 2) {
    [(BuddyAppleIDController *)v73 _setLogInOptionsForBuddyAppleIDAuthMode:1 signInController:v69];
  }
  int v7 = +[NSBundle mainBundle];
  id v8 = [(NSBundle *)v7 localizedStringForKey:@"DONT_HAVE_AN_APPLE_ID_OR_FORGOT_IT" value:&stru_1002B4E18 table:@"Localizable"];
  v63 = _NSConcreteStackBlock;
  int v64 = -1073741824;
  int v65 = 0;
  v66 = sub_1000FE1AC;
  v67 = &unk_1002B0D20;
  v68 = v73;
  [v69 setiForgotText:v8 handler:&v63];

  objc_initWeak(&from, v69);
  id v9 = v69;
  v55 = _NSConcreteStackBlock;
  int v56 = -1073741824;
  int v57 = 0;
  v58 = sub_1000FE2B0;
  v59 = &unk_1002B1408;
  objc_copyWeak(&v61, &from);
  v60 = v73;
  [v9 setAppearanceHandler:&v55];
  id v10 = objc_alloc((Class)BYAnalyticsEventAppleIDSignIn);
  id v11 = [(BuddyAppleIDController *)v73 analyticsManager];
  id v54 = [v10 initWithAnalyticsManager:v11 context:2];

  id v12 = [BuddyAppleIDSignInTask alloc];
  id v13 = [(BuddyAppleIDController *)v73 featureFlags];
  id v14 = +[BuddyAccountTools sharedBuddyAccountTools];
  uint64_t v15 = [(BuddyAppleIDSignInTask *)v12 initWithFeatureFlags:v13 accountTools:v14];
  [(BuddyAppleIDController *)v73 setSignInTask:v15];

  LOBYTE(v13) = [(BuddyAppleIDController *)v73 _isRestore];
  objc_super v16 = [(BuddyAppleIDController *)v73 signInTask];
  [(BuddyAppleIDSignInTask *)v16 setRestoreFromBackupMode:v13 & 1];

  os_log_type_t v17 = [(BuddyAppleIDController *)v73 featureFlags];
  LOBYTE(v16) = [(BuddyFeatureFlags *)v17 isUseCDPContextSecretInsteadOfSBDSecretEnabled];

  if (v16)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v52 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [(BuddyAppleIDController *)v73 passcodeCacheManager];
      int v19 = [(BuddyAppleIDController *)v73 signInTask];
      sub_1000E4F20((uint64_t)v74, (uint64_t)"-[BuddyAppleIDController signInViewController]", (uint64_t)v18, (uint64_t)v19);
      _os_log_impl((void *)&_mh_execute_header, oslog, v52, "%s: Setting cache manager %@ on sign in task %@", v74, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v20 = [(BuddyAppleIDController *)v73 passcodeCacheManager];
    int v21 = [(BuddyAppleIDController *)v73 signInTask];
    [(BuddyAppleIDSignInTask *)v21 setCacheManager:v20];
  }
  v43 = _NSConcreteStackBlock;
  int v44 = -1073741824;
  int v45 = 0;
  v46 = sub_1000FE314;
  v47 = &unk_1002B2F70;
  objc_copyWeak(&v50, &from);
  v48 = v73;
  id v49 = v54;
  id v51 = objc_retainBlock(&v43);
  id v22 = [(BuddyAppleIDController *)v73 signInTask];
  objc_initWeak(&v42, v22);

  id v23 = v69;
  v34 = _NSConcreteStackBlock;
  int v35 = -1073741824;
  int v36 = 0;
  v37 = sub_1000FEE00;
  v38 = &unk_1002B2FC0;
  objc_copyWeak(&v40, &from);
  objc_copyWeak(&v41, &v42);
  id v39 = v51;
  [v23 setHandler:&v34];
  id v24 = v69;
  int v27 = _NSConcreteStackBlock;
  int v28 = -1073741824;
  int v29 = 0;
  id v30 = sub_1000FF0C0;
  v31 = &unk_1002B2F98;
  id v32 = v51;
  objc_copyWeak(&v33, &v42);
  [v24 setProximityLoginHandler:&v27];
  id v25 = v69;
  objc_destroyWeak(&v33);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v39, 0);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong((id *)&v48, 0);
  objc_destroyWeak(&v50);
  objc_storeStrong(&v54, 0);
  objc_storeStrong((id *)&v60, 0);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&from);
  objc_storeStrong((id *)&v68, 0);
  objc_storeStrong(&v69, 0);
  return v25;
}

- (id)signInViewControllerForRestore
{
  v73 = self;
  location[1] = (id)a2;
  [(BuddyAppleIDController *)self setOperationType:2];
  location[0] = (id)_BYLoggingFacility();
  os_log_type_t v71 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = location[0];
    os_log_type_t v3 = v71;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Show Restore from iCloud Sign In", buf, 2u);
  }
  objc_storeStrong(location, 0);
  objc_initWeak(&from, v73);
  id v4 = [(BuddyAppleIDController *)v73 navigationController];
  os_log_type_t v5 = [(BuddyAppleIDController *)v73 passcodeCacheManager];
  id v68 = +[BuddyAppleIDSignInController federatedAuthSignInControllerInNavigationController:v4 mode:5 passcodeCacheManager:v5];

  int v6 = [(BuddyAppleIDController *)v73 existingAccountUsername];
  [v68 setUsername:v6];

  id v7 = v68;
  id v8 = +[NSBundle mainBundle];
  id v9 = [(NSBundle *)v8 localizedStringForKey:@"FORGOT_PASSWORD_QUESTION" value:&stru_1002B4E18 table:@"Localizable"];
  v62 = _NSConcreteStackBlock;
  int v63 = -1073741824;
  int v64 = 0;
  int v65 = sub_1000FFB2C;
  v66 = &unk_1002B0CA8;
  objc_copyWeak(&v67, &from);
  [v7 setiForgotText:v9 handler:&v62];

  objc_initWeak(&v61, v68);
  id v10 = v68;
  id v54 = _NSConcreteStackBlock;
  int v55 = -1073741824;
  int v56 = 0;
  int v57 = sub_1000FFBEC;
  v58 = &unk_1002B2FE8;
  objc_copyWeak(&v59, &v61);
  objc_copyWeak(&v60, &from);
  [v10 setAppearanceHandler:&v54];
  [(BuddyAppleIDController *)v73 _setLogInOptionsForBuddyAppleIDAuthMode:5 signInController:v68];
  v46 = _NSConcreteStackBlock;
  int v47 = -1073741824;
  int v48 = 0;
  id v49 = sub_1000FFCD0;
  id v50 = &unk_1002B3060;
  objc_copyWeak(&v52, &v61);
  id v51 = v73;
  id v53 = objc_retainBlock(&v46);
  id v11 = [BuddyAppleIDSignInTask alloc];
  id v12 = [(BuddyAppleIDController *)v73 featureFlags];
  id v13 = +[BuddyAccountTools sharedBuddyAccountTools];
  id v14 = [(BuddyAppleIDSignInTask *)v11 initWithFeatureFlags:v12 accountTools:v13];
  [(BuddyAppleIDController *)v73 setSignInTask:v14];

  uint64_t v15 = [(BuddyAppleIDController *)v73 signInTask];
  [(BuddyAppleIDSignInTask *)v15 setSkipDataclassEnablement:1];

  objc_super v16 = [(BuddyAppleIDController *)v73 signInTask];
  [(BuddyAppleIDSignInTask *)v16 setMakeStoreServiceActive:0];

  LOBYTE(v16) = [(BuddyAppleIDController *)v73 _isRestore];
  os_log_type_t v17 = [(BuddyAppleIDController *)v73 signInTask];
  [(BuddyAppleIDSignInTask *)v17 setRestoreFromBackupMode:v16 & 1];

  id v18 = [(BuddyAppleIDController *)v73 featureFlags];
  LOBYTE(v17) = [(BuddyFeatureFlags *)v18 isUseCDPContextSecretInsteadOfSBDSecretEnabled];

  if (v17)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v44 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [(BuddyAppleIDController *)v73 passcodeCacheManager];
      int v20 = [(BuddyAppleIDController *)v73 signInTask];
      sub_1000E4F20((uint64_t)v74, (uint64_t)"-[BuddyAppleIDController signInViewControllerForRestore]", (uint64_t)v19, (uint64_t)v20);
      _os_log_impl((void *)&_mh_execute_header, oslog, v44, "%s: Setting cache manager %@ on sign in task %@", v74, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v21 = [(BuddyAppleIDController *)v73 passcodeCacheManager];
    id v22 = [(BuddyAppleIDController *)v73 signInTask];
    [(BuddyAppleIDSignInTask *)v22 setCacheManager:v21];
  }
  id v23 = [(BuddyAppleIDController *)v73 signInTask];
  objc_initWeak(&v43, v23);

  id v24 = v68;
  int v35 = _NSConcreteStackBlock;
  int v36 = -1073741824;
  int v37 = 0;
  v38 = sub_100100760;
  id v39 = &unk_1002B2FC0;
  objc_copyWeak(&v41, &v61);
  objc_copyWeak(&v42, &v43);
  id v40 = v53;
  [v24 setHandler:&v35];
  id v25 = v68;
  int v28 = _NSConcreteStackBlock;
  int v29 = -1073741824;
  int v30 = 0;
  v31 = sub_100100A20;
  id v32 = &unk_1002B2F98;
  id v33 = v53;
  objc_copyWeak(&v34, &v43);
  [v25 setProximityLoginHandler:&v28];
  id v26 = v68;
  objc_destroyWeak(&v34);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v40, 0);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);
  objc_storeStrong(&v53, 0);
  objc_storeStrong((id *)&v51, 0);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&v60);
  objc_destroyWeak(&v59);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&v67);
  objc_storeStrong(&v68, 0);
  objc_destroyWeak(&from);
  return v26;
}

- (BOOL)shouldAllowStartOver
{
  id location[2] = self;
  location[1] = (id)a2;
  v2 = [(BuddyAppleIDController *)self navigationController];
  location[0] = [(UINavigationController *)v2 topViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = 0;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) == 0 || ([location[0] enabled] & 1) != 0;
  }
  objc_storeStrong(location, 0);
  return v5;
}

- (void)flowItemCancelled:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3 nextItem:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(BuddyAppleIDController *)v7 flowItemDone:location[0]];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4
{
  int v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyAppleIDController flowItemDone:](v6, "flowItemDone:", location[0], a4);
  objc_storeStrong(location, 0);
}

- (BOOL)controllerNeedsToRunForClass:(Class)a3
{
  os_log_type_t v3 = [(BuddyAppleIDController *)self flowItemDelegate];
  unsigned __int8 v4 = [(BFFFlowItemDelegate *)v3 controllerNeedsToRunForClass:a3];

  return v4 & 1;
}

- (BOOL)isFlowItemOnTop:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_type_t v3 = [(BuddyAppleIDController *)v7 flowItemDelegate];
  unsigned __int8 v4 = [(BFFFlowItemDelegate *)v3 isFlowItemOnTop:location[0]];

  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (id)popToBuddyControllerWithClass:(Class)a3 animated:(BOOL)a4
{
  BOOL v7 = a4;
  unsigned __int8 v4 = [(BuddyAppleIDController *)self flowItemDelegate];
  id v5 = [(BFFFlowItemDelegate *)v4 popToBuddyControllerWithClass:a3 animated:v7];

  return v5;
}

- (id)popToBuddyControllerWithClass:(Class)a3 withOffset:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v8 = a5;
  id v5 = [(BuddyAppleIDController *)self flowItemDelegate];
  id v6 = [(BFFFlowItemDelegate *)v5 popToBuddyControllerWithClass:a3 withOffset:a4 animated:v8];

  return v6;
}

- (void)pushFlowItem:(id)a3 animated:(BOOL)a4
{
  BOOL v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v6 = a4;
  id v5 = [(BuddyAppleIDController *)v8 flowItemDelegate];
  [(BFFFlowItemDelegate *)v5 pushFlowItem:location[0] animated:v6];

  objc_storeStrong(location, 0);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 animated:(BOOL)a5
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  BOOL v8 = a5;
  BOOL v7 = [(BuddyAppleIDController *)v11 flowItemDelegate];
  [(BFFFlowItemDelegate *)v7 pushFlowItem:location[0] inFlow:v9 animated:v8];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  BOOL v10 = a6;
  id v9 = [(BuddyAppleIDController *)v13 flowItemDelegate];
  [(BFFFlowItemDelegate *)v9 pushFlowItem:location[0] inFlow:v11 withExtendedInitialization:a5 animated:v10];

  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6 willPushFlowItem:(id)a7
{
  os_log_type_t v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  BOOL v14 = a5;
  BOOL v13 = a6;
  id v12 = 0;
  objc_storeStrong(&v12, a7);
  id v11 = [(BuddyAppleIDController *)v17 flowItemDelegate];
  [(BFFFlowItemDelegate *)v11 pushFlowItem:location[0] inFlow:v15 withExtendedInitialization:v14 animated:v13 willPushFlowItem:v12];

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)removeViewControllersOnNextPush:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_type_t v3 = [(BuddyAppleIDController *)v5 flowItemDelegate];
  [(BFFFlowItemDelegate *)v3 removeViewControllersOnNextPush:location[0]];

  objc_storeStrong(location, 0);
}

- (void)markFlowItemDone:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_type_t v3 = [(BuddyAppleIDController *)v5 flowItemDelegate];
  [(BFFFlowItemDelegate *)v3 markFlowItemDone:location[0]];

  objc_storeStrong(location, 0);
}

- (void)buddyAppleIDSpinnerPageDidAppear:(id)a3
{
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004BB7C((uint64_t)buf, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, v19, "Spinner page %{public}@ appeared", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v18 = +[NSValue valueWithPointer:location[0]];
  os_log_type_t v3 = [(BuddyAppleIDController *)v22 spinnerAppearanceHandlers];
  id v17 = [(NSMutableDictionary *)v3 objectForKey:v18];

  if (v17)
  {
    os_log_t v16 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v4 = v16;
      os_log_type_t v5 = v15;
      sub_10004B24C(v14);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Spinner page matched!", v14, 2u);
    }
    objc_storeStrong((id *)&v16, 0);
    BOOL v6 = [(BuddyAppleIDController *)v22 spinnerAppearanceHandlers];
    [(NSMutableDictionary *)v6 removeObjectForKey:v18];

    (*((void (**)(void))v17 + 2))();
  }
  else
  {
    os_log_t v13 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = v13;
      os_log_type_t v8 = v12;
      sub_10004B24C(v11);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Spinner page had no handler!", (uint8_t *)v11, 2u);
    }
    objc_storeStrong((id *)&v13, 0);
    id v9 = [(BuddyAppleIDController *)v22 navigationController];
    id v10 = [(UINavigationController *)v9 popViewControllerAnimated:1];
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  if ([(BuddyAppleIDController *)v9 countOfResponsibilityViewControllerPushSessions])
  {
    BOOL v6 = [(BuddyAppleIDController *)v9 responsibilityViewControllers];
    [(NSPointerArray *)v6 addPointer:v7];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_isRestore
{
  unint64_t v2 = [(BuddyAppleIDController *)self operationType];
  if (v2 < 2) {
    goto LABEL_4;
  }
  if (v2 == 2)
  {
    char v4 = 1;
    return v4 & 1;
  }
  if (v2 - 3 <= 1) {
LABEL_4:
  }
    char v4 = 0;
  return v4 & 1;
}

- (void)_showTwoAccountsiTunesSignInController
{
  id v24 = self;
  v23[1] = (id)a2;
  unint64_t v2 = [(BuddyAppleIDController *)self navigationController];
  os_log_type_t v3 = [(BuddyAppleIDController *)v24 passcodeCacheManager];
  v23[0] = +[BuddyAppleIDSignInController federatedAuthSignInControllerInNavigationController:v2 mode:3 passcodeCacheManager:v3];

  id v4 = [v23[0] navigationItem];
  [v4 setHidesBackButton:1];

  if ((id)[(BuddyAppleIDController *)v24 existingAccountType] == (id)2)
  {
    os_log_type_t v5 = [(BuddyAppleIDController *)v24 existingAccountUsername];
    [v23[0] setUsername:v5];
  }
  objc_initWeak(&location, v23[0]);
  id v6 = v23[0];
  os_log_type_t v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  id v18 = sub_100101920;
  os_log_type_t v19 = &unk_1002B1408;
  objc_copyWeak(&v21, &location);
  int v20 = v24;
  [v6 setAppearanceHandler:&v15];
  id v7 = v23[0];
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_100101A98;
  os_log_type_t v12 = &unk_1002B2ED0;
  os_log_t v13 = v24;
  objc_copyWeak(v14, &location);
  [v7 setHandler:&v9];
  os_log_type_t v8 = [(BuddyAppleIDController *)v24 navigationController];
  [(UINavigationController *)v8 pushViewController:v23[0] animated:1];

  objc_destroyWeak(v14);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong((id *)&v20, 0);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  objc_storeStrong(v23, 0);
}

- (void)_showProximityiCloudSignInController:(id)a3
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_type_t v3 = [(BuddyAppleIDController *)v18 navigationController];
  id v4 = [(BuddyAppleIDController *)v18 signInTask];
  [(BuddyAppleIDSignInTask *)v4 setNavigationController:v3];

  id v16 = (id)_BYLoggingFacility();
  os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    os_log_type_t v5 = v16;
    os_log_type_t v6 = v15;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Starting proximity authentication.", buf, 2u);
  }
  objc_storeStrong(&v16, 0);
  id v7 = [(BuddyAppleIDController *)v18 signInTask];
  os_log_type_t v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = sub_100102C2C;
  os_log_type_t v12 = &unk_1002B2EA8;
  id v13 = location[0];
  [(BuddyAppleIDSignInTask *)v7 authenticateWithProximity:&v8];

  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)_showTwoAccountsiCloudSignInController
{
  id v23 = self;
  v22[1] = (id)a2;
  [(BuddyAppleIDController *)self setOperationType:1];
  unint64_t v2 = [(BuddyAppleIDController *)v23 navigationController];
  os_log_type_t v3 = [(BuddyAppleIDController *)v23 passcodeCacheManager];
  v22[0] = +[BuddyAppleIDSignInController federatedAuthSignInControllerInNavigationController:v2 mode:2 passcodeCacheManager:v3];

  id v4 = [(BuddyAppleIDController *)v23 existingAccountUsername];
  [v22[0] setUsername:v4];

  objc_initWeak(&location, v22[0]);
  id v5 = v22[0];
  BOOL v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  int v17 = sub_100103170;
  id v18 = &unk_1002B1408;
  objc_copyWeak(&v20, &location);
  os_log_type_t v19 = v23;
  [v5 setAppearanceHandler:&v14];
  id v6 = v22[0];
  os_log_type_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  int v10 = sub_1001031D4;
  id v11 = &unk_1002B2ED0;
  os_log_type_t v12 = v23;
  objc_copyWeak(v13, &location);
  [v6 setHandler:&v8];
  id v7 = [(BuddyAppleIDController *)v23 navigationController];
  [(UINavigationController *)v7 pushViewController:v22[0] animated:1];

  [(BuddyAppleIDController *)v23 setTwoAccountsiCloudSignInController:v22[0]];
  objc_destroyWeak(v13);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong((id *)&v19, 0);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  objc_storeStrong(v22, 0);
}

- (void)_appleIDControllerCompletedShouldProceed:(BOOL)a3 error:(id)a4
{
  int v36 = self;
  SEL v35 = a2;
  BOOL v34 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v4 = [location domain];
  BOOL v5 = 1;
  if ([v4 isEqualToString:AKAppleIDAuthenticationErrorDomain]) {
    BOOL v5 = [location code] != (id)-7003;
  }

  if (v5)
  {
    id v32 = (id)_BYLoggingFacility();
    os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
    {
      if (v34) {
        CFStringRef v6 = @"YASE";
      }
      else {
        CFStringRef v6 = @"NERP";
      }
      char v29 = 0;
      char v27 = 0;
      if (_BYIsInternalInstall())
      {
        id v7 = (NSString *)location;
      }
      else if (location)
      {
        id v30 = [location domain];
        char v29 = 1;
        id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v30, [location code]);
        id v28 = v7;
        char v27 = 1;
      }
      else
      {
        id v7 = 0;
      }
      sub_10004CECC((uint64_t)buf, (uint64_t)v6, (uint64_t)v7);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v32, v31, "Auth finished, shouldProceed = %{public}@, error = %{public}@", buf, 0x16u);
      if (v27) {

      }
      if (v29) {
    }
      }
    objc_storeStrong(&v32, 0);
  }
  id v8 = +[BYAppleIDAccountsManager sharedManager];
  [v8 clearStoredLoginContext];

  if (v34)
  {
    os_log_type_t v12 = [(BuddyAppleIDController *)v36 delegate];
    [(BuddyAppleIDControllerDelegate *)v12 appleIDControllerFinished:v36];
  }
  else if ((BYSetupAssistantHasCompletedInitialRun() & 1) == 0)
  {
    id v25 = (id)objc_opt_new();
    id v24 = [v25 aa_primaryAppleAccount];
    if (v24)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [v24 aa_primaryEmail];
        sub_10004B238((uint64_t)v37, (uint64_t)v21);
        _os_log_impl((void *)&_mh_execute_header, oslog, v22, "Removing primary account '%@' due to failure", v37, 0xCu);

        objc_storeStrong(&v21, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    uint64_t v9 = [(BuddyAppleIDController *)v36 navigationController];
    int v10 = [(UINavigationController *)v9 topViewController];
    id v20 = [(UIViewController *)v10 view];

    [v20 setUserInteractionEnabled:0];
    id v11 = +[BuddyAccountTools sharedBuddyAccountTools];
    id v13 = _NSConcreteStackBlock;
    int v14 = -1073741824;
    int v15 = 0;
    int v16 = sub_1001045FC;
    int v17 = &unk_1002B3178;
    id v18 = v20;
    os_log_type_t v19 = v36;
    [v11 removePrimaryAccountCompletion:&v13];

    objc_storeStrong((id *)&v19, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
  }
  else
  {
    [(BuddyAppleIDController *)v36 _popBackToAuthAttemptLandingPage];
  }
  objc_storeStrong(&location, 0);
}

- (void)_authCompletedShouldProceed:(BOOL)a3 error:(id)a4
{
  char v29 = self;
  SEL v28 = a2;
  BOOL v27 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_100104A0C((uint64_t)buf, (uint64_t)"-[BuddyAppleIDController _authCompletedShouldProceed:error:]", v27, (uint64_t)location);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "%s shouldProceed = %d, error = %@", buf, 0x1Cu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v4 = +[BYAppleIDAccountsManager sharedManager];
  [v4 clearStoredLoginContext];

  if (v27)
  {
    BOOL v5 = [(BuddyAppleIDController *)v29 delegate];
    [(BuddyAppleIDControllerDelegate *)v5 appleIDControllerFinished:v29];
  }
  else
  {
    CFStringRef v6 = [(BuddyAppleIDController *)v29 delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(BuddyAppleIDController *)v29 delegate];
      [(BuddyAppleIDControllerDelegate *)v8 appleIDController:v29 failedWithError:location];
    }
    else
    {
      uint64_t v9 = [(BuddyAppleIDController *)v29 authAttemptLandingViewController];

      if (v9)
      {
        int v10 = [(BuddyAppleIDController *)v29 navigationController];
        id v11 = [(UINavigationController *)v10 viewControllers];
        os_log_type_t v12 = [(BuddyAppleIDController *)v29 authAttemptLandingViewController];
        char v23 = 0;
        char v21 = 0;
        char v19 = 0;
        char v17 = 0;
        BOOL v13 = 0;
        if ([(NSArray *)v11 containsObject:v12])
        {
          id v24 = [(BuddyAppleIDController *)v29 navigationController];
          char v23 = 1;
          os_log_type_t v22 = [(UINavigationController *)v24 viewControllers];
          char v21 = 1;
          id v20 = (UIViewController *)[(NSArray *)v22 lastObject];
          char v19 = 1;
          id v18 = [(BuddyAppleIDController *)v29 authAttemptLandingViewController];
          char v17 = 1;
          BOOL v13 = v20 != v18;
        }
        if (v17) {

        }
        if (v19) {
        if (v21)
        }

        if (v23) {
        if (v13)
        }
        {
          int v14 = [(BuddyAppleIDController *)v29 navigationController];
          int v15 = [(BuddyAppleIDController *)v29 authAttemptLandingViewController];
          id v16 = [(UINavigationController *)v14 popToViewController:v15 animated:1];
        }
        [(BuddyAppleIDController *)v29 setAuthAttemptLandingViewController:0];
      }
    }
  }
  objc_storeStrong(&location, 0);
}

- (void)_signInSucceeded
{
  os_log_type_t v12 = self;
  v11[1] = (id)a2;
  if ((id)[(BuddyAppleIDController *)self operationType] == (id)1)
  {
    unint64_t v2 = [(BuddyAppleIDController *)v12 runState];
    char v3 = [(BYRunState *)v2 hasCompletedInitialRun] ^ 1;

    if (v3)
    {
      id v4 = dispatch_get_global_queue(25, 0);
      block = _NSConcreteStackBlock;
      int v7 = -1073741824;
      int v8 = 0;
      uint64_t v9 = sub_100104B8C;
      int v10 = &unk_1002B0D20;
      v11[0] = v12;
      dispatch_async(v4, &block);

      objc_storeStrong(v11, 0);
    }
  }
  BOOL v5 = [(BuddyAppleIDController *)v12 delegate];
  [(BuddyAppleIDControllerDelegate *)v5 appleIDControllerFinished:v12];
}

- (void)_signInFailedWithError:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v3 = [(BuddyAppleIDController *)v11 delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    BOOL v5 = [(BuddyAppleIDController *)v11 delegate];
    [(BuddyAppleIDControllerDelegate *)v5 appleIDController:v11 failedWithError:location[0]];
  }
  else
  {
    CFStringRef v6 = [(BuddyAppleIDController *)v11 authAttemptLandingViewController];

    if (v6)
    {
      int v7 = [(BuddyAppleIDController *)v11 navigationController];
      int v8 = [(BuddyAppleIDController *)v11 authAttemptLandingViewController];
      id v9 = [(UINavigationController *)v7 popToViewController:v8 animated:1];

      [(BuddyAppleIDController *)v11 setAuthAttemptLandingViewController:0];
    }
  }
  objc_storeStrong(location, 0);
}

- (void)_createMeCard
{
  v33[2] = self;
  v33[1] = (id)a2;
  v33[0] = objc_alloc_init((Class)CNContactStore);
  id location = (id)_BYLoggingFacility();
  char v31 = 16;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
  {
    unint64_t v2 = location;
    os_log_type_t v3 = v31;
    sub_10004B24C(buf);
    _os_log_error_impl((void *)&_mh_execute_header, v2, v3, "Creating Me card...", buf, 2u);
  }
  objc_storeStrong(&location, 0);
  if (v33[0])
  {
    id v29 = objc_alloc_init((Class)ACAccountStore);
    id v28 = [v29 aa_primaryAppleAccount];
    id v27 = 0;
    char v26 = 0;
    id v4 = v33[0];
    id v5 = [v28 aa_firstName];
    id v6 = [v28 aa_lastName];
    id v7 = [v28 aa_primaryEmail];
    id obj = 0;
    LOBYTE(v4) = [v4 setBestMeIfNeededForGivenName:v5 familyName:v6 email:v7 error:&obj];
    objc_storeStrong(&v27, obj);

    char v26 = v4 & 1;
    if (v4)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = oslog;
        os_log_type_t v9 = v23;
        sub_10004B24C(v22);
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Successfully created Me card", v22, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    else if (v27)
    {
      os_log_t v21 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        char v18 = 0;
        char v16 = 0;
        if (_BYIsInternalInstall())
        {
          int v10 = (NSString *)v27;
        }
        else if (v27)
        {
          id v19 = [v27 domain];
          char v18 = 1;
          int v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v19, [v27 code]);
          id v17 = v10;
          char v16 = 1;
        }
        else
        {
          int v10 = 0;
        }
        sub_10004BB7C((uint64_t)v34, (uint64_t)v10);
        _os_log_error_impl((void *)&_mh_execute_header, v21, v20, "Failed to create Me card: %{public}@", v34, 0xCu);
        if (v16) {

        }
        if (v18) {
      }
        }
      objc_storeStrong((id *)&v21, 0);
    }
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
  }
  else
  {
    os_log_t v15 = (os_log_t)(id)_BYLoggingFacility();
    char v14 = 16;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v11 = v15;
      os_log_type_t v12 = v14;
      sub_10004B24C(v13);
      _os_log_error_impl((void *)&_mh_execute_header, v11, v12, "Failed to create contact store to create Me card", v13, 2u);
    }
    objc_storeStrong((id *)&v15, 0);
  }
  objc_storeStrong(v33, 0);
}

- (void)_nameDevice
{
  v16[2] = self;
  v16[1] = (id)a2;
  v16[0] = objc_alloc_init((Class)ACAccountStore);
  id v15 = [v16[0] aa_primaryAppleAccount];
  id v14 = [v15 aa_firstName];
  if ((BYSetupAssistantHasCompletedInitialRun() & 1) == 0 && [v14 length])
  {
    id v18 = (id)MGCopyAnswer();
    id v13 = v18;
    if (lockdown_connect())
    {
      id v17 = (id)MGCopyAnswer();
      id v11 = v17;
      if ([v13 length] && (objc_msgSend(v13, "isEqualToString:", v11) & 1) != 0)
      {
        id v10 = v14;
        if ([v14 _containsCJKScriptsOnly])
        {
          id location = [v15 aa_lastName];
          if ([location length]
            && ([location _containsCJKScriptsOnly] & 1) != 0)
          {
            id v2 = [location stringByAppendingString:v14];
            id v3 = v10;
            id v10 = v2;
          }
          objc_storeStrong(&location, 0);
        }
        id v4 = +[NSBundle mainBundle];
        id v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"DEVICE_NAME"];
        id v6 = [(NSBundle *)v4 localizedStringForKey:v5 value:&stru_1002B4E18 table:@"Localizable"];
        id v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v10);

        os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          sub_10004B238((uint64_t)buf, (uint64_t)v8);
          _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Setting device name to '%@'", buf, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        lockdown_set_value();
        objc_storeStrong(&v8, 0);
        objc_storeStrong(&v10, 0);
      }
      lockdown_disconnect();
      objc_storeStrong(&v11, 0);
    }
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
}

- (void)_beginPostUpgradeAppleIDLoginWithUsername:(id)a3 password:(id)a4 signInController:(id)a5
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v7 = 0;
  objc_storeStrong(&v7, a5);
  [(BuddyAppleIDController *)v10 _beginPostUpgradeAppleIDLoginWithUsername:location[0] password:v8 continuationKey:0 signInController:v7];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)_beginPostUpgradeAppleIDLoginWithUsername:(id)a3 password:(id)a4 continuationKey:(id)a5 signInController:(id)a6
{
  id v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v28 = 0;
  objc_storeStrong(&v28, a4);
  id v27 = 0;
  objc_storeStrong(&v27, a5);
  id v26 = 0;
  objc_storeStrong(&v26, a6);
  if (location[0] && (v28 || v27))
  {
    os_log_type_t v9 = [(BuddyAppleIDController *)v30 navigationController];
    id v10 = [(BuddyAppleIDController *)v30 passcodeCacheManager];
    id v11 = +[BuddyAppleIDAuthManager managerWithNavigationController:v9 passcodeCacheManager:v10];
    [(BuddyAppleIDController *)v30 setAuthManager:v11];

    os_log_type_t v12 = [(BuddyAppleIDController *)v30 authManager];
    [(BuddyAppleIDAuthManager *)v12 setShouldOfferSecurityUpgrade:1];

    id v13 = [(BuddyAppleIDController *)v30 authManager];
    id v14 = [(BuddyAppleIDController *)v30 accountToUpgrade];
    [(BuddyAppleIDAuthManager *)v13 setAccountToUpgrade:v14];

    id v15 = [(BuddyAppleIDController *)v30 authManager];
    [(BuddyAppleIDAuthManager *)v15 setHasContinuationKey:v27 != 0];

    char v16 = [(BuddyAppleIDController *)v30 authManager];
    id v17 = v26;
    id v18 = location[0];
    id v19 = v28;
    os_log_type_t v20 = _NSConcreteStackBlock;
    int v21 = -1073741824;
    int v22 = 0;
    os_log_type_t v23 = sub_1001057F0;
    id v24 = &unk_1002B2EA8;
    id v25 = v30;
    [(BuddyAppleIDAuthManager *)v16 authenticateWithSignInController:v17 username:v18 password:v19 completion:&v20];

    objc_storeStrong((id *)&v25, 0);
  }
  else
  {
    [(BuddyAppleIDController *)v30 _authCompletedShouldProceed:1 error:0];
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

- (void)_upgradeAccountWithAuthenticationResults:(id)a3 completion:(id)a4
{
  int v45 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v43 = 0;
  objc_storeStrong(&v43, a4);
  id v5 = [BuddyAppleIDSignInTask alloc];
  id v6 = [(BuddyAppleIDController *)v45 featureFlags];
  id v7 = +[BuddyAccountTools sharedBuddyAccountTools];
  id v8 = [(BuddyAppleIDSignInTask *)v5 initWithFeatureFlags:v6 accountTools:v7];
  [(BuddyAppleIDController *)v45 setSignInTask:v8];

  os_log_type_t v9 = [(BuddyAppleIDController *)v45 navigationController];
  id v10 = [(BuddyAppleIDController *)v45 signInTask];
  [(BuddyAppleIDSignInTask *)v10 setNavigationController:v9];

  id v11 = [(BuddyAppleIDController *)v45 signInTask];
  [(BuddyAppleIDSignInTask *)v11 setSkipDataclassEnablement:1];

  LOBYTE(v11) = [(BuddyAppleIDController *)v45 _isRestore];
  os_log_type_t v12 = [(BuddyAppleIDController *)v45 signInTask];
  [(BuddyAppleIDSignInTask *)v12 setRestoreFromBackupMode:v11 & 1];

  id v13 = [(BuddyAppleIDController *)v45 featureFlags];
  LOBYTE(v12) = [(BuddyFeatureFlags *)v13 isUseCDPContextSecretInsteadOfSBDSecretEnabled];

  if (v12)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v41 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(BuddyAppleIDController *)v45 passcodeCacheManager];
      id v15 = [(BuddyAppleIDController *)v45 signInTask];
      sub_1000E4F20((uint64_t)buf, (uint64_t)"-[BuddyAppleIDController _upgradeAccountWithAuthenticationResults:completion:]", (uint64_t)v14, (uint64_t)v15);
      _os_log_impl((void *)&_mh_execute_header, oslog, v41, "%s: Setting cache manager %@ on sign in task %@", buf, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
    char v16 = [(BuddyAppleIDController *)v45 passcodeCacheManager];
    id v17 = [(BuddyAppleIDController *)v45 signInTask];
    [(BuddyAppleIDSignInTask *)v17 setCacheManager:v16];
  }
  id v18 = [BuddyAppleIDSpinnerPage alloc];
  id v40 = [(BuddyAppleIDSpinnerPage *)v18 initWithAccountMode:[(BuddyAppleIDController *)v45 operationType]];
  id v19 = [(BuddyAppleIDController *)v45 navigationController];
  [(UINavigationController *)v19 pushViewController:v40 animated:1];

  os_log_t v39 = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    os_log_type_t v20 = v39;
    os_log_type_t v21 = v38;
    sub_10004B24C(v37);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Beginning sign-in...", v37, 2u);
  }
  objc_storeStrong((id *)&v39, 0);
  id v36 = +[NSMutableArray arrayWithObject:AIDAServiceTypeCloud];
  id v35 = +[ACAccountStore ams_sharedAccountStore];
  id v22 = [location[0] objectForKeyedSubscript:AKAuthenticationAlternateDSIDKey];
  id v23 = [v35 ams_activeiTunesAccount];
  id v24 = [v23 aa_altDSID];
  unsigned __int8 v25 = [v22 isEqualToString:v24];

  if (v25) {
    [v36 addObject:AIDAServiceTypeStore];
  }
  [(BuddyAppleIDController *)v45 _willStartResponsibilityViewControllerPushSession];
  id v26 = [(BuddyAppleIDController *)v45 signInTask];
  id v27 = location[0];
  id v28 = _NSConcreteStackBlock;
  int v29 = -1073741824;
  int v30 = 0;
  char v31 = sub_1001060F8;
  id v32 = &unk_1002B31E8;
  id v33 = v45;
  id v34 = v43;
  [(BuddyAppleIDSignInTask *)v26 signInToServices:v36 authenticationResults:v27 completion:&v28];

  objc_storeStrong(&v34, 0);
  objc_storeStrong((id *)&v33, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
}

- (void)_loadSecurityUpgradeUI
{
  id v10 = self;
  v9[1] = (id)a2;
  [(BuddyAppleIDController *)self setAssumeResponsibilityForRUIPage:1];
  [(BuddyAppleIDController *)v10 _setupAccountForSecurityUpgrade];
  v9[0] = [(BuddyAppleIDController *)v10 _authenticationContextForSecurityUpgrade];
  id location = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  id v2 = _NSConcreteStackBlock;
  int v3 = -1073741824;
  int v4 = 0;
  id v5 = sub_10010652C;
  id v6 = &unk_1002B2EA8;
  id v7 = v10;
  [location authenticateWithContext:v9[0] completion:&v2];
  objc_storeStrong((id *)&v7, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v9, 0);
}

- (id)_authenticationContextForSecurityUpgrade
{
  id v17 = self;
  v16[1] = (id)a2;
  v16[0] = objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
  id v2 = [(BuddyAppleIDController *)v17 navigationController];
  [v16[0] setPresentingViewController:v2];

  int v3 = +[AKAccountManager sharedInstance];
  int v4 = [(BuddyAppleIDController *)v17 accountToUpgrade];
  id v5 = [(AKAccountManager *)v3 altDSIDForAccount:v4];
  [v16[0] setAltDSID:v5];

  id v6 = [(BuddyAppleIDController *)v17 accountToUpgrade];
  id v7 = [(ACAccount *)v6 username];
  [v16[0] setUsername:v7];

  [v16[0] setIsUsernameEditable:0];
  [v16[0] setAppProvidedContext:AKAppleIDAuthenticationAppProvidedContextAuthless];
  [v16[0] setNeedsSecurityUpgradeUI:1];
  [v16[0] setShouldOfferSecurityUpgrade:1];
  [v16[0] setForceInlinePresentation:1];
  if ([(BuddyAppleIDController *)v17 accountToUpgradeIsPrimary])
  {
    if (+[BYWarranty shouldDisplay])
    {
      id v8 = [v16[0] httpHeadersForRemoteUI];
      id v9 = [v8 mutableCopy];
      id v10 = v9;
      char v13 = 0;
      if (!v9)
      {
        id v9 = (id)objc_opt_new();
        id v14 = v9;
        char v13 = 1;
      }
      id location = v9;
      if (v13) {

      }
      [location setObject:@"true" forKey:@"X-MMe-Show-Warranty"];
      [v16[0] setHttpHeadersForRemoteUI:location];
      objc_storeStrong(&location, 0);
    }
    [v16[0] setAnticipateEscrowAttempt:1];
    [v16[0] setShouldRequestConfigurationInfo:1];
  }
  id v11 = v16[0];
  objc_storeStrong(v16, 0);
  return v11;
}

- (void)_setupAccountForSecurityUpgrade
{
  id v11 = self;
  v10[1] = (id)a2;
  v10[0] = [(BuddyAppleIDController *)self accountToUpgrade];
  id v2 = +[AKAccountManager sharedInstance];
  id v9 = [(AKAccountManager *)v2 altDSIDForAccount:v10[0]];

  int v3 = +[AKAccountManager sharedInstance];
  id location = [(AKAccountManager *)v3 primaryAuthKitAccount];

  int v4 = +[AKAccountManager sharedInstance];
  id v5 = [(AKAccountManager *)v4 altDSIDForAccount:location];
  -[BuddyAppleIDController setAccountToUpgradeIsPrimary:](v11, "setAccountToUpgradeIsPrimary:", (unint64_t)[v9 isEqualToString:v5] & 1);

  if ([(BuddyAppleIDController *)v11 accountToUpgradeIsPrimary])
  {
    id v6 = +[BuddyAccountTools sharedBuddyAccountTools];
    id v7 = [v6 primaryAccount];
    [(BuddyAppleIDController *)v11 setAccountToUpgrade:v7];
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(v10, 0);
}

- (void)_showSpinnerPageWithIdentifier:(id)a3 handler:(id)a4
{
  char v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v10 = [(BuddyAppleIDController *)v13 navigationController];
  id v5 = [v10 topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    (*((void (**)(void))v11 + 2))();
  }
  else
  {
    id v7 = [BuddyAppleIDSpinnerPage alloc];
    id v8 = [(BuddyAppleIDSpinnerPage *)v7 initWithAccountMode:[(BuddyAppleIDController *)v13 operationType]];
    -[BuddyAppleIDController _showSpinnerPage:appearanceHandler:](v13, "_showSpinnerPage:appearanceHandler:", v8, v11, v8);
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)_showSpinnerPage:(id)a3 appearanceHandler:(id)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong((id *)&v8, a4);
  id v5 = [(BuddyAppleIDController *)v10 navigationController];
  id v6 = [(UINavigationController *)v5 topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8[2]();
  }
  else
  {
    [(BuddyAppleIDController *)v10 _setAppearanceHandler:v8 forSpinnerPage:location[0]];
    [location[0] setSpinnerDelegate:v10];
    [(BuddyAppleIDController *)v10 _pushNextViewController:location[0]];
  }
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)_pushNextViewController:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v3 = [(BuddyAppleIDController *)v8 navigationController];
  id v6 = [(UINavigationController *)v3 topViewController];

  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(UIViewController *)v6 controllerAllowsNavigatingBack] & 1) == 0)
  {
    id v4 = [location[0] navigationItem];
    [v4 setHidesBackButton:1];
  }
  id v5 = [(BuddyAppleIDController *)v8 navigationController];
  [(UINavigationController *)v5 pushViewController:location[0] animated:1];

  objc_storeStrong((id *)&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)_setAppearanceHandler:(id)a3 forSpinnerPage:(id)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  if (location[0])
  {
    id v5 = [(BuddyAppleIDController *)v14 spinnerAppearanceHandlers];
    BOOL v6 = v5 == 0;

    if (v6)
    {
      id v7 = objc_alloc_init((Class)NSMutableDictionary);
      [(BuddyAppleIDController *)v14 setSpinnerAppearanceHandlers:v7];
    }
    id v10 = +[NSValue valueWithPointer:v12];
    id v8 = objc_retainBlock(location[0]);
    id v9 = [(BuddyAppleIDController *)v14 spinnerAppearanceHandlers];
    [(NSMutableDictionary *)v9 setObject:v8 forKeyedSubscript:v10];

    [v12 setSpinnerDelegate:v14];
    objc_storeStrong((id *)&v10, 0);
    int v11 = 0;
  }
  else
  {
    int v11 = 1;
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)_popBackToAuthAttemptLandingPage
{
  id v14 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    id v2 = [(BuddyAppleIDController *)v14 authAttemptLandingViewController];
    int v3 = [(BuddyAppleIDController *)v14 navigationController];
    id v4 = [(UINavigationController *)v3 topViewController];
    sub_100051470((uint64_t)buf, (uint64_t)v2, (uint64_t)v4);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEBUG, "Auth attempt landing = %@, top view controller = %@", buf, 0x16u);
  }
  objc_storeStrong((id *)oslog, 0);
  id v5 = [(BuddyAppleIDController *)v14 authAttemptLandingViewController];

  if (v5)
  {
    BOOL v6 = [(BuddyAppleIDController *)v14 navigationController];
    id v7 = [(UINavigationController *)v6 viewControllers];
    id v8 = [(BuddyAppleIDController *)v14 authAttemptLandingViewController];
    unsigned __int8 v9 = [(NSArray *)v7 containsObject:v8];

    if (v9)
    {
      id v10 = [(BuddyAppleIDController *)v14 navigationController];
      int v11 = [(BuddyAppleIDController *)v14 authAttemptLandingViewController];
      id v12 = [(UINavigationController *)v10 popToViewController:v11 animated:1];
    }
    [(BuddyAppleIDController *)v14 setAuthAttemptLandingViewController:0];
  }
}

- (void)_removeBackToViewControllerMatchingBlock:(id)a3 withOffset:(int64_t)a4
{
  char v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v14 = a4;
  char v13 = 0;
  id v12 = (id)objc_opt_new();
  id v5 = [(BuddyAppleIDController *)v16 navigationController];
  id v11 = [(UINavigationController *)v5 viewControllers];

  if ((unint64_t)[v11 count] > v14)
  {
    for (unint64_t i = (char *)[v11 count]; (uint64_t)i > 0; --i)
    {
      BOOL v6 = (uint64_t (**)(id, id))location[0];
      id v7 = [v11 objectAtIndexedSubscript:i];
      LOBYTE(v6) = v6[2](v6, v7) ^ 1;

      if ((v6 & 1) == 0)
      {
        char v13 = 1;
        break;
      }
      id v8 = [v11 objectAtIndexedSubscript:i];
      [v12 addObject:v8];
    }
    if (v13)
    {
      unsigned __int8 v9 = [(BuddyAppleIDController *)v16 flowItemDelegate];
      [(BFFFlowItemDelegate *)v9 removeViewControllersOnNextPush:v12];
    }
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)_setLogInOptionsForBuddyAppleIDAuthMode:(int)a3 signInController:(id)a4
{
  id v43 = self;
  SEL v42 = a2;
  int v41 = a3;
  objc_initWeak(&location, a4);
  id v39 = v43;
  char v38 = [(BuddyAppleIDController *)v43 hasProximityConnection];
  char v37 = +[AKFeatureManager isProxAuthEnabled] & 1;
  char v36 = 0;
  char v4 = 0;
  if ((v38 & 1) == 0) {
    char v4 = v37;
  }
  char v36 = v4;
  if (v41 == 1 || v41 == 5 || v41 == 4)
  {
    if (v41 == 1)
    {
      if (v36)
      {
        id v5 = objc_loadWeakRetained(&location);
        id v26 = _NSConcreteStackBlock;
        int v27 = -1073741824;
        int v28 = 0;
        int v29 = sub_10010806C;
        int v30 = &unk_1002B3210;
        id v31 = v39;
        objc_copyWeak(&v32, &location);
        [v5 setLoginOptionsConstructor:&v26];

        objc_destroyWeak(&v32);
        objc_storeStrong(&v31, 0);
      }
      else
      {
        os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          sub_10004F3FC((uint64_t)v46, v41, [(BuddyAppleIDController *)v43 hasProximityConnection]);
          _os_log_impl((void *)&_mh_execute_header, oslog, v24, "Not showing Apple ID Proximity Login for auth mode %i, in prox flow %i", v46, 0xEu);
        }
        objc_storeStrong((id *)&oslog, 0);
        id v6 = objc_loadWeakRetained(&location);
        id v18 = _NSConcreteStackBlock;
        int v19 = -1073741824;
        int v20 = 0;
        os_log_type_t v21 = sub_100108680;
        id v22 = &unk_1002B3238;
        id v23 = v39;
        [v6 setLoginOptionsConstructor:&v18];

        objc_storeStrong(&v23, 0);
      }
      goto LABEL_27;
    }
    if ((v41 - 2) < 2) {
      goto LABEL_24;
    }
    if ((v41 - 4) < 2)
    {
      if (v36)
      {
        id v7 = objc_loadWeakRetained(&location);
        id v11 = _NSConcreteStackBlock;
        int v12 = -1073741824;
        int v13 = 0;
        unint64_t v14 = sub_1001087C8;
        id v15 = &unk_1002B3210;
        id v16 = v39;
        objc_copyWeak(&v17, &location);
        [v7 setLoginOptionsConstructor:&v11];

        objc_destroyWeak(&v17);
        objc_storeStrong(&v16, 0);
      }
      else
      {
        os_log_t v10 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          sub_10004F3FC((uint64_t)v45, v41, [(BuddyAppleIDController *)v43 hasProximityConnection]);
          _os_log_impl((void *)&_mh_execute_header, v10, v9, "Not showing Apple ID Proximity Login for auth mode %i, in prox flow %i", v45, 0xEu);
        }
        objc_storeStrong((id *)&v10, 0);
      }
      goto LABEL_27;
    }
    if ((v41 - 6) < 3)
    {
LABEL_24:
      os_log_t v8 = (os_log_t)(id)_BYLoggingFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        sub_10005A060(v44, v41);
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not elegible for Proximity Login with auth mode %i", v44, 8u);
      }
      objc_storeStrong((id *)&v8, 0);
    }
LABEL_27:
    int v33 = 0;
    goto LABEL_28;
  }
  id v35 = (id)_BYLoggingFacility();
  os_log_type_t v34 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
  {
    sub_10005A060(buf, v41);
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v35, v34, "_setLogInOptionsForBuddyAppleIDAuthMode called for unsupported auth mode %i", buf, 8u);
  }
  objc_storeStrong(&v35, 0);
  int v33 = 1;
LABEL_28:
  objc_storeStrong(&v39, 0);
  objc_destroyWeak(&location);
}

- (BuddyAppleIDControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BuddyAppleIDControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setFlowItemDelegate:(id)a3
{
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(unint64_t)a3
{
  self->_operationType = a3;
}

- (UIViewController)authAttemptLandingViewController
{
  return self->_authAttemptLandingViewController;
}

- (void)setAuthAttemptLandingViewController:(id)a3
{
}

- (BOOL)hasProximityConnection
{
  return self->_hasProximityConnection;
}

- (void)setHasProximityConnection:(BOOL)a3
{
  self->_hasProximityConnection = a3;
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

- (ACAccount)accountToUpgrade
{
  return self->_accountToUpgrade;
}

- (void)setAccountToUpgrade:(id)a3
{
}

- (BOOL)accountToUpgradeIsPrimary
{
  return self->_accountToUpgradeIsPrimary;
}

- (void)setAccountToUpgradeIsPrimary:(BOOL)a3
{
  self->_accountToUpgradeIsPrimary = a3;
}

- (NSString)existingAccountUsername
{
  return self->_existingAccountUsername;
}

- (void)setExistingAccountUsername:(id)a3
{
}

- (unint64_t)existingAccountType
{
  return self->_existingAccountType;
}

- (void)setExistingAccountType:(unint64_t)a3
{
  self->_existingAccountType = a3;
}

- (BuddyAppleIDSignInTask)signInTask
{
  return self->_signInTask;
}

- (void)setSignInTask:(id)a3
{
}

- (UINavigationController)modalNavigationController
{
  return self->_modalNavigationController;
}

- (void)setModalNavigationController:(id)a3
{
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
}

- (BOOL)assumeResponsibilityForRUIPage
{
  return self->_assumeResponsibilityForRUIPage;
}

- (void)setAssumeResponsibilityForRUIPage:(BOOL)a3
{
  self->_assumeResponsibilityForRUIPage = a3;
}

- (unint64_t)countOfResponsibilityViewControllerPushSessions
{
  return self->_countOfResponsibilityViewControllerPushSessions;
}

- (void)setCountOfResponsibilityViewControllerPushSessions:(unint64_t)a3
{
  self->_countOfResponsibilityViewControllerPushSessions = a3;
}

- (NSPointerArray)responsibilityViewControllers
{
  return self->_responsibilityViewControllers;
}

- (void)setResponsibilityViewControllers:(id)a3
{
}

- (NSMutableDictionary)spinnerAppearanceHandlers
{
  return self->_spinnerAppearanceHandlers;
}

- (void)setSpinnerAppearanceHandlers:(id)a3
{
}

- (BuddyAppleIDAuthManager)authManager
{
  return self->_authManager;
}

- (void)setAuthManager:(id)a3
{
}

- (BuddyAppleIDSignInController)twoAccountsiCloudSignInController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_twoAccountsiCloudSignInController);

  return (BuddyAppleIDSignInController *)WeakRetained;
}

- (void)setTwoAccountsiCloudSignInController:(id)a3
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

- (void).cxx_destruct
{
}

@end