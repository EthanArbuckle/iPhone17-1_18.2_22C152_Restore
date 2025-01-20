@interface HUHomeHubMigrationFailedViewController
- (BOOL)_limitToNonScrollingContentHeight;
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUHomeHubMigrationFailedViewController)init;
- (HUHomeHubMigrationFailedViewController)initWithDetailText:(id)a3;
- (OBBoldTrayButton)commitButton;
- (void)_doneAction:(id)a3;
- (void)setCommitButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUHomeHubMigrationFailedViewController

- (HUHomeHubMigrationFailedViewController)init
{
  v3 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationFailedDescription", @"HUSoftwareUpdateMigrationFailedDescription", 1);
  v4 = [(HUHomeHubMigrationFailedViewController *)self initWithDetailText:v3];

  return v4;
}

- (HUHomeHubMigrationFailedViewController)initWithDetailText:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F42A98];
  v5 = (void *)MEMORY[0x1E4F428B8];
  id v6 = a3;
  v7 = objc_msgSend(v5, "hf_keyColor");
  v8 = [v4 configurationWithHierarchicalColor:v7];

  v9 = [MEMORY[0x1E4F42A98] configurationWithPointSize:100.0];
  v10 = [v9 configurationByApplyingConfiguration:v8];
  v11 = [MEMORY[0x1E4F42A80] systemImageNamed:@"exclamationmark.triangle.fill"];
  v12 = [v11 imageWithConfiguration:v10];

  v13 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationFailedTitle", @"HUSoftwareUpdateMigrationFailedTitle", 1);
  v16.receiver = self;
  v16.super_class = (Class)HUHomeHubMigrationFailedViewController;
  v14 = [(HUImageOBWelcomeController *)&v16 initWithTitle:v13 detailText:v6 icon:0 contentImage:v12];

  return v14;
}

- (void)viewDidLoad
{
  v3 = [(HUHomeHubMigrationFailedViewController *)self headerView];
  v4 = [v3 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v4 withIDDictionary:&unk_1F19B5E58];

  v14.receiver = self;
  v14.super_class = (Class)HUHomeHubMigrationFailedViewController;
  [(HUImageOBWelcomeController *)&v14 viewDidLoad];
  v5 = [(OBBaseWelcomeController *)self navigationItem];
  [v5 setHidesBackButton:1 animated:0];

  id v6 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUHomeHubMigrationFailedViewController *)self setCommitButton:v6];

  v7 = [(HUHomeHubMigrationFailedViewController *)self commitButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(HUHomeHubMigrationFailedViewController *)self commitButton];
  v9 = _HULocalizedStringWithDefaultValue(@"HUDoneTitle", @"HUDoneTitle", 1);
  [v8 setTitle:v9 forState:0];

  v10 = [(HUHomeHubMigrationFailedViewController *)self commitButton];
  [v10 setAccessibilityIdentifier:@"Home.OnboardingView.HomeHubMigration.Failed.DoneButton"];

  v11 = [(HUHomeHubMigrationFailedViewController *)self commitButton];
  [v11 addTarget:self action:sel__doneAction_ forControlEvents:64];

  v12 = [(HUHomeHubMigrationFailedViewController *)self buttonTray];
  v13 = [(HUHomeHubMigrationFailedViewController *)self commitButton];
  [v12 addButton:v13];
}

- (BOOL)_limitToNonScrollingContentHeight
{
  return 1;
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (void)_doneAction:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v4 = [(HUHomeHubMigrationFailedViewController *)self delegate];
  id v6 = @"HUHomeHub2OnboardingKey_UserInput";
  v7[0] = &unk_1F19B4B68;
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