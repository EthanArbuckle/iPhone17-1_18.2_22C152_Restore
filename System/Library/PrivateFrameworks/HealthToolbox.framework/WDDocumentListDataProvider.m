@interface WDDocumentListDataProvider
- (double)customCellHeight;
- (double)customEstimatedCellHeight;
- (id)createQueryForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7;
- (id)customCellForObject:(id)a3 indexPath:(id)a4 tableView:(id)a5;
- (id)sampleTypes;
- (id)titleForSection:(unint64_t)a3;
- (int64_t)cellStyle;
- (void)refineSamplesWithCompletion:(id)a3;
@end

@implementation WDDocumentListDataProvider

- (id)sampleTypes
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F0A598] documentTypeForIdentifier:*MEMORY[0x263F09520]];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
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
    v4 = WDBundle();
    v5 = [v4 localizedStringForKey:@"CCD_PROVIDER_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  }

  return v5;
}

- (int64_t)cellStyle
{
  return 2;
}

- (double)customCellHeight
{
  int IsLargerThanSizeCategory = HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory();
  double result = *MEMORY[0x263F1D600];
  if (!IsLargerThanSizeCategory) {
    return 114.0;
  }
  return result;
}

- (double)customEstimatedCellHeight
{
  return 114.0;
}

- (id)customCellForObject:(id)a3 indexPath:(id)a4 tableView:(id)a5
{
  id v6 = a3;
  v7 = [a5 dequeueReusableCellWithIdentifier:@"DocumentTableViewCell"];
  if (!v7) {
    v7 = (void *)[objc_alloc(MEMORY[0x263F463F8]) initWithStyle:0 reuseIdentifier:@"DocumentTableViewCell"];
  }
  [v7 setCellValuesForDocumentSample:v6];

  return v7;
}

- (id)createQueryForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__0;
  v27[4] = __Block_byref_object_dispose__0;
  id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __102__WDDocumentListDataProvider_createQueryForSampleType_predicate_limit_sortDescriptors_resultsHandler___block_invoke;
  v24 = &unk_26458E908;
  v26 = v27;
  id v15 = v14;
  id v25 = v15;
  v16 = (void *)MEMORY[0x223C798A0](&v21);
  id v17 = objc_alloc(MEMORY[0x263F0A330]);
  v18 = objc_msgSend(MEMORY[0x263F0A598], "documentTypeForIdentifier:", *MEMORY[0x263F09520], v21, v22, v23, v24);
  v19 = (void *)[v17 initWithDocumentType:v18 predicate:v12 limit:a5 sortDescriptors:v13 includeDocumentData:0 resultsHandler:v16];

  _Block_object_dispose(v27, 8);

  return v19;
}

void __102__WDDocumentListDataProvider_createQueryForSampleType_predicate_limit_sortDescriptors_resultsHandler___block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  id v12 = a2;
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    id v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_5;
  }
  if (a4)
  {
    id v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_5:
    v11();
    goto LABEL_7;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:v9];
LABEL_7:
}

- (void)refineSamplesWithCompletion:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = [(WDSampleListDataProvider *)self samples];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v12 = [v11 document];

        if (!v12)
        {
          id v13 = [v11 UUID];
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __58__WDDocumentListDataProvider_refineSamplesWithCompletion___block_invoke;
    v23[3] = &unk_26458E930;
    id v24 = v14;
    id v26 = v4;
    id v15 = v5;
    id v25 = v15;
    id v16 = v14;
    id v17 = (void *)MEMORY[0x223C798A0](v23);
    v18 = [MEMORY[0x263F0A668] predicateForObjectsWithUUIDs:v15];
    v19 = [MEMORY[0x263F0A338] documentTypeForIdentifier:*MEMORY[0x263F09520]];
    v20 = (void *)[objc_alloc(MEMORY[0x263F0A330]) initWithDocumentType:v19 predicate:v18 limit:0 sortDescriptors:0 includeDocumentData:0 resultsHandler:v17];
    uint64_t v21 = [(WDSampleListDataProvider *)self profile];
    uint64_t v22 = [v21 healthStore];
    [v22 executeQuery:v20];
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __58__WDDocumentListDataProvider_refineSamplesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (v10)
  {
    if ((a4 & 1) == 0)
    {
      [*(id *)(a1 + 32) addObjectsFromArray:v10];
      goto LABEL_9;
    }
    id v12 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    _HKInitializeLogging();
    id v13 = *MEMORY[0x263F098F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
      __58__WDDocumentListDataProvider_refineSamplesWithCompletion___block_invoke_cold_1((uint64_t)v11, v13);
    }
    id v12 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v12();
LABEL_9:
}

void __58__WDDocumentListDataProvider_refineSamplesWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2210D2000, a2, OS_LOG_TYPE_ERROR, "Unable to populate revised CDA document samples: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end