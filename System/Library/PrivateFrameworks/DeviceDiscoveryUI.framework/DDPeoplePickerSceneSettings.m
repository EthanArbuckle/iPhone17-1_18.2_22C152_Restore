@interface DDPeoplePickerSceneSettings
- (BOOL)isDedicatedDevicePicker;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation DDPeoplePickerSceneSettings

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [DDPeoplePickerMutableSceneSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (BOOL)isDedicatedDevicePicker
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:18492850];
  char v4 = [v3 BOOLValue];

  return v4;
}

@end