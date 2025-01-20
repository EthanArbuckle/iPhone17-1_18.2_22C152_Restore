@interface ACSettingWiFiSetting
- (ACSettingWiFiSetting)init;
- (BOOL)isWiFi;
@end

@implementation ACSettingWiFiSetting

- (ACSettingWiFiSetting)init
{
  v7.receiver = self;
  v7.super_class = (Class)ACSettingWiFiSetting;
  v2 = [(ACSettingWiFiSetting *)&v7 init];
  if (v2)
  {
    if (MGGetBoolAnswer()) {
      v3 = @"SETTING_WLAN";
    }
    else {
      v3 = @"SETTING_WIFI";
    }
    uint64_t v4 = ACSettingsLocalizedString(v3);
    name = v2->super.super._name;
    v2->super.super._name = (NSString *)v4;

    v2->super._settingsDetailClass = (Class)objc_opt_class();
  }
  return v2;
}

- (BOOL)isWiFi
{
  return 1;
}

@end