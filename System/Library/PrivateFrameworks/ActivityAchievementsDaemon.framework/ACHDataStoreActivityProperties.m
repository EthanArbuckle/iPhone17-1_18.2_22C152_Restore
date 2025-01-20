@interface ACHDataStoreActivityProperties
- (ACHDataStoreActivityProperties)previousValues;
- (NSArray)dictionaryKeys;
- (NSDictionary)dictionaryRepresentation;
- (double)bestExerciseGoalValue;
- (double)bestExerciseValue;
- (double)bestMoveGoalValue;
- (double)bestMoveTimeGoalValue;
- (double)bestMoveTimeValue;
- (double)bestMoveValue;
- (int64_t)mostRecentAllGoalsMadeIndex;
- (int64_t)storeValuesValidBeforeSummaryIndex;
- (unint64_t)bestExerciseStreak;
- (unint64_t)bestMoveStreak;
- (unint64_t)bestStandGoalValue;
- (unint64_t)bestStandStreak;
- (unint64_t)bestStandValue;
- (unint64_t)bestStepCount;
- (unint64_t)currentExerciseStreak;
- (unint64_t)currentMonthMoveStreak;
- (unint64_t)currentMoveStreak;
- (unint64_t)currentStandStreak;
- (unint64_t)currentWeekExerciseStreak;
- (unint64_t)currentWeekMoveStreak;
- (unint64_t)currentWeekStandStreak;
- (unint64_t)lastStepCount;
- (unint64_t)totalAllGoalsMade;
- (unint64_t)totalExerciseGoalsAttempted;
- (unint64_t)totalExerciseGoalsMade;
- (unint64_t)totalMoveGoalsAttempted;
- (unint64_t)totalMoveGoalsMade;
- (unint64_t)totalStandGoalsAttempted;
- (unint64_t)totalStandGoalsMade;
- (void)setBestExerciseGoalValue:(double)a3;
- (void)setBestExerciseStreak:(unint64_t)a3;
- (void)setBestExerciseValue:(double)a3;
- (void)setBestMoveGoalValue:(double)a3;
- (void)setBestMoveStreak:(unint64_t)a3;
- (void)setBestMoveTimeGoalValue:(double)a3;
- (void)setBestMoveTimeValue:(double)a3;
- (void)setBestMoveValue:(double)a3;
- (void)setBestStandGoalValue:(unint64_t)a3;
- (void)setBestStandStreak:(unint64_t)a3;
- (void)setBestStandValue:(unint64_t)a3;
- (void)setBestStepCount:(unint64_t)a3;
- (void)setCurrentExerciseStreak:(unint64_t)a3;
- (void)setCurrentMonthMoveStreak:(unint64_t)a3;
- (void)setCurrentMoveStreak:(unint64_t)a3;
- (void)setCurrentStandStreak:(unint64_t)a3;
- (void)setCurrentWeekExerciseStreak:(unint64_t)a3;
- (void)setCurrentWeekMoveStreak:(unint64_t)a3;
- (void)setCurrentWeekStandStreak:(unint64_t)a3;
- (void)setLastStepCount:(unint64_t)a3;
- (void)setMostRecentAllGoalsMadeIndex:(int64_t)a3;
- (void)setPreviousValues:(id)a3;
- (void)setStoreValuesValidBeforeSummaryIndex:(int64_t)a3;
- (void)setTotalAllGoalsMade:(unint64_t)a3;
- (void)setTotalExerciseGoalsAttempted:(unint64_t)a3;
- (void)setTotalExerciseGoalsMade:(unint64_t)a3;
- (void)setTotalMoveGoalsAttempted:(unint64_t)a3;
- (void)setTotalMoveGoalsMade:(unint64_t)a3;
- (void)setTotalStandGoalsAttempted:(unint64_t)a3;
- (void)setTotalStandGoalsMade:(unint64_t)a3;
@end

@implementation ACHDataStoreActivityProperties

- (double)bestMoveValue
{
  return self->_bestMoveValue;
}

- (double)bestExerciseValue
{
  return self->_bestExerciseValue;
}

- (double)bestMoveTimeValue
{
  return self->_bestMoveTimeValue;
}

- (unint64_t)bestMoveStreak
{
  return self->_bestMoveStreak;
}

- (unint64_t)currentMoveStreak
{
  return self->_currentMoveStreak;
}

- (unint64_t)currentMonthMoveStreak
{
  return self->_currentMonthMoveStreak;
}

- (unint64_t)totalMoveGoalsMade
{
  return self->_totalMoveGoalsMade;
}

- (unint64_t)currentWeekStandStreak
{
  return self->_currentWeekStandStreak;
}

- (unint64_t)currentWeekMoveStreak
{
  return self->_currentWeekMoveStreak;
}

- (unint64_t)currentWeekExerciseStreak
{
  return self->_currentWeekExerciseStreak;
}

- (NSArray)dictionaryKeys
{
  if (dictionaryKeys_onceToken != -1) {
    dispatch_once(&dictionaryKeys_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)dictionaryKeys_keys;
  return (NSArray *)v2;
}

void __48__ACHDataStoreActivityProperties_dictionaryKeys__block_invoke()
{
  v31[29] = *MEMORY[0x263EF8340];
  v30 = NSStringFromSelector(sel_currentMoveStreak);
  v31[0] = v30;
  v29 = NSStringFromSelector(sel_currentWeekMoveStreak);
  v31[1] = v29;
  v28 = NSStringFromSelector(sel_currentMonthMoveStreak);
  v31[2] = v28;
  v27 = NSStringFromSelector(sel_bestMoveStreak);
  v31[3] = v27;
  v26 = NSStringFromSelector(sel_totalMoveGoalsMade);
  v31[4] = v26;
  v25 = NSStringFromSelector(sel_totalMoveGoalsAttempted);
  v31[5] = v25;
  v24 = NSStringFromSelector(sel_bestMoveValue);
  v31[6] = v24;
  v23 = NSStringFromSelector(sel_bestMoveGoalValue);
  v31[7] = v23;
  v22 = NSStringFromSelector(sel_bestMoveTimeValue);
  v31[8] = v22;
  v21 = NSStringFromSelector(sel_bestMoveTimeGoalValue);
  v31[9] = v21;
  v20 = NSStringFromSelector(sel_currentExerciseStreak);
  v31[10] = v20;
  v19 = NSStringFromSelector(sel_currentWeekExerciseStreak);
  v31[11] = v19;
  v18 = NSStringFromSelector(sel_bestExerciseStreak);
  v31[12] = v18;
  v17 = NSStringFromSelector(sel_totalExerciseGoalsMade);
  v31[13] = v17;
  v16 = NSStringFromSelector(sel_totalExerciseGoalsAttempted);
  v31[14] = v16;
  v15 = NSStringFromSelector(sel_bestExerciseValue);
  v31[15] = v15;
  v14 = NSStringFromSelector(sel_bestExerciseGoalValue);
  v31[16] = v14;
  v13 = NSStringFromSelector(sel_currentStandStreak);
  v31[17] = v13;
  v12 = NSStringFromSelector(sel_currentWeekStandStreak);
  v31[18] = v12;
  v0 = NSStringFromSelector(sel_bestStandStreak);
  v31[19] = v0;
  v1 = NSStringFromSelector(sel_totalStandGoalsMade);
  v31[20] = v1;
  v2 = NSStringFromSelector(sel_totalStandGoalsAttempted);
  v31[21] = v2;
  v3 = NSStringFromSelector(sel_bestStandValue);
  v31[22] = v3;
  v4 = NSStringFromSelector(sel_bestStandGoalValue);
  v31[23] = v4;
  v5 = NSStringFromSelector(sel_totalAllGoalsMade);
  v31[24] = v5;
  v6 = NSStringFromSelector(sel_mostRecentAllGoalsMadeIndex);
  v31[25] = v6;
  v7 = NSStringFromSelector(sel_lastStepCount);
  v31[26] = v7;
  v8 = NSStringFromSelector(sel_bestStepCount);
  v31[27] = v8;
  v9 = NSStringFromSelector(sel_storeValuesValidBeforeSummaryIndex);
  v31[28] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:29];
  v11 = (void *)dictionaryKeys_keys;
  dictionaryKeys_keys = v10;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = [(ACHDataStoreActivityProperties *)self dictionaryKeys];
  v4 = [(ACHDataStoreActivityProperties *)self dictionaryWithValuesForKeys:v3];

  return (NSDictionary *)v4;
}

- (void)setCurrentMoveStreak:(unint64_t)a3
{
  self->_currentMoveStreak = a3;
}

- (void)setCurrentWeekMoveStreak:(unint64_t)a3
{
  self->_currentWeekMoveStreak = a3;
}

- (void)setCurrentMonthMoveStreak:(unint64_t)a3
{
  self->_currentMonthMoveStreak = a3;
}

- (void)setBestMoveStreak:(unint64_t)a3
{
  self->_bestMoveStreak = a3;
}

- (void)setTotalMoveGoalsMade:(unint64_t)a3
{
  self->_totalMoveGoalsMade = a3;
}

- (unint64_t)totalMoveGoalsAttempted
{
  return self->_totalMoveGoalsAttempted;
}

- (void)setTotalMoveGoalsAttempted:(unint64_t)a3
{
  self->_totalMoveGoalsAttempted = a3;
}

- (void)setBestMoveValue:(double)a3
{
  self->_bestMoveValue = a3;
}

- (double)bestMoveGoalValue
{
  return self->_bestMoveGoalValue;
}

- (void)setBestMoveGoalValue:(double)a3
{
  self->_bestMoveGoalValue = a3;
}

- (void)setBestMoveTimeValue:(double)a3
{
  self->_bestMoveTimeValue = a3;
}

- (double)bestMoveTimeGoalValue
{
  return self->_bestMoveTimeGoalValue;
}

- (void)setBestMoveTimeGoalValue:(double)a3
{
  self->_bestMoveTimeGoalValue = a3;
}

- (unint64_t)currentExerciseStreak
{
  return self->_currentExerciseStreak;
}

- (void)setCurrentExerciseStreak:(unint64_t)a3
{
  self->_currentExerciseStreak = a3;
}

- (void)setCurrentWeekExerciseStreak:(unint64_t)a3
{
  self->_currentWeekExerciseStreak = a3;
}

- (unint64_t)bestExerciseStreak
{
  return self->_bestExerciseStreak;
}

- (void)setBestExerciseStreak:(unint64_t)a3
{
  self->_bestExerciseStreak = a3;
}

- (unint64_t)totalExerciseGoalsMade
{
  return self->_totalExerciseGoalsMade;
}

- (void)setTotalExerciseGoalsMade:(unint64_t)a3
{
  self->_totalExerciseGoalsMade = a3;
}

- (unint64_t)totalExerciseGoalsAttempted
{
  return self->_totalExerciseGoalsAttempted;
}

- (void)setTotalExerciseGoalsAttempted:(unint64_t)a3
{
  self->_totalExerciseGoalsAttempted = a3;
}

- (void)setBestExerciseValue:(double)a3
{
  self->_bestExerciseValue = a3;
}

- (double)bestExerciseGoalValue
{
  return self->_bestExerciseGoalValue;
}

- (void)setBestExerciseGoalValue:(double)a3
{
  self->_bestExerciseGoalValue = a3;
}

- (unint64_t)currentStandStreak
{
  return self->_currentStandStreak;
}

- (void)setCurrentStandStreak:(unint64_t)a3
{
  self->_currentStandStreak = a3;
}

- (void)setCurrentWeekStandStreak:(unint64_t)a3
{
  self->_currentWeekStandStreak = a3;
}

- (unint64_t)bestStandStreak
{
  return self->_bestStandStreak;
}

- (void)setBestStandStreak:(unint64_t)a3
{
  self->_bestStandStreak = a3;
}

- (unint64_t)totalStandGoalsMade
{
  return self->_totalStandGoalsMade;
}

- (void)setTotalStandGoalsMade:(unint64_t)a3
{
  self->_totalStandGoalsMade = a3;
}

- (unint64_t)totalStandGoalsAttempted
{
  return self->_totalStandGoalsAttempted;
}

- (void)setTotalStandGoalsAttempted:(unint64_t)a3
{
  self->_totalStandGoalsAttempted = a3;
}

- (unint64_t)bestStandValue
{
  return self->_bestStandValue;
}

- (void)setBestStandValue:(unint64_t)a3
{
  self->_bestStandValue = a3;
}

- (unint64_t)bestStandGoalValue
{
  return self->_bestStandGoalValue;
}

- (void)setBestStandGoalValue:(unint64_t)a3
{
  self->_bestStandGoalValue = a3;
}

- (unint64_t)totalAllGoalsMade
{
  return self->_totalAllGoalsMade;
}

- (void)setTotalAllGoalsMade:(unint64_t)a3
{
  self->_totalAllGoalsMade = a3;
}

- (int64_t)mostRecentAllGoalsMadeIndex
{
  return self->_mostRecentAllGoalsMadeIndex;
}

- (void)setMostRecentAllGoalsMadeIndex:(int64_t)a3
{
  self->_mostRecentAllGoalsMadeIndex = a3;
}

- (unint64_t)lastStepCount
{
  return self->_lastStepCount;
}

- (void)setLastStepCount:(unint64_t)a3
{
  self->_lastStepCount = a3;
}

- (unint64_t)bestStepCount
{
  return self->_bestStepCount;
}

- (void)setBestStepCount:(unint64_t)a3
{
  self->_bestStepCount = a3;
}

- (int64_t)storeValuesValidBeforeSummaryIndex
{
  return self->_storeValuesValidBeforeSummaryIndex;
}

- (void)setStoreValuesValidBeforeSummaryIndex:(int64_t)a3
{
  self->_storeValuesValidBeforeSummaryIndex = a3;
}

- (ACHDataStoreActivityProperties)previousValues
{
  return self->_previousValues;
}

- (void)setPreviousValues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end