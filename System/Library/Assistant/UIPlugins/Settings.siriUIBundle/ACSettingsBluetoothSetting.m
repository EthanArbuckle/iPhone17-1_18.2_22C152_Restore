@interface ACSettingsBluetoothSetting
- (ACSettingsBluetoothSetting)init;
- (BOOL)isBluetooth;
@end

@implementation ACSettingsBluetoothSetting

- (ACSettingsBluetoothSetting)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACSettingsBluetoothSetting;
  v2 = [(ACSettingsBluetoothSetting *)&v6 init];
  if (v2)
  {
    uint64_t v3 = ACSettingsLocalizedString(@"SETTING_BLUETOOTH");
    name = v2->super.super._name;
    v2->super.super._name = (NSString *)v3;

    v2->super._settingsDetailClass = (Class)objc_opt_class();
  }
  return v2;
}

- (BOOL)isBluetooth
{
  return 1;
}

@end