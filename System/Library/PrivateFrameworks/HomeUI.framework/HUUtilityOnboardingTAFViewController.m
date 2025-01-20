@interface HUUtilityOnboardingTAFViewController
- (BOOL)needsToWaitForPreload;
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUUtilityOnboardingTAFTableViewController)tableViewController;
- (HUUtilityOnboardingTAFViewController)initWithContext:(id)a3;
- (NSArray)otpFactors;
- (OBBoldTrayButton)continueButton;
- (UITextField)focusedTextField;
- (UIViewController)presentingVC;
- (_TtC6HomeUI24UtilityOnboardingContext)context;
- (id)_updateRightBarButton;
- (void)_continueTAFWithFutures:(id)a3;
- (void)_doneAccountDetails:(id)a3;
- (void)_presentErrorAlert;
- (void)_showSpinner;
- (void)didCompleteAllFields:(BOOL)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)selectedTextField:(id)a3;
- (void)setContext:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFocusedTextField:(id)a3;
- (void)setOtpFactors:(id)a3;
- (void)setPresentingVC:(id)a3;
- (void)setTableViewController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUUtilityOnboardingTAFViewController

- (HUUtilityOnboardingTAFViewController)initWithContext:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [HUUtilityOnboardingTAFItemManager alloc];
  v6 = [v4 config];
  v7 = [v6 fields];
  v8 = [v4 config];
  v9 = [v8 sections];
  v10 = [(HUUtilityOnboardingTAFItemManager *)v5 initWithDelegate:self fields:v7 sections:v9];

  v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = self;
    __int16 v22 = 2080;
    v23 = "-[HUUtilityOnboardingTAFViewController initWithContext:]";
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@:%s created item manager", buf, 0x16u);
  }

  v12 = [[HUUtilityOnboardingTAFTableViewController alloc] initWithContext:v4 itemManager:v10 tableViewStyle:1];
  [(HUUtilityOnboardingTAFViewController *)self setTableViewController:v12];

  v13 = _HULocalizedStringWithDefaultValue(@"HUUtilityOnboardingAccountLookup_Title", @"HUUtilityOnboardingAccountLookup_Title", 1);
  v14 = _HULocalizedStringWithDefaultValue(@"HUUtilityDiscoveryTAF_Detail", @"HUUtilityDiscoveryTAF_Detail", 1);
  v15 = [(HUUtilityOnboardingTAFViewController *)self tableViewController];
  v19.receiver = self;
  v19.super_class = (Class)HUUtilityOnboardingTAFViewController;
  v16 = [(HUItemTableOBWelcomeController *)&v19 initWithTitle:v13 detailText:v14 icon:0 contentLayout:2 itemTableViewController:v15];

  [(HUUtilityOnboardingTAFViewController *)v16 setContext:v4];
  v17 = [(HUUtilityOnboardingTAFViewController *)v16 tableViewController];
  [v17 setDelegate:v16];

  return v16;
}

- (BOOL)needsToWaitForPreload
{
  return 1;
}

- (void)viewDidLoad
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)HUUtilityOnboardingTAFViewController;
  [(HUItemTableOBWelcomeController *)&v27 viewDidLoad];
  v3 = [(HUUtilityOnboardingTAFViewController *)self headerView];
  id v4 = [v3 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v4 withIDDictionary:&unk_1F19B5E08];

  v5 = [(HUUtilityOnboardingTAFViewController *)self context];
  v6 = [(HUUtilityOnboardingTAFViewController *)self headerView];
  [v5 updateIconWithHeaderView:v6 axID:@"Home.OnboardingView.Utility.TAF.Icon"];

  v7 = [(HUUtilityOnboardingTAFViewController *)self context];
  [v7 setOnboardingMethod:1];

  v8 = [(HUUtilityOnboardingTAFViewController *)self context];
  [v8 setDidAttemptPasswordlessMethod:1];

  v9 = [(HUUtilityOnboardingTAFViewController *)self navigationController];
  v10 = [v9 viewControllers];
  uint64_t v11 = [v10 indexOfObject:self];

  if (v11)
  {
    v12 = [(HUUtilityOnboardingTAFViewController *)self navigationController];
    v13 = [v12 viewControllers];
    v14 = [v13 objectAtIndex:v11 - 1];
    [(HUUtilityOnboardingTAFViewController *)self setPresentingVC:v14];
  }
  v15 = [(HUUtilityOnboardingTAFViewController *)self _updateRightBarButton];
  BOOL v16 = [(UtilityOnboardingContext *)self->_context allRequiredFieldsComplete];
  [v15 setEnabled:v16];
  v17 = HFLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v29 = self;
    __int16 v30 = 2080;
    v31 = "-[HUUtilityOnboardingTAFViewController viewDidLoad]";
    __int16 v32 = 1024;
    BOOL v33 = v16;
    _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "%@:%s ENABLING BUTTON --> %{BOOL}d", buf, 0x1Cu);
  }

  v18 = [(OBBaseWelcomeController *)self navigationItem];
  [v18 setRightBarButtonItem:v15];

  objc_super v19 = HFLogForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v29 = self;
    __int16 v30 = 2080;
    v31 = "-[HUUtilityOnboardingTAFViewController viewDidLoad]";
    _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "%@:%s: presented: HUUtilityOnboardingTAFViewController", buf, 0x16u);
  }

  v20 = [(HUUtilityOnboardingTAFViewController *)self presentingVC];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v22 = 0;
  }
  else
  {
    v23 = [(HUUtilityOnboardingTAFViewController *)self presentingVC];
    objc_opt_class();
    char v24 = objc_opt_isKindOfClass();

    if (v24) {
      uint64_t v22 = 7;
    }
    else {
      uint64_t v22 = 2;
    }
  }
  v25 = [(HUUtilityOnboardingTAFViewController *)self context];
  v26 = [v25 utilityID];
  +[HUHomeEnergyAnalyticsHelper sendUtilityAccountLookupViewEventWithUtilityID:v26 presentingVC:v22];
}

- (id)_updateRightBarButton
{
  v3 = [(HUUtilityOnboardingTAFViewController *)self presentingVC];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v5 = objc_alloc(MEMORY[0x1E4F427C0]);
  if (isKindOfClass)
  {
    v6 = _HULocalizedStringWithDefaultValue(@"HUDoneTitle", @"HUDoneTitle", 1);
    v7 = (void *)[v5 initWithTitle:v6 style:2 target:self action:sel__doneAccountDetails_];

    [v7 setAccessibilityIdentifier:@"Home.OnboardingView.Utility.TAF.DoneButton"];
    v8 = [(OBBaseWelcomeController *)self navigationItem];
    v9 = [v8 leftBarButtonItem];
    [v9 setEnabled:0];
  }
  else
  {
    v10 = _HULocalizedStringWithDefaultValue(@"HUContinueTitle", @"HUContinueTitle", 1);
    v7 = (void *)[v5 initWithTitle:v10 style:2 target:self action:sel__continueTAFWithFutures_];

    [v7 setAccessibilityIdentifier:@"Home.OnboardingView.Utility.TAF.ContinueButton"];
    [v7 setHidden:0];
  }

  return v7;
}

- (void)_presentErrorAlert
{
  id v4 = (void *)MEMORY[0x1E4F42728];
  id v5 = _HULocalizedStringWithDefaultValue(@"HUUtilityOnboardingTAF_EmailAlert_Title", @"HUUtilityOnboardingTAF_EmailAlert_Title", 1);
  v6 = _HULocalizedStringWithDefaultValue(@"HUUtilityOnboardingTAF_EmailAlert_Detail", @"HUUtilityOnboardingTAF_EmailAlert_Detail", 1);
  v7 = [v4 alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  v8 = (void *)MEMORY[0x1E4F42720];
  v9 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__HUUtilityOnboardingTAFViewController__presentErrorAlert__block_invoke;
  v11[3] = &unk_1E638E610;
  v11[4] = self;
  v11[5] = a2;
  v10 = [v8 actionWithTitle:v9 style:0 handler:v11];
  [v7 addAction:v10];

  [(HUUtilityOnboardingTAFViewController *)self presentViewController:v7 animated:1 completion:0];
}

void __58__HUUtilityOnboardingTAFViewController__presentErrorAlert__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped alert button", (uint8_t *)&v5, 0x16u);
  }
}

- (void)_continueTAFWithFutures:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v23 = (uint64_t)v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped %@ button", buf, 0x20u);
  }
  v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = NSStringFromSelector(a2);
    v10 = [(HUUtilityOnboardingTAFViewController *)self context];
    uint64_t v11 = [v10 tafResponses];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v23 = (uint64_t)v11;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "*** %@:%@ Retrieving TAF RESPONSES %@", buf, 0x20u);
  }
  v12 = [(HUUtilityOnboardingTAFViewController *)self context];
  int v13 = [v12 showInvalidEmailAlert];

  if (v13)
  {
    [(HUUtilityOnboardingTAFViewController *)self _presentErrorAlert];
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v23 = 7;
    [(HUUtilityOnboardingTAFViewController *)self _showSpinner];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __64__HUUtilityOnboardingTAFViewController__continueTAFWithFutures___block_invoke;
    v21[3] = &unk_1E6385108;
    v21[4] = self;
    v14 = [MEMORY[0x1E4F7A0D8] futureWithBlock:v21];
    v15 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
    BOOL v16 = [v14 reschedule:v15];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __64__HUUtilityOnboardingTAFViewController__continueTAFWithFutures___block_invoke_3;
    v20[3] = &unk_1E6384D58;
    v20[4] = self;
    v20[5] = a2;
    id v17 = (id)[v16 addSuccessBlock:v20];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __64__HUUtilityOnboardingTAFViewController__continueTAFWithFutures___block_invoke_139;
    v19[3] = &unk_1E638E638;
    v19[4] = self;
    v19[5] = buf;
    id v18 = (id)[v16 addFailureBlock:v19];

    _Block_object_dispose(buf, 8);
  }
}

void __64__HUUtilityOnboardingTAFViewController__continueTAFWithFutures___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) context];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__HUUtilityOnboardingTAFViewController__continueTAFWithFutures___block_invoke_2;
  v6[3] = &unk_1E6386708;
  id v7 = v3;
  id v5 = v3;
  [v4 verifyAddressAndSubmitTAFWithCompletionHandler:v6];
}

uint64_t __64__HUUtilityOnboardingTAFViewController__continueTAFWithFutures___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithNoResult];
  }
}

void __64__HUUtilityOnboardingTAFViewController__continueTAFWithFutures___block_invoke_3(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CA60];
  id v18 = @"HUUtilityDiscoveryOnboardingKey_UserInput";
  v19[0] = &unk_1F19B4A78;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  id v4 = [v2 dictionaryWithDictionary:v3];

  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v12 = 138412802;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    v15 = v7;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@ Finished %@ with results  %@", (uint8_t *)&v12, 0x20u);
  }
  v8 = [*(id *)(a1 + 32) delegate];
  [v8 viewController:*(void *)(a1 + 32) didFinishWithConfigurationResults:v4];

  uint64_t v9 = [*(id *)(a1 + 32) _updateRightBarButton];
  v10 = [*(id *)(a1 + 32) navigationItem];
  [v10 setRightBarButtonItem:v9];

  uint64_t v11 = [*(id *)(a1 + 32) navigationItem];
  [v11 setHidesBackButton:0];
}

void __64__HUUtilityOnboardingTAFViewController__continueTAFWithFutures___block_invoke_139(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: Address Verification OR TAF Future failed (%@)", buf, 0x16u);
  }

  uint64_t v6 = [*(id *)(a1 + 32) delegate];
  v13[0] = @"HUUtilityDiscoveryOnboardingKey_UserInput";
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), @"HUUtilityDiscoveryOnboardingKey_UserInput");
  v13[1] = @"HUUtilityDiscoveryOnboardingKey_Error";
  v14[0] = v8;
  v14[1] = v3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  [v6 viewController:v7 didFinishWithConfigurationResults:v9];

  v10 = [*(id *)(a1 + 32) _updateRightBarButton];
  uint64_t v11 = [*(id *)(a1 + 32) navigationItem];
  [v11 setRightBarButtonItem:v10];

  int v12 = [*(id *)(a1 + 32) navigationItem];
  [v12 setHidesBackButton:0];
}

- (void)_doneAccountDetails:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setObject:&unk_1F19B4A90 forKeyedSubscript:@"HUUtilityDiscoveryOnboardingKey_UserInput"];
  id v4 = [(HUUtilityOnboardingTAFViewController *)self delegate];
  [v4 viewController:self didFinishWithConfigurationResults:v5];
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)HUUtilityOnboardingTAFViewController;
  [(HUUtilityOnboardingTAFViewController *)&v6 viewWillDisappear:a3];
  if ([(HUUtilityOnboardingTAFViewController *)self isMovingFromParentViewController])
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v8 = self;
      __int16 v9 = 2080;
      v10 = "-[HUUtilityOnboardingTAFViewController viewWillDisappear:]";
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped BACK button", buf, 0x16u);
    }

    id v5 = [(HUUtilityOnboardingTAFViewController *)self delegate];
    [v5 viewControllerDidGoBack:self];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = [(HUUtilityOnboardingTAFViewController *)self focusedTextField];

  if (v4)
  {
    id v5 = [(HUUtilityOnboardingTAFViewController *)self focusedTextField];
    [v5 resignFirstResponder];

    [(HUUtilityOnboardingTAFViewController *)self setFocusedTextField:0];
  }
}

- (void)didCompleteAllFields:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(OBBaseWelcomeController *)self navigationItem];
  id v4 = [v5 rightBarButtonItem];
  [v4 setEnabled:v3];
}

- (void)selectedTextField:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412802;
    uint64_t v7 = self;
    __int16 v8 = 2080;
    __int16 v9 = "-[HUUtilityOnboardingTAFViewController selectedTextField:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s Selected text field %@", (uint8_t *)&v6, 0x20u);
  }

  [(HUUtilityOnboardingTAFViewController *)self setFocusedTextField:v4];
}

- (void)_showSpinner
{
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v6];
  id v4 = [(OBBaseWelcomeController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  id v5 = [(OBBaseWelcomeController *)self navigationItem];
  [v5 setHidesBackButton:1];

  [v6 startAnimating];
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (HUConfigurationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUConfigurationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC6HomeUI24UtilityOnboardingContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (OBBoldTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (HUUtilityOnboardingTAFTableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
}

- (NSArray)otpFactors
{
  return self->_otpFactors;
}

- (void)setOtpFactors:(id)a3
{
}

- (UIViewController)presentingVC
{
  return self->_presentingVC;
}

- (void)setPresentingVC:(id)a3
{
}

- (UITextField)focusedTextField
{
  return self->_focusedTextField;
}

- (void)setFocusedTextField:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedTextField, 0);
  objc_storeStrong((id *)&self->_presentingVC, 0);
  objc_storeStrong((id *)&self->_otpFactors, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end