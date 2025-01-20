@interface HDHealthRecordConstructMedicalRecordsTask
+ (BOOL)_extractKeyPathsWithClinicalItem:(id)a3 ruleset:(id)a4;
+ (BOOL)_unresolvableReferencesPresentInClinicalItem:(id)a3;
+ (BOOL)_unsupportedModifierExtensionsPresentInClinicalItem:(id)a3;
- (BOOL)_collectMedicalRecordPropertiesWithError:(id *)a3;
- (HDHealthRecordConstructMedicalRecordsTask)initWithProcessingContext:(id)a3;
- (id)_medicalRecordWithClinicalItem:(id)a3 clinicalType:(int64_t)a4 ruleset:(id)a5 error:(id *)a6;
- (id)_unknownMedicalRecordWithClinicalItem:(id)a3 ruleset:(id)a4 error:(id *)a5;
@end

@implementation HDHealthRecordConstructMedicalRecordsTask

- (HDHealthRecordConstructMedicalRecordsTask)initWithProcessingContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDHealthRecordConstructMedicalRecordsTask;
  v6 = [(HDHealthRecordConstructMedicalRecordsTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_processingContext, a3);
  }

  return v7;
}

- (BOOL)_collectMedicalRecordPropertiesWithError:(id *)a3
{
  id v5 = [(HDHealthRecordProcessingContext *)self->_processingContext extractionRuleset];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  id v20 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86__HDHealthRecordConstructMedicalRecordsTask__collectMedicalRecordPropertiesWithError___block_invoke;
  v11[3] = &unk_264BD99D8;
  v11[4] = self;
  id v6 = v5;
  id v12 = v6;
  v13 = &v15;
  v14 = &v21;
  +[HDHealthRecordClinicalType enumerateClinicalTypesUsingBlock:v11];
  int v7 = *((unsigned __int8 *)v22 + 24);
  if (!*((unsigned char *)v22 + 24))
  {
    id v8 = (id)v16[5];
    objc_super v9 = v8;
    if (v8)
    {
      if (a3) {
        *a3 = v8;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v7 != 0;
}

void __86__HDHealthRecordConstructMedicalRecordsTask__collectMedicalRecordPropertiesWithError___block_invoke(void *a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = [*(id *)(a1[4] + 8) extractedClinicalItemsForClinicalType:a2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v6) {
    goto LABEL_20;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v26;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v26 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      if ([(id)objc_opt_class() _extractKeyPathsWithClinicalItem:v10 ruleset:a1[5]])
      {
        v11 = (void *)a1[4];
        uint64_t v12 = a1[5];
        v13 = (id *)(*(void *)(a1[6] + 8) + 40);
        id obj = 0;
        v14 = [v11 _medicalRecordWithClinicalItem:v10 clinicalType:a2 ruleset:v12 error:&obj];
        objc_storeStrong(v13, obj);
        if (([v14 enteredInError] & 1) == 0
          && (([(id)objc_opt_class() _unsupportedModifierExtensionsPresentInClinicalItem:v10] & 1) != 0
           || [(id)objc_opt_class() _unresolvableReferencesPresentInClinicalItem:v10]))
        {
        }
        else if (v14)
        {
          goto LABEL_13;
        }
      }
      uint64_t v15 = (void *)a1[4];
      uint64_t v16 = a1[5];
      uint64_t v17 = (id *)(*(void *)(a1[6] + 8) + 40);
      id v23 = 0;
      v14 = [v15 _unknownMedicalRecordWithClinicalItem:v10 ruleset:v16 error:&v23];
      objc_storeStrong(v17, v23);
      if (!v14)
      {
        *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
        goto LABEL_19;
      }
LABEL_13:
      [v10 assignExtractedMedicalRecord:v14];
      v18 = *(void **)(a1[4] + 8);
      v19 = [v10 representedResource];
      uint64_t v20 = *(void *)(a1[6] + 8);
      id v22 = *(id *)(v20 + 40);
      LOBYTE(v18) = [v18 didProcessMedicalRecord:v14 forResource:v19 error:&v22];
      objc_storeStrong((id *)(v20 + 40), v22);

      if ((v18 & 1) == 0)
      {
        *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;

LABEL_19:
        *a3 = 1;
        goto LABEL_20;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_20:
}

+ (BOOL)_unsupportedModifierExtensionsPresentInClinicalItem:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 representedResource];

  if (v5)
  {
    uint64_t v6 = [HDFHIRExtensionProcessor alloc];
    uint64_t v7 = [v4 representedResource];
    uint64_t v8 = [(HDFHIRExtensionProcessor *)v6 initWithResource:v7];

    id v38 = 0;
    objc_super v9 = [(HDFHIRExtensionProcessor *)v8 findUnsupportedModifierExtensions:&v38];
    id v10 = v38;
    if (v9)
    {
      if ([v9 count])
      {
        uint64_t v29 = *MEMORY[0x263F45B40];
        v11 = [v4 medicalRecordPropertyValueForKey:*MEMORY[0x263F45B40] expectedClass:objc_opt_class() isArray:0 error:0];
        uint64_t v12 = v11;
        v32 = v4;
        id v31 = v10;
        if (v11) {
          id v13 = v11;
        }
        else {
          id v13 = objc_alloc_init(MEMORY[0x263F45C18]);
        }
        uint64_t v17 = v13;

        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        uint64_t v30 = v9;
        id obj = v9;
        uint64_t v18 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v35 != v20) {
                objc_enumerationMutation(obj);
              }
              id v22 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              id v23 = [v22 keyPath];
              char v24 = [v22 extensionElement];
              long long v25 = [v24 URI];
              long long v26 = [v23 stringByAppendingFormat:@".%@", v25];

              long long v27 = [MEMORY[0x263F45C20] extractionFailureRecordWithCode:2 propertyName:0 resourceKeyPath:v26];
              [v17 addFailureRecord:v27];
            }
            uint64_t v19 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
          }
          while (v19);
        }

        id v4 = v32;
        [v32 setMedicalRecordPropertyValue:v17 forKey:v29];

        BOOL v15 = 1;
        id v10 = v31;
        objc_super v9 = v30;
        goto LABEL_21;
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v16 = (void *)*MEMORY[0x263F09908];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
        +[HDHealthRecordConstructMedicalRecordsTask _unsupportedModifierExtensionsPresentInClinicalItem:](v16, a1);
      }
    }
    BOOL v15 = 0;
LABEL_21:

    goto LABEL_22;
  }
  _HKInitializeLogging();
  v14 = (void *)*MEMORY[0x263F09908];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
    +[HDHealthRecordConstructMedicalRecordsTask _unsupportedModifierExtensionsPresentInClinicalItem:](v14, a1);
  }
  BOOL v15 = 0;
LABEL_22:

  return v15;
}

+ (BOOL)_unresolvableReferencesPresentInClinicalItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 representedResource];

  if (!v5)
  {
    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      +[HDHealthRecordConstructMedicalRecordsTask _unsupportedModifierExtensionsPresentInClinicalItem:](v14, a1);
    }
    goto LABEL_8;
  }
  uint64_t v6 = [v4 representedResource];
  char v7 = [v6 extractionHints];

  if ((v7 & 2) == 0)
  {
    uint64_t v8 = [v4 representedResource];
    char v9 = [v8 extractionHints];

    if ((v9 & 1) == 0)
    {
LABEL_8:
      BOOL v15 = 0;
      goto LABEL_11;
    }
  }
  uint64_t v10 = *MEMORY[0x263F45B40];
  v11 = [v4 medicalRecordPropertyValueForKey:*MEMORY[0x263F45B40] expectedClass:objc_opt_class() isArray:0 error:0];
  uint64_t v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = objc_alloc_init(MEMORY[0x263F45C18]);
  }
  uint64_t v16 = v13;

  uint64_t v17 = [MEMORY[0x263F45C20] extractionFailureRecordWithCode:7 propertyName:0 resourceKeyPath:0];
  [v16 addFailureRecord:v17];
  [v4 setMedicalRecordPropertyValue:v16 forKey:v10];

  BOOL v15 = 1;
LABEL_11:

  return v15;
}

+ (BOOL)_extractKeyPathsWithClinicalItem:(id)a3 ruleset:(id)a4
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v52 = a4;
  uint64_t v8 = objc_msgSend(v52, "rulesetForClinicalType:", objc_msgSend(v7, "type"));
  if (v8)
  {
    SEL v50 = a2;
    id v51 = a1;
    id v9 = objc_alloc_init(MEMORY[0x263F45C18]);
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    uint64_t v10 = [v8 medicalRecordProperties];
    v11 = [v10 allKeys];

    id obj = v11;
    id v60 = v7;
    uint64_t v56 = [v11 countByEnumeratingWithState:&v67 objects:v74 count:16];
    if (v56)
    {
      uint64_t v55 = *(void *)v68;
      v54 = v8;
      do
      {
        for (uint64_t i = 0; i != v56; ++i)
        {
          if (*(void *)v68 != v55) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v67 + 1) + 8 * i);
          v14 = [v8 medicalRecordProperties];
          uint64_t v61 = v13;
          BOOL v15 = [v14 objectForKeyedSubscript:v13];

          if (v15)
          {
            uint64_t v58 = i;
            uint64_t v16 = v9;
            id v59 = objc_alloc_init(MEMORY[0x263EFF980]);
            long long v63 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            v57 = v15;
            id v17 = v15;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v63 objects:v73 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v64;
              do
              {
                for (uint64_t j = 0; j != v19; ++j)
                {
                  if (*(void *)v64 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  uint64_t v22 = *(void *)(*((void *)&v63 + 1) + 8 * j);
                  id v23 = (void *)MEMORY[0x237DB67E0]();
                  id v62 = 0;
                  char v24 = [v7 candidateValueForKeyPath:v22 error:&v62];
                  id v25 = v62;
                  long long v26 = v25;
                  if (v24) {
                    BOOL v27 = 1;
                  }
                  else {
                    BOOL v27 = v25 == 0;
                  }
                  if (v27)
                  {
                    if (v24) {
                      [v59 addObject:v24];
                    }
                  }
                  else
                  {
                    _HKInitializeLogging();
                    long long v28 = *MEMORY[0x263F09908];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543362;
                      v72 = v26;
                      _os_log_error_impl(&dword_232E63000, v28, OS_LOG_TYPE_ERROR, "ConstructMedicalRecordsTask keypath extraction error %{public}@", buf, 0xCu);
                    }
                    uint64_t v30 = [MEMORY[0x263F45C20] extractionFailureRecordWithCode:4 propertyName:v61 resourceKeyPath:v22];
                    [v16 addFailureRecord:v30];

                    id v7 = v60;
                  }
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v63 objects:v73 count:16];
              }
              while (v19);
            }

            id v9 = v16;
            if ((unint64_t)[v59 count] >= 2)
            {
              id v31 = [MEMORY[0x263F45C20] extractionFailureRecordWithCode:5 propertyName:v61 resourceKeyPath:0];
              [v16 addFailureRecord:v31];
            }
            v32 = [v16 failureRecords];
            uint64_t v33 = [v32 count];

            uint64_t v8 = v54;
            if (!v33)
            {
              long long v34 = [v59 firstObject];
              [v7 setMedicalRecordPropertyValue:v34 forKey:v61];
            }
            BOOL v15 = v57;
            uint64_t i = v58;
          }
        }
        uint64_t v56 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
      }
      while (v56);
    }

    long long v35 = [v9 failureRecords];
    uint64_t v36 = [v35 count];
    BOOL v37 = v36 == 0;

    if (v36)
    {
      uint64_t v38 = *MEMORY[0x263F45B40];
      v39 = [v7 medicalRecordPropertyValueForKey:*MEMORY[0x263F45B40] expectedClass:objc_opt_class() isArray:0 error:0];

      if (v39)
      {
        v47 = [MEMORY[0x263F08690] currentHandler];
        v48 = [v51 debugDescription];
        v49 = [v7 medicalRecordPropertyValueForKey:v38 expectedClass:objc_opt_class() isArray:0 error:0];
        [v47 handleFailureInMethod:v50, v51, @"HDHealthRecordConstructMedicalRecordsTask.m", 206, @"%@ trying to extract keypaths from a clinical item with existing extraction failures %@", v48, v49 object file lineNumber description];

        id v7 = v60;
      }
      [v7 setMedicalRecordPropertyValue:v9 forKey:v38];
    }
  }
  else
  {
    uint64_t v40 = [MEMORY[0x263F45C20] extractionFailureRecordWithCode:3 propertyName:0 resourceKeyPath:0];
    uint64_t v41 = *MEMORY[0x263F45B40];
    v42 = [v7 medicalRecordPropertyValueForKey:*MEMORY[0x263F45B40] expectedClass:objc_opt_class() isArray:0 error:0];
    v43 = v42;
    if (v42) {
      id v44 = v42;
    }
    else {
      id v44 = objc_alloc_init(MEMORY[0x263F45C18]);
    }
    v45 = v44;

    [v45 addFailureRecord:v40];
    [v7 setMedicalRecordPropertyValue:v45 forKey:v41];

    BOOL v37 = 0;
  }

  return v37;
}

- (id)_unknownMedicalRecordWithClinicalItem:(id)a3 ruleset:(id)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 medicalRecordPropertyValueForKey:*MEMORY[0x263F45B40] expectedClass:objc_opt_class() isArray:0 error:0];
  uint64_t v38 = v7;
  objc_msgSend(v7, "rulesetForClinicalType:", objc_msgSend(v6, "type"));
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v39 = long long v47 = 0u;
  id v9 = [v39 displayNameKeyPaths];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v45;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v44 + 1) + 8 * v13);
        id v43 = 0;
        BOOL v15 = [v6 candidateValueForKeyPath:v14 error:&v43];
        id v16 = v43;
        id v17 = v16;
        if (v15) {
          BOOL v18 = 1;
        }
        else {
          BOOL v18 = v16 == 0;
        }
        if (v18)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {

            if (v15) {
              [v6 setMedicalRecordPropertyValue:v15 forKey:@"displayName"];
            }
            goto LABEL_23;
          }
        }
        else
        {
          _HKInitializeLogging();
          uint64_t v19 = *MEMORY[0x263F09908];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v49 = v17;
            _os_log_error_impl(&dword_232E63000, v19, OS_LOG_TYPE_ERROR, "ConstructMedicalRecordsTask unknown medical record display name extraction error %{public}@", buf, 0xCu);
          }
          uint64_t v21 = [MEMORY[0x263F45C20] extractionFailureRecordWithCode:4 propertyName:@"displayName" resourceKeyPath:v14];
          if (!v8) {
            id v8 = objc_alloc_init(MEMORY[0x263F45C18]);
          }
          [v8 addFailureRecord:v21];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  BOOL v15 = 0;
LABEL_23:
  id v42 = 0;
  uint64_t v22 = [v6 medicalRecordPropertyValueForKey:@"enteredInError" expectedClass:objc_opt_class() isArray:0 error:&v42];
  id v23 = v42;
  char v24 = v23;
  if (!v22)
  {
    if (v23)
    {
      _HKInitializeLogging();
      id v25 = *MEMORY[0x263F09908];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
        -[HDHealthRecordConstructMedicalRecordsTask _unknownMedicalRecordWithClinicalItem:ruleset:error:]((uint64_t)v24, v25);
      }
    }
    long long v26 = [v6 representedResource];
    BOOL v27 = [v26 JSONObject];

    id v41 = v24;
    long long v28 = +[HDHealthRecordsExtractionUtilities wasEnteredInError:v27 error:&v41];
    id v29 = v41;

    if (!v28)
    {
      _HKInitializeLogging();
      uint64_t v30 = (void *)*MEMORY[0x263F09908];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
        -[HDHealthRecordConstructMedicalRecordsTask _unknownMedicalRecordWithClinicalItem:ruleset:error:](v30);
      }
      long long v28 = &unk_26E6B3670;
    }
    [v6 setMedicalRecordPropertyValue:v28 forKey:@"enteredInError"];

    char v24 = v29;
  }
  id v31 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (v8)
  {
    v32 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
    [v8 encodeWithCoder:v32];
    uint64_t v33 = [v32 encodedData];
    if (v33) {
      [v31 setObject:v33 forKeyedSubscript:*MEMORY[0x263F0AAE0]];
    }
  }
  if ([v31 count]) {
    id v34 = v31;
  }
  else {
    id v34 = 0;
  }
  [v6 assignMedicalRecordMetadata:v34];
  _HKInitializeLogging();
  long long v35 = (void *)*MEMORY[0x263F09908];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
    -[HDHealthRecordConstructMedicalRecordsTask _unknownMedicalRecordWithClinicalItem:ruleset:error:](v35, v6);
  }
  uint64_t v36 = [MEMORY[0x263F0A838] medicalRecordFromClinicalItem:v6 error:a5];

  return v36;
}

- (id)_medicalRecordWithClinicalItem:(id)a3 clinicalType:(int64_t)a4 ruleset:(id)a5 error:(id *)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v46 = 0;
  uint64_t v11 = objc_msgSend((id)objc_msgSend(v9, "medicalRecordClass"), "medicalRecordFromClinicalItem:error:", v9, &v46);
  id v12 = v46;
  if (v11)
  {
    id v13 = v11;
    goto LABEL_26;
  }
  id v39 = v10;
  uint64_t v35 = *MEMORY[0x263F45B40];
  uint64_t v14 = [v9 medicalRecordPropertyValueForKey:*MEMORY[0x263F45B40] expectedClass:objc_opt_class() isArray:0 error:0];
  BOOL v15 = v14;
  uint64_t v40 = v9;
  BOOL v37 = self;
  uint64_t v38 = a6;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = objc_alloc_init(MEMORY[0x263F45C18]);
  }
  id v17 = v16;

  id v36 = v12;
  BOOL v18 = [v12 userInfo];
  uint64_t v19 = [v18 objectForKeyedSubscript:@"conversionErrors"];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v19;
  uint64_t v20 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v43 != v22) {
          objc_enumerationMutation(obj);
        }
        char v24 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        id v25 = [v24 userInfo];
        long long v26 = [v25 objectForKeyedSubscript:@"propertyName"];

        BOOL v27 = @"UnknownPropertyName";
        if (v26) {
          BOOL v27 = v26;
        }
        long long v28 = v27;

        id v29 = [v24 domain];
        int v30 = [v29 isEqualToString:@"HDHealthRecordsServiceErrorDomain"];

        if (v30)
        {
          if ([v24 code] == 204)
          {
            uint64_t v31 = 6;
            goto LABEL_23;
          }
          if ([v24 code] == 202)
          {
            uint64_t v31 = 8;
            goto LABEL_23;
          }
          if ([v24 code] == 203)
          {
            uint64_t v31 = 9;
            goto LABEL_23;
          }
          _HKInitializeLogging();
          v32 = *MEMORY[0x263F09908];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v48 = v24;
            _os_log_error_impl(&dword_232E63000, v32, OS_LOG_TYPE_ERROR, "ConstructMedicalRecordsTask medical record creation, unexpected error %{public}@", buf, 0xCu);
          }
        }
        uint64_t v31 = 1;
LABEL_23:
        uint64_t v33 = [MEMORY[0x263F45C20] extractionFailureRecordWithCode:v31 propertyName:v28 resourceKeyPath:0];
        [v17 addFailureRecord:v33];
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v21);
  }

  id v9 = v40;
  [v40 setMedicalRecordPropertyValue:v17 forKey:v35];
  id v10 = v39;
  id v13 = [(HDHealthRecordConstructMedicalRecordsTask *)v37 _unknownMedicalRecordWithClinicalItem:v40 ruleset:v39 error:v38];

  id v12 = v36;
  uint64_t v11 = 0;
LABEL_26:

  return v13;
}

- (void).cxx_destruct
{
}

+ (void)_unsupportedModifierExtensionsPresentInClinicalItem:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 debugDescription];
  OUTLINED_FUNCTION_2(&dword_232E63000, v5, v6, "%{public}@ no represented resource present on clinical item", v7, v8, v9, v10, 2u);
}

+ (void)_unsupportedModifierExtensionsPresentInClinicalItem:(void *)a1 .cold.2(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 debugDescription];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_232E63000, v5, v6, "%{public}@ failed to find modifier extensions: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_unknownMedicalRecordWithClinicalItem:(void *)a1 ruleset:(void *)a2 error:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 representedResource];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_232E63000, v5, v6, "Failed extraction of %{public}@: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_unknownMedicalRecordWithClinicalItem:(void *)a1 ruleset:error:.cold.2(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  uint64_t v9 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_0_2(&dword_232E63000, v3, v4, "%{public}@ failed to determine entered-in-error status on resource %{public}@", v5, v6, v7, v8, 2u);
}

- (void)_unknownMedicalRecordWithClinicalItem:(uint64_t)a1 ruleset:(NSObject *)a2 error:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_232E63000, a2, OS_LOG_TYPE_ERROR, "Entered in error status missing from clinical item: %@", (uint8_t *)&v2, 0xCu);
}

@end