@interface FADeviceInfo
- (BOOL)unlockedSinceBoot;
@end

@implementation FADeviceInfo

- (BOOL)unlockedSinceBoot
{
  return MKBDeviceUnlockedSinceBoot() == 1;
}

@end