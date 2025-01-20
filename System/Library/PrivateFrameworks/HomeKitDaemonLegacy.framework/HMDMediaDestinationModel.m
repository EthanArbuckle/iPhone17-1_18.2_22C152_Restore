@interface HMDMediaDestinationModel
+ (id)logCategory;
+ (id)properties;
- (HMDMediaDestinationModel)initWithDestination:(id)a3 changeType:(unint64_t)a4;
- (NSString)description;
- (id)attributeDescriptions;
- (id)logIdentifier;
@end

@implementation HMDMediaDestinationModel

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_80458 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_80458, &__block_literal_global_12);
  }
  v2 = (void *)logCategory__hmf_once_v1_80459;
  return v2;
}

uint64_t __39__HMDMediaDestinationModel_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_80459;
  logCategory__hmf_once_v1_80459 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)properties
{
  if (properties_onceToken_80463 != -1) {
    dispatch_once(&properties_onceToken_80463, &__block_literal_global_80464);
  }
  v2 = (void *)properties__properties_80465;
  return v2;
}

void __38__HMDMediaDestinationModel_properties__block_invoke()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"type";
  uint64_t v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[0] = v0;
  v5[1] = @"supportedOptions";
  uint64_t v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[1] = v1;
  v5[2] = @"audioGroupIdentifier";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  v4 = (void *)properties__properties_80465;
  properties__properties_80465 = v3;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (id)attributeDescriptions
{
  v21[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDBackingStoreModelObject *)self setProperties];
  int v4 = [v3 containsObject:@"supportedOptions"];
  int v5 = [v3 containsObject:@"audioGroupIdentifier"];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v20 = [(HMDBackingStoreModelObject *)self uuid];
  v7 = objc_msgSend(v6, "initWithName:value:", @"uuid");
  v21[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  v9 = [(HMDBackingStoreModelObject *)self parentUUID];
  v10 = (void *)[v8 initWithName:@"parentUUID" value:v9];
  v21[1] = v10;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  int v19 = v4;
  if (v4)
  {
    v12 = [(HMDMediaDestinationModel *)self supportedOptions];
  }
  else
  {
    v12 = @"not set";
  }
  v13 = (void *)[v11 initWithName:@"supportedOptions" value:v12];
  v21[2] = v13;
  id v14 = objc_alloc(MEMORY[0x1E4F653F8]);
  if (v5)
  {
    v15 = [(HMDMediaDestinationModel *)self audioGroupIdentifier];
  }
  else
  {
    v15 = @"not set";
  }
  v16 = (void *)[v14 initWithName:@"audioGroupIdentifier" value:v15];
  v21[3] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];

  if (v5) {
  if (v19)
  }

  return v17;
}

- (id)logIdentifier
{
  v2 = [(HMDBackingStoreModelObject *)self uuid];
  uint64_t v3 = [v2 UUIDString];

  return v3;
}

- (HMDMediaDestinationModel)initWithDestination:(id)a3 changeType:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 uniqueIdentifier];
  id v8 = [v6 parentIdentifier];

  v9 = [(HMDBackingStoreModelObject *)self initWithVersion:0 changeType:a4 uuid:v7 parentUUID:v8];
  return v9;
}

@end