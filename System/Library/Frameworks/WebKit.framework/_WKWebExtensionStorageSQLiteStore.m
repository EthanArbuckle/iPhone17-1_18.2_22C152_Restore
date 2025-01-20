@interface _WKWebExtensionStorageSQLiteStore
- (BOOL)_isDatabaseEmpty;
- (_WKWebExtensionStorageSQLiteStore)initWithUniqueIdentifier:(id)a3 storageType:(unsigned __int8)a4 directory:(id)a5 usesInMemoryDatabase:(BOOL)a6;
- (id)_databaseURL;
- (id)_getAllKeysReturningErrorMessage:(id *)a3;
- (id)_getKeysAndValuesFromRowEnumerator:(id)a3;
- (id)_getValuesForAllKeysReturningErrorMessage:(id *)a3;
- (id)_getValuesForKeys:(id)a3 outErrorMessage:(id *)a4;
- (id)_insertOrUpdateValue:(id)a3 forKey:(id)a4 inDatabase:(id)a5;
- (int)_createFreshDatabaseSchema;
- (int)_currentDatabaseSchemaVersion;
- (int)_migrateToCurrentSchemaVersionIfNeeded;
- (int)_resetDatabaseSchema;
- (void)deleteValuesForKeys:(id)a3 completionHandler:(id)a4;
- (void)getStorageSizeForAllKeysIncludingKeyedData:(id)a3 withCompletionHandler:(id)a4;
- (void)getStorageSizeForKeys:(id)a3 completionHandler:(id)a4;
- (void)getValuesForKeys:(id)a3 completionHandler:(id)a4;
- (void)setKeyedData:(id)a3 completionHandler:(id)a4;
@end

@implementation _WKWebExtensionStorageSQLiteStore

- (_WKWebExtensionStorageSQLiteStore)initWithUniqueIdentifier:(id)a3 storageType:(unsigned __int8)a4 directory:(id)a5 usesInMemoryDatabase:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)_WKWebExtensionStorageSQLiteStore;
  v7 = [(_WKWebExtensionSQLiteStore *)&v11 initWithUniqueIdentifier:a3 directory:a5 usesInMemoryDatabase:a6];
  v8 = v7;
  if (v7)
  {
    *(&v7->super._useInMemoryDatabase + 1) = a4;
    v9 = v7;
  }

  return v8;
}

- (void)getValuesForKeys:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  databaseQueue = self->super._databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __72___WKWebExtensionStorageSQLiteStore_getValuesForKeys_completionHandler___block_invoke;
  block[3] = &unk_1EE9B2880;
  objc_copyWeak(&v15, &location);
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(databaseQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)getStorageSizeForKeys:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  databaseQueue = self->super._databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __77___WKWebExtensionStorageSQLiteStore_getStorageSizeForKeys_completionHandler___block_invoke;
  block[3] = &unk_1EE9B2880;
  objc_copyWeak(&v15, &location);
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(databaseQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)getStorageSizeForAllKeysIncludingKeyedData:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __102___WKWebExtensionStorageSQLiteStore_getStorageSizeForAllKeysIncludingKeyedData_withCompletionHandler___block_invoke;
  v10[3] = &unk_1E58111A0;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(_WKWebExtensionStorageSQLiteStore *)self getStorageSizeForKeys:MEMORY[0x1E4F1CBF0] completionHandler:v10];
}

- (void)setKeyedData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  databaseQueue = self->super._databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __68___WKWebExtensionStorageSQLiteStore_setKeyedData_completionHandler___block_invoke;
  block[3] = &unk_1EE9B2880;
  objc_copyWeak(&v15, &location);
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(databaseQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)deleteValuesForKeys:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  databaseQueue = self->super._databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __75___WKWebExtensionStorageSQLiteStore_deleteValuesForKeys_completionHandler___block_invoke;
  block[3] = &unk_1EE9B2880;
  objc_copyWeak(&v15, &location);
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(databaseQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (id)_databaseURL
{
  if (self->super._useInMemoryDatabase)
  {
    v2 = +[_WKWebExtensionSQLiteDatabase inMemoryDatabaseURL];
  }
  else
  {
    int v3 = *((unsigned __int8 *)&self->super._useInMemoryDatabase + 1);
    v4 = @"SyncStorage.db";
    if (v3 != 4) {
      v4 = 0;
    }
    if (v3 == 1) {
      v5 = @"LocalStorage.db";
    }
    else {
      v5 = v4;
    }
    v2 = [(NSURL *)self->super._directory URLByAppendingPathComponent:v5 isDirectory:0];
  }

  return v2;
}

- (id)_insertOrUpdateValue:(id)a3 forKey:(id)a4 inDatabase:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  id v11 = v10;
  id v12 = @"INSERT OR REPLACE INTO extension_storage (key, value) VALUES (?, ?)";
  *(void *)buf = 0;
  v13 = [[_WKWebExtensionSQLiteStatement alloc] initWithDatabase:v11 query:@"INSERT OR REPLACE INTO extension_storage (key, value) VALUES (?, ?)" error:buf];
  id v14 = *(id *)buf;
  id v15 = v14;
  if (v13)
  {
    v16 = v13;
    [(_WKWebExtensionSQLiteStatement *)v16 bindString:v9 atParameterIndex:1];
    [(_WKWebExtensionSQLiteStatement *)v16 bindString:v8 atParameterIndex:2];

    uint64_t v17 = [(_WKWebExtensionSQLiteStatement *)v16 execute];
    [(_WKWebExtensionSQLiteStatement *)v16 invalidate];
    if ((v17 - 100) >= 2 && v17) {
      objc_msgSend(v11, "reportErrorWithCode:statement:error:", v17, -[_WKWebExtensionSQLiteStatement handle](v16, "handle"), 0);
    }
  }
  else
  {
    LODWORD(v17) = [v14 code];
  }

  if (v17 == 101)
  {
    v18 = 0;
  }
  else
  {
    v19 = qword_1EB357DF8;
    if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_ERROR))
    {
      uniqueIdentifier = self->super._uniqueIdentifier;
      *(_DWORD *)buf = 138478339;
      *(void *)&buf[4] = v8;
      __int16 v23 = 2113;
      id v24 = v9;
      __int16 v25 = 2113;
      v26 = uniqueIdentifier;
      _os_log_error_impl(&dword_1985F2000, v19, OS_LOG_TYPE_ERROR, "Failed to insert value %{private}@ for key %{private}@ for extension %{private}@.", buf, 0x20u);
    }
    v18 = [NSString stringWithFormat:@"Failed to insert value %@ for key %@", v8, v9];
  }

  return v18;
}

- (id)_getValuesForAllKeysReturningErrorMessage:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  if ([(_WKWebExtensionSQLiteStore *)self _openDatabaseIfNecessaryReturningErrorMessage:a3 createIfNecessary:0])
  {
    v5 = WebKit::SQLiteDatabaseFetch<>(self->super._database, @"SELECT * FROM extension_storage");
    id v6 = [(_WKWebExtensionStorageSQLiteStore *)self _getKeysAndValuesFromRowEnumerator:v5];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v6;
}

- (id)_getKeysAndValuesFromRowEnumerator:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "stringAtIndex:", 0, (void)v14);
        id v11 = [v9 stringAtIndex:1];
        [v4 setObject:v11 forKeyedSubscript:v10];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v12 = (void *)[v4 copy];

  return v12;
}

- (id)_getAllKeysReturningErrorMessage:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  if ([(_WKWebExtensionSQLiteStore *)self _openDatabaseIfNecessaryReturningErrorMessage:a3 createIfNecessary:0])
  {
    id v5 = [MEMORY[0x1E4F1CA80] set];
    WebKit::SQLiteDatabaseFetch<>(self->super._database, @"SELECT key FROM extension_storage");
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "stringAtIndex:", 0, (void)v12);
          [v5 addObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v5;
}

- (id)_getValuesForKeys:(id)a3 outErrorMessage:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  if ([(_WKWebExtensionSQLiteStore *)self _openDatabaseIfNecessaryReturningErrorMessage:a4 createIfNecessary:0])
  {
    database = self->super._database;
    uint64_t v8 = NSString;
    id v9 = rowFilterStringFromRowKeys(v6);
    id v10 = [v8 stringWithFormat:@"SELECT * FROM extension_storage WHERE key in (%@)", v9];
    id v11 = WebKit::SQLiteDatabaseFetch<>(database, v10);

    long long v12 = [(_WKWebExtensionStorageSQLiteStore *)self _getKeysAndValuesFromRowEnumerator:v11];
  }
  else
  {
    long long v12 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v12;
}

- (int)_currentDatabaseSchemaVersion
{
  return 2;
}

- (int)_createFreshDatabaseSchema
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  int v3 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(self->super._database, 0, @"CREATE TABLE extension_storage (key TEXT PRIMARY KEY NOT NULL, value TEXT NOT NULL)");
  if (v3 != 101)
  {
    v4 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uniqueIdentifier = self->super._uniqueIdentifier;
      uint64_t v7 = [(_WKWebExtensionSQLiteDatabase *)self->super._database lastErrorMessage];
      int v8 = 138478339;
      id v9 = uniqueIdentifier;
      __int16 v10 = 2114;
      id v11 = v7;
      __int16 v12 = 1024;
      int v13 = v3;
      _os_log_error_impl(&dword_1985F2000, v4, OS_LOG_TYPE_ERROR, "Failed to create the extension_storage table for extension %{private}@: %{public}@ (%d)", (uint8_t *)&v8, 0x1Cu);
    }
  }
  return v3;
}

- (int)_migrateToCurrentSchemaVersionIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  if ([(_WKWebExtensionSQLiteStore *)self _databaseSchemaVersion] == 1) {
    [(_WKWebExtensionSQLiteStore *)self _setDatabaseSchemaVersion:2];
  }
  v4.receiver = self;
  v4.super_class = (Class)_WKWebExtensionStorageSQLiteStore;
  return [(_WKWebExtensionSQLiteStore *)&v4 _migrateToCurrentSchemaVersionIfNeeded];
}

- (int)_resetDatabaseSchema
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  int v3 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(self->super._database, 0, @"DROP TABLE IF EXISTS extension_storage");
  if (v3 != 101)
  {
    objc_super v4 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uniqueIdentifier = self->super._uniqueIdentifier;
      uint64_t v7 = [(_WKWebExtensionSQLiteDatabase *)self->super._database lastErrorMessage];
      int v8 = 138478339;
      id v9 = uniqueIdentifier;
      __int16 v10 = 2114;
      id v11 = v7;
      __int16 v12 = 1024;
      int v13 = v3;
      _os_log_error_impl(&dword_1985F2000, v4, OS_LOG_TYPE_ERROR, "Failed to reset database schema for extension %{private}@: %{public}@ (%d)", (uint8_t *)&v8, 0x1Cu);
    }
  }
  return v3;
}

- (BOOL)_isDatabaseEmpty
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  int v3 = WebKit::SQLiteDatabaseFetch<>(self->super._database, @"SELECT COUNT(*) FROM extension_storage");
  objc_super v4 = [v3 nextObject];
  BOOL v5 = [v4 int64AtIndex:0] == 0;

  return v5;
}

@end