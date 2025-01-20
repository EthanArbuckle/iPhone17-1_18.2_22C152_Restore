@interface CHCompanionWorkoutCreditManagerInterval
- (CHCompanionWorkoutCreditManagerInterval)initWithDateInterval:(id)a3 activityMoveMode:(int64_t)a4;
- (NSDateInterval)dateInterval;
- (int64_t)activityMoveMode;
@end

@implementation CHCompanionWorkoutCreditManagerInterval

- (CHCompanionWorkoutCreditManagerInterval)initWithDateInterval:(id)a3 activityMoveMode:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHCompanionWorkoutCreditManagerInterval;
  v8 = [(CHCompanionWorkoutCreditManagerInterval *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dateInterval, a3);
    v9->_activityMoveMode = a4;
  }

  return v9;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (int64_t)activityMoveMode
{
  return self->_activityMoveMode;
}

- (void).cxx_destruct
{
}

@end