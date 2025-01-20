@interface HMDHomePersonManagerSettingsModel
+ (id)defaultModelForHomeUUID:(id)a3;
+ (id)modelIDForHomeUUID:(id)a3;
+ (id)properties;
- (HMDHomePersonManagerSettingsModel)initWithHomeUUID:(id)a3;
- (NSUUID)zoneUUID;
- (id)createSettings;
- (void)setZoneUUID:(id)a3;
@end

@implementation HMDHomePersonManagerSettingsModel

- (id)createSettings
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F2E980]);
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
    id v4 = objc_alloc(MEMORY[0x1E4F29128]);
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
  id v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithUUIDString:@"A9E193D0-2AD8-4F4F-86C1-9BADE1CF3845"];
  v6 = (void *)MEMORY[0x1E4F29128];
  v7 = objc_msgSend(v4, "hm_convertToData");

  v8 = objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v7);

  return v8;
}

+ (id)properties
{
  if (properties_onceToken_157102 != -1) {
    dispatch_once(&properties_onceToken_157102, &__block_literal_global_157103);
  }
  v2 = (void *)properties__properties_157104;
  return v2;
}

void __47__HMDHomePersonManagerSettingsModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id v3 = @"zoneUUIDString";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_157104;
  properties__properties_157104 = v1;
}

@end