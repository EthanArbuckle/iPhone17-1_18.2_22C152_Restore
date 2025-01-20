@interface ASUSQLiteEntity
+ (Class)memoryEntityClass;
+ (id)_aggregateValueForProperty:(void *)a3 function:(void *)a4 predicate:(void *)a5 onConnection:;
+ (id)allOnConnection:(id)a3 predicate:(id)a4;
+ (id)anyOnConnection:(id)a3 predicate:(id)a4;
+ (id)countForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5;
+ (id)databaseTable;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)foreignDatabaseColumnForProperty:(id)a3;
+ (id)foreignDatabaseTableForProperty:(id)a3;
+ (id)foreignDatabaseTablesToDelete;
+ (id)foreignKeyColumnForTable:(id)a3;
+ (id)joinClauseForProperty:(id)a3;
+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5;
+ (id)memoryEntityForPersistentID:(int64_t)a3 usingConnection:(id)a4;
+ (id)memoryEntityForPersistentID:(int64_t)a3 withProperties:(id)a4 usingConnection:(id)a5;
+ (id)minValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4 entityClass:(Class)a5;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 entityClass:(Class)a6;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6 entityClass:(Class)a7;
+ (id)sumForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5;
+ (uint64_t)_insertValues:(void *)a3 intoTable:(uint64_t)a4 withPersistentID:(void *)a5 onConnection:;
- (ASUSQLiteConnection)connection;
- (ASUSQLiteEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (ASUSQLiteEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
- (BOOL)BOOLValueForProperty:(id)a3;
- (BOOL)deleteFromDatabase;
- (BOOL)existsInDatabase;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (BOOL)setValuesWithDictionary:(id)a3;
- (id)_copyTableClusteredValuesWithValues:(void *)a1;
- (id)dictValueForProperty:(id)a3;
- (id)errorValueForProperty:(id)a3;
- (id)getValuesForProperties:(id)a3;
- (id)numberValueForProperty:(id)a3;
- (id)stringValueForProperty:(id)a3;
- (id)urlValueForProperty:(id)a3;
- (id)uuidValueForProperty:(id)a3;
- (id)valueForProperty:(id)a3;
- (int64_t)integerValueForProperty:(id)a3;
- (int64_t)persistentID;
- (uint64_t)_deleteRowFromTable:(void *)a3 usingColumn:;
@end

@implementation ASUSQLiteEntity

+ (id)memoryEntityForPersistentID:(int64_t)a3 usingConnection:(id)a4
{
  return (id)[a1 memoryEntityForPersistentID:a3 withProperties:0 usingConnection:a4];
}

+ (id)memoryEntityForPersistentID:(int64_t)a3 withProperties:(id)a4 usingConnection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (objc_class *)[a1 memoryEntityClass];
  v11 = v10;
  if (!v8)
  {
    id v8 = [(objc_class *)v10 defaultProperties];
  }
  v12 = (void *)[objc_alloc((Class)a1) initWithPersistentID:a3 onConnection:v9];

  v13 = (void *)[[v11 alloc] initWithDatabaseEntity:v12 properties:v8];

  return v13;
}

- (ASUSQLiteEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ASUSQLiteEntity;
  id v8 = [(ASUSQLiteEntity *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a4);
    v9->_persistentID = a3;
  }

  return v9;
}

- (ASUSQLiteEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 objectForKey:@"ROWID"];
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 longLongValue];
  }
  else
  {
    CFUUIDRef v11 = CFUUIDCreate(0);
    uint64_t v10 = *(_OWORD *)&CFUUIDGetUUIDBytes(v11);
    CFRelease(v11);
  }
  id v12 = -[ASUSQLiteEntity _copyTableClusteredValuesWithValues:](self, v7);

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __55__ASUSQLiteEntity_initWithPropertyValues_onConnection___block_invoke;
  v17[3] = &unk_26522F700;
  id v19 = v6;
  uint64_t v20 = v10;
  id v18 = v12;
  id v13 = v6;
  id v14 = v12;
  if (([v13 performTransaction:v17 error:0] & 1) == 0)
  {

    self = 0;
  }
  v15 = [(ASUSQLiteEntity *)self initWithPersistentID:v10 onConnection:v13];

  return v15;
}

- (id)_copyTableClusteredValuesWithValues:(void *)a1
{
  id v2 = a1;
  if (a1)
  {
    v3 = (objc_class *)MEMORY[0x263EFF9A0];
    id v4 = a2;
    id v5 = objc_alloc_init(v3);
    id v6 = objc_opt_class();
    id v7 = [v6 databaseTable];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __55__ASUSQLiteEntity__copyTableClusteredValuesWithValues___block_invoke;
    v12[3] = &unk_26522F900;
    v15 = v6;
    id v13 = v7;
    id v8 = v5;
    id v14 = v8;
    id v9 = v7;
    [v4 enumerateKeysAndObjectsUsingBlock:v12];

    uint64_t v10 = v14;
    id v2 = v8;
  }
  return v2;
}

uint64_t __55__ASUSQLiteEntity_initWithPropertyValues_onConnection___block_invoke(void *a1)
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__ASUSQLiteEntity_initWithPropertyValues_onConnection___block_invoke_2;
  v5[3] = &unk_26522F6D8;
  id v2 = (void *)a1[4];
  v1 = (void *)a1[5];
  uint64_t v8 = a1[6];
  id v6 = v1;
  id v7 = &v9;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
  uint64_t v3 = *((unsigned __int8 *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v3;
}

uint64_t __55__ASUSQLiteEntity_initWithPropertyValues_onConnection___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t result = +[ASUSQLiteEntity _insertValues:intoTable:withPersistentID:onConnection:]((uint64_t)ASUSQLiteEntity, a3, a2, *(void *)(a1 + 48), *(void **)(a1 + 32));
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

+ (uint64_t)_insertValues:(void *)a3 intoTable:(uint64_t)a4 withPersistentID:(void *)a5 onConnection:
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = self;
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"INSERT OR REPLACE INTO "];
  [v11 appendString:v8];
  objc_msgSend(v11, "appendString:", @" (");
  uint64_t v12 = [v10 foreignKeyColumnForTable:v8];
  id v13 = (void *)v12;
  if (v12) {
    id v14 = (__CFString *)v12;
  }
  else {
    id v14 = @"ROWID";
  }
  [v11 appendString:v14];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  id v15 = v7;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v42 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        [v11 appendString:@", "];
        [v11 appendString:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v17);
  }

  [v11 appendString:@") VALUES (?"];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v21 = v15;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v38;
    while (1)
    {
      if (*(void *)v38 != v24) {
        objc_enumerationMutation(v21);
      }
      [v11 appendString:@", ?"];
      if (!--v23)
      {
        uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v49 count:16];
        if (!v23) {
          break;
        }
      }
    }
  }

  [v11 appendString:@";"]);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __73__ASUSQLiteEntity__insertValues_intoTable_withPersistentID_onConnection___block_invoke;
  v33[3] = &unk_26522F8D8;
  uint64_t v35 = a4;
  id v36 = 0;
  id v25 = v21;
  id v34 = v25;
  uint64_t v26 = [v9 executeStatement:v11 error:&v36 bindings:v33];
  id v27 = v36;
  if (v27)
  {
    v28 = ASULogHandleForCategory(1);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v30 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v46 = v30;
      __int16 v47 = 2112;
      id v48 = v27;
      id v31 = v30;
      _os_log_error_impl(&dword_247E53000, v28, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %@", buf, 0x16u);
    }
  }

  return v26;
}

+ (id)databaseTable
{
  return 0;
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4 = a3;
  id v5 = [a1 joinClauseForProperty:v4];

  if (v5)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = NSString;
    id v8 = [a1 databaseTable];
    id v6 = [v7 stringWithFormat:@"%@.%@", v8, v4];
  }

  return v6;
}

+ (id)foreignDatabaseColumnForProperty:(id)a3
{
  return 0;
}

+ (id)foreignDatabaseTableForProperty:(id)a3
{
  return 0;
}

+ (id)foreignDatabaseTablesToDelete
{
  return 0;
}

+ (id)foreignKeyColumnForTable:(id)a3
{
  return 0;
}

+ (id)joinClauseForProperty:(id)a3
{
  return 0;
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class();
}

- (BOOL)deleteFromDatabase
{
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__ASUSQLiteEntity_deleteFromDatabase__block_invoke;
  v9[3] = &unk_26522F728;
  v9[4] = self;
  BOOL v4 = [(ASUSQLiteConnection *)connection performTransaction:v9 error:0];
  if (v4)
  {
    int64_t v5 = [(ASUSQLiteEntity *)self persistentID];
    id v6 = dispatch_get_global_queue(21, 0);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __37__ASUSQLiteEntity_deleteFromDatabase__block_invoke_2;
    v8[3] = &__block_descriptor_40_e5_v8__0l;
    v8[4] = v5;
    dispatch_async(v6, v8);
  }
  return v4;
}

uint64_t __37__ASUSQLiteEntity_deleteFromDatabase__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [(id)objc_opt_class() databaseTable];
  char v4 = -[ASUSQLiteEntity _deleteRowFromTable:usingColumn:](v2, v3, @"ROWID");

  [(id)objc_opt_class() foreignDatabaseTablesToDelete];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend((id)objc_opt_class(), "foreignKeyColumnForTable:", v10, (void)v16);
        if (v11)
        {
          if ((-[ASUSQLiteEntity _deleteRowFromTable:usingColumn:](*(void *)(a1 + 32), v10, v11) & 1) == 0)
          {

            uint64_t v14 = 0;
            id v13 = v5;
            goto LABEL_14;
          }
          char v4 = 1;
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 8);
    *(void *)(v12 + 8) = 0;
    uint64_t v14 = 1;
LABEL_14:
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (uint64_t)_deleteRowFromTable:(void *)a3 usingColumn:
{
  uint64_t v3 = a1;
  if (a1)
  {
    id v5 = (objc_class *)NSString;
    id v6 = a3;
    id v7 = a2;
    uint64_t v8 = (void *)[[v5 alloc] initWithFormat:@"DELETE FROM %@ WHERE %@ = ?;", v7, v6];

    uint64_t v9 = *(void **)(v3 + 8);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __51__ASUSQLiteEntity__deleteRowFromTable_usingColumn___block_invoke;
    v11[3] = &unk_26522F928;
    v11[4] = v3;
    uint64_t v3 = [v9 executeStatement:v8 error:0 bindings:v11];
  }
  return v3;
}

void __37__ASUSQLiteEntity_deleteFromDatabase__block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08A00] defaultCenter];
  id v5 = @"ASUSQLiteUserInfoKeyPersistentID";
  uint64_t v3 = [NSNumber numberWithLongLong:*(void *)(a1 + 32)];
  v6[0] = v3;
  char v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 postNotificationName:@"ASUSQLiteDidDeleteEntityNotification" object:0 userInfo:v4];
}

- (BOOL)existsInDatabase
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = [NSString alloc];
  char v4 = [(id)objc_opt_class() databaseTable];
  id v5 = (void *)[v3 initWithFormat:@"SELECT 1 FROM %@ WHERE %@ = ? LIMIT 1;", v4, @"ROWID"];

  connection = self->_connection;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__ASUSQLiteEntity_existsInDatabase__block_invoke;
  v8[3] = &unk_26522F770;
  v8[4] = self;
  void v8[5] = &v9;
  [(ASUSQLiteConnection *)connection executeQuery:v5 withResults:v8];
  LOBYTE(self) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

void __35__ASUSQLiteEntity_existsInDatabase__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  [v4 bindInt64:v3 atPosition:1];
  LOBYTE(v3) = [v4 hasRows];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (id)getValuesForProperties:(id)a3
{
  v38[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count] == 1
    && ([v4 objectAtIndexedSubscript:0],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:@"ROWID"],
        v5,
        v6))
  {
    long long v37 = @"ROWID";
    id v7 = [NSNumber numberWithLongLong:self->_persistentID];
    v38[0] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
  }
  else
  {
    uint64_t v9 = objc_opt_class();
    id v7 = [v9 databaseTable];
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"SELECT "];
    id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __42__ASUSQLiteEntity_getValuesForProperties___block_invoke;
    v32[3] = &unk_26522F798;
    uint64_t v35 = v9;
    id v12 = v10;
    id v33 = v12;
    id v13 = v11;
    id v34 = v13;
    [v4 enumerateObjectsUsingBlock:v32];
    [v12 appendString:@" FROM "];
    [v12 appendString:v7];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          [v12 appendString:@" "];
          [v12 appendString:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v16);
    }

    [v12 appendString:@" WHERE "];
    [v12 appendString:v7];
    [v12 appendString:@".ROWID = ?;"];
    uint64_t v20 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    connection = self->_connection;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __42__ASUSQLiteEntity_getValuesForProperties___block_invoke_2;
    v25[3] = &unk_26522F810;
    v25[4] = self;
    id v26 = v4;
    id v22 = v20;
    id v27 = v22;
    [(ASUSQLiteConnection *)connection executeQuery:v12 withResults:v25];
    uint64_t v23 = v27;
    id v8 = v22;
  }

  return v8;
}

void __42__ASUSQLiteEntity_getValuesForProperties___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5 = a1[6];
  id v6 = a2;
  id v8 = [v5 disambiguatedSQLForProperty:v6];
  if (a3) {
    [a1[4] appendString:@", "];
  }
  [a1[4] appendString:v8];
  id v7 = [a1[6] joinClauseForProperty:v6];

  if (v7) {
    [a1[5] addObject:v7];
  }
}

void __42__ASUSQLiteEntity_getValuesForProperties___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  [v4 bindInt64:v3 atPosition:1];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__ASUSQLiteEntity_getValuesForProperties___block_invoke_3;
  v5[3] = &unk_26522F7E8;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  [v4 enumerateRowsUsingBlock:v5];
}

void __42__ASUSQLiteEntity_getValuesForProperties___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x24C56D840]();
  if (v5)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __42__ASUSQLiteEntity_getValuesForProperties___block_invoke_4;
    v9[3] = &unk_26522F7C0;
    id v8 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    id v11 = v5;
    [v8 enumerateObjectsUsingBlock:v9];
  }
}

void __42__ASUSQLiteEntity_getValuesForProperties___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  ASUSQLiteCopyFoundationValue(v5, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(NSDictionary);
  uint64_t v9 = v8;
  if (v6)
  {
    id v10 = objc_msgSend(v8, "initWithObjectsAndKeys:", v6, v7, 0);
  }
  else
  {
    id v11 = [MEMORY[0x263EFF9D0] null];
    id v10 = objc_msgSend(v9, "initWithObjectsAndKeys:", v11, v7, 0);
  }
  BOOL v12 = [(ASUSQLiteEntity *)self setValuesWithDictionary:v10];

  return v12;
}

- (BOOL)setValuesWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [v5 databaseTable];
  connection = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__ASUSQLiteEntity_setValuesWithDictionary___block_invoke;
  v11[3] = &unk_26522F8B0;
  v11[4] = self;
  id v12 = v4;
  id v13 = v6;
  id v14 = v5;
  id v8 = v6;
  id v9 = v4;
  LOBYTE(v5) = [(ASUSQLiteConnection *)connection performTransaction:v11 error:0];

  return (char)v5;
}

uint64_t __43__ASUSQLiteEntity_setValuesWithDictionary___block_invoke(uint64_t a1)
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  id v2 = -[ASUSQLiteEntity _copyTableClusteredValuesWithValues:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__ASUSQLiteEntity_setValuesWithDictionary___block_invoke_2;
  v8[3] = &unk_26522F888;
  uint64_t v3 = *(void **)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = &v13;
  [v2 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v6;
}

void __43__ASUSQLiteEntity_setValuesWithDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [*(id *)(a1 + 56) foreignKeyColumnForTable:v7];
  if (v9) {
    uint64_t v10 = (__CFString *)v9;
  }
  else {
    uint64_t v10 = @"ROWID";
  }
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 1;
  if (([v7 isEqualToString:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"SELECT 1 FROM "];
    [v11 appendString:v7];
    [v11 appendString:@" WHERE "];
    [v11 appendString:v10];
    [v11 appendString:@" =  ? LIMIT 1;"];
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void **)(v12 + 8);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __43__ASUSQLiteEntity_setValuesWithDictionary___block_invoke_3;
    v30[3] = &unk_26522F770;
    v30[4] = v12;
    v30[5] = &v31;
    [v13 executeQuery:v11 withResults:v30];
  }
  if (*((unsigned char *)v32 + 24))
  {
    id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"UPDATE "];
    [v15 appendString:v7];
    [v15 appendString:@" SET "];
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    char v29 = 0;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __43__ASUSQLiteEntity_setValuesWithDictionary___block_invoke_4;
    v24[3] = &unk_26522F838;
    id v27 = v28;
    id v16 = v15;
    id v25 = v16;
    id v17 = v14;
    id v26 = v17;
    [v8 enumerateKeysAndObjectsUsingBlock:v24];
    [v16 appendString:@" WHERE "];
    [v16 appendString:v7];
    [v16 appendString:@"."];
    [v16 appendString:v10];
    [v16 appendString:@" = ?;"];
    long long v18 = *(void **)(*(void *)(a1 + 40) + 8);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __43__ASUSQLiteEntity_setValuesWithDictionary___block_invoke_5;
    v21[3] = &unk_26522F860;
    id v19 = v17;
    uint64_t v20 = *(void *)(a1 + 40);
    id v22 = v19;
    uint64_t v23 = v20;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v18 executeStatement:v16 error:0 bindings:v21];

    _Block_object_dispose(v28, 8);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = +[ASUSQLiteEntity _insertValues:intoTable:withPersistentID:onConnection:]((uint64_t)ASUSQLiteEntity, v8, v7, *(void *)(*(void *)(a1 + 40) + 16), *(void **)(*(void *)(a1 + 40) + 8));
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) ^ 1;
  _Block_object_dispose(&v31, 8);
}

void __43__ASUSQLiteEntity_setValuesWithDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  [v4 bindInt64:v3 atPosition:1];
  LOBYTE(v3) = [v4 hasRows];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

void __43__ASUSQLiteEntity_setValuesWithDictionary___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [*(id *)(a1 + 32) appendString:@", "];
  }
  [*(id *)(a1 + 32) appendString:v6];
  [*(id *)(a1 + 32) appendString:@" = ?"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  [*(id *)(a1 + 40) addObject:v5];
}

void __43__ASUSQLiteEntity_setValuesWithDictionary___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    uint64_t v8 = 1;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v8;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        ASUSQLiteBindFoundationValue(v3, v10 + v9, *(void **)(*((void *)&v12 + 1) + 8 * v9));
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v8 = (v10 + v9);
    }
    while (v6);
    uint64_t v11 = (v10 + v9);
  }
  else
  {
    uint64_t v11 = 1;
  }

  objc_msgSend(v3, "bindInt64:atPosition:", *(void *)(*(void *)(a1 + 40) + 16), v11, (void)v12);
}

- (id)valueForProperty:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v10 count:1];
  uint64_t v7 = -[ASUSQLiteEntity getValuesForProperties:](self, "getValuesForProperties:", v6, v10, v11);
  uint64_t v8 = [v7 objectForKeyedSubscript:v5];

  return v8;
}

void __73__ASUSQLiteEntity__insertValues_intoTable_withPersistentID_onConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [v3 bindInt64:*(void *)(a1 + 40) atPosition:1];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    uint64_t v8 = 2;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * v9), (void)v11);
        ASUSQLiteBindFoundationValue(v3, v8 + v9, v10);

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v8 = (v8 + v9);
    }
    while (v6);
  }
}

void __55__ASUSQLiteEntity__copyTableClusteredValuesWithValues___block_invoke(id *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (([v10 isEqualToString:@"ROWID"] & 1) == 0)
  {
    uint64_t v6 = [a1[6] foreignDatabaseTableForProperty:v10];
    if (v6)
    {
      id v7 = (id)v6;
      id v8 = [a1[6] foreignDatabaseColumnForProperty:v10];
    }
    else
    {
      id v8 = v10;
      id v7 = a1[4];
    }
    id v9 = [a1[5] objectForKey:v7];
    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [a1[5] setObject:v9 forKey:v7];
    }
    [v9 setObject:v5 forKey:v8];
  }
}

uint64_t __51__ASUSQLiteEntity__deleteRowFromTable_usingColumn___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindInt64:*(void *)(*(void *)(a1 + 32) + 16) atPosition:1];
}

- (ASUSQLiteConnection)connection
{
  return self->_connection;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (void).cxx_destruct
{
}

- (BOOL)BOOLValueForProperty:(id)a3
{
  id v3 = [(ASUSQLiteEntity *)self numberValueForProperty:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)dictValueForProperty:(id)a3
{
  id v3 = [(ASUSQLiteEntity *)self valueForProperty:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = v3;
  }
  else {
    char v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)errorValueForProperty:(id)a3
{
  id v3 = [(ASUSQLiteEntity *)self valueForProperty:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v4 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (int64_t)integerValueForProperty:(id)a3
{
  id v3 = [(ASUSQLiteEntity *)self numberValueForProperty:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)numberValueForProperty:(id)a3
{
  id v3 = [(ASUSQLiteEntity *)self valueForProperty:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = v3;
  }
  else {
    int64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)stringValueForProperty:(id)a3
{
  id v3 = [(ASUSQLiteEntity *)self valueForProperty:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = v3;
  }
  else {
    int64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)uuidValueForProperty:(id)a3
{
  id v3 = [(ASUSQLiteEntity *)self valueForProperty:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = v3;
  }
  else {
    int64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)urlValueForProperty:(id)a3
{
  id v3 = [(ASUSQLiteEntity *)self valueForProperty:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = v3;
  }
  else {
    int64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

+ (id)anyOnConnection:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__1;
  uint64_t v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  id v8 = [a1 queryOnConnection:v6 predicate:v7];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__ASUSQLiteEntity_ASUSQLiteQuery__anyOnConnection_predicate___block_invoke;
  v12[3] = &unk_26522FCA8;
  long long v14 = &v16;
  id v15 = a1;
  id v9 = v6;
  id v13 = v9;
  [v8 enumeratePersistentIDsUsingBlock:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

void __61__ASUSQLiteEntity_ASUSQLiteQuery__anyOnConnection_predicate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [objc_alloc(*(Class *)(a1 + 48)) initWithPersistentID:a2 onConnection:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  *a4 = 1;
}

+ (id)allOnConnection:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__1;
  uint64_t v20 = __Block_byref_object_dispose__1;
  id v21 = (id)objc_opt_new();
  id v8 = [a1 queryOnConnection:v6 predicate:v7];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__ASUSQLiteEntity_ASUSQLiteQuery__allOnConnection_predicate___block_invoke;
  v12[3] = &unk_26522FCA8;
  id v15 = a1;
  id v9 = v6;
  id v13 = v9;
  long long v14 = &v16;
  [v8 enumeratePersistentIDsUsingBlock:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

void __61__ASUSQLiteEntity_ASUSQLiteQuery__allOnConnection_predicate___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (id)[objc_alloc(*(Class *)(a1 + 48)) initWithPersistentID:a2 onConnection:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
}

+ (id)countForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  return +[ASUSQLiteEntity _aggregateValueForProperty:function:predicate:onConnection:]((uint64_t)a1, a3, @"COUNT", a4, a5);
}

+ (id)_aggregateValueForProperty:(void *)a3 function:(void *)a4 predicate:(void *)a5 onConnection:
{
  v33[1] = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v12 = self;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = __Block_byref_object_copy__1;
  uint64_t v31 = __Block_byref_object_dispose__1;
  id v32 = 0;
  id v13 = [ASUSQLiteQueryDescriptor alloc];
  if (v13) {
    long long v14 = [(ASUSQLiteQueryDescriptor *)v13 initWithEntityClass:v12 memoryEntityClass:0];
  }
  else {
    long long v14 = 0;
  }
  [(ASUSQLiteQueryDescriptor *)v14 setPredicate:v10];
  id v15 = [NSString alloc];
  uint64_t v16 = [v12 disambiguatedSQLForProperty:v8];
  uint64_t v17 = (void *)[v15 initWithFormat:@"%@(%@)", v9, v16];

  v33[0] = v8;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObject:v17];
  id v20 = [(ASUSQLiteQueryDescriptor *)v14 _newSelectSQLWithProperties:v18 columns:v19];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __94__ASUSQLiteEntity_ASUSQLiteQuery___aggregateValueForProperty_function_predicate_onConnection___block_invoke;
  v24[3] = &unk_26522F770;
  id v21 = v14;
  id v25 = v21;
  id v26 = &v27;
  [v11 executeQuery:v20 withResults:v24];
  id v22 = (id)v28[5];

  _Block_object_dispose(&v27, 8);

  return v22;
}

+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  return +[ASUSQLiteEntity _aggregateValueForProperty:function:predicate:onConnection:]((uint64_t)a1, a3, @"MAX", a4, a5);
}

+ (id)minValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  return +[ASUSQLiteEntity _aggregateValueForProperty:function:predicate:onConnection:]((uint64_t)a1, a3, @"MIN", a4, a5);
}

+ (id)sumForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  id v5 = +[ASUSQLiteEntity _aggregateValueForProperty:function:predicate:onConnection:]((uint64_t)a1, a3, @"SUM", a4, a5);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = &unk_26FC1BB78;
  }
  id v7 = v6;

  return v7;
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4
{
  return (id)[a1 queryOnConnection:a3 predicate:a4 orderingProperties:0];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5
{
  return (id)[a1 queryOnConnection:a3 predicate:a4 orderingProperties:a5 orderingDirections:0];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6
{
  return (id)[a1 queryOnConnection:a3 predicate:a4 orderingProperties:a5 orderingDirections:a6 entityClass:a1];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 entityClass:(Class)a5
{
  return (id)[a1 queryOnConnection:a3 predicate:a4 orderingProperties:0 orderingDirections:0 entityClass:a5];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 entityClass:(Class)a6
{
  return (id)[a1 queryOnConnection:a3 predicate:a4 orderingProperties:a5 orderingDirections:0 entityClass:a6];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6 entityClass:(Class)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [[ASUSQLiteQueryDescriptor alloc] initWithEntityClass:a7 memoryEntityClass:[(objc_class *)a7 memoryEntityClass]];
  [(ASUSQLiteQueryDescriptor *)v15 setOrderingProperties:v12];

  [(ASUSQLiteQueryDescriptor *)v15 setOrderingDirections:v11];
  [(ASUSQLiteQueryDescriptor *)v15 setPredicate:v13];

  id v16 = [[ASUSQLiteQuery alloc] initOnConnection:v14 descriptor:v15];

  return v16;
}

void __94__ASUSQLiteEntity_ASUSQLiteQuery___aggregateValueForProperty_function_predicate_onConnection___block_invoke(uint64_t a1, void *a2)
{
  int v7 = 1;
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 predicate];
  [v5 applyBinding:v4 atIndex:&v7];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __94__ASUSQLiteEntity_ASUSQLiteQuery___aggregateValueForProperty_function_predicate_onConnection___block_invoke_2;
  v6[3] = &unk_26522F648;
  v6[4] = *(void *)(a1 + 40);
  [v4 enumerateRowsUsingBlock:v6];
}

void __94__ASUSQLiteEntity_ASUSQLiteQuery___aggregateValueForProperty_function_predicate_onConnection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = ASUSQLiteCopyFoundationValue(a2, 0);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  *a4 = 1;
}

@end