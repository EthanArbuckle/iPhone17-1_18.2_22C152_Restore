@interface BCSShardItemPersistentStore
+ (const)debugQueueName;
- (BCSShardItemPersistentStore)init;
- (BCSShardItemPersistentStore)initWithSchemaVersion:(int64_t)a3;
- (const)schema;
- (id)databasePath;
- (id)shardItemMatching:(id)a3;
- (int64_t)countOfExpiredShardsOfType:(int64_t)a3;
- (int64_t)countOfShardsOfType:(int64_t)a3;
- (int64_t)schemaVersion;
- (sqlite3_int64)_executeCountSQLQuery:(void *)a1;
- (void)deleteExpiredShardItemsOfType:(int64_t)a3;
- (void)deleteShardItemMatching:(id)a3;
- (void)deleteShardItemsOfType:(int64_t)a3;
- (void)schemaVersionWillChangeForDatabase:(sqlite3 *)a3 fromSchemaVersion:(int64_t)a4 toSchemaVersion:(int64_t)a5;
- (void)updateShardItem:(id)a3 withShardIdentifier:(id)a4;
@end

@implementation BCSShardItemPersistentStore

- (BCSShardItemPersistentStore)init
{
  return [(BCSShardItemPersistentStore *)self initWithSchemaVersion:1];
}

- (BCSShardItemPersistentStore)initWithSchemaVersion:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BCSShardItemPersistentStore;
  result = [(BCSPersistentStore *)&v5 init];
  if (result) {
    result->_schemaVersion = a3;
  }
  return result;
}

+ (const)debugQueueName
{
  return "com.apple.businesschat.persistentStore.shards";
}

- (id)databasePath
{
  if (self)
  {
    if (![(id)_databasePath_databasePath length])
    {
      v3 = +[BCSPathProvider sharedInstance];
      v4 = [v3 documentsURL];
      objc_super v5 = [v4 path];

      uint64_t v6 = [v5 stringByAppendingPathComponent:@"shard_items.db"];
      v7 = (void *)_databasePath_databasePath;
      _databasePath_databasePath = v6;
    }
    self = (BCSShardItemPersistentStore *)(id)_databasePath_databasePath;
    uint64_t v2 = vars8;
  }
  return self;
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
    v13 = "-[BCSShardItemPersistentStore schemaVersionWillChangeForDatabase:fromSchemaVersion:toSchemaVersion:]";
    __int16 v14 = 2048;
    int64_t v15 = a4;
    __int16 v16 = 2048;
    int64_t v17 = a5;
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s schema version will change from '%ld' to '%ld', dropping shard_items table", buf, 0x20u);
  }

  ppStmt = 0;
  if (!sqlite3_prepare_v2(a3, "DROP TABLE IF EXISTS shard_items", -1, &ppStmt, 0))
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      v9 = ABSLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = sqlite3_errmsg(a3);
        *(_DWORD *)buf = 136315138;
        v13 = v10;
        _os_log_error_impl(&dword_2154F4000, v9, OS_LOG_TYPE_ERROR, "error while dropping shard_items table: %s", buf, 0xCu);
      }
    }
    sqlite3_finalize(ppStmt);
  }
}

- (const)schema
{
  return "create table if not exists shard_items (id integer primary key autoincrement, bloom_filter_string text, start_i"
         "ndex integer, shard_count integer, bloom_filter_type integer, expiration_date double)";
}

- (void)updateShardItem:(id)a3 withShardIdentifier:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  [(BCSPersistentStore *)self beginBatch];
  [(BCSShardItemPersistentStore *)self deleteShardItemMatching:v6];
  id v8 = v7;
  if (self)
  {
    [(BCSPersistentStore *)self beginBatch];
    ppStmt = 0;
    v9 = (const char *)objc_msgSend(@"insert into shard_items (bloom_filter_string, start_index, shard_count, bloom_filter_type, expiration_date) values (?,?,?,?,?)", "UTF8String");
    v10 = ABSLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      [v8 base64EncodedString];
      v11 = id v25 = v6;
      uint64_t v12 = [v11 length];
      uint64_t v13 = [v8 startIndex];
      uint64_t v14 = [v8 shardCount];
      uint64_t v15 = [v8 type];
      __int16 v16 = [v8 expirationDate];
      *(_DWORD *)buf = 136316418;
      v28 = "-[BCSShardItemPersistentStore _updateShardItem:withShardIdentifier:]";
      __int16 v29 = 2048;
      uint64_t v30 = v12;
      __int16 v31 = 2048;
      uint64_t v32 = v13;
      __int16 v33 = 2048;
      uint64_t v34 = v14;
      __int16 v35 = 2048;
      uint64_t v36 = v15;
      __int16 v37 = 2112;
      v38 = v16;
      _os_log_impl(&dword_2154F4000, v10, OS_LOG_TYPE_DEFAULT, "%s Inserting shard into DB Shard Item of length %lu startIndex %lld shardCount %lld type %ld %@", buf, 0x3Eu);

      id v6 = v25;
    }

    if (!sqlite3_prepare_v2([(BCSPersistentStore *)self openedDatabase], v9, -1, &ppStmt, 0))
    {
      int64_t v17 = ppStmt;
      id v18 = [v8 base64EncodedString];
      sqlite3_bind_text(v17, 1, (const char *)[v18 UTF8String], -1, 0);

      sqlite3_bind_int64(ppStmt, 2, [v8 startIndex]);
      sqlite3_bind_int64(ppStmt, 3, [v8 shardCount]);
      sqlite3_bind_int(ppStmt, 4, [v8 type]);
      v19 = ppStmt;
      v20 = [v8 expirationDate];
      [v20 timeIntervalSince1970];
      sqlite3_bind_double(v19, 5, v21);

      int v22 = sqlite3_step(ppStmt);
      sqlite3_finalize(ppStmt);
      if (v22 != 101)
      {
        v23 = ABSLogCommon();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = sqlite3_errmsg([(BCSPersistentStore *)self openedDatabase]);
          *(_DWORD *)buf = 134218242;
          v28 = (const char *)v22;
          __int16 v29 = 2080;
          uint64_t v30 = (uint64_t)v24;
          _os_log_error_impl(&dword_2154F4000, v23, OS_LOG_TYPE_ERROR, "Error while finalizing insert shard item %lu %s", buf, 0x16u);
        }
      }
    }
    [(BCSPersistentStore *)self endBatch];
  }

  [(BCSPersistentStore *)self endBatch];
}

- (id)shardItemMatching:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = ABSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[BCSShardItemPersistentStore shardItemMatching:]";
    __int16 v17 = 2048;
    uint64_t v18 = [v4 startIndex];
    __int16 v19 = 2048;
    uint64_t v20 = [v4 shardCount];
    __int16 v21 = 2048;
    uint64_t v22 = [v4 type];
    _os_log_impl(&dword_2154F4000, v5, OS_LOG_TYPE_DEFAULT, "%s Fetching shard from DB Shard Item from startIndex %lld shardCount %lld type %ld", buf, 0x2Au);
  }

  objc_msgSend(NSString, "stringWithFormat:", @"select * from shard_items where start_index=\"%lld\" AND shard_count = \"%lld\" AND bloom_filter_type = \"%ld\", objc_msgSend(v4, "startIndex"), objc_msgSend(v4, "shardCount"), objc_msgSend(v4, "type""));
  id v6 = objc_claimAutoreleasedReturnValue();
  id v7 = (const char *)[v6 UTF8String];

  if (self)
  {
    [(BCSPersistentStore *)self beginBatch];
    *(void *)buf = 0;
    id v8 = 0;
    if (!sqlite3_prepare_v2([(BCSPersistentStore *)self openedDatabase], v7, -1, (sqlite3_stmt **)buf, 0))
    {
      if (sqlite3_step(*(sqlite3_stmt **)buf) == 100)
      {
        v9 = *(sqlite3_stmt **)buf;
        if (sqlite3_column_text(*(sqlite3_stmt **)buf, 1)) {
          v10 = (__CFString *)objc_msgSend([NSString alloc], "initWithUTF8String:", sqlite3_column_text(v9, 1));
        }
        else {
          v10 = &stru_26C611188;
        }
        sqlite3_int64 v11 = sqlite3_column_int64(v9, 2);
        sqlite3_int64 v12 = sqlite3_column_int64(v9, 3);
        uint64_t v13 = sqlite3_column_int(v9, 4);
        uint64_t v14 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", sqlite3_column_double(v9, 5));
        id v8 = [[BCSFilterShardItem alloc] initWithBloomFilterString:v10 startIndex:v11 shardCount:v12 type:v13 expirationDate:v14];
      }
      else
      {
        id v8 = 0;
      }
      sqlite3_finalize(*(sqlite3_stmt **)buf);
    }
    [(BCSPersistentStore *)self endBatch];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)deleteShardItemMatching:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  uint64_t v6 = [v5 startIndex];
  uint64_t v7 = [v5 shardCount];
  uint64_t v8 = [v5 type];

  objc_msgSend(v4, "stringWithFormat:", @"delete from shard_items where start_index=\"%lld\" AND shard_count = \"%lld\" AND bloom_filter_type = \"%ld\"", v6, v7, v8);
  id v9 = objc_claimAutoreleasedReturnValue();
  v10 = (const char *)[v9 UTF8String];

  -[BCSLinkItemPersistentStore _executeDeleteSQLQuery:](self, v10);
}

- (void)deleteShardItemsOfType:(int64_t)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"delete from shard_items where bloom_filter_type = \"%ld\"", a3);
  id v4 = objc_claimAutoreleasedReturnValue();
  id v5 = (const char *)[v4 UTF8String];

  -[BCSLinkItemPersistentStore _executeDeleteSQLQuery:](self, v5);
}

- (void)deleteExpiredShardItemsOfType:(int64_t)a3
{
  id v5 = NSString;
  uint64_t v6 = [MEMORY[0x263EFF910] date];
  [v6 timeIntervalSince1970];
  objc_msgSend(v5, "stringWithFormat:", @"delete from shard_items where bloom_filter_type = \"%ld\" AND expiration_date <= \"%f\"", a3, v7);
  id v8 = objc_claimAutoreleasedReturnValue();
  id v9 = (const char *)[v8 UTF8String];

  -[BCSLinkItemPersistentStore _executeDeleteSQLQuery:](self, v9);
}

- (int64_t)countOfShardsOfType:(int64_t)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"select count(*) from shard_items where bloom_filter_type = \"%ld\"", a3);
  id v4 = objc_claimAutoreleasedReturnValue();
  id v5 = (const char *)[v4 UTF8String];

  return -[BCSShardItemPersistentStore _executeCountSQLQuery:](self, v5);
}

- (sqlite3_int64)_executeCountSQLQuery:(void *)a1
{
  if (!a1) {
    return 0;
  }
  [a1 beginBatch];
  ppStmt = 0;
  int v4 = sqlite3_prepare_v2((sqlite3 *)[a1 openedDatabase], a2, -1, &ppStmt, 0);
  sqlite3_int64 v5 = 0;
  if (!v4)
  {
    if (sqlite3_step(ppStmt) == 100) {
      sqlite3_int64 v5 = sqlite3_column_int64(ppStmt, 0);
    }
    else {
      sqlite3_int64 v5 = 0;
    }
    sqlite3_finalize(ppStmt);
  }
  [a1 endBatch];
  return v5;
}

- (int64_t)countOfExpiredShardsOfType:(int64_t)a3
{
  sqlite3_int64 v5 = NSString;
  uint64_t v6 = [MEMORY[0x263EFF910] date];
  [v6 timeIntervalSince1970];
  objc_msgSend(v5, "stringWithFormat:", @"select count(*) from shard_items where bloom_filter_type = \"%ld\" AND expiration_date <= \"%f\"", a3, v7);
  id v8 = objc_claimAutoreleasedReturnValue();
  id v9 = (const char *)[v8 UTF8String];

  return -[BCSShardItemPersistentStore _executeCountSQLQuery:](self, v9);
}

@end