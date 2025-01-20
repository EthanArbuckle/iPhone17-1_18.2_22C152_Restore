@interface HMDUserManagementOperationManager
+ (id)sharedManager;
+ (void)initialize;
+ (void)setSharedManager:(id)a3;
- (HMDHomeManager)homeManager;
- (HMDUserManagementOperationManager)init;
- (HMDUserManagementOperationManager)initWithOperations:(id)a3;
- (HMFTimer)saveTimer;
- (NSArray)operations;
- (NSHashTable)observedAccessories;
- (NSString)debugDescription;
- (NSString)description;
- (OS_dispatch_queue)clientQueue;
- (id)_filteredOperationsForAccessory:(id)a3;
- (id)_filteredOperationsWithDependency:(id)a3;
- (id)shortDescription;
- (void)__deregisterIfNeededForReachablityChangeNotificationsForAccessory:(id)a3;
- (void)__executeOperation:(id)a3;
- (void)__registerIfNeededForReachablityChangeNotifications;
- (void)__registerIfNeededForReachablityChangeNotificationsForAccessory:(id)a3;
- (void)__removeOperationAndProcessDependantOperations:(id)a3;
- (void)__save;
- (void)_cleanPriorOperations:(id)a3;
- (void)_handleAccessoryIsReachable:(id)a3;
- (void)_handleAddedOperation:(id)a3;
- (void)_handleRemovedOperation:(id)a3;
- (void)_reallySave;
- (void)addOperation:(id)a3;
- (void)cancelAllOperations;
- (void)dealloc;
- (void)operationCancelled:(id)a3;
- (void)operationStoppedBackingOff:(id)a3;
- (void)removeOperation:(id)a3;
- (void)removeOperationWithIdentifier:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDUserManagementOperationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedAccessories, 0);
  objc_storeStrong((id *)&self->_saveTimer, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_operations, 0);
}

- (NSHashTable)observedAccessories
{
  return self->_observedAccessories;
}

- (HMFTimer)saveTimer
{
  return self->_saveTimer;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUserManagementOperationManager *)self saveTimer];

  if (v5 == v4)
  {
    [(HMDUserManagementOperationManager *)self _reallySave];
  }
}

- (void)_reallySave
{
  v3 = [(HMDUserManagementOperationManager *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HMDUserManagementOperationManager__reallySave__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __48__HMDUserManagementOperationManager__reallySave__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  v3 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = HMFGetLogIdentifier();
    id v5 = [*(id *)(a1 + 32) shortDescription];
    v6 = [*(id *)(a1 + 32) operations];
    *(_DWORD *)buf = 138543874;
    v12 = v4;
    __int16 v13 = 2112;
    v14 = v5;
    __int16 v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1D49D5000, v3, OS_LOG_TYPE_INFO, "%{public}@[%@] Saving all pending operations: %@", buf, 0x20u);
  }
  v9 = @"HMDHomeManagerSaveReasonKey";
  v10 = @"HMDUserManagementOperationManagerSaveReason";
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"HMDHomeManagerSaveRequestNotificationKey" object:*(void *)(a1 + 32) userInfo:v7];
}

- (void)__save
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    v6 = [(HMDUserManagementOperationManager *)self shortDescription];
    int v8 = 138543618;
    v9 = v5;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@[%@] Kicking save timer", (uint8_t *)&v8, 0x16u);
  }
  v7 = [(HMDUserManagementOperationManager *)self saveTimer];
  [v7 resume];
}

- (void)__deregisterIfNeededForReachablityChangeNotificationsForAccessory:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDUserManagementOperationManager *)self observedAccessories];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = [(HMDUserManagementOperationManager *)self _filteredOperationsForAccessory:v4];
    if (![v7 count])
    {
      int v8 = (void *)MEMORY[0x1D9452090]();
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        __int16 v10 = HMFGetLogIdentifier();
        v11 = [(HMDUserManagementOperationManager *)self shortDescription];
        uint64_t v12 = [v4 name];
        int v15 = 138543874;
        v16 = v10;
        __int16 v17 = 2112;
        v18 = v11;
        __int16 v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@[%@] No longer observing accessory '%@' for reachability change notifications we we have no pending operations for this accessory", (uint8_t *)&v15, 0x20u);
      }
      __int16 v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 removeObserver:self name:@"HMDAccessoryIsReachableNotification" object:v4];

      v14 = [(HMDUserManagementOperationManager *)self observedAccessories];
      [v14 removeObject:v4];
    }
  }
}

- (void)__registerIfNeededForReachablityChangeNotificationsForAccessory:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDUserManagementOperationManager *)self observedAccessories];
  char v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1D9452090]();
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      __int16 v10 = [(HMDUserManagementOperationManager *)self shortDescription];
      v11 = [v4 name];
      int v14 = 138543874;
      int v15 = v9;
      __int16 v16 = 2112;
      __int16 v17 = v10;
      __int16 v18 = 2112;
      __int16 v19 = v11;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@[%@] Starting to observe accessory '%@' for reachability change notifications as we have pending operations for this accessory", (uint8_t *)&v14, 0x20u);
    }
    uint64_t v12 = [(HMDUserManagementOperationManager *)self observedAccessories];
    [v12 addObject:v4];

    __int16 v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:self selector:sel__handleAccessoryIsReachable_ name:@"HMDAccessoryIsReachableNotification" object:v4];
  }
}

- (void)__registerIfNeededForReachablityChangeNotifications
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(HMDUserManagementOperationManager *)self operations];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) accessory];
        [(HMDUserManagementOperationManager *)self __registerIfNeededForReachablityChangeNotificationsForAccessory:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_handleAccessoryIsReachable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDUserManagementOperationManager *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__HMDUserManagementOperationManager__handleAccessoryIsReachable___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__HMDUserManagementOperationManager__handleAccessoryIsReachable___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  v3 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = HMFGetLogIdentifier();
    uint64_t v5 = [*(id *)(a1 + 32) shortDescription];
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v29 = v4;
    __int16 v30 = 2112;
    v31 = v5;
    __int16 v32 = 2112;
    uint64_t v33 = v6;
    _os_log_impl(&dword_1D49D5000, v3, OS_LOG_TYPE_INFO, "%{public}@[%@] Received reachability notification: %@", buf, 0x20u);
  }
  uint64_t v7 = [*(id *)(a1 + 40) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) _filteredOperationsForAccessory:v7];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          __int16 v13 = (void *)MEMORY[0x1D9452090]();
          uint64_t v14 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            int v15 = HMFGetLogIdentifier();
            __int16 v16 = [*(id *)(a1 + 32) shortDescription];
            *(_DWORD *)buf = 138543874;
            v29 = v15;
            __int16 v30 = 2112;
            v31 = v16;
            __int16 v32 = 2112;
            uint64_t v33 = v12;
            _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@[%@] Processing ready operation due to accessory reachability change: %@", buf, 0x20u);
          }
          objc_msgSend(*(id *)(a1 + 32), "__executeOperation:", v12);
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }
  }
  else
  {
    __int16 v17 = (void *)MEMORY[0x1D9452090]();
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = HMFGetLogIdentifier();
      uint64_t v20 = [*(id *)(a1 + 32) shortDescription];
      uint64_t v21 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v29 = v19;
      __int16 v30 = 2112;
      v31 = v20;
      __int16 v32 = 2112;
      uint64_t v33 = v21;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Received invalid accessory reachability notification: %@", buf, 0x20u);
    }
  }
}

- (void)__removeOperationAndProcessDependantOperations:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    uint64_t v8 = [(HMDUserManagementOperationManager *)self shortDescription];
    uint64_t v9 = [v4 identifier];
    uint64_t v10 = [v9 UUIDString];
    *(_DWORD *)buf = 138543874;
    v28 = v7;
    __int16 v29 = 2112;
    __int16 v30 = v8;
    __int16 v31 = 2112;
    __int16 v32 = v10;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@[%@] Removing operation '%@' and processing any dependant operations", buf, 0x20u);
  }
  [(HMDUserManagementOperationManager *)self removeOperation:v4];
  uint64_t v20 = v4;
  [(HMDUserManagementOperationManager *)self _filteredOperationsWithDependency:v4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(obj);
        }
        int v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        __int16 v16 = (void *)MEMORY[0x1D9452090]();
        __int16 v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          __int16 v18 = HMFGetLogIdentifier();
          __int16 v19 = [(HMDUserManagementOperationManager *)self shortDescription];
          *(_DWORD *)buf = 138543874;
          v28 = v18;
          __int16 v29 = 2112;
          __int16 v30 = v19;
          __int16 v31 = 2112;
          __int16 v32 = v15;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@[%@] Processing dependant operation: %@", buf, 0x20u);
        }
        [(HMDUserManagementOperationManager *)self __executeOperation:v15];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }
}

- (void)__executeOperation:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isReady])
  {
    uint64_t v5 = (void *)MEMORY[0x1D9452090]();
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      uint64_t v8 = [(HMDUserManagementOperationManager *)self shortDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      int v15 = v8;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@[%@] Executing ready operation: %@", buf, 0x20u);
    }
    uint64_t v9 = [(HMDUserManagementOperationManager *)self clientQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__HMDUserManagementOperationManager___executeOperation___block_invoke;
    v10[3] = &unk_1E6A196E0;
    v10[4] = self;
    id v11 = v4;
    [v11 executeWithCompletionQueue:v9 completionHandler:v10];
  }
}

void __56__HMDUserManagementOperationManager___executeOperation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      uint64_t v7 = [*(id *)(a1 + 32) shortDescription];
      uint64_t v8 = [*(id *)(a1 + 40) identifier];
      uint64_t v9 = [v8 UUIDString];
      int v10 = 138544130;
      id v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      int v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Execution of operation '%@' failed with error: %@", (uint8_t *)&v10, 0x2Au);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "__removeOperationAndProcessDependantOperations:", *(void *)(a1 + 40));
  }
}

- (void)operationStoppedBackingOff:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDUserManagementOperationManager *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HMDUserManagementOperationManager_operationStoppedBackingOff___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __64__HMDUserManagementOperationManager_operationStoppedBackingOff___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__executeOperation:", *(void *)(a1 + 40));
}

- (void)operationCancelled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDUserManagementOperationManager *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__HMDUserManagementOperationManager_operationCancelled___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __56__HMDUserManagementOperationManager_operationCancelled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeOperation:*(void *)(a1 + 40)];
}

- (void)cancelAllOperations
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(HMDUserManagementOperationManager *)self operations];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) cancel];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_handleRemovedOperation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDUserManagementOperationManager *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__HMDUserManagementOperationManager__handleRemovedOperation___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__HMDUserManagementOperationManager__handleRemovedOperation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "__save");
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) accessory];
  objc_msgSend(v2, "__deregisterIfNeededForReachablityChangeNotificationsForAccessory:", v3);
}

- (void)removeOperation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    if ([(NSMutableArray *)self->_operations containsObject:v5])
    {
      [(NSMutableArray *)self->_operations removeObject:v5];
      [v5 setOperationManager:0];
      [(HMDUserManagementOperationManager *)self _handleRemovedOperation:v5];
    }
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v5;
  }
}

- (void)removeOperationWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = self->_operations;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          long long v10 = [v9 identifier];
          char v11 = [v10 isEqual:v4];

          if (v11)
          {
            id v12 = v9;

            if (v12)
            {
              [(NSMutableArray *)self->_operations removeObject:v12];
              [v12 setOperationManager:0];
              [(HMDUserManagementOperationManager *)self _handleRemovedOperation:v12];
            }
            goto LABEL_13;
          }
        }
        uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    id v12 = 0;
LABEL_13:

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_handleAddedOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUserManagementOperationManager *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HMDUserManagementOperationManager__handleAddedOperation___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __59__HMDUserManagementOperationManager__handleAddedOperation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "__save");
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) accessory];
  objc_msgSend(v2, "__registerIfNeededForReachablityChangeNotificationsForAccessory:", v3);

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  return objc_msgSend(v4, "__executeOperation:", v5);
}

- (void)addOperation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = v4;
    os_unfair_lock_lock_with_options();
    if (([(NSMutableArray *)self->_operations containsObject:v5] & 1) == 0
      && ([v5 isFinished] & 1) == 0)
    {
      [(HMDUserManagementOperationManager *)self _cleanPriorOperations:v5];
    }
    [(NSMutableArray *)self->_operations addObject:v5];
    [v5 setOperationManager:self];
    [(HMDUserManagementOperationManager *)self _handleAddedOperation:v5];
    os_unfair_lock_unlock(&self->_lock);
  }
  MEMORY[0x1F4181820]();
}

- (void)_cleanPriorOperations:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 user];
  __int16 v29 = [v5 pairingIdentity];

  v27 = v4;
  id v6 = [v4 accessory];
  uint64_t v7 = [v6 identifier];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v28 = self;
  id obj = (id)[(NSMutableArray *)self->_operations copy];
  uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v13 = [v12 accessory];
        long long v14 = [v13 identifier];
        if ([v7 isEqualToString:v14])
        {
          long long v15 = [v12 user];
          [v15 pairingIdentity];
          id v17 = v16 = v7;
          int v18 = [v29 isEqual:v17];

          uint64_t v7 = v16;
          if (!v18) {
            continue;
          }
          __int16 v19 = (void *)MEMORY[0x1D9452090]();
          uint64_t v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            uint64_t v21 = HMFGetLogIdentifier();
            long long v22 = [(HMDUserManagementOperationManager *)v28 shortDescription];
            *(_DWORD *)buf = 138543874;
            v37 = v21;
            __int16 v38 = 2112;
            v39 = v22;
            __int16 v40 = 2112;
            v41 = v12;
            _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@[%@] Dropping prior operation: %@", buf, 0x20u);
          }
          [(NSMutableArray *)v28->_operations removeObject:v12];
          [v12 setOperationManager:0];
          long long v23 = [(HMDUserManagementOperationManager *)v28 homeManager];
          long long v24 = [v23 backingStore];
          long long v25 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
          long long v13 = [v24 transaction:@"kUserManagementOperationRemovedKey" options:v25];

          long long v26 = [v12 modelObjectWithChangeType:3];
          [v13 add:v26];

          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __59__HMDUserManagementOperationManager__cleanPriorOperations___block_invoke;
          v31[3] = &unk_1E6A197F0;
          v31[4] = v28;
          [v13 save:v31];
          [(HMDUserManagementOperationManager *)v28 _handleRemovedOperation:v12];
        }
        else
        {
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v9);
  }
}

void __59__HMDUserManagementOperationManager__cleanPriorOperations___block_invoke(uint64_t a1)
{
  id v3 = [[HMDHomeSaveRequest alloc] initWithReason:@"kUserManagementOperationRemovedKey" information:0 postSyncNotification:0];
  v2 = [*(id *)(a1 + 32) homeManager];
  [v2 saveWithRequest:v3];
}

- (id)_filteredOperationsWithDependency:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDUserManagementOperationManager *)self operations];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (v12)
        {
          long long v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dependencies", (void)v17);
          int v14 = [v13 containsObject:v4];

          if (!v14) {
            continue;
          }
        }
        objc_msgSend(v6, "addObject:", v12, (void)v17);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  long long v15 = (void *)[v6 copy];
  return v15;
}

- (id)_filteredOperationsForAccessory:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDUserManagementOperationManager *)self operations];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (v4)
        {
          long long v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "accessory", (void)v17);
          int v14 = [v4 isEqual:v13];

          if (!v14) {
            continue;
          }
        }
        objc_msgSend(v6, "addObject:", v12, (void)v17);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  long long v15 = (void *)[v6 copy];
  return v15;
}

- (NSArray)operations
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_operations copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(HMDUserManagementOperationManager *)self operations];
  id v6 = [v3 stringWithFormat:@"<%@, Operations = %@>", v4, v5];

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(HMDUserManagementOperationManager *)self operations];
  id v6 = [v3 stringWithFormat:@"<%@ %p, Operations = %@>", v4, self, v5];

  return (NSString *)v6;
}

- (id)shortDescription
{
  return (id)[NSString stringWithFormat:@"%@", objc_opt_class()];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDUserManagementOperationManager;
  [(HMDUserManagementOperationManager *)&v4 dealloc];
}

- (HMDUserManagementOperationManager)initWithOperations:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)HMDUserManagementOperationManager;
  uint64_t v5 = [(HMDUserManagementOperationManager *)&v34 init];
  if (v5)
  {
    HMDispatchQueueNameString();
    id v6 = objc_claimAutoreleasedReturnValue();
    id v7 = (const char *)[v6 UTF8String];
    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create(v7, v8);
    clientQueue = v5->_clientQueue;
    v5->_clientQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:0 options:15.0];
    saveTimer = v5->_saveTimer;
    v5->_saveTimer = (HMFTimer *)v11;

    long long v13 = [(HMDUserManagementOperationManager *)v5 saveTimer];
    [v13 setDelegate:v5];

    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    operations = v5->_operations;
    v5->_operations = (NSMutableArray *)v14;

    long long v16 = [MEMORY[0x1E4F1CA48] array];
    if ([v4 count])
    {
      long long v17 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v18 = [v4 reverseObjectEnumerator];
      uint64_t v19 = [v18 nextObject];
      if (v19)
      {
        long long v20 = (void *)v19;
        do
        {
          if ([v20 isAuditOperation])
          {
            [v16 addObject:v20];
          }
          else
          {
            uint64_t v21 = [v20 user];
            uint64_t v22 = [v21 pairingIdentity];

            long long v23 = [v20 accessory];
            long long v24 = [v23 uuid];

            if (v22 && v24)
            {
              long long v25 = [v17 objectForKeyedSubscript:v24];
              if (!v25)
              {
                long long v25 = [MEMORY[0x1E4F1CA48] array];
                [v17 setObject:v25 forKeyedSubscript:v24];
              }
              if (([v25 containsObject:v22] & 1) == 0)
              {
                [v25 addObject:v22];
                [v16 addObject:v20];
              }
            }
          }
          uint64_t v26 = [v18 nextObject];

          long long v20 = (void *)v26;
        }
        while (v26);
      }
      v27 = [v16 reverseObjectEnumerator];
      uint64_t v28 = [v27 nextObject];
      if (v28)
      {
        __int16 v29 = (void *)v28;
        do
        {
          [(NSMutableArray *)v5->_operations addObject:v29];
          uint64_t v30 = [v27 nextObject];

          __int16 v29 = (void *)v30;
        }
        while (v30);
      }
    }
    uint64_t v31 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observedAccessories = v5->_observedAccessories;
    v5->_observedAccessories = (NSHashTable *)v31;

    [(HMDUserManagementOperationManager *)v5 __registerIfNeededForReachablityChangeNotifications];
  }

  return v5;
}

- (HMDUserManagementOperationManager)init
{
  return [(HMDUserManagementOperationManager *)self initWithOperations:0];
}

+ (void)setSharedManager:(id)a3
{
}

+ (id)sharedManager
{
  return (id)sharedManager;
}

+ (void)initialize
{
  v2 = objc_alloc_init(HMDUserManagementOperationManager);
  uint64_t v3 = sharedManager;
  sharedManager = (uint64_t)v2;
  MEMORY[0x1F41817F8](v2, v3);
}

@end