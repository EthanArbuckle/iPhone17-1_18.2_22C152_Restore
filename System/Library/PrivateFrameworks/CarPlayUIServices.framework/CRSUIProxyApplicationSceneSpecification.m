@interface CRSUIProxyApplicationSceneSpecification
- (Class)settingsClass;
- (id)initialActionHandlers;
@end

@implementation CRSUIProxyApplicationSceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (id)initialActionHandlers
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  [v3 addObject:v4];

  v8.receiver = self;
  v8.super_class = (Class)CRSUIProxyApplicationSceneSpecification;
  v5 = [(UIApplicationSceneSpecification *)&v8 initialActionHandlers];
  [v3 addObjectsFromArray:v5];

  v6 = (void *)[v3 copy];
  return v6;
}

@end