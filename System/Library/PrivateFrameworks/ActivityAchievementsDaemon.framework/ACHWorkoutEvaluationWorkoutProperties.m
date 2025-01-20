@interface ACHWorkoutEvaluationWorkoutProperties
- (ACHWorkoutEvaluationWorkoutProperties)initWithWorkout:(id)a3;
- (BOOL)_workoutIsDuathlon:(id)a3;
- (BOOL)_workoutIsTriathlon:(id)a3 swimmingDistanceInKilometers:(double)a4 cyclingDistanceInKilometers:(double)a5 runningDistanceInKilometers:(double)a6;
- (BOOL)isDuathlon;
- (BOOL)isFiftyKilometerTriathlon;
- (BOOL)isFirstParty;
- (BOOL)isFullDistanceTriathlon;
- (BOOL)isHalfDistanceTriathlon;
- (BOOL)isIndoor;
- (BOOL)isSprintTriathlon;
- (double)best10KDuration;
- (double)best5KDuration;
- (double)bestHalfMarathonDuration;
- (double)bestMarathonDuration;
- (double)bestWheelchair10KDuration;
- (double)bestWheelchair5KDuration;
- (double)bestWheelchairHalfMarathonDuration;
- (double)bestWheelchairMarathonDuration;
- (double)duration;
- (double)elevationGained;
- (double)elevationGainedInMeters;
- (double)kilocalories;
- (double)kilometers;
- (double)meters;
- (id)_nonMetaActivitiesForWorkout:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)type;
@end

@implementation ACHWorkoutEvaluationWorkoutProperties

- (ACHWorkoutEvaluationWorkoutProperties)initWithWorkout:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)ACHWorkoutEvaluationWorkoutProperties;
  v5 = [(ACHWorkoutEvaluationWorkoutProperties *)&v43 init];
  if (v5)
  {
    v5->_type = [v4 workoutActivityType];
    [v4 duration];
    v5->_duration = v6;
    v7 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09BC0]];
    v8 = [v4 statisticsForType:v7];
    v9 = [v8 sumQuantity];
    v10 = [MEMORY[0x263F0A830] kilocalorieUnit];
    [v9 doubleValueForUnit:v10];
    v5->_kilocalories = v11;

    v12 = [v4 totalDistance];
    v13 = [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:9];
    [v12 doubleValueForUnit:v13];
    v5->_kilometers = v14;

    v15 = [v4 totalDistance];
    v16 = [MEMORY[0x263F0A830] meterUnit];
    [v15 doubleValueForUnit:v16];
    v5->_meters = v17;

    v18 = objc_msgSend(v4, "fi_elevationGain");
    v19 = [MEMORY[0x263F0A830] unitFromString:@"cm"];
    [v18 doubleValueForUnit:v19];
    v5->_elevationGained = v20;

    v21 = objc_msgSend(v4, "fi_elevationGain");
    v22 = [MEMORY[0x263F0A830] meterUnit];
    [v21 doubleValueForUnit:v22];
    v5->_elevationGainedInMeters = v23;

    v5->_isDuathlon = [(ACHWorkoutEvaluationWorkoutProperties *)v5 _workoutIsDuathlon:v4];
    BOOL v24 = [(ACHWorkoutEvaluationWorkoutProperties *)v5 _workoutIsTriathlon:v4 swimmingDistanceInKilometers:*MEMORY[0x263F23520] cyclingDistanceInKilometers:*MEMORY[0x263F23510] runningDistanceInKilometers:*MEMORY[0x263F23518]];
    v5->_isFullDistanceTriathlon = v24;
    if (v24)
    {
      int v25 = 0;
      v5->_isHalfDistanceTriathlon = 0;
    }
    else
    {
      BOOL v26 = [(ACHWorkoutEvaluationWorkoutProperties *)v5 _workoutIsTriathlon:v4 swimmingDistanceInKilometers:*MEMORY[0x263F23540] cyclingDistanceInKilometers:*MEMORY[0x263F23530] runningDistanceInKilometers:*MEMORY[0x263F23538]];
      v5->_isHalfDistanceTriathlon = v26;
      if (v26)
      {
        int v25 = 1;
      }
      else
      {
        if (!v5->_isFullDistanceTriathlon)
        {
          BOOL v42 = [(ACHWorkoutEvaluationWorkoutProperties *)v5 _workoutIsTriathlon:v4 swimmingDistanceInKilometers:*MEMORY[0x263F23500] cyclingDistanceInKilometers:*MEMORY[0x263F234F0] runningDistanceInKilometers:*MEMORY[0x263F234F8]];
          v5->_isFiftyKilometerTriathlon = v42;
          if (v42 || v5->_isHalfDistanceTriathlon) {
            goto LABEL_10;
          }
LABEL_9:
          if (!v5->_isFullDistanceTriathlon)
          {
            BOOL v27 = [(ACHWorkoutEvaluationWorkoutProperties *)v5 _workoutIsTriathlon:v4 swimmingDistanceInKilometers:*MEMORY[0x263F235E0] cyclingDistanceInKilometers:*MEMORY[0x263F235D0] runningDistanceInKilometers:*MEMORY[0x263F235D8]];
            goto LABEL_11;
          }
LABEL_10:
          BOOL v27 = 0;
LABEL_11:
          v5->_isSprintTriathlon = v27;
          v5->_isDuathlon = [(ACHWorkoutEvaluationWorkoutProperties *)v5 _workoutIsDuathlon:v4];
          objc_msgSend(v4, "aad_best5KDuration");
          v5->_best5KDuration = v28;
          objc_msgSend(v4, "aad_best10KDuration");
          v5->_best10KDuration = v29;
          objc_msgSend(v4, "aad_bestWheelchair5KDuration");
          v5->_bestWheelchair5KDuration = v30;
          objc_msgSend(v4, "aad_bestWheelchair10KDuration");
          v5->_bestWheelchair10KDuration = v31;
          objc_msgSend(v4, "aad_bestHalfMarathonDuration");
          v5->_bestHalfMarathonDuration = v32;
          objc_msgSend(v4, "aad_bestMarathonDuration");
          v5->_bestMarathonDuration = v33;
          objc_msgSend(v4, "aad_bestWheelchairHalfMarathonDuration");
          v5->_bestWheelchairHalfMarathonDuration = v34;
          objc_msgSend(v4, "aad_bestWheelchairMarathonDuration");
          v5->_bestWheelchairMarathonDuration = v35;
          v36 = [v4 sourceRevision];
          v37 = [v36 source];
          v5->_isFirstParty = [v37 _hasFirstPartyBundleID];

          v38 = [v4 metadata];
          v39 = [v38 objectForKeyedSubscript:*MEMORY[0x263F09AA0]];
          char v40 = [v39 BOOLValue];

          v5->_isIndoor = v40;
          goto LABEL_12;
        }
        int v25 = 0;
      }
    }
    v5->_isFiftyKilometerTriathlon = 0;
    if (v25) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_12:

  return v5;
}

- (id)_nonMetaActivitiesForWorkout:(id)a3
{
  v3 = [a3 workoutActivities];
  id v4 = objc_msgSend(v3, "hk_filter:", &__block_literal_global_13);

  return v4;
}

BOOL __70__ACHWorkoutEvaluationWorkoutProperties__nonMetaActivitiesForWorkout___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 workoutConfiguration];
  if ([v3 activityType] == 82)
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [v2 workoutConfiguration];
    BOOL v4 = [v5 activityType] != 83;
  }
  return v4;
}

- (BOOL)_workoutIsDuathlon:(id)a3
{
  id v4 = a3;
  if ([v4 workoutActivityType] == 82)
  {
    v5 = [(ACHWorkoutEvaluationWorkoutProperties *)self _nonMetaActivitiesForWorkout:v4];
    if ([v5 count] != 3)
    {
      LOBYTE(v18) = 0;
LABEL_26:

      goto LABEL_27;
    }
    double v6 = [v5 objectAtIndexedSubscript:0];
    v7 = [v5 objectAtIndexedSubscript:1];
    v8 = [v5 objectAtIndexedSubscript:2];
    v9 = [v6 workoutConfiguration];
    if ([v9 activityType] == 37)
    {
      v10 = [v7 workoutConfiguration];
      if ([v10 activityType] == 13)
      {
        double v11 = [v8 workoutConfiguration];
        uint64_t v12 = [v11 activityType];

        if (v12 != 37)
        {
          LOBYTE(v18) = 0;
LABEL_25:

          goto LABEL_26;
        }
        v9 = [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:9];
        double v13 = *MEMORY[0x263F234E0];
        v10 = [MEMORY[0x263F0A630] quantityWithUnit:v9 doubleValue:*MEMORY[0x263F234E0]];
        double v29 = [MEMORY[0x263F0A630] quantityWithUnit:v9 doubleValue:*MEMORY[0x263F234D8]];
        double v28 = [MEMORY[0x263F0A630] quantityWithUnit:v9 doubleValue:v13];
        uint64_t v14 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:*MEMORY[0x263F09DE0]];
        uint64_t v15 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:*MEMORY[0x263F09DB0]];
        int v25 = [v6 statisticsForType:v14];
        uint64_t v16 = [v25 sumQuantity];
        BOOL v26 = (void *)v15;
        BOOL v24 = [v7 statisticsForType:v15];
        double v30 = [v24 sumQuantity];
        BOOL v27 = (void *)v14;
        double v23 = [v8 statisticsForType:v14];
        double v17 = [v23 sumQuantity];
        v22 = (void *)v16;
        if (v16) {
          BOOL v18 = [v10 compare:v16] != 1;
        }
        else {
          BOOL v18 = 0;
        }
        if (v30) {
          BOOL v19 = objc_msgSend(v29, "compare:") != 1;
        }
        else {
          BOOL v19 = 0;
        }
        if (v17) {
          BOOL v20 = [v28 compare:v17] != 1;
        }
        else {
          BOOL v20 = 0;
        }
        if (v18) {
          LOBYTE(v18) = v19 && v20;
        }
      }
      else
      {
        LOBYTE(v18) = 0;
      }
    }
    else
    {
      LOBYTE(v18) = 0;
    }

    goto LABEL_25;
  }
  LOBYTE(v18) = 0;
LABEL_27:

  return v18;
}

- (BOOL)_workoutIsTriathlon:(id)a3 swimmingDistanceInKilometers:(double)a4 cyclingDistanceInKilometers:(double)a5 runningDistanceInKilometers:(double)a6
{
  id v10 = a3;
  if ([v10 workoutActivityType] == 82)
  {
    double v11 = [(ACHWorkoutEvaluationWorkoutProperties *)self _nonMetaActivitiesForWorkout:v10];
    if ([v11 count] != 3)
    {
      LOBYTE(v24) = 0;
LABEL_26:

      goto LABEL_27;
    }
    uint64_t v12 = [v11 objectAtIndexedSubscript:0];
    double v13 = [v11 objectAtIndexedSubscript:1];
    uint64_t v14 = [v11 objectAtIndexedSubscript:2];
    uint64_t v15 = [v12 workoutConfiguration];
    if ([v15 activityType] == 46)
    {
      uint64_t v16 = [v13 workoutConfiguration];
      if ([v16 activityType] == 13)
      {
        double v17 = [v14 workoutConfiguration];
        uint64_t v18 = [v17 activityType];

        if (v18 != 37)
        {
          LOBYTE(v24) = 0;
LABEL_25:

          goto LABEL_26;
        }
        uint64_t v15 = [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:9];
        uint64_t v16 = [MEMORY[0x263F0A630] quantityWithUnit:v15 doubleValue:a4];
        v36 = [MEMORY[0x263F0A630] quantityWithUnit:v15 doubleValue:a5];
        double v35 = [MEMORY[0x263F0A630] quantityWithUnit:v15 doubleValue:a6];
        uint64_t v19 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:*MEMORY[0x263F09DD8]];
        uint64_t v20 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:*MEMORY[0x263F09DB0]];
        uint64_t v21 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:*MEMORY[0x263F09DE0]];
        double v34 = (void *)v19;
        double v31 = [v12 statisticsForType:v19];
        uint64_t v22 = [v31 sumQuantity];
        double v33 = (void *)v20;
        double v30 = [v13 statisticsForType:v20];
        v37 = [v30 sumQuantity];
        double v32 = (void *)v21;
        double v29 = [v14 statisticsForType:v21];
        double v23 = [v29 sumQuantity];
        double v28 = (void *)v22;
        if (v22) {
          BOOL v24 = objc_msgSend(v16, "compare:", v22, v22) != 1;
        }
        else {
          BOOL v24 = 0;
        }
        if (v37) {
          BOOL v25 = objc_msgSend(v36, "compare:") != 1;
        }
        else {
          BOOL v25 = 0;
        }
        if (v23) {
          BOOL v26 = [v35 compare:v23] != 1;
        }
        else {
          BOOL v26 = 0;
        }
        if (v24) {
          LOBYTE(v24) = v25 && v26;
        }
      }
      else
      {
        LOBYTE(v24) = 0;
      }
    }
    else
    {
      LOBYTE(v24) = 0;
    }

    goto LABEL_25;
  }
  LOBYTE(v24) = 0;
LABEL_27:

  return v24;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v3 = a3;
  id v4 = ACHLogWorkouts();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[ACHWorkoutEvaluationWorkoutProperties valueForUndefinedKey:]((uint64_t)v3, v4);
  }

  return 0;
}

- (unint64_t)type
{
  return self->_type;
}

- (double)duration
{
  return self->_duration;
}

- (double)kilocalories
{
  return self->_kilocalories;
}

- (double)kilometers
{
  return self->_kilometers;
}

- (double)meters
{
  return self->_meters;
}

- (double)elevationGained
{
  return self->_elevationGained;
}

- (double)elevationGainedInMeters
{
  return self->_elevationGainedInMeters;
}

- (BOOL)isDuathlon
{
  return self->_isDuathlon;
}

- (BOOL)isSprintTriathlon
{
  return self->_isSprintTriathlon;
}

- (BOOL)isFiftyKilometerTriathlon
{
  return self->_isFiftyKilometerTriathlon;
}

- (BOOL)isHalfDistanceTriathlon
{
  return self->_isHalfDistanceTriathlon;
}

- (BOOL)isFullDistanceTriathlon
{
  return self->_isFullDistanceTriathlon;
}

- (double)best5KDuration
{
  return self->_best5KDuration;
}

- (double)best10KDuration
{
  return self->_best10KDuration;
}

- (double)bestWheelchair5KDuration
{
  return self->_bestWheelchair5KDuration;
}

- (double)bestWheelchair10KDuration
{
  return self->_bestWheelchair10KDuration;
}

- (double)bestHalfMarathonDuration
{
  return self->_bestHalfMarathonDuration;
}

- (double)bestMarathonDuration
{
  return self->_bestMarathonDuration;
}

- (double)bestWheelchairHalfMarathonDuration
{
  return self->_bestWheelchairHalfMarathonDuration;
}

- (double)bestWheelchairMarathonDuration
{
  return self->_bestWheelchairMarathonDuration;
}

- (BOOL)isFirstParty
{
  return self->_isFirstParty;
}

- (BOOL)isIndoor
{
  return self->_isIndoor;
}

- (void)valueForUndefinedKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_FAULT, "Workout Evaluation workout properties asked for key it doesn't support: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end