@interface SSUMatcherBuilder
+ (id)buildMatcher:(id)a3 error:(id *)a4;
+ (id)sharedBuilder;
- (BOOL)hasMatcher:(id)a3;
- (NSMutableDictionary)_matchers;
- (id)_init;
- (id)getMatcherForBuildParams:(id)a3 error:(id *)a4;
- (unint64_t)numMatchers;
@end

@implementation SSUMatcherBuilder

- (void).cxx_destruct
{
}

- (NSMutableDictionary)_matchers
{
  return self->__matchers;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)SSUMatcherBuilder;
  v2 = [(SSUMatcherBuilder *)&v6 init];
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  matchers = v2->__matchers;
  v2->__matchers = (NSMutableDictionary *)v3;

  return v2;
}

- (id)getMatcherForBuildParams:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  v8 = [(NSMutableDictionary *)v7->__matchers objectForKey:v6];
  v9 = [v8 matcher];
  if (v9)
  {
    v10 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_6;
    }
    int v17 = 136315394;
    v18 = "-[SSUMatcherBuilder getMatcherForBuildParams:error:]";
    __int16 v19 = 2048;
    uint64_t v20 = (uint64_t)v9;
    v11 = "%s Returning existing SSUMatcher instance with address: %p";
    goto LABEL_19;
  }
  v9 = [(id)objc_opt_class() buildMatcher:v6 error:a4];
  if (v9)
  {
    v12 = [[SSUMatcherWeakRef alloc] initWithMatcher:v9];
    [(NSMutableDictionary *)v7->__matchers setObject:v12 forKeyedSubscript:v6];

    v10 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_6;
    }
    int v17 = 136315394;
    v18 = "-[SSUMatcherBuilder getMatcherForBuildParams:error:]";
    __int16 v19 = 2048;
    uint64_t v20 = (uint64_t)v9;
    v11 = "%s Returning newly-built SSUMatcher instance with address: %p";
LABEL_19:
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v17, 0x16u);
LABEL_6:

    v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = [(SSUMatcherBuilder *)v7 numMatchers];
      int v17 = 136315394;
      v18 = "-[SSUMatcherBuilder getMatcherForBuildParams:error:]";
      __int16 v19 = 2048;
      uint64_t v20 = v16;
      _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s Total number of matchers alive: %lu", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_8;
  }
  v13 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    if (a4)
    {
      v15 = [*a4 localizedDescription];
    }
    else
    {
      v15 = @"nil";
    }
    int v17 = 136315394;
    v18 = "-[SSUMatcherBuilder getMatcherForBuildParams:error:]";
    __int16 v19 = 2112;
    uint64_t v20 = (uint64_t)v15;
    _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, "%s [WARN]: SSUMatcher building failed with error: %@", (uint8_t *)&v17, 0x16u);
    if (a4) {
  }
    }
  v9 = 0;
LABEL_8:

  objc_sync_exit(v7);
  return v9;
}

- (unint64_t)numMatchers
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = [(NSMutableDictionary *)v2->__matchers count];
    *(_DWORD *)buf = 136315394;
    uint64_t v21 = "-[SSUMatcherBuilder numMatchers]";
    __int16 v22 = 2048;
    unint64_t v23 = v14;
    _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s Total number of weak ref wrapper objects in __matchers: %lu", buf, 0x16u);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = v2->__matchers;
  unint64_t v5 = 0;
  uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = -[NSMutableDictionary objectForKeyedSubscript:](v2->__matchers, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * v8), (void)v15);
        v10 = [v9 matcher];
        BOOL v11 = v10 != 0;

        v5 += v11;
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  v12 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v21 = "-[SSUMatcherBuilder numMatchers]";
    __int16 v22 = 2048;
    unint64_t v23 = v5;
    _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s Total number of weak ref wrapper objects that contain a live matcher in __matchers: %lu", buf, 0x16u);
  }

  objc_sync_exit(v2);
  return v5;
}

- (BOOL)hasMatcher:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)v5->__matchers objectForKeyedSubscript:v4];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 matcher];
    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  objc_sync_exit(v5);
  return v9;
}

+ (id)buildMatcher:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v22 = "+[SSUMatcherBuilder buildMatcher:error:]";
    _os_log_debug_impl(&dword_2263A0000, v6, OS_LOG_TYPE_DEBUG, "%s Building new SSUMatcher instance...", buf, 0xCu);
  }

  uint64_t v7 = (void *)MEMORY[0x263F71FD0];
  uint64_t v8 = [v5 cacheDirectoryURL];
  BOOL v9 = [v5 modelAssetsDirectoryURL];
  v10 = [v5 datasetAssetsDirectoryURL];

  id v20 = 0;
  BOOL v11 = [v7 directoriesWithCacheDirectoryURL:v8 modelAssetsDirectoryURL:v9 datasetAssetsDirectoryURL:v10 error:&v20];
  id v12 = v20;

  if (v11)
  {
    id v19 = 0;
    v13 = [MEMORY[0x263F71FC8] matcherWithDirectories:v11 initializeModelsPreemptively:1 error:&v19];
    id v14 = v19;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      long long v17 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v22 = "+[SSUMatcherBuilder buildMatcher:error:]";
        __int16 v23 = 2112;
        id v24 = v14;
        _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, "%s Error building SSUMatcher instance: %@", buf, 0x16u);
      }

      if (a4) {
        *a4 = v14;
      }
    }
  }
  else
  {
    long long v16 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v22 = "+[SSUMatcherBuilder buildMatcher:error:]";
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_debug_impl(&dword_2263A0000, v16, OS_LOG_TYPE_DEBUG, "%s Error building SNLPSSUMatcherDirectories instance: %@", buf, 0x16u);
    }

    v13 = 0;
    if (a4) {
      *a4 = v12;
    }
  }

  return v13;
}

+ (id)sharedBuilder
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__SSUMatcherBuilder_sharedBuilder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedBuilder_once != -1) {
    dispatch_once(&sharedBuilder_once, block);
  }
  v2 = (void *)sharedBuilder_sharedBuilder_;
  return v2;
}

uint64_t __34__SSUMatcherBuilder_sharedBuilder__block_invoke(uint64_t a1)
{
  sharedBuilder_sharedBuilder_ = [objc_alloc(*(Class *)(a1 + 32)) _init];
  return MEMORY[0x270F9A758]();
}

@end