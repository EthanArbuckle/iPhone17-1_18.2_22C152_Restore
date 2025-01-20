@interface _WKWebExtensionRegisteredScriptsSQLiteStore
- (BOOL)_isDatabaseEmpty;
- (_WKWebExtensionRegisteredScriptsSQLiteStore)initWithUniqueIdentifier:(id)a3 directory:(id)a4 usesInMemoryDatabase:(BOOL)a5;
- (id)_databaseURL;
- (id)_getKeysAndValuesFromRowEnumerator:(id)a3;
- (id)_getScriptsWithOutErrorMessage:(id *)a3;
- (int)_createFreshDatabaseSchema;
- (int)_currentDatabaseSchemaVersion;
- (int)_resetDatabaseSchema;
- (void)_insertScript:(id)a3 inDatabase:(id)a4 errorMessage:(id *)a5;
- (void)addScripts:(id)a3 completionHandler:(id)a4;
- (void)deleteScriptsWithIDs:(id)a3 completionHandler:(id)a4;
- (void)getScriptsWithCompletionHandler:(id)a3;
- (void)updateScripts:(id)a3 completionHandler:(id)a4;
@end

@implementation _WKWebExtensionRegisteredScriptsSQLiteStore

- (_WKWebExtensionRegisteredScriptsSQLiteStore)initWithUniqueIdentifier:(id)a3 directory:(id)a4 usesInMemoryDatabase:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)_WKWebExtensionRegisteredScriptsSQLiteStore;
  v5 = [(_WKWebExtensionSQLiteStore *)&v9 initWithUniqueIdentifier:a3 directory:a4 usesInMemoryDatabase:a5];
  v6 = v5;
  if (v5) {
    v7 = v5;
  }

  return v6;
}

- (void)updateScripts:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = WebKit::mapObjects<NSArray>(v6, &__block_literal_global_1);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3321888768;
  v11[2] = __79___WKWebExtensionRegisteredScriptsSQLiteStore_updateScripts_completionHandler___block_invoke_2;
  v11[3] = &unk_1EE9B2780;
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v13 = v9;
  id v10 = v6;
  id v12 = v10;
  [(_WKWebExtensionRegisteredScriptsSQLiteStore *)self deleteScriptsWithIDs:v8 completionHandler:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)deleteScriptsWithIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    objc_initWeak(&location, self);
    databaseQueue = self->super._databaseQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3321888768;
    v9[2] = __86___WKWebExtensionRegisteredScriptsSQLiteStore_deleteScriptsWithIDs_completionHandler___block_invoke;
    v9[3] = &unk_1EE9B27B8;
    objc_copyWeak(&v12, &location);
    id v11 = v7;
    id v10 = v6;
    dispatch_async(databaseQueue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)addScripts:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = WebKit::filterObjects<NSArray>(v6, &__block_literal_global_18);

  if ([v8 count])
  {
    objc_initWeak(&location, self);
    databaseQueue = self->super._databaseQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3321888768;
    v10[2] = __76___WKWebExtensionRegisteredScriptsSQLiteStore_addScripts_completionHandler___block_invoke_2;
    v10[3] = &unk_1EE9B27B8;
    objc_copyWeak(&v13, &location);
    id v12 = v7;
    id v11 = v8;
    dispatch_async(databaseQueue, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)getScriptsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  databaseQueue = self->super._databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __79___WKWebExtensionRegisteredScriptsSQLiteStore_getScriptsWithCompletionHandler___block_invoke;
  block[3] = &unk_1EE9B2810;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)_getScriptsWithOutErrorMessage:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  if ([(_WKWebExtensionSQLiteStore *)self _openDatabaseIfNecessaryReturningErrorMessage:a3 createIfNecessary:0])
  {
    v5 = WebKit::SQLiteDatabaseFetch<>(self->super._database, @"SELECT * FROM registered_scripts");
    id v6 = [(_WKWebExtensionRegisteredScriptsSQLiteStore *)self _getKeysAndValuesFromRowEnumerator:v5];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (id)_getKeysAndValuesFromRowEnumerator:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  if ((_MergedGlobals_38 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    qword_1EB358A38 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0, v18);
    _MergedGlobals_38 = 1;
  }
  id v20 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = v18;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = (void *)MEMORY[0x1E4F28DC0];
        uint64_t v8 = qword_1EB358A38;
        id v9 = [*(id *)(*((void *)&v22 + 1) + 8 * i) dataAtIndex:1];
        id v21 = 0;
        id v10 = [v7 unarchivedObjectOfClasses:v8 fromData:v9 error:&v21];
        id v11 = v21;

        if (v11)
        {
          id v12 = qword_1EB357DF8;
          if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_ERROR))
          {
            uniqueIdentifier = self->super._uniqueIdentifier;
            *(_DWORD *)buf = 138477827;
            v27 = uniqueIdentifier;
            _os_log_error_impl(&dword_1985F2000, v12, OS_LOG_TYPE_ERROR, "Failed to deserialize registered content script for extension %{private}@.", buf, 0xCu);
          }
        }
        else
        {
          [v20 addObject:v10];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v4);
  }

  return v20;
}

- (void)_insertScript:(id)a3 inDatabase:(id)a4 errorMessage:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  id v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
  id v21 = a5;
  id v11 = [v8 objectForKeyedSubscript:@"id"];
  id v12 = v9;
  id v13 = @"INSERT INTO registered_scripts (key, script) VALUES (?, ?)";
  *(void *)buf = 0;
  id v14 = [[_WKWebExtensionSQLiteStatement alloc] initWithDatabase:v12 query:@"INSERT INTO registered_scripts (key, script) VALUES (?, ?)" error:buf];
  id v15 = *(id *)buf;
  uint64_t v16 = v15;
  if (v14)
  {
    uint64_t v17 = v14;
    [(_WKWebExtensionSQLiteStatement *)v17 bindString:v11 atParameterIndex:1];
    [(_WKWebExtensionSQLiteStatement *)v17 bindData:v10 atParameterIndex:2];

    uint64_t v18 = [(_WKWebExtensionSQLiteStatement *)v17 execute];
    [(_WKWebExtensionSQLiteStatement *)v17 invalidate];
    if ((v18 - 100) >= 2 && v18) {
      objc_msgSend(v12, "reportErrorWithCode:statement:error:", v18, -[_WKWebExtensionSQLiteStatement handle](v17, "handle"), 0);
    }
  }
  else
  {
    LODWORD(v18) = [v15 code];
  }

  if (v18 != 101)
  {
    v19 = qword_1EB357DF8;
    if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_ERROR))
    {
      uniqueIdentifier = self->super._uniqueIdentifier;
      *(_DWORD *)buf = 138477827;
      *(void *)&uint8_t buf[4] = uniqueIdentifier;
      _os_log_error_impl(&dword_1985F2000, v19, OS_LOG_TYPE_ERROR, "Failed to insert registered content script for extension %{private}@.", buf, 0xCu);
    }
    *id v21 = @"Failed to add content script.";
  }
}

- (int)_currentDatabaseSchemaVersion
{
  return 1;
}

- (id)_databaseURL
{
  if (self->super._useInMemoryDatabase) {
    +[_WKWebExtensionSQLiteDatabase inMemoryDatabaseURL];
  }
  else {
  v2 = [(NSURL *)self->super._directory URLByAppendingPathComponent:@"RegisteredContentScripts.db" isDirectory:0];
  }

  return v2;
}

- (int)_createFreshDatabaseSchema
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  int v3 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(self->super._database, 0, @"CREATE TABLE registered_scripts (key TEXT PRIMARY KEY NOT NULL, script BLOB NOT NULL)");
  if (v3 != 101)
  {
    uint64_t v4 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uniqueIdentifier = self->super._uniqueIdentifier;
      id v7 = [(_WKWebExtensionSQLiteDatabase *)self->super._database lastErrorMessage];
      int v8 = 138478339;
      id v9 = uniqueIdentifier;
      __int16 v10 = 2114;
      id v11 = v7;
      __int16 v12 = 1024;
      int v13 = v3;
      _os_log_error_impl(&dword_1985F2000, v4, OS_LOG_TYPE_ERROR, "Failed to create registered_scripts database for extension %{private}@: %{public}@ (%d)", (uint8_t *)&v8, 0x1Cu);
    }
  }
  return v3;
}

- (int)_resetDatabaseSchema
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  int v3 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(self->super._database, 0, @"DROP TABLE IF EXISTS registered_scripts");
  if (v3 != 101)
  {
    uint64_t v4 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uniqueIdentifier = self->super._uniqueIdentifier;
      id v7 = [(_WKWebExtensionSQLiteDatabase *)self->super._database lastErrorMessage];
      int v8 = 138478339;
      id v9 = uniqueIdentifier;
      __int16 v10 = 2114;
      id v11 = v7;
      __int16 v12 = 1024;
      int v13 = v3;
      _os_log_error_impl(&dword_1985F2000, v4, OS_LOG_TYPE_ERROR, "Failed to reset registered_scripts database schema for extension %{private}@: %{public}@ (%d)", (uint8_t *)&v8, 0x1Cu);
    }
  }
  return v3;
}

- (BOOL)_isDatabaseEmpty
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  int v3 = WebKit::SQLiteDatabaseFetch<>(self->super._database, @"SELECT COUNT(*) FROM registered_scripts");
  uint64_t v4 = [v3 nextObject];
  BOOL v5 = [v4 int64AtIndex:0] == 0;

  return v5;
}

@end