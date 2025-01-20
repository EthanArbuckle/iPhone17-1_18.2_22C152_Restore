@interface HKTimePeriodNumberFormatter
- (BOOL)returnsUnitWithValueForDisplay;
- (BOOL)shouldRoundToHours;
- (BOOL)shouldShowDays;
- (HKTimePeriodNumberFormatter)init;
- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5;
- (void)setShouldRoundToHours:(BOOL)a3;
- (void)setShouldShowDays:(BOOL)a3;
@end

@implementation HKTimePeriodNumberFormatter

- (HKTimePeriodNumberFormatter)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKTimePeriodNumberFormatter;
  result = [(HKTimePeriodNumberFormatter *)&v3 init];
  if (result) {
    result->_shouldShowDays = 1;
  }
  return result;
}

- (BOOL)returnsUnitWithValueForDisplay
{
  return 0;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v6 = a3;
  __int16 v7 = [(HKTimePeriodNumberFormatter *)self shouldRoundToHours];
  if ([(HKTimePeriodNumberFormatter *)self shouldShowDays]) {
    __int16 v8 = v7;
  }
  else {
    __int16 v8 = v7 | 0x80;
  }
  v9 = HKTimePeriodString(v6, v8);

  return v9;
}

- (BOOL)shouldRoundToHours
{
  return self->_shouldRoundToHours;
}

- (void)setShouldRoundToHours:(BOOL)a3
{
  self->_shouldRoundToHours = a3;
}

- (BOOL)shouldShowDays
{
  return self->_shouldShowDays;
}

- (void)setShouldShowDays:(BOOL)a3
{
  self->_shouldShowDays = a3;
}

@end