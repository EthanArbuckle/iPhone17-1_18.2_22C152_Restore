@interface CPLEngineStatusCenter
- (BOOL)acknowledgeChangedStatuses:(id)a3 error:(id *)a4;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)discardNotificationForRecordWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)hasStatusChanges;
- (BOOL)notifyStatusForRecordHasChanged:(id)a3 persist:(BOOL)a4 error:(id *)a5;
- (BOOL)notifyStatusForRecordViewHasChanged:(id)a3 persist:(BOOL)a4 error:(id *)a5;
- (BOOL)notifyStatusForRecordWithScopedIdentifierHasChanged:(id)a3 recordClass:(Class)a4 persist:(BOOL)a5 error:(id *)a6;
- (CPLEngineStatusCenter)initWithEngineStore:(id)a3 name:(id)a4;
- (id)_allScopedIdentifierInCollection:(id)a3 withScopeIdentifier:(id)a4;
- (id)_statusFromCachesWithRecordScopedIdentifier:(id)a3;
- (id)allStatusChanges;
- (id)recordForStatusWithScopedIdentifier:(id)a3;
- (id)recordViewForStatusWithScopedIdentifier:(id)a3;
- (id)status;
- (id)statusChanges;
- (id)statusesForRecordsWithIdentifiers:(id)a3;
- (id)statusesForRecordsWithScopedIdentifiers:(id)a3;
- (unint64_t)scopeType;
- (void)_fillStatus:(id)a3;
- (void)_fillStatus:(id)a3 withClientCacheRecordView:(id)a4 cloudCacheRecord:(id)a5 isConfirmed:(BOOL)a6 isStaged:(BOOL)a7 isInIDMapping:(BOOL)a8;
- (void)_removeScopedIdentifiersFromSet:(id)a3 withScopeIdentifier:(id)a4;
- (void)_removeStatusesInDictionary:(id)a3 withScopeIdentifier:(id)a4;
- (void)resetAllTransientStatuses;
- (void)resetTransientStatusesWithScopeIdentifier:(id)a3;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLEngineStatusCenter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientStatuses, 0);
  objc_storeStrong((id *)&self->_pendingDeletedTransientStatuses, 0);
  objc_storeStrong((id *)&self->_pendingTransientStatuses, 0);
  objc_storeStrong((id *)&self->_persistedScopedIdentifiers, 0);
  objc_storeStrong((id *)&self->_transactionStartDate, 0);
}

- (id)allStatusChanges
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(NSMutableDictionary *)self->_transientStatuses count]
    || [(NSMutableSet *)self->_pendingDeletedTransientStatuses count])
  {
    uint64_t v4 = [(NSMutableSet *)self->_pendingDeletedTransientStatuses count];
    transientStatuses = self->_transientStatuses;
    if (v4)
    {
      v6 = (NSMutableDictionary *)[(NSMutableDictionary *)transientStatuses mutableCopy];
      [(NSMutableDictionary *)v6 addEntriesFromDictionary:self->_pendingTransientStatuses];
    }
    else
    {
      v6 = transientStatuses;
    }
    unint64_t v7 = [(NSMutableDictionary *)self->_transientStatuses count];
    if (v7 >= 0x3E8) {
      uint64_t v8 = 1000;
    }
    else {
      uint64_t v8 = v7;
    }
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v28[3] = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __41__CPLEngineStatusCenter_allStatusChanges__block_invoke;
    v24[3] = &unk_1E60AA700;
    v24[4] = self;
    id v25 = v3;
    v26 = v28;
    uint64_t v27 = v8;
    [(NSMutableDictionary *)v6 enumerateKeysAndObjectsUsingBlock:v24];

    _Block_object_dispose(v28, 8);
  }
  v9 = [(CPLEngineStorage *)self platformObject];
  v10 = [v9 statusChangesMaximumCount:10000];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "record", (void)v20);
        v17 = [v16 scopedIdentifier];

        v18 = [v3 objectForKeyedSubscript:v17];
        LODWORD(v16) = v18 == 0;

        if (v16)
        {
          [(CPLEngineStatusCenter *)self _fillStatus:v15];
          [v3 setObject:v15 forKeyedSubscript:v17];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v29 count:16];
    }
    while (v12);
  }

  return v3;
}

void __41__CPLEngineStatusCenter_allStatusChanges__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  v6 = [v9 record];
  unint64_t v7 = [v6 scopedIdentifier];

  if (([*(id *)(*(void *)(a1 + 32) + 72) containsObject:v7] & 1) == 0)
  {
    uint64_t v8 = [v9 status];
    [*(id *)(a1 + 32) _fillStatus:v8];
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v7];
    if (++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(a1 + 56)) {
      *a4 = 1;
    }
  }
}

- (id)status
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_transientStatuses count])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
    v23.receiver = self;
    v23.super_class = (Class)CPLEngineStatusCenter;
    uint64_t v4 = [(CPLEngineStorage *)&v23 status];
    v5 = (void *)[v3 initWithFormat:@"%@\n%lu transient:", v4, -[NSMutableDictionary count](self->_transientStatuses, "count")];

    id v6 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    transientStatuses = self->_transientStatuses;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __31__CPLEngineStatusCenter_status__block_invoke;
    v21[3] = &unk_1E60AA748;
    id v8 = v6;
    id v22 = v8;
    [(NSMutableDictionary *)transientStatuses enumerateKeysAndObjectsUsingBlock:v21];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = [v8 allObjects];
    v10 = [v9 sortedArrayUsingSelector:sel_compare_];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          [v5 appendFormat:@"\n\t%@: %lu", *(void *)(*((void *)&v17 + 1) + 8 * i), objc_msgSend(v8, "countForObject:", *(void *)(*((void *)&v17 + 1) + 8 * i))];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v24 count:16];
      }
      while (v12);
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CPLEngineStatusCenter;
    v5 = [(CPLEngineStorage *)&v16 status];
  }
  return v5;
}

void __31__CPLEngineStatusCenter_status__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 record];
  v5 = (objc_class *)objc_opt_class();

  id v6 = *(void **)(a1 + 32);
  NSStringFromClass(v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 addObject:v7];
}

- (id)recordViewForStatusWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self engineStore];
  id v6 = [v5 transactionClientCacheView];
  id v7 = [v6 recordViewWithScopedIdentifier:v4];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v9 = [v5 quarantinedRecords];
    v10 = (void *)[v9 classForQuarantinedRecordWithScopedIdentifier:v4];

    if (!v10) {
      v10 = objc_opt_class();
    }
    uint64_t v11 = (void *)[v10 newRecordWithScopedIdentifier:v4];
    id v8 = [v11 asRecordView];
  }
  return v8;
}

- (id)recordForStatusWithScopedIdentifier:(id)a3
{
  id v3 = [(CPLEngineStatusCenter *)self recordViewForStatusWithScopedIdentifier:a3];
  id v4 = [v3 synthesizedRecord];

  return v4;
}

- (id)_statusFromCachesWithRecordScopedIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self engineStore];
  id v6 = [v5 transactionClientCacheView];
  id v7 = [v6 recordViewWithScopedIdentifier:v4];

  __int16 v19 = 0;
  unsigned __int8 v18 = 0;
  id v8 = [v5 idMapping];
  uint64_t v9 = [v8 cloudScopedIdentifierForLocalScopedIdentifier:v4 isFinal:(char *)&v19 + 1];
  v10 = (void *)v9;
  if (!v9)
  {
    v10 = (void *)[v4 copy];
    uint64_t v13 = [v8 localScopedIdentifierForCloudScopedIdentifier:v10 isFinal:(char *)&v19 + 1];

    if (v13)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      goto LABEL_5;
    }
    if (!v10)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      goto LABEL_6;
    }
  }
  uint64_t v11 = v10;
  v10 = [v5 cloudCache];
  uint64_t v12 = [v10 recordWithScopedIdentifier:v11 isConfirmed:&v19 isStaged:&v18];
LABEL_5:

LABEL_6:
  v14 = (void *)[v7 recordClass];
  if (!v14)
  {
    v14 = objc_opt_class();
    if (!v14) {
      v14 = objc_opt_class();
    }
  }
  v15 = (void *)[v14 newRecordWithScopedIdentifier:v4];
  objc_super v16 = [[CPLRecordStatus alloc] initWithRecord:v15 generation:0];
  [(CPLEngineStatusCenter *)self _fillStatus:v16 withClientCacheRecordView:v7 cloudCacheRecord:v12 isConfirmed:v19 isStaged:v18 isInIDMapping:v9 != 0];

  return v16;
}

- (void)_fillStatus:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self engineStore];
  id v6 = [v4 record];
  id v7 = [v6 scopedIdentifier];

  id v8 = [v5 transactionClientCacheView];
  uint64_t v9 = [v8 recordViewWithScopedIdentifier:v7];

  __int16 v17 = 0;
  char v16 = 0;
  v10 = [v5 idMapping];
  uint64_t v11 = [v10 cloudScopedIdentifierForLocalScopedIdentifier:v7 isFinal:(char *)&v17 + 1];

  if (v11)
  {
    uint64_t v12 = [v5 cloudCache];
    uint64_t v13 = [v12 recordWithScopedIdentifier:v11 isConfirmed:&v17 isStaged:&v16];

    BOOL v14 = (_BYTE)v17 != 0;
    BOOL v15 = v16 != 0;
  }
  else
  {
    BOOL v15 = 0;
    BOOL v14 = 0;
    uint64_t v13 = 0;
  }
  [(CPLEngineStatusCenter *)self _fillStatus:v4 withClientCacheRecordView:v9 cloudCacheRecord:v13 isConfirmed:v14 isStaged:v15 isInIDMapping:v11 != 0];
}

- (void)_fillStatus:(id)a3 withClientCacheRecordView:(id)a4 cloudCacheRecord:(id)a5 isConfirmed:(BOOL)a6 isStaged:(BOOL)a7 isInIDMapping:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a5;
  char v16 = [(CPLEngineStorage *)self engineStore];
  __int16 v17 = [v16 pushRepository];
  unsigned __int8 v18 = [v14 record];
  __int16 v19 = [v18 scopedIdentifier];

  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  v34 = __115__CPLEngineStatusCenter__fillStatus_withClientCacheRecordView_cloudCacheRecord_isConfirmed_isStaged_isInIDMapping___block_invoke;
  v35 = &unk_1E60A6660;
  id v36 = v17;
  id v20 = v19;
  id v37 = v20;
  id v21 = v14;
  id v38 = v21;
  id v22 = v17;
  uint64_t v23 = MEMORY[0x1BA994060](&v32);
  v24 = (void *)v23;
  if (!a4)
  {
    if (v15)
    {
      (*(void (**)(uint64_t))(v23 + 16))(v23);
      if ([v21 isWaitingForUpdate] & 1) != 0 || (objc_msgSend(v21, "isUpdating")) {
        goto LABEL_16;
      }
      if (v9) {
        goto LABEL_3;
      }
    }
    else if (!v8)
    {
      [v21 setUnknown:1];
      goto LABEL_16;
    }
    [v21 setResetting:1];
    goto LABEL_16;
  }
  (*(void (**)(uint64_t))(v23 + 16))(v23);
  if (v15)
  {
LABEL_3:
    [v21 setUploaded:1];
    goto LABEL_16;
  }
  if ([v21 isUpdating])
  {
    [v21 setUploading:1];
    [v21 setUpdating:0];
  }
  else if ([v21 isWaitingForUpdate])
  {
    [v21 setWaitingForUpload:1];
    [v21 setWaitingForUpdate:0];
  }
LABEL_16:
  if (([v21 isResetting] & 1) == 0 && (objc_msgSend(v21, "isUnknown") & 1) == 0)
  {
    uint64_t v25 = [v16 sharingScopeIdentifier];
    v26 = (void *)v25;
    if (v15 && v25)
    {
      if ([v15 supportsSharingScopedIdentifier]
        && [v15 isSharedInScopeWithIdentifier:v26])
      {
        [v21 setShared:1];
      }
      else if ([v15 supportsSharing])
      {
        uint64_t v27 = [v16 cloudCache];
        v28 = [v15 scopedIdentifier];
        v31 = [v27 targetForRecordWithCloudScopedIdentifier:v28];

        if (([v31 targetState] & 0xFFFFFFFFFFFFFFFELL) == 2) {
          [v21 setShared:1];
        }
      }
    }
  }
  v29 = objc_msgSend(v16, "quarantinedRecords", v31, v32, v33, v34, v35);
  int v30 = [v29 isRecordWithScopedIdentifierQuarantined:v20];

  if (v30) {
    [v21 setQuarantined:1];
  }
  if (v15 && v10 && ([v21 isWaitingForUpdate] & 1) == 0) {
    [v21 setConfirmed:1];
  }
}

void __115__CPLEngineStatusCenter__fillStatus_withClientCacheRecordView_cloudCacheRecord_isConfirmed_isStaged_isInIDMapping___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) storedExtractedBatch];
  v2 = [v4 batch];
  int v3 = [v2 hasChangeWithScopedIdentifier:*(void *)(a1 + 40)];

  if (v3)
  {
    [*(id *)(a1 + 48) setUpdating:1];
  }
  else if ([*(id *)(a1 + 32) hasSomeChangeWithScopedIdentifier:*(void *)(a1 + 40)])
  {
    [*(id *)(a1 + 48) setWaitingForUpdate:1];
  }
}

- (void)writeTransactionDidSucceed
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)CPLEngineStatusCenter;
  [(CPLEngineStorage *)&v28 writeTransactionDidSucceed];
  if ([(NSMutableSet *)self->_persistedScopedIdentifiers count]) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = [(NSMutableDictionary *)self->_pendingTransientStatuses count] != 0;
  }
  transientStatuses = self->_transientStatuses;
  v5 = [(NSMutableSet *)self->_persistedScopedIdentifiers allObjects];
  [(NSMutableDictionary *)transientStatuses removeObjectsForKeys:v5];

  [(NSMutableSet *)self->_persistedScopedIdentifiers removeAllObjects];
  [(NSMutableDictionary *)self->_transientStatuses addEntriesFromDictionary:self->_pendingTransientStatuses];
  id v6 = self->_transientStatuses;
  id v7 = [(NSMutableSet *)self->_pendingDeletedTransientStatuses allObjects];
  [(NSMutableDictionary *)v6 removeObjectsForKeys:v7];

  [(NSMutableDictionary *)self->_pendingTransientStatuses removeAllObjects];
  [(NSMutableSet *)self->_pendingDeletedTransientStatuses removeAllObjects];
  self->_currentGeneration = 0;
  transactionStartDate = self->_transactionStartDate;
  self->_transactionStartDate = 0;

  if ((unint64_t)[(NSMutableDictionary *)self->_transientStatuses count] >= 0xC9)
  {
    uint64_t v9 = 200 - [(NSMutableDictionary *)self->_transientStatuses count];
    if (!_CPLSilentLogging)
    {
      if (__CPLStorageOSLogDomain_onceToken_19665 != -1) {
        dispatch_once(&__CPLStorageOSLogDomain_onceToken_19665, &__block_literal_global_143);
      }
      BOOL v10 = __CPLStorageOSLogDomain_result_19666;
      if (os_log_type_enabled((os_log_t)__CPLStorageOSLogDomain_result_19666, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v31 = v9;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEFAULT, "Too many pending transient notifications, dropping %lu of them", buf, 0xCu);
      }
    }
    BOOL v23 = v3;
    uint64_t v11 = [(NSMutableDictionary *)self->_transientStatuses allValues];
    uint64_t v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_19668];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
LABEL_12:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        unsigned __int8 v18 = self->_transientStatuses;
        __int16 v19 = [*(id *)(*((void *)&v24 + 1) + 8 * v17) record];
        id v20 = [v19 scopedIdentifier];
        [(NSMutableDictionary *)v18 removeObjectForKey:v20];

        if (!--v9) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
          if (v15) {
            goto LABEL_12;
          }
          break;
        }
      }
    }

    BOOL v3 = v23;
  }
  if (v3)
  {
    id v21 = [(CPLEngineStorage *)self engineStore];
    id v22 = [v21 engineLibrary];
    [v22 notifyAttachedObjectsHasStatusChanges];
  }
}

uint64_t __51__CPLEngineStatusCenter_writeTransactionDidSucceed__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 date];
  id v6 = [v4 date];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)writeTransactionDidFail
{
  v4.receiver = self;
  v4.super_class = (Class)CPLEngineStatusCenter;
  [(CPLEngineStorage *)&v4 writeTransactionDidFail];
  [(NSMutableSet *)self->_persistedScopedIdentifiers removeAllObjects];
  [(NSMutableDictionary *)self->_pendingTransientStatuses removeAllObjects];
  [(NSMutableSet *)self->_pendingDeletedTransientStatuses removeAllObjects];
  self->_currentGeneration = 0;
  transactionStartDate = self->_transactionStartDate;
  self->_transactionStartDate = 0;
}

- (BOOL)discardNotificationForRecordWithScopedIdentifier:(id)a3 error:(id *)a4
{
  persistedScopedIdentifiers = self->_persistedScopedIdentifiers;
  id v7 = a3;
  [(NSMutableSet *)persistedScopedIdentifiers removeObject:v7];
  [(NSMutableDictionary *)self->_pendingTransientStatuses removeObjectForKey:v7];
  [(NSMutableSet *)self->_pendingDeletedTransientStatuses addObject:v7];
  BOOL v8 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a4) = [v8 discardNotificationForRecordWithScopedIdentifier:v7 error:a4];

  return (char)a4;
}

- (BOOL)acknowledgeChangedStatuses:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        BOOL v10 = [v9 record];
        uint64_t v11 = [v10 scopedIdentifier];

        uint64_t v12 = [(NSMutableDictionary *)self->_transientStatuses objectForKeyedSubscript:v11];
        id v13 = [(NSMutableDictionary *)self->_pendingTransientStatuses objectForKeyedSubscript:v11];
        uint64_t v14 = v13;
        if (v13)
        {
          unint64_t v15 = [v13 generation];
          if (v15 <= [v9 generation])
          {
            [(NSMutableDictionary *)self->_pendingTransientStatuses removeObjectForKey:v11];

            uint64_t v14 = 0;
          }
        }
        if (v12)
        {
          unint64_t v16 = [v12 generation];
          unint64_t v17 = [v9 generation];
          if (!v14 && v16 <= v17) {
            [(NSMutableSet *)self->_pendingDeletedTransientStatuses addObject:v11];
          }
        }
        char v24 = 0;
        unsigned __int8 v18 = [(CPLEngineStorage *)self platformObject];
        int v19 = [v18 acknowledgeChangedStatus:v9 hasBeenDeleted:&v24 error:a4];

        if (!v19)
        {

          BOOL v20 = 0;
          goto LABEL_20;
        }
        if (v24) {
          [(NSMutableSet *)self->_persistedScopedIdentifiers removeObject:v11];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v20 = 1;
LABEL_20:

  return v20;
}

- (id)statusesForRecordsWithIdentifiers:(id)a3
{
  objc_super v4 = +[CPLScopedIdentifier scopedIdentifiersFromArrayOfUnknownIdentifiers:a3];
  uint64_t v5 = [(CPLEngineStatusCenter *)self statusesForRecordsWithScopedIdentifiers:v4];
  uint64_t v6 = +[CPLScopedIdentifier unscopedIdentifiersFromDictionaryOfScopedIdentifiers:v5];

  return v6;
}

- (id)statusesForRecordsWithScopedIdentifiers:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        uint64_t v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingTransientStatuses, "objectForKeyedSubscript:", v11, (void)v17);
        if (v12
          || ([(NSMutableDictionary *)self->_transientStatuses objectForKeyedSubscript:v11],
              (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v13 = [v12 status];
        }
        else
        {
          uint64_t v12 = [(CPLEngineStorage *)self platformObject];
          uint64_t v13 = [v12 statusForRecordWithScopedIdentifier:v11];
        }
        uint64_t v14 = (void *)v13;

        if (v14)
        {
          [(CPLEngineStatusCenter *)self _fillStatus:v14];
        }
        else
        {
          uint64_t v14 = [(CPLEngineStatusCenter *)self _statusFromCachesWithRecordScopedIdentifier:v11];
        }
        [v5 setObject:v14 forKeyedSubscript:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v15 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v8 = v15;
    }
    while (v15);
  }

  return v5;
}

- (void)resetAllTransientStatuses
{
  [(NSMutableSet *)self->_persistedScopedIdentifiers removeAllObjects];
  [(NSMutableDictionary *)self->_pendingTransientStatuses removeAllObjects];
  [(NSMutableSet *)self->_pendingDeletedTransientStatuses removeAllObjects];
  transientStatuses = self->_transientStatuses;
  [(NSMutableDictionary *)transientStatuses removeAllObjects];
}

- (void)resetTransientStatusesWithScopeIdentifier:(id)a3
{
  transientStatuses = self->_transientStatuses;
  id v5 = a3;
  [(CPLEngineStatusCenter *)self _removeStatusesInDictionary:transientStatuses withScopeIdentifier:v5];
  [(CPLEngineStatusCenter *)self _removeStatusesInDictionary:self->_pendingTransientStatuses withScopeIdentifier:v5];
  [(CPLEngineStatusCenter *)self _removeScopedIdentifiersFromSet:self->_persistedScopedIdentifiers withScopeIdentifier:v5];
  [(CPLEngineStatusCenter *)self _removeScopedIdentifiersFromSet:self->_pendingDeletedTransientStatuses withScopeIdentifier:v5];
}

- (void)_removeScopedIdentifiersFromSet:(id)a3 withScopeIdentifier:(id)a4
{
  id v6 = a3;
  id v5 = -[CPLEngineStatusCenter _allScopedIdentifierInCollection:withScopeIdentifier:](self, "_allScopedIdentifierInCollection:withScopeIdentifier:");
  if (v5) {
    [v6 minusSet:v5];
  }
}

- (void)_removeStatusesInDictionary:(id)a3 withScopeIdentifier:(id)a4
{
  id v6 = a3;
  id v8 = [(CPLEngineStatusCenter *)self _allScopedIdentifierInCollection:v6 withScopeIdentifier:a4];
  uint64_t v7 = [v8 allObjects];
  [v6 removeObjectsForKeys:v7];
}

- (id)_allScopedIdentifierInCollection:(id)a3 withScopeIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = [v12 scopeIdentifier];
        int v14 = [v13 isEqualToString:v6];

        if (v14)
        {
          if (!v9) {
            id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          }
          [v9 addObject:v12];
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)statusChanges
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_transientStatuses count]
    || [(NSMutableSet *)self->_pendingDeletedTransientStatuses count])
  {
    uint64_t v3 = [(NSMutableSet *)self->_pendingDeletedTransientStatuses count];
    transientStatuses = self->_transientStatuses;
    if (v3)
    {
      id v5 = (NSMutableDictionary *)[(NSMutableDictionary *)transientStatuses mutableCopy];
      [(NSMutableDictionary *)v5 addEntriesFromDictionary:self->_pendingTransientStatuses];
    }
    else
    {
      id v5 = transientStatuses;
    }
    unint64_t v6 = [(NSMutableDictionary *)self->_transientStatuses count];
    if (v6 >= 0x3E8) {
      uint64_t v7 = 1000;
    }
    else {
      uint64_t v7 = v6;
    }
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = 0;
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __38__CPLEngineStatusCenter_statusChanges__block_invoke;
    v23[3] = &unk_1E60AA700;
    v23[4] = self;
    id v9 = v8;
    id v24 = v9;
    long long v25 = v27;
    uint64_t v26 = v7;
    [(NSMutableDictionary *)v5 enumerateKeysAndObjectsUsingBlock:v23];
    uint64_t v10 = [v9 count];
    id v11 = v24;
    if (v10)
    {
      uint64_t v12 = (NSMutableDictionary *)v9;

      _Block_object_dispose(v27, 8);
      goto LABEL_20;
    }

    _Block_object_dispose(v27, 8);
  }
  uint64_t v13 = [(CPLEngineStorage *)self platformObject];
  int v14 = [v13 statusChangesMaximumCount:1000];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v14;
  uint64_t v15 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v19 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v5);
        }
        -[CPLEngineStatusCenter _fillStatus:](self, "_fillStatus:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
      }
      uint64_t v15 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v19 objects:v28 count:16];
    }
    while (v15);
  }
  uint64_t v12 = v5;
LABEL_20:

  return v12;
}

void __38__CPLEngineStatusCenter_statusChanges__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  unint64_t v6 = [v9 record];
  uint64_t v7 = [v6 scopedIdentifier];

  if (([*(id *)(*(void *)(a1 + 32) + 72) containsObject:v7] & 1) == 0)
  {
    uint64_t v8 = [v9 status];
    [*(id *)(a1 + 32) _fillStatus:v8];
    [*(id *)(a1 + 40) addObject:v8];
    if (++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(a1 + 56)) {
      *a4 = 1;
    }
  }
}

- (BOOL)notifyStatusForRecordWithScopedIdentifierHasChanged:(id)a3 recordClass:(Class)a4 persist:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  if (!self->_transactionStartDate)
  {
    id v11 = [(CPLEngineStorage *)self platformObject];
    int v12 = [v11 getNewGeneration:&self->_currentGeneration error:a6];

    if (!v12)
    {
      char v18 = 0;
      goto LABEL_17;
    }
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    transactionStartDate = self->_transactionStartDate;
    self->_transactionStartDate = v13;
  }
  if (([(NSMutableSet *)self->_persistedScopedIdentifiers containsObject:v10] & 1) == 0)
  {
    uint64_t v15 = [(NSMutableDictionary *)self->_pendingTransientStatuses objectForKeyedSubscript:v10];
    uint64_t v16 = v15;
    if (a5)
    {
      if (v15)
      {
        long long v17 = [(_CPLTransientStatus *)v15 status];
        [(NSMutableDictionary *)self->_pendingTransientStatuses removeObjectForKey:v10];
      }
      else
      {
        long long v19 = (void *)[(objc_class *)a4 newRecordWithScopedIdentifier:v10];
        long long v17 = [[CPLRecordStatus alloc] initWithRecord:v19 generation:self->_currentGeneration];
      }
      long long v20 = [(NSMutableDictionary *)self->_transientStatuses objectForKeyedSubscript:v10];

      if (v20) {
        [(NSMutableSet *)self->_pendingDeletedTransientStatuses addObject:v10];
      }
      [(NSMutableSet *)self->_persistedScopedIdentifiers addObject:v10];
      long long v21 = [(CPLEngineStorage *)self platformObject];
      char v18 = [v21 addStatus:v17 error:a6];

      goto LABEL_16;
    }

    if (!v16)
    {
      [(NSMutableSet *)self->_pendingDeletedTransientStatuses removeObject:v10];
      long long v17 = (CPLRecordStatus *)[(objc_class *)a4 newRecordWithScopedIdentifier:v10];
      uint64_t v16 = [[_CPLTransientStatus alloc] initWithRecord:v17 generation:self->_currentGeneration date:self->_transactionStartDate];
      [(NSMutableDictionary *)self->_pendingTransientStatuses setObject:v16 forKeyedSubscript:v10];
      char v18 = 1;
LABEL_16:

      goto LABEL_17;
    }
  }
  char v18 = 1;
LABEL_17:

  return v18;
}

- (BOOL)notifyStatusForRecordViewHasChanged:(id)a3 persist:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [v8 scopedIdentifier];
  uint64_t v10 = [v8 recordClass];

  LOBYTE(a5) = [(CPLEngineStatusCenter *)self notifyStatusForRecordWithScopedIdentifierHasChanged:v9 recordClass:v10 persist:v6 error:a5];
  return (char)a5;
}

- (BOOL)notifyStatusForRecordHasChanged:(id)a3 persist:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [v8 scopedIdentifier];
  uint64_t v10 = objc_opt_class();

  LOBYTE(a5) = [(CPLEngineStatusCenter *)self notifyStatusForRecordWithScopedIdentifierHasChanged:v9 recordClass:v10 persist:v6 error:a5];
  return (char)a5;
}

- (BOOL)hasStatusChanges
{
  if ([(NSMutableDictionary *)self->_transientStatuses count]) {
    return 1;
  }
  id v4 = [(CPLEngineStorage *)self platformObject];
  char v5 = [v4 hasStatusChanges];

  return v5;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  [(NSMutableSet *)self->_persistedScopedIdentifiers removeAllObjects];
  [(NSMutableDictionary *)self->_pendingTransientStatuses removeAllObjects];
  [(NSMutableSet *)self->_pendingDeletedTransientStatuses removeAllObjects];
  self->_currentGeneration = 0;
  transactionStartDate = self->_transactionStartDate;
  self->_transactionStartDate = 0;

  int v12 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a6) = [v12 deleteRecordsForScopeIndex:a3 maxCount:a4 deletedCount:a5 error:a6];

  return (char)a6;
}

- (unint64_t)scopeType
{
  return 1;
}

- (CPLEngineStatusCenter)initWithEngineStore:(id)a3 name:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)CPLEngineStatusCenter;
  id v4 = [(CPLEngineStorage *)&v14 initWithEngineStore:a3 name:a4];
  if (v4)
  {
    char v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    persistedScopedIdentifiers = v4->_persistedScopedIdentifiers;
    v4->_persistedScopedIdentifiers = v5;

    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingTransientStatuses = v4->_pendingTransientStatuses;
    v4->_pendingTransientStatuses = v7;

    id v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pendingDeletedTransientStatuses = v4->_pendingDeletedTransientStatuses;
    v4->_pendingDeletedTransientStatuses = v9;

    id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    transientStatuses = v4->_transientStatuses;
    v4->_transientStatuses = v11;
  }
  return v4;
}

@end