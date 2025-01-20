@interface UIAXPKSpendingElement
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)currency;
- (double)chartValue;
- (void)setChartValue:(double)a3;
- (void)setCurrency:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation UIAXPKSpendingElement

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

- (double)chartValue
{
  return self->_chartValue;
}

- (void)setChartValue:(double)a3
{
  self->_chartValue = a3;
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end