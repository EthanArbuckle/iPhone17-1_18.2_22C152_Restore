@interface HUHomeHubSharedHomeWarningViewController
- (BOOL)isFinalStep;
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUHomeHubSharedHomeWarningViewController)initWithSharedHomes:(id)a3;
- (NSSet)homes;
- (OBBoldTrayButton)commitButton;
- (UIBarButtonItem)cancelButton;
- (id)_commitOrContinueButtonTitle;
- (void)_cancelFlow:(id)a3;
- (void)_commitOrContinue;
- (void)_continueTapped:(id)a3;
- (void)_presentConfirmationAlert;
- (void)setCancelButton:(id)a3;
- (void)setCommitButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHomes:(id)a3;
- (void)setIsFinalStep:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HUHomeHubSharedHomeWarningViewController

- (HUHomeHubSharedHomeWarningViewController)initWithSharedHomes:(id)a3
{
  id v5 = a3;
  v6 = [[HUHomeHubSharedHomeWarningItemManager alloc] initWithDelegate:self homes:v5];
  v7 = [[HUHomeHubSimpleTableViewController alloc] initWithItemManager:v6 tableViewStyle:1 descriptionStringWithFormatKey:@"HUSoftwareUpdateSharedHomesWarningSharedBySecondaryText"];
  if ((unint64_t)[v5 count] >= 2) {
    v8 = @"HUSoftwareUpdateSharedHomesWarningTitlePlural";
  }
  else {
    v8 = @"HUSoftwareUpdateSharedHomesWarningTitle";
  }
  v9 = _HULocalizedStringWithDefaultValue(v8, v8, 1);
  if ((unint64_t)[v5 count] >= 2) {
    v10 = @"HUSoftwareUpdateSharedHomesWarningDescriptionPlural";
  }
  else {
    v10 = @"HUSoftwareUpdateSharedHomesWarningDescription";
  }
  v11 = _HULocalizedStringWithDefaultValue(v10, v10, 1);
  v15.receiver = self;
  v15.super_class = (Class)HUHomeHubSharedHomeWarningViewController;
  v12 = [(HUItemTableOBWelcomeController *)&v15 initWithTitle:v9 detailText:v11 icon:0 contentLayout:2 itemTableViewController:v7];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_homes, a3);
  }

  return v13;
}

- (void)viewDidLoad
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)HUHomeHubSharedHomeWarningViewController;
  [(HUItemTableOBWelcomeController *)&v18 viewDidLoad];
  v4 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUHomeHubSharedHomeWarningViewController *)self setCommitButton:v4];

  id v5 = [(HUHomeHubSharedHomeWarningViewController *)self commitButton];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(HUHomeHubSharedHomeWarningViewController *)self commitButton];
  v7 = [(HUHomeHubSharedHomeWarningViewController *)self _commitOrContinueButtonTitle];
  [v6 setTitle:v7 forState:0];

  v8 = [(HUHomeHubSharedHomeWarningViewController *)self commitButton];
  [v8 addTarget:self action:sel__continueTapped_ forControlEvents:64];

  v9 = [(HUHomeHubSharedHomeWarningViewController *)self buttonTray];
  v10 = [(HUHomeHubSharedHomeWarningViewController *)self commitButton];
  [v9 addButton:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F427C0]);
  v12 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
  v13 = (void *)[v11 initWithTitle:v12 style:0 target:self action:sel__cancelFlow_];
  [(HUHomeHubSharedHomeWarningViewController *)self setCancelButton:v13];

  v14 = [(OBBaseWelcomeController *)self navigationItem];
  objc_super v15 = [(HUHomeHubSharedHomeWarningViewController *)self cancelButton];
  [v14 setRightBarButtonItem:v15];

  [(HUHomeHubSharedHomeWarningViewController *)self setModalInPresentation:1];
  v16 = HFLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v20 = self;
    __int16 v21 = 2112;
    v22 = v17;
    _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HUHomeHubSharedHomesWarningViewController", buf, 0x16u);
  }
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (id)_commitOrContinueButtonTitle
{
  v3 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationUpgradeAnyway", @"HUSoftwareUpdateMigrationUpgradeAnyway", 1);
  if ([(HUHomeHubSharedHomeWarningViewController *)self isFinalStep])
  {
    id v4 = v3;
  }
  else
  {
    _HULocalizedStringWithDefaultValue(@"HUContinueTitle", @"HUContinueTitle", 1);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v4;

  return v5;
}

- (void)_continueTapped:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    int v7 = 138412546;
    v8 = self;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v7, 0x16u);
  }
  [(HUHomeHubSharedHomeWarningViewController *)self _presentConfirmationAlert];
}

- (void)_cancelFlow:(id)a3
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
  int v7 = [(HUHomeHubSharedHomeWarningViewController *)self delegate];
  __int16 v9 = @"HUHomeHub2OnboardingKey_UserInput";
  v10 = &unk_1F19B3FF8;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v7 viewController:self didFinishWithConfigurationResults:v8];
}

- (void)_commitOrContinue
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(HUHomeHubSharedHomeWarningViewController *)self isFinalStep])
  {
    v3 = [(HUHomeHubSharedHomeWarningViewController *)self delegate];
    id v5 = @"HUHomeHub2OnboardingKey_UserInput";
    v6[0] = &unk_1F19B4010;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
    [v3 viewController:self didFinishWithConfigurationResults:v4];
  }
}

- (void)_presentConfirmationAlert
{
  v3 = [(HUHomeHubSharedHomeWarningViewController *)self homes];
  if ((unint64_t)[v3 count] <= 1) {
    id v4 = @"HUSoftwareUpdateMigrationSharedHomeConfirmationDescriptionSingular";
  }
  else {
    id v4 = @"HUSoftwareUpdateMigrationSharedHomeConfirmationDescriptionPlural";
  }
  id v5 = _HULocalizedStringWithDefaultValue(v4, v4, 1);

  v6 = (void *)MEMORY[0x1E4F42728];
  int v7 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationConfirmationAlertTitle", @"HUSoftwareUpdateMigrationConfirmationAlertTitle", 1);
  v8 = [v6 alertControllerWithTitle:v7 message:v5 preferredStyle:1];

  __int16 v9 = (void *)MEMORY[0x1E4F42720];
  v10 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationConfirmationContinueButton", @"HUSoftwareUpdateMigrationConfirmationContinueButton", 1);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__HUHomeHubSharedHomeWarningViewController__presentConfirmationAlert__block_invoke;
  v15[3] = &unk_1E6385188;
  v15[4] = self;
  uint64_t v11 = [v9 actionWithTitle:v10 style:0 handler:v15];

  v12 = (void *)MEMORY[0x1E4F42720];
  __int16 v13 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
  v14 = [v12 actionWithTitle:v13 style:1 handler:0];

  [v8 addAction:v11];
  [v8 addAction:v14];
  [(HUHomeHubSharedHomeWarningViewController *)self presentViewController:v8 animated:1 completion:0];
}

uint64_t __69__HUHomeHubSharedHomeWarningViewController__presentConfirmationAlert__block_invoke(uint64_t a1)
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

- (NSSet)homes
{
  return self->_homes;
}

- (void)setHomes:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_homes, 0);
  objc_storeStrong((id *)&self->_commitButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end