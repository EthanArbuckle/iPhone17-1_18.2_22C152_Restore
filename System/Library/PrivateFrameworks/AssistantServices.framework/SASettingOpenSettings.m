@interface SASettingOpenSettings
- (id)_ad_settingsRequestRepresentation;
- (int64_t)_ad_settingType;
@end

@implementation SASettingOpenSettings

- (id)_ad_settingsRequestRepresentation
{
  id v2 = objc_msgSend(objc_alloc((Class)AFShowSettingRequest), "_initWithSettingType:", -[SASettingOpenSettings _ad_settingType](self, "_ad_settingType"));
  return v2;
}

- (int64_t)_ad_settingType
{
  return 0;
}

@end