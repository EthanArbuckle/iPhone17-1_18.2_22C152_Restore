@interface HKWorkout(ActivityAchievementsDaemon)
- (BOOL)_isHalfMarathonDistance;
- (BOOL)_isMarathonDistance;
- (double)_bestDurationForKilometerCount:()ActivityAchievementsDaemon activityType:;
- (double)aad_bestHalfMarathonDuration;
- (double)aad_bestMarathonDuration;
- (double)aad_bestWheelchairHalfMarathonDuration;
- (double)aad_bestWheelchairMarathonDuration;
- (uint64_t)aad_best10KDuration;
- (uint64_t)aad_best5KDuration;
- (uint64_t)aad_bestWheelchair10KDuration;
- (uint64_t)aad_bestWheelchair5KDuration;
@end

@implementation HKWorkout(ActivityAchievementsDaemon)

- (uint64_t)aad_best5KDuration
{
  return [a1 _bestDurationForKilometerCount:5 activityType:37];
}

- (uint64_t)aad_best10KDuration
{
  return [a1 _bestDurationForKilometerCount:10 activityType:37];
}

- (uint64_t)aad_bestWheelchair5KDuration
{
  return [a1 _bestDurationForKilometerCount:5 activityType:71];
}

- (uint64_t)aad_bestWheelchair10KDuration
{
  return [a1 _bestDurationForKilometerCount:10 activityType:71];
}

- (double)aad_bestHalfMarathonDuration
{
  if (![a1 _isHalfMarathonDistance]) {
    return 1.79769313e308;
  }
  unint64_t v2 = vcvtmd_u64_f64(*MEMORY[0x263F23528]);
  [a1 _bestDurationForKilometerCount:v2 activityType:37];
  return result;
}

- (double)aad_bestMarathonDuration
{
  if (![a1 _isMarathonDistance]) {
    return 1.79769313e308;
  }
  unint64_t v2 = vcvtmd_u64_f64(*MEMORY[0x263F23550]);
  [a1 _bestDurationForKilometerCount:v2 activityType:37];
  return result;
}

- (double)aad_bestWheelchairHalfMarathonDuration
{
  if (![a1 _isHalfMarathonDistance]) {
    return 1.79769313e308;
  }
  unint64_t v2 = vcvtmd_u64_f64(*MEMORY[0x263F23528]);
  [a1 _bestDurationForKilometerCount:v2 activityType:71];
  return result;
}

- (double)aad_bestWheelchairMarathonDuration
{
  if (![a1 _isMarathonDistance]) {
    return 1.79769313e308;
  }
  unint64_t v2 = vcvtmd_u64_f64(*MEMORY[0x263F23550]);
  [a1 _bestDurationForKilometerCount:v2 activityType:71];
  return result;
}

- (double)_bestDurationForKilometerCount:()ActivityAchievementsDaemon activityType:
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if ([a1 workoutActivityType] != a4) {
    return 1.79769313e308;
  }
  v6 = (void *)MEMORY[0x263F0A630];
  v7 = [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:9];
  v8 = [v6 quantityWithUnit:v7 doubleValue:1.0];

  v9 = [a1 workoutEvents];
  v10 = FISplitsForMeasuringSystemIdentifier();

  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "fi_splitDistance", (void)v30);
        if ([v8 compare:v18] != 1) {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v14);
  }

  if ([v11 count] >= a3)
  {
    [v11 sortUsingComparator:&__block_literal_global_2];
    v20 = [v11 objectAtIndexedSubscript:a3 - 1];
    v21 = [v20 dateInterval];
    v22 = [v21 endDate];
    [v22 timeIntervalSinceReferenceDate];
    double v24 = v23;
    v25 = [v11 objectAtIndexedSubscript:0];
    v26 = [v25 dateInterval];
    v27 = [v26 startDate];
    [v27 timeIntervalSinceReferenceDate];
    double v19 = v24 - v28;
  }
  else
  {
    double v19 = 1.79769313e308;
  }

  return v19;
}

- (BOOL)_isMarathonDistance
{
  v1 = [a1 totalDistance];
  unint64_t v2 = [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:9];
  [v1 doubleValueForUnit:v2];
  BOOL v4 = v3 >= *MEMORY[0x263F23550];

  return v4;
}

- (BOOL)_isHalfMarathonDistance
{
  v1 = [a1 totalDistance];
  unint64_t v2 = [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:9];
  [v1 doubleValueForUnit:v2];
  BOOL v4 = v3 >= *MEMORY[0x263F23528];

  return v4;
}

@end