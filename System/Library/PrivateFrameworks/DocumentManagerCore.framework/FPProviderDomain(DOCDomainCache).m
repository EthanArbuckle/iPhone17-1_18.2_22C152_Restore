@interface FPProviderDomain(DOCDomainCache)
+ (id)allowedFileProviderBundleIdentifiersFiltered:()DOCDomainCache;
+ (id)domainPathCache;
+ (void)setDomainCache:()DOCDomainCache;
@end

@implementation FPProviderDomain(DOCDomainCache)

+ (void)setDomainCache:()DOCDomainCache
{
  v20 = a1;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v22 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [v3 allKeys];
  uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v8 = objc_msgSend(v3, "objectForKeyedSubscript:", v7, v20);
        v9 = [v8 storageURLs];
        BOOL v10 = [v9 count] == 0;

        if (v10)
        {
          v16 = docEnumerationLogHandle;
          if (!docEnumerationLogHandle)
          {
            DOCInitLogging();
            v16 = docEnumerationLogHandle;
          }
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            +[FPProviderDomain(DOCDomainCache) setDomainCache:](v27, v16, v8, &v28);
          }
        }
        else
        {
          v11 = [v8 storageURLs];
          v12 = [v11 objectAtIndexedSubscript:0];

          v13 = [v12 path];
          v14 = [v13 stringByStandardizingPath];
          v15 = [v14 stringByAppendingString:@"/"];

          [v22 setObject:v15 forKeyedSubscript:v7];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v4);
  }

  id v17 = v20;
  objc_sync_enter(v17);
  uint64_t v18 = [v22 copy];
  v19 = (void *)_domainPathCache;
  _domainPathCache = v18;

  objc_sync_exit(v17);
}

+ (id)domainPathCache
{
  id v1 = a1;
  objc_sync_enter(v1);
  id v2 = (id)_domainPathCache;
  objc_sync_exit(v1);

  return v2;
}

+ (id)allowedFileProviderBundleIdentifiersFiltered:()DOCDomainCache
{
  id v3 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v7 = (void *)MEMORY[0x263F054C8];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __81__FPProviderDomain_DOCDomainCache__allowedFileProviderBundleIdentifiersFiltered___block_invoke;
  v16[3] = &unk_2641B5A38;
  id v8 = v3;
  id v19 = v8;
  id v9 = v5;
  id v17 = v9;
  BOOL v10 = v6;
  uint64_t v18 = v10;
  v11 = [v7 beginMonitoringProviderDomainChangesWithHandler:v16];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  [MEMORY[0x263F054C8] endMonitoringProviderDomainChanges:v11];
  double v12 = CFAbsoluteTimeGetCurrent() - Current;
  if (v12 > 0.2)
  {
    v13 = docUILogHandle;
    if (!docUILogHandle)
    {
      DOCInitLogging();
      v13 = docUILogHandle;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[FPProviderDomain(DOCDomainCache) allowedFileProviderBundleIdentifiersFiltered:](v13, v12);
    }
  }
  if ([v9 count]) {
    v14 = (void *)[v9 copy];
  }
  else {
    v14 = 0;
  }

  return v14;
}

+ (void)setDomainCache:()DOCDomainCache .cold.1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  id v8 = [a3 providerDisplayName];
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_error_impl(&dword_213670000, v7, OS_LOG_TYPE_ERROR, "Could not set domain cache for domain %@ because storageURLs is empty", a1, 0xCu);
}

+ (void)allowedFileProviderBundleIdentifiersFiltered:()DOCDomainCache .cold.1(void *a1, double a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = NSNumber;
  uint64_t v4 = a1;
  id v5 = [v3 numberWithDouble:a2];
  int v6 = 138412290;
  uint64_t v7 = v5;
  _os_log_error_impl(&dword_213670000, v4, OS_LOG_TYPE_ERROR, "Monitoring the File Providers took a long time (%@)", (uint8_t *)&v6, 0xCu);
}

@end