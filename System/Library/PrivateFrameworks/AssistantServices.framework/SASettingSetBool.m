@interface SASettingSetBool
- (id)_ad_aceSettingsResponseCommandRepresentationForSiriResponse:(id)a3;
- (id)_ad_setting;
- (id)_ad_settingsRequestRepresentation;
- (int64_t)_ad_settingType;
@end

@implementation SASettingSetBool

- (id)_ad_aceSettingsResponseCommandRepresentationForSiriResponse:(id)a3
{
  return objc_msgSend(a3, "_ad_aceSettingsResponseRepresentationForSetValueCommand:", self);
}

- (id)_ad_settingsRequestRepresentation
{
  id v3 = objc_alloc_init((Class)AFSetSettingsRequest);
  v4 = [(SASettingSetBool *)self _ad_setting];
  v7 = v4;
  v5 = +[NSArray arrayWithObjects:&v7 count:1];
  [v3 _setSettings:v5];

  objc_msgSend(v3, "_setApplyChanges:", -[SASettingSetBool dryRun](self, "dryRun") ^ 1);
  return v3;
}

- (id)_ad_setting
{
  id v3 = objc_alloc_init((Class)STSetting);
  objc_msgSend(v3, "setType:", -[SASettingSetBool _ad_settingType](self, "_ad_settingType"));
  v4 = +[NSNumber numberWithBool:[(SASettingSetBool *)self value]];
  [v3 setValue:v4];

  return v3;
}

- (int64_t)_ad_settingType
{
  return 0;
}

@end