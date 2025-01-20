@interface CHUISWatchComplicationsWidgetSceneSpecification
- (Class)clientSettingsClass;
- (Class)settingsClass;
- (Class)uiSceneMinimumClass;
@end

@implementation CHUISWatchComplicationsWidgetSceneSpecification

- (Class)clientSettingsClass
{
  return (Class)self;
}

- (Class)settingsClass
{
  return (Class)self;
}

- (Class)uiSceneMinimumClass
{
  return (Class)objc_opt_class();
}

@end