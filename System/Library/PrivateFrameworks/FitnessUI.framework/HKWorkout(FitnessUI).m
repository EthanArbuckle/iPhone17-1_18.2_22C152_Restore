@interface HKWorkout(FitnessUI)
+ (double)fiui_weightedAverageHeartRateWithSamples:()FitnessUI startDate:endDate:;
+ (id)fiui_supportedGoalTypesForActivityType:()FitnessUI activityMoveMode:;
+ (id)fiui_supportedGoalTypesForWorkoutSettingsManager:()FitnessUI;
+ (id)fiui_supportedMetricsForActivityType:()FitnessUI activityMoveMode:;
+ (uint64_t)_isHeartRateSupportedInPowerSettingsForActivityType:()FitnessUI;
+ (uint64_t)_isHeartRateSupportedInPrivacySettings;
+ (uint64_t)fiui_activitySupportsMetricType:()FitnessUI activityType:activityMoveMode:;
+ (uint64_t)fiui_associatedMetricForGoalType:()FitnessUI;
+ (uint64_t)fiui_isHeartRateSupportedForActivityType:()FitnessUI isIndoor:;
+ (uint64_t)fiui_shouldTrackPaceWithOdometerForActivityType:()FitnessUI;
- (BOOL)fiui_hasAveragePace;
- (BOOL)fiui_hasWeatherData;
- (double)fiui_averageCadence;
- (double)fiui_averagePace;
- (double)fiui_averagePower;
- (double)fiui_averageTimePerLap;
- (double)fiui_completionFactor;
- (double)fiui_duration;
- (double)fiui_totalStepCount;
- (id)_fiui_averagePaceQty;
- (id)fiui_activityType;
- (id)fiui_connectedGymBrandName;
- (id)fiui_elevationGain;
- (id)fiui_eventsOfType:()FitnessUI;
- (id)fiui_finalWorkoutUUID;
- (id)fiui_keyValueSummary;
- (id)fiui_lapLength;
- (id)fiui_splitsFromDistanceSamples:()FitnessUI distanceInMetersPerSplit:workoutStartDate:;
- (id)fiui_totalDistance;
- (uint64_t)fiui_hasNonZeroElevationGain;
- (uint64_t)fiui_isConnectedGymWorkout;
- (uint64_t)fiui_numberOfEventsOfType:()FitnessUI;
- (uint64_t)fiui_strokeStyle;
- (uint64_t)supportsMetric:()FitnessUI;
@end

@implementation HKWorkout(FitnessUI)

+ (uint64_t)fiui_isHeartRateSupportedForActivityType:()FitnessUI isIndoor:
{
  if ([MEMORY[0x263F82438] isRunningInStoreDemoMode]) {
    return 1;
  }
  int v6 = [a1 _isHeartRateSupportedInPowerSettingsForActivityType:a3];
  return v6 & [a1 _isHeartRateSupportedInPrivacySettings];
}

+ (uint64_t)_isHeartRateSupportedInPowerSettingsForActivityType:()FitnessUI
{
  return 1;
}

+ (uint64_t)_isHeartRateSupportedInPrivacySettings
{
  v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v1 = [v0 persistentDomainForName:*MEMORY[0x263F0ADC0]];

  v2 = [v1 objectForKey:*MEMORY[0x263F0ADD8]];
  v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 BOOLValue];
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

+ (uint64_t)fiui_shouldTrackPaceWithOdometerForActivityType:()FitnessUI
{
  return ((unint64_t)(a3 - 13) < 0x3B) & (0x600000000000001uLL >> (a3 - 13));
}

- (uint64_t)fiui_isConnectedGymWorkout
{
  v1 = [a1 device];
  uint64_t v2 = [v1 _isConnectedGymDevice];

  return v2;
}

- (id)fiui_activityType
{
  if (_os_feature_enabled_impl()) {
    +[FIUIWorkoutActivityType effectiveActivityTypeWithWorkout:a1];
  }
  else {
  uint64_t v2 = +[FIUIWorkoutActivityType activityTypeWithWorkout:a1];
  }
  return v2;
}

- (uint64_t)fiui_strokeStyle
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 metadata];
  uint64_t v3 = *MEMORY[0x263F09AE8];
  uint64_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F09AE8]];

  if (v4)
  {
    uint64_t v5 = [v4 integerValue];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v7 = objc_msgSend(a1, "fiui_eventsOfType:", 3);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v48 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v47 + 1) + 8 * i) metadata];
          v13 = [v12 objectForKeyedSubscript:v3];

          if (v13)
          {
            v14 = [v6 objectForKeyedSubscript:v13];
            if (v14)
            {
              v15 = v14;
              uint64_t v16 = [v14 integerValue];
              v17 = [NSNumber numberWithInteger:v16 + 1];
            }
            else
            {
              v17 = &unk_26CF75508;
            }
            [v6 setObject:v17 forKeyedSubscript:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v9);
    }

    uint64_t v18 = [v6 count];
    uint64_t v5 = v18;
    if (v18)
    {
      if (v18 == 1)
      {
        v19 = [v6 allKeys];
        v20 = [v19 firstObject];
        uint64_t v5 = [v20 integerValue];

        uint64_t v4 = 0;
      }
      else
      {
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        v21 = [v6 allValues];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v44;
          float v25 = 0.0;
          uint64_t v4 = 0;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v44 != v24) {
                objc_enumerationMutation(v21);
              }
              [*(id *)(*((void *)&v43 + 1) + 8 * j) floatValue];
              float v25 = v25 + v27;
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v43 objects:v52 count:16];
          }
          while (v23);
        }
        else
        {
          float v25 = 0.0;
          uint64_t v4 = 0;
        }

        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        v19 = [v6 allKeys];
        uint64_t v28 = [v19 countByEnumeratingWithState:&v39 objects:v51 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v40;
          if (v25 >= 10.9999999 || v25 <= 2.00000012) {
            float v32 = v25;
          }
          else {
            float v32 = v25 + -1.0;
          }
          uint64_t v5 = 1;
          while (2)
          {
            for (uint64_t k = 0; k != v29; ++k)
            {
              if (*(void *)v40 != v30) {
                objc_enumerationMutation(v19);
              }
              v34 = *(void **)(*((void *)&v39 + 1) + 8 * k);
              v35 = [v6 objectForKeyedSubscript:v34];
              [v35 floatValue];
              float v37 = v36;

              if ((float)(v37 / v32) > 0.9)
              {
                uint64_t v5 = [v34 integerValue];
                goto LABEL_45;
              }
            }
            uint64_t v29 = [v19 countByEnumeratingWithState:&v39 objects:v51 count:16];
            if (v29) {
              continue;
            }
            break;
          }
        }
        else
        {
          uint64_t v5 = 1;
        }
      }
LABEL_45:
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  return v5;
}

- (id)fiui_eventsOfType:()FitnessUI
{
  uint64_t v4 = [a1 workoutEvents];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__HKWorkout_FitnessUI__fiui_eventsOfType___block_invoke;
  v8[3] = &__block_descriptor_40_e41_B24__0__HKWorkoutEvent_8__NSDictionary_16l;
  v8[4] = a3;
  uint64_t v5 = [MEMORY[0x263F08A98] predicateWithBlock:v8];
  id v6 = [v4 filteredArrayUsingPredicate:v5];

  return v6;
}

- (double)fiui_completionFactor
{
  double v2 = 0.0;
  switch([a1 _goalType])
  {
    case 0:
      double v2 = 1.0;
      break;
    case 1:
      uint64_t v3 = [a1 totalDistance];
      uint64_t v4 = [MEMORY[0x263F0A830] meterUnit];
      [v3 doubleValueForUnit:v4];
      double v6 = v5;

      v7 = [a1 _goal];
      uint64_t v8 = [MEMORY[0x263F0A830] meterUnit];
      goto LABEL_7;
    case 2:
      uint64_t v9 = [a1 _goal];
      uint64_t v10 = [MEMORY[0x263F0A830] secondUnit];
      [v9 doubleValueForUnit:v10];
      double v12 = v11;

      if (v12 > 2.22044605e-16)
      {
        [a1 duration];
        double v2 = v13 / v12;
      }
      break;
    case 3:
      v14 = [a1 totalEnergyBurned];
      v15 = [MEMORY[0x263F0A830] jouleUnit];
      [v14 doubleValueForUnit:v15];
      double v6 = v16;

      v7 = [a1 _goal];
      uint64_t v8 = [MEMORY[0x263F0A830] jouleUnit];
LABEL_7:
      v17 = (void *)v8;
      [v7 doubleValueForUnit:v8];
      double v19 = v18;

      if (v19 <= 2.22044605e-16) {
        double v2 = 0.0;
      }
      else {
        double v2 = v6 / v19;
      }
      break;
    default:
      return v2;
  }
  return v2;
}

+ (double)fiui_weightedAverageHeartRateWithSamples:()FitnessUI startDate:endDate:
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v24 = a4;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x263EFF990] data];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        double v16 = [v15 startDate];
        v17 = [v15 quantity];
        double v18 = [MEMORY[0x263F0A830] _countPerMinuteUnit];
        [v17 doubleValueForUnit:v18];
        double v20 = v19;

        objc_msgSend(v9, "fiui_appendHeartRate:date:", v16, v20);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }

  objc_msgSend(v9, "fiui_weightedAverageHeartRateWithStartDate:endDate:", v24, v8);
  double v22 = v21;

  return v22;
}

- (BOOL)fiui_hasAveragePace
{
  v1 = objc_msgSend(a1, "_fiui_averagePaceQty");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)_fiui_averagePaceQty
{
  v1 = [a1 metadata];
  BOOL v2 = [v1 objectForKey:*MEMORY[0x263F0ABD8]];

  return v2;
}

- (uint64_t)fiui_numberOfEventsOfType:()FitnessUI
{
  v1 = objc_msgSend(a1, "fiui_eventsOfType:");
  uint64_t v2 = [v1 count];

  return v2;
}

- (id)fiui_keyValueSummary
{
  v40[8] = *MEMORY[0x263EF8340];
  v39[0] = @"activityType";
  [a1 workoutActivityType];
  v38 = _HKWorkoutActivityNameForActivityType();
  v40[0] = v38;
  v39[1] = @"duration";
  uint64_t v2 = NSString;
  [a1 duration];
  float v37 = objc_msgSend(v2, "stringWithFormat:", @"%f", v3);
  v40[1] = v37;
  v39[2] = @"distance";
  float v36 = [a1 totalDistance];
  v35 = [MEMORY[0x263F0A830] meterUnit];
  uint64_t v4 = NSString;
  [v36 doubleValueForUnit:v35];
  v34 = objc_msgSend(v4, "stringWithFormat:", @"%f", v5);
  v40[2] = v34;
  v39[3] = @"activeCalories";
  v33 = [a1 totalEnergyBurned];
  float v32 = [MEMORY[0x263F0A830] kilocalorieUnit];
  double v6 = NSString;
  [v33 doubleValueForUnit:v32];
  v31 = objc_msgSend(v6, "stringWithFormat:", @"%f", v7);
  v40[3] = v31;
  v39[4] = @"basalCalories";
  uint64_t v30 = [a1 _totalBasalEnergyBurned];
  uint64_t v29 = [MEMORY[0x263F0A830] kilocalorieUnit];
  id v8 = NSString;
  [v30 doubleValueForUnit:v29];
  id v10 = objc_msgSend(v8, "stringWithFormat:", @"%f", v9);
  v40[4] = v10;
  v39[5] = @"flightsClimbed";
  uint64_t v11 = [a1 totalFlightsClimbed];
  uint64_t v12 = [MEMORY[0x263F0A830] countUnit];
  uint64_t v13 = NSString;
  [v11 doubleValueForUnit:v12];
  v15 = objc_msgSend(v13, "stringWithFormat:", @"%f", v14);
  v40[5] = v15;
  v39[6] = @"strokeCount";
  double v16 = [a1 totalSwimmingStrokeCount];
  v17 = [MEMORY[0x263F0A830] countUnit];
  double v18 = NSString;
  [v16 doubleValueForUnit:v17];
  double v20 = objc_msgSend(v18, "stringWithFormat:", @"%f", v19);
  v40[6] = v20;
  v39[7] = @"uuid";
  double v21 = [a1 UUID];
  v40[7] = v21;
  double v22 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:8];

  uint64_t v23 = NSString;
  id v24 = _KeyValueStringFromDictionary(v22);
  long long v25 = [a1 metadata];
  long long v26 = _KeyValueStringFromDictionary(v25);
  long long v27 = [v23 stringWithFormat:@"%@ metadata={ %@ }", v24, v26];

  return v27;
}

- (BOOL)fiui_hasWeatherData
{
  uint64_t v2 = [a1 metadata];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F0ABC8]];
  if (v3)
  {
    uint64_t v4 = [a1 metadata];
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F09B20]];
    if (v5)
    {
      double v6 = [a1 metadata];
      uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F09B18]];
      BOOL v8 = v7 != 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (uint64_t)fiui_hasNonZeroElevationGain
{
  v1 = objc_msgSend(a1, "fiui_elevationGain");
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = objc_msgSend(v1, "fiui_isNonzero");
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)fiui_elevationGain
{
  uint64_t v2 = [a1 metadata];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x263F09A68]];

  if (!v3)
  {
    uint64_t v4 = [a1 metadata];
    uint64_t v3 = [v4 objectForKey:*MEMORY[0x263F0ABF0]];
  }
  return v3;
}

- (double)fiui_duration
{
  uint64_t v2 = [a1 metadata];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x263F09A78]];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F0A830] secondUnit];
    [v3 doubleValueForUnit:v4];
    double v6 = v5;
  }
  else
  {
    [a1 duration];
    double v6 = v7;
  }

  return v6;
}

- (id)fiui_totalDistance
{
  uint64_t v2 = [a1 metadata];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x263F09A98]];

  uint64_t v4 = [a1 metadata];
  double v5 = [v4 objectForKey:*MEMORY[0x263F09A58]];

  if (v3)
  {
    id v6 = v3;
  }
  else if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [a1 totalDistance];
  }
  double v7 = v6;

  return v7;
}

- (double)fiui_totalStepCount
{
  v1 = [a1 metadata];
  uint64_t v2 = [v1 objectForKey:*MEMORY[0x263F0AC00]];
  uint64_t v3 = [MEMORY[0x263F0A830] countUnit];
  [v2 doubleValueForUnit:v3];
  double v5 = v4;

  return v5;
}

- (double)fiui_averageCadence
{
  v1 = [a1 metadata];
  uint64_t v2 = [v1 objectForKey:*MEMORY[0x263F0ABD0]];
  uint64_t v3 = [MEMORY[0x263F0A830] _countPerMinuteUnit];
  [v2 doubleValueForUnit:v3];
  double v5 = v4;

  return v5;
}

- (double)fiui_averagePower
{
  v1 = [a1 metadata];
  uint64_t v2 = [v1 objectForKey:*MEMORY[0x263F0ABE0]];

  uint64_t v3 = [MEMORY[0x263F0A830] wattUnit];
  int v4 = [v2 isCompatibleWithUnit:v3];

  if (v4) {
    [MEMORY[0x263F0A830] wattUnit];
  }
  else {
  double v5 = [MEMORY[0x263F0A830] unitFromString:@"J/s"];
  }
  [v2 doubleValueForUnit:v5];
  double v7 = v6;

  return v7;
}

- (double)fiui_averagePace
{
  v1 = objc_msgSend(a1, "_fiui_averagePaceQty");
  uint64_t v2 = [MEMORY[0x263F0A830] unitFromString:@"m/s"];
  [v1 doubleValueForUnit:v2];
  double v4 = v3;

  return v4;
}

- (id)fiui_finalWorkoutUUID
{
  uint64_t v2 = [a1 metadata];
  double v3 = [v2 objectForKey:*MEMORY[0x263F0AC08]];

  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v3];
  }
  else
  {
    uint64_t v4 = [a1 UUID];
  }
  double v5 = (void *)v4;

  return v5;
}

- (id)fiui_connectedGymBrandName
{
  uint64_t v2 = [a1 device];
  int v3 = [v2 _isConnectedGymDevice];

  if (v3)
  {
    uint64_t v4 = [a1 device];
    uint64_t v5 = [v4 manufacturer];
LABEL_5:
    uint64_t v9 = (void *)v5;

    goto LABEL_7;
  }
  double v6 = [a1 metadata];
  uint64_t v7 = *MEMORY[0x263F0ABF8];
  BOOL v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F0ABF8]];

  if (v8)
  {
    uint64_t v4 = [a1 metadata];
    uint64_t v5 = [v4 objectForKeyedSubscript:v7];
    goto LABEL_5;
  }
  uint64_t v9 = 0;
LABEL_7:
  return v9;
}

- (double)fiui_averageTimePerLap
{
  uint64_t v2 = objc_msgSend(a1, "fiui_numberOfEventsOfType:", 3);
  if (v2 < 1) {
    return 0.0;
  }
  uint64_t v3 = v2;
  [a1 duration];
  return v4 / (double)v3;
}

- (id)fiui_lapLength
{
  if ([a1 workoutActivityType] == 46)
  {
    uint64_t v2 = [a1 metadata];
    uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F09AB0]];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)fiui_splitsFromDistanceSamples:()FitnessUI distanceInMetersPerSplit:workoutStartDate:
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v41 = 0;
  long long v42 = (double *)&v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  uint64_t v37 = 0;
  v38 = (double *)&v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__0;
  v35[4] = __Block_byref_object_dispose__0;
  id v36 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  float v32 = __Block_byref_object_dispose__0;
  id v33 = [MEMORY[0x263EFF980] array];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  double v18 = __97__HKWorkout_FitnessUI__fiui_splitsFromDistanceSamples_distanceInMetersPerSplit_workoutStartDate___block_invoke;
  uint64_t v19 = &unk_2644A8170;
  double v22 = v35;
  uint64_t v23 = v34;
  id v10 = v8;
  id v20 = v10;
  id v24 = &v37;
  id v11 = v9;
  id v21 = v11;
  long long v25 = &v41;
  long long v26 = &v28;
  double v27 = a2;
  [a1 _enumerateActiveTimePeriods:&v16];
  if (v42[3] != 0.0)
  {
    uint64_t v12 = [FIUIWorkoutSplit alloc];
    uint64_t v13 = -[FIUIWorkoutSplit initWithDistance:duration:](v12, "initWithDistance:duration:", v42[3], v38[3], v16, v17, v18, v19, v20);
    [(id)v29[5] addObject:v13];
  }
  id v14 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v14;
}

- (uint64_t)supportsMetric:()FitnessUI
{
  uint64_t v5 = objc_msgSend(a1, "fiui_activityType");
  int64_t v6 = +[FIUIWorkoutDefaultMetricsProvider metricsVersionForWorkout:a1];
  uint64_t v7 = [FIUIWorkoutDefaultMetricsProvider alloc];
  uint64_t v8 = [a1 _activityMoveMode];
  uint64_t v9 = FIUIDeviceSupportsElevationGain();
  id v10 = [(FIUIWorkoutDefaultMetricsProvider *)v7 initWithMetricsVersion:v6 activityType:v5 activityMoveMode:v8 deviceSupportsElevationMetrics:v9 deviceSupportsGroundElevationMetrics:FIUIDeviceSupportsGroundElevation()];
  uint64_t v11 = -[FIUIWorkoutDefaultMetricsProvider isMetricTypeSupported:isMachineWorkout:activityType:](v10, "isMetricTypeSupported:isMachineWorkout:activityType:", a3, objc_msgSend(a1, "fiui_isConnectedGymWorkout"), v5);

  return v11;
}

+ (id)fiui_supportedMetricsForActivityType:()FitnessUI activityMoveMode:
{
  id v5 = a3;
  int64_t v6 = [[FIUIWorkoutSettingsManager alloc] initWithWorkoutActivityType:v5 activityMoveMode:a4];

  uint64_t v7 = [(FIUIWorkoutSettingsManager *)v6 orderedSupportedMetrics];

  return v7;
}

+ (id)fiui_supportedGoalTypesForActivityType:()FitnessUI activityMoveMode:
{
  id v6 = a3;
  uint64_t v7 = [[FIUIWorkoutSettingsManager alloc] initWithWorkoutActivityType:v6 activityMoveMode:a4];

  uint64_t v8 = objc_msgSend(a1, "fiui_supportedGoalTypesForWorkoutSettingsManager:", v7);

  return v8;
}

+ (id)fiui_supportedGoalTypesForWorkoutSettingsManager:()FitnessUI
{
  uint64_t v3 = [a3 orderedSupportedMetrics];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x263F0A8F8], "fiui_associatedMetricForGoalType:", 3));
  int v6 = [v3 containsObject:v5];

  if (v6) {
    [v4 addObject:&unk_26CF75520];
  }
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x263F0A8F8], "fiui_associatedMetricForGoalType:", 2));
  int v8 = [v3 containsObject:v7];

  if (v8) {
    [v4 addObject:&unk_26CF75538];
  }
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x263F0A8F8], "fiui_associatedMetricForGoalType:", 1));
  int v10 = [v3 containsObject:v9];

  if (v10) {
    [v4 addObject:&unk_26CF75550];
  }
  [v4 addObject:&unk_26CF75568];

  return v4;
}

+ (uint64_t)fiui_associatedMetricForGoalType:()FitnessUI
{
  if (a3 > 2) {
    return 2;
  }
  else {
    return qword_21E4D8DE8[a3];
  }
}

+ (uint64_t)fiui_activitySupportsMetricType:()FitnessUI activityType:activityMoveMode:
{
  int v6 = objc_msgSend(MEMORY[0x263F0A8F8], "fiui_supportedMetricsForActivityType:activityMoveMode:", a4, a5);
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v8 = [v6 containsObject:v7];

  return v8;
}

@end