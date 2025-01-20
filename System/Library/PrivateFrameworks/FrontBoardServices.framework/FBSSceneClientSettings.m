@interface FBSSceneClientSettings
+ (Class)_baseClass;
+ (Class)_diffClass;
+ (Class)_mutableClass;
+ (Class)subclassExtension;
+ (id)_settingsExtensionsForSceneExtension:(Class)a3;
+ (id)settings;
- (FBSSceneClientSettings)initWithSettings:(id)a3;
@end

@implementation FBSSceneClientSettings

+ (Class)_baseClass
{
  return (Class)objc_opt_class();
}

+ (Class)_mutableClass
{
  return (Class)objc_opt_class();
}

+ (Class)subclassExtension
{
  return (Class)objc_opt_class();
}

- (FBSSceneClientSettings)initWithSettings:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FBSSceneClientSettings;
  return [(FBSSettings *)&v4 initWithSettings:a3];
}

+ (id)settings
{
  v2 = (void *)[objc_alloc((Class)a1) initWithSettings:0];

  return v2;
}

+ (Class)_diffClass
{
  return (Class)objc_opt_class();
}

+ (id)_settingsExtensionsForSceneExtension:(Class)a3
{
  return (id)[(objc_class *)a3 clientSettingsExtensions];
}

@end