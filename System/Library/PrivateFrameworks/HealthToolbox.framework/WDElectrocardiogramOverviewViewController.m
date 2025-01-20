@interface WDElectrocardiogramOverviewViewController
- (BOOL)_isElectrocardiogramRecordingAgeGated;
- (BOOL)_shouldDisplayAboutRowBeforeOnboarding;
- (BOOL)_showUpgradeTileInProminentPosition;
- (BOOL)_userLocaleOnlySupportsECG1;
- (BOOL)displayAboutRowBeforeOnboarding;
- (BOOL)firstViewDidLayoutSubviews;
- (BOOL)isPinned;
- (BOOL)shouldShowRecordingRescindedHeader;
- (HKDataMetadataSectionProtocol)educationSection;
- (HKDisplayType)displayType;
- (HKElectrocardiogramMoreHealthDataProvider)moreHealthDataProvider;
- (HKFeatureStatus)featureStatus;
- (HKFeatureStatusManager)featureStatusManager;
- (HRElectrocardiogramOnboardingManager)onboardingManager;
- (NSNumber)availabilityStateCache;
- (UITapGestureRecognizer)tripleTapToSettingsRecognizer;
- (WDElectrocardiogramFilterDataProvider)filterDataProvider;
- (WDElectrocardiogramListDataProvider)dataProvider;
- (WDElectrocardiogramOverviewSectionInfo)sectionInfo;
- (WDElectrocardiogramOverviewUserConfigurationRowInfo)userConfigurationRowInfo;
- (WDElectrocardiogramOverviewViewController)initWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5;
- (WDProfile)profile;
- (double)adjustedSafeAreaInsetTop;
- (id)_cellForDataSourcesAndAccess;
- (id)_cellForDescription;
- (id)_cellForFavorites;
- (id)_cellForRegulatoryPane;
- (id)_cellForSampleAtIndex:(int64_t)a3 section:(int64_t)a4;
- (id)_cellWithDisclosureIndicatorAndText:(id)a3 value:(id)a4;
- (id)_dataListViewControllerForSummaryData;
- (id)_dataListViewControllerWithFilterType:(int64_t)a3;
- (id)_electrocardiogramSetupContainerViewWithUpgrade:(BOOL)a3;
- (id)_recordingRescindedHeaderView;
- (id)_sectionHeaderViewWithTitle:(id)a3;
- (id)_showAllResultsCellForType:(int64_t)a3;
- (id)_showAllResultsForSummarySharingProfile;
- (id)createDataProviderWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)_availabilityStateToShowInSetupTableHeaderView;
- (int64_t)_electrocardiogramRecordingRescindedStatus;
- (int64_t)_filterTypeForDataSectionRow:(int64_t)a3;
- (int64_t)availabilityState;
- (int64_t)mode;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)placeholderCellCount;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)widthDesignationFromTraitCollection:(id)a3;
- (void)_recordingRescindedHeaderView;
- (void)_reloadAllSections;
- (void)_reloadElectrocardiogramSetupTableHeaderView;
- (void)_reloadMoreHealthSectionWithAnimation:(BOOL)a3;
- (void)_reloadTableViewAndScrollToTop;
- (void)_removeUpgradeTileNotProminentIfNeeded;
- (void)_setTableHeaderViewWithUpgradeView:(BOOL)a3;
- (void)_showDataSourcesAndAccessController;
- (void)_showUpgradeTileNotProminent;
- (void)_startOnboardingForFirstTime:(BOOL)a3;
- (void)_startUpgrade;
- (void)beginOnboardingForOnboardingSetupView:(id)a3;
- (void)dealloc;
- (void)didCompleteOnboarding;
- (void)didDismissOnboarding;
- (void)didSelectReenableFeature;
- (void)didTapOnElectrocardiogram:(id)a3;
- (void)electrocardiogramFilterDataProvider:(id)a3 didUpdateCount:(int64_t)a4 type:(int64_t)a5;
- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4;
- (void)setAvailabilityStateCache:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setDisplayAboutRowBeforeOnboarding:(BOOL)a3;
- (void)setDisplayType:(id)a3;
- (void)setEducationSection:(id)a3;
- (void)setFeatureStatus:(id)a3;
- (void)setFeatureStatusManager:(id)a3;
- (void)setFilterDataProvider:(id)a3;
- (void)setFirstViewDidLayoutSubviews:(BOOL)a3;
- (void)setMoreHealthDataProvider:(id)a3;
- (void)setOnboardingManager:(id)a3;
- (void)setPlaceholderCellCount:(int64_t)a3;
- (void)setProfile:(id)a3;
- (void)setTripleTapToSettingsRecognizer:(id)a3;
- (void)showInternalSettings;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateMarginsForWidthDesignation:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)widthDesignationDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4;
@end

@implementation WDElectrocardiogramOverviewViewController

- (WDElectrocardiogramOverviewViewController)initWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v62.receiver = self;
  v62.super_class = (Class)WDElectrocardiogramOverviewViewController;
  v11 = [(WDElectrocardiogramOverviewViewController *)&v62 initWithStyle:1];
  v12 = v11;
  if (v11)
  {
    id v60 = v9;
    v11->_firstViewDidLayoutSubviews = 1;
    p_displayType = (id *)&v11->_displayType;
    objc_storeStrong((id *)&v11->_displayType, a3);
    id v14 = objc_storeWeak((id *)&v12->_profile, v10);
    int v59 = a5;
    v12->_mode = a5;
    id v15 = *p_displayType;
    id v16 = v14;
    uint64_t v17 = [(WDElectrocardiogramOverviewViewController *)v12 createDataProviderWithDisplayType:v15 profile:v10 mode:v12->_mode];
    dataProvider = v12->_dataProvider;
    v12->_dataProvider = (WDElectrocardiogramListDataProvider *)v17;

    v12->_placeholderCellCount = 3;
    v19 = [[WDElectrocardiogramFilterDataProvider alloc] initWithProfile:v10 delegate:v12];
    filterDataProvider = v12->_filterDataProvider;
    v12->_filterDataProvider = v19;

    id v21 = objc_alloc(MEMORY[0x263F476B0]);
    v22 = [v10 healthStore];
    BOOL v23 = v12->_mode == 0;
    v24 = [(WDElectrocardiogramListDataProvider *)v12->_dataProvider activeECGAlgorithmVersion];
    uint64_t v25 = [v21 initWithHealthStore:v22 forSinglePlayer:v23 activeAlgorithmVersion:v24];
    educationSection = v12->_educationSection;
    v12->_educationSection = (HKDataMetadataSectionProtocol *)v25;

    v27 = (HKElectrocardiogramMoreHealthDataProvider *)objc_alloc_init(MEMORY[0x263F46730]);
    moreHealthDataProvider = v12->_moreHealthDataProvider;
    v12->_moreHealthDataProvider = v27;

    v29 = HKPreferredRegulatoryDomainProvider();
    v30 = [v29 currentEstimate];
    _HKInitializeLogging();
    v31 = (void *)*MEMORY[0x263F09920];
    v32 = *MEMORY[0x263F09920];
    if (v30)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = v31;
        v34 = objc_opt_class();
        id v35 = v34;
        v36 = [v30 ISOCode];
        *(_DWORD *)buf = 138543618;
        v64 = v34;
        __int16 v65 = 2112;
        v66 = v36;
        _os_log_impl(&dword_2210D2000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] Region code: %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      -[WDElectrocardiogramOverviewViewController initWithDisplayType:profile:mode:](v31);
    }
    id v37 = objc_alloc(MEMORY[0x263F0A3D0]);
    uint64_t v38 = *MEMORY[0x263F09740];
    v39 = [v10 healthStore];
    v40 = [v30 ISOCode];
    uint64_t v41 = [v37 initWithFeatureIdentifier:v38 healthStore:v39 currentCountryCode:v40];
    featureStatusManager = v12->_featureStatusManager;
    v12->_featureStatusManager = (HKFeatureStatusManager *)v41;

    v12->_displayAboutRowBeforeOnboarding = [(WDElectrocardiogramOverviewViewController *)v12 _shouldDisplayAboutRowBeforeOnboarding];
    v43 = [MEMORY[0x263F0A980] sharedBehavior];
    LODWORD(v38) = [v43 isAppleInternalInstall];

    if (v38)
    {
      uint64_t v44 = [objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v12 action:sel_showInternalSettings];
      tripleTapToSettingsRecognizer = v12->_tripleTapToSettingsRecognizer;
      v12->_tripleTapToSettingsRecognizer = (UITapGestureRecognizer *)v44;
    }
    v46 = [*p_displayType localization];
    v47 = [v46 displayName];
    [(WDElectrocardiogramOverviewViewController *)v12 setTitle:v47];

    v48 = v12->_featureStatusManager;
    id v61 = 0;
    uint64_t v49 = [(HKFeatureStatusManager *)v48 featureStatusWithError:&v61];
    id v50 = v61;
    featureStatus = v12->_featureStatus;
    v12->_featureStatus = (HKFeatureStatus *)v49;

    v52 = (os_log_t *)MEMORY[0x263F09920];
    if (!v12->_featureStatus)
    {
      _HKInitializeLogging();
      os_log_t v53 = *v52;
      if (os_log_type_enabled(*v52, OS_LOG_TYPE_ERROR)) {
        -[WDElectrocardiogramOverviewViewController initWithDisplayType:profile:mode:](v53, (uint64_t)v12, (uint64_t)v50);
      }
    }
    [(HKFeatureStatusManager *)v12->_featureStatusManager registerObserver:v12];
    _HKInitializeLogging();
    os_log_t v54 = *v52;
    if (os_log_type_enabled(*v52, OS_LOG_TYPE_DEFAULT))
    {
      v55 = v54;
      v56 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v64 = v56;
      __int16 v65 = 1024;
      LODWORD(v66) = v59;
      id v57 = v56;
      _os_log_impl(&dword_2210D2000, v55, OS_LOG_TYPE_DEFAULT, "[%{public}@] Initialized with mode: %i", buf, 0x12u);
    }
    id v9 = v60;
  }

  return v12;
}

- (void)dealloc
{
  [(HKFeatureStatusManager *)self->_featureStatusManager unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)WDElectrocardiogramOverviewViewController;
  [(WDElectrocardiogramOverviewViewController *)&v3 dealloc];
}

- (id)createDataProviderWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[WDElectrocardiogramListDataProvider alloc] initWithDisplayType:v8 profile:v7 mode:a5];

  [(WDElectrocardiogramListDataProvider *)v9 setRecentSampleLimit:3];

  return v9;
}

- (void)viewDidLoad
{
  v37[1] = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)WDElectrocardiogramOverviewViewController;
  [(HKTableViewController *)&v36 viewDidLoad];
  objc_super v3 = [(WDElectrocardiogramOverviewViewController *)self navigationItem];
  [v3 setLargeTitleDisplayMode:2];

  v4 = [(WDElectrocardiogramOverviewViewController *)self dataProvider];
  v5 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  [v4 customizeTableView:v5];

  v6 = [(WDElectrocardiogramOverviewViewController *)self dataProvider];
  LODWORD(v5) = [v6 cellStyle] == 2;

  if (v5)
  {
    id v7 = [(WDElectrocardiogramOverviewViewController *)self dataProvider];
    [v7 customEstimatedCellHeight];
    double v9 = v8;
    id v10 = [(WDElectrocardiogramOverviewViewController *)self tableView];
    [v10 setEstimatedRowHeight:v9];

    v11 = [(WDElectrocardiogramOverviewViewController *)self dataProvider];
    [v11 customCellHeight];
    double v13 = v12;
    id v14 = [(WDElectrocardiogramOverviewViewController *)self tableView];
    [v14 setRowHeight:v13];
  }
  id v15 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  [v15 setEstimatedSectionHeaderHeight:100.0];

  id v16 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  [v16 setSectionHeaderHeight:*MEMORY[0x263F1D600]];

  uint64_t v17 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  [v17 _setSectionContentInsetFollowsLayoutMargins:1];

  v18 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  [v18 _setSectionCornerRadius:*MEMORY[0x263F463A8]];

  v19 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  [v19 setSelfSizingInvalidation:2];

  v20 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  uint64_t v21 = objc_opt_class();
  v22 = +[WDHeartRhythmHeaderView defaultReuseIdentifier];
  [v20 registerClass:v21 forHeaderFooterViewReuseIdentifier:v22];

  BOOL v23 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = +[WDHeartRhythmSectionHeaderView defaultReuseIdentifier];
  [v23 registerClass:v24 forHeaderFooterViewReuseIdentifier:v25];

  [(WDElectrocardiogramOverviewViewController *)self _reloadElectrocardiogramSetupTableHeaderView];
  objc_initWeak(&location, self);
  v26 = [(WDElectrocardiogramOverviewViewController *)self dataProvider];
  uint64_t v30 = MEMORY[0x263EF8330];
  uint64_t v31 = 3221225472;
  v32 = __56__WDElectrocardiogramOverviewViewController_viewDidLoad__block_invoke;
  v33 = &unk_26458DC70;
  objc_copyWeak(&v34, &location);
  [v26 startCollectingDataWithUpdateHandler:&v30];

  v27 = objc_msgSend(MEMORY[0x263F476E0], "sharedManager", v30, v31, v32, v33);
  [v27 trackElectrocardiogramDataTypeViewed];
  v37[0] = objc_opt_class();
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];
  id v29 = (id)[(WDElectrocardiogramOverviewViewController *)self registerForTraitChanges:v28 withTarget:self action:sel_widthDesignationDidChangeWithTraitEnvironment_previousTraitCollection_];

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

void __56__WDElectrocardiogramOverviewViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setPlaceholderCellCount:0];
    v2 = [v3 tableView];
    [v2 reloadData];

    id WeakRetained = v3;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(WDElectrocardiogramOverviewViewController *)self filterDataProvider];
  [v5 start];

  v6 = [MEMORY[0x263F0A980] sharedBehavior];
  int v7 = [v6 isAppleInternalInstall];

  if (v7)
  {
    double v8 = [(WDElectrocardiogramOverviewViewController *)self tripleTapToSettingsRecognizer];
    [v8 setNumberOfTapsRequired:3];

    double v9 = [(WDElectrocardiogramOverviewViewController *)self navigationController];
    id v10 = [v9 navigationBar];
    v11 = [(WDElectrocardiogramOverviewViewController *)self tripleTapToSettingsRecognizer];
    [v10 addGestureRecognizer:v11];
  }
  v12.receiver = self;
  v12.super_class = (Class)WDElectrocardiogramOverviewViewController;
  [(WDElectrocardiogramOverviewViewController *)&v12 viewDidAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WDElectrocardiogramOverviewViewController;
  [(WDElectrocardiogramOverviewViewController *)&v9 viewDidDisappear:a3];
  v4 = [(WDElectrocardiogramOverviewViewController *)self tripleTapToSettingsRecognizer];

  if (v4)
  {
    v5 = [(WDElectrocardiogramOverviewViewController *)self navigationController];
    v6 = [v5 navigationBar];
    int v7 = [(WDElectrocardiogramOverviewViewController *)self tripleTapToSettingsRecognizer];
    [v6 removeGestureRecognizer:v7];
  }
  double v8 = [(WDElectrocardiogramOverviewViewController *)self filterDataProvider];
  [v8 stop];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)WDElectrocardiogramOverviewViewController;
  [(WDElectrocardiogramOverviewViewController *)&v6 viewDidLayoutSubviews];
  if ([(WDElectrocardiogramOverviewViewController *)self firstViewDidLayoutSubviews])
  {
    [(WDElectrocardiogramOverviewViewController *)self setFirstViewDidLayoutSubviews:0];
    BOOL v3 = [(WDElectrocardiogramOverviewViewController *)self tableView];
    v4 = [v3 tableHeaderView];
    v5 = [(WDElectrocardiogramOverviewViewController *)self tableView];
    [v5 setTableHeaderView:v4];
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WDElectrocardiogramOverviewViewController;
  [(WDElectrocardiogramOverviewViewController *)&v5 viewIsAppearing:a3];
  v4 = [(WDElectrocardiogramOverviewViewController *)self traitCollection];
  [(WDElectrocardiogramOverviewViewController *)self updateMarginsForWidthDesignation:[(WDElectrocardiogramOverviewViewController *)self widthDesignationFromTraitCollection:v4]];
}

- (void)showInternalSettings
{
  BOOL v3 = [WDElectrocardiogramInternalSettingsViewController alloc];
  v4 = [(WDElectrocardiogramOverviewViewController *)self profile];
  objc_super v5 = [v4 healthStore];
  objc_super v6 = [(WDElectrocardiogramOverviewViewController *)self profile];
  int v7 = [v6 dateCache];
  double v8 = [(WDElectrocardiogramInternalSettingsViewController *)v3 initWithHealthStore:v5 dateCache:v7];

  [(WDElectrocardiogramOverviewViewController *)self showAdaptively:v8 sender:self];
}

- (double)adjustedSafeAreaInsetTop
{
  v2 = [(WDElectrocardiogramOverviewViewController *)self view];
  [v2 safeAreaInsets];
  double v4 = v3;

  return v4;
}

- (void)_reloadTableViewAndScrollToTop
{
  double v3 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  [(WDElectrocardiogramOverviewViewController *)self adjustedSafeAreaInsetTop];
  objc_msgSend(v3, "setContentOffset:animated:", 0, 0.0, -v4);

  objc_super v5 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  [v5 reloadData];

  objc_super v6 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  [v6 layoutIfNeeded];

  int v7 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  [(WDElectrocardiogramOverviewViewController *)self adjustedSafeAreaInsetTop];
  objc_msgSend(v7, "setContentOffset:animated:", 0, 0.0, -v8);

  objc_super v9 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  id v10 = [MEMORY[0x263F088D0] indexSetWithIndex:0];
  [v9 reloadSections:v10 withRowAnimation:5];

  [(WDElectrocardiogramOverviewViewController *)self _reloadElectrocardiogramSetupTableHeaderView];
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  _HKInitializeLogging();
  objc_super v6 = (void *)*MEMORY[0x263F09920];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = v6;
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v8 = v13;
    _os_log_impl(&dword_2210D2000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did update feature status.", buf, 0xCu);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __91__WDElectrocardiogramOverviewViewController_featureStatusProviding_didUpdateFeatureStatus___block_invoke;
  v10[3] = &unk_26458DB58;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

void __91__WDElectrocardiogramOverviewViewController_featureStatusProviding_didUpdateFeatureStatus___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) availabilityStateCache];

  if (v2)
  {
    [*(id *)(a1 + 32) setAvailabilityStateCache:0];
    _HKInitializeLogging();
    double v3 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
    {
      double v4 = v3;
      *(_DWORD *)id v8 = 138543362;
      *(void *)&v8[4] = objc_opt_class();
      id v5 = *(id *)&v8[4];
      _os_log_impl(&dword_2210D2000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Availabilility cache invalidated.", v8, 0xCu);
    }
  }
  objc_super v6 = objc_msgSend(*(id *)(a1 + 32), "featureStatus", *(_OWORD *)v8);
  char v7 = [v6 isEqual:*(void *)(a1 + 40)];

  if ((v7 & 1) == 0)
  {
    [*(id *)(a1 + 32) setFeatureStatus:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _reloadTableViewAndScrollToTop];
  }
}

- (void)widthDesignationDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = [a3 traitCollection];
  int64_t v6 = [(WDElectrocardiogramOverviewViewController *)self widthDesignationFromTraitCollection:v5];

  [(WDElectrocardiogramOverviewViewController *)self updateMarginsForWidthDesignation:v6];
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
  id v12 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  objc_msgSend(v12, "setDirectionalLayoutMargins:", v5, v7, v9, v11);
}

- (void)_startOnboardingForFirstTime:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc(MEMORY[0x263F476B8]);
  double v6 = [(WDElectrocardiogramOverviewViewController *)self profile];
  double v7 = [v6 healthStore];
  double v8 = [(WDElectrocardiogramOverviewViewController *)self profile];
  double v9 = [v8 dateCache];
  LOBYTE(v13) = 1;
  double v10 = (void *)[v5 initWithOnboardingType:0 isFirstTimeOnboarding:v3 healthStore:v7 dateCache:v9 provenance:2 delegate:self isSampleInteractive:v13];
  [(WDElectrocardiogramOverviewViewController *)self setOnboardingManager:v10];

  double v11 = [(WDElectrocardiogramOverviewViewController *)self onboardingManager];
  id v14 = [v11 onboardingNavigationController];

  [v14 setModalInPresentation:1];
  id v12 = [(WDElectrocardiogramOverviewViewController *)self navigationController];
  [v12 presentViewController:v14 animated:1 completion:0];
}

- (void)_startUpgrade
{
  id v3 = objc_alloc(MEMORY[0x263F476B8]);
  double v4 = [(WDElectrocardiogramOverviewViewController *)self profile];
  id v5 = [v4 healthStore];
  double v6 = [(WDElectrocardiogramOverviewViewController *)self profile];
  double v7 = [v6 dateCache];
  LOBYTE(v11) = 1;
  double v8 = (void *)[v3 initWithOnboardingType:1 isFirstTimeOnboarding:0 healthStore:v5 dateCache:v7 provenance:2 delegate:self isSampleInteractive:v11];
  [(WDElectrocardiogramOverviewViewController *)self setOnboardingManager:v8];

  double v9 = [(WDElectrocardiogramOverviewViewController *)self onboardingManager];
  id v12 = [v9 onboardingNavigationController];

  [v12 setModalInPresentation:1];
  double v10 = [(WDElectrocardiogramOverviewViewController *)self navigationController];
  [v10 presentViewController:v12 animated:1 completion:0];
}

- (WDElectrocardiogramOverviewSectionInfo)sectionInfo
{
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  id v5 = [(WDElectrocardiogramOverviewViewController *)self dataProvider];
  uint64_t v6 = [v5 numberOfSections];

  int64_t v7 = [(WDElectrocardiogramOverviewViewController *)self placeholderCellCount];
  double v8 = [(WDElectrocardiogramOverviewViewController *)self moreHealthDataProvider];
  uint64_t v9 = [v8 count];

  double v10 = [(WDElectrocardiogramOverviewViewController *)self filterDataProvider];

  int64_t mode = self->_mode;
  if (!mode)
  {
    result = [(WDElectrocardiogramOverviewViewController *)self availabilityState];
    switch((unint64_t)result)
    {
      case 0uLL:
      case 3uLL:
        if (v6) {
          BOOL v26 = 0;
        }
        else {
          BOOL v26 = v7 <= 0;
        }
        int64_t v27 = !v26;
        if (v26) {
          int64_t v28 = -1;
        }
        else {
          int64_t v28 = 0;
        }
        int64_t v29 = 1;
        if (v27) {
          int64_t v29 = 2;
        }
        if (!v10)
        {
          int64_t v29 = v27;
          int64_t v27 = -1;
        }
        retstr->var0 = v28;
        retstr->var1 = v27;
        retstr->var2 = v29;
        retstr->var3 = v29 + 1;
        BOOL v30 = v9 <= 0;
        if (v9 <= 0) {
          int64_t v31 = v29 + 2;
        }
        else {
          int64_t v31 = v29 + 3;
        }
        if (v30) {
          int64_t v32 = -1;
        }
        else {
          int64_t v32 = v29 + 2;
        }
        retstr->var4 = v32;
        retstr->var5 = v31;
        result = [(WDElectrocardiogramOverviewViewController *)self userConfigurationRowInfo];
        uint64_t v33 = v47;
        goto LABEL_79;
      case 1uLL:
        int64_t v34 = v6 != 0;
        if (v6) {
          int64_t v35 = 0;
        }
        else {
          int64_t v35 = -1;
        }
        int64_t v36 = 1;
        if (v6) {
          int64_t v36 = 2;
        }
        if (!v10)
        {
          int64_t v36 = v6 != 0;
          int64_t v34 = -1;
        }
        retstr->var0 = v35;
        retstr->var1 = v34;
        retstr->var2 = -1;
        retstr->var3 = v36;
        BOOL v37 = v9 <= 0;
        if (v9 <= 0) {
          int64_t v31 = v36 + 1;
        }
        else {
          int64_t v31 = v36 + 2;
        }
        if (v37) {
          int64_t v38 = -1;
        }
        else {
          int64_t v38 = v36 + 1;
        }
        retstr->var4 = v38;
        retstr->var5 = v31;
        result = [(WDElectrocardiogramOverviewViewController *)self userConfigurationRowInfo];
        uint64_t v33 = v46;
        goto LABEL_79;
      case 2uLL:
        int64_t v39 = v6 != 0;
        if (v6) {
          int64_t v40 = 0;
        }
        else {
          int64_t v40 = -1;
        }
        int64_t v41 = 1;
        if (v6) {
          int64_t v41 = 2;
        }
        if (!v10)
        {
          int64_t v41 = v6 != 0;
          int64_t v39 = -1;
        }
        retstr->var0 = v40;
        retstr->var1 = v39;
        retstr->var2 = -1;
        retstr->var3 = v41;
        BOOL v42 = v9 <= 0;
        if (v9 <= 0) {
          int64_t v31 = v41 + 1;
        }
        else {
          int64_t v31 = v41 + 2;
        }
        if (v42) {
          int64_t v43 = -1;
        }
        else {
          int64_t v43 = v41 + 1;
        }
        retstr->var4 = v43;
        retstr->var5 = v31;
        result = [(WDElectrocardiogramOverviewViewController *)self userConfigurationRowInfo];
        uint64_t v33 = v45;
LABEL_79:
        BOOL v44 = v33 <= 0;
        if (v33 <= 0) {
          int64_t v24 = v31 + 1;
        }
        else {
          int64_t v24 = v31 + 2;
        }
        if (v44) {
          int64_t v25 = -1;
        }
        else {
          int64_t v25 = v31 + 1;
        }
        goto LABEL_85;
      default:
        return result;
    }
  }
  if (v6) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = v7 <= 0;
  }
  int64_t v13 = !v12;
  if (v12) {
    int64_t v14 = -1;
  }
  else {
    int64_t v14 = 0;
  }
  uint64_t v15 = 1;
  if (v13) {
    uint64_t v15 = 2;
  }
  BOOL v16 = mode == 1;
  if (mode == 1) {
    int64_t v17 = v15;
  }
  else {
    int64_t v17 = v13;
  }
  if (!v16) {
    int64_t v13 = -1;
  }
  retstr->var0 = v14;
  retstr->var1 = v13;
  int64_t v18 = v17 + 2;
  retstr->var2 = v17;
  retstr->var3 = v17 + 1;
  int64_t v19 = v17 + 3;
  BOOL v20 = v9 <= 0;
  if (v9 <= 0) {
    int64_t v21 = v18;
  }
  else {
    int64_t v21 = v19;
  }
  if (v20) {
    int64_t v22 = -1;
  }
  else {
    int64_t v22 = v18;
  }
  retstr->var4 = v22;
  retstr->var5 = -1;
  result = [(WDElectrocardiogramOverviewViewController *)self userConfigurationRowInfo];
  if (v48 <= 0) {
    int64_t v24 = v21;
  }
  else {
    int64_t v24 = v21 + 1;
  }
  if (v48 <= 0) {
    int64_t v25 = -1;
  }
  else {
    int64_t v25 = v21;
  }
LABEL_85:
  retstr->var6 = v25;
  retstr->var7 = v24;
  return result;
}

- (WDElectrocardiogramOverviewUserConfigurationRowInfo)userConfigurationRowInfo
{
  retstr->var0 = 0;
  retstr->int64_t var1 = 0;
  retstr->var2 = 0;
  int64_t var1 = self[44].var1;
  if (var1 == 1)
  {
    int64_t v6 = -1;
LABEL_6:
    retstr->var0 = v6;
    retstr->var2 = var1;
  }
  else if (var1 != 2)
  {
    id v5 = self;
    self = (WDElectrocardiogramOverviewUserConfigurationRowInfo *)[(WDElectrocardiogramOverviewUserConfigurationRowInfo *)self availabilityState];
    switch((unint64_t)self)
    {
      case 0uLL:
      case 3uLL:
        retstr->int64_t var1 = 0;
        int64_t var1 = 2;
        int64_t v6 = 1;
        goto LABEL_6;
      case 1uLL:
        int v7 = BYTE1(v5[43].var0);
        retstr->int64_t var1 = 0;
        BOOL v8 = v7 == 0;
        if (v7) {
          int64_t v6 = 1;
        }
        else {
          int64_t v6 = -1;
        }
        int64_t var1 = 1;
        if (!v8) {
          int64_t var1 = 2;
        }
        goto LABEL_6;
      case 2uLL:
        retstr->int64_t var1 = 0;
        int64_t v6 = -1;
        int64_t var1 = 1;
        goto LABEL_6;
      default:
        return self;
    }
  }
  return self;
}

- (int64_t)availabilityState
{
  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v4 = objc_msgSend(v3, "hk_keyExists:", @"WDCinnamonOnboardingStateOverrideKey");

  if (v4)
  {
    id v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v6 = [v5 integerForKey:@"WDCinnamonOnboardingStateOverrideKey"];
LABEL_5:
    BOOL v8 = (void *)v6;
    goto LABEL_6;
  }
  int v7 = [(WDElectrocardiogramOverviewViewController *)self availabilityStateCache];

  if (v7)
  {
    id v5 = [(WDElectrocardiogramOverviewViewController *)self availabilityStateCache];
    uint64_t v6 = [v5 integerValue];
    goto LABEL_5;
  }
  BOOL v8 = [(WDElectrocardiogramOverviewViewController *)self featureStatus];

  if (!v8) {
    return (int64_t)v8;
  }
  double v10 = [(WDElectrocardiogramOverviewViewController *)self featureStatus];
  BOOL v8 = (void *)HKElectrocardiogramOverviewAvailabilityState(v10);

  id v5 = [NSNumber numberWithInteger:v8];
  [(WDElectrocardiogramOverviewViewController *)self setAvailabilityStateCache:v5];
LABEL_6:

  return (int64_t)v8;
}

- (BOOL)shouldShowRecordingRescindedHeader
{
  if ([(WDElectrocardiogramOverviewViewController *)self availabilityState] == 2)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    int64_t v3 = [(WDElectrocardiogramOverviewViewController *)self _electrocardiogramRecordingRescindedStatus];
    if (v3) {
      LOBYTE(v3) = [(WDElectrocardiogramOverviewViewController *)self mode] == 0;
    }
  }
  return v3;
}

- (BOOL)isPinned
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  [(WDElectrocardiogramOverviewViewController *)self sectionInfo];
  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  [(WDElectrocardiogramOverviewViewController *)self sectionInfo];
  if (a4) {
    return 0;
  }
  uint64_t v6 = [(WDElectrocardiogramOverviewViewController *)self dataProvider];
  int64_t v7 = [v6 numberOfObjectsForSection:0];

  if ([(WDElectrocardiogramOverviewViewController *)self mode] == 2 && v7 > 5) {
    return 6;
  }
  int64_t v9 = [(WDElectrocardiogramOverviewViewController *)self placeholderCellCount];
  if (v9 <= v7) {
    return v7;
  }
  else {
    return v9;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(WDElectrocardiogramOverviewViewController *)self sectionInfo];
  if (![v7 section])
  {
    if (-[WDElectrocardiogramOverviewViewController mode](self, "mode") == 2 && [v7 row] == 5)
    {
      id v8 = [(WDElectrocardiogramOverviewViewController *)self _showAllResultsForSummarySharingProfile];
    }
    else
    {
      -[WDElectrocardiogramOverviewViewController _cellForSampleAtIndex:section:](self, "_cellForSampleAtIndex:section:", [v7 row], objc_msgSend(v7, "section"));
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_9;
  }
  if (![v7 section])
  {
    if (!self->_mode)
    {
      int64_t v12 = [(WDElectrocardiogramOverviewViewController *)self availabilityState];
      if ((unint64_t)(v12 - 1) < 2 || v12 != 3 && v12)
      {
        double v10 = +[WDElectrocardiogramFilterDataProvider cellTitleForType:0];
        uint64_t v11 = [(WDElectrocardiogramOverviewViewController *)self _cellWithDisclosureIndicatorAndText:v10 value:0];
        goto LABEL_20;
      }
    }
    -[WDElectrocardiogramOverviewViewController _showAllResultsCellForType:](self, "_showAllResultsCellForType:", -[WDElectrocardiogramOverviewViewController _filterTypeForDataSectionRow:](self, "_filterTypeForDataSectionRow:", [v7 row]));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ([v7 section])
  {
    if ([v7 section])
    {
      if (![v7 section])
      {
        double v10 = [(WDElectrocardiogramOverviewViewController *)self moreHealthDataProvider];
        uint64_t v11 = objc_msgSend(v10, "cellForRow:tableView:", objc_msgSend(v7, "row"), v6);
        goto LABEL_20;
      }
      if ([v7 section])
      {
        if (![v7 section])
        {
          [(WDElectrocardiogramOverviewViewController *)self userConfigurationRowInfo];
          if (![v7 row])
          {
            id v8 = [(WDElectrocardiogramOverviewViewController *)self _cellForDataSourcesAndAccess];
            goto LABEL_9;
          }
          if (![v7 row])
          {
            id v8 = [(WDElectrocardiogramOverviewViewController *)self _cellForRegulatoryPane];
            goto LABEL_9;
          }
        }
        id v8 = objc_alloc_init(MEMORY[0x263F1CA48]);
        goto LABEL_9;
      }
      id v8 = [(WDElectrocardiogramOverviewViewController *)self _cellForFavorites];
    }
    else
    {
      id v8 = [(WDElectrocardiogramOverviewViewController *)self _cellForDescription];
    }
LABEL_9:
    int64_t v9 = v8;
    goto LABEL_21;
  }
  double v10 = [(WDElectrocardiogramOverviewViewController *)self educationSection];
  uint64_t v11 = objc_msgSend(v10, "cellForIndex:tableView:", objc_msgSend(v7, "row"), v6);
LABEL_20:
  int64_t v9 = (void *)v11;

LABEL_21:

  return v9;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  [(WDElectrocardiogramOverviewViewController *)self sectionInfo];
  if (a4)
  {
    id v7 = 0;
  }
  else
  {
    id v5 = WDBundle();
    id v6 = [v5 localizedStringForKey:@"PINNED_SECTION_FOOTER" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
    id v7 = HKConditionallyRedactedHeartRhythmString();
  }

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (!a4
    && [(WDElectrocardiogramOverviewViewController *)self shouldShowRecordingRescindedHeader])
  {
    id v7 = [(WDElectrocardiogramOverviewViewController *)self _recordingRescindedHeaderView];
    goto LABEL_12;
  }
  [(WDElectrocardiogramOverviewViewController *)self sectionInfo];
  if (v14 == a4)
  {
    if ([(WDElectrocardiogramOverviewViewController *)self mode] == 2)
    {
      id v8 = WDBundle();
      int64_t v9 = v8;
      double v10 = @"RECENT_RESULTS_TITLE";
LABEL_10:
      uint64_t v11 = [v8 localizedStringForKey:v10 value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
      int64_t v12 = HKConditionallyRedactedHeartRhythmString();
      id v7 = [(WDElectrocardiogramOverviewViewController *)self _sectionHeaderViewWithTitle:v12];

      goto LABEL_12;
    }
  }
  else if (!a4)
  {
    id v8 = WDBundle();
    int64_t v9 = v8;
    double v10 = @"MORE_SECTION_TITLE";
    goto LABEL_10;
  }
  id v7 = 0;
LABEL_12:

  return v7;
}

- (id)_sectionHeaderViewWithTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  id v6 = +[WDHeartRhythmSectionHeaderView defaultReuseIdentifier];
  id v7 = [v5 dequeueReusableHeaderFooterViewWithIdentifier:v6];

  [v7 setTitleText:v4];
  id v8 = [@"Overview" stringByAppendingFormat:@".SectionHeader.%@", v4];

  int64_t v9 = [NSString healthAccessibilityIdentifier:1 suffix:v8];
  [v7 setAccessibilityIdentifier:v9];

  return v7;
}

- (id)_recordingRescindedHeaderView
{
  int64_t v3 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  id v4 = +[WDHeartRhythmHeaderView defaultReuseIdentifier];
  id v5 = [v3 dequeueReusableHeaderFooterViewWithIdentifier:v4];

  int64_t v6 = [(WDElectrocardiogramOverviewViewController *)self _electrocardiogramRecordingRescindedStatus];
  if (v6 == 2)
  {
    uint64_t v14 = WDBundle();
    uint64_t v15 = [v14 localizedStringForKey:@"ELECTROCARDIOGRAM_RECORDING_SEED_EXPIRED_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
    BOOL v16 = HKConditionallyRedactedHeartRhythmString();
    [v5 setTitleText:v16];

    double v10 = WDBundle();
    uint64_t v11 = [v10 localizedStringForKey:@"ELECTROCARDIOGRAM_RECORDING_SEED_EXPIRED_LEARN_MORE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
    int64_t v17 = HKConditionallyRedactedHeartRhythmString();
    int64_t v18 = NSURL;
    int64_t v19 = WDBundle();
    BOOL v20 = [v19 localizedStringForKey:@"ELECTROCARDIOGRAM_RECORDING_SEED_EXPIRED_URL" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
    int64_t v21 = HKConditionallyRedactedHeartRhythmString();
    int64_t v22 = [v18 URLWithString:v21];
    [v5 setBodyText:0 URLText:v17 URL:v22];

    goto LABEL_5;
  }
  if (v6 == 1)
  {
    id v7 = WDBundle();
    id v8 = [v7 localizedStringForKey:@"ELECTROCARDIOGRAM_RECORDING_DISABLED_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
    int64_t v9 = HKConditionallyRedactedHeartRhythmString();
    [v5 setTitleText:v9];

    double v10 = WDBundle();
    uint64_t v11 = [v10 localizedStringForKey:@"ELECTROCARDIOGRAM_RECORDING_DISABLED_LEARN_MORE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
    int64_t v12 = HKConditionallyRedactedHeartRhythmString();
    int64_t v13 = [NSURL URLWithString:*MEMORY[0x263F09538]];
    [v5 setBodyText:0 URLText:v12 URL:v13];

LABEL_5:
    goto LABEL_8;
  }
  _HKInitializeLogging();
  BOOL v23 = (void *)*MEMORY[0x263F09920];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
    -[WDElectrocardiogramOverviewViewController _recordingRescindedHeaderView](v23);
  }
LABEL_8:

  return v5;
}

- (int64_t)_electrocardiogramRecordingRescindedStatus
{
  int64_t v3 = [(WDElectrocardiogramOverviewViewController *)self featureStatus];

  if (v3)
  {
    id v4 = [(WDElectrocardiogramOverviewViewController *)self featureStatus];
    id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F09600]];
    int64_t v6 = [v5 unsatisfiedRequirementIdentifiers];

    if ([v6 containsObject:*MEMORY[0x263F09708]]) {
      int64_t v3 = 2;
    }
    else {
      int64_t v3 = [v6 containsObject:*MEMORY[0x263F09670]];
    }
  }
  return v3;
}

- (BOOL)_isElectrocardiogramRecordingAgeGated
{
  int64_t v3 = [(WDElectrocardiogramOverviewViewController *)self featureStatus];

  if (!v3) {
    return 0;
  }
  id v4 = [(WDElectrocardiogramOverviewViewController *)self featureStatus];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F09600]];
  int64_t v6 = [v5 unsatisfiedRequirementIdentifiers];

  LOBYTE(v4) = [v6 containsObject:*MEMORY[0x263F096B0]];
  return (char)v4;
}

- (int64_t)_availabilityStateToShowInSetupTableHeaderView
{
  if (self->_mode) {
    return 0;
  }
  int64_t v4 = [(WDElectrocardiogramOverviewViewController *)self availabilityState];
  int64_t v5 = [(WDElectrocardiogramOverviewViewController *)self _electrocardiogramRecordingRescindedStatus];
  BOOL v6 = [(WDElectrocardiogramOverviewViewController *)self _isElectrocardiogramRecordingAgeGated];
  if (v5) {
    int v7 = 1;
  }
  else {
    int v7 = v6;
  }
  BOOL v8 = v7 == 0;
  int64_t v9 = 2;
  if (v8) {
    int64_t v9 = 3;
  }
  int64_t v10 = 2;
  if (v5) {
    int v11 = 1;
  }
  else {
    int v11 = v6;
  }
  BOOL v8 = v11 == 0;
  uint64_t v12 = 1;
  if (!v8) {
    uint64_t v12 = 2;
  }
  if (v4 != 1) {
    uint64_t v12 = 0;
  }
  if (v4 != 2) {
    int64_t v10 = v12;
  }
  if (v4 == 3) {
    return v9;
  }
  else {
    return v10;
  }
}

- (void)_reloadElectrocardiogramSetupTableHeaderView
{
  switch([(WDElectrocardiogramOverviewViewController *)self _availabilityStateToShowInSetupTableHeaderView])
  {
    case 0:
    case 2:
      [(WDElectrocardiogramOverviewViewController *)self _removeUpgradeTileNotProminentIfNeeded];
      id v3 = objc_alloc(MEMORY[0x263F1CB60]);
      id v11 = [(WDElectrocardiogramOverviewViewController *)self tableView];
      [v11 bounds];
      int64_t v4 = objc_msgSend(v3, "initWithFrame:", 0.0, 0.0);
      int64_t v5 = [(WDElectrocardiogramOverviewViewController *)self tableView];
      [v5 setTableHeaderView:v4];

      goto LABEL_10;
    case 1:
      [(WDElectrocardiogramOverviewViewController *)self _removeUpgradeTileNotProminentIfNeeded];
      BOOL v6 = self;
      uint64_t v7 = 0;
      goto LABEL_6;
    case 3:
      if ([(WDElectrocardiogramOverviewViewController *)self _showUpgradeTileInProminentPosition])
      {
        BOOL v6 = self;
        uint64_t v7 = 1;
LABEL_6:
        [(WDElectrocardiogramOverviewViewController *)v6 _setTableHeaderViewWithUpgradeView:v7];
      }
      else
      {
        [(WDElectrocardiogramOverviewViewController *)self _showUpgradeTileNotProminent];
        BOOL v8 = [(WDElectrocardiogramOverviewViewController *)self tableView];
        [v8 bounds];
        double Width = CGRectGetWidth(v13);

        id v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, Width, 2.22507386e-308);
        int64_t v10 = [(WDElectrocardiogramOverviewViewController *)self tableView];
        [v10 setTableHeaderView:v11];

LABEL_10:
      }
      return;
    default:
      return;
  }
}

- (void)_showUpgradeTileNotProminent
{
  id v5 = [(WDElectrocardiogramOverviewViewController *)self _electrocardiogramSetupContainerViewWithUpgrade:1];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F46738]) initWithView:v5 identifier:@"UpgradeTileNotProminentIdentifier"];
  int64_t v4 = [(WDElectrocardiogramOverviewViewController *)self moreHealthDataProvider];
  [v4 addItem:v3];
}

- (void)_removeUpgradeTileNotProminentIfNeeded
{
  id v3 = [(WDElectrocardiogramOverviewViewController *)self moreHealthDataProvider];
  [v3 removeItemWithIdentifier:@"UpgradeTileNotProminentIdentifier"];

  [(WDElectrocardiogramOverviewViewController *)self _reloadMoreHealthSectionWithAnimation:0];
}

- (void)_reloadMoreHealthSectionWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  [(WDElectrocardiogramOverviewViewController *)self sectionInfo];
  id v5 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndex:");
  if (v3) {
    uint64_t v6 = 100;
  }
  else {
    uint64_t v6 = 5;
  }
  uint64_t v7 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  [v7 reloadSections:v5 withRowAnimation:v6];
}

- (BOOL)_showUpgradeTileInProminentPosition
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([(WDElectrocardiogramOverviewViewController *)self _userLocaleOnlySupportsECG1])
  {
    _HKInitializeLogging();
    BOOL v3 = *MEMORY[0x263F09920];
    BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v4)
    {
      int v8 = 138543362;
      int64_t v9 = self;
      _os_log_impl(&dword_2210D2000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: ECG1 only country. Demote upgrade ad.", (uint8_t *)&v8, 0xCu);
      return 0;
    }
  }
  else
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFFA40], "hk_heartRhythmDefaults");
    char v7 = [v6 BOOLForKey:@"PromimentUpgradeTileDismissed"];

    return v7 ^ 1;
  }
  return result;
}

- (BOOL)_userLocaleOnlySupportsECG1
{
  v2 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  BOOL v3 = (void *)MEMORY[0x263F0A448];
  BOOL v4 = [v2 countryCode];
  LOBYTE(v3) = [v3 isECG1SupportedOnlyForCountryCode:v4];

  return (char)v3;
}

- (void)_reloadAllSections
{
  BOOL v3 = [WDElectrocardiogramFilterDataProvider alloc];
  BOOL v4 = [(WDElectrocardiogramOverviewViewController *)self profile];
  id v5 = [(WDElectrocardiogramFilterDataProvider *)v3 initWithProfile:v4 delegate:self];
  [(WDElectrocardiogramOverviewViewController *)self setFilterDataProvider:v5];

  id v6 = objc_alloc(MEMORY[0x263F476B0]);
  char v7 = [(WDElectrocardiogramOverviewViewController *)self profile];
  int v8 = [v7 healthStore];
  BOOL v9 = self->_mode == 0;
  uint64_t v10 = [(WDElectrocardiogramOverviewViewController *)self dataProvider];
  id v11 = [v10 activeECGAlgorithmVersion];
  uint64_t v12 = (void *)[v6 initWithHealthStore:v8 forSinglePlayer:v9 activeAlgorithmVersion:v11];
  [(WDElectrocardiogramOverviewViewController *)self setEducationSection:v12];

  CGRect v13 = [(WDElectrocardiogramOverviewViewController *)self filterDataProvider];
  [v13 start];

  id v14 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  [v14 reloadData];
}

- (void)_setTableHeaderViewWithUpgradeView:(BOOL)a3
{
  id v19 = [(WDElectrocardiogramOverviewViewController *)self _electrocardiogramSetupContainerViewWithUpgrade:a3];
  BOOL v4 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  [v4 setTableHeaderView:v19];

  id v5 = [v19 widthAnchor];
  id v6 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  char v7 = [v6 widthAnchor];
  int v8 = [v5 constraintEqualToAnchor:v7];
  [v8 setActive:1];

  BOOL v9 = [v19 centerXAnchor];
  uint64_t v10 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  id v11 = [v10 centerXAnchor];
  uint64_t v12 = [v9 constraintEqualToAnchor:v11];
  [v12 setActive:1];

  CGRect v13 = [v19 topAnchor];
  id v14 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  uint64_t v15 = [v14 topAnchor];
  BOOL v16 = [v13 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  int64_t v17 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  int64_t v18 = [v17 tableHeaderView];
  [v18 layoutIfNeeded];
}

- (id)_electrocardiogramSetupContainerViewWithUpgrade:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc(MEMORY[0x263F1CB60]);
  double v6 = *MEMORY[0x263F001A8];
  double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
  uint64_t v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], v7, v8, v9);
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v11 = off_26458D878;
  if (!v3) {
    id v11 = off_26458D870;
  }
  uint64_t v12 = objc_msgSend(objc_alloc(*v11), "initWithFrame:", v6, v7, v8, v9);
  [v12 setDelegate:self];
  [v10 addSubview:v12];
  objc_msgSend(v12, "hk_alignConstraintsWithView:", v10);

  return v10;
}

- (id)_cellForSampleAtIndex:(int64_t)a3 section:(int64_t)a4
{
  double v7 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:");
  double v8 = [(WDElectrocardiogramOverviewViewController *)self dataProvider];
  unint64_t v9 = [v8 numberOfObjectsForSection:a4];

  uint64_t v10 = [(WDElectrocardiogramOverviewViewController *)self dataProvider];
  id v11 = v10;
  if (v9 <= a3)
  {
    CGRect v13 = [(WDElectrocardiogramOverviewViewController *)self tableView];
    uint64_t v15 = [v11 placeholderCellAtIndexPath:v7 tableView:v13];
  }
  else
  {
    uint64_t v12 = [v10 objectAtIndex:a3 forSection:a4];

    CGRect v13 = [(WDElectrocardiogramOverviewViewController *)self dataProvider];
    id v14 = [(WDElectrocardiogramOverviewViewController *)self tableView];
    uint64_t v15 = [v13 customCellForObject:v12 indexPath:v7 tableView:v14];

    id v11 = (void *)v12;
  }

  return v15;
}

- (id)_showAllResultsCellForType:(int64_t)a3
{
  id v5 = +[WDElectrocardiogramFilterDataProvider cellTitleForType:](WDElectrocardiogramFilterDataProvider, "cellTitleForType:");
  [(WDElectrocardiogramOverviewViewController *)self sectionInfo];
  if (v10 == -1)
  {
    double v7 = 0;
  }
  else
  {
    double v6 = [(WDElectrocardiogramOverviewViewController *)self filterDataProvider];
    double v7 = [v6 displayStringCountForType:a3];
  }
  double v8 = [(WDElectrocardiogramOverviewViewController *)self _cellWithDisclosureIndicatorAndText:v5 value:v7];

  return v8;
}

- (id)_showAllResultsForSummarySharingProfile
{
  BOOL v3 = +[WDElectrocardiogramFilterDataProvider cellTitleForType:0];
  BOOL v4 = HKIntegerFormatter();
  id v5 = NSNumber;
  double v6 = [(WDElectrocardiogramOverviewViewController *)self dataProvider];
  double v7 = [v6 samples];
  double v8 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v7, "count"));
  unint64_t v9 = [v4 stringFromNumber:v8];

  uint64_t v10 = [(WDElectrocardiogramOverviewViewController *)self _cellWithDisclosureIndicatorAndText:v3 value:v9];

  return v10;
}

- (id)_cellForFavorites
{
  id v3 = objc_alloc(MEMORY[0x263F46758]);
  BOOL v4 = [MEMORY[0x263F46758] reuseIdentifier];
  id v5 = (void *)[v3 initWithStyle:0 reuseIdentifier:v4];

  objc_msgSend(v5, "setFavorited:", -[WDElectrocardiogramOverviewViewController isPinned](self, "isPinned"));

  return v5;
}

- (id)_cellForDataSourcesAndAccess
{
  id v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  BOOL v4 = [v3 localizedStringForKey:@"SHARE_DATA_TITLE" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  id v5 = [(WDElectrocardiogramOverviewViewController *)self _cellWithDisclosureIndicatorAndText:v4 value:0];

  return v5;
}

- (id)_cellForRegulatoryPane
{
  id v3 = WDBundle();
  BOOL v4 = [v3 localizedStringForKey:@"REGULATORY_PANE_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
  id v5 = HKConditionallyRedactedHeartRhythmString();
  double v6 = [(WDElectrocardiogramOverviewViewController *)self _cellWithDisclosureIndicatorAndText:v5 value:0];

  return v6;
}

- (id)_cellForDescription
{
  id v3 = [WDDisplayTypeDescriptionTableViewCell alloc];
  BOOL v4 = [(WDElectrocardiogramOverviewViewController *)self displayType];
  id v5 = +[WDDisplayTypeDescriptionTableViewCell defaultReuseIdentifier];
  double v6 = [(WDDisplayTypeDescriptionTableViewCell *)v3 initWithDisplayType:v4 showAttributionText:0 reuseIdentifier:v5];

  [(WDDisplayTypeDescriptionTableViewCell *)v6 setSelectionStyle:0];
  double v7 = [NSString healthAccessibilityIdentifier:1 suffix:@"AboutEcgDescription"];
  [(WDDisplayTypeDescriptionTableViewCell *)v6 setAccessibilityIdentifier:v7];

  return v6;
}

- (id)_cellWithDisclosureIndicatorAndText:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(WDElectrocardiogramOverviewViewController *)self tableView];
  unint64_t v9 = [v8 dequeueReusableCellWithIdentifier:@"_Value1CellIdentifier"];

  if (!v9) {
    unint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:1 reuseIdentifier:@"_Value1CellIdentifier"];
  }
  uint64_t v10 = [v9 textLabel];
  [v10 setText:v7];

  id v11 = [v9 textLabel];
  [v11 setNumberOfLines:0];

  uint64_t v12 = [v9 detailTextLabel];
  [v12 setText:v6];

  [v9 setAccessoryType:1];
  CGRect v13 = [@"Overview" stringByAppendingFormat:@".Cell.%@", v7];

  id v14 = [NSString healthAccessibilityIdentifier:1 suffix:v13];
  [v9 setAccessibilityIdentifier:v14];

  return v9;
}

- (int64_t)_filterTypeForDataSectionRow:(int64_t)a3
{
  return a3;
}

- (void)electrocardiogramFilterDataProvider:(id)a3 didUpdateCount:(int64_t)a4 type:(int64_t)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __101__WDElectrocardiogramOverviewViewController_electrocardiogramFilterDataProvider_didUpdateCount_type___block_invoke;
  v5[3] = &unk_26458DCC0;
  v5[4] = self;
  v5[5] = a5;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __101__WDElectrocardiogramOverviewViewController_electrocardiogramFilterDataProvider_didUpdateCount_type___block_invoke(uint64_t a1)
{
  uint64_t v9 = 0;
  v2 = *(void **)(a1 + 32);
  if (v2) {
    objc_msgSend(v2, "sectionInfo", 0);
  }
  id v3 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", *(void *)(a1 + 40), 0, v9);
  BOOL v4 = [*(id *)(a1 + 32) tableView];
  id v5 = [v4 cellForRowAtIndexPath:v3];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) filterDataProvider];
    id v7 = [v6 displayStringCountForType:*(void *)(a1 + 40)];
    double v8 = [v5 detailTextLabel];
    [v8 setText:v7];
  }
}

- (void)beginOnboardingForOnboardingSetupView:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  BOOL v4 = *MEMORY[0x263F09920];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446210;
    double v8 = "-[WDElectrocardiogramOverviewViewController beginOnboardingForOnboardingSetupView:]";
    _os_log_impl(&dword_2210D2000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}s]: Install of ECG app will be triggered after a location check in onboarding", (uint8_t *)&v7, 0xCu);
  }
  int64_t v5 = [(WDElectrocardiogramOverviewViewController *)self availabilityState];
  if (v5 == 3)
  {
    id v6 = objc_msgSend(MEMORY[0x263EFFA40], "hk_heartRhythmDefaults");
    [v6 setBool:1 forKey:@"PromimentUpgradeTileDismissed"];

    [(WDElectrocardiogramOverviewViewController *)self _startUpgrade];
  }
  else if (v5 == 1)
  {
    [(WDElectrocardiogramOverviewViewController *)self _startOnboardingForFirstTime:1];
  }
}

- (void)didTapOnElectrocardiogram:(id)a3
{
  id v4 = a3;
  [(WDElectrocardiogramOverviewViewController *)self _reloadAllSections];
  int64_t v5 = [(WDElectrocardiogramOverviewViewController *)self onboardingManager];
  [v5 dismissOnboarding];

  id v6 = [WDElectrocardiogramDataMetadataViewController alloc];
  int v7 = [(WDElectrocardiogramOverviewViewController *)self dataProvider];
  double v8 = [(WDElectrocardiogramDataMetadataViewController *)v6 initWithSample:v4 delegate:v7 mode:0 activeAlgorithmVersion:0];

  [(WDElectrocardiogramOverviewViewController *)self showAdaptively:v8 sender:self];
}

- (void)didCompleteOnboarding
{
  [(WDElectrocardiogramOverviewViewController *)self _reloadAllSections];

  [(WDElectrocardiogramOverviewViewController *)self setOnboardingManager:0];
}

- (void)didDismissOnboarding
{
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  [(WDElectrocardiogramOverviewViewController *)self sectionInfo];
  if ([v7 section])
  {
    if (![v7 section])
    {
      uint64_t v8 = -[WDElectrocardiogramOverviewViewController _dataListViewControllerWithFilterType:](self, "_dataListViewControllerWithFilterType:", -[WDElectrocardiogramOverviewViewController _filterTypeForDataSectionRow:](self, "_filterTypeForDataSectionRow:", [v7 row]));
      goto LABEL_7;
    }
    if (![v7 section])
    {
      uint64_t v9 = [(WDElectrocardiogramOverviewViewController *)self educationSection];
      uint64_t v16 = [v7 row];
      int64_t v17 = [(WDElectrocardiogramOverviewViewController *)self navigationController];
      [v9 selectCellForIndex:v16 navigationController:v17 animated:1];

      goto LABEL_15;
    }
    if ([v7 section])
    {
      if (![v7 section])
      {
        uint64_t v9 = [v6 cellForRowAtIndexPath:v7];
        objc_msgSend(v9, "setFavorited:", objc_msgSend(v9, "isFavorited") ^ 1);
        -[WDElectrocardiogramOverviewViewController setPinned:](self, "setPinned:", [v9 isFavorited]);
        goto LABEL_15;
      }
      if (![v7 section])
      {
        [(WDElectrocardiogramOverviewViewController *)self userConfigurationRowInfo];
        if ([v7 row])
        {
          if (![v7 row])
          {
            int64_t v18 = objc_msgSend(MEMORY[0x263EFFA40], "hk_heartRhythmDefaults");
            char v19 = objc_msgSend(v18, "hk_hfeModeEnabled");

            if ((v19 & 1) == 0) {
              [(WDElectrocardiogramOverviewViewController *)self didSelectRegulatoryRow];
            }
          }
        }
        else
        {
          [(WDElectrocardiogramOverviewViewController *)self _showDataSourcesAndAccessController];
        }
      }
    }
  }
  else
  {
    if (-[WDElectrocardiogramOverviewViewController mode](self, "mode") == 2 && [v7 row] == 5)
    {
      uint64_t v8 = [(WDElectrocardiogramOverviewViewController *)self _dataListViewControllerForSummaryData];
LABEL_7:
      uint64_t v9 = (void *)v8;
      [(WDElectrocardiogramOverviewViewController *)self showAdaptively:v8 sender:self];
LABEL_15:

      goto LABEL_16;
    }
    unint64_t v10 = [v7 row];
    id v11 = [(WDElectrocardiogramOverviewViewController *)self dataProvider];
    unint64_t v12 = objc_msgSend(v11, "numberOfObjectsForSection:", objc_msgSend(v7, "section"));

    if (v10 < v12)
    {
      CGRect v13 = [(WDElectrocardiogramOverviewViewController *)self dataProvider];
      id v14 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v7, "row"), objc_msgSend(v7, "section"));
      uint64_t v15 = [v13 viewControllerForItemAtIndexPath:v14];

      [(WDElectrocardiogramOverviewViewController *)self showAdaptively:v15 sender:self];
    }
  }
LABEL_16:
}

- (id)_dataListViewControllerWithFilterType:(int64_t)a3
{
  int64_t v5 = [WDElectrocardiogramListDataProvider alloc];
  id v6 = [(WDElectrocardiogramOverviewViewController *)self displayType];
  id v7 = [(WDElectrocardiogramOverviewViewController *)self profile];
  uint64_t v8 = [(WDElectrocardiogramListDataProvider *)v5 initWithDisplayType:v6 profile:v7 mode:[(WDElectrocardiogramOverviewViewController *)self mode]];

  uint64_t v9 = [WDElectrocardiogramDataListViewController alloc];
  unint64_t v10 = [(WDElectrocardiogramOverviewViewController *)self displayType];
  id v11 = [(WDElectrocardiogramOverviewViewController *)self profile];
  unint64_t v12 = [(WDElectrocardiogramDataListViewController *)v9 initWithDisplayType:v10 profile:v11 dataProvider:v8 usingInsetStyling:1 mode:[(WDElectrocardiogramOverviewViewController *)self mode]];

  CGRect v13 = [(WDElectrocardiogramOverviewViewController *)self filterDataProvider];
  id v14 = [v13 electrocardiogramPredicateForType:a3];
  uint64_t v15 = [(WDDataListViewController *)v12 dataProvider];
  [v15 setDefaultQueryPredicate:v14];

  uint64_t v16 = +[WDElectrocardiogramFilterDataProvider viewControllerTitleForType:a3];
  [(WDElectrocardiogramDataListViewController *)v12 setTitle:v16];

  int64_t v17 = [(WDElectrocardiogramDataListViewController *)v12 tableView];
  [v17 _setSectionContentInsetFollowsLayoutMargins:1];

  return v12;
}

- (id)_dataListViewControllerForSummaryData
{
  id v3 = [WDElectrocardiogramDataListViewController alloc];
  id v4 = [(WDElectrocardiogramOverviewViewController *)self displayType];
  int64_t v5 = [(WDElectrocardiogramOverviewViewController *)self profile];
  id v6 = [(WDElectrocardiogramOverviewViewController *)self dataProvider];
  id v7 = [(WDElectrocardiogramDataListViewController *)v3 initWithDisplayType:v4 profile:v5 dataProvider:v6 usingInsetStyling:1 mode:[(WDElectrocardiogramOverviewViewController *)self mode]];

  uint64_t v8 = +[WDElectrocardiogramFilterDataProvider viewControllerTitleForType:0];
  [(WDElectrocardiogramDataListViewController *)v7 setTitle:v8];

  uint64_t v9 = [(WDElectrocardiogramDataListViewController *)v7 tableView];
  [v9 _setSectionContentInsetFollowsLayoutMargins:1];

  return v7;
}

- (void)_showDataSourcesAndAccessController
{
  objc_msgSend(MEMORY[0x263F466E8], "categoryWithID:", -[HKDisplayType categoryIdentifier](self->_displayType, "categoryIdentifier"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [WDDisplayTypeDataSourcesTableViewController alloc];
  displayType = self->_displayType;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = [WeakRetained sourceOrderController];
  id v7 = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v8 = [(WDDisplayTypeDataSourcesTableViewController *)v3 initWithDisplayType:displayType displayCategory:v9 sourceOrderController:v6 profile:v7];

  [(WDDisplayTypeDataSourcesTableViewController *)v8 setShouldInsetSectionContentForDataSourceDataList:1];
  [(WDElectrocardiogramOverviewViewController *)self showAdaptively:v8 sender:self];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [MEMORY[0x263F1C550] clearColor];
    [v9 setSeparatorColor:v11];
  }
  [(WDElectrocardiogramOverviewViewController *)self sectionInfo];
  if (![v10 section])
  {
    unint64_t v12 = [(WDElectrocardiogramOverviewViewController *)self educationSection];
    objc_msgSend(v12, "willDisplayCell:forIndex:tableView:", v9, objc_msgSend(v10, "row"), v8);
  }
}

- (void)didSelectReenableFeature
{
}

- (void)traitCollectionDidChange:(id)a3
{
  id v8 = a3;
  if (!v8) {
    goto LABEL_3;
  }
  id v4 = [(WDElectrocardiogramOverviewViewController *)self traitCollection];
  int64_t v5 = [v4 preferredContentSizeCategory];
  id v6 = [v8 preferredContentSizeCategory];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0) {
LABEL_3:
  }
    [(WDElectrocardiogramOverviewViewController *)self _reloadElectrocardiogramSetupTableHeaderView];
}

- (BOOL)_shouldDisplayAboutRowBeforeOnboarding
{
  v8[1] = *MEMORY[0x263EF8340];
  v8[0] = *MEMORY[0x263F094C8];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  id v3 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  id v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 countryCode];
    char v6 = [v2 containsObject:v5];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (int64_t)placeholderCellCount
{
  return self->_placeholderCellCount;
}

- (void)setPlaceholderCellCount:(int64_t)a3
{
  self->_placeholderCellCount = a3;
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
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (WDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (WDElectrocardiogramListDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (HRElectrocardiogramOnboardingManager)onboardingManager
{
  return self->_onboardingManager;
}

- (void)setOnboardingManager:(id)a3
{
}

- (WDElectrocardiogramFilterDataProvider)filterDataProvider
{
  return self->_filterDataProvider;
}

- (void)setFilterDataProvider:(id)a3
{
}

- (HKElectrocardiogramMoreHealthDataProvider)moreHealthDataProvider
{
  return self->_moreHealthDataProvider;
}

- (void)setMoreHealthDataProvider:(id)a3
{
}

- (HKFeatureStatusManager)featureStatusManager
{
  return self->_featureStatusManager;
}

- (void)setFeatureStatusManager:(id)a3
{
}

- (HKFeatureStatus)featureStatus
{
  return self->_featureStatus;
}

- (void)setFeatureStatus:(id)a3
{
}

- (HKDataMetadataSectionProtocol)educationSection
{
  return self->_educationSection;
}

- (void)setEducationSection:(id)a3
{
}

- (UITapGestureRecognizer)tripleTapToSettingsRecognizer
{
  return self->_tripleTapToSettingsRecognizer;
}

- (void)setTripleTapToSettingsRecognizer:(id)a3
{
}

- (BOOL)displayAboutRowBeforeOnboarding
{
  return self->_displayAboutRowBeforeOnboarding;
}

- (void)setDisplayAboutRowBeforeOnboarding:(BOOL)a3
{
  self->_displayAboutRowBeforeOnboarding = a3;
}

- (NSNumber)availabilityStateCache
{
  return self->_availabilityStateCache;
}

- (void)setAvailabilityStateCache:(id)a3
{
  self->_availabilityStateCache = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripleTapToSettingsRecognizer, 0);
  objc_storeStrong((id *)&self->_educationSection, 0);
  objc_storeStrong((id *)&self->_featureStatus, 0);
  objc_storeStrong((id *)&self->_featureStatusManager, 0);
  objc_storeStrong((id *)&self->_moreHealthDataProvider, 0);
  objc_storeStrong((id *)&self->_filterDataProvider, 0);
  objc_storeStrong((id *)&self->_onboardingManager, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_destroyWeak((id *)&self->_profile);

  objc_storeStrong((id *)&self->_displayType, 0);
}

- (void)initWithDisplayType:(void *)a1 profile:(uint64_t)a2 mode:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_2210D2000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get feature status with error: %@", (uint8_t *)&v6, 0x16u);
}

- (void)initWithDisplayType:(void *)a1 profile:mode:.cold.2(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_error_impl(&dword_2210D2000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get country code", (uint8_t *)&v3, 0xCu);
}

- (void)_recordingRescindedHeaderView
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v1 = a1;
  id v2 = NSStringFromHKFeatureAvailabilityRescindedStatus();
  int v3 = 136446466;
  id v4 = "-[WDElectrocardiogramOverviewViewController _recordingRescindedHeaderView]";
  __int16 v5 = 2114;
  int v6 = v2;
  _os_log_error_impl(&dword_2210D2000, v1, OS_LOG_TYPE_ERROR, "[%{public}s]: Could not configure rescinded header view for state %{public}@", (uint8_t *)&v3, 0x16u);
}

@end