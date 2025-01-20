@interface _ActivityCurrentValueSummary
- (NSDateComponents)collationDateComponents;
- (_ActivityCurrentValueSummary)initWithTimeScope:(int64_t)a3;
- (double)collatedSummaryCount;
- (double)pausedSummaryCount;
- (id)_addQuantity:(id)a3 toQuantity:(id)a4;
- (id)_divideQuantity:(id)a3 divisor:(double)a4;
- (id)_maxQuantity:(id)a3 otherQuantity:(id)a4;
- (id)dateComponentsForCalendar:(id)a3;
- (int64_t)timeScope;
- (void)combineWithActivitySummary:(id)a3;
- (void)finishCollatingSummaryWithGraphView:(id)a3;
- (void)setCollatedSummaryCount:(double)a3;
- (void)setCollationDateComponents:(id)a3;
- (void)setPausedSummaryCount:(double)a3;
- (void)setTimeScope:(int64_t)a3;
@end

@implementation _ActivityCurrentValueSummary

- (_ActivityCurrentValueSummary)initWithTimeScope:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_ActivityCurrentValueSummary;
  result = [(_ActivityCurrentValueSummary *)&v5 init];
  if (result)
  {
    result->_timeScope = a3;
    result->_collatedSummaryCount = 0.0;
    result->_pausedSummaryCount = 0.0;
  }
  return result;
}

- (void)combineWithActivitySummary:(id)a3
{
  id v49 = a3;
  if ([v49 isPaused])
  {
    self->_pausedSummaryCount = self->_pausedSummaryCount + 1.0;
  }
  else
  {
    [(_ActivityCurrentValueSummary *)self collatedSummaryCount];
    if (v4 == 0.0)
    {
      objc_super v5 = [v49 _startDate];
      [(_ActivityCurrentValueSummary *)self _setStartDate:v5];

      v6 = [v49 _endDate];
      [(_ActivityCurrentValueSummary *)self _setEndDate:v6];

      v7 = [v49 _gregorianDateComponents];
      [(_ActivityCurrentValueSummary *)self setCollationDateComponents:v7];

      -[_ActivityCurrentValueSummary setActivityMoveMode:](self, "setActivityMoveMode:", [v49 activityMoveMode]);
      v8 = [v49 activeEnergyBurned];
      [(_ActivityCurrentValueSummary *)self setActiveEnergyBurned:v8];

      v9 = [v49 appleMoveTime];
      [(_ActivityCurrentValueSummary *)self setAppleMoveTime:v9];

      v10 = [v49 appleExerciseTime];
      [(_ActivityCurrentValueSummary *)self setAppleExerciseTime:v10];

      v11 = [v49 appleStandHours];
      [(_ActivityCurrentValueSummary *)self setAppleStandHours:v11];

      v12 = [v49 activeEnergyBurnedGoal];
      [(_ActivityCurrentValueSummary *)self setActiveEnergyBurnedGoal:v12];

      v13 = [v49 appleMoveTimeGoal];
      [(_ActivityCurrentValueSummary *)self setAppleMoveTimeGoal:v13];

      v14 = [v49 appleExerciseTimeGoal];
      [(_ActivityCurrentValueSummary *)self setAppleExerciseTimeGoal:v14];

      v15 = [v49 appleStandHoursGoal];
      [(_ActivityCurrentValueSummary *)self setAppleStandHoursGoal:v15];

      v16 = [v49 exerciseTimeGoal];
      [(_ActivityCurrentValueSummary *)self setExerciseTimeGoal:v16];

      v17 = [v49 standHoursGoal];
      [(_ActivityCurrentValueSummary *)self setStandHoursGoal:v17];
    }
    else
    {
      v18 = [v49 _endDate];
      [(_ActivityCurrentValueSummary *)self _setEndDate:v18];

      -[_ActivityCurrentValueSummary setActivityMoveMode:](self, "setActivityMoveMode:", [v49 activityMoveMode]);
      v19 = [(_ActivityCurrentValueSummary *)self activeEnergyBurned];
      v20 = [v49 activeEnergyBurned];
      v21 = [(_ActivityCurrentValueSummary *)self _addQuantity:v19 toQuantity:v20];
      [(_ActivityCurrentValueSummary *)self setActiveEnergyBurned:v21];

      v22 = [(_ActivityCurrentValueSummary *)self appleMoveTime];
      v23 = [v49 appleMoveTime];
      v24 = [(_ActivityCurrentValueSummary *)self _addQuantity:v22 toQuantity:v23];
      [(_ActivityCurrentValueSummary *)self setAppleMoveTime:v24];

      v25 = [(_ActivityCurrentValueSummary *)self appleExerciseTime];
      v26 = [v49 appleExerciseTime];
      v27 = [(_ActivityCurrentValueSummary *)self _addQuantity:v25 toQuantity:v26];
      [(_ActivityCurrentValueSummary *)self setAppleExerciseTime:v27];

      v28 = [(_ActivityCurrentValueSummary *)self appleStandHours];
      v29 = [v49 appleStandHours];
      v30 = [(_ActivityCurrentValueSummary *)self _addQuantity:v28 toQuantity:v29];
      [(_ActivityCurrentValueSummary *)self setAppleStandHours:v30];

      v31 = [(_ActivityCurrentValueSummary *)self activeEnergyBurnedGoal];
      v32 = [v49 activeEnergyBurnedGoal];
      v33 = [(_ActivityCurrentValueSummary *)self _maxQuantity:v31 otherQuantity:v32];
      [(_ActivityCurrentValueSummary *)self setActiveEnergyBurnedGoal:v33];

      v34 = [(_ActivityCurrentValueSummary *)self appleMoveTimeGoal];
      v35 = [v49 appleMoveTimeGoal];
      v36 = [(_ActivityCurrentValueSummary *)self _maxQuantity:v34 otherQuantity:v35];
      [(_ActivityCurrentValueSummary *)self setAppleMoveTimeGoal:v36];

      v37 = [(_ActivityCurrentValueSummary *)self appleExerciseTimeGoal];
      v38 = [v49 appleExerciseTimeGoal];
      v39 = [(_ActivityCurrentValueSummary *)self _maxQuantity:v37 otherQuantity:v38];
      [(_ActivityCurrentValueSummary *)self setAppleExerciseTimeGoal:v39];

      v40 = [(_ActivityCurrentValueSummary *)self appleStandHoursGoal];
      v41 = [v49 appleStandHoursGoal];
      v42 = [(_ActivityCurrentValueSummary *)self _maxQuantity:v40 otherQuantity:v41];
      [(_ActivityCurrentValueSummary *)self setAppleStandHoursGoal:v42];

      v43 = [(_ActivityCurrentValueSummary *)self exerciseTimeGoal];
      v44 = [v49 exerciseTimeGoal];
      v45 = [(_ActivityCurrentValueSummary *)self _maxQuantity:v43 otherQuantity:v44];
      [(_ActivityCurrentValueSummary *)self setExerciseTimeGoal:v45];

      v17 = [(_ActivityCurrentValueSummary *)self standHoursGoal];
      v46 = [v49 standHoursGoal];
      v47 = [(_ActivityCurrentValueSummary *)self _maxQuantity:v17 otherQuantity:v46];
      [(_ActivityCurrentValueSummary *)self setStandHoursGoal:v47];
    }
    [(_ActivityCurrentValueSummary *)self collatedSummaryCount];
    [(_ActivityCurrentValueSummary *)self setCollatedSummaryCount:v48 + 1.0];
  }
}

- (id)dateComponentsForCalendar:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_ActivityCurrentValueSummary *)self collationDateComponents];

  if (v5)
  {
    v6 = [v4 calendarIdentifier];
    char v7 = [v6 isEqualToString:*MEMORY[0x1E4F1C318]];

    v8 = [(_ActivityCurrentValueSummary *)self collationDateComponents];
    id v9 = v8;
    if ((v7 & 1) == 0)
    {
      uint64_t v10 = objc_msgSend(v8, "hk_translateDateComponentsToCalendar:calendarUnits:", v4, *MEMORY[0x1E4F2BC40]);

      id v9 = (id)v10;
    }
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  }

  return v9;
}

- (void)finishCollatingSummaryWithGraphView:(id)a3
{
  id v18 = a3;
  if ([(_ActivityCurrentValueSummary *)self timeScope] != 6
    && [(_ActivityCurrentValueSummary *)self timeScope] != 7)
  {
    [(_ActivityCurrentValueSummary *)self collatedSummaryCount];
    if (v4 > 0.0)
    {
      objc_super v5 = [(_ActivityCurrentValueSummary *)self activeEnergyBurned];
      [(_ActivityCurrentValueSummary *)self collatedSummaryCount];
      v6 = -[_ActivityCurrentValueSummary _divideQuantity:divisor:](self, "_divideQuantity:divisor:", v5);
      [(_ActivityCurrentValueSummary *)self setActiveEnergyBurned:v6];

      char v7 = [(_ActivityCurrentValueSummary *)self appleMoveTime];
      [(_ActivityCurrentValueSummary *)self collatedSummaryCount];
      v8 = -[_ActivityCurrentValueSummary _divideQuantity:divisor:](self, "_divideQuantity:divisor:", v7);
      [(_ActivityCurrentValueSummary *)self setAppleMoveTime:v8];

      id v9 = [(_ActivityCurrentValueSummary *)self appleExerciseTime];
      [(_ActivityCurrentValueSummary *)self collatedSummaryCount];
      uint64_t v10 = -[_ActivityCurrentValueSummary _divideQuantity:divisor:](self, "_divideQuantity:divisor:", v9);
      [(_ActivityCurrentValueSummary *)self setAppleExerciseTime:v10];

      v11 = [(_ActivityCurrentValueSummary *)self appleStandHours];
      [(_ActivityCurrentValueSummary *)self collatedSummaryCount];
      v12 = -[_ActivityCurrentValueSummary _divideQuantity:divisor:](self, "_divideQuantity:divisor:", v11);
      [(_ActivityCurrentValueSummary *)self setAppleStandHours:v12];
    }
  }
  [(_ActivityCurrentValueSummary *)self collatedSummaryCount];
  if (v13 == 0.0)
  {
    [(_ActivityCurrentValueSummary *)self pausedSummaryCount];
    if (v14 > 0.0) {
      [(_ActivityCurrentValueSummary *)self setPaused:1];
    }
  }
  v15 = [v18 effectiveVisibleRangeCadence];
  v16 = [v15 startDate];
  [(_ActivityCurrentValueSummary *)self _setStartDate:v16];

  v17 = [v15 endDate];
  [(_ActivityCurrentValueSummary *)self _setEndDate:v17];
}

- (id)_addQuantity:(id)a3 toQuantity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  char v7 = [v6 _unit];
  [v6 doubleValueForUnit:v7];
  double v9 = v8;

  [v5 doubleValueForUnit:v7];
  double v11 = v10;

  v12 = [MEMORY[0x1E4F2B370] quantityWithUnit:v7 doubleValue:v9 + v11];

  return v12;
}

- (id)_divideQuantity:(id)a3 divisor:(double)a4
{
  id v5 = a3;
  id v6 = [v5 _unit];
  [v5 doubleValueForUnit:v6];
  double v8 = v7;

  if (a4 == 0.0)
  {
    id v11 = v5;
  }
  else
  {
    double v9 = (void *)MEMORY[0x1E4F2B370];
    double v10 = [v5 _unit];
    id v11 = [v9 quantityWithUnit:v10 doubleValue:v8 / a4];
  }
  return v11;
}

- (id)_maxQuantity:(id)a3 otherQuantity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = [v6 _unit];
  [v6 doubleValueForUnit:v7];
  double v9 = v8;

  [v5 doubleValueForUnit:v7];
  double v11 = v10;

  if (v9 >= v11) {
    double v12 = v9;
  }
  else {
    double v12 = v11;
  }
  double v13 = [MEMORY[0x1E4F2B370] quantityWithUnit:v7 doubleValue:v12];

  return v13;
}

- (NSDateComponents)collationDateComponents
{
  return self->_collationDateComponents;
}

- (void)setCollationDateComponents:(id)a3
{
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (void)setTimeScope:(int64_t)a3
{
  self->_timeScope = a3;
}

- (double)collatedSummaryCount
{
  return self->_collatedSummaryCount;
}

- (void)setCollatedSummaryCount:(double)a3
{
  self->_collatedSummaryCount = a3;
}

- (double)pausedSummaryCount
{
  return self->_pausedSummaryCount;
}

- (void)setPausedSummaryCount:(double)a3
{
  self->_pausedSummaryCount = a3;
}

- (void).cxx_destruct
{
}

@end