@interface ProfileCharacteristicTypePermissionsViewController
+ (id)orderedSectionIdentifiersForProfile:(int64_t)a3;
- (BOOL)_shouldDisplayNameInFooters;
- (HKSourceListDataSource)sourceListDataSource;
- (NSDictionary)sourceToAuthRecord;
- (ProfileCharacteristicTypePermissionsViewController)initWithCoder:(id)a3;
- (ProfileCharacteristicTypePermissionsViewController)initWithHealthStore:(id)a3 characteristicType:(id)a4 firstName:(id)a5;
- (ProfileCharacteristicTypePermissionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ProfileCharacteristicTypePermissionsViewController)initWithStyle:(int64_t)a3;
- (id)_sourceForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)_profileSectionIdentifierForIndex:(int64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_adjustFooterHeight;
- (void)_fetchAuthorizationRecordsBySourceForCharacteristic:(id)a3;
- (void)_gatherDataAndRefreshUI;
- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 cell:(id)a5 tableView:(id)a6 fetchError:(id)a7;
- (void)setSourceListDataSource:(id)a3;
- (void)setSourceToAuthRecord:(id)a3;
- (void)sourceListDataSourceDidUpdate:(id)a3;
- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ProfileCharacteristicTypePermissionsViewController

- (ProfileCharacteristicTypePermissionsViewController)initWithHealthStore:(id)a3 characteristicType:(id)a4 firstName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)ProfileCharacteristicTypePermissionsViewController;
  v12 = [(ProfileCharacteristicTypePermissionsViewController *)&v25 initWithStyle:1];
  v13 = v12;
  if (v12)
  {
    p_healthStore = &v12->_healthStore;
    objc_storeStrong((id *)&v12->_healthStore, a3);
    uint64_t v15 = [MEMORY[0x1E4F67AC0] sharedInstanceForHealthStore:*p_healthStore];
    displayTypeController = v13->_displayTypeController;
    v13->_displayTypeController = (HKDisplayTypeController *)v15;

    objc_storeStrong((id *)&v13->_firstName, a5);
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F2AC68]) initWithHealthStore:*p_healthStore];
    authorizationStore = v13->_authorizationStore;
    v13->_authorizationStore = (HKAuthorizationStore *)v17;

    objc_storeStrong((id *)&v13->_characteristicType, a4);
    v13->_isLoaded = 0;
    uint64_t v19 = [(HKDisplayTypeController *)v13->_displayTypeController displayTypeForObjectType:v13->_characteristicType];
    displayType = v13->_displayType;
    v13->_displayType = (HKDisplayType *)v19;

    v21 = [v9 profileIdentifier];
    uint64_t v22 = +[ProfileCharacteristicTypePermissionsViewController orderedSectionIdentifiersForProfile:](ProfileCharacteristicTypePermissionsViewController, "orderedSectionIdentifiersForProfile:", [v21 type]);
    orderedSectionIdentifiers = v13->_orderedSectionIdentifiers;
    v13->_orderedSectionIdentifiers = (NSArray *)v22;
  }
  return v13;
}

- (ProfileCharacteristicTypePermissionsViewController)initWithStyle:(int64_t)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The -%@ method is not available on %@", v6, objc_opt_class() format];

  return 0;
}

- (ProfileCharacteristicTypePermissionsViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ProfileCharacteristicTypePermissionsViewController;
  return [(ProfileCharacteristicTypePermissionsViewController *)&v4 initWithCoder:a3];
}

- (ProfileCharacteristicTypePermissionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
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
  MEMORY[0x1F41817F8](sourceListDataSource, v5);
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)ProfileCharacteristicTypePermissionsViewController;
  [(ProfileCharacteristicTypePermissionsViewController *)&v15 viewDidLoad];
  v3 = [(ProfileCharacteristicTypePermissionsViewController *)self tableView];
  [v3 setEstimatedSectionHeaderHeight:0.0];

  objc_super v4 = [(ProfileCharacteristicTypePermissionsViewController *)self tableView];
  [v4 setEstimatedSectionFooterHeight:0.0];

  uint64_t v5 = [(HKDisplayTypeController *)self->_displayTypeController displayTypeForObjectType:self->_characteristicType];
  displayType = self->_displayType;
  self->_displayType = v5;

  v7 = [(HKDisplayType *)self->_displayType localization];
  v8 = [v7 summary];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    id v10 = (WDDisplayTypeDescriptionTableFooterView *)[objc_alloc(MEMORY[0x1E4F67898]) initWithDisplayType:self->_displayType];
    footerView = self->_footerView;
    self->_footerView = v10;
  }
  double v12 = *MEMORY[0x1E4F67958];
  v13 = [(ProfileCharacteristicTypePermissionsViewController *)self tableView];
  [v13 setEstimatedRowHeight:v12];

  v14 = [(ProfileCharacteristicTypePermissionsViewController *)self tableView];
  [v14 reloadData];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ProfileCharacteristicTypePermissionsViewController;
  [(ProfileCharacteristicTypePermissionsViewController *)&v6 viewWillAppear:a3];
  [(ProfileCharacteristicTypePermissionsViewController *)self _gatherDataAndRefreshUI];
  if (self->_footerView)
  {
    [(ProfileCharacteristicTypePermissionsViewController *)self _adjustFooterHeight];
    footerView = self->_footerView;
    uint64_t v5 = [(ProfileCharacteristicTypePermissionsViewController *)self tableView];
    [v5 setTableFooterView:footerView];
  }
}

- (void)_adjustFooterHeight
{
  [(WDDisplayTypeDescriptionTableFooterView *)self->_footerView frame];
  double v4 = v3;
  double v6 = v5;
  footerView = self->_footerView;
  v8 = [(ProfileCharacteristicTypePermissionsViewController *)self tableView];
  [v8 bounds];
  CGFloat Width = CGRectGetWidth(v18);
  LODWORD(v10) = 1148846080;
  LODWORD(v11) = 1132068864;
  -[WDDisplayTypeDescriptionTableFooterView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](footerView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 0.0, v10, v11);
  double v13 = v12;
  double v15 = v14;

  v16 = self->_footerView;
  -[WDDisplayTypeDescriptionTableFooterView setFrame:](v16, "setFrame:", v4, v6, v13, v15);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ProfileCharacteristicTypePermissionsViewController;
  [(ProfileCharacteristicTypePermissionsViewController *)&v10 traitCollectionDidChange:v4];
  if (v4)
  {
    double v5 = [(ProfileCharacteristicTypePermissionsViewController *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __79__ProfileCharacteristicTypePermissionsViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E5E7CB60;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __79__ProfileCharacteristicTypePermissionsViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tableView];
  [v2 beginUpdates];

  [*(id *)(a1 + 32) _adjustFooterHeight];
  id v3 = [*(id *)(a1 + 32) tableView];
  [v3 endUpdates];
}

- (void)_gatherDataAndRefreshUI
{
}

- (void)_fetchAuthorizationRecordsBySourceForCharacteristic:(id)a3
{
  authorizationStore = self->_authorizationStore;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __106__ProfileCharacteristicTypePermissionsViewController__fetchAuthorizationRecordsBySourceForCharacteristic___block_invoke;
  v4[3] = &unk_1E5E7D050;
  v4[4] = self;
  [(HKAuthorizationStore *)authorizationStore fetchAuthorizationRecordsForType:a3 completion:v4];
}

void __106__ProfileCharacteristicTypePermissionsViewController__fetchAuthorizationRecordsBySourceForCharacteristic___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __106__ProfileCharacteristicTypePermissionsViewController__fetchAuthorizationRecordsBySourceForCharacteristic___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __106__ProfileCharacteristicTypePermissionsViewController__fetchAuthorizationRecordsBySourceForCharacteristic___block_invoke_293;
  v9[3] = &unk_1E5E7CF40;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __106__ProfileCharacteristicTypePermissionsViewController__fetchAuthorizationRecordsBySourceForCharacteristic___block_invoke_293(uint64_t a1)
{
  [*(id *)(a1 + 32) setSourceToAuthRecord:*(void *)(a1 + 40)];
  id v2 = objc_alloc(MEMORY[0x1E4F67C50]);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[128];
  id v5 = [v3 sourceToAuthRecord];
  id v6 = [v5 allKeys];
  id v8 = (id)[v2 initWithHealthStore:v4 sources:v6 queue:MEMORY[0x1E4F14428]];

  [v8 setShouldFetchAppIcons:1];
  [*(id *)(a1 + 32) setSourceListDataSource:v8];
  v7 = [*(id *)(a1 + 32) sourceListDataSource];
  [v7 fetchSources];
}

- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 cell:(id)a5 tableView:(id)a6 fetchError:(id)a7
{
  id v17 = a3;
  id v12 = a5;
  if (v17 && !a7)
  {
    id v13 = a4;
    double v14 = [a6 indexPathForCell:v12];
    double v15 = [(ProfileCharacteristicTypePermissionsViewController *)self _sourceForIndexPath:v14];
    v16 = [v15 source];

    LODWORD(v15) = [v16 isEqual:v13];
    if (v15) {
      [v12 setIconImage:v17];
    }
  }
}

+ (id)orderedSectionIdentifiersForProfile:(int64_t)a3
{
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", &unk_1F0465530, 0);
  id v5 = v4;
  if (a3 == 1) {
    [v4 addObject:&unk_1F0465548];
  }
  return v5;
}

- (int64_t)_profileSectionIdentifierForIndex:(int64_t)a3
{
  id v3 = [(NSArray *)self->_orderedSectionIdentifiers objectAtIndexedSubscript:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)_shouldDisplayNameInFooters
{
  id v2 = [(HKHealthStore *)self->_healthStore profileIdentifier];
  BOOL v3 = [v2 type] == 3;

  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_orderedSectionIdentifiers count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5 = [(ProfileCharacteristicTypePermissionsViewController *)self _profileSectionIdentifierForIndex:a4];
  if (v5 == 1)
  {
    id v6 = [(ProfileCharacteristicTypePermissionsViewController *)self sourceListDataSource];
    v7 = [v6 sources];
    id v8 = [v7 orderedResearchStudySources];
  }
  else
  {
    if (v5) {
      return 0;
    }
    id v6 = [(ProfileCharacteristicTypePermissionsViewController *)self sourceListDataSource];
    v7 = [v6 sources];
    id v8 = [v7 orderedAppSources];
  }
  uint64_t v9 = v8;
  unint64_t v10 = [v8 count];
  if (v10 <= 1) {
    int64_t v11 = 1;
  }
  else {
    int64_t v11 = v10;
  }

  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!self->_isLoaded)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F678B8]);
    goto LABEL_16;
  }
  int64_t v9 = -[ProfileCharacteristicTypePermissionsViewController _profileSectionIdentifierForIndex:](self, "_profileSectionIdentifierForIndex:", [v7 section]);
  if (v9 == 1)
  {
    CGRect v18 = [(ProfileCharacteristicTypePermissionsViewController *)self sourceListDataSource];
    uint64_t v19 = [v18 sources];
    v20 = [v19 orderedResearchStudySources];
    uint64_t v21 = [v20 count];

    if (!v21)
    {
      id v14 = (id)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:0];
      double v15 = WDBundle();
      v16 = v15;
      id v17 = @"RESEARCH_STUDIES_NONE";
      goto LABEL_15;
    }
  }
  else if (!v9)
  {
    unint64_t v10 = [(ProfileCharacteristicTypePermissionsViewController *)self sourceListDataSource];
    int64_t v11 = [v10 sources];
    id v12 = [v11 orderedAppSources];
    uint64_t v13 = [v12 count];

    if (!v13)
    {
      id v14 = (id)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:0];
      double v15 = WDBundle();
      v16 = v15;
      id v17 = @"APPS_NONE";
LABEL_15:
      v32 = [v15 localizedStringForKey:v17 value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
      v33 = [v14 textLabel];
      [v33 setText:v32];

      v34 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      v35 = [v14 textLabel];
      [v35 setTextColor:v34];

      [v14 setSelectionStyle:0];
      goto LABEL_16;
    }
  }
  uint64_t v22 = [v6 dequeueReusableCellWithIdentifier:@"source"];
  if (!v22)
  {
    uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F67C70]) initWithStyle:0 reuseIdentifier:@"source"];
    [v22 setSelectionStyle:0];
    [v22 setDelegate:self];
  }
  v23 = [(ProfileCharacteristicTypePermissionsViewController *)self _sourceForIndexPath:v8];
  if (v23)
  {
    v24 = [(NSDictionary *)self->_characteristicAuthorizationRecordsBySource objectForKeyedSubscript:v23];
    objc_super v25 = [v23 source];
    v26 = [v25 name];

    [v22 setDisplayText:v26];
    [v24 status];
    [v22 setOn:HKAuthorizationStatusAllowsReading()];
    objc_initWeak(&location, self);
    v27 = [MEMORY[0x1E4F67978] sharedImageManager];
    v28 = [v23 source];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __86__ProfileCharacteristicTypePermissionsViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v42[3] = &unk_1E5E7D078;
    id v29 = v22;
    id v43 = v29;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __86__ProfileCharacteristicTypePermissionsViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
    v37[3] = &unk_1E5E7D0C8;
    objc_copyWeak(&v41, &location);
    id v38 = v23;
    id v30 = v29;
    id v39 = v30;
    id v40 = v6;
    [v27 loadIconForSource:v28 syncHandler:v42 asyncHandler:v37];

    id v14 = v30;
    objc_destroyWeak(&v41);

    objc_destroyWeak(&location);
  }
  else
  {
    v31 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v31);
    HKErrorTableViewCell();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_16:
  return v14;
}

uint64_t __86__ProfileCharacteristicTypePermissionsViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setIconImage:a2];
}

void __86__ProfileCharacteristicTypePermissionsViewController_tableView_cellForRowAtIndexPath___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__ProfileCharacteristicTypePermissionsViewController_tableView_cellForRowAtIndexPath___block_invoke_3;
  v9[3] = &unk_1E5E7D0A0;
  objc_copyWeak(&v15, a1 + 7);
  id v10 = v5;
  id v11 = a1[4];
  id v12 = a1[5];
  id v13 = a1[6];
  id v14 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v15);
}

void __86__ProfileCharacteristicTypePermissionsViewController_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) source];
  [WeakRetained _handleReturnedImage:v2 forSource:v3 cell:*(void *)(a1 + 48) tableView:*(void *)(a1 + 56) fetchError:*(void *)(a1 + 64)];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  if (objc_opt_respondsToSelector())
  {
    [v8 iconSize];
    double v6 = v5;
    [v8 layoutMargins];
    objc_msgSend(v8, "setSeparatorInset:", 0.0, v6 + v7 * 2.0, 0.0, 0.0);
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int64_t v4 = [(ProfileCharacteristicTypePermissionsViewController *)self _profileSectionIdentifierForIndex:a4];
  if (v4 == 1)
  {
    double v5 = WDBundle();
    double v6 = v5;
    double v7 = @"RESEARCH_STUDIES_READ_ACCESS_HEADER";
    goto LABEL_5;
  }
  if (!v4)
  {
    double v5 = WDBundle();
    double v6 = v5;
    double v7 = @"APPS_READ_ACCESS_HEADER";
LABEL_5:
    id v8 = [v5 localizedStringForKey:v7 value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
    int64_t v9 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v10 = [v8 uppercaseStringWithLocale:v9];

    goto LABEL_7;
  }
  id v10 = &stru_1F04402E8;
LABEL_7:
  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  int64_t v5 = [(ProfileCharacteristicTypePermissionsViewController *)self _profileSectionIdentifierForIndex:a4];
  if (v5 != 1)
  {
    if (v5)
    {
      id v13 = &stru_1F04402E8;
      goto LABEL_16;
    }
    if ([(ProfileCharacteristicTypePermissionsViewController *)self _shouldDisplayNameInFooters])
    {
      double v6 = NSString;
      double v7 = WDBundle();
      id v8 = [v7 localizedStringForKey:@"DATA_TYPE_SHARING_APPS_EXPLANATION_%@%@" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable-Tinker"];
      int64_t v9 = [(HKDisplayType *)self->_displayType localization];
      id v10 = [v9 embeddedDisplayName];
      objc_msgSend(v6, "stringWithFormat:", v8, v10, self->_firstName);
LABEL_14:
      id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    if ([(HKDisplayType *)self->_displayType displayTypeIdentifier] == 218)
    {
      id v11 = WDBundle();
      double v7 = v11;
      id v12 = @"DATA_TYPE_SHARING_APPS_EXPLANATION_THIS";
      goto LABEL_10;
    }
    id v14 = NSString;
    id v15 = WDBundle();
    double v7 = v15;
    v16 = @"DATA_TYPE_SHARING_APPS_EXPLANATION";
LABEL_13:
    id v8 = [v15 localizedStringForKey:v16 value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
    int64_t v9 = [(HKDisplayType *)self->_displayType localization];
    id v10 = [v9 embeddedDisplayName];
    objc_msgSend(v14, "stringWithFormat:", v8, v10, v18);
    goto LABEL_14;
  }
  if ([(HKDisplayType *)self->_displayType displayTypeIdentifier] != 218)
  {
    id v14 = NSString;
    id v15 = WDBundle();
    double v7 = v15;
    v16 = @"DATA_TYPE_SHARING_RESEARCH_STUDIES_EXPLANATION";
    goto LABEL_13;
  }
  id v11 = WDBundle();
  double v7 = v11;
  id v12 = @"DATA_TYPE_SHARING_RESEARCH_STUDIES_EXPLANATION_THIS";
LABEL_10:
  id v13 = [v11 localizedStringForKey:v12 value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
LABEL_15:

LABEL_16:
  return v13;
}

- (id)_sourceForIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[ProfileCharacteristicTypePermissionsViewController _profileSectionIdentifierForIndex:](self, "_profileSectionIdentifierForIndex:", [v4 section]);
  if (v5 == 1)
  {
    double v6 = [(ProfileCharacteristicTypePermissionsViewController *)self sourceListDataSource];
    double v7 = [v6 sources];
    id v8 = [v7 orderedResearchStudySources];
    goto LABEL_5;
  }
  if (!v5)
  {
    double v6 = [(ProfileCharacteristicTypePermissionsViewController *)self sourceListDataSource];
    double v7 = [v6 sources];
    id v8 = [v7 orderedAppSources];
LABEL_5:
    int64_t v9 = v8;
    id v10 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));

    goto LABEL_7;
  }
  id v10 = 0;
LABEL_7:

  return v10;
}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [(ProfileCharacteristicTypePermissionsViewController *)self tableView];
  id v8 = [v7 indexPathForCell:v6];

  int64_t v9 = [(ProfileCharacteristicTypePermissionsViewController *)self _sourceForIndexPath:v8];
  id v10 = [(NSDictionary *)self->_characteristicAuthorizationRecordsBySource objectForKeyedSubscript:v9];
  int v11 = [v10 requestedSharing];
  if (v4)
  {
    if (v11 && ([v10 status], (HKAuthorizationStatusAllowsSharing() & 1) != 0)) {
      uint64_t v12 = 101;
    }
    else {
      uint64_t v12 = 103;
    }
  }
  else if (v11 && ([v10 status], (HKAuthorizationStatusAllowsSharing() & 1) != 0))
  {
    uint64_t v12 = 102;
  }
  else
  {
    uint64_t v12 = 104;
  }
  [v10 setStatus:v12];
  id v13 = self->_characteristicType;
  authorizationStore = self->_authorizationStore;
  uint64_t v22 = v13;
  id v15 = [MEMORY[0x1E4F28ED0] numberWithInteger:v12];
  v23[0] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  id v17 = [v9 source];
  uint64_t v18 = [v17 bundleIdentifier];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __83__ProfileCharacteristicTypePermissionsViewController_switchCellValueChanged_value___block_invoke;
  v20[3] = &unk_1E5E7CEC8;
  uint64_t v21 = v13;
  uint64_t v19 = v13;
  [(HKAuthorizationStore *)authorizationStore setAuthorizationStatuses:v16 authorizationModes:MEMORY[0x1E4F1CC08] forBundleIdentifier:v18 options:0 completion:v20];
}

void __83__ProfileCharacteristicTypePermissionsViewController_switchCellValueChanged_value___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
      __83__ProfileCharacteristicTypePermissionsViewController_switchCellValueChanged_value___block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }
  }
}

- (void)sourceListDataSourceDidUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__ProfileCharacteristicTypePermissionsViewController_sourceListDataSourceDidUpdate___block_invoke;
  v6[3] = &unk_1E5E7CF40;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __84__ProfileCharacteristicTypePermissionsViewController_sourceListDataSourceDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v3 = objc_msgSend(*(id *)(a1 + 32), "sources", 0);
  id v4 = [v3 allSources];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        int64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v10 = [*(id *)(a1 + 40) sourceToAuthRecord];
        int v11 = [v9 source];
        uint64_t v12 = [v10 objectForKeyedSubscript:v11];

        if (v12)
        {
          id v13 = (void *)[objc_alloc(MEMORY[0x1E4F67870]) initWithInternalAuthorizationRecord:v12];
          [v2 setObject:v13 forKeyedSubscript:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  uint64_t v14 = *(void *)(a1 + 40);
  id v15 = *(void **)(v14 + 1064);
  *(void *)(v14 + 1064) = v2;
  id v16 = v2;

  id v17 = *(unsigned char **)(a1 + 40);
  if (!v17[1088])
  {
    v17[1088] = 1;
    id v17 = *(unsigned char **)(a1 + 40);
  }
  uint64_t v18 = [v17 tableView];

  [v18 reloadData];
}

- (HKSourceListDataSource)sourceListDataSource
{
  return self->_sourceListDataSource;
}

- (NSDictionary)sourceToAuthRecord
{
  return self->_sourceToAuthRecord;
}

- (void)setSourceToAuthRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceToAuthRecord, 0);
  objc_storeStrong((id *)&self->_sourceListDataSource, 0);
  objc_storeStrong((id *)&self->_orderedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_characteristicAuthorizationRecordsBySource, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
  objc_storeStrong((id *)&self->_authorizationStore, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __106__ProfileCharacteristicTypePermissionsViewController__fetchAuthorizationRecordsBySourceForCharacteristic___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AD1A4000, a2, OS_LOG_TYPE_ERROR, "Error fetching authorization records: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __83__ProfileCharacteristicTypePermissionsViewController_switchCellValueChanged_value___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1AD1A4000, log, OS_LOG_TYPE_ERROR, "Error setting authorization for %@: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end