@interface HMDCloudZoneInformationModel
+ (id)properties;
- (BOOL)requiresHomeManagerUpdate;
- (id)dependentUUIDs;
- (void)setRequiresHomeManagerUpdate:(BOOL)a3;
@end

@implementation HMDCloudZoneInformationModel

- (void)setRequiresHomeManagerUpdate:(BOOL)a3
{
  self->_requiresHomeManagerUpdate = a3;
}

- (BOOL)requiresHomeManagerUpdate
{
  return self->_requiresHomeManagerUpdate;
}

- (id)dependentUUIDs
{
  v3 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
  v4 = [(HMDBackingStoreModelObject *)self parentUUID];

  if (v4)
  {
    v5 = [(HMDBackingStoreModelObject *)self parentUUID];
    [v3 addObject:v5];
  }
  return v3;
}

+ (id)properties
{
  if (properties_onceToken_86168 != -1) {
    dispatch_once(&properties_onceToken_86168, &__block_literal_global_86169);
  }
  v2 = (void *)properties__properties_86170;
  return v2;
}

void __42__HMDCloudZoneInformationModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"ownerName";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_86170;
  properties__properties_86170 = v1;
}

@end