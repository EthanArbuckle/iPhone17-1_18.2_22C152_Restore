@interface ACHLegacyAchievementStore
- (ACHAchievementProgressEngine)progressProvider;
- (ACHEarnedInstanceStore)earnedInstanceStore;
- (ACHLegacyAchievementStore)initWithTemplateStore:(id)a3 earnedInstanceStore:(id)a4 templateAssetRegistry:(id)a5 progressProvider:(id)a6;
- (ACHTemplateAssetRegistry)templateAssetRegistry;
- (ACHTemplateStore)templateStore;
- (BOOL)_queue_addProgressAndGoalToAchievement:(id)a3;
- (BOOL)earnedInstanceStoreDidFinishInitialFetch;
- (BOOL)templateStoreDidFinishInitialFetch;
- (NSHashTable)observers;
- (NSMutableDictionary)achievementsByTemplateUniqueName;
- (OS_dispatch_queue)notificationQueue;
- (OS_dispatch_queue)synchronizationQueue;
- (id)_queue_ephemeralMonthlyChallengeAchievementForTemplateUniqueName:(id)a3 earnedInstance:(id)a4;
- (id)achievementWithTemplateUniqueName:(id)a3;
- (id)achievementsForEarnedDateComponents:(id)a3;
- (id)allAchievements;
- (id)ephemeralAchievementWithTemplateUniqueName:(id)a3;
- (void)_notifyObserversOfInitialFetchCompletion;
- (void)_notifyObserversOfNewAchievements:(id)a3;
- (void)_notifyObserversOfRemovedAchievements:(id)a3;
- (void)_notifyObserversOfUpdatedAchievements:(id)a3;
- (void)_queue_addEarnedInstancesToLocalStore:(id)a3;
- (void)_queue_addTemplatesToLocalStore:(id)a3;
- (void)_queue_populateResourcesForAchievementsWithTemplateSourceName:(id)a3;
- (void)_queue_removeEarnedInstancesFromLocalStore:(id)a3;
- (void)_queue_removeTemplatesFromLocalStore:(id)a3;
- (void)addObserver:(id)a3;
- (void)earnedInstanceStore:(id)a3 didAddNewEarnedInstances:(id)a4;
- (void)earnedInstanceStore:(id)a3 didRemoveEarnedInstances:(id)a4;
- (void)earnedInstanceStoreDidFinishInitialFetch:(id)a3;
- (void)loadAllAchievementsFromDatabaseIfNecessaryWithCompletionHandler:(id)a3;
- (void)processAchievementProgressUpdates:(id)a3;
- (void)progressProviderDidUpdateProgressValues:(id)a3;
- (void)recalculateProgressForAllAchievements;
- (void)removeObserver:(id)a3;
- (void)requestUpdateProgressValuesForProgressProvider:(id)a3;
- (void)setAchievementsByTemplateUniqueName:(id)a3;
- (void)setEarnedInstanceStore:(id)a3;
- (void)setEarnedInstanceStoreDidFinishInitialFetch:(BOOL)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setObservers:(id)a3;
- (void)setProgressProvider:(id)a3;
- (void)setSynchronizationQueue:(id)a3;
- (void)setTemplateAssetRegistry:(id)a3;
- (void)setTemplateStore:(id)a3;
- (void)setTemplateStoreDidFinishInitialFetch:(BOOL)a3;
- (void)templateAssetRegistry:(id)a3 didUpdateResourcesForTemplatesWithSourceName:(id)a4;
- (void)templateStore:(id)a3 didAddNewTemplates:(id)a4;
- (void)templateStore:(id)a3 didRemoveTemplates:(id)a4;
- (void)templateStoreDidFinishInitialFetch:(id)a3;
@end

@implementation ACHLegacyAchievementStore

- (ACHLegacyAchievementStore)initWithTemplateStore:(id)a3 earnedInstanceStore:(id)a4 templateAssetRegistry:(id)a5 progressProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)ACHLegacyAchievementStore;
  v15 = [(ACHLegacyAchievementStore *)&v26 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_templateStore, a3);
    objc_storeStrong((id *)&v16->_earnedInstanceStore, a4);
    objc_storeStrong((id *)&v16->_templateAssetRegistry, a5);
    objc_storeStrong((id *)&v16->_progressProvider, a6);
    [(ACHTemplateAssetRegistry *)v16->_templateAssetRegistry setDelegate:v16];
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    achievementsByTemplateUniqueName = v16->_achievementsByTemplateUniqueName;
    v16->_achievementsByTemplateUniqueName = v17;

    uint64_t v19 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v16->_observers;
    v16->_observers = (NSHashTable *)v19;

    uint64_t v21 = HKCreateSerialDispatchQueue();
    notificationQueue = v16->_notificationQueue;
    v16->_notificationQueue = (OS_dispatch_queue *)v21;

    uint64_t v23 = HKCreateSerialDispatchQueue();
    synchronizationQueue = v16->_synchronizationQueue;
    v16->_synchronizationQueue = (OS_dispatch_queue *)v23;

    [v11 addObserver:v16];
    [v12 addObserver:v16];
  }

  return v16;
}

- (void)loadAllAchievementsFromDatabaseIfNecessaryWithCompletionHandler:(id)a3
{
  id v9 = a3;
  v4 = [(ACHLegacyAchievementStore *)self templateStore];
  int v5 = [v4 loadAllTemplatesFromDatabaseIfNecessary];

  v6 = [(ACHLegacyAchievementStore *)self earnedInstanceStore];
  unsigned int v7 = [v6 loadAllEarnedInstancesFromDatabaseIfNecessary];

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, v5 & v7);
    v8 = v9;
  }
}

- (id)achievementsForEarnedDateComponents:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x263EFFA08]);
  return v3;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26D129590])
  {
    int v5 = [(ACHLegacyAchievementStore *)self notificationQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __41__ACHLegacyAchievementStore_addObserver___block_invoke;
    v7[3] = &unk_264515DE0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    v6 = ACHLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACHLegacyAchievementStore addObserver:]((uint64_t)v4, v6);
    }
  }
}

uint64_t __41__ACHLegacyAchievementStore_addObserver___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];

  uint64_t result = [*(id *)(a1 + 32) templateStoreDidFinishInitialFetch];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) earnedInstanceStoreDidFinishInitialFetch];
    if (result)
    {
      uint64_t result = objc_opt_respondsToSelector();
      if (result)
      {
        uint64_t v5 = *(void *)(a1 + 32);
        id v4 = *(void **)(a1 + 40);
        return [v4 achievementStoreDidFinishInitialFetch:v5];
      }
    }
  }
  return result;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHLegacyAchievementStore *)self notificationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__ACHLegacyAchievementStore_removeObserver___block_invoke;
  v7[3] = &unk_264515DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__ACHLegacyAchievementStore_removeObserver___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observers];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) observers];
    [v4 removeObject:*(void *)(a1 + 40)];
  }
}

- (void)_notifyObserversOfInitialFetchCompletion
{
  if ([(ACHLegacyAchievementStore *)self templateStoreDidFinishInitialFetch])
  {
    if ([(ACHLegacyAchievementStore *)self earnedInstanceStoreDidFinishInitialFetch])
    {
      int v3 = [(ACHLegacyAchievementStore *)self notificationQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __69__ACHLegacyAchievementStore__notifyObserversOfInitialFetchCompletion__block_invoke;
      block[3] = &unk_264515DB8;
      block[4] = self;
      dispatch_async(v3, block);
    }
  }
}

void __69__ACHLegacyAchievementStore__notifyObserversOfInitialFetchCompletion__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        unsigned int v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 achievementStoreDidFinishInitialFetch:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_notifyObserversOfNewAchievements:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHLegacyAchievementStore *)self notificationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__ACHLegacyAchievementStore__notifyObserversOfNewAchievements___block_invoke;
  v7[3] = &unk_264515DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __63__ACHLegacyAchievementStore__notifyObserversOfNewAchievements___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) achievementStore:*(void *)(a1 + 32) didAddAchievements:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_notifyObserversOfUpdatedAchievements:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHLegacyAchievementStore *)self notificationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__ACHLegacyAchievementStore__notifyObserversOfUpdatedAchievements___block_invoke;
  v7[3] = &unk_264515DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__ACHLegacyAchievementStore__notifyObserversOfUpdatedAchievements___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) achievementStore:*(void *)(a1 + 32) didUpdateAchievements:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_notifyObserversOfRemovedAchievements:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHLegacyAchievementStore *)self notificationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__ACHLegacyAchievementStore__notifyObserversOfRemovedAchievements___block_invoke;
  v7[3] = &unk_264515DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__ACHLegacyAchievementStore__notifyObserversOfRemovedAchievements___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) achievementStore:*(void *)(a1 + 32) didRemoveAchievements:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)allAchievements
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__11;
  long long v11 = __Block_byref_object_dispose__11;
  id v12 = 0;
  uint64_t v3 = [(ACHLegacyAchievementStore *)self synchronizationQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__ACHLegacyAchievementStore_allAchievements__block_invoke;
  v6[3] = &unk_264516580;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __44__ACHLegacyAchievementStore_allAchievements__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263EFFA08];
  id v7 = [*(id *)(a1 + 32) achievementsByTemplateUniqueName];
  uint64_t v3 = [v7 allValues];
  uint64_t v4 = [v2 setWithArray:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)achievementWithTemplateUniqueName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__11;
    v15 = __Block_byref_object_dispose__11;
    id v16 = 0;
    uint64_t v5 = [(ACHLegacyAchievementStore *)self synchronizationQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__ACHLegacyAchievementStore_achievementWithTemplateUniqueName___block_invoke;
    block[3] = &unk_2645165A8;
    long long v10 = &v11;
    block[4] = self;
    id v9 = v4;
    dispatch_sync(v5, block);

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __63__ACHLegacyAchievementStore_achievementWithTemplateUniqueName___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) achievementsByTemplateUniqueName];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)ephemeralAchievementWithTemplateUniqueName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__11;
    id v16 = __Block_byref_object_dispose__11;
    id v17 = 0;
    id v5 = [(ACHLegacyAchievementStore *)self synchronizationQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__ACHLegacyAchievementStore_ephemeralAchievementWithTemplateUniqueName___block_invoke;
    block[3] = &unk_264516E90;
    long long v10 = self;
    uint64_t v11 = &v12;
    id v9 = v4;
    dispatch_sync(v5, block);

    id v6 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __72__ACHLegacyAchievementStore_ephemeralAchievementWithTemplateUniqueName___block_invoke(void *a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F236B8]);
  [v2 setTemplateUniqueName:a1[4]];
  uint64_t v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v4 = *MEMORY[0x263F234C0];
  id v5 = [MEMORY[0x263EFF910] date];
  id v6 = [v3 components:v4 fromDate:v5];
  [v2 setEarnedDateComponents:v6];

  int IsMonthlyChallenge = ACHTemplateUniqueNameIsMonthlyChallenge();
  long long v8 = (void *)a1[5];
  if (IsMonthlyChallenge)
  {
    uint64_t v9 = objc_msgSend(v8, "_queue_ephemeralMonthlyChallengeAchievementForTemplateUniqueName:earnedInstance:", a1[4], v2);
    uint64_t v10 = *(void *)(a1[6] + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    uint64_t v12 = [v8 achievementsByTemplateUniqueName];
    uint64_t v13 = [v12 objectForKeyedSubscript:a1[4]];
    uint64_t v14 = *(void *)(a1[6] + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    id v16 = *(void **)(*(void *)(a1[6] + 8) + 40);
    v21[0] = v2;
    id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
    uint64_t v18 = [v16 shallowCopyReplacingEarnedInstances:v17];
    uint64_t v19 = *(void *)(a1[6] + 8);
    v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
}

- (id)_queue_ephemeralMonthlyChallengeAchievementForTemplateUniqueName:(id)a3 earnedInstance:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  ACHMonthlyChallengeTypeFromTemplateUniqueName();
  long long v8 = [v7 componentsSeparatedByString:@"_"];

  if ([v8 count] == 3)
  {
    v24 = [v8 objectAtIndexedSubscript:1];
    uint64_t v23 = [v8 objectAtIndexedSubscript:2];
    [v24 integerValue];
    [v23 integerValue];
    uint64_t v9 = ACHDateComponentsForYearMonthDay();
    uint64_t v10 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    v22 = [v10 dateFromComponents:v9];
    uint64_t v21 = objc_msgSend(v10, "hk_startOfMonthForDate:addingMonths:", v22, 1);
    objc_msgSend(v10, "hk_startOfDateBySubtractingDays:fromDate:", 1, v21);
    uint64_t v11 = v20 = self;
    uint64_t v12 = [v10 components:28 fromDate:v11];
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F236B0]) initWithStartDateComponents:v9 endDateComponents:v12];
    uint64_t v14 = ACHMonthlyChallengeTemplate();
    [v14 setSourceName:*MEMORY[0x263F23618]];
    id v15 = objc_alloc(MEMORY[0x263F23630]);
    v25[0] = v6;
    id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    id v17 = (void *)[v15 initWithTemplate:v14 earnedInstances:v16];

    uint64_t v18 = [(ACHLegacyAchievementStore *)v20 templateAssetRegistry];
    [v18 populateResourcePropertiesForAchievement:v17];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)recalculateProgressForAllAchievements
{
}

- (void)processAchievementProgressUpdates:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = ACHLogDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = [v4 count];
    _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "processAchievementProgressUpdates for %lu achievements", buf, 0xCu);
  }

  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "templateUniqueName", (void)v18);
        uint64_t v14 = [(ACHLegacyAchievementStore *)self achievementWithTemplateUniqueName:v13];

        if (v14)
        {
          id v15 = [v12 progressQuantity];
          [v14 setProgress:v15];

          id v16 = [v12 goalQuantity];
          [v14 setGoal:v16];

          [v6 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  id v17 = [MEMORY[0x263EFFA08] setWithArray:v6];
  [(ACHLegacyAchievementStore *)self _notifyObserversOfUpdatedAchievements:v17];
}

- (void)requestUpdateProgressValuesForProgressProvider:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = ACHLogDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "requestUpdateProgressValuesForProgressProvider: %@.", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(ACHLegacyAchievementStore *)self progressProvider];
  [(ACHLegacyAchievementStore *)self progressProviderDidUpdateProgressValues:v6];
}

- (void)templateStoreDidFinishInitialFetch:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHLegacyAchievementStore *)self synchronizationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__ACHLegacyAchievementStore_templateStoreDidFinishInitialFetch___block_invoke;
  v7[3] = &unk_264515DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __64__ACHLegacyAchievementStore_templateStoreDidFinishInitialFetch___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) allTemplates];
  objc_msgSend(v2, "_queue_addTemplatesToLocalStore:", v3);

  [*(id *)(a1 + 32) setTemplateStoreDidFinishInitialFetch:1];
  id v4 = *(void **)(a1 + 32);
  return [v4 _notifyObserversOfInitialFetchCompletion];
}

- (void)templateStore:(id)a3 didAddNewTemplates:(id)a4
{
  id v5 = a4;
  id v6 = [(ACHLegacyAchievementStore *)self synchronizationQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__ACHLegacyAchievementStore_templateStore_didAddNewTemplates___block_invoke;
  v8[3] = &unk_264515DE0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __62__ACHLegacyAchievementStore_templateStore_didAddNewTemplates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addTemplatesToLocalStore:", *(void *)(a1 + 40));
}

- (void)templateStore:(id)a3 didRemoveTemplates:(id)a4
{
  id v5 = a4;
  id v6 = [(ACHLegacyAchievementStore *)self synchronizationQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__ACHLegacyAchievementStore_templateStore_didRemoveTemplates___block_invoke;
  v8[3] = &unk_264515DE0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __62__ACHLegacyAchievementStore_templateStore_didRemoveTemplates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeTemplatesFromLocalStore:", *(void *)(a1 + 40));
}

- (void)earnedInstanceStoreDidFinishInitialFetch:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHLegacyAchievementStore *)self synchronizationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__ACHLegacyAchievementStore_earnedInstanceStoreDidFinishInitialFetch___block_invoke;
  v7[3] = &unk_264515DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __70__ACHLegacyAchievementStore_earnedInstanceStoreDidFinishInitialFetch___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) earnedInstances];
  objc_msgSend(v2, "_queue_addEarnedInstancesToLocalStore:", v3);

  [*(id *)(a1 + 32) setEarnedInstanceStoreDidFinishInitialFetch:1];
  id v4 = *(void **)(a1 + 32);
  return [v4 _notifyObserversOfInitialFetchCompletion];
}

- (void)earnedInstanceStore:(id)a3 didAddNewEarnedInstances:(id)a4
{
  id v5 = a4;
  id v6 = [(ACHLegacyAchievementStore *)self synchronizationQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__ACHLegacyAchievementStore_earnedInstanceStore_didAddNewEarnedInstances___block_invoke;
  v8[3] = &unk_264515DE0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __74__ACHLegacyAchievementStore_earnedInstanceStore_didAddNewEarnedInstances___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addEarnedInstancesToLocalStore:", *(void *)(a1 + 40));
}

- (void)earnedInstanceStore:(id)a3 didRemoveEarnedInstances:(id)a4
{
  id v5 = a4;
  id v6 = [(ACHLegacyAchievementStore *)self synchronizationQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__ACHLegacyAchievementStore_earnedInstanceStore_didRemoveEarnedInstances___block_invoke;
  v8[3] = &unk_264515DE0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __74__ACHLegacyAchievementStore_earnedInstanceStore_didRemoveEarnedInstances___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeEarnedInstancesFromLocalStore:", *(void *)(a1 + 40));
}

- (void)_queue_addTemplatesToLocalStore:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ACHLegacyAchievementStore *)self synchronizationQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
        uint64_t v12 = (void *)MEMORY[0x223C50570]();
        uint64_t v13 = ACHLogDefault();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[ACHLegacyAchievementStore _queue_addTemplatesToLocalStore:]((uint64_t)v29, (uint64_t)v11);
        }

        earnedInstanceStore = self->_earnedInstanceStore;
        id v15 = [v11 uniqueName];
        id v16 = [(ACHEarnedInstanceStore *)earnedInstanceStore earnedInstancesForTemplateUniqueName:v15 error:0];

        id v17 = (void *)[objc_alloc(MEMORY[0x263F23630]) initWithTemplate:v11 earnedInstances:v16];
        [v17 setPrerequisiteMet:1];
        long long v18 = ACHLogAssets();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[ACHLegacyAchievementStore _queue_addTemplatesToLocalStore:]((uint64_t)v28, (uint64_t)v11);
        }

        long long v19 = [(ACHLegacyAchievementStore *)self templateAssetRegistry];
        [v19 populateResourcePropertiesForAchievement:v17];

        [(ACHLegacyAchievementStore *)self _queue_addProgressAndGoalToAchievement:v17];
        long long v20 = [(ACHLegacyAchievementStore *)self achievementsByTemplateUniqueName];
        long long v21 = [v11 uniqueName];
        [v20 setObject:v17 forKeyedSubscript:v21];

        [v6 addObject:v17];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v8);
  }

  if ([v6 count])
  {
    v22 = (void *)[v6 copy];
    [(ACHLegacyAchievementStore *)self _notifyObserversOfNewAchievements:v22];
  }
}

- (void)_queue_removeTemplatesFromLocalStore:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ACHLegacyAchievementStore *)self synchronizationQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      uint64_t v10 = 0;
      uint64_t v31 = v8;
      do
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v35 + 1) + 8 * v10);
        uint64_t v12 = (void *)MEMORY[0x223C50570]();
        uint64_t v13 = ACHLogDefault();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[ACHLegacyAchievementStore _queue_removeTemplatesFromLocalStore:]((uint64_t)v43, (uint64_t)v11);
        }

        uint64_t v14 = [(ACHLegacyAchievementStore *)self achievementsByTemplateUniqueName];
        id v15 = [v11 uniqueName];
        id v16 = [v14 objectForKeyedSubscript:v15];

        if (v16)
        {
          id v17 = [(ACHLegacyAchievementStore *)self achievementsByTemplateUniqueName];
          long long v18 = [v11 uniqueName];
          [v17 setObject:0 forKeyedSubscript:v18];

          [v6 addObject:v16];
          long long v19 = (void *)MEMORY[0x263EFFA08];
          long long v20 = [v16 earnedInstances];
          long long v21 = [v19 setWithArray:v20];

          if ([v21 count])
          {
            v33 = v12;
            v22 = self;
            uint64_t v23 = v9;
            id v24 = v6;
            long long v25 = v22;
            long long v26 = [(ACHLegacyAchievementStore *)v22 earnedInstanceStore];
            long long v27 = [v21 allObjects];
            id v34 = 0;
            [v26 removeEarnedInstances:v27 error:&v34];
            id v28 = v34;

            if (v28)
            {
              v29 = ACHLogDefault();
              uint64_t v9 = v23;
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v40 = v11;
                __int16 v41 = 2114;
                id v42 = v28;
                _os_log_error_impl(&dword_21F5DA000, v29, OS_LOG_TYPE_ERROR, "Unable to remove the earned instances for template: %{public}@. Reason: %{public}@", buf, 0x16u);
              }

              id v6 = v24;
            }
            else
            {
              id v6 = v24;
              uint64_t v9 = v23;
            }
            self = v25;
            uint64_t v8 = v31;
            uint64_t v12 = v33;
          }
        }
        else
        {
          long long v21 = ACHLogDefault();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v40 = v11;
            _os_log_impl(&dword_21F5DA000, v21, OS_LOG_TYPE_DEFAULT, "Achievement store unexpectedly didn't find an achievement instance for template being removed: %{public}@", buf, 0xCu);
          }
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v8);
  }

  if ([v6 count])
  {
    v30 = (void *)[v6 copy];
    [(ACHLegacyAchievementStore *)self _notifyObserversOfRemovedAchievements:v30];
  }
}

- (void)templateAssetRegistry:(id)a3 didUpdateResourcesForTemplatesWithSourceName:(id)a4
{
  id v5 = a4;
  id v6 = [(ACHLegacyAchievementStore *)self synchronizationQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __96__ACHLegacyAchievementStore_templateAssetRegistry_didUpdateResourcesForTemplatesWithSourceName___block_invoke;
  v8[3] = &unk_264515DE0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __96__ACHLegacyAchievementStore_templateAssetRegistry_didUpdateResourcesForTemplatesWithSourceName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_populateResourcesForAchievementsWithTemplateSourceName:", *(void *)(a1 + 40));
}

- (void)_queue_populateResourcesForAchievementsWithTemplateSourceName:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ACHLegacyAchievementStore *)self synchronizationQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = [(ACHLegacyAchievementStore *)self achievementsByTemplateUniqueName];
  uint64_t v8 = [v7 allValues];
  id v9 = [v6 setWithArray:v8];

  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __91__ACHLegacyAchievementStore__queue_populateResourcesForAchievementsWithTemplateSourceName___block_invoke;
  v34[3] = &unk_264516EB8;
  id v10 = v4;
  id v35 = v10;
  uint64_t v11 = objc_msgSend(v9, "hk_filter:", v34);
  if ([v11 count])
  {
    v29 = v9;
    uint64_t v12 = ACHLogAssets();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v11 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v38 = v13;
      __int16 v39 = 2114;
      id v40 = v10;
      _os_log_impl(&dword_21F5DA000, v12, OS_LOG_TYPE_DEFAULT, "Achievement store updating assets for %lu templates for source with identifier %{public}@", buf, 0x16u);
    }
    id v28 = v10;

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v27 = v11;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v20 = (void *)MEMORY[0x223C50570]();
          long long v21 = ACHLogAssets();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = [v19 template];
            uint64_t v23 = [v22 uniqueName];
            *(_DWORD *)buf = 138543362;
            uint64_t v38 = (uint64_t)v23;
            _os_log_impl(&dword_21F5DA000, v21, OS_LOG_TYPE_DEFAULT, "Achievement store updating assets for template %{public}@", buf, 0xCu);
          }
          id v24 = [(ACHLegacyAchievementStore *)self templateAssetRegistry];
          [v24 populateResourcePropertiesForAchievement:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v16);
    }

    long long v25 = ACHLogAssets();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v25, OS_LOG_TYPE_DEFAULT, "Done updating assets. Notifying observers.", buf, 2u);
    }

    long long v26 = (void *)[v14 copy];
    [(ACHLegacyAchievementStore *)self _notifyObserversOfUpdatedAchievements:v26];

    id v10 = v28;
    id v9 = v29;
    uint64_t v11 = v27;
  }
}

uint64_t __91__ACHLegacyAchievementStore__queue_populateResourcesForAchievementsWithTemplateSourceName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 template];
  id v4 = [v3 sourceName];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (void)_queue_addEarnedInstancesToLocalStore:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  __int16 v39 = self;
  uint64_t v5 = [(ACHLegacyAchievementStore *)self synchronizationQueue];
  dispatch_assert_queue_V2(v5);

  id v35 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v47 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v13 = [v12 templateUniqueName];
        id v14 = [v6 objectForKeyedSubscript:v13];

        if (!v14)
        {
          id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
          uint64_t v15 = [v12 templateUniqueName];
          [v6 setObject:v14 forKeyedSubscript:v15];
        }
        [v14 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v9);
  }
  id v34 = v7;

  [v6 allKeys];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [obj countByEnumeratingWithState:&v42 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v43;
    do
    {
      uint64_t v19 = 0;
      uint64_t v36 = v17;
      do
      {
        if (*(void *)v43 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v42 + 1) + 8 * v19);
        long long v21 = (void *)MEMORY[0x223C50570]();
        v22 = [(ACHLegacyAchievementStore *)v39 achievementsByTemplateUniqueName];
        uint64_t v23 = [v22 objectForKeyedSubscript:v20];

        if (v23)
        {
          id v24 = [v6 objectForKeyedSubscript:v20];
          long long v25 = [v23 earnedInstances];
          v40[0] = MEMORY[0x263EF8330];
          v40[1] = 3221225472;
          v40[2] = __67__ACHLegacyAchievementStore__queue_addEarnedInstancesToLocalStore___block_invoke;
          v40[3] = &unk_264516EE0;
          id v26 = v25;
          id v41 = v26;
          long long v27 = objc_msgSend(v24, "hk_filter:", v40);
          if ([v27 count])
          {
            id v28 = [v23 earnedInstances];
            [v28 arrayByAddingObjectsFromArray:v27];
            uint64_t v38 = v21;
            id v29 = v6;
            long long v31 = v30 = v18;

            uint64_t v32 = [v23 shallowCopyReplacingEarnedInstances:v31];

            long long v33 = [(ACHLegacyAchievementStore *)v39 achievementsByTemplateUniqueName];
            [v33 setObject:v32 forKeyedSubscript:v20];

            [v35 addObject:v32];
            uint64_t v18 = v30;
            id v6 = v29;
            long long v21 = v38;
            uint64_t v23 = v32;
            uint64_t v17 = v36;
          }
        }
        else
        {
          uint64_t v23 = ACHLogDefault();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v51 = v20;
            _os_log_debug_impl(&dword_21F5DA000, v23, OS_LOG_TYPE_DEBUG, "Achievement store didn't find achievement instance for template unique name (%{public}@)", buf, 0xCu);
          }
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [obj countByEnumeratingWithState:&v42 objects:v52 count:16];
    }
    while (v17);
  }

  if ([v35 count]) {
    [(ACHLegacyAchievementStore *)v39 _notifyObserversOfUpdatedAchievements:v35];
  }
}

uint64_t __67__ACHLegacyAchievementStore__queue_addEarnedInstancesToLocalStore___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8), "isEqual:", v3, (void)v11))
        {
          uint64_t v9 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 1;
LABEL_11:

  return v9;
}

- (void)_queue_removeEarnedInstancesFromLocalStore:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ACHLegacyAchievementStore *)self synchronizationQueue];
  dispatch_assert_queue_V2(v5);

  id v38 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v56 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        long long v13 = [v12 templateUniqueName];
        id v14 = [v6 objectForKeyedSubscript:v13];

        if (!v14)
        {
          id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
          uint64_t v15 = [v12 templateUniqueName];
          [v6 setObject:v14 forKeyedSubscript:v15];
        }
        [v14 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v9);
  }
  long long v37 = v7;

  [v6 allKeys];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
  uint64_t v43 = v16;
  if (v16)
  {
    uint64_t v17 = *(void *)v52;
    id v40 = v6;
    id v41 = self;
    uint64_t v39 = *(void *)v52;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v52 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v51 + 1) + 8 * v18);
        uint64_t v20 = (void *)MEMORY[0x223C50570](v16);
        long long v21 = [(ACHLegacyAchievementStore *)self achievementsByTemplateUniqueName];
        v22 = [v21 objectForKeyedSubscript:v19];

        if (v22)
        {
          long long v44 = v20;
          uint64_t v45 = v18;
          long long v46 = v22;
          uint64_t v23 = [v22 earnedInstances];
          id v24 = (void *)[v23 mutableCopy];

          long long v25 = [v6 objectForKeyedSubscript:v19];
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v47 objects:v59 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            char v28 = 0;
            uint64_t v29 = *(void *)v48;
            do
            {
              for (uint64_t j = 0; j != v27; ++j)
              {
                if (*(void *)v48 != v29) {
                  objc_enumerationMutation(v25);
                }
                uint64_t v31 = *(void *)(*((void *)&v47 + 1) + 8 * j);
                if ([v24 containsObject:v31])
                {
                  [v24 removeObject:v31];
                  char v28 = 1;
                }
                else
                {
                  uint64_t v32 = ACHLogDefault();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v61 = v31;
                    _os_log_impl(&dword_21F5DA000, v32, OS_LOG_TYPE_DEFAULT, "Achievement store unexpectedly didn't find an achievement earned instance to remove for removed earned instance: %@", buf, 0xCu);
                  }
                }
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v47 objects:v59 count:16];
            }
            while (v27);
            if (v28)
            {
              long long v33 = (void *)[v24 copy];
              uint64_t v34 = [v46 shallowCopyReplacingEarnedInstances:v33];

              self = v41;
              id v35 = [(ACHLegacyAchievementStore *)v41 achievementsByTemplateUniqueName];
              [v35 setObject:v34 forKeyedSubscript:v19];

              [v38 addObject:v34];
              long long v46 = v34;
            }
            else
            {
              self = v41;
            }
            uint64_t v17 = v39;
            id v6 = v40;
          }

          uint64_t v20 = v44;
          uint64_t v18 = v45;
          uint64_t v36 = v46;
        }
        else
        {
          uint64_t v36 = ACHLogDefault();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v61 = v19;
            _os_log_impl(&dword_21F5DA000, v36, OS_LOG_TYPE_DEFAULT, "Achievement store unexpectedly didn't find an achievement instance for removed earned instance with template unique name (%@)", buf, 0xCu);
          }
        }

        ++v18;
      }
      while (v18 != v43);
      uint64_t v16 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
      uint64_t v43 = v16;
    }
    while (v16);
  }

  if ([v38 count]) {
    [(ACHLegacyAchievementStore *)self _notifyObserversOfUpdatedAchievements:v38];
  }
}

- (void)progressProviderDidUpdateProgressValues:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHLegacyAchievementStore *)self progressProvider];

  if (v5 == v4)
  {
    id v6 = [(ACHLegacyAchievementStore *)self synchronizationQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__ACHLegacyAchievementStore_progressProviderDidUpdateProgressValues___block_invoke;
    block[3] = &unk_264515DB8;
    void block[4] = self;
    dispatch_async(v6, block);
  }
}

void __69__ACHLegacyAchievementStore_progressProviderDidUpdateProgressValues___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) achievementsByTemplateUniqueName];
  id v3 = [v2 allValues];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__ACHLegacyAchievementStore_progressProviderDidUpdateProgressValues___block_invoke_2;
  v9[3] = &unk_264516EB8;
  v9[4] = *(void *)(a1 + 32);
  id v4 = objc_msgSend(v3, "hk_filter:", v9);

  if ([v4 count])
  {
    id v5 = ACHLogXPC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
      *(_DWORD *)buf = 138543362;
      long long v11 = v6;
      _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Notifying observers of %{public}@ progress updates.", buf, 0xCu);
    }
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [MEMORY[0x263EFFA08] setWithArray:v4];
    [v7 _notifyObserversOfUpdatedAchievements:v8];
  }
}

uint64_t __69__ACHLegacyAchievementStore_progressProviderDidUpdateProgressValues___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addProgressAndGoalToAchievement:", a2);
}

- (BOOL)_queue_addProgressAndGoalToAchievement:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ACHLegacyAchievementStore *)self synchronizationQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(ACHLegacyAchievementStore *)self progressProvider];
  int v7 = [v6 shouldPopulateProgressForAchievement:v4];

  if (v7)
  {
    uint64_t v8 = [(ACHLegacyAchievementStore *)self progressProvider];
    v11[0] = v4;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    [v8 populateProgressAndGoalForAchievements:v9];
  }
  return v7;
}

- (ACHTemplateStore)templateStore
{
  return self->_templateStore;
}

- (void)setTemplateStore:(id)a3
{
}

- (ACHEarnedInstanceStore)earnedInstanceStore
{
  return self->_earnedInstanceStore;
}

- (void)setEarnedInstanceStore:(id)a3
{
}

- (ACHTemplateAssetRegistry)templateAssetRegistry
{
  return self->_templateAssetRegistry;
}

- (void)setTemplateAssetRegistry:(id)a3
{
}

- (ACHAchievementProgressEngine)progressProvider
{
  return self->_progressProvider;
}

- (void)setProgressProvider:(id)a3
{
}

- (NSMutableDictionary)achievementsByTemplateUniqueName
{
  return self->_achievementsByTemplateUniqueName;
}

- (void)setAchievementsByTemplateUniqueName:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (OS_dispatch_queue)synchronizationQueue
{
  return self->_synchronizationQueue;
}

- (void)setSynchronizationQueue:(id)a3
{
}

- (BOOL)templateStoreDidFinishInitialFetch
{
  return self->_templateStoreDidFinishInitialFetch;
}

- (void)setTemplateStoreDidFinishInitialFetch:(BOOL)a3
{
  self->_templateStoreDidFinishInitialFetch = a3;
}

- (BOOL)earnedInstanceStoreDidFinishInitialFetch
{
  return self->_earnedInstanceStoreDidFinishInitialFetch;
}

- (void)setEarnedInstanceStoreDidFinishInitialFetch:(BOOL)a3
{
  self->_earnedInstanceStoreDidFinishInitialFetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_achievementsByTemplateUniqueName, 0);
  objc_storeStrong((id *)&self->_progressProvider, 0);
  objc_storeStrong((id *)&self->_templateAssetRegistry, 0);
  objc_storeStrong((id *)&self->_earnedInstanceStore, 0);
  objc_storeStrong((id *)&self->_templateStore, 0);
}

- (void)addObserver:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "Achievement store did not add observer %@ since it doesn't conform to the observer protocol.", (uint8_t *)&v2, 0xCu);
}

- (void)_queue_addTemplatesToLocalStore:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "uniqueName");
  *uint64_t v3 = 138543362;
  void *v2 = v4;
  OUTLINED_FUNCTION_0_3(&dword_21F5DA000, v5, v6, "Populating assets for template %{public}@ because it was newly added to achievement store");
}

- (void)_queue_addTemplatesToLocalStore:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "uniqueName");
  *uint64_t v3 = 138543362;
  void *v2 = v4;
  OUTLINED_FUNCTION_0_3(&dword_21F5DA000, v5, v6, "Adding new template %{public}@ to achievement store");
}

- (void)_queue_removeTemplatesFromLocalStore:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "uniqueName");
  *uint64_t v3 = 138543362;
  void *v2 = v4;
  OUTLINED_FUNCTION_0_3(&dword_21F5DA000, v5, v6, "Removing template %{public}@ from achievement store");
}

@end