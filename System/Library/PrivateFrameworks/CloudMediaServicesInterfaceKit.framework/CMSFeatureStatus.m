@interface CMSFeatureStatus
+ (BOOL)isMultiPlayerSupported;
+ (void)enableSiriOverrides:(BOOL)a3;
@end

@implementation CMSFeatureStatus

+ (BOOL)isMultiPlayerSupported
{
  v2 = [MEMORY[0x263F54948] currentSettings];
  char v3 = [v2 isMultiplayerHost];

  return v3;
}

+ (void)enableSiriOverrides:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [MEMORY[0x263F285A0] sharedPreferences];
  v5 = v4;
  if (v3) {
    [v4 setConfigOverrideWithValue:@"true" forKey:@"X-Dev-ConfigOverride-assistant.service.audio.siriKit.thirdPartyHomePod.enabled"];
  }
  else {
    [v4 removeConfigOverrideForKey:@"X-Dev-ConfigOverride-assistant.service.audio.siriKit.thirdPartyHomePod.enabled"];
  }

  id v6 = [MEMORY[0x263F285A0] sharedPreferences];
  [v6 synchronize];
}

@end