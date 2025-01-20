@interface HKObjectDataAccessViewController
- (HKObjectDataAccessViewController)initWithSample:(id)a3 healthStore:(id)a4;
- (id)_cellForSource:(id)a3 tableView:(id)a4;
- (id)_headerSubtitle;
- (id)_noAppsCell;
- (id)bodyFont;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 cell:(id)a5 tableView:(id)a6 fetchError:(id)a7;
- (void)_loadIconForSource:(id)a3 onCell:(id)a4 ofTableView:(id)a5;
- (void)_refreshAppAuthorizationData;
- (void)_setupHeaderViewSize;
- (void)dealloc;
- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HKObjectDataAccessViewController

- (HKObjectDataAccessViewController)initWithSample:(id)a3 healthStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HKObjectDataAccessViewController;
  v9 = [(HKTableViewController *)&v19 initWithUsingInsetStyling:1];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sample, a3);
    objc_storeStrong((id *)&v10->_healthStore, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F2AC68]) initWithHealthStore:v8];
    authorizationStore = v10->_authorizationStore;
    v10->_authorizationStore = (HKAuthorizationStore *)v11;

    v13 = +[HKDisplayTypeController sharedInstanceForHealthStore:v8];
    v14 = [v7 sampleType];
    uint64_t v15 = [v13 displayTypeForObjectType:v14];
    displayType = v10->_displayType;
    v10->_displayType = (HKDisplayType *)v15;

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v10 selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x1E4FB2730] object:0];
  }
  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HKObjectDataAccessViewController;
  [(HKObjectDataAccessViewController *)&v4 dealloc];
}

- (void)_setupHeaderViewSize
{
  v3 = objc_alloc_init(HKTitledIconHeaderView);
  headerView = self->_headerView;
  self->_headerView = v3;

  v5 = self->_headerView;
  v6 = [(HKDisplayType *)self->_displayType localization];
  id v7 = [v6 displayName];
  [(HKTitledIconHeaderView *)v5 setTitle:v7];

  id v8 = self->_headerView;
  v9 = [(HKObjectDataAccessViewController *)self _headerSubtitle];
  [(HKTitledIconHeaderView *)v8 setSubtitle:v9];

  [(HKTitledIconHeaderView *)self->_headerView setCentersSubtitle:1];
  id v24 = [MEMORY[0x1E4FB1830] configurationWithPointSize:50.0];
  v10 = [(HKDisplayType *)self->_displayType shareIcon];
  uint64_t v11 = [v10 imageByApplyingSymbolConfiguration:v24];

  [(HKTitledIconHeaderView *)self->_headerView setIconImage:v11];
  v12 = self->_headerView;
  v13 = [(HKDisplayType *)self->_displayType displayCategory];
  v14 = [v13 color];
  [(HKTitledIconHeaderView *)v12 setIconImageTint:v14];

  uint64_t v15 = self->_headerView;
  v16 = [(HKObjectDataAccessViewController *)self tableView];
  [v16 bounds];
  double v18 = v17;
  LODWORD(v17) = 1148846080;
  LODWORD(v19) = 1112014848;
  -[HKTitledIconHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v15, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v18, 0.0, v17, v19);

  [(HKTitledIconHeaderView *)self->_headerView bounds];
  -[HKTitledIconHeaderView setBounds:](self->_headerView, "setBounds:");
  v20 = self->_headerView;
  v21 = [(HKObjectDataAccessViewController *)self tableView];
  [(HKTitledIconHeaderView *)v20 setLayoutMarginsWithTableView:v21];

  v22 = self->_headerView;
  v23 = [(HKObjectDataAccessViewController *)self tableView];
  [v23 setTableHeaderView:v22];
}

- (id)bodyFont
{
  bodyFont = self->_bodyFont;
  if (!bodyFont)
  {
    objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
    objc_super v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_bodyFont;
    self->_bodyFont = v4;

    bodyFont = self->_bodyFont;
  }
  return bodyFont;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)HKObjectDataAccessViewController;
  [(HKTableViewController *)&v8 viewDidLoad];
  v3 = [(HKObjectDataAccessViewController *)self tableView];
  [v3 setEstimatedRowHeight:44.0];

  double v4 = *MEMORY[0x1E4FB2F28];
  v5 = [(HKObjectDataAccessViewController *)self tableView];
  [v5 setRowHeight:v4];

  v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v7 = [v6 localizedStringForKey:@"DATA_ACCESS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(HKObjectDataAccessViewController *)self setTitle:v7];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKObjectDataAccessViewController;
  [(HKObjectDataAccessViewController *)&v4 viewWillAppear:a3];
  [(HKObjectDataAccessViewController *)self _refreshAppAuthorizationData];
  [(HKObjectDataAccessViewController *)self _setupHeaderViewSize];
}

- (id)_headerSubtitle
{
  v3 = [(HKSample *)self->_sample startDate];
  objc_super v4 = HKLocalizedStringForDateAndTemplate(v3, 10);

  v5 = [(HKSample *)self->_sample sampleType];
  v6 = [v5 identifier];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F2AAE0]];

  if (v7)
  {
    sample = self->_sample;
    v9 = NSString;
    v10 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v11 = sample;
    v12 = [v10 bundleWithIdentifier:@"com.apple.HealthUI"];
    v13 = [v12 localizedStringForKey:@"OBJECT_DESCRIPTION_%1$@_AND_DATE_%2$@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v14 = HKVisionPrescriptionTypeDetailedLongLocalizedString(v11);

    objc_msgSend(v9, "stringWithFormat:", v13, v14, v4);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = v4;
  }

  return v15;
}

- (void)_refreshAppAuthorizationData
{
  authorizationStore = self->_authorizationStore;
  sample = self->_sample;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__HKObjectDataAccessViewController__refreshAppAuthorizationData__block_invoke;
  v4[3] = &unk_1E6D55820;
  v4[4] = self;
  [(HKAuthorizationStore *)authorizationStore fetchAuthorizationStatusesForSample:sample completion:v4];
}

void __64__HKObjectDataAccessViewController__refreshAppAuthorizationData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    int v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v5 copyItems:1];
    objc_super v8 = [*(id *)(*(void *)(a1 + 32) + 1048) sourceRevision];
    v9 = [v8 source];
    v10 = [v7 objectForKeyedSubscript:v9];
    if (v10)
    {
    }
    else
    {
      uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 1048) sourceRevision];
      v12 = [v11 source];
      if ([v12 _isApplication])
      {
        double v18 = [*(id *)(*(void *)(a1 + 32) + 1048) sourceRevision];
        v13 = [v18 source];
        int v19 = [v13 _requiresAuthorization];

        if (!v19)
        {
LABEL_11:
          v14 = [v7 allKeys];
          id v15 = [v14 sortedArrayUsingComparator:&__block_literal_global_72];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __64__HKObjectDataAccessViewController__refreshAppAuthorizationData__block_invoke_2;
          block[3] = &unk_1E6D51318;
          block[4] = *(void *)(a1 + 32);
          id v21 = v7;
          id v22 = v15;
          id v16 = v15;
          id v17 = v7;
          dispatch_async(MEMORY[0x1E4F14428], block);

          goto LABEL_12;
        }
        objc_super v8 = [*(id *)(*(void *)(a1 + 32) + 1048) sourceRevision];
        v9 = [v8 source];
        [v7 setObject:&unk_1F3C22480 forKeyedSubscript:v9];
      }
      else
      {
      }
    }

    goto LABEL_11;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
    __64__HKObjectDataAccessViewController__refreshAppAuthorizationData__block_invoke_cold_1();
  }
LABEL_12:
}

uint64_t __64__HKObjectDataAccessViewController__refreshAppAuthorizationData__block_invoke_315(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

void __64__HKObjectDataAccessViewController__refreshAppAuthorizationData__block_invoke_2(id *a1)
{
  objc_storeStrong((id *)a1[4] + 132, a1[5]);
  objc_storeStrong((id *)a1[4] + 133, a1[6]);
  id v2 = [a1[4] tableView];
  [v2 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result = [(NSArray *)self->_orderedApps count];
  if ((unint64_t)result <= 1) {
    return 1;
  }
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithIdentifier:", @"com.apple.HealthUI", a4);
  id v5 = [v4 localizedStringForKey:@"APPS_ALLOWED_TO_READ_DATA_HEADER" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  id v6 = [v5 localizedUppercaseString];

  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v5 = NSString;
  id v6 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithIdentifier:", @"com.apple.HealthUI", a4);
  uint64_t v7 = [v6 localizedStringForKey:@"APPS_ALLOWED_TO_READ_DATA_FOOTER_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  objc_super v8 = [(HKDisplayType *)self->_displayType localization];
  v9 = [v8 embeddedDisplayName];
  v10 = objc_msgSend(v5, "stringWithFormat:", v7, v9);

  return v10;
}

- (void)_loadIconForSource:(id)a3 onCell:(id)a4 ofTableView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  uint64_t v11 = +[HKAppImageManager sharedImageManager];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __74__HKObjectDataAccessViewController__loadIconForSource_onCell_ofTableView___block_invoke;
  v21[3] = &unk_1E6D55848;
  id v12 = v9;
  id v22 = v12;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__HKObjectDataAccessViewController__loadIconForSource_onCell_ofTableView___block_invoke_2;
  v16[3] = &unk_1E6D55898;
  objc_copyWeak(&v20, &location);
  id v13 = v8;
  id v17 = v13;
  id v14 = v12;
  id v18 = v14;
  id v15 = v10;
  id v19 = v15;
  [v11 loadIconForSource:v13 productType:0 syncHandler:v21 asyncHandler:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

uint64_t __74__HKObjectDataAccessViewController__loadIconForSource_onCell_ofTableView___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setIconImage:a2];
}

void __74__HKObjectDataAccessViewController__loadIconForSource_onCell_ofTableView___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__HKObjectDataAccessViewController__loadIconForSource_onCell_ofTableView___block_invoke_3;
  v9[3] = &unk_1E6D55870;
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

void __74__HKObjectDataAccessViewController__loadIconForSource_onCell_ofTableView___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained _handleReturnedImage:*(void *)(a1 + 32) forSource:*(void *)(a1 + 40) cell:*(void *)(a1 + 48) tableView:*(void *)(a1 + 56) fetchError:*(void *)(a1 + 64)];
}

- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 cell:(id)a5 tableView:(id)a6 fetchError:(id)a7
{
  id v17 = a3;
  id v12 = a5;
  if (v17 && !a7)
  {
    id v13 = a4;
    id v14 = [a6 indexPathForCell:v12];
    id v15 = -[NSArray objectAtIndexedSubscript:](self->_orderedApps, "objectAtIndexedSubscript:", [v14 row]);
    int v16 = [v15 isEqual:v13];

    if (v16) {
      [v12 setIconImage:v17];
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSArray *)self->_orderedApps count])
  {
    id v8 = -[NSArray objectAtIndexedSubscript:](self->_orderedApps, "objectAtIndexedSubscript:", [v7 row]);
    id v9 = [(HKObjectDataAccessViewController *)self _cellForSource:v8 tableView:v6];
  }
  else
  {
    id v9 = [(HKObjectDataAccessViewController *)self _noAppsCell];
  }

  return v9;
}

- (id)_noAppsCell
{
  id v2 = [(HKObjectDataAccessViewController *)self tableView];
  v3 = [v2 dequeueReusableCellWithIdentifier:@"HKObjectDataAccessNoAppCell"];

  if (!v3) {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"HKObjectDataAccessNoAppCell"];
  }
  id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v5 = [v4 localizedStringForKey:@"NONE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  id v6 = [v3 textLabel];
  [v6 setText:v5];

  id v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  id v8 = [v3 textLabel];
  [v8 setTextColor:v7];

  [v3 setUserInteractionEnabled:0];
  return v3;
}

- (id)_cellForSource:(id)a3 tableView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HKObjectDataAccessViewController *)self tableView];
  id v9 = [v8 dequeueReusableCellWithIdentifier:@"HKObjectDataAccessCell"];

  if (!v9) {
    id v9 = [[HKSwitchTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"HKObjectDataAccessCell"];
  }
  id v10 = [(NSMutableDictionary *)self->_authorizationByApp objectForKeyedSubscript:v7];
  BOOL v11 = [v10 integerValue] == 2;

  [(HKSwitchTableViewCell *)v9 setDelegate:self];
  [(HKSwitchTableViewCell *)v9 setCentersIcon:1];
  id v12 = [v7 name];
  id v13 = [(HKSwitchTableViewCell *)v9 textLabel];
  [v13 setText:v12];

  id v14 = [MEMORY[0x1E4FB1618] labelColor];
  id v15 = [(HKSwitchTableViewCell *)v9 textLabel];
  [v15 setTextColor:v14];

  [(HKSwitchTableViewCell *)v9 setOn:v11];
  [(HKObjectDataAccessViewController *)self _loadIconForSource:v7 onCell:v9 ofTableView:v6];

  return v9;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKObjectDataAccessViewController;
  [(HKObjectDataAccessViewController *)&v11 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(HKObjectDataAccessViewController *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];
    id v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      bodyFont = self->_bodyFont;
      self->_bodyFont = 0;
    }
  }
  [(HKObjectDataAccessViewController *)self _setupHeaderViewSize];
  id v10 = [(HKObjectDataAccessViewController *)self tableView];
  [v10 reloadData];
}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HKObjectDataAccessViewController *)self tableView];
  id v21 = [v7 indexPathForCell:v6];

  char v8 = -[NSArray objectAtIndexedSubscript:](self->_orderedApps, "objectAtIndexedSubscript:", [v21 row]);
  id v9 = [(NSMutableDictionary *)self->_authorizationByApp objectForKeyedSubscript:v8];
  id v20 = (void *)[v9 integerValue];

  if (v4) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 1;
  }
  objc_super v11 = [NSNumber numberWithInteger:v10];
  [(NSMutableDictionary *)self->_authorizationByApp setObject:v11 forKeyedSubscript:v8];

  objc_initWeak(&location, self);
  authorizationStore = self->_authorizationStore;
  id v13 = [(HKSample *)self->_sample UUID];
  v28 = v13;
  id v14 = [NSNumber numberWithInteger:v10];
  v29[0] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  int v16 = [(HKSample *)self->_sample sampleType];
  id v17 = [v8 bundleIdentifier];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __65__HKObjectDataAccessViewController_switchCellValueChanged_value___block_invoke;
  v22[3] = &unk_1E6D558E8;
  objc_copyWeak(v25, &location);
  id v18 = v6;
  id v23 = v18;
  id v19 = v8;
  id v24 = v19;
  v25[1] = v20;
  BOOL v26 = v4;
  [(HKAuthorizationStore *)authorizationStore setObjectAuthorizationStatuses:v15 forObjectType:v16 bundleIdentifier:v17 sessionIdentifier:0 completion:v22];

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

void __65__HKObjectDataAccessViewController_switchCellValueChanged_value___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
      __65__HKObjectDataAccessViewController_switchCellValueChanged_value___block_invoke_cold_1();
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__HKObjectDataAccessViewController_switchCellValueChanged_value___block_invoke_338;
    block[3] = &unk_1E6D558C0;
    block[4] = WeakRetained;
    id v10 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 56);
    id v11 = v7;
    uint64_t v12 = v8;
    char v13 = *(unsigned char *)(a1 + 64);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __65__HKObjectDataAccessViewController_switchCellValueChanged_value___block_invoke_338(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  id v5 = [v2 indexPathForCell:*(void *)(a1 + 40)];

  v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1064), "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
  BOOL v4 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  [*(id *)(*(void *)(a1 + 32) + 1056) setObject:v4 forKeyedSubscript:*(void *)(a1 + 48)];

  if ([v3 isEqual:*(void *)(a1 + 48)]) {
    [*(id *)(a1 + 40) setOn:*(unsigned char *)(a1 + 64) == 0 animated:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_orderedApps, 0);
  objc_storeStrong((id *)&self->_authorizationByApp, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_authorizationStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __64__HKObjectDataAccessViewController__refreshAppAuthorizationData__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, v0, v1, "Failed to retrieve authorization records for sample: %@ with error: %@");
}

void __65__HKObjectDataAccessViewController_switchCellValueChanged_value___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, v0, v1, "Failed to update authorization records for object: %@ with error: %@");
}

@end