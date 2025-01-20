@interface HDSyncStoreEntity
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_predicateWithStoreUUID:(uint64_t)a3 type:;
+ (id)allSyncStoreEntitiesOfType:(int64_t)a3 transaction:(id)a4 error:(id *)a5;
+ (id)databaseTable;
+ (id)existingSyncStoreEntityWithUUID:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)recreateSyncStoreWithUUID:(id)a3 type:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (id)syncStoreEntityWithUUID:(id)a3 type:(int64_t)a4 healthDatabase:(id)a5 error:(id *)a6;
+ (int64_t)protectionClass;
@end

@implementation HDSyncStoreEntity

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)syncStoreEntityWithUUID:(id)a3 type:(int64_t)a4 healthDatabase:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a5;
  if (!v11)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"HDSyncStoreEntity.m", 29, @"Invalid parameter not satisfying: %@", @"UUID != nil" object file lineNumber description];
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__78;
  v27 = __Block_byref_object_dispose__78;
  id v28 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__HDSyncStoreEntity_syncStoreEntityWithUUID_type_healthDatabase_error___block_invoke;
  v18[3] = &unk_1E62FE6C8;
  id v21 = a1;
  id v13 = v11;
  int64_t v22 = a4;
  id v19 = v13;
  v20 = &v23;
  if ([a1 performWriteTransactionWithHealthDatabase:v12 error:a6 block:v18]) {
    v14 = (void *)v24[5];
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  _Block_object_dispose(&v23, 8);

  return v15;
}

BOOL __71__HDSyncStoreEntity_syncStoreEntityWithUUID_type_healthDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v23[3] = *MEMORY[0x1E4F143B8];
  v5 = [a2 databaseForEntityClass:*(void *)(a1 + 48)];
  v6 = +[HDSyncStoreEntity _predicateWithStoreUUID:type:](*(void *)(a1 + 48), *(void **)(a1 + 32), *(void *)(a1 + 56));
  uint64_t v7 = [*(id *)(a1 + 48) anyInDatabase:v5 predicate:v6 error:a3];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v10)
  {
    v23[0] = @"uuid";
    v23[1] = @"type";
    v23[2] = @"creation_date";
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
    id v12 = *(void **)(a1 + 48);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __71__HDSyncStoreEntity_syncStoreEntityWithUUID_type_healthDatabase_error___block_invoke_2;
    v20[3] = &unk_1E62F67E8;
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 56);
    id v21 = v13;
    uint64_t v22 = v14;
    uint64_t v15 = [v12 insertOrReplaceEntity:0 database:v5 properties:v11 error:a3 bindingHandler:v20];
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  BOOL v18 = v10 != 0;

  return v18;
}

+ (id)_predicateWithStoreUUID:(uint64_t)a3 type:
{
  id v4 = a2;
  self;
  v5 = (void *)MEMORY[0x1E4F65D00];
  v6 = objc_msgSend(v4, "hk_dataForUUIDBytes");

  uint64_t v7 = [v5 predicateWithProperty:@"uuid" equalToValue:v6];

  uint64_t v8 = (void *)MEMORY[0x1E4F65D00];
  v9 = [NSNumber numberWithInteger:a3];
  uint64_t v10 = [v8 predicateWithProperty:@"type" equalToValue:v9];

  id v11 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v7 otherPredicate:v10];

  return v11;
}

void __71__HDSyncStoreEntity_syncStoreEntityWithUUID_type_healthDatabase_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879EF0](a2, @"uuid", *(void *)(a1 + 32));
  MEMORY[0x1C1879E80](a2, @"type", *(void *)(a1 + 40));
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  MEMORY[0x1C1879E40](a2, @"creation_date", v4);
}

+ (id)existingSyncStoreEntityWithUUID:(id)a3 database:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"HDSyncStoreEntity.m", 66, @"Invalid parameter not satisfying: %@", @"UUID != nil" object file lineNumber description];
  }
  id v11 = (void *)MEMORY[0x1E4F65D00];
  id v12 = objc_msgSend(v9, "hk_dataForUUIDBytes");
  id v13 = [v11 predicateWithProperty:@"uuid" equalToValue:v12];

  uint64_t v14 = [a1 anyInDatabase:v10 predicate:v13 error:a5];

  return v14;
}

+ (id)allSyncStoreEntitiesOfType:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v9 = a4;
  id v10 = objc_alloc_init(v8);
  id v11 = [v9 databaseForEntityClass:a1];

  id v12 = (void *)MEMORY[0x1E4F65D00];
  id v13 = [NSNumber numberWithInteger:a3];
  uint64_t v14 = [v12 predicateWithProperty:@"type" equalToValue:v13];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__HDSyncStoreEntity_allSyncStoreEntitiesOfType_transaction_error___block_invoke;
  v19[3] = &unk_1E62FE6F0;
  id v20 = v10;
  id v15 = v10;
  LODWORD(a5) = [a1 enumerateEntitiesInDatabase:v11 predicate:v14 error:a5 enumerationHandler:v19];

  if (a5) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }
  id v17 = v16;

  return v17;
}

uint64_t __66__HDSyncStoreEntity_allSyncStoreEntitiesOfType_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (id)recreateSyncStoreWithUUID:(id)a3 type:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a5;
  self;
  if ((unint64_t)(a4 - 6) >= 0xFFFFFFFFFFFFFFFCLL)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"HDSyncStoreEntity.m", 107, @"Invalid parameter not satisfying: %@", @"[self _canRecreateSyncStoreWithType:type]" object file lineNumber description];
  }
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__78;
  v31 = __Block_byref_object_dispose__78;
  id v32 = 0;
  id v13 = [v12 database];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __66__HDSyncStoreEntity_recreateSyncStoreWithUUID_type_profile_error___block_invoke;
  v21[3] = &unk_1E62FE718;
  id v25 = a1;
  id v14 = v11;
  int64_t v26 = a4;
  id v22 = v14;
  v24 = &v27;
  id v15 = v12;
  id v23 = v15;
  int v16 = [a1 performWriteTransactionWithHealthDatabase:v13 error:a6 block:v21];

  if (v16) {
    id v17 = (void *)v28[5];
  }
  else {
    id v17 = 0;
  }
  id v18 = v17;

  _Block_object_dispose(&v27, 8);

  return v18;
}

BOOL __66__HDSyncStoreEntity_recreateSyncStoreWithUUID_type_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = [a2 databaseForEntityClass:*(void *)(a1 + 56)];
  v6 = +[HDSyncStoreEntity _predicateWithStoreUUID:type:](*(void *)(a1 + 56), *(void **)(a1 + 32), *(void *)(a1 + 64));
  if ([*(id *)(a1 + 56) deleteEntitiesInDatabase:v5 predicate:v6 error:a3])
  {
    uint64_t v7 = *(void **)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [*(id *)(a1 + 40) database];
    uint64_t v11 = [v7 syncStoreEntityWithUUID:v9 type:v8 healthDatabase:v10 error:a3];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    BOOL v14 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (id)databaseTable
{
  return @"sync_stores";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_44;
}

@end