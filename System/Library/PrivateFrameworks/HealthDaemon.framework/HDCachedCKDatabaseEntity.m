@interface HDCachedCKDatabaseEntity
+ (BOOL)deleteDatabasesNotMatchingUserRecordName:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)insertIfDoesNotExistWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 userRecordName:(id)a5 serverChangeToken:(id)a6 profile:(id)a7 error:(id *)a8;
+ (BOOL)insertOrUpdateWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 userRecordName:(id)a5 serverChangeToken:(id)a6 profile:(id)a7 error:(id *)a8;
+ (BOOL)updateServerChangeToken:(id)a3 containerIdentifier:(id)a4 databaseScope:(int64_t)a5 transaction:(id)a6 error:(id *)a7;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)entityForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 userRecordName:(id)a5 transaction:(id)a6 shouldCreate:(BOOL)a7 error:(id *)a8;
+ (id)insertWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 userRecordName:(id)a5 serverChangeToken:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (id)serverChangeTokenForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (id)uniquedColumns;
+ (int64_t)previousEpochForTransaction:(id)a3 error:(id *)a4;
+ (int64_t)protectionClass;
- (BOOL)setCurrentEpoch:(int64_t)a3 transaction:(id)a4 error:(id *)a5;
@end

@implementation HDCachedCKDatabaseEntity

+ (id)databaseTable
{
  return @"ck_database_cache";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDCKDatabaseCacheEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"container_id";
  v4[1] = @"database_scope";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)insertWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 userRecordName:(id)a5 serverChangeToken:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v14 = a3;
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
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __123__HDCachedCKDatabaseEntity_insertWithContainerIdentifier_databaseScope_userRecordName_serverChangeToken_transaction_error___block_invoke;
  v31[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v31[4] = a1;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __123__HDCachedCKDatabaseEntity_insertWithContainerIdentifier_databaseScope_userRecordName_serverChangeToken_transaction_error___block_invoke_2;
  v26[3] = &unk_1E62F4098;
  id v27 = v14;
  int64_t v30 = a4;
  id v21 = v18;
  id v28 = v21;
  id v29 = v15;
  int v22 = [v20 executeCachedStatementForKey:&insertWithContainerIdentifier_databaseScope_userRecordName_serverChangeToken_transaction_error__lookupKey error:a8 SQLGenerator:v31 bindingHandler:v26 enumerationHandler:0];
  v19 = 0;
  if (v22)
  {
    v23 = [HDCachedCKDatabaseEntity alloc];
    v24 = [v20 lastInsertRowID];
    v19 = -[HDSQLiteEntity initWithPersistentID:](v23, "initWithPersistentID:", [v24 longLongValue]);
  }
LABEL_8:

  return v19;
}

id __123__HDCachedCKDatabaseEntity_insertWithContainerIdentifier_databaseScope_userRecordName_serverChangeToken_transaction_error___block_invoke()
{
  v0 = self;
  v1 = NSString;
  v2 = [v0 disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"INSERT INTO %@ (%@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?)", v2, @"container_id", @"database_scope", @"server_change_token", @"account_user_record_name", @"epoch"];

  return v3;
}

uint64_t __123__HDCachedCKDatabaseEntity_insertWithContainerIdentifier_databaseScope_userRecordName_serverChangeToken_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 56));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();

  return sqlite3_bind_int64(a2, 5, 0);
}

+ (BOOL)updateServerChangeToken:(id)a3 containerIdentifier:(id)a4 databaseScope:(int64_t)a5 transaction:(id)a6 error:(id *)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (!v12)
  {
    id v15 = 0;
    goto LABEL_5;
  }
  id v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:a7];
  if (v15)
  {
LABEL_5:
    id v17 = [v14 databaseForEntityClass:a1];
    v18 = HDPredicateForContainerIdentifierAndDatabaseScope((uint64_t)v13, a5);
    v24[0] = @"server_change_token";
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __104__HDCachedCKDatabaseEntity_updateServerChangeToken_containerIdentifier_databaseScope_transaction_error___block_invoke;
    v22[3] = &unk_1E62F35C8;
    id v23 = v15;
    id v20 = v15;
    char v16 = [a1 updateProperties:v19 predicate:v18 database:v17 error:a7 bindingHandler:v22];

    goto LABEL_6;
  }
  char v16 = 0;
LABEL_6:

  return v16;
}

void __104__HDCachedCKDatabaseEntity_updateServerChangeToken_containerIdentifier_databaseScope_transaction_error___block_invoke()
{
}

+ (id)entityForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 userRecordName:(id)a5 transaction:(id)a6 shouldCreate:(BOOL)a7 error:(id *)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__165;
  v36 = __Block_byref_object_dispose__165;
  id v37 = 0;
  v18 = [v17 databaseForEntityClass:a1];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __117__HDCachedCKDatabaseEntity_entityForContainerIdentifier_databaseScope_userRecordName_transaction_shouldCreate_error___block_invoke;
  v31[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v31[4] = a1;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __117__HDCachedCKDatabaseEntity_entityForContainerIdentifier_databaseScope_userRecordName_transaction_shouldCreate_error___block_invoke_2;
  v28[3] = &unk_1E62F33F8;
  id v19 = v15;
  id v29 = v19;
  int64_t v30 = a4;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __117__HDCachedCKDatabaseEntity_entityForContainerIdentifier_databaseScope_userRecordName_transaction_shouldCreate_error___block_invoke_3;
  v27[3] = &unk_1E62F3640;
  v27[4] = &v32;
  char v20 = [v18 executeCachedStatementForKey:&entityForContainerIdentifier_databaseScope_userRecordName_transaction_shouldCreate_error__lookupKey error:a8 SQLGenerator:v31 bindingHandler:v28 enumerationHandler:v27];

  if (v20)
  {
    id v21 = (void *)v33[5];
    if (v21 || !a7)
    {
      id v22 = v21;
      goto LABEL_7;
    }
    if (v16)
    {
      id v22 = [a1 insertWithContainerIdentifier:v19 databaseScope:a4 userRecordName:v16 serverChangeToken:0 transaction:v17 error:a8];
LABEL_7:
      id v23 = v22;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"User record name must not be nil"");
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      if (a8) {
        *a8 = v24;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  id v23 = 0;
LABEL_14:

  _Block_object_dispose(&v32, 8);

  return v23;
}

id __117__HDCachedCKDatabaseEntity_entityForContainerIdentifier_databaseScope_userRecordName_transaction_shouldCreate_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = *MEMORY[0x1E4F65C70];
  v3 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v4 = [v1 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ = ? AND %@ = ?", v2, v3, @"container_id", @"database_scope"];

  return v4;
}

uint64_t __117__HDCachedCKDatabaseEntity_entityForContainerIdentifier_databaseScope_userRecordName_transaction_shouldCreate_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

uint64_t __117__HDCachedCKDatabaseEntity_entityForContainerIdentifier_databaseScope_userRecordName_transaction_shouldCreate_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [(HDSQLiteEntity *)[HDCachedCKDatabaseEntity alloc] initWithPersistentID:HDSQLiteColumnAsInt64()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  sqlite3_int64 v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 0;
}

+ (BOOL)deleteDatabasesNotMatchingUserRecordName:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = NSString;
  id v10 = a4;
  v11 = [a1 disambiguatedDatabaseTable];
  id v12 = [v9 stringWithFormat:@"DELETE FROM %@ WHERE %@ != ?", v11, @"account_user_record_name"];

  id v13 = [v10 database];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__HDCachedCKDatabaseEntity_deleteDatabasesNotMatchingUserRecordName_profile_error___block_invoke;
  v17[3] = &unk_1E62F2AE0;
  id v18 = v12;
  id v19 = v8;
  id v14 = v8;
  id v15 = v12;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v13 error:a5 block:v17];

  return (char)a5;
}

uint64_t __83__HDCachedCKDatabaseEntity_deleteDatabasesNotMatchingUserRecordName_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = [a2 unprotectedDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__HDCachedCKDatabaseEntity_deleteDatabasesNotMatchingUserRecordName_profile_error___block_invoke_2;
  v9[3] = &unk_1E62F43C8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  uint64_t v7 = [v5 executeUncachedSQL:v6 error:a3 bindingHandler:v9 enumerationHandler:0];

  return v7;
}

uint64_t __83__HDCachedCKDatabaseEntity_deleteDatabasesNotMatchingUserRecordName_profile_error___block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)insertOrUpdateWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 userRecordName:(id)a5 serverChangeToken:(id)a6 profile:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = [a7 database];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __127__HDCachedCKDatabaseEntity_insertOrUpdateWithContainerIdentifier_databaseScope_userRecordName_serverChangeToken_profile_error___block_invoke;
  v22[3] = &unk_1E62F4188;
  id v26 = a1;
  int64_t v27 = a4;
  id v23 = v14;
  id v24 = v15;
  id v25 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  LOBYTE(a8) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v17 error:a8 block:v22];

  return (char)a8;
}

BOOL __127__HDCachedCKDatabaseEntity_insertOrUpdateWithContainerIdentifier_databaseScope_userRecordName_serverChangeToken_profile_error___block_invoke(uint64_t *a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = (void *)a1[7];
  uint64_t v7 = [v5 databaseForEntityClass:v6];
  id v8 = HDPredicateForContainerIdentifierAndDatabaseScope(a1[4], a1[8]);
  id v21 = 0;
  v9 = [v6 anyInDatabase:v7 predicate:v8 error:&v21];
  id v10 = v21;

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
      BOOL v12 = 0;
      v9 = 0;
      goto LABEL_18;
    }
    id v13 = v10;
    goto LABEL_10;
  }
  if (!v9)
  {
    uint64_t v14 = a1[8];
    uint64_t v15 = a1[4];
    uint64_t v16 = a1[5];
    uint64_t v17 = a1[6];
    id v20 = v10;
    v9 = +[HDCachedCKDatabaseEntity insertWithContainerIdentifier:v15 databaseScope:v14 userRecordName:v16 serverChangeToken:v17 transaction:v5 error:&v20];
    id v18 = v20;

    BOOL v12 = 1;
    if (!v9 && v18)
    {
      if (a3)
      {
        id v13 = v18;
LABEL_10:
        id v10 = v13;
        BOOL v12 = 0;
        v9 = 0;
        *a3 = v10;
        goto LABEL_18;
      }
      _HKLogDroppedError();
      BOOL v12 = 0;
      v9 = 0;
    }
    id v10 = v18;
    goto LABEL_18;
  }
  BOOL v12 = +[HDCachedCKDatabaseEntity updateServerChangeToken:a1[6] containerIdentifier:a1[4] databaseScope:a1[8] transaction:v5 error:a3];
LABEL_18:

  return v12;
}

+ (BOOL)insertIfDoesNotExistWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 userRecordName:(id)a5 serverChangeToken:(id)a6 profile:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = [a7 database];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __133__HDCachedCKDatabaseEntity_insertIfDoesNotExistWithContainerIdentifier_databaseScope_userRecordName_serverChangeToken_profile_error___block_invoke;
  v22[3] = &unk_1E62F4188;
  id v26 = a1;
  int64_t v27 = a4;
  id v23 = v14;
  id v24 = v15;
  id v25 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  LOBYTE(a8) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v17 error:a8 block:v22];

  return (char)a8;
}

uint64_t __133__HDCachedCKDatabaseEntity_insertIfDoesNotExistWithContainerIdentifier_databaseScope_userRecordName_serverChangeToken_profile_error___block_invoke(uint64_t *a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = (void *)a1[7];
  uint64_t v7 = [v5 databaseForEntityClass:v6];
  id v8 = HDPredicateForContainerIdentifierAndDatabaseScope(a1[4], a1[8]);
  id v21 = 0;
  v9 = [v6 anyInDatabase:v7 predicate:v8 error:&v21];
  id v10 = v21;

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
      uint64_t v12 = 0;
      v9 = 0;
      goto LABEL_18;
    }
    id v13 = v10;
    goto LABEL_10;
  }
  if (!v9)
  {
    uint64_t v14 = a1[8];
    uint64_t v15 = a1[4];
    uint64_t v16 = a1[5];
    uint64_t v17 = a1[6];
    id v20 = v10;
    v9 = +[HDCachedCKDatabaseEntity insertWithContainerIdentifier:v15 databaseScope:v14 userRecordName:v16 serverChangeToken:v17 transaction:v5 error:&v20];
    id v18 = v20;

    uint64_t v12 = 1;
    if (!v9 && v18)
    {
      if (a3)
      {
        id v13 = v18;
LABEL_10:
        id v10 = v13;
        uint64_t v12 = 0;
        v9 = 0;
        *a3 = v10;
        goto LABEL_18;
      }
      _HKLogDroppedError();
      uint64_t v12 = 0;
      v9 = 0;
    }
    id v10 = v18;
    goto LABEL_18;
  }
  uint64_t v12 = 1;
LABEL_18:

  return v12;
}

+ (id)serverChangeTokenForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a5;
  BOOL v11 = HDPredicateForContainerIdentifierAndDatabaseScope((uint64_t)a3, a4);
  uint64_t v12 = [v10 database];

  id v13 = [a1 propertyValueForAnyWithProperty:@"server_change_token" predicate:v11 healthDatabase:v12 error:a6];

  if (v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v13 error:a6];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)setCurrentEpoch:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = [a4 unprotectedDatabase];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__HDCachedCKDatabaseEntity_setCurrentEpoch_transaction_error___block_invoke_2;
  v10[3] = &unk_1E62F33F8;
  v10[4] = self;
  v10[5] = a3;
  LOBYTE(a5) = [v8 executeCachedStatementForKey:&setCurrentEpoch_transaction_error__lookupKey error:a5 SQLGenerator:&__block_literal_global_202 bindingHandler:v10 enumerationHandler:0];

  return (char)a5;
}

id __62__HDCachedCKDatabaseEntity_setCurrentEpoch_transaction_error___block_invoke()
{
  v0 = NSString;
  v1 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v2 = [v0 stringWithFormat:@"UPDATE %@ SET %@ = ? WHERE %@ = ?", v1, @"epoch", *MEMORY[0x1E4F65C70]];

  return v2;
}

uint64_t __62__HDCachedCKDatabaseEntity_setCurrentEpoch_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  sqlite3_int64 v4 = [*(id *)(a1 + 32) persistentID];

  return sqlite3_bind_int64(a2, 2, v4);
}

+ (int64_t)previousEpochForTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = -1;
  uint64_t v7 = [v6 unprotectedDatabase];
  void v17[4] = a1;
  id v18 = 0;
  v16[4] = &v19;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__HDCachedCKDatabaseEntity_previousEpochForTransaction_error___block_invoke;
  v17[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__HDCachedCKDatabaseEntity_previousEpochForTransaction_error___block_invoke_2;
  v16[3] = &unk_1E62F3640;
  char v8 = [v7 executeCachedStatementForKey:&previousEpochForTransaction_error__lookupKey error:&v18 SQLGenerator:v17 bindingHandler:0 enumerationHandler:v16];
  id v9 = v18;
  id v10 = v9;
  if ((v8 & 1) == 0)
  {
    if (v9)
    {
      id v11 = v9;
      uint64_t v12 = v11;
      if (a4) {
        *a4 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failed to retrieve previous epoch from cache.");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = v13;
      if (v13)
      {
        if (a4) {
          *a4 = v13;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  int64_t v14 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v14;
}

id __62__HDCachedCKDatabaseEntity_previousEpochForTransaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v3 = [v1 stringWithFormat:@"SELECT MAX(%@) as %@ FROM %@", @"epoch", @"epoch", v2, 0];

  return v3;
}

uint64_t __62__HDCachedCKDatabaseEntity_previousEpochForTransaction_error___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnWithNameAsInt64();
  return 0;
}

@end