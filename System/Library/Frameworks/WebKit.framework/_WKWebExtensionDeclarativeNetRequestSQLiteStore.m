@interface _WKWebExtensionDeclarativeNetRequestSQLiteStore
- (BOOL)_isDatabaseEmpty;
- (_WKWebExtensionDeclarativeNetRequestSQLiteStore)initWithUniqueIdentifier:(id)a3 storageType:(BOOL)a4 directory:(id)a5 usesInMemoryDatabase:(BOOL)a6;
- (id)_databaseURL;
- (id)_getKeysAndValuesFromRowEnumerator:(id)a3;
- (id)_getRulesWithOutErrorMessage:(id *)a3;
- (id)_insertRule:(id)a3 inDatabase:(id)a4;
- (int)_createFreshDatabaseSchema;
- (int)_currentDatabaseSchemaVersion;
- (int)_resetDatabaseSchema;
- (void)addRules:(id)a3 completionHandler:(id)a4;
- (void)deleteRules:(id)a3 completionHandler:(id)a4;
- (void)getRulesWithCompletionHandler:(id)a3;
- (void)updateRulesByRemovingIDs:(id)a3 addRules:(id)a4 completionHandler:(id)a5;
@end

@implementation _WKWebExtensionDeclarativeNetRequestSQLiteStore

- (_WKWebExtensionDeclarativeNetRequestSQLiteStore)initWithUniqueIdentifier:(id)a3 storageType:(BOOL)a4 directory:(id)a5 usesInMemoryDatabase:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_WKWebExtensionDeclarativeNetRequestSQLiteStore;
  v12 = [(_WKWebExtensionSQLiteStore *)&v20 initWithUniqueIdentifier:v10 directory:v11 usesInMemoryDatabase:v6];
  v13 = v12;
  if (v12)
  {
    if (v8) {
      v14 = @"session";
    }
    else {
      v14 = @"dynamic";
    }
    p_storageType = &v12->_storageType;
    objc_storeStrong((id *)&v12->_storageType, v14);
    uint64_t v16 = [NSString stringWithFormat:@"%@_rules", *p_storageType];
    tableName = v13->_tableName;
    v13->_tableName = (NSString *)v16;

    v18 = v13;
  }

  return v13;
}

- (void)updateRulesByRemovingIDs:(id)a3 addRules:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3321888768;
  v13[2] = __103___WKWebExtensionDeclarativeNetRequestSQLiteStore_updateRulesByRemovingIDs_addRules_completionHandler___block_invoke;
  v13[3] = &unk_1EE9B2698;
  objc_copyWeak(&v16, &location);
  id v14 = v8;
  id v15 = v9;
  id v11 = v8;
  id v12 = v9;
  [(_WKWebExtensionDeclarativeNetRequestSQLiteStore *)self deleteRules:v10 completionHandler:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)addRules:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    objc_initWeak(&location, self);
    databaseQueue = self->super._databaseQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3321888768;
    v9[2] = __78___WKWebExtensionDeclarativeNetRequestSQLiteStore_addRules_completionHandler___block_invoke;
    v9[3] = &unk_1EE9B26D0;
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

- (void)deleteRules:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    objc_initWeak(&location, self);
    databaseQueue = self->super._databaseQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3321888768;
    v9[2] = __81___WKWebExtensionDeclarativeNetRequestSQLiteStore_deleteRules_completionHandler___block_invoke;
    v9[3] = &unk_1EE9B26D0;
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

- (void)getRulesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  databaseQueue = self->super._databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __81___WKWebExtensionDeclarativeNetRequestSQLiteStore_getRulesWithCompletionHandler___block_invoke;
  block[3] = &unk_1EE9B2708;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)_getRulesWithOutErrorMessage:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  if ([(_WKWebExtensionSQLiteStore *)self _openDatabaseIfNecessaryReturningErrorMessage:a3 createIfNecessary:0])
  {
    database = self->super._database;
    id v6 = [NSString stringWithFormat:@"SELECT * FROM %@", self->_tableName];
    id v7 = WebKit::SQLiteDatabaseFetch<>(database, v6);

    id v8 = [(_WKWebExtensionDeclarativeNetRequestSQLiteStore *)self _getKeysAndValuesFromRowEnumerator:v7];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)_getKeysAndValuesFromRowEnumerator:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  if ((_MergedGlobals_14 & 1) == 0)
  {
    id v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    qword_1EB358A28 = objc_msgSend(v15, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
    _MergedGlobals_14 = 1;
  }
  id v21 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = v19;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = (void *)MEMORY[0x1E4F28DC0];
        uint64_t v8 = qword_1EB358A28;
        id v9 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dataAtIndex:1];
        id v22 = 0;
        id v10 = [v7 unarchivedObjectOfClasses:v8 fromData:v9 error:&v22];
        id v11 = v22;

        if (v11)
        {
          id v12 = qword_1EB357DF8;
          if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_ERROR))
          {
            uniqueIdentifier = self->super._uniqueIdentifier;
            *(_DWORD *)buf = 138477827;
            v28 = uniqueIdentifier;
            _os_log_error_impl(&dword_1985F2000, v12, OS_LOG_TYPE_ERROR, "Failed to deserialize dynamic declarative net request rule for extension %{private}@.", buf, 0xCu);
          }
        }
        else
        {
          [v21 addObject:v10];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v4);
  }

  return v21;
}

- (id)_insertRule:(id)a3 inDatabase:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v21 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  id v22 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
  id v7 = WebKit::objectForKey<NSNumber>(v6, @"id");
  uint64_t v8 = [NSString stringWithFormat:@"INSERT INTO %@ (id, rule) VALUES (?, ?)", self->_tableName];
  uint64_t v9 = [v7 integerValue];
  id v10 = v21;
  id v11 = v8;
  *(void *)buf = 0;
  id v12 = [[_WKWebExtensionSQLiteStatement alloc] initWithDatabase:v10 query:v11 error:buf];
  id v13 = *(id *)buf;
  id v14 = v13;
  if (v12)
  {
    id v15 = v12;
    [(_WKWebExtensionSQLiteStatement *)v15 bindInt64:v9 atParameterIndex:1];
    [(_WKWebExtensionSQLiteStatement *)v15 bindData:v22 atParameterIndex:2];

    uint64_t v16 = [(_WKWebExtensionSQLiteStatement *)v15 execute];
    [(_WKWebExtensionSQLiteStatement *)v15 invalidate];
    if ((v16 - 100) >= 2 && v16) {
      objc_msgSend(v10, "reportErrorWithCode:statement:error:", v16, -[_WKWebExtensionSQLiteStatement handle](v15, "handle"), 0);
    }
  }
  else
  {
    LODWORD(v16) = [v13 code];
  }

  if (v16 == 101)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v18 = qword_1EB357DF8;
    if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_ERROR))
    {
      uniqueIdentifier = self->super._uniqueIdentifier;
      *(_DWORD *)buf = 138477827;
      *(void *)&uint8_t buf[4] = uniqueIdentifier;
      _os_log_error_impl(&dword_1985F2000, v18, OS_LOG_TYPE_ERROR, "Failed to insert dynamic declarative net request rule for extension %{private}@.", buf, 0xCu);
    }
    uint64_t v17 = [NSString stringWithFormat:@"Failed to add %@ rule.", self->_storageType];
  }

  return v17;
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
  v2 = [(NSURL *)self->super._directory URLByAppendingPathComponent:@"DeclarativeNetRequestRules.db" isDirectory:0];
  }

  return v2;
}

- (int)_createFreshDatabaseSchema
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  database = self->super._database;
  uint64_t v4 = [NSString stringWithFormat:@"CREATE TABLE %@ (id INTEGER PRIMARY KEY NOT NULL, rule BLOB NOT NULL)", self->_tableName];
  int v5 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(database, 0, v4);

  if (v5 != 101)
  {
    id v6 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      tableName = self->_tableName;
      uniqueIdentifier = self->super._uniqueIdentifier;
      id v10 = [(_WKWebExtensionSQLiteDatabase *)self->super._database lastErrorMessage];
      *(_DWORD *)buf = 138413059;
      id v12 = tableName;
      __int16 v13 = 2113;
      id v14 = uniqueIdentifier;
      __int16 v15 = 2114;
      uint64_t v16 = v10;
      __int16 v17 = 1024;
      int v18 = v5;
      _os_log_error_impl(&dword_1985F2000, v6, OS_LOG_TYPE_ERROR, "Failed to create %@ database for extension %{private}@: %{public}@ (%d)", buf, 0x26u);
    }
  }
  return v5;
}

- (int)_resetDatabaseSchema
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  database = self->super._database;
  uint64_t v4 = [NSString stringWithFormat:@"DROP TABLE IF EXISTS %@", self->_tableName];
  int v5 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(database, 0, v4);

  if (v5 != 101)
  {
    id v6 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      tableName = self->_tableName;
      uniqueIdentifier = self->super._uniqueIdentifier;
      id v10 = [(_WKWebExtensionSQLiteDatabase *)self->super._database lastErrorMessage];
      *(_DWORD *)buf = 138413059;
      id v12 = tableName;
      __int16 v13 = 2113;
      id v14 = uniqueIdentifier;
      __int16 v15 = 2114;
      uint64_t v16 = v10;
      __int16 v17 = 1024;
      int v18 = v5;
      _os_log_error_impl(&dword_1985F2000, v6, OS_LOG_TYPE_ERROR, "Failed to reset %@ database schema for extension %{private}@: %{public}@ (%d)", buf, 0x26u);
    }
  }
  return v5;
}

- (BOOL)_isDatabaseEmpty
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  database = self->super._database;
  uint64_t v4 = [NSString stringWithFormat:@"SELECT COUNT(*) FROM %@", self->_tableName];
  int v5 = WebKit::SQLiteDatabaseFetch<>(database, v4);

  id v6 = [v5 nextObject];
  LOBYTE(database) = [v6 int64AtIndex:0] == 0;

  return (char)database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);

  objc_storeStrong((id *)&self->_storageType, 0);
}

@end