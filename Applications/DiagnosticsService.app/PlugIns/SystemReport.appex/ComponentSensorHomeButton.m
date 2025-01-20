@interface ComponentSensorHomeButton
- (BOOL)isPresent;
@end

@implementation ComponentSensorHomeButton

- (BOOL)isPresent
{
  return findDeviceWithName("turtle");
}

@end