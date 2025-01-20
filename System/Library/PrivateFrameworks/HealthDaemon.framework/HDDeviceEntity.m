@interface HDDeviceEntity
+ (BOOL)insertCodableDevices:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (HDDeviceEntity)deviceEntityWithDevice:(id)a3 syncIdentity:(int64_t)a4 healthDatabase:(id)a5 error:(id *)a6;
+ (HDDeviceEntity)deviceEntityWithDevice:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (HDDeviceEntity)deviceEntityWithUUID:(id)a3 healthDatabase:(id)a4 error:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_codableDeviceWithRow:(HDSQLiteRow *)a3;
+ (id)_deviceEntitiesWithPredicate:(void *)a3 healthDatabase:(uint64_t)a4 error:;
+ (id)_insertDeviceWithUUID:(id)a3 creationDate:(double)a4 name:(id)a5 manufacturer:(id)a6 model:(id)a7 hardwareVersion:(id)a8 firmwareVersion:(id)a9 softwareVersion:(id)a10 localIdentifier:(id)a11 UDIDeviceIdentifier:(id)a12 syncProvenance:(int64_t)a13 syncIdentity:(int64_t)a14 database:(id)a15 error:(id *)a16;
+ (id)_predicateForDevice:(uint64_t)a1;
+ (id)_propertiesForDevice;
+ (id)databaseTable;
+ (id)deviceEntitiesWithDevice:(id)a3 healthDatabase:(id)a4 error:(id *)a5;
+ (id)deviceEntitiesWithProperty:(id)a3 matchingValues:(id)a4 healthDatabase:(id)a5 error:(id *)a6;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
- (id)creationDateInHealthDatabase:(id)a3 error:(id *)a4;
- (id)deviceInHealthDatabase:(id)a3 error:(id *)a4;
- (id)deviceUUIDInDatabase:(id)a3 error:(id *)a4;
- (id)deviceUUIDInHealthDatabase:(id)a3 error:(id *)a4;
@end

@implementation HDDeviceEntity

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)_predicateForDevice:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v5 = [v2 name];
  v6 = (void *)v5;
  v7 = (void *)*MEMORY[0x1E4F299D0];
  if (v5) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = *MEMORY[0x1E4F299D0];
  }
  v9 = [v4 predicateWithProperty:@"name" equalToValue:v8];
  [v3 addObject:v9];

  v10 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v11 = [v2 manufacturer];
  v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = (uint64_t)v7;
  }
  v14 = [v10 predicateWithProperty:@"manufacturer" equalToValue:v13];
  [v3 addObject:v14];

  v15 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v16 = [v2 model];
  v17 = (void *)v16;
  if (v16) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = (uint64_t)v7;
  }
  v19 = [v15 predicateWithProperty:@"model" equalToValue:v18];
  [v3 addObject:v19];

  v20 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v21 = [v2 hardwareVersion];
  v22 = (void *)v21;
  if (v21) {
    uint64_t v23 = v21;
  }
  else {
    uint64_t v23 = (uint64_t)v7;
  }
  v24 = [v20 predicateWithProperty:@"hardware" equalToValue:v23];
  [v3 addObject:v24];

  v25 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v26 = [v2 firmwareVersion];
  v27 = (void *)v26;
  if (v26) {
    uint64_t v28 = v26;
  }
  else {
    uint64_t v28 = (uint64_t)v7;
  }
  v29 = [v25 predicateWithProperty:@"firmware" equalToValue:v28];
  [v3 addObject:v29];

  v30 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v31 = [v2 softwareVersion];
  v32 = (void *)v31;
  if (v31) {
    uint64_t v33 = v31;
  }
  else {
    uint64_t v33 = (uint64_t)v7;
  }
  v34 = [v30 predicateWithProperty:@"software" equalToValue:v33];
  [v3 addObject:v34];

  v35 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v36 = [v2 localIdentifier];
  v37 = (void *)v36;
  if (v36) {
    uint64_t v38 = v36;
  }
  else {
    uint64_t v38 = (uint64_t)v7;
  }
  v39 = [v35 predicateWithProperty:@"localIdentifier" equalToValue:v38];
  [v3 addObject:v39];

  v40 = (void *)MEMORY[0x1E4F65D00];
  v41 = [v2 UDIDeviceIdentifier];

  if (v41) {
    v42 = v41;
  }
  else {
    v42 = v7;
  }
  v43 = [v40 predicateWithProperty:@"FDAUDI" equalToValue:v42];
  [v3 addObject:v43];

  if ((unint64_t)[v3 count] < 2) {
    [v3 firstObject];
  }
  else {
  v44 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v3];
  }

  return v44;
}

+ (id)propertyForSyncProvenance
{
  return @"sync_provenance";
}

- (id)deviceUUIDInDatabase:(id)a3 error:(id *)a4
{
  return [(HDSQLiteEntity *)self UUIDForProperty:@"uuid" database:a3];
}

- (id)deviceInHealthDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[HDDeviceEntity _propertiesForDevice];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__206;
  v20 = __Block_byref_object_dispose__206;
  id v21 = 0;
  uint64_t v8 = objc_opt_class();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__HDDeviceEntity_deviceInHealthDatabase_error___block_invoke;
  v13[3] = &unk_1E62F5CB0;
  v13[4] = self;
  id v9 = v7;
  id v14 = v9;
  v15 = &v16;
  if ([v8 performReadTransactionWithHealthDatabase:v6 error:a4 block:v13]) {
    v10 = (void *)v17[5];
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  _Block_object_dispose(&v16, 8);

  return v11;
}

+ (id)_propertiesForDevice
{
  v4[11] = *MEMORY[0x1E4F143B8];
  v4[0] = @"uuid";
  v4[1] = @"creation_date";
  v4[2] = @"name";
  v4[3] = @"manufacturer";
  v4[4] = @"model";
  v4[5] = @"hardware";
  v4[6] = @"firmware";
  v4[7] = @"software";
  v4[8] = @"localIdentifier";
  v4[9] = @"FDAUDI";
  v4[10] = @"sync_identity";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:11];

  return v2;
}

uint64_t __47__HDDeviceEntity_deviceInHealthDatabase_error___block_invoke(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 databaseForEntity:a1[4]];
  v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__HDDeviceEntity_deviceInHealthDatabase_error___block_invoke_2;
  v11[3] = &unk_1E62F8848;
  v11[4] = a1[6];
  [v4 getValuesForProperties:v5 database:v3 handler:v11];
  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
    {
      v7 = (void *)a1[4];
      uint64_t v8 = v6;
      uint64_t v9 = [v7 persistentID];
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_INFO, "Missing database device entity %lld", buf, 0xCu);
    }
  }

  return 1;
}

void __47__HDDeviceEntity_deviceInHealthDatabase_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = self;
  if (!a3)
  {
    uint64_t v18 = v4;
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:sel__deviceWithRow_, v18, @"HDDeviceEntity.m", 461, @"Invalid parameter not satisfying: %@", @"row != NULL" object file lineNumber description];
  }
  id v5 = objc_alloc(MEMORY[0x1E4F2AEF8]);
  id v6 = HDSQLiteColumnWithNameAsString();
  v7 = HDSQLiteColumnWithNameAsString();
  uint64_t v8 = HDSQLiteColumnWithNameAsString();
  uint64_t v9 = HDSQLiteColumnWithNameAsString();
  v10 = HDSQLiteColumnWithNameAsString();
  id v11 = HDSQLiteColumnWithNameAsString();
  v12 = HDSQLiteColumnWithNameAsString();
  uint64_t v13 = HDSQLiteColumnWithNameAsString();
  uint64_t v14 = (void *)[v5 initWithName:v6 manufacturer:v7 model:v8 hardwareVersion:v9 firmwareVersion:v10 softwareVersion:v11 localIdentifier:v12 UDIDeviceIdentifier:v13];

  v15 = HDSQLiteColumnWithNameAsDate();
  [v14 _setCreationDate:v15];

  uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v14;
}

+ (HDDeviceEntity)deviceEntityWithUUID:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  self;
  v10 = (void *)MEMORY[0x1E4F65D00];
  id v11 = _HDSQLiteValueForUUID();

  v12 = [v10 predicateWithProperty:@"uuid" equalToValue:v11];

  uint64_t v13 = [a1 anyWithPredicate:v12 healthDatabase:v8 error:a5];

  return (HDDeviceEntity *)v13;
}

+ (id)databaseTable
{
  return @"source_devices";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 13;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_106;
}

+ (id)uniquedColumns
{
  v4[11] = *MEMORY[0x1E4F143B8];
  v4[0] = @"name";
  v4[1] = @"manufacturer";
  v4[2] = @"model";
  v4[3] = @"hardware";
  v4[4] = @"firmware";
  v4[5] = @"software";
  v4[6] = @"localIdentifier";
  v4[7] = @"FDAUDI";
  v4[8] = @"sync_provenance";
  v4[9] = @"uuid";
  v4[10] = @"sync_identity";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:11];

  return v2;
}

+ (HDDeviceEntity)deviceEntityWithDevice:(id)a3 syncIdentity:(int64_t)a4 healthDatabase:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__206;
  v34 = __Block_byref_object_dispose__206;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__206;
  uint64_t v28 = __Block_byref_object_dispose__206;
  id v29 = 0;
  id obj = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__HDDeviceEntity_deviceEntityWithDevice_syncIdentity_healthDatabase_error___block_invoke;
  v17[3] = &unk_1E630E908;
  id v21 = a1;
  v19 = &v24;
  id v12 = v10;
  int64_t v22 = a4;
  id v18 = v12;
  v20 = &v30;
  [a1 performWriteTransactionWithHealthDatabase:v11 error:&obj block:v17];
  objc_storeStrong(&v35, obj);
  id v13 = (id)v31[5];
  uint64_t v14 = v13;
  if (v13)
  {
    if (a6) {
      *a6 = v13;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v15 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);

  return (HDDeviceEntity *)v15;
}

BOOL __75__HDDeviceEntity_deviceEntityWithDevice_syncIdentity_healthDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = a2;
  v7 = [v6 databaseForEntityClass:v5];
  uint64_t v8 = [*(id *)(a1 + 56) deviceEntityWithDevice:*(void *)(a1 + 32) transaction:v6 error:a3];

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v36 = *(void **)(a1 + 56);
    v40 = [MEMORY[0x1E4F29128] UUID];
    v37 = [MEMORY[0x1E4F1C9C8] date];
    [v37 timeIntervalSinceReferenceDate];
    double v12 = v11;
    v39 = [*(id *)(a1 + 32) name];
    id v13 = [*(id *)(a1 + 32) manufacturer];
    uint64_t v14 = [*(id *)(a1 + 32) model];
    id v15 = [*(id *)(a1 + 32) hardwareVersion];
    uint64_t v16 = [*(id *)(a1 + 32) firmwareVersion];
    v17 = [*(id *)(a1 + 32) softwareVersion];
    id v18 = [*(id *)(a1 + 32) localIdentifier];
    v19 = [*(id *)(a1 + 32) UDIDeviceIdentifier];
    uint64_t v20 = *(void *)(a1 + 64);
    uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v21 + 40);
    uint64_t v38 = v7;
    uint64_t v22 = [v36 _insertDeviceWithUUID:v40 creationDate:v39 name:v13 manufacturer:v14 model:v15 hardwareVersion:v16 firmwareVersion:v12 softwareVersion:v17 localIdentifier:v18 UDIDeviceIdentifier:v19 syncProvenance:0 syncIdentity:v20 database:v7 error:&obj];
    objc_storeStrong((id *)(v21 + 40), obj);
    uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;

    uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    _HKInitializeLogging();
    uint64_t v26 = *MEMORY[0x1E4F29F18];
    v27 = *MEMORY[0x1E4F29F18];
    if (v25)
    {
      v7 = v38;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v28 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        id v29 = v26;
        uint64_t v30 = [v28 persistentID];
        uint64_t v31 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        uint64_t v43 = v30;
        __int16 v44 = 2114;
        uint64_t v45 = v31;
        _os_log_debug_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_DEBUG, "Inserted new device entity %lld for device: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v7 = v38;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v32 = *(void *)(a1 + 32);
        uint64_t v33 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v43 = v32;
        __int16 v44 = 2114;
        uint64_t v45 = v33;
        _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_INFO, "Insert new device %@ failed: %{public}@", buf, 0x16u);
      }
    }
  }
  BOOL v34 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;

  return v34;
}

+ (id)deviceEntitiesWithDevice:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = +[HDDeviceEntity _predicateForDevice:]((uint64_t)a1, a3);
  id v10 = +[HDDeviceEntity _deviceEntitiesWithPredicate:healthDatabase:error:]((uint64_t)a1, v9, v8, (uint64_t)a5);

  return v10;
}

+ (id)_deviceEntitiesWithPredicate:(void *)a3 healthDatabase:(uint64_t)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  id v8 = self;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__206;
  uint64_t v21 = __Block_byref_object_dispose__206;
  id v22 = [MEMORY[0x1E4F1CA48] array];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__HDDeviceEntity__deviceEntitiesWithPredicate_healthDatabase_error___block_invoke;
  v13[3] = &unk_1E62F6778;
  uint64_t v16 = v8;
  id v9 = v6;
  id v14 = v9;
  id v15 = &v17;
  if ([v8 performReadTransactionWithHealthDatabase:v7 error:a4 block:v13]) {
    id v10 = (void *)v18[5];
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  _Block_object_dispose(&v17, 8);

  return v11;
}

+ (id)deviceEntitiesWithProperty:(id)a3 matchingValues:(id)a4 healthDatabase:(id)a5 error:(id *)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a3;
  id v12 = a4;
  self;
  id v13 = v11;
  self;
  uint64_t v14 = *MEMORY[0x1E4F299F0];
  *(void *)&long long v33 = *MEMORY[0x1E4F29A00];
  *((void *)&v33 + 1) = v14;
  v32[0] = @"name";
  v32[1] = @"manufacturer";
  uint64_t v15 = *MEMORY[0x1E4F299E0];
  *(void *)&long long v34 = *MEMORY[0x1E4F299F8];
  *((void *)&v34 + 1) = v15;
  v32[2] = @"model";
  v32[3] = @"hardware";
  uint64_t v16 = *MEMORY[0x1E4F29A08];
  *(void *)&long long v35 = *MEMORY[0x1E4F299D8];
  *((void *)&v35 + 1) = v16;
  v32[4] = @"firmware";
  v32[5] = @"software";
  uint64_t v17 = *MEMORY[0x1E4F29A10];
  *(void *)&long long v36 = *MEMORY[0x1E4F299E8];
  *((void *)&v36 + 1) = v17;
  v32[6] = @"localIdentifier";
  v32[7] = @"FDAUDI";
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v33 count:8];
  uint64_t v19 = [v18 objectForKeyedSubscript:v13];

  if (v19)
  {
    id v30 = v10;
    uint64_t v31 = a6;
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v21 = v12;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v32 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = [MEMORY[0x1E4F65D00] predicateWithProperty:v19 equalToValue:*(void *)(*((void *)&v33 + 1) + 8 * i)];
          [v20 addObject:v26];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v32 count:16];
      }
      while (v23);
    }

    if ((unint64_t)[v20 count] < 2) {
      [v20 firstObject];
    }
    else {
    v27 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v20];
    }
    id v10 = v30;
    a6 = v31;
  }
  else
  {
    v27 = [MEMORY[0x1E4F65D58] falsePredicate];
  }

  uint64_t v28 = +[HDDeviceEntity _deviceEntitiesWithPredicate:healthDatabase:error:]((uint64_t)a1, v27, v10, (uint64_t)a6);

  return v28;
}

uint64_t __68__HDDeviceEntity__deviceEntitiesWithPredicate_healthDatabase_error___block_invoke(void *a1, void *a2)
{
  id v3 = [a2 databaseForEntityClass:a1[6]];
  uint64_t v4 = a1[4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__HDDeviceEntity__deviceEntitiesWithPredicate_healthDatabase_error___block_invoke_2;
  v7[3] = &unk_1E630E930;
  uint64_t v5 = (void *)a1[6];
  v7[4] = a1[5];
  [v5 enumerateEntitiesInDatabase:v3 predicate:v4 error:0 enumerationHandler:v7];

  return 1;
}

uint64_t __68__HDDeviceEntity__deviceEntitiesWithPredicate_healthDatabase_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class()) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }

  return 1;
}

+ (HDDeviceEntity)deviceEntityWithDevice:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 databaseForEntityClass:a1];
  id v10 = +[HDDeviceEntity _predicateForDevice:]((uint64_t)a1, v8);

  id v11 = [a1 anyInDatabase:v9 predicate:v10 error:a5];

  return (HDDeviceEntity *)v11;
}

- (id)deviceUUIDInHealthDatabase:(id)a3 error:(id *)a4
{
  uint64_t v4 = [(HDHealthEntity *)self valueForProperty:@"uuid" healthDatabase:a3 error:a4];
  uint64_t v5 = _HDUUIDForSQLiteValue();

  return v5;
}

- (id)creationDateInHealthDatabase:(id)a3 error:(id *)a4
{
  uint64_t v4 = [(HDHealthEntity *)self valueForProperty:@"creation_date" healthDatabase:a3 error:a4];
  uint64_t v5 = _HDDateForSQLiteValue();

  return v5;
}

+ (id)_insertDeviceWithUUID:(id)a3 creationDate:(double)a4 name:(id)a5 manufacturer:(id)a6 model:(id)a7 hardwareVersion:(id)a8 firmwareVersion:(id)a9 softwareVersion:(id)a10 localIdentifier:(id)a11 UDIDeviceIdentifier:(id)a12 syncProvenance:(int64_t)a13 syncIdentity:(int64_t)a14 database:(id)a15 error:(id *)a16
{
  id v53 = a3;
  id v23 = a5;
  id v24 = a6;
  id v25 = a7;
  id v26 = a8;
  id v50 = a9;
  id v51 = a10;
  id v52 = a11;
  id v27 = a12;
  id v28 = a15;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __204__HDDeviceEntity__insertDeviceWithUUID_creationDate_name_manufacturer_model_hardwareVersion_firmwareVersion_softwareVersion_localIdentifier_UDIDeviceIdentifier_syncProvenance_syncIdentity_database_error___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EBA18E68 != -1) {
    dispatch_once(&qword_1EBA18E68, block);
  }
  uint64_t v29 = _MergedGlobals_225;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __204__HDDeviceEntity__insertDeviceWithUUID_creationDate_name_manufacturer_model_hardwareVersion_firmwareVersion_softwareVersion_localIdentifier_UDIDeviceIdentifier_syncProvenance_syncIdentity_database_error___block_invoke_2;
  v56[3] = &unk_1E630E958;
  id v54 = v53;
  id v57 = v54;
  double v66 = a4;
  id v30 = v23;
  id v58 = v30;
  id v31 = v24;
  id v59 = v31;
  id v32 = v25;
  id v60 = v32;
  id v33 = v26;
  id v61 = v33;
  id v34 = v50;
  id v62 = v34;
  id v35 = v51;
  id v63 = v35;
  id v36 = v52;
  id v64 = v36;
  id v37 = v27;
  id v65 = v37;
  int64_t v67 = a13;
  int64_t v68 = a14;
  int v38 = [v28 executeSQL:v29 error:a16 bindingHandler:v56 enumerationHandler:0];
  v39 = 0;
  if (v38)
  {
    [v28 lastInsertRowID];
    id v55 = v37;
    id v40 = v36;
    id v41 = v35;
    id v42 = v34;
    id v43 = v33;
    id v44 = v32;
    id v45 = v31;
    id v46 = v28;
    v48 = id v47 = v30;
    v39 = +[HDSQLiteEntity entityWithPersistentID:v48];

    id v30 = v47;
    id v28 = v46;
    id v31 = v45;
    id v32 = v44;
    id v33 = v43;
    id v34 = v42;
    id v35 = v41;
    id v36 = v40;
    id v37 = v55;
  }

  return v39;
}

void __204__HDDeviceEntity__insertDeviceWithUUID_creationDate_name_manufacturer_model_hardwareVersion_firmwareVersion_softwareVersion_localIdentifier_UDIDeviceIdentifier_syncProvenance_syncIdentity_database_error___block_invoke(uint64_t a1)
{
  id v2 = [NSString alloc];
  uint64_t v5 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v3 = objc_msgSend(v2, "initWithFormat:", @"INSERT INTO %@ (%@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);",
         v5,
         @"uuid",
         @"creation_date",
         @"name",
         @"manufacturer",
         @"model",
         @"hardware",
         @"firmware",
         @"software",
         @"localIdentifier",
         @"FDAUDI",
         @"sync_provenance",
         @"sync_identity",
         0);
  uint64_t v4 = (void *)_MergedGlobals_225;
  _MergedGlobals_225 = v3;
}

uint64_t __204__HDDeviceEntity__insertDeviceWithUUID_creationDate_name_manufacturer_model_hardwareVersion_firmwareVersion_softwareVersion_localIdentifier_UDIDeviceIdentifier_syncProvenance_syncIdentity_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "hk_dataForUUIDBytes");
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_double(a2, 2, *(double *)(a1 + 104));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 11, *(void *)(a1 + 112));
  sqlite3_int64 v5 = *(void *)(a1 + 120);

  return sqlite3_bind_int64(a2, 12, v5);
}

+ (BOOL)insertCodableDevices:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [v11 database];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__HDDeviceEntity_insertCodableDevices_syncProvenance_profile_error___block_invoke;
  v16[3] = &unk_1E62F5200;
  id v17 = v10;
  id v18 = v11;
  id v19 = a1;
  int64_t v20 = a4;
  id v13 = v11;
  id v14 = v10;
  LOBYTE(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v12 error:a6 block:v16];

  return (char)a6;
}

uint64_t __68__HDDeviceEntity_insertCodableDevices_syncProvenance_profile_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 databaseForEntityClass:*(void *)(a1 + 48)];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = MEMORY[0x1E4F143A8];
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v15 = *(id *)(a1 + 40);
        id v16 = v3;
        id v17 = v4;
        int v10 = HKWithAutoreleasePool();

        if (!v10)
        {
          uint64_t v11 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16, v13, 3221225472, __68__HDDeviceEntity_insertCodableDevices_syncProvenance_profile_error___block_invoke_2, &unk_1E630E980, v14);
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 1;
LABEL_11:

  return v11;
}

uint64_t __68__HDDeviceEntity_insertCodableDevices_syncProvenance_profile_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = *(id *)(a1 + 32);
  self;
  id v5 = (void *)MEMORY[0x1E4F29128];
  uint64_t v6 = [v4 uuid];
  uint64_t v7 = objc_msgSend(v5, "hk_UUIDWithData:", v6);

  if (v7)
  {
    if ([v4 hasCreationDate])
    {

      goto LABEL_8;
    }
    uint64_t v8 = @"missing creation date for codable device";
  }
  else
  {
    uint64_t v8 = @"missing UUID for codable device";
  }
  id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", objc_opt_class(), sel__validateCodableDevice_error_, v8);

  if (v9)
  {
    id v10 = 0;
LABEL_15:
    if (objc_msgSend(v10, "hd_isConstraintViolation"))
    {
      id v33 = 0;
      goto LABEL_17;
    }
    _HKInitializeLogging();
    id v35 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v53 = v10;
      _os_log_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_INFO, "Failed to insert codable device: %{public}@", buf, 0xCu);
    }
    id v36 = v10;
    id v13 = v36;
    if (v36)
    {
      if (a2)
      {
        id v13 = v36;
        *a2 = v13;
      }
      else
      {
        _HKLogDroppedError();
      }
      id v10 = v13;
    }
    else
    {
      id v10 = 0;
    }
LABEL_40:

    id v33 = 0;
    uint64_t v34 = 0;
    goto LABEL_41;
  }
LABEL_8:
  uint64_t v11 = (void *)MEMORY[0x1E4F29128];
  id v12 = [*(id *)(a1 + 32) uuid];
  objc_msgSend(v11, "hk_UUIDWithData:", v12);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v14 = [*(id *)(a1 + 40) syncIdentityManager];
  id v15 = [v14 legacySyncIdentity];

  if ([*(id *)(a1 + 32) hasSyncIdentity])
  {
    id v16 = [*(id *)(a1 + 32) syncIdentity];
    id v51 = 0;
    id v17 = +[HDSyncIdentity syncIdentityWithCodable:v16 error:&v51];
    id v18 = v51;

    if (v17)
    {
      long long v19 = [*(id *)(a1 + 40) syncIdentityManager];
      uint64_t v20 = *(void *)(a1 + 48);
      id v50 = v18;
      uint64_t v21 = [v19 concreteIdentityForIdentity:v17 shouldCreate:1 transaction:v20 error:&v50];
      id v22 = v50;

      if (v21)
      {
        v48 = v13;
        id v41 = a2;

        uint64_t v23 = v22;
        id v24 = (void *)v21;
        goto LABEL_13;
      }
      _HKInitializeLogging();
      int v38 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v53 = v22;
        _os_log_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_INFO, "ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
      }
      id v39 = v22;
      id v15 = v39;
      if (v39)
      {
        if (a2)
        {
          id v15 = v39;
          *a2 = v15;
        }
        else
        {
          _HKLogDroppedError();
        }
        id v10 = v15;
      }
      else
      {
        id v10 = 0;
      }
    }
    else
    {
      _HKInitializeLogging();
      id v37 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v53 = v18;
        _os_log_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_INFO, "SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
      }
      id v10 = v18;
      if (v10)
      {
        if (a2) {
          *a2 = v10;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    goto LABEL_40;
  }
  id v24 = v15;
  v48 = v13;
  id v41 = a2;
  uint64_t v23 = 0;
LABEL_13:
  [*(id *)(a1 + 32) creationDate];
  double v26 = v25;
  id v47 = [*(id *)(a1 + 32) name];
  id v46 = [*(id *)(a1 + 32) manufacturer];
  id v45 = [*(id *)(a1 + 32) model];
  id v44 = [*(id *)(a1 + 32) hardwareVersion];
  id v27 = [*(id *)(a1 + 32) firmwareVersion];
  id v43 = [*(id *)(a1 + 32) softwareVersion];
  id v42 = [*(id *)(a1 + 32) localIdentifier];
  id v28 = [*(id *)(a1 + 32) fDAUDI];
  uint64_t v29 = *(void *)(a1 + 72);
  id v30 = [v24 entity];
  uint64_t v31 = [v30 persistentID];
  uint64_t v32 = *(void *)(a1 + 56);
  id v49 = v23;
  id v33 = +[HDDeviceEntity _insertDeviceWithUUID:v48 creationDate:v47 name:v46 manufacturer:v45 model:v44 hardwareVersion:v27 firmwareVersion:v26 softwareVersion:v43 localIdentifier:v42 UDIDeviceIdentifier:v28 syncProvenance:v29 syncIdentity:v31 database:v32 error:&v49];
  id v10 = v49;

  if (!v33)
  {
    a2 = v41;
    goto LABEL_15;
  }
LABEL_17:
  uint64_t v34 = 1;
LABEL_41:

  return v34;
}

+ (id)_codableDeviceWithRow:(HDSQLiteRow *)a3
{
  if (!a3)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"HDDeviceEntity.m", 478, @"Invalid parameter not satisfying: %@", @"row != NULL" object file lineNumber description];
  }
  id v3 = objc_alloc_init(HDCodableDevice);
  id v4 = HDSQLiteColumnWithNameAsData();
  [(HDCodableDevice *)v3 setUuid:v4];

  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableDevice setCreationDate:](v3, "setCreationDate:");
  id v5 = HDSQLiteColumnWithNameAsNonEmptyString();
  [(HDCodableDevice *)v3 setName:v5];

  uint64_t v6 = HDSQLiteColumnWithNameAsNonEmptyString();
  [(HDCodableDevice *)v3 setManufacturer:v6];

  uint64_t v7 = HDSQLiteColumnWithNameAsNonEmptyString();
  [(HDCodableDevice *)v3 setModel:v7];

  uint64_t v8 = HDSQLiteColumnWithNameAsNonEmptyString();
  [(HDCodableDevice *)v3 setHardwareVersion:v8];

  id v9 = HDSQLiteColumnWithNameAsNonEmptyString();
  [(HDCodableDevice *)v3 setFirmwareVersion:v9];

  id v10 = HDSQLiteColumnWithNameAsNonEmptyString();
  [(HDCodableDevice *)v3 setSoftwareVersion:v10];

  uint64_t v11 = HDSQLiteColumnWithNameAsNonEmptyString();
  [(HDCodableDevice *)v3 setLocalIdentifier:v11];

  id v12 = HDSQLiteColumnWithNameAsNonEmptyString();
  [(HDCodableDevice *)v3 setFDAUDI:v12];

  return v3;
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

@end