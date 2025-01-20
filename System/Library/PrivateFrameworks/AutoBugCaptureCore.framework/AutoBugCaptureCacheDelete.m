@interface AutoBugCaptureCacheDelete
- (AutoBugCaptureCacheDelete)initWithStorageManager:(id)a3;
- (DiagnosticStorageManager)storageManager;
- (id)cacheDeletePeriodicWithInfo:(__CFDictionary *)a3;
- (id)replyCacheDeleteDictionaryWithCDInfo:(id)a3 amount:(unint64_t)a4;
- (void)initCacheDeletePurgeMonitor;
- (void)processPurgedFilesForCDEvents:(id)a3;
- (void)registerCallbacks:(const char *)a3;
- (void)setStorageManager:(id)a3;
@end

@implementation AutoBugCaptureCacheDelete

uint64_t __47__AutoBugCaptureCacheDelete_registerCallbacks___block_invoke(uint64_t a1)
{
  return objc_claimAutoreleasedReturnValue();
}

- (AutoBugCaptureCacheDelete)initWithStorageManager:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AutoBugCaptureCacheDelete;
  v6 = [(AutoBugCaptureCacheDelete *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storageManager, a3);
    v8 = +[ABCAdministrator sharedInstance];
    v9 = [v8 configurationManager];
    uint64_t v10 = [v9 logArchivePath];
    logArchivePath = v7->logArchivePath;
    v7->logArchivePath = (NSString *)v10;

    if ([(NSString *)v7->logArchivePath hasPrefix:@"/var/"])
    {
      uint64_t v12 = [@"/private" stringByAppendingPathComponent:v7->logArchivePath];
      v13 = v7->logArchivePath;
      v7->logArchivePath = (NSString *)v12;
    }
    [(AutoBugCaptureCacheDelete *)v7 registerCallbacks:"com.apple.symptomsd-diag.CacheDelete"];
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    purgedFilePaths = v7->purgedFilePaths;
    v7->purgedFilePaths = v14;
  }
  return v7;
}

- (id)replyCacheDeleteDictionaryWithCDInfo:(id)a3 amount:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v6 = (objc_class *)MEMORY[0x263EFF9A0];
  id v7 = a3;
  v8 = (__CFString *)objc_alloc_init(v6);
  uint64_t v9 = [v7 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];

  if (v9) {
    uint64_t v10 = (__CFString *)v9;
  }
  else {
    uint64_t v10 = @"/private/var";
  }
  if ([(NSString *)self->logArchivePath hasPrefix:v10])
  {
    [(__CFString *)v8 setObject:v10 forKeyedSubscript:@"CACHE_DELETE_VOLUME"];
    v11 = [NSNumber numberWithUnsignedInteger:a4];
    [(__CFString *)v8 setObject:v11 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

    uint64_t v12 = storageLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 138412290;
      v18 = v8;
      _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEBUG, "CacheDelete given back: %@", (uint8_t *)&v17, 0xCu);
    }

    v13 = v8;
  }
  else
  {
    v14 = storageLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      logArchivePath = self->logArchivePath;
      int v17 = 138412546;
      v18 = v10;
      __int16 v19 = 2112;
      v20 = logArchivePath;
      _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_INFO, "CacheDelete volume %@ and target path incompatible: %@", (uint8_t *)&v17, 0x16u);
    }

    v13 = 0;
  }

  return v13;
}

- (id)cacheDeletePeriodicWithInfo:(__CFDictionary *)a3
{
  id v5 = storageLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_INFO, "CacheDelete cacheDeletePERIODICWithInfo", buf, 2u);
  }

  storageManager = self->_storageManager;
  if (storageManager)
  {
    uint64_t v7 = [(DiagnosticStorageManager *)storageManager performPeriodicPurge];
  }
  else
  {
    v8 = +[ABCAdministrator sharedInstance];
    uint64_t v9 = [v8 configurationManager];
    int v10 = [v9 autoBugCaptureEnabled];

    if (v10)
    {
      v11 = storageLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_ERROR, "CacheDelete cacheDeletePERIODICWithInfo. ABC is enabled but storageManager is nil", v14, 2u);
      }
    }
    uint64_t v7 = 0;
  }
  uint64_t v12 = [(AutoBugCaptureCacheDelete *)self replyCacheDeleteDictionaryWithCDInfo:a3 amount:v7];

  return v12;
}

- (void)registerCallbacks:(const char *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = [NSString stringWithUTF8String:a3];
  int v5 = CacheDeleteRegisterInfoCallbacks();
  if (v5 < 0)
  {
    int v6 = v5;
    uint64_t v7 = storageLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v9 = self;
      __int16 v10 = 1024;
      int v11 = v6;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "Failed to register with CacheDelete: %p, %d", buf, 0x12u);
    }
  }
}

- (void)initCacheDeletePurgeMonitor
{
  v10[1] = *MEMORY[0x263EF8340];
  CacheDeleteInitPurgeMarker();
  CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], [(NSString *)self->logArchivePath fileSystemRepresentation], 0x8000100u);
  v10[0] = self->logArchivePath;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  int v3 = CacheDeleteRegisterPurgeNotification();
  if (v3)
  {
    int v4 = v3;
    int v5 = storageLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v7 = self;
      __int16 v8 = 1024;
      int v9 = v4;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_ERROR, "Failed to register Purge Notification CacheDelete: %p, %d", buf, 0x12u);
    }
  }
  else
  {
    CacheDeleteEnumerateRemovedFiles();
  }
}

uint64_t __56__AutoBugCaptureCacheDelete_initCacheDeletePurgeMonitor__block_invoke()
{
  return CacheDeleteEnumerateRemovedFiles();
}

uint64_t __56__AutoBugCaptureCacheDelete_initCacheDeletePurgeMonitor__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processPurgedFilesForCDEvents:a2];
}

uint64_t __56__AutoBugCaptureCacheDelete_initCacheDeletePurgeMonitor__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processPurgedFilesForCDEvents:a2];
}

- (void)processPurgedFilesForCDEvents:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![v4 count]) {
    goto LABEL_20;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v6) {
    goto LABEL_19;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v21;
  id v19 = v4;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(v5);
      }
      __int16 v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      int v11 = [v10 objectForKeyedSubscript:@"rescan"];

      if (v11)
      {
        [(DiagnosticStorageManager *)self->_storageManager cleanupCasesAfterACentralizedCacheDeletePurgeEvent:0];
LABEL_18:
        id v4 = v19;
        goto LABEL_19;
      }
      uint64_t v12 = [v10 objectForKeyedSubscript:@"historyDone"];

      if (v12)
      {
        [(DiagnosticStorageManager *)self->_storageManager cleanupCasesAfterACentralizedCacheDeletePurgeEvent:self->purgedFilePaths];
        [(NSMutableArray *)self->purgedFilePaths removeAllObjects];
        goto LABEL_18;
      }
      uint64_t v13 = [v10 objectForKeyedSubscript:@"path"];
      if (v13)
      {
        v14 = (void *)v13;
        id v15 = objc_alloc(MEMORY[0x263EFF980]);
        v16 = [v14 pathComponents];
        int v17 = (void *)[v15 initWithArray:v16];

        if ([v17 containsObject:@"private"])
        {
          [v17 removeObject:@"private"];
          uint64_t v18 = [NSString pathWithComponents:v17];

          v14 = (void *)v18;
        }
        [(NSMutableArray *)self->purgedFilePaths addObject:v14];
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    id v4 = v19;
    if (v7) {
      continue;
    }
    break;
  }
LABEL_19:

LABEL_20:
}

- (DiagnosticStorageManager)storageManager
{
  return self->_storageManager;
}

- (void)setStorageManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageManager, 0);
  objc_storeStrong((id *)&self->purgedFilePaths, 0);

  objc_storeStrong((id *)&self->logArchivePath, 0);
}

@end