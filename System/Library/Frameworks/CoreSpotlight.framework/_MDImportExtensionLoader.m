@interface _MDImportExtensionLoader
+ (id)_matchDictionary;
- (_MDImportExtensionLoader)init;
- (id)_filterIndexExtensions:(id)a3 outFileProviderBundleMap:(id *)a4 outFileProviderBundleIDs:(id *)a5;
@end

@implementation _MDImportExtensionLoader

+ (id)_matchDictionary
{
  if (_matchDictionary_onceToken_22 != -1) {
    dispatch_once(&_matchDictionary_onceToken_22, &__block_literal_global_24);
  }
  v2 = (void *)_matchDictionary_sMatchDictionary_21;

  return v2;
}

- (_MDImportExtensionLoader)init
{
  v5.receiver = self;
  v5.super_class = (Class)_MDImportExtensionLoader;
  v2 = [(_MDExtensionLoader *)&v5 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.corespotlight.ImportExtensionLoader", 0);
    [(_MDExtensionLoader *)v2 setQueue:v3];
  }
  return v2;
}

- (id)_filterIndexExtensions:(id)a3 outFileProviderBundleMap:(id *)a4 outFileProviderBundleIDs:(id *)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v45 = self;
  v7 = [(_MDExtensionLoader *)self queue];
  dispatch_assert_queue_V2(v7);

  id v47 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
  id v43 = (id)objc_opt_new();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v8 = v6;
  uint64_t v57 = [v8 countByEnumeratingWithState:&v58 objects:v68 count:16];
  v9 = 0;
  if (!v57)
  {
    v46 = 0;
    goto LABEL_38;
  }
  v46 = 0;
  uint64_t v56 = *(void *)v59;
  id v44 = v8;
  do
  {
    for (uint64_t i = 0; i != v57; ++i)
    {
      if (*(void *)v59 != v56) {
        objc_enumerationMutation(v8);
      }
      v11 = *(void **)(*((void *)&v58 + 1) + 8 * i);
      v12 = [v11 identifier];
      v13 = [v11 extensionPointIdentifier];
      if ([v13 isEqualToString:@"com.apple.spotlight.import"])
      {
        v14 = [v11 _plugIn];
        unsigned __int8 v15 = [v14 userElection];

        if (([v11 optedIn] & 1) != 0 || v15 < 2uLL)
        {
          v16 = [v11 _plugIn];
          id v20 = v12;
          uint64_t v55 = (uint64_t)v20;
          if (!v20)
          {
            v21 = [MEMORY[0x1E4F29128] UUID];
            uint64_t v55 = [v21 UUIDString];
          }
          v22 = [v16 url];
          v23 = [v22 path];

          v53 = [v11 attributes];
          v54 = [v53 objectForKey:@"CSSupportedContentTypes"];
          if (v54)
          {
            v52 = v23;
            v49 = [v16 bundleInfoDictionary];
            v51 = [v49 objectForKey:@"CSExtensionLabel"];
            v24 = [(_MDExtensionLoader *)v45 extensionsByBundleId];
            v25 = [v24 objectForKeyedSubscript:v55];

            v50 = v9;
            v48 = v25;
            if (v25)
            {
              v26 = [v25 queue];
            }
            else
            {
              id v29 = [@"com.apple.corespotlight.extension." stringByAppendingString:v55];
              v26 = dispatch_queue_create((const char *)[v29 UTF8String], 0);
            }
            v30 = [_MDIndexExtension alloc];
            v31 = [NSNumber numberWithBool:0];
            v32 = [(_MDIndexExtension *)v30 initWithExtension:v11 queue:v26 containerPath:v52 containerID:v55 supportedFileTypes:v54 extensionLabel:v51 isAppleCodeSigned:v31];

            if ([v20 isEqualToString:@"com.apple.FileProvider.FPSpotlightIndexer"])
            {
              v33 = v32;

              v46 = v33;
            }
            v9 = v50;
            v34 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v63 = (uint64_t)v20;
              __int16 v64 = 2112;
              v65 = (const char *)v55;
              _os_log_impl(&dword_18D0E3000, v34, OS_LOG_TYPE_DEFAULT, "Found import extension: %@, containerId: %@", buf, 0x16u);
            }

            v28 = (void *)v55;
            [v47 setObject:v32 forKeyedSubscript:v55];

            id v8 = v44;
            v23 = v52;
            v27 = v49;
          }
          else
          {
            v27 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v63 = (uint64_t)v20;
              __int16 v64 = 2112;
              v65 = v23;
              _os_log_impl(&dword_18D0E3000, v27, OS_LOG_TYPE_DEFAULT, "Couldn't get the supportedContentTypes for the import extension:%@ at %@", buf, 0x16u);
            }
            v28 = (void *)v55;
          }
        }
        else
        {
          v16 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v63 = (uint64_t)v12;
            __int16 v64 = 2080;
            v65 = "NO";
            __int16 v66 = 2048;
            uint64_t v67 = v15;
            _os_log_impl(&dword_18D0E3000, v16, OS_LOG_TYPE_DEFAULT, "Skipping import extension:%@, optedIn:%s, election:%ld", buf, 0x20u);
          }
        }
      }
      else
      {
        if (![v13 isEqualToString:@"com.apple.fileprovider-nonui"]) {
          goto LABEL_34;
        }
        if (!v9) {
          v9 = objc_opt_new();
        }
        [v9 addObject:v12];
        v17 = [v11 _plugIn];
        v16 = [v17 containingUrl];

        if (v16)
        {
          v18 = [MEMORY[0x1E4F223F0] bundleProxyForURL:v16];
          v19 = [v18 bundleIdentifier];

          if (v19) {
            [v43 setObject:v12 forKey:v19];
          }
        }
      }

LABEL_34:
    }
    uint64_t v57 = [v8 countByEnumeratingWithState:&v58 objects:v68 count:16];
  }
  while (v57);
LABEL_38:

  v35 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v36 = [v47 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v63 = v36;
    _os_log_impl(&dword_18D0E3000, v35, OS_LOG_TYPE_DEFAULT, "Found %lu import extensions", buf, 0xCu);
  }

  if ([v9 count])
  {
    v37 = (void *)[v9 copy];
    [(_MDIndexExtension *)v46 setIdentifiers:v37];

    if (a5) {
      *a5 = (id)[v9 copy];
    }
  }
  if (a4) {
    *a4 = v43;
  }
  v38 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v63 = (uint64_t)v47;
    _os_log_impl(&dword_18D0E3000, v38, OS_LOG_TYPE_DEFAULT, "~~~ _MDImportExtensionLoader returning: %@", buf, 0xCu);
  }

  id v39 = v47;
  return v39;
}

@end