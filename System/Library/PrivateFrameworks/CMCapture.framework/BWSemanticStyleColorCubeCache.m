@interface BWSemanticStyleColorCubeCache
+ (void)initialize;
- (BWSemanticStyleColorCubeCache)initWithColorLookupCache:(id)a3;
- (id)filtersForSemanticStyle:(id)a3 sceneType:(int)a4 personSegmentationEnabled:(BOOL)a5 maskVisualizationEnabled:(BOOL)a6 applyStyleBackgroundToEntireFrame:(BOOL)a7 filtersToCombine:(id)a8;
- (void)dealloc;
@end

@implementation BWSemanticStyleColorCubeCache

- (BWSemanticStyleColorCubeCache)initWithColorLookupCache:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWSemanticStyleColorCubeCache;
  v4 = [(BWSemanticStyleColorCubeCache *)&v6 init];
  if (v4)
  {
    v4->_cubeFilterCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_recentFilterCacheKeys = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_filterCacheLock._os_unfair_lock_opaque = 0;
    v4->_cachingEnabled = 1;
    v4->_colorLookupCache = (BWColorLookupCache *)a3;
    v4->_cacheMaxSize = 10;
  }
  return v4;
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWSemanticStyleColorCubeCache;
  [(BWSemanticStyleColorCubeCache *)&v3 dealloc];
}

- (id)filtersForSemanticStyle:(id)a3 sceneType:(int)a4 personSegmentationEnabled:(BOOL)a5 maskVisualizationEnabled:(BOOL)a6 applyStyleBackgroundToEntireFrame:(BOOL)a7 filtersToCombine:(id)a8
{
  BOOL v32 = a6;
  BOOL v33 = a7;
  BOOL v30 = a5;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v11 = (void *)[MEMORY[0x1E4F28E78] string];
  [v11 appendString:@"{"];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v12 = [a8 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v35;
    char v15 = 1;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(a8);
        }
        v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ((v15 & 1) == 0) {
          [v11 appendString:@","];
        }
        objc_msgSend(v11, "appendString:", objc_msgSend(v17, "name"));
        char v15 = 0;
      }
      uint64_t v13 = [a8 countByEnumeratingWithState:&v34 objects:v38 count:16];
      char v15 = 0;
    }
    while (v13);
  }
  [v11 appendString:@"}"];
  v18 = NSString;
  if (a4 > 3) {
    v19 = @"semanticStyleSceneType-unknown";
  }
  else {
    v19 = off_1E5C247A0[a4];
  }
  if (v32 || v33)
  {
    if (v32) {
      v20 = @"-mask-visualization";
    }
    else {
      v20 = @"-forced-to-background";
    }
    v19 = (__CFString *)[(__CFString *)v19 stringByAppendingString:v20];
  }
  [a3 toneBias];
  double v22 = v21;
  [a3 warmthBias];
  uint64_t v24 = [v18 stringWithFormat:@"%@-%f,%f,%@", v19, *(void *)&v22, v23, v11];
  if (!a3 || !self->_cachingEnabled || !v30) {
    return BWSemanticStyleFiltersForSemanticStyleAndFilterToCombine(a3, a4, v30, v32, v33, self->_colorLookupCache, (uint64_t)a8);
  }
  uint64_t v25 = v24;
  os_unfair_lock_lock(&self->_filterCacheLock);
  uint64_t v26 = [(NSMutableDictionary *)self->_cubeFilterCache objectForKeyedSubscript:v25];
  if (v26)
  {
    v27 = (void *)v26;
    [(NSMutableArray *)self->_recentFilterCacheKeys removeObject:v25];
    [(NSMutableArray *)self->_recentFilterCacheKeys addObject:v25];
  }
  else
  {
    os_unfair_lock_unlock(&self->_filterCacheLock);
    v27 = BWSemanticStyleFiltersForSemanticStyleAndFilterToCombine(a3, a4, 1, v32, v33, self->_colorLookupCache, (uint64_t)a8);
    os_unfair_lock_lock(&self->_filterCacheLock);
    [(NSMutableDictionary *)self->_cubeFilterCache setObject:v27 forKeyedSubscript:v25];
    [(NSMutableArray *)self->_recentFilterCacheKeys addObject:v25];
    if ([(NSMutableArray *)self->_recentFilterCacheKeys count] > self->_cacheMaxSize)
    {
      id v28 = (id)[(NSMutableArray *)self->_recentFilterCacheKeys firstObject];
      [(NSMutableArray *)self->_recentFilterCacheKeys removeObjectAtIndex:0];
      [(NSMutableDictionary *)self->_cubeFilterCache setObject:0 forKeyedSubscript:v28];
    }
  }
  os_unfair_lock_unlock(&self->_filterCacheLock);
  return v27;
}

@end