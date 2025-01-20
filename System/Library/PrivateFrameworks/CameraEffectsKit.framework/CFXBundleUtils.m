@interface CFXBundleUtils
+ (BOOL)isRunningFacetime;
+ (BOOL)isRunningMessagesExtension;
@end

@implementation CFXBundleUtils

+ (BOOL)isRunningMessagesExtension
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.camera.CameraMessagesApp"];

  return v4;
}

+ (BOOL)isRunningFacetime
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.InCallService"];

  return v4;
}

@end