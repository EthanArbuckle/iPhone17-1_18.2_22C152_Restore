@interface HDKeyValueEntity
+ (BOOL)_doInsertValues:(void *)a3 forKeys:(void *)a4 modificationDates:(void *)a5 domain:(uint64_t)a6 category:(uint64_t)a7 provenance:(uint64_t)a8 syncIdentity:(uint64_t)a9 updatePolicy:(void *)a10 database:(uint64_t)a11 error:;
+ (BOOL)_enumerateKeyValueEntitiesInCategory:(int64_t)a3 predicate:(id)a4 healthDatabase:(id)a5 error:(id *)a6 usingBlock:(id)a7;
+ (BOOL)_insertCodableCategoryDomainDictionary:(id)a3 provenance:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)_insertCodableTimestampedKeyValuePairs:(id)a3 domain:(id)a4 category:(int64_t)a5 provenance:(int64_t)a6 syncIdentity:(int64_t)a7 profile:(id)a8 error:(id *)a9;
+ (BOOL)_insertCodableTimestampedKeyValuePairs:(id)a3 domain:(id)a4 category:(int64_t)a5 provenance:(int64_t)a6 syncIdentity:(int64_t)a7 updatePolicy:(int64_t)a8 profile:(id)a9 error:(id *)a10;
+ (BOOL)_insertKeysAndValues:(id)a3 modificationDate:(id)a4 domain:(id)a5 category:(int64_t)a6 provenance:(int64_t)a7 syncIdentity:(int64_t)a8 updatePolicy:(int64_t)a9 profile:(id)a10 error:(id *)a11;
+ (BOOL)_insertValues:(id)a3 forKeys:(id)a4 modificationDates:(id)a5 domain:(id)a6 category:(int64_t)a7 provenance:(int64_t)a8 syncIdentity:(int64_t)a9 updatePolicy:(int64_t)a10 profile:(id)a11 error:(id *)a12;
+ (BOOL)_setRawKeysAndValues:(id)a3 domain:(id)a4 category:(int64_t)a5 syncIdentity:(int64_t)a6 database:(id)a7 error:(id *)a8;
+ (BOOL)enumerateValuesForDomain:(id)a3 category:(int64_t)a4 keys:(id)a5 profile:(id)a6 error:(id *)a7 usingBlock:(id)a8;
+ (BOOL)persistDatabaseIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)persistDatabaseIdentifier:(id)a3 syncIdentity:(int64_t)a4 database:(id)a5 error:(id *)a6;
+ (BOOL)removeValuesForDomain:(id)a3 category:(int64_t)a4 keys:(id)a5 profile:(id)a6 error:(id *)a7;
+ (BOOL)setData:(id)a3 forKey:(id)a4 domain:(id)a5 category:(int64_t)a6 profile:(id)a7 error:(id *)a8;
+ (BOOL)setData:(id)a3 forKey:(id)a4 domain:(id)a5 category:(int64_t)a6 syncIdentity:(int64_t)a7 profile:(id)a8 error:(id *)a9;
+ (BOOL)setDate:(id)a3 forKey:(id)a4 domain:(id)a5 category:(int64_t)a6 profile:(id)a7 error:(id *)a8;
+ (BOOL)setDateComponents:(id)a3 forKey:(id)a4 domain:(id)a5 category:(int64_t)a6 profile:(id)a7 error:(id *)a8;
+ (BOOL)setNumber:(id)a3 forKey:(id)a4 domain:(id)a5 category:(int64_t)a6 profile:(id)a7 error:(id *)a8;
+ (BOOL)setOkemoZursObjectAnchor:(int64_t)a3 syncIdentity:(int64_t)a4 database:(id)a5 error:(id *)a6;
+ (BOOL)setQuantity:(id)a3 unit:(id)a4 forKey:(id)a5 domain:(id)a6 category:(int64_t)a7 profile:(id)a8 error:(id *)a9;
+ (BOOL)setString:(id)a3 forKey:(id)a4 domain:(id)a5 category:(int64_t)a6 profile:(id)a7 error:(id *)a8;
+ (BOOL)setValueForAllKeys:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 error:(id *)a7;
+ (BOOL)setValuesWithDictionary:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 error:(id *)a7;
+ (Class)_entityClassForKeyValueCategory:(int64_t)a3;
+ (const)_insertStatementKey;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_modDateForKey:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 entity:(id *)a7 error:(id *)a8;
+ (id)_predicateForCategory:(uint64_t)a1;
+ (id)_predicateForDomain:(uint64_t)a1;
+ (id)_predicateForKeys:(uint64_t)a1;
+ (id)_rawValueForKey:(void *)a3 domain:(uint64_t)a4 category:(void *)a5 profile:(void *)a6 entity:(uint64_t)a7 error:;
+ (id)_rawValuesForKeys:(id)a3 domain:(id)a4 category:(int64_t)a5 database:(id)a6 error:(id *)a7;
+ (id)_valuesForKeys:(void *)a3 domain:(uint64_t)a4 category:(void *)a5 profile:(uint64_t)a6 error:(void *)a7 handler:;
+ (id)allValuesForDomain:(id)a3 category:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (id)dataForKey:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 entity:(id *)a7 error:(id *)a8;
+ (id)databaseTable;
+ (id)dateComponentsForKey:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 entity:(id *)a7 error:(id *)a8;
+ (id)dateForKey:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 entity:(id *)a7 error:(id *)a8;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)generateNewDatabaseIdentifier;
+ (id)modificationDatesForKeys:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 error:(id *)a7;
+ (id)numberForKey:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 entity:(id *)a7 error:(id *)a8;
+ (id)okemoZursObjectAnchorWithProfile:(id)a3 error:(id *)a4;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (id)quantityForKey:(id)a3 unit:(id)a4 domain:(id)a5 category:(int64_t)a6 profile:(id)a7 entity:(id *)a8 error:(id *)a9;
+ (id)retrieveDatabaseIdentifierCreationDateFromProfile:(id)a3 error:(id *)a4;
+ (id)retrieveDatabaseIdentifierFromDatabase:(id)a3 error:(id *)a4;
+ (id)retrieveDatabaseIdentifierFromProfile:(id)a3 error:(id *)a4;
+ (id)stringForKey:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 entity:(id *)a7 error:(id *)a8;
+ (id)uniquedColumns;
+ (id)valuesForKeys:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 error:(id *)a7;
+ (int64_t)_deviceLocalCategory;
+ (uint64_t)_readRawValuesInCategory:(void *)a3 predicate:(void *)a4 database:(uint64_t)a5 error:(void *)a6 usingBlock:;
+ (uint64_t)_setRawKeysAndValues:(void *)a3 domain:(uint64_t)a4 category:(void *)a5 profile:(uint64_t)a6 error:;
@end

@implementation HDKeyValueEntity

+ (BOOL)setData:(id)a3 forKey:(id)a4 domain:(id)a5 category:(int64_t)a6 profile:(id)a7 error:(id *)a8
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, a1, @"HDKeyValueEntity.m", 297, @"Invalid parameter not satisfying: %@", @"(data == nil) || [data isKindOfClass:[NSData class]]" object file lineNumber description];
    }
  }
  id v24 = v16;
  v19 = _HDSQLiteValueForData();
  v25[0] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];

  char v21 = +[HDKeyValueEntity _setRawKeysAndValues:domain:category:profile:error:]((uint64_t)a1, v20, v17, a6, v18, (uint64_t)a8);
  return v21;
}

+ (uint64_t)_setRawKeysAndValues:(void *)a3 domain:(uint64_t)a4 category:(void *)a5 profile:(uint64_t)a6 error:
{
  id v10 = a5;
  id v11 = a3;
  id v12 = a2;
  v13 = self;
  if (!v12)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:sel__setRawKeysAndValues_domain_category_profile_error_, v13, @"HDKeyValueEntity.m", 646, @"Invalid parameter not satisfying: %@", @"keysAndValues != nil" object file lineNumber description];
  }
  v14 = self;
  if (v14 != (void *)[v14 _entityClassForKeyValueCategory:a4])
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:sel__setRawKeysAndValues_domain_category_profile_error_, v13, @"HDKeyValueEntity.m", 647, @"Invalid parameter not satisfying: %@", @"[self _validateEntityClassForCategory:category]" object file lineNumber description];
  }
  id v15 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v16 = [v13 _insertKeysAndValues:v12 modificationDate:v15 domain:v11 category:a4 provenance:0 syncIdentity:-2 updatePolicy:1 profile:v10 error:a6];

  return v16;
}

+ (Class)_entityClassForKeyValueCategory:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 100) >= 8 && (unint64_t)a3 > 5)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      int v9 = 138543618;
      id v10 = (id)objc_opt_class();
      __int16 v11 = 2048;
      int64_t v12 = a3;
      id v8 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@: unrecognized category %ld", (uint8_t *)&v9, 0x16u);
    }
    v4 = 0;
  }
  else
  {
    v4 = objc_opt_class();
  }

  return (Class)v4;
}

+ (id)dateForKey:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 entity:(id *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = +[HDKeyValueEntity _rawValueForKey:domain:category:profile:entity:error:]((uint64_t)a1, v14, a4, a5, a6, a7, (uint64_t)a8);
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v17 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Found unexpected type %@ for key %@, expecting %@", objc_opt_class(), v14, v17);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a8) {
        *a8 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }

    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = _HDDateForSQLiteValue();
  }

  return v16;
}

+ (id)_rawValueForKey:(void *)a3 domain:(uint64_t)a4 category:(void *)a5 profile:(void *)a6 entity:(uint64_t)a7 error:
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  id v13 = a3;
  id v14 = a5;
  uint64_t v15 = self;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__172;
  v33 = __Block_byref_object_dispose__172;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__172;
  v27 = __Block_byref_object_dispose__172;
  id v28 = 0;
  if (v12)
  {
    uint64_t v16 = v15;
    v35[0] = v12;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __73__HDKeyValueEntity__rawValueForKey_domain_category_profile_entity_error___block_invoke;
    v22[3] = &unk_1E630A4E8;
    v22[4] = &v29;
    v22[5] = &v23;
    v22[6] = a6;
    v22[7] = v16;
    id v18 = +[HDKeyValueEntity _valuesForKeys:domain:category:profile:error:handler:](v16, v17, v13, a4, v14, a7, v22);
  }
  if (a6)
  {
    v19 = (void *)v24[5];
    if (v19) {
      *a6 = v19;
    }
  }
  id v20 = (id)v30[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);

  return v20;
}

+ (id)_valuesForKeys:(void *)a3 domain:(uint64_t)a4 category:(void *)a5 profile:(uint64_t)a6 error:(void *)a7 handler:
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  uint64_t v15 = self;
  if (![v11 count])
  {
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:sel__valuesForKeys_domain_category_profile_error_handler_, v15, @"HDKeyValueEntity.m", 559, @"Invalid parameter not satisfying: %@", @"[keys count] > 0" object file lineNumber description];
  }
  uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v17 = +[HDKeyValueEntity _predicateForKeys:]((uint64_t)v15, v11);
  id v18 = +[HDKeyValueEntity _predicateForDomain:]((uint64_t)v15, v14);

  v19 = (void *)MEMORY[0x1E4F65D08];
  v34[0] = v18;
  v34[1] = v17;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  char v21 = [v19 predicateMatchingAllPredicates:v20];

  v22 = [v13 database];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __73__HDKeyValueEntity__valuesForKeys_domain_category_profile_error_handler___block_invoke;
  v31[3] = &unk_1E630A558;
  id v33 = v12;
  id v23 = v16;
  id v32 = v23;
  id v24 = v12;
  char v25 = [v15 _enumerateKeyValueEntitiesInCategory:a4 predicate:v21 healthDatabase:v22 error:a6 usingBlock:v31];

  if ((v25 & 1) == 0)
  {

    id v23 = 0;
  }
  v26 = v32;
  id v27 = v23;

  return v27;
}

+ (id)_predicateForKeys:(uint64_t)a1
{
  id v2 = a2;
  self;
  if ([v2 count])
  {
    v3 = [MEMORY[0x1E4F65D10] containsPredicateWithProperty:@"key" values:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)_predicateForDomain:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  if (!v2)
  {
    uint64_t v6 = v3;
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:sel__predicateForDomain_, v6, @"HDKeyValueEntity.m", 1096, @"Invalid parameter not satisfying: %@", @"domain != nil" object file lineNumber description];
  }
  v4 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"domain" equalToValue:v2];

  return v4;
}

+ (BOOL)_enumerateKeyValueEntitiesInCategory:(int64_t)a3 predicate:(id)a4 healthDatabase:(id)a5 error:(id *)a6 usingBlock:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = self;
  if (v16 != (void *)[v16 _entityClassForKeyValueCategory:a3])
  {
    char v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"HDKeyValueEntity.m", 626, @"Invalid parameter not satisfying: %@", @"[self _validateEntityClassForCategory:category]" object file lineNumber description];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __99__HDKeyValueEntity__enumerateKeyValueEntitiesInCategory_predicate_healthDatabase_error_usingBlock___block_invoke;
  v22[3] = &unk_1E62F4160;
  id v25 = a1;
  int64_t v26 = a3;
  id v23 = v13;
  id v24 = v15;
  id v17 = v15;
  id v18 = v13;
  char v19 = [a1 performReadTransactionWithHealthDatabase:v14 error:a6 block:v22];

  return v19;
}

uint64_t __99__HDKeyValueEntity__enumerateKeyValueEntitiesInCategory_predicate_healthDatabase_error_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  v7 = *(void **)(a1 + 32);
  id v8 = [a2 databaseForEntityClass:v5];
  uint64_t v9 = +[HDKeyValueEntity _readRawValuesInCategory:predicate:database:error:usingBlock:](v5, v6, v7, v8, a3, *(void **)(a1 + 40));

  return v9;
}

+ (uint64_t)_readRawValuesInCategory:(void *)a3 predicate:(void *)a4 database:(uint64_t)a5 error:(void *)a6 usingBlock:
{
  v23[4] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = self;
  v23[0] = @"domain";
  v23[1] = @"key";
  v23[2] = @"value";
  v23[3] = @"mod_date";
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  id v15 = +[HDKeyValueEntity _predicateForCategory:]((uint64_t)v13, a2);
  uint64_t v16 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v15 otherPredicate:v12];

  id v17 = [v13 queryWithDatabase:v11 predicate:v16];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __81__HDKeyValueEntity__readRawValuesInCategory_predicate_database_error_usingBlock___block_invoke;
  v21[3] = &unk_1E62F35F0;
  id v22 = v10;
  id v18 = v10;
  uint64_t v19 = [v17 enumeratePersistentIDsAndProperties:v14 error:a5 enumerationHandler:v21];

  return v19;
}

+ (id)_predicateForCategory:(uint64_t)a1
{
  self;
  uint64_t v3 = (void *)MEMORY[0x1E4F65D00];
  v4 = [NSNumber numberWithInteger:a2];
  uint64_t v5 = [v3 predicateWithProperty:@"category" equalToValue:v4];

  return v5;
}

BOOL __81__HDKeyValueEntity__readRawValuesInCategory_predicate_database_error_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = MEMORY[0x1C1879F80](a4, 0);
  v7 = MEMORY[0x1C1879F80](a4, 1);
  id v8 = MEMORY[0x1C1879F60](a4, 2);
  uint64_t v9 = MEMORY[0x1C1879F30](a4, 3);
  char v12 = 0;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  BOOL v10 = v12 == 0;

  return v10;
}

void __73__HDKeyValueEntity__valuesForKeys_domain_category_profile_error_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v16 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14)
  {
    uint64_t v15 = (*(void (**)(uint64_t, id, id, id, uint64_t))(v14 + 16))(v14, v11, v12, v13, a6);

    id v12 = (id)v15;
  }
  if (v12) {
    [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v11];
  }
}

id __73__HDKeyValueEntity__rawValueForKey_domain_category_profile_entity_error___block_invoke(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v7 = a3;
  id v8 = [MEMORY[0x1E4F1CA98] null];
  if ([v7 isEqual:v8]) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v7;
  }
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), v9);

  if (a1[6])
  {
    uint64_t v10 = [objc_alloc((Class)objc_opt_class()) initWithPersistentID:a5];
    uint64_t v11 = *(void *)(a1[5] + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  id v13 = *(id *)(*(void *)(a1[4] + 8) + 40);

  return v13;
}

+ (BOOL)setDate:(id)a3 forKey:(id)a4 domain:(id)a5 category:(int64_t)a6 profile:(id)a7 error:(id *)a8
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, a1, @"HDKeyValueEntity.m", 334, @"Invalid parameter not satisfying: %@", @"(date == nil) || [date isKindOfClass:[NSDate class]]" object file lineNumber description];
    }
  }
  id v24 = v16;
  uint64_t v19 = _HDSQLiteValueForDate();
  v25[0] = v19;
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];

  char v21 = +[HDKeyValueEntity _setRawKeysAndValues:domain:category:profile:error:]((uint64_t)a1, v20, v17, a6, v18, (uint64_t)a8);
  return v21;
}

+ (id)numberForKey:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 entity:(id *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = +[HDKeyValueEntity _rawValueForKey:domain:category:profile:entity:error:]((uint64_t)a1, v14, a4, a5, a6, a7, (uint64_t)a8);
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v17 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Found unexpected type %@ for key %@, expecting %@", objc_opt_class(), v14, v17);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a8) {
        *a8 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v16 = 0;
  }
  else
  {
    id v16 = v15;
  }

  return v16;
}

+ (id)retrieveDatabaseIdentifierFromDatabase:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!a4)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"HDKeyValueEntity+DatabaseProperties.m", 96, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  uint64_t v8 = [a1 _deviceLocalCategory];
  v15[0] = @"IDENTIFIER";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  uint64_t v10 = [a1 _rawValuesForKeys:v9 domain:@"DATABASE_CREATION" category:v8 database:v7 error:a4];

  if (!v10 && !*a4)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"HDKeyValueEntity+DatabaseProperties.m", 106, @"Invalid parameter not satisfying: %@", @"values || *error" object file lineNumber description];
  }
  uint64_t v11 = [v10 objectForKeyedSubscript:@"IDENTIFIER"];

  return v11;
}

+ (id)_rawValuesForKeys:(id)a3 domain:(id)a4 category:(int64_t)a5 database:(id)a6 error:(id *)a7
{
  id v12 = (void *)MEMORY[0x1E4F1CA60];
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = [v12 dictionary];
  uint64_t v17 = +[HDKeyValueEntity _predicateForKeys:]((uint64_t)a1, v15);

  id v18 = +[HDKeyValueEntity _predicateForDomain:]((uint64_t)a1, v14);

  uint64_t v19 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v18 otherPredicate:v17];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __69__HDKeyValueEntity__rawValuesForKeys_domain_category_database_error___block_invoke;
  v22[3] = &unk_1E630A510;
  id v20 = v16;
  id v23 = v20;
  LOBYTE(a7) = +[HDKeyValueEntity _readRawValuesInCategory:predicate:database:error:usingBlock:]((uint64_t)a1, a5, v19, v13, (uint64_t)a7, v22);

  if ((a7 & 1) == 0)
  {

    id v20 = 0;
  }

  return v20;
}

void __69__HDKeyValueEntity__rawValuesForKeys_domain_category_database_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v14 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    id v12 = [MEMORY[0x1E4F1CA98] null];
    char v13 = [v10 isEqual:v12];

    if ((v13 & 1) == 0) {
      [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v9];
    }
  }
}

+ (int64_t)_deviceLocalCategory
{
  return 0;
}

+ (BOOL)setNumber:(id)a3 forKey:(id)a4 domain:(id)a5 category:(int64_t)a6 profile:(id)a7 error:(id *)a8
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, a1, @"HDKeyValueEntity.m", 376, @"Invalid parameter not satisfying: %@", @"(number == nil) || [number isKindOfClass:[NSNumber class]]" object file lineNumber description];
    }
  }
  id v24 = v16;
  uint64_t v19 = _HDSQLiteValueForNumber();
  v25[0] = v19;
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];

  char v21 = +[HDKeyValueEntity _setRawKeysAndValues:domain:category:profile:error:]((uint64_t)a1, v20, v17, a6, v18, (uint64_t)a8);
  return v21;
}

+ (BOOL)enumerateValuesForDomain:(id)a3 category:(int64_t)a4 keys:(id)a5 profile:(id)a6 error:(id *)a7 usingBlock:(id)a8
{
  void v25[2] = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a8;
  id v16 = a6;
  id v17 = +[HDKeyValueEntity _predicateForDomain:]((uint64_t)a1, a3);
  if ([v14 count]) {
    +[HDKeyValueEntity _predicateForKeys:]((uint64_t)a1, v14);
  }
  else {
  id v18 = [MEMORY[0x1E4F65D58] truePredicate];
  }
  uint64_t v19 = (void *)MEMORY[0x1E4F65D08];
  v25[0] = v17;
  v25[1] = v18;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  char v21 = [v19 predicateMatchingAllPredicates:v20];

  id v22 = [v16 database];

  char v23 = [a1 _enumerateKeyValueEntitiesInCategory:a4 predicate:v21 healthDatabase:v22 error:a7 usingBlock:v15];
  return v23;
}

+ (id)allValuesForDomain:(id)a3 category:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = (void *)MEMORY[0x1E4F1CA60];
  id v11 = a5;
  id v12 = a3;
  char v13 = [v10 dictionary];
  id v14 = [MEMORY[0x1E4F1CA98] null];
  id v15 = +[HDKeyValueEntity _predicateForDomain:]((uint64_t)a1, v12);

  id v16 = [v11 database];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __62__HDKeyValueEntity_allValuesForDomain_category_profile_error___block_invoke;
  v22[3] = &unk_1E630A4A0;
  id v23 = v14;
  id v17 = v13;
  id v24 = v17;
  id v18 = v14;
  LOBYTE(a6) = [a1 _enumerateKeyValueEntitiesInCategory:a4 predicate:v15 healthDatabase:v16 error:a6 usingBlock:v22];

  if ((a6 & 1) == 0)
  {

    id v17 = 0;
  }
  uint64_t v19 = v24;
  id v20 = v17;

  return v20;
}

+ (id)propertyForSyncProvenance
{
  return @"provenance";
}

+ (id)dataForKey:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 entity:(id *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = +[HDKeyValueEntity _rawValueForKey:domain:category:profile:entity:error:]((uint64_t)a1, v14, a4, a5, a6, a7, (uint64_t)a8);
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v17 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Found unexpected type %@ for key %@, expecting %@", objc_opt_class(), v14, v17);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a8) {
        *a8 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v16 = 0;
  }
  else
  {
    id v16 = v15;
  }

  return v16;
}

+ (id)stringForKey:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 entity:(id *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = +[HDKeyValueEntity _rawValueForKey:domain:category:profile:entity:error:]((uint64_t)a1, v14, a4, a5, a6, a7, (uint64_t)a8);
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v17 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Found unexpected type %@ for key %@, expecting %@", objc_opt_class(), v14, v17);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a8) {
        *a8 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v16 = 0;
  }
  else
  {
    id v16 = v15;
  }

  return v16;
}

+ (id)retrieveDatabaseIdentifierFromProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(a1, "dataForKey:domain:category:profile:entity:error:", @"IDENTIFIER", @"DATABASE_CREATION", objc_msgSend(a1, "_deviceLocalCategory"), v6, 0, a4);

  return v7;
}

+ (id)dateComponentsForKey:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 entity:(id *)a7 error:(id *)a8
{
  uint64_t v8 = [a1 dateForKey:a3 domain:a4 category:a5 profile:a6 entity:a7 error:a8];
  if (v8)
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_canonicalDateOfBirthDateComponentsWithDate:", v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)quantityForKey:(id)a3 unit:(id)a4 domain:(id)a5 category:(int64_t)a6 profile:(id)a7 entity:(id *)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  uint64_t v17 = +[HDKeyValueEntity _rawValueForKey:domain:category:profile:entity:error:]((uint64_t)a1, v15, a5, a6, a7, a8, (uint64_t)a9);
  if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v19 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Found unexpected type %@ for key %@, expecting %@", objc_opt_class(), v15, v19);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      if (a9) {
        *a9 = v20;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v18 = 0;
  }
  else
  {
    id v18 = _HDQuantityForSQLiteValue();
  }

  return v18;
}

+ (BOOL)setValuesWithDictionary:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if ([v12 count]) {
    char v15 = +[HDKeyValueEntity _setRawKeysAndValues:domain:category:profile:error:]((uint64_t)a1, v12, v13, a5, v14, (uint64_t)a7);
  }
  else {
    char v15 = 1;
  }

  return v15;
}

void __62__HDKeyValueEntity_allValuesForDomain_category_profile_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v12 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10 && ([v10 isEqual:*(void *)(a1 + 32)] & 1) == 0) {
    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v9];
  }
}

+ (id)generateNewDatabaseIdentifier
{
  id v2 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v3 = objc_msgSend(v2, "hk_dataForUUIDBytes");

  return v3;
}

+ (BOOL)persistDatabaseIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  LOBYTE(a5) = objc_msgSend(a1, "setData:forKey:domain:category:profile:error:", v9, @"IDENTIFIER", @"DATABASE_CREATION", objc_msgSend(a1, "_deviceLocalCategory"), v8, a5);

  return (char)a5;
}

+ (id)retrieveDatabaseIdentifierCreationDateFromProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(a1, "_modDateForKey:domain:category:profile:entity:error:", @"IDENTIFIER", @"DATABASE_CREATION", objc_msgSend(a1, "_deviceLocalCategory"), v6, 0, a4);

  return v7;
}

+ (BOOL)persistDatabaseIdentifier:(id)a3 syncIdentity:(int64_t)a4 database:(id)a5 error:(id *)a6
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, a1, @"HDKeyValueEntity+DatabaseProperties.m", 81, @"Invalid parameter not satisfying: %@", @"(data == nil) || [data isKindOfClass:[NSData class]]" object file lineNumber description];
    }
  }
  id v18 = @"IDENTIFIER";
  id v13 = _HDSQLiteValueForData();
  v19[0] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];

  char v15 = objc_msgSend(a1, "_setRawKeysAndValues:domain:category:syncIdentity:database:error:", v14, @"DATABASE_CREATION", objc_msgSend(a1, "_deviceLocalCategory"), a4, v12, a6);
  return v15;
}

+ (BOOL)setOkemoZursObjectAnchor:(int64_t)a3 syncIdentity:(int64_t)a4 database:(id)a5 error:(id *)a6
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v16 = @"OBJECT_ANCHOR_8_2";
  id v10 = NSNumber;
  id v11 = a5;
  id v12 = [v10 numberWithLongLong:a3];
  id v13 = _HDSQLiteValueForNumber();
  v17[0] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];

  LOBYTE(a6) = objc_msgSend(a1, "_setRawKeysAndValues:domain:category:syncIdentity:database:error:", v14, @"OBJECT_ANCHOR", objc_msgSend(a1, "_deviceLocalCategory"), a4, v11, a6);
  return (char)a6;
}

+ (id)okemoZursObjectAnchorWithProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(a1, "numberForKey:domain:category:profile:entity:error:", @"OBJECT_ANCHOR_8_2", @"OBJECT_ANCHOR", objc_msgSend(a1, "_deviceLocalCategory"), v6, 0, a4);

  return v7;
}

+ (id)valuesForKeys:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 error:(id *)a7
{
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = self;
  char v15 = +[HDKeyValueEntity _valuesForKeys:domain:category:profile:error:handler:](v14, v13, v12, a5, v11, (uint64_t)a7, &__block_literal_global_351_0);

  return v15;
}

+ (id)modificationDatesForKeys:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 error:(id *)a7
{
  return +[HDKeyValueEntity _valuesForKeys:domain:category:profile:error:handler:]((uint64_t)a1, a3, a4, a5, a6, (uint64_t)a7, &__block_literal_global_211);
}

id __75__HDKeyValueEntity_modificationDatesForKeys_domain_category_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = a4;

  return v4;
}

+ (BOOL)setData:(id)a3 forKey:(id)a4 domain:(id)a5 category:(int64_t)a6 syncIdentity:(int64_t)a7 profile:(id)a8 error:(id *)a9
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2, a1, @"HDKeyValueEntity.m", 310, @"Invalid parameter not satisfying: %@", @"(data == nil) || [data isKindOfClass:[NSData class]]" object file lineNumber description];
    }
  }
  id v29 = v16;
  uint64_t v19 = _HDSQLiteValueForData();
  v30[0] = v19;
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];

  if (!v20)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"HDKeyValueEntity.m", 312, @"Invalid parameter not satisfying: %@", @"dict != nil" object file lineNumber description];
  }
  char v21 = self;
  if (v21 != (void *)[v21 _entityClassForKeyValueCategory:a6])
  {
    int64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"HDKeyValueEntity.m", 313, @"Invalid parameter not satisfying: %@", @"[self _validateEntityClassForCategory:category]" object file lineNumber description];
  }
  id v22 = [MEMORY[0x1E4F1C9C8] date];
  char v23 = [a1 _insertKeysAndValues:v20 modificationDate:v22 domain:v17 category:a6 provenance:0 syncIdentity:a7 updatePolicy:1 profile:v18 error:a9];

  return v23;
}

+ (BOOL)setDateComponents:(id)a3 forKey:(id)a4 domain:(id)a5 category:(int64_t)a6 profile:(id)a7 error:(id *)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, a1, @"HDKeyValueEntity.m", 346, @"Invalid parameter not satisfying: %@", @"(dateComponents == nil) || [dateComponents isKindOfClass:[NSDateComponents class]]" object file lineNumber description];
    }
    uint64_t v19 = [v15 calendar];
    id v20 = (void *)[v19 copy];

    char v21 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [v20 setTimeZone:v21];

    id v22 = [v20 dateFromComponents:v15];
  }
  else
  {
    id v22 = 0;
  }
  char v23 = [a1 setDate:v22 forKey:v16 domain:v17 category:a6 profile:v18 error:a8];

  return v23;
}

+ (BOOL)setQuantity:(id)a3 unit:(id)a4 forKey:(id)a5 domain:(id)a6 category:(int64_t)a7 profile:(id)a8 error:(id *)a9
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, a1, @"HDKeyValueEntity.m", 364, @"Invalid parameter not satisfying: %@", @"quanity == nil || [quanity isKindOfClass:[HKQuantity class]]" object file lineNumber description];
    }
  }
  id v26 = v18;
  char v21 = _HDSQLiteValueForQuantity();
  v27[0] = v21;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];

  char v23 = +[HDKeyValueEntity _setRawKeysAndValues:domain:category:profile:error:]((uint64_t)a1, v22, v19, a7, v20, (uint64_t)a9);
  return v23;
}

+ (BOOL)setString:(id)a3 forKey:(id)a4 domain:(id)a5 category:(int64_t)a6 profile:(id)a7 error:(id *)a8
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, a1, @"HDKeyValueEntity.m", 388, @"Invalid parameter not satisfying: %@", @"(string == nil) || [string isKindOfClass:[NSString class]]" object file lineNumber description];
    }
  }
  id v24 = v16;
  id v19 = _HDSQLiteValueForString();
  v25[0] = v19;
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];

  char v21 = +[HDKeyValueEntity _setRawKeysAndValues:domain:category:profile:error:]((uint64_t)a1, v20, v17, a6, v18, (uint64_t)a8);
  return v21;
}

+ (BOOL)removeValuesForDomain:(id)a3 category:(int64_t)a4 keys:(id)a5 profile:(id)a6 error:(id *)a7
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (v13 && ![v13 count])
  {
    char v22 = 1;
  }
  else
  {
    id v15 = +[HDKeyValueEntity _predicateForDomain:]((uint64_t)a1, v12);
    id v16 = +[HDKeyValueEntity _predicateForCategory:]((uint64_t)a1, a4);
    if (v13) {
      +[HDKeyValueEntity _predicateForKeys:]((uint64_t)a1, v13);
    }
    else {
    id v17 = [MEMORY[0x1E4F65D58] truePredicate];
    }
    id v18 = (void *)MEMORY[0x1E4F65D08];
    v24[0] = v15;
    v24[1] = v16;
    v24[2] = v17;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
    id v20 = [v18 predicateMatchingAllPredicates:v19];

    char v21 = [v14 database];
    char v22 = [a1 deleteEntitiesWithPredicate:v20 healthDatabase:v21 error:a7];
  }
  return v22;
}

+ (BOOL)setValueForAllKeys:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 error:(id *)a7
{
  void v35[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = [v13 database];
  id v15 = +[HDKeyValueEntity _predicateForDomain:]((uint64_t)a1, v12);
  id v16 = +[HDKeyValueEntity _predicateForCategory:]((uint64_t)a1, a5);
  id v17 = (void *)MEMORY[0x1E4F65D08];
  v35[0] = v15;
  v35[1] = v16;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  id v19 = [v17 predicateMatchingAllPredicates:v18];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __69__HDKeyValueEntity_setValueForAllKeys_domain_category_profile_error___block_invoke;
  v27[3] = &unk_1E62F40E8;
  id v28 = v13;
  id v29 = v12;
  int64_t v33 = a5;
  id v34 = a1;
  id v30 = v19;
  id v31 = v14;
  id v32 = v11;
  id v20 = v11;
  id v21 = v14;
  id v22 = v19;
  id v23 = v12;
  id v24 = v13;
  LOBYTE(v18) = [a1 performWriteTransactionWithHealthDatabase:v21 error:a7 block:v27];

  return (char)v18;
}

uint64_t __69__HDKeyValueEntity_setValueForAllKeys_domain_category_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 keyValueDomainManager];
  [v7 batchNotificationForDomain:*(void *)(a1 + 40) category:*(void *)(a1 + 72) forTransaction:v6];

  id v8 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = *(void **)(a1 + 80);
  v19[0] = @"value";
  v19[1] = @"mod_date";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__HDKeyValueEntity_setValueForAllKeys_domain_category_profile_error___block_invoke_2;
  v16[3] = &unk_1E62F3A88;
  id v17 = *(id *)(a1 + 64);
  id v18 = v8;
  id v13 = v8;
  uint64_t v14 = [v9 updateProperties:v10 predicate:v11 healthDatabase:v12 error:a3 bindingHandler:v16];

  return v14;
}

void __69__HDKeyValueEntity_setValueForAllKeys_domain_category_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879EE0](a2, @"value", *(void *)(a1 + 32));

  JUMPOUT(0x1C1879E40);
}

id __68__HDKeyValueEntity__rawValuesForKeys_domain_category_profile_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA98];
  id v4 = a3;
  uint64_t v5 = [v3 null];
  if ([v4 isEqual:v5]) {
    id v6 = 0;
  }
  else {
    id v6 = v4;
  }
  id v7 = v6;

  return v7;
}

+ (BOOL)_setRawKeysAndValues:(id)a3 domain:(id)a4 category:(int64_t)a5 syncIdentity:(int64_t)a6 database:(id)a7 error:(id *)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  if (!v15)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, a1, @"HDKeyValueEntity.m", 668, @"Invalid parameter not satisfying: %@", @"keysAndValues != nil" object file lineNumber description];
  }
  id v18 = self;
  if (v18 != (void *)[v18 _entityClassForKeyValueCategory:a5])
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, a1, @"HDKeyValueEntity.m", 669, @"Invalid parameter not satisfying: %@", @"[self _validateEntityClassForCategory:category]" object file lineNumber description];
  }
  id v19 = [MEMORY[0x1E4F1C9C8] date];
  id v20 = v15;
  id v21 = v19;
  id v22 = v16;
  id v23 = v17;
  uint64_t v24 = self;
  uint64_t v25 = [v20 count];
  if (v25)
  {
    uint64_t v26 = v25;
    v37 = a8;
    id v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v25];
    int64_t v38 = a6;
    id v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v26];
    id v29 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v26];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __126__HDKeyValueEntity__insertKeysAndValues_modificationDate_domain_category_provenance_syncIdentity_updatePolicy_database_error___block_invoke;
    v39[3] = &unk_1E630A580;
    id v40 = v27;
    id v41 = v28;
    id v42 = v29;
    id v43 = v21;
    id v30 = v29;
    id v31 = v28;
    id v32 = v27;
    [v20 enumerateKeysAndObjectsUsingBlock:v39];
    BOOL v33 = +[HDKeyValueEntity _doInsertValues:forKeys:modificationDates:domain:category:provenance:syncIdentity:updatePolicy:database:error:](v24, v32, v31, v30, v22, a5, 0, v38, 1, v23, (uint64_t)v37);
  }
  else
  {
    BOOL v33 = 1;
  }

  return v33;
}

+ (BOOL)_insertKeysAndValues:(id)a3 modificationDate:(id)a4 domain:(id)a5 category:(int64_t)a6 provenance:(int64_t)a7 syncIdentity:(int64_t)a8 updatePolicy:(int64_t)a9 profile:(id)a10 error:(id *)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a10;
  uint64_t v21 = [v17 count];
  if (v21)
  {
    uint64_t v22 = v21;
    id v33 = a1;
    id v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v21];
    int64_t v32 = a7;
    int64_t v24 = a8;
    uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v22];
    uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v22];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __125__HDKeyValueEntity__insertKeysAndValues_modificationDate_domain_category_provenance_syncIdentity_updatePolicy_profile_error___block_invoke;
    void v34[3] = &unk_1E630A580;
    id v35 = v23;
    id v36 = v25;
    id v37 = v26;
    id v38 = v18;
    id v27 = v26;
    id v28 = v25;
    id v29 = v23;
    [v17 enumerateKeysAndObjectsUsingBlock:v34];
    char v30 = [v33 _insertValues:v29 forKeys:v28 modificationDates:v27 domain:v19 category:a6 provenance:v32 syncIdentity:v24 updatePolicy:a9 profile:v20 error:a11];
  }
  else
  {
    char v30 = 1;
  }

  return v30;
}

uint64_t __125__HDKeyValueEntity__insertKeysAndValues_modificationDate_domain_category_provenance_syncIdentity_updatePolicy_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 addObject:a3];
  [*(id *)(a1 + 40) addObject:v6];

  id v7 = *(void **)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);

  return [v7 addObject:v8];
}

uint64_t __126__HDKeyValueEntity__insertKeysAndValues_modificationDate_domain_category_provenance_syncIdentity_updatePolicy_database_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 addObject:a3];
  [*(id *)(a1 + 40) addObject:v6];

  id v7 = *(void **)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);

  return [v7 addObject:v8];
}

+ (BOOL)_doInsertValues:(void *)a3 forKeys:(void *)a4 modificationDates:(void *)a5 domain:(uint64_t)a6 category:(uint64_t)a7 provenance:(uint64_t)a8 syncIdentity:(uint64_t)a9 updatePolicy:(void *)a10 database:(uint64_t)a11 error:
{
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  id v55 = a5;
  id v54 = a10;
  v56 = self;
  uint64_t v17 = [v15 count];
  if ([v14 count] != v17)
  {
    id v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:sel__doInsertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_database_error_, v56, @"HDKeyValueEntity.m", 898, @"Invalid parameter not satisfying: %@", @"[values count] == count" object file lineNumber description];
  }
  if ([v16 count] != v17)
  {
    id v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:sel__doInsertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_database_error_, v56, @"HDKeyValueEntity.m", 899, @"Invalid parameter not satisfying: %@", @"[dates count] == count" object file lineNumber description];
  }
  if (v55)
  {
    if (v17) {
      goto LABEL_7;
    }
LABEL_24:
    BOOL v53 = 1;
    goto LABEL_25;
  }
  id v43 = [MEMORY[0x1E4F28B00] currentHandler];
  [v43 handleFailureInMethod:sel__doInsertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_database_error_, v56, @"HDKeyValueEntity.m", 900, @"Invalid parameter not satisfying: %@", @"domain != nil" object file lineNumber description];

  if (!v17) {
    goto LABEL_24;
  }
LABEL_7:
  unint64_t v51 = v17;
  BOOL v53 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = a9;
  uint64_t v47 = *MEMORY[0x1E4F65C70];
  id v52 = v16;
  id v45 = v15;
  id v46 = v14;
  do
  {
    id v20 = [v15 objectAtIndexedSubscript:v18];
    uint64_t v21 = [v14 objectAtIndexedSubscript:v18];
    uint64_t v22 = [v16 objectAtIndexedSubscript:v18];
    [v22 timeIntervalSinceReferenceDate];
    uint64_t v24 = v23;

    id v25 = v20;
    id v26 = v55;
    id v27 = v54;
    self;
    if (v19 == 2)
    {
      id v28 = v25;
      id v29 = v26;
      id v30 = v27;
      id v31 = self;
      int64_t v32 = NSString;
      id v33 = [v31 disambiguatedDatabaseTable];
      objc_msgSend(v32, "stringWithFormat:", @"SELECT %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ >= ?;",
        v47,
        v33,
        @"category",
        @"domain",
        @"key",
        @"mod_date",
      id v34 = 0);

      uint64_t v72 = 0;
      v73 = &v72;
      uint64_t v74 = 0x2020000000;
      char v75 = 1;
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __107__HDKeyValueEntity__validateModificationDatePolicyWithKey_domain_category_modificationDate_database_error___block_invoke;
      v67[3] = &unk_1E6301000;
      uint64_t v70 = a6;
      id v35 = v29;
      id v68 = v35;
      id v36 = v28;
      id v69 = v36;
      uint64_t v71 = v24;
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __107__HDKeyValueEntity__validateModificationDatePolicyWithKey_domain_category_modificationDate_database_error___block_invoke_2;
      v66[3] = &unk_1E62F3640;
      v66[4] = &v72;
      if ([v30 executeSQL:v34 error:a11 bindingHandler:v67 enumerationHandler:v66])
      {
        if (*((unsigned char *)v73 + 24)) {
          uint64_t v19 = 1;
        }
        else {
          uint64_t v19 = 2;
        }
      }
      else
      {
        uint64_t v19 = 3;
      }

      _Block_object_dispose(&v72, 8);
      id v15 = v45;
      id v14 = v46;
    }
    else if (v19 != 1)
    {
      uint64_t v19 = 0;
    }

    if (v19 == 1)
    {
      uint64_t v37 = [v56 _insertStatementKey];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __130__HDKeyValueEntity__doInsertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_database_error___block_invoke;
      v65[3] = &__block_descriptor_40_e15___NSString_8__0l;
      v65[4] = v56;
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __130__HDKeyValueEntity__doInsertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_database_error___block_invoke_2;
      v57[3] = &unk_1E630A5D0;
      id v58 = v21;
      id v59 = v25;
      id v60 = v26;
      uint64_t v61 = a6;
      uint64_t v62 = a7;
      uint64_t v63 = v24;
      uint64_t v64 = a8;
      id v38 = v25;
      id v39 = v21;
      LOBYTE(v37) = [v27 executeCachedStatementForKey:v37 error:a11 SQLGenerator:v65 bindingHandler:v57 enumerationHandler:0];

      uint64_t v19 = a9;
      id v16 = v52;
      if ((v37 & 1) == 0) {
        break;
      }
    }
    else
    {

      BOOL v40 = v19 == 3;
      uint64_t v19 = a9;
      id v16 = v52;
      if (v40) {
        break;
      }
    }
    BOOL v53 = ++v18 >= v51;
  }
  while (v51 != v18);
LABEL_25:

  return v53;
}

+ (BOOL)_insertCodableCategoryDomainDictionary:(id)a3 provenance:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 _validateForInsertionWithError:a6])
  {
    id v10 = [v8 keyValuePairs];
    if ([v10 count])
    {
      id v13 = v8;
      id v14 = v10;
      id v15 = v9;
      char v11 = HKWithAutoreleasePool();
    }
    else
    {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

uint64_t __84__HDKeyValueEntity__insertCodableCategoryDomainDictionary_provenance_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v25 = *(void *)(v3 + 8);
  id v4 = *(__CFString **)(v3 + 16);
  if (!v4) {
    id v4 = &stru_1F1728D60;
  }
  id v26 = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 56)];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 56)];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 56)];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v28 = a1;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v13 = [v12 decodedValue];
        if (v13)
        {
          [v5 addObject:v13];
        }
        else
        {
          id v14 = [MEMORY[0x1E4F1CA98] null];
          [v5 addObject:v14];
        }
        id v15 = [v12 key];
        [v6 addObject:v15];

        id v16 = [v12 decodedTimestamp];
        [v7 addObject:v16];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v9);
  }

  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__172;
  uint64_t v37 = __Block_byref_object_dispose__172;
  uint64_t v17 = [*(id *)(v28 + 48) syncIdentityManager];
  id v38 = [v17 legacySyncIdentity];

  uint64_t v18 = [*(id *)(v28 + 48) database];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __84__HDKeyValueEntity__insertCodableCategoryDomainDictionary_provenance_profile_error___block_invoke_2;
  v29[3] = &unk_1E62F9998;
  id v30 = *(id *)(v28 + 32);
  int64_t v32 = &v33;
  id v31 = *(id *)(v28 + 48);
  BOOL v19 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v18 error:a2 block:v29];

  if (v19)
  {
    uint64_t v21 = *(void **)(v28 + 64);
    uint64_t v20 = *(void *)(v28 + 72);
    uint64_t v22 = [(id)v34[5] entity];
    uint64_t v23 = objc_msgSend(v21, "_insertValues:forKeys:modificationDates:domain:category:provenance:syncIdentity:updatePolicy:profile:error:", v5, v6, v7, v26, v25, v20, objc_msgSend(v22, "persistentID"), 2, *(void *)(v28 + 48), a2);
  }
  else
  {
    uint64_t v23 = 0;
  }

  _Block_object_dispose(&v33, 8);
  return v23;
}

uint64_t __84__HDKeyValueEntity__insertCodableCategoryDomainDictionary_provenance_profile_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([*(id *)(a1 + 32) hasSyncIdentity])
  {
    id v6 = [*(id *)(a1 + 32) syncIdentity];
    id v19 = 0;
    id v7 = +[HDSyncIdentity syncIdentityWithCodable:v6 error:&v19];
    id v8 = v19;

    if (v7)
    {
      uint64_t v9 = [*(id *)(a1 + 40) syncIdentityManager];
      id v18 = v8;
      uint64_t v10 = 1;
      uint64_t v11 = [v9 concreteIdentityForIdentity:v7 shouldCreate:1 transaction:v5 error:&v18];
      id v12 = v18;

      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v11;

      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
LABEL_16:

        goto LABEL_17;
      }
      _HKInitializeLogging();
      id v15 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v12;
        _os_log_fault_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_FAULT, "HDKeyValueEntity ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
      }
      id v12 = v12;
      if (!v12)
      {
LABEL_15:

        uint64_t v10 = 0;
        goto LABEL_16;
      }
      if (!a3)
      {
LABEL_8:
        _HKLogDroppedError();
        goto LABEL_15;
      }
    }
    else
    {
      _HKInitializeLogging();
      id v16 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v8;
        _os_log_fault_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_FAULT, "HDKeyValueEntity SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
      }
      id v12 = v8;
      if (!v12) {
        goto LABEL_15;
      }
      if (!a3) {
        goto LABEL_8;
      }
    }
    id v12 = v12;
    *a3 = v12;
    goto LABEL_15;
  }
  uint64_t v10 = 1;
LABEL_17:

  return v10;
}

+ (BOOL)_insertCodableTimestampedKeyValuePairs:(id)a3 domain:(id)a4 category:(int64_t)a5 provenance:(int64_t)a6 syncIdentity:(int64_t)a7 profile:(id)a8 error:(id *)a9
{
  return [a1 _insertCodableTimestampedKeyValuePairs:a3 domain:a4 category:a5 provenance:a6 syncIdentity:a7 updatePolicy:2 profile:a8 error:a9];
}

+ (BOOL)_insertCodableTimestampedKeyValuePairs:(id)a3 domain:(id)a4 category:(int64_t)a5 provenance:(int64_t)a6 syncIdentity:(int64_t)a7 updatePolicy:(int64_t)a8 profile:(id)a9 error:(id *)a10
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a9;
  uint64_t v19 = [v16 count];
  if (v19)
  {
    uint64_t v20 = v19;
    id v36 = a1;
    int64_t v37 = a8;
    int64_t v38 = a7;
    int64_t v39 = a5;
    int64_t v40 = a6;
    id v41 = v18;
    id v42 = v17;
    id v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v19];
    uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v20];
    uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v20];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v43 = v16;
    id v24 = v16;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v45 != v27) {
            objc_enumerationMutation(v24);
          }
          id v29 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          id v30 = [v29 decodedValue];
          if (v30)
          {
            [v21 addObject:v30];
          }
          else
          {
            id v31 = [MEMORY[0x1E4F1CA98] null];
            [v21 addObject:v31];
          }
          int64_t v32 = [v29 key];
          [v22 addObject:v32];

          uint64_t v33 = [v29 decodedTimestamp];
          [v23 addObject:v33];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v26);
    }

    id v18 = v41;
    id v17 = v42;
    char v34 = [v36 _insertValues:v21 forKeys:v22 modificationDates:v23 domain:v42 category:v39 provenance:v40 syncIdentity:v38 updatePolicy:v37 profile:v41 error:a10];

    id v16 = v43;
  }
  else
  {
    char v34 = 1;
  }

  return v34;
}

id __130__HDKeyValueEntity__doInsertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_database_error___block_invoke(uint64_t a1)
{
  v5[7] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v5[0] = @"value";
  v5[1] = @"key";
  v5[2] = @"domain";
  v5[3] = @"category";
  v5[4] = @"provenance";
  v5[5] = @"mod_date";
  v5[6] = @"sync_identity";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:7];
  uint64_t v3 = [v1 insertSQLForProperties:v2 shouldReplace:1];

  return v3;
}

uint64_t __130__HDKeyValueEntity__doInsertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 4, *(void *)(a1 + 56));
  sqlite3_bind_int64(a2, 5, *(void *)(a1 + 64));
  sqlite3_bind_double(a2, 6, *(double *)(a1 + 72));
  sqlite3_int64 v4 = *(void *)(a1 + 80);

  return sqlite3_bind_int64(a2, 7, v4);
}

+ (const)_insertStatementKey
{
  return 0;
}

uint64_t __107__HDKeyValueEntity__validateModificationDatePolicyWithKey_domain_category_modificationDate_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 48));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  double v4 = *(double *)(a1 + 56);

  return sqlite3_bind_double(a2, 4, v4);
}

uint64_t __107__HDKeyValueEntity__validateModificationDatePolicyWithKey_domain_category_modificationDate_database_error___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return 1;
}

+ (BOOL)_insertValues:(id)a3 forKeys:(id)a4 modificationDates:(id)a5 domain:(id)a6 category:(int64_t)a7 provenance:(int64_t)a8 syncIdentity:(int64_t)a9 updatePolicy:(int64_t)a10 profile:(id)a11 error:(id *)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a11;
  uint64_t v22 = [v18 count];
  if ([v17 count] != v22)
  {
    id v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, a1, @"HDKeyValueEntity.m", 1037, @"Invalid parameter not satisfying: %@", @"[values count] == count" object file lineNumber description];
  }
  if ([v19 count] != v22)
  {
    int64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, a1, @"HDKeyValueEntity.m", 1038, @"Invalid parameter not satisfying: %@", @"[dates count] == count" object file lineNumber description];
  }
  id v23 = a1;
  if (!v20)
  {
    char v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, a1, @"HDKeyValueEntity.m", 1039, @"Invalid parameter not satisfying: %@", @"domain != nil" object file lineNumber description];
  }
  uint64_t v33 = [v21 database];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __127__HDKeyValueEntity__insertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_profile_error___block_invoke;
  v48[3] = &unk_1E630A5F8;
  id v49 = v21;
  id v50 = v20;
  int64_t v54 = a7;
  int64_t v55 = a9;
  id v56 = a1;
  id v51 = v17;
  id v52 = v18;
  id v53 = v19;
  int64_t v57 = a8;
  int64_t v58 = a10;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __127__HDKeyValueEntity__insertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_profile_error___block_invoke_2;
  v37[3] = &unk_1E630A620;
  id v38 = v52;
  id v39 = v51;
  id v40 = v53;
  id v41 = v50;
  int64_t v44 = a7;
  int64_t v45 = a8;
  int64_t v46 = a9;
  int64_t v47 = a10;
  id v42 = v49;
  uint64_t v43 = v22;
  id v24 = v49;
  id v25 = v50;
  id v26 = v53;
  id v27 = v51;
  id v28 = v52;
  char v29 = [v23 performWriteTransactionWithHealthDatabase:v33 error:a12 block:v48 inaccessibilityHandler:v37];

  return v29;
}

BOOL __127__HDKeyValueEntity__insertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v5 = [*(id *)(a1 + 32) keyValueDomainManager];
  id v6 = v4;
  [v5 batchNotificationForDomain:*(void *)(a1 + 40) category:*(void *)(a1 + 72) forTransaction:v4];

  uint64_t v7 = *(void *)(a1 + 80);
  if (v7 == -2) {
    uint64_t v7 = [*(id *)(a1 + 32) currentSyncIdentityPersistentID];
  }
  id v8 = *(void **)(a1 + 64);
  id v18 = *(void **)(a1 + 56);
  uint64_t v10 = *(void **)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v13 = *(void *)(a1 + 88);
  uint64_t v12 = *(void *)(a1 + 96);
  uint64_t v14 = *(void *)(a1 + 104);
  id v15 = [v6 databaseForEntityClass:v13];
  BOOL v16 = +[HDKeyValueEntity _doInsertValues:forKeys:modificationDates:domain:category:provenance:syncIdentity:updatePolicy:database:error:](v13, v9, v18, v8, v10, v11, v12, v7, v14, v15, a3);

  return v16;
}

uint64_t __127__HDKeyValueEntity__insertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 72)];
  if (*(void *)(a1 + 72))
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v6];
      id v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v6];
      uint64_t v9 = [*(id *)(a1 + 48) objectAtIndexedSubscript:v6];
      uint64_t v10 = [[_HDKeyValueJournalEntry alloc] initWithValue:v8 key:v7 domain:*(void *)(a1 + 56) category:*(void *)(a1 + 80) provenance:*(void *)(a1 + 88) syncIdentity:*(void *)(a1 + 96) updatePolicy:*(void *)(a1 + 104) modificationDate:v9];
      [v5 addObject:v10];

      ++v6;
    }
    while (v6 < *(void *)(a1 + 72));
  }
  uint64_t v11 = [*(id *)(a1 + 64) database];
  uint64_t v12 = [v11 addJournalEntries:v5 error:a3];

  return v12;
}

+ (id)_modDateForKey:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 entity:(id *)a7 error:(id *)a8
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  v35[0] = 0;
  v35[1] = v35;
  void v35[2] = 0x3032000000;
  void v35[3] = __Block_byref_object_copy__172;
  v35[4] = __Block_byref_object_dispose__172;
  id v36 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  int64_t v32 = __Block_byref_object_copy__172;
  uint64_t v33 = __Block_byref_object_dispose__172;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__172;
  id v27 = __Block_byref_object_dispose__172;
  id v28 = 0;
  if (v14)
  {
    v37[0] = v14;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __72__HDKeyValueEntity__modDateForKey_domain_category_profile_entity_error___block_invoke;
    v22[3] = &unk_1E630A648;
    void v22[4] = v35;
    v22[5] = &v29;
    v22[6] = &v23;
    v22[7] = a7;
    void v22[8] = a1;
    id v18 = +[HDKeyValueEntity _valuesForKeys:domain:category:profile:error:handler:]((uint64_t)a1, v17, v15, a5, v16, (uint64_t)a8, v22);
  }
  if (a7)
  {
    id v19 = (void *)v24[5];
    if (v19) {
      *a7 = v19;
    }
  }
  id v20 = (id)v30[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v35, 8);

  return v20;
}

id __72__HDKeyValueEntity__modDateForKey_domain_category_profile_entity_error___block_invoke(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  if ([v8 isEqual:v10]) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v8;
  }
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), v11);

  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a4);
  if (a1[7])
  {
    uint64_t v12 = [objc_alloc((Class)objc_opt_class()) initWithPersistentID:a5];
    uint64_t v13 = *(void *)(a1[6] + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  id v15 = *(id *)(*(void *)(a1[4] + 8) + 40);

  return v15;
}

+ (id)databaseTable
{
  return 0;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_89;
}

+ (id)uniquedColumns
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"category";
  v4[1] = @"domain";
  v4[2] = @"key";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = [[_HDKeyValueEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

@end