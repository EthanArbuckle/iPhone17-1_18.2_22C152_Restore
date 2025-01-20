@interface EKOfficeHour
- (BOOL)enabled;
- (EKOfficeHour)initWithEnabled:(BOOL)a3 weekday:(int64_t)a4 startTime:(id)a5 endTime:(id)a6 timeZone:(id)a7;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSTimeZone)timeZone;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)weekday;
- (void)setEnabled:(BOOL)a3;
- (void)setEndTime:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setWeekday:(int64_t)a3;
@end

@implementation EKOfficeHour

- (EKOfficeHour)initWithEnabled:(BOOL)a3 weekday:(int64_t)a4 startTime:(id)a5 endTime:(id)a6 timeZone:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)EKOfficeHour;
  v16 = [(EKOfficeHour *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_enabled = a3;
    v16->_weekday = a4;
    objc_storeStrong((id *)&v16->_startTime, a5);
    objc_storeStrong((id *)&v17->_endTime, a6);
    objc_storeStrong((id *)&v17->_timeZone, a7);
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [EKOfficeHour alloc];
  BOOL enabled = self->_enabled;
  int64_t weekday = self->_weekday;
  startTime = self->_startTime;
  endTime = self->_endTime;
  timeZone = self->_timeZone;

  return [(EKOfficeHour *)v4 initWithEnabled:enabled weekday:weekday startTime:startTime endTime:endTime timeZone:timeZone];
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_BOOL enabled = a3;
}

- (int64_t)weekday
{
  return self->_weekday;
}

- (void)setWeekday:(int64_t)a3
{
  self->_int64_t weekday = a3;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endTime, 0);

  objc_storeStrong((id *)&self->_startTime, 0);
}

@end