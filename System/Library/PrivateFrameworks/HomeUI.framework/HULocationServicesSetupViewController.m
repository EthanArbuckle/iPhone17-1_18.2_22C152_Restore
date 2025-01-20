@interface HULocationServicesSetupViewController
- (Class)onboardingFlowClass;
- (HMHome)home;
- (HUConfigurationViewControllerDelegate)delegate;
- (HULocationServicesSetupViewController)initWithHome:(id)a3;
- (OBBoldTrayButton)enableLocationServicesButton;
- (OBLinkTrayButton)disableLocationServicesButton;
- (id)hu_preloadContent;
- (void)_enableOrDisableLocationServices:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableLocationServicesButton:(id)a3;
- (void)setEnableLocationServicesButton:(id)a3;
- (void)setHome:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HULocationServicesSetupViewController

- (HULocationServicesSetupViewController)initWithHome:(id)a3
{
  id v5 = a3;
  v6 = _HULocalizedStringWithDefaultValue(@"HULocationServicesSetup_Title", @"HULocationServicesSetup_Title", 1);
  v7 = _HULocalizedStringWithDefaultValue(@"HULocationServicesSetup_Detail", @"HULocationServicesSetup_Detail", 1);
  v8 = [MEMORY[0x1E4F42A80] systemImageNamed:@"location"];
  v11.receiver = self;
  v11.super_class = (Class)HULocationServicesSetupViewController;
  v9 = [(HULocationServicesSetupViewController *)&v11 initWithTitle:v6 detailText:v7 icon:v8];

  if (v9) {
    objc_storeStrong((id *)&v9->_home, a3);
  }

  return v9;
}

- (void)_enableOrDisableLocationServices:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = self;
    __int16 v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (HULocationServicesSetupViewController *)objc_claimAutoreleasedReturnValue();
    id v10 = [(HULocationServicesSetupViewController *)self enableLocationServicesButton];
    objc_super v11 = @"Disabling";
    if (v10 == v5) {
      objc_super v11 = @"Enabling";
    }
    *(_DWORD *)buf = 138412546;
    v22 = v9;
    __int16 v23 = 2112;
    v24 = v11;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: %@ Location Services", buf, 0x16u);
  }
  id v12 = [(HULocationServicesSetupViewController *)self disableLocationServicesButton];
  BOOL v13 = v12 == v5;

  v14 = (void *)MEMORY[0x1E4F1CA60];
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v13, @"HULocationServicesOnboardingKey_UserInput");
  v20 = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v17 = [v14 dictionaryWithDictionary:v16];

  v18 = [(HULocationServicesSetupViewController *)self delegate];
  [v18 viewController:self didFinishWithConfigurationResults:v17];
}

- (id)hu_preloadContent
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)viewDidLoad
{
  v31[1] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)HULocationServicesSetupViewController;
  [(OBBaseWelcomeController *)&v26 viewDidLoad];
  v4 = [(HULocationServicesSetupViewController *)self headerView];
  id v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5D40];

  v6 = [MEMORY[0x1E4F83A80] boldButton];
  [(HULocationServicesSetupViewController *)self setEnableLocationServicesButton:v6];

  v7 = [(HULocationServicesSetupViewController *)self enableLocationServicesButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(HULocationServicesSetupViewController *)self enableLocationServicesButton];
  v9 = _HULocalizedStringWithDefaultValue(@"HULocationServicesSetup_EnableLocationServices_Button", @"HULocationServicesSetup_EnableLocationServices_Button", 1);
  [v8 setTitle:v9 forState:0];

  id v10 = [(HULocationServicesSetupViewController *)self enableLocationServicesButton];
  [v10 setAccessibilityIdentifier:@"Home.OnboardingView.LocationServices.EnableButton"];

  objc_super v11 = [(HULocationServicesSetupViewController *)self enableLocationServicesButton];
  [v11 addTarget:self action:sel__enableOrDisableLocationServices_ forControlEvents:64];

  id v12 = [(HULocationServicesSetupViewController *)self buttonTray];
  BOOL v13 = [(HULocationServicesSetupViewController *)self enableLocationServicesButton];
  [v12 addButton:v13];

  v14 = [MEMORY[0x1E4F83AB8] linkButton];
  [(HULocationServicesSetupViewController *)self setDisableLocationServicesButton:v14];

  v15 = [(HULocationServicesSetupViewController *)self disableLocationServicesButton];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(HULocationServicesSetupViewController *)self disableLocationServicesButton];
  v17 = _HULocalizedStringWithDefaultValue(@"HULocationServicesSetup_DisableLocationServices_Button", @"HULocationServicesSetup_DisableLocationServices_Button", 1);
  [v16 setTitle:v17 forState:0];

  v18 = [(HULocationServicesSetupViewController *)self disableLocationServicesButton];
  [v18 setAccessibilityIdentifier:@"Home.OnboardingView.LocationServices.DisableButton"];

  uint64_t v19 = [(HULocationServicesSetupViewController *)self disableLocationServicesButton];
  [v19 addTarget:self action:sel__enableOrDisableLocationServices_ forControlEvents:64];

  v20 = [(HULocationServicesSetupViewController *)self buttonTray];
  v21 = [(HULocationServicesSetupViewController *)self disableLocationServicesButton];
  [v20 addButton:v21];

  v22 = [(HULocationServicesSetupViewController *)self buttonTray];
  v31[0] = *MEMORY[0x1E4F83B38];
  __int16 v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  [v22 setPrivacyLinkForBundles:v23];

  [(HULocationServicesSetupViewController *)self setModalInPresentation:1];
  v24 = HFLogForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v28 = self;
    __int16 v29 = 2112;
    v30 = v25;
    _os_log_impl(&dword_1BE345000, v24, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HULocationServicesSetupViewController", buf, 0x16u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)HULocationServicesSetupViewController;
  [(HULocationServicesSetupViewController *)&v8 viewWillDisappear:a3];
  if ([(HULocationServicesSetupViewController *)self isMovingFromParentViewController])
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v10 = self;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped BACK button", buf, 0x16u);
    }
    v7 = [(HULocationServicesSetupViewController *)self delegate];
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

- (OBBoldTrayButton)enableLocationServicesButton
{
  return self->_enableLocationServicesButton;
}

- (void)setEnableLocationServicesButton:(id)a3
{
}

- (OBLinkTrayButton)disableLocationServicesButton
{
  return self->_disableLocationServicesButton;
}

- (void)setDisableLocationServicesButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableLocationServicesButton, 0);
  objc_storeStrong((id *)&self->_enableLocationServicesButton, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end