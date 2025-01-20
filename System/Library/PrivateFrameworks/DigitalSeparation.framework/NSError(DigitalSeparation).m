@interface NSError(DigitalSeparation)
+ (id)ds_errorFromIgnorableError:()DigitalSeparation sourceName:;
- (id)ds_localizedAppNames;
- (id)ds_localizedPermissionNames;
- (id)ds_underlyingErrorsBySource;
@end

@implementation NSError(DigitalSeparation)

+ (id)ds_errorFromIgnorableError:()DigitalSeparation sourceName:
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    v6 = +[DSSourceDescriptor sourceDescriptorForSource:a4];
    if ([v6 shouldIgnoreError:v5])
    {
      if (DSLogNSError_onceToken != -1) {
        dispatch_once(&DSLogNSError_onceToken, &__block_literal_global_3);
      }
      v7 = DSLogNSError_log;
      if (os_log_type_enabled((os_log_t)DSLogNSError_log, OS_LOG_TYPE_INFO))
      {
        int v10 = 138543362;
        id v11 = v5;
        _os_log_impl(&dword_236090000, v7, OS_LOG_TYPE_INFO, "Ignoring returned error %{public}@", (uint8_t *)&v10, 0xCu);
      }
      id v8 = 0;
    }
    else
    {
      id v8 = v5;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)ds_underlyingErrorsBySource
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  v3 = [a1 userInfo];
  v4 = [v3 objectForKeyedSubscript:@"DSErrorKeySourceName"];

  if (v4) {
    [v2 setObject:a1 forKeyedSubscript:v4];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(a1, "underlyingErrors", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      int v10 = v4;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        uint64_t v12 = [v11 userInfo];
        v4 = [v12 objectForKeyedSubscript:@"DSErrorKeySourceName"];

        if (v4) {
          [v2 setObject:v11 forKeyedSubscript:v4];
        }
        ++v9;
        int v10 = v4;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v13 = [NSDictionary dictionaryWithDictionary:v2];

  return v13;
}

- (id)ds_localizedAppNames
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v1 = objc_msgSend(a1, "ds_underlyingErrorsBySource");
  v2 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = +[DSSourceDescriptor sourceDescriptorForSource:](DSSourceDescriptor, "sourceDescriptorForSource:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        uint64_t v9 = [v8 localizedAppName];
        [v2 addObject:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  int v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v2];

  return v10;
}

- (id)ds_localizedPermissionNames
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9C0] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = objc_msgSend(a1, "underlyingErrors", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v13 + 1) + 8 * i) userInfo];
        uint64_t v9 = [v8 objectForKeyedSubscript:@"DSErrorKeyServiceName"];

        if (v9)
        {
          int v10 = +[DSAppPermissionsDescriptor localizedNameForPermission:v9];
          id v11 = DSLocStringForKey(v10);
          [v2 addObject:v11];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v2;
}

@end