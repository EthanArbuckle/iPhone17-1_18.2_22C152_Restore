@interface HDDeletedSampleEntity
+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4;
+ (BOOL)enumerateDeletedSamplesWithTypes:(id)a3 profile:(id)a4 restrictedSourceEntities:(id)a5 limit:(unint64_t)a6 anchor:(int64_t)a7 error:(id *)a8 handler:(id)a9;
+ (BOOL)enumerateEntitiesForSyncWithProperties:(id)a3 predicate:(id)a4 session:(id)a5 syncAnchorRange:(HDSyncAnchorRange)a6 limit:(unint64_t)a7 lastSyncAnchor:(int64_t *)a8 healthDatabase:(id)a9 error:(id *)a10 block:(id)a11;
+ (BOOL)insertCodableDeletedSamples:(id)a3 provenance:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)isConcreteEntity;
+ (Class)_entityClassForDeletion;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_externalSyncMetadataForRow:;
+ (id)codableObjectsFromObjectCollection:(id)a3;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)insertDeletedObject:(id)a3 dataType:(id)a4 provenanceIdentifier:(id)a5 deletionDate:(id)a6 persistStartAndEndDates:(BOOL)a7 startTimestamp:(double)a8 endTimestamp:(double)a9 inDatabase:(id)a10 error:(id *)a11;
+ (int64_t)nextSyncAnchorWithStartAnchor:(int64_t)a3 predicate:(id)a4 session:(id)a5 healthDatabase:(id)a6 error:(id *)a7;
+ (int64_t)protectionClass;
@end

@implementation HDDeletedSampleEntity

+ (int64_t)protectionClass
{
  return +[HDDataEntity protectionClass];
}

+ (int64_t)nextSyncAnchorWithStartAnchor:(int64_t)a3 predicate:(id)a4 session:(id)a5 healthDatabase:(id)a6 error:(id *)a7
{
  return +[HDHealthEntity nextSyncAnchorWithStartAnchor:a3 predicate:a4 session:a5 healthDatabase:a6 error:a7];
}

+ (BOOL)enumerateEntitiesForSyncWithProperties:(id)a3 predicate:(id)a4 session:(id)a5 syncAnchorRange:(HDSyncAnchorRange)a6 limit:(unint64_t)a7 lastSyncAnchor:(int64_t *)a8 healthDatabase:(id)a9 error:(id *)a10 block:(id)a11
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v14 = (void *)MEMORY[0x1E4F65D50];
  uint64_t v15 = *MEMORY[0x1E4F65C70];
  id v16 = a11;
  id v17 = a9;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = [v14 orderingTermWithProperty:v15 entityClass:objc_opt_class() ascending:1];
  v27[0] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  LOBYTE(v24) = 0;
  LOBYTE(v15) = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:syncEntityClass:session:syncAnchorRange:orderingTerms:limit:lastSyncAnchor:distinct:healthDatabase:error:block:](HDSampleEntity, "enumerateEntitiesForSyncWithProperties:predicate:syncEntityClass:session:syncAnchorRange:orderingTerms:limit:lastSyncAnchor:distinct:healthDatabase:error:block:", v20, v19, 0, v18, a6.start, a6.end, v22, a7, a8, v24, v17, a10, v16);

  return v15;
}

+ (id)_externalSyncMetadataForRow:
{
  self;
  v0 = HDSQLiteColumnWithNameAsString();
  v1 = HDSQLiteColumnWithNameAsNumber();
  v2 = [MEMORY[0x1E4F2AEF0] _metadataWithSyncIdentifier:v0 syncVersion:v1];

  return v2;
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3) {
    [a4 addDeletedSamples:a3];
  }
  return a3 != 0;
}

+ (id)insertDeletedObject:(id)a3 dataType:(id)a4 provenanceIdentifier:(id)a5 deletionDate:(id)a6 persistStartAndEndDates:(BOOL)a7 startTimestamp:(double)a8 endTimestamp:(double)a9 inDatabase:(id)a10 error:(id *)a11
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v24 = a10;
  v25 = [v20 metadata];

  if (v25)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:a1 file:@"HDDeletedSampleEntity.m" lineNumber:75 description:@"You can not insert a HKDeletedObject with metadata. Deleted objects don't insert related objects."];
  }
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__181;
  v42 = __Block_byref_object_dispose__181;
  v37.receiver = a1;
  v37.super_class = (Class)&OBJC_METACLASS___HDDeletedSampleEntity;
  objc_msgSendSuper2(&v37, sel_insertDeletedObject_provenanceIdentifier_deletionDate_inDatabase_error_, v20, v22, v23, v24, a11);
  id v43 = (id)objc_claimAutoreleasedReturnValue();
  v26 = (void *)v39[5];
  if (v26)
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __157__HDDeletedSampleEntity_insertDeletedObject_dataType_provenanceIdentifier_deletionDate_persistStartAndEndDates_startTimestamp_endTimestamp_inDatabase_error___block_invoke_2;
    v31[3] = &unk_1E630B618;
    v33 = &v38;
    id v32 = v21;
    BOOL v36 = a7;
    double v34 = a8;
    double v35 = a9;
    char v27 = [v24 executeCachedStatementForKey:&insertDeletedObject_dataType_provenanceIdentifier_deletionDate_persistStartAndEndDates_startTimestamp_endTimestamp_inDatabase_error__insertKey error:a11 SQLGenerator:&__block_literal_global_217 bindingHandler:v31 enumerationHandler:0];

    if (v27) {
      v26 = (void *)v39[5];
    }
    else {
      v26 = 0;
    }
  }
  id v28 = v26;
  _Block_object_dispose(&v38, 8);

  return v28;
}

id __157__HDDeletedSampleEntity_insertDeletedObject_dataType_provenanceIdentifier_deletionDate_persistStartAndEndDates_startTimestamp_endTimestamp_inDatabase_error___block_invoke()
{
  v0 = NSString;
  v1 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v2 = [v0 stringWithFormat:@"INSERT INTO %@ (%@, %@, %@, %@) VALUES (?, ?, ?, ?)", v1, @"data_id", @"data_type", @"start_date", @"end_date", 0];

  return v2;
}

uint64_t __157__HDDeletedSampleEntity_insertDeletedObject_dataType_provenanceIdentifier_deletionDate_persistStartAndEndDates_startTimestamp_endTimestamp_inDatabase_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) longLongValue]);
  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 32) code]);
  if (*(unsigned char *)(a1 + 64)) {
    sqlite3_bind_double(a2, 3, *(double *)(a1 + 48));
  }
  else {
    sqlite3_bind_null(a2, 3);
  }
  if (*(unsigned char *)(a1 + 64))
  {
    double v4 = *(double *)(a1 + 56);
    return sqlite3_bind_double(a2, 4, v4);
  }
  else
  {
    return sqlite3_bind_null(a2, 4);
  }
}

+ (BOOL)enumerateDeletedSamplesWithTypes:(id)a3 profile:(id)a4 restrictedSourceEntities:(id)a5 limit:(unint64_t)a6 anchor:(int64_t)a7 error:(id *)a8 handler:(id)a9
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  id v17 = a5;
  id v18 = a9;
  if (v18)
  {
    objc_super v37 = a8;
    id v19 = (void *)MEMORY[0x1E4F65D08];
    id v20 = HDSampleEntityPredicateForDataTypes(a3);
    v42[0] = v20;
    id v21 = HDDataEntityPredicateForType(2);
    v42[1] = v21;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    id v23 = [v19 predicateMatchingAllPredicates:v22];

    if (v17)
    {
      id v24 = (void *)MEMORY[0x1E4F65D58];
      v25 = HDDataEntityPredicateForSourceEntitySet(7, v17);
      uint64_t v26 = [v24 compoundPredicateWithPredicate:v23 otherPredicate:v25];

      id v23 = (void *)v26;
    }
    if (a7 >= 1)
    {
      char v27 = (void *)MEMORY[0x1E4F65D00];
      id v28 = [NSNumber numberWithLongLong:a7];
      v29 = [v27 predicateWithProperty:@"data_id" greaterThanValue:v28];

      uint64_t v30 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v29 otherPredicate:v23];

      id v23 = (void *)v30;
    }
    id v31 = objc_alloc_init(MEMORY[0x1E4F65D68]);
    [v31 setEntityClass:objc_opt_class()];
    [v31 setLimitCount:a6];
    [v31 setPredicate:v23];
    id v32 = [v16 database];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __118__HDDeletedSampleEntity_enumerateDeletedSamplesWithTypes_profile_restrictedSourceEntities_limit_anchor_error_handler___block_invoke;
    v38[3] = &unk_1E62FB698;
    id v41 = a1;
    id v39 = v31;
    id v40 = v18;
    id v33 = v31;
    char v34 = [a1 performReadTransactionWithHealthDatabase:v32 error:v37 block:v38];
  }
  else
  {
    BOOL v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, a1, @"HDDeletedSampleEntity.m", 114, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

    char v34 = 1;
  }

  return v34;
}

uint64_t __118__HDDeletedSampleEntity_enumerateDeletedSamplesWithTypes_profile_restrictedSourceEntities_limit_anchor_error_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)MEMORY[0x1E4F65D60];
  id v6 = a2;
  id v7 = [v5 alloc];
  v8 = [v6 databaseForEntityClass:*(void *)(a1 + 48)];

  v9 = (void *)[v7 initWithDatabase:v8 descriptor:*(void *)(a1 + 32)];
  v15[0] = @"data_id";
  v15[1] = @"uuid";
  v15[2] = @"external_sync_ids.sid";
  v15[3] = @"external_sync_ids.version";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __118__HDDeletedSampleEntity_enumerateDeletedSamplesWithTypes_profile_restrictedSourceEntities_limit_anchor_error_handler___block_invoke_2;
  v13[3] = &unk_1E62F35F0;
  id v14 = *(id *)(a1 + 40);
  uint64_t v11 = [v9 enumeratePersistentIDsAndProperties:v10 error:a3 enumerationHandler:v13];

  return v11;
}

uint64_t __118__HDDeletedSampleEntity_enumerateDeletedSamplesWithTypes_profile_restrictedSourceEntities_limit_anchor_error_handler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  HDSQLiteColumnAsInt64();
  id v6 = MEMORY[0x1C1879F90](a4, 1);
  id v7 = +[HDDeletedSampleEntity _externalSyncMetadataForRow:]();
  v8 = [MEMORY[0x1E4F2AEF0] _deletedObjectWithUUID:v6 metadata:v7];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return 1;
}

+ (Class)_entityClassForDeletion
{
  return (Class)objc_opt_class();
}

+ (id)databaseTable
{
  return +[HDSampleEntity databaseTable];
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  return +[HDSampleEntity columnDefinitionsWithCount:a3];
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [(HDEntityEncoder *)[_HDDeletedSampleEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)[a3 deletedSamples];
}

+ (BOOL)insertCodableDeletedSamples:(id)a3 provenance:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 database];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __78__HDDeletedSampleEntity_insertCodableDeletedSamples_provenance_profile_error___block_invoke;
  v22[3] = &unk_1E62F2E18;
  id v26 = a1;
  id v23 = v12;
  id v24 = v11;
  id v25 = v10;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__HDDeletedSampleEntity_insertCodableDeletedSamples_provenance_profile_error___block_invoke_320;
  v18[3] = &unk_1E6301508;
  id v19 = v25;
  id v20 = v24;
  id v21 = v23;
  id v14 = v23;
  id v15 = v24;
  id v16 = v25;
  LOBYTE(a6) = [a1 performWriteTransactionWithHealthDatabase:v13 error:a6 block:v22 inaccessibilityHandler:v18];

  return (char)a6;
}

uint64_t __78__HDDeletedSampleEntity_insertCodableDeletedSamples_provenance_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  id v20 = [v16 databaseForEntityClass:*(void *)(a1 + 56)];
  v5 = [*(id *)(a1 + 32) dataProvenanceManager];
  id v21 = [v5 provenanceEntityForProvenance:*(void *)(a1 + 40) error:a3];

  if (v21)
  {
    uint64_t v46 = MEMORY[0x1E4F143A8];
    uint64_t v47 = 3221225472;
    v48 = __78__HDDeletedSampleEntity_insertCodableDeletedSamples_provenance_profile_error___block_invoke_2;
    v49 = &unk_1E63007F8;
    id v50 = *(id *)(a1 + 32);
    id v51 = *(id *)(a1 + 48);
    if (HKWithAutoreleasePool())
    {
      id v19 = objc_alloc_init(MEMORY[0x1E4F2AEE8]);
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v40 = 0;
      id v41 = &v40;
      uint64_t v42 = 0x3032000000;
      id v43 = __Block_byref_object_copy__181;
      v44 = __Block_byref_object_dispose__181;
      id v45 = 0;
      uint64_t v36 = 0;
      objc_super v37 = &v36;
      uint64_t v38 = 0x2020000000;
      uint64_t v39 = 0;
      uint64_t v32 = 0;
      id v33 = &v32;
      uint64_t v34 = 0x2020000000;
      char v35 = 0;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id obj = *(id *)(a1 + 48);
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v56 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v29 != v7) {
              objc_enumerationMutation(obj);
            }
            if (*((unsigned char *)v33 + 24))
            {
              objc_msgSend(MEMORY[0x1E4F28C58], "hk_transactionInterruptedError");
              id v14 = (id)objc_claimAutoreleasedReturnValue();
              id v12 = v14;
              if (v14)
              {
                if (a3) {
                  *a3 = v14;
                }
                else {
                  _HKLogDroppedError();
                }
              }

              uint64_t v13 = 0;
              goto LABEL_25;
            }
            id v22 = v18;
            id v23 = v21;
            id v24 = v20;
            id v25 = v19;
            id v26 = *(id *)(a1 + 32);
            id v27 = *(id *)(a1 + 40);
            HKWithAutoreleasePool();
          }
          uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v56 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }

      if (v37[3] >= 1)
      {
        _HKInitializeLogging();
        v9 = (id)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = v37[3];
          uint64_t v11 = [*(id *)(a1 + 48) count];
          *(_DWORD *)buf = 134218240;
          uint64_t v53 = v10;
          __int16 v54 = 2048;
          uint64_t v55 = v11;
          _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "Encountered %ld constraint violations while inserting %ld deleted objects", buf, 0x16u);
        }
      }
      if (v41[5])
      {
        id obj = [*(id *)(a1 + 32) dataManager];
        id v12 = [v18 allObjects];
        [obj shouldNotifyForDeletedSamplesOfTypes:v12 intervals:v19 userRequested:0 transaction:v16 anchor:v41[5]];
        uint64_t v13 = 1;
LABEL_25:
      }
      else
      {
        uint64_t v13 = 1;
      }
      _Block_object_dispose(&v32, 8);
      _Block_object_dispose(&v36, 8);
      _Block_object_dispose(&v40, 8);
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t __78__HDDeletedSampleEntity_insertCodableDeletedSamples_provenance_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v4 = objc_alloc_init(HDDataDeletionConfiguration);
  [(HDDataDeletionConfiguration *)v4 setGenerateDeletedObjects:0];
  [(HDDataDeletionConfiguration *)v4 setFailIfNotFound:0];
  [(HDDataDeletionConfiguration *)v4 setNotifyObservers:0];
  v5 = [*(id *)(a1 + 32) dataManager];
  uint64_t v6 = [v5 deleteObjectsWithUUIDCollection:*(void *)(a1 + 40) configuration:v4 error:a2];

  return v6;
}

uint64_t __78__HDDeletedSampleEntity_insertCodableDeletedSamples_provenance_profile_error___block_invoke_3(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  v3 = (double *)*((id *)v2 + 4);
  double v4 = (void *)*((void *)v2 + 1);
  if (_HKValidDataTypeCode())
  {
    uint64_t v5 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:v4];
    if (v5)
    {
      uint64_t v6 = v5;
      [*(id *)(a1 + 40) addObject:v5];
      uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v3[1]];
      uint64_t v46 = v3;
      id v45 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", *((void *)v3 + 5));
      v8 = objc_msgSend(MEMORY[0x1E4F2AEF0], "_deletedObjectWithUUID:metadata:");
      int v9 = *((unsigned char *)v2 + 40) & 6;
      uint64_t v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 48), "persistentID"));
      double v11 = *((double *)v2 + 3);
      double v12 = *((double *)v2 + 2);
      uint64_t v13 = *(void *)(a1 + 56);
      id v48 = 0;
      uint64_t v42 = v8;
      id v43 = (void *)v6;
      v44 = v7;
      id v14 = +[HDDeletedSampleEntity insertDeletedObject:v8 dataType:v6 provenanceIdentifier:v10 deletionDate:v7 persistStartAndEndDates:v9 == 6 startTimestamp:v13 endTimestamp:v11 inDatabase:v12 error:&v48];
      id v15 = v48;

      if (!v14)
      {
        if (objc_msgSend(v15, "hd_isConstraintViolation"))
        {
          ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
          long long v29 = v43;
          id v18 = v45;
        }
        else if (objc_msgSend(v15, "hk_isTransactionInterruptedError"))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
          _HKInitializeLogging();
          uint64_t v32 = *MEMORY[0x1E4F29FA8];
          long long v29 = v43;
          id v18 = v45;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            id v50 = v8;
            __int16 v51 = 2114;
            id v52 = v15;
            _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_INFO, "Transaction interrupted inserting deleted object %{public}@: %{public}@", buf, 0x16u);
          }
        }
        else
        {
          _HKInitializeLogging();
          char v35 = *MEMORY[0x1E4F29FA8];
          long long v29 = v43;
          id v18 = v45;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v50 = v8;
            __int16 v51 = 2114;
            id v52 = v15;
            _os_log_error_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_ERROR, "Failed to insert deleted object %{public}@: %{public}@", buf, 0x16u);
          }
        }
        goto LABEL_29;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), v14);
      if (v9 == 6) {
        [*(id *)(a1 + 64) insertIntervalWithStartTime:*((double *)v2 + 3) endTime:*((double *)v2 + 2)];
      }
      id v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_dictionaryWithCodableMetadata:", *((void *)v3 + 3));
      id v17 = v16;
      id v18 = v45;
      if (v16)
      {
        id v41 = v14;
        uint64_t v19 = *MEMORY[0x1E4F2A1F0];
        id v20 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F2A1F0]];

        if (!v20)
        {
          id v27 = v15;
          long long v29 = v43;
LABEL_24:
          id v14 = v41;
LABEL_28:

          id v15 = v27;
LABEL_29:

          goto LABEL_30;
        }
        uint64_t v21 = *((void *)v3 + 2);
        if ([v3 hasExternalSyncObjectCode])
        {
          [v17 objectForKeyedSubscript:v19];
          v23 = uint64_t v22 = v21;
          id v24 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F2A1F8]];
          uint64_t v40 = *(void *)(a1 + 72);
          uint64_t v39 = *(void *)(a1 + 56);
          uint64_t v25 = [v41 longLongValue];
          id v26 = [*(id *)(a1 + 80) sourceID];
          id v47 = v15;
          LOBYTE(v38) = 1;
          LOBYTE(v25) = +[HDDataExternalSyncIdentifierEntity insertSyncIdentifierWithProfile:database:objectID:localSourceID:externalSyncObjectCode:syncIdentifier:syncVersion:deleted:errorOut:](HDDataExternalSyncIdentifierEntity, "insertSyncIdentifierWithProfile:database:objectID:localSourceID:externalSyncObjectCode:syncIdentifier:syncVersion:deleted:errorOut:", v40, v39, v25, [v26 longLongValue], v22, v23, v24, v38, &v47);
          id v27 = v47;

          if ((v25 & 1) == 0)
          {
            _HKInitializeLogging();
            long long v28 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              id v50 = v23;
              __int16 v51 = 2114;
              id v52 = v24;
              __int16 v53 = 2114;
              id v54 = v27;
              _os_log_error_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_ERROR, "Failed to insert external sync identifier (%{public}@, version %{public}@): %{public}@", buf, 0x20u);
            }
          }

          long long v29 = v43;
          uint64_t v7 = v44;
          v8 = v42;
          v3 = v46;
          goto LABEL_24;
        }
        _HKInitializeLogging();
        id v33 = (void *)*MEMORY[0x1E4F29FA8];
        id v14 = v41;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          uint64_t v36 = v33;
          objc_super v37 = [v45 UUIDString];
          *(_DWORD *)buf = 138543362;
          id v50 = v37;
          _os_log_error_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_ERROR, "HDCodableDeletedSample (%{public}@) with external sync metadata does not contain an external sync object code", buf, 0xCu);

          id v14 = v41;
        }
      }
      id v27 = v15;
      long long v29 = v43;
      v8 = v42;
      goto LABEL_28;
    }
    _HKInitializeLogging();
    long long v30 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      id v50 = v4;
      long long v31 = "unable to look up sample type %ld when inserting codable deleted samples.";
      goto LABEL_17;
    }
  }
  else
  {
    _HKInitializeLogging();
    long long v30 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      id v50 = v4;
      long long v31 = "invalid data type code %ld when inserting codable deleted samples.";
LABEL_17:
      _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0xCu);
    }
  }
LABEL_30:

  return 1;
}

uint64_t __78__HDDeletedSampleEntity_insertCodableDeletedSamples_provenance_profile_error___block_invoke_320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [_HDDeletedSampleInsertionJournalEntry alloc];
  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  id v8 = v6;
  if (v5)
  {
    v16.receiver = v5;
    v16.super_class = (Class)_HDDeletedSampleInsertionJournalEntry;
    uint64_t v5 = (_HDDeletedSampleInsertionJournalEntry *)objc_msgSendSuper2(&v16, sel_init);
    if (v5)
    {
      uint64_t v9 = [v7 copy];
      samples = v5->_samples;
      v5->_samples = (NSArray *)v9;

      uint64_t v11 = [v8 copy];
      provenance = v5->_provenance;
      v5->_provenance = (HDDataOriginProvenance *)v11;
    }
  }

  uint64_t v13 = [*(id *)(a1 + 48) database];
  uint64_t v14 = [v13 addJournalEntry:v5 error:a3];

  return v14;
}

@end