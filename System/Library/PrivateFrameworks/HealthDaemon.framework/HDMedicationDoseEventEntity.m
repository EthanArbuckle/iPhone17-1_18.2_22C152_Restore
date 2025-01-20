@interface HDMedicationDoseEventEntity
+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4;
+ (BOOL)isConcreteEntity;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)codableObjectsFromObjectCollection:(id)a3;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)foreignKeys;
+ (id)indicesWithBehavior:(id)a3;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
+ (id)syntheticQuantityColumnName;
+ (int64_t)shouldInsertObject:(id)a3 sourceID:(id)a4 profile:(id)a5 transaction:(id)a6 objectToReplace:(id *)a7 objectID:(id *)a8 error:(id *)a9;
@end

@implementation HDMedicationDoseEventEntity

+ (id)databaseTable
{
  return @"medication_dose_event_samples";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 10;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)_columnDefinitionsWithCount__columnDefinitions;
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

+ (id)indicesWithBehavior:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v4 = objc_opt_class();
  v20 = @"medication_identifier";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v6 = (void *)[v3 initWithEntity:v4 name:@"medication_identifiers" columns:v5];
  v21[0] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v8 = objc_opt_class();
  v19 = @"medication_uuid";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v10 = (void *)[v7 initWithEntity:v8 name:@"medication_uuids" columns:v9];
  v21[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];

  id v12 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v13 = objc_opt_class();
  v18 = @"hashed_medication_identifier";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v15 = (void *)[v12 initWithEntity:v13 name:@"hashed_medication_identifiers" columns:v14];
  v16 = [v11 arrayByAddingObject:v15];

  return v16;
}

+ (int64_t)shouldInsertObject:(id)a3 sourceID:(id)a4 profile:(id)a5 transaction:(id)a6 objectToReplace:(id *)a7 objectID:(id *)a8 error:(id *)a9
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v53 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = [v14 medicationUUID];
  if (v17)
  {
    v18 = (void *)v17;
    id v51 = v15;
    v19 = (void *)MEMORY[0x1E4F65D08];
    v20 = HDUserDomainConceptEntityPredicateForConceptUUID(v17, 1);
    v21 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"deleted" equalToValue:MEMORY[0x1E4F1CC28]];
    v22 = [v19 compoundPredicateWithPredicate:v20 otherPredicate:v21];

    v23 = v16;
    v24 = [v16 protectedDatabase];
    id v55 = 0;
    v25 = +[HDSQLiteEntity anyInDatabase:v24 predicate:v22 error:&v55];
    id v26 = v55;

    if (!v25)
    {
      if (v26)
      {
        v27 = v53;
        if (a9) {
          *a9 = v26;
        }
        else {
          _HKLogDroppedError();
        }
        int64_t v41 = 2;
      }
      else
      {
        _HKInitializeLogging();
        v42 = HKLogMedication();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = [v14 UUID];
          v44 = objc_msgSend(v43, "hk_shortRepresentation");
          *(_DWORD *)buf = 138543874;
          id v58 = a1;
          __int16 v59 = 2114;
          v60 = v44;
          __int16 v61 = 2114;
          id v62 = v18;
          _os_log_impl(&dword_1BCB7D000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignore insert of %{public}@, because medication with UUID %{public}@ is deleted", buf, 0x20u);
        }
        int64_t v41 = 1;
        v27 = v53;
      }

      v28 = v51;
      goto LABEL_30;
    }

    v27 = v53;
    v28 = v51;
  }
  else
  {
    v29 = [v14 medicationIdentifier];
    id v56 = 0;
    v18 = +[HDUserDomainConceptEntity userDomainConceptUUIDForCanonicalConceptWithSemanticIdentifierString:v29 profile:v15 transaction:v16 error:&v56];
    id v26 = v56;

    v28 = v15;
    if (!v18)
    {
      v23 = v16;
      if (v26)
      {
        v27 = v53;
        if (a9)
        {
          id v26 = v26;
          v18 = 0;
          *a9 = v26;
        }
        else
        {
          _HKLogDroppedError();
          v18 = 0;
        }
        int64_t v41 = 2;
      }
      else
      {
        v45 = v28;
        _HKInitializeLogging();
        v46 = HKLogMedication();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          v47 = [v14 UUID];
          v48 = objc_msgSend(v47, "hk_shortRepresentation");
          v49 = [v14 medicationIdentifier];
          *(_DWORD *)buf = 138543874;
          id v58 = a1;
          __int16 v59 = 2114;
          v60 = v48;
          __int16 v61 = 2112;
          id v62 = v49;
          _os_log_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignore insert of %{public}@, because medicationUUID is nil for %@", buf, 0x20u);
        }
        id v26 = 0;
        v18 = 0;
        int64_t v41 = 1;
        v27 = v53;
        v28 = v45;
      }
      goto LABEL_30;
    }
    [v14 _setMedicationUUID:v18];
    BOOL v30 = +[HDUserDomainConceptEntity incrementSyncAnchorAndAdjustSyncProvenanceIfNotLocalForUserDomainConceptWithUUID:v18 profile:v15 transaction:v16 error:a9];
    v23 = v16;
    if (!v30)
    {
      int64_t v41 = 2;
      v27 = v53;
LABEL_30:

      goto LABEL_31;
    }
    v27 = v53;
  }

  v54.receiver = a1;
  v54.super_class = (Class)&OBJC_METACLASS___HDMedicationDoseEventEntity;
  id v31 = objc_msgSendSuper2(&v54, sel_shouldInsertObject_sourceID_profile_transaction_objectToReplace_objectID_error_, v14, v27, v28, v23, a7, a8, a9);
  if (v31 == (id)1)
  {
    id v32 = a1;
    v33 = v23;
    v34 = v28;
    v35 = [v14 metadata];
    id v26 = [v35 objectForKeyedSubscript:*MEMORY[0x1E4F2A1F0]];

    v36 = [v14 metadata];
    v37 = [v36 objectForKeyedSubscript:*MEMORY[0x1E4F2A1F8]];

    _HKInitializeLogging();
    v38 = HKLogMedication();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = [v14 UUID];
      v40 = objc_msgSend(v39, "hk_shortRepresentation");
      *(_DWORD *)buf = 138544130;
      id v58 = v32;
      __int16 v59 = 2114;
      v60 = v40;
      __int16 v61 = 2114;
      id v62 = v26;
      __int16 v63 = 2114;
      v64 = v37;
      _os_log_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignore insert of %{public}@, because of dedupe logic for (%{public}@, %{public}@)", buf, 0x2Au);

      v27 = v53;
    }

    int64_t v41 = 1;
    v28 = v34;
    v23 = v33;
    goto LABEL_30;
  }
  int64_t v41 = (int64_t)v31;
LABEL_31:

  return v41;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a5;
  id v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDMedicationDoseEventEntity.m", 175, @"Subclasses must override %s", "+[HDMedicationDoseEventEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  id v16 = v14;
  id v17 = v12;
  id v18 = v13;
  uint64_t v19 = self;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_208);
  v20 = (void *)qword_1EBA18C68;
  if (!qword_1EBA18C68)
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v22 = (void *)qword_1EBA18C68;
    qword_1EBA18C68 = (uint64_t)v21;

    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __93__HDMedicationDoseEventEntity__logPersistedDoseEventOnCommitDatabase_doseEvent_persistentID___block_invoke;
    v39[3] = &__block_descriptor_40_e5_v8__0l;
    v39[4] = v19;
    [v16 onCommit:v39 orRollback:&__block_literal_global_364_2];
    v20 = (void *)qword_1EBA18C68;
  }
  if ((unint64_t)[v20 count] <= 0x63)
  {
    v23 = (void *)qword_1EBA18C68;
    id v24 = [NSString alloc];
    uint64_t v25 = [v18 longLongValue];
    id v26 = [v17 UUID];
    v27 = objc_msgSend(v26, "hk_shortRepresentation");
    v28 = (void *)[v24 initWithFormat:@"(%lld, %@)", v25, v27];
    [v23 addObject:v28];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_208);

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __93__HDMedicationDoseEventEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2;
  v36[3] = &unk_1E62F2900;
  id v37 = v18;
  id v38 = v17;
  id v29 = v17;
  id v30 = v18;
  int v31 = [v16 executeCachedStatementForKey:&insertDataObject_withProvenance_inDatabase_persistentID_error__insertKey_2 error:a7 SQLGenerator:&__block_literal_global_119 bindingHandler:v36 enumerationHandler:0];

  if (v31) {
    id v32 = v30;
  }
  else {
    id v32 = 0;
  }
  id v33 = v32;

  return v33;
}

__CFString *__93__HDMedicationDoseEventEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke()
{
  return @"INSERT INTO medication_dose_event_samples (data_id, log_origin, schedule_item_identifier, medication_uuid, medication_identifier, scheduled_dose_quantity, dose_quantity, scheduled_date, status, hashed_medication_identifier) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
}

void __93__HDMedicationDoseEventEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) longLongValue]);
  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 40) logOrigin]);
  uint64_t v4 = [*(id *)(a1 + 40) scheduleItemIdentifier];

  if (v4)
  {
    v5 = [*(id *)(a1 + 40) scheduleItemIdentifier];
    HDSQLiteBindFoundationValueToStatement();
  }
  else
  {
    sqlite3_bind_null(a2, 3);
  }
  v6 = [*(id *)(a1 + 40) medicationUUID];
  HDSQLiteBindFoundationValueToStatement();

  id v7 = [*(id *)(a1 + 40) medicationIdentifier];
  HDSQLiteBindFoundationValueToStatement();

  uint64_t v8 = [*(id *)(a1 + 40) scheduledDoseQuantity];

  if (v8)
  {
    v9 = [*(id *)(a1 + 40) scheduledDoseQuantity];
    [v9 doubleValue];
    sqlite3_bind_double(a2, 6, v10);
  }
  else
  {
    sqlite3_bind_null(a2, 6);
  }
  v11 = [*(id *)(a1 + 40) doseQuantity];

  if (v11)
  {
    id v12 = [*(id *)(a1 + 40) doseQuantity];
    [v12 doubleValue];
    sqlite3_bind_double(a2, 7, v13);
  }
  else
  {
    sqlite3_bind_null(a2, 7);
  }
  id v14 = [*(id *)(a1 + 40) scheduledDate];

  if (v14)
  {
    id v15 = [*(id *)(a1 + 40) scheduledDate];
    [v15 timeIntervalSinceReferenceDate];
    sqlite3_bind_double(a2, 8, v16);
  }
  else
  {
    sqlite3_bind_null(a2, 8);
  }
  sqlite3_bind_int64(a2, 9, [*(id *)(a1 + 40) status]);
  id v17 = objc_alloc(MEMORY[0x1E4F2B200]);
  id v18 = [*(id *)(a1 + 40) medicationIdentifier];
  id v20 = (id)[v17 initWithSemanticIdentifierString:v18];

  uint64_t v19 = [v20 underlyingIdentifier];
  HDSQLiteBindFoundationValueToStatement();
}

void __93__HDMedicationDoseEventEntity__logPersistedDoseEventOnCommitDatabase_doseEvent_persistentID___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_208);
  v2 = (void *)[(id)qword_1EBA18C68 copy];
  id v3 = (void *)qword_1EBA18C68;
  qword_1EBA18C68 = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_208);
  _HKInitializeLogging();
  uint64_t v4 = HKLogMedication();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [v2 count];
    id v7 = [v2 componentsJoinedByString:@", "];
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    double v13 = v7;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: persisted %ld [%{public}@]", (uint8_t *)&v8, 0x20u);
  }
}

void __93__HDMedicationDoseEventEntity__logPersistedDoseEventOnCommitDatabase_doseEvent_persistentID___block_invoke_362()
{
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_208);
  v0 = (void *)qword_1EBA18C68;
  qword_1EBA18C68 = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_208);
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  id v3 = [a3 generatedObjectCollection];
  uint64_t v4 = [v3 medicationDoseEvents];

  return v4;
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3) {
    [a4 addMedicationDoseEvent:a3];
  }
  return a3 != 0;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(HDEntityEncoder *)[_HDMedicationDoseEventEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (id)syntheticQuantityColumnName
{
  return @"dose_quantity";
}

@end