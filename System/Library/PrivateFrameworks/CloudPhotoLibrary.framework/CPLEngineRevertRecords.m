@interface CPLEngineRevertRecords
- (BOOL)addRecordsToRevertWithLocalScopedIdentifier:(id)a3 class:(Class)a4 error:(id *)a5;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)deleteRecordsToRevertFromBatch:(id)a3 error:(id *)a4;
- (BOOL)shouldRevertRecordWithLocalScopedIdentifier:(id)a3;
- (id)nextBatchOfRecordsToRevert;
- (unint64_t)scopeType;
@end

@implementation CPLEngineRevertRecords

- (BOOL)shouldRevertRecordWithLocalScopedIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 shouldRevertRecordWithLocalScopedIdentifier:v4];

  return v6;
}

- (BOOL)deleteRecordsToRevertFromBatch:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  context = (void *)MEMORY[0x1BA993DF0]();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v20 = a4;
    id v10 = 0;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      uint64_t v12 = 0;
      v13 = v10;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v7);
        }
        v14 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
        v15 = [(CPLEngineStorage *)self platformObject];
        v16 = [v14 scopedIdentifier];
        id v22 = v13;
        int v17 = [v15 deleteRecordsToRevertWithLocalScopedIdentifier:v16 error:&v22];
        id v10 = v22;

        if (!v17)
        {

          if (v20)
          {
            id v10 = v10;
            BOOL v18 = 0;
            id *v20 = v10;
          }
          else
          {
            BOOL v18 = 0;
          }
          goto LABEL_15;
        }
        ++v12;
        v13 = v10;
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v10 = 0;
  }

  BOOL v18 = 1;
LABEL_15:

  return v18;
}

- (id)nextBatchOfRecordsToRevert
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [(CPLEngineStorage *)self engineStore];
  v30 = [v3 transactionClientCacheView];

  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v4 = [(CPLEngineStorage *)self platformObject];
  v5 = [v4 revertedPlaceholderRecordsEnumerator];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v32 = *(void *)v35;
    uint64_t v9 = v30;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x1BA993DF0]();
        v13 = [v11 scopedIdentifier];
        v14 = [v9 recordViewWithScopedIdentifier:v13];

        if (!v14)
        {
          v19 = (void *)[v11 recordClass];
          v20 = [v11 scopedIdentifier];
          v15 = (void *)[v19 newDeleteChangeWithScopedIdentifier:v20];

          if (v8) {
            goto LABEL_9;
          }
LABEL_8:
          uint64_t v8 = objc_alloc_init(CPLChangeBatch);
          goto LABEL_9;
        }
        v15 = [v14 synthesizedRecord];
        if (!v8) {
          goto LABEL_8;
        }
LABEL_9:
        if (objc_msgSend(v15, "isFullRecord", v30))
        {
          if ([v15 isAssetChange])
          {
            uint64_t v16 = [v15 relatedScopedIdentifier];
            if (v16)
            {
              int v17 = (void *)v16;
              BOOL v18 = [v15 relatedScopedIdentifier];
              if ([v33 containsObject:v18])
              {
              }
              else
              {
                v21 = [v15 relatedScopedIdentifier];
                id v22 = [(CPLChangeBatch *)v8 additionalRecordWithScopedIdentifier:v21];

                uint64_t v9 = v30;
                if (v22) {
                  goto LABEL_21;
                }
                long long v23 = [v15 relatedScopedIdentifier];
                long long v24 = [v30 recordViewWithScopedIdentifier:v23];
                int v17 = [v24 synthesizedRecord];

                if (v17) {
                  [(CPLChangeBatch *)v8 _addAdditionalRecord:v17];
                }
                uint64_t v9 = v30;
              }
            }
          }
        }
LABEL_21:
        long long v25 = [v15 scopedIdentifier];
        [v33 addObject:v25];

        [(CPLChangeBatch *)v8 addRecord:v15];
        unint64_t v26 = [(CPLChangeBatch *)v8 count];

        if (v26 > 0x63) {
          goto LABEL_26;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (!v7) {
        goto LABEL_26;
      }
    }
  }
  uint64_t v8 = 0;
  uint64_t v9 = v30;
LABEL_26:

  v27 = v9;
  uint64_t v28 = v8;

  return v28;
}

- (BOOL)addRecordsToRevertWithLocalScopedIdentifier:(id)a3 class:(Class)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a5) = [v9 addRecordsToRevertWithLocalScopedIdentifier:v8 class:a4 error:a5];

  return (char)a5;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  id v10 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a6) = [v10 deleteRecordsForScopeIndex:a3 maxCount:a4 deletedCount:a5 error:a6];

  return (char)a6;
}

- (unint64_t)scopeType
{
  return 3;
}

@end