@interface HMDPersonSettingsManager
+ (id)logCategory;
- (BOOL)areClassificationNotificationsEnabledForPersonUUID:(id)a3;
- (HMBLocalZone)localZone;
- (HMDHome)home;
- (HMDPersonSettingsManager)initWithHome:(id)a3 localZone:(id)a4 dependencyFactory:(id)a5 workQueue:(id)a6;
- (HMDPersonSettingsManager)initWithHome:(id)a3 localZone:(id)a4 workQueue:(id)a5;
- (HMDPersonSettingsManagerDependencyFactory)dependencyFactory;
- (HMFMessageDispatcher)messageDispatcher;
- (NSURL)personSettingsManagerMigrationFileURL;
- (NSUUID)UUID;
- (OS_dispatch_queue)workQueue;
- (id)_setClassificationNotificationsEnabled:(id)a3 forPersonUUID:(id)a4;
- (id)logIdentifier;
- (void)_handleFetchClassificationNotificationsEnabledForPersonMessage:(id)a3;
- (void)_handleSetClassificationNotificationsEnabledForPersonMessage:(id)a3;
- (void)_registerForMessages;
- (void)configure;
- (void)remove;
- (void)savePersonManagerSettingsToLocalDiskForMigration;
@end

@implementation HMDPersonSettingsManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_dependencyFactory, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (HMDPersonSettingsManagerDependencyFactory)dependencyFactory
{
  return (HMDPersonSettingsManagerDependencyFactory *)objc_getProperty(self, a2, 32, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDPersonSettingsManager *)self UUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)_setClassificationNotificationsEnabled:(id)a3 forPersonUUID:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDPersonSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D9452090]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v30 = 138543874;
    v31 = v12;
    __int16 v32 = 2112;
    id v33 = v6;
    __int16 v34 = 2112;
    id v35 = v7;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating the HMDPersonSettingsModel with classification notifications enabled: %@, for person with UUID: %@", (uint8_t *)&v30, 0x20u);
  }
  v13 = [(HMDPersonSettingsManager *)v10 localZone];
  v14 = +[HMDPersonSettingsModel sentinelModelUUID];
  v15 = [v13 fetchModelWithModelID:v14 ofType:objc_opt_class() error:0];

  if (!v15)
  {
    v16 = (void *)MEMORY[0x1D9452090]();
    v17 = v10;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = HMFGetLogIdentifier();
      int v30 = 138543362;
      v31 = v19;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Did not find HMDPersonSettingsModel, assuming it has not been created yet", (uint8_t *)&v30, 0xCu);
    }
    v15 = objc_alloc_init(HMDPersonSettingsModel);
  }
  [(HMDPersonSettingsModel *)v15 setClassificationNotificationsEnabled:v6 forPersonUUID:v7];
  v20 = [(HMDPersonSettingsManager *)v10 localZone];
  v21 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];
  v22 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Update classification notifications settings"];
  v23 = [v20 addModels:v21 options:v22];

  v24 = (void *)MEMORY[0x1E4F7A0F0];
  v25 = [(HMDPersonSettingsManager *)v10 workQueue];
  v26 = [v24 schedulerWithDispatchQueue:v25];
  v27 = [v23 reschedule:v26];
  v28 = [v27 flatMap:&__block_literal_global_85452];

  return v28;
}

uint64_t __81__HMDPersonSettingsManager__setClassificationNotificationsEnabled_forPersonUUID___block_invoke()
{
  return [MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)_registerForMessages
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = [(HMDPersonSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = +[HMDXPCMessagePolicy policyWithEntitlements:8197];
  v5 = [(HMDPersonSettingsManager *)self home];
  id v6 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v5 userPrivilege:0 remoteAccessRequired:0];

  v10[0] = v4;
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v8 = [(HMDPersonSettingsManager *)self messageDispatcher];
  [v8 registerForMessage:*MEMORY[0x1E4F2DC80] receiver:self policies:v7 selector:sel__handleFetchClassificationNotificationsEnabledForPersonMessage_];

  v9 = [(HMDPersonSettingsManager *)self messageDispatcher];
  [v9 registerForMessage:*MEMORY[0x1E4F2DC90] receiver:self policies:v7 selector:sel__handleSetClassificationNotificationsEnabledForPersonMessage_];
}

- (void)_handleSetClassificationNotificationsEnabledForPersonMessage:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDPersonSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    v24 = v9;
    __int16 v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling update classification notifications enabled for person message with payload: %@", buf, 0x16u);
  }
  v11 = [v4 uuidForKey:*MEMORY[0x1E4F2DC88]];
  uint64_t v12 = [v4 numberForKey:*MEMORY[0x1E4F2DC78]];
  v13 = (void *)v12;
  if (v11) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    v15 = (void *)MEMORY[0x1D9452090]();
    v16 = v7;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v24 = v18;
      __int16 v25 = 2112;
      v26 = v11;
      __int16 v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch classification notifications enabled because information is missing from the message payload - personUUID: %@, enabled:%@", buf, 0x20u);
    }
    v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [v4 respondWithError:v19];
  }
  else
  {
    v19 = [(HMDPersonSettingsManager *)v7 _setClassificationNotificationsEnabled:v12 forPersonUUID:v11];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __89__HMDPersonSettingsManager__handleSetClassificationNotificationsEnabledForPersonMessage___block_invoke;
    v21[3] = &unk_1E6A12A80;
    v21[4] = v7;
    id v22 = v4;
    id v20 = (id)[v19 addCompletionBlock:v21];
  }
}

void __89__HMDPersonSettingsManager__handleSetClassificationNotificationsEnabledForPersonMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v16 = 138543618;
      v17 = v11;
      __int16 v18 = 2112;
      id v19 = v6;
      uint64_t v12 = "%{public}@Responding with error: %@";
      v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v13, v14, v12, (uint8_t *)&v16, v15);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v16 = 138543362;
    v17 = v11;
    uint64_t v12 = "%{public}@Responding with success";
    v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 12;
    goto LABEL_6;
  }

  [*(id *)(a1 + 40) respondWithPayload:0 error:v6];
}

- (void)_handleFetchClassificationNotificationsEnabledForPersonMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDPersonSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    __int16 v27 = v9;
    __int16 v28 = 2112;
    uint64_t v29 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch classification notifications enabled for person message with payload: %@", buf, 0x16u);
  }
  v11 = [v4 uuidForKey:*MEMORY[0x1E4F2DC88]];
  if (v11)
  {
    uint64_t v12 = [(HMDPersonSettingsManager *)v7 areClassificationNotificationsEnabledForPersonUUID:v11];
    v13 = (void *)MEMORY[0x1D9452090]();
    os_log_type_t v14 = v7;
    uint32_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = HMFGetLogIdentifier();
      v17 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      __int16 v27 = v16;
      __int16 v28 = 2112;
      uint64_t v29 = v17;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Responding with classificationNotificationsEnabledForPerson: %@", buf, 0x16u);
    }
    __int16 v18 = objc_msgSend(NSNumber, "numberWithBool:", v12, *MEMORY[0x1E4F2DC78]);
    __int16 v25 = v18;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    [v4 respondWithPayload:v19];
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1D9452090]();
    v21 = v7;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v27 = v23;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch classification notifications enabled because we could not find the person UUID in the message payload", buf, 0xCu);
    }
    __int16 v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [v4 respondWithError:v18];
  }
}

- (void)savePersonManagerSettingsToLocalDiskForMigration
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v35 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Saving person classification settings to disk for migration", buf, 0xCu);
  }
  id v7 = [(HMDPersonSettingsManager *)v4 localZone];
  id v8 = +[HMDPersonSettingsModel sentinelModelUUID];
  v9 = [v7 fetchModelWithModelID:v8 ofType:objc_opt_class() error:0];

  v10 = [v9 faceClassificationNotificationsEnabledByPersonUUID];
  v11 = (void *)MEMORY[0x1D9452090]();
  if (v9 && v10)
  {
    uint64_t v12 = (void *)MEMORY[0x1D9452090]();
    v13 = v4;
    os_log_type_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint32_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v35 = v15;
      __int16 v36 = 2112;
      v37 = v10;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Saving person classification settings %@", buf, 0x16u);
    }
    id v33 = 0;
    int v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v33];
    v17 = (HMDPersonSettingsManager *)v33;
    if (v16)
    {
      __int16 v18 = [(HMDPersonSettingsManager *)v13 personSettingsManagerMigrationFileURL];
      id v19 = [(HMDPersonSettingsManager *)v13 dependencyFactory];
      uint64_t v20 = [v19 persistentStore];

      v21 = [v18 path];
      id v22 = [v20 writeData:v16 toStorePath:v21 dataLabel:@"PersonClassificationSettings"];

      context = (void *)MEMORY[0x1D9452090]();
      v23 = v13;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        __int16 v25 = v31 = v11;
        *(_DWORD *)buf = 138543874;
        id v35 = v25;
        __int16 v36 = 2112;
        v37 = v22;
        __int16 v38 = 2112;
        v39 = v18;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Saved [%@] bytes to [%@]", buf, 0x20u);

        v11 = v31;
      }
    }
    else
    {
      __int16 v27 = (void *)MEMORY[0x1D9452090]();
      __int16 v28 = v13;
      uint64_t v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v35 = v30;
        __int16 v36 = 2112;
        v37 = v17;
        _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Nothing to store as there is no data after archiving: %@", buf, 0x16u);
      }
      int v16 = 0;
    }
  }
  else
  {
    v17 = v4;
    int v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v35 = v26;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@No person classification settings found, skipping", buf, 0xCu);
    }
  }
}

- (NSURL)personSettingsManagerMigrationFileURL
{
  v3 = NSString;
  id v4 = (id)hh1ToHH2PerDeviceMigrationDirectoryPath;
  id v5 = [(HMDPersonSettingsManager *)self UUID];
  id v6 = [v3 stringWithFormat:@"%@/HMDPersonSettingsManager-%@.plist", v4, v5];

  id v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];

  return (NSURL *)v7;
}

- (void)remove
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v16 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Removing person settings", buf, 0xCu);
  }
  id v7 = [(HMDPersonSettingsManager *)v4 localZone];
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  v9 = +[HMDPersonSettingsModel sentinelModelUUID];
  v10 = [v8 setWithObject:v9];
  v11 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Remove Person Settings"];
  uint64_t v12 = [v7 removeModelIDs:v10 options:v11];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __34__HMDPersonSettingsManager_remove__block_invoke;
  v14[3] = &unk_1E6A12BB8;
  v14[4] = v4;
  id v13 = (id)[v12 addCompletionBlock:v14];
}

void __34__HMDPersonSettingsManager_remove__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v16 = 138543362;
      uint64_t v17 = v11;
      uint64_t v12 = "%{public}@Successfully removed person settings";
      id v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_INFO;
      uint32_t v15 = 12;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v13, v14, v12, (uint8_t *)&v16, v15);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v11 = HMFGetLogIdentifier();
    int v16 = 138543618;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    id v19 = v6;
    uint64_t v12 = "%{public}@Failed to remove person settings with error: %@";
    id v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    uint32_t v15 = 22;
    goto LABEL_6;
  }
}

- (BOOL)areClassificationNotificationsEnabledForPersonUUID:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v26 = 138543362;
    __int16 v27 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching classification notification settings from HMDPersonSettingsModel", (uint8_t *)&v26, 0xCu);
  }
  v9 = [(HMDPersonSettingsManager *)v6 localZone];
  v10 = +[HMDPersonSettingsModel sentinelModelUUID];
  v11 = [v9 fetchModelWithModelID:v10 ofType:objc_opt_class() error:0];

  if (v11)
  {
    uint64_t v12 = [v11 classificationNotificationsEnabledForPersonUUID:v4];
    id v13 = v12;
    if (v12)
    {
      char v14 = [v12 BOOLValue];
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x1D9452090]();
      v21 = v6;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = HMFGetLogIdentifier();
        uint64_t v24 = HMFBooleanToString();
        int v26 = 138543874;
        __int16 v27 = v23;
        __int16 v28 = 2112;
        id v29 = v4;
        __int16 v30 = 2112;
        v31 = v24;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@No classification notification setting has been set for person with uuid: %@, so returning default value: %@", (uint8_t *)&v26, 0x20u);
      }
      char v14 = 1;
    }
  }
  else
  {
    uint32_t v15 = (void *)MEMORY[0x1D9452090]();
    int v16 = v6;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = HMFGetLogIdentifier();
      id v19 = HMFBooleanToString();
      int v26 = 138543618;
      __int16 v27 = v18;
      __int16 v28 = 2112;
      id v29 = v19;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Person settings model does not exist, returning default setting: %@", (uint8_t *)&v26, 0x16u);
    }
    char v14 = 1;
  }

  return v14;
}

- (void)configure
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDPersonSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Configuring HMDPersonSettingsManager", (uint8_t *)&v8, 0xCu);
  }
  [(HMDPersonSettingsManager *)v5 _registerForMessages];
}

- (HMDPersonSettingsManager)initWithHome:(id)a3 localZone:(id)a4 dependencyFactory:(id)a5 workQueue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)HMDPersonSettingsManager;
  char v14 = [(HMDPersonSettingsManager *)&v23 init];
  uint32_t v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_home, v10);
    uint64_t v16 = [v10 msgDispatcher];
    messageDispatcher = v15->_messageDispatcher;
    v15->_messageDispatcher = (HMFMessageDispatcher *)v16;

    objc_storeStrong((id *)&v15->_dependencyFactory, a5);
    objc_storeStrong((id *)&v15->_workQueue, a6);
    __int16 v18 = (void *)MEMORY[0x1E4F2EA00];
    id v19 = [v10 uuid];
    uint64_t v20 = [v18 personSettingsManagerUUIDFromHomeUUID:v19];
    UUID = v15->_UUID;
    v15->_UUID = (NSUUID *)v20;

    objc_storeStrong((id *)&v15->_localZone, a4);
  }

  return v15;
}

- (HMDPersonSettingsManager)initWithHome:(id)a3 localZone:(id)a4 workQueue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(HMDPersonSettingsManagerDependencyFactory);
  id v12 = [(HMDPersonSettingsManager *)self initWithHome:v10 localZone:v9 dependencyFactory:v11 workQueue:v8];

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t21_85505 != -1) {
    dispatch_once(&logCategory__hmf_once_t21_85505, &__block_literal_global_45_85506);
  }
  v2 = (void *)logCategory__hmf_once_v22_85507;
  return v2;
}

uint64_t __39__HMDPersonSettingsManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v22_85507;
  logCategory__hmf_once_v22_85507 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end