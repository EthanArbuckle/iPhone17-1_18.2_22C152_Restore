@interface AFUIStarkSceneSpecification
- (Class)clientSettingsClass;
- (Class)transitionContextClass;
@end

@implementation AFUIStarkSceneSpecification

- (Class)clientSettingsClass
{
  return (Class)objc_opt_class();
}

- (Class)transitionContextClass
{
  return (Class)objc_opt_class();
}

@end