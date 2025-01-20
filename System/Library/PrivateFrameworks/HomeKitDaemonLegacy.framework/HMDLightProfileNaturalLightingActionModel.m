@interface HMDLightProfileNaturalLightingActionModel
+ (id)properties;
- (BOOL)isNaturalLightingEnabled;
- (id)dependentUUIDs;
- (void)setNaturalLightingEnabled:(BOOL)a3;
@end

@implementation HMDLightProfileNaturalLightingActionModel

+ (id)properties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HMDLightProfileNaturalLightingActionModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_72902 != -1) {
    dispatch_once(&properties_onceToken_72902, block);
  }
  v2 = (void *)properties_properties;
  return v2;
}

void __55__HMDLightProfileNaturalLightingActionModel_properties__block_invoke(uint64_t a1)
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)&OBJC_METACLASS___HMDLightProfileNaturalLightingActionModel;
  v1 = objc_msgSendSuper2(&v12, sel_properties);
  v2 = (void *)[v1 mutableCopy];

  v14[0] = @"naturalLightingEnabledField";
  v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v15[0] = v3;
  v14[1] = @"lightProfileUUID";
  v4 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v15[1] = v4;
  v14[2] = @"accessoryUUID";
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v15[2] = v5;
  v14[3] = @"serviceUUIDs";
  uint64_t v6 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:v6 additionalDecodeClasses:v7];
  v15[3] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  [v2 addEntriesFromDictionary:v9];

  uint64_t v10 = [v2 copy];
  v11 = (void *)properties_properties;
  properties_properties = v10;
}

- (id)dependentUUIDs
{
  v14.receiver = self;
  v14.super_class = (Class)HMDLightProfileNaturalLightingActionModel;
  v3 = [(HMDBackingStoreModelObject *)&v14 dependentUUIDs];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(HMDBackingStoreModelObject *)self parentUUID];

  if (v5)
  {
    uint64_t v6 = [(HMDBackingStoreModelObject *)self parentUUID];
    [v4 addObject:v6];
  }
  v7 = [(HMDLightProfileNaturalLightingActionModel *)self accessoryUUID];

  if (v7)
  {
    v8 = [(HMDLightProfileNaturalLightingActionModel *)self accessoryUUID];
    [v4 addObject:v8];
  }
  v9 = [(HMDLightProfileNaturalLightingActionModel *)self serviceUUIDs];

  if (v9)
  {
    uint64_t v10 = [(HMDLightProfileNaturalLightingActionModel *)self serviceUUIDs];
    v11 = [v10 allObjects];
    [v4 addObjectsFromArray:v11];
  }
  objc_super v12 = (void *)[v4 copy];

  return v12;
}

- (BOOL)isNaturalLightingEnabled
{
  v2 = [(HMDLightProfileNaturalLightingActionModel *)self naturalLightingEnabledField];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setNaturalLightingEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HMDLightProfileNaturalLightingActionModel *)self setNaturalLightingEnabledField:v4];
}

@end