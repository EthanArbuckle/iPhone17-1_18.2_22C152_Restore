@interface CPLEngineRemappedRecords
- (BOOL)addRemappedRecordWithScopedIdentifier:(id)a3 realScopedIdentifier:(id)a4 error:(id *)a5;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)isRecordWithScopedIdentifierRemapped:(id)a3;
- (BOOL)removeRemappedRecordWithScopedIdentifier:(id)a3 error:(id *)a4;
- (id)_fixupRemappedRecordsAndReturnBestCloudScopedIdentifierFromRemappedScopedIdentifiers:(id)a3 fallback:(id)a4;
- (id)realScopedIdentifierForRemappedScopedIdentifier:(id)a3;
- (id)scopedIdentifiersRemappedToScopedIdentifier:(id)a3;
- (unint64_t)scopeType;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLEngineRemappedRecords

- (void).cxx_destruct
{
}

- (void)writeTransactionDidSucceed
{
  v4.receiver = self;
  v4.super_class = (Class)CPLEngineRemappedRecords;
  [(CPLEngineStorage *)&v4 writeTransactionDidSucceed];
  perTransactionRemappedScopedIdentifiers = self->_perTransactionRemappedScopedIdentifiers;
  self->_perTransactionRemappedScopedIdentifiers = 0;
}

- (void)writeTransactionDidFail
{
  v4.receiver = self;
  v4.super_class = (Class)CPLEngineRemappedRecords;
  [(CPLEngineStorage *)&v4 writeTransactionDidFail];
  perTransactionRemappedScopedIdentifiers = self->_perTransactionRemappedScopedIdentifiers;
  self->_perTransactionRemappedScopedIdentifiers = 0;
}

- (BOOL)isRecordWithScopedIdentifierRemapped:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 isRecordWithScopedIdentifierRemapped:v4];

  return v6;
}

- (id)scopedIdentifiersRemappedToScopedIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 scopedIdentifiersRemappedToScopedIdentifier:v4];

  return v6;
}

- (id)realScopedIdentifierForRemappedScopedIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_perTransactionRemappedScopedIdentifiers objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = v4;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v8 = [(CPLEngineStorage *)self platformObject];
    id v9 = v6;
    id v10 = v9;
    if ([v7 containsObject:v9])
    {
LABEL_7:
      if (!_CPLSilentLogging)
      {
        v12 = __CPLStorageOSLogDomain_10610();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v27 = v7;
          _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "Infinite remaps: %@", buf, 0xCu);
        }
      }
      v5 = [(CPLEngineRemappedRecords *)self _fixupRemappedRecordsAndReturnBestCloudScopedIdentifierFromRemappedScopedIdentifiers:v7 fallback:v9];
    }
    else
    {
      v5 = v9;
      while (1)
      {
        v11 = [(NSMutableDictionary *)self->_perTransactionRemappedScopedIdentifiers objectForKeyedSubscript:v5];
        if (!v11)
        {
          v11 = [v8 realScopedIdentifierForRemappedScopedIdentifier:v5];
          if (!v11) {
            break;
          }
        }
        [v7 addObject:v5];
        id v10 = v11;

        v5 = v10;
        if ([v7 containsObject:v10]) {
          goto LABEL_7;
        }
      }
      id v10 = v5;
    }
    if (!self->_perTransactionRemappedScopedIdentifiers)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      perTransactionRemappedScopedIdentifiers = self->_perTransactionRemappedScopedIdentifiers;
      self->_perTransactionRemappedScopedIdentifiers = v13;
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = v7;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_perTransactionRemappedScopedIdentifiers, "setObject:forKeyedSubscript:", v5, *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v17);
    }
  }
  return v5;
}

- (id)_fixupRemappedRecordsAndReturnBestCloudScopedIdentifierFromRemappedScopedIdentifiers:(id)a3 fallback:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(CPLEngineStorage *)self engineStore];
  id v9 = [v8 idMapping];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
  id v12 = v7;
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        char v28 = 0;
        uint64_t v17 = [v9 localScopedIdentifierForCloudScopedIdentifier:v16 isFinal:&v28];
        if (v17)
        {
          uint64_t v18 = (void *)v17;
          id v12 = v16;

          v19 = (void *)[v12 copy];
          v20 = [(CPLEngineStorage *)self engineStore];
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __122__CPLEngineRemappedRecords__fixupRemappedRecordsAndReturnBestCloudScopedIdentifierFromRemappedScopedIdentifiers_fallback___block_invoke;
          v26[3] = &unk_1E60AB550;
          v26[4] = self;
          id v27 = v19;
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __122__CPLEngineRemappedRecords__fixupRemappedRecordsAndReturnBestCloudScopedIdentifierFromRemappedScopedIdentifiers_fallback___block_invoke_3;
          v24[3] = &unk_1E60AB578;
          id v25 = v27;
          id v21 = v27;
          id v22 = (id)[v20 performWriteTransactionWithBlock:v26 completionHandler:v24];

          goto LABEL_11;
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v13) {
        continue;
      }
      break;
    }
    id v12 = v7;
  }
LABEL_11:

  return v12;
}

void __122__CPLEngineRemappedRecords__fixupRemappedRecordsAndReturnBestCloudScopedIdentifierFromRemappedScopedIdentifiers_fallback___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __122__CPLEngineRemappedRecords__fixupRemappedRecordsAndReturnBestCloudScopedIdentifierFromRemappedScopedIdentifiers_fallback___block_invoke_2;
  v4[3] = &unk_1E60AB750;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 do:v4];
}

void __122__CPLEngineRemappedRecords__fixupRemappedRecordsAndReturnBestCloudScopedIdentifierFromRemappedScopedIdentifiers_fallback___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  if (v4 && !_CPLSilentLogging)
  {
    id v5 = __CPLStorageOSLogDomain_10610();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = [v3 error];
      int v8 = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Failed to fixup infinite loop for remapped identifiers related to %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

uint64_t __122__CPLEngineRemappedRecords__fixupRemappedRecordsAndReturnBestCloudScopedIdentifierFromRemappedScopedIdentifiers_fallback___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) platformObject];
  uint64_t v5 = [v4 removeRemappedRecordWithScopedIdentifier:*(void *)(a1 + 40) error:a2];

  return v5;
}

- (BOOL)removeRemappedRecordWithScopedIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(CPLEngineStorage *)self platformObject];
  id v13 = 0;
  char v8 = [v7 removeRemappedRecordWithScopedIdentifier:v6 error:&v13];
  id v9 = v13;

  if (v8)
  {
    perTransactionRemappedScopedIdentifiers = self->_perTransactionRemappedScopedIdentifiers;
    self->_perTransactionRemappedScopedIdentifiers = 0;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v11 = __CPLStorageOSLogDomain_10610();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v6;
        __int16 v16 = 2112;
        id v17 = v9;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "Failed to discard remapped record %@: %@ - ignoring", buf, 0x16u);
      }
    }
    if (a4) {
      *a4 = v9;
    }
  }

  return v8;
}

- (BOOL)addRemappedRecordWithScopedIdentifier:(id)a3 realScopedIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = [(CPLEngineStorage *)self platformObject];
  id v15 = 0;
  char v11 = [v10 addRemappedRecordWithScopedIdentifier:v8 realScopedIdentifier:v9 error:&v15];
  id v12 = v15;

  if (v11)
  {
    [(NSMutableDictionary *)self->_perTransactionRemappedScopedIdentifiers removeObjectForKey:v8];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v13 = __CPLStorageOSLogDomain_10610();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v17 = v8;
        __int16 v18 = 2112;
        id v19 = v9;
        __int16 v20 = 2112;
        id v21 = v12;
        _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_ERROR, "Failed to remapped record %@ -> %@: %@ - ignoring", buf, 0x20u);
      }
    }
    if (a5) {
      *a5 = v12;
    }
  }

  return v11;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  __int16 v10 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a6) = [v10 deleteRecordsForScopeIndex:a3 maxCount:a4 deletedCount:a5 error:a6];

  return (char)a6;
}

- (unint64_t)scopeType
{
  return 2;
}

@end