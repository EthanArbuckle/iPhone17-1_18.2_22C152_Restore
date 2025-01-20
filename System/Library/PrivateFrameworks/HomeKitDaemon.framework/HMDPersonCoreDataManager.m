@interface HMDPersonCoreDataManager
+ (id)logCategory;
- (BOOL)isRelevantManagedObjectContext:(id)a3;
- (BOOL)isRelevantPerson:(id)a3;
- (BOOL)shouldDispatchToPrimaryResident;
- (HMCContext)context;
- (HMDHome)home;
- (HMDPersonCoreDataManager)initWithUUID:(id)a3 workQueue:(id)a4 home:(id)a5 userUUID:(id)a6;
- (HMDPersonCoreDataManager)initWithUUID:(id)a3 workQueue:(id)a4 home:(id)a5 userUUID:(id)a6 context:(id)a7 residentSyncManager:(id)a8 notificationCenter:(id)a9;
- (HMDPersonCoreDataManagerDelegate)delegate;
- (HMDPersonDataSource)dataSource;
- (HMDPersonResidentSyncManager)residentSyncManager;
- (NSNotificationCenter)notificationCenter;
- (NSUUID)UUID;
- (NSUUID)userUUID;
- (OS_dispatch_queue)workQueue;
- (id)addOrUpdatePersons:(id)a3 andRemovePersonsWithUUIDs:(id)a4;
- (id)deletedPersonUUIDsUserInfoKey;
- (id)logIdentifier;
- (id)personModelWithModelID:(id)a3;
- (id)personWithModelID:(id)a3;
- (id)personWithUUID:(id)a3;
- (id)persons;
- (id)removeAllAssociatedData;
- (void)configureWithDataSource:(id)a3;
- (void)enumeratePersonsUsingBlock:(id)a3;
- (void)handleManagedObjectContextDidSaveNotification:(id)a3;
- (void)handleManagedObjectContextWillSaveNotification:(id)a3;
- (void)insertOrUpdatePersonUsingPerson:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setUserUUID:(id)a3;
@end

@implementation HMDPersonCoreDataManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_residentSyncManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDataSource:(id)a3
{
}

- (HMDPersonDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDPersonDataSource *)WeakRetained;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 64, 1);
}

- (HMDPersonResidentSyncManager)residentSyncManager
{
  return (HMDPersonResidentSyncManager *)objc_getProperty(self, a2, 56, 1);
}

- (HMCContext)context
{
  return (HMCContext *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUserUUID:(id)a3
{
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDPersonCoreDataManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDPersonCoreDataManagerDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDPersonCoreDataManager *)self UUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)handleManagedObjectContextDidSaveNotification:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7 && [(HMDPersonCoreDataManager *)self isRelevantManagedObjectContext:v7])
  {
    v53 = [MEMORY[0x263EFF9C0] set];
    v50 = v4;
    v8 = [v4 userInfo];
    v9 = objc_msgSend(v8, "hmf_setForKey:", *MEMORY[0x263EFF018]);

    long long v63 = 0u;
    long long v64 = 0u;
    long long v62 = 0u;
    long long v61 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v61 objects:v70 count:16];
    v52 = v10;
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v62 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(id *)(*((void *)&v61 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v16 = v15;
          }
          else {
            v16 = 0;
          }
          id v17 = v16;

          if (v17 && [(HMDPersonCoreDataManager *)self isRelevantPerson:v17])
          {
            v18 = (void *)MEMORY[0x230FBD990]();
            v19 = self;
            v20 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              v21 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v67 = v21;
              __int16 v68 = 2112;
              id v69 = v17;
              _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Received notification about inserted person: %@", buf, 0x16u);

              id v10 = v52;
            }

            v22 = [v17 createHMPerson];
            [v53 addObject:v22];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v61 objects:v70 count:16];
      }
      while (v12);
    }

    v23 = [v50 userInfo];
    v24 = objc_msgSend(v23, "hmf_setForKey:", *MEMORY[0x263EFF180]);

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v25 = v24;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v57 objects:v65 count:16];
    id v51 = v25;
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v58 != v28) {
            objc_enumerationMutation(v25);
          }
          id v30 = *(id *)(*((void *)&v57 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v31 = v30;
          }
          else {
            v31 = 0;
          }
          id v32 = v31;

          if (v32 && [(HMDPersonCoreDataManager *)self isRelevantPerson:v32])
          {
            v33 = (void *)MEMORY[0x230FBD990]();
            v34 = self;
            v35 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              v36 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v67 = v36;
              __int16 v68 = 2112;
              id v69 = v32;
              _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Received notification about updated person: %@", buf, 0x16u);

              id v25 = v51;
            }

            v37 = [v32 createHMPerson];
            [v53 addObject:v37];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v57 objects:v65 count:16];
      }
      while (v27);
    }

    v38 = [v7 userInfo];
    v39 = [(HMDPersonCoreDataManager *)self deletedPersonUUIDsUserInfoKey];
    v40 = [v38 objectForKeyedSubscript:v39];

    v41 = [v7 userInfo];
    v42 = [(HMDPersonCoreDataManager *)self deletedPersonUUIDsUserInfoKey];
    [v41 setObject:0 forKeyedSubscript:v42];

    if (v40)
    {
      v43 = (void *)MEMORY[0x230FBD990]();
      v44 = self;
      v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v46 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v67 = v46;
        __int16 v68 = 2112;
        id v69 = v40;
        _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_INFO, "%{public}@Received notification about deleted person UUIDs: %@", buf, 0x16u);

        id v25 = v51;
      }
    }
    v47 = [(HMDPersonCoreDataManager *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__HMDPersonCoreDataManager_handleManagedObjectContextDidSaveNotification___block_invoke;
    block[3] = &unk_264A2F2F8;
    block[4] = self;
    id v55 = v53;
    id v56 = v40;
    id v48 = v40;
    id v49 = v53;
    dispatch_async(v47, block);

    id v4 = v50;
  }
}

void __74__HMDPersonCoreDataManager_handleManagedObjectContextDidSaveNotification___block_invoke(id *a1)
{
  id v2 = [a1[4] delegate];
  if ([a1[5] count]) {
    [v2 coreDataManager:a1[4] didUpdatePersons:a1[5]];
  }
  if ([a1[6] count]) {
    [v2 coreDataManager:a1[4] didRemovePersonsWithUUIDs:a1[6]];
  }
}

- (void)handleManagedObjectContextWillSaveNotification:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7 && [(HMDPersonCoreDataManager *)self isRelevantManagedObjectContext:v7])
  {
    v8 = [v7 deletedObjects];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __75__HMDPersonCoreDataManager_handleManagedObjectContextWillSaveNotification___block_invoke;
    v18[3] = &unk_264A2CDB8;
    v18[4] = self;
    v9 = objc_msgSend(v8, "na_map:", v18);

    if ([v9 count])
    {
      id v10 = (void *)MEMORY[0x230FBD990]();
      uint64_t v11 = self;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v20 = v13;
        __int16 v21 = 2112;
        v22 = v9;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Received notification of impending delete for person UUIDs: %@", buf, 0x16u);
      }
      v14 = [v7 userInfo];
      id v15 = [(HMDPersonCoreDataManager *)v11 deletedPersonUUIDsUserInfoKey];
      v16 = v14;
      id v17 = v9;
    }
    else
    {
      v14 = [v7 userInfo];
      id v15 = [(HMDPersonCoreDataManager *)self deletedPersonUUIDsUserInfoKey];
      v16 = v14;
      id v17 = 0;
    }
    [v16 setObject:v17 forKeyedSubscript:v15];
  }
}

id __75__HMDPersonCoreDataManager_handleManagedObjectContextWillSaveNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  if (v5 && [*(id *)(a1 + 32) isRelevantPerson:v5])
  {
    v6 = [v5 modelID];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isRelevantPerson:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [(HMDPersonCoreDataManager *)self home];
    if (v7)
    {
      id v8 = (id)v7;
      v9 = objc_msgSend(v6, "hmd_lastKnownValueForKey:", @"home");
      id v10 = v9;
      if (v9)
      {
        uint64_t v11 = [v9 modelID];
        uint64_t v12 = [v8 uuid];
LABEL_15:
        id v17 = (void *)v12;
        char v18 = [v11 isEqual:v12];

LABEL_26:
        goto LABEL_27;
      }
      uint64_t v23 = (void *)MEMORY[0x230FBD990]();
      v24 = self;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        uint64_t v27 = [v6 debugDescription];
        int v30 = 138543618;
        v31 = v26;
        __int16 v32 = 2112;
        v33 = v27;
        uint64_t v28 = "%{public}@Home relationship is nil for home person checked for relevance: %@";
LABEL_24:
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&v30, 0x16u);

        goto LABEL_25;
      }
      goto LABEL_25;
    }
    v19 = (void *)MEMORY[0x230FBD990]();
    v20 = self;
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      int v30 = 138543362;
      v31 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Home reference was nil while checking if person was relevant", (uint8_t *)&v30, 0xCu);
    }
    id v8 = 0;
  }
  else
  {
    id v13 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v8 = v14;

    if (v8)
    {
      id v15 = [(HMDPersonCoreDataManager *)self userUUID];

      if (v15)
      {
        v16 = objc_msgSend(v8, "hmd_lastKnownValueForKey:", @"user");
        id v10 = v16;
        if (v16)
        {
          uint64_t v11 = [v16 modelID];
          uint64_t v12 = [(HMDPersonCoreDataManager *)self userUUID];
          goto LABEL_15;
        }
        uint64_t v23 = (void *)MEMORY[0x230FBD990]();
        v24 = self;
        id v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          uint64_t v26 = HMFGetLogIdentifier();
          uint64_t v27 = [v8 debugDescription];
          int v30 = 138543618;
          v31 = v26;
          __int16 v32 = 2112;
          v33 = v27;
          uint64_t v28 = "%{public}@User relationship is nil for photos person checked for relevance: %@";
          goto LABEL_24;
        }
LABEL_25:

        char v18 = 0;
        goto LABEL_26;
      }
    }
  }
  char v18 = 0;
LABEL_27:

  return v18;
}

- (BOOL)isRelevantManagedObjectContext:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDPersonCoreDataManager *)self home];
  id v6 = v5;
  if (!v5)
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Home reference was nil while checking if managed object context was relevant", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_7;
  }
  uint64_t v7 = [v5 backingStore];
  id v8 = [v7 coreData];
  int v9 = [v8 isRelatedContext:v4];

  if (!v9)
  {
LABEL_7:
    char v13 = 0;
    goto LABEL_8;
  }
  id v10 = [v4 name];
  uint64_t v11 = [v6 uuid];
  uint64_t v12 = HMDWorkingContextNameForHomeUUID(v11);
  char v13 = [v10 isEqualToString:v12];

LABEL_8:
  return v13;
}

- (BOOL)shouldDispatchToPrimaryResident
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(HMDPersonCoreDataManager *)self home];
  id v4 = v3;
  if (!v3)
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      char v13 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Home reference was nil while checking we should dispatch to primary resident", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_8;
  }
  if ([v3 isCurrentDeviceConfirmedPrimaryResident])
  {
LABEL_8:
    char v6 = 0;
    goto LABEL_11;
  }
  id v5 = [(HMDPersonCoreDataManager *)self userUUID];
  if (v5) {
    char v6 = [v4 isOwnerUser];
  }
  else {
    char v6 = 1;
  }

LABEL_11:
  return v6;
}

- (id)personModelWithModelID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDPersonCoreDataManager *)self home];
  if (!v5)
  {
    id v8 = 0;
    goto LABEL_10;
  }
  char v6 = [(HMDPersonCoreDataManager *)self userUUID];

  if (v6)
  {
    if (![v5 isOwnerUser])
    {
      int v9 = [(HMDPersonCoreDataManager *)self context];
      id v10 = [v9 managedObjectContext];
      uint64_t v11 = +[MKFCKModel modelWithModelID:v4 context:v10 error:0];
      goto LABEL_9;
    }
    uint64_t v7 = _MKFPhotosPerson;
  }
  else
  {
    uint64_t v7 = _MKFHomePerson;
  }
  int v9 = [(HMDPersonCoreDataManager *)self context];
  id v10 = [v9 managedObjectContext];
  uint64_t v11 = [(__objc2_class *)v7 modelWithModelID:v4 context:v10];
LABEL_9:
  id v8 = (void *)v11;

LABEL_10:
  return v8;
}

- (id)personWithModelID:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDPersonCoreDataManager *)self home];
  if (v5)
  {
    char v6 = [(HMDPersonCoreDataManager *)self userUUID];

    if (v6)
    {
      if (![v5 isOwnerUser])
      {
        char v13 = [(HMDPersonCoreDataManager *)self context];
        uint64_t v14 = [v13 managedObjectContext];
        uint64_t v15 = +[MKFCKModel modelWithModelID:v4 context:v14 error:0];
        goto LABEL_11;
      }
      uint64_t v7 = _MKFPhotosPerson;
    }
    else
    {
      uint64_t v7 = _MKFHomePerson;
    }
    char v13 = [(HMDPersonCoreDataManager *)self context];
    uint64_t v14 = [v13 managedObjectContext];
    uint64_t v15 = [(__objc2_class *)v7 modelWithModelID:v4 context:v14];
LABEL_11:
    v16 = (void *)v15;

    int v12 = [v16 createHMPerson];

    goto LABEL_12;
  }
  id v8 = (void *)MEMORY[0x230FBD990]();
  int v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v18 = 138543362;
    int v19 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Home reference was nil while fetching person with model ID", (uint8_t *)&v18, 0xCu);
  }
  int v12 = 0;
LABEL_12:

  return v12;
}

- (void)insertOrUpdatePersonUsingPerson:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDPersonCoreDataManager *)self home];
  if (v5)
  {
    char v6 = [(HMDPersonCoreDataManager *)self userUUID];

    if (v6)
    {
      if (![v5 isOwnerUser])
      {
        int v30 = [v4 UUID];
        v31 = [(HMDPersonCoreDataManager *)self context];
        __int16 v32 = [v31 managedObjectContext];
        id v10 = +[MKFCKModel modelWithModelID:v30 context:v32 error:0];

        if (!v10)
        {
          v33 = [MKFCKSharedUserPhotosPerson alloc];
          uint64_t v34 = [(HMDPersonCoreDataManager *)self context];
          v35 = [v34 managedObjectContext];
          id v10 = [(MKFCKSharedUserPhotosPerson *)v33 initWithContext:v35];

          v36 = [v4 UUID];
          [(MKFCKSharedUserPhotosPerson *)v10 setModelID:v36];

          v37 = [v5 uuid];
          v38 = [(HMDPersonCoreDataManager *)self context];
          v39 = [v38 managedObjectContext];
          v40 = +[MKFCKModel modelWithModelID:v37 context:v39 error:0];
          [(MKFCKSharedUserPhotosPerson *)v10 setRoot:v40];

          v41 = [v5 uuid];
          [(MKFCKSharedUserPhotosPerson *)v10 setHomeModelID:v41];
        }
        goto LABEL_14;
      }
      uint64_t v7 = [v4 UUID];
      id v8 = [(HMDPersonCoreDataManager *)self context];
      int v9 = [v8 managedObjectContext];
      id v10 = +[_MKFModel modelWithModelID:v7 context:v9];

      if (!v10)
      {
        uint64_t v11 = [_MKFPhotosPerson alloc];
        int v12 = [(HMDPersonCoreDataManager *)self context];
        char v13 = [v12 managedObjectContext];
        id v10 = [(_MKFPhotosPerson *)v11 initWithContext:v13];

        uint64_t v14 = [v4 UUID];
        [(MKFCKSharedUserPhotosPerson *)v10 setModelID:v14];

        uint64_t v15 = [(HMDPersonCoreDataManager *)self userUUID];
        v16 = [(HMDPersonCoreDataManager *)self context];
        id v17 = [v16 managedObjectContext];
        int v18 = +[_MKFModel modelWithModelID:v15 context:v17];
        [(MKFCKSharedUserPhotosPerson *)v10 setUser:v18];
LABEL_11:
      }
    }
    else
    {
      uint64_t v23 = [v4 UUID];
      v24 = [(HMDPersonCoreDataManager *)self context];
      id v25 = [v24 managedObjectContext];
      id v10 = +[_MKFModel modelWithModelID:v23 context:v25];

      if (!v10)
      {
        uint64_t v26 = [_MKFHomePerson alloc];
        uint64_t v27 = [(HMDPersonCoreDataManager *)self context];
        uint64_t v28 = [v27 managedObjectContext];
        id v10 = [(_MKFHomePerson *)v26 initWithContext:v28];

        v29 = [v4 UUID];
        [(MKFCKSharedUserPhotosPerson *)v10 setModelID:v29];

        uint64_t v15 = [v5 uuid];
        v16 = [(HMDPersonCoreDataManager *)self context];
        id v17 = [v16 managedObjectContext];
        int v18 = +[_MKFModel modelWithModelID:v15 context:v17];
        [(MKFCKSharedUserPhotosPerson *)v10 setHome:v18];
        goto LABEL_11;
      }
    }
LABEL_14:
    [(MKFCKSharedUserPhotosPerson *)v10 updateWithHMPerson:v4];

    goto LABEL_15;
  }
  int v19 = (void *)MEMORY[0x230FBD990]();
  uint64_t v20 = self;
  uint64_t v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = HMFGetLogIdentifier();
    int v42 = 138543362;
    v43 = v22;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Home reference was nil while inserting / updating person", (uint8_t *)&v42, 0xCu);
  }
LABEL_15:
}

- (id)persons
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = [(HMDPersonCoreDataManager *)self home];
  if (v3)
  {
    id v4 = [(HMDPersonCoreDataManager *)self userUUID];

    if (v4)
    {
      if ([v3 isOwnerUser])
      {
        id v5 = [(HMDPersonCoreDataManager *)self userUUID];
        char v6 = [(HMDPersonCoreDataManager *)self context];
        uint64_t v7 = [v6 managedObjectContext];
        id v8 = +[_MKFModel modelWithModelID:v5 context:v7];

        int v9 = [v8 personsFromPhotos];
        id v10 = v9;
        uint64_t v11 = &__block_literal_global_252816;
      }
      else
      {
        uint64_t v20 = [v3 uuid];
        uint64_t v21 = [(HMDPersonCoreDataManager *)self context];
        v22 = [v21 managedObjectContext];
        id v8 = +[MKFCKModel modelWithModelID:v20 context:v22 error:0];

        int v9 = [v8 personsFromPhotos];
        id v10 = v9;
        uint64_t v11 = &__block_literal_global_19_252817;
      }
    }
    else
    {
      id v17 = [v3 uuid];
      int v18 = [(HMDPersonCoreDataManager *)self context];
      int v19 = [v18 managedObjectContext];
      id v8 = +[_MKFModel modelWithModelID:v17 context:v19];

      int v9 = [v8 persons];
      id v10 = v9;
      uint64_t v11 = &__block_literal_global_23_252818;
    }
    v16 = objc_msgSend(v9, "na_map:", v11);
  }
  else
  {
    int v12 = (void *)MEMORY[0x230FBD990]();
    char v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v24 = 138543362;
      id v25 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Home reference was nil while fetching all persons", (uint8_t *)&v24, 0xCu);
    }
    v16 = [MEMORY[0x263EFFA08] set];
  }

  return v16;
}

uint64_t __35__HMDPersonCoreDataManager_persons__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 createHMPerson];
}

uint64_t __35__HMDPersonCoreDataManager_persons__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 createHMPerson];
}

uint64_t __35__HMDPersonCoreDataManager_persons__block_invoke(uint64_t a1, void *a2)
{
  return [a2 createHMPerson];
}

- (id)deletedPersonUUIDsUserInfoKey
{
  id v2 = NSString;
  id v3 = [(HMDPersonCoreDataManager *)self UUID];
  id v4 = [v2 stringWithFormat:@"HMDPersonCoreDataManagerDeletedPersonUUIDs.%@", v3];

  return v4;
}

- (id)removeAllAssociatedData
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = [(HMDPersonCoreDataManager *)self home];
  if (!v3)
  {
    char v6 = (void *)MEMORY[0x230FBD990]();
    uint64_t v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v29 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Home reference was nil while removing all associated data", buf, 0xCu);
    }
    id v10 = (void *)MEMORY[0x263F58190];
    id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    uint64_t v5 = [v10 futureWithError:v4];
    goto LABEL_7;
  }
  if ([(HMDPersonCoreDataManager *)self shouldDispatchToPrimaryResident])
  {
    id v4 = [(HMDPersonCoreDataManager *)self residentSyncManager];
    uint64_t v5 = [v4 removeAllAssociatedData];
LABEL_7:
    id v11 = (id)v5;

    goto LABEL_11;
  }
  int v12 = (void *)MEMORY[0x230FBD990]();
  char v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Removing all associated data", buf, 0xCu);
  }
  id v16 = objc_alloc_init(MEMORY[0x263F58190]);
  id v17 = (void *)MEMORY[0x263F581B8];
  int v18 = [(HMDPersonCoreDataManager *)v13 workQueue];
  int v19 = [v17 schedulerWithDispatchQueue:v18];
  uint64_t v20 = [v16 reschedule:v19];

  uint64_t v21 = [(HMDPersonCoreDataManager *)v13 context];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __51__HMDPersonCoreDataManager_removeAllAssociatedData__block_invoke;
  v25[3] = &unk_264A2F2F8;
  v25[4] = v13;
  id v26 = v3;
  id v22 = v20;
  id v27 = v22;
  [v21 performBlock:v25];

  uint64_t v23 = v27;
  id v11 = v22;

LABEL_11:
  return v11;
}

void __51__HMDPersonCoreDataManager_removeAllAssociatedData__block_invoke(id *a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v2 = [a1[4] userUUID];

  if (v2)
  {
    if ([a1[5] isOwnerUser])
    {
      id v3 = [a1[4] userUUID];
      id v4 = +[HMCContext findUserWithModelID:v3];

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      uint64_t v5 = [v4 personsFromPhotos];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v45 objects:v55 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v46 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            id v11 = [a1[4] context];
            [v11 deleteObject:v10];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v45 objects:v55 count:16];
        }
        while (v7);
      }
    }
    else
    {
      int v19 = [a1[5] uuid];
      uint64_t v20 = [a1[4] context];
      uint64_t v21 = [v20 managedObjectContext];
      id v4 = +[MKFCKModel modelWithModelID:v19 context:v21 error:0];

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v5 = [v4 personsFromPhotos];
      uint64_t v22 = [v5 countByEnumeratingWithState:&v41 objects:v54 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v42 != v24) {
              objc_enumerationMutation(v5);
            }
            uint64_t v26 = *(void *)(*((void *)&v41 + 1) + 8 * j);
            id v27 = [a1[4] context];
            uint64_t v28 = [v27 managedObjectContext];
            [v28 deleteObject:v26];
          }
          uint64_t v23 = [v5 countByEnumeratingWithState:&v41 objects:v54 count:16];
        }
        while (v23);
      }
    }
  }
  else
  {
    int v12 = [a1[5] uuid];
    id v4 = +[HMCContext findHomeWithModelID:v12];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v5 = [v4 persons];
    uint64_t v13 = [v5 countByEnumeratingWithState:&v37 objects:v53 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v38;
      do
      {
        for (uint64_t k = 0; k != v14; ++k)
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(v5);
          }
          uint64_t v17 = *(void *)(*((void *)&v37 + 1) + 8 * k);
          int v18 = [a1[4] context];
          [v18 deleteObject:v17];
        }
        uint64_t v14 = [v5 countByEnumeratingWithState:&v37 objects:v53 count:16];
      }
      while (v14);
    }
  }

  v29 = [a1[4] context];
  id v36 = 0;
  int v30 = [v29 save:&v36];
  id v31 = v36;

  if (v30)
  {
    [a1[6] finishWithNoResult];
  }
  else
  {
    __int16 v32 = (void *)MEMORY[0x230FBD990]();
    id v33 = a1[4];
    uint64_t v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v50 = v35;
      __int16 v51 = 2112;
      id v52 = v31;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove all associated data: %@", buf, 0x16u);
    }
    [a1[6] finishWithError:v31];
  }
}

- (id)addOrUpdatePersons:(id)a3 andRemovePersonsWithUUIDs:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDPersonCoreDataManager *)self home];
  if (!v8)
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    int v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v32 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Home reference was nil while adding or updating persons", buf, 0xCu);
    }
    uint64_t v15 = (void *)MEMORY[0x263F58190];
    int v9 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    uint64_t v10 = [v15 futureWithError:v9];
    goto LABEL_7;
  }
  if ([(HMDPersonCoreDataManager *)self shouldDispatchToPrimaryResident])
  {
    int v9 = [(HMDPersonCoreDataManager *)self residentSyncManager];
    uint64_t v10 = [v9 addOrUpdatePersons:v6 andRemovePersonsWithUUIDs:v7];
LABEL_7:
    id v16 = (id)v10;

    goto LABEL_9;
  }
  id v17 = objc_alloc_init(MEMORY[0x263F58190]);
  int v18 = (void *)MEMORY[0x263F581B8];
  int v19 = [(HMDPersonCoreDataManager *)self workQueue];
  uint64_t v20 = [v18 schedulerWithDispatchQueue:v19];
  uint64_t v21 = [v17 reschedule:v20];

  uint64_t v22 = [(HMDPersonCoreDataManager *)self context];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __73__HMDPersonCoreDataManager_addOrUpdatePersons_andRemovePersonsWithUUIDs___block_invoke;
  v26[3] = &unk_264A2E610;
  id v27 = v6;
  uint64_t v28 = self;
  id v29 = v7;
  id v23 = v21;
  id v30 = v23;
  [v22 performBlock:v26];

  uint64_t v24 = v30;
  id v16 = v23;

LABEL_9:
  return v16;
}

void __73__HMDPersonCoreDataManager_addOrUpdatePersons_andRemovePersonsWithUUIDs___block_invoke(id *a1)
{
  v1 = a1;
  uint64_t v46 = *MEMORY[0x263EF8340];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v37 != v5) {
          objc_enumerationMutation(v2);
        }
        [v1[5] insertOrUpdatePersonUsingPerson:*(void *)(*((void *)&v36 + 1) + 8 * i)];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v4);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = v1[6];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    id v30 = v1;
    do
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        uint64_t v13 = [v1[5] personModelWithModelID:v12];
        if (v13)
        {
          uint64_t v14 = [v1[5] context];
          uint64_t v15 = [v14 managedObjectContext];
          [v15 deleteObject:v13];
        }
        else
        {
          id v16 = (void *)MEMORY[0x230FBD990]();
          id v17 = v1[5];
          int v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            uint64_t v19 = v9;
            uint64_t v20 = v10;
            v22 = id v21 = v7;
            *(_DWORD *)buf = 138543618;
            long long v41 = v22;
            __int16 v42 = 2112;
            id v43 = v12;
            _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@No person found with UUID %@, ignoring request to delete it.", buf, 0x16u);

            id v7 = v21;
            uint64_t v10 = v20;
            uint64_t v9 = v19;
            v1 = v30;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v9);
  }

  id v23 = [v1[5] context];
  id v31 = 0;
  int v24 = [v23 save:&v31];
  id v25 = v31;

  if (v24)
  {
    [v1[7] finishWithNoResult];
  }
  else
  {
    uint64_t v26 = (void *)MEMORY[0x230FBD990]();
    id v27 = v1[5];
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v41 = v29;
      __int16 v42 = 2112;
      id v43 = v25;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to add or update persons: %@", buf, 0x16u);
    }
    [v1[7] finishWithError:v25];
  }
}

- (void)enumeratePersonsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__252839;
  uint64_t v15 = __Block_byref_object_dispose__252840;
  id v16 = 0;
  uint64_t v5 = [(HMDPersonCoreDataManager *)self context];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__HMDPersonCoreDataManager_enumeratePersonsUsingBlock___block_invoke;
  v10[3] = &unk_264A2F0A0;
  v10[4] = self;
  v10[5] = &v11;
  [v5 unsafeSynchronousBlock:v10];

  id v6 = (void *)v12[5];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__HMDPersonCoreDataManager_enumeratePersonsUsingBlock___block_invoke_2;
  v8[3] = &unk_264A2CD30;
  id v7 = v4;
  id v9 = v7;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);

  _Block_object_dispose(&v11, 8);
}

void __55__HMDPersonCoreDataManager_enumeratePersonsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) persons];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __55__HMDPersonCoreDataManager_enumeratePersonsUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)personWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__252839;
  id v16 = __Block_byref_object_dispose__252840;
  id v17 = 0;
  uint64_t v5 = [(HMDPersonCoreDataManager *)self context];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__HMDPersonCoreDataManager_personWithUUID___block_invoke;
  v9[3] = &unk_264A2F698;
  uint64_t v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [v5 unsafeSynchronousBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __43__HMDPersonCoreDataManager_personWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) personWithModelID:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)configureWithDataSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDPersonCoreDataManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  [(HMDPersonCoreDataManager *)self setDataSource:v4];
  id v6 = [(HMDPersonCoreDataManager *)self notificationCenter];
  [v6 addObserver:self selector:sel_handleManagedObjectContextWillSaveNotification_ name:*MEMORY[0x263EFF058] object:0];

  id v7 = [(HMDPersonCoreDataManager *)self notificationCenter];
  [v7 addObserver:self selector:sel_handleManagedObjectContextDidSaveNotification_ name:*MEMORY[0x263EFF040] object:0];

  id v9 = [(HMDPersonCoreDataManager *)self residentSyncManager];
  uint64_t v8 = [(HMDPersonCoreDataManager *)self home];
  [v9 configureWithHome:v8 delegate:self];
}

- (HMDPersonCoreDataManager)initWithUUID:(id)a3 workQueue:(id)a4 home:(id)a5 userUUID:(id)a6 context:(id)a7 residentSyncManager:(id)a8 notificationCenter:(id)a9
{
  id v15 = a3;
  id v28 = a4;
  id v16 = a5;
  id v17 = a6;
  id v27 = a7;
  id v18 = a8;
  id v19 = a9;
  v29.receiver = self;
  v29.super_class = (Class)HMDPersonCoreDataManager;
  uint64_t v20 = [(HMDPersonCoreDataManager *)&v29 init];
  id v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_workQueue, a4);
    uint64_t v22 = objc_msgSend(v15, "copy", v27, v28);
    UUID = v21->_UUID;
    v21->_UUID = (NSUUID *)v22;

    objc_storeWeak((id *)&v21->_home, v16);
    uint64_t v24 = [v17 copy];
    userUUID = v21->_userUUID;
    v21->_userUUID = (NSUUID *)v24;

    objc_storeStrong((id *)&v21->_context, a7);
    objc_storeStrong((id *)&v21->_residentSyncManager, a8);
    objc_storeStrong((id *)&v21->_notificationCenter, a9);
  }

  return v21;
}

- (HMDPersonCoreDataManager)initWithUUID:(id)a3 workQueue:(id)a4 home:(id)a5 userUUID:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v11 backingStore];
  id v15 = [v14 context];

  id v16 = [HMDPersonResidentSyncManager alloc];
  id v17 = [v11 msgDispatcher];
  id v18 = [v11 residentSyncManager];
  id v19 = [(HMDPersonResidentSyncManager *)v16 initWithUUID:v13 messageDispatcher:v17 workQueue:v12 residentSyncManager:v18];

  uint64_t v20 = [MEMORY[0x263F08A00] defaultCenter];
  id v21 = [(HMDPersonCoreDataManager *)self initWithUUID:v13 workQueue:v12 home:v11 userUUID:v10 context:v15 residentSyncManager:v19 notificationCenter:v20];

  return v21;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t25_252852 != -1) {
    dispatch_once(&logCategory__hmf_once_t25_252852, &__block_literal_global_38_252853);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v26_252854;
  return v2;
}

void __39__HMDPersonCoreDataManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v26_252854;
  logCategory__hmf_once_v26_252854 = v0;
}

@end