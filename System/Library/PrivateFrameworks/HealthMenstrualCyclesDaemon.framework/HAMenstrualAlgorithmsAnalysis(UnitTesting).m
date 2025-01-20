@interface HAMenstrualAlgorithmsAnalysis(UnitTesting)
+ (id)hdmc_demoAnalysisWithStartDayIndex:()UnitTesting;
@end

@implementation HAMenstrualAlgorithmsAnalysis(UnitTesting)

+ (id)hdmc_demoAnalysisWithStartDayIndex:()UnitTesting
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263F429B0]);
  [v4 setJulianDayOfWindowStart:(a3 + 5)];
  [v4 setStartProbabilityMean:1.0];
  [v4 setEndProbabilityMean:5.0];
  [v4 setStartProbabilityStdDev:1.0];
  [v4 setEndProbabilityStdDev:1.0];
  objc_msgSend(v4, "setLowRange:", 0, 10);
  id v5 = objc_alloc_init(MEMORY[0x263F429B0]);
  [v5 setJulianDayOfWindowStart:(a3 + 15)];
  [v5 setStartProbabilityMean:1.0];
  [v5 setEndProbabilityMean:6.0];
  [v5 setStartProbabilityStdDev:2.0];
  [v5 setEndProbabilityStdDev:2.0];
  objc_msgSend(v5, "setLowRange:", 0, 10);
  id v6 = objc_alloc_init(MEMORY[0x263F429B8]);
  [v6 setNumberOfCyclesFound:&unk_26D8EE9B0];
  [v6 setJulianDayOfFirstCycleStart:&unk_26D8EE9C8];
  [v6 setJulianDayOfLastCycleStart:&unk_26D8EE9E0];
  [v6 setMedianCycleLength:&unk_26D8EE9F8];
  [v6 setLowerCycleLengthPercentile:&unk_26D8EEA10];
  [v6 setUpperCycleLengthPercentile:&unk_26D8EEA28];
  [v6 setMedianMenstruationLength:&unk_26D8EEA40];
  [v6 setLowerMenstruationLengthPercentile:&unk_26D8EEB10];
  [v6 setUpperMenstruationLengthPercentile:&unk_26D8EEB20];
  id v7 = objc_alloc_init(MEMORY[0x263F42980]);
  [v7 setJulianDayOfAnalysisWindowStart:(a3 - 179)];
  [v7 setJulianDayOfAnalysisWindowEnd:a3];
  [v7 setMetricsForCoreAnalytics:&unk_26D8EEB30];
  id v8 = objc_alloc_init(MEMORY[0x263F42988]);
  [v8 setIrregularBleeding:v7];
  [v8 setProlongedBleeding:v7];
  id v9 = objc_alloc_init(MEMORY[0x263F42960]);
  v12[0] = v4;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [v9 setMenstruationPredictions:v10];

  [v9 setFertilityPredictions:MEMORY[0x263EFFA68]];
  [v9 setStats:v6];
  [v9 setDeviationAnalysis:v8];

  return v9;
}

@end