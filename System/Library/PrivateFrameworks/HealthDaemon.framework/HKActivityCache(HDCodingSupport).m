@interface HKActivityCache(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (BOOL)addCodableRepresentationToCollectionForSync:()HDCodingSupport;
- (HDCodableActivityCache)codableRepresentationForSync;
- (uint64_t)addCodableRepresentationToCollectionForJournal:()HDCodingSupport;
@end

@implementation HKActivityCache(HDCodingSupport)

- (uint64_t)addCodableRepresentationToCollectionForJournal:()HDCodingSupport
{
  id v4 = a3;
  if (a1
    && ([a1 codableRepresentationForSync], (a1 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v4 addActivityCaches:a1];
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (HDCodableActivityCache)codableRepresentationForSync
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(HDCodableActivityCache);
  v37.receiver = a1;
  v37.super_class = (Class)&off_1F187ACB0;
  v3 = objc_msgSendSuper2(&v37, sel_codableRepresentationForSync);
  [(HDCodableActivityCache *)v2 setSample:v3];
  -[HDCodableActivityCache setCacheIndex:](v2, "setCacheIndex:", [a1 cacheIndex]);
  -[HDCodableActivityCache setSequence:](v2, "setSequence:", [a1 sequence]);
  if ([a1 hasEnergyBurned])
  {
    [a1 _energyBurnedInKilocalories];
    -[HDCodableActivityCache setEnergyBurned:](v2, "setEnergyBurned:");
  }
  if ([a1 hasMoveMinutes])
  {
    [a1 moveMinutes];
    -[HDCodableActivityCache setMoveMinutes:](v2, "setMoveMinutes:");
  }
  if ([a1 hasBriskMinutes])
  {
    [a1 briskMinutes];
    -[HDCodableActivityCache setBriskMinutes:](v2, "setBriskMinutes:");
  }
  if ([a1 hasActiveHours])
  {
    [a1 activeHours];
    -[HDCodableActivityCache setActiveHours:](v2, "setActiveHours:");
  }
  if ([a1 hasStepCount]) {
    -[HDCodableActivityCache setStepCount:](v2, "setStepCount:", [a1 stepCount]);
  }
  if ([a1 hasEnergyBurnedGoal])
  {
    [a1 _energyBurnedGoalInKilocalories];
    -[HDCodableActivityCache setEnergyBurnedGoal:](v2, "setEnergyBurnedGoal:");
    id v4 = [a1 energyBurnedGoalDate];
    [v4 timeIntervalSinceReferenceDate];
    -[HDCodableActivityCache setEnergyBurnedGoalDate:](v2, "setEnergyBurnedGoalDate:");
  }
  if ([a1 hasMoveMinutesGoal])
  {
    [a1 _moveMinutesGoalInMinutes];
    -[HDCodableActivityCache setMoveMinutesGoal:](v2, "setMoveMinutesGoal:");
    uint64_t v5 = [a1 moveMinutesGoalDate];
    [v5 timeIntervalSinceReferenceDate];
    -[HDCodableActivityCache setMoveMinutesGoalDate:](v2, "setMoveMinutesGoalDate:");
  }
  if ([a1 hasBriskMinutesGoal])
  {
    [a1 _briskMinutesGoalInMinutes];
    -[HDCodableActivityCache setBriskMinutesGoal:](v2, "setBriskMinutesGoal:");
  }
  if ([a1 hasActiveHoursGoal])
  {
    [a1 _activeHoursGoalCount];
    -[HDCodableActivityCache setActiveHoursGoal:](v2, "setActiveHoursGoal:");
  }
  if ([a1 hasWalkingAndRunningDistance])
  {
    [a1 _walkingAndRunningDistanceInMeters];
    -[HDCodableActivityCache setWalkingAndRunningDistance:](v2, "setWalkingAndRunningDistance:");
  }
  if ([a1 hasFlightsClimbed]) {
    -[HDCodableActivityCache setFlightsClimbed:](v2, "setFlightsClimbed:", [a1 flightsClimbed]);
  }
  if ([a1 hasDeepBreathingDuration])
  {
    [a1 deepBreathingDuration];
    -[HDCodableActivityCache setDeepBreathingDuration:](v2, "setDeepBreathingDuration:");
  }
  if ([a1 hasPushCount]) {
    -[HDCodableActivityCache setPushCount:](v2, "setPushCount:", [a1 pushCount]);
  }
  if ([a1 hasWheelchairUse]) {
    -[HDCodableActivityCache setWheelchairUse:](v2, "setWheelchairUse:", [a1 wheelchairUse]);
  }
  -[HDCodableActivityCache setActivityMoveMode:](v2, "setActivityMoveMode:", [a1 activityMoveMode]);
  -[HDCodableActivityCache setPaused:](v2, "setPaused:", [a1 isPaused]);
  -[HDCodableActivityCache setVersion:](v2, "setVersion:", [a1 version]);
  if ([a1 hasDailyEnergyBurnedStatistics])
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v6 = [a1 dailyEnergyBurnedStatistics];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v40 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v33 + 1) + 8 * i) codableRepresentationForSync];
          [(HDCodableActivityCache *)v2 addDailyEnergyBurnedStatistics:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v40 count:16];
      }
      while (v8);
    }
  }
  if ([a1 hasDailyMoveMinutesStatistics])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v12 = [a1 dailyMoveMinutesStatistics];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v29 + 1) + 8 * j) codableRepresentationForSync];
          [(HDCodableActivityCache *)v2 addDailyMoveMinutesStatistics:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v39 count:16];
      }
      while (v14);
    }
  }
  if ([a1 hasDailyBriskMinutesStatistics])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v18 = objc_msgSend(a1, "dailyBriskMinutesStatistics", 0);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v38 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (uint64_t k = 0; k != v20; ++k)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [*(id *)(*((void *)&v25 + 1) + 8 * k) codableRepresentationForSync];
          [(HDCodableActivityCache *)v2 addDailyBriskMinutesStatistics:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v38 count:16];
      }
      while (v20);
    }
  }

  return v2;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = (void *)[[a1 alloc] _init];
    if ([v5 applyToObject:v6]
      && (uint64_t v7 = HKDefaultObjectValidationConfigurationIgnoringAllOptions(),
          objc_msgSend(v6, "_validateWithConfiguration:", v7, v8),
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          !v9))
    {
      id v10 = v6;
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)addCodableRepresentationToCollectionForSync:()HDCodingSupport
{
  id v4 = a3;
  id v5 = [a1 codableRepresentationForSync];
  if (v5) {
    [v4 addActivityCaches:v5];
  }

  return v5 != 0;
}

@end