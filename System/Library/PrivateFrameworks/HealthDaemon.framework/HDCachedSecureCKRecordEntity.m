@interface HDCachedSecureCKRecordEntity
+ (BOOL)deleteRecordWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordName:(id)a7 profile:(id)a8 error:(id *)a9;
+ (BOOL)insertOrUpdateWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordData:(id)a7 recordName:(id)a8 profile:(id)a9 error:(id *)a10;
+ (BOOL)insertOrUpdateWithRecordID:(int64_t)a3 recordData:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeRecordsWithProfile:(id)a3 error:(id *)a4;
+ (BOOL)updateWithRecordData:(id)a3 recordID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_unprotectedRecordEntityWithContainerIdentifier:(uint64_t)a3 databaseScope:(void *)a4 zoneName:(void *)a5 ownerName:(void *)a6 recordName:(void *)a7 profile:(uint64_t)a8 error:;
+ (id)databaseTable;
+ (id)insertWithRecordID:(int64_t)a3 recordData:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (id)protectedRecordDataForUnprotectedEntity:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
@end

@implementation HDCachedSecureCKRecordEntity

+ (id)databaseTable
{
  return @"ck_record_cache_secure";
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDCachedSecureCKRecordEntityColumnDefinitions;
}

+ (id)insertWithRecordID:(int64_t)a3 recordData:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a4;
  v11 = [a5 databaseForEntityClass:a1];
  int64_t v20 = a3;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __80__HDCachedSecureCKRecordEntity_insertWithRecordID_recordData_transaction_error___block_invoke;
  v21[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v21[4] = a1;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__HDCachedSecureCKRecordEntity_insertWithRecordID_recordData_transaction_error___block_invoke_2;
  v18[3] = &unk_1E62F33F8;
  id v12 = v10;
  id v19 = v12;
  int v13 = [v11 executeCachedStatementForKey:&insertWithRecordID_recordData_transaction_error__lookupKey error:a6 SQLGenerator:v21 bindingHandler:v18 enumerationHandler:0];
  v14 = 0;
  if (v13)
  {
    v15 = [HDCachedSecureCKRecordEntity alloc];
    v16 = [v11 lastInsertRowID];
    v14 = -[HDSQLiteEntity initWithPersistentID:](v15, "initWithPersistentID:", [v16 longLongValue]);
  }

  return v14;
}

id __80__HDCachedSecureCKRecordEntity_insertWithRecordID_recordData_transaction_error___block_invoke()
{
  v0 = self;
  v1 = NSString;
  v2 = [v0 disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"INSERT INTO %@ (%@, %@) VALUES (?, ?)", v2, @"record_id", @"record_data"];

  return v3;
}

uint64_t __80__HDCachedSecureCKRecordEntity_insertWithRecordID_recordData_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));

  return HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)updateWithRecordData:(id)a3 recordID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = [a5 databaseForEntityClass:a1];
  id v12 = HDPredicateForRecordID(a4);
  v18[0] = @"record_data";
  int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__HDCachedSecureCKRecordEntity_updateWithRecordData_recordID_transaction_error___block_invoke;
  v16[3] = &unk_1E62F35C8;
  id v17 = v10;
  id v14 = v10;
  LOBYTE(a6) = [a1 updateProperties:v13 predicate:v12 database:v11 error:a6 bindingHandler:v16];

  return (char)a6;
}

void __80__HDCachedSecureCKRecordEntity_updateWithRecordData_recordID_transaction_error___block_invoke()
{
}

+ (BOOL)insertOrUpdateWithRecordID:(int64_t)a3 recordData:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = [v11 database];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __84__HDCachedSecureCKRecordEntity_insertOrUpdateWithRecordID_recordData_profile_error___block_invoke;
  v20[3] = &unk_1E62FE270;
  id v22 = a1;
  int64_t v23 = a3;
  id v21 = v10;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__HDCachedSecureCKRecordEntity_insertOrUpdateWithRecordID_recordData_profile_error___block_invoke_2;
  v16[3] = &unk_1E62F4228;
  id v18 = v11;
  int64_t v19 = a3;
  id v17 = v21;
  id v13 = v11;
  id v14 = v21;
  LOBYTE(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v12 error:a6 block:v20 inaccessibilityHandler:v16];

  return (char)a6;
}

BOOL __84__HDCachedSecureCKRecordEntity_insertOrUpdateWithRecordID_recordData_profile_error___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = (void *)a1[5];
  v7 = [v5 databaseForEntityClass:v6];
  v8 = HDPredicateForRecordID(a1[6]);
  id v23 = 0;
  v9 = [v6 anyInDatabase:v7 predicate:v8 error:&v23];
  id v10 = v23;

  if (v9) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v10 == 0;
  }
  if (!v11)
  {
    if (!a3)
    {
      _HKLogDroppedError();
      BOOL v14 = 0;
      v9 = 0;
      goto LABEL_18;
    }
    v16 = v10;
    goto LABEL_10;
  }
  if (!v9)
  {
    uint64_t v17 = a1[6];
    uint64_t v18 = a1[4];
    id v22 = v10;
    v9 = +[HDCachedSecureCKRecordEntity insertWithRecordID:v17 recordData:v18 transaction:v5 error:&v22];
    id v19 = v22;

    BOOL v14 = 1;
    if (!v9 && v19)
    {
      if (a3)
      {
        v16 = v19;
LABEL_10:
        id v10 = v16;
        BOOL v14 = 0;
        v9 = 0;
        *a3 = v10;
        goto LABEL_18;
      }
      _HKLogDroppedError();
      BOOL v14 = 0;
      v9 = 0;
    }
    id v10 = v19;
    goto LABEL_18;
  }
  uint64_t v12 = a1[4];
  uint64_t v13 = a1[6];
  id v21 = v10;
  BOOL v14 = +[HDCachedSecureCKRecordEntity updateWithRecordData:v12 recordID:v13 transaction:v5 error:&v21];
  id v15 = v21;

  id v10 = v15;
LABEL_18:

  return v14;
}

uint64_t __84__HDCachedSecureCKRecordEntity_insertOrUpdateWithRecordID_recordData_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_alloc_init(HDCachedSecureCKRecordJournalEntry);
  [(HDCachedSecureCKRecordJournalEntry *)v5 setRecordID:*(void *)(a1 + 48)];
  [(HDCachedSecureCKRecordJournalEntry *)v5 setRecordData:*(void *)(a1 + 32)];
  v6 = [*(id *)(a1 + 40) database];
  uint64_t v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

+ (BOOL)insertOrUpdateWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordData:(id)a7 recordName:(id)a8 profile:(id)a9 error:(id *)a10
{
  id v16 = a7;
  id v17 = a9;
  id v24 = 0;
  uint64_t v18 = +[HDCachedSecureCKRecordEntity _unprotectedRecordEntityWithContainerIdentifier:databaseScope:zoneName:ownerName:recordName:profile:error:]((uint64_t)a1, a3, a4, a5, a6, a8, v17, (uint64_t)&v24);
  id v19 = v24;
  int64_t v20 = v19;
  if (v18) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = v19 == 0;
  }
  if (v21)
  {
    if (v18) {
      BOOL v22 = +[HDCachedSecureCKRecordEntity insertOrUpdateWithRecordID:recordData:profile:error:](HDCachedSecureCKRecordEntity, "insertOrUpdateWithRecordID:recordData:profile:error:", [v18 persistentID], v16, v17, a10);
    }
    else {
      BOOL v22 = 1;
    }
  }
  else if (a10)
  {
    BOOL v22 = 0;
    *a10 = v19;
  }
  else
  {
    _HKLogDroppedError();
    BOOL v22 = 0;
  }

  return v22;
}

+ (id)_unprotectedRecordEntityWithContainerIdentifier:(uint64_t)a3 databaseScope:(void *)a4 zoneName:(void *)a5 ownerName:(void *)a6 recordName:(void *)a7 profile:(uint64_t)a8 error:
{
  id v14 = a2;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  self;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__159;
  v38 = __Block_byref_object_dispose__159;
  id v39 = 0;
  id v19 = [v18 database];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __138__HDCachedSecureCKRecordEntity__unprotectedRecordEntityWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke;
  v27[3] = &unk_1E63054C0;
  id v20 = v14;
  id v28 = v20;
  uint64_t v33 = a3;
  id v21 = v15;
  id v29 = v21;
  id v22 = v16;
  id v30 = v22;
  v32 = &v34;
  id v23 = v17;
  id v31 = v23;
  LODWORD(a8) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v19 error:a8 block:v27];

  if (a8) {
    id v24 = (void *)v35[5];
  }
  else {
    id v24 = 0;
  }
  id v25 = v24;

  _Block_object_dispose(&v34, 8);

  return v25;
}

+ (id)protectedRecordDataForUnprotectedEntity:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__159;
  id v23 = __Block_byref_object_dispose__159;
  id v24 = 0;
  id v10 = [v9 protectedDatabase];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __90__HDCachedSecureCKRecordEntity_protectedRecordDataForUnprotectedEntity_transaction_error___block_invoke;
  v18[3] = &__block_descriptor_40_e15___NSString_8__0l;
  void v18[4] = a1;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__HDCachedSecureCKRecordEntity_protectedRecordDataForUnprotectedEntity_transaction_error___block_invoke_2;
  v16[3] = &unk_1E62F43C8;
  id v11 = v8;
  id v17 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__HDCachedSecureCKRecordEntity_protectedRecordDataForUnprotectedEntity_transaction_error___block_invoke_3;
  v15[3] = &unk_1E62F3640;
  v15[4] = &v19;
  LODWORD(a5) = [v10 executeCachedStatementForKey:&protectedRecordDataForUnprotectedEntity_transaction_error__lookupKey error:a5 SQLGenerator:v18 bindingHandler:v16 enumerationHandler:v15];

  if (a5) {
    uint64_t v12 = (void *)v20[5];
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  _Block_object_dispose(&v19, 8);

  return v13;
}

id __90__HDCachedSecureCKRecordEntity_protectedRecordDataForUnprotectedEntity_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@=?", @"record_data", v2, @"record_id"];

  return v3;
}

uint64_t __90__HDCachedSecureCKRecordEntity_protectedRecordDataForUnprotectedEntity_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) persistentID];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __90__HDCachedSecureCKRecordEntity_protectedRecordDataForUnprotectedEntity_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F20](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

+ (BOOL)deleteRecordWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordName:(id)a7 profile:(id)a8 error:(id *)a9
{
  id v15 = a8;
  id v28 = 0;
  id v16 = +[HDCachedSecureCKRecordEntity _unprotectedRecordEntityWithContainerIdentifier:databaseScope:zoneName:ownerName:recordName:profile:error:]((uint64_t)a1, a3, a4, a5, a6, a7, v15, (uint64_t)&v28);
  id v17 = v28;
  id v18 = v17;
  if (v16 || !v17)
  {
    if (v16)
    {
      id v20 = [v15 database];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __126__HDCachedSecureCKRecordEntity_deleteRecordWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke;
      v25[3] = &unk_1E62F9068;
      id v27 = a1;
      id v26 = v16;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __126__HDCachedSecureCKRecordEntity_deleteRecordWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke_2;
      v22[3] = &unk_1E62F6C20;
      id v23 = v26;
      id v24 = v15;
      char v19 = [a1 performWriteTransactionWithHealthDatabase:v20 error:a9 block:v25 inaccessibilityHandler:v22];
    }
    else
    {
      char v19 = 1;
    }
  }
  else if (a9)
  {
    char v19 = 0;
    *a9 = v17;
  }
  else
  {
    _HKLogDroppedError();
    char v19 = 0;
  }

  return v19;
}

uint64_t __126__HDCachedSecureCKRecordEntity_deleteRecordWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 40)];
  v6 = *(void **)(a1 + 40);
  uint64_t v7 = HDPredicateForRecordID([*(id *)(a1 + 32) persistentID]);
  uint64_t v8 = [v6 deleteEntitiesInDatabase:v5 predicate:v7 error:a3];

  return v8;
}

uint64_t __126__HDCachedSecureCKRecordEntity_deleteRecordWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_alloc_init(HDCachedSecureDeleteCKRecordJournalEntry);
  -[HDCachedSecureDeleteCKRecordJournalEntry setRecordID:](v5, "setRecordID:", [*(id *)(a1 + 32) persistentID]);
  v6 = [*(id *)(a1 + 40) database];
  uint64_t v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

+ (BOOL)synchronizeRecordsWithProfile:(id)a3 error:(id *)a4
{
  v6 = [a3 database];
  LOBYTE(a4) = [a1 performWriteTransactionWithHealthDatabase:v6 error:a4 block:&__block_literal_global_190 inaccessibilityHandler:0];

  return (char)a4;
}

uint64_t __68__HDCachedSecureCKRecordEntity_synchronizeRecordsWithProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __68__HDCachedSecureCKRecordEntity_synchronizeRecordsWithProfile_error___block_invoke_2;
  v29[3] = &unk_1E6308338;
  id v6 = v4;
  id v30 = v6;
  id v7 = v5;
  id v31 = v7;
  uint64_t v8 = v29;
  id v9 = v6;
  id v10 = self;
  id v11 = [v9 databaseForEntityClass:v10];

  uint64_t v12 = [v10 queryWithDatabase:v11 predicate:0];

  *(void *)&long long v36 = @"record_id";
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __93__HDCachedSecureCKRecordEntity__enumerateAllRecordIDsInTransaction_error_enumerationHandler___block_invoke;
  v34[3] = &unk_1E62F4138;
  id v35 = v8;
  id v14 = v8;
  uint64_t v15 = a3;
  LODWORD(a3) = [v12 enumerateProperties:v13 error:a3 enumerationHandler:v34];

  if (a3)
  {
    if ([v7 count])
    {
      id v16 = v7;
      id v17 = v9;
      uint64_t v18 = self;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id obj = v16;
      uint64_t v19 = [obj countByEnumeratingWithState:&v36 objects:v34 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        id v27 = v7;
        uint64_t v21 = *(void *)v37;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v37 != v21) {
              objc_enumerationMutation(obj);
            }
            uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            id v24 = [v17 protectedDatabase];
            v32[4] = v23;
            v33[0] = MEMORY[0x1E4F143A8];
            v33[1] = 3221225472;
            v33[2] = __67__HDCachedSecureCKRecordEntity__deleteRecordIds_transaction_error___block_invoke;
            v33[3] = &__block_descriptor_40_e15___NSString_8__0l;
            v33[4] = v18;
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __67__HDCachedSecureCKRecordEntity__deleteRecordIds_transaction_error___block_invoke_2;
            v32[3] = &unk_1E62F43C8;
            LODWORD(v23) = [v24 executeCachedStatementForKey:&_deleteRecordIds_transaction_error__lookupKey error:v15 SQLGenerator:v33 bindingHandler:v32 enumerationHandler:0];

            if (!v23)
            {
              uint64_t v25 = 0;
              goto LABEL_14;
            }
          }
          uint64_t v20 = [obj countByEnumeratingWithState:&v36 objects:v34 count:16];
          if (v20) {
            continue;
          }
          break;
        }
        uint64_t v25 = 1;
LABEL_14:
        id v7 = v27;
      }
      else
      {
        uint64_t v25 = 1;
      }
    }
    else
    {
      uint64_t v25 = 1;
    }
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

uint64_t __68__HDCachedSecureCKRecordEntity_synchronizeRecordsWithProfile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v6 = [*(id *)(a1 + 32) unprotectedDatabase];
  v11[4] = &v13;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__HDCachedSecureCKRecordEntity_synchronizeRecordsWithProfile_error___block_invoke_4;
  v12[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v12[4] = a2;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__HDCachedSecureCKRecordEntity_synchronizeRecordsWithProfile_error___block_invoke_5;
  v11[3] = &unk_1E62F3640;
  uint64_t v7 = [v6 executeCachedStatementForKey:&HDCachedSecureCKRecordJournalEntryRecordDataKey_block_invoke_lookupKey error:a3 SQLGenerator:&__block_literal_global_355 bindingHandler:v12 enumerationHandler:v11];

  if (!*((unsigned char *)v14 + 24))
  {
    uint64_t v8 = *(void **)(a1 + 40);
    id v9 = [NSNumber numberWithInteger:a2];
    [v8 addObject:v9];
  }
  _Block_object_dispose(&v13, 8);
  return v7;
}

id __68__HDCachedSecureCKRecordEntity_synchronizeRecordsWithProfile_error___block_invoke_3()
{
  v0 = NSString;
  v1 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v2 = [v0 stringWithFormat:@"SELECT 1 FROM %@ WHERE %@ = ? LIMIT 1", v1, *MEMORY[0x1E4F65C70]];

  return v2;
}

uint64_t __68__HDCachedSecureCKRecordEntity_synchronizeRecordsWithProfile_error___block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __68__HDCachedSecureCKRecordEntity_synchronizeRecordsWithProfile_error___block_invoke_5(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

uint64_t __93__HDCachedSecureCKRecordEntity__enumerateAllRecordIDsInTransaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  HDSQLiteColumnWithNameAsInt64();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

id __67__HDCachedSecureCKRecordEntity__deleteRecordIds_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v3 = [v1 stringWithFormat:@"DELETE FROM %@ WHERE %@ = ?", v2, @"record_id"];

  return v3;
}

uint64_t __67__HDCachedSecureCKRecordEntity__deleteRecordIds_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) longLongValue];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __138__HDCachedSecureCKRecordEntity__unprotectedRecordEntityWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = HDPredicateForContainerIdentifierAndDatabaseScope(*(void *)(a1 + 32), *(void *)(a1 + 72));
  uint64_t v7 = [v5 databaseForEntityClass:objc_opt_class()];
  id v28 = 0;
  uint64_t v8 = +[HDSQLiteEntity anyInDatabase:v7 predicate:v6 error:&v28];
  id v9 = v28;

  if (v8) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  if (v10)
  {
    if (v8)
    {
      id v11 = HDPredicateForDatabaseIDAndRecordZone([v8 persistentID], *(void **)(a1 + 40), *(void **)(a1 + 48));
      uint64_t v12 = [v5 databaseForEntityClass:objc_opt_class()];
      id v27 = v9;
      uint64_t v13 = +[HDSQLiteEntity anyInDatabase:v12 predicate:v11 error:&v27];
      id v14 = v27;

      if (v13)
      {
        id v24 = v14;
        uint64_t v25 = v11;
        uint64_t v15 = [v5 databaseForEntityClass:objc_opt_class()];
        char v16 = HDPredicateForZoneIDAndRecordName([v13 persistentID], *(void **)(a1 + 56));
        id v26 = 0;
        uint64_t v17 = +[HDSQLiteEntity anyInDatabase:v15 predicate:v16 error:&v26];
        id v18 = v26;
        uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
        uint64_t v20 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = v17;

        if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
          BOOL v21 = 1;
        }
        else {
          BOOL v21 = v18 == 0;
        }
        uint64_t v22 = v21;
        if (!v21)
        {
          if (a3) {
            *a3 = v18;
          }
          else {
            _HKLogDroppedError();
          }
        }

        id v14 = v24;
        id v11 = v25;
      }
      else
      {
        uint64_t v22 = 1;
      }

      id v9 = v14;
    }
    else
    {
      uint64_t v22 = 1;
    }
  }
  else if (a3)
  {
    id v9 = v9;
    uint64_t v22 = 0;
    *a3 = v9;
  }
  else
  {
    _HKLogDroppedError();
    uint64_t v22 = 0;
  }

  return v22;
}

@end