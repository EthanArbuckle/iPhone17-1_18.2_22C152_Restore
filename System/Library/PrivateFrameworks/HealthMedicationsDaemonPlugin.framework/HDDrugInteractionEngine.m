@interface HDDrugInteractionEngine
+ (BOOL)_drugInteractionClassWithRelationshipsFromClass:(void *)a3 ontologyTransaction:(void *)a4 drugInteractionClassOut:(void *)a5 error:;
+ (BOOL)_interactionClassForLifestyleFactor:(void *)a3 ontologyTransaction:(void *)a4 interactionClassCache:(void *)a5 interactionClassOut:(void *)a6 error:;
+ (BOOL)_interactionClassForLifestyleFactorConceptIdentifier:(void *)a3 ontologyTransaction:(void *)a4 interactionClassOut:(void *)a5 error:;
+ (BOOL)_interactionResultForFirstMedication:(void *)a3 secondMedication:(void *)a4 ontologyTransaction:(void *)a5 interactionClassCache:(void *)a6 interactionResultOut:(uint64_t *)a7 error:;
+ (BOOL)_interactionResultForMedication:(uint64_t)a3 lifestyleFactor:(void *)a4 ontologyTransaction:(void *)a5 interactionClassCache:(void *)a6 interactionResultOut:(uint64_t *)a7 error:;
+ (BOOL)interactionClassForLifestyleFactor:(unint64_t)a3 profile:(id)a4 interactionClassOut:(id *)a5 error:(id *)a6;
+ (BOOL)interactionResultForFirstInteractionClass:(id)a3 secondInteractionClass:(id)a4 profile:(id)a5 interactionResultOut:(id *)a6 error:(id *)a7;
+ (BOOL)interactionResultForFirstMedication:(id)a3 secondMedication:(id)a4 profile:(id)a5 interactionResultOut:(id *)a6 error:(id *)a7;
+ (BOOL)interactionResultForMedication:(id)a3 lifestyleFactor:(unint64_t)a4 profile:(id)a5 interactionResultOut:(id *)a6 error:(id *)a7;
+ (HDDrugInteractionClass)_drugInteractionClassForConcept:(void *)a3 ancestorIdentifier:;
+ (NSObject)_interactionClassConceptsForConcept:(void *)a3 ontologyTransaction:(void *)a4 error:;
+ (id)_fetchKnownConceptWithIdentifier:(void *)a3 ontologyTransaction:(void *)a4 errorOut:;
+ (id)_interactionClassConceptsForConceptWithIdentifier:(void *)a3 ontologyTransaction:(void *)a4 error:;
+ (id)_interactionClassesForConceptWithIdentifier:(void *)a3 ontologyTransaction:(uint64_t *)a4 error:;
+ (id)_interactionClassesForConceptWithIdentifier:(void *)a3 ontologyTransaction:(void *)a4 interactionClassCache:(uint64_t *)a5 error:;
+ (id)_interactionClassesForMedication:(void *)a3 ontologyTransaction:(void *)a4 interactionClassCache:(uint64_t *)a5 error:;
+ (id)_interactionResultsForFirstInteractionClassSet:(void *)a3 secondInteractionClassSet:(void *)a4 ontologyTransaction:(void *)a5 error:;
+ (id)_interactionResultsForInteractionClasses:(uint64_t)a3 lifestyleFactor:(void *)a4 ontologyTransaction:(void *)a5 interactionClassCache:(void *)a6 error:;
+ (id)_interactionResultsForInteractionClasses:(void *)a3 ontologyTransaction:(void *)a4 error:;
+ (id)_interactionResultsForMedications:(void *)a3 lifestyleFactors:(void *)a4 ontologyTransaction:(void *)a5 interactionClassCache:(void *)a6 medicationsUserDefaults:(uint64_t *)a7 error:;
+ (id)_numberOfInteractionsForConceptWithIdentifier:(void *)a3 ontologyTransaction:(void *)a4 error:;
+ (id)interactionClassesForConceptWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)interactionClassesForMedication:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)interactionResultsForInteractionClasses:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)interactionResultsForMedications:(id)a3 lifestyleFactors:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)numberOfInteractionsForConceptWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)numberOfInteractionsForMedication:(id)a3 profile:(id)a4 error:(id *)a5;
+ (uint64_t)_allAreOntologyBackedMedications:(uint64_t)a1;
+ (uint64_t)_conceptForIdentifier:(void *)a3 ontologyTransaction:(void *)a4 conceptOut:(void *)a5 errorOut:;
+ (uint64_t)_drugInteractionResultForConceptWithIdentifier:(void *)a3 firstInteractionClass:(void *)a4 secondInteractionClass:(void *)a5 ontologyTransaction:(NSObject *)a6 interactionResultOut:(void *)a7 error:;
+ (uint64_t)_interactionResultForFirstInteractionClass:(void *)a3 secondInteractionClass:(void *)a4 ontologyTransaction:(void *)a5 interactionResultOut:(void *)a6 error:;
+ (uint64_t)_severityConceptForConceptWithIdentifier:(void *)a3 ontologyTransaction:(void *)a4 severityConceptOut:(uint64_t)a5 error:;
+ (uint64_t)_severityForConceptWithIdentifier:(void *)a3 ontologyTransaction:(NSObject *)a4 severityOut:(uint64_t)a5 error:;
@end

@implementation HDDrugInteractionEngine

+ (id)interactionClassesForConceptWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"HDDrugInteractionEngine.m", 31, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__5;
  v24 = __Block_byref_object_dispose__5;
  id v25 = 0;
  v11 = [v10 ontologyDatabase];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__HDDrugInteractionEngine_interactionClassesForConceptWithIdentifier_profile_error___block_invoke;
  v17[3] = &unk_1E63375B0;
  v19 = &v20;
  id v12 = v9;
  id v18 = v12;
  char v13 = [v11 performTransactionWithError:a5 transactionHandler:v17];

  if (v13) {
    id v14 = (id)v21[5];
  }
  else {
    id v14 = 0;
  }

  _Block_object_dispose(&v20, 8);
  return v14;
}

BOOL __84__HDDrugInteractionEngine_interactionClassesForConceptWithIdentifier_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v4 = +[HDDrugInteractionEngine _interactionClassesForConceptWithIdentifier:ontologyTransaction:error:]((uint64_t)HDDrugInteractionEngine, *(void **)(a1 + 32), a2, a3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

+ (id)_interactionClassesForConceptWithIdentifier:(void *)a3 ontologyTransaction:(uint64_t *)a4 error:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = self;
  if (!v6)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:sel__interactionClassesForConceptWithIdentifier_ontologyTransaction_error_, v8, @"HDDrugInteractionEngine.m", 297, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  id v9 = +[HDDrugInteractionEngine _interactionClassConceptsForConceptWithIdentifier:ontologyTransaction:error:]((uint64_t)HDDrugInteractionEngine, v6, v7, a4);
  id v10 = v9;
  if (v9)
  {
    if ([v9 count])
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __97__HDDrugInteractionEngine__interactionClassesForConceptWithIdentifier_ontologyTransaction_error___block_invoke;
      v17[3] = &unk_1E6337678;
      id v18 = v6;
      objc_msgSend(v10, "hk_map:", v17);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _HKInitializeLogging();
      char v13 = HKLogMedication();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v20 = v8;
        __int16 v21 = 2114;
        id v22 = v6;
        _os_log_impl(&dword_1BD54A000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Found 0 interaction class concepts for product identifier: %{public}@", buf, 0x16u);
      }

      id v11 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
  }
  else
  {
    _HKInitializeLogging();
    id v12 = HKLogMedication();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *a4;
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v8;
      __int16 v21 = 2114;
      id v22 = v6;
      __int16 v23 = 2114;
      uint64_t v24 = v15;
      _os_log_error_impl(&dword_1BD54A000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] Could not get interaction concepts for identifier: %{public}@, error: %{public}@", buf, 0x20u);
    }

    id v11 = 0;
  }

  return v11;
}

+ (id)interactionClassesForMedication:(id)a3 profile:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"HDDrugInteractionEngine.m", 52, @"Invalid parameter not satisfying: %@", @"medication != nil" object file lineNumber description];
  }
  id v11 = [v9 firstOntologyCoding];

  if (!v11)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"HDDrugInteractionEngine.m", 53, @"Invalid parameter not satisfying: %@", @"medication.firstOntologyCoding != nil" object file lineNumber description];
  }
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  id v28 = 0;
  id v12 = [v10 ontologyDatabase];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__HDDrugInteractionEngine_interactionClassesForMedication_profile_error___block_invoke;
  v20[3] = &unk_1E63375B0;
  id v22 = &v23;
  id v13 = v9;
  id v21 = v13;
  char v14 = [v12 performTransactionWithError:a5 transactionHandler:v20];

  if (v14)
  {
    id v15 = (id)v24[5];
  }
  else
  {
    _HKInitializeLogging();
    v16 = HKLogMedication();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HKSensitiveLogItem();
      objc_claimAutoreleasedReturnValue();
      +[HDDrugInteractionEngine interactionClassesForMedication:profile:error:]();
    }

    id v15 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v15;
}

BOOL __73__HDDrugInteractionEngine_interactionClassesForMedication_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a2;
  id v7 = objc_alloc_init(v5);
  uint64_t v8 = +[HDDrugInteractionEngine _interactionClassesForMedication:ontologyTransaction:interactionClassCache:error:]((uint64_t)HDDrugInteractionEngine, *(void **)(a1 + 32), v6, v7, a3);

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  BOOL v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
  return v11;
}

+ (id)_interactionClassesForMedication:(void *)a3 ontologyTransaction:(void *)a4 interactionClassCache:(uint64_t *)a5 error:
{
  id v8 = a2;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = self;
  if (!v8)
  {
    uint64_t v15 = v11;
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:sel__interactionClassesForMedication_ontologyTransaction_interactionClassCache_error_, v15, @"HDDrugInteractionEngine.m", 326, @"Invalid parameter not satisfying: %@", @"medication != nil" object file lineNumber description];
  }
  id v12 = [v8 firstConceptIdentifier];
  id v13 = +[HDDrugInteractionEngine _interactionClassesForConceptWithIdentifier:ontologyTransaction:interactionClassCache:error:]((uint64_t)HDDrugInteractionEngine, v12, v10, v9, a5);

  return v13;
}

+ (BOOL)interactionClassForLifestyleFactor:(unint64_t)a3 profile:(id)a4 interactionClassOut:(id *)a5 error:(id *)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__5;
  v19 = __Block_byref_object_dispose__5;
  id v20 = 0;
  id v10 = [v9 ontologyDatabase];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __96__HDDrugInteractionEngine_interactionClassForLifestyleFactor_profile_interactionClassOut_error___block_invoke;
  v14[3] = &unk_1E63375D8;
  v14[4] = &v15;
  v14[5] = a3;
  char v11 = [v10 performTransactionWithError:a6 transactionHandler:v14];

  if (v11)
  {
    if (a5) {
      *a5 = (id) v16[5];
    }
  }
  else
  {
    _HKInitializeLogging();
    id v12 = HKLogMedication();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HKStringFromDrugInteractionLifestyleFactor();
      objc_claimAutoreleasedReturnValue();
      +[HDDrugInteractionEngine interactionClassForLifestyleFactor:profile:interactionClassOut:error:]();
    }
  }
  _Block_object_dispose(&v15, 8);

  return v11;
}

BOOL __96__HDDrugInteractionEngine_interactionClassForLifestyleFactor_profile_interactionClassOut_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v6 + 40);
  BOOL v7 = +[HDDrugInteractionEngine _interactionClassForLifestyleFactor:ontologyTransaction:interactionClassCache:interactionClassOut:error:]((uint64_t)HDDrugInteractionEngine, v5, a2, 0, &obj, a3);
  objc_storeStrong((id *)(v6 + 40), obj);
  return v7;
}

+ (BOOL)_interactionClassForLifestyleFactor:(void *)a3 ontologyTransaction:(void *)a4 interactionClassCache:(void *)a5 interactionClassOut:(void *)a6 error:
{
  id v9 = a3;
  id v10 = a4;
  self;
  char v11 = HKConceptIdentifierForDrugInteractionLifestyleFactor();
  id v12 = [v10 objectForKeyedSubscript:v11];
  id v13 = [v12 anyObject];

  if (v13)
  {
    if (!a5)
    {
      BOOL v14 = 1;
      goto LABEL_11;
    }
    id v13 = v13;
    BOOL v14 = 1;
    goto LABEL_9;
  }
  id v18 = 0;
  BOOL v14 = +[HDDrugInteractionEngine _interactionClassForLifestyleFactorConceptIdentifier:ontologyTransaction:interactionClassOut:error:]((uint64_t)HDDrugInteractionEngine, v11, v9, &v18, a6);
  id v15 = v18;
  id v13 = v15;
  if (v14 && v15)
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v15, 0);
    [v10 setObject:v16 forKeyedSubscript:v11];
  }
  if (a5)
  {
    id v13 = v13;
LABEL_9:
    *a5 = v13;
  }
LABEL_11:

  return v14;
}

+ (id)numberOfInteractionsForConceptWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"HDDrugInteractionEngine.m", 103, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__5;
  uint64_t v25 = __Block_byref_object_dispose__5;
  id v26 = 0;
  char v11 = [v10 ontologyDatabase];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__HDDrugInteractionEngine_numberOfInteractionsForConceptWithIdentifier_profile_error___block_invoke;
  v18[3] = &unk_1E63375B0;
  id v20 = &v21;
  id v12 = v9;
  id v19 = v12;
  char v13 = [v11 performTransactionWithError:a5 transactionHandler:v18];

  if (v13)
  {
    id v14 = (id)v22[5];
  }
  else
  {
    _HKInitializeLogging();
    id v15 = HKLogMedication();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HKSensitiveLogItem();
      objc_claimAutoreleasedReturnValue();
      +[HDDrugInteractionEngine numberOfInteractionsForConceptWithIdentifier:profile:error:]();
    }

    id v14 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v14;
}

BOOL __86__HDDrugInteractionEngine_numberOfInteractionsForConceptWithIdentifier_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = +[HDDrugInteractionEngine _numberOfInteractionsForConceptWithIdentifier:ontologyTransaction:error:]((uint64_t)HDDrugInteractionEngine, *(void **)(a1 + 32), a2, a3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

+ (id)_numberOfInteractionsForConceptWithIdentifier:(void *)a3 ontologyTransaction:(void *)a4 error:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = self;
  if (!v6)
  {
    uint64_t v21 = v8;
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:sel__numberOfInteractionsForConceptWithIdentifier_ontologyTransaction_error_, v21, @"HDDrugInteractionEngine.m", 382, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  id v9 = +[HDDrugInteractionEngine _interactionClassConceptsForConceptWithIdentifier:ontologyTransaction:error:]((uint64_t)HDDrugInteractionEngine, v6, v7, a4);
  id v10 = v9;
  if (v9)
  {
    id v23 = v7;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    char v11 = [v9 allObjects];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = [*(id *)(*((void *)&v24 + 1) + 8 * i) relationships];
          id v18 = objc_msgSend(v17, "hk_filter:", &__block_literal_global_7);

          v14 += [v18 count];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }
    else
    {
      uint64_t v14 = 0;
    }

    id v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v14];
    id v7 = v23;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

+ (id)numberOfInteractionsForMedication:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"HDDrugInteractionEngine.m", 126, @"Invalid parameter not satisfying: %@", @"medication != nil" object file lineNumber description];
  }
  char v11 = [v9 firstConceptIdentifier];

  if (!v11)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"HDDrugInteractionEngine.m", 127, @"Invalid parameter not satisfying: %@", @"medication.firstConceptIdentifier != nil" object file lineNumber description];
  }
  uint64_t v12 = [v9 firstConceptIdentifier];
  uint64_t v13 = +[HDDrugInteractionEngine numberOfInteractionsForConceptWithIdentifier:v12 profile:v10 error:a5];

  return v13;
}

+ (BOOL)interactionResultForFirstInteractionClass:(id)a3 secondInteractionClass:(id)a4 profile:(id)a5 interactionResultOut:(id *)a6 error:(id *)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"HDDrugInteractionEngine.m", 142, @"Invalid parameter not satisfying: %@", @"firstInteractionClass != nil" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, a1, @"HDDrugInteractionEngine.m", 143, @"Invalid parameter not satisfying: %@", @"secondInteractionClass != nil" object file lineNumber description];

LABEL_3:
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__5;
  v36 = __Block_byref_object_dispose__5;
  id v37 = 0;
  v16 = [v15 ontologyDatabase];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __127__HDDrugInteractionEngine_interactionResultForFirstInteractionClass_secondInteractionClass_profile_interactionResultOut_error___block_invoke;
  v28[3] = &unk_1E6337600;
  id v17 = v13;
  id v29 = v17;
  id v18 = v14;
  id v30 = v18;
  v31 = &v32;
  char v19 = [v16 performTransactionWithError:a7 transactionHandler:v28];

  if (v19)
  {
    if (a6) {
      *a6 = (id) v33[5];
    }
  }
  else
  {
    _HKInitializeLogging();
    id v20 = HKLogMedication();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v22 = [v17 identifier];
      id v23 = [v18 identifier];
      HKSensitiveLogItem();
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      long long v25 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138544386;
      id v39 = a1;
      __int16 v40 = 2114;
      v41 = v22;
      __int16 v42 = 2114;
      v43 = v23;
      __int16 v44 = 2112;
      id v45 = v24;
      __int16 v46 = 2112;
      v47 = v25;
      _os_log_error_impl(&dword_1BD54A000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Could not get interaction result for 1st interaction class identifier: %{public}@, 2nd interaction class identifier: %{public}@, 1st class: %@, 2nd class: %@", buf, 0x34u);
    }
  }

  _Block_object_dispose(&v32, 8);
  return v19;
}

uint64_t __127__HDDrugInteractionEngine_interactionResultForFirstInteractionClass_secondInteractionClass_profile_interactionResultOut_error___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)a1[4];
  id v6 = (void *)a1[5];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = +[HDDrugInteractionEngine _interactionResultForFirstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:]((uint64_t)HDDrugInteractionEngine, v5, v6, a2, &obj, a3);
  objc_storeStrong((id *)(v7 + 40), obj);
  return v8;
}

+ (uint64_t)_interactionResultForFirstInteractionClass:(void *)a3 secondInteractionClass:(void *)a4 ontologyTransaction:(void *)a5 interactionResultOut:(void *)a6 error:
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = self;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v57 = [MEMORY[0x1E4F28B00] currentHandler];
    [v57 handleFailureInMethod:sel__interactionResultForFirstInteractionClass_secondInteractionClass_ontologyTransaction_interactionResultOut_error_, v13, @"HDDrugInteractionEngine.m", 414, @"Invalid parameter not satisfying: %@", @"firstInteractionClass != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v58 = [MEMORY[0x1E4F28B00] currentHandler];
  [v58 handleFailureInMethod:sel__interactionResultForFirstInteractionClass_secondInteractionClass_ontologyTransaction_interactionResultOut_error_, v13, @"HDDrugInteractionEngine.m", 415, @"Invalid parameter not satisfying: %@", @"secondInteractionClass != nil" object file lineNumber description];

LABEL_3:
  id v14 = [v10 identifier];
  id v15 = [v11 identifier];
  int v16 = [v14 isEqual:v15];

  if (v16)
  {
    _HKInitializeLogging();
    id v17 = HKLogMedication();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);

    if (v18)
    {
      char v19 = HKLogMedication();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = [v10 identifier];
        *(_DWORD *)buf = 138543618;
        uint64_t v85 = v13;
        __int16 v86 = 2114;
        v87 = v20;
        _os_log_impl(&dword_1BD54A000, v19, OS_LOG_TYPE_INFO, "[%{public}@] Detected interaction class check against itself, skipping: %{public}@", buf, 0x16u);
      }
    }
    if (a5) {
      *a5 = 0;
    }
    uint64_t v21 = 1;
  }
  else
  {
    id v83 = 0;
    BOOL v22 = +[HDDrugInteractionEngine _drugInteractionClassWithRelationshipsFromClass:ontologyTransaction:drugInteractionClassOut:error:]((uint64_t)HDDrugInteractionEngine, v10, v12, &v83, a6);
    id v23 = v83;
    id v24 = v23;
    if (v22 && v23)
    {
      id v82 = 0;
      BOOL v25 = +[HDDrugInteractionEngine _drugInteractionClassWithRelationshipsFromClass:ontologyTransaction:drugInteractionClassOut:error:]((uint64_t)HDDrugInteractionEngine, v11, v12, &v82, a6);
      long long v26 = v82;
      v71 = v26;
      if (v25 && (long long v27 = v26) != 0)
      {
        id v28 = [v24 relationships];
        id v29 = objc_msgSend(v28, "hk_filter:", &__block_literal_global_368);

        id v30 = [v27 relationships];
        v70 = objc_msgSend(v30, "hk_filter:", &__block_literal_global_370);

        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        v31 = v29;
        uint64_t v63 = [v31 countByEnumeratingWithState:&v78 objects:v91 count:16];
        if (v63)
        {
          uint64_t v32 = *(void *)v79;
          v67 = v11;
          v68 = v10;
          v69 = v12;
          v61 = a6;
          v62 = a5;
          v65 = v31;
          v66 = v24;
          uint64_t v59 = v13;
          uint64_t v60 = *(void *)v79;
          do
          {
            uint64_t v33 = 0;
            do
            {
              if (*(void *)v79 != v32)
              {
                uint64_t v34 = v33;
                objc_enumerationMutation(v31);
                uint64_t v33 = v34;
              }
              uint64_t v64 = v33;
              v35 = *(void **)(*((void *)&v78 + 1) + 8 * v33);
              long long v74 = 0u;
              long long v75 = 0u;
              long long v76 = 0u;
              long long v77 = 0u;
              id obj = v70;
              uint64_t v36 = [obj countByEnumeratingWithState:&v74 objects:v90 count:16];
              if (v36)
              {
                uint64_t v37 = v36;
                uint64_t v38 = *(void *)v75;
                while (2)
                {
                  for (uint64_t i = 0; i != v37; ++i)
                  {
                    if (*(void *)v75 != v38) {
                      objc_enumerationMutation(obj);
                    }
                    __int16 v40 = *(void **)(*((void *)&v74 + 1) + 8 * i);
                    v41 = [v35 destination];
                    __int16 v42 = [v41 identifier];
                    uint64_t v43 = [v42 rawIdentifier];
                    __int16 v44 = [v40 destination];
                    id v45 = [v44 identifier];
                    uint64_t v46 = [v45 rawIdentifier];

                    if (v43 == v46)
                    {
                      uint64_t v48 = [v35 destination];
                      v49 = [v48 identifier];
                      v73 = 0;
                      id v11 = v67;
                      id v10 = v68;
                      id v12 = v69;
                      uint64_t v21 = +[HDDrugInteractionEngine _drugInteractionResultForConceptWithIdentifier:firstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:]((uint64_t)HDDrugInteractionEngine, v49, v68, v67, v69, &v73, v61);
                      v47 = v73;

                      _HKInitializeLogging();
                      v50 = HKLogMedication();
                      v51 = v50;
                      if (v21)
                      {
                        BOOL v52 = os_log_type_enabled(v50, OS_LOG_TYPE_INFO);

                        v31 = v65;
                        if (v52)
                        {
                          v53 = HKLogMedication();
                          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
                          {
                            v54 = [v47 identifier];
                            v55 = HKSensitiveLogItem();
                            *(_DWORD *)buf = 138543874;
                            uint64_t v85 = v59;
                            __int16 v86 = 2114;
                            v87 = v54;
                            __int16 v88 = 2112;
                            v89 = v55;
                            _os_log_impl(&dword_1BD54A000, v53, OS_LOG_TYPE_INFO, "[%{public}@] Found drug interaction with identifier: %{public}@, interaction: %@", buf, 0x20u);
                          }
                        }
                        id v12 = v69;
                        if (v62) {
                          void *v62 = v47;
                        }
                      }
                      else
                      {
                        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
                          +[HDDrugInteractionEngine _interactionResultForFirstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:]();
                        }

                        v31 = v65;
                      }

                      id v24 = v66;
                      goto LABEL_50;
                    }
                  }
                  uint64_t v37 = [obj countByEnumeratingWithState:&v74 objects:v90 count:16];
                  if (v37) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v33 = v64 + 1;
              id v11 = v67;
              id v10 = v68;
              id v12 = v69;
              a5 = v62;
              v31 = v65;
              id v24 = v66;
              uint64_t v32 = v60;
            }
            while (v64 + 1 != v63);
            uint64_t v63 = [v65 countByEnumeratingWithState:&v78 objects:v91 count:16];
          }
          while (v63);
        }

        v47 = 0;
        if (a5) {
          *a5 = 0;
        }
        uint64_t v21 = 1;
LABEL_50:
      }
      else
      {
        _HKInitializeLogging();
        v31 = HKLogMedication();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          +[HDDrugInteractionEngine _interactionResultForFirstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:]();
        }
        v47 = 0;
        uint64_t v21 = 0;
      }
    }
    else
    {
      _HKInitializeLogging();
      v71 = HKLogMedication();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
        +[HDDrugInteractionEngine _interactionResultForFirstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:]();
      }
      v47 = 0;
      uint64_t v21 = 0;
    }
  }
  return v21;
}

+ (id)interactionResultsForInteractionClasses:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"HDDrugInteractionEngine.m", 167, @"Invalid parameter not satisfying: %@", @"interactionClasses != nil" object file lineNumber description];
  }
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__5;
  id v24 = __Block_byref_object_dispose__5;
  id v25 = 0;
  id v11 = [v10 ontologyDatabase];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __81__HDDrugInteractionEngine_interactionResultsForInteractionClasses_profile_error___block_invoke;
  v17[3] = &unk_1E63375B0;
  char v19 = &v20;
  id v12 = v9;
  id v18 = v12;
  char v13 = [v11 performTransactionWithError:a5 transactionHandler:v17];

  if (v13) {
    id v14 = (id)v21[5];
  }
  else {
    id v14 = 0;
  }

  _Block_object_dispose(&v20, 8);
  return v14;
}

BOOL __81__HDDrugInteractionEngine_interactionResultsForInteractionClasses_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = +[HDDrugInteractionEngine _interactionResultsForInteractionClasses:ontologyTransaction:error:]((uint64_t)HDDrugInteractionEngine, *(void **)(a1 + 32), a2, a3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

+ (id)_interactionResultsForInteractionClasses:(void *)a3 ontologyTransaction:(void *)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = self;
  if (!v6)
  {
    uint64_t v20 = v8;
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:sel__interactionResultsForInteractionClasses_ontologyTransaction_error_, v20, @"HDDrugInteractionEngine.m", 487, @"Invalid parameter not satisfying: %@", @"interactionClasses != nil" object file lineNumber description];
  }
  uint64_t v22 = v6;
  id v9 = [v6 allObjects];
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([v9 count])
  {
    uint64_t v10 = 0;
    uint64_t v11 = 1;
    while (1)
    {
      unint64_t v23 = v10 + 1;
      if ([v9 count] > (unint64_t)(v10 + 1)) {
        break;
      }
LABEL_11:
      ++v11;
      ++v10;
      if ([v9 count] <= v23) {
        goto LABEL_12;
      }
    }
    uint64_t v12 = v11;
    while (1)
    {
      char v13 = [v9 objectAtIndexedSubscript:v10];
      id v14 = [v9 objectAtIndexedSubscript:v12];
      id v25 = 0;
      int v15 = +[HDDrugInteractionEngine _interactionResultForFirstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:]((uint64_t)HDDrugInteractionEngine, v13, v14, v7, &v25, a4);
      id v16 = v25;

      if (!v15) {
        break;
      }
      if (v16) {
        [v24 addObject:v16];
      }

      if ([v9 count] <= (unint64_t)++v12) {
        goto LABEL_11;
      }
    }

    id v18 = 0;
    id v17 = v24;
  }
  else
  {
LABEL_12:
    id v17 = v24;
    id v18 = v24;
  }

  return v18;
}

+ (BOOL)interactionResultForFirstMedication:(id)a3 secondMedication:(id)a4 profile:(id)a5 interactionResultOut:(id *)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"HDDrugInteractionEngine.m", 191, @"Invalid parameter not satisfying: %@", @"firstMedication != nil" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  id v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, a1, @"HDDrugInteractionEngine.m", 192, @"Invalid parameter not satisfying: %@", @"secondMedication != nil" object file lineNumber description];

LABEL_3:
  id v16 = [v13 firstOntologyCoding];

  if (!v16)
  {
    long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"HDDrugInteractionEngine.m", 193, @"Invalid parameter not satisfying: %@", @"firstMedication.firstOntologyCoding != nil" object file lineNumber description];
  }
  id v17 = [v14 firstOntologyCoding];

  if (!v17)
  {
    long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"HDDrugInteractionEngine.m", 194, @"Invalid parameter not satisfying: %@", @"secondMedication.firstOntologyCoding != nil" object file lineNumber description];
  }
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__5;
  uint64_t v36 = __Block_byref_object_dispose__5;
  id v37 = 0;
  id v18 = [v15 ontologyDatabase];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __115__HDDrugInteractionEngine_interactionResultForFirstMedication_secondMedication_profile_interactionResultOut_error___block_invoke;
  v28[3] = &unk_1E6337600;
  id v19 = v13;
  id v29 = v19;
  id v20 = v14;
  id v30 = v20;
  v31 = &v32;
  char v21 = [v18 performTransactionWithError:a7 transactionHandler:v28];

  if (a6) {
    char v22 = v21;
  }
  else {
    char v22 = 0;
  }
  if (v22) {
    *a6 = (id) v33[5];
  }

  _Block_object_dispose(&v32, 8);
  return v21;
}

BOOL __115__HDDrugInteractionEngine_interactionResultForFirstMedication_secondMedication_profile_interactionResultOut_error___block_invoke(void *a1, void *a2, uint64_t *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a2;
  id v7 = objc_alloc_init(v5);
  uint64_t v8 = (void *)a1[4];
  id v9 = (void *)a1[5];
  uint64_t v10 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v10 + 40);
  BOOL v11 = +[HDDrugInteractionEngine _interactionResultForFirstMedication:secondMedication:ontologyTransaction:interactionClassCache:interactionResultOut:error:]((uint64_t)HDDrugInteractionEngine, v8, v9, v6, v7, &obj, a3);

  objc_storeStrong((id *)(v10 + 40), obj);
  return v11;
}

+ (BOOL)_interactionResultForFirstMedication:(void *)a3 secondMedication:(void *)a4 ontologyTransaction:(void *)a5 interactionClassCache:(void *)a6 interactionResultOut:(uint64_t *)a7 error:
{
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = self;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:sel__interactionResultForFirstMedication_secondMedication_ontologyTransaction_interactionClassCache_interactionResultOut_error_, v16, @"HDDrugInteractionEngine.m", 590, @"Invalid parameter not satisfying: %@", @"firstMedication != nil" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:sel__interactionResultForFirstMedication_secondMedication_ontologyTransaction_interactionClassCache_interactionResultOut_error_, v16, @"HDDrugInteractionEngine.m", 591, @"Invalid parameter not satisfying: %@", @"secondMedication != nil" object file lineNumber description];

LABEL_3:
  id v17 = +[HDDrugInteractionEngine _interactionClassesForMedication:ontologyTransaction:interactionClassCache:error:]((uint64_t)HDDrugInteractionEngine, v12, v14, v15, a7);
  id v18 = v17;
  if (v17)
  {
    if ([v17 count])
    {
      id v19 = +[HDDrugInteractionEngine _interactionClassesForMedication:ontologyTransaction:interactionClassCache:error:]((uint64_t)HDDrugInteractionEngine, v13, v14, v15, a7);
      id v20 = v19;
      if (!v19)
      {
        BOOL v23 = 0;
        goto LABEL_17;
      }
      if (![v19 count])
      {
        BOOL v23 = 1;
        goto LABEL_17;
      }
      char v21 = +[HDDrugInteractionEngine _interactionResultsForFirstInteractionClassSet:secondInteractionClassSet:ontologyTransaction:error:]((uint64_t)HDDrugInteractionEngine, v18, v20, v14, a7);
      char v22 = v21;
      BOOL v23 = v21 != 0;
      if (!v21)
      {
LABEL_12:

LABEL_17:
        goto LABEL_18;
      }
      if ([v21 count])
      {
        id v30 = objc_alloc(MEMORY[0x1E4F66B08]);
        id v29 = [v12 firstConceptIdentifier];
        id v28 = [v13 firstConceptIdentifier];
        id v24 = (void *)[v30 initWithFirstConceptIdentifier:v29 secondConceptIdentifier:v28 interactionType:1 interactions:v22];

        if (!a6)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        id v24 = 0;
        if (!a6) {
          goto LABEL_11;
        }
      }
      *a6 = v24;
      goto LABEL_11;
    }
    BOOL v23 = 1;
  }
  else
  {
    BOOL v23 = 0;
  }
LABEL_18:

  return v23;
}

+ (BOOL)interactionResultForMedication:(id)a3 lifestyleFactor:(unint64_t)a4 profile:(id)a5 interactionResultOut:(id *)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a5;
  if (!v13)
  {
    char v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"HDDrugInteractionEngine.m", 221, @"Invalid parameter not satisfying: %@", @"medication != nil" object file lineNumber description];
  }
  id v15 = [v13 firstOntologyCoding];

  if (!v15)
  {
    char v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"HDDrugInteractionEngine.m", 222, @"Invalid parameter not satisfying: %@", @"medication.firstOntologyCoding != nil" object file lineNumber description];
  }
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__5;
  v31 = __Block_byref_object_dispose__5;
  id v32 = 0;
  uint64_t v16 = [v14 ontologyDatabase];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __109__HDDrugInteractionEngine_interactionResultForMedication_lifestyleFactor_profile_interactionResultOut_error___block_invoke;
  v23[3] = &unk_1E6337628;
  id v17 = v13;
  id v25 = &v27;
  unint64_t v26 = a4;
  id v24 = v17;
  char v18 = [v16 performTransactionWithError:a7 transactionHandler:v23];

  if (a6) {
    char v19 = v18;
  }
  else {
    char v19 = 0;
  }
  if (v19) {
    *a6 = (id) v28[5];
  }

  _Block_object_dispose(&v27, 8);
  return v18;
}

BOOL __109__HDDrugInteractionEngine_interactionResultForMedication_lifestyleFactor_profile_interactionResultOut_error___block_invoke(void *a1, void *a2, uint64_t *a3)
{
  uint64_t v5 = a1[6];
  id v6 = (void *)a1[4];
  uint64_t v7 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v7 + 40);
  BOOL v8 = +[HDDrugInteractionEngine _interactionResultForMedication:lifestyleFactor:ontologyTransaction:interactionClassCache:interactionResultOut:error:]((uint64_t)HDDrugInteractionEngine, v6, v5, a2, 0, &obj, a3);
  objc_storeStrong((id *)(v7 + 40), obj);
  return v8;
}

+ (BOOL)_interactionResultForMedication:(uint64_t)a3 lifestyleFactor:(void *)a4 ontologyTransaction:(void *)a5 interactionClassCache:(void *)a6 interactionResultOut:(uint64_t *)a7 error:
{
  id v12 = a2;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = self;
  if (!v12)
  {
    uint64_t v26 = v15;
    uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:sel__interactionResultForMedication_lifestyleFactor_ontologyTransaction_interactionClassCache_interactionResultOut_error_, v26, @"HDDrugInteractionEngine.m", 650, @"Invalid parameter not satisfying: %@", @"medication != nil" object file lineNumber description];
  }
  uint64_t v16 = +[HDDrugInteractionEngine _interactionClassesForMedication:ontologyTransaction:interactionClassCache:error:]((uint64_t)HDDrugInteractionEngine, v12, v13, v14, a7);
  id v17 = v16;
  if (v16)
  {
    if ([v16 count])
    {
      char v18 = +[HDDrugInteractionEngine _interactionResultsForInteractionClasses:lifestyleFactor:ontologyTransaction:interactionClassCache:error:]((uint64_t)HDDrugInteractionEngine, v17, a3, v13, v14, a7);
      char v19 = v18;
      BOOL v20 = v18 != 0;
      if (v18)
      {
        if ([v18 count])
        {
          char v21 = HKConceptIdentifierForDrugInteractionLifestyleFactor();
          id v22 = objc_alloc(MEMORY[0x1E4F66B08]);
          BOOL v23 = [v12 firstConceptIdentifier];
          id v24 = (void *)[v22 initWithFirstConceptIdentifier:v23 secondConceptIdentifier:v21 interactionType:2 interactions:v19];

          if (a6) {
            *a6 = v24;
          }
        }
        else if (a6)
        {
          *a6 = 0;
        }
      }
    }
    else
    {
      BOOL v20 = 1;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

+ (id)interactionResultsForMedications:(id)a3 lifestyleFactors:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    char v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"HDDrugInteractionEngine.m", 247, @"Invalid parameter not satisfying: %@", @"medications != nil" object file lineNumber description];
  }
  if ((+[HDDrugInteractionEngine _allAreOntologyBackedMedications:]((uint64_t)a1, v11) & 1) == 0)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"HDDrugInteractionEngine.m", 248, @"Invalid parameter not satisfying: %@", @"[self _allAreOntologyBackedMedications:medications]" object file lineNumber description];
  }
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__5;
  id v32 = __Block_byref_object_dispose__5;
  id v33 = 0;
  id v14 = [v13 ontologyDatabase];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __91__HDDrugInteractionEngine_interactionResultsForMedications_lifestyleFactors_profile_error___block_invoke;
  v23[3] = &unk_1E6337650;
  id v15 = v13;
  id v24 = v15;
  uint64_t v27 = &v28;
  id v16 = v11;
  id v25 = v16;
  id v17 = v12;
  id v26 = v17;
  char v18 = [v14 performTransactionWithError:a6 transactionHandler:v23];

  if (v18) {
    id v19 = (id)v29[5];
  }
  else {
    id v19 = 0;
  }

  _Block_object_dispose(&v28, 8);
  return v19;
}

+ (uint64_t)_allAreOntologyBackedMedications:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = objc_msgSend(v2, "hk_allObjectsPassTestWithError:test:", 0, &__block_literal_global_449);

  return v3;
}

BOOL __91__HDDrugInteractionEngine_interactionResultsForMedications_lifestyleFactors_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a2;
  id v7 = objc_alloc_init(v5);
  BOOL v8 = [*(id *)(a1 + 32) healthMedicationsProfileExtension];
  id v9 = [v8 medicationUserDefaults];

  uint64_t v10 = +[HDDrugInteractionEngine _interactionResultsForMedications:lifestyleFactors:ontologyTransaction:interactionClassCache:medicationsUserDefaults:error:]((uint64_t)HDDrugInteractionEngine, *(void **)(a1 + 40), *(void **)(a1 + 48), v6, v7, v9, a3);

  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  BOOL v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) != 0;
  return v13;
}

+ (id)_interactionResultsForMedications:(void *)a3 lifestyleFactors:(void *)a4 ontologyTransaction:(void *)a5 interactionClassCache:(void *)a6 medicationsUserDefaults:(uint64_t *)a7 error:
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v55 = a3;
  id v12 = a4;
  id v61 = a5;
  id v13 = a6;
  uint64_t v57 = self;
  if (!v11)
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:sel__interactionResultsForMedications_lifestyleFactors_ontologyTransaction_interactionClassCache_medicationsUserDefaults_error_, v57, @"HDDrugInteractionEngine.m", 699, @"Invalid parameter not satisfying: %@", @"medications != nil" object file lineNumber description];
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v56 = [v11 allObjects];
  if ([v56 count])
  {
    unint64_t v15 = 0;
    uint64_t v53 = 1;
    uint64_t v59 = v14;
    id v51 = v13;
    id v52 = v11;
    while (1)
    {
      id v16 = [v56 objectAtIndexedSubscript:v15];
      if (![v13 BOOLForKey:@"MedicationsInteractionsWithSelfAllowed"]) {
        goto LABEL_13;
      }
      _HKInitializeLogging();
      id v17 = HKLogMedication();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v71 = v57;
        _os_log_impl(&dword_1BD54A000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Checking medications for interactions with self", buf, 0xCu);
      }

      id v68 = 0;
      BOOL v18 = +[HDDrugInteractionEngine _interactionResultForFirstMedication:secondMedication:ontologyTransaction:interactionClassCache:interactionResultOut:error:]((uint64_t)HDDrugInteractionEngine, v16, v16, v12, v61, &v68, a7);
      id v19 = v68;
      BOOL v20 = v19;
      if (!v18) {
        goto LABEL_38;
      }
      if (v19)
      {
        _HKInitializeLogging();
        char v21 = HKLogMedication();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = [v14 count] + 1;
          BOOL v23 = [v16 firstConceptIdentifier];
          *(_DWORD *)buf = 138543874;
          uint64_t v71 = v57;
          __int16 v72 = 2050;
          uint64_t v73 = v22;
          __int16 v74 = 2114;
          long long v75 = v23;
          _os_log_impl(&dword_1BD54A000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Found medication #%{public}lu interaction: Inter-medication interaction with identifier: %{public}@", buf, 0x20u);

          id v14 = v59;
        }

        v54 = v20;
        [v14 addObject:v20];
      }
      else
      {
LABEL_13:
        v54 = 0;
      }
      unint64_t v50 = v15 + 1;
      if ([v56 count] > v15 + 1) {
        break;
      }
LABEL_22:
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id obj = v55;
      uint64_t v33 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
      id v14 = v59;
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v64;
        while (2)
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v64 != v35) {
              objc_enumerationMutation(obj);
            }
            unsigned int v37 = [*(id *)(*((void *)&v63 + 1) + 8 * i) unsignedIntValue];
            id v62 = 0;
            BOOL v38 = +[HDDrugInteractionEngine _interactionResultForMedication:lifestyleFactor:ontologyTransaction:interactionClassCache:interactionResultOut:error:]((uint64_t)HDDrugInteractionEngine, v16, v37, v12, v61, &v62, a7);
            id v39 = v62;
            __int16 v40 = v39;
            if (!v38)
            {

              id v47 = 0;
              id v13 = v51;
              id v11 = v52;
              goto LABEL_39;
            }
            if (v39)
            {
              _HKInitializeLogging();
              v41 = HKLogMedication();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v42 = [v14 count];
                id v43 = v12;
                uint64_t v44 = v42 + 1;
                id v45 = [v16 firstConceptIdentifier];
                uint64_t v46 = HKConceptIdentifierForDrugInteractionLifestyleFactor();
                *(_DWORD *)buf = 138544130;
                uint64_t v71 = v57;
                __int16 v72 = 2050;
                uint64_t v73 = v44;
                id v12 = v43;
                id v14 = v59;
                __int16 v74 = 2114;
                long long v75 = v45;
                __int16 v76 = 2114;
                long long v77 = v46;
                _os_log_impl(&dword_1BD54A000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Found medication #%{public}lu interaction: Between identifier: %{public}@ and identifier: %{public}@", buf, 0x2Au);
              }
              [v14 addObject:v40];
            }
          }
          uint64_t v34 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
          if (v34) {
            continue;
          }
          break;
        }
      }

      id v11 = v52;
      ++v53;
      unint64_t v15 = v50;
      id v13 = v51;
      if ([v56 count] <= v50) {
        goto LABEL_35;
      }
    }
    uint64_t v24 = v53;
    while (1)
    {
      id v25 = [v56 objectAtIndexedSubscript:v24];
      id v67 = 0;
      BOOL v26 = +[HDDrugInteractionEngine _interactionResultForFirstMedication:secondMedication:ontologyTransaction:interactionClassCache:interactionResultOut:error:]((uint64_t)HDDrugInteractionEngine, v16, v25, v12, v61, &v67, a7);
      id v27 = v67;
      uint64_t v28 = v27;
      if (!v26) {
        break;
      }
      if (v27)
      {
        _HKInitializeLogging();
        uint64_t v29 = HKLogMedication();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = [v59 count] + 1;
          v31 = [v16 firstConceptIdentifier];
          id v32 = [v25 firstConceptIdentifier];
          *(_DWORD *)buf = 138544130;
          uint64_t v71 = v57;
          __int16 v72 = 2050;
          uint64_t v73 = v30;
          __int16 v74 = 2114;
          long long v75 = v31;
          __int16 v76 = 2114;
          long long v77 = v32;
          _os_log_impl(&dword_1BD54A000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Found medication #%{public}lu interaction: Between identifier: %{public}@ and identifier: %{public}@", buf, 0x2Au);
        }
        [v59 addObject:v28];
      }

      if ([v56 count] <= (unint64_t)++v24) {
        goto LABEL_22;
      }
    }

    id v13 = v51;
    id v11 = v52;
    id v14 = v59;
    BOOL v20 = v54;
LABEL_38:

    id v47 = 0;
  }
  else
  {
LABEL_35:
    id v47 = v14;
  }
LABEL_39:

  return v47;
}

+ (id)_interactionClassesForConceptWithIdentifier:(void *)a3 ontologyTransaction:(void *)a4 interactionClassCache:(uint64_t *)a5 error:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  if (!v8)
  {
    uint64_t v15 = v11;
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:sel__interactionClassesForConceptWithIdentifier_ontologyTransaction_interactionClassCache_error_, v15, @"HDDrugInteractionEngine.m", 278, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  id v12 = [v10 objectForKeyedSubscript:v8];
  if (!v12)
  {
    id v12 = +[HDDrugInteractionEngine _interactionClassesForConceptWithIdentifier:ontologyTransaction:error:]((uint64_t)HDDrugInteractionEngine, v8, v9, a5);
    if (v12) {
      [v10 setObject:v12 forKeyedSubscript:v8];
    }
  }
  id v13 = v12;

  return v13;
}

+ (id)_interactionClassConceptsForConceptWithIdentifier:(void *)a3 ontologyTransaction:(void *)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = self;
  if (!v6)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:sel__interactionClassConceptsForConceptWithIdentifier_ontologyTransaction_error_, v8, @"HDDrugInteractionEngine.m", 1006, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  id v17 = 0;
  char v9 = +[HDDrugInteractionEngine _conceptForIdentifier:ontologyTransaction:conceptOut:errorOut:]((uint64_t)HDDrugInteractionEngine, v6, v7, &v17, a4);
  id v10 = v17;
  uint64_t v11 = v10;
  if (v9)
  {
    if (v10)
    {
      +[HDDrugInteractionEngine _interactionClassConceptsForConcept:ontologyTransaction:error:]((uint64_t)HDDrugInteractionEngine, v10, v7, a4);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
      id v13 = v12;
      goto LABEL_10;
    }
    if (!*a4)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
      goto LABEL_6;
    }
    _HKInitializeLogging();
    id v14 = HKLogMedication();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[HDDrugInteractionEngine _interactionClassConceptsForConceptWithIdentifier:ontologyTransaction:error:]();
    }
  }
  else
  {
    _HKInitializeLogging();
    id v14 = HKLogMedication();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[HDDrugInteractionEngine _interactionClassConceptsForConceptWithIdentifier:ontologyTransaction:error:]();
    }
  }

  id v13 = 0;
LABEL_10:

  return v13;
}

HDDrugInteractionClass *__97__HDDrugInteractionEngine__interactionClassesForConceptWithIdentifier_ontologyTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  return +[HDDrugInteractionEngine _drugInteractionClassForConcept:ancestorIdentifier:]((uint64_t)HDDrugInteractionEngine, a2, *(void **)(a1 + 32));
}

+ (HDDrugInteractionClass)_drugInteractionClassForConcept:(void *)a3 ancestorIdentifier:
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = self;
  if (!v5)
  {
    uint64_t v14 = v6;
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:sel__drugInteractionClassForConcept_ancestorIdentifier_, v14, @"HDDrugInteractionEngine.m", 884, @"Invalid parameter not satisfying: %@", @"ontologyConcept != nil" object file lineNumber description];
  }
  id v7 = [HDDrugInteractionClass alloc];
  uint64_t v8 = [v5 localizedPreferredName];
  char v9 = [v5 relationships];
  id v10 = [v5 identifier];
  uint64_t v11 = [v5 validInRegions];

  id v12 = [(HDDrugInteractionClass *)v7 initWithName:v8 relationships:v9 ancestorIdentifier:v4 ontologyIdentifier:v10 validRegionCodes:v11];
  return v12;
}

+ (BOOL)_interactionClassForLifestyleFactorConceptIdentifier:(void *)a3 ontologyTransaction:(void *)a4 interactionClassOut:(void *)a5 error:
{
  id v8 = a2;
  id v9 = a3;
  self;
  id v10 = +[HDDrugInteractionEngine _fetchKnownConceptWithIdentifier:ontologyTransaction:errorOut:]((uint64_t)HDDrugInteractionEngine, v8, v9, a5);

  if (v10)
  {
    uint64_t v11 = +[HDDrugInteractionEngine _drugInteractionClassForConcept:ancestorIdentifier:]((uint64_t)HDDrugInteractionEngine, v10, v8);
    id v12 = v11;
    if (a4) {
      *a4 = v11;
    }
  }
  else
  {
    _HKInitializeLogging();
    id v13 = HKLogMedication();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[HDDrugInteractionEngine _interactionClassForLifestyleFactorConceptIdentifier:ontologyTransaction:interactionClassOut:error:]();
    }
  }
  return v10 != 0;
}

+ (id)_fetchKnownConceptWithIdentifier:(void *)a3 ontologyTransaction:(void *)a4 errorOut:
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = self;
  if (!v6)
  {
    uint64_t v15 = v8;
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:sel__fetchKnownConceptWithIdentifier_ontologyTransaction_errorOut_, v15, @"HDDrugInteractionEngine.m", 812, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  id v9 = [v7 profile];
  id v10 = [v9 ontologyConceptManager];
  id v17 = 0;
  uint64_t v11 = [v10 conceptForIdentifier:v6 options:1 transaction:v7 error:&v17];

  id v12 = v17;
  if (v11)
  {
    id v13 = v11;
    goto LABEL_12;
  }
  if (v12)
  {
    id v12 = v12;
LABEL_8:
    if (a4) {
      *a4 = v12;
    }
    else {
      _HKLogDroppedError();
    }

    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 118, @"Did not find expected concept in ontology with identifier %@", v6);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12) {
    goto LABEL_8;
  }
LABEL_12:

  return v11;
}

BOOL __99__HDDrugInteractionEngine__numberOfInteractionsForConceptWithIdentifier_ontologyTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 813;
}

+ (BOOL)_drugInteractionClassWithRelationshipsFromClass:(void *)a3 ontologyTransaction:(void *)a4 drugInteractionClassOut:(void *)a5 error:
{
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = self;
  if (!v8)
  {
    BOOL v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:sel__drugInteractionClassWithRelationshipsFromClass_ontologyTransaction_drugInteractionClassOut_error_, v10, @"HDDrugInteractionEngine.m", 859, @"Invalid parameter not satisfying: %@", @"drugInteractionClass != nil" object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a4) {
      *a4 = v8;
    }
    BOOL v11 = 1;
  }
  else
  {
    id v12 = [v8 identifier];
    id v13 = +[HDDrugInteractionEngine _fetchKnownConceptWithIdentifier:ontologyTransaction:errorOut:]((uint64_t)HDDrugInteractionEngine, v12, v9, a5);

    BOOL v11 = v13 != 0;
    if (v13)
    {
      uint64_t v14 = [v8 ancestorIdentifier];
      uint64_t v15 = +[HDDrugInteractionEngine _drugInteractionClassForConcept:ancestorIdentifier:]((uint64_t)HDDrugInteractionEngine, v13, v14);

      if (a4) {
        *a4 = v15;
      }
    }
    else
    {
      _HKInitializeLogging();
      id v16 = HKLogMedication();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[HDDrugInteractionEngine _drugInteractionClassWithRelationshipsFromClass:ontologyTransaction:drugInteractionClassOut:error:](v10, v8);
      }
    }
  }

  return v11;
}

BOOL __140__HDDrugInteractionEngine__interactionResultForFirstInteractionClass_secondInteractionClass_ontologyTransaction_interactionResultOut_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 813;
}

BOOL __140__HDDrugInteractionEngine__interactionResultForFirstInteractionClass_secondInteractionClass_ontologyTransaction_interactionResultOut_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 type] == 813;
}

+ (uint64_t)_drugInteractionResultForConceptWithIdentifier:(void *)a3 firstInteractionClass:(void *)a4 secondInteractionClass:(void *)a5 ontologyTransaction:(NSObject *)a6 interactionResultOut:(void *)a7 error:
{
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = self;
  if (!v12)
  {
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:sel__drugInteractionResultForConceptWithIdentifier_firstInteractionClass_secondInteractionClass_ontologyTransaction_interactionResultOut_error_, v16, @"HDDrugInteractionEngine.m", 1043, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  id v17 = +[HDDrugInteractionEngine _fetchKnownConceptWithIdentifier:ontologyTransaction:errorOut:]((uint64_t)HDDrugInteractionEngine, v12, v15, a7);
  if (v17)
  {
    uint64_t v33 = 0;
    char v18 = +[HDDrugInteractionEngine _severityForConceptWithIdentifier:ontologyTransaction:severityOut:error:]((uint64_t)HDDrugInteractionEngine, v12, v15, &v33, (uint64_t)a7);
    id v19 = v33;
    if (v18)
    {
      uint64_t v30 = a6;
      id v31 = v13;
      BOOL v20 = (void *)MEMORY[0x1E4F65B98];
      char v21 = [v17 identifier];
      id v32 = 0;
      uint64_t v22 = [v20 localizedEducationContentForConceptWithIdentifier:v21 ontologyTransaction:v15 localizedEducationContentOut:&v32 error:a7];
      BOOL v23 = v32;

      if (v22)
      {
        id v24 = objc_alloc(MEMORY[0x1E4F66AC8]);
        id v25 = [v17 validInRegions];
        BOOL v26 = v24;
        id v13 = v31;
        id v27 = [v26 initWithFirstInteractionClass:v31 secondInteractionClass:v14 severity:v19 educationContent:v23 ontologyIdentifier:v12 validRegionCodes:v25];

        if (v30)
        {
          id v27 = v27;
          *uint64_t v30 = v27;
        }
      }
      else
      {
        _HKInitializeLogging();
        id v27 = HKLogMedication();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          +[HDDrugInteractionEngine _drugInteractionResultForConceptWithIdentifier:firstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:]();
        }
        id v13 = v31;
      }
    }
    else
    {
      _HKInitializeLogging();
      BOOL v23 = HKLogMedication();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        +[HDDrugInteractionEngine _drugInteractionResultForConceptWithIdentifier:firstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:]();
      }
      uint64_t v22 = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    id v19 = HKLogMedication();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[HDDrugInteractionEngine _drugInteractionResultForConceptWithIdentifier:firstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:]();
    }
    uint64_t v22 = 0;
  }

  return v22;
}

+ (id)_interactionResultsForInteractionClasses:(uint64_t)a3 lifestyleFactor:(void *)a4 ontologyTransaction:(void *)a5 interactionClassCache:(void *)a6 error:
{
  id v10 = a2;
  id v11 = a4;
  id v12 = a5;
  id v13 = v10;
  id v14 = v12;
  uint64_t v15 = self;
  if (!v10)
  {
    uint64_t v27 = v15;
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:sel__interactionResultsForInteractionClasses_lifestyleFactor_ontologyTransaction_interactionClassCache_error_, v27, @"HDDrugInteractionEngine.m", 518, @"Invalid parameter not satisfying: %@", @"interactionClasses != nil" object file lineNumber description];
  }
  uint64_t v16 = [v10 allObjects];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v31 = 0;
  char v18 = v14;
  BOOL v19 = +[HDDrugInteractionEngine _interactionClassForLifestyleFactor:ontologyTransaction:interactionClassCache:interactionClassOut:error:]((uint64_t)HDDrugInteractionEngine, a3, v11, v14, &v31, a6);
  id v20 = v31;
  id v21 = 0;
  if (v19)
  {
    uint64_t v29 = v18;
    if ([v16 count])
    {
      uint64_t v22 = 0;
      while (1)
      {
        BOOL v23 = [v16 objectAtIndexedSubscript:v22];
        id v30 = 0;
        int v24 = +[HDDrugInteractionEngine _interactionResultForFirstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:]((uint64_t)HDDrugInteractionEngine, v23, v20, v11, &v30, a6);
        id v25 = v30;

        if (!v24) {
          break;
        }
        if (v25) {
          [v17 addObject:v25];
        }

        if ([v16 count] <= (unint64_t)++v22) {
          goto LABEL_10;
        }
      }

      id v21 = 0;
    }
    else
    {
LABEL_10:
      id v21 = v17;
    }
    char v18 = v29;
    id v13 = v10;
  }

  return v21;
}

+ (id)_interactionResultsForFirstInteractionClassSet:(void *)a3 secondInteractionClassSet:(void *)a4 ontologyTransaction:(void *)a5 error:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:sel__interactionResultsForFirstInteractionClassSet_secondInteractionClassSet_ontologyTransaction_error_, v11, @"HDDrugInteractionEngine.m", 556, @"Invalid parameter not satisfying: %@", @"firstInteractionClassSet" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:sel__interactionResultsForFirstInteractionClassSet_secondInteractionClassSet_ontologyTransaction_error_, v11, @"HDDrugInteractionEngine.m", 557, @"Invalid parameter not satisfying: %@", @"secondInteractionClassSet" object file lineNumber description];

LABEL_3:
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v13 = v8;
  uint64_t v31 = [v13 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v31)
  {
    uint64_t v14 = *(void *)v41;
    uint64_t v33 = v13;
    id v34 = v9;
    uint64_t v30 = *(void *)v41;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v41 != v14) {
          objc_enumerationMutation(v13);
        }
        uint64_t v32 = v15;
        uint64_t v16 = *(void **)(*((void *)&v40 + 1) + 8 * v15);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v17 = v9;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v37;
          while (2)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v37 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              id v35 = 0;
              int v23 = +[HDDrugInteractionEngine _interactionResultForFirstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:]((uint64_t)HDDrugInteractionEngine, v16, v22, v10, &v35, a5);
              id v24 = v35;
              id v25 = v24;
              if (!v23)
              {

                id v13 = v33;
                id v26 = 0;
                id v9 = v34;
                goto LABEL_22;
              }
              if (v24) {
                [v12 addObject:v24];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v44 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }

        uint64_t v15 = v32 + 1;
        id v13 = v33;
        id v9 = v34;
        uint64_t v14 = v30;
      }
      while (v32 + 1 != v31);
      uint64_t v31 = [v33 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v31);
  }

  id v26 = v12;
LABEL_22:

  return v26;
}

+ (uint64_t)_conceptForIdentifier:(void *)a3 ontologyTransaction:(void *)a4 conceptOut:(void *)a5 errorOut:
{
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = self;
  if (!v8)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:sel__conceptForIdentifier_ontologyTransaction_conceptOut_errorOut_, v10, @"HDDrugInteractionEngine.m", 785, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  uint64_t v11 = [v9 profile];
  id v12 = [v11 ontologyConceptManager];
  id v19 = 0;
  id v13 = [v12 conceptForIdentifier:v8 options:1 transaction:v9 error:&v19];

  id v14 = v19;
  if (v13)
  {
    if (a4) {
      *a4 = v13;
    }
    goto LABEL_11;
  }
  if (!v14)
  {
LABEL_11:
    uint64_t v16 = 1;
    goto LABEL_12;
  }
  _HKInitializeLogging();
  uint64_t v15 = HKLogMedication();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    +[HDDrugInteractionEngine _conceptForIdentifier:ontologyTransaction:conceptOut:errorOut:]();
  }

  if (a5)
  {
    uint64_t v16 = 0;
    *a5 = v14;
  }
  else
  {
    _HKLogDroppedError();
    uint64_t v16 = 0;
  }
LABEL_12:

  return v16;
}

+ (uint64_t)_severityConceptForConceptWithIdentifier:(void *)a3 ontologyTransaction:(void *)a4 severityConceptOut:(uint64_t)a5 error:
{
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = self;
  if (!v8)
  {
    uint64_t v14 = v10;
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:sel__severityConceptForConceptWithIdentifier_ontologyTransaction_severityConceptOut_error_, v14, @"HDDrugInteractionEngine.m", 836, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__5;
  id v21 = __Block_byref_object_dispose__5;
  id v22 = 0;
  uint64_t v11 = [MEMORY[0x1E4F65B90] predicateMatchingConceptsWithRelationshipType:799 withSubjectId:v8];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __113__HDDrugInteractionEngine__severityConceptForConceptWithIdentifier_ontologyTransaction_severityConceptOut_error___block_invoke;
  v16[3] = &unk_1E63376C0;
  v16[4] = &v17;
  uint64_t v12 = [MEMORY[0x1E4F65B90] enumerateConceptsMatchingPredicate:v11 options:1 limit:1 transaction:v9 error:a5 enumerationHandler:v16];
  if (a4) {
    *a4 = (id) v18[5];
  }

  _Block_object_dispose(&v17, 8);
  return v12;
}

uint64_t __113__HDDrugInteractionEngine__severityConceptForConceptWithIdentifier_ontologyTransaction_severityConceptOut_error___block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

+ (uint64_t)_severityForConceptWithIdentifier:(void *)a3 ontologyTransaction:(NSObject *)a4 severityOut:(uint64_t)a5 error:
{
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = self;
  if (!v8)
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:sel__severityForConceptWithIdentifier_ontologyTransaction_severityOut_error_, v10, @"HDDrugInteractionEngine.m", 898, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  id v29 = 0;
  char v11 = +[HDDrugInteractionEngine _severityConceptForConceptWithIdentifier:ontologyTransaction:severityConceptOut:error:]((uint64_t)HDDrugInteractionEngine, v8, v9, &v29, a5);
  id v12 = v29;
  id v13 = v12;
  if ((v11 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v17 = HKLogMedication();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[HDDrugInteractionEngine _severityForConceptWithIdentifier:ontologyTransaction:severityOut:error:]();
    }
    goto LABEL_11;
  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 1003, @"Could not find severity concept with identifier: %@", v8);
    _HKInitializeLogging();
    uint64_t v17 = HKLogMedication();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[HDDrugInteractionEngine _severityForConceptWithIdentifier:ontologyTransaction:severityOut:error:]();
    }
    goto LABEL_11;
  }
  uint64_t v14 = [v12 identifier];
  uint64_t v15 = [v14 rawIdentifier];

  if (v15 != 650)
  {
    uint64_t v19 = [v13 identifier];
    uint64_t v20 = [v19 rawIdentifier];

    if (v20 == 651)
    {
      uint64_t v16 = 2;
      goto LABEL_18;
    }
    id v21 = [v13 identifier];
    uint64_t v22 = [v21 rawIdentifier];

    if (v22 == 652)
    {
      uint64_t v16 = 3;
      goto LABEL_18;
    }
    int v23 = [v13 identifier];
    uint64_t v24 = [v23 rawIdentifier];

    if (v24 == 653)
    {
      uint64_t v16 = 4;
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 1003, @"Could not determine correct severity type for severity concept with identifier: %@", v8);
    _HKInitializeLogging();
    uint64_t v17 = HKLogMedication();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[HDDrugInteractionEngine _severityForConceptWithIdentifier:ontologyTransaction:severityOut:error:]();
    }
LABEL_11:
    uint64_t v18 = 0;
    goto LABEL_21;
  }
  uint64_t v16 = 1;
LABEL_18:
  id v25 = objc_alloc(MEMORY[0x1E4F66AD0]);
  id v26 = [v13 validInRegions];
  uint64_t v17 = [v25 initWithSeverityLevel:v16 validRegionCodes:v26];

  if (a4)
  {
    uint64_t v17 = v17;
    *a4 = v17;
  }
  uint64_t v18 = 1;
LABEL_21:

  return v18;
}

+ (NSObject)_interactionClassConceptsForConcept:(void *)a3 ontologyTransaction:(void *)a4 error:
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v49 = a3;
  uint64_t v6 = self;
  if (!v5)
  {
    long long v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:sel__interactionClassConceptsForConcept_ontologyTransaction_error_, v6, @"HDDrugInteractionEngine.m", 944, @"Invalid parameter not satisfying: %@", @"startingConcept != nil" object file lineNumber description];
  }
  id v7 = v5;
  uint64_t v8 = [v7 relationships];
  if (v8
    && (id v9 = (void *)v8,
        [v7 relationships],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 count],
        v10,
        v9,
        v11))
  {
    id v51 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v12 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F17FC648];
    unint64_t v13 = 0x1E4F1C000uLL;
    uint64_t v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v14 addObject:v7];
    unint64_t v50 = v14;
    if ([v14 count])
    {
      unint64_t v15 = 0;
      id v46 = v7;
      do
      {
        unint64_t v43 = v15;
        uint64_t v16 = v50;
        id v17 = [v50 copy];
        unint64_t v50 = objc_alloc_init(*(Class *)(v13 + 2632));

        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v18 = v17;
        uint64_t v44 = [v18 countByEnumeratingWithState:&v56 objects:v61 count:16];
        if (v44)
        {
          uint64_t v19 = *(void *)v57;
          id v47 = v18;
          uint64_t v42 = *(void *)v57;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v57 != v19) {
                objc_enumerationMutation(v18);
              }
              uint64_t v45 = v20;
              id v21 = *(void **)(*((void *)&v56 + 1) + 8 * v20);
              long long v52 = 0u;
              long long v53 = 0u;
              long long v54 = 0u;
              long long v55 = 0u;
              uint64_t v22 = [v21 relationships];
              uint64_t v23 = [v22 countByEnumeratingWithState:&v52 objects:v60 count:16];
              if (v23)
              {
                uint64_t v24 = v23;
                uint64_t v25 = *(void *)v53;
                while (2)
                {
                  for (uint64_t i = 0; i != v24; ++i)
                  {
                    if (*(void *)v53 != v25) {
                      objc_enumerationMutation(v22);
                    }
                    uint64_t v27 = *(void **)(*((void *)&v52 + 1) + 8 * i);
                    uint64_t v28 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v27, "type"));
                    int v29 = [v12 containsObject:v28];

                    if (v29)
                    {
                      uint64_t v30 = [v27 destination];
                      if (([v30 relationshipsAreLoaded] & 1) == 0)
                      {
                        uint64_t v31 = [v30 identifier];
                        uint64_t v32 = +[HDDrugInteractionEngine _fetchKnownConceptWithIdentifier:ontologyTransaction:errorOut:]((uint64_t)HDDrugInteractionEngine, v31, v49, a4);

                        uint64_t v30 = (void *)v32;
                        if (!v32)
                        {
                          _HKInitializeLogging();
                          long long v39 = HKLogMedication();
                          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                            +[HDDrugInteractionEngine _interactionClassConceptsForConcept:ontologyTransaction:error:]();
                          }

                          id v35 = 0;
                          id v7 = v46;
                          goto LABEL_40;
                        }
                      }
                      if ([v27 type] == 996) {
                        uint64_t v33 = v51;
                      }
                      else {
                        uint64_t v33 = v50;
                      }
                      [v33 addObject:v30];
                    }
                  }
                  uint64_t v24 = [v22 countByEnumeratingWithState:&v52 objects:v60 count:16];
                  if (v24) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v20 = v45 + 1;
              unint64_t v13 = 0x1E4F1C000;
              id v18 = v47;
              uint64_t v19 = v42;
            }
            while (v45 + 1 != v44);
            uint64_t v44 = [v47 countByEnumeratingWithState:&v56 objects:v61 count:16];
          }
          while (v44);
        }

        if ([v50 count]) {
          BOOL v34 = v43 >= 6;
        }
        else {
          BOOL v34 = 1;
        }
        unint64_t v15 = v43 + 1;
        id v7 = v46;
      }
      while (!v34);
    }
    id v35 = v51;
LABEL_40:
  }
  else
  {
    long long v36 = (void *)MEMORY[0x1E4F28C58];
    long long v37 = [v7 identifier];
    long long v38 = [v7 identifier];
    objc_msgSend(v36, "hk_assignError:code:format:", a4, 1003, @"Could not find any relationships for concept: %@ with starting concept: %@", v37, v38);

    _HKInitializeLogging();
    id v51 = HKLogMedication();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      +[HDDrugInteractionEngine _interactionClassConceptsForConcept:ontologyTransaction:error:](v6, v7);
    }
    id v35 = 0;
  }

  return v35;
}

BOOL __60__HDDrugInteractionEngine__allAreOntologyBackedMedications___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 firstOntologyCoding];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (void)interactionClassesForMedication:profile:error:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_1(&dword_1BD54A000, v6, v4, "[%{public}@] Could not get interaction classes for medication: %{public}@", v5);
}

+ (void)interactionClassForLifestyleFactor:profile:interactionClassOut:error:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_1(&dword_1BD54A000, v6, v4, "[%{public}@] Could not get interaction class for lifestyle factor: %{public}@", v5);
}

+ (void)numberOfInteractionsForConceptWithIdentifier:profile:error:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_1(&dword_1BD54A000, v6, v4, "[%{public}@] Could not get number of interactions for concept with identifier: %{public}@", v5);
}

+ (void)_interactionResultForFirstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 destination];
  uint64_t v3 = [v2 identifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1(&dword_1BD54A000, v0, v4, "[%{public}@] Could not load drug interaction result for interaction with identifier: %{public}@", v5);
}

+ (void)_interactionResultForFirstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 identifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1(&dword_1BD54A000, v0, v3, "[%{public}@] Could not load drug relationships for 2nd drug interaction class with identifier: %{public}@", v4);
}

+ (void)_interactionResultForFirstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 identifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1(&dword_1BD54A000, v0, v3, "[%{public}@] Could not load relationships for 1st drug interaction class with identifier: %{public}@", v4);
}

+ (void)_interactionClassConceptsForConceptWithIdentifier:ontologyTransaction:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Found no concept in ontology for concept identifier: %{public}@");
}

+ (void)_interactionClassConceptsForConceptWithIdentifier:ontologyTransaction:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Could not get interaction class for identifier: %{public}@");
}

+ (void)_interactionClassForLifestyleFactorConceptIdentifier:ontologyTransaction:interactionClassOut:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Could not get interaction class for lifestyle factor concept identifier: %{public}@");
}

+ (void)_drugInteractionClassWithRelationshipsFromClass:(uint64_t)a1 ontologyTransaction:(void *)a2 drugInteractionClassOut:error:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 identifier];
  uint64_t v3 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1BD54A000, v4, v5, "[%{public}@] Could not get interaction class concept for identifier: %{public}@, interaction class: %@", v6, v7, v8, v9, v10);
}

+ (void)_drugInteractionResultForConceptWithIdentifier:firstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Could not load interaction concept for drug interaction with identifier: %{public}@");
}

+ (void)_drugInteractionResultForConceptWithIdentifier:firstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Could not load localized education concept for drug interaction with identifier: %{public}@");
}

+ (void)_drugInteractionResultForConceptWithIdentifier:firstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Could not load severity concept for drug interaction with identifier: %{public}@");
}

+ (void)_conceptForIdentifier:ontologyTransaction:conceptOut:errorOut:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Could not find concept in ontology database for concept with identifier: %{public}@");
}

+ (void)_severityForConceptWithIdentifier:ontologyTransaction:severityOut:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Could not find severity concept with identifier: %{public}@");
}

+ (void)_severityForConceptWithIdentifier:ontologyTransaction:severityOut:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Could not determine correct severity type for severity concept with identifier: %{public}@");
}

+ (void)_severityForConceptWithIdentifier:ontologyTransaction:severityOut:error:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Could not load concept with identifier: %{public}@");
}

+ (void)_interactionClassConceptsForConcept:(uint64_t)a1 ontologyTransaction:(void *)a2 error:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [a2 identifier];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1BD54A000, v5, v6, "[%{public}@] Could not find any relationships for concept: %{public}@ with starting concept: %{public}@", v7, v8, v9, v10, v11);
}

+ (void)_interactionClassConceptsForConcept:ontologyTransaction:error:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  [v0 type];
  uint64_t v7 = [0 identifier];
  OUTLINED_FUNCTION_5(&dword_1BD54A000, v1, v2, "[%{public}@] Could not load destination of relationship type %lld for concept with identifier: %{public}@", v3, v4, v5, v6, 2u);
}

@end