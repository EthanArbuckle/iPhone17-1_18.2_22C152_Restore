@interface ACHAchievementStore
- (ACHAchievementProgressEngine)progressEngine;
- (ACHAchievementStore)initWithClient:(id)a3 templateStore:(id)a4 earnedInstanceStore:(id)a5 templateAssetRegistry:(id)a6 progressEngine:(id)a7;
- (ACHAwardsClient)client;
- (ACHEarnedInstanceStore)earnedInstanceStore;
- (ACHTemplateAssetRegistry)templateAssetRegistry;
- (ACHTemplateStore)templateStore;
- (BOOL)_initialFetchComplete;
- (BOOL)earnedInstancsStoreFinishedInitialFetch;
- (BOOL)needsUpdateWhenProtectedDataAvailable;
- (BOOL)templateStoreFinishedInitialFetch;
- (NSHashTable)observers;
- (NSMutableDictionary)achievementsByPrerequisiteTemplateName;
- (NSMutableDictionary)achievementsByTemplateUniqueName;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_queue)notificationQueue;
- (id)_lock_ephemeralMonthlyChallengeAchievementForTemplateUniqueName:(id)a3 earnedInstance:(id)a4;
- (id)_lock_populateMostRecentEarnedInstanceAndCountForAllAchievements;
- (id)_lock_populateMostRecentEarnedInstancesAndCountsForAchievements:(id)a3;
- (id)achievementWithTemplateUniqueName:(id)a3;
- (id)achievementsForEarnedDateComponents:(id)a3;
- (id)allAchievements;
- (id)ephemeralAchievementWithTemplateUniqueName:(id)a3;
- (int)protectedDataToken;
- (void)_handleProtectedDataAvailabilityChangeNotification;
- (void)_lock_addProgressAndGoalToAchievements:(id)a3;
- (void)_lock_addTemplatesToLocalStore:(id)a3;
- (void)_lock_notifyObserversOfInitialFetchCompletion;
- (void)_lock_populatePrerequisiteMet:(id)a3;
- (void)_lock_populatePrerequisiteMetForAchievements:(id)a3;
- (void)_lock_populatePrerequisiteMetForAllAchievements;
- (void)_lock_populateResourcesForAchievementsWithTemplateSourceName:(id)a3;
- (void)_lock_removeTemplatesFromLocalStore:(id)a3;
- (void)_notifyObserversOfNewAchievements:(id)a3;
- (void)_notifyObserversOfRemovedAchievements:(id)a3;
- (void)_notifyObserversOfUpdatedAchievements:(id)a3;
- (void)_performWithLock:(id)a3;
- (void)_updateProgressAndGoalFor:(id)a3 progressQuantity:(id)a4 goalQuantity:(id)a5;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)earnedInstanceStore:(id)a3 didAddNewEarnedInstances:(id)a4;
- (void)earnedInstanceStore:(id)a3 didRemoveEarnedInstances:(id)a4;
- (void)earnedInstanceStoreDidFinishInitialFetch:(id)a3;
- (void)earnedInstanceStoreDidReceiveSyncNotification:(id)a3;
- (void)loadAllAchievementsFromDatabaseIfNecessaryWithCompletionHandler:(id)a3;
- (void)processAchievementProgressUpdates:(id)a3;
- (void)recalculateProgressForAllAchievements;
- (void)removeObserver:(id)a3;
- (void)requestUpdateProgressValuesForProgressProvider:(id)a3;
- (void)setAchievementsByPrerequisiteTemplateName:(id)a3;
- (void)setAchievementsByTemplateUniqueName:(id)a3;
- (void)setClient:(id)a3;
- (void)setEarnedInstanceStore:(id)a3;
- (void)setEarnedInstancsStoreFinishedInitialFetch:(BOOL)a3;
- (void)setInternalQueue:(id)a3;
- (void)setNeedsUpdateWhenProtectedDataAvailable:(BOOL)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setObservers:(id)a3;
- (void)setProgressEngine:(id)a3;
- (void)setProtectedDataToken:(int)a3;
- (void)setTemplateAssetRegistry:(id)a3;
- (void)setTemplateStore:(id)a3;
- (void)setTemplateStoreFinishedInitialFetch:(BOOL)a3;
- (void)templateAssetRegistry:(id)a3 didUpdateResourcesForTemplatesWithSourceName:(id)a4;
- (void)templateStore:(id)a3 didAddNewTemplates:(id)a4;
- (void)templateStore:(id)a3 didRemoveTemplates:(id)a4;
- (void)templateStoreDidFinishInitialFetch:(id)a3;
@end

@implementation ACHAchievementStore

- (void)recalculateProgressForAllAchievements
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __60__ACHAchievementStore_recalculateProgressForAllAchievements__block_invoke;
  v2[3] = &unk_264515DB8;
  v2[4] = self;
  [(ACHAchievementStore *)self _performWithLock:v2];
}

- (id)allAchievements
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__26;
  v9 = __Block_byref_object_dispose__26;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__ACHAchievementStore_allAchievements__block_invoke;
  v4[3] = &unk_264516580;
  v4[4] = self;
  v4[5] = &v5;
  [(ACHAchievementStore *)self _performWithLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)processAchievementProgressUpdates:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__ACHAchievementStore_processAchievementProgressUpdates___block_invoke;
  v6[3] = &unk_264515DE0;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [(ACHAchievementStore *)self _performWithLock:v6];
}

- (void)_performWithLock:(id)a3
{
  p_syncLock = &self->_syncLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_syncLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_syncLock);
}

void __60__ACHAchievementStore_recalculateProgressForAllAchievements__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) achievementsByTemplateUniqueName];
  id v5 = [v2 allValues];

  v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x263EFFA08] setWithArray:v5];
  objc_msgSend(v3, "_lock_addProgressAndGoalToAchievements:", v4);
}

void __38__ACHAchievementStore_allAchievements__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  id v7 = [*(id *)(a1 + 32) achievementsByTemplateUniqueName];
  v3 = [v7 allValues];
  uint64_t v4 = [v2 setWithArray:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)_lock_addProgressAndGoalToAchievements:(id)a3
{
  p_syncLock = &self->_syncLock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_syncLock);
  id v7 = [(ACHAchievementStore *)self progressEngine];
  v6 = [v5 allObjects];

  [v7 populateProgressAndGoalForAchievements:v6];
}

- (ACHAchievementProgressEngine)progressEngine
{
  return self->_progressEngine;
}

void __57__ACHAchievementStore_processAchievementProgressUpdates___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        v9 = objc_msgSend(*(id *)(a1 + 40), "achievementsByTemplateUniqueName", (void)v17);
        id v10 = [v8 templateUniqueName];
        v11 = [v9 objectForKeyedSubscript:v10];

        if (v11)
        {
          v12 = *(void **)(a1 + 40);
          v13 = [v8 progressQuantity];
          v14 = [v8 goalQuantity];
          [v12 _updateProgressAndGoalFor:v11 progressQuantity:v13 goalQuantity:v14];

          [v2 addObject:v11];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  v15 = *(void **)(a1 + 40);
  v16 = (void *)[v2 copy];
  [v15 _notifyObserversOfUpdatedAchievements:v16];
}

- (NSMutableDictionary)achievementsByTemplateUniqueName
{
  return self->_achievementsByTemplateUniqueName;
}

- (void)_updateProgressAndGoalFor:(id)a3 progressQuantity:(id)a4 goalQuantity:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = ACHLogDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v7 template];
    v12 = [v11 uniqueName];
    v13 = [v8 description];
    v14 = [v9 description];
    int v15 = 138412802;
    v16 = v12;
    __int16 v17 = 2112;
    long long v18 = v13;
    __int16 v19 = 2112;
    long long v20 = v14;
    _os_log_impl(&dword_21F5DA000, v10, OS_LOG_TYPE_DEFAULT, "Progress Update: %@: [%@/%@]", (uint8_t *)&v15, 0x20u);
  }
  [v7 setGoal:v9];
  [v7 setProgress:v8];
}

- (void)_notifyObserversOfUpdatedAchievements:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHAchievementStore *)self notificationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__ACHAchievementStore__notifyObserversOfUpdatedAchievements___block_invoke;
  v7[3] = &unk_264515DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

void __61__ACHAchievementStore__notifyObserversOfUpdatedAchievements___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
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

- (NSHashTable)observers
{
  return self->_observers;
}

- (ACHAchievementStore)initWithClient:(id)a3 templateStore:(id)a4 earnedInstanceStore:(id)a5 templateAssetRegistry:(id)a6 progressEngine:(id)a7
{
  id v34 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v38.receiver = self;
  v38.super_class = (Class)ACHAchievementStore;
  __int16 v17 = [(ACHAchievementStore *)&v38 init];
  long long v18 = v17;
  if (v17)
  {
    v17->_syncLock._os_unfair_lock_opaque = 0;
    __int16 v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    initialFetchObserversToCall = v18->_initialFetchObserversToCall;
    v18->_initialFetchObserversToCall = v19;

    objc_storeStrong((id *)&v18->_client, a3);
    objc_storeStrong((id *)&v18->_templateStore, a4);
    objc_storeStrong((id *)&v18->_earnedInstanceStore, a5);
    objc_storeStrong((id *)&v18->_templateAssetRegistry, a6);
    objc_storeStrong((id *)&v18->_progressEngine, a7);
    uint64_t v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    achievementsByTemplateUniqueName = v18->_achievementsByTemplateUniqueName;
    v18->_achievementsByTemplateUniqueName = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    achievementsByPrerequisiteTemplateName = v18->_achievementsByPrerequisiteTemplateName;
    v18->_achievementsByPrerequisiteTemplateName = v23;

    [(ACHTemplateAssetRegistry *)v18->_templateAssetRegistry setDelegate:v18];
    uint64_t v25 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v18->_observers;
    v18->_observers = (NSHashTable *)v25;

    uint64_t v27 = HKCreateSerialDispatchQueue();
    notificationQueue = v18->_notificationQueue;
    v18->_notificationQueue = (OS_dispatch_queue *)v27;

    uint64_t v29 = HKCreateSerialDispatchQueue();
    internalQueue = v18->_internalQueue;
    v18->_internalQueue = (OS_dispatch_queue *)v29;

    objc_initWeak(&location, v18);
    v31 = (const char *)[(id)*MEMORY[0x263F235A8] UTF8String];
    v32 = v18->_internalQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __109__ACHAchievementStore_initWithClient_templateStore_earnedInstanceStore_templateAssetRegistry_progressEngine___block_invoke;
    handler[3] = &unk_264515D40;
    objc_copyWeak(&v36, &location);
    notify_register_dispatch(v31, &v18->_protectedDataToken, v32, handler);
    [v13 addObserver:v18];
    [v14 addObserver:v18];
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

  return v18;
}

void __109__ACHAchievementStore_initWithClient_templateStore_earnedInstanceStore_templateAssetRegistry_progressEngine___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleProtectedDataAvailabilityChangeNotification];
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_protectedDataToken)) {
    notify_cancel(self->_protectedDataToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)ACHAchievementStore;
  [(ACHAchievementStore *)&v3 dealloc];
}

- (void)_handleProtectedDataAvailabilityChangeNotification
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __73__ACHAchievementStore__handleProtectedDataAvailabilityChangeNotification__block_invoke;
  v2[3] = &unk_264515DB8;
  v2[4] = self;
  [(ACHAchievementStore *)self _performWithLock:v2];
}

void __73__ACHAchievementStore__handleProtectedDataAvailabilityChangeNotification__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) client];
  int v3 = [v2 isProtectedDataAvailable];

  uint64_t v4 = ACHLogTemplates();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_21F5DA000, v4, OS_LOG_TYPE_DEFAULT, "Achievement store received notification of a change in protected data availability: %d", (uint8_t *)v8, 8u);
  }

  if (v3 && [*(id *)(a1 + 32) needsUpdateWhenProtectedDataAvailable])
  {
    [*(id *)(a1 + 32) setNeedsUpdateWhenProtectedDataAvailable:0];
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_lock_populateMostRecentEarnedInstanceAndCountForAllAchievements");
    objc_msgSend(*(id *)(a1 + 32), "_lock_populatePrerequisiteMetForAllAchievements");
    if ([v5 count])
    {
      uint64_t v6 = *(void **)(a1 + 32);
      long long v7 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v5];
      [v6 _notifyObserversOfUpdatedAchievements:v7];
    }
  }
}

- (void)loadAllAchievementsFromDatabaseIfNecessaryWithCompletionHandler:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(ACHAchievementStore *)self earnedInstanceStore];
  int v5 = [v4 loadAllEarnedInstancesFromDatabaseIfNecessary];

  uint64_t v6 = [(ACHAchievementStore *)self templateStore];
  unsigned int v7 = [v6 loadAllTemplatesFromDatabaseIfNecessary];

  long long v8 = v9;
  if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, v5 & v7);
    long long v8 = v9;
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  int v5 = [(ACHAchievementStore *)self notificationQueue];
  dispatch_assert_queue_not_V2(v5);

  if ([v4 conformsToProtocol:&unk_26D129590])
  {
    uint64_t v6 = [(ACHAchievementStore *)self notificationQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    _DWORD v8[2] = __35__ACHAchievementStore_addObserver___block_invoke;
    v8[3] = &unk_264515DE0;
    v8[4] = self;
    id v9 = v4;
    dispatch_sync(v6, v8);
  }
  else
  {
    unsigned int v7 = ACHLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ACHLegacyAchievementStore addObserver:]((uint64_t)v4, v7);
    }
  }
}

void __35__ACHAchievementStore_addObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];

  if (objc_opt_respondsToSelector())
  {
    if ([*(id *)(a1 + 32) _initialFetchComplete])
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v3 = *(void **)(a1 + 40);
      [v3 achievementStoreDidFinishInitialFetch:v4];
    }
    else
    {
      int v5 = *(void **)(a1 + 32);
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __35__ACHAchievementStore_addObserver___block_invoke_2;
      v6[3] = &unk_264515DE0;
      void v6[4] = v5;
      id v7 = *(id *)(a1 + 40);
      [v5 _performWithLock:v6];
    }
  }
}

uint64_t __35__ACHAchievementStore_addObserver___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (BOOL)_initialFetchComplete
{
  id v2 = self;
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__ACHAchievementStore__initialFetchComplete__block_invoke;
  v4[3] = &unk_264516580;
  v4[4] = v2;
  v4[5] = &v5;
  [(ACHAchievementStore *)v2 _performWithLock:v4];
  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __44__ACHAchievementStore__initialFetchComplete__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) templateStoreFinishedInitialFetch];
  if (result) {
    uint64_t result = [*(id *)(a1 + 32) earnedInstancsStoreFinishedInitialFetch];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHAchievementStore *)self notificationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__ACHAchievementStore_removeObserver___block_invoke;
  v7[3] = &unk_264515DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __38__ACHAchievementStore_removeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) observers];
    [v4 removeObject:*(void *)(a1 + 40)];

    uint64_t v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __38__ACHAchievementStore_removeObserver___block_invoke_2;
    v6[3] = &unk_264515DE0;
    void v6[4] = v5;
    id v7 = *(id *)(a1 + 40);
    [v5 _performWithLock:v6];
  }
}

uint64_t __38__ACHAchievementStore_removeObserver___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (id)achievementsForEarnedDateComponents:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__26;
  id v15 = __Block_byref_object_dispose__26;
  id v16 = objc_alloc_init(MEMORY[0x263EFFA08]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __59__ACHAchievementStore_achievementsForEarnedDateComponents___block_invoke;
  v8[3] = &unk_264515E28;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  long long v10 = &v11;
  [(ACHAchievementStore *)self _performWithLock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __59__ACHAchievementStore_achievementsForEarnedDateComponents___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) earnedInstanceStore];
  int v3 = [v2 earnedInstancesForEarnedDateComponents:*(void *)(a1 + 40) error:0];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __59__ACHAchievementStore_achievementsForEarnedDateComponents___block_invoke_2;
  v8[3] = &unk_264517B80;
  v8[4] = *(void *)(a1 + 32);
  id v4 = objc_msgSend(v3, "hk_map:", v8);
  uint64_t v5 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

id __59__ACHAchievementStore_achievementsForEarnedDateComponents___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 achievementsByTemplateUniqueName];
  uint64_t v5 = [v3 templateUniqueName];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  id v7 = [v6 shallowCopyWithRelevantEarnedInstance:v3];

  return v7;
}

- (id)ephemeralAchievementWithTemplateUniqueName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy__26;
    id v16 = __Block_byref_object_dispose__26;
    id v17 = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    _DWORD v8[2] = __66__ACHAchievementStore_ephemeralAchievementWithTemplateUniqueName___block_invoke;
    v8[3] = &unk_264516E90;
    long long v10 = self;
    uint64_t v11 = &v12;
    id v9 = v4;
    [(ACHAchievementStore *)self _performWithLock:v8];
    id v6 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __66__ACHAchievementStore_ephemeralAchievementWithTemplateUniqueName___block_invoke(void *a1)
{
  id v15 = objc_alloc_init(MEMORY[0x263F236B8]);
  [v15 setTemplateUniqueName:a1[4]];
  id v2 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v3 = *MEMORY[0x263F234C0];
  id v4 = [MEMORY[0x263EFF910] date];
  uint64_t v5 = [v2 components:v3 fromDate:v4];
  [v15 setEarnedDateComponents:v5];

  int IsMonthlyChallenge = ACHTemplateUniqueNameIsMonthlyChallenge();
  id v7 = (void *)a1[5];
  if (IsMonthlyChallenge)
  {
    objc_msgSend(v7, "_lock_ephemeralMonthlyChallengeAchievementForTemplateUniqueName:earnedInstance:", a1[4], v15);
  }
  else
  {
    id v9 = [v7 achievementsByTemplateUniqueName];
    uint64_t v10 = [v9 objectForKeyedSubscript:a1[4]];
    uint64_t v11 = *(void *)(a1[6] + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    [*(id *)(*(void *)(a1[6] + 8) + 40) shallowCopyWithRelevantEarnedInstance:v15];
  uint64_t v8 = };
  uint64_t v13 = *(void *)(a1[6] + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v8;
}

- (id)achievementWithTemplateUniqueName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__26;
    id v15 = __Block_byref_object_dispose__26;
    id v16 = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    _DWORD v8[2] = __57__ACHAchievementStore_achievementWithTemplateUniqueName___block_invoke;
    v8[3] = &unk_2645165A8;
    uint64_t v10 = &v11;
    void v8[4] = self;
    id v9 = v4;
    [(ACHAchievementStore *)self _performWithLock:v8];
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __57__ACHAchievementStore_achievementWithTemplateUniqueName___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) achievementsByTemplateUniqueName];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_lock_ephemeralMonthlyChallengeAchievementForTemplateUniqueName:(id)a3 earnedInstance:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  os_unfair_lock_assert_owner(&self->_syncLock);
  ACHMonthlyChallengeTypeFromTemplateUniqueName();
  uint64_t v8 = [v7 componentsSeparatedByString:@"_"];

  if ([v8 count] == 3)
  {
    uint64_t v21 = [v8 objectAtIndexedSubscript:1];
    long long v20 = [v8 objectAtIndexedSubscript:2];
    [v21 integerValue];
    [v20 integerValue];
    id v9 = ACHDateComponentsForYearMonthDay();
    uint64_t v10 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    __int16 v19 = [v10 dateFromComponents:v9];
    long long v18 = objc_msgSend(v10, "hk_startOfMonthForDate:addingMonths:", v19, 1);
    uint64_t v11 = objc_msgSend(v10, "hk_startOfDateBySubtractingDays:fromDate:", 1, v18);
    uint64_t v12 = [v10 components:28 fromDate:v11];
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F236B0]) initWithStartDateComponents:v9 endDateComponents:v12];
    uint64_t v14 = ACHMonthlyChallengeTemplate();
    [v14 setSourceName:*MEMORY[0x263F23618]];
    id v15 = (void *)[objc_alloc(MEMORY[0x263F23630]) initWithTemplate:v14 relevantEarnedInstance:v6 earnedInstanceCount:1];
    id v16 = [(ACHAchievementStore *)self templateAssetRegistry];
    [v16 populateResourcePropertiesForAchievement:v15];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)requestUpdateProgressValuesForProgressProvider:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__ACHAchievementStore_requestUpdateProgressValuesForProgressProvider___block_invoke;
  v6[3] = &unk_264515DE0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ACHAchievementStore *)self _performWithLock:v6];
}

void __70__ACHAchievementStore_requestUpdateProgressValuesForProgressProvider___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) achievementsByTemplateUniqueName];
  uint64_t v3 = [v2 allValues];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__ACHAchievementStore_requestUpdateProgressValuesForProgressProvider___block_invoke_2;
  v7[3] = &unk_264516EB8;
  id v8 = *(id *)(a1 + 40);
  id v4 = objc_msgSend(v3, "hk_filter:", v7);

  id v5 = *(void **)(a1 + 32);
  id v6 = [MEMORY[0x263EFFA08] setWithArray:v4];
  objc_msgSend(v5, "_lock_addProgressAndGoalToAchievements:", v6);
}

uint64_t __70__ACHAchievementStore_requestUpdateProgressValuesForProgressProvider___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 template];
  uint64_t v4 = [v2 providesProgressForTemplate:v3];

  return v4;
}

- (void)_lock_notifyObserversOfInitialFetchCompletion
{
  if ([(ACHAchievementStore *)self templateStoreFinishedInitialFetch])
  {
    if ([(ACHAchievementStore *)self earnedInstancsStoreFinishedInitialFetch])
    {
      uint64_t v3 = [(ACHAchievementStore *)self notificationQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __68__ACHAchievementStore__lock_notifyObserversOfInitialFetchCompletion__block_invoke;
      block[3] = &unk_264515DB8;
      block[4] = self;
      dispatch_async(v3, block);
    }
  }
}

uint64_t __68__ACHAchievementStore__lock_notifyObserversOfInitialFetchCompletion__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __68__ACHAchievementStore__lock_notifyObserversOfInitialFetchCompletion__block_invoke_2;
  v3[3] = &unk_264515DB8;
  v3[4] = v1;
  return [v1 _performWithLock:v3];
}

void __68__ACHAchievementStore__lock_notifyObserversOfInitialFetchCompletion__block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        id v8 = [*(id *)(a1 + 32) notificationQueue];
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __68__ACHAchievementStore__lock_notifyObserversOfInitialFetchCompletion__block_invoke_3;
        v12[3] = &unk_264515DE0;
        uint64_t v9 = *(void *)(a1 + 32);
        v12[4] = v7;
        v12[5] = v9;
        dispatch_async(v8, v12);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = 0;
}

uint64_t __68__ACHAchievementStore__lock_notifyObserversOfInitialFetchCompletion__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) achievementStoreDidFinishInitialFetch:*(void *)(a1 + 40)];
}

- (void)_notifyObserversOfNewAchievements:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHAchievementStore *)self notificationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__ACHAchievementStore__notifyObserversOfNewAchievements___block_invoke;
  v7[3] = &unk_264515DE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__ACHAchievementStore__notifyObserversOfNewAchievements___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
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

- (void)_notifyObserversOfRemovedAchievements:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHAchievementStore *)self notificationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__ACHAchievementStore__notifyObserversOfRemovedAchievements___block_invoke;
  v7[3] = &unk_264515DE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__ACHAchievementStore__notifyObserversOfRemovedAchievements___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
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

- (void)templateStoreDidFinishInitialFetch:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__ACHAchievementStore_templateStoreDidFinishInitialFetch___block_invoke;
  v6[3] = &unk_264515DE0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ACHAchievementStore *)self _performWithLock:v6];
}

uint64_t __58__ACHAchievementStore_templateStoreDidFinishInitialFetch___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) allTemplates];
  objc_msgSend(v2, "_lock_addTemplatesToLocalStore:", v3);

  [*(id *)(a1 + 32) setTemplateStoreFinishedInitialFetch:1];
  id v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "_lock_notifyObserversOfInitialFetchCompletion");
}

- (void)templateStore:(id)a3 didAddNewTemplates:(id)a4
{
  id v5 = a4;
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__ACHAchievementStore_templateStore_didAddNewTemplates___block_invoke;
  v7[3] = &unk_264515DE0;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(ACHAchievementStore *)self _performWithLock:v7];
}

uint64_t __56__ACHAchievementStore_templateStore_didAddNewTemplates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_addTemplatesToLocalStore:", *(void *)(a1 + 40));
}

- (void)templateStore:(id)a3 didRemoveTemplates:(id)a4
{
  id v5 = a4;
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__ACHAchievementStore_templateStore_didRemoveTemplates___block_invoke;
  v7[3] = &unk_264515DE0;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(ACHAchievementStore *)self _performWithLock:v7];
}

uint64_t __56__ACHAchievementStore_templateStore_didRemoveTemplates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_removeTemplatesFromLocalStore:", *(void *)(a1 + 40));
}

- (void)earnedInstanceStoreDidFinishInitialFetch:(id)a3
{
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__ACHAchievementStore_earnedInstanceStoreDidFinishInitialFetch___block_invoke;
  v4[3] = &unk_264515DB8;
  v4[4] = self;
  [(ACHAchievementStore *)self _performWithLock:v4];
}

uint64_t __64__ACHAchievementStore_earnedInstanceStoreDidFinishInitialFetch___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEarnedInstancsStoreFinishedInitialFetch:1];
  id v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "_lock_notifyObserversOfInitialFetchCompletion");
}

- (void)earnedInstanceStore:(id)a3 didAddNewEarnedInstances:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__26;
  __int16 v19 = __Block_byref_object_dispose__26;
  id v20 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__ACHAchievementStore_earnedInstanceStore_didAddNewEarnedInstances___block_invoke;
  v11[3] = &unk_264515E28;
  id v8 = v7;
  id v12 = v8;
  long long v13 = self;
  long long v14 = &v15;
  [(ACHAchievementStore *)self _performWithLock:v11];
  if ([(id)v16[5] count])
  {
    id v9 = objc_alloc(MEMORY[0x263EFFA08]);
    long long v10 = (void *)[v9 initWithArray:v16[5]];
    [(ACHAchievementStore *)self _notifyObserversOfUpdatedAchievements:v10];
  }
  _Block_object_dispose(&v15, 8);
}

void __68__ACHAchievementStore_earnedInstanceStore_didAddNewEarnedInstances___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
        id v9 = objc_msgSend(*(id *)(a1 + 40), "achievementsByTemplateUniqueName", (void)v18);
        long long v10 = [v8 templateUniqueName];
        uint64_t v11 = [v9 objectForKeyedSubscript:v10];

        if (v11) {
          [v2 addObject:v11];
        }
        id v12 = [*(id *)(a1 + 40) achievementsByPrerequisiteTemplateName];
        long long v13 = [v8 templateUniqueName];
        long long v14 = [v12 objectForKeyedSubscript:v13];

        if (v14) {
          [v2 addObject:v14];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  uint64_t v15 = objc_msgSend(*(id *)(a1 + 40), "_lock_populateMostRecentEarnedInstancesAndCountsForAchievements:", v2);
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  objc_msgSend(*(id *)(a1 + 40), "_lock_populatePrerequisiteMetForAchievements:", v2);
}

- (void)earnedInstanceStoreDidReceiveSyncNotification:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__26;
  id v12 = __Block_byref_object_dispose__26;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__ACHAchievementStore_earnedInstanceStoreDidReceiveSyncNotification___block_invoke;
  v7[3] = &unk_264516580;
  void v7[4] = self;
  void v7[5] = &v8;
  [(ACHAchievementStore *)self _performWithLock:v7];
  if ([(id)v9[5] count])
  {
    id v5 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v6 = (void *)[v5 initWithArray:v9[5]];
    [(ACHAchievementStore *)self _notifyObserversOfUpdatedAchievements:v6];
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __69__ACHAchievementStore_earnedInstanceStoreDidReceiveSyncNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_lock_populateMostRecentEarnedInstanceAndCountForAllAchievements");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(a1 + 32);
  return objc_msgSend(v5, "_lock_populatePrerequisiteMetForAllAchievements");
}

- (void)earnedInstanceStore:(id)a3 didRemoveEarnedInstances:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__26;
  long long v19 = __Block_byref_object_dispose__26;
  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__ACHAchievementStore_earnedInstanceStore_didRemoveEarnedInstances___block_invoke;
  v11[3] = &unk_264515E28;
  id v8 = v7;
  id v12 = v8;
  id v13 = self;
  long long v14 = &v15;
  [(ACHAchievementStore *)self _performWithLock:v11];
  if ([(id)v16[5] count])
  {
    id v9 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v10 = (void *)[v9 initWithArray:v16[5]];
    [(ACHAchievementStore *)self _notifyObserversOfUpdatedAchievements:v10];
  }
  _Block_object_dispose(&v15, 8);
}

void __68__ACHAchievementStore_earnedInstanceStore_didRemoveEarnedInstances___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v20;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v20 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v19 + 1) + 8 * v5);
        id v7 = [*(id *)(a1 + 40) achievementsByTemplateUniqueName];
        id v8 = [v6 templateUniqueName];
        id v9 = [v7 objectForKeyedSubscript:v8];

        if (v9)
        {
          uint64_t v10 = [v9 earnedInstanceCount];
          int v11 = [v9 prerequisiteMet];
          id v12 = *(void **)(a1 + 40);
          uint64_t v23 = v9;
          id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
          id v14 = (id)objc_msgSend(v12, "_lock_populateMostRecentEarnedInstancesAndCountsForAchievements:", v13);

          objc_msgSend(*(id *)(a1 + 40), "_lock_populatePrerequisiteMet:", v9);
          if ([v9 earnedInstanceCount] != v10
            || v11 != [v9 prerequisiteMet])
          {
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v9];
          }
          uint64_t v15 = [*(id *)(a1 + 40) achievementsByPrerequisiteTemplateName];
          uint64_t v16 = [v6 templateUniqueName];
          uint64_t v17 = [v15 objectForKeyedSubscript:v16];

          if (v17)
          {
            objc_msgSend(*(id *)(a1 + 40), "_lock_populatePrerequisiteMet:", v17);
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v17];
          }
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v3);
  }
}

- (void)_lock_addTemplatesToLocalStore:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_syncLock);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
    v30 = &v44;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v36 + 1) + 8 * v9);
        int v11 = (void *)MEMORY[0x223C50570]();
        id v12 = ACHLogDefault();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[ACHLegacyAchievementStore _queue_addTemplatesToLocalStore:]((uint64_t)v43, (uint64_t)v10);
        }

        id v13 = (void *)[objc_alloc(MEMORY[0x263F23630]) initWithTemplate:v10 relevantEarnedInstance:0 earnedInstanceCount:0];
        v42 = v13;
        id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
        id v15 = [(ACHAchievementStore *)self _lock_populateMostRecentEarnedInstancesAndCountsForAchievements:v14];

        uint64_t v16 = [(ACHAchievementStore *)self achievementsByTemplateUniqueName];
        uint64_t v17 = [v10 uniqueName];
        [v16 setObject:v13 forKeyedSubscript:v17];

        long long v18 = [v10 prerequisiteTemplateName];

        if (v18)
        {
          long long v19 = [(ACHAchievementStore *)self achievementsByPrerequisiteTemplateName];
          long long v20 = [v10 prerequisiteTemplateName];
          [v19 setObject:v13 forKeyedSubscript:v20];
        }
        objc_msgSend(v5, "addObject:", v13, v30);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v7);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v21 = v5;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v33;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v32 + 1) + 8 * v25);
        uint64_t v27 = ACHLogAssets();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[ACHAchievementStore _lock_addTemplatesToLocalStore:]((uint64_t)v40, v26);
        }

        v28 = [(ACHAchievementStore *)self templateAssetRegistry];
        [v28 populateResourcePropertiesForAchievement:v26];

        [(ACHAchievementStore *)self _lock_populatePrerequisiteMet:v26];
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v23);
  }

  [(ACHAchievementStore *)self _lock_addProgressAndGoalToAchievements:v21];
  if ([v21 count])
  {
    uint64_t v29 = (void *)[v21 copy];
    [(ACHAchievementStore *)self _notifyObserversOfNewAchievements:v29];
  }
}

- (id)_lock_populateMostRecentEarnedInstanceAndCountForAllAchievements
{
  uint64_t v3 = [(ACHAchievementStore *)self achievementsByTemplateUniqueName];
  id v4 = [v3 allValues];
  id v5 = [(ACHAchievementStore *)self _lock_populateMostRecentEarnedInstancesAndCountsForAchievements:v4];

  return v5;
}

- (id)_lock_populateMostRecentEarnedInstancesAndCountsForAchievements:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_syncLock);
  id v33 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = objc_msgSend(v4, "hk_map:", &__block_literal_global_24);
  uint64_t v6 = [(ACHAchievementStore *)self earnedInstanceStore];
  id v42 = 0;
  v31 = [v6 countOfEarnedInstancesForTemplateUniqueNames:v5 error:&v42];
  id v7 = v42;

  uint64_t v8 = [(ACHAchievementStore *)self earnedInstanceStore];
  id v41 = 0;
  long long v35 = [v8 mostRecentEarnedInstancesForTemplateUniqueNames:v5 error:&v41];
  id v9 = v41;

  if ((objc_msgSend(v7, "hk_isDatabaseAccessibilityError") & 1) != 0
    || objc_msgSend(v9, "hk_isDatabaseAccessibilityError"))
  {
    [(ACHAchievementStore *)self setNeedsUpdateWhenProtectedDataAvailable:1];
    goto LABEL_30;
  }
  id v27 = v9;
  id v28 = v7;
  uint64_t v29 = v5;
  id v30 = v4;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v4;
  uint64_t v10 = v31;
  uint64_t v36 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (!v36) {
    goto LABEL_29;
  }
  uint64_t v34 = *(void *)v38;
  do
  {
    for (uint64_t i = 0; i != v36; ++i)
    {
      if (*(void *)v38 != v34) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      id v13 = objc_msgSend(v12, "template", v27, v28, v29, v30);
      id v14 = [v13 uniqueName];

      id v15 = [v10 objectForKeyedSubscript:v14];
      uint64_t v16 = v15;
      if (v15)
      {
        uint64_t v17 = [v15 unsignedIntegerValue];
        if ([v12 earnedInstanceCount] != v17) {
          goto LABEL_14;
        }
      }
      else if ([v12 earnedInstanceCount])
      {
        uint64_t v17 = 0;
LABEL_14:
        [v12 setEarnedInstanceCount:v17];
        int v18 = 1;
        goto LABEL_16;
      }
      int v18 = 0;
LABEL_16:
      long long v19 = [v35 objectForKeyedSubscript:v14];
      long long v20 = [v12 relevantEarnedInstance];
      id v21 = v20;
      if (v19)
      {
        BOOL v22 = v20 == 0;

        id v21 = [v12 relevantEarnedInstance];
        if (v21)
        {
          uint64_t v23 = [v12 relevantEarnedInstance];
          int v24 = [v19 isEqual:v23] ^ 1;

          uint64_t v10 = v31;
        }
        else
        {
          int v24 = 0;
        }
      }
      else
      {
        int v24 = 0;
        BOOL v22 = v20 != 0;
      }

      if (v22 || v24)
      {
        [v12 setRelevantEarnedInstance:v19];
LABEL_26:
        [v33 addObject:v12];
        goto LABEL_27;
      }
      if (v18) {
        goto LABEL_26;
      }
LABEL_27:
    }
    uint64_t v36 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  }
  while (v36);
LABEL_29:

  id v5 = v29;
  id v4 = v30;
  id v9 = v27;
  id v7 = v28;
LABEL_30:
  uint64_t v25 = objc_msgSend(v33, "copy", v27, v28, v29, v30);

  return v25;
}

id __87__ACHAchievementStore__lock_populateMostRecentEarnedInstancesAndCountsForAchievements___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 template];
  uint64_t v3 = [v2 uniqueName];

  return v3;
}

- (void)_lock_removeTemplatesFromLocalStore:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_syncLock);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    do
    {
      uint64_t v9 = 0;
      uint64_t v30 = v7;
      do
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v34 + 1) + 8 * v9);
        int v11 = (void *)MEMORY[0x223C50570]();
        id v12 = ACHLogDefault();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[ACHLegacyAchievementStore _queue_removeTemplatesFromLocalStore:]((uint64_t)v42, (uint64_t)v10);
        }

        id v13 = [(ACHAchievementStore *)self achievementsByTemplateUniqueName];
        id v14 = [v10 uniqueName];
        id v15 = [v13 objectForKeyedSubscript:v14];

        if (v15)
        {
          uint64_t v16 = [(ACHAchievementStore *)self achievementsByTemplateUniqueName];
          uint64_t v17 = [v10 uniqueName];
          [v16 setObject:0 forKeyedSubscript:v17];

          [v5 addObject:v15];
          int v18 = (void *)MEMORY[0x263EFFA08];
          long long v19 = [v15 earnedInstances];
          long long v20 = [v18 setWithArray:v19];

          if ([v20 count])
          {
            long long v32 = v11;
            id v21 = self;
            uint64_t v22 = v8;
            id v23 = v5;
            int v24 = v21;
            uint64_t v25 = [(ACHAchievementStore *)v21 earnedInstanceStore];
            uint64_t v26 = [v20 allObjects];
            id v33 = 0;
            [v25 removeEarnedInstances:v26 error:&v33];
            id v27 = v33;

            if (v27)
            {
              id v28 = ACHLogDefault();
              uint64_t v8 = v22;
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                long long v39 = v10;
                __int16 v40 = 2114;
                id v41 = v27;
                _os_log_error_impl(&dword_21F5DA000, v28, OS_LOG_TYPE_ERROR, "Unable to remove the earned instances for template: %{public}@. Reason: %{public}@", buf, 0x16u);
              }

              id v5 = v23;
            }
            else
            {
              id v5 = v23;
              uint64_t v8 = v22;
            }
            self = v24;
            uint64_t v7 = v30;
            int v11 = v32;
          }
        }
        else
        {
          long long v20 = ACHLogDefault();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            long long v39 = v10;
            _os_log_impl(&dword_21F5DA000, v20, OS_LOG_TYPE_DEFAULT, "Achievement store unexpectedly didn't find an achievement instance for template being removed: %{public}@", buf, 0xCu);
          }
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v7);
  }

  if ([v5 count])
  {
    uint64_t v29 = (void *)[v5 copy];
    [(ACHAchievementStore *)self _notifyObserversOfRemovedAchievements:v29];
  }
}

- (void)_lock_populatePrerequisiteMetForAllAchievements
{
  id v4 = [(ACHAchievementStore *)self achievementsByTemplateUniqueName];
  uint64_t v3 = [v4 allValues];
  [(ACHAchievementStore *)self _lock_populatePrerequisiteMetForAchievements:v3];
}

- (void)_lock_populatePrerequisiteMetForAchievements:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(ACHAchievementStore *)self _lock_populatePrerequisiteMet:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_lock_populatePrerequisiteMet:(id)a3
{
  id v11 = a3;
  os_unfair_lock_assert_owner(&self->_syncLock);
  [v11 setPrerequisiteMet:1];
  id v4 = [v11 template];
  uint64_t v5 = [v4 prerequisiteTemplateName];

  if (v5 && [v11 unearned])
  {
    uint64_t v6 = [(ACHAchievementStore *)self achievementsByTemplateUniqueName];
    uint64_t v7 = [v6 objectForKeyedSubscript:v5];

    if (v7)
    {
      uint64_t v8 = [v11 relevantEarnedInstance];
      if (v8)
      {
        BOOL v9 = 0;
      }
      else
      {
        long long v10 = [v7 relevantEarnedInstance];
        BOOL v9 = v10 != 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
    [v11 setPrerequisiteMet:v9];
  }
}

- (void)templateAssetRegistry:(id)a3 didUpdateResourcesForTemplatesWithSourceName:(id)a4
{
  id v5 = a4;
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __90__ACHAchievementStore_templateAssetRegistry_didUpdateResourcesForTemplatesWithSourceName___block_invoke;
  v7[3] = &unk_264515DE0;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(ACHAchievementStore *)self _performWithLock:v7];
}

uint64_t __90__ACHAchievementStore_templateAssetRegistry_didUpdateResourcesForTemplatesWithSourceName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_populateResourcesForAchievementsWithTemplateSourceName:", *(void *)(a1 + 40));
}

- (void)_lock_populateResourcesForAchievementsWithTemplateSourceName:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_syncLock);
  id v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = [(ACHAchievementStore *)self achievementsByTemplateUniqueName];
  uint64_t v7 = [v6 allValues];
  id v8 = [v5 setWithArray:v7];

  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __84__ACHAchievementStore__lock_populateResourcesForAchievementsWithTemplateSourceName___block_invoke;
  v33[3] = &unk_264516EB8;
  id v9 = v4;
  id v34 = v9;
  long long v10 = objc_msgSend(v8, "hk_filter:", v33);
  if ([v10 count])
  {
    id v28 = v8;
    id v11 = ACHLogAssets();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v10 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v37 = v12;
      __int16 v38 = 2114;
      id v39 = v9;
      _os_log_impl(&dword_21F5DA000, v11, OS_LOG_TYPE_DEFAULT, "Achievement store updating assets for %lu templates for source with identifier %{public}@", buf, 0x16u);
    }
    id v27 = v9;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v26 = v10;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          int v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          long long v19 = (void *)MEMORY[0x223C50570]();
          long long v20 = ACHLogAssets();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = [v18 template];
            uint64_t v22 = [v21 uniqueName];
            *(_DWORD *)buf = 138543362;
            uint64_t v37 = (uint64_t)v22;
            _os_log_impl(&dword_21F5DA000, v20, OS_LOG_TYPE_DEFAULT, "Achievement store updating assets for template %{public}@", buf, 0xCu);
          }
          id v23 = [(ACHAchievementStore *)self templateAssetRegistry];
          [v23 populateResourcePropertiesForAchievement:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v15);
    }

    int v24 = ACHLogAssets();
    id v8 = v28;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v24, OS_LOG_TYPE_DEFAULT, "Done updating assets. Notifying observers.", buf, 2u);
    }

    uint64_t v25 = (void *)[v13 copy];
    [(ACHAchievementStore *)self _notifyObserversOfUpdatedAchievements:v25];

    long long v10 = v26;
    id v9 = v27;
  }
}

uint64_t __84__ACHAchievementStore__lock_populateResourcesForAchievementsWithTemplateSourceName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 template];
  id v4 = [v3 sourceName];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (ACHAwardsClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
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

- (void)setProgressEngine:(id)a3
{
}

- (void)setObservers:(id)a3
{
}

- (void)setNotificationQueue:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (int)protectedDataToken
{
  return self->_protectedDataToken;
}

- (void)setProtectedDataToken:(int)a3
{
  self->_protectedDataToken = a3;
}

- (BOOL)templateStoreFinishedInitialFetch
{
  return self->_templateStoreFinishedInitialFetch;
}

- (void)setTemplateStoreFinishedInitialFetch:(BOOL)a3
{
  self->_templateStoreFinishedInitialFetch = a3;
}

- (BOOL)earnedInstancsStoreFinishedInitialFetch
{
  return self->_earnedInstancsStoreFinishedInitialFetch;
}

- (void)setEarnedInstancsStoreFinishedInitialFetch:(BOOL)a3
{
  self->_earnedInstancsStoreFinishedInitialFetch = a3;
}

- (BOOL)needsUpdateWhenProtectedDataAvailable
{
  return self->_needsUpdateWhenProtectedDataAvailable;
}

- (void)setNeedsUpdateWhenProtectedDataAvailable:(BOOL)a3
{
  self->_needsUpdateWhenProtectedDataAvailable = a3;
}

- (void)setAchievementsByTemplateUniqueName:(id)a3
{
}

- (NSMutableDictionary)achievementsByPrerequisiteTemplateName
{
  return self->_achievementsByPrerequisiteTemplateName;
}

- (void)setAchievementsByPrerequisiteTemplateName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_achievementsByPrerequisiteTemplateName, 0);
  objc_storeStrong((id *)&self->_achievementsByTemplateUniqueName, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_progressEngine, 0);
  objc_storeStrong((id *)&self->_templateAssetRegistry, 0);
  objc_storeStrong((id *)&self->_earnedInstanceStore, 0);
  objc_storeStrong((id *)&self->_templateStore, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_initialFetchObserversToCall, 0);
}

- (void)_lock_addTemplatesToLocalStore:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "template");
  uint64_t v5 = [v4 uniqueName];
  _DWORD *v3 = 138543362;
  *uint64_t v2 = v5;
  OUTLINED_FUNCTION_0_3(&dword_21F5DA000, v6, v7, "Populating assets for template %{public}@ because it was newly added to achievement store");
}

@end