@interface CHASActivitySetupGoalViewConfiguration
- (HKUnit)unit;
- (UIColor)goalColor;
- (double)maximumValue;
- (double)minimumValue;
- (double)unitTextYOffset;
- (double)valueIncrement;
- (id)goalUnitStringFormatter;
- (id)goalValueStringFormatter;
- (void)setGoalColor:(id)a3;
- (void)setGoalUnitStringFormatter:(id)a3;
- (void)setGoalValueStringFormatter:(id)a3;
- (void)setMaximumValue:(double)a3;
- (void)setMinimumValue:(double)a3;
- (void)setUnit:(id)a3;
- (void)setUnitTextYOffset:(double)a3;
- (void)setValueIncrement:(double)a3;
@end

@implementation CHASActivitySetupGoalViewConfiguration

- (UIColor)goalColor
{
  return self->_goalColor;
}

- (void)setGoalColor:(id)a3
{
}

- (double)unitTextYOffset
{
  return self->_unitTextYOffset;
}

- (void)setUnitTextYOffset:(double)a3
{
  self->_unitTextYOffset = a3;
}

- (id)goalValueStringFormatter
{
  return self->_goalValueStringFormatter;
}

- (void)setGoalValueStringFormatter:(id)a3
{
}

- (id)goalUnitStringFormatter
{
  return self->_goalUnitStringFormatter;
}

- (void)setGoalUnitStringFormatter:(id)a3
{
}

- (HKUnit)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
}

- (double)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(double)a3
{
  self->_minimumValue = a3;
}

- (double)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(double)a3
{
  self->_maximumValue = a3;
}

- (double)valueIncrement
{
  return self->_valueIncrement;
}

- (void)setValueIncrement:(double)a3
{
  self->_valueIncrement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong(&self->_goalUnitStringFormatter, 0);
  objc_storeStrong(&self->_goalValueStringFormatter, 0);

  objc_storeStrong((id *)&self->_goalColor, 0);
}

@end