@interface ACSettingsCellularData
- (ACSettingsCellularData)init;
@end

@implementation ACSettingsCellularData

- (ACSettingsCellularData)init
{
  v8.receiver = self;
  v8.super_class = (Class)ACSettingsCellularData;
  v3 = [(ACSettingsCellularData *)&v8 init];
  if (v3)
  {
    uint64_t v4 = ACSettingsLocalizedString(@"SETTING_CELLULAR_DATA");
    name = v3->super.super._name;
    v3->super.super._name = (NSString *)v4;

    v3->super._settingsDetailClass = (Class)objc_opt_class();
  }
  if ((+[PSCellularDataSettingsDetail deviceSupportsCellularData] & 1) == 0)
  {
    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2, v3, @"ACSettingsSwitchSetting.m", 110, @"Asked to show cellular data snippet, but device doesn't support cellular data" object file lineNumber description];
  }
  return v3;
}

@end