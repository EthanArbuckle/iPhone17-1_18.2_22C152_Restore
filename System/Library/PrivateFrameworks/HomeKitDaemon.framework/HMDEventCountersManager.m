@interface HMDEventCountersManager
+ (NSSet)allowedSpecifierClasses;
- (HMDEventCountersManager)init;
- (HMDEventCountersManager)initWithBridgedCountersManager:(id)a3 bridgedDateProvider:(id)a4;
- (HMDEventCountersManager)initWithEventCountersStorage:(id)a3 bridgedCountersManager:(id)a4 bridgedDateProvider:(id)a5;
- (HMDEventCountersManager)initWithEventCountersStorage:(id)a3 bridgedCountersManager:(id)a4 bridgedDateProvider:(id)a5 saveInterval:(double)a6 uptimeProvider:(id)a7;
- (HMDEventCountersStoring)counterStorage;
- (HMMCountersManager)bridgedCountersManager;
- (HMMDateProvider)bridgedDateProvider;
- (HMMUptimeProvider)uptimeProvider;
- (OS_dispatch_queue)workQueue;
- (double)saveInterval;
- (id)_fetchAllEventCounters;
- (id)counterGroupForName:(id)a3;
- (id)counterGroupForSpecifier:(id)a3;
- (id)counterGroupsForPredicate:(id)a3;
- (id)fetchAllEventCounters;
- (id)fetchEventCountersForRequestGroup:(id)a3;
- (id)unarchiveEventCounters;
- (unint64_t)fetchAggregatedEventCountersForRequestGroup:(id)a3;
- (unint64_t)fetchEventCounterForEventName:(id)a3 requestGroup:(id)a4;
- (void)_removeCounterGroupForSpecifier:(id)a3;
- (void)_save;
- (void)addObserver:(id)a3 forEventName:(id)a4 requestGroup:(id)a5;
- (void)counterChanged;
- (void)forceSave;
- (void)incrementEventCounterForEventName:(id)a3 requestGroup:(id)a4;
- (void)incrementEventCounterForEventName:(id)a3 requestGroup:(id)a4 withValue:(unint64_t)a5;
- (void)removeCounterGroupForName:(id)a3;
- (void)removeCounterGroupForSpecifier:(id)a3;
- (void)removeCounterGroupsBasedOnPredicate:(id)a3;
- (void)resetAllEventCounters;
- (void)resetEventCountersForRequestGroup:(id)a3;
@end

@implementation HMDEventCountersManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridgedDateProvider, 0);
  objc_storeStrong((id *)&self->_bridgedCountersManager, 0);
  objc_storeStrong((id *)&self->_uptimeProvider, 0);
  objc_storeStrong((id *)&self->_counterStorage, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_counterGroups, 0);
  objc_storeStrong((id *)&self->_persistentStore, 0);
}

- (HMMDateProvider)bridgedDateProvider
{
  return self->_bridgedDateProvider;
}

- (HMMCountersManager)bridgedCountersManager
{
  return self->_bridgedCountersManager;
}

- (HMMUptimeProvider)uptimeProvider
{
  return self->_uptimeProvider;
}

- (double)saveInterval
{
  return self->_saveInterval;
}

- (HMDEventCountersStoring)counterStorage
{
  return self->_counterStorage;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (id)unarchiveEventCounters
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(HMDEventCountersManager *)self counterStorage];
  v5 = [v4 unarchive];

  if (v5)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __49__HMDEventCountersManager_unarchiveEventCounters__block_invoke;
    v15[3] = &unk_264A2A5F8;
    id v16 = v3;
    v17 = self;
    [v5 enumerateKeysAndObjectsUsingBlock:v15];
  }
  v10 = (void *)MEMORY[0x230FBD990](v6, v7, v8, v9);
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v19 = v13;
    __int16 v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Final restored event counters: %@", buf, 0x16u);
  }

  return v3;
}

void __49__HMDEventCountersManager_unarchiveEventCounters__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [HMDEventCounterGroup alloc];
  uint64_t v8 = *(void **)(a1 + 40);
  id v10 = [v8 uptimeProvider];
  uint64_t v9 = [(HMDEventCounterGroup *)v7 initWithContext:v8 serializedEventCounters:v5 uptimeProvider:v10];

  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v6];
}

- (void)_save
{
  os_unfair_lock_assert_owner(&self->_lock);
  self->_pendingSave = 1;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__HMDEventCountersManager__save__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __32__HMDEventCountersManager__save__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) bridgedCountersManager];

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = [v3 bridgedCountersManager];
    [v4 save];
  }
  else
  {
    v4 = [v3 counterStorage];
    uint64_t v5 = [*(id *)(a1 + 32) fetchAllEventCounters];
    id v6 = (void *)v5;
    if (v5) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = MEMORY[0x263EFFA78];
    }
    [v4 archiveDictionary:v7];
  }
  uint64_t v8 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 36);
  os_unfair_lock_lock_with_options();
  [*(id *)(*(void *)(a1 + 32) + 64) uptime];
  *(void *)(*(void *)(a1 + 32) + 24) = v9;
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  os_unfair_lock_unlock(v8);
}

- (void)counterChanged
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->_pendingSave)
  {
    [(HMMUptimeProvider *)self->_uptimeProvider uptime];
    if (v4 - self->_lastSaveTime >= self->_saveInterval) {
      [(HMDEventCountersManager *)self _save];
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)forceSave
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->_pendingSave) {
    [(HMDEventCountersManager *)self _save];
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)_fetchAllEventCounters
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  counterGroups = self->_counterGroups;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__HMDEventCountersManager__fetchAllEventCounters__block_invoke;
  v8[3] = &unk_264A2A5D0;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)counterGroups enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (void *)[v5 copy];

  return v6;
}

void __49__HMDEventCountersManager__fetchAllEventCounters__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [v5 eventCounters];
  if ([v6 count])
  {
    uint64_t v7 = [v5 eventCounters];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
}

- (void)resetAllEventCounters
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_pendingSave = 1;
  double v4 = [(NSMutableDictionary *)self->_counterGroups allValues];
  os_unfair_lock_unlock(p_lock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "resetEventCounters", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  os_unfair_lock_lock_with_options();
  [(HMDEventCountersManager *)self _save];
  os_unfair_lock_unlock(p_lock);
}

- (void)resetEventCountersForRequestGroup:(id)a3
{
  id v3 = [(HMDEventCountersManager *)self counterGroupForName:a3];
  [v3 resetEventCounters];
}

- (id)fetchAllEventCounters
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  double v4 = [(HMDEventCountersManager *)self _fetchAllEventCounters];
  if ([v4 count]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (unint64_t)fetchAggregatedEventCountersForRequestGroup:(id)a3
{
  id v3 = [(HMDEventCountersManager *)self counterGroupForName:a3];
  unint64_t v4 = [v3 summedEventCounters];

  return v4;
}

- (id)fetchEventCountersForRequestGroup:(id)a3
{
  id v3 = [(HMDEventCountersManager *)self counterGroupForName:a3];
  unint64_t v4 = [v3 eventCounters];

  return v4;
}

- (unint64_t)fetchEventCounterForEventName:(id)a3 requestGroup:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HMDEventCountersManager *)self counterGroupForName:a4];
  unint64_t v8 = [v7 fetchEventCounterForEventName:v6];

  return v8;
}

- (void)incrementEventCounterForEventName:(id)a3 requestGroup:(id)a4
{
  id v6 = a3;
  id v7 = [(HMDEventCountersManager *)self counterGroupForName:a4];
  [v7 incrementEventCounterForEventName:v6];
}

- (void)incrementEventCounterForEventName:(id)a3 requestGroup:(id)a4 withValue:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(HMDEventCountersManager *)self counterGroupForName:a4];
  [v9 incrementEventCounterForEventName:v8 withValue:a5];
}

- (void)addObserver:(id)a3 forEventName:(id)a4 requestGroup:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(HMDEventCountersManager *)self counterGroupForName:a5];
  [v10 addObserver:v9 forEventName:v8];
}

- (void)_removeCounterGroupForSpecifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  [(NSMutableDictionary *)self->_counterGroups removeObjectForKey:v5];
}

- (void)removeCounterGroupsBasedOnPredicate:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v4 = (unsigned int (**)(id, void))a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_counterGroups allKeys];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if (v4[2](v4, v9)) {
          -[HMDEventCountersManager _removeCounterGroupForSpecifier:](self, "_removeCounterGroupForSpecifier:", v9, (void)v10);
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeCounterGroupForSpecifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(HMDEventCountersManager *)self _removeCounterGroupForSpecifier:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeCounterGroupForName:(id)a3
{
  id v4 = +[HMDEventCounterGroupNameSpecifier specifierWithGroupName:a3];
  [(HMDEventCountersManager *)self removeCounterGroupForSpecifier:v4];
}

- (id)counterGroupsForPredicate:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
  counterGroups = self->_counterGroups;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __53__HMDEventCountersManager_counterGroupsForPredicate___block_invoke;
  uint64_t v15 = &unk_264A2A5A8;
  id v8 = v4;
  id v17 = v8;
  id v9 = v6;
  id v16 = v9;
  [(NSMutableDictionary *)counterGroups enumerateKeysAndObjectsUsingBlock:&v12];
  long long v10 = objc_msgSend(v9, "copy", v12, v13, v14, v15);

  os_unfair_lock_unlock(p_lock);
  return v10;
}

void __53__HMDEventCountersManager_counterGroupsForPredicate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

- (id)counterGroupForSpecifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  id v5 = [(NSMutableDictionary *)self->_counterGroups objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = +[HMDEventCountersManager allowedSpecifierClasses];
    char v7 = [v6 containsObject:objc_opt_class()];

    if ((v7 & 1) == 0)
    {
      v37 = (void *)MEMORY[0x263EFF940];
      v38 = [NSString stringWithFormat:@"Specifier's class must be registered in the allowedSpecifierClasses in HMDEventCountersManager: %@", objc_opt_class()];
      id v39 = [v37 exceptionWithName:*MEMORY[0x263EFF4A0] reason:v38 userInfo:0];

      objc_exception_throw(v39);
    }
    if (self->_bridgedCountersManager)
    {
      uint64_t v8 = objc_opt_class();
      if (v8 == objc_opt_class())
      {
        id v21 = v4;
        bridgedCountersManager = self->_bridgedCountersManager;
        v23 = [v21 groupName];
        uint64_t v14 = [(HMMCountersManager *)bridgedCountersManager counterGroupForName:v23];

        v46[0] = MEMORY[0x263EF8330];
        v46[1] = 3221225472;
        v46[2] = __52__HMDEventCountersManager_counterGroupForSpecifier___block_invoke;
        v46[3] = &unk_264A2A580;
        v46[4] = self;
        id v47 = v21;
        id v17 = _Block_copy(v46);
        id v5 = [[HMDEventCounterGroupBridge alloc] initWithContext:self bridgedCounterGroup:v14 dateProvider:self->_bridgedDateProvider statisticsGroupBlock:v17];
        v24 = &v47;
      }
      else
      {
        if (v8 == objc_opt_class())
        {
          id v25 = v4;
          v26 = self->_bridgedCountersManager;
          v27 = [v25 groupName];
          uint64_t v14 = [(HMMCountersManager *)v26 counterGroupForName:v27];

          uint64_t v15 = v45;
          v45[0] = MEMORY[0x263EF8330];
          v45[1] = 3221225472;
          v45[2] = __52__HMDEventCountersManager_counterGroupForSpecifier___block_invoke_2;
          v45[3] = &unk_264A2A580;
          v45[4] = self;
          id v28 = v25;
          v45[5] = v28;
          id v17 = _Block_copy(v45);
          v29 = [HMDEventCounterGroupBridge alloc];
          v19 = [v28 date];
          uint64_t v20 = [(HMDEventCounterGroupBridge *)v29 initWithContext:self bridgedCounterGroup:v14 groupDate:v19 statisticsGroupBlock:v17];
        }
        else if (v8 == objc_opt_class())
        {
          id v30 = v4;
          v31 = self->_bridgedCountersManager;
          v32 = [v30 homeUUID];
          v33 = [v30 groupName];
          uint64_t v14 = [(HMMCountersManager *)v31 counterGroupForHomeUUID:v32 groupName:v33];

          uint64_t v15 = v44;
          v44[0] = MEMORY[0x263EF8330];
          v44[1] = 3221225472;
          v44[2] = __52__HMDEventCountersManager_counterGroupForSpecifier___block_invoke_3;
          v44[3] = &unk_264A2A580;
          v44[4] = self;
          id v34 = v30;
          v44[5] = v34;
          id v17 = _Block_copy(v44);
          v35 = [HMDEventCounterGroupBridge alloc];
          v19 = [v34 date];
          uint64_t v20 = [(HMDEventCounterGroupBridge *)v35 initWithContext:self bridgedCounterGroup:v14 groupDate:v19 statisticsGroupBlock:v17];
        }
        else
        {
          if (v8 != objc_opt_class())
          {
            v40 = (void *)MEMORY[0x263EFF940];
            v41 = [NSString stringWithFormat:@"Specifier is allowed class %@, but not handled with bridged counters", objc_opt_class()];
            id v42 = [v40 exceptionWithName:*MEMORY[0x263EFF4A0] reason:v41 userInfo:0];

            objc_exception_throw(v42);
          }
          id v9 = v4;
          long long v10 = self->_bridgedCountersManager;
          long long v11 = [v9 accessoryUUID];
          uint64_t v12 = [v9 homeUUID];
          uint64_t v13 = [v9 groupName];
          uint64_t v14 = [(HMMCountersManager *)v10 counterGroupForAccessoryUUID:v11 homeUUID:v12 groupName:v13];

          uint64_t v15 = aBlock;
          aBlock[0] = MEMORY[0x263EF8330];
          aBlock[1] = 3221225472;
          aBlock[2] = __52__HMDEventCountersManager_counterGroupForSpecifier___block_invoke_4;
          aBlock[3] = &unk_264A2A580;
          aBlock[4] = self;
          id v16 = v9;
          aBlock[5] = v16;
          id v17 = _Block_copy(aBlock);
          v18 = [HMDEventCounterGroupBridge alloc];
          v19 = [v16 date];
          uint64_t v20 = [(HMDEventCounterGroupBridge *)v18 initWithContext:self bridgedCounterGroup:v14 groupDate:v19 statisticsGroupBlock:v17];
        }
        id v5 = (HMDEventCounterGroupBridge *)v20;
        v24 = (id *)(v15 + 5);
      }
    }
    else
    {
      id v5 = [[HMDEventCounterGroup alloc] initWithContext:self serializedEventCounters:0 uptimeProvider:self->_uptimeProvider];
    }
    [(NSMutableDictionary *)self->_counterGroups setObject:v5 forKeyedSubscript:v4];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

id __52__HMDEventCountersManager_counterGroupForSpecifier___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 72);
  v2 = [*(id *)(a1 + 40) groupName];
  id v3 = [v1 statisticsGroupForName:v2];

  return v3;
}

id __52__HMDEventCountersManager_counterGroupForSpecifier___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 72);
  v2 = [*(id *)(a1 + 40) groupName];
  id v3 = [v1 statisticsGroupForName:v2];

  return v3;
}

id __52__HMDEventCountersManager_counterGroupForSpecifier___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 72);
  id v3 = [*(id *)(a1 + 40) homeUUID];
  id v4 = [*(id *)(a1 + 40) groupName];
  id v5 = [v2 statisticsGroupForHomeUUID:v3 groupName:v4];

  return v5;
}

id __52__HMDEventCountersManager_counterGroupForSpecifier___block_invoke_4(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 72);
  id v3 = [*(id *)(a1 + 40) accessoryUUID];
  id v4 = [*(id *)(a1 + 40) homeUUID];
  id v5 = [*(id *)(a1 + 40) groupName];
  id v6 = [v2 statisticsGroupForAccessoryUUID:v3 homeUUID:v4 groupName:v5];

  return v6;
}

- (id)counterGroupForName:(id)a3
{
  id v4 = +[HMDEventCounterGroupNameSpecifier specifierWithGroupName:a3];
  id v5 = [(HMDEventCountersManager *)self counterGroupForSpecifier:v4];

  return v5;
}

- (HMDEventCountersManager)initWithBridgedCountersManager:(id)a3 bridgedDateProvider:(id)a4
{
  return [(HMDEventCountersManager *)self initWithEventCountersStorage:0 bridgedCountersManager:a3 bridgedDateProvider:a4];
}

- (HMDEventCountersManager)initWithEventCountersStorage:(id)a3 bridgedCountersManager:(id)a4 bridgedDateProvider:(id)a5 saveInterval:(double)a6 uptimeProvider:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (v13)
  {
    if (!v14) {
      goto LABEL_6;
    }
    _HMFPreconditionFailure();
  }
  if (!v14 || !v15)
  {
    id v28 = (HMDEventCountersManager *)_HMFPreconditionFailure();
    return [(HMDEventCountersManager *)v28 initWithEventCountersStorage:v30 bridgedCountersManager:v31 bridgedDateProvider:v32];
  }
LABEL_6:
  v33.receiver = self;
  v33.super_class = (Class)HMDEventCountersManager;
  id v17 = [(HMDEventCountersManager *)&v33 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_counterStorage, a3);
    v18->_saveInterval = a6;
    objc_storeStrong((id *)&v18->_uptimeProvider, a7);
    objc_storeStrong((id *)&v18->_bridgedCountersManager, a4);
    objc_storeStrong((id *)&v18->_bridgedDateProvider, a5);
    [v16 uptime];
    v18->_lastSaveTime = v19;
    v18->_pendingSave = 0;
    HMDispatchQueueNameString();
    id v20 = objc_claimAutoreleasedReturnValue();
    id v21 = (const char *)[v20 UTF8String];
    uint64_t v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v24 = dispatch_queue_create(v21, v23);
    workQueue = v18->_workQueue;
    v18->_workQueue = (OS_dispatch_queue *)v24;

    if (v13) {
      [(HMDEventCountersManager *)v18 unarchiveEventCounters];
    }
    else {
    v26 = [MEMORY[0x263EFF9A0] dictionary];
    }
    objc_storeStrong((id *)&v18->_counterGroups, v26);
  }
  return v18;
}

- (HMDEventCountersManager)initWithEventCountersStorage:(id)a3 bridgedCountersManager:(id)a4 bridgedDateProvider:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x263F42608];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v8 sharedPreferences];
  id v13 = [v12 preferenceForKey:@"counterArchivePeriod"];
  id v14 = [v13 numberValue];
  unint64_t v15 = [v14 unsignedIntegerValue];

  id v16 = [MEMORY[0x263F499F8] sharedInstance];
  id v17 = [(HMDEventCountersManager *)self initWithEventCountersStorage:v11 bridgedCountersManager:v10 bridgedDateProvider:v9 saveInterval:v16 uptimeProvider:(double)v15];

  return v17;
}

- (HMDEventCountersManager)init
{
  id v3 = objc_alloc_init(HMDPersistentStore);
  id v4 = [[HMDEventCountersPersistentStore alloc] initWithPersistentStore:v3];
  id v5 = [(HMDEventCountersManager *)self initWithEventCountersStorage:v4 bridgedCountersManager:0 bridgedDateProvider:0];

  if (v5) {
    objc_storeStrong((id *)&v5->_persistentStore, v3);
  }

  return v5;
}

+ (NSSet)allowedSpecifierClasses
{
  if (allowedSpecifierClasses__hmf_once_t2 != -1) {
    dispatch_once(&allowedSpecifierClasses__hmf_once_t2, &__block_literal_global_237346);
  }
  v2 = (void *)allowedSpecifierClasses__hmf_once_v3;
  return (NSSet *)v2;
}

void __50__HMDEventCountersManager_allowedSpecifierClasses__block_invoke()
{
  v4[4] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)allowedSpecifierClasses__hmf_once_v3;
  allowedSpecifierClasses__hmf_once_id v3 = v2;
}

@end