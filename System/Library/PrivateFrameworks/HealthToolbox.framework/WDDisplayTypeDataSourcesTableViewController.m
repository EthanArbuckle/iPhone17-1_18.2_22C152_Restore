@interface WDDisplayTypeDataSourcesTableViewController
- (BOOL)_canEditDataSources;
- (BOOL)_isPrimaryProfile;
- (BOOL)_objectTypeRequiresPerObjectAuthorization;
- (BOOL)_sourceIsEnabled:(id)a3;
- (BOOL)shouldInsetSectionContentForDataSourceDataList;
- (BOOL)showDataSourcesSectionOnly;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (HKSourceListDataSource)sourceListDataSource;
- (NSArray)loadedOrderedDataSources;
- (NSDictionary)loadedAuthorizationRecordsBySource;
- (NSMutableArray)orderedDataSources;
- (NSSet)loadedAllDataSources;
- (UIBarButtonItem)leftBarButtonItemReference;
- (WDDisplayTypeDataSourcesTableViewController)initWithCoder:(id)a3;
- (WDDisplayTypeDataSourcesTableViewController)initWithDisplayType:(id)a3 displayCategory:(id)a4 sourceOrderController:(id)a5 profile:(id)a6;
- (WDDisplayTypeDataSourcesTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (WDDisplayTypeDataSourcesTableViewController)initWithStyle:(int64_t)a3;
- (id)_createIndexPathsWithSection:(int64_t)a3 startingRow:(int64_t)a4 numIndices:(int64_t)a5;
- (id)_dataSourceCellForTableView:(id)a3 row:(unint64_t)a4;
- (id)_makeDataListViewControllerForSource:(id)a3;
- (id)_noneTableViewCell;
- (id)_readerSourceCellForTableView:(id)a3 sourceArray:(id)a4 row:(unint64_t)a5 group:(int64_t)a6;
- (id)createSectionIdentifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)sectionForSectionIdentifier:(int64_t)a3;
- (int64_t)sectionIdentifierForSection:(int64_t)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addDataSources:(id)a3;
- (void)_fetchAuthorizationRecordsBySourceForType:(id)a3 completion:(id)a4;
- (void)_fetchDataSourcesForSampleType:(id)a3 completion:(id)a4;
- (void)_fetchOrderedSourcesForType:(id)a3 completion:(id)a4;
- (void)_gatherDataFromDataSource:(id)a3;
- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 cell:(id)a5 tableView:(id)a6 fetchError:(id)a7;
- (void)_loadDataSource;
- (void)_refreshUI;
- (void)_sortDataSources;
- (void)_sourceIsEnabledDidChange:(id)a3;
- (void)_updateOrderedSources;
- (void)_willDisableSource:(id)a3;
- (void)_willEnableSource:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setLeftBarButtonItemReference:(id)a3;
- (void)setLoadedAllDataSources:(id)a3;
- (void)setLoadedAuthorizationRecordsBySource:(id)a3;
- (void)setLoadedOrderedDataSources:(id)a3;
- (void)setOrderedDataSources:(id)a3;
- (void)setShouldInsetSectionContentForDataSourceDataList:(BOOL)a3;
- (void)setSourceListDataSource:(id)a3;
- (void)sourceListDataSourceDidUpdate:(id)a3;
- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)updateHeaderView;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WDDisplayTypeDataSourcesTableViewController

- (WDDisplayTypeDataSourcesTableViewController)initWithDisplayType:(id)a3 displayCategory:(id)a4 sourceOrderController:(id)a5 profile:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v51.receiver = self;
  v51.super_class = (Class)WDDisplayTypeDataSourcesTableViewController;
  v15 = [(HKTableViewController *)&v51 initWithUsingInsetStyling:1];
  v16 = v15;
  if (v15)
  {
    v15->_isLoaded = 0;
    objc_storeStrong((id *)&v15->_displayType, a3);
    objc_storeStrong((id *)&v16->_displayCategory, a4);
    objc_storeStrong((id *)&v16->_sourceOrderController, a5);
    objc_storeStrong((id *)&v16->_profile, a6);
    uint64_t v17 = [v14 healthStore];
    healthStore = v16->_healthStore;
    v16->_healthStore = (HKHealthStore *)v17;

    id v19 = objc_alloc(MEMORY[0x263F0A620]);
    v20 = [v14 healthStore];
    uint64_t v21 = [v19 initWithHealthStore:v20];
    profileStore = v16->_profileStore;
    v16->_profileStore = (HKProfileStore *)v21;

    id v23 = objc_alloc(MEMORY[0x263F0A118]);
    v24 = [v14 healthStore];
    uint64_t v25 = [v23 initWithHealthStore:v24];
    authorizationStore = v16->_authorizationStore;
    v16->_authorizationStore = (HKAuthorizationStore *)v25;

    uint64_t v27 = [MEMORY[0x263EFF9C0] set];
    dataSources = v16->_dataSources;
    v16->_dataSources = (NSMutableSet *)v27;

    uint64_t v29 = [MEMORY[0x263EFF980] array];
    orderedDataSources = v16->_orderedDataSources;
    v16->_orderedDataSources = (NSMutableArray *)v29;

    readerAppSources = v16->_readerAppSources;
    v32 = (NSArray *)MEMORY[0x263EFFA68];
    v16->_readerAppSources = (NSArray *)MEMORY[0x263EFFA68];

    readerResearchStudySources = v16->_readerResearchStudySources;
    v16->_readerResearchStudySources = v32;

    uint64_t v34 = [MEMORY[0x263EFF9A0] dictionary];
    authorizationRecordsBySource = v16->_authorizationRecordsBySource;
    v16->_authorizationRecordsBySource = (NSMutableDictionary *)v34;

    uint64_t v36 = [MEMORY[0x263EFF9C0] set];
    sourcesPendingToggleOn = v16->_sourcesPendingToggleOn;
    v16->_sourcesPendingToggleOn = (NSMutableSet *)v36;

    uint64_t v38 = [MEMORY[0x263EFF9C0] set];
    sourcesPendingToggleOff = v16->_sourcesPendingToggleOff;
    v16->_sourcesPendingToggleOff = (NSMutableSet *)v38;

    v16->_shouldInsetSectionContentForDataSourceDataList = 0;
    uint64_t v40 = [(WDDisplayTypeDataSourcesTableViewController *)v16 createSectionIdentifiers];
    sectionIdentifiers = v16->_sectionIdentifiers;
    v16->_sectionIdentifiers = (NSArray *)v40;

    LODWORD(v32) = [(WDDisplayTypeDataSourcesTableViewController *)v16 showDataSourcesSectionOnly];
    v42 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
    v43 = v42;
    if (v32)
    {
      v44 = [v42 localizedStringForKey:@"SHARE_DATA_ONLY_TITLE" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
      [(WDDisplayTypeDataSourcesTableViewController *)v16 setTitle:v44];

      if ([(WDDisplayTypeDataSourcesTableViewController *)v16 _isPrimaryProfile])
      {
LABEL_9:
        [(WDDisplayTypeDataSourcesTableViewController *)v16 setModalPresentationStyle:2];
        goto LABEL_10;
      }
      v45 = [(WDProfile *)v16->_profile healthStore];
      v43 = WDGetProfileNameForHealthStore(v45);

      if (!v43)
      {
LABEL_8:

        goto LABEL_9;
      }
      v46 = NSString;
      v47 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
      v48 = [v47 localizedStringForKey:@"SHARE_DATA_ONLY_TITLE_%@" value:&stru_26D2EA890 table:@"HealthUI-Localizable-tinker"];
      v49 = objc_msgSend(v46, "localizedStringWithFormat:", v48, v43);
      [(WDDisplayTypeDataSourcesTableViewController *)v16 setTitle:v49];
    }
    else
    {
      v47 = [v42 localizedStringForKey:@"SHARE_DATA_TITLE" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
      [(WDDisplayTypeDataSourcesTableViewController *)v16 setTitle:v47];
    }

    goto LABEL_8;
  }
LABEL_10:

  return v16;
}

- (WDDisplayTypeDataSourcesTableViewController)initWithStyle:(int64_t)a3
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF4A0];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The -%@ method is not available on %@", v6, objc_opt_class() format];

  return 0;
}

- (WDDisplayTypeDataSourcesTableViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDDisplayTypeDataSourcesTableViewController;
  return [(WDDisplayTypeDataSourcesTableViewController *)&v4 initWithCoder:a3];
}

- (WDDisplayTypeDataSourcesTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF4A0];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (void)setSourceListDataSource:(id)a3
{
  uint64_t v5 = (HKSourceListDataSource *)a3;
  sourceListDataSource = self->_sourceListDataSource;
  if (sourceListDataSource != v5)
  {
    v7 = v5;
    [(HKSourceListDataSource *)sourceListDataSource unregisterObserver:self];
    objc_storeStrong((id *)&self->_sourceListDataSource, a3);
    sourceListDataSource = (HKSourceListDataSource *)[(HKSourceListDataSource *)self->_sourceListDataSource registerObserver:self];
    uint64_t v5 = v7;
  }

  MEMORY[0x270F9A758](sourceListDataSource, v5);
}

- (void)updateHeaderView
{
  headerView = self->_headerView;
  objc_super v4 = [(WDDisplayTypeDataSourcesTableViewController *)self tableView];
  [v4 bounds];
  double v6 = v5;
  LODWORD(v5) = 1148846080;
  LODWORD(v7) = 1112014848;
  -[HKTitledIconHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](headerView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v6, 0.0, v5, v7);

  [(HKTitledIconHeaderView *)self->_headerView bounds];
  -[HKTitledIconHeaderView setBounds:](self->_headerView, "setBounds:");
  v8 = self->_headerView;
  id v9 = [(WDDisplayTypeDataSourcesTableViewController *)self tableView];
  [v9 setTableHeaderView:v8];
}

- (void)viewDidLoad
{
  v21[1] = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)WDDisplayTypeDataSourcesTableViewController;
  [(HKTableViewController *)&v20 viewDidLoad];
  v3 = [(WDDisplayTypeDataSourcesTableViewController *)self tableView];
  [v3 setRowHeight:*MEMORY[0x263F1D600]];
  [v3 setAllowsSelectionDuringEditing:1];
  [v3 setEstimatedRowHeight:*MEMORY[0x263F46380]];
  objc_super v4 = HKUIJoinStringsForAutomationIdentifier();
  [v3 setAccessibilityIdentifier:v4];

  double v5 = [MEMORY[0x263F1C6C8] configurationWithPointSize:50.0];
  double v6 = [(HKDisplayType *)self->_displayType shareIcon];
  double v7 = [v6 imageByApplyingSymbolConfiguration:v5];

  v8 = (HKTitledIconHeaderView *)objc_alloc_init(MEMORY[0x263F46A10]);
  headerView = self->_headerView;
  self->_headerView = v8;

  v10 = self->_headerView;
  id v11 = [(HKDisplayType *)self->_displayType localization];
  id v12 = [v11 displayName];
  [(HKTitledIconHeaderView *)v10 setTitle:v12];

  [(HKTitledIconHeaderView *)self->_headerView setIconImage:v7];
  id v13 = self->_headerView;
  id v14 = [(HKDisplayCategory *)self->_displayCategory color];
  [(HKTitledIconHeaderView *)v13 setIconImageTint:v14];

  [(WDDisplayTypeDataSourcesTableViewController *)self _loadDataSource];
  objc_initWeak(&location, self);
  v21[0] = objc_opt_class();
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __58__WDDisplayTypeDataSourcesTableViewController_viewDidLoad__block_invoke;
  v17[3] = &unk_26458E638;
  objc_copyWeak(&v18, &location);
  id v16 = (id)[(WDDisplayTypeDataSourcesTableViewController *)self registerForTraitChanges:v15 withHandler:v17];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __58__WDDisplayTypeDataSourcesTableViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateHeaderView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDDisplayTypeDataSourcesTableViewController;
  [(WDDisplayTypeDataSourcesTableViewController *)&v4 viewWillAppear:a3];
  [(WDDisplayTypeDataSourcesTableViewController *)self updateHeaderView];
}

- (id)createSectionIdentifiers
{
  if ([(WDDisplayTypeDataSourcesTableViewController *)self showDataSourcesSectionOnly]) {
    return &unk_26D2FD560;
  }
  else {
    return &unk_26D2FD578;
  }
}

- (BOOL)showDataSourcesSectionOnly
{
  if ([(WDDisplayTypeDataSourcesTableViewController *)self _objectTypeRequiresPerObjectAuthorization])
  {
    return 1;
  }
  else
  {
    return ![(WDDisplayTypeDataSourcesTableViewController *)self _isPrimaryProfile];
  }
}

- (BOOL)_objectTypeRequiresPerObjectAuthorization
{
  v2 = [(HKDisplayType *)self->_displayType objectType];
  char v3 = [v2 requiresPerObjectAuthorization];

  return v3;
}

- (BOOL)_isPrimaryProfile
{
  v2 = [(WDProfile *)self->_profile healthStore];
  char v3 = [v2 profileIdentifier];
  BOOL v4 = [v3 type] == 1;

  return v4;
}

- (int64_t)sectionIdentifierForSection:(int64_t)a3
{
  char v3 = [(NSArray *)self->_sectionIdentifiers objectAtIndexedSubscript:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (int64_t)sectionForSectionIdentifier:(int64_t)a3
{
  sectionIdentifiers = self->_sectionIdentifiers;
  int64_t v4 = [NSNumber numberWithInteger:a3];
  int64_t v5 = [(NSArray *)sectionIdentifiers indexOfObject:v4];

  return v5;
}

- (void)_gatherDataFromDataSource:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  int64_t v4 = [a3 sources];
  int64_t v5 = [v4 allSources];
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __73__WDDisplayTypeDataSourcesTableViewController__gatherDataFromDataSource___block_invoke;
  v67[3] = &unk_26458E660;
  v67[4] = self;
  double v6 = objc_msgSend(v5, "hk_filter:", v67);
  v48 = (void *)[v6 mutableCopy];

  id v50 = objc_alloc_init(MEMORY[0x263EFF980]);
  double v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v8 = [v4 allSources];
  v47 = objc_msgSend(v8, "hk_mapToDictionary:", &__block_literal_global_6);

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v49 = v4;
  id v9 = [v4 orderedAppSources];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v63 objects:v70 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v64 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        v15 = [(WDDisplayTypeDataSourcesTableViewController *)self loadedAuthorizationRecordsBySource];
        id v16 = [v14 source];
        uint64_t v17 = [v15 objectForKeyedSubscript:v16];

        if (v17)
        {
          if ([v17 requestedReading]) {
            [v50 addObject:v14];
          }
          [(NSMutableDictionary *)v7 setObject:v17 forKeyedSubscript:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v63 objects:v70 count:16];
    }
    while (v11);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v18 = [v49 orderedResearchStudySources];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v60 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v59 + 1) + 8 * j);
        v24 = [(WDDisplayTypeDataSourcesTableViewController *)self loadedAuthorizationRecordsBySource];
        uint64_t v25 = [v23 source];
        v26 = [v24 objectForKeyedSubscript:v25];

        if (v26)
        {
          if ([v26 requestedReading]) {
            [v50 addObject:v23];
          }
          [(NSMutableDictionary *)v7 setObject:v26 forKeyedSubscript:v23];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v59 objects:v69 count:16];
    }
    while (v20);
  }

  uint64_t v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v28 = [(WDDisplayTypeDataSourcesTableViewController *)self loadedOrderedDataSources];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v55 objects:v68 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v56;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v56 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = [v47 objectForKeyedSubscript:*(void *)(*((void *)&v55 + 1) + 8 * k)];
        if (v33) {
          [(NSMutableArray *)v27 addObject:v33];
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v55 objects:v68 count:16];
    }
    while (v30);
  }

  orderedDataSources = self->_orderedDataSources;
  self->_orderedDataSources = v27;
  v46 = v27;

  authorizationRecordsBySource = self->_authorizationRecordsBySource;
  self->_authorizationRecordsBySource = v7;
  uint64_t v36 = v7;

  [(WDDisplayTypeDataSourcesTableViewController *)self _addDataSources:v48];
  [(WDDisplayTypeDataSourcesTableViewController *)self _sortDataSources];
  v37 = [v49 orderedAppSources];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __73__WDDisplayTypeDataSourcesTableViewController__gatherDataFromDataSource___block_invoke_3;
  v53[3] = &unk_26458E660;
  id v38 = v50;
  id v54 = v38;
  objc_msgSend(v37, "hk_filter:", v53);
  v39 = (NSArray *)objc_claimAutoreleasedReturnValue();

  readerAppSources = self->_readerAppSources;
  self->_readerAppSources = v39;
  v41 = v39;

  v42 = [v49 orderedResearchStudySources];
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __73__WDDisplayTypeDataSourcesTableViewController__gatherDataFromDataSource___block_invoke_4;
  v51[3] = &unk_26458E660;
  id v52 = v38;
  id v43 = v38;
  objc_msgSend(v42, "hk_filter:", v51);
  v44 = (NSArray *)objc_claimAutoreleasedReturnValue();

  readerResearchStudySources = self->_readerResearchStudySources;
  self->_readerResearchStudySources = v44;
}

uint64_t __73__WDDisplayTypeDataSourcesTableViewController__gatherDataFromDataSource___block_invoke(uint64_t a1, void *a2)
{
  char v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int64_t v5 = [v3 loadedAllDataSources];
  double v6 = [v4 source];
  int v7 = [v5 containsObject:v6];

  v8 = [*(id *)(a1 + 32) loadedAuthorizationRecordsBySource];
  id v9 = [v4 source];

  uint64_t v10 = [v8 objectForKeyedSubscript:v9];
  LODWORD(v6) = [v10 requestedSharing];

  return v7 | v6;
}

void __73__WDDisplayTypeDataSourcesTableViewController__gatherDataFromDataSource___block_invoke_2(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  int64_t v5 = a3;
  id v6 = a2;
  id v7 = [v6 source];
  ((void (**)(void, id, id))a3)[2](v5, v7, v6);
}

uint64_t __73__WDDisplayTypeDataSourcesTableViewController__gatherDataFromDataSource___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t __73__WDDisplayTypeDataSourcesTableViewController__gatherDataFromDataSource___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (void)_refreshUI
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  char v3 = [(WDDisplayTypeDataSourcesTableViewController *)self tableView];
  id v4 = [v3 window];

  if (v4)
  {
    BOOL isLoaded = self->_isLoaded;
    self->_BOOL isLoaded = 1;
    if ([(WDDisplayTypeDataSourcesTableViewController *)self _canEditDataSources])
    {
      id v6 = [(WDDisplayTypeDataSourcesTableViewController *)self editButtonItem];
      id v7 = [(WDDisplayTypeDataSourcesTableViewController *)self navigationItem];
      [v7 setRightBarButtonItem:v6];
    }
    else
    {
      id v6 = [(WDDisplayTypeDataSourcesTableViewController *)self navigationItem];
      [v6 setRightBarButtonItem:0];
    }

    headerView = self->_headerView;
    uint64_t v10 = [(HKDisplayType *)self->_displayType localization];
    uint64_t v11 = [v10 displayName];
    [(HKTitledIconHeaderView *)headerView setTitle:v11];

    uint64_t v12 = [(WDDisplayTypeDataSourcesTableViewController *)self tableView];
    id v13 = v12;
    if (isLoaded)
    {
      [v12 reloadData];
    }
    else
    {
      [v12 beginUpdates];

      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __57__WDDisplayTypeDataSourcesTableViewController__refreshUI__block_invoke;
      v27[3] = &unk_26458E6A8;
      v27[4] = self;
      id v13 = (void (**)(void, void))MEMORY[0x223C798A0](v27);
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v14 = self->_sectionIdentifiers;
      uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v24;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v24 != v17) {
              objc_enumerationMutation(v14);
            }
            v13[2](v13, (int)objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v18++), "intValue", (void)v23));
          }
          while (v16 != v18);
          uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v23 objects:v29 count:16];
        }
        while (v16);
      }

      uint64_t v19 = [(WDDisplayTypeDataSourcesTableViewController *)self tableView];
      [v19 endUpdates];
    }
    uint64_t v20 = [(WDDisplayTypeDataSourcesTableViewController *)self isEditing];
    uint64_t v21 = [(WDDisplayTypeDataSourcesTableViewController *)self tableView];
    [v21 setEditing:0];

    v22 = [(WDDisplayTypeDataSourcesTableViewController *)self tableView];
    [v22 setEditing:v20];
  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2210D2000, v8, OS_LOG_TYPE_DEFAULT, "WDDisplayTypeDataSourcesTableViewController has been removed, not updating UI", buf, 2u);
    }
  }
}

void __57__WDDisplayTypeDataSourcesTableViewController__refreshUI__block_invoke(uint64_t a1, uint64_t a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [*(id *)(a1 + 32) sectionForSectionIdentifier:a2];
  id v4 = *(void **)(a1 + 32);
  int64_t v5 = [v4 tableView];
  uint64_t v6 = [v4 tableView:v5 numberOfRowsInSection:v3];

  id v7 = [*(id *)(a1 + 32) tableView];
  v8 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:v3];
  v12[0] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [v7 reloadRowsAtIndexPaths:v9 withRowAnimation:0];

  if (v6 >= 2)
  {
    uint64_t v10 = [*(id *)(a1 + 32) tableView];
    uint64_t v11 = [*(id *)(a1 + 32) _createIndexPathsWithSection:v3 startingRow:1 numIndices:v6 - 1];
    [v10 insertRowsAtIndexPaths:v11 withRowAnimation:0];
  }
}

- (BOOL)_canEditDataSources
{
  uint64_t v3 = [(WDProfile *)self->_profile healthStore];
  id v4 = [v3 profileIdentifier];
  uint64_t v5 = [v4 type];

  uint64_t v6 = [(HKDisplayType *)self->_displayType behavior];
  if ([v6 allowsSourceReordering]) {
    BOOL v7 = [(NSMutableArray *)self->_orderedDataSources count] != 0;
  }
  else {
    BOOL v7 = 0;
  }

  return v5 == 1 && v7;
}

- (void)_loadDataSource
{
  uint64_t v3 = [(HKDisplayType *)self->_displayType sampleType];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  BOOL v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __62__WDDisplayTypeDataSourcesTableViewController__loadDataSource__block_invoke;
  v28[3] = &unk_26458E6D0;
  id v8 = v4;
  id v29 = v8;
  id v9 = v7;
  uint64_t v30 = v9;
  [(WDDisplayTypeDataSourcesTableViewController *)self _fetchOrderedSourcesForType:v3 completion:v28];
  dispatch_group_enter(v9);
  uint64_t v10 = [(HKDisplayType *)self->_displayType recordSampleType];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __62__WDDisplayTypeDataSourcesTableViewController__loadDataSource__block_invoke_2;
  v25[3] = &unk_26458E6F8;
  id v11 = v5;
  id v26 = v11;
  uint64_t v12 = v9;
  uint64_t v27 = v12;
  [(WDDisplayTypeDataSourcesTableViewController *)self _fetchDataSourcesForSampleType:v10 completion:v25];
  dispatch_group_enter(v12);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __62__WDDisplayTypeDataSourcesTableViewController__loadDataSource__block_invoke_3;
  v22[3] = &unk_26458E720;
  id v13 = v6;
  id v23 = v13;
  long long v24 = v12;
  id v14 = v12;
  [(WDDisplayTypeDataSourcesTableViewController *)self _fetchAuthorizationRecordsBySourceForType:v3 completion:v22];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __62__WDDisplayTypeDataSourcesTableViewController__loadDataSource__block_invoke_4;
  v18[3] = &unk_26458E068;
  v18[4] = self;
  id v19 = v11;
  id v20 = v8;
  id v21 = v13;
  id v15 = v13;
  id v16 = v8;
  id v17 = v11;
  dispatch_group_notify(v14, MEMORY[0x263EF83A0], v18);
}

void __62__WDDisplayTypeDataSourcesTableViewController__loadDataSource__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addObjectsFromArray:a2];
  uint64_t v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void __62__WDDisplayTypeDataSourcesTableViewController__loadDataSource__block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) unionSet:a2];
  uint64_t v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void __62__WDDisplayTypeDataSourcesTableViewController__loadDataSource__block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addEntriesFromDictionary:a2];
  uint64_t v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void __62__WDDisplayTypeDataSourcesTableViewController__loadDataSource__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setLoadedAllDataSources:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setLoadedOrderedDataSources:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setLoadedAuthorizationRecordsBySource:*(void *)(a1 + 56)];
  id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v2 = [*(id *)(a1 + 56) allKeys];
  [v9 addObjectsFromArray:v2];

  uint64_t v3 = [*(id *)(a1 + 40) allObjects];
  [v9 addObjectsFromArray:v3];

  id v4 = objc_alloc(MEMORY[0x263F469C8]);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 1064);
  id v6 = [v9 allObjects];
  BOOL v7 = (void *)[v4 initWithHealthStore:v5 sources:v6 queue:MEMORY[0x263EF83A0]];

  [v7 setShouldFetchAppIcons:1];
  [*(id *)(a1 + 32) setSourceListDataSource:v7];
  id v8 = [*(id *)(a1 + 32) sourceListDataSource];
  [v8 fetchSources];
}

- (void)_fetchOrderedSourcesForType:(id)a3 completion:(id)a4
{
  id v6 = a4;
  sourceOrderController = self->_sourceOrderController;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __86__WDDisplayTypeDataSourcesTableViewController__fetchOrderedSourcesForType_completion___block_invoke;
  v9[3] = &unk_26458E748;
  id v10 = v6;
  id v8 = v6;
  [(WDSourceOrderController *)sourceOrderController getOrderedSourcesForDataType:a3 withCompletion:v9];
}

uint64_t __86__WDDisplayTypeDataSourcesTableViewController__fetchOrderedSourcesForType_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_fetchDataSourcesForSampleType:(id)a3 completion:(id)a4
{
  id v6 = a4;
  BOOL v7 = (objc_class *)MEMORY[0x263F0A7A8];
  id v8 = a3;
  id v9 = [v7 alloc];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __89__WDDisplayTypeDataSourcesTableViewController__fetchDataSourcesForSampleType_completion___block_invoke;
  v12[3] = &unk_26458E770;
  id v13 = v6;
  id v10 = v6;
  id v11 = (void *)[v9 initWithSampleType:v8 samplePredicate:0 completionHandler:v12];

  [(HKHealthStore *)self->_healthStore executeQuery:v11];
}

void __89__WDDisplayTypeDataSourcesTableViewController__fetchDataSourcesForSampleType_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __89__WDDisplayTypeDataSourcesTableViewController__fetchDataSourcesForSampleType_completion___block_invoke_cold_1();
    }
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v8);
  }
}

- (void)_fetchAuthorizationRecordsBySourceForType:(id)a3 completion:(id)a4
{
  id v5 = a4;
  authorizationStore = self->_authorizationStore;
  id v7 = [(HKDisplayType *)self->_displayType objectType];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __100__WDDisplayTypeDataSourcesTableViewController__fetchAuthorizationRecordsBySourceForType_completion___block_invoke;
  v9[3] = &unk_26458E798;
  id v10 = v5;
  id v8 = v5;
  [(HKAuthorizationStore *)authorizationStore fetchAuthorizationRecordsForType:v7 completion:v9];
}

void __100__WDDisplayTypeDataSourcesTableViewController__fetchAuthorizationRecordsBySourceForType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = a1;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __100__WDDisplayTypeDataSourcesTableViewController__fetchAuthorizationRecordsBySourceForType_completion___block_invoke_cold_1();
    }
  }
  id v17 = v5;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [v4 allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v13 = objc_msgSend(v4, "objectForKeyedSubscript:", v12, v16, v17);
        id v14 = [[WDAuthorizationRecord alloc] initWithInternalAuthorizationRecord:v13];
        [v6 setObject:v14 forKeyedSubscript:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  uint64_t v15 = *(void *)(v16 + 32);
  if (v15) {
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v6);
  }
}

- (id)_createIndexPathsWithSection:(int64_t)a3 startingRow:(int64_t)a4 numIndices:(int64_t)a5
{
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a5 >= 1)
  {
    do
    {
      uint64_t v9 = [MEMORY[0x263F088C8] indexPathForRow:a4 inSection:a3];
      [v8 addObject:v9];

      ++a4;
      --a5;
    }
    while (a5);
  }

  return v8;
}

- (void)_sortDataSources
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v3 = (void *)[(NSMutableArray *)self->_orderedDataSources copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        if (([(NSMutableSet *)self->_dataSources containsObject:v8] & 1) == 0) {
          [(NSMutableArray *)self->_orderedDataSources removeObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v5);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = self->_dataSources;
  uint64_t v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * j);
        if (([(NSMutableArray *)self->_orderedDataSources containsObject:v14] & 1) == 0) {
          [(NSMutableArray *)self->_orderedDataSources addObject:v14];
        }
      }
      uint64_t v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [MEMORY[0x263EFF980] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v16 = (void *)[(NSMutableArray *)self->_orderedDataSources copy];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v22 + 1) + 8 * k);
        if (![(WDDisplayTypeDataSourcesTableViewController *)self _sourceIsEnabled:v21])
        {
          [v15 addObject:v21];
          [(NSMutableArray *)self->_orderedDataSources removeObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v18);
  }

  [(NSMutableArray *)self->_orderedDataSources addObjectsFromArray:v15];
}

- (void)_updateOrderedSources
{
  id v5 = [(NSMutableArray *)self->_orderedDataSources hk_map:&__block_literal_global_356];
  sourceOrderController = self->_sourceOrderController;
  uint64_t v4 = [(HKDisplayType *)self->_displayType objectType];
  [(WDSourceOrderController *)sourceOrderController setOrderedSources:v5 dataType:v4];
}

uint64_t __68__WDDisplayTypeDataSourcesTableViewController__updateOrderedSources__block_invoke(uint64_t a1, void *a2)
{
  return [a2 source];
}

- (void)_addDataSources:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = (void *)[(NSMutableSet *)self->_dataSources copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        if (([v4 containsObject:v10] & 1) == 0)
        {
          uint64_t v11 = [(NSMutableDictionary *)self->_authorizationRecordsBySource objectForKeyedSubscript:v10];

          if (!v11) {
            [(NSMutableSet *)self->_dataSources removeObject:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8 * j);
        if ((-[NSMutableSet containsObject:](self->_dataSources, "containsObject:", v17, (void)v18) & 1) == 0) {
          [(NSMutableSet *)self->_dataSources addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }
}

- (BOOL)_sourceIsEnabled:(id)a3
{
  id v4 = a3;
  id v5 = [(HKHealthStore *)self->_healthStore profileIdentifier];
  uint64_t v6 = [v5 type];

  if (v6 == 3 || ([(NSMutableSet *)self->_sourcesPendingToggleOn containsObject:v4] & 1) != 0)
  {
    LOBYTE(v7) = 1;
  }
  else if ([(NSMutableSet *)self->_sourcesPendingToggleOff containsObject:v4])
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    uint64_t v9 = [(NSMutableDictionary *)self->_authorizationRecordsBySource objectForKeyedSubscript:v4];
    [v9 status];
    if (HKAuthorizationStatusAllowsSharing())
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      uint64_t v10 = [v4 source];
      int v7 = [v10 _requiresAuthorization] ^ 1;
    }
  }

  return v7;
}

- (void)_willDisableSource:(id)a3
{
  sourcesPendingToggleOn = self->_sourcesPendingToggleOn;
  id v5 = a3;
  [(NSMutableSet *)sourcesPendingToggleOn removeObject:v5];
  [(NSMutableSet *)self->_sourcesPendingToggleOff addObject:v5];
}

- (void)_willEnableSource:(id)a3
{
  sourcesPendingToggleOff = self->_sourcesPendingToggleOff;
  id v5 = a3;
  [(NSMutableSet *)sourcesPendingToggleOff removeObject:v5];
  [(NSMutableSet *)self->_sourcesPendingToggleOn addObject:v5];
}

- (void)_sourceIsEnabledDidChange:(id)a3
{
  sourcesPendingToggleOff = self->_sourcesPendingToggleOff;
  id v5 = a3;
  [(NSMutableSet *)sourcesPendingToggleOff removeObject:v5];
  [(NSMutableSet *)self->_sourcesPendingToggleOn removeObject:v5];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WDDisplayTypeDataSourcesTableViewController;
  [(WDDisplayTypeDataSourcesTableViewController *)&v24 setEditing:a3 animated:a4];
  if (v4)
  {
    uint64_t v6 = [(WDDisplayTypeDataSourcesTableViewController *)self navigationItem];
    int v7 = [v6 leftBarButtonItem];

    if (v7)
    {
      uint64_t v8 = [(WDDisplayTypeDataSourcesTableViewController *)self navigationItem];
      uint64_t v9 = [v8 leftBarButtonItem];
      [(WDDisplayTypeDataSourcesTableViewController *)self setLeftBarButtonItemReference:v9];

      uint64_t v10 = [(WDDisplayTypeDataSourcesTableViewController *)self navigationItem];
      [v10 setLeftBarButtonItem:0];
    }
    uint64_t v11 = [(WDDisplayTypeDataSourcesTableViewController *)self navigationItem];
    [v11 setHidesBackButton:1 animated:1];

    id v12 = [MEMORY[0x263EFF8C0] arrayWithArray:self->_orderedDataSources];
    preEditSourcesOrdered = self->_preEditSourcesOrdered;
    self->_preEditSourcesOrdered = v12;

    [(WDDisplayTypeDataSourcesTableViewController *)self _sortDataSources];
  }
  else
  {
    uint64_t v14 = [(WDDisplayTypeDataSourcesTableViewController *)self leftBarButtonItemReference];
    uint64_t v15 = [(WDDisplayTypeDataSourcesTableViewController *)self navigationItem];
    [v15 setLeftBarButtonItem:v14];

    uint64_t v16 = [(WDDisplayTypeDataSourcesTableViewController *)self navigationItem];
    [v16 setHidesBackButton:0 animated:1];

    if (![(NSArray *)self->_preEditSourcesOrdered isEqualToArray:self->_orderedDataSources]) {
      [(WDDisplayTypeDataSourcesTableViewController *)self _updateOrderedSources];
    }
    uint64_t v17 = self->_preEditSourcesOrdered;
    self->_preEditSourcesOrdered = 0;
  }
  long long v18 = [(WDDisplayTypeDataSourcesTableViewController *)self tableView];
  long long v19 = (void *)MEMORY[0x263F1CB60];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  void v21[2] = __67__WDDisplayTypeDataSourcesTableViewController_setEditing_animated___block_invoke;
  v21[3] = &unk_26458DAD8;
  v21[4] = self;
  id v22 = v18;
  BOOL v23 = v4;
  id v20 = v18;
  [v19 animateWithDuration:v21 animations:0.25];
}

void __67__WDDisplayTypeDataSourcesTableViewController_setEditing_animated___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1112);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __67__WDDisplayTypeDataSourcesTableViewController_setEditing_animated___block_invoke_2;
  v12[3] = &unk_26458E7E0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v13 = v3;
  uint64_t v14 = v4;
  char v15 = *(unsigned char *)(a1 + 48);
  [v2 enumerateObjectsUsingBlock:v12];
  id v5 = *(void **)(*(void *)(a1 + 32) + 1120);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__WDDisplayTypeDataSourcesTableViewController_setEditing_animated___block_invoke_3;
  v8[3] = &unk_26458E7E0;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  char v11 = *(unsigned char *)(a1 + 48);
  [v5 enumerateObjectsUsingBlock:v8];
}

void __67__WDDisplayTypeDataSourcesTableViewController_setEditing_animated___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", a3, objc_msgSend(*(id *)(a1 + 40), "sectionForSectionIdentifier:", 0));
  id v8 = [v4 cellForRowAtIndexPath:v5];

  if (*(unsigned char *)(a1 + 48)) {
    double v6 = 0.600000024;
  }
  else {
    double v6 = 1.0;
  }
  uint64_t v7 = [v8 contentView];
  [v7 setAlpha:v6];

  [v8 setUserInteractionEnabled:*(unsigned char *)(a1 + 48) == 0];
}

void __67__WDDisplayTypeDataSourcesTableViewController_setEditing_animated___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", a3, objc_msgSend(*(id *)(a1 + 40), "sectionForSectionIdentifier:", 1));
  id v8 = [v4 cellForRowAtIndexPath:v5];

  if (*(unsigned char *)(a1 + 48)) {
    double v6 = 0.600000024;
  }
  else {
    double v6 = 1.0;
  }
  uint64_t v7 = [v8 contentView];
  [v7 setAlpha:v6];

  [v8 setUserInteractionEnabled:*(unsigned char *)(a1 + 48) == 0];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_sectionIdentifiers count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (!self->_isLoaded) {
    return 1;
  }
  unint64_t v5 = [(WDDisplayTypeDataSourcesTableViewController *)self sectionIdentifierForSection:a4];
  if (v5 > 2) {
    int64_t result = 0;
  }
  else {
    int64_t result = [*(id *)((char *)&self->super.super.super.super.super.isa + *off_26458E850[v5]) count];
  }
  if (result <= 1) {
    return 1;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!self->_isLoaded)
  {
    uint64_t v16 = objc_alloc_init(WDSpinnerTableViewCell);
    goto LABEL_11;
  }
  int64_t v9 = -[WDDisplayTypeDataSourcesTableViewController sectionIdentifierForSection:](self, "sectionIdentifierForSection:", [v7 section]);
  switch(v9)
  {
    case 2:
      -[WDDisplayTypeDataSourcesTableViewController _dataSourceCellForTableView:row:](self, "_dataSourceCellForTableView:row:", v6, [v8 row]);
      uint64_t v16 = (WDSpinnerTableViewCell *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 1:
      readerResearchStudySources = self->_readerResearchStudySources;
      uint64_t v11 = [v8 row];
      id v12 = self;
      id v13 = v6;
      uint64_t v14 = readerResearchStudySources;
      uint64_t v15 = 1;
      goto LABEL_9;
    case 0:
      readerAppSources = self->_readerAppSources;
      uint64_t v11 = [v8 row];
      id v12 = self;
      id v13 = v6;
      uint64_t v14 = readerAppSources;
      uint64_t v15 = 0;
LABEL_9:
      uint64_t v16 = [(WDDisplayTypeDataSourcesTableViewController *)v12 _readerSourceCellForTableView:v13 sourceArray:v14 row:v11 group:v15];
      goto LABEL_11;
  }
  HKErrorTableViewCell();
  uint64_t v16 = (WDSpinnerTableViewCell *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  long long v18 = v16;

  return v18;
}

- (id)_readerSourceCellForTableView:(id)a3 sourceArray:(id)a4 row:(unint64_t)a5 group:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if (!a6)
  {
    id v12 = @".ReaderApps";
    goto LABEL_5;
  }
  if (a6 == 1)
  {
    id v12 = @".ResearchStudies";
LABEL_5:
    id v13 = [@"Sources" stringByAppendingFormat:v12];
    goto LABEL_7;
  }
  id v13 = @"Sources";
LABEL_7:
  if ([v11 count])
  {
    uint64_t v14 = [v11 objectAtIndexedSubscript:a5];
    uint64_t v15 = [(NSMutableDictionary *)self->_authorizationRecordsBySource objectForKeyedSubscript:v14];
    uint64_t v16 = [v10 dequeueReusableCellWithIdentifier:@"sharing"];
    if (!v16)
    {
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F469D8]) initWithStyle:0 reuseIdentifier:@"sharing"];
      [v16 setDelegate:self];
    }
    [v16 setSelectionStyle:0];
    uint64_t v17 = [v14 source];
    long long v18 = [v17 name];

    [v16 setDisplayText:v18];
    if ([(WDDisplayTypeDataSourcesTableViewController *)self isEditing]) {
      double v19 = 0.600000024;
    }
    else {
      double v19 = 1.0;
    }
    id v20 = [v16 contentView];
    [v20 setAlpha:v19];

    uint64_t v36 = v15;
    [v15 status];
    [v16 setOn:HKAuthorizationStatusAllowsReading()];
    long long v21 = [(WDProfile *)self->_profile healthStore];
    id v22 = [v21 profileIdentifier];
    objc_msgSend(v16, "setEnabled:", objc_msgSend(v22, "type") == 1);

    uint64_t v23 = [(__CFString *)v13 stringByAppendingFormat:@".%@", v18];

    objc_super v24 = [NSString healthAccessibilityIdentifier:0 suffix:v23];
    [v16 setAccessibilityIdentifier:v24];

    objc_initWeak(&location, self);
    long long v25 = [MEMORY[0x263F463C8] sharedImageManager];
    long long v26 = [v14 source];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __99__WDDisplayTypeDataSourcesTableViewController__readerSourceCellForTableView_sourceArray_row_group___block_invoke;
    v42[3] = &unk_26458DBD0;
    id v27 = v16;
    id v43 = v27;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __99__WDDisplayTypeDataSourcesTableViewController__readerSourceCellForTableView_sourceArray_row_group___block_invoke_2;
    v37[3] = &unk_26458DC20;
    objc_copyWeak(&v41, &location);
    id v28 = v14;
    id v38 = v28;
    id v29 = v27;
    id v39 = v29;
    id v40 = v10;
    [v25 loadIconForSource:v26 syncHandler:v42 asyncHandler:v37];

    long long v30 = v40;
    id v31 = v29;

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);

    id v13 = (__CFString *)v23;
  }
  else
  {
    id v31 = [(WDDisplayTypeDataSourcesTableViewController *)self _noneTableViewCell];
    long long v32 = NSString;
    long long v33 = [(__CFString *)v13 stringByAppendingString:@".None"];
    uint64_t v34 = [v32 healthAccessibilityIdentifier:0 suffix:v33];
    [v31 setAccessibilityIdentifier:v34];
  }

  return v31;
}

uint64_t __99__WDDisplayTypeDataSourcesTableViewController__readerSourceCellForTableView_sourceArray_row_group___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setIconImage:a2];
}

void __99__WDDisplayTypeDataSourcesTableViewController__readerSourceCellForTableView_sourceArray_row_group___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __99__WDDisplayTypeDataSourcesTableViewController__readerSourceCellForTableView_sourceArray_row_group___block_invoke_3;
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

void __99__WDDisplayTypeDataSourcesTableViewController__readerSourceCellForTableView_sourceArray_row_group___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) source];
  [WeakRetained _handleReturnedImage:v2 forSource:v3 cell:*(void *)(a1 + 48) tableView:*(void *)(a1 + 56) fetchError:*(void *)(a1 + 64)];
}

- (id)_dataSourceCellForTableView:(id)a3 row:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [@"Sources" stringByAppendingString:@".DataSources"];
  if ([(NSMutableArray *)self->_orderedDataSources count])
  {
    id v8 = [(NSMutableArray *)self->_orderedDataSources objectAtIndexedSubscript:a4];
    int64_t v9 = [v6 dequeueReusableCellWithIdentifier:@"provider"];
    if (!v9)
    {
      int64_t v9 = [[WDDataProviderTableViewCell alloc] initWithStyle:3 reuseIdentifier:@"provider"];
      [(WDDataProviderTableViewCell *)v9 setShowsReorderControl:1];
      [(WDDataProviderTableViewCell *)v9 setShouldIndentWhileEditing:0];
      [(WDDataProviderTableViewCell *)v9 setAccessoryType:[(HKDisplayType *)self->_displayType isActivitySummary] ^ 1];
    }
    id v10 = [v8 source];
    id v11 = [v10 name];

    [(WDDataProviderTableViewCell *)v9 setDisplayName:v11];
    [(WDDataProviderTableViewCell *)v9 setActive:[(WDDisplayTypeDataSourcesTableViewController *)self _sourceIsEnabled:v8]];
    uint64_t v12 = [v7 stringByAppendingFormat:@".%@", v11];

    id v13 = [NSString healthAccessibilityIdentifier:0 suffix:v12];
    [(WDDataProviderTableViewCell *)v9 setAccessibilityIdentifier:v13];

    objc_initWeak(&location, self);
    id v14 = [MEMORY[0x263F463C8] sharedImageManager];
    id v15 = [v8 source];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __79__WDDisplayTypeDataSourcesTableViewController__dataSourceCellForTableView_row___block_invoke;
    v28[3] = &unk_26458DBD0;
    uint64_t v16 = v9;
    id v29 = v16;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __79__WDDisplayTypeDataSourcesTableViewController__dataSourceCellForTableView_row___block_invoke_2;
    v23[3] = &unk_26458DC20;
    objc_copyWeak(&v27, &location);
    id v17 = v8;
    id v24 = v17;
    long long v18 = v16;
    long long v25 = v18;
    id v26 = v6;
    [v14 loadIconForSource:v15 syncHandler:v28 asyncHandler:v23];

    double v19 = v26;
    id v20 = v18;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

    id v7 = (void *)v12;
  }
  else
  {
    id v20 = [(WDDisplayTypeDataSourcesTableViewController *)self _noneTableViewCell];
    long long v21 = [v7 stringByAppendingString:@".None"];
    [(WDDataProviderTableViewCell *)v20 setAccessibilityIdentifier:v21];
  }

  return v20;
}

uint64_t __79__WDDisplayTypeDataSourcesTableViewController__dataSourceCellForTableView_row___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setIconImage:a2];
}

void __79__WDDisplayTypeDataSourcesTableViewController__dataSourceCellForTableView_row___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__WDDisplayTypeDataSourcesTableViewController__dataSourceCellForTableView_row___block_invoke_3;
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

void __79__WDDisplayTypeDataSourcesTableViewController__dataSourceCellForTableView_row___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) source];
  [WeakRetained _handleReturnedImage:v2 forSource:v3 cell:*(void *)(a1 + 48) tableView:*(void *)(a1 + 56) fetchError:*(void *)(a1 + 64)];
}

- (id)_noneTableViewCell
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:0];
  id v3 = WDBundle();
  uint64_t v4 = [v3 localizedStringForKey:@"NONE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  id v5 = [v2 textLabel];
  [v5 setText:v4];

  id v6 = objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:", *MEMORY[0x263F1D260]);
  id v7 = [v2 textLabel];
  [v7 setFont:v6];

  id v8 = [MEMORY[0x263F1C550] secondaryLabelColor];
  int64_t v9 = [v2 textLabel];
  [v9 setTextColor:v8];

  [v2 setSelectionStyle:0];

  return v2;
}

- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 cell:(id)a5 tableView:(id)a6 fetchError:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v12 && !a7)
  {
    id v15 = [a6 indexPathForCell:v14];
    uint64_t v16 = v15;
    if (v15)
    {
      unint64_t v17 = [v15 row];
      long long v18 = [(WDDisplayTypeDataSourcesTableViewController *)self orderedDataSources];
      unint64_t v19 = [v18 count];

      if (v17 >= v19)
      {
        _HKInitializeLogging();
        id v24 = (void *)*MEMORY[0x263F09968];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
          -[WDDisplayTypeDataSourcesTableViewController _handleReturnedImage:forSource:cell:tableView:fetchError:](v24, v16, self);
        }
      }
      else
      {
        id v20 = [(WDDisplayTypeDataSourcesTableViewController *)self orderedDataSources];
        long long v21 = objc_msgSend(v20, "objectAtIndex:", objc_msgSend(v16, "row"));
        id v22 = [v21 source];

        if ([v22 isEqual:v13])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            [v14 setIconImage:v12];
          }
          else
          {
            long long v25 = [v14 imageView];
            [v25 setImage:v12];
          }
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v23 = *MEMORY[0x263F09968];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
        -[WDDisplayTypeDataSourcesTableViewController _handleReturnedImage:forSource:cell:tableView:fetchError:](v23);
      }
    }
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int64_t v5 = [(WDDisplayTypeDataSourcesTableViewController *)self sectionIdentifierForSection:a4];
  switch(v5)
  {
    case 2:
      int64_t v9 = WDBundle();
      id v10 = [v9 localizedStringForKey:@"DATA_SOURCES_HEADER" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
LABEL_8:
      id v11 = [MEMORY[0x263EFF960] currentLocale];
      id v12 = [v10 uppercaseStringWithLocale:v11];

LABEL_10:
      goto LABEL_12;
    case 1:
      int64_t v9 = WDBundle();
      id v12 = [v9 localizedStringForKey:@"RESEARCH_STUDIES_READ_ACCESS_HEADER" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
      goto LABEL_10;
    case 0:
      int v6 = [(HKDisplayType *)self->_displayType isDocument];
      id v7 = @"APPS_READ_ACCESS_HEADER";
      if (v6) {
        id v7 = @"SHARE_DATA_HEADER_CCD";
      }
      id v8 = v7;
      int64_t v9 = WDBundle();
      id v10 = [v9 localizedStringForKey:v8 value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

      goto LABEL_8;
  }
  id v12 = 0;
LABEL_12:

  return v12;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  int64_t v5 = [(WDDisplayTypeDataSourcesTableViewController *)self sectionIdentifierForSection:a4];
  if (v5 != 2)
  {
    if (v5 == 1)
    {
      int v6 = NSString;
      id v7 = WDBundle();
      id v8 = v7;
      int64_t v9 = @"DATA_TYPE_SHARING_RESEARCH_STUDIES_EXPLANATION";
    }
    else
    {
      if (v5)
      {
        unint64_t v17 = 0;
        goto LABEL_16;
      }
      int v6 = NSString;
      id v7 = WDBundle();
      id v8 = v7;
      int64_t v9 = @"DATA_TYPE_SHARING_APPS_EXPLANATION";
    }
    goto LABEL_9;
  }
  id v10 = [(HKHealthStore *)self->_healthStore profileIdentifier];
  if ([v10 type] == 3)
  {
    uint64_t v11 = [(HKDisplayType *)self->_displayType displayTypeIdentifier];

    if (v11 == 257)
    {
      id v12 = NSString;
      id v8 = WDBundle();
      id v13 = [v8 localizedStringForKey:@"%1$@_DATA_TYPE_PROVIDERS_VISION_EXPLANATION_%2$@" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Tinker"];
      id v14 = [(HKProfileStore *)self->_profileStore synchronouslyFetchFirstName];
      displayType = self->_displayType;
LABEL_14:
      uint64_t v16 = [(HKDisplayType *)displayType localization];
      id v20 = [v16 embeddedDisplayName];
      unint64_t v17 = objc_msgSend(v12, "stringWithFormat:", v13, v14, v20);

      goto LABEL_15;
    }
  }
  else
  {
  }
  long long v18 = [(HKHealthStore *)self->_healthStore profileIdentifier];
  uint64_t v19 = [v18 type];

  if (v19 == 3)
  {
    id v12 = NSString;
    id v8 = WDBundle();
    id v13 = [v8 localizedStringForKey:@"%1$@_DATA_TYPE_PROVIDERS_EXPLANATION_%2$@" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Tinker"];
    id v14 = [(HKProfileStore *)self->_profileStore synchronouslyFetchFirstName];
    displayType = self->_displayType;
    goto LABEL_14;
  }
  uint64_t v22 = [(HKDisplayType *)self->_displayType displayTypeIdentifier];
  int v6 = NSString;
  id v7 = WDBundle();
  id v8 = v7;
  if (v22 == 257) {
    int64_t v9 = @"DATA_TYPE_PROVIDERS_VISION_EXPLANATION";
  }
  else {
    int64_t v9 = @"DATA_TYPE_PROVIDERS_EXPLANATION";
  }
LABEL_9:
  id v13 = [v7 localizedStringForKey:v9 value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  id v14 = [(HKDisplayType *)self->_displayType localization];
  uint64_t v16 = [v14 embeddedDisplayName];
  unint64_t v17 = objc_msgSend(v6, "stringWithFormat:", v13, v16);
LABEL_15:

LABEL_16:

  return v17;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  int v6 = [(HKDisplayType *)self->_displayType behavior];
  int v7 = [v6 allowsSourceReordering];

  BOOL v8 = v7
    && -[WDDisplayTypeDataSourcesTableViewController sectionIdentifierForSection:](self, "sectionIdentifierForSection:", [v5 section]) == 2&& -[NSMutableArray count](self->_orderedDataSources, "count") != 0;

  return v8;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if (-[WDDisplayTypeDataSourcesTableViewController sectionIdentifierForSection:](self, "sectionIdentifierForSection:", [v5 section]) == 2)
  {
    int v6 = -[NSMutableArray objectAtIndexedSubscript:](self->_orderedDataSources, "objectAtIndexedSubscript:", [v5 row]);
    BOOL v7 = [(WDDisplayTypeDataSourcesTableViewController *)self _sourceIsEnabled:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  orderedDataSources = self->_orderedDataSources;
  id v8 = a5;
  -[NSMutableArray objectAtIndexedSubscript:](orderedDataSources, "objectAtIndexedSubscript:", [a4 row]);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)self->_orderedDataSources removeObject:v11];
  int64_t v9 = self->_orderedDataSources;
  uint64_t v10 = [v8 row];

  [(NSMutableArray *)v9 insertObject:v11 atIndex:v10];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return [(HKDisplayType *)self->_displayType isActivitySummary] ^ 1;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if (-[WDDisplayTypeDataSourcesTableViewController sectionIdentifierForSection:](self, "sectionIdentifierForSection:", [v5 section]) == 2&& -[NSMutableArray count](self->_orderedDataSources, "count"))
  {
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v36[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (-[WDDisplayTypeDataSourcesTableViewController sectionIdentifierForSection:](self, "sectionIdentifierForSection:", [v7 section]) == 2&& -[NSMutableArray count](self->_orderedDataSources, "count"))
  {
    [v6 deselectRowAtIndexPath:v7 animated:1];
    id v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_orderedDataSources, "objectAtIndexedSubscript:", [v7 row]);
    int v9 = [(WDDisplayTypeDataSourcesTableViewController *)self isEditing];
    uint64_t v10 = [v8 source];
    id v11 = v10;
    if (v9)
    {
      int v12 = [v10 _requiresAuthorization];

      if (v12)
      {
        id v26 = [v6 cellForRowAtIndexPath:v7];
        char v13 = [v26 isActive];
        id v27 = [(NSMutableDictionary *)self->_authorizationRecordsBySource objectForKeyedSubscript:v8];
        if (v13)
        {
          [(WDDisplayTypeDataSourcesTableViewController *)self _willDisableSource:v8];
          if ([v27 requestedReading]
            && ([v27 status], (HKAuthorizationStatusAllowsReading() & 1) != 0))
          {
            uint64_t v14 = 103;
          }
          else
          {
            uint64_t v14 = 104;
          }
        }
        else
        {
          [(WDDisplayTypeDataSourcesTableViewController *)self _willEnableSource:v8];
          if ([v27 requestedReading]
            && ([v27 status], (HKAuthorizationStatusAllowsReading() & 1) != 0))
          {
            uint64_t v14 = 101;
          }
          else
          {
            uint64_t v14 = 102;
          }
        }
        v36[0] = v7;
        uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:1];
        [v6 reloadRowsAtIndexPaths:v19 withRowAnimation:0];

        [v27 setStatus:v14];
        objc_initWeak(&location, self);
        authorizationStore = self->_authorizationStore;
        long long v21 = [(HKDisplayType *)self->_displayType objectType];
        uint64_t v34 = v21;
        uint64_t v22 = [NSNumber numberWithInteger:v14];
        v35 = v22;
        uint64_t v23 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        id v24 = [v8 source];
        long long v25 = [v24 bundleIdentifier];
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __81__WDDisplayTypeDataSourcesTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
        v28[3] = &unk_26458E830;
        objc_copyWeak(&v32, &location);
        id v29 = v8;
        id v30 = v6;
        id v31 = v7;
        [(HKAuthorizationStore *)authorizationStore setAuthorizationStatuses:v23 authorizationModes:MEMORY[0x263EFFA78] forBundleIdentifier:v25 options:0 completion:v28];

        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      id v15 = [(WDDisplayTypeDataSourcesTableViewController *)self _makeDataListViewControllerForSource:v10];

      uint64_t v16 = [v8 source];
      unint64_t v17 = [v16 name];
      [v15 setTitle:v17];

      long long v18 = [(WDDisplayTypeDataSourcesTableViewController *)self navigationController];
      [v18 pushViewController:v15 animated:1];
    }
  }
}

void __81__WDDisplayTypeDataSourcesTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __81__WDDisplayTypeDataSourcesTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_cold_1();
    }
  }
  id v6 = [MEMORY[0x263EFF9F0] mainRunLoop];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__WDDisplayTypeDataSourcesTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_436;
  v7[3] = &unk_26458E808;
  objc_copyWeak(&v11, a1 + 7);
  id v8 = a1[4];
  char v12 = a2;
  id v9 = a1[5];
  id v10 = a1[6];
  [v6 performBlock:v7];

  objc_destroyWeak(&v11);
}

void __81__WDDisplayTypeDataSourcesTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_436(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _sourceIsEnabledDidChange:*(void *)(a1 + 32)];
  if (WeakRetained && !*(unsigned char *)(a1 + 64))
  {
    id v3 = *(void **)(a1 + 40);
    v5[0] = *(void *)(a1 + 48);
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
    [v3 reloadRowsAtIndexPaths:v4 withRowAnimation:0];
  }
}

- (id)_makeDataListViewControllerForSource:(id)a3
{
  uint64_t v4 = [MEMORY[0x263F0A668] predicateForObjectsFromSource:a3];
  id v5 = [(WDProfile *)self->_profile healthStore];
  id v6 = +[HBXHealthAppPluginFactory makeDataListViewControllerForHealthStore:v5 displayType:self->_displayType predicate:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    displayType = self->_displayType;
    profile = self->_profile;
    id v10 = [(WDProfile *)profile unitController];
    id v11 = [(HKDisplayType *)displayType wd_listViewControllerDataProviderWithProfile:profile unitController:v10];

    [v11 setDefaultQueryPredicate:v4];
    id v7 = [[WDDataListViewController alloc] initWithDisplayType:self->_displayType profile:self->_profile dataProvider:v11 usingInsetStyling:1];
    if ([(WDDisplayTypeDataSourcesTableViewController *)self shouldInsetSectionContentForDataSourceDataList])
    {
      char v12 = [(WDDataListViewController *)v7 tableView];
      [v12 _setSectionContentInsetFollowsLayoutMargins:1];

      double v13 = *MEMORY[0x263F463A8];
      uint64_t v14 = [(WDDataListViewController *)v7 tableView];
      [v14 _setSectionCornerRadius:v13];
    }
  }

  return v7;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (-[WDDisplayTypeDataSourcesTableViewController sectionIdentifierForSection:](self, "sectionIdentifierForSection:", [v8 section]) == 2)
  {
    id v9 = -[NSMutableArray objectAtIndexedSubscript:](self->_orderedDataSources, "objectAtIndexedSubscript:", [v8 row]);
    if ([(WDDisplayTypeDataSourcesTableViewController *)self _sourceIsEnabled:v9]) {
      id v10 = v8;
    }
    else {
      id v10 = v7;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = v7;
  }

  return v11;
}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(WDDisplayTypeDataSourcesTableViewController *)self tableView];
  id v7 = [v6 indexPathForCell:v5];

  int64_t v8 = -[WDDisplayTypeDataSourcesTableViewController sectionIdentifierForSection:](self, "sectionIdentifierForSection:", [v7 section]);
  if (v8)
  {
    if (v8 != 1)
    {
      id v10 = 0;
      goto LABEL_7;
    }
    id v9 = &OBJC_IVAR___WDDisplayTypeDataSourcesTableViewController__readerResearchStudySources;
  }
  else
  {
    id v9 = &OBJC_IVAR___WDDisplayTypeDataSourcesTableViewController__readerAppSources;
  }
  id v10 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v9), "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
LABEL_7:
  id v11 = [(NSMutableDictionary *)self->_authorizationRecordsBySource objectForKeyedSubscript:v10];
  [v11 status];
  HKAuthorizationStatusAllowsSharing();
  uint64_t v12 = HKInternalAuthorizationStatusMake();
  [v11 setStatus:v12];
  authorizationStore = self->_authorizationStore;
  uint64_t v14 = [(HKDisplayType *)self->_displayType objectType];
  uint64_t v19 = v14;
  id v15 = [NSNumber numberWithInteger:v12];
  v20[0] = v15;
  uint64_t v16 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
  unint64_t v17 = [v10 source];
  long long v18 = [v17 bundleIdentifier];
  [(HKAuthorizationStore *)authorizationStore setAuthorizationStatuses:v16 authorizationModes:MEMORY[0x263EFFA78] forBundleIdentifier:v18 options:0 completion:&__block_literal_global_442];
}

void __76__WDDisplayTypeDataSourcesTableViewController_switchCellValueChanged_value___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __81__WDDisplayTypeDataSourcesTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_cold_1();
    }
  }
}

- (void)sourceListDataSourceDidUpdate:(id)a3
{
  [(WDDisplayTypeDataSourcesTableViewController *)self _gatherDataFromDataSource:a3];

  [(WDDisplayTypeDataSourcesTableViewController *)self _refreshUI];
}

- (void)viewControllerWillEnterAdaptiveModal
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  id v4 = (void *)MEMORY[0x263F1C3C0];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __83__WDDisplayTypeDataSourcesTableViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  id v11 = &unk_26458DD38;
  objc_copyWeak(&v12, &location);
  id v5 = [v4 actionWithHandler:&v8];
  id v6 = objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  if ([(WDDisplayTypeDataSourcesTableViewController *)self isEditing])
  {
    [(WDDisplayTypeDataSourcesTableViewController *)self setLeftBarButtonItemReference:v6];
  }
  else
  {
    id v7 = [(WDDisplayTypeDataSourcesTableViewController *)self navigationItem];
    [v7 setLeftBarButtonItem:v6];
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __83__WDDisplayTypeDataSourcesTableViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  if ([(WDDisplayTypeDataSourcesTableViewController *)self isEditing])
  {
    [(WDDisplayTypeDataSourcesTableViewController *)self setLeftBarButtonItemReference:0];
  }
  else
  {
    id v3 = [(WDDisplayTypeDataSourcesTableViewController *)self navigationItem];
    [v3 setLeftBarButtonItem:0];
  }
}

- (BOOL)shouldInsetSectionContentForDataSourceDataList
{
  return self->_shouldInsetSectionContentForDataSourceDataList;
}

- (void)setShouldInsetSectionContentForDataSourceDataList:(BOOL)a3
{
  self->_shouldInsetSectionContentForDataSourceDataList = a3;
}

- (HKSourceListDataSource)sourceListDataSource
{
  return self->_sourceListDataSource;
}

- (NSArray)loadedOrderedDataSources
{
  return self->_loadedOrderedDataSources;
}

- (void)setLoadedOrderedDataSources:(id)a3
{
}

- (NSMutableArray)orderedDataSources
{
  return self->_orderedDataSources;
}

- (void)setOrderedDataSources:(id)a3
{
}

- (NSSet)loadedAllDataSources
{
  return self->_loadedAllDataSources;
}

- (void)setLoadedAllDataSources:(id)a3
{
}

- (NSDictionary)loadedAuthorizationRecordsBySource
{
  return self->_loadedAuthorizationRecordsBySource;
}

- (void)setLoadedAuthorizationRecordsBySource:(id)a3
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
  objc_storeStrong((id *)&self->_loadedAuthorizationRecordsBySource, 0);
  objc_storeStrong((id *)&self->_loadedAllDataSources, 0);
  objc_storeStrong((id *)&self->_orderedDataSources, 0);
  objc_storeStrong((id *)&self->_loadedOrderedDataSources, 0);
  objc_storeStrong((id *)&self->_sourceListDataSource, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourcesPendingToggleOn, 0);
  objc_storeStrong((id *)&self->_sourcesPendingToggleOff, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_authorizationRecordsBySource, 0);
  objc_storeStrong((id *)&self->_readerResearchStudySources, 0);
  objc_storeStrong((id *)&self->_readerAppSources, 0);
  objc_storeStrong((id *)&self->_preEditSourcesOrdered, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_sourceOrderController, 0);
  objc_storeStrong((id *)&self->_authorizationStore, 0);
  objc_storeStrong((id *)&self->_profileStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_displayType, 0);

  objc_storeStrong((id *)&self->_displayCategory, 0);
}

void __89__WDDisplayTypeDataSourcesTableViewController__fetchDataSourcesForSampleType_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Error fetching source query: %{public}@", v2, v3, v4, v5, v6);
}

void __100__WDDisplayTypeDataSourcesTableViewController__fetchAuthorizationRecordsBySourceForType_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Error fetching authorization records: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_handleReturnedImage:(os_log_t)log forSource:cell:tableView:fetchError:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2210D2000, log, OS_LOG_TYPE_ERROR, "_handleReturnedImage could not find index path for cell", v1, 2u);
}

- (void)_handleReturnedImage:(void *)a3 forSource:cell:tableView:fetchError:.cold.2(void *a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  LODWORD(a2) = [a2 row];
  uint8_t v6 = [a3 orderedDataSources];
  v7[0] = 67109376;
  v7[1] = a2;
  __int16 v8 = 1024;
  int v9 = [v6 count];
  _os_log_error_impl(&dword_2210D2000, v5, OS_LOG_TYPE_ERROR, "_handleReturnedImage called for row (%d) beyond valid range (< %d)", (uint8_t *)v7, 0xEu);
}

void __81__WDDisplayTypeDataSourcesTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Error saving sharing state: %{public}@", v2, v3, v4, v5, v6);
}

@end