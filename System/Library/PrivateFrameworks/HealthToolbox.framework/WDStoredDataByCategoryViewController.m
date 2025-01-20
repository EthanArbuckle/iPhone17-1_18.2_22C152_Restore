@interface WDStoredDataByCategoryViewController
- (BOOL)isBluetoothDevice;
- (BOOL)queryReturned;
- (BOOL)shouldShowDeleteAllDataButton;
- (NSArray)capturedSampleTypes;
- (NSArray)savedCategories;
- (NSPredicate)storedDataPredicate;
- (NSString)storedDataDisplayName;
- (NSUUID)deviceIdentifier;
- (UIFont)bodyFont;
- (WDProfile)profile;
- (WDStoredDataByCategoryViewController)init;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_makeDataListViewControllerForDisplayType:(id)a3;
- (id)reduceCategoriesForCapturedSampleTypes:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)firstSectionWithData;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_displayGuestModeAlertWithCompletion:(id)a3;
- (void)_displayTypeStringsChanged:(id)a3;
- (void)deleteAllStoredData;
- (void)fetchEnabledStatusForPeripheral;
- (void)handleSamplesQueryResults:(id)a3;
- (void)presentDeleteConfirmation;
- (void)selectSourceStoredDataTableViewCell:(id)a3;
- (void)setBodyFont:(id)a3;
- (void)setCapturedSampleTypes:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setIsBluetoothDevice:(BOOL)a3;
- (void)setProfile:(id)a3;
- (void)setQueryReturned:(BOOL)a3;
- (void)setSavedCategories:(id)a3;
- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WDStoredDataByCategoryViewController

- (WDStoredDataByCategoryViewController)init
{
  return [(HKTableViewController *)self initWithUsingInsetStyling:1];
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)WDStoredDataByCategoryViewController;
  [(HKTableViewController *)&v25 viewDidLoad];
  v3 = [(WDStoredDataByCategoryViewController *)self storedDataDisplayName];
  [(WDStoredDataByCategoryViewController *)self setTitle:v3];

  v4 = [(WDStoredDataByCategoryViewController *)self bodyFont];
  [v4 _scaledValueForValue:*MEMORY[0x263F46380]];
  double v6 = v5;

  v7 = [(WDStoredDataByCategoryViewController *)self tableView];
  [v7 setEstimatedRowHeight:v6];

  v8 = [(WDStoredDataByCategoryViewController *)self tableView];
  [v8 setEstimatedSectionHeaderHeight:v6];

  objc_initWeak(&location, self);
  id v9 = objc_alloc(MEMORY[0x263F0A408]);
  v10 = [(WDStoredDataByCategoryViewController *)self profile];
  v11 = [v10 healthStore];
  v12 = (HKHealthServicesManager *)[v9 initWithHealthStore:v11];
  healthServicesManager = self->_healthServicesManager;
  self->_healthServicesManager = v12;

  id v14 = objc_alloc(MEMORY[0x263F0AA20]);
  v15 = [(WDStoredDataByCategoryViewController *)self storedDataPredicate];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __51__WDStoredDataByCategoryViewController_viewDidLoad__block_invoke;
  v22 = &unk_26458EE18;
  objc_copyWeak(&v23, &location);
  v16 = (void *)[v14 initWithPredicate:v15 resultsHandler:&v19];

  v17 = [(WDStoredDataByCategoryViewController *)self profile];
  v18 = [v17 healthStore];
  [v18 executeQuery:v16];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __51__WDStoredDataByCategoryViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__WDStoredDataByCategoryViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_26458EDF0;
  id v11 = v7;
  id v8 = v7;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  id v12 = v6;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v13);
}

void __51__WDStoredDataByCategoryViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  v1 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    _HKInitializeLogging();
    v2 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __51__WDStoredDataByCategoryViewController_viewDidLoad__block_invoke_2_cold_1(v1, v2);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained handleSamplesQueryResults:*(void *)(a1 + 40)];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDStoredDataByCategoryViewController;
  [(WDStoredDataByCategoryViewController *)&v4 viewWillAppear:a3];
  [(WDStoredDataByCategoryViewController *)self fetchEnabledStatusForPeripheral];
}

- (void)_displayTypeStringsChanged:(id)a3
{
  id v3 = [(WDStoredDataByCategoryViewController *)self tableView];
  [v3 reloadData];
}

- (void)handleSamplesQueryResults:(id)a3
{
  [(WDStoredDataByCategoryViewController *)self setCapturedSampleTypes:a3];
  objc_super v4 = [(WDStoredDataByCategoryViewController *)self capturedSampleTypes];
  double v5 = [(WDStoredDataByCategoryViewController *)self reduceCategoriesForCapturedSampleTypes:v4];
  [(WDStoredDataByCategoryViewController *)self setSavedCategories:v5];

  [(WDStoredDataByCategoryViewController *)self setQueryReturned:1];
  id v6 = [(WDStoredDataByCategoryViewController *)self tableView];
  [v6 reloadData];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDStoredDataByCategoryViewController;
  [(WDStoredDataByCategoryViewController *)&v10 traitCollectionDidChange:v4];
  if (v4)
  {
    double v5 = [(WDStoredDataByCategoryViewController *)self traitCollection];
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

- (id)reduceCategoriesForCapturedSampleTypes:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v40 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = [MEMORY[0x263F466E8] sortedCategories];
  uint64_t v35 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v35)
  {
    uint64_t v33 = *(void *)v56;
    id v37 = v3;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v56 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v4;
        double v5 = *(void **)(*((void *)&v55 + 1) + 8 * v4);
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v6 = (void *)MEMORY[0x263F46700];
        id v7 = [(WDStoredDataByCategoryViewController *)self profile];
        char v8 = [v7 healthStore];
        id v9 = [v6 sharedInstanceForHealthStore:v8];
        objc_super v10 = objc_msgSend(v9, "displayTypesForCategoryIdentifier:", objc_msgSend(v5, "categoryID"));

        id v39 = v10;
        uint64_t v41 = [v10 countByEnumeratingWithState:&v51 objects:v61 count:16];
        if (v41)
        {
          uint64_t v11 = *(void *)v52;
          uint64_t v38 = *(void *)v52;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v52 != v11) {
                objc_enumerationMutation(v39);
              }
              uint64_t v42 = v12;
              id v13 = *(void **)(*((void *)&v51 + 1) + 8 * v12);
              long long v47 = 0u;
              long long v48 = 0u;
              long long v49 = 0u;
              long long v50 = 0u;
              id v14 = v3;
              uint64_t v15 = [v14 countByEnumeratingWithState:&v47 objects:v60 count:16];
              if (!v15) {
                goto LABEL_34;
              }
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v48;
              while (2)
              {
                for (uint64_t i = 0; i != v16; ++i)
                {
                  if (*(void *)v48 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v19 = *(void **)(*((void *)&v47 + 1) + 8 * i);
                  uint64_t v20 = [v13 sampleType];

                  if (v19 == v20)
                  {
                    long long v45 = 0u;
                    long long v46 = 0u;
                    long long v43 = 0u;
                    long long v44 = 0u;
                    id v21 = v40;
                    uint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v59 count:16];
                    if (v22)
                    {
                      uint64_t v23 = v22;
                      v24 = 0;
                      uint64_t v25 = *(void *)v44;
                      do
                      {
                        for (uint64_t j = 0; j != v23; ++j)
                        {
                          if (*(void *)v44 != v25) {
                            objc_enumerationMutation(v21);
                          }
                          v27 = *(void **)(*((void *)&v43 + 1) + 8 * j);
                          v28 = [v27 category];

                          if (v28 == v5)
                          {
                            v29 = v27;

                            v24 = v29;
                          }
                        }
                        uint64_t v23 = [v21 countByEnumeratingWithState:&v43 objects:v59 count:16];
                      }
                      while (v23);

                      id v3 = v37;
                      uint64_t v11 = v38;
                      if (!v24)
                      {
LABEL_32:
                        v24 = objc_alloc_init(WDStoredDataCategory);
                        [(WDStoredDataCategory *)v24 setCategory:v5];
                        [v21 addObject:v24];
                      }
                      v30 = [(WDStoredDataCategory *)v24 displayTypes];
                      [v30 addObject:v13];

                      goto LABEL_34;
                    }

                    goto LABEL_32;
                  }
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v47 objects:v60 count:16];
                if (v16) {
                  continue;
                }
                break;
              }
LABEL_34:

              uint64_t v12 = v42 + 1;
            }
            while (v42 + 1 != v41);
            uint64_t v41 = [v39 countByEnumeratingWithState:&v51 objects:v61 count:16];
          }
          while (v41);
        }

        uint64_t v4 = v36 + 1;
      }
      while (v36 + 1 != v35);
      uint64_t v35 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v35);
  }

  return v40;
}

- (void)presentDeleteConfirmation
{
  id v3 = (void *)MEMORY[0x263F1C3F8];
  uint64_t v4 = NSString;
  double v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v6 = [v5 localizedStringForKey:@"PERMENANTLY_DELETE_ALL_DATA_FROM_%@" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  id v7 = [(WDStoredDataByCategoryViewController *)self storedDataDisplayName];
  char v8 = objc_msgSend(v4, "stringWithFormat:", v6, v7);
  id v9 = [v3 alertControllerWithTitle:v8 message:0 preferredStyle:0];

  objc_super v10 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v11 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v12 = [v11 localizedStringForKey:@"PERMENANTLY_DELETE_ALL_DATA_DELETE" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __65__WDStoredDataByCategoryViewController_presentDeleteConfirmation__block_invoke;
  v18[3] = &unk_26458DFA8;
  v18[4] = self;
  id v13 = [v10 actionWithTitle:v12 style:2 handler:v18];
  [v9 addAction:v13];

  id v14 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v16 = [v15 localizedStringForKey:@"PERMENANTLY_DELETE_ALL_DATA_CANCEL" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  uint64_t v17 = [v14 actionWithTitle:v16 style:0 handler:0];
  [v9 addAction:v17];

  [(WDStoredDataByCategoryViewController *)self presentViewController:v9 animated:1 completion:0];
}

uint64_t __65__WDStoredDataByCategoryViewController_presentDeleteConfirmation__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationController];
  id v3 = (id)[v2 popViewControllerAnimated:1];

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 deleteAllStoredData];
}

- (UIFont)bodyFont
{
  bodyFont = self->_bodyFont;
  if (!bodyFont)
  {
    objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:", *MEMORY[0x263F1D260]);
    uint64_t v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    double v5 = self->_bodyFont;
    self->_bodyFont = v4;

    bodyFont = self->_bodyFont;
  }

  return bodyFont;
}

- (void)fetchEnabledStatusForPeripheral
{
  if ([(WDStoredDataByCategoryViewController *)self isBluetoothDevice])
  {
    healthServicesManager = self->_healthServicesManager;
    deviceIdentifier = self->_deviceIdentifier;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __71__WDStoredDataByCategoryViewController_fetchEnabledStatusForPeripheral__block_invoke;
    v5[3] = &unk_26458DC48;
    v5[4] = self;
    [(HKHealthServicesManager *)healthServicesManager getEnabledStatusForPeripheral:deviceIdentifier withCompletion:v5];
  }
}

void __71__WDStoredDataByCategoryViewController_fetchEnabledStatusForPeripheral__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x263F098F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
      __71__WDStoredDataByCategoryViewController_fetchEnabledStatusForPeripheral__block_invoke_cold_1((uint64_t)v5, v6);
    }
  }
  if (v5) {
    char v7 = a2;
  }
  else {
    char v7 = 1;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1041) = v7;
  *(unsigned char *)(*(void *)(a1 + 32) + 1040) = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__WDStoredDataByCategoryViewController_fetchEnabledStatusForPeripheral__block_invoke_352;
  block[3] = &unk_26458DC98;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __71__WDStoredDataByCategoryViewController_fetchEnabledStatusForPeripheral__block_invoke_352(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

- (int64_t)firstSectionWithData
{
  return [(WDStoredDataByCategoryViewController *)self isBluetoothDevice];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (![(WDStoredDataByCategoryViewController *)self queryReturned]
    && [(WDStoredDataByCategoryViewController *)self isBluetoothDevice])
  {
    return 2;
  }
  if (![(WDStoredDataByCategoryViewController *)self queryReturned]) {
    return 1;
  }
  id v5 = [(WDStoredDataByCategoryViewController *)self savedCategories];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    char v7 = [(WDStoredDataByCategoryViewController *)self savedCategories];
    uint64_t v8 = [v7 count];
  }
  else
  {
    uint64_t v8 = 1;
  }
  uint64_t v9 = v8 + [(WDStoredDataByCategoryViewController *)self isBluetoothDevice];
  return v9
       + [(WDStoredDataByCategoryViewController *)self shouldShowDeleteAllDataButton];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  BOOL v6 = [(WDStoredDataByCategoryViewController *)self isBluetoothDevice];
  if (!a4 && v6) {
    return 1;
  }
  char v7 = [(WDStoredDataByCategoryViewController *)self savedCategories];
  unint64_t v8 = [v7 count];

  if (v8 <= a4) {
    return 1;
  }
  uint64_t v9 = [(WDStoredDataByCategoryViewController *)self savedCategories];
  objc_super v10 = [v9 objectAtIndexedSubscript:a4];
  uint64_t v11 = [v10 displayTypes];
  int64_t v12 = [v11 count];

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(WDStoredDataByCategoryViewController *)self isBluetoothDevice]
    || [v7 section])
  {
    if ([(WDStoredDataByCategoryViewController *)self queryReturned]
      || (uint64_t v8 = [v7 section],
          v8 != [(WDStoredDataByCategoryViewController *)self firstSectionWithData]))
    {
      BOOL v10 = [(WDStoredDataByCategoryViewController *)self isBluetoothDevice];
      unint64_t v11 = [v7 section] - v10;
      int64_t v12 = [(WDStoredDataByCategoryViewController *)self savedCategories];
      unint64_t v13 = [v12 count];

      if (v13 > v11)
      {
        uint64_t v9 = [v6 dequeueReusableCellWithIdentifier:@"WDStoredDataByCategoryTableViewCell"];
        if (!v9) {
          uint64_t v9 = [[WDStoredDataCategoryTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"WDStoredDataByCategoryTableViewCell"];
        }
        id v14 = [(WDStoredDataByCategoryViewController *)self bodyFont];
        uint64_t v15 = [(WDStoredDataCategoryTableViewCell *)v9 textLabel];
        [v15 setFont:v14];

        uint64_t v16 = [(WDStoredDataCategoryTableViewCell *)v9 textLabel];
        LODWORD(v17) = 1055286886;
        [v16 _setHyphenationFactor:v17];

        [(WDStoredDataCategoryTableViewCell *)v9 setAccessoryType:1];
        v18 = [(WDStoredDataByCategoryViewController *)self savedCategories];
        uint64_t v19 = [v18 objectAtIndexedSubscript:v11];
        uint64_t v20 = [v19 displayTypes];
        id v21 = objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
        [(WDStoredDataCategoryTableViewCell *)v9 setDisplayType:v21];

        goto LABEL_23;
      }
      uint64_t v22 = [v7 section];
      if (v22 == [(WDStoredDataByCategoryViewController *)self firstSectionWithData])
      {
        uint64_t v9 = [v6 dequeueReusableCellWithIdentifier:@"WDStoredDataByCategoryTableViewEmptyCell"];
        if (!v9) {
          uint64_t v9 = (WDStoredDataCategoryTableViewCell *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"WDStoredDataByCategoryTableViewEmptyCell"];
        }
        [(WDStoredDataCategoryTableViewCell *)v9 setSelectionStyle:0];
        uint64_t v23 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
        v24 = [v23 localizedStringForKey:@"NO_DATA_FOUND" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
        uint64_t v25 = [(WDStoredDataCategoryTableViewCell *)v9 textLabel];
        [v25 setText:v24];

        v26 = [MEMORY[0x263F1C550] lightGrayColor];
        v27 = [(WDStoredDataCategoryTableViewCell *)v9 textLabel];
        [v27 setTextColor:v26];
      }
      else
      {
        uint64_t v9 = [v6 dequeueReusableCellWithIdentifier:@"WDStoredDataByCategoryTableViewDeleteAllCell"];
        if (!v9) {
          uint64_t v9 = (WDStoredDataCategoryTableViewCell *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"WDStoredDataByCategoryTableViewDeleteAllCell"];
        }
        v31 = [MEMORY[0x263F1C550] systemRedColor];
        v32 = [(WDStoredDataCategoryTableViewCell *)v9 textLabel];
        [v32 setTextColor:v31];

        uint64_t v33 = NSString;
        v34 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
        uint64_t v35 = [v34 localizedStringForKey:@"DELETE_ALL_DATA_FOR_SOURCE_%@" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
        uint64_t v36 = [(WDStoredDataByCategoryViewController *)self storedDataDisplayName];
        id v37 = objc_msgSend(v33, "stringWithFormat:", v35, v36);
        uint64_t v38 = [(WDStoredDataCategoryTableViewCell *)v9 textLabel];
        [v38 setText:v37];

        v26 = [(WDStoredDataCategoryTableViewCell *)v9 textLabel];
        [v26 setNumberOfLines:0];
      }
    }
    else
    {
      uint64_t v9 = [v6 dequeueReusableCellWithIdentifier:@"WDStoredDataByCategoryTableViewWaitingCellIdentifier"];
      if (!v9) {
        uint64_t v9 = [[WDSpinnerTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"WDStoredDataByCategoryTableViewWaitingCellIdentifier"];
      }
    }
    v18 = [(WDStoredDataByCategoryViewController *)self bodyFont];
    uint64_t v19 = [(WDStoredDataCategoryTableViewCell *)v9 textLabel];
    [v19 setFont:v18];
LABEL_23:

    goto LABEL_24;
  }
  v28 = [(WDStoredDataByCategoryViewController *)self tableView];
  uint64_t v9 = [v28 dequeueReusableCellWithIdentifier:@"WDStoredDataByCategoryTableViewDeviceSourceKillSwitch"];

  if (!v9) {
    uint64_t v9 = (WDStoredDataCategoryTableViewCell *)[objc_alloc(MEMORY[0x263F469D8]) initWithStyle:0 reuseIdentifier:@"WDStoredDataByCategoryTableViewDeviceSourceKillSwitch"];
  }
  [(WDStoredDataCategoryTableViewCell *)v9 setDelegate:self];
  [(WDStoredDataCategoryTableViewCell *)v9 setOn:self->_deviceEnabled];
  v29 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  v30 = [v29 localizedStringForKey:@"UPDATE_HEALTH_DATA" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  [(WDStoredDataCategoryTableViewCell *)v9 setDisplayText:v30];

  [(WDStoredDataCategoryTableViewCell *)v9 setEnabled:self->_deviceFound];
LABEL_24:

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x263F1D600];
}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 isOn];
  objc_initWeak(&location, self);
  healthServicesManager = self->_healthServicesManager;
  deviceIdentifier = self->_deviceIdentifier;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__WDStoredDataByCategoryViewController_switchCellValueChanged_value___block_invoke;
  v9[3] = &unk_26458EE40;
  objc_copyWeak(&v10, &location);
  char v11 = v6;
  [(HKHealthServicesManager *)healthServicesManager setEnabledStatus:v6 forPeripheral:deviceIdentifier withCompletion:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __69__WDStoredDataByCategoryViewController_switchCellValueChanged_value___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      *((unsigned char *)WeakRetained + 1040) = *(unsigned char *)(a1 + 40);
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v6 = (void *)*MEMORY[0x263F09968];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
        __69__WDStoredDataByCategoryViewController_switchCellValueChanged_value___block_invoke_cold_1(v6, v5, a1);
      }
    }
  }
}

- (void)_displayGuestModeAlertWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x263F1C3F8];
  id v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v6 = [v5 localizedStringForKey:@"GUEST_MODE_CHANGE_AUTHORIZATION_TITLE" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  id v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v8 = [v7 localizedStringForKey:@"GUEST_MODE_CHANGE_AUTHORIZATION_DESCRIPTION" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  uint64_t v9 = [v4 alertControllerWithTitle:v6 message:v8 preferredStyle:1];

  id v10 = (void *)MEMORY[0x263F1C3F0];
  char v11 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  int64_t v12 = [v11 localizedStringForKey:@"SHARE_ALERT_OK" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __77__WDStoredDataByCategoryViewController__displayGuestModeAlertWithCompletion___block_invoke;
  v16[3] = &unk_26458ED78;
  id v17 = v3;
  id v13 = v3;
  id v14 = [v10 actionWithTitle:v12 style:0 handler:v16];

  [v9 addAction:v14];
  [(WDStoredDataByCategoryViewController *)self presentViewController:v9 animated:1 completion:0];
}

uint64_t __77__WDStoredDataByCategoryViewController__displayGuestModeAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ([(WDStoredDataByCategoryViewController *)self queryReturned])
  {
    BOOL v6 = [(WDStoredDataByCategoryViewController *)self isBluetoothDevice];
    if (!a4 && v6
      || (unint64_t v7 = a4 - [(WDStoredDataByCategoryViewController *)self isBluetoothDevice],
          [(WDStoredDataByCategoryViewController *)self savedCategories],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          unint64_t v9 = [v8 count],
          v8,
          v9 <= v7))
    {
      id v13 = 0;
    }
    else
    {
      id v10 = [(WDStoredDataByCategoryViewController *)self savedCategories];
      char v11 = [v10 objectAtIndexedSubscript:v7];
      int64_t v12 = [v11 category];
      id v13 = [v12 displayName];
    }
  }
  else
  {
    id v13 = @" ";
  }

  return v13;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if ([MEMORY[0x263F0A980] isAppleInternalInstall]
    && [v6 numberOfSections] - 1 == a4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v7 = NSString;
      uint64_t v8 = self;
      unint64_t v9 = [(WDStoredDataByCategoryViewController *)v8 source];
LABEL_7:
      id v10 = v9;
      char v11 = [v9 description];
      [v7 stringWithFormat:@"INTERNAL ONLY: %@, %@, isBluetoothDevice:%d", v8, v11, -[WDStoredDataByCategoryViewController isBluetoothDevice](v8, "isBluetoothDevice")];
      goto LABEL_12;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v7 = NSString;
      uint64_t v8 = self;
      unint64_t v9 = [(WDStoredDataByCategoryViewController *)v8 device];
      goto LABEL_7;
    }
  }
  int64_t v12 = 0;
  if ([(WDStoredDataByCategoryViewController *)self isBluetoothDevice] && !a4)
  {
    if (!self->_deviceFound)
    {
      id v10 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
      int64_t v12 = [v10 localizedStringForKey:@"DEVICE_NOT_PAIRED" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
      goto LABEL_14;
    }
    id v13 = NSString;
    id v10 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
    char v11 = [v10 localizedStringForKey:@"ALLOW_DEVICE_DATA_UPDATES" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
    uint64_t v8 = [(WDStoredDataByCategoryViewController *)self title];
    objc_msgSend(v13, "stringWithFormat:", v11, v8, v15, v16);
    int64_t v12 = LABEL_12:;

LABEL_14:
  }

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  unint64_t v7 = [v12 cellForRowAtIndexPath:v6];
  uint64_t v8 = [v7 reuseIdentifier];
  int v9 = [v8 isEqualToString:@"WDStoredDataByCategoryTableViewCell"];

  if (v9)
  {
    [(WDStoredDataByCategoryViewController *)self selectSourceStoredDataTableViewCell:v7];
  }
  else
  {
    id v10 = [v7 reuseIdentifier];
    int v11 = [v10 isEqualToString:@"WDStoredDataByCategoryTableViewDeleteAllCell"];

    if (v11)
    {
      [(WDStoredDataByCategoryViewController *)self presentDeleteConfirmation];
      [v12 deselectRowAtIndexPath:v6 animated:1];
    }
  }
}

- (void)selectSourceStoredDataTableViewCell:(id)a3
{
  uint64_t v4 = [a3 displayType];
  id v6 = [(WDStoredDataByCategoryViewController *)self _makeDataListViewControllerForDisplayType:v4];

  id v5 = [(WDStoredDataByCategoryViewController *)self navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (id)_makeDataListViewControllerForDisplayType:(id)a3
{
  id v4 = a3;
  id v5 = [(WDProfile *)self->_profile healthStore];
  id v6 = [(WDStoredDataByCategoryViewController *)self storedDataPredicate];
  unint64_t v7 = +[HBXHealthAppPluginFactory makeDataListViewControllerForHealthStore:v5 displayType:v4 predicate:v6];

  if (v7)
  {
    uint64_t v8 = v7;
  }
  else
  {
    int v9 = [(WDStoredDataByCategoryViewController *)self profile];
    id v10 = [(WDStoredDataByCategoryViewController *)self profile];
    int v11 = [v10 unitController];
    id v12 = [v4 presentation];
    id v13 = objc_msgSend(v4, "wd_listViewControllerDataProviderWithProfile:unitController:isHierarchical:", v9, v11, objc_msgSend(v12, "showAppDataHierarchically"));

    id v14 = [(WDStoredDataByCategoryViewController *)self storedDataPredicate];
    [v13 setDefaultQueryPredicate:v14];

    if ([v4 displayTypeIdentifier] == 298 || objc_msgSend(v4, "displayTypeIdentifier") == 304) {
      [v13 setShouldDisplayAllSamples:1];
    }
    uint64_t v15 = [WDDataListViewController alloc];
    uint64_t v16 = [(WDStoredDataByCategoryViewController *)self profile];
    uint64_t v8 = [(WDDataListViewController *)v15 initWithDisplayType:v4 profile:v16 dataProvider:v13 usingInsetStyling:1];
  }

  return v8;
}

- (WDProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (void)setBodyFont:(id)a3
{
}

- (NSArray)capturedSampleTypes
{
  return self->_capturedSampleTypes;
}

- (void)setCapturedSampleTypes:(id)a3
{
}

- (BOOL)isBluetoothDevice
{
  return self->_isBluetoothDevice;
}

- (void)setIsBluetoothDevice:(BOOL)a3
{
  self->_isBluetoothDevice = a3;
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSArray)savedCategories
{
  return (NSArray *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setSavedCategories:(id)a3
{
}

- (BOOL)queryReturned
{
  return self->_queryReturned;
}

- (void)setQueryReturned:(BOOL)a3
{
  self->_queryReturned = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedCategories, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_capturedSampleTypes, 0);
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_profile, 0);

  objc_storeStrong((id *)&self->_healthServicesManager, 0);
}

- (NSPredicate)storedDataPredicate
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4();
  id v2 = objc_alloc_init(MEMORY[0x263F08A98]);

  return (NSPredicate *)v2;
}

- (NSString)storedDataDisplayName
{
  return (NSString *)&stru_26D2EA890;
}

- (BOOL)shouldShowDeleteAllDataButton
{
  return 0;
}

- (void)deleteAllStoredData
{
  OUTLINED_FUNCTION_1_0();

  NSRequestConcreteImplementation();
}

void __51__WDStoredDataByCategoryViewController_viewDidLoad__block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_2210D2000, a2, OS_LOG_TYPE_ERROR, "_HKSampleTypeQuery failed with error: %@", (uint8_t *)&v3, 0xCu);
}

void __71__WDStoredDataByCategoryViewController_fetchEnabledStatusForPeripheral__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2210D2000, a2, OS_LOG_TYPE_ERROR, "fetchEnabledStatusForPeripheral getEnabledStatusForPeripheral failed: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __69__WDStoredDataByCategoryViewController_switchCellValueChanged_value___block_invoke_cold_1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  id v6 = [a2 deviceIdentifier];
  uint64_t v7 = [a2 title];
  uint64_t v8 = (void *)v7;
  int v9 = *(unsigned __int8 *)(a3 + 40);
  int v11 = 138543874;
  id v12 = v6;
  if (v9) {
    id v10 = @"ON";
  }
  else {
    id v10 = @"OFF";
  }
  __int16 v13 = 2114;
  uint64_t v14 = v7;
  __int16 v15 = 2114;
  uint64_t v16 = v10;
  _os_log_error_impl(&dword_2210D2000, v5, OS_LOG_TYPE_ERROR, "Could not set the enabled status of device %{public}@, '%{public}@', to %{public}@", (uint8_t *)&v11, 0x20u);
}

@end