@interface DSFaceIDController
+ (BOOL)hasAlternateAppearance;
+ (BOOL)isPearlEnrolled;
+ (BOOL)supportsPearl;
- (DSBiometricManager)biometricManager;
- (DSFaceIDController)init;
- (DSNavigationDelegate)delegate;
- (LAContext)authContext;
- (OBBoldTrayButton)boldButton;
- (UINavigationController)faceIDEnrollmentNavigationController;
- (void)_didTapCancelButton;
- (void)beginFaceIDEnrollment;
- (void)pearlEnrollController:(id)a3 finishedEnrollWithError:(id)a4;
- (void)ratchetViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5;
- (void)resetFaceID;
- (void)setAuthContext:(id)a3;
- (void)setBiometricManager:(id)a3;
- (void)setBoldButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFaceIDEnrollmentNavigationController:(id)a3;
- (void)shouldShowWithCompletion:(id)a3;
- (void)startRatchetEvalInPresentationContext:(id)a3;
- (void)updateFaceIDPaneConfiguration;
- (void)viewDidLoad;
@end

@implementation DSFaceIDController

- (DSFaceIDController)init
{
  os_log_t v3 = os_log_create("com.apple.DigitalSeparation", "DSBiometrics");
  v4 = (void *)DSLogBiometrics;
  DSLogBiometrics = (uint64_t)v3;

  v5 = (void *)MEMORY[0x263F82818];
  v6 = [MEMORY[0x263F825C8] systemBlueColor];
  v7 = [v5 configurationWithHierarchicalColor:v6];

  v8 = DSUILocStringForKey(@"FACE_ID");
  v9 = DSUILocStringForKey(@"FACE_ID_DETAIL");
  v10 = [MEMORY[0x263F827E8] systemImageNamed:@"faceid" withConfiguration:v7];
  v13.receiver = self;
  v13.super_class = (Class)DSFaceIDController;
  v11 = [(DSFaceIDController *)&v13 initWithTitle:v8 detailText:v9 icon:v10];

  return v11;
}

- (void)shouldShowWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = sharedWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__DSFaceIDController_shouldShowWithCompletion___block_invoke;
  block[3] = &unk_264C6EBA8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __47__DSFaceIDController_shouldShowWithCompletion___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F3A368] isFingerprintModificationRestricted])
  {
    v2 = DSLogBiometrics;
    if (os_log_type_enabled((os_log_t)DSLogBiometrics, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235BFC000, v2, OS_LOG_TYPE_INFO, "Cannot reset FaceID due to device restrictions", buf, 2u);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = (+[DSFaceIDController hasAlternateAppearance]
       || !+[DSFaceIDController isPearlEnrolled])
      && +[DSFaceIDController supportsPearl];
    v6 = *(uint64_t (**)(uint64_t, BOOL))(v4 + 16);
    return v6(v4, v5);
  }
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)DSFaceIDController;
  [(DSOBWelcomeController *)&v13 viewDidLoad];
  BOOL v3 = +[DSFaceIDController isPearlEnrolled];
  uint64_t v4 = [(DSFaceIDController *)self headerView];
  if (v3)
  {
    BOOL v5 = DSUILocStringForKey(@"FACE_ID_DETAIL");
    [v4 setDetailText:v5];

    v6 = DSUILocStringForKey(@"RESET_FACEID");
    id v7 = sel_resetFaceID;
  }
  else
  {
    v8 = DSUILocStringForKey(@"FACE_ID_ENROLL_DETAIL");
    [v4 setDetailText:v8];

    v6 = DSUILocStringForKey(@"CONTINUE");
    id v7 = sel_beginFaceIDEnrollment;
  }
  v9 = +[DSUIUtilities setUpBoldButtonForController:self title:v6 target:self selector:v7];
  [(DSFaceIDController *)self setBoldButton:v9];

  v10 = DSUILocStringForKey(@"NOT_NOW");
  v11 = [(DSFaceIDController *)self delegate];
  id v12 = +[DSUIUtilities setUpLinkButtonForController:self title:v10 target:v11 selector:sel_pushNextPane];
}

+ (BOOL)supportsPearl
{
  return +[DSBiometricManager supportsPearl];
}

+ (BOOL)isPearlEnrolled
{
  return +[DSBiometricManager pearlIdentityCount] != 0;
}

+ (BOOL)hasAlternateAppearance
{
  return +[DSBiometricManager pearlIdentityCount] > 1;
}

- (void)updateFaceIDPaneConfiguration
{
  BOOL v3 = +[DSFaceIDController isPearlEnrolled];
  uint64_t v4 = [(DSFaceIDController *)self boldButton];
  [v4 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

  BOOL v5 = [(DSFaceIDController *)self headerView];
  if (v3)
  {
    v6 = DSUILocStringForKey(@"FACE_ID_DETAIL");
    [v5 setDetailText:v6];

    id v7 = [(DSFaceIDController *)self boldButton];
    v8 = DSUILocStringForKey(@"RESET_FACEID");
    [v7 setTitle:v8 forState:0];
    v9 = &selRef_resetFaceID;
  }
  else
  {
    v10 = DSUILocStringForKey(@"FACE_ID_ENROLL_DETAIL");
    [v5 setDetailText:v10];

    id v7 = [(DSFaceIDController *)self boldButton];
    v8 = DSUILocStringForKey(@"CONTINUE");
    [v7 setTitle:v8 forState:0];
    v9 = &selRef_beginFaceIDEnrollment;
  }

  id v11 = [(DSFaceIDController *)self boldButton];
  [v11 addTarget:self action:*v9 forControlEvents:64];
}

- (void)resetFaceID
{
  if ([MEMORY[0x263F3A390] shouldShowBioRatchetFlow])
  {
    [(DSFaceIDController *)self startRatchetEvalInPresentationContext:self];
  }
  else
  {
    [(DSFaceIDController *)self beginFaceIDEnrollment];
  }
}

- (void)beginFaceIDEnrollment
{
  BOOL v3 = [(DSFaceIDController *)self biometricManager];

  if (!v3)
  {
    uint64_t v4 = [DSBiometricManager alloc];
    BOOL v5 = [(DSFaceIDController *)self authContext];
    v6 = [(DSBiometricManager *)v4 initWithContext:v5];
    [(DSFaceIDController *)self setBiometricManager:v6];
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  id v7 = (void *)getBKUIPearlEnrollControllerClass_softClass;
  uint64_t v21 = getBKUIPearlEnrollControllerClass_softClass;
  if (!getBKUIPearlEnrollControllerClass_softClass)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __getBKUIPearlEnrollControllerClass_block_invoke;
    v17[3] = &unk_264C6F0A8;
    v17[4] = &v18;
    __getBKUIPearlEnrollControllerClass_block_invoke((uint64_t)v17);
    id v7 = (void *)v19[3];
  }
  v8 = v7;
  _Block_object_dispose(&v18, 8);
  id v9 = objc_alloc_init(v8);
  [v9 setEnrollmentConfiguration:0];
  v10 = [(DSFaceIDController *)self delegate];
  id v11 = [v10 authContext];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke;
  v14[3] = &unk_264C6F080;
  v14[4] = self;
  id v15 = v9;
  id v16 = v11;
  id v12 = v11;
  id v13 = v9;
  [v12 evaluatePolicy:1007 options:MEMORY[0x263EFFA78] reply:v14];
}

void __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    objc_initWeak(&location, a1[4]);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke_2;
    v12[3] = &unk_264C6F058;
    objc_copyWeak(&v15, &location);
    id v13 = a1[5];
    id v14 = a1[6];
    dispatch_async(MEMORY[0x263EF83A0], v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    goto LABEL_9;
  }
  v8 = [v6 domain];
  if ([v8 isEqualToString:*MEMORY[0x263F10440]])
  {
    uint64_t v9 = [v7 code];

    if (v9 == -5)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke_3;
      block[3] = &unk_264C6E7D0;
      void block[4] = a1[4];
      dispatch_async(MEMORY[0x263EF83A0], block);
      goto LABEL_9;
    }
  }
  else
  {
  }
  v10 = DSLogBiometrics;
  if (os_log_type_enabled((os_log_t)DSLogBiometrics, OS_LOG_TYPE_ERROR)) {
    __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke_cold_1((uint64_t)v7, v10);
  }
LABEL_9:
}

void __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v2 = [WeakRetained biometricManager];
  [v2 deleteAllPearlIdentities];

  id v3 = a1[4];
  uint64_t v4 = [a1[5] externalizedContext];
  [v3 primeWithExternalizedAuthContext:v4];

  [a1[4] setDelegate:WeakRetained];
  id v5 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:a1[4]];
  [WeakRetained setFaceIDEnrollmentNavigationController:v5];

  id v6 = [WeakRetained faceIDEnrollmentNavigationController];
  [v6 setModalPresentationStyle:0];

  id v7 = [WeakRetained navigationController];
  v8 = [WeakRetained faceIDEnrollmentNavigationController];
  [v7 presentViewController:v8 animated:1 completion:0];

  uint64_t v9 = [a1[4] navigationItem];
  id v10 = objc_alloc(MEMORY[0x263F824A8]);
  id v11 = DSUILocStringForKey(@"QUICK_EXIT");
  id v12 = [WeakRetained delegate];
  id v13 = (void *)[v10 initWithTitle:v11 style:0 target:v12 action:sel_quickExit];
  [v9 setRightBarButtonItem:v13];
}

void __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke_3(uint64_t a1)
{
  v2 = DSLogBiometrics;
  if (os_log_type_enabled((os_log_t)DSLogBiometrics, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235BFC000, v2, OS_LOG_TYPE_INFO, "Cannot evaluate authentication policy for FaceID, no passcode set.", buf, 2u);
  }
  id v3 = (void *)MEMORY[0x263F82418];
  uint64_t v4 = DSUILocStringForKey(@"FACEID_REQUIRES_PASSCODE_TITLE");
  id v5 = DSUILocStringForKey(@"FACEID_REQUIRES_PASSCODE_DETAIL");
  id v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  id v7 = (void *)MEMORY[0x263F82400];
  v8 = DSUILocStringForKey(@"SKIP");
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke_343;
  v14[3] = &unk_264C6E848;
  v14[4] = *(void *)(a1 + 32);
  uint64_t v9 = [v7 actionWithTitle:v8 style:0 handler:v14];
  [v6 addAction:v9];

  id v10 = (void *)MEMORY[0x263F82400];
  id v11 = DSUILocStringForKey(@"BACK_TO_PASSCODE");
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke_2_348;
  v13[3] = &unk_264C6E848;
  v13[4] = *(void *)(a1 + 32);
  id v12 = [v10 actionWithTitle:v11 style:1 handler:v13];
  [v6 addAction:v12];

  [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
}

void __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke_343(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 pushNextPane];
}

void __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke_2_348(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popViewControllerAnimated:1];
}

- (void)pearlEnrollController:(id)a3 finishedEnrollWithError:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = DSLogBiometrics;
  if (os_log_type_enabled((os_log_t)DSLogBiometrics, OS_LOG_TYPE_INFO))
  {
    int v19 = 138543362;
    id v20 = v7;
    _os_log_impl(&dword_235BFC000, v8, OS_LOG_TYPE_INFO, "Enroll finished with error: %{public}@", (uint8_t *)&v19, 0xCu);
  }
  if (!v7)
  {
    id v11 = [(DSFaceIDController *)self navigationController];
    [v11 dismissViewControllerAnimated:1 completion:0];

    id v12 = [(DSFaceIDController *)self delegate];
    [v12 pushNextPane];
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v9 = [v7 domain];
  if (![v9 isEqualToString:@"com.apple.biometrickitui.pearl_enroll"])
  {

LABEL_9:
    id v13 = [v7 domain];
    if ([v13 isEqualToString:@"com.apple.biometrickitui.pearl_enroll"])
    {
      uint64_t v14 = [v7 code];

      if (v14 != -2)
      {
LABEL_17:
        id v12 = [(DSFaceIDController *)self navigationController];
        [v12 dismissViewControllerAnimated:1 completion:0];
        goto LABEL_18;
      }
      id v15 = [v7 userInfo];
      id v13 = [v15 objectForKeyedSubscript:*MEMORY[0x263F08608]];

      id v16 = [v13 domain];
      if ([v16 isEqualToString:@"com.apple.preferences.biokit"])
      {
        uint64_t v17 = [v13 code];

        if (v17 == 8)
        {
          uint64_t v18 = DSLogBiometrics;
          if (os_log_type_enabled((os_log_t)DSLogBiometrics, OS_LOG_TYPE_ERROR)) {
            -[DSFaceIDController pearlEnrollController:finishedEnrollWithError:](v18);
          }
        }
      }
      else
      {
      }
    }

    goto LABEL_17;
  }
  uint64_t v10 = [v7 code];

  if (v10 != -1) {
    goto LABEL_9;
  }
  [(DSFaceIDController *)self _didTapCancelButton];
LABEL_19:
}

- (void)_didTapCancelButton
{
  id v3 = [(DSFaceIDController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  [(DSFaceIDController *)self updateFaceIDPaneConfiguration];
}

- (void)startRatchetEvalInPresentationContext:(id)a3
{
  v18[4] = *MEMORY[0x263EF8340];
  uint64_t v4 = (objc_class *)MEMORY[0x263F10530];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = DSUIDTOLocStringForKey(@"RATCHET_ACTION_BUTTON_TITLE");
  [v6 setCountdownPrimaryActionTitle:v7];

  v8 = [(DSFaceIDController *)self delegate];
  uint64_t v9 = [v8 deepLinkForCurrentFlowAndPane];

  uint64_t v10 = (void *)MEMORY[0x263F10528];
  v17[0] = &unk_26E91FA10;
  id v11 = DSUIDTOLocStringForKey(@"RATCHET_REASON_FACEID");
  v18[0] = v11;
  v17[1] = &unk_26E91FA28;
  id v12 = DSUIDTOLocStringForKey(@"RATCHET_ENDED_DETAIL_FACEID");
  v18[1] = v12;
  v17[2] = &unk_26E91FA40;
  id v13 = [NSURL URLWithString:v9];
  v17[3] = &unk_26E91FA58;
  v18[2] = v13;
  v18[3] = v5;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  id v15 = [v10 makeViewControllerWithOptions:v14 configuration:v6];
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
  id v11 = [(DSFaceIDController *)self delegate];
  id v12 = [v10 objectForKeyedSubscript:&unk_26E91FA28];

  if (v12)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__DSFaceIDController_ratchetViewController_didFinishWithResult_error___block_invoke;
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
      id v16 = DSLogBiometrics;
      if (os_log_type_enabled((os_log_t)DSLogBiometrics, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v9;
        _os_log_impl(&dword_235BFC000, v16, OS_LOG_TYPE_INFO, "FaceID Change Ratchet not armed. Reason: %@", buf, 0xCu);
      }
      uint64_t v17 = [(DSFaceIDController *)self navigationController];
      uint64_t v18 = [v17 topViewController];
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = objc_opt_class();

      if (v19 == v20)
      {
        uint64_t v21 = [(DSFaceIDController *)self navigationController];
        id v22 = (id)[v21 popToViewController:self animated:0];

        [v11 pushNextPane];
      }
    }
    else if ([v14 rawValue] == 1)
    {
      id v15 = DSLogBiometrics;
      if (os_log_type_enabled((os_log_t)DSLogBiometrics, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_235BFC000, v15, OS_LOG_TYPE_INFO, "FaceID Change Ratchet initiated, timer counting down. User exiting Safety Check.", buf, 2u);
      }
      [v11 exitFlowForRatchetWait];
    }
  }
}

void __70__DSFaceIDController_ratchetViewController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) beginFaceIDEnrollment];
  [*(id *)(a1 + 40) sendSummaryAnalyticsWithEventName:@"com.apple.DigitalSeparation.RatchedEnded"];
  if (*(void *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) navigationController];
    id v3 = [v2 viewControllers];
    id v5 = (id)[v3 mutableCopy];

    [v5 removeObject:*(void *)(a1 + 48)];
    uint64_t v4 = [*(id *)(a1 + 32) navigationController];
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

- (LAContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (UINavigationController)faceIDEnrollmentNavigationController
{
  return self->_faceIDEnrollmentNavigationController;
}

- (void)setFaceIDEnrollmentNavigationController:(id)a3
{
}

- (OBBoldTrayButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
}

- (DSBiometricManager)biometricManager
{
  return self->_biometricManager;
}

- (void)setBiometricManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometricManager, 0);
  objc_storeStrong((id *)&self->_boldButton, 0);
  objc_storeStrong((id *)&self->_faceIDEnrollmentNavigationController, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ratchetVC, 0);
}

void __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "-[DSFaceIDController beginFaceIDEnrollment]_block_invoke_3";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_235BFC000, a2, OS_LOG_TYPE_ERROR, "%s: Encountered error '%{public}@' when trying to authenticate", (uint8_t *)&v2, 0x16u);
}

- (void)pearlEnrollController:(os_log_t)log finishedEnrollWithError:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_235BFC000, log, OS_LOG_TYPE_ERROR, "DS Enroll observed interlock error", v1, 2u);
}

@end