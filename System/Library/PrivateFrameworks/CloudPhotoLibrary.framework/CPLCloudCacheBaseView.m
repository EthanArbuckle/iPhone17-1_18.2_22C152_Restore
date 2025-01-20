@interface CPLCloudCacheBaseView
- (BOOL)useFinal;
- (CPLCloudCacheBaseView)initWithCloudCache:(id)a3 useFinal:(BOOL)a4;
- (CPLEngineCloudCache)cloudCache;
- (id)description;
- (id)recordViewWithScopedIdentifier:(id)a3;
- (id)recordViewsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (id)redactedDescription;
@end

@implementation CPLCloudCacheBaseView

- (void).cxx_destruct
{
}

- (BOOL)useFinal
{
  return self->_useFinal;
}

- (CPLEngineCloudCache)cloudCache
{
  return self->_cloudCache;
}

- (id)redactedDescription
{
  return @"cloudCache";
}

- (id)description
{
  return @"cloudCache";
}

- (id)recordViewsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v7 = -[CPLEngineCloudCache recordsWithRelatedScopedIdentifier:class:isFinal:](self->_cloudCache, "recordsWithRelatedScopedIdentifier:class:isFinal:", v6, a4, self->_useFinal, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (!v10) {
          id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        v14 = [v13 asRecordView];
        [v10 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)recordViewWithScopedIdentifier:(id)a3
{
  v3 = [(CPLEngineCloudCache *)self->_cloudCache recordWithScopedIdentifier:a3 isFinal:self->_useFinal];
  v4 = [v3 asRecordView];

  return v4;
}

- (CPLCloudCacheBaseView)initWithCloudCache:(id)a3 useFinal:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLCloudCacheBaseView;
  uint64_t v8 = [(CPLCloudCacheBaseView *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_cloudCache, a3);
    v9->_useFinal = a4;
  }

  return v9;
}

@end