@interface _ATXAppHistoricalAverageDose
- (_ATXAppHistoricalAverageDose)initWith:(id)a3 endDate:(id)a4 timeZone:(id)a5 alpha:(double)a6;
- (_ATXMovingAverage)movingAverage;
- (void)_finishCurrentDay;
- (void)_updateMovingAverageForOneDay:(double)a3;
- (void)addDuration:(id)a3 endDate:(id)a4;
- (void)skipTo:(id)a3;
@end

@implementation _ATXAppHistoricalAverageDose

- (_ATXAppHistoricalAverageDose)initWith:(id)a3 endDate:(id)a4 timeZone:(id)a5 alpha:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_ATXAppHistoricalAverageDose;
  v13 = [(_ATXAppHistoricalAverageDose *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_timeZone, a5);
    uint64_t v15 = +[ATXTimeUtil getDayFromTime:v10 timeZone:v14->_timeZone];
    currentDay = v14->_currentDay;
    v14->_currentDay = (NSDate *)v15;

    [v11 timeIntervalSinceDate:v10];
    v14->_currentDuration = v17;
    v18 = [[_ATXMovingAverage alloc] initWithAlpha:a6];
    movingAverage = v14->_movingAverage;
    v14->_movingAverage = v18;

    v14->_dayCount = 0;
  }

  return v14;
}

- (void)addDuration:(id)a3 endDate:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  v8 = +[ATXTimeUtil getDayFromTime:v13 timeZone:self->_timeZone];
  [v7 timeIntervalSinceDate:v13];
  double v10 = v9;
  if ([v8 isEqual:self->_currentDay])
  {
    self->_currentDuration = v10 + self->_currentDuration;
LABEL_7:

    return;
  }
  if ([v8 compare:self->_currentDay] == 1)
  {
    while ([v8 compare:self->_currentDay] == 1)
      [(_ATXAppHistoricalAverageDose *)self _finishCurrentDay];
    self->_currentDuration = v10;
    goto LABEL_7;
  }
  if (([MEMORY[0x1E4F93B08] isInternalBuild] & 1) != 0
    || +[_ATXAggregateLogger yesWithProbability:0.0001])
  {
    id v11 = [NSString stringWithFormat:@"LaunchDay is %@, which is earlier than currentDay: %@ - Time Zone: %@", v8, self->_currentDay, self->_timeZone];
    [MEMORY[0x1E4F93AE8] simulateCrashWithDescription:v11];
  }
  id v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, self, @"_ATXAppDailyDose.m", 92, @"LaunchDay is %@, which is earlier than currentDay: %@", v8, self->_currentDay object file lineNumber description];

  __break(1u);
}

- (void)skipTo:(id)a3
{
  id v6 = a3;
  if ([v6 compare:self->_currentDay] == -1)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"_ATXAppDailyDose.m", 99, @"Invalid parameter not satisfying: %@", @"[day compare:_currentDay] != NSOrderedAscending" object file lineNumber description];
  }
  while ([v6 compare:self->_currentDay] == 1)
    [(_ATXAppHistoricalAverageDose *)self _finishCurrentDay];
}

- (void)_updateMovingAverageForOneDay:(double)a3
{
}

- (void)_finishCurrentDay
{
  [(_ATXAppHistoricalAverageDose *)self _updateMovingAverageForOneDay:self->_currentDuration];
  v3 = +[ATXTimeUtil nextStartOfDayAfter:self->_currentDay timeZone:self->_timeZone];
  currentDay = self->_currentDay;
  self->_currentDay = v3;

  self->_currentDuration = 0.0;
}

- (_ATXMovingAverage)movingAverage
{
  return self->_movingAverage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movingAverage, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_currentDay, 0);
}

@end