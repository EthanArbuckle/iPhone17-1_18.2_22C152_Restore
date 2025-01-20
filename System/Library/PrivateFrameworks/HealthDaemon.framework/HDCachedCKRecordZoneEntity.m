@interface HDCachedCKRecordZoneEntity
+ (BOOL)deleteZoneWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 profile:(id)a7 error:(id *)a8;
+ (BOOL)enumerateCKRecordZoneIDsWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 profile:(id)a5 error:(id *)a6 enumerationHandler:(id)a7;
+ (BOOL)insertIfDoesNotExistWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 userRecordName:(id)a7 serverChangeToken:(id)a8 profile:(id)a9 error:(id *)a10;
+ (BOOL)insertOrUpdateWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 userRecordName:(id)a7 serverChangeToken:(id)a8 fetchComplete:(id)a9 profile:(id)a10 error:(id *)a11;
+ (BOOL)setRequiresFetch:(BOOL)a3 containerIdentifier:(id)a4 databaseScope:(int64_t)a5 zoneName:(id)a6 ownerName:(id)a7 transaction:(id)a8 error:(id *)a9;
+ (BOOL)setZoneEntityState:(int64_t)a3 containerIdentifier:(id)a4 databaseScope:(int64_t)a5 zoneName:(id)a6 ownerName:(id)a7 profile:(id)a8 error:(id *)a9;
+ (BOOL)updateServerChangeToken:(id)a3 databaseID:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)insertWithDatabaseID:(int64_t)a3 zoneName:(id)a4 ownerName:(id)a5 serverChangeToken:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (id)serverChangeTokenForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 profile:(id)a7 error:(id *)a8;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
+ (int64_t)requiresFetchForZoneWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 transaction:(id)a7 error:(id *)a8;
@end

@implementation HDCachedCKRecordZoneEntity

+ (id)databaseTable
{
  return @"ck_record_zone_cache";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 7;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDCKRecordZoneCacheEntityColumnDefinitions;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"database_id";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)uniquedColumns
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"database_id";
  v4[1] = @"zone_name";
  v4[2] = @"owner_name";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

+ (id)insertWithDatabaseID:(int64_t)a3 zoneName:(id)a4 ownerName:(id)a5 serverChangeToken:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v16)
  {
    v18 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v16 requiringSecureCoding:1 error:a8];
    if (!v18)
    {
      v19 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    v18 = 0;
  }
  v20 = [v17 databaseForEntityClass:a1];
  int64_t v30 = a3;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __106__HDCachedCKRecordZoneEntity_insertWithDatabaseID_zoneName_ownerName_serverChangeToken_transaction_error___block_invoke;
  v31[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v31[4] = a1;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __106__HDCachedCKRecordZoneEntity_insertWithDatabaseID_zoneName_ownerName_serverChangeToken_transaction_error___block_invoke_2;
  v26[3] = &unk_1E62F4098;
  id v27 = v14;
  id v28 = v15;
  id v21 = v18;
  id v29 = v21;
  int v22 = [v20 executeCachedStatementForKey:&insertWithDatabaseID_zoneName_ownerName_serverChangeToken_transaction_error__lookupKey error:a8 SQLGenerator:v31 bindingHandler:v26 enumerationHandler:0];
  v19 = 0;
  if (v22)
  {
    v23 = [HDCachedCKRecordZoneEntity alloc];
    v24 = [v20 lastInsertRowID];
    v19 = -[HDSQLiteEntity initWithPersistentID:](v23, "initWithPersistentID:", [v24 longLongValue]);
  }
LABEL_8:

  return v19;
}

id __106__HDCachedCKRecordZoneEntity_insertWithDatabaseID_zoneName_ownerName_serverChangeToken_transaction_error___block_invoke()
{
  v0 = self;
  v1 = NSString;
  v2 = [v0 disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"INSERT INTO %@ (%@, %@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?, ?)", v2, @"database_id", @"zone_name", @"owner_name", @"server_change_token", @"needs_fetch", @"zone_state"];

  return v3;
}

uint64_t __106__HDCachedCKRecordZoneEntity_insertWithDatabaseID_zoneName_ownerName_serverChangeToken_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 56));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();

  return sqlite3_bind_int64(a2, 6, 0);
}

+ (BOOL)updateServerChangeToken:(id)a3 databaseID:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 transaction:(id)a7 error:(id *)a8
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v14)
  {
    v18 = 0;
    goto LABEL_5;
  }
  v18 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v14 requiringSecureCoding:1 error:a8];
  if (v18)
  {
LABEL_5:
    v20 = [v17 databaseForEntityClass:a1];
    id v21 = HDPredicateForDatabaseIDAndRecordZone(a4, v15, v16);
    v27[0] = @"server_change_token";
    int v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __102__HDCachedCKRecordZoneEntity_updateServerChangeToken_databaseID_zoneName_ownerName_transaction_error___block_invoke;
    v25[3] = &unk_1E62F35C8;
    id v26 = v18;
    id v23 = v18;
    char v19 = [a1 updateProperties:v22 predicate:v21 database:v20 error:a8 bindingHandler:v25];

    goto LABEL_6;
  }
  char v19 = 0;
LABEL_6:

  return v19;
}

void __102__HDCachedCKRecordZoneEntity_updateServerChangeToken_databaseID_zoneName_ownerName_transaction_error___block_invoke()
{
}

+ (BOOL)insertOrUpdateWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 userRecordName:(id)a7 serverChangeToken:(id)a8 fetchComplete:(id)a9 profile:(id)a10 error:(id *)a11
{
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = [a10 database];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __162__HDCachedCKRecordZoneEntity_insertOrUpdateWithContainerIdentifier_databaseScope_zoneName_ownerName_userRecordName_serverChangeToken_fetchComplete_profile_error___block_invoke;
  v31[3] = &unk_1E62F40C0;
  id v32 = v17;
  id v33 = v20;
  id v34 = v18;
  id v35 = v19;
  int64_t v38 = a4;
  id v39 = a1;
  id v36 = v21;
  id v37 = v22;
  id v24 = v22;
  id v25 = v21;
  id v26 = v19;
  id v27 = v18;
  id v28 = v20;
  id v29 = v17;
  LOBYTE(v21) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v23 error:a11 block:v31];

  return (char)v21;
}

BOOL __162__HDCachedCKRecordZoneEntity_insertOrUpdateWithContainerIdentifier_databaseScope_zoneName_ownerName_userRecordName_serverChangeToken_fetchComplete_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = +[HDCachedCKDatabaseEntity entityForContainerIdentifier:*(void *)(a1 + 32) databaseScope:*(void *)(a1 + 80) userRecordName:*(void *)(a1 + 40) transaction:v5 shouldCreate:1 error:a3];
  v7 = v6;
  if (v6)
  {
    v8 = HDPredicateForDatabaseIDAndRecordZone([v6 persistentID], *(void **)(a1 + 48), *(void **)(a1 + 56));
    v9 = [v5 databaseForEntityClass:*(void *)(a1 + 88)];
    id v23 = 0;
    v10 = +[HDSQLiteEntity anyInDatabase:v9 predicate:v8 error:&v23];
    id v11 = v23;

    if (v10) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v11 == 0;
    }
    if (!v12)
    {
      if (a3)
      {
        id v14 = v11;
LABEL_13:
        id v11 = v14;
        v10 = 0;
        BOOL v13 = 0;
        *a3 = v11;
LABEL_25:

        goto LABEL_26;
      }
      _HKLogDroppedError();
      v10 = 0;
LABEL_19:
      BOOL v13 = 0;
      goto LABEL_25;
    }
    if (v10)
    {
      if (!+[HDCachedCKRecordZoneEntity updateServerChangeToken:databaseID:zoneName:ownerName:transaction:error:](HDCachedCKRecordZoneEntity, "updateServerChangeToken:databaseID:zoneName:ownerName:transaction:error:", *(void *)(a1 + 64), [v7 persistentID], *(void *)(a1 + 48), *(void *)(a1 + 56), v5, a3))goto LABEL_19; {
    }
      }
    else
    {
      uint64_t v15 = [v7 persistentID];
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v17 = *(void *)(a1 + 56);
      uint64_t v18 = *(void *)(a1 + 64);
      id v22 = v11;
      v10 = +[HDCachedCKRecordZoneEntity insertWithDatabaseID:v15 zoneName:v16 ownerName:v17 serverChangeToken:v18 transaction:v5 error:&v22];
      id v19 = v22;

      if (!v10 && v19)
      {
        if (!a3)
        {
          _HKLogDroppedError();
          v10 = 0;
          BOOL v13 = 0;
          id v11 = v19;
          goto LABEL_25;
        }
        id v14 = v19;
        goto LABEL_13;
      }
      id v11 = v19;
    }
    id v20 = *(void **)(a1 + 72);
    if (v20) {
      BOOL v13 = +[HDCachedCKRecordZoneEntity setRequiresFetch:containerIdentifier:databaseScope:zoneName:ownerName:transaction:error:](HDCachedCKRecordZoneEntity, "setRequiresFetch:containerIdentifier:databaseScope:zoneName:ownerName:transaction:error:", [v20 BOOLValue] ^ 1, *(void *)(a1 + 32), *(void *)(a1 + 80), *(void *)(a1 + 48), *(void *)(a1 + 56), v5, a3);
    }
    else {
      BOOL v13 = 1;
    }
    goto LABEL_25;
  }
  BOOL v13 = 0;
LABEL_26:

  return v13;
}

+ (BOOL)insertIfDoesNotExistWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 userRecordName:(id)a7 serverChangeToken:(id)a8 profile:(id)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = [a9 database];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __154__HDCachedCKRecordZoneEntity_insertIfDoesNotExistWithContainerIdentifier_databaseScope_zoneName_ownerName_userRecordName_serverChangeToken_profile_error___block_invoke;
  v29[3] = &unk_1E62F40E8;
  id v30 = v16;
  id v31 = v19;
  id v32 = v17;
  id v33 = v18;
  int64_t v35 = a4;
  id v36 = a1;
  id v34 = v20;
  id v22 = v20;
  id v23 = v18;
  id v24 = v17;
  id v25 = v19;
  id v26 = v16;
  BOOL v27 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v21 error:a10 block:v29];

  return v27;
}

uint64_t __154__HDCachedCKRecordZoneEntity_insertIfDoesNotExistWithContainerIdentifier_databaseScope_zoneName_ownerName_userRecordName_serverChangeToken_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = +[HDCachedCKDatabaseEntity entityForContainerIdentifier:*(void *)(a1 + 32) databaseScope:*(void *)(a1 + 72) userRecordName:*(void *)(a1 + 40) transaction:v5 shouldCreate:1 error:a3];
  v7 = v6;
  if (v6)
  {
    v8 = HDPredicateForDatabaseIDAndRecordZone([v6 persistentID], *(void **)(a1 + 48), *(void **)(a1 + 56));
    v9 = [v5 databaseForEntityClass:*(void *)(a1 + 80)];
    id v22 = 0;
    v10 = +[HDSQLiteEntity anyInDatabase:v9 predicate:v8 error:&v22];
    id v11 = v22;

    if (v10) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v11 == 0;
    }
    if (!v12)
    {
      if (!a3)
      {
        _HKLogDroppedError();
        uint64_t v13 = 0;
        v10 = 0;
        goto LABEL_20;
      }
      id v14 = v11;
      goto LABEL_12;
    }
    if (v10)
    {
      uint64_t v13 = 1;
LABEL_20:

      goto LABEL_21;
    }
    uint64_t v15 = [v7 persistentID];
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v18 = *(void *)(a1 + 64);
    id v21 = v11;
    v10 = +[HDCachedCKRecordZoneEntity insertWithDatabaseID:v15 zoneName:v16 ownerName:v17 serverChangeToken:v18 transaction:v5 error:&v21];
    id v19 = v21;

    uint64_t v13 = 1;
    if (!v10 && v19)
    {
      if (a3)
      {
        id v14 = v19;
LABEL_12:
        id v11 = v14;
        uint64_t v13 = 0;
        v10 = 0;
        *a3 = v11;
        goto LABEL_20;
      }
      _HKLogDroppedError();
      uint64_t v13 = 0;
      v10 = 0;
    }
    id v11 = v19;
    goto LABEL_20;
  }
  uint64_t v13 = 0;
LABEL_21:

  return v13;
}

+ (id)serverChangeTokenForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 profile:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  int64_t v35 = __Block_byref_object_copy__8;
  id v36 = __Block_byref_object_dispose__8;
  id v37 = 0;
  uint64_t v18 = [v17 database];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __117__HDCachedCKRecordZoneEntity_serverChangeTokenForContainerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke;
  v25[3] = &unk_1E62F4110;
  id v19 = v14;
  id v26 = v19;
  int64_t v30 = a4;
  id v31 = a1;
  id v20 = v15;
  id v27 = v20;
  id v21 = v16;
  id v28 = v21;
  id v29 = &v32;
  LODWORD(a8) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v18 error:a8 block:v25];

  if (a8) {
    id v22 = (void *)v33[5];
  }
  else {
    id v22 = 0;
  }
  id v23 = v22;

  _Block_object_dispose(&v32, 8);

  return v23;
}

uint64_t __117__HDCachedCKRecordZoneEntity_serverChangeTokenForContainerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 64);
  id v24 = 0;
  v8 = +[HDCachedCKDatabaseEntity entityForContainerIdentifier:v6 databaseScope:v7 userRecordName:0 transaction:v5 shouldCreate:0 error:&v24];
  id v9 = v24;
  v10 = v9;
  if (v8) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (v11)
  {
    if (v8)
    {
      BOOL v12 = *(void **)(a1 + 72);
      uint64_t v13 = [v5 databaseForEntityClass:v12];
      id v14 = HDPredicateForDatabaseIDAndRecordZone([v8 persistentID], *(void **)(a1 + 40), *(void **)(a1 + 48));
      id v23 = 0;
      id v15 = [v12 propertyValueForAnyInDatabase:v13 property:@"server_change_token" predicate:v14 error:&v23];
      id v16 = v23;

      if (v15) {
        BOOL v17 = 1;
      }
      else {
        BOOL v17 = v16 == 0;
      }
      uint64_t v18 = v17;
      if (v17)
      {
        if (v15)
        {
          uint64_t v19 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v15 error:a3];
          uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
          id v21 = *(void **)(v20 + 40);
          *(void *)(v20 + 40) = v19;
        }
      }
      else if (a3)
      {
        *a3 = v16;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
    else
    {
      uint64_t v18 = 1;
    }
  }
  else if (a3)
  {
    uint64_t v18 = 0;
    *a3 = v9;
  }
  else
  {
    _HKLogDroppedError();
    uint64_t v18 = 0;
  }

  return v18;
}

+ (BOOL)enumerateCKRecordZoneIDsWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 profile:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = [a5 database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __125__HDCachedCKRecordZoneEntity_enumerateCKRecordZoneIDsWithContainerIdentifier_databaseScope_profile_error_enumerationHandler___block_invoke;
  v18[3] = &unk_1E62F4160;
  int64_t v21 = a4;
  id v22 = a1;
  id v19 = v12;
  id v20 = v13;
  id v15 = v13;
  id v16 = v12;
  LOBYTE(a6) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v14 error:a6 block:v18];

  return (char)a6;
}

uint64_t __125__HDCachedCKRecordZoneEntity_enumerateCKRecordZoneIDsWithContainerIdentifier_databaseScope_profile_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v22[4] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  id v21 = 0;
  v8 = +[HDCachedCKDatabaseEntity entityForContainerIdentifier:v6 databaseScope:v7 userRecordName:0 transaction:v5 shouldCreate:0 error:&v21];
  id v9 = v21;
  v10 = v9;
  if (v8) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (v11)
  {
    if (v8)
    {
      id v12 = *(void **)(a1 + 56);
      id v13 = [v5 databaseForEntityClass:v12];
      id v14 = HDPredicateForDatabaseID([v8 persistentID]);
      id v15 = [v12 queryWithDatabase:v13 predicate:v14];

      v22[0] = @"zone_name";
      v22[1] = @"owner_name";
      v22[2] = @"needs_fetch";
      v22[3] = @"zone_state";
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __125__HDCachedCKRecordZoneEntity_enumerateCKRecordZoneIDsWithContainerIdentifier_databaseScope_profile_error_enumerationHandler___block_invoke_2;
      v19[3] = &unk_1E62F4138;
      id v20 = *(id *)(a1 + 40);
      uint64_t v17 = [v15 enumerateProperties:v16 error:a3 enumerationHandler:v19];
    }
    else
    {
      uint64_t v17 = 1;
    }
  }
  else if (a3)
  {
    uint64_t v17 = 0;
    *a3 = v9;
  }
  else
  {
    _HKLogDroppedError();
    uint64_t v17 = 0;
  }

  return v17;
}

uint64_t __125__HDCachedCKRecordZoneEntity_enumerateCKRecordZoneIDsWithContainerIdentifier_databaseScope_profile_error_enumerationHandler___block_invoke_2(uint64_t a1)
{
  v2 = HDSQLiteColumnWithNameAsString();
  v3 = HDSQLiteColumnWithNameAsString();
  HDSQLiteColumnWithNameAsBoolean();
  HDSQLiteColumnWithNameAsInt64();
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:v2 ownerName:v3];
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v5;
}

+ (BOOL)deleteZoneWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 profile:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = [a7 database];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __111__HDCachedCKRecordZoneEntity_deleteZoneWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke;
  v22[3] = &unk_1E62F4188;
  id v23 = v14;
  id v24 = v15;
  id v25 = v16;
  int64_t v26 = a4;
  id v27 = a1;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  LOBYTE(a8) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v17 error:a8 block:v22];

  return (char)a8;
}

uint64_t __111__HDCachedCKRecordZoneEntity_deleteZoneWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 56);
  id v23 = 0;
  v8 = +[HDCachedCKDatabaseEntity entityForContainerIdentifier:v6 databaseScope:v7 userRecordName:0 transaction:v5 shouldCreate:0 error:&v23];
  id v9 = v23;
  v10 = v9;
  if (v8) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (v11)
  {
    if (v8)
    {
      id v12 = HDPredicateForDatabaseIDAndRecordZone([v8 persistentID], *(void **)(a1 + 40), *(void **)(a1 + 48));
      id v13 = [v5 databaseForEntityClass:*(void *)(a1 + 64)];
      id v22 = 0;
      id v14 = +[HDSQLiteEntity anyInDatabase:v13 predicate:v12 error:&v22];
      id v15 = v22;

      if (v14) {
        BOOL v16 = 1;
      }
      else {
        BOOL v16 = v15 == 0;
      }
      if (v16)
      {
        uint64_t v17 = *(void **)(a1 + 64);
        id v18 = [v5 databaseForEntityClass:v17];
        v21.receiver = v17;
        v21.super_class = (Class)&OBJC_METACLASS___HDCachedCKRecordZoneEntity;
        uint64_t v19 = (uint64_t)objc_msgSendSuper2(&v21, sel_deleteEntitiesInDatabase_predicate_error_, v18, v12, a3);
      }
      else if (a3)
      {
        uint64_t v19 = 0;
        *a3 = v15;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v19 = 0;
      }
    }
    else
    {
      uint64_t v19 = 1;
    }
  }
  else if (a3)
  {
    uint64_t v19 = 0;
    *a3 = v9;
  }
  else
  {
    _HKLogDroppedError();
    uint64_t v19 = 0;
  }

  return v19;
}

+ (int64_t)requiresFetchForZoneWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v36[0] = 0;
  id v18 = +[HDCachedCKDatabaseEntity entityForContainerIdentifier:v14 databaseScope:a4 userRecordName:0 transaction:v17 shouldCreate:0 error:v36];
  id v19 = v36[0];
  id v20 = v19;
  if (v18) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = v19 == 0;
  }
  if (v21)
  {
    if (v18)
    {
      uint64_t v32 = 0;
      id v33 = &v32;
      uint64_t v34 = 0x2020000000;
      char v35 = 0;
      id v22 = [v17 databaseForEntityClass:a1];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __125__HDCachedCKRecordZoneEntity_requiresFetchForZoneWithContainerIdentifier_databaseScope_zoneName_ownerName_transaction_error___block_invoke;
      v31[3] = &__block_descriptor_40_e15___NSString_8__0l;
      void v31[4] = a1;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      void v27[2] = __125__HDCachedCKRecordZoneEntity_requiresFetchForZoneWithContainerIdentifier_databaseScope_zoneName_ownerName_transaction_error___block_invoke_2;
      v27[3] = &unk_1E62F2DF0;
      id v28 = v18;
      id v29 = v15;
      id v30 = v16;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __125__HDCachedCKRecordZoneEntity_requiresFetchForZoneWithContainerIdentifier_databaseScope_zoneName_ownerName_transaction_error___block_invoke_3;
      v26[3] = &unk_1E62F3640;
      void v26[4] = &v32;
      int v23 = [v22 executeCachedStatementForKey:&requiresFetchForZoneWithContainerIdentifier_databaseScope_zoneName_ownerName_transaction_error__fetchKey error:a8 SQLGenerator:v31 bindingHandler:v27 enumerationHandler:v26];

      if (v23)
      {
        if (*((unsigned char *)v33 + 24)) {
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

      _Block_object_dispose(&v32, 8);
    }
    else
    {
      int64_t v24 = 1;
    }
  }
  else if (a8)
  {
    int64_t v24 = 0;
    *a8 = v19;
  }
  else
  {
    _HKLogDroppedError();
    int64_t v24 = 0;
  }

  return v24;
}

id __125__HDCachedCKRecordZoneEntity_requiresFetchForZoneWithContainerIdentifier_databaseScope_zoneName_ownerName_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ?", @"needs_fetch", v2, @"database_id", @"zone_name", @"owner_name"];

  return v3;
}

uint64_t __125__HDCachedCKRecordZoneEntity_requiresFetchForZoneWithContainerIdentifier_databaseScope_zoneName_ownerName_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) persistentID]);
  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __125__HDCachedCKRecordZoneEntity_requiresFetchForZoneWithContainerIdentifier_databaseScope_zoneName_ownerName_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = MEMORY[0x1C1879F00](a2, 0);
  return 1;
}

+ (BOOL)setRequiresFetch:(BOOL)a3 containerIdentifier:(id)a4 databaseScope:(int64_t)a5 zoneName:(id)a6 ownerName:(id)a7 transaction:(id)a8 error:(id *)a9
{
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v31 = 0;
  id v18 = +[HDCachedCKDatabaseEntity entityForContainerIdentifier:a4 databaseScope:a5 userRecordName:0 transaction:v17 shouldCreate:0 error:&v31];
  id v19 = v31;
  id v20 = v19;
  if (v18) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = v19 == 0;
  }
  if (!v21)
  {
    if (a9)
    {
      char v23 = 0;
      *a9 = v19;
      goto LABEL_13;
    }
    _HKLogDroppedError();
LABEL_12:
    char v23 = 0;
    goto LABEL_13;
  }
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a9, 118, @"No such database.");
    goto LABEL_12;
  }
  id v22 = [v17 databaseForEntityClass:a1];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __118__HDCachedCKRecordZoneEntity_setRequiresFetch_containerIdentifier_databaseScope_zoneName_ownerName_transaction_error___block_invoke;
  v30[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v30[4] = a1;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __118__HDCachedCKRecordZoneEntity_setRequiresFetch_containerIdentifier_databaseScope_zoneName_ownerName_transaction_error___block_invoke_2;
  v25[3] = &unk_1E62F41B0;
  BOOL v29 = a3;
  id v26 = v18;
  id v27 = v15;
  id v28 = v16;
  char v23 = [v22 executeCachedStatementForKey:&setRequiresFetch_containerIdentifier_databaseScope_zoneName_ownerName_transaction_error__updateKey error:a9 SQLGenerator:v30 bindingHandler:v25 enumerationHandler:0];

LABEL_13:
  return v23;
}

id __118__HDCachedCKRecordZoneEntity_setRequiresFetch_containerIdentifier_databaseScope_zoneName_ownerName_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"UPDATE %@ SET %@ = ? WHERE %@ = ? AND %@ = ? AND %@ = ?", v2, @"needs_fetch", @"database_id", @"zone_name", @"owner_name"];

  return v3;
}

uint64_t __118__HDCachedCKRecordZoneEntity_setRequiresFetch_containerIdentifier_databaseScope_zoneName_ownerName_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(unsigned __int8 *)(a1 + 56));
  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 32) persistentID]);
  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)setZoneEntityState:(int64_t)a3 containerIdentifier:(id)a4 databaseScope:(int64_t)a5 zoneName:(id)a6 ownerName:(id)a7 profile:(id)a8 error:(id *)a9
{
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = [a8 database];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __116__HDCachedCKRecordZoneEntity_setZoneEntityState_containerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke;
  v24[3] = &unk_1E62F41D8;
  id v29 = a1;
  int64_t v30 = a3;
  id v25 = v15;
  id v26 = v16;
  id v27 = v17;
  int64_t v28 = a5;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  BOOL v22 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v18 error:a9 block:v24];

  return v22;
}

uint64_t __116__HDCachedCKRecordZoneEntity_setZoneEntityState_containerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = HDPredicateForContainerIdentifierAndDatabaseScope(*(void *)(a1 + 32), *(void *)(a1 + 56));
  uint64_t v7 = [v5 databaseForEntityClass:*(void *)(a1 + 64)];
  id v20 = 0;
  v8 = +[HDSQLiteEntity anyInDatabase:v7 predicate:v6 error:&v20];
  id v9 = v20;

  if (v8) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  if (!v10)
  {
    if (a3)
    {
      uint64_t v12 = 0;
      *a3 = v9;
      goto LABEL_13;
    }
    _HKLogDroppedError();
LABEL_12:
    uint64_t v12 = 0;
    goto LABEL_13;
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 118, @"No such database.");
    goto LABEL_12;
  }
  BOOL v11 = [v5 databaseForEntityClass:*(void *)(a1 + 64)];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __116__HDCachedCKRecordZoneEntity_setZoneEntityState_containerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke_2;
  v19[3] = &__block_descriptor_40_e15___NSString_8__0l;
  void v19[4] = *(void *)(a1 + 64);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __116__HDCachedCKRecordZoneEntity_setZoneEntityState_containerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke_3;
  v14[3] = &unk_1E62F4098;
  uint64_t v18 = *(void *)(a1 + 72);
  id v15 = v8;
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  uint64_t v12 = [v11 executeCachedStatementForKey:&HDCachedCKRecordZoneEntityZoneState_block_invoke_updateKey error:a3 SQLGenerator:v19 bindingHandler:v14 enumerationHandler:0];

LABEL_13:
  return v12;
}

id __116__HDCachedCKRecordZoneEntity_setZoneEntityState_containerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke_2(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"UPDATE %@ SET %@ = ? WHERE %@ = ? AND %@ = ? AND %@ = ?", v2, @"zone_state", @"database_id", @"zone_name", @"owner_name"];

  return v3;
}

uint64_t __116__HDCachedCKRecordZoneEntity_setZoneEntityState_containerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 56));
  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 32) persistentID]);
  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindFoundationValueToStatement();
}

@end