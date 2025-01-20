@interface DACalDBHelper
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
- (DACalDBHelper)initWithDatabaseInitOptions:(int)a3;
- (DALocalDBWatcher)watcher;
- (id)_mainDatabasePath;
- (id)_pathForAccountID:(id)a3 createdDatabase:(CalDatabase *)a4;
- (id)allOpenDatabases;
- (void)_closeDatabase:(CalDatabase *)a3 path:(id)a4;
- (void)_openDatabaseForPath:(id)a3 clientID:(id)a4 createdDatabaseToConsume:(CalDatabase *)a5;
- (void)_registerForCalendarYieldNotificationsForDB:(CalDatabase *)a3;
- (void)openDatabaseForAccountID:(id)a3 clientID:(id)a4;
- (void)openDatabaseForAuxDatabaseRef:(void *)a3 clientID:(id)a4;
- (void)setWatcher:(id)a3;
@end

@implementation DACalDBHelper

- (DACalDBHelper)initWithDatabaseInitOptions:(int)a3
{
  v17.receiver = self;
  v17.super_class = (Class)DACalDBHelper;
  v4 = [(DACalDBHelper *)&v17 init];
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
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__DACalDBHelper_openDatabaseForAccountID_clientID___block_invoke;
  block[3] = &unk_1E6211548;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __51__DACalDBHelper_openDatabaseForAccountID_clientID___block_invoke(uint64_t a1)
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = [(NSMutableDictionary *)self->_containerPathsByAccountID objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F57468]);
    id v9 = (void *)[v8 initWithDirectoryURL:_mainDatabasePathOverride];
    [v9 setOptions:self->_initOptions];
    if (_containerProvider) {
      objc_msgSend(v9, "setDataContainerProvider:");
    }
    uint64_t v10 = CalDatabaseCreateWithConfigurationForAccountID();
    if (v10)
    {
      v11 = (CalDatabase *)v10;
      uint64_t v12 = CalDatabaseCopyDirectoryPathForDatabase();
      v13 = (void *)v12;
      if (a4)
      {
        *a4 = v11;
        if (v12)
        {
LABEL_7:
          id v7 = [(id)objc_opt_class() _canonicalizePath:v13];

          [(NSMutableDictionary *)self->_containerPathsByAccountID setObject:v7 forKeyedSubscript:v6];
          goto LABEL_12;
        }
      }
      else
      {
        CFRelease(v11);
        if (v13) {
          goto LABEL_7;
        }
      }
    }
    id v14 = DALoggingwithCategory();
    os_log_type_t v15 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v14, v15))
    {
      int v17 = 138543362;
      id v18 = v6;
      _os_log_impl(&dword_1BA384000, v14, v15, "Failed to determine database directory path for accountID: %{public}@", (uint8_t *)&v17, 0xCu);
    }

    id v7 = 0;
  }
LABEL_12:

  return v7;
}

- (void)openDatabaseForAuxDatabaseRef:(void *)a3 clientID:(id)a4
{
  id v7 = a4;
  if (!a3)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"DACalDBHelper.m", 90, @"NULL auxDatabaseRef when trying to open aux database for client: %@", v7 object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__DACalDBHelper_openDatabaseForAuxDatabaseRef_clientID___block_invoke;
  block[3] = &unk_1E62117B8;
  id v12 = v7;
  v13 = a3;
  void block[4] = self;
  id v9 = v7;
  dispatch_sync(queue, block);
}

void __56__DACalDBHelper_openDatabaseForAuxDatabaseRef_clientID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
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
  id v8 = DALoggingwithCategory();
  os_log_type_t v9 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v8, v9))
  {
    int v10 = 138543362;
    v11 = v2;
    _os_log_impl(&dword_1BA384000, v8, v9, "Failed to determine database directory path for auxDatabaseID: %{public}@", (uint8_t *)&v10, 0xCu);
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
  os_log_type_t v9 = __Block_byref_object_copy__0;
  int v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__DACalDBHelper_allOpenDatabases__block_invoke;
  v5[3] = &unk_1E62117E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __33__DACalDBHelper_allOpenDatabases__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) allValues];
  return MEMORY[0x1F41817F8]();
}

- (CalDatabase)databaseForAccountID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__DACalDBHelper_databaseForAccountID___block_invoke;
  block[3] = &unk_1E6211810;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (CalDatabase *)v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

CFTypeRef __38__DACalDBHelper_databaseForAccountID___block_invoke(uint64_t a1)
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
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__DACalDBHelper_databaseForAuxDatabaseRef___block_invoke;
  block[3] = &unk_1E6211838;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  id v4 = (CalDatabase *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __43__DACalDBHelper_databaseForAuxDatabaseRef___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _cachedDatabaseForAuxDatabaseRef:*(void *)(a1 + 48) path:0];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)saveDatabaseForAccountID:(id)a3 flushCaches:(BOOL)a4
{
  id v7 = a3;
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__DACalDBHelper_saveDatabaseForAccountID_flushCaches___block_invoke;
  block[3] = &unk_1E6211860;
  void block[4] = self;
  id v12 = v7;
  v13 = &v16;
  SEL v14 = a2;
  BOOL v15 = a4;
  id v9 = v7;
  dispatch_sync(queue, block);
  LOBYTE(a2) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)a2;
}

void __54__DACalDBHelper_saveDatabaseForAccountID_flushCaches___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = 0;
  uint64_t v4 = [v2 _cachedDatabaseForAccountID:v3 path:&v7];
  id v5 = v7;
  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _saveDatabase:v4 path:v5 fushCaches:*(unsigned __int8 *)(a1 + 64)];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"DACalDBHelper.m", 156, @"%@: tried to save a database that was never opened. accountID: %@", objc_opt_class(), *(void *)(a1 + 40) object file lineNumber description];

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
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__DACalDBHelper_saveDatabaseForAuxDatabaseRef_flushCaches___block_invoke;
  block[3] = &unk_1E6211888;
  block[6] = a3;
  void block[7] = a2;
  void block[4] = self;
  void block[5] = &v9;
  BOOL v8 = a4;
  dispatch_sync(queue, block);
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __59__DACalDBHelper_saveDatabaseForAuxDatabaseRef_flushCaches___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  id v10 = 0;
  uint64_t v4 = [v2 _cachedDatabaseForAuxDatabaseRef:v3 path:&v10];
  id v5 = v10;
  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _saveDatabase:v4 path:v5 fushCaches:*(unsigned __int8 *)(a1 + 64)];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = objc_opt_class();
    [v6 handleFailureInMethod:v7, v8, @"DACalDBHelper.m", 174, @"%@: tried to save a database that was never opened. auxDatabaseID: %d", v9, CalAuxDatabaseGetUID() object file lineNumber description];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (BOOL)closeDatabaseForAccountID:(id)a3 save:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  BOOL v8 = !v4
    || [(DACalDBHelper *)self saveDatabaseForAccountID:v7 flushCaches:0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__DACalDBHelper_closeDatabaseForAccountID_save___block_invoke;
  block[3] = &unk_1E62117B8;
  void block[4] = self;
  id v13 = v7;
  SEL v14 = a2;
  id v10 = v7;
  dispatch_sync(queue, block);

  return v8;
}

void __48__DACalDBHelper_closeDatabaseForAccountID_save___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = 0;
  uint64_t v4 = [v2 _cachedDatabaseForAccountID:v3 path:&v7];
  id v5 = v7;
  if (v4)
  {
    [*(id *)(a1 + 32) _closeDatabase:v4 path:v5];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"DACalDBHelper.m", 195, @"%@: tried to close a database that was never opened. accountID: %@", objc_opt_class(), *(void *)(a1 + 40) object file lineNumber description];
  }
}

- (BOOL)closeDatabaseForAuxDatabaseRef:(void *)a3 save:(BOOL)a4
{
  BOOL v7 = !a4
    || [(DACalDBHelper *)self saveDatabaseForAuxDatabaseRef:a3 flushCaches:0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__DACalDBHelper_closeDatabaseForAuxDatabaseRef_save___block_invoke;
  block[3] = &unk_1E62118B0;
  void block[4] = self;
  void block[5] = a3;
  block[6] = a2;
  dispatch_sync(queue, block);
  return v7;
}

void __53__DACalDBHelper_closeDatabaseForAuxDatabaseRef_save___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v10 = 0;
  uint64_t v4 = [v2 _cachedDatabaseForAuxDatabaseRef:v3 path:&v10];
  id v5 = v10;
  if (v4)
  {
    [*(id *)(a1 + 32) _closeDatabase:v4 path:v5];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = objc_opt_class();
    [v6 handleFailureInMethod:v7, v8, @"DACalDBHelper.m", 215, @"%@: tried to close a database that was never opened. auxDatabaseID: %d", v9, CalAuxDatabaseGetUID() object file lineNumber description];
  }
}

- (void)_openDatabaseForPath:(id)a3 clientID:(id)a4 createdDatabaseToConsume:(CalDatabase *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (CalDatabase *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v11 = [(NSMutableDictionary *)self->_databasesByContainerPath objectForKeyedSubscript:v9];

  uint64_t v12 = MEMORY[0x1E4F5E9A0];
  if (v11)
  {
    id v13 = (void *)CalDatabaseCopyClientIdentifier();
    if (v10 && ([(CalDatabase *)v10 isEqual:v13] & 1) == 0)
    {
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2, self, @"DACalDBHelper.m", 232, @"Client identifier is different. Expected \"%@\" but got \"%@\"", v13, v10 object file lineNumber description];
    }
    BOOL v14 = 0;
  }
  else
  {
    BOOL v15 = DALoggingwithCategory();
    os_log_type_t v16 = *(unsigned char *)(v12 + 7);
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v10;
      _os_log_impl(&dword_1BA384000, v15, v16, "Creating calendar database for clientID %{public}@", buf, 0xCu);
    }

    BOOL v14 = a5 != 0;
    if (a5)
    {
      int v17 = DALoggingwithCategory();
      if (os_log_type_enabled(v17, v16))
      {
        *(_DWORD *)buf = 134349056;
        v29 = a5;
        _os_log_impl(&dword_1BA384000, v17, v16, "Using already-created calendar database %{public}p", buf, 0xCu);
      }
      uint64_t v11 = a5;
    }
    else
    {
      uint64_t v18 = [(DACalDBHelper *)self _mainDatabasePath];
      [v18 isEqualToString:v9];

      int v17 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
      uint64_t v11 = (CalDatabase *)CalDatabaseCreateWithOptionsDatabaseDirectoryURLAndContainerProvider();
      char v19 = DALoggingwithCategory();
      if (os_log_type_enabled(v19, v16))
      {
        *(_DWORD *)buf = 134349056;
        v29 = v11;
        _os_log_impl(&dword_1BA384000, v19, v16, "Created calendar database %{public}p", buf, 0xCu);
      }
    }
    [(NSMutableDictionary *)self->_databasesByContainerPath setObject:v11 forKeyedSubscript:v9];
    [(DACalDBHelper *)self _registerForCalendarYieldNotificationsForDB:v11];
    if (![(CalDatabase *)v10 length])
    {
      v20 = @"com.apple.dataaccessd.changeinserter";

      id v10 = (CalDatabase *)v20;
    }
    CalDatabaseSetClientIdentifier();
    CalDatabaseSetPropertyModificationLoggingEnabled();
    CFRelease(v11);
    id v13 = 0;
  }
  [(NSCountedSet *)self->_connectionCountsByPath addObject:v9];
  NSUInteger v21 = [(NSCountedSet *)self->_connectionCountsByPath countForObject:v9];
  v22 = DALoggingwithCategory();
  os_log_type_t v23 = *(unsigned char *)(v12 + 7);
  if (os_log_type_enabled(v22, v23))
  {
    *(_DWORD *)buf = 134218498;
    v29 = v11;
    __int16 v30 = 2114;
    v31 = v10;
    __int16 v32 = 2048;
    NSUInteger v33 = v21;
    _os_log_impl(&dword_1BA384000, v22, v23, "Cal database %p opened for \"%{public}@\". Connection count is now %lu", buf, 0x20u);
  }

  if (v21 >= 2)
  {
    v24 = DALoggingwithCategory();
    os_log_type_t v25 = *(unsigned char *)(v12 + 6);
    if (os_log_type_enabled(v24, v25))
    {
      *(_DWORD *)buf = 134217984;
      v29 = (CalDatabase *)v21;
      _os_log_impl(&dword_1BA384000, v24, v25, "connectionCount is > 1, at %lu", buf, 0xCu);
    }
  }
  if (a5) {
    char v26 = v14;
  }
  else {
    char v26 = 1;
  }
  if ((v26 & 1) == 0) {
    CFRelease(a5);
  }
}

- (CalDatabase)_cachedDatabaseForAccountID:(id)a3 path:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    uint64_t v7 = [(DACalDBHelper *)self _pathForAccountID:v6 createdDatabase:0];
    if (!v7)
    {
LABEL_12:
      uint64_t v12 = 0;
      if (!a4) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = _mainDatabasePathOverride;
    id v10 = (void *)_mainDatabasePathOverride;
    if (!_mainDatabasePathOverride) {
      id v10 = (void *)CalDatabaseCopyDirectoryPath();
    }
    uint64_t v11 = [v8 _canonicalizePath:v10];
    uint64_t v7 = (void *)v11;
    if (v9)
    {
      if (!v11) {
        goto LABEL_12;
      }
    }
    else
    {

      if (!v7) {
        goto LABEL_12;
      }
    }
  }
  uint64_t v12 = [(NSMutableDictionary *)self->_databasesByContainerPath objectForKeyedSubscript:v7];

  if (a4) {
LABEL_9:
  }
    *a4 = v7;
LABEL_10:

  return v12;
}

- (CalDatabase)_cachedDatabaseForAuxDatabaseRef:(void *)a3 path:(id *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3)
  {
    uint64_t UID = CalAuxDatabaseGetUID();
    containerPathsByAuxDatabaseID = self->_containerPathsByAuxDatabaseID;
    uint64_t v9 = [NSNumber numberWithInt:UID];
    a3 = [(NSMutableDictionary *)containerPathsByAuxDatabaseID objectForKeyedSubscript:v9];

    if (a3)
    {
      id v10 = [(NSMutableDictionary *)self->_databasesByContainerPath objectForKeyedSubscript:a3];

      if (!a4) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    id v10 = 0;
    if (a4)
    {
LABEL_7:
      a3 = a3;
      *a4 = a3;
    }
  }
  else
  {
    id v10 = 0;
  }
LABEL_8:

  return v10;
}

- (BOOL)_saveDatabase:(CalDatabase *)a3 path:(id)a4 fushCaches:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v9 = [(DALocalDBWatcher *)self->_watcher lastSavedCalSequenceNumberForDatabaseInContainer:v8];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E4F57538], 0, 0, 1u);
  uint64_t v11 = +[DALocalDBGateKeeper sharedGateKeeper];
  [v11 claimedOwnershipOfDataclasses:4];

  uint64_t v12 = DALoggingwithCategory();
  os_log_type_t v13 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
  if (os_log_type_enabled(v12, v13))
  {
    BOOL v14 = &stru_1F13DB4B0;
    if (v5) {
      BOOL v15 = @", and flushing caches";
    }
    else {
      BOOL v15 = &stru_1F13DB4B0;
    }
    watcher = self->_watcher;
    if (watcher)
    {
      objc_msgSend(NSString, "stringWithFormat:", @" old sequence %d", v9);
      BOOL v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 134218498;
    char v26 = a3;
    __int16 v27 = 2114;
    v28 = v15;
    __int16 v29 = 2114;
    __int16 v30 = v14;
    _os_log_impl(&dword_1BA384000, v12, v13, "Saving calendar database %p%{public}@%{public}@.", buf, 0x20u);
    if (watcher) {
  }
    }
  if (self->_watcher) {
    [(DALocalDBWatcher *)self->_watcher setLastSavedCalSequenceNumber:CalDatabaseGetSequenceNumber() forDatabaseInContainer:v8];
  }
  if (v5)
  {
    char v17 = CalDatabaseSaveAndFlushCaches();
    [(DACalDBHelper *)self _registerForCalendarYieldNotificationsForDB:a3];
    uint64_t v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
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
    [(DACalDBHelper *)self _registerForCalendarYieldNotificationsForDB:a3];
    if (v20) {
      goto LABEL_13;
    }
  }
  NSUInteger v21 = DALoggingwithCategory();
  if (os_log_type_enabled(v21, v13))
  {
    v22 = &stru_1F13DB4B0;
    if (v5) {
      v22 = @", and flushing caches";
    }
    *(_DWORD *)buf = 134218242;
    char v26 = a3;
    __int16 v27 = 2114;
    v28 = v22;
    _os_log_impl(&dword_1BA384000, v21, v13, "Saving calendar database %p%{public}@.  Save failed", buf, 0x16u);
  }

  if (self->_watcher)
  {
    os_log_type_t v23 = DALoggingwithCategory();
    if (os_log_type_enabled(v23, v13))
    {
      *(_DWORD *)buf = 134218240;
      char v26 = a3;
      __int16 v27 = 1024;
      LODWORD(v28) = v9;
      _os_log_impl(&dword_1BA384000, v23, v13, "Resetting calendar database %p sequence %d", buf, 0x12u);
    }

    [(DALocalDBWatcher *)self->_watcher setLastSavedCalSequenceNumber:v9 forDatabaseInContainer:v8];
  }
  BOOL v19 = 0;
LABEL_24:

  return v19;
}

- (void)_closeDatabase:(CalDatabase *)a3 path:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = (CalDatabase *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  NSUInteger v7 = [(NSCountedSet *)self->_connectionCountsByPath countForObject:v6];
  if (v7)
  {
    NSUInteger v8 = v7;
    [(NSCountedSet *)self->_connectionCountsByPath removeObject:v6];
    if (a3) {
      uint64_t v9 = CalDatabaseCopyClientIdentifier();
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v11 = DALoggingwithCategory();
    os_log_type_t v12 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
    if (os_log_type_enabled(v11, v12))
    {
      int v15 = 134218498;
      os_log_type_t v16 = a3;
      __int16 v17 = 2048;
      NSUInteger v18 = v8 - 1;
      __int16 v19 = 2114;
      char v20 = v9;
      _os_log_impl(&dword_1BA384000, v11, v12, "Decrementing database %p reference count. connectionCount is %lu. Client identifier is \"%{public}@\"", (uint8_t *)&v15, 0x20u);
    }

    if (v8 == 1)
    {
      os_log_type_t v13 = DALoggingwithCategory();
      if (os_log_type_enabled(v13, v12))
      {
        int v15 = 134217984;
        os_log_type_t v16 = a3;
        _os_log_impl(&dword_1BA384000, v13, v12, "Destroying calendar database %p", (uint8_t *)&v15, 0xCu);
      }

      BOOL v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 postNotificationName:@"CalDBIsClosing" object:0];

      CalDatabaseRegisterYieldBlock();
      [(NSMutableDictionary *)self->_databasesByContainerPath setObject:0 forKeyedSubscript:v6];
    }
  }
  else
  {
    uint64_t v9 = DALoggingwithCategory();
    os_log_type_t v10 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v9, v10))
    {
      int v15 = 138543362;
      os_log_type_t v16 = v6;
      _os_log_impl(&dword_1BA384000, v9, v10, "_closeDatabase called too many times with path: %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_registerForCalendarYieldNotificationsForDB:(CalDatabase *)a3
{
  if (a3) {
    CalDatabaseRegisterYieldBlock();
  }
}

void __61__DACalDBHelper__registerForCalendarYieldNotificationsForDB___block_invoke(uint64_t a1)
{
  v2 = DALoggingwithCategory();
  os_log_type_t v3 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA384000, v2, v3, "Someone asked us to yield the calendar database. Bumping up all clients to UI priority", buf, 2u);
  }

  uint64_t v4 = +[DAPriorityManager sharedManager];
  [v4 bumpDataclassesToUIPriority:20];

  CFRetain(*(CFTypeRef *)(a1 + 32));
  BOOL v5 = dataaccess_get_global_queue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__DACalDBHelper__registerForCalendarYieldNotificationsForDB___block_invoke_42;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v5, block);
}

void __61__DACalDBHelper__registerForCalendarYieldNotificationsForDB___block_invoke_42(uint64_t a1)
{
  CalDatabaseRegisterYieldBlock();
  v2 = *(const void **)(a1 + 32);
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

- (DALocalDBWatcher)watcher
{
  return self->_watcher;
}

- (void)setWatcher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watcher, 0);
  objc_storeStrong((id *)&self->_connectionCountsByPath, 0);
  objc_storeStrong((id *)&self->_databasesByContainerPath, 0);
  objc_storeStrong((id *)&self->_containerPathsByAuxDatabaseID, 0);
  objc_storeStrong((id *)&self->_containerPathsByAccountID, 0);
  objc_storeStrong((id *)&self->_cachedMainDatabasePath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end