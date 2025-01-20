@interface HDDemoDataRespirationRate
- (NSDate)date;
- (NSNumber)rate;
- (void)setDate:(id)a3;
- (void)setRate:(id)a3;
@end

@implementation HDDemoDataRespirationRate

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSNumber)rate
{
  return self->_rate;
}

- (void)setRate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rate, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end