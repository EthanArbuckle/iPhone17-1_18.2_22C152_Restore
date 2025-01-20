@interface HMDAccessoryNetworkProtectionGroupModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)modelIDForHome:(id)a3 manufacturer:(id)a4 category:(id)a5;
+ (id)modelNamespace;
+ (id)properties;
+ (id)shortDescription;
- (NSString)description;
- (id)attributeDescriptions;
- (id)shortDescription;
@end

@implementation HMDAccessoryNetworkProtectionGroupModel

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)properties
{
  if (properties_onceToken_191850 != -1) {
    dispatch_once(&properties_onceToken_191850, &__block_literal_global_191851);
  }
  v2 = (void *)properties__properties_191852;
  return v2;
}

void __53__HMDAccessoryNetworkProtectionGroupModel_properties__block_invoke()
{
  v7[4] = *MEMORY[0x263EF8340];
  v6[0] = @"manufacturer";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v7[0] = v0;
  v6[1] = @"categoryIdentifier";
  v1 = +[HMDBackingStoreModelObjectStorageInfo deprecatedField];
  v7[1] = v1;
  v6[2] = @"category";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v7[2] = v2;
  v6[3] = @"targetProtectionMode";
  v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v7[3] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
  v5 = (void *)properties__properties_191852;
  properties__properties_191852 = v4;
}

+ (id)modelIDForHome:(id)a3 manufacturer:(id)a4 category:(id)a5
{
  v7 = (objc_class *)MEMORY[0x263EFF990];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v7);
  v12 = [MEMORY[0x263EFF990] dataWithLength:16];
  v13 = [v10 uuid];

  id v14 = v12;
  objc_msgSend(v13, "getUUIDBytes:", objc_msgSend(v14, "mutableBytes"));
  [v11 appendData:v14];
  uint64_t v15 = [v8 unsignedIntegerValue];

  uint64_t v22 = v15;
  v16 = [MEMORY[0x263EFF8F8] dataWithBytes:&v22 length:8];
  [v11 appendData:v16];
  v17 = [v9 dataUsingEncoding:4];

  [v11 appendData:v17];
  v18 = (void *)MEMORY[0x263F08C38];
  v19 = [(id)objc_opt_class() modelNamespace];
  v20 = objc_msgSend(v18, "hmf_UUIDWithNamespace:data:", v19, v11);

  return v20;
}

+ (id)modelNamespace
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"3FFD3711-E751-4F46-A74F-4F0B4E877E8F"];
  return v2;
}

- (id)attributeDescriptions
{
  v20[5] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v19 = [(HMDBackingStoreModelObject *)self uuid];
  uint64_t v4 = (void *)[v3 initWithName:@"uuid" value:v19];
  v20[0] = v4;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  v6 = [(HMDBackingStoreModelObject *)self bsoDataVersion];
  v7 = (void *)[v5 initWithName:@"version" value:v6];
  v20[1] = v7;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  id v9 = [(HMDAccessoryNetworkProtectionGroupModel *)self manufacturer];
  id v10 = (void *)[v8 initWithName:@"manufacturer" value:v9];
  v20[2] = v10;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  v12 = [(HMDAccessoryNetworkProtectionGroupModel *)self category];
  v13 = (void *)[v11 initWithName:@"category" value:v12];
  v20[3] = v13;
  id v14 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v15 = [(HMDAccessoryNetworkProtectionGroupModel *)self targetProtectionMode];
  v16 = (void *)[v14 initWithName:@"targetProtectionMode" value:v15];
  v20[4] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:5];

  return v17;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x270F30880](self, a2);
}

- (id)shortDescription
{
  v2 = objc_opt_class();
  return (id)[v2 shortDescription];
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