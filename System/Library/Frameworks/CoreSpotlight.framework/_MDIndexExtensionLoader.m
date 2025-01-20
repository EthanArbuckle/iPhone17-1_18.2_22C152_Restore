@interface _MDIndexExtensionLoader
+ (id)_matchDictionary;
- (_MDIndexExtensionLoader)init;
- (id)_filterIndexExtensions:(id)a3 outFileProviderBundleMap:(id *)a4 outFileProviderBundleIDs:(id *)a5;
@end

@implementation _MDIndexExtensionLoader

+ (id)_matchDictionary
{
  if (_matchDictionary_onceToken != -1) {
    dispatch_once(&_matchDictionary_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)_matchDictionary_sMatchDictionary;

  return v2;
}

- (_MDIndexExtensionLoader)init
{
  v5.receiver = self;
  v5.super_class = (Class)_MDIndexExtensionLoader;
  v2 = [(_MDExtensionLoader *)&v5 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.corespotlight.IndexExtensionLoader", 0);
    [(_MDExtensionLoader *)v2 setQueue:v3];
  }
  return v2;
}

- (id)_filterIndexExtensions:(id)a3 outFileProviderBundleMap:(id *)a4 outFileProviderBundleIDs:(id *)a5
{
  v37 = a5;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(_MDExtensionLoader *)self queue];
  dispatch_assert_queue_V2(v7);

  id v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
  id v39 = (id)objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (!v9)
  {
    v11 = 0;
    v41 = 0;
    goto LABEL_37;
  }
  uint64_t v10 = v9;
  v11 = 0;
  v41 = 0;
  uint64_t v45 = *(void *)v47;
  id v40 = v8;
  do
  {
    uint64_t v12 = 0;
    uint64_t v43 = v10;
    do
    {
      if (*(void *)v47 != v45) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v46 + 1) + 8 * v12);
      v14 = objc_msgSend(v13, "identifier", v37);
      v15 = [v13 extensionPointIdentifier];
      if ([v15 isEqualToString:@"com.apple.spotlight.index"])
      {
        v16 = [v13 _plugIn];
        unsigned __int8 v17 = [v16 userElection];

        if (([v13 optedIn] & 1) == 0 && v17 >= 2uLL)
        {
          v18 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v51 = v14;
            __int16 v52 = 2080;
            v53 = "NO";
            __int16 v54 = 2048;
            v55 = (char *)v17;
            _os_log_impl(&dword_18D0E3000, v18, OS_LOG_TYPE_DEFAULT, "Skipping index extension:%@, optedIn:%s, election:%ld", buf, 0x20u);
          }
          goto LABEL_26;
        }
        v44 = v11;
        v18 = [v13 _plugIn];
        v22 = [v18 entitlements];
        v23 = [v22 objectForKeyedSubscript:@"com.apple.private.corespotlight.bundleid"];

        if (v23)
        {
          v24 = 0;
          goto LABEL_20;
        }
        v23 = [v18 containingUrl];
        v24 = [v23 path];
        if (v24
          && ([MEMORY[0x1E4F223F0] bundleProxyForURL:v23],
              v30 = objc_claimAutoreleasedReturnValue(),
              [v30 bundleIdentifier],
              uint64_t v31 = objc_claimAutoreleasedReturnValue(),
              v30,
              v31))
        {

          v23 = (void *)v31;
LABEL_20:
          v25 = [@"com.apple.corespotlight.extension." stringByAppendingString:v23];
          dispatch_queue_t v26 = dispatch_queue_create((const char *)[v25 UTF8String], 0);
          v27 = [[_MDIndexExtension alloc] initWithExtension:v13 queue:v26 containerPath:v24 containerID:v23];
          if ([v14 isEqualToString:@"com.apple.FileProvider.FPSpotlightIndexer"])
          {
            v28 = v27;

            v41 = v28;
          }
          v29 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v51 = v14;
            __int16 v52 = 2112;
            v53 = (const char *)v23;
            __int16 v54 = 2112;
            v55 = v24;
            _os_log_debug_impl(&dword_18D0E3000, v29, OS_LOG_TYPE_DEBUG, "Found index extension:%@, containerId:%@, containerPath:%@", buf, 0x20u);
          }

          [v42 setObject:v27 forKeyedSubscript:v23];
          id v8 = v40;
        }
        else
        {
          v25 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v51 = v14;
            __int16 v52 = 2112;
            v53 = v24;
            _os_log_impl(&dword_18D0E3000, v25, OS_LOG_TYPE_DEFAULT, "Couldn't get the bundleId for the index extension:%@ at %@", buf, 0x16u);
          }
        }

        uint64_t v10 = v43;
        v11 = v44;
        goto LABEL_26;
      }
      if (![v15 isEqualToString:@"com.apple.fileprovider-nonui"]) {
        goto LABEL_27;
      }
      if (!v11) {
        v11 = objc_opt_new();
      }
      [v11 addObject:v14];
      v19 = [v13 _plugIn];
      v18 = [v19 containingUrl];

      if (v18)
      {
        v20 = [MEMORY[0x1E4F223F0] bundleProxyForURL:v18];
        v21 = [v20 bundleIdentifier];

        if (v21) {
          [v39 setObject:v14 forKey:v21];
        }
      }
LABEL_26:

LABEL_27:
      ++v12;
    }
    while (v10 != v12);
    uint64_t v32 = [v8 countByEnumeratingWithState:&v46 objects:v56 count:16];
    uint64_t v10 = v32;
  }
  while (v32);
LABEL_37:

  v33 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
    -[_MDIndexExtensionLoader _filterIndexExtensions:outFileProviderBundleMap:outFileProviderBundleIDs:](v42, v33);
  }

  if ([v11 count])
  {
    v34 = (void *)[v11 copy];
    [(_MDIndexExtension *)v41 setIdentifiers:v34];

    if (v37) {
      id *v37 = v11;
    }
  }
  if (a4) {
    *a4 = v39;
  }
  id v35 = v42;

  return v35;
}

- (void)_filterIndexExtensions:(void *)a1 outFileProviderBundleMap:(NSObject *)a2 outFileProviderBundleIDs:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "Found %lu index extensions", (uint8_t *)&v3, 0xCu);
}

@end