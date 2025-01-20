@interface CPLChangeBatchChangeStorage
- (CPLChangeBatch)batch;
- (CPLChangeBatchChangeStorage)initWithBatch:(id)a3 name:(id)a4;
- (id)changeWithScopedIdentifier:(id)a3;
- (id)changesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (id)storageDescription;
@end

@implementation CPLChangeBatchChangeStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batch, 0);
  objc_storeStrong((id *)&self->_storageDescription, 0);
  objc_storeStrong((id *)&self->_changesPerScopedIdentifier, 0);
}

- (CPLChangeBatch)batch
{
  return self->_batch;
}

- (id)storageDescription
{
  return self->_storageDescription;
}

- (id)changesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v6 = self->_batch;
  uint64_t v7 = [(CPLChangeBatch *)v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v26 = 0;
    uint64_t v9 = *(void *)v28;
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          v12 = [v11 relatedIdentifier];
          v13 = [v5 identifier];
          int v14 = [v12 isEqualToString:v13];

          if (v14)
          {
            v15 = v6;
            v16 = [v11 scopedIdentifier];
            v17 = [v16 scopeIdentifier];

            id v18 = v5;
            v19 = [v5 scopeIdentifier];
            int v20 = [v17 isEqualToString:v19];

            if (v20) {
              BOOL v21 = v26 == 0;
            }
            else {
              BOOL v21 = 0;
            }
            if (v21)
            {
              id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              v23 = (void *)[v11 copy];
              id v26 = v22;
              [v22 addObject:v23];
            }
            v6 = v15;
            id v5 = v18;
            uint64_t v9 = v25;
          }
        }
      }
      uint64_t v8 = [(CPLChangeBatch *)v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

- (id)changeWithScopedIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  changesPerScopedIdentifier = self->_changesPerScopedIdentifier;
  if (!changesPerScopedIdentifier)
  {
    v6 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[CPLChangeBatch count](self->_batch, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = self->_batch;
    uint64_t v8 = [(CPLChangeBatch *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "scopedIdentifier", (void)v18);
          [(NSDictionary *)v6 setObject:v12 forKeyedSubscript:v13];
        }
        uint64_t v9 = [(CPLChangeBatch *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    int v14 = self->_changesPerScopedIdentifier;
    self->_changesPerScopedIdentifier = v6;

    changesPerScopedIdentifier = self->_changesPerScopedIdentifier;
  }
  v15 = -[NSDictionary objectForKeyedSubscript:](changesPerScopedIdentifier, "objectForKeyedSubscript:", v4, (void)v18);
  v16 = (void *)[v15 copy];

  return v16;
}

- (CPLChangeBatchChangeStorage)initWithBatch:(id)a3 name:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    if (!_CPLSilentLogging)
    {
      int v14 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Trying to create a batch change storage without a batch", buf, 2u);
      }
    }
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLChangeBatchChangeStorage.m"];
    [v15 handleFailureInMethod:a2 object:self file:v16 lineNumber:20 description:@"Trying to create a batch change storage without a batch"];

    abort();
  }
  uint64_t v10 = v9;
  v17.receiver = self;
  v17.super_class = (Class)CPLChangeBatchChangeStorage;
  v11 = [(CPLChangeBatchChangeStorage *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_batch, a3);
    objc_storeStrong((id *)&v12->_storageDescription, a4);
  }

  return v12;
}

@end