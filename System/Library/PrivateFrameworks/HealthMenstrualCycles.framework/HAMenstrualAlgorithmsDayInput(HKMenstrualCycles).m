@interface HAMenstrualAlgorithmsDayInput(HKMenstrualCycles)
+ (id)hkmc_dayInputWithDaySummary:()HKMenstrualCycles;
+ (id)hkmc_dayInputWithHeartStatistics:()HKMenstrualCycles;
+ (id)hkmc_emptyDayInputWithDayIndex:()HKMenstrualCycles;
- (void)hkmc_updateWithHeartStatistics:()HKMenstrualCycles;
@end

@implementation HAMenstrualAlgorithmsDayInput(HKMenstrualCycles)

+ (id)hkmc_dayInputWithDaySummary:()HKMenstrualCycles
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F42968]);
  objc_msgSend(v4, "setJulianDay:", objc_msgSend(v3, "dayIndex"));
  unint64_t v5 = [v3 menstrualFlow];
  unint64_t v6 = 0x40302010500uLL >> (8 * v5);
  if (v5 >= 6) {
    LOBYTE(v6) = 0;
  }
  [v4 setFlow:v6 & 7];
  objc_msgSend(v4, "setSpotting:", objc_msgSend(v3, "intermenstrualBleeding"));
  unint64_t v7 = [v3 ovulationTestResult];
  unint64_t v8 = 0x203010300uLL >> (8 * v7);
  if (v7 >= 5) {
    LOBYTE(v8) = 0;
  }
  [v4 setOvulationTestResult:v8 & 3];
  v9 = (void *)MEMORY[0x263F429C0];
  v10 = [v3 wristTemperature];
  v11 = objc_msgSend(v9, "hkmc_wristTemperatureWithTemperature:", v10);
  [v4 setWristTemperature:v11];

  return v4;
}

+ (id)hkmc_emptyDayInputWithDayIndex:()HKMenstrualCycles
{
  id v4 = objc_alloc_init(MEMORY[0x263F42968]);
  [v4 setJulianDay:a3];
  return v4;
}

+ (id)hkmc_dayInputWithHeartStatistics:()HKMenstrualCycles
{
  id v3 = (objc_class *)MEMORY[0x263F42968];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setJulianDay:", objc_msgSend(v4, "dayIndex"));
  unint64_t v6 = (void *)MEMORY[0x263F42998];
  unint64_t v7 = [v4 tenthPercentileAwakeHeartRateStatistics];
  unint64_t v8 = objc_msgSend(v6, "hkmc_heartRateStatisticsWithStatistics:", v7);
  [v5 setSedentaryHeartRateStatistics:v8];

  v9 = (void *)MEMORY[0x263F42998];
  v10 = [v4 tenthPercentileAsleepHeartRateStatistics];

  v11 = objc_msgSend(v9, "hkmc_heartRateStatisticsWithStatistics:", v10);
  [v5 setSleepHeartRateStatistics:v11];

  return v5;
}

- (void)hkmc_updateWithHeartStatistics:()HKMenstrualCycles
{
  id v4 = (void *)MEMORY[0x263F42998];
  id v5 = a3;
  unint64_t v6 = [v5 tenthPercentileAwakeHeartRateStatistics];
  unint64_t v7 = objc_msgSend(v4, "hkmc_heartRateStatisticsWithStatistics:", v6);
  [a1 setSedentaryHeartRateStatistics:v7];

  unint64_t v8 = (void *)MEMORY[0x263F42998];
  id v10 = [v5 tenthPercentileAsleepHeartRateStatistics];

  v9 = objc_msgSend(v8, "hkmc_heartRateStatisticsWithStatistics:", v10);
  [a1 setSleepHeartRateStatistics:v9];
}

@end