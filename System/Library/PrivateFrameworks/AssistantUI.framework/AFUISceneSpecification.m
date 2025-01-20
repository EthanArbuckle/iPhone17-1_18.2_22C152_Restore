@interface AFUISceneSpecification
- (Class)clientSettingsClass;
- (Class)transitionContextClass;
- (id)defaultExtensions;
@end

@implementation AFUISceneSpecification

- (Class)clientSettingsClass
{
  return (Class)objc_opt_class();
}

- (Class)transitionContextClass
{
  return (Class)objc_opt_class();
}

- (id)defaultExtensions
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

@end