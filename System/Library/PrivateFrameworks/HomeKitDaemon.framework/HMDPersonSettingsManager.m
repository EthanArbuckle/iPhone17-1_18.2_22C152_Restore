@interface HMDPersonSettingsManager
+ (id)_allowedClassesForMigrationSettings;
+ (id)logCategory;
- (BOOL)areClassificationNotificationsEnabledForPersonUUID:(id)a3;
- (HMCContext)backingStoreContext;
- (HMDHome)home;
- (HMDPersonSettingsManager)initWithHome:(id)a3 backingStoreContext:(id)a4 dependencyFactory:(id)a5 workQueue:(id)a6;
- (HMDPersonSettingsManager)initWithHome:(id)a3 workQueue:(id)a4;
- (HMDPersonSettingsManagerDependencyFactory)dependencyFactory;
- (HMFMessageDispatcher)messageDispatcher;
- (NSURL)personSettingsManagerMigrationFileURL;
- (NSUUID)UUID;
- (OS_dispatch_queue)workQueue;
- (id)_localPersonClassificationSettings;
- (id)_setClassificationNotificationsEnabled:(id)a3 forPersonUUID:(id)a4;
- (id)logIdentifier;
- (void)_handleFetchClassificationNotificationsEnabledForPersonMessage:(id)a3;
- (void)_handleSetClassificationNotificationsEnabledForPersonMessage:(id)a3;
- (void)_maybeMigrateSettings;
- (void)_registerForMessages;
- (void)_removeMigrationSettingsFileFromDisk;
- (void)_setClassificationNotificationsEnabled:(BOOL)a3 personUUID:(id)a4 settings:(id)a5;
- (void)configure;
- (void)remove;
@end

@implementation HMDPersonSettingsManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_dependencyFactory, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_backingStoreContext, 0);
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

- (HMCContext)backingStoreContext
{
  return (HMCContext *)objc_getProperty(self, a2, 16, 1);
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
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDPersonSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v30 = v12;
    __int16 v31 = 2112;
    id v32 = v6;
    __int16 v33 = 2112;
    id v34 = v7;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating the local person registration with classification notifications enabled: %@, for person with UUID: %@", buf, 0x20u);
  }
  v13 = [(HMDPersonSettingsManager *)v10 backingStoreContext];
  id v14 = objc_alloc_init(MEMORY[0x263F58190]);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __81__HMDPersonSettingsManager__setClassificationNotificationsEnabled_forPersonUUID___block_invoke;
  v24[3] = &unk_264A2E908;
  v24[4] = v10;
  id v25 = v6;
  id v26 = v7;
  id v27 = v13;
  id v28 = v14;
  id v15 = v14;
  id v16 = v13;
  id v17 = v7;
  id v18 = v6;
  [v16 performBlock:v24];
  v19 = (void *)MEMORY[0x263F581B8];
  v20 = [(HMDPersonSettingsManager *)v10 workQueue];
  v21 = [v19 schedulerWithDispatchQueue:v20];
  v22 = [v15 reschedule:v21];

  return v22;
}

void __81__HMDPersonSettingsManager__setClassificationNotificationsEnabled_forPersonUUID___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _localPersonClassificationSettings];
  objc_msgSend(*(id *)(a1 + 32), "_setClassificationNotificationsEnabled:personUUID:settings:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"), *(void *)(a1 + 48), v2);
  v3 = *(void **)(a1 + 56);
  id v11 = 0;
  char v4 = [v3 save:&v11];
  id v5 = v11;
  if ((v4 & 1) == 0)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to save person classification settings for person %@: %@", buf, 0x20u);
    }
  }
  [*(id *)(a1 + 64) finishWithError:v5];
}

- (void)_registerForMessages
{
  v10[2] = *MEMORY[0x263EF8340];
  v3 = [(HMDPersonSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  char v4 = +[HMDXPCMessagePolicy policyWithEntitlements:8197];
  id v5 = [(HMDPersonSettingsManager *)self home];
  id v6 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v5 userPrivilege:0 remoteAccessRequired:0];

  v10[0] = v4;
  v10[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  v8 = [(HMDPersonSettingsManager *)self messageDispatcher];
  [v8 registerForMessage:*MEMORY[0x263F0D480] receiver:self policies:v7 selector:sel__handleFetchClassificationNotificationsEnabledForPersonMessage_];

  v9 = [(HMDPersonSettingsManager *)self messageDispatcher];
  [v9 registerForMessage:*MEMORY[0x263F0D490] receiver:self policies:v7 selector:sel__handleSetClassificationNotificationsEnabledForPersonMessage_];
}

- (void)_handleSetClassificationNotificationsEnabledForPersonMessage:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDPersonSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    uint64_t v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    v24 = v9;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling update classification notifications enabled for person message with payload: %@", buf, 0x16u);
  }
  id v11 = [v4 uuidForKey:*MEMORY[0x263F0D488]];
  uint64_t v12 = [v4 numberForKey:*MEMORY[0x263F0D478]];
  v13 = (void *)v12;
  if (v11) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    __int16 v16 = v7;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v24 = v18;
      __int16 v25 = 2112;
      id v26 = v11;
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch classification notifications enabled because information is missing from the message payload - personUUID: %@, enabled:%@", buf, 0x20u);
    }
    v19 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v4 respondWithError:v19];
  }
  else
  {
    v19 = [(HMDPersonSettingsManager *)v7 _setClassificationNotificationsEnabled:v12 forPersonUUID:v11];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __89__HMDPersonSettingsManager__handleSetClassificationNotificationsEnabledForPersonMessage___block_invoke;
    v21[3] = &unk_264A26BA0;
    v21[4] = v7;
    id v22 = v4;
    id v20 = (id)[v19 addCompletionBlock:v21];
  }
}

void __89__HMDPersonSettingsManager__handleSetClassificationNotificationsEnabledForPersonMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v16 = 138543618;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v6;
      uint64_t v12 = "%{public}@Responding with error: %@";
      v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v13, v14, v12, (uint8_t *)&v16, v15);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v16 = 138543362;
    id v17 = v11;
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
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDPersonSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    uint64_t v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    __int16 v27 = v9;
    __int16 v28 = 2112;
    uint64_t v29 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch classification notifications enabled for person message with payload: %@", buf, 0x16u);
  }
  id v11 = [v4 uuidForKey:*MEMORY[0x263F0D488]];
  if (v11)
  {
    uint64_t v12 = [(HMDPersonSettingsManager *)v7 areClassificationNotificationsEnabledForPersonUUID:v11];
    v13 = (void *)MEMORY[0x230FBD990]();
    os_log_type_t v14 = v7;
    uint32_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = HMFGetLogIdentifier();
      id v17 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      __int16 v27 = v16;
      __int16 v28 = 2112;
      uint64_t v29 = v17;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Responding with classificationNotificationsEnabledForPerson: %@", buf, 0x16u);
    }
    __int16 v18 = objc_msgSend(NSNumber, "numberWithBool:", v12, *MEMORY[0x263F0D478]);
    __int16 v25 = v18;
    id v19 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    [v4 respondWithPayload:v19];
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x230FBD990]();
    v21 = v7;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v27 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch classification notifications enabled because we could not find the person UUID in the message payload", buf, 0xCu);
    }
    __int16 v18 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v4 respondWithError:v18];
  }
}

- (void)_maybeMigrateSettings
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v3 = [(HMDPersonSettingsManager *)self personSettingsManagerMigrationFileURL];
  id v4 = [(HMDPersonSettingsManager *)self dependencyFactory];
  id v5 = [v4 fileManager];

  if ([v5 fileExistsAtURL:v3])
  {
    id v40 = 0;
    id v6 = [v5 dataWithContentsOfURL:v3 options:2 error:&v40];
    id v7 = v40;
    if (v6)
    {
      id v8 = (void *)MEMORY[0x263F08928];
      v9 = [(id)objc_opt_class() _allowedClassesForMigrationSettings];
      id v39 = v7;
      uint64_t v10 = [v8 unarchivedObjectOfClasses:v9 fromData:v6 error:&v39];
      id v11 = v39;

      if (v10)
      {
        id v12 = v10;
        objc_opt_class();
        int v13 = objc_opt_isKindOfClass() & 1;
        if (v13) {
          os_log_type_t v14 = v12;
        }
        else {
          os_log_type_t v14 = 0;
        }
        id v35 = v14;

        uint32_t v15 = (void *)MEMORY[0x230FBD990]();
        int v16 = self;
        id v17 = HMFGetOSLogHandle();
        __int16 v18 = v17;
        if (v13)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            id v19 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v42 = v19;
            __int16 v43 = 2112;
            id v44 = v12;
            _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Found HH1 classification settings: %@", buf, 0x16u);
          }
          uint64_t v20 = [(HMDPersonSettingsManager *)v16 backingStoreContext];
          v36[0] = MEMORY[0x263EF8330];
          v36[1] = 3221225472;
          v36[2] = __49__HMDPersonSettingsManager__maybeMigrateSettings__block_invoke;
          v36[3] = &unk_264A2F2F8;
          v36[4] = v16;
          id v37 = v12;
          id v38 = v20;
          id v21 = v20;
          [v21 unsafeSynchronousBlock:v36];
          [(HMDPersonSettingsManager *)v16 _removeMigrationSettingsFileFromDisk];
        }
        else
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            id v34 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v42 = v34;
            __int16 v43 = 2112;
            id v44 = v12;
            _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unarchived data is the wrong type : %@", buf, 0x16u);
          }
        }
      }
      else
      {
        uint64_t v30 = (void *)MEMORY[0x230FBD990]();
        __int16 v31 = self;
        id v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          __int16 v33 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v42 = v33;
          __int16 v43 = 2112;
          id v44 = v11;
          _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive from disk : %@", buf, 0x16u);
        }
      }

      id v7 = v11;
    }
    else
    {
      id v26 = (void *)MEMORY[0x230FBD990]();
      __int16 v27 = self;
      __int16 v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v42 = v29;
        __int16 v43 = 2112;
        id v44 = v3;
        __int16 v45 = 2112;
        id v46 = v7;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to read data from file %@: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v22 = (void *)MEMORY[0x230FBD990]();
    v23 = self;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      __int16 v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v42 = v25;
      __int16 v43 = 2112;
      id v44 = v3;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@HH1 classification settings file does not exist : %@", buf, 0x16u);
    }
  }
}

void __49__HMDPersonSettingsManager__maybeMigrateSettings__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _localPersonClassificationSettings];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__HMDPersonSettingsManager__maybeMigrateSettings__block_invoke_2;
  v13[3] = &unk_264A202D0;
  v3 = *(void **)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v14 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v13];
  id v5 = *(void **)(a1 + 48);
  id v12 = 0;
  char v6 = [v5 save:&v12];
  id v7 = v12;
  if ((v6 & 1) == 0)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v16 = v11;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to save person classification settings during migration: %@", buf, 0x16u);
    }
  }
}

void __49__HMDPersonSettingsManager__maybeMigrateSettings__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  objc_msgSend(v5, "_setClassificationNotificationsEnabled:personUUID:settings:", objc_msgSend(a3, "BOOLValue"), v6, *(void *)(a1 + 40));
}

- (void)_removeMigrationSettingsFileFromDisk
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [(HMDPersonSettingsManager *)self personSettingsManagerMigrationFileURL];
  id v4 = [(HMDPersonSettingsManager *)self dependencyFactory];
  id v5 = [v4 fileManager];
  id v11 = 0;
  [v5 removeItemAtURL:v3 error:&v11];
  id v6 = v11;

  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v13 = v10;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while removing migration settings file from disk : %@", buf, 0x16u);
    }
  }
}

- (void)_setClassificationNotificationsEnabled:(BOOL)a3 personUUID:(id)a4 settings:(id)a5
{
  BOOL v6 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(HMDPersonSettingsManager *)self backingStoreContext];
  id v11 = [v10 managedObjectContext];

  objc_msgSend(v11, "hmd_assertIsExecuting");
  id v12 = [v9 modelID];
  int v13 = +[MKFLocalPersonClassificationRegistration fetchPersonClassificationRegistrationForPersonUUID:v8 settingsModelUUID:v12 managedObjectContext:v11];

  if (!v13)
  {
    __int16 v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = HMFGetLogIdentifier();
      int v18 = 138543618;
      uint64_t v19 = v17;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Person classification registration setting does not exist for person %@, assuming it has not been created yet", (uint8_t *)&v18, 0x16u);
    }
    int v13 = [[MKFLocalPersonClassificationRegistration alloc] initWithContext:v11];
    [(MKFLocalPersonClassificationRegistration *)v13 setPersonUUID:v8];
    [v9 addClassificationRegistrationsObject:v13];
  }
  [(MKFLocalPersonClassificationRegistration *)v13 setEnabled:v6];
}

- (id)_localPersonClassificationSettings
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [(HMDPersonSettingsManager *)self backingStoreContext];
  id v4 = [v3 managedObjectContext];

  objc_msgSend(v4, "hmd_assertIsExecuting");
  id v5 = [(HMDPersonSettingsManager *)self UUID];
  BOOL v6 = +[MKFLocalPersonClassificationSettings fetchPersonClassificationSettingsForModelID:v5 managedObjectContext:v4];

  if (!v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v13 = 138543362;
      __int16 v14 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Person classification settings do not exist, assuming it has not been created yet", (uint8_t *)&v13, 0xCu);
    }
    BOOL v6 = [[MKFLocalPersonClassificationSettings alloc] initWithContext:v4];
    id v11 = [(HMDPersonSettingsManager *)v8 UUID];
    [(MKFLocalPersonClassificationSettings *)v6 setModelID:v11];
  }
  return v6;
}

- (NSURL)personSettingsManagerMigrationFileURL
{
  v3 = NSString;
  id v4 = (id)hh1ToHH2PerDeviceMigrationDirectoryPath;
  id v5 = [(HMDPersonSettingsManager *)self UUID];
  BOOL v6 = [v3 stringWithFormat:@"%@/HMDPersonSettingsManager-%@.plist", v4, v5];

  id v7 = [NSURL fileURLWithPath:v6];

  return (NSURL *)v7;
}

- (void)remove
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v13 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Removing person settings", buf, 0xCu);
  }
  id v7 = [(HMDPersonSettingsManager *)v4 backingStoreContext];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __34__HMDPersonSettingsManager_remove__block_invoke;
  v9[3] = &unk_264A2F820;
  id v10 = v7;
  id v11 = v4;
  id v8 = v7;
  [v8 performBlock:v9];
}

void __34__HMDPersonSettingsManager_remove__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  v3 = [*(id *)(a1 + 40) UUID];
  id v4 = +[MKFLocalPersonClassificationSettings fetchPersonClassificationSettingsForModelID:v3 managedObjectContext:v2];

  if (v4)
  {
    [v2 deleteObject:v4];
    [*(id *)(a1 + 32) save];
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 40);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      id v10 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@No local person classification settings were found for removal", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (BOOL)areClassificationNotificationsEnabledForPersonUUID:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching classification notification settings from MKFLocalPersonClassificationRegistration", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  int v9 = [(HMDPersonSettingsManager *)v6 backingStoreContext];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__HMDPersonSettingsManager_areClassificationNotificationsEnabledForPersonUUID___block_invoke;
  v14[3] = &unk_264A2F000;
  id v10 = v4;
  id v15 = v10;
  uint64_t v16 = v6;
  id v11 = v9;
  id v17 = v11;
  p_long long buf = &buf;
  [v11 unsafeSynchronousBlock:v14];
  BOOL v12 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v12;
}

void __79__HMDPersonSettingsManager_areClassificationNotificationsEnabledForPersonUUID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [*(id *)(a1 + 40) UUID];
  id v4 = [*(id *)(a1 + 48) managedObjectContext];
  id v5 = +[MKFLocalPersonClassificationRegistration fetchPersonClassificationRegistrationForPersonUUID:v2 settingsModelUUID:v3 managedObjectContext:v4];

  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v5 enabled];
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 40);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      id v10 = HMFBooleanToString();
      int v11 = 138543618;
      BOOL v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Person classification registration settings do not exist, returning default setting: %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)configure
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = [(HMDPersonSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    int v9 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Configuring HMDPersonSettingsManager", (uint8_t *)&v8, 0xCu);
  }
  [(HMDPersonSettingsManager *)v5 _maybeMigrateSettings];
  [(HMDPersonSettingsManager *)v5 _registerForMessages];
}

- (HMDPersonSettingsManager)initWithHome:(id)a3 backingStoreContext:(id)a4 dependencyFactory:(id)a5 workQueue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)HMDPersonSettingsManager;
  uint64_t v14 = [(HMDPersonSettingsManager *)&v23 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_home, v10);
    uint64_t v16 = [v10 msgDispatcher];
    messageDispatcher = v15->_messageDispatcher;
    v15->_messageDispatcher = (HMFMessageDispatcher *)v16;

    objc_storeStrong((id *)&v15->_dependencyFactory, a5);
    objc_storeStrong((id *)&v15->_workQueue, a6);
    int v18 = (void *)MEMORY[0x263F0E640];
    uint64_t v19 = [v10 uuid];
    uint64_t v20 = [v18 personSettingsManagerUUIDFromHomeUUID:v19];
    UUID = v15->_UUID;
    v15->_UUID = (NSUUID *)v20;

    objc_storeStrong((id *)&v15->_backingStoreContext, a4);
  }

  return v15;
}

- (HMDPersonSettingsManager)initWithHome:(id)a3 workQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [v7 backingStore];
  int v9 = [v8 context];
  id v10 = objc_alloc_init(HMDPersonSettingsManagerDependencyFactory);
  id v11 = [(HMDPersonSettingsManager *)self initWithHome:v7 backingStoreContext:v9 dependencyFactory:v10 workQueue:v6];

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_126544 != -1) {
    dispatch_once(&logCategory__hmf_once_t24_126544, &__block_literal_global_126545);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v25_126546;
  return v2;
}

void __39__HMDPersonSettingsManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v25_126546;
  logCategory__hmf_once_v25_126546 = v0;
}

+ (id)_allowedClassesForMigrationSettings
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:3];
  id v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7);

  return v4;
}

@end