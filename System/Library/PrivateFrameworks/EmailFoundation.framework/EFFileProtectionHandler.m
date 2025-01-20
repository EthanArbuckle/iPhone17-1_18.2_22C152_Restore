@interface EFFileProtectionHandler
+ (OS_os_log)log;
- (BOOL)_moveQueuedFiles;
- (BOOL)moveFile:(id)a3 toProtectionClass:(id)a4;
- (EFFileProtectionHandler)init;
- (void)enqueueMovingFile:(id)a3 toProtectionClass:(id)a4;
- (void)enqueueMovingFileProtections:(id)a3;
- (void)enqueueMovingFiles:(id)a3 toProtectionClass:(id)a4;
- (void)registerMoveFileBackgroundTask;
- (void)unregisterMoveFileBackgroundTask;
@end

@implementation EFFileProtectionHandler

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__EFFileProtectionHandler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_3 != -1) {
    dispatch_once(&log_onceToken_3, block);
  }
  v2 = (void *)log_log_3;
  return (OS_os_log *)v2;
}

void __30__EFFileProtectionHandler_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_3;
  log_log_3 = (uint64_t)v1;
}

- (EFFileProtectionHandler)init
{
  v9.receiver = self;
  v9.super_class = (Class)EFFileProtectionHandler;
  v2 = [(EFFileProtectionHandler *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    moveFileQueue = v2->_moveFileQueue;
    v2->_moveFileQueue = (NSMutableArray *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.email.moveFileProtectionBackgroundTaskQueue", v5);
    backgroundTaskQueue = v2->_backgroundTaskQueue;
    v2->_backgroundTaskQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (BOOL)moveFile:(id)a3 toProtectionClass:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x1E4F1C590];
  id v14 = 0;
  int v8 = [v5 setResourceValue:v6 forKey:v7 error:&v14];
  id v9 = v14;
  if (v8)
  {
    v10 = +[EFFileProtectionHandler log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = [v5 path];
      [(EFFileProtectionHandler *)v11 moveFile:buf toProtectionClass:v10];
    }
  }
  else
  {
    v10 = +[EFFileProtectionHandler log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = [v5 path];
      *(_DWORD *)buf = 138412802;
      v16 = v13;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2114;
      id v20 = v9;
      _os_log_error_impl(&dword_1B5A59000, v10, OS_LOG_TYPE_ERROR, "Moving file %@ to protection type %@ failed with error %{public}@", buf, 0x20u);
    }
  }

  return v8;
}

- (void)enqueueMovingFile:(id)a3 toProtectionClass:(id)a4
{
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a4 forKey:a3];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_moveFileQueue addObject:v5];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)enqueueMovingFiles:(id)a3 toProtectionClass:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v8, "setObject:forKey:", v7, *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_moveFileQueue addObject:v8];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)enqueueMovingFileProtections:(id)a3
{
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:a3];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_moveFileQueue addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)_moveQueuedFiles
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v33 = objc_opt_new();
  v32 = objc_opt_new();
  locuint64_t k = &self->_lock;
  v31 = self;
  char v3 = 1;
  while (1)
  {
    os_unfair_lock_lock(lock);
    id v4 = [(NSMutableArray *)v31->_moveFileQueue firstObject];
    if (!v4) {
      break;
    }
    [(NSMutableArray *)v31->_moveFileQueue removeObjectAtIndex:0];
    os_unfair_lock_unlock(lock);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v49 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v48 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend(v5, "objectForKeyedSubscript:", v9, lock);
          BOOL v11 = [(EFFileProtectionHandler *)v31 moveFile:v9 toProtectionClass:v10];
          uint64_t v12 = [v33 objectForKeyedSubscript:v10];
          if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            if (v11)
            {
              long long v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "unsignedIntegerValue") + 1);
              [v33 setObject:v13 forKeyedSubscript:v10];
            }
          }
          else
          {
            if (v11) {
              long long v14 = &unk_1F0EC0010;
            }
            else {
              long long v14 = &unk_1F0EC0028;
            }
            [v33 setObject:v14 forKeyedSubscript:v10];
          }
          long long v15 = [v32 objectForKeyedSubscript:v10];
          if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            if (!v11)
            {
              long long v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "unsignedIntegerValue") + 1);
              [v32 setObject:v16 forKeyedSubscript:v10];
            }
          }
          else
          {
            if (v11) {
              __int16 v17 = &unk_1F0EC0028;
            }
            else {
              __int16 v17 = &unk_1F0EC0010;
            }
            [v32 setObject:v17 forKeyedSubscript:v10];
          }

          v3 &= v11;
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v6);
    }
  }
  os_unfair_lock_unlock(lock);
  if ([v33 count])
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v18 = v33;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v45 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = *(void *)(*((void *)&v44 + 1) + 8 * j);
          uint64_t v38 = MEMORY[0x1E4F143A8];
          uint64_t v39 = 3221225472;
          v40 = __43__EFFileProtectionHandler__moveQueuedFiles__block_invoke;
          v41 = &unk_1E6121F00;
          uint64_t v42 = v22;
          id v23 = v18;
          id v43 = v23;
          AnalyticsSendEventLazy();
        }
        uint64_t v19 = [v23 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v19);
    }
  }
  if (objc_msgSend(v32, "count", lock))
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v24 = v32;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v52 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v35;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v35 != v26) {
            objc_enumerationMutation(v24);
          }
          id v28 = v24;
          AnalyticsSendEventLazy();
        }
        uint64_t v25 = [v28 countByEnumeratingWithState:&v34 objects:v52 count:16];
      }
      while (v25);
    }
  }
  return v3 & 1;
}

id __43__EFFileProtectionHandler__moveQueuedFiles__block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  [v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"Target File Protection"];
  char v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 32)];
  [v2 setObject:v3 forKeyedSubscript:@"Count"];

  [v2 setObject:@"Success" forKeyedSubscript:@"Status"];
  return v2;
}

id __43__EFFileProtectionHandler__moveQueuedFiles__block_invoke_2(uint64_t a1)
{
  v2 = objc_opt_new();
  [v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"Target File Protection"];
  char v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 32)];
  [v2 setObject:v3 forKeyedSubscript:@"Count"];

  [v2 setObject:@"Failure" forKeyedSubscript:@"Status"];
  return v2;
}

- (void)unregisterMoveFileBackgroundTask
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1B5A59000, log, OS_LOG_TYPE_DEBUG, "Stopping background task for moving file protection", v1, 2u);
}

- (void)registerMoveFileBackgroundTask
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1B5A59000, log, OS_LOG_TYPE_DEBUG, "Starting background task for moving file protection", v1, 2u);
}

void __57__EFFileProtectionHandler_registerMoveFileBackgroundTask__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _moveQueuedFiles];
  }
  else
  {
    char v3 = +[EFFileProtectionHandler log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __57__EFFileProtectionHandler_registerMoveFileBackgroundTask__block_invoke_cold_1(v3);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundTaskQueue, 0);
  objc_storeStrong((id *)&self->_moveFileQueue, 0);
}

- (void)moveFile:(uint8_t *)buf toProtectionClass:(os_log_t)log .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1B5A59000, log, OS_LOG_TYPE_DEBUG, "Successfully moved file %@ to protection type %@", buf, 0x16u);
}

void __57__EFFileProtectionHandler_registerMoveFileBackgroundTask__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1B5A59000, log, OS_LOG_TYPE_ERROR, "Not handling background task because FileProtectionHandler is nil.", v1, 2u);
}

@end