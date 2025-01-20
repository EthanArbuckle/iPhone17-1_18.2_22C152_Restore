@interface HUHomeHubSharedUserWarningViewController
- (BOOL)isFinalStep;
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUHomeHubSharedUserWarningViewController)initWithHomesToUsersMap:(id)a3;
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

@implementation HUHomeHubSharedUserWarningViewController

- (HUHomeHubSharedUserWarningViewController)initWithHomesToUsersMap:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 count];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__29;
  v27 = __Block_byref_object_dispose__29;
  v28 = &stru_1F18F92B8;
  if (v5 <= 1)
  {
    v6 = [v4 keyEnumerator];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __68__HUHomeHubSharedUserWarningViewController_initWithHomesToUsersMap___block_invoke;
    v22[3] = &unk_1E638FCF0;
    v22[4] = &v23;
    objc_msgSend(v6, "na_each:", v22);
  }
  v7 = [[HUHomeHubSharedUserWarningItemManager alloc] initWithDelegate:self homesToUsersMap:v4];
  v8 = [(HUItemTableViewController *)[HUHomeHubSharedUserWarningTableViewController alloc] initWithItemManager:v7 tableViewStyle:1];
  v15 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateSharedUsersWarningTitle", @"HUSoftwareUpdateSharedUsersWarningTitle", 1);
  if (v5 >= 2) {
    _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateSharedUsersWarningDescriptionMultipleHomes", @"HUSoftwareUpdateSharedUsersWarningDescriptionMultipleHomes", 1);
  }
  else {
  v16 = HULocalizedStringWithFormat(@"HUSoftwareUpdateSharedUsersWarningDescriptionOneHome", @"%@", v9, v10, v11, v12, v13, v14, v24[5]);
  }
  v21.receiver = self;
  v21.super_class = (Class)HUHomeHubSharedUserWarningViewController;
  v17 = [(HUItemTableOBWelcomeController *)&v21 initWithTitle:v15 detailText:v16 icon:0 contentLayout:2 itemTableViewController:v8];
  if (v17)
  {
    if (v5 >= 2) {
      _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdatePersonalDeviceWarningCaptionPluralHomes", @"HUSoftwareUpdatePersonalDeviceWarningCaptionPluralHomes", 1);
    }
    else {
    v18 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdatePersonalDeviceWarningCaption", @"HUSoftwareUpdatePersonalDeviceWarningCaption", 1);
    }
    objc_storeStrong((id *)&v17->_captionString, v18);

    if (v5 > 1) {
      _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationSharedUserConfirmationDescriptionPluralHomes", @"HUSoftwareUpdateMigrationSharedUserConfirmationDescriptionPluralHomes", 1);
    }
    else {
    v19 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationSharedUserConfirmationDescription", @"HUSoftwareUpdateMigrationSharedUserConfirmationDescription", 1);
    }
    objc_storeStrong((id *)&v17->_confirmationString, v19);
  }
  _Block_object_dispose(&v23, 8);

  return v17;
}

void __68__HUHomeHubSharedUserWarningViewController_initWithHomesToUsersMap___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "hf_displayName");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)viewDidLoad
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)HUHomeHubSharedUserWarningViewController;
  [(HUItemTableOBWelcomeController *)&v24 viewDidLoad];
  uint64_t v4 = [(HUHomeHubSharedUserWarningViewController *)self headerView];
  unint64_t v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5F20];

  v6 = [(HUHomeHubSharedUserWarningViewController *)self buttonTray];
  v7 = [(HUHomeHubSharedUserWarningViewController *)self captionString];
  [v6 addCaptionText:v7];

  v8 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUHomeHubSharedUserWarningViewController *)self setCommitButton:v8];

  uint64_t v9 = [(HUHomeHubSharedUserWarningViewController *)self commitButton];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v10 = [(HUHomeHubSharedUserWarningViewController *)self commitButton];
  uint64_t v11 = [(HUHomeHubSharedUserWarningViewController *)self _commitOrContinueButtonTitle];
  [v10 setTitle:v11 forState:0];

  uint64_t v12 = [(HUHomeHubSharedUserWarningViewController *)self commitButton];
  [v12 setAccessibilityIdentifier:@"Home.OnboardingView.HomeHubMigration.HUHomeHubSharedUserWarningViewController.CommitOrContinueButton"];

  uint64_t v13 = [(HUHomeHubSharedUserWarningViewController *)self commitButton];
  [v13 addTarget:self action:sel__continueTapped_ forControlEvents:64];

  uint64_t v14 = [(HUHomeHubSharedUserWarningViewController *)self buttonTray];
  v15 = [(HUHomeHubSharedUserWarningViewController *)self commitButton];
  [v14 addButton:v15];

  id v16 = objc_alloc(MEMORY[0x1E4F427C0]);
  v17 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
  v18 = (void *)[v16 initWithTitle:v17 style:0 target:self action:sel__cancelFlow_];
  [(HUHomeHubSharedUserWarningViewController *)self setCancelButton:v18];

  v19 = [(HUHomeHubSharedUserWarningViewController *)self cancelButton];
  [v19 setAccessibilityIdentifier:@"Home.OnboardingView.HomeHubMigration.HUHomeHubSharedUserWarningViewController.CancelButton"];

  v20 = [(OBBaseWelcomeController *)self navigationItem];
  objc_super v21 = [(HUHomeHubSharedUserWarningViewController *)self cancelButton];
  [v20 setRightBarButtonItem:v21];

  [(HUHomeHubSharedUserWarningViewController *)self setModalInPresentation:1];
  v22 = HFLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v26 = self;
    __int16 v27 = 2112;
    v28 = v23;
    _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HUHomeHubSharedUserWarningViewController", buf, 0x16u);
  }
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (id)_commitOrContinueButtonTitle
{
  uint64_t v3 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationUpgradeAnyway", @"HUSoftwareUpdateMigrationUpgradeAnyway", 1);
  if ([(HUHomeHubSharedUserWarningViewController *)self isFinalStep])
  {
    id v4 = v3;
  }
  else
  {
    _HULocalizedStringWithDefaultValue(@"HUContinueTitle", @"HUContinueTitle", 1);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  unint64_t v5 = v4;

  return v5;
}

- (void)_continueTapped:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    int v7 = 138412546;
    v8 = self;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v7, 0x16u);
  }
  [(HUHomeHubSharedUserWarningViewController *)self _presentConfirmationAlert];
}

- (void)_cancelFlow:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  int v7 = [(HUHomeHubSharedUserWarningViewController *)self delegate];
  __int16 v9 = @"HUHomeHub2OnboardingKey_UserInput";
  uint64_t v10 = &unk_1F19B4D48;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v7 viewController:self didFinishWithConfigurationResults:v8];
}

- (void)_commitOrContinue
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(HUHomeHubSharedUserWarningViewController *)self isFinalStep]) {
    uint64_t v3 = 6;
  }
  else {
    uint64_t v3 = 2;
  }
  id v4 = [(HUHomeHubSharedUserWarningViewController *)self delegate];
  int v7 = @"HUHomeHub2OnboardingKey_UserInput";
  unint64_t v5 = [NSNumber numberWithUnsignedInteger:v3];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 viewController:self didFinishWithConfigurationResults:v6];
}

- (void)_presentConfirmationAlert
{
  uint64_t v3 = (void *)MEMORY[0x1E4F42728];
  id v4 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationConfirmationAlertTitle", @"HUSoftwareUpdateMigrationConfirmationAlertTitle", 1);
  unint64_t v5 = [(HUHomeHubSharedUserWarningViewController *)self confirmationString];
  v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  int v7 = (void *)MEMORY[0x1E4F42720];
  v8 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationConfirmationContinueButton", @"HUSoftwareUpdateMigrationConfirmationContinueButton", 1);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__HUHomeHubSharedUserWarningViewController__presentConfirmationAlert__block_invoke;
  v13[3] = &unk_1E6385188;
  v13[4] = self;
  __int16 v9 = [v7 actionWithTitle:v8 style:0 handler:v13];

  uint64_t v10 = (void *)MEMORY[0x1E4F42720];
  uint64_t v11 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
  uint64_t v12 = [v10 actionWithTitle:v11 style:1 handler:0];

  [v6 addAction:v9];
  [v6 addAction:v12];
  [(HUHomeHubSharedUserWarningViewController *)self presentViewController:v6 animated:1 completion:0];
}

uint64_t __69__HUHomeHubSharedUserWarningViewController__presentConfirmationAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _commitOrContinue];
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