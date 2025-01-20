@interface HearingAidUtils
+ (BOOL)isFitNoiseCheckDebugEnabled;
+ (BOOL)isHearingAidInternalEnabled;
+ (id)getBluetoothDeviceFromAddressOrUUID:(id)a3;
@end

@implementation HearingAidUtils

+ (id)getBluetoothDeviceFromAddressOrUUID:(id)a3
{
  id v3 = a3;
  NSLog(&cfstr_HearingAidUtil.isa, v3);
  v4 = [MEMORY[0x263F2B998] sharedInstance];
  v5 = [v4 deviceFromAddressString:v3];

  if (([v5 connected] & 1) == 0)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v3];
    NSLog(&cfstr_HearingAidUtil_0.isa, v3);
    v7 = [MEMORY[0x263F2B998] sharedInstance];
    uint64_t v8 = [v7 deviceFromIdentifier:v6];

    v5 = (void *)v8;
  }
  if (([v5 connected] & 1) == 0) {
    NSLog(&cfstr_HearingAidUtil_1.isa, v3);
  }

  return v5;
}

+ (BOOL)isHearingAidInternalEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.ConnectedAudio");
  if (CFPreferencesGetAppBooleanValue(@"HearingAidInternal", @"com.apple.ConnectedAudio", &keyExistsAndHasValidFormat))
  {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v2 = 1;
  }
  return !v2;
}

+ (BOOL)isFitNoiseCheckDebugEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.ConnectedAudio");
  if (CFPreferencesGetAppBooleanValue(@"FaultNoiseCheckDebug", @"com.apple.ConnectedAudio", &keyExistsAndHasValidFormat))
  {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v2 = 1;
  }
  return !v2;
}

@end