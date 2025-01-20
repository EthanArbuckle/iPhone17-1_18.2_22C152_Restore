@interface DDRFakeTask
- (DDRFakeTask)init;
- (DDRFakeTask)initWithDuration:(double)a3;
- (double)duration;
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
- (void)setDuration:(double)a3;
@end

@implementation DDRFakeTask

- (DDRFakeTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)DDRFakeTask;
  result = [(DDRFakeTask *)&v3 init];
  if (result) {
    result->_duration = 6.0;
  }
  return result;
}

- (DDRFakeTask)initWithDuration:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DDRFakeTask;
  result = [(DDRFakeTask *)&v5 init];
  if (result) {
    result->_duration = a3;
  }
  return result;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.fakeTask";
}

- (void)run
{
  double duration = self->_duration;
  if (duration != 0.0) {
    sleep(duration);
  }
}

- (double)estimatedTimeOfCompletion
{
  return self->_duration;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_double duration = a3;
}

@end