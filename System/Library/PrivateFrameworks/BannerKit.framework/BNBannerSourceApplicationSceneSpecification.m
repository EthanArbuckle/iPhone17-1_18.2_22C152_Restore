@interface BNBannerSourceApplicationSceneSpecification
- (BOOL)affectsAppLifecycleIfInternal;
- (BOOL)isInternal;
- (Class)clientSettingsClass;
- (Class)settingsClass;
- (id)baseSceneComponentClassDictionary;
- (id)uiSceneSessionRole;
@end

@implementation BNBannerSourceApplicationSceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (Class)clientSettingsClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isInternal
{
  return 1;
}

- (BOOL)affectsAppLifecycleIfInternal
{
  return 1;
}

- (id)baseSceneComponentClassDictionary
{
  v9.receiver = self;
  v9.super_class = (Class)BNBannerSourceApplicationSceneSpecification;
  v2 = [(UIApplicationSceneSpecification *)&v9 baseSceneComponentClassDictionary];
  v3 = v2;
  if (v2) {
    id v4 = (id)[v2 mutableCopy];
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v5 = v4;
  uint64_t v6 = objc_opt_class();
  v7 = BNBundleIdentifier();
  [v5 setObject:v6 forKey:v7];

  return v5;
}

- (id)uiSceneSessionRole
{
  return @"BNWindowSceneSessionRoleBannerSource";
}

@end