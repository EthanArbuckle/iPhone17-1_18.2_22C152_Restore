@interface HKWorkout(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport;
- (HDCodableWorkout)codableRepresentationForSync;
@end

@implementation HKWorkout(HDCodingSupport)

- (HDCodableWorkout)codableRepresentationForSync
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(HDCodableWorkout);
  v23.receiver = a1;
  v23.super_class = (Class)&off_1F187B540;
  v3 = objc_msgSendSuper2(&v23, sel_codableRepresentationForSync);
  [(HDCodableWorkout *)v2 setSample:v3];

  -[HDCodableWorkout setType:](v2, "setType:", [a1 workoutActivityType]);
  if (a1)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v4 = [a1 workoutEvents];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      v7 = 0;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v4);
          }
          v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (!v7)
          {
            v7 = [MEMORY[0x1E4F1CA48] array];
          }
          v11 = [v10 codableRepresentationForSync];
          if (v11) {
            [v7 addObject:v11];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  [(HDCodableWorkout *)v2 setEvents:v7];

  [a1 duration];
  -[HDCodableWorkout setDuration:](v2, "setDuration:");
  v12 = [a1 totalEnergyBurned];

  if (v12)
  {
    [a1 _totalEnergyBurnedInCanonicalUnit];
    -[HDCodableWorkout setTotalEnergyBurnedInCanonicalUnit:](v2, "setTotalEnergyBurnedInCanonicalUnit:");
  }
  v13 = [a1 _totalBasalEnergyBurned];

  if (v13)
  {
    [a1 _totalBasalEnergyBurnedInCanonicalUnit];
    -[HDCodableWorkout setTotalBasalEnergyBurnedInCanonicalUnit:](v2, "setTotalBasalEnergyBurnedInCanonicalUnit:");
  }
  v14 = [a1 totalDistance];

  if (v14)
  {
    [a1 _totalDistanceInCanonicalUnit];
    -[HDCodableWorkout setTotalDistanceInCanonicalUnit:](v2, "setTotalDistanceInCanonicalUnit:");
  }
  v15 = [a1 totalSwimmingStrokeCount];

  if (v15)
  {
    [a1 _totalSwimmingStrokeCountInCanonicalUnit];
    -[HDCodableWorkout setTotalSwimmingStrokeCountInCanonicalUnit:](v2, "setTotalSwimmingStrokeCountInCanonicalUnit:");
  }
  v16 = [a1 totalFlightsClimbed];

  if (v16)
  {
    [a1 _totalFlightsClimbedInCanonicalUnit];
    -[HDCodableWorkout setTotalFlightsClimbedInCanonicalUnit:](v2, "setTotalFlightsClimbedInCanonicalUnit:");
  }
  v17 = [a1 _goal];

  if (v17)
  {
    -[HDCodableWorkout setGoalType:](v2, "setGoalType:", [a1 _goalType]);
    [a1 _goalInCanonicalUnit];
    -[HDCodableWorkout setGoal:](v2, "setGoal:");
  }
  v18 = [a1 _primaryActivity];
  v19 = +[HDCodableWorkoutActivity codableForWorkoutActivity:v18];
  [(HDCodableWorkout *)v2 setPrimaryActivity:v19];

  v20 = [a1 _subActivities];
  v21 = +[HDCodableWorkoutActivity codablesForWorkoutActivities:v20];
  [(HDCodableWorkout *)v2 setSubActivities:v21];

  return v2;
}

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4 = a3;
  uint64_t v5 = [a1 codableRepresentationForSync];
  if (v5) {
    [v4 addWorkouts:v5];
  }

  return v5 != 0;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = (void *)[[a1 alloc] _init];
    if ([v5 applyToObject:v6])
    {
      uint64_t v7 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
      v9 = objc_msgSend(v6, "_validateWithConfiguration:", v7, v8);
      if (v9) {
        v10 = 0;
      }
      else {
        v10 = v6;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

@end