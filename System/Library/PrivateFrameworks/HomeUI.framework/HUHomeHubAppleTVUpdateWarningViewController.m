@interface HUHomeHubAppleTVUpdateWarningViewController
- (BOOL)blockMigration;
- (BOOL)isFinalStep;
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUHomeHubAppleTVUpdateWarningViewController)initWithAppleTVsToUpdate:(id)a3 shouldBlockMigration:(BOOL)a4;
- (NSArray)appleTVs;
- (OBBoldTrayButton)commitButton;
- (OBHeaderAccessoryButton)linkButton;
- (id)_commitOrContinueButtonTitle;
- (void)_cancelFlow:(id)a3;
- (void)_commitOrContinue;
- (void)_continueTapped:(id)a3;
- (void)_openLink:(id)a3;
- (void)_openURL:(id)a3;
- (void)_presentConfirmationAlert;
- (void)setAppleTVs:(id)a3;
- (void)setBlockMigration:(BOOL)a3;
- (void)setCommitButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsFinalStep:(BOOL)a3;
- (void)setLinkButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUHomeHubAppleTVUpdateWarningViewController

- (HUHomeHubAppleTVUpdateWarningViewController)initWithAppleTVsToUpdate:(id)a3 shouldBlockMigration:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __93__HUHomeHubAppleTVUpdateWarningViewController_initWithAppleTVsToUpdate_shouldBlockMigration___block_invoke;
  v21[3] = &unk_1E6385EE8;
  id v9 = v8;
  id v22 = v9;
  objc_msgSend(v7, "na_each:", v21);
  if (v4)
  {
    v10 = _HULocalizedStringWithDefaultValue(@"HUAppleTVSoftwareUpdateBlockingDescription", @"HUAppleTVSoftwareUpdateBlockingDescription", 1);
    if ((unint64_t)[v9 count] <= 1) {
      goto LABEL_7;
    }
    v11 = @"HUAppleTVSoftwareUpdateBlockingDescriptionPluralHomes";
  }
  else
  {
    v10 = _HULocalizedStringWithDefaultValue(@"HUAppleTVSoftwareUpdateRequiredDescription", @"HUAppleTVSoftwareUpdateRequiredDescription", 1);
    if ((unint64_t)[v9 count] < 2) {
      goto LABEL_7;
    }
    v11 = @"HUAppleTVSoftwareUpdateRequiredDescriptionPluralHomes";
  }
  uint64_t v12 = _HULocalizedStringWithDefaultValue(v11, v11, 1);

  v10 = (void *)v12;
LABEL_7:
  v13 = [HUHomeHubAccessoryListItemManager alloc];
  v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  v15 = [(HUHomeHubAccessoryListItemManager *)v13 initWithAccessories:v14 delegate:self];

  v16 = [(HUItemTableViewController *)[HUHomeHubSimpleTableViewController alloc] initWithItemManager:v15 tableViewStyle:1];
  v17 = _HULocalizedStringWithDefaultValue(@"HUAppleTVSoftwareUpdateRequiredTitle", @"HUAppleTVSoftwareUpdateRequiredTitle", 1);
  v20.receiver = self;
  v20.super_class = (Class)HUHomeHubAppleTVUpdateWarningViewController;
  v18 = [(HUItemTableOBWelcomeController *)&v20 initWithTitle:v17 detailText:v10 icon:0 contentLayout:2 itemTableViewController:v16];

  if (v18)
  {
    v18->_blockMigration = v4;
    objc_storeStrong((id *)&v18->_appleTVs, a3);
  }

  return v18;
}

void __93__HUHomeHubAppleTVUpdateWarningViewController_initWithAppleTVsToUpdate_shouldBlockMigration___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 home];
  [v2 addObject:v3];
}

- (void)viewDidLoad
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)HUHomeHubAppleTVUpdateWarningViewController;
  [(HUItemTableOBWelcomeController *)&v29 viewDidLoad];
  BOOL v4 = [(HUHomeHubAppleTVUpdateWarningViewController *)self headerView];
  v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5BD8];

  if (![(HUHomeHubAppleTVUpdateWarningViewController *)self blockMigration])
  {
    v6 = _HULocalizedStringWithDefaultValue(@"HUAppleTVSoftwareUpdateRequiredCaption", @"HUAppleTVSoftwareUpdateRequiredCaption", 1);
    id v7 = [(HUHomeHubAppleTVUpdateWarningViewController *)self buttonTray];
    [v7 addCaptionText:v6];
  }
  if ([(HUHomeHubAppleTVUpdateWarningViewController *)self blockMigration])
  {
    v8 = [MEMORY[0x1E4F83A98] accessoryButton];
    [(HUHomeHubAppleTVUpdateWarningViewController *)self setLinkButton:v8];

    id v9 = [(HUHomeHubAppleTVUpdateWarningViewController *)self linkButton];
    v10 = _HULocalizedStringWithDefaultValue(@"HUAppleTVSoftwareUpdateLearnMoreMessage", @"HUAppleTVSoftwareUpdateLearnMoreMessage", 1);
    [v9 setTitle:v10 forState:0];

    v11 = [(HUHomeHubAppleTVUpdateWarningViewController *)self linkButton];
    [v11 setAccessibilityIdentifier:@"Home.OnboardingView.HomeHubMigration.HUAppleTVUpdateWarning.LearnMoreLink"];

    uint64_t v12 = [(HUHomeHubAppleTVUpdateWarningViewController *)self linkButton];
    [v12 addTarget:self action:sel__openLink_ forControlEvents:64];

    v13 = [(HUHomeHubAppleTVUpdateWarningViewController *)self headerView];
    v14 = [(HUHomeHubAppleTVUpdateWarningViewController *)self linkButton];
    [v13 addAccessoryButton:v14];
  }
  v15 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUHomeHubAppleTVUpdateWarningViewController *)self setCommitButton:v15];

  v16 = [(HUHomeHubAppleTVUpdateWarningViewController *)self commitButton];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  v17 = [(HUHomeHubAppleTVUpdateWarningViewController *)self commitButton];
  v18 = [(HUHomeHubAppleTVUpdateWarningViewController *)self _commitOrContinueButtonTitle];
  [v17 setTitle:v18 forState:0];

  v19 = [(HUHomeHubAppleTVUpdateWarningViewController *)self commitButton];
  [v19 setAccessibilityIdentifier:@"Home.OnboardingView.HomeHubMigration.HUAppleTVUpdateWarning.CommitOrContinueButton"];

  objc_super v20 = [(HUHomeHubAppleTVUpdateWarningViewController *)self commitButton];
  [v20 addTarget:self action:sel__continueTapped_ forControlEvents:64];

  v21 = [(HUHomeHubAppleTVUpdateWarningViewController *)self buttonTray];
  id v22 = [(HUHomeHubAppleTVUpdateWarningViewController *)self commitButton];
  [v21 addButton:v22];

  id v23 = objc_alloc(MEMORY[0x1E4F427C0]);
  v24 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
  v25 = (void *)[v23 initWithTitle:v24 style:0 target:self action:sel__cancelFlow_];

  [v25 setAccessibilityIdentifier:@"Home.OnboardingView.HomeHubMigration.HUAppleTVUpdateWarning.CancelButton"];
  v26 = [(OBBaseWelcomeController *)self navigationItem];
  [v26 setRightBarButtonItem:v25];

  [(HUHomeHubAppleTVUpdateWarningViewController *)self setModalInPresentation:1];
  v27 = HFLogForCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v31 = self;
    __int16 v32 = 2112;
    v33 = v28;
    _os_log_impl(&dword_1BE345000, v27, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HUHomeHubSharedHomesWarningViewController", buf, 0x16u);
  }
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (id)_commitOrContinueButtonTitle
{
  if ([(HUHomeHubAppleTVUpdateWarningViewController *)self blockMigration])
  {
    id v3 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationUpgradeLaterTitle", @"HUSoftwareUpdateMigrationUpgradeLaterTitle", 1);
  }
  else
  {
    BOOL v4 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationUpgradeAnyway", @"HUSoftwareUpdateMigrationUpgradeAnyway", 1);
    if ([(HUHomeHubAppleTVUpdateWarningViewController *)self isFinalStep])
    {
      id v5 = v4;
    }
    else
    {
      _HULocalizedStringWithDefaultValue(@"HUContinueTitle", @"HUContinueTitle", 1);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v3 = v5;
  }

  return v3;
}

- (void)_continueTapped:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    BOOL v7 = [(HUHomeHubAppleTVUpdateWarningViewController *)self blockMigration];
    v8 = @"NO";
    *(_DWORD *)buf = 138412802;
    v14 = self;
    __int16 v15 = 2112;
    if (v7) {
      v8 = @"YES";
    }
    v16 = v6;
    __int16 v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button, blocking migration: %@", buf, 0x20u);
  }
  if ([(HUHomeHubAppleTVUpdateWarningViewController *)self blockMigration])
  {
    id v9 = [(HUHomeHubAppleTVUpdateWarningViewController *)self delegate];
    v11 = @"HUHomeHub2OnboardingKey_UserInput";
    uint64_t v12 = &unk_1F19B40B8;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    [v9 viewController:self didFinishWithConfigurationResults:v10];
  }
  else
  {
    [(HUHomeHubAppleTVUpdateWarningViewController *)self _presentConfirmationAlert];
  }
}

- (void)_cancelFlow:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  BOOL v7 = [(HUHomeHubAppleTVUpdateWarningViewController *)self delegate];
  id v9 = @"HUHomeHub2OnboardingKey_UserInput";
  v10 = &unk_1F19B40B8;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v7 viewController:self didFinishWithConfigurationResults:v8];
}

- (void)_commitOrContinue
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(HUHomeHubAppleTVUpdateWarningViewController *)self isFinalStep]) {
    uint64_t v3 = 6;
  }
  else {
    uint64_t v3 = 4;
  }
  BOOL v4 = [(HUHomeHubAppleTVUpdateWarningViewController *)self delegate];
  BOOL v7 = @"HUHomeHub2OnboardingKey_UserInput";
  id v5 = [NSNumber numberWithUnsignedInteger:v3];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 viewController:self didFinishWithConfigurationResults:v6];
}

- (void)_presentConfirmationAlert
{
  uint64_t v3 = [(HUHomeHubAppleTVUpdateWarningViewController *)self appleTVs];
  if ((unint64_t)[v3 count] <= 1) {
    BOOL v4 = @"HUSoftwareUpdateMigrationAppleTVConfirmationDescriptionSingular";
  }
  else {
    BOOL v4 = @"HUSoftwareUpdateMigrationAppleTVConfirmationDescriptionPlural";
  }
  id v5 = _HULocalizedStringWithDefaultValue(v4, v4, 1);

  v6 = (void *)MEMORY[0x1E4F42728];
  BOOL v7 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationConfirmationAlertTitle", @"HUSoftwareUpdateMigrationConfirmationAlertTitle", 1);
  v8 = [v6 alertControllerWithTitle:v7 message:v5 preferredStyle:1];

  id v9 = (void *)MEMORY[0x1E4F42720];
  v10 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationConfirmationContinueButton", @"HUSoftwareUpdateMigrationConfirmationContinueButton", 1);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__HUHomeHubAppleTVUpdateWarningViewController__presentConfirmationAlert__block_invoke;
  v15[3] = &unk_1E6385188;
  v15[4] = self;
  v11 = [v9 actionWithTitle:v10 style:0 handler:v15];

  uint64_t v12 = (void *)MEMORY[0x1E4F42720];
  __int16 v13 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
  v14 = [v12 actionWithTitle:v13 style:1 handler:0];

  [v8 addAction:v11];
  [v8 addAction:v14];
  [(HUHomeHubAppleTVUpdateWarningViewController *)self presentViewController:v8 animated:1 completion:0];
}

uint64_t __72__HUHomeHubAppleTVUpdateWarningViewController__presentConfirmationAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _commitOrContinue];
}

- (void)_openLink:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v8, 0x16u);
  }
  BOOL v7 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_learnToUpdateAppleTVURL");
  [(HUHomeHubAppleTVUpdateWarningViewController *)self _openURL:v7];
}

- (void)_openURL:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F3AEB8];
  id v5 = a3;
  id v7 = (id)[[v4 alloc] initWithURL:v5];

  [v7 setModalPresentationStyle:1];
  v6 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  [v7 setPreferredControlTintColor:v6];

  [(HUHomeHubAppleTVUpdateWarningViewController *)self presentViewController:v7 animated:1 completion:0];
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

- (BOOL)blockMigration
{
  return self->_blockMigration;
}

- (void)setBlockMigration:(BOOL)a3
{
  self->_blockMigration = a3;
}

- (NSArray)appleTVs
{
  return self->_appleTVs;
}

- (void)setAppleTVs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleTVs, 0);
  objc_storeStrong((id *)&self->_commitButton, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end