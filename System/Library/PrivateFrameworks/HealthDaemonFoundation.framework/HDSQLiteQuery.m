@interface HDSQLiteQuery
- (BOOL)deleteAllEntitiesWithError:(id *)a3;
- (BOOL)enumeratePersistentIDsAndProperties:(id)a3 error:(id *)a4 enumerationHandler:(id)a5;
- (BOOL)enumerateProperties:(id)a3 error:(id *)a4 enumerationHandler:(id)a5;
- (HDSQLiteDatabase)database;
- (HDSQLiteQuery)initWithDatabase:(id)a3 descriptor:(id)a4;
- (HDSQLiteQueryDescriptor)queryDescriptor;
- (NSString)lastSQLStatement;
- (void)_expandLastSQLStatementIfNecessary:(uint64_t)a1;
@end

@implementation HDSQLiteQuery

uint64_t __62__HDSQLiteQuery_enumerateProperties_error_enumerationHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    HDSQLiteRow::setColumnNames(a2, *(void **)(a1 + 32));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSQLStatement, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

- (BOOL)deleteAllEntitiesWithError:(id *)a3
{
  database = self->_database;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__HDSQLiteQuery_deleteAllEntitiesWithError___block_invoke;
  v5[3] = &unk_2643D4D78;
  v5[4] = self;
  return [(HDSQLiteDatabase *)database performTransactionWithType:1 error:a3 usingBlock:v5];
}

- (HDSQLiteQuery)initWithDatabase:(id)a3 descriptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDSQLiteQuery;
  v9 = [(HDSQLiteQuery *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    uint64_t v11 = [v8 copy];
    descriptor = v10->_descriptor;
    v10->_descriptor = (HDSQLiteQueryDescriptor *)v11;
  }
  return v10;
}

- (NSString)lastSQLStatement
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

uint64_t __44__HDSQLiteQuery_deleteAllEntitiesWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [*(id *)(*(void *)(a1 + 32) + 16) _SQLForDeleteWithError:a3];
  if (v6)
  {
    char v7 = [*(id *)(*(void *)(a1 + 32) + 16) shouldExpandLastSQLStatement];
    if (v7) {
      id v8 = 0;
    }
    else {
      id v8 = (void *)[v6 copy];
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), v8);
    if ((v7 & 1) == 0) {

    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __44__HDSQLiteQuery_deleteAllEntitiesWithError___block_invoke_2;
    v11[3] = &unk_2643D4B30;
    v11[4] = *(void *)(a1 + 32);
    uint64_t v9 = [v5 executeSQL:v6 error:a3 bindingHandler:v11 enumerationHandler:0];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)enumeratePersistentIDsAndProperties:(id)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (v9) {
    id v11 = (id)[v9 mutableCopy];
  }
  else {
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  }
  v12 = v11;
  [v11 insertObject:@"ROWID" atIndex:0];
  v13 = (void *)MEMORY[0x263EFFA68];
  if (v9) {
    v13 = v9;
  }
  id v14 = v13;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __78__HDSQLiteQuery_enumeratePersistentIDsAndProperties_error_enumerationHandler___block_invoke;
  v19[3] = &unk_2643D4EC8;
  SEL v22 = a2;
  v19[4] = self;
  id v15 = v10;
  id v20 = v14;
  id v21 = v15;
  id v16 = v14;
  BOOL v17 = [(HDSQLiteQuery *)self enumerateProperties:v12 error:a4 enumerationHandler:v19];

  return v17;
}

void __62__HDSQLiteQuery_enumerateProperties_error_enumerationHandler___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = 1;
  [*(id *)(*(void *)(a1 + 32) + 16) bindToSelectStatement:a2 bindingIndex:&v4];
  -[HDSQLiteQuery _expandLastSQLStatementIfNecessary:](*(void *)(a1 + 32), a2);
}

- (BOOL)enumerateProperties:(id)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if ((unint64_t)[v9 count] >= 0x7FFFFFFF)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HDSQLiteQuery.mm", 94, @"Insane number of properties for enumeration (%lu)", objc_msgSend(v9, "count"));
  }
  id v11 = [(HDSQLiteQueryDescriptor *)self->_descriptor selectSQLForProperties:v9];
  if ([(HDSQLiteQueryDescriptor *)self->_descriptor shouldExpandLastSQLStatement])
  {
    lastSQLStatement = self->_lastSQLStatement;
    self->_lastSQLStatement = 0;
  }
  else
  {
    v13 = (NSString *)[v11 copy];
    lastSQLStatement = self->_lastSQLStatement;
    self->_lastSQLStatement = v13;
  }

  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  database = self->_database;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __62__HDSQLiteQuery_enumerateProperties_error_enumerationHandler___block_invoke;
  v24[3] = &unk_2643D4B30;
  v24[4] = self;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __62__HDSQLiteQuery_enumerateProperties_error_enumerationHandler___block_invoke_2;
  v20[3] = &unk_2643D4EF0;
  v23 = v25;
  id v15 = v9;
  id v21 = v15;
  id v16 = v10;
  id v22 = v16;
  BOOL v17 = [(HDSQLiteDatabase *)database executeSQL:v11 error:a4 bindingHandler:v24 enumerationHandler:v20];

  _Block_object_dispose(v25, 8);
  return v17;
}

- (void)_expandLastSQLStatementIfNecessary:(uint64_t)a1
{
  if (a1)
  {
    if ([*(id *)(a1 + 16) shouldExpandLastSQLStatement])
    {
      int v4 = sqlite3_expanded_sql(a2);
      if (v4)
      {
        id v5 = v4;
        uint64_t v6 = [NSString stringWithUTF8String:v4];
        char v7 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v6;

        sqlite3_free(v5);
      }
    }
  }
}

uint64_t __78__HDSQLiteQuery_enumeratePersistentIDsAndProperties_error_enumerationHandler___block_invoke(void *a1, uint64_t a2, _DWORD *a3)
{
  if ((*(uint64_t (**)(_DWORD *, void))(*(void *)a3 + 16))(a3, 0) <= 0)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a1[7], a1[4], @"HDSQLiteQuery.mm", 76, @"Invalid parameter not satisfying: %@", @"pID > 0" object file lineNumber description];
  }
  a3[4] = 1;
  uint64_t result = (*(uint64_t (**)(void))(a1[6] + 16))();
  a3[4] = 0;
  return result;
}

void __44__HDSQLiteQuery_deleteAllEntitiesWithError___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = 1;
  [*(id *)(*(void *)(a1 + 32) + 16) bindToDeleteStatement:a2 bindingIndex:&v4];
  -[HDSQLiteQuery _expandLastSQLStatementIfNecessary:](*(void *)(a1 + 32), a2);
}

- (HDSQLiteQueryDescriptor)queryDescriptor
{
  return self->_descriptor;
}

- (HDSQLiteDatabase)database
{
  return (HDSQLiteDatabase *)objc_getProperty(self, a2, 8, 1);
}

@end