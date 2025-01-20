@interface MSPContainer
+ (BOOL)_deletes:(unint64_t)a3 mayRepresentDataLossIfAppliedTo:(unint64_t)a4;
+ (void)_disableLogging;
+ (void)_preventAssertionsForDuplicateStorageIdentifiersInContainersCreatedPerfomingBlock:(id)a3;
+ (void)clearDiscardableDataFromAllContainers;
+ (void)mutableObjectContentDidUpdate:(id)a3;
- (BOOL)_checkAndAddCoalescedEditForContext:(id)a3 identifiers:(id)a4 enqueuedBlock:(id)a5 completionQueue:(id)a6 completion:(id)a7;
- (BOOL)_preventsAssertionsForDuplicateStorageIdentifiers;
- (BOOL)_simulatesClearingDiscardableDataAfterOperations;
- (BOOL)containerHasLoadedContents;
- (MSPContainer)init;
- (MSPContainer)initWithPersister:(id)a3;
- (MSPContainerPersister)persister;
- (MSPQuerySource)entireContentsQuerySource;
- (OS_dispatch_queue)_accessQueue;
- (id)_objectsWithDuplicateStorageIdentifiersFromArray:(id)a3;
- (id)_processedContentsForPersisterContents:(id)a3;
- (id)beginCoalescingEditsWithContext:(id)a3;
- (void)_clearObjectCacheIfNeeded;
- (void)_commitEditWithFinalContents:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_commitPendingCoalescedEditsIfAny;
- (void)_endCoalescingEditsForContext:(id)a3;
- (void)_forEachObserver:(id)a3;
- (void)_performInitialLoadNotifyingObservers:(BOOL)a3 kickOffSynchronously:(BOOL)a4 completion:(id)a5;
- (void)_setSimulatesClearingDiscardableDataAfterOperations:(BOOL)a3;
- (void)accessContentsUsingConcurrentBlock:(id)a3;
- (void)accessStateSnapshotUsingConcurrentBlock:(id)a3;
- (void)addObserver:(id)a3;
- (void)coalesceEditsForContext:(id)a3 inBlock:(id)a4;
- (void)dealloc;
- (void)editByMergingStateSnapshot:(id)a3 mergeOptions:(id)a4 context:(id)a5 completionQueue:(id)a6 completion:(id)a7;
- (void)editContentsUsingBarrierBlock:(id)a3 completionQueue:(id)a4 completion:(id)a5;
- (void)editContentsUsingBarrierBlock:(id)a3 context:(id)a4 completionQueue:(id)a5 completion:(id)a6;
- (void)editObjectsWithIdentifiers:(id)a3 usingBarrierBlock:(id)a4 completionQueue:(id)a5 completion:(id)a6;
- (void)editObjectsWithIdentifiers:(id)a3 usingBarrierBlock:(id)a4 context:(id)a5 completionQueue:(id)a6 completion:(id)a7;
- (void)eraseFromStorageTypes:(unint64_t)a3 withCompletionQueue:(id)a4 completion:(id)a5;
- (void)eraseWithCompletionQueue:(id)a3 completion:(id)a4;
- (void)persisterContentsDidChangeExternally:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation MSPContainer

- (MSPQuerySource)entireContentsQuerySource
{
  objc_getAssociatedObject(self, (const void *)entireContentsQuerySource_key);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    id v3 = [[MSPQuerySource alloc] _initWithOwningContainer:self];
    objc_setAssociatedObject(self, (const void *)entireContentsQuerySource_key, v3, (void *)0x301);
  }

  return (MSPQuerySource *)v3;
}

+ (void)mutableObjectContentDidUpdate:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28EB8];
  id v4 = a3;
  id v5 = [v3 defaultCenter];
  [v5 postNotificationName:@"MSPMutableObjectContentDidUpdateNotification" object:v4];
}

+ (void)_disableLogging
{
  _MSPShouldLog = 1;
}

+ (void)_preventAssertionsForDuplicateStorageIdentifiersInContainersCreatedPerfomingBlock:(id)a3
{
  if (a3)
  {
    id v3 = (void *)MEMORY[0x1E4F29060];
    id v4 = (void (**)(void))a3;
    id v5 = [v3 currentThread];
    id v7 = [v5 threadDictionary];

    v6 = [v7 objectForKeyedSubscript:@"com.apple.Maps.MSPContainerPreventAssertionsForDuplicateStorageIdentifiers"];
    [v7 setObject:MEMORY[0x1E4F1CC38] forKey:@"com.apple.Maps.MSPContainerPreventAssertionsForDuplicateStorageIdentifiers"];
    v4[2](v4);

    if (v6) {
      [v7 setObject:v6 forKey:@"com.apple.Maps.MSPContainerPreventAssertionsForDuplicateStorageIdentifiers"];
    }
    else {
      [v7 removeObjectForKey:@"com.apple.Maps.MSPContainerPreventAssertionsForDuplicateStorageIdentifiers"];
    }
  }
}

+ (void)clearDiscardableDataFromAllContainers
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MSPContainerClearDiscardableData" object:objc_opt_class()];
}

+ (BOOL)_deletes:(unint64_t)a3 mayRepresentDataLossIfAppliedTo:(unint64_t)a4
{
  return a3 >= 3 && (double)a4 / (double)a3 > 0.33;
}

- (MSPContainer)init
{
  result = (MSPContainer *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (MSPContainer)initWithPersister:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MSPContainer;
  v6 = [(MSPContainer *)&v25 init];
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F29060] currentThread];
    v8 = [v7 threadDictionary];
    v9 = [v8 objectForKey:@"com.apple.Maps.MSPContainerPreventAssertionsForDuplicateStorageIdentifiers"];
    v6->_preventsAssertionsForDuplicateStorageIdentifiers = [v9 isEqual:MEMORY[0x1E4F1CC38]];

    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v10;

    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.Maps.MSPContainerAccessQueue-%p", v6);
    id v12 = objc_claimAutoreleasedReturnValue();
    v13 = (const char *)[v12 UTF8String];
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create(v13, v14);
    accessQueue = v6->_accessQueue;
    v6->_accessQueue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v6->_persister, a3);
    [v5 setDelegate:v6];
    objc_opt_class();
    _MSPLogForContainer(v6, @"Created with persister %p (%@)", v17, v18, v19, v20, v21, v22, (uint64_t)v5);
    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v6 selector:sel__clearObjectCacheIfNeeded name:@"MSPContainerClearDiscardableData" object:objc_opt_class()];

    [(MSPContainer *)v6 _performInitialLoadNotifyingObservers:0 kickOffSynchronously:1 completion:0];
  }

  return v6;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"MSPContainerClearDiscardableData" object:objc_opt_class()];

  v4.receiver = self;
  v4.super_class = (Class)MSPContainer;
  [(MSPContainer *)&v4 dealloc];
}

- (void)accessContentsUsingConcurrentBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__MSPContainer_accessContentsUsingConcurrentBlock___block_invoke;
  v7[3] = &unk_1E617E438;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__MSPContainer_accessContentsUsingConcurrentBlock___block_invoke(void **a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    if (*((void *)WeakRetained + 3))
    {
      uint64_t v10 = (void (**)(void))a1[5];
      if (v10) {
        v10[2]();
      }
    }
    else
    {
      _MSPLogForContainer(a1[4], @"An access attempt occurred, but objects are not loaded (memory pressure?). Perform an initial load and postpone the access.", v3, v4, v5, v6, v7, v8, v13[0]);
      id v12 = a1[4];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = (uint64_t)__51__MSPContainer_accessContentsUsingConcurrentBlock___block_invoke_50;
      v13[3] = (uint64_t)&unk_1E617E298;
      v13[4] = (uint64_t)v12;
      id v14 = a1[5];
      [v12 _performInitialLoadNotifyingObservers:0 kickOffSynchronously:0 completion:v13];
    }
  }
  else
  {
    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[MSPContainer accessContentsUsingConcurrentBlock:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 175;
      _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

uint64_t __51__MSPContainer_accessContentsUsingConcurrentBlock___block_invoke_50(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessContentsUsingConcurrentBlock:*(void *)(a1 + 40)];
}

- (BOOL)containerHasLoadedContents
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL hasLoadedContents = v2->_hasLoadedContents;
  objc_sync_exit(v2);

  return hasLoadedContents;
}

- (void)accessStateSnapshotUsingConcurrentBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__MSPContainer_accessStateSnapshotUsingConcurrentBlock___block_invoke;
  v7[3] = &unk_1E617E438;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__MSPContainer_accessStateSnapshotUsingConcurrentBlock___block_invoke(void **a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    if (*((void *)WeakRetained + 2))
    {
      uint64_t v10 = (void (**)(void))a1[5];
      if (v10) {
        v10[2]();
      }
    }
    else
    {
      _MSPLogForContainer(a1[4], @"An access attempt occurred, but the state snapshot isn't loaded (memory pressure?). Perform an initial load and postpone the access.", v3, v4, v5, v6, v7, v8, v13[0]);
      id v12 = a1[4];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = (uint64_t)__56__MSPContainer_accessStateSnapshotUsingConcurrentBlock___block_invoke_55;
      v13[3] = (uint64_t)&unk_1E617E298;
      v13[4] = (uint64_t)v12;
      id v14 = a1[5];
      [v12 _performInitialLoadNotifyingObservers:0 kickOffSynchronously:0 completion:v13];
    }
  }
  else
  {
    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[MSPContainer accessStateSnapshotUsingConcurrentBlock:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 199;
      _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

uint64_t __56__MSPContainer_accessStateSnapshotUsingConcurrentBlock___block_invoke_55(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessStateSnapshotUsingConcurrentBlock:*(void *)(a1 + 40)];
}

- (void)_clearObjectCacheIfNeeded
{
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__MSPContainer__clearObjectCacheIfNeeded__block_invoke;
  v4[3] = &unk_1E617C9A8;
  objc_copyWeak(&v5, &location);
  dispatch_barrier_async(accessQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __41__MSPContainer__clearObjectCacheIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;

    uint64_t v4 = (void *)v2[3];
    v2[3] = 0;
  }
  else
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      uint64_t v7 = "-[MSPContainer _clearObjectCacheIfNeeded]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 216;
      _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v6, 0x12u);
    }
  }
}

- (void)_performInitialLoadNotifyingObservers:(BOOL)a3 kickOffSynchronously:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__MSPContainer__performInitialLoadNotifyingObservers_kickOffSynchronously_completion___block_invoke;
  v12[3] = &unk_1E617E348;
  objc_copyWeak(&v14, &location);
  v12[4] = self;
  BOOL v15 = a3;
  id v9 = v8;
  id v13 = v9;
  uint64_t v10 = (void (**)(void))MEMORY[0x1BA9C2AF0](v12);
  v11 = v10;
  if (v5) {
    v10[2](v10);
  }
  else {
    dispatch_barrier_async((dispatch_queue_t)self->_accessQueue, v10);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __86__MSPContainer__performInitialLoadNotifyingObservers_kickOffSynchronously_completion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 48);
  id WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v5 = *(void **)(a1 + 32);
    uint64_t v6 = (uint64_t)WeakRetained[5];
    objc_opt_class();
    _MSPLogForContainer(v5, @"Starting initial load from persister %p (%@)", v7, v8, v9, v10, v11, v12, v6);
    dispatch_suspend(v4[1]);
    dispatch_object_t v13 = v4[5];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __86__MSPContainer__performInitialLoadNotifyingObservers_kickOffSynchronously_completion___block_invoke_59;
    v16[3] = &unk_1E617E320;
    objc_copyWeak(&v18, v2);
    char v19 = *(unsigned char *)(a1 + 56);
    v16[4] = *(void *)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    v16[5] = v4;
    id v17 = v14;
    [v13 fetchStateSnapshotWithCompletion:v16];

    objc_destroyWeak(&v18);
  }
  else
  {
    BOOL v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = "-[MSPContainer _performInitialLoadNotifyingObservers:kickOffSynchronously:completion:]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 226;
      _os_log_impl(&dword_1B87E5000, v15, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

void __86__MSPContainer__performInitialLoadNotifyingObservers_kickOffSynchronously_completion___block_invoke_59(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v28 = a2;
  from = (id *)(a1 + 56);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v29 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v32 = a1;
    objc_storeStrong(WeakRetained + 2, a2);
    BOOL v5 = [v28 contents];
    uint64_t v6 = [v29 _processedContentsForPersisterContents:v5];
    uint64_t v7 = v29;
    id v8 = v29[3];
    v29[3] = (id)v6;

    if (*(unsigned char *)(v32 + 64))
    {
      id v9 = v29[4];
      objc_sync_enter(v9);
      uint64_t v10 = [v29[4] allObjects];
      objc_sync_exit(v9);

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id obj = v10;
      uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v38 != v12) {
              objc_enumerationMutation(obj);
            }
            id v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              if ((objc_opt_respondsToSelector() & 1) == 0
                || ([v14 observationQueueForContainer:*(void *)(v32 + 32)],
                    BOOL v15 = objc_claimAutoreleasedReturnValue(),
                    (v16 = v15) == 0))
              {
                BOOL v15 = 0;
                v16 = v29[1];
              }
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __86__MSPContainer__performInitialLoadNotifyingObservers_kickOffSynchronously_completion___block_invoke_64;
              block[3] = &unk_1E617DB60;
              objc_copyWeak(&v36, from);
              block[4] = *(void *)(v32 + 32);
              block[5] = v14;
              dispatch_async(v16, block);
              objc_destroyWeak(&v36);
            }
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v11);
      }

      uint64_t v7 = v29;
    }
    id v17 = v7;
    objc_sync_enter(v17);
    *((unsigned char *)v17 + 105) = 1;
    objc_sync_exit(v17);

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __86__MSPContainer__performInitialLoadNotifyingObservers_kickOffSynchronously_completion___block_invoke_70;
    v33[3] = &unk_1E617E2F8;
    objc_copyWeak(&v34, from);
    [v17 _forEachObserver:v33];
    uint64_t v18 = *(void *)(v32 + 48);
    if (v18) {
      (*(void (**)(void))(v18 + 16))();
    }
    char v19 = *(void **)(v32 + 32);
    uint64_t v20 = *(void *)(*(void *)(v32 + 40) + 40);
    objc_opt_class();
    _MSPLogForContainer(v19, @"Loaded from persister %p (%@) + resuming service on access queue -- snapshot: %@", v21, v22, v23, v24, v25, v26, v20);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(v32 + 40) + 8));
    objc_destroyWeak(&v34);
  }
  else
  {
    v27 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "-[MSPContainer _performInitialLoadNotifyingObservers:kickOffSynchronously:completion:]_block_invoke";
      __int16 v44 = 1024;
      int v45 = 231;
      _os_log_impl(&dword_1B87E5000, v27, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
    }
  }
}

void __86__MSPContainer__performInitialLoadNotifyingObservers_kickOffSynchronously_completion___block_invoke_64(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    _MSPLogForContainer(*(void **)(a1 + 32), @"Notifying observer %@ of full refetch.", v2, v3, v4, v5, v6, v7, *(void *)(a1 + 40));
    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = WeakRetained[3];
    uint64_t v11 = +[_MSPContainerEditReplacedEntirely sharedInstance];
    dispatch_object_t v13 = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    [v9 container:WeakRetained didEditWithNewContents:v10 orderedEdits:v12 cause:1 context:0];
  }
  else
  {
    uint64_t v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v15 = "-[MSPContainer _performInitialLoadNotifyingObservers:kickOffSynchronously:completion:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 248;
      _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_ERROR, "strongSelf3 went away in %s line %d", buf, 0x12u);
    }
  }
}

void __86__MSPContainer__performInitialLoadNotifyingObservers_kickOffSynchronously_completion___block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (objc_opt_respondsToSelector()) {
      [v3 containerDidLoadFromPersister:WeakRetained];
    }
  }
  else
  {
    uint64_t v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      uint64_t v7 = "-[MSPContainer _performInitialLoadNotifyingObservers:kickOffSynchronously:completion:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 261;
      _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_ERROR, "strongSelf3 went away in %s line %d", (uint8_t *)&v6, 0x12u);
    }
  }
}

- (id)_processedContentsForPersisterContents:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = (void *)[v4 copy];

    uint64_t v7 = [(MSPContainer *)self _objectsWithDuplicateStorageIdentifiersFromArray:v6];
    if ([v7 count] && !-[MSPContainerPersister duplicatesPolicy](self->_persister, "duplicatesPolicy"))
    {
      uint64_t v23 = v6;
      __int16 v8 = (void *)[v6 mutableCopy];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v24 = v7;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v30 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            long long v25 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            BOOL v15 = [v9 objectForKeyedSubscript:v14];
            uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v26;
              char v19 = 1;
              do
              {
                for (uint64_t j = 0; j != v17; ++j)
                {
                  if (*(void *)v26 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  if ((v19 & 1) == 0) {
                    [v8 removeObject:*(void *)(*((void *)&v25 + 1) + 8 * j)];
                  }
                  char v19 = 0;
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
                char v19 = 0;
              }
              while (v17);
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v11);
      }

      int v6 = (void *)[v8 copy];
      uint64_t v7 = v24;
    }
    id v21 = v6;
  }
  else
  {
    id v21 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v21;
}

- (id)_objectsWithDuplicateStorageIdentifiersFromArray:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v41 + 1) + 8 * i) storageIdentifier];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v7);
  }

  uint64_t v11 = (void *)[v4 copy];
  uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
  uint64_t v13 = [v11 count];
  if (v13 == [v12 count])
  {
    id v14 = 0;
  }
  else
  {
    long long v31 = v12;
    long long v32 = v11;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v15 = v5;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          id v21 = objc_msgSend(v20, "storageIdentifier", v31);
          id v22 = [v14 objectForKeyedSubscript:v21];
          if (!v22)
          {
            id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v14 setObject:v22 forKeyedSubscript:v21];
          }
          [v22 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v17);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v11 = v32;
    id v23 = v32;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v34;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v34 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v33 + 1) + 8 * k);
          long long v29 = objc_msgSend(v14, "objectForKeyedSubscript:", v28, v31);
          if ((unint64_t)[v29 count] <= 1) {
            [v14 removeObjectForKey:v28];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v33 objects:v45 count:16];
      }
      while (v25);
    }

    uint64_t v12 = v31;
  }

  return v14;
}

- (void)persisterContentsDidChangeExternally:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  _MSPLogForContainer(self, @"Contents changed externally from persister %p (%@) -- enqueuing a full refetch", v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  [(MSPContainer *)self _performInitialLoadNotifyingObservers:1 kickOffSynchronously:0 completion:0];
}

- (OS_dispatch_queue)_accessQueue
{
  return self->_accessQueue;
}

- (void)editContentsUsingBarrierBlock:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
}

- (void)editByMergingStateSnapshot:(id)a3 mergeOptions:(id)a4 context:(id)a5 completionQueue:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __91__MSPContainer_editByMergingStateSnapshot_mergeOptions_context_completionQueue_completion___block_invoke;
  v23[3] = &unk_1E617E398;
  objc_copyWeak(&v30, &location);
  id v24 = v12;
  id v25 = v13;
  id v26 = v15;
  long long v27 = self;
  id v28 = v14;
  id v29 = v16;
  id v18 = v14;
  id v19 = v15;
  id v20 = v16;
  id v21 = v13;
  id v22 = v12;
  dispatch_barrier_async(accessQueue, v23);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __91__MSPContainer_editByMergingStateSnapshot_mergeOptions_context_completionQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_suspend(*((dispatch_object_t *)WeakRetained + 1));
    uint64_t v5 = (void *)v4[5];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __91__MSPContainer_editByMergingStateSnapshot_mergeOptions_context_completionQueue_completion___block_invoke_85;
    v12[3] = &unk_1E617E370;
    objc_copyWeak(&v17, v2);
    id v16 = *(id *)(a1 + 72);
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void **)(a1 + 64);
    id v13 = v8;
    uint64_t v14 = v9;
    id v15 = v10;
    [v5 commitByMergingWithStateSnapshot:v6 mergeOptions:v7 completion:v12];

    objc_destroyWeak(&v17);
  }
  else
  {
    uint64_t v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[MSPContainer editByMergingStateSnapshot:mergeOptions:context:completionQueue:completion:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 393;
      _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

void __91__MSPContainer_editByMergingStateSnapshot_mergeOptions_context_completionQueue_completion___block_invoke_85(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v51 = a2;
  id v53 = a3;
  id v8 = a4;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v10 = WeakRetained;
  v52 = v8;
  if (WeakRetained)
  {
    if (v8)
    {
      uint64_t v11 = *(void **)(a1 + 56);
      if (!v11)
      {
LABEL_57:
        dispatch_resume(v10[1]);
        goto LABEL_58;
      }
      id v12 = *(NSObject **)(a1 + 32);
      if (!v12) {
        id v12 = WeakRetained[1];
      }
      v54 = WeakRetained;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __91__MSPContainer_editByMergingStateSnapshot_mergeOptions_context_completionQueue_completion___block_invoke_86;
      block[3] = &unk_1E617D7A0;
      id v69 = v11;
      id v68 = v52;
      dispatch_async(v12, block);

      id v13 = v69;
    }
    else
    {
      uint64_t v57 = a1;
      v54 = WeakRetained;
      if (v53 && (uint64_t v15 = objc_opt_new()) != 0)
      {
        v50 = (void *)v15;
        dispatch_object_t v16 = v10[3];
        if (v16)
        {
          id v17 = v16;
          id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          id v19 = v17;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v70 objects:buf count:16];
          if (v20)
          {
            uint64_t v21 = *(void *)v71;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v71 != v21) {
                  objc_enumerationMutation(v19);
                }
                id v23 = [*(id *)(*((void *)&v70 + 1) + 8 * i) storageIdentifier];
                if (v23) {
                  [v18 addObject:v23];
                }
              }
              uint64_t v20 = [v19 countByEnumeratingWithState:&v70 objects:buf count:16];
            }
            while (v20);
          }

          id v24 = (void *)[v18 copy];
          [v50 addObjectsFromArray:v24];

          char v25 = 0;
          a1 = v57;
        }
        else
        {
          char v25 = 0;
        }
      }
      else
      {
        v50 = 0;
        char v25 = 1;
      }
      id v26 = *(void **)(a1 + 40);
      long long v27 = [v51 contents];
      id v28 = [v26 _processedContentsForPersisterContents:v27];
      v55 = (void *)[v28 copy];

      objc_storeStrong((id *)v54 + 2, a2);
      id v29 = (id *)(v54 + 3);
      objc_storeStrong((id *)v54 + 3, v55);
      if ((v25 & 1) == 0 && *v29)
      {
        id v30 = *v29;
        id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v32 = v30;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v70 objects:buf count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v71;
          do
          {
            for (uint64_t j = 0; j != v33; ++j)
            {
              if (*(void *)v71 != v34) {
                objc_enumerationMutation(v32);
              }
              long long v36 = [*(id *)(*((void *)&v70 + 1) + 8 * j) storageIdentifier];
              if (v36) {
                [v31 addObject:v36];
              }
            }
            uint64_t v33 = [v32 countByEnumeratingWithState:&v70 objects:buf count:16];
          }
          while (v33);
        }

        long long v37 = (void *)[v31 copy];
        [v50 addObjectsFromArray:v37];
      }
      if (!v53
        || (uint64_t v38 = [v50 count], objc_msgSend(v50, "minusSet:", v53), objc_msgSend(v50, "count") != v38))
      {
        long long v39 = v54[4];
        objc_sync_enter(v39);
        long long v40 = [v54[4] allObjects];
        objc_sync_exit(v39);

        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id obj = v40;
        uint64_t v41 = [obj countByEnumeratingWithState:&v63 objects:v74 count:16];
        if (v41)
        {
          uint64_t v42 = *(void *)v64;
          do
          {
            for (uint64_t k = 0; k != v41; ++k)
            {
              if (*(void *)v64 != v42) {
                objc_enumerationMutation(obj);
              }
              long long v44 = *(void **)(*((void *)&v63 + 1) + 8 * k);
              if (objc_opt_respondsToSelector())
              {
                if ((objc_opt_respondsToSelector() & 1) == 0
                  || ([v44 observationQueueForContainer:*(void *)(v57 + 40)],
                      int v45 = objc_claimAutoreleasedReturnValue(),
                      (uint64_t v46 = v45) == 0))
                {
                  int v45 = 0;
                  uint64_t v46 = v54[1];
                }
                v60[0] = MEMORY[0x1E4F143A8];
                v60[1] = 3221225472;
                v60[2] = __91__MSPContainer_editByMergingStateSnapshot_mergeOptions_context_completionQueue_completion___block_invoke_4;
                v60[3] = &unk_1E617C5B0;
                uint64_t v47 = *(void *)(v57 + 40);
                v60[4] = v44;
                v60[5] = v47;
                id v61 = v55;
                id v62 = *(id *)(v57 + 48);
                dispatch_async(v46, v60);
              }
            }
            uint64_t v41 = [obj countByEnumeratingWithState:&v63 objects:v74 count:16];
          }
          while (v41);
        }
      }
      uint64_t v48 = *(void (***)(void, void))(v57 + 56);
      if (v48)
      {
        v49 = *(NSObject **)(v57 + 32);
        if (v49)
        {
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          v58[2] = __91__MSPContainer_editByMergingStateSnapshot_mergeOptions_context_completionQueue_completion___block_invoke_5;
          v58[3] = &unk_1E617D980;
          v59 = v48;
          dispatch_async(v49, v58);
        }
        else
        {
          v48[2](v48, 0);
        }
      }

      id v13 = v50;
    }

    uint64_t v10 = v54;
    goto LABEL_57;
  }
  uint64_t v14 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v76 = "-[MSPContainer editByMergingStateSnapshot:mergeOptions:context:completionQueue:completion:]_block_invoke";
    __int16 v77 = 1024;
    int v78 = 398;
    _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
  }

LABEL_58:
}

uint64_t __91__MSPContainer_editByMergingStateSnapshot_mergeOptions_context_completionQueue_completion___block_invoke_86(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __91__MSPContainer_editByMergingStateSnapshot_mergeOptions_context_completionQueue_completion___block_invoke_4(void *a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = +[_MSPContainerEditReplacedEntirely sharedInstance];
  v7[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v2 container:v3 didEditWithNewContents:v4 orderedEdits:v6 cause:0 context:a1[7]];
}

uint64_t __91__MSPContainer_editByMergingStateSnapshot_mergeOptions_context_completionQueue_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)eraseWithCompletionQueue:(id)a3 completion:(id)a4
{
}

- (void)eraseFromStorageTypes:(unint64_t)a3 withCompletionQueue:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke;
  v33[3] = &unk_1E617E3C0;
  if (a3 <= 1) {
    unint64_t v10 = 1;
  }
  else {
    unint64_t v10 = a3;
  }
  void v33[4] = self;
  v33[5] = v10;
  [(MSPContainer *)self _forEachObserver:v33];
  objc_initWeak(&location, self);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_2;
  v28[3] = &unk_1E617E3E8;
  objc_copyWeak(v31, &location);
  v31[1] = (id)v10;
  id v11 = v9;
  id v30 = v11;
  id v12 = v8;
  id v29 = v12;
  id v13 = (void *)MEMORY[0x1BA9C2AF0](v28);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_3;
  v25[3] = &unk_1E617E460;
  objc_copyWeak(v27, &location);
  v27[1] = (id)v10;
  id v14 = v13;
  v25[4] = self;
  id v26 = v14;
  uint64_t v15 = MEMORY[0x1BA9C2AF0](v25);
  uint64_t v22 = (void *)v15;
  if ((v10 & 2) != 0)
  {
    _MSPLogForContainer(self, @"Erasing container contents", v16, v17, v18, v19, v20, v21, v23[0]);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = (uint64_t)__69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_3_116;
    v23[3] = (uint64_t)&unk_1E617DA20;
    id v24 = v14;
    [(MSPContainer *)self editContentsUsingBarrierBlock:&__block_literal_global_115 completionQueue:0 completion:v23];
  }
  else
  {
    (*(void (**)(uint64_t))(v15 + 16))(v15);
  }

  objc_destroyWeak(v27);
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
}

void __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 containerWillEraseContents:*(void *)(a1 + 32)];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 containerWillEraseContents:*(void *)(a1 + 32) fromStorageTypes:*(void *)(a1 + 40)];
  }
}

void __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_97;
    v15[3] = &unk_1E617E3C0;
    uint64_t v8 = *(void *)(a1 + 56);
    v15[4] = WeakRetained;
    v15[5] = v8;
    [(dispatch_object_t *)WeakRetained _forEachObserver:v15];
    id v9 = *(void **)(a1 + 40);
    if (v9)
    {
      unint64_t v10 = *(NSObject **)(a1 + 32);
      if (!v10) {
        unint64_t v10 = v7[1];
      }
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_2_100;
      v12[3] = &unk_1E617D7A0;
      id v14 = v9;
      id v13 = v5;
      dispatch_async(v10, v12);
    }
    if (a3) {
      dispatch_resume(v7[1]);
    }
  }
  else
  {
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "-[MSPContainer eraseFromStorageTypes:withCompletionQueue:completion:]_block_invoke_2";
      __int16 v18 = 1024;
      int v19 = 497;
      _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

void __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_97(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 containerDidEraseContents:*(void *)(a1 + 32) fromStorageTypes:*(void *)(a1 + 40)];
  }
}

uint64_t __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_2_100(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      _MSPLogForContainer(*(void **)(a1 + 32), @"Will erase persister contents", v3, v4, v5, v6, v7, v8, v12);
      id v11 = WeakRetained[1];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_105;
      block[3] = &unk_1E617E438;
      void block[4] = WeakRetained;
      objc_copyWeak(&v15, v2);
      id v14 = *(id *)(a1 + 40);
      dispatch_barrier_async(v11, block);

      objc_destroyWeak(&v15);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    unint64_t v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "-[MSPContainer eraseFromStorageTypes:withCompletionQueue:completion:]_block_invoke_3";
      __int16 v18 = 1024;
      int v19 = 517;
      _os_log_impl(&dword_1B87E5000, v10, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

void __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_105(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_2_106;
  v3[3] = &unk_1E617E410;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  [v2 eraseWithCompletion:v3];

  objc_destroyWeak(&v5);
}

void __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_2_106(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_107;
      v6[3] = &unk_1E617D980;
      id v7 = *(id *)(a1 + 32);
      [WeakRetained _performInitialLoadNotifyingObservers:1 kickOffSynchronously:1 completion:v6];
    }
  }
  else
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v9 = "-[MSPContainer eraseFromStorageTypes:withCompletionQueue:completion:]_block_invoke_2";
      __int16 v10 = 1024;
      int v11 = 529;
      _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
    }
  }
}

uint64_t __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_107(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_2_112(uint64_t a1, void *a2)
{
  return [a2 setArray:MEMORY[0x1E4F1CBF0]];
}

uint64_t __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_3_116(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)editContentsUsingBarrierBlock:(id)a3 context:(id)a4 completionQueue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)[a4 copy];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke;
  v28[3] = &unk_1E617E4A8;
  id v14 = v10;
  id v29 = v14;
  if ([(MSPContainer *)self _checkAndAddCoalescedEditForContext:v13 identifiers:0 enqueuedBlock:v28 completionQueue:v11 completion:v12])
  {
    _MSPLogForContainer(self, @"Coalescing is on for this context -- the edit for context %@, will be enqueued for later.", v15, v16, v17, v18, v19, v20, (uint64_t)v13);
  }
  else
  {
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_2;
    v21[3] = &unk_1E617E598;
    objc_copyWeak(&v26, &location);
    id v24 = v14;
    v21[4] = self;
    id v22 = v13;
    id v25 = v12;
    id v23 = v11;
    [(MSPContainer *)self accessContentsUsingConcurrentBlock:v21];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

uint64_t __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 72));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_121;
    block[3] = &unk_1E617E570;
    objc_copyWeak(&v18, (id *)(a1 + 72));
    id v12 = v3;
    id v7 = *(id *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    id v16 = v7;
    uint64_t v13 = v8;
    id v14 = v9;
    id v17 = *(id *)(a1 + 64);
    id v15 = *(id *)(a1 + 48);
    dispatch_barrier_async(v6, block);

    objc_destroyWeak(&v18);
  }
  else
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v20 = "-[MSPContainer editContentsUsingBarrierBlock:context:completionQueue:completion:]_block_invoke_2";
      __int16 v21 = 1024;
      int v22 = 579;
      _os_log_impl(&dword_1B87E5000, v10, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

void __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_121(uint64_t a1)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  from = (id *)(a1 + 80);
  id WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 80));
  v54 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_suspend(WeakRetained[1]);
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v76 objects:v89 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v77 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          id v10 = (void *)[v9 mutableCopy];
          [v3 addObject:v10];
          [v4 setObject:v9 forKey:v10];
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v76 objects:v89 count:16];
      }
      while (v6);
    }

    v55 = [[_MSPContainerEditsRecorder alloc] initWithMutableArray:v3];
    uint64_t v11 = *(void *)(a1 + 64);
    id v12 = [(_MSPContainerEditsRecorder *)v55 recordableMutableArray];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

    uint64_t v13 = [(_MSPContainerEditsRecorder *)v55 recordableMutableArray];
    [(dispatch_object_t *)v54 _processNewEditedContents:v13];

    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v15 = v3;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v72 objects:v88 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v73;
LABEL_11:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v73 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void **)(*((void *)&v72 + 1) + 8 * v18);
        id v71 = 0;
        uint64_t v20 = [v19 transferToImmutableIfValidWithError:&v71];
        id v21 = v71;
        int v22 = v21;
        if (!v20) {
          break;
        }

        [v14 addObject:v20];
        [v4 setObject:v20 forKey:v19];

        if (v16 == ++v18)
        {
          uint64_t v16 = [v15 countByEnumeratingWithState:&v72 objects:v88 count:16];
          if (v16) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:
      int v22 = 0;
    }

    uint64_t v23 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v85 = __Block_byref_object_copy__6;
    v86 = __Block_byref_object_dispose__6;
    id v87 = 0;
    if (!v22)
    {
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_124;
      v70[3] = &unk_1E617E4D0;
      v70[4] = buf;
      [(_MSPContainerEditsRecorder *)v55 useImmutableObjectsForEditsFromMap:v4 intermediateMutableObjectTransferBlock:v70];
      uint64_t v23 = *(void **)(*(void *)&buf[8] + 40);
    }
    if ([v23 count])
    {
      id v24 = (void *)MEMORY[0x1E4F28C58];
      v82 = @"MSPUnderlyingErrors";
      id v25 = (void *)[*(id *)(*(void *)&buf[8] + 40) copy];
      v83 = v25;
      id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
      uint64_t v27 = [v24 errorWithDomain:@"com.apple.MapsSupport.MSPContainer" code:2 userInfo:v26];

      int v22 = (void *)v27;
    }
    if (v22) {
      id v28 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else {
      id v28 = (void *)[v14 copy];
    }
    id v29 = *(void **)(a1 + 40);
    id v30 = [(_MSPContainerEditsRecorder *)v55 orderedEdits];
    _MSPLogForContainer(v29, @"Has terminated the run, which caused the following edits: %@ -- final contents %@, transfer error if any %@", v31, v32, v33, v34, v35, v36, (uint64_t)v30);

    if (!v22)
    {
      long long v37 = [(dispatch_object_t *)v54 _objectsWithDuplicateStorageIdentifiersFromArray:v28];
      if ([v37 count])
      {
        uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
        v80 = @"MSPDuplicateStorageIdentifiersObjects";
        v81 = v37;
        long long v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
        int v22 = [v38 errorWithDomain:@"com.apple.MapsSupport.MSPContainer" code:3 userInfo:v39];

        id v28 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        int v22 = 0;
      }
    }
    long long v40 = [(_MSPContainerEditsRecorder *)v55 orderedEdits];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_2_131;
    v62[3] = &unk_1E617E520;
    objc_copyWeak(&v69, from);
    uint64_t v41 = *(void **)(a1 + 48);
    v62[4] = *(void *)(a1 + 40);
    id v63 = v41;
    id v42 = v28;
    id v64 = v42;
    id v43 = v40;
    id v65 = v43;
    id v68 = *(id *)(a1 + 72);
    id v66 = *(id *)(a1 + 56);
    v67 = v54;
    v50 = (void (**)(void, void, void))MEMORY[0x1BA9C2AF0](v62);
    if (v22)
    {
      _MSPLogForContainer(*(void **)(a1 + 40), @"Not committing due to immutable transfer error.", v44, v45, v46, v47, v48, v49, v51);
      ((void (**)(void, void, void *))v50)[2](v50, 0, v22);
    }
    else
    {
      uint64_t v52 = *(void *)(a1 + 48);
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_3;
      v56[3] = &unk_1E617E548;
      objc_copyWeak(&v61, from);
      v56[4] = *(void *)(a1 + 40);
      v60 = v50;
      id v57 = v42;
      id v58 = v43;
      id v59 = *(id *)(a1 + 32);
      [(dispatch_object_t *)v54 _commitEditWithFinalContents:v14 context:v52 completion:v56];

      objc_destroyWeak(&v61);
    }

    objc_destroyWeak(&v69);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[MSPContainer editContentsUsingBarrierBlock:context:completionQueue:completion:]_block_invoke";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 582;
      _os_log_impl(&dword_1B87E5000, v15, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
    }
  }
}

id __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_124(uint64_t a1, void *a2)
{
  id v10 = 0;
  id v3 = [a2 transferToImmutableIfValidWithError:&v10];
  id v4 = v10;
  if (!v3)
  {
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v5 addObject:v4];
  }

  return v3;
}

void __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_2_131(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    _MSPLogForContainer(*(void **)(a1 + 32), @"Ending edit operation with context %@ with error %@", v8, v9, v10, v11, v12, v13, *(void *)(a1 + 40));
    if (!v7)
    {
      objc_storeStrong(WeakRetained + 2, a2);
      id v15 = [v6 contents];
      uint64_t v16 = [WeakRetained _processedContentsForPersisterContents:v15];
      id v17 = WeakRetained[3];
      WeakRetained[3] = (id)v16;

      _MSPLogForContainer(*(void **)(a1 + 32), @"Committed edit with new snapshot: %@", v18, v19, v20, v21, v22, v23, (uint64_t)WeakRetained[2]);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_138;
      v34[3] = &unk_1E617E4F8;
      v34[4] = WeakRetained;
      id v35 = *(id *)(a1 + 48);
      id v36 = *(id *)(a1 + 56);
      id v37 = *(id *)(a1 + 40);
      [WeakRetained _forEachObserver:v34];
    }
    id v24 = *(void **)(a1 + 80);
    if (v24)
    {
      id v25 = *(NSObject **)(a1 + 64);
      if (!v25) {
        id v25 = *(NSObject **)(*(void *)(a1 + 72) + 8);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_2_139;
      block[3] = &unk_1E617D7A0;
      id v33 = v24;
      id v32 = v7;
      dispatch_async(v25, block);
    }
    if ([*(id *)(a1 + 72) _simulatesClearingDiscardableDataAfterOperations])
    {
      uint64_t v26 = *(void *)(a1 + 72);
      uint64_t v27 = *(void **)(v26 + 16);
      *(void *)(v26 + 16) = 0;

      uint64_t v28 = *(void *)(a1 + 72);
      id v29 = *(void **)(v28 + 24);
      *(void *)(v28 + 24) = 0;
    }
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 72) + 8));
  }
  else
  {
    id v30 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v39 = "-[MSPContainer editContentsUsingBarrierBlock:context:completionQueue:completion:]_block_invoke_2";
      __int16 v40 = 1024;
      int v41 = 659;
      _os_log_impl(&dword_1B87E5000, v30, OS_LOG_TYPE_ERROR, "strongSelf3 went away in %s line %d", buf, 0x12u);
    }
  }
}

void __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_138(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 container:a1[4] didEditWithNewContents:a1[5] orderedEdits:a1[6] cause:0 context:a1[7]];
  }
}

uint64_t __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_2_139(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v11 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      _MSPLogForContainer(*(void **)(a1 + 32), @"Not committing due to _commitEdit... hook error.", v5, v6, v7, v8, v9, v10, *(uint64_t *)v13);
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      [WeakRetained[5] commitEditWithNewContents:*(void *)(a1 + 40) edits:*(void *)(a1 + 48) appliedToOldContents:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
    }
  }
  else
  {
    uint64_t v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v13 = 136315394;
      *(void *)&v13[4] = "-[MSPContainer editContentsUsingBarrierBlock:context:completionQueue:completion:]_block_invoke_3";
      __int16 v14 = 1024;
      int v15 = 693;
      _os_log_impl(&dword_1B87E5000, v12, OS_LOG_TYPE_ERROR, "strongSelf3 went away in %s line %d", v13, 0x12u);
    }
  }
}

- (void)editObjectsWithIdentifiers:(id)a3 usingBarrierBlock:(id)a4 completionQueue:(id)a5 completion:(id)a6
{
}

- (void)editObjectsWithIdentifiers:(id)a3 usingBarrierBlock:(id)a4 context:(id)a5 completionQueue:(id)a6 completion:(id)a7
{
  id v12 = a4;
  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = [v13 setWithArray:a3];
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __96__MSPContainer_editObjectsWithIdentifiers_usingBarrierBlock_context_completionQueue_completion___block_invoke;
  v22[3] = &unk_1E617E5C0;
  id v23 = v17;
  id v24 = v18;
  id v25 = v12;
  id v19 = v12;
  id v20 = v18;
  id v21 = v17;
  [(MSPContainer *)self editContentsUsingBarrierBlock:v22 context:v16 completionQueue:v15 completion:v14];
}

void __96__MSPContainer_editObjectsWithIdentifiers_usingBarrierBlock_context_completionQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v9 = [v8 storageIdentifier];
        if ([*(id *)(a1 + 32) containsObject:v9]) {
          [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self->_observers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_observers addObject:v5];
  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self->_observers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_observers removeObject:v5];
  objc_sync_exit(v4);
}

- (void)_forEachObserver:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x1BA9C28D0]();
  id v5 = self->_observers;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSHashTable *)self->_observers allObjects];
  objc_sync_exit(v5);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) == 0
          || (objc_msgSend(v10, "observationQueueForContainer:", self, context),
              long long v11 = objc_claimAutoreleasedReturnValue(),
              (accessQueue = v11) == 0))
        {
          long long v11 = 0;
          accessQueue = self->_accessQueue;
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __33__MSPContainer__forEachObserver___block_invoke;
        block[3] = &unk_1E617D7A0;
        id v13 = v4;
        void block[4] = v10;
        id v17 = v13;
        dispatch_async(accessQueue, block);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

void __33__MSPContainer__forEachObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA9C28D0]();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)beginCoalescingEditsWithContext:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  editCoalescingContexts = v5->_editCoalescingContexts;
  if (!editCoalescingContexts)
  {
    uint64_t v7 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    uint64_t v8 = v5->_editCoalescingContexts;
    v5->_editCoalescingContexts = v7;

    editCoalescingContexts = v5->_editCoalescingContexts;
  }
  [(NSCountedSet *)editCoalescingContexts addObject:v4];
  objc_sync_exit(v5);

  uint64_t v9 = [[MSPContainerCoalescingToken alloc] initWithContainerOwner:v5 context:v4];

  return v9;
}

- (void)_endCoalescingEditsForContext:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSCountedSet *)v4->_editCoalescingContexts removeObject:v5];
  if (([(NSCountedSet *)v4->_editCoalescingContexts containsObject:v5] & 1) == 0
    && [v4->_contextCoalescingFor isEqual:v5])
  {
    [(MSPContainer *)v4 _commitPendingCoalescedEditsIfAny];
  }
  objc_sync_exit(v4);
}

- (void)coalesceEditsForContext:(id)a3 inBlock:(id)a4
{
  uint64_t v6 = (void (**)(void))a4;
  id v7 = [(MSPContainer *)self beginCoalescingEditsWithContext:a3];
  v6[2](v6);

  [v7 endCoalescingEdits];
}

- (BOOL)_checkAndAddCoalescedEditForContext:(id)a3 identifiers:(id)a4 enqueuedBlock:(id)a5 completionQueue:(id)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  long long v18 = self;
  objc_sync_enter(v18);
  if (v18->_isCommittingEnqueuedEdits) {
    goto LABEL_2;
  }
  contextCoalescingFor = v18->_contextCoalescingFor;
  if (contextCoalescingFor)
  {
    if (v13 && ([contextCoalescingFor isEqual:v13] & 1) != 0) {
      goto LABEL_9;
    }
    [(MSPContainer *)v18 _commitPendingCoalescedEditsIfAny];
  }
  if (!v13)
  {
LABEL_2:
    BOOL v19 = 0;
    goto LABEL_3;
  }
LABEL_9:
  if (![(NSCountedSet *)v18->_editCoalescingContexts containsObject:v13]) {
    goto LABEL_2;
  }
  objc_storeStrong((id *)&v18->_contextCoalescingFor, a3);
  if (v14)
  {
    if (!v18->_coalescedEditsNeedEntireContents)
    {
      coalescedPartialContentIdentifiersToFetch = v18->_coalescedPartialContentIdentifiersToFetch;
      if (!coalescedPartialContentIdentifiersToFetch)
      {
        uint64_t v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        id v24 = v18->_coalescedPartialContentIdentifiersToFetch;
        v18->_coalescedPartialContentIdentifiersToFetch = v23;

        coalescedPartialContentIdentifiersToFetch = v18->_coalescedPartialContentIdentifiersToFetch;
      }
      [(NSMutableSet *)coalescedPartialContentIdentifiersToFetch addObjectsFromArray:v14];
    }
  }
  else
  {
    v18->_coalescedEditsNeedEntireContents = 1;
    id v25 = v18->_coalescedPartialContentIdentifiersToFetch;
    v18->_coalescedPartialContentIdentifiersToFetch = 0;
  }
  enqueuedCoalescingEditBarrierBlocks = v18->_enqueuedCoalescingEditBarrierBlocks;
  if (!enqueuedCoalescingEditBarrierBlocks)
  {
    uint64_t v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v28 = v18->_enqueuedCoalescingEditBarrierBlocks;
    v18->_enqueuedCoalescingEditBarrierBlocks = v27;

    enqueuedCoalescingEditBarrierBlocks = v18->_enqueuedCoalescingEditBarrierBlocks;
  }
  id v29 = (void *)[v15 copy];
  id v30 = (void *)MEMORY[0x1BA9C2AF0]();
  [(NSMutableArray *)enqueuedCoalescingEditBarrierBlocks addObject:v30];

  if (v18->_enqueuedCoalescingCompletionBlocks)
  {
    if (!v17) {
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    enqueuedCoalescingCompletionBlocks = v18->_enqueuedCoalescingCompletionBlocks;
    v18->_enqueuedCoalescingCompletionBlocks = v31;

    if (!v17) {
      goto LABEL_25;
    }
  }
  id v33 = v18->_enqueuedCoalescingCompletionBlocks;
  if (v16)
  {
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __105__MSPContainer__checkAndAddCoalescedEditForContext_identifiers_enqueuedBlock_completionQueue_completion___block_invoke;
    v40[3] = &unk_1E617E5E8;
    id v41 = v16;
    id v42 = v17;
    uint64_t v34 = (void *)[v40 copy];
    id v35 = (void *)MEMORY[0x1BA9C2AF0]();
    [(NSMutableArray *)v33 addObject:v35];
  }
  else
  {
    id v36 = (void *)[v17 copy];
    id v37 = (void *)MEMORY[0x1BA9C2AF0]();
    [(NSMutableArray *)v33 addObject:v37];
  }
LABEL_25:
  BOOL v19 = 1;
  if (!v18->_hasScheduledDelayedCommitForCoalescedEdits)
  {
    v18->_hasScheduledDelayedCommitForCoalescedEdits = 1;
    dispatch_time_t v38 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __105__MSPContainer__checkAndAddCoalescedEditForContext_identifiers_enqueuedBlock_completionQueue_completion___block_invoke_3;
    block[3] = &unk_1E617C770;
    void block[4] = v18;
    dispatch_after(v38, MEMORY[0x1E4F14428], block);
  }
LABEL_3:
  objc_sync_exit(v18);

  return v19;
}

void __105__MSPContainer__checkAndAddCoalescedEditForContext_identifiers_enqueuedBlock_completionQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __105__MSPContainer__checkAndAddCoalescedEditForContext_identifiers_enqueuedBlock_completionQueue_completion___block_invoke_2;
  v7[3] = &unk_1E617D7A0;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __105__MSPContainer__checkAndAddCoalescedEditForContext_identifiers_enqueuedBlock_completionQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __105__MSPContainer__checkAndAddCoalescedEditForContext_identifiers_enqueuedBlock_completionQueue_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _commitPendingCoalescedEditsIfAny];
}

- (void)_commitPendingCoalescedEditsIfAny
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_contextCoalescingFor;
  if (v3)
  {
    v2->_isCommittingEnqueuedEdits = 1;
    id v4 = v2->_enqueuedCoalescingEditBarrierBlocks;
    id v5 = v2->_enqueuedCoalescingCompletionBlocks;
    id v6 = [(NSMutableSet *)v2->_coalescedPartialContentIdentifiersToFetch allObjects];
    contextCoalescingFor = v2->_contextCoalescingFor;
    v2->_contextCoalescingFor = 0;

    enqueuedCoalescingEditBarrierBlocks = v2->_enqueuedCoalescingEditBarrierBlocks;
    v2->_enqueuedCoalescingEditBarrierBlocks = 0;

    enqueuedCoalescingCompletionBlocks = v2->_enqueuedCoalescingCompletionBlocks;
    v2->_enqueuedCoalescingCompletionBlocks = 0;

    coalescedPartialContentIdentifiersToFetch = v2->_coalescedPartialContentIdentifiersToFetch;
    v2->_coalescedPartialContentIdentifiersToFetch = 0;

    if (v6)
    {
      long long v11 = v16;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __49__MSPContainer__commitPendingCoalescedEditsIfAny__block_invoke;
      v16[3] = &unk_1E617E610;
      v16[4] = v4;
      long long v12 = v15;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __49__MSPContainer__commitPendingCoalescedEditsIfAny__block_invoke_2;
      v15[3] = &unk_1E617E638;
      v15[4] = v5;
      [(MSPContainer *)v2 editObjectsWithIdentifiers:v6 usingBarrierBlock:v16 context:v3 completionQueue:0 completion:v15];
    }
    else
    {
      long long v11 = v14;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __49__MSPContainer__commitPendingCoalescedEditsIfAny__block_invoke_3;
      v14[3] = &unk_1E617E660;
      v14[4] = v4;
      long long v12 = v13;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __49__MSPContainer__commitPendingCoalescedEditsIfAny__block_invoke_4;
      v13[3] = &unk_1E617E638;
      v13[4] = v5;
      [(MSPContainer *)v2 editContentsUsingBarrierBlock:v14 context:v3 completionQueue:0 completion:v13];
    }

    v2->_hasScheduledDelayedCommitForCoalescedEdits = 0;
    v2->_isCommittingEnqueuedEdits = 0;
  }
  objc_sync_exit(v2);
}

void __49__MSPContainer__commitPendingCoalescedEditsIfAny__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
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
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void __49__MSPContainer__commitPendingCoalescedEditsIfAny__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
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
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void __49__MSPContainer__commitPendingCoalescedEditsIfAny__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
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
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void __49__MSPContainer__commitPendingCoalescedEditsIfAny__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
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
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_commitEditWithFinalContents:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (MSPContainerPersister)persister
{
  return self->_persister;
}

- (BOOL)_preventsAssertionsForDuplicateStorageIdentifiers
{
  return self->_preventsAssertionsForDuplicateStorageIdentifiers;
}

- (BOOL)_simulatesClearingDiscardableDataAfterOperations
{
  return self->_simulatesClearingDiscardableDataAfterOperations;
}

- (void)_setSimulatesClearingDiscardableDataAfterOperations:(BOOL)a3
{
  self->_simulatesClearingDiscardableDataAfterOperations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enqueuedCoalescingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_enqueuedCoalescingEditBarrierBlocks, 0);
  objc_storeStrong((id *)&self->_coalescedPartialContentIdentifiersToFetch, 0);
  objc_storeStrong((id *)&self->_contextCoalescingFor, 0);
  objc_storeStrong((id *)&self->_editCoalescingContexts, 0);
  objc_storeStrong((id *)&self->_persister, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentProcessedContents, 0);
  objc_storeStrong((id *)&self->_currentStateSnapshot, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end