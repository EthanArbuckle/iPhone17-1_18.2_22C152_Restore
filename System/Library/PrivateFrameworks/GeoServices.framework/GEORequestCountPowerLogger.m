@interface GEORequestCountPowerLogger
+ (id)cacheFileURL;
+ (id)sharedInstance;
+ (void)submitBackgroundTasksNeededDuringDaemonStart;
- (GEORequestCountPowerLogger)init;
- (uint64_t)_readFromDisk;
- (void)_setIsDirty:(uint64_t)a1;
- (void)_writeToDiskIfNecessary;
- (void)dealloc;
- (void)flushToPowerLog;
- (void)incrementCountForClient:(id)a3 requestType:(int)a4;
@end

@implementation GEORequestCountPowerLogger

void __66__GEORequestCountPowerLogger_incrementCountForClient_requestType___block_invoke(uint64_t a1)
{
  v6 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v6
    || (v6 = objc_alloc_init(GEOClientRequestInfo),
        [*(id *)(*(void *)(a1 + 32) + 32) setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)],
        v6))
  {
    v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
    v3 = NSNumber;
    v4 = [(NSMutableDictionary *)v6->_requests objectForKeyedSubscript:v2];
    v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "unsignedIntegerValue") + 1);
    [(NSMutableDictionary *)v6->_requests setObject:v5 forKeyedSubscript:v2];
  }
  else
  {
    v6 = 0;
  }
  -[GEORequestCountPowerLogger _setIsDirty:](*(void *)(a1 + 32), 1);
}

- (void)_setIsDirty:(uint64_t)a1
{
  if (a1)
  {
    geo_assert_isolated();
    if (*(unsigned __int8 *)(a1 + 40) != a2)
    {
      *(unsigned char *)(a1 + 40) = a2;
      v4 = *(NSObject **)(a1 + 48);
      if (a2)
      {
        dispatch_time_t v5 = dispatch_time(0, 30000000000);
        v6 = v4;
        uint64_t v7 = 5000000000;
      }
      else
      {
        v6 = v4;
        dispatch_time_t v5 = -1;
        uint64_t v7 = 0;
      }
      dispatch_source_set_timer(v6, v5, 0xFFFFFFFFFFFFFFFFLL, v7);
    }
  }
}

- (void)incrementCountForClient:(id)a3 requestType:(int)a4
{
  id v6 = a3;
  if (![v6 length]) {
    goto LABEL_10;
  }
  self;
  unsigned int v7 = (a4 >> 8) & 0x7F;
  if (v7 <= 0xB)
  {
    int v8 = 1 << v7;
    if ((v8 & 0xAA) != 0)
    {
      int v9 = a4 & 0x7F00;
LABEL_7:
      if (v9 == 2560) {
        goto LABEL_10;
      }
      goto LABEL_8;
    }
    if ((v8 & 0xC05) != 0)
    {
      int v9 = a4;
      goto LABEL_7;
    }
  }
LABEL_8:
  if (-[GEORequestCountPowerLogger _readFromDisk]((uint64_t)self))
  {
    geo_assert_not_isolated();
    id v10 = v6;
    geo_isolate_sync_data();
  }
LABEL_10:
}

- (uint64_t)_readFromDisk
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    geo_assert_not_isolated();
    unsigned __int8 v2 = atomic_load((unsigned __int8 *)(v1 + 16));
    if (v2) {
      return 1;
    }
    v3 = +[GEOKeyBagNotification sharedObject];
    char v4 = [v3 canAccessFilesWithProtection:1];

    if (v4)
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __43__GEORequestCountPowerLogger__readFromDisk__block_invoke;
      v31[3] = &unk_1E53DF820;
      v31[4] = v1;
      dispatch_time_t v5 = (void (**)(void, void))MEMORY[0x18C120660](v31);
      id v6 = +[GEORequestCountPowerLogger cacheFileURL]();
      unsigned int v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v8 = [v6 path];
      char v9 = [v7 fileExistsAtPath:v8];

      if ((v9 & 1) == 0)
      {
        v27 = GEOGetRequestCountPowerLoggerLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v6;
          _os_log_impl(&dword_188D96000, v27, OS_LOG_TYPE_DEBUG, "Resetting counters, cache does not exist at %@", buf, 0xCu);
        }

        v5[2](v5, 0);
        goto LABEL_24;
      }
      id v30 = 0;
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v6 options:0 error:&v30];
      id v11 = v30;
      id v12 = v11;
      if (!v10 || v11)
      {
        v28 = GEOGetRequestCountPowerLoggerLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v33 = v6;
          __int16 v34 = 2112;
          id v35 = v12;
          _os_log_impl(&dword_188D96000, v28, OS_LOG_TYPE_ERROR, "Resetting counters, failed to read %@: %@", buf, 0x16u);
        }

        v5[2](v5, 0);
        goto LABEL_23;
      }
      v13 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = objc_opt_class();
      v17 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
      id v29 = 0;
      v18 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v17 fromData:v10 error:&v29];
      id v12 = v29;
      char v19 = ((uint64_t (*)(void, void *))v5[2])(v5, v18);
      v20 = GEOGetRequestCountPowerLoggerLog();
      v21 = v20;
      if (v19)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v22 = "Successfuly read counters";
          v23 = v21;
          os_log_type_t v24 = OS_LOG_TYPE_DEBUG;
          uint32_t v25 = 2;
LABEL_21:
          _os_log_impl(&dword_188D96000, v23, v24, v22, buf, v25);
        }
      }
      else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v33 = v6;
        __int16 v34 = 2112;
        id v35 = v12;
        v22 = "Resetting counters, failed to unarchive %@: %@";
        v23 = v21;
        os_log_type_t v24 = OS_LOG_TYPE_ERROR;
        uint32_t v25 = 22;
        goto LABEL_21;
      }

LABEL_23:
LABEL_24:

      return 1;
    }
    v26 = GEOGetRequestCountPowerLoggerLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_INFO, "Refusing to read counters, device has not been unlocked.", buf, 2u);
    }

    return 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (qword_1EB29F848 != -1) {
    dispatch_once(&qword_1EB29F848, &__block_literal_global_54);
  }
  unsigned __int8 v2 = (void *)_MergedGlobals_214;

  return v2;
}

void __53__GEORequestCountPowerLogger__writeToDiskIfNecessary__block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2)
  {
    geo_assert_isolated();
    BOOL v3 = *(unsigned char *)(v2 + 40) != 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v3;
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 24));
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:*(void *)(a1[4] + 32) copyItems:1];
    uint64_t v5 = *(void *)(a1[7] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v7 = a1[4];
    -[GEORequestCountPowerLogger _setIsDirty:](v7, 0);
  }
}

void __53__GEORequestCountPowerLogger__writeToDiskIfNecessary__block_invoke(void *a1)
{
  v40[2] = *MEMORY[0x1E4F143B8];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__26;
  id v29 = __Block_byref_object_dispose__26;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__26;
  v23 = __Block_byref_object_dispose__26;
  id v24 = 0;
  uint64_t v2 = (void *)a1[4];
  v18[1] = (id)MEMORY[0x1E4F143A8];
  v18[2] = (id)3221225472;
  v18[3] = __53__GEORequestCountPowerLogger__writeToDiskIfNecessary__block_invoke_2;
  v18[4] = &unk_1E53DF848;
  v18[5] = v2;
  v18[6] = &v31;
  v18[7] = &v25;
  v18[8] = &v19;
  geo_isolate_sync_data();
  if (*((unsigned char *)v32 + 24))
  {
    uint64_t v3 = v26[5];
    v39[0] = @"startDate";
    v39[1] = @"clientInfo";
    uint64_t v4 = v20[5];
    v40[0] = v3;
    v40[1] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
    v18[0] = 0;
    id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:v18];
    id v7 = v18[0];
    id v8 = v7;
    if (!v6 || v7)
    {
      uint64_t v15 = GEOGetRequestCountPowerLoggerLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v8;
        _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "Failed to archive request counts %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v9 = a1[5];
      id v17 = 0;
      char v10 = [v6 writeToURL:v9 options:0x40000000 error:&v17];
      id v8 = v17;
      if (v8) {
        char v11 = 0;
      }
      else {
        char v11 = v10;
      }
      id v12 = GEOGetRequestCountPowerLoggerLog();
      v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_DEBUG, "Successfuly wrote request counts", buf, 2u);
        }

        uint64_t v14 = *(void *)(a1[6] + 8);
        id v8 = *(id *)(v14 + 40);
        *(void *)(v14 + 40) = 0;
      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = (void *)a1[5];
          *(_DWORD *)buf = 138412546;
          id v36 = v16;
          __int16 v37 = 2112;
          id v38 = v8;
          _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "Failed to write request counts to %@: %@", buf, 0x16u);
        }
      }
    }
  }
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
}

void __34__GEORequestCountPowerLogger_init__block_invoke(uint64_t a1)
{
  dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 48), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[GEORequestCountPowerLogger _writeToDiskIfNecessary]((uint64_t)WeakRetained);
}

- (void)_writeToDiskIfNecessary
{
  if (a1)
  {
    geo_assert_not_isolated();
    uint64_t v2 = +[GEOKeyBagNotification sharedObject];
    char v3 = [v2 canAccessFilesWithProtection:1];

    if (v3)
    {
      uint64_t v4 = +[GEORequestCountPowerLogger cacheFileURL]();
      if (v4)
      {
        uint64_t v5 = (void *)v4;
        *(void *)buf = 0;
        v13 = buf;
        uint64_t v14 = 0x3032000000;
        uint64_t v15 = __Block_byref_object_copy__26;
        uint64_t v16 = __Block_byref_object_dispose__26;
        _GEOCreateTransaction();
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        global_queue = geo_get_global_queue();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __53__GEORequestCountPowerLogger__writeToDiskIfNecessary__block_invoke;
        block[3] = &unk_1E53D7BD8;
        block[4] = a1;
        id v7 = v5;
        char v10 = v7;
        char v11 = buf;
        dispatch_async(global_queue, block);

        _Block_object_dispose(buf, 8);
      }
      else
      {
        id v8 = GEOGetRequestCountPowerLoggerLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_INFO, "Refusing to write counters, device has not created cacehe container.", buf, 2u);
        }

        id v7 = 0;
      }
    }
    else
    {
      id v7 = GEOGetRequestCountPowerLoggerLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_INFO, "Refusing to write counters, device has not been unlocked.", buf, 2u);
      }
    }
  }
}

+ (id)cacheFileURL
{
  self;
  v0 = +[GEOFilePaths urlFor:36];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__GEORequestCountPowerLogger_cacheFileURL__block_invoke;
  block[3] = &unk_1E53D79D8;
  id v1 = v0;
  id v4 = v1;
  if (cacheFileURL_onceToken != -1) {
    dispatch_once(&cacheFileURL_onceToken, block);
  }

  return v1;
}

void __44__GEORequestCountPowerLogger_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(GEORequestCountPowerLogger);
  id v1 = (void *)_MergedGlobals_214;
  _MergedGlobals_214 = (uint64_t)v0;
}

void __42__GEORequestCountPowerLogger_cacheFileURL__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[GEOFilePaths urlFor:32804];
  char v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [v2 path];
  int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v7 = *(void *)(a1 + 32);
    id v12 = 0;
    char v8 = [v6 moveItemAtURL:v2 toURL:v7 error:&v12];
    id v9 = v12;

    if ((v8 & 1) == 0)
    {
      char v10 = GEOGetRequestCountPowerLoggerLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v14 = v2;
        __int16 v15 = 2112;
        uint64_t v16 = v11;
        __int16 v17 = 2112;
        id v18 = v9;
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "Could not migrate cache from %@ to %@: %@", buf, 0x20u);
      }
    }
  }
}

- (GEORequestCountPowerLogger)init
{
  v15.receiver = self;
  v15.super_class = (Class)GEORequestCountPowerLogger;
  id v2 = [(GEORequestCountPowerLogger *)&v15 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    id v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__terminationRequested_ name:@"GEODaemonShouldTerminateNotification" object:0];

    global_queue = geo_get_global_queue();
    dispatch_source_t v7 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, global_queue);
    char v8 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v7;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 6), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, v2);
    id v9 = *((void *)v2 + 6);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __34__GEORequestCountPowerLogger_init__block_invoke;
    handler[3] = &unk_1E53DF7F8;
    id v12 = v2;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler(v9, handler);
    dispatch_activate(*((dispatch_object_t *)v2 + 6));
    objc_destroyWeak(&v13);

    objc_destroyWeak(&location);
  }
  return (GEORequestCountPowerLogger *)v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  -[GEORequestCountPowerLogger _writeToDiskIfNecessary]((uint64_t)self);
  v4.receiver = self;
  v4.super_class = (Class)GEORequestCountPowerLogger;
  [(GEORequestCountPowerLogger *)&v4 dealloc];
}

uint64_t __43__GEORequestCountPowerLogger__readFromDisk__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = 0;
  dispatch_source_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v5 = a2;
  geo_isolate_sync_data();
  atomic_exchange((atomic_uchar *volatile)(*(void *)(a1 + 32) + 16), 1u);
  uint64_t v3 = *((unsigned __int8 *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __43__GEORequestCountPowerLogger__readFromDisk__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count] == 2)
  {
    uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"startDate"];
    uint64_t v3 = *(void *)(a1 + 40);
    objc_super v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = v2;

    uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"clientInfo"];
    uint64_t v6 = *(void *)(a1 + 40);
    dispatch_source_t v7 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v5;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (*(void *)(v8 + 24) && *(void *)(v8 + 32))
  {
    char v9 = 1;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = *(void **)(v11 + 24);
    *(void *)(v11 + 24) = v10;

    uint64_t v13 = objc_opt_new();
    uint64_t v14 = *(void *)(a1 + 40);
    objc_super v15 = *(void **)(v14 + 32);
    *(void *)(v14 + 32) = v13;

    char v9 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
}

- (void)flushToPowerLog
{
  v41[2] = *MEMORY[0x1E4F143B8];
  geo_assert_not_isolated();
  if (-[GEORequestCountPowerLogger _readFromDisk]((uint64_t)self))
  {
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__26;
    char v34 = __Block_byref_object_dispose__26;
    id v35 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__26;
    v28 = __Block_byref_object_dispose__26;
    id v29 = 0;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __45__GEORequestCountPowerLogger_flushToPowerLog__block_invoke;
    v20 = &unk_1E53D89E8;
    uint64_t v21 = self;
    v22 = &v30;
    v23 = &v24;
    geo_isolate_sync_data();
    if ([(id)v25[5] count] && PLShouldLogRegisteredEvent())
    {
      uint64_t v3 = NSNumber;
      [(id)v31[5] timeIntervalSince1970];
      objc_super v4 = objc_msgSend(v3, "numberWithDouble:");
      uint64_t v5 = NSNumber;
      uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
      [v6 timeIntervalSince1970];
      dispatch_source_t v7 = objc_msgSend(v5, "numberWithDouble:");

      id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
      v40[0] = @"StartUnix";
      v40[1] = @"EndUnix";
      v41[0] = v4;
      v41[1] = v7;
      char v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
      uint64_t v10 = (void *)[v8 initWithDictionary:v9];

      uint64_t v11 = (void *)v25[5];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __45__GEORequestCountPowerLogger_flushToPowerLog__block_invoke_2;
      v15[3] = &unk_1E53DF870;
      id v12 = v10;
      id v16 = v12;
      [v11 enumerateKeysAndObjectsUsingBlock:v15];
      PLLogRegisteredEvent();
      uint64_t v13 = GEOGetRequestCountPowerLoggerLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478083;
        __int16 v37 = @"GEO Network Activity";
        __int16 v38 = 2113;
        id v39 = v12;
        _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_DEBUG, "Flushed network activity to powerlog:\n[%{private}@] %{private}@", buf, 0x16u);
      }
    }
    else
    {
      objc_super v4 = GEOGetRequestCountPowerLoggerLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        int v14 = [(id)v25[5] count];
        *(_DWORD *)buf = 138478083;
        __int16 v37 = @"GEO Network Activity";
        __int16 v38 = 1024;
        LODWORD(v39) = v14;
        _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "Not flushing network activity to powerlog %{private}@ either [_clientInfo count] (%u) == 0 or ShouldLog == NO", buf, 0x12u);
      }
    }

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }
}

void __45__GEORequestCountPowerLogger_flushToPowerLog__block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 24));
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 32));
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = a1[4];
  objc_super v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  uint64_t v5 = objc_opt_new();
  uint64_t v6 = a1[4];
  dispatch_source_t v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;

  uint64_t v8 = a1[4];

  -[GEORequestCountPowerLogger _setIsDirty:](v8, 1);
}

uint64_t __45__GEORequestCountPowerLogger_flushToPowerLog__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    a3 = *(void *)(a3 + 8);
  }
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

+ (void)submitBackgroundTasksNeededDuringDaemonStart
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (BackgroundSystemTasksLibraryCore())
  {
    self;
    if (BackgroundSystemTasksLibraryCore())
    {
      uint64_t v2 = [getBGSystemTaskSchedulerClass() sharedScheduler];
      id v13 = 0;
      char v3 = [v2 cancelTaskRequestWithIdentifier:@"com.apple.geod.RequestCountPowerLogger" error:&v13];
      id v4 = v13;

      if ((v3 & 1) == 0)
      {
        uint64_t v5 = GEOGetRequestCountPowerLoggerLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          objc_super v15 = @"com.apple.geod.RequestCountPowerLogger";
          __int16 v16 = 2112;
          id v17 = v4;
          _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "Trouble cancelling %@ with error %@", buf, 0x16u);
        }
      }
    }
    uint64_t v6 = (void *)[objc_alloc((Class)getBGRepeatingSystemTaskRequestClass()) initWithIdentifier:@"com.apple.geod.RequestCountPowerLogger"];
    objc_msgSend(v6, "setInterval:", (double)GEOConfigGetUint64(GeoServicesConfig_RequestCountPowerLogFlushInterval, (uint64_t)off_1E91139C8));
    [v6 setRequiresNetworkConnectivity:0];
    dispatch_source_t v7 = [getBGSystemTaskSchedulerClass() sharedScheduler];
    id v12 = 0;
    char v8 = [v7 submitTaskRequest:v6 error:&v12];
    char v9 = (__CFString *)v12;

    if ((v8 & 1) == 0)
    {
      uint64_t v10 = GEOGetRequestCountPowerLoggerLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = @"Unknown";
        if (v9) {
          uint64_t v11 = v9;
        }
        *(_DWORD *)buf = 138412290;
        objc_super v15 = v11;
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "Failed to submit task with error: %@", buf, 0xCu);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeTimer, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_isolater, 0);
}

@end