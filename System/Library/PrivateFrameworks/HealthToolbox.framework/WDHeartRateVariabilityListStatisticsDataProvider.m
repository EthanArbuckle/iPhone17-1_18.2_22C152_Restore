@interface WDHeartRateVariabilityListStatisticsDataProvider
- (void)deleteObjectsAtIndexPath:(id)a3 healthStore:(id)a4 options:(unint64_t)a5 completion:(id)a6;
@end

@implementation WDHeartRateVariabilityListStatisticsDataProvider

- (void)deleteObjectsAtIndexPath:(id)a3 healthStore:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  unint64_t v9 = a5 & 2;
  id v10 = a6;
  id v11 = a4;
  id v16 = [(WDSampleListStatisticsDataProvider *)self _statisticsAtIndexPath:a3];
  v12 = (void *)MEMORY[0x263F0A440];
  v13 = [v16 startDate];
  v14 = [v16 endDate];
  v15 = [(WDSampleListStatisticsDataProvider *)self defaultQueryPredicate];
  [v12 deleteHRVSamplesFromStartDate:v13 endDate:v14 predicate:v15 options:v9 healthStore:v11 completion:v10];
}

@end