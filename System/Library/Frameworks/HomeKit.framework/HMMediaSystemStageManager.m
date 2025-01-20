@interface HMMediaSystemStageManager
+ (id)logCategory;
- (BOOL)mergeMediaSystems:(id)a3 withHome:(id)a4 context:(id)a5;
- (HMFTimerManager)addedMediaSystemTimerManager;
- (HMFTimerManager)removedMediaSystemTimerManager;
- (HMMediaSystemStageManager)initWithIdentifier:(id)a3 mediaSystems:(id)a4;
- (HMMediaSystemStageManager)initWithIdentifier:(id)a3 mediaSystems:(id)a4 addedMediaSystemTimerManager:(id)a5 removedMediaSystemTimerManager:(id)a6;
- (HMMediaSystemStageManagerDataSource)dataSource;
- (NSArray)mediaSystems;
- (NSUUID)identifier;
- (id)committedMediaSystems;
- (id)dataSourceContext;
- (id)dataSourceHome;
- (id)logIdentifier;
- (id)mediaSystemWithUUID:(id)a3;
- (id)mediaSystemWithUniqueIdentifier:(id)a3;
- (void)configureWithHome:(id)a3 context:(id)a4;
- (void)notifyDelegateOfAddedMediaSystem:(id)a3;
- (void)notifyDelegateOfAddedMediaSystem:(id)a3 usingHome:(id)a4 context:(id)a5;
- (void)notifyDelegateOfRemovedMediaSystem:(id)a3;
- (void)notifyDelegateOfRemovedMediaSystem:(id)a3 usingHome:(id)a4 context:(id)a5;
- (void)postConfigure;
- (void)setCommittedMediaSystems:(id)a3;
- (void)setDataSource:(id)a3;
- (void)stageAddedMediaSystem:(id)a3;
- (void)stageRemovedMediaSystemUUID:(id)a3;
- (void)timerManager:(id)a3 didFireForTimerContext:(id)a4;
- (void)unconfigure;
- (void)unstageAndCommitMediaSystemWithUUID:(id)a3;
- (void)unstageAndCommitMediaSystems:(id)a3;
- (void)unstageExpiredStagedAddedMediaSystemUUID:(id)a3;
- (void)unstageExpiredStagedRemovedMediaSystemUUID:(id)a3;
@end

@implementation HMMediaSystemStageManager

- (void)postConfigure
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(HMMediaSystemStageManager *)self mediaSystems];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) postConfigure];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (NSArray)mediaSystems
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = (void *)[(NSMutableDictionary *)self->_committedMediaSystemsMap mutableCopy];
  uint64_t v5 = [(NSMutableDictionary *)self->_stagedAddedMediaSystemsMap allValues];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __41__HMMediaSystemStageManager_mediaSystems__block_invoke;
  v16[3] = &unk_1E593F930;
  id v6 = v4;
  id v17 = v6;
  objc_msgSend(v5, "na_each:", v16);

  stagedRemovedMediaSystemUUIDs = self->_stagedRemovedMediaSystemUUIDs;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __41__HMMediaSystemStageManager_mediaSystems__block_invoke_2;
  v14 = &unk_1E593F958;
  id v8 = v6;
  id v15 = v8;
  [(NSMutableSet *)stagedRemovedMediaSystemUUIDs na_each:&v11];
  long long v9 = objc_msgSend(v8, "allValues", v11, v12, v13, v14);

  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v9;
}

- (void)setDataSource:(id)a3
{
}

- (HMMediaSystemStageManager)initWithIdentifier:(id)a3 mediaSystems:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F65588];
  id v7 = a4;
  id v8 = a3;
  long long v9 = (void *)[[v6 alloc] initWithOptions:2];
  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F65588]) initWithOptions:2];
  uint64_t v11 = [(HMMediaSystemStageManager *)self initWithIdentifier:v8 mediaSystems:v7 addedMediaSystemTimerManager:v9 removedMediaSystemTimerManager:v10];

  return v11;
}

- (HMMediaSystemStageManager)initWithIdentifier:(id)a3 mediaSystems:(id)a4 addedMediaSystemTimerManager:(id)a5 removedMediaSystemTimerManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  id v15 = v14;
  if (!v14)
  {
LABEL_11:
    v26 = (HMAccessControl *)_HMFPreconditionFailure();
    return (HMMediaSystemStageManager *)[(HMAccessControl *)v26 initWithUser:v28];
  }
  v29.receiver = self;
  v29.super_class = (Class)HMMediaSystemStageManager;
  v16 = [(HMMediaSystemStageManager *)&v29 init];
  id v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    v18 = objc_msgSend(v12, "na_dictionaryWithKeyGenerator:", &__block_literal_global_15239);
    uint64_t v19 = [v18 mutableCopy];
    committedMediaSystemsMap = v17->_committedMediaSystemsMap;
    v17->_committedMediaSystemsMap = (NSMutableDictionary *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
    stagedAddedMediaSystemsMap = v17->_stagedAddedMediaSystemsMap;
    v17->_stagedAddedMediaSystemsMap = (NSMutableDictionary *)v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
    stagedRemovedMediaSystemUUIDs = v17->_stagedRemovedMediaSystemUUIDs;
    v17->_stagedRemovedMediaSystemUUIDs = (NSMutableSet *)v23;

    objc_storeStrong((id *)&v17->_addedMediaSystemTimerManager, a5);
    objc_storeStrong((id *)&v17->_removedMediaSystemTimerManager, a6);
  }

  return v17;
}

- (void)configureWithHome:(id)a3 context:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [(HMMediaSystemStageManager *)self mediaSystems];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12++), "__configureWithContext:home:", v7, v6);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [(HMFTimerManager *)self->_addedMediaSystemTimerManager setDelegate:self];
  [(HMFTimerManager *)self->_removedMediaSystemTimerManager setDelegate:self];
  id v13 = [v7 queue];
  [(HMFTimerManager *)self->_addedMediaSystemTimerManager setDelegateQueue:v13];

  id v14 = [v7 queue];
  [(HMFTimerManager *)self->_removedMediaSystemTimerManager setDelegateQueue:v14];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedMediaSystemTimerManager, 0);
  objc_storeStrong((id *)&self->_addedMediaSystemTimerManager, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_stagedRemovedMediaSystemUUIDs, 0);
  objc_storeStrong((id *)&self->_stagedAddedMediaSystemsMap, 0);

  objc_storeStrong((id *)&self->_committedMediaSystemsMap, 0);
}

- (HMFTimerManager)removedMediaSystemTimerManager
{
  return (HMFTimerManager *)objc_getProperty(self, a2, 64, 1);
}

- (HMFTimerManager)addedMediaSystemTimerManager
{
  return (HMFTimerManager *)objc_getProperty(self, a2, 56, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (HMMediaSystemStageManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (HMMediaSystemStageManagerDataSource *)WeakRetained;
}

- (void)timerManager:(id)a3 didFireForTimerContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    id v11 = [(HMMediaSystemStageManager *)self addedMediaSystemTimerManager];

    if (v11 == v6)
    {
      [(HMMediaSystemStageManager *)self unstageExpiredStagedAddedMediaSystemUUID:v10];
    }
    else
    {
      id v12 = [(HMMediaSystemStageManager *)self removedMediaSystemTimerManager];

      if (v12 == v6) {
        [(HMMediaSystemStageManager *)self unstageExpiredStagedRemovedMediaSystemUUID:v10];
      }
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = self;
    long long v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      long long v16 = HMFGetLogIdentifier();
      int v17 = 138543618;
      long long v18 = v16;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media system uuid from timer context: %@", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (id)logIdentifier
{
  v2 = [(HMMediaSystemStageManager *)self identifier];
  uint64_t v3 = [v2 UUIDString];

  return v3;
}

- (id)dataSourceContext
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMMediaSystemStageManager *)self dataSource];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 contextForMediaSystemStageManager:self];
  }
  else
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v9;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source context due to no data source", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)dataSourceHome
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMMediaSystemStageManager *)self dataSource];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 homeForMediaSystemStageManager:self];
  }
  else
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v9;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source home due to no data source", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)notifyDelegateOfRemovedMediaSystem:(id)a3 usingHome:(id)a4 context:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v10 delegateCaller];
  if (v11)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __82__HMMediaSystemStageManager_notifyDelegateOfRemovedMediaSystem_usingHome_context___block_invoke;
    v16[3] = &unk_1E5945650;
    void v16[4] = self;
    id v17 = v8;
    id v18 = v9;
    [v11 invokeBlock:v16];
  }
  else
  {
    id v12 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      long long v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v20 = v15;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Failed to notify client of did removed media system due to no delegate caller for context: %@", buf, 0x16u);
    }
  }
}

void __82__HMMediaSystemStageManager_notifyDelegateOfRemovedMediaSystem_usingHome_context___block_invoke(id *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  uint64_t v3 = [a1[5] uuid];
  uint64_t v4 = [v2 mediaSystemWithUUID:v3];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = a1[4];
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [a1[5] uuid];
      int v18 = 138543618;
      __int16 v19 = v8;
      __int16 v20 = 2112;
      __int16 v21 = v9;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping remove notification due to existing media system: %@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    id v10 = [a1[6] delegate];
    if ([v10 conformsToProtocol:&unk_1EEF70488]) {
      int v11 = v10;
    }
    else {
      int v11 = 0;
    }
    id v12 = v11;

    uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = a1[4];
    long long v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      long long v16 = HMFGetLogIdentifier();
      id v17 = a1[5];
      int v18 = 138543874;
      __int16 v19 = v16;
      __int16 v20 = 2112;
      __int16 v21 = v17;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did remove media system: %@ with delegate: %@", (uint8_t *)&v18, 0x20u);
    }
    if (objc_opt_respondsToSelector()) {
      [v12 home:a1[6] didRemoveMediaSystem:a1[5]];
    }
  }
}

- (void)notifyDelegateOfRemovedMediaSystem:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMMediaSystemStageManager *)self dataSourceHome];
  uint64_t v6 = [(HMMediaSystemStageManager *)self dataSourceContext];
  id v7 = (void *)v6;
  if (v5 && v6)
  {
    [(HMMediaSystemStageManager *)self notifyDelegateOfRemovedMediaSystem:v4 usingHome:v5 context:v6];
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      id v12 = [v4 uuid];
      uint64_t v13 = [v5 uuid];
      int v14 = 138544130;
      long long v15 = v11;
      __int16 v16 = 2112;
      id v17 = v12;
      __int16 v18 = 2112;
      __int16 v19 = v13;
      __int16 v20 = 2112;
      __int16 v21 = v7;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of removed media system: %@ due to no home: %@ context: %@", (uint8_t *)&v14, 0x2Au);
    }
  }
}

- (void)notifyDelegateOfAddedMediaSystem:(id)a3 usingHome:(id)a4 context:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v10 delegateCaller];
  if (v11)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __80__HMMediaSystemStageManager_notifyDelegateOfAddedMediaSystem_usingHome_context___block_invoke;
    v16[3] = &unk_1E5945650;
    void v16[4] = self;
    id v17 = v8;
    id v18 = v9;
    [v11 invokeBlock:v16];
  }
  else
  {
    id v12 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v13 = self;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      long long v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v20 = v15;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of added media system due to no delegate caller provided by context: %@", buf, 0x16u);
    }
  }
}

void __80__HMMediaSystemStageManager_notifyDelegateOfAddedMediaSystem_usingHome_context___block_invoke(id *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  uint64_t v3 = [a1[5] uuid];
  id v4 = [v2 mediaSystemWithUUID:v3];

  if (v4)
  {
    uint64_t v5 = [a1[6] delegate];
    if ([v5 conformsToProtocol:&unk_1EEF70488]) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;

    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = a1[4];
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      int v17 = 138543874;
      id v18 = v11;
      __int16 v19 = 2112;
      __int16 v20 = v4;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of added media system: %@ private delegate: %@", (uint8_t *)&v17, 0x20u);
    }
    if (objc_opt_respondsToSelector()) {
      [v7 home:a1[6] didAddMediaSystem:v4];
    }
  }
  else
  {
    id v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = a1[4];
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      long long v15 = HMFGetLogIdentifier();
      __int16 v16 = [a1[5] uuid];
      int v17 = 138543618;
      id v18 = v15;
      __int16 v19 = 2112;
      __int16 v20 = v16;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Skipping add media system notification due to not found media system: %@", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)notifyDelegateOfAddedMediaSystem:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMMediaSystemStageManager *)self dataSourceHome];
  uint64_t v6 = [(HMMediaSystemStageManager *)self dataSourceContext];
  id v7 = (void *)v6;
  if (v5 && v6)
  {
    [(HMMediaSystemStageManager *)self notifyDelegateOfAddedMediaSystem:v4 usingHome:v5 context:v6];
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      id v12 = [v4 uuid];
      id v13 = [v5 uuid];
      int v14 = 138544130;
      long long v15 = v11;
      __int16 v16 = 2112;
      int v17 = v12;
      __int16 v18 = 2112;
      __int16 v19 = v13;
      __int16 v20 = 2112;
      __int16 v21 = v7;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of added media system: %@ due to no home: %@ context: %@", (uint8_t *)&v14, 0x2Au);
    }
  }
}

void __41__HMMediaSystemStageManager_mediaSystems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 uuid];
  [v2 setObject:v3 forKey:v4];
}

uint64_t __41__HMMediaSystemStageManager_mediaSystems__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObjectForKey:a2];
}

- (id)mediaSystemWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMMediaSystemStageManager *)self mediaSystems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__HMMediaSystemStageManager_mediaSystemWithUniqueIdentifier___block_invoke;
  v9[3] = &unk_1E593FE00;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __61__HMMediaSystemStageManager_mediaSystemWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)mediaSystemWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMMediaSystemStageManager *)self mediaSystems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__HMMediaSystemStageManager_mediaSystemWithUUID___block_invoke;
  v9[3] = &unk_1E593FE00;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __49__HMMediaSystemStageManager_mediaSystemWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

- (void)unstageExpiredStagedAddedMediaSystemUUID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v16 = 138543618;
    int v17 = v8;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Unstaging expired staged added media system with UUID: %@", (uint8_t *)&v16, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  id v9 = [(NSMutableDictionary *)v6->_stagedAddedMediaSystemsMap objectForKey:v4];
  [(NSMutableDictionary *)v6->_stagedAddedMediaSystemsMap removeObjectForKey:v4];
  os_unfair_lock_unlock(&v6->_lock);
  if (v9)
  {
    id v10 = [(HMMediaSystemStageManager *)v6 mediaSystemWithUUID:v4];
    BOOL v11 = v10 == 0;

    if (v11)
    {
      id v12 = (void *)MEMORY[0x19F3A64A0]();
      id v13 = v6;
      int v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        long long v15 = HMFGetLogIdentifier();
        int v16 = 138543618;
        int v17 = v15;
        __int16 v18 = 2112;
        id v19 = v9;
        _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Removed expired staged media system: %@", (uint8_t *)&v16, 0x16u);
      }
      [v9 _unconfigure];
      [(HMMediaSystemStageManager *)v13 notifyDelegateOfRemovedMediaSystem:v9];
    }
  }
}

- (void)unstageExpiredStagedRemovedMediaSystemUUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    BOOL v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Unstaging expired staged removed media system with UUID: %@", (uint8_t *)&v10, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  [(NSMutableSet *)v6->_stagedRemovedMediaSystemUUIDs removeObject:v4];
  os_unfair_lock_unlock(&v6->_lock);
  id v9 = [(HMMediaSystemStageManager *)v6 mediaSystemWithUUID:v4];
  if (v9) {
    [(HMMediaSystemStageManager *)v6 notifyDelegateOfAddedMediaSystem:v9];
  }
}

- (void)unstageAndCommitMediaSystemWithUUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [(NSMutableDictionary *)self->_stagedAddedMediaSystemsMap objectForKey:v4];
  if (v5)
  {
    [(NSMutableDictionary *)self->_stagedAddedMediaSystemsMap removeObjectForKey:v4];
    [(NSMutableDictionary *)self->_committedMediaSystemsMap setObject:v5 forKey:v4];

    os_unfair_lock_unlock(&self->_lock);
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543618;
      BOOL v11 = v9;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Unstaged and committed media system: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)unstageAndCommitMediaSystems:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__HMMediaSystemStageManager_unstageAndCommitMediaSystems___block_invoke;
  v3[3] = &unk_1E593F930;
  v3[4] = self;
  objc_msgSend(a3, "na_each:", v3);
}

void __58__HMMediaSystemStageManager_unstageAndCommitMediaSystems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uuid];
  [v2 unstageAndCommitMediaSystemWithUUID:v3];
}

- (void)stageRemovedMediaSystemUUID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v16 = 138543618;
    int v17 = v8;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Staging removed media system: %@", (uint8_t *)&v16, 0x16u);
  }
  id v9 = [(HMMediaSystemStageManager *)v6 mediaSystemWithUUID:v4];
  if (v9)
  {
    os_unfair_lock_lock_with_options();
    [(NSMutableSet *)v6->_stagedRemovedMediaSystemUUIDs addObject:v4];
    os_unfair_lock_unlock(&v6->_lock);
    int v10 = [(HMMediaSystemStageManager *)v6 removedMediaSystemTimerManager];
    id v11 = (id)[v10 startTimerWithTimeInterval:v4 andReplaceObject:180.0];

    [(HMMediaSystemStageManager *)v6 notifyDelegateOfRemovedMediaSystem:v9];
  }
  else
  {
    __int16 v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = v6;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      long long v15 = HMFGetLogIdentifier();
      int v16 = 138543618;
      int v17 = v15;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Skipping staging removed media system: %@ due to no existing media system", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)stageAddedMediaSystem:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v14 = 138543618;
    long long v15 = v8;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Staging media system: %@", (uint8_t *)&v14, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  stagedAddedMediaSystemsMap = v6->_stagedAddedMediaSystemsMap;
  int v10 = [v4 uuid];
  [(NSMutableDictionary *)stagedAddedMediaSystemsMap setObject:v4 forKey:v10];

  os_unfair_lock_unlock(&v6->_lock);
  id v11 = [(HMMediaSystemStageManager *)v6 addedMediaSystemTimerManager];
  __int16 v12 = [v4 uuid];
  id v13 = (id)[v11 startTimerWithTimeInterval:v12 andReplaceObject:180.0];

  [(HMMediaSystemStageManager *)v6 notifyDelegateOfAddedMediaSystem:v4];
}

- (void)setCommittedMediaSystems:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = objc_msgSend(v7, "na_dictionaryWithKeyGenerator:", &__block_literal_global_19_15224);
  uint64_t v5 = (NSMutableDictionary *)[v4 mutableCopy];
  committedMediaSystemsMap = self->_committedMediaSystemsMap;
  self->_committedMediaSystemsMap = v5;

  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __54__HMMediaSystemStageManager_setCommittedMediaSystems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (id)committedMediaSystems
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableDictionary *)self->_committedMediaSystemsMap allValues];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)mergeMediaSystems:(id)a3 withHome:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  [(HMMediaSystemStageManager *)self unstageAndCommitMediaSystems:v10];
  id v11 = [HMObjectMergeCollection alloc];
  __int16 v12 = [(HMMediaSystemStageManager *)self committedMediaSystems];
  id v13 = [(HMObjectMergeCollection *)v11 initWithCurrentObjects:v12 newObjects:v10];

  int v14 = [(HMObjectMergeCollection *)v13 removedObjects];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke;
  v40[3] = &unk_1E593F8E0;
  v40[4] = self;
  [v14 enumerateObjectsUsingBlock:v40];

  long long v15 = [(HMObjectMergeCollection *)v13 addedObjects];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke_15;
  v37[3] = &unk_1E593F908;
  v37[4] = self;
  id v16 = v9;
  id v38 = v16;
  id v17 = v8;
  id v39 = v17;
  [v15 enumerateObjectsUsingBlock:v37];

  [(HMObjectMergeCollection *)v13 mergeCommonObjects];
  uint64_t v18 = [(HMObjectMergeCollection *)v13 finalObjects];
  [(HMMediaSystemStageManager *)self setCommittedMediaSystems:v18];

  id v19 = [(HMObjectMergeCollection *)v13 removedObjects];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke_16;
  v33[3] = &unk_1E593F908;
  id v20 = v16;
  id v34 = v20;
  v35 = self;
  id v21 = v17;
  id v36 = v21;
  [v19 enumerateObjectsUsingBlock:v33];

  uint64_t v22 = [(HMObjectMergeCollection *)v13 addedObjects];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  id v28 = __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke_3;
  objc_super v29 = &unk_1E593F908;
  id v30 = v20;
  v31 = self;
  id v32 = v21;
  id v23 = v21;
  id v24 = v20;
  [v22 enumerateObjectsUsingBlock:&v26];

  LOBYTE(v20) = [(HMObjectMergeCollection *)v13 isModified];
  return (char)v20;
}

void __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed media system via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 _unconfigure];
}

void __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added media system via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  objc_msgSend(v3, "__configureWithContext:home:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke_2;
  v7[3] = &unk_1E5944F20;
  id v5 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v10 = *(id *)(a1 + 32);
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 postConfigure];
  id v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke_4;
  v7[3] = &unk_1E5944F20;
  id v5 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v10 = *(id *)(a1 + 32);
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateOfAddedMediaSystem:*(void *)(a1 + 40) usingHome:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
}

uint64_t __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateOfRemovedMediaSystem:*(void *)(a1 + 40) usingHome:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
}

- (void)unconfigure
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [(HMMediaSystemStageManager *)self mediaSystems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v6++) _unconfigure];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  os_unfair_lock_lock_with_options();
  id v7 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  committedMediaSystemsMap = self->_committedMediaSystemsMap;
  self->_committedMediaSystemsMap = v7;

  id v9 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  stagedAddedMediaSystemsMap = self->_stagedAddedMediaSystemsMap;
  self->_stagedAddedMediaSystemsMap = v9;

  id v11 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
  stagedRemovedMediaSystemUUIDs = self->_stagedRemovedMediaSystemUUIDs;
  self->_stagedRemovedMediaSystemUUIDs = v11;

  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __121__HMMediaSystemStageManager_initWithIdentifier_mediaSystems_addedMediaSystemTimerManager_removedMediaSystemTimerManager___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t30 != -1) {
    dispatch_once(&logCategory__hmf_once_t30, &__block_literal_global_183);
  }
  id v2 = (void *)logCategory__hmf_once_v31;

  return v2;
}

uint64_t __40__HMMediaSystemStageManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v31;
  logCategory__hmf_once_v31 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end