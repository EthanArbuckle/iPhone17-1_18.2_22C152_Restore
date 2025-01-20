@interface DOCFrecencyBasedEvent
- (NSDate)lastUsedDate;
- (double)frecency;
- (double)frecencyScoreAtDate:(id)a3;
- (void)setFrecency:(double)a3;
- (void)setLastUsedDate:(id)a3;
- (void)updateFrecencyAtDate:(id)a3;
@end

@implementation DOCFrecencyBasedEvent

- (double)frecencyScoreAtDate:(id)a3
{
  id v4 = a3;
  v5 = [(DOCFrecencyBasedEvent *)self lastUsedDate];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  [(DOCFrecencyBasedEvent *)self frecency];
  long double v9 = log(v8) + 1.0;
  return exp(v7 / -5184000.0) * v9;
}

- (void)updateFrecencyAtDate:(id)a3
{
  id v5 = a3;
  [(DOCFrecencyBasedEvent *)self frecencyScoreAtDate:v5];
  [(DOCFrecencyBasedEvent *)self setFrecency:v4 + 1.0];
  [(DOCFrecencyBasedEvent *)self setLastUsedDate:v5];
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (void)setLastUsedDate:(id)a3
{
}

- (double)frecency
{
  return self->_frecency;
}

- (void)setFrecency:(double)a3
{
  self->_frecency = a3;
}

- (void).cxx_destruct
{
}

@end