@interface HMDServiceTransaction
+ (id)properties;
- (NSString)lastSeenConfiguredNameLocal;
- (OS_dispatch_group)configurationTracker;
- (void)setConfigurationTracker:(id)a3;
- (void)setLastSeenConfiguredNameLocal:(id)a3;
@end

@implementation HMDServiceTransaction

+ (id)properties
{
  if (properties_onceToken_73630 != -1) {
    dispatch_once(&properties_onceToken_73630, &__block_literal_global_552);
  }
  v2 = (void *)properties__properties_73631;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationTracker, 0);
  objc_storeStrong((id *)&self->_lastSeenConfiguredNameLocal, 0);
}

- (void)setConfigurationTracker:(id)a3
{
}

- (OS_dispatch_group)configurationTracker
{
  return self->_configurationTracker;
}

- (void)setLastSeenConfiguredNameLocal:(id)a3
{
}

- (NSString)lastSeenConfiguredNameLocal
{
  return self->_lastSeenConfiguredNameLocal;
}

void __35__HMDServiceTransaction_properties__block_invoke()
{
  v24[21] = *MEMORY[0x1E4F143B8];
  v23[0] = @"instanceID";
  v22 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[0] = v22;
  v23[1] = @"name";
  v21 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[1] = v21;
  v23[2] = @"providedName";
  v20 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[2] = v20;
  v23[3] = @"serviceType";
  v19 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[3] = v19;
  v23[4] = @"associatedServiceType";
  v18 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[4] = v18;
  v23[5] = @"serviceSubtype";
  v17 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[5] = v17;
  v23[6] = @"labelIndex";
  v16 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[6] = v16;
  v23[7] = @"labelNamespace";
  v15 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[7] = v15;
  v23[8] = @"configurationState";
  v14 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[8] = v14;
  v23[9] = @"linkedServices";
  v13 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[9] = v13;
  v23[10] = @"hidden";
  v12 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[10] = v12;
  v23[11] = @"primary";
  v11 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[11] = v11;
  v23[12] = @"characteristics";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[12] = v0;
  v23[13] = @"expectedConfiguredName";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[13] = v1;
  v23[14] = @"lastKnownDiscoveryMode";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[14] = v2;
  v23[15] = @"lastKnownOperatingState";
  v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[15] = v3;
  v23[16] = @"lastKnownOperatingStateAbnormalReasons";
  v4 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[16] = v4;
  v23[17] = @"mediaSourceIdentifier";
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[17] = v5;
  v23[18] = @"mediaSourceDisplayOrder";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[18] = v6;
  v23[19] = @"serviceProperties";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[19] = v7;
  v23[20] = @"matterEndpointID";
  v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[20] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:21];
  v10 = (void *)properties__properties_73631;
  properties__properties_73631 = v9;
}

@end