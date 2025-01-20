@interface HUPersonalRequestsCustomizeViewController
- (Class)onboardingFlowClass;
- (HMHome)home;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUPersonalRequestsCustomizeViewController)initWithLocationDevice:(id)a3 home:(id)a4;
- (NSString)finePrintFooterText;
- (OBLinkTrayButton)customizeButton;
- (OBTrayButton)usePRButton;
- (id)hu_preloadContent;
- (void)_dontSetupPersonalRequests:(id)a3;
- (void)_setupPersonalRequests:(id)a3;
- (void)setCustomizeButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFinePrintFooterText:(id)a3;
- (void)setHome:(id)a3;
- (void)setUsePRButton:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUPersonalRequestsCustomizeViewController

- (HUPersonalRequestsCustomizeViewController)initWithLocationDevice:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"HUPersonalRequestsCustomizeViewController.m", 36, @"Invalid parameter not satisfying: %@", @"locationDevice" object file lineNumber description];
  }
  id v9 = objc_alloc(MEMORY[0x1E4F69710]);
  v10 = [v8 currentUser];
  v11 = (void *)[v9 initWithHome:v8 user:v10 nameStyle:0];

  v12 = [v7 name];
  v19 = HULocalizedStringWithFormat(@"HUPersonalRequestsCustomize_Detail", @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v12);

  v20 = [v7 name];
  v27 = HULocalizedStringWithFormat(@"HUPersonalRequestsCustomize_Detail", @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v20);

  v28 = [[HUPersonalRequestsEditorTableViewController alloc] initWithUserItem:v11 onlyShowDeviceSwitches:1];
  v29 = _HULocalizedStringWithDefaultValue(@"HUPersonalRequestsCustomize_Title", @"HUPersonalRequestsCustomize_Title", 1);
  v42.receiver = self;
  v42.super_class = (Class)HUPersonalRequestsCustomizeViewController;
  v30 = [(HUItemTableOBWelcomeController *)&v42 initWithTitle:v29 detailText:v27 icon:0 contentLayout:2 itemTableViewController:v28];

  if (v30)
  {
    objc_storeStrong((id *)&v30->_home, a4);
    if ([v7 isCurrentDevice])
    {
      objc_msgSend(MEMORY[0x1E4F42948], "hu_modelAndNetworkLocalizedStringKeyForKey:", @"HUPersonalRequestsCustomize_ThisDevice_FinePrint");
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = _HULocalizedStringWithDefaultValue(v31, v31, 1);
      finePrintFooterText = v30->_finePrintFooterText;
      v30->_finePrintFooterText = (NSString *)v32;
    }
    else
    {
      v34 = NSString;
      v35 = HULocalizedWiFiString(@"HUPersonalRequestsCustomize_OtherDevice_FinePrint");
      id v41 = 0;
      v36 = [v7 name];
      uint64_t v37 = [v34 stringWithValidatedFormat:v35, @"%@", &v41, v36 validFormatSpecifiers error];
      id v31 = v41;
      v38 = v30->_finePrintFooterText;
      v30->_finePrintFooterText = (NSString *)v37;

      if (!v30->_finePrintFooterText) {
        NSLog(&cfstr_CouldnTLocaliz.isa, @"HUPersonalRequestsCustomize_OtherDevice_FinePrint", v31);
      }
    }
  }
  return v30;
}

- (id)hu_preloadContent
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromSelector(a2);
    int v15 = 138412290;
    uint64_t v16 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: Turning on Personal Requests for all multi user capable devices", (uint8_t *)&v15, 0xCu);
  }
  objc_opt_class();
  v6 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  objc_opt_class();
  id v9 = [v8 itemManager];

  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  v12 = [v11 prDevicesModule];

  [v12 turnOnPersonalRequestsForAllVoiceRecognitionCapablePersonalRequestsDevices];
  uint64_t v13 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v13;
}

- (void)_dontSetupPersonalRequests:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v21 = self;
    __int16 v22 = 2112;
    uint64_t v23 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    id v8 = (HUPersonalRequestsCustomizeViewController *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = v8;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@: Turning off all Personal Requests devices", buf, 0xCu);
  }
  objc_opt_class();
  id v9 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  objc_opt_class();
  v12 = [v11 itemManager];

  if (objc_opt_isKindOfClass()) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  int v15 = [v14 prDevicesModule];

  [v15 setPersonalRequestsDevices:MEMORY[0x1E4F1CBF0]];
  uint64_t v16 = [(HUPersonalRequestsCustomizeViewController *)self delegate];
  uint64_t v18 = @"HUPersonalRequestsOnboardingKey_UserInput";
  v19 = &unk_1F19B3A10;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  [v16 viewController:self didFinishWithConfigurationResults:v17];
}

- (void)_setupPersonalRequests:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  id v7 = [(HUPersonalRequestsCustomizeViewController *)self delegate];
  id v9 = @"HUPersonalRequestsOnboardingKey_UserInput";
  v10 = &unk_1F19B3A28;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v7 viewController:self didFinishWithConfigurationResults:v8];
}

- (void)viewDidLoad
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)HUPersonalRequestsCustomizeViewController;
  [(HUItemTableOBWelcomeController *)&v29 viewDidLoad];
  v4 = [(HUPersonalRequestsCustomizeViewController *)self headerView];
  v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5A98];

  v6 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUPersonalRequestsCustomizeViewController *)self setUsePRButton:v6];

  id v7 = [(HUPersonalRequestsCustomizeViewController *)self usePRButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v8 = [(HUPersonalRequestsCustomizeViewController *)self usePRButton];
  id v9 = _HULocalizedStringWithDefaultValue(@"HUPersonalRequestsCustomize_ContinueButton", @"HUPersonalRequestsCustomize_ContinueButton", 1);
  [v8 setTitle:v9 forState:0];

  v10 = [(HUPersonalRequestsCustomizeViewController *)self usePRButton];
  [v10 setAccessibilityIdentifier:@"Home.OnboardingView.PersonalRequests.ContinueButton"];

  id v11 = [(HUPersonalRequestsCustomizeViewController *)self usePRButton];
  [v11 addTarget:self action:sel__setupPersonalRequests_ forControlEvents:64];

  v12 = [(HUPersonalRequestsCustomizeViewController *)self buttonTray];
  __int16 v13 = [(HUPersonalRequestsCustomizeViewController *)self usePRButton];
  [v12 addButton:v13];

  id v14 = [MEMORY[0x1E4F83AB8] linkButton];
  [(HUPersonalRequestsCustomizeViewController *)self setCustomizeButton:v14];

  uint64_t v15 = [(HUPersonalRequestsCustomizeViewController *)self customizeButton];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v16 = [(HUPersonalRequestsCustomizeViewController *)self customizeButton];
  uint64_t v17 = _HULocalizedStringWithDefaultValue(@"HUPersonalRequestsCustomize_DoNotUseButton", @"HUPersonalRequestsCustomize_DoNotUseButton", 1);
  [v16 setTitle:v17 forState:0];

  uint64_t v18 = [(HUPersonalRequestsCustomizeViewController *)self customizeButton];
  [v18 setAccessibilityIdentifier:@"Home.OnboardingView.PersonalRequests.DoNotUseButton"];

  v19 = [(HUPersonalRequestsCustomizeViewController *)self customizeButton];
  [v19 addTarget:self action:sel__dontSetupPersonalRequests_ forControlEvents:64];

  v20 = [(HUPersonalRequestsCustomizeViewController *)self buttonTray];
  uint64_t v21 = [(HUPersonalRequestsCustomizeViewController *)self customizeButton];
  [v20 addButton:v21];

  __int16 v22 = [(HUPersonalRequestsCustomizeViewController *)self buttonTray];
  uint64_t v23 = [(HUPersonalRequestsCustomizeViewController *)self finePrintFooterText];
  [v22 setCaptionText:v23];

  [(HUPersonalRequestsCustomizeViewController *)self setModalInPresentation:1];
  uint64_t v24 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  uint64_t v25 = [v24 itemManager];
  id v26 = (id)[v25 reloadAndUpdateAllItemsFromSenderSelector:a2];

  v27 = HFLogForCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v31 = self;
    __int16 v32 = 2112;
    v33 = v28;
    _os_log_impl(&dword_1BE345000, v27, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: PRCVC", buf, 0x16u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)HUPersonalRequestsCustomizeViewController;
  [(HUPersonalRequestsCustomizeViewController *)&v8 viewWillDisappear:a3];
  if ([(HUPersonalRequestsCustomizeViewController *)self isMovingFromParentViewController])
  {
    v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v10 = self;
      __int16 v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped BACK button", buf, 0x16u);
    }
    id v7 = [(HUPersonalRequestsCustomizeViewController *)self delegate];
    [v7 viewControllerDidGoBack:self];
  }
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

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (OBTrayButton)usePRButton
{
  return self->_usePRButton;
}

- (void)setUsePRButton:(id)a3
{
}

- (OBLinkTrayButton)customizeButton
{
  return self->_customizeButton;
}

- (void)setCustomizeButton:(id)a3
{
}

- (NSString)finePrintFooterText
{
  return self->_finePrintFooterText;
}

- (void)setFinePrintFooterText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finePrintFooterText, 0);
  objc_storeStrong((id *)&self->_customizeButton, 0);
  objc_storeStrong((id *)&self->_usePRButton, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end