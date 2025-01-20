@interface HMDLightProfileNaturalLightingActionModel
+ (Class)cd_entityClass;
+ (id)properties;
- (BOOL)isNaturalLightingEnabled;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
- (id)dependentUUIDs;
- (void)setNaturalLightingEnabled:(BOOL)a3;
@end

@implementation HMDLightProfileNaturalLightingActionModel

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__HMDLightProfileNaturalLightingActionModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_107440 != -1) {
    dispatch_once(&properties_onceToken_107440, block);
  }
  v2 = (void *)properties_properties;
  return v2;
}

void __55__HMDLightProfileNaturalLightingActionModel_properties__block_invoke(uint64_t a1)
{
  v15[4] = *MEMORY[0x263EF8340];
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
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
  v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:v6 additionalDecodeClasses:v7];
  v15[3] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
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

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"accessory"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"accessoryUUID"])
    {
      v11 = [(HMDLightProfileNaturalLightingActionModel *)self accessoryUUID];
      if (v11) {
        +[HMDHAPAccessoryTransaction cd_getMKFHAPAccessoryFromAccessoryUUID:v11];
      }
      else {
      objc_super v12 = [MEMORY[0x263EFF9D0] null];
      }
    }
    else
    {
      objc_super v12 = 0;
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HMDLightProfileNaturalLightingActionModel;
    objc_super v12 = [(HMDBackingStoreModelObject *)&v14 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
  }

  return v12;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  if ([v8 isEqualToString:@"accessoryUUID"])
  {
    v11 = [v10 accessory];

    uint64_t v12 = [v11 modelID];
    uint64_t v13 = (void *)v12;
    objc_super v14 = (void *)*MEMORY[0x263EFFD08];
    if (v12) {
      objc_super v14 = (void *)v12;
    }
    id v15 = v14;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HMDLightProfileNaturalLightingActionModel;
    id v15 = [(HMDBackingStoreModelObject *)&v17 cd_generateValueForModelObjectFromManagedObject:v10 modelObjectField:v8 modelFieldInfo:v9];
  }
  return v15;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end