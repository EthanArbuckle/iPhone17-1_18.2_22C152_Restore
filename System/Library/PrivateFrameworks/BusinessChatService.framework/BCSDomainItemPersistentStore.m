@interface BCSDomainItemPersistentStore
- (BOOL)executeDeleteDomainDomainItemSQLQuery:(id)a3;
- (const)schema;
- (id)databasePath;
- (id)domainItemMatching:(id)a3;
- (int64_t)schemaVersion;
- (void)deleteAllDomainItems;
- (void)deleteAllExpiredDomainItems;
- (void)deleteDomainItemMatching:(id)a3;
- (void)updateDomainItem:(id)a3 withDomainItemIdentifier:(id)a4;
- (void)updateDomainItemsForDomainShard:(id)a3;
@end

@implementation BCSDomainItemPersistentStore

- (id)databasePath
{
  if (![(id)databasePath_databasePath_0 length])
  {
    v2 = +[BCSPathProvider sharedInstance];
    v3 = [v2 documentsURL];
    v4 = [v3 path];

    uint64_t v5 = [v4 stringByAppendingPathComponent:@"domain_shard_items.db"];
    v6 = (void *)databasePath_databasePath_0;
    databasePath_databasePath_0 = v5;
  }
  v7 = (void *)databasePath_databasePath_0;

  return v7;
}

- (int64_t)schemaVersion
{
  return 1;
}

- (const)schema
{
  return (const char *)objc_msgSend(@"create table if not exists domain_shard_items (domain text primary key, shard_item, expiration_date double)", "UTF8String");
}

- (id)domainItemMatching:(id)a3
{
  v4 = NSString;
  uint64_t v5 = [a3 domain];
  [v4 stringWithFormat:@"select * from domain_shard_items where domain=\"%@\"", v5];
  id v6 = objc_claimAutoreleasedReturnValue();
  v7 = (const char *)[v6 UTF8String];

  [(BCSPersistentStore *)self beginBatch];
  ppStmt = 0;
  v8 = 0;
  if (!sqlite3_prepare_v2([(BCSPersistentStore *)self openedDatabase], v7, -1, &ppStmt, 0))
  {
    if (sqlite3_step(ppStmt) == 100)
    {
      if (sqlite3_column_text(ppStmt, 1))
      {
        id v9 = [NSString alloc];
        v10 = (__CFString *)objc_msgSend(v9, "initWithUTF8String:", sqlite3_column_text(ppStmt, 1));
      }
      else
      {
        v10 = &stru_26C611188;
      }
      v11 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", sqlite3_column_double(ppStmt, 2));
      v8 = [[BCSDomainItem alloc] initWithBase64EncodedShardString:v10 expirationDate:v11];
    }
    else
    {
      v8 = 0;
    }
    sqlite3_finalize(ppStmt);
  }
  [(BCSPersistentStore *)self endBatch];

  return v8;
}

- (void)updateDomainItemsForDomainShard:(id)a3
{
  id v16 = a3;
  v4 = [BCSLineReader alloc];
  uint64_t v5 = [v16 fileURL];
  id v6 = [(BCSLineReader *)v4 initWithFileURL:v5];

  v7 = (void *)MEMORY[0x2166BD910]([(BCSLineReader *)v6 readLine]);
  uint64_t v8 = [(BCSLineReader *)v6 readLine];
  if (v8)
  {
    id v9 = (void *)v8;
    do
    {
      v10 = [BCSDomainItem alloc];
      v11 = [v16 expirationDate];
      v12 = [(BCSDomainItem *)v10 initWithBase64EncodedShardString:v9 expirationDate:v11];

      v13 = [(BCSDomainItem *)v12 domain];
      v14 = +[BCSDomainItemIdentifier identifierWithType:3 domain:v13];

      v15 = [(BCSDomainItemPersistentStore *)self domainItemMatching:v14];

      if (v15) {
        [(BCSDomainItemPersistentStore *)self deleteDomainItemMatching:v14];
      }
      [(BCSDomainItemPersistentStore *)self updateDomainItem:v12 withDomainItemIdentifier:v14];

      v7 = (void *)MEMORY[0x2166BD910]();
      id v9 = [(BCSLineReader *)v6 readLine];
    }
    while (v9);
  }
}

- (void)updateDomainItem:(id)a3 withDomainItemIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(BCSPersistentStore *)self beginBatch];
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), (const char *)objc_msgSend(@"insert into domain_shard_items (domain, shard_item, expiration_date) values (?,?,?)", "UTF8String"), -1, &ppStmt, 0))
  {
    id v6 = ppStmt;
    id v7 = [v5 domain];
    sqlite3_bind_text(v6, 1, (const char *)[v7 UTF8String], -1, 0);

    uint64_t v8 = ppStmt;
    id v9 = [v5 base64EncodedShardString];
    sqlite3_bind_text(v8, 2, (const char *)[v9 UTF8String], -1, 0);

    v10 = ppStmt;
    v11 = [v5 expirationDate];
    [v11 timeIntervalSince1970];
    sqlite3_bind_double(v10, 3, v12);

    int v13 = sqlite3_step(ppStmt);
    sqlite3_finalize(ppStmt);
    if (v13 != 101)
    {
      v14 = ABSLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = sqlite3_errmsg([(BCSPersistentStore *)self openedDatabase]);
        *(_DWORD *)buf = 134218242;
        uint64_t v18 = v13;
        __int16 v19 = 2080;
        v20 = v15;
        _os_log_error_impl(&dword_2154F4000, v14, OS_LOG_TYPE_ERROR, "Error while finalizing insert shard item %lu %s", buf, 0x16u);
      }
    }
  }
  [(BCSPersistentStore *)self endBatch];
}

- (void)deleteDomainItemMatching:(id)a3
{
  v4 = NSString;
  id v5 = [a3 domain];
  [v4 stringWithFormat:@"delete from domain_shard_items where domain=\"%@\"", v5];
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [(BCSDomainItemPersistentStore *)self executeDeleteDomainDomainItemSQLQuery:v6];
}

- (void)deleteAllDomainItems
{
  id v3 = [NSString stringWithFormat:@"delete from domain_shard_items"];
  [(BCSDomainItemPersistentStore *)self executeDeleteDomainDomainItemSQLQuery:v3];
}

- (void)deleteAllExpiredDomainItems
{
  id v3 = NSString;
  v4 = [MEMORY[0x263EFF910] date];
  [v4 timeIntervalSince1970];
  objc_msgSend(v3, "stringWithFormat:", @"delete from domain_shard_items where expiration_date <= \"%f\"", v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [(BCSDomainItemPersistentStore *)self executeDeleteDomainDomainItemSQLQuery:v6];
}

- (BOOL)executeDeleteDomainDomainItemSQLQuery:(id)a3
{
  id v4 = a3;
  [(BCSPersistentStore *)self beginBatch];
  ppStmt = 0;
  uint64_t v5 = [(BCSPersistentStore *)self openedDatabase];
  id v6 = v4;
  id v7 = (const char *)[v6 UTF8String];

  if (sqlite3_prepare_v2(v5, v7, -1, &ppStmt, 0))
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = sqlite3_step(ppStmt) == 101;
    sqlite3_finalize(ppStmt);
  }
  [(BCSPersistentStore *)self endBatch];
  return v8;
}

@end