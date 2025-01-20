@interface BuddyAppleIDPasswordChangeController
+ (BOOL)controllerNeedsToRun;
- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6;
- (BOOL)shouldRetryFlow;
- (BuddyAppleIDPasswordChangeController)init;
- (int64_t)flowRetryCount;
- (void)_retryFlowIfPossibleOrFailWithError:(id)a3;
- (void)_startFlow;
- (void)_stopSpinning;
- (void)controllerDone;
- (void)createAndRecoverAccountWithUsername:(id)a3 password:(id)a4 rawPassword:(id)a5 completion:(id)a6;
- (void)networkChangedFromNetworkType:(int)a3 toNetworkType:(int)a4;
- (void)setFlowRetryCount:(int64_t)a3;
- (void)setShouldRetryFlow:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation BuddyAppleIDPasswordChangeController

+ (BOOL)controllerNeedsToRun
{
  id v9 = a1;
  SEL v8 = a2;
  id v2 = +[BYManagedAppleIDBootstrap sharedManager];
  unsigned __int8 v3 = [v2 passwordChangeFlowNeedsToRun];

  char v7 = v3 & 1;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      CFStringRef v4 = @"YASE";
    }
    else {
      CFStringRef v4 = @"NERP";
    }
    sub_10004BB7C((uint64_t)buf, (uint64_t)v4);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Password change flow needs to run = %{public}@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  return v7 & 1;
}

- (BuddyAppleIDPasswordChangeController)init
{
  SEL v5 = a2;
  id location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyAppleIDPasswordChangeController;
  id location = [(BuddyAppleIDPasswordChangeController *)&v4 initWithSpinnerText:&stru_1002B4E18];
  id v2 = (BuddyAppleIDPasswordChangeController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  id v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BuddyAppleIDPasswordChangeController;
  [(BuddyAppleIDPasswordChangeController *)&v6 viewDidAppear:a3];
  unsigned __int8 v3 = +[BYNetworkMonitor sharedInstance];
  [(BYNetworkMonitor *)v3 addObserver:v9];

  objc_super v4 = (UINavigationController *)[(BuddyAppleIDPasswordChangeController *)v9 navigationController];
  originalNavController = v9->_originalNavController;
  v9->_originalNavController = v4;

  [(BuddyAppleIDPasswordChangeController *)v9 setFlowRetryCount:0];
  [(BuddyAppleIDPasswordChangeController *)v9 setShouldRetryFlow:0];
  [(BuddyAppleIDPasswordChangeController *)v9 _startFlow];
}

- (void)viewDidDisappear:(BOOL)a3
{
  SEL v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  unsigned __int8 v3 = (UINavigationController *)[(BuddyAppleIDPasswordChangeController *)self navigationController];
  originalNavController = v8->_originalNavController;
  v8->_originalNavController = v3;

  v5.receiver = v8;
  v5.super_class = (Class)BuddyAppleIDPasswordChangeController;
  [(BuddyAppleIDPasswordChangeController *)&v5 viewDidDisappear:v6];
}

- (void)_retryFlowIfPossibleOrFailWithError:(id)a3
{
  v48 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0]
    && [(BuddyAppleIDPasswordChangeController *)v48 shouldRetryFlow]
    && [(BuddyAppleIDPasswordChangeController *)v48 flowRetryCount] < 2)
  {
    [(BuddyAppleIDPasswordChangeController *)v48 setFlowRetryCount:(char *)[(BuddyAppleIDPasswordChangeController *)v48 flowRetryCount] + 1];
    id v46 = (id)_BYLoggingFacility();
    os_log_type_t v45 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_DEFAULT))
    {
      sub_100046588((uint64_t)buf, [(BuddyAppleIDPasswordChangeController *)v48 flowRetryCount]);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v46, v45, "Retrying Apple ID Password Change flow, retry count: %ld", buf, 0xCu);
    }
    objc_storeStrong(&v46, 0);
    unsigned __int8 v3 = +[BYNetworkMonitor sharedInstance];
    v39 = _NSConcreteStackBlock;
    int v40 = -1073741824;
    int v41 = 0;
    v42 = sub_100073DD8;
    v43 = &unk_1002B0EC0;
    v44 = v48;
    [(BYNetworkMonitor *)v3 withMinimumNetworkType:1 timeout:&v39 runBlock:20.0];

    objc_storeStrong((id *)&v44, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      char v35 = 0;
      char v33 = 0;
      if (_BYIsInternalInstall())
      {
        objc_super v4 = (NSString *)location[0];
      }
      else if (location[0])
      {
        id v36 = [location[0] domain];
        char v35 = 1;
        objc_super v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v36, [location[0] code]);
        id v34 = v4;
        char v33 = 1;
      }
      else
      {
        objc_super v4 = 0;
      }
      sub_10004BB7C((uint64_t)v49, (uint64_t)v4);
      _os_log_impl((void *)&_mh_execute_header, oslog, v37, "Failed password change: %{public}@", v49, 0xCu);
      if (v33) {

      }
      if (v35) {
    }
      }
    objc_storeStrong((id *)&oslog, 0);
    id v32 = &stru_1002B4E18;
    if (MGGetBoolAnswer() & 1)
    {
      id v5 = [location[0] localizedDescription];
      BOOL v6 = +[NSString localizedStringWithFormat:@"\n(internal message): %@", v5];
      id v7 = v32;
      id v32 = v6;
    }
    SEL v8 = +[NSBundle mainBundle];
    id v30 = [(NSBundle *)v8 localizedStringForKey:@"SLT_UPGRADE_ERROR_TITLE" value:&stru_1002B4E18 table:@"Localizable"];

    id v9 = +[NSBundle mainBundle];
    v10 = [(NSBundle *)v9 localizedStringForKey:@"SLT_UPGRADE_ERROR_MESSAGE" value:&stru_1002B4E18 table:@"Localizable"];
    id v29 = +[NSString localizedStringWithFormat:@"%@%@", v10, v32];

    v11 = +[NSBundle mainBundle];
    id v28 = [(NSBundle *)v11 localizedStringForKey:@"OK" value:&stru_1002B4E18 table:@"Localizable"];

    id v12 = [location[0] domain];
    BOOL v13 = 0;
    if ([v12 isEqualToString:AKAppleIDAuthenticationErrorDomain]) {
      BOOL v13 = [location[0] code] == (id)-7027;
    }

    if (v13)
    {
      v14 = +[NSBundle mainBundle];
      v15 = [(NSBundle *)v14 localizedStringForKey:@"SLT_EXPIRED_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
      id v16 = v30;
      id v30 = v15;
    }
    v17 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    int v19 = -1073741824;
    int v20 = 0;
    v21 = sub_100073F00;
    v22 = &unk_1002B1578;
    id v23 = v30;
    id v24 = v29;
    id v25 = v28;
    id v26 = location[0];
    v27 = v48;
    dispatch_async((dispatch_queue_t)v17, &block);

    objc_storeStrong((id *)&v27, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v32, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_startFlow
{
  id v46 = self;
  location[1] = (os_log_t)a2;
  location[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v44 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(location[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = location[0];
    os_log_type_t v3 = v44;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Show Change Password sign in!", buf, 2u);
  }
  objc_storeStrong((id *)location, 0);
  uint64_t v36 = 0;
  os_log_type_t v37 = &v36;
  int v38 = 838860800;
  int v39 = 48;
  int v40 = sub_100074844;
  int v41 = sub_100074888;
  uint64_t v42 = objc_opt_new();
  [(id)v37[5] setDelegate:v46];
  id v35 = +[UMUserManager sharedManager];
  id v34 = [v35 currentUser];
  id v33 = [v34 username];
  id v32 = [v34 alternateDSID];
  id v4 = +[BYManagedAppleIDBootstrap sharedManager];
  id v31 = [v4 shortLivedToken];

  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v29 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_100074894((uint64_t)v49, (uint64_t)v33, (uint64_t)v32, (uint64_t)v31);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, v29, "Username = %@, altDSID = %@, SLT = %@", v49, 0x20u);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v33 && v32 && v31)
  {
    id v5 = (AKAppleIDAuthenticationPurpleBuddyContext *)objc_alloc_init((Class)AKAppleIDAuthenticationPurpleBuddyContext);
    context = v46->_context;
    v46->_context = v5;

    id v7 = v46->_context;
    id v8 = [(BuddyAppleIDPasswordChangeController *)v46 navigationController];
    [(AKAppleIDAuthenticationPurpleBuddyContext *)v7 setPresentingViewController:v8];

    [(AKAppleIDAuthenticationPurpleBuddyContext *)v46->_context setUsername:v33];
    [(AKAppleIDAuthenticationPurpleBuddyContext *)v46->_context _setShortLivedToken:v31];
    [(AKAppleIDAuthenticationPurpleBuddyContext *)v46->_context setAltDSID:v32];
    [(AKAppleIDAuthenticationPurpleBuddyContext *)v46->_context setShouldForceInteractiveAuth:0];
    [(AKAppleIDAuthenticationPurpleBuddyContext *)v46->_context setShouldUpdatePersistentServiceTokens:1];
    [(AKAppleIDAuthenticationPurpleBuddyContext *)v46->_context setServiceType:1];
    id v28 = (id)objc_opt_new();
    id v9 = [v28 aa_primaryAppleAccount];
    LOBYTE(v7) = v9 != 0;

    char v27 = v7 & 1;
    os_log_t v26 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      if (v27) {
        CFStringRef v10 = @"YASE";
      }
      else {
        CFStringRef v10 = @"NERP";
      }
      sub_10004BB7C((uint64_t)v48, (uint64_t)v10);
      _os_log_impl((void *)&_mh_execute_header, v26, v25, "Primary account exists: %{public}@", v48, 0xCu);
    }
    objc_storeStrong((id *)&v26, 0);
    if ((v27 & 1) == 0) {
      [(AKAppleIDAuthenticationPurpleBuddyContext *)v46->_context setFirstTimeLogin:1];
    }
    v11 = (void *)v37[5];
    id v12 = v46->_context;
    int v19 = _NSConcreteStackBlock;
    int v20 = -1073741824;
    int v21 = 0;
    v22 = sub_1000748BC;
    id v23 = &unk_1002B1618;
    v24[0] = v46;
    v24[1] = &v36;
    [v11 authenticateWithContext:v12 completion:&v19];
    objc_storeStrong(v24, 0);
    objc_storeStrong(&v28, 0);
  }
  else
  {
    os_log_t v18 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = v18;
      os_log_type_t v14 = v17;
      sub_10004B24C(v16);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Missing edu login information!", v16, 2u);
    }
    objc_storeStrong((id *)&v18, 0);
    os_log_t v15 = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      sub_100074894((uint64_t)v47, (uint64_t)v33, (uint64_t)v32, (uint64_t)v31);
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Username = %@, altDSID = %@, SLT = %@", v47, 0x20u);
    }
    objc_storeStrong((id *)&v15, 0);
    [(BuddyAppleIDPasswordChangeController *)v46 _retryFlowIfPossibleOrFailWithError:0];
  }
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  _Block_object_dispose(&v36, 8);
  objc_storeStrong((id *)&v42, 0);
}

- (void)_stopSpinning
{
  +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:@"passwordchange", a2];
  id v2 = [(UINavigationController *)self->_originalNavController topViewController];
  os_log_type_t v3 = [(UIViewController *)v2 navigationItem];
  [(UINavigationItem *)v3 setTitle:0];

  id v4 = [(UINavigationController *)self->_originalNavController topViewController];
  id v5 = [(UIViewController *)v4 view];
  BOOL v6 = [(UIView *)v5 window];
  [(UIWindow *)v6 setUserInteractionEnabled:1];
}

- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6
{
  int v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  id v18 = 0;
  objc_storeStrong(&v18, a5);
  id v17 = 0;
  objc_storeStrong(&v17, a6);
  id v9 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  os_log_type_t v14 = sub_100075000;
  os_log_t v15 = &unk_1002B0D20;
  id v16 = v21;
  dispatch_async((dispatch_queue_t)v9, &block);

  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (void)createAndRecoverAccountWithUsername:(id)a3 password:(id)a4 rawPassword:(id)a5 completion:(id)a6
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = 0;
  objc_storeStrong(&v25, a4);
  id v24 = 0;
  objc_storeStrong(&v24, a5);
  id v23 = 0;
  objc_storeStrong(&v23, a6);
  id v9 = objc_alloc((Class)BYAppleIDAccountsManager);
  id v10 = +[BYManagedAppleIDBootstrap delegateBundleIDsForManagedAccount];
  id v22 = [v9 initForDelegateBundleIDs:v10];

  id v11 = location[0];
  id v12 = v25;
  id v13 = v24;
  os_log_type_t v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  id v17 = sub_10007538C;
  id v18 = &unk_1002B1640;
  id v19 = v24;
  id v20 = v22;
  id v21 = v23;
  [v22 loginDelegateAccountsWithUsername:v11 password:v12 rawPassword:v13 skipiTunes:0 onlyAppleIDPlugin:0 completion:&v14];
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

- (void)controllerDone
{
  id v2 = [(BuddyAppleIDPasswordChangeController *)self delegate];
  [v2 flowItemDone:self nextItemClass:objc_opt_class()];
}

- (void)networkChangedFromNetworkType:(int)a3 toNetworkType:(int)a4
{
  BOOL v4 = 0;
  if (a3 == 1) {
    BOOL v4 = a4 == 0;
  }
  [(BuddyAppleIDPasswordChangeController *)self setShouldRetryFlow:v4];
}

- (BOOL)shouldRetryFlow
{
  return self->_shouldRetryFlow;
}

- (void)setShouldRetryFlow:(BOOL)a3
{
  self->_shouldRetryFlow = a3;
}

- (int64_t)flowRetryCount
{
  return self->_flowRetryCount;
}

- (void)setFlowRetryCount:(int64_t)a3
{
  self->_flowRetryCount = a3;
}

- (void).cxx_destruct
{
}

@end