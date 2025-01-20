@interface CPLClientCacheBaseView
+ (id)clientCacheBaseViewIDMappingForStore:(id)a3;
- (BOOL)hasRecordWithScopedIdentifier:(id)a3;
- (CPLClientCacheBaseView)initWithStore:(id)a3;
- (CPLEngineCloudCache)cloudCache;
- (CPLEngineIDMapping)idMapping;
- (CPLEngineStore)store;
- (id)description;
- (id)recordViewWithScopedIdentifier:(id)a3;
- (id)recordViewsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (id)redactedDescription;
- (id)relatedScopedIdentifierForRecordWithScopedIdentifier:(id)a3;
- (unint64_t)countOfRecordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
@end

@implementation CPLClientCacheBaseView

- (unint64_t)countOfRecordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6 = a3;
  v7 = [(CPLClientCacheBaseView *)self idMapping];
  char v12 = 0;
  v8 = [v7 cloudScopedIdentifierForLocalScopedIdentifier:v6 isFinal:&v12];

  if (v8)
  {
    v9 = [(CPLClientCacheBaseView *)self cloudCache];
    unint64_t v10 = [v9 countOfRecordsAcknowledgedByClientWithRelatedScopedIdentifier:v8 class:a4];
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)hasRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLClientCacheBaseView *)self idMapping];
  char v10 = 0;
  id v6 = [v5 cloudScopedIdentifierForLocalScopedIdentifier:v4 isFinal:&v10];

  if (v6)
  {
    v7 = [(CPLClientCacheBaseView *)self cloudCache];
    char v8 = [v7 hasRecordAcknowledgedByClientWithScopedIdentifier:v6];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)relatedScopedIdentifierForRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLClientCacheBaseView *)self idMapping];
  char v11 = 0;
  id v6 = [v5 cloudScopedIdentifierForLocalScopedIdentifier:v4 isFinal:&v11];

  if (v6
    && ([(CPLClientCacheBaseView *)self cloudCache],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 relatedScopedIdentifierForRecordWithScopedIdentifier:v6 isFinal:1],
        char v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    v9 = [v5 localScopedIdentifierForCloudScopedIdentifier:v8 isFinal:&v11];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idMapping, 0);
  objc_storeStrong((id *)&self->_cloudCache, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (CPLEngineIDMapping)idMapping
{
  return self->_idMapping;
}

- (CPLEngineCloudCache)cloudCache
{
  return self->_cloudCache;
}

- (CPLEngineStore)store
{
  return self->_store;
}

- (id)recordViewsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v23 = 0;
  uint64_t v7 = [(CPLEngineIDMapping *)self->_idMapping cloudScopedIdentifierForLocalScopedIdentifier:v6 isFinal:&v23];
  char v8 = (void *)v7;
  if (v7)
  {
    v18 = (void *)v7;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v9 = [(CPLEngineCloudCache *)self->_cloudCache recordsAcknowledgedByClientWithRelatedScopedIdentifier:v7 class:a4];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = 0;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          if (!v12) {
            id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          v16 = [[CPLClientCacheRecordView alloc] initWithLocalScopedIdentifier:0 cloudRecord:v15 idMapping:self->_idMapping];
          [v12 addObject:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v11);
    }
    else
    {
      id v12 = 0;
    }

    char v8 = v18;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)recordViewWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  char v10 = 0;
  v5 = [(CPLEngineIDMapping *)self->_idMapping cloudScopedIdentifierForLocalScopedIdentifier:v4 isFinal:&v10];
  if (v5
    && ([(CPLEngineCloudCache *)self->_cloudCache recordAcknowledgedByClientWithScopedIdentifier:v5], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v7 = (void *)v6;
    char v8 = [[CPLClientCacheRecordView alloc] initWithLocalScopedIdentifier:v4 cloudRecord:v6 idMapping:self->_idMapping];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)redactedDescription
{
  return @"baseClientCache";
}

- (id)description
{
  return @"baseClientCache";
}

- (CPLClientCacheBaseView)initWithStore:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLClientCacheBaseView;
  uint64_t v6 = [(CPLClientCacheBaseView *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    uint64_t v8 = [v5 cloudCache];
    cloudCache = v7->_cloudCache;
    v7->_cloudCache = (CPLEngineCloudCache *)v8;

    uint64_t v10 = [(id)objc_opt_class() clientCacheBaseViewIDMappingForStore:v5];
    idMapping = v7->_idMapping;
    v7->_idMapping = (CPLEngineIDMapping *)v10;
  }
  return v7;
}

+ (id)clientCacheBaseViewIDMappingForStore:(id)a3
{
  id v3 = a3;
  id v4 = [_CPLOptimisticIDMapping alloc];
  id v5 = [v3 idMapping];

  uint64_t v6 = [(_CPLOptimisticIDMapping *)v4 initWithIDMapping:v5];
  return v6;
}

@end