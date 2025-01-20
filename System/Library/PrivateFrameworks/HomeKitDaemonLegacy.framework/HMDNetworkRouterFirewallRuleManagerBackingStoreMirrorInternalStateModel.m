@interface HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel
+ (NSUUID)modelID;
+ (NSUUID)parentModelID;
+ (id)hmbProperties;
+ (id)logCategory;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel)init;
- (NSSet)lastSynchronizedRecordIDs;
- (void)setLastSynchronizedRecordIDs:(id)a3;
@end

@implementation HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_162048 != -1) {
    dispatch_once(&hmbProperties_onceToken_162048, &__block_literal_global_10_162049);
  }
  v2 = (void *)hmbProperties_properties_162050;
  return v2;
}

void __88__HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel_hmbProperties__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"archivedLastSynchronizedRecordIDs";
  v0 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)hmbProperties_properties_162050;
  hmbProperties_properties_162050 = v1;
}

+ (NSUUID)parentModelID
{
  if (parentModelID_onceToken != -1) {
    dispatch_once(&parentModelID_onceToken, &__block_literal_global_5_162058);
  }
  v2 = (void *)parentModelID_parentModelID;
  return (NSUUID *)v2;
}

uint64_t __88__HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel_parentModelID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"e04f2c76-f905-4dd1-81b1-0336eb0cc6db"];
  uint64_t v1 = parentModelID_parentModelID;
  parentModelID_parentModelID = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (NSUUID)modelID
{
  if (modelID_onceToken != -1) {
    dispatch_once(&modelID_onceToken, &__block_literal_global_2_162064);
  }
  v2 = (void *)modelID_modelID;
  return (NSUUID *)v2;
}

uint64_t __82__HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel_modelID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"b16edda7-1296-4be2-b225-bb7beb536415"];
  uint64_t v1 = modelID_modelID;
  modelID_modelID = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_162069 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_162069, &__block_literal_global_162070);
  }
  v2 = (void *)logCategory__hmf_once_v1_162071;
  return v2;
}

uint64_t __86__HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_162071;
  logCategory__hmf_once_v1_162071 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void).cxx_destruct
{
}

- (void)setLastSynchronizedRecordIDs:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count])
  {
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel *)self setArchivedLastSynchronizedRecordIDs:0];
    goto LABEL_5;
  }
  id v12 = 0;
  v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v12];
  lastSynchronizedRecordIDs = (NSSet *)v12;
  if (v5)
  {
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel *)self setArchivedLastSynchronizedRecordIDs:v5];

LABEL_5:
    v7 = (NSSet *)v4;
    lastSynchronizedRecordIDs = self->_lastSynchronizedRecordIDs;
    self->_lastSynchronizedRecordIDs = v7;
    goto LABEL_9;
  }
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v14 = v11;
    __int16 v15 = 2112;
    id v16 = v4;
    __int16 v17 = 2112;
    v18 = lastSynchronizedRecordIDs;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive %@: %@", buf, 0x20u);
  }
LABEL_9:
}

- (NSSet)lastSynchronizedRecordIDs
{
  v32[2] = *MEMORY[0x1E4F143B8];
  lastSynchronizedRecordIDs = self->_lastSynchronizedRecordIDs;
  if (lastSynchronizedRecordIDs) {
    goto LABEL_17;
  }
  id v4 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel *)self archivedLastSynchronizedRecordIDs];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    v7 = [v5 setWithArray:v6];

    v8 = (void *)MEMORY[0x1E4F28DC0];
    v9 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel *)self archivedLastSynchronizedRecordIDs];
    id v25 = 0;
    v10 = [v8 unarchivedObjectOfClasses:v7 fromData:v9 error:&v25];
    id v11 = v25;

    if (v10)
    {
      id v12 = v10;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
      v14 = v13;

      __int16 v15 = self->_lastSynchronizedRecordIDs;
      self->_lastSynchronizedRecordIDs = v14;

      if (self->_lastSynchronizedRecordIDs) {
        goto LABEL_14;
      }
      id v16 = (void *)MEMORY[0x1D9452090]();
      __int16 v17 = self;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v27 = v19;
        __int16 v28 = 2112;
        id v29 = v12;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unarchived an object of an unexpected type: %@", buf, 0x16u);
LABEL_12:
      }
    }
    else
    {
      id v16 = (void *)MEMORY[0x1D9452090]();
      v20 = self;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        v21 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel *)v20 archivedLastSynchronizedRecordIDs];
        *(_DWORD *)buf = 138543874;
        v27 = v19;
        __int16 v28 = 2112;
        id v29 = v21;
        __int16 v30 = 2112;
        id v31 = v11;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive %@: %@", buf, 0x20u);

        goto LABEL_12;
      }
    }

LABEL_14:
  }
  lastSynchronizedRecordIDs = self->_lastSynchronizedRecordIDs;
  if (!lastSynchronizedRecordIDs)
  {
    v22 = [MEMORY[0x1E4F1CAD0] set];
    v23 = self->_lastSynchronizedRecordIDs;
    self->_lastSynchronizedRecordIDs = v22;

    lastSynchronizedRecordIDs = self->_lastSynchronizedRecordIDs;
  }
LABEL_17:
  return lastSynchronizedRecordIDs;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel)init
{
  v3 = [(id)objc_opt_class() modelID];
  id v4 = [(id)objc_opt_class() parentModelID];
  v5 = [(HMBModel *)self initWithModelID:v3 parentModelID:v4];

  return v5;
}

@end