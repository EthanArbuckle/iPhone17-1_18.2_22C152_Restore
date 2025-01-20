@interface ACHActivityAwardingEnvironment
- (ACHActivityAwardingDataProvider)dataProvider;
- (ACHActivityAwardingDateCache)dateCache;
- (ACHActivityAwardingEnvironment)initWithDataProvider:(id)a3;
- (BOOL)todayIsStandalonePhoneFitnessMode;
- (BOOL)valueForKeyLoggingEnabled;
- (id)bestExerciseGoal;
- (id)bestExerciseStreak;
- (id)bestExerciseValue;
- (id)bestMoveGoal;
- (id)bestMoveStreak;
- (id)bestMoveTimeGoal;
- (id)bestMoveTimeValue;
- (id)bestMoveValue;
- (id)bestStandGoal;
- (id)bestStandStreak;
- (id)bestStandValue;
- (id)currentExercisePercentage;
- (id)currentExerciseStreak;
- (id)currentMonthMoveStreak;
- (id)currentMovePercentage;
- (id)currentMoveStreak;
- (id)currentMoveTimePercentage;
- (id)currentStandPercentage;
- (id)currentStandStreak;
- (id)currentStreakForAllActivity;
- (id)currentWeekExerciseStreak;
- (id)currentWeekMoveStreak;
- (id)currentWeekStandStreak;
- (id)currentWeekStreakForAllActivity;
- (id)dayOfMonthForToday;
- (id)dayOfWeekForLastDayOfFitnessWeek;
- (id)dayOfWeekForToday;
- (id)numberOfDaysInThisMonth;
- (id)previousBestExerciseGoal;
- (id)previousBestExerciseStreak;
- (id)previousBestMoveGoal;
- (id)previousBestMoveStreak;
- (id)previousBestMoveTimeGoal;
- (id)previousBestStandGoal;
- (id)previousBestStandStreak;
- (id)previousExercisePercentage;
- (id)previousMovePercentage;
- (id)previousMoveTimePercentage;
- (id)previousStandPercentage;
- (id)requiredDaysOfActivityHistoryForRecords;
- (id)requiredDaysOfActivityHistoryForStreaks;
- (id)todayAgnosticMoveGoal;
- (id)todayAgnosticMoveValue;
- (id)todayExerciseGoal;
- (id)todayExerciseValue;
- (id)todayMoveGoal;
- (id)todayMoveTimeGoal;
- (id)todayMoveTimeValue;
- (id)todayMoveValue;
- (id)todayStandGoal;
- (id)todayStandValue;
- (id)totalAllGoalsMet;
- (id)totalDaysOfExerciseHistory;
- (id)totalDaysOfMoveHistory;
- (id)totalDaysOfStandHistory;
- (id)totalExerciseGoalsMet;
- (id)totalMoveGoalsMet;
- (id)totalStandGoalsMet;
- (id)valueForKey:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (id)yesterdayExerciseValue;
- (id)yesterdayMoveTimeValue;
- (id)yesterdayMoveValue;
- (id)yesterdayStandValue;
- (int64_t)todayActivityMoveMode;
- (unint64_t)experienceType;
- (void)setCurrentDateComponents:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setDateCache:(id)a3;
- (void)setExperienceType:(unint64_t)a3;
- (void)setValueForKeyLoggingEnabled:(BOOL)a3;
@end

@implementation ACHActivityAwardingEnvironment

- (id)bestMoveValue
{
  v2 = NSNumber;
  v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  v4 = [v3 properties];
  [v4 bestMoveValue];
  v5 = objc_msgSend(v2, "numberWithDouble:");

  return v5;
}

- (id)bestExerciseValue
{
  v2 = NSNumber;
  v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  v4 = [v3 properties];
  [v4 bestExerciseValue];
  v5 = objc_msgSend(v2, "numberWithDouble:");

  return v5;
}

- (id)bestMoveTimeValue
{
  v2 = NSNumber;
  v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  v4 = [v3 properties];
  [v4 bestMoveTimeValue];
  v5 = objc_msgSend(v2, "numberWithDouble:");

  return v5;
}

- (id)bestMoveStreak
{
  v2 = NSNumber;
  v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  v4 = [v3 properties];
  v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "bestMoveStreak"));

  return v5;
}

- (id)todayMoveTimeGoal
{
  v3 = ACHCanonicalUnitForGoalType(3);
  v4 = NSNumber;
  v5 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  v6 = [v5 todayMoveTimeGoal];
  [v6 doubleValueForUnit:v3];
  v7 = objc_msgSend(v4, "numberWithDouble:");

  return v7;
}

- (id)todayAgnosticMoveGoal
{
  if ([(ACHActivityAwardingEnvironment *)self todayActivityMoveMode] == 2) {
    [(ACHActivityAwardingEnvironment *)self todayMoveTimeGoal];
  }
  else {
  v3 = [(ACHActivityAwardingEnvironment *)self todayMoveGoal];
  }
  return v3;
}

- (id)currentMoveStreak
{
  v2 = NSNumber;
  v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  v4 = [v3 properties];
  v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "currentMoveStreak"));

  return v5;
}

- (id)currentMonthMoveStreak
{
  v2 = NSNumber;
  v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  v4 = [v3 properties];
  v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "currentMonthMoveStreak"));

  return v5;
}

- (id)todayExerciseValue
{
  v3 = ACHCanonicalUnitForGoalType(1);
  v4 = NSNumber;
  v5 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  v6 = [v5 todayExerciseValue];
  [v6 doubleValueForUnit:v3];
  v7 = objc_msgSend(v4, "numberWithDouble:");

  return v7;
}

- (id)totalMoveGoalsMet
{
  v2 = NSNumber;
  v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  v4 = [v3 properties];
  v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "totalMoveGoalsMade"));

  return v5;
}

- (id)currentWeekStreakForAllActivity
{
  v3 = [(ACHActivityAwardingEnvironment *)self currentWeekMoveStreak];
  uint64_t v4 = [v3 integerValue];

  v5 = [(ACHActivityAwardingEnvironment *)self currentWeekExerciseStreak];
  uint64_t v6 = [v5 integerValue];

  if (v4 >= v6) {
    uint64_t v4 = v6;
  }
  v7 = [(ACHActivityAwardingEnvironment *)self currentWeekStandStreak];
  uint64_t v8 = [v7 integerValue];

  if (v4 >= v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v4;
  }
  v10 = NSNumber;
  return (id)[v10 numberWithInteger:v9];
}

- (id)currentWeekStandStreak
{
  v2 = NSNumber;
  v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  uint64_t v4 = [v3 properties];
  v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "currentWeekStandStreak"));

  return v5;
}

- (id)currentWeekMoveStreak
{
  v2 = NSNumber;
  v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  uint64_t v4 = [v3 properties];
  v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "currentWeekMoveStreak"));

  return v5;
}

- (id)currentWeekExerciseStreak
{
  v2 = NSNumber;
  v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  uint64_t v4 = [v3 properties];
  v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "currentWeekExerciseStreak"));

  return v5;
}

- (id)todayMoveGoal
{
  v3 = ACHCanonicalUnitForGoalType(0);
  uint64_t v4 = NSNumber;
  v5 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  uint64_t v6 = [v5 todayMoveGoal];
  [v6 doubleValueForUnit:v3];
  v7 = objc_msgSend(v4, "numberWithDouble:");

  return v7;
}

- (id)todayAgnosticMoveValue
{
  if ([(ACHActivityAwardingEnvironment *)self todayActivityMoveMode] == 2) {
    [(ACHActivityAwardingEnvironment *)self todayMoveTimeValue];
  }
  else {
  v3 = [(ACHActivityAwardingEnvironment *)self todayMoveValue];
  }
  return v3;
}

- (int64_t)todayActivityMoveMode
{
  v2 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  v3 = [v2 todayActivitySummary];
  int64_t v4 = [v3 activityMoveMode];

  return v4;
}

- (id)todayMoveTimeValue
{
  v3 = ACHCanonicalUnitForGoalType(3);
  int64_t v4 = NSNumber;
  v5 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  uint64_t v6 = [v5 todayMoveTimeValue];
  [v6 doubleValueForUnit:v3];
  v7 = objc_msgSend(v4, "numberWithDouble:");

  return v7;
}

- (id)todayMoveValue
{
  v3 = ACHCanonicalUnitForGoalType(0);
  int64_t v4 = NSNumber;
  v5 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  uint64_t v6 = [v5 todayMoveValue];
  [v6 doubleValueForUnit:v3];
  v7 = objc_msgSend(v4, "numberWithDouble:");

  return v7;
}

- (ACHActivityAwardingDataProvider)dataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
  return (ACHActivityAwardingDataProvider *)WeakRetained;
}

- (id)valueForKey:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(ACHActivityAwardingEnvironment *)self valueForKeyLoggingEnabled])
  {
    v9.receiver = self;
    v9.super_class = (Class)ACHActivityAwardingEnvironment;
    v5 = [(ACHActivityAwardingEnvironment *)&v9 valueForKey:v4];
    uint64_t v6 = ACHLogAwardEngine();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_21F5DA000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@", buf, 0x16u);
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ACHActivityAwardingEnvironment;
    v5 = [(ACHActivityAwardingEnvironment *)&v8 valueForKey:v4];
  }

  return v5;
}

- (BOOL)valueForKeyLoggingEnabled
{
  return self->_valueForKeyLoggingEnabled;
}

- (id)numberOfDaysInThisMonth
{
  v2 = [(ACHActivityAwardingEnvironment *)self dateCache];
  v3 = [v2 numberOfDaysInThisMonth];

  return v3;
}

- (ACHActivityAwardingDateCache)dateCache
{
  return self->_dateCache;
}

- (ACHActivityAwardingEnvironment)initWithDataProvider:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ACHActivityAwardingEnvironment;
  v5 = [(ACHActivityAwardingEnvironment *)&v12 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataProvider, v4);
    v7 = [ACHActivityAwardingDateCache alloc];
    objc_super v8 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
    uint64_t v9 = [(ACHActivityAwardingDateCache *)v7 initWithCalendar:v8];
    dateCache = v6->_dateCache;
    v6->_dateCache = (ACHActivityAwardingDateCache *)v9;

    v6->_experienceType = 3;
  }

  return v6;
}

- (void)setCurrentDateComponents:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHActivityAwardingEnvironment *)self dateCache];
  [v5 setCurrentDateComponents:v4];
}

- (id)valueForUndefinedKey:(id)a3
{
  id v3 = a3;
  id v4 = ACHLogAwardEngine();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[ACHActivityAwardingEnvironment valueForUndefinedKey:]((uint64_t)v3, v4);
  }

  return 0;
}

- (BOOL)todayIsStandalonePhoneFitnessMode
{
  v2 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  id v3 = [v2 todayActivitySummary];
  char v4 = [v3 _isStandalonePhoneSummary];

  return v4;
}

- (id)yesterdayMoveValue
{
  id v3 = ACHCanonicalUnitForGoalType(0);
  char v4 = NSNumber;
  id v5 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  uint64_t v6 = [v5 yesterdayMoveValue];
  [v6 doubleValueForUnit:v3];
  v7 = objc_msgSend(v4, "numberWithDouble:");

  return v7;
}

- (id)previousBestMoveGoal
{
  v2 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  id v3 = [v2 properties];
  char v4 = [v3 previousValues];

  id v5 = NSNumber;
  [v4 bestMoveGoalValue];
  uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");

  return v6;
}

- (id)bestMoveGoal
{
  v2 = NSNumber;
  id v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  char v4 = [v3 properties];
  [v4 bestMoveGoalValue];
  id v5 = objc_msgSend(v2, "numberWithDouble:");

  return v5;
}

- (id)totalDaysOfMoveHistory
{
  v2 = NSNumber;
  id v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  char v4 = [v3 properties];
  id v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "totalMoveGoalsAttempted"));

  return v5;
}

- (id)previousBestMoveStreak
{
  v2 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  id v3 = [v2 properties];
  char v4 = [v3 previousValues];

  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "bestMoveStreak"));

  return v5;
}

- (id)currentMovePercentage
{
  if ([(ACHActivityAwardingEnvironment *)self todayActivityMoveMode] == 2) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 0;
  }
  char v4 = ACHCanonicalUnitForGoalType(v3);
  if ([(ACHActivityAwardingEnvironment *)self todayActivityMoveMode] == 2) {
    [(ACHActivityAwardingEnvironment *)self todayMoveTimeValue];
  }
  else {
  id v5 = [(ACHActivityAwardingEnvironment *)self todayMoveValue];
  }
  [v5 doubleValue];
  double v7 = v6;

  int64_t v8 = [(ACHActivityAwardingEnvironment *)self todayActivityMoveMode];
  uint64_t v9 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  v10 = v9;
  if (v8 == 2) {
    [v9 todayMoveTimeGoal];
  }
  else {
  id v11 = [v9 todayMoveGoal];
  }
  [v11 doubleValueForUnit:v4];
  double v13 = v12;

  if (v13 >= 2.22044605e-16)
  {
    uint64_t v14 = [NSNumber numberWithDouble:v7 / v13];
  }
  else
  {
    uint64_t v14 = &unk_26D116328;
  }

  return v14;
}

- (id)previousMovePercentage
{
  if ([(ACHActivityAwardingEnvironment *)self todayActivityMoveMode] == 2) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 0;
  }
  char v4 = ACHCanonicalUnitForGoalType(v3);
  int64_t v5 = [(ACHActivityAwardingEnvironment *)self todayActivityMoveMode];
  double v6 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  double v7 = v6;
  if (v5 == 2) {
    [v6 previousProcessedTodayMoveTimeValue];
  }
  else {
  int64_t v8 = [v6 previousProcessedTodayMoveValue];
  }
  [v8 doubleValueForUnit:v4];
  double v10 = v9;

  int64_t v11 = [(ACHActivityAwardingEnvironment *)self todayActivityMoveMode];
  double v12 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  double v13 = v12;
  if (v11 == 2) {
    [v12 todayMoveTimeGoal];
  }
  else {
  uint64_t v14 = [v12 todayMoveGoal];
  }
  [v14 doubleValueForUnit:v4];
  double v16 = v15;

  if (v16 >= 2.22044605e-16)
  {
    v17 = [NSNumber numberWithDouble:v10 / v16];
  }
  else
  {
    v17 = &unk_26D116328;
  }

  return v17;
}

- (id)yesterdayMoveTimeValue
{
  uint64_t v3 = ACHCanonicalUnitForGoalType(3);
  char v4 = NSNumber;
  int64_t v5 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  double v6 = [v5 yesterdayMoveTimeValue];
  [v6 doubleValueForUnit:v3];
  double v7 = objc_msgSend(v4, "numberWithDouble:");

  return v7;
}

- (id)previousBestMoveTimeGoal
{
  v2 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  uint64_t v3 = [v2 properties];
  char v4 = [v3 previousValues];

  int64_t v5 = NSNumber;
  [v4 bestMoveTimeGoalValue];
  double v6 = objc_msgSend(v5, "numberWithDouble:");

  return v6;
}

- (id)bestMoveTimeGoal
{
  v2 = NSNumber;
  uint64_t v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  char v4 = [v3 properties];
  [v4 bestMoveTimeGoalValue];
  int64_t v5 = objc_msgSend(v2, "numberWithDouble:");

  return v5;
}

- (id)currentMoveTimePercentage
{
  uint64_t v3 = ACHCanonicalUnitForGoalType(0);
  char v4 = [(ACHActivityAwardingEnvironment *)self todayMoveValue];
  [v4 doubleValue];
  double v6 = v5;

  double v7 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  int64_t v8 = [v7 todayMoveGoal];
  [v8 doubleValueForUnit:v3];
  double v10 = v9;

  if (v10 >= 2.22044605e-16)
  {
    int64_t v11 = [NSNumber numberWithDouble:v6 / v10];
  }
  else
  {
    int64_t v11 = &unk_26D116328;
  }

  return v11;
}

- (id)previousMoveTimePercentage
{
  uint64_t v3 = ACHCanonicalUnitForGoalType(0);
  char v4 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  double v5 = [v4 previousProcessedTodayMoveValue];
  [v5 doubleValueForUnit:v3];
  double v7 = v6;

  int64_t v8 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  double v9 = [v8 todayMoveGoal];
  [v9 doubleValueForUnit:v3];
  double v11 = v10;

  if (v11 >= 2.22044605e-16)
  {
    double v12 = [NSNumber numberWithDouble:v7 / v11];
  }
  else
  {
    double v12 = &unk_26D116328;
  }

  return v12;
}

- (id)todayExerciseGoal
{
  uint64_t v3 = ACHCanonicalUnitForGoalType(1);
  char v4 = NSNumber;
  double v5 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  double v6 = [v5 todayExerciseGoal];
  [v6 doubleValueForUnit:v3];
  double v7 = objc_msgSend(v4, "numberWithDouble:");

  return v7;
}

- (id)yesterdayExerciseValue
{
  uint64_t v3 = ACHCanonicalUnitForGoalType(1);
  char v4 = NSNumber;
  double v5 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  double v6 = [v5 yesterdayExerciseValue];
  [v6 doubleValueForUnit:v3];
  double v7 = objc_msgSend(v4, "numberWithDouble:");

  return v7;
}

- (id)previousBestExerciseGoal
{
  v2 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  uint64_t v3 = [v2 properties];
  char v4 = [v3 previousValues];

  double v5 = NSNumber;
  [v4 bestExerciseGoalValue];
  double v6 = objc_msgSend(v5, "numberWithDouble:");

  return v6;
}

- (id)bestExerciseGoal
{
  v2 = NSNumber;
  uint64_t v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  char v4 = [v3 properties];
  [v4 bestExerciseGoalValue];
  double v5 = objc_msgSend(v2, "numberWithDouble:");

  return v5;
}

- (id)totalDaysOfExerciseHistory
{
  v2 = NSNumber;
  uint64_t v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  char v4 = [v3 properties];
  double v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "totalExerciseGoalsAttempted"));

  return v5;
}

- (id)totalExerciseGoalsMet
{
  v2 = NSNumber;
  uint64_t v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  char v4 = [v3 properties];
  double v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "totalExerciseGoalsMade"));

  return v5;
}

- (id)currentExerciseStreak
{
  v2 = NSNumber;
  uint64_t v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  char v4 = [v3 properties];
  double v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "currentExerciseStreak"));

  return v5;
}

- (id)bestExerciseStreak
{
  v2 = NSNumber;
  uint64_t v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  char v4 = [v3 properties];
  double v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "bestExerciseStreak"));

  return v5;
}

- (id)previousBestExerciseStreak
{
  v2 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  uint64_t v3 = [v2 properties];
  char v4 = [v3 previousValues];

  double v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "bestExerciseStreak"));

  return v5;
}

- (id)currentExercisePercentage
{
  uint64_t v3 = ACHCanonicalUnitForGoalType(1);
  char v4 = [(ACHActivityAwardingEnvironment *)self todayExerciseValue];
  [v4 doubleValue];
  double v6 = v5;

  double v7 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  int64_t v8 = [v7 todayExerciseGoal];
  [v8 doubleValueForUnit:v3];
  double v10 = v9;

  if (v10 >= 2.22044605e-16)
  {
    double v11 = [NSNumber numberWithDouble:v6 / v10];
  }
  else
  {
    double v11 = &unk_26D116328;
  }

  return v11;
}

- (id)previousExercisePercentage
{
  uint64_t v3 = ACHCanonicalUnitForGoalType(1);
  char v4 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  double v5 = [v4 previousProcessedTodayExerciseValue];
  [v5 doubleValueForUnit:v3];
  double v7 = v6;

  int64_t v8 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  double v9 = [v8 todayExerciseGoal];
  [v9 doubleValueForUnit:v3];
  double v11 = v10;

  if (v11 >= 2.22044605e-16)
  {
    double v12 = [NSNumber numberWithDouble:v7 / v11];
  }
  else
  {
    double v12 = &unk_26D116328;
  }

  return v12;
}

- (id)todayStandValue
{
  uint64_t v3 = ACHCanonicalUnitForGoalType(2);
  char v4 = NSNumber;
  double v5 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  double v6 = [v5 todayStandValue];
  [v6 doubleValueForUnit:v3];
  double v7 = objc_msgSend(v4, "numberWithDouble:");

  return v7;
}

- (id)todayStandGoal
{
  uint64_t v3 = ACHCanonicalUnitForGoalType(2);
  char v4 = NSNumber;
  double v5 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  double v6 = [v5 todayStandGoal];
  [v6 doubleValueForUnit:v3];
  double v7 = objc_msgSend(v4, "numberWithDouble:");

  return v7;
}

- (id)yesterdayStandValue
{
  uint64_t v3 = ACHCanonicalUnitForGoalType(2);
  char v4 = NSNumber;
  double v5 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  double v6 = [v5 yesterdayStandValue];
  [v6 doubleValueForUnit:v3];
  double v7 = objc_msgSend(v4, "numberWithDouble:");

  return v7;
}

- (id)bestStandValue
{
  v2 = NSNumber;
  uint64_t v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  char v4 = [v3 properties];
  double v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "bestStandValue"));

  return v5;
}

- (id)previousBestStandGoal
{
  v2 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  uint64_t v3 = [v2 properties];
  char v4 = [v3 previousValues];

  double v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "bestStandGoalValue"));

  return v5;
}

- (id)bestStandGoal
{
  v2 = NSNumber;
  uint64_t v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  char v4 = [v3 properties];
  double v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "bestStandGoalValue"));

  return v5;
}

- (id)totalDaysOfStandHistory
{
  v2 = NSNumber;
  uint64_t v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  char v4 = [v3 properties];
  double v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "totalStandGoalsAttempted"));

  return v5;
}

- (id)totalStandGoalsMet
{
  v2 = NSNumber;
  uint64_t v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  char v4 = [v3 properties];
  double v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "totalStandGoalsMade"));

  return v5;
}

- (id)currentStandStreak
{
  v2 = NSNumber;
  uint64_t v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  char v4 = [v3 properties];
  double v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "currentStandStreak"));

  return v5;
}

- (id)bestStandStreak
{
  v2 = NSNumber;
  uint64_t v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  char v4 = [v3 properties];
  double v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "bestStandStreak"));

  return v5;
}

- (id)previousBestStandStreak
{
  v2 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  uint64_t v3 = [v2 properties];
  char v4 = [v3 previousValues];

  double v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "bestStandStreak"));

  return v5;
}

- (id)currentStandPercentage
{
  uint64_t v3 = ACHCanonicalUnitForGoalType(2);
  char v4 = [(ACHActivityAwardingEnvironment *)self todayStandValue];
  [v4 doubleValue];
  double v6 = v5;

  double v7 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  int64_t v8 = [v7 todayStandGoal];
  [v8 doubleValueForUnit:v3];
  double v10 = v9;

  if (v10 >= 2.22044605e-16)
  {
    double v11 = [NSNumber numberWithDouble:v6 / v10];
  }
  else
  {
    double v11 = &unk_26D116328;
  }

  return v11;
}

- (id)previousStandPercentage
{
  uint64_t v3 = ACHCanonicalUnitForGoalType(2);
  char v4 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  double v5 = [v4 previousProcessedTodayStandValue];
  [v5 doubleValueForUnit:v3];
  double v7 = v6;

  int64_t v8 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  double v9 = [v8 todayStandGoal];
  [v9 doubleValueForUnit:v3];
  double v11 = v10;

  if (v11 >= 2.22044605e-16)
  {
    double v12 = [NSNumber numberWithDouble:v7 / v11];
  }
  else
  {
    double v12 = &unk_26D116328;
  }

  return v12;
}

- (id)currentStreakForAllActivity
{
  uint64_t v3 = [(ACHActivityAwardingEnvironment *)self currentMoveStreak];
  uint64_t v4 = [v3 integerValue];

  double v5 = [(ACHActivityAwardingEnvironment *)self currentExerciseStreak];
  uint64_t v6 = [v5 integerValue];

  if (v4 >= v6) {
    uint64_t v4 = v6;
  }
  double v7 = [(ACHActivityAwardingEnvironment *)self currentStandStreak];
  uint64_t v8 = [v7 integerValue];

  if (v4 >= v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v4;
  }
  double v10 = NSNumber;
  return (id)[v10 numberWithInteger:v9];
}

- (id)totalAllGoalsMet
{
  v2 = NSNumber;
  uint64_t v3 = [(ACHActivityAwardingEnvironment *)self dataProvider];
  uint64_t v4 = [v3 properties];
  double v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "totalAllGoalsMade"));

  return v5;
}

- (id)dayOfWeekForToday
{
  v2 = [(ACHActivityAwardingEnvironment *)self dateCache];
  uint64_t v3 = [v2 dayOfWeekForToday];

  return v3;
}

- (id)dayOfWeekForLastDayOfFitnessWeek
{
  v2 = [(ACHActivityAwardingEnvironment *)self dateCache];
  uint64_t v3 = [v2 dayOfWeekForLastDayOfFitnessWeek];

  return v3;
}

- (id)dayOfMonthForToday
{
  v2 = [(ACHActivityAwardingEnvironment *)self dateCache];
  uint64_t v3 = [v2 dayOfMonthForToday];

  return v3;
}

- (id)requiredDaysOfActivityHistoryForRecords
{
  return (id)[NSNumber numberWithInteger:*MEMORY[0x263F235B8]];
}

- (id)requiredDaysOfActivityHistoryForStreaks
{
  return (id)[NSNumber numberWithInteger:*MEMORY[0x263F235C0]];
}

- (void)setDataProvider:(id)a3
{
}

- (void)setValueForKeyLoggingEnabled:(BOOL)a3
{
  self->_valueForKeyLoggingEnabled = a3;
}

- (unint64_t)experienceType
{
  return self->_experienceType;
}

- (void)setExperienceType:(unint64_t)a3
{
  self->_experienceType = a3;
}

- (void)setDateCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_destroyWeak((id *)&self->_dataProvider);
}

- (void)valueForUndefinedKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_FAULT, "Activity Awarding environment asked for key it doesn't support: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end