@interface IKDOMFeatureFactory
+ (id)featureForName:(id)a3 withDOMNode:(id)a4;
+ (void)initialize;
+ (void)registerClass:(Class)a3 forFeatureName:(id)a4;
@end

@implementation IKDOMFeatureFactory

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4 = (void *)sClassMap_0;
    sClassMap_0 = (uint64_t)v3;

    [a1 registerClass:objc_opt_class() forFeatureName:@"Player"];
    [a1 registerClass:objc_opt_class() forFeatureName:@"MenuBarDocument"];
    [a1 registerClass:objc_opt_class() forFeatureName:@"Keyboard"];
    [a1 registerClass:objc_opt_class() forFeatureName:@"leftNavigationDocument"];
    [a1 registerClass:objc_opt_class() forFeatureName:@"rightNavigationDocument"];
    uint64_t v5 = objc_opt_class();
    [a1 registerClass:v5 forFeatureName:@"Browser"];
  }
}

+ (void)registerClass:(Class)a3 forFeatureName:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    id v7 = v5;
    id v5 = (id)[v5 length];
    id v6 = v7;
    if (v5)
    {
      id v5 = (id)[(id)sClassMap_0 setObject:a3 forKey:v7];
      id v6 = v7;
    }
  }
  MEMORY[0x1F41817F8](v5, v6);
}

+ (id)featureForName:(id)a3 withDOMNode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (objc_class *)(id)[(id)sClassMap_0 objectForKey:v5];
  if (v7) {
    v8 = (void *)[[v7 alloc] initWithDOMNode:v6 featureName:v5];
  }
  else {
    v8 = 0;
  }

  return v8;
}

@end