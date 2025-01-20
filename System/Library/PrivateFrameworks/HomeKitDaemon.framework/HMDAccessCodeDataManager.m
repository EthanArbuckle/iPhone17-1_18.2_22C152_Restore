@interface HMDAccessCodeDataManager
+ (id)_accessCodeInHome:(id)a3 forHomeAccessCodeModel:(id)a4;
+ (id)_accessCodeInHome:(id)a3 forRemovedUserAccessCodeModel:(id)a4;
+ (id)createHomeAccessCodeModelsFromLabelsByAccessCode:(id)a3 forHome:(id)a4;
+ (id)createRemovedUserInfoModelsFromRemovedUserInfoByAccessCode:(id)a3 forHome:(id)a4;
+ (id)createUserAccessCodeModelFromAccessCode:(id)a3 forUserUUID:(id)a4 changedByUserUUID:(id)a5;
+ (id)logCategory;
+ (id)userWithAccessCode:(id)a3 inHome:(id)a4;
- (HMDAccessCodeDataManager)initWithContext:(id)a3 delegate:(id)a4;
- (HMDAccessCodeDataManagerDelegate)delegate;
- (HMDAccessCodeManagerContext)context;
- (HMFTimer)dataCleanUpTimer;
- (NSArray)cachedAccessCodes;
- (NSArray)homeAccessCodeValues;
- (NSArray)homeAccessCodeValuesWithRemovedUserInfo;
- (NSArray)homeAccessCodeValuesWithSimpleLabels;
- (NSArray)homeAccessCodeValuesWithUserLabels;
- (NSSet)accessCodeValuesWithRemovedUserInfo;
- (NSSet)accessCodeValuesWithSimpleLabel;
- (NSSet)accessCodeValuesWithUserLabel;
- (id)_removeHMDRemovedUserAccessCodeWithAccessCode:(id)a3;
- (id)_removeSimpleLabelAccessCodeValue:(id)a3;
- (id)_removeUserAccessCodeValue:(id)a3 removedByUserUUID:(id)a4;
- (id)_setSimpleLabel:(id)a3 forAccessCodeValue:(id)a4;
- (id)_setUserWithUUID:(id)a3 forAccessCodeValue:(id)a4 changedByUserUUID:(id)a5;
- (id)addOrUpdateHMDRemovedUserAccessCodeModel:(id)a3;
- (id)addOrUpdateHomeAccessCodeModel:(id)a3;
- (id)addOrUpdateUserAccessCodeModel:(id)a3;
- (id)cachedAccessCodeForIdentifier:(id)a3 accessoryUUID:(id)a4;
- (id)dataCleanUpTimerFactory;
- (id)homeAccessCodeWithRemovedUserInfoWithUUID:(id)a3;
- (id)logIdentifier;
- (id)removeAllHomeAccessCodes;
- (id)removeHMDRemovedUserAccessCodeModel:(id)a3;
- (id)removeHMDRemovedUserAccessCodeWithCode:(id)a3 removedUserInfo:(id)a4;
- (id)removeHomeAccessCodeModel:(id)a3;
- (id)removeHomeAccessCodeWithValue:(id)a3 removedByUserUUID:(id)a4;
- (id)removeUserAccessCodeModel:(id)a3;
- (id)saveRemovedUserAccessCode:(id)a3 withRemovedUserInfo:(id)a4;
- (id)setUserInformation:(id)a3 forHomeAccessCodeWithValue:(id)a4 changedByUserUUID:(id)a5;
- (id)simpleLabelForAccessCode:(id)a3;
- (id)updateUserInformation:(id)a3 forHomeAccessCodeWithOldValue:(id)a4 newAccessCodeValue:(id)a5;
- (id)userUUIDForAccessCode:(id)a3;
- (void)_cleanUpOldRemovedUserData;
- (void)_messageUser:(id)a3 thatTheirAccessCodeWasChangedWithType:(unint64_t)a4;
- (void)_setUpAndStartTimer;
- (void)configure;
- (void)handleRemovedHMDRemovedUserAccessCodeModel:(id)a3 message:(id)a4;
- (void)handleRemovedHomeAccessCodeModel:(id)a3 message:(id)a4;
- (void)handleRemovedUserAccessCodeModel:(id)a3 forUser:(id)a4 message:(id)a5;
- (void)handleUpdatedHMDRemovedUserAccessCodeModel:(id)a3 message:(id)a4;
- (void)handleUpdatedHomeAccessCodeModel:(id)a3 message:(id)a4;
- (void)handleUpdatedUserAccessCodeModel:(id)a3 forUser:(id)a4 message:(id)a5;
- (void)removeHMDRemovedUserAccessCodeWithAccessCode:(id)a3;
- (void)setDataCleanUpTimer:(id)a3;
- (void)setDataCleanUpTimerFactory:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)updateCacheWithAddedAccessCodes:(id)a3;
- (void)updateCacheWithFetchResponses:(id)a3;
- (void)updateCacheWithRemovedAccessCodes:(id)a3;
- (void)updateCacheWithUpdatedAccessCodes:(id)a3;
@end

@implementation HMDAccessCodeDataManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataCleanUpTimer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_dataCleanUpTimerFactory, 0);
}

- (void)setDataCleanUpTimer:(id)a3
{
}

- (HMFTimer)dataCleanUpTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 32, 1);
}

- (HMDAccessCodeManagerContext)context
{
  return (HMDAccessCodeManagerContext *)objc_getProperty(self, a2, 24, 1);
}

- (HMDAccessCodeDataManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDAccessCodeDataManagerDelegate *)WeakRetained;
}

- (void)setDataCleanUpTimerFactory:(id)a3
{
}

- (id)dataCleanUpTimerFactory
{
  return objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDAccessCodeDataManager *)self context];
  v3 = [v2 UUID];
  v4 = [v3 UUIDString];

  return v4;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDAccessCodeDataManager *)self context];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(HMDAccessCodeDataManager *)self dataCleanUpTimer];

  if (v7 == v4)
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@dataCleanUpTimer fired", (uint8_t *)&v14, 0xCu);
    }
    v12 = [(HMDAccessCodeDataManager *)v9 context];
    int v13 = [v12 isCurrentDeviceOwnerController];

    if (v13) {
      [(HMDAccessCodeDataManager *)v9 _cleanUpOldRemovedUserData];
    }
  }
}

- (void)updateCacheWithRemovedAccessCodes:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((objc_msgSend(v4, "hmf_isEmpty") & 1) == 0)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v24 = v4;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v28;
      uint64_t v25 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v28 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v10 = [(HMDAccessCodeDataManager *)self context];
          v11 = [v9 accessoryUUID];
          v12 = [v10 hapAccessoryWithUUID:v11];

          int v13 = (void *)MEMORY[0x230FBD990]();
          int v14 = self;
          v15 = HMFGetOSLogHandle();
          uint64_t v16 = v15;
          if (v12)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              v17 = HMFGetLogIdentifier();
              v18 = [v12 name];
              *(_DWORD *)buf = 138543874;
              v32 = v17;
              __int16 v33 = 2112;
              v34 = v18;
              __int16 v35 = 2112;
              v36 = v9;
              _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating accessory: %@, with removed access code: %@", buf, 0x20u);

              uint64_t v7 = v25;
            }

            v19 = [v12 accessCodeCache];
            v20 = [v9 uniqueIdentifier];
            [v19 removeObjectForKey:v20];
          }
          else
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              v21 = HMFGetLogIdentifier();
              v22 = [v9 accessoryUUID];
              *(_DWORD *)buf = 138543618;
              v32 = v21;
              __int16 v33 = 2112;
              v34 = v22;
              _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to find hap accessory for fetch response with accessory UUID: %@", buf, 0x16u);

              uint64_t v7 = v25;
            }
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
      }
      while (v6);
    }

    v23 = [(HMDAccessCodeDataManager *)self delegate];
    [v23 accessCodeDataManager:self didRemoveAccessoryAccessCodes:obj];

    id v4 = v24;
  }
}

- (void)updateCacheWithUpdatedAccessCodes:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((objc_msgSend(v4, "hmf_isEmpty") & 1) == 0)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v24 = v4;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v28;
      uint64_t v25 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v28 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v10 = [(HMDAccessCodeDataManager *)self context];
          v11 = [v9 accessoryUUID];
          v12 = [v10 hapAccessoryWithUUID:v11];

          int v13 = (void *)MEMORY[0x230FBD990]();
          int v14 = self;
          v15 = HMFGetOSLogHandle();
          uint64_t v16 = v15;
          if (v12)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              v17 = HMFGetLogIdentifier();
              v18 = [v12 name];
              *(_DWORD *)buf = 138543874;
              v32 = v17;
              __int16 v33 = 2112;
              v34 = v18;
              __int16 v35 = 2112;
              v36 = v9;
              _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating accessory: %@, with updated access code: %@", buf, 0x20u);

              uint64_t v7 = v25;
            }

            v19 = [v12 accessCodeCache];
            v20 = [v9 uniqueIdentifier];
            [v19 setObject:v9 forKeyedSubscript:v20];
          }
          else
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              v21 = HMFGetLogIdentifier();
              v22 = [v9 accessoryUUID];
              *(_DWORD *)buf = 138543618;
              v32 = v21;
              __int16 v33 = 2112;
              v34 = v22;
              _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to find hap accessory for accessory access code with accessory UUID: %@", buf, 0x16u);

              uint64_t v7 = v25;
            }
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
      }
      while (v6);
    }

    v23 = [(HMDAccessCodeDataManager *)self delegate];
    [v23 accessCodeDataManager:self didUpdateAccessoryAccessCodes:obj];

    id v4 = v24;
  }
}

- (void)updateCacheWithAddedAccessCodes:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((objc_msgSend(v4, "hmf_isEmpty") & 1) == 0)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v24 = v4;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v28;
      uint64_t v25 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v28 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v10 = [(HMDAccessCodeDataManager *)self context];
          v11 = [v9 accessoryUUID];
          v12 = [v10 hapAccessoryWithUUID:v11];

          int v13 = (void *)MEMORY[0x230FBD990]();
          int v14 = self;
          v15 = HMFGetOSLogHandle();
          uint64_t v16 = v15;
          if (v12)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              v17 = HMFGetLogIdentifier();
              v18 = [v12 name];
              *(_DWORD *)buf = 138543874;
              v32 = v17;
              __int16 v33 = 2112;
              v34 = v18;
              __int16 v35 = 2112;
              v36 = v9;
              _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating accessory: %@, with new access code: %@", buf, 0x20u);

              uint64_t v7 = v25;
            }

            v19 = [v12 accessCodeCache];
            v20 = [v9 uniqueIdentifier];
            [v19 setObject:v9 forKeyedSubscript:v20];
          }
          else
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              v21 = HMFGetLogIdentifier();
              v22 = [v9 accessoryUUID];
              *(_DWORD *)buf = 138543618;
              v32 = v21;
              __int16 v33 = 2112;
              v34 = v22;
              _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to find hap accessory for accessory access code with accessory UUID: %@", buf, 0x16u);

              uint64_t v7 = v25;
            }
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
      }
      while (v6);
    }

    v23 = [(HMDAccessCodeDataManager *)self delegate];
    [v23 accessCodeDataManager:self didAddAccessoryAccessCodes:obj];

    id v4 = v24;
  }
}

- (void)updateCacheWithFetchResponses:(id)a3
{
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke;
  v10[3] = &unk_264A26798;
  v10[4] = self;
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "na_flatMap:", v10);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_2;
  v9[3] = &unk_264A26798;
  v9[4] = self;
  uint64_t v6 = objc_msgSend(v4, "na_flatMap:", v9);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_2_68;
  v8[3] = &unk_264A26798;
  v8[4] = self;
  uint64_t v7 = objc_msgSend(v4, "na_flatMap:", v8);

  [(HMDAccessCodeDataManager *)self updateCacheWithAddedAccessCodes:v5];
  [(HMDAccessCodeDataManager *)self updateCacheWithUpdatedAccessCodes:v6];
  [(HMDAccessCodeDataManager *)self updateCacheWithRemovedAccessCodes:v7];
}

id __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) context];
  uint64_t v5 = [v3 accessoryUUID];
  uint64_t v6 = [v4 hapAccessoryWithUUID:v5];

  if (v6)
  {
    uint64_t v7 = [v3 accessoryAccessCodeValues];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_64;
    v15[3] = &unk_264A26770;
    id v16 = v6;
    v8 = objc_msgSend(v7, "na_filter:", v15);
  }
  else
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = [v3 accessoryUUID];
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      __int16 v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to find hap accessory for fetch response with accessory UUID: %@", buf, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

id __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) context];
  uint64_t v5 = [v3 accessoryUUID];
  uint64_t v6 = [v4 hapAccessoryWithUUID:v5];

  if (v6)
  {
    uint64_t v7 = [v3 accessoryAccessCodeValues];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_67;
    v15[3] = &unk_264A26770;
    id v16 = v6;
    v8 = objc_msgSend(v7, "na_filter:", v15);
  }
  else
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = [v3 accessoryUUID];
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      __int16 v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to find hap accessory for fetch response with accessory UUID: %@", buf, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

id __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_2_68(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) context];
  uint64_t v5 = [v3 accessoryUUID];
  uint64_t v6 = [v4 hapAccessoryWithUUID:v5];

  if (v6)
  {
    uint64_t v7 = [v6 accessCodeCache];
    v8 = [v7 allKeys];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_69;
    v16[3] = &unk_264A267E0;
    id v17 = v3;
    id v18 = v6;
    v9 = objc_msgSend(v8, "na_map:", v16);
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      int v14 = [v3 accessoryUUID];
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      __int16 v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to find hap accessory for fetch response with accessory UUID: %@", buf, 0x16u);
    }
    v9 = 0;
  }

  return v9;
}

id __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_69(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) accessoryAccessCodeValues];
  uint64_t v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_73_203130);

  if ([v5 containsObject:v3])
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 40) accessCodeCache];
    uint64_t v6 = [v7 objectForKeyedSubscript:v3];
  }
  return v6;
}

uint64_t __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_2_70(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

uint64_t __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_67(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 accessCodeCache];
  uint64_t v5 = [v3 uniqueIdentifier];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];
  int v7 = HMFEqualObjects();

  return v7 ^ 1u;
}

uint64_t __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_64(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 accessCodeCache];
  uint64_t v5 = [v4 allKeys];
  uint64_t v6 = [v3 uniqueIdentifier];

  uint64_t v7 = [v5 containsObject:v6] ^ 1;
  return v7;
}

- (id)cachedAccessCodeForIdentifier:(id)a3 accessoryUUID:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDAccessCodeDataManager *)self context];
  v9 = [v8 hapAccessoryWithUUID:v7];

  if (v9)
  {
    id v10 = [v9 accessCodeCache];
    id v11 = [v10 objectForKeyedSubscript:v6];
    v12 = [v11 accessCodeValue];
  }
  else
  {
    int v13 = (void *)MEMORY[0x230FBD990]();
    int v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      int v18 = 138543618;
      __int16 v19 = v16;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to find hap accessory for cached access code with accessory UUID: %@", (uint8_t *)&v18, 0x16u);
    }
    v12 = 0;
  }

  return v12;
}

- (NSArray)cachedAccessCodes
{
  v2 = [(HMDAccessCodeDataManager *)self context];
  id v3 = [v2 accessoriesSupportingAccessCodes];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_62_203136);

  return (NSArray *)v4;
}

id __45__HMDAccessCodeDataManager_cachedAccessCodes__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F0DF18];
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 uuid];
  id v6 = [v3 accessCodeCache];

  id v7 = [v6 allValues];
  v8 = (void *)[v4 initWithAccessoryUUID:v5 accessoryAccessCodeValues:v7 error:0];

  return v8;
}

- (void)handleRemovedHMDRemovedUserAccessCodeModel:(id)a3 message:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v35 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling removed HMDHomeAccessCodeModel", buf, 0xCu);
  }
  v12 = [(HMDAccessCodeDataManager *)v9 context];
  int v13 = [v12 home];

  if (v13)
  {
    int v14 = +[HMDAccessCodeDataManager _accessCodeInHome:v13 forRemovedUserAccessCodeModel:v6];
    v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = v9;
    id v17 = HMFGetOSLogHandle();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v18)
      {
        __int16 v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v35 = v19;
        __int16 v36 = 2112;
        v37 = v13;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@HMDRemovedUserAccessCodeModel was removed. Removing from HMDHome: %@", buf, 0x16u);
      }
      __int16 v20 = [v13 removedUserInfoByAccessCode];
      [v20 removeObjectForKey:v14];

      id v21 = [v7 transactionResult];
      [v21 markChanged];

      [v7 respondWithSuccess];
      uint64_t v22 = [(HMDAccessCodeDataManager *)v16 delegate];
      uint64_t v23 = (void *)MEMORY[0x263F0E398];
      id v24 = [v6 accessCode];
      uint64_t v25 = [v6 removedUserInfo];
      v26 = [v23 homeAccessCodeValueWithStringValue:v24 removedUserInfo:v25];
      __int16 v33 = v26;
      long long v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
      [v22 accessCodeDataManager:v16 didRemoveHomeAccessCodes:v27 removedByUserUUID:0];
    }
    else
    {
      if (v18)
      {
        v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v35 = v32;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Did not find an access code for this model on the home, so we have nothing to remove.", buf, 0xCu);
      }
      [v7 respondWithSuccess];
      int v14 = 0;
    }
  }
  else
  {
    long long v28 = (void *)MEMORY[0x230FBD990]();
    long long v29 = v9;
    long long v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v35 = v31;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Not handling updated HomeAccessCodeModel because home reference was nil", buf, 0xCu);
    }
    int v14 = [MEMORY[0x263F087E8] hmfErrorWithCode:11];
    [v7 respondWithError:v14];
  }
}

- (void)handleUpdatedHMDRemovedUserAccessCodeModel:(id)a3 message:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v58 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling updated HMDHomeAccessCodeModel", buf, 0xCu);
  }
  v12 = [(HMDAccessCodeDataManager *)v9 context];
  int v13 = [v12 home];

  if (!v13)
  {
    v37 = (void *)MEMORY[0x230FBD990]();
    uint64_t v38 = v9;
    v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v58 = v40;
      v41 = "%{public}@Not handling updated HomeAccessCodeModel because home reference was nil";
LABEL_15:
      _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, v41, buf, 0xCu);
    }
LABEL_16:

    v15 = [MEMORY[0x263F087E8] hmfErrorWithCode:11];
    [v7 respondWithError:v15];
    goto LABEL_17;
  }
  int v14 = [v6 removedUserInfo];

  if (!v14)
  {
    v37 = (void *)MEMORY[0x230FBD990]();
    uint64_t v38 = v9;
    v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v58 = v40;
      v41 = "%{public}@HMDRemovedUserAccessCodeModel has a nil property but should not";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  v15 = [(HMDAccessCodeDataManager *)v9 delegate];
  id v16 = [v13 removedUserInfoByAccessCode];
  id v17 = [v6 accessCode];
  BOOL v18 = [v16 objectForKeyedSubscript:v17];

  if (v18)
  {
    __int16 v19 = [v13 removedUserInfoByAccessCode];
    __int16 v20 = [v6 accessCode];
    id v21 = [v19 objectForKeyedSubscript:v20];
    uint64_t v22 = [v6 removedUserInfo];
    char v23 = [v21 isEqual:v22];

    if ((v23 & 1) == 0)
    {
      id v24 = (void *)MEMORY[0x230FBD990]();
      uint64_t v25 = v9;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        long long v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v58 = v27;
        __int16 v59 = 2112;
        v60 = v13;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@HMDRemovedUserAccessCodeModel was updated on HMDHome: %@", buf, 0x16u);
      }
      long long v28 = [v6 removedUserInfo];
      long long v29 = [v13 removedUserInfoByAccessCode];
      long long v30 = [v6 accessCode];
      [v29 setObject:v28 forKeyedSubscript:v30];

      v31 = [v7 transactionResult];
      [v31 markChanged];

      v32 = (void *)MEMORY[0x263F0E398];
      __int16 v33 = [v6 accessCode];
      v34 = [v6 removedUserInfo];
      __int16 v35 = [v32 homeAccessCodeValueWithStringValue:v33 removedUserInfo:v34];
      v55 = v35;
      __int16 v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v55 count:1];
      [v15 accessCodeDataManager:v25 didUpdateHomeAccessCodes:v36 changedByUserUUID:0];
    }
    [v7 respondWithSuccess];
  }
  else
  {
    v42 = (void *)MEMORY[0x230FBD990]();
    v43 = v9;
    v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      v45 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v58 = v45;
      __int16 v59 = 2112;
      v60 = v13;
      _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@New HMDRemovedUserAccessCodeModel was added. Updating values on HMDHome: %@", buf, 0x16u);
    }
    v46 = [v6 removedUserInfo];
    v47 = [v13 removedUserInfoByAccessCode];
    v48 = [v6 accessCode];
    [v47 setObject:v46 forKeyedSubscript:v48];

    v49 = [v7 transactionResult];
    [v49 markChanged];

    [v7 respondWithSuccess];
    v50 = (void *)MEMORY[0x263F0E398];
    v51 = [v6 accessCode];
    v52 = [v6 removedUserInfo];
    v53 = [v50 homeAccessCodeValueWithStringValue:v51 removedUserInfo:v52];
    v56 = v53;
    v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
    [v15 accessCodeDataManager:v43 didAddHomeAccessCodes:v54 addedByUserUUID:0];
  }
LABEL_17:
}

- (void)handleRemovedHomeAccessCodeModel:(id)a3 message:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v35 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling removed HMDHomeAccessCodeModel", buf, 0xCu);
  }
  v12 = [(HMDAccessCodeDataManager *)v9 context];
  int v13 = [v12 home];

  if (v13)
  {
    int v14 = +[HMDAccessCodeDataManager _accessCodeInHome:v13 forHomeAccessCodeModel:v6];
    v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = v9;
    id v17 = HMFGetOSLogHandle();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v18)
      {
        __int16 v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v35 = v19;
        __int16 v36 = 2112;
        v37 = v13;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@HMDHomeAccessCodeModel was removed. Removing value with label on HMDHome: %@", buf, 0x16u);
      }
      __int16 v20 = [v13 labelsByAccessCode];
      [v20 removeObjectForKey:v14];

      id v21 = [v13 labelIdentifiersByAccessCode];
      [v21 removeObjectForKey:v14];

      uint64_t v22 = [v7 transactionResult];
      [v22 markChanged];

      [v7 respondWithSuccess];
      char v23 = [(HMDAccessCodeDataManager *)v16 delegate];
      id v24 = (void *)MEMORY[0x263F0E398];
      uint64_t v25 = [v6 label];
      v26 = [v24 homeAccessCodeValueWithStringValue:v14 label:v25];
      __int16 v33 = v26;
      long long v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
      [v23 accessCodeDataManager:v16 didRemoveHomeAccessCodes:v27 removedByUserUUID:0];
    }
    else
    {
      if (v18)
      {
        v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v35 = v32;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Did not find an access code for this model on the home, so we have nothing to remove.", buf, 0xCu);
      }
      [v7 respondWithSuccess];
      int v14 = 0;
    }
  }
  else
  {
    long long v28 = (void *)MEMORY[0x230FBD990]();
    long long v29 = v9;
    long long v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v35 = v31;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Not handling updated HomeAccessCodeModel because home reference was nil", buf, 0xCu);
    }
    int v14 = [MEMORY[0x263F087E8] hmfErrorWithCode:11];
    [v7 respondWithError:v14];
  }
}

- (void)handleRemovedUserAccessCodeModel:(id)a3 forUser:(id)a4 message:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v26 = v14;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@HMDUserAccessCodeModel was removed. Removing value on HMDUser: %@", buf, 0x16u);
  }
  v15 = [v9 accessCode];
  [v9 setAccessCode:0];
  id v16 = [v8 changedByUserUUID];
  [v9 setAccessCodeChangedByUserUUID:v16];

  id v17 = [v10 transactionResult];
  [v17 markChanged];

  [v10 respondWithSuccess];
  BOOL v18 = [(HMDAccessCodeDataManager *)v12 delegate];
  __int16 v19 = (void *)MEMORY[0x263F0E398];
  __int16 v20 = [v9 uuid];
  id v21 = [v19 homeAccessCodeValueWithStringValue:v15 userUUID:v20];
  id v24 = v21;
  uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
  char v23 = [v8 changedByUserUUID];
  [v18 accessCodeDataManager:v12 didRemoveHomeAccessCodes:v22 removedByUserUUID:v23];
}

- (void)handleUpdatedHomeAccessCodeModel:(id)a3 message:(id)a4
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v66 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling updated HMDHomeAccessCodeModel", buf, 0xCu);
  }
  v12 = [(HMDAccessCodeDataManager *)v9 context];
  int v13 = [v12 home];

  if (!v13)
  {
    v42 = (void *)MEMORY[0x230FBD990]();
    v43 = v9;
    v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v66 = v45;
      v46 = "%{public}@Not handling updated HomeAccessCodeModel because home reference was nil";
      goto LABEL_16;
    }
LABEL_17:

    id v17 = [MEMORY[0x263F087E8] hmfErrorWithCode:11];
    [v7 respondWithError:v17];
    goto LABEL_18;
  }
  uint64_t v14 = [v6 value];
  if (!v14
    || (v15 = (void *)v14,
        [v6 label],
        id v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        !v16))
  {
    v42 = (void *)MEMORY[0x230FBD990]();
    v43 = v9;
    v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v66 = v45;
      v46 = "%{public}@Home access code model has a nil property but should not";
LABEL_16:
      _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, v46, buf, 0xCu);

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  id v17 = [(HMDAccessCodeDataManager *)v9 delegate];
  BOOL v18 = [v13 labelsByAccessCode];
  __int16 v19 = [v6 value];
  __int16 v20 = [v18 objectForKeyedSubscript:v19];

  if (v20)
  {
    id v21 = [v13 labelsByAccessCode];
    uint64_t v22 = [v6 value];
    char v23 = [v21 objectForKeyedSubscript:v22];
    id v24 = [v6 label];
    char v25 = [v23 isEqualToString:v24];

    if ((v25 & 1) == 0)
    {
      v26 = (void *)MEMORY[0x230FBD990]();
      __int16 v27 = v9;
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v66 = v29;
        __int16 v67 = 2112;
        v68 = v13;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@HMDHomeAccessCodeModel label was updated on HMDHome: %@", buf, 0x16u);
      }
      long long v30 = [v6 label];
      v31 = [v13 labelsByAccessCode];
      v32 = [v6 value];
      [v31 setObject:v30 forKeyedSubscript:v32];

      __int16 v33 = [v6 hh2ModelID];
      v34 = [v13 labelIdentifiersByAccessCode];
      __int16 v35 = [v6 value];
      [v34 setObject:v33 forKeyedSubscript:v35];

      __int16 v36 = [v7 transactionResult];
      [v36 markChanged];

      v37 = (void *)MEMORY[0x263F0E398];
      uint64_t v38 = [v6 value];
      v39 = [v6 label];
      v40 = [v37 homeAccessCodeValueWithStringValue:v38 label:v39];
      v63 = v40;
      v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v63 count:1];
      [v17 accessCodeDataManager:v27 didUpdateHomeAccessCodes:v41 changedByUserUUID:0];
    }
    [v7 respondWithSuccess];
  }
  else
  {
    v47 = (void *)MEMORY[0x230FBD990]();
    v48 = v9;
    v49 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      v50 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v66 = v50;
      __int16 v67 = 2112;
      v68 = v13;
      _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_INFO, "%{public}@New HMDHomeAccessCodeModel was added. Setting label for value on HMDHome: %@", buf, 0x16u);
    }
    v51 = [v6 label];
    v52 = [v13 labelsByAccessCode];
    v53 = [v6 value];
    [v52 setObject:v51 forKeyedSubscript:v53];

    v54 = [v6 hh2ModelID];
    v55 = [v13 labelIdentifiersByAccessCode];
    v56 = [v6 value];
    [v55 setObject:v54 forKeyedSubscript:v56];

    v57 = [v7 transactionResult];
    [v57 markChanged];

    [v7 respondWithSuccess];
    v58 = (void *)MEMORY[0x263F0E398];
    __int16 v59 = [v6 value];
    v60 = [v6 label];
    uint64_t v61 = [v58 homeAccessCodeValueWithStringValue:v59 label:v60];
    v64 = v61;
    v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v64 count:1];
    [v17 accessCodeDataManager:v48 didAddHomeAccessCodes:v62 addedByUserUUID:0];
  }
LABEL_18:
}

- (void)handleUpdatedUserAccessCodeModel:(id)a3 forUser:(id)a4 message:(id)a5
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    v15 = [v8 changedByUserUUID];
    *(_DWORD *)buf = 138543874;
    v56 = v14;
    __int16 v57 = 2112;
    id v58 = v9;
    __int16 v59 = 2112;
    v60 = v15;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@HMDUserAccessCodeModel was updated. Updating value on HMDUser: %@ changedByUserUUID: %@", buf, 0x20u);
  }
  id v16 = [(HMDAccessCodeDataManager *)v12 delegate];
  id v17 = [v9 accessCode];
  BOOL v18 = [v8 value];
  int v19 = [v17 isEqualToString:v18];

  if (v19)
  {
    [v10 respondWithSuccess];
  }
  else
  {
    __int16 v20 = [v9 accessCode];

    if (v20)
    {
      id v21 = [v8 value];

      uint64_t v22 = (void *)MEMORY[0x230FBD990]();
      char v23 = v12;
      id v24 = HMFGetOSLogHandle();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
      if (v21)
      {
        if (v25)
        {
          v26 = HMFGetLogIdentifier();
          __int16 v27 = [v8 changedByUserUUID];
          *(_DWORD *)buf = 138543874;
          v56 = v26;
          __int16 v57 = 2112;
          id v58 = v9;
          __int16 v59 = 2112;
          v60 = v27;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@HMDUserAccessCodeModel value was updated on HMDUser: %@ changedByUserUUID: %@", buf, 0x20u);
        }
        id v28 = [v8 value];
        [v9 setAccessCode:v28];

        uint64_t v29 = [v8 changedByUserUUID];
        [v9 setAccessCodeChangedByUserUUID:v29];

        long long v30 = [v10 transactionResult];
        [v30 markChanged];

        [v10 respondWithSuccess];
        v31 = (void *)MEMORY[0x263F0E398];
        v32 = [v8 value];
        __int16 v33 = [v9 uuid];
        v34 = [v31 homeAccessCodeValueWithStringValue:v32 userUUID:v33];
        v53 = v34;
        __int16 v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v53 count:1];
        __int16 v36 = [v8 changedByUserUUID];
        [v16 accessCodeDataManager:v23 didUpdateHomeAccessCodes:v35 changedByUserUUID:v36];
      }
      else
      {
        if (v25)
        {
          v46 = HMFGetLogIdentifier();
          v47 = [v8 changedByUserUUID];
          *(_DWORD *)buf = 138543874;
          v56 = v46;
          __int16 v57 = 2112;
          id v58 = v9;
          __int16 v59 = 2112;
          v60 = v47;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@HMDUserAccessCodeModel value was removed on HMDUser: %@ removedByUserUUID: %@", buf, 0x20u);
        }
        v48 = [v8 value];
        [v9 setAccessCode:v48];

        v49 = [v8 changedByUserUUID];
        [v9 setAccessCodeChangedByUserUUID:v49];

        v50 = [v10 transactionResult];
        [v50 markChanged];

        [v10 respondWithSuccess];
        v51 = (void *)MEMORY[0x263F0E398];
        v32 = [v8 value];
        __int16 v33 = [v9 uuid];
        v34 = [v51 homeAccessCodeValueWithStringValue:v32 userUUID:v33];
        v52 = v34;
        __int16 v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v52 count:1];
        __int16 v36 = [v8 changedByUserUUID];
        [v16 accessCodeDataManager:v23 didRemoveHomeAccessCodes:v35 removedByUserUUID:v36];
      }
    }
    else
    {
      v37 = (void *)MEMORY[0x230FBD990]();
      uint64_t v38 = v12;
      v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = HMFGetLogIdentifier();
        v41 = [v8 changedByUserUUID];
        *(_DWORD *)buf = 138543874;
        v56 = v40;
        __int16 v57 = 2112;
        id v58 = v9;
        __int16 v59 = 2112;
        v60 = v41;
        _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@New HMDUserAccessCodeModel was added. Setting value on HMDUser: %@ changedByUserUUID: %@", buf, 0x20u);
      }
      v42 = [v8 value];
      [v9 setAccessCode:v42];

      v43 = [v8 changedByUserUUID];
      [v9 setAccessCodeChangedByUserUUID:v43];

      v44 = [v10 transactionResult];
      [v44 markChanged];

      [v10 respondWithSuccess];
      v45 = (void *)MEMORY[0x263F0E398];
      v32 = [v8 value];
      __int16 v33 = [v9 uuid];
      v34 = [v45 homeAccessCodeValueWithStringValue:v32 userUUID:v33];
      v54 = v34;
      __int16 v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
      __int16 v36 = [v8 changedByUserUUID];
      [v16 accessCodeDataManager:v38 didAddHomeAccessCodes:v35 addedByUserUUID:v36];
    }
  }
}

- (id)removeHMDRemovedUserAccessCodeModel:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDAccessCodeDataManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v36 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing HMDRemovedUserAccessCodeModel", buf, 0xCu);
  }
  id v11 = [(HMDAccessCodeDataManager *)v8 context];
  v12 = [v11 home];
  int v13 = [v12 backingStore];

  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x263F58190]);
    v15 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    id v16 = [v13 transaction:@"Remove HMDRemovedUserAccessCodeModel" options:v15];

    [v4 setObjectChangeType:3];
    [v16 add:v4];
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    v31 = __64__HMDAccessCodeDataManager_removeHMDRemovedUserAccessCodeModel___block_invoke;
    v32 = &unk_264A2F370;
    __int16 v33 = v8;
    id v34 = v14;
    id v17 = v14;
    [v16 run:&v29];
    BOOL v18 = (void *)MEMORY[0x263F581B8];
    int v19 = [(HMDAccessCodeDataManager *)v8 context];
    __int16 v20 = [v19 workQueue];
    id v21 = [v18 schedulerWithDispatchQueue:v20];
    uint64_t v22 = [v17 reschedule:v21];
  }
  else
  {
    char v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = v8;
    BOOL v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v36 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot remove HMDRemovedUserAccessCodeModel because self.context.home.backingStore is nil", buf, 0xCu);
    }
    __int16 v27 = (void *)MEMORY[0x263F58190];
    id v16 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    uint64_t v22 = [v27 futureWithError:v16];
  }

  return v22;
}

void __64__HMDAccessCodeDataManager_removeHMDRemovedUserAccessCodeModel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v12 = 138543618;
      int v13 = v8;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to run transaction to update model with error: %@", (uint8_t *)&v12, 0x16u);
    }
    id v9 = *(void **)(a1 + 40);
    id v10 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    [v9 finishWithError:v10];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      int v13 = v11;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully updated model", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

- (id)addOrUpdateHMDRemovedUserAccessCodeModel:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeDataManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v36 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Adding or updating HMDRemovedUserAccessCodeModel", buf, 0xCu);
  }
  id v11 = [(HMDAccessCodeDataManager *)v8 context];
  int v12 = [v11 home];
  int v13 = [v12 backingStore];

  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x263F58190]);
    id v15 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    uint64_t v16 = [v13 transaction:@"Update HMDRemovedUserAccessCodeModel" options:v15];

    [v16 add:v4];
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    v31 = __69__HMDAccessCodeDataManager_addOrUpdateHMDRemovedUserAccessCodeModel___block_invoke;
    v32 = &unk_264A2F370;
    __int16 v33 = v8;
    id v34 = v14;
    id v17 = v14;
    [v16 run:&v29];
    BOOL v18 = (void *)MEMORY[0x263F581B8];
    int v19 = [(HMDAccessCodeDataManager *)v8 context];
    __int16 v20 = [v19 workQueue];
    id v21 = [v18 schedulerWithDispatchQueue:v20];
    uint64_t v22 = [v17 reschedule:v21];
  }
  else
  {
    char v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = v8;
    BOOL v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v36 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot add or update HMDRemovedUserAccessCodeModel, because self.context.home.backingStore is nil", buf, 0xCu);
    }
    __int16 v27 = (void *)MEMORY[0x263F58190];
    uint64_t v16 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    uint64_t v22 = [v27 futureWithError:v16];
  }

  return v22;
}

void __69__HMDAccessCodeDataManager_addOrUpdateHMDRemovedUserAccessCodeModel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v12 = 138543618;
      int v13 = v8;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to run transaction to update model, with error: %@", (uint8_t *)&v12, 0x16u);
    }
    id v9 = *(void **)(a1 + 40);
    id v10 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    [v9 finishWithError:v10];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      int v13 = v11;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully updated model", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

- (id)removeHMDRemovedUserAccessCodeWithCode:(id)a3 removedUserInfo:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessCodeDataManager *)self context];
  id v9 = [v8 workQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = self;
  int v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    int v27 = 138543618;
    id v28 = v13;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing HMDRemovedUserAccessCode with HMRemovedUserInfo: %@", (uint8_t *)&v27, 0x16u);
  }
  __int16 v14 = [(HMDAccessCodeDataManager *)v11 context];
  id v15 = [v14 home];

  if (v15)
  {
    uint64_t v16 = [HMDRemovedUserAccessCodeModel alloc];
    id v17 = [v15 uuid];
    BOOL v18 = [(HMDRemovedUserAccessCodeModel *)v16 initWithRemovedUserInfo:v7 accessCode:v6 homeUUID:v17];

    uint64_t v19 = [(HMDAccessCodeDataManager *)v11 removeHMDRemovedUserAccessCodeModel:v18];
  }
  else
  {
    __int16 v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = v11;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      char v23 = HMFGetLogIdentifier();
      int v27 = 138543362;
      id v28 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Not removing HMDRemovedUserAccessCode because home reference was nil", (uint8_t *)&v27, 0xCu);
    }
    id v24 = (void *)MEMORY[0x263F58190];
    BOOL v18 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    uint64_t v19 = [v24 futureWithError:v18];
  }
  BOOL v25 = (void *)v19;

  return v25;
}

- (id)saveRemovedUserAccessCode:(id)a3 withRemovedUserInfo:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessCodeDataManager *)self context];
  id v9 = [v8 workQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = self;
  int v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    int v27 = 138543618;
    id v28 = v13;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Saving removed user access code with removed user info: %@", (uint8_t *)&v27, 0x16u);
  }
  __int16 v14 = [(HMDAccessCodeDataManager *)v11 context];
  id v15 = [v14 home];

  if (v15)
  {
    uint64_t v16 = [HMDRemovedUserAccessCodeModel alloc];
    id v17 = [v15 uuid];
    BOOL v18 = [(HMDRemovedUserAccessCodeModel *)v16 initWithRemovedUserInfo:v7 accessCode:v6 homeUUID:v17];

    uint64_t v19 = [(HMDAccessCodeDataManager *)v11 addOrUpdateHMDRemovedUserAccessCodeModel:v18];
  }
  else
  {
    __int16 v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = v11;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      char v23 = HMFGetLogIdentifier();
      int v27 = 138543362;
      id v28 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Not saving removed user access code because home reference was nil", (uint8_t *)&v27, 0xCu);
    }
    id v24 = (void *)MEMORY[0x263F58190];
    BOOL v18 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    uint64_t v19 = [v24 futureWithError:v18];
  }
  BOOL v25 = (void *)v19;

  return v25;
}

- (id)removeHomeAccessCodeModel:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeDataManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v36 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing HMDHomeAccessCodeModel", buf, 0xCu);
  }
  id v11 = [(HMDAccessCodeDataManager *)v8 context];
  int v12 = [v11 home];
  int v13 = [v12 backingStore];

  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x263F58190]);
    id v15 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    uint64_t v16 = [v13 transaction:@"Remove HMDHomeAccessCodeModel" options:v15];

    [v4 setObjectChangeType:3];
    [v16 add:v4];
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    uint64_t v31 = __54__HMDAccessCodeDataManager_removeHomeAccessCodeModel___block_invoke;
    v32 = &unk_264A2F370;
    __int16 v33 = v8;
    id v34 = v14;
    id v17 = v14;
    [v16 run:&v29];
    BOOL v18 = (void *)MEMORY[0x263F581B8];
    uint64_t v19 = [(HMDAccessCodeDataManager *)v8 context];
    __int16 v20 = [v19 workQueue];
    id v21 = [v18 schedulerWithDispatchQueue:v20];
    uint64_t v22 = [v17 reschedule:v21];
  }
  else
  {
    char v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = v8;
    BOOL v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v36 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot remove HMDHomeAccessCodeModel because self.context.home.backingStore is nil", buf, 0xCu);
    }
    int v27 = (void *)MEMORY[0x263F58190];
    uint64_t v16 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    uint64_t v22 = [v27 futureWithError:v16];
  }

  return v22;
}

void __54__HMDAccessCodeDataManager_removeHomeAccessCodeModel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v12 = 138543618;
      int v13 = v8;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to run transaction to update model with error: %@", (uint8_t *)&v12, 0x16u);
    }
    id v9 = *(void **)(a1 + 40);
    id v10 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    [v9 finishWithError:v10];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      int v13 = v11;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully updated model", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

- (id)addOrUpdateHomeAccessCodeModel:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeDataManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v36 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Adding or updating HMDHomeAccessCodeModel", buf, 0xCu);
  }
  id v11 = [(HMDAccessCodeDataManager *)v8 context];
  int v12 = [v11 home];
  int v13 = [v12 backingStore];

  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x263F58190]);
    id v15 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    uint64_t v16 = [v13 transaction:@"Update HMDHomeAccessCodeModel" options:v15];

    [v16 add:v4];
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    uint64_t v31 = __59__HMDAccessCodeDataManager_addOrUpdateHomeAccessCodeModel___block_invoke;
    v32 = &unk_264A2F370;
    __int16 v33 = v8;
    id v34 = v14;
    id v17 = v14;
    [v16 run:&v29];
    BOOL v18 = (void *)MEMORY[0x263F581B8];
    uint64_t v19 = [(HMDAccessCodeDataManager *)v8 context];
    __int16 v20 = [v19 workQueue];
    id v21 = [v18 schedulerWithDispatchQueue:v20];
    uint64_t v22 = [v17 reschedule:v21];
  }
  else
  {
    char v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = v8;
    BOOL v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v36 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot add or update HMDHomeAccessCodeModel, because self.context.home.backingStore is nil", buf, 0xCu);
    }
    int v27 = (void *)MEMORY[0x263F58190];
    uint64_t v16 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    uint64_t v22 = [v27 futureWithError:v16];
  }

  return v22;
}

void __59__HMDAccessCodeDataManager_addOrUpdateHomeAccessCodeModel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v12 = 138543618;
      int v13 = v8;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to run transaction to update model, with error: %@", (uint8_t *)&v12, 0x16u);
    }
    id v9 = *(void **)(a1 + 40);
    id v10 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    [v9 finishWithError:v10];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      int v13 = v11;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully updated model", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

- (id)removeUserAccessCodeModel:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeDataManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = [v4 changedByUserUUID];
    *(_DWORD *)buf = 138543618;
    uint64_t v37 = v10;
    __int16 v38 = 2112;
    v39 = v11;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing HMDUserAccessCodeModel, removedByUserUUID: %@", buf, 0x16u);
  }
  int v12 = [(HMDAccessCodeDataManager *)v8 context];
  int v13 = [v12 home];
  __int16 v14 = [v13 backingStore];

  if (v14)
  {
    id v15 = objc_alloc_init(MEMORY[0x263F58190]);
    uint64_t v16 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    id v17 = [v14 transaction:@"Remove HMDUserAccessCodeModel" options:v16];

    [v4 setObjectChangeType:3];
    [v17 add:v4];
    uint64_t v30 = MEMORY[0x263EF8330];
    uint64_t v31 = 3221225472;
    v32 = __54__HMDAccessCodeDataManager_removeUserAccessCodeModel___block_invoke;
    __int16 v33 = &unk_264A2F370;
    id v34 = v8;
    id v35 = v15;
    id v18 = v15;
    [v17 run:&v30];
    uint64_t v19 = (void *)MEMORY[0x263F581B8];
    __int16 v20 = [(HMDAccessCodeDataManager *)v8 context];
    id v21 = [v20 workQueue];
    uint64_t v22 = [v19 schedulerWithDispatchQueue:v21];
    char v23 = [v18 reschedule:v22];
  }
  else
  {
    id v24 = (void *)MEMORY[0x230FBD990]();
    BOOL v25 = v8;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v27;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Cannot remove HMDUserAccessCodeModel because self.context.home.backingStore is nil", buf, 0xCu);
    }
    id v28 = (void *)MEMORY[0x263F58190];
    id v17 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    char v23 = [v28 futureWithError:v17];
  }

  return v23;
}

void __54__HMDAccessCodeDataManager_removeUserAccessCodeModel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v12 = 138543618;
      int v13 = v8;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to run transaction to update model, error: %@", (uint8_t *)&v12, 0x16u);
    }
    id v9 = *(void **)(a1 + 40);
    id v10 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    [v9 finishWithError:v10];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      int v13 = v11;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully updated model", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

- (id)addOrUpdateUserAccessCodeModel:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeDataManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v36 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Adding or updating HMDUserAccessCodeModel", buf, 0xCu);
  }
  id v11 = [(HMDAccessCodeDataManager *)v8 context];
  int v12 = [v11 home];
  int v13 = [v12 backingStore];

  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x263F58190]);
    id v15 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    uint64_t v16 = [v13 transaction:@"Update HMDUserAccessCodeModel" options:v15];

    [v16 add:v4];
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    uint64_t v31 = __59__HMDAccessCodeDataManager_addOrUpdateUserAccessCodeModel___block_invoke;
    v32 = &unk_264A2F370;
    __int16 v33 = v8;
    id v34 = v14;
    id v17 = v14;
    [v16 run:&v29];
    id v18 = (void *)MEMORY[0x263F581B8];
    uint64_t v19 = [(HMDAccessCodeDataManager *)v8 context];
    __int16 v20 = [v19 workQueue];
    id v21 = [v18 schedulerWithDispatchQueue:v20];
    uint64_t v22 = [v17 reschedule:v21];
  }
  else
  {
    char v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = v8;
    BOOL v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v36 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot add or update HMDUserAccessCodeModel because self.context.home.backingStore is nil", buf, 0xCu);
    }
    int v27 = (void *)MEMORY[0x263F58190];
    uint64_t v16 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    uint64_t v22 = [v27 futureWithError:v16];
  }

  return v22;
}

void __59__HMDAccessCodeDataManager_addOrUpdateUserAccessCodeModel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v12 = 138543618;
      int v13 = v8;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to run transaction to update model with error: %@", (uint8_t *)&v12, 0x16u);
    }
    id v9 = *(void **)(a1 + 40);
    id v10 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    [v9 finishWithError:v10];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      int v13 = v11;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully updated model", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

- (NSSet)accessCodeValuesWithRemovedUserInfo
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessCodeDataManager *)self context];
  id v4 = [v3 home];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x263EFFA08];
    id v6 = [v4 removedUserInfoByAccessCode];
    id v7 = [v6 allKeys];
    id v8 = objc_msgSend(v7, "na_map:", &__block_literal_global_38_203218);
    id v9 = [v5 setWithArray:v8];
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot find access code values with removed user info because home reference was nil", (uint8_t *)&v15, 0xCu);
    }
    id v9 = [MEMORY[0x263EFFA08] set];
  }

  return (NSSet *)v9;
}

id __63__HMDAccessCodeDataManager_accessCodeValuesWithRemovedUserInfo__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F0DEF8];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithStringValue:v3];

  return v4;
}

- (NSSet)accessCodeValuesWithUserLabel
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessCodeDataManager *)self context];
  id v4 = [v3 home];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x263EFFA08];
    id v6 = [v4 users];
    id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_35_203223);
    id v8 = [v5 setWithArray:v7];
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = HMFGetLogIdentifier();
      int v14 = 138543362;
      int v15 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch user access code values with simple labels because home reference was nil", (uint8_t *)&v14, 0xCu);
    }
    id v8 = [MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
  }

  return (NSSet *)v8;
}

id __57__HMDAccessCodeDataManager_accessCodeValuesWithUserLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 accessCode];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F0DEF8]);
    id v5 = [v2 accessCode];
    id v3 = (void *)[v4 initWithStringValue:v5];
  }
  return v3;
}

- (id)userUUIDForAccessCode:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeDataManager *)self context];
  id v6 = [v5 home];

  if (v6)
  {
    id v7 = [v6 users];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __50__HMDAccessCodeDataManager_userUUIDForAccessCode___block_invoke;
    v15[3] = &unk_264A2DB60;
    id v16 = v4;
    id v8 = objc_msgSend(v7, "na_firstObjectPassingTest:", v15);
    id v9 = [v8 uuid];
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v18 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot find access code with simple label because home reference was nil", buf, 0xCu);
    }
    id v9 = 0;
  }

  return v9;
}

uint64_t __50__HMDAccessCodeDataManager_userUUIDForAccessCode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 accessCode];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)simpleLabelForAccessCode:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeDataManager *)self context];
  id v6 = [v5 home];

  if (v6)
  {
    id v7 = [v6 labelsByAccessCode];
    id v8 = [v7 objectForKeyedSubscript:v4];
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = HMFGetLogIdentifier();
      int v14 = 138543362;
      int v15 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot find access code with simple label because home reference was nil", (uint8_t *)&v14, 0xCu);
    }
    id v8 = 0;
  }

  return v8;
}

- (NSSet)accessCodeValuesWithSimpleLabel
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessCodeDataManager *)self context];
  id v4 = [v3 home];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x263EFFA08];
    id v6 = [v4 labelsByAccessCode];
    id v7 = [v6 allKeys];
    id v8 = objc_msgSend(v7, "na_map:", &__block_literal_global_32_203229);
    id v9 = [v5 setWithArray:v8];
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot find access code values with simple label because home reference was nil", (uint8_t *)&v15, 0xCu);
    }
    id v9 = [MEMORY[0x263EFFA08] set];
  }

  return (NSSet *)v9;
}

id __59__HMDAccessCodeDataManager_accessCodeValuesWithSimpleLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F0DEF8];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithStringValue:v3];

  return v4;
}

- (id)_removeHMDRemovedUserAccessCodeWithAccessCode:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeDataManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v28 = 138543362;
    uint64_t v29 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing HMDRemovedUserAccessCode with specified value", (uint8_t *)&v28, 0xCu);
  }
  id v11 = [(HMDAccessCodeDataManager *)v8 context];
  int v12 = [v11 home];

  if (!v12)
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    uint64_t v19 = v8;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      int v28 = 138543362;
      uint64_t v29 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Not Removing HMDRemovedUserAccessCode because home reference was nil", (uint8_t *)&v28, 0xCu);
    }
    uint64_t v22 = (void *)MEMORY[0x263F58190];
    int v15 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    uint64_t v17 = [v22 futureWithError:v15];
    goto LABEL_9;
  }
  int v13 = [v12 removedUserInfoByAccessCode];
  int v14 = [v13 objectForKeyedSubscript:v4];

  if (v14)
  {
    int v15 = [v12 removedUserInfoByAccessCode];
    uint64_t v16 = [v15 objectForKeyedSubscript:v4];
    uint64_t v17 = [(HMDAccessCodeDataManager *)v8 removeHMDRemovedUserAccessCodeWithCode:v4 removedUserInfo:v16];

LABEL_9:
    goto LABEL_13;
  }
  char v23 = (void *)MEMORY[0x230FBD990]();
  id v24 = v8;
  BOOL v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = HMFGetLogIdentifier();
    int v28 = 138543362;
    uint64_t v29 = v26;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Did not find HMDRemovedUserAccessCode with the specified value", (uint8_t *)&v28, 0xCu);
  }
  uint64_t v17 = [MEMORY[0x263F58190] futureWithNoResult];
LABEL_13:

  return v17;
}

- (void)removeHMDRemovedUserAccessCodeWithAccessCode:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessCodeDataManager *)self context];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__HMDAccessCodeDataManager_removeHMDRemovedUserAccessCodeWithAccessCode___block_invoke;
  v8[3] = &unk_264A2F820;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

id __73__HMDAccessCodeDataManager_removeHMDRemovedUserAccessCodeWithAccessCode___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) _removeHMDRemovedUserAccessCodeWithAccessCode:*(void *)(a1 + 40)];
}

- (void)_cleanUpOldRemovedUserData
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessCodeDataManager *)self context];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v18 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Cleaning up old removedUserInfo", buf, 0xCu);
  }
  id v9 = [(HMDAccessCodeDataManager *)v6 context];
  id v10 = [v9 home];

  if (v10)
  {
    id v11 = [v10 removedUserInfoByAccessCode];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __54__HMDAccessCodeDataManager__cleanUpOldRemovedUserData__block_invoke;
    v16[3] = &unk_264A266A0;
    void v16[4] = v6;
    objc_msgSend(v11, "na_each:", v16);
  }
  else
  {
    int v12 = (void *)MEMORY[0x230FBD990]();
    int v13 = v6;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v18 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Not cleaning up old removed user data because home reference was nil", buf, 0xCu);
    }
  }
}

void __54__HMDAccessCodeDataManager__cleanUpOldRemovedUserData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = [v5 dateRemoved];
  [v6 timeIntervalSinceNow];
  double v8 = -v7;

  id v9 = [*(id *)(a1 + 32) context];
  [v9 removedUserAccessCodeTimeToLive];
  double v11 = v10;

  if (v11 < v8) {
    id v12 = (id)[*(id *)(a1 + 32) removeHMDRemovedUserAccessCodeWithCode:v13 removedUserInfo:v5];
  }
}

- (id)_removeSimpleLabelAccessCodeValue:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeDataManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  double v7 = [(HMDAccessCodeDataManager *)self context];
  double v8 = [v7 home];

  if (v8)
  {
    id v9 = [v8 labelsByAccessCode];
    double v10 = [v4 stringValue];
    double v11 = [v9 objectForKeyedSubscript:v10];

    id v12 = [HMDHomeAccessCodeModel alloc];
    id v13 = [v8 uuid];
    int v14 = [v4 stringValue];
    int v15 = [(HMDHomeAccessCodeModel *)v12 initWithHomeUUID:v13 value:v14 label:v11];

    uint64_t v16 = [(HMDAccessCodeDataManager *)self removeHomeAccessCodeModel:v15];
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      int v23 = 138543362;
      id v24 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Not removing access code value because home reference was nil", (uint8_t *)&v23, 0xCu);
    }
    id v21 = (void *)MEMORY[0x263F58190];
    double v11 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    uint64_t v16 = [v21 futureWithError:v11];
  }

  return v16;
}

- (id)_setSimpleLabel:(id)a3 forAccessCodeValue:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(HMDAccessCodeDataManager *)self context];
  id v9 = [v8 workQueue];
  dispatch_assert_queue_V2(v9);

  double v10 = [(HMDAccessCodeDataManager *)self context];
  double v11 = [v10 home];

  if (v11)
  {
    id v12 = [HMDHomeAccessCodeModel alloc];
    id v13 = [v11 uuid];
    int v14 = [v7 stringValue];
    int v15 = [(HMDHomeAccessCodeModel *)v12 initWithHomeUUID:v13 value:v14 label:v6];

    uint64_t v16 = [(HMDAccessCodeDataManager *)self addOrUpdateHomeAccessCodeModel:v15];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __63__HMDAccessCodeDataManager__setSimpleLabel_forAccessCodeValue___block_invoke;
    v24[3] = &unk_264A2F3C0;
    v24[4] = self;
    id v25 = v7;
    uint64_t v17 = [v16 addSuccessBlock:v24];
  }
  else
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    uint64_t v19 = self;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v27 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Not setting simple label for access code value because home reference was nil", buf, 0xCu);
    }
    uint64_t v22 = (void *)MEMORY[0x263F58190];
    int v15 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    uint64_t v17 = [v22 futureWithError:v15];
  }

  return v17;
}

void __63__HMDAccessCodeDataManager__setSimpleLabel_forAccessCodeValue___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) stringValue];
  [v1 removeHMDRemovedUserAccessCodeWithAccessCode:v2];
}

- (void)_messageUser:(id)a3 thatTheirAccessCodeWasChangedWithType:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  double v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    double v10 = HMFGetLogIdentifier();
    double v11 = [v6 uuid];
    id v12 = [v11 UUIDString];
    *(_DWORD *)buf = 138543874;
    v26 = v10;
    __int16 v27 = 2112;
    uint64_t v28 = v12;
    __int16 v29 = 2048;
    unint64_t v30 = a4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Messaging user that their access code was changed. user: %@, changeType: %lu", buf, 0x20u);
  }
  id v13 = [HMDRemoteAccountMessageDestination alloc];
  int v14 = [(HMDAccessCodeDataManager *)v8 delegate];
  int v15 = [v14 messageTargetUUID];
  uint64_t v16 = [v6 accountHandle];
  uint64_t v17 = [(HMDRemoteAccountMessageDestination *)v13 initWithTarget:v15 handle:v16 multicast:1];

  id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a4, @"HMDAccessCodeManagerMessageKeyUserAccessCodeChangeType");
  id v24 = v18;
  uint64_t v19 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  __int16 v20 = +[HMDRemoteMessage secureMessageWithName:@"HMDAccessCodeManagerUserAccessCodeDidChangeMessage" qualityOfService:33 destination:v17 messagePayload:v19];

  id v21 = [(HMDAccessCodeDataManager *)v8 context];
  uint64_t v22 = [v21 messageDispatcher];
  [v22 sendMessage:v20];
}

- (id)_removeUserAccessCodeValue:(id)a3 removedByUserUUID:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(HMDAccessCodeDataManager *)self context];
  id v9 = [v8 workQueue];
  dispatch_assert_queue_V2(v9);

  double v10 = [(HMDAccessCodeDataManager *)self context];
  double v11 = [v10 home];

  if (v11)
  {
    id v12 = [v6 stringValue];
    id v13 = +[HMDAccessCodeDataManager userWithAccessCode:v12 inHome:v11];

    if (v13)
    {
      int v14 = [HMDUserAccessCodeModel alloc];
      int v15 = [v13 uuid];
      uint64_t v16 = [(HMDUserAccessCodeModel *)v14 initWithUserUUID:v15];

      uint64_t v17 = [(HMDAccessCodeDataManager *)self removeUserAccessCodeModel:v16];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __73__HMDAccessCodeDataManager__removeUserAccessCodeValue_removedByUserUUID___block_invoke;
      v30[3] = &unk_264A2F3C0;
      v30[4] = self;
      id v31 = v13;
      id v18 = [v17 addSuccessBlock:v30];
    }
    else
    {
      id v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = self;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        __int16 v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v33 = v27;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Not removing access code value because couldn't find any user with that access code.", buf, 0xCu);
      }
      uint64_t v28 = (void *)MEMORY[0x263F58190];
      uint64_t v16 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
      id v18 = [v28 futureWithError:v16];
    }
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x230FBD990]();
    __int16 v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v33 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Not removing access code value because home reference was nil", buf, 0xCu);
    }
    uint64_t v23 = (void *)MEMORY[0x263F58190];
    id v13 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    id v18 = [v23 futureWithError:v13];
  }

  return v18;
}

uint64_t __73__HMDAccessCodeDataManager__removeUserAccessCodeValue_removedByUserUUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _messageUser:*(void *)(a1 + 40) thatTheirAccessCodeWasChangedWithType:2];
}

- (id)_setUserWithUUID:(id)a3 forAccessCodeValue:(id)a4 changedByUserUUID:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(HMDAccessCodeDataManager *)self context];
  id v12 = [v11 workQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = [(HMDAccessCodeDataManager *)self context];
  int v14 = [v13 home];

  if (v14)
  {
    int v15 = [v14 users];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __82__HMDAccessCodeDataManager__setUserWithUUID_forAccessCodeValue_changedByUserUUID___block_invoke;
    v40[3] = &unk_264A2DB60;
    id v16 = v8;
    id v41 = v16;
    uint64_t v17 = objc_msgSend(v15, "na_firstObjectPassingTest:", v40);

    if (v17)
    {
      id v18 = [[HMDUserAccessCodeModel alloc] initWithUserUUID:v16];
      uint64_t v19 = [v9 stringValue];
      [(HMDUserAccessCodeModel *)v18 setValue:v19];

      [(HMDUserAccessCodeModel *)v18 setChangedByUserUUID:v10];
      __int16 v20 = [v17 accessCode];
      BOOL v21 = v20 != 0;

      uint64_t v22 = [(HMDAccessCodeDataManager *)self addOrUpdateUserAccessCodeModel:v18];
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __82__HMDAccessCodeDataManager__setUserWithUUID_forAccessCodeValue_changedByUserUUID___block_invoke_21;
      v36[3] = &unk_264A26678;
      BOOL v39 = v21;
      v36[4] = self;
      id v37 = v17;
      id v38 = v9;
      uint64_t v23 = [v22 addSuccessBlock:v36];
    }
    else
    {
      unint64_t v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = self;
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        __int16 v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v43 = v33;
        __int16 v44 = 2112;
        id v45 = v16;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Not setting user UUID: %@, for access code value because we could not find a user with that UUID.", buf, 0x16u);
      }
      uint64_t v34 = (void *)MEMORY[0x263F58190];
      id v18 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
      uint64_t v23 = [v34 futureWithError:v18];
    }

    __int16 v29 = v41;
  }
  else
  {
    id v24 = (void *)MEMORY[0x230FBD990]();
    id v25 = self;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v43 = v27;
      __int16 v44 = 2112;
      id v45 = v8;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Not setting user UUID: %@, for access code value because home reference was nil", buf, 0x16u);
    }
    uint64_t v28 = (void *)MEMORY[0x263F58190];
    __int16 v29 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    uint64_t v23 = [v28 futureWithError:v29];
  }

  return v23;
}

uint64_t __82__HMDAccessCodeDataManager__setUserWithUUID_forAccessCodeValue_changedByUserUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

void __82__HMDAccessCodeDataManager__setUserWithUUID_forAccessCodeValue_changedByUserUUID___block_invoke_21(uint64_t a1)
{
  [*(id *)(a1 + 32) _messageUser:*(void *)(a1 + 40) thatTheirAccessCodeWasChangedWithType:*(unsigned __int8 *)(a1 + 56)];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 48) stringValue];
  [v2 removeHMDRemovedUserAccessCodeWithAccessCode:v3];
}

- (void)_setUpAndStartTimer
{
  id v3 = [(HMDAccessCodeDataManager *)self context];
  uint64_t v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(HMDAccessCodeDataManager *)self dataCleanUpTimerFactory];
  id v6 = [(HMDAccessCodeDataManager *)self context];
  [v6 dataCleanUpCheckTimerInterval];
  id v7 = v5[2](v5, 4);
  [(HMDAccessCodeDataManager *)self setDataCleanUpTimer:v7];

  id v8 = [(HMDAccessCodeDataManager *)self dataCleanUpTimer];
  [v8 setDelegate:self];

  id v9 = [(HMDAccessCodeDataManager *)self context];
  id v10 = [v9 workQueue];
  double v11 = [(HMDAccessCodeDataManager *)self dataCleanUpTimer];
  [v11 setDelegateQueue:v10];

  id v12 = [(HMDAccessCodeDataManager *)self dataCleanUpTimer];
  [v12 resume];
}

- (id)removeAllHomeAccessCodes
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessCodeDataManager *)self context];
  uint64_t v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(HMDAccessCodeDataManager *)self homeAccessCodeValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) accessCodeValue];
        id v12 = [(HMDAccessCodeDataManager *)self removeHomeAccessCodeWithValue:v11 removedByUserUUID:0];
        [v5 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v13 = [MEMORY[0x263F58190] chainFutures:v5];

  return v13;
}

- (id)updateUserInformation:(id)a3 forHomeAccessCodeWithOldValue:(id)a4 newAccessCodeValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [v8 userUUID];

  if (v11)
  {
    id v12 = [(HMDAccessCodeDataManager *)self setUserInformation:v8 forHomeAccessCodeWithValue:v10 changedByUserUUID:0];
  }
  else
  {
    id v13 = [v8 simpleLabel];

    if (v13)
    {
      int v14 = [(HMDAccessCodeDataManager *)self removeHomeAccessCodeWithValue:v9 removedByUserUUID:0];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __99__HMDAccessCodeDataManager_updateUserInformation_forHomeAccessCodeWithOldValue_newAccessCodeValue___block_invoke;
      v17[3] = &unk_264A26650;
      v17[4] = self;
      id v18 = v8;
      id v19 = v10;
      id v12 = [v14 flatMap:v17];
    }
    else
    {
      long long v15 = (void *)MEMORY[0x263F58190];
      int v14 = [MEMORY[0x263F087E8] hmfErrorWithCode:3];
      id v12 = [v15 futureWithError:v14];
    }
  }
  return v12;
}

uint64_t __99__HMDAccessCodeDataManager_updateUserInformation_forHomeAccessCodeWithOldValue_newAccessCodeValue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUserInformation:*(void *)(a1 + 40) forHomeAccessCodeWithValue:*(void *)(a1 + 48) changedByUserUUID:0];
}

- (id)removeHomeAccessCodeWithValue:(id)a3 removedByUserUUID:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessCodeDataManager *)self context];
  id v9 = [v8 workQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)MEMORY[0x230FBD990]();
  double v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    int v30 = 138543618;
    id v31 = v13;
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing home access code, removedByUserUUID: %@", (uint8_t *)&v30, 0x16u);
  }
  int v14 = [(HMDAccessCodeDataManager *)v11 accessCodeValuesWithSimpleLabel];
  int v15 = [v14 containsObject:v6];

  if (v15)
  {
    uint64_t v16 = [(HMDAccessCodeDataManager *)v11 _removeSimpleLabelAccessCodeValue:v6];
LABEL_7:
    id v19 = (void *)v16;
    goto LABEL_14;
  }
  long long v17 = [(HMDAccessCodeDataManager *)v11 accessCodeValuesWithUserLabel];
  int v18 = [v17 containsObject:v6];

  if (v18)
  {
    uint64_t v16 = [(HMDAccessCodeDataManager *)v11 _removeUserAccessCodeValue:v6 removedByUserUUID:v7];
    goto LABEL_7;
  }
  uint64_t v20 = [(HMDAccessCodeDataManager *)v11 accessCodeValuesWithRemovedUserInfo];
  int v21 = [v20 containsObject:v6];

  if (v21)
  {
    uint64_t v22 = [v6 stringValue];
    uint64_t v23 = [(HMDAccessCodeDataManager *)v11 _removeHMDRemovedUserAccessCodeWithAccessCode:v22];
  }
  else
  {
    id v24 = (void *)MEMORY[0x230FBD990]();
    id v25 = v11;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = HMFGetLogIdentifier();
      int v30 = 138543362;
      id v31 = v27;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Did not find home access code", (uint8_t *)&v30, 0xCu);
    }
    uint64_t v28 = (void *)MEMORY[0x263F58190];
    uint64_t v22 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    uint64_t v23 = [v28 futureWithError:v22];
  }
  id v19 = (void *)v23;

LABEL_14:
  return v19;
}

- (id)setUserInformation:(id)a3 forHomeAccessCodeWithValue:(id)a4 changedByUserUUID:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(HMDAccessCodeDataManager *)self context];
  id v12 = [v11 workQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = (void *)MEMORY[0x230FBD990]();
  int v14 = self;
  int v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = HMFGetLogIdentifier();
    int v28 = 138543618;
    __int16 v29 = v16;
    __int16 v30 = 2112;
    id v31 = v8;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Setting user information: %@, for access code value", (uint8_t *)&v28, 0x16u);
  }
  long long v17 = [v8 simpleLabel];

  if (v17)
  {
    int v18 = [v8 simpleLabel];
    uint64_t v19 = [(HMDAccessCodeDataManager *)v14 _setSimpleLabel:v18 forAccessCodeValue:v9];
  }
  else
  {
    uint64_t v20 = [v8 userUUID];

    if (v20)
    {
      int v18 = [v8 userUUID];
      uint64_t v19 = [(HMDAccessCodeDataManager *)v14 _setUserWithUUID:v18 forAccessCodeValue:v9 changedByUserUUID:v10];
    }
    else
    {
      int v21 = (void *)MEMORY[0x230FBD990]();
      uint64_t v22 = v14;
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = HMFGetLogIdentifier();
        int v28 = 138543618;
        __int16 v29 = v24;
        __int16 v30 = 2112;
        id v31 = v8;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Not setting user information for access code value because empty user information was provided: %@", (uint8_t *)&v28, 0x16u);
      }
      id v25 = (void *)MEMORY[0x263F58190];
      int v18 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
      uint64_t v19 = [v25 futureWithError:v18];
    }
  }
  v26 = (void *)v19;

  return v26;
}

- (id)homeAccessCodeWithRemovedUserInfoWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessCodeDataManager *)self homeAccessCodeValuesWithRemovedUserInfo];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__HMDAccessCodeDataManager_homeAccessCodeWithRemovedUserInfoWithUUID___block_invoke;
  v9[3] = &unk_264A26628;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __70__HMDAccessCodeDataManager_homeAccessCodeWithRemovedUserInfoWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 userInformationValue];
  id v3 = [v2 removedUserInfo];
  id v4 = [v3 userUUID];
  uint64_t v5 = HMFEqualObjects();

  return v5;
}

- (NSArray)homeAccessCodeValuesWithRemovedUserInfo
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessCodeDataManager *)self context];
  id v4 = [v3 home];

  if (v4)
  {
    uint64_t v5 = [v4 removedUserInfoByAccessCode];

    if (v5)
    {
      id v6 = [v4 removedUserInfoByAccessCode];
      id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_14_203258);

      goto LABEL_10;
    }
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      double v11 = HMFGetLogIdentifier();
      int v14 = 138543362;
      int v15 = v11;
      id v12 = "%{public}@Home has a nil removedUserInfoByAccessCode but should not";
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      double v11 = HMFGetLogIdentifier();
      int v14 = 138543362;
      int v15 = v11;
      id v12 = "%{public}@Cannot fetch user access code values with simple labels because home reference was nil";
LABEL_8:
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v14, 0xCu);
    }
  }

  id v7 = (void *)MEMORY[0x263EFFA68];
LABEL_10:

  return (NSArray *)v7;
}

uint64_t __67__HMDAccessCodeDataManager_homeAccessCodeValuesWithRemovedUserInfo__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [MEMORY[0x263F0E398] homeAccessCodeValueWithStringValue:a2 removedUserInfo:a3];
}

- (NSArray)homeAccessCodeValuesWithUserLabels
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessCodeDataManager *)self context];
  id v4 = [v3 home];

  if (v4)
  {
    uint64_t v5 = [v4 users];
    id v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_11_203262);
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch user access code values with simple labels because home reference was nil", (uint8_t *)&v12, 0xCu);
    }
    id v6 = (void *)MEMORY[0x263EFFA68];
  }

  return (NSArray *)v6;
}

id __62__HMDAccessCodeDataManager_homeAccessCodeValuesWithUserLabels__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 accessCode];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F0DEF0]);
    uint64_t v5 = [v2 uuid];
    id v6 = (void *)[v4 initWithSimpleLabel:0 labelIdentifier:0 userUUID:v5 removedUserInfo:0];

    id v7 = objc_alloc(MEMORY[0x263F0DEF8]);
    id v8 = [v2 accessCode];
    id v9 = (void *)[v7 initWithStringValue:v8];

    id v3 = (void *)[objc_alloc(MEMORY[0x263F0E398]) initWithAccessCodeValue:v9 userInformationValue:v6];
  }

  return v3;
}

- (NSArray)homeAccessCodeValuesWithSimpleLabels
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessCodeDataManager *)self context];
  id v4 = [v3 home];

  if (v4)
  {
    uint64_t v5 = [v4 labelsByAccessCode];

    if (v5)
    {
      id v6 = [v4 labelsByAccessCode];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __64__HMDAccessCodeDataManager_homeAccessCodeValuesWithSimpleLabels__block_invoke;
      v13[3] = &unk_264A265C0;
      id v14 = v4;
      id v7 = objc_msgSend(v6, "na_map:", v13);

      goto LABEL_8;
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      double v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch home access code values with simple labels because home reference was nil", buf, 0xCu);
    }
  }
  id v7 = (void *)MEMORY[0x263EFFA68];
LABEL_8:

  return (NSArray *)v7;
}

id __64__HMDAccessCodeDataManager_homeAccessCodeValuesWithSimpleLabels__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 labelIdentifiersByAccessCode];
  id v8 = [v7 objectForKeyedSubscript:v6];
  id v9 = spiClientIdentifierForUUID(v8);

  id v10 = (void *)[objc_alloc(MEMORY[0x263F0DEF0]) initWithSimpleLabel:v5 labelIdentifier:v9 userUUID:0 removedUserInfo:0];
  double v11 = (void *)[objc_alloc(MEMORY[0x263F0DEF8]) initWithStringValue:v6];

  int v12 = (void *)[objc_alloc(MEMORY[0x263F0E398]) initWithAccessCodeValue:v11 userInformationValue:v10];
  return v12;
}

- (NSArray)homeAccessCodeValues
{
  id v3 = [(HMDAccessCodeDataManager *)self homeAccessCodeValuesWithSimpleLabels];
  id v4 = [(HMDAccessCodeDataManager *)self homeAccessCodeValuesWithUserLabels];
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];
  id v6 = [(HMDAccessCodeDataManager *)self homeAccessCodeValuesWithRemovedUserInfo];
  id v7 = [v5 arrayByAddingObjectsFromArray:v6];

  return (NSArray *)v7;
}

- (void)configure
{
  id v3 = [(HMDAccessCodeDataManager *)self context];
  int v4 = [v3 isCurrentDeviceOwnerController];

  if (v4)
  {
    [(HMDAccessCodeDataManager *)self _setUpAndStartTimer];
    [(HMDAccessCodeDataManager *)self _cleanUpOldRemovedUserData];
  }
}

- (HMDAccessCodeDataManager)initWithContext:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDAccessCodeDataManager;
  id v9 = [(HMDAccessCodeDataManager *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    id dataCleanUpTimerFactory = v10->_dataCleanUpTimerFactory;
    v10->_id dataCleanUpTimerFactory = &__block_literal_global_203270;
  }
  return v10;
}

id __53__HMDAccessCodeDataManager_initWithContext_delegate___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:a3 options:a1];
  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t87 != -1) {
    dispatch_once(&logCategory__hmf_once_t87, &__block_literal_global_76);
  }
  id v2 = (void *)logCategory__hmf_once_v88;
  return v2;
}

void __39__HMDAccessCodeDataManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v88;
  logCategory__hmf_once_v88 = v0;
}

+ (id)_accessCodeInHome:(id)a3 forRemovedUserAccessCodeModel:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 removedUserInfoByAccessCode];
  id v8 = [v7 allKeys];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __76__HMDAccessCodeDataManager__accessCodeInHome_forRemovedUserAccessCodeModel___block_invoke;
  v13[3] = &unk_264A26728;
  id v14 = v6;
  id v15 = v5;
  id v9 = v5;
  id v10 = v6;
  double v11 = objc_msgSend(v8, "na_firstObjectPassingTest:", v13);

  return v11;
}

uint64_t __76__HMDAccessCodeDataManager__accessCodeInHome_forRemovedUserAccessCodeModel___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 uuid];
  id v6 = [*(id *)(a1 + 40) uuid];
  id v7 = [*(id *)(a1 + 40) removedUserInfoByAccessCode];
  id v8 = [v7 objectForKeyedSubscript:v4];
  id v9 = +[HMDRemovedUserAccessCodeModel modelUUIDForHomeUUID:v6 removedUserInfo:v8 accessCode:v4];

  uint64_t v10 = HMFEqualObjects();
  return v10;
}

+ (id)_accessCodeInHome:(id)a3 forHomeAccessCodeModel:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 labelsByAccessCode];
  id v8 = [v7 allKeys];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__HMDAccessCodeDataManager__accessCodeInHome_forHomeAccessCodeModel___block_invoke;
  v13[3] = &unk_264A26728;
  id v14 = v6;
  id v15 = v5;
  id v9 = v5;
  id v10 = v6;
  double v11 = objc_msgSend(v8, "na_firstObjectPassingTest:", v13);

  return v11;
}

uint64_t __69__HMDAccessCodeDataManager__accessCodeInHome_forHomeAccessCodeModel___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 uuid];
  id v6 = [*(id *)(a1 + 40) uuid];
  id v7 = +[HMDHomeAccessCodeModel modelUUIDForHomeUUID:v6 accessCodeValue:v4];

  uint64_t v8 = HMFEqualObjects();
  return v8;
}

+ (id)userWithAccessCode:(id)a3 inHome:(id)a4
{
  id v5 = a3;
  id v6 = [a4 users];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__HMDAccessCodeDataManager_userWithAccessCode_inHome___block_invoke;
  v10[3] = &unk_264A2DB60;
  id v11 = v5;
  id v7 = v5;
  uint64_t v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __54__HMDAccessCodeDataManager_userWithAccessCode_inHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 accessCode];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

+ (id)createUserAccessCodeModelFromAccessCode:(id)a3 forUserUUID:(id)a4 changedByUserUUID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[HMDUserAccessCodeModel alloc] initWithUserUUID:v8];

  [(HMDUserAccessCodeModel *)v10 setValue:v9];
  [(HMDUserAccessCodeModel *)v10 setChangedByUserUUID:v7];

  return v10;
}

+ (id)createRemovedUserInfoModelsFromRemovedUserInfoByAccessCode:(id)a3 forHome:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 allKeys];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __95__HMDAccessCodeDataManager_createRemovedUserInfoModelsFromRemovedUserInfoByAccessCode_forHome___block_invoke;
  v12[3] = &unk_264A26598;
  id v13 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  id v10 = objc_msgSend(v7, "na_map:", v12);

  return v10;
}

HMDRemovedUserAccessCodeModel *__95__HMDAccessCodeDataManager_createRemovedUserInfoModelsFromRemovedUserInfoByAccessCode_forHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [HMDRemovedUserAccessCodeModel alloc];
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  id v6 = [*(id *)(a1 + 40) uuid];
  id v7 = [(HMDRemovedUserAccessCodeModel *)v4 initWithRemovedUserInfo:v5 accessCode:v3 homeUUID:v6];

  return v7;
}

+ (id)createHomeAccessCodeModelsFromLabelsByAccessCode:(id)a3 forHome:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 allKeys];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __85__HMDAccessCodeDataManager_createHomeAccessCodeModelsFromLabelsByAccessCode_forHome___block_invoke;
  v12[3] = &unk_264A26598;
  id v13 = v6;
  id v14 = v5;
  id v8 = v5;
  id v9 = v6;
  id v10 = objc_msgSend(v7, "na_map:", v12);

  return v10;
}

HMDHomeAccessCodeModel *__85__HMDAccessCodeDataManager_createHomeAccessCodeModelsFromLabelsByAccessCode_forHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [HMDHomeAccessCodeModel alloc];
  id v5 = [*(id *)(a1 + 32) uuid];
  id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
  id v7 = [(HMDHomeAccessCodeModel *)v4 initWithHomeUUID:v5 value:v3 label:v6];

  return v7;
}

@end