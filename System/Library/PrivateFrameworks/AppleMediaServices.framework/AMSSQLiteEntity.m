@interface AMSSQLiteEntity
+ (BOOL)_insertValues:(id)a3 intoTable:(id)a4 withPersistentID:(int64_t)a5 onConnection:(id)a6;
+ (Class)memoryEntityClass;
+ (id)_aggregateValueForProperty:(id)a3 function:(id)a4 predicate:(id)a5 onConnection:(id)a6;
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
+ (id)minValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5;
- (AMSSQLiteConnection)connection;
- (AMSSQLiteEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (AMSSQLiteEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
- (BOOL)_deleteRowFromTable:(id)a3 usingColumn:(id)a4;
- (BOOL)deleteFromDatabase;
- (BOOL)existsInDatabase;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (BOOL)setValuesWithDictionary:(id)a3;
- (id)_copyTableClusteredValuesWithValues:(id)a3;
- (id)getValuesForProperties:(id)a3;
- (id)valueForProperty:(id)a3;
- (int64_t)persistentID;
@end

@implementation AMSSQLiteEntity

- (AMSSQLiteEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AMSSQLiteEntity;
  v8 = [(AMSSQLiteEntity *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a4);
    v9->_persistentID = a3;
  }

  return v9;
}

- (AMSSQLiteEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKey:@"ROWID"];
  v9 = v8;
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
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  id v12 = [(AMSSQLiteEntity *)self _copyTableClusteredValuesWithValues:v6];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55__AMSSQLiteEntity_initWithPropertyValues_onConnection___block_invoke;
  v18[3] = &unk_1E55A6680;
  v13 = self;
  v19 = v13;
  id v14 = v12;
  id v20 = v14;
  uint64_t v23 = v10;
  id v15 = v7;
  id v21 = v15;
  v22 = &v24;
  [v15 performTransaction:v18];
  if (!*((unsigned char *)v25 + 24))
  {

    v13 = 0;
  }
  v16 = [(AMSSQLiteEntity *)v13 initWithPersistentID:v10 onConnection:v15];

  _Block_object_dispose(&v24, 8);
  return v16;
}

uint64_t __55__AMSSQLiteEntity_initWithPropertyValues_onConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__AMSSQLiteEntity_initWithPropertyValues_onConnection___block_invoke_2;
  v9[3] = &unk_1E55A6658;
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v12 = v2;
  uint64_t v13 = v3;
  v4 = *(void **)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v10 = v5;
  uint64_t v11 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);

  return v7;
}

uint64_t __55__AMSSQLiteEntity_initWithPropertyValues_onConnection___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 48) _insertValues:a3 intoTable:a2 withPersistentID:*(void *)(a1 + 56) onConnection:*(void *)(a1 + 32)];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
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
    uint64_t v7 = NSString;
    v8 = [a1 databaseTable];
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
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  connection = self->_connection;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__AMSSQLiteEntity_deleteFromDatabase__block_invoke;
  v5[3] = &unk_1E55A66A8;
  v5[4] = self;
  v5[5] = &v6;
  [(AMSSQLiteConnection *)connection performTransaction:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

BOOL __37__AMSSQLiteEntity_deleteFromDatabase__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  char v3 = [(id)objc_opt_class() databaseTable];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 _deleteRowFromTable:v3 usingColumn:@"ROWID"];

  [(id)objc_opt_class() foreignDatabaseTablesToDelete];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v10 = objc_msgSend((id)objc_opt_class(), "foreignKeyColumnForTable:", v9, (void)v15);
        if (v10)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _deleteRowFromTable:v9 usingColumn:v10];
          if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
          {

            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(v11 + 8);
    *(void *)(v11 + 8) = 0;

    BOOL v13 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)existsInDatabase
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() databaseTable];
  uint64_t v5 = (void *)[v3 initWithFormat:@"SELECT 1 FROM %@ WHERE %@ = ? LIMIT 1;", v4, @"ROWID"];

  connection = self->_connection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__AMSSQLiteEntity_existsInDatabase__block_invoke;
  v8[3] = &unk_1E55A66D0;
  v8[4] = self;
  v8[5] = &v9;
  [(AMSSQLiteConnection *)connection executeQuery:v5 withResults:v8];
  LOBYTE(self) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

void __35__AMSSQLiteEntity_existsInDatabase__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  [v4 bindInt64:v3 atPosition:1];
  LOBYTE(v3) = [v4 hasRows];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (id)getValuesForProperties:(id)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count] == 1
    && ([v4 objectAtIndexedSubscript:0],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:@"ROWID"],
        v5,
        v6))
  {
    v37 = @"ROWID";
    uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithLongLong:self->_persistentID];
    v38[0] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
  }
  else
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v7 = [v9 databaseTable];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"SELECT "];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __42__AMSSQLiteEntity_getValuesForProperties___block_invoke;
    v32[3] = &unk_1E55A66F8;
    v35 = v9;
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
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    connection = self->_connection;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __42__AMSSQLiteEntity_getValuesForProperties___block_invoke_2;
    v25[3] = &unk_1E55A6748;
    v25[4] = self;
    id v26 = v4;
    id v22 = v20;
    id v27 = v22;
    [(AMSSQLiteConnection *)connection executeQuery:v12 withResults:v25];
    uint64_t v23 = v27;
    id v8 = v22;
  }
  return v8;
}

void __42__AMSSQLiteEntity_getValuesForProperties___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5 = a1[6];
  id v6 = a2;
  id v8 = [v5 disambiguatedSQLForProperty:v6];
  if (a3) {
    [a1[4] appendString:@", "];
  }
  [a1[4] appendString:v8];
  uint64_t v7 = [a1[6] joinClauseForProperty:v6];

  if (v7) {
    [a1[5] addObject:v7];
  }
}

void __42__AMSSQLiteEntity_getValuesForProperties___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  [v4 bindInt64:v3 atPosition:1];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AMSSQLiteEntity_getValuesForProperties___block_invoke_3;
  v5[3] = &unk_1E55A13B0;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  [v4 enumerateRowsUsingBlock:v5];
}

void __42__AMSSQLiteEntity_getValuesForProperties___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x192FA47D0]();
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__AMSSQLiteEntity_getValuesForProperties___block_invoke_4;
    v9[3] = &unk_1E55A6720;
    id v8 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    id v11 = v5;
    [v8 enumerateObjectsUsingBlock:v9];
  }
}

void __42__AMSSQLiteEntity_getValuesForProperties___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  AMSSQLiteCopyFoundationValue(v5, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v9 = v8;
  if (v6)
  {
    id v10 = objc_msgSend(v8, "initWithObjectsAndKeys:", v6, v7, 0);
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1CA98] null];
    id v10 = objc_msgSend(v9, "initWithObjectsAndKeys:", v11, v7, 0);
  }
  BOOL v12 = [(AMSSQLiteEntity *)self setValuesWithDictionary:v10];

  return v12;
}

- (BOOL)setValuesWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  id v5 = objc_opt_class();
  id v6 = [v5 databaseTable];
  connection = self->_connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__AMSSQLiteEntity_setValuesWithDictionary___block_invoke;
  v11[3] = &unk_1E55A67E8;
  v11[4] = self;
  id v8 = v4;
  id v12 = v8;
  uint64_t v15 = v5;
  id v9 = v6;
  id v13 = v9;
  id v14 = &v16;
  [(AMSSQLiteConnection *)connection performTransaction:v11];
  LOBYTE(v5) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v5;
}

uint64_t __43__AMSSQLiteEntity_setValuesWithDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _copyTableClusteredValuesWithValues:*(void *)(a1 + 40)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__AMSSQLiteEntity_setValuesWithDictionary___block_invoke_2;
  v7[3] = &unk_1E55A67C0;
  uint64_t v11 = *(void *)(a1 + 64);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v4;
  uint64_t v10 = *(void *)(a1 + 56);
  [v2 enumerateKeysAndObjectsUsingBlock:v7];
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);

  return v5;
}

void __43__AMSSQLiteEntity_setValuesWithDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
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
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"SELECT 1 FROM "];
    [v11 appendString:v7];
    [v11 appendString:@" WHERE "];
    [v11 appendString:v10];
    [v11 appendString:@" =  ? LIMIT 1;"];
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = *(void **)(v12 + 8);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __43__AMSSQLiteEntity_setValuesWithDictionary___block_invoke_3;
    v30[3] = &unk_1E55A66D0;
    v30[4] = v12;
    v30[5] = &v31;
    [v13 executeQuery:v11 withResults:v30];
  }
  if (*((unsigned char *)v32 + 24))
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"UPDATE "];
    [v15 appendString:v7];
    [v15 appendString:@" SET "];
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    char v29 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __43__AMSSQLiteEntity_setValuesWithDictionary___block_invoke_4;
    v24[3] = &unk_1E55A6770;
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
    uint64_t v18 = *(void **)(*(void *)(a1 + 40) + 8);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __43__AMSSQLiteEntity_setValuesWithDictionary___block_invoke_5;
    v21[3] = &unk_1E55A6798;
    id v19 = v17;
    uint64_t v20 = *(void *)(a1 + 40);
    id v22 = v19;
    uint64_t v23 = v20;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v18 executeStatement:v16 error:0 bindings:v21];

    _Block_object_dispose(v28, 8);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [(id)objc_opt_class() _insertValues:v8 intoTable:v7 withPersistentID:*(void *)(*(void *)(a1 + 40) + 16) onConnection:*(void *)(*(void *)(a1 + 40) + 8)];
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) ^ 1;
  _Block_object_dispose(&v31, 8);
}

void __43__AMSSQLiteEntity_setValuesWithDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  [v4 bindInt64:v3 atPosition:1];
  LOBYTE(v3) = [v4 hasRows];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

void __43__AMSSQLiteEntity_setValuesWithDictionary___block_invoke_4(uint64_t a1, void *a2, void *a3)
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

void __43__AMSSQLiteEntity_setValuesWithDictionary___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
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
        AMSSQLiteBindFoundationValue(v3, v10 + v9, *(void **)(*((void *)&v12 + 1) + 8 * v9));
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
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v10 count:1];
  uint64_t v7 = -[AMSSQLiteEntity getValuesForProperties:](self, "getValuesForProperties:", v6, v10, v11);
  uint64_t v8 = [v7 objectForKeyedSubscript:v5];

  return v8;
}

+ (BOOL)_insertValues:(id)a3 intoTable:(id)a4 withPersistentID:(int64_t)a5 onConnection:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  long long v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"INSERT OR REPLACE INTO "];
  [v12 appendString:v10];
  objc_msgSend(v12, "appendString:", @" (");
  uint64_t v13 = [a1 foreignKeyColumnForTable:v10];
  long long v14 = (void *)v13;
  if (v13) {
    long long v15 = (__CFString *)v13;
  }
  else {
    long long v15 = @"ROWID";
  }
  [v12 appendString:v15];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  id v16 = v9;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v41 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        [v12 appendString:@", "];
        [v12 appendString:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v18);
  }

  [v12 appendString:@") VALUES (?"];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v22 = v16;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v37;
    while (1)
    {
      if (*(void *)v37 != v25) {
        objc_enumerationMutation(v22);
      }
      [v12 appendString:@", ?"];
      if (!--v24)
      {
        uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (!v24) {
          break;
        }
      }
    }
  }

  [v12 appendString:@";"]);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __73__AMSSQLiteEntity__insertValues_intoTable_withPersistentID_onConnection___block_invoke;
  v32[3] = &unk_1E55A41E8;
  int64_t v34 = a5;
  id v35 = 0;
  id v26 = v22;
  id v33 = v26;
  char v27 = [v11 executeStatement:v12 error:&v35 bindings:v32];
  id v28 = v35;
  if (v28)
  {
    uint64_t v29 = objc_opt_class();
    NSLog(&cfstr_PublicError.isa, v29, v28);
  }

  return v27;
}

void __73__AMSSQLiteEntity__insertValues_intoTable_withPersistentID_onConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
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
        AMSSQLiteBindFoundationValue(v3, v8 + v9, v10);

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v8 = (v8 + v9);
    }
    while (v6);
  }
}

- (id)_copyTableClusteredValuesWithValues:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [v6 databaseTable];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__AMSSQLiteEntity__copyTableClusteredValuesWithValues___block_invoke;
  v13[3] = &unk_1E55A6810;
  uint64_t v16 = v6;
  id v14 = v7;
  id v8 = v5;
  id v15 = v8;
  id v9 = v7;
  [v4 enumerateKeysAndObjectsUsingBlock:v13];

  id v10 = v15;
  id v11 = v8;

  return v11;
}

void __55__AMSSQLiteEntity__copyTableClusteredValuesWithValues___block_invoke(id *a1, void *a2, void *a3)
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
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [a1[5] setObject:v9 forKey:v7];
    }
    [v9 setObject:v5 forKey:v8];
  }
}

- (BOOL)_deleteRowFromTable:(id)a3 usingColumn:(id)a4
{
  uint64_t v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[[v6 alloc] initWithFormat:@"DELETE FROM %@ WHERE %@ = ?;", v8, v7];

  connection = self->_connection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__AMSSQLiteEntity__deleteRowFromTable_usingColumn___block_invoke;
  v12[3] = &unk_1E55A40A8;
  v12[4] = self;
  LOBYTE(v8) = [(AMSSQLiteConnection *)connection executeStatement:v9 error:0 bindings:v12];

  return (char)v8;
}

uint64_t __51__AMSSQLiteEntity__deleteRowFromTable_usingColumn___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindInt64:*(void *)(*(void *)(a1 + 32) + 16) atPosition:1];
}

- (AMSSQLiteConnection)connection
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

+ (id)anyOnConnection:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__63;
  uint64_t v20 = __Block_byref_object_dispose__63;
  id v21 = 0;
  id v8 = [a1 queryOnConnection:v6 predicate:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__AMSSQLiteEntity_AMSSQLiteQueryAdditions__anyOnConnection_predicate___block_invoke;
  v12[3] = &unk_1E55A69C0;
  id v14 = &v16;
  id v15 = a1;
  id v9 = v6;
  id v13 = v9;
  [v8 enumeratePersistentIDsUsingBlock:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __70__AMSSQLiteEntity_AMSSQLiteQueryAdditions__anyOnConnection_predicate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [objc_alloc(*(Class *)(a1 + 48)) initWithPersistentID:a2 onConnection:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  *a4 = 1;
}

+ (id)countForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  return (id)[a1 _aggregateValueForProperty:a3 function:@"COUNT" predicate:a4 onConnection:a5];
}

+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  return (id)[a1 _aggregateValueForProperty:a3 function:@"MAX" predicate:a4 onConnection:a5];
}

+ (id)minValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  return (id)[a1 _aggregateValueForProperty:a3 function:@"MIN" predicate:a4 onConnection:a5];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4
{
  return (id)[a1 queryOnConnection:a3 predicate:a4 orderingProperties:0];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(AMSSQLiteQueryDescriptor);
  [(AMSSQLiteQueryDescriptor *)v11 setEntityClass:a1];
  -[AMSSQLiteQueryDescriptor setMemoryEntityClass:](v11, "setMemoryEntityClass:", [a1 memoryEntityClass]);
  [(AMSSQLiteQueryDescriptor *)v11 setOrderingProperties:v8];

  [(AMSSQLiteQueryDescriptor *)v11 setPredicate:v9];
  id v12 = [[AMSSQLiteQuery alloc] initOnConnection:v10 descriptor:v11];

  return v12;
}

+ (id)_aggregateValueForProperty:(id)a3 function:(id)a4 predicate:(id)a5 onConnection:(id)a6
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = __Block_byref_object_copy__63;
  uint64_t v31 = __Block_byref_object_dispose__63;
  id v32 = 0;
  id v14 = objc_alloc_init(AMSSQLiteQueryDescriptor);
  [(AMSSQLiteQueryDescriptor *)v14 setEntityClass:a1];
  [(AMSSQLiteQueryDescriptor *)v14 setPredicate:v12];
  id v15 = [NSString alloc];
  uint64_t v16 = [a1 disambiguatedSQLForProperty:v10];
  uint64_t v17 = (void *)[v15 initWithFormat:@"%@(%@)", v11, v16];

  v33[0] = v10;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObject:v17];
  id v20 = [(AMSSQLiteQueryDescriptor *)v14 _newSelectSQLWithProperties:v18 columns:v19];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __103__AMSSQLiteEntity_AMSSQLiteQueryAdditions___aggregateValueForProperty_function_predicate_onConnection___block_invoke;
  v24[3] = &unk_1E55A66D0;
  id v21 = v14;
  uint64_t v25 = v21;
  id v26 = &v27;
  [v13 executeQuery:v20 withResults:v24];
  id v22 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v22;
}

void __103__AMSSQLiteEntity_AMSSQLiteQueryAdditions___aggregateValueForProperty_function_predicate_onConnection___block_invoke(uint64_t a1, void *a2)
{
  int v7 = 1;
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 predicate];
  [v5 applyBinding:v4 atIndex:&v7];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __103__AMSSQLiteEntity_AMSSQLiteQueryAdditions___aggregateValueForProperty_function_predicate_onConnection___block_invoke_2;
  v6[3] = &unk_1E55A69E8;
  v6[4] = *(void *)(a1 + 40);
  [v4 enumerateRowsUsingBlock:v6];
}

void __103__AMSSQLiteEntity_AMSSQLiteQueryAdditions___aggregateValueForProperty_function_predicate_onConnection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = AMSSQLiteCopyFoundationValue(a2, 0);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  *a4 = 1;
}

@end