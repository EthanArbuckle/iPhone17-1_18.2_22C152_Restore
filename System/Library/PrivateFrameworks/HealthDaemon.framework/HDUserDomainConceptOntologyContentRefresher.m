@interface HDUserDomainConceptOntologyContentRefresher
+ (BOOL)_determineIfEligibleForRefreshAndPerformRefreshOperationForConcept:(id)a3 profile:(id)a4 ontologyTransaction:(id)a5 outRefreshedUserDomainConcept:(id *)a6 error:(id *)a7;
+ (BOOL)performAdditionalCleanupAfterRefreshingUserDomainConcept:(id)a3 profile:(id)a4 ontologyTransaction:(id)a5 error:(id *)a6;
+ (BOOL)supportsAutomaticGrouperPromotion;
+ (id)_refreshUserDomainConcept:(id)a3 withOntologyConcept:(id)a4 codings:(id)a5 ontologyTransaction:(id)a6 error:(id *)a7;
+ (id)propertyCollectionWithOntologyConcept:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5;
+ (id)refreshOntologyContentForUserDomainConcept:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (int64_t)_isAbleToPromoteConceptToGrouper:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5;
+ (int64_t)_isAbleToUpdateUserDomainConcept:(id)a3 outAdditionalCodings:(id *)a4 outConceptToRefreshWith:(id *)a5 ontologyTransaction:(id)a6 error:(id *)a7;
+ (int64_t)_loadMercuryConceptForRefreshFromUserDomainConcept:(id)a3 ontologyCoding:(id)a4 outConcept:(id *)a5 ontologyTransaction:(id)a6 error:(id *)a7;
+ (int64_t)_performAutomaticGrouperPromotionForConcept:(id)a3 userDomainConcept:(id)a4 outConcept:(id *)a5 ontologyTransaction:(id)a6 error:(id *)a7;
+ (int64_t)resolveOntologyConceptForRefreshFromUserDomainConceptWithoutOntologyCoding:(id)a3 outAdditionalCodings:(id *)a4 outConceptToRefreshWith:(id *)a5 ontologyTransaction:(id)a6 error:(id *)a7;
@end

@implementation HDUserDomainConceptOntologyContentRefresher

+ (id)refreshOntologyContentForUserDomainConcept:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__12;
  v28 = __Block_byref_object_dispose__12;
  id v29 = 0;
  v13 = [v11 ontologyDatabase];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __116__HDUserDomainConceptOntologyContentRefresher_refreshOntologyContentForUserDomainConcept_profile_transaction_error___block_invoke;
  v19[3] = &unk_1E62F4DA0;
  id v23 = a1;
  id v14 = v10;
  id v20 = v14;
  id v15 = v11;
  id v21 = v15;
  v22 = &v24;
  LODWORD(a6) = [v13 performTransactionWithDatabaseTransaction:v12 error:a6 transactionHandler:v19];

  if (a6) {
    v16 = (void *)v25[5];
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  _Block_object_dispose(&v24, 8);

  return v17;
}

uint64_t __116__HDUserDomainConceptOntologyContentRefresher_refreshOntologyContentForUserDomainConcept_profile_transaction_error___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  v6 = (void *)a1[7];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = [v6 _determineIfEligibleForRefreshAndPerformRefreshOperationForConcept:v4 profile:v5 ontologyTransaction:a2 outRefreshedUserDomainConcept:&obj error:a3];
  objc_storeStrong((id *)(v7 + 40), obj);
  return v8;
}

+ (id)propertyCollectionWithOntologyConcept:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5
{
  return 0;
}

+ (BOOL)supportsAutomaticGrouperPromotion
{
  return 0;
}

+ (int64_t)resolveOntologyConceptForRefreshFromUserDomainConceptWithoutOntologyCoding:(id)a3 outAdditionalCodings:(id *)a4 outConceptToRefreshWith:(id *)a5 ontologyTransaction:(id)a6 error:(id *)a7
{
  return 2;
}

+ (BOOL)performAdditionalCleanupAfterRefreshingUserDomainConcept:(id)a3 profile:(id)a4 ontologyTransaction:(id)a5 error:(id *)a6
{
  return 1;
}

+ (BOOL)_determineIfEligibleForRefreshAndPerformRefreshOperationForConcept:(id)a3 profile:(id)a4 ontologyTransaction:(id)a5 outRefreshedUserDomainConcept:(id *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v24 = 0;
  id v25 = 0;
  uint64_t v15 = [a1 _isAbleToUpdateUserDomainConcept:v12 outAdditionalCodings:&v25 outConceptToRefreshWith:&v24 ontologyTransaction:v14 error:a7];
  id v16 = v25;
  id v17 = v24;
  if (v15 == 1)
  {
    uint64_t v18 = [a1 _refreshUserDomainConcept:v12 withOntologyConcept:v17 codings:v16 ontologyTransaction:v14 error:a7];
    v19 = (void *)v18;
    if (v18
      && ((id)v18 == v12
       || ([v14 databaseTransaction],
           id v20 = objc_claimAutoreleasedReturnValue(),
           int64_t v23 = +[HDUserDomainConceptEntity storeUserDomainConcept:v19 method:3 profile:v13 transaction:v20 error:a7], v20, v23)))
    {
      if (a6) {
        *a6 = v19;
      }
      char v21 = [a1 performAdditionalCleanupAfterRefreshingUserDomainConcept:v19 profile:v13 ontologyTransaction:v14 error:a7];
    }
    else
    {
      char v21 = 0;
    }
  }
  else
  {
    if (a6) {
      *a6 = v12;
    }
    char v21 = v15 == 2;
  }

  return v21;
}

+ (int64_t)_isAbleToUpdateUserDomainConcept:(id)a3 outAdditionalCodings:(id *)a4 outConceptToRefreshWith:(id *)a5 ontologyTransaction:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a3;
  id v14 = [v13 firstOntologyCoding];
  if (v14) {
    uint64_t v15 = [a1 _loadMercuryConceptForRefreshFromUserDomainConcept:v13 ontologyCoding:v14 outConcept:a5 ontologyTransaction:v12 error:a7];
  }
  else {
    uint64_t v15 = [a1 resolveOntologyConceptForRefreshFromUserDomainConceptWithoutOntologyCoding:v13 outAdditionalCodings:a4 outConceptToRefreshWith:a5 ontologyTransaction:v12 error:a7];
  }
  int64_t v16 = v15;

  return v16;
}

+ (int64_t)_loadMercuryConceptForRefreshFromUserDomainConcept:(id)a3 ontologyCoding:(id)a4 outConcept:(id *)a5 ontologyTransaction:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = (objc_class *)MEMORY[0x1E4F2ADE8];
  id v15 = a4;
  id v16 = [v14 alloc];
  id v17 = [v15 code];

  uint64_t v18 = objc_msgSend(v16, "initWithRawIdentifier:", objc_msgSend(v17, "integerValue"));
  v19 = [v13 profile];
  id v20 = [v19 ontologyConceptManager];
  id v25 = 0;
  char v21 = [v20 conceptForIdentifier:v18 options:4 error:&v25];
  id v22 = v25;

  if (v21)
  {
    if ([a1 supportsAutomaticGrouperPromotion])
    {
      int64_t v23 = [a1 _performAutomaticGrouperPromotionForConcept:v21 userDomainConcept:v12 outConcept:a5 ontologyTransaction:v13 error:a7];
    }
    else
    {
      if (a5) {
        *a5 = v21;
      }
      int64_t v23 = 1;
    }
  }
  else if (v22)
  {
    if (a7)
    {
      int64_t v23 = 0;
      *a7 = v22;
    }
    else
    {
      _HKLogDroppedError();
      int64_t v23 = 0;
    }
  }
  else
  {
    int64_t v23 = 2;
  }

  return v23;
}

+ (int64_t)_performAutomaticGrouperPromotionForConcept:(id)a3 userDomainConcept:(id)a4 outConcept:(id *)a5 ontologyTransaction:(id)a6 error:(id *)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = [a1 _isAbleToPromoteConceptToGrouper:v11 ontologyTransaction:v13 error:a7];
  int64_t v15 = v14;
  if (v14)
  {
    if (v14 == 2)
    {
      _HKInitializeLogging();
      id v16 = HKLogHealthOntology();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);

      if (v17)
      {
        uint64_t v18 = HKLogHealthOntology();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = [v12 UUID];
          id v20 = objc_msgSend(v19, "hk_shortRepresentation");
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v20;
          _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_INFO, "%{public}@: UDC %{public}@ is already a grouper concept, so we will not proceed with promoting it, even though this generator class supports automatic grouper promotion.", buf, 0x16u);
        }
      }
      if (a5) {
        *a5 = v11;
      }
      int64_t v15 = 1;
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v33 = __Block_byref_object_copy__12;
      v34 = __Block_byref_object_dispose__12;
      id v35 = v11;
      char v21 = [v35 identifier];
      id v22 = +[HDOntologyConceptManager predicateMatchingConceptsWithRelationshipType:1013 withSubjectId:v21];

      int64_t v23 = +[HDOntologyConceptManager predicateToExcludeSentinel];
      id v24 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v22 otherPredicate:v23];
      uint64_t v25 = *MEMORY[0x1E4F65DE0];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __146__HDUserDomainConceptOntologyContentRefresher__performAutomaticGrouperPromotionForConcept_userDomainConcept_outConcept_ontologyTransaction_error___block_invoke;
      v28[3] = &unk_1E62F4DC8;
      id v31 = a1;
      id v29 = v12;
      v30 = buf;
      if (+[HDOntologyConceptManager enumerateConceptsMatchingPredicate:v24 options:4 limit:v25 transaction:v13 error:a7 enumerationHandler:v28])
      {
        if (a5) {
          *a5 = *(id *)(*(void *)&buf[8] + 40);
        }
        int64_t v15 = 1;
      }
      else
      {
        int64_t v15 = 0;
      }

      _Block_object_dispose(buf, 8);
    }
  }

  return v15;
}

uint64_t __146__HDUserDomainConceptOntologyContentRefresher__performAutomaticGrouperPromotionForConcept_userDomainConcept_outConcept_ontologyTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = HKLogHealthOntology();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    v6 = HKLogHealthOntology();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = [*(id *)(a1 + 32) UUID];
      v9 = objc_msgSend(v8, "hk_shortRepresentation");
      int v13 = 138543618;
      uint64_t v14 = v7;
      __int16 v15 = 2114;
      id v16 = v9;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_INFO, "%{public}@: UDC %{public}@ will be refreshed with a new mercury grouper concept, since this generator class supports automatic grouper concept promotion.", (uint8_t *)&v13, 0x16u);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v3;

  return 0;
}

+ (int64_t)_isAbleToPromoteConceptToGrouper:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 identifier];
  uint64_t v10 = +[HDOntologyConceptManager predicateMatchingConceptsWithRelationshipType:1013 withObjectId:v9];

  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  uint64_t v11 = *MEMORY[0x1E4F65DE0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __106__HDUserDomainConceptOntologyContentRefresher__isAbleToPromoteConceptToGrouper_ontologyTransaction_error___block_invoke;
  v14[3] = &unk_1E62F4DF0;
  v14[4] = &v15;
  if (+[HDOntologyConceptManager enumerateConceptsMatchingPredicate:v10 options:4 limit:v11 transaction:v8 error:a5 enumerationHandler:v14])
  {
    if (*((unsigned char *)v16 + 24)) {
      int64_t v12 = 1;
    }
    else {
      int64_t v12 = 2;
    }
  }
  else
  {
    int64_t v12 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v12;
}

uint64_t __106__HDUserDomainConceptOntologyContentRefresher__isAbleToPromoteConceptToGrouper_ontologyTransaction_error___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return 0;
}

+ (id)_refreshUserDomainConcept:(id)a3 withOntologyConcept:(id)a4 codings:(id)a5 ontologyTransaction:(id)a6 error:(id *)a7
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = [a1 propertyCollectionWithOntologyConcept:v13 ontologyTransaction:a6 error:a7];
  if (!v15)
  {
    id v25 = 0;
    goto LABEL_31;
  }
  id v16 = v12;
  uint64_t v17 = v16;
  if ([v15 count] >= 1)
  {
    char v18 = [v16 propertyCollection];
    v19 = [MEMORY[0x1E4F2B668] propertyCollectionByMergingCollection:v18 otherCollection:v15 options:1];
    uint64_t v17 = v16;
    if (v19 != v18)
    {
      _HKInitializeLogging();
      id v20 = HKLogHealthOntology();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);

      if (v21)
      {
        id v22 = HKLogHealthOntology();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v55 = [v16 UUID];
          int64_t v23 = objc_msgSend(v55, "hk_shortRepresentation");
          v53 = [v16 propertyCollection];
          *(_DWORD *)buf = 138544130;
          id v60 = a1;
          __int16 v61 = 2114;
          v62 = v23;
          __int16 v63 = 2048;
          uint64_t v64 = [v53 count];
          __int16 v65 = 2048;
          uint64_t v66 = [v19 count];
          _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_INFO, "%{public}@: Update UDC %{public}@ with new property collection (%ld -> %ld)", buf, 0x2Au);
        }
      }
      id v24 = [v19 properties];
      uint64_t v17 = (void *)[v16 copyUserDomainConceptBySettingProperties:v24];
    }
  }
  if (![v16 isAdHocUserDomainConcept] || !objc_msgSend(v13, "isAdHoc"))
  {
    id v26 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v27 = [v13 coding];
    v28 = objc_msgSend(v26, "initWithObjects:", v27, 0);

    if (v14 && [v13 isAdHoc]) {
      [v28 addObjectsFromArray:v14];
    }
    id v29 = [v17 codingCollection];
    v30 = [v29 codingsSet];
    id v58 = v14;
    if (v30 == v28)
    {
    }
    else
    {
      id v31 = v30;
      if (!v28)
      {

LABEL_24:
        id v38 = v12;
        _HKInitializeLogging();
        v39 = HKLogHealthOntology();
        BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);

        if (v40)
        {
          v41 = HKLogHealthOntology();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            v57 = [v17 UUID];
            v49 = objc_msgSend(v57, "hk_shortRepresentation");
            v54 = [v17 codingCollection];
            v52 = [v54 codingsSet];
            v51 = [v52 allObjects];
            v42 = [v51 componentsJoinedByString:@", "];
            v50 = [v17 codingCollection];
            uint64_t v48 = [v50 count];
            v43 = [v28 allObjects];
            v44 = [v43 componentsJoinedByString:@", "];
            uint64_t v45 = [v28 count];
            *(_DWORD *)buf = 138544642;
            id v60 = a1;
            __int16 v61 = 2114;
            v62 = v49;
            __int16 v63 = 2112;
            uint64_t v64 = (uint64_t)v42;
            __int16 v65 = 2048;
            uint64_t v66 = v48;
            __int16 v67 = 2112;
            v68 = v44;
            __int16 v69 = 2048;
            uint64_t v70 = v45;
            _os_log_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_INFO, "%{public}@: Update UDC %{public}@ with new medical codings set[%@]%ld -> set[%@]%ld", buf, 0x3Eu);
          }
        }
        v46 = [v28 allObjects];
        id v25 = [v17 userDomainConceptByReplacingCodings:v46];

        id v12 = v38;
        goto LABEL_29;
      }
      v32 = [v17 codingCollection];
      [v32 codingsSet];
      v33 = v15;
      id v34 = v13;
      id v35 = a1;
      v37 = id v36 = v12;
      int v56 = [v37 isEqualToSet:v28];

      id v12 = v36;
      a1 = v35;
      id v13 = v34;
      uint64_t v15 = v33;

      if (!v56) {
        goto LABEL_24;
      }
    }
    id v25 = v17;
LABEL_29:

    id v14 = v58;
    goto LABEL_30;
  }
  id v25 = v17;
LABEL_30:

LABEL_31:

  return v25;
}

@end