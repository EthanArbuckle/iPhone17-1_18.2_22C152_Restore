@interface SAHLStartWorkout
- (id)_ad_transformedWorkoutRequest;
- (id)_ad_transformedWorkoutSuccessResponse;
@end

@implementation SAHLStartWorkout

- (id)_ad_transformedWorkoutSuccessResponse
{
  id v2 = objc_alloc_init((Class)SACommandSucceeded);
  return v2;
}

- (id)_ad_transformedWorkoutRequest
{
  v3 = [(SAHLStartWorkout *)self workoutType];
  v4 = [v3 workoutCategory];

  if ([v4 isEqualToString:SAHLWorkoutCategoryCyclingValue])
  {
    uint64_t v5 = 2;
LABEL_15:
    uint64_t v32 = v5;
    goto LABEL_16;
  }
  if ([v4 isEqualToString:SAHLWorkoutCategoryEllipticalValue])
  {
    uint64_t v5 = 3;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:SAHLWorkoutCategoryRowerValue])
  {
    uint64_t v5 = 4;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:SAHLWorkoutCategoryRunningValue])
  {
    uint64_t v5 = 5;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:SAHLWorkoutCategoryStair_StepperValue])
  {
    uint64_t v5 = 6;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:SAHLWorkoutCategoryWalkingValue])
  {
    uint64_t v5 = 7;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:SAHLWorkoutCategoryOtherValue])
  {
    uint64_t v5 = 1;
    goto LABEL_15;
  }
  [v4 isEqualToString:SAHLWorkoutCategoryUnspecifiedValue];
  uint64_t v32 = 0;
LABEL_16:
  v6 = [(SAHLStartWorkout *)self workoutType];
  v7 = [v6 workoutLocationType];

  if ([v7 isEqualToString:SAHLWorkoutLocationTypeIndoorValue])
  {
    uint64_t v8 = 1;
  }
  else
  {
    unsigned int v9 = [v7 isEqualToString:SAHLWorkoutLocationTypeOutdoorValue];
    uint64_t v8 = 2;
    if (!v9) {
      uint64_t v8 = 0;
    }
  }
  uint64_t v31 = v8;
  v10 = [(SAHLStartWorkout *)self workoutUserMode];
  unsigned int v11 = [v10 isEqualToString:SAHLWorkoutUserModeWheelchairValue];

  v12 = [(SAHLStartWorkout *)self workoutGoal];
  v13 = [v12 workoutGoalUnitType];

  if ([v13 isEqualToString:SAHLWorkoutGoalUnitTypeInchValue])
  {
    uint64_t v14 = +[HKUnit inchUnit];
LABEL_41:
    v15 = (void *)v14;
    goto LABEL_42;
  }
  if ([v13 isEqualToString:SAHLWorkoutGoalUnitTypeMeterValue])
  {
    uint64_t v14 = +[HKUnit meterUnit];
    goto LABEL_41;
  }
  if ([v13 isEqualToString:SAHLWorkoutGoalUnitTypeFootValue])
  {
    uint64_t v14 = +[HKUnit footUnit];
    goto LABEL_41;
  }
  if ([v13 isEqualToString:SAHLWorkoutGoalUnitTypeYardsValue])
  {
    uint64_t v14 = +[HKUnit yardUnit];
    goto LABEL_41;
  }
  if ([v13 isEqualToString:SAHLWorkoutGoalUnitTypeMileValue])
  {
    uint64_t v14 = +[HKUnit mileUnit];
    goto LABEL_41;
  }
  if ([v13 isEqualToString:SAHLWorkoutGoalUnitTypeSecondValue])
  {
    uint64_t v14 = +[HKUnit secondUnit];
    goto LABEL_41;
  }
  if ([v13 isEqualToString:SAHLWorkoutGoalUnitTypeMinuteValue])
  {
    uint64_t v14 = +[HKUnit minuteUnit];
    goto LABEL_41;
  }
  if ([v13 isEqualToString:SAHLWorkoutGoalUnitTypeHourValue])
  {
    uint64_t v14 = +[HKUnit hourUnit];
    goto LABEL_41;
  }
  if ([v13 isEqualToString:SAHLWorkoutGoalUnitTypeJouleValue])
  {
    uint64_t v14 = +[HKUnit jouleUnit];
    goto LABEL_41;
  }
  if ([v13 isEqualToString:SAHLWorkoutGoalUnitTypeKiloCalorieValue])
  {
    uint64_t v14 = +[HKUnit kilocalorieUnit];
    goto LABEL_41;
  }
  v15 = 0;
LABEL_42:
  v16 = [(SAHLStartWorkout *)self workoutGoal];
  [v16 goalValue];
  v17 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v15);

  v18 = +[HKUnit meterUnit];
  unsigned __int8 v19 = [v17 isCompatibleWithUnit:v18];

  if (v19)
  {
    uint64_t v20 = 2;
  }
  else
  {
    v21 = +[HKUnit kilocalorieUnit];
    unsigned __int8 v22 = [v17 isCompatibleWithUnit:v21];

    if (v22)
    {
      uint64_t v20 = 1;
    }
    else
    {
      v23 = +[HKUnit secondUnit];
      unsigned int v24 = [v17 isCompatibleWithUnit:v23];

      if (v24) {
        uint64_t v20 = 3;
      }
      else {
        uint64_t v20 = 0;
      }
    }
  }
  uint64_t v25 = v11;
  id v26 = objc_alloc((Class)STStartWorkoutRequest);
  id v27 = [(SAHLStartWorkout *)self isOpenGoal];
  LOBYTE(v30) = [(SAHLStartWorkout *)self skipActivitySetup];
  id v28 = [v26 _initWithType:v32 location:v31 goal:v17 goalType:v20 userMode:v25 isOpenGoal:v27 skipActivitySetup:v30];

  return v28;
}

@end