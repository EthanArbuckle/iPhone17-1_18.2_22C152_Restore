@interface HKClinicalAuthorizationSettingsViewController
- (BOOL)_cellAtIndexPathIsViewAppPrivacyPolicyCell:(id)a3;
- (BOOL)_isShowingShareAuthorizationModeSection;
- (BOOL)_shouldDisplayAppInformationSection;
- (BOOL)_shouldDisplayShareAuthorizationModeSection;
- (BOOL)_shouldDisplayShareDataTypes;
- (BOOL)_shouldHighlightAppInformationCellAtIndexPath:(id)a3;
- (BOOL)_shouldHighlightViewAppPrivacyPolicyCellAtIndexPath:(id)a3;
- (BOOL)_shouldPresentStopSharingDialogueBeforeDisallowing;
- (BOOL)_tableViewSection:(int64_t)a3 isEqualToSection:(int64_t)a4;
- (BOOL)isPrompting;
- (BOOL)shouldCommitUpdatesImmediately;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (HKClinicalAuthorizationDisplayController)displayController;
- (HKClinicalAuthorizationSequenceContext)context;
- (HKClinicalAuthorizationSettingsViewController)init;
- (HKClinicalAuthorizationSettingsViewController)initWithContext:(id)a3 style:(int64_t)a4;
- (HKClinicalAuthorizationSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HKClinicalAuthorizationSettingsViewController)initWithStyle:(int64_t)a3;
- (HKHealthPrivacyServicePromptControllerDelegate)delegate;
- (HKLookUpAppPrivacyPolicyURLOperation)lookUpAppPrivacyPolicyURLOperation;
- (NSArray)appInformationSectionCells;
- (NSArray)sections;
- (NSString)readUsageDescription;
- (id)_appInformationCellForIndexPath:(id)a3;
- (id)_calculateSections;
- (id)_createAppInformationSectionCells;
- (id)_doNotAllowButtonTitle;
- (id)_formatStringForShareAuthorizationModeFooterWithMode:(int64_t)a3;
- (id)_indexPathForShareAuthorizationMode:(int64_t)a3;
- (id)_indexPathForViewAppPrivacyPolicyCell;
- (id)_messageForStopSharingConfirmation;
- (id)_shareAuthorizationModeCellForIndexPath:(id)a3;
- (id)_shareDataTypeCellForIndexPath:(id)a3;
- (id)_shareUsageDescriptionCellForIndexPath:(id)a3;
- (id)_titleForAppInformationFooter;
- (id)_titleForShareAuthorizationModeFooter;
- (id)_titleForShareDataTypesFooter;
- (id)_typeForIndexPath:(id)a3;
- (id)_viewAppPrivacyPolicyCellForIndexPath:(id)a3;
- (id)_visibleShareAuthorizationModeCellForMode:(int64_t)a3;
- (id)authorizationController;
- (id)footerStringforDate:(id)a3 mode:(int64_t)a4 source:(id)a5;
- (id)source;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)_defaultShareAuthorizationMode;
- (int64_t)_sectionForTableViewSection:(int64_t)a3;
- (int64_t)_shareAuthorizationModeForIndexPath:(id)a3;
- (int64_t)_tableViewSectionForSection:(int64_t)a3;
- (int64_t)authorizationMode;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)style;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_allowButtonPressed:(id)a3;
- (void)_cancelButtonPressed:(id)a3;
- (void)_configureInitialAuthorizationSettingsForPrompting;
- (void)_configureNavigationItemWithSource:(id)a3;
- (void)_configureTableView;
- (void)_displayGuestModeAlertWithCompletion:(id)a3;
- (void)_doNotAllowButtonPressed:(id)a3;
- (void)_fetchPrivacyPolicyURLForSource:(id)a3;
- (void)_finishWithError:(id)a3;
- (void)_hideShareAuthorizationModeSectionIfNeeded;
- (void)_presentConfirmationForStopSharingIfNeededWithAcceptHandler:(id)a3;
- (void)_presentViewAppPrivacyPolicyURLErrorAlert;
- (void)_reloadSections;
- (void)_reloadViewAppPrivacyPolicyCell;
- (void)_setUpFooterView;
- (void)_shareAuthorizationModeCellPressed:(id)a3;
- (void)_showShareAuthorizationModeSectionIfNeeded;
- (void)_updateAllowButtonEnabledStateAnimated:(BOOL)a3;
- (void)_updateFooterButtonsTitles;
- (void)_updateForCurrentContentSizeCategory;
- (void)_updateShareAuthorizationModeSectionFooter;
- (void)_updateShareAuthorizationModeSectionVisibilityIfNeeded;
- (void)_verifySections:(id)a3 isEqualToSections:(id)a4 afterInsertingSection:(id)a5;
- (void)_viewAppPrivacyPolicyCellPressed:(id)a3;
- (void)_workAroundTableHeaderPaddingIssue;
- (void)dealloc;
- (void)reloadAuthorizationSettings;
- (void)setAppInformationSectionCells:(id)a3;
- (void)setAuthorizationMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLookUpAppPrivacyPolicyURLOperation:(id)a3;
- (void)setSections:(id)a3;
- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HKClinicalAuthorizationSettingsViewController

- (HKClinicalAuthorizationSettingsViewController)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalAuthorizationSettingsViewController)initWithStyle:(int64_t)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The -%@ method is not available on %@", v6, objc_opt_class() format];

  return 0;
}

- (HKClinicalAuthorizationSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HKClinicalAuthorizationSettingsViewController)initWithContext:(id)a3 style:(int64_t)a4
{
  id v8 = a3;
  if ((unint64_t)a4 >= 2)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationSettingsViewController.m", 156, @"Invalid parameter not satisfying: %@", @"style == HKAuthorizationSettingsStyleDefault || style == HKAuthorizationSettingsStyleViewServicePrompt" object file lineNumber description];
  }
  else if (a4 == 1)
  {
    v9 = HKHealthRecordsAPILocalizedString(@"CATEGORY_SELECTION_MAIN_TITLE");
    id v10 = [NSString alloc];
    v11 = [v8 source];
    v12 = HKHealthRecordsAPILocalizedStringWithSource(@"APP_%@_ACCESS_REQUEST_AUTH", v11);
    v13 = [v8 source];
    v14 = [v13 name];
    v15 = objc_msgSend(v10, "initWithFormat:", v12, v14);

    v16 = +[HKClinicalAuthorizationFlowManager tableViewHeaderIcon];
    v25.receiver = self;
    v25.super_class = (Class)HKClinicalAuthorizationSettingsViewController;
    v17 = [(OBTableWelcomeController *)&v25 initWithTitle:v9 detailText:v15 icon:v16 adoptTableViewScrollView:1];

    if (!v17) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v24.receiver = self;
  v24.super_class = (Class)HKClinicalAuthorizationSettingsViewController;
  v17 = [(OBTableWelcomeController *)&v24 initWithTitle:&stru_1F3B9CF20 detailText:0 icon:0 adoptTableViewScrollView:1];
  if (v17)
  {
LABEL_7:
    objc_storeStrong((id *)&v17->_context, a3);
    v17->_style = a4;
    [(HKClinicalAuthorizationSettingsViewController *)v17 setShouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen:0];
    v19 = [HKClinicalAuthorizationDisplayController alloc];
    v20 = [v8 authorizationController];
    uint64_t v21 = [(HKClinicalAuthorizationDisplayController *)v19 initWithAuthorizationController:v20];
    displayController = v17->_displayController;
    v17->_displayController = (HKClinicalAuthorizationDisplayController *)v21;
  }
LABEL_8:

  return v17;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HKClinicalAuthorizationSettingsViewController;
  [(OBTableWelcomeController *)&v4 viewDidLoad];
  v3 = [(HKClinicalAuthorizationSettingsViewController *)self source];
  [(HKClinicalAuthorizationSettingsViewController *)self _configureTableView];
  [(HKClinicalAuthorizationSettingsViewController *)self _configureNavigationItemWithSource:v3];
  [(HKClinicalAuthorizationSettingsViewController *)self _setUpFooterView];
  if ([(HKClinicalAuthorizationSettingsViewController *)self isPrompting]) {
    [(HKClinicalAuthorizationSettingsViewController *)self _configureInitialAuthorizationSettingsForPrompting];
  }
  [(HKClinicalAuthorizationSettingsViewController *)self _fetchPrivacyPolicyURLForSource:v3];
  [(HKClinicalAuthorizationSettingsViewController *)self setModalInPresentation:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKClinicalAuthorizationSettingsViewController;
  [(OBTableWelcomeController *)&v5 viewWillAppear:a3];
  [(HKClinicalAuthorizationSettingsViewController *)self reloadAuthorizationSettings];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__HKClinicalAuthorizationSettingsViewController_viewWillAppear___block_invoke;
  block[3] = &unk_1E6D50ED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64__HKClinicalAuthorizationSettingsViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateForCurrentContentSizeCategory];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKClinicalAuthorizationSettingsViewController;
  [(OBBaseWelcomeController *)&v5 viewDidAppear:a3];
  objc_super v4 = [(OBTableWelcomeController *)self tableView];
  [v4 flashScrollIndicators];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)HKClinicalAuthorizationSettingsViewController;
  [(OBTableWelcomeController *)&v4 viewDidLayoutSubviews];
  if ([(HKClinicalAuthorizationSettingsViewController *)self isPrompting])
  {
    [(HKClinicalAuthorizationSettingsViewController *)self _workAroundTableHeaderPaddingIssue];
  }
  else
  {
    v3 = [(OBTableWelcomeController *)self tableView];
    [v3 setTableHeaderView:0];
  }
}

- (void)dealloc
{
  v3 = [(HKClinicalAuthorizationSettingsViewController *)self lookUpAppPrivacyPolicyURLOperation];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)HKClinicalAuthorizationSettingsViewController;
  [(HKClinicalAuthorizationSettingsViewController *)&v4 dealloc];
}

- (void)_reloadSections
{
  v3 = [(HKClinicalAuthorizationSettingsViewController *)self _createAppInformationSectionCells];
  [(HKClinicalAuthorizationSettingsViewController *)self setAppInformationSectionCells:v3];

  id v4 = [(HKClinicalAuthorizationSettingsViewController *)self _calculateSections];
  [(HKClinicalAuthorizationSettingsViewController *)self setSections:v4];
}

- (void)reloadAuthorizationSettings
{
  [(HKClinicalAuthorizationSettingsViewController *)self _reloadSections];
  if ([(HKClinicalAuthorizationSettingsViewController *)self shouldCommitUpdatesImmediately])
  {
    v3 = [(HKClinicalAuthorizationSettingsViewController *)self authorizationController];
    [v3 reload];

    id v4 = [(HKClinicalAuthorizationSettingsViewController *)self authorizationController];
    -[HKClinicalAuthorizationSettingsViewController setAuthorizationMode:](self, "setAuthorizationMode:", [v4 authorizationModeForSource]);
  }
  objc_super v5 = [(OBTableWelcomeController *)self tableView];
  [v5 reloadData];

  [(HKClinicalAuthorizationSettingsViewController *)self _updateFooterButtonsTitles];
  [(HKClinicalAuthorizationSettingsViewController *)self _updateAllowButtonEnabledStateAnimated:0];
}

- (void)_configureNavigationItemWithSource:(id)a3
{
  id v11 = a3;
  id v4 = [(OBBaseWelcomeController *)self navigationItem];
  [v4 setLargeTitleDisplayMode:2];
  if ([(HKClinicalAuthorizationSettingsViewController *)self isPrompting])
  {
    objc_super v5 = (void *)MEMORY[0x1E4FB14A8];
    uint64_t v6 = HKHealthRecordsAPILocalizedString(@"BACK_BAR_BUTTON_TITLE");
    v7 = objc_msgSend(v5, "hk_backButtonWithTitle:", v6);
    [v4 setBackBarButtonItem:v7];

    id v8 = HKHealthRecordsAPILocalizedString(@"IN_APP_SEQUENCE_TITLE_CATEGORIES");
    [v4 setTitle:v8];

    v9 = HKHealthRecordsAPILocalizedString(@"IN_APP_SEQUENCE_TITLE_ACCESSIBILITY_%@");
    [v4 setAccessibilityLabel:v9];

    id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonPressed_];
    [v4 setRightBarButtonItem:v10];
  }
  else
  {
    [v4 setBackBarButtonItem:0];
    [v4 setRightBarButtonItem:0];
    id v10 = [v11 name];
    [v4 setTitle:v10];
  }
}

- (void)_configureInitialAuthorizationSettingsForPrompting
{
  id v4 = [(HKClinicalAuthorizationSettingsViewController *)self authorizationController];

  if (!v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationSettingsViewController.m", 283, @"Invalid parameter not satisfying: %@", @"self.authorizationController != nil" object file lineNumber description];
  }
  if (![(HKClinicalAuthorizationSettingsViewController *)self isPrompting])
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationSettingsViewController.m", 284, @"Invalid parameter not satisfying: %@", @"self.isPrompting" object file lineNumber description];
  }
  int64_t v5 = [(HKClinicalAuthorizationSettingsViewController *)self _defaultShareAuthorizationMode];
  [(HKClinicalAuthorizationSettingsViewController *)self setAuthorizationMode:v5];
}

- (void)_updateFooterButtonsTitles
{
  id v3 = [(HKClinicalAuthorizationSettingsViewController *)self _doNotAllowButtonTitle];
  [(OBLinkTrayButton *)self->_doNotAllowButton setTitle:v3 forState:0];
}

- (void)_updateAllowButtonEnabledStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(HKClinicalAuthorizationSettingsViewController *)self authorizationController];
  int v6 = [v5 anyTypeEnabled];

  LODWORD(v5) = [(OBBoldTrayButton *)self->_allowButton isEnabled];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__HKClinicalAuthorizationSettingsViewController__updateAllowButtonEnabledStateAnimated___block_invoke;
  v11[3] = &unk_1E6D53A88;
  v11[4] = self;
  char v12 = v6;
  v7 = _Block_copy(v11);
  id v8 = v7;
  if (v6 == v5 || !v3)
  {
    (*((void (**)(void *))v7 + 2))(v7);
  }
  else
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1ED8]) initWithDuration:0 curve:v7 animations:0.15];
    [v10 startAnimation];
  }
}

uint64_t __88__HKClinicalAuthorizationSettingsViewController__updateAllowButtonEnabledStateAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1232) setEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_configureTableView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  id v4 = objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(OBTableWelcomeController *)self setTableView:v4];

  int64_t v5 = [(OBTableWelcomeController *)self tableView];
  [v5 setDataSource:self];

  int v6 = [(OBTableWelcomeController *)self tableView];
  [v6 setDelegate:self];

  v7 = [(HKClinicalAuthorizationSettingsViewController *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 != 6)
  {
    if ([(HKClinicalAuthorizationSettingsViewController *)self isPrompting]) {
      [MEMORY[0x1E4FB1618] systemBackgroundColor];
    }
    else {
    v9 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
    }
    id v10 = [(HKClinicalAuthorizationSettingsViewController *)self view];
    [v10 setBackgroundColor:v9];

    id v11 = [(HKClinicalAuthorizationSettingsViewController *)self view];
    char v12 = [v11 backgroundColor];
    v13 = [(OBTableWelcomeController *)self tableView];
    [v13 setBackgroundColor:v12];
  }
  v14 = [(OBTableWelcomeController *)self tableView];
  [v14 registerClass:objc_opt_class() forCellReuseIdentifier:@"AuthorizationModeCellReuseIdentifier"];

  v15 = [(OBTableWelcomeController *)self tableView];
  [v15 registerClass:objc_opt_class() forCellReuseIdentifier:@"AuthorizationSettingsCellReuseIdentifier"];

  v16 = [(OBTableWelcomeController *)self tableView];
  [v16 registerClass:objc_opt_class() forCellReuseIdentifier:@"ShareUsageDescriptionCellReuseIdentifier"];

  id v17 = [(OBTableWelcomeController *)self tableView];
  [v17 registerClass:objc_opt_class() forCellReuseIdentifier:@"ViewAppPrivacyPolicyCellReuseIdentifier"];
}

- (void)_workAroundTableHeaderPaddingIssue
{
  id v3 = [(OBTableWelcomeController *)self tableView];
  id v4 = [v3 tableHeaderView];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  id v14 = [(OBTableWelcomeController *)self tableView];
  v13 = [v14 tableHeaderView];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12 + -30.0);
}

- (void)_setUpFooterView
{
  if (self->_style)
  {
    id v3 = [MEMORY[0x1E4F83A80] boldButton];
    allowButton = self->_allowButton;
    self->_allowButton = v3;

    double v5 = self->_allowButton;
    double v6 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [(OBBoldTrayButton *)v5 setTintColor:v6];

    double v7 = self->_allowButton;
    double v8 = HKHealthRecordsAPILocalizedString(@"SHARE_BUTTON_TITLE");
    [(OBBoldTrayButton *)v7 setTitle:v8 forState:0];

    [(OBBoldTrayButton *)self->_allowButton addTarget:self action:sel__allowButtonPressed_ forControlEvents:64];
    double v9 = [(HKClinicalAuthorizationSettingsViewController *)self buttonTray];
    [v9 addButton:self->_allowButton];

    double v10 = [MEMORY[0x1E4F83AB8] linkButton];
    doNotAllowButton = self->_doNotAllowButton;
    self->_doNotAllowButton = v10;

    double v12 = self->_doNotAllowButton;
    v13 = HKHealthRecordsAPILocalizedString(@"DO_NOT_ALLOW_BUTTON_TITLE_UNDETERMINED");
    [(OBLinkTrayButton *)v12 setTitle:v13 forState:0];

    [(OBLinkTrayButton *)self->_doNotAllowButton addTarget:self action:sel__doNotAllowButtonPressed_ forControlEvents:64];
    id v14 = [(HKClinicalAuthorizationSettingsViewController *)self buttonTray];
    [v14 addButton:self->_doNotAllowButton];
  }
}

- (id)_typeForIndexPath:(id)a3
{
  id v4 = a3;
  if (-[HKClinicalAuthorizationSettingsViewController _sectionForTableViewSection:](self, "_sectionForTableViewSection:", [v4 section]) == 1)
  {
    double v5 = [(HKClinicalAuthorizationSettingsViewController *)self authorizationController];
    double v6 = [v5 orderedTypesForReading];
    double v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (BOOL)_tableViewSection:(int64_t)a3 isEqualToSection:(int64_t)a4
{
  return [(HKClinicalAuthorizationSettingsViewController *)self _sectionForTableViewSection:a3] == a4;
}

- (int64_t)_sectionForTableViewSection:(int64_t)a3
{
  id v4 = [(HKClinicalAuthorizationSettingsViewController *)self sections];
  double v5 = [v4 objectAtIndexedSubscript:a3];
  int64_t v6 = [v5 integerValue];

  return v6;
}

- (int64_t)_tableViewSectionForSection:(int64_t)a3
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  id v4 = [(HKClinicalAuthorizationSettingsViewController *)self sections];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__HKClinicalAuthorizationSettingsViewController__tableViewSectionForSection___block_invoke;
  v7[3] = &unk_1E6D543F0;
  v7[4] = &v8;
  v7[5] = a3;
  [v4 enumerateObjectsUsingBlock:v7];

  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __77__HKClinicalAuthorizationSettingsViewController__tableViewSectionForSection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 integerValue];
  if (result == *(void *)(a1 + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)_createAppInformationSectionCells
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(HKClinicalAuthorizationSettingsViewController *)self readUsageDescription];
  uint64_t v5 = [v4 length];

  if (v5) {
    [v3 addObject:&unk_1F3C21D90];
  }
  uint64_t v6 = [(HKClinicalAuthorizationSettingsViewController *)self lookUpAppPrivacyPolicyURLOperation];
  if (v6)
  {
    double v7 = (void *)v6;
    uint64_t v8 = [(HKClinicalAuthorizationSettingsViewController *)self source];

    if (v8) {
      [v3 addObject:&unk_1F3C21DA8];
    }
  }
  return v3;
}

- (id)_calculateSections
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(HKClinicalAuthorizationSettingsViewController *)self _shouldDisplayAppInformationSection])
  {
    [v3 addObject:&unk_1F3C21D90];
  }
  if ([(HKClinicalAuthorizationSettingsViewController *)self _shouldDisplayShareDataTypes])
  {
    [v3 addObject:&unk_1F3C21DA8];
  }
  if ([(HKClinicalAuthorizationSettingsViewController *)self _shouldDisplayShareAuthorizationModeSection])
  {
    [v3 addObject:&unk_1F3C21DC0];
  }
  return v3;
}

- (BOOL)_shouldDisplayAppInformationSection
{
  v2 = [(HKClinicalAuthorizationSettingsViewController *)self appInformationSectionCells];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)_shouldDisplayShareDataTypes
{
  v2 = [(HKClinicalAuthorizationSettingsViewController *)self authorizationController];
  BOOL v3 = [v2 orderedTypesForReading];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)_shouldDisplayShareAuthorizationModeSection
{
  if ([(HKClinicalAuthorizationSettingsViewController *)self isPrompting]
    || ![(HKClinicalAuthorizationSettingsViewController *)self _shouldDisplayShareDataTypes])
  {
    return 0;
  }
  BOOL v3 = [(HKClinicalAuthorizationSettingsViewController *)self authorizationController];
  char v4 = [v3 anyTypeEnabled];

  return v4;
}

- (void)_allowButtonPressed:(id)a3
{
  if (![(HKClinicalAuthorizationSettingsViewController *)self isPrompting])
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationSettingsViewController.m", 460, @"Invalid parameter not satisfying: %@", @"self.isPrompting" object file lineNumber description];
  }
  uint64_t v5 = [HKClinicalAuthorizationNewRecordsViewController alloc];
  uint64_t v6 = [(HKClinicalAuthorizationSettingsViewController *)self context];
  uint64_t v10 = [(HKClinicalAuthorizationNewRecordsViewController *)v5 initWithContext:v6];

  double v7 = [(HKClinicalAuthorizationSettingsViewController *)self delegate];
  [(HKClinicalAuthorizationNewRecordsViewController *)v10 setDelegate:v7];

  uint64_t v8 = [(HKClinicalAuthorizationSettingsViewController *)self navigationController];
  [v8 pushViewController:v10 animated:1];
}

- (void)_shareAuthorizationModeCellPressed:(id)a3
{
  id v9 = a3;
  char v4 = [(OBTableWelcomeController *)self tableView];
  uint64_t v5 = [v4 indexPathForCell:v9];

  int64_t v6 = [(HKClinicalAuthorizationSettingsViewController *)self _shareAuthorizationModeForIndexPath:v5];
  if (v6 != [(HKClinicalAuthorizationSettingsViewController *)self authorizationMode])
  {
    double v7 = [(HKClinicalAuthorizationSettingsViewController *)self _visibleShareAuthorizationModeCellForMode:[(HKClinicalAuthorizationSettingsViewController *)self authorizationMode]];
    [(HKClinicalAuthorizationSettingsViewController *)self setAuthorizationMode:v6];
    [v7 setAccessoryType:0];
    [v9 setAccessoryType:3];
    if ([(HKClinicalAuthorizationSettingsViewController *)self shouldCommitUpdatesImmediately])
    {
      uint64_t v8 = [(HKClinicalAuthorizationSettingsViewController *)self authorizationController];
      objc_msgSend(v8, "commitAllTypesAndUpdateAuthorizationAnchorWithMode:", -[HKClinicalAuthorizationSettingsViewController authorizationMode](self, "authorizationMode"));
    }
    [(HKClinicalAuthorizationSettingsViewController *)self _updateShareAuthorizationModeSectionFooter];
  }
}

- (void)_doNotAllowButtonPressed:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__HKClinicalAuthorizationSettingsViewController__doNotAllowButtonPressed___block_invoke;
  v3[3] = &unk_1E6D50ED8;
  v3[4] = self;
  [(HKClinicalAuthorizationSettingsViewController *)self _presentConfirmationForStopSharingIfNeededWithAcceptHandler:v3];
}

void __74__HKClinicalAuthorizationSettingsViewController__doNotAllowButtonPressed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) authorizationController];
  [v2 setEnabledForAllTypes:0];
  [v2 commitAllTypesAndUpdateAuthorizationAnchorWithMode:1];
  [*(id *)(a1 + 32) _finishWithError:0];
}

- (void)_viewAppPrivacyPolicyCellPressed:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HKClinicalAuthorizationSettingsViewController *)self lookUpAppPrivacyPolicyURLOperation];
  int64_t v6 = [v5 privacyPolicyURL];

  if (v6 && (objc_msgSend(v6, "hk_isValidSafariViewControllerURL") & 1) != 0)
  {
    _HKInitializeLogging();
    double v7 = (void *)*MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v7;
      id v9 = HKSensitiveLogItem();
      int v12 = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1E0B26000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ opening privacy policy URL %{public}@ in Safari view", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F3AEB8]) initWithURL:v6];
    uint64_t v11 = [v10 popoverPresentationController];
    [v11 setSourceView:v4];

    [v10 setDismissButtonStyle:0];
    [(UIViewController *)self hk_presentModalCardViewController:v10 fullScreen:1 animated:1 completion:0];
  }
  else
  {
    [(HKClinicalAuthorizationSettingsViewController *)self _presentViewAppPrivacyPolicyURLErrorAlert];
  }
}

- (void)_presentViewAppPrivacyPolicyURLErrorAlert
{
  BOOL v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = [(HKClinicalAuthorizationSettingsViewController *)self context];
  uint64_t v5 = [v4 source];
  int64_t v6 = HKHealthRecordsAPILocalizedStringWithSource(@"VIEW_APP_PRIVACY_POLICY_URL_ERROR_TRY_LATER", v5);
  id v12 = [v3 alertControllerWithTitle:0 message:v6 preferredStyle:1];

  double v7 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v8 = [(HKClinicalAuthorizationSettingsViewController *)self context];
  id v9 = [v8 source];
  uint64_t v10 = HKHealthRecordsAPILocalizedStringWithSource(@"VIEW_APP_PRIVACY_POLICY_URL_ERROR_OK_BUTTON", v9);
  uint64_t v11 = [v7 actionWithTitle:v10 style:0 handler:0];

  [v12 addAction:v11];
  [(HKClinicalAuthorizationSettingsViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)_cancelButtonPressed:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 7, @"The user canceled authorization.");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(HKClinicalAuthorizationSettingsViewController *)self _finishWithError:v4];
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  if ([(HKClinicalAuthorizationSettingsViewController *)self isPrompting])
  {
    _HKInitializeLogging();
    uint64_t v5 = (void *)*MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG)) {
      -[HKClinicalAuthorizationYouShouldKnowViewController _finishWithError:](v5);
    }
    int64_t v6 = [(HKClinicalAuthorizationSettingsViewController *)self delegate];
    [v6 promptControllerDidFinish:self error:v4];
  }
}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  uint64_t v8 = [(OBTableWelcomeController *)self tableView];
  id v16 = [v8 indexPathForCell:v7];

  id v9 = [(HKClinicalAuthorizationSettingsViewController *)self _typeForIndexPath:v16];
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"HKClinicalAuthorizationSettingsViewController.m" lineNumber:551 description:@"Unable to determine object type for switch cell"];
  }
  uint64_t v10 = [(HKClinicalAuthorizationSettingsViewController *)self authorizationController];
  uint64_t v11 = v10;
  if (v4) {
    char v12 = [v10 anyTypeEnabled];
  }
  else {
    char v12 = 1;
  }
  v13 = [(HKClinicalAuthorizationSettingsViewController *)self authorizationController];
  objc_msgSend(v13, "setEnabled:forType:commit:", v4, v9, -[HKClinicalAuthorizationSettingsViewController shouldCommitUpdatesImmediately](self, "shouldCommitUpdatesImmediately"));

  if ([(HKClinicalAuthorizationSettingsViewController *)self shouldCommitUpdatesImmediately]&& (v12 & 1) == 0)
  {
    int64_t v14 = [(HKClinicalAuthorizationSettingsViewController *)self _defaultShareAuthorizationMode];
    [(HKClinicalAuthorizationSettingsViewController *)self setAuthorizationMode:v14];
    [v11 commitAllTypesAndUpdateAuthorizationAnchorWithMode:v14];
  }
  [(HKClinicalAuthorizationSettingsViewController *)self _updateAllowButtonEnabledStateAnimated:1];
  [(HKClinicalAuthorizationSettingsViewController *)self _updateShareAuthorizationModeSectionVisibilityIfNeeded];
}

- (int64_t)_defaultShareAuthorizationMode
{
  return 1;
}

- (BOOL)_isShowingShareAuthorizationModeSection
{
  id v2 = [(HKClinicalAuthorizationSettingsViewController *)self sections];
  char v3 = [v2 containsObject:&unk_1F3C21DC0];

  return v3;
}

- (void)_showShareAuthorizationModeSectionIfNeeded
{
  if (![(HKClinicalAuthorizationSettingsViewController *)self _isShowingShareAuthorizationModeSection]&& [(HKClinicalAuthorizationSettingsViewController *)self _shouldDisplayShareAuthorizationModeSection])
  {
    id v7 = [(HKClinicalAuthorizationSettingsViewController *)self sections];
    [(HKClinicalAuthorizationSettingsViewController *)self _reloadSections];
    char v3 = [(HKClinicalAuthorizationSettingsViewController *)self sections];
    [(HKClinicalAuthorizationSettingsViewController *)self _verifySections:v7 isEqualToSections:v3 afterInsertingSection:&unk_1F3C21DC0];
    uint64_t v4 = [v3 indexOfObject:&unk_1F3C21DC0];
    uint64_t v5 = [(OBTableWelcomeController *)self tableView];
    int64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:v4];
    [v5 insertSections:v6 withRowAnimation:0];
  }
}

- (void)_hideShareAuthorizationModeSectionIfNeeded
{
  if ([(HKClinicalAuthorizationSettingsViewController *)self _isShowingShareAuthorizationModeSection]&& ![(HKClinicalAuthorizationSettingsViewController *)self _shouldDisplayShareAuthorizationModeSection])
  {
    id v7 = [(HKClinicalAuthorizationSettingsViewController *)self sections];
    [(HKClinicalAuthorizationSettingsViewController *)self _reloadSections];
    char v3 = [(HKClinicalAuthorizationSettingsViewController *)self sections];
    [(HKClinicalAuthorizationSettingsViewController *)self _verifySections:v3 isEqualToSections:v7 afterInsertingSection:&unk_1F3C21DC0];
    uint64_t v4 = [v7 indexOfObject:&unk_1F3C21DC0];
    uint64_t v5 = [(OBTableWelcomeController *)self tableView];
    int64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:v4];
    [v5 deleteSections:v6 withRowAnimation:0];
  }
}

- (void)_updateShareAuthorizationModeSectionVisibilityIfNeeded
{
  [(HKClinicalAuthorizationSettingsViewController *)self _showShareAuthorizationModeSectionIfNeeded];
  [(HKClinicalAuthorizationSettingsViewController *)self _hideShareAuthorizationModeSectionIfNeeded];
}

- (void)_updateShareAuthorizationModeSectionFooter
{
  if ([(HKClinicalAuthorizationSettingsViewController *)self _tableViewSectionForSection:2] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = [(OBTableWelcomeController *)self tableView];
    [v3 reloadData];
  }
}

- (void)_verifySections:(id)a3 isEqualToSections:(id)a4 afterInsertingSection:(id)a5
{
  id v20 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v20 containsObject:v10])
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationSettingsViewController.m", 632, @"Attempting to insert section %@, but section already exists", v10 object file lineNumber description];
  }
  if (([v9 containsObject:v10] & 1) == 0)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationSettingsViewController.m", 633, @"Attempting to insert section %@, but no such section found after update", v10 object file lineNumber description];
  }
  if ((objc_msgSend(v20, "hk_allElementsUnique") & 1) == 0)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationSettingsViewController.m", 634, @"Duplicate sections in %@", v20 object file lineNumber description];
  }
  if ((objc_msgSend(v9, "hk_allElementsUnique") & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationSettingsViewController.m", 635, @"Duplicate sections in %@", v9 object file lineNumber description];
  }
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v20];
  char v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v9];
  v13 = [v11 setByAddingObject:v10];
  char v14 = [v13 isEqualToSet:v12];

  if ((v14 & 1) == 0)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationSettingsViewController.m", 640, @"Mismatch between pre-insert sections %@ and post-insert sections %@ when inserting %@", v20, v9, v10 object file lineNumber description];
  }
}

- (BOOL)_shouldHighlightAppInformationCellAtIndexPath:(id)a3
{
  id v5 = a3;
  if (!-[HKClinicalAuthorizationSettingsViewController _tableViewSection:isEqualToSection:](self, "_tableViewSection:isEqualToSection:", [v5 section], 0))
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationSettingsViewController.m", 646, @"Invalid parameter not satisfying: %@", @"[self _tableViewSection:indexPath.section isEqualToSection:_SectionAppInformation]" object file lineNumber description];
  }
  if ([(HKClinicalAuthorizationSettingsViewController *)self _cellAtIndexPathIsViewAppPrivacyPolicyCell:v5])
  {
    BOOL v6 = [(HKClinicalAuthorizationSettingsViewController *)self _shouldHighlightViewAppPrivacyPolicyCellAtIndexPath:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_appInformationCellForIndexPath:(id)a3
{
  id v5 = a3;
  if (!-[HKClinicalAuthorizationSettingsViewController _tableViewSection:isEqualToSection:](self, "_tableViewSection:isEqualToSection:", [v5 section], 0))
  {
    char v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationSettingsViewController.m", 653, @"Invalid parameter not satisfying: %@", @"[self _tableViewSection:indexPath.section isEqualToSection:_SectionAppInformation]" object file lineNumber description];
  }
  unint64_t v6 = [v5 row];
  id v7 = [(HKClinicalAuthorizationSettingsViewController *)self appInformationSectionCells];
  if (v6 >= [v7 count])
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationSettingsViewController.m", 656, @"Invalid parameter not satisfying: %@", @"row < appInformationSectionCells.count" object file lineNumber description];
  }
  uint64_t v8 = [v7 objectAtIndexedSubscript:v6];
  uint64_t v9 = [v8 integerValue];

  if (v9 == 1)
  {
    uint64_t v10 = [(HKClinicalAuthorizationSettingsViewController *)self _viewAppPrivacyPolicyCellForIndexPath:v5];
  }
  else
  {
    if (v9) {
      goto LABEL_10;
    }
    uint64_t v10 = [(HKClinicalAuthorizationSettingsViewController *)self _shareUsageDescriptionCellForIndexPath:v5];
  }
  uint64_t v8 = (void *)v10;
LABEL_10:

  return v8;
}

- (id)_shareUsageDescriptionCellForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(OBTableWelcomeController *)self tableView];
  unint64_t v6 = [v5 dequeueReusableCellWithIdentifier:@"ShareUsageDescriptionCellReuseIdentifier" forIndexPath:v4];

  id v7 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1F4C8);
  [v6 setAccessibilityIdentifier:v7];

  uint64_t v8 = [v6 textLabel];
  uint64_t v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v8 setFont:v9];

  [v8 setNumberOfLines:0];
  uint64_t v10 = [(HKClinicalAuthorizationSettingsViewController *)self readUsageDescription];
  [v8 setText:v10];

  return v6;
}

- (id)_indexPathForViewAppPrivacyPolicyCell
{
  int64_t v3 = [(HKClinicalAuthorizationSettingsViewController *)self _tableViewSectionForSection:0];
  id v4 = 0;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [(HKClinicalAuthorizationSettingsViewController *)self appInformationSectionCells];
    uint64_t v6 = [v5 indexOfObject:&unk_1F3C21DA8];

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v4 = 0;
    }
    else
    {
      id v4 = [MEMORY[0x1E4F28D58] indexPathForRow:v6 inSection:v3];
    }
  }
  return v4;
}

- (BOOL)_cellAtIndexPathIsViewAppPrivacyPolicyCell:(id)a3
{
  id v4 = a3;
  id v5 = [(HKClinicalAuthorizationSettingsViewController *)self _indexPathForViewAppPrivacyPolicyCell];
  char v6 = [v4 isEqual:v5];

  return v6;
}

- (BOOL)_shouldHighlightViewAppPrivacyPolicyCellAtIndexPath:(id)a3
{
  if (![(HKClinicalAuthorizationSettingsViewController *)self _cellAtIndexPathIsViewAppPrivacyPolicyCell:a3])
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationSettingsViewController.m", 698, @"Invalid parameter not satisfying: %@", @"[self _cellAtIndexPathIsViewAppPrivacyPolicyCell:indexPath]" object file lineNumber description];
  }
  return 1;
}

- (id)_viewAppPrivacyPolicyCellForIndexPath:(id)a3
{
  id v5 = a3;
  char v6 = [(HKClinicalAuthorizationSettingsViewController *)self source];
  uint64_t v7 = [(HKClinicalAuthorizationSettingsViewController *)self lookUpAppPrivacyPolicyURLOperation];
  uint64_t v8 = (void *)v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationSettingsViewController.m", 706, @"Invalid parameter not satisfying: %@", @"source != nil" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  id v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationSettingsViewController.m", 707, @"Invalid parameter not satisfying: %@", @"operation != nil" object file lineNumber description];

LABEL_3:
  uint64_t v9 = [(OBTableWelcomeController *)self tableView];
  uint64_t v10 = [v9 dequeueReusableCellWithIdentifier:@"ViewAppPrivacyPolicyCellReuseIdentifier" forIndexPath:v5];

  uint64_t v11 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1F4E0);
  [v10 setAccessibilityIdentifier:v11];

  char v12 = [v10 textLabel];
  [v12 setNumberOfLines:0];
  id v13 = [NSString alloc];
  char v14 = HKHealthRecordsAPILocalizedStringWithSource(@"VIEW_APP_%@_PRIVACY_POLICY_BUTTON_TITLE", v6);
  v15 = [v6 name];
  id v16 = objc_msgSend(v13, "initWithFormat:", v14, v15);
  [v12 setText:v16];

  id v17 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_appKeyColor");
  [v12 setTextColor:v17];

  return v10;
}

- (id)_shareDataTypeCellForIndexPath:(id)a3
{
  id v5 = a3;
  if (!-[HKClinicalAuthorizationSettingsViewController _tableViewSection:isEqualToSection:](self, "_tableViewSection:isEqualToSection:", [v5 section], 1))
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationSettingsViewController.m", 724, @"Invalid parameter not satisfying: %@", @"[self _tableViewSection:indexPath.section isEqualToSection:_SectionShareDataTypes]" object file lineNumber description];
  }
  char v6 = [(OBTableWelcomeController *)self tableView];
  uint64_t v7 = [v6 dequeueReusableCellWithIdentifier:@"AuthorizationSettingsCellReuseIdentifier" forIndexPath:v5];

  [v7 setAdjustsFontSizeToFitWidth:1];
  [v7 setCentersIcon:1];
  [v7 setDelegate:self];
  uint64_t v8 = [(HKClinicalAuthorizationSettingsViewController *)self _typeForIndexPath:v5];

  if (!v8)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"HKClinicalAuthorizationSettingsViewController.m" lineNumber:733 description:@"Missing object type"];
  }
  uint64_t v9 = [(HKClinicalAuthorizationSequenceContext *)self->_context authorizationController];
  uint64_t v10 = [v9 healthStore];
  uint64_t v11 = +[HKDisplayTypeController sharedInstanceForHealthStore:v10];
  char v12 = [v11 displayTypeForObjectTypeUnifyingBloodPressureTypes:v8];

  id v13 = [v12 localization];
  char v14 = [v13 displayName];
  [v7 setDisplayText:v14];

  v15 = [v12 listIcon];
  id v16 = objc_msgSend(v15, "imageByPreparingThumbnailOfSize:", 29.0, 29.0);
  [v7 setIconImage:v16];

  id v17 = [v12 displayCategory];
  v18 = [v17 color];
  v19 = [v7 imageView];
  [v19 setTintColor:v18];

  id v20 = [(HKClinicalAuthorizationSettingsViewController *)self authorizationController];
  objc_msgSend(v7, "setOn:", objc_msgSend(v20, "isTypeEnabled:", v8));

  objc_msgSend(v7, "setSeparatorInset:", 0.0, 59.0, 0.0, 0.0);
  return v7;
}

- (int64_t)_shareAuthorizationModeForIndexPath:(id)a3
{
  id v5 = a3;
  if (!-[HKClinicalAuthorizationSettingsViewController _tableViewSection:isEqualToSection:](self, "_tableViewSection:isEqualToSection:", [v5 section], 2))
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationSettingsViewController.m", 779, @"Invalid parameter not satisfying: %@", @"[self _tableViewSection:indexPath.section isEqualToSection:_SectionShareAuthorizationMode]" object file lineNumber description];
  }
  uint64_t v6 = [v5 row];
  uint64_t v7 = v6;
  if (v6 >= 2)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationSettingsViewController.m", 781, @"Invalid parameter not satisfying: %@", @"row < _AuthorizationModeCount" object file lineNumber description];

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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKClinicalAuthorizationSettingsViewController.m", 789, @"Invalid row: %ld", v7);
  }
  int64_t v9 = 0;
LABEL_10:

  return v9;
}

- (id)_indexPathForShareAuthorizationMode:(int64_t)a3
{
  int64_t v4 = [(HKClinicalAuthorizationSettingsViewController *)self _tableViewSectionForSection:2];
  uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 0;
  }
  else
  {
    if (a3 == 1) {
      uint64_t v5 = 0;
    }
    if (a3) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = 1;
    }
    uint64_t v6 = [MEMORY[0x1E4F28D58] indexPathForRow:v7 inSection:v4];
  }
  return v6;
}

- (id)_shareAuthorizationModeCellForIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(HKClinicalAuthorizationSettingsViewController *)self _shareAuthorizationModeForIndexPath:v4];
  uint64_t v6 = [(OBTableWelcomeController *)self tableView];
  uint64_t v7 = [v6 dequeueReusableCellWithIdentifier:@"AuthorizationModeCellReuseIdentifier" forIndexPath:v4];

  if (!v5)
  {
    uint64_t v8 = @"CONTINUOUS_AUTHORIZATION";
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    uint64_t v8 = @"ONE_TIME_AUTHORIZATION";
LABEL_5:
    int64_t v9 = HKHealthRecordsAPILocalizedString(v8);
    goto LABEL_7;
  }
  int64_t v9 = 0;
LABEL_7:
  if ([(HKClinicalAuthorizationSettingsViewController *)self authorizationMode] == v5) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 0;
  }
  [v7 setAccessoryType:v10];
  uint64_t v11 = [v7 textLabel];
  [v11 setText:v9];

  return v7;
}

- (id)_visibleShareAuthorizationModeCellForMode:(int64_t)a3
{
  id v4 = [(HKClinicalAuthorizationSettingsViewController *)self _indexPathForShareAuthorizationMode:a3];
  if (v4)
  {
    int64_t v5 = [(OBTableWelcomeController *)self tableView];
    uint64_t v6 = [v5 cellForRowAtIndexPath:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_titleForAppInformationFooter
{
  id v2 = [(HKClinicalAuthorizationSettingsViewController *)self context];
  int64_t v3 = [v2 source];
  id v4 = HKHealthRecordsAPILocalizedStringWithSource(@"VIEW_APP_PRIVACY_POLICY_FOOTER", v3);

  return v4;
}

- (id)_titleForShareDataTypesFooter
{
  if ([(HKClinicalAuthorizationSettingsViewController *)self isPrompting])
  {
    int64_t v3 = [(HKClinicalAuthorizationSettingsViewController *)self displayController];
    id v4 = [v3 currentTimeDisplayStringForReadAuthorizationFooter];

    id v5 = [NSString alloc];
    uint64_t v6 = [(HKClinicalAuthorizationSettingsViewController *)self context];
    uint64_t v7 = [v6 source];
    uint64_t v8 = HKHealthRecordsAPILocalizedStringWithSource(@"SHARE_DATA_WITH_APP_%@_DATE_%@_PROMPT_EXPLANATION", v7);
    int64_t v9 = [(HKClinicalAuthorizationSettingsViewController *)self source];
    uint64_t v10 = [v9 name];
    uint64_t v11 = objc_msgSend(v5, "initWithFormat:", v8, v10, v4);
  }
  else
  {
    id v12 = [NSString alloc];
    id v4 = [(HKClinicalAuthorizationSettingsViewController *)self context];
    uint64_t v6 = [v4 source];
    uint64_t v7 = HKHealthRecordsAPILocalizedStringWithSource(@"SHARE_DATA_WITH_APP_%@_INFORMER", v6);
    uint64_t v8 = [(HKClinicalAuthorizationSettingsViewController *)self source];
    int64_t v9 = [v8 name];
    uint64_t v11 = objc_msgSend(v12, "initWithFormat:", v7, v9);
  }

  return v11;
}

- (id)_formatStringForShareAuthorizationModeFooterWithMode:(int64_t)a3
{
  if (a3 == 1)
  {
    id v4 = [(HKClinicalAuthorizationSettingsViewController *)self context];
    id v5 = [v4 source];
    uint64_t v6 = @"DETERMINED_RECORDS_ONE_TIME_AUTHORIZATION_APP_%1$@_DATE_%2$@_CONFIRMATION";
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    id v4 = [(HKClinicalAuthorizationSettingsViewController *)self context];
    id v5 = [v4 source];
    uint64_t v6 = @"DETERMINED_RECORDS_CONTINUOUS_AUTHORIZATION_APP_%1$@_DATE_%2$@_CONFIRMATION";
  }
  int64_t v3 = HKHealthRecordsAPILocalizedStringWithSource(v6, v5);

LABEL_6:
  return v3;
}

- (id)footerStringforDate:(id)a3 mode:(int64_t)a4 source:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (a4 == 1)
  {
    id v11 = [NSString alloc];
    id v12 = [(HKClinicalAuthorizationSettingsViewController *)self context];
    id v13 = [v12 source];
    char v14 = @"DETERMINED_RECORDS_ONE_TIME_AUTHORIZATION_APP_%1$@_DATE_%2$@_CONFIRMATION";
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    id v11 = [NSString alloc];
    id v12 = [(HKClinicalAuthorizationSettingsViewController *)self context];
    id v13 = [v12 source];
    char v14 = @"DETERMINED_RECORDS_CONTINUOUS_AUTHORIZATION_APP_%1$@_DATE_%2$@_CONFIRMATION";
  }
  v15 = HKHealthRecordsAPILocalizedStringWithSource(v14, v13);
  id v16 = [v10 name];
  id v5 = objc_msgSend(v11, "initWithFormat:", v15, v16, v9);

LABEL_6:
  return v5;
}

- (id)_titleForShareAuthorizationModeFooter
{
  int64_t v3 = [(HKClinicalAuthorizationSettingsViewController *)self authorizationMode];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__HKClinicalAuthorizationSettingsViewController__titleForShareAuthorizationModeFooter__block_invoke;
  aBlock[3] = &unk_1E6D52BA0;
  aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  BOOL v5 = [(HKClinicalAuthorizationSettingsViewController *)self isPrompting];
  uint64_t v6 = [(HKClinicalAuthorizationSettingsViewController *)self displayController];
  uint64_t v7 = v6;
  if (v5) {
    [v6 currentTimeTitleForReadAuthorizationModeFooterWithSelectedMode:v3 formatBlock:v4];
  }
  else {
  uint64_t v8 = [v6 committedTitleForReadAuthorizationModeFooterWithSelectedMode:v3 formatBlock:v4];
  }

  return v8;
}

uint64_t __86__HKClinicalAuthorizationSettingsViewController__titleForShareAuthorizationModeFooter__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) footerStringforDate:a2 mode:a3 source:a4];
}

- (void)_displayGuestModeAlertWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4FB1418];
  BOOL v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v6 = [v5 localizedStringForKey:@"GUEST_MODE_CHANGE_AUTHORIZATION_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v8 = [v7 localizedStringForKey:@"GUEST_MODE_CHANGE_AUTHORIZATION_DESCRIPTION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  id v9 = [v4 alertControllerWithTitle:v6 message:v8 preferredStyle:1];

  id v10 = (void *)MEMORY[0x1E4FB1410];
  id v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v12 = [v11 localizedStringForKey:@"SHARE_ALERT_OK" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__HKClinicalAuthorizationSettingsViewController__displayGuestModeAlertWithCompletion___block_invoke;
  v16[3] = &unk_1E6D53958;
  id v17 = v3;
  id v13 = v3;
  char v14 = [v10 actionWithTitle:v12 style:0 handler:v16];

  [v9 addAction:v14];
  [(HKClinicalAuthorizationSettingsViewController *)self presentViewController:v9 animated:1 completion:0];
}

uint64_t __86__HKClinicalAuthorizationSettingsViewController__displayGuestModeAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_doNotAllowButtonTitle
{
  if ([(HKClinicalAuthorizationSettingsViewController *)self _shouldPresentStopSharingDialogueBeforeDisallowing])
  {
    id v2 = @"DO_NOT_ALLOW_BUTTON_TITLE_DETERMINED";
  }
  else
  {
    id v2 = @"DO_NOT_ALLOW_BUTTON_TITLE_UNDETERMINED";
  }
  id v3 = HKHealthRecordsAPILocalizedString(v2);
  return v3;
}

- (BOOL)_shouldPresentStopSharingDialogueBeforeDisallowing
{
  id v2 = [(HKClinicalAuthorizationSettingsViewController *)self authorizationController];
  char v3 = [v2 anyDeterminedTypeAllowsReading];

  return v3;
}

- (void)_presentConfirmationForStopSharingIfNeededWithAcceptHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(HKClinicalAuthorizationSettingsViewController *)self _shouldPresentStopSharingDialogueBeforeDisallowing])
  {
    BOOL v5 = (void *)MEMORY[0x1E4FB1418];
    uint64_t v6 = [(HKClinicalAuthorizationSettingsViewController *)self _messageForStopSharingConfirmation];
    uint64_t v7 = [v5 alertControllerWithTitle:0 message:v6 preferredStyle:0];

    uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_appKeyColor");
    id v9 = [v7 view];
    [v9 setTintColor:v8];

    id v10 = (void *)MEMORY[0x1E4FB1410];
    id v11 = HKHealthRecordsAPILocalizedString(@"DO_NOT_ALLOW_BUTTON_TITLE_DETERMINED");
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __109__HKClinicalAuthorizationSettingsViewController__presentConfirmationForStopSharingIfNeededWithAcceptHandler___block_invoke;
    v16[3] = &unk_1E6D53958;
    id v17 = v4;
    id v12 = [v10 actionWithTitle:v11 style:2 handler:v16];

    id v13 = (void *)MEMORY[0x1E4FB1410];
    char v14 = HKHealthRecordsAPILocalizedString(@"DO_NOT_ALLOW_BUTTON_TITLE_CANCEL");
    v15 = [v13 actionWithTitle:v14 style:1 handler:0];

    [v7 addAction:v12];
    [v7 addAction:v15];
    [(HKClinicalAuthorizationSettingsViewController *)self presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    v4[2](v4);
  }
}

uint64_t __109__HKClinicalAuthorizationSettingsViewController__presentConfirmationForStopSharingIfNeededWithAcceptHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_messageForStopSharingConfirmation
{
  id v4 = [(HKClinicalAuthorizationSettingsViewController *)self source];
  if (!v4)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationSettingsViewController.m", 1010, @"Invalid parameter not satisfying: %@", @"source != nil" object file lineNumber description];
  }
  id v5 = [NSString alloc];
  uint64_t v6 = [(HKClinicalAuthorizationSettingsViewController *)self context];
  uint64_t v7 = [v6 source];
  uint64_t v8 = HKHealthRecordsAPILocalizedStringWithSource(@"DO_NOT_ALLOW_DETERMINED_APP_%@_CONFIRMATION", v7);
  id v9 = [v4 name];
  id v10 = objc_msgSend(v5, "initWithFormat:", v8, v9);

  return v10;
}

- (void)_fetchPrivacyPolicyURLForSource:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (HKLookUpAppPrivacyPolicyURLOperation *)a3;
  if ([(HKLookUpAppPrivacyPolicyURLOperation *)v4 _isApplication])
  {
    id v5 = [(HKClinicalAuthorizationSettingsViewController *)self lookUpAppPrivacyPolicyURLOperation];
    [v5 cancel];

    uint64_t v6 = [HKLookUpAppPrivacyPolicyURLOperation alloc];
    uint64_t v7 = [(HKLookUpAppPrivacyPolicyURLOperation *)v4 bundleIdentifier];
    uint64_t v8 = [(HKLookUpAppPrivacyPolicyURLOperation *)v6 initWithBundleIdentifier:v7];

    [(HKClinicalAuthorizationSettingsViewController *)self setLookUpAppPrivacyPolicyURLOperation:v8];
    [(HKClinicalAuthorizationSettingsViewController *)self _reloadViewAppPrivacyPolicyCell];
    _HKInitializeLogging();
    id v9 = *MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      id v12 = self;
      __int16 v13 = 2114;
      char v14 = v8;
      _os_log_impl(&dword_1E0B26000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ starting operation %{public}@", (uint8_t *)&v11, 0x16u);
    }
    [(HKLookUpAppPrivacyPolicyURLOperation *)v8 start];
  }
  else
  {
    _HKInitializeLogging();
    id v10 = *MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      id v12 = self;
      __int16 v13 = 2114;
      char v14 = v4;
      _os_log_impl(&dword_1E0B26000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ source %{public}@ is not an app, not fetching privacy policy", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)_reloadViewAppPrivacyPolicyCell
{
  v6[1] = *MEMORY[0x1E4F143B8];
  char v3 = [(HKClinicalAuthorizationSettingsViewController *)self _indexPathForViewAppPrivacyPolicyCell];
  if (v3)
  {
    id v4 = [(OBTableWelcomeController *)self tableView];
    v6[0] = v3;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    [v4 reloadRowsAtIndexPaths:v5 withRowAnimation:5];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  int64_t v6 = -[HKClinicalAuthorizationSettingsViewController _sectionForTableViewSection:](self, "_sectionForTableViewSection:", [v5 section]);
  if (v6 == 2)
  {
    uint64_t v7 = [(HKClinicalAuthorizationSettingsViewController *)self _shareAuthorizationModeCellForIndexPath:v5];
  }
  else if (v6 == 1)
  {
    uint64_t v7 = [(HKClinicalAuthorizationSettingsViewController *)self _shareDataTypeCellForIndexPath:v5];
  }
  else
  {
    if (v6) {
      HKErrorTableViewCell(@"HKClinicalAuthorizationSettingsViewController");
    }
    else {
    uint64_t v7 = [(HKClinicalAuthorizationSettingsViewController *)self _appInformationCellForIndexPath:v5];
    }
  }
  uint64_t v8 = v7;
  id v9 = objc_msgSend(v7, "hkui_configuredForCHR3rdPartyAPIFlowWhilePrompting:", -[HKClinicalAuthorizationSettingsViewController isPrompting](self, "isPrompting"));

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5 = [(HKClinicalAuthorizationSettingsViewController *)self _sectionForTableViewSection:a4];
  if (v5 == 1)
  {
    int64_t v6 = [(HKClinicalAuthorizationSettingsViewController *)self authorizationController];
    uint64_t v8 = [v6 orderedTypesForReading];
    int64_t v7 = [v8 count];
  }
  else
  {
    if (v5) {
      return 2;
    }
    int64_t v6 = [(HKClinicalAuthorizationSettingsViewController *)self appInformationSectionCells];
    int64_t v7 = [v6 count];
  }

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  char v3 = [(HKClinicalAuthorizationSettingsViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int64_t v5 = [(HKClinicalAuthorizationSettingsViewController *)self _sectionForTableViewSection:a4];
  int64_t v6 = [(HKClinicalAuthorizationSettingsViewController *)self source];
  int64_t v7 = [v6 name];

  if (v5 == 2)
  {
    int64_t v6 = HKHealthRecordsAPILocalizedString(@"AUTHORIZATION_MODE_TITLE");
  }
  else
  {
    if (v5 == 1)
    {
      id v10 = [NSString alloc];
      uint64_t v8 = [(HKClinicalAuthorizationSettingsViewController *)self context];
      id v9 = [v8 source];
      int v11 = HKHealthRecordsAPILocalizedStringWithSource(@"SHARE_DATA_WITH_APP_%@_TITLE", v9);
      int64_t v6 = objc_msgSend(v10, "initWithFormat:", v11, v7);
    }
    else
    {
      if (v5) {
        goto LABEL_8;
      }
      uint64_t v8 = [(HKClinicalAuthorizationSettingsViewController *)self context];
      id v9 = [v8 source];
      int64_t v6 = HKHealthRecordsAPILocalizedStringWithSource(@"APP_INFORMATION_TITLE", v9);
    }
  }
LABEL_8:

  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  int64_t v5 = [(HKClinicalAuthorizationSettingsViewController *)self _sectionForTableViewSection:a4];
  if (v5 == (void *)2)
  {
    int64_t v5 = [(HKClinicalAuthorizationSettingsViewController *)self _titleForShareAuthorizationModeFooter];
  }
  else if (v5 == (void *)1)
  {
    int64_t v5 = [(HKClinicalAuthorizationSettingsViewController *)self _titleForShareDataTypesFooter];
  }
  else if (!v5)
  {
    int64_t v5 = [(HKClinicalAuthorizationSettingsViewController *)self _titleForAppInformationFooter];
  }
  return v5;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  int64_t v6 = -[HKClinicalAuthorizationSettingsViewController _sectionForTableViewSection:](self, "_sectionForTableViewSection:", [v5 section]);
  if (v6 == 1)
  {
    BOOL v7 = 0;
  }
  else if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = [(HKClinicalAuthorizationSettingsViewController *)self _shouldHighlightAppInformationCellAtIndexPath:v5];
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  int64_t v7 = -[HKClinicalAuthorizationSettingsViewController _sectionForTableViewSection:](self, "_sectionForTableViewSection:", [v6 section]);
  uint64_t v8 = [v10 cellForRowAtIndexPath:v6];
  if (v7 == 2)
  {
    [(HKClinicalAuthorizationSettingsViewController *)self _shareAuthorizationModeCellPressed:v8];
  }
  else
  {
    if (v7
      || ![(HKClinicalAuthorizationSettingsViewController *)self _cellAtIndexPathIsViewAppPrivacyPolicyCell:v6])
    {
      uint64_t v9 = 0;
      goto LABEL_8;
    }
    [(HKClinicalAuthorizationSettingsViewController *)self _viewAppPrivacyPolicyCellPressed:v8];
  }
  uint64_t v9 = 1;
LABEL_8:
  [v10 deselectRowAtIndexPath:v6 animated:v9];
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
  v10.super_class = (Class)HKClinicalAuthorizationSettingsViewController;
  [(HKClinicalAuthorizationSettingsViewController *)&v10 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(HKClinicalAuthorizationSettingsViewController *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];
    int64_t v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__HKClinicalAuthorizationSettingsViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E6D50ED8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __74__HKClinicalAuthorizationSettingsViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateForCurrentContentSizeCategory];
}

- (id)source
{
  id v2 = [(HKClinicalAuthorizationSettingsViewController *)self context];
  char v3 = [v2 source];

  return v3;
}

- (id)authorizationController
{
  id v2 = [(HKClinicalAuthorizationSettingsViewController *)self context];
  char v3 = [v2 authorizationController];

  return v3;
}

- (NSString)readUsageDescription
{
  id v2 = [(HKClinicalAuthorizationSettingsViewController *)self context];
  char v3 = [v2 readUsageDescription];

  return (NSString *)v3;
}

- (BOOL)isPrompting
{
  return self->_style == 1;
}

- (BOOL)shouldCommitUpdatesImmediately
{
  return ![(HKClinicalAuthorizationSettingsViewController *)self isPrompting];
}

- (HKHealthPrivacyServicePromptControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKHealthPrivacyServicePromptControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (HKClinicalAuthorizationSequenceContext)context
{
  return self->_context;
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

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (NSArray)appInformationSectionCells
{
  return self->_appInformationSectionCells;
}

- (void)setAppInformationSectionCells:(id)a3
{
}

- (HKLookUpAppPrivacyPolicyURLOperation)lookUpAppPrivacyPolicyURLOperation
{
  return self->_lookUpAppPrivacyPolicyURLOperation;
}

- (void)setLookUpAppPrivacyPolicyURLOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookUpAppPrivacyPolicyURLOperation, 0);
  objc_storeStrong((id *)&self->_appInformationSectionCells, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_displayController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_doNotAllowButton, 0);
  objc_storeStrong((id *)&self->_allowButton, 0);
}

@end