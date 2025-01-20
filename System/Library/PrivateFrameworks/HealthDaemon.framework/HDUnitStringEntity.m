@interface HDUnitStringEntity
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)storeUnitString:(id)a3 database:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
@end

@implementation HDUnitStringEntity

+ (id)storeUnitString:(id)a3 database:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__118;
  v24 = __Block_byref_object_dispose__118;
  id v25 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__HDUnitStringEntity_storeUnitString_database_error___block_invoke;
  v18[3] = &unk_1E62F43C8;
  id v9 = v7;
  id v19 = v9;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __53__HDUnitStringEntity_storeUnitString_database_error___block_invoke_2;
  v17[3] = &unk_1E62F3640;
  v17[4] = &v20;
  [v8 executeSQL:@"SELECT ROWID FROM unit_strings WHERE unit_string=?" error:a5 bindingHandler:v18 enumerationHandler:v17];
  v10 = (void *)v21[5];
  if (!v10)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__HDUnitStringEntity_storeUnitString_database_error___block_invoke_3;
    v15[3] = &unk_1E62F43C8;
    id v16 = v9;
    if ([v8 executeSQL:@"INSERT INTO unit_strings (unit_string) VALUES (?)" error:a5 bindingHandler:v15 enumerationHandler:0])
    {
      uint64_t v11 = [v8 lastInsertRowID];
      v12 = (void *)v21[5];
      v21[5] = v11;
    }
    v10 = (void *)v21[5];
  }
  id v13 = v10;

  _Block_object_dispose(&v20, 8);

  return v13;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)databaseTable
{
  return @"unit_strings";
}

uint64_t __53__HDUnitStringEntity_storeUnitString_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  v3 = (const char *)[*(id *)(a1 + 32) UTF8String];

  return sqlite3_bind_text(a2, 1, v3, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __53__HDUnitStringEntity_storeUnitString_database_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F70](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

uint64_t __53__HDUnitStringEntity_storeUnitString_database_error___block_invoke_3()
{
  return HDSQLiteBindFoundationValueToStatement();
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 2;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_59;
}

@end