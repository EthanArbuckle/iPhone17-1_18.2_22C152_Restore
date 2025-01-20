@interface HKAuthorizationSettingsViewController
- (BOOL)_isTypeEnabledAtIndexPath:(id)a3;
- (BOOL)_shouldDisplayHealthRecordsRequests;
- (BOOL)_shouldDisplayReadingSection;
- (BOOL)_shouldDisplaySharingSection;
- (BOOL)isPrompting;
- (BOOL)shouldPresent;
- (HKAuthorizationSettingsViewController)init;
- (HKAuthorizationSettingsViewController)initWithHealthStore:(id)a3 style:(int64_t)a4;
- (HKHealthPrivacyServicePromptControllerDelegate)delegate;
- (HKHealthStore)healthStore;
- (HKSource)source;
- (HKSourceAuthorizationController)sourceAuthorizationController;
- (NSArray)actualSections;
- (NSSet)typesToRead;
- (NSSet)typesToShare;
- (NSString)researchStudyUsageDescription;
- (NSString)shareDescription;
- (NSString)updateDescription;
- (UIBarButtonItem)cancelButtonItem;
- (UIBarButtonItem)doneButtonItem;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)_authorizationSettingCellForRowAtIndexPath:(id)a3;
- (id)_localizedNameForSection:(int64_t)a3 type:(id)a4;
- (id)_localizedSourceExplanationWithDescription:(id)a3 forReadingSection:(BOOL)a4;
- (id)_openAppCell;
- (id)_researchStudyExplanationCell;
- (id)_specialCellWithIdentifier:(id)a3;
- (id)_toggleAllCell;
- (id)_typeForIndexPath:(id)a3 section:(int64_t *)a4;
- (id)sectionsForAuthController:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)authorizationSectionForSection:(int64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)style;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addCancelAndDoneButtons;
- (void)_configurationFailedWithError:(id)a3;
- (void)_didFetchBackgroundAppRefreshStatus:(BOOL)a3;
- (void)_displayGuestModeAlertWithCompletion:(id)a3;
- (void)_done:(id)a3;
- (void)_fetchBackgroundAppRefreshStatusWithHandler:(id)a3;
- (void)_finishWithError:(id)a3;
- (void)_updateHeaderView;
- (void)authorizationController:(id)a3 parentTypeIsDisabled:(id)a4 forType:(id)a5 inSection:(int64_t)a6;
- (void)authorizationController:(id)a3 subTypesEnabled:(id)a4 forType:(id)a5 inSection:(int64_t)a6;
- (void)pickerControllerDidFinish:(id)a3 error:(id)a4;
- (void)reloadAuthorizationSettings;
- (void)setActualSections:(id)a3;
- (void)setCancelButtonItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoneButtonItem:(id)a3;
- (void)setResearchStudyUsageDescription:(id)a3;
- (void)setShareDescription:(id)a3;
- (void)setSource:(id)a3;
- (void)setSourceAuthorizationController:(id)a3;
- (void)setTypesToRead:(id)a3;
- (void)setTypesToShare:(id)a3;
- (void)setUpdateDescription:(id)a3;
- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateAllowButtonEnabledState;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HKAuthorizationSettingsViewController

- (HKAuthorizationSettingsViewController)init
{
  return [(HKAuthorizationSettingsViewController *)self initWithHealthStore:0 style:0];
}

- (HKAuthorizationSettingsViewController)initWithHealthStore:(id)a3 style:(int64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKAuthorizationSettingsViewController.m", 80, @"Invalid parameter not satisfying: %@", @"healthStore != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)HKAuthorizationSettingsViewController;
  v9 = [(HKTableViewController *)&v13 initWithUsingInsetStyling:1];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    v10->_style = a4;
  }

  return v10;
}

- (void)setSource:(id)a3
{
  id v5 = a3;
  p_source = &self->_source;
  objc_storeStrong((id *)&self->_source, a3);
  v7 = [[HKSourceAuthorizationController alloc] initWithHealthStore:self->_healthStore source:v5 typesForSharing:self->_typesToShare typesForReading:self->_typesToRead];
  sourceAuthorizationController = self->_sourceAuthorizationController;
  self->_sourceAuthorizationController = v7;

  [(HKSourceAuthorizationController *)self->_sourceAuthorizationController setDelegate:self];
  v9 = [(HKSourceAuthorizationController *)self->_sourceAuthorizationController typesInSection:6];
  v10 = (void *)[v9 mutableCopy];

  if ([(HKAuthorizationSettingsViewController *)self isPrompting])
  {
    v11 = [MEMORY[0x1E4F2B2C0] documentTypeForIdentifier:*MEMORY[0x1E4F29A80]];
    [v10 removeObject:v11];
  }
  objc_storeStrong((id *)&self->_readingTypeOrdering, v10);
  if (![(HKAuthorizationSettingsViewController *)self isPrompting])
  {
    v12 = [v5 name];
    objc_super v13 = [(HKAuthorizationSettingsViewController *)self navigationItem];
    [v13 setTitle:v12];
  }
  v14 = [(HKAuthorizationSettingsViewController *)self sourceAuthorizationController];
  v15 = [(HKAuthorizationSettingsViewController *)self sectionsForAuthController:v14];
  [(HKAuthorizationSettingsViewController *)self setActualSections:v15];

  if (![(HKSource *)*p_source _isAllowedBackgroundDelivery])
  {
    self->_requiresBackgroundAppRefreshDisclosure = 0;
    goto LABEL_9;
  }
  char v16 = [(HKSource *)*p_source _isResearchStudy];
  self->_requiresBackgroundAppRefreshDisclosure = v16 ^ 1;
  if (v16)
  {
LABEL_9:
    v17 = [(HKAuthorizationSettingsViewController *)self tableView];
    [v17 reloadData];

    goto LABEL_10;
  }
  self->_hasFetchedBackgroundAppRefreshStatus = 0;
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__HKAuthorizationSettingsViewController_setSource___block_invoke;
  v18[3] = &unk_1E6D51C70;
  objc_copyWeak(&v19, &location);
  [(HKAuthorizationSettingsViewController *)self _fetchBackgroundAppRefreshStatusWithHandler:v18];
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
LABEL_10:
}

void __51__HKAuthorizationSettingsViewController_setSource___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _didFetchBackgroundAppRefreshStatus:a2];
    id WeakRetained = v4;
  }
}

- (void)_didFetchBackgroundAppRefreshStatus:(BOOL)a3
{
  self->_isBackgroundAppRefreshEnabled = a3;
  self->_hasFetchedBackgroundAppRefreshStatus = 1;
  id v3 = [(HKAuthorizationSettingsViewController *)self tableView];
  [v3 reloadData];
}

- (void)reloadAuthorizationSettings
{
  [(HKSourceAuthorizationController *)self->_sourceAuthorizationController reload];
  id v3 = [(HKAuthorizationSettingsViewController *)self tableView];
  [v3 reloadData];
}

- (void)viewDidLoad
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)HKAuthorizationSettingsViewController;
  [(HKTableViewController *)&v12 viewDidLoad];
  id v3 = [(HKAuthorizationSettingsViewController *)self tableView];
  [v3 _setSectionCornerRadius:10.0];

  id v4 = [(HKAuthorizationSettingsViewController *)self tableView];
  [v4 setEstimatedRowHeight:44.0];

  if ([(HKAuthorizationSettingsViewController *)self isPrompting])
  {
    [(HKAuthorizationSettingsViewController *)self _addCancelAndDoneButtons];
    [(HKAuthorizationSettingsViewController *)self setModalInPresentation:1];
    id v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v6 = [(HKAuthorizationSettingsViewController *)self view];
    [v6 setBackgroundColor:v5];

    v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    id v8 = [(HKAuthorizationSettingsViewController *)self tableView];
    [v8 setBackgroundColor:v7];

    v9 = self;
    v13[0] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v11 = (id)[(HKAuthorizationSettingsViewController *)self registerForTraitChanges:v10 withHandler:&__block_literal_global_45];
  }
}

uint64_t __52__HKAuthorizationSettingsViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _updateHeaderView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKAuthorizationSettingsViewController;
  [(HKAuthorizationSettingsViewController *)&v4 viewWillAppear:a3];
  if ([(HKAuthorizationSettingsViewController *)self isPrompting]) {
    [(HKAuthorizationSettingsViewController *)self _updateHeaderView];
  }
  [(HKAuthorizationSettingsViewController *)self reloadAuthorizationSettings];
}

- (void)_addCancelAndDoneButtons
{
  BOOL v3 = [(HKAuthorizationSettingsViewController *)self isPrompting];
  id v4 = objc_alloc(MEMORY[0x1E4FB14A8]);
  id v5 = v4;
  if (v3)
  {
    v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v7 = [v6 localizedStringForKey:@"AUTHORIZATION_PROMPT_DONT_ALLOW" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    id v8 = (UIBarButtonItem *)[v5 initWithTitle:v7 style:0 target:self action:sel__done_];
    cancelButtonItem = self->_cancelButtonItem;
    self->_cancelButtonItem = v8;

    v10 = [@"UIA.Health" stringByAppendingString:@".AuthSheet.CancelButton"];
    [(UIBarButtonItem *)self->_cancelButtonItem setAccessibilityIdentifier:v10];

    id v11 = objc_alloc(MEMORY[0x1E4FB14A8]);
    objc_super v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    objc_super v13 = [v12 localizedStringForKey:@"AUTHORIZATION_PROMPT_ALLOW" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v14 = (UIBarButtonItem *)[v11 initWithTitle:v13 style:2 target:self action:sel__done_];
    doneButtonItem = self->_doneButtonItem;
    self->_doneButtonItem = v14;

    char v16 = [@"UIA.Health" stringByAppendingString:@".AuthSheet.DoneButton"];
    [(UIBarButtonItem *)self->_doneButtonItem setAccessibilityIdentifier:v16];

    [(UIBarButtonItem *)self->_doneButtonItem setEnabled:0];
  }
  else
  {
    v17 = (UIBarButtonItem *)[v4 initWithBarButtonSystemItem:1 target:self action:sel__done_];
    v18 = self->_cancelButtonItem;
    self->_cancelButtonItem = v17;

    id v19 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__done_];
    v20 = self->_doneButtonItem;
    self->_doneButtonItem = v19;
  }
  id v23 = [(HKAuthorizationSettingsViewController *)self navigationItem];
  [v23 setLeftBarButtonItem:self->_cancelButtonItem];
  [v23 setRightBarButtonItem:self->_doneButtonItem];
  v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v22 = [v21 localizedStringForKey:@"HEALTH_ACCESS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [v23 setTitle:v22];
}

- (void)_done:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = (UIBarButtonItem *)a3;
  if (self->_doneButtonItem == v4)
  {
    [(HKSourceAuthorizationController *)self->_sourceAuthorizationController commitAuthorizationStatuses];
    [(HKAuthorizationSettingsViewController *)self _finishWithError:0];
  }
  else
  {
    if ([(HKAuthorizationSettingsViewController *)self isPrompting])
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v5 = [(HKSourceAuthorizationController *)self->_sourceAuthorizationController typesInSection:6];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v31;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v31 != v8) {
              objc_enumerationMutation(v5);
            }
            [(HKSourceAuthorizationController *)self->_sourceAuthorizationController setEnabled:0 forType:*(void *)(*((void *)&v30 + 1) + 8 * v9++) inSection:6 commit:0];
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v7);
      }

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v10 = [(HKSourceAuthorizationController *)self->_sourceAuthorizationController typesInSection:4];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v27;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v27 != v13) {
              objc_enumerationMutation(v10);
            }
            [(HKSourceAuthorizationController *)self->_sourceAuthorizationController setEnabled:0 forType:*(void *)(*((void *)&v26 + 1) + 8 * v14++) inSection:4 commit:0];
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
        }
        while (v12);
      }

      [(HKSourceAuthorizationController *)self->_sourceAuthorizationController commitAuthorizationStatuses];
      v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      char v16 = [v15 localizedStringForKey:@"AUTHORIZATION_DONT_ALLOW_ALERT_MESSAGE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

      v17 = (void *)MEMORY[0x1E4FB1418];
      v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v19 = [v18 localizedStringForKey:@"AUTHORIZATION_DONT_ALLOW_ALERT_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v20 = [v17 alertControllerWithTitle:v19 message:v16 preferredStyle:1];

      v21 = (void *)MEMORY[0x1E4FB1410];
      v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v23 = [v22 localizedStringForKey:@"AUTHORIZATION_DONT_ALLOW_ALERT_OK" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __47__HKAuthorizationSettingsViewController__done___block_invoke;
      v25[3] = &unk_1E6D51928;
      v25[4] = self;
      v24 = [v21 actionWithTitle:v23 style:0 handler:v25];

      [v20 addAction:v24];
      [(HKAuthorizationSettingsViewController *)self presentViewController:v20 animated:1 completion:0];
    }
    else
    {
      char v16 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 7, @"The user canceled authorization.");
      [(HKAuthorizationSettingsViewController *)self _finishWithError:v16];
    }
  }
}

uint64_t __47__HKAuthorizationSettingsViewController__done___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithError:0];
}

- (void)_finishWithError:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  if ([v5 isiPad])
  {
    BOOL v6 = +[HKiPadHealthSyncEnablement isSyncPromptedForHealthKit:self->_healthStore];

    if (!v6)
    {
      uint64_t v7 = [[HKHealthSyncDisplayController alloc] initWithHealthStore:self->_healthStore source:self->_source];
      uint64_t v8 = [(HKAuthorizationSettingsViewController *)self delegate];
      [(HKHealthSyncDisplayController *)v7 setDelegate:v8];

      _HKInitializeLogging();
      uint64_t v9 = (void *)*MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        *(_DWORD *)uint64_t v13 = 138412290;
        *(void *)&v13[4] = objc_opt_class();
        id v11 = *(id *)&v13[4];
        _os_log_impl(&dword_1E0B26000, v10, OS_LOG_TYPE_DEFAULT, "%@: Prompting health sync view controller", v13, 0xCu);
      }
      -[HKAuthorizationSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0, *(_OWORD *)v13);
      goto LABEL_10;
    }
  }
  else
  {
  }
  _HKInitializeLogging();
  uint64_t v12 = (void *)*MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG)) {
    -[HKAuthorizationSettingsViewController _finishWithError:](v12);
  }
  uint64_t v7 = [(HKAuthorizationSettingsViewController *)self delegate];
  [(HKHealthSyncDisplayController *)v7 promptControllerDidFinish:self error:v4];
LABEL_10:
}

- (BOOL)isPrompting
{
  return self->_style == 1;
}

- (void)updateAllowButtonEnabledState
{
  if ([(HKAuthorizationSettingsViewController *)self isPrompting])
  {
    BOOL v3 = [(HKSourceAuthorizationController *)self->_sourceAuthorizationController anyTypeEnabled];
    doneButtonItem = self->_doneButtonItem;
    [(UIBarButtonItem *)doneButtonItem setEnabled:v3];
  }
}

- (void)_displayGuestModeAlertWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4FB1418];
  id v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  BOOL v6 = [v5 localizedStringForKey:@"GUEST_MODE_CHANGE_AUTHORIZATION_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v8 = [v7 localizedStringForKey:@"GUEST_MODE_CHANGE_AUTHORIZATION_DESCRIPTION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v9 = [v4 alertControllerWithTitle:v6 message:v8 preferredStyle:1];

  v10 = (void *)MEMORY[0x1E4FB1410];
  id v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v12 = [v11 localizedStringForKey:@"SHARE_ALERT_OK" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__HKAuthorizationSettingsViewController__displayGuestModeAlertWithCompletion___block_invoke;
  v16[3] = &unk_1E6D53958;
  id v17 = v3;
  id v13 = v3;
  uint64_t v14 = [v10 actionWithTitle:v12 style:0 handler:v16];

  [v9 addAction:v14];
  [(HKAuthorizationSettingsViewController *)self presentViewController:v9 animated:1 completion:0];
}

uint64_t __78__HKAuthorizationSettingsViewController__displayGuestModeAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_requiresBackgroundAppRefreshDisclosure && !self->_hasFetchedBackgroundAppRefreshStatus) {
    return 0;
  }
  else {
    return [(NSArray *)self->_actualSections count];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5 = [(HKAuthorizationSettingsViewController *)self authorizationSectionForSection:a4];
  int64_t v6 = v5 - 1;
  if (unint64_t)(v5 - 1) < 8 && ((0xC7u >> v6)) {
    return qword_1E0F059F8[v6];
  }
  uint64_t v7 = [(HKSourceAuthorizationController *)self->_sourceAuthorizationController typesInSection:v5];
  int64_t v8 = [v7 count];

  BOOL v9 = [(HKAuthorizationSettingsViewController *)self isPrompting];
  if (v5 == 6 && v9) {
    v8 -= [(HKSourceAuthorizationController *)self->_sourceAuthorizationController isRequestingDocumentAuthorization];
  }
  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  int64_t v4 = [(HKAuthorizationSettingsViewController *)self authorizationSectionForSection:a4];
  if (v4 != 5 && v4 != 2) {
    return *MEMORY[0x1E4FB2F28];
  }
  return HKUIOnePixel();
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int64_t v5 = [(HKAuthorizationSettingsViewController *)self authorizationSectionForSection:a4];
  switch(v5)
  {
    case 6:
      int64_t v8 = NSString;
      BOOL v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      int64_t v6 = v9;
      v10 = @"SHARE_DATA_WITH_%@";
LABEL_7:
      id v11 = [v9 localizedStringForKey:v10 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      uint64_t v12 = [(HKSource *)self->_source name];
      uint64_t v7 = objc_msgSend(v8, "stringWithFormat:", v11, v12);

      goto LABEL_8;
    case 4:
      int64_t v8 = NSString;
      BOOL v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      int64_t v6 = v9;
      v10 = @"ALLOW_%@_TO_UPDATE";
      goto LABEL_7;
    case 1:
      int64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v7 = [v6 localizedStringForKey:@"STUDY_EXPLANATION_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
LABEL_8:

      goto LABEL_10;
  }
  uint64_t v7 = 0;
LABEL_10:
  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  int64_t v5 = 0;
  switch([(HKAuthorizationSettingsViewController *)self authorizationSectionForSection:a4])
  {
    case 3:
      int64_t v6 = NSString;
      uint64_t v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      int64_t v8 = [v7 localizedStringForKey:@"CLINICAL_DOCUMENTS_REQUEST_AUTH_DESCRIPTION %@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      BOOL v9 = [(HKSource *)self->_source name];
      int64_t v5 = objc_msgSend(v6, "stringWithFormat:", v8, v9);

      break;
    case 4:
      updateDescription = self->_updateDescription;
      id v11 = self;
      uint64_t v12 = 0;
      goto LABEL_5;
    case 6:
      updateDescription = self->_shareDescription;
      id v11 = self;
      uint64_t v12 = 1;
LABEL_5:
      id v13 = [(HKAuthorizationSettingsViewController *)v11 _localizedSourceExplanationWithDescription:updateDescription forReadingSection:v12];
      goto LABEL_7;
    case 7:
      id v13 = self->_researchStudyUsageDescription;
LABEL_7:
      int64_t v5 = v13;
      break;
    default:
      break;
  }
  return v5;
}

- (id)_localizedSourceExplanationWithDescription:(id)a3 forReadingSection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [(HKSource *)self->_source _isResearchStudy];
  int64_t v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  BOOL v9 = v8;
  if (v7) {
    v10 = @"STUDY_EXPLANATION_%@";
  }
  else {
    v10 = @"APP_EXPLANATION_%@";
  }
  id v11 = [v8 localizedStringForKey:v10 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  if (v6)
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", v11, v6);
    if (v12) {
      BOOL v13 = !v4;
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13 && self->_requiresBackgroundAppRefreshDisclosure)
    {
      if (self->_hasFetchedBackgroundAppRefreshStatus)
      {
        BOOL isBackgroundAppRefreshEnabled = self->_isBackgroundAppRefreshEnabled;
        v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        char v16 = v15;
        if (isBackgroundAppRefreshEnabled) {
          id v17 = @"BACKGROUND_DELIVERY_BAR_ON";
        }
        else {
          id v17 = @"BACKGROUND_DELIVERY_BAR_OFF";
        }
        v18 = [v15 localizedStringForKey:v17 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

        uint64_t v19 = [v12 stringByAppendingString:v18];

        uint64_t v12 = (void *)v19;
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
          -[HKAuthorizationSettingsViewController _localizedSourceExplanationWithDescription:forReadingSection:]();
        }
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)_fetchBackgroundAppRefreshStatusWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  int64_t v5 = *MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_INFO))
  {
    source = self->_source;
    *(_DWORD *)buf = 138543362;
    v15 = source;
    _os_log_impl(&dword_1E0B26000, v5, OS_LOG_TYPE_INFO, "Fetching BAR eligiblity for %{public}@", buf, 0xCu);
  }
  int v7 = [MEMORY[0x1E4F5FA50] sharedScheduler];
  int64_t v8 = [(HKSource *)self->_source bundleIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__HKAuthorizationSettingsViewController__fetchBackgroundAppRefreshStatusWithHandler___block_invoke;
  v11[3] = &unk_1E6D53E90;
  id v12 = v8;
  id v13 = v4;
  id v9 = v4;
  id v10 = v8;
  [v7 backgroundAppRefreshEnabledForApp:v10 withHandler:v11];
}

void __85__HKAuthorizationSettingsViewController__fetchBackgroundAppRefreshStatusWithHandler___block_invoke(uint64_t a1, char a2, char a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__HKAuthorizationSettingsViewController__fetchBackgroundAppRefreshStatusWithHandler___block_invoke_2;
  block[3] = &unk_1E6D53E68;
  id v7 = *(id *)(a1 + 32);
  char v9 = a2;
  char v10 = a3;
  id v8 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __85__HKAuthorizationSettingsViewController__fetchBackgroundAppRefreshStatusWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = v2;
    int64_t v5 = HKStringFromBool();
    id v6 = HKStringFromBool();
    int v9 = 138543874;
    uint64_t v10 = v3;
    __int16 v11 = 2114;
    id v12 = v5;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1E0B26000, v4, OS_LOG_TYPE_INFO, "Duet BAR eligiblity for '%{public}@': global=%{public}@, app=%{public}@", (uint8_t *)&v9, 0x20u);
  }
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v7 = *(unsigned char *)(a1 + 49) != 0;
  }
  else {
    BOOL v7 = 0;
  }
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = 0;
  switch(-[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", [v5 section]))
  {
    case 1:
      uint64_t v7 = [(HKAuthorizationSettingsViewController *)self _researchStudyExplanationCell];
      goto LABEL_6;
    case 2:
      uint64_t v7 = [(HKAuthorizationSettingsViewController *)self _toggleAllCell];
      goto LABEL_6;
    case 3:
    case 4:
    case 6:
      uint64_t v7 = [(HKAuthorizationSettingsViewController *)self _authorizationSettingCellForRowAtIndexPath:v5];
      goto LABEL_6;
    case 8:
      uint64_t v7 = [(HKAuthorizationSettingsViewController *)self _openAppCell];
LABEL_6:
      id v6 = (void *)v7;
      break;
    default:
      break;
  }
  if ([(HKAuthorizationSettingsViewController *)self isPrompting])
  {
    id v8 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [v6 setBackgroundColor:v8];
  }
  if (v6)
  {
    id v9 = v6;
  }
  else
  {
    HKErrorTableViewCell(@"HKAuthorizationSettingsViewController");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v10 = v9;

  return v10;
}

- (id)_researchStudyExplanationCell
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"ResearchStudyExplanation"];
  id v4 = [v3 textLabel];
  [v4 setNumberOfLines:0];

  id v5 = [(HKAuthorizationSettingsViewController *)self researchStudyUsageDescription];
  id v6 = [v3 textLabel];
  [v6 setText:v5];

  [v3 setSelectionStyle:0];
  return v3;
}

- (id)_toggleAllCell
{
  uint64_t v3 = [(HKAuthorizationSettingsViewController *)self _specialCellWithIdentifier:@"ToggleAllCell"];
  BOOL v4 = [(HKSourceAuthorizationController *)self->_sourceAuthorizationController allTypesEnabled];
  id v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v6 = v5;
  if (v4) {
    uint64_t v7 = @"DISABLE_ALL_CATEGORIES";
  }
  else {
    uint64_t v7 = @"ENABLE_ALL_CATEGORIES";
  }
  id v8 = [v5 localizedStringForKey:v7 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  id v9 = [v3 textLabel];
  [v9 setText:v8];

  uint64_t v10 = [@"UIA.Health" stringByAppendingString:@".AuthSheet.AllCategoryButton"];
  [v3 setAccessibilityIdentifier:v10];

  return v3;
}

- (id)_openAppCell
{
  uint64_t v3 = [(HKAuthorizationSettingsViewController *)self _specialCellWithIdentifier:@"OpenAppCell"];
  BOOL v4 = NSString;
  id v5 = HKHealthKitFrameworkBundle();
  id v6 = [v5 localizedStringForKey:@"OPEN_%@" value:&stru_1F3B9CF20 table:*MEMORY[0x1E4F29E58]];
  uint64_t v7 = [(HKAuthorizationSettingsViewController *)self source];
  id v8 = [v7 name];
  id v9 = objc_msgSend(v4, "stringWithFormat:", v6, v8);
  uint64_t v10 = [v3 textLabel];
  [v10 setText:v9];

  return v3;
}

- (id)_specialCellWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HKAuthorizationSettingsViewController *)self tableView];
  id v6 = [v5 dequeueReusableCellWithIdentifier:v4];

  if (!v6) {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:v4];
  }
  uint64_t v7 = HKHealthKeyColor();
  id v8 = [v6 textLabel];
  [v8 setTextColor:v7];

  return v6;
}

- (id)_localizedNameForSection:(int64_t)a3 type:(id)a4
{
  id v6 = a4;
  if ([(HKAuthorizationSettingsViewController *)self authorizationSectionForSection:a3] == 3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v8 = [v7 localizedStringForKey:@"CLINICAL_DOCUMENT_REQUESTS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
LABEL_6:

      goto LABEL_8;
    }
  }
  if ([v6 isClinicalType])
  {
    id v9 = +[HKDisplayTypeController sharedInstanceForHealthStore:self->_healthStore];
    uint64_t v7 = [v9 displayTypeForObjectTypeUnifyingBloodPressureTypes:v6];

    uint64_t v10 = [v7 localization];
    id v8 = [v10 displayName];

    goto LABEL_6;
  }
  id v8 = objc_msgSend(v6, "hk_localizedName");
LABEL_8:

  return v8;
}

- (id)_authorizationSettingCellForRowAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(HKAuthorizationSettingsViewController *)self tableView];
  id v6 = [v5 dequeueReusableCellWithIdentifier:@"AuthorizationSettingsCell"];

  if (!v6)
  {
    id v6 = [[HKSwitchTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"AuthorizationSettingsCell"];
    [(HKSwitchTableViewCell *)v6 setDelegate:self];
    [(HKSwitchTableViewCell *)v6 setCentersIcon:1];
  }
  uint64_t v7 = [(HKAuthorizationSettingsViewController *)self _typeForIndexPath:v4 section:0];
  id v8 = +[HKDisplayTypeController sharedInstanceForHealthStore:self->_healthStore];
  id v9 = [v8 displayTypeForObjectTypeUnifyingBloodPressureTypes:v7];

  int64_t v10 = -[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", [v4 section]);
  long long v32 = v9;
  if (v10 == 6) {
    uint64_t v11 = [v9 isDocument];
  }
  else {
    uint64_t v11 = 0;
  }
  [(HKSwitchTableViewCell *)v6 setShouldHideSwitch:v11];
  id v12 = [(HKSourceAuthorizationController *)self->_sourceAuthorizationController objectAuthorizationStatusesForDocuments];
  uint64_t v13 = [v12 count];

  if (v11 && v13)
  {
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v13, v32);
    [(HKSwitchTableViewCell *)v6 setCountText:v14];

    uint64_t v15 = 1;
  }
  else
  {
    [(HKSwitchTableViewCell *)v6 setCountText:0];
    uint64_t v15 = 0;
  }
  [(HKSwitchTableViewCell *)v6 setAccessoryType:v15];
  if (v10 == 3)
  {
    id v16 = 0;
  }
  else
  {
    id v17 = [v7 parentType];

    if (v17)
    {
      v18 = +[HKDisplayTypeController sharedInstanceForHealthStore:self->_healthStore];
      uint64_t v19 = [v7 parentType];
      id v16 = [v18 displayTypeForObjectTypeUnifyingBloodPressureTypes:v19];
    }
    else
    {
      id v16 = v32;
    }
  }
  v20 = -[HKAuthorizationSettingsViewController _localizedNameForSection:type:](self, "_localizedNameForSection:type:", [v4 section], v7);
  [(HKSwitchTableViewCell *)v6 setDisplayText:v20];
  v21 = [v16 listIcon];
  [(HKSwitchTableViewCell *)v6 setIconImage:v21];
  if (v21)
  {
    double v22 = 59.0;
  }
  else
  {
    id v23 = [(HKAuthorizationSettingsViewController *)self tableView];
    [v23 separatorInset];
    double v22 = v24;
  }
  -[HKSwitchTableViewCell setSeparatorInset:](v6, "setSeparatorInset:", 0.0, v22, 0.0, 0.0);
  v25 = @"UIA.Health.Default";
  if (v10 == 6) {
    v25 = @"UIA.Health.Read";
  }
  if (v10 == 4) {
    v25 = @"UIA.Health.Write";
  }
  long long v26 = (void *)MEMORY[0x1E4F28B88];
  long long v27 = v25;
  long long v28 = [v26 whitespaceAndNewlineCharacterSet];
  long long v29 = objc_msgSend(v20, "hk_stringByRemovingCharactersInSet:", v28);

  long long v30 = [(__CFString *)v27 stringByAppendingFormat:@".%@.SwitchCell", v29];

  [(HKSwitchTableViewCell *)v6 setAccessibilityIdentifier:v30];
  [(HKSwitchTableViewCell *)v6 setOn:[(HKAuthorizationSettingsViewController *)self _isTypeEnabledAtIndexPath:v4]];
  [(HKSwitchTableViewCell *)v6 setAdjustsFontSizeToFitWidth:1];

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = -[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", [v7 section]);
  id v9 = [(HKAuthorizationSettingsViewController *)self _typeForIndexPath:v7 section:0];

  switch(v8)
  {
    case 8:
      uint64_t v14 = [(HKAuthorizationSettingsViewController *)self source];
      uint64_t v15 = [v14 bundleIdentifier];

      id v16 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __75__HKAuthorizationSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v24[3] = &unk_1E6D53EB8;
      id v25 = v15;
      id v17 = v15;
      [v16 openApplication:v17 withOptions:0 completion:v24];

      break;
    case 6:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [(HKSourceAuthorizationController *)self->_sourceAuthorizationController objectAuthorizationStatusesForDocuments];
        uint64_t v19 = [v18 count];

        if (v19)
        {
          v20 = [(HKSourceAuthorizationController *)self->_sourceAuthorizationController objectAuthorizationStatusesForDocuments];
          v21 = [[HKDocumentPickerViewController alloc] initWithDocumentAuthorizations:v20];
          [(HKDocumentPickerViewController *)v21 setSource:self->_source];
          double v22 = objc_msgSend(v9, "hk_localizedName");
          [(HKDocumentPickerViewController *)v21 setTitle:v22];

          id v23 = [(HKAuthorizationSettingsViewController *)self navigationController];
          [v23 pushViewController:v21 animated:1];
        }
      }
      break;
    case 2:
      BOOL v10 = [(HKAuthorizationSettingsViewController *)self isPrompting];
      BOOL v11 = v10;
      BOOL v12 = !v10;
      uint64_t v13 = [(HKSourceAuthorizationController *)self->_sourceAuthorizationController allTypesEnabled] ^ 1;
      [(HKSourceAuthorizationController *)self->_sourceAuthorizationController setEnabled:v13 forAllTypesInSection:4 commit:v12];
      [(HKSourceAuthorizationController *)self->_sourceAuthorizationController setEnabled:v13 forAllTypesInSection:6 commit:v12];
      if ((v13 & 1) == 0 && !v11) {
        [(HKSourceAuthorizationController *)self->_sourceAuthorizationController resetObjectAuthorizationStatuses];
      }
      [v6 reloadData];
      [(HKAuthorizationSettingsViewController *)self updateAllowButtonEnabledState];
      break;
  }
}

void __75__HKAuthorizationSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __75__HKAuthorizationSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }
  }
}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HKAuthorizationSettingsViewController *)self tableView];
  int64_t v8 = [v7 indexPathForCell:v6];

  uint64_t v12 = 0;
  id v9 = [(HKAuthorizationSettingsViewController *)self _typeForIndexPath:v8 section:&v12];
  BOOL v10 = [(HKAuthorizationSettingsViewController *)self isPrompting];
  if (v12 == 3)
  {
    uint64_t v12 = 6;
    if (!v10) {
      [(HKSourceAuthorizationController *)self->_sourceAuthorizationController resetObjectAuthorizationStatuses];
    }
  }
  -[HKSourceAuthorizationController setEnabled:forType:inSection:commit:](self->_sourceAuthorizationController, "setEnabled:forType:inSection:commit:", v4, v9);
  BOOL v11 = [(HKAuthorizationSettingsViewController *)self tableView];
  [v11 reloadData];

  [(HKAuthorizationSettingsViewController *)self updateAllowButtonEnabledState];
}

- (void)pickerControllerDidFinish:(id)a3 error:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
      -[HKAuthorizationSettingsViewController pickerControllerDidFinish:error:]();
    }
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = [v6 allSamples];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      uint64_t v13 = MEMORY[0x1E4F1CC28];
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = [*(id *)(*((void *)&v27 + 1) + 8 * i) UUID];
          [v8 setObject:v13 forKeyedSubscript:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v11);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v16 = objc_msgSend(v6, "enabledSamples", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
      uint64_t v20 = MEMORY[0x1E4F1CC38];
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          double v22 = [*(id *)(*((void *)&v23 + 1) + 8 * j) UUID];
          [v8 setObject:v20 forKeyedSubscript:v22];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v18);
    }

    [(HKSourceAuthorizationController *)self->_sourceAuthorizationController commitObjectAuthorizationStatuses:v8];
  }
}

- (void)authorizationController:(id)a3 parentTypeIsDisabled:(id)a4 forType:(id)a5 inSection:(int64_t)a6
{
  id v36 = a3;
  id v35 = a4;
  id v9 = a5;
  uint64_t v10 = objc_msgSend(v9, "hk_localizedNameForAuthSheet");
  uint64_t v11 = objc_msgSend(v35, "hk_localizedNameForAuthSheet");
  uint64_t v12 = @"ENABLING_%@_TO_WRITE_WILL_ENABLE_%@";
  if (a6 == 6) {
    uint64_t v12 = @"ENABLING_%@_TO_READ_WILL_ENABLE_%@";
  }
  uint64_t v13 = NSString;
  uint64_t v14 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v15 = v12;
  id v16 = [v14 bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v17 = [v16 localizedStringForKey:v15 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  long long v32 = objc_msgSend(v13, "stringWithFormat:", v17, v10, v11);

  uint64_t v18 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v32 message:0 preferredStyle:0];
  uint64_t v19 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v21 = [v20 localizedStringForKey:@"AUTHORIZATION_STATUS_CHANGE_CANCEL" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  double v22 = [v19 actionWithTitle:v21 style:1 handler:0];
  [v18 addAction:v22];

  long long v23 = NSString;
  long long v24 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  long long v25 = [v24 localizedStringForKey:@"AUTHORIZATION_STATUS_ENABLE_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  long long v26 = objc_msgSend(v23, "stringWithFormat:", v25, v11);

  long long v27 = (void *)MEMORY[0x1E4FB1410];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __104__HKAuthorizationSettingsViewController_authorizationController_parentTypeIsDisabled_forType_inSection___block_invoke;
  v37[3] = &unk_1E6D53EE0;
  v37[4] = self;
  id v38 = v36;
  id v40 = v9;
  int64_t v41 = a6;
  id v39 = v35;
  id v28 = v9;
  id v29 = v35;
  id v30 = v36;
  long long v31 = [v27 actionWithTitle:v26 style:0 handler:v37];
  [v18 addAction:v31];

  [(HKAuthorizationSettingsViewController *)self presentViewController:v18 animated:1 completion:0];
}

uint64_t __104__HKAuthorizationSettingsViewController_authorizationController_parentTypeIsDisabled_forType_inSection___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) isPrompting] ^ 1;
  [*(id *)(a1 + 40) setEnabled:1 forType:*(void *)(a1 + 48) inSection:*(void *)(a1 + 64) commit:v2];
  [*(id *)(a1 + 40) setEnabled:1 forType:*(void *)(a1 + 56) inSection:*(void *)(a1 + 64) commit:v2];
  uint64_t v3 = [*(id *)(a1 + 32) tableView];
  [v3 reloadData];

  BOOL v4 = *(void **)(a1 + 32);
  return [v4 updateAllowButtonEnabledState];
}

- (void)authorizationController:(id)a3 subTypesEnabled:(id)a4 forType:(id)a5 inSection:(int64_t)a6
{
  id v29 = a3;
  id v28 = a4;
  id v8 = a5;
  uint64_t v33 = objc_msgSend(v8, "hk_localizedNameForAuthSheet");
  id v9 = [v28 anyObject];
  uint64_t v10 = objc_msgSend(v9, "hk_localizedNameForAuthSheet");

  uint64_t v11 = NSString;
  uint64_t v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v13 = [v12 localizedStringForKey:@"DISABLING_%@_WILL_DISABLE_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  long long v31 = objc_msgSend(v11, "stringWithFormat:", v13, v33, v10);

  uint64_t v14 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v31 message:0 preferredStyle:0];
  uint64_t v15 = (void *)MEMORY[0x1E4FB1410];
  id v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v17 = [v16 localizedStringForKey:@"AUTHORIZATION_STATUS_CHANGE_CANCEL" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v18 = [v15 actionWithTitle:v17 style:1 handler:0];
  [v14 addAction:v18];

  uint64_t v19 = NSString;
  uint64_t v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v21 = [v20 localizedStringForKey:@"AUTHORIZATION_STATUS_DISABLE_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  double v22 = objc_msgSend(v19, "stringWithFormat:", v21, v10);

  long long v23 = (void *)MEMORY[0x1E4FB1410];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __99__HKAuthorizationSettingsViewController_authorizationController_subTypesEnabled_forType_inSection___block_invoke;
  v34[3] = &unk_1E6D53EE0;
  v34[4] = self;
  id v35 = v28;
  id v37 = v8;
  int64_t v38 = a6;
  id v36 = v29;
  id v24 = v8;
  id v25 = v29;
  id v26 = v28;
  long long v27 = [v23 actionWithTitle:v22 style:0 handler:v34];
  [v14 addAction:v27];

  [(HKAuthorizationSettingsViewController *)self presentViewController:v14 animated:1 completion:0];
}

uint64_t __99__HKAuthorizationSettingsViewController_authorizationController_subTypesEnabled_forType_inSection___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) isPrompting] ^ 1;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(a1 + 48), "setEnabled:forType:inSection:commit:", 0, *(void *)(*((void *)&v10 + 1) + 8 * v7++), *(void *)(a1 + 64), v2, (void)v10);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 48) setEnabled:0 forType:*(void *)(a1 + 56) inSection:*(void *)(a1 + 64) commit:v2];
  id v8 = [*(id *)(a1 + 32) tableView];
  [v8 reloadData];

  return [*(id *)(a1 + 32) updateAllowButtonEnabledState];
}

- (id)sectionsForAuthController:(id)a3
{
  uint64_t v4 = [(HKAuthorizationSettingsViewController *)self source];
  if ([v4 _isSiri])
  {
    BOOL v5 = [(HKAuthorizationSettingsViewController *)self isPrompting];

    if (!v5)
    {
      uint64_t v6 = &unk_1F3C1F3F0;
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [(HKAuthorizationSettingsViewController *)self source];
  if ([v7 _isResearchStudy])
  {
    BOOL v8 = [(HKAuthorizationSettingsViewController *)self isPrompting];

    if (v8) {
      [v6 addObject:&unk_1F3C21B68];
    }
  }
  else
  {
  }
  unint64_t v9 = [(HKSourceAuthorizationController *)self->_sourceAuthorizationController countOfTypesInSection:4];
  if (v9 | -[HKSourceAuthorizationController countOfTypesInSection:](self->_sourceAuthorizationController, "countOfTypesInSection:", 6))[v6 addObject:&unk_1F3C21B80]; {
  if ([(HKAuthorizationSettingsViewController *)self _shouldDisplayHealthRecordsRequests])
  }
  {
    [v6 addObject:&unk_1F3C21B98];
  }
  if ([(HKAuthorizationSettingsViewController *)self _shouldDisplaySharingSection]) {
    [v6 addObject:&unk_1F3C21BB0];
  }
  if ([(HKAuthorizationSettingsViewController *)self _shouldDisplayReadingSection]) {
    [v6 addObject:&unk_1F3C21BC8];
  }
  long long v10 = [(HKAuthorizationSettingsViewController *)self source];
  if ([v10 _isApplication])
  {
    long long v11 = [(HKAuthorizationSettingsViewController *)self researchStudyUsageDescription];
    uint64_t v12 = [v11 length];

    if (v12)
    {
      [v6 addObject:&unk_1F3C21BE0];
      if (![(HKAuthorizationSettingsViewController *)self isPrompting]) {
        [v6 addObject:&unk_1F3C21BF8];
      }
    }
  }
  else
  {
  }
LABEL_22:
  return v6;
}

- (BOOL)_shouldDisplayHealthRecordsRequests
{
  return [(HKSourceAuthorizationController *)self->_sourceAuthorizationController isRequestingDocumentAuthorization];
}

- (BOOL)_shouldDisplaySharingSection
{
  uint64_t v2 = [(HKSourceAuthorizationController *)self->_sourceAuthorizationController typesInSection:4];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)_shouldDisplayReadingSection
{
  return [(NSArray *)self->_readingTypeOrdering count] != 0;
}

- (int64_t)authorizationSectionForSection:(int64_t)a3
{
  BOOL v3 = [(NSArray *)self->_actualSections objectAtIndexedSubscript:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)_typeForIndexPath:(id)a3 section:(int64_t *)a4
{
  id v7 = a3;
  int64_t v8 = -[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", [v7 section]);
  if (a4) {
    *a4 = v8;
  }
  unint64_t v9 = 0;
  switch(v8)
  {
    case 0:
    case 1:
    case 2:
    case 5:
    case 7:
    case 8:
      goto LABEL_13;
    case 3:
      unint64_t v9 = [MEMORY[0x1E4F2B2C0] documentTypeForIdentifier:*MEMORY[0x1E4F29A80]];
      goto LABEL_13;
    case 4:
      long long v10 = [(HKSourceAuthorizationController *)self->_sourceAuthorizationController typesInSection:4];
      goto LABEL_7;
    case 6:
      long long v10 = self->_readingTypeOrdering;
LABEL_7:
      unint64_t v9 = v10;
      goto LABEL_8;
    default:
LABEL_8:
      unint64_t v11 = [v7 row];
      if (v11 >= [v9 count])
      {
        uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:a2, self, @"HKAuthorizationSettingsViewController.m", 842, @"Requested index %ld in section %ld does not exist in %@", objc_msgSend(v7, "row"), objc_msgSend(v7, "section"), v9 object file lineNumber description];
      }
      unint64_t v12 = [v7 row];
      if (v12 >= [v9 count])
      {

        unint64_t v9 = 0;
      }
      else
      {
        uint64_t v13 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "row"));

        unint64_t v9 = (void *)v13;
      }
LABEL_13:

      return v9;
  }
}

- (BOOL)_isTypeEnabledAtIndexPath:(id)a3
{
  uint64_t v7 = 0;
  int64_t v4 = [(HKAuthorizationSettingsViewController *)self _typeForIndexPath:a3 section:&v7];
  if (v7 == 3) {
    uint64_t v7 = 6;
  }
  BOOL v5 = -[HKSourceAuthorizationController isTypeEnabled:inSection:](self->_sourceAuthorizationController, "isTypeEnabled:inSection:", v4);

  return v5;
}

- (BOOL)shouldPresent
{
  if ([(HKAuthorizationSettingsViewController *)self _shouldDisplayHealthRecordsRequests]|| [(HKAuthorizationSettingsViewController *)self _shouldDisplaySharingSection])
  {
    return 1;
  }
  return [(HKAuthorizationSettingsViewController *)self _shouldDisplayReadingSection];
}

- (void)_updateHeaderView
{
  id v19 = [(HKAuthorizationSettingsViewController *)self tableView];
  BOOL v3 = objc_alloc_init(HKTitledIconHeaderView);
  int64_t v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  BOOL v5 = [v4 localizedStringForKey:@"HEALTH" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(HKTitledIconHeaderView *)v3 setTitle:v5];

  uint64_t v6 = NSString;
  uint64_t v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  int64_t v8 = [v7 localizedStringForKey:@"%@_WOULD_LIKE_TO_ACCESS_YOUR_HEALTH_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  unint64_t v9 = [(HKSource *)self->_source name];
  long long v10 = objc_msgSend(v6, "stringWithFormat:", v8, v9);
  [(HKTitledIconHeaderView *)v3 setSubtitle:v10];

  [(HKTitledIconHeaderView *)v3 setPrefersLargeTitle:1];
  [(HKTitledIconHeaderView *)v3 setLayoutMarginsWithTableView:v19];
  [(HKTitledIconHeaderView *)v3 frame];
  double v12 = v11;
  double v14 = v13;
  [v19 bounds];
  -[HKTitledIconHeaderView sizeThatFits:](v3, "sizeThatFits:", v15, v16);
  -[HKTitledIconHeaderView setFrame:](v3, "setFrame:", v12, v14, v17, v18);
  [v19 setTableHeaderView:v3];
}

- (void)_configurationFailedWithError:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
    -[HKAuthorizationSettingsViewController _configurationFailedWithError:]();
  }
  [(HKAuthorizationSettingsViewController *)self _finishWithError:v4];
}

- (HKHealthPrivacyServicePromptControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKHealthPrivacyServicePromptControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKSource)source
{
  return self->_source;
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)updateDescription
{
  return self->_updateDescription;
}

- (void)setUpdateDescription:(id)a3
{
}

- (NSString)shareDescription
{
  return self->_shareDescription;
}

- (void)setShareDescription:(id)a3
{
}

- (NSString)researchStudyUsageDescription
{
  return self->_researchStudyUsageDescription;
}

- (void)setResearchStudyUsageDescription:(id)a3
{
}

- (NSSet)typesToShare
{
  return self->_typesToShare;
}

- (void)setTypesToShare:(id)a3
{
}

- (NSSet)typesToRead
{
  return self->_typesToRead;
}

- (void)setTypesToRead:(id)a3
{
}

- (HKSourceAuthorizationController)sourceAuthorizationController
{
  return self->_sourceAuthorizationController;
}

- (void)setSourceAuthorizationController:(id)a3
{
}

- (UIBarButtonItem)cancelButtonItem
{
  return self->_cancelButtonItem;
}

- (void)setCancelButtonItem:(id)a3
{
}

- (UIBarButtonItem)doneButtonItem
{
  return self->_doneButtonItem;
}

- (void)setDoneButtonItem:(id)a3
{
}

- (NSArray)actualSections
{
  return (NSArray *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setActualSections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
  objc_storeStrong((id *)&self->_sourceAuthorizationController, 0);
  objc_storeStrong((id *)&self->_typesToRead, 0);
  objc_storeStrong((id *)&self->_typesToShare, 0);
  objc_storeStrong((id *)&self->_researchStudyUsageDescription, 0);
  objc_storeStrong((id *)&self->_shareDescription, 0);
  objc_storeStrong((id *)&self->_updateDescription, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_readingTypeOrdering, 0);
  objc_storeStrong((id *)&self->_actualSections, 0);
  objc_storeStrong((id *)&self->_documents, 0);
}

- (void)_finishWithError:(void *)a1 .cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_1_3();
  id v3 = v2;
  _os_log_debug_impl(&dword_1E0B26000, v1, OS_LOG_TYPE_DEBUG, "%@: dismissing", v4, 0xCu);
}

- (void)_localizedSourceExplanationWithDescription:forReadingSection:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, v0, v1, "%{public}@: Attempt to synthesize explanation for %{public}@ before fetching BAR status");
}

void __75__HKAuthorizationSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, a2, a3, "Failed to launch \"%{public}@\": %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)pickerControllerDidFinish:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  _os_log_error_impl(&dword_1E0B26000, v0, OS_LOG_TYPE_ERROR, "Document selection failed with error: %{public}@.", v1, 0xCu);
}

- (void)_configurationFailedWithError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  _os_log_error_impl(&dword_1E0B26000, v0, OS_LOG_TYPE_ERROR, "Failed to complete configuration: %{public}@", v1, 0xCu);
}

@end