@interface SFProcessDictionary
- (SFProcessDictionary)init;
- (SFProcessDictionary)initWithCacheCapacity:(unint64_t)a3;
- (id)incrementReferenceForPID:(int)a3 additionalKey:(id)a4 valueCreationBlock:(id)a5;
- (id)incrementReferenceForPID:(int)a3 valueCreationBlock:(id)a4;
- (unint64_t)cacheCapacity;
- (void)_handleProcessStateUpdate:(int)a3 state:(unsigned __int8)a4;
- (void)_removeUnreferencedObjectsIfNeeded;
- (void)_removeValuesForPID:(id)a3;
- (void)_updateInterestedApplications;
- (void)dealloc;
- (void)decrementReferenceForPID:(int)a3;
@end

@implementation SFProcessDictionary

- (SFProcessDictionary)initWithCacheCapacity:(unint64_t)a3
{
  result = [(SFProcessDictionary *)self init];
  result->_cacheCapacity = a3;
  return result;
}

- (SFProcessDictionary)init
{
  v19.receiver = self;
  v19.super_class = (Class)SFProcessDictionary;
  v2 = [(SFProcessDictionary *)&v19 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    values = v2->_values;
    v2->_values = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28BD0] set];
    references = v2->_references;
    v2->_references = (NSCountedSet *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    pidsPendingTermination = v2->_pidsPendingTermination;
    v2->_pidsPendingTermination = (NSMutableSet *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    recentlyReferencedPIDs = v2->_recentlyReferencedPIDs;
    v2->_recentlyReferencedPIDs = (NSMutableArray *)v9;

    v2->_cacheCapacity = 3;
    v11 = (void *)MEMORY[0x1E4F96418];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __27__SFProcessDictionary_init__block_invoke;
    v16[3] = &unk_1E5C769E8;
    objc_copyWeak(&v17, &location);
    uint64_t v12 = [v11 monitorWithConfiguration:v16];
    processMonitor = v2->_processMonitor;
    v2->_processMonitor = (RBSProcessMonitor *)v12;

    v14 = v2;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v2;
}

void __27__SFProcessDictionary_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__SFProcessDictionary_init__block_invoke_2;
  v5[3] = &unk_1E5C769C0;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  [v3 setUpdateHandler:v5];
  v4 = [MEMORY[0x1E4F96448] descriptor];
  [v3 setStateDescriptor:v4];

  objc_destroyWeak(&v6);
}

void __27__SFProcessDictionary_init__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27__SFProcessDictionary_init__block_invoke_3;
  v7[3] = &unk_1E5C72DE0;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(&v9);
}

void __27__SFProcessDictionary_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [*(id *)(a1 + 32) process];
    uint64_t v3 = [v2 pid];
    v4 = [*(id *)(a1 + 32) state];
    objc_msgSend(WeakRetained, "_handleProcessStateUpdate:state:", v3, objc_msgSend(v4, "taskState"));
  }
}

- (void)dealloc
{
  [(RBSProcessMonitor *)self->_processMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SFProcessDictionary;
  [(SFProcessDictionary *)&v3 dealloc];
}

- (void)_updateInterestedApplications
{
  objc_super v3 = [(NSMutableDictionary *)self->_values allKeys];
  processMonitor = self->_processMonitor;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__SFProcessDictionary__updateInterestedApplications__block_invoke;
  v6[3] = &unk_1E5C76A30;
  id v7 = v3;
  id v5 = v3;
  [(RBSProcessMonitor *)processMonitor updateConfiguration:v6];
}

void __52__SFProcessDictionary__updateInterestedApplications__block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = objc_msgSend(v2, "safari_setByApplyingBlock:", &__block_literal_global_40);
  id v5 = [MEMORY[0x1E4F96430] predicateMatchingIdentifiers:v4];
  v7[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 setPredicates:v6];
}

uint64_t __52__SFProcessDictionary__updateInterestedApplications__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F963F8] identifierForIdentifier:a2];
}

- (void)_handleProcessStateUpdate:(int)a3 state:(unsigned __int8)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a4 == 1)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithInt:");
    if ([(NSCountedSet *)self->_references countForObject:v6])
    {
      id v7 = WBS_LOG_CHANNEL_PREFIXProcessDictionary();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        references = self->_references;
        uint64_t v12 = v7;
        v13[0] = 67109376;
        v13[1] = a3;
        __int16 v14 = 1024;
        int v15 = [(NSCountedSet *)references countForObject:v6];
        _os_log_debug_impl(&dword_1A690B000, v12, OS_LOG_TYPE_DEBUG, "process %d has been terminated, but still has a refcount of %d", (uint8_t *)v13, 0xEu);
      }
      [(NSMutableSet *)self->_pidsPendingTermination addObject:v6];
    }
    else
    {
      id v8 = [(NSMutableDictionary *)self->_values objectForKeyedSubscript:v6];
      uint64_t v9 = [v8 count];

      if (v9)
      {
        v10 = WBS_LOG_CHANNEL_PREFIXProcessDictionary();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[SFProcessDictionary _handleProcessStateUpdate:state:](a3, v10);
        }
        [(SFProcessDictionary *)self _removeValuesForPID:v6];
      }
    }
  }
}

- (void)_removeValuesForPID:(id)a3
{
  values = self->_values;
  id v5 = a3;
  [(NSMutableDictionary *)values removeObjectForKey:v5];
  [(NSMutableArray *)self->_recentlyReferencedPIDs removeObject:v5];
  [(NSMutableSet *)self->_pidsPendingTermination removeObject:v5];

  [(SFProcessDictionary *)self _updateInterestedApplications];
}

- (void)decrementReferenceForPID:(int)a3
{
  id v5 = objc_msgSend(NSNumber, "numberWithInt:");
  if ([(NSCountedSet *)self->_references countForObject:v5])
  {
    int v6 = [(NSMutableSet *)self->_pidsPendingTermination containsObject:v5];
    [(NSCountedSet *)self->_references removeObject:v5];
    if (v6)
    {
      if (([(NSCountedSet *)self->_references containsObject:v5] & 1) == 0)
      {
        id v7 = WBS_LOG_CHANNEL_PREFIXProcessDictionary();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          -[SFProcessDictionary decrementReferenceForPID:](a3, v7);
        }
        [(SFProcessDictionary *)self _removeValuesForPID:v5];
      }
    }
    else
    {
      [(SFProcessDictionary *)self _removeUnreferencedObjectsIfNeeded];
    }
  }
  else
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXProcessDictionary();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SFProcessDictionary decrementReferenceForPID:](a3, v8);
    }
  }
}

- (void)_removeUnreferencedObjectsIfNeeded
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A690B000, a2, OS_LOG_TYPE_DEBUG, "removing resources for pids %{public}@", (uint8_t *)&v2, 0xCu);
}

uint64_t __57__SFProcessDictionary__removeUnreferencedObjectsIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = [*(id *)(*(void *)(a1 + 32) + 32) containsObject:a2] ^ 1;
  if (a2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t __57__SFProcessDictionary__removeUnreferencedObjectsIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = NSNumber;
  int v6 = *(void **)(*(void *)(a1 + 32) + 24);
  id v7 = a3;
  id v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  uint64_t v9 = NSNumber;
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 24) indexOfObject:v7];

  v11 = [v9 numberWithUnsignedInteger:v10];
  uint64_t v12 = [v8 compare:v11];

  return v12;
}

- (id)incrementReferenceForPID:(int)a3 valueCreationBlock:(id)a4
{
  return [(SFProcessDictionary *)self incrementReferenceForPID:*(void *)&a3 additionalKey:0 valueCreationBlock:a4];
}

- (id)incrementReferenceForPID:(int)a3 additionalKey:(id)a4 valueCreationBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = (void (**)(void))a5;
  uint64_t v10 = [NSNumber numberWithInt:v6];
  if (v8)
  {
    uint64_t v11 = [v8 copyWithZone:0];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
  }
  uint64_t v12 = (void *)v11;
  [(NSCountedSet *)self->_references addObject:v10];
  [(NSMutableArray *)self->_recentlyReferencedPIDs removeObject:v10];
  [(NSMutableArray *)self->_recentlyReferencedPIDs insertObject:v10 atIndex:0];
  v13 = [(NSMutableDictionary *)self->_values objectForKeyedSubscript:v10];
  __int16 v14 = [v13 objectForKeyedSubscript:v12];

  if (v14)
  {
    int v15 = WBS_LOG_CHANNEL_PREFIXProcessDictionary();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[SFProcessDictionary incrementReferenceForPID:additionalKey:valueCreationBlock:]((uint64_t)v14, v6, v15);
    }
  }
  else
  {
    __int16 v14 = v9[2](v9);
    uint64_t v16 = [(NSMutableDictionary *)self->_values objectForKeyedSubscript:v10];
    if (v16)
    {
      [(NSMutableDictionary *)self->_values setObject:v16 forKeyedSubscript:v10];
    }
    else
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(NSMutableDictionary *)self->_values setObject:v17 forKeyedSubscript:v10];
    }
    v18 = [(NSMutableDictionary *)self->_values objectForKeyedSubscript:v10];
    [v18 setObject:v14 forKeyedSubscript:v12];

    [(SFProcessDictionary *)self _updateInterestedApplications];
    objc_super v19 = WBS_LOG_CHANNEL_PREFIXProcessDictionary();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v22[0] = 67109635;
      v22[1] = v6;
      __int16 v23 = 2113;
      id v24 = v8;
      __int16 v25 = 2113;
      v26 = v14;
      _os_log_debug_impl(&dword_1A690B000, v19, OS_LOG_TYPE_DEBUG, "created resource for pid %d, %{private}@: %{private}@", (uint8_t *)v22, 0x1Cu);
    }
  }
  id v20 = v14;

  return v20;
}

- (unint64_t)cacheCapacity
{
  return self->_cacheCapacity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_references, 0);
  objc_storeStrong((id *)&self->_recentlyReferencedPIDs, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);

  objc_storeStrong((id *)&self->_pidsPendingTermination, 0);
}

- (void)_handleProcessStateUpdate:(int)a1 state:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1A690B000, a2, OS_LOG_TYPE_DEBUG, "removing resources for process %d because it has been terminated", (uint8_t *)v2, 8u);
}

- (void)decrementReferenceForPID:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A690B000, a2, OS_LOG_TYPE_ERROR, "resource for pid %d has no references to remove", (uint8_t *)v2, 8u);
}

- (void)decrementReferenceForPID:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1A690B000, a2, OS_LOG_TYPE_DEBUG, "last reference to resource for terminated pid %d has been removed. removing the resource", (uint8_t *)v2, 8u);
}

- (void)incrementReferenceForPID:(uint64_t)a1 additionalKey:(int)a2 valueCreationBlock:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109379;
  v3[1] = a2;
  __int16 v4 = 2113;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_1A690B000, log, OS_LOG_TYPE_DEBUG, "pid %d has existing resource %{private}@", (uint8_t *)v3, 0x12u);
}

@end