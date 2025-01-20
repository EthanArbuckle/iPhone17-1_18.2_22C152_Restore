@interface HKWorkoutDataSource
+ (BOOL)_isBLECollectedDataType:(id)a3 indoorWorkout:(BOOL)a4;
+ (BOOL)shouldObserveRunningMetricsForActivityMode:(int64_t)a3 isIndoor:(BOOL)a4 isGymKit:(BOOL)a5;
+ (id)_distanceTypeForActivityType:(unint64_t)a3 isIndoor:(BOOL)a4;
+ (id)_speedTypeForActivityType:(unint64_t)a3 isIndoor:(BOOL)a4 connectedToFitnessMachine:(BOOL)a5;
+ (id)defaultConfigurationWithWorkoutConfiguration:(id)a3 activityMoveMode:(int64_t)a4;
+ (id)observedTypesForActivityType:(unint64_t)a3 isIndoor:(BOOL)a4 connectedToFitnessMachine:(BOOL)a5;
+ (id)observedTypesForActivityType:(unint64_t)a3 isIndoor:(BOOL)a4 connectedToFitnessMachine:(BOOL)a5 activityMode:(int64_t)a6;
@end

@implementation HKWorkoutDataSource

+ (BOOL)shouldObserveRunningMetricsForActivityMode:(int64_t)a3 isIndoor:(BOOL)a4 isGymKit:(BOOL)a5
{
  if (a3 == 2 || a4 || a5) {
    return 0;
  }
  else {
    return HKCoreMotionSupportsRunningMetrics();
  }
}

+ (id)_distanceTypeForActivityType:(unint64_t)a3 isIndoor:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = _HKWorkoutDistanceTypeForActivityType(a3);
  if (a3 - 16 <= 0x35 && ((1 << (a3 - 16)) & 0x30000010000001) != 0)
  {

    v6 = 0;
  }
  if (a3 - 25 <= 0x2E && ((1 << (a3 - 25)) & 0x600800004441) != 0 && v4)
  {

    v6 = 0;
  }

  return v6;
}

+ (id)_speedTypeForActivityType:(unint64_t)a3 isIndoor:(BOOL)a4 connectedToFitnessMachine:(BOOL)a5
{
  v8 = _HKWorkoutSpeedTypeForActivityType(a3);
  if ((uint64_t)a3 <= 36)
  {
    if (a3 != 31 && a3 != 35)
    {
LABEL_4:
      if (a3 != 13 || a4) {
        goto LABEL_11;
      }
LABEL_10:

      v8 = 0;
      goto LABEL_11;
    }
LABEL_9:
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (a3 != 37)
  {
    if (a3 != 60) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  if (a4 || a5) {
    goto LABEL_10;
  }
LABEL_11:

  return v8;
}

+ (id)observedTypesForActivityType:(unint64_t)a3 isIndoor:(BOOL)a4 connectedToFitnessMachine:(BOOL)a5
{
  return (id)[a1 observedTypesForActivityType:a3 isIndoor:a4 connectedToFitnessMachine:a5 activityMode:1];
}

+ (id)observedTypesForActivityType:(unint64_t)a3 isIndoor:(BOOL)a4 connectedToFitnessMachine:(BOOL)a5 activityMode:(int64_t)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (a3 != 84)
  {
    v12 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierHeartRate"];
    [v11 addObject:v12];
  }
  if (a6 != 2)
  {
    v13 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierActiveEnergyBurned"];
    [v11 addObject:v13];
    v14 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierBasalEnergyBurned"];
    [v11 addObject:v14];
    if (HKCoreMotionSupportsEstimatedWorkoutEffortForActivityType(a3, v8))
    {
      v15 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierEstimatedWorkoutEffortScore"];
      [v11 addObject:v15];
    }
  }
  v16 = [a1 _distanceTypeForActivityType:a3 isIndoor:v8];
  if (v16) {
    [v11 addObject:v16];
  }
  v17 = [a1 _speedTypeForActivityType:a3 isIndoor:v8 connectedToFitnessMachine:v7];
  if (v17) {
    [v11 addObject:v17];
  }
  if (a3 == 46)
  {
    v18 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierSwimmingStrokeCount"];
    [v11 addObject:v18];
    if (!HKCoreMotionSupportsWaterSubmersion())
    {
LABEL_25:

      goto LABEL_26;
    }
    goto LABEL_13;
  }
  if (a3 == 44 && v7)
  {
    v18 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierFlightsClimbed"];
    [v11 addObject:v18];
    v19 = &HKQuantityTypeIdentifierStepCount;
    goto LABEL_23;
  }
  if (a3 == 13)
  {
    v18 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierCyclingPower"];
    [v11 addObject:v18];
    v19 = &HKQuantityTypeIdentifierCyclingCadence;
    goto LABEL_23;
  }
  if (a3 == 84)
  {
    if (HKCoreMotionSupportsWaterSubmersion())
    {
      v18 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierUnderwaterDepth"];
      [v11 addObject:v18];
LABEL_13:
      v19 = &HKQuantityTypeIdentifierWaterTemperature;
LABEL_23:
      v20 = +[HKObjectType quantityTypeForIdentifier:*v19];
      [v11 addObject:v20];
      goto LABEL_24;
    }
  }
  else if (a3 == 37 {
         && [a1 shouldObserveRunningMetricsForActivityMode:a6 isIndoor:v8 isGymKit:v7])
  }
  {
    v18 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierRunningStrideLength"];
    [v11 addObject:v18];
    v20 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierRunningVerticalOscillation"];
    [v11 addObject:v20];
    v21 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierRunningGroundContactTime"];
    [v11 addObject:v21];
    v22 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierRunningPower"];
    [v11 addObject:v22];

LABEL_24:
    goto LABEL_25;
  }
LABEL_26:

  return v11;
}

+ (id)defaultConfigurationWithWorkoutConfiguration:(id)a3 activityMoveMode:(int64_t)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    uint64_t v40 = [v5 locationType];
    v37 = v6;
    BOOL v7 = +[HKWorkoutDataSource observedTypesForActivityType:isIndoor:connectedToFitnessMachine:activityMode:](HKWorkoutDataSource, "observedTypesForActivityType:isIndoor:connectedToFitnessMachine:activityMode:", [v6 activityType], v40 == 2, 0, a4);
    BOOL v8 = +[HKSource _localDeviceSource];
    v42 = +[HKQuery predicateForObjectsFromSource:v8];

    v9 = +[HKSource _blePeripheralSource];
    v38 = +[HKQuery predicateForObjectsFromSource:v9];

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v7;
    uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v44 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          id v16 = v42;
          if ([a1 _isBLECollectedDataType:v15 indoorWorkout:v40 == 2])
          {
            if (+[_HKBehavior isCollectBLETypesFromLocalSourceEnabled])
            {
              v17 = (void *)MEMORY[0x1E4F28BA0];
              v48[0] = v16;
              v48[1] = v38;
              uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
              id v19 = [v17 orPredicateWithSubpredicates:v18];

              id v16 = (id)v18;
            }
            else
            {
              id v19 = v38;
            }

            id v16 = v19;
          }
          v20 = +[_HKBehavior sharedBehavior];
          v21 = [v20 features];
          int v22 = [v21 pulse];

          if (v22 && [v15 code] == 5)
          {
            v23 = +[HKSource _blePeripheralSource];
            v24 = +[HKQuery predicateForObjectsFromSource:v23];

            v25 = (void *)MEMORY[0x1E4F28BA0];
            v47[0] = v16;
            v47[1] = v24;
            v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
            uint64_t v27 = [v25 orPredicateWithSubpredicates:v26];

            id v16 = (id)v27;
          }
          v28 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];
          v29 = objc_msgSend(v16, "hk_filterRepresentationForDataTypes:", v28);
          [v10 setObject:v29 forKeyedSubscript:v15];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v12);
    }
    v30 = obj;

    v31 = [HKWorkoutDataSourceConfiguration alloc];
    v32 = [MEMORY[0x1E4F1CAD0] set];
    v6 = v37;
    v33 = [(HKWorkoutDataSourceConfiguration *)v31 initWithWorkoutConfiguration:v37 sampleTypesToCollect:obj filters:v10 eventTypesToCollect:v32 collectsDefaultTypes:1];
  }
  else
  {
    v34 = [HKWorkoutDataSourceConfiguration alloc];
    v30 = [MEMORY[0x1E4F1CAD0] set];
    v35 = [MEMORY[0x1E4F1CAD0] set];
    v33 = [(HKWorkoutDataSourceConfiguration *)v34 initWithWorkoutConfiguration:0 sampleTypesToCollect:v30 filters:MEMORY[0x1E4F1CC08] eventTypesToCollect:v35 collectsDefaultTypes:1];
  }

  return v33;
}

+ (BOOL)_isBLECollectedDataType:(id)a3 indoorWorkout:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (_isBLECollectedDataType_indoorWorkout__onceToken != -1) {
    dispatch_once(&_isBLECollectedDataType_indoorWorkout__onceToken, &__block_literal_global_29);
  }
  v6 = (void *)_isBLECollectedDataType_indoorWorkout___bleCollectedTypes;
  BOOL v7 = [v5 identifier];
  char v8 = [v6 containsObject:v7];

  if ((v8 & 1) == 0 && v4)
  {
    v9 = [v5 identifier];
    char v8 = v9 == @"HKQuantityTypeIdentifierDistanceCycling";
  }
  return v8;
}

void __61__HKWorkoutDataSource__isBLECollectedDataType_indoorWorkout___block_invoke()
{
  v2[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"HKQuantityTypeIdentifierCyclingPower";
  v2[1] = @"HKQuantityTypeIdentifierCyclingCadence";
  v2[2] = @"HKQuantityTypeIdentifierCyclingSpeed";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];
  v1 = (void *)_isBLECollectedDataType_indoorWorkout___bleCollectedTypes;
  _isBLECollectedDataType_indoorWorkout___bleCollectedTypes = v0;
}

@end