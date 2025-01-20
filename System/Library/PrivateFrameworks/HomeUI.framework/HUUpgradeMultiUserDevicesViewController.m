@interface HUUpgradeMultiUserDevicesViewController
- (BOOL)isFinalStep;
- (Class)onboardingFlowClass;
- (HMHome)home;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUUpgradeMultiUserDevicesViewController)initWithUpgradeRequirements:(unint64_t)a3 home:(id)a4;
- (OBTrayButton)continueButton;
- (id)hu_preloadContent;
- (void)_continueButtonTapped:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setIsFinalStep:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HUUpgradeMultiUserDevicesViewController

- (HUUpgradeMultiUserDevicesViewController)initWithUpgradeRequirements:(unint64_t)a3 home:(id)a4
{
  id v7 = a4;
  v8 = _HULocalizedStringWithDefaultValue(@"HUUpgradeMultiUserDevices_Title", @"HUUpgradeMultiUserDevices_Title", 1);
  if ((objc_msgSend(v7, "hf_currentUserIsOwner") & 1) != 0
    || objc_msgSend(v7, "hf_currentUserIsAdministrator"))
  {
    switch(a3)
    {
      case 0uLL:
        NSLog(&cfstr_WeShouldNotBeC_0.isa);
        break;
      case 1uLL:
        v10 = @"HUUpgradeMultiUserDevices_HomePodOnly_Detail";
        goto LABEL_10;
      case 2uLL:
        v10 = @"HUUpgradeMultiUserDevices_AppleTVOnly_Detail";
        goto LABEL_10;
      case 3uLL:
        v10 = @"HUUpgradeMultiUserDevices_HomePodAndAppleTV_Detail";
        goto LABEL_10;
      default:
        break;
    }
    v9 = 0;
  }
  else
  {
    v10 = @"HUUpgradeMultiUserDevices_Generic_Detail";
LABEL_10:
    v9 = _HULocalizedStringWithDefaultValue(v10, v10, 1);
  }
  v11 = HUImageNamed(@"Onboarding-UpdateSoftware");
  v14.receiver = self;
  v14.super_class = (Class)HUUpgradeMultiUserDevicesViewController;
  v12 = [(HUImageOBWelcomeController *)&v14 initWithTitle:v8 detailText:v9 icon:0 contentImage:v11];

  if (v12) {
    objc_storeStrong((id *)&v12->_home, a4);
  }

  return v12;
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
    objc_super v14 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  id v7 = [(HUUpgradeMultiUserDevicesViewController *)self delegate];
  v9 = @"HUUpgradeMultiUserDevicesOnboardingKey_UserInput";
  v10 = &unk_1F19B5558;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v7 viewController:self didFinishWithConfigurationResults:v8];
}

- (id)hu_preloadContent
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)viewDidLoad
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)HUUpgradeMultiUserDevicesViewController;
  [(HUImageOBWelcomeController *)&v17 viewDidLoad];
  v4 = [(HUUpgradeMultiUserDevicesViewController *)self headerView];
  v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B6038];

  v6 = _HULocalizedStringWithDefaultValue(@"HUUpgradeMultiUserDevices_ContinueButton", @"HUUpgradeMultiUserDevices_ContinueButton", 1);
  if ([(HUUpgradeMultiUserDevicesViewController *)self isFinalStep])
  {
    uint64_t v7 = _HULocalizedStringWithDefaultValue(@"HUUpgradeMultiUserDevices_DoneButton", @"HUUpgradeMultiUserDevices_DoneButton", 1);

    v6 = (void *)v7;
  }
  v8 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUUpgradeMultiUserDevicesViewController *)self setContinueButton:v8];

  v9 = [(HUUpgradeMultiUserDevicesViewController *)self continueButton];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [(HUUpgradeMultiUserDevicesViewController *)self continueButton];
  [v10 setTitle:v6 forState:0];

  v11 = [(HUUpgradeMultiUserDevicesViewController *)self continueButton];
  [v11 setAccessibilityIdentifier:@"Home.OnboardingView.UpgradeMultiUser.ContinueButton"];

  v12 = [(HUUpgradeMultiUserDevicesViewController *)self continueButton];
  [v12 addTarget:self action:sel__continueButtonTapped_ forControlEvents:64];

  __int16 v13 = [(HUUpgradeMultiUserDevicesViewController *)self buttonTray];
  objc_super v14 = [(HUUpgradeMultiUserDevicesViewController *)self continueButton];
  [v13 addButton:v14];

  [(HUUpgradeMultiUserDevicesViewController *)self setModalInPresentation:1];
  uint64_t v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v19 = self;
    __int16 v20 = 2112;
    v21 = v16;
    _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: UMUDVC", buf, 0x16u);
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

- (BOOL)isFinalStep
{
  return self->_isFinalStep;
}

- (void)setIsFinalStep:(BOOL)a3
{
  self->_isFinalStep = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
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
  objc_storeStrong((id *)&self->_home, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end