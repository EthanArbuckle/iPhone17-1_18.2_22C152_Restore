@interface VSFeatureManager
+ (id)sharedFeatureManager;
- (BOOL)featureIsEnabled:(id)a3;
- (VSFeatureManager)init;
- (VSPreferences)preferences;
- (void)disableFeature:(id)a3;
- (void)enableFeature:(id)a3;
- (void)resetFeature:(id)a3;
- (void)setPreferences:(id)a3;
@end

@implementation VSFeatureManager

+ (id)sharedFeatureManager
{
  if (sharedFeatureManager___vs_lazy_init_predicate != -1) {
    dispatch_once(&sharedFeatureManager___vs_lazy_init_predicate, &__block_literal_global_20);
  }
  v2 = (void *)sharedFeatureManager___vs_lazy_init_variable;

  return v2;
}

uint64_t __40__VSFeatureManager_sharedFeatureManager__block_invoke()
{
  sharedFeatureManager___vs_lazy_init_variable = objc_alloc_init(VSFeatureManager);

  return MEMORY[0x1F41817F8]();
}

- (VSFeatureManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSFeatureManager;
  v2 = [(VSFeatureManager *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(VSPreferences);
    preferences = v2->_preferences;
    v2->_preferences = v3;
  }
  return v2;
}

- (BOOL)featureIsEnabled:(id)a3
{
  id v4 = a3;
  char v8 = 0;
  v5 = [(VSFeatureManager *)self preferences];
  char v6 = [v5 featureIsEnabled:v4 present:&v8];

  if (!v8)
  {
    [v4 UTF8String];
    char v6 = _os_feature_enabled_impl();
  }

  return v6;
}

- (void)enableFeature:(id)a3
{
  id v4 = a3;
  id v5 = [(VSFeatureManager *)self preferences];
  [v5 enableFeature:v4];
}

- (void)disableFeature:(id)a3
{
  id v4 = a3;
  id v5 = [(VSFeatureManager *)self preferences];
  [v5 disableFeature:v4];
}

- (void)resetFeature:(id)a3
{
  id v4 = a3;
  id v5 = [(VSFeatureManager *)self preferences];
  [v5 clearFeature:v4];
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (void).cxx_destruct
{
}

@end