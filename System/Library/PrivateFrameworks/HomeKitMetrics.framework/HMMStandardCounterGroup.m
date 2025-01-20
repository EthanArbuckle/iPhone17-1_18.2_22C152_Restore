@interface HMMStandardCounterGroup
+ (id)groupFromSpecifier:(id)a3 dateProvider:(id)a4 partitionProvider:(id)a5 coreDataStorage:(id)a6;
+ (id)groupFromSpecifier:(id)a3 dateProvider:(id)a4 partitionProvider:(id)a5 coreDataStorage:(id)a6 uptimeProvider:(id)a7;
+ (void)deleteCountersUsingPredicate:(id)a3 coreDataStorage:(id)a4;
+ (void)deletePartitionsAfterDate:(id)a3 coreDataStorage:(id)a4;
+ (void)deletePartitionsBeforeDate:(id)a3 coreDataStorage:(id)a4;
- (BOOL)addEphemeralContainerWithName:(id)a3;
- (HMMCoreDataCounterStorage)coreDataStorage;
- (HMMCoreDataNamedGroup)coreDataGroup;
- (HMMCounterDatePartitionProvider)partitionProvider;
- (HMMDateProvider)dateProvider;
- (HMMStandardCounterGroup)initWithCoreDataGroup:(id)a3 dateProvider:(id)a4 partitionProvider:(id)a5 coreDataStorage:(id)a6;
- (HMMStandardCounterGroup)initWithCoreDataGroup:(id)a3 dateProvider:(id)a4 partitionProvider:(id)a5 coreDataStorage:(id)a6 uptimeProvider:(id)a7;
- (HMMUptimeProvider)uptimeProvider;
- (NSArray)ephemeralContainerNames;
- (NSMutableDictionary)ephemeralContainers;
- (NSMutableDictionary)observers;
- (NSMutableDictionary)runningDurationCounters;
- (double)durationForCounter:(id)a3 inDatePartition:(id)a4;
- (double)durationForCounter:(id)a3 inEphemeralContainer:(id)a4;
- (id)countersInDatePartition:(id)a3;
- (id)countersInEphemeralContainer:(id)a3;
- (id)datePartitions;
- (id)observersForCounter:(id)a3;
- (int64_t)sumOfCountersInDatePartition:(id)a3;
- (int64_t)sumOfCountersInEphemeralContainer:(id)a3;
- (int64_t)valueForCounter:(id)a3 inDatePartition:(id)a4;
- (int64_t)valueForCounter:(id)a3 inEphemeralContainer:(id)a4;
- (void)addDuration:(double)a3 toCounter:(id)a4 endTime:(id)a5;
- (void)addObserver:(id)a3 forCounter:(id)a4;
- (void)deactivateEphemeralContainerWithName:(id)a3;
- (void)incrementCounter:(id)a3;
- (void)incrementCounter:(id)a3 by:(int64_t)a4;
- (void)incrementCounter:(id)a3 inDatePartition:(id)a4 by:(int64_t)a5;
- (void)notifyObserversForCounter:(id)a3 previousCount:(int64_t)a4 newCount:(int64_t)a5;
- (void)pauseDurationCounter:(id)a3;
- (void)removeEphemeralContainerWithName:(id)a3;
- (void)resumeDurationCounter:(id)a3;
- (void)updateAllDurationCounters;
- (void)updateDurationCounter:(id)a3;
@end

@implementation HMMStandardCounterGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreDataGroup, 0);
  objc_storeStrong((id *)&self->_runningDurationCounters, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_ephemeralContainers, 0);
  objc_storeStrong((id *)&self->_coreDataStorage, 0);
  objc_storeStrong((id *)&self->_uptimeProvider, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_partitionProvider, 0);
}

- (HMMCoreDataNamedGroup)coreDataGroup
{
  return self->_coreDataGroup;
}

- (NSMutableDictionary)runningDurationCounters
{
  return self->_runningDurationCounters;
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

- (HMMUptimeProvider)uptimeProvider
{
  return self->_uptimeProvider;
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (HMMCounterDatePartitionProvider)partitionProvider
{
  return self->_partitionProvider;
}

- (int64_t)sumOfCountersInEphemeralContainer:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(HMMStandardCounterGroup *)self updateAllDurationCounters];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = -[HMMStandardCounterGroup countersInEphemeralContainer:](self, "countersInEphemeralContainer:", v4, 0);
  v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int64_t v9 = 0;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        v9 += [*(id *)(*((void *)&v13 + 1) + 8 * i) longLongValue];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (id)countersInEphemeralContainer:(id)a3
{
  id v4 = a3;
  [(HMMStandardCounterGroup *)self updateAllDurationCounters];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = [(NSMutableDictionary *)self->_ephemeralContainers objectForKeyedSubscript:v4];
  uint64_t v7 = [v6 counters];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (double)durationForCounter:(id)a3 inEphemeralContainer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(HMMStandardCounterGroup *)self updateDurationCounter:v7];
  uint64_t v8 = [(HMMStandardCounterGroup *)self valueForCounter:v7 inEphemeralContainer:v6];

  return (double)v8;
}

- (int64_t)valueForCounter:(id)a3 inEphemeralContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t v9 = [(NSMutableDictionary *)self->_ephemeralContainers objectForKeyedSubscript:v7];
  uint64_t v10 = [v9 valueForCounter:v6];
  [v10 longLongValue];
  v11 = [(NSMutableDictionary *)self->_ephemeralContainers objectForKeyedSubscript:v7];
  v12 = [v11 valueForCounter:v6];
  int64_t v13 = [v12 longLongValue];

  os_unfair_lock_unlock(p_lock);
  return v13;
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
        uint64_t v10 = [(NSMutableDictionary *)self->_ephemeralContainers objectForKeyedSubscript:v9];
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
    uint64_t v8 = self;
    HMFGetOSLogHandle();
    uint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v13 = 138543618;
      long long v14 = v10;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1D4999000, v9, OS_LOG_TYPE_ERROR, "%{public}@Ephemeral container already exists: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    char v11 = objc_alloc_init(HMMEphemeralCounterContainer);
    [(NSMutableDictionary *)self->_ephemeralContainers setObject:v11 forKeyedSubscript:v4];
  }
  os_unfair_lock_unlock(p_lock);

  return v6 == 0;
}

- (int64_t)sumOfCountersInDatePartition:(id)a3
{
  id v4 = a3;
  [(HMMStandardCounterGroup *)self updateAllDurationCounters];
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v5 = [(HMMStandardCounterGroup *)self coreDataStorage];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__HMMStandardCounterGroup_sumOfCountersInDatePartition___block_invoke;
  v9[3] = &unk_1E69FD6A8;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  char v11 = &v12;
  [v5 executeWithManagedObjectContextAndWait:v9];

  int64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__HMMStandardCounterGroup_sumOfCountersInDatePartition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"GroupCounter"];
  v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 32) coreDataGroup];
  int64_t v7 = [v5 predicateWithFormat:@"(group == %@) && (date == %@)", v6, *(void *)(a1 + 40)];
  [v4 setPredicate:v7];

  id v28 = 0;
  uint64_t v8 = [v3 executeFetchRequest:v4 error:&v28];
  id v9 = v28;
  if (v9)
  {
    id v10 = (void *)MEMORY[0x1D944E970]();
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      int v13 = v23 = v3;
      uint64_t v14 = [*(id *)(a1 + 32) coreDataGroup];
      [v14 name];
      uint64_t v15 = v22 = v10;
      uint64_t v16 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v31 = v13;
      __int16 v32 = 2114;
      v33 = v15;
      __int16 v34 = 2114;
      uint64_t v35 = v16;
      __int16 v36 = 2114;
      id v37 = v9;
      _os_log_impl(&dword_1D4999000, v12, OS_LOG_TYPE_ERROR, "%{public}@Error getting all counters in group %{public}@ on date %{public}@: %{public}@", buf, 0x2Au);

      id v10 = v22;
      id v3 = v23;
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v17 = v8;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [*(id *)(*((void *)&v24 + 1) + 8 * v21++) value];
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v19);
  }
}

- (id)countersInDatePartition:(id)a3
{
  id v4 = a3;
  [(HMMStandardCounterGroup *)self updateAllDurationCounters];
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__826;
  uint64_t v16 = __Block_byref_object_dispose__827;
  id v17 = (id)MEMORY[0x1E4F1CC08];
  v5 = [(HMMStandardCounterGroup *)self coreDataStorage];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__HMMStandardCounterGroup_countersInDatePartition___block_invoke;
  v9[3] = &unk_1E69FD6A8;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [v5 executeWithManagedObjectContextAndWait:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __51__HMMStandardCounterGroup_countersInDatePartition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"GroupCounter"];
  v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 32) coreDataGroup];
  id v7 = [v5 predicateWithFormat:@"(group == %@) && (date == %@)", v6, *(void *)(a1 + 40)];
  [v4 setPredicate:v7];

  id v34 = 0;
  id v28 = v3;
  uint64_t v8 = [v3 executeFetchRequest:v4 error:&v34];
  id v29 = v34;
  if (v29)
  {
    id v9 = (void *)MEMORY[0x1D944E970]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = [*(id *)(a1 + 32) coreDataGroup];
      uint64_t v14 = [v13 name];
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      id v37 = v12;
      __int16 v38 = 2114;
      v39 = v14;
      __int16 v40 = 2114;
      uint64_t v41 = v15;
      __int16 v42 = 2114;
      id v43 = v29;
      _os_log_impl(&dword_1D4999000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error getting all counters in group %{public}@ on date %{public}@: %{public}@", buf, 0x2Au);
    }
  }
  uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v17 = v8;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v23 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v22, "value"));
        long long v24 = [v22 name];
        [v16 setObject:v23 forKey:v24];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v19);
  }

  uint64_t v25 = [v16 copy];
  uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = v25;
}

- (double)durationForCounter:(id)a3 inDatePartition:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(HMMStandardCounterGroup *)self updateDurationCounter:v7];
  uint64_t v8 = [(HMMStandardCounterGroup *)self valueForCounter:v7 inDatePartition:v6];

  return (double)v8;
}

- (void)addDuration:(double)a3 toCounter:(id)a4 endTime:(id)a5
{
  id v16 = a4;
  id v8 = a5;
  id v9 = [v8 addTimeInterval:-a3];
  id v10 = [(HMMStandardCounterGroup *)self partitionProvider];
  id v11 = [v10 datePartitionContainingDate:v8];

  if ([v9 compare:v11] == -1)
  {
    do
    {
      [v8 timeIntervalSinceDate:v11];
      [(HMMStandardCounterGroup *)self incrementCounter:v16 inDatePartition:v11 by:llround(v13)];
      id v12 = v11;

      uint64_t v14 = [(HMMStandardCounterGroup *)self partitionProvider];
      id v11 = [v14 datePartitionWithOffset:-1 fromDatePartition:v12];

      id v8 = v12;
    }
    while ([v9 compare:v11] == -1);
  }
  else
  {
    id v12 = v8;
  }
  [v12 timeIntervalSinceDate:v9];
  [(HMMStandardCounterGroup *)self incrementCounter:v16 inDatePartition:v11 by:llround(v15)];
}

- (void)updateAllDurationCounters
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMMStandardCounterGroup *)self uptimeProvider];
  [v3 uptime];
  double v5 = v4;

  id v6 = [(HMMStandardCounterGroup *)self dateProvider];
  uint64_t v18 = [v6 currentDate];

  id v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:v5];
  os_unfair_lock_lock_with_options();
  id v8 = [(HMMStandardCounterGroup *)self runningDurationCounters];
  id v9 = (void *)[v8 copy];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = [(HMMStandardCounterGroup *)self runningDurationCounters];
  id v11 = [v10 allKeys];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v23;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * v14);
        id v16 = [(HMMStandardCounterGroup *)self runningDurationCounters];
        [v16 setObject:v7 forKeyedSubscript:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  os_unfair_lock_unlock(&self->_lock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __52__HMMStandardCounterGroup_updateAllDurationCounters__block_invoke;
  v19[3] = &unk_1E69FD680;
  double v21 = v5;
  v19[4] = self;
  id v20 = v18;
  id v17 = v18;
  [v9 enumerateKeysAndObjectsUsingBlock:v19];
}

void __52__HMMStandardCounterGroup_updateAllDurationCounters__block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5 = *(void **)(a1 + 32);
  double v6 = *(double *)(a1 + 48);
  id v8 = a2;
  [a3 doubleValue];
  [v5 addDuration:v8 toCounter:*(void *)(a1 + 40) endTime:v6 - v7];
}

- (void)updateDurationCounter:(id)a3
{
  id v15 = a3;
  os_unfair_lock_lock_with_options();
  double v4 = [(HMMStandardCounterGroup *)self runningDurationCounters];
  double v5 = [v4 objectForKeyedSubscript:v15];

  if (v5)
  {
    [v5 doubleValue];
    double v7 = v6;
    id v8 = [(HMMStandardCounterGroup *)self uptimeProvider];
    [v8 uptime];
    double v10 = v9;

    id v11 = [(HMMStandardCounterGroup *)self dateProvider];
    uint64_t v12 = [v11 currentDate];

    uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:v10];
    uint64_t v14 = [(HMMStandardCounterGroup *)self runningDurationCounters];
    [v14 setObject:v13 forKeyedSubscript:v15];

    os_unfair_lock_unlock(&self->_lock);
    [(HMMStandardCounterGroup *)self addDuration:v15 toCounter:v12 endTime:v10 - v7];
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (int64_t)valueForCounter:(id)a3 inDatePartition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  id v8 = [(HMMStandardCounterGroup *)self coreDataStorage];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__HMMStandardCounterGroup_valueForCounter_inDatePartition___block_invoke;
  v13[3] = &unk_1E69FD658;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  id v16 = &v17;
  [v8 executeWithManagedObjectContextAndWait:v13];

  int64_t v11 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __59__HMMStandardCounterGroup_valueForCounter_inDatePartition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"GroupCounter"];
  double v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 32) coreDataGroup];
  id v7 = [v5 predicateWithFormat:@"(group == %@) && (name == %@) && (date == %@)", v6, *(void *)(a1 + 40), *(void *)(a1 + 48)];
  [v4 setPredicate:v7];

  id v24 = 0;
  id v8 = [v3 executeFetchRequest:v4 error:&v24];
  id v9 = v24;
  if (![v8 count])
  {
    if (!v9) {
      goto LABEL_11;
    }
    int64_t v11 = (void *)MEMORY[0x1D944E970]();
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v21 = *(void *)(a1 + 40);
      id v15 = [*(id *)(a1 + 32) coreDataGroup];
      [v15 name];
      id v16 = v22 = v11;
      uint64_t v17 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544386;
      uint64_t v26 = v14;
      __int16 v27 = 2114;
      uint64_t v28 = v21;
      __int16 v29 = 2114;
      long long v30 = v16;
      __int16 v31 = 2114;
      uint64_t v32 = v17;
      __int16 v33 = 2114;
      id v34 = v9;
      _os_log_impl(&dword_1D4999000, v13, OS_LOG_TYPE_ERROR, "%{public}@Error getting counter %{public}@ in group %{public}@ on date %{public}@: %{public}@", buf, 0x34u);

      int64_t v11 = v22;
LABEL_9:
    }
LABEL_10:

    goto LABEL_11;
  }
  if ([v8 count] != 1)
  {
    int64_t v11 = (void *)MEMORY[0x1D944E970]();
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      long long v23 = v11;
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v19 = [*(id *)(a1 + 32) coreDataGroup];
      uint64_t v20 = [v19 name];
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v14;
      __int16 v27 = 2114;
      uint64_t v28 = v18;
      int64_t v11 = v23;
      __int16 v29 = 2114;
      long long v30 = v20;
      _os_log_impl(&dword_1D4999000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpected extra counters returned for counter %{public}@ in group %{public}@", buf, 0x20u);

      goto LABEL_9;
    }
    goto LABEL_10;
  }
  id v10 = [v8 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v10 value];

LABEL_11:
}

- (id)datePartitions
{
  id v3 = [(HMMStandardCounterGroup *)self coreDataStorage];
  [v3 save];

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int64_t v11 = __Block_byref_object_copy__826;
  id v12 = __Block_byref_object_dispose__827;
  id v13 = (id)MEMORY[0x1E4F1CBF0];
  double v4 = [(HMMStandardCounterGroup *)self coreDataStorage];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__HMMStandardCounterGroup_datePartitions__block_invoke;
  v7[3] = &unk_1E69FD630;
  v7[4] = self;
  v7[5] = &v8;
  [v4 executeWithManagedObjectContextAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __41__HMMStandardCounterGroup_datePartitions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"GroupCounter"];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 32) coreDataGroup];
  id v7 = [v5 predicateWithFormat:@"group == %@", v6];
  [v4 setPredicate:v7];

  [v4 setResultType:2];
  [v4 setPropertiesToFetch:&unk_1F2C877E8];
  [v4 setReturnsDistinctResults:1];
  id v31 = 0;
  uint64_t v26 = v3;
  uint64_t v8 = [v3 executeFetchRequest:v4 error:&v31];
  id v9 = v31;
  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x1D944E970]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = [*(id *)(a1 + 32) coreDataGroup];
      id v15 = [v14 name];
      *(_DWORD *)buf = 138543874;
      id v34 = v13;
      __int16 v35 = 2114;
      __int16 v36 = v15;
      __int16 v37 = 2114;
      id v38 = v9;
      _os_log_impl(&dword_1D4999000, v12, OS_LOG_TYPE_ERROR, "%{public}@Error getting dates for group %{public}@: %{public}@", buf, 0x20u);
    }
  }
  id v16 = [MEMORY[0x1E4F1CA48] array];
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
        long long v22 = [*(id *)(*((void *)&v27 + 1) + 8 * v21) objectForKeyedSubscript:@"date"];
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
  long long v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;
}

- (void)pauseDurationCounter:(id)a3
{
  id v6 = a3;
  -[HMMStandardCounterGroup updateDurationCounter:](self, "updateDurationCounter:");
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v5 = [(HMMStandardCounterGroup *)self runningDurationCounters];
  [v5 setObject:0 forKeyedSubscript:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)resumeDurationCounter:(id)a3
{
  id v10 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v5 = [(HMMStandardCounterGroup *)self runningDurationCounters];
  id v6 = [v5 objectForKeyedSubscript:v10];

  if (!v6)
  {
    id v7 = (void *)MEMORY[0x1E4F28ED0];
    [(HMMUptimeProvider *)self->_uptimeProvider uptime];
    uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
    id v9 = [(HMMStandardCounterGroup *)self runningDurationCounters];
    [v9 setObject:v8 forKeyedSubscript:v10];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)incrementCounter:(id)a3 inDatePartition:(id)a4 by:(int64_t)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HMMStandardCounterGroup *)self coreDataStorage];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __63__HMMStandardCounterGroup_incrementCounter_inDatePartition_by___block_invoke;
  v22[3] = &unk_1E69FD608;
  v22[4] = self;
  id v11 = v8;
  id v23 = v11;
  id v12 = v9;
  id v24 = v12;
  int64_t v25 = a5;
  [v10 executeWithManagedObjectContext:v22];

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v14 = [(NSMutableDictionary *)self->_ephemeralContainers allValues];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v17++) incrementCounter:v11 by:a5];
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }

  os_unfair_lock_unlock(p_lock);
}

void __63__HMMStandardCounterGroup_incrementCounter_inDatePartition_by___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"GroupCounter"];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 32) coreDataGroup];
  id v7 = [v5 predicateWithFormat:@"(group == %@) && (name == %@) && (date == %@)", v6, *(void *)(a1 + 40), *(void *)(a1 + 48)];
  [v4 setPredicate:v7];

  id v31 = 0;
  id v8 = [v3 executeFetchRequest:v4 error:&v31];
  id v9 = v31;
  if ([v8 count])
  {
    if ([v8 count] == 1)
    {
      id v10 = [v8 objectAtIndexedSubscript:0];
      uint64_t v11 = [(HMMCoreDataGroupCounter *)v10 value];
      uint64_t v12 = *(void *)(a1 + 56) + v11;
      [(HMMCoreDataGroupCounter *)v10 setValue:v12];
      id v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = v11;
      uint64_t v16 = v12;
LABEL_12:
      [v13 notifyObserversForCounter:v14 previousCount:v15 newCount:v16];

      goto LABEL_13;
    }
    uint64_t v17 = (void *)MEMORY[0x1D944E970]();
    id v18 = *(id *)(a1 + 32);
    long long v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      long long v20 = HMFGetLogIdentifier();
      long long v30 = v17;
      uint64_t v24 = *(void *)(a1 + 40);
      int64_t v25 = [*(id *)(a1 + 32) coreDataGroup];
      uint64_t v26 = [v25 name];
      *(_DWORD *)buf = 138543874;
      __int16 v33 = v20;
      __int16 v34 = 2114;
      uint64_t v35 = v24;
      uint64_t v17 = v30;
      __int16 v36 = 2114;
      __int16 v37 = v26;
      _os_log_impl(&dword_1D4999000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unexpected extra counters returned for counter %{public}@ in group %{public}@", buf, 0x20u);

      goto LABEL_9;
    }
  }
  else
  {
    if (!v9)
    {
      id v10 = [[HMMCoreDataGroupCounter alloc] initWithContext:v3];
      uint64_t v27 = [*(id *)(a1 + 32) coreDataGroup];
      [(HMMCoreDataGroupCounter *)v10 setGroup:v27];

      [(HMMCoreDataGroupCounter *)v10 setName:*(void *)(a1 + 40)];
      [(HMMCoreDataGroupCounter *)v10 setDate:*(void *)(a1 + 48)];
      [(HMMCoreDataGroupCounter *)v10 setValue:*(void *)(a1 + 56)];
      id v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 56);
      uint64_t v15 = 0;
      goto LABEL_12;
    }
    uint64_t v17 = (void *)MEMORY[0x1D944E970]();
    id v18 = *(id *)(a1 + 32);
    long long v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      long long v20 = HMFGetLogIdentifier();
      uint64_t v28 = *(void *)(a1 + 40);
      long long v21 = [*(id *)(a1 + 32) coreDataGroup];
      [v21 name];
      v22 = long long v29 = v17;
      uint64_t v23 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544386;
      __int16 v33 = v20;
      __int16 v34 = 2114;
      uint64_t v35 = v28;
      __int16 v36 = 2114;
      __int16 v37 = v22;
      __int16 v38 = 2114;
      uint64_t v39 = v23;
      __int16 v40 = 2114;
      id v41 = v9;
      _os_log_impl(&dword_1D4999000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error getting counter %{public}@ in group %{public}@ on date %{public}@: %{public}@", buf, 0x34u);

      uint64_t v17 = v29;
LABEL_9:
    }
  }

LABEL_13:
}

- (void)incrementCounter:(id)a3 by:(int64_t)a4
{
  id v6 = a3;
  id v8 = [(HMMStandardCounterGroup *)self partitionProvider];
  id v7 = [v8 currentDatePartition];
  [(HMMStandardCounterGroup *)self incrementCounter:v6 inDatePartition:v7 by:a4];
}

- (void)incrementCounter:(id)a3
{
}

- (void)notifyObserversForCounter:(id)a3 previousCount:(int64_t)a4 newCount:(int64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = -[HMMStandardCounterGroup observersForCounter:](self, "observersForCounter:", v8, 0);
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

- (id)observersForCounter:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableDictionary *)self->_observers objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)addObserver:(id)a3 forCounter:(id)a4
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

- (HMMStandardCounterGroup)initWithCoreDataGroup:(id)a3 dateProvider:(id)a4 partitionProvider:(id)a5 coreDataStorage:(id)a6 uptimeProvider:(id)a7
{
  id v26 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)HMMStandardCounterGroup;
  long long v17 = [(HMMStandardCounterGroup *)&v27 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_coreDataGroup, a3);
    objc_storeStrong((id *)&v18->_uptimeProvider, a7);
    objc_storeStrong((id *)&v18->_dateProvider, a4);
    objc_storeStrong((id *)&v18->_partitionProvider, a5);
    objc_storeStrong((id *)&v18->_coreDataStorage, a6);
    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    ephemeralContainers = v18->_ephemeralContainers;
    v18->_ephemeralContainers = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
    observers = v18->_observers;
    v18->_observers = (NSMutableDictionary *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
    runningDurationCounters = v18->_runningDurationCounters;
    v18->_runningDurationCounters = (NSMutableDictionary *)v23;
  }
  return v18;
}

- (HMMStandardCounterGroup)initWithCoreDataGroup:(id)a3 dateProvider:(id)a4 partitionProvider:(id)a5 coreDataStorage:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[HMMUptimeProvider sharedInstance];
  id v15 = [(HMMStandardCounterGroup *)self initWithCoreDataGroup:v13 dateProvider:v12 partitionProvider:v11 coreDataStorage:v10 uptimeProvider:v14];

  return v15;
}

+ (void)deleteCountersUsingPredicate:(id)a3 coreDataStorage:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__HMMStandardCounterGroup_deleteCountersUsingPredicate_coreDataStorage___block_invoke;
  v8[3] = &unk_1E69FD6D0;
  id v9 = v6;
  id v10 = a1;
  id v7 = v6;
  [a4 executeWithManagedObjectContextAndWait:v8];
}

void __72__HMMStandardCounterGroup_deleteCountersUsingPredicate_coreDataStorage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"GroupCounter"];
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
      uint64_t v23 = v11;
      __int16 v24 = 2114;
      uint64_t v25 = v12;
      __int16 v26 = 2114;
      id v27 = v7;
      _os_log_impl(&dword_1D4999000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error deleting counters where %{public}@: %{public}@", buf, 0x20u);
    }
  }
  uint64_t v13 = [v6 result];
  id v14 = (void *)v13;
  if (v13)
  {
    id v15 = (void *)MEMORY[0x1E4F1C110];
    uint64_t v20 = *MEMORY[0x1E4F1BDC0];
    uint64_t v21 = v13;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
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
  [a1 deleteCountersUsingPredicate:v8 coreDataStorage:v7];
}

+ (void)deletePartitionsBeforeDate:(id)a3 coreDataStorage:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = [v6 predicateWithFormat:@"date < %@", a3];
  [a1 deleteCountersUsingPredicate:v8 coreDataStorage:v7];
}

+ (id)groupFromSpecifier:(id)a3 dateProvider:(id)a4 partitionProvider:(id)a5 coreDataStorage:(id)a6 uptimeProvider:(id)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v32 = 0;
  __int16 v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__826;
  __int16 v36 = __Block_byref_object_dispose__827;
  id v37 = 0;
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  uint64_t v28 = __108__HMMStandardCounterGroup_groupFromSpecifier_dateProvider_partitionProvider_coreDataStorage_uptimeProvider___block_invoke;
  long long v29 = &unk_1E69FD630;
  id v31 = &v32;
  id v17 = v12;
  id v30 = v17;
  uint64_t v18 = [v15 executeWithManagedObjectContextAndWait:&v26];
  if (v33[5])
  {
    id v19 = [HMMStandardCounterGroup alloc];
    uint64_t v20 = -[HMMStandardCounterGroup initWithCoreDataGroup:dateProvider:partitionProvider:coreDataStorage:uptimeProvider:](v19, "initWithCoreDataGroup:dateProvider:partitionProvider:coreDataStorage:uptimeProvider:", v33[5], v13, v14, v15, v16, v26, v27, v28, v29);
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x1D944E970](v18);
    id v22 = a1;
    HMFGetOSLogHandle();
    uint64_t v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v24;
      _os_log_impl(&dword_1D4999000, v23, OS_LOG_TYPE_ERROR, "%{public}@Can't create counter group due to failure to retrieve database group", buf, 0xCu);
    }
    uint64_t v20 = 0;
  }

  _Block_object_dispose(&v32, 8);
  return v20;
}

uint64_t __108__HMMStandardCounterGroup_groupFromSpecifier_dateProvider_partitionProvider_coreDataStorage_uptimeProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) coreDataGroupUsingContext:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

+ (id)groupFromSpecifier:(id)a3 dateProvider:(id)a4 partitionProvider:(id)a5 coreDataStorage:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[HMMUptimeProvider sharedInstance];
  id v15 = [a1 groupFromSpecifier:v13 dateProvider:v12 partitionProvider:v11 coreDataStorage:v10 uptimeProvider:v14];

  return v15;
}

@end