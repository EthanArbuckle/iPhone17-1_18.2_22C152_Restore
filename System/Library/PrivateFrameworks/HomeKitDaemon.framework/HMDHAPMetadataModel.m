@interface HMDHAPMetadataModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)allowedTypes;
+ (id)metadataModelObjectUUID;
+ (id)modelWithDictionary:(id)a3;
+ (id)properties;
- (id)metadataDictionary;
@end

@implementation HMDHAPMetadataModel

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"homeManager";
}

- (id)metadataDictionary
{
  v11[5] = *MEMORY[0x263EF8340];
  v10[0] = *MEMORY[0x263F35C40];
  v3 = [(HMDHAPMetadataModel *)self metadataVersion];
  v11[0] = v3;
  v10[1] = *MEMORY[0x263F35C10];
  v4 = [(HMDHAPMetadataModel *)self schemaVersion];
  v11[1] = v4;
  v10[2] = *MEMORY[0x263F35BF0];
  v5 = [(HMDHAPMetadataModel *)self rawPlist];
  v11[2] = v5;
  v10[3] = *MEMORY[0x263F35BD0];
  v6 = [(HMDHAPMetadataModel *)self legacyIDSData];
  v11[3] = v6;
  v10[4] = *MEMORY[0x263F35BC8];
  v7 = [(HMDHAPMetadataModel *)self legacyCloudData];
  v11[4] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

+ (id)allowedTypes
{
  if (allowedTypes_onceToken != -1) {
    dispatch_once(&allowedTypes_onceToken, &__block_literal_global_542);
  }
  v2 = (void *)allowedTypes__allowedTypes;
  return v2;
}

void __35__HMDHAPMetadataModel_allowedTypes__block_invoke()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:5];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7);
  v3 = (void *)allowedTypes__allowedTypes;
  allowedTypes__allowedTypes = v2;
}

+ (id)modelWithDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x263F35C40];
  uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F35C40]];
  if (v5)
  {
    uint64_t v6 = *MEMORY[0x263F35C10];
    uint64_t v7 = [v3 objectForKeyedSubscript:*MEMORY[0x263F35C10]];

    if (v7)
    {
      uint64_t v8 = [HMDHAPMetadataModel alloc];
      uint64_t v9 = +[HMDHAPMetadataModel metadataModelObjectUUID];
      v10 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
      uint64_t v5 = [(HMDBackingStoreModelObject *)v8 initWithObjectChangeType:1 uuid:v9 parentUUID:v10];

      v11 = [v3 objectForKeyedSubscript:v4];
      [(HMDHAPMetadataModel *)v5 setMetadataVersion:v11];

      v12 = [v3 objectForKeyedSubscript:v6];
      [(HMDHAPMetadataModel *)v5 setSchemaVersion:v12];

      v13 = [v3 objectForKeyedSubscript:*MEMORY[0x263F35BF0]];
      [(HMDHAPMetadataModel *)v5 setRawPlist:v13];

      v14 = [v3 objectForKeyedSubscript:*MEMORY[0x263F35BD0]];
      [(HMDHAPMetadataModel *)v5 setLegacyIDSData:v14];

      v15 = [v3 objectForKeyedSubscript:*MEMORY[0x263F35BC8]];
      [(HMDHAPMetadataModel *)v5 setLegacyCloudData:v15];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return v5;
}

+ (id)metadataModelObjectUUID
{
  if (metadataModelObjectUUID_onceToken != -1) {
    dispatch_once(&metadataModelObjectUUID_onceToken, &__block_literal_global_532);
  }
  uint64_t v2 = (void *)metadataModelObjectUUID_metadataModelObjectUUID;
  return v2;
}

void __46__HMDHAPMetadataModel_metadataModelObjectUUID__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
  uint64_t v0 = objc_msgSend(MEMORY[0x263F08C38], "hm_deriveUUIDFromBaseUUID:withSalts:", v2, &unk_26E473EA0);
  v1 = (void *)metadataModelObjectUUID_metadataModelObjectUUID;
  metadataModelObjectUUID_metadataModelObjectUUID = v0;
}

+ (id)properties
{
  if (properties_onceToken_26116 != -1) {
    dispatch_once(&properties_onceToken_26116, &__block_literal_global_513);
  }
  id v2 = (void *)properties__properties_26117;
  return v2;
}

void __33__HMDHAPMetadataModel_properties__block_invoke()
{
  v8[5] = *MEMORY[0x263EF8340];
  v7[0] = @"metadataVersion";
  uint64_t v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v8[0] = v0;
  v7[1] = @"schemaVersion";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v8[1] = v1;
  v7[2] = @"rawPlist";
  id v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v8[2] = v2;
  v7[3] = @"legacyIDSData";
  id v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v8[3] = v3;
  v7[4] = @"legacyCloudData";
  uint64_t v4 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v8[4] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:5];
  uint64_t v6 = (void *)properties__properties_26117;
  properties__properties_26117 = v5;
}

@end