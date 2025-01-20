@interface WDHeartRateVariabilityDataProvider
- (void)deleteObjectsAtIndexPath:(id)a3 healthStore:(id)a4 options:(unint64_t)a5 completion:(id)a6;
@end

@implementation WDHeartRateVariabilityDataProvider

- (void)deleteObjectsAtIndexPath:(id)a3 healthStore:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  unint64_t v9 = a5 & 2;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v12 row];
  uint64_t v14 = [v12 section];

  id v17 = [(WDSampleListDataProvider *)self objectAtIndex:v13 forSection:v14];
  v15 = (void *)MEMORY[0x263F0A440];
  v16 = [(WDSampleListDataProvider *)self defaultQueryPredicate];
  [v15 deleteHRVSample:v17 healthStore:v11 predicate:v16 options:v9 completion:v10];
}

@end