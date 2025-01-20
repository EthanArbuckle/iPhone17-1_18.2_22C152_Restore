@interface DDPeoplePickerMutableSceneSettings
- (BOOL)isDedicatedDevicePicker;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDedicatedDevicePicker:(BOOL)a3;
@end

@implementation DDPeoplePickerMutableSceneSettings

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [DDPeoplePickerSceneSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (void)setDedicatedDevicePicker:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:18492850];
}

- (BOOL)isDedicatedDevicePicker
{
  return self->_dedicatedDevicePicker;
}

@end