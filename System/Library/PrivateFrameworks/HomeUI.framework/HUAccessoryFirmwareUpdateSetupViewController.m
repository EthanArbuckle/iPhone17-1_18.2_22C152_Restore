@interface HUAccessoryFirmwareUpdateSetupViewController
- (Class)onboardingFlowClass;
- (HMHome)home;
- (HUAccessoryFirmwareUpdateSetupViewController)initWithHome:(id)a3;
- (HUAccessoryFirmwareUpdateSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentImage:(id)a6;
- (HUConfigurationViewControllerDelegate)delegate;
- (OBLinkTrayButton)notNowButton;
- (OBTrayButton)enableAutomaticUpdatesButton;
- (void)_doNotEnableAutomaticUpdates:(id)a3;
- (void)_enableAutomaticUpdates:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableAutomaticUpdatesButton:(id)a3;
- (void)setHome:(id)a3;
- (void)setNotNowButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUAccessoryFirmwareUpdateSetupViewController

- (HUAccessoryFirmwareUpdateSetupViewController)initWithHome:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"square.and.arrow.down.fill"];
  v7 = [MEMORY[0x1E4F42A98] configurationWithPointSize:144.0];
  v8 = [v6 imageWithConfiguration:v7];

  v9 = _HULocalizedStringWithDefaultValue(@"HUAccessoryFirmwareUpdateOnboarding_Title", @"HUAccessoryFirmwareUpdateOnboarding_Title", 1);
  v10 = _HULocalizedStringWithDefaultValue(@"HUAccessoryFirmwareUpdateOnboarding_Detail", @"HUAccessoryFirmwareUpdateOnboarding_Detail", 1);
  v13.receiver = self;
  v13.super_class = (Class)HUAccessoryFirmwareUpdateSetupViewController;
  v11 = [(HUImageOBWelcomeController *)&v13 initWithTitle:v9 detailText:v10 icon:0 contentImage:v8];

  if (v11) {
    objc_storeStrong((id *)&v11->_home, a3);
  }

  return v11;
}

- (HUAccessoryFirmwareUpdateSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentImage:(id)a6
{
  v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  v9 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAccessoryFirmwareUpdateSetupViewController.m", 50, @"%s is unavailable; use %@ instead",
    "-[HUAccessoryFirmwareUpdateSetupViewController initWithTitle:detailText:icon:contentImage:]",
    v9);

  return 0;
}

- (void)viewDidLoad
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)HUAccessoryFirmwareUpdateSetupViewController;
  [(HUImageOBWelcomeController *)&v18 viewDidLoad];
  v4 = [(HUAccessoryFirmwareUpdateSetupViewController *)self headerView];
  id v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5B60];

  v6 = [MEMORY[0x1E4F83A80] boldButton];
  enableAutomaticUpdatesButton = self->_enableAutomaticUpdatesButton;
  self->_enableAutomaticUpdatesButton = v6;

  [(OBTrayButton *)self->_enableAutomaticUpdatesButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = self->_enableAutomaticUpdatesButton;
  v9 = _HULocalizedStringWithDefaultValue(@"HUAccessoryFirmwareUpdateOnboarding_Enable", @"HUAccessoryFirmwareUpdateOnboarding_Enable", 1);
  [(OBTrayButton *)v8 setTitle:v9 forState:0];

  [(OBTrayButton *)self->_enableAutomaticUpdatesButton setAccessibilityIdentifier:@"Home.OnboardingView.AccessoryFirmwareUpdate.Enable"];
  [(OBTrayButton *)self->_enableAutomaticUpdatesButton addTarget:self action:sel__enableAutomaticUpdates_ forControlEvents:64];
  v10 = [(HUAccessoryFirmwareUpdateSetupViewController *)self buttonTray];
  [v10 addButton:self->_enableAutomaticUpdatesButton];

  v11 = [MEMORY[0x1E4F83AB8] linkButton];
  notNowButton = self->_notNowButton;
  self->_notNowButton = v11;

  [(OBLinkTrayButton *)self->_notNowButton setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v13 = self->_notNowButton;
  v14 = _HULocalizedStringWithDefaultValue(@"HUAccessoryFirmwareUpdateOnboarding_NotNow", @"HUAccessoryFirmwareUpdateOnboarding_NotNow", 1);
  [(OBLinkTrayButton *)v13 setTitle:v14 forState:0];

  [(OBLinkTrayButton *)self->_notNowButton setAccessibilityIdentifier:@"Home.OnboardingView.AccessoryFirmwareUpdate.NotNow"];
  [(OBLinkTrayButton *)self->_notNowButton addTarget:self action:sel__doNotEnableAutomaticUpdates_ forControlEvents:64];
  v15 = [(HUAccessoryFirmwareUpdateSetupViewController *)self buttonTray];
  [v15 addButton:self->_notNowButton];

  [(HUAccessoryFirmwareUpdateSetupViewController *)self setModalInPresentation:1];
  v16 = HFLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v20 = self;
    __int16 v21 = 2112;
    v22 = v17;
    _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: NLSVC", buf, 0x16u);
  }
}

- (void)_enableAutomaticUpdates:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v20 = self;
    __int16 v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  v8 = [(HUAccessoryFirmwareUpdateSetupViewController *)self enableAutomaticUpdatesButton];
  v9 = [v8 activityIndicator];
  [v9 startAnimating];

  [v5 setEnabled:0];
  v10 = [(HUAccessoryFirmwareUpdateSetupViewController *)self home];
  v11 = objc_msgSend(v10, "hf_updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled:", 1);

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__HUAccessoryFirmwareUpdateSetupViewController__enableAutomaticUpdates___block_invoke;
  v18[3] = &unk_1E6387DC8;
  v18[4] = self;
  v12 = [v11 addSuccessBlock:v18];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__HUAccessoryFirmwareUpdateSetupViewController__enableAutomaticUpdates___block_invoke_54;
  v15[3] = &unk_1E6385A20;
  id v16 = v5;
  v17 = self;
  id v13 = v5;
  id v14 = (id)[v12 addFailureBlock:v15];
}

void __72__HUAccessoryFirmwareUpdateSetupViewController__enableAutomaticUpdates___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) enableAutomaticUpdatesButton];
  v3 = [v2 activityIndicator];
  [v3 stopAnimating];

  v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v5 = *(void *)(a1 + 32);
  v7 = @"HUAccessoryFirmwareUpdateOnboardingKey_UserInput";
  v8[0] = &unk_1F19B3ED8;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 viewController:v5 didFinishWithConfigurationResults:v6];
}

void __72__HUAccessoryFirmwareUpdateSetupViewController__enableAutomaticUpdates___block_invoke_54(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setEnabled:1];
  uint64_t v5 = [*(id *)(a1 + 40) enableAutomaticUpdatesButton];
  v6 = [v5 activityIndicator];
  [v6 stopAnimating];

  id v7 = [MEMORY[0x1E4F69110] sharedHandler];
  [v7 handleError:v4];
}

- (void)_doNotEnableAutomaticUpdates:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  id v7 = [(HUAccessoryFirmwareUpdateSetupViewController *)self delegate];
  v9 = @"HUAccessoryFirmwareUpdateOnboardingKey_UserInput";
  v10 = &unk_1F19B3EF0;
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

- (OBTrayButton)enableAutomaticUpdatesButton
{
  return self->_enableAutomaticUpdatesButton;
}

- (void)setEnableAutomaticUpdatesButton:(id)a3
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
  objc_storeStrong((id *)&self->_enableAutomaticUpdatesButton, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end