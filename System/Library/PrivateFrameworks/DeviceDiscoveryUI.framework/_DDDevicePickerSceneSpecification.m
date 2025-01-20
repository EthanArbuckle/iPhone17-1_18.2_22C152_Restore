@interface _DDDevicePickerSceneSpecification
- (Class)clientSettingsClass;
- (Class)settingsClass;
- (id)uiSceneSessionRole;
@end

@implementation _DDDevicePickerSceneSpecification

- (Class)clientSettingsClass
{
  return (Class)self;
}

- (Class)settingsClass
{
  return (Class)self;
}

- (id)uiSceneSessionRole
{
  return @"UISceneSessionRoleEndpointPicker";
}

@end