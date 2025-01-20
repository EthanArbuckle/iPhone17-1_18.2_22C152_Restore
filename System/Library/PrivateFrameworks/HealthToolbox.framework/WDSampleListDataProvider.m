@interface WDSampleListDataProvider
- (BOOL)_handleObjectsRemoved:(id)a3;
- (BOOL)canEditRowAtIndexPath:(id)a3;
- (BOOL)hasCompleteDataSet;
- (BOOL)hasDetailViewController;
- (BOOL)shareDocumentUsingSample:(id)a3;
- (BOOL)textAdjustsFontSizeToFitWidth;
- (HKDisplayType)displayType;
- (HKHealthStore)healthStore;
- (HKSortedSampleArray)samples;
- (NSPredicate)defaultQueryPredicate;
- (NSString)profileName;
- (WDProfile)profile;
- (WDSampleListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4;
- (double)customCellHeight;
- (double)customEstimatedCellHeight;
- (id)_UUIDsForSamplesWithEndDate:(id)a3;
- (id)_defaultPredicateWithPredicateForType:(id)a3;
- (id)_pagingContextForSampleType:(id)a3;
- (id)_samplesSortDescriptor;
- (id)accessViewControllerForSample:(id)a3 healthStore:(id)a4;
- (id)createDataFetcherForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7;
- (id)createQueryForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7;
- (id)customCellForObject:(id)a3 indexPath:(id)a4 tableView:(id)a5;
- (id)defaultPredicateForSampleType:(id)a3;
- (id)displayTypeController;
- (id)objectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4;
- (id)predicateForType:(id)a3;
- (id)queryDateForSelectedDate:(id)a3;
- (id)sampleTypes;
- (id)secondaryTextForObject:(id)a3;
- (id)textForObject:(id)a3;
- (id)titleForSection:(unint64_t)a3;
- (id)unitController;
- (id)viewControllerForItemAtIndexPath:(id)a3;
- (id)viewControllerForSampleType:(id)a3 subSamplePredicate:(id)a4 title:(id)a5;
- (int64_t)cellStyle;
- (unint64_t)numberOfObjectsForSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (void)_callUpdateHandler;
- (void)_handleQueryResultsForSampleType:(id)a3 results:(id)a4;
- (void)_requestNextPageOfData;
- (void)_requestNextPageOfDataForSampleType:(id)a3;
- (void)_resetAllData;
- (void)_stopAllQueries;
- (void)deleteAllData;
- (void)deleteObjectsAtIndexPath:(id)a3 healthStore:(id)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)refineSamplesWithCompletion:(id)a3;
- (void)removeObjectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4 sectionRemoved:(BOOL *)a5;
- (void)setDefaultQueryPredicate:(id)a3;
- (void)setHasDetailViewController:(BOOL)a3;
- (void)setProfileName:(id)a3;
- (void)startCollectingDataWithUpdateHandler:(id)a3;
- (void)stopCollectingData;
- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7;
- (void)viewControllerWantsDataIncludingDate:(id)a3;
@end

@implementation WDSampleListDataProvider

- (WDSampleListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WDSampleListDataProvider;
  v9 = [(WDSampleListDataProvider *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayType, a3);
    objc_storeWeak((id *)&v10->_profile, v8);
    v11 = (HKSortedSampleArray *)objc_alloc_init(MEMORY[0x263F0A798]);
    samples = v10->_samples;
    v10->_samples = v11;

    v13 = v10->_samples;
    v14 = [(WDSampleListDataProvider *)v10 _samplesSortDescriptor];
    [(HKSortedSampleArray *)v13 setSortDescriptor:v14];

    v10->_didFetchInitialData = 0;
  }

  return v10;
}

- (id)sampleTypes
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)predicateForType:(id)a3
{
  return 0;
}

- (id)_samplesSortDescriptor
{
  return (id)[MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F09F80] ascending:0];
}

- (id)_defaultPredicateWithPredicateForType:(id)a3
{
  v4 = [(WDSampleListDataProvider *)self predicateForType:a3];
  v5 = [(WDSampleListDataProvider *)self defaultQueryPredicate];
  v6 = WDPredicateMatchingPredicates(v4, v5);

  return v6;
}

- (void)setDefaultQueryPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_defaultQueryPredicate, a3);
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x263F0A6D8]);
  id v7 = (void *)MEMORY[0x263EFFA08];
  id v11 = [(HKDisplayType *)self->_displayType sampleType];
  id v8 = [v7 setWithObject:v11];
  v9 = (HKSampleListDataProviderFilter *)[v6 initWithPredicate:v5 dataTypes:v8];
  defaultQueryPredicateFilter = self->_defaultQueryPredicateFilter;
  self->_defaultQueryPredicateFilter = v9;
}

- (BOOL)hasCompleteDataSet
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (![(NSDictionary *)self->_pagingContexts count]) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_pagingContexts;
  uint64_t v4 = [(NSDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = -[NSDictionary objectForKeyedSubscript:](self->_pagingContexts, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if ([v8 isFetchingData])
        {

LABEL_15:
          BOOL v10 = 0;
          goto LABEL_16;
        }
        char v9 = [v8 requiresPaging];

        if (v9) {
          goto LABEL_15;
        }
      }
      uint64_t v5 = [(NSDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      BOOL v10 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v10 = 1;
  }
LABEL_16:

  return v10;
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
  if ([(HKSortedSampleArray *)self->_samples count] < 1)
  {
    uint64_t v5 = &stru_26D2EA890;
  }
  else
  {
    uint64_t v4 = [(WDSampleListDataProvider *)self unitController];
    uint64_t v5 = [v4 localizedLongDisplayNameForDisplayType:self->_displayType];
  }

  return v5;
}

- (unint64_t)numberOfObjectsForSection:(unint64_t)a3
{
  return [(HKSortedSampleArray *)self->_samples count];
}

- (id)objectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4
{
  return (id)-[HKSortedSampleArray sampleAtIndex:](self->_samples, "sampleAtIndex:", a3, a4);
}

- (id)secondaryTextForObject:(id)a3
{
  v3 = [a3 endDate];
  uint64_t v4 = HKFormattedStringForDate();

  return v4;
}

- (BOOL)textAdjustsFontSizeToFitWidth
{
  return 1;
}

- (double)customCellHeight
{
  return 0.0;
}

- (double)customEstimatedCellHeight
{
  return 0.0;
}

- (void)startCollectingDataWithUpdateHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v5 = (void *)MEMORY[0x223C798A0]();
  id updateCallback = self->_updateCallback;
  self->_id updateCallback = v5;

  if (self->_didFetchInitialData) {
    v4[2](v4);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = [WeakRetained updateController];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v9 = [(WDSampleListDataProvider *)self sampleTypes];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [v8 addObserver:self forType:*(void *)(*((void *)&v14 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  [(WDSampleListDataProvider *)self _requestNextPageOfData];
}

- (void)stopCollectingData
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id updateCallback = self->_updateCallback;
  self->_id updateCallback = 0;

  [(WDSampleListDataProvider *)self _stopAllQueries];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(WDSampleListDataProvider *)self sampleTypes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        uint64_t v11 = [WeakRetained updateController];
        [v11 removeObserver:self forType:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_stopAllQueries
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(WDSampleListDataProvider *)self sampleTypes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [(WDSampleListDataProvider *)self _pagingContextForSampleType:*(void *)(*((void *)&v11 + 1) + 8 * v7)];
        uint64_t v9 = [v8 currentDataFetcher];

        if (v9)
        {
          uint64_t v10 = [v8 currentDataFetcher];
          [v10 stop];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_resetAllData
{
  [(WDSampleListDataProvider *)self _stopAllQueries];
  pagingContexts = self->_pagingContexts;
  self->_pagingContexts = 0;

  samples = self->_samples;

  [(HKSortedSampleArray *)samples removeAllSamples];
}

- (void)removeObjectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4 sectionRemoved:(BOOL *)a5
{
  *a5 = 0;
}

- (void)deleteAllData
{
}

- (BOOL)canEditRowAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 section];
  if (v5 >= [(WDSampleListDataProvider *)self numberOfSections])
  {
    BOOL v7 = 0;
  }
  else
  {
    unint64_t v6 = [v4 row];
    BOOL v7 = v6 < -[WDSampleListDataProvider numberOfObjectsForSection:](self, "numberOfObjectsForSection:", [v4 section]);
  }

  return v7;
}

- (void)deleteObjectsAtIndexPath:(id)a3 healthStore:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v12 row];
  uint64_t v14 = [v12 section];

  long long v15 = [(WDSampleListDataProvider *)self objectAtIndex:v13 forSection:v14];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __84__WDSampleListDataProvider_deleteObjectsAtIndexPath_healthStore_options_completion___block_invoke;
  v17[3] = &unk_26458E5C8;
  id v18 = v10;
  id v16 = v10;
  [v15 deleteObjectWithHealthStore:v11 options:a5 completion:v17];
}

uint64_t __84__WDSampleListDataProvider_deleteObjectsAtIndexPath_healthStore_options_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)viewControllerForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 row];
  uint64_t v6 = [v4 section];

  BOOL v7 = [(WDSampleListDataProvider *)self objectAtIndex:v5 forSection:v6];
  id v8 = objc_alloc(MEMORY[0x263F466C8]);
  uint64_t v9 = [(WDSampleListDataProvider *)self profileName];
  id v10 = (void *)[v8 initWithSample:v7 usingInsetStyling:1 profileName:v9 delegate:self];

  return v10;
}

- (HKHealthStore)healthStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v3 = [WeakRetained healthStore];

  return (HKHealthStore *)v3;
}

- (id)displayTypeController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v3 = [WeakRetained displayTypeController];

  return v3;
}

- (id)unitController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v3 = [WeakRetained unitController];

  return v3;
}

- (id)defaultPredicateForSampleType:(id)a3
{
  p_profile = &self->_profile;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  uint64_t v6 = [WeakRetained displayTypeController];

  BOOL v7 = [v6 displayTypeForObjectType:v4];

  id v8 = objc_loadWeakRetained((id *)p_profile);
  uint64_t v9 = [v8 unitController];
  id v10 = objc_msgSend(v7, "wd_listViewControllerDataProviderWithProfile:unitController:", v8, v9);

  id v11 = [v10 defaultQueryPredicate];

  return v11;
}

- (id)viewControllerForSampleType:(id)a3 subSamplePredicate:(id)a4 title:(id)a5
{
  p_profile = &self->_profile;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  id v12 = [WeakRetained displayTypeController];

  uint64_t v13 = [v12 displayTypeForObjectType:v10];

  id v14 = objc_loadWeakRetained((id *)p_profile);
  long long v15 = [v14 unitController];
  id v16 = objc_msgSend(v13, "wd_listViewControllerDataProviderWithProfile:unitController:isHierarchical:", v14, v15, 0);

  uint64_t v17 = [v16 defaultQueryPredicate];
  id v18 = HKUIPredicateMatchingPredicates();

  [v16 setDefaultQueryPredicate:v18];
  uint64_t v19 = [WDDataListViewController alloc];
  id v20 = objc_loadWeakRetained((id *)p_profile);
  v21 = [(WDDataListViewController *)v19 initWithDisplayType:v13 profile:v20 dataProvider:v16 usingInsetStyling:1];

  [(WDDataListViewController *)v21 setTitle:v8];

  return v21;
}

- (id)accessViewControllerForSample:(id)a3 healthStore:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = [[WDAppAccessListViewController alloc] initWithSample:v6 healthStore:v5];

  return v7;
}

- (BOOL)shareDocumentUsingSample:(id)a3
{
  return [a3 hasAssociatedReport];
}

- (void)viewControllerWantsDataIncludingDate:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(WDSampleListDataProvider *)self _resetAllData];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(WDSampleListDataProvider *)self sampleTypes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [(WDSampleListDataProvider *)self _pagingContextForSampleType:v10];
        if (v4)
        {
          id v12 = [(WDSampleListDataProvider *)self queryDateForSelectedDate:v4];
          [v11 setFetchUntilDate:v12];
        }
        if (!self->_updateCallback)
        {

          goto LABEL_13;
        }
        [(WDSampleListDataProvider *)self _requestNextPageOfDataForSampleType:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (id)queryDateForSelectedDate:(id)a3
{
  id v3 = a3;

  return v3;
}

- (void)_requestNextPageOfData
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(WDSampleListDataProvider *)self sampleTypes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(WDSampleListDataProvider *)self _requestNextPageOfDataForSampleType:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)_pagingContextForSampleType:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  pagingContexts = self->_pagingContexts;
  if (!pagingContexts)
  {
    uint64_t v6 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v7 = [(WDSampleListDataProvider *)self sampleTypes];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v13 = objc_alloc_init(_WDSampleListDataProviderPagingContext);
          [(_WDSampleListDataProviderPagingContext *)v13 setRequiresPaging:1];
          [(NSDictionary *)v6 setObject:v13 forKeyedSubscript:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    long long v14 = self->_pagingContexts;
    self->_pagingContexts = v6;

    pagingContexts = self->_pagingContexts;
  }
  long long v15 = [(NSDictionary *)pagingContexts objectForKeyedSubscript:v4];

  return v15;
}

- (id)createDataFetcherForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  return 0;
}

- (id)createQueryForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  long long v11 = (objc_class *)MEMORY[0x263F0A6E0];
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  long long v16 = (void *)[[v11 alloc] initWithSampleType:v15 predicate:v14 limit:a5 sortDescriptors:v13 resultsHandler:v12];

  return v16;
}

- (void)_requestNextPageOfDataForSampleType:(id)a3
{
  v28[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(WDSampleListDataProvider *)self _pagingContextForSampleType:v4];
  if (([v5 isFetchingData] & 1) != 0 || !objc_msgSend(v5, "requiresPaging")) {
    goto LABEL_11;
  }
  uint64_t v6 = [(WDSampleListDataProvider *)self _defaultPredicateWithPredicateForType:v4];
  uint64_t v7 = [v5 earliestProcessedSampleDate];
  if (v7)
  {
    uint64_t v8 = [(WDSampleListDataProvider *)self _UUIDsForSamplesWithEndDate:v7];
    uint64_t v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K <= %@", *MEMORY[0x263F09B88], v7];
    uint64_t v10 = [MEMORY[0x263F0A668] predicateForObjectsWithUUIDs:v8];
    uint64_t v11 = [MEMORY[0x263F08730] notPredicateWithSubpredicate:v10];

    id v12 = HKUIPredicateMatchingPredicates();

    uint64_t v13 = HKUIPredicateMatchingPredicates();

    uint64_t v6 = (void *)v11;
LABEL_7:

    uint64_t v6 = (void *)v13;
    goto LABEL_8;
  }
  id v14 = [v5 fetchUntilDate];

  if (v14)
  {
    uint64_t v8 = [v5 fetchUntilDate];
    id v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K >= %@", *MEMORY[0x263F09B88], v8];
    uint64_t v13 = HKUIPredicateMatchingPredicates();
    goto LABEL_7;
  }
LABEL_8:
  id v15 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F09F80] ascending:0];
  v28[0] = v15;
  long long v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __64__WDSampleListDataProvider__requestNextPageOfDataForSampleType___block_invoke;
  v26[3] = &unk_26458F140;
  v26[4] = self;
  id v17 = v4;
  id v27 = v17;
  long long v18 = (void *)MEMORY[0x223C798A0](v26);
  long long v19 = [(WDSampleListDataProvider *)self createDataFetcherForSampleType:v17 predicate:v6 limit:200 sortDescriptors:v16 resultsHandler:v18];
  if (!v19)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __64__WDSampleListDataProvider__requestNextPageOfDataForSampleType___block_invoke_302;
    v24[3] = &unk_26458F168;
    id v25 = v18;
    long long v20 = [(WDSampleListDataProvider *)self createQueryForSampleType:v17 predicate:v6 limit:200 sortDescriptors:v16 resultsHandler:v24];
    id v21 = objc_alloc(MEMORY[0x263F46930]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v23 = [WeakRetained healthStore];
    long long v19 = (void *)[v21 initWithHealthStore:v23 query:v20];
  }
  [v5 setFetchingData:1];
  [v5 setCurrentDataFetcher:v19];
  [v19 start];

LABEL_11:
}

void __64__WDSampleListDataProvider__requestNextPageOfDataForSampleType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__WDSampleListDataProvider__requestNextPageOfDataForSampleType___block_invoke_2;
  v10[3] = &unk_26458E068;
  uint64_t v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v6;
  id v12 = v7;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

uint64_t __64__WDSampleListDataProvider__requestNextPageOfDataForSampleType___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  if (*(void *)(a1 + 40))
  {
    _HKInitializeLogging();
    v2 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v4 = *(void *)(a1 + 48);
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      uint64_t v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      _os_log_error_impl(&dword_2210D2000, v2, OS_LOG_TYPE_ERROR, "%@: Error fetching samples of type (%@): %@", (uint8_t *)&v7, 0x20u);
    }
  }
  return [*(id *)(a1 + 32) _handleQueryResultsForSampleType:*(void *)(a1 + 48) results:*(void *)(a1 + 56)];
}

uint64_t __64__WDSampleListDataProvider__requestNextPageOfDataForSampleType___block_invoke_302(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleQueryResultsForSampleType:(id)a3 results:(id)a4
{
  id v14 = a4;
  samples = self->_samples;
  id v7 = a3;
  [(HKSortedSampleArray *)samples insertSamples:v14];
  uint64_t v8 = [v14 lastObject];
  __int16 v9 = [v8 endDate];

  uint64_t v10 = [(WDSampleListDataProvider *)self _pagingContextForSampleType:v7];

  [v10 setCurrentDataFetcher:0];
  [v10 setFetchingData:0];
  __int16 v11 = [v10 fetchUntilDate];
  if (v11) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = [v14 count] == 200;
  }
  [v10 setRequiresPaging:v12];

  [v10 setFetchUntilDate:0];
  if (v9)
  {
    [v10 setEarliestProcessedSampleDate:v9];
  }
  else
  {
    uint64_t v13 = [v10 earliestProcessedSampleDate];
    [v10 setEarliestProcessedSampleDate:v13];
  }
  [(WDSampleListDataProvider *)self _callUpdateHandler];
}

- (id)_UUIDsForSamplesWithEndDate:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [(HKSortedSampleArray *)self->_samples allSamples];
  id v7 = [v6 reverseObjectEnumerator];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = [v12 endDate];
        if (HKUIObjectIsLarger())
        {

          goto LABEL_13;
        }
        if ([v13 isEqualToDate:v4])
        {
          id v14 = [v12 UUID];
          [v5 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v5;
}

- (void)_callUpdateHandler
{
  id updateCallback = (void (**)(void))self->_updateCallback;
  if (updateCallback) {
    updateCallback[2]();
  }
}

- (void)refineSamplesWithCompletion:(id)a3
{
}

- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a5;
  BOOL v11 = [(WDSampleListDataProvider *)self _handleObjectsRemoved:a6];
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * v17);
        defaultQueryPredicateFilter = self->_defaultQueryPredicateFilter;
        if (!defaultQueryPredicateFilter
          || [(HKSampleListDataProviderFilter *)defaultQueryPredicateFilter acceptsDataObject:*(void *)(*((void *)&v21 + 1) + 8 * v17)])
        {
          [v12 addObject:v18];
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  if (((v11 | [(HKSortedSampleArray *)self->_samples insertSamples:v12]) & 1) != 0
    || v7)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __117__WDSampleListDataProvider_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError___block_invoke;
    v20[3] = &unk_26458F190;
    v20[4] = self;
    [(WDSampleListDataProvider *)self refineSamplesWithCompletion:v20];
  }
}

void __117__WDSampleListDataProvider_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __117__WDSampleListDataProvider_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError___block_invoke_2;
  block[3] = &unk_26458DB80;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __117__WDSampleListDataProvider_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError___block_invoke_2(void *a1)
{
  if (a1[4]) {
    objc_msgSend(*(id *)(a1[5] + 72), "removeSamplesWithUUIDs:");
  }
  if (a1[6]) {
    objc_msgSend(*(id *)(a1[5] + 72), "insertSamples:");
  }
  v2 = (void *)a1[5];

  return [v2 _callUpdateHandler];
}

- (BOOL)_handleObjectsRemoved:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "UUID", (void)v14);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char v12 = [(HKSortedSampleArray *)self->_samples removeSamplesWithUUIDs:v5];
  return v12;
}

- (NSPredicate)defaultQueryPredicate
{
  return self->_defaultQueryPredicate;
}

- (BOOL)hasDetailViewController
{
  return self->_hasDetailViewController;
}

- (void)setHasDetailViewController:(BOOL)a3
{
  self->_hasDetailViewController = a3;
}

- (NSString)profileName
{
  return self->_profileName;
}

- (void)setProfileName:(id)a3
{
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (WDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (WDProfile *)WeakRetained;
}

- (HKSortedSampleArray)samples
{
  return self->_samples;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samples, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_profileName, 0);
  objc_storeStrong((id *)&self->_defaultQueryPredicate, 0);
  objc_storeStrong(&self->_updateCallback, 0);
  objc_storeStrong((id *)&self->_defaultQueryPredicateFilter, 0);

  objc_storeStrong((id *)&self->_pagingContexts, 0);
}

- (id)textForObject:(id)a3
{
  return 0;
}

- (id)customCellForObject:(id)a3 indexPath:(id)a4 tableView:(id)a5
{
  return 0;
}

@end