@interface WDDataListViewController
- (BOOL)_dataProviderEnabled;
- (BOOL)_displayGuestModeAlert;
- (BOOL)_hasSpinnerRowRowAtIndexPath:(id)a3;
- (BOOL)_shouldShowSpinnerRowInSection:(int64_t)a3;
- (BOOL)isEditEnabled;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (HKDisplayType)displayType;
- (NSDate)scrollToDate;
- (UIBarButtonItem)leftBarButtonItemReference;
- (WDDataListViewController)initWithDisplayType:(id)a3 profile:(id)a4 dataProvider:(id)a5 usingInsetStyling:(BOOL)a6;
- (WDDataListViewControllerDataProvider)dataProvider;
- (WDProfile)profile;
- (_HKMedicalIDData)medicalIDData;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_defaultCellForTableView:(id)a3 cellStyle:(int64_t)a4 indexPath:(id)a5 object:(id)a6;
- (id)_deleteAllDataAlertMessage;
- (id)_overridenDisplayImageForSource:(id)a3;
- (id)_quantityCellForTableView:(id)a3 dataObjectSource:(id)a4;
- (id)_rightBarButtonItems;
- (id)_sampleAtIndexPath:(id)a3;
- (id)_sampleTypesForDeleteAll;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)_closestRowToDate:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_calendarDateSelectorButtonTapped:(id)a3;
- (void)_dataProviderDidUpdate;
- (void)_deleteAllButtonTapped:(id)a3;
- (void)_deleteAllPregnancySamplesConfirmationSender:(id)a3 deleteBlock:(id)a4;
- (void)_deleteAllWithOptions:(unint64_t)a3;
- (void)_deleteAssociatedSamplesConfirmationPlural:(BOOL)a3 sender:(id)a4 deleteBlock:(id)a5;
- (void)_deleteWorkoutSamplesConfirmationPlural:(BOOL)a3 sender:(id)a4 deleteBlock:(id)a5;
- (void)_fetchMedicalIDData;
- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 cell:(id)a5 fetchError:(id)a6;
- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 cell:(id)a5 tableView:(id)a6 fetchError:(id)a7;
- (void)_loadIconForSourceObject:(id)a3 onCell:(id)a4 ofTableView:(id)a5;
- (void)_reloadAllData;
- (void)_reloadAllDataScrolledToDate:(id)a3;
- (void)_removePregnancyInformationFromMedicalID;
- (void)_removePregnancyInformationFromMedicalIDConfirmationSender:(id)a3 deleteBlock:(id)a4;
- (void)_tapGestureRecognizerAction:(id)a3;
- (void)_updateActivityForViewDidAppear;
- (void)_updateNavigationTitle;
- (void)_updateRightBarButtonItems;
- (void)dealloc;
- (void)monthViewController:(id)a3 didSelectDate:(id)a4;
- (void)presentDeleteConfirmation:(id)a3;
- (void)resetDataAndScrollToDate:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setLeftBarButtonItemReference:(id)a3;
- (void)setMedicalIDData:(id)a3;
- (void)setScrollToDate:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation WDDataListViewController

- (WDDataListViewController)initWithDisplayType:(id)a3 profile:(id)a4 dataProvider:(id)a5 usingInsetStyling:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v35.receiver = self;
  v35.super_class = (Class)WDDataListViewController;
  v14 = [(HKTableViewController *)&v35 initWithUsingInsetStyling:v6];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_displayType, a3);
    objc_storeStrong((id *)&v15->_dataProvider, a5);
    objc_storeStrong((id *)&v15->_profile, a4);
    scrollToDate = v15->_scrollToDate;
    v15->_scrollToDate = 0;

    id v17 = objc_alloc(MEMORY[0x263F1C468]);
    v18 = WDBundle();
    v19 = [v18 localizedStringForKey:@"DELETE_ALL_BUTTON_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    uint64_t v20 = [v17 initWithTitle:v19 style:0 target:v15 action:sel__deleteAllButtonTapped_];
    deleteAllButtonItem = v15->_deleteAllButtonItem;
    v15->_deleteAllButtonItem = (UIBarButtonItem *)v20;

    v22 = [NSString healthAccessibilityIdentifier:0 suffix:@"DataListViewController.DeleteAllButton"];
    [(UIBarButtonItem *)v15->_deleteAllButtonItem setAccessibilityIdentifier:v22];

    v23 = [NSString healthAccessibilityIdentifier:0 suffix:@"DataListViewController.EditButton"];
    v24 = [(WDDataListViewController *)v15 editButtonItem];
    [v24 setAccessibilityIdentifier:v23];

    v15->_cellStyle = [(WDDataListViewControllerDataProvider *)v15->_dataProvider cellStyle];
    v25 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v15->_showOriginalAppProvenance = [v25 BOOLForKey:@"ShowOriginalAppProvenance"];

    [(WDDataListViewController *)v15 _updateNavigationTitle];
    [(WDDataListViewController *)v15 _updateRightBarButtonItems];
    [(WDDataListViewController *)v15 setModalPresentationStyle:2];
    v26 = [MEMORY[0x263F08A00] defaultCenter];
    [v26 addObserver:v15 selector:sel__localeDidChange_ name:*MEMORY[0x263EFF458] object:0];

    v27 = [MEMORY[0x263F08A00] defaultCenter];
    [v27 addObserver:v15 selector:sel__displayTypeStringsChanged_ name:*MEMORY[0x263F46338] object:0];

    id v28 = objc_alloc(MEMORY[0x263F0A4C8]);
    v29 = [(WDProfile *)v15->_profile healthStore];
    uint64_t v30 = [v28 initWithHealthStore:v29];
    medicalIDStore = v15->_medicalIDStore;
    v15->_medicalIDStore = (HKMedicalIDStore *)v30;

    v32 = [(HKDisplayType *)v15->_displayType displayTypeIdentifierString];
    v33 = HKDisplayTypeIdentifierToString();
    LODWORD(v28) = [v32 isEqualToString:v33];

    if (v28) {
      [(WDDataListViewController *)v15 _fetchMedicalIDData];
    }
  }

  return v15;
}

- (void)_updateNavigationTitle
{
  v3 = [(WDProfile *)self->_profile healthStore];
  v4 = WDGetProfileNameForHealthStore(v3);
  [(WDDataListViewControllerDataProvider *)self->_dataProvider setProfileName:v4];

  v5 = [(WDDataListViewControllerDataProvider *)self->_dataProvider profileName];

  if (v5)
  {
    BOOL v6 = NSString;
    WDBundle();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v7 = [v10 localizedStringForKey:@"ALL_DATA_TITLE_%@" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Tinker"];
    v8 = [(WDDataListViewControllerDataProvider *)self->_dataProvider profileName];
    v9 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v8);
    [(WDDataListViewController *)self setTitle:v9];
  }
  else
  {
    WDBundle();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v7 = [v10 localizedStringForKey:@"ALL_DATA_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    [(WDDataListViewController *)self setTitle:v7];
  }
}

- (WDProfile)profile
{
  return self->_profile;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(WDDataListViewControllerDataProvider *)self->_dataProvider stopCollectingData];
  v4.receiver = self;
  v4.super_class = (Class)WDDataListViewController;
  [(WDDataListViewController *)&v4 dealloc];
}

- (BOOL)isEditEnabled
{
  v2 = [(WDDataListViewController *)self profile];
  v3 = [v2 healthStore];
  objc_super v4 = [v3 profileIdentifier];
  BOOL v5 = [v4 type] == 1;

  return v5;
}

- (void)_fetchMedicalIDData
{
  objc_initWeak(&location, self);
  medicalIDStore = self->_medicalIDStore;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__WDDataListViewController__fetchMedicalIDData__block_invoke;
  v4[3] = &unk_26458EC40;
  objc_copyWeak(&v5, &location);
  [(HKMedicalIDStore *)medicalIDStore fetchMedicalIDDataWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__WDDataListViewController__fetchMedicalIDData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (v6)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __47__WDDataListViewController__fetchMedicalIDData__block_invoke_cold_1((uint64_t)v6, v9);
    }
  }
  else
  {
    [WeakRetained setMedicalIDData:v5];
  }
}

- (id)_sampleTypesForDeleteAll
{
  v14[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HKDisplayType *)self->_displayType displayTypeIdentifier];
  displayType = self->_displayType;
  if (v3 == 139)
  {
    id v5 = [(HKDisplayType *)displayType sampleType];
    v14[0] = v5;
    id v6 = [MEMORY[0x263F0A708] heartbeatSeriesType];
    v14[1] = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v8 = [(HKDisplayType *)displayType displayTypeIdentifier];
  uint64_t v9 = [(HKDisplayType *)self->_displayType sampleType];
  id v5 = (void *)v9;
  if (v8 == 80)
  {
    v13[0] = v9;
    id v6 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09C20]];
    v13[1] = v6;
    id v10 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09C28]];
    v13[2] = v10;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];

    goto LABEL_5;
  }
  uint64_t v12 = v9;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
LABEL_7:

  return v7;
}

- (void)_reloadAllDataScrolledToDate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__WDDataListViewController__reloadAllDataScrolledToDate___block_invoke;
  v6[3] = &unk_26458DB58;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __57__WDDataListViewController__reloadAllDataScrolledToDate___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _dataProviderEnabled] & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    && ([*(id *)(*(void *)(a1 + 32) + 1096) hasCompleteDataSet] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 1064) removeFromSuperview];
    uint64_t v2 = 1;
  }
  else
  {
    if ([*(id *)(a1 + 32) isEditing]) {
      [*(id *)(a1 + 32) setEditing:0];
    }
    uint64_t v3 = [*(id *)(a1 + 32) view];
    [v3 addSubview:*(void *)(*(void *)(a1 + 32) + 1064)];

    uint64_t v2 = 0;
  }
  [*(id *)(a1 + 32) _updateRightBarButtonItems];
  id v4 = [*(id *)(a1 + 32) tableView];
  [v4 setScrollEnabled:v2];

  id v5 = [*(id *)(a1 + 32) editButtonItem];
  [v5 setEnabled:v2];

  id v6 = [*(id *)(a1 + 32) tableView];
  [v6 reloadData];

  if (*(void *)(a1 + 40))
  {
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_closestRowToDate:");
    if (v7 < 1)
    {
      id v11 = *(void **)(*(void *)(a1 + 32) + 1096);
      [v11 viewControllerIsNearEndOfScreen];
    }
    else
    {
      double v8 = (double)v7;
      [*(id *)(*(void *)(a1 + 32) + 1096) customEstimatedCellHeight];
      double v10 = v8 * v9 + -16.0;
      id v12 = [*(id *)(a1 + 32) tableView];
      objc_msgSend(v12, "setContentOffset:animated:", 0, 0.0, v10);
    }
  }
}

- (void)_reloadAllData
{
}

- (int64_t)_closestRowToDate:(id)a3
{
  id v4 = a3;
  id v5 = [(WDDataListViewController *)self dataProvider];
  uint64_t v6 = [v5 numberOfObjectsForSection:0];

  int64_t v7 = v6 - 1;
  if (v6 >= 1)
  {
    int64_t v8 = 0;
    BOOL v9 = 1;
    while (1)
    {
      double v10 = [(WDDataListViewController *)self dataProvider];
      id v11 = [v10 objectAtIndex:v8 forSection:0];

      id v12 = [MEMORY[0x263EFF8F0] currentCalendar];
      id v13 = [v11 endDate];
      v14 = [v12 startOfDayForDate:v13];

      LODWORD(v12) = objc_msgSend(v14, "hk_isBeforeOrEqualToDate:", v4);
      if (v12) {
        break;
      }
      BOOL v9 = v6 > ++v8;
      if (v6 == v8)
      {
        int64_t v8 = v6;
        break;
      }
    }
    int64_t v7 = v6 - 1;
    if (v9) {
      int64_t v7 = v8;
    }
  }

  return v7;
}

- (BOOL)_dataProviderEnabled
{
  uint64_t v3 = [(WDDataListViewControllerDataProvider *)self->_dataProvider numberOfSections];
  if (v3 < 1) {
    return 0;
  }
  uint64_t v4 = v3;
  if ([(WDDataListViewControllerDataProvider *)self->_dataProvider numberOfObjectsForSection:0] > 0)return 1; {
  uint64_t v6 = 1;
  }
  do
  {
    uint64_t v7 = v6;
    if (v4 == v6) {
      break;
    }
    uint64_t v8 = [(WDDataListViewControllerDataProvider *)self->_dataProvider numberOfObjectsForSection:v6];
    uint64_t v6 = v7 + 1;
  }
  while (v8 < 1);
  return v4 > v7;
}

- (BOOL)_displayGuestModeAlert
{
  uint64_t v3 = (void *)MEMORY[0x263F1C3F8];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v5 = [v4 localizedStringForKey:@"GUEST_MODE_DELETE_HEALTH_TITLE" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  uint64_t v6 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v7 = [v6 localizedStringForKey:@"GUEST_MODE_DELETE_HEALTH_DESCRIPTION" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  uint64_t v8 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  BOOL v9 = (void *)MEMORY[0x263F1C3F0];
  double v10 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v11 = [v10 localizedStringForKey:@"SHARE_ALERT_OK" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  id v12 = [v9 actionWithTitle:v11 style:0 handler:0];

  [v8 addAction:v12];
  [(WDDataListViewController *)self presentViewController:v8 animated:1 completion:0];

  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDDataListViewController;
  [(WDDataListViewController *)&v4 viewDidAppear:a3];
  [(WDDataListViewController *)self _updateActivityForViewDidAppear];
}

- (void)viewDidLoad
{
  v34.receiver = self;
  v34.super_class = (Class)WDDataListViewController;
  [(HKTableViewController *)&v34 viewDidLoad];
  uint64_t v3 = [NSString healthAccessibilityIdentifier:0 suffix:@"DataListViewController.View"];
  objc_super v4 = [(WDDataListViewController *)self view];
  [v4 setAccessibilityIdentifier:v3];

  id v5 = objc_alloc(MEMORY[0x263F1CC50]);
  uint64_t v6 = WDBundle();
  uint64_t v7 = [v6 localizedStringForKey:@"CHART_NO_DATA" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  uint64_t v8 = (_UIContentUnavailableView *)objc_msgSend(v5, "initWithFrame:title:style:", v7, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  noContentView = self->_noContentView;
  self->_noContentView = v8;

  if ([(WDDataListViewControllerDataProvider *)self->_dataProvider cellStyle] == 2)
  {
    dataProvider = self->_dataProvider;
    id v11 = [(WDDataListViewController *)self tableView];
    [(WDDataListViewControllerDataProvider *)dataProvider customizeTableView:v11];

    id v12 = [(WDDataListViewController *)self tableView];
    [(WDDataListViewControllerDataProvider *)self->_dataProvider customEstimatedCellHeight];
    objc_msgSend(v12, "setEstimatedRowHeight:");

    id v13 = [(WDDataListViewController *)self tableView];
    [(WDDataListViewControllerDataProvider *)self->_dataProvider customCellHeight];
    v15 = v13;
  }
  else
  {
    v16 = [(WDDataListViewController *)self tableView];
    [v16 setEstimatedRowHeight:*MEMORY[0x263F46380]];

    v15 = [(WDDataListViewController *)self tableView];
    id v13 = v15;
    double v14 = *MEMORY[0x263F1D600];
  }
  [v15 setRowHeight:v14];

  id v17 = [(WDDataListViewController *)self tableView];
  uint64_t v18 = objc_opt_class();
  v19 = +[WDSpinnerTableViewCell defaultReuseIdentifier];
  [v17 registerClass:v18 forCellReuseIdentifier:v19];

  uint64_t v20 = HKUIJoinStringsForAutomationIdentifier();
  v21 = [(WDDataListViewController *)self tableView];
  [v21 setAccessibilityIdentifier:v20];

  v22 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
  spinner = self->_spinner;
  self->_spinner = v22;

  [(UIActivityIndicatorView *)self->_spinner setHidesWhenStopped:1];
  v24 = [(WDDataListViewController *)self view];
  [v24 addSubview:self->_spinner];

  [(UIActivityIndicatorView *)self->_spinner startAnimating];
  v25 = [MEMORY[0x263F0A980] sharedBehavior];
  LODWORD(v21) = [v25 isAppleInternalInstall];

  if (v21)
  {
    v26 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__tapGestureRecognizerAction_];
    navigationBarTapGestureRecognizer = self->_navigationBarTapGestureRecognizer;
    self->_navigationBarTapGestureRecognizer = v26;

    [(UITapGestureRecognizer *)self->_navigationBarTapGestureRecognizer setNumberOfTapsRequired:3];
    id v28 = [(WDDataListViewController *)self navigationController];
    v29 = [v28 navigationBar];
    [v29 addGestureRecognizer:self->_navigationBarTapGestureRecognizer];
  }
  objc_initWeak(&location, self);
  uint64_t v30 = self->_dataProvider;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __39__WDDataListViewController_viewDidLoad__block_invoke;
  v31[3] = &unk_26458DC70;
  objc_copyWeak(&v32, &location);
  [(WDDataListViewControllerDataProvider *)v30 startCollectingDataWithUpdateHandler:v31];
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

void __39__WDDataListViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__WDDataListViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_26458DC70;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __39__WDDataListViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dataProviderDidUpdate];
}

- (void)_dataProviderDidUpdate
{
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  uint64_t v3 = [(WDDataListViewController *)self scrollToDate];
  [(WDDataListViewController *)self _reloadAllDataScrolledToDate:v3];

  [(WDDataListViewController *)self setScrollToDate:0];

  [(WDDataListViewController *)self _updateRightBarButtonItems];
}

- (void)viewWillLayoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)WDDataListViewController;
  [(WDDataListViewController *)&v30 viewWillLayoutSubviews];
  uint64_t v3 = [(WDDataListViewController *)self navigationController];
  objc_super v4 = [v3 navigationBar];
  [v4 frame];
  double v6 = v5;

  uint64_t v7 = [(WDDataListViewController *)self tabBarController];
  uint64_t v8 = [v7 tabBar];
  [v8 frame];
  double v10 = v9;

  id v11 = [(WDDataListViewController *)self view];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;

  -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:", v13 * 0.5, (v15 - v6 - v10) * 0.5);
  noContentView = self->_noContentView;
  id v17 = [(WDDataListViewController *)self view];
  [v17 bounds];
  -[_UIContentUnavailableView setFrame:](noContentView, "setFrame:");

  uint64_t v18 = self->_noContentView;
  v19 = [(WDDataListViewController *)self view];
  [v19 center];
  double v21 = v20;
  v22 = [(WDDataListViewController *)self view];
  [v22 center];
  double v24 = v23;
  v25 = [(WDDataListViewController *)self view];
  [v25 safeAreaInsets];
  double v27 = v26;
  id v28 = [(WDDataListViewController *)self view];
  [v28 safeAreaInsets];
  -[_UIContentUnavailableView setCenter:](v18, "setCenter:", v21, v24 - (v27 + v29) * 0.5);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  double v6 = v5;
  [v4 contentSize];
  double v8 = v7;
  [v4 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v22.origin.x = v10;
  v22.origin.y = v12;
  v22.size.width = v14;
  v22.size.height = v16;
  double v17 = v8 - (v6 + CGRectGetHeight(v22));
  uint64_t v18 = [(WDDataListViewController *)self view];
  [v18 bounds];
  double Height = CGRectGetHeight(v23);

  if (v17 < Height)
  {
    dataProvider = self->_dataProvider;
    [(WDDataListViewControllerDataProvider *)dataProvider viewControllerIsNearEndOfScreen];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(WDDataListViewControllerDataProvider *)self->_dataProvider numberOfSections];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4 = objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", @"HeaderView", a4);
  double v5 = [v4 textLabel];
  [v5 setNumberOfLines:0];

  return v4;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x263F1D600];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return (id)[(WDDataListViewControllerDataProvider *)self->_dataProvider titleForSection:a4];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v6 = [(WDDataListViewController *)self dataProvider];
  uint64_t v7 = [v6 numberOfObjectsForSection:a4];

  return v7 + [(WDDataListViewController *)self _shouldShowSpinnerRowInSection:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(WDDataListViewController *)self _hasSpinnerRowRowAtIndexPath:v7];
  dataProvider = self->_dataProvider;
  if (!v8)
  {
    CGFloat v10 = (void *)[v7 row];
    double v11 = -[WDDataListViewControllerDataProvider objectAtIndex:forSection:](dataProvider, "objectAtIndex:forSection:", v10, [v7 section]);
    int64_t cellStyle = self->_cellStyle;
    if (cellStyle == 2)
    {
      uint64_t v13 = [(WDDataListViewControllerDataProvider *)self->_dataProvider customCellForObject:v11 indexPath:v7 tableView:v6];
    }
    else if (cellStyle == 1)
    {
      uint64_t v13 = [(WDDataListViewController *)self _defaultCellForTableView:v6 cellStyle:3 indexPath:v7 object:v11];
    }
    else
    {
      if (cellStyle)
      {
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v13 = [(WDDataListViewController *)self _quantityCellForTableView:v6 dataObjectSource:v11];
    }
    CGFloat v10 = (void *)v13;
    goto LABEL_12;
  }
  if (objc_opt_respondsToSelector())
  {
    CGFloat v10 = [(WDDataListViewControllerDataProvider *)self->_dataProvider customLoadingCellForRowAtIndexPath:v7 tableView:v6];
  }
  else
  {
    CGFloat v14 = +[WDSpinnerTableViewCell defaultReuseIdentifier];
    CGFloat v10 = [v6 dequeueReusableCellWithIdentifier:v14];
  }
LABEL_13:

  return v10;
}

- (void)_loadIconForSourceObject:(id)a3 onCell:(id)a4 ofTableView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [v8 sourceRevision];
  objc_super v30 = [v11 source];

  if ([(HKDisplayType *)self->_displayType displayTypeIdentifier] != 5) {
    goto LABEL_7;
  }
  int v12 = [v30 _isPreferredSource];
  char v29 = [v30 _isApplication];
  uint64_t v13 = [v8 device];
  CGFloat v14 = [v13 localIdentifier];

  [v30 bundleIdentifier];
  id v15 = v10;
  double v17 = v16 = v9;
  uint64_t v18 = [v8 device];
  v19 = [v18 localIdentifier];
  char v20 = [v17 isEqualToString:v19];

  id v9 = v16;
  id v10 = v15;
  if (!v12) {
    goto LABEL_7;
  }
  if ((v29 & 1) == 0 && v14 && (v20 & 1) == 0)
  {
    double v21 = HKBluetoothIcon();
    CGRect v22 = [v9 iconImageView];
    [v22 setImage:v21];
  }
  else
  {
LABEL_7:
    CGRect v23 = [v8 device];
    int v24 = [v23 _isConnectedGymDevice];

    if (!v24)
    {
      objc_initWeak(&location, self);
      double v27 = [MEMORY[0x263F463C8] sharedImageManager];
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __72__WDDataListViewController__loadIconForSourceObject_onCell_ofTableView___block_invoke;
      v36[3] = &unk_26458DBD0;
      id v28 = v9;
      id v37 = v28;
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __72__WDDataListViewController__loadIconForSourceObject_onCell_ofTableView___block_invoke_2;
      v31[3] = &unk_26458DC20;
      objc_copyWeak(&v35, &location);
      id v32 = v30;
      id v33 = v28;
      id v34 = v10;
      [v27 loadIconForSource:v32 syncHandler:v36 asyncHandler:v31];

      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
      goto LABEL_11;
    }
    double v21 = [MEMORY[0x263F463C8] sharedImageManager];
    CGRect v22 = [v8 device];
    v25 = [v21 iconForDevice:v22];
    double v26 = [v9 iconImageView];
    [v26 setImage:v25];
  }
LABEL_11:
}

void __72__WDDataListViewController__loadIconForSourceObject_onCell_ofTableView___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 iconImageView];
  [v4 setImage:v3];
}

void __72__WDDataListViewController__loadIconForSourceObject_onCell_ofTableView___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__WDDataListViewController__loadIconForSourceObject_onCell_ofTableView___block_invoke_3;
  v9[3] = &unk_26458DBF8;
  objc_copyWeak(&v15, a1 + 7);
  id v10 = v5;
  id v11 = a1[4];
  id v12 = a1[5];
  id v13 = a1[6];
  id v14 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);

  objc_destroyWeak(&v15);
}

void __72__WDDataListViewController__loadIconForSourceObject_onCell_ofTableView___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained _handleReturnedImage:*(void *)(a1 + 32) forSource:*(void *)(a1 + 40) cell:*(void *)(a1 + 48) tableView:*(void *)(a1 + 56) fetchError:*(void *)(a1 + 64)];
}

- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 cell:(id)a5 tableView:(id)a6 fetchError:(id)a7
{
  id v20 = a3;
  id v12 = a5;
  if (v20 && !a7)
  {
    id v13 = a4;
    id v14 = [a6 indexPathForCell:v12];
    id v15 = [(WDDataListViewController *)self dataProvider];
    id v16 = objc_msgSend(v15, "objectAtIndex:forSection:", objc_msgSend(v14, "row"), objc_msgSend(v14, "section"));
    double v17 = [v16 sourceRevision];
    uint64_t v18 = [v17 source];

    LODWORD(v15) = [v18 isEqual:v13];
    if (v15)
    {
      v19 = [v12 iconImageView];
      [v19 setImage:v20];
    }
  }
}

- (id)_quantityCellForTableView:(id)a3 dataObjectSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 dequeueReusableCellWithIdentifier:@"QuantityCell"];
  if (!v8) {
    id v8 = [[WDDataTableViewCell alloc] initWithStyle:1 reuseIdentifier:@"QuantityCell"];
  }
  [(WDDataTableViewCell *)v8 setAccessoryType:1];
  id v9 = [(WDDataListViewController *)self dataProvider];
  id v10 = [v9 textForObject:v7];
  [(WDDataTableViewCell *)v8 setDisplayValue:v10];

  id v11 = [(WDDataListViewController *)self dataProvider];
  id v12 = [v11 secondaryTextForObject:v7];
  [(WDDataTableViewCell *)v8 setDateString:v12];

  id v13 = [(WDDataListViewController *)self dataProvider];
  -[WDDataTableViewCell setDisplayValueAdjustsFontSizeToFitWidth:](v8, "setDisplayValueAdjustsFontSizeToFitWidth:", [v13 textAdjustsFontSizeToFitWidth]);

  id v14 = [(WDDataListViewController *)self dataProvider];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_7;
  }
  id v15 = [(WDDataListViewController *)self dataProvider];
  char v16 = [v15 shouldHideSourceImageForObject:v7];

  if ((v16 & 1) == 0)
  {
LABEL_7:
    double v17 = [v7 sourceRevision];
    uint64_t v18 = [v17 source];

    [(WDDataTableViewCell *)v8 setSource:v18];
    v19 = [v7 sourceRevision];
    id v20 = [v19 productType];

    objc_initWeak(&location, self);
    double v21 = [MEMORY[0x263F463C8] sharedImageManager];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __71__WDDataListViewController__quantityCellForTableView_dataObjectSource___block_invoke;
    v33[3] = &unk_26458EC68;
    CGRect v22 = v8;
    id v34 = v22;
    id v35 = self;
    id v23 = v18;
    id v36 = v23;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __71__WDDataListViewController__quantityCellForTableView_dataObjectSource___block_invoke_2;
    v29[3] = &unk_26458ECB8;
    objc_copyWeak(&v32, &location);
    id v24 = v23;
    id v30 = v24;
    v25 = v22;
    v31 = v25;
    [v21 loadIconForSource:v24 productType:v20 syncHandler:v33 asyncHandler:v29];

    double v26 = v31;
    double v27 = v25;

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __71__WDDataListViewController__quantityCellForTableView_dataObjectSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = a2;
  uint64_t v6 = [v3 _overridenDisplayImageForSource:v4];
  id v9 = (id)v6;
  if (v6) {
    id v7 = (id)v6;
  }
  else {
    id v7 = v5;
  }
  id v8 = [*(id *)(a1 + 32) imageView];
  [v8 setImage:v7];
}

void __71__WDDataListViewController__quantityCellForTableView_dataObjectSource___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__WDDataListViewController__quantityCellForTableView_dataObjectSource___block_invoke_3;
  block[3] = &unk_26458EC90;
  objc_copyWeak(&v14, a1 + 6);
  id v10 = v5;
  id v11 = a1[4];
  id v12 = a1[5];
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v14);
}

void __71__WDDataListViewController__quantityCellForTableView_dataObjectSource___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _handleReturnedImage:*(void *)(a1 + 32) forSource:*(void *)(a1 + 40) cell:*(void *)(a1 + 48) fetchError:*(void *)(a1 + 56)];
}

- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 cell:(id)a5 fetchError:(id)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v18)
  {
    if (!v12)
    {
      id v13 = [v11 source];
      int v14 = [v13 isEqual:v10];

      if (v14)
      {
        id v15 = [(WDDataListViewController *)self _overridenDisplayImageForSource:v10];
        if (v15) {
          id v16 = v15;
        }
        else {
          id v16 = v18;
        }
        double v17 = [v11 imageView];
        [v17 setImage:v16];
      }
    }
  }
}

- (id)_defaultCellForTableView:(id)a3 cellStyle:(int64_t)a4 indexPath:(id)a5 object:(id)a6
{
  id v9 = a6;
  id v10 = a3;
  id v11 = [v10 dequeueReusableCellWithIdentifier:@"WDDataListViewControllerCell"];
  if (!v11) {
    id v11 = [[WDDataListViewControllerCell alloc] initWithStyle:a4 reuseIdentifier:@"WDDataListViewControllerCell"];
  }
  id v12 = [(WDDataListViewControllerDataProvider *)self->_dataProvider textForObject:v9];
  id v13 = [(WDDataListViewControllerDataProvider *)self->_dataProvider secondaryTextForObject:v9];
  int v14 = [(WDDataListViewControllerCell *)v11 titleTextLabel];
  [v14 setText:v12];

  id v15 = [(WDDataListViewControllerCell *)v11 subtitleTextLabel];
  [v15 setText:v13];

  [(WDDataListViewController *)self _loadIconForSourceObject:v9 onCell:v11 ofTableView:v10];

  return v11;
}

- (id)_overridenDisplayImageForSource:(id)a3
{
  id v4 = a3;
  if ([(HKDisplayType *)self->_displayType displayTypeIdentifier] == 14
    && ([v4 bundleIdentifier],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:@"com.apple.NanoOxygenSaturation.watchkitapp"],
        v5,
        v6)
    && !self->_showOriginalAppProvenance)
  {
    id v9 = [v4 _productType];
    int v10 = [v9 hasPrefix:*MEMORY[0x263F09BB0]];

    if (v10)
    {
      id v11 = [v4 _productType];
    }
    else
    {
      id v11 = @"Watch";
    }
    id v12 = [MEMORY[0x263F46A30] appleDeviceIconForHardwareVersion:v11];
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      HKDeviceImage();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v7 = v14;
  }
  else if ([v4 _isBTLEServer])
  {
    id v7 = HKBluetoothIcon();
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (![(WDDataListViewController *)self _hasSpinnerRowRowAtIndexPath:v6])
  {
    id v7 = [(WDDataListViewControllerDataProvider *)self->_dataProvider viewControllerForItemAtIndexPath:v6];
    id v8 = [(WDDataListViewController *)self navigationController];
    [v8 pushViewController:v7 animated:1];

    [v9 deselectRowAtIndexPath:v6 animated:1];
  }
}

- (id)_sampleAtIndexPath:(id)a3
{
  dataProvider = self->_dataProvider;
  id v4 = a3;
  uint64_t v5 = [v4 row];
  uint64_t v6 = [v4 section];

  return (id)[(WDDataListViewControllerDataProvider *)dataProvider objectAtIndex:v5 forSection:v6];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(WDDataListViewController *)self isEditEnabled])
  {
    if (objc_opt_respondsToSelector()) {
      char v6 = [(WDDataListViewControllerDataProvider *)self->_dataProvider canEditRowAtIndexPath:v5];
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = v9;
  if (a4 == 1)
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __75__WDDataListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
    v29[3] = &unk_26458ECE0;
    void v29[4] = self;
    id v11 = v9;
    id v30 = v11;
    id v12 = v8;
    id v31 = v12;
    id v13 = (void (**)(void, void))MEMORY[0x223C798A0](v29);
    id v14 = [v12 cellForRowAtIndexPath:v11];
    objc_initWeak(&location, self);
    id v15 = [(HKDisplayType *)self->_displayType behavior];
    int v16 = [v15 supportsAssociatedSamples];

    displayType = self->_displayType;
    if (v16)
    {
      if ([(HKDisplayType *)displayType displayTypeIdentifier] == 79)
      {
        id v18 = [(WDDataListViewController *)self _sampleAtIndexPath:v11];
        if ([v18 _activityMoveMode] == 2) {
          [(WDDataListViewController *)self _deleteWorkoutSamplesConfirmationPlural:0 sender:v14 deleteBlock:v13];
        }
        else {
          [(WDDataListViewController *)self _deleteAssociatedSamplesConfirmationPlural:0 sender:v14 deleteBlock:v13];
        }
LABEL_15:

        goto LABEL_16;
      }
      [(WDDataListViewController *)self _deleteAssociatedSamplesConfirmationPlural:0 sender:v14 deleteBlock:v13];
    }
    else
    {
      v19 = [(HKDisplayType *)displayType displayTypeIdentifierString];
      id v20 = HKDisplayTypeIdentifierToString();
      if ([v19 isEqualToString:v20])
      {
        double v21 = [(_HKMedicalIDData *)self->_medicalIDData pregnancyEstimatedDueDate];

        if (v21)
        {
          id v18 = [(WDDataListViewController *)self _sampleAtIndexPath:v11];
          CGRect v22 = [v18 endDate];
          id v23 = [MEMORY[0x263EFF910] distantFuture];
          int v24 = [v22 isEqualToDate:v23];

          if (v24)
          {
            v25[0] = MEMORY[0x263EF8330];
            v25[1] = 3221225472;
            v25[2] = __75__WDDataListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_3;
            v25[3] = &unk_26458ED08;
            objc_copyWeak(&v27, &location);
            double v26 = v13;
            [(WDDataListViewController *)self _removePregnancyInformationFromMedicalIDConfirmationSender:v14 deleteBlock:v25];

            objc_destroyWeak(&v27);
          }
          else
          {
            v13[2](v13, 2);
          }
          goto LABEL_15;
        }
      }
      else
      {
      }
      v13[2](v13, 2);
    }
LABEL_16:
    objc_destroyWeak(&location);
  }
}

void __75__WDDataListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(void *a1, uint64_t a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  char v6 = *(void **)(v4 + 1096);
  id v7 = [*(id *)(v4 + 1032) healthStore];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__WDDataListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2;
  v11[3] = &unk_26458DC48;
  v11[4] = a1[4];
  [v6 deleteObjectsAtIndexPath:v5 healthStore:v7 options:a2 completion:v11];

  char v10 = 0;
  objc_msgSend(*(id *)(a1[4] + 1096), "removeObjectAtIndex:forSection:sectionRemoved:", objc_msgSend((id)a1[5], "row"), objc_msgSend((id)a1[5], "section"), &v10);
  id v8 = (void *)a1[6];
  if (v10)
  {
    id v9 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndex:", objc_msgSend((id)a1[5], "section"));
    [v8 deleteSections:v9 withRowAnimation:0];
  }
  else
  {
    v12[0] = a1[5];
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    [v8 deleteRowsAtIndexPaths:v9 withRowAnimation:0];
  }
}

void __75__WDDataListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!a2 || ([*(id *)(a1 + 32) _dataProviderEnabled] & 1) == 0) {
    [*(id *)(a1 + 32) _reloadAllData];
  }
}

void __75__WDDataListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_3(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (a3) {
    [WeakRetained _removePregnancyInformationFromMedicalID];
  }
}

- (void)monthViewController:(id)a3 didSelectDate:(id)a4
{
  [(WDDataListViewController *)self resetDataAndScrollToDate:a4];

  [(WDDataListViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(WDDataListViewController *)self isEditEnabled])
  {
    v15.receiver = self;
    v15.super_class = (Class)WDDataListViewController;
    [(WDDataListViewController *)&v15 setEditing:v5 animated:v4];
    if (v5)
    {
      id v7 = [(WDDataListViewController *)self navigationItem];
      id v8 = [v7 leftBarButtonItem];
      deleteAllButtonItem = self->_deleteAllButtonItem;

      if (v8 == deleteAllButtonItem) {
        return;
      }
      char v10 = [(WDDataListViewController *)self navigationItem];
      id v11 = [v10 leftBarButtonItem];
      [(WDDataListViewController *)self setLeftBarButtonItemReference:v11];

      id v12 = self->_deleteAllButtonItem;
      id v13 = [(WDDataListViewController *)self navigationItem];
      [v13 setLeftBarButtonItem:v12];
    }
    else
    {
      id v13 = [(WDDataListViewController *)self leftBarButtonItemReference];
      id v14 = [(WDDataListViewController *)self navigationItem];
      [v14 setLeftBarButtonItem:v13];
    }
  }
}

- (void)resetDataAndScrollToDate:(id)a3
{
  id v7 = a3;
  -[WDDataListViewController setScrollToDate:](self, "setScrollToDate:");
  BOOL v4 = [(WDDataListViewController *)self dataProvider];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(WDDataListViewController *)self dataProvider];
    [v6 viewControllerWantsDataIncludingDate:v7];

    [(UIActivityIndicatorView *)self->_spinner startAnimating];
    [(WDDataListViewController *)self _reloadAllData];
  }
}

- (void)_calendarDateSelectorButtonTapped:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F467F8]);
  char v5 = [(WDProfile *)self->_profile healthStore];
  char v6 = [(WDProfile *)self->_profile dateCache];
  id v7 = [MEMORY[0x263EFF910] date];
  id v13 = (id)[v4 initWithHealthStore:v5 dateCache:v6 date:v7];

  id v8 = [(HKDisplayType *)self->_displayType sampleType];
  [v13 setSampleType:v8];

  id v9 = [(HKDisplayType *)self->_displayType color];
  [v13 setSampleColor:v9];

  char v10 = [(WDDataListViewController *)self dataProvider];
  id v11 = [v10 defaultQueryPredicate];
  [v13 setAdditionalSamplePredicate:v11];

  [v13 setDelegate:self];
  id v12 = (void *)[objc_alloc(MEMORY[0x263F46858]) initWithRootViewController:v13];
  [(WDDataListViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)_deleteAllButtonTapped:(id)a3
{
  id v4 = a3;
  char v5 = [(HKDisplayType *)self->_displayType behavior];
  int v6 = [v5 supportsAssociatedSamples];

  objc_initWeak(&location, self);
  if (!v6)
  {
    id v13 = [(HKDisplayType *)self->_displayType displayTypeIdentifierString];
    id v14 = HKDisplayTypeIdentifierToString();
    if ([v13 isEqualToString:v14])
    {
      objc_super v15 = [(_HKMedicalIDData *)self->_medicalIDData pregnancyEstimatedDueDate];

      if (v15)
      {
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __51__WDDataListViewController__deleteAllButtonTapped___block_invoke_4;
        v16[3] = &unk_26458ED50;
        objc_copyWeak(&v17, &location);
        [(WDDataListViewController *)self _deleteAllPregnancySamplesConfirmationSender:v4 deleteBlock:v16];
        objc_destroyWeak(&v17);
        goto LABEL_13;
      }
    }
    else
    {
    }
    [(WDDataListViewController *)self presentDeleteConfirmation:v4];
    goto LABEL_13;
  }
  id v7 = self->_dataProvider;
  id v8 = v7;
  if (v7)
  {
    id v9 = [(WDDataListViewControllerDataProvider *)v7 samples];
    char v10 = [v9 allSamples];
    int v11 = objc_msgSend(v10, "hk_containsObjectPassingTest:", &__block_literal_global_11);

    if (v11)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __51__WDDataListViewController__deleteAllButtonTapped___block_invoke_2;
      v20[3] = &unk_26458ED50;
      id v12 = &v21;
      objc_copyWeak(&v21, &location);
      [(WDDataListViewController *)self _deleteAssociatedSamplesConfirmationPlural:1 sender:v4 deleteBlock:v20];
    }
    else
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __51__WDDataListViewController__deleteAllButtonTapped___block_invoke_3;
      v18[3] = &unk_26458ED50;
      id v12 = &v19;
      objc_copyWeak(&v19, &location);
      [(WDDataListViewController *)self _deleteWorkoutSamplesConfirmationPlural:1 sender:v4 deleteBlock:v18];
    }
    objc_destroyWeak(v12);
  }

LABEL_13:
  objc_destroyWeak(&location);
}

BOOL __51__WDDataListViewController__deleteAllButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  return a2 && [a2 _activityMoveMode] != 2;
}

void __51__WDDataListViewController__deleteAllButtonTapped___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _deleteAllWithOptions:a2];
}

void __51__WDDataListViewController__deleteAllButtonTapped___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _deleteAllWithOptions:a2];
}

void __51__WDDataListViewController__deleteAllButtonTapped___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removePregnancyInformationFromMedicalID];
  [WeakRetained _deleteAllWithOptions:a2];
}

- (id)_deleteAllDataAlertMessage
{
  if ([(HKDisplayType *)self->_displayType displayTypeIdentifier] == 173)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F28C30]);
    id v3 = [v2 getPreferenceFor:*MEMORY[0x263F28BE0]];
    int v4 = [v3 BOOLValue];

    char v5 = [v2 getPreferenceFor:*MEMORY[0x263F28BE8]];
    int v6 = [v5 BOOLValue];

    LODWORD(v5) = v4 | v6;
    id v7 = WDBundle();
    id v8 = v7;
    if (v5) {
      id v9 = @"DELETE_ALL_HEADPHONE_DATA_CONFIRMATION_TITLE";
    }
    else {
      id v9 = @"DELETE_ALL_CONFIRMATION_TITLE";
    }
    char v10 = [v7 localizedStringForKey:v9 value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  }
  else
  {
    WDBundle();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    char v10 = [v2 localizedStringForKey:@"DELETE_ALL_CONFIRMATION_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  }

  return v10;
}

- (void)presentDeleteConfirmation:(id)a3
{
  int v4 = (void *)MEMORY[0x263F1C3F8];
  id v5 = a3;
  int v6 = [(WDDataListViewController *)self _deleteAllDataAlertMessage];
  id v7 = [v4 alertControllerWithTitle:v6 message:0 preferredStyle:0];

  id v8 = [v7 popoverPresentationController];
  [v8 setSourceItem:v5];

  id v9 = (void *)MEMORY[0x263F1C3F0];
  char v10 = WDBundle();
  int v11 = [v10 localizedStringForKey:@"CANCEL" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  id v12 = [v9 actionWithTitle:v11 style:0 handler:0];
  [v7 addAction:v12];

  id v13 = (void *)MEMORY[0x263F1C3F0];
  id v14 = WDBundle();
  objc_super v15 = [v14 localizedStringForKey:@"DELETE_ALL_BUTTON_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__WDDataListViewController_presentDeleteConfirmation___block_invoke;
  v17[3] = &unk_26458DFA8;
  v17[4] = self;
  int v16 = [v13 actionWithTitle:v15 style:2 handler:v17];
  [v7 addAction:v16];

  [(WDDataListViewController *)self presentViewController:v7 animated:1 completion:0];
}

uint64_t __54__WDDataListViewController_presentDeleteConfirmation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteAllWithOptions:2];
}

- (void)_deleteAssociatedSamplesConfirmationPlural:(BOOL)a3 sender:(id)a4 deleteBlock:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = WDBundle();
  char v10 = v9;
  if (a3)
  {
    int v11 = [v9 localizedStringForKey:@"DELETE_ALL_ASSOCIATED_MESSAGE_PLURAL" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

    id v12 = WDBundle();
    uint64_t v33 = [v12 localizedStringForKey:@"DELETE_ALL_ASSOCIATED_YES_PLURAL" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

    id v13 = WDBundle();
    id v14 = v13;
    objc_super v15 = @"DELETE_ALL_ASSOCIATED_NO_PLURAL";
  }
  else
  {
    int v11 = [v9 localizedStringForKey:@"DELETE_ALL_ASSOCIATED_MESSAGE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

    int v16 = WDBundle();
    uint64_t v33 = [v16 localizedStringForKey:@"DELETE_ALL_ASSOCIATED_YES" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

    id v13 = WDBundle();
    id v14 = v13;
    objc_super v15 = @"DELETE_ALL_ASSOCIATED_NO";
  }
  id v17 = objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_26D2EA890, @"WellnessDashboard-Localizable", v33);

  id v18 = (void *)MEMORY[0x263F1C3F8];
  id v19 = WDBundle();
  id v20 = [v19 localizedStringForKey:@"DELETE_ALL_ASSOCIATED_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  id v21 = [v18 alertControllerWithTitle:v20 message:v11 preferredStyle:0];

  CGRect v22 = [v21 popoverPresentationController];
  [v22 setSourceItem:v8];

  id v23 = (void *)MEMORY[0x263F1C3F0];
  int v24 = WDBundle();
  v25 = [v24 localizedStringForKey:@"CANCEL" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  double v26 = [v23 actionWithTitle:v25 style:0 handler:0];
  [v21 addAction:v26];

  id v27 = (void *)MEMORY[0x263F1C3F0];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __90__WDDataListViewController__deleteAssociatedSamplesConfirmationPlural_sender_deleteBlock___block_invoke;
  v38[3] = &unk_26458ED78;
  id v28 = v7;
  id v39 = v28;
  char v29 = [v27 actionWithTitle:v34 style:2 handler:v38];
  [v21 addAction:v29];

  id v30 = (void *)MEMORY[0x263F1C3F0];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __90__WDDataListViewController__deleteAssociatedSamplesConfirmationPlural_sender_deleteBlock___block_invoke_2;
  v36[3] = &unk_26458ED78;
  id v37 = v28;
  id v31 = v28;
  id v32 = [v30 actionWithTitle:v17 style:0 handler:v36];
  [v21 addAction:v32];

  [(WDDataListViewController *)self presentViewController:v21 animated:1 completion:0];
}

uint64_t __90__WDDataListViewController__deleteAssociatedSamplesConfirmationPlural_sender_deleteBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__WDDataListViewController__deleteAssociatedSamplesConfirmationPlural_sender_deleteBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_deleteWorkoutSamplesConfirmationPlural:(BOOL)a3 sender:(id)a4 deleteBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  char v10 = WDBundle();
  int v11 = v10;
  if (a3)
  {
    id v12 = [v10 localizedStringForKey:@"DELETE_WORKOUT_PLURAL_ALERT_TITLE_FITNESS_JR" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Tinker"];

    id v13 = WDBundle();
    id v14 = [v13 localizedStringForKey:@"DELETE_WORKOUT_PLURAL_ALERT_DESCRIPTION_FITNESS_JR" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Tinker"];

    objc_super v15 = WDBundle();
    int v16 = v15;
    id v17 = @"DELETE_WORKOUT_PLURAL_ALERT_YES_FITNESS_JR";
  }
  else
  {
    id v12 = [v10 localizedStringForKey:@"DELETE_WORKOUT_ALERT_TITLE_FITNESS_JR" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Tinker"];

    id v18 = WDBundle();
    id v14 = [v18 localizedStringForKey:@"DELETE_WORKOUT_ALERT_DESCRIPTION_FITNESS_JR" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Tinker"];

    objc_super v15 = WDBundle();
    int v16 = v15;
    id v17 = @"DELETE_WORKOUT_ALERT_YES_FITNESS_JR";
  }
  id v19 = [v15 localizedStringForKey:v17 value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Tinker"];

  id v20 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v12 message:v14 preferredStyle:0];
  id v21 = [v20 popoverPresentationController];
  [v21 setSourceItem:v9];

  CGRect v22 = (void *)MEMORY[0x263F1C3F0];
  id v23 = WDBundle();
  int v24 = [v23 localizedStringForKey:@"CANCEL" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  v25 = [v22 actionWithTitle:v24 style:0 handler:0];
  [v20 addAction:v25];

  double v26 = (void *)MEMORY[0x263F1C3F0];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __87__WDDataListViewController__deleteWorkoutSamplesConfirmationPlural_sender_deleteBlock___block_invoke;
  v29[3] = &unk_26458ED78;
  id v30 = v8;
  id v27 = v8;
  id v28 = [v26 actionWithTitle:v19 style:0 handler:v29];
  [v20 addAction:v28];

  [(WDDataListViewController *)self presentViewController:v20 animated:1 completion:0];
}

uint64_t __87__WDDataListViewController__deleteWorkoutSamplesConfirmationPlural_sender_deleteBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_removePregnancyInformationFromMedicalIDConfirmationSender:(id)a3 deleteBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = WDBundle();
  id v8 = [v7 localizedStringForKey:@"REMOVE_PREGNANCY_FROM_MEDICAL_ID_ALERT_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

  id v9 = WDBundle();
  char v10 = [v9 localizedStringForKey:@"REMOVE_PREGNANCY_FROM_MEDICAL_ID_ALERT_DESCRIPTION" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

  int v11 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v8 message:v10 preferredStyle:0];
  id v12 = [v11 popoverPresentationController];
  [v12 setSourceItem:v6];

  id v13 = (void *)MEMORY[0x263F1C3F0];
  id v14 = WDBundle();
  objc_super v15 = [v14 localizedStringForKey:@"REMOVE_PREGNANCY_FROM_MEDICAL_ID_ALERT_PRIMARY_ACTION" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __99__WDDataListViewController__removePregnancyInformationFromMedicalIDConfirmationSender_deleteBlock___block_invoke;
  v29[3] = &unk_26458ED78;
  id v16 = v5;
  id v30 = v16;
  id v17 = [v13 actionWithTitle:v15 style:2 handler:v29];
  [v11 addAction:v17];

  id v18 = (void *)MEMORY[0x263F1C3F0];
  id v19 = WDBundle();
  id v20 = [v19 localizedStringForKey:@"REMOVE_PREGNANCY_FROM_MEDICAL_ID_ALERT_SECONDARY_ACTION" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __99__WDDataListViewController__removePregnancyInformationFromMedicalIDConfirmationSender_deleteBlock___block_invoke_2;
  v27[3] = &unk_26458ED78;
  id v21 = v16;
  id v28 = v21;
  CGRect v22 = [v18 actionWithTitle:v20 style:0 handler:v27];
  [v11 addAction:v22];

  id v23 = [(WDDataListViewController *)self navigationController];
  int v24 = [v23 presentedViewController];
  objc_opt_class();
  LOBYTE(v18) = objc_opt_isKindOfClass();

  if (v18)
  {
    _HKInitializeLogging();
    v25 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      -[WDDataListViewController _removePregnancyInformationFromMedicalIDConfirmationSender:deleteBlock:](v25);
    }
  }
  else
  {
    [(WDDataListViewController *)self presentViewController:v11 animated:1 completion:0];
  }
}

uint64_t __99__WDDataListViewController__removePregnancyInformationFromMedicalIDConfirmationSender_deleteBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __99__WDDataListViewController__removePregnancyInformationFromMedicalIDConfirmationSender_deleteBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_deleteAllPregnancySamplesConfirmationSender:(id)a3 deleteBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = WDBundle();
  id v9 = [v8 localizedStringForKey:@"DELETE_PREGNANCY_INFORMATION_ALERT_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

  char v10 = WDBundle();
  int v11 = [v10 localizedStringForKey:@"DELETE_ALL_PREGNANCY_INFORMATION_ALERT_DESCRIPTION" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

  id v12 = WDBundle();
  id v13 = [v12 localizedStringForKey:@"DELETE_PREGNANCY_INFORMATION_ALERT_YES" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

  id v14 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v9 message:v11 preferredStyle:0];
  objc_super v15 = [v14 popoverPresentationController];
  [v15 setSourceItem:v7];

  id v16 = (void *)MEMORY[0x263F1C3F0];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __85__WDDataListViewController__deleteAllPregnancySamplesConfirmationSender_deleteBlock___block_invoke;
  v26[3] = &unk_26458ED78;
  id v17 = v6;
  id v27 = v17;
  id v18 = [v16 actionWithTitle:v13 style:2 handler:v26];
  [v14 addAction:v18];

  id v19 = (void *)MEMORY[0x263F1C3F0];
  id v20 = WDBundle();
  id v21 = [v20 localizedStringForKey:@"CANCEL" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  CGRect v22 = [v19 actionWithTitle:v21 style:1 handler:0];
  [v14 addAction:v22];

  id v23 = [(WDDataListViewController *)self navigationController];
  int v24 = [v23 presentedViewController];
  objc_opt_class();
  LOBYTE(v19) = objc_opt_isKindOfClass();

  if (v19)
  {
    _HKInitializeLogging();
    v25 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      -[WDDataListViewController _removePregnancyInformationFromMedicalIDConfirmationSender:deleteBlock:](v25);
    }
  }
  else
  {
    [(WDDataListViewController *)self presentViewController:v14 animated:1 completion:0];
  }
}

uint64_t __85__WDDataListViewController__deleteAllPregnancySamplesConfirmationSender_deleteBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_removePregnancyInformationFromMedicalID
{
  medicalIDData = self->_medicalIDData;
  if (medicalIDData)
  {
    [(_HKMedicalIDData *)medicalIDData setPregnancyStartDate:0];
    [(_HKMedicalIDData *)self->_medicalIDData setPregnancyEstimatedDueDate:0];
    medicalIDStore = self->_medicalIDStore;
    id v5 = self->_medicalIDData;
    [(HKMedicalIDStore *)medicalIDStore updateMedicalIDData:v5 completion:&__block_literal_global_574];
  }
}

void __68__WDDataListViewController__removePregnancyInformationFromMedicalID__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __68__WDDataListViewController__removePregnancyInformationFromMedicalID__block_invoke_cold_1((uint64_t)v4, v5);
    }
  }
}

- (void)_deleteAllWithOptions:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unint64_t v4 = a3 & 2;
  id v5 = [(WDDataListViewController *)self _sampleTypesForDeleteAll];
  uint64_t v6 = 1096;
  id v17 = [(WDDataListViewControllerDataProvider *)self->_dataProvider defaultQueryPredicate];
  if (v17)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v15 = 1096;
      id v16 = v5;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          id v13 = [(WDProfile *)self->_profile healthStore];
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __50__WDDataListViewController__deleteAllWithOptions___block_invoke;
          v21[3] = &unk_26458EDA0;
          v21[4] = v12;
          id v22 = v17;
          id v23 = self;
          [v13 deleteObjectsOfType:v12 predicate:v22 options:v4 withCompletion:v21];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
      uint64_t v6 = v15;
      id v5 = v16;
    }
  }
  else
  {
    id v14 = [(WDProfile *)self->_profile healthStore];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __50__WDDataListViewController__deleteAllWithOptions___block_invoke_576;
    v18[3] = &unk_26458E610;
    id v19 = v5;
    id v20 = self;
    [v14 deleteAllSamplesWithTypes:v19 sourceBundleIdentifier:0 options:v4 completion:v18];

    id v7 = v19;
  }

  [*(id *)((char *)&self->super.super.super.super.super.isa + v6) deleteAllData];
  [(WDDataListViewController *)self setEditing:0 animated:1];
  [(WDDataListViewController *)self _reloadAllData];
}

void __50__WDDataListViewController__deleteAllWithOptions___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __50__WDDataListViewController__deleteAllWithOptions___block_invoke_cold_1();
    }
    [*(id *)(a1 + 48) _reloadAllData];
  }
}

void __50__WDDataListViewController__deleteAllWithOptions___block_invoke_576(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __50__WDDataListViewController__deleteAllWithOptions___block_invoke_576_cold_1();
    }
    [*(id *)(a1 + 40) _reloadAllData];
  }
}

- (id)_rightBarButtonItems
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = [(WDDataListViewController *)self dataProvider];
  if (objc_opt_respondsToSelector())
  {
    unint64_t v4 = [(WDDataListViewController *)self dataProvider];
    char v5 = [v4 calendarDateSelectorVisible];

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x263F1C468]);
      id v7 = WDBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"CALENDAR" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
      uint64_t v9 = (void *)[v6 initWithTitle:v8 style:0 target:self action:sel__calendarDateSelectorButtonTapped_];

      objc_msgSend(v9, "setEnabled:", -[WDDataListViewController _dataProviderEnabled](self, "_dataProviderEnabled"));
      uint64_t v10 = [NSString healthAccessibilityIdentifier:0 suffix:@"DataList.Calendar"];
      [v9 setAccessibilityIdentifier:v10];

      id v14 = v9;
      int v11 = &v14;
LABEL_7:
      uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];

      goto LABEL_9;
    }
  }
  else
  {
  }
  if ([(WDDataListViewController *)self isEditEnabled])
  {
    uint64_t v9 = [(WDDataListViewController *)self editButtonItem];
    v15[0] = v9;
    int v11 = (void **)v15;
    goto LABEL_7;
  }
  uint64_t v12 = (void *)MEMORY[0x263EFFA68];
LABEL_9:

  return v12;
}

- (void)_updateRightBarButtonItems
{
  id v4 = [(WDDataListViewController *)self _rightBarButtonItems];
  id v3 = [(WDDataListViewController *)self navigationItem];
  [v3 setRightBarButtonItems:v4];
}

- (BOOL)_shouldShowSpinnerRowInSection:(int64_t)a3
{
  char v5 = [(WDDataListViewController *)self dataProvider];
  uint64_t v6 = [v5 numberOfSections] - 1;

  if (v6 != a3) {
    goto LABEL_5;
  }
  id v7 = [(WDDataListViewController *)self dataProvider];
  uint64_t v8 = [v7 numberOfObjectsForSection:a3];

  if (!v8) {
    goto LABEL_5;
  }
  uint64_t v9 = [(WDDataListViewController *)self dataProvider];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    int v11 = [(WDDataListViewController *)self dataProvider];
    int v12 = [v11 hasCompleteDataSet] ^ 1;
  }
  else
  {
LABEL_5:
    LOBYTE(v12) = 0;
  }
  return v12;
}

- (BOOL)_hasSpinnerRowRowAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 row];
  uint64_t v6 = [(WDDataListViewController *)self dataProvider];
  uint64_t v7 = [v4 section];

  LOBYTE(v4) = v5 >= [v6 numberOfObjectsForSection:v7];
  return (char)v4;
}

- (void)_tapGestureRecognizerAction:(id)a3
{
  self->_showOriginalAppProvenance ^= 1u;
  id v4 = objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults", a3);
  [v4 setBool:self->_showOriginalAppProvenance forKey:@"ShowOriginalAppProvenance"];

  id v5 = [(WDDataListViewController *)self tableView];
  [v5 reloadData];
}

- (void)_updateActivityForViewDidAppear
{
  id v9 = [(WDProfile *)self->_profile userActivityManager];
  id v3 = NSString;
  id v4 = WDBundle();
  id v5 = [v4 localizedStringForKey:@"SHOW_ALL_DATA_UA_FORMAT" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  uint64_t v6 = [(HKDisplayType *)self->_displayType localization];
  uint64_t v7 = [v6 displayName];
  uint64_t v8 = objc_msgSend(v3, "stringWithFormat:", v5, v7);

  [v9 changeActivityForResponder:self activityDictionary:0 title:v8 keywords:0];
}

- (void)viewControllerWillEnterAdaptiveModal
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  id v4 = (void *)MEMORY[0x263F1C3C0];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  int v11 = __64__WDDataListViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  int v12 = &unk_26458DD38;
  objc_copyWeak(&v13, &location);
  id v5 = [v4 actionWithHandler:&v9];
  uint64_t v6 = objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v9, v10, v11, v12);

  uint64_t v7 = [NSString healthAccessibilityIdentifier:0 suffix:@"DataListViewController.DoneButton"];
  [v6 setAccessibilityIdentifier:v7];

  if ([(WDDataListViewController *)self isEditing])
  {
    [(WDDataListViewController *)self setLeftBarButtonItemReference:v6];
  }
  else
  {
    uint64_t v8 = [(WDDataListViewController *)self navigationItem];
    [v8 setLeftBarButtonItem:v6];
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __64__WDDataListViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  if ([(WDDataListViewController *)self isEditing])
  {
    [(WDDataListViewController *)self setLeftBarButtonItemReference:0];
  }
  else
  {
    id v3 = [(WDDataListViewController *)self navigationItem];
    [v3 setLeftBarButtonItem:0];
  }
}

- (WDDataListViewControllerDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (NSDate)scrollToDate
{
  return self->_scrollToDate;
}

- (void)setScrollToDate:(id)a3
{
}

- (_HKMedicalIDData)medicalIDData
{
  return self->_medicalIDData;
}

- (void)setMedicalIDData:(id)a3
{
}

- (UIBarButtonItem)leftBarButtonItemReference
{
  return self->_leftBarButtonItemReference;
}

- (void)setLeftBarButtonItemReference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftBarButtonItemReference, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_scrollToDate, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_navigationBarTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_deleteAllButtonItem, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

void __47__WDDataListViewController__fetchMedicalIDData__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2210D2000, a2, OS_LOG_TYPE_ERROR, "Error fetching medicalIDData: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_removePregnancyInformationFromMedicalIDConfirmationSender:(os_log_t)log deleteBlock:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2210D2000, log, OS_LOG_TYPE_ERROR, "View of kind UIAlertController already being presented. Not showing alert.", v1, 2u);
}

void __68__WDDataListViewController__removePregnancyInformationFromMedicalID__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2210D2000, a2, OS_LOG_TYPE_ERROR, "Error updating Medical ID: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __50__WDDataListViewController__deleteAllWithOptions___block_invoke_cold_1()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_2();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_error_impl(&dword_2210D2000, v3, OS_LOG_TYPE_ERROR, "Error deleting samples of type %{public}@ with predicate %{public}@: %{public}@", v4, 0x20u);
}

void __50__WDDataListViewController__deleteAllWithOptions___block_invoke_576_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_2210D2000, v1, OS_LOG_TYPE_ERROR, "Error deleting samples of types %{public}@: %{public}@", v2, 0x16u);
}

@end