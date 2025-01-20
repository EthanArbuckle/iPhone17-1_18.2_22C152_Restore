@interface HMDAccessoryNetworkProtectionGroupRegistry
+ (id)logCategory;
- (BOOL)_evaluateActiveStatusForGroupWithUUID:(id)a3;
- (BOOL)_updateGroupWithUUID:(id)a3 active:(BOOL)a4;
- (BOOL)addActiveSurrogateGroup:(id)a3;
- (BOOL)updateTargetProtectionModeForGroupWithUUID:(id)a3 protectionMode:(int64_t)a4 error:(id *)a5;
- (BOOL)updateTargetProtectionModeForGroupWithUUID:(id)a3 protectionMode:(int64_t)a4 error:(id *)a5 requestMessage:(id)a6;
- (HMDAccessoryNetworkProtectionGroupRegistry)initWithHome:(id)a3 notificationCenter:(id)a4;
- (HMDAccessoryNetworkProtectionGroupRegistry)initWithHome:(id)a3 notificationCenter:(id)a4 persistedGroups:(id)a5;
- (HMDHome)home;
- (NSNotificationCenter)notificationCenter;
- (NSSet)activeGroups;
- (NSSet)persistedGroups;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)workQueue;
- (id)accessoriesForGroupWithUUID:(id)a3;
- (id)groupRecordWithUUID:(id)a3;
- (id)groupWithUUID:(id)a3;
- (id)logIdentifier;
- (id)markGroupWithUUID:(id)a3 active:(BOOL)a4;
- (id)removeGroupWithUUID:(id)a3;
- (int64_t)targetProtectionModeForGroupWithUUID:(id)a3;
- (void)_registerForAccessoryChanges:(id)a3;
- (void)_registerForMessages;
- (void)_setupActiveGroupsForHome;
- (void)_setupProtectionGroupForAccessory:(id)a3 shouldNotifyChange:(BOOL)a4;
- (void)addActiveSurrogateGroupForAccessory:(id)a3 shouldNotifyChange:(BOOL)a4;
- (void)configure;
- (void)handleAddOrUpdateAccessoryNetworkProtectionGroupModel:(id)a3 message:(id)a4;
- (void)handleAddedAccessory:(id)a3;
- (void)handleRemoveAccessoryNetworkProtectionGroupModel:(id)a3 message:(id)a4;
- (void)handleRemovedAccessory:(id)a3;
- (void)handleUpdateAccessoryNetworkProtectionGroupProtectionMode:(id)a3;
- (void)handleUpdatedAccessoryConfiguredNetworkProtectionGroup:(id)a3;
- (void)handleUpdatedAccessoryInitialManufacturerOrCategory:(id)a3;
- (void)notifyClientsOfAddedGroup:(id)a3;
- (void)notifyClientsOfRemovedGroup:(id)a3;
@end

@implementation HMDAccessoryNetworkProtectionGroupRegistry

- (int64_t)targetProtectionModeForGroupWithUUID:(id)a3
{
  v3 = [(HMDAccessoryNetworkProtectionGroupRegistry *)self groupWithUUID:a3];
  v4 = v3;
  if (v3) {
    int64_t v5 = [v3 targetProtectionMode];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)groupWithUUID:(id)a3
{
  v3 = [(HMDAccessoryNetworkProtectionGroupRegistry *)self groupRecordWithUUID:a3];
  v4 = [v3 group];

  return v4;
}

- (id)groupRecordWithUUID:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = [(NSMutableDictionary *)self->_groupRecords objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (NSSet)activeGroups
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int64_t v5 = [(NSMutableDictionary *)self->_groupRecords allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 isActive])
        {
          v10 = [v9 group];
          [v4 addObject:v10];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v11 = (void *)[v4 copy];
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_groupRecords, 0);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (id)accessoriesForGroupWithUUID:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(HMDAccessoryNetworkProtectionGroupRegistry *)self home];
  uint64_t v6 = [v5 accessories];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__HMDAccessoryNetworkProtectionGroupRegistry_accessoriesForGroupWithUUID___block_invoke;
  v10[3] = &unk_1E6A0C2F8;
  id v11 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "hmf_objectsPassingTest:", v10);

  return v8;
}

uint64_t __74__HMDAccessoryNetworkProtectionGroupRegistry_accessoriesForGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 networkProtectionGroupUUID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)updateTargetProtectionModeForGroupWithUUID:(id)a3 protectionMode:(int64_t)a4 error:(id *)a5 requestMessage:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (a5) {
    *a5 = 0;
  }
  v12 = [(HMDAccessoryNetworkProtectionGroupRegistry *)self groupRecordWithUUID:v10];
  long long v13 = v12;
  if (v12)
  {
    int v14 = [v12 isPersisted];
    long long v15 = [v13 group];
    long long v16 = v15;
    if (v14)
    {
      v17 = [v15 modelWithObjectChangeType:2];
      uint64_t v18 = @"Update network protection group protection mode";
    }
    else
    {
      v17 = [v15 modelForVersion:4];
      uint64_t v18 = @"Create network protection group";
    }

    v25 = (void *)MEMORY[0x1D9452090]();
    v26 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = HMFGetLogIdentifier();
      int v35 = 138543874;
      v36 = v28;
      __int16 v37 = 2048;
      int64_t v38 = a4;
      __int16 v39 = 2112;
      id v40 = v10;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Updating target protection mode to: %ld, on group with UUID:%@", (uint8_t *)&v35, 0x20u);
    }
    v29 = [NSNumber numberWithInteger:a4];
    [v17 setTargetProtectionMode:v29];

    v30 = +[HMDBackingStoreTransactionOptions optionsWithSource:1 destination:2 mustReplay:0 mustPush:0];
    v31 = [(HMDAccessoryNetworkProtectionGroupRegistry *)v26 home];
    v32 = [v31 backingStore];
    v33 = [v32 transaction:v18 options:v30];

    [v33 add:v17 withMessage:v11];
    [v33 run];
  }
  else
  {
    v19 = (void *)MEMORY[0x1D9452090]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      v23 = [v10 UUIDString];
      int v35 = 138543618;
      v36 = v22;
      __int16 v37 = 2112;
      int64_t v38 = (int64_t)v23;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot find network protection group with UUID %@", (uint8_t *)&v35, 0x16u);
    }
    v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    v17 = v24;
    if (a5) {
      *a5 = v24;
    }
    [v11 respondWithError:v17];
  }

  return v13 != 0;
}

- (BOOL)updateTargetProtectionModeForGroupWithUUID:(id)a3 protectionMode:(int64_t)a4 error:(id *)a5
{
  return [(HMDAccessoryNetworkProtectionGroupRegistry *)self updateTargetProtectionModeForGroupWithUUID:a3 protectionMode:a4 error:a5 requestMessage:0];
}

- (void)handleRemovedAccessory:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__HMDAccessoryNetworkProtectionGroupRegistry_handleRemovedAccessory___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __69__HMDAccessoryNetworkProtectionGroupRegistry_handleRemovedAccessory___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int64_t v5 = HMFGetLogIdentifier();
    id v6 = *(void **)(a1 + 40);
    int v23 = 138543618;
    v24 = v5;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Handling removed accessory: %@", (uint8_t *)&v23, 0x16u);
  }
  id v7 = *(id *)(a1 + 40);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    if (([v9 supportsNetworkProtection] & 1) == 0)
    {
      long long v13 = (void *)MEMORY[0x1D9452090]();
      id v14 = *(id *)(a1 + 32);
      long long v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        long long v16 = HMFGetLogIdentifier();
        int v23 = 138543362;
        v24 = v16;
        v17 = "%{public}@Accessory does not support network protection";
        uint64_t v18 = v15;
        os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
        uint32_t v20 = 12;
        goto LABEL_14;
      }
LABEL_17:

      goto LABEL_18;
    }
    id v10 = [v9 networkProtectionGroupUUID];

    if (!v10)
    {
      long long v13 = (void *)MEMORY[0x1D9452090]();
      id v14 = *(id *)(a1 + 32);
      long long v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v21 = HMFGetLogIdentifier();
        v22 = *(void **)(a1 + 40);
        int v23 = 138543618;
        v24 = v21;
        __int16 v25 = 2112;
        id v26 = v22;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@No network protection group UUID for removed accessory %@", (uint8_t *)&v23, 0x16u);
      }
      goto LABEL_17;
    }
    id v11 = *(void **)(a1 + 32);
    v12 = [v9 networkProtectionGroupUUID];
    LODWORD(v11) = [v11 _evaluateActiveStatusForGroupWithUUID:v12];

    if (v11)
    {
      long long v13 = (void *)MEMORY[0x1D9452090]();
      id v14 = *(id *)(a1 + 32);
      long long v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        long long v16 = HMFGetLogIdentifier();
        int v23 = 138543618;
        v24 = v16;
        __int16 v25 = 2112;
        id v26 = v9;
        v17 = "%{public}@Removed accessory %@ is not the last in the network protection group";
        uint64_t v18 = v15;
        os_log_type_t v19 = OS_LOG_TYPE_INFO;
        uint32_t v20 = 22;
LABEL_14:
        _os_log_impl(&dword_1D49D5000, v18, v19, v17, (uint8_t *)&v23, v20);

        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
LABEL_18:
}

- (void)handleAddedAccessory:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HMDAccessoryNetworkProtectionGroupRegistry_handleAddedAccessory___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __67__HMDAccessoryNetworkProtectionGroupRegistry_handleAddedAccessory___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v14 = 138543618;
    long long v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Handling added accessory: %@", (uint8_t *)&v14, 0x16u);
  }
  id v7 = *(id *)(a1 + 40);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    if ([v9 supportsNetworkProtection])
    {
      [*(id *)(a1 + 32) _registerForAccessoryChanges:v9];
      [*(id *)(a1 + 32) _setupProtectionGroupForAccessory:v9 shouldNotifyChange:1];
    }
    else
    {
      id v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = *(id *)(a1 + 32);
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        long long v13 = HMFGetLogIdentifier();
        int v14 = 138543362;
        long long v15 = v13;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Accessory does not support network protection", (uint8_t *)&v14, 0xCu);
      }
    }
  }
}

- (void)handleRemoveAccessoryNetworkProtectionGroupModel:(id)a3 message:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    v12 = [v6 uuid];
    long long v13 = [v12 UUIDString];
    int v25 = 138543618;
    id v26 = v11;
    __int16 v27 = 2112;
    v28 = v13;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling remove of accessory network group model %@", (uint8_t *)&v25, 0x16u);
  }
  int v14 = [v6 uuid];
  long long v15 = [(HMDAccessoryNetworkProtectionGroupRegistry *)v9 removeGroupWithUUID:v14];

  if (v15)
  {
    if ([v15 isActive])
    {
      __int16 v16 = [v15 group];
      [(HMDAccessoryNetworkProtectionGroupRegistry *)v9 notifyClientsOfRemovedGroup:v16];
    }
    uint64_t v17 = [v7 transactionResult];
    [v17 markChanged];

    [v7 respondWithPayload:0];
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x1D9452090]();
    os_log_type_t v19 = v9;
    uint32_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      v22 = [v6 uuid];
      int v23 = [v22 UUIDString];
      int v25 = 138543618;
      id v26 = v21;
      __int16 v27 = 2112;
      v28 = v23;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Accessory network protection group %@ doesn't exist to remove", (uint8_t *)&v25, 0x16u);
    }
    v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v7 respondWithError:v24];
  }
}

- (void)handleAddOrUpdateAccessoryNetworkProtectionGroupModel:(id)a3 message:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v42 = v11;
    __int16 v43 = 2112;
    id v44 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling add/update of accessory network protection group model: %@", buf, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  groupRecords = v9->_groupRecords;
  long long v13 = [v6 uuid];
  int v14 = [(NSMutableDictionary *)groupRecords objectForKeyedSubscript:v13];

  if (v14)
  {
    [v14 setPersisted:1];
    long long v15 = [v14 group];
    [v15 transactionObjectUpdated:0 newValues:v6 message:v7];

    os_unfair_lock_unlock(&v9->_lock);
    __int16 v16 = (void *)MEMORY[0x1D9452090]();
    uint64_t v17 = v9;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      os_log_type_t v19 = HMFGetLogIdentifier();
      uint32_t v20 = [v6 uuid];
      v21 = [v20 UUIDString];
      *(_DWORD *)buf = 138543618;
      v42 = v19;
      __int16 v43 = 2112;
      id v44 = v21;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Marked existing record for network protection group %@ as persisted", buf, 0x16u);
    }
  }
  else
  {
    v22 = [[HMDAccessoryNetworkProtectionGroup alloc] initWithModel:v6];
    int v23 = [(HMDAccessoryNetworkProtectionGroupRegistry *)v9 home];
    [(HMDAccessoryNetworkProtectionGroup *)v22 configureWithHome:v23];

    v24 = +[HMDAccessoryNetworkProtectionGroupRecord recordWithGroup:v22 active:0 persisted:1];
    int v25 = v9->_groupRecords;
    id v26 = [v6 uuid];
    [(NSMutableDictionary *)v25 setObject:v24 forKeyedSubscript:v26];

    os_unfair_lock_unlock(&v9->_lock);
    __int16 v27 = (void *)MEMORY[0x1D9452090]();
    v28 = v9;
    uint64_t v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = HMFGetLogIdentifier();
      v31 = [v6 uuid];
      v32 = [v31 UUIDString];
      *(_DWORD *)buf = 138543618;
      v42 = v30;
      __int16 v43 = 2112;
      id v44 = v32;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Added new inactive accessory network protection group model %@", buf, 0x16u);
    }
    v33 = [(HMDAccessoryNetworkProtectionGroupRegistry *)v28 workQueue];
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    __int16 v37 = __108__HMDAccessoryNetworkProtectionGroupRegistry_handleAddOrUpdateAccessoryNetworkProtectionGroupModel_message___block_invoke;
    int64_t v38 = &unk_1E6A197C8;
    __int16 v39 = v28;
    id v40 = v6;
    dispatch_async(v33, &v35);

    v34 = objc_msgSend(v7, "transactionResult", v35, v36, v37, v38, v39);
    [v34 markChanged];

    [v7 respondWithPayload:0];
  }
}

void __108__HMDAccessoryNetworkProtectionGroupRegistry_handleAddOrUpdateAccessoryNetworkProtectionGroupModel_message___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) uuid];
  [v1 _evaluateActiveStatusForGroupWithUUID:v2];
}

- (void)configure
{
  [(HMDAccessoryNetworkProtectionGroupRegistry *)self _setupActiveGroupsForHome];
  [(HMDAccessoryNetworkProtectionGroupRegistry *)self _registerForMessages];
}

- (void)addActiveSurrogateGroupForAccessory:(id)a3 shouldNotifyChange:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMDAccessoryNetworkProtectionGroupRegistry *)self home];
  id v8 = v6;
  id v9 = [v8 defaultNetworkProtectionGroupUUID];

  if (v9)
  {
    id v10 = [HMDAccessoryNetworkProtectionGroup alloc];
    id v11 = [v8 defaultNetworkProtectionGroupUUID];
    v12 = [v8 initialManufacturer];
    long long v13 = [v8 initialCategoryIdentifier];
    id v9 = [(HMDAccessoryNetworkProtectionGroup *)v10 initWithUUID:v11 manufacturer:v12 category:v13 targetProtectionMode:0];

    [(HMDAccessoryNetworkProtectionGroup *)v9 configureWithHome:v7];
  }

  int v14 = (void *)MEMORY[0x1D9452090]();
  long long v15 = self;
  __int16 v16 = HMFGetOSLogHandle();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (!v9)
  {
    if (v17)
    {
      __int16 v39 = HMFGetLogIdentifier();
      id v40 = [v8 name];
      v48 = [v8 uuid];
      uint64_t v41 = [v48 UUIDString];
      v42 = [v8 initialManufacturer];
      __int16 v43 = [v8 initialCategoryIdentifier];
      *(_DWORD *)buf = 138544386;
      v50 = v39;
      __int16 v51 = 2112;
      v52 = v40;
      __int16 v53 = 2112;
      id v54 = v41;
      __int16 v55 = 2112;
      v56 = v42;
      __int16 v57 = 2112;
      v58 = v43;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Unable to generate surrogate group due to missing information for accessory name: %@ UUID: %@ initialManufacturer: %@ initialCategory: %@ ", buf, 0x34u);
    }
    id v44 = v14;
    goto LABEL_21;
  }
  if (v17)
  {
    uint64_t v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v50 = v18;
    __int16 v51 = 2112;
    v52 = v9;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Attempting to add active surrogate network protection group: %@", buf, 0x16u);
  }
  os_log_type_t v19 = (void *)MEMORY[0x1D9452090]();
  uint32_t v20 = v15;
  v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = HMFGetLogIdentifier();
    int v23 = [(HMDAccessoryNetworkProtectionGroup *)v9 uuid];
    v24 = [(HMDAccessoryNetworkProtectionGroupRegistry *)v20 groupWithUUID:v23];
    *(_DWORD *)buf = 138543618;
    v50 = v22;
    __int16 v51 = 2112;
    v52 = v24;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Existing network protection group with matching UUID: %@", buf, 0x16u);
  }
  BOOL v25 = [(HMDAccessoryNetworkProtectionGroupRegistry *)v20 addActiveSurrogateGroup:v9];
  id v26 = (void *)MEMORY[0x1D9452090]();
  __int16 v27 = v20;
  v28 = HMFGetOSLogHandle();
  BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
  if (!v25)
  {
    if (v29)
    {
      uint64_t v45 = HMFGetLogIdentifier();
      v46 = [(HMDAccessoryNetworkProtectionGroup *)v9 uuid];
      v47 = [v46 UUIDString];
      *(_DWORD *)buf = 138543874;
      v50 = v45;
      __int16 v51 = 2112;
      v52 = v47;
      __int16 v53 = 2112;
      id v54 = v8;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@No change to status of network protection group %@ on behalf of %@", buf, 0x20u);
    }
    id v44 = v26;
LABEL_21:
    goto LABEL_22;
  }
  if (v29)
  {
    v30 = HMFGetLogIdentifier();
    v31 = [(HMDAccessoryNetworkProtectionGroup *)v9 uuid];
    v32 = [(HMDAccessoryNetworkProtectionGroupRegistry *)v27 groupWithUUID:v31];
    *(_DWORD *)buf = 138543618;
    v50 = v30;
    __int16 v51 = 2112;
    v52 = v32;
    _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Added and marked active network protection group: %@", buf, 0x16u);
  }
  if (v4)
  {
    v33 = [(HMDAccessoryNetworkProtectionGroup *)v9 uuid];
    v34 = [(HMDAccessoryNetworkProtectionGroupRegistry *)v27 groupWithUUID:v33];

    uint64_t v35 = (void *)MEMORY[0x1D9452090]();
    uint64_t v36 = v27;
    __int16 v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      int64_t v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v50 = v38;
      __int16 v51 = 2112;
      v52 = v34;
      _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Notifying for added network protection group %@", buf, 0x16u);
    }
    [(HMDAccessoryNetworkProtectionGroupRegistry *)v36 notifyClientsOfAddedGroup:v34];
  }
LABEL_22:
}

- (void)notifyClientsOfRemovedGroup:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(HMDAccessoryNetworkProtectionGroupRegistry *)self notificationCenter];
  uint64_t v18 = *MEMORY[0x1E4F2C478];
  v19[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  [v5 postNotificationName:@"HMDAccessoryNetworkProtectionGroupProtectionModeDeactivated" object:self userInfo:v6];

  id v7 = [(HMDAccessoryNetworkProtectionGroupRegistry *)self home];
  id v8 = (void *)MEMORY[0x1E4F654B0];
  uint64_t v9 = *MEMORY[0x1E4F2C498];
  id v10 = [v7 messageDestination];
  uint64_t v16 = *MEMORY[0x1E4F2C4A8];
  id v11 = [v4 uuid];
  v12 = [v11 UUIDString];
  BOOL v17 = v12;
  long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  int v14 = [v8 messageWithName:v9 destination:v10 payload:v13];

  [v14 setRequiresSPIEntitlement:1];
  long long v15 = [v7 msgDispatcher];
  [v15 sendMessage:v14 completionHandler:0];
}

- (void)notifyClientsOfAddedGroup:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(HMDAccessoryNetworkProtectionGroupRegistry *)self notificationCenter];
  uint64_t v18 = *MEMORY[0x1E4F2C478];
  uint64_t v6 = v18;
  v19[0] = v4;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  [v5 postNotificationName:@"HMDAccessoryNetworkProtectionGroupProtectionModeActivated" object:self userInfo:v7];

  id v8 = [(HMDAccessoryNetworkProtectionGroupRegistry *)self home];
  uint64_t v9 = (void *)MEMORY[0x1E4F654B0];
  uint64_t v10 = *MEMORY[0x1E4F2C460];
  id v11 = [v8 messageDestination];
  uint64_t v16 = v6;
  v12 = encodeRootObjectForSPIClients(v4);
  BOOL v17 = v12;
  long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  int v14 = [v9 messageWithName:v10 destination:v11 payload:v13];

  [v14 setRequiresSPIEntitlement:1];
  long long v15 = [v8 msgDispatcher];
  [v15 sendMessage:v14 completionHandler:0];
}

- (BOOL)_updateGroupWithUUID:(id)a3 active:(BOOL)a4
{
  uint64_t v4 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMDAccessoryNetworkProtectionGroupRegistry *)self groupWithUUID:v6];

  if (v7)
  {
    id v8 = [(HMDAccessoryNetworkProtectionGroupRegistry *)self groupRecordWithUUID:v6];
    int v9 = [v8 isActive];

    if (v9 != v4)
    {
      uint64_t v10 = [(HMDAccessoryNetworkProtectionGroupRegistry *)self markGroupWithUUID:v6 active:v4];
      id v11 = (void *)MEMORY[0x1D9452090]();
      v12 = self;
      long long v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = HMFGetLogIdentifier();
        long long v15 = HMFBooleanToString();
        uint64_t v16 = HMFBooleanToString();
        int v31 = 138544130;
        v32 = v14;
        __int16 v33 = 2112;
        id v34 = v10;
        __int16 v35 = 2112;
        uint64_t v36 = v15;
        __int16 v37 = 2112;
        int64_t v38 = v16;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Active status for group %@ changes from %@ to %@", (uint8_t *)&v31, 0x2Au);
      }
      if (v4)
      {
        BOOL v17 = (void *)MEMORY[0x1D9452090]([(HMDAccessoryNetworkProtectionGroupRegistry *)v12 notifyClientsOfAddedGroup:v10]);
        uint64_t v18 = v12;
        os_log_type_t v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint32_t v20 = HMFGetLogIdentifier();
          int v31 = 138543618;
          v32 = v20;
          __int16 v33 = 2112;
          id v34 = v10;
          v21 = "%{public}@Activated network protection group %@";
LABEL_16:
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v31, 0x16u);
        }
      }
      else
      {
        BOOL v17 = (void *)MEMORY[0x1D9452090]([(HMDAccessoryNetworkProtectionGroupRegistry *)v12 notifyClientsOfRemovedGroup:v10]);
        BOOL v29 = v12;
        os_log_type_t v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint32_t v20 = HMFGetLogIdentifier();
          int v31 = 138543618;
          v32 = v20;
          __int16 v33 = 2112;
          id v34 = v10;
          v21 = "%{public}@De-activated network protection group %@";
          goto LABEL_16;
        }
      }

      goto LABEL_18;
    }
    BOOL v25 = (void *)MEMORY[0x1D9452090]();
    id v26 = self;
    __int16 v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = HMFGetLogIdentifier();
      int v31 = 138543618;
      v32 = v28;
      __int16 v33 = 2112;
      id v34 = v6;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@No change in active status for group %@", (uint8_t *)&v31, 0x16u);
    }
  }
  else
  {
    uint64_t v4 = MEMORY[0x1D9452090]();
    v22 = self;
    int v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = HMFGetLogIdentifier();
      int v31 = 138543618;
      v32 = v24;
      __int16 v33 = 2112;
      id v34 = v6;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@No change to active status of group %@ that doesn't exist", (uint8_t *)&v31, 0x16u);
    }
    LOBYTE(v4) = 0;
  }
LABEL_18:

  return v4;
}

- (BOOL)_evaluateActiveStatusForGroupWithUUID:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D9452090]();
  int64_t v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v32 = v7;
    __int16 v33 = 2112;
    id v34 = v25;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@evaluating active status for groupUUID: %@", buf, 0x16u);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = [(HMDAccessoryNetworkProtectionGroupRegistry *)v5 home];
  int v9 = [v8 accessories];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(id *)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v14 = v13;
        }
        else {
          int v14 = 0;
        }
        id v15 = v14;

        if ([v15 supportsNetworkProtection])
        {
          uint64_t v16 = [v15 networkProtectionGroupUUID];
          int v17 = [v16 isEqual:v25];

          if (v17)
          {

            uint64_t v10 = 1;
            goto LABEL_19;
          }
        }
        else
        {
          uint64_t v18 = (void *)MEMORY[0x1D9452090]();
          os_log_type_t v19 = v5;
          uint32_t v20 = v5;
          v21 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            v22 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v32 = v22;
            _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Accessory does not support network protection", buf, 0xCu);
          }
          int64_t v5 = v19;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }
LABEL_19:

  BOOL v23 = [(HMDAccessoryNetworkProtectionGroupRegistry *)v5 _updateGroupWithUUID:v25 active:v10];
  return v23;
}

- (void)_setupProtectionGroupForAccessory:(id)a3 shouldNotifyChange:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  int v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    uint64_t v11 = [v6 uuid];
    v12 = [v11 UUIDString];
    id v13 = [v6 initialManufacturer];
    int v14 = [v6 initialCategoryIdentifier];
    int v25 = 138544130;
    long long v26 = v10;
    __int16 v27 = 2112;
    long long v28 = v12;
    __int16 v29 = 2112;
    v30 = v13;
    __int16 v31 = 2112;
    v32 = v14;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Setting up protection group for accessory %@ with initialManufacturer: %@ initialCategoryIdentifier: %@", (uint8_t *)&v25, 0x2Au);
  }
  if (isAccessoryInDefaultGroup(v6))
  {
    [(HMDAccessoryNetworkProtectionGroupRegistry *)v8 addActiveSurrogateGroupForAccessory:v6 shouldNotifyChange:v4];
  }
  else
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = v8;
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      os_log_type_t v19 = [v6 name];
      uint32_t v20 = [v6 uuid];
      v21 = [v20 UUIDString];
      v22 = [v6 networkProtectionGroupUUID];
      int v25 = 138544130;
      long long v26 = v18;
      __int16 v27 = 2112;
      long long v28 = v19;
      __int16 v29 = 2112;
      v30 = v21;
      __int16 v31 = 2112;
      v32 = v22;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Accessory %@/%@ is assigned to non-default group %@", (uint8_t *)&v25, 0x2Au);
    }
    BOOL v23 = [v6 networkProtectionGroupUUID];

    if (v23)
    {
      v24 = [v6 networkProtectionGroupUUID];
      [(HMDAccessoryNetworkProtectionGroupRegistry *)v16 _updateGroupWithUUID:v24 active:1];
    }
  }
}

- (void)_setupActiveGroupsForHome
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  BOOL v4 = self;
  int64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = NSNumber;
    id v8 = [(HMDAccessoryNetworkProtectionGroupRegistry *)v4 home];
    int v9 = [v8 accessories];
    uint64_t v10 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    uint64_t v11 = [(HMDAccessoryNetworkProtectionGroupRegistry *)v4 home];
    v12 = [v11 name];
    *(_DWORD *)buf = 138543874;
    long long v28 = v6;
    __int16 v29 = 2112;
    v30 = v10;
    __int16 v31 = 2112;
    v32 = v12;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Evaluating active network protection groups based on %@ existing accessories for home %@", buf, 0x20u);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = [(HMDAccessoryNetworkProtectionGroupRegistry *)v4 home];
  int v14 = [v13 accessories];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(id *)(*((void *)&v22 + 1) + 8 * v18);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint32_t v20 = v19;
        }
        else {
          uint32_t v20 = 0;
        }
        id v21 = v20;

        if ([v21 supportsNetworkProtection])
        {
          [(HMDAccessoryNetworkProtectionGroupRegistry *)v4 _registerForAccessoryChanges:v21];
          [(HMDAccessoryNetworkProtectionGroupRegistry *)v4 _setupProtectionGroupForAccessory:v21 shouldNotifyChange:0];
        }

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }
}

- (void)_registerForAccessoryChanges:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    int v9 = [v4 uuid];

    if (v9)
    {
      uint64_t v10 = [v4 uuid];
      [v10 getUUIDBytes:buf];
    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
    }
    long long v14 = *(_OWORD *)buf;
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 1040;
    *(_DWORD *)&buf[14] = 16;
    __int16 v16 = 2096;
    uint64_t v17 = &v14;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering for manufacturer, category and configured group update for accessory: %{uuid_t}.16P", buf, 0x1Cu);
  }
  uint64_t v11 = [(HMDAccessoryNetworkProtectionGroupRegistry *)v6 notificationCenter];
  [v11 addObserver:v6 selector:sel_handleUpdatedAccessoryInitialManufacturerOrCategory_ name:@"HMDAccessoryManufacturerUpdatedNotification" object:v4];

  v12 = [(HMDAccessoryNetworkProtectionGroupRegistry *)v6 notificationCenter];
  [v12 addObserver:v6 selector:sel_handleUpdatedAccessoryInitialManufacturerOrCategory_ name:@"HMDAccessoryCategoryUpdatedNotification" object:v4];

  id v13 = [(HMDAccessoryNetworkProtectionGroupRegistry *)v6 notificationCenter];
  [v13 addObserver:v6 selector:sel_handleUpdatedAccessoryConfiguredNetworkProtectionGroup_ name:@"HMDAccessoryConfiguredNetworkProtectionGroupUpdatedNotification" object:v4];
}

- (void)handleUpdatedAccessoryConfiguredNetworkProtectionGroup:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling UpdatedAccessoryConfiguredNetworkProtectionGroup", buf, 0xCu);
  }
  int v9 = [(HMDAccessoryNetworkProtectionGroupRegistry *)v6 workQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __101__HMDAccessoryNetworkProtectionGroupRegistry_handleUpdatedAccessoryConfiguredNetworkProtectionGroup___block_invoke;
  v11[3] = &unk_1E6A197C8;
  id v12 = v4;
  id v13 = v6;
  id v10 = v4;
  dispatch_async(v9, v11);
}

void __101__HMDAccessoryNetworkProtectionGroupRegistry_handleUpdatedAccessoryConfiguredNetworkProtectionGroup___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    int64_t v5 = [*(id *)(a1 + 32) userInfo];
    id v6 = [v5 objectForKeyedSubscript:@"HMDAccessoryPreviousConfiguredNetworkProtectionGroupUUIDKey"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    int v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      uint64_t v16 = [v4 name];
      uint64_t v18 = [v4 uuid];
      id v12 = [v18 UUIDString];
      [v8 UUIDString];
      id v13 = v19 = v9;
      long long v14 = [v4 networkProtectionGroupUUID];
      uint64_t v15 = [v14 UUIDString];
      *(_DWORD *)buf = 138544386;
      id v21 = v17;
      __int16 v22 = 2112;
      long long v23 = v16;
      __int16 v24 = 2112;
      long long v25 = v12;
      __int16 v26 = 2112;
      __int16 v27 = v13;
      __int16 v28 = 2112;
      __int16 v29 = v15;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Accessory %@/%@ is leaving group %@ and joining group %@", buf, 0x34u);

      int v9 = v19;
    }

    if (v8) {
      [*(id *)(a1 + 40) _evaluateActiveStatusForGroupWithUUID:v8];
    }
    [*(id *)(a1 + 40) _setupProtectionGroupForAccessory:v4 shouldNotifyChange:1];
  }
}

- (void)handleUpdatedAccessoryInitialManufacturerOrCategory:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling UpdatedAccessoryInitialManufacturerOrCategory", buf, 0xCu);
  }
  int v9 = [(HMDAccessoryNetworkProtectionGroupRegistry *)v6 workQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98__HMDAccessoryNetworkProtectionGroupRegistry_handleUpdatedAccessoryInitialManufacturerOrCategory___block_invoke;
  v11[3] = &unk_1E6A197C8;
  id v12 = v4;
  id v13 = v6;
  id v10 = v4;
  dispatch_async(v9, v11);
}

void __98__HMDAccessoryNetworkProtectionGroupRegistry_handleUpdatedAccessoryInitialManufacturerOrCategory___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    int64_t v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 40);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = [v4 name];
      id v10 = [v4 uuid];
      uint64_t v11 = [v10 UUIDString];
      id v12 = [v4 initialManufacturer];
      [v4 initialCategoryIdentifier];
      id v13 = v22 = v5;
      *(_DWORD *)buf = 138544386;
      __int16 v24 = v8;
      __int16 v25 = 2112;
      __int16 v26 = v9;
      __int16 v27 = 2112;
      __int16 v28 = v11;
      __int16 v29 = 2112;
      uint64_t v30 = v12;
      __int16 v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Accessory %@/%@ has updated initialManufacturer: %@, initialCategory: %@", buf, 0x34u);

      int64_t v5 = v22;
    }

    if (isAccessoryInDefaultGroup(v4))
    {
      [*(id *)(a1 + 40) addActiveSurrogateGroupForAccessory:v4 shouldNotifyChange:1];
    }
    else
    {
      long long v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = *(id *)(a1 + 40);
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        uint64_t v18 = [v4 name];
        id v19 = [v4 uuid];
        uint32_t v20 = [v19 UUIDString];
        id v21 = [v4 networkProtectionGroupUUID];
        *(_DWORD *)buf = 138544130;
        __int16 v24 = v17;
        __int16 v25 = 2112;
        __int16 v26 = v18;
        __int16 v27 = 2112;
        __int16 v28 = v20;
        __int16 v29 = 2112;
        uint64_t v30 = v21;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Accessory %@/%@ is assigned to non-default group %@", buf, 0x2Au);
      }
    }
  }
}

- (void)handleUpdateAccessoryNetworkProtectionGroupProtectionMode:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v30 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling UpdateAccessoryNetworkProtectionGroupProtectionMode", buf, 0xCu);
  }
  int v9 = [(HMDAccessoryNetworkProtectionGroupRegistry *)v6 home];
  char v10 = [v9 networkRouterSupport];

  if ((v10 & 2) != 0)
  {
    uint64_t v16 = [v4 uuidForKey:*MEMORY[0x1E4F2C4A8]];
    if (v16)
    {
      uint64_t v17 = [v4 numberForKey:*MEMORY[0x1E4F2C488]];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v28 = 0;
        -[HMDAccessoryNetworkProtectionGroupRegistry updateTargetProtectionModeForGroupWithUUID:protectionMode:error:requestMessage:](v6, "updateTargetProtectionModeForGroupWithUUID:protectionMode:error:requestMessage:", v16, [v17 integerValue], &v28, v4);
      }
      else
      {
        long long v23 = (void *)MEMORY[0x1D9452090]();
        __int16 v24 = v6;
        __int16 v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          __int16 v26 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v30 = v26;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Received update group network protection mode with nil for protection mode", buf, 0xCu);
        }
        __int16 v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
        [v4 respondWithError:v27];

        uint64_t v18 = 0;
      }
    }
    else
    {
      id v19 = (void *)MEMORY[0x1D9452090]();
      uint32_t v20 = v6;
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __int16 v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v30 = v22;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Received update group network protection mode with nil for group UUID", buf, 0xCu);
      }
      uint64_t v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v4 respondWithError:v18];
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = v6;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      long long v14 = HMFGetLogIdentifier();
      id v15 = +[HMDHomeKitVersion currentVersion];
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v14;
      __int16 v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@HomeKit version %@ does not meet the minimum version required to support network protection group update", buf, 0x16u);
    }
    uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v16];
  }
}

- (void)_registerForMessages
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryNetworkProtectionGroupRegistry *)self home];
  id v4 = [v3 administratorHandler];
  uint64_t v5 = *MEMORY[0x1E4F2C490];
  id v6 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v9[0] = v6;
  id v7 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  v9[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  [v4 registerForMessage:v5 receiver:self policies:v8 selector:sel_handleUpdateAccessoryNetworkProtectionGroupProtectionMode_];
}

- (NSUUID)messageTargetUUID
{
  id v2 = [(HMDAccessoryNetworkProtectionGroupRegistry *)self home];
  id v3 = [v2 messageTargetUUID];

  return (NSUUID *)v3;
}

- (id)logIdentifier
{
  id v2 = [(HMDAccessoryNetworkProtectionGroupRegistry *)self home];
  id v3 = [v2 uuid];
  id v4 = [v3 UUIDString];

  return v4;
}

- (id)markGroupWithUUID:(id)a3 active:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  p_lock = &self->_lock;
  uint64_t v8 = os_unfair_lock_lock_with_options();
  int v9 = (void *)MEMORY[0x1D9452090](v8);
  char v10 = self;
  HMFGetOSLogHandle();
  uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = HMFBooleanToString();
    int v18 = 138543874;
    id v19 = v12;
    __int16 v20 = 2112;
    id v21 = v13;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Marking group as active: %@, group: %@", (uint8_t *)&v18, 0x20u);
  }
  long long v14 = [(NSMutableDictionary *)v10->_groupRecords objectForKeyedSubscript:v6];
  id v15 = [v14 group];

  uint64_t v16 = [(NSMutableDictionary *)v10->_groupRecords objectForKeyedSubscript:v6];
  [v16 setActive:v4];

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)removeGroupWithUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  uint64_t v6 = os_unfair_lock_lock_with_options();
  id v7 = (void *)MEMORY[0x1D9452090](v6);
  uint64_t v8 = self;
  HMFGetOSLogHandle();
  int v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    char v10 = HMFGetLogIdentifier();
    int v13 = 138543618;
    long long v14 = v10;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing group with UUID: %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v11 = [(NSMutableDictionary *)v8->_groupRecords objectForKeyedSubscript:v4];
  if (v11) {
    [(NSMutableDictionary *)v8->_groupRecords removeObjectForKey:v4];
  }
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (BOOL)addActiveSurrogateGroup:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  uint64_t v6 = os_unfair_lock_lock_with_options();
  id v7 = (void *)MEMORY[0x1D9452090](v6);
  uint64_t v8 = self;
  HMFGetOSLogHandle();
  int v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    char v10 = HMFGetLogIdentifier();
    int v22 = 138543618;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Adding active surrogate group: %@", (uint8_t *)&v22, 0x16u);
  }
  groupRecords = v8->_groupRecords;
  id v12 = [v4 uuid];
  int v13 = [(NSMutableDictionary *)groupRecords objectForKeyedSubscript:v12];

  if (v13)
  {
    long long v14 = v8->_groupRecords;
    __int16 v15 = [v4 uuid];
    id v16 = [(NSMutableDictionary *)v14 objectForKeyedSubscript:v15];

    char v17 = [v16 isActive];
    if ((v17 & 1) == 0) {
      [v16 setActive:1];
    }
    char v18 = v17 ^ 1;
  }
  else
  {
    id v16 = +[HMDAccessoryNetworkProtectionGroupRecord recordWithGroup:v4 active:1 persisted:0];
    id v19 = v8->_groupRecords;
    __int16 v20 = [v4 uuid];
    [(NSMutableDictionary *)v19 setObject:v16 forKeyedSubscript:v20];

    char v18 = 1;
  }

  os_unfair_lock_unlock(p_lock);
  return v18;
}

- (NSSet)persistedGroups
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_groupRecords allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 isPersisted])
        {
          char v10 = [v9 group];
          [v4 addObject:v10];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  uint64_t v11 = (void *)[v4 copy];
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v11;
}

- (HMDAccessoryNetworkProtectionGroupRegistry)initWithHome:(id)a3 notificationCenter:(id)a4 persistedGroups:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMDAccessoryNetworkProtectionGroupRegistry *)self initWithHome:v8 notificationCenter:v9];
  id v12 = v11;
  if (v10 && v11)
  {
    id v36 = v10;
    id v37 = v9;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    obuint64_t j = v10;
    uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    int64_t v38 = v12;
    id v39 = v8;
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v42 != v15) {
            objc_enumerationMutation(obj);
          }
          char v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v18 = (void *)MEMORY[0x1D9452090]();
          id v19 = v12;
          __int16 v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            id v21 = HMFGetLogIdentifier();
            int v22 = [v8 uuid];
            id v23 = [v22 UUIDString];
            *(_DWORD *)buf = 138543874;
            __int16 v51 = v21;
            __int16 v52 = 2112;
            __int16 v53 = v23;
            __int16 v54 = 2112;
            __int16 v55 = v17;
            _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Loading persisted group: %@", buf, 0x20u);

            id v12 = v38;
            id v8 = v39;
          }
          [v17 configureWithHome:v8];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v14);
    }

    id v24 = obj;
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
    id v25 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v26 = v24;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:buf count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v46 != v29) {
            objc_enumerationMutation(v26);
          }
          __int16 v31 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          v32 = +[HMDAccessoryNetworkProtectionGroupRecord recordWithGroup:active:persisted:](HMDAccessoryNetworkProtectionGroupRecord, "recordWithGroup:active:persisted:", v31, 0, 1, v36, v37);
          uint64_t v33 = [v31 uuid];
          [(NSMutableDictionary *)v25 setObject:v32 forKeyedSubscript:v33];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v45 objects:buf count:16];
      }
      while (v28);
    }

    id v12 = v38;
    groupRecords = v38->_groupRecords;
    v38->_groupRecords = v25;

    id v8 = v39;
    id v10 = v36;
    id v9 = v37;
  }

  return v12;
}

- (HMDAccessoryNetworkProtectionGroupRegistry)initWithHome:(id)a3 notificationCenter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDAccessoryNetworkProtectionGroupRegistry;
  id v8 = [(HMDAccessoryNetworkProtectionGroupRegistry *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    groupRecords = v8->_groupRecords;
    v8->_groupRecords = (NSMutableDictionary *)v9;

    objc_storeWeak((id *)&v8->_home, v6);
    objc_storeStrong((id *)&v8->_notificationCenter, a4);
    uint64_t v11 = [v6 workQueue];
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v11;
  }
  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_57736 != -1) {
    dispatch_once(&logCategory__hmf_once_t10_57736, &__block_literal_global_57737);
  }
  id v2 = (void *)logCategory__hmf_once_v11_57738;
  return v2;
}

uint64_t __57__HMDAccessoryNetworkProtectionGroupRegistry_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v11_57738;
  logCategory__hmf_once_v11_57738 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end