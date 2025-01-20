@interface MCEDUModeUtilities
+ (id)configureToSharedDevice;
@end

@implementation MCEDUModeUtilities

+ (id)configureToSharedDevice
{
  return (id)[MEMORY[0x1E4F5E7A8] configureToSharedDeviceWithPreferenceDomain:*MEMORY[0x1E4F732D8]];
}

@end