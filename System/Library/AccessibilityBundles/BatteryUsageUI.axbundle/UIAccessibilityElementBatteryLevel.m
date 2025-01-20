@interface UIAccessibilityElementBatteryLevel
- (NSDate)date;
- (double)batteryLevel;
- (void)setBatteryLevel:(double)a3;
- (void)setDate:(id)a3;
@end

@implementation UIAccessibilityElementBatteryLevel

- (double)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(double)a3
{
  self->_batteryLevel = a3;
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