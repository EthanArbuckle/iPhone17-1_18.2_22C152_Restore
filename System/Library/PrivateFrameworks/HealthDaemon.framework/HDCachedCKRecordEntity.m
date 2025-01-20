@interface HDCachedCKRecordEntity
+ (BOOL)deleteRecordWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordName:(id)a7 profile:(id)a8 error:(id *)a9;
+ (BOOL)enumerateRecordIDAndDataWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordType:(id)a7 recordName:(id)a8 epoch:(int64_t)a9 profile:(id)a10 error:(id *)a11 enumerationHandler:(id)a12;
+ (BOOL)enumerateRecordIDsWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 profile:(id)a7 error:(id *)a8 enumerationHandler:(id)a9;
+ (BOOL)insertOrUpdateWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordData:(id)a7 recordType:(id)a8 recordName:(id)a9 profile:(id)a10 error:(id *)a11;
+ (BOOL)updateWithRecordData:(id)a3 epoch:(int64_t)a4 zoneID:(int64_t)a5 recordName:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_dbEntityWithContainerIdentifier:(uint64_t)a1 databaseScope:(void *)a2 transaction:(uint64_t)a3 error:(void *)a4;
+ (id)_recordZoneEntityWithContainerIdentifier:(uint64_t)a3 databaseScope:(void *)a4 zoneName:(void *)a5 ownerName:(void *)a6 transaction:(uint64_t)a7 error:;
+ (id)_recordZoneEntityWithDbEntity:(void *)a3 zoneName:(void *)a4 ownerName:(void *)a5 transaction:(uint64_t)a6 error:;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)insertWithZoneID:(int64_t)a3 recordType:(id)a4 epoch:(int64_t)a5 recordName:(id)a6 recordData:(id)a7 transaction:(id)a8 error:(id *)a9;
+ (id)recordDataWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordName:(id)a7 profile:(id)a8 error:(id *)a9;
+ (id)uniquedColumns;
+ (int64_t)containsRecordWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordName:(id)a7 profile:(id)a8 error:(id *)a9;
+ (int64_t)containsRecordsWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 profile:(id)a7 error:(id *)a8;
+ (int64_t)protectionClass;
@end

@implementation HDCachedCKRecordEntity

+ (id)databaseTable
{
  return @"ck_record_cache";
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDCKRecordCacheEntityColumnDefinitions;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"zone_id";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"zone_id";
  v4[1] = @"record_name";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)insertWithZoneID:(int64_t)a3 recordType:(id)a4 epoch:(int64_t)a5 recordName:(id)a6 recordData:(id)a7 transaction:(id)a8 error:(id *)a9
{
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  v18 = [a8 databaseForEntityClass:a1];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __100__HDCachedCKRecordEntity_insertWithZoneID_recordType_epoch_recordName_recordData_transaction_error___block_invoke;
  v35[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v35[4] = a1;
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __100__HDCachedCKRecordEntity_insertWithZoneID_recordType_epoch_recordName_recordData_transaction_error___block_invoke_2;
  v29 = &unk_1E63063A8;
  int64_t v33 = a3;
  id v19 = v15;
  id v30 = v19;
  int64_t v34 = a5;
  id v20 = v16;
  id v31 = v20;
  id v21 = v17;
  id v32 = v21;
  v22 = 0;
  if ([v18 executeCachedStatementForKey:&insertWithZoneID_recordType_epoch_recordName_recordData_transaction_error__lookupKey error:a9 SQLGenerator:v35 bindingHandler:&v26 enumerationHandler:0])
  {
    v23 = [HDCachedCKRecordEntity alloc];
    v24 = objc_msgSend(v18, "lastInsertRowID", v26, v27, v28, v29, v30, v31);
    v22 = -[HDSQLiteEntity initWithPersistentID:](v23, "initWithPersistentID:", [v24 longLongValue]);
  }

  return v22;
}

id __100__HDCachedCKRecordEntity_insertWithZoneID_recordType_epoch_recordName_recordData_transaction_error___block_invoke()
{
  v0 = self;
  v1 = NSString;
  v2 = [v0 disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"INSERT INTO %@ (%@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?)", v2, @"zone_id", @"record_type", @"epoch", @"record_name", @"record_data"];

  return v3;
}

uint64_t __100__HDCachedCKRecordEntity_insertWithZoneID_recordType_epoch_recordName_recordData_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 56));
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 3, *(void *)(a1 + 64));
  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)updateWithRecordData:(id)a3 epoch:(int64_t)a4 zoneID:(int64_t)a5 recordName:(id)a6 transaction:(id)a7 error:(id *)a8
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a6;
  id v16 = [a7 databaseForEntityClass:a1];
  id v17 = HDPredicateForZoneIDAndRecordName(a5, v15);

  v24[0] = @"epoch";
  v24[1] = @"record_data";
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __89__HDCachedCKRecordEntity_updateWithRecordData_epoch_zoneID_recordName_transaction_error___block_invoke;
  v21[3] = &unk_1E62F67E8;
  id v22 = v14;
  int64_t v23 = a4;
  id v19 = v14;
  LOBYTE(a8) = [a1 updateProperties:v18 predicate:v17 database:v16 error:a8 bindingHandler:v21];

  return (char)a8;
}

void __89__HDCachedCKRecordEntity_updateWithRecordData_epoch_zoneID_recordName_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"epoch", *(void *)(a1 + 40));

  JUMPOUT(0x1C1879E30);
}

+ (BOOL)insertOrUpdateWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordData:(id)a7 recordType:(id)a8 recordName:(id)a9 profile:(id)a10 error:(id *)a11
{
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  uint64_t v23 = [a10 database];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __144__HDCachedCKRecordEntity_insertOrUpdateWithContainerIdentifier_databaseScope_zoneName_ownerName_recordData_recordType_recordName_profile_error___block_invoke;
  v32[3] = &unk_1E62F40C0;
  id v39 = a1;
  int64_t v40 = a4;
  id v33 = v17;
  id v34 = v18;
  id v35 = v19;
  id v36 = v22;
  id v37 = v21;
  id v38 = v20;
  id v24 = v20;
  id v25 = v21;
  id v26 = v22;
  id v27 = v19;
  id v28 = v18;
  id v29 = v17;
  id v30 = (void *)v23;
  LOBYTE(v23) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v23 error:a11 block:v32];

  return v23;
}

uint64_t __144__HDCachedCKRecordEntity_insertOrUpdateWithContainerIdentifier_databaseScope_zoneName_ownerName_recordData_recordType_recordName_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = +[HDCachedCKRecordEntity _dbEntityWithContainerIdentifier:databaseScope:transaction:error:](*(void *)(a1 + 80), *(void **)(a1 + 32), *(void *)(a1 + 88), v5);
  if (v6)
  {
    id v31 = 0;
    int64_t v7 = +[HDCachedCKDatabaseEntity previousEpochForTransaction:v5 error:&v31];
    id v8 = v31;
    v9 = v8;
    if (v7 < 0)
    {
      id v16 = v8;
      id v10 = v16;
      if (v16)
      {
        if (a3)
        {
          id v10 = v16;
          uint64_t v15 = 0;
          *a3 = v10;
        }
        else
        {
          _HKLogDroppedError();
          uint64_t v15 = 0;
        }
        goto LABEL_32;
      }
    }
    else
    {
      +[HDCachedCKRecordEntity _recordZoneEntityWithDbEntity:zoneName:ownerName:transaction:error:](*(void *)(a1 + 80), v6, *(void **)(a1 + 40), *(void **)(a1 + 48), v5, (uint64_t)a3);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        id v27 = v9;
        v11 = [v5 databaseForEntityClass:*(void *)(a1 + 80)];
        v12 = HDPredicateForZoneIDAndRecordName([v10 persistentID], *(void **)(a1 + 56));
        id v30 = 0;
        v13 = +[HDSQLiteEntity anyInDatabase:v11 predicate:v12 error:&v30];
        id v14 = v30;

        if (!v13 && v14)
        {
          if (a3)
          {
            id v14 = v14;
            uint64_t v15 = 0;
            *a3 = v14;
          }
          else
          {
            _HKLogDroppedError();
            uint64_t v15 = 0;
          }
          v9 = v27;
          goto LABEL_31;
        }
        int64_t v17 = v7 + 1;
        if (v13)
        {
          uint64_t v18 = *(void *)(a1 + 72);
          uint64_t v19 = [v10 persistentID];
          uint64_t v20 = *(void *)(a1 + 56);
          id v28 = v14;
          LOBYTE(v18) = +[HDCachedCKRecordEntity updateWithRecordData:v18 epoch:v17 zoneID:v19 recordName:v20 transaction:v5 error:&v28];
          id v21 = v28;

          if ((v18 & 1) == 0)
          {
            id v14 = v21;
            uint64_t v15 = v14 == 0;
            v9 = v27;
            if (v14)
            {
              if (a3) {
                *a3 = v14;
              }
              else {
                _HKLogDroppedError();
              }
            }

            goto LABEL_31;
          }
          v9 = v27;
        }
        else
        {
          uint64_t v22 = [v10 persistentID];
          uint64_t v24 = *(void *)(a1 + 56);
          uint64_t v23 = *(void *)(a1 + 64);
          uint64_t v25 = *(void *)(a1 + 72);
          id v29 = v14;
          v13 = +[HDCachedCKRecordEntity insertWithZoneID:v22 recordType:v23 epoch:v17 recordName:v24 recordData:v25 transaction:v5 error:&v29];
          id v21 = v29;

          v9 = v27;
          if (!v13 && v21)
          {
            if (a3)
            {
              id v14 = v21;
              uint64_t v15 = 0;
              *a3 = v14;
LABEL_31:

              goto LABEL_32;
            }
            _HKLogDroppedError();
            uint64_t v15 = 0;
LABEL_24:
            id v14 = v21;
            goto LABEL_31;
          }
        }
        uint64_t v15 = [v6 setCurrentEpoch:v17 transaction:v5 error:a3];

        goto LABEL_24;
      }
    }
    uint64_t v15 = 1;
LABEL_32:

    goto LABEL_33;
  }
  uint64_t v15 = 1;
LABEL_33:

  return v15;
}

+ (id)_dbEntityWithContainerIdentifier:(uint64_t)a1 databaseScope:(void *)a2 transaction:(uint64_t)a3 error:(void *)a4
{
  id v6 = a4;
  id v7 = a2;
  uint64_t v8 = self;
  v9 = HDPredicateForContainerIdentifierAndDatabaseScope((uint64_t)v7, a3);

  id v10 = [v6 databaseForEntityClass:v8];

  uint64_t v13 = 0;
  v11 = +[HDSQLiteEntity anyInDatabase:v10 predicate:v9 error:&v13];

  return v11;
}

+ (id)_recordZoneEntityWithDbEntity:(void *)a3 zoneName:(void *)a4 ownerName:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  uint64_t v14 = self;
  uint64_t v15 = [v13 persistentID];

  id v16 = HDPredicateForDatabaseIDAndRecordZone(v15, v12, v11);

  int64_t v17 = [v10 databaseForEntityClass:v14];

  uint64_t v18 = +[HDSQLiteEntity anyInDatabase:v17 predicate:v16 error:a6];

  return v18;
}

+ (BOOL)enumerateRecordIDsWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 profile:(id)a7 error:(id *)a8 enumerationHandler:(id)a9
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  uint64_t v18 = (objc_class *)MEMORY[0x1E4F1A320];
  id v19 = a7;
  uint64_t v20 = (void *)[[v18 alloc] initWithZoneName:v15 ownerName:v16];
  id v21 = [v19 database];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __134__HDCachedCKRecordEntity_enumerateRecordIDsWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error_enumerationHandler___block_invoke;
  v29[3] = &unk_1E63063D0;
  id v35 = a1;
  int64_t v36 = a4;
  id v30 = v14;
  id v31 = v15;
  id v33 = v20;
  id v34 = v17;
  id v32 = v16;
  id v22 = v20;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  id v26 = v14;
  LOBYTE(v14) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v21 error:a8 block:v29];

  return (char)v14;
}

uint64_t __134__HDCachedCKRecordEntity_enumerateRecordIDsWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[HDCachedCKRecordEntity _recordZoneEntityWithContainerIdentifier:databaseScope:zoneName:ownerName:transaction:error:](*(void *)(a1 + 72), *(void **)(a1 + 32), *(void *)(a1 + 80), *(void **)(a1 + 40), *(void **)(a1 + 48), v5, a3);
  if (v6)
  {
    id v7 = [v5 databaseForEntityClass:*(void *)(a1 + 72)];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __134__HDCachedCKRecordEntity_enumerateRecordIDsWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error_enumerationHandler___block_invoke_2;
    v15[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v15[4] = *(void *)(a1 + 72);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __134__HDCachedCKRecordEntity_enumerateRecordIDsWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error_enumerationHandler___block_invoke_3;
    v13[3] = &unk_1E62F43C8;
    id v14 = v6;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __134__HDCachedCKRecordEntity_enumerateRecordIDsWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error_enumerationHandler___block_invoke_4;
    v10[3] = &unk_1E62FB888;
    id v12 = *(id *)(a1 + 64);
    id v11 = *(id *)(a1 + 56);
    uint64_t v8 = [v7 executeCachedStatementForKey:&HDCachedCKRecordEntityRecordData_block_invoke_fetchKey error:a3 SQLGenerator:v15 bindingHandler:v13 enumerationHandler:v10];
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

+ (id)_recordZoneEntityWithContainerIdentifier:(uint64_t)a3 databaseScope:(void *)a4 zoneName:(void *)a5 ownerName:(void *)a6 transaction:(uint64_t)a7 error:
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a2;
  uint64_t v16 = self;
  id v17 = +[HDCachedCKRecordEntity _dbEntityWithContainerIdentifier:databaseScope:transaction:error:](v16, v15, a3, v14);

  if (v17)
  {
    uint64_t v18 = +[HDCachedCKRecordEntity _recordZoneEntityWithDbEntity:zoneName:ownerName:transaction:error:](v16, v17, v12, v13, v14, a7);
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

id __134__HDCachedCKRecordEntity_enumerateRecordIDsWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error_enumerationHandler___block_invoke_2(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ = ?", @"record_name", v2, @"zone_id"];

  return v3;
}

uint64_t __134__HDCachedCKRecordEntity_enumerateRecordIDsWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error_enumerationHandler___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) persistentID];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __134__HDCachedCKRecordEntity_enumerateRecordIDsWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error_enumerationHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  id v7 = HDSQLiteColumnWithNameAsString();
  uint64_t v8 = (void *)[v6 initWithRecordName:v7 zoneID:*(void *)(a1 + 32)];
  uint64_t v9 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v8, a3);

  return v9;
}

+ (BOOL)enumerateRecordIDAndDataWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordType:(id)a7 recordName:(id)a8 epoch:(int64_t)a9 profile:(id)a10 error:(id *)a11 enumerationHandler:(id)a12
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a12;
  id v22 = (objc_class *)MEMORY[0x1E4F1A320];
  id v23 = a10;
  id v24 = (void *)[[v22 alloc] initWithZoneName:v17 ownerName:v18];
  id v25 = [v23 database];

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __168__HDCachedCKRecordEntity_enumerateRecordIDAndDataWithContainerIdentifier_databaseScope_zoneName_ownerName_recordType_recordName_epoch_profile_error_enumerationHandler___block_invoke;
  v36[3] = &unk_1E6306420;
  id v37 = v16;
  id v38 = v17;
  int64_t v45 = a4;
  int64_t v46 = a9;
  id v39 = v18;
  id v40 = v19;
  id v43 = v21;
  id v44 = a1;
  id v41 = v20;
  id v42 = v24;
  id v26 = v24;
  id v27 = v21;
  id v28 = v20;
  id v29 = v19;
  id v30 = v18;
  id v31 = v17;
  id v32 = v16;
  LOBYTE(v21) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v25 error:a11 block:v36];

  return (char)v21;
}

uint64_t __168__HDCachedCKRecordEntity_enumerateRecordIDAndDataWithContainerIdentifier_databaseScope_zoneName_ownerName_recordType_recordName_epoch_profile_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = +[HDCachedCKRecordEntity _recordZoneEntityWithContainerIdentifier:databaseScope:zoneName:ownerName:transaction:error:](*(void *)(a1 + 88), *(void **)(a1 + 32), *(void *)(a1 + 96), *(void **)(a1 + 40), *(void **)(a1 + 48), v5, a3);
  if (v6)
  {
    uint64_t v7 = HDPredicateForRecordsSinceEpoch(*(void *)(a1 + 104));
    uint64_t v8 = HDPredicateForZoneIDAndRecordType([v6 persistentID], *(void **)(a1 + 56));
    uint64_t v9 = (void *)MEMORY[0x1E4F65D08];
    id v25 = (void *)v8;
    id v26 = (void *)v7;
    v33[0] = v8;
    v33[1] = v7;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    id v11 = [v9 predicateMatchingAllPredicates:v10];

    if (*(void *)(a1 + 64))
    {
      id v12 = HDPredicateForZoneIDAndRecordName([v6 persistentID], *(void **)(a1 + 64));
      id v13 = (void *)MEMORY[0x1E4F65D08];
      v32[0] = v11;
      v32[1] = v12;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
      uint64_t v15 = [v13 predicateMatchingAllPredicates:v14];

      id v11 = (void *)v15;
    }
    id v16 = *(void **)(a1 + 88);
    id v17 = objc_msgSend(v5, "databaseForEntityClass:", v16, a3);
    id v18 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"epoch" entityClass:*(void *)(a1 + 88) ascending:1];
    id v31 = v18;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    id v20 = [v16 queryWithDatabase:v17 predicate:v11 limit:0 orderingTerms:v19 groupBy:0];

    v30[0] = *MEMORY[0x1E4F65C70];
    v30[1] = @"epoch";
    v30[2] = @"record_name";
    v30[3] = @"record_data";
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __168__HDCachedCKRecordEntity_enumerateRecordIDAndDataWithContainerIdentifier_databaseScope_zoneName_ownerName_recordType_recordName_epoch_profile_error_enumerationHandler___block_invoke_2;
    v27[3] = &unk_1E63063F8;
    id v29 = *(id *)(a1 + 80);
    id v28 = *(id *)(a1 + 72);
    uint64_t v22 = [v20 enumerateProperties:v21 error:v24 enumerationHandler:v27];
  }
  else
  {
    uint64_t v22 = 1;
  }

  return v22;
}

uint64_t __168__HDCachedCKRecordEntity_enumerateRecordIDAndDataWithContainerIdentifier_databaseScope_zoneName_ownerName_recordType_recordName_epoch_profile_error_enumerationHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = [(HDSQLiteEntity *)[HDCachedCKRecordEntity alloc] initWithPersistentID:HDSQLiteColumnWithNameAsInt64()];
  id v8 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  uint64_t v9 = HDSQLiteColumnWithNameAsString();
  id v10 = (void *)[v8 initWithRecordName:v9 zoneID:*(void *)(a1 + 32)];
  id v11 = HDSQLiteColumnWithNameAsData();
  uint64_t v12 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v13 = (*(uint64_t (**)(uint64_t, HDCachedCKRecordEntity *, void *, void *, uint64_t, uint64_t))(v6 + 16))(v6, v7, v10, v11, v12, a4);

  return v13;
}

+ (int64_t)containsRecordsWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 profile:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__144;
  id v35 = __Block_byref_object_dispose__144;
  id v36 = 0;
  id v18 = [v17 database];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __112__HDCachedCKRecordEntity_containsRecordsWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke;
  void v24[3] = &unk_1E62F4110;
  id v29 = a1;
  id v19 = v14;
  id v25 = v19;
  int64_t v30 = a4;
  id v20 = v15;
  id v26 = v20;
  id v21 = v16;
  id v27 = v21;
  id v28 = &v31;
  LODWORD(a8) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v18 error:a8 block:v24];

  if (a8)
  {
    if (v32[5]) {
      int64_t v22 = 1;
    }
    else {
      int64_t v22 = 2;
    }
  }
  else
  {
    int64_t v22 = 0;
  }

  _Block_object_dispose(&v31, 8);
  return v22;
}

uint64_t __112__HDCachedCKRecordEntity_containsRecordsWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = +[HDCachedCKRecordEntity _recordZoneEntityWithContainerIdentifier:databaseScope:zoneName:ownerName:transaction:error:](*(void *)(a1 + 64), *(void **)(a1 + 32), *(void *)(a1 + 72), *(void **)(a1 + 40), *(void **)(a1 + 48), v5, (uint64_t)a3);
  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 64);
    id v8 = [v5 databaseForEntityClass:v7];
    uint64_t v9 = HDPredicateForZoneID([v6 persistentID]);
    id v17 = 0;
    uint64_t v10 = [v7 anyInDatabase:v8 predicate:v9 error:&v17];
    id v11 = v17;
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v10;

    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v11 == 0;
    }
    uint64_t v15 = v14;
    if (!v14)
    {
      if (a3) {
        *a3 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  else
  {
    uint64_t v15 = 1;
  }

  return v15;
}

+ (int64_t)containsRecordWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordName:(id)a7 profile:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__144;
  id v39 = __Block_byref_object_dispose__144;
  id v40 = 0;
  id v26 = a8;
  id v19 = [v26 database];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __122__HDCachedCKRecordEntity_containsRecordWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke;
  v27[3] = &unk_1E6306448;
  id v33 = a1;
  id v20 = v15;
  id v28 = v20;
  int64_t v34 = a4;
  id v21 = v16;
  id v29 = v21;
  id v22 = v17;
  id v30 = v22;
  id v32 = &v35;
  id v23 = v18;
  id v31 = v23;
  LODWORD(v16) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v19 error:a9 block:v27];

  if (v16)
  {
    if (v36[5]) {
      int64_t v24 = 1;
    }
    else {
      int64_t v24 = 2;
    }
  }
  else
  {
    int64_t v24 = 0;
  }

  _Block_object_dispose(&v35, 8);
  return v24;
}

uint64_t __122__HDCachedCKRecordEntity_containsRecordWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = +[HDCachedCKRecordEntity _recordZoneEntityWithContainerIdentifier:databaseScope:zoneName:ownerName:transaction:error:](*(void *)(a1 + 72), *(void **)(a1 + 32), *(void *)(a1 + 80), *(void **)(a1 + 40), *(void **)(a1 + 48), v5, (uint64_t)a3);
  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 72);
    id v8 = [v5 databaseForEntityClass:v7];
    uint64_t v9 = HDPredicateForZoneIDAndRecordName([v6 persistentID], *(void **)(a1 + 56));
    id v17 = 0;
    uint64_t v10 = [v7 anyInDatabase:v8 predicate:v9 error:&v17];
    id v11 = v17;
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v10;

    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v11 == 0;
    }
    uint64_t v15 = v14;
    if (!v14)
    {
      if (a3) {
        *a3 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  else
  {
    uint64_t v15 = 1;
  }

  return v15;
}

+ (id)recordDataWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordName:(id)a7 profile:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__144;
  id v41 = __Block_byref_object_dispose__144;
  id v42 = 0;
  id v20 = [v19 database];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __118__HDCachedCKRecordEntity_recordDataWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke;
  v29[3] = &unk_1E6306448;
  id v35 = a1;
  id v21 = v15;
  id v30 = v21;
  int64_t v36 = a4;
  id v22 = v16;
  id v31 = v22;
  id v23 = v17;
  id v32 = v23;
  int64_t v34 = &v37;
  id v24 = v18;
  id v33 = v24;
  BOOL v25 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v20 error:a9 block:v29];

  if (v25) {
    id v26 = (void *)v38[5];
  }
  else {
    id v26 = 0;
  }
  id v27 = v26;

  _Block_object_dispose(&v37, 8);

  return v27;
}

uint64_t __118__HDCachedCKRecordEntity_recordDataWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = +[HDCachedCKRecordEntity _recordZoneEntityWithContainerIdentifier:databaseScope:zoneName:ownerName:transaction:error:](*(void *)(a1 + 72), *(void **)(a1 + 32), *(void *)(a1 + 80), *(void **)(a1 + 40), *(void **)(a1 + 48), v5, (uint64_t)a3);
  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 72);
    id v8 = [v5 databaseForEntityClass:v7];
    uint64_t v9 = HDPredicateForZoneIDAndRecordName([v6 persistentID], *(void **)(a1 + 56));
    id v17 = 0;
    uint64_t v10 = [v7 propertyValueForAnyInDatabase:v8 property:@"record_data" predicate:v9 error:&v17];
    id v11 = v17;
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v10;

    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v11 == 0;
    }
    uint64_t v15 = v14;
    if (!v14)
    {
      if (a3) {
        *a3 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  else
  {
    uint64_t v15 = 1;
  }

  return v15;
}

+ (BOOL)deleteRecordWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordName:(id)a7 profile:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = [a8 database];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __120__HDCachedCKRecordEntity_deleteRecordWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke;
  v26[3] = &unk_1E6306470;
  id v31 = a1;
  int64_t v32 = a4;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  id v30 = v18;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  BOOL v24 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v19 error:a9 block:v26];

  return v24;
}

uint64_t __120__HDCachedCKRecordEntity_deleteRecordWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = +[HDCachedCKRecordEntity _recordZoneEntityWithContainerIdentifier:databaseScope:zoneName:ownerName:transaction:error:](*(void *)(a1 + 64), *(void **)(a1 + 32), *(void *)(a1 + 72), *(void **)(a1 + 40), *(void **)(a1 + 48), v5, (uint64_t)a3);
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = HDPredicateForZoneIDAndRecordName([v6 persistentID], *(void **)(a1 + 56));
    uint64_t v9 = [v5 databaseForEntityClass:*(void *)(a1 + 64)];
    id v18 = 0;
    uint64_t v10 = +[HDSQLiteEntity anyInDatabase:v9 predicate:v8 error:&v18];
    id v11 = v18;

    if (v10) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v11 == 0;
    }
    if (v12)
    {
      uint64_t v13 = *(void **)(a1 + 64);
      BOOL v14 = [v5 databaseForEntityClass:v13];
      v17.receiver = v13;
      v17.super_class = (Class)&OBJC_METACLASS___HDCachedCKRecordEntity;
      uint64_t v15 = (uint64_t)objc_msgSendSuper2(&v17, sel_deleteEntitiesInDatabase_predicate_error_, v14, v8, a3);
    }
    else if (a3)
    {
      uint64_t v15 = 0;
      *a3 = v11;
    }
    else
    {
      _HKLogDroppedError();
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 1;
  }

  return v15;
}

@end