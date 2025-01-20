@interface WDAppAccessListViewController
- (HKSample)sample;
- (NSArray)allowedApps;
- (NSArray)disallowedApps;
- (UIFont)bodyFont;
- (WDAppAccessListViewController)initWithSample:(id)a3 healthStore:(id)a4;
- (id)_identifierForCellInSection:(int64_t)a3;
- (id)_sourceForIndexPath:(id)a3;
- (id)_textForCellAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_displayGuestModeAlert;
- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 cell:(id)a5 tableView:(id)a6 fetchError:(id)a7;
- (void)_loadIconForSource:(id)a3 onCell:(id)a4 ofTableView:(id)a5;
- (void)_refreshAppAuthorizationData;
- (void)resetAccess;
- (void)setAllowedApps:(id)a3;
- (void)setBodyFont:(id)a3;
- (void)setDisallowedApps:(id)a3;
- (void)setSample:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation WDAppAccessListViewController

- (WDAppAccessListViewController)initWithSample:(id)a3 healthStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WDAppAccessListViewController;
  v9 = [(HKTableViewController *)&v14 initWithUsingInsetStyling:1];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sample, a3);
    objc_storeStrong((id *)&v10->_healthStore, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x263F0A118]) initWithHealthStore:v8];
    authorizationStore = v10->_authorizationStore;
    v10->_authorizationStore = (HKAuthorizationStore *)v11;

    [(WDAppAccessListViewController *)v10 _refreshAppAuthorizationData];
  }

  return v10;
}

- (UIFont)bodyFont
{
  bodyFont = self->_bodyFont;
  if (!bodyFont)
  {
    objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:", *MEMORY[0x263F1D260]);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_bodyFont;
    self->_bodyFont = v4;

    bodyFont = self->_bodyFont;
  }

  return bodyFont;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)WDAppAccessListViewController;
  [(HKTableViewController *)&v7 viewDidLoad];
  double v3 = *MEMORY[0x263F46380];
  v4 = [(WDAppAccessListViewController *)self tableView];
  [v4 setEstimatedRowHeight:v3];

  double v5 = *MEMORY[0x263F1D600];
  v6 = [(WDAppAccessListViewController *)self tableView];
  [v6 setRowHeight:v5];
}

- (void)_refreshAppAuthorizationData
{
  authorizationStore = self->_authorizationStore;
  sample = self->_sample;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__WDAppAccessListViewController__refreshAppAuthorizationData__block_invoke;
  v4[3] = &unk_26458DBA8;
  v4[4] = self;
  [(HKAuthorizationStore *)authorizationStore fetchAuthorizationStatusesForSample:sample completion:v4];
}

void __61__WDAppAccessListViewController__refreshAppAuthorizationData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_super v7 = v6;
  if (v6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__WDAppAccessListViewController__refreshAppAuthorizationData__block_invoke_2;
    block[3] = &unk_26458DB58;
    block[4] = *(void *)(a1 + 32);
    id v38 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);

    goto LABEL_24;
  }
  v28 = [MEMORY[0x263EFF980] array];
  v29 = [MEMORY[0x263EFF980] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = [v5 allKeys];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    char v12 = 1;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v15 = [v5 objectForKeyedSubscript:v14];
        uint64_t v16 = [v15 integerValue];

        if (v16 == 2)
        {
          v17 = v28;
          goto LABEL_12;
        }
        if (v16 == 1)
        {
          v17 = v29;
LABEL_12:
          [v17 addObject:v14];
          continue;
        }
        v18 = [*(id *)(*(void *)(a1 + 32) + 1064) sourceRevision];
        v19 = [v18 source];
        char v20 = [v14 isEqual:v19];

        v12 &= v20 ^ 1;
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (!v10)
      {

        if ((v12 & 1) == 0) {
          goto LABEL_23;
        }
        goto LABEL_19;
      }
    }
  }

LABEL_19:
  v21 = [*(id *)(*(void *)(a1 + 32) + 1064) sourceRevision];
  v22 = [v21 source];
  if (([v29 containsObject:v22] & 1) == 0)
  {
    v23 = [*(id *)(*(void *)(a1 + 32) + 1064) sourceRevision];
    v24 = [v23 source];
    char v25 = [v28 containsObject:v24];

    if (v25) {
      goto LABEL_23;
    }
    v21 = [*(id *)(*(void *)(a1 + 32) + 1064) sourceRevision];
    v22 = [v21 source];
    [v28 addObject:v22];
  }

LABEL_23:
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __61__WDAppAccessListViewController__refreshAppAuthorizationData__block_invoke_291;
  v30[3] = &unk_26458DB80;
  v30[4] = *(void *)(a1 + 32);
  id v31 = v28;
  id v32 = v29;
  id v26 = v29;
  id v27 = v28;
  dispatch_async(MEMORY[0x263EF83A0], v30);

  objc_super v7 = 0;
LABEL_24:
}

void __61__WDAppAccessListViewController__refreshAppAuthorizationData__block_invoke_2(uint64_t a1)
{
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x263F098D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D0], OS_LOG_TYPE_ERROR)) {
    __61__WDAppAccessListViewController__refreshAppAuthorizationData__block_invoke_2_cold_1(a1, v2);
  }
}

void __61__WDAppAccessListViewController__refreshAppAuthorizationData__block_invoke_291(uint64_t a1)
{
  [*(id *)(a1 + 32) setAllowedApps:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setDisallowedApps:*(void *)(a1 + 48)];
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    int64_t v8 = 1;
  }
  else
  {
    if (a4 == 1)
    {
      uint64_t v7 = 1056;
    }
    else
    {
      if (a4)
      {
        int64_t v8 = 0;
        goto LABEL_11;
      }
      uint64_t v7 = 1048;
    }
    unint64_t v9 = [*(id *)((char *)&self->super.super.super.super.super.isa + v7) count];
    if (v9 <= 1) {
      int64_t v8 = 1;
    }
    else {
      int64_t v8 = v9;
    }
  }
LABEL_11:

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  if (a4 == 1)
  {
    id v6 = WDBundle();
    uint64_t v7 = v6;
    int64_t v8 = @"CCD_NOT_SHARED_WITH_APP";
    goto LABEL_5;
  }
  if (!a4)
  {
    id v6 = WDBundle();
    uint64_t v7 = v6;
    int64_t v8 = @"CCD_SHARED_WITH_APP";
LABEL_5:
    unint64_t v9 = [v6 localizedStringForKey:v8 value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

    goto LABEL_7;
  }
  unint64_t v9 = 0;
LABEL_7:

  return v9;
}

- (id)_identifierForCellInSection:(int64_t)a3
{
  if (a3 == 2)
  {
    v4 = @"WDAppAccessListResetAllCell";
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    uint64_t v3 = 1056;
  }
  else
  {
    if (a3)
    {
      v4 = 0;
      goto LABEL_11;
    }
    uint64_t v3 = 1048;
  }
  uint64_t v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + v3) count];
  id v6 = @"WDAppAccessListAppCell";
  if (!v5) {
    id v6 = @"WDAppAccessListNoneCell";
  }
  v4 = v6;
LABEL_11:

  return v4;
}

- (id)_sourceForIndexPath:(id)a3
{
  id v4 = a3;
  if (![v4 section])
  {
    uint64_t v5 = &OBJC_IVAR___WDAppAccessListViewController__allowedApps;
    goto LABEL_5;
  }
  if ([v4 section] == 1)
  {
    uint64_t v5 = &OBJC_IVAR___WDAppAccessListViewController__disallowedApps;
LABEL_5:
    id v6 = *(id *)((char *)&self->super.super.super.super.super.isa + *v5);
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:
  unint64_t v7 = [v4 row];
  if (v7 >= [v6 count])
  {
    int64_t v8 = 0;
  }
  else
  {
    int64_t v8 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  }

  return v8;
}

- (void)_loadIconForSource:(id)a3 onCell:(id)a4 ofTableView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  uint64_t v11 = [MEMORY[0x263F463C8] sharedImageManager];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __71__WDAppAccessListViewController__loadIconForSource_onCell_ofTableView___block_invoke;
  v21[3] = &unk_26458DBD0;
  id v12 = v9;
  id v22 = v12;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __71__WDAppAccessListViewController__loadIconForSource_onCell_ofTableView___block_invoke_2;
  v16[3] = &unk_26458DC20;
  objc_copyWeak(&v20, &location);
  id v13 = v8;
  id v17 = v13;
  id v14 = v12;
  id v18 = v14;
  id v15 = v10;
  id v19 = v15;
  [v11 loadIconForSource:v13 syncHandler:v21 asyncHandler:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __71__WDAppAccessListViewController__loadIconForSource_onCell_ofTableView___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 imageView];
  [v4 setImage:v3];
}

void __71__WDAppAccessListViewController__loadIconForSource_onCell_ofTableView___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__WDAppAccessListViewController__loadIconForSource_onCell_ofTableView___block_invoke_3;
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

void __71__WDAppAccessListViewController__loadIconForSource_onCell_ofTableView___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained _handleReturnedImage:*(void *)(a1 + 32) forSource:*(void *)(a1 + 40) cell:*(void *)(a1 + 48) tableView:*(void *)(a1 + 56) fetchError:*(void *)(a1 + 64)];
}

- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 cell:(id)a5 tableView:(id)a6 fetchError:(id)a7
{
  id v18 = a3;
  id v12 = a5;
  if (v18 && !a7)
  {
    id v13 = a4;
    id v14 = [a6 indexPathForCell:v12];
    id v15 = [(WDAppAccessListViewController *)self _sourceForIndexPath:v14];
    int v16 = [v15 isEqual:v13];

    if (v16)
    {
      id v17 = [v12 imageView];
      [v17 setImage:v18];
    }
  }
}

- (id)_textForCellAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  if (!v5)
  {
    id v8 = &OBJC_IVAR___WDAppAccessListViewController__allowedApps;
LABEL_7:
    id v6 = *(id *)((char *)&self->super.super.super.super.super.isa + *v8);
LABEL_9:
    if ([v6 count])
    {
      id v9 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
      [v9 name];
    }
    else
    {
      id v9 = WDBundle();
      [v9 localizedStringForKey:@"NO_APPS_TO_SHOW" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    id v7 = };

    goto LABEL_13;
  }
  if (v5 == 1)
  {
    id v8 = &OBJC_IVAR___WDAppAccessListViewController__disallowedApps;
    goto LABEL_7;
  }
  if (v5 != 2)
  {
    id v6 = 0;
    goto LABEL_9;
  }
  WDBundle();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 localizedStringForKey:@"RESET_SHARING" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
LABEL_13:

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[WDAppAccessListViewController _identifierForCellInSection:](self, "_identifierForCellInSection:", [v7 section]);
  id v9 = [v6 dequeueReusableCellWithIdentifier:v8];
  if (!v9) {
    id v9 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:v8];
  }
  if ([v7 section] == 2) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 0;
  }
  [v9 setSelectionStyle:v10];
  id v11 = [(WDAppAccessListViewController *)self _textForCellAtIndexPath:v7];
  id v12 = [v9 textLabel];
  [v12 setText:v11];

  id v13 = [(WDAppAccessListViewController *)self bodyFont];
  id v14 = [v9 textLabel];
  [v14 setFont:v13];

  id v15 = [(WDAppAccessListViewController *)self _sourceForIndexPath:v7];
  [(WDAppAccessListViewController *)self _loadIconForSource:v15 onCell:v9 ofTableView:v6];

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v6 section] == 2) {
    [(WDAppAccessListViewController *)self resetAccess];
  }
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (void)resetAccess
{
  v6[1] = *MEMORY[0x263EF8340];
  authorizationStore = self->_authorizationStore;
  v6[0] = self->_sample;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__WDAppAccessListViewController_resetAccess__block_invoke;
  v5[3] = &unk_26458DC48;
  v5[4] = self;
  [(HKAuthorizationStore *)authorizationStore resetAuthorizationStatusesForObjects:v4 completion:v5];
}

void __44__WDAppAccessListViewController_resetAccess__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _refreshAppAuthorizationData];
  }
  else
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x263F098D0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D0], OS_LOG_TYPE_ERROR)) {
      __44__WDAppAccessListViewController_resetAccess__block_invoke_cold_1(a1, v6);
    }
  }
}

- (void)_displayGuestModeAlert
{
  id v3 = (void *)MEMORY[0x263F1C3F8];
  id v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v5 = [v4 localizedStringForKey:@"GUEST_MODE_CHANGE_AUTHORIZATION_TITLE" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  id v6 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v7 = [v6 localizedStringForKey:@"GUEST_MODE_CHANGE_AUTHORIZATION_DESCRIPTION" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  id v12 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  id v8 = (void *)MEMORY[0x263F1C3F0];
  id v9 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v10 = [v9 localizedStringForKey:@"SHARE_ALERT_OK" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  id v11 = [v8 actionWithTitle:v10 style:0 handler:0];

  [v12 addAction:v11];
  [(WDAppAccessListViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDAppAccessListViewController;
  [(WDAppAccessListViewController *)&v10 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(WDAppAccessListViewController *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];
    id v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      bodyFont = self->_bodyFont;
      self->_bodyFont = 0;
    }
  }
}

- (NSArray)allowedApps
{
  return self->_allowedApps;
}

- (void)setAllowedApps:(id)a3
{
}

- (NSArray)disallowedApps
{
  return self->_disallowedApps;
}

- (void)setDisallowedApps:(id)a3
{
}

- (HKSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
}

- (void)setBodyFont:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_disallowedApps, 0);
  objc_storeStrong((id *)&self->_allowedApps, 0);
  objc_storeStrong((id *)&self->_authorizationStore, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __61__WDAppAccessListViewController__refreshAppAuthorizationData__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 sample];
  OUTLINED_FUNCTION_0(&dword_2210D2000, v5, v6, "Failed to retrieve authorization records for sample: %@ with error: %@", v7, v8, v9, v10, 2u);
}

void __44__WDAppAccessListViewController_resetAccess__block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 sample];
  uint64_t v5 = [v4 UUID];
  OUTLINED_FUNCTION_0(&dword_2210D2000, v6, v7, "Failed to reset authorization for sample: %@ with error: %@", v8, v9, v10, v11, 2u);
}

@end