@interface PBADevicePasscodeViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAutorotate;
- (PBADevicePasscodeViewController)initWithContainingStackViewController:(id)a3 authenticationPolicy:(id)a4;
- (SBFUserAuthenticationController)authenticationController;
- (id)lockScreenActionTitleWithHomeButton:(BOOL)a3;
- (id)lockScreenIconSystemName;
- (id)lockScreenMessage;
- (id)lockScreenStackItems;
- (id)lockScreenTitle;
- (id)makeAuthenticationRequestWithPasscode:(id)a3;
- (id)passcodeEntryScreenSubtitle;
- (id)passcodeEntryScreenTitle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_authenticateWithEmptyPasscode;
- (void)_configurePasscodeEntryViewController:(id)a3;
- (void)_evaluateDeviceBlockState;
- (void)_handleBlockedDevice;
- (void)_handleEdgeSwipe:(id)a3;
- (void)_handleUnblockedDevice;
- (void)_homeButtonPressed:(id)a3;
- (void)_pushPasscodeEntryViewIfNeeded;
- (void)_resetStateAfterHandlingAuthenticationResult;
- (void)confirmTransitionToPasscodeWithCompletion:(id)a3;
- (void)failedAuthHandler:(id)a3 error:(id)a4;
- (void)handlePasscodeEntryCancelledForViewController:(id)a3;
- (void)handlePasscodeEntrySuccessful:(id)a3;
- (void)handlePasscodeLockStatusChangeNotification:(id)a3;
- (void)invalidAuthHandler:(id)a3;
- (void)passcodeEntryViewControllerCancelButtonPressed:(id)a3;
- (void)passcodeEntryViewControllerEntryBegan:(id)a3;
- (void)passcodeEntryViewControllerEntryCancelled:(id)a3;
- (void)passcodeEntryViewControllerEntryCompleted:(id)a3 passcode:(id)a4;
- (void)registerForUnlockNotification;
- (void)successfulAuthHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PBADevicePasscodeViewController

- (PBADevicePasscodeViewController)initWithContainingStackViewController:(id)a3 authenticationPolicy:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PBADevicePasscodeViewController;
  v9 = [(PBADevicePasscodeViewController *)&v18 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stackViewController, a3);
    v11 = (SBFAuthenticationAssertionManager *)objc_alloc_init((Class)SBFAuthenticationAssertionManager);
    assertionManager = v10->_assertionManager;
    v10->_assertionManager = v11;

    objc_storeStrong((id *)&v10->_authenticationPolicy, a4);
    v13 = (SBFUserAuthenticationController *)[objc_alloc((Class)SBFUserAuthenticationController) initWithAssertionManager:v10->_assertionManager policy:v10->_authenticationPolicy];
    authenticationController = v10->_authenticationController;
    v10->_authenticationController = v13;

    v15 = (SBFLockOutStatusProvider *)[objc_alloc((Class)SBFDeviceLockOutController) initWithThermalController:0 authenticationController:v10->_authenticationController];
    deviceLockController = v10->_deviceLockController;
    v10->_deviceLockController = v15;

    [(SBFUserAuthenticationController *)v10->_authenticationController revokeAuthenticationImmediatelyIfNecessaryForPublicReason:@"PreBoard"];
    v10->_attemptingUnlock = 0;
  }

  return v10;
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)PBADevicePasscodeViewController;
  [(PBADevicePasscodeViewController *)&v24 viewDidLoad];
  uint64_t v3 = SBFEffectiveHomeButtonType();
  v4 = [PBASimpleLockScreenView alloc];
  v5 = [(PBADevicePasscodeViewController *)self view];
  [v5 bounds];
  v6 = -[PBASimpleLockScreenView initWithFrame:](v4, "initWithFrame:");
  newLockScreenView = self->_newLockScreenView;
  self->_newLockScreenView = v6;

  [(PBASimpleLockScreenView *)self->_newLockScreenView setAutoresizingMask:18];
  id v8 = self->_newLockScreenView;
  v9 = [(PBADevicePasscodeViewController *)self lockScreenIconSystemName];
  [(PBASimpleLockScreenView *)v8 setIconSystemName:v9];

  v10 = self->_newLockScreenView;
  v11 = [(PBADevicePasscodeViewController *)self lockScreenTitle];
  [(PBASimpleLockScreenView *)v10 setTitle:v11];

  v12 = self->_newLockScreenView;
  v13 = [(PBADevicePasscodeViewController *)self lockScreenMessage];
  [(PBASimpleLockScreenView *)v12 setMessage:v13];

  v14 = self->_newLockScreenView;
  v15 = [(PBADevicePasscodeViewController *)self lockScreenStackItems];
  [(PBASimpleLockScreenView *)v14 setStackItems:v15];

  v16 = self->_newLockScreenView;
  v17 = [(PBADevicePasscodeViewController *)self lockScreenActionTitleWithHomeButton:v3 != 2];
  [(PBASimpleLockScreenView *)v16 setPressToOpenText:v17];

  objc_super v18 = [(PBADevicePasscodeViewController *)self view];
  [v18 addSubview:self->_newLockScreenView];

  id v19 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_homeButtonPressed:"];
  [v19 setAllowedTouchTypes:&__NSArray0__struct];
  [v19 setAllowedPressTypes:&off_10001D4E0];
  [v19 setNumberOfTapsRequired:1];
  [v19 setCancelsTouchesInView:0];
  v20 = [(PBADevicePasscodeViewController *)self view];
  [v20 addGestureRecognizer:v19];

  if (v3 == 2)
  {
    id v21 = [objc_alloc((Class)UIScreenEdgePanGestureRecognizer) initWithTarget:self action:"_handleEdgeSwipe:" type:5 options:0];
    [v21 setEdges:4];
    v22 = [(PBADevicePasscodeViewController *)self view];
    [v22 addGestureRecognizer:v21];
  }
  [(PBADevicePasscodeViewController *)self registerForUnlockNotification];
  if ([(SBFLockOutStatusProvider *)self->_deviceLockController isBlocked])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000ADA0;
    block[3] = &unk_10001C748;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PBADevicePasscodeViewController;
  [(PBADevicePasscodeViewController *)&v4 viewDidAppear:a3];
  [(PBASimpleLockScreenView *)self->_newLockScreenView becomeFirstResponder];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)handlePasscodeEntrySuccessful:(id)a3
{
  id v4 = a3;
  v5 = [[PBAAppleLogoViewController alloc] initWithNibName:0 bundle:0];
  [(PBAStackViewController *)self->_stackViewController pushViewController:v5 animated:1 completion:v4];
}

- (void)registerForUnlockNotification
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handlePasscodeLockStatusChangeNotification:" name:SBFUserAuthenticationStateDidChangeNotification object:0];
}

- (void)handlePasscodeLockStatusChangeNotification:(id)a3
{
  if (!self->_attemptingUnlock
    && [(SBFUserAuthenticationController *)self->_authenticationController isAuthenticated])
  {
    [(PBADevicePasscodeViewController *)self handlePasscodeEntrySuccessful:&stru_10001CBD8];
  }
}

- (void)_handleBlockedDevice
{
  if (!self->_blockOverlayController)
  {
    id v3 = [[PBADeviceBlockOverlayViewController alloc] initWithBlockStatusProvider:self->_deviceLockController];
    [(PBADeviceBlockOverlayViewController *)v3 setDelegate:self];
    [(PBADeviceBlockOverlayViewController *)v3 setModalPresentationStyle:0];
    [(PBADeviceBlockOverlayViewController *)v3 setModalTransitionStyle:2];
    blockOverlayController = self->_blockOverlayController;
    self->_blockOverlayController = v3;
    v5 = v3;

    [(PBAStackViewController *)self->_stackViewController pushViewController:self->_blockOverlayController animated:1 completion:0];
  }
}

- (void)_handleUnblockedDevice
{
  blockOverlayController = self->_blockOverlayController;
  if (blockOverlayController)
  {
    [(PBAStackViewController *)self->_stackViewController removeViewController:blockOverlayController animated:1];
    [(PBADevicePasscodeViewController *)self _configurePasscodeEntryViewController:self->_passcodeEntryViewController];
    id v4 = self->_blockOverlayController;
    self->_blockOverlayController = 0;
  }
}

- (void)_evaluateDeviceBlockState
{
  if ([(SBFLockOutStatusProvider *)self->_deviceLockController isBlocked])
  {
    [(PBADevicePasscodeViewController *)self _handleBlockedDevice];
  }
  else
  {
    [(PBADevicePasscodeViewController *)self _handleUnblockedDevice];
  }
}

- (void)_homeButtonPressed:(id)a3
{
}

- (void)_handleEdgeSwipe:(id)a3
{
  if ([a3 state] == (id)3)
  {
    [(PBADevicePasscodeViewController *)self _pushPasscodeEntryViewIfNeeded];
  }
}

- (void)_pushPasscodeEntryViewIfNeeded
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000B2A4;
  v3[3] = &unk_10001CC00;
  objc_copyWeak(&v4, &location);
  [(PBADevicePasscodeViewController *)self confirmTransitionToPasscodeWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)passcodeEntryViewControllerEntryBegan:(id)a3
{
}

- (void)passcodeEntryViewControllerEntryCancelled:(id)a3
{
}

- (void)passcodeEntryViewControllerEntryCompleted:(id)a3 passcode:(id)a4
{
  id v6 = a3;
  authenticationController = self->_authenticationController;
  id v8 = a4;
  v9 = [(SBFUserAuthenticationController *)authenticationController createGracePeriodAssertionWithReason:@"com.apple.PreBoard.UnlockAttempt"];
  transientAssertion = self->_transientAssertion;
  self->_transientAssertion = v9;

  [(SBFAuthenticationAssertion *)self->_transientAssertion activate];
  id v11 = [objc_alloc((Class)NSString) initWithData:v8 encoding:4];

  v12 = [(PBADevicePasscodeViewController *)self makeAuthenticationRequestWithPasscode:v11];
  self->_attemptingUnlock = 1;
  v13 = self->_authenticationController;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000B5F8;
  v23[3] = &unk_10001CC28;
  v23[4] = self;
  id v24 = v12;
  id v25 = v6;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000B644;
  v20[3] = &unk_10001C798;
  v20[4] = self;
  id v21 = v24;
  id v22 = v25;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000B694;
  v17[3] = &unk_10001CC28;
  v17[4] = self;
  id v18 = v21;
  id v19 = v22;
  id v14 = v22;
  id v15 = v21;
  v16 = +[SBFUserAuthenticationResponder responderWithSuccessHandler:v23 failureHandler:v20 invalidHandler:v17];
  [(SBFUserAuthenticationController *)v13 processAuthenticationRequest:v15 responder:v16];
}

- (void)passcodeEntryViewControllerCancelButtonPressed:(id)a3
{
}

- (void)_authenticateWithEmptyPasscode
{
  id v3 = [(PBADevicePasscodeViewController *)self makeAuthenticationRequestWithPasscode:&stru_10001CD78];
  [(PBADevicePasscodeViewController *)self successfulAuthHandler:v3];
}

- (void)_configurePasscodeEntryViewController:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(PBADevicePasscodeViewController *)self passcodeEntryScreenTitle];
  uint64_t v5 = [(PBADevicePasscodeViewController *)self passcodeEntryScreenSubtitle];
  if (v4 | v5) {
    [v6 setTitleText:v4 subtitleText:v5 animated:0];
  }
}

- (void)_resetStateAfterHandlingAuthenticationResult
{
  self->_attemptingUnlock = 0;
  [(SBFAuthenticationAssertion *)self->_transientAssertion invalidate];
  transientAssertion = self->_transientAssertion;
  self->_transientAssertion = 0;
}

- (void)handlePasscodeEntryCancelledForViewController:(id)a3
{
  passcodeEntryViewController = self->_passcodeEntryViewController;
  self->_passcodeEntryViewController = 0;
  id v5 = a3;

  [(PBAStackViewController *)self->_stackViewController removeViewController:v5 animated:1];
}

- (id)makeAuthenticationRequestWithPasscode:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)SBFAuthenticationRequest) initForPasscode:v3 source:0 skipSEKeepUserDataOperation:1 handler:0];

  return v4;
}

- (void)successfulAuthHandler:(id)a3
{
}

- (void)failedAuthHandler:(id)a3 error:(id)a4
{
  id v5 = sub_1000085D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PreBoard result", v6, 2u);
  }

  if ([(SBFLockOutStatusProvider *)self->_deviceLockController isBlocked]) {
    [(PBADevicePasscodeViewController *)self _handleBlockedDevice];
  }
}

- (void)invalidAuthHandler:(id)a3
{
  id v4 = sub_1000085D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PreBoard result", v5, 2u);
  }

  if ([(SBFLockOutStatusProvider *)self->_deviceLockController isBlocked]) {
    [(PBADevicePasscodeViewController *)self _handleBlockedDevice];
  }
}

- (id)lockScreenIconSystemName
{
  return 0;
}

- (id)lockScreenTitle
{
  return 0;
}

- (id)lockScreenMessage
{
  return 0;
}

- (id)lockScreenStackItems
{
  return 0;
}

- (id)lockScreenActionTitleWithHomeButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[NSBundle mainBundle];
  id v5 = v4;
  if (v3) {
    CFStringRef v6 = @"PREBOARD_PRESS_FOR_UPGRADE";
  }
  else {
    CFStringRef v6 = @"PREBOARD_SWIPE_FOR_UPGRADE";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_10001CD78 table:@"PreBoard"];

  return v7;
}

- (id)passcodeEntryScreenTitle
{
  return 0;
}

- (id)passcodeEntryScreenSubtitle
{
  return 0;
}

- (void)confirmTransitionToPasscodeWithCompletion:(id)a3
{
}

- (SBFUserAuthenticationController)authenticationController
{
  return self->_authenticationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_authenticationPolicy, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_deviceLockController, 0);
  objc_storeStrong((id *)&self->_transientAssertion, 0);
  objc_storeStrong((id *)&self->_passcodeEntryViewController, 0);
  objc_storeStrong((id *)&self->_blockOverlayController, 0);
  objc_storeStrong((id *)&self->_newLockScreenView, 0);

  objc_storeStrong((id *)&self->_stackViewController, 0);
}

@end