@interface CMCameraWorkoutEvent
- (double)globalMachtime;
- (double)localMachtime;
- (int)eventType;
- (int64_t)workoutType;
- (void)setEventType:(int)a3;
- (void)setGlobalMachtime:(double)a3;
- (void)setLocalMachtime:(double)a3;
- (void)setWorkoutType:(int64_t)a3;
@end

@implementation CMCameraWorkoutEvent

- (double)localMachtime
{
  return self->_localMachtime;
}

- (void)setLocalMachtime:(double)a3
{
  self->_localMachtime = a3;
}

- (double)globalMachtime
{
  return self->_globalMachtime;
}

- (void)setGlobalMachtime:(double)a3
{
  self->_globalMachtime = a3;
}

- (int)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int)a3
{
  self->_eventType = a3;
}

- (int64_t)workoutType
{
  return self->_workoutType;
}

- (void)setWorkoutType:(int64_t)a3
{
  self->_workoutType = a3;
}

@end