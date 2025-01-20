@interface WDSampleListStatisticsDataProvider
- (BOOL)hasCompleteDataSet;
- (BOOL)hasDetailViewController;
- (BOOL)textAdjustsFontSizeToFitWidth;
- (HKDisplayType)displayType;
- (HKUnitPreferenceController)unitController;
- (NSMutableArray)activeDataQueries;
- (NSMutableArray)data;
- (NSMutableSet)activeQueryTypes;
- (NSPredicate)defaultQueryPredicate;
- (NSString)profileName;
- (WDProfile)profile;
- (WDSampleListStatisticsDataProvider)initWithDisplayType:(id)a3 profile:(id)a4;
- (double)customCellHeight;
- (double)customEstimatedCellHeight;
- (id)_predicateForTheLastMonth;
- (id)_statisticsAtIndexPath:(id)a3;
- (id)customCellForObject:(id)a3 indexPath:(id)a4 tableView:(id)a5;
- (id)objectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4;
- (id)sampleTypes;
- (id)secondaryTextForObject:(id)a3;
- (id)textForObject:(id)a3;
- (id)titleForSection:(unint64_t)a3;
- (id)viewControllerForItemAtIndexPath:(id)a3;
- (int64_t)cellStyle;
- (unint64_t)_statisticsOptionsForSampleType:(id)a3;
- (unint64_t)numberOfObjectsForSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (void)_handleResultsCollection:(id)a3 fromQuery:(id)a4 sampleType:(id)a5 areComplete:(BOOL)a6 withError:(id)a7 updateHandler:(id)a8;
- (void)_startCompleteDataStatisticsCollectionQueryForSampleType:(id)a3 updateHandler:(id)a4;
- (void)_startPartialDataStatisticsCollectionQueryForSampleType:(id)a3 updateHandler:(id)a4;
- (void)deleteAllData;
- (void)deleteObjectsAtIndexPath:(id)a3 healthStore:(id)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)removeObjectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4 sectionRemoved:(BOOL *)a5;
- (void)setActiveDataQueries:(id)a3;
- (void)setActiveQueryTypes:(id)a3;
- (void)setData:(id)a3;
- (void)setDefaultQueryPredicate:(id)a3;
- (void)setHasCompleteDataSet:(BOOL)a3;
- (void)setHasDetailViewController:(BOOL)a3;
- (void)setProfileName:(id)a3;
- (void)startCollectingDataWithUpdateHandler:(id)a3;
- (void)stopCollectingData;
@end

@implementation WDSampleListStatisticsDataProvider

- (WDSampleListStatisticsDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WDSampleListStatisticsDataProvider;
  v9 = [(WDSampleListStatisticsDataProvider *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayType, a3);
    uint64_t v11 = [v8 unitController];
    unitController = v10->_unitController;
    v10->_unitController = (HKUnitPreferenceController *)v11;

    uint64_t v13 = [MEMORY[0x263EFF980] array];
    activeDataQueries = v10->_activeDataQueries;
    v10->_activeDataQueries = (NSMutableArray *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9C0] set];
    activeQueryTypes = v10->_activeQueryTypes;
    v10->_activeQueryTypes = (NSMutableSet *)v15;

    objc_storeStrong((id *)&v10->_profile, a4);
    v10->_hasDetailViewController = 1;
  }

  return v10;
}

- (id)sampleTypes
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)_statisticsAtIndexPath:(id)a3
{
  data = self->_data;
  uint64_t v4 = [a3 row];

  return (id)[(NSMutableArray *)data objectAtIndexedSubscript:v4];
}

- (int64_t)cellStyle
{
  return 0;
}

- (unint64_t)numberOfSections
{
  return 1;
}

- (id)titleForSection:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_data count])
  {
    uint64_t v4 = [(HKUnitPreferenceController *)self->_unitController localizedLongDisplayNameForDisplayType:self->_displayType];
  }
  else
  {
    uint64_t v4 = &stru_26D2EA890;
  }

  return v4;
}

- (unint64_t)numberOfObjectsForSection:(unint64_t)a3
{
  return [(NSMutableArray *)self->_data count];
}

- (id)objectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_data, "objectAtIndexedSubscript:", a3, a4);
}

- (id)secondaryTextForObject:(id)a3
{
  id v3 = a3;
  uint64_t v4 = HKPriorYearsDateFormatterNoTime();
  v5 = [v3 startDate];

  v6 = [v4 stringFromDate:v5];

  return v6;
}

- (BOOL)textAdjustsFontSizeToFitWidth
{
  return 1;
}

- (void)_handleResultsCollection:(id)a3 fromQuery:(id)a4 sampleType:(id)a5 areComplete:(BOOL)a6 withError:(id)a7 updateHandler:(id)a8
{
  BOOL v10 = a6;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v17 = (void (**)(void))a8;
  if (!v16)
  {
    v20 = [a3 statistics];
    v21 = [v20 sortedArrayUsingComparator:&__block_literal_global_12];
    v22 = (void *)[v21 mutableCopy];

    if (v10)
    {
      [(WDSampleListStatisticsDataProvider *)self setData:v22];
      if (!v17) {
        goto LABEL_14;
      }
    }
    else
    {
      [v22 removeLastObject];
      [(WDSampleListStatisticsDataProvider *)self setData:v22];
      if (!v17 || ![v22 count]) {
        goto LABEL_14;
      }
    }
    v17[2](v17);
LABEL_14:

    goto LABEL_15;
  }
  int v18 = objc_msgSend(v16, "hk_isDatabaseAccessibilityError");
  _HKInitializeLogging();
  v19 = *MEMORY[0x263F09968];
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[WDSampleListStatisticsDataProvider _handleResultsCollection:fromQuery:sampleType:areComplete:withError:updateHandler:]();
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    -[WDSampleListStatisticsDataProvider _handleResultsCollection:fromQuery:sampleType:areComplete:withError:updateHandler:]();
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __120__WDSampleListStatisticsDataProvider__handleResultsCollection_fromQuery_sampleType_areComplete_withError_updateHandler___block_invoke;
  block[3] = &unk_26458DB80;
  block[4] = self;
  id v24 = v14;
  id v25 = v15;
  dispatch_async(MEMORY[0x263EF83A0], block);

LABEL_15:
}

void __120__WDSampleListStatisticsDataProvider__handleResultsCollection_fromQuery_sampleType_areComplete_withError_updateHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) activeDataQueries];
  [v2 removeObject:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) activeQueryTypes];
  [v3 removeObject:*(void *)(a1 + 48)];
}

uint64_t __120__WDSampleListStatisticsDataProvider__handleResultsCollection_fromQuery_sampleType_areComplete_withError_updateHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 startDate];
  v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)startCollectingDataWithUpdateHandler:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(WDSampleListStatisticsDataProvider *)self setHasCompleteDataSet:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = self->_activeDataQueries;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = [(WDSampleListStatisticsDataProvider *)self profile];
        v12 = [v11 healthStore];
        [v12 stopQuery:v10];
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v7);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v13 = [(WDSampleListStatisticsDataProvider *)self sampleTypes];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    v17 = (os_log_t *)MEMORY[0x263F09968];
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void *)(*((void *)&v21 + 1) + 8 * v18);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(WDSampleListStatisticsDataProvider *)self _startPartialDataStatisticsCollectionQueryForSampleType:v19 updateHandler:v4];
        }
        else
        {
          _HKInitializeLogging();
          v20 = *v17;
          if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v30 = self;
            __int16 v31 = 2114;
            uint64_t v32 = v19;
            _os_log_error_impl(&dword_2210D2000, v20, OS_LOG_TYPE_ERROR, "Data provider %{public}@ can only show hierarchical data on quantity types. Encountered type %{public}@. Skipping.", buf, 0x16u);
          }
        }
        ++v18;
      }
      while (v15 != v18);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v15);
  }
}

- (unint64_t)_statisticsOptionsForSampleType:(id)a3
{
  uint64_t v3 = [a3 aggregationStyle];
  unint64_t v4 = 12;
  if (v3 == 3) {
    unint64_t v4 = 66;
  }
  if (v3) {
    return v4;
  }
  else {
    return 16;
  }
}

- (void)stopCollectingData
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v3 = [(WDProfile *)self->_profile healthStore];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v4 = self->_activeDataQueries;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "stopQuery:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_activeDataQueries removeAllObjects];
  [(NSMutableSet *)self->_activeQueryTypes removeAllObjects];
}

- (void)removeObjectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4 sectionRemoved:(BOOL *)a5
{
  *a5 = 0;
}

- (void)deleteAllData
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  data = self->_data;
  self->_data = v3;

  MEMORY[0x270F9A758](v3, data);
}

- (void)deleteObjectsAtIndexPath:(id)a3 healthStore:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  char v7 = a5;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v25 = a4;
  id v24 = a6;
  long long v10 = -[NSMutableArray objectAtIndexedSubscript:](self->_data, "objectAtIndexedSubscript:", [a3 row]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(WDSampleListStatisticsDataProvider *)self sampleTypes];
  uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v15 = [(WDSampleListStatisticsDataProvider *)self defaultQueryPredicate];
        uint64_t v16 = (void *)MEMORY[0x263F0A668];
        v17 = [v10 startDate];
        uint64_t v18 = [v10 endDate];
        uint64_t v19 = [v16 predicateForSamplesWithStartDate:v17 endDate:v18 options:0];

        v20 = WDPredicateMatchingPredicates(v15, v19);

        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __94__WDSampleListStatisticsDataProvider_deleteObjectsAtIndexPath_healthStore_options_completion___block_invoke;
        v26[3] = &unk_26458EFC8;
        v26[4] = self;
        v26[5] = v14;
        id v27 = v20;
        id v28 = v24;
        id v21 = v20;
        [v25 deleteObjectsOfType:v14 predicate:v21 options:v7 & 2 withCompletion:v26];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v12);
  }
}

void __94__WDSampleListStatisticsDataProvider_deleteObjectsAtIndexPath_healthStore_options_completion___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if (v5)
  {
    _HKInitializeLogging();
    uint64_t v6 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __94__WDSampleListStatisticsDataProvider_deleteObjectsAtIndexPath_healthStore_options_completion___block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }
  }
  (*(void (**)(void))(a1[7] + 16))();
}

- (id)viewControllerForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(WDSampleListStatisticsDataProvider *)self displayType];
  profile = self->_profile;
  char v7 = [(WDProfile *)profile unitController];
  uint64_t v8 = objc_msgSend(v5, "wd_listViewControllerDataProviderWithProfile:unitController:isHierarchical:", profile, v7, 0);

  data = self->_data;
  uint64_t v10 = [v4 row];

  uint64_t v11 = [(NSMutableArray *)data objectAtIndexedSubscript:v10];
  uint64_t v12 = (void *)MEMORY[0x263F0A668];
  uint64_t v13 = [v11 startDate];
  uint64_t v14 = [v11 endDate];
  uint64_t v15 = [v12 predicateForSamplesWithStartDate:v13 endDate:v14 options:0];

  uint64_t v16 = [(WDSampleListStatisticsDataProvider *)self defaultQueryPredicate];
  v17 = HKUIPredicateMatchingPredicates();

  [v8 setDefaultQueryPredicate:v17];
  uint64_t v18 = [WDDataListViewController alloc];
  uint64_t v19 = [(WDSampleListStatisticsDataProvider *)self displayType];
  v20 = [(WDDataListViewController *)v18 initWithDisplayType:v19 profile:self->_profile dataProvider:v8 usingInsetStyling:1];

  return v20;
}

- (void)_startPartialDataStatisticsCollectionQueryForSampleType:(id)a3 updateHandler:(id)a4
{
  v37[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v8 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v8 setDay:1];
  uint64_t v9 = [(WDSampleListStatisticsDataProvider *)self defaultQueryPredicate];
  uint64_t v10 = (void *)v9;
  if (v9)
  {
    uint64_t v11 = (void *)MEMORY[0x263F08730];
    v37[0] = v9;
    uint64_t v12 = [(WDSampleListStatisticsDataProvider *)self _predicateForTheLastMonth];
    v37[1] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
    uint64_t v14 = [v11 andPredicateWithSubpredicates:v13];
  }
  else
  {
    uint64_t v14 = [(WDSampleListStatisticsDataProvider *)self _predicateForTheLastMonth];
  }
  id v15 = objc_alloc(MEMORY[0x263F0A7E0]);
  unint64_t v16 = [(WDSampleListStatisticsDataProvider *)self _statisticsOptionsForSampleType:v6];
  v17 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v18 = [MEMORY[0x263EFF910] date];
  uint64_t v19 = [v17 startOfDayForDate:v18];
  v20 = (void *)[v15 initWithQuantityType:v6 quantitySamplePredicate:v14 options:v16 anchorDate:v19 intervalComponents:v8];

  objc_initWeak(&location, self);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __108__WDSampleListStatisticsDataProvider__startPartialDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke;
  v32[3] = &unk_26458EFF0;
  objc_copyWeak(&v35, &location);
  id v21 = v6;
  id v33 = v21;
  id v22 = v7;
  id v34 = v22;
  [v20 setInitialResultsHandler:v32];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __108__WDSampleListStatisticsDataProvider__startPartialDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke_3;
  v28[3] = &unk_26458F018;
  objc_copyWeak(&v31, &location);
  id v23 = v21;
  id v29 = v23;
  id v24 = v22;
  id v30 = v24;
  [v20 setStatisticsUpdateHandler:v28];
  id v25 = [(WDSampleListStatisticsDataProvider *)self profile];
  long long v26 = [v25 healthStore];
  [v26 executeQuery:v20];

  id v27 = [(WDSampleListStatisticsDataProvider *)self activeDataQueries];
  [v27 addObject:v20];

  [(NSMutableSet *)self->_activeQueryTypes addObject:v23];
  objc_destroyWeak(&v31);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

void __108__WDSampleListStatisticsDataProvider__startPartialDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleResultsCollection:v8 fromQuery:v7 sampleType:*(void *)(a1 + 32) areComplete:0 withError:v9 updateHandler:*(void *)(a1 + 40)];

  id v11 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v12 = [v11 profile];
  uint64_t v13 = [v12 healthStore];
  [v13 stopQuery:v7];

  uint64_t v14 = [MEMORY[0x263F08A48] mainQueue];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __108__WDSampleListStatisticsDataProvider__startPartialDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke_2;
  v20 = &unk_26458DD60;
  objc_copyWeak(&v22, (id *)(a1 + 48));
  id v15 = v7;
  id v21 = v15;
  [v14 addOperationWithBlock:&v17];

  id v16 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v16, "_startCompleteDataStatisticsCollectionQueryForSampleType:updateHandler:", *(void *)(a1 + 32), *(void *)(a1 + 40), v17, v18, v19, v20);

  objc_destroyWeak(&v22);
}

void __108__WDSampleListStatisticsDataProvider__startPartialDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained activeDataQueries];
  [v2 removeObject:*(void *)(a1 + 32)];
}

void __108__WDSampleListStatisticsDataProvider__startPartialDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = (id *)(a1 + 48);
  id v9 = a5;
  id v10 = a4;
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  [WeakRetained _handleResultsCollection:v10 fromQuery:v11 sampleType:*(void *)(a1 + 32) areComplete:1 withError:v9 updateHandler:*(void *)(a1 + 40)];
}

- (void)_startCompleteDataStatisticsCollectionQueryForSampleType:(id)a3 updateHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v8 setDay:1];
  id v9 = objc_alloc(MEMORY[0x263F0A7E0]);
  id v10 = [(WDSampleListStatisticsDataProvider *)self defaultQueryPredicate];
  unint64_t v11 = [(WDSampleListStatisticsDataProvider *)self _statisticsOptionsForSampleType:v6];
  uint64_t v12 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v13 = [MEMORY[0x263EFF910] date];
  uint64_t v14 = [v12 startOfDayForDate:v13];
  id v15 = (void *)[v9 initWithQuantityType:v6 quantitySamplePredicate:v10 options:v11 anchorDate:v14 intervalComponents:v8];

  objc_initWeak(location, self);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __109__WDSampleListStatisticsDataProvider__startCompleteDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke;
  v30[3] = &unk_26458EFF0;
  objc_copyWeak(&v33, location);
  id v16 = v6;
  id v31 = v16;
  id v17 = v7;
  id v32 = v17;
  [v15 setInitialResultsHandler:v30];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __109__WDSampleListStatisticsDataProvider__startCompleteDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke_2;
  v26[3] = &unk_26458F018;
  objc_copyWeak(&v29, location);
  id v18 = v16;
  id v27 = v18;
  id v19 = v17;
  id v28 = v19;
  [v15 setStatisticsUpdateHandler:v26];
  v20 = [(WDSampleListStatisticsDataProvider *)self profile];
  id v21 = [v20 healthStore];
  [v21 executeQuery:v15];

  id v22 = [MEMORY[0x263F08A48] mainQueue];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __109__WDSampleListStatisticsDataProvider__startCompleteDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke_3;
  v24[3] = &unk_26458DB58;
  v24[4] = self;
  id v23 = v15;
  id v25 = v23;
  [v22 addOperationWithBlock:v24];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v33);
  objc_destroyWeak(location);
}

void __109__WDSampleListStatisticsDataProvider__startCompleteDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = (id *)(a1 + 48);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained setHasCompleteDataSet:1];

  id v12 = objc_loadWeakRetained(v7);
  [v12 _handleResultsCollection:v9 fromQuery:v10 sampleType:*(void *)(a1 + 32) areComplete:1 withError:v8 updateHandler:*(void *)(a1 + 40)];
}

void __109__WDSampleListStatisticsDataProvider__startCompleteDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = (id *)(a1 + 48);
  id v9 = a5;
  id v10 = a4;
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  [WeakRetained _handleResultsCollection:v10 fromQuery:v11 sampleType:*(void *)(a1 + 32) areComplete:1 withError:v9 updateHandler:*(void *)(a1 + 40)];
}

void __109__WDSampleListStatisticsDataProvider__startCompleteDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activeDataQueries];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (id)_predicateForTheLastMonth
{
  id v2 = [MEMORY[0x263EFF910] date];
  uint64_t v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v4 = [v3 dateByAddingUnit:8 value:-1 toDate:v2 options:1];

  id v5 = [MEMORY[0x263F0A668] predicateForSamplesWithStartDate:v4 endDate:v2 options:0];

  return v5;
}

- (NSPredicate)defaultQueryPredicate
{
  return self->defaultQueryPredicate;
}

- (void)setDefaultQueryPredicate:(id)a3
{
}

- (BOOL)hasDetailViewController
{
  return self->_hasDetailViewController;
}

- (void)setHasDetailViewController:(BOOL)a3
{
  self->_hasDetailViewController = a3;
}

- (BOOL)hasCompleteDataSet
{
  return self->_hasCompleteDataSet;
}

- (void)setHasCompleteDataSet:(BOOL)a3
{
  self->_hasCompleteDataSet = a3;
}

- (NSString)profileName
{
  return self->_profileName;
}

- (void)setProfileName:(id)a3
{
}

- (NSMutableArray)data
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setData:(id)a3
{
}

- (NSMutableArray)activeDataQueries
{
  return self->_activeDataQueries;
}

- (void)setActiveDataQueries:(id)a3
{
}

- (NSMutableSet)activeQueryTypes
{
  return self->_activeQueryTypes;
}

- (void)setActiveQueryTypes:(id)a3
{
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (WDProfile)profile
{
  return self->_profile;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_activeQueryTypes, 0);
  objc_storeStrong((id *)&self->_activeDataQueries, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_profileName, 0);

  objc_storeStrong((id *)&self->defaultQueryPredicate, 0);
}

- (id)textForObject:(id)a3
{
  return 0;
}

- (double)customCellHeight
{
  return 0.0;
}

- (double)customEstimatedCellHeight
{
  return 0.0;
}

- (id)customCellForObject:(id)a3 indexPath:(id)a4 tableView:(id)a5
{
  return 0;
}

- (void)_handleResultsCollection:fromQuery:sampleType:areComplete:withError:updateHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_2210D2000, v0, OS_LOG_TYPE_DEBUG, "Data provider %@ stats collection quey initial handler returned error: %@", v1, 0x16u);
}

- (void)_handleResultsCollection:fromQuery:sampleType:areComplete:withError:updateHandler:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_2210D2000, v0, OS_LOG_TYPE_ERROR, "Data provider %@ stats collection quey initial handler returned error: %@", v1, 0x16u);
}

void __94__WDSampleListStatisticsDataProvider_deleteObjectsAtIndexPath_healthStore_options_completion___block_invoke_cold_1(void *a1, uint64_t a2, os_log_t log)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  int v6 = 138544130;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = v4;
  __int16 v10 = 2114;
  uint64_t v11 = v5;
  __int16 v12 = 2114;
  uint64_t v13 = a2;
  _os_log_error_impl(&dword_2210D2000, log, OS_LOG_TYPE_ERROR, "%{public}@: Error deleting objects of type %{public}@ with predicate %{public}@: %{public}@", (uint8_t *)&v6, 0x2Au);
}

@end