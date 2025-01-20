@interface HUUtilityOnboardingOTPSelectionViewController
- (Class)onboardingFlowClass;
- (HFItem)selectedOTPMethod;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUUtilityOnboardingOTPSelectionTableViewController)tableView;
- (HUUtilityOnboardingOTPSelectionViewController)initWithContext:(id)a3;
- (OBTrayButton)continueButton;
- (_TtC6HomeUI24UtilityOnboardingContext)context;
- (id)_requestOTP;
- (void)_sendCode:(id)a3;
- (void)setContext:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedOTPMethod:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectOTPMethod:(id)a4;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUUtilityOnboardingOTPSelectionViewController

- (HUUtilityOnboardingOTPSelectionViewController)initWithContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 otpFactors];
  v6 = [[HUUtilityOnboardingOTPSelectionItemManager alloc] initWithDelegate:self context:v4];
  v7 = [[HUUtilityOnboardingOTPSelectionTableViewController alloc] initWithItemManager:v6];
  [(HUUtilityOnboardingOTPSelectionViewController *)self setTableView:v7];

  if ((unint64_t)[v5 count] >= 2)
  {
    v8 = @"HUUtilityOnboardingOTPSelectionDetail";
LABEL_7:
    v10 = _HULocalizedStringWithDefaultValue(v8, v8, 1);
    goto LABEL_8;
  }
  v9 = objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_43);

  v10 = objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_85);

  if (v9)
  {
    v8 = @"HUUtilityOnboardingOTPSelectionDetailSMS";
    goto LABEL_7;
  }
  if (v10)
  {
    v8 = @"HUUtilityOnboardingOTPSelectionDetailEmail";
    goto LABEL_7;
  }
LABEL_8:
  v11 = _HULocalizedStringWithDefaultValue(@"HUUtilityOnboardingOTPSelectionTitle", @"HUUtilityOnboardingOTPSelectionTitle", 1);
  v12 = [(HUUtilityOnboardingOTPSelectionViewController *)self tableView];
  v16.receiver = self;
  v16.super_class = (Class)HUUtilityOnboardingOTPSelectionViewController;
  v13 = [(HUItemTableOBWelcomeController *)&v16 initWithTitle:v11 detailText:v10 icon:0 contentLayout:2 itemTableViewController:v12];

  [(HUUtilityOnboardingOTPSelectionViewController *)v13 setContext:v4];
  v14 = [(HUUtilityOnboardingOTPSelectionViewController *)v13 tableView];
  [v14 setDelegate:v13];

  return v13;
}

uint64_t __65__HUUtilityOnboardingOTPSelectionViewController_initWithContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"factorType"];
  uint64_t v3 = [v2 isEqualToString:@"SMS"];

  return v3;
}

uint64_t __65__HUUtilityOnboardingOTPSelectionViewController_initWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"factorType"];
  uint64_t v3 = [v2 isEqualToString:@"EMAIL"];

  return v3;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)HUUtilityOnboardingOTPSelectionViewController;
  [(HUItemTableOBWelcomeController *)&v19 viewDidLoad];
  uint64_t v3 = [(HUUtilityOnboardingOTPSelectionViewController *)self headerView];
  id v4 = [v3 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v4 withIDDictionary:&unk_1F19B5B10];

  v5 = [(HUUtilityOnboardingOTPSelectionViewController *)self context];
  v6 = [(HUUtilityOnboardingOTPSelectionViewController *)self headerView];
  [v5 updateIconWithHeaderView:v6 axID:@"Home.OnboardingView.Utility.OTPSelection.Icon"];

  v7 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUUtilityOnboardingOTPSelectionViewController *)self setContinueButton:v7];

  v8 = [(HUUtilityOnboardingOTPSelectionViewController *)self continueButton];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v9 = [(HUUtilityOnboardingOTPSelectionViewController *)self continueButton];
  v10 = _HULocalizedStringWithDefaultValue(@"HUUtilityOnboardingOTPSelectionTitle", @"HUUtilityOnboardingOTPSelectionTitle", 1);
  [v9 setTitle:v10 forState:0];

  v11 = [(HUUtilityOnboardingOTPSelectionViewController *)self continueButton];
  [v11 setAccessibilityIdentifier:@"Home.OnboardingView.Utility.OTPSelection.SendCodeButton"];

  v12 = [(HUUtilityOnboardingOTPSelectionViewController *)self continueButton];
  [v12 addTarget:self action:sel__sendCode_ forControlEvents:64];

  v13 = [(HUUtilityOnboardingOTPSelectionViewController *)self buttonTray];
  v14 = [(HUUtilityOnboardingOTPSelectionViewController *)self continueButton];
  [v13 addButton:v14];

  v15 = [(HUUtilityOnboardingOTPSelectionViewController *)self context];
  objc_super v16 = [v15 utilityID];
  v17 = [(HUUtilityOnboardingOTPSelectionViewController *)self context];
  v18 = [v17 otpFactors];
  +[HUHomeEnergyAnalyticsHelper sendUtilityOTPMethodSelectionSheetViewEventWithUtilityID:numOfMethods:](HUHomeEnergyAnalyticsHelper, "sendUtilityOTPMethodSelectionSheetViewEventWithUtilityID:numOfMethods:", v16, [v18 count]);
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)HUUtilityOnboardingOTPSelectionViewController;
  [(HUUtilityOnboardingOTPSelectionViewController *)&v6 viewWillDisappear:a3];
  if ([(HUUtilityOnboardingOTPSelectionViewController *)self isMovingFromParentViewController])
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v8 = self;
      __int16 v9 = 2080;
      v10 = "-[HUUtilityOnboardingOTPSelectionViewController viewWillDisappear:]";
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped BACK button", buf, 0x16u);
    }

    v5 = [(HUUtilityOnboardingOTPSelectionViewController *)self delegate];
    [v5 viewControllerDidGoBack:self];
  }
}

- (id)_requestOTP
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__HUUtilityOnboardingOTPSelectionViewController__requestOTP__block_invoke;
  v6[3] = &unk_1E6385108;
  v6[4] = self;
  v2 = [MEMORY[0x1E4F7A0D8] futureWithBlock:v6];
  uint64_t v3 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  id v4 = [v2 reschedule:v3];

  return v4;
}

void __60__HUUtilityOnboardingOTPSelectionViewController__requestOTP__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) context];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__HUUtilityOnboardingOTPSelectionViewController__requestOTP__block_invoke_2;
  v6[3] = &unk_1E6387738;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  [v4 requestOTPWithCompletionHandler:v6];
}

void __60__HUUtilityOnboardingOTPSelectionViewController__requestOTP__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_super v6 = HFLogForCategory();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(const char **)(a1 + 32);
      int v12 = 138412546;
      v13 = v11;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "%@: Error requesting OTP %@", (uint8_t *)&v12, 0x16u);
    }

    [*(id *)(a1 + 40) finishWithError:v5];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 32);
      int v12 = 136315650;
      v13 = "-[HUUtilityOnboardingOTPSelectionViewController _requestOTP]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 1024;
      int v17 = a2;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%s(%@) ---: Requested OTP %{BOOL}d ", (uint8_t *)&v12, 0x1Cu);
    }

    __int16 v9 = *(void **)(a1 + 40);
    v10 = [NSNumber numberWithBool:a2];
    [v9 finishWithResult:v10];
  }
}

- (void)_sendCode:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(HUUtilityOnboardingOTPSelectionViewController *)self continueButton];
    id v7 = @"Cancel";
    if (v6 == v4) {
      id v7 = @"Send";
    }
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[HUUtilityOnboardingOTPSelectionViewController _sendCode:]";
    *(_WORD *)&buf[22] = 2112;
    uint64_t v21 = (uint64_t)v7;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped %@ button", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v21 = 7;
  v8 = [(HUUtilityOnboardingOTPSelectionViewController *)self context];
  __int16 v9 = [(HUUtilityOnboardingOTPSelectionViewController *)self selectedOTPMethod];
  [v8 setSelectedOTPMethodWithFactor:v9];

  v10 = [(HUUtilityOnboardingOTPSelectionViewController *)self context];
  uint64_t v11 = [v10 utilityID];
  int v12 = [(HUUtilityOnboardingOTPSelectionViewController *)self selectedOTPMethod];
  v13 = [v12 latestResults];
  __int16 v14 = [v13 objectForKeyedSubscript:@"factor-type"];
  +[HUHomeEnergyAnalyticsHelper sendUtilityOTPMethodSelectedByUserEventWithUtilityID:v11 selectedOTPMethod:v14];

  id v15 = [(OBBaseWelcomeController *)self navigationItem];
  [v15 setHidesBackButton:1];

  __int16 v16 = [(HUUtilityOnboardingOTPSelectionViewController *)self continueButton];
  [v16 showsBusyIndicator];

  int v17 = [(HUUtilityOnboardingOTPSelectionViewController *)self _requestOTP];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __59__HUUtilityOnboardingOTPSelectionViewController__sendCode___block_invoke;
  v19[3] = &unk_1E6387760;
  v19[4] = self;
  v19[5] = buf;
  id v18 = (id)[v17 addCompletionBlock:v19];

  _Block_object_dispose(buf, 8);
}

void __59__HUUtilityOnboardingOTPSelectionViewController__sendCode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) navigationItem];
  [v7 setHidesBackButton:0];

  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v9 = HFLogForCategory();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      int v18 = 138412546;
      uint64_t v19 = v17;
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      _os_log_error_impl(&dword_1BE345000, v10, OS_LOG_TYPE_ERROR, "%@: Future failed (%@)", (uint8_t *)&v18, 0x16u);
    }

    [v8 setObject:v6 forKey:@"HUUtilityDiscoveryOnboardingKey_Error"];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v18 = 138412802;
      uint64_t v19 = v11;
      __int16 v20 = 2080;
      uint64_t v21 = "-[HUUtilityOnboardingOTPSelectionViewController _sendCode:]_block_invoke";
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%s OTP REQUEST %@", (uint8_t *)&v18, 0x20u);
    }

    uint64_t v12 = 7;
    if (v5) {
      uint64_t v12 = 0;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v12;
  }
  v13 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [v8 setObject:v13 forKey:@"HUUtilityDiscoveryOnboardingKey_UserInput"];

  __int16 v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    int v18 = 138412802;
    uint64_t v19 = v15;
    __int16 v20 = 2080;
    uint64_t v21 = "-[HUUtilityOnboardingOTPSelectionViewController _sendCode:]_block_invoke";
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@ Finished %s with results  %@", (uint8_t *)&v18, 0x20u);
  }

  __int16 v16 = [*(id *)(a1 + 32) delegate];
  [v16 viewController:*(void *)(a1 + 32) didFinishWithConfigurationResults:v8];
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (void)tableView:(id)a3 didSelectOTPMethod:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412802;
    v8 = self;
    __int16 v9 = 2080;
    v10 = "-[HUUtilityOnboardingOTPSelectionViewController tableView:didSelectOTPMethod:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%s SELECTED METHOD: %@", (uint8_t *)&v7, 0x20u);
  }

  [(HUUtilityOnboardingOTPSelectionViewController *)self setSelectedOTPMethod:v5];
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

- (HUUtilityOnboardingOTPSelectionTableViewController)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (HFItem)selectedOTPMethod
{
  return self->_selectedOTPMethod;
}

- (void)setSelectedOTPMethod:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedOTPMethod, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end