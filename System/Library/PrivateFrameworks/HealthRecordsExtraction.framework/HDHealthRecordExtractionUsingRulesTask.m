@interface HDHealthRecordExtractionUsingRulesTask
- (BOOL)processWithError:(id *)a3;
- (HDHealthRecordExtractionUsingRulesTask)initWithProcessingContext:(id)a3;
@end

@implementation HDHealthRecordExtractionUsingRulesTask

- (HDHealthRecordExtractionUsingRulesTask)initWithProcessingContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDHealthRecordExtractionUsingRulesTask;
  v6 = [(HDHealthRecordExtractionUsingRulesTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_processingContext, a3);
  }

  return v7;
}

- (BOOL)processWithError:(id *)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = [(HDHealthRecordProcessingContext *)self->_processingContext extractionRuleset];
  v6 = [[HDHealthRecordFindReferencesTask alloc] initWithRuleset:v5];
  if ([(HDHealthRecordFindReferencesTask *)v6 processContainedResourcesInProcessingContext:self->_processingContext error:a3])
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = [(HDHealthRecordProcessingContext *)self->_processingContext resources];
    uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v32)
    {
      v29 = v6;
      uint64_t v31 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v34 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          objc_super v9 = [v5 rulesetForFHIRResourceObject:v8];
          if (v9)
          {
            v10 = v9;
            processingContext = self->_processingContext;
            v12 = [v9 clinicalType];
            v13 = -[HDHealthRecordProcessingContext extractedClinicalItemsForClinicalType:](processingContext, "extractedClinicalItemsForClinicalType:", [v12 type]);

            v14 = (void *)[v13 mutableCopy];
            v15 = v14;
            if (v14) {
              id v16 = v14;
            }
            else {
              id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
            }
            v20 = v16;

            v21 = [HDHealthRecordClinicalItem alloc];
            v22 = [v10 clinicalType];
            v23 = [v5 rulesetVersion];
            v24 = [(HDHealthRecordClinicalItem *)v21 initWithRepresentedResource:v8 clinicalType:v22 rulesVersion:v23];

            if (!v24)
            {

              BOOL v27 = 0;
              goto LABEL_20;
            }
            [v20 addObject:v24];
            v25 = self->_processingContext;
            v26 = [v10 clinicalType];
            -[HDHealthRecordProcessingContext setExtractedClinicalItems:forClinicalType:](v25, "setExtractedClinicalItems:forClinicalType:", v20, [v26 type]);
          }
          else
          {
            _HKInitializeLogging();
            v17 = (void *)*MEMORY[0x263F09908];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
            {
              v18 = v17;
              v19 = [(HDHealthRecordExtractionUsingRulesTask *)self debugDescription];
              *(_DWORD *)buf = 138543618;
              v38 = v19;
              __int16 v39 = 2114;
              uint64_t v40 = v8;
              _os_log_error_impl(&dword_232E63000, v18, OS_LOG_TYPE_ERROR, "%{public}@: no extraction rules available for %{public}@, skipping", buf, 0x16u);
            }
          }
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v32) {
          continue;
        }
        break;
      }
      BOOL v27 = 1;
LABEL_20:
      v6 = v29;
    }
    else
    {
      BOOL v27 = 1;
    }
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

- (void).cxx_destruct
{
}

@end