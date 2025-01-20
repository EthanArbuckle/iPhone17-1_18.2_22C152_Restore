@interface HDSimpleGraphDatabaseMetadataEntity
+ (BOOL)enumerateMetadataValuesWithPredicate:(id)a3 database:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)metadataValueForKey:(id)a3 valueOut:(id *)a4 database:(id)a5 error:(id *)a6;
+ (BOOL)setMetadataValue:(id)a3 forKey:(id)a4 database:(id)a5 error:(id *)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
- (HDSimpleGraphDatabaseMetadataEntity)init;
@end

@implementation HDSimpleGraphDatabaseMetadataEntity

- (HDSimpleGraphDatabaseMetadataEntity)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (BOOL)setMetadataValue:(id)a3 forKey:(id)a4 database:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v13)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"HDSimpleGraphDatabaseMetadataEntity.m", 31, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, a1, @"HDSimpleGraphDatabaseMetadataEntity.m", 32, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

LABEL_3:
  if (([v13 isWriter] & 1) == 0)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"HDSimpleGraphDatabaseMetadataEntity.m", 33, @"Invalid parameter not satisfying: %@", @"database.isWriter" object file lineNumber description];

    if (v11) {
      goto LABEL_5;
    }
LABEL_9:
    id v23 = v12;
    id v24 = v13;
    self;
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __76__HDSimpleGraphDatabaseMetadataEntity__deleteMetadataForKey_database_error___block_invoke;
    v30 = &unk_1E62F43C8;
    id v31 = v23;
    id v25 = v23;
    char v19 = [v24 executeSQL:@"DELETE FROM metadata WHERE key = ?" error:a6 bindingHandler:&v27 enumerationHandler:0];

    goto LABEL_10;
  }
  if (!v11) {
    goto LABEL_9;
  }
LABEL_5:
  id v14 = v11;
  id v15 = v12;
  id v16 = v13;
  self;
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __76__HDSimpleGraphDatabaseMetadataEntity__setMetadataValue_key_database_error___block_invoke_2;
  v30 = &unk_1E62F2900;
  id v31 = v15;
  id v32 = v14;
  id v17 = v14;
  id v18 = v15;
  char v19 = [v16 executeCachedStatementForKey:&_setMetadataValue_key_database_error__statementKey error:a6 SQLGenerator:&__block_literal_global_329_0 bindingHandler:&v27 enumerationHandler:0];

LABEL_10:
  return v19;
}

+ (BOOL)metadataValueForKey:(id)a3 valueOut:(id *)a4 database:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a5;
  if (!v12)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"HDSimpleGraphDatabaseMetadataEntity.m", 47, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__23;
  v26 = __Block_byref_object_dispose__23;
  id v27 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __83__HDSimpleGraphDatabaseMetadataEntity_metadataValueForKey_valueOut_database_error___block_invoke_2;
  v20[3] = &unk_1E62F43C8;
  id v13 = v11;
  id v21 = v13;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83__HDSimpleGraphDatabaseMetadataEntity_metadataValueForKey_valueOut_database_error___block_invoke_3;
  v19[3] = &unk_1E62F3640;
  v19[4] = &v22;
  char v14 = [v12 executeCachedStatementForKey:&metadataValueForKey_valueOut_database_error__statementKey error:a6 SQLGenerator:&__block_literal_global_29 bindingHandler:v20 enumerationHandler:v19];
  BOOL v15 = v14;
  if (a4) {
    char v16 = v14;
  }
  else {
    char v16 = 0;
  }
  if (v16) {
    *a4 = (id) v23[5];
  }

  _Block_object_dispose(&v22, 8);
  return v15;
}

__CFString *__83__HDSimpleGraphDatabaseMetadataEntity_metadataValueForKey_valueOut_database_error___block_invoke()
{
  return @"SELECT metadata.value FROM metadata WHERE metadata.key = ?";
}

uint64_t __83__HDSimpleGraphDatabaseMetadataEntity_metadataValueForKey_valueOut_database_error___block_invoke_2()
{
  return HDSQLiteBindStringToStatement();
}

uint64_t __83__HDSimpleGraphDatabaseMetadataEntity_metadataValueForKey_valueOut_database_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F80](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

+ (BOOL)enumerateMetadataValuesWithPredicate:(id)a3 database:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  v20[0] = @"key";
  v20[1] = @"value";
  id v11 = (void *)MEMORY[0x1E4F1C978];
  id v12 = a4;
  id v13 = a3;
  char v14 = [v11 arrayWithObjects:v20 count:2];
  uint64_t v15 = *MEMORY[0x1E4F65DE0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __110__HDSimpleGraphDatabaseMetadataEntity_enumerateMetadataValuesWithPredicate_database_error_enumerationHandler___block_invoke;
  v18[3] = &unk_1E62F4138;
  id v19 = v10;
  id v16 = v10;
  LOBYTE(a1) = [a1 enumerateQueryResultsFromColumns:v14 properties:v14 predicate:v13 groupBy:0 orderingTerms:0 limit:v15 database:v12 error:a5 enumerationHandler:v18];

  return (char)a1;
}

uint64_t __110__HDSimpleGraphDatabaseMetadataEntity_enumerateMetadataValuesWithPredicate_database_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = MEMORY[0x1C1879F80](a3, 0);
  v6 = MEMORY[0x1C1879F80](a3, 1);
  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v7;
}

+ (id)databaseTable
{
  return @"metadata";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_13;
}

uint64_t __76__HDSimpleGraphDatabaseMetadataEntity__deleteMetadataForKey_database_error___block_invoke()
{
  return HDSQLiteBindStringToStatement();
}

__CFString *__76__HDSimpleGraphDatabaseMetadataEntity__setMetadataValue_key_database_error___block_invoke()
{
  return @"INSERT INTO metadata (key, value) VALUES (?, ?) ON CONFLICT(key) DO UPDATE SET value = ?";
}

uint64_t __76__HDSimpleGraphDatabaseMetadataEntity__setMetadataValue_key_database_error___block_invoke_2()
{
  HDSQLiteBindStringToStatement();
  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindFoundationValueToStatement();
}

@end