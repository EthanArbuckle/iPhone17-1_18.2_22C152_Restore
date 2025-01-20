@interface HKClinicalAuthorizationNewRecordsViewController
- (BOOL)_indexPathIsValidRow:(id)a3;
- (HKClinicalAuthorizationDisplayController)displayController;
- (HKClinicalAuthorizationNewRecordsViewController)init;
- (HKClinicalAuthorizationNewRecordsViewController)initWithContext:(id)a3;
- (HKClinicalAuthorizationNewRecordsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HKClinicalAuthorizationSequenceContext)context;
- (HKHealthPrivacyServicePromptControllerDelegate)delegate;
- (id)_indexPathForShareAuthorizationMode:(int64_t)a3;
- (id)_shareAuthorizationModeCellForIndexPath:(id)a3;
- (id)_titleForShareAuthorizationModeFooter;
- (id)_visibleShareAuthorizationModeCellForMode:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)_shareAuthorizationModeForIndexPath:(id)a3;
- (int64_t)authorizationMode;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelButtonPressed:(id)a3;
- (void)_configureNavigationItem;
- (void)_configureTableView;
- (void)_doneButtonPressed:(id)a3;
- (void)_finishWithError:(id)a3;
- (void)_setUpFooterView;
- (void)_shareAuthorizationModeCellPressed:(id)a3;
- (void)_updateDownloadingStatusIndicator;
- (void)_updateForCurrentContentSizeCategory;
- (void)_updateShareAuthorizationModeSectionFooter;
- (void)ingestionStatusDidChangeTo:(unint64_t)a3;
- (void)setAuthorizationMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HKClinicalAuthorizationNewRecordsViewController

- (HKClinicalAuthorizationNewRecordsViewController)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalAuthorizationNewRecordsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HKClinicalAuthorizationNewRecordsViewController)initWithContext:(id)a3
{
  id v5 = a3;
  uint64_t v6 = HKHealthRecordsAPILocalizedString(@"NEW_RECORDS_MAIN_TITLE");
  v7 = [(HKClinicalAuthorizationNewRecordsViewController *)self context];
  v8 = [v7 source];
  v9 = HKHealthRecordsAPILocalizedStringWithSource(@"APP_ACCESS_REQUEST_NEW_RECORDS", v8);

  v10 = +[HKClinicalAuthorizationFlowManager tableViewHeaderIcon];
  v18.receiver = self;
  v18.super_class = (Class)HKClinicalAuthorizationNewRecordsViewController;
  v11 = [(OBTableWelcomeController *)&v18 initWithTitle:v6 detailText:v9 icon:v10 adoptTableViewScrollView:1];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_context, a3);
    v13 = [HKClinicalAuthorizationDisplayController alloc];
    v14 = [v5 authorizationController];
    uint64_t v15 = [(HKClinicalAuthorizationDisplayController *)v13 initWithAuthorizationController:v14];
    displayController = v12->_displayController;
    v12->_displayController = (HKClinicalAuthorizationDisplayController *)v15;

    [(HKClinicalAuthorizationNewRecordsViewController *)v12 setAuthorizationMode:1];
    [(HKClinicalAuthorizationNewRecordsViewController *)v12 setShouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen:0];
  }

  return v12;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HKClinicalAuthorizationNewRecordsViewController;
  [(OBTableWelcomeController *)&v4 viewDidLoad];
  [(HKClinicalAuthorizationNewRecordsViewController *)self _configureTableView];
  [(HKClinicalAuthorizationNewRecordsViewController *)self _configureNavigationItem];
  [(HKClinicalAuthorizationNewRecordsViewController *)self _setUpFooterView];
  [(HKClinicalAuthorizationNewRecordsViewController *)self setModalInPresentation:1];
  v3 = [(HKClinicalAuthorizationSequenceContext *)self->_context authFlowManager];
  [v3 registerIngestionStatusObserver:self];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKClinicalAuthorizationNewRecordsViewController;
  [(OBBaseWelcomeController *)&v5 viewDidAppear:a3];
  objc_super v4 = [(OBTableWelcomeController *)self tableView];
  [v4 flashScrollIndicators];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKClinicalAuthorizationNewRecordsViewController;
  [(HKClinicalAuthorizationNewRecordsViewController *)&v4 viewWillDisappear:a3];
  self->_isWaitingForDoneAction = 0;
  [(HKClinicalAuthorizationNewRecordsViewController *)self _updateDownloadingStatusIndicator];
}

- (void)_configureTableView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  objc_super v4 = objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(OBTableWelcomeController *)self setTableView:v4];

  objc_super v5 = [(OBTableWelcomeController *)self tableView];
  [v5 setDataSource:self];

  uint64_t v6 = [(OBTableWelcomeController *)self tableView];
  [v6 setDelegate:self];

  v7 = [(HKClinicalAuthorizationNewRecordsViewController *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 != 6)
  {
    v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v10 = [(HKClinicalAuthorizationNewRecordsViewController *)self view];
    [v10 setBackgroundColor:v9];

    v11 = [(HKClinicalAuthorizationNewRecordsViewController *)self view];
    v12 = [v11 backgroundColor];
    v13 = [(OBTableWelcomeController *)self tableView];
    [v13 setBackgroundColor:v12];
  }
  id v14 = [(OBTableWelcomeController *)self tableView];
  [v14 registerClass:objc_opt_class() forCellReuseIdentifier:@"AuthorizationModeCellReuseIdentifier"];
}

- (void)_configureNavigationItem
{
  id v9 = [(OBBaseWelcomeController *)self navigationItem];
  [v9 setLargeTitleDisplayMode:2];
  id v3 = (void *)MEMORY[0x1E4FB14A8];
  objc_super v4 = HKHealthRecordsAPILocalizedString(@"BACK_BAR_BUTTON_TITLE");
  objc_super v5 = objc_msgSend(v3, "hk_backButtonWithTitle:", v4);
  [v9 setBackBarButtonItem:v5];

  uint64_t v6 = HKHealthRecordsAPILocalizedString(@"IN_APP_SEQUENCE_TITLE_NEW_RECORDS");
  [v9 setTitle:v6];

  v7 = HKHealthRecordsAPILocalizedString(@"IN_APP_SEQUENCE_TITLE_ACCESSIBILITY_%@");
  [v9 setAccessibilityLabel:v7];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonPressed_];
  [v9 setRightBarButtonItem:v8];
}

- (void)_setUpFooterView
{
  id v3 = [MEMORY[0x1E4F83A80] boldButton];
  doneButton = self->_doneButton;
  self->_doneButton = v3;

  objc_super v5 = self->_doneButton;
  uint64_t v6 = HKHealthRecordsAPILocalizedString(@"NEW_RECORDS_DONE_BUTTON_TITLE");
  [(OBBoldTrayButton *)v5 setTitle:v6 forState:0];

  [(OBBoldTrayButton *)self->_doneButton addTarget:self action:sel__doneButtonPressed_ forControlEvents:64];
  id v7 = [(HKClinicalAuthorizationNewRecordsViewController *)self buttonTray];
  [v7 addButton:self->_doneButton];
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

- (int64_t)_shareAuthorizationModeForIndexPath:(id)a3
{
  id v5 = a3;
  if (![(HKClinicalAuthorizationNewRecordsViewController *)self _indexPathIsValidRow:v5])
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationNewRecordsViewController.m", 144, @"Invalid parameter not satisfying: %@", @"[self _indexPathIsValidRow:indexPath]" object file lineNumber description];
  }
  uint64_t v6 = [v5 row];
  uint64_t v7 = v6;
  if (v6 >= 2)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationNewRecordsViewController.m", 146, @"Invalid parameter not satisfying: %@", @"row < _AuthorizationModeCount" object file lineNumber description];

    if (v7) {
      goto LABEL_5;
    }
LABEL_9:
    int64_t v9 = 1;
    goto LABEL_10;
  }
  if (!v6) {
    goto LABEL_9;
  }
LABEL_5:
  if (v7 != 1)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKClinicalAuthorizationNewRecordsViewController.m", 154, @"Invalid row: %ld", v7);
  }
  int64_t v9 = 0;
LABEL_10:

  return v9;
}

- (id)_indexPathForShareAuthorizationMode:(int64_t)a3
{
  uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 1) {
    uint64_t v3 = 0;
  }
  if (a3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 1;
  }
  return (id)[MEMORY[0x1E4F28D58] indexPathForRow:v4 inSection:0];
}

- (id)_visibleShareAuthorizationModeCellForMode:(int64_t)a3
{
  uint64_t v4 = [(HKClinicalAuthorizationNewRecordsViewController *)self _indexPathForShareAuthorizationMode:a3];
  if (v4)
  {
    id v5 = [(OBTableWelcomeController *)self tableView];
    uint64_t v6 = [v5 cellForRowAtIndexPath:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_shareAuthorizationModeCellForIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(HKClinicalAuthorizationNewRecordsViewController *)self _shareAuthorizationModeForIndexPath:v4];
  uint64_t v6 = [(OBTableWelcomeController *)self tableView];
  uint64_t v7 = [v6 dequeueReusableCellWithIdentifier:@"AuthorizationModeCellReuseIdentifier" forIndexPath:v4];

  if (!v5)
  {
    uint64_t v8 = &unk_1F3C1F2B8;
    int64_t v9 = @"CONTINUOUS_AUTHORIZATION";
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    uint64_t v8 = &unk_1F3C1F2D0;
    int64_t v9 = @"ONE_TIME_AUTHORIZATION";
LABEL_5:
    v10 = HKHealthRecordsAPILocalizedString(v9);
    v11 = HKUIJoinStringsForAutomationIdentifier(v8);
    [v7 setAccessibilityIdentifier:v11];

    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:
  if ([(HKClinicalAuthorizationNewRecordsViewController *)self authorizationMode] == v5) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = 0;
  }
  [v7 setAccessoryType:v12];
  v13 = [v7 textLabel];
  [v13 setText:v10];

  return v7;
}

- (id)_titleForShareAuthorizationModeFooter
{
  int64_t v3 = [(HKClinicalAuthorizationNewRecordsViewController *)self authorizationMode];
  id v4 = [(HKClinicalAuthorizationNewRecordsViewController *)self displayController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__HKClinicalAuthorizationNewRecordsViewController__titleForShareAuthorizationModeFooter__block_invoke;
  v7[3] = &unk_1E6D52BA0;
  v7[4] = self;
  int64_t v5 = [v4 currentTimeTitleForReadAuthorizationModeFooterWithSelectedMode:v3 formatBlock:v7];

  return v5;
}

id __88__HKClinicalAuthorizationNewRecordsViewController__titleForShareAuthorizationModeFooter__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v9 = a4;
  if (a3 == 1)
  {
    id v10 = [NSString alloc];
    v11 = [*(id *)(a1 + 32) context];
    uint64_t v12 = [v11 source];
    v13 = @"NEW_RECORDS_ONE_TIME_AUTHORIZATION_APP_%1$@_DATE_%2$@_CONFIRMATION";
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    id v10 = [NSString alloc];
    v11 = [*(id *)(a1 + 32) context];
    uint64_t v12 = [v11 source];
    v13 = @"NEW_RECORDS_CONTINUOUS_AUTHORIZATION_APP_%1$@_DATE_%2$@_CONFIRMATION";
  }
  id v14 = HKHealthRecordsAPILocalizedStringWithSource(v13, v12);
  uint64_t v15 = [v9 name];
  id v4 = objc_msgSend(v10, "initWithFormat:", v14, v15, v8);

LABEL_6:
  return v4;
}

- (void)_updateShareAuthorizationModeSectionFooter
{
  id v2 = [(OBTableWelcomeController *)self tableView];
  [v2 reloadData];
}

- (void)_doneButtonPressed:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_isCurrentlyIngesting)
  {
    self->_isWaitingForDoneAction = 1;
    [(HKClinicalAuthorizationNewRecordsViewController *)self _updateDownloadingStatusIndicator];
  }
  else
  {
    id v4 = [(HKClinicalAuthorizationNewRecordsViewController *)self context];
    int64_t v5 = [v4 authorizationController];
    objc_msgSend(v5, "commitAllTypesAndUpdateAuthorizationAnchorWithMode:", -[HKClinicalAuthorizationNewRecordsViewController authorizationMode](self, "authorizationMode"));

    [(HKClinicalAuthorizationNewRecordsViewController *)self _finishWithError:0];
  }
}

- (void)_cancelButtonPressed:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 7, @"The user canceled authorization.");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(HKClinicalAuthorizationNewRecordsViewController *)self _finishWithError:v4];
}

- (void)_updateDownloadingStatusIndicator
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  doneButton = self->_doneButton;
  if (self->_isCurrentlyIngesting)
  {
    [(OBBoldTrayButton *)doneButton showsBusyIndicator];
  }
  else
  {
    [(OBBoldTrayButton *)doneButton hidesBusyIndicator];
  }
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  int64_t v5 = (void *)*MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG)) {
    -[HKClinicalAuthorizationYouShouldKnowViewController _finishWithError:](v5);
  }
  uint64_t v6 = [(HKClinicalAuthorizationNewRecordsViewController *)self delegate];
  [v6 promptControllerDidFinish:self error:v4];
}

- (void)_shareAuthorizationModeCellPressed:(id)a3
{
  id v8 = a3;
  id v4 = [(OBTableWelcomeController *)self tableView];
  int64_t v5 = [v4 indexPathForCell:v8];

  int64_t v6 = [(HKClinicalAuthorizationNewRecordsViewController *)self _shareAuthorizationModeForIndexPath:v5];
  if (v6 != [(HKClinicalAuthorizationNewRecordsViewController *)self authorizationMode])
  {
    uint64_t v7 = [(HKClinicalAuthorizationNewRecordsViewController *)self _visibleShareAuthorizationModeCellForMode:[(HKClinicalAuthorizationNewRecordsViewController *)self authorizationMode]];
    [(HKClinicalAuthorizationNewRecordsViewController *)self setAuthorizationMode:v6];
    [v7 setAccessoryType:0];
    [v8 setAccessoryType:3];
    [(HKClinicalAuthorizationNewRecordsViewController *)self _updateShareAuthorizationModeSectionFooter];
  }
}

- (void)ingestionStatusDidChangeTo:(unint64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  self->_isCurrentlyIngesting = a3 == 2;
  if (a3 != 2 && self->_isWaitingForDoneAction)
  {
    self->_isWaitingForDoneAction = 0;
    [(HKClinicalAuthorizationNewRecordsViewController *)self _updateDownloadingStatusIndicator];
    [(HKClinicalAuthorizationNewRecordsViewController *)self _doneButtonPressed:0];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    [v7 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationNewRecordsViewController.m", 293, @"Invalid parameter not satisfying: %@", @"section == 0" object file lineNumber description];
  }
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  if (![(HKClinicalAuthorizationNewRecordsViewController *)self _indexPathIsValidRow:v6])
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationNewRecordsViewController.m", 298, @"Invalid parameter not satisfying: %@", @"[self _indexPathIsValidRow:indexPath]" object file lineNumber description];
  }
  if ([v6 section])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationNewRecordsViewController.m", 299, @"Invalid parameter not satisfying: %@", @"indexPath.section == 0" object file lineNumber description];
  }
  uint64_t v7 = [(HKClinicalAuthorizationNewRecordsViewController *)self _shareAuthorizationModeCellForIndexPath:v6];
  id v8 = objc_msgSend(v7, "hkui_configuredForCHR3rdPartyAPIFlowWhilePrompting:", 1);

  return v8;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    [v7 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationNewRecordsViewController.m", 305, @"Invalid parameter not satisfying: %@", @"section == 0" object file lineNumber description];
  }
  return [(HKClinicalAuthorizationNewRecordsViewController *)self _titleForShareAuthorizationModeFooter];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if ([v7 section])
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationNewRecordsViewController.m", 310, @"Invalid parameter not satisfying: %@", @"indexPath.section == 0" object file lineNumber description];
  }
  id v10 = [v8 cellForRowAtIndexPath:v7];
  [(HKClinicalAuthorizationNewRecordsViewController *)self _shareAuthorizationModeCellPressed:v10];
  [v8 deselectRowAtIndexPath:v7 animated:1];
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
  v10.super_class = (Class)HKClinicalAuthorizationNewRecordsViewController;
  [(HKClinicalAuthorizationNewRecordsViewController *)&v10 traitCollectionDidChange:v4];
  if (v4)
  {
    int64_t v5 = [(HKClinicalAuthorizationNewRecordsViewController *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];
    id v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __76__HKClinicalAuthorizationNewRecordsViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E6D50ED8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __76__HKClinicalAuthorizationNewRecordsViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateForCurrentContentSizeCategory];
}

- (HKClinicalAuthorizationSequenceContext)context
{
  return self->_context;
}

- (HKHealthPrivacyServicePromptControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKHealthPrivacyServicePromptControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HKClinicalAuthorizationDisplayController)displayController
{
  return self->_displayController;
}

- (int64_t)authorizationMode
{
  return self->_authorizationMode;
}

- (void)setAuthorizationMode:(int64_t)a3
{
  self->_authorizationMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
}

@end