@interface HDMetadataKeyEntity
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_entityForKey:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)_insertEntityWithKey:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)_keyForPersistentID:(id)a3 database:(id)a4;
+ (id)databaseTable;
+ (id)entityForKey:(id)a3 healthDatabase:(id)a4 error:(id *)a5;
+ (id)insertEntityWithKey:(id)a3 healthDatabase:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
@end

@implementation HDMetadataKeyEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)_entityForKey:(id)a3 database:(id)a4 error:(id *)a5
{
  v8 = (void *)MEMORY[0x1E4F65D00];
  id v9 = a4;
  v10 = [v8 predicateWithProperty:@"key" equalToValue:a3];
  v11 = [a1 anyInDatabase:v9 predicate:v10 error:a5];

  return v11;
}

+ (id)_keyForPersistentID:(id)a3 database:(id)a4
{
  id v5 = a4;
  v6 = +[HDSQLiteEntity entityWithPersistentID:a3];
  v7 = [v6 valueForProperty:@"key" database:v5];

  return v7;
}

+ (id)databaseTable
{
  return @"metadata_keys";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 2;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_31;
}

+ (id)entityForKey:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__63;
  v21 = __Block_byref_object_dispose__63;
  id v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__HDMetadataKeyEntity_entityForKey_healthDatabase_error___block_invoke;
  v13[3] = &unk_1E62F66D8;
  v15 = &v17;
  id v16 = a1;
  id v10 = v8;
  id v14 = v10;
  [a1 performReadTransactionWithHealthDatabase:v9 error:a5 block:v13];
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

uint64_t __57__HDMetadataKeyEntity_entityForKey_healthDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 48)];
  uint64_t v6 = [*(id *)(a1 + 48) _entityForKey:*(void *)(a1 + 32) database:v5 error:a3];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return 1;
}

+ (id)insertEntityWithKey:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__63;
  id v22 = __Block_byref_object_dispose__63;
  id v23 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__HDMetadataKeyEntity_insertEntityWithKey_healthDatabase_error___block_invoke;
  v14[3] = &unk_1E62F66D8;
  id v16 = &v18;
  id v17 = a1;
  id v10 = v8;
  id v15 = v10;
  if ([a1 performWriteTransactionWithHealthDatabase:v9 error:a5 block:v14]) {
    id v11 = (void *)v19[5];
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  _Block_object_dispose(&v18, 8);

  return v12;
}

BOOL __64__HDMetadataKeyEntity_insertEntityWithKey_healthDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 48)];
  uint64_t v6 = [*(id *)(a1 + 48) _insertEntityWithKey:*(void *)(a1 + 32) database:v5 error:a3];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  BOOL v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
  return v9;
}

+ (id)_insertEntityWithKey:(id)a3 database:(id)a4 error:(id *)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v17[0] = @"key";
  BOOL v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a4;
  id v11 = [v9 arrayWithObjects:v17 count:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__HDMetadataKeyEntity__insertEntityWithKey_database_error___block_invoke;
  v15[3] = &unk_1E62F35C8;
  id v16 = v8;
  id v12 = v8;
  v13 = [a1 insertOrReplaceEntity:1 database:v10 properties:v11 error:a5 bindingHandler:v15];

  return v13;
}

void __59__HDMetadataKeyEntity__insertEntityWithKey_database_error___block_invoke()
{
}

@end