@interface CRSUIApplicationSceneSpecification
- (Class)settingsClass;
@end

@implementation CRSUIApplicationSceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

@end