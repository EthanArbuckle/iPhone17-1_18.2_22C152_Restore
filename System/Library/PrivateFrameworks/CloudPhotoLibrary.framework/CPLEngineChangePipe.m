@interface CPLEngineChangePipe
- (BOOL)appendChangeBatch:(id)a3 error:(id *)a4;
- (BOOL)compactChangeBatchesWithError:(id *)a3;
- (BOOL)deleteAllChangeBatchesWithError:(id *)a3;
- (BOOL)deleteAllChangesWithScopeFilter:(id)a3 error:(id *)a4;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)hasDequeueObservers;
- (BOOL)hasQueuedBatches;
- (BOOL)hasSomeChangeInScopesWithIdentifiers:(id)a3;
- (BOOL)hasSomeChangeWithScopeFilter:(id)a3;
- (BOOL)hasSomeChangeWithScopedIdentifier:(id)a3;
- (BOOL)isEmpty;
- (BOOL)popChangeBatch:(id *)a3 error:(id *)a4;
- (BOOL)popNextBatchWithError:(id *)a3;
- (id)addDequeueObserverWithDequeueSignalBlock:(id)a3;
- (id)allChangeBatches;
- (id)nextBatch;
- (unint64_t)countOfQueuedBatches;
- (unint64_t)scopeType;
- (void)_notifyQueueRemovedChanges;
- (void)addDequeueObserver:(id)a3;
- (void)notifyClientDidAcknowledgeBatch:(id)a3;
- (void)notifyClientWillAcknowledgeBatch:(id)a3;
- (void)removeDequeueObserver:(id)a3;
@end

@implementation CPLEngineChangePipe

- (void).cxx_destruct
{
}

- (BOOL)hasDequeueObservers
{
  return [(NSMutableArray *)self->_dequeueObservers count] != 0;
}

- (void)_notifyQueueRemovedChanges
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_dequeueObservers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "changePipeDidRemoveChanges", (void)v9);
        v8 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        ((void (**)(void, CPLEngineChangePipe *))v8)[2](v8, self);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)notifyClientDidAcknowledgeBatch:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_dequeueObservers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "clientDidAcknowledgeBatchBlock", (void)v11);
        long long v10 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        ((void (**)(void, CPLEngineChangePipe *, id))v10)[2](v10, self, v4);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)notifyClientWillAcknowledgeBatch:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_dequeueObservers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "clientWillAcknowledgeBatchBlock", (void)v11);
        long long v10 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        ((void (**)(void, CPLEngineChangePipe *, id))v10)[2](v10, self, v4);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)removeDequeueObserver:(id)a3
{
}

- (id)addDequeueObserverWithDequeueSignalBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[CPLEngineDequeueObserver alloc] initWithDequeueSignalBlock:v4];

  [(CPLEngineChangePipe *)self addDequeueObserver:v5];
  return v5;
}

- (void)addDequeueObserver:(id)a3
{
  id v4 = a3;
  dequeueObservers = self->_dequeueObservers;
  id v8 = v4;
  if (!dequeueObservers)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_dequeueObservers;
    self->_dequeueObservers = v6;

    id v4 = v8;
    dequeueObservers = self->_dequeueObservers;
  }
  [(NSMutableArray *)dequeueObservers addObject:v4];
}

- (id)allChangeBatches
{
  v2 = [(CPLEngineStorage *)self platformObject];
  v3 = [v2 allChangeBatches];

  return v3;
}

- (BOOL)compactChangeBatchesWithError:(id *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v5 = __CPLStorageOSLogDomain_8605();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      long long v10 = self;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "%@ compacting batches", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v6 = [(CPLEngineStorage *)self platformObject];
  int v7 = [v6 compactChangeBatchesWithError:a3];

  if (v7) {
    [(CPLEngineChangePipe *)self _notifyQueueRemovedChanges];
  }
  return v7;
}

- (BOOL)deleteAllChangesWithScopeFilter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [(CPLEngineStorage *)self platformObject];
  int v8 = [v7 deleteAllChangesWithScopeFilter:v6 error:a4];

  if (v8) {
    [(CPLEngineChangePipe *)self _notifyQueueRemovedChanges];
  }
  return v8;
}

- (BOOL)deleteAllChangeBatchesWithError:(id *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v5 = __CPLStorageOSLogDomain_8605();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      long long v10 = self;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "%@ deleting all batches", (uint8_t *)&v9, 0xCu);
    }
  }
  id v6 = [(CPLEngineStorage *)self platformObject];
  int v7 = [v6 deleteAllChangeBatchesWithError:a3];

  if (v7) {
    [(CPLEngineChangePipe *)self _notifyQueueRemovedChanges];
  }
  return v7;
}

- (BOOL)hasSomeChangeWithScopeFilter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasSomeChangeWithScopeFilter:v4];

  return v6;
}

- (BOOL)hasSomeChangeInScopesWithIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasSomeChangeInScopesWithIdentifiers:v4];

  return v6;
}

- (BOOL)hasSomeChangeWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasSomeChangeWithScopedIdentifier:v4];

  return v6;
}

- (BOOL)popNextBatchWithError:(id *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(CPLEngineStorage *)self platformObject];
  int v6 = [v5 popNextBatchWithError:a3];

  if (v6 && !_CPLSilentLogging)
  {
    int v7 = __CPLStorageOSLogDomain_8605();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      long long v10 = self;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "%@ popped next batch", (uint8_t *)&v9, 0xCu);
    }
  }
  return v6;
}

- (id)nextBatch
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(CPLEngineStorage *)self platformObject];
  id v4 = [v3 nextBatch];

  if (!_CPLSilentLogging)
  {
    uint64_t v5 = __CPLStorageOSLogDomain_8605();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138412546;
      int v8 = self;
      __int16 v9 = 2048;
      uint64_t v10 = [v4 count];
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "%@ getting %lu changes", (uint8_t *)&v7, 0x16u);
    }
  }
  return v4;
}

- (BOOL)popChangeBatch:(id *)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v7 = [(CPLEngineStorage *)self platformObject];
  int v8 = [v7 popChangeBatch:a3 error:a4];

  if (v8 && !_CPLSilentLogging)
  {
    __int16 v9 = __CPLStorageOSLogDomain_8605();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [*a3 count];
      int v12 = 138412546;
      long long v13 = self;
      __int16 v14 = 2048;
      uint64_t v15 = v10;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEBUG, "%@ popped %lu changes", (uint8_t *)&v12, 0x16u);
    }
  }
  return v8;
}

- (BOOL)appendChangeBatch:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    int v7 = __CPLStorageOSLogDomain_8605();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412546;
      int v12 = self;
      __int16 v13 = 2048;
      uint64_t v14 = [v6 count];
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "%@ appending %lu changes", (uint8_t *)&v11, 0x16u);
    }
  }
  int v8 = [(CPLEngineStorage *)self platformObject];
  char v9 = [v8 appendChangeBatch:v6 error:a4];

  return v9;
}

- (BOOL)hasQueuedBatches
{
  v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 hasQueuedBatches];

  return v3;
}

- (BOOL)isEmpty
{
  v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 hasQueuedBatches] ^ 1;

  return v3;
}

- (unint64_t)countOfQueuedBatches
{
  v2 = [(CPLEngineStorage *)self platformObject];
  unint64_t v3 = [v2 countOfQueuedBatches];

  return v3;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  int v11 = [(CPLEngineStorage *)self platformObject];
  int v12 = [v11 deleteRecordsForScopeIndex:a3 maxCount:a4 deletedCount:a5 error:a6];

  if (v12) {
    [(CPLEngineChangePipe *)self _notifyQueueRemovedChanges];
  }
  return v12;
}

- (unint64_t)scopeType
{
  return 1;
}

@end