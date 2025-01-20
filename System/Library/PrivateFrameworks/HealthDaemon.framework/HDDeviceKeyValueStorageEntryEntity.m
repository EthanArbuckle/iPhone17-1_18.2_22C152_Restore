@interface HDDeviceKeyValueStorageEntryEntity
+ (BOOL)enumerateAllEntriesForSyncIdentity:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)removeEntitesForKeys:(id)a3 domain:(id)a4 syncEntityIdentity:(int64_t)a5 transaction:(id)a6 error:(id *)a7;
+ (BOOL)replaceEntriesForOldSyncIdentity:(int64_t)a3 withNewSyncIdentity:(int64_t)a4 deviceContextID:(int64_t)a5 transaction:(id)a6 error:(id *)a7;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_predicateForAnyKeys:(id)a3;
+ (id)_predicateForKeys:(id)a3 domain:(id)a4;
+ (id)_predicateForSyncEntityIdentity:(int64_t)a3 domain:(id)a4 keys:(id)a5;
+ (id)_propertiesForEntity;
+ (id)databaseTable;
+ (id)fetchEntriesForKeys:(id)a3 domain:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (id)fetchEntryForKey:(id)a3 domain:(id)a4 syncEntityIdentity:(int64_t)a5 transaction:(id)a6 error:(id *)a7;
+ (int)setData:(id)a3 forKey:(id)a4 domain:(id)a5 deviceContextID:(int64_t)a6 syncEntityIdentity:(int64_t)a7 modificationDate:(id)a8 transaction:(id)a9 error:(id *)a10;
+ (int64_t)protectionClass;
+ (void)binderHandlerForBinder:(HDSQLiteStatementBinder *)a3 key:(id)a4 domain:(id)a5 object:(id)a6 syncEntityIdentity:(int64_t)a7 deviceContext:(int64_t)a8 modificationDate:(id)a9;
+ (void)binderHandlerForBinder:(HDSQLiteStatementBinder *)a3 syncEntityIdentity:(int64_t)a4 deviceContext:(int64_t)a5;
@end

@implementation HDDeviceKeyValueStorageEntryEntity

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDDeviceKeyValueStorageEntryEntityColumnDefinitions;
}

+ (id)fetchEntriesForKeys:(id)a3 domain:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__148;
  v29 = __Block_byref_object_dispose__148;
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v13 = [v12 databaseForEntityClass:a1];
  v14 = [a1 _predicateForKeys:v10 domain:v11];
  v15 = [a1 queryWithDatabase:v13 predicate:v14];

  v16 = [a1 _propertiesForEntity];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __83__HDDeviceKeyValueStorageEntryEntity_fetchEntriesForKeys_domain_transaction_error___block_invoke;
  v21[3] = &unk_1E6306F70;
  id v17 = v12;
  id v22 = v17;
  v23 = &v25;
  id v24 = a1;
  LODWORD(a6) = [v15 enumerateProperties:v16 error:a6 enumerationHandler:v21];

  if (a6) {
    v18 = (void *)v26[5];
  }
  else {
    v18 = 0;
  }
  id v19 = v18;

  _Block_object_dispose(&v25, 8);

  return v19;
}

BOOL __83__HDDeviceKeyValueStorageEntryEntity_fetchEntriesForKeys_domain_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5 = +[HDSyncIdentityEntity concreteIdentityForPersistentID:HDSQLiteColumnWithNameAsInt64() transaction:*(void *)(a1 + 32) error:a4];
  if (v5)
  {
    v6 = objc_opt_class();
    uint64_t v7 = [v6 isEqual:objc_opt_class()] ^ 1;
    v8 = [HDDeviceKeyValueStorageEntry alloc];
    v9 = HDSQLiteColumnWithNameAsString();
    id v10 = HDSQLiteColumnWithNameAsString();
    id v11 = HDSQLiteColumnWithNameAsData();
    id v12 = HDSQLiteColumnWithNameAsDate();
    v13 = [v5 identity];
    v14 = [(HDDeviceKeyValueStorageEntry *)v8 initWithDomain:v9 key:v10 value:v11 modificationDate:v12 syncIdentity:v13 category:v7];

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v14];
  }

  return v5 != 0;
}

+ (BOOL)enumerateAllEntriesForSyncIdentity:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = [v11 databaseForEntityClass:a1];
  v14 = +[HDSyncIdentityEntity concreteIdentityForIdentity:v12 transaction:v11 error:a5];

  if (v14)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __110__HDDeviceKeyValueStorageEntryEntity_enumerateAllEntriesForSyncIdentity_transaction_error_enumerationHandler___block_invoke;
    v23[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v23[4] = a1;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __110__HDDeviceKeyValueStorageEntryEntity_enumerateAllEntriesForSyncIdentity_transaction_error_enumerationHandler___block_invoke_2;
    v21[3] = &unk_1E62F43C8;
    id v22 = v14;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __110__HDDeviceKeyValueStorageEntryEntity_enumerateAllEntriesForSyncIdentity_transaction_error_enumerationHandler___block_invoke_3;
    v17[3] = &unk_1E6306F98;
    id v20 = a1;
    id v18 = v22;
    id v19 = v10;
    char v15 = [v13 executeCachedStatementForKey:&enumerateAllEntriesForSyncIdentity_transaction_error_enumerationHandler__lookupKey error:a5 SQLGenerator:v23 bindingHandler:v21 enumerationHandler:v17];
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

id __110__HDDeviceKeyValueStorageEntryEntity_enumerateAllEntriesForSyncIdentity_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"SELECT %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?", @"domain", @"key", @"value", @"date_modified", @"sync_identity_id", v2, @"sync_identity_id"];

  return v3;
}

void __110__HDDeviceKeyValueStorageEntryEntity_enumerateAllEntriesForSyncIdentity_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = [*(id *)(a1 + 32) entity];
  sqlite3_bind_int64(a2, 1, [v3 persistentID]);
}

uint64_t __110__HDDeviceKeyValueStorageEntryEntity_enumerateAllEntriesForSyncIdentity_transaction_error_enumerationHandler___block_invoke_3(uint64_t a1)
{
  v2 = objc_opt_class();
  uint64_t v3 = [v2 isEqual:objc_opt_class()] ^ 1;
  v4 = [HDDeviceKeyValueStorageEntry alloc];
  v5 = HDSQLiteColumnWithNameAsString();
  v6 = HDSQLiteColumnWithNameAsString();
  uint64_t v7 = HDSQLiteColumnWithNameAsData();
  v8 = HDSQLiteColumnWithNameAsDate();
  v9 = [*(id *)(a1 + 32) identity];
  id v10 = [(HDDeviceKeyValueStorageEntry *)v4 initWithDomain:v5 key:v6 value:v7 modificationDate:v8 syncIdentity:v9 category:v3];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return 1;
}

+ (id)fetchEntryForKey:(id)a3 domain:(id)a4 syncEntityIdentity:(int64_t)a5 transaction:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__148;
  v35 = __Block_byref_object_dispose__148;
  id v36 = 0;
  char v15 = [v14 databaseForEntityClass:a1];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __99__HDDeviceKeyValueStorageEntryEntity_fetchEntryForKey_domain_syncEntityIdentity_transaction_error___block_invoke;
  v30[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v30[4] = a1;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __99__HDDeviceKeyValueStorageEntryEntity_fetchEntryForKey_domain_syncEntityIdentity_transaction_error___block_invoke_2;
  v26[3] = &unk_1E62F9A10;
  id v16 = v13;
  id v27 = v16;
  id v17 = v12;
  id v28 = v17;
  int64_t v29 = a5;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __99__HDDeviceKeyValueStorageEntryEntity_fetchEntryForKey_domain_syncEntityIdentity_transaction_error___block_invoke_3;
  v22[3] = &unk_1E6306FC0;
  id v18 = v14;
  id v23 = v18;
  id v24 = &v31;
  id v25 = a1;
  if ([v15 executeCachedStatementForKey:&fetchEntryForKey_domain_syncEntityIdentity_transaction_error__lookupKey error:a7 SQLGenerator:v30 bindingHandler:v26 enumerationHandler:v22])id v19 = (void *)v32[5]; {
  else
  }
    id v19 = 0;
  id v20 = v19;

  _Block_object_dispose(&v31, 8);

  return v20;
}

id __99__HDDeviceKeyValueStorageEntryEntity_fetchEntryForKey_domain_syncEntityIdentity_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v3 = [v1 stringWithFormat:@"SELECT %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ?", @"domain", @"key", @"value", @"date_modified", @"sync_identity_id", v2, @"domain", @"key", @"sync_identity_id"];

  return v3;
}

uint64_t __99__HDDeviceKeyValueStorageEntryEntity_fetchEntryForKey_domain_syncEntityIdentity_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v4 = *(void *)(a1 + 48);

  return sqlite3_bind_int64(a2, 3, v4);
}

BOOL __99__HDDeviceKeyValueStorageEntryEntity_fetchEntryForKey_domain_syncEntityIdentity_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sqlite3_int64 v4 = +[HDSyncIdentityEntity concreteIdentityForPersistentID:HDSQLiteColumnWithNameAsInt64() transaction:*(void *)(a1 + 32) error:a3];
  if (v4)
  {
    v5 = [HDDeviceKeyValueStorageEntry alloc];
    v6 = HDSQLiteColumnWithNameAsString();
    uint64_t v7 = HDSQLiteColumnWithNameAsString();
    v8 = HDSQLiteColumnWithNameAsData();
    v9 = HDSQLiteColumnWithNameAsDate();
    id v10 = [v4 identity];
    id v11 = objc_opt_class();
    uint64_t v12 = -[HDDeviceKeyValueStorageEntry initWithDomain:key:value:modificationDate:syncIdentity:category:](v5, "initWithDomain:key:value:modificationDate:syncIdentity:category:", v6, v7, v8, v9, v10, [v11 isEqual:objc_opt_class()] ^ 1);
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  return v4 != 0;
}

+ (BOOL)replaceEntriesForOldSyncIdentity:(int64_t)a3 withNewSyncIdentity:(int64_t)a4 deviceContextID:(int64_t)a5 transaction:(id)a6 error:(id *)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v22[0] = @"sync_identity_id";
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  char v15 = (void *)[v13 initWithArray:v14];

  id v16 = objc_opt_class();
  if ([v16 isEqual:objc_opt_class()]) {
    [v15 addObject:@"device_record_id"];
  }
  id v17 = [v12 databaseForEntityClass:a1];
  id v18 = [a1 _predicateForSyncEntityIdentity:a3 domain:0 keys:0];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __125__HDDeviceKeyValueStorageEntryEntity_replaceEntriesForOldSyncIdentity_withNewSyncIdentity_deviceContextID_transaction_error___block_invoke;
  v21[3] = &__block_descriptor_56_e34_v16__0__HDSQLiteStatementBinder__8l;
  void v21[4] = a1;
  v21[5] = a4;
  v21[6] = a5;
  char v19 = [a1 updateProperties:v15 predicate:v18 database:v17 error:a7 bindingHandler:v21];

  return v19;
}

uint64_t __125__HDDeviceKeyValueStorageEntryEntity_replaceEntriesForOldSyncIdentity_withNewSyncIdentity_deviceContextID_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) binderHandlerForBinder:a2 syncEntityIdentity:*(void *)(a1 + 40) deviceContext:*(void *)(a1 + 48)];
}

+ (int)setData:(id)a3 forKey:(id)a4 domain:(id)a5 deviceContextID:(int64_t)a6 syncEntityIdentity:(int64_t)a7 modificationDate:(id)a8 transaction:(id)a9 error:(id *)a10
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = a9;
  if (v16)
  {
    id v50 = 0;
    v21 = [a1 fetchEntryForKey:v17 domain:v18 syncEntityIdentity:a7 transaction:v20 error:&v50];
    id v22 = v50;
    if (v21 || !v22)
    {
      id v38 = v22;
      if (v21)
      {
        id v36 = v19;
        v26 = [v21 value];
        int v27 = [v26 isEqual:v16];

        if (v27)
        {
          _HKInitializeLogging();
          id v28 = *MEMORY[0x1E4F29FA8];
          int v24 = 2;
          id v19 = v36;
          id v23 = v38;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v21;
            _os_log_debug_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_DEBUG, "Value unchanged for entry %@, skipping.", buf, 0xCu);
          }
          goto LABEL_15;
        }
        v52[0] = @"value";
        v52[1] = @"date_modified";
        v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
        id v51 = v17;
        uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
        id v30 = [a1 _predicateForSyncEntityIdentity:a7 domain:v18 keys:v33];
        uint64_t v31 = [v20 databaseForEntityClass:a1];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __130__HDDeviceKeyValueStorageEntryEntity_setData_forKey_domain_deviceContextID_syncEntityIdentity_modificationDate_transaction_error___block_invoke_331;
        v39[3] = &unk_1E62F3A88;
        id v40 = v16;
        id v41 = v36;
        int v24 = [a1 updateProperties:v35 predicate:v30 database:v31 error:a10 bindingHandler:v39];

        id v19 = v36;
      }
      else
      {
        v37 = [v20 databaseForEntityClass:a1];
        v34 = [a1 _propertiesForEntity];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __130__HDDeviceKeyValueStorageEntryEntity_setData_forKey_domain_deviceContextID_syncEntityIdentity_modificationDate_transaction_error___block_invoke;
        v42[3] = &unk_1E6307008;
        id v47 = a1;
        id v43 = v17;
        id v44 = v18;
        id v45 = v16;
        int64_t v48 = a7;
        int64_t v49 = a6;
        id v46 = v19;
        int64_t v29 = [a1 insertOrReplaceEntity:0 database:v37 properties:v34 error:a10 bindingHandler:v42];

        int v24 = v29 != 0;
      }
      id v23 = v38;
    }
    else
    {
      id v23 = v22;
      if (a10)
      {
        int v24 = 0;
        *a10 = v22;
      }
      else
      {
        _HKLogDroppedError();
        int v24 = 0;
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  v55[0] = v17;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
  int v24 = [a1 removeEntitesForKeys:v25 domain:v18 syncEntityIdentity:a7 transaction:v20 error:a10];

LABEL_16:
  return v24;
}

uint64_t __130__HDDeviceKeyValueStorageEntryEntity_setData_forKey_domain_deviceContextID_syncEntityIdentity_modificationDate_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 64) binderHandlerForBinder:a2 key:*(void *)(a1 + 32) domain:*(void *)(a1 + 40) object:*(void *)(a1 + 48) syncEntityIdentity:*(void *)(a1 + 72) deviceContext:*(void *)(a1 + 80) modificationDate:*(void *)(a1 + 56)];
}

void __130__HDDeviceKeyValueStorageEntryEntity_setData_forKey_domain_deviceContextID_syncEntityIdentity_modificationDate_transaction_error___block_invoke_331(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E30](a2, @"value", *(void *)(a1 + 32));
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];

  JUMPOUT(0x1C1879E50);
}

+ (BOOL)removeEntitesForKeys:(id)a3 domain:(id)a4 syncEntityIdentity:(int64_t)a5 transaction:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a3;
  id v14 = [a6 databaseForEntityClass:a1];
  char v15 = [a1 _predicateForSyncEntityIdentity:a5 domain:v12 keys:v13];

  LOBYTE(a7) = [a1 deleteEntitiesInDatabase:v14 predicate:v15 error:a7];
  return (char)a7;
}

+ (id)_propertiesForEntity
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"sync_identity_id";
  v4[1] = @"domain";
  v4[2] = @"key";
  v4[3] = @"value";
  v4[4] = @"date_modified";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];

  return v2;
}

+ (id)_predicateForKeys:(id)a3 domain:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a1 _predicateForAnyKeys:a3];
  v8 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"domain" equalToValue:v6];

  if (v7)
  {
    v9 = (void *)MEMORY[0x1E4F65D08];
    v13[0] = v7;
    v13[1] = v8;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    id v11 = [v9 predicateMatchingAllPredicates:v10];
  }
  else
  {
    id v11 = v8;
  }

  return v11;
}

+ (id)_predicateForAnyKeys:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(MEMORY[0x1E4F65D00], "predicateWithProperty:equalToValue:", @"key", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if (v5)
  {
    id v11 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v4];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)_predicateForSyncEntityIdentity:(int64_t)a3 domain:(id)a4 keys:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v11 = (void *)MEMORY[0x1E4F65D00];
  id v12 = [NSNumber numberWithLongLong:a3];
  long long v13 = [v11 predicateWithProperty:@"sync_identity_id" equalToValue:v12];
  v20[0] = v13;
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  long long v15 = (void *)[v10 initWithArray:v14];

  if (v8)
  {
    long long v16 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"domain" equalToValue:v8];
    [v15 addObject:v16];
  }
  if (v9)
  {
    id v17 = [a1 _predicateForAnyKeys:v9];
    [v15 addObject:v17];
  }
  uint64_t v18 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v15];

  return v18;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)databaseTable
{
  return @"secure_kv_device_storage";
}

+ (void)binderHandlerForBinder:(HDSQLiteStatementBinder *)a3 key:(id)a4 domain:(id)a5 object:(id)a6 syncEntityIdentity:(int64_t)a7 deviceContext:(int64_t)a8 modificationDate:(id)a9
{
  id v14 = a9;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  MEMORY[0x1C1879E80](a3, @"sync_identity_id", a7);
  MEMORY[0x1C1879EC0](a3, @"domain", v16);

  MEMORY[0x1C1879EC0](a3, @"key", v17);
  MEMORY[0x1C1879E30](a3, @"value", v15);

  [v14 timeIntervalSinceReferenceDate];

  JUMPOUT(0x1C1879E50);
}

+ (void)binderHandlerForBinder:(HDSQLiteStatementBinder *)a3 syncEntityIdentity:(int64_t)a4 deviceContext:(int64_t)a5
{
}

@end