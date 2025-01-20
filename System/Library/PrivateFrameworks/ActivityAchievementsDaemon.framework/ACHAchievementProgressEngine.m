@interface ACHAchievementProgressEngine
- (ACHAchievementProgressEngine)init;
- (ACHAchievementStoring)achievementStore;
- (BOOL)shouldPopulateProgressForAchievement:(id)a3;
- (NSHashTable)providers;
- (NSMapTable)providerDelayedOperations;
- (NSNumber)overrideDelay;
- (OS_dispatch_queue)providerQueue;
- (id)_queue_providerForTemplate:(id)a3;
- (id)providerWithIdentifier:(id)a3;
- (unint64_t)providerCount;
- (void)deregisterProgressProvider:(id)a3;
- (void)populateProgressAndGoalForAchievements:(id)a3;
- (void)processAchievementProgressUpdates:(id)a3;
- (void)registerProgressProvider:(id)a3;
- (void)requestProgressUpdateForProgressProvider:(id)a3;
- (void)setAchievementStore:(id)a3;
- (void)setOverrideDelay:(id)a3;
- (void)setProviderDelayedOperations:(id)a3;
- (void)setProviderQueue:(id)a3;
- (void)setProviders:(id)a3;
@end

@implementation ACHAchievementProgressEngine

void __66__ACHAchievementProgressEngine_processAchievementProgressUpdates___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v4 processAchievementProgressUpdates:*(void *)(a1 + 40)];
  }
  else
  {
    v3 = ACHLogProgress();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __66__ACHAchievementProgressEngine_processAchievementProgressUpdates___block_invoke_cold_1(v3);
    }
  }
}

- (void)populateProgressAndGoalForAchievements:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = ACHLogProgress();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = [v4 count];
    _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "populateProgressAndGoalForAchievements: %lu", buf, 0xCu);
  }

  v6 = [(ACHAchievementProgressEngine *)self providerQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__ACHAchievementProgressEngine_populateProgressAndGoalForAchievements___block_invoke;
  v8[3] = &unk_264515DE0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)processAchievementProgressUpdates:(id)a3
{
  id v4 = a3;
  v5 = [(ACHAchievementProgressEngine *)self providerQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__ACHAchievementProgressEngine_processAchievementProgressUpdates___block_invoke;
  v7[3] = &unk_264515DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (OS_dispatch_queue)providerQueue
{
  return self->_providerQueue;
}

void __71__ACHAchievementProgressEngine_populateProgressAndGoalForAchievements___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v2 = [*(id *)(a1 + 32) providers];
  v3 = [v2 allObjects];

  uint64_t v27 = [v3 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v37;
    *(void *)&long long v4 = 138412546;
    long long v25 = v4;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(v3);
        }
        uint64_t v29 = v5;
        id v6 = *(void **)(*((void *)&v36 + 1) + 8 * v5);
        id v7 = (void *)MEMORY[0x263EFF9C0];
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __71__ACHAchievementProgressEngine_populateProgressAndGoalForAchievements___block_invoke_2;
        v35[3] = &unk_264517B38;
        uint64_t v9 = *(void *)(a1 + 32);
        id v8 = *(void **)(a1 + 40);
        v28 = v6;
        v35[4] = v6;
        v35[5] = v9;
        v10 = objc_msgSend(v8, "hk_filter:", v35, v25);
        uint64_t v11 = [v7 setWithArray:v10];

        id v12 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v44 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v32 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * i);
              v19 = *(void **)(a1 + 40);
              v30[0] = MEMORY[0x263EF8330];
              v30[1] = 3221225472;
              v30[2] = __71__ACHAchievementProgressEngine_populateProgressAndGoalForAchievements___block_invoke_3;
              v30[3] = &unk_264516EB8;
              v30[4] = v18;
              v20 = objc_msgSend(v19, "hk_firstObjectPassingTest:", v30);
              if (v20) {
                [v12 addObject:v20];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v44 count:16];
          }
          while (v15);
        }

        [v13 unionSet:v12];
        v21 = objc_msgSend(v13, "hk_map:", &__block_literal_global_23);
        if ([v21 count])
        {
          v22 = ACHLogProgress();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = [v21 count];
            *(_DWORD *)buf = v25;
            v41 = v28;
            __int16 v42 = 2048;
            uint64_t v43 = v23;
            _os_log_impl(&dword_21F5DA000, v22, OS_LOG_TYPE_DEFAULT, "Request Progress, provider to %@ for %lu templates", buf, 0x16u);
          }

          v24 = [v21 allObjects];
          [v28 requestAchievementProgressUpdatesForTemplates:v24];
        }
        uint64_t v5 = v29 + 1;
      }
      while (v29 + 1 != v27);
      uint64_t v27 = [v3 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v27);
  }
}

- (NSHashTable)providers
{
  v3 = [(ACHAchievementProgressEngine *)self providerQueue];
  dispatch_assert_queue_V2(v3);

  providers = self->_providers;
  return providers;
}

uint64_t __71__ACHAchievementProgressEngine_populateProgressAndGoalForAchievements___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 template];
  if ([v4 providesProgressForTemplate:v5]) {
    uint64_t v6 = [*(id *)(a1 + 40) shouldPopulateProgressForAchievement:v3];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)shouldPopulateProgressForAchievement:(id)a3
{
  id v3 = a3;
  long long v4 = [v3 template];
  uint64_t v5 = [v3 template];
  uint64_t v6 = [v5 canonicalUnit];

  id v7 = [v3 template];
  uint64_t v8 = [v7 graceProgressExpression];
  if (v8)
  {
    uint64_t v9 = (void *)v8;

LABEL_4:
    uint64_t v11 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    id v12 = [v9 stringByTrimmingCharactersInSet:v11];
    BOOL v13 = [v12 length] == 0;

    goto LABEL_5;
  }
  v10 = [v3 template];
  uint64_t v9 = [v10 progressExpression];

  if (v9) {
    goto LABEL_4;
  }
  BOOL v13 = 1;
LABEL_5:
  uint64_t v14 = [v3 template];
  if ([v14 earnLimit])
  {
    uint64_t v15 = [v3 template];
    unsigned int v16 = [v15 earnLimit];
    BOOL v17 = [v3 earnedInstanceCount] >= (unint64_t)v16;
  }
  else
  {
    BOOL v17 = 0;
  }

  uint64_t v18 = [v4 visibilityStart];
  if (v18
    && (v19 = (void *)v18,
        [v4 visibilityEnd],
        v20 = objc_claimAutoreleasedReturnValue(),
        v20,
        v19,
        v20))
  {
    v21 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    v22 = [MEMORY[0x263EFF910] now];
    [v4 visibilityStart];
    uint64_t v23 = v36 = v6;
    v24 = [v21 dateFromComponents:v23];

    long long v25 = [v4 visibilityEnd];
    [v21 dateFromComponents:v25];
    BOOL v35 = v17;
    v27 = BOOL v26 = v13;

    v28 = objc_msgSend(v21, "hk_startOfDateByAddingDays:toDate:", 1, v27);
    uint64_t v29 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v24 endDate:v28];
    char v30 = [v29 containsDate:v22];

    uint64_t v6 = v36;
    BOOL v13 = v26;
    BOOL v17 = v35;

    char v31 = v30 ^ 1;
  }
  else
  {
    char v31 = 0;
  }
  char v32 = 0;
  if (v6) {
    int v33 = v13;
  }
  else {
    int v33 = 1;
  }
  if (((v33 | v17) & 1) == 0 && (v31 & 1) == 0) {
    char v32 = [v3 prerequisiteMet];
  }

  return v32;
}

uint64_t __71__ACHAchievementProgressEngine_populateProgressAndGoalForAchievements___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 template];
  long long v4 = [v3 prerequisiteTemplateName];
  uint64_t v5 = [*(id *)(a1 + 32) template];
  uint64_t v6 = [v5 uniqueName];
  uint64_t v7 = [v4 isEqualToString:v6];

  return v7;
}

uint64_t __71__ACHAchievementProgressEngine_populateProgressAndGoalForAchievements___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 template];
}

- (ACHAchievementProgressEngine)init
{
  v10.receiver = self;
  v10.super_class = (Class)ACHAchievementProgressEngine;
  v2 = [(ACHAchievementProgressEngine *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    providers = v2->_providers;
    v2->_providers = (NSHashTable *)v3;

    uint64_t v5 = HKCreateSerialDispatchQueue();
    providerQueue = v2->_providerQueue;
    v2->_providerQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    providerDelayedOperations = v2->_providerDelayedOperations;
    v2->_providerDelayedOperations = (NSMapTable *)v7;
  }
  return v2;
}

- (void)registerProgressProvider:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26D118550])
  {
    uint64_t v5 = [(ACHAchievementProgressEngine *)self providerQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __57__ACHAchievementProgressEngine_registerProgressProvider___block_invoke;
    v13[3] = &unk_264515DE0;
    uint64_t v14 = v4;
    uint64_t v15 = self;
    dispatch_sync(v5, v13);

    uint64_t v6 = v14;
  }
  else
  {
    uint64_t v6 = ACHLogProgress();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACHAchievementProgressEngine registerProgressProvider:]((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

void __57__ACHAchievementProgressEngine_registerProgressProvider___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = ACHLogProgress();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v3;
    _os_log_impl(&dword_21F5DA000, v2, OS_LOG_TYPE_DEFAULT, "Progress Engine added provider %@.", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) providers];
  [v4 addObject:*(void *)(a1 + 32)];

  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v5 = [*(id *)(a1 + 40) overrideDelay];
  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 40) overrideDelay];
    [v6 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 60.0;
  }

  id v9 = objc_alloc(MEMORY[0x263F0A9B0]);
  uint64_t v10 = [*(id *)(a1 + 40) providerQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__ACHAchievementProgressEngine_registerProgressProvider___block_invoke_329;
  v12[3] = &unk_264517AE8;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, (id *)buf);
  uint64_t v11 = (void *)[v9 initWithMode:0 queue:v10 delay:v12 block:v8];

  [*(id *)(*(void *)(a1 + 40) + 16) setObject:v11 forKey:*(void *)(a1 + 32)];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

void __57__ACHAchievementProgressEngine_registerProgressProvider___block_invoke_329(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = ACHLogProgress();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v7 = 138412290;
    id v8 = WeakRetained;
    _os_log_impl(&dword_21F5DA000, v2, OS_LOG_TYPE_DEFAULT, "Execute delayed task for provider: %@.", (uint8_t *)&v7, 0xCu);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [v4 achievementStore];
  id v6 = objc_loadWeakRetained((id *)(a1 + 32));
  [v5 requestUpdateProgressValuesForProgressProvider:v6];
}

- (void)deregisterProgressProvider:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26D118550])
  {
    uint64_t v5 = [(ACHAchievementProgressEngine *)self providerQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59__ACHAchievementProgressEngine_deregisterProgressProvider___block_invoke;
    v13[3] = &unk_264515DE0;
    void v13[4] = self;
    id v14 = v4;
    dispatch_sync(v5, v13);
  }
  else
  {
    id v6 = ACHLogProgress();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACHAchievementProgressEngine deregisterProgressProvider:]((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

void __59__ACHAchievementProgressEngine_deregisterProgressProvider___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) providers];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  id v4 = ACHLogProgress();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v14 = 138412290;
      uint64_t v15 = v6;
      _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Progress Engine removed provider %@.", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v7 = [*(id *)(a1 + 32) providers];
    [v7 removeObject:*(void *)(a1 + 40)];

    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];
    [v5 invalidate];
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __59__ACHAchievementProgressEngine_deregisterProgressProvider___block_invoke_cold_1(a1 + 40, v5, v8, v9, v10, v11, v12, v13);
  }
}

- (void)requestProgressUpdateForProgressProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHAchievementProgressEngine *)self providerQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__ACHAchievementProgressEngine_requestProgressUpdateForProgressProvider___block_invoke;
  v7[3] = &unk_264515DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __73__ACHAchievementProgressEngine_requestProgressUpdateForProgressProvider___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];
  [v1 execute];
}

- (id)_queue_providerForTemplate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHAchievementProgressEngine *)self providerQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(ACHAchievementProgressEngine *)self providers];
  uint64_t v7 = [v6 allObjects];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__ACHAchievementProgressEngine__queue_providerForTemplate___block_invoke;
  v11[3] = &unk_264517B10;
  id v12 = v4;
  id v8 = v4;
  uint64_t v9 = objc_msgSend(v7, "hk_firstObjectPassingTest:", v11);

  return v9;
}

uint64_t __59__ACHAchievementProgressEngine__queue_providerForTemplate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 providesProgressForTemplate:*(void *)(a1 + 32)];
}

- (id)providerWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSHashTable *)self->_providers allObjects];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__ACHAchievementProgressEngine_providerWithIdentifier___block_invoke;
  v9[3] = &unk_264517B10;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "hk_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __55__ACHAchievementProgressEngine_providerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 providerIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (unint64_t)providerCount
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  int v3 = [(ACHAchievementProgressEngine *)self providerQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__ACHAchievementProgressEngine_providerCount__block_invoke;
  v6[3] = &unk_264516580;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __45__ACHAchievementProgressEngine_providerCount__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) providers];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (ACHAchievementStoring)achievementStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_achievementStore);
  return (ACHAchievementStoring *)WeakRetained;
}

- (void)setAchievementStore:(id)a3
{
}

- (NSMapTable)providerDelayedOperations
{
  return self->_providerDelayedOperations;
}

- (void)setProviderDelayedOperations:(id)a3
{
}

- (void)setProviders:(id)a3
{
}

- (void)setProviderQueue:(id)a3
{
}

- (NSNumber)overrideDelay
{
  return self->_overrideDelay;
}

- (void)setOverrideDelay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDelay, 0);
  objc_storeStrong((id *)&self->_providerQueue, 0);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_providerDelayedOperations, 0);
  objc_destroyWeak((id *)&self->_achievementStore);
}

- (void)registerProgressProvider:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)deregisterProgressProvider:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __59__ACHAchievementProgressEngine_deregisterProgressProvider___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66__ACHAchievementProgressEngine_processAchievementProgressUpdates___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_21F5DA000, log, OS_LOG_TYPE_ERROR, "processAchievementProgressUpdates called but achievementStore is not set!!", v1, 2u);
}

@end