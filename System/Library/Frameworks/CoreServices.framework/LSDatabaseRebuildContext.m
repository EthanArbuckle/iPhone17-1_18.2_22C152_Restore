@interface LSDatabaseRebuildContext
+ (id)currentRebuildContextIfExists;
+ (void)withStatsGatherer:(void *)a3 runWithRebuildContext:;
- (LSDatabaseRebuildContext)initWithStatsGatherer:(id)a3;
- (id)finishAndArmSaveTimer;
- (void)noteRebuildError:(uint64_t)a1;
- (void)registerItems:(uint64_t)a1;
@end

@implementation LSDatabaseRebuildContext

- (LSDatabaseRebuildContext)initWithStatsGatherer:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LSDatabaseRebuildContext;
  v6 = [(LSDatabaseRebuildContext *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_statsGatherer, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    overriddenPlugins = v7->_overriddenPlugins;
    v7->_overriddenPlugins = v8;
  }
  return v7;
}

+ (id)currentRebuildContextIfExists
{
  self;
  os_unfair_lock_lock(&rebuildContextLock);
  id v0 = (id)currentContext;
  os_unfair_lock_unlock(&rebuildContextLock);

  return v0;
}

+ (void)withStatsGatherer:(void *)a3 runWithRebuildContext:
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__LSDatabaseRebuildContext_withStatsGatherer_runWithRebuildContext___block_invoke;
  v9[3] = &unk_1E522CCD0;
  v12 = sel_withStatsGatherer_runWithRebuildContext_;
  uint64_t v13 = v6;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  _LSServer_ExecuteSyncWithQuiescedInstallationActivity(v9);
}

void __68__LSDatabaseRebuildContext_withStatsGatherer_runWithRebuildContext___block_invoke(void *a1)
{
  os_unfair_lock_lock(&rebuildContextLock);
  if (currentContext)
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:a1[6] object:a1[7] file:@"LSApplicationWorkspace.m" lineNumber:5451 description:@"can't start rebuild context: one already exists!"];
  }
  id v5 = [[LSDatabaseRebuildContext alloc] initWithStatsGatherer:a1[4]];
  objc_storeStrong((id *)&currentContext, v5);
  os_unfair_lock_unlock(&rebuildContextLock);
  (*(void (**)(void))(a1[5] + 16))();
  os_unfair_lock_lock(&rebuildContextLock);
  v2 = v5;
  if ((LSDatabaseRebuildContext *)currentContext != v5)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a1[6] object:a1[7] file:@"LSApplicationWorkspace.m" lineNumber:5457 description:@"can't end rebuild context: current context is different!?"];

    v2 = (LSDatabaseRebuildContext *)currentContext;
  }
  currentContext = 0;

  os_unfair_lock_unlock(&rebuildContextLock);
}

- (void)registerItems:(uint64_t)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id obj = a2;
  if (a1)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v27 = *(void *)v29;
      uint64_t v26 = *MEMORY[0x1E4F1CFF8];
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v29 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void **)(a1 + 16);
          id v7 = *(id *)(*((void *)&v28 + 1) + 8 * v5);
          id v8 = v6;
          v9 = [v7 objectForKey:v26];
          id v10 = [v7 objectForKey:@"ApplicationType"];
          _LSLogStepStart(13, 0, v9, @"begin inspect %@", v11, v12, v13, v14, (uint64_t)v10);
          v15 = _LSServer_DatabaseExecutionContext();
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __registerSingleMIDict_block_invoke;
          v32[3] = &unk_1E522CAA8;
          id v33 = v7;
          id v34 = v10;
          id v35 = v8;
          id v36 = v9;
          id v16 = v7;
          id v17 = v10;
          id v18 = v8;
          id v19 = v9;
          -[LSDBExecutionContext syncWrite:]((uint64_t)v15, v32);

          _LSLogStepFinished(13, 1, v19, @"end inspect %@", v20, v21, v22, v23, (uint64_t)v17);
          v24 = [v16 objectForKey:@"ApplicationType"];
          -[LSRebuildStatisticsGatherer registeredBundleOfType:](*(void *)(a1 + 8), v24);

          ++v5;
        }
        while (v4 != v5);
        uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v4);
    }
  }
}

- (void)noteRebuildError:(uint64_t)a1
{
  newValue = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 24), a2);
    -[LSRebuildStatisticsGatherer setRebuildError:](*(void **)(a1 + 8), newValue);
  }
}

- (id)finishAndArmSaveTimer
{
  if (a1)
  {
    v2 = a1;
    uint64_t v3 = _LSServer_DatabaseExecutionContext();
    -[LSDBExecutionContext syncWrite:]((uint64_t)v3, &__block_literal_global_903);

    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

void __49__LSDatabaseRebuildContext_finishAndArmSaveTimer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v9 = 0;
  id v10 = 0;
  int inited = _LSContextInitReturningError(&v10, &v9);
  id v7 = v9;
  if (inited)
  {
    if (_CSStoreGarbageCollect()) {
      _LSArmSaveTimer(1);
    }
  }
  else
  {
    id v8 = _LSDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __49__LSDatabaseRebuildContext_finishAndArmSaveTimer__block_invoke_cold_1();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastObservedError, 0);
  objc_storeStrong((id *)&self->_overriddenPlugins, 0);

  objc_storeStrong((id *)&self->_statsGatherer, 0);
}

void __49__LSDatabaseRebuildContext_finishAndArmSaveTimer__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "could not connect to database to garbage collect: %@", v2, v3, v4, v5, v6);
}

@end