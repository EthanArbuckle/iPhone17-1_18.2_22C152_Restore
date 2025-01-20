@interface WDAtrialFibrillationEventOverviewViewController
- (BOOL)_hasDetailViewController;
- (BOOL)firstViewDidLayoutSubviews;
- (BOOL)isPinned;
- (HKDataMetadataSectionProtocol)metaDataSection;
- (HKDisplayType)displayType;
- (HKFeatureStatus)featureStatus;
- (HKFeatureStatusManager)statusManager;
- (HKKeyValueDomain)keyValueDomain;
- (HRAtrialFibrillationOnboardingManager)onboardingManager;
- (NSArray)sectionsToDisplay;
- (NSDate)latestAnalyzedSampleDate;
- (UITapGestureRecognizer)tripleTapToSettingsRecognizer;
- (WDAtrialFibrillationEventOverviewViewController)initWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5;
- (WDDataListViewControllerDataProvider)dataProvider;
- (WDProfile)profile;
- (double)adjustedSafeAreaInsetTop;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_atrialFibrillationDetectionRescindedHeaderView;
- (id)_atrialFibrillationSetupContainerView;
- (id)_cellForAFibEducationalMaterialInTable:(id)a3 atIndex:(int64_t)a4;
- (id)_cellForAFibEventInTable:(id)a3 atIndexPath:(id)a4;
- (id)_cellForDataSourcesAndAccess;
- (id)_cellForDataTypeDescription;
- (id)_cellForFavorites;
- (id)_cellForIRN2ConsentForm;
- (id)_cellForRegulatory;
- (id)_cellForShowAll;
- (id)_pushDataSourcesAndAccessController;
- (id)_pushShowAllViewController;
- (id)_sectionHeaderViewWithTitle:(id)a3;
- (id)axidForElementWithString:(id)a3;
- (id)featureStatusCells;
- (id)featureStatusFooterView;
- (id)makeInternalSettingsControllerWithHealthStore:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)userConfigurationRowsToDisplay;
- (int64_t)_sectionIndexForSection:(int64_t)a3;
- (int64_t)detectionState;
- (int64_t)mode;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)totalSampleCount;
- (int64_t)visibleSampleCount;
- (int64_t)widthDesignationFromTraitCollection:(id)a3;
- (void)_atrialFibrillationDetectionRescindedHeaderView;
- (void)_getLatestAnalyzedSampleDate;
- (void)_reloadAllData;
- (void)_reloadAtrialFibrillationSetupTableHeaderView;
- (void)_reloadTableViewAndScrollToTop;
- (void)_showInternalSettingsViewController;
- (void)_startOnboardingForFirstTime:(BOOL)a3;
- (void)_updateDetectionState;
- (void)beginOnboardingForOnboardingSetupView:(id)a3;
- (void)dealloc;
- (void)didCompleteOnboarding;
- (void)didDismissOnboarding;
- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4;
- (void)launchOnboardingToReenableFeature;
- (void)recomputeTotalSampleCount;
- (void)reloadFeatureStatusSection;
- (void)setDataProvider:(id)a3;
- (void)setDetectionState:(int64_t)a3;
- (void)setDisplayType:(id)a3;
- (void)setFeatureStatus:(id)a3;
- (void)setFirstViewDidLayoutSubviews:(BOOL)a3;
- (void)setKeyValueDomain:(id)a3;
- (void)setLatestAnalyzedSampleDate:(id)a3;
- (void)setMetaDataSection:(id)a3;
- (void)setOnboardingManager:(id)a3;
- (void)setProfile:(id)a3;
- (void)setSectionsToDisplay:(id)a3;
- (void)setStatusManager:(id)a3;
- (void)setTotalSampleCount:(int64_t)a3;
- (void)setTripleTapToSettingsRecognizer:(id)a3;
- (void)setVisibleSampleCount:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateMarginsForWidthDesignation:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)widthDesignationDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4;
@end

@implementation WDAtrialFibrillationEventOverviewViewController

- (WDAtrialFibrillationEventOverviewViewController)initWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v34.receiver = self;
  v34.super_class = (Class)WDAtrialFibrillationEventOverviewViewController;
  v11 = [(WDAtrialFibrillationEventOverviewViewController *)&v34 initWithStyle:1];
  v12 = v11;
  if (v11)
  {
    v11->_firstViewDidLayoutSubviews = 1;
    objc_storeStrong((id *)&v11->_displayType, a3);
    objc_storeStrong((id *)&v12->_profile, a4);
    v12->_int64_t mode = a5;
    displayType = v12->_displayType;
    profile = v12->_profile;
    v15 = [(WDProfile *)profile unitController];
    uint64_t v16 = [(HKDisplayType *)displayType wd_listViewControllerDataProviderWithProfile:profile unitController:v15];
    uint64_t v17 = 1040;
    dataProvider = v12->_dataProvider;
    v12->_dataProvider = (WDDataListViewControllerDataProvider *)v16;

    [(WDDataListViewControllerDataProvider *)v12->_dataProvider setHasDetailViewController:[(WDAtrialFibrillationEventOverviewViewController *)v12 _hasDetailViewController]];
    uint64_t v19 = [objc_alloc(MEMORY[0x263F476A0]) initForSinglePlayer:v12->_mode == 0];
    metaDataSection = v12->_metaDataSection;
    v12->_metaDataSection = (HKDataMetadataSectionProtocol *)v19;

    int64_t mode = v12->_mode;
    if (mode)
    {
      v22 = 0;
    }
    else
    {
      id v23 = objc_alloc(MEMORY[0x263F0A3D0]);
      uint64_t v24 = *MEMORY[0x263F09778];
      uint64_t v17 = [v10 healthStore];
      v22 = (void *)[v23 initWithFeatureIdentifier:v24 healthStore:v17];
    }
    objc_storeStrong((id *)&v12->_statusManager, v22);
    if (!mode)
    {
    }
    id v25 = objc_alloc(MEMORY[0x263F0A470]);
    uint64_t v26 = *MEMORY[0x263F0AD78];
    v27 = [v10 healthStore];
    uint64_t v28 = [v25 initWithCategory:0 domainName:v26 healthStore:v27];
    keyValueDomain = v12->_keyValueDomain;
    v12->_keyValueDomain = (HKKeyValueDomain *)v28;

    [(WDAtrialFibrillationEventOverviewViewController *)v12 _updateDetectionState];
    v30 = [MEMORY[0x263F0A980] sharedBehavior];
    LODWORD(v26) = [v30 isAppleInternalInstall];

    if (v26)
    {
      uint64_t v31 = [objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v12 action:sel__showInternalSettingsViewController];
      tripleTapToSettingsRecognizer = v12->_tripleTapToSettingsRecognizer;
      v12->_tripleTapToSettingsRecognizer = (UITapGestureRecognizer *)v31;
    }
  }

  return v12;
}

- (id)makeInternalSettingsControllerWithHealthStore:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x263F1CB68]);

  return v3;
}

- (void)_showInternalSettingsViewController
{
  id v3 = [(WDProfile *)self->_profile healthStore];
  id v4 = [(WDAtrialFibrillationEventOverviewViewController *)self makeInternalSettingsControllerWithHealthStore:v3];

  [(WDAtrialFibrillationEventOverviewViewController *)self showViewController:v4 sender:self];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WDAtrialFibrillationEventOverviewViewController;
  [(WDAtrialFibrillationEventOverviewViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v28[1] = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)WDAtrialFibrillationEventOverviewViewController;
  [(HKTableViewController *)&v27 viewDidLoad];
  id v3 = [(HKDisplayType *)self->_displayType localization];
  objc_super v4 = [v3 displayName];
  [(WDAtrialFibrillationEventOverviewViewController *)self setTitle:v4];

  v5 = [(WDAtrialFibrillationEventOverviewViewController *)self navigationItem];
  [v5 setLargeTitleDisplayMode:2];

  [(HKFeatureStatusManager *)self->_statusManager registerObserver:self];
  v6 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  [v6 setEstimatedSectionHeaderHeight:100.0];

  v7 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  [v7 setSectionHeaderHeight:*MEMORY[0x263F1D600]];

  v8 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  [v8 _setSectionContentInsetFollowsLayoutMargins:1];

  id v9 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  [v9 _setSectionCornerRadius:*MEMORY[0x263F463A8]];

  id v10 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  uint64_t v11 = objc_opt_class();
  v12 = +[WDAtrialFibrillationDetectionSetupTableViewCell defaultReuseIdentifier];
  [v10 registerClass:v11 forCellReuseIdentifier:v12];

  v13 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  uint64_t v14 = objc_opt_class();
  v15 = +[WDHeartRhythmHeaderView defaultReuseIdentifier];
  [v13 registerClass:v14 forHeaderFooterViewReuseIdentifier:v15];

  uint64_t v16 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  uint64_t v17 = objc_opt_class();
  v18 = +[WDHeartRhythmSectionHeaderView defaultReuseIdentifier];
  [v16 registerClass:v17 forHeaderFooterViewReuseIdentifier:v18];

  uint64_t v19 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  [v19 registerClass:objc_opt_class() forCellReuseIdentifier:@"Regulatory"];

  v20 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  [v20 registerClass:objc_opt_class() forCellReuseIdentifier:@"DataTypeDescription"];

  v28[0] = objc_opt_class();
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
  id v22 = (id)[(WDAtrialFibrillationEventOverviewViewController *)self registerForTraitChanges:v21 withTarget:self action:sel_widthDesignationDidChangeWithTraitEnvironment_previousTraitCollection_];

  objc_initWeak(&location, self);
  dataProvider = self->_dataProvider;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __62__WDAtrialFibrillationEventOverviewViewController_viewDidLoad__block_invoke;
  v24[3] = &unk_26458DC70;
  objc_copyWeak(&v25, &location);
  [(WDDataListViewControllerDataProvider *)dataProvider startCollectingDataWithUpdateHandler:v24];
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __62__WDAtrialFibrillationEventOverviewViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__WDAtrialFibrillationEventOverviewViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_26458DC70;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __62__WDAtrialFibrillationEventOverviewViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadAllData];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WDAtrialFibrillationEventOverviewViewController;
  [(WDAtrialFibrillationEventOverviewViewController *)&v5 viewIsAppearing:a3];
  objc_super v4 = [(WDAtrialFibrillationEventOverviewViewController *)self traitCollection];
  [(WDAtrialFibrillationEventOverviewViewController *)self updateMarginsForWidthDesignation:[(WDAtrialFibrillationEventOverviewViewController *)self widthDesignationFromTraitCollection:v4]];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDAtrialFibrillationEventOverviewViewController;
  [(WDAtrialFibrillationEventOverviewViewController *)&v4 viewWillAppear:a3];
  [(WDAtrialFibrillationEventOverviewViewController *)self _reloadAllData];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WDAtrialFibrillationEventOverviewViewController;
  [(WDAtrialFibrillationEventOverviewViewController *)&v10 viewDidAppear:a3];
  objc_super v4 = [MEMORY[0x263F0A980] sharedBehavior];
  int v5 = [v4 isAppleInternalInstall];

  if (v5)
  {
    v6 = [(WDAtrialFibrillationEventOverviewViewController *)self tripleTapToSettingsRecognizer];
    [v6 setNumberOfTapsRequired:3];

    v7 = [(WDAtrialFibrillationEventOverviewViewController *)self navigationController];
    v8 = [v7 navigationBar];
    id v9 = [(WDAtrialFibrillationEventOverviewViewController *)self tripleTapToSettingsRecognizer];
    [v8 addGestureRecognizer:v9];
  }
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)WDAtrialFibrillationEventOverviewViewController;
  [(WDAtrialFibrillationEventOverviewViewController *)&v6 viewDidLayoutSubviews];
  if ([(WDAtrialFibrillationEventOverviewViewController *)self firstViewDidLayoutSubviews])
  {
    [(WDAtrialFibrillationEventOverviewViewController *)self setFirstViewDidLayoutSubviews:0];
    id v3 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
    objc_super v4 = [v3 tableHeaderView];
    int v5 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
    [v5 setTableHeaderView:v4];
  }
}

- (NSArray)sectionsToDisplay
{
  sectionsToDisplay = self->_sectionsToDisplay;
  if (sectionsToDisplay)
  {
    id v3 = sectionsToDisplay;
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    objc_super v6 = v5;
    if (self->_detectionState != 5)
    {
      [v5 addObject:&unk_26D2FD098];
      [v6 addObject:&unk_26D2FD0B0];
    }
    featureStatus = self->_featureStatus;
    if (featureStatus
      && ([(HKFeatureStatus *)featureStatus isOnboardingRecordPresent] & 1) != 0
      || self->_mode)
    {
      [v6 addObject:&unk_26D2FD0C8];
    }
    [v6 addObject:&unk_26D2FD0E0];
    if (!self->_mode) {
      [v6 addObject:&unk_26D2FD0F8];
    }
    v8 = [(WDAtrialFibrillationEventOverviewViewController *)self userConfigurationRowsToDisplay];
    uint64_t v9 = [v8 count];

    if (v9) {
      [v6 addObject:&unk_26D2FD110];
    }
    [v6 addObject:&unk_26D2FD128];
    objc_super v10 = (NSArray *)[v6 copy];
    uint64_t v11 = self->_sectionsToDisplay;
    self->_sectionsToDisplay = v10;

    id v3 = self->_sectionsToDisplay;
  }

  return v3;
}

- (int64_t)_sectionIndexForSection:(int64_t)a3
{
  sectionsToDisplay = self->_sectionsToDisplay;
  objc_super v4 = [NSNumber numberWithInteger:a3];
  int64_t v5 = [(NSArray *)sectionsToDisplay indexOfObject:v4];

  return v5;
}

- (id)userConfigurationRowsToDisplay
{
  int64_t mode = self->_mode;
  id v3 = &unk_26D2FD428;
  if (mode == 1) {
    id v3 = &unk_26D2FD440;
  }
  if (mode == 2) {
    return (id)MEMORY[0x263EFFA68];
  }
  else {
    return v3;
  }
}

- (double)adjustedSafeAreaInsetTop
{
  id v2 = [(WDAtrialFibrillationEventOverviewViewController *)self view];
  [v2 safeAreaInsets];
  double v4 = v3;

  return v4;
}

- (void)_reloadTableViewAndScrollToTop
{
  double v3 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  [(WDAtrialFibrillationEventOverviewViewController *)self adjustedSafeAreaInsetTop];
  objc_msgSend(v3, "setContentOffset:animated:", 0, 0.0, -v4);

  int64_t v5 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  [v5 reloadData];

  objc_super v6 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  [v6 layoutIfNeeded];

  v7 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  [(WDAtrialFibrillationEventOverviewViewController *)self adjustedSafeAreaInsetTop];
  objc_msgSend(v7, "setContentOffset:animated:", 0, 0.0, -v8);

  uint64_t v9 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  objc_super v10 = [MEMORY[0x263F088D0] indexSetWithIndex:0];
  [v9 reloadSections:v10 withRowAnimation:5];

  [(WDAtrialFibrillationEventOverviewViewController *)self _reloadAtrialFibrillationSetupTableHeaderView];
}

- (void)widthDesignationDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  int64_t v5 = [a3 traitCollection];
  int64_t v6 = [(WDAtrialFibrillationEventOverviewViewController *)self widthDesignationFromTraitCollection:v5];

  [(WDAtrialFibrillationEventOverviewViewController *)self updateMarginsForWidthDesignation:v6];
}

- (int64_t)widthDesignationFromTraitCollection:(id)a3
{
  id v3 = a3;
  int64_t v4 = [v3 valueForNSIntegerTrait:objc_opt_class()];

  return v4;
}

- (void)updateMarginsForWidthDesignation:(int64_t)a3
{
  [MEMORY[0x263F466A0] edgeInsetsForWidthDesignation:a3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  objc_msgSend(v12, "setDirectionalLayoutMargins:", v5, v7, v9, v11);
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  double v5 = (void *)*MEMORY[0x263F09920];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
  {
    double v6 = v5;
    *(_DWORD *)buf = 138543362;
    id v10 = (id)objc_opt_class();
    id v7 = v10;
    _os_log_impl(&dword_2210D2000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Received update for IRN feature status", buf, 0xCu);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__WDAtrialFibrillationEventOverviewViewController_featureStatusProviding_didUpdateFeatureStatus___block_invoke;
  block[3] = &unk_26458DC98;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __97__WDAtrialFibrillationEventOverviewViewController_featureStatusProviding_didUpdateFeatureStatus___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAllData];
}

- (void)_startOnboardingForFirstTime:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc(MEMORY[0x263F476A8]);
  double v6 = [(WDAtrialFibrillationEventOverviewViewController *)self profile];
  id v7 = [v6 healthStore];
  double v8 = [(WDAtrialFibrillationEventOverviewViewController *)self profile];
  double v9 = [v8 dateCache];
  id v10 = (void *)[v5 initWithOnboardingType:0 isFirstTimeOnboarding:v3 healthStore:v7 dateCache:v9 provenance:2 delegate:self];
  [(WDAtrialFibrillationEventOverviewViewController *)self setOnboardingManager:v10];

  uint64_t v11 = [(WDAtrialFibrillationEventOverviewViewController *)self onboardingManager];
  id v13 = [v11 onboardingNavigationController];

  [v13 setModalInPresentation:1];
  id v12 = [(WDAtrialFibrillationEventOverviewViewController *)self navigationController];
  [v12 presentViewController:v13 animated:1 completion:0];
}

- (BOOL)_hasDetailViewController
{
  return self->_mode != 2;
}

- (void)_updateDetectionState
{
  id v2 = a1;
  BOOL v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_0(&dword_2210D2000, v5, v6, "[%{public}@]: Error retrieving notification setting state IRN; reporting 'off': %{public}@",
    v7,
    v8,
    v9,
    v10,
    v11);
}

- (void)_reloadAllData
{
  uint64_t v3 = [(WDDataListViewControllerDataProvider *)self->_dataProvider numberOfObjectsForSection:0];
  if (v3 >= 3) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = v3;
  }
  [(WDAtrialFibrillationEventOverviewViewController *)self setVisibleSampleCount:v4];
  [(WDAtrialFibrillationEventOverviewViewController *)self recomputeTotalSampleCount];
  int64_t detectionState = self->_detectionState;
  [(WDAtrialFibrillationEventOverviewViewController *)self _updateDetectionState];
  if (detectionState != self->_detectionState) {
    [(WDAtrialFibrillationEventOverviewViewController *)self setSectionsToDisplay:0];
  }
  [(WDAtrialFibrillationEventOverviewViewController *)self _getLatestAnalyzedSampleDate];
  uint64_t v6 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  [v6 reloadData];

  [(WDAtrialFibrillationEventOverviewViewController *)self _reloadAtrialFibrillationSetupTableHeaderView];
}

- (void)recomputeTotalSampleCount
{
  uint64_t v3 = [MEMORY[0x263F0A158] atrialFibrillationEventType];
  id v4 = objc_alloc(MEMORY[0x263F0A6C0]);
  uint64_t v5 = [MEMORY[0x263EFFA08] setWithObject:v3];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint8_t v11 = __76__WDAtrialFibrillationEventOverviewViewController_recomputeTotalSampleCount__block_invoke;
  id v12 = &unk_26458DCE8;
  id v13 = self;
  id v14 = v3;
  id v6 = v3;
  uint64_t v7 = (void *)[v4 initWithSampleTypes:v5 predicate:0 resultsHandler:&v9];

  uint64_t v8 = [(WDProfile *)self->_profile healthStore];
  [v8 executeQuery:v7];
}

void __76__WDAtrialFibrillationEventOverviewViewController_recomputeTotalSampleCount__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  if (a3)
  {
    uint64_t v7 = [a3 objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v8 = [v7 integerValue];

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __76__WDAtrialFibrillationEventOverviewViewController_recomputeTotalSampleCount__block_invoke_349;
    v10[3] = &unk_26458DCC0;
    v10[4] = *(void *)(a1 + 32);
    v10[5] = v8;
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v9 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      __76__WDAtrialFibrillationEventOverviewViewController_recomputeTotalSampleCount__block_invoke_cold_1(a1, v9);
    }
  }
}

void __76__WDAtrialFibrillationEventOverviewViewController_recomputeTotalSampleCount__block_invoke_349(uint64_t a1)
{
  [*(id *)(a1 + 32) setTotalSampleCount:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];
}

- (void)_getLatestAnalyzedSampleDate
{
  uint64_t v3 = [(WDAtrialFibrillationEventOverviewViewController *)self keyValueDomain];
  uint64_t v4 = *MEMORY[0x263F0AD88];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __79__WDAtrialFibrillationEventOverviewViewController__getLatestAnalyzedSampleDate__block_invoke;
  v5[3] = &unk_26458DD10;
  v5[4] = self;
  [v3 dateForKey:v4 completion:v5];
}

void __79__WDAtrialFibrillationEventOverviewViewController__getLatestAnalyzedSampleDate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    uint64_t v7 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      __79__WDAtrialFibrillationEventOverviewViewController__getLatestAnalyzedSampleDate__block_invoke_cold_1(a1, v7);
    }
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __79__WDAtrialFibrillationEventOverviewViewController__getLatestAnalyzedSampleDate__block_invoke_351;
    v8[3] = &unk_26458DB58;
    v8[4] = *(void *)(a1 + 32);
    id v9 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v8);
  }
}

void __79__WDAtrialFibrillationEventOverviewViewController__getLatestAnalyzedSampleDate__block_invoke_351(uint64_t a1)
{
  [*(id *)(a1 + 32) setLatestAnalyzedSampleDate:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];
}

- (id)_cellForFavorites
{
  id v3 = objc_alloc(MEMORY[0x263F46758]);
  uint64_t v4 = [MEMORY[0x263F46758] reuseIdentifier];
  id v5 = (void *)[v3 initWithStyle:0 reuseIdentifier:v4];

  objc_msgSend(v5, "setFavorited:", -[WDAtrialFibrillationEventOverviewViewController isPinned](self, "isPinned"));
  id v6 = [(WDAtrialFibrillationEventOverviewViewController *)self axidForElementWithString:@"AddToFavorites"];
  [v5 setAccessibilityIdentifier:v6];

  return v5;
}

- (id)_cellForDataSourcesAndAccess
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"DataSourcesAndAccessCellIdentifier"];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v5 = [v4 localizedStringForKey:@"SHARE_DATA_TITLE" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  id v6 = [v3 textLabel];
  [v6 setText:v5];

  [v3 setAccessoryType:1];
  uint64_t v7 = [(WDAtrialFibrillationEventOverviewViewController *)self axidForElementWithString:@"DataSourcesAndAccess"];
  [v3 setAccessibilityIdentifier:v7];

  return v3;
}

- (id)_cellForShowAll
{
  id v3 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  uint64_t v4 = [v3 dequeueReusableCellWithIdentifier:@"ShowAllCell"];

  if (!v4) {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:1 reuseIdentifier:@"ShowAllCell"];
  }
  id v5 = WDBundle();
  id v6 = [v5 localizedStringForKey:@"SHOW_ALL_DATA" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  uint64_t v7 = [v4 textLabel];
  [v7 setText:v6];

  [v4 setAccessoryType:1];
  uint64_t v8 = [NSNumber numberWithInteger:self->_totalSampleCount];
  id v9 = HKLocalizedStringForNumberWithTemplate();

  uint64_t v10 = [v4 detailTextLabel];
  [v10 setText:v9];

  uint8_t v11 = [(WDAtrialFibrillationEventOverviewViewController *)self axidForElementWithString:@"All Data"];
  [v4 setAccessibilityIdentifier:v11];

  return v4;
}

- (id)_cellForRegulatory
{
  id v3 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  uint64_t v4 = [v3 dequeueReusableCellWithIdentifier:@"Regulatory"];

  id v5 = WDBundle();
  id v6 = [v5 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_REGULATORY_LABEL" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Antimony"];
  uint64_t v7 = [v4 textLabel];
  [v7 setText:v6];

  [v4 setAccessoryType:1];
  uint64_t v8 = [v4 textLabel];
  [v8 setNumberOfLines:0];

  id v9 = [(WDAtrialFibrillationEventOverviewViewController *)self axidForElementWithString:@"About"];
  [v4 setAccessibilityIdentifier:v9];

  return v4;
}

- (id)_cellForDataTypeDescription
{
  id v3 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  uint64_t v4 = [v3 dequeueReusableCellWithIdentifier:@"DataTypeDescription"];

  BOOL v5 = ([(WDAtrialFibrillationEventOverviewViewController *)self detectionState] == 6
     || [(WDAtrialFibrillationEventOverviewViewController *)self detectionState] == 7)
    && self->_mode == 0;
  [v4 setFeatureAvailable:v5];
  id v6 = [(WDAtrialFibrillationEventOverviewViewController *)self axidForElementWithString:@"AboutIRNDescription"];
  [v4 setAccessibilityIdentifier:v6];

  return v4;
}

- (id)_cellForAFibEventInTable:(id)a3 atIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(WDAtrialFibrillationEventOverviewViewController *)self dataProvider];
  uint64_t v7 = objc_msgSend(v6, "objectAtIndex:forSection:", objc_msgSend(v5, "row"), 0);

  uint64_t v8 = [(WDAtrialFibrillationEventOverviewViewController *)self dataProvider];
  id v9 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  uint64_t v10 = [v8 customCellForObject:v7 indexPath:v5 tableView:v9];

  return v10;
}

- (id)_cellForAFibEducationalMaterialInTable:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(WDAtrialFibrillationEventOverviewViewController *)self metaDataSection];
  uint64_t v8 = [v7 cellForIndex:a4 tableView:v6];

  return v8;
}

- (id)_cellForIRN2ConsentForm
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"iConsent"];
  id v3 = [v2 textLabel];
  [v3 setText:@"IRN 2.0 Carry Consent (Internal Only)"];

  uint64_t v4 = [v2 textLabel];
  [v4 setNumberOfLines:0];

  return v2;
}

- (id)_pushShowAllViewController
{
  if (self->_mode == 2)
  {
    id v3 = self->_dataProvider;
  }
  else
  {
    displayType = self->_displayType;
    profile = self->_profile;
    id v6 = [(WDProfile *)profile unitController];
    id v3 = [(HKDisplayType *)displayType wd_listViewControllerDataProviderWithProfile:profile unitController:v6];

    [(WDDataListViewControllerDataProvider *)v3 setHasDetailViewController:[(WDAtrialFibrillationEventOverviewViewController *)self _hasDetailViewController]];
  }
  uint64_t v7 = [[WDDataListViewController alloc] initWithDisplayType:self->_displayType profile:self->_profile dataProvider:v3 usingInsetStyling:1];
  uint64_t v8 = [(WDDataListViewController *)v7 tableView];
  [v8 _setSectionContentInsetFollowsLayoutMargins:1];

  double v9 = *MEMORY[0x263F463A8];
  uint64_t v10 = [(WDDataListViewController *)v7 tableView];
  [v10 _setSectionCornerRadius:v9];

  [(WDAtrialFibrillationEventOverviewViewController *)self showAdaptively:v7 sender:self];

  return v7;
}

- (id)_pushDataSourcesAndAccessController
{
  id v3 = objc_msgSend(MEMORY[0x263F466E8], "categoryWithID:", -[HKDisplayType categoryIdentifier](self->_displayType, "categoryIdentifier"));
  uint64_t v4 = [WDDisplayTypeDataSourcesTableViewController alloc];
  displayType = self->_displayType;
  id v6 = [(WDProfile *)self->_profile sourceOrderController];
  uint64_t v7 = [(WDDisplayTypeDataSourcesTableViewController *)v4 initWithDisplayType:displayType displayCategory:v3 sourceOrderController:v6 profile:self->_profile];

  [(WDDisplayTypeDataSourcesTableViewController *)v7 setShouldInsetSectionContentForDataSourceDataList:1];
  [(WDAtrialFibrillationEventOverviewViewController *)self showAdaptively:v7 sender:self];

  return v7;
}

- (BOOL)isPinned
{
  return 0;
}

- (id)featureStatusCells
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)featureStatusFooterView
{
  return 0;
}

- (void)reloadFeatureStatusSection
{
  int64_t v3 = [(WDAtrialFibrillationEventOverviewViewController *)self _sectionIndexForSection:6];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [MEMORY[0x263F088D0] indexSetWithIndex:v3];
    uint64_t v4 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
    [v4 reloadSections:v5 withRowAnimation:100];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t v3 = [(WDAtrialFibrillationEventOverviewViewController *)self sectionsToDisplay];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = [(WDAtrialFibrillationEventOverviewViewController *)self sectionsToDisplay];
  uint64_t v7 = [v6 objectAtIndexedSubscript:a4];
  uint64_t v8 = [v7 integerValue];

  int64_t result = 1;
  switch(v8)
  {
    case 0:
      return [(WDAtrialFibrillationEventOverviewViewController *)self visibleSampleCount];
    case 1:
    case 2:
    case 4:
      return result;
    case 3:
      uint8_t v11 = [(WDAtrialFibrillationEventOverviewViewController *)self metaDataSection];
      uint64_t v12 = [v11 numberOfRowsInSection];
      goto LABEL_10;
    case 5:
      uint64_t v10 = [(WDAtrialFibrillationEventOverviewViewController *)self userConfigurationRowsToDisplay];
      goto LABEL_8;
    case 6:
      uint64_t v10 = [(WDAtrialFibrillationEventOverviewViewController *)self featureStatusCells];
LABEL_8:
      uint8_t v11 = v10;
      uint64_t v12 = [v10 count];
LABEL_10:
      int64_t v13 = v12;

      int64_t result = v13;
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WDAtrialFibrillationEventOverviewViewController *)self sectionsToDisplay];
  double v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  uint64_t v10 = [v9 integerValue];

  switch(v10)
  {
    case 0:
      uint64_t v11 = [(WDAtrialFibrillationEventOverviewViewController *)self _cellForAFibEventInTable:v6 atIndexPath:v7];
      goto LABEL_14;
    case 1:
      uint64_t v11 = [(WDAtrialFibrillationEventOverviewViewController *)self _cellForShowAll];
      goto LABEL_14;
    case 2:
      uint64_t v11 = [(WDAtrialFibrillationEventOverviewViewController *)self _cellForDataTypeDescription];
      goto LABEL_14;
    case 3:
      uint64_t v11 = -[WDAtrialFibrillationEventOverviewViewController _cellForAFibEducationalMaterialInTable:atIndex:](self, "_cellForAFibEducationalMaterialInTable:atIndex:", v6, [v7 row]);
      goto LABEL_14;
    case 4:
      uint64_t v11 = [(WDAtrialFibrillationEventOverviewViewController *)self _cellForFavorites];
      goto LABEL_14;
    case 5:
      uint64_t v12 = [(WDAtrialFibrillationEventOverviewViewController *)self userConfigurationRowsToDisplay];
      int64_t v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
      uint64_t v14 = [v13 integerValue];

      if (v14 == 1)
      {
        uint64_t v11 = [(WDAtrialFibrillationEventOverviewViewController *)self _cellForRegulatory];
        goto LABEL_14;
      }
      if (!v14)
      {
        uint64_t v11 = [(WDAtrialFibrillationEventOverviewViewController *)self _cellForDataSourcesAndAccess];
LABEL_14:
        v18 = (void *)v11;
        goto LABEL_15;
      }
LABEL_10:
      v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      uint64_t v17 = HKErrorTableViewCell();
LABEL_12:
      v18 = (void *)v17;

LABEL_15:
      return v18;
    case 6:
      uint64_t v16 = [(WDAtrialFibrillationEventOverviewViewController *)self featureStatusCells];
      uint64_t v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
      goto LABEL_12;
    default:
      goto LABEL_10;
  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 || self->_detectionState)
  {
    id v7 = [(WDAtrialFibrillationEventOverviewViewController *)self sectionsToDisplay];
    uint64_t v8 = [v7 objectAtIndexedSubscript:a4];
    uint64_t v9 = [v8 integerValue];

    switch(v9)
    {
      case 0:
        if ([(WDAtrialFibrillationEventOverviewViewController *)self visibleSampleCount] < 1) {
          goto LABEL_8;
        }
        goto LABEL_5;
      case 1:
        if ([(WDAtrialFibrillationEventOverviewViewController *)self visibleSampleCount]) {
          goto LABEL_8;
        }
LABEL_5:
        uint64_t v10 = WDBundle();
        uint64_t v11 = v10;
        uint64_t v12 = @"ATRIAL_FIBRILLATION_DETECTION_NOTIFICATIONS_SECTION_TITLE";
LABEL_12:
        uint64_t v14 = [v10 localizedStringForKey:v12 value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Antimony"];
        int64_t v13 = [(WDAtrialFibrillationEventOverviewViewController *)self _sectionHeaderViewWithTitle:v14];

        break;
      case 2:
        uint64_t v10 = WDBundle();
        uint64_t v11 = v10;
        uint64_t v12 = @"ATRIAL_FIBRILLATION_DETECTION_ABOUT_SECTION_TITLE";
        goto LABEL_12;
      case 3:
        uint64_t v10 = WDBundle();
        uint64_t v11 = v10;
        uint64_t v12 = @"ATRIAL_FIBRILLATION_DETECTION_EDUCATION_SECTION_TITLE";
        goto LABEL_12;
      case 4:
        uint64_t v10 = WDBundle();
        uint64_t v11 = v10;
        uint64_t v12 = @"ATRIAL_FIBRILLATION_DETECTION_OPTIONS_SECTION_TITLE";
        goto LABEL_12;
      default:
LABEL_8:
        int64_t v13 = 0;
        break;
    }
  }
  else
  {
    int64_t v13 = [(WDAtrialFibrillationEventOverviewViewController *)self _atrialFibrillationDetectionRescindedHeaderView];
  }

  return v13;
}

- (id)_sectionHeaderViewWithTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  id v6 = +[WDHeartRhythmSectionHeaderView defaultReuseIdentifier];
  id v7 = [v5 dequeueReusableHeaderFooterViewWithIdentifier:v6];

  [v7 setTitleText:v4];
  uint64_t v8 = [(WDAtrialFibrillationEventOverviewViewController *)self axidForElementWithString:@"SectionHeader."];
  uint64_t v9 = [v8 stringByAppendingString:v4];

  [v7 setAccessibilityIdentifier:v9];

  return v7;
}

- (id)_atrialFibrillationDetectionRescindedHeaderView
{
  int64_t v3 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
  id v4 = +[WDHeartRhythmHeaderView defaultReuseIdentifier];
  id v5 = [v3 dequeueReusableHeaderFooterViewWithIdentifier:v4];

  featureStatus = self->_featureStatus;
  if (featureStatus)
  {
    id v7 = [(HKFeatureStatus *)featureStatus objectForKeyedSubscript:*MEMORY[0x263F09600]];
    uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F09708]];
    char v9 = [v8 BOOLValue];

    uint64_t v10 = [v7 objectForKeyedSubscript:*MEMORY[0x263F09670]];
    char v11 = [v10 BOOLValue];

    if (v9)
    {
      if (v11)
      {
        _HKInitializeLogging();
        uint64_t v12 = (void *)*MEMORY[0x263F09920];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_FAULT)) {
          -[WDAtrialFibrillationEventOverviewViewController _atrialFibrillationDetectionRescindedHeaderView](v12);
        }
        goto LABEL_11;
      }
      id v22 = WDBundle();
      id v23 = [v22 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_DISABLED_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Antimony"];
      [v5 setTitleText:v23];

      uint64_t v16 = WDBundle();
      uint64_t v24 = [v16 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_DISABLED_LEARN_MORE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Antimony"];
      id v25 = [NSURL URLWithString:*MEMORY[0x263F09210]];
      [v5 setBodyText:0 URLText:v24 URL:v25];
    }
    else
    {
      uint64_t v14 = WDBundle();
      v15 = [v14 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_SEED_EXPIRED_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Antimony"];
      [v5 setTitleText:v15];

      uint64_t v16 = WDBundle();
      uint64_t v17 = [v16 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_SEED_EXPIRED_LEARN_MORE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Antimony"];
      v18 = NSURL;
      uint64_t v19 = WDBundle();
      v20 = [v19 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_SEED_EXPIRED_URL" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Antimony"];
      v21 = [v18 URLWithString:v20];
      [v5 setBodyText:0 URLText:v17 URL:v21];
    }
LABEL_11:

    goto LABEL_12;
  }
  _HKInitializeLogging();
  int64_t v13 = (void *)*MEMORY[0x263F09920];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_FAULT)) {
    -[WDAtrialFibrillationEventOverviewViewController _atrialFibrillationDetectionRescindedHeaderView](v13);
  }
LABEL_12:

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = [(WDAtrialFibrillationEventOverviewViewController *)self sectionsToDisplay];
  id v7 = [v6 objectAtIndexedSubscript:a4];
  uint64_t v8 = [v7 integerValue];

  if (v8 == 4)
  {
    uint64_t v16 = WDBundle();
    char v11 = v16;
    uint64_t v17 = @"ATRIAL_FIBRILLATION_DETECTION_PINNED_FOOTER";
LABEL_8:
    v15 = [v16 localizedStringForKey:v17 value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Antimony"];
    goto LABEL_9;
  }
  if (v8 != 1 || self->_detectionState != 6)
  {
    v15 = 0;
    goto LABEL_10;
  }
  char v9 = [(WDAtrialFibrillationEventOverviewViewController *)self latestAnalyzedSampleDate];

  if (!v9)
  {
    uint64_t v16 = WDBundle();
    char v11 = v16;
    uint64_t v17 = @"ATRIAL_FIBRILLATION_DETECTION_ENABLED_NO_SAMPLES";
    goto LABEL_8;
  }
  uint64_t v10 = [(WDAtrialFibrillationEventOverviewViewController *)self latestAnalyzedSampleDate];
  char v11 = HKLocalizedStringForDateAndTemplate();

  uint64_t v12 = NSString;
  int64_t v13 = WDBundle();
  uint64_t v14 = [v13 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_LAST_SAMPLE_%@" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Antimony"];
  v15 = objc_msgSend(v12, "stringWithFormat:", v14, v11);

LABEL_9:
LABEL_10:

  return v15;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = [(WDAtrialFibrillationEventOverviewViewController *)self sectionsToDisplay];
  id v7 = [v6 objectAtIndexedSubscript:a4];
  uint64_t v8 = [v7 integerValue];

  if (v8 == 1)
  {
    char v9 = 0;
    switch(self->_detectionState)
    {
      case 1:
        id v16 = objc_alloc(MEMORY[0x263F46760]);
        uint64_t v10 = [MEMORY[0x263F46760] defaultReuseIdentifier];
        uint64_t v17 = WDBundle();
        uint64_t v12 = v17;
        v18 = @"ATRIAL_FIBRILLATION_DETECTION_HEART_AGE_GATED";
        goto LABEL_11;
      case 2:
      case 7:
        uint64_t v10 = [NSURL URLWithString:@"bridge:root=com.apple.HeartRateSettings"];
        char v11 = WDBundle();
        uint64_t v12 = [v11 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_AVAILABLE_OFF" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Antimony"];

        int64_t v13 = WDBundle();
        uint64_t v14 = v13;
        v15 = @"ATRIAL_FIBRILLATION_DETECTION_AVAILABLE_OFF_LINK";
        goto LABEL_9;
      case 4:
        uint64_t v19 = NSURL;
        v20 = WDBundle();
        v21 = [v20 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_UNAVAILABLE_LEARN_MORE_URL" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Antimony"];
        uint64_t v10 = [v19 URLWithString:v21];

        id v22 = WDBundle();
        uint64_t v12 = [v22 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_UNAVAILABLE_ON_ACTIVE_WATCH" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Antimony"];

        int64_t v13 = WDBundle();
        uint64_t v14 = v13;
        v15 = @"ATRIAL_FIBRILLATION_DETECTION_UNAVAILABLE_LEARN_MORE";
LABEL_9:
        id v23 = [v13 localizedStringForKey:v15 value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Antimony"];

        uint64_t v24 = [NSString stringWithFormat:@"%@ %@", v12, v23];
        id v25 = objc_alloc(MEMORY[0x263F46760]);
        uint64_t v26 = [MEMORY[0x263F46760] defaultReuseIdentifier];
        uint64_t v27 = [v24 rangeOfString:v23];
        char v9 = objc_msgSend(v25, "initWithReuseIdentifier:fullText:linkRange:link:", v26, v24, v27, v28, v10);

        goto LABEL_12;
      case 0xBLL:
        id v16 = objc_alloc(MEMORY[0x263F46760]);
        uint64_t v10 = [MEMORY[0x263F46760] defaultReuseIdentifier];
        uint64_t v17 = WDBundle();
        uint64_t v12 = v17;
        v18 = @"ATRIAL_FIBRILLATION_DETECTION_UNAVAILABLE_ON_ACTIVE_WATCH";
LABEL_11:
        v29 = [v17 localizedStringForKey:v18 value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Antimony"];
        id v30 = objc_alloc_init(NSURL);
        char v9 = (void *)[v16 initWithReuseIdentifier:v10 bodyText:v29 linkText:&stru_26D2EA890 link:v30];

LABEL_12:
        break;
      default:
        break;
    }
  }
  else if (v8 == 6)
  {
    char v9 = [(WDAtrialFibrillationEventOverviewViewController *)self featureStatusFooterView];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [MEMORY[0x263F1C550] clearColor];
    [v8 setSeparatorColor:v10];
  }
  char v11 = [(WDAtrialFibrillationEventOverviewViewController *)self sectionsToDisplay];
  uint64_t v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v9, "section"));
  uint64_t v13 = [v12 integerValue];

  if (v13 == 3)
  {
    uint64_t v14 = [(WDAtrialFibrillationEventOverviewViewController *)self metaDataSection];
    objc_msgSend(v14, "willDisplayCell:forIndex:tableView:", v8, objc_msgSend(v9, "row"), v15);
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  [v19 deselectRowAtIndexPath:v6 animated:1];
  id v7 = [(WDAtrialFibrillationEventOverviewViewController *)self sectionsToDisplay];
  id v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  uint64_t v9 = [v8 integerValue];

  switch(v9)
  {
    case 0:
      uint64_t v10 = [(WDAtrialFibrillationEventOverviewViewController *)self dataProvider];
      char v11 = [v10 viewControllerForItemAtIndexPath:v6];

      if (v11) {
        [(WDAtrialFibrillationEventOverviewViewController *)self showAdaptively:v11 sender:self];
      }
      goto LABEL_8;
    case 1:
      id v12 = [(WDAtrialFibrillationEventOverviewViewController *)self _pushShowAllViewController];
      break;
    case 3:
      char v11 = [(WDAtrialFibrillationEventOverviewViewController *)self metaDataSection];
      uint64_t v13 = [v6 row];
      uint64_t v14 = [(WDAtrialFibrillationEventOverviewViewController *)self navigationController];
      [v11 selectCellForIndex:v13 navigationController:v14 animated:1];

      goto LABEL_8;
    case 4:
      char v11 = [v19 cellForRowAtIndexPath:v6];
      objc_msgSend(v11, "setFavorited:", objc_msgSend(v11, "isFavorited") ^ 1);
      -[WDAtrialFibrillationEventOverviewViewController setPinned:](self, "setPinned:", [v11 isFavorited]);
LABEL_8:

      break;
    case 5:
      id v15 = [(WDAtrialFibrillationEventOverviewViewController *)self userConfigurationRowsToDisplay];
      id v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
      uint64_t v17 = [v16 integerValue];

      if (v17 == 1)
      {
        [(WDAtrialFibrillationEventOverviewViewController *)self didSelectRegulatoryRow];
      }
      else if (!v17)
      {
        id v18 = [(WDAtrialFibrillationEventOverviewViewController *)self _pushDataSourcesAndAccessController];
      }
      break;
    case 6:
      [(WDAtrialFibrillationEventOverviewViewController *)self featureStatusCellTappedAtIndexPath:v6];
      break;
    default:
      break;
  }
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v5 = [(WDAtrialFibrillationEventOverviewViewController *)self sectionsToDisplay];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  uint64_t v7 = [v6 integerValue];

  double result = *MEMORY[0x263F1D600];
  if (!v7) {
    return 2.22507386e-308;
  }
  return result;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v5 = [(WDAtrialFibrillationEventOverviewViewController *)self sectionsToDisplay];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  uint64_t v7 = [v6 integerValue];

  double result = *MEMORY[0x263F1D600];
  if (v7 == 6) {
    return 2.22507386e-308;
  }
  return result;
}

- (id)axidForElementWithString:(id)a3
{
  int64_t v3 = NSString;
  id v4 = a3;
  id v5 = [v3 healthAccessibilityIdentifier:2 suffix:@"Overview"];
  id v6 = [v5 stringByAppendingFormat:@".%@", v4];

  return v6;
}

- (void)_reloadAtrialFibrillationSetupTableHeaderView
{
  if (self->_detectionState == 5)
  {
    id v19 = [(WDAtrialFibrillationEventOverviewViewController *)self _atrialFibrillationSetupContainerView];
    int64_t v3 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
    [v3 setTableHeaderView:v19];

    id v4 = [v19 widthAnchor];
    id v5 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
    id v6 = [v5 widthAnchor];
    uint64_t v7 = [v4 constraintEqualToAnchor:v6];
    [v7 setActive:1];

    id v8 = [v19 centerXAnchor];
    uint64_t v9 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
    uint64_t v10 = [v9 centerXAnchor];
    char v11 = [v8 constraintEqualToAnchor:v10];
    [v11 setActive:1];

    id v12 = [v19 topAnchor];
    uint64_t v13 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
    uint64_t v14 = [v13 topAnchor];
    id v15 = [v12 constraintEqualToAnchor:v14];
    [v15 setActive:1];

    id v16 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
    uint64_t v17 = [v16 tableHeaderView];
    [v17 layoutIfNeeded];
  }
  else
  {
    id v18 = objc_alloc(MEMORY[0x263F1CB60]);
    id v19 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
    [v19 bounds];
    id v16 = objc_msgSend(v18, "initWithFrame:", 0.0, 0.0);
    uint64_t v17 = [(WDAtrialFibrillationEventOverviewViewController *)self tableView];
    [v17 setTableHeaderView:v16];
  }
}

- (id)_atrialFibrillationSetupContainerView
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  id v8 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v9 = -[HKOnboardingSetupView initWithFrame:]([WDAtrialFibrillationDetectionSetupView alloc], "initWithFrame:", v4, v5, v6, v7);
  [(HKOnboardingSetupView *)v9 setDelegate:self];
  [v8 addSubview:v9];
  [(WDAtrialFibrillationDetectionSetupView *)v9 hk_alignConstraintsWithView:v8];

  return v8;
}

- (void)beginOnboardingForOnboardingSetupView:(id)a3
{
}

- (void)launchOnboardingToReenableFeature
{
}

- (void)didCompleteOnboarding
{
}

- (void)didDismissOnboarding
{
}

- (WDDataListViewControllerDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (int64_t)totalSampleCount
{
  return self->_totalSampleCount;
}

- (void)setTotalSampleCount:(int64_t)a3
{
  self->_totalSampleCount = a3;
}

- (BOOL)firstViewDidLayoutSubviews
{
  return self->_firstViewDidLayoutSubviews;
}

- (void)setFirstViewDidLayoutSubviews:(BOOL)a3
{
  self->_firstViewDidLayoutSubviews = a3;
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
}

- (WDProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (HRAtrialFibrillationOnboardingManager)onboardingManager
{
  return self->_onboardingManager;
}

- (void)setOnboardingManager:(id)a3
{
}

- (HKKeyValueDomain)keyValueDomain
{
  return self->_keyValueDomain;
}

- (void)setKeyValueDomain:(id)a3
{
}

- (HKFeatureStatusManager)statusManager
{
  return self->_statusManager;
}

- (void)setStatusManager:(id)a3
{
}

- (int64_t)detectionState
{
  return self->_detectionState;
}

- (void)setDetectionState:(int64_t)a3
{
  self->_int64_t detectionState = a3;
}

- (UITapGestureRecognizer)tripleTapToSettingsRecognizer
{
  return self->_tripleTapToSettingsRecognizer;
}

- (void)setTripleTapToSettingsRecognizer:(id)a3
{
}

- (HKFeatureStatus)featureStatus
{
  return self->_featureStatus;
}

- (void)setFeatureStatus:(id)a3
{
}

- (void)setSectionsToDisplay:(id)a3
{
}

- (HKDataMetadataSectionProtocol)metaDataSection
{
  return self->_metaDataSection;
}

- (void)setMetaDataSection:(id)a3
{
}

- (NSDate)latestAnalyzedSampleDate
{
  return self->_latestAnalyzedSampleDate;
}

- (void)setLatestAnalyzedSampleDate:(id)a3
{
}

- (int64_t)visibleSampleCount
{
  return self->_visibleSampleCount;
}

- (void)setVisibleSampleCount:(int64_t)a3
{
  self->_visibleSampleCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestAnalyzedSampleDate, 0);
  objc_storeStrong((id *)&self->_metaDataSection, 0);
  objc_storeStrong((id *)&self->_sectionsToDisplay, 0);
  objc_storeStrong((id *)&self->_featureStatus, 0);
  objc_storeStrong((id *)&self->_tripleTapToSettingsRecognizer, 0);
  objc_storeStrong((id *)&self->_statusManager, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_storeStrong((id *)&self->_onboardingManager, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_displayType, 0);

  objc_storeStrong((id *)&self->_dataProvider, 0);
}

void __76__WDAtrialFibrillationEventOverviewViewController_recomputeTotalSampleCount__block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = (void *)OUTLINED_FUNCTION_3();
  id v5 = OUTLINED_FUNCTION_0_0(v4);
  OUTLINED_FUNCTION_0(&dword_2210D2000, v6, v7, "%{public}@: Error counting heart event samples: %{public}@", v8, v9, v10, v11, v12);
}

void __79__WDAtrialFibrillationEventOverviewViewController__getLatestAnalyzedSampleDate__block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = (void *)OUTLINED_FUNCTION_3();
  id v5 = OUTLINED_FUNCTION_0_0(v4);
  OUTLINED_FUNCTION_0(&dword_2210D2000, v6, v7, "%{public}@: Error loading latest analyzed sample time: %{public}@", v8, v9, v10, v11, v12);
}

- (void)_atrialFibrillationDetectionRescindedHeaderView
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_2(&dword_2210D2000, v3, v4, "[%{public}@]: Asked to configure rescinded header view, but IRN is not rescinded", v5, v6, v7, v8, 2u);
}

@end