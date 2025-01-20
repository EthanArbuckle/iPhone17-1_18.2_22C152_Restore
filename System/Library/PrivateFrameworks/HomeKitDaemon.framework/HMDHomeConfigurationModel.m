@interface HMDHomeConfigurationModel
+ (id)properties;
- (BOOL)homeHasLocalChanges;
- (void)setHomeHasLocalChanges:(BOOL)a3;
@end

@implementation HMDHomeConfigurationModel

+ (id)properties
{
  if (properties_onceToken_242 != -1) {
    dispatch_once(&properties_onceToken_242, &__block_literal_global_245);
  }
  v2 = (void *)properties__properties_243;
  return v2;
}

void __39__HMDHomeConfigurationModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"configurationVersion";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_243;
  properties__properties_243 = v1;
}

- (void)setHomeHasLocalChanges:(BOOL)a3
{
  self->_homeHasLocalChanges = a3;
}

- (BOOL)homeHasLocalChanges
{
  return self->_homeHasLocalChanges;
}

@end