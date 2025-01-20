@interface HMDHAPAccessoryTransaction
+ (id)properties;
- (HAPAccessory)hapAccessoryLocal;
- (NSSet)chipPairings;
- (id)dependentUUIDs;
- (void)setChipPairings:(id)a3;
- (void)setHapAccessoryLocal:(id)a3;
@end

@implementation HMDHAPAccessoryTransaction

+ (id)properties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__HMDHAPAccessoryTransaction_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_48631 != -1) {
    dispatch_once(&properties_onceToken_48631, block);
  }
  v2 = (void *)properties__properties_48632;
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHapAccessoryLocal:(id)a3
{
}

void __40__HMDHAPAccessoryTransaction_properties__block_invoke(uint64_t a1)
{
  v45[33] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1CA60];
  v42.receiver = *(id *)(a1 + 32);
  v42.super_class = (Class)&OBJC_METACLASS___HMDHAPAccessoryTransaction;
  v2 = objc_msgSendSuper2(&v42, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_48632;
  properties__properties_48632 = v3;

  v34 = (void *)properties__properties_48632;
  v44[0] = @"uniqueIdentifier";
  v41 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[0] = v41;
  v44[1] = @"bridgeUUID";
  v40 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[1] = v40;
  v44[2] = @"paired";
  v39 = +[HMDBackingStoreModelObjectStorageInfo deprecatedField];
  v45[2] = v39;
  v44[3] = @"accessoryFlags";
  v38 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[3] = v38;
  v44[4] = @"certificationStatus";
  v37 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[4] = v37;
  v44[5] = @"pairingUsername";
  v36 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[5] = v36;
  v44[6] = @"publicKey";
  v35 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[6] = v35;
  v44[7] = @"transportInformation";
  v33 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[7] = v33;
  v44[8] = @"communicationProtocol";
  v32 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[8] = v32;
  v44[9] = @"accessorySetupHash";
  v31 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[9] = v31;
  v44[10] = @"broadcastKey";
  v30 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[10] = v30;
  v44[11] = @"keyUpdatedStateNumber";
  v29 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[11] = v29;
  v44[12] = @"keyUpdatedTime";
  v28 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[12] = v28;
  v44[13] = @"targetUUIDs";
  v27 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[13] = v27;
  v44[14] = @"hardwareSupport";
  v26 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[14] = v26;
  v44[15] = @"connectivityInfo";
  v25 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[15] = v25;
  v44[16] = @"wiFiTransportCapabilities";
  v24 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[16] = v24;
  v44[17] = @"sleepInterval";
  v23 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[17] = v23;
  v44[18] = @"hasOnboardedForNaturalLighting";
  v22 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[18] = v22;
  v44[19] = @"initialServiceTypeUUIDs";
  uint64_t v5 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  v20 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:v5 additionalDecodeClasses:v21];
  v45[19] = v20;
  v44[20] = @"needsOnboarding";
  v19 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[20] = v19;
  v44[21] = @"suspendedState";
  v18 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[21] = v18;
  v44[22] = @"preferredMediaUserUUID";
  v17 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[22] = v17;
  v44[23] = @"preferredUserSelectionType";
  v16 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[23] = v16;
  v44[24] = @"chipNodeID";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[24] = v6;
  v44[25] = @"chipVendorID";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[25] = v7;
  v44[26] = @"chipProductID";
  v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[26] = v8;
  v44[27] = @"chipAttributeDatabase";
  v9 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[27] = v9;
  v44[28] = @"chipPairingsData";
  v10 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[28] = v10;
  v44[29] = @"chipWEDSupport";
  v11 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[29] = v11;
  v44[30] = @"chipExtendedMACAddress";
  v12 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[30] = v12;
  v44[31] = @"matterSoftwareVersionNumber";
  v13 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[31] = v13;
  v44[32] = @"supportedLinkLayerTypes";
  v14 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45[32] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:33];
  [v34 addEntriesFromDictionary:v15];
}

- (HAPAccessory)hapAccessoryLocal
{
  return self->_hapAccessoryLocal;
}

- (void)setChipPairings:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v11 = 0;
    uint64_t v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v11];
    id v6 = v11;
    if (v5)
    {
      [(HMDHAPAccessoryTransaction *)self setChipPairingsData:v5];
    }
    else
    {
      v7 = (void *)MEMORY[0x1D9452090]();
      v8 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v13 = v10;
        __int16 v14 = 2112;
        id v15 = v4;
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize pairings %@: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    [(HMDHAPAccessoryTransaction *)self setChipPairingsData:0];
  }
}

- (NSSet)chipPairings
{
  v21[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDHAPAccessoryTransaction *)self chipPairingsData];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    v7 = [v5 setWithArray:v6];
    id v16 = 0;
    v8 = [v4 unarchivedObjectOfClasses:v7 fromData:v3 error:&v16];
    id v9 = v16;

    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v11 = (void *)MEMORY[0x1D9452090]();
      v12 = self;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        __int16 v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v18 = v14;
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize pairings from data: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return (NSSet *)v8;
}

- (id)dependentUUIDs
{
  v2 = self;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)HMDHAPAccessoryTransaction;
  uint64_t v3 = [(HMDAccessoryTransaction *)&v33 dependentUUIDs];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(HMDHAPAccessoryTransaction *)v2 bridgeUUID];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F29128]);
    v7 = [(HMDHAPAccessoryTransaction *)v2 bridgeUUID];
    v8 = (void *)[v6 initWithUUIDString:v7];
    [v4 addObject:v8];
  }
  id v9 = [(HMDHAPAccessoryTransaction *)v2 targetUUIDs];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    v26 = v4;
    id v11 = (void *)MEMORY[0x1E4F1CA48];
    v12 = [(HMDHAPAccessoryTransaction *)v2 targetUUIDs];
    v28 = objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = [(HMDHAPAccessoryTransaction *)v2 targetUUIDs];
    uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
    unint64_t v14 = 0x1E4F29000uLL;
    if (v13)
    {
      uint64_t v15 = v13;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          __int16 v19 = (void *)[objc_alloc(*(Class *)(v14 + 296)) initWithUUIDString:v18];
          if (v19)
          {
            [v28 addObject:v19];
          }
          else
          {
            id v20 = (void *)MEMORY[0x1D9452090]();
            v21 = v2;
            v22 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v24 = v23 = v2;
              *(_DWORD *)buf = 138543618;
              v35 = v24;
              __int16 v36 = 2112;
              uint64_t v37 = v18;
              _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@UUID string not well-formed: %@", buf, 0x16u);

              v2 = v23;
              unint64_t v14 = 0x1E4F29000;
            }
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v15);
    }

    id v4 = v26;
    [v26 addObjectsFromArray:v28];
  }
  return v4;
}

@end