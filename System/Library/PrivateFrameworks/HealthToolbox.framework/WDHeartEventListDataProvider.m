@interface WDHeartEventListDataProvider
- (double)customCellHeight;
- (double)customEstimatedCellHeight;
- (id)_heartEventType;
- (id)createQueryForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7;
- (id)customCellForObject:(id)a3 indexPath:(id)a4 tableView:(id)a5;
- (id)sampleTypes;
- (id)titleForSection:(unint64_t)a3;
- (int64_t)cellStyle;
@end

@implementation WDHeartEventListDataProvider

- (id)sampleTypes
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [(WDHeartEventListDataProvider *)self _heartEventType];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (int64_t)cellStyle
{
  return 2;
}

- (double)customCellHeight
{
  return *MEMORY[0x263F1D600];
}

- (double)customEstimatedCellHeight
{
  return *MEMORY[0x263F1D600];
}

- (id)customCellForObject:(id)a3 indexPath:(id)a4 tableView:(id)a5
{
  id v6 = a3;
  v7 = [a5 dequeueReusableCellWithIdentifier:@"CellIdentifier"];
  if (!v7) {
    v7 = [[WDDataTableViewCell alloc] initWithStyle:1 reuseIdentifier:@"CellIdentifier"];
  }
  [(WDDataTableViewCell *)v7 setAccessoryType:1];
  v8 = [v6 metadata];
  v9 = [v8 valueForKey:*MEMORY[0x263F0AB28]];
  if (v9)
  {
    [(WDDataTableViewCell *)v7 setDisplayValue:v9];
  }
  else
  {
    v10 = WDBundle();
    v11 = [v10 localizedStringForKey:@"HEART_RATE_NO_VALUE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    [(WDDataTableViewCell *)v7 setDisplayValue:v11];
  }
  v12 = [v6 endDate];
  v13 = HKFormattedStringForDate();
  [(WDDataTableViewCell *)v7 setDateString:v13];

  return v7;
}

- (id)titleForSection:(unint64_t)a3
{
  v3 = [(WDSampleListDataProvider *)self samples];
  if ([v3 count] < 1)
  {
    v5 = &stru_26D2EA890;
  }
  else
  {
    v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
    v5 = [v4 localizedStringForKey:@"LONG_BEATS_PER_MINUTE" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  }

  return v5;
}

- (id)createQueryForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  id v11 = a7;
  v12 = (objc_class *)MEMORY[0x263F0A6E0];
  id v13 = a6;
  id v14 = a4;
  id v15 = [v12 alloc];
  v16 = [(WDHeartEventListDataProvider *)self _heartEventType];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __104__WDHeartEventListDataProvider_createQueryForSampleType_predicate_limit_sortDescriptors_resultsHandler___block_invoke;
  v20[3] = &unk_26458E898;
  v20[4] = self;
  id v21 = v11;
  id v17 = v11;
  v18 = (void *)[v15 initWithSampleType:v16 predicate:v14 limit:a5 sortDescriptors:v13 resultsHandler:v20];

  return v18;
}

void __104__WDHeartEventListDataProvider_createQueryForSampleType_predicate_limit_sortDescriptors_resultsHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    v26 = v9;
    id v11 = dispatch_group_create();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v27 = v8;
    id obj = v8;
    uint64_t v12 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v30 = *(void *)v39;
      uint64_t v29 = *MEMORY[0x263F09E38];
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v39 != v30) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          dispatch_group_enter(v11);
          v16 = (void *)MEMORY[0x263F0A668];
          id v17 = [v15 startDate];
          v18 = [v15 endDate];
          v19 = [v16 predicateForSamplesWithStartDate:v17 endDate:v18 inclusiveEndDates:1 options:3];

          v20 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:v29];
          id v21 = objc_alloc(MEMORY[0x263F0A6E0]);
          v36[0] = MEMORY[0x263EF8330];
          v36[1] = 3221225472;
          v36[2] = __104__WDHeartEventListDataProvider_createQueryForSampleType_predicate_limit_sortDescriptors_resultsHandler___block_invoke_2;
          v36[3] = &unk_26458E1F8;
          v36[4] = *(void *)(a1 + 32);
          v36[5] = v15;
          v37 = v11;
          v22 = (void *)[v21 initWithSampleType:v20 predicate:v19 limit:0 sortDescriptors:0 resultsHandler:v36];
          v23 = [*(id *)(a1 + 32) profile];
          v24 = [v23 healthStore];
          [v24 executeQuery:v22];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v13);
    }

    v25 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __104__WDHeartEventListDataProvider_createQueryForSampleType_predicate_limit_sortDescriptors_resultsHandler___block_invoke_3;
    block[3] = &unk_26458E870;
    id v35 = *(id *)(a1 + 40);
    id v32 = v7;
    id v33 = obj;
    v10 = v26;
    id v34 = v26;
    dispatch_group_notify(v11, v25, block);

    id v8 = v27;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __104__WDHeartEventListDataProvider_createQueryForSampleType_predicate_limit_sortDescriptors_resultsHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (void *)MEMORY[0x263F46798];
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 displayTypeController];
  id v8 = [*(id *)(a1 + 32) unitController];
  id v14 = [v4 minMaxStringForHeartRates:v6 displayTypeController:v7 unitController:v8];

  if (v14)
  {
    id v9 = [*(id *)(a1 + 40) metadata];
    v10 = (void *)[v9 mutableCopy];
    id v11 = v10;
    if (v10) {
      id v12 = v10;
    }
    else {
      id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    uint64_t v13 = v12;

    [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x263F0AB28]];
    [*(id *)(a1 + 40) _setMetadata:v13];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __104__WDHeartEventListDataProvider_createQueryForSampleType_predicate_limit_sortDescriptors_resultsHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (id)_heartEventType
{
  return 0;
}

@end