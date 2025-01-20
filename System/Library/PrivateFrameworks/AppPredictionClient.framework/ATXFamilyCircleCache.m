@interface ATXFamilyCircleCache
- (ATXFamilyCircleCache)init;
- (ATXFamilyCircleCache)initWithCachePath:(id)a3;
- (BOOL)hasiCloudFamily;
- (id)_cache;
- (id)_fetchFamilyCircleFromCache;
- (id)_requestUpdatedFamilyCircle;
- (void)_requestUpdatedFamilyCircle;
@end

@implementation ATXFamilyCircleCache

- (ATXFamilyCircleCache)init
{
  v3 = [MEMORY[0x1E4F4B650] appPredictionCacheDirectory];
  v4 = [v3 stringByAppendingPathComponent:@"familyCircleCache"];

  v5 = [(ATXFamilyCircleCache *)self initWithCachePath:v4];
  return v5;
}

- (ATXFamilyCircleCache)initWithCachePath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXFamilyCircleCache;
  v5 = [(ATXFamilyCircleCache *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    path = v5->_path;
    v5->_path = (NSString *)v6;
  }
  return v5;
}

- (BOOL)hasiCloudFamily
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [(ATXFamilyCircleCache *)self fetchFamilyCircle];
  v3 = [v2 members];
  uint64_t v4 = [v3 count];

  v5 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "Fetched %ld members during iCloud family check", (uint8_t *)&v7, 0xCu);
  }

  return v4 != 0;
}

- (id)_requestUpdatedFamilyCircle
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F61858]);
  [v2 setCachePolicy:0];
  id v10 = 0;
  v3 = [v2 fetchFamilyCircleWithError:&v10];
  id v4 = v10;
  v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    int v7 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(ATXFamilyCircleCache *)(uint64_t)v5 _requestUpdatedFamilyCircle];
    }
  }
  uint64_t v8 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[ATXFamilyCircleCache _requestUpdatedFamilyCircle]";
    __int16 v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Fetched iCloud family circle: %@", buf, 0x16u);
  }

  return v3;
}

- (id)_cache
{
  id v3 = objc_alloc(MEMORY[0x1E4F4B638]);
  path = self->_path;
  v5 = __atxlog_handle_default();
  BOOL v6 = (void *)[v3 initWithCacheFilePath:path loggingHandle:v5 debugName:@"cached family circle"];

  return v6;
}

- (id)_fetchFamilyCircleFromCache
{
  id v3 = [(ATXFamilyCircleCache *)self _cache];
  id v4 = (void *)MEMORY[0x1AD0D3C30]();
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  BOOL v6 = [v3 readSecureCodedObjectWithMaxValidAge:v5 allowableClasses:0 error:86400.0];

  if (!v6)
  {
    BOOL v6 = [(ATXFamilyCircleCache *)self _requestUpdatedFamilyCircle];
    if (v6) {
      [v3 storeSecureCodedObject:v6 error:0];
    }
  }
  id v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
}

- (void)_requestUpdatedFamilyCircle
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "-[ATXFamilyCircleCache _requestUpdatedFamilyCircle]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "%s: Error querying for iCloud family: %@", (uint8_t *)&v2, 0x16u);
}

@end