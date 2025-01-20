@interface HMMStandardStatisticsGroup
+ (id)groupFromSpecifier:(id)a3 partitionProvider:(id)a4 coreDataStorage:(id)a5;
+ (void)deletePartitionsAfterDate:(id)a3 coreDataStorage:(id)a4;
+ (void)deletePartitionsBeforeDate:(id)a3 coreDataStorage:(id)a4;
+ (void)deleteStatisticsUsingPredicate:(id)a3 coreDataStorage:(id)a4;
- (BOOL)addEphemeralContainerWithName:(id)a3;
- (HMMCoreDataCounterStorage)coreDataStorage;
- (HMMCoreDataNamedGroup)coreDataGroup;
- (HMMCounterDatePartitionProvider)partitionProvider;
- (HMMStandardStatisticsGroup)initWithCoreDataGroup:(id)a3 partitionProvider:(id)a4 coreDataStorage:(id)a5;
- (NSArray)ephemeralContainerNames;
- (NSMutableDictionary)ephemeralContainers;
- (NSMutableDictionary)observers;
- (id)datePartitions;
- (id)observersForStatistics:(id)a3;
- (id)statistics:(id)a3 inDatePartition:(id)a4;
- (id)statistics:(id)a3 inEphemeralContainer:(id)a4;
- (id)statisticsInDatePartition:(id)a3;
- (id)statisticsInEphemeralContainer:(id)a3;
- (void)addMaxValueObserver:(id)a3 forStatistics:(id)a4;
- (void)addValue:(int64_t)a3 toStatistics:(id)a4;
- (void)deactivateEphemeralContainerWithName:(id)a3;
- (void)notifyObserversForStatistics:(id)a3 previousMax:(int64_t)a4 newMax:(int64_t)a5;
- (void)removeEphemeralContainerWithName:(id)a3;
- (void)setCoreDataGroup:(id)a3;
@end

@implementation HMMStandardStatisticsGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreDataGroup, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_ephemeralContainers, 0);
  objc_storeStrong((id *)&self->_coreDataStorage, 0);
  objc_storeStrong((id *)&self->_partitionProvider, 0);
}

- (void)setCoreDataGroup:(id)a3
{
}

- (HMMCoreDataNamedGroup)coreDataGroup
{
  return self->_coreDataGroup;
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (NSMutableDictionary)ephemeralContainers
{
  return self->_ephemeralContainers;
}

- (HMMCoreDataCounterStorage)coreDataStorage
{
  return self->_coreDataStorage;
}

- (HMMCounterDatePartitionProvider)partitionProvider
{
  return self->_partitionProvider;
}

- (id)statisticsInEphemeralContainer:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = [(NSMutableDictionary *)self->_ephemeralContainers objectForKeyedSubscript:v4];
  v7 = [v6 statistics];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)statistics:(id)a3 inEphemeralContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v9 = [(NSMutableDictionary *)self->_ephemeralContainers objectForKeyedSubscript:v7];
  v10 = [v9 statistics:v6];

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (NSArray)ephemeralContainerNames
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(NSMutableDictionary *)self->_ephemeralContainers allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self->_ephemeralContainers objectForKeyedSubscript:v9];
        char v11 = [v10 isEmpty];

        if ((v11 & 1) == 0) {
          [v4 addObject:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = (void *)[v4 copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v12;
}

- (void)removeEphemeralContainerWithName:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_ephemeralContainers setObject:0 forKeyedSubscript:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)deactivateEphemeralContainerWithName:(id)a3
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [(NSMutableDictionary *)self->_ephemeralContainers objectForKeyedSubscript:v6];
  [v5 setActive:0];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)addEphemeralContainerWithName:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableDictionary *)self->_ephemeralContainers objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1D944E970]();
    v8 = self;
    HMFGetOSLogHandle();
    uint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v13 = 138543618;
      long long v14 = v10;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1D4999000, v9, OS_LOG_TYPE_ERROR, "%{public}@Ephemeral container already exists: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    char v11 = objc_alloc_init(HMMEphemeralStatisticsContainer);
    [(NSMutableDictionary *)self->_ephemeralContainers setObject:v11 forKeyedSubscript:v4];
  }
  os_unfair_lock_unlock(p_lock);

  return v6 == 0;
}

- (id)statisticsInDatePartition:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy__512;
  id v16 = __Block_byref_object_dispose__513;
  id v17 = (id)MEMORY[0x1E4F1CC08];
  v5 = [(HMMStandardStatisticsGroup *)self coreDataStorage];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__HMMStandardStatisticsGroup_statisticsInDatePartition___block_invoke;
  v9[3] = &unk_1E69FD6A8;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  char v11 = &v12;
  [v5 executeWithManagedObjectContextAndWait:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__HMMStandardStatisticsGroup_statisticsInDatePartition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"GroupValueStatistics"];
  v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 32) coreDataGroup];
  id v7 = [v5 predicateWithFormat:@"(group == %@) && (date == %@)", v6, *(void *)(a1 + 40)];
  [v4 setPredicate:v7];

  id v35 = 0;
  v30 = v3;
  v8 = [v3 executeFetchRequest:v4 error:&v35];
  id v9 = v35;
  if (v9)
  {
    id v10 = (void *)MEMORY[0x1D944E970]();
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      uint64_t v14 = [*(id *)(a1 + 32) coreDataGroup];
      [v14 name];
      __int16 v15 = v29 = v10;
      uint64_t v16 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v38 = v13;
      __int16 v39 = 2114;
      v40 = v15;
      __int16 v41 = 2114;
      uint64_t v42 = v16;
      __int16 v43 = 2114;
      id v44 = v9;
      _os_log_impl(&dword_1D4999000, v12, OS_LOG_TYPE_ERROR, "%{public}@Error getting all statistics in group %{public}@ on date %{public}@: %{public}@", buf, 0x2Au);

      id v10 = v29;
    }
  }
  id v17 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v18 = v8;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v24 = [v23 counterStatistics];
        v25 = [v23 name];
        [v17 setObject:v24 forKey:v25];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v20);
  }

  uint64_t v26 = [v17 copy];
  uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
  v28 = *(void **)(v27 + 40);
  *(void *)(v27 + 40) = v26;
}

- (id)statistics:(id)a3 inDatePartition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__512;
  uint64_t v21 = __Block_byref_object_dispose__513;
  id v22 = 0;
  v8 = [(HMMStandardStatisticsGroup *)self coreDataStorage];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__HMMStandardStatisticsGroup_statistics_inDatePartition___block_invoke;
  v13[3] = &unk_1E69FD658;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  uint64_t v16 = &v17;
  [v8 executeWithManagedObjectContextAndWait:v13];

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __57__HMMStandardStatisticsGroup_statistics_inDatePartition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"GroupValueStatistics"];
  v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 32) coreDataGroup];
  id v7 = [v5 predicateWithFormat:@"(group == %@) && (name == %@) && (date == %@)", v6, *(void *)(a1 + 40), *(void *)(a1 + 48)];
  [v4 setPredicate:v7];

  id v27 = 0;
  v8 = [v3 executeFetchRequest:v4 error:&v27];
  id v9 = v27;
  if (![v8 count])
  {
    if (!v9) {
      goto LABEL_11;
    }
    id v14 = (void *)MEMORY[0x1D944E970]();
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      uint64_t v24 = *(void *)(a1 + 40);
      id v18 = [*(id *)(a1 + 32) coreDataGroup];
      [v18 name];
      uint64_t v19 = v25 = v14;
      uint64_t v20 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544386;
      v29 = v17;
      __int16 v30 = 2114;
      uint64_t v31 = v24;
      __int16 v32 = 2114;
      long long v33 = v19;
      __int16 v34 = 2114;
      uint64_t v35 = v20;
      __int16 v36 = 2114;
      id v37 = v9;
      _os_log_impl(&dword_1D4999000, v16, OS_LOG_TYPE_ERROR, "%{public}@Error getting counter %{public}@ in group %{public}@ on date %{public}@: %{public}@", buf, 0x34u);

      id v14 = v25;
LABEL_9:
    }
LABEL_10:

    goto LABEL_11;
  }
  if ([v8 count] != 1)
  {
    id v14 = (void *)MEMORY[0x1D944E970]();
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      uint64_t v26 = v14;
      uint64_t v21 = *(void *)(a1 + 40);
      id v22 = [*(id *)(a1 + 32) coreDataGroup];
      v23 = [v22 name];
      *(_DWORD *)buf = 138543874;
      v29 = v17;
      __int16 v30 = 2114;
      uint64_t v31 = v21;
      id v14 = v26;
      __int16 v32 = 2114;
      long long v33 = v23;
      _os_log_impl(&dword_1D4999000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unexpected extra statistics returned for counter %{public}@ in group %{public}@", buf, 0x20u);

      goto LABEL_9;
    }
    goto LABEL_10;
  }
  id v10 = [v8 objectAtIndexedSubscript:0];
  uint64_t v11 = [v10 counterStatistics];
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  int v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

LABEL_11:
}

- (id)datePartitions
{
  id v3 = [(HMMStandardStatisticsGroup *)self coreDataStorage];
  [v3 save];

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__512;
  uint64_t v12 = __Block_byref_object_dispose__513;
  id v13 = (id)MEMORY[0x1E4F1CBF0];
  id v4 = [(HMMStandardStatisticsGroup *)self coreDataStorage];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__HMMStandardStatisticsGroup_datePartitions__block_invoke;
  v7[3] = &unk_1E69FD630;
  v7[4] = self;
  v7[5] = &v8;
  [v4 executeWithManagedObjectContextAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __44__HMMStandardStatisticsGroup_datePartitions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"GroupValueStatistics"];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 32) coreDataGroup];
  id v7 = [v5 predicateWithFormat:@"group == %@", v6];
  [v4 setPredicate:v7];

  [v4 setResultType:2];
  [v4 setPropertiesToFetch:&unk_1F2C877D0];
  [v4 setReturnsDistinctResults:1];
  id v31 = 0;
  uint64_t v26 = v3;
  uint64_t v8 = [v3 executeFetchRequest:v4 error:&v31];
  id v9 = v31;
  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x1D944E970]();
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = [*(id *)(a1 + 32) coreDataGroup];
      id v15 = [v14 name];
      *(_DWORD *)buf = 138543874;
      __int16 v34 = v13;
      __int16 v35 = 2114;
      __int16 v36 = v15;
      __int16 v37 = 2114;
      id v38 = v9;
      _os_log_impl(&dword_1D4999000, v12, OS_LOG_TYPE_ERROR, "%{public}@Error getting dates for group %{public}@: %{public}@", buf, 0x20u);
    }
  }
  uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = v8;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = [*(id *)(*((void *)&v27 + 1) + 8 * v21) objectForKeyedSubscript:@"date"];
        [v16 addObject:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v19);
  }

  uint64_t v23 = [v16 copy];
  uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
  v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;
}

- (void)addValue:(int64_t)a3 toStatistics:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HMMStandardStatisticsGroup *)self partitionProvider];
  uint64_t v8 = [v7 currentDatePartition];

  id v9 = [(HMMStandardStatisticsGroup *)self coreDataStorage];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __52__HMMStandardStatisticsGroup_addValue_toStatistics___block_invoke;
  v21[3] = &unk_1E69FD608;
  v21[4] = self;
  id v10 = v6;
  id v22 = v10;
  id v11 = v8;
  id v23 = v11;
  int64_t v24 = a3;
  [v9 executeWithManagedObjectContext:v21];

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v13 = [(NSMutableDictionary *)self->_ephemeralContainers allValues];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v16++) addValue:a3 toStatistics:v10];
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }

  os_unfair_lock_unlock(p_lock);
}

void __52__HMMStandardStatisticsGroup_addValue_toStatistics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"GroupValueStatistics"];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 32) coreDataGroup];
  id v7 = [v5 predicateWithFormat:@"(group == %@) && (name == %@) && (date == %@)", v6, *(void *)(a1 + 40), *(void *)(a1 + 48)];
  [v4 setPredicate:v7];

  id v31 = 0;
  uint64_t v8 = [v3 executeFetchRequest:v4 error:&v31];
  id v9 = v31;
  if ([v8 count])
  {
    if ([v8 count] == 1)
    {
      id v10 = [v8 objectAtIndexedSubscript:0];
    }
    else
    {
      long long v18 = (void *)MEMORY[0x1D944E970]();
      id v19 = *(id *)(a1 + 32);
      long long v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        uint64_t v28 = *(void *)(a1 + 40);
        id v22 = [*(id *)(a1 + 32) coreDataGroup];
        [v22 name];
        v23 = long long v30 = v18;
        *(_DWORD *)buf = 138543874;
        long long v33 = v21;
        __int16 v34 = 2114;
        uint64_t v35 = v28;
        __int16 v36 = 2114;
        __int16 v37 = v23;
        _os_log_impl(&dword_1D4999000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unexpected extra statistics returned for statistic %{public}@ in group %{public}@", buf, 0x20u);

        long long v18 = v30;
      }

      id v10 = 0;
    }
    goto LABEL_12;
  }
  if (!v9)
  {
    id v10 = [[HMMCoreDataGroupValueStatistics alloc] initWithContext:v3];
    int64_t v24 = [*(id *)(a1 + 32) coreDataGroup];
    [(HMMCoreDataGroupValueStatistics *)v10 setGroup:v24];

    [(HMMCoreDataGroupValueStatistics *)v10 setName:*(void *)(a1 + 40)];
    [(HMMCoreDataGroupValueStatistics *)v10 setDate:*(void *)(a1 + 48)];
LABEL_12:
    v25 = [(HMMCoreDataGroupValueStatistics *)v10 addValue:*(void *)(a1 + 56)];
    uint64_t v26 = v25;
    if (v25) {
      objc_msgSend(*(id *)(a1 + 32), "notifyObserversForStatistics:previousMax:newMax:", *(void *)(a1 + 40), objc_msgSend(v25, "integerValue"), *(void *)(a1 + 56));
    }

    goto LABEL_15;
  }
  id v11 = (void *)MEMORY[0x1D944E970]();
  id v12 = *(id *)(a1 + 32);
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    uint64_t v27 = *(void *)(a1 + 40);
    uint64_t v15 = [*(id *)(a1 + 32) coreDataGroup];
    [v15 name];
    uint64_t v16 = v29 = v11;
    uint64_t v17 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138544386;
    long long v33 = v14;
    __int16 v34 = 2114;
    uint64_t v35 = v27;
    __int16 v36 = 2114;
    __int16 v37 = v16;
    __int16 v38 = 2114;
    uint64_t v39 = v17;
    __int16 v40 = 2114;
    id v41 = v9;
    _os_log_impl(&dword_1D4999000, v13, OS_LOG_TYPE_ERROR, "%{public}@Error getting statistics %{public}@ in group %{public}@ on date %{public}@: %{public}@", buf, 0x34u);

    id v11 = v29;
  }

LABEL_15:
}

- (void)notifyObserversForStatistics:(id)a3 previousMax:(int64_t)a4 newMax:(int64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = -[HMMStandardStatisticsGroup observersForStatistics:](self, "observersForStatistics:", v8, 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) updatedCounter:v8 fromOldValue:a4 toNewValue:a5];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (id)observersForStatistics:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableDictionary *)self->_observers objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)addMaxValueObserver:(id)a3 forStatistics:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock_with_options();
  id v8 = [(NSMutableDictionary *)self->_observers objectForKeyedSubscript:v7];
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 arrayByAddingObject:v6];
  }
  else
  {
    v11[0] = v6;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  [(NSMutableDictionary *)self->_observers setObject:v10 forKeyedSubscript:v7];

  os_unfair_lock_unlock(&self->_lock);
}

- (HMMStandardStatisticsGroup)initWithCoreDataGroup:(id)a3 partitionProvider:(id)a4 coreDataStorage:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMMStandardStatisticsGroup;
  uint64_t v12 = [(HMMStandardStatisticsGroup *)&v19 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_coreDataGroup, a3);
    objc_storeStrong((id *)&v13->_partitionProvider, a4);
    objc_storeStrong((id *)&v13->_coreDataStorage, a5);
    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    ephemeralContainers = v13->_ephemeralContainers;
    v13->_ephemeralContainers = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    observers = v13->_observers;
    v13->_observers = (NSMutableDictionary *)v16;
  }
  return v13;
}

+ (void)deleteStatisticsUsingPredicate:(id)a3 coreDataStorage:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__HMMStandardStatisticsGroup_deleteStatisticsUsingPredicate_coreDataStorage___block_invoke;
  v8[3] = &unk_1E69FD6D0;
  id v9 = v6;
  id v10 = a1;
  id v7 = v6;
  [a4 executeWithManagedObjectContextAndWait:v8];
}

void __77__HMMStandardStatisticsGroup_deleteStatisticsUsingPredicate_coreDataStorage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"GroupValueStatistics"];
  [v4 setPredicate:*(void *)(a1 + 32)];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v4];
  [v5 setResultType:1];
  id v18 = 0;
  id v6 = [v3 executeRequest:v5 error:&v18];
  id v7 = v18;
  if (v7)
  {
    id v8 = (void *)MEMORY[0x1D944E970]();
    id v9 = *(id *)(a1 + 40);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      id v23 = v11;
      __int16 v24 = 2114;
      uint64_t v25 = v12;
      __int16 v26 = 2114;
      id v27 = v7;
      _os_log_impl(&dword_1D4999000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error deleting statistics where %{public}@: %{public}@", buf, 0x20u);
    }
  }
  uint64_t v13 = [v6 result];
  uint64_t v14 = (void *)v13;
  if (v13)
  {
    long long v15 = (void *)MEMORY[0x1E4F1C110];
    uint64_t v20 = *MEMORY[0x1E4F1BDC0];
    uint64_t v21 = v13;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v19 = v3;
    long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    [v15 mergeChangesFromRemoteContextSave:v16 intoContexts:v17];
  }
}

+ (void)deletePartitionsAfterDate:(id)a3 coreDataStorage:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = [v6 predicateWithFormat:@"date > %@", a3];
  [a1 deleteStatisticsUsingPredicate:v8 coreDataStorage:v7];
}

+ (void)deletePartitionsBeforeDate:(id)a3 coreDataStorage:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = [v6 predicateWithFormat:@"date < %@", a3];
  [a1 deleteStatisticsUsingPredicate:v8 coreDataStorage:v7];
}

+ (id)groupFromSpecifier:(id)a3 partitionProvider:(id)a4 coreDataStorage:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  long long v29 = __Block_byref_object_copy__512;
  long long v30 = __Block_byref_object_dispose__513;
  id v31 = 0;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __83__HMMStandardStatisticsGroup_groupFromSpecifier_partitionProvider_coreDataStorage___block_invoke;
  id v23 = &unk_1E69FD630;
  uint64_t v25 = &v26;
  id v11 = v8;
  id v24 = v11;
  uint64_t v12 = [v10 executeWithManagedObjectContextAndWait:&v20];
  if (v27[5])
  {
    uint64_t v13 = [HMMStandardStatisticsGroup alloc];
    uint64_t v14 = -[HMMStandardStatisticsGroup initWithCoreDataGroup:partitionProvider:coreDataStorage:](v13, "initWithCoreDataGroup:partitionProvider:coreDataStorage:", v27[5], v9, v10, v20, v21, v22, v23);
  }
  else
  {
    long long v15 = (void *)MEMORY[0x1D944E970](v12);
    id v16 = a1;
    HMFGetOSLogHandle();
    long long v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v33 = v18;
      _os_log_impl(&dword_1D4999000, v17, OS_LOG_TYPE_ERROR, "%{public}@Can't create counter group due to failure to retrieve database group", buf, 0xCu);
    }
    uint64_t v14 = 0;
  }

  _Block_object_dispose(&v26, 8);
  return v14;
}

uint64_t __83__HMMStandardStatisticsGroup_groupFromSpecifier_partitionProvider_coreDataStorage___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) coreDataGroupUsingContext:a2];
  return MEMORY[0x1F41817F8]();
}

@end