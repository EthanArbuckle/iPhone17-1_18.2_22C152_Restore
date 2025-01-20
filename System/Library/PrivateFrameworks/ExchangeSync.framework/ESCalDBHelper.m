@interface ESCalDBHelper
+ (id)_canonicalizePath:(id)a3;
+ (id)containerProvider;
+ (id)mainDatabasePath;
+ (void)setMainDatabasePath:(id)a3 containerProvider:(id)a4;
- (BOOL)_saveDatabase:(CalDatabase *)a3 path:(id)a4 fushCaches:(BOOL)a5;
- (BOOL)closeDatabaseForAccountID:(id)a3 save:(BOOL)a4;
- (BOOL)closeDatabaseForAuxDatabaseRef:(void *)a3 save:(BOOL)a4;
- (BOOL)saveDatabaseForAccountID:(id)a3 flushCaches:(BOOL)a4;
- (BOOL)saveDatabaseForAuxDatabaseRef:(void *)a3 flushCaches:(BOOL)a4;
- (CalDatabase)_cachedDatabaseForAccountID:(id)a3 path:(id *)a4;
- (CalDatabase)_cachedDatabaseForAuxDatabaseRef:(void *)a3 path:(id *)a4;
- (CalDatabase)databaseForAccountID:(id)a3;
- (CalDatabase)databaseForAuxDatabaseRef:(void *)a3;
- (ESCalDBHelper)initWithDatabaseInitOptions:(int)a3;
- (NSString)clientIdentifier;
- (id)_mainDatabasePath;
- (id)_pathForAccountID:(id)a3 createdDatabase:(CalDatabase *)a4;
- (id)allOpenDatabases;
- (void)_closeDatabase:(CalDatabase *)a3 path:(id)a4;
- (void)_openDatabaseForPath:(id)a3 clientID:(id)a4 createdDatabaseToConsume:(CalDatabase *)a5;
- (void)_registerForCalendarYieldNotificationsForDB:(CalDatabase *)a3;
- (void)openDatabaseForAccountID:(id)a3 clientID:(id)a4;
- (void)openDatabaseForAuxDatabaseRef:(void *)a3 clientID:(id)a4;
@end

@implementation ESCalDBHelper

- (ESCalDBHelper)initWithDatabaseInitOptions:(int)a3
{
  v17.receiver = self;
  v17.super_class = (Class)ESCalDBHelper;
  v4 = [(ESCalDBHelper *)&v17 init];
  v5 = v4;
  if (v4)
  {
    v4->_initOptions = a3;
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.dataaccessd.calDBQueue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_opt_new();
    containerPathsByAccountID = v5->_containerPathsByAccountID;
    v5->_containerPathsByAccountID = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    containerPathsByAuxDatabaseID = v5->_containerPathsByAuxDatabaseID;
    v5->_containerPathsByAuxDatabaseID = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    databasesByContainerPath = v5->_databasesByContainerPath;
    v5->_databasesByContainerPath = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    connectionCountsByPath = v5->_connectionCountsByPath;
    v5->_connectionCountsByPath = (NSCountedSet *)v14;
  }
  return v5;
}

- (id)_mainDatabasePath
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_cachedMainDatabasePath)
  {
    v3 = objc_opt_class();
    uint64_t v4 = _mainDatabasePathOverride;
    v5 = (void *)_mainDatabasePathOverride;
    if (!_mainDatabasePathOverride) {
      v5 = (void *)CalDatabaseCopyDirectoryPath();
    }
    dispatch_queue_t v6 = [v3 _canonicalizePath:v5];
    cachedMainDatabasePath = self->_cachedMainDatabasePath;
    self->_cachedMainDatabasePath = v6;

    if (!v4) {
  }
    }
  uint64_t v8 = self->_cachedMainDatabasePath;
  return v8;
}

- (void)openDatabaseForAccountID:(id)a3 clientID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__ESCalDBHelper_openDatabaseForAccountID_clientID___block_invoke;
  block[3] = &unk_264DA1968;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __51__ESCalDBHelper_openDatabaseForAccountID_clientID___block_invoke(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    uint64_t v4 = [v2 _pathForAccountID:v3 createdDatabase:&v6];
    uint64_t v5 = v6;
  }
  else
  {
    uint64_t v4 = [v2 _mainDatabasePath];
    uint64_t v5 = 0;
  }
  [*(id *)(a1 + 40) _openDatabaseForPath:v4 clientID:*(void *)(a1 + 48) createdDatabaseToConsume:v5];
}

- (id)_pathForAccountID:(id)a3 createdDatabase:(CalDatabase *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = [(NSMutableDictionary *)self->_containerPathsByAccountID objectForKeyedSubscript:v6];
  if (!v7)
  {
    uint64_t v8 = CalDatabaseCreateWithOptionsMainDatabaseDirectoryAndContainerProviderForAccountID();
    if (v8)
    {
      id v9 = (CalDatabase *)v8;
      uint64_t v10 = CalDatabaseCopyDirectoryPathForDatabase();
      v11 = (void *)v10;
      if (a4)
      {
        *a4 = v9;
        if (v10)
        {
LABEL_5:
          id v7 = [(id)objc_opt_class() _canonicalizePath:v11];

          [(NSMutableDictionary *)self->_containerPathsByAccountID setObject:v7 forKeyedSubscript:v6];
          goto LABEL_10;
        }
      }
      else
      {
        CFRelease(v9);
        if (v11) {
          goto LABEL_5;
        }
      }
    }
    id v12 = DALoggingwithCategory();
    os_log_type_t v13 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v12, v13))
    {
      int v15 = 138543362;
      id v16 = v6;
      _os_log_impl(&dword_239784000, v12, v13, "Failed to determine database directory path for accountID: %{public}@", (uint8_t *)&v15, 0xCu);
    }

    id v7 = 0;
  }
LABEL_10:

  return v7;
}

- (void)openDatabaseForAuxDatabaseRef:(void *)a3 clientID:(id)a4
{
  id v7 = a4;
  if (!a3)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"ESCalDBHelper.m", 87, @"NULL auxDatabaseRef when trying to open aux database for client: %@", v7 object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__ESCalDBHelper_openDatabaseForAuxDatabaseRef_clientID___block_invoke;
  block[3] = &unk_264DA1990;
  id v12 = v7;
  os_log_type_t v13 = a3;
  void block[4] = self;
  id v9 = v7;
  dispatch_sync(queue, block);
}

void __56__ESCalDBHelper_openDatabaseForAuxDatabaseRef_clientID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [NSNumber numberWithInt:CalAuxDatabaseGetUID()];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:v2];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = 0;
LABEL_3:
    [*(id *)(a1 + 32) _openDatabaseForPath:v4 clientID:*(void *)(a1 + 40) createdDatabaseToConsume:v5];

    goto LABEL_4;
  }
  CalGetDatabaseForRecord();
  uint64_t v5 = (const void *)CalDatabaseCreateWithAuxDatabaseRef();
  if (v5)
  {
    uint64_t v6 = CalDatabaseCopyDirectoryPathForDatabase();
    if (v6)
    {
      id v7 = (void *)v6;
      uint64_t v4 = [(id)objc_opt_class() _canonicalizePath:v6];

      [*(id *)(*(void *)(a1 + 32) + 40) setObject:v4 forKeyedSubscript:v2];
      goto LABEL_3;
    }
  }
  uint64_t v8 = DALoggingwithCategory();
  os_log_type_t v9 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v8, v9))
  {
    int v10 = 138543362;
    v11 = v2;
    _os_log_impl(&dword_239784000, v8, v9, "Failed to determine database directory path for auxDatabaseID: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  if (v5) {
    CFRelease(v5);
  }
LABEL_4:
}

- (id)allOpenDatabases
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  os_log_type_t v9 = __Block_byref_object_copy_;
  int v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__ESCalDBHelper_allOpenDatabases__block_invoke;
  v5[3] = &unk_264DA19B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __33__ESCalDBHelper_allOpenDatabases__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) allValues];
  return MEMORY[0x270F9A758]();
}

- (CalDatabase)databaseForAccountID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  os_log_type_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__ESCalDBHelper_databaseForAccountID___block_invoke;
  block[3] = &unk_264DA19E0;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (CalDatabase *)v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

CFTypeRef __38__ESCalDBHelper_databaseForAccountID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _cachedDatabaseForAccountID:*(void *)(a1 + 40) path:0];
  CFTypeRef result = *(CFTypeRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (result)
  {
    CFTypeRef v3 = CFRetain(result);
    return CFAutorelease(v3);
  }
  return result;
}

- (CalDatabase)databaseForAuxDatabaseRef:(void *)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__ESCalDBHelper_databaseForAuxDatabaseRef___block_invoke;
  block[3] = &unk_264DA1A08;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  id v4 = (CalDatabase *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __43__ESCalDBHelper_databaseForAuxDatabaseRef___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _cachedDatabaseForAuxDatabaseRef:*(void *)(a1 + 48) path:0];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)saveDatabaseForAccountID:(id)a3 flushCaches:(BOOL)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__ESCalDBHelper_saveDatabaseForAccountID_flushCaches___block_invoke;
  v10[3] = &unk_264DA1A30;
  v10[4] = self;
  id v11 = v6;
  uint64_t v12 = &v14;
  BOOL v13 = a4;
  id v8 = v6;
  dispatch_sync(queue, v10);
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

void __54__ESCalDBHelper_saveDatabaseForAccountID_flushCaches___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 8);
  id v8 = 0;
  uint64_t v5 = [v2 _cachedDatabaseForAccountID:v4 path:&v8];
  id v6 = v8;
  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _saveDatabase:v5 path:v6 fushCaches:*(unsigned __int8 *)(a1 + 56)];
  }
  else
  {
    uint64_t v7 = DALoggingwithCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __54__ESCalDBHelper_saveDatabaseForAccountID_flushCaches___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (BOOL)saveDatabaseForAuxDatabaseRef:(void *)a3 flushCaches:(BOOL)a4
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__ESCalDBHelper_saveDatabaseForAuxDatabaseRef_flushCaches___block_invoke;
  v7[3] = &unk_264DA1A58;
  v7[5] = &v9;
  v7[6] = a3;
  v7[4] = self;
  BOOL v8 = a4;
  dispatch_sync(queue, v7);
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __59__ESCalDBHelper_saveDatabaseForAuxDatabaseRef_flushCaches___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 16);
  id v8 = 0;
  uint64_t v5 = [v2 _cachedDatabaseForAuxDatabaseRef:v4 path:&v8];
  id v6 = v8;
  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _saveDatabase:v5 path:v6 fushCaches:*(unsigned __int8 *)(a1 + 56)];
  }
  else
  {
    uint64_t v7 = DALoggingwithCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __59__ESCalDBHelper_saveDatabaseForAuxDatabaseRef_flushCaches___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (BOOL)closeDatabaseForAccountID:(id)a3 save:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = !v4
    || [(ESCalDBHelper *)self saveDatabaseForAccountID:v6 flushCaches:0];
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__ESCalDBHelper_closeDatabaseForAccountID_save___block_invoke;
  v11[3] = &unk_264DA1A80;
  v11[4] = self;
  id v12 = v6;
  id v9 = v6;
  dispatch_sync(queue, v11);

  return v7;
}

void __48__ESCalDBHelper_closeDatabaseForAccountID_save___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  v1 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 8);
  id v7 = 0;
  uint64_t v4 = [v1 _cachedDatabaseForAccountID:v3 path:&v7];
  id v5 = v7;
  if (v4)
  {
    [*(id *)v2 _closeDatabase:v4 path:v5];
  }
  else
  {
    id v6 = DALoggingwithCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __48__ESCalDBHelper_closeDatabaseForAccountID_save___block_invoke_cold_1();
    }
  }
}

- (BOOL)closeDatabaseForAuxDatabaseRef:(void *)a3 save:(BOOL)a4
{
  BOOL v6 = !a4
    || [(ESCalDBHelper *)self saveDatabaseForAuxDatabaseRef:a3 flushCaches:0];
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__ESCalDBHelper_closeDatabaseForAuxDatabaseRef_save___block_invoke;
  v9[3] = &unk_264DA1AA8;
  v9[4] = self;
  v9[5] = a3;
  dispatch_sync(queue, v9);
  return v6;
}

void __53__ESCalDBHelper_closeDatabaseForAuxDatabaseRef_save___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  v1 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 8);
  id v7 = 0;
  uint64_t v4 = [v1 _cachedDatabaseForAuxDatabaseRef:v3 path:&v7];
  id v5 = v7;
  if (v4)
  {
    [*(id *)v2 _closeDatabase:v4 path:v5];
  }
  else
  {
    BOOL v6 = DALoggingwithCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __53__ESCalDBHelper_closeDatabaseForAuxDatabaseRef_save___block_invoke_cold_1();
    }
  }
}

- (void)_openDatabaseForPath:(id)a3 clientID:(id)a4 createdDatabaseToConsume:(CalDatabase *)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a3;
  uint64_t v10 = (CalDatabase *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v11 = [(NSMutableDictionary *)self->_databasesByContainerPath objectForKeyedSubscript:v9];

  uint64_t v12 = MEMORY[0x263F38F90];
  if (v10 && v11)
  {
    if (([(CalDatabase *)v10 isEqual:self->_clientIdentifier] & 1) == 0)
    {
      BOOL v13 = [MEMORY[0x263F08690] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"ESCalDBHelper.m", 225, @"Client identifier is different. Expected \"%@\" but got \"%@\"", self->_clientIdentifier, v10 object file lineNumber description];
    }
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    BOOL v14 = 0;
    goto LABEL_7;
  }
  v21 = DALoggingwithCategory();
  os_log_type_t v22 = *(unsigned char *)(v12 + 7);
  if (os_log_type_enabled(v21, v22))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v10;
    _os_log_impl(&dword_239784000, v21, v22, "Creating calendar database for clientID %{public}@", buf, 0xCu);
  }

  BOOL v14 = a5 != 0;
  if (a5)
  {
    v23 = DALoggingwithCategory();
    if (os_log_type_enabled(v23, v22))
    {
      *(_DWORD *)buf = 134349056;
      v28 = a5;
      _os_log_impl(&dword_239784000, v23, v22, "Using already-created calendar database %{public}p", buf, 0xCu);
    }
    uint64_t v11 = a5;
  }
  else
  {
    v24 = [(ESCalDBHelper *)self _mainDatabasePath];
    [v24 isEqualToString:v9];

    v23 = [NSURL fileURLWithPath:v9];
    uint64_t v11 = (CalDatabase *)CalDatabaseCreateWithOptionsDatabaseDirectoryURLAndContainerProvider();
    v25 = DALoggingwithCategory();
    if (os_log_type_enabled(v25, v22))
    {
      *(_DWORD *)buf = 134349056;
      v28 = v11;
      _os_log_impl(&dword_239784000, v25, v22, "Created calendar database %{public}p", buf, 0xCu);
    }
  }
  [(NSMutableDictionary *)self->_databasesByContainerPath setObject:v11 forKeyedSubscript:v9];
  [(ESCalDBHelper *)self _registerForCalendarYieldNotificationsForDB:v11];
  if (![(CalDatabase *)v10 length])
  {
    v26 = @"com.apple.dataaccessd.changeinserter";

    uint64_t v10 = (CalDatabase *)v26;
  }
  CalDatabaseSetClientIdentifier();
  objc_storeStrong((id *)&self->_clientIdentifier, v10);
  CalDatabaseSetPropertyModificationLoggingEnabled();
  CFRelease(v11);
LABEL_7:
  [(NSCountedSet *)self->_connectionCountsByPath addObject:v9];
  NSUInteger v15 = [(NSCountedSet *)self->_connectionCountsByPath countForObject:v9];
  uint64_t v16 = DALoggingwithCategory();
  os_log_type_t v17 = *(unsigned char *)(v12 + 7);
  if (os_log_type_enabled(v16, v17))
  {
    *(_DWORD *)buf = 134218498;
    v28 = v11;
    __int16 v29 = 2114;
    v30 = v10;
    __int16 v31 = 2048;
    NSUInteger v32 = v15;
    _os_log_impl(&dword_239784000, v16, v17, "Cal database %p opened for \"%{public}@\". Connection count is now %lu", buf, 0x20u);
  }

  if (v15 >= 2)
  {
    v18 = DALoggingwithCategory();
    os_log_type_t v19 = *(unsigned char *)(v12 + 6);
    if (os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 134217984;
      v28 = (CalDatabase *)v15;
      _os_log_impl(&dword_239784000, v18, v19, "connectionCount is > 1, at %lu", buf, 0xCu);
    }
  }
  if (a5) {
    char v20 = v14;
  }
  else {
    char v20 = 1;
  }
  if ((v20 & 1) == 0) {
    CFRelease(a5);
  }
}

- (CalDatabase)_cachedDatabaseForAccountID:(id)a3 path:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    id v7 = [(ESCalDBHelper *)self _pathForAccountID:v6 createdDatabase:0];
    if (!v7)
    {
LABEL_14:
      BOOL v14 = 0;
      if (!a4) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else
  {
    id v8 = objc_opt_class();
    uint64_t v9 = _mainDatabasePathOverride;
    uint64_t v10 = (void *)_mainDatabasePathOverride;
    if (!_mainDatabasePathOverride) {
      uint64_t v10 = (void *)CalDatabaseCopyDirectoryPath();
    }
    uint64_t v11 = [v8 _canonicalizePath:v10];
    id v7 = (void *)v11;
    if (v9)
    {
      if (!v11) {
        goto LABEL_14;
      }
    }
    else
    {

      if (!v7) {
        goto LABEL_14;
      }
    }
  }
  uint64_t v12 = DALoggingwithCategory();
  os_log_type_t v13 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v12, v13))
  {
    int v16 = 138412290;
    os_log_type_t v17 = v7;
    _os_log_impl(&dword_239784000, v12, v13, "DatabasesByContainerPath: Getting calendar database with path %@", (uint8_t *)&v16, 0xCu);
  }

  BOOL v14 = [(NSMutableDictionary *)self->_databasesByContainerPath objectForKeyedSubscript:v7];

  if (a4) {
LABEL_11:
  }
    *a4 = v7;
LABEL_12:

  return v14;
}

- (CalDatabase)_cachedDatabaseForAuxDatabaseRef:(void *)a3 path:(id *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!a3)
  {
    uint64_t v12 = 0;
    goto LABEL_10;
  }
  uint64_t UID = CalAuxDatabaseGetUID();
  containerPathsByAuxDatabaseID = self->_containerPathsByAuxDatabaseID;
  uint64_t v9 = [NSNumber numberWithInt:UID];
  a3 = [(NSMutableDictionary *)containerPathsByAuxDatabaseID objectForKeyedSubscript:v9];

  if (!a3)
  {
    uint64_t v12 = 0;
    if (!a4) {
      goto LABEL_10;
    }
LABEL_9:
    a3 = a3;
    *a4 = a3;
    goto LABEL_10;
  }
  uint64_t v10 = DALoggingwithCategory();
  os_log_type_t v11 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v10, v11))
  {
    int v14 = 138412290;
    NSUInteger v15 = a3;
    _os_log_impl(&dword_239784000, v10, v11, "DatabasesByContainerPath: Getting aux calendar database with path %@", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v12 = [(NSMutableDictionary *)self->_databasesByContainerPath objectForKeyedSubscript:a3];

  if (a4) {
    goto LABEL_9;
  }
LABEL_10:

  return v12;
}

- (BOOL)_saveDatabase:(CalDatabase *)a3 path:(id)a4 fushCaches:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v9 = +[ESLocalDBWatcher sharedDBWatcher];
  uint64_t v10 = [v9 lastSavedCalSequenceNumberForDatabaseInContainer:v8];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F2FF98], 0, 0, 1u);
  uint64_t v12 = [MEMORY[0x263F38DA0] sharedGateKeeper];
  [v12 claimedOwnershipOfDataclasses:4];

  os_log_type_t v13 = DALoggingwithCategory();
  os_log_type_t v14 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v13, v14))
  {
    NSUInteger v15 = &stru_26ECD03D8;
    if (v5) {
      uint64_t v16 = @", and flushing caches";
    }
    else {
      uint64_t v16 = &stru_26ECD03D8;
    }
    if (v9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @" old sequence %d", v10);
      NSUInteger v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 134218498;
    v26 = a3;
    __int16 v27 = 2114;
    v28 = v16;
    __int16 v29 = 2114;
    v30 = v15;
    _os_log_impl(&dword_239784000, v13, v14, "Saving calendar database %p%{public}@%{public}@.", buf, 0x20u);
    if (v9) {
  }
    }
  if (v9) {
    [v9 setLastSavedCalSequenceNumber:CalDatabaseGetSequenceNumber() forDatabaseInContainer:v8];
  }
  if (v5)
  {
    char v17 = CalDatabaseSaveAndFlushCaches();
    [(ESCalDBHelper *)self _registerForCalendarYieldNotificationsForDB:a3];
    uint64_t v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 postNotificationName:@"CalDBIsClosing" object:0];

    if (v17)
    {
LABEL_13:
      BOOL v19 = 1;
      goto LABEL_24;
    }
  }
  else
  {
    char v20 = CalDatabaseSave();
    [(ESCalDBHelper *)self _registerForCalendarYieldNotificationsForDB:a3];
    if (v20) {
      goto LABEL_13;
    }
  }
  v21 = DALoggingwithCategory();
  if (os_log_type_enabled(v21, v14))
  {
    os_log_type_t v22 = &stru_26ECD03D8;
    if (v5) {
      os_log_type_t v22 = @", and flushing caches";
    }
    *(_DWORD *)buf = 134218242;
    v26 = a3;
    __int16 v27 = 2114;
    v28 = v22;
    _os_log_impl(&dword_239784000, v21, v14, "Saving calendar database %p%{public}@.  Save failed", buf, 0x16u);
  }

  if (v9)
  {
    v23 = DALoggingwithCategory();
    if (os_log_type_enabled(v23, v14))
    {
      *(_DWORD *)buf = 134218240;
      v26 = a3;
      __int16 v27 = 1024;
      LODWORD(v28) = v10;
      _os_log_impl(&dword_239784000, v23, v14, "Resetting calendar database %p sequence %d", buf, 0x12u);
    }

    [v9 setLastSavedCalSequenceNumber:v10 forDatabaseInContainer:v8];
  }
  BOOL v19 = 0;
LABEL_24:

  return v19;
}

- (void)_closeDatabase:(CalDatabase *)a3 path:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = (CalDatabase *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  NSUInteger v7 = [(NSCountedSet *)self->_connectionCountsByPath countForObject:v6];
  if (!v7)
  {
    os_log_type_t v14 = DALoggingwithCategory();
    os_log_type_t v15 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v14, v15))
    {
      int v16 = 138543362;
      char v17 = v6;
      _os_log_impl(&dword_239784000, v14, v15, "_closeDatabase called too many times with path: %{public}@", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_11;
  }
  NSUInteger v8 = v7;
  [(NSCountedSet *)self->_connectionCountsByPath removeObject:v6];
  uint64_t v9 = DALoggingwithCategory();
  os_log_type_t v10 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v9, v10))
  {
    clientIdentifier = self->_clientIdentifier;
    int v16 = 134218498;
    char v17 = a3;
    __int16 v18 = 2048;
    NSUInteger v19 = v8 - 1;
    __int16 v20 = 2114;
    v21 = clientIdentifier;
    _os_log_impl(&dword_239784000, v9, v10, "Decrementing database %p reference count. connectionCount is %lu. Client identifier is \"%{public}@\"", (uint8_t *)&v16, 0x20u);
  }

  if (v8 == 1)
  {
    uint64_t v12 = DALoggingwithCategory();
    if (os_log_type_enabled(v12, v10))
    {
      int v16 = 138412290;
      char v17 = v6;
      _os_log_impl(&dword_239784000, v12, v10, "DatabasesByContainerPath: Destroying calendar database for path %@", (uint8_t *)&v16, 0xCu);
    }

    os_log_type_t v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 postNotificationName:@"CalDBIsClosing" object:0];

    CalDatabaseRegisterYieldBlock();
    [(NSMutableDictionary *)self->_databasesByContainerPath setObject:0 forKeyedSubscript:v6];
    if (![(NSCountedSet *)self->_connectionCountsByPath count])
    {
      os_log_type_t v14 = self->_clientIdentifier;
      self->_clientIdentifier = 0;
LABEL_11:
    }
  }
}

- (void)_registerForCalendarYieldNotificationsForDB:(CalDatabase *)a3
{
  if (a3) {
    CalDatabaseRegisterYieldBlock();
  }
}

void __61__ESCalDBHelper__registerForCalendarYieldNotificationsForDB___block_invoke(uint64_t a1)
{
  uint64_t v2 = DALoggingwithCategory();
  os_log_type_t v3 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_239784000, v2, v3, "Someone asked us to yield the calendar database. Bumping up all clients to UI priority", buf, 2u);
  }

  uint64_t v4 = [MEMORY[0x263F38DB8] sharedManager];
  [v4 bumpDataclassesToUIPriority:20];

  BOOL v5 = *(const void **)(a1 + 32);
  if (v5)
  {
    CFRetain(v5);
    id v6 = dataaccess_get_global_queue();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__ESCalDBHelper__registerForCalendarYieldNotificationsForDB___block_invoke_30;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v6, block);
  }
}

void __61__ESCalDBHelper__registerForCalendarYieldNotificationsForDB___block_invoke_30(uint64_t a1)
{
  CalDatabaseRegisterYieldBlock();
  uint64_t v2 = *(const void **)(a1 + 32);
  CFRelease(v2);
}

+ (id)_canonicalizePath:(id)a3
{
  return (id)[a3 removeSlashIfNeeded];
}

+ (void)setMainDatabasePath:(id)a3 containerProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  NSUInteger v7 = (void *)_mainDatabasePathOverride;
  _mainDatabasePathOverride = (uint64_t)v5;
  id v9 = v5;

  NSUInteger v8 = (void *)_containerProvider;
  _containerProvider = (uint64_t)v6;
}

+ (id)mainDatabasePath
{
  return (id)_mainDatabasePathOverride;
}

+ (id)containerProvider
{
  return (id)_containerProvider;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_connectionCountsByPath, 0);
  objc_storeStrong((id *)&self->_databasesByContainerPath, 0);
  objc_storeStrong((id *)&self->_containerPathsByAuxDatabaseID, 0);
  objc_storeStrong((id *)&self->_containerPathsByAccountID, 0);
  objc_storeStrong((id *)&self->_cachedMainDatabasePath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __54__ESCalDBHelper_saveDatabaseForAccountID_flushCaches___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  v0 = (void *)OUTLINED_FUNCTION_2();
  id v1 = OUTLINED_FUNCTION_0(v0);
  OUTLINED_FUNCTION_4(&dword_239784000, v2, v3, "%@: tried to save a database that was never opened. accountID: %@", v4, v5, v6, v7, v8);
}

void __59__ESCalDBHelper_saveDatabaseForAuxDatabaseRef_flushCaches___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  id v0 = (id)OUTLINED_FUNCTION_2();
  CalAuxDatabaseGetUID();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_239784000, v1, v2, "%@: tried to save a database that was never opened. auxDatabaseID: %d", v3, v4, v5, v6, v7);
}

void __48__ESCalDBHelper_closeDatabaseForAccountID_save___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  id v0 = (void *)OUTLINED_FUNCTION_2();
  id v1 = OUTLINED_FUNCTION_0(v0);
  OUTLINED_FUNCTION_4(&dword_239784000, v2, v3, "%@: tried to close a database that was never opened. accountID: %@", v4, v5, v6, v7, v8);
}

void __53__ESCalDBHelper_closeDatabaseForAuxDatabaseRef_save___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  id v0 = (id)OUTLINED_FUNCTION_2();
  CalAuxDatabaseGetUID();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_239784000, v1, v2, "%@: tried to close a database that was never opened. auxDatabaseID: %d", v3, v4, v5, v6, v7);
}

@end