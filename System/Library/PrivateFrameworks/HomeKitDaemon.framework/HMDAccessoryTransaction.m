@interface HMDAccessoryTransaction
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)cd_getMKFAccessoryFromAccessory:(id)a3;
+ (id)cd_getMKFAccessoryFromAccessoryUUID:(id)a3;
+ (id)cd_getMKFRoom:(id)a3;
+ (id)properties;
- (NSString)configuredNetworkProtectionGroupUUIDString;
- (OS_dispatch_group)configurationTracker;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
- (id)dependentUUIDs;
- (void)setConfigurationTracker:(id)a3;
- (void)setConfiguredNetworkProtectionGroupUUIDString:(id)a3;
@end

@implementation HMDAccessoryTransaction

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"productData"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"productDataV2"])
    {
      uint64_t v11 = [(HMDAccessoryTransaction *)self productDataV2];
      v12 = (void *)v11;
      v13 = (void *)*MEMORY[0x263EFFD08];
      if (v11) {
        v13 = (void *)v11;
      }
      id v14 = v13;
      goto LABEL_31;
    }
LABEL_24:
    id v14 = 0;
    goto LABEL_34;
  }
  if ([v9 isEqualToString:@"room"])
  {
    if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"roomUUID"]) {
      goto LABEL_24;
    }
    v12 = [(HMDAccessoryTransaction *)self roomUUID];

    if (v12)
    {
      id v15 = objc_alloc(MEMORY[0x263F08C38]);
      v16 = [(HMDAccessoryTransaction *)self roomUUID];
      v12 = (void *)[v15 initWithUUIDString:v16];

      if (v12)
      {
        objc_msgSend((id)objc_opt_class(), "cd_getMKFRoom:", v12);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
LABEL_31:

          goto LABEL_34;
        }
      }
    }
    v17 = (void *)MEMORY[0x230FBD990]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v43 = v20;
      __int16 v44 = 2112;
      v45 = v12;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Did not find the room with UUID (%@). Using default Room.", buf, 0x16u);
    }
    v21 = [(HMDBackingStoreModelObject *)v18 parentUUID];
    id v41 = 0;
    v22 = +[HMDBackingStore cdlsFetchManagedObjectWithUUID:v21 ofModelType:objc_opt_class() error:&v41];
    id v23 = v41;

    if (!v22 || v23)
    {
      v32 = (void *)MEMORY[0x230FBD990]();
      v33 = v18;
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = HMFGetLogIdentifier();
        [(HMDBackingStoreModelObject *)v33 parentUUID];
        v36 = v38 = v32;
        *(_DWORD *)buf = 138543874;
        v43 = v35;
        __int16 v44 = 2112;
        v45 = v36;
        __int16 v46 = 2112;
        id v47 = v23;
        _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to find NSManagedObject for home with UUID %@: %@", buf, 0x20u);

        v32 = v38;
      }

      id v14 = 0;
    }
    else
    {
      id v14 = [v22 defaultRoom];
    }

LABEL_30:
    goto LABEL_31;
  }
  if ([v9 isEqualToString:@"hostAccessory"])
  {
    if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"hostAccessoryUUID"]) {
      goto LABEL_24;
    }
    v24 = [(HMDAccessoryTransaction *)self hostAccessoryUUID];

    if (v24)
    {
      id v25 = objc_alloc(MEMORY[0x263F08C38]);
      v26 = [(HMDAccessoryTransaction *)self hostAccessoryUUID];
      v12 = (void *)[v25 initWithUUIDString:v26];

      if (v12)
      {
        id v40 = 0;
        id v14 = +[HMDBackingStore cdlsFetchManagedObjectWithUUID:v12 ofManagedObjectType:objc_opt_class() error:&v40];
        id v23 = v40;
        if (!v14)
        {
          v27 = (void *)MEMORY[0x230FBD990]();
          v28 = self;
          v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v30 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v43 = v30;
            __int16 v44 = 2112;
            v45 = v12;
            __int16 v46 = 2112;
            id v47 = v23;
            _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unable to find MKFAccessory for host accessory with UUID %@: %@", buf, 0x20u);
          }
        }
        goto LABEL_30;
      }
    }
    uint64_t v31 = [MEMORY[0x263EFF9D0] null];
  }
  else
  {
    v39.receiver = self;
    v39.super_class = (Class)HMDAccessoryTransaction;
    uint64_t v31 = [(HMDBackingStoreModelObject *)&v39 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
  }
  id v14 = (id)v31;
LABEL_34:

  return v14;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"blocked"])
  {
    id v11 = 0;
    goto LABEL_15;
  }
  if ([v9 isEqualToString:@"productDataV2"])
  {
    uint64_t v12 = [v8 productData];
    v13 = (void *)v12;
    id v14 = (void *)*MEMORY[0x263EFFD08];
    if (v12) {
      id v14 = (void *)v12;
    }
    id v11 = v14;
LABEL_14:

    goto LABEL_15;
  }
  if ([v9 isEqualToString:@"roomUUID"])
  {
    id v15 = [v8 room];
LABEL_11:
    v13 = v15;
    v16 = [v15 modelID];
    uint64_t v17 = [v16 UUIDString];
    v18 = (void *)v17;
    v19 = (void *)*MEMORY[0x263EFFD08];
    if (v17) {
      v19 = (void *)v17;
    }
    id v11 = v19;

    goto LABEL_14;
  }
  if ([v9 isEqualToString:@"hostAccessoryUUID"])
  {
    id v15 = [v8 hostAccessory];
    goto LABEL_11;
  }
  v21.receiver = self;
  v21.super_class = (Class)HMDAccessoryTransaction;
  id v11 = [(HMDBackingStoreModelObject *)&v21 cd_generateValueForModelObjectFromManagedObject:v8 modelObjectField:v9 modelFieldInfo:v10];
LABEL_15:

  return v11;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"home";
}

+ (id)cd_getMKFRoom:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v14 = 0;
  v5 = +[HMDBackingStore cdlsFetchManagedObjectWithUUID:v4 ofModelType:objc_opt_class() error:&v14];
  id v6 = v14;
  v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = a1;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v16 = v12;
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Unable to find NSManagedObject for room with UUID %@: %@", buf, 0x20u);
    }
  }

  return v5;
}

+ (id)cd_getMKFAccessoryFromAccessory:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  v5 = v4;
  id v16 = 0;
  id v6 = +[HMDBackingStore cdlsFetchManagedObjectWithUUID:v4 ofManagedObjectType:objc_opt_class() error:&v16];
  id v7 = v16;
  BOOL v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v14 = v6;
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v18 = v13;
      __int16 v19 = 2112;
      v20 = v5;
      __int16 v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the MKFAccessory from UUID : %@/%@", buf, 0x20u);
    }
    id v14 = 0;
  }

  return v14;
}

+ (id)cd_getMKFAccessoryFromAccessoryUUID:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v3];

  id v6 = objc_msgSend(v4, "cd_getMKFAccessoryFromAccessory:", v5);

  return v6;
}

+ (id)properties
{
  if (properties_onceToken_269656 != -1) {
    dispatch_once(&properties_onceToken_269656, &__block_literal_global_269657);
  }
  v2 = (void *)properties__properties_269658;
  return v2;
}

void __37__HMDAccessoryTransaction_properties__block_invoke()
{
  v38[35] = *MEMORY[0x263EF8340];
  v37[0] = @"name";
  v36 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[0] = v36;
  v37[1] = @"configuredName";
  v35 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[1] = v35;
  v37[2] = @"identifier";
  v34 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[2] = v34;
  v37[3] = @"providedName";
  v33 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[3] = v33;
  v37[4] = @"accessoryCategory";
  v32 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[4] = v32;
  v37[5] = @"roomUUID";
  uint64_t v31 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[5] = v31;
  v37[6] = @"hostAccessoryUUID";
  v30 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[6] = v30;
  v37[7] = @"primary";
  v29 = +[HMDBackingStoreModelObjectStorageInfo deprecatedField];
  v38[7] = v29;
  v37[8] = @"model";
  v28 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[8] = v28;
  v37[9] = @"manufacturer";
  v27 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[9] = v27;
  v37[10] = @"firmwareVersion";
  v26 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[10] = v26;
  v37[11] = @"displayableFirmwareVersion";
  id v25 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[11] = v25;
  v37[12] = @"serialNumber";
  v24 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[12] = v24;
  v37[13] = @"productData";
  uint64_t v23 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[13] = v23;
  v37[14] = @"productDataV2";
  v22 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[14] = v22;
  v37[15] = @"networkClientIdentifier";
  __int16 v21 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[15] = v21;
  v37[16] = @"networkRouterUUID";
  v20 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[16] = v20;
  v37[17] = @"targetNetworkProtectionMode";
  __int16 v19 = +[HMDBackingStoreModelObjectStorageInfo deprecatedField];
  v38[17] = v19;
  v37[18] = @"currentNetworkProtectionMode";
  id v18 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[18] = v18;
  v37[19] = @"networkClientLAN";
  __int16 v17 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[19] = v17;
  v37[20] = @"networkClientProfileFingerprint";
  id v16 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[20] = v16;
  v37[21] = @"wiFiUniquePreSharedKey";
  id v15 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[21] = v15;
  v37[22] = @"wiFiCredentialType";
  id v14 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[22] = v14;
  v37[23] = @"pendingConfigurationIdentifier";
  v13 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[23] = v13;
  v37[24] = @"blocked";
  uint64_t v12 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[24] = v12;
  v37[25] = @"appliedFirewallWANRules";
  id v11 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[25] = v11;
  v37[26] = @"lastNetworkAccessViolationOccurrenceSince1970";
  id v10 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[26] = v10;
  v37[27] = @"lastNetworkAccessViolationResetSince1970";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[27] = v0;
  v37[28] = @"suspendCapable";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[28] = v1;
  v37[29] = @"lastSeenDate";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[29] = v2;
  v37[30] = @"lowBattery";
  id v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[30] = v3;
  v37[31] = @"primaryProfileVersion";
  id v4 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[31] = v4;
  v37[32] = @"initialManufacturer";
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[32] = v5;
  v37[33] = @"initialModel";
  id v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[33] = v6;
  v37[34] = @"initialCategoryIdentifier";
  id v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v38[34] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:35];
  BOOL v9 = (void *)properties__properties_269658;
  properties__properties_269658 = v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationTracker, 0);
  objc_storeStrong((id *)&self->_configuredNetworkProtectionGroupUUIDString, 0);
}

- (void)setConfigurationTracker:(id)a3
{
}

- (OS_dispatch_group)configurationTracker
{
  return self->_configurationTracker;
}

- (void)setConfiguredNetworkProtectionGroupUUIDString:(id)a3
{
}

- (NSString)configuredNetworkProtectionGroupUUIDString
{
  return self->_configuredNetworkProtectionGroupUUIDString;
}

- (id)dependentUUIDs
{
  id v3 = [MEMORY[0x263EFF9C0] setWithCapacity:2];
  id v4 = [(HMDBackingStoreModelObject *)self parentUUID];

  if (v4)
  {
    v5 = [(HMDBackingStoreModelObject *)self parentUUID];
    [v3 addObject:v5];
  }
  id v6 = [(HMDAccessoryTransaction *)self roomUUID];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v8 = [(HMDAccessoryTransaction *)self roomUUID];
    BOOL v9 = (void *)[v7 initWithUUIDString:v8];
    [v3 addObject:v9];
  }
  id v10 = [(HMDAccessoryTransaction *)self hostAccessoryUUID];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v12 = [(HMDAccessoryTransaction *)self hostAccessoryUUID];
    v13 = (void *)[v11 initWithUUIDString:v12];
    [v3 addObject:v13];
  }
  return v3;
}

@end