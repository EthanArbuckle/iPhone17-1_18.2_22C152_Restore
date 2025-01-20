@interface HAMenstrualAlgorithmsHistoricalCycle(HKMenstrualCycles)
- (id)hkmc_cycleWithLastDayIndex:()HKMenstrualCycles includeFertileWindow:overridePredictionPrimarySource:overrideOvulationConfirmationFailure:overrideDailyEligibleWristTemperatureCount:useWristTemperatureInput:;
- (id)hkmc_description;
@end

@implementation HAMenstrualAlgorithmsHistoricalCycle(HKMenstrualCycles)

- (id)hkmc_cycleWithLastDayIndex:()HKMenstrualCycles includeFertileWindow:overridePredictionPrimarySource:overrideOvulationConfirmationFailure:overrideDailyEligibleWristTemperatureCount:useWristTemperatureInput:
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v39 = a7;
  v17 = +[HKMCCycleSegment _menstruationSegmentWithDays:](HKMCCycleSegment, "_menstruationSegmentWithDays:", [a1 julianDayOfMenstruationStart], objc_msgSend(a1, "julianDayOfMenstruationEnd")- objc_msgSend(a1, "julianDayOfMenstruationStart")+ 1);
  if (a4 && ([a1 fertilityStartJulianDay], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v19 = (void *)v18;
    v20 = [a1 fertilityEndJulianDay];

    if (v20)
    {
      v21 = [a1 fertilityStartJulianDay];
      uint64_t v22 = [v21 integerValue];

      v23 = [a1 fertilityEndJulianDay];
      uint64_t v24 = [v23 integerValue];

      v20 = +[HKMCCycleSegment _fertileWindowSegmentWithDays:](HKMCCycleSegment, "_fertileWindowSegmentWithDays:", v22, v24 - v22 + 1);
    }
  }
  else
  {
    v20 = 0;
  }
  v25 = [a1 phases];
  v26 = objc_msgSend(v25, "hk_map:", &__block_literal_global_322);

  int v27 = [a1 predictionPrimarySource];
  if (v27 == 2) {
    uint64_t v28 = a8;
  }
  else {
    uint64_t v28 = 0;
  }
  if (v27 == 3) {
    uint64_t v29 = 2;
  }
  else {
    uint64_t v29 = v28;
  }
  char v30 = [a1 ovulationConfirmationFailure];
  if (a8 && (v30 - 1) <= 3u) {
    uint64_t v31 = qword_224A17AE0[(char)(v30 - 1)];
  }
  else {
    uint64_t v31 = 0;
  }
  uint64_t v32 = [a1 dailyEligibleWristTemperatureCount];
  if (v15 && v16)
  {
    v33 = v39;
    if (v39)
    {
      int v34 = [v15 integerValue];
      if (v34 == 2) {
        uint64_t v35 = a8;
      }
      else {
        uint64_t v35 = 0;
      }
      if (v34 == 3) {
        uint64_t v29 = 2;
      }
      else {
        uint64_t v29 = v35;
      }
      char v36 = [v16 integerValue];
      if (a8 && (v36 - 1) <= 3u) {
        uint64_t v31 = qword_224A17AE0[(char)(v36 - 1)];
      }
      else {
        uint64_t v31 = 0;
      }
      uint64_t v32 = [v39 integerValue];
    }
  }
  else
  {
    v33 = v39;
  }
  v37 = +[HKMCCycle _cycleWithMenstruationSegment:v17 fertileWindowSegment:v20 lastDayIndex:v14 ovulationConfirmationType:v29 ovulationConfirmationFailure:v31 dailyEligibleWristTemperatureCount:v32 cycleFactors:v26];

  return v37;
}

- (id)hkmc_description
{
  v2 = NSString;
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "julianDayOfMenstruationStart"));
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "julianDayOfMenstruationEnd"));
  v5 = [a1 fertilityStartJulianDay];
  v6 = [a1 fertilityEndJulianDay];
  v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isDeterminant"));
  v8 = [v2 stringWithFormat:@"<menstruation: %@ - %@, fertile window: %@ - %@, determinant: %@>", v3, v4, v5, v6, v7];

  return v8;
}

@end