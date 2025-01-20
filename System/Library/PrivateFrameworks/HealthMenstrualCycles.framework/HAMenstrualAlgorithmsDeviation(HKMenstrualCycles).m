@interface HAMenstrualAlgorithmsDeviation(HKMenstrualCycles)
- (HKMCUnconfirmedDeviation)hkmc_deviationOfType:()HKMenstrualCycles;
- (id)hkmc_description;
@end

@implementation HAMenstrualAlgorithmsDeviation(HKMenstrualCycles)

- (HKMCUnconfirmedDeviation)hkmc_deviationOfType:()HKMenstrualCycles
{
  uint64_t v5 = [a1 julianDayOfAnalysisWindowStart];
  int v6 = [a1 julianDayOfAnalysisWindowEnd];
  uint64_t v7 = v6 - [a1 julianDayOfAnalysisWindowStart] + 1;
  v8 = [HKMCUnconfirmedDeviation alloc];
  v9 = [a1 metricsForCoreAnalytics];
  v10 = -[HKMCUnconfirmedDeviation initWithType:days:analyticsMetadata:](v8, "initWithType:days:analyticsMetadata:", a3, v5, v7, v9);

  return v10;
}

- (id)hkmc_description
{
  v2 = NSString;
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "julianDayOfAnalysisWindowStart"));
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "julianDayOfAnalysisWindowEnd"));
  uint64_t v5 = [a1 metricsForCoreAnalytics];
  int v6 = [v2 stringWithFormat:@"<analysis window: %@ - %@, analytics: %@>", v3, v4, v5];

  return v6;
}

@end