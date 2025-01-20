@interface HDMedicationScheduleEntity
+ (BOOL)enumerateSchedulesWithPredicate:(id)a3 limit:(unint64_t)a4 orderingTerms:(id)a5 transaction:(id)a6 error:(id *)a7 enumerationHandler:(id)a8;
+ (BOOL)insertMedicationSchedule:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (BOOL)updateMedicationSchedulesToBeDeletedWithMedicationUUID:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (HDCodableMedicationSchedule)_codableRepresentationForMedicationScheduleID:(uint64_t)a3 row:(void *)a4 profile:(void *)a5 transaction:(uint64_t)a6 error:;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_insertSchedule:(uint64_t)a3 syncProvenance:(uint64_t)a4 syncIdentity:(void *)a5 profile:(void *)a6 transaction:(uint64_t)a7 error:;
+ (id)_medicationScheduleFromRow:(uint64_t)a3 persistentID:(void *)a4 transaction:(NSObject *)a5 error:;
+ (id)allActiveMedicationSchedulesWithTransaction:(id)a3 error:(id *)a4;
+ (id)availableSchedulePredicate;
+ (id)compatibilityVersion0ScheduleTypesPredicate;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)privateSubEntities;
+ (id)propertyForSyncAnchor;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (int64_t)allActiveSchedulesCreatedWithinTimeZone:(id)a3 transaction:(id)a4 offsetChange:(int64_t *)a5 error:(id *)a6;
+ (int64_t)protectionClass;
+ (uint64_t)_enumerateSchedulesWithPredicate:(uint64_t)a3 limit:(void *)a4 orderingTerms:(void *)a5 transaction:(uint64_t)a6 error:(void *)a7 enumerationHandler:;
+ (uint64_t)_insertMedicationSchedule:(uint64_t)a3 syncProvenance:(uint64_t)a4 syncIdentity:(void *)a5 profile:(void *)a6 transaction:(void *)a7 error:;
+ (uint64_t)_insertTimeIntervals:(void *)a3 schedulePrimaryKey:(void *)a4 transaction:(uint64_t)a5 error:;
+ (uint64_t)_isNewestSchedule:(void *)a3 transaction:(uint64_t)a4 error:;
+ (uint64_t)_shouldProceedWithInsertionForSchedule:(void *)a3 profile:(void *)a4 transaction:(void *)a5 error:;
@end

@implementation HDMedicationScheduleEntity

+ (int64_t)protectionClass
{
  return 2;
}

uint64_t __88__HDMedicationScheduleEntity__medicationScheduleFromRow_persistentID_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (BOOL)enumerateSchedulesWithPredicate:(id)a3 limit:(unint64_t)a4 orderingTerms:(id)a5 transaction:(id)a6 error:(id *)a7 enumerationHandler:(id)a8
{
  return +[HDMedicationScheduleEntity _enumerateSchedulesWithPredicate:limit:orderingTerms:transaction:error:enumerationHandler:]((uint64_t)a1, a3, a4, a5, a6, (uint64_t)a7, a8);
}

+ (uint64_t)_enumerateSchedulesWithPredicate:(uint64_t)a3 limit:(void *)a4 orderingTerms:(void *)a5 transaction:(uint64_t)a6 error:(void *)a7 enumerationHandler:
{
  id v12 = a5;
  id v13 = a7;
  id v14 = a4;
  id v15 = a2;
  v16 = self;
  v17 = [v12 databaseForEntityClass:v16];
  v18 = [v16 queryWithDatabase:v17 predicate:v15 limit:a3 orderingTerms:v14 groupBy:0];

  v19 = HDMedicationsScheduleEntityAllProperties();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __120__HDMedicationScheduleEntity__enumerateSchedulesWithPredicate_limit_orderingTerms_transaction_error_enumerationHandler___block_invoke;
  v24[3] = &unk_1E63385F0;
  id v26 = v13;
  v27 = v16;
  id v25 = v12;
  id v20 = v13;
  id v21 = v12;
  uint64_t v22 = [v18 enumeratePersistentIDsAndProperties:v19 error:a6 enumerationHandler:v24];

  return v22;
}

uint64_t __120__HDMedicationScheduleEntity__enumerateSchedulesWithPredicate_limit_orderingTerms_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, NSObject **a5)
{
  v6 = +[HDMedicationScheduleEntity _medicationScheduleFromRow:persistentID:transaction:error:](*(void *)(a1 + 48), a4, a2, *(void **)(a1 + 32), a5);
  if (v6) {
    uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)_medicationScheduleFromRow:(uint64_t)a3 persistentID:(void *)a4 transaction:(NSObject *)a5 error:
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v42 = self;
  v54 = HDSQLiteColumnWithNameAsUUID();
  v53 = HDSQLiteColumnWithNameAsUUID();
  uint64_t v51 = HDSQLiteColumnWithNameAsString();
  uint64_t v50 = HDSQLiteColumnWithNameAsDate();
  uint64_t v7 = HDSQLiteColumnWithNameAsDate();
  uint64_t v8 = HDSQLiteColumnWithNameAsString();
  objc_opt_class();
  uint64_t v9 = HDSQLiteColumnWithNameAsObject();
  uint64_t v10 = HDSQLiteColumnWithNameAsString();
  HDSQLiteColumnWithNameAsDouble();
  double v12 = v11;
  char v13 = HDSQLiteColumnWithNameAsBoolean();
  uint64_t v47 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v45 = HDSQLiteColumnWithNameAsInt64();
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v57 = 0;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __88__HDMedicationScheduleEntity__medicationScheduleFromRow_persistentID_transaction_error___block_invoke;
  v55[3] = &unk_1E63383D8;
  id v15 = v14;
  id v56 = v15;
  BOOL v16 = +[HDMedicationScheduleIntervalDataEntity enumerateMedicationScheduleIntervalDataWithOwnerID:a3 transaction:v6 error:&v57 enumerationHandler:v55];

  id v17 = v57;
  v52 = v17;
  if (!v16)
  {
    v31 = v17;
    id v46 = v15;
    v49 = (void *)v9;
    v23 = (void *)v8;
    _HKInitializeLogging();
    v32 = HKLogMedication();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v59 = v42;
      __int16 v60 = 2114;
      uint64_t v61 = (uint64_t)v54;
      __int16 v62 = 2114;
      uint64_t v63 = (uint64_t)v31;
      _os_log_error_impl(&dword_1BD54A000, v32, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch intervals for schedule UUID: %{public}@ error: %{public}@", buf, 0x20u);
    }

    v33 = v31;
    v34 = v33;
    v27 = (void *)v51;
    id v26 = (void *)v50;
    if (v33)
    {
      v30 = (void *)v10;
      if (a5)
      {
        v34 = v33;
        v28 = 0;
        *a5 = v34;
      }
      else
      {
        _HKLogDroppedError();
        v28 = 0;
      }
    }
    else
    {
      v28 = 0;
      v30 = (void *)v10;
    }
    v29 = v46;
    id v25 = v49;
    goto LABEL_16;
  }
  uint64_t v44 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v18 = HDSQLiteColumnWithNameAsInt64();
  v19 = (void *)v8;
  char v20 = v13;
  id v21 = v7;
  uint64_t v41 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v40 = HDSQLiteColumnWithNameAsInt64();
  id v22 = objc_alloc(MEMORY[0x1E4F66B28]);
  v23 = v19;
  v24 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v19];
  uint64_t v39 = v47;
  v48 = (void *)v10;
  LOBYTE(v38) = v20;
  id v25 = (void *)v9;
  uint64_t v36 = v18;
  uint64_t v37 = v9;
  id v26 = (void *)v50;
  v27 = (void *)v51;
  v28 = objc_msgSend(v22, "initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:", v54, v53, v51, v24, v50, v21, v12, v15, v44, v36, v37, v38, v10, v39, v45);

  uint64_t v7 = v21;
  v29 = v15;
  if ([v28 isUnavailable] & 1) != 0 || (objc_msgSend(v28, "isDeleted"))
  {
    v30 = v48;
    goto LABEL_17;
  }
  v30 = v48;
  if (![v28 scheduleType])
  {
    _HKInitializeLogging();
    v34 = HKLogMedication();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v59 = v42;
      __int16 v60 = 2048;
      uint64_t v61 = v41;
      __int16 v62 = 2048;
      uint64_t v63 = v40;
      __int16 v64 = 2114;
      v65 = v28;
      _os_log_error_impl(&dword_1BD54A000, v34, OS_LOG_TYPE_ERROR, "[%{public}@] Attempting to enumerate unexpected schedule with sync_provenance: %ld and sync_identity: %ld: %{public}@", buf, 0x2Au);
    }
LABEL_16:
  }
LABEL_17:

  return v28;
}

+ (id)databaseTable
{
  return @"medication_schedules";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 19;
  return (const $BAB52C3E828CEF64050DB2B91BCCE94A *)columnDefinitionsWithCount__columnDefinitions_1;
}

+ (id)privateSubEntities
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)allActiveMedicationSchedulesWithTransaction:(id)a3 error:(id *)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  uint64_t v8 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"deleted" equalToValue:MEMORY[0x1E4F1CC28]];
  uint64_t v9 = HDMedicationSchedulePredicateForActiveMedications();
  uint64_t v10 = (void *)MEMORY[0x1E4F65D08];
  v19[0] = v8;
  v19[1] = v9;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  double v12 = [v10 predicateMatchingAllPredicates:v11];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__HDMedicationScheduleEntity_allActiveMedicationSchedulesWithTransaction_error___block_invoke;
  v17[3] = &unk_1E6337228;
  id v18 = v7;
  id v13 = v7;
  LODWORD(a4) = +[HDMedicationScheduleEntity enumerateSchedulesWithPredicate:v12 limit:0 orderingTerms:0 transaction:v6 error:a4 enumerationHandler:v17];

  if (a4) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  return v15;
}

uint64_t __80__HDMedicationScheduleEntity_allActiveMedicationSchedulesWithTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (int64_t)allActiveSchedulesCreatedWithinTimeZone:(id)a3 transaction:(id)a4 offsetChange:(int64_t *)a5 error:(id *)a6
{
  v31[3] = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v23 = a4;
  uint64_t v9 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"deleted" equalToValue:MEMORY[0x1E4F1CC28]];
  uint64_t v10 = HDMedicationSchedulePredicateForActiveMedications();
  double v11 = [MEMORY[0x1E4F65D10] doesNotContainPredicateWithProperty:@"schedule_type" values:&unk_1F17FC810];
  double v12 = (void *)MEMORY[0x1E4F65D08];
  v31[0] = v9;
  v31[1] = v10;
  v31[2] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
  id v14 = [v12 predicateMatchingAllPredicates:v13];

  id v15 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"creation_date" entityClass:objc_opt_class() ascending:0];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 1;
  if (a5) {
    *a5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v16 = objc_msgSend(v24, "secondsFromGMT", a6);
  v30 = v15;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  uint64_t v18 = *MEMORY[0x1E4F65DE0];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __101__HDMedicationScheduleEntity_allActiveSchedulesCreatedWithinTimeZone_transaction_offsetChange_error___block_invoke;
  v25[3] = &unk_1E63385C8;
  v25[5] = v16;
  v25[6] = a5;
  v25[4] = &v26;
  LODWORD(v16) = +[HDMedicationScheduleEntity _enumerateSchedulesWithPredicate:limit:orderingTerms:transaction:error:enumerationHandler:]((uint64_t)a1, v14, v18, v17, v23, v22, v25);

  if (v16) {
    int64_t v19 = v27[3];
  }
  else {
    int64_t v19 = 0;
  }
  _Block_object_dispose(&v26, 8);

  return v19;
}

BOOL __101__HDMedicationScheduleEntity_allActiveSchedulesCreatedWithinTimeZone_transaction_offsetChange_error___block_invoke(void *a1, void *a2)
{
  v3 = [a2 createdUTCOffset];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 secondsFromGMT];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    uint64_t v5 = [v6 secondsFromGMT];
  }
  uint64_t v7 = a1[5];
  if (v7 >= 0) {
    uint64_t v8 = a1[5];
  }
  else {
    uint64_t v8 = -v7;
  }
  if (v5 >= 0) {
    uint64_t v9 = v5;
  }
  else {
    uint64_t v9 = -v5;
  }
  if (v8 != v9)
  {
    uint64_t v10 = (void *)a1[6];
    if (v10) {
      *uint64_t v10 = v7 - v5;
    }
    *(void *)(*(void *)(a1[4] + 8) + 24) = 2;
  }
  return v8 == v9;
}

+ (BOOL)insertMedicationSchedule:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  return +[HDMedicationScheduleEntity _insertMedicationSchedule:syncProvenance:syncIdentity:profile:transaction:error:]((uint64_t)a1, a3, a4, a5, a6, a7, a8);
}

+ (uint64_t)_insertMedicationSchedule:(uint64_t)a3 syncProvenance:(uint64_t)a4 syncIdentity:(void *)a5 profile:(void *)a6 transaction:(void *)a7 error:
{
  id v12 = a2;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = self;
  uint64_t v16 = +[HDMedicationScheduleEntity _shouldProceedWithInsertionForSchedule:profile:transaction:error:](v15, v12, v13, v14, a7);
  if (v16 == 1)
  {
    id v17 = +[HDMedicationScheduleEntity _insertSchedule:syncProvenance:syncIdentity:profile:transaction:error:](v15, v12, a3, a4, v13, v14, (uint64_t)a7);
    if (v17)
    {
      uint64_t v18 = [v12 timeIntervals];
      uint64_t v19 = +[HDMedicationScheduleEntity _insertTimeIntervals:schedulePrimaryKey:transaction:error:](v15, v18, v17, v14, (uint64_t)a7);
    }
    else
    {
      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v19 = v16 == 2;
  }

  return v19;
}

+ (uint64_t)_shouldProceedWithInsertionForSchedule:(void *)a3 profile:(void *)a4 transaction:(void *)a5 error:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  if ([v8 needsToBeMadeUnavailable])
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    id v13 = [v8 description];
    objc_msgSend(v12, "hk_assignError:code:format:", a5, 100, @"Attempted to save a HKMedicationSchedule [%@] that should have been made unavailable. Before inserting a schedule that is not understood by the current operating system, you must call -[HKMedicationSchedule unavailableSchedule] before insertion, and insert the copy returned instead.", v13);

    uint64_t v14 = 0;
    goto LABEL_32;
  }
  if (![v8 isDeleted])
  {
    if (([v8 isUnavailable] & 1) == 0 && !objc_msgSend(v8, "scheduleType"))
    {
      _HKInitializeLogging();
      uint64_t v18 = HKLogMedication();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[HDMedicationScheduleEntity _shouldProceedWithInsertionForSchedule:profile:transaction:error:]();
      }
    }
    uint64_t v19 = [v8 medicationUUID];
    if (v19)
    {
      char v20 = (void *)v19;
      id v21 = (void *)MEMORY[0x1E4F65D08];
      uint64_t v22 = HDUserDomainConceptEntityPredicateForConceptUUID();
      id v23 = [MEMORY[0x1E4F65D00] predicateWithProperty:*MEMORY[0x1E4F65A28] equalToValue:MEMORY[0x1E4F1CC28]];
      id v24 = [v21 compoundPredicateWithPredicate:v22 otherPredicate:v23];

      id v25 = (void *)MEMORY[0x1E4F65C20];
      uint64_t v26 = [v10 protectedDatabase];
      id v33 = 0;
      v27 = [v25 anyInDatabase:v26 predicate:v24 error:&v33];
      id v28 = v33;

      if (!v27)
      {
        if (v28)
        {
          if (a5)
          {
            uint64_t v14 = 0;
            *a5 = v28;
          }
          else
          {
            _HKLogDroppedError();
            uint64_t v14 = 0;
          }
        }
        else
        {
          uint64_t v14 = 2;
        }

        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v29 = (void *)MEMORY[0x1E4F65C20];
      v30 = [v8 medicationIdentifier];
      char v20 = [v29 userDomainConceptUUIDForCanonicalConceptWithSemanticIdentifierString:v30 profile:v9 transaction:v10 error:a5];

      if (!v20)
      {
        _HKInitializeLogging();
        v31 = HKLogMedication();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          +[HDMedicationScheduleEntity _shouldProceedWithInsertionForSchedule:profile:transaction:error:](v11, v8, v31);
        }

        char v20 = 0;
        uint64_t v14 = 2;
        goto LABEL_31;
      }
      if (![MEMORY[0x1E4F65C20] incrementSyncAnchorAndAdjustSyncProvenanceIfNotLocalForUserDomainConceptWithUUID:v20 profile:v9 transaction:v10 error:a5])
      {
        uint64_t v14 = 0;
        goto LABEL_31;
      }
      [v8 _setMedicationUUID:v20];
    }
    uint64_t v14 = +[HDMedicationScheduleEntity _isNewestSchedule:transaction:error:](v11, v8, v10, (uint64_t)a5);
LABEL_31:

    goto LABEL_32;
  }
  _HKInitializeLogging();
  uint64_t v15 = HKLogMedication();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

  if (v16)
  {
    id v17 = HKLogMedication();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      +[HDMedicationScheduleEntity _shouldProceedWithInsertionForSchedule:profile:transaction:error:](v11, v17);
    }
  }
  uint64_t v14 = 1;
LABEL_32:

  return v14;
}

+ (id)_insertSchedule:(uint64_t)a3 syncProvenance:(uint64_t)a4 syncIdentity:(void *)a5 profile:(void *)a6 transaction:(uint64_t)a7 error:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = self;
  BOOL v16 = [v14 protectedDatabase];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __100__HDMedicationScheduleEntity__insertSchedule_syncProvenance_syncIdentity_profile_transaction_error___block_invoke;
  v30[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v30[4] = v15;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __100__HDMedicationScheduleEntity__insertSchedule_syncProvenance_syncIdentity_profile_transaction_error___block_invoke_2;
  v26[3] = &unk_1E6338618;
  id v17 = v12;
  id v27 = v17;
  uint64_t v28 = a4;
  uint64_t v29 = a3;
  uint64_t v18 = 0;
  if ([v16 executeCachedStatementForKey:&_insertSchedule_syncProvenance_syncIdentity_profile_transaction_error__statementKey error:a7 SQLGenerator:v30 bindingHandler:v26 enumerationHandler:0])
  {
    if ((int)[v16 getChangesCount] < 1)
    {
      id v24 = (void *)MEMORY[0x1E4F28C58];
      id v23 = [v17 UUID];
      objc_msgSend(v24, "hk_assignError:code:format:", a7, 115, @"Duplicate medication schedule with UUID %@", v23);
      uint64_t v18 = 0;
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v19 = HKLogMedication();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        char v20 = [v16 lastInsertRowID];
        uint64_t v21 = [v20 longLongValue];
        *(_DWORD *)buf = 138544386;
        uint64_t v32 = v15;
        __int16 v33 = 2048;
        uint64_t v34 = v21;
        __int16 v35 = 2048;
        uint64_t v36 = a4;
        __int16 v37 = 2048;
        uint64_t v38 = a3;
        __int16 v39 = 2114;
        id v40 = v17;
        _os_log_impl(&dword_1BD54A000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Inserted schedule with persistent ID: %lld sync_identity: %lld, sync_provenance=%lld description: %{public}@", buf, 0x34u);
      }
      uint64_t v22 = [v13 healthMedicationsProfileExtension];
      id v23 = [v22 medicationScheduleManager];

      [v23 batchNotifyObserversOnCommitOfTransaction:v14 didAddOrModifySchedule:v17 syncIdentity:a4];
      uint64_t v18 = [v16 lastInsertRowID];
    }
  }
  return v18;
}

+ (uint64_t)_insertTimeIntervals:(void *)a3 schedulePrimaryKey:(void *)a4 transaction:(uint64_t)a5 error:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  self;
  uint64_t v11 = [v10 databaseForEntityClass:objc_opt_class()];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    while (2)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = +[HDMedicationScheduleIntervalDataEntity insertPersistableMedicationScheduleIntervalData:ownerID:database:error:](HDMedicationScheduleIntervalDataEntity, "insertPersistableMedicationScheduleIntervalData:ownerID:database:error:", *(void *)(*((void *)&v20 + 1) + 8 * v16), v9, v11, a5, (void)v20);

        if (!v17)
        {
          uint64_t v18 = 0;
          goto LABEL_11;
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  uint64_t v18 = 1;
LABEL_11:

  return v18;
}

+ (uint64_t)_isNewestSchedule:(void *)a3 transaction:(uint64_t)a4 error:
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a2;
  id v8 = self;
  id v9 = [v7 UUID];
  id v10 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"uuid" value:v9 comparisonType:1];

  uint64_t v11 = [v7 medicationIdentifier];
  id v12 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"medication_identifier" equalToValue:v11];

  uint64_t v13 = (void *)MEMORY[0x1E4F65D08];
  v25[0] = v10;
  v25[1] = v12;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  uint64_t v15 = [v13 predicateMatchingAnyPredicates:v14];

  [v7 creationTimestamp];
  uint64_t v16 = HDMedicationSchedulePredicateForCreationDate(5);
  id v17 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v15 otherPredicate:v16];
  uint64_t v18 = [v6 databaseForEntityClass:v8];

  uint64_t v19 = [v8 countValueForProperty:@"creation_date" predicate:v17 database:v18 error:a4];

  if (v19)
  {
    if ([v19 integerValue] < 1)
    {
      uint64_t v21 = 1;
    }
    else
    {
      _HKInitializeLogging();
      long long v20 = HKLogMedication();
      uint64_t v21 = 2;
      BOOL v22 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);

      if (v22)
      {
        long long v23 = HKLogMedication();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          +[HDMedicationScheduleEntity _isNewestSchedule:transaction:error:]();
        }

        uint64_t v21 = 2;
      }
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

__CFString *__100__HDMedicationScheduleEntity__insertSchedule_syncProvenance_syncIdentity_profile_transaction_error___block_invoke()
{
  return @"INSERT OR REPLACE INTO medication_schedules (uuid, medication_uuid, medication_identifier, start_date_time, end_date_time, created_time_zone, frequency_type, cycle_start_date_components, note, creation_date, deleted, sync_identity, sync_provenance, minimum_compatibility_version, origin_compatibility_version, schedule_type, display_options, sync_anchor)VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, COALESCE((SELECT MAX(sync_anchor) + 1 FROM medication_schedules), 1))";
}

uint64_t __100__HDMedicationScheduleEntity__insertSchedule_syncProvenance_syncIdentity_profile_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  v4 = [*(id *)(a1 + 32) UUID];
  HDSQLiteBindFoundationValueToStatement();

  uint64_t v5 = [*(id *)(a1 + 32) medicationUUID];
  HDSQLiteBindFoundationValueToStatement();

  id v6 = [*(id *)(a1 + 32) medicationIdentifier];
  if (v6 != &stru_1F17F0380)
  {
    id v7 = v6;
    id v8 = [*(id *)(a1 + 32) medicationIdentifier];
    if ([v8 isEqualToString:&stru_1F17F0380])
    {
    }
    else
    {
      id v9 = [*(id *)(a1 + 32) medicationIdentifier];

      if (v9)
      {
        id v10 = [*(id *)(a1 + 32) medicationIdentifier];
        HDSQLiteBindStringToStatement();

        goto LABEL_7;
      }
    }
  }
  sqlite3_bind_null(a2, 3);
LABEL_7:
  uint64_t v11 = [*(id *)(a1 + 32) startDateTime];
  HDSQLiteBindFoundationValueToStatement();

  id v12 = [*(id *)(a1 + 32) endDateTime];
  HDSQLiteBindFoundationValueToStatement();

  uint64_t v13 = [*(id *)(a1 + 32) createdUTCOffset];
  uint64_t v14 = [v13 name];
  HDSQLiteBindStringToStatement();

  sqlite3_bind_int64(a2, 7, [*(id *)(a1 + 32) frequencyType]);
  uint64_t v15 = [*(id *)(a1 + 32) cycleStartDate];

  if (v15)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F28DB0];
    id v17 = [*(id *)(a1 + 32) cycleStartDate];
    uint64_t v18 = [v16 archivedDataWithRootObject:v17 requiringSecureCoding:1 error:0];

    id v19 = v18;
    sqlite3_bind_blob64(a2, 8, (const void *)[v19 bytes], objc_msgSend(v19, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(a2, 8);
  }
  long long v20 = [*(id *)(a1 + 32) note];

  if (v20)
  {
    uint64_t v21 = [*(id *)(a1 + 32) note];
    HDSQLiteBindStringToStatement();
  }
  else
  {
    sqlite3_bind_null(a2, 9);
  }
  [*(id *)(a1 + 32) creationTimestamp];
  sqlite3_bind_double(a2, 10, v22);
  sqlite3_bind_int(a2, 11, [*(id *)(a1 + 32) isDeleted]);
  sqlite3_bind_int64(a2, 12, *(void *)(a1 + 40));
  sqlite3_bind_int64(a2, 13, *(void *)(a1 + 48));
  sqlite3_bind_int64(a2, 14, [*(id *)(a1 + 32) compatibilityRange]);
  [*(id *)(a1 + 32) compatibilityRange];
  sqlite3_bind_int64(a2, 15, v23);
  sqlite3_bind_int64(a2, 16, [*(id *)(a1 + 32) scheduleType]);
  sqlite3_int64 v24 = [*(id *)(a1 + 32) displayOptions];
  return sqlite3_bind_int64(a2, 17, v24);
}

+ (BOOL)updateMedicationSchedulesToBeDeletedWithMedicationUUID:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [a5 protectedDatabase];
  uint64_t v12 = [v10 currentSyncIdentityPersistentID];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __111__HDMedicationScheduleEntity_updateMedicationSchedulesToBeDeletedWithMedicationUUID_profile_transaction_error___block_invoke;
  v18[3] = &unk_1E6338640;
  id v19 = @"INSERT OR REPLACE INTO medication_schedules (uuid, medication_uuid, medication_identifier, start_date_time, created_time_zone, frequency_type, creation_date, deleted, sync_provenance, sync_identity, minimum_compatibility_version, origin_compatibility_version, schedule_type, display_options, sync_anchor) SELECT uuid, medication_uuid, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, COALESCE((SELECT MAX(sync_anchor) + 1 FROM medication_schedules), 1) FROM medication_schedules WHERE medication_uuid = ? AND deleted = ?";
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __111__HDMedicationScheduleEntity_updateMedicationSchedulesToBeDeletedWithMedicationUUID_profile_transaction_error___block_invoke_2;
  v15[3] = &unk_1E6338170;
  id v16 = v9;
  uint64_t v17 = v12;
  id v13 = v9;
  LOBYTE(a6) = [v11 executeCachedStatementForKey:&updateMedicationSchedulesToBeDeletedWithMedicationUUID_profile_transaction_error__statementKeyUDCUpdate error:a6 SQLGenerator:v18 bindingHandler:v15 enumerationHandler:0];

  return (char)a6;
}

id __111__HDMedicationScheduleEntity_updateMedicationSchedulesToBeDeletedWithMedicationUUID_profile_transaction_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __111__HDMedicationScheduleEntity_updateMedicationSchedulesToBeDeletedWithMedicationUUID_profile_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_null(a2, 1);
  sqlite3_bind_double(a2, 2, 0.0);
  v4 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  uint64_t v5 = [v4 name];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 4, 0);
  double Current = CFAbsoluteTimeGetCurrent();
  sqlite3_bind_double(a2, 5, Current);
  sqlite3_bind_int64(a2, 6, 1);
  sqlite3_bind_int64(a2, 7, 0);
  sqlite3_bind_int64(a2, 8, *(void *)(a1 + 40));
  sqlite3_bind_int64(a2, 9, 0);
  sqlite3_bind_int64(a2, 10, 1);
  sqlite3_bind_int64(a2, 11, 0);
  sqlite3_bind_int64(a2, 12, 0);
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int(a2, 14, 0);
}

+ (id)propertyForSyncProvenance
{
  return @"sync_provenance";
}

+ (id)propertyForSyncAnchor
{
  return @"sync_anchor";
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
  uint64_t v15 = [(HDEntityEncoder *)[HDMedicationScheduleEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (HDCodableMedicationSchedule)_codableRepresentationForMedicationScheduleID:(uint64_t)a3 row:(void *)a4 profile:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v9 = a5;
  id v10 = a4;
  self;
  id v11 = objc_alloc_init(HDCodableMedicationSchedule);
  id v12 = HDSQLiteColumnWithNameAsUUID();
  id v13 = objc_msgSend(v12, "hk_dataForUUIDBytes");
  [(HDCodableMedicationSchedule *)v11 setUuid:v13];

  id v14 = HDSQLiteColumnWithNameAsUUID();
  uint64_t v15 = objc_msgSend(v14, "hk_dataForUUIDBytes");
  [(HDCodableMedicationSchedule *)v11 setMedicationUUID:v15];

  uint64_t v16 = HDSQLiteColumnWithNameAsString();
  uint64_t v17 = (void *)v16;
  if (v16) {
    uint64_t v18 = (__CFString *)v16;
  }
  else {
    uint64_t v18 = &stru_1F17F0380;
  }
  [(HDCodableMedicationSchedule *)v11 setMedicationIdentifier:v18];

  id v19 = HDSQLiteColumnWithNameAsDate();
  [v19 timeIntervalSinceReferenceDate];
  -[HDCodableMedicationSchedule setStartDateTime:](v11, "setStartDateTime:");

  long long v20 = HDSQLiteColumnWithNameAsDate();
  [v20 timeIntervalSinceReferenceDate];
  -[HDCodableMedicationSchedule setEndDateTime:](v11, "setEndDateTime:");

  uint64_t v21 = HDSQLiteColumnWithNameAsString();
  [(HDCodableMedicationSchedule *)v11 setCreatedTimeZone:v21];

  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableMedicationSchedule setFrequencyType:](v11, "setFrequencyType:");
  objc_opt_class();
  double v22 = HDSQLiteColumnWithNameAsObject();
  sqlite3_int64 v23 = objc_msgSend(v22, "hk_codableDateComponents");
  [(HDCodableMedicationSchedule *)v11 setCycleStartDateComponents:v23];

  sqlite3_int64 v24 = HDSQLiteColumnWithNameAsString();
  [(HDCodableMedicationSchedule *)v11 setNote:v24];

  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableMedicationSchedule setCreationDate:](v11, "setCreationDate:");
  [(HDCodableMedicationSchedule *)v11 setDeleted:HDSQLiteColumnWithNameAsBoolean()];
  uint64_t v25 = objc_alloc_init(HDCodableMedicationScheduleCompatibilityVersionRange);
  [(HDCodableMedicationScheduleCompatibilityVersionRange *)v25 setMinimum:HDSQLiteColumnWithNameAsInt64()];
  [(HDCodableMedicationScheduleCompatibilityVersionRange *)v25 setOrigin:HDSQLiteColumnWithNameAsInt64()];
  [(HDCodableMedicationSchedule *)v11 setCompatibilityVersionRange:v25];
  [(HDCodableMedicationSchedule *)v11 setScheduleType:HDSQLiteColumnWithNameAsInt64()];
  [(HDCodableMedicationSchedule *)v11 setDisplayOptions:HDSQLiteColumnWithNameAsInt64()];
  uint64_t v26 = HDSQLiteColumnWithNameAsInt64();
  id v27 = [v10 syncIdentityManager];

  id v35 = 0;
  uint64_t v28 = [v27 identityForEntityID:v26 transaction:v9 error:&v35];
  id v29 = v35;

  if (v28)
  {
    v30 = [v28 identity];
    v31 = [v30 codableSyncIdentity];
    [(HDCodableMedicationSchedule *)v11 setSyncIdentity:v31];

    if (+[HDMedicationScheduleIntervalDataEntity addIntervalDataToCodable:v11 withScheduleID:a2 transaction:v9 error:a6])
    {
      uint64_t v32 = v11;
      goto LABEL_10;
    }
  }
  else
  {
    _HKInitializeLogging();
    __int16 v33 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT)) {
      +[HDMedicationScheduleEntity _codableRepresentationForMedicationScheduleID:row:profile:transaction:error:]((uint64_t)v29, v33);
    }
  }
  uint64_t v32 = 0;
LABEL_10:

  return v32;
}

+ (id)availableSchedulePredicate
{
  return (id)[MEMORY[0x1E4F65D00] predicateWithProperty:@"minimum_compatibility_version" comparisonType:4 otherProperty:@"origin_compatibility_version"];
}

+ (id)compatibilityVersion0ScheduleTypesPredicate
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F65D08];
  v3 = [MEMORY[0x1E4F65D48] isNullPredicateWithProperty:@"end_date_time"];
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F65D10] containsPredicateWithProperty:@"schedule_type" values:&unk_1F17FC828];
  v8[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v6 = [v2 predicateMatchingAllPredicates:v5];

  return v6;
}

+ (void)_shouldProceedWithInsertionForSchedule:(uint64_t)a1 profile:(NSObject *)a2 transaction:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BD54A000, a2, OS_LOG_TYPE_DEBUG, "[%{public}@] Schedule is deleted", (uint8_t *)&v2, 0xCu);
}

+ (void)_shouldProceedWithInsertionForSchedule:(NSObject *)a3 profile:transaction:error:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 medicationIdentifier];
  id v6 = HKSensitiveLogItem();
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  id v10 = v6;
  _os_log_error_impl(&dword_1BD54A000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Medication not found for medication with identifier: %{public}@", (uint8_t *)&v7, 0x16u);
}

+ (void)_shouldProceedWithInsertionForSchedule:profile:transaction:error:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1BD54A000, v0, OS_LOG_TYPE_ERROR, "[%{public}@] Attempting to insert unexepcted schedule with type null: %{public}@", v1, 0x16u);
}

+ (void)_isNewestSchedule:transaction:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1BD54A000, v0, OS_LOG_TYPE_DEBUG, "[%{public}@] Not inserting as there are %{public}@ newer schedules", v1, 0x16u);
}

+ (void)_codableRepresentationForMedicationScheduleID:(uint64_t)a1 row:(NSObject *)a2 profile:transaction:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1BD54A000, a2, OS_LOG_TYPE_FAULT, "Unable to fetch sync identity from HDMedicationScheduleEntity %{public}@", (uint8_t *)&v2, 0xCu);
}

@end