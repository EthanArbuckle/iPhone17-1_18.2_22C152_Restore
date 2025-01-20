@interface ATXActionCacheClientReader
- (ATXActionCacheClientReader)initWithChunks:(id)a3;
- (ATXActionCacheClientReader)initWithData:(id)a3;
- (NSIndexSet)lockscreenPredictionIndices;
- (id)_getLockScreenPredictionIndices:(id)a3;
- (id)_predicateForInstalledAndNonEngagedPredictions:(id)a3;
- (id)actionsWithConsumerSubType:(unsigned __int8)a3 limit:(int64_t)a4;
- (id)actionsWithLimit:(int64_t)a3 shouldFilterRestrictedAppsAndRecentEngagements:(BOOL)a4;
- (id)lockscreenPredictionIndicesUpToLimit:(int64_t)a3;
- (unint64_t)chunkCount;
@end

@implementation ATXActionCacheClientReader

- (ATXActionCacheClientReader)initWithData:(id)a3
{
  v4 = ATXCacheFileSplitChunks();
  v5 = [(ATXActionCacheClientReader *)self initWithChunks:v4];

  return v5;
}

- (ATXActionCacheClientReader)initWithChunks:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXActionCacheClientReader;
  v5 = [(ATXActionCacheClientReader *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 count];
    if (v6 == [(ATXActionCacheClientReader *)v5 chunkCount])
    {
      uint64_t v7 = [v4 objectAtIndexedSubscript:0];
      scoredActionsChunk = v5->_scoredActionsChunk;
      v5->_scoredActionsChunk = (NSData *)v7;

      uint64_t v9 = [(ATXActionCacheClientReader *)v5 _getLockScreenPredictionIndices:v4];
      p_super = &v5->_lockscreenPredictionIndices->super;
      v5->_lockscreenPredictionIndices = (NSIndexSet *)v9;
    }
    else
    {
      p_super = __atxlog_handle_default();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [v4 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v15 = v11;
        __int16 v16 = 1024;
        int v17 = 4;
        _os_log_impl(&dword_1A790D000, p_super, OS_LOG_TYPE_DEFAULT, "Wrong number of chunks returned from cache. Cache had %lu chunks, expected %i (this may be due to a cache change)", buf, 0x12u);
      }
    }
  }
  return v5;
}

- (unint64_t)chunkCount
{
  return 4;
}

- (id)actionsWithConsumerSubType:(unsigned __int8)a3 limit:(int64_t)a4
{
  if (self->_lockscreenPredictionIndices)
  {
    if (a3 == 22)
    {
      v5 = [(ATXActionCacheClientReader *)self lockscreenPredictionIndicesUpToLimit:a4];
      if ([v5 count])
      {
        uint64_t v6 = -[ATXActionCacheClientReader actionsWithLimit:shouldFilterRestrictedAppsAndRecentEngagements:](self, "actionsWithLimit:shouldFilterRestrictedAppsAndRecentEngagements:", [v5 lastIndex] + 1, 0);
        unint64_t v7 = [v5 lastIndex];
        if (v7 >= [v6 count])
        {
          uint64_t v9 = __atxlog_handle_default();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            -[ATXActionCacheClientReader actionsWithConsumerSubType:limit:](v5, v6, v9);
          }

          v8 = (void *)MEMORY[0x1E4F1CBF0];
        }
        else
        {
          v8 = [v6 objectsAtIndexes:v5];
        }
      }
      else
      {
        v8 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      v8 = [(ATXActionCacheClientReader *)self actionsWithLimit:a4 shouldFilterRestrictedAppsAndRecentEngagements:1];
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)lockscreenPredictionIndicesUpToLimit:(int64_t)a3
{
  v5 = self->_lockscreenPredictionIndices;
  if ([(NSIndexSet *)self->_lockscreenPredictionIndices count] > a3)
  {
    uint64_t v6 = objc_opt_new();
    lockscreenPredictionIndices = self->_lockscreenPredictionIndices;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__ATXActionCacheClientReader_lockscreenPredictionIndicesUpToLimit___block_invoke;
    v11[3] = &unk_1E5D05AE8;
    id v8 = v6;
    id v12 = v8;
    int64_t v13 = a3;
    [(NSIndexSet *)lockscreenPredictionIndices enumerateIndexesUsingBlock:v11];
    uint64_t v9 = (NSIndexSet *)v8;

    v5 = v9;
  }

  return v5;
}

unint64_t __67__ATXActionCacheClientReader_lockscreenPredictionIndicesUpToLimit___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  unint64_t result = [*(id *)(a1 + 32) count];
  if (result >= *(void *)(a1 + 40))
  {
    *a3 = 1;
  }
  else
  {
    unint64_t v7 = *(void **)(a1 + 32);
    return [v7 addIndex:a2];
  }
  return result;
}

- (id)_predicateForInstalledAndNonEngagedPredictions:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28F60];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__ATXActionCacheClientReader__predicateForInstalledAndNonEngagedPredictions___block_invoke;
  v8[3] = &unk_1E5D05B10;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 predicateWithBlock:v8];

  return v6;
}

BOOL __77__ATXActionCacheClientReader__predicateForInstalledAndNonEngagedPredictions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 predictedItem];
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [v3 bundleId];
    BOOL v4 = +[ATXApplicationRecord isInstalledAndNotRestrictedForBundle:v5];
  }
  return v4;
}

- (id)actionsWithLimit:(int64_t)a3 shouldFilterRestrictedAppsAndRecentEngagements:(BOOL)a4
{
  if (self->_scoredActionsChunk)
  {
    BOOL v5 = a4;
    unint64_t v7 = +[ATXPredictionSetReader actionReader:](ATXPredictionSetReader, "actionReader:");
    if (v5)
    {
      id v8 = objc_opt_new();
      id v9 = [v8 recentActions];
      v10 = [(ATXActionCacheClientReader *)self _predicateForInstalledAndNonEngagedPredictions:v9];
    }
    else
    {
      v10 = 0;
    }
    uint64_t v11 = [v7 readScoredPredictionsWithLimit:a3 filterPredicate:v10];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (id)_getLockScreenPredictionIndices:(id)a3
{
  id v5 = a3;
  if ((unint64_t)[v5 count] <= 1)
  {
    int64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"ATXActionCacheClientReader.m", 129, @"Invalid parameter not satisfying: %@", @"chunks.count >= 2" object file lineNumber description];
  }
  id v6 = [v5 objectAtIndexedSubscript:1];
  uint64_t v14 = [v6 bytes];
  id v7 = v6;
  uint64_t v8 = [v7 bytes];
  unint64_t v9 = v8 + [v7 length];
  Integer = ATXCacheReadInteger((unint64_t *)&v14, v9);
  uint64_t v11 = objc_opt_new();
  if ((uint64_t)Integer >= 1)
  {
    do
    {
      objc_msgSend(v11, "addIndex:", ATXCacheReadInteger((unint64_t *)&v14, v9));
      Integer = (unint64_t *)((char *)Integer - 1);
    }
    while (Integer);
  }

  return v11;
}

- (NSIndexSet)lockscreenPredictionIndices
{
  return self->_lockscreenPredictionIndices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockscreenPredictionIndices, 0);

  objc_storeStrong((id *)&self->_scoredActionsChunk, 0);
}

- (void)actionsWithConsumerSubType:(NSObject *)a3 limit:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 134218240;
  uint64_t v6 = [a1 lastIndex];
  __int16 v7 = 2048;
  uint64_t v8 = [a2 count];
  _os_log_error_impl(&dword_1A790D000, a3, OS_LOG_TYPE_ERROR, "Index %lu out of bounds for predictions with count %lu", (uint8_t *)&v5, 0x16u);
}

@end