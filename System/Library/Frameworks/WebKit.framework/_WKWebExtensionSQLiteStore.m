@interface _WKWebExtensionSQLiteStore
- (BOOL)_isDatabaseEmpty;
- (BOOL)_isDatabaseOpen;
- (BOOL)_openDatabaseIfNecessaryReturningErrorMessage:(id *)a3;
- (BOOL)_openDatabaseIfNecessaryReturningErrorMessage:(id *)a3 createIfNecessary:(BOOL)a4;
- (BOOL)useInMemoryDatabase;
- (_WKWebExtensionSQLiteStore)initWithUniqueIdentifier:(id)a3 directory:(id)a4 usesInMemoryDatabase:(BOOL)a5;
- (id)_databaseURL;
- (id)_deleteDatabase;
- (id)_deleteDatabaseFileAtURL:(id)a3 reopenDatabase:(BOOL)a4;
- (id)_deleteDatabaseIfEmpty;
- (id)_handleSchemaVersioningWithDeleteDatabaseFileOnError:(BOOL)a3;
- (id)_openDatabase:(id)a3 withAccessType:(int64_t)a4 deleteDatabaseFileOnError:(BOOL)a5;
- (id)_savepointNameFromUUID:(id)a3;
- (int)_createFreshDatabaseSchema;
- (int)_currentDatabaseSchemaVersion;
- (int)_databaseSchemaVersion;
- (int)_migrateToCurrentSchemaVersionIfNeeded;
- (int)_resetDatabaseSchema;
- (int)_setDatabaseSchemaVersion:(int)a3;
- (void)_vacuum;
- (void)close;
- (void)commitSavepoint:(id)a3 completionHandler:(id)a4;
- (void)createSavepointWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)deleteDatabaseWithCompletionHandler:(id)a3;
- (void)rollbackToSavepoint:(id)a3 completionHandler:(id)a4;
@end

@implementation _WKWebExtensionSQLiteStore

- (_WKWebExtensionSQLiteStore)initWithUniqueIdentifier:(id)a3 directory:(id)a4 usesInMemoryDatabase:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_WKWebExtensionSQLiteStore;
  v10 = [(_WKWebExtensionSQLiteStore *)&v20 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    uniqueIdentifier = v10->_uniqueIdentifier;
    v10->_uniqueIdentifier = (NSString *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
    directory = v10->_directory;
    v10->_directory = (NSURL *)v13;

    v10->_useInMemoryDatabase = a5;
    id v15 = [NSString stringWithFormat:@"com.apple.WebKit.WKWebExtensionSQLiteStore.%@", v10->_uniqueIdentifier];
    dispatch_queue_t v16 = dispatch_queue_create((const char *)[v15 cStringUsingEncoding:4], 0);
    databaseQueue = v10->_databaseQueue;
    v10->_databaseQueue = (OS_dispatch_queue *)v16;

    v18 = v10;
  }

  return v10;
}

- (void)dealloc
{
  [(_WKWebExtensionSQLiteStore *)self close];
  v3.receiver = self;
  v3.super_class = (Class)_WKWebExtensionSQLiteStore;
  [(_WKWebExtensionSQLiteStore *)&v3 dealloc];
}

- (void)close
{
  database = self->_database;
  if (database)
  {
    v4 = database;
    v5 = self->_database;
    self->_database = 0;

    int v6 = [MEMORY[0x1E4F29060] isMainThread];
    databaseQueue = self->_databaseQueue;
    if (v6)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __35___WKWebExtensionSQLiteStore_close__block_invoke;
      block[3] = &unk_1E58110E0;
      id v9 = v4;
      dispatch_sync(databaseQueue, block);
    }
    else
    {
      dispatch_assert_queue_V2(databaseQueue);
      [(_WKWebExtensionSQLiteDatabase *)v4 close];
    }
  }
}

- (void)deleteDatabaseWithCompletionHandler:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66___WKWebExtensionSQLiteStore_deleteDatabaseWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5811108;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

- (BOOL)useInMemoryDatabase
{
  return self->_useInMemoryDatabase;
}

- (void)_vacuum
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  int v3 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"VACUUM");
  if (v3 != 101)
  {
    int v4 = v3;
    v5 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uniqueIdentifier = self->_uniqueIdentifier;
      v7 = [(_WKWebExtensionSQLiteDatabase *)self->_database lastErrorMessage];
      int v8 = 138478339;
      id v9 = uniqueIdentifier;
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      __int16 v12 = 1024;
      int v13 = v4;
      _os_log_error_impl(&dword_1985F2000, v5, OS_LOG_TYPE_ERROR, "Failed to vacuum database for extension %{private}@: %{public}@ (%d)", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (BOOL)_openDatabaseIfNecessaryReturningErrorMessage:(id *)a3
{
  return [(_WKWebExtensionSQLiteStore *)self _openDatabaseIfNecessaryReturningErrorMessage:a3 createIfNecessary:1];
}

- (BOOL)_openDatabaseIfNecessaryReturningErrorMessage:(id *)a3 createIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  if ([(_WKWebExtensionSQLiteStore *)self _isDatabaseOpen])
  {
    *a3 = 0;
    return 1;
  }
  else
  {
    if (v4) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    id v9 = [(_WKWebExtensionSQLiteStore *)self _databaseURL];
    *a3 = [(_WKWebExtensionSQLiteStore *)self _openDatabase:v9 withAccessType:v8 deleteDatabaseFileOnError:1];

    return [(_WKWebExtensionSQLiteStore *)self _isDatabaseOpen];
  }
}

- (id)_openDatabase:(id)a3 withAccessType:(int64_t)a4 deleteDatabaseFileOnError:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  BOOL useInMemoryDatabase = self->_useInMemoryDatabase;
  if (self->_useInMemoryDatabase)
  {
LABEL_4:
    __int16 v12 = [[_WKWebExtensionSQLiteDatabase alloc] initWithURL:v8 queue:self->_databaseQueue];
    database = self->_database;
    self->_database = v12;

    uint64_t v14 = self->_database;
    id v37 = 0;
    BOOL v15 = [(_WKWebExtensionSQLiteDatabase *)v14 openWithAccessType:a4 error:&v37];
    dispatch_queue_t v16 = (_WKWebExtensionSQLiteDatabase *)v37;
    v17 = v16;
    if (!v15)
    {
      if (a4 == 2 || v16)
      {
        v23 = (id)qword_1EB357DF8;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          uniqueIdentifier = self->_uniqueIdentifier;
          v32 = WebKit::privacyPreservingDescription((WebKit *)v17, v24);
          *(_DWORD *)buf = 138478083;
          v39 = uniqueIdentifier;
          __int16 v40 = 2114;
          v41 = v32;
          _os_log_error_impl(&dword_1985F2000, v23, OS_LOG_TYPE_ERROR, "Failed to open database for extension %{private}@: %{public}@", buf, 0x16u);
        }
        if (useInMemoryDatabase || !v5)
        {
          [(_WKWebExtensionSQLiteDatabase *)self->_database close];
          v25 = self->_database;
          self->_database = 0;

          v22 = @"Failed to open extension storage database.";
        }
        else
        {
          v22 = [(_WKWebExtensionSQLiteStore *)self _deleteDatabaseFileAtURL:v8 reopenDatabase:1];
        }
      }
      else
      {
        v22 = 0;
        v17 = self->_database;
        self->_database = 0;
      }
      goto LABEL_25;
    }
    v18 = self->_database;
    v36 = v17;
    BOOL v19 = [(_WKWebExtensionSQLiteDatabase *)v18 enableWAL:&v36];
    objc_super v20 = v36;

    if (v19)
    {
      uint64_t v21 = [(_WKWebExtensionSQLiteStore *)self _handleSchemaVersioningWithDeleteDatabaseFileOnError:v5];
    }
    else
    {
      v26 = (id)qword_1EB357DF8;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v33 = self->_uniqueIdentifier;
        v34 = WebKit::privacyPreservingDescription(v20, v27);
        *(_DWORD *)buf = 138478083;
        v39 = v33;
        __int16 v40 = 2114;
        v41 = v34;
        _os_log_error_impl(&dword_1985F2000, v26, OS_LOG_TYPE_ERROR, "Failed to enable write-ahead logging on database for extension %{private}@: %{public}@", buf, 0x16u);
      }
      if (useInMemoryDatabase || !v5)
      {
        [(_WKWebExtensionSQLiteDatabase *)self->_database close];
        v28 = self->_database;
        self->_database = 0;

        v22 = @"Failed to open extension storage database.";
LABEL_24:
        v17 = (_WKWebExtensionSQLiteDatabase *)v20;
LABEL_25:

        goto LABEL_26;
      }
      uint64_t v21 = [(_WKWebExtensionSQLiteStore *)self _deleteDatabaseFileAtURL:v8 reopenDatabase:1];
    }
    v22 = (__CFString *)v21;
    goto LABEL_24;
  }
  uint64_t v11 = WebKit::ensureDirectoryExists((WebKit *)self->_directory, v9);
  if (v11)
  {

    goto LABEL_4;
  }
  v29 = qword_1EB357DF8;
  if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_ERROR))
  {
    v35 = self->_uniqueIdentifier;
    *(_DWORD *)buf = 138477827;
    v39 = v35;
    _os_log_error_impl(&dword_1985F2000, v29, OS_LOG_TYPE_ERROR, "Failed to create extension storage directory for extension %{private}@", buf, 0xCu);
  }
  v22 = @"Failed to create extension storage directory.";
LABEL_26:

  return v22;
}

- (BOOL)_isDatabaseOpen
{
  return self->_database != 0;
}

- (id)_deleteDatabaseFileAtURL:(id)a3 reopenDatabase:(BOOL)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  if ([(_WKWebExtensionSQLiteStore *)self _isDatabaseOpen])
  {
    if ([(_WKWebExtensionSQLiteDatabase *)self->_database close]) {
      v7 = @"Failed to close extension storage database.";
    }
    else {
      v7 = 0;
    }
    database = self->_database;
    self->_database = 0;
  }
  else
  {
    v7 = 0;
  }
  id v9 = [v6 path];
  MEMORY[0x19972EAD0](&v25, v9);

  for (uint64_t i = 0; i != 2; ++i)
  {
    uint64_t v11 = v25;
    if (v25) {
      *(_DWORD *)v25 += 2;
    }
    v23 = v11;
    *(_OWORD *)buf = -[_WKWebExtensionSQLiteStore _deleteDatabaseFileAtURL:reopenDatabase:]::databaseFileSuffixes[i];
    id result = (id)WTF::tryMakeString<WTF::String,WTF::ASCIILiteral>((uint64_t *)&v23, buf, &v24);
    if (!v24)
    {
      __break(0xC471u);
      return result;
    }
    WTF::FileSystemImpl::deleteFile((WTF::FileSystemImpl *)&v24, v13);
    BOOL v15 = v24;
    v24 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2) {
        WTF::StringImpl::destroy(v15, v14);
      }
      else {
        *(_DWORD *)v15 -= 2;
      }
    }
    dispatch_queue_t v16 = v23;
    v23 = 0;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2) {
        WTF::StringImpl::destroy(v16, v14);
      }
      else {
        *(_DWORD *)v16 -= 2;
      }
    }
  }
  if (WTF::FileSystemImpl::fileExists((WTF::FileSystemImpl *)&v25, v14)
    && (WTF::FileSystemImpl::deleteFile((WTF::FileSystemImpl *)&v25, v17) & 1) == 0)
  {
    objc_super v20 = qword_1EB357DF8;
    if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_ERROR))
    {
      uniqueIdentifier = self->_uniqueIdentifier;
      LODWORD(buf[0]) = 138477827;
      *(uint64_t *)((char *)buf + 4) = (uint64_t)uniqueIdentifier;
      _os_log_error_impl(&dword_1985F2000, v20, OS_LOG_TYPE_ERROR, "Failed to delete database for extension %{private}@", (uint8_t *)buf, 0xCu);
    }
    v7 = @"Failed to delete extension storage database file.";
  }
  else if (a4)
  {
    v7 = [(_WKWebExtensionSQLiteStore *)self _openDatabase:v6 withAccessType:2 deleteDatabaseFileOnError:0];
  }
  else
  {
    BOOL v19 = self->_database;
    self->_database = 0;
  }
  uint64_t v21 = v25;
  v25 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 2) {
      WTF::StringImpl::destroy(v21, v18);
    }
    else {
      *(_DWORD *)v21 -= 2;
    }
  }

  return v7;
}

- (id)_deleteDatabaseIfEmpty
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  if ([(_WKWebExtensionSQLiteStore *)self _isDatabaseEmpty])
  {
    int v3 = [(_WKWebExtensionSQLiteStore *)self _deleteDatabase];
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

- (id)_deleteDatabase
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  if ([(_WKWebExtensionSQLiteStore *)self _isDatabaseOpen])
  {
    if ([(_WKWebExtensionSQLiteDatabase *)self->_database close])
    {
      int v3 = qword_1EB357DF8;
      if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_ERROR))
      {
        uniqueIdentifier = self->_uniqueIdentifier;
        int v11 = 138477827;
        __int16 v12 = uniqueIdentifier;
        _os_log_error_impl(&dword_1985F2000, v3, OS_LOG_TYPE_ERROR, "Failed to close storage database for extension %{private}@", (uint8_t *)&v11, 0xCu);
      }
      BOOL v4 = @"Failed to close extension storage database.";
    }
    else
    {
      BOOL v4 = 0;
    }
    database = self->_database;
    self->_database = 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  if (!self->_useInMemoryDatabase)
  {
    id v6 = [(_WKWebExtensionSQLiteStore *)self _databaseURL];
    v7 = [(_WKWebExtensionSQLiteStore *)self _deleteDatabaseFileAtURL:v6 reopenDatabase:0];

    if ([(__CFString *)v4 length]) {
      id v8 = v4;
    }
    else {
      id v8 = v7;
    }
    BOOL v4 = v8;
  }

  return v4;
}

- (id)_handleSchemaVersioningWithDeleteDatabaseFileOnError:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v5 = [(_WKWebExtensionSQLiteStore *)self _currentDatabaseSchemaVersion];
  int v6 = [(_WKWebExtensionSQLiteStore *)self _migrateToCurrentSchemaVersionIfNeeded];
  if (v6 == v5)
  {
    v7 = 0;
  }
  else
  {
    int v8 = v6;
    id v9 = qword_1EB357DF8;
    if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_ERROR))
    {
      uniqueIdentifier = self->_uniqueIdentifier;
      v15[0] = 67109635;
      v15[1] = v8;
      __int16 v16 = 1024;
      int v17 = v5;
      __int16 v18 = 2113;
      BOOL v19 = uniqueIdentifier;
      _os_log_error_impl(&dword_1985F2000, v9, OS_LOG_TYPE_ERROR, "Schema version (%d) does not match the supported schema version (%d) in database for extension %{private}@", (uint8_t *)v15, 0x18u);
    }
    if (self->_useInMemoryDatabase || !v3)
    {
      database = self->_database;
      p_database = &self->_database;
      [(_WKWebExtensionSQLiteDatabase *)database close];
      __int16 v10 = *p_database;
      *p_database = 0;
      v7 = @"Failed to open extension storage database because of an invalid schema version.";
    }
    else
    {
      __int16 v10 = [(_WKWebExtensionSQLiteStore *)self _databaseURL];
      v7 = [(_WKWebExtensionSQLiteStore *)self _deleteDatabaseFileAtURL:v10 reopenDatabase:1];
    }
  }

  return v7;
}

- (int)_migrateToCurrentSchemaVersionIfNeeded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  int v3 = [(_WKWebExtensionSQLiteStore *)self _databaseSchemaVersion];
  uint64_t v4 = [(_WKWebExtensionSQLiteStore *)self _currentDatabaseSchemaVersion];
  if (v3 != v4)
  {
    uint64_t v5 = v4;
    if (v3)
    {
      int v6 = qword_1EB357DF8;
      if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_INFO))
      {
        uniqueIdentifier = self->_uniqueIdentifier;
        v9[0] = 67109635;
        v9[1] = v3;
        __int16 v10 = 1024;
        int v11 = v5;
        __int16 v12 = 2113;
        uint64_t v13 = uniqueIdentifier;
        _os_log_impl(&dword_1985F2000, v6, OS_LOG_TYPE_INFO, "Schema version (%d) does not match our supported schema version (%d) in database for extension %{private}@, recreating database", (uint8_t *)v9, 0x18u);
      }
    }
    if ([(_WKWebExtensionSQLiteStore *)self _resetDatabaseSchema] != 101) {
      return 0;
    }
    int v3 = 0;
    if ([(_WKWebExtensionSQLiteStore *)self _setDatabaseSchemaVersion:0] == 101)
    {
      [(_WKWebExtensionSQLiteStore *)self _vacuum];
      if ([(_WKWebExtensionSQLiteStore *)self _createFreshDatabaseSchema] == 101)
      {
        [(_WKWebExtensionSQLiteStore *)self _setDatabaseSchemaVersion:v5];
        return v5;
      }
      return 0;
    }
  }
  return v3;
}

- (int)_databaseSchemaVersion
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  int v3 = WebKit::SQLiteDatabaseFetch<>(self->_database, @"PRAGMA user_version");
  uint64_t v4 = [v3 nextObject];
  int v5 = [v4 intAtIndex:0];

  int v6 = [v3 statement];
  [v6 invalidate];

  return v5;
}

- (int)_setDatabaseSchemaVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  database = self->_database;
  int v6 = objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA user_version = %d", v3);
  int v7 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(database, 0, v6);

  if (v7 != 101)
  {
    int v8 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uniqueIdentifier = self->_uniqueIdentifier;
      int v11 = [(_WKWebExtensionSQLiteDatabase *)self->_database lastErrorMessage];
      *(_DWORD *)buf = 138478339;
      uint64_t v13 = uniqueIdentifier;
      __int16 v14 = 2114;
      BOOL v15 = v11;
      __int16 v16 = 1024;
      int v17 = v7;
      _os_log_error_impl(&dword_1985F2000, v8, OS_LOG_TYPE_ERROR, "Failed to set database version for extension %{private}@: %{public}@ (%d)", buf, 0x1Cu);
    }
  }
  return v7;
}

- (id)_savepointNameFromUUID:(id)a3
{
  uint64_t v3 = [a3 UUIDString];
  uint64_t v4 = [v3 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1EEA10550];
  int v5 = [@"S" stringByAppendingString:v4];

  return v5;
}

- (void)createSavepointWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F29128] UUID];
  objc_initWeak(&location, self);
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3321888768;
  _DWORD v9[2] = __67___WKWebExtensionSQLiteStore_createSavepointWithCompletionHandler___block_invoke;
  v9[3] = &unk_1EE9B2848;
  objc_copyWeak(&v12, &location);
  id v10 = v5;
  id v11 = v4;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(databaseQueue, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)commitSavepoint:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  databaseQueue = self->_databaseQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3321888768;
  v11[2] = __64___WKWebExtensionSQLiteStore_commitSavepoint_completionHandler___block_invoke;
  v11[3] = &unk_1EE9B2848;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(databaseQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)rollbackToSavepoint:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  databaseQueue = self->_databaseQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3321888768;
  v11[2] = __68___WKWebExtensionSQLiteStore_rollbackToSavepoint_completionHandler___block_invoke;
  v11[3] = &unk_1EE9B2848;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(databaseQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (int)_currentDatabaseSchemaVersion
{
  return 0;
}

- (id)_databaseURL
{
  return 0;
}

- (int)_createFreshDatabaseSchema
{
  return 0;
}

- (int)_resetDatabaseSchema
{
  return 0;
}

- (BOOL)_isDatabaseEmpty
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_directory, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end