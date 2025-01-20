@interface ACSettingsPowerSavingMode
- (ACSettingsPowerSavingMode)init;
- (BOOL)isLowPowerMode;
@end

@implementation ACSettingsPowerSavingMode

- (ACSettingsPowerSavingMode)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACSettingsPowerSavingMode;
  v2 = [(ACSettingsPowerSavingMode *)&v6 init];
  if (v2)
  {
    uint64_t v3 = ACSettingsLocalizedString(@"SETTING_POWERSAVING");
    name = v2->super.super._name;
    v2->super.super._name = (NSString *)v3;

    v2->super._settingsDetailClass = (Class)objc_opt_class();
  }
  return v2;
}

- (BOOL)isLowPowerMode
{
  return 1;
}

@end