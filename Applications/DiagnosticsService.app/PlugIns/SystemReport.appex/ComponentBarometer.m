@interface ComponentBarometer
- (BOOL)isPresent;
@end

@implementation ComponentBarometer

- (BOOL)isPresent
{
  return findDeviceWithName("pressure");
}

@end