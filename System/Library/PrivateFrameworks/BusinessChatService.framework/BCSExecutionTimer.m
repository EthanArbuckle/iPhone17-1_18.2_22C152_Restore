@interface BCSExecutionTimer
+ (unint64_t)timeExecutionOfBlock:(id)a3;
- (BCSExecutionTimer)init;
- (unint64_t)milliseconds;
- (unint64_t)nanoseconds;
- (unint64_t)seconds;
- (unint64_t)startTime;
- (void)setStartTime:(unint64_t)a3;
@end

@implementation BCSExecutionTimer

- (BCSExecutionTimer)init
{
  v4.receiver = self;
  v4.super_class = (Class)BCSExecutionTimer;
  v2 = [(BCSExecutionTimer *)&v4 init];
  if (v2) {
    v2->_startTime = mach_absolute_time();
  }
  return v2;
}

+ (unint64_t)timeExecutionOfBlock:(id)a3
{
  v3 = (void (**)(void))a3;
  objc_super v4 = objc_alloc_init(BCSExecutionTimer);
  v3[2](v3);

  unint64_t v5 = [(BCSExecutionTimer *)v4 nanoseconds];
  return v5;
}

- (unint64_t)nanoseconds
{
  uint64_t v3 = mach_absolute_time();
  uint64_t v4 = v3 - [(BCSExecutionTimer *)self startTime];
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  return v4 * info.numer / info.denom;
}

- (unint64_t)milliseconds
{
  return [(BCSExecutionTimer *)self nanoseconds] / 0xF4240;
}

- (unint64_t)seconds
{
  return [(BCSExecutionTimer *)self nanoseconds] / 0x3B9ACA00;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

@end