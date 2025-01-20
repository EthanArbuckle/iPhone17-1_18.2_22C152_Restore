@interface CRSUIClimateOverlaySceneSpecification
- (Class)clientSettingsClass;
- (Class)settingsClass;
@end

@implementation CRSUIClimateOverlaySceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (Class)clientSettingsClass
{
  return (Class)objc_opt_class();
}

@end