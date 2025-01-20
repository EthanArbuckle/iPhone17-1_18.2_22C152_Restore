@interface HKClinicalAuthorizationYouShouldKnowViewController
- (BOOL)_indexPathIsValidRow:(id)a3;
- (HKClinicalAuthorizationSequenceContext)context;
- (HKClinicalAuthorizationYouShouldKnowViewController)init;
- (HKClinicalAuthorizationYouShouldKnowViewController)initWithContext:(id)a3 viewController:(id)a4;
- (HKClinicalAuthorizationYouShouldKnowViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HKHealthPrivacyServicePromptControllerDelegate)delegate;
- (NSString)headerTitle;
- (UIViewController)nextViewController;
- (id)_cellForDetailsAtIndexPath:(id)a3;
- (id)_cellForViewHealthRecordsAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_rowFromIndexPath:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelButtonPressed:(id)a3;
- (void)_configureHeaderViewWithSource:(id)a3;
- (void)_configureNavigationItem;
- (void)_configureTableView;
- (void)_finishWithError:(id)a3;
- (void)_nextButtonPressed:(id)a3;
- (void)_setUpFooterView;
- (void)_updateForCurrentContentSizeCategory;
- (void)_viewHealthRecordsCellTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setNextViewController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HKClinicalAuthorizationYouShouldKnowViewController

- (HKClinicalAuthorizationYouShouldKnowViewController)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalAuthorizationYouShouldKnowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HKClinicalAuthorizationYouShouldKnowViewController)initWithContext:(id)a3 viewController:(id)a4
{
  id v6 = a3;
  id v20 = a4;
  v7 = HKHealthRecordsAPILocalizedString(@"YOU_SHOULD_KNOW_VIEW_MAIN_TITLE");
  id v8 = [NSString alloc];
  v9 = HKHealthRecordsAPILocalizedString(@"YOU_SHOULD_KNOW_PRIVACY_DETAILS_%@_%@_TITLE");
  v10 = [v6 source];
  v11 = [v10 name];
  v12 = [v6 source];
  v13 = [v12 name];
  v14 = objc_msgSend(v8, "initWithFormat:", v9, v11, v13);

  v15 = +[HKClinicalAuthorizationFlowManager tableViewHeaderIcon];
  v21.receiver = self;
  v21.super_class = (Class)HKClinicalAuthorizationYouShouldKnowViewController;
  v16 = [(OBTableWelcomeController *)&v21 initWithTitle:v7 detailText:v14 icon:v15 adoptTableViewScrollView:1];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_context, a3);
    objc_storeStrong((id *)&v17->_nextViewController, a4);
    [(HKClinicalAuthorizationYouShouldKnowViewController *)v17 setShouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen:0];
  }

  return v17;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HKClinicalAuthorizationYouShouldKnowViewController;
  [(OBTableWelcomeController *)&v3 viewDidLoad];
  [(HKClinicalAuthorizationYouShouldKnowViewController *)self _configureTableView];
  [(HKClinicalAuthorizationYouShouldKnowViewController *)self _configureNavigationItem];
  [(HKClinicalAuthorizationYouShouldKnowViewController *)self _setUpFooterView];
  [(HKClinicalAuthorizationYouShouldKnowViewController *)self setModalInPresentation:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKClinicalAuthorizationYouShouldKnowViewController;
  [(OBBaseWelcomeController *)&v5 viewDidAppear:a3];
  uint64_t v4 = [(OBTableWelcomeController *)self tableView];
  [v4 flashScrollIndicators];
}

- (void)_configureTableView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  uint64_t v4 = objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(OBTableWelcomeController *)self setTableView:v4];

  objc_super v5 = [(OBTableWelcomeController *)self tableView];
  [v5 setDataSource:self];

  id v6 = [(OBTableWelcomeController *)self tableView];
  [v6 setDelegate:self];

  v7 = [(HKClinicalAuthorizationYouShouldKnowViewController *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 != 6)
  {
    v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v10 = [(HKClinicalAuthorizationYouShouldKnowViewController *)self view];
    [v10 setBackgroundColor:v9];

    v11 = [(HKClinicalAuthorizationYouShouldKnowViewController *)self view];
    v12 = [v11 backgroundColor];
    v13 = [(OBTableWelcomeController *)self tableView];
    [v13 setBackgroundColor:v12];
  }
  v14 = [(OBTableWelcomeController *)self tableView];
  [v14 registerClass:objc_opt_class() forCellReuseIdentifier:@"_DetailsCellReuseIdentifier"];

  id v15 = [(OBTableWelcomeController *)self tableView];
  [v15 registerClass:objc_opt_class() forCellReuseIdentifier:@"_ViewHealthRecordsCellReuseIdentifier"];
}

- (void)_configureNavigationItem
{
  id v9 = [(OBBaseWelcomeController *)self navigationItem];
  [v9 setLargeTitleDisplayMode:2];
  id v3 = (void *)MEMORY[0x1E4FB14A8];
  uint64_t v4 = HKHealthRecordsAPILocalizedString(@"BACK_BAR_BUTTON_TITLE");
  objc_super v5 = objc_msgSend(v3, "hk_backButtonWithTitle:", v4);
  [v9 setBackBarButtonItem:v5];

  id v6 = HKHealthRecordsAPILocalizedString(@"IN_APP_SEQUENCE_TITLE_INTRO");
  [v9 setTitle:v6];

  v7 = HKHealthRecordsAPILocalizedString(@"IN_APP_SEQUENCE_TITLE_ACCESSIBILITY_%@");
  [v9 setAccessibilityLabel:v7];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonPressed_];
  [v9 setRightBarButtonItem:v8];
}

- (void)_configureHeaderViewWithSource:(id)a3
{
  objc_super v5 = [a3 name];

  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationYouShouldKnowViewController.m", 129, @"Invalid parameter not satisfying: %@", @"source.name != nil" object file lineNumber description];
  }
  id v8 = [(HKClinicalAuthorizationYouShouldKnowViewController *)self headerTitle];
  id v6 = [(HKClinicalAuthorizationYouShouldKnowViewController *)self headerView];
  [v6 setTitle:v8];
}

- (void)_setUpFooterView
{
  id v3 = [MEMORY[0x1E4F83A80] boldButton];
  nextButton = self->_nextButton;
  self->_nextButton = v3;

  objc_super v5 = self->_nextButton;
  id v6 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [(OBBoldTrayButton *)v5 setTintColor:v6];

  v7 = self->_nextButton;
  id v8 = HKHealthRecordsAPILocalizedString(@"YOU_SHOULD_KNOW_CONTINUE_BUTTON_TITLE");
  [(OBBoldTrayButton *)v7 setTitle:v8 forState:0];

  [(OBBoldTrayButton *)self->_nextButton addTarget:self action:sel__nextButtonPressed_ forControlEvents:64];
  id v9 = [(HKClinicalAuthorizationYouShouldKnowViewController *)self buttonTray];
  [v9 addButton:self->_nextButton];
}

- (BOOL)_indexPathIsValidRow:(id)a3
{
  id v3 = a3;
  if ([v3 section]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [v3 row] < 2;
  }

  return v4;
}

- (int64_t)_rowFromIndexPath:(id)a3
{
  id v5 = a3;
  if (![(HKClinicalAuthorizationYouShouldKnowViewController *)self _indexPathIsValidRow:v5])
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationYouShouldKnowViewController.m", 148, @"Invalid parameter not satisfying: %@", @"[self _indexPathIsValidRow:indexPath]" object file lineNumber description];
  }
  int64_t v6 = [v5 row];

  return v6;
}

- (id)_cellForDetailsAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(OBTableWelcomeController *)self tableView];
  int64_t v6 = [v5 dequeueReusableCellWithIdentifier:@"_DetailsCellReuseIdentifier" forIndexPath:v4];

  v7 = [(HKClinicalAuthorizationYouShouldKnowViewController *)self context];
  id v8 = [v7 source];
  [v6 setSource:v8];

  return v6;
}

- (id)_cellForViewHealthRecordsAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(OBTableWelcomeController *)self tableView];
  int64_t v6 = [v5 dequeueReusableCellWithIdentifier:@"_ViewHealthRecordsCellReuseIdentifier" forIndexPath:v4];

  v7 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1F090);
  [v6 setAccessibilityIdentifier:v7];

  id v8 = [v6 textLabel];
  id v9 = HKHealthRecordsAPILocalizedString(@"YOU_SHOULD_KNOW_VIEW_HEALTH_RECORDS_BUTTON_TITLE");
  [v8 setText:v9];

  v10 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_appKeyColor");
  [v8 setTextColor:v10];

  return v6;
}

- (void)_cancelButtonPressed:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 7, @"The user canceled authorization.");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(HKClinicalAuthorizationYouShouldKnowViewController *)self _finishWithError:v4];
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG)) {
    -[HKClinicalAuthorizationYouShouldKnowViewController _finishWithError:](v5);
  }
  int64_t v6 = [(HKClinicalAuthorizationYouShouldKnowViewController *)self delegate];
  [v6 promptControllerDidFinish:self error:v4];
}

- (void)_nextButtonPressed:(id)a3
{
  id v4 = [(HKClinicalAuthorizationYouShouldKnowViewController *)self navigationController];
  [v4 pushViewController:self->_nextViewController animated:1];
}

- (void)_viewHealthRecordsCellTapped:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "_hk_urlForViewHealthRecords");
  [v4 openURL:v3 withOptions:0];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(HKClinicalAuthorizationYouShouldKnowViewController *)self _rowFromIndexPath:v6];
  if (v7 == 1)
  {
    id v8 = [(HKClinicalAuthorizationYouShouldKnowViewController *)self _cellForViewHealthRecordsAtIndexPath:v6];
  }
  else
  {
    if (v7) {
      goto LABEL_6;
    }
    id v8 = [(HKClinicalAuthorizationYouShouldKnowViewController *)self _cellForDetailsAtIndexPath:v6];
  }
  id v9 = v8;
  id v4 = objc_msgSend(v8, "hkui_configuredForCHR3rdPartyAPIFlowWhilePrompting:", 1);

LABEL_6:
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  int64_t v7 = [(HKClinicalAuthorizationYouShouldKnowViewController *)self _rowFromIndexPath:v6];
  id v8 = [v9 cellForRowAtIndexPath:v6];
  if (v7 == 1) {
    [(HKClinicalAuthorizationYouShouldKnowViewController *)self _viewHealthRecordsCellTapped:v8];
  }
  [v9 deselectRowAtIndexPath:v6 animated:v7 == 1];
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
  v10.super_class = (Class)HKClinicalAuthorizationYouShouldKnowViewController;
  [(HKClinicalAuthorizationYouShouldKnowViewController *)&v10 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(HKClinicalAuthorizationYouShouldKnowViewController *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];
    int64_t v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __79__HKClinicalAuthorizationYouShouldKnowViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E6D50ED8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __79__HKClinicalAuthorizationYouShouldKnowViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateForCurrentContentSizeCategory];
}

- (HKHealthPrivacyServicePromptControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKHealthPrivacyServicePromptControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HKClinicalAuthorizationSequenceContext)context
{
  return self->_context;
}

- (UIViewController)nextViewController
{
  return self->_nextViewController;
}

- (void)setNextViewController:(id)a3
{
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_nextViewController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nextButton, 0);
}

- (void)_finishWithError:(void *)a1 .cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  int v3 = 138412290;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_debug_impl(&dword_1E0B26000, v1, OS_LOG_TYPE_DEBUG, "%@: dismissing", (uint8_t *)&v3, 0xCu);
}

@end