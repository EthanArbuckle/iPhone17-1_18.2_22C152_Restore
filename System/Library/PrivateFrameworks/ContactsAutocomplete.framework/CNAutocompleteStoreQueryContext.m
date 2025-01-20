@interface CNAutocompleteStoreQueryContext
+ (id)cacheBoundaryStrategies;
- (CNAutocompleteStoreQueryContext)init;
- (CNCache)calendarServerReuseCache;
- (CNCache)directoryServerReuseCache;
@end

@implementation CNAutocompleteStoreQueryContext

- (CNAutocompleteStoreQueryContext)init
{
  v15.receiver = self;
  v15.super_class = (Class)CNAutocompleteStoreQueryContext;
  v2 = [(CNAutocompleteStoreQueryContext *)&v15 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F5A360]);
    v4 = [(id)objc_opt_class() cacheBoundaryStrategies];
    v5 = [MEMORY[0x1E4F5A360] atomicCacheScheduler];
    uint64_t v6 = [v3 initWithBoundingStrategies:v4 resourceScheduler:v5];
    directoryServerReuseCache = v2->_directoryServerReuseCache;
    v2->_directoryServerReuseCache = (CNCache *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4F5A360]);
    v9 = [(id)objc_opt_class() cacheBoundaryStrategies];
    v10 = [MEMORY[0x1E4F5A360] atomicCacheScheduler];
    uint64_t v11 = [v8 initWithBoundingStrategies:v9 resourceScheduler:v10];
    calendarServerReuseCache = v2->_calendarServerReuseCache;
    v2->_calendarServerReuseCache = (CNCache *)v11;

    v13 = v2;
  }

  return v2;
}

+ (id)cacheBoundaryStrategies
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F5A360] boundingStrategyWithTTL:3600.0];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F5A360] boundingStrategyWithCapacity:100];
  v6[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (CNCache)directoryServerReuseCache
{
  return (CNCache *)objc_getProperty(self, a2, 8, 1);
}

- (CNCache)calendarServerReuseCache
{
  return (CNCache *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarServerReuseCache, 0);
  objc_storeStrong((id *)&self->_directoryServerReuseCache, 0);
}

@end