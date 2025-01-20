@interface WDDeviceSourcesListTableViewSection
- (NSArray)devices;
- (NSArray)list;
- (NSArray)sources;
- (NSMutableSet)identifiers;
- (id)_sourceCellForRow:(unint64_t)a3 tableView:(id)a4;
- (id)_sourceForRow:(int64_t)a3;
- (id)cellForRow:(unint64_t)a3 table:(id)a4;
- (id)noneString;
- (id)titleForFooter;
- (id)titleForHeader;
- (id)willSelectRow:(id)a3;
- (unint64_t)numberOfRows;
- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 cell:(id)a5 tableView:(id)a6 fetchError:(id)a7;
- (void)applicationWillEnterForeground;
- (void)dataSourceDidUpdate;
- (void)didSelectRow:(unint64_t)a3 representedByCell:(id)a4 withCompletion:(id)a5;
- (void)reloadDevices;
- (void)setDevices:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setList:(id)a3;
- (void)setSourceListDataSource:(id)a3;
- (void)setSources:(id)a3;
- (void)setSources:(id)a3 devices:(id)a4;
@end

@implementation WDDeviceSourcesListTableViewSection

- (void)setSourceListDataSource:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDDeviceSourcesListTableViewSection;
  [(WDSourcesListTableViewSection *)&v4 setSourceListDataSource:a3];
  [(WDDeviceSourcesListTableViewSection *)self reloadDevices];
}

- (void)dataSourceDidUpdate
{
  v3 = [(WDSourcesListTableViewSection *)self dataSource];
  objc_super v4 = [v3 sources];
  v5 = [v4 orderedDeviceSources];
  [(WDDeviceSourcesListTableViewSection *)self setSources:v5 devices:self->_devices];

  [(WDDeviceSourcesListTableViewSection *)self reloadDevices];
}

- (void)reloadDevices
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__2;
  v12[4] = __Block_byref_object_dispose__2;
  id v13 = [MEMORY[0x263EFF9C0] set];
  objc_initWeak(&location, self);
  v3 = [(WDSourcesListTableViewSection *)self dataSource];
  objc_super v4 = [v3 healthStore];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke;
  v6[3] = &unk_26458F0E0;
  v9 = v12;
  id v5 = v4;
  id v7 = v5;
  objc_copyWeak(&v10, &location);
  v8 = self;
  [v5 healthPeripheralsWithCustomProperties:&unk_26D2FD608 withCompletion:v6];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  _Block_object_dispose(v12, 8);
}

void __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v19 = v5;
  id v20 = a3;
  if (v20)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke_cold_1((uint64_t)v20, v6);
    }
  }
  else if (v5 && objc_msgSend(v5, "count", v5, 0))
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v27;
      id v10 = (os_log_t *)MEMORY[0x263F09968];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          v14 = [v12 identifier];
          v15 = [v14 UUIDString];
          [v13 addObject:v15];

          _HKInitializeLogging();
          v16 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v12;
            _os_log_impl(&dword_2210D2000, v16, OS_LOG_TYPE_INFO, "Bluetooth devices retrieved: %@", buf, 0xCu);
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v8);
    }
  }
  else
  {
    _HKInitializeLogging();
    v17 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = 0;
      _os_log_impl(&dword_2210D2000, v17, OS_LOG_TYPE_DEFAULT, "Bluetooth devices not returned, %{public}@", buf, 0xCu);
    }
  }
  v18 = *(void **)(a1 + 32);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke_309;
  v21[3] = &unk_26458F0E0;
  uint64_t v24 = *(void *)(a1 + 48);
  id v22 = v18;
  objc_copyWeak(&v25, (id *)(a1 + 56));
  uint64_t v23 = *(void *)(a1 + 40);
  [v22 healthPeripheralsWithFilter:1 handler:v21];
  objc_destroyWeak(&v25);
}

void __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke_309(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (![v11 type])
          {
            v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            id v13 = [v11 identifier];
            v14 = [v13 UUIDString];
            [v12 addObject:v14];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }
  }
  else
  {
    _HKInitializeLogging();
    v15 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke_309_cold_1((uint64_t)v6, v15);
    }
  }
  v16 = (void *)[objc_alloc(MEMORY[0x263F0A300]) initWithHealthStore:*(void *)(a1 + 32)];
  uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke_311;
  v19[3] = &unk_26458F0B8;
  objc_copyWeak(&v20, (id *)(a1 + 56));
  uint64_t v18 = *MEMORY[0x263F094F8];
  v19[4] = *(void *)(a1 + 40);
  [v16 fetchGymkitAndBluetoothDevicesMatchingValues:v17 forProperty:v18 completion:v19];
  objc_destroyWeak(&v20);
}

void __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke_311(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke_2;
  block[3] = &unk_26458F090;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  block[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v7);
}

void __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 56);
  id v4 = [v2 allObjects];
  [WeakRetained setSources:v3 devices:v4];
}

- (void)setSources:(id)a3 devices:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_sources, a3);
  objc_storeStrong((id *)&self->_devices, a4);
  uint64_t v9 = [MEMORY[0x263EFF9C0] set];
  [(WDDeviceSourcesListTableViewSection *)self setIdentifiers:v9];

  id v10 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count") + objc_msgSend(v7, "count"));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v42 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v17 = [v16 source];
        char v18 = [v17 _isConnectedGymSource];

        if ((v18 & 1) == 0)
        {
          v19 = [[WDSource alloc] initWithSource:v16 device:0];
          [(NSArray *)v10 addObject:v19];

          identifiers = self->_identifiers;
          long long v21 = [v16 source];
          long long v22 = [v21 bundleIdentifier];
          [(NSMutableSet *)identifiers addObject:v22];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v13);
  }
  v36 = v11;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v23 = v8;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(v23);
        }
        long long v28 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        long long v29 = [MEMORY[0x263F0A2D8] localDevice];
        char v30 = [v28 isEqual:v29];

        if ((v30 & 1) == 0
          && (![v28 _isAppleManufacturer]
           || ![v28 _isAppleModel]
           || ([v28 _isAppleHardwareVersion] & 1) == 0))
        {
          v31 = self->_identifiers;
          v32 = [v28 localIdentifier];
          LOBYTE(v31) = [(NSMutableSet *)v31 containsObject:v32];

          if ((v31 & 1) == 0)
          {
            uint64_t v33 = [[WDSource alloc] initWithSource:0 device:v28];
            [(NSArray *)v10 addObject:v33];
          }
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v25);
  }

  [(NSArray *)v10 sortUsingComparator:&__block_literal_global_14];
  list = self->_list;
  self->_list = v10;

  v35 = [(WDTableViewSection *)self delegate];
  [v35 reloadTable];
}

uint64_t __58__WDDeviceSourcesListTableViewSection_setSources_devices___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (id)_sourceForRow:(int64_t)a3
{
  return [(NSArray *)self->_list objectAtIndexedSubscript:a3];
}

- (void)applicationWillEnterForeground
{
  [(WDDeviceSourcesListTableViewSection *)self reloadDevices];
  v3.receiver = self;
  v3.super_class = (Class)WDDeviceSourcesListTableViewSection;
  [(WDTableViewSection *)&v3 applicationWillEnterForeground];
}

- (unint64_t)numberOfRows
{
  unint64_t result = [(NSArray *)self->_list count];
  if (result <= 1) {
    return 1;
  }
  return result;
}

- (id)titleForHeader
{
  v2 = WDBundle();
  objc_super v3 = [v2 localizedStringForKey:@"DEVICES_LIST_HEADER" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

  return v3;
}

- (id)titleForFooter
{
  return 0;
}

- (id)noneString
{
  v2 = WDBundle();
  objc_super v3 = [v2 localizedStringForKey:@"DEVICES_NONE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

  return v3;
}

- (id)cellForRow:(unint64_t)a3 table:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(WDDeviceSourcesListTableViewSection *)self identifiers];

  if (v7)
  {
    if ([(NSArray *)self->_list count]) {
      [(WDDeviceSourcesListTableViewSection *)self _sourceCellForRow:a3 tableView:v6];
    }
    else {
    uint64_t v9 = [(WDSourcesListTableViewSection *)self noneCellForTableView:v6];
    }
  }
  else
  {
    id v8 = +[WDSpinnerTableViewCell defaultReuseIdentifier];
    uint64_t v9 = [v6 dequeueReusableCellWithIdentifier:v8];
  }

  return v9;
}

- (id)_sourceCellForRow:(unint64_t)a3 tableView:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [v6 dequeueReusableCellWithIdentifier:@"WDSourcesListTableViewSectionSource"];
  if (!v7)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"WDSourcesListTableViewSectionSource"];
    [v7 setAccessoryType:1];
  }
  id v8 = [(WDDeviceSourcesListTableViewSection *)self _sourceForRow:a3];
  uint64_t v9 = [v8 name];
  id v10 = [v7 textLabel];
  [v10 setText:v9];

  id v11 = objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:", *MEMORY[0x263F1D260]);
  uint64_t v12 = [v7 textLabel];
  [v12 setFont:v11];

  uint64_t v13 = [v8 device];

  if (v13)
  {
    uint64_t v14 = [MEMORY[0x263F463C8] sharedImageManager];
    v15 = [v8 device];
    v16 = [v14 iconForDevice:v15];
    uint64_t v17 = [v7 imageView];
    [v17 setImage:v16];
  }
  else
  {
    char v18 = [v8 sourceModel];
    v19 = [v18 icon];

    id v20 = [v8 sourceModel];
    long long v21 = v20;
    if (v19)
    {
      long long v22 = [v20 icon];
      id v23 = [v7 imageView];
      [v23 setImage:v22];
    }
    else
    {
      uint64_t v24 = [v20 source];

      objc_initWeak(&location, self);
      uint64_t v25 = [MEMORY[0x263F463C8] sharedImageManager];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __67__WDDeviceSourcesListTableViewSection__sourceCellForRow_tableView___block_invoke;
      v34[3] = &unk_26458DBD0;
      id v26 = v7;
      id v35 = v26;
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __67__WDDeviceSourcesListTableViewSection__sourceCellForRow_tableView___block_invoke_2;
      v29[3] = &unk_26458DC20;
      objc_copyWeak(&v33, &location);
      id v27 = v24;
      id v30 = v27;
      id v31 = v26;
      id v32 = v6;
      [v25 loadIconForSource:v27 syncHandler:v34 asyncHandler:v29];

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
  }

  return v7;
}

void __67__WDDeviceSourcesListTableViewSection__sourceCellForRow_tableView___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 imageView];
  [v4 setImage:v3];
}

void __67__WDDeviceSourcesListTableViewSection__sourceCellForRow_tableView___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__WDDeviceSourcesListTableViewSection__sourceCellForRow_tableView___block_invoke_3;
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

void __67__WDDeviceSourcesListTableViewSection__sourceCellForRow_tableView___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained _handleReturnedImage:*(void *)(a1 + 32) forSource:*(void *)(a1 + 40) cell:*(void *)(a1 + 48) tableView:*(void *)(a1 + 56) fetchError:*(void *)(a1 + 64)];
}

- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 cell:(id)a5 tableView:(id)a6 fetchError:(id)a7
{
  id v19 = a3;
  id v12 = a5;
  if (v19 && !a7)
  {
    id v13 = a4;
    id v14 = [a6 indexPathForCell:v12];
    id v15 = -[WDDeviceSourcesListTableViewSection _sourceForRow:](self, "_sourceForRow:", [v14 row]);
    v16 = [v15 sourceModel];
    uint64_t v17 = [v16 source];

    LODWORD(v15) = [v17 isEqual:v13];
    if (v15)
    {
      char v18 = [v12 imageView];
      [v18 setImage:v19];
    }
  }
}

- (id)willSelectRow:(id)a3
{
  id v3 = a3;

  return v3;
}

- (void)didSelectRow:(unint64_t)a3 representedByCell:(id)a4 withCompletion:(id)a5
{
  long long v37 = (void (**)(id, uint64_t, uint64_t))a5;
  id v7 = [(WDDeviceSourcesListTableViewSection *)self list];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    v37[2](v37, 1, 1);
    goto LABEL_28;
  }
  uint64_t v9 = [(WDDeviceSourcesListTableViewSection *)self _sourceForRow:a3];
  id v10 = [v9 sourceModel];
  id v11 = [v10 source];

  if (!v11)
  {
    id v13 = [v9 device];
    id v14 = v13;
    if (v13 && [v13 _isConnectedGymDevice])
    {
      id v15 = [(HKTableViewController *)[WDDeviceStoredDataViewController alloc] initWithUsingInsetStyling:1];
      [(WDDeviceStoredDataViewController *)v15 setDevice:v14];
      v16 = [v14 _connectedGymDeviceFullName];
      [(WDDeviceStoredDataViewController *)v15 setDisplayName:v16];

      uint64_t v17 = [(WDTableViewSection *)self delegate];
      char v18 = [v17 profile];
      [(WDStoredDataByCategoryViewController *)v15 setProfile:v18];

      id v19 = [(WDTableViewSection *)self delegate];
      [v19 pushViewController:v15];
    }
    else
    {
      id v15 = [(HKTableViewController *)[WDDeviceStoredDataViewController alloc] initWithUsingInsetStyling:1];
      [(WDDeviceStoredDataViewController *)v15 setDevice:v14];
      long long v22 = [v14 name];
      if (v22)
      {
        [(WDDeviceStoredDataViewController *)v15 setDisplayName:v22];
      }
      else
      {
        long long v28 = [v14 model];
        if (v28)
        {
          [(WDDeviceStoredDataViewController *)v15 setDisplayName:v28];
        }
        else
        {
          uint64_t v29 = [v14 manufacturer];
          id v30 = (void *)v29;
          if (v29) {
            id v31 = (__CFString *)v29;
          }
          else {
            id v31 = &stru_26D2EA890;
          }
          [(WDDeviceStoredDataViewController *)v15 setDisplayName:v31];
        }
      }

      id v32 = [(WDTableViewSection *)self delegate];
      id v33 = [v32 profile];
      [(WDStoredDataByCategoryViewController *)v15 setProfile:v33];

      id v34 = objc_alloc(MEMORY[0x263F08C38]);
      id v35 = [v14 localIdentifier];
      id v19 = (void *)[v34 initWithUUIDString:v35];

      if (v19) {
        [(WDStoredDataByCategoryViewController *)v15 setIsBluetoothDevice:1];
      }
      [(WDStoredDataByCategoryViewController *)v15 setDeviceIdentifier:v19];
      v36 = [(WDTableViewSection *)self delegate];
      [v36 pushViewController:v15];
    }
    goto LABEL_27;
  }
  if ([v11 _isAppleWatch])
  {
    id v12 = WDWatchStoredDataViewController;
  }
  else
  {
    if (![v11 _hasFirstPartyBundleID])
    {
      id v23 = objc_alloc(MEMORY[0x263F469C0]);
      id v20 = [(WDTableViewSection *)self delegate];
      long long v21 = [v20 profile];
      uint64_t v24 = [v21 healthStore];
      uint64_t v25 = [(WDTableViewSection *)self delegate];
      id v26 = [v25 profile];
      id v27 = [v26 displayTypeController];
      id v14 = (void *)[v23 initWithHealthStore:v24 displayTypeController:v27 source:v11 useInsetStyling:1];

      goto LABEL_15;
    }
    id v12 = WDLocalDeviceStoredDataViewController;
  }
  id v14 = (void *)[[v12 alloc] initWithUsingInsetStyling:1];
  [v14 setSource:v11];
  id v20 = [(WDTableViewSection *)self delegate];
  long long v21 = [v20 profile];
  [v14 setProfile:v21];
LABEL_15:

  id v15 = [(WDTableViewSection *)self delegate];
  [(WDDeviceStoredDataViewController *)v15 pushViewController:v14];
LABEL_27:

  v37[2](v37, 1, 0);
LABEL_28:
}

- (NSArray)list
{
  return self->_list;
}

- (void)setList:(id)a3
{
}

- (NSArray)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (NSMutableSet)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_sources, 0);

  objc_storeStrong((id *)&self->_list, 0);
}

void __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2210D2000, a2, OS_LOG_TYPE_ERROR, "Unable to retrieve Bluetooth devices, %{public}@", (uint8_t *)&v2, 0xCu);
}

void __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke_309_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2210D2000, a2, OS_LOG_TYPE_ERROR, "BTLE services not returned, %{public}@", (uint8_t *)&v2, 0xCu);
}

@end