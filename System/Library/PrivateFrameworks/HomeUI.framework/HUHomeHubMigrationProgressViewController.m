@interface HUHomeHubMigrationProgressViewController
- (BOOL)_limitToNonScrollingContentHeight;
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUHomeHubMigrationProgressViewController)initWithOwnedHomes:(id)a3;
- (UIActivityIndicatorView)spinner;
- (void)_cleanUp;
- (void)_handleFailedMigration:(id)a3;
- (void)_handleSuccessfulMigration;
- (void)_startHH2Upgrade;
- (void)homeManager:(id)a3 didUpdateHH2MigrationInProgressState:(BOOL)a4;
- (void)homeManager:(id)a3 didUpdateHH2State:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setSpinner:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUHomeHubMigrationProgressViewController

- (HUHomeHubMigrationProgressViewController)initWithOwnedHomes:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] <= 1) {
    v5 = @"HUSoftwareUpdateMigrationInProgressTitleSingluar";
  }
  else {
    v5 = @"HUSoftwareUpdateMigrationInProgressTitlePlural";
  }
  v6 = _HULocalizedStringWithDefaultValue(v5, v5, 1);
  unint64_t v7 = [v4 count];

  if (v7 >= 2) {
    v8 = @"HUSoftwareUpdateMigrationInProgressDescriptionPlural";
  }
  else {
    v8 = @"HUSoftwareUpdateMigrationInProgressDescriptionSingluar";
  }
  v9 = _HULocalizedStringWithDefaultValue(v8, v8, 1);
  v10 = (void *)MEMORY[0x1E4F42A98];
  v11 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  v12 = [v10 configurationWithHierarchicalColor:v11];

  v13 = [MEMORY[0x1E4F42A98] configurationWithPointSize:100.0];
  v14 = [v13 configurationByApplyingConfiguration:v12];
  v15 = [MEMORY[0x1E4F42A80] systemImageNamed:@"homekit"];
  v16 = [v15 imageWithConfiguration:v14];

  v20.receiver = self;
  v20.super_class = (Class)HUHomeHubMigrationProgressViewController;
  v17 = [(HUImageOBWelcomeController *)&v20 initWithTitle:v6 detailText:v9 icon:0 contentImage:v16];
  if (v17)
  {
    v18 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    [v18 addHomeManagerObserver:v17];
  }
  return v17;
}

- (void)viewDidLoad
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)HUHomeHubMigrationProgressViewController;
  [(HUImageOBWelcomeController *)&v29 viewDidLoad];
  id v4 = [(HUHomeHubMigrationProgressViewController *)self headerView];
  v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5CF0];

  v6 = [(OBBaseWelcomeController *)self navigationItem];
  [v6 setHidesBackButton:1];

  [(HUHomeHubMigrationProgressViewController *)self setModalInPresentation:1];
  [(HUHomeHubMigrationProgressViewController *)self _startHH2Upgrade];
  unint64_t v7 = [(HUHomeHubMigrationProgressViewController *)self buttonTray];
  [v7 addCaptionText:@" "];

  v8 = [MEMORY[0x1E4F83A80] boldButton];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setHidden:1];
  v9 = [(HUHomeHubMigrationProgressViewController *)self buttonTray];
  [v9 addButton:v8];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:101];
  [(HUHomeHubMigrationProgressViewController *)self setSpinner:v10];

  v11 = [(HUHomeHubMigrationProgressViewController *)self spinner];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v12 = [(HUHomeHubMigrationProgressViewController *)self spinner];
  [v12 sizeToFit];

  v13 = [(HUHomeHubMigrationProgressViewController *)self spinner];
  [v13 startAnimating];

  v14 = [(HUHomeHubMigrationProgressViewController *)self spinner];
  [v14 setAccessibilityIdentifier:@"Home.OnboardingView.HomeHubMigration.Progress.Spinner"];

  v15 = [(HUHomeHubMigrationProgressViewController *)self buttonTray];
  v16 = [(HUHomeHubMigrationProgressViewController *)self spinner];
  [v15 addSubview:v16];

  v17 = [(HUHomeHubMigrationProgressViewController *)self spinner];
  v18 = [v17 centerXAnchor];
  v19 = [(HUHomeHubMigrationProgressViewController *)self buttonTray];
  objc_super v20 = [v19 centerXAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  v22 = [(HUHomeHubMigrationProgressViewController *)self spinner];
  v23 = [v22 topAnchor];
  v24 = [(HUHomeHubMigrationProgressViewController *)self buttonTray];
  v25 = [v24 topAnchor];
  v26 = [v23 constraintEqualToAnchor:v25 constant:20.0];
  [v26 setActive:1];

  v27 = HFLogForCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v31 = self;
    __int16 v32 = 2112;
    v33 = v28;
    _os_log_impl(&dword_1BE345000, v27, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HUHomeHubMigrationProgressViewController", buf, 0x16u);
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

- (void)homeManager:(id)a3 didUpdateHH2State:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    int v9 = 138412802;
    v10 = self;
    __int16 v11 = 2112;
    v12 = v8;
    __int16 v13 = 1024;
    BOOL v14 = v4;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@: Migration Completed - didUpdateHH2State = %{BOOL}d", (uint8_t *)&v9, 0x1Cu);
  }
  if (v4) {
    [(HUHomeHubMigrationProgressViewController *)self _handleSuccessfulMigration];
  }
}

- (void)homeManager:(id)a3 didUpdateHH2MigrationInProgressState:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = NSStringFromSelector(a2);
    v10 = [v7 hh2MigrationFailedError];
    int v13 = 138413058;
    BOOL v14 = self;
    __int16 v15 = 2112;
    v16 = v9;
    __int16 v17 = 1024;
    BOOL v18 = v4;
    __int16 v19 = 2112;
    objc_super v20 = v10;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@: Migration is in progress? %{BOOL}d, hh2MigrationFailedError = %@", (uint8_t *)&v13, 0x26u);
  }
  if (!v4)
  {
    __int16 v11 = [v7 hh2MigrationFailedError];

    if (v11)
    {
      v12 = [v7 hh2MigrationFailedError];
      [(HUHomeHubMigrationProgressViewController *)self _handleFailedMigration:v12];
    }
  }
}

- (void)_startHH2Upgrade
{
  v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  BOOL v4 = [v3 homeManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__HUHomeHubMigrationProgressViewController__startHH2Upgrade__block_invoke;
  v5[3] = &unk_1E6386708;
  v5[4] = self;
  [v4 upgradeToROARWithCompletionHandler:v5];
}

uint64_t __60__HUHomeHubMigrationProgressViewController__startHH2Upgrade__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) _handleFailedMigration:a2];
  }
  return result;
}

- (void)_handleSuccessfulMigration
{
  v6[1] = *MEMORY[0x1E4F143B8];
  [(HUHomeHubMigrationProgressViewController *)self _cleanUp];
  v3 = [(HUHomeHubMigrationProgressViewController *)self delegate];
  v5 = @"HUHomeHub2OnboardingKey_UserInput";
  v6[0] = &unk_1F19B47C0;
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v3 viewController:self didFinishWithConfigurationResults:v4];
}

- (void)_handleFailedMigration:(id)a3
{
  id v4 = a3;
  [(HUHomeHubMigrationProgressViewController *)self _cleanUp];
  id v7 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:&unk_1F19B47D8 forKey:@"HUHomeHub2OnboardingKey_UserInput"];
  v5 = [MEMORY[0x1E4F69110] localizedDescriptionForError:v4];

  if (v5) {
    [v7 setObject:v5 forKey:@"HUHomeHub2OnboardingKey_ErrorDescription"];
  }
  v6 = [(HUHomeHubMigrationProgressViewController *)self delegate];
  [v6 viewController:self didFinishWithConfigurationResults:v7];
}

- (void)_cleanUp
{
  id v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  [v3 removeHomeManagerObserver:self];
}

- (HUConfigurationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUConfigurationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end