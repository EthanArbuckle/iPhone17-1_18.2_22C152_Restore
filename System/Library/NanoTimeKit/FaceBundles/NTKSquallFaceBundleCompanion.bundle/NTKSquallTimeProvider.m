@interface NTKSquallTimeProvider
- (NSDate)date;
- (NTKSquallTimeProvider)init;
- (double)_secondsFromDate:(id)a3;
- (double)bezelProgress;
- (id)_displayDate;
- (void)setDate:(id)a3;
@end

@implementation NTKSquallTimeProvider

- (NTKSquallTimeProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSquallTimeProvider;
  return [(NTKSquallTimeProvider *)&v3 init];
}

- (id)_displayDate
{
  date = self->_date;
  if (date)
  {
    objc_super v3 = date;
  }
  else
  {
    objc_super v3 = +[NTKDate faceDate];
  }

  return v3;
}

- (double)_secondsFromDate:(id)a3
{
  id v3 = a3;
  v4 = +[NSCalendar currentCalendar];
  v5 = [v4 components:32896 fromDate:v3];

  id v6 = [v5 second];
  double v7 = (double)(unint64_t)[v5 nanosecond] / 1000000000.0 + (double)(unint64_t)v6;

  return v7;
}

- (double)bezelProgress
{
  id v3 = [(NTKSquallTimeProvider *)self _displayDate];
  [(NTKSquallTimeProvider *)self _secondsFromDate:v3];
  double v5 = v4 / 60.0;

  return v5;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end