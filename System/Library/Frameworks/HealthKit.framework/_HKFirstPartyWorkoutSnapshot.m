@interface _HKFirstPartyWorkoutSnapshot
+ (id)firstPartyWorkoutSnapshotWithCurrentWorkoutSnapshot:(id)a3;
- (double)durationForDate:(id)a3;
- (id)_initWithState:(int64_t)a3 activityType:(unint64_t)a4 elapsedTime:(double)a5 snapshotDate:(id)a6;
- (id)description;
- (int64_t)state;
- (unint64_t)activityType;
@end

@implementation _HKFirstPartyWorkoutSnapshot

- (void).cxx_destruct
{
}

- (id)_initWithState:(int64_t)a3 activityType:(unint64_t)a4 elapsedTime:(double)a5 snapshotDate:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)_HKFirstPartyWorkoutSnapshot;
  v12 = [(_HKFirstPartyWorkoutSnapshot *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_state = a3;
    v12->_activityType = a4;
    v12->_elapsedTime = a5;
    objc_storeStrong((id *)&v12->_snapshotDate, a6);
  }

  return v13;
}

+ (id)firstPartyWorkoutSnapshotWithCurrentWorkoutSnapshot:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 internalState] - 1;
  if (v5 > 0x10) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = qword_19C3D49F8[v5];
  }
  v7 = [v4 configuration];
  uint64_t v8 = [v7 activityType];

  id v9 = objc_alloc((Class)a1);
  [v4 elapsedTime];
  double v11 = v10;
  v12 = [v4 snapshotDate];

  v13 = (void *)[v9 _initWithState:v6 activityType:v8 elapsedTime:v12 snapshotDate:v11];

  return v13;
}

- (double)durationForDate:(id)a3
{
  double elapsedTime = self->_elapsedTime;
  if (self->_state == 1)
  {
    [a3 timeIntervalSinceDate:self->_snapshotDate];
    return elapsedTime + v4;
  }
  return elapsedTime;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [NSNumber numberWithInteger:self->_state];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_activityType];
  v7 = [v3 stringWithFormat:@"<%@:%p, state:%@, activityType:%@>", v4, self, v5, v6];

  return v7;
}

- (int64_t)state
{
  return self->_state;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

@end