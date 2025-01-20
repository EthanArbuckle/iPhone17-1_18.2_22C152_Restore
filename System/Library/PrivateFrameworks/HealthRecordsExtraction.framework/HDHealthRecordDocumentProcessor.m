@interface HDHealthRecordDocumentProcessor
- (HDHealthRecordDocumentProcessor)initWithConfiguration:(id)a3;
- (HRSSupportedFHIRConfiguration)supportedFHIRConfiguration;
- (NSNumber)extractionRulesetVersion;
- (id)_resourceObjectsBatchedPerFHIRRelease:(id)a3;
- (id)compareExistingPatientResourceData:(id)a3 incomingPatientResourceData:(id)a4 error:(id *)a5;
- (id)extractAttachmentContentFromFHIRResource:(id)a3 error:(id *)a4;
- (id)processExtractionRequest:(id)a3 error:(id *)a4;
- (id)processOptInRequest:(id)a3 redactor:(id)a4 error:(id *)a5;
- (id)processReferenceExtractionRequest:(id)a3 error:(id *)a4;
@end

@implementation HDHealthRecordDocumentProcessor

- (HDHealthRecordDocumentProcessor)initWithConfiguration:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HDHealthRecordDocumentProcessor.m", 33, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)HDHealthRecordDocumentProcessor;
  v7 = [(HDHealthRecordDocumentProcessor *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_configuration, a3);
  }

  return v8;
}

- (NSNumber)extractionRulesetVersion
{
  return [(HDHealthRecordDocumentTypeConfiguration *)self->_configuration extractionRulesetVersion];
}

- (HRSSupportedFHIRConfiguration)supportedFHIRConfiguration
{
  return [(HDHealthRecordDocumentTypeConfiguration *)self->_configuration supportedFHIRConfiguration];
}

- (id)processExtractionRequest:(id)a3 error:(id *)a4
{
  v72[3] = *MEMORY[0x263EF8340];
  id v38 = a3;
  v72[0] = objc_opt_class();
  v72[1] = objc_opt_class();
  v72[2] = objc_opt_class();
  v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:3];
  v5 = [v38 resources];
  id v6 = [(HDHealthRecordDocumentProcessor *)self _resourceObjectsBatchedPerFHIRRelease:v5];

  v45 = objc_alloc_init(HKHealthRecordsExtractor);
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2810000000;
  v67[3] = "";
  int v68 = 0;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v8 = v6;
  uint64_t v33 = [v8 countByEnumeratingWithState:&v63 objects:v71 count:16];
  v39 = v8;
  if (v33)
  {
    uint64_t v34 = *(void *)v64;
    while (2)
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v64 != v34) {
          objc_enumerationMutation(v8);
        }
        uint64_t v35 = *(void *)(*((void *)&v63 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "objectForKeyedSubscript:");
        v10 = (void *)[v9 mutableCopy];

        objc_super v11 = dispatch_group_create();
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        v12 = (void *)[v10 copy];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v59 objects:v70 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v60;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v60 != v14) {
                objc_enumerationMutation(v12);
              }
              uint64_t v16 = *(void *)(*((void *)&v59 + 1) + 8 * j);
              dispatch_group_enter(v11);
              v52[0] = MEMORY[0x263EF8330];
              v52[1] = 3221225472;
              v52[2] = __66__HDHealthRecordDocumentProcessor_processExtractionRequest_error___block_invoke;
              v52[3] = &unk_264BD9988;
              v58 = v67;
              id v53 = v7;
              id v54 = v10;
              uint64_t v55 = v16;
              v56 = self;
              v57 = v11;
              [(HKHealthRecordsExtractor *)v45 extractResource:v16 completion:v52];
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v59 objects:v70 count:16];
          }
          while (v13);
        }

        dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
        if ([v10 count])
        {
          v36 = [(HDHealthRecordDocumentTypeConfiguration *)self->_configuration extractionRulesetForRelease:v35];
          if (!v36)
          {
            objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 100, @"HDHealthRecordDocumentProcessor: No extraction ruleset is available for release %@", v35);
LABEL_36:

            v27 = 0;
            goto LABEL_37;
          }
          v44 = [[HDHealthRecordProcessingContext alloc] initWithRuleset:v36 resources:v10];
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          obuint64_t j = v37;
          uint64_t v17 = [obj countByEnumeratingWithState:&v48 objects:v69 count:16];
          if (v17)
          {
            uint64_t v43 = *(void *)v49;
            while (2)
            {
              uint64_t v42 = v17;
              for (uint64_t k = 0; k != v42; ++k)
              {
                if (*(void *)v49 != v43) {
                  objc_enumerationMutation(obj);
                }
                v19 = *(objc_class **)(*((void *)&v48 + 1) + 8 * k);
                v20 = (void *)MEMORY[0x237DB67E0]();
                v21 = (void *)[[v19 alloc] initWithProcessingContext:v44];
                if (([v21 conformsToProtocol:&unk_26E6B65A8] & 1) == 0)
                {
                  v24 = [MEMORY[0x263F08690] currentHandler];
                  [v24 handleFailureInMethod:a2, self, @"HDHealthRecordDocumentProcessor.m", 105, @"HDHealthRecordDocumentProcessor: Trying to run invalid task instance, must conform to HDHealthRecordPipelineTask" object file lineNumber description];
                }
                id v47 = 0;
                char v22 = [v21 processWithError:&v47];
                id v23 = v47;

                if ((v22 & 1) == 0)
                {
                  id v28 = v23;
                  v29 = v28;
                  if (v28)
                  {
                    if (a4) {
                      *a4 = v28;
                    }
                    else {
                      _HKLogDroppedError();
                    }
                  }

                  goto LABEL_35;
                }
              }
              uint64_t v17 = [obj countByEnumeratingWithState:&v48 objects:v69 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          id v46 = 0;
          v25 = [(HDHealthRecordProcessingContext *)v44 createExtractionResultWithError:&v46];
          obuint64_t j = v46;
          if (!v25)
          {
            v29 = [NSString stringWithFormat:@"HDHealthRecordDocumentProcessor: Failed to create extraction result for release %@", v35];
            objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:underlyingError:", a4, 100, v29, obj);
LABEL_35:

            goto LABEL_36;
          }
          v26 = [v25 items];
          [v7 addObjectsFromArray:v26];
        }
        id v8 = v39;
      }
      uint64_t v33 = [v39 countByEnumeratingWithState:&v63 objects:v71 count:16];
      if (v33) {
        continue;
      }
      break;
    }
  }

  v27 = (void *)[objc_alloc(MEMORY[0x263F45BE8]) initWithItems:v7];
LABEL_37:

  _Block_object_dispose(v67, 8);
  return v27;
}

void __66__HDHealthRecordDocumentProcessor_processExtractionRequest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 72) + 8) + 32));
    [*(id *)(a1 + 32) addObject:v5];
    [*(id *)(a1 + 40) removeObject:*(void *)(a1 + 48)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 72) + 8) + 32));
  }
  else if (v6)
  {
    if ((objc_msgSend(v6, "hk_isHealthKitErrorWithCode:", 125) & 1) == 0)
    {
      _HKInitializeLogging();
      id v8 = (void *)*MEMORY[0x263F09908];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
        __66__HDHealthRecordDocumentProcessor_processExtractionRequest_error___block_invoke_cold_1(a1, v8);
      }
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

- (id)compareExistingPatientResourceData:(id)a3 incomingPatientResourceData:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = objc_alloc_init(HKHealthRecordsExtractor);
  v10 = [(HKHealthRecordsExtractor *)v9 comparePatientResourceDataWithExisting:v8 incoming:v7 error:a5];

  return v10;
}

- (id)extractAttachmentContentFromFHIRResource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HKFHIRAttachmentContentExtractor);
  id v7 = [(HKFHIRAttachmentContentExtractor *)v6 extractAttachmentContentFromFHIRResource:v5 error:a4];

  return v7;
}

- (id)processReferenceExtractionRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  configuration = self->_configuration;
  id v8 = [v6 FHIRRelease];
  v9 = [(HDHealthRecordDocumentTypeConfiguration *)configuration extractionRulesetForRelease:v8];

  if (v9)
  {
    v10 = [[HDHealthRecordFindReferencesTask alloc] initWithRuleset:v9];
    objc_super v11 = [(HDHealthRecordFindReferencesTask *)v10 processResourcesForReferenceExtractionRequest:v6 error:a4];
  }
  else
  {
    v12 = (void *)MEMORY[0x263F087E8];
    v10 = [v6 FHIRRelease];
    objc_msgSend(v12, "hk_assignError:code:format:", a4, 3, @"FHIR release %@ is not supported for reference extraction", v10);
    objc_super v11 = 0;
  }

  return v11;
}

- (id)processOptInRequest:(id)a3 redactor:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 resources];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__0;
    v30 = __Block_byref_object_dispose__0;
    id v31 = 0;
    v12 = [v8 resources];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __70__HDHealthRecordDocumentProcessor_processOptInRequest_redactor_error___block_invoke;
    v21 = &unk_264BD99B0;
    char v22 = self;
    id v23 = v9;
    v24 = &v32;
    v25 = &v26;
    uint64_t v13 = objc_msgSend(v12, "hk_map:", &v18);

    if (*((unsigned char *)v33 + 24))
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:underlyingError:", a5, 100, @"Error during redaction", v27[5], v18, v19, v20, v21, v22);
      uint64_t v14 = 0;
    }
    else
    {
      id v15 = objc_alloc(MEMORY[0x263F45BE0]);
      uint64_t v16 = [(HDHealthRecordDocumentProcessor *)self extractionRulesetVersion];
      uint64_t v14 = (void *)[v15 initWithRedactedResources:v13 rulesVersion:v16];
    }
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a5, 3, @"no resources to process");
    uint64_t v14 = 0;
  }

  return v14;
}

id __70__HDHealthRecordDocumentProcessor_processOptInRequest_redactor_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 FHIRVersion];
  id v5 = [v4 FHIRRelease];

  id v6 = [*(id *)(a1[4] + 8) extractionRulesetForRelease:v5];
  id v7 = [v6 rulesetForFHIRResourceObject:v3];
  id v8 = [v7 redactionRules];
  if (!v8)
  {
    uint64_t v13 = 0;
    goto LABEL_16;
  }
  id v9 = [v3 JSONObject];
  uint64_t v10 = a1[5];
  id v26 = 0;
  uint64_t v11 = +[HDHRSDataCollectionScrubber scrubberForResource:v9 redactor:v10 rules:v8 error:&v26];
  id v12 = v26;

  if (v11)
  {
    v24 = v5;
    uint64_t v23 = [v11 generateRedactedResource];
    uint64_t v13 = objc_msgSend(MEMORY[0x263F45C50], "resourceObjectWithFHIRJSONObject:redactedJSONObject:error:", v3);
    uint64_t v14 = v12;
    id v25 = v12;

    if (!v13)
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      _HKInitializeLogging();
      id v15 = (void *)*MEMORY[0x263F09908];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
        __70__HDHealthRecordDocumentProcessor_processOptInRequest_redactor_error___block_invoke_cold_2((uint64_t)(a1 + 4), v15);
      }
      uint64_t v16 = *(void *)(a1[7] + 8);
      uint64_t v18 = *(void *)(v16 + 40);
      uint64_t v17 = (id *)(v16 + 40);
      if (!v18) {
        objc_storeStrong(v17, v14);
      }
    }
    uint64_t v19 = (void *)v23;
    id v5 = v24;
    id v12 = v25;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      __70__HDHealthRecordDocumentProcessor_processOptInRequest_redactor_error___block_invoke_cold_1((uint64_t)(a1 + 4), v20);
    }
    uint64_t v21 = *(void *)(a1[7] + 8);
    if (*(void *)(v21 + 40))
    {
      uint64_t v13 = 0;
      goto LABEL_15;
    }
    id v12 = v12;
    uint64_t v13 = 0;
    uint64_t v19 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v12;
  }

LABEL_15:
LABEL_16:

  return v13;
}

- (id)_resourceObjectsBatchedPerFHIRRelease:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "FHIRVersion", (void)v16);
        id v12 = [v11 FHIRRelease];

        id v13 = [v4 objectForKeyedSubscript:v12];
        if (!v13)
        {
          id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v4 setObject:v13 forKeyedSubscript:v12];
        }
        [v13 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  uint64_t v14 = (void *)[v4 copy];
  return v14;
}

- (void).cxx_destruct
{
}

void __66__HDHealthRecordDocumentProcessor_processExtractionRequest_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_232E63000, v4, v5, "%{public}@: Extraction 2.0 failed, falling back to Extraction 1.0. Error: %@", v6, v7, v8, v9, v10);
}

void __70__HDHealthRecordDocumentProcessor_processOptInRequest_redactor_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_232E63000, v4, v5, "%{public}@: Unable to create scrubber for resource: %@", v6, v7, v8, v9, v10);
}

void __70__HDHealthRecordDocumentProcessor_processOptInRequest_redactor_error___block_invoke_cold_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_232E63000, v4, v5, "%{public}@: Unable to convert resource to HDFHIRResourceObject: %@", v6, v7, v8, v9, v10);
}

@end