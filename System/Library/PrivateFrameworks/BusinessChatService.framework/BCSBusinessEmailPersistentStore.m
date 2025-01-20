@interface BCSBusinessEmailPersistentStore
+ (const)debugQueueName;
- (BCSBusinessEmailPersistentStore)init;
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

@implementation BCSBusinessEmailPersistentStore

- (BCSBusinessEmailPersistentStore)init
{
  if (self)
  {
    v2.receiver = self;
    v2.super_class = (Class)BCSBusinessEmailPersistentStore;
    self = [(BCSPersistentStore *)&v2 init];
    if (self) {
      self->_schemaVersion = 2;
    }
  }
  return self;
}

- (id)databasePath
{
  if (![(id)databasePath_databasePath_1 length])
  {
    objc_super v2 = +[BCSPathProvider sharedInstance];
    v3 = [v2 documentsURL];
    v4 = [v3 path];

    uint64_t v5 = [v4 stringByAppendingPathComponent:@"business_email_items.db"];
    v6 = (void *)databasePath_databasePath_1;
    databasePath_databasePath_1 = v5;
  }
  v7 = (void *)databasePath_databasePath_1;

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
    v13 = "-[BCSBusinessEmailPersistentStore schemaVersionWillChangeForDatabase:fromSchemaVersion:toSchemaVersion:]";
    __int16 v14 = 2048;
    int64_t v15 = a4;
    __int16 v16 = 2048;
    int64_t v17 = a5;
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s schema version will change from '%ld' to '%ld', dropping link_items table", buf, 0x20u);
  }

  ppStmt = 0;
  if (!sqlite3_prepare_v2(a3, "DROP TABLE IF EXISTS business_email_items", -1, &ppStmt, 0))
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
  return "CREATE TABLE IF NOT EXISTS business_email_items    (key INTEGER PRIMARY KEY,     message BLOB,     message_type"
         " INTEGER,     expiration_date DOUBLE)";
}

+ (const)debugQueueName
{
  return "com.apple.businessservices.persistentStore.businessEmailItems";
}

- (void)deleteExpiredItemsOfType:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = ABSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[BCSBusinessEmailPersistentStore deleteExpiredItemsOfType:]";
    _os_log_impl(&dword_2154F4000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (a3 == 4)
  {
    [(BCSPersistentStore *)self beginBatch];
    v6 = NSString;
    v7 = [MEMORY[0x263EFF910] date];
    [v7 timeIntervalSince1970];
    objc_msgSend(v6, "stringWithFormat:", @"DELETE FROM business_email_items WHERE expiration_date <= \"%f\"", v8);
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
    *(void *)&uint8_t buf[4] = "-[BCSBusinessEmailPersistentStore deleteItemMatching:]";
    _os_log_impl(&dword_2154F4000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if ([v4 type] == 4)
  {
    [(BCSPersistentStore *)self beginBatch];
    objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM business_email_items WHERE key = %lld AND message_type = %ld", objc_msgSend(v4, "truncatedHash"), BCSEmailStoreTypeForItemIdentifier(v4));
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
    *(void *)&pStmt[4] = "-[BCSBusinessEmailPersistentStore deleteItemsOfType:]";
    _os_log_impl(&dword_2154F4000, v5, OS_LOG_TYPE_DEFAULT, "%s", pStmt, 0xCu);
  }

  if (a3 == 4)
  {
    [(BCSPersistentStore *)self beginBatch];
    *(void *)pStmt = 0;
    if (!sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), (const char *)[@"DELETE FROM business_email_items" UTF8String], -1, (sqlite3_stmt **)pStmt, 0))
    {
      sqlite3_step(*(sqlite3_stmt **)pStmt);
      sqlite3_finalize(*(sqlite3_stmt **)pStmt);
    }
    [(BCSPersistentStore *)self endBatch];
  }
}

- (id)itemMatching:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = ABSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[BCSBusinessEmailPersistentStore itemMatching:]";
    _os_log_impl(&dword_2154F4000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if ([v4 type] != 4)
  {
    id v11 = 0;
    goto LABEL_23;
  }
  uint64_t v6 = BCSEmailStoreTypeForItemIdentifier(v4);
  [(BCSPersistentStore *)self beginBatch];
  [NSString stringWithFormat:@"SELECT key, message, message_type, expiration_date    FROM business_email_items    WHERE key = %lld AND message_type = %ld", objc_msgSend(v4, "truncatedHash"), v6];
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (const char *)[v7 UTF8String];

  ppStmt = 0;
  uint64_t v9 = 0;
  if (!sqlite3_prepare_v2([(BCSPersistentStore *)self openedDatabase], v8, -1, &ppStmt, 0))
  {
    if (sqlite3_step(ppStmt) == 100)
    {
      if (v6 == 2)
      {
        v10 = BCSBusinessLogo;
        goto LABEL_12;
      }
      if (v6 == 1)
      {
        v10 = BCSBusinessEmailItem;
LABEL_12:
        uint64_t v9 = [(__objc2_class *)v10 itemFromStatement:ppStmt];
        goto LABEL_13;
      }
    }
    uint64_t v9 = 0;
LABEL_13:
    sqlite3_finalize(ppStmt);
  }
  [(BCSPersistentStore *)self endBatch];
  if (v9 && v6 == 1)
  {
    id v12 = v9;
    v13 = [v12 identifier];
    uint64_t v14 = [v13 truncatedHash];
    uint64_t v15 = [v4 truncatedHash];

    if (v14 != v15)
    {
      __int16 v16 = ABSLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = [v4 type];
        uint64_t v19 = [v4 truncatedHash];
        v20 = [v12 email];
        *(_DWORD *)buf = 136315907;
        v23 = "-[BCSBusinessEmailPersistentStore itemMatching:]";
        __int16 v24 = 2048;
        uint64_t v25 = v18;
        __int16 v26 = 2048;
        uint64_t v27 = v19;
        __int16 v28 = 2113;
        v29 = v20;
        _os_log_error_impl(&dword_2154F4000, v16, OS_LOG_TYPE_ERROR, "%s - Mismatching item found in cache for type: %ld, hash: %lld (%{private}@)", buf, 0x2Au);
      }
      [(BCSBusinessEmailPersistentStore *)self deleteItemMatching:v4];

      id v11 = 0;
      goto LABEL_22;
    }
  }
  id v11 = v9;
LABEL_22:

LABEL_23:

  return v11;
}

- (void)updateItem:(id)a3 withItemIdentifier:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)__int16 v26 = "-[BCSBusinessEmailPersistentStore updateItem:withItemIdentifier:]";
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if ([v7 type] == 4)
  {
    uint64_t v9 = BCSEmailStoreTypeForItemIdentifier(v7);
    if (!v6 || v9 != 1) {
      goto LABEL_8;
    }
    id v10 = v6;
    id v11 = [v10 identifier];
    uint64_t v12 = [v11 truncatedHash];
    uint64_t v13 = [v7 truncatedHash];

    if (v12 == v13)
    {

LABEL_8:
      [(BCSPersistentStore *)self beginBatch];
      ppStmt = 0;
      if (sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), (const char *)objc_msgSend(@"INSERT OR REPLACE INTO business_email_items    (key, message, message_type, expiration_date)    VALUES (?,?,?,?)", "UTF8String"), -1, &ppStmt, 0))
      {
        uint64_t v14 = ABSLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = sqlite3_errmsg([(BCSPersistentStore *)self openedDatabase]);
          *(_DWORD *)buf = 136315138;
          *(void *)__int16 v26 = v19;
          _os_log_error_impl(&dword_2154F4000, v14, OS_LOG_TYPE_ERROR, "Failed to update item: %s", buf, 0xCu);
        }
      }
      else
      {
        [v6 updateStatementValues:ppStmt withItemIdentifier:v7];
        int v15 = sqlite3_step(ppStmt);
        if (v15 != 101)
        {
          int v16 = v15;
          int64_t v17 = ABSLogCommon();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v23 = sqlite3_errmsg([(BCSPersistentStore *)self openedDatabase]);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)__int16 v26 = v16;
            *(_WORD *)&v26[4] = 2080;
            *(void *)&v26[6] = v23;
            _os_log_error_impl(&dword_2154F4000, v17, OS_LOG_TYPE_ERROR, "Failed to insert business email item: %d (%s)", buf, 0x12u);
          }
        }
        sqlite3_finalize(ppStmt);
      }
      [(BCSPersistentStore *)self endBatch];
      goto LABEL_21;
    }
    uint64_t v18 = ABSLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [v7 type];
      uint64_t v21 = [v7 truncatedHash];
      v22 = [v10 email];
      *(_DWORD *)buf = 136315907;
      *(void *)__int16 v26 = "-[BCSBusinessEmailPersistentStore updateItem:withItemIdentifier:]";
      *(_WORD *)&v26[8] = 2048;
      *(void *)&v26[10] = v20;
      __int16 v27 = 2048;
      uint64_t v28 = v21;
      __int16 v29 = 2113;
      uint64_t v30 = v22;
      _os_log_error_impl(&dword_2154F4000, v18, OS_LOG_TYPE_ERROR, "%s - Refusing to store mismatching item found in cache for type: %ld, hash: %lld (%{private}@)", buf, 0x2Au);
    }
  }
LABEL_21:
}

@end