@interface _DDPeoplePickerSceneSpecification
- (Class)clientSettingsClass;
- (Class)settingsClass;
- (id)uiSceneSessionRole;
@end

@implementation _DDPeoplePickerSceneSpecification

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
  return @"UISceneSessionRolePeoplePicker";
}

@end