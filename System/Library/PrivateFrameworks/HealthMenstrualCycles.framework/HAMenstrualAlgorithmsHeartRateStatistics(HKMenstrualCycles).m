@interface HAMenstrualAlgorithmsHeartRateStatistics(HKMenstrualCycles)
+ (id)hkmc_heartRateStatisticsWithStatistics:()HKMenstrualCycles;
@end

@implementation HAMenstrualAlgorithmsHeartRateStatistics(HKMenstrualCycles)

+ (id)hkmc_heartRateStatisticsWithStatistics:()HKMenstrualCycles
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x263F42998];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    v6 = NSNumber;
    [v4 percentileQuantityValue];
    v7 = objc_msgSend(v6, "numberWithDouble:");
    [v5 setLowerPercentile:v7];

    uint64_t v8 = [v4 sampleCount];
    [v5 setSampleCount:v8];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

@end