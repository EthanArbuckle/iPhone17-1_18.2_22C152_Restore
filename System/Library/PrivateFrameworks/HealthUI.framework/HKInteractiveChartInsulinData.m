@interface HKInteractiveChartInsulinData
- (double)basalValue;
- (double)bolusValue;
- (double)totalValue;
- (void)setBasalValue:(double)a3;
- (void)setTotalValue:(double)a3;
@end

@implementation HKInteractiveChartInsulinData

- (double)bolusValue
{
  return self->_totalValue - self->_basalValue;
}

- (double)basalValue
{
  return self->_basalValue;
}

- (void)setBasalValue:(double)a3
{
  self->_basalValue = a3;
}

- (double)totalValue
{
  return self->_totalValue;
}

- (void)setTotalValue:(double)a3
{
  self->_totalValue = a3;
}

@end