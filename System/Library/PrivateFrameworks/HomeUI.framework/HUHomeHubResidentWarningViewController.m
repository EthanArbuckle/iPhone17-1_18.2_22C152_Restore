@interface HUHomeHubResidentWarningViewController
- (BOOL)_limitToNonScrollingContentHeight;
- (BOOL)isFinalStep;
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUHomeHubResidentWarningViewController)initWithiPadOnlyHub:(BOOL)a3;
- (OBBoldTrayButton)commitButton;
- (OBHeaderAccessoryButton)linkButton;
- (id)_commitOrContinueButtonTitle;
- (void)_cancelFlow:(id)a3;
- (void)_commitOrContinue:(id)a3;
- (void)_openLink:(id)a3;
- (void)_openURL:(id)a3;
- (void)setCommitButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsFinalStep:(BOOL)a3;
- (void)setLinkButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUHomeHubResidentWarningViewController

- (HUHomeHubResidentWarningViewController)initWithiPadOnlyHub:(BOOL)a3
{
  if (a3) {
    v4 = @"HUSoftwareUpdateMigrationiPadOnlyResidentTitle";
  }
  else {
    v4 = @"HUSoftwareUpdateMigrationNoResidentTitle";
  }
  if (a3) {
    v5 = @"HUSoftwareUpdateMigrationiPadOnlyResidentDescription";
  }
  else {
    v5 = @"HUSoftwareUpdateMigrationNoResidentDescription";
  }
  v6 = _HULocalizedStringWithDefaultValue(v4, v4, 1);
  v7 = _HULocalizedStringWithDefaultValue(v5, v5, 1);
  v8 = (void *)MEMORY[0x1E4F42A98];
  v9 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  v10 = [v8 configurationWithHierarchicalColor:v9];

  v11 = [MEMORY[0x1E4F42A98] configurationWithPointSize:100.0];
  v12 = [v11 configurationByApplyingConfiguration:v10];
  v13 = [MEMORY[0x1E4F42A80] systemImageNamed:@"homekit"];
  v14 = [v13 imageWithConfiguration:v12];

  v17.receiver = self;
  v17.super_class = (Class)HUHomeHubResidentWarningViewController;
  v15 = [(HUImageOBWelcomeController *)&v17 initWithTitle:v6 detailText:v7 icon:0 contentImage:v14];

  return v15;
}

- (void)viewDidLoad
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)HUHomeHubResidentWarningViewController;
  [(HUImageOBWelcomeController *)&v27 viewDidLoad];
  v4 = [(HUHomeHubResidentWarningViewController *)self headerView];
  v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5E80];

  v6 = [MEMORY[0x1E4F83A98] accessoryButton];
  [(HUHomeHubResidentWarningViewController *)self setLinkButton:v6];

  v7 = [(HUHomeHubResidentWarningViewController *)self linkButton];
  v8 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationResidentLearnMoreMessage", @"HUSoftwareUpdateMigrationResidentLearnMoreMessage", 1);
  [v7 setTitle:v8 forState:0];

  v9 = [(HUHomeHubResidentWarningViewController *)self linkButton];
  [v9 setAccessibilityIdentifier:@"Home.OnboardingView.HomeHubMigration.HUHomeHubResidentWarning.LearnMoreLink"];

  v10 = [(HUHomeHubResidentWarningViewController *)self linkButton];
  [v10 addTarget:self action:sel__openLink_ forControlEvents:64];

  v11 = [(HUHomeHubResidentWarningViewController *)self headerView];
  v12 = [(HUHomeHubResidentWarningViewController *)self linkButton];
  [v11 addAccessoryButton:v12];

  v13 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUHomeHubResidentWarningViewController *)self setCommitButton:v13];

  v14 = [(HUHomeHubResidentWarningViewController *)self commitButton];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = [(HUHomeHubResidentWarningViewController *)self commitButton];
  v16 = [(HUHomeHubResidentWarningViewController *)self _commitOrContinueButtonTitle];
  [v15 setTitle:v16 forState:0];

  objc_super v17 = [(HUHomeHubResidentWarningViewController *)self commitButton];
  [v17 setAccessibilityIdentifier:@"Home.OnboardingView.HomeHubMigration.HUHomeHubResidentWarning.CommitOrContinueButton"];

  v18 = [(HUHomeHubResidentWarningViewController *)self commitButton];
  [v18 addTarget:self action:sel__commitOrContinue_ forControlEvents:64];

  v19 = [(HUHomeHubResidentWarningViewController *)self buttonTray];
  v20 = [(HUHomeHubResidentWarningViewController *)self commitButton];
  [v19 addButton:v20];

  id v21 = objc_alloc(MEMORY[0x1E4F427C0]);
  v22 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
  v23 = (void *)[v21 initWithTitle:v22 style:0 target:self action:sel__cancelFlow_];

  [v23 setAccessibilityIdentifier:@"Home.OnboardingView.HomeHubMigration.HUHomeHubResidentWarning.CancelButton"];
  v24 = [(OBBaseWelcomeController *)self navigationItem];
  [v24 setRightBarButtonItem:v23];

  [(HUHomeHubResidentWarningViewController *)self setModalInPresentation:1];
  v25 = HFLogForCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v29 = self;
    __int16 v30 = 2112;
    v31 = v26;
    _os_log_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HUHomeHubSharedHomesWarningViewController", buf, 0x16u);
  }
}

- (BOOL)_limitToNonScrollingContentHeight
{
  return 1;
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (id)_commitOrContinueButtonTitle
{
  v3 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationUpgradeAnyway", @"HUSoftwareUpdateMigrationUpgradeAnyway", 1);
  if ([(HUHomeHubResidentWarningViewController *)self isFinalStep])
  {
    id v4 = v3;
  }
  else
  {
    _HULocalizedStringWithDefaultValue(@"HUContinueTitle", @"HUContinueTitle", 1);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)_commitOrContinue:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v14 = self;
    __int16 v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  if ([(HUHomeHubResidentWarningViewController *)self isFinalStep]) {
    uint64_t v7 = 6;
  }
  else {
    uint64_t v7 = 5;
  }
  v8 = [(HUHomeHubResidentWarningViewController *)self delegate];
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v7, @"HUHomeHub2OnboardingKey_UserInput");
  v12 = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v8 viewController:self didFinishWithConfigurationResults:v10];
}

- (void)_cancelFlow:(id)a3
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
  uint64_t v7 = [(HUHomeHubResidentWarningViewController *)self delegate];
  v9 = @"HUHomeHub2OnboardingKey_UserInput";
  v10 = &unk_1F19B4BC8;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v7 viewController:self didFinishWithConfigurationResults:v8];
}

- (void)_openLink:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    int v8 = 138412546;
    v9 = self;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_homeHubRequiredLearnMoreURL");
  [(HUHomeHubResidentWarningViewController *)self _openURL:v7];
}

- (void)_openURL:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F3AEB8];
  id v5 = a3;
  id v7 = (id)[[v4 alloc] initWithURL:v5];

  [v7 setModalPresentationStyle:1];
  v6 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  [v7 setPreferredControlTintColor:v6];

  [(HUHomeHubResidentWarningViewController *)self presentViewController:v7 animated:1 completion:0];
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

- (OBHeaderAccessoryButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
}

- (OBBoldTrayButton)commitButton
{
  return self->_commitButton;
}

- (void)setCommitButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commitButton, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end