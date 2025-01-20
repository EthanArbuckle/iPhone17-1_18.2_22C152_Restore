@interface HDLogicalSourceEntity
+ (BOOL)deleteLogicalSourceEntitiesIfNecessaryWithTransaction:(id)a3 error:(id *)a4;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)bundleIDForLogicalSourceID:(int64_t)a3 transaction:(id)a4 error:(id *)a5;
+ (id)databaseTable;
+ (id)logicalSourceIDForBundleIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)lookUpOrCreateLogicalSourceWithBundleIdentifier:(id)a3 owningAppBundleIdentifier:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (id)ownerBundleIDForLogicalSourceID:(int64_t)a3 transaction:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
@end

@implementation HDLogicalSourceEntity

+ (id)databaseTable
{
  return @"logical_sources";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDLogicalSourceEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)bundleIDForLogicalSourceID:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [v8 databaseForEntityClass:a1];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__39;
  v20 = __Block_byref_object_dispose__39;
  id v21 = 0;
  v14[4] = a3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__HDLogicalSourceEntity_bundleIDForLogicalSourceID_transaction_error___block_invoke;
  v15[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v15[4] = a1;
  v13[4] = &v16;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__HDLogicalSourceEntity_bundleIDForLogicalSourceID_transaction_error___block_invoke_2;
  v14[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__HDLogicalSourceEntity_bundleIDForLogicalSourceID_transaction_error___block_invoke_3;
  v13[3] = &unk_1E62F3640;
  if ([v9 executeCachedStatementForKey:&bundleIDForLogicalSourceID_transaction_error__lookupKey error:a5 SQLGenerator:v15 bindingHandler:v14 enumerationHandler:v13])v10 = (void *)v17[5]; {
  else
  }
    v10 = 0;
  id v11 = v10;
  _Block_object_dispose(&v16, 8);

  return v11;
}

id __70__HDLogicalSourceEntity_bundleIDForLogicalSourceID_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ = ?", @"bundle_id", v2, *MEMORY[0x1E4F65C70]];

  return v3;
}

uint64_t __70__HDLogicalSourceEntity_bundleIDForLogicalSourceID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __70__HDLogicalSourceEntity_bundleIDForLogicalSourceID_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F80](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

+ (id)logicalSourceIDForBundleIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 databaseForEntityClass:a1];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__39;
  v23 = __Block_byref_object_dispose__39;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__HDLogicalSourceEntity_logicalSourceIDForBundleIdentifier_transaction_error___block_invoke;
  v18[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v18[4] = a1;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__HDLogicalSourceEntity_logicalSourceIDForBundleIdentifier_transaction_error___block_invoke_2;
  v16[3] = &unk_1E62F43C8;
  id v11 = v8;
  id v17 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__HDLogicalSourceEntity_logicalSourceIDForBundleIdentifier_transaction_error___block_invoke_3;
  v15[3] = &unk_1E62F3640;
  v15[4] = &v19;
  if ([v10 executeCachedStatementForKey:&logicalSourceIDForBundleIdentifier_transaction_error__lookupKey error:a5 SQLGenerator:v18 bindingHandler:v16 enumerationHandler:v15])v12 = (void *)v20[5]; {
  else
  }
    v12 = 0;
  id v13 = v12;

  _Block_object_dispose(&v19, 8);

  return v13;
}

id __78__HDLogicalSourceEntity_logicalSourceIDForBundleIdentifier_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = *MEMORY[0x1E4F65C70];
  uint64_t v3 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v4 = [v1 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ = ?", v2, v3, @"bundle_id"];

  return v4;
}

uint64_t __78__HDLogicalSourceEntity_logicalSourceIDForBundleIdentifier_transaction_error___block_invoke_2()
{
  return HDSQLiteBindStringToStatement();
}

uint64_t __78__HDLogicalSourceEntity_logicalSourceIDForBundleIdentifier_transaction_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithLongLong:HDSQLiteColumnAsInt64()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 1;
}

+ (id)ownerBundleIDForLogicalSourceID:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [v8 databaseForEntityClass:a1];
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__39;
  v20 = __Block_byref_object_dispose__39;
  id v21 = 0;
  v14[4] = a3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__HDLogicalSourceEntity_ownerBundleIDForLogicalSourceID_transaction_error___block_invoke;
  v15[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v15[4] = a1;
  v13[4] = &v16;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__HDLogicalSourceEntity_ownerBundleIDForLogicalSourceID_transaction_error___block_invoke_2;
  v14[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__HDLogicalSourceEntity_ownerBundleIDForLogicalSourceID_transaction_error___block_invoke_3;
  v13[3] = &unk_1E62F3640;
  if ([v9 executeCachedStatementForKey:&ownerBundleIDForLogicalSourceID_transaction_error__lookupKey error:a5 SQLGenerator:v15 bindingHandler:v14 enumerationHandler:v13])v10 = (void *)v17[5]; {
  else
  }
    v10 = 0;
  id v11 = v10;
  _Block_object_dispose(&v16, 8);

  return v11;
}

id __75__HDLogicalSourceEntity_ownerBundleIDForLogicalSourceID_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v3 = [v1 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ = ?", @"owner_bundle_id", v2, *MEMORY[0x1E4F65C70]];

  return v3;
}

uint64_t __75__HDLogicalSourceEntity_ownerBundleIDForLogicalSourceID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __75__HDLogicalSourceEntity_ownerBundleIDForLogicalSourceID_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F80](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

+ (id)lookUpOrCreateLogicalSourceWithBundleIdentifier:(id)a3 owningAppBundleIdentifier:(id)a4 transaction:(id)a5 error:(id *)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"HDLogicalSourceEntity.m", 120, @"Invalid parameter not satisfying: %@", @"bundleIdentifier != nil" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F2B560] _isPlaceholderBundleIdentifier:v11])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a6, 3, @"Invalid bundle identifier '%@'", v11);
    v14 = 0;
  }
  else
  {
    v15 = [v13 databaseForEntityClass:a1];
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__39;
    v44 = __Block_byref_object_dispose__39;
    id v45 = 0;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __117__HDLogicalSourceEntity_lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error___block_invoke;
    v37[3] = &unk_1E62F8BA0;
    id v38 = v12;
    id v39 = a1;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __117__HDLogicalSourceEntity_lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error___block_invoke_2;
    v34[3] = &unk_1E62F2900;
    id v16 = v11;
    id v35 = v16;
    id v17 = v38;
    id v36 = v17;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __117__HDLogicalSourceEntity_lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error___block_invoke_3;
    v33[3] = &unk_1E62F3640;
    v33[4] = &v40;
    if ([v15 executeCachedStatementForKey:&lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error__key error:a6 SQLGenerator:v37 bindingHandler:v34 enumerationHandler:v33])
    {
      if (v41[5])
      {
        v14 = +[HDSQLiteEntity entityWithPersistentID:](HDLogicalSourceEntity, "entityWithPersistentID:");
      }
      else
      {
        v20 = [v13 databaseForEntityClass:a1];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __117__HDLogicalSourceEntity_lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error___block_invoke_334;
        v32[3] = &__block_descriptor_40_e15___NSString_8__0l;
        v32[4] = a1;
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __117__HDLogicalSourceEntity_lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error___block_invoke_2_338;
        v29[3] = &unk_1E62F2900;
        id v30 = v16;
        id v31 = v17;
        char v21 = [v20 executeCachedStatementForKey:&lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error__insertKey error:a6 SQLGenerator:v32 bindingHandler:v29 enumerationHandler:0];

        if (v21)
        {
          v22 = [v13 unprotectedDatabase];
          uint64_t v23 = [v22 lastInsertRowID];
          id v24 = (void *)v41[5];
          v41[5] = v23;

          v14 = +[HDSQLiteEntity entityWithPersistentID:v41[5]];
        }
        else
        {
          _HKInitializeLogging();
          v25 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
          {
            if (a6) {
              id v26 = *a6;
            }
            else {
              id v26 = 0;
            }
            *(_DWORD *)buf = 138543362;
            id v47 = v26;
            _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_INFO, "Unable to insert logical source : %{public}@", buf, 0xCu);
          }
          v14 = 0;
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v18 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
      {
        if (a6) {
          id v19 = *a6;
        }
        else {
          id v19 = 0;
        }
        *(_DWORD *)buf = 138543362;
        id v47 = v19;
        _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_INFO, "Unable to look up logical source: %{public}@", buf, 0xCu);
      }
      v14 = 0;
    }

    _Block_object_dispose(&v40, 8);
  }

  return v14;
}

id __117__HDLogicalSourceEntity_lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error___block_invoke(uint64_t a1)
{
  v1 = @" = ";
  uint64_t v2 = *(void **)(a1 + 40);
  if (!*(void *)(a1 + 32)) {
    v1 = @" IS ";
  }
  uint64_t v3 = NSString;
  uint64_t v4 = *MEMORY[0x1E4F65C70];
  v5 = v1;
  v6 = [v2 disambiguatedDatabaseTable];
  v7 = [v3 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ = ? AND %@ %@ ?", v4, v6, @"bundle_id", @"owner_bundle_id", v5];

  return v7;
}

uint64_t __117__HDLogicalSourceEntity_lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindStringToStatement();
  if (*(void *)(a1 + 40))
  {
    return HDSQLiteBindStringToStatement();
  }
  else
  {
    return sqlite3_bind_null(a2, 2);
  }
}

uint64_t __117__HDLogicalSourceEntity_lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithLongLong:HDSQLiteColumnAsInt64()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 1;
}

id __117__HDLogicalSourceEntity_lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error___block_invoke_334(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v3 = [v1 stringWithFormat:@"INSERT INTO %@ (%@, %@) VALUES (?, ?)", v2, @"bundle_id", @"owner_bundle_id"];

  return v3;
}

uint64_t __117__HDLogicalSourceEntity_lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error___block_invoke_2_338(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindStringToStatement();
  if (*(void *)(a1 + 40))
  {
    return HDSQLiteBindStringToStatement();
  }
  else
  {
    return sqlite3_bind_null(a2, 2);
  }
}

+ (BOOL)deleteLogicalSourceEntitiesIfNecessaryWithTransaction:(id)a3 error:(id *)a4
{
  v6 = [a3 databaseForEntityClass:a1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__HDLogicalSourceEntity_deleteLogicalSourceEntitiesIfNecessaryWithTransaction_error___block_invoke;
  v8[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v8[4] = a1;
  LOBYTE(a4) = [v6 executeCachedStatementForKey:&deleteLogicalSourceEntitiesIfNecessaryWithTransaction_error__lookupKey error:a4 SQLGenerator:v8 bindingHandler:0 enumerationHandler:0];

  return (char)a4;
}

id __85__HDLogicalSourceEntity_deleteLogicalSourceEntitiesIfNecessaryWithTransaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v3 = *MEMORY[0x1E4F65C70];
  uint64_t v4 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v5 = [v1 stringWithFormat:@"DELETE FROM %@ WHERE %@ NOT IN (SELECT DISTINCT(%@) FROM %@)", v2, v3, @"logical_source_id", v4];

  return v5;
}

@end