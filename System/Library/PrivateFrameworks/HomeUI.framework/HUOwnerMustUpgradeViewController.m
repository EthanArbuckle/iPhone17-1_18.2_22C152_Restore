@interface HUOwnerMustUpgradeViewController
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUOwnerMustUpgradeViewController)initWithUpgradeRequirements:(unint64_t)a3;
- (OBTrayButton)continueButton;
- (id)hu_preloadContent;
- (void)_continueButtonTapped:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUOwnerMustUpgradeViewController

- (HUOwnerMustUpgradeViewController)initWithUpgradeRequirements:(unint64_t)a3
{
  v5 = _HULocalizedStringWithDefaultValue(@"HUOwnerMustUpgrade_Title", @"HUOwnerMustUpgrade_Title", 1);
  switch(a3)
  {
    case 0uLL:
      NSLog(&cfstr_WeShouldNotBeC.isa);
      goto LABEL_3;
    case 1uLL:
      v7 = @"HUOwnerMustUpgrade_HomePodAndSiriEnabledDevicesOnly_Detail";
      goto LABEL_7;
    case 2uLL:
      v7 = @"HUOwnerMustUpgrade_AppleTVOnly_Detail";
      goto LABEL_7;
    case 3uLL:
      v7 = @"HUOwnerMustUpgrade_HomePodSiriEnabledDevicesAndAppleTV_Detail";
LABEL_7:
      v6 = _HULocalizedStringWithDefaultValue(v7, v7, 1);
      break;
    default:
LABEL_3:
      v6 = 0;
      break;
  }
  v10.receiver = self;
  v10.super_class = (Class)HUOwnerMustUpgradeViewController;
  v8 = [(HUOwnerMustUpgradeViewController *)&v10 initWithTitle:v5 detailText:v6 icon:0 contentLayout:2];

  return v8;
}

- (void)_continueButtonTapped:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v12 = self;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  v7 = [(HUOwnerMustUpgradeViewController *)self delegate];
  v9 = @"HUOwnerMustUpgradeOnboardingKey_UserInput";
  objc_super v10 = &unk_1F19B4A60;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v7 viewController:self didFinishWithConfigurationResults:v8];
}

- (id)hu_preloadContent
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)viewDidLoad
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)HUOwnerMustUpgradeViewController;
  [(OBBaseWelcomeController *)&v15 viewDidLoad];
  v4 = [(HUOwnerMustUpgradeViewController *)self headerView];
  v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5DE0];

  v6 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUOwnerMustUpgradeViewController *)self setContinueButton:v6];

  v7 = [(HUOwnerMustUpgradeViewController *)self continueButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(HUOwnerMustUpgradeViewController *)self continueButton];
  v9 = _HULocalizedStringWithDefaultValue(@"HUOwnerMustUpgrade_ContinueButton", @"HUOwnerMustUpgrade_ContinueButton", 1);
  [v8 setTitle:v9 forState:0];

  objc_super v10 = [(HUOwnerMustUpgradeViewController *)self continueButton];
  [v10 setAccessibilityIdentifier:@"Home.OnboardingView.OwnerMustUpgrade.ContinueButton"];

  v11 = [(HUOwnerMustUpgradeViewController *)self continueButton];
  [v11 addTarget:self action:sel__continueButtonTapped_ forControlEvents:64];

  v12 = [(HUOwnerMustUpgradeViewController *)self buttonTray];
  [v12 addButton:self->_continueButton];

  [(HUOwnerMustUpgradeViewController *)self setModalInPresentation:1];
  __int16 v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v17 = self;
    __int16 v18 = 2112;
    v19 = v14;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: OMUVC", buf, 0x16u);
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

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end