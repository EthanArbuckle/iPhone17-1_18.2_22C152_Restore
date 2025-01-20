@interface EDRichLinkPersistence
+ (NSString)richLinksTableName;
+ (id)messageRichLinksTableName;
+ (id)messagesRichLinksTableSchema;
+ (id)richLinksTableSchema;
+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4;
- (BOOL)verifyFileExistsForRichLinkID:(id)a3 basePath:(id)a4;
- (EDPersistenceDatabase)database;
- (EDRichLinkPersistence)initWithDatabase:(id)a3;
- (id)_hashForRichLinkData:(id)a3;
- (id)_richLinkDirectoryURLWithBasePath:(id)a3;
- (id)_richLinkFileURLWithID:(id)a3 basePath:(id)a4;
- (id)datasForPersistentIDs:(id)a3 basePath:(id)a4;
- (id)richLinkDataForPersistentID:(id)a3 basePath:(id)a4;
- (id)richLinkFileURLWithID:(id)a3 basePath:(id)a4;
- (id)richLinkMetadataDataForPersistentID:(id)a3 basePath:(id)a4;
- (id)richLinkPersistentIDsForGlobalMessageID:(int64_t)a3;
- (id)richLinkURLsForMessageIDs:(id)a3;
- (id)saveRichLinkData:(id)a3 globalMessageID:(int64_t)a4 basePath:(id)a5;
- (id)saveRichLinkData:(id)a3 url:(id)a4 title:(id)a5 globalMessageID:(int64_t)a6 basePath:(id)a7;
- (void)setDatabase:(id)a3;
@end

@implementation EDRichLinkPersistence

void ___ef_log_EDRichLinkPersistence_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EDRichLinkPersistence");
  v1 = (void *)_ef_log_EDRichLinkPersistence_log;
  _ef_log_EDRichLinkPersistence_log = (uint64_t)v0;
}

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v5 = +[EDRichLinkPersistence richLinksTableSchema];
  v6 = +[EDRichLinkPersistence messagesRichLinksTableSchema];
  v7 = [v6 columnForName:@"rich_link"];
  [v7 setAsForeignKeyForTable:v5 onDelete:2 onUpdate:0];

  v8 = [EDPersistenceForeignKeyPlaceholder alloc];
  v9 = [v6 columnForName:@"global_message_id"];
  v10 = [(EDPersistenceForeignKeyPlaceholder *)v8 initWithColumn:v9 tableName:@"message_global_data" onDelete:2 onUpdate:0];
  v14[0] = v10;
  *a3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  v13[0] = v5;
  v13[1] = v6;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];

  return v11;
}

+ (id)richLinksTableSchema
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v3 = [MEMORY[0x1E4F60E80] textColumnWithName:@"title" collation:1 nullable:1];
  v11[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] textColumnWithName:@"url" collation:1 nullable:0];
  v11[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] textColumnWithName:@"hash" collation:1 nullable:0];
  v11[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  v7 = (void *)[v2 initWithName:@"rich_links" rowIDType:2 columns:v6];

  v10 = @"hash";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  [v7 addUniquenessConstraintForColumns:v8 conflictResolution:1];

  return v7;
}

+ (id)messagesRichLinksTableSchema
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"global_message_id" nullable:0];
  v10[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"rich_link" nullable:0];
  v10[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v9[0] = @"global_message_id";
  v9[1] = @"rich_link";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v7 = (void *)[v2 initWithName:@"message_rich_links" columns:v5 primaryKeyColumns:v6];

  return v7;
}

+ (NSString)richLinksTableName
{
  return (NSString *)@"rich_links";
}

+ (id)messageRichLinksTableName
{
  return @"message_rich_links";
}

- (EDRichLinkPersistence)initWithDatabase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDRichLinkPersistence;
  v6 = [(EDRichLinkPersistence *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_database, a3);
  }

  return v7;
}

- (id)saveRichLinkData:(id)a3 globalMessageID:(int64_t)a4 basePath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 data];
  v11 = [v8 url];
  v12 = [v8 title];
  v13 = [(EDRichLinkPersistence *)self saveRichLinkData:v10 url:v11 title:v12 globalMessageID:a4 basePath:v9];

  return v13;
}

- (id)saveRichLinkData:(id)a3 url:(id)a4 title:(id)a5 globalMessageID:(int64_t)a6 basePath:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__33;
  v39 = __Block_byref_object_dispose__33;
  id v40 = 0;
  id v25 = a7;
  v15 = [(EDRichLinkPersistence *)self _hashForRichLinkData:v12];
  database = self->_database;
  v17 = [NSString stringWithUTF8String:"-[EDRichLinkPersistence saveRichLinkData:url:title:globalMessageID:basePath:]"];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __77__EDRichLinkPersistence_saveRichLinkData_url_title_globalMessageID_basePath___block_invoke;
  v26[3] = &unk_1E6C05178;
  id v18 = v15;
  id v27 = v18;
  id v19 = v14;
  id v28 = v19;
  id v20 = v13;
  v33 = &v35;
  int64_t v34 = a6;
  id v29 = v20;
  v30 = self;
  id v21 = v25;
  id v31 = v21;
  id v22 = v12;
  id v32 = v22;
  [(EDPersistenceDatabase *)database __performWriteWithCaller:v17 usingBlock:v26];

  id v23 = (id)v36[5];
  _Block_object_dispose(&v35, 8);

  return v23;
}

BOOL __77__EDRichLinkPersistence_saveRichLinkData_url_title_globalMessageID_basePath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 1;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"rich_links"];
  [v4 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"hash"];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    [v4 setObject:v5 forKeyedSubscript:@"title"];
  }
  v6 = [*(id *)(a1 + 48) absoluteString];
  [v4 setObject:v6 forKeyedSubscript:@"url"];

  id v36 = 0;
  int v7 = [v3 executeInsertStatement:v4 error:&v36];
  id v8 = v36;
  id v9 = v8;
  *((unsigned char *)v38 + 24) = v7;
  if (v7)
  {
    v10 = -[EDPersistedRichLinkID initWithDatabaseID:]([EDPersistedRichLinkID alloc], "initWithDatabaseID:", [v3 lastInsertedDatabaseID]);
    uint64_t v11 = *(void *)(*(void *)(a1 + 80) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
    goto LABEL_10;
  }
  id v13 = [v8 domain];
  if ([v13 isEqualToString:*MEMORY[0x1E4F60D10]])
  {
    uint64_t v14 = [v9 code];

    if (v14 == 19)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F60EF8]);
      id v12 = (void *)[v15 initWithResultColumn:*MEMORY[0x1E4F60D08] table:@"rich_links"];
      v16 = [MEMORY[0x1E4F60E78] column:@"hash"];
      v17 = [v16 equalTo:*(void *)(a1 + 32)];
      [v12 setWhere:v17];

      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __77__EDRichLinkPersistence_saveRichLinkData_url_title_globalMessageID_basePath___block_invoke_2;
      v35[3] = &unk_1E6C04FF0;
      v35[4] = *(void *)(a1 + 80);
      v35[5] = &v37;
      [v3 executeSelectStatement:v12 withBlock:v35 error:0];
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v12 = [NSString stringWithFormat:@"Unable to insert rich link into rich_links table: %@", v9];
  [v3 handleError:v9 message:v12];
LABEL_10:

  if (!*((unsigned char *)v38 + 24))
  {
    BOOL v26 = 0;
    id v23 = v9;
    goto LABEL_26;
  }
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"message_rich_links"];
  id v19 = (uint64_t *)(a1 + 88);
  id v20 = [NSNumber numberWithLongLong:*(void *)(a1 + 88)];
  [v18 setObject:v20 forKeyedSubscript:@"global_message_id"];

  uint64_t v21 = a1 + 80;
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "databaseID"));
  [v18 setObject:v22 forKeyedSubscript:@"rich_link"];

  id v34 = v9;
  LOBYTE(v22) = [v3 executeInsertStatement:v18 error:&v34];
  id v23 = v34;

  *((unsigned char *)v38 + 24) = v22;
  if ((v22 & 1) == 0)
  {
    v24 = [v23 domain];
    if ([v24 isEqualToString:*MEMORY[0x1E4F60D10]])
    {
      uint64_t v25 = [v23 code];

      if (v25 == 19)
      {
        *((unsigned char *)v38 + 24) = 1;
        goto LABEL_18;
      }
    }
    else
    {
    }
    id v27 = [NSString stringWithFormat:@"Unable to insert rich link with rowID %@ into message_rich_links table", *(void *)(*(void *)(*(void *)v21 + 8) + 40)];
    [v3 handleError:v23 message:v27];
  }
LABEL_18:

  if (*((unsigned char *)v38 + 24))
  {
    id v28 = [*(id *)(a1 + 56) _richLinkFileURLWithID:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) basePath:*(void *)(a1 + 64)];
    id v29 = [MEMORY[0x1E4F28CB8] defaultManager];
    v30 = [v28 path];
    char v31 = [v29 fileExistsAtPath:v30];

    if ((v31 & 1) == 0 && ([*(id *)(a1 + 72) writeToURL:v28 atomically:1] & 1) == 0)
    {
      id v32 = _ef_log_EDRichLinkPersistence();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        __77__EDRichLinkPersistence_saveRichLinkData_url_title_globalMessageID_basePath___block_invoke_cold_1(v21, v19, v32);
      }
    }
    BOOL v26 = *((unsigned char *)v38 + 24) != 0;
  }
  else
  {
    BOOL v26 = 0;
  }
LABEL_26:

  _Block_object_dispose(&v37, 8);
  return v26;
}

void __77__EDRichLinkPersistence_saveRichLinkData_url_title_globalMessageID_basePath___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [EDPersistedRichLinkID alloc];
  v4 = [v8 objectAtIndexedSubscript:0];
  uint64_t v5 = -[EDPersistedRichLinkID initWithDatabaseID:](v3, "initWithDatabaseID:", [v4 databaseIDValue]);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

- (id)richLinkDataForPersistentID:(id)a3 basePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__33;
  uint64_t v22 = __Block_byref_object_dispose__33;
  id v23 = 0;
  id v8 = [(EDRichLinkPersistence *)self _richLinkFileURLWithID:v6 basePath:v7];
  id v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v8];
  if (v9)
  {
    database = self->_database;
    uint64_t v11 = [NSString stringWithUTF8String:"-[EDRichLinkPersistence richLinkDataForPersistentID:basePath:]"];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __62__EDRichLinkPersistence_richLinkDataForPersistentID_basePath___block_invoke;
    v14[3] = &unk_1E6BFF540;
    id v15 = v6;
    v17 = &v18;
    id v16 = v9;
    [(EDPersistenceDatabase *)database __performReadWithCaller:v11 usingBlock:v14];
  }
  id v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);

  return v12;
}

uint64_t __62__EDRichLinkPersistence_richLinkDataForPersistentID_basePath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v5 = [MEMORY[0x1E4F60E78] allColumns];
  id v6 = (void *)[v4 initWithResult:v5 table:@"rich_links"];

  id v7 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  id v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "databaseID"));
  id v9 = [v7 equalTo:v8];
  [v6 setWhere:v9];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__EDRichLinkPersistence_richLinkDataForPersistentID_basePath___block_invoke_2;
  v11[3] = &unk_1E6C051A0;
  uint64_t v14 = *(void *)(a1 + 48);
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  [v3 executeSelectStatement:v6 withBlock:v11 error:0];

  return 1;
}

void __62__EDRichLinkPersistence_richLinkDataForPersistentID_basePath___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  id v15 = v3;
  uint64_t v5 = [v3 objectForKeyedSubscript:@"url"];
  id v6 = [v5 stringValue];
  id v7 = [v4 URLWithString:v6];

  id v8 = [EDRichLinkData alloc];
  uint64_t v9 = a1[4];
  v10 = [v15 objectForKeyedSubscript:@"title"];
  uint64_t v11 = [v10 stringValue];
  uint64_t v12 = [(EDRichLinkData *)v8 initWithPersistentID:v9 title:v11 url:v7 data:a1[5]];
  uint64_t v13 = *(void *)(a1[6] + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

- (id)datasForPersistentIDs:(id)a3 basePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  database = self->_database;
  v10 = [NSString stringWithUTF8String:"-[EDRichLinkPersistence datasForPersistentIDs:basePath:]"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __56__EDRichLinkPersistence_datasForPersistentIDs_basePath___block_invoke;
  v14[3] = &unk_1E6BFF4F0;
  id v11 = v6;
  id v15 = v11;
  id v16 = self;
  id v12 = v7;
  id v17 = v12;
  [(EDPersistenceDatabase *)database __performReadWithCaller:v10 usingBlock:v14];

  return v8;
}

uint64_t __56__EDRichLinkPersistence_datasForPersistentIDs_basePath___block_invoke(void *a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__EDRichLinkPersistence_datasForPersistentIDs_basePath___block_invoke_2;
  v5[3] = &unk_1E6C051C8;
  v1 = (void *)a1[4];
  id v2 = (void *)a1[6];
  v5[4] = a1[5];
  id v6 = v2;
  id v3 = (id)objc_msgSend(v1, "ef_compactMap:", v5);

  return 1;
}

id __56__EDRichLinkPersistence_datasForPersistentIDs_basePath___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) richLinkDataForPersistentID:a2 basePath:*(void *)(a1 + 40)];

  return v2;
}

- (id)richLinkPersistentIDsForGlobalMessageID:(int64_t)a3
{
  uint64_t v5 = objc_opt_new();
  database = self->_database;
  id v7 = [NSString stringWithUTF8String:"-[EDRichLinkPersistence richLinkPersistentIDsForGlobalMessageID:]"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__EDRichLinkPersistence_richLinkPersistentIDsForGlobalMessageID___block_invoke;
  void v10[3] = &unk_1E6BFF4A0;
  int64_t v12 = a3;
  id v8 = v5;
  id v11 = v8;
  [(EDPersistenceDatabase *)database __performReadWithCaller:v7 usingBlock:v10];

  return v8;
}

uint64_t __65__EDRichLinkPersistence_richLinkPersistentIDsForGlobalMessageID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"rich_link" table:@"message_rich_links"];
  uint64_t v5 = [MEMORY[0x1E4F60E78] column:@"global_message_id"];
  id v6 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  id v7 = [v5 equalTo:v6];
  [v4 setWhere:v7];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __65__EDRichLinkPersistence_richLinkPersistentIDsForGlobalMessageID___block_invoke_2;
  v9[3] = &unk_1E6BFF3B0;
  id v10 = *(id *)(a1 + 32);
  [v3 executeSelectStatement:v4 withBlock:v9 error:0];

  return 1;
}

void __65__EDRichLinkPersistence_richLinkPersistentIDsForGlobalMessageID___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = [EDPersistedRichLinkID alloc];
  uint64_t v5 = [v7 objectForKeyedSubscript:@"rich_link"];
  id v6 = -[EDPersistedRichLinkID initWithDatabaseID:](v4, "initWithDatabaseID:", [v5 databaseIDValue]);
  [v3 addObject:v6];
}

- (id)_hashForRichLinkData:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
  id v5 = v3;
  id v6 = (const void *)[v5 bytes];
  CC_LONG v7 = [v5 length];
  id v8 = v4;
  CC_SHA256(v6, v7, (unsigned __int8 *)[v8 mutableBytes]);
  uint64_t v9 = objc_msgSend(v8, "ef_hexString");

  return v9;
}

- (id)_richLinkDirectoryURLWithBasePath:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 URLByAppendingPathComponent:@"RichLinkData" isDirectory:1];
    if (v5)
    {
      id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v15 = 0;
      char v7 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v15];
      id v8 = v15;

      if ((v7 & 1) == 0)
      {
        uint64_t v9 = [v8 domain];
        id v10 = v9;
        if (v9 == (void *)*MEMORY[0x1E4F281F8])
        {
          BOOL v12 = [v8 code] == 516;

          if (v12) {
            goto LABEL_17;
          }
        }
        else
        {
        }
        _ef_log_EDRichLinkPersistence();
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = [v8 ef_publicDescription];
          [(EDRichLinkPersistence *)v13 _richLinkDirectoryURLWithBasePath:v11];
        }

        goto LABEL_16;
      }
    }
    else
    {
      id v8 = 0;
    }
    id v11 = _ef_log_EDRichLinkPersistence();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[EDRichLinkPersistence _richLinkDirectoryURLWithBasePath:](v11);
    }
LABEL_16:

    goto LABEL_17;
  }
  id v8 = _ef_log_EDRichLinkPersistence();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[EDRichLinkPersistence _richLinkDirectoryURLWithBasePath:](v8);
  }
  id v5 = 0;
LABEL_17:

  return v5;
}

- (id)_richLinkFileURLWithID:(id)a3 basePath:(id)a4
{
  id v6 = a3;
  char v7 = [(EDRichLinkPersistence *)self _richLinkDirectoryURLWithBasePath:a4];
  if (v7)
  {
    id v8 = [v6 stringValue];
    uint64_t v9 = [v7 URLByAppendingPathComponent:v8 isDirectory:0];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)richLinkFileURLWithID:(id)a3 basePath:(id)a4
{
  id v4 = [(EDRichLinkPersistence *)self _richLinkFileURLWithID:a3 basePath:a4];

  return v4;
}

- (id)richLinkMetadataDataForPersistentID:(id)a3 basePath:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDRichLinkPersistence *)self _richLinkFileURLWithID:v6 basePath:v7];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v8];
    id v10 = _ef_log_EDRichLinkPersistence();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Fetched data: %@ for rich link with richLinkID:%@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    id v10 = _ef_log_EDRichLinkPersistence();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Unable to find url for rich link with ID %@", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)verifyFileExistsForRichLinkID:(id)a3 basePath:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDRichLinkPersistence *)self richLinkFileURLWithID:v6 basePath:v7];
  if (v8
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [v8 path],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v9 isReadableFileAtPath:v10],
        v10,
        v9,
        (v11 & 1) != 0))
  {
    BOOL v12 = 1;
  }
  else
  {
    id v13 = _ef_log_EDRichLinkPersistence();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Unable to read rich link at URL %@", (uint8_t *)&v15, 0xCu);
    }

    BOOL v12 = 0;
  }

  return v12;
}

- (id)richLinkURLsForMessageIDs:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(EDRichLinkPersistence *)self database];
  id v7 = [NSString stringWithUTF8String:"-[EDRichLinkPersistence richLinkURLsForMessageIDs:]"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __51__EDRichLinkPersistence_richLinkURLsForMessageIDs___block_invoke;
  v13[3] = &unk_1E6BFF3D8;
  id v8 = v4;
  id v14 = v8;
  id v9 = v5;
  id v15 = v9;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v13);

  id v10 = v15;
  id v11 = v9;

  return v11;
}

uint64_t __51__EDRichLinkPersistence_richLinkURLsForMessageIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v5 = [MEMORY[0x1E4F60E78] allColumns];
  id v6 = (void *)[v4 initWithResult:v5 table:@"message_rich_links"];

  id v7 = (id)[v6 leftOuterJoin:@"rich_links" sourceColumn:@"rich_link" targetColumn:*MEMORY[0x1E4F60D08]];
  id v8 = [MEMORY[0x1E4F60E78] column:@"global_message_id"];
  id v9 = (uint64_t *)(a1 + 32);
  id v10 = [v8 in:*(void *)(a1 + 32)];
  [v6 setWhere:v10];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__EDRichLinkPersistence_richLinkURLsForMessageIDs___block_invoke_2;
  v16[3] = &unk_1E6BFF3B0;
  id v17 = *(id *)(a1 + 40);
  id v15 = 0;
  [v3 executeSelectStatement:v6 withBlock:v16 error:&v15];
  id v11 = v15;
  BOOL v12 = _ef_log_EDRichLinkPersistence();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v11)
  {
    if (v13) {
      __51__EDRichLinkPersistence_richLinkURLsForMessageIDs___block_invoke_cold_2(v9, v12);
    }
  }
  else if (v13)
  {
    __51__EDRichLinkPersistence_richLinkURLsForMessageIDs___block_invoke_cold_1(v9, v12);
  }

  return 1;
}

void __51__EDRichLinkPersistence_richLinkURLsForMessageIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = [a2 objectForKeyedSubscript:@"url"];
  id v4 = [v6 stringValue];
  id v5 = [v3 URLWithString:v4];
  [v2 addObject:v5];
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (void).cxx_destruct
{
}

void __77__EDRichLinkPersistence_saveRichLinkData_url_title_globalMessageID_basePath___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Unable to persist rich link with richLinkID: %@ and messageID: %lld to database", (uint8_t *)&v5, 0x16u);
}

- (void)_richLinkDirectoryURLWithBasePath:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Could not find rich link directory, base path is null.", v1, 2u);
}

- (void)_richLinkDirectoryURLWithBasePath:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Could not create rich links directory, path is null", v1, 2u);
}

- (void)_richLinkDirectoryURLWithBasePath:(os_log_t)log .cold.3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to create Rich Link data directory:\n%{public}@", buf, 0xCu);
}

void __51__EDRichLinkPersistence_richLinkURLsForMessageIDs___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Found rich link metadata for messages %{public}@", (uint8_t *)&v3, 0xCu);
}

void __51__EDRichLinkPersistence_richLinkURLsForMessageIDs___block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch rich link metadata for messages %{public}@", (uint8_t *)&v3, 0xCu);
}

@end