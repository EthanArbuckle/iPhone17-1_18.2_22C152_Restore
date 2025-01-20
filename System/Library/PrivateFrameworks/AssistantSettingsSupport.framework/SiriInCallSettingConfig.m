@interface SiriInCallSettingConfig
+ (BOOL)enabled;
+ (BOOL)supported;
+ (id)localizationKey;
+ (void)setEnabled:(BOOL)a3;
@end

@implementation SiriInCallSettingConfig

+ (id)localizationKey
{
  return @"SIRI_IN_CALL";
}

+ (BOOL)supported
{
  return MEMORY[0x270F0ECB8](a1, a2);
}

+ (BOOL)enabled
{
  v2 = [MEMORY[0x263F285A0] sharedPreferences];
  char v3 = [v2 siriInCallEnabled];

  return v3;
}

+ (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263F285A0] sharedPreferences];
  [v4 setSiriInCallEnabled:v3];
}

@end