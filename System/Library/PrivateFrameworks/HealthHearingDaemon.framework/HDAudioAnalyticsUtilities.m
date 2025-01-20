@interface HDAudioAnalyticsUtilities
+ (double)doseFromStatistics:(id)a3 days:(int64_t)a4;
+ (double)durationFromStatistics:(id)a3;
+ (double)leqFromStatistics:(id)a3;
+ (id)_quantityTypeForExposureType:(int64_t)a3;
+ (id)audioAverageAndDurationForExposureType:(int64_t)a3 profile:(id)a4 startDate:(id)a5 endDate:(id)a6 error:(id *)a7;
+ (id)audioExposureEventsForExposureType:(int64_t)a3 profile:(id)a4 startDate:(id)a5 endDate:(id)a6 error:(id *)a7;
+ (id)boundedIntegerForDose:(double)a3;
+ (id)boundedIntegerForEventDuration:(double)a3;
+ (id)boundedIntegerForExposureDuration:(double)a3;
+ (id)boundedIntegerForLEQ:(double)a3;
+ (id)boundedIntegerForLockedDuration:(double)a3;
+ (id)boundedIntegerForSoundReductionLEQ:(double)a3;
+ (id)boundedIntegerForSyncDelayDuration:(double)a3;
+ (id)boundedIntegerForTimeSinceLastNotification:(double)a3;
+ (id)boundedIntegerForValue:(double)a3 orderedBuckets:(id)a4 sentinel:(id)a5 transformer:(id)a6;
+ (id)fullDays:(int64_t)a3 beforeDate:(id)a4;
+ (id)latestAudioExposureEventForExposureType:(int64_t)a3 profile:(id)a4 error:(id *)a5;
+ (id)localGregorianCalendar;
+ (id)rollingDays:(int64_t)a3 beforeDate:(id)a4;
+ (int64_t)exposureAlertCount:(id)a3;
@end

@implementation HDAudioAnalyticsUtilities

+ (id)localGregorianCalendar
{
  v2 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
  v3 = [MEMORY[0x263EFFA18] localTimeZone];
  [v2 setTimeZone:v3];

  return v2;
}

+ (double)leqFromStatistics:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  v3 = [a3 averageQuantity];
  if (v3)
  {
    v4 = [MEMORY[0x263F0A830] decibelAWeightedSoundPressureLevelUnit];
    [v3 doubleValueForUnit:v4];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

+ (double)durationFromStatistics:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  v3 = [a3 duration];
  v4 = [MEMORY[0x263F0A830] secondUnit];
  [v3 doubleValueForUnit:v4];
  double v6 = v5;

  return v6;
}

+ (double)doseFromStatistics:(id)a3 days:(int64_t)a4
{
  id v6 = a3;
  double v7 = -1.0;
  if (v6)
  {
    [a1 leqFromStatistics:v6];
    double v9 = v8;
    [a1 durationFromStatistics:v6];
    double v11 = v10;
    [MEMORY[0x263F0A0E0] maximumDurationInSecondsForLEQ:a4 days:v9];
    if (v12 > 2.22044605e-16) {
      double v7 = v11 / v12 * 100.0;
    }
  }

  return v7;
}

+ (int64_t)exposureAlertCount:(id)a3
{
  if (a3) {
    return [a3 count];
  }
  else {
    return 0;
  }
}

+ (id)fullDays:(int64_t)a3 beforeDate:(id)a4
{
  id v6 = a4;
  double v7 = [a1 localGregorianCalendar];
  double v8 = [v7 startOfDayForDate:v6];

  id v9 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v9 setDay:-a3];
  double v10 = [v7 dateByAddingComponents:v9 toDate:v8 options:0];
  double v11 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v10 endDate:v8];

  return v11;
}

+ (id)rollingDays:(int64_t)a3 beforeDate:(id)a4
{
  id v6 = a4;
  double v7 = [a1 localGregorianCalendar];
  id v8 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v8 setDay:-a3];
  id v9 = [v7 dateByAddingComponents:v8 toDate:v6 options:0];
  double v10 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v9 endDate:v6];

  return v10;
}

+ (id)boundedIntegerForExposureDuration:(double)a3
{
  if (a3 == 0.0)
  {
    double v5 = &unk_26D9E8EC0;
  }
  else
  {
    double v5 = [a1 boundedIntegerForValue:&unk_26D9E9BE0 orderedBuckets:&unk_26D9E9190 sentinel:&__block_literal_global transformer:v3];
  }
  return v5;
}

unint64_t __63__HDAudioAnalyticsUtilities_boundedIntegerForExposureDuration___block_invoke(double a1)
{
  return vcvtmd_s64_f64(a1 / 3600.0);
}

+ (id)boundedIntegerForSyncDelayDuration:(double)a3
{
  double v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:190];
  for (uint64_t i = 1; i != 61; ++i)
  {
    double v7 = [NSNumber numberWithInteger:i];
    [v5 addObject:v7];
  }
  for (uint64_t j = 120; j != 660; j += 60)
  {
    id v9 = [NSNumber numberWithInteger:j];
    [v5 addObject:v9];
  }
  unint64_t v10 = 0;
  uint64_t v11 = 900;
  do
  {
    double v12 = [NSNumber numberWithInteger:v11];
    [v5 addObject:v12];

    v10 += 15;
    v11 += 900;
  }
  while (v10 < 0x2E);
  uint64_t v13 = 167;
  uint64_t v14 = 7200;
  do
  {
    v15 = [NSNumber numberWithInteger:v14];
    [v5 addObject:v15];

    v14 += 3600;
    --v13;
  }
  while (v13);
  v16 = [a1 boundedIntegerForValue:v5 orderedBuckets:&unk_26D9E91A8 sentinel:&__block_literal_global_369 transformer:a3];

  return v16;
}

unint64_t __64__HDAudioAnalyticsUtilities_boundedIntegerForSyncDelayDuration___block_invoke(double a1)
{
  return vcvtmd_s64_f64(a1);
}

+ (id)boundedIntegerForEventDuration:(double)a3
{
  if (a3 >= 1800.0)
  {
    uint64_t v3 = objc_msgSend(a1, "boundedIntegerForValue:orderedBuckets:sentinel:transformer:", &unk_26D9E9BF8, &unk_26D9E9340, &__block_literal_global_408);
  }
  else
  {
    uint64_t v3 = &unk_26D9E8EC0;
  }
  return v3;
}

unint64_t __60__HDAudioAnalyticsUtilities_boundedIntegerForEventDuration___block_invoke(double a1)
{
  return vcvtmd_s64_f64(a1 / 3600.0);
}

+ (id)boundedIntegerForLockedDuration:(double)a3
{
  if (a3 >= 0.0)
  {
    double v5 = [a1 boundedIntegerForValue:&unk_26D9E9C10 orderedBuckets:&unk_26D9E9598 sentinel:&__block_literal_global_463 transformer:v3];
  }
  else
  {
    double v5 = &unk_26D9E9358;
  }
  return v5;
}

unint64_t __61__HDAudioAnalyticsUtilities_boundedIntegerForLockedDuration___block_invoke(double a1)
{
  return vcvtmd_s64_f64(a1 / 60.0);
}

+ (id)boundedIntegerForTimeSinceLastNotification:(double)a3
{
  if (a3 >= 0.0)
  {
    if (a3 >= 720.0)
    {
      double v5 = [a1 boundedIntegerForValue:&unk_26D9E9C28 orderedBuckets:&unk_26D9E96E8 sentinel:&__block_literal_global_496 transformer:v3];
    }
    else
    {
      double v5 = &unk_26D9E8EC0;
    }
  }
  else
  {
    double v5 = &unk_26D9E9358;
  }
  return v5;
}

unint64_t __72__HDAudioAnalyticsUtilities_boundedIntegerForTimeSinceLastNotification___block_invoke(double a1)
{
  return vcvtmd_s64_f64(a1 / 86400.0);
}

+ (id)boundedIntegerForLEQ:(double)a3
{
  return (id)[a1 boundedIntegerForValue:&unk_26D9E9C40 orderedBuckets:&unk_26D9E97D8 sentinel:&__block_literal_global_521 transformer:a3];
}

unint64_t __50__HDAudioAnalyticsUtilities_boundedIntegerForLEQ___block_invoke(double a1)
{
  return vcvtmd_s64_f64(a1);
}

+ (id)boundedIntegerForSoundReductionLEQ:(double)a3
{
  return (id)[a1 boundedIntegerForValue:&unk_26D9E9C58 orderedBuckets:&unk_26D9E9820 sentinel:&__block_literal_global_532 transformer:a3];
}

unint64_t __64__HDAudioAnalyticsUtilities_boundedIntegerForSoundReductionLEQ___block_invoke(double a1)
{
  return vcvtmd_s64_f64(a1);
}

+ (id)boundedIntegerForDose:(double)a3
{
  return (id)[a1 boundedIntegerForValue:&unk_26D9E9C70 orderedBuckets:&unk_26D9E9940 sentinel:&__block_literal_global_561 transformer:a3];
}

unint64_t __51__HDAudioAnalyticsUtilities_boundedIntegerForDose___block_invoke(double a1)
{
  return vcvtmd_s64_f64(a1);
}

+ (id)boundedIntegerForValue:(double)a3 orderedBuckets:(id)a4 sentinel:(id)a5 transformer:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (*((uint64_t (**)(id, double))a6 + 2))(a6, a3);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (v11 <= objc_msgSend(v17, "integerValue", (void)v20))
        {
          id v18 = v17;

          goto LABEL_11;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  id v18 = v10;
LABEL_11:

  return v18;
}

+ (id)audioAverageAndDurationForExposureType:(int64_t)a3 profile:(id)a4 startDate:(id)a5 endDate:(id)a6 error:(id *)a7
{
  v34[3] = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [a1 _quantityTypeForExposureType:a3];
  if (v15)
  {
    v32 = a7;
    id v33 = v14;
    v16 = (void *)MEMORY[0x263F434A8];
    v17 = HDSampleEntityPredicateForStartDate();
    v34[0] = v17;
    [v15 maximumAllowedDuration];
    v19 = [v13 dateByAddingTimeInterval:-v18];
    long long v20 = HDSampleEntityPredicateForStartDate();
    v34[1] = v20;
    long long v21 = HDSampleEntityPredicateForEndDate();
    v34[2] = v21;
    long long v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:3];
    long long v23 = [v16 predicateMatchingAllPredicates:v22];

    if (a3 == 2)
    {
      v24 = [MEMORY[0x263F0A658] _quantityTypeWithCode:272];
      uint64_t v25 = (void *)[objc_alloc(MEMORY[0x263F43388]) initForProfile:v12 quantityType:v15 predicate:v23 restrictedSourceEntities:0 attenuationType:v24];
      uint64_t v26 = _HKStatisticsOptionAttenuateSamples() | 0x42;
    }
    else
    {
      uint64_t v25 = (void *)[objc_alloc(MEMORY[0x263F43390]) initForProfile:v12 quantityType:v15 predicate:v23 restrictedSourceEntities:0];
      uint64_t v26 = 66;
    }
    v28 = (void *)[objc_alloc(MEMORY[0x263F43398]) initWithProfile:v12 quantityType:v15];
    v29 = [MEMORY[0x263F43380] calculatorForQuantityType:v15 intervalCollection:0 options:v26 mergeStrategy:0];
    [v29 setDataSource:v25];
    [v29 setSourceOrderProvider:v28];
    v30 = 0;
    id v14 = v33;
    if ([v29 queryForInitialStatisticsWithError:v32])
    {
      v30 = [v29 currentStatistics];
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_error:format:", 3, @"Unknown audio exposure type");
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      if (a7) {
        *a7 = v27;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v30 = 0;
  }

  return v30;
}

+ (id)_quantityTypeForExposureType:(int64_t)a3
{
  if ((unint64_t)a3 <= 3)
  {
    objc_msgSend(MEMORY[0x263F0A598], "quantityTypeForIdentifier:", **((void **)&unk_264795CC0 + a3), v3);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)audioExposureEventsForExposureType:(int64_t)a3 profile:(id)a4 startDate:(id)a5 endDate:(id)a6 error:(id *)a7
{
  v60[3] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ((unint64_t)(a3 - 1) >= 2) {
    id v13 = (void *)MEMORY[0x263F09300];
  }
  else {
    id v13 = (void *)MEMORY[0x263F092C0];
  }
  id v14 = [MEMORY[0x263F0A598] categoryTypeForIdentifier:*v13];
  uint64_t v15 = (void *)MEMORY[0x263F434A8];
  v47 = v12;
  v16 = HDSampleEntityPredicateForStartDate();
  v60[0] = v16;
  [v14 maximumAllowedDuration];
  double v18 = [v11 dateByAddingTimeInterval:-v17];
  v19 = HDSampleEntityPredicateForStartDate();
  v60[1] = v19;
  long long v20 = HDSampleEntityPredicateForEndDate();
  v60[2] = v20;
  long long v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:3];
  long long v22 = [v15 predicateMatchingAllPredicates:v21];

  id v58 = 0;
  v51 = v14;
  v52 = v10;
  long long v23 = [MEMORY[0x263F43180] samplesWithType:v14 profile:v10 encodingOptions:0 predicate:v22 limit:0 anchor:0 error:&v58];
  id v24 = v58;
  uint64_t v25 = v24;
  if (!v23)
  {
    id v26 = v24;
    if (v26)
    {
      if (a7) {
        *a7 = v26;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  if (a3 == 2)
  {
    id v48 = [MEMORY[0x263EFF980] array];
    if ([v23 count])
    {
      v44 = v25;
      v45 = v22;
      id v46 = v11;
      unint64_t v27 = 0;
      uint64_t v49 = *MEMORY[0x263F09E00];
      v50 = v23;
      do
      {
        v28 = (void *)MEMORY[0x263F434A8];
        v56 = [v23 objectAtIndexedSubscript:v27];
        v54 = [v56 endDate];
        v53 = HDSampleEntityPredicateForStartDate();
        v59[0] = v53;
        v29 = [v23 objectAtIndexedSubscript:v27];
        v30 = [v29 startDate];
        [v51 maximumAllowedDuration];
        v32 = [v30 dateByAddingTimeInterval:-v31];
        id v33 = HDSampleEntityPredicateForStartDate();
        v59[1] = v33;
        v34 = [v23 objectAtIndexedSubscript:v27];
        v35 = [v34 startDate];
        v36 = HDSampleEntityPredicateForEndDate();
        v59[2] = v36;
        v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:3];
        v38 = [v28 predicateMatchingAllPredicates:v37];

        v39 = (void *)MEMORY[0x263F432E8];
        v40 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:v49];
        uint64_t v57 = 0;
        uint64_t v41 = [v39 countOfSamplesWithType:v40 profile:v52 matchingPredicate:v38 withError:&v57];

        long long v23 = v50;
        if (v41 >= 1)
        {
          v42 = [v50 objectAtIndexedSubscript:v27];
          [v48 addObject:v42];
        }
        ++v27;
      }
      while ([v50 count] > v27);
      long long v22 = v45;
      id v11 = v46;
      uint64_t v25 = v44;
    }
  }
  else
  {
    id v48 = v23;
  }

  return v48;
}

+ (id)latestAudioExposureEventForExposureType:(int64_t)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F09300];
  if (a3 == 1) {
    id v8 = (void *)MEMORY[0x263F092C0];
  }
  id v9 = [MEMORY[0x263F0A598] categoryTypeForIdentifier:*v8];
  id v15 = 0;
  id v10 = [MEMORY[0x263F43180] mostRecentSampleWithType:v9 profile:v7 encodingOptions:0 predicate:0 anchor:0 error:&v15];
  id v11 = v15;
  id v12 = v11;
  if (!v10)
  {
    id v13 = v11;
    if (v13)
    {
      if (a5) {
        *a5 = v13;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v10;
}

@end