@interface FBKTimeIntervalEvent
- (FBKTimeIntervalEvent)initWithType:(unint64_t)a3;
- (double)endTimeInterval;
- (double)startTimeInterval;
- (id)description;
- (unint64_t)eventType;
- (void)setEndTimeInterval:(double)a3;
- (void)setEventType:(unint64_t)a3;
- (void)setStartTimeInterval:(double)a3;
@end

@implementation FBKTimeIntervalEvent

- (FBKTimeIntervalEvent)initWithType:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FBKTimeIntervalEvent;
  v4 = [(FBKTimeIntervalEvent *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_eventType = a3;
    v4->_startTimeInterval = CACurrentMediaTime();
  }
  return v5;
}

- (id)description
{
  unint64_t v2 = [(FBKTimeIntervalEvent *)self eventType];
  if (v2 - 1 > 9) {
    return @"Unknown";
  }
  else {
    return off_2648775E8[v2 - 1];
  }
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (double)startTimeInterval
{
  return self->_startTimeInterval;
}

- (void)setStartTimeInterval:(double)a3
{
  self->_startTimeInterval = a3;
}

- (double)endTimeInterval
{
  return self->_endTimeInterval;
}

- (void)setEndTimeInterval:(double)a3
{
  self->_endTimeInterval = a3;
}

@end