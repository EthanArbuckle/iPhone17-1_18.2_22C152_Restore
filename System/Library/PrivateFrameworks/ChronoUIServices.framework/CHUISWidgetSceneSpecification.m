@interface CHUISWidgetSceneSpecification
- (Class)clientSettingsClass;
- (Class)settingsClass;
- (Class)uiSceneMinimumClass;
- (id)uiSceneSessionRole;
@end

@implementation CHUISWidgetSceneSpecification

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
  return @"CHUISWindowSceneSessionRoleWidget";
}

- (Class)uiSceneMinimumClass
{
  return (Class)self;
}

@end