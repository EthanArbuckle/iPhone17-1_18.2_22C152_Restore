@interface HDDeviceContextEntity
+ (BOOL)deleteDeviceContextWithSyncIdentity:(int64_t)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)enumerateDeviceContextWithTransaction:(id)a3 error:(id *)a4 enumerationHandler:(id)a5;
+ (BOOL)updateDeviceContext:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (BOOL)updateSoftwareVersionForDeviceContext:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_contextForEntity:(void *)a3 transaction:(uint64_t)a4 error:;
+ (id)_deviceContextWithSyncIdentity:(void *)a3 transaction:(uint64_t)a4 error:;
+ (id)_predicateForSyncEntityIdentity:(uint64_t)a1;
+ (id)_propertiesForEntity;
+ (id)databaseTable;
+ (id)deviceContextEntityWithSyncIdentity:(int64_t)a3 transaction:(id)a4 error:(id *)a5;
+ (id)deviceContextForLocalSyncIdentityWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)foreignKeys;
+ (id)insertDeviceContext:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)lookupDeviceContext:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)lookupOrCreateDeviceContextForLocalSyncIdentityWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)lookupOrCreateDeviceContextForSyncIdentity:(id)a3 WithTransaction:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
@end

@implementation HDDeviceContextEntity

+ (id)databaseTable
{
  return @"device_context";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 7;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDDeviceContextEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (BOOL)enumerateDeviceContextWithTransaction:(id)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 databaseForEntityClass:objc_opt_class()];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__16;
  v26 = __Block_byref_object_dispose__16;
  id v27 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __88__HDDeviceContextEntity_enumerateDeviceContextWithTransaction_error_enumerationHandler___block_invoke;
  v17[3] = &unk_1E62F53E0;
  id v21 = a1;
  id v11 = v8;
  id v18 = v11;
  v20 = &v22;
  id v12 = v9;
  id v19 = v12;
  BOOL v13 = +[HDSQLiteEntity enumerateEntitiesInDatabase:v10 predicate:0 error:a4 enumerationHandler:v17];
  id v14 = (id)v23[5];
  v15 = v14;
  if (v14)
  {
    if (a4) {
      *a4 = v14;
    }
    else {
      _HKLogDroppedError();
    }
  }

  _Block_object_dispose(&v22, 8);
  return v13;
}

uint64_t __88__HDDeviceContextEntity_enumerateDeviceContextWithTransaction_error_enumerationHandler___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  uint64_t v4 = a1[7];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v5 + 40);
  v6 = +[HDDeviceContextEntity _contextForEntity:transaction:error:](v4, a2, v3, (uint64_t)&obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
  {
    uint64_t v7 = a1[5];
    uint64_t v8 = *(void *)(a1[6] + 8);
    id v11 = *(id *)(v8 + 40);
    uint64_t v9 = (*(uint64_t (**)(void))(v7 + 16))();
    objc_storeStrong((id *)(v8 + 40), v11);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)_contextForEntity:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  self;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__16;
  v20 = __Block_byref_object_dispose__16;
  id v21 = 0;
  uint64_t v8 = +[HDDeviceContextEntity _propertiesForEntity]();
  uint64_t v9 = [v7 unprotectedDatabase];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__HDDeviceContextEntity__contextForEntity_transaction_error___block_invoke;
  v13[3] = &unk_1E62F5428;
  id v10 = v7;
  id v14 = v10;
  v15 = &v16;
  LOBYTE(a4) = [v6 getValuesForProperties:v8 database:v9 error:a4 handler:v13];

  if (a4) {
    id v11 = (id)v17[5];
  }
  else {
    id v11 = 0;
  }

  _Block_object_dispose(&v16, 8);

  return v11;
}

+ (id)insertDeviceContext:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 syncIdentity];
  id v11 = +[HDSyncIdentityEntity insertOrLookupConcreteIdentityForIdentity:v10 transaction:v9 error:a5];

  if (v11)
  {
    id v12 = [v9 unprotectedDatabase];
    BOOL v13 = +[HDDeviceContextEntity _propertiesForEntity]();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__HDDeviceContextEntity_insertDeviceContext_transaction_error___block_invoke;
    v17[3] = &unk_1E62F3A88;
    id v18 = v11;
    id v19 = v8;
    id v14 = [a1 insertOrReplaceEntity:0 database:v12 properties:v13 error:a5 bindingHandler:v17];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 11, @"Failed to create/lookup concrete sync identity while inserting device context");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (a5) {
        *a5 = v15;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v14 = 0;
  }

  return v14;
}

+ (id)_propertiesForEntity
{
  v2[6] = *MEMORY[0x1E4F143B8];
  self;
  v2[0] = @"sync_identity_id";
  v2[1] = @"device_type";
  v2[2] = @"currentOS_name";
  v2[3] = @"currentOS_version";
  v2[4] = @"product_type_name";
  v2[5] = @"date_modified";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];

  return v0;
}

uint64_t __63__HDDeviceContextEntity_insertDeviceContext_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) entity];
  MEMORY[0x1C1879E80](a2, @"sync_identity_id", [v4 persistentID]);

  MEMORY[0x1C1879E80](a2, @"device_type", [*(id *)(a1 + 40) type]);
  uint64_t v5 = [*(id *)(a1 + 40) currentOSName];
  MEMORY[0x1C1879EC0](a2, @"currentOS_name", v5);

  id v6 = *(void **)(a1 + 40);
  if (v6) {
    [v6 currentOSVersion];
  }
  id v7 = HKNSOperatingSystemVersionString();
  MEMORY[0x1C1879EC0](a2, @"currentOS_version", v7);

  id v8 = [*(id *)(a1 + 40) productTypeName];
  MEMORY[0x1C1879EC0](a2, @"product_type_name", v8);

  double Current = CFAbsoluteTimeGetCurrent();
  return MEMORY[0x1C1879E50](a2, @"date_modified", Current);
}

+ (BOOL)deleteDeviceContextWithSyncIdentity:(int64_t)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = +[HDDeviceContextEntity _predicateForSyncEntityIdentity:]((uint64_t)a1, a3);
  id v10 = [v8 database];

  LOBYTE(a5) = +[HDHealthEntity deleteEntitiesWithPredicate:v9 healthDatabase:v10 error:a5];
  return (char)a5;
}

+ (id)_predicateForSyncEntityIdentity:(uint64_t)a1
{
  self;
  v3 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v4 = [NSNumber numberWithLongLong:a2];
  uint64_t v5 = [v3 predicateWithProperty:@"sync_identity_id" equalToValue:v4];

  return v5;
}

+ (id)deviceContextForLocalSyncIdentityWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = +[HDDeviceContextEntity _deviceContextWithSyncIdentity:transaction:error:]((uint64_t)a1, [a3 currentSyncIdentityPersistentID], v8, (uint64_t)a5);

  return v9;
}

+ (id)_deviceContextWithSyncIdentity:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6 = a3;
  id v7 = self;
  id v8 = [v7 deviceContextEntityWithSyncIdentity:a2 transaction:v6 error:a4];
  if (v8)
  {
    id v9 = +[HDDeviceContextEntity _contextForEntity:transaction:error:]((uint64_t)v7, v8, v6, a4);
    id v10 = v9;
    if (v9) {
      id v11 = v9;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)lookupOrCreateDeviceContextForLocalSyncIdentityWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [a3 syncIdentityManager];
  id v10 = [v9 currentSyncIdentity];
  id v11 = [a1 lookupOrCreateDeviceContextForSyncIdentity:v10 WithTransaction:v8 error:a5];

  return v11;
}

+ (id)lookupOrCreateDeviceContextForSyncIdentity:(id)a3 WithTransaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 entity];
  id v11 = +[HDDeviceContextEntity _deviceContextWithSyncIdentity:transaction:error:]((uint64_t)a1, [v10 persistentID], v9, (uint64_t)a5);

  if (v11)
  {
    id v12 = v11;
    BOOL v13 = v12;
    goto LABEL_9;
  }
  id v14 = +[HDDeviceContext localProductTypeEnumWithError:a5];
  if (v14)
  {
    id v15 = [HDDeviceContext alloc];
    uint64_t v16 = (int)[v14 intValue];
    v17 = [v8 identity];
    id v12 = [(HDDeviceContext *)v15 initForLocalDeviceWithType:v16 syncIdentity:v17];

    BOOL v13 = +[HDDeviceContextEntity insertDeviceContext:v12 transaction:v9 error:a5];

    if (!v13) {
      goto LABEL_8;
    }
  }
  else
  {
    id v12 = 0;
  }
  id v12 = v12;
  BOOL v13 = v12;
LABEL_8:

LABEL_9:

  return v13;
}

+ (id)lookupDeviceContext:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [a3 syncIdentity];
  uint64_t v14 = 0;
  id v10 = +[HDSyncIdentityEntity concreteIdentityForIdentity:v9 transaction:v8 error:&v14];

  if (v10)
  {
    id v11 = [v10 entity];
    id v12 = +[HDDeviceContextEntity _deviceContextWithSyncIdentity:transaction:error:]((uint64_t)a1, [v11 persistentID], v8, (uint64_t)a5);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (BOOL)updateSoftwareVersionForDeviceContext:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 syncIdentity];
  id v11 = +[HDSyncIdentityEntity concreteIdentityForIdentity:v10 transaction:v9 error:a5];

  if (v11)
  {
    id v12 = [v11 entity];
    BOOL v13 = +[HDDeviceContextEntity _predicateForSyncEntityIdentity:]((uint64_t)a1, [v12 persistentID]);

    v23[0] = @"currentOS_version";
    v23[1] = @"product_type_name";
    v23[2] = @"date_modified";
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
    id v15 = [v9 databaseForEntityClass:a1];
    char v16 = [a1 updateProperties:v14 predicate:v13 database:v15 error:a5 bindingHandler:&__block_literal_global_18];
  }
  else
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    id v18 = NSString;
    id v19 = [v8 syncIdentity];
    v20 = [v18 stringWithFormat:@"No HDConcreteSyncIdentity found with sync identity %@", v19];
    objc_msgSend(v17, "hk_error:description:", 11, v20);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      if (a5) {
        *a5 = v21;
      }
      else {
        _HKLogDroppedError();
      }
    }

    char v16 = 0;
  }

  return v16;
}

uint64_t __81__HDDeviceContextEntity_updateSoftwareVersionForDeviceContext_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  [MEMORY[0x1E4F2B860] currentOSVersionStruct];
  v3 = HKNSOperatingSystemVersionString();
  MEMORY[0x1C1879EC0](a2, @"currentOS_version", v3);

  uint64_t v4 = [MEMORY[0x1E4F2B860] currentDeviceProductType];
  MEMORY[0x1C1879EC0](a2, @"product_type_name", v4);

  double Current = CFAbsoluteTimeGetCurrent();
  return MEMORY[0x1C1879E50](a2, @"date_modified", Current);
}

+ (BOOL)updateDeviceContext:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 syncIdentity];
  id v11 = +[HDSyncIdentityEntity concreteIdentityForIdentity:v10 transaction:v9 error:a5];

  if (v11)
  {
    id v12 = [v11 entity];
    BOOL v13 = +[HDDeviceContextEntity _predicateForSyncEntityIdentity:]((uint64_t)a1, [v12 persistentID]);

    uint64_t v14 = +[HDDeviceContextEntity _propertiesForEntity]();
    id v15 = [v9 databaseForEntityClass:a1];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__HDDeviceContextEntity_updateDeviceContext_transaction_error___block_invoke;
    v18[3] = &unk_1E62F3A88;
    id v19 = v11;
    id v20 = v8;
    char v16 = [a1 updateProperties:v14 predicate:v13 database:v15 error:a5 bindingHandler:v18];
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

uint64_t __63__HDDeviceContextEntity_updateDeviceContext_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) entity];
  MEMORY[0x1C1879E80](a2, @"sync_identity_id", [v4 persistentID]);

  MEMORY[0x1C1879E80](a2, @"device_type", [*(id *)(a1 + 40) type]);
  uint64_t v5 = [*(id *)(a1 + 40) currentOSName];
  MEMORY[0x1C1879EC0](a2, @"currentOS_name", v5);

  id v6 = *(void **)(a1 + 40);
  if (v6) {
    [v6 currentOSVersion];
  }
  id v7 = HKNSOperatingSystemVersionString();
  MEMORY[0x1C1879EC0](a2, @"currentOS_version", v7);

  id v8 = [*(id *)(a1 + 40) productTypeName];
  MEMORY[0x1C1879EC0](a2, @"product_type_name", v8);

  double Current = CFAbsoluteTimeGetCurrent();
  return MEMORY[0x1C1879E50](a2, @"date_modified", Current);
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"sync_identity_id";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

void __61__HDDeviceContextEntity__contextForEntity_transaction_error___block_invoke(uint64_t a1)
{
  long long v19 = 0uLL;
  uint64_t v20 = 0;
  v2 = HDSQLiteColumnWithNameAsString();
  HKNSOperatingSystemVersionFromString();

  uint64_t v3 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v4 = *(void *)(a1 + 32);
  id v18 = 0;
  uint64_t v5 = +[HDSyncIdentityEntity concreteIdentityForPersistentID:v3 transaction:v4 error:&v18];
  id v6 = v18;
  if (v5)
  {
    id v7 = [HDDeviceContext alloc];
    uint64_t v8 = HDSQLiteColumnWithNameAsInt64();
    id v9 = HDSQLiteColumnWithNameAsString();
    id v10 = HDSQLiteColumnWithNameAsString();
    id v11 = HDSQLiteColumnWithNameAsDate();
    id v12 = [v5 identity];
    long long v16 = v19;
    uint64_t v17 = v20;
    uint64_t v13 = [(HDDeviceContext *)v7 initWithType:v8 productTypeName:v9 currentOSName:v10 currentOSVersion:&v16 modificationDate:v11 syncIdentity:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

+ (id)deviceContextEntityWithSyncIdentity:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [v8 databaseForEntityClass:objc_opt_class()];

  id v10 = +[HDDeviceContextEntity _predicateForSyncEntityIdentity:]((uint64_t)a1, a3);
  id v11 = [a1 anyInDatabase:v9 predicate:v10 error:a5];

  return v11;
}

@end