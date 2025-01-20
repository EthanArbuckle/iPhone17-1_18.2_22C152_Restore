@interface ACHActivityAwardingDataProvider
- ($A5E8A54F69D71102DC6A95EAED28A9DA)_baseMoveState;
- ($A5E8A54F69D71102DC6A95EAED28A9DA)currentExerciseState;
- ($A5E8A54F69D71102DC6A95EAED28A9DA)currentMoveState;
- ($A5E8A54F69D71102DC6A95EAED28A9DA)currentMoveTimeState;
- ($A5E8A54F69D71102DC6A95EAED28A9DA)currentStandState;
- ($A5E8A54F69D71102DC6A95EAED28A9DA)currentStateForGoalType:(SEL)a3;
- (ACHActivityAwardingDataProvider)init;
- (ACHDataStoreActivityProperties)properties;
- (BOOL)allGoalsMetToday;
- (BOOL)ringsPausedToday;
- (HKActivitySummary)todayActivitySummary;
- (HKActivitySummary)yesterdayActivitySummary;
- (HKQuantity)lastProcessedTodayExerciseValue;
- (HKQuantity)lastProcessedTodayMoveTimeValue;
- (HKQuantity)lastProcessedTodayMoveValue;
- (HKQuantity)lastProcessedTodayStandValue;
- (HKQuantity)lastTodayDistanceValue;
- (HKQuantity)lastTodayExerciseGoal;
- (HKQuantity)lastTodayMoveGoal;
- (HKQuantity)lastTodayMoveTimeGoal;
- (HKQuantity)lastTodayStandGoal;
- (HKQuantity)previousProcessedTodayExerciseValue;
- (HKQuantity)previousProcessedTodayMoveTimeValue;
- (HKQuantity)previousProcessedTodayMoveValue;
- (HKQuantity)previousProcessedTodayStandValue;
- (HKQuantity)todayDistanceValue;
- (HKQuantity)todayExerciseGoal;
- (HKQuantity)todayExerciseValue;
- (HKQuantity)todayMoveGoal;
- (HKQuantity)todayMoveTimeGoal;
- (HKQuantity)todayMoveTimeValue;
- (HKQuantity)todayMoveValue;
- (HKQuantity)todayStandGoal;
- (HKQuantity)todayStandValue;
- (HKQuantity)yesterdayExerciseGoal;
- (HKQuantity)yesterdayExerciseValue;
- (HKQuantity)yesterdayMoveGoal;
- (HKQuantity)yesterdayMoveTimeGoal;
- (HKQuantity)yesterdayMoveTimeValue;
- (HKQuantity)yesterdayMoveValue;
- (HKQuantity)yesterdayStandGoal;
- (HKQuantity)yesterdayStandValue;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)initialPropertyCheckpointIndex;
- (int64_t)lastCheckedIndexForAllGoals;
- (int64_t)lastCheckedIndexForDistance;
- (int64_t)lastCheckedIndexForExercise;
- (int64_t)lastCheckedIndexForMove;
- (int64_t)lastCheckedIndexForStand;
- (int64_t)todayIndex;
- (void)_setBaseMoveState:(id *)a3;
- (void)clearAllProperties;
- (void)setInitialPropertyCheckpointIndex:(int64_t)a3;
- (void)setLastCheckedIndex:(int64_t)a3;
- (void)setLastCheckedIndexForAllGoals:(int64_t)a3;
- (void)setLastCheckedIndexForDistance:(int64_t)a3;
- (void)setLastCheckedIndexForExercise:(int64_t)a3;
- (void)setLastCheckedIndexForMove:(int64_t)a3;
- (void)setLastCheckedIndexForStand:(int64_t)a3;
- (void)setLastProcessedTodayExerciseValue:(id)a3;
- (void)setLastProcessedTodayMoveTimeValue:(id)a3;
- (void)setLastProcessedTodayMoveValue:(id)a3;
- (void)setLastProcessedTodayStandValue:(id)a3;
- (void)setLastTodayDistanceValue:(id)a3;
- (void)setLastTodayExerciseGoal:(id)a3;
- (void)setLastTodayMoveGoal:(id)a3;
- (void)setLastTodayMoveTimeGoal:(id)a3;
- (void)setLastTodayStandGoal:(id)a3;
- (void)setNewExerciseState:(id *)a3;
- (void)setNewMoveState:(id *)a3;
- (void)setNewMoveTimeState:(id *)a3;
- (void)setNewStandState:(id *)a3;
- (void)setNewState:(id *)a3 forGoalType:(int64_t)a4;
- (void)setPreviousProcessedTodayExerciseValue:(id)a3;
- (void)setPreviousProcessedTodayMoveTimeValue:(id)a3;
- (void)setPreviousProcessedTodayMoveValue:(id)a3;
- (void)setPreviousProcessedTodayStandValue:(id)a3;
- (void)setTodayActivitySummary:(id)a3;
- (void)setYesterdayActivitySummary:(id)a3;
- (void)updatePreviousPropertiesWithCurrentProperties;
@end

@implementation ACHActivityAwardingDataProvider

- (HKQuantity)todayMoveTimeGoal
{
  v2 = [(ACHActivityAwardingDataProvider *)self todayActivitySummary];
  v3 = [v2 appleMoveTimeGoal];

  return (HKQuantity *)v3;
}

- (HKQuantity)todayExerciseValue
{
  v2 = [(ACHActivityAwardingDataProvider *)self todayActivitySummary];
  v3 = [v2 appleExerciseTime];

  return (HKQuantity *)v3;
}

- (ACHDataStoreActivityProperties)properties
{
  return self->_properties;
}

- (HKQuantity)todayMoveTimeValue
{
  v2 = [(ACHActivityAwardingDataProvider *)self todayActivitySummary];
  v3 = [v2 appleMoveTime];

  return (HKQuantity *)v3;
}

- (HKQuantity)todayMoveGoal
{
  v2 = [(ACHActivityAwardingDataProvider *)self todayActivitySummary];
  v3 = [v2 activeEnergyBurnedGoal];

  return (HKQuantity *)v3;
}

- (HKQuantity)todayMoveValue
{
  v2 = [(ACHActivityAwardingDataProvider *)self todayActivitySummary];
  v3 = [v2 activeEnergyBurned];

  return (HKQuantity *)v3;
}

- (HKActivitySummary)todayActivitySummary
{
  return self->_todayActivitySummary;
}

- (ACHActivityAwardingDataProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACHActivityAwardingDataProvider;
  v2 = [(ACHActivityAwardingDataProvider *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(ACHDataStoreActivityProperties);
    properties = v2->_properties;
    v2->_properties = v3;
  }
  return v2;
}

- (void)updatePreviousPropertiesWithCurrentProperties
{
  v3 = [(ACHDataStoreActivityProperties *)self->_properties previousValues];

  if (!v3)
  {
    id v4 = objc_alloc_init((Class)objc_opt_class());
    [(ACHDataStoreActivityProperties *)self->_properties setPreviousValues:v4];
  }
  id v6 = [(ACHDataStoreActivityProperties *)self->_properties previousValues];
  v5 = [(ACHDataStoreActivityProperties *)self->_properties dictionaryRepresentation];
  [v6 setValuesForKeysWithDictionary:v5];
}

- (void)clearAllProperties
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(ACHDataStoreActivityProperties *)self->_properties dictionaryKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(ACHDataStoreActivityProperties *)self->_properties setValue:&unk_26D1163B8 forKey:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(ACHDataStoreActivityProperties *)self->_properties setPreviousValues:0];
}

- (void)setLastCheckedIndex:(int64_t)a3
{
  -[ACHActivityAwardingDataProvider setLastCheckedIndexForMove:](self, "setLastCheckedIndexForMove:");
  [(ACHActivityAwardingDataProvider *)self setLastCheckedIndexForExercise:a3];
  [(ACHActivityAwardingDataProvider *)self setLastCheckedIndexForStand:a3];
  [(ACHActivityAwardingDataProvider *)self setLastCheckedIndexForAllGoals:a3];
  [(ACHActivityAwardingDataProvider *)self setLastCheckedIndexForDistance:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[ACHActivityAwardingDataProvider allocWithZone:a3] init];
  uint64_t v5 = [(ACHActivityAwardingDataProvider *)self todayActivitySummary];
  [(ACHActivityAwardingDataProvider *)v4 setTodayActivitySummary:v5];

  uint64_t v6 = [(ACHActivityAwardingDataProvider *)self yesterdayActivitySummary];
  [(ACHActivityAwardingDataProvider *)v4 setYesterdayActivitySummary:v6];

  uint64_t v7 = [(ACHActivityAwardingDataProvider *)v4 properties];
  long long v8 = [(ACHActivityAwardingDataProvider *)self properties];
  long long v9 = [v8 dictionaryRepresentation];
  [v7 setValuesForKeysWithDictionary:v9];

  [(ACHActivityAwardingDataProvider *)v4 setLastCheckedIndexForMove:[(ACHActivityAwardingDataProvider *)self lastCheckedIndexForMove]];
  long long v10 = [(ACHActivityAwardingDataProvider *)self lastProcessedTodayMoveValue];
  [(ACHActivityAwardingDataProvider *)v4 setLastProcessedTodayMoveValue:v10];

  long long v11 = [(ACHActivityAwardingDataProvider *)self previousProcessedTodayMoveValue];
  [(ACHActivityAwardingDataProvider *)v4 setPreviousProcessedTodayMoveValue:v11];

  v12 = [(ACHActivityAwardingDataProvider *)self lastTodayMoveGoal];
  [(ACHActivityAwardingDataProvider *)v4 setLastTodayMoveGoal:v12];

  [(ACHActivityAwardingDataProvider *)v4 setLastCheckedIndexForExercise:[(ACHActivityAwardingDataProvider *)self lastCheckedIndexForExercise]];
  uint64_t v13 = [(ACHActivityAwardingDataProvider *)self lastProcessedTodayExerciseValue];
  [(ACHActivityAwardingDataProvider *)v4 setLastProcessedTodayExerciseValue:v13];

  v14 = [(ACHActivityAwardingDataProvider *)self previousProcessedTodayExerciseValue];
  [(ACHActivityAwardingDataProvider *)v4 setPreviousProcessedTodayExerciseValue:v14];

  v15 = [(ACHActivityAwardingDataProvider *)self lastTodayExerciseGoal];
  [(ACHActivityAwardingDataProvider *)v4 setLastTodayExerciseGoal:v15];

  [(ACHActivityAwardingDataProvider *)v4 setLastCheckedIndexForStand:[(ACHActivityAwardingDataProvider *)self lastCheckedIndexForStand]];
  v16 = [(ACHActivityAwardingDataProvider *)self lastProcessedTodayStandValue];
  [(ACHActivityAwardingDataProvider *)v4 setLastProcessedTodayStandValue:v16];

  v17 = [(ACHActivityAwardingDataProvider *)self previousProcessedTodayStandValue];
  [(ACHActivityAwardingDataProvider *)v4 setPreviousProcessedTodayStandValue:v17];

  v18 = [(ACHActivityAwardingDataProvider *)self lastTodayStandGoal];
  [(ACHActivityAwardingDataProvider *)v4 setLastTodayStandGoal:v18];

  [(ACHActivityAwardingDataProvider *)v4 setLastCheckedIndexForAllGoals:[(ACHActivityAwardingDataProvider *)self lastCheckedIndexForAllGoals]];
  [(ACHActivityAwardingDataProvider *)v4 setLastCheckedIndexForDistance:[(ACHActivityAwardingDataProvider *)self lastCheckedIndexForDistance]];
  v19 = [(ACHActivityAwardingDataProvider *)self lastTodayDistanceValue];
  [(ACHActivityAwardingDataProvider *)v4 setLastTodayDistanceValue:v19];

  return v4;
}

- (int64_t)todayIndex
{
  v2 = [(ACHActivityAwardingDataProvider *)self todayActivitySummary];
  int64_t v3 = [v2 _activitySummaryIndex];

  return v3;
}

- (BOOL)ringsPausedToday
{
  v2 = [(ACHActivityAwardingDataProvider *)self todayActivitySummary];
  char v3 = [v2 isPaused];

  return v3;
}

- ($A5E8A54F69D71102DC6A95EAED28A9DA)currentStateForGoalType:(SEL)a3
{
  switch(a4)
  {
    case 0:
      self = ($A5E8A54F69D71102DC6A95EAED28A9DA *)[($A5E8A54F69D71102DC6A95EAED28A9DA *)self currentMoveState];
      break;
    case 1:
      self = ($A5E8A54F69D71102DC6A95EAED28A9DA *)[($A5E8A54F69D71102DC6A95EAED28A9DA *)self currentExerciseState];
      break;
    case 2:
      self = ($A5E8A54F69D71102DC6A95EAED28A9DA *)[($A5E8A54F69D71102DC6A95EAED28A9DA *)self currentStandState];
      break;
    case 3:
      self = ($A5E8A54F69D71102DC6A95EAED28A9DA *)[($A5E8A54F69D71102DC6A95EAED28A9DA *)self currentMoveTimeState];
      break;
    default:
      return self;
  }
  return self;
}

- (void)setNewState:(id *)a3 forGoalType:(int64_t)a4
{
  uint64_t v31 = v4;
  uint64_t v32 = v5;
  switch(a4)
  {
    case 0:
      long long v6 = *(_OWORD *)&a3->var14;
      long long v28 = *(_OWORD *)&a3->var12;
      long long v29 = v6;
      long long v30 = *(_OWORD *)&a3->var16;
      long long v7 = *(_OWORD *)&a3->var6;
      long long v24 = *(_OWORD *)&a3->var4;
      long long v25 = v7;
      long long v8 = *(_OWORD *)&a3->var10;
      long long v26 = *(_OWORD *)&a3->var8;
      long long v27 = v8;
      long long v9 = *(_OWORD *)&a3->var2;
      long long v22 = *(_OWORD *)&a3->var0;
      long long v23 = v9;
      [(ACHActivityAwardingDataProvider *)self setNewMoveState:&v22];
      break;
    case 1:
      long long v10 = *(_OWORD *)&a3->var14;
      long long v28 = *(_OWORD *)&a3->var12;
      long long v29 = v10;
      long long v30 = *(_OWORD *)&a3->var16;
      long long v11 = *(_OWORD *)&a3->var6;
      long long v24 = *(_OWORD *)&a3->var4;
      long long v25 = v11;
      long long v12 = *(_OWORD *)&a3->var10;
      long long v26 = *(_OWORD *)&a3->var8;
      long long v27 = v12;
      long long v13 = *(_OWORD *)&a3->var2;
      long long v22 = *(_OWORD *)&a3->var0;
      long long v23 = v13;
      [(ACHActivityAwardingDataProvider *)self setNewExerciseState:&v22];
      break;
    case 2:
      long long v14 = *(_OWORD *)&a3->var14;
      long long v28 = *(_OWORD *)&a3->var12;
      long long v29 = v14;
      long long v30 = *(_OWORD *)&a3->var16;
      long long v15 = *(_OWORD *)&a3->var6;
      long long v24 = *(_OWORD *)&a3->var4;
      long long v25 = v15;
      long long v16 = *(_OWORD *)&a3->var10;
      long long v26 = *(_OWORD *)&a3->var8;
      long long v27 = v16;
      long long v17 = *(_OWORD *)&a3->var2;
      long long v22 = *(_OWORD *)&a3->var0;
      long long v23 = v17;
      [(ACHActivityAwardingDataProvider *)self setNewStandState:&v22];
      break;
    case 3:
      long long v18 = *(_OWORD *)&a3->var14;
      long long v28 = *(_OWORD *)&a3->var12;
      long long v29 = v18;
      long long v30 = *(_OWORD *)&a3->var16;
      long long v19 = *(_OWORD *)&a3->var6;
      long long v24 = *(_OWORD *)&a3->var4;
      long long v25 = v19;
      long long v20 = *(_OWORD *)&a3->var10;
      long long v26 = *(_OWORD *)&a3->var8;
      long long v27 = v20;
      long long v21 = *(_OWORD *)&a3->var2;
      long long v22 = *(_OWORD *)&a3->var0;
      long long v23 = v21;
      [(ACHActivityAwardingDataProvider *)self setNewMoveTimeState:&v22];
      break;
    default:
      return;
  }
}

- ($A5E8A54F69D71102DC6A95EAED28A9DA)currentMoveState
{
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  [(ACHActivityAwardingDataProvider *)self _baseMoveState];
  id v7 = [(ACHActivityAwardingDataProvider *)self properties];
  [v7 bestMoveGoalValue];
  retstr->var15 = v5;

  return result;
}

- ($A5E8A54F69D71102DC6A95EAED28A9DA)currentMoveTimeState
{
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  [(ACHActivityAwardingDataProvider *)self _baseMoveState];
  id v7 = [(ACHActivityAwardingDataProvider *)self properties];
  [v7 bestMoveTimeGoalValue];
  retstr->var15 = v5;

  return result;
}

- ($A5E8A54F69D71102DC6A95EAED28A9DA)_baseMoveState
{
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  retstr->var0 = [(ACHActivityAwardingDataProvider *)self lastCheckedIndexForMove];
  retstr->var1 = [(ACHActivityAwardingDataProvider *)self todayIndex];
  double v5 = [(ACHActivityAwardingDataProvider *)self properties];
  [v5 bestMoveValue];
  retstr->var13 = v6;

  id v7 = [(ACHActivityAwardingDataProvider *)self properties];
  [v7 bestMoveTimeValue];
  retstr->var14 = v8;

  ACHCanonicalUnitForGoalType(0);
  id v43 = (id)objc_claimAutoreleasedReturnValue();
  long long v9 = ACHCanonicalUnitForGoalType(3);
  long long v10 = [(ACHActivityAwardingDataProvider *)self todayActivitySummary];
  uint64_t v11 = [v10 activityMoveMode];

  if (v11 == 2)
  {
    long long v12 = [(ACHActivityAwardingDataProvider *)self lastProcessedTodayMoveTimeValue];
    [v12 doubleValueForUnit:v9];
    retstr->var2 = v13;

    long long v14 = [(ACHActivityAwardingDataProvider *)self todayMoveTimeValue];
    [v14 doubleValueForUnit:v9];
    retstr->var3 = v15;

    long long v16 = [(ACHActivityAwardingDataProvider *)self todayMoveTimeGoal];
    long long v17 = v16;
    id v18 = v9;
  }
  else
  {
    long long v19 = [(ACHActivityAwardingDataProvider *)self lastProcessedTodayMoveValue];
    [v19 doubleValueForUnit:v43];
    retstr->var2 = v20;

    long long v21 = [(ACHActivityAwardingDataProvider *)self todayMoveValue];
    [v21 doubleValueForUnit:v43];
    retstr->var3 = v22;

    long long v16 = [(ACHActivityAwardingDataProvider *)self todayMoveGoal];
    long long v17 = v16;
    id v18 = v43;
  }
  [v16 doubleValueForUnit:v18];
  double v24 = v23;

  retstr->var4 = v24;
  long long v25 = [(ACHActivityAwardingDataProvider *)self yesterdayActivitySummary];
  uint64_t v26 = [v25 activityMoveMode];

  if (v26 == 2)
  {
    long long v27 = [(ACHActivityAwardingDataProvider *)self yesterdayMoveTimeValue];
    [v27 doubleValueForUnit:v9];
    retstr->var5 = v28;

    long long v29 = [(ACHActivityAwardingDataProvider *)self yesterdayMoveTimeGoal];
    long long v30 = v29;
    id v31 = v9;
  }
  else
  {
    uint64_t v32 = [(ACHActivityAwardingDataProvider *)self yesterdayMoveValue];
    [v32 doubleValueForUnit:v43];
    retstr->var5 = v33;

    long long v29 = [(ACHActivityAwardingDataProvider *)self yesterdayMoveGoal];
    long long v30 = v29;
    id v31 = v43;
  }
  [v29 doubleValueForUnit:v31];
  double v35 = v34;

  retstr->var6 = v35;
  v36 = [(ACHActivityAwardingDataProvider *)self properties];
  retstr->var9 = [v36 currentMonthMoveStreak];

  v37 = [(ACHActivityAwardingDataProvider *)self properties];
  retstr->var8 = [v37 currentWeekMoveStreak];

  v38 = [(ACHActivityAwardingDataProvider *)self properties];
  retstr->var7 = [v38 currentMoveStreak];

  v39 = [(ACHActivityAwardingDataProvider *)self properties];
  retstr->var10 = [v39 bestMoveStreak];

  v40 = [(ACHActivityAwardingDataProvider *)self properties];
  retstr->var11 = [v40 totalMoveGoalsMade];

  v41 = [(ACHActivityAwardingDataProvider *)self properties];
  retstr->var12 = [v41 totalMoveGoalsAttempted];

  return result;
}

- ($A5E8A54F69D71102DC6A95EAED28A9DA)currentExerciseState
{
  ACHCanonicalUnitForGoalType(1);
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  retstr->var0 = [(ACHActivityAwardingDataProvider *)self lastCheckedIndexForExercise];
  retstr->var1 = [(ACHActivityAwardingDataProvider *)self todayIndex];
  double v5 = [(ACHActivityAwardingDataProvider *)self lastProcessedTodayExerciseValue];
  [v5 doubleValueForUnit:v25];
  retstr->var2 = v6;

  id v7 = [(ACHActivityAwardingDataProvider *)self todayExerciseValue];
  [v7 doubleValueForUnit:v25];
  retstr->var3 = v8;

  long long v9 = [(ACHActivityAwardingDataProvider *)self todayExerciseGoal];
  [v9 doubleValueForUnit:v25];
  retstr->var4 = v10;

  uint64_t v11 = [(ACHActivityAwardingDataProvider *)self yesterdayExerciseValue];
  [v11 doubleValueForUnit:v25];
  retstr->var5 = v12;

  double v13 = [(ACHActivityAwardingDataProvider *)self yesterdayExerciseGoal];
  [v13 doubleValueForUnit:v25];
  retstr->var6 = v14;

  double v15 = [(ACHActivityAwardingDataProvider *)self properties];
  retstr->var8 = [v15 currentWeekExerciseStreak];

  long long v16 = [(ACHActivityAwardingDataProvider *)self properties];
  retstr->var7 = [v16 currentExerciseStreak];

  long long v17 = [(ACHActivityAwardingDataProvider *)self properties];
  retstr->var10 = [v17 bestExerciseStreak];

  id v18 = [(ACHActivityAwardingDataProvider *)self properties];
  [v18 bestExerciseValue];
  retstr->var13 = v19;

  double v20 = [(ACHActivityAwardingDataProvider *)self properties];
  [v20 bestExerciseGoalValue];
  retstr->var15 = v21;

  double v22 = [(ACHActivityAwardingDataProvider *)self properties];
  retstr->var11 = [v22 totalExerciseGoalsMade];

  double v23 = [(ACHActivityAwardingDataProvider *)self properties];
  retstr->var12 = [v23 totalExerciseGoalsAttempted];

  return result;
}

- ($A5E8A54F69D71102DC6A95EAED28A9DA)currentStandState
{
  ACHCanonicalUnitForGoalType(2);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  retstr->var0 = [(ACHActivityAwardingDataProvider *)self lastCheckedIndexForStand];
  retstr->var1 = [(ACHActivityAwardingDataProvider *)self todayIndex];
  double v5 = [(ACHActivityAwardingDataProvider *)self lastProcessedTodayStandValue];
  [v5 doubleValueForUnit:v23];
  retstr->var2 = v6;

  id v7 = [(ACHActivityAwardingDataProvider *)self todayStandValue];
  [v7 doubleValueForUnit:v23];
  retstr->var3 = v8;

  long long v9 = [(ACHActivityAwardingDataProvider *)self todayStandGoal];
  [v9 doubleValueForUnit:v23];
  retstr->var4 = v10;

  uint64_t v11 = [(ACHActivityAwardingDataProvider *)self yesterdayStandValue];
  [v11 doubleValueForUnit:v23];
  retstr->var5 = v12;

  double v13 = [(ACHActivityAwardingDataProvider *)self yesterdayStandGoal];
  [v13 doubleValueForUnit:v23];
  retstr->var6 = v14;

  double v15 = [(ACHActivityAwardingDataProvider *)self properties];
  retstr->var8 = [v15 currentWeekStandStreak];

  long long v16 = [(ACHActivityAwardingDataProvider *)self properties];
  retstr->var7 = [v16 currentStandStreak];

  long long v17 = [(ACHActivityAwardingDataProvider *)self properties];
  retstr->var10 = [v17 bestStandStreak];

  id v18 = [(ACHActivityAwardingDataProvider *)self properties];
  retstr->var13 = (double)(unint64_t)[v18 bestStandValue];

  double v19 = [(ACHActivityAwardingDataProvider *)self properties];
  retstr->var15 = (double)(unint64_t)[v19 bestStandGoalValue];

  double v20 = [(ACHActivityAwardingDataProvider *)self properties];
  retstr->var11 = [v20 totalStandGoalsMade];

  double v21 = [(ACHActivityAwardingDataProvider *)self properties];
  retstr->var12 = [v21 totalStandGoalsAttempted];

  return result;
}

- (void)setNewMoveState:(id *)a3
{
  double v5 = ACHCanonicalUnitForGoalType(0);
  long long v6 = *(_OWORD *)&a3->var14;
  v15[6] = *(_OWORD *)&a3->var12;
  v15[7] = v6;
  v15[8] = *(_OWORD *)&a3->var16;
  long long v7 = *(_OWORD *)&a3->var6;
  v15[2] = *(_OWORD *)&a3->var4;
  v15[3] = v7;
  long long v8 = *(_OWORD *)&a3->var10;
  v15[4] = *(_OWORD *)&a3->var8;
  v15[5] = v8;
  long long v9 = *(_OWORD *)&a3->var2;
  v15[0] = *(_OWORD *)&a3->var0;
  v15[1] = v9;
  [(ACHActivityAwardingDataProvider *)self _setBaseMoveState:v15];
  double v10 = [(ACHActivityAwardingDataProvider *)self lastProcessedTodayMoveValue];
  [(ACHActivityAwardingDataProvider *)self setPreviousProcessedTodayMoveValue:v10];

  uint64_t v11 = [MEMORY[0x263F0A630] quantityWithUnit:v5 doubleValue:a3->var3];
  [(ACHActivityAwardingDataProvider *)self setLastProcessedTodayMoveValue:v11];

  double v12 = [MEMORY[0x263F0A630] quantityWithUnit:v5 doubleValue:a3->var4];
  [(ACHActivityAwardingDataProvider *)self setLastTodayMoveGoal:v12];

  double var15 = a3->var15;
  double v14 = [(ACHActivityAwardingDataProvider *)self properties];
  [v14 setBestMoveGoalValue:var15];
}

- (void)setNewMoveTimeState:(id *)a3
{
  double v5 = ACHCanonicalUnitForGoalType(3);
  long long v6 = *(_OWORD *)&a3->var14;
  v15[6] = *(_OWORD *)&a3->var12;
  v15[7] = v6;
  v15[8] = *(_OWORD *)&a3->var16;
  long long v7 = *(_OWORD *)&a3->var6;
  v15[2] = *(_OWORD *)&a3->var4;
  v15[3] = v7;
  long long v8 = *(_OWORD *)&a3->var10;
  v15[4] = *(_OWORD *)&a3->var8;
  v15[5] = v8;
  long long v9 = *(_OWORD *)&a3->var2;
  v15[0] = *(_OWORD *)&a3->var0;
  v15[1] = v9;
  [(ACHActivityAwardingDataProvider *)self _setBaseMoveState:v15];
  double v10 = [(ACHActivityAwardingDataProvider *)self lastProcessedTodayMoveTimeValue];
  [(ACHActivityAwardingDataProvider *)self setPreviousProcessedTodayMoveTimeValue:v10];

  uint64_t v11 = [MEMORY[0x263F0A630] quantityWithUnit:v5 doubleValue:a3->var3];
  [(ACHActivityAwardingDataProvider *)self setLastProcessedTodayMoveTimeValue:v11];

  double v12 = [MEMORY[0x263F0A630] quantityWithUnit:v5 doubleValue:a3->var4];
  [(ACHActivityAwardingDataProvider *)self setLastTodayMoveTimeGoal:v12];

  double var15 = a3->var15;
  double v14 = [(ACHActivityAwardingDataProvider *)self properties];
  [v14 setBestMoveTimeGoalValue:var15];
}

- (void)_setBaseMoveState:(id *)a3
{
  [(ACHActivityAwardingDataProvider *)self setLastCheckedIndexForMove:a3->var0];
  int64_t var7 = a3->var7;
  long long v6 = [(ACHActivityAwardingDataProvider *)self properties];
  [v6 setCurrentMoveStreak:var7];

  int64_t var8 = a3->var8;
  long long v8 = [(ACHActivityAwardingDataProvider *)self properties];
  [v8 setCurrentWeekMoveStreak:var8];

  int64_t var9 = a3->var9;
  double v10 = [(ACHActivityAwardingDataProvider *)self properties];
  [v10 setCurrentMonthMoveStreak:var9];

  int64_t var10 = a3->var10;
  double v12 = [(ACHActivityAwardingDataProvider *)self properties];
  [v12 setBestMoveStreak:var10];

  int64_t var11 = a3->var11;
  double v14 = [(ACHActivityAwardingDataProvider *)self properties];
  [v14 setTotalMoveGoalsMade:var11];

  int64_t var12 = a3->var12;
  long long v16 = [(ACHActivityAwardingDataProvider *)self properties];
  [v16 setTotalMoveGoalsAttempted:var12];

  double var13 = a3->var13;
  id v18 = [(ACHActivityAwardingDataProvider *)self properties];
  [v18 setBestMoveValue:var13];

  double var14 = a3->var14;
  id v20 = [(ACHActivityAwardingDataProvider *)self properties];
  [v20 setBestMoveTimeValue:var14];
}

- (void)setNewExerciseState:(id *)a3
{
  ACHCanonicalUnitForGoalType(1);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  [(ACHActivityAwardingDataProvider *)self setLastCheckedIndexForExercise:a3->var0];
  double v5 = [(ACHActivityAwardingDataProvider *)self lastProcessedTodayExerciseValue];
  [(ACHActivityAwardingDataProvider *)self setPreviousProcessedTodayExerciseValue:v5];

  long long v6 = [MEMORY[0x263F0A630] quantityWithUnit:v22 doubleValue:a3->var3];
  [(ACHActivityAwardingDataProvider *)self setLastProcessedTodayExerciseValue:v6];

  long long v7 = [MEMORY[0x263F0A630] quantityWithUnit:v22 doubleValue:a3->var4];
  [(ACHActivityAwardingDataProvider *)self setLastTodayExerciseGoal:v7];

  int64_t var7 = a3->var7;
  long long v9 = [(ACHActivityAwardingDataProvider *)self properties];
  [v9 setCurrentExerciseStreak:var7];

  int64_t var8 = a3->var8;
  uint64_t v11 = [(ACHActivityAwardingDataProvider *)self properties];
  [v11 setCurrentWeekExerciseStreak:var8];

  int64_t var10 = a3->var10;
  double v13 = [(ACHActivityAwardingDataProvider *)self properties];
  [v13 setBestExerciseStreak:var10];

  double var13 = a3->var13;
  double v15 = [(ACHActivityAwardingDataProvider *)self properties];
  [v15 setBestExerciseValue:var13];

  double var15 = a3->var15;
  long long v17 = [(ACHActivityAwardingDataProvider *)self properties];
  [v17 setBestExerciseGoalValue:var15];

  int64_t var11 = a3->var11;
  double v19 = [(ACHActivityAwardingDataProvider *)self properties];
  [v19 setTotalExerciseGoalsMade:var11];

  int64_t var12 = a3->var12;
  double v21 = [(ACHActivityAwardingDataProvider *)self properties];
  [v21 setTotalExerciseGoalsAttempted:var12];
}

- (void)setNewStandState:(id *)a3
{
  ACHCanonicalUnitForGoalType(2);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  [(ACHActivityAwardingDataProvider *)self setLastCheckedIndexForStand:a3->var0];
  double v5 = [(ACHActivityAwardingDataProvider *)self lastProcessedTodayStandValue];
  [(ACHActivityAwardingDataProvider *)self setPreviousProcessedTodayStandValue:v5];

  long long v6 = [MEMORY[0x263F0A630] quantityWithUnit:v22 doubleValue:a3->var3];
  [(ACHActivityAwardingDataProvider *)self setLastProcessedTodayStandValue:v6];

  long long v7 = [MEMORY[0x263F0A630] quantityWithUnit:v22 doubleValue:a3->var4];
  [(ACHActivityAwardingDataProvider *)self setLastTodayStandGoal:v7];

  int64_t var7 = a3->var7;
  long long v9 = [(ACHActivityAwardingDataProvider *)self properties];
  [v9 setCurrentStandStreak:var7];

  int64_t var8 = a3->var8;
  uint64_t v11 = [(ACHActivityAwardingDataProvider *)self properties];
  [v11 setCurrentWeekStandStreak:var8];

  int64_t var10 = a3->var10;
  double v13 = [(ACHActivityAwardingDataProvider *)self properties];
  [v13 setBestStandStreak:var10];

  unint64_t var13 = (unint64_t)a3->var13;
  double v15 = [(ACHActivityAwardingDataProvider *)self properties];
  [v15 setBestStandValue:var13];

  unint64_t var15 = (unint64_t)a3->var15;
  long long v17 = [(ACHActivityAwardingDataProvider *)self properties];
  [v17 setBestStandGoalValue:var15];

  int64_t var11 = a3->var11;
  double v19 = [(ACHActivityAwardingDataProvider *)self properties];
  [v19 setTotalStandGoalsMade:var11];

  int64_t var12 = a3->var12;
  double v21 = [(ACHActivityAwardingDataProvider *)self properties];
  [v21 setTotalStandGoalsAttempted:var12];
}

- (BOOL)allGoalsMetToday
{
  char v3 = [(ACHActivityAwardingDataProvider *)self todayActivitySummary];
  uint64_t v4 = [v3 activityMoveMode];

  if (v4 == 2)
  {
    double v5 = ACHCanonicalUnitForGoalType(3);
    long long v6 = [(ACHActivityAwardingDataProvider *)self todayMoveTimeValue];
    [v6 doubleValueForUnit:v5];
    double v8 = v7;

    [(ACHActivityAwardingDataProvider *)self todayMoveTimeGoal];
  }
  else
  {
    double v5 = ACHCanonicalUnitForGoalType(0);
    long long v9 = [(ACHActivityAwardingDataProvider *)self todayMoveValue];
    [v9 doubleValueForUnit:v5];
    double v8 = v10;

    [(ACHActivityAwardingDataProvider *)self todayMoveGoal];
  uint64_t v11 = };
  [v11 doubleValueForUnit:v5];
  double v13 = v12;

  double v14 = ACHCanonicalUnitForGoalType(1);
  double v15 = [(ACHActivityAwardingDataProvider *)self todayExerciseValue];
  [v15 doubleValueForUnit:v14];
  double v17 = v16;

  id v18 = [(ACHActivityAwardingDataProvider *)self todayExerciseGoal];
  [v18 doubleValueForUnit:v14];
  double v20 = v19;

  double v21 = ACHCanonicalUnitForGoalType(2);
  id v22 = [(ACHActivityAwardingDataProvider *)self todayStandValue];
  [v22 doubleValueForUnit:v21];
  double v24 = v23;

  id v25 = [(ACHActivityAwardingDataProvider *)self todayStandGoal];
  [v25 doubleValueForUnit:v21];
  double v27 = v26;

  BOOL v28 = v13 > 0.0 && v8 >= v13 && v20 > 0.0 && v17 >= v20 && (uint64_t)v27 >= 1 && (uint64_t)v24 >= (uint64_t)v27;
  return v28;
}

- (HKQuantity)yesterdayMoveValue
{
  v2 = [(ACHActivityAwardingDataProvider *)self yesterdayActivitySummary];
  char v3 = [v2 activeEnergyBurned];

  return (HKQuantity *)v3;
}

- (HKQuantity)yesterdayMoveGoal
{
  v2 = [(ACHActivityAwardingDataProvider *)self yesterdayActivitySummary];
  char v3 = [v2 activeEnergyBurnedGoal];

  return (HKQuantity *)v3;
}

- (HKQuantity)yesterdayMoveTimeValue
{
  v2 = [(ACHActivityAwardingDataProvider *)self yesterdayActivitySummary];
  char v3 = [v2 appleMoveTime];

  return (HKQuantity *)v3;
}

- (HKQuantity)yesterdayMoveTimeGoal
{
  v2 = [(ACHActivityAwardingDataProvider *)self yesterdayActivitySummary];
  char v3 = [v2 appleMoveTimeGoal];

  return (HKQuantity *)v3;
}

- (HKQuantity)yesterdayExerciseValue
{
  v2 = [(ACHActivityAwardingDataProvider *)self yesterdayActivitySummary];
  char v3 = [v2 appleExerciseTime];

  return (HKQuantity *)v3;
}

- (HKQuantity)todayExerciseGoal
{
  v2 = [(ACHActivityAwardingDataProvider *)self todayActivitySummary];
  char v3 = [v2 appleExerciseTimeGoal];

  return (HKQuantity *)v3;
}

- (HKQuantity)yesterdayExerciseGoal
{
  v2 = [(ACHActivityAwardingDataProvider *)self yesterdayActivitySummary];
  char v3 = [v2 appleExerciseTimeGoal];

  return (HKQuantity *)v3;
}

- (HKQuantity)todayStandValue
{
  v2 = [(ACHActivityAwardingDataProvider *)self todayActivitySummary];
  char v3 = [v2 appleStandHours];

  return (HKQuantity *)v3;
}

- (HKQuantity)yesterdayStandValue
{
  v2 = [(ACHActivityAwardingDataProvider *)self yesterdayActivitySummary];
  char v3 = [v2 appleStandHours];

  return (HKQuantity *)v3;
}

- (HKQuantity)todayStandGoal
{
  v2 = [(ACHActivityAwardingDataProvider *)self todayActivitySummary];
  char v3 = [v2 appleStandHoursGoal];

  return (HKQuantity *)v3;
}

- (HKQuantity)yesterdayStandGoal
{
  v2 = [(ACHActivityAwardingDataProvider *)self yesterdayActivitySummary];
  char v3 = [v2 appleStandHoursGoal];

  return (HKQuantity *)v3;
}

- (void)setTodayActivitySummary:(id)a3
{
}

- (HKActivitySummary)yesterdayActivitySummary
{
  return self->_yesterdayActivitySummary;
}

- (void)setYesterdayActivitySummary:(id)a3
{
}

- (int64_t)initialPropertyCheckpointIndex
{
  return self->_initialPropertyCheckpointIndex;
}

- (void)setInitialPropertyCheckpointIndex:(int64_t)a3
{
  self->_initialPropertyCheckpointIndex = a3;
}

- (int64_t)lastCheckedIndexForMove
{
  return self->_lastCheckedIndexForMove;
}

- (void)setLastCheckedIndexForMove:(int64_t)a3
{
  self->_lastCheckedIndexForMove = a3;
}

- (HKQuantity)lastProcessedTodayMoveValue
{
  return self->_lastProcessedTodayMoveValue;
}

- (void)setLastProcessedTodayMoveValue:(id)a3
{
}

- (HKQuantity)previousProcessedTodayMoveValue
{
  return self->_previousProcessedTodayMoveValue;
}

- (void)setPreviousProcessedTodayMoveValue:(id)a3
{
}

- (HKQuantity)lastTodayMoveGoal
{
  return self->_lastTodayMoveGoal;
}

- (void)setLastTodayMoveGoal:(id)a3
{
}

- (HKQuantity)lastProcessedTodayMoveTimeValue
{
  return self->_lastProcessedTodayMoveTimeValue;
}

- (void)setLastProcessedTodayMoveTimeValue:(id)a3
{
}

- (HKQuantity)previousProcessedTodayMoveTimeValue
{
  return self->_previousProcessedTodayMoveTimeValue;
}

- (void)setPreviousProcessedTodayMoveTimeValue:(id)a3
{
}

- (HKQuantity)lastTodayMoveTimeGoal
{
  return self->_lastTodayMoveTimeGoal;
}

- (void)setLastTodayMoveTimeGoal:(id)a3
{
}

- (int64_t)lastCheckedIndexForExercise
{
  return self->_lastCheckedIndexForExercise;
}

- (void)setLastCheckedIndexForExercise:(int64_t)a3
{
  self->_lastCheckedIndexForExercise = a3;
}

- (HKQuantity)lastProcessedTodayExerciseValue
{
  return self->_lastProcessedTodayExerciseValue;
}

- (void)setLastProcessedTodayExerciseValue:(id)a3
{
}

- (HKQuantity)previousProcessedTodayExerciseValue
{
  return self->_previousProcessedTodayExerciseValue;
}

- (void)setPreviousProcessedTodayExerciseValue:(id)a3
{
}

- (HKQuantity)lastTodayExerciseGoal
{
  return self->_lastTodayExerciseGoal;
}

- (void)setLastTodayExerciseGoal:(id)a3
{
}

- (int64_t)lastCheckedIndexForStand
{
  return self->_lastCheckedIndexForStand;
}

- (void)setLastCheckedIndexForStand:(int64_t)a3
{
  self->_lastCheckedIndexForStand = a3;
}

- (HKQuantity)lastProcessedTodayStandValue
{
  return self->_lastProcessedTodayStandValue;
}

- (void)setLastProcessedTodayStandValue:(id)a3
{
}

- (HKQuantity)previousProcessedTodayStandValue
{
  return self->_previousProcessedTodayStandValue;
}

- (void)setPreviousProcessedTodayStandValue:(id)a3
{
}

- (HKQuantity)lastTodayStandGoal
{
  return self->_lastTodayStandGoal;
}

- (void)setLastTodayStandGoal:(id)a3
{
}

- (int64_t)lastCheckedIndexForAllGoals
{
  return self->_lastCheckedIndexForAllGoals;
}

- (void)setLastCheckedIndexForAllGoals:(int64_t)a3
{
  self->_lastCheckedIndexForAllGoals = a3;
}

- (int64_t)lastCheckedIndexForDistance
{
  return self->_lastCheckedIndexForDistance;
}

- (void)setLastCheckedIndexForDistance:(int64_t)a3
{
  self->_lastCheckedIndexForDistance = a3;
}

- (HKQuantity)todayDistanceValue
{
  return self->_todayDistanceValue;
}

- (HKQuantity)lastTodayDistanceValue
{
  return self->_lastTodayDistanceValue;
}

- (void)setLastTodayDistanceValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTodayDistanceValue, 0);
  objc_storeStrong((id *)&self->_todayDistanceValue, 0);
  objc_storeStrong((id *)&self->_lastTodayStandGoal, 0);
  objc_storeStrong((id *)&self->_previousProcessedTodayStandValue, 0);
  objc_storeStrong((id *)&self->_lastProcessedTodayStandValue, 0);
  objc_storeStrong((id *)&self->_lastTodayExerciseGoal, 0);
  objc_storeStrong((id *)&self->_previousProcessedTodayExerciseValue, 0);
  objc_storeStrong((id *)&self->_lastProcessedTodayExerciseValue, 0);
  objc_storeStrong((id *)&self->_lastTodayMoveTimeGoal, 0);
  objc_storeStrong((id *)&self->_previousProcessedTodayMoveTimeValue, 0);
  objc_storeStrong((id *)&self->_lastProcessedTodayMoveTimeValue, 0);
  objc_storeStrong((id *)&self->_lastTodayMoveGoal, 0);
  objc_storeStrong((id *)&self->_previousProcessedTodayMoveValue, 0);
  objc_storeStrong((id *)&self->_lastProcessedTodayMoveValue, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_yesterdayActivitySummary, 0);
  objc_storeStrong((id *)&self->_todayActivitySummary, 0);
}

@end