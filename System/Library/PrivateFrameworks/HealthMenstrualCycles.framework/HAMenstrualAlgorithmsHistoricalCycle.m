@interface HAMenstrualAlgorithmsHistoricalCycle
@end

@implementation HAMenstrualAlgorithmsHistoricalCycle

uint64_t __244__HAMenstrualAlgorithmsHistoricalCycle_HKMenstrualCycles__hkmc_cycleWithLastDayIndex_includeFertileWindow_overridePredictionPrimarySource_overrideOvulationConfirmationFailure_overrideDailyEligibleWristTemperatureCount_useWristTemperatureInput___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  unsigned __int8 v3 = [a2 intValue] - 1;
  if (v3 > 7u) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = qword_224A17B00[(char)v3];
  }
  return [v2 numberWithInteger:v4];
}

@end