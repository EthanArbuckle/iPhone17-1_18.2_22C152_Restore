@interface _DASLogValueInterval
- (BOOL)isEqual:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSObject)value;
- (double)duration;
- (id)description;
- (id)durationString;
- (id)intervalString;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation _DASLogValueInterval

- (BOOL)isEqual:(id)a3
{
  value = self->_value;
  v4 = [a3 value];
  LOBYTE(value) = [value isEqual:v4];

  return (char)value;
}

- (id)intervalString
{
  v3 = defaultFormatter();
  v4 = v3;
  if (self->_endDate)
  {
    objc_msgSend(v3, "stringFromDate:");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = @"End of Log";
  }
  v6 = NSString;
  v7 = [(_DASLogValueInterval *)self startDate];
  v8 = [v4 stringFromDate:v7];
  v9 = [v6 stringWithFormat:@"[%@ - %@]", v8, v5];

  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = [(_DASLogValueInterval *)self intervalString];
  v5 = [self->_value description];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (double)duration
{
  endDate = self->_endDate;
  if (!endDate) {
    return -2147483650.0;
  }
  BOOL v4 = [(NSDate *)endDate isEqualToDate:self->_startDate];
  double result = 0.5;
  if (!v4)
  {
    v6 = [(_DASLogValueInterval *)self endDate];
    v7 = [(_DASLogValueInterval *)self startDate];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;

    return v9;
  }
  return result;
}

- (id)durationString
{
  [(_DASLogValueInterval *)self duration];
  if (v2 >= 0.0)
  {
    if (v2 >= 3600.0)
    {
      double v4 = v2 / 3600.0;
    }
    else
    {
      double v4 = v2 / 60.0;
      if (v2 < 60.0) {
        double v4 = v2;
      }
    }
    v5 = @"minutes";
    if (v2 < 60.0) {
      v5 = @"seconds";
    }
    if (v2 >= 3600.0) {
      v5 = @"hours";
    }
    v3 = [NSString stringWithFormat:@"%3.2lf %@", *(void *)&v4, v5];
  }
  else
  {
    v3 = &stru_26DDDA0E0;
  }
  return v3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSObject)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end