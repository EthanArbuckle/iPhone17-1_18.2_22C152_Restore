@interface ComponentGyro
- (BOOL)isPresent;
@end

@implementation ComponentGyro

- (BOOL)isPresent
{
  return findDeviceWithName("gyro");
}

@end