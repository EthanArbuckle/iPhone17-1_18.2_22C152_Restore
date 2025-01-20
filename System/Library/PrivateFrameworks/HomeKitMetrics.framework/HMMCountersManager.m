@interface HMMCountersManager
- (BOOL)_loadPersistentStoreWithError:(id *)a3;
- (BOOL)addEphemeralContainerWithName:(id)a3;
- (BOOL)loadPersistentStoreWithError:(id *)a3;
- (HMMCoreDataCounterStorage)coreDataStorage;
- (HMMCountersManager)initWithDataModelName:(id)a3 atPath:(id)a4;
- (HMMCountersManager)initWithDataModelName:(id)a3 atPath:(id)a4 dateProvider:(id)a5;
- (HMMDailyPartitionProvider)partitionProvider;
- (HMMDateProvider)dateProvider;
- (NSArray)managedEphemeralContainers;
- (id)counterGroupForAccessoryUUID:(id)a3 homeUUID:(id)a4 groupName:(id)a5;
- (id)counterGroupForHomeUUID:(id)a3 groupName:(id)a4;
- (id)counterGroupForHomeUUIDFromLogEvent:(id)a3 groupName:(id)a4;
- (id)counterGroupForName:(id)a3;
- (id)counterGroupForSpecifier:(id)a3 coreDataGroup:(id)a4;
- (id)managedEphemeralContainerForName:(id)a3;
- (id)statisticsGroupForAccessoryUUID:(id)a3 homeUUID:(id)a4 groupName:(id)a5;
- (id)statisticsGroupForHomeUUID:(id)a3 groupName:(id)a4;
- (id)statisticsGroupForHomeUUIDFromLogEvent:(id)a3 groupName:(id)a4;
- (id)statisticsGroupForName:(id)a3;
- (id)statisticsGroupForSpecifier:(id)a3 coreDataGroup:(id)a4;
- (void)deactivateEphemeralContainerWithName:(id)a3;
- (void)deletePartitionsAfterDate:(id)a3;
- (void)deletePartitionsBeforeDate:(id)a3;
- (void)enumerateCounterGroupsUsingBlock:(id)a3;
- (void)enumerateStatisticsGroupsUsingBlock:(id)a3;
- (void)loadAllCounterGroups;
- (void)loadAllStatisticsGroups;
- (void)removeEphemeralContainerWithName:(id)a3;
- (void)save;
@end

@implementation HMMCountersManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_partitionProvider, 0);
  objc_storeStrong((id *)&self->_coreDataStorage, 0);
  objc_storeStrong((id *)&self->_managedContainersByName, 0);
  objc_storeStrong((id *)&self->_statisticsGroups, 0);
  objc_storeStrong((id *)&self->_counterGroups, 0);
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (HMMDailyPartitionProvider)partitionProvider
{
  return self->_partitionProvider;
}

- (HMMCoreDataCounterStorage)coreDataStorage
{
  return self->_coreDataStorage;
}

- (void)save
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(HMMCountersManager *)self loadPersistentStoreWithError:0];
  os_unfair_lock_lock_with_options();
  v3 = (void *)[(NSMutableDictionary *)self->_counterGroups copy];
  os_unfair_lock_unlock(&self->_lock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v4 = objc_msgSend(v3, "allValues", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) updateCountersBeforeSave];
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8 = [(HMMCountersManager *)self coreDataStorage];
  [v8 save];
}

- (void)deletePartitionsAfterDate:(id)a3
{
  id v4 = a3;
  [(HMMCountersManager *)self loadPersistentStoreWithError:0];
  uint64_t v5 = [(HMMCountersManager *)self coreDataStorage];
  +[HMMStandardCounterGroup deletePartitionsAfterDate:v4 coreDataStorage:v5];

  id v6 = [(HMMCountersManager *)self coreDataStorage];
  +[HMMStandardStatisticsGroup deletePartitionsAfterDate:v4 coreDataStorage:v6];
}

- (void)deletePartitionsBeforeDate:(id)a3
{
  id v4 = a3;
  [(HMMCountersManager *)self loadPersistentStoreWithError:0];
  uint64_t v5 = [(HMMCountersManager *)self coreDataStorage];
  +[HMMStandardCounterGroup deletePartitionsBeforeDate:v4 coreDataStorage:v5];

  id v6 = [(HMMCountersManager *)self coreDataStorage];
  +[HMMStandardStatisticsGroup deletePartitionsBeforeDate:v4 coreDataStorage:v6];
}

- (id)managedEphemeralContainerForName:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableDictionary *)self->_managedContainersByName objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (NSArray)managedEphemeralContainers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableDictionary *)self->_managedContainersByName allValues];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)removeEphemeralContainerWithName:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableDictionary *)self->_managedContainersByName objectForKeyedSubscript:v4];

  if (v6)
  {
    [(NSMutableDictionary *)self->_managedContainersByName setObject:0 forKeyedSubscript:v4];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v7 = [(NSMutableDictionary *)self->_counterGroups allValues];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v20;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * v10++) removeEphemeralContainerWithName:v4];
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v8);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v11 = [(NSMutableDictionary *)self->_statisticsGroups allValues];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * v14++) removeEphemeralContainerWithName:v4];
        }
        while (v12 != v14);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v12);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)deactivateEphemeralContainerWithName:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableDictionary *)self->_managedContainersByName objectForKeyedSubscript:v4];
  uint64_t v7 = v6;
  if (v6 && ([v6 isActive] & 1) != 0)
  {
    [v7 setActive:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v8 = [(NSMutableDictionary *)self->_counterGroups allValues];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v21;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * v11++) deactivateEphemeralContainerWithName:v4];
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v9);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v12 = [(NSMutableDictionary *)self->_statisticsGroups allValues];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v15++) deactivateEphemeralContainerWithName:v4];
        }
        while (v13 != v15);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)addEphemeralContainerWithName:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableDictionary *)self->_managedContainersByName objectForKeyedSubscript:v4];

  if (!v6)
  {
    managedContainersByName = self->_managedContainersByName;
    uint64_t v8 = [[HMMManagedEphemeralContainer alloc] initWithContainerName:v4];
    [(NSMutableDictionary *)managedContainersByName setObject:v8 forKey:v4];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v9 = [(NSMutableDictionary *)self->_counterGroups allValues];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v23;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * v12++) addEphemeralContainerWithName:v4];
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v10);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v13 = [(NSMutableDictionary *)self->_statisticsGroups allValues];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * v16++) addEphemeralContainerWithName:v4];
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v14);
    }
  }
  os_unfair_lock_unlock(p_lock);

  return v6 == 0;
}

- (void)enumerateStatisticsGroupsUsingBlock:(id)a3
{
  id v4 = a3;
  [(HMMCountersManager *)self loadAllStatisticsGroups];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = (void *)[(NSMutableDictionary *)self->_statisticsGroups copy];
  os_unfair_lock_unlock(p_lock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__HMMCountersManager_enumerateStatisticsGroupsUsingBlock___block_invoke;
  v8[3] = &unk_1E69FD898;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

void __58__HMMCountersManager_enumerateStatisticsGroupsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 descriptor];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (id)statisticsGroupForAccessoryUUID:(id)a3 homeUUID:(id)a4 groupName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [[HMMAccessoryGroupSpecifier alloc] initWithAccessoryUUID:v10 homeUUID:v9 groupName:v8];

  uint64_t v12 = [(HMMCountersManager *)self statisticsGroupForSpecifier:v11 coreDataGroup:0];

  return v12;
}

- (id)statisticsGroupForHomeUUIDFromLogEvent:(id)a3 groupName:(id)a4
{
  id v6 = a4;
  id v7 = HMMSafeHomeUUIDFromLogEvent(a3);
  if (v7)
  {
    id v8 = [(HMMCountersManager *)self statisticsGroupForHomeUUID:v7 groupName:v6];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)statisticsGroupForHomeUUID:(id)a3 groupName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[HMMHomeGroupSpecifier alloc] initWithHomeUUID:v7 groupName:v6];

  id v9 = [(HMMCountersManager *)self statisticsGroupForSpecifier:v8 coreDataGroup:0];

  return v9;
}

- (id)statisticsGroupForName:(id)a3
{
  id v4 = a3;
  id v5 = [[HMMNamedGroupSpecifier alloc] initWithGroupName:v4];

  id v6 = [(HMMCountersManager *)self statisticsGroupForSpecifier:v5 coreDataGroup:0];

  return v6;
}

- (id)statisticsGroupForSpecifier:(id)a3 coreDataGroup:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(HMMCountersManager *)self _loadPersistentStoreWithError:0];
  id v9 = [(NSMutableDictionary *)self->_statisticsGroups objectForKeyedSubscript:v6];
  if (!v9)
  {
    if (v7)
    {
      id v10 = [HMMStandardStatisticsGroup alloc];
      uint64_t v11 = [(HMMCountersManager *)self partitionProvider];
      uint64_t v12 = [(HMMCountersManager *)self coreDataStorage];
      uint64_t v13 = [(HMMStandardStatisticsGroup *)v10 initWithCoreDataGroup:v7 partitionProvider:v11 coreDataStorage:v12];
    }
    else
    {
      uint64_t v11 = [(HMMCountersManager *)self partitionProvider];
      uint64_t v12 = [(HMMCountersManager *)self coreDataStorage];
      uint64_t v13 = +[HMMStandardStatisticsGroup groupFromSpecifier:v6 partitionProvider:v11 coreDataStorage:v12];
    }
    id v9 = (void *)v13;

    if (v9)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v14 = [(NSMutableDictionary *)self->_managedContainersByName allValues];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v23 != v16) {
              objc_enumerationMutation(v14);
            }
            long long v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if ([v18 isActive])
            {
              long long v19 = [v18 containerName];
              [v9 addEphemeralContainerWithName:v19];
            }
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v15);
      }

      [(NSMutableDictionary *)self->_statisticsGroups setObject:v9 forKey:v6];
    }
  }
  id v20 = v9;

  os_unfair_lock_unlock(p_lock);
  return v20;
}

- (void)loadAllStatisticsGroups
{
  [(HMMCountersManager *)self loadPersistentStoreWithError:0];
  v3 = [(HMMCountersManager *)self coreDataStorage];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__HMMCountersManager_loadAllStatisticsGroups__block_invoke;
  v4[3] = &unk_1E69FD848;
  v4[4] = self;
  [v3 executeWithManagedObjectContextAndWait:v4];
}

void __45__HMMCountersManager_loadAllStatisticsGroups__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"NamedGroup"];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"valueStatistics.@count > 0"];
  [v4 setPredicate:v5];

  [v4 setIncludesSubentities:1];
  id v26 = 0;
  long long v21 = v3;
  id v6 = [v3 executeFetchRequest:v4 error:&v26];
  id v7 = v26;
  if (v7)
  {
    id v8 = (void *)MEMORY[0x1D944E970]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v29 = v11;
      __int16 v30 = 2114;
      id v31 = v7;
      _os_log_impl(&dword_1D4999000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error loading all groups: %{public}@", buf, 0x16u);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = *(void **)(a1 + 32);
        long long v19 = [v17 groupSpecifier];
        id v20 = (id)[v18 statisticsGroupForSpecifier:v19 coreDataGroup:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v14);
  }
}

- (void)enumerateCounterGroupsUsingBlock:(id)a3
{
  id v4 = a3;
  [(HMMCountersManager *)self loadAllCounterGroups];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = (void *)[(NSMutableDictionary *)self->_counterGroups copy];
  os_unfair_lock_unlock(p_lock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__HMMCountersManager_enumerateCounterGroupsUsingBlock___block_invoke;
  v8[3] = &unk_1E69FD870;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

void __55__HMMCountersManager_enumerateCounterGroupsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 descriptor];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (id)counterGroupForAccessoryUUID:(id)a3 homeUUID:(id)a4 groupName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [[HMMAccessoryGroupSpecifier alloc] initWithAccessoryUUID:v10 homeUUID:v9 groupName:v8];

  id v12 = [(HMMCountersManager *)self counterGroupForSpecifier:v11 coreDataGroup:0];

  return v12;
}

- (id)counterGroupForHomeUUIDFromLogEvent:(id)a3 groupName:(id)a4
{
  id v6 = a4;
  id v7 = HMMSafeHomeUUIDFromLogEvent(a3);
  if (v7)
  {
    id v8 = [(HMMCountersManager *)self counterGroupForHomeUUID:v7 groupName:v6];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)counterGroupForHomeUUID:(id)a3 groupName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[HMMHomeGroupSpecifier alloc] initWithHomeUUID:v7 groupName:v6];

  id v9 = [(HMMCountersManager *)self counterGroupForSpecifier:v8 coreDataGroup:0];

  return v9;
}

- (id)counterGroupForName:(id)a3
{
  id v4 = a3;
  id v5 = [[HMMNamedGroupSpecifier alloc] initWithGroupName:v4];

  id v6 = [(HMMCountersManager *)self counterGroupForSpecifier:v5 coreDataGroup:0];

  return v6;
}

- (id)counterGroupForSpecifier:(id)a3 coreDataGroup:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(HMMCountersManager *)self _loadPersistentStoreWithError:0];
  id v9 = [(NSMutableDictionary *)self->_counterGroups objectForKeyedSubscript:v6];
  if (!v9)
  {
    if (v7)
    {
      id v10 = [HMMStandardCounterGroup alloc];
      uint64_t v11 = [(HMMCountersManager *)self dateProvider];
      id v12 = [(HMMCountersManager *)self partitionProvider];
      uint64_t v13 = [(HMMCountersManager *)self coreDataStorage];
      uint64_t v14 = [(HMMStandardCounterGroup *)v10 initWithCoreDataGroup:v7 dateProvider:v11 partitionProvider:v12 coreDataStorage:v13];
    }
    else
    {
      uint64_t v11 = [(HMMCountersManager *)self dateProvider];
      id v12 = [(HMMCountersManager *)self partitionProvider];
      uint64_t v13 = [(HMMCountersManager *)self coreDataStorage];
      uint64_t v14 = +[HMMStandardCounterGroup groupFromSpecifier:v6 dateProvider:v11 partitionProvider:v12 coreDataStorage:v13];
    }
    id v9 = (void *)v14;

    if (v9)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v15 = [(NSMutableDictionary *)self->_managedContainersByName allValues];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v24 != v17) {
              objc_enumerationMutation(v15);
            }
            long long v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if ([v19 isActive])
            {
              id v20 = [v19 containerName];
              [v9 addEphemeralContainerWithName:v20];
            }
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v16);
      }

      [(NSMutableDictionary *)self->_counterGroups setObject:v9 forKey:v6];
    }
  }
  id v21 = v9;

  os_unfair_lock_unlock(p_lock);
  return v21;
}

- (void)loadAllCounterGroups
{
  [(HMMCountersManager *)self loadPersistentStoreWithError:0];
  id v3 = [(HMMCountersManager *)self coreDataStorage];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__HMMCountersManager_loadAllCounterGroups__block_invoke;
  v4[3] = &unk_1E69FD848;
  v4[4] = self;
  [v3 executeWithManagedObjectContextAndWait:v4];
}

void __42__HMMCountersManager_loadAllCounterGroups__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"NamedGroup"];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"counters.@count > 0"];
  [v4 setPredicate:v5];

  [v4 setIncludesSubentities:1];
  id v26 = 0;
  id v21 = v3;
  id v6 = [v3 executeFetchRequest:v4 error:&v26];
  id v7 = v26;
  if (v7)
  {
    id v8 = (void *)MEMORY[0x1D944E970]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v29 = v11;
      __int16 v30 = 2114;
      id v31 = v7;
      _os_log_impl(&dword_1D4999000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error loading all groups: %{public}@", buf, 0x16u);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = *(void **)(a1 + 32);
        long long v19 = [v17 groupSpecifier];
        id v20 = (id)[v18 counterGroupForSpecifier:v19 coreDataGroup:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v14);
  }
}

- (BOOL)_loadPersistentStoreWithError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_storageNeedsLoading) {
    return 1;
  }
  self->_storageNeedsLoading = 0;
  id v5 = [(HMMCountersManager *)self coreDataStorage];
  char v6 = [v5 loadPersistentStoreWithError:a3];

  if (v6) {
    return 1;
  }
  id v8 = (void *)MEMORY[0x1D944E970]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v12 = 138543362;
    uint64_t v13 = v11;
    _os_log_impl(&dword_1D4999000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to load persistent store. Counters won't be tracked.", (uint8_t *)&v12, 0xCu);
  }
  return 0;
}

- (BOOL)loadPersistentStoreWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(a3) = [(HMMCountersManager *)self _loadPersistentStoreWithError:a3];
  os_unfair_lock_unlock(p_lock);
  return (char)a3;
}

- (HMMCountersManager)initWithDataModelName:(id)a3 atPath:(id)a4 dateProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HMMCountersManager;
  uint64_t v11 = [(HMMCountersManager *)&v23 init];
  if (v11)
  {
    int v12 = [[HMMCoreDataCounterStorage alloc] initWithModelName:v8 atPath:v9];
    coreDataStorage = v11->_coreDataStorage;
    v11->_coreDataStorage = v12;

    v11->_storageNeedsLoading = 1;
    objc_storeStrong((id *)&v11->_dateProvider, a5);
    uint64_t v14 = [[HMMDailyPartitionProvider alloc] initWithDateProvider:v10];
    partitionProvider = v11->_partitionProvider;
    v11->_partitionProvider = v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    counterGroups = v11->_counterGroups;
    v11->_counterGroups = (NSMutableDictionary *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    statisticsGroups = v11->_statisticsGroups;
    v11->_statisticsGroups = (NSMutableDictionary *)v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    managedContainersByName = v11->_managedContainersByName;
    v11->_managedContainersByName = (NSMutableDictionary *)v20;
  }
  return v11;
}

- (HMMCountersManager)initWithDataModelName:(id)a3 atPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[HMMDateProvider sharedInstance];
  id v9 = [(HMMCountersManager *)self initWithDataModelName:v7 atPath:v6 dateProvider:v8];

  return v9;
}

@end