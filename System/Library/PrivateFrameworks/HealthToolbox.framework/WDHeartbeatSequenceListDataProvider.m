@interface WDHeartbeatSequenceListDataProvider
- (id)createQueryForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7;
- (id)predicateForType:(id)a3;
- (id)sampleTypes;
- (id)secondaryTextForObject:(id)a3;
- (id)textForObject:(id)a3;
- (id)viewControllerForItemAtIndexPath:(id)a3;
@end

@implementation WDHeartbeatSequenceListDataProvider

- (id)createQueryForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  v11 = (objc_class *)MEMORY[0x263F0A6E0];
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  v16 = (void *)[[v11 alloc] initWithSampleType:v15 predicate:v14 limit:a5 sortDescriptors:v13 resultsHandler:v12];

  return v16;
}

- (id)sampleTypes
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F0A708] heartbeatSeriesType];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)predicateForType:(id)a3
{
  return 0;
}

- (id)textForObject:(id)a3
{
  v3 = [a3 endDate];
  v4 = HKFormattedStringForDate();

  return v4;
}

- (id)secondaryTextForObject:(id)a3
{
  return 0;
}

- (id)viewControllerForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 row];
  uint64_t v6 = [v4 section];

  v7 = [(WDSampleListDataProvider *)self objectAtIndex:v5 forSection:v6];
  v8 = (void *)[objc_alloc(MEMORY[0x263F466C8]) initWithSample:v7 usingInsetStyling:1 profileName:0 delegate:self];

  return v8;
}

@end