@interface WDAppleStandHourStatisticsListDataProvider
- (WDAppleStandHourStatisticsListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4;
- (id)_samplesSortDescriptor;
- (id)objectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4;
- (id)predicateForType:(id)a3;
- (id)sampleTypes;
- (id)secondaryTextForObject:(id)a3;
- (id)textForObject:(id)a3;
- (id)titleForSection:(unint64_t)a3;
- (id)viewControllerForItemAtIndexPath:(id)a3;
- (int64_t)cellStyle;
- (unint64_t)numberOfObjectsForSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (void)_callUpdateHandler;
- (void)_removeSamplesInDateRange:(id)a3;
- (void)deleteAllData;
- (void)deleteObjectsAtIndexPath:(id)a3 healthStore:(id)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)removeObjectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4 sectionRemoved:(BOOL *)a5;
@end

@implementation WDAppleStandHourStatisticsListDataProvider

- (WDAppleStandHourStatisticsListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WDAppleStandHourStatisticsListDataProvider;
  v7 = [(WDSampleListDataProvider *)&v18 initWithDisplayType:a3 profile:v6];
  v8 = v7;
  if (v7)
  {
    v9 = [(WDSampleListDataProvider *)v7 displayType];
    v10 = [v6 unitController];
    v11 = [(WDSampleListDataProvider *)v8 displayType];
    v12 = [v10 unitForDisplayType:v11];
    uint64_t v13 = objc_msgSend(v9, "hk_valueFormatterForUnit:", v12);
    valueFormatter = v8->_valueFormatter;
    v8->_valueFormatter = (HKDisplayTypeValueFormatter *)v13;

    uint64_t v15 = HKDateFormatterFromTemplate();
    dateFormatter = v8->_dateFormatter;
    v8->_dateFormatter = (NSDateFormatter *)v15;
  }
  return v8;
}

- (void)_callUpdateHandler
{
  v3 = [(WDSampleListDataProvider *)self samples];
  v4 = [v3 allSamples];

  if ([v4 count])
  {
    v5 = [v4 firstObject];
    id v6 = [v5 startDate];

    v7 = [v4 lastObject];
    v8 = [v7 endDate];

    v9 = [MEMORY[0x263EFF8F0] currentCalendar];
    v10 = [v9 startOfDayForDate:v6];

    v11 = [MEMORY[0x263EFF8F0] currentCalendar];
    v12 = objc_msgSend(v11, "hk_startOfTomorrowForDate:", v8);

    id v13 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v13 setDay:1];
    v14 = (void *)MEMORY[0x263F0AA18];
    uint64_t v15 = [(WDSampleListDataProvider *)self samples];
    v16 = [v15 allSamples];
    v17 = HKCalendarDateTransformNone();
    objc_super v18 = [v14 calculateTotalDurationsWithTimePeriods:v16 startDate:v10 endDate:v12 intervalComponents:v13 startOfDayTransform:v17];
    v19 = (NSMutableDictionary *)[v18 mutableCopy];
    totalsByTimePeriod = self->_totalsByTimePeriod;
    self->_totalsByTimePeriod = v19;

    v21 = [(NSMutableDictionary *)self->_totalsByTimePeriod allKeys];
    v22 = (NSMutableArray *)[v21 mutableCopy];
    orderedTimePeriods = self->_orderedTimePeriods;
    self->_orderedTimePeriods = v22;

    [(NSMutableArray *)self->_orderedTimePeriods sortUsingComparator:&__block_literal_global_2];
  }
  else
  {
    v24 = self->_totalsByTimePeriod;
    self->_totalsByTimePeriod = 0;

    v10 = self->_orderedTimePeriods;
    self->_orderedTimePeriods = 0;
  }

  v25.receiver = self;
  v25.super_class = (Class)WDAppleStandHourStatisticsListDataProvider;
  [(WDSampleListDataProvider *)&v25 _callUpdateHandler];
}

uint64_t __64__WDAppleStandHourStatisticsListDataProvider__callUpdateHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 endDate];
  id v6 = [v4 endDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_samplesSortDescriptor
{
  return (id)[MEMORY[0x263F08B30] sortDescriptorWithKey:@"startDate" ascending:1];
}

- (id)sampleTypes
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [(WDSampleListDataProvider *)self displayType];
  v3 = [v2 sampleType];
  v6[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)predicateForType:(id)a3
{
  return (id)[MEMORY[0x263F0A668] predicateForCategorySamplesWithOperatorType:4 value:0];
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
  if ([(NSMutableArray *)self->_orderedTimePeriods count])
  {
    id v4 = [(WDSampleListDataProvider *)self unitController];
    v5 = [(WDSampleListDataProvider *)self displayType];
    id v6 = [v4 localizedDisplayNameForDisplayType:v5];
  }
  else
  {
    id v6 = &stru_26D2EA890;
  }

  return v6;
}

- (unint64_t)numberOfObjectsForSection:(unint64_t)a3
{
  return [(NSMutableArray *)self->_orderedTimePeriods count];
}

- (id)objectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_orderedTimePeriods, "objectAtIndexedSubscript:", a3, a4);
}

- (id)textForObject:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_totalsByTimePeriod objectForKeyedSubscript:a3];
  valueFormatter = self->_valueFormatter;
  id v6 = [(WDSampleListDataProvider *)self displayType];
  uint64_t v7 = [(WDSampleListDataProvider *)self unitController];
  v8 = [(HKDisplayTypeValueFormatter *)valueFormatter stringFromValue:v4 displayType:v6 unitController:v7];

  return v8;
}

- (id)secondaryTextForObject:(id)a3
{
  dateFormatter = self->_dateFormatter;
  id v4 = [a3 startDate];
  v5 = [(NSDateFormatter *)dateFormatter stringFromDate:v4];

  return v5;
}

- (void)removeObjectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4 sectionRemoved:(BOOL *)a5
{
  -[NSMutableArray objectAtIndexedSubscript:](self->_orderedTimePeriods, "objectAtIndexedSubscript:", a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)self->_orderedTimePeriods removeObjectAtIndex:a3];
  [(NSMutableDictionary *)self->_totalsByTimePeriod removeObjectForKey:v7];
  [(WDAppleStandHourStatisticsListDataProvider *)self _removeSamplesInDateRange:v7];
}

- (void)_removeSamplesInDateRange:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 startDate];
  v22 = v4;
  id v6 = [v4 endDate];
  id v23 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v21 = self;
  id v7 = [(WDSampleListDataProvider *)self samples];
  v8 = [v7 allSamples];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v14 = [v13 startDate];
        int IsLargerOrEqual = HKUIObjectIsLargerOrEqual();

        v16 = [v13 startDate];
        int IsSmaller = HKUIObjectIsSmaller();

        if (IsLargerOrEqual) {
          BOOL v18 = IsSmaller == 0;
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18)
        {
          v19 = [v13 UUID];
          [v23 addObject:v19];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  v20 = [(WDSampleListDataProvider *)v21 samples];
  [v20 removeSamplesWithUUIDs:v23];
}

- (void)deleteAllData
{
  v3.receiver = self;
  v3.super_class = (Class)WDAppleStandHourStatisticsListDataProvider;
  [(WDSampleListDataProvider *)&v3 deleteAllData];
  [(NSMutableArray *)self->_orderedTimePeriods removeAllObjects];
  [(NSMutableDictionary *)self->_totalsByTimePeriod removeAllObjects];
}

- (void)deleteObjectsAtIndexPath:(id)a3 healthStore:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  char v6 = a5;
  id v10 = a6;
  uint64_t v11 = v6 & 2;
  orderedTimePeriods = self->_orderedTimePeriods;
  id v13 = a4;
  v14 = -[NSMutableArray objectAtIndexedSubscript:](orderedTimePeriods, "objectAtIndexedSubscript:", [a3 row]);
  uint64_t v15 = [(WDSampleListDataProvider *)self displayType];
  v16 = [v15 sampleType];

  v17 = (void *)MEMORY[0x263F0A668];
  BOOL v18 = [v14 startDate];
  v19 = [v14 endDate];
  v20 = [v17 predicateForSamplesWithStartDate:v18 endDate:v19 options:1];

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __102__WDAppleStandHourStatisticsListDataProvider_deleteObjectsAtIndexPath_healthStore_options_completion___block_invoke;
  v22[3] = &unk_26458DF30;
  id v23 = v10;
  id v21 = v10;
  [v13 deleteObjectsOfType:v16 predicate:v20 options:v11 withCompletion:v22];
}

uint64_t __102__WDAppleStandHourStatisticsListDataProvider_deleteObjectsAtIndexPath_healthStore_options_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

- (id)viewControllerForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(WDSampleListDataProvider *)self displayType];
  char v6 = [(WDSampleListDataProvider *)self profile];
  id v7 = [(WDSampleListDataProvider *)self unitController];
  v8 = objc_msgSend(v5, "wd_listViewControllerDataProviderWithProfile:unitController:isHierarchical:", v6, v7, 0);

  orderedTimePeriods = self->_orderedTimePeriods;
  uint64_t v10 = [v4 row];

  uint64_t v11 = [(NSMutableArray *)orderedTimePeriods objectAtIndexedSubscript:v10];
  v12 = (void *)MEMORY[0x263F0A668];
  id v13 = [v11 startDate];
  v14 = [v11 endDate];
  uint64_t v15 = [v12 predicateForSamplesWithStartDate:v13 endDate:v14 options:0];

  v16 = [(WDSampleListDataProvider *)self defaultQueryPredicate];
  v17 = HKUIPredicateMatchingPredicates();

  [v8 setDefaultQueryPredicate:v17];
  BOOL v18 = [WDDataListViewController alloc];
  v19 = [(WDSampleListDataProvider *)self displayType];
  v20 = [(WDSampleListDataProvider *)self profile];
  id v21 = [(WDDataListViewController *)v18 initWithDisplayType:v19 profile:v20 dataProvider:v8 usingInsetStyling:1];

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_valueFormatter, 0);
  objc_storeStrong((id *)&self->_totalsByTimePeriod, 0);

  objc_storeStrong((id *)&self->_orderedTimePeriods, 0);
}

@end