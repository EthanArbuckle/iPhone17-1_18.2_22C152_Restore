@interface SUSUISoftwareUpdateAuthenticationViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_createKeybagForPasscode:(id)a3 forInstallTonight:(BOOL)a4;
- (BOOL)_shouldShowPasscodeView;
- (SUSUISoftwareUpdateAuthenticationViewController)initWithDescriptor:(id)a3 forInstallTonight:(BOOL)a4 withInstallForecast:(id)a5 canDeferInstallation:(BOOL)a6;
- (SUSUISoftwareUpdateAuthenticationViewController)initWithRollbackDescriptor:(id)a3 canDeferInstallation:(BOOL)a4;
- (SUSUISoftwareUpdateAuthenticationViewControllerDelegate)delegate;
- (unint64_t)supportedInterfaceOrientations;
- (void)_attemptUnlock:(id)a3 passcode:(id)a4;
- (void)_authenticationCancelled;
- (void)_authenticationFailure:(id)a3 fromMesa:(BOOL)a4;
- (void)_authenticationSuccess:(id)a3 fromMesa:(BOOL)a4;
- (void)_dismissAndSendCompletionResponse:(BOOL)a3;
- (void)_dismissSelf:(BOOL)a3;
- (void)_dismissTermsAndConditionsIfNecessaryAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_passcodeLockViewPasscodeEntered:(id)a3 viaMesa:(BOOL)a4;
- (void)_presentTermsAndConditionsWithCompletion:(id)a3;
- (void)_sendDeactivationResponseFailureIfNecessary;
- (void)_setChildViewController:(id)a3;
- (void)_setVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_termsAgree;
- (void)_termsDisagree;
- (void)dealloc;
- (void)dismissEmergencyCallViewController:(id)a3;
- (void)emergencyCallViewController:(id)a3 didExitWithError:(id)a4;
- (void)loadView;
- (void)passcodeLockViewCancelButtonPressed:(id)a3;
- (void)passcodeLockViewEmergencyCallButtonPressed:(id)a3;
- (void)passcodeLockViewPasscodeDidChange:(id)a3;
- (void)passcodeLockViewPasscodeEntered:(id)a3;
- (void)passcodeLockViewPasscodeEnteredViaMesa:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SUSUISoftwareUpdateAuthenticationViewController

- (SUSUISoftwareUpdateAuthenticationViewController)initWithDescriptor:(id)a3 forInstallTonight:(BOOL)a4 withInstallForecast:(id)a5 canDeferInstallation:(BOOL)a6
{
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v24 = a4;
  id v23 = 0;
  objc_storeStrong(&v23, a5);
  BOOL v22 = a6;
  v6 = v26;
  v26 = 0;
  v21.receiver = v6;
  v21.super_class = (Class)SUSUISoftwareUpdateAuthenticationViewController;
  v20 = [(SUSUISoftwareUpdateAuthenticationViewController *)&v21 init];
  v26 = v20;
  objc_storeStrong((id *)&v26, v20);
  if (v20)
  {
    v26->_forInstallTonight = v24;
    v26->_canDeferInstallation = v22;
    objc_storeStrong((id *)&v26->_descriptor, location[0]);
    objc_storeStrong((id *)&v26->_rollbackDescriptor, 0);
    unsigned __int8 v7 = [location[0] isSplatOnly];
    v26->_createInstallationKeybag = (v7 ^ 1) & 1;
    v26->_showingPinController = 0;
    v26->_doneWithPinController = 0;
    if (v23) {
      objc_storeStrong((id *)&v26->_installForecast, v23);
    }
    v8 = (SUSSoftwareUpdateTermsManager *)objc_alloc_init((Class)SUSSoftwareUpdateTermsManager);
    termsManager = v26->_termsManager;
    v26->_termsManager = v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.susui.authVC.susQueue", 0);
    clientQueue = v26->_clientQueue;
    v26->_clientQueue = (OS_dispatch_queue *)v10;

    id v12 = objc_alloc((Class)SUManagerClient);
    v13 = (SUManagerClient *)[v12 initWithDelegate:0 queue:v26->_clientQueue clientType:0];
    suManagerClient = v26->_suManagerClient;
    v26->_suManagerClient = v13;
  }
  v16 = v26;
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v26, 0);
  return v16;
}

- (SUSUISoftwareUpdateAuthenticationViewController)initWithRollbackDescriptor:(id)a3 canDeferInstallation:(BOOL)a4
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v17 = a4;
  v4 = v19;
  v19 = 0;
  v16.receiver = v4;
  v16.super_class = (Class)SUSUISoftwareUpdateAuthenticationViewController;
  v15 = [(SUSUISoftwareUpdateAuthenticationViewController *)&v16 init];
  v19 = v15;
  objc_storeStrong((id *)&v19, v15);
  if (v15)
  {
    v19->_forInstallTonight = 0;
    objc_storeStrong((id *)&v19->_descriptor, 0);
    objc_storeStrong((id *)&v19->_installForecast, 0);
    v19->_showingPinController = 0;
    v19->_doneWithPinController = 0;
    objc_storeStrong((id *)&v19->_rollbackDescriptor, location[0]);
    v19->_canDeferInstallation = v17;
    v19->_createInstallationKeybag = 0;
    v5 = (SUSSoftwareUpdateTermsManager *)objc_alloc_init((Class)SUSSoftwareUpdateTermsManager);
    termsManager = v19->_termsManager;
    v19->_termsManager = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.susui.authVC.susQueue", 0);
    clientQueue = v19->_clientQueue;
    v19->_clientQueue = (OS_dispatch_queue *)v7;

    id v9 = objc_alloc((Class)SUManagerClient);
    dispatch_queue_t v10 = (SUManagerClient *)[v9 initWithDelegate:0 queue:v19->_clientQueue clientType:0];
    suManagerClient = v19->_suManagerClient;
    v19->_suManagerClient = v10;
  }
  v13 = v19;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v19, 0);
  return v13;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  objc_storeWeak((id *)&self->_delegate, 0);
  [(SUSUISoftwareUpdateAuthenticationViewController *)v4 _sendDeactivationResponseFailureIfNecessary];
  v2.receiver = v4;
  v2.super_class = (Class)SUSUISoftwareUpdateAuthenticationViewController;
  [(SUSUISoftwareUpdateAuthenticationViewController *)&v2 dealloc];
}

- (void)loadView
{
  BOOL v17 = self;
  SEL v16 = a2;
  id v12 = +[UIScreen mainScreen];
  [(UIScreen *)v12 bounds];
  *(void *)&long long v14 = v2;
  *((void *)&v14 + 1) = v3;
  *(void *)&long long v15 = v4;
  *((void *)&v15 + 1) = v5;

  if (v17->_forInstallTonight)
  {
    v8 = -[SUSUIInstallTonightPasscodeEntryView initWithFrame:]([SUSUIInstallTonightPasscodeEntryView alloc], "initWithFrame:", v14, v15);
    view = v17->_view;
    v17->_view = &v8->super;

    [(SUSUIPasscodeEntryView *)v17->_view setInstallTonightForecast:v17->_installForecast];
    [(SUSUIPasscodeEntryView *)v17->_view setDescriptor:v17->_descriptor];
  }
  else
  {
    v6 = -[SUSUIPasscodeEntryView initWithFrame:]([SUSUIPasscodeEntryView alloc], "initWithFrame:", v14, v15);
    dispatch_queue_t v7 = v17->_view;
    v17->_view = v6;
  }
  v13 = [(SUSUIPasscodeEntryView *)v17->_view passcodeLockView];
  [(SBUIPasscodeLockView *)v13 setDelegate:v17];
  dispatch_queue_t v10 = +[UIDevice currentDevice];
  BOOL v11 = (id)[(UIDevice *)v10 userInterfaceIdiom] != (id)1;

  if (v11) {
    [(SBUIPasscodeLockView *)v13 setShowsEmergencyCallButton:!v17->_canDeferInstallation];
  }
  else {
    [(SBUIPasscodeLockView *)v13 setShowsEmergencyCallButton:0];
  }
  [(SBUIPasscodeLockView *)v13 setShowsCancelButton:v17->_canDeferInstallation];
  [(SBUIPasscodeLockView *)v13 setBiometricAuthenticationAllowed:0];
  [(SUSUIPasscodeEntryView *)v17->_view updateStatusText];
  [(SUSUISoftwareUpdateAuthenticationViewController *)v17 setView:v17->_view];
  objc_storeStrong((id *)&v13, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)SUSUISoftwareUpdateAuthenticationViewController;
  [(SUSUISoftwareUpdateAuthenticationViewController *)&v3 viewWillAppear:a3];
  [(SUSUIPasscodeEntryView *)v6->_view updateStatusText];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)SUSUISoftwareUpdateAuthenticationViewController;
  [(SUSUISoftwareUpdateAuthenticationViewController *)&v3 viewDidAppear:a3];
  [(SUSUISoftwareUpdateAuthenticationViewController *)v6 _setVisible:1 animated:1 completion:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  dispatch_queue_t v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  os_log_t oslog = (os_log_t)(id)SUSUILogAuthenticationUI();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    if (v10->_showingTermsAndConditions) {
      CFStringRef v4 = @"YES";
    }
    else {
      CFStringRef v4 = @"NO";
    }
    sub_100005670((uint64_t)v11, (uint64_t)"-[SUSUISoftwareUpdateAuthenticationViewController viewDidDisappear:]", (uint64_t)v3, (uint64_t)v4);
    _os_log_impl((void *)&_mh_execute_header, oslog, type, "%s:%@, showingTermsAndConditions:%@", v11, 0x20u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v5.receiver = v10;
  v5.super_class = (Class)SUSUISoftwareUpdateAuthenticationViewController;
  [(SUSUISoftwareUpdateAuthenticationViewController *)&v5 viewDidDisappear:v8];
  [(SUSUISoftwareUpdateAuthenticationViewController *)v10 _sendDeactivationResponseFailureIfNecessary];
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_super v5 = +[UIDevice currentDevice];
  BOOL v2 = (id)[(UIDevice *)v5 userInterfaceIdiom] == (id)1;
  uint64_t v3 = 30;
  if (!v2) {
    uint64_t v3 = 2;
  }
  unint64_t v6 = v3;

  return v6;
}

- (void)passcodeLockViewPasscodeDidChange:(id)a3
{
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v3 = [(SUSUISoftwareUpdateAuthenticationViewController *)v5 delegate];
  [(SUSUISoftwareUpdateAuthenticationViewControllerDelegate *)v3 viewControllerWantsIdleTimerReset:v5];

  objc_storeStrong(location, 0);
}

- (void)passcodeLockViewPasscodeEntered:(id)a3
{
  CFStringRef v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUISoftwareUpdateAuthenticationViewController *)v4 _passcodeLockViewPasscodeEntered:location[0] viaMesa:0];
  objc_storeStrong(location, 0);
}

- (void)passcodeLockViewPasscodeEnteredViaMesa:(id)a3
{
  CFStringRef v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUISoftwareUpdateAuthenticationViewController *)v4 _passcodeLockViewPasscodeEntered:location[0] viaMesa:1];
  objc_storeStrong(location, 0);
}

- (void)passcodeLockViewCancelButtonPressed:(id)a3
{
  CFStringRef v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUISoftwareUpdateAuthenticationViewController *)v4 _authenticationCancelled];
  objc_storeStrong(location, 0);
}

- (void)passcodeLockViewEmergencyCallButtonPressed:(id)a3
{
  long long v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = (id)SUSUILogAuthenticationUI();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    os_log_type_t type = v12;
    sub_100005A54(v11);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Emergency call button hit", v11, 2u);
  }
  objc_storeStrong(&v13, 0);
  objc_super v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  BOOL v8 = sub_100005A70;
  SEL v9 = &unk_100018558;
  dispatch_queue_t v10 = v15;
  +[SUSUIRemoteEmergencyCallViewController requestEmergencyCallControllerWithCompletion:&v5];
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)dismissEmergencyCallViewController:(id)a3
{
  SEL v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  SEL v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  os_log_type_t v12 = sub_100005E64;
  id v13 = &unk_100018530;
  long long v14 = v16;
  uint64_t v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = sub_100005EC4;
  int v7 = &unk_100018580;
  BOOL v8 = v16;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", &v9, 0.4);
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)emergencyCallViewController:(id)a3 didExitWithError:(id)a4
{
  int v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(SUSUISoftwareUpdateAuthenticationViewController *)v7 bs_removeChildViewController:v7->_emergencyVC];
  objc_storeStrong((id *)&v7->_emergencyVC, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_setVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  v19 = self;
  SEL v18 = a2;
  BOOL v17 = a3;
  BOOL v16 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  if (v19->_showingTermsAndConditions)
  {
    if (v17)
    {
      if (location) {
        (*((void (**)(id, uint64_t))location + 2))(location, 1);
      }
    }
    else
    {
      id v5 = v19;
      int v6 = _NSConcreteStackBlock;
      int v7 = -1073741824;
      int v8 = 0;
      SEL v9 = sub_100006238;
      int v10 = &unk_1000185A8;
      int v11 = v19;
      BOOL v13 = v17;
      BOOL v14 = v16;
      id v12 = location;
      [(SUSUISoftwareUpdateAuthenticationViewController *)v5 _dismissTermsAndConditionsIfNecessaryAnimated:1 withCompletion:&v6];
      objc_storeStrong(&v12, 0);
      objc_storeStrong((id *)&v11, 0);
    }
  }
  else if (v17)
  {
    if ([(SUSUISoftwareUpdateAuthenticationViewController *)v19 _shouldShowPasscodeView]) {
      [(SUSUIPasscodeEntryView *)v19->_view setPasscodeViewsToVisible:v17 animated:v16 completion:location];
    }
    else {
      [(SUSUISoftwareUpdateAuthenticationViewController *)v19 _presentTermsAndConditionsWithCompletion:location];
    }
  }
  else
  {
    [(SUSUIPasscodeEntryView *)v19->_view setPasscodeViewsToVisible:v17 animated:v16 completion:location];
    [(SUSUISoftwareUpdateAuthenticationViewController *)v19 _dismissTermsAndConditionsIfNecessaryAnimated:0 withCompletion:0];
  }
  objc_storeStrong(&location, 0);
}

- (void)_attemptUnlock:(id)a3 passcode:(id)a4
{
  int v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  BOOL v8 = [v9 length] != 0;
  id v7 = +[SUSUIAuthenticationInterface sharedInstance];
  char v6 = 0;
  char v5 = [v7 attemptAuthentication:v9 outBlocked:&v6] & 1;
  if (v6)
  {
    [location[0] reset];
    [(SUSUISoftwareUpdateAuthenticationViewController *)v11 _dismissAndSendCompletionResponse:0];
  }
  else if (v5)
  {
    [location[0] reset];
    [(SUSUISoftwareUpdateAuthenticationViewController *)v11 _authenticationSuccess:v9 fromMesa:!v8];
  }
  else
  {
    [location[0] resetForFailedPasscode];
    [(SUSUISoftwareUpdateAuthenticationViewController *)v11 _authenticationFailure:v9 fromMesa:!v8];
  }
  v11->_attemptingUnlock = 0;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_passcodeLockViewPasscodeEntered:(id)a3 viaMesa:(BOOL)a4
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v18 = a4;
  if (v20->_attemptingUnlock)
  {
    int v17 = 1;
  }
  else
  {
    v20->_attemptingUnlock = 1;
    uint64_t v16 = 0x3FC999999999999ALL;
    dispatch_time_t v15 = dispatch_time(0, (uint64_t)(0.2 * 1000000000.0));
    dispatch_time_t when = v15;
    dispatch_queue_t queue = &_dispatch_main_q;
    id v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    int v10 = sub_1000065DC;
    int v11 = &unk_1000185D0;
    BOOL v14 = v18;
    id v12 = location[0];
    BOOL v13 = v20;
    dispatch_after(when, queue, &v7);

    objc_storeStrong((id *)&v13, 0);
    objc_storeStrong(&v12, 0);
    int v17 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)_authenticationCancelled
{
}

- (void)_authenticationFailure:(id)a3 fromMesa:(BOOL)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v10 = a4;
  id v9 = (id)SUSUILogAuthenticationUI();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    os_log_type_t type = v8;
    sub_100005A54(v7);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Failed passcode auth attempt.", v7, 2u);
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_authenticationSuccess:(id)a3 fromMesa:(BOOL)a4
{
  BOOL v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v12 = a4;
  id v11 = (id)SUSUILogAuthenticationUI();
  os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
  {
    log = v11;
    os_log_type_t type = v10;
    sub_100005A54(v9);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Successful passcode auth attempt; presenting terms and conditions if necessary.",
      v9,
      2u);
  }
  objc_storeStrong(&v11, 0);
  int v4 = (NSString *)[location[0] copy];
  passcode = v14->_passcode;
  v14->_passcode = v4;

  [(SUSUISoftwareUpdateAuthenticationViewController *)v14 _presentTermsAndConditionsWithCompletion:0];
  objc_storeStrong(location, 0);
}

- (BOOL)_shouldShowPasscodeView
{
  uint64_t v3 = +[SUKeybagInterface sharedInstance];
  unsigned __int8 v4 = [(SUKeybagInterface *)v3 hasPasscodeSet];

  return v4 & 1;
}

- (void)_presentTermsAndConditionsWithCompletion:(id)a3
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v20->_showingTermsAndConditions)
  {
    if (location[0]) {
      (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
    }
    int v18 = 1;
  }
  else
  {
    uint64_t v3 = [objc_alloc((Class)UIViewController) initWithNibName:0 bundle:0];
    termsAndConditionsController = v20->_termsAndConditionsController;
    v20->_termsAndConditionsController = v3;

    os_log_type_t v8 = [(UIViewController *)v20->_termsAndConditionsController view];
    [(UIView *)v8 setAlpha:0.0];

    [(UIViewController *)v20->_termsAndConditionsController setModalPresentationStyle:0];
    v20->_showingTermsAndConditions = 1;
    id v9 = +[UIDevice currentDevice];
    BOOL v10 = (id)[(UIDevice *)v9 userInterfaceIdiom] == (id)1;

    if (!v10)
    {
      id v7 = [(SUSUISoftwareUpdateAuthenticationViewController *)v20 delegate];
      [(SUSUISoftwareUpdateAuthenticationViewControllerDelegate *)v7 viewController:v20 wantsStatusBarHidden:1 withDuration:0.4];
    }
    char v6 = v20;
    char v5 = v20->_termsAndConditionsController;
    id v11 = _NSConcreteStackBlock;
    int v12 = -1073741824;
    int v13 = 0;
    BOOL v14 = sub_100006C00;
    dispatch_time_t v15 = &unk_100018620;
    uint64_t v16 = v20;
    id v17 = location[0];
    [(SUSUISoftwareUpdateAuthenticationViewController *)v6 presentViewController:v5 animated:0 completion:&v11];
    objc_storeStrong(&v17, 0);
    objc_storeStrong((id *)&v16, 0);
    int v18 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)_dismissTermsAndConditionsIfNecessaryAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  if (v10->_showingTermsAndConditions)
  {
    v10->_showingTermsAndConditions = 0;
    char v5 = +[UIDevice currentDevice];
    BOOL v6 = (id)[(UIDevice *)v5 userInterfaceIdiom] == (id)1;

    if (!v6)
    {
      unsigned __int8 v4 = [(SUSUISoftwareUpdateAuthenticationViewController *)v10 delegate];
      [(SUSUISoftwareUpdateAuthenticationViewControllerDelegate *)v4 viewController:v10 wantsStatusBarHidden:0 withDuration:0.4];
    }
    [(UIViewController *)v10->_termsAndConditionsController dismissViewControllerAnimated:v8 completion:location];
  }
  else if (location)
  {
    (*((void (**)(void))location + 2))();
  }
  objc_storeStrong(&location, 0);
}

- (void)_dismissAndSendCompletionResponse:(BOOL)a3
{
  v30 = self;
  SEL v29 = a2;
  BOOL v28 = a3;
  if (!self->_responseSent)
  {
    v30->_responseSent = 1;
    id location = (id)SUSUILogAuthenticationUI();
    os_log_type_t v26 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      if (v28) {
        CFStringRef v3 = @"YES";
      }
      else {
        CFStringRef v3 = @"NO";
      }
      sub_10000765C((uint64_t)v34, (uint64_t)v3);
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)location, v26, "_dismissAndSendCompletionResponse: possibleSuccess=%@", v34, 0xCu);
    }
    objc_storeStrong(&location, 0);
    char v25 = v28;
    if (v28)
    {
      if (v30->_createInstallationKeybag)
      {
        BOOL v14 = +[SUKeybagInterface sharedInstance];
        unsigned __int8 v15 = [(SUKeybagInterface *)v14 hasPasscodeSet];

        char v24 = v15 & 1;
        if (v15)
        {
          char v25 = [(SUSUISoftwareUpdateAuthenticationViewController *)v30 _createKeybagForPasscode:v30->_passcode forInstallTonight:v30->_forInstallTonight];
          id v23 = (id)SUSUILogAuthenticationUI();
          os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
          {
            if (v25) {
              CFStringRef v4 = @"YES";
            }
            else {
              CFStringRef v4 = @"NO";
            }
            sub_10000765C((uint64_t)v33, (uint64_t)v4);
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, v22, "Authenticated with result [keybag created?]: %@", v33, 0xCu);
          }
          objc_storeStrong(&v23, 0);
        }
        else
        {
          id v21 = (id)SUSUILogAuthenticationUI();
          os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
          {
            if (v25) {
              CFStringRef v5 = @"YES";
            }
            else {
              CFStringRef v5 = @"NO";
            }
            sub_10000765C((uint64_t)v32, (uint64_t)v5);
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v21, v20, "Authenticated with result [keybag not required]: %@", v32, 0xCu);
          }
          objc_storeStrong(&v21, 0);
        }
      }
      else
      {
        id v19 = (id)SUSUILogAuthenticationUI();
        os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = v19;
          os_log_type_t v13 = v18;
          sub_100005A54(v17);
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "Not creating installation keybag due to _createInstallationKeybag == NO", v17, 2u);
        }
        objc_storeStrong(&v19, 0);
      }
      BOOL v10 = [(SUSUISoftwareUpdateAuthenticationViewController *)v30 delegate];
      [(SUSUISoftwareUpdateAuthenticationViewControllerDelegate *)v10 viewControllerAuthenticatedWithResult:v25 & 1];

      id v11 = [(SUSUISoftwareUpdateAuthenticationViewController *)v30 delegate];
      [(SUSUISoftwareUpdateAuthenticationViewControllerDelegate *)v11 viewControllerWantsDismissal:v30];
    }
    else
    {
      os_log_t oslog = (os_log_t)(id)SUSUILogAuthenticationUI();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        if (v25) {
          CFStringRef v6 = @"YES";
        }
        else {
          CFStringRef v6 = @"NO";
        }
        sub_10000765C((uint64_t)v31, (uint64_t)v6);
        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Authenticated with result [no passcode set]: %@", v31, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      BOOL v8 = [(SUSUISoftwareUpdateAuthenticationViewController *)v30 delegate];
      [(SUSUISoftwareUpdateAuthenticationViewControllerDelegate *)v8 viewControllerAuthenticatedWithResult:v25 & 1];

      SEL v9 = [(SUSUISoftwareUpdateAuthenticationViewController *)v30 delegate];
      [(SUSUISoftwareUpdateAuthenticationViewControllerDelegate *)v9 viewControllerWantsDismissal:v30];
    }
    [(SUManagerClient *)v30->_suManagerClient invalidate];
    objc_storeStrong((id *)((char *)&v30->super.super.super.isa + *(int *)(v7 + 2392)), 0);
  }
}

- (BOOL)_createKeybagForPasscode:(id)a3 forInstallTonight:(BOOL)a4
{
  char v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v22 = a4;
  objc_initWeak(&v21, v24->_suManagerClient);
  uint64_t v16 = 0;
  id v17 = &v16;
  int v18 = 0x20000000;
  int v19 = 32;
  char v20 = 0;
  dispatch_queue_t queue = v24->_clientQueue;
  BOOL v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = sub_100007848;
  int v12 = &unk_100018648;
  os_log_type_t v13 = v24;
  v14[0] = location[0];
  v14[1] = &v16;
  objc_copyWeak(&v15, &v21);
  dispatch_sync(queue, &v8);
  char v7 = *((unsigned char *)v17 + 24);
  objc_destroyWeak(&v15);
  objc_storeStrong(v14, 0);
  objc_storeStrong((id *)&v13, 0);
  _Block_object_dispose(&v16, 8);
  objc_destroyWeak(&v21);
  objc_storeStrong(location, 0);
  return v7 & 1;
}

- (void)_sendDeactivationResponseFailureIfNecessary
{
}

- (void)_dismissSelf:(BOOL)a3
{
  id v17 = self;
  SEL v16 = a2;
  BOOL v15 = a3;
  id location = (id)SUSUILogAuthenticationUI();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    if (v15) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    sub_10000765C((uint64_t)v18, (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)location, v13, "Requesting dismissal for self with succes: %@", v18, 0xCu);
  }
  objc_storeStrong(&location, 0);
  v17->_doneWithPinController = 1;
  objc_initWeak(&from, v17);
  CFStringRef v4 = v17;
  CFStringRef v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  BOOL v8 = sub_100007CC4;
  int v9 = &unk_100018670;
  objc_copyWeak(&v10, &from);
  BOOL v11 = v15;
  [(SUSUISoftwareUpdateAuthenticationViewController *)v4 _setVisible:0 animated:1 completion:&v5];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
}

- (void)_termsAgree
{
}

- (void)_termsDisagree
{
}

- (void)_setChildViewController:(id)a3
{
  os_log_type_t v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = [(SUSUISoftwareUpdateAuthenticationViewController *)v13 view];
  [v7 bounds];
  *(void *)&long long v10 = v3;
  *((void *)&v10 + 1) = v4;
  *(void *)&long long v11 = v5;
  *((void *)&v11 + 1) = v6;

  id v9 = [location[0] view];
  [v9 setFrame:v10, v11];
  [v9 setAutoresizingMask:18];
  [location[0] willMoveToParentViewController:v13];
  id v8 = [(SUSUISoftwareUpdateAuthenticationViewController *)v13 view];
  [v8 addSubview:v9];

  [(SUSUISoftwareUpdateAuthenticationViewController *)v13 addChildViewController:location[0]];
  [location[0] didMoveToParentViewController:v13];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SUSUISoftwareUpdateAuthenticationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SUSUISoftwareUpdateAuthenticationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end