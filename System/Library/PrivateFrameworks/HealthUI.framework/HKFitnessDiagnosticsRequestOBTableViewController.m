@interface HKFitnessDiagnosticsRequestOBTableViewController
+ (BOOL)needsRequestedPermission;
- (BOOL)_indexPathIsValidRow:(id)a3;
- (BOOL)shouldInlineButtonTray;
- (HKFitnessDiagnosticsRequestOBTableViewController)initWithTitle:(id)a3;
- (NSString)buttonTitle;
- (id)_cellForFitnessDiagnosticsDetailsAtIndexPath:(id)a3;
- (id)_cellForViewImproveHealthExamplesAtIndexPath:(id)a3;
- (id)buttonText;
- (id)completion;
- (id)improveHealthPrivacyIdentifier;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_rowFromIndexPath:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_configureTableView;
- (void)_disableDataCollection;
- (void)_enableDataCollection;
- (void)_setUpFooterView;
- (void)_showDataCollectionAdditionalInfo;
- (void)_updateForCurrentContentSizeCategory;
- (void)setButtonText:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setCompletion:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HKFitnessDiagnosticsRequestOBTableViewController

- (id)improveHealthPrivacyIdentifier
{
  return @"com.apple.onboarding.improvehealth";
}

- (HKFitnessDiagnosticsRequestOBTableViewController)initWithTitle:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  v6 = [v4 bundleWithIdentifier:@"com.apple.HealthUI"];
  v7 = [v6 localizedStringForKey:@"DATA_COLLECTION_MESSAGE_VISION_OS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v10.receiver = self;
  v10.super_class = (Class)HKFitnessDiagnosticsRequestOBTableViewController;
  v8 = [(OBTableWelcomeController *)&v10 initWithTitle:v5 detailText:v7 icon:0 adoptTableViewScrollView:1];

  return v8;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)HKFitnessDiagnosticsRequestOBTableViewController;
  [(OBTableWelcomeController *)&v14 viewDidLoad];
  baseAutomationIdentifier = self->_baseAutomationIdentifier;
  self->_baseAutomationIdentifier = (NSString *)@"UIA.Health.Onboarding.ImproveHealthAndActivity";

  v4 = self->_baseAutomationIdentifier;
  id v5 = [(HKFitnessDiagnosticsRequestOBTableViewController *)self view];
  [v5 setAccessibilityIdentifier:v4];

  [(HKFitnessDiagnosticsRequestOBTableViewController *)self _configureTableView];
  v6 = (void *)MEMORY[0x1E4F83A88];
  v7 = [(HKFitnessDiagnosticsRequestOBTableViewController *)self improveHealthPrivacyIdentifier];
  v8 = [v6 bundleWithIdentifier:v7];

  v9 = [MEMORY[0x1E4F83A98] accessoryButton];
  objc_super v10 = [MEMORY[0x1E4FB1618] linkColor];
  [v9 setTitleColor:v10 forState:0];

  v11 = [v8 privacyFlow];
  v12 = [v11 localizedButtonTitle];
  [v9 setTitle:v12 forState:0];

  [v9 addTarget:self action:sel__showDataCollectionAdditionalInfo forControlEvents:64];
  v13 = [(HKFitnessDiagnosticsRequestOBTableViewController *)self headerView];
  [v13 addAccessoryButton:v9];

  [(HKFitnessDiagnosticsRequestOBTableViewController *)self _setUpFooterView];
  [(HKFitnessDiagnosticsRequestOBTableViewController *)self setModalInPresentation:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKFitnessDiagnosticsRequestOBTableViewController;
  [(OBBaseWelcomeController *)&v5 viewDidAppear:a3];
  v4 = [(OBTableWelcomeController *)self tableView];
  [v4 flashScrollIndicators];
}

- (void)_configureTableView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  v4 = objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(OBTableWelcomeController *)self setTableView:v4];

  objc_super v5 = [(OBTableWelcomeController *)self tableView];
  [v5 setDataSource:self];

  v6 = [(OBTableWelcomeController *)self tableView];
  [v6 setDelegate:self];

  v7 = [(OBTableWelcomeController *)self tableView];
  objc_msgSend(v7, "setDirectionalLayoutMargins:", 0.0, 30.0, 0.0, 50.0);

  v8 = [(OBTableWelcomeController *)self tableView];
  [v8 registerClass:objc_opt_class() forCellReuseIdentifier:@"_FitnessDiagnosticsDetailsCellReuseIdentifier"];

  id v9 = [(OBTableWelcomeController *)self tableView];
  [v9 registerClass:objc_opt_class() forCellReuseIdentifier:@"_ViewFitnessDiagnosticsCellReuseIdentifier"];
}

- (void)_setUpFooterView
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F83A80] boldButton];
  [v3 addTarget:self action:sel__enableDataCollection forControlEvents:64];
  v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  objc_super v5 = [v4 localizedStringForKey:@"DATA_COLLECTION_ENABLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [v3 setTitle:v5 forState:0];

  v20[0] = self->_baseAutomationIdentifier;
  v20[1] = @"EnableButton";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v7 = HKUIJoinStringsForAutomationIdentifier(v6);
  [v3 setAccessibilityIdentifier:v7];

  v8 = [(HKFitnessDiagnosticsRequestOBTableViewController *)self buttonTray];
  [v8 addButton:v3];

  id v9 = [MEMORY[0x1E4F83AB8] linkButton];
  [v9 addTarget:self action:sel__disableDataCollection forControlEvents:64];
  objc_super v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v11 = [v10 localizedStringForKey:@"DATA_COLLECTION_DISABLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [v9 setTitle:v11 forState:0];

  v19[0] = self->_baseAutomationIdentifier;
  v19[1] = @"DisableButton";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v13 = HKUIJoinStringsForAutomationIdentifier(v12);
  [v9 setAccessibilityIdentifier:v13];

  objc_super v14 = [v9 titleLabel];
  [v14 setAdjustsFontSizeToFitWidth:1];

  v15 = [v3 configuration];
  v16 = [v15 baseBackgroundColor];
  v17 = [v9 configuration];
  [v17 setBaseBackgroundColor:v16];

  v18 = [(HKFitnessDiagnosticsRequestOBTableViewController *)self buttonTray];
  [v18 addButton:v9];
}

- (BOOL)_indexPathIsValidRow:(id)a3
{
  id v3 = a3;
  if ([v3 section]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [v3 row] < 1;
  }

  return v4;
}

- (int64_t)_rowFromIndexPath:(id)a3
{
  id v5 = a3;
  if (![(HKFitnessDiagnosticsRequestOBTableViewController *)self _indexPathIsValidRow:v5])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HKFitnessDiagnosticsRequestOBTableViewController.m", 109, @"Invalid parameter not satisfying: %@", @"[self _indexPathIsValidRow:indexPath]" object file lineNumber description];
  }
  int64_t v6 = [v5 row];

  return v6;
}

- (id)_cellForFitnessDiagnosticsDetailsAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(OBTableWelcomeController *)self tableView];
  int64_t v6 = [v5 dequeueReusableCellWithIdentifier:@"_FitnessDiagnosticsDetailsCellReuseIdentifier" forIndexPath:v4];

  return v6;
}

- (id)_cellForViewImproveHealthExamplesAtIndexPath:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(OBTableWelcomeController *)self tableView];
  int64_t v6 = [v5 dequeueReusableCellWithIdentifier:@"_ViewFitnessDiagnosticsCellReuseIdentifier" forIndexPath:v4];

  v13[0] = self->_baseAutomationIdentifier;
  v13[1] = @"Cell";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v8 = HKUIJoinStringsForAutomationIdentifier(v7);
  [v6 setAccessibilityIdentifier:v8];

  id v9 = [v6 textLabel];
  objc_super v10 = [(HKFitnessDiagnosticsRequestOBTableViewController *)self buttonTitle];
  [v9 setText:v10];

  v11 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_appKeyColor");
  [v9 setTextColor:v11];

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(HKFitnessDiagnosticsRequestOBTableViewController *)self _rowFromIndexPath:v6];
  if (v7 == 1)
  {
    uint64_t v8 = [(HKFitnessDiagnosticsRequestOBTableViewController *)self _cellForViewImproveHealthExamplesAtIndexPath:v6];
  }
  else
  {
    if (v7) {
      goto LABEL_6;
    }
    uint64_t v8 = [(HKFitnessDiagnosticsRequestOBTableViewController *)self _cellForFitnessDiagnosticsDetailsAtIndexPath:v6];
  }
  id v4 = (void *)v8;
LABEL_6:

  return v4;
}

- (void)_updateForCurrentContentSizeCategory
{
  id v2 = [(OBTableWelcomeController *)self tableView];
  [v2 reloadData];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKFitnessDiagnosticsRequestOBTableViewController;
  [(HKFitnessDiagnosticsRequestOBTableViewController *)&v10 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(HKFitnessDiagnosticsRequestOBTableViewController *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];
    int64_t v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __77__HKFitnessDiagnosticsRequestOBTableViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E6D50ED8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __77__HKFitnessDiagnosticsRequestOBTableViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateForCurrentContentSizeCategory];
}

- (id)buttonText
{
  id v2 = (void *)[(NSString *)self->_buttonTitle copy];
  return v2;
}

- (void)setButtonText:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  buttonTitle = self->_buttonTitle;
  self->_buttonTitle = v4;
  MEMORY[0x1F41817F8](v4, buttonTitle);
}

- (BOOL)shouldInlineButtonTray
{
  return 0;
}

+ (BOOL)needsRequestedPermission
{
  if (([MEMORY[0x1E4F2B860] isRunningStoreDemoMode] & 1) != 0
    || ([MEMORY[0x1E4F74230] sharedConnection],
        id v2 = objc_claimAutoreleasedReturnValue(),
        int v3 = [v2 isDiagnosticSubmissionAllowed],
        v2,
        !v3))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F74230] sharedConnection];
    int v5 = [v4 hasHealthDataSubmissionAllowedBeenSet] ^ 1;
  }
  return v5;
}

- (void)_enableDataCollection
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  int v3 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    int64_t v7 = self;
    _os_log_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Enabled Data Collection", buf, 0xCu);
  }
  uint64_t v4 = *MEMORY[0x1E4F65848];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__HKFitnessDiagnosticsRequestOBTableViewController__enableDataCollection__block_invoke;
  v5[3] = &unk_1E6D512C8;
  v5[4] = self;
  [MEMORY[0x1E4F65860] setUserDidAccept:1 currentAgreement:v4 completion:v5];
}

void __73__HKFitnessDiagnosticsRequestOBTableViewController__enableDataCollection__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__HKFitnessDiagnosticsRequestOBTableViewController__enableDataCollection__block_invoke_2;
  block[3] = &unk_1E6D50ED8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __73__HKFitnessDiagnosticsRequestOBTableViewController__enableDataCollection__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentingViewController];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__HKFitnessDiagnosticsRequestOBTableViewController__enableDataCollection__block_invoke_3;
  v3[3] = &unk_1E6D50ED8;
  v3[4] = *(void *)(a1 + 32);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

void __73__HKFitnessDiagnosticsRequestOBTableViewController__enableDataCollection__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completion];

  if (v2)
  {
    int v3 = [*(id *)(a1 + 32) completion];
    v3[2](v3, 1);
  }
}

- (void)_disableDataCollection
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  int v3 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    int64_t v7 = self;
    _os_log_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Disabled Data Collection", buf, 0xCu);
  }
  uint64_t v4 = *MEMORY[0x1E4F65848];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__HKFitnessDiagnosticsRequestOBTableViewController__disableDataCollection__block_invoke;
  v5[3] = &unk_1E6D512C8;
  v5[4] = self;
  [MEMORY[0x1E4F65860] setUserDidAccept:0 currentAgreement:v4 completion:v5];
}

void __74__HKFitnessDiagnosticsRequestOBTableViewController__disableDataCollection__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HKFitnessDiagnosticsRequestOBTableViewController__disableDataCollection__block_invoke_2;
  block[3] = &unk_1E6D50ED8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __74__HKFitnessDiagnosticsRequestOBTableViewController__disableDataCollection__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentingViewController];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__HKFitnessDiagnosticsRequestOBTableViewController__disableDataCollection__block_invoke_3;
  v3[3] = &unk_1E6D50ED8;
  v3[4] = *(void *)(a1 + 32);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

void __74__HKFitnessDiagnosticsRequestOBTableViewController__disableDataCollection__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completion];

  if (v2)
  {
    int v3 = [*(id *)(a1 + 32) completion];
    v3[2](v3, 0);
  }
}

- (void)_showDataCollectionAdditionalInfo
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  int v3 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = self;
    _os_log_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Presenting Privacy view controller", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v4 = (void *)MEMORY[0x1E4F83AD8];
  int v5 = [(HKFitnessDiagnosticsRequestOBTableViewController *)self improveHealthPrivacyIdentifier];
  id v6 = [v4 presenterForPrivacySplashWithIdentifier:v5];

  [v6 setPresentingViewController:self];
  [v6 present];
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_baseAutomationIdentifier, 0);
}

@end