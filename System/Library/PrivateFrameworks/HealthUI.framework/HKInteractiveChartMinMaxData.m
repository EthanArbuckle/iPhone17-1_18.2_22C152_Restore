@interface HKInteractiveChartMinMaxData
- (HKUnit)unit;
- (double)maxValue;
- (double)minValue;
- (void)setMaxValue:(double)a3;
- (void)setMinValue:(double)a3;
- (void)setUnit:(id)a3;
@end

@implementation HKInteractiveChartMinMaxData

- (double)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(double)a3
{
  self->_minValue = a3;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(double)a3
{
  self->_maxValue = a3;
}

- (HKUnit)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
}

- (void).cxx_destruct
{
}

@end