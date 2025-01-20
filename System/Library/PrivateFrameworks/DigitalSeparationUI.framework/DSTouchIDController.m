@interface DSTouchIDController
+ (BOOL)hasMultipleFingerprints;
+ (BOOL)isTouchIDEnrolled;
- (BiometricKitUIEnrollViewController)enrollController;
- (DSNavigationDelegate)delegate;
- (DSTouchIDController)init;
- (OBBoldTrayButton)boldButton;
- (id)_cancelLeftNavigationItem;
- (void)_userDidTapCancelButton:(id)a3;
- (void)addNavigationItems;
- (void)beginEnrollment;
- (void)dealloc;
- (void)deleteIdentity;
- (void)enrollResult:(int)a3 bkIdentity:(id)a4;
- (void)ratchetViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5;
- (void)resetTouchID;
- (void)restartEnrollment;
- (void)setBoldButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnrollController:(id)a3;
- (void)shouldShowWithCompletion:(id)a3;
- (void)startRatchetEvalInPresentationContext:(id)a3;
- (void)updateTouchIDPaneConfiguration;
- (void)viewDidLoad;
@end

@implementation DSTouchIDController

- (DSTouchIDController)init
{
  os_log_t v3 = os_log_create("com.apple.DigitalSeparation", "DSBiometrics");
  v4 = (void *)DSLogBiometrics_1;
  DSLogBiometrics_1 = (uint64_t)v3;

  if (+[DSTouchIDController isTouchIDEnrolled])
  {
    v5 = DSUILocStringForKey(@"TOUCH_ID");
    v6 = DSUILocStringForKey(@"TOUCH_ID_DETAIL");
    v7 = [MEMORY[0x263F827E8] systemImageNamed:@"touchid"];
    v8 = -[DSTouchIDController initWithTitle:detailText:icon:](&v12, sel_initWithTitle_detailText_icon_, v5, v6, v7, v11.receiver, v11.super_class, self, DSTouchIDController);
  }
  else
  {
    v5 = DSUILocStringForKey(@"TOUCH_ID_ENROLL");
    v6 = DSUILocStringForKey(@"TOUCH_ID_ENROLL_DETAIL");
    v7 = [MEMORY[0x263F827E8] systemImageNamed:@"touchid"];
    v8 = -[DSTouchIDController initWithTitle:detailText:icon:](&v11, sel_initWithTitle_detailText_icon_, v5, v6, v7, self, DSTouchIDController, v12.receiver, v12.super_class);
  }
  v9 = v8;

  return v9;
}

- (void)shouldShowWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = sharedWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__DSTouchIDController_shouldShowWithCompletion___block_invoke;
  block[3] = &unk_264C6EBA8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __48__DSTouchIDController_shouldShowWithCompletion___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F3A368] isFingerprintModificationRestricted])
  {
    v2 = DSLogBiometrics_1;
    if (os_log_type_enabled((os_log_t)DSLogBiometrics_1, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235BFC000, v2, OS_LOG_TYPE_INFO, "Cannot reset TouchID due to device restrictions", buf, 2u);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = (+[DSTouchIDController hasMultipleFingerprints]
       || !+[DSTouchIDController isTouchIDEnrolled])
      && +[DSBiometricManager supportsMesa];
    v6 = *(uint64_t (**)(uint64_t, BOOL))(v4 + 16);
    return v6(v4, v5);
  }
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)DSTouchIDController;
  [(DSOBWelcomeController *)&v12 viewDidLoad];
  BOOL v3 = +[DSTouchIDController isTouchIDEnrolled];
  BOOL v4 = !v3;
  if (v3) {
    BOOL v5 = @"RESET_TOUCH_ID";
  }
  else {
    BOOL v5 = @"CONTINUE";
  }
  if (v4) {
    v6 = &selRef_enrollTouchID;
  }
  else {
    v6 = &selRef_resetTouchID;
  }
  id v7 = DSUILocStringForKey(v5);
  v8 = +[DSUIUtilities setUpBoldButtonForController:self title:v7 target:self selector:*v6];
  [(DSTouchIDController *)self setBoldButton:v8];

  v9 = DSUILocStringForKey(@"NOT_NOW");
  v10 = [(DSTouchIDController *)self delegate];
  id v11 = +[DSUIUtilities setUpLinkButtonForController:self title:v9 target:v10 selector:sel_pushNextPane];
}

+ (BOOL)isTouchIDEnrolled
{
  return +[DSBiometricManager touchIDCount] != 0;
}

+ (BOOL)hasMultipleFingerprints
{
  return +[DSBiometricManager touchIDCount] > 1;
}

- (void)resetTouchID
{
  if ([MEMORY[0x263F3A390] shouldShowBioRatchetFlow])
  {
    [(DSTouchIDController *)self startRatchetEvalInPresentationContext:self];
  }
  else
  {
    +[DSBiometricManager deleteAllTouchIDs];
    [(DSTouchIDController *)self beginEnrollment];
  }
}

- (void)updateTouchIDPaneConfiguration
{
  BOOL v3 = +[DSTouchIDController isTouchIDEnrolled];
  BOOL v4 = [(DSTouchIDController *)self boldButton];
  [v4 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

  BOOL v5 = [(DSTouchIDController *)self headerView];
  if (v3)
  {
    v6 = DSUILocStringForKey(@"TOUCH_ID_DETAIL");
    [v5 setDetailText:v6];

    id v7 = [(DSTouchIDController *)self boldButton];
    v8 = DSUILocStringForKey(@"RESET_TOUCH_ID");
    [v7 setTitle:v8 forState:0];
    v9 = &selRef_resetTouchID;
  }
  else
  {
    v10 = DSUILocStringForKey(@"TOUCH_ID_ENROLL_DETAIL");
    [v5 setDetailText:v10];

    id v7 = [(DSTouchIDController *)self boldButton];
    v8 = DSUILocStringForKey(@"CONTINUE");
    [v7 setTitle:v8 forState:0];
    v9 = &selRef_enrollTouchID;
  }

  id v11 = [(DSTouchIDController *)self boldButton];
  [v11 addTarget:self action:*v9 forControlEvents:64];
}

- (void)dealloc
{
  [(BiometricKitUIEnrollViewController *)self->_enrollController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)DSTouchIDController;
  [(DSTouchIDController *)&v3 dealloc];
}

- (void)beginEnrollment
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  objc_super v3 = (void *)getBiometricKitUIClass_softClass;
  uint64_t v17 = getBiometricKitUIClass_softClass;
  if (!getBiometricKitUIClass_softClass)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __getBiometricKitUIClass_block_invoke;
    v13[3] = &unk_264C6F0A8;
    v13[4] = &v14;
    __getBiometricKitUIClass_block_invoke((uint64_t)v13);
    objc_super v3 = (void *)v15[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v14, 8);
  BOOL v5 = [v4 sharedInstance];
  v6 = [v5 getEnrollUIViewController:1 bundleName:0];
  enrollController = self->_enrollController;
  self->_enrollController = v6;

  if (self->_enrollController)
  {
    v8 = [(DSTouchIDController *)self delegate];
    v9 = [v8 authContext];

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __38__DSTouchIDController_beginEnrollment__block_invoke;
    v11[3] = &unk_264C6F1D8;
    v11[4] = self;
    id v12 = v9;
    id v10 = v9;
    [v10 evaluatePolicy:1007 options:MEMORY[0x263EFFA78] reply:v11];
  }
}

void __38__DSTouchIDController_beginEnrollment__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = DSLogBiometrics_1;
    if (os_log_type_enabled((os_log_t)DSLogBiometrics_1, OS_LOG_TYPE_ERROR)) {
      __38__DSTouchIDController_beginEnrollment__block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __38__DSTouchIDController_beginEnrollment__block_invoke_328;
    v10[3] = &unk_264C6F058;
    objc_copyWeak(&v13, &location);
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = v8;
    uint64_t v12 = v9;
    dispatch_async(MEMORY[0x263EF83A0], v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __38__DSTouchIDController_beginEnrollment__block_invoke_328(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v2 = [WeakRetained enrollController];
  objc_super v3 = [a1[4] externalizedContext];
  [v2 setProperty:v3 forKey:@"credset"];

  id v4 = [WeakRetained enrollController];
  [v4 setDelegate:a1[5]];

  id v5 = objc_alloc(MEMORY[0x263F829B8]);
  id v6 = [WeakRetained enrollController];
  id v7 = (void *)[v5 initWithRootViewController:v6];

  [v7 setModalPresentationStyle:0];
  id v8 = [a1[5] navigationController];
  [v8 presentViewController:v7 animated:1 completion:0];
}

- (void)restartEnrollment
{
  [(DSTouchIDController *)self deleteIdentity];
  enrollController = self->_enrollController;
  [(BiometricKitUIEnrollViewController *)enrollController restartEnroll];
}

- (void)deleteIdentity
{
  if (self->_identity)
  {
    objc_msgSend(MEMORY[0x263F5FAF0], "removeIdentity:");
    identity = self->_identity;
    self->_identity = 0;
  }
}

- (void)addNavigationItems
{
  objc_super v3 = [(DSTouchIDController *)self enrollController];
  id v4 = [v3 navigationItem];
  id v5 = objc_alloc(MEMORY[0x263F824A8]);
  id v6 = DSUILocStringForKey(@"QUICK_EXIT");
  id v7 = [(DSTouchIDController *)self delegate];
  id v8 = (void *)[v5 initWithTitle:v6 style:0 target:v7 action:sel_quickExit];
  [v4 setRightBarButtonItem:v8];

  id v11 = [(DSTouchIDController *)self enrollController];
  uint64_t v9 = [v11 navigationItem];
  id v10 = [(DSTouchIDController *)self _cancelLeftNavigationItem];
  [v9 setLeftBarButtonItem:v10 animated:1];
}

- (id)_cancelLeftNavigationItem
{
  cancelLeftNavigationItem = self->_cancelLeftNavigationItem;
  if (!cancelLeftNavigationItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__userDidTapCancelButton_];
    id v5 = self->_cancelLeftNavigationItem;
    self->_cancelLeftNavigationItem = v4;

    cancelLeftNavigationItem = self->_cancelLeftNavigationItem;
  }
  return cancelLeftNavigationItem;
}

- (void)_userDidTapCancelButton:(id)a3
{
  id v4 = DSLogBiometrics_1;
  if (os_log_type_enabled((os_log_t)DSLogBiometrics_1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_235BFC000, v4, OS_LOG_TYPE_INFO, "Touch ID user did tap cancel", v6, 2u);
  }
  [(DSTouchIDController *)self deleteIdentity];
  id v5 = [(DSTouchIDController *)self navigationController];
  [v5 dismissViewControllerAnimated:1 completion:0];

  [(DSTouchIDController *)self updateTouchIDPaneConfiguration];
}

- (void)enrollResult:(int)a3 bkIdentity:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = [MEMORY[0x263F2AA68] manager];
    id v8 = [v6 uuid];
    uint64_t v9 = [v7 getIdentityFromUUID:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }
  switch(a3)
  {
    case 0:
      self->_enrollComplete = 0;
      [(DSTouchIDController *)self addNavigationItems];
      break;
    case 1:
      if (v9)
      {
        [v9 setType:1];
        id v11 = [MEMORY[0x263F5FAF0] nextIdentityName];
        [v9 setName:v11];

        id v10 = [MEMORY[0x263F2AA68] manager];
        [v10 updateIdentity:v9];
        goto LABEL_11;
      }
      uint64_t v14 = DSLogBiometrics_1;
      if (os_log_type_enabled((os_log_t)DSLogBiometrics_1, OS_LOG_TYPE_ERROR)) {
        -[DSTouchIDController enrollResult:bkIdentity:](v14);
      }
      break;
    case 3:
    case 6:
    case 7:
      if (v9)
      {
        id v10 = [MEMORY[0x263F2AA68] manager];
        [v10 removeIdentity:v9];
        goto LABEL_11;
      }
      break;
    case 4:
      self->_enrollComplete = 1;
      uint64_t v12 = [(DSTouchIDController *)self navigationController];
      [v12 dismissViewControllerAnimated:1 completion:0];

      id v10 = [(DSTouchIDController *)self delegate];
      [v10 pushNextPane];
LABEL_11:

      break;
    case 9:
      identity = self->_identity;
      self->_identity = 0;

      [(DSTouchIDController *)self restartEnrollment];
      break;
    default:
      break;
  }
}

- (void)startRatchetEvalInPresentationContext:(id)a3
{
  v18[4] = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263F10530];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = DSUIDTOLocStringForKey(@"RATCHET_ACTION_BUTTON_TITLE");
  [v6 setCountdownPrimaryActionTitle:v7];

  id v8 = [(DSTouchIDController *)self delegate];
  uint64_t v9 = [v8 deepLinkForCurrentFlowAndPane];

  id v10 = (void *)MEMORY[0x263F10528];
  v17[0] = &unk_26E91FB30;
  id v11 = DSUIDTOLocStringForKey(@"RATCHET_REASON_TOUCHID");
  v18[0] = v11;
  v17[1] = &unk_26E91FB48;
  uint64_t v12 = DSUIDTOLocStringForKey(@"RATCHET_ENDED_DETAIL_TOUCHID");
  v18[1] = v12;
  v17[2] = &unk_26E91FB60;
  id v13 = [NSURL URLWithString:v9];
  v17[3] = &unk_26E91FB78;
  v18[2] = v13;
  v18[3] = v5;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  v15 = [v10 makeViewControllerWithOptions:v14 configuration:v6];
  ratchetVC = self->_ratchetVC;
  self->_ratchetVC = v15;

  [(LARatchetViewController *)self->_ratchetVC setDelegate:self];
  [(LARatchetViewController *)self->_ratchetVC evaluateAndShowViewController];
}

- (void)ratchetViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(DSTouchIDController *)self delegate];
  uint64_t v12 = [v10 objectForKeyedSubscript:&unk_26E91FB48];

  if (v12)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__DSTouchIDController_ratchetViewController_didFinishWithResult_error___block_invoke;
    block[3] = &unk_264C6EAE8;
    void block[4] = self;
    id v24 = v11;
    id v25 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v13 = [v9 userInfo];
    uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263F10460]];

    if ([v9 code] || !v14)
    {
      uint64_t v16 = DSLogBiometrics_1;
      if (os_log_type_enabled((os_log_t)DSLogBiometrics_1, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v9;
        _os_log_impl(&dword_235BFC000, v16, OS_LOG_TYPE_INFO, "TouchID Change Ratchet not armed. Reason: %@", buf, 0xCu);
      }
      uint64_t v17 = [(DSTouchIDController *)self navigationController];
      v18 = [v17 topViewController];
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = objc_opt_class();

      if (v19 == v20)
      {
        v21 = [(DSTouchIDController *)self navigationController];
        id v22 = (id)[v21 popToViewController:self animated:0];

        [v11 pushNextPane];
      }
    }
    else if ([v14 rawValue] == 1)
    {
      v15 = DSLogBiometrics_1;
      if (os_log_type_enabled((os_log_t)DSLogBiometrics_1, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_235BFC000, v15, OS_LOG_TYPE_INFO, "TouchID Change Ratchet initiated, timer counting down. User exiting Safety Check.", buf, 2u);
      }
      [v11 exitFlowForRatchetWait];
    }
  }
}

void __71__DSTouchIDController_ratchetViewController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  +[DSBiometricManager deleteAllTouchIDs];
  [*(id *)(a1 + 32) beginEnrollment];
  [*(id *)(a1 + 40) sendSummaryAnalyticsWithEventName:@"com.apple.DigitalSeparation.RatchedEnded"];
  if (*(void *)(a1 + 48))
  {
    v2 = [*(id *)(a1 + 32) navigationController];
    objc_super v3 = [v2 viewControllers];
    id v5 = (id)[v3 mutableCopy];

    [v5 removeObject:*(void *)(a1 + 48)];
    id v4 = [*(id *)(a1 + 32) navigationController];
    [v4 setViewControllers:v5];
  }
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OBBoldTrayButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
}

- (BiometricKitUIEnrollViewController)enrollController
{
  return self->_enrollController;
}

- (void)setEnrollController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollController, 0);
  objc_storeStrong((id *)&self->_boldButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ratchetVC, 0);
  objc_storeStrong((id *)&self->_cancelLeftNavigationItem, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

void __38__DSTouchIDController_beginEnrollment__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235BFC000, a2, OS_LOG_TYPE_ERROR, "Error while evaluating Touch ID authentication policy, error %@", (uint8_t *)&v2, 0xCu);
}

- (void)enrollResult:(os_log_t)log bkIdentity:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_235BFC000, log, OS_LOG_TYPE_ERROR, "Error creating serverIdentity", v1, 2u);
}

@end