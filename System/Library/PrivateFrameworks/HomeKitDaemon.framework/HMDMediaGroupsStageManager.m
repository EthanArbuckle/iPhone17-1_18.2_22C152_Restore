@interface HMDMediaGroupsStageManager
+ (id)logCategory;
- (BOOL)hasSavedIdentifier;
- (HMDMediaGroupsAggregateData)committedAggregateData;
- (HMDMediaGroupsAggregateData)lastNotifiedAggregateData;
- (HMDMediaGroupsStageManager)initWithIdentifier:(id)a3 userDefaults:(id)a4;
- (HMDMediaGroupsStageManagerDelegate)delegate;
- (HMFStagedValue)stagedAggregateData;
- (NSUUID)identifier;
- (NSUUID)stagedUnpairedCurrentDestinationControllerIdentifier;
- (NSUserDefaults)userDefaults;
- (id)logIdentifier;
- (id)savedAggregateData;
- (id)transformedDestinationControllersData;
- (id)transformedDestinationForLegacyMediaSystem:(id)a3 role:(unint64_t)a4;
- (id)transformedDestinations;
- (id)transformedGroups;
- (void)clearSavedData;
- (void)commitAggregateData:(id)a3;
- (void)configure;
- (void)notifyOfUpdatedAggregateData;
- (void)refreshManager;
- (void)saveAggregateData:(id)a3;
- (void)saveAssociatedGroupDataForCurrentLegacyAppleTVAccessory:(id)a3;
- (void)saveAssociatedGroupDataForCurrentLegacyHomePodAccessory:(id)a3;
- (void)saveAssociatedGroupDataForLegacyCurrentAccessory:(id)a3;
- (void)saveDataForLegacyMediaSystem:(id)a3;
- (void)saveDestinationControllerData:(id)a3;
- (void)saveDestinations:(id)a3;
- (void)saveGroup:(id)a3;
- (void)saveIdentifier;
- (void)setCommittedAggregateData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastNotifiedAggregateData:(id)a3;
- (void)setStagedUnpairedCurrentDestinationControllerIdentifier:(id)a3;
- (void)stageNullDestinationForCurrentDestinationControllerIdentifier:(id)a3;
- (void)stagedValue:(id)a3 didExpireValue:(id)a4;
- (void)unstageNullDestinationForCurrentDestinationController;
@end

@implementation HMDMediaGroupsStageManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedUnpairedCurrentDestinationControllerIdentifier, 0);
  objc_storeStrong((id *)&self->_lastNotifiedAggregateData, 0);
  objc_storeStrong((id *)&self->_committedAggregateData, 0);
  objc_storeStrong((id *)&self->_stagedAggregateData, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setStagedUnpairedCurrentDestinationControllerIdentifier:(id)a3
{
}

- (NSUUID)stagedUnpairedCurrentDestinationControllerIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastNotifiedAggregateData:(id)a3
{
}

- (HMDMediaGroupsAggregateData)lastNotifiedAggregateData
{
  return (HMDMediaGroupsAggregateData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCommittedAggregateData:(id)a3
{
}

- (HMDMediaGroupsAggregateData)committedAggregateData
{
  return (HMDMediaGroupsAggregateData *)objc_getProperty(self, a2, 40, 1);
}

- (HMFStagedValue)stagedAggregateData
{
  return (HMFStagedValue *)objc_getProperty(self, a2, 32, 1);
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDMediaGroupsStageManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDMediaGroupsStageManagerDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDMediaGroupsStageManager *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)stagedValue:(id)a3 didExpireValue:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling expired staged aggregate data: %@", (uint8_t *)&v12, 0x16u);
  }
  [(HMDMediaGroupsStageManager *)v9 refreshManager];
}

- (void)clearSavedData
{
  v3 = [(HMDMediaGroupsStageManager *)self userDefaults];
  [v3 removeObjectForKey:@"HMDMediaGroupsStageManagerIdentifierKey"];

  id v4 = [(HMDMediaGroupsStageManager *)self userDefaults];
  [v4 removeObjectForKey:@"HMDMediaGroupsStageManagerAggregatedDataKey"];
}

- (void)saveGroup:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v17 = 138543618;
    v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Saving group: %@", (uint8_t *)&v17, 0x16u);
  }
  v9 = [(HMDMediaGroupsStageManager *)v6 savedAggregateData];
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    int v12 = [HMDMediaGroupsAggregateData alloc];
    v11 = [(HMDMediaGroupsAggregateData *)v12 initWithDestinations:MEMORY[0x263EFFA68] destinationControllersData:MEMORY[0x263EFFA68]];
  }
  v13 = v11;

  __int16 v14 = (void *)[(HMDMediaGroupsAggregateData *)v13 mutableCopy];
  id v15 = [v14 groups];
  uint64_t v16 = [v15 arrayByAddingObject:v4];
  [v14 setGroups:v16];

  [(HMDMediaGroupsStageManager *)v6 saveAggregateData:v14];
}

- (void)saveDestinations:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v17 = 138543618;
    v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Saving destinations: %@", (uint8_t *)&v17, 0x16u);
  }
  v9 = [(HMDMediaGroupsStageManager *)v6 savedAggregateData];
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    int v12 = [HMDMediaGroupsAggregateData alloc];
    v11 = [(HMDMediaGroupsAggregateData *)v12 initWithDestinations:MEMORY[0x263EFFA68] destinationControllersData:MEMORY[0x263EFFA68]];
  }
  v13 = v11;

  __int16 v14 = (void *)[(HMDMediaGroupsAggregateData *)v13 mutableCopy];
  id v15 = [v14 destinations];
  uint64_t v16 = [v15 arrayByAddingObjectsFromArray:v4];
  [v14 setDestinations:v16];

  [(HMDMediaGroupsStageManager *)v6 saveAggregateData:v14];
}

- (void)saveDestinationControllerData:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v17 = 138543618;
    v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Saving destination controller data: %@", (uint8_t *)&v17, 0x16u);
  }
  v9 = [(HMDMediaGroupsStageManager *)v6 savedAggregateData];
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    int v12 = [HMDMediaGroupsAggregateData alloc];
    v11 = [(HMDMediaGroupsAggregateData *)v12 initWithDestinations:MEMORY[0x263EFFA68] destinationControllersData:MEMORY[0x263EFFA68]];
  }
  v13 = v11;

  __int16 v14 = (void *)[(HMDMediaGroupsAggregateData *)v13 mutableCopy];
  id v15 = [v14 destinationControllersData];
  uint64_t v16 = [v15 arrayByAddingObject:v4];
  [v14 setDestinationControllersData:v16];

  [(HMDMediaGroupsStageManager *)v6 saveAggregateData:v14];
}

- (BOOL)hasSavedIdentifier
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [(HMDMediaGroupsStageManager *)self userDefaults];
  id v4 = [v3 stringForKey:@"HMDMediaGroupsStageManagerIdentifierKey"];

  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v4];
    if (v5)
    {
      id v6 = [(HMDMediaGroupsStageManager *)self identifier];
      char v7 = objc_msgSend(v5, "hmf_isEqualToUUID:", v6);
    }
    else
    {
      v8 = (void *)MEMORY[0x230FBD990]();
      v9 = self;
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = HMFGetLogIdentifier();
        int v13 = 138543618;
        __int16 v14 = v11;
        __int16 v15 = 2112;
        uint64_t v16 = v4;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to decode identifier: %@", (uint8_t *)&v13, 0x16u);
      }
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)savedAggregateData
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(HMDMediaGroupsStageManager *)self hasSavedIdentifier])
  {
    v3 = [(HMDMediaGroupsStageManager *)self userDefaults];
    id v4 = [v3 objectForKey:@"HMDMediaGroupsStageManagerAggregatedDataKey"];

    if (v4)
    {
      v5 = [[HMDMediaGroupsAggregateData alloc] initWithProtoBufferData:v4];
      id v6 = v5;
      if (v5)
      {
        char v7 = v5;
      }
      else
      {
        v8 = (void *)MEMORY[0x230FBD990]();
        v9 = self;
        v10 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = HMFGetLogIdentifier();
          int v13 = 138543618;
          __int16 v14 = v11;
          __int16 v15 = 2112;
          uint64_t v16 = v4;
          _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to saved aggregate data due to unable to decode data: %@", (uint8_t *)&v13, 0x16u);
        }
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)saveIdentifier
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    char v7 = [(HMDMediaGroupsStageManager *)v4 identifier];
    int v11 = 138543618;
    int v12 = v6;
    __int16 v13 = 2112;
    __int16 v14 = v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Saving identifier: %@", (uint8_t *)&v11, 0x16u);
  }
  v8 = [(HMDMediaGroupsStageManager *)v4 userDefaults];
  v9 = [(HMDMediaGroupsStageManager *)v4 identifier];
  v10 = [v9 UUIDString];
  [v8 setObject:v10 forKey:@"HMDMediaGroupsStageManagerIdentifierKey"];
}

- (void)saveAggregateData:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  char v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v11 = 138543618;
    int v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Saving aggregate data: %@", (uint8_t *)&v11, 0x16u);
  }
  [(HMDMediaGroupsStageManager *)v6 saveIdentifier];
  v9 = [(HMDMediaGroupsStageManager *)v6 userDefaults];
  v10 = [v4 encodeToProtoBufferData];
  [v9 setObject:v10 forKey:@"HMDMediaGroupsStageManagerAggregatedDataKey"];
}

- (id)transformedDestinationForLegacyMediaSystem:(id)a3 role:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v7 = [v6 components];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __78__HMDMediaGroupsStageManager_transformedDestinationForLegacyMediaSystem_role___block_invoke;
  v21[3] = &__block_descriptor_40_e33_B16__0__HMDMediaSystemComponent_8l;
  v21[4] = a4;
  v8 = objc_msgSend(v7, "na_firstObjectPassingTest:", v21);

  id v9 = [v8 accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  int v12 = [v11 audioDestination];
  __int16 v13 = v12;
  if (v12)
  {
    id v14 = (void *)[v12 mutableCopy];
    uint64_t v15 = [v6 uuid];
    [v14 setAudioGroupIdentifier:v15];
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v23 = v19;
      __int16 v24 = 2112;
      v25 = v8;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination from component: %@ accessory: %@", buf, 0x20u);
    }
    id v14 = 0;
  }

  return v14;
}

BOOL __78__HMDMediaGroupsStageManager_transformedDestinationForLegacyMediaSystem_role___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 role];
  BOOL v4 = [v3 type] == *(void *)(a1 + 32);

  return v4;
}

- (void)saveDataForLegacyMediaSystem:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDMediaGroupsStageManager *)self transformedDestinationForLegacyMediaSystem:v4 role:2];
  id v6 = [(HMDMediaGroupsStageManager *)self transformedDestinationForLegacyMediaSystem:v4 role:1];
  v31 = [v4 audioDestination];
  if (v5 && v6)
  {
    v29 = [v4 configuredName];
    if (v29)
    {
      id v7 = v29;
    }
    else
    {
      id v7 = [v4 name];
    }
    v30 = v7;
    int v12 = [v4 audioDestination];
    uint64_t v28 = [v12 audioGroupIdentifier];

    __int16 v13 = [v6 uniqueIdentifier];
    uint64_t v27 = [v5 uniqueIdentifier];
    id v14 = [v4 home];
    uint64_t v15 = [v14 uuid];

    if (v15 && v30)
    {
      id v16 = objc_alloc(MEMORY[0x263F0E558]);
      [v4 uuid];
      uint64_t v17 = v26 = v13;
      __int16 v19 = (void *)v27;
      v18 = (void *)v28;
      id v20 = (void *)[v16 initWithIdentifier:v17 parentIdentifier:v15 name:v30 defaultName:v29 == 0 associatedGroupIdentifier:v28 leftDestinationIdentifier:v26 rightDestinationIdentifier:v27];

      v32[0] = v6;
      v32[1] = v5;
      v32[2] = v31;
      uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:3];
      [(HMDMediaGroupsStageManager *)self saveDestinations:v21];

      __int16 v13 = v26;
      [(HMDMediaGroupsStageManager *)self saveGroup:v20];
    }
    else
    {
      v22 = (void *)MEMORY[0x230FBD990]();
      v23 = self;
      __int16 v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v34 = v25;
        __int16 v35 = 2112;
        id v36 = v15;
        __int16 v37 = 2112;
        v38 = v30;
        __int16 v39 = 2112;
        id v40 = v4;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage data due to missing home identifier: %@ name: %@ for media system: %@", buf, 0x2Au);
      }
      __int16 v19 = (void *)v27;
      v18 = (void *)v28;
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v34 = v11;
      __int16 v35 = 2112;
      id v36 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage data due to missing destinations for media system: %@", buf, 0x16u);
    }
  }
}

- (void)saveAssociatedGroupDataForCurrentLegacyAppleTVAccessory:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 audioDestinationControllerData];
  id v6 = [v5 destinationIdentifier];
  if (v6)
  {
    id v7 = [v4 home];
    v8 = v7;
    if (v7)
    {
      id v9 = [v7 appleMediaAccessories];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __86__HMDMediaGroupsStageManager_saveAssociatedGroupDataForCurrentLegacyAppleTVAccessory___block_invoke;
      v21[3] = &unk_264A2F948;
      id v10 = v6;
      id v22 = v10;
      v23 = self;
      id v11 = v5;
      id v24 = v11;
      objc_msgSend(v9, "na_each:", v21);

      int v12 = [v8 mediaSystems];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __86__HMDMediaGroupsStageManager_saveAssociatedGroupDataForCurrentLegacyAppleTVAccessory___block_invoke_2;
      v17[3] = &unk_264A2F970;
      id v18 = v10;
      __int16 v19 = self;
      id v20 = v11;
      objc_msgSend(v12, "na_each:", v17);
    }
    else
    {
      __int16 v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = self;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v26 = v16;
        __int16 v27 = 2112;
        id v28 = v4;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed stage associated group data due to no home for current accessory: %@", buf, 0x16u);
      }
    }
  }
}

void __86__HMDMediaGroupsStageManager_saveAssociatedGroupDataForCurrentLegacyAppleTVAccessory___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  v3 = [a2 audioDestination];
  id v4 = [v3 uniqueIdentifier];
  int v5 = objc_msgSend(v4, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  if (v5)
  {
    [*(id *)(a1 + 40) saveDestinationControllerData:*(void *)(a1 + 48)];
    id v6 = *(void **)(a1 + 40);
    v8[0] = v3;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    [v6 saveDestinations:v7];
  }
}

void __86__HMDMediaGroupsStageManager_saveAssociatedGroupDataForCurrentLegacyAppleTVAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 audioDestination];
  id v4 = [v3 uniqueIdentifier];
  int v5 = objc_msgSend(v4, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  if (v5)
  {
    [*(id *)(a1 + 40) saveDestinationControllerData:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) saveDataForLegacyMediaSystem:v6];
  }
}

- (void)saveAssociatedGroupDataForCurrentLegacyHomePodAccessory:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 audioDestination];
  id v6 = [v4 home];
  id v7 = v6;
  if (v5 && v6)
  {
    v8 = [v6 mediaSystemForAppleMediaAccessory:v4];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 audioDestination];
      if (!v10)
      {
        __int16 v19 = (void *)MEMORY[0x230FBD990]();
        id v20 = self;
        uint64_t v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          id v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v25 = v22;
          __int16 v26 = 2112;
          __int16 v27 = v9;
          _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage associated data due to no root destination identifier from media system: %@", buf, 0x16u);
        }
        goto LABEL_17;
      }
      id v11 = (id)v10;
      int v12 = [v7 audioDestinationControllerDataForDestination:v10];
      [(HMDMediaGroupsStageManager *)self saveDataForLegacyMediaSystem:v9];
      if (!v12)
      {
LABEL_13:

LABEL_17:
        goto LABEL_18;
      }
    }
    else
    {
      id v11 = v5;
      uint64_t v17 = [v7 audioDestinationControllerDataForDestination:v11];
      if (!v17) {
        goto LABEL_13;
      }
      int v12 = (void *)v17;
      id v23 = v11;
      id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
      [(HMDMediaGroupsStageManager *)self saveDestinations:v18];
    }
    [(HMDMediaGroupsStageManager *)self saveDestinationControllerData:v12];

    goto LABEL_13;
  }
  __int16 v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = self;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    id v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v25 = v16;
    __int16 v26 = 2112;
    __int16 v27 = v5;
    __int16 v28 = 2112;
    uint64_t v29 = v7;
    __int16 v30 = 2112;
    id v31 = v4;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage associated data due to no destination: %@ home: %@ for the current HomePod accessory: %@", buf, 0x2Au);
  }
LABEL_18:
}

- (void)saveAssociatedGroupDataForLegacyCurrentAccessory:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isHomePod])
  {
    [(HMDMediaGroupsStageManager *)self saveAssociatedGroupDataForCurrentLegacyHomePodAccessory:v4];
  }
  else if ([v4 isAppleTV])
  {
    [(HMDMediaGroupsStageManager *)self saveAssociatedGroupDataForCurrentLegacyAppleTVAccessory:v4];
  }
  else
  {
    int v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to save associated group data due to unknown category for current accessory: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)commitAggregateData:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Committing aggregate data: %@", (uint8_t *)&v9, 0x16u);
  }
  [(HMDMediaGroupsStageManager *)v6 setCommittedAggregateData:v4];
  [(HMDMediaGroupsStageManager *)v6 refreshManager];
}

- (void)notifyOfUpdatedAggregateData
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  int v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [(HMDMediaGroupsStageManager *)v4 lastNotifiedAggregateData];
    int v14 = 138543618;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Notifying of updated aggregate data: %@", (uint8_t *)&v14, 0x16u);
  }
  v8 = [(HMDMediaGroupsStageManager *)v4 delegate];
  int v9 = v8;
  if (v8)
  {
    [v8 didUpdateAggregateDataForMediaGroupsStageManager:v4];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    __int16 v11 = v4;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      uint64_t v15 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of updated aggregate data due to no delegate", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (id)transformedGroups
{
  v3 = [(HMDMediaGroupsStageManager *)self committedAggregateData];
  id v4 = [v3 groups];

  int v5 = [(HMDMediaGroupsStageManager *)self stagedAggregateData];
  id v6 = [v5 value];
  id v7 = [v6 groups];

  if (v7)
  {
    addOrReplaceElements(v7, v4, &__block_literal_global_15_274382);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = v4;
  }
  int v9 = v8;

  return v9;
}

uint64_t __47__HMDMediaGroupsStageManager_transformedGroups__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 identifier];
  id v6 = [v4 identifier];

  uint64_t v7 = objc_msgSend(v5, "hmf_isEqualToUUID:", v6);
  return v7;
}

- (id)transformedDestinationControllersData
{
  v3 = [(HMDMediaGroupsStageManager *)self stagedAggregateData];
  id v4 = [v3 value];
  int v5 = [v4 destinationControllersData];

  id v6 = [(HMDMediaGroupsStageManager *)self stagedUnpairedCurrentDestinationControllerIdentifier];
  uint64_t v7 = [(HMDMediaGroupsStageManager *)self committedAggregateData];
  id v8 = [v7 destinationControllersData];

  if (v5)
  {
    uint64_t v9 = addOrReplaceElements(v5, v8, &__block_literal_global_11_274387);

    id v8 = (void *)v9;
  }
  if (v6)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __67__HMDMediaGroupsStageManager_transformedDestinationControllersData__block_invoke_2;
    v12[3] = &unk_264A2F900;
    id v13 = v6;
    uint64_t v10 = objc_msgSend(v8, "na_map:", v12);

    id v8 = (void *)v10;
  }

  return v8;
}

id __67__HMDMediaGroupsStageManager_transformedDestinationControllersData__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];
  if (objc_msgSend(v4, "hmf_isEqualToUUID:", *(void *)(a1 + 32)))
  {
    int v5 = [v3 destinationIdentifier];

    if (v5)
    {
      id v6 = (id)[v3 mutableCopy];
      [v6 setDestinationIdentifier:0];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v6 = v3;
LABEL_6:

  return v6;
}

uint64_t __67__HMDMediaGroupsStageManager_transformedDestinationControllersData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 identifier];
  id v6 = [v4 identifier];

  uint64_t v7 = objc_msgSend(v5, "hmf_isEqualToUUID:", v6);
  return v7;
}

- (id)transformedDestinations
{
  id v3 = [(HMDMediaGroupsStageManager *)self committedAggregateData];
  id v4 = [v3 destinations];

  int v5 = [(HMDMediaGroupsStageManager *)self stagedAggregateData];
  id v6 = [v5 value];
  uint64_t v7 = [v6 destinations];

  if (v7)
  {
    addOrReplaceElements(v7, v4, &__block_literal_global_274391);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = v4;
  }
  uint64_t v9 = v8;

  return v9;
}

uint64_t __53__HMDMediaGroupsStageManager_transformedDestinations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 uniqueIdentifier];
  id v6 = [v4 uniqueIdentifier];

  uint64_t v7 = objc_msgSend(v5, "hmf_isEqualToUUID:", v6);
  return v7;
}

- (void)refreshManager
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(HMDMediaGroupsStageManager *)self committedAggregateData];
  id v4 = (void *)[v3 mutableCopy];

  int v5 = [(HMDMediaGroupsStageManager *)self transformedDestinations];
  [v4 setDestinations:v5];

  id v6 = [(HMDMediaGroupsStageManager *)self transformedDestinationControllersData];
  [v4 setDestinationControllersData:v6];

  uint64_t v7 = [(HMDMediaGroupsStageManager *)self transformedGroups];
  [v4 setGroups:v7];

  id v8 = [(HMDMediaGroupsStageManager *)self lastNotifiedAggregateData];
  int v9 = [v8 isEqual:v4];

  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    __int16 v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = [(HMDMediaGroupsStageManager *)v11 lastNotifiedAggregateData];
      int v15 = 138543618;
      __int16 v16 = v13;
      __int16 v17 = 2112;
      uint64_t v18 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Refresh resulted in no change to aggregate data: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    [(HMDMediaGroupsStageManager *)self setLastNotifiedAggregateData:v4];
    [(HMDMediaGroupsStageManager *)self notifyOfUpdatedAggregateData];
  }
}

- (void)unstageNullDestinationForCurrentDestinationController
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  int v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Unstage null destination for current destination controller", (uint8_t *)&v7, 0xCu);
  }
  [(HMDMediaGroupsStageManager *)v4 setStagedUnpairedCurrentDestinationControllerIdentifier:0];
  [(HMDMediaGroupsStageManager *)v4 refreshManager];
}

- (void)stageNullDestinationForCurrentDestinationControllerIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Stage null destination for current destination controller identifier: %@", (uint8_t *)&v9, 0x16u);
  }
  [(HMDMediaGroupsStageManager *)v6 setStagedUnpairedCurrentDestinationControllerIdentifier:v4];
  [(HMDMediaGroupsStageManager *)v6 refreshManager];
}

- (void)configure
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(HMDMediaGroupsStageManager *)self savedAggregateData];
  id v4 = (void *)MEMORY[0x230FBD990]();
  int v5 = self;
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      id v8 = HMFGetLogIdentifier();
      int v11 = 138543618;
      id v12 = v8;
      __int16 v13 = 2112;
      int v14 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Configuring with staged aggregate data: %@", (uint8_t *)&v11, 0x16u);
    }
    int v9 = [(HMDMediaGroupsStageManager *)v5 stagedAggregateData];
    [v9 stageValue:v3 withTimeout:300.0];

    [(HMDMediaGroupsStageManager *)v5 refreshManager];
    [(HMDMediaGroupsStageManager *)v5 clearSavedData];
  }
  else
  {
    if (v7)
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v10;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Configuring without staged data", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (HMDMediaGroupsStageManager)initWithIdentifier:(id)a3 userDefaults:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    int v9 = v8;
    uint64_t v10 = [HMDMediaGroupsAggregateData alloc];
    int v11 = [(HMDMediaGroupsAggregateData *)v10 initWithDestinations:MEMORY[0x263EFFA68] destinationControllersData:MEMORY[0x263EFFA68]];
    v20.receiver = self;
    v20.super_class = (Class)HMDMediaGroupsStageManager;
    id v12 = [(HMDMediaGroupsStageManager *)&v20 init];
    __int16 v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_identifier, a3);
      objc_storeStrong((id *)&v13->_userDefaults, a4);
      objc_storeStrong((id *)&v13->_committedAggregateData, v11);
      objc_storeStrong((id *)&v13->_lastNotifiedAggregateData, v11);
      uint64_t v14 = [objc_alloc(MEMORY[0x263F42638]) initWithValue:0];
      stagedAggregateData = v13->_stagedAggregateData;
      v13->_stagedAggregateData = (HMFStagedValue *)v14;

      [(HMFStagedValue *)v13->_stagedAggregateData setDelegate:v13];
      stagedUnpairedCurrentDestinationControllerIdentifier = v13->_stagedUnpairedCurrentDestinationControllerIdentifier;
      v13->_stagedUnpairedCurrentDestinationControllerIdentifier = 0;
    }
    return v13;
  }
  else
  {
    uint64_t v18 = (void *)_HMFPreconditionFailure();
    return (HMDMediaGroupsStageManager *)+[HMDMediaGroupsStageManager logCategory];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_274409 != -1) {
    dispatch_once(&logCategory__hmf_once_t24_274409, &__block_literal_global_25_274410);
  }
  v2 = (void *)logCategory__hmf_once_v25_274411;
  return v2;
}

void __41__HMDMediaGroupsStageManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v25_274411;
  logCategory__hmf_once_v25_274411 = v0;
}

@end