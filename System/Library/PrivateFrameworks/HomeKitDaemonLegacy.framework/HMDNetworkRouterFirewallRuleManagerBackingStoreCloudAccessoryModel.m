@interface HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel
+ (NSUUID)namespaceID;
+ (id)hmbProperties;
+ (id)logCategory;
+ (id)modelIDForRecordID:(id)a3;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel)initWithCloudZoneID:(id)a3 recordID:(id)a4 networkDeclarationsData:(id)a5;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel)initWithCloudZoneID:(id)a3 recordID:(id)a4 networkDeclarationsData:(id)a5 pairedMetadataData:(id)a6;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel)initWithModelID:(id)a3 parentModelID:(id)a4 networkDeclarationsData:(id)a5;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel)initWithModelID:(id)a3 parentModelID:(id)a4 networkDeclarationsData:(id)a5 pairedMetadataData:(id)a6;
@end

@implementation HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel)initWithCloudZoneID:(id)a3 recordID:(id)a4 networkDeclarationsData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() modelIDForRecordID:v9];

  v12 = [v10 modelID];

  v13 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel *)self initWithModelID:v11 parentModelID:v12 networkDeclarationsData:v8];
  return v13;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel)initWithCloudZoneID:(id)a3 recordID:(id)a4 networkDeclarationsData:(id)a5 pairedMetadataData:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(id)objc_opt_class() modelIDForRecordID:v12];

  v15 = [v13 modelID];

  v16 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel *)self initWithModelID:v14 parentModelID:v15 networkDeclarationsData:v11 pairedMetadataData:v10];
  return v16;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel)initWithModelID:(id)a3 parentModelID:(id)a4 networkDeclarationsData:(id)a5
{
  return [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel *)self initWithModelID:a3 parentModelID:a4 networkDeclarationsData:a5 pairedMetadataData:0];
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel)initWithModelID:(id)a3 parentModelID:(id)a4 networkDeclarationsData:(id)a5 pairedMetadataData:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel;
  id v12 = [(HMBModel *)&v16 initWithModelID:a3 parentModelID:a4];
  id v13 = v12;
  if (v12)
  {
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel *)v12 setNetworkDeclarationsData:v10];
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel *)v13 setPairedMetadataData:v11];
    v14 = v13;
  }

  return v13;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_135923 != -1) {
    dispatch_once(&hmbProperties_onceToken_135923, &__block_literal_global_7_135924);
  }
  v2 = (void *)hmbProperties_properties_135925;
  return v2;
}

void __83__HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel_hmbProperties__block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"networkDeclarationsData";
  v0 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v4[1] = @"pairedMetadataData";
  v5[0] = v0;
  v1 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)hmbProperties_properties_135925;
  hmbProperties_properties_135925 = v2;
}

+ (id)modelIDForRecordID:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 recordName];
  v25[0] = v5;
  v6 = [v4 zoneID];
  v7 = [v6 zoneName];
  v25[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];

  id v9 = [MEMORY[0x1E4F1CA58] data];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dataUsingEncoding:", 4, (void)v20);
        [v9 appendData:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  objc_super v16 = (void *)MEMORY[0x1E4F29128];
  v17 = [a1 namespaceID];
  v18 = objc_msgSend(v16, "hmf_UUIDWithNamespace:data:", v17, v9);

  return v18;
}

+ (NSUUID)namespaceID
{
  if (namespaceID_onceToken != -1) {
    dispatch_once(&namespaceID_onceToken, &__block_literal_global_2_135939);
  }
  uint64_t v2 = (void *)namespaceID_namespaceID;
  return (NSUUID *)v2;
}

uint64_t __81__HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel_namespaceID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"da9f7191-31bc-4567-9424-89b86310c2e7"];
  uint64_t v1 = namespaceID_namespaceID;
  namespaceID_namespaceID = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_135944 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_135944, &__block_literal_global_135945);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v1_135946;
  return v2;
}

uint64_t __81__HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_135946;
  logCategory__hmf_once_v1_135946 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end