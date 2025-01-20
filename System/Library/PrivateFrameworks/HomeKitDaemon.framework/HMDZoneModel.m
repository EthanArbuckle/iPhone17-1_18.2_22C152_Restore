@interface HMDZoneModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)properties;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
- (id)dependentUUIDs;
@end

@implementation HMDZoneModel

- (id)dependentUUIDs
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF9C0];
  v4 = [(HMDZoneModel *)self roomUUIDs];
  v5 = objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count") + 1);

  v6 = [(HMDBackingStoreModelObject *)self parentUUID];

  if (v6)
  {
    v7 = [(HMDBackingStoreModelObject *)self parentUUID];
    [v5 addObject:v7];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = [(HMDZoneModel *)self roomUUIDs];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        [v5 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

+ (id)properties
{
  if (properties_onceToken_100999 != -1) {
    dispatch_once(&properties_onceToken_100999, &__block_literal_global_101000);
  }
  v2 = (void *)properties__properties_101001;
  return v2;
}

void __26__HMDZoneModel_properties__block_invoke()
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"name";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[1] = @"roomUUIDs";
  v5[0] = v0;
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)properties__properties_101001;
  properties__properties_101001 = v2;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"rooms_"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"roomUUIDs"])
    {
      uint64_t v11 = [(HMDZoneModel *)self roomUUIDs];
      v12 = +[HMDBackingStore cdlsFetchManagedObjectsWithUUIDStrings:v11 ofManagedObjectType:objc_opt_class()];
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HMDZoneModel;
    v12 = [(HMDBackingStoreModelObject *)&v14 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
  }

  return v12;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  if ([v8 isEqualToString:@"roomUUIDs"])
  {
    uint64_t v11 = [v10 rooms];

    v12 = +[HMDBackingStore cdlsModelIDStringsForManagedObjects:v11];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HMDZoneModel;
    v12 = [(HMDBackingStoreModelObject *)&v14 cd_generateValueForModelObjectFromManagedObject:v10 modelObjectField:v8 modelFieldInfo:v9];
  }
  return v12;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"home";
}

@end