@interface ATXModeFaceSuggestionsCache
- (id)_cacheForUUID:(id)a3;
- (id)_suggestedFacesDirectoryURL;
- (id)cachedSuggestedFacesForModeUUID:(id)a3;
- (void)cacheSuggestedFaces:(id)a3 forModeUUID:(id)a4;
- (void)evictCachedSuggestedFaces;
@end

@implementation ATXModeFaceSuggestionsCache

- (id)cachedSuggestedFacesForModeUUID:(id)a3
{
  id v4 = a3;
  v5 = [(ATXModeFaceSuggestionsCache *)self _cacheForUUID:v4];
  v6 = (void *)MEMORY[0x1AD0D3C30]();
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v5 readSecureCodedObjectWithMaxValidAge:v9 allowableClasses:0 error:432000.0];

  return v10;
}

- (void)evictCachedSuggestedFaces
{
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = [(ATXModeFaceSuggestionsCache *)self _suggestedFacesDirectoryURL];
  [v4 removeItemAtURL:v3 error:0];
}

- (void)cacheSuggestedFaces:(id)a3 forModeUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    v9 = [(ATXModeFaceSuggestionsCache *)self _suggestedFacesDirectoryURL];
    [v8 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:0];

    v10 = [(ATXModeFaceSuggestionsCache *)self _cacheForUUID:v7];
    v11 = (void *)[v6 copy];
    [v10 storeSecureCodedObject:v11 error:0];

    v12 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ATXModeFaceSuggestionsCache cacheSuggestedFaces:forModeUUID:]((uint64_t)v7, v12);
    }
  }
}

- (id)_cacheForUUID:(id)a3
{
  id v4 = a3;
  v5 = [(ATXModeFaceSuggestionsCache *)self _suggestedFacesDirectoryURL];
  id v6 = [v4 UUIDString];

  id v7 = [v5 URLByAppendingPathComponent:v6 isDirectory:0];

  id v8 = objc_alloc(MEMORY[0x1E4F4B638]);
  v9 = [v7 path];
  v10 = __atxlog_handle_lock_screen();
  v11 = (void *)[v8 initWithCacheFilePath:v9 loggingHandle:v10 debugName:@"suggested mode faces"];

  return v11;
}

- (id)_suggestedFacesDirectoryURL
{
  v2 = [MEMORY[0x1E4F4B650] appPredictionCacheDirectory];
  v3 = [v2 stringByAppendingPathComponent:@"SuggestedModeFaces"];

  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];

  return v4;
}

- (void)cacheSuggestedFaces:(uint64_t)a1 forModeUUID:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A790D000, a2, OS_LOG_TYPE_DEBUG, "Caching mode suggestions to disk for: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end