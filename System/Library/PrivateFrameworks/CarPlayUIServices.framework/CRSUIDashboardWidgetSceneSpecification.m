@interface CRSUIDashboardWidgetSceneSpecification
- (Class)settingsClass;
@end

@implementation CRSUIDashboardWidgetSceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

@end