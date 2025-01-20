@interface HDMedicalUserDomainConceptGenerator
+ (BOOL)generateUserDomainConceptForMedicalRecord:(id)a3 entityPersistentID:(id)a4 insertionContext:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (BOOL)performAdditionalCleanupAfterRefreshingUserDomainConcept:(id)a3 profile:(id)a4 ontologyTransaction:(id)a5 error:(id *)a6;
+ (BOOL)remapMedicalRecordsIfNeededForUserDomainConcept:(id)a3 shouldExcludeExistingConcept:(BOOL)a4 profile:(id)a5 ontologyTransaction:(id)a6 error:(id *)a7;
+ (BOOL)supportsAutomaticGrouperPromotion;
+ (id)_fetchGroupByConceptAndLoadRelationshipsWith:(void *)a3 codings:(void *)a4 ontologyTransaction:(uint64_t)a5 error:;
+ (id)_fetchUserDomainConceptForMedicalRecord:(void *)a3 existingUserDomainConcept:(int)a4 shouldExcludeExistingUserDomainConcept:(void *)a5 profile:(void *)a6 ontologyTransaction:(char *)a7 outShouldUpdateNewUserDomainConcept:(uint64_t)a8 error:;
+ (id)propertyCollectionWithOntologyConcept:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5;
+ (int64_t)resolveOntologyConceptForRefreshFromUserDomainConceptWithoutOntologyCoding:(id)a3 outAdditionalCodings:(id *)a4 outConceptToRefreshWith:(id *)a5 ontologyTransaction:(id)a6 error:(id *)a7;
@end

@implementation HDMedicalUserDomainConceptGenerator

+ (BOOL)generateUserDomainConceptForMedicalRecord:(id)a3 entityPersistentID:(id)a4 insertionContext:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if ([(id)objc_opt_class() groupsByUserDomainConcept])
  {
    id v15 = v11;
    id v34 = v13;
    id v16 = v13;
    id v17 = v14;
    uint64_t v18 = self;
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__151;
    v50 = __Block_byref_object_dispose__151;
    id v51 = 0;
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2020000000;
    char v45 = 0;
    v19 = [v16 ontologyDatabase];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __116__HDMedicalUserDomainConceptGenerator__userDomainConceptForMedicalRecord_profile_transaction_shouldUpdateOut_error___block_invoke;
    v36[3] = &unk_1E63073D8;
    v39 = &v46;
    uint64_t v41 = v18;
    id v20 = v15;
    id v37 = v20;
    id v21 = v16;
    id v38 = v21;
    v40 = &v42;
    LOBYTE(v16) = [v19 performTransactionWithDatabaseTransaction:v17 error:a8 transactionHandler:v36];

    if (v16) {
      v22 = (void *)v47[5];
    }
    else {
      v22 = 0;
    }
    int v24 = *((unsigned __int8 *)v43 + 24);
    id v25 = v22;

    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v46, 8);

    if (v25
      && (!v24
       || +[HDUserDomainConceptEntity storeUserDomainConcept:v25 method:2 profile:v21 transaction:v17 error:a8]))
    {
      id v33 = v12;
      id v26 = v17;
      id v27 = v25;
      self;
      v28 = [v26 protectedDatabase];
      v29 = [v27 UUID];

      v30 = HDDataEntityPredicateForDataUUID();
      v31 = +[HDSQLiteEntity anyInDatabase:v28 predicate:v30 error:a8];

      if (v31) {
        BOOL v23 = +[HDMedicalUserDomainConceptMappingEntity insertUserDomainConceptID:medicalRecordID:transaction:error:](HDMedicalUserDomainConceptMappingEntity, "insertUserDomainConceptID:medicalRecordID:transaction:error:", [v31 persistentID], objc_msgSend(v33, "integerValue"), v26, a8);
      }
      else {
        BOOL v23 = 0;
      }
      id v13 = v34;
    }
    else
    {
      BOOL v23 = 0;
      id v13 = v34;
    }
  }
  else
  {
    BOOL v23 = 1;
  }

  return v23;
}

+ (BOOL)remapMedicalRecordsIfNeededForUserDomainConcept:(id)a3 shouldExcludeExistingConcept:(BOOL)a4 profile:(id)a5 ontologyTransaction:(id)a6 error:(id *)a7
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = HDMedicalRecordEntityPredicateForMedicalUserDomainConcept(v12);
  id v16 = [v14 databaseTransaction];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __150__HDMedicalUserDomainConceptGenerator_remapMedicalRecordsIfNeededForUserDomainConcept_shouldExcludeExistingConcept_profile_ontologyTransaction_error___block_invoke;
  v30[3] = &unk_1E63073B0;
  BOOL v35 = a4;
  id v31 = v12;
  id v32 = v13;
  id v33 = v14;
  id v34 = a1;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v18;
  id v21 = v30;
  id v22 = v16;
  id v23 = v15;
  self;
  int v24 = [v22 databaseForEntityClass:objc_opt_class()];

  id v25 = +[HDSQLiteEntity queryWithDatabase:v24 predicate:v23];

  v39[0] = @"data_type";
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __117__HDMedicalUserDomainConceptGenerator__enumerateMedicalRecordSamplesWithPredicate_profile_transaction_error_handler___block_invoke;
  v36[3] = &unk_1E62F8518;
  id v37 = v20;
  id v38 = v21;
  id v27 = v21;
  id v28 = v20;
  LOBYTE(a7) = [v25 enumeratePersistentIDsAndProperties:v26 error:a7 enumerationHandler:v36];

  return (char)a7;
}

BOOL __150__HDMedicalUserDomainConceptGenerator_remapMedicalRecordsIfNeededForUserDomainConcept_shouldExcludeExistingConcept_profile_ontologyTransaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v7 = NSNumber;
  id v8 = a2;
  v9 = [v7 numberWithLongLong:a3];
  int v10 = *(unsigned __int8 *)(a1 + 64);
  id v11 = *(void **)(a1 + 32);
  id v12 = *(void **)(a1 + 40);
  id v13 = *(void **)(a1 + 48);
  id v14 = v8;
  id v15 = v9;
  id v16 = v11;
  id v17 = v12;
  uint64_t v18 = a4;
  id v19 = v17;
  id v20 = v13;
  uint64_t v21 = self;
  char v58 = 0;
  id v22 = +[HDMedicalUserDomainConceptGenerator _fetchUserDomainConceptForMedicalRecord:existingUserDomainConcept:shouldExcludeExistingUserDomainConcept:profile:ontologyTransaction:outShouldUpdateNewUserDomainConcept:error:](v21, v14, v16, v10, v19, v20, &v58, v18);
  if (v22)
  {
    id v57 = v15;
    if (v58)
    {
      id v23 = [v20 databaseTransaction];
      int64_t v24 = +[HDUserDomainConceptEntity storeUserDomainConcept:v22 method:2 profile:v19 transaction:v23 error:v18];

      if (!v24)
      {
        BOOL v28 = 0;
        goto LABEL_15;
      }
    }
    id v25 = [v16 UUID];
    id v26 = [v22 UUID];
    char v27 = [v25 isEqual:v26];

    if (v27)
    {
      BOOL v28 = 1;
LABEL_15:
      id v15 = v57;
      goto LABEL_20;
    }
    uint64_t v56 = v18;
    _HKInitializeLogging();
    v29 = HKLogHealthOntology();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);

    id v31 = v57;
    if (v30)
    {
      id v32 = HKLogHealthOntology();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v54 = [v14 UUID];
        v50 = objc_msgSend(v54, "hk_shortRepresentation");
        v52 = [v16 UUID];
        id v33 = objc_msgSend(v52, "hk_shortRepresentation");
        uint64_t v48 = [v22 UUID];
        id v34 = objc_msgSend(v48, "hk_shortRepresentation");
        *(_DWORD *)buf = 138544130;
        uint64_t v60 = v21;
        __int16 v61 = 2114;
        v62 = v50;
        __int16 v63 = 2114;
        v64 = v33;
        __int16 v65 = 2114;
        v66 = v34;
        _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_INFO, "%{public}@: Move UDC mapping for record %{public}@, %{public}@ -> %{public}@", buf, 0x2Au);

        id v31 = v57;
      }
    }
    BOOL v35 = [v20 databaseTransaction];
    id v51 = v31;
    id v55 = v22;
    id v36 = v35;
    id v37 = v16;
    self;
    v53 = v36;
    id v38 = [v36 protectedDatabase];
    v39 = [v37 UUID];

    v40 = HDDataEntityPredicateForDataUUID();
    uint64_t v41 = +[HDSQLiteEntity anyInDatabase:v38 predicate:v40 error:v56];

    v49 = (void *)v41;
    if (v41)
    {
      uint64_t v42 = [v53 protectedDatabase];
      v43 = [v55 UUID];
      uint64_t v44 = HDDataEntityPredicateForDataUUID();
      char v45 = +[HDSQLiteEntity anyInDatabase:v42 predicate:v44 error:v56];

      if (v45)
      {
        uint64_t v46 = v53;
        BOOL v28 = +[HDMedicalUserDomainConceptMappingEntity updateMappingFromRecordWithPersistentID:withMapToUDCWithPersistentID:toMapToUDCWithPersistentID:transaction:error:](HDMedicalUserDomainConceptMappingEntity, "updateMappingFromRecordWithPersistentID:withMapToUDCWithPersistentID:toMapToUDCWithPersistentID:transaction:error:", [v51 longLongValue], objc_msgSend(v49, "persistentID"), objc_msgSend(v45, "persistentID"), v53, v56);
        id v15 = v57;
      }
      else
      {
        BOOL v28 = 0;
        id v15 = v57;
        uint64_t v46 = v53;
      }
    }
    else
    {
      BOOL v28 = 0;
      id v15 = v57;
      uint64_t v46 = v53;
    }
  }
  else
  {
    BOOL v28 = 0;
  }
LABEL_20:

  return v28;
}

+ (id)propertyCollectionWithOntologyConcept:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5
{
  char v27 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v28 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v29 = v6;
  id v8 = [v6 attributes];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v14 = 150004;
        if (objc_msgSend(v13, "type", v27) != 61813)
        {
          if ([v13 type] == 61839)
          {
            uint64_t v14 = 150005;
          }
          else
          {
            if ([v13 type] != 989) {
              continue;
            }
            uint64_t v14 = 150009;
          }
        }
        id v15 = v7;
        id v16 = v13;
        int v17 = [v16 isDeleted];
        uint64_t v18 = (void *)MEMORY[0x1E4F2B638];
        if (v17)
        {
          id v19 = v15;
          id v20 = objc_msgSend(v18, "nullPropertyWithType:version:", v14, objc_msgSend(v16, "version"));
          [v19 addObject:v20];
        }
        else
        {
          id v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2B638]), "initWithType:version:BOOLValue:", v14, objc_msgSend(v16, "version"), objc_msgSend(v16, "BOOLValue"));
          [v15 addObject:v20];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v10);
  }

  uint64_t v21 = +[HDOntologyLocalizedStringProvider localizedOntologyPreferredNamesForConcept:v29 withUserDomainConceptPropertyType:160012];
  [v7 addObjectsFromArray:v21];
  id v22 = [v29 identifier];
  id v30 = 0;
  BOOL v23 = +[HDOntologyEducationContentProvider localizedEducationContentForConceptWithIdentifier:v22 ontologyTransaction:v28 localizedEducationContentOut:&v30 error:v27];
  id v24 = v30;

  id v25 = 0;
  if (v23)
  {
    objc_msgSend(v7, "hk_addNonNilObject:", v24);
    id v25 = (void *)[objc_alloc(MEMORY[0x1E4F2B668]) initWithProperties:v7];
  }

  return v25;
}

+ (BOOL)supportsAutomaticGrouperPromotion
{
  return 1;
}

+ (int64_t)resolveOntologyConceptForRefreshFromUserDomainConceptWithoutOntologyCoding:(id)a3 outAdditionalCodings:(id *)a4 outConceptToRefreshWith:(id *)a5 ontologyTransaction:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = [MEMORY[0x1E4F2B180] adHocConceptSystem];
  uint64_t v14 = [v11 codingCollection];
  id v15 = [v14 codingsExcludingCodingSystem:v13];

  if ([v15 count])
  {
    long long v34 = a7;
    id v30 = a4;
    long long v31 = a5;
    id v16 = v11;
    id v17 = v12;
    id v18 = v15;
    uint64_t v19 = self;
    id v20 = [v16 categoryTypes];
    uint64_t v21 = [v20 firstObject];

    long long v32 = v13;
    id v33 = v12;
    if (v21) {
      uint64_t v22 = [v21 longLongValue];
    }
    else {
      uint64_t v22 = 8;
    }
    id v24 = [v16 countryCode];
    id v25 = HKCurrentLocaleCountryCodeIfUnknown();

    id v26 = [[HDConceptResolutionConfiguration alloc] initWithCountryCode:v25 recordCategoryType:v22 options:0];
    char v27 = +[HDMedicalUserDomainConceptGenerator _fetchGroupByConceptAndLoadRelationshipsWith:codings:ontologyTransaction:error:](v19, v26, v18, v17, (uint64_t)v34);

    if (v27)
    {
      int v28 = [v27 isAdHoc];
      if (v30 && v28) {
        id *v30 = v18;
      }
      id v13 = v32;
      id v12 = v33;
      if (v31) {
        id *v31 = v27;
      }
      int64_t v23 = 1;
    }
    else
    {
      int64_t v23 = 0;
      id v13 = v32;
      id v12 = v33;
    }
  }
  else
  {
    int64_t v23 = 2;
  }

  return v23;
}

+ (BOOL)performAdditionalCleanupAfterRefreshingUserDomainConcept:(id)a3 profile:(id)a4 ontologyTransaction:(id)a5 error:(id *)a6
{
  return [a1 remapMedicalRecordsIfNeededForUserDomainConcept:a3 shouldExcludeExistingConcept:0 profile:a4 ontologyTransaction:a5 error:a6];
}

BOOL __116__HDMedicalUserDomainConceptGenerator__userDomainConceptForMedicalRecord_profile_transaction_shouldUpdateOut_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = +[HDMedicalUserDomainConceptGenerator _fetchUserDomainConceptForMedicalRecord:existingUserDomainConcept:shouldExcludeExistingUserDomainConcept:profile:ontologyTransaction:outShouldUpdateNewUserDomainConcept:error:](*(void *)(a1 + 64), *(void **)(a1 + 32), 0, 0, *(void **)(a1 + 40), a2, (char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), a3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
}

+ (id)_fetchUserDomainConceptForMedicalRecord:(void *)a3 existingUserDomainConcept:(int)a4 shouldExcludeExistingUserDomainConcept:(void *)a5 profile:(void *)a6 ontologyTransaction:(char *)a7 outShouldUpdateNewUserDomainConcept:(uint64_t)a8 error:
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  id v104 = a3;
  id v100 = a5;
  id v13 = a6;
  uint64_t v14 = self;
  id v15 = v13;
  id v16 = v12;
  uint64_t v17 = self;
  id v18 = [HDConceptResolutionConfiguration alloc];
  uint64_t v19 = [v16 country];
  id v20 = HKCurrentLocaleCountryCodeIfUnknown();
  uint64_t v21 = -[HDConceptResolutionConfiguration initWithCountryCode:recordCategoryType:options:](v18, "initWithCountryCode:recordCategoryType:options:", v20, [v16 recordCategoryType], 0);

  uint64_t v22 = (void *)MEMORY[0x1E4F2B178];
  int64_t v23 = [MEMORY[0x1E4F2B180] adHocConceptSystem];
  id v24 = [v16 medicalRecordCodings];

  id v25 = [v22 stripCodingsMatchingSystem:v23 fromCodings:v24];

  v103 = +[HDMedicalUserDomainConceptGenerator _fetchGroupByConceptAndLoadRelationshipsWith:codings:ontologyTransaction:error:](v17, v21, v25, v15, a8);

  if (!v103)
  {
    id v28 = 0;
    goto LABEL_60;
  }
  if (!v104 || (a4 & 1) != 0)
  {
LABEL_29:
    if (a4) {
      uint64_t v42 = v104;
    }
    else {
      uint64_t v42 = 0;
    }
    id v92 = v103;
    id v97 = v42;
    id v99 = v16;
    id v91 = v15;
    id v43 = v100;
    v88 = self;
    v90 = [v92 coding];
    uint64_t v44 = [v99 country];
    v89 = HKCurrentLocaleCountryCodeIfUnknown();

    id v45 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v46 = HDUserDomainConceptEntityPredicateForMedicalCoding(v90);
    v105[0] = v46;
    v47 = HDMedicalUserDomainConceptEntityPredicateForCountryCode((uint64_t)v89);
    v105[1] = v47;
    uint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:2];
    v95 = (void *)[v45 initWithArray:v48];

    if (v97)
    {
      v49 = [v97 UUID];
      v50 = HDUserDomainConceptEntityPredicateForConceptUUID((uint64_t)v49, 0);
      [v95 addObject:v50];
    }
    id v51 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v95];
    v52 = [v91 databaseTransaction];
    id v53 = v51;
    id v54 = v43;
    id v55 = v52;
    self;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v109 = __Block_byref_object_copy__151;
    v110 = __Block_byref_object_dispose__151;
    id v111 = 0;
    uint64_t v56 = (void *)[objc_alloc(MEMORY[0x1E4F65D50]) initWithExpression:@"creation_date" ascending:1];
    id v57 = [v54 userDomainConceptManager];
    v107 = v56;
    char v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
    v106[0] = MEMORY[0x1E4F143A8];
    v106[1] = 3221225472;
    v106[2] = __130__HDMedicalUserDomainConceptGenerator__oldestUserDomainConceptForPredicate_profile_transaction_medicalUserDomainConceptOut_error___block_invoke;
    v106[3] = &unk_1E6307400;
    v106[4] = buf;
    int v59 = [v57 enumerateUserDomainConceptsWithPredicate:v53 limit:1 orderingTerms:v58 error:a8 enumerationHandler:v106];

    if (v59) {
      id v60 = *(id *)(*(void *)&buf[8] + 40);
    }
    else {
      id v60 = 0;
    }

    _Block_object_dispose(buf, 8);
    id v61 = v60;

    if (!v59)
    {
      id v28 = 0;
LABEL_59:

      goto LABEL_60;
    }
    v87 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v99, "recordCategoryType"));
    if (v61)
    {
      v62 = [v61 categoryTypes];
      char v63 = [v62 containsObject:v87];

      if (v63)
      {
        char v64 = 0;
LABEL_55:
        if (a7) {
          *a7 = v64;
        }
        id v61 = v61;
        goto LABEL_58;
      }
      v73 = objc_msgSend(v61, "medicalConceptByAddingCategoryType:", objc_msgSend(v99, "recordCategoryType"));

      _HKInitializeLogging();
      v80 = HKLogHealthOntology();
      BOOL v81 = os_log_type_enabled(v80, OS_LOG_TYPE_INFO);

      if (!v81)
      {
LABEL_54:
        char v64 = 1;
        id v61 = v73;
        goto LABEL_55;
      }
      __int16 v65 = HKLogHealthOntology();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        v82 = [v73 UUID];
        v83 = objc_msgSend(v82, "hk_shortRepresentation");
        v84 = [v99 UUID];
        objc_msgSend(v84, "hk_shortRepresentation");
        v85 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v88;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v83;
        *(_WORD *)&buf[22] = 2114;
        v109 = v85;
        _os_log_impl(&dword_1BCB7D000, v65, OS_LOG_TYPE_INFO, "%{public}@: Updated UDC %{public}@ for medical record %{public}@ with new category type", buf, 0x20u);
      }
    }
    else
    {
      __int16 v65 = [v88 propertyCollectionWithOntologyConcept:v92 ontologyTransaction:v91 error:a8];
      if (!v65)
      {
        id v61 = 0;
LABEL_58:

        id v28 = v61;
        goto LABEL_59;
      }
      v102 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v90, 0);
      if ([v92 isAdHoc])
      {
        v66 = (void *)MEMORY[0x1E4F2B178];
        uint64_t v67 = [MEMORY[0x1E4F2B180] adHocConceptSystem];
        v68 = [v99 medicalRecordCodings];
        v69 = [v66 stripCodingsMatchingSystem:v67 fromCodings:v68];

        [v102 addObjectsFromArray:v69];
      }
      id v70 = objc_alloc(MEMORY[0x1E4F2B1B8]);
      v106[0] = v87;
      v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:1];
      v72 = (void *)[objc_alloc(MEMORY[0x1E4F2B178]) initWithCodings:v102];
      v73 = (void *)[v70 initWithCategoryTypes:v71 countryCode:v89 codingCollection:v72 propertyCollection:v65];

      _HKInitializeLogging();
      v74 = HKLogHealthOntology();
      LODWORD(v72) = os_log_type_enabled(v74, OS_LOG_TYPE_INFO);

      if (v72)
      {
        v75 = HKLogHealthOntology();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          v76 = [v73 UUID];
          v77 = objc_msgSend(v76, "hk_shortRepresentation");
          v78 = [v99 UUID];
          objc_msgSend(v78, "hk_shortRepresentation");
          v79 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v88;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v77;
          *(_WORD *)&buf[22] = 2114;
          v109 = v79;
          _os_log_impl(&dword_1BCB7D000, v75, OS_LOG_TYPE_INFO, "%{public}@: Created a new UDC %{public}@ for medical record %{public}@", buf, 0x20u);
        }
      }
    }
    goto LABEL_54;
  }
  uint64_t v26 = [v104 firstOntologyCoding];
  uint64_t v98 = [v104 firstAdhocCoding];
  v96 = [v103 coding];
  if (!(v26 | v98))
  {
    _HKInitializeLogging();
    char v27 = HKLogHealthOntology();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v104;
      _os_log_error_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_ERROR, "%{public}@ was not able to find either an ontology coding or an adhoc coding on User Domain Concept %{public}@", buf, 0x16u);
    }

    goto LABEL_20;
  }
  if (v26)
  {
    v29 = [(id)v26 code];
    id v30 = [v96 code];
    if (v29 != v30)
    {
      long long v31 = [v96 code];
      if (v31)
      {
        long long v32 = [(id)v26 code];
        uint64_t v33 = [v96 code];
        goto LABEL_17;
      }
      goto LABEL_23;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (!v98)
  {
LABEL_24:
    _HKInitializeLogging();
    BOOL v35 = HKLogHealthOntology();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_INFO);

    if (v36)
    {
      id v37 = HKLogHealthOntology();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        id v38 = [v16 UUID];
        v39 = objc_msgSend(v38, "hk_shortRepresentation");
        v40 = [v104 UUID];
        objc_msgSend(v40, "hk_shortRepresentation");
        uint64_t v41 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v39;
        *(_WORD *)&buf[22] = 2114;
        v109 = v41;
        _os_log_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_INFO, "%{public}@: Medical record %{public}@ no longer maps to UDC %{public}@", buf, 0x20u);
      }
    }

    goto LABEL_29;
  }
  v29 = [(id)v98 code];
  id v30 = [v96 code];
  if (v29 == v30) {
    goto LABEL_19;
  }
  long long v31 = [v96 code];
  if (!v31)
  {
LABEL_23:

    goto LABEL_24;
  }
  long long v32 = [(id)v98 code];
  uint64_t v33 = [v96 code];
LABEL_17:
  long long v34 = (void *)v33;
  int v94 = [v32 isEqual:v33];

  if (!v94) {
    goto LABEL_24;
  }
LABEL_20:
  if (a7) {
    *a7 = 0;
  }
  id v28 = v104;

LABEL_60:

  return v28;
}

uint64_t __130__HDMedicalUserDomainConceptGenerator__oldestUserDomainConceptForPredicate_profile_transaction_medicalUserDomainConceptOut_error___block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

+ (id)_fetchGroupByConceptAndLoadRelationshipsWith:(void *)a3 codings:(void *)a4 ontologyTransaction:(uint64_t)a5 error:
{
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  self;
  id v11 = [MEMORY[0x1E4F2B178] collectionWithCodings:v9];

  id v12 = [v8 profile];
  id v13 = +[HDOntologyConceptManager conceptForCodingCollection:v11 configuration:v10 profile:v12 error:a5];

  uint64_t v14 = [v13 identifier];

  if (v14)
  {
    id v15 = [v8 profile];
    id v16 = [v15 ontologyConceptManager];
    uint64_t v17 = [v16 conceptForIdentifier:v14 options:5 error:a5];

    if (v17)
    {
      id v18 = [v17 groupByConcept];
    }
    else
    {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

uint64_t __117__HDMedicalUserDomainConceptGenerator__enumerateMedicalRecordSamplesWithPredicate_profile_transaction_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = HDSQLiteColumnAsInt64();
  if (_HKValidDataTypeCode())
  {
    id v9 = [MEMORY[0x1E4F2B448] dataTypeWithCode:v8];
    id v10 = objc_msgSend((id)objc_msgSend(v9, "dataObjectClass"), "hd_dataEntityClass");

    id v11 = [NSNumber numberWithLongLong:a2];
    id v16 = @"SkipApplyingConceptIndex";
    v17[0] = MEMORY[0x1E4F1CC38];
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v13 = [v10 objectWithID:v11 encodingOptions:v12 profile:*(void *)(a1 + 32) error:a5];

    if (v13) {
      uint64_t v14 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else {
      uint64_t v14 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 100, @"Type code %ld is not valid", v8);
    return 0;
  }
  return v14;
}

@end