@interface HUNaturalLightingTitleViewController
- (Class)onboardingFlowClass;
- (HMHome)home;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUNaturalLightingTitleViewController)initWithHome:(id)a3;
- (HUNaturalLightingTitleViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentImage:(id)a6;
- (OBLinkTrayButton)notNowButton;
- (OBTrayButton)useNaturalLightingButton;
- (void)_continueToSetup:(id)a3;
- (void)_doNotActivateNaturalLighting:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setNotNowButton:(id)a3;
- (void)setUseNaturalLightingButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUNaturalLightingTitleViewController

- (HUNaturalLightingTitleViewController)initWithHome:(id)a3
{
  id v5 = a3;
  v6 = _HULocalizedStringWithDefaultValue(@"HUNaturalLightingTitle_Title", @"HUNaturalLightingTitle_Title", 1);
  v7 = _HULocalizedStringWithDefaultValue(@"HUNaturalLightingTitle_Detail", @"HUNaturalLightingTitle_Detail", 1);
  v8 = HUImageNamed(@"Onboarding-NaturalLighting");
  v11.receiver = self;
  v11.super_class = (Class)HUNaturalLightingTitleViewController;
  v9 = [(HUImageOBWelcomeController *)&v11 initWithTitle:v6 detailText:v7 icon:0 contentImage:v8];

  if (v9) {
    objc_storeStrong((id *)&v9->_home, a3);
  }

  return v9;
}

- (HUNaturalLightingTitleViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentImage:(id)a6
{
  v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  v9 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUNaturalLightingTitleViewController.m", 44, @"%s is unavailable; use %@ instead",
    "-[HUNaturalLightingTitleViewController initWithTitle:detailText:icon:contentImage:]",
    v9);

  return 0;
}

- (void)viewDidLoad
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)HUNaturalLightingTitleViewController;
  [(HUImageOBWelcomeController *)&v24 viewDidLoad];
  v4 = [(HUNaturalLightingTitleViewController *)self headerView];
  id v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5B88];

  v6 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUNaturalLightingTitleViewController *)self setUseNaturalLightingButton:v6];

  v7 = [(HUNaturalLightingTitleViewController *)self useNaturalLightingButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(HUNaturalLightingTitleViewController *)self useNaturalLightingButton];
  v9 = _HULocalizedStringWithDefaultValue(@"HUNaturalLightingTitle_ChooseLightsButton", @"HUNaturalLightingTitle_ChooseLightsButton", 1);
  [v8 setTitle:v9 forState:0];

  v10 = [(HUNaturalLightingTitleViewController *)self useNaturalLightingButton];
  [v10 setAccessibilityIdentifier:@"Home.OnboardingView.HUNaturalLighting.ChooseLightsButton"];

  objc_super v11 = [(HUNaturalLightingTitleViewController *)self useNaturalLightingButton];
  [v11 addTarget:self action:sel__continueToSetup_ forControlEvents:64];

  v12 = [(HUNaturalLightingTitleViewController *)self buttonTray];
  v13 = [(HUNaturalLightingTitleViewController *)self useNaturalLightingButton];
  [v12 addButton:v13];

  v14 = [MEMORY[0x1E4F83AB8] linkButton];
  [(HUNaturalLightingTitleViewController *)self setNotNowButton:v14];

  v15 = [(HUNaturalLightingTitleViewController *)self notNowButton];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(HUNaturalLightingTitleViewController *)self notNowButton];
  v17 = _HULocalizedStringWithDefaultValue(@"HUNaturalLightingTitle_NotNowButton", @"HUNaturalLightingTitle_NotNowButton", 1);
  [v16 setTitle:v17 forState:0];

  v18 = [(HUNaturalLightingTitleViewController *)self notNowButton];
  [v18 setAccessibilityIdentifier:@"Home.OnboardingView.HUNaturalLighting.NotNowButton"];

  v19 = [(HUNaturalLightingTitleViewController *)self notNowButton];
  [v19 addTarget:self action:sel__doNotActivateNaturalLighting_ forControlEvents:64];

  v20 = [(HUNaturalLightingTitleViewController *)self buttonTray];
  v21 = [(HUNaturalLightingTitleViewController *)self notNowButton];
  [v20 addButton:v21];

  [(HUNaturalLightingTitleViewController *)self setModalInPresentation:1];
  v22 = HFLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v26 = self;
    __int16 v27 = 2112;
    v28 = v23;
    _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: NLTVC", buf, 0x16u);
  }
}

- (void)_continueToSetup:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v12 = self;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  v7 = [(HUNaturalLightingTitleViewController *)self delegate];
  v9 = @"HUNaturalLightingOnboardingKey_UserInput";
  v10 = &unk_1F19B3F50;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v7 viewController:self didFinishWithConfigurationResults:v8];
}

- (void)_doNotActivateNaturalLighting:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v12 = self;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  v7 = [(HUNaturalLightingTitleViewController *)self delegate];
  v9 = @"HUNaturalLightingOnboardingKey_UserInput";
  v10 = &unk_1F19B3F68;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v7 viewController:self didFinishWithConfigurationResults:v8];
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

- (OBTrayButton)useNaturalLightingButton
{
  return self->_useNaturalLightingButton;
}

- (void)setUseNaturalLightingButton:(id)a3
{
}

- (OBLinkTrayButton)notNowButton
{
  return self->_notNowButton;
}

- (void)setNotNowButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong((id *)&self->_useNaturalLightingButton, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end