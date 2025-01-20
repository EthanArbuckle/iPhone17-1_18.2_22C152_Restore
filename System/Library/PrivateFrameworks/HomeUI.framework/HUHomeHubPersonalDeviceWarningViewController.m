@interface HUHomeHubPersonalDeviceWarningViewController
- (BOOL)isFinalStep;
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUHomeHubPersonalDeviceWarningViewController)initWithDevices:(id)a3 homes:(id)a4;
- (NSString)captionString;
- (NSString)confirmationString;
- (OBBoldTrayButton)commitButton;
- (UIBarButtonItem)cancelButton;
- (id)_commitOrContinueButtonTitle;
- (void)_cancelFlow:(id)a3;
- (void)_commitOrContinue;
- (void)_continueTapped:(id)a3;
- (void)_presentConfirmationAlert;
- (void)setCancelButton:(id)a3;
- (void)setCaptionString:(id)a3;
- (void)setCommitButton:(id)a3;
- (void)setConfirmationString:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsFinalStep:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HUHomeHubPersonalDeviceWarningViewController

- (HUHomeHubPersonalDeviceWarningViewController)initWithDevices:(id)a3 homes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [v6 count];
  if (v8 > 1)
  {
    v10 = &stru_1F18F92B8;
  }
  else
  {
    v9 = [v6 firstObject];
    objc_msgSend(v9, "hf_displayName");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v11 = [[HUHomeHubPersonalDeviceWarningItemManager alloc] initWithDelegate:self devices:v7];

  v12 = [(HUItemTableViewController *)[HUHomeHubSimpleTableViewController alloc] initWithItemManager:v11 tableViewStyle:1];
  v19 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdatePersonalDeviceWarningTitle", @"HUSoftwareUpdatePersonalDeviceWarningTitle", 1);
  if (v8 > 1) {
    _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdatePersonalDeviceWarningDescriptionPlural", @"HUSoftwareUpdatePersonalDeviceWarningDescriptionPlural", 1);
  }
  else {
  v20 = HULocalizedStringWithFormat(@"HUSoftwareUpdatePersonalDeviceWarningDescription", @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v10);
  }
  v27.receiver = self;
  v27.super_class = (Class)HUHomeHubPersonalDeviceWarningViewController;
  v21 = [(HUItemTableOBWelcomeController *)&v27 initWithTitle:v19 detailText:v20 icon:0 contentLayout:2 itemTableViewController:v12];
  if (v21)
  {
    if (v8 >= 2) {
      v22 = @"HUSoftwareUpdatePersonalDeviceWarningCaptionPluralHomes";
    }
    else {
      v22 = @"HUSoftwareUpdatePersonalDeviceWarningCaption";
    }
    v23 = _HULocalizedStringWithDefaultValue(v22, v22, 1);
    objc_storeStrong((id *)&v21->_captionString, v23);

    if (v8 > 1) {
      v24 = @"HUSoftwareUpdateMigrationPersonalDeviceConfirmationDescriptionPluralHomes";
    }
    else {
      v24 = @"HUSoftwareUpdateMigrationPersonalDeviceConfirmationDescription";
    }
    v25 = _HULocalizedStringWithDefaultValue(v24, v24, 1);
    objc_storeStrong((id *)&v21->_confirmationString, v25);
  }
  return v21;
}

- (void)viewDidLoad
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)HUHomeHubPersonalDeviceWarningViewController;
  [(HUItemTableOBWelcomeController *)&v24 viewDidLoad];
  v4 = [(HUHomeHubPersonalDeviceWarningViewController *)self headerView];
  v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5BB0];

  id v6 = [(HUHomeHubPersonalDeviceWarningViewController *)self buttonTray];
  id v7 = [(HUHomeHubPersonalDeviceWarningViewController *)self captionString];
  [v6 addCaptionText:v7];

  unint64_t v8 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUHomeHubPersonalDeviceWarningViewController *)self setCommitButton:v8];

  v9 = [(HUHomeHubPersonalDeviceWarningViewController *)self commitButton];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [(HUHomeHubPersonalDeviceWarningViewController *)self commitButton];
  v11 = [(HUHomeHubPersonalDeviceWarningViewController *)self _commitOrContinueButtonTitle];
  [v10 setTitle:v11 forState:0];

  v12 = [(HUHomeHubPersonalDeviceWarningViewController *)self commitButton];
  [v12 setAccessibilityIdentifier:@"Home.OnboardingView.HomeHubMigration.HUHomeHubPersonalDeviceWarning.CommitOrContinueButton"];

  uint64_t v13 = [(HUHomeHubPersonalDeviceWarningViewController *)self commitButton];
  [v13 addTarget:self action:sel__continueTapped_ forControlEvents:64];

  uint64_t v14 = [(HUHomeHubPersonalDeviceWarningViewController *)self buttonTray];
  uint64_t v15 = [(HUHomeHubPersonalDeviceWarningViewController *)self commitButton];
  [v14 addButton:v15];

  id v16 = objc_alloc(MEMORY[0x1E4F427C0]);
  uint64_t v17 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
  uint64_t v18 = (void *)[v16 initWithTitle:v17 style:0 target:self action:sel__cancelFlow_];
  [(HUHomeHubPersonalDeviceWarningViewController *)self setCancelButton:v18];

  v19 = [(HUHomeHubPersonalDeviceWarningViewController *)self cancelButton];
  [v19 setAccessibilityIdentifier:@"Home.OnboardingView.HomeHubMigration.HUHomeHubPersonalDeviceWarning.CancelButton"];

  v20 = [(OBBaseWelcomeController *)self navigationItem];
  v21 = [(HUHomeHubPersonalDeviceWarningViewController *)self cancelButton];
  [v20 setRightBarButtonItem:v21];

  [(HUHomeHubPersonalDeviceWarningViewController *)self setModalInPresentation:1];
  v22 = HFLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v26 = self;
    __int16 v27 = 2112;
    v28 = v23;
    _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HUHomeHubPersonalDeviceWarningViewController", buf, 0x16u);
  }
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (id)_commitOrContinueButtonTitle
{
  v3 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationUpgradeAnyway", @"HUSoftwareUpdateMigrationUpgradeAnyway", 1);
  if ([(HUHomeHubPersonalDeviceWarningViewController *)self isFinalStep])
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

- (void)_continueTapped:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromSelector(a2);
    int v7 = 138412546;
    unint64_t v8 = self;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v7, 0x16u);
  }
  [(HUHomeHubPersonalDeviceWarningViewController *)self _presentConfirmationAlert];
}

- (void)_cancelFlow:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v12 = self;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  int v7 = [(HUHomeHubPersonalDeviceWarningViewController *)self delegate];
  __int16 v9 = @"HUHomeHub2OnboardingKey_UserInput";
  v10 = &unk_1F19B3F80;
  unint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v7 viewController:self didFinishWithConfigurationResults:v8];
}

- (void)_commitOrContinue
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(HUHomeHubPersonalDeviceWarningViewController *)self isFinalStep]) {
    uint64_t v3 = 6;
  }
  else {
    uint64_t v3 = 1;
  }
  id v4 = [(HUHomeHubPersonalDeviceWarningViewController *)self delegate];
  int v7 = @"HUHomeHub2OnboardingKey_UserInput";
  v5 = [NSNumber numberWithUnsignedInteger:v3];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 viewController:self didFinishWithConfigurationResults:v6];
}

- (void)_presentConfirmationAlert
{
  uint64_t v3 = (void *)MEMORY[0x1E4F42728];
  id v4 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationConfirmationAlertTitle", @"HUSoftwareUpdateMigrationConfirmationAlertTitle", 1);
  v5 = [(HUHomeHubPersonalDeviceWarningViewController *)self confirmationString];
  id v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  int v7 = (void *)MEMORY[0x1E4F42720];
  unint64_t v8 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationConfirmationContinueButton", @"HUSoftwareUpdateMigrationConfirmationContinueButton", 1);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__HUHomeHubPersonalDeviceWarningViewController__presentConfirmationAlert__block_invoke;
  v13[3] = &unk_1E6385188;
  v13[4] = self;
  __int16 v9 = [v7 actionWithTitle:v8 style:0 handler:v13];

  v10 = (void *)MEMORY[0x1E4F42720];
  uint64_t v11 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
  v12 = [v10 actionWithTitle:v11 style:1 handler:&__block_literal_global_70];

  [v6 addAction:v9];
  [v6 addAction:v12];
  [(HUHomeHubPersonalDeviceWarningViewController *)self presentViewController:v6 animated:1 completion:0];
}

void __73__HUHomeHubPersonalDeviceWarningViewController__presentConfirmationAlert__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 title];
    int v6 = 136315394;
    int v7 = "-[HUHomeHubPersonalDeviceWarningViewController _presentConfirmationAlert]_block_invoke";
    __int16 v8 = 2112;
    __int16 v9 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped software update migration confirmation continue button '%@' from the alert popup", (uint8_t *)&v6, 0x16u);
  }
  [*(id *)(a1 + 32) _commitOrContinue];
}

void __73__HUHomeHubPersonalDeviceWarningViewController__presentConfirmationAlert__block_invoke_76()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = HFLogForCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[HUHomeHubPersonalDeviceWarningViewController _presentConfirmationAlert]_block_invoke";
    _os_log_impl(&dword_1BE345000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User tapped cancel button from the alert popup", (uint8_t *)&v1, 0xCu);
  }
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

- (OBBoldTrayButton)commitButton
{
  return self->_commitButton;
}

- (void)setCommitButton:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (NSString)captionString
{
  return self->_captionString;
}

- (void)setCaptionString:(id)a3
{
}

- (NSString)confirmationString
{
  return self->_confirmationString;
}

- (void)setConfirmationString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationString, 0);
  objc_storeStrong((id *)&self->_captionString, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_commitButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end