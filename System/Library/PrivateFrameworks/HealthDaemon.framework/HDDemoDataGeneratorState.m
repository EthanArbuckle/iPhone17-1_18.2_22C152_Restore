@interface HDDemoDataGeneratorState
+ (BOOL)supportsSecureCoding;
- (BOOL)createdFromNSKeyedUnarchiver;
- (BOOL)isCoolingDown;
- (BOOL)isCoreTraining;
- (BOOL)isCrossCountrySkiing;
- (BOOL)isCycling;
- (BOOL)isDancing;
- (BOOL)isDoingElliptical;
- (BOOL)isDoingHIIT;
- (BOOL)isDoingYoga;
- (BOOL)isDownhillSnowSports;
- (BOOL)isExercising;
- (BOOL)isFinished;
- (BOOL)isFirstRun;
- (BOOL)isFunctionalStrengthTraining;
- (BOOL)isGolf;
- (BOOL)isHiking;
- (BOOL)isPaddleSports;
- (BOOL)isRowing;
- (BOOL)isRunning;
- (BOOL)isSkatingSports;
- (BOOL)isSoccer;
- (BOOL)isSwimming;
- (BOOL)isUnderwaterDiving;
- (BOOL)isWalking;
- (HDDemoDataGeneratorState)init;
- (HDDemoDataGeneratorState)initWithCoder:(id)a3;
- (HDDemoDataGeneratorWorkoutConfiguration)workoutConfiguration;
- (NSDate)currentDate;
- (NSDate)firstSampleDate;
- (NSDate)lastRunDate;
- (NSDate)lastSampleDate;
- (double)currentTime;
- (double)endTime;
- (double)startTime;
- (int64_t)calendarDay;
- (int64_t)currentDay;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentDay:(int64_t)a3;
- (void)setCurrentTime:(double)a3;
- (void)setEndTime:(double)a3;
- (void)setFinished:(BOOL)a3;
- (void)setFirstRun:(BOOL)a3;
- (void)setFirstSampleDate:(id)a3;
- (void)setLastRunDate:(id)a3;
- (void)setLastSampleDate:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setWorkoutConfiguration:(id)a3;
@end

@implementation HDDemoDataGeneratorState

- (HDDemoDataGeneratorState)init
{
  v8.receiver = self;
  v8.super_class = (Class)HDDemoDataGeneratorState;
  v2 = [(HDDemoDataGeneratorState *)&v8 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_createdFromNSKeyedUnarchiver = 0;
    firstSampleDate = v2->_firstSampleDate;
    v2->_firstSampleDate = 0;

    lastSampleDate = v3->_lastSampleDate;
    v3->_lastSampleDate = 0;

    lastRunDate = v3->_lastRunDate;
    v3->_lastRunDate = 0;

    v3->_endTime = 0.0;
    v3->_firstRun = 0;
    v3->_currentDay = 0;
    v3->_startTime = 0.0;
  }
  return v3;
}

- (BOOL)createdFromNSKeyedUnarchiver
{
  return self->_createdFromNSKeyedUnarchiver;
}

- (BOOL)isExercising
{
  v2 = [(HDDemoDataGeneratorState *)self workoutConfiguration];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isRunning
{
  if (![(HDDemoDataGeneratorState *)self isExercising]) {
    return 0;
  }
  BOOL v3 = [(HDDemoDataGeneratorState *)self workoutConfiguration];
  BOOL v4 = [v3 activityType] == 37;

  return v4;
}

- (BOOL)isCycling
{
  if (![(HDDemoDataGeneratorState *)self isExercising]) {
    return 0;
  }
  BOOL v3 = [(HDDemoDataGeneratorState *)self workoutConfiguration];
  BOOL v4 = [v3 activityType] == 13;

  return v4;
}

- (BOOL)isSwimming
{
  if (![(HDDemoDataGeneratorState *)self isExercising]) {
    return 0;
  }
  BOOL v3 = [(HDDemoDataGeneratorState *)self workoutConfiguration];
  BOOL v4 = [v3 activityType] == 46;

  return v4;
}

- (BOOL)isDoingHIIT
{
  if (![(HDDemoDataGeneratorState *)self isExercising]) {
    return 0;
  }
  BOOL v3 = [(HDDemoDataGeneratorState *)self workoutConfiguration];
  BOOL v4 = [v3 activityType] == 63;

  return v4;
}

- (BOOL)isDoingElliptical
{
  if (![(HDDemoDataGeneratorState *)self isExercising]) {
    return 0;
  }
  BOOL v3 = [(HDDemoDataGeneratorState *)self workoutConfiguration];
  BOOL v4 = [v3 activityType] == 16;

  return v4;
}

- (BOOL)isWalking
{
  if (![(HDDemoDataGeneratorState *)self isExercising]) {
    return 0;
  }
  BOOL v3 = [(HDDemoDataGeneratorState *)self workoutConfiguration];
  BOOL v4 = [v3 activityType] == 52;

  return v4;
}

- (BOOL)isDoingYoga
{
  if (![(HDDemoDataGeneratorState *)self isExercising]) {
    return 0;
  }
  BOOL v3 = [(HDDemoDataGeneratorState *)self workoutConfiguration];
  BOOL v4 = [v3 activityType] == 57;

  return v4;
}

- (BOOL)isHiking
{
  if (![(HDDemoDataGeneratorState *)self isExercising]) {
    return 0;
  }
  BOOL v3 = [(HDDemoDataGeneratorState *)self workoutConfiguration];
  BOOL v4 = [v3 activityType] == 24;

  return v4;
}

- (BOOL)isCoolingDown
{
  if (![(HDDemoDataGeneratorState *)self isExercising]) {
    return 0;
  }
  BOOL v3 = [(HDDemoDataGeneratorState *)self workoutConfiguration];
  BOOL v4 = [v3 activityType] == 80;

  return v4;
}

- (BOOL)isUnderwaterDiving
{
  if (![(HDDemoDataGeneratorState *)self isExercising]) {
    return 0;
  }
  BOOL v3 = [(HDDemoDataGeneratorState *)self workoutConfiguration];
  BOOL v4 = [v3 activityType] == 84;

  return v4;
}

- (BOOL)isCrossCountrySkiing
{
  if (![(HDDemoDataGeneratorState *)self isExercising]) {
    return 0;
  }
  BOOL v3 = [(HDDemoDataGeneratorState *)self workoutConfiguration];
  BOOL v4 = [v3 activityType] == 60;

  return v4;
}

- (BOOL)isRowing
{
  if (![(HDDemoDataGeneratorState *)self isExercising]) {
    return 0;
  }
  BOOL v3 = [(HDDemoDataGeneratorState *)self workoutConfiguration];
  BOOL v4 = [v3 activityType] == 35;

  return v4;
}

- (BOOL)isSkatingSports
{
  if (![(HDDemoDataGeneratorState *)self isExercising]) {
    return 0;
  }
  BOOL v3 = [(HDDemoDataGeneratorState *)self workoutConfiguration];
  BOOL v4 = [v3 activityType] == 39;

  return v4;
}

- (BOOL)isPaddleSports
{
  if (![(HDDemoDataGeneratorState *)self isExercising]) {
    return 0;
  }
  BOOL v3 = [(HDDemoDataGeneratorState *)self workoutConfiguration];
  BOOL v4 = [v3 activityType] == 31;

  return v4;
}

- (BOOL)isGolf
{
  if (![(HDDemoDataGeneratorState *)self isExercising]) {
    return 0;
  }
  BOOL v3 = [(HDDemoDataGeneratorState *)self workoutConfiguration];
  BOOL v4 = [v3 activityType] == 21;

  return v4;
}

- (BOOL)isDownhillSnowSports
{
  if (![(HDDemoDataGeneratorState *)self isExercising]) {
    return 0;
  }
  BOOL v3 = [(HDDemoDataGeneratorState *)self workoutConfiguration];
  if ([v3 activityType] == 61)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(HDDemoDataGeneratorState *)self workoutConfiguration];
    BOOL v4 = [v5 activityType] == 67;
  }
  return v4;
}

- (BOOL)isSoccer
{
  if (![(HDDemoDataGeneratorState *)self isExercising]) {
    return 0;
  }
  BOOL v3 = [(HDDemoDataGeneratorState *)self workoutConfiguration];
  BOOL v4 = [v3 activityType] == 41;

  return v4;
}

- (NSDate)currentDate
{
  BOOL v3 = [(HDDemoDataGeneratorState *)self firstSampleDate];
  [(HDDemoDataGeneratorState *)self currentTime];
  v5 = [v3 dateByAddingTimeInterval:v4 * 86400.0];

  return (NSDate *)v5;
}

- (void)setCurrentDay:(int64_t)a3
{
  self->_currentDay = a3;
}

- (int64_t)calendarDay
{
  BOOL v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  double v4 = [(HDDemoDataGeneratorState *)self currentDate];
  int64_t v5 = [v3 component:512 fromDate:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDDemoDataGeneratorState)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDDemoDataGeneratorState;
  int64_t v5 = [(HDDemoDataGeneratorState *)&v16 init];
  v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->_createdFromNSKeyedUnarchiver = 1;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDDemoDataGeneratorStateFirstSampleDateKey"];
    firstSampleDate = v6->_firstSampleDate;
    v6->_firstSampleDate = (NSDate *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDDemoDataGeneratorStateLastSampleDateKey"];
    lastSampleDate = v6->_lastSampleDate;
    v6->_lastSampleDate = (NSDate *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDDemoDataGeneratorStateLastRunDateKey"];
    lastRunDate = v6->_lastRunDate;
    v6->_lastRunDate = (NSDate *)v11;

    v6->_currentDay = [v4 decodeIntegerForKey:@"HDDemoDataGeneratorStateCurrentDayKey"];
    [v4 decodeDoubleForKey:@"HDDemoDataGeneratorStateStartTimeKey"];
    v6->_startTime = v13;
    [v4 decodeDoubleForKey:@"HDDemoDataGeneratorStateEndTimeKey"];
    v6->_endTime = v14;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  firstSampleDate = self->_firstSampleDate;
  id v5 = a3;
  [v5 encodeObject:firstSampleDate forKey:@"HDDemoDataGeneratorStateFirstSampleDateKey"];
  [v5 encodeObject:self->_lastSampleDate forKey:@"HDDemoDataGeneratorStateLastSampleDateKey"];
  [v5 encodeObject:self->_lastRunDate forKey:@"HDDemoDataGeneratorStateLastRunDateKey"];
  [v5 encodeInteger:self->_currentDay forKey:@"HDDemoDataGeneratorStateCurrentDayKey"];
  [v5 encodeDouble:@"HDDemoDataGeneratorStateStartTimeKey" forKey:self->_startTime];
  [v5 encodeDouble:@"HDDemoDataGeneratorStateEndTimeKey" forKey:self->_endTime];
}

- (NSDate)firstSampleDate
{
  return self->_firstSampleDate;
}

- (void)setFirstSampleDate:(id)a3
{
}

- (NSDate)lastSampleDate
{
  return self->_lastSampleDate;
}

- (void)setLastSampleDate:(id)a3
{
}

- (NSDate)lastRunDate
{
  return self->_lastRunDate;
}

- (void)setLastRunDate:(id)a3
{
}

- (int64_t)currentDay
{
  return self->_currentDay;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)isFirstRun
{
  return self->_firstRun;
}

- (void)setFirstRun:(BOOL)a3
{
  self->_firstRun = a3;
}

- (BOOL)isCoreTraining
{
  return self->_coreTraining;
}

- (BOOL)isDancing
{
  return self->_dancing;
}

- (BOOL)isFunctionalStrengthTraining
{
  return self->_functionalStrengthTraining;
}

- (HDDemoDataGeneratorWorkoutConfiguration)workoutConfiguration
{
  return self->_workoutConfiguration;
}

- (void)setWorkoutConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
  objc_storeStrong((id *)&self->_lastRunDate, 0);
  objc_storeStrong((id *)&self->_lastSampleDate, 0);

  objc_storeStrong((id *)&self->_firstSampleDate, 0);
}

@end