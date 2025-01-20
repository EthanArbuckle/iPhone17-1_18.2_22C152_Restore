@interface HUHomeHubMigrationSuccessViewController
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (OBBoldTrayButton)commitButton;
- (void)_doneAction:(id)a3;
- (void)setCommitButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUHomeHubMigrationSuccessViewController

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)HUHomeHubMigrationSuccessViewController;
  [(OBBaseWelcomeController *)&v12 viewDidLoad];
  v3 = [(OBBaseWelcomeController *)self navigationItem];
  [v3 setHidesBackButton:1 animated:0];

  v4 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUHomeHubMigrationSuccessViewController *)self setCommitButton:v4];

  v5 = [(HUHomeHubMigrationSuccessViewController *)self commitButton];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(HUHomeHubMigrationSuccessViewController *)self commitButton];
  v7 = _HULocalizedStringWithDefaultValue(@"HUDoneTitle", @"HUDoneTitle", 1);
  [v6 setTitle:v7 forState:0];

  v8 = [(HUHomeHubMigrationSuccessViewController *)self commitButton];
  [v8 setAccessibilityIdentifier:@"Home.OnboardingView.HomeHubMigration.Success.DoneButton"];

  v9 = [(HUHomeHubMigrationSuccessViewController *)self commitButton];
  [v9 addTarget:self action:sel__doneAction_ forControlEvents:64];

  v10 = [(HUHomeHubMigrationSuccessViewController *)self buttonTray];
  v11 = [(HUHomeHubMigrationSuccessViewController *)self commitButton];
  [v10 addButton:v11];
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (void)_doneAction:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v4 = [(HUHomeHubMigrationSuccessViewController *)self delegate];
  v6 = @"HUHomeHub2OnboardingKey_UserInput";
  v7[0] = &unk_1F19B4910;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v4 viewController:self didFinishWithConfigurationResults:v5];
}

- (HUConfigurationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUConfigurationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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

  objc_destroyWeak((id *)&self->_delegate);
}

@end