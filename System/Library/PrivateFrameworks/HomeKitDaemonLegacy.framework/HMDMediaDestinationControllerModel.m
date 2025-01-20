@interface HMDMediaDestinationControllerModel
+ (id)logCategory;
+ (id)properties;
- (HMDMediaDestinationControllerModel)initWithData:(id)a3 changeType:(unint64_t)a4;
- (NSArray)availableDestinationModelIdentifiers;
- (NSString)description;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (void)setAvailableDestinationModelIdentifiers:(id)a3;
@end

@implementation HMDMediaDestinationControllerModel

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_148822 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_148822, &__block_literal_global_22_148823);
  }
  v2 = (void *)logCategory__hmf_once_v1_148824;
  return v2;
}

uint64_t __49__HMDMediaDestinationControllerModel_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_148824;
  logCategory__hmf_once_v1_148824 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)properties
{
  if (properties_onceToken_148829 != -1) {
    dispatch_once(&properties_onceToken_148829, &__block_literal_global_16_148830);
  }
  v2 = (void *)properties__properties_148831;
  return v2;
}

void __48__HMDMediaDestinationControllerModel_properties__block_invoke()
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"type";
  uint64_t v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v7[0] = v0;
  v6[1] = @"availableDestinationModelIdentifierStrings";
  uint64_t v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v7[1] = v1;
  v6[2] = @"destinationModelIdentifier";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v7[2] = v2;
  v6[3] = @"supportedOptions";
  v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v7[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
  v5 = (void *)properties__properties_148831;
  properties__properties_148831 = v4;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (id)attributeDescriptions
{
  v26[5] = *MEMORY[0x1E4F143B8];
  v3 = [(HMDBackingStoreModelObject *)self setProperties];
  int v4 = [v3 containsObject:@"destinationModelIdentifier"];
  int v5 = [v3 containsObject:@"availableDestinationModelIdentifierStrings"];
  int v6 = [v3 containsObject:@"supportedOptions"];
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v24 = [(HMDBackingStoreModelObject *)self uuid];
  v23 = objc_msgSend(v7, "initWithName:value:", @"uuid");
  v26[0] = v23;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  v22 = [(HMDBackingStoreModelObject *)self parentUUID];
  v9 = objc_msgSend(v8, "initWithName:value:", @"parentUUID");
  v26[1] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  int v25 = v4;
  if (v4)
  {
    v11 = [(HMDMediaDestinationControllerModel *)self destinationModelIdentifier];
  }
  else
  {
    v11 = @"not set";
  }
  v21 = v11;
  v12 = (void *)[v10 initWithName:@"destinationModelIdentifier" value:v11];
  v26[2] = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  if (v6)
  {
    v14 = [(HMDMediaDestinationControllerModel *)self supportedOptions];
  }
  else
  {
    v14 = @"not set";
  }
  v15 = (void *)[v13 initWithName:@"supportedOptions" value:v14];
  v26[3] = v15;
  id v16 = objc_alloc(MEMORY[0x1E4F653F8]);
  if (v5)
  {
    v17 = [(HMDMediaDestinationControllerModel *)self availableDestinationModelIdentifiers];
  }
  else
  {
    v17 = @"not set";
  }
  v18 = (void *)[v16 initWithName:@"availableDestinationModelIdentifierStrings" value:v17];
  v26[4] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:5];

  if (v5) {
  if (v6)
  }

  if (v25) {
  return v19;
  }
}

- (id)logIdentifier
{
  v2 = [(HMDBackingStoreModelObject *)self uuid];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)setAvailableDestinationModelIdentifiers:(id)a3
{
  objc_msgSend(a3, "na_map:", &__block_literal_global_13_148880);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(HMDMediaDestinationControllerModel *)self setAvailableDestinationModelIdentifierStrings:v4];
}

uint64_t __78__HMDMediaDestinationControllerModel_setAvailableDestinationModelIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (NSArray)availableDestinationModelIdentifiers
{
  v2 = [(HMDMediaDestinationControllerModel *)self availableDestinationModelIdentifierStrings];
  v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_148883);

  return (NSArray *)v3;
}

id __74__HMDMediaDestinationControllerModel_availableDestinationModelIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (HMDMediaDestinationControllerModel)initWithData:(id)a3 changeType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 identifier];
  id v8 = [v6 parentIdentifier];

  v9 = [(HMDBackingStoreModelObject *)self initWithVersion:0 changeType:a4 uuid:v7 parentUUID:v8];
  return v9;
}

@end