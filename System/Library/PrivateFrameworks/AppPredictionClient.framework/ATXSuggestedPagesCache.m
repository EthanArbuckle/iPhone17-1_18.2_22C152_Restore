@interface ATXSuggestedPagesCache
- (ATXSuggestedPagesCache)init;
- (ATXSuggestedPagesCache)initWithPath:(id)a3;
- (id)_cacheForPageType:(int64_t)a3;
- (id)cachedSuggestedPagesForPageType:(int64_t)a3;
- (void)cacheSuggestedPages:(id)a3 forPageType:(int64_t)a4;
- (void)evictCachedSuggestedPages;
- (void)printCachedSuggestedPagesStats;
@end

@implementation ATXSuggestedPagesCache

- (ATXSuggestedPagesCache)init
{
  v3 = [MEMORY[0x1E4F4B650] appPredictionCacheDirectory];
  v4 = [(ATXSuggestedPagesCache *)self initWithPath:v3];

  return v4;
}

- (ATXSuggestedPagesCache)initWithPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSuggestedPagesCache;
  v5 = [(ATXSuggestedPagesCache *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    basePath = v5->_basePath;
    v5->_basePath = (NSString *)v6;
  }
  return v5;
}

- (id)cachedSuggestedPagesForPageType:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 >= 4)
  {
    id v4 = -[ATXSuggestedPagesCache _cacheForPageType:](self, "_cacheForPageType:");
    v5 = (void *)MEMORY[0x1AD0D3C30]();
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_super v9 = [v4 readSecureCodedObjectWithMaxValidAge:v8 allowableClasses:0 error:432000.0];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v3 = v9;
    uint64_t v10 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v3);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v15 = [v14 leafIcons];
          v16 = objc_msgSend(v15, "_pas_filteredArrayWithTest:", &__block_literal_global_38);
          [v14 setLeafIcons:v16];
        }
        uint64_t v11 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

BOOL __58__ATXSuggestedPagesCache_cachedSuggestedPagesForPageType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 bundleId];
    BOOL v4 = +[ATXApplicationRecord isInstalledAndNotRestrictedForBundle:v3];
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)evictCachedSuggestedPages
{
  for (uint64_t i = 4; i != 12; ++i)
  {
    BOOL v4 = [(ATXSuggestedPagesCache *)self _cacheForPageType:i];
    [v4 evict];
  }
}

- (void)cacheSuggestedPages:(id)a3 forPageType:(int64_t)a4
{
  id v8 = a3;
  if ([v8 count])
  {
    id v6 = [(ATXSuggestedPagesCache *)self _cacheForPageType:a4];
    uint64_t v7 = (void *)[v8 copy];
    [v6 storeSecureCodedObject:v7 error:0];
  }
}

- (id)_cacheForPageType:(int64_t)a3
{
  basePath = self->_basePath;
  BOOL v4 = NSString;
  v5 = NSStringFromATXSuggestedPageType(a3);
  id v6 = [v4 stringWithFormat:@"SuggestedPage-%@", v5];
  uint64_t v7 = [(NSString *)basePath stringByAppendingPathComponent:v6];

  id v8 = objc_alloc(MEMORY[0x1E4F4B638]);
  objc_super v9 = __atxlog_handle_modes();
  uint64_t v10 = (void *)[v8 initWithCacheFilePath:v7 loggingHandle:v9 debugName:@"suggested pages"];

  return v10;
}

- (void)printCachedSuggestedPagesStats
{
  for (unint64_t i = 4; i != 12; ++i)
  {
    BOOL v4 = NSStringFromATXSuggestedPageType(i);
    v5 = [(ATXSuggestedPagesCache *)self _cacheForPageType:i];
    id v6 = (void *)MEMORY[0x1AD0D3C30]();
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v8 = objc_opt_class();
    objc_super v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v5 readSecureCodedObjectWithMaxValidAge:v9 allowableClasses:0 error:3.40282347e38];

    if ([v10 count])
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F4B650];
      uint64_t v12 = [v5 cacheFilePath];
      v13 = [v11 modificationDateOfFileAtPath:v12];

      NSLog(&cfstr_LdCachedPagesL.isa, v4, [v10 count], v13);
    }
    else
    {
      NSLog(&cfstr_NoCachedPages.isa, v4);
    }
  }
}

- (void).cxx_destruct
{
}

@end