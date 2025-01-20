@interface HMDHomePersonDataManager
+ (id)logCategory;
- (HMDHome)home;
- (HMDHomePersonDataManager)initWithHome:(id)a3 workQueue:(id)a4;
- (HMDHomePersonManager)personManager;
- (NSUUID)homeUUID;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (id)personManagerFactory;
- (id)updateSettingsModelWithSettings:(id)a3;
- (void)configure;
- (void)configurePersonManagerWithZoneUUID:(id)a3;
- (void)handleUpdateSettingsMessage:(id)a3;
- (void)handleUpdatedSettingsModel:(id)a3 previousSettingsModel:(id)a4 message:(id)a5;
- (void)removeCloudDataDueToHomeGraphObjectRemoval:(BOOL)a3;
- (void)removeCloudDataDueToHomeRemoval;
- (void)setHome:(id)a3;
- (void)setPersonManager:(id)a3;
- (void)setPersonManagerFactory:(id)a3;
@end

@implementation HMDHomePersonDataManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_personManagerFactory, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_personManager, 0);
}

- (void)setPersonManagerFactory:(id)a3
{
}

- (id)personManagerFactory
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPersonManager:(id)a3
{
}

- (HMDHomePersonManager)personManager
{
  return (HMDHomePersonManager *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDHomePersonDataManager *)self homeUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)handleUpdateSettingsMessage:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDHomePersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    v36 = v9;
    __int16 v37 = 2112;
    v38 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling update person manager settings message payload: %@", buf, 0x16u);
  }
  v11 = [(HMDHomePersonDataManager *)v7 home];
  if (v11)
  {
    uint64_t v12 = *MEMORY[0x1E4F2D638];
    uint64_t v34 = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    v14 = [v4 unarchivedObjectForKey:v12 ofClasses:v13];

    if (v14)
    {
      v15 = [(HMDHomePersonDataManager *)v7 updateSettingsModelWithSettings:v14];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __56__HMDHomePersonDataManager_handleUpdateSettingsMessage___block_invoke;
      v31[3] = &unk_1E6A19730;
      id v32 = v11;
      id v16 = v4;
      id v33 = v16;
      v17 = [v15 addSuccessBlock:v31];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __56__HMDHomePersonDataManager_handleUpdateSettingsMessage___block_invoke_2;
      v29[3] = &unk_1E6A197F0;
      id v30 = v16;
      id v18 = (id)[v17 addFailureBlock:v29];

      v19 = v32;
    }
    else
    {
      v24 = (void *)MEMORY[0x1D9452090]();
      v25 = v7;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = HMFGetLogIdentifier();
        v28 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        v36 = v27;
        __int16 v37 = 2112;
        v38 = v28;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Could not find person manager settings in message payload: %@", buf, 0x16u);
      }
      v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      [v4 respondWithError:v19];
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1D9452090]();
    v21 = v7;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v36 = v23;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference is nil", buf, 0xCu);
    }
    v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v4 respondWithError:v14];
  }
}

void __56__HMDHomePersonDataManager_handleUpdateSettingsMessage___block_invoke(uint64_t a1)
{
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v2 = [*(id *)(a1 + 32) personManagerSettings];
  v3 = encodeRootObjectForIncomingXPCMessage(v2, 0);
  [v8 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F2D638]];

  id v4 = [*(id *)(a1 + 32) personManagerZoneUUID];
  v5 = [v4 UUIDString];
  [v8 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F2D650]];

  v6 = *(void **)(a1 + 40);
  v7 = (void *)[v8 copy];
  [v6 respondWithPayload:v7];
}

uint64_t __56__HMDHomePersonDataManager_handleUpdateSettingsMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithError:a2];
}

- (void)removeCloudDataDueToHomeGraphObjectRemoval:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = [(HMDHomePersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDHomePersonDataManager *)self personManager];

  if (v6)
  {
    v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v18 = 138543362;
      v19 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing home person cloud data", (uint8_t *)&v18, 0xCu);
    }
    v11 = [(HMDHomePersonDataManager *)v8 personManager];
    id v12 = objc_alloc_init(MEMORY[0x1E4F2E838]);
    [v11 handleUpdatedSettings:v12];

    v13 = [(HMDHomePersonDataManager *)v8 personManager];
    id v14 = (id)[v13 removeAllAssociatedDataDueToHomeGraphObjectRemoval:v3];

    [(HMDHomePersonDataManager *)v8 setPersonManager:0];
    v15 = [(HMDHomePersonDataManager *)v8 home];
    id v16 = [v15 currentUser];
    v17 = [v16 personSettingsManager];
    [v17 remove];
  }
}

- (void)configurePersonManagerWithZoneUUID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDHomePersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDHomePersonDataManager *)self home];
  if (v6)
  {
    v7 = [(HMDHomePersonDataManager *)self personManagerFactory];
    id v8 = [(HMDHomePersonDataManager *)self workQueue];
    v9 = ((void (**)(void, void *, id, void *))v7)[2](v7, v6, v4, v8);
    [(HMDHomePersonDataManager *)self setPersonManager:v9];

    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      id v14 = [(HMDHomePersonDataManager *)v11 personManager];
      int v20 = 138543618;
      v21 = v13;
      __int16 v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Configuring home person manager: %@", (uint8_t *)&v20, 0x16u);
    }
    v15 = [(HMDHomePersonDataManager *)v11 personManager];
    [v15 configureWithHome:v6];
  }
  else
  {
    id v16 = (void *)MEMORY[0x1D9452090]();
    v17 = self;
    int v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = HMFGetLogIdentifier();
      int v20 = 138543362;
      v21 = v19;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference is nil", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (void)handleUpdatedSettingsModel:(id)a3 previousSettingsModel:(id)a4 message:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 copy];
  id v12 = (void *)v11;
  if (v11) {
    v13 = (void *)v11;
  }
  else {
    v13 = v8;
  }
  id v14 = v13;

  v15 = (void *)MEMORY[0x1D9452090]((id)[v14 merge:v8]);
  id v16 = self;
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v18 = HMFGetLogIdentifier();
    v19 = [v14 debugString:1];
    *(_DWORD *)buf = 138543618;
    v59 = v18;
    __int16 v60 = 2112;
    v61 = v19;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Handling updated home person manager settings model: %@", buf, 0x16u);
  }
  int v20 = [(HMDHomePersonDataManager *)v16 home];
  if (v20)
  {
    if ([v14 propertyWasSet:@"zoneUUIDString"])
    {
      uint64_t v21 = [v14 createSettings];
      __int16 v22 = [v20 personManagerSettings];
      v50 = (void *)v21;
      int v23 = [v22 isEqual:v21];

      if ((v23 & 1) == 0)
      {
        uint64_t v24 = (void *)MEMORY[0x1D9452090]();
        v25 = v16;
        v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = id v46 = v10;
          [v20 personManagerSettings];
          v28 = v48 = v24;
          *(_DWORD *)buf = 138543874;
          v59 = v27;
          __int16 v60 = 2112;
          v61 = v28;
          __int16 v62 = 2112;
          v63 = v50;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Updating home person manager settings from %@ to %@", buf, 0x20u);

          uint64_t v24 = v48;
          id v10 = v46;
        }

        [v20 setPersonManagerSettings:v50];
      }
      v29 = [v14 zoneUUID];
      v49 = [v20 personManagerZoneUUID];
      id v30 = [v20 personManagerZoneUUID];
      char v31 = HMFEqualObjects();

      if (v31)
      {
        if (v23)
        {
          [v10 respondWithSuccess];
          id v33 = v49;
          id v32 = v50;
LABEL_23:

          goto LABEL_24;
        }
      }
      else
      {
        v38 = (void *)MEMORY[0x1D9452090]();
        uint64_t v39 = v16;
        v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v41 = id v45 = v9;
          [v20 personManagerZoneUUID];
          v42 = v47 = v38;
          *(_DWORD *)buf = 138543874;
          v59 = v41;
          __int16 v60 = 2112;
          v61 = v42;
          __int16 v62 = 2112;
          v63 = v29;
          _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_INFO, "%{public}@Updating home person manager zone UUID from %@ to %@", buf, 0x20u);

          v38 = v47;
          id v9 = v45;
        }

        [v20 setPersonManagerZoneUUID:v29];
      }
      v43 = [v10 transactionResult];
      [v43 markChanged];

      v44 = [(HMDHomePersonDataManager *)v16 workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __85__HMDHomePersonDataManager_handleUpdatedSettingsModel_previousSettingsModel_message___block_invoke;
      block[3] = &unk_1E6A11380;
      id v52 = v29;
      id v33 = v49;
      id v53 = v49;
      v54 = v16;
      id v55 = v20;
      id v32 = v50;
      id v56 = v50;
      id v57 = v10;
      dispatch_async(v44, block);

      goto LABEL_23;
    }
    [v10 respondWithSuccess];
  }
  else
  {
    uint64_t v34 = (void *)MEMORY[0x1D9452090]();
    v35 = v16;
    v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v37 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v59 = v37;
      _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference is nil", buf, 0xCu);
    }
  }
LABEL_24:
}

uint64_t __85__HMDHomePersonDataManager_handleUpdatedSettingsModel_previousSettingsModel_message___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
LABEL_4:
    if (*(void *)(a1 + 40))
    {
      v2 = (void *)MEMORY[0x1D9452090]();
      id v3 = *(id *)(a1 + 48);
      id v4 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = HMFGetLogIdentifier();
        int v14 = 138543362;
        v15 = v5;
        _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Home person manager zone UUID is now nil. Removing home person manager", (uint8_t *)&v14, 0xCu);
      }
      [*(id *)(a1 + 48) removeCloudDataDueToHomeGraphObjectRemoval:0];
      return [*(id *)(a1 + 72) respondWithSuccess];
    }
LABEL_8:
    v6 = [*(id *)(a1 + 48) personManager];
    [v6 handleUpdatedSettings:*(void *)(a1 + 64)];

    return [*(id *)(a1 + 72) respondWithSuccess];
  }
  if (HMFEqualObjects())
  {
    if (*(void *)(a1 + 32)) {
      goto LABEL_8;
    }
    goto LABEL_4;
  }
  v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 48);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = [*(id *)(a1 + 56) personManagerZoneUUID];
    int v14 = 138543874;
    v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Home person manager zone UUID changed from %@ to %@. Configuring home person manager", (uint8_t *)&v14, 0x20u);
  }
  [*(id *)(a1 + 48) removeCloudDataDueToHomeGraphObjectRemoval:0];
  [*(id *)(a1 + 48) configurePersonManagerWithZoneUUID:*(void *)(a1 + 32)];
  return [*(id *)(a1 + 72) respondWithSuccess];
}

- (id)updateSettingsModelWithSettings:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(HMDHomePersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v46 = v10;
    __int16 v47 = 2112;
    id v48 = v5;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating home person manager settings: %@", buf, 0x16u);
  }
  uint64_t v11 = [(HMDHomePersonDataManager *)v8 home];
  id v12 = v11;
  if (v11)
  {
    v13 = [v11 uuid];
    int v14 = +[HMDHomePersonManagerSettingsModel defaultModelForHomeUUID:v13];

    if ([v5 isFaceClassificationEnabled]
      && ([v12 personManagerZoneUUID],
          v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          !v15))
    {
      v27 = [MEMORY[0x1E4F29128] UUID];
      [v14 setZoneUUID:v27];

      v28 = (void *)MEMORY[0x1D9452090]();
      v29 = v8;
      id v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        char v31 = HMFGetLogIdentifier();
        id v32 = [v14 zoneUUID];
        *(_DWORD *)buf = 138543618;
        id v46 = v31;
        __int16 v47 = 2112;
        id v48 = v32;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Face Classification is now enabled. Updating settings with new home person manager zone UUID: %@", buf, 0x16u);
      }
    }
    else if (([v5 isFaceClassificationEnabled] & 1) == 0)
    {
      __int16 v16 = [v12 personManagerZoneUUID];

      if (v16)
      {
        uint64_t v17 = (void *)MEMORY[0x1D9452090]();
        __int16 v18 = v8;
        v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v46 = v20;
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Face Classification is now disabled. Updating settings to remove zone UUID", buf, 0xCu);
        }
        [v14 setZoneUUID:0];
      }
    }
    id v33 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    id v34 = objc_alloc(MEMORY[0x1E4F654B0]);
    v35 = NSStringFromSelector(a2);
    v36 = [MEMORY[0x1E4F65488] allMessageDestinations];
    __int16 v37 = (void *)[v34 initWithName:v35 destination:v36 payload:0];

    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __60__HMDHomePersonDataManager_updateSettingsModelWithSettings___block_invoke;
    v43[3] = &unk_1E6A18C18;
    id v38 = v33;
    id v44 = v38;
    [v37 setResponseHandler:v43];
    uint64_t v39 = [v12 backingStore];
    v40 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    v41 = [v39 transaction:@"Update home person manager settings" options:v40];

    [v41 add:v14 withMessage:v37];
    [v41 run];
    id v26 = v38;
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x1D9452090]();
    __int16 v22 = v8;
    int v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v46 = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference is nil", buf, 0xCu);
    }
    v25 = (void *)MEMORY[0x1E4F7A0D8];
    int v14 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    id v26 = [v25 futureWithError:v14];
  }

  return v26;
}

uint64_t __60__HMDHomePersonDataManager_updateSettingsModelWithSettings___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithNoResult];
  }
}

- (void)removeCloudDataDueToHomeRemoval
{
  id v3 = [(HMDHomePersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(HMDHomePersonDataManager *)self removeCloudDataDueToHomeGraphObjectRemoval:1];
}

- (void)configure
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDHomePersonDataManager *)self home];
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  v6 = HMFGetOSLogHandle();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [v3 personManagerSettings];
      id v10 = [v3 personManagerZoneUUID];
      *(_DWORD *)buf = 138543874;
      v25 = v8;
      __int16 v26 = 2112;
      v27 = v9;
      __int16 v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Initialized home person manager settings: %@, home person manager zone UUID: %@", buf, 0x20u);
    }
    uint64_t v11 = [v3 personManagerZoneUUID];
    id v12 = [v3 administratorHandler];
    uint64_t v13 = *MEMORY[0x1E4F2D790];
    int v14 = +[HMDXPCMessagePolicy policyWithEntitlements:8197];
    v23[0] = v14;
    v15 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
    v23[1] = v15;
    __int16 v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    [v12 registerForMessage:v13 receiver:v5 policies:v16 selector:sel_handleUpdateSettingsMessage_];

    uint64_t v17 = [(HMDHomePersonDataManager *)v5 workQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __37__HMDHomePersonDataManager_configure__block_invoke;
    v20[3] = &unk_1E6A197C8;
    id v21 = v11;
    __int16 v22 = v5;
    id v18 = v11;
    dispatch_async(v17, v20);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v25 = v19;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference is nil", buf, 0xCu);
    }
  }
}

uint64_t __37__HMDHomePersonDataManager_configure__block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return objc_msgSend(*(id *)(result + 40), "configurePersonManagerWithZoneUUID:");
  }
  return result;
}

- (HMDHomePersonDataManager)initWithHome:(id)a3 workQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  id v8 = v7;
  if (!v7)
  {
LABEL_7:
    uint64_t v15 = _HMFPreconditionFailure();
    return (HMDHomePersonDataManager *)__51__HMDHomePersonDataManager_initWithHome_workQueue___block_invoke(v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)HMDHomePersonDataManager;
  id v9 = [(HMDHomePersonDataManager *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a4);
    uint64_t v11 = [v6 uuid];
    homeUUID = v10->_homeUUID;
    v10->_homeUUID = (NSUUID *)v11;

    objc_storeWeak((id *)&v10->_home, v6);
    id personManagerFactory = v10->_personManagerFactory;
    v10->_id personManagerFactory = &__block_literal_global_131062;
  }
  return v10;
}

HMDHomePersonManager *__51__HMDHomePersonDataManager_initWithHome_workQueue___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  id v9 = [[HMDHomePersonManager alloc] initWithHome:v8 zoneUUID:v7 workQueue:v6];

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18_131074 != -1) {
    dispatch_once(&logCategory__hmf_once_t18_131074, &__block_literal_global_30_131075);
  }
  v2 = (void *)logCategory__hmf_once_v19_131076;
  return v2;
}

uint64_t __39__HMDHomePersonDataManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v19_131076;
  logCategory__hmf_once_v19_131076 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end