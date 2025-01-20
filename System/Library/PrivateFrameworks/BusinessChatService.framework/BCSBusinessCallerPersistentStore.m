@interface BCSBusinessCallerPersistentStore
+ (const)debugQueueName;
- (BCSBusinessCallerPersistentStore)init;
- (const)schema;
- (id)databasePath;
- (id)itemMatching:(id)a3;
- (int64_t)schemaVersion;
- (void)deleteExpiredItemsOfType:(int64_t)a3;
- (void)deleteItemMatching:(id)a3;
- (void)deleteItemsOfType:(int64_t)a3;
- (void)schemaVersionWillChangeForDatabase:(sqlite3 *)a3 fromSchemaVersion:(int64_t)a4 toSchemaVersion:(int64_t)a5;
- (void)updateItem:(id)a3 withItemIdentifier:(id)a4;
@end

@implementation BCSBusinessCallerPersistentStore

- (BCSBusinessCallerPersistentStore)init
{
  if (self)
  {
    v2.receiver = self;
    v2.super_class = (Class)BCSBusinessCallerPersistentStore;
    self = [(BCSPersistentStore *)&v2 init];
    if (self) {
      self->_schemaVersion = 2;
    }
  }
  return self;
}

- (id)databasePath
{
  if (![(id)databasePath_databasePath_2 length])
  {
    objc_super v2 = +[BCSPathProvider sharedInstance];
    v3 = [v2 documentsURL];
    v4 = [v3 path];

    uint64_t v5 = [v4 stringByAppendingPathComponent:@"business_caller_items.db"];
    v6 = (void *)databasePath_databasePath_2;
    databasePath_databasePath_2 = v5;
  }
  v7 = (void *)databasePath_databasePath_2;

  return v7;
}

- (int64_t)schemaVersion
{
  return self->_schemaVersion;
}

- (void)schemaVersionWillChangeForDatabase:(sqlite3 *)a3 fromSchemaVersion:(int64_t)a4 toSchemaVersion:(int64_t)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "-[BCSBusinessCallerPersistentStore schemaVersionWillChangeForDatabase:fromSchemaVersion:toSchemaVersion:]";
    __int16 v14 = 2048;
    int64_t v15 = a4;
    __int16 v16 = 2048;
    int64_t v17 = a5;
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s schema version will change from '%ld' to '%ld', dropping link_items table", buf, 0x20u);
  }

  ppStmt = 0;
  if (!sqlite3_prepare_v2(a3, "DROP TABLE IF EXISTS business_caller_items", -1, &ppStmt, 0))
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      v9 = ABSLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = sqlite3_errmsg(a3);
        *(_DWORD *)buf = 136315138;
        v13 = v10;
        _os_log_error_impl(&dword_2154F4000, v9, OS_LOG_TYPE_ERROR, "error while dropping link_items table: %s", buf, 0xCu);
      }
    }
    sqlite3_finalize(ppStmt);
  }
}

- (const)schema
{
  return "CREATE TABLE IF NOT EXISTS business_caller_items    (phone_hash INTEGER PRIMARY KEY,     phone TEXT,     messag"
         "e BLOB,     expiration_date DOUBLE)";
}

+ (const)debugQueueName
{
  return "com.apple.businessservices.persistentStore.businessCallerItems";
}

- (void)deleteExpiredItemsOfType:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = ABSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[BCSBusinessCallerPersistentStore deleteExpiredItemsOfType:]";
    _os_log_impl(&dword_2154F4000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (a3 == 3)
  {
    [(BCSPersistentStore *)self beginBatch];
    v6 = NSString;
    v7 = [MEMORY[0x263EFF910] date];
    [v7 timeIntervalSince1970];
    objc_msgSend(v6, "stringWithFormat:", @"DELETE FROM business_caller_items WHERE expiration_date <= \"%f\"", v8);
    id v9 = objc_claimAutoreleasedReturnValue();
    v10 = (const char *)[v9 UTF8String];

    *(void *)buf = 0;
    if (!sqlite3_prepare_v2([(BCSPersistentStore *)self openedDatabase], v10, -1, (sqlite3_stmt **)buf, 0))
    {
      sqlite3_step(*(sqlite3_stmt **)buf);
      sqlite3_finalize(*(sqlite3_stmt **)buf);
    }
    [(BCSPersistentStore *)self endBatch];
  }
}

- (void)deleteItemMatching:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = ABSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[BCSBusinessCallerPersistentStore deleteItemMatching:]";
    _os_log_impl(&dword_2154F4000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if ([v4 type] == 3)
  {
    [(BCSPersistentStore *)self beginBatch];
    objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM business_caller_items WHERE phone_hash = %lld", objc_msgSend(v4, "truncatedHash"));
    id v6 = objc_claimAutoreleasedReturnValue();
    v7 = (const char *)[v6 UTF8String];

    *(void *)buf = 0;
    if (!sqlite3_prepare_v2([(BCSPersistentStore *)self openedDatabase], v7, -1, (sqlite3_stmt **)buf, 0))
    {
      sqlite3_step(*(sqlite3_stmt **)buf);
      sqlite3_finalize(*(sqlite3_stmt **)buf);
    }
    [(BCSPersistentStore *)self endBatch];
  }
}

- (void)deleteItemsOfType:(int64_t)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v5 = ABSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pStmt = 136315138;
    *(void *)&pStmt[4] = "-[BCSBusinessCallerPersistentStore deleteItemsOfType:]";
    _os_log_impl(&dword_2154F4000, v5, OS_LOG_TYPE_DEFAULT, "%s", pStmt, 0xCu);
  }

  if (a3 == 3)
  {
    [(BCSPersistentStore *)self beginBatch];
    *(void *)pStmt = 0;
    if (!sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), (const char *)[@"DELETE FROM business_caller_items" UTF8String], -1, (sqlite3_stmt **)pStmt, 0))
    {
      sqlite3_step(*(sqlite3_stmt **)pStmt);
      sqlite3_finalize(*(sqlite3_stmt **)pStmt);
    }
    [(BCSPersistentStore *)self endBatch];
  }
}

- (id)itemMatching:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = ABSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[BCSBusinessCallerPersistentStore itemMatching:]";
    _os_log_impl(&dword_2154F4000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if ([v4 type] == 3)
  {
    [(BCSPersistentStore *)self beginBatch];
    [NSString stringWithFormat:@"SELECT phone_hash, phone, message, expiration_date    FROM business_caller_items    WHERE phone_hash = %lld", objc_msgSend(v4, "truncatedHash")];
    id v6 = objc_claimAutoreleasedReturnValue();
    uint64_t v7 = (const char *)[v6 UTF8String];

    *(void *)buf = 0;
    uint64_t v8 = 0;
    if (!sqlite3_prepare_v2([(BCSPersistentStore *)self openedDatabase], v7, -1, (sqlite3_stmt **)buf, 0))
    {
      if (sqlite3_step(*(sqlite3_stmt **)buf) == 100)
      {
        uint64_t v8 = +[BCSBusinessCallerItem itemFromStatement:*(void *)buf];
      }
      else
      {
        uint64_t v8 = 0;
      }
      sqlite3_finalize(*(sqlite3_stmt **)buf);
    }
    [(BCSPersistentStore *)self endBatch];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)updateItem:(id)a3 withItemIdentifier:(id)a4
{
  *(void *)&v18[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)uint64_t v18 = "-[BCSBusinessCallerPersistentStore updateItem:withItemIdentifier:]";
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if ([v7 type] == 3)
  {
    id v9 = v6;
    [(BCSPersistentStore *)self beginBatch];
    ppStmt = 0;
    if (sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), (const char *)objc_msgSend(@"INSERT OR REPLACE INTO business_caller_items    (phone_hash, phone, message, expiration_date)    VALUES (?,?,?,?)", "UTF8String"), -1, &ppStmt, 0))
    {
      v10 = ABSLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        __int16 v14 = sqlite3_errmsg([(BCSPersistentStore *)self openedDatabase]);
        *(_DWORD *)buf = 136315138;
        *(void *)uint64_t v18 = v14;
        _os_log_error_impl(&dword_2154F4000, v10, OS_LOG_TYPE_ERROR, "Failed to update item: %s", buf, 0xCu);
      }
    }
    else
    {
      [v9 updateStatementValues:ppStmt withItemIdentifier:v7];
      int v11 = sqlite3_step(ppStmt);
      if (v11 != 101)
      {
        int v12 = v11;
        v13 = ABSLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          int64_t v15 = sqlite3_errmsg([(BCSPersistentStore *)self openedDatabase]);
          *(_DWORD *)buf = 67109378;
          v18[0] = v12;
          LOWORD(v18[1]) = 2080;
          *(void *)((char *)&v18[1] + 2) = v15;
          _os_log_error_impl(&dword_2154F4000, v13, OS_LOG_TYPE_ERROR, "Failed to insert business caller item: %d (%s)", buf, 0x12u);
        }
      }
      sqlite3_finalize(ppStmt);
    }
    [(BCSPersistentStore *)self endBatch];
  }
}

@end