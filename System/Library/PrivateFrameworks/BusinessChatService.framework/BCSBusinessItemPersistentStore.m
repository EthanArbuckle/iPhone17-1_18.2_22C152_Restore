@interface BCSBusinessItemPersistentStore
+ (const)debugQueueName;
- (BCSPersistentBusinessItemObject)_executeFetchPersistentBusinessItemObjectSQLQuery:(void *)a1;
- (BOOL)_executeDeleteBusinessItemSQLQuery:(void *)a1;
- (BOOL)deleteBusinessItem:(id)a3;
- (BOOL)deleteBusinessItemWithBizID:(id)a3;
- (BOOL)deleteBusinessItemWithPhoneNumber:(id)a3;
- (BOOL)insertOrReplaceBusinessItem:(id)a3 withTTL:(double)a4;
- (BOOL)updateLastRetrievedDateForBusinessItem:(id)a3;
- (BOOL)updateTTL:(double)a3 forBusinessItem:(id)a4;
- (const)schema;
- (id)databasePath;
- (id)fetchPersistentBusinessItemObjectWithBizID:(id)a3;
- (id)fetchPersistentBusinessItemObjectWithPhoneNumber:(id)a3;
- (int64_t)schemaVersion;
@end

@implementation BCSBusinessItemPersistentStore

+ (const)debugQueueName
{
  return "com.apple.businesschat.persistentStore.businessItems";
}

- (id)databasePath
{
  if (self)
  {
    if (![(id)_databasePath_databasePath_0 length])
    {
      v3 = +[BCSPathProvider sharedInstance];
      v4 = [v3 documentsURL];
      v5 = [v4 path];

      uint64_t v6 = [v5 stringByAppendingPathComponent:@"business_items.db"];
      v7 = (void *)_databasePath_databasePath_0;
      _databasePath_databasePath_0 = v6;
    }
    self = (BCSBusinessItemPersistentStore *)(id)_databasePath_databasePath_0;
    uint64_t v2 = vars8;
  }
  return self;
}

- (int64_t)schemaVersion
{
  return 5;
}

- (const)schema
{
  return "create table if not exists business_items (id integer primary key autoincrement, biz_id text, phone_number text"
         ", name text, phone_hash integer, square_logo_url text, wide_logo_url text, tint_color integer, background_color"
         " integer, call_to_actions_data blob, is_verified integer, messaging_open_hours_data blob, calling_open_hours_da"
         "ta blob, last_retrieved_date integer, time_to_live_date double, intent_id text, group_id text, visibility_items blob)";
}

- (BOOL)insertOrReplaceBusinessItem:(id)a3 withTTL:(double)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  if (!self) {
    return 0;
  }
  id v6 = a3;
  [(BCSPersistentStore *)self beginBatch];
  [(BCSBusinessItemPersistentStore *)self deleteBusinessItem:v6];
  id v7 = v6;
  [(BCSPersistentStore *)self beginBatch];
  ppStmt = 0;
  v8 = (void *)MEMORY[0x263F08910];
  v9 = [v7 messagingOpenHours];
  v10 = [v8 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:0];

  v11 = (void *)MEMORY[0x263F08910];
  v12 = [v7 callingOpenHours];
  v13 = [v11 archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];

  v14 = (void *)MEMORY[0x263F08910];
  v15 = [v7 callToActions];
  v16 = [v14 archivedDataWithRootObject:v15 requiringSecureCoding:1 error:0];

  v17 = (void *)MEMORY[0x263F08910];
  v18 = [v7 visibilityItems];
  v19 = [v17 archivedDataWithRootObject:v18 requiringSecureCoding:1 error:0];

  if (sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), (const char *)objc_msgSend(@"insert into business_items (biz_id, phone_number, name, phone_hash, square_logo_url, wide_logo_url, tint_color, background_color, call_to_actions_data, is_verified, messaging_open_hours_data, calling_open_hours_data, last_retrieved_date, time_to_live_date, intent_id, group_id, visibility_items) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", "UTF8String"), -1, &ppStmt, 0))
  {
    goto LABEL_7;
  }
  v20 = ppStmt;
  id v21 = [v7 bizID];
  BOOL v22 = 1;
  sqlite3_bind_text(v20, 1, (const char *)[v21 UTF8String], -1, 0);

  v23 = ppStmt;
  id v24 = [v7 phoneNumber];
  sqlite3_bind_text(v23, 2, (const char *)[v24 UTF8String], -1, 0);

  v25 = ppStmt;
  id v26 = [v7 name];
  sqlite3_bind_text(v25, 3, (const char *)[v26 UTF8String], -1, 0);

  sqlite3_bind_int64(ppStmt, 4, [v7 phoneHash]);
  v27 = ppStmt;
  v28 = [v7 squareLogoURL];
  id v29 = [v28 absoluteString];
  sqlite3_bind_text(v27, 5, (const char *)[v29 UTF8String], -1, 0);

  v30 = ppStmt;
  v31 = [v7 wideLogoURL];
  id v32 = [v31 absoluteString];
  sqlite3_bind_text(v30, 6, (const char *)[v32 UTF8String], -1, 0);

  sqlite3_bind_int(ppStmt, 7, [v7 tintColor]);
  sqlite3_bind_int(ppStmt, 8, [v7 backgroundColor]);
  v33 = ppStmt;
  id v34 = v16;
  sqlite3_bind_blob(v33, 9, (const void *)[v34 bytes], objc_msgSend(v34, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int(ppStmt, 10, [v7 isVerified]);
  v35 = ppStmt;
  id v36 = v10;
  sqlite3_bind_blob(v35, 11, (const void *)[v36 bytes], objc_msgSend(v36, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  v37 = ppStmt;
  id v38 = v13;
  sqlite3_bind_blob(v37, 12, (const void *)[v38 bytes], objc_msgSend(v38, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  v39 = ppStmt;
  v40 = [MEMORY[0x263EFF910] date];
  [v40 timeIntervalSince1970];
  sqlite3_bind_int(v39, 13, (int)v41);

  v42 = ppStmt;
  v43 = [MEMORY[0x263EFF910] date];
  v44 = [v43 dateByAddingTimeInterval:a4];
  [v44 timeIntervalSince1970];
  sqlite3_bind_double(v42, 14, v45);

  v46 = ppStmt;
  id v47 = [v7 intentID];
  sqlite3_bind_text(v46, 15, (const char *)[v47 UTF8String], -1, 0);

  v48 = ppStmt;
  id v49 = [v7 groupID];
  sqlite3_bind_text(v48, 16, (const char *)[v49 UTF8String], -1, 0);

  v50 = ppStmt;
  id v51 = v19;
  sqlite3_bind_blob(v50, 17, (const void *)[v51 bytes], objc_msgSend(v51, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  int v52 = sqlite3_step(ppStmt);
  sqlite3_finalize(ppStmt);
  if (v52 != 101)
  {
    v53 = ABSLogCommon();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v55 = sqlite3_errmsg([(BCSPersistentStore *)self openedDatabase]);
      *(_DWORD *)buf = 134218242;
      uint64_t v58 = v52;
      __int16 v59 = 2080;
      v60 = v55;
      _os_log_error_impl(&dword_2154F4000, v53, OS_LOG_TYPE_ERROR, "Error while finalizing insert business item %lu %s", buf, 0x16u);
    }

LABEL_7:
    BOOL v22 = 0;
  }
  [(BCSPersistentStore *)self endBatch];

  [(BCSPersistentStore *)self endBatch];
  return v22;
}

- (BOOL)updateTTL:(double)a3 forBusinessItem:(id)a4
{
  id v6 = a4;
  [(BCSPersistentStore *)self beginBatch];
  ppStmt = 0;
  id v7 = NSString;
  v8 = [MEMORY[0x263EFF910] date];
  v9 = [v8 dateByAddingTimeInterval:a3];
  [v9 timeIntervalSince1970];
  double v11 = v10;
  v12 = [v6 bizID];
  uint64_t v13 = [v12 length];
  BOOL v22 = v8;
  v23 = self;
  if (v13)
  {
    v14 = [v6 bizID];
  }
  else
  {
    v14 = &stru_26C611188;
  }
  v15 = [v6 phoneNumber];
  uint64_t v16 = [v15 length];
  if (v16)
  {
    v17 = [v6 phoneNumber];
  }
  else
  {
    v17 = &stru_26C611188;
  }
  [v7 stringWithFormat:@"UPDATE business_items SET time_to_live_date = \"%u\" WHERE biz_id = \"%@\" OR phone_number = \"%@\"", (int)v11, v14, v17];
  id v18 = objc_claimAutoreleasedReturnValue();
  v19 = (const char *)[v18 UTF8String];

  if (v16) {
  if (v13)
  }

  if (sqlite3_prepare_v2([(BCSPersistentStore *)v23 openedDatabase], v19, -1, &ppStmt, 0)
    || sqlite3_step(ppStmt) != 101)
  {
    BOOL v20 = 0;
  }
  else
  {
    sqlite3_finalize(ppStmt);
    BOOL v20 = 1;
  }
  [(BCSPersistentStore *)v23 endBatch];

  return v20;
}

- (BOOL)updateLastRetrievedDateForBusinessItem:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  id v6 = [v4 date];
  id v7 = v5;
  if (self)
  {
    id v8 = v6;
    [(BCSPersistentStore *)self beginBatch];
    ppStmt = 0;
    v9 = NSString;
    [v8 timeIntervalSince1970];
    double v11 = v10;

    v12 = [v7 bizID];
    uint64_t v13 = [v12 length];
    BOOL v22 = v6;
    if (v13)
    {
      v14 = [v7 bizID];
    }
    else
    {
      v14 = &stru_26C611188;
    }
    v15 = [v7 phoneNumber];
    uint64_t v16 = [v15 length];
    if (v16)
    {
      v17 = [v7 phoneNumber];
    }
    else
    {
      v17 = &stru_26C611188;
    }
    [v9 stringWithFormat:@"UPDATE business_items SET last_retrieved_date = \"%u\" WHERE biz_id = \"%@\" OR phone_number = \"%@\"", (int)v11, v14, v17];
    id v18 = objc_claimAutoreleasedReturnValue();
    v19 = (const char *)[v18 UTF8String];

    if (v16) {
    id v6 = v22;
    }
    if (v13) {

    }
    if (sqlite3_prepare_v2([(BCSPersistentStore *)self openedDatabase], v19, -1, &ppStmt, 0)
      || sqlite3_step(ppStmt) != 101)
    {
      BOOL v20 = 0;
    }
    else
    {
      sqlite3_finalize(ppStmt);
      BOOL v20 = 1;
    }
    [(BCSPersistentStore *)self endBatch];
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (id)fetchPersistentBusinessItemObjectWithBizID:(id)a3
{
  [NSString stringWithFormat:@"select * from business_items where biz_id=\"%@\"", a3];
  id v4 = objc_claimAutoreleasedReturnValue();
  id v5 = (const char *)[v4 UTF8String];

  return -[BCSBusinessItemPersistentStore _executeFetchPersistentBusinessItemObjectSQLQuery:](self, v5);
}

- (BCSPersistentBusinessItemObject)_executeFetchPersistentBusinessItemObjectSQLQuery:(void *)a1
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  if (a1)
  {
    [a1 beginBatch];
    ppStmt = 0;
    id v4 = 0;
    if (!sqlite3_prepare_v2((sqlite3 *)[a1 openedDatabase], a2, -1, &ppStmt, 0))
    {
      if (sqlite3_step(ppStmt) == 100)
      {
        if (sqlite3_column_text(ppStmt, 1))
        {
          id v5 = [NSString alloc];
          v80 = (__CFString *)objc_msgSend(v5, "initWithUTF8String:", sqlite3_column_text(ppStmt, 1));
        }
        else
        {
          v80 = &stru_26C611188;
        }
        if (sqlite3_column_text(ppStmt, 2))
        {
          id v6 = [NSString alloc];
          v79 = (__CFString *)objc_msgSend(v6, "initWithUTF8String:", sqlite3_column_text(ppStmt, 2));
        }
        else
        {
          v79 = &stru_26C611188;
        }
        if (sqlite3_column_text(ppStmt, 3))
        {
          id v7 = [NSString alloc];
          v78 = (__CFString *)objc_msgSend(v7, "initWithUTF8String:", sqlite3_column_text(ppStmt, 3));
        }
        else
        {
          v78 = &stru_26C611188;
        }
        sqlite3_int64 v74 = sqlite3_column_int64(ppStmt, 4);
        id v8 = sqlite3_column_text(ppStmt, 5);
        v9 = NSURL;
        if (v8)
        {
          id v10 = [NSString alloc];
          double v11 = objc_msgSend(v10, "initWithUTF8String:", sqlite3_column_text(ppStmt, 5));
          v77 = [v9 URLWithString:v11];
        }
        else
        {
          v77 = [NSURL URLWithString:&stru_26C611188];
        }
        v12 = sqlite3_column_text(ppStmt, 6);
        uint64_t v13 = NSURL;
        if (v12)
        {
          id v14 = [NSString alloc];
          v15 = objc_msgSend(v14, "initWithUTF8String:", sqlite3_column_text(ppStmt, 6));
          v76 = [v13 URLWithString:v15];
        }
        else
        {
          v76 = [NSURL URLWithString:&stru_26C611188];
        }
        int v64 = sqlite3_column_int(ppStmt, 7);
        int v63 = sqlite3_column_int(ppStmt, 8);
        int v71 = sqlite3_column_int(ppStmt, 10);
        v73 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)sqlite3_column_int(ppStmt, 13));
        v72 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", sqlite3_column_double(ppStmt, 14));
        if (sqlite3_column_text(ppStmt, 15))
        {
          id v16 = [NSString alloc];
          v75 = (__CFString *)objc_msgSend(v16, "initWithUTF8String:", sqlite3_column_text(ppStmt, 15));
        }
        else
        {
          v75 = &stru_26C611188;
        }
        if (sqlite3_column_text(ppStmt, 16))
        {
          id v17 = [NSString alloc];
          v70 = (__CFString *)objc_msgSend(v17, "initWithUTF8String:", sqlite3_column_text(ppStmt, 16));
        }
        else
        {
          v70 = &stru_26C611188;
        }
        id v18 = sqlite3_column_blob(ppStmt, 9);
        uint64_t v19 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v18, sqlite3_column_bytes(ppStmt, 9));
        BOOL v20 = (void *)MEMORY[0x263F08928];
        id v21 = (void *)MEMORY[0x263EFFA08];
        uint64_t v22 = objc_opt_class();
        v23 = objc_msgSend(v21, "setWithObjects:", v22, NSClassFromString(&cfstr_Bcscalltoactio.isa), 0);
        id v84 = 0;
        v69 = (void *)v19;
        v68 = [v20 unarchivedObjectOfClasses:v23 fromData:v19 error:&v84];
        id v24 = v84;

        if (v24)
        {
          v25 = ABSLogCommon();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            uint64_t v58 = sqlite3_errmsg((sqlite3 *)[a1 openedDatabase]);
            *(_DWORD *)buf = 134218242;
            id v87 = v24;
            __int16 v88 = 2080;
            v89 = v58;
            _os_log_error_impl(&dword_2154F4000, v25, OS_LOG_TYPE_ERROR, "error while unarchiving BCSCallToActionItem %lu %s", buf, 0x16u);
          }
        }
        v67 = v24;
        id v26 = sqlite3_column_blob(ppStmt, 11);
        uint64_t v27 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v26, sqlite3_column_bytes(ppStmt, 11));
        v28 = (void *)MEMORY[0x263F08928];
        id v29 = (void *)MEMORY[0x263EFFA08];
        Class v30 = NSClassFromString(&cfstr_Bcsopenhours.isa);
        uint64_t v31 = objc_opt_class();
        id v32 = objc_msgSend(v29, "setWithObjects:", v30, v31, objc_opt_class(), 0);
        id v83 = 0;
        v66 = (void *)v27;
        v33 = [v28 unarchivedObjectOfClasses:v32 fromData:v27 error:&v83];
        id v34 = v83;

        if (v34)
        {
          v35 = ABSLogCommon();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            __int16 v59 = sqlite3_errmsg((sqlite3 *)[a1 openedDatabase]);
            *(_DWORD *)buf = 134218242;
            id v87 = v34;
            __int16 v88 = 2080;
            v89 = v59;
            _os_log_error_impl(&dword_2154F4000, v35, OS_LOG_TYPE_ERROR, "error while unarchiving BCSOpenHours %lu %s", buf, 0x16u);
          }
        }
        v65 = v34;
        id v36 = sqlite3_column_blob(ppStmt, 12);
        v37 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v36, sqlite3_column_bytes(ppStmt, 12));
        id v38 = (void *)MEMORY[0x263F08928];
        v39 = (void *)MEMORY[0x263EFFA08];
        Class v40 = NSClassFromString(&cfstr_Bcsopenhours.isa);
        uint64_t v41 = objc_opt_class();
        v42 = objc_msgSend(v39, "setWithObjects:", v40, v41, objc_opt_class(), 0);
        id v82 = 0;
        v43 = [v38 unarchivedObjectOfClasses:v42 fromData:v37 error:&v82];
        id v44 = v82;

        if (v44)
        {
          double v45 = ABSLogCommon();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v60 = sqlite3_errmsg((sqlite3 *)[a1 openedDatabase]);
            *(_DWORD *)buf = 134218242;
            id v87 = v44;
            __int16 v88 = 2080;
            v89 = v60;
            _os_log_error_impl(&dword_2154F4000, v45, OS_LOG_TYPE_ERROR, "error while unarchiving BCSOpenHours %lu %s", buf, 0x16u);
          }
        }
        v46 = sqlite3_column_blob(ppStmt, 17);
        id v47 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v46, sqlite3_column_bytes(ppStmt, 17));
        v48 = (void *)MEMORY[0x263F08928];
        id v49 = (void *)MEMORY[0x263EFFA08];
        Class v50 = NSClassFromString(&cfstr_Bcsvisibilityi.isa);
        uint64_t v51 = objc_opt_class();
        int v52 = objc_msgSend(v49, "setWithObjects:", v50, v51, objc_opt_class(), 0);
        id v81 = 0;
        v53 = [v48 unarchivedObjectOfClasses:v52 fromData:v47 error:&v81];
        id v54 = v81;

        if (v54)
        {
          v55 = ABSLogCommon();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            uint64_t v61 = sqlite3_errmsg((sqlite3 *)[a1 openedDatabase]);
            *(_DWORD *)buf = 134218242;
            id v87 = v54;
            __int16 v88 = 2080;
            v89 = v61;
            _os_log_error_impl(&dword_2154F4000, v55, OS_LOG_TYPE_ERROR, "error while unarchiving BCSVisibilityItem %lu %s", buf, 0x16u);
          }
        }
        sqlite3_finalize(ppStmt);
        LOBYTE(v62) = v71 == 1;
        v56 = [[BCSBusinessItem alloc] initWithBizID:v80 phoneNumber:v79 name:v78 phoneHash:v74 squareLogoURL:v77 wideLogoURL:v76 tintColor:v64 backgroundColor:v63 callToActions:v68 messagingOpenHours:v33 callingOpenHours:v43 isVerified:v62 intentID:v75 groupID:v70 visibilityItems:v53];
        id v4 = [[BCSPersistentBusinessItemObject alloc] initWithBusinessItem:v56 lastRetrievedDate:v73 TTLDate:v72];
      }
      else
      {
        id v4 = 0;
      }
    }
    [a1 endBatch];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)fetchPersistentBusinessItemObjectWithPhoneNumber:(id)a3
{
  [NSString stringWithFormat:@"select * from business_items where phone_number=\"%@\"", a3];
  id v4 = objc_claimAutoreleasedReturnValue();
  id v5 = (const char *)[v4 UTF8String];

  return -[BCSBusinessItemPersistentStore _executeFetchPersistentBusinessItemObjectSQLQuery:](self, v5);
}

- (BOOL)deleteBusinessItem:(id)a3
{
  id v4 = a3;
  [(BCSPersistentStore *)self beginBatch];
  id v5 = [v4 bizID];
  BOOL v6 = [(BCSBusinessItemPersistentStore *)self deleteBusinessItemWithBizID:v5];

  id v7 = [v4 phoneNumber];

  LOBYTE(v4) = [(BCSBusinessItemPersistentStore *)self deleteBusinessItemWithPhoneNumber:v7];
  [(BCSPersistentStore *)self endBatch];
  return v6 | v4;
}

- (BOOL)deleteBusinessItemWithBizID:(id)a3
{
  [NSString stringWithFormat:@"delete from business_items where biz_id=\"%@\"", a3];
  id v4 = objc_claimAutoreleasedReturnValue();
  id v5 = (const char *)[v4 UTF8String];

  return -[BCSBusinessItemPersistentStore _executeDeleteBusinessItemSQLQuery:](self, v5);
}

- (BOOL)_executeDeleteBusinessItemSQLQuery:(void *)a1
{
  if (!a1) {
    return 0;
  }
  [a1 beginBatch];
  ppStmt = 0;
  if (sqlite3_prepare_v2((sqlite3 *)[a1 openedDatabase], a2, -1, &ppStmt, 0)) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = sqlite3_step(ppStmt) == 101;
  }
  [a1 endBatch];
  return v4;
}

- (BOOL)deleteBusinessItemWithPhoneNumber:(id)a3
{
  [NSString stringWithFormat:@"delete from business_items where phone_number=\"%@\"", a3];
  id v4 = objc_claimAutoreleasedReturnValue();
  id v5 = (const char *)[v4 UTF8String];

  return -[BCSBusinessItemPersistentStore _executeDeleteBusinessItemSQLQuery:](self, v5);
}

@end