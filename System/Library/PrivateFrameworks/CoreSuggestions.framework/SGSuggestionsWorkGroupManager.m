@interface SGSuggestionsWorkGroupManager
+ (id)sharedInstance;
- (id)_init;
- (void)finishProcessingForUniqueIdentifier:(id)a3;
- (void)waitForUniqueIdentifierToProcess:(id)a3;
- (void)waitForUniqueIdentifierToProcess:(id)a3 withTimeout:(double)a4;
@end

@implementation SGSuggestionsWorkGroupManager

- (void).cxx_destruct
{
}

- (void)finishProcessingForUniqueIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGSuggestionsWorkGroupManager.m", 139, @"Invalid parameter not satisfying: %@", @"uniqueId" object file lineNumber description];
  }
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__SGSuggestionsWorkGroupManager_finishProcessingForUniqueIdentifier___block_invoke;
  v9[3] = &unk_1E5B906E0;
  id v10 = v5;
  id v7 = v5;
  [(_PASLock *)lock runWithLockAcquired:v9];
}

void __69__SGSuggestionsWorkGroupManager_finishProcessingForUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 addToProcessedIds:*(void *)(a1 + 32)];
  v3 = [v4 groupForUniqueId:*(void *)(a1 + 32)];
  if (v3)
  {
    [v4 leaveGroupForUniqueId:*(void *)(a1 + 32)];
    [v4 removeGroupFromProcessedIds:*(void *)(a1 + 32)];
  }
}

- (void)waitForUniqueIdentifierToProcess:(id)a3 withTimeout:(double)a4
{
  id v7 = a3;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGSuggestionsWorkGroupManager.m", 108, @"Invalid parameter not satisfying: %@", @"uniqueId" object file lineNumber description];
  }
  if (a4 == 0.0) {
    a4 = 10.0;
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__9672;
  v22 = __Block_byref_object_dispose__9673;
  id v23 = 0;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__SGSuggestionsWorkGroupManager_waitForUniqueIdentifierToProcess_withTimeout___block_invoke;
  v15[3] = &unk_1E5B906B8;
  id v9 = v7;
  id v16 = v9;
  v17 = &v18;
  [(_PASLock *)lock runWithLockAcquired:v15];
  if (v19[5])
  {
    int v10 = objc_msgSend(MEMORY[0x1E4F93B18], "waitForGroup:timeoutSeconds:", a4);
    if (v10 == 1)
    {
      v11 = sgLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v12 = "SGSuggestionsWorkGroupManager - Timeout waiting for suggestions group leave status. Continuing...";
        goto LABEL_12;
      }
LABEL_13:

      goto LABEL_14;
    }
    if (!v10)
    {
      v11 = sgLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v12 = "SGSuggestionsWorkGroupManager - Acquired leave group. Continuing...";
LABEL_12:
        _os_log_impl(&dword_1A4D8C000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
LABEL_14:

  _Block_object_dispose(&v18, 8);
}

void __78__SGSuggestionsWorkGroupManager_waitForUniqueIdentifierToProcess_withTimeout___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (([v9 isProcessedUniqueId:*(void *)(a1 + 32)] & 1) == 0)
  {
    uint64_t v3 = [v9 groupForUniqueId:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      uint64_t v6 = [v9 createGroupForUniqueId:*(void *)(a1 + 32)];
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      [v9 enterGroupForUniqueId:*(void *)(a1 + 32)];
    }
  }
}

- (void)waitForUniqueIdentifierToProcess:(id)a3
{
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)SGSuggestionsWorkGroupManager;
  v2 = [(SGSuggestionsWorkGroupManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v3];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v4;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global_9682);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult;

  return v2;
}

void __47__SGSuggestionsWorkGroupManager_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1A6265250]();
  id v1 = [[SGSuggestionsWorkGroupManager alloc] _init];
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = (uint64_t)v1;
}

@end