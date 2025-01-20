@interface ACSettingsSwitchSetting
- (BOOL)enabled;
- (BOOL)isBluetooth;
- (BOOL)isLowPowerMode;
- (BOOL)isWiFi;
- (Class)settingsDetailClass;
- (void)setEnabled:(BOOL)a3;
@end

@implementation ACSettingsSwitchSetting

- (Class)settingsDetailClass
{
  return self->_settingsDetailClass;
}

- (BOOL)enabled
{
  return [(objc_class *)self->_settingsDetailClass isEnabled];
}

- (void)setEnabled:(BOOL)a3
{
}

- (BOOL)isBluetooth
{
  return 0;
}

- (BOOL)isLowPowerMode
{
  return 0;
}

- (BOOL)isWiFi
{
  return 0;
}

@end