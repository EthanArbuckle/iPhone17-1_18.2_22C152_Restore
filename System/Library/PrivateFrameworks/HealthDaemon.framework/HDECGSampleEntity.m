@interface HDECGSampleEntity
+ (BOOL)_insertECGWithCodableBinarySample:(id)a3 syncStore:(id)a4 profile:(id)a5 provenance:(id)a6 error:(id *)a7;
+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4;
+ (BOOL)isConcreteEntity;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)codableObjectsFromObjectCollection:(id)a3;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)foreignKeys;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
@end

@implementation HDECGSampleEntity

+ (id)databaseTable
{
  return @"ecg_samples";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_105;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"data_id";
  v2 = +[HDDataEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDECGSampleEntity.m", 70, @"Subclasses must override %s", "+[HDECGSampleEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __83__HDECGSampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v25[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v25[4] = a1;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __83__HDECGSampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2;
  v22[3] = &unk_1E62F2900;
  id v23 = v14;
  id v24 = v12;
  id v16 = v12;
  id v17 = v14;
  if ([v13 executeCachedStatementForKey:&insertDataObject_withProvenance_inDatabase_persistentID_error__insertKey_6 error:a7 SQLGenerator:v25 bindingHandler:v22 enumerationHandler:0])v18 = v17; {
  else
  }
    v18 = 0;
  id v19 = v18;

  return v19;
}

id __83__HDECGSampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"INSERT INTO %@ (%@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?)", v2, @"data_id", @"private_classification", @"average_heart_rate", @"voltage_payload", @"symptoms_status", 0];

  return v3;
}

uint64_t __83__HDECGSampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) longLongValue]);
  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 40) privateClassification]);
  v4 = [*(id *)(a1 + 40) averageHeartRate];
  if (v4)
  {
    v5 = [*(id *)(a1 + 40) averageHeartRate];
    v6 = [MEMORY[0x1E4F2B618] _countPerMinuteUnit];
    [v5 doubleValueForUnit:v6];
    sqlite3_bind_double(a2, 3, v7);
  }
  else
  {
    sqlite3_bind_null(a2, 3);
  }

  v8 = [*(id *)(a1 + 40) payload];
  v9 = _HDSQLiteValueForData();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_int64 v10 = [*(id *)(a1 + 40) symptomsStatus];

  return sqlite3_bind_int64(a2, 5, v10);
}

+ (BOOL)_insertECGWithCodableBinarySample:(id)a3 syncStore:(id)a4 profile:(id)a5 provenance:(id)a6 error:(id *)a7
{
  v55[2] = *MEMORY[0x1E4F143B8];
  id v48 = a6;
  id v9 = a5;
  id v10 = a3;
  self;
  v11 = [MEMORY[0x1E4F2B420] createWithCodable:v10];

  id v12 = [v11 metadata];
  uint64_t v13 = *MEMORY[0x1E4F2BAE8];
  id v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F2BAE8]];
  objc_msgSend(v11, "_setPrivateClassification:", objc_msgSend(v14, "integerValue"));

  v15 = [v11 metadata];
  uint64_t v16 = *MEMORY[0x1E4F2BAF8];
  id v17 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F2BAF8]];
  [v17 integerValue];

  [v11 _setSymptomsStatus:HKElectrocardiogramSymptomsStatusFromPrivateElectrocardiogramSymptoms()];
  v18 = [v11 metadata];
  uint64_t v19 = *MEMORY[0x1E4F2BAF0];
  v20 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F2BAF0]];

  if (v20) {
    [v11 _setAverageHeartRate:v20];
  }

  id v21 = v11;
  self;
  id v22 = [v21 metadata];
  uint64_t v23 = [v22 objectForKeyedSubscript:v16];
  if (v23)
  {
    id v24 = (void *)v23;
    uint64_t v46 = v13;
    v25 = [v21 metadata];
    v26 = [v25 objectForKeyedSubscript:v16];
    uint64_t v27 = [v26 integerValue];

    if (!v27)
    {
      v33 = 0;
      uint64_t v13 = v46;
      goto LABEL_9;
    }
    v28 = [v21 metadata];
    v29 = [v28 objectForKeyedSubscript:v16];
    [v29 integerValue];

    v30 = _HKCategoryTypesForSymptomsBitmask();
    id v31 = v21;
    id v22 = v30;
    self;
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __66__HDECGSampleEntity__symptomSamplesForSymptomTypes_withValue_ecg___block_invoke;
    v51[3] = &unk_1E630E748;
    id v52 = v31;
    uint64_t v53 = 0;
    id v32 = v31;
    v33 = objc_msgSend(v22, "hk_map:", v51);

    uint64_t v13 = v46;
  }
  else
  {
    v33 = 0;
  }

LABEL_9:
  id v34 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v35 = [v21 metadata];
  v36 = (void *)[v34 initWithDictionary:v35];

  v55[0] = v13;
  v55[1] = v19;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
  [v36 removeObjectsForKeys:v37];

  [v21 _setMetadata:v36];
  v47 = objc_msgSend(v33, "hk_map:", &__block_literal_global_244);
  v38 = [v21 UUID];
  id v50 = 0;
  BOOL v45 = +[HDAssociationEntity associateSampleUUIDs:v47 withSampleUUID:v38 type:0 destinationSubObjectReference:0 lastInsertedEntityID:&v50 profile:v9 error:a7];
  id v39 = v50;

  v40 = [v9 dataManager];

  id v54 = v21;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
  v42 = [v41 arrayByAddingObjectsFromArray:v33];
  v43 = [v21 _creationDate];

  [v43 timeIntervalSinceReferenceDate];
  LOBYTE(v39) = objc_msgSend(v40, "insertDataObjects:withProvenance:creationDate:error:", v42, v48, a7);

  return v45 & v39;
}

uint64_t __90__HDECGSampleEntity__insertECGWithCodableBinarySample_syncStore_profile_provenance_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

id __66__HDECGSampleEntity__symptomSamplesForSymptomTypes_withValue_ecg___block_invoke(uint64_t a1, void *a2)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F2ACB0];
  v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  double v7 = [v5 startDate];
  v8 = [*(id *)(a1 + 32) endDate];
  id v9 = [*(id *)(a1 + 32) device];
  id v10 = [*(id *)(a1 + 32) metadata];
  v11 = [v3 categorySampleWithType:v6 value:v4 startDate:v7 endDate:v8 device:v9 metadata:v10];

  id v12 = [*(id *)(a1 + 32) _creationDate];
  [v11 _setCreationDate:v12];

  uint64_t v13 = [*(id *)(a1 + 32) sourceRevision];
  [v11 _setSourceRevision:v13];

  v20[0] = 0;
  v20[1] = 0;
  id v14 = [*(id *)(a1 + 32) UUID];
  [v14 getUUIDBytes:v20];

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v20 length:16];
  LOBYTE(v13) = [v6 code];

  char v19 = (char)v13;
  uint64_t v16 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v19 length:1];
  id v17 = objc_msgSend(MEMORY[0x1E4F29128], "hk_v3UUIDWithNameSpace:name:", v15, v16);
  [v11 _setUUID:v17];

  return v11;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)[a3 ecgSamples];
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3) {
    [a4 addEcgSamples:a3];
  }
  return a3 != 0;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(HDEntityEncoder *)[_HDECGSampleEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

@end