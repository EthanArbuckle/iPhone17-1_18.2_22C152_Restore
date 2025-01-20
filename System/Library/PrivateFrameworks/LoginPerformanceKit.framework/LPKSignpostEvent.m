@interface LPKSignpostEvent
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)name;
- (NSString)processName;
- (double)duration;
- (void)_calculateDurationIfNeeded;
- (void)setDuration:(double)a3;
- (void)setEndDate:(id)a3;
- (void)setName:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation LPKSignpostEvent

- (double)duration
{
  return self->_duration;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);

  [(LPKSignpostEvent *)self _calculateDurationIfNeeded];
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);

  [(LPKSignpostEvent *)self _calculateDurationIfNeeded];
}

- (void)_calculateDurationIfNeeded
{
  if (self->_startDate)
  {
    endDate = self->_endDate;
    if (endDate)
    {
      -[NSDate timeIntervalSinceDate:](endDate, "timeIntervalSinceDate:");
      self->_duration = v4;
    }
  }
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end