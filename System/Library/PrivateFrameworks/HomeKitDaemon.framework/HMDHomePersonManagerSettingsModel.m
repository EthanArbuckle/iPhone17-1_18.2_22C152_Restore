@interface HMDHomePersonManagerSettingsModel
+ (Class)cd_entityClass;
+ (id)defaultModelForHomeUUID:(id)a3;
+ (id)modelIDForHomeUUID:(id)a3;
+ (id)properties;
- (HMDHomePersonManagerSettingsModel)initWithHomeUUID:(id)a3;
- (NSUUID)zoneUUID;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
- (id)createSettings;
- (void)setZoneUUID:(id)a3;
@end

@implementation HMDHomePersonManagerSettingsModel

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"zoneUUID"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"zoneUUIDString"])
    {
      uint64_t v11 = [(HMDHomePersonManagerSettingsModel *)self zoneUUID];
      v12 = (void *)v11;
      v13 = (void *)*MEMORY[0x263EFFD08];
      if (v11) {
        v13 = (void *)v11;
      }
      id v14 = v13;
    }
    else
    {
      id v14 = 0;
    }
  }
  else if ([v9 isEqualToString:@"home"])
  {
    v15 = objc_opt_class();
    v16 = [(HMDBackingStoreModelObject *)self parentUUID];
    objc_msgSend(v15, "cd_getHomeFromUUID:", v16);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)HMDHomePersonManagerSettingsModel;
    id v14 = [(HMDBackingStoreModelObject *)&v18 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
  }

  return v14;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  if ([v8 isEqualToString:@"zoneUUIDString"])
  {
    uint64_t v11 = [v10 zoneUUID];

    uint64_t v12 = [v11 UUIDString];
    v13 = (void *)v12;
    id v14 = (void *)*MEMORY[0x263EFFD08];
    if (v12) {
      id v14 = (void *)v12;
    }
    id v15 = v14;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HMDHomePersonManagerSettingsModel;
    id v15 = [(HMDBackingStoreModelObject *)&v17 cd_generateValueForModelObjectFromManagedObject:v10 modelObjectField:v8 modelFieldInfo:v9];
  }
  return v15;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

- (id)createSettings
{
  id v3 = objc_alloc_init(MEMORY[0x263F0E5B8]);
  v4 = [(HMDHomePersonManagerSettingsModel *)self zoneUUID];
  [v3 setFaceClassificationEnabled:v4 != 0];

  v5 = (void *)[v3 copy];
  return v5;
}

- (void)setZoneUUID:(id)a3
{
  id v4 = [a3 UUIDString];
  [(HMDHomePersonManagerSettingsModel *)self setZoneUUIDString:v4];
}

- (NSUUID)zoneUUID
{
  id v3 = [(HMDHomePersonManagerSettingsModel *)self zoneUUIDString];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F08C38]);
    v5 = [(HMDHomePersonManagerSettingsModel *)self zoneUUIDString];
    v6 = (void *)[v4 initWithUUIDString:v5];
  }
  else
  {
    v6 = 0;
  }

  return (NSUUID *)v6;
}

- (HMDHomePersonManagerSettingsModel)initWithHomeUUID:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() modelIDForHomeUUID:v4];
  v6 = [(HMDBackingStoreModelObject *)self initWithObjectChangeType:1 uuid:v5 parentUUID:v4];

  return v6;
}

+ (id)defaultModelForHomeUUID:(id)a3
{
  id v3 = a3;
  id v4 = [[HMDHomePersonManagerSettingsModel alloc] initWithHomeUUID:v3];

  return v4;
}

+ (id)modelIDForHomeUUID:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithUUIDString:@"A9E193D0-2AD8-4F4F-86C1-9BADE1CF3845"];
  v6 = (void *)MEMORY[0x263F08C38];
  v7 = objc_msgSend(v4, "hm_convertToData");

  id v8 = objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v7);

  return v8;
}

+ (id)properties
{
  if (properties_onceToken_225700 != -1) {
    dispatch_once(&properties_onceToken_225700, &__block_literal_global_225701);
  }
  v2 = (void *)properties__properties_225702;
  return v2;
}

void __47__HMDHomePersonManagerSettingsModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  id v3 = @"zoneUUIDString";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_225702;
  properties__properties_225702 = v1;
}

@end