@interface HDHealthRecordConstructClinicalRecordsTask
- (BOOL)_applyReferenceRulesToClinicalItem:(id)a3 ruleset:(id)a4 error:(id *)a5;
- (BOOL)_isEligibleClinicalItem:(id)a3 error:(id *)a4;
- (BOOL)processWithError:(id *)a3;
- (HDHealthRecordConstructClinicalRecordsTask)init;
- (HDHealthRecordConstructClinicalRecordsTask)initWithProcessingContext:(id)a3;
- (id)_clinicalRecordWithClinicalItem:(id)a3 resourceObject:(id)a4 error:(id *)a5;
@end

@implementation HDHealthRecordConstructClinicalRecordsTask

- (HDHealthRecordConstructClinicalRecordsTask)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDHealthRecordConstructClinicalRecordsTask)initWithProcessingContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDHealthRecordConstructClinicalRecordsTask;
  v6 = [(HDHealthRecordConstructClinicalRecordsTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_processingContext, a3);
  }

  return v7;
}

- (BOOL)processWithError:(id *)a3
{
  id v5 = [(HDHealthRecordProcessingContext *)self->_processingContext extractionRuleset];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__HDHealthRecordConstructClinicalRecordsTask_processWithError___block_invoke;
  v8[3] = &unk_264BD9918;
  id v9 = v5;
  SEL v10 = a2;
  v8[4] = self;
  id v6 = v5;
  +[HDHealthRecordClinicalType enumerateClinicalTypesUsingBlock:v8];

  return 1;
}

void __63__HDHealthRecordConstructClinicalRecordsTask_processWithError___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v3 = [*(id *)(a1[4] + 8) extractedClinicalItemsForClinicalType:a2];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v42;
    v34 = &v46;
    v7 = (os_log_t *)MEMORY[0x263F09908];
    v35 = v3;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v41 + 1) + 8 * v8);
        SEL v10 = (void *)a1[4];
        id v40 = 0;
        char v11 = objc_msgSend(v10, "_isEligibleClinicalItem:error:", v9, &v40, v34);
        id v12 = v40;
        v13 = v12;
        if (v11)
        {
          uint64_t v14 = v5;
          v15 = [v9 extractedMedicalRecord];
          if (!v15)
          {
            v33 = [MEMORY[0x263F08690] currentHandler];
            [v33 handleFailureInMethod:a1[6] object:a1[4] file:@"HDHealthRecordConstructClinicalRecordsTask.m" lineNumber:59 description:@"Eligible clinical items for clinical records must have a medical record"];
          }
          v16 = (void *)a1[4];
          uint64_t v17 = a1[5];
          id v39 = v13;
          char v18 = [v16 _applyReferenceRulesToClinicalItem:v9 ruleset:v17 error:&v39];
          id v19 = v39;

          if (v18)
          {
            v20 = [v9 APIResource];
            if (v20)
            {
              v21 = (void *)a1[4];
              id v38 = 0;
              v22 = [v21 _clinicalRecordWithClinicalItem:v9 resourceObject:v20 error:&v38];
              id v23 = v38;
              v36 = v23;
              if (v22)
              {
                v24 = *(void **)(a1[4] + 8);
                id v37 = 0;
                char v25 = [v24 didProcessClinicalRecord:v22 forMedicalRecord:v15 error:&v37];
                id v26 = v37;
                if ((v25 & 1) == 0)
                {
                  _HKInitializeLogging();
                  v27 = *MEMORY[0x263F09908];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    id v50 = v26;
                    _os_log_error_impl(&dword_232E63000, v27, OS_LOG_TYPE_ERROR, "[ConstructClinicalRecordsTask] Failed to mark clinical record sample as processed: %{public}@", buf, 0xCu);
                  }
                }

                v3 = v35;
              }
              else if (v23)
              {
                _HKInitializeLogging();
                v32 = *MEMORY[0x263F09908];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  id v50 = v36;
                  _os_log_error_impl(&dword_232E63000, v32, OS_LOG_TYPE_ERROR, "[ConstructClinicalRecordsTask] Unable to create clinical record sample: %{public}@", buf, 0xCu);
                }
              }
            }
            else
            {
              _HKInitializeLogging();
              v31 = (void *)*MEMORY[0x263F09908];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEBUG)) {
                __63__HDHealthRecordConstructClinicalRecordsTask_processWithError___block_invoke_cold_1(&v45, v31, (uint64_t)v9, v34);
              }
            }
          }
          else
          {
            _HKInitializeLogging();
            v30 = *MEMORY[0x263F09908];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v50 = v19;
              _os_log_error_impl(&dword_232E63000, v30, OS_LOG_TYPE_ERROR, "[ConstructClinicalRecordsTask] Error applying reference rules to clinical item: %{public}@", buf, 0xCu);
            }
          }

          uint64_t v5 = v14;
        }
        else
        {
          if (v12)
          {
            _HKInitializeLogging();
            v28 = *v7;
            if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v50 = v13;
              _os_log_error_impl(&dword_232E63000, v28, OS_LOG_TYPE_ERROR, "[ConstructClinicalRecordsTask] Error getting eligibility info from clinical item: %{public}@", buf, 0xCu);
            }
          }
          _HKInitializeLogging();
          os_log_t v29 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG)) {
            __63__HDHealthRecordConstructClinicalRecordsTask_processWithError___block_invoke_cold_2(&v47, v29, (uint64_t)v9, &v48);
          }
          id v19 = v13;
        }

        ++v8;
        v7 = (os_log_t *)MEMORY[0x263F09908];
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v5);
  }
}

- (BOOL)_isEligibleClinicalItem:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = [v4 extractedMedicalRecord];

  if (!v5)
  {
    _HKInitializeLogging();
    id v12 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      -[HDHealthRecordConstructClinicalRecordsTask _isEligibleClinicalItem:error:](v12);
    }
    goto LABEL_7;
  }
  uint64_t v6 = [v4 extractedMedicalRecord];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    || ([v4 extractedMedicalRecord],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 enteredInError],
        v8,
        (v9 & 1) != 0))
  {
LABEL_7:
    BOOL v11 = 0;
    goto LABEL_8;
  }
  SEL v10 = [v4 extractedMedicalRecord];
  BOOL v11 = [v10 state] != 1;

LABEL_8:
  return v11;
}

- (BOOL)_applyReferenceRulesToClinicalItem:(id)a3 ruleset:(id)a4 error:(id *)a5
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v57 = a4;
  uint64_t v8 = objc_msgSend(v57, "rulesetForClinicalType:", objc_msgSend(v7, "type"));
  v58 = v8;
  if (v8)
  {
    char v9 = [v8 APIReferenceRules];
    uint64_t v10 = [v9 count];

    BOOL v11 = [v7 representedResource];
    id v12 = v11;
    if (v10)
    {
      v13 = +[HDFHIRReferenceProcessor resourcesContainedInResource:v11 error:a5];
      v56 = v12;
      if (v13)
      {
        v54 = a5;
        v55 = v7;
        v87[0] = MEMORY[0x263EF8330];
        v87[1] = 3221225472;
        v87[2] = __95__HDHealthRecordConstructClinicalRecordsTask__applyReferenceRulesToClinicalItem_ruleset_error___block_invoke;
        v87[3] = &unk_264BD9940;
        id v61 = v12;
        id v88 = v61;
        v53 = v13;
        v67 = objc_msgSend(v13, "hk_map:", v87);
        id v71 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        id v72 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        obuint64_t j = [v58 APIReferenceRules];
        uint64_t v62 = [obj countByEnumeratingWithState:&v83 objects:v96 count:16];
        if (v62)
        {
          uint64_t v60 = *(void *)v84;
          do
          {
            for (uint64_t i = 0; i != v62; ++i)
            {
              if (*(void *)v84 != v60) {
                objc_enumerationMutation(obj);
              }
              v15 = *(void **)(*((void *)&v83 + 1) + 8 * i);
              [v15 appliesTo];
              v73 = v15;
              v16 = [v15 keyPath];
              uint64_t v17 = [v61 JSONObject];
              id v82 = 0;
              char v18 = +[HDFHIRReferenceProcessor referencesAtKeyPath:v16 resourceDictionary:v17 error:&v82];
              id v19 = v82;

              if (v18)
              {
                id v63 = v19;
                v64 = v18;
                uint64_t v65 = i;
                long long v80 = 0u;
                long long v81 = 0u;
                long long v78 = 0u;
                long long v79 = 0u;
                id v66 = v18;
                uint64_t v69 = [v66 countByEnumeratingWithState:&v78 objects:v91 count:16];
                if (v69)
                {
                  uint64_t v68 = *(void *)v79;
                  do
                  {
                    uint64_t v20 = 0;
                    do
                    {
                      if (*(void *)v79 != v68) {
                        objc_enumerationMutation(v66);
                      }
                      uint64_t v70 = v20;
                      uint64_t v21 = *(void *)(*((void *)&v78 + 1) + 8 * v20);
                      long long v74 = 0u;
                      long long v75 = 0u;
                      long long v76 = 0u;
                      long long v77 = 0u;
                      id v22 = v67;
                      uint64_t v23 = [v22 countByEnumeratingWithState:&v74 objects:v90 count:16];
                      if (v23)
                      {
                        uint64_t v24 = v23;
                        uint64_t v25 = *(void *)v75;
                        do
                        {
                          for (uint64_t j = 0; j != v24; ++j)
                          {
                            if (*(void *)v75 != v25) {
                              objc_enumerationMutation(v22);
                            }
                            v27 = *(void **)(*((void *)&v74 + 1) + 8 * j);
                            v28 = [v27 identifier];
                            if (+[HDFHIRReferenceProcessor reference:v21 matchesIdentifier:v28])
                            {
                              os_log_t v29 = [v73 disallowedResourceTypes];
                              v30 = [v28 resourceType];
                              char v31 = [v29 containsObject:v30];

                              v32 = v72;
                              if (v31) {
                                goto LABEL_24;
                              }
                              v33 = [v73 allowedResourceTypes];
                              v34 = [v28 resourceType];
                              char v35 = [v33 containsObject:v34];

                              v32 = v71;
                              if ((v35 & 1) != 0
                                || ([v73 allowedResourceTypes],
                                    v36 = objc_claimAutoreleasedReturnValue(),
                                    int v37 = [v36 containsObject:@"Any"],
                                    v36,
                                    v32 = v71,
                                    v37))
                              {
LABEL_24:
                                [v32 addObject:v27];
                              }
                            }
                          }
                          uint64_t v24 = [v22 countByEnumeratingWithState:&v74 objects:v90 count:16];
                        }
                        while (v24);
                      }

                      uint64_t v20 = v70 + 1;
                    }
                    while (v70 + 1 != v69);
                    uint64_t v69 = [v66 countByEnumeratingWithState:&v78 objects:v91 count:16];
                  }
                  while (v69);
                }

                char v18 = v64;
                uint64_t i = v65;
                id v19 = v63;
              }
              else
              {
                _HKInitializeLogging();
                id v38 = (void *)*MEMORY[0x263F09908];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
                {
                  id v39 = v38;
                  id v40 = [v15 keyPath];
                  long long v41 = HKSensitiveLogItem();
                  *(_DWORD *)buf = 138543618;
                  v93 = v40;
                  __int16 v94 = 2114;
                  v95 = v41;
                  _os_log_error_impl(&dword_232E63000, v39, OS_LOG_TYPE_ERROR, "[ConstructClinicalRecordsTask] Error parsing reference(s) at «%{public}@»: %{public}@. Skipping.", buf, 0x16u);
                }
              }
            }
            uint64_t v62 = [obj countByEnumeratingWithState:&v83 objects:v96 count:16];
          }
          while (v62);
        }

        [v71 minusSet:v72];
        long long v42 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"identifier.stringValue" ascending:1];
        v89 = v42;
        long long v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v89 count:1];
        long long v44 = [v71 sortedArrayUsingDescriptors:v43];
        int v45 = objc_msgSend(v44, "hk_map:", &__block_literal_global_0);

        id v46 = +[HDFHIRReferenceProcessor newResourceFromResource:v61 containingOnlyResources:v45 error:v54];
        BOOL v47 = v46 != 0;
        if (v46) {
          [v55 setAPIResource:v46];
        }

        id v7 = v55;
        v13 = v53;
      }
      else
      {
        BOOL v47 = 0;
      }
    }
    else
    {
      id v50 = v11;
      v51 = (void *)[v11 copy];
      [v7 setAPIResource:v51];

      BOOL v47 = 1;
    }
  }
  else
  {
    uint64_t v48 = [MEMORY[0x263F45C20] extractionFailureRecordWithCode:3 propertyName:0 resourceKeyPath:0];
    id v49 = objc_alloc_init(MEMORY[0x263F45C18]);
    [v49 addFailureRecord:v48];
    [v7 setMedicalRecordPropertyValue:v49 forKey:*MEMORY[0x263F45B40]];

    BOOL v47 = 0;
  }

  return v47;
}

id __95__HDHealthRecordConstructClinicalRecordsTask__applyReferenceRulesToClinicalItem_ruleset_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F45C10];
  v3 = (id *)(a1 + 32);
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 FHIRVersion];
  id v7 = [*v3 receivedDate];
  id v13 = 0;
  uint64_t v8 = [v2 resourceObjectWithJSONObject:v5 sourceURL:0 FHIRVersion:v6 receivedDate:v7 extractionHints:0 error:&v13];

  id v9 = v13;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    _HKInitializeLogging();
    BOOL v11 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      __95__HDHealthRecordConstructClinicalRecordsTask__applyReferenceRulesToClinicalItem_ruleset_error___block_invoke_cold_1((uint64_t *)v3, v11);
    }
  }

  return v8;
}

uint64_t __95__HDHealthRecordConstructClinicalRecordsTask__applyReferenceRulesToClinicalItem_ruleset_error___block_invoke_301(uint64_t a1, void *a2)
{
  return [a2 JSONObject];
}

- (id)_clinicalRecordWithClinicalItem:(id)a3 resourceObject:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 correspondingClinicalTypeWithError:a5];
  if (v9)
  {
    id v10 = [v8 identifier];
    id v11 = objc_alloc(MEMORY[0x263F0A370]);
    id v12 = [v10 resourceType];
    id v13 = [v10 identifier];
    uint64_t v14 = [v8 FHIRVersion];
    [v8 data];
    v15 = v27 = v7;
    v16 = [v8 sourceURL];
    uint64_t v17 = [v8 receivedDate];
    char v18 = (void *)[v11 initWithResourceType:v12 identifier:v13 FHIRVersion:v14 data:v15 sourceURL:v16 lastUpdatedDate:v17];

    id v19 = [v8 receivedDate];
    uint64_t v20 = (void *)MEMORY[0x263F0A1A0];
    uint64_t v21 = [MEMORY[0x263F0A2D8] localDevice];
    id v22 = [v10 stringValue];
    uint64_t v23 = [v20 clinicalRecordWithType:v9 startDate:v19 endDate:v19 device:v21 metadata:0 displayName:v22 FHIRResource:v18];

    id v7 = v27;
    uint64_t v24 = [v27 representedResource];
    uint64_t v25 = [v24 firstSeenDate];
    [v23 _setCreationDate:v25];
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

- (void).cxx_destruct
{
}

void __63__HDHealthRecordConstructClinicalRecordsTask_processWithError___block_invoke_cold_1(_DWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = HKSensitiveLogItem();
  *a1 = 138412290;
  *a4 = v7;
  OUTLINED_FUNCTION_0_0(&dword_232E63000, v8, v9, "[ConstructClinicalRecordsTask] No APIResource on clinical item %@, not creating clinical record");
}

void __63__HDHealthRecordConstructClinicalRecordsTask_processWithError___block_invoke_cold_2(_DWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = HKSensitiveLogItem();
  *a1 = 138412290;
  *a4 = v7;
  OUTLINED_FUNCTION_0_0(&dword_232E63000, v8, v9, "[ConstructClinicalRecordsTask] Item is not eligible for clinical record creation: %@");
}

- (void)_isEligibleClinicalItem:(void *)a1 error:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v1 = a1;
  v2 = HKSensitiveLogItem();
  int v3 = 138412290;
  id v4 = v2;
  _os_log_error_impl(&dword_232E63000, v1, OS_LOG_TYPE_ERROR, "Clinical item %@ did not produce a medical record, not eligible for clinical record creation", (uint8_t *)&v3, 0xCu);
}

void __95__HDHealthRecordConstructClinicalRecordsTask__applyReferenceRulesToClinicalItem_ruleset_error___block_invoke_cold_1(uint64_t *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = a2;
  id v4 = HKSensitiveLogItem();
  int v5 = 138543618;
  uint64_t v6 = v2;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_232E63000, v3, OS_LOG_TYPE_ERROR, "[ConstructClinicalRecordsTask] Failed to create object from resource contained in %{public}@: %{public}@", (uint8_t *)&v5, 0x16u);
}

@end