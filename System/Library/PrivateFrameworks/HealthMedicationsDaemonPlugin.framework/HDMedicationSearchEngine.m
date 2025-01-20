@interface HDMedicationSearchEngine
+ (BOOL)_inflateFirstConcept:(id *)a3 predicate:(id)a4 relationshipTypes:(id)a5 maximumDepth:(int64_t)a6 ontologyTransaction:(id)a7 errorOut:(id *)a8;
+ (BOOL)_medicationClusterFromMachineReadableCode:(id)a3 codeAttributeType:(int64_t)a4 searchResultOut:(id *)a5 ontologyTransaction:(id)a6 errorOut:(id *)a7;
+ (BOOL)_medicationSearchResultForFirstConcept:(id *)a3 predicate:(id)a4 ontologyTransaction:(id)a5 errorOut:(id *)a6;
+ (BOOL)medicationCluster:(id *)a3 machineReadableCode:(id)a4 codeAttributeType:(int64_t)a5 profile:(id)a6 errorOut:(id *)a7;
+ (id)_attributeTypesForInflation;
+ (id)_genericProductForClinicalProduct:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5;
+ (id)_importEligibleMedicationConceptsSinceDate:(id)a3 limit:(int64_t)a4 profile:(id)a5 errorOut:(id *)a6;
+ (id)_medicationClustersFromScanResult:(id)a3 limit:(int64_t)a4 ontologyTransaction:(id)a5 errorOut:(id *)a6;
+ (id)_medicationClustersFromTextSearchTokens:(id)a3 limit:(int64_t)a4 ontologyTransaction:(id)a5 errorOut:(id *)a6;
+ (id)_medicationSearchResultForClinicalProduct:(id)a3 ontologyTransaction:(id)a4 errorOut:(id *)a5;
+ (id)_medicationSearchResultForSpecificProduct:(id)a3 ontologyTransaction:(id)a4 errorOut:(id *)a5;
+ (id)_predicateForConceptsNotExcludedFromSearch;
+ (id)_relationshipsForInflation;
+ (id)_resolveIndividualRxNormConceptsFromMedicalRecordsCodings:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)hkt_genericMedicationWithClinicalProductConcept:(id)a3 profile:(id)a4 errorOut:(id *)a5;
+ (id)medicationClustersForCHRImportWithExistingMedications:(id)a3 sinceDate:(id)a4 limit:(int64_t)a5 profile:(id)a6 errorOut:(id *)a7;
+ (id)medicationClustersFromScanResult:(id)a3 limit:(int64_t)a4 profile:(id)a5 errorOut:(id *)a6;
+ (id)medicationClustersFromTextSearchTokens:(id)a3 limit:(int64_t)a4 profile:(id)a5 errorOut:(id *)a6;
@end

@implementation HDMedicationSearchEngine

+ (id)medicationClustersFromScanResult:(id)a3 limit:(int64_t)a4 profile:(id)a5 errorOut:(id *)a6
{
  id v11 = a3;
  id v12 = a5;
  if (!v11)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"HDMedicationSearchEngine.m", 21, @"Invalid parameter not satisfying: %@", @"scanResult != nil" object file lineNumber description];
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__9;
  v27 = __Block_byref_object_dispose__9;
  id v28 = 0;
  v13 = [v12 ontologyDatabase];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__HDMedicationSearchEngine_medicationClustersFromScanResult_limit_profile_errorOut___block_invoke;
  v19[3] = &unk_1E6337D40;
  v21 = &v23;
  id v14 = v11;
  id v20 = v14;
  int64_t v22 = a4;
  char v15 = [v13 performTransactionWithError:a6 transactionHandler:v19];

  if (v15) {
    id v16 = (id)v24[5];
  }
  else {
    id v16 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v16;
}

BOOL __84__HDMedicationSearchEngine_medicationClustersFromScanResult_limit_profile_errorOut___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = +[HDMedicationSearchEngine _medicationClustersFromScanResult:a1[4] limit:a1[6] ontologyTransaction:a2 errorOut:a3];
  uint64_t v5 = *(void *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(a1[5] + 8) + 40) != 0;
}

+ (BOOL)medicationCluster:(id *)a3 machineReadableCode:(id)a4 codeAttributeType:(int64_t)a5 profile:(id)a6 errorOut:(id *)a7
{
  id v13 = a4;
  id v14 = a6;
  char v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F17FC6F0];
  id v16 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a5];
  char v17 = [v15 containsObject:v16];

  if (v17)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__9;
    v30 = __Block_byref_object_dispose__9;
    id v31 = 0;
    v18 = [v14 ontologyDatabase];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __101__HDMedicationSearchEngine_medicationCluster_machineReadableCode_codeAttributeType_profile_errorOut___block_invoke;
    v22[3] = &unk_1E6337628;
    v24 = &v26;
    int64_t v25 = a5;
    id v23 = v13;
    char v19 = [v18 performTransactionWithError:a7 transactionHandler:v22];

    if (a3) {
      char v20 = v19;
    }
    else {
      char v20 = 0;
    }
    if (v20) {
      *a3 = (id) v27[5];
    }

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:invalidArgument:class:selector:", a7, @"codeAttributeType", a1, a2);
    char v19 = 0;
  }

  return v19;
}

BOOL __101__HDMedicationSearchEngine_medicationCluster_machineReadableCode_codeAttributeType_profile_errorOut___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[4];
  uint64_t v6 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v6 + 40);
  BOOL v7 = +[HDMedicationSearchEngine _medicationClusterFromMachineReadableCode:v5 codeAttributeType:v4 searchResultOut:&obj ontologyTransaction:a2 errorOut:a3];
  objc_storeStrong((id *)(v6 + 40), obj);
  return v7;
}

+ (id)medicationClustersFromTextSearchTokens:(id)a3 limit:(int64_t)a4 profile:(id)a5 errorOut:(id *)a6
{
  id v11 = a3;
  id v12 = a5;
  if (!v11)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"HDMedicationSearchEngine.m", 73, @"Invalid parameter not satisfying: %@", @"tokens != nil" object file lineNumber description];
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__9;
  v27 = __Block_byref_object_dispose__9;
  id v28 = 0;
  id v13 = [v12 ontologyDatabase];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90__HDMedicationSearchEngine_medicationClustersFromTextSearchTokens_limit_profile_errorOut___block_invoke;
  v19[3] = &unk_1E6337D40;
  v21 = &v23;
  id v14 = v11;
  id v20 = v14;
  int64_t v22 = a4;
  char v15 = [v13 performTransactionWithError:a6 transactionHandler:v19];

  if (v15) {
    id v16 = (id)v24[5];
  }
  else {
    id v16 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v16;
}

BOOL __90__HDMedicationSearchEngine_medicationClustersFromTextSearchTokens_limit_profile_errorOut___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = +[HDMedicationSearchEngine _medicationClustersFromTextSearchTokens:a1[4] limit:a1[6] ontologyTransaction:a2 errorOut:a3];
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(a1[5] + 8) + 40) != 0;
}

+ (id)medicationClustersForCHRImportWithExistingMedications:(id)a3 sinceDate:(id)a4 limit:(int64_t)a5 profile:(id)a6 errorOut:(id *)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  uint64_t v46 = 0;
  id v27 = a4;
  id v29 = a6;
  v30 = objc_msgSend(a1, "_importEligibleMedicationConceptsSinceDate:limit:profile:errorOut:", v27, a5);
  id v31 = 0;
  if (v31)
  {
    if (a7)
    {
      id v12 = 0;
      *a7 = v31;
    }
    else
    {
      _HKLogDroppedError();
      id v12 = 0;
    }
  }
  else
  {
    id v13 = objc_msgSend(v30, "hk_map:", &__block_literal_global_11);
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__9;
    v44 = __Block_byref_object_dispose__9;
    id v45 = 0;
    id v14 = [v29 ontologyDatabase];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __115__HDMedicationSearchEngine_medicationClustersForCHRImportWithExistingMedications_sinceDate_limit_profile_errorOut___block_invoke_2;
    v36[3] = &unk_1E6337D40;
    v38 = &v40;
    id v26 = v13;
    id v37 = v26;
    int64_t v39 = a5;
    char v15 = [v14 performTransactionWithError:a7 transactionHandler:v36];

    if (v15)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v28];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v17 = (id)v41[5];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v47 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v33 != v19) {
              objc_enumerationMutation(v17);
            }
            v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            int64_t v22 = [v21 specificProduct];
            uint64_t v23 = [v22 identifier];
            char v24 = [v16 containsObject:v23];

            if ((v24 & 1) == 0) {
              [v12 addObject:v21];
            }
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v47 count:16];
        }
        while (v18);
      }
    }
    else
    {
      id v12 = 0;
    }

    _Block_object_dispose(&v40, 8);
  }

  return v12;
}

uint64_t __115__HDMedicationSearchEngine_medicationClustersForCHRImportWithExistingMedications_sinceDate_limit_profile_errorOut___block_invoke(uint64_t a1, void *a2)
{
  return [a2 numberRepresentation];
}

BOOL __115__HDMedicationSearchEngine_medicationClustersForCHRImportWithExistingMedications_sinceDate_limit_profile_errorOut___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = +[HDMedicationSearchEngine _medicationClustersFromScanResult:a1[4] limit:a1[6] ontologyTransaction:a2 errorOut:a3];
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(a1[5] + 8) + 40) != 0;
}

+ (BOOL)_medicationClusterFromMachineReadableCode:(id)a3 codeAttributeType:(int64_t)a4 searchResultOut:(id *)a5 ontologyTransaction:(id)a6 errorOut:(id *)a7
{
  id v12 = (void *)MEMORY[0x1E4F65D58];
  id v13 = (void *)MEMORY[0x1E4F65B90];
  id v14 = a6;
  char v15 = [v13 predicateMatchingConceptsWithAttributeType:a4 attributeValue:a3];
  id v16 = [a1 _predicateForConceptsNotExcludedFromSearch];
  id v17 = [v12 compoundPredicateWithPredicate:v15 otherPredicate:v16];

  LOBYTE(a7) = [a1 _medicationSearchResultForFirstConcept:a5 predicate:v17 ontologyTransaction:v14 errorOut:a7];
  return (char)a7;
}

+ (id)_medicationClustersFromScanResult:(id)a3 limit:(int64_t)a4 ontologyTransaction:(id)a5 errorOut:(id *)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v40 = 0u;
  long long v41 = 0u;
  if (a4 <= 1) {
    int64_t v12 = 1;
  }
  else {
    int64_t v12 = a4;
  }
  long long v42 = 0uLL;
  long long v43 = 0uLL;
  id v13 = v9;
  int64_t v14 = v12;
  id v15 = v13;
  uint64_t v39 = [v13 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v41;
    int64_t v37 = v14;
LABEL_6:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v41 != v38) {
        objc_enumerationMutation(v15);
      }
      id v17 = *(void **)(*((void *)&v40 + 1) + 8 * v16);
      if ([v11 count] == v14) {
        break;
      }
      uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2ADE8]), "initWithRawIdentifier:", objc_msgSend(v17, "integerValue"));
      uint64_t v19 = [v10 profile];
      id v20 = [v19 ontologyConceptManager];
      v21 = [v20 conceptForIdentifier:v18 options:1 transaction:v10 error:a6];

      if (v21)
      {
        if ([v21 isExcludedFromSearch])
        {
          _HKInitializeLogging();
          int64_t v22 = HKLogMedication();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v45 = a1;
            __int16 v46 = 2112;
            v47 = v18;
            uint64_t v23 = v22;
            char v24 = "[%{public}@] Attempted to seach for med excluded from search with ID: %@";
LABEL_16:
            _os_log_error_impl(&dword_1BD54A000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x16u);
          }
        }
        else
        {
          id v25 = v11;
          id v26 = v15;
          uint64_t v27 = [v21 relationships];
          if (v27
            && (id v28 = (void *)v27,
                [v21 relationships],
                id v29 = objc_claimAutoreleasedReturnValue(),
                uint64_t v30 = [v29 count],
                v29,
                v28,
                v30))
          {
            if (objc_msgSend(v21, "meds_isSpecificProduct"))
            {
              uint64_t v31 = [a1 _medicationSearchResultForSpecificProduct:v21 ontologyTransaction:v10 errorOut:a6];
              id v15 = v26;
              id v11 = v25;
              int64_t v14 = v37;
              if (!v31) {
                goto LABEL_29;
              }
            }
            else
            {
              id v15 = v26;
              id v11 = v25;
              int64_t v14 = v37;
              if (!objc_msgSend(v21, "meds_isClinicalProduct")) {
                goto LABEL_29;
              }
              uint64_t v31 = [a1 _medicationSearchResultForClinicalProduct:v21 ontologyTransaction:v10 errorOut:a6];
              if (!v31) {
                goto LABEL_29;
              }
            }
            int64_t v22 = v31;
            [v11 addObject:v31];
          }
          else
          {
            long long v32 = (void *)MEMORY[0x1E4F28C58];
            long long v33 = [v21 identifier];
            objc_msgSend(v32, "hk_assignError:code:format:", a6, 1003, @"Could not find any relationships for concept: %@ ", v33);

            _HKInitializeLogging();
            int64_t v22 = HKLogMedication();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              long long v34 = [v21 identifier];
              *(_DWORD *)buf = 138543618;
              id v45 = a1;
              __int16 v46 = 2114;
              v47 = v34;
              _os_log_error_impl(&dword_1BD54A000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] Could not find any relationships for concept: %{public}@", buf, 0x16u);
            }
            id v15 = v26;
            id v11 = v25;
            int64_t v14 = v37;
          }
        }
      }
      else
      {
        _HKInitializeLogging();
        int64_t v22 = HKLogMedication();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v45 = a1;
          __int16 v46 = 2114;
          v47 = v18;
          uint64_t v23 = v22;
          char v24 = "[%{public}@] Could not find a concept: %{public}@";
          goto LABEL_16;
        }
      }

LABEL_29:
      if (v39 == ++v16)
      {
        uint64_t v39 = [v15 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v39) {
          goto LABEL_6;
        }
        break;
      }
    }
  }

  return v11;
}

+ (id)_medicationClustersFromTextSearchTokens:(id)a3 limit:(int64_t)a4 ontologyTransaction:(id)a5 errorOut:(id *)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v56 = a5;
  id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = [objc_alloc(MEMORY[0x1E4F2ADE8]) initWithRawIdentifier:841];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = [MEMORY[0x1E4F65B90] predicateMatchingConceptsWithRelationshipType:1015 withObjectId:v8];
  [v10 addObject:v11];

  v53 = (void *)v8;
  int64_t v12 = [MEMORY[0x1E4F65B90] predicateMatchingConceptsWithRelationshipType:1015 withObjectId:v8];
  [v9 addObject:v12];

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v60 objects:v73 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v61 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v60 + 1) + 8 * i);
        uint64_t v19 = [MEMORY[0x1E4F65B90] predicateMatchingConceptsWithAttributeType:960 beingsWithAttributeValue:v18];
        id v20 = [MEMORY[0x1E4F65B90] predicateMatchingConceptsWithAttributeType:960 likeAttributeValue:v18];
        [v9 addObject:v20];
        [v10 addObject:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v60 objects:v73 count:16];
    }
    while (v15);
  }

  v21 = (void *)MEMORY[0x1E4F65D08];
  int64_t v22 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v9];
  v72 = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
  v55 = [v21 predicateMatchingAllPredicates:v23];

  char v24 = (void *)MEMORY[0x1E4F65D08];
  id v25 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v10];
  v71 = v25;
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
  v54 = [v24 predicateMatchingAllPredicates:v26];

  if ((unint64_t)[v13 count] >= 2)
  {
    uint64_t v27 = [v13 componentsJoinedByString:@" "];
    id v28 = (void *)MEMORY[0x1E4F65D08];
    id v29 = [MEMORY[0x1E4F65B90] predicateMatchingConceptsWithAttributeType:960 beingsWithAttributeValue:v27];
    v70[0] = v29;
    uint64_t v30 = [MEMORY[0x1E4F65B90] predicateMatchingConceptsWithRelationshipType:1015 withObjectId:v53];
    v70[1] = v30;
    uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
    long long v32 = [v28 predicateMatchingAllPredicates:v31];

    [v57 addObject:v32];
  }
  [v57 addObject:v54];
  [v57 addObject:v55];
  long long v33 = (void *)MEMORY[0x1E4F65D58];
  long long v34 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v57];
  long long v35 = [a1 _predicateForConceptsNotExcludedFromSearch];
  v36 = [v33 compoundPredicateWithPredicate:v34 otherPredicate:v35];

  int64_t v37 = [v13 componentsJoinedByString:@" | "];
  uint64_t v38 = HKSensitiveLogItem();

  uint64_t v39 = [a1 _relationshipsForInflation];
  CFAbsoluteTimeGetCurrent();
  long long v40 = (void *)MEMORY[0x1E4F65B90];
  long long v41 = [a1 _attributeTypesForInflation];
  long long v42 = [v40 inflateGraphWithRootConceptsPredicate:v36 limit:a4 maximumDepth:4 attributeTypes:v41 relationshipTypes:v39 ontologyTransaction:v56 error:a6];

  if (v42)
  {
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __103__HDMedicationSearchEngine__medicationClustersFromTextSearchTokens_limit_ontologyTransaction_errorOut___block_invoke;
    v58[3] = &unk_1E6337D88;
    v59 = v39;
    long long v43 = objc_msgSend(v42, "hk_map:", v58);
    _HKInitializeLogging();
    v44 = HKLogMedication();
    BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);

    if (v45)
    {
      __int16 v46 = HKLogMedication();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        CFAbsoluteTimeGetCurrent();
        v47 = HKDiagnosticStringFromDuration();
        *(_DWORD *)buf = 138543874;
        id v65 = a1;
        __int16 v66 = 2114;
        v67 = v38;
        __int16 v68 = 2114;
        v69 = v47;
        _os_log_impl(&dword_1BD54A000, v46, OS_LOG_TYPE_INFO, "[%{public}@] EXPANDED sub-graph for matches for tokens: [%{public}@] in %{public}@", buf, 0x20u);
      }
    }
    uint64_t v48 = v59;
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v48 = HKLogMedication();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      +[HDMedicationSearchEngine _medicationClustersFromTextSearchTokens:limit:ontologyTransaction:errorOut:]((uint64_t)a1, (uint64_t)v13, v48);
    }
    long long v43 = 0;
  }

  return v43;
}

id __103__HDMedicationSearchEngine__medicationClustersFromTextSearchTokens_limit_ontologyTransaction_errorOut___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F66B78];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 identifier];
  id v7 = [v6 numberRepresentation];
  uint64_t v8 = (void *)[v5 initWithSeedHgId:v7 specificProduct:v4 traversedRelationships:*(void *)(a1 + 32) traversedDepth:4];

  return v8;
}

+ (id)_relationshipsForInflation
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F2B240]);
  [v2 addInteger:798];
  [v2 addInteger:809];
  [v2 addInteger:985];
  [v2 addInteger:952];
  [v2 addInteger:982];
  [v2 addInteger:983];
  [v2 addInteger:797];
  [v2 addInteger:981];
  [v2 addInteger:980];
  [v2 addInteger:1015];
  [v2 addInteger:1013];
  return v2;
}

+ (id)_attributeTypesForInflation
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F2B240]);
  [v2 addInteger:1012];
  [v2 addInteger:960];
  [v2 addInteger:961];
  [v2 addInteger:962];
  [v2 addInteger:984];
  [v2 addInteger:796];
  [v2 addInteger:795];
  return v2;
}

+ (id)_medicationSearchResultForSpecificProduct:(id)a3 ontologyTransaction:(id)a4 errorOut:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1E4F65B90];
  id v10 = a4;
  id v11 = [v8 identifier];
  int64_t v12 = [v9 predicateMatchingConceptWithID:v11];

  id v19 = 0;
  LODWORD(v11) = [a1 _medicationSearchResultForFirstConcept:&v19 predicate:v12 ontologyTransaction:v10 errorOut:a5];

  id v13 = v19;
  uint64_t v14 = v13;
  id v15 = 0;
  if (v11)
  {
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      id v17 = [v8 identifier];
      objc_msgSend(v16, "hk_assignError:code:format:", a5, 118, @"Unable to get search result for specific product %@", v17);

      id v15 = 0;
    }
  }

  return v15;
}

+ (BOOL)_medicationSearchResultForFirstConcept:(id *)a3 predicate:(id)a4 ontologyTransaction:(id)a5 errorOut:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  int64_t v12 = [a1 _relationshipsForInflation];
  id v20 = 0;
  int v13 = [a1 _inflateFirstConcept:&v20 predicate:v11 relationshipTypes:v12 maximumDepth:4 ontologyTransaction:v10 errorOut:a6];

  id v14 = v20;
  id v15 = v14;
  if (v13 && a3 && v14)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F66B78]);
    id v17 = [v15 identifier];
    uint64_t v18 = [v17 numberRepresentation];
    *a3 = (id)[v16 initWithSeedHgId:v18 specificProduct:v15 traversedRelationships:v12 traversedDepth:4];
  }
  return v13;
}

+ (BOOL)_inflateFirstConcept:(id *)a3 predicate:(id)a4 relationshipTypes:(id)a5 maximumDepth:(int64_t)a6 ontologyTransaction:(id)a7 errorOut:(id *)a8
{
  id v14 = (void *)MEMORY[0x1E4F65B90];
  id v15 = a7;
  id v16 = a5;
  id v17 = a4;
  uint64_t v18 = [a1 _attributeTypesForInflation];
  id v19 = [v14 inflateGraphWithRootConceptsPredicate:v17 limit:1 maximumDepth:a6 attributeTypes:v18 relationshipTypes:v16 ontologyTransaction:v15 error:a8];

  if (v19)
  {
    uint64_t v20 = [v19 count];
    if (a3)
    {
      if (v20)
      {
        *a3 = [v19 firstObject];
      }
    }
  }

  return v19 != 0;
}

+ (id)_medicationSearchResultForClinicalProduct:(id)a3 ontologyTransaction:(id)a4 errorOut:(id *)a5
{
  id v8 = a4;
  id v9 = [a1 _genericProductForClinicalProduct:a3 ontologyTransaction:v8 error:a5];
  if (v9)
  {
    id v10 = [a1 _medicationSearchResultForSpecificProduct:v9 ontologyTransaction:v8 errorOut:a5];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)_genericProductForClinicalProduct:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"HDMedicationSearchEngine.m", 388, @"Invalid parameter not satisfying: %@", @"clinicalProduct != nil" object file lineNumber description];
  }
  uint64_t v28 = 0;
  id v29 = (id *)&v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__9;
  long long v32 = __Block_byref_object_dispose__9;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__9;
  id v26 = __Block_byref_object_dispose__9;
  id v27 = 0;
  id v11 = (void *)MEMORY[0x1E4F65B90];
  int64_t v12 = [v9 identifier];
  int v13 = [v11 predicateMatchingConceptsWithRelationshipType:798 withObjectId:v12];

  uint64_t v14 = *MEMORY[0x1E4F65DE0];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __88__HDMedicationSearchEngine__genericProductForClinicalProduct_ontologyTransaction_error___block_invoke;
  v21[3] = &unk_1E6337DB0;
  v21[4] = &v22;
  v21[5] = &v28;
  if ([MEMORY[0x1E4F65B90] enumerateConceptsMatchingPredicate:v13 options:0 limit:v14 transaction:v10 error:a5 enumerationHandler:v21])
  {
    id v15 = v29[5];
    if (v15 || (objc_storeStrong(v29 + 5, (id)v23[5]), (id v15 = v29[5]) != 0))
    {
      id v16 = v15;
      goto LABEL_9;
    }
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = [v9 identifier];
    objc_msgSend(v17, "hk_assignError:code:format:", a5, 118, @"Unable to get generic product for clinical product %@", v18);
  }
  id v16 = 0;
LABEL_9:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

uint64_t __88__HDMedicationSearchEngine__genericProductForClinicalProduct_ontologyTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  uint64_t v6 = (id *)(v5 + 40);
  if (!v7) {
    objc_storeStrong(v6, a2);
  }
  int v8 = [v4 isGeneric];
  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }

  return v8 ^ 1u;
}

+ (id)_importEligibleMedicationConceptsSinceDate:(id)a3 limit:(int64_t)a4 profile:(id)a5 errorOut:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__9;
  id v29 = __Block_byref_object_dispose__9;
  id v30 = 0;
  int64_t v12 = (void *)MEMORY[0x1E4F65B50];
  int v13 = [v11 database];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__HDMedicationSearchEngine__importEligibleMedicationConceptsSinceDate_limit_profile_errorOut___block_invoke;
  v19[3] = &unk_1E6337E00;
  id v14 = v10;
  id v20 = v14;
  id v15 = v11;
  id v23 = a1;
  int64_t v24 = a4;
  id v21 = v15;
  uint64_t v22 = &v25;
  LODWORD(a6) = [v12 performReadTransactionWithHealthDatabase:v13 error:a6 block:v19];

  if (a6) {
    id v16 = (void *)v26[5];
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;

  _Block_object_dispose(&v25, 8);
  return v17;
}

uint64_t __94__HDMedicationSearchEngine__importEligibleMedicationConceptsSinceDate_limit_profile_errorOut___block_invoke(void *a1, void *a2, void *a3)
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v37 = a2;
  id v4 = HDMedicalRecordEntityPredicateForSortDate();
  uint64_t v5 = [MEMORY[0x1E4F2B2C0] medicationOrderTypeForIdentifier:*MEMORY[0x1E4F2A050]];
  v47[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F2B2C0] medicationRecordTypeForIdentifier:*MEMORY[0x1E4F2A080]];
  v47[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __94__HDMedicationSearchEngine__importEligibleMedicationConceptsSinceDate_limit_profile_errorOut___block_invoke_2;
  v40[3] = &unk_1E6337DD8;
  id v36 = v4;
  id v41 = v36;
  int v8 = objc_msgSend(v7, "hk_map:", v40);

  id v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F29FF8] ascending:0];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  id v11 = objc_alloc(MEMORY[0x1E4F65B58]);
  __int16 v46 = v9;
  int64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  int v13 = (void *)[v11 initWithQueryDescriptors:v8 includeDeletedObjects:0 anchor:0 sortDescriptors:v12 bufferSize:10 profile:a1[5]];

  id v39 = 0;
  LODWORD(v11) = [v13 advanceWithError:&v39];
  id v14 = v39;
  if (!v11) {
    goto LABEL_18;
  }
  *(void *)&long long v15 = 138543618;
  long long v34 = v15;
  while (1)
  {
    id v16 = objc_msgSend(v13, "object", v34);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
LABEL_15:

    id v39 = v14;
    char v25 = [v13 advanceWithError:&v39];
    id v26 = v39;

    id v14 = v26;
    if ((v25 & 1) == 0) {
      goto LABEL_19;
    }
  }
  id v17 = [v16 primaryConcept];
  if ([v17 isAdHoc])
  {
  }
  else
  {
    uint64_t v18 = [v16 primaryConcept];
    char v19 = [v18 isNebulous];

    if ((v19 & 1) == 0)
    {
      id v23 = [v16 primaryConcept];
      uint64_t v22 = [v23 identifier];
      [v10 addObject:v22];
      goto LABEL_14;
    }
  }
  id v20 = (void *)a1[7];
  uint64_t v21 = a1[5];
  id v38 = 0;
  uint64_t v22 = [v20 _resolveIndividualRxNormConceptsFromMedicalRecordsCodings:v16 profile:v21 error:&v38];
  id v23 = v38;
  if (!v22)
  {
    _HKInitializeLogging();
    int64_t v24 = HKLogMedication();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = a1[7];
      *(_DWORD *)buf = v34;
      uint64_t v43 = v27;
      __int16 v44 = 2114;
      id v45 = v23;
      _os_log_error_impl(&dword_1BD54A000, v24, OS_LOG_TYPE_ERROR, "[%{public}@]: unable to resolve individual RxNorm codes. Error: %{public}@", buf, 0x16u);
    }

    goto LABEL_15;
  }
  if ([v22 count]) {
    [v10 addObjectsFromArray:v22];
  }
LABEL_14:

  if ((unint64_t)[v10 count] < a1[8]) {
    goto LABEL_15;
  }

LABEL_18:
  id v26 = v14;
LABEL_19:
  if (v26 && (objc_msgSend(v26, "hk_isHealthKitErrorWithCode:", 900) & 1) == 0)
  {
    _HKInitializeLogging();
    long long v32 = HKLogConceptIndex();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      __94__HDMedicationSearchEngine__importEligibleMedicationConceptsSinceDate_limit_profile_errorOut___block_invoke_cold_1((uint64_t)v26, v32);
    }

    if (a3)
    {
      uint64_t v31 = 0;
      *a3 = v26;
    }
    else
    {
      _HKLogDroppedError();
      uint64_t v31 = 0;
    }
  }
  else
  {
    uint64_t v28 = [v10 array];
    uint64_t v29 = *(void *)(a1[6] + 8);
    id v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;

    uint64_t v31 = 1;
  }

  return v31;
}

id __94__HDMedicationSearchEngine__importEligibleMedicationConceptsSinceDate_limit_profile_errorOut___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F65BD0];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];

  uint64_t v7 = (void *)[v5 initWithSampleTypes:v6 encodingOptions:0 restrictedSourceEntities:0 authorizationFilter:0 samplePredicate:*(void *)(a1 + 32)];
  return v7;
}

+ (id)_resolveIndividualRxNormConceptsFromMedicalRecordsCodings:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a4;
  int v8 = [a3 medicalRecordCodings];
  id v9 = objc_msgSend(v8, "hk_filter:", &__block_literal_global_367_0);

  if ([v9 count])
  {
    id v10 = objc_msgSend(v9, "hk_map:", &__block_literal_global_373);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int64_t v12 = (void *)MEMORY[0x1E4F65B90];
    int v13 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v10];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __100__HDMedicationSearchEngine__resolveIndividualRxNormConceptsFromMedicalRecordsCodings_profile_error___block_invoke_3;
    v18[3] = &unk_1E6337E68;
    id v14 = v11;
    id v19 = v14;
    int v15 = [v12 enumerateConceptsMatchingPredicate:v13 profile:v7 error:a5 enumerationHandler:v18];

    if (v15) {
      id v16 = v14;
    }
    else {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  }

  return v16;
}

BOOL __100__HDMedicationSearchEngine__resolveIndividualRxNormConceptsFromMedicalRecordsCodings_profile_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 codingSystem];
  id v4 = [v3 identifier];
  if ([v4 isEqualToString:@"http://www.nlm.nih.gov/research/umls/rxnorm"])
  {
    id v5 = [v2 code];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

id __100__HDMedicationSearchEngine__resolveIndividualRxNormConceptsFromMedicalRecordsCodings_profile_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F65B90];
  v3 = [a2 code];
  id v4 = [v2 predicateMatchingConceptsWithAttributeType:1008 attributeValue:v3];

  return v4;
}

uint64_t __100__HDMedicationSearchEngine__resolveIndividualRxNormConceptsFromMedicalRecordsCodings_profile_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [a2 identifier];
  objc_msgSend(v2, "hk_addNonNilObject:", v3);

  return 1;
}

+ (id)_predicateForConceptsNotExcludedFromSearch
{
  return (id)[MEMORY[0x1E4F65B90] predicateForConceptsWithoutAttributeType:620 attributeValue:*MEMORY[0x1E4F29910]];
}

+ (id)hkt_genericMedicationWithClinicalProductConcept:(id)a3 profile:(id)a4 errorOut:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__9;
  id v23 = __Block_byref_object_dispose__9;
  id v24 = 0;
  id v10 = [v9 ontologyDatabase];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__HDMedicationSearchEngine_hkt_genericMedicationWithClinicalProductConcept_profile_errorOut___block_invoke;
  v15[3] = &unk_1E6337D40;
  id v17 = &v19;
  id v18 = a1;
  id v11 = v8;
  id v16 = v11;
  LODWORD(a5) = [v10 performTransactionWithError:a5 transactionHandler:v15];

  if (a5) {
    int64_t v12 = (void *)v20[5];
  }
  else {
    int64_t v12 = 0;
  }
  id v13 = v12;

  _Block_object_dispose(&v19, 8);
  return v13;
}

BOOL __93__HDMedicationSearchEngine_hkt_genericMedicationWithClinicalProductConcept_profile_errorOut___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(a1 + 48) _genericProductForClinicalProduct:*(void *)(a1 + 32) ontologyTransaction:a2 error:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

+ (void)_medicationClustersFromTextSearchTokens:(os_log_t)log limit:ontologyTransaction:errorOut:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1BD54A000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to query concepts using tokens: [%{public}@]", (uint8_t *)&v3, 0x16u);
}

void __94__HDMedicationSearchEngine__importEligibleMedicationConceptsSinceDate_limit_profile_errorOut___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = HKSensitiveLogItem();
  int v4 = 138543362;
  __int16 v5 = v3;
  _os_log_error_impl(&dword_1BD54A000, a2, OS_LOG_TYPE_ERROR, "Failed to iterate medical records: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end