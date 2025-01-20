@interface HMDFeaturesDataSource
+ (id)defaultDataSource;
- (BOOL)isHH2AutoMigrationEnabled;
- (BOOL)isHH2MigrationDryRunEnabled;
- (BOOL)isSHADEREnabled;
- (BOOL)isSHADERMercuryEnabled;
@end

@implementation HMDFeaturesDataSource

- (BOOL)isSHADERMercuryEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isSHADEREnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isHH2MigrationDryRunEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isHH2AutoMigrationEnabled
{
  return _os_feature_enabled_impl();
}

+ (id)defaultDataSource
{
  if (defaultDataSource_onceToken != -1) {
    dispatch_once(&defaultDataSource_onceToken, &__block_literal_global_165933);
  }
  v2 = (void *)defaultDataSource_dataSource;
  return v2;
}

uint64_t __42__HMDFeaturesDataSource_defaultDataSource__block_invoke()
{
  v0 = objc_alloc_init(HMDFeaturesDataSource);
  uint64_t v1 = defaultDataSource_dataSource;
  defaultDataSource_dataSource = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end