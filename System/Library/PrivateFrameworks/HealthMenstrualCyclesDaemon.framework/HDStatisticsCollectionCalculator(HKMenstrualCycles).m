@interface HDStatisticsCollectionCalculator(HKMenstrualCycles)
+ (id)hdmc_tenthPercentileCalculator;
- (id)hdmc_heartRateStatisticsWithProfile:()HKMenstrualCycles predicate:errorOut:;
@end

@implementation HDStatisticsCollectionCalculator(HKMenstrualCycles)

+ (id)hdmc_tenthPercentileCalculator
{
  v2 = [MEMORY[0x263F0A658] heartRateType];
  v3 = [a1 calculatorForQuantityType:v2 intervalCollection:0 options:_HKStatisticsOptionPercentile() mergeStrategy:1];
  v4 = (void *)[objc_alloc(MEMORY[0x263F433B0]) initWithPercentile:&unk_26D8EEAD0];
  [v3 setStatisticsConfiguration:v4];

  return v3;
}

- (id)hdmc_heartRateStatisticsWithProfile:()HKMenstrualCycles predicate:errorOut:
{
  v8 = (void *)MEMORY[0x263F0A658];
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 heartRateType];
  v12 = (void *)[objc_alloc(MEMORY[0x263F43390]) initForProfile:v10 quantityType:v11 predicate:v9 restrictedSourceEntities:0];

  [a1 setDataSource:v12];
  id v16 = 0;
  [a1 queryForInitialStatisticsWithError:&v16];
  id v13 = v16;
  if (v13)
  {
    if (a5)
    {
      v14 = 0;
      *a5 = v13;
    }
    else
    {
      _HKLogDroppedError();
      v14 = 0;
    }
  }
  else
  {
    v14 = [a1 currentStatistics];
  }

  return v14;
}

@end