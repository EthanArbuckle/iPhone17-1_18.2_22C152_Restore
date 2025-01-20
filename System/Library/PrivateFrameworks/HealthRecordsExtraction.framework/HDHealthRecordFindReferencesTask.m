@interface HDHealthRecordFindReferencesTask
- (BOOL)_canProcessResource:(id)a3;
- (BOOL)_isIrretrievableReference:(id)a3 serverBaseURL:(id)a4;
- (BOOL)_resourceReference:(id)a3 containedInResource:(id)a4;
- (BOOL)processContainedResourcesInProcessingContext:(id)a3 error:(id *)a4;
- (HDHealthRecordFindReferencesTask)init;
- (HDHealthRecordFindReferencesTask)initWithRuleset:(id)a3;
- (id)_filterResources:(id)a3;
- (id)_processedContainReferencesResourceWithResource:(id)a3 processingContext:(id)a4 rule:(id)a5 allResources:(id)a6;
- (id)_processedRetrieveReferencesResourceWithResource:(id)a3 processingContext:(id)a4 rule:(id)a5 allResources:(id)a6;
- (id)_resourceForReference:(id)a3 containedInResource:(id)a4 error:(id *)a5;
- (id)_resourceReference:(id)a3 presentInResources:(id)a4;
- (id)debugDescription;
- (id)processResourcesForReferenceExtractionRequest:(id)a3 error:(id *)a4;
@end

@implementation HDHealthRecordFindReferencesTask

- (HDHealthRecordFindReferencesTask)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDHealthRecordFindReferencesTask)initWithRuleset:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HDHealthRecordFindReferencesTask.m", 40, @"Invalid parameter not satisfying: %@", @"ruleset" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)HDHealthRecordFindReferencesTask;
  v7 = [(HDHealthRecordFindReferencesTask *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_ruleset, a3);
  }

  return v8;
}

- (id)processResourcesForReferenceExtractionRequest:(id)a3 error:(id *)a4
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = objc_alloc_init(HDReferenceExtractionProcessingContext);
  v95 = objc_alloc_init(HKHealthRecordsExtractionRouter);
  v8 = [v6 resources];
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x263EFF9C0]);
    v10 = [v6 resources];
    id v91 = (id)[v9 initWithArray:v10];
  }
  else
  {
    id v91 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  v96 = v7;
  v97 = self;

  id v92 = objc_alloc_init(MEMORY[0x263EFF910]);
  [v6 serverBaseURL];
  v90 = v89 = v6;
  [v6 FHIRResourceData];
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v109 objects:v122 count:16];
  id v93 = v11;
  if (v12)
  {
    id v14 = (id)v12;
    v98 = a4;
    v94 = 0;
    uint64_t v15 = *(void *)v110;
    unint64_t v16 = 0x263F45000uLL;
    *(void *)&long long v13 = 138543618;
    long long v88 = v13;
    while (1)
    {
      v17 = 0;
      id obj = v14;
      do
      {
        if (*(void *)v110 != v15) {
          objc_enumerationMutation(v11);
        }
        v18 = *(void **)(*((void *)&v109 + 1) + 8 * (void)v17);
        v19 = *(void **)(v16 + 3072);
        id v108 = 0;
        v20 = objc_msgSend(v19, "objectWithResourceData:error:", v18, &v108, v88);
        id v21 = v108;
        if (!v20)
        {
          _HKInitializeLogging();
          v43 = (void *)*MEMORY[0x263F09908];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
          {
            v85 = v43;
            v86 = [(HDHealthRecordFindReferencesTask *)v97 debugDescription];
            v87 = [v18 debugDescription];
            *(_DWORD *)buf = 138543874;
            v117 = v86;
            __int16 v118 = 2114;
            id v119 = v87;
            __int16 v120 = 2114;
            id v121 = v21;
            _os_log_error_impl(&dword_232E63000, v85, OS_LOG_TYPE_ERROR, "%{public}@: failed to parse JSON data %{public}@: %{public}@", buf, 0x20u);
          }
          objc_msgSend(MEMORY[0x263F087E8], "hrs_resourceParsingErrorWithUnderlyingError:", v21);
          id v44 = (id)objc_claimAutoreleasedReturnValue();
          id v45 = v44;
          v46 = v96;
          if (v44)
          {
            if (v98)
            {
              id v45 = v44;
              v47 = 0;
              id *v98 = v45;
              v48 = v45;
LABEL_58:
              v83 = v93;
              v82 = v94;
              v81 = v93;
              goto LABEL_59;
            }
            _HKLogDroppedError();
          }
          v47 = 0;
          v48 = v45;
          goto LABEL_58;
        }
        v22 = [v20 detectedResourceType];
        int v23 = [v22 isEqualToString:@"Bundle"];

        if (v23)
        {
          if (v94)
          {
            _HKInitializeLogging();
            v24 = (void *)*MEMORY[0x263F09908];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
              [(HDHealthRecordFindReferencesTask *)v114 processResourcesForReferenceExtractionRequest:v97 error:&v115];
            }
            id v25 = v21;
          }
          else
          {
            id v107 = v21;
            v33 = +[HDFHIRResourceSearchSet searchSetWithFHIRJSONObject:v20 serverBaseURL:v90 error:&v107];
            id v25 = v107;

            if (v33)
            {
              v94 = v33;
              v34 = [v33 entries];
              v35 = [(HDHealthRecordFindReferencesTask *)v97 _filterResources:v34];

              [v91 addObjectsFromArray:v35];
            }
            else
            {
              _HKInitializeLogging();
              v37 = (void *)*MEMORY[0x263F09908];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
              {
                v40 = v37;
                v41 = [(HDHealthRecordFindReferencesTask *)v97 debugDescription];
                *(_DWORD *)buf = v88;
                v117 = v41;
                __int16 v118 = 2114;
                id v119 = v25;
                _os_log_error_impl(&dword_232E63000, v40, OS_LOG_TYPE_ERROR, "%{public}@: invalid bundle error: %{public}@", buf, 0x16u);

                id v11 = v93;
              }
              v94 = 0;
            }
          }
        }
        else
        {
          uint64_t v26 = v15;
          unint64_t v27 = v16;
          v28 = (void *)MEMORY[0x263F45C10];
          v29 = [v20 JSONObject];
          v30 = [v20 sourceURL];
          v31 = [v20 FHIRVersion];
          id v106 = v21;
          v32 = [v28 resourceObjectWithJSONObject:v29 sourceURL:v30 FHIRVersion:v31 receivedDate:v92 extractionHints:0 error:&v106];
          id v25 = v106;

          if (v32)
          {
            [v91 addObject:v32];
            id v11 = v93;
            unint64_t v16 = v27;
          }
          else
          {
            _HKInitializeLogging();
            v36 = (void *)*MEMORY[0x263F09908];
            id v11 = v93;
            unint64_t v16 = v27;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
            {
              v38 = v36;
              v39 = [(HDHealthRecordFindReferencesTask *)v97 debugDescription];
              *(_DWORD *)buf = v88;
              v117 = v39;
              __int16 v118 = 2114;
              id v119 = v25;
              _os_log_error_impl(&dword_232E63000, v38, OS_LOG_TYPE_ERROR, "%{public}@: invalid resourceObject error: %{public}@", buf, 0x16u);

              unint64_t v16 = v27;
            }
          }

          uint64_t v15 = v26;
          id v14 = obj;
        }

        v17 = (char *)v17 + 1;
      }
      while (v14 != v17);
      uint64_t v42 = [v11 countByEnumeratingWithState:&v109 objects:v122 count:16];
      id v14 = (id)v42;
      if (!v42) {
        goto LABEL_35;
      }
    }
  }
  v94 = 0;
LABEL_35:

  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id obja = v91;
  uint64_t v49 = [obja countByEnumeratingWithState:&v102 objects:v113 count:16];
  v46 = v96;
  p_isa = (id *)&v97->super.isa;
  if (v49)
  {
    uint64_t v51 = v49;
    uint64_t v52 = *(void *)v103;
    do
    {
      uint64_t v53 = 0;
      uint64_t v99 = v51;
      do
      {
        if (*(void *)v103 != v52) {
          objc_enumerationMutation(obja);
        }
        v54 = *(void **)(*((void *)&v102 + 1) + 8 * v53);
        if ([p_isa _canProcessResource:v54])
        {
          v55 = [p_isa[1] rulesetForFHIRResourceObject:v54];
          if (v55)
          {
            v56 = [p_isa _processedContainReferencesResourceWithResource:v54 processingContext:v46 rule:v55 allResources:obja];
            v57 = [p_isa _processedRetrieveReferencesResourceWithResource:v56 processingContext:v46 rule:v55 allResources:obja];

            [(HDReferenceExtractionProcessingContext *)v46 recordProcessedResource:v57];
          }
          else
          {
            v61 = [p_isa[1] releaseSupport];
            v62 = [v61 FHIRRelease];
            v63 = [(HKHealthRecordsExtractionRouter *)v95 supportedResourceTypesForRelease:v62];
            v64 = [v54 identifier];
            v65 = [v64 resourceType];
            int v66 = [v63 containsObject:v65];

            if (v66)
            {
              _HKInitializeLogging();
              v67 = (void *)*MEMORY[0x263F09908];
              p_isa = (id *)&v97->super.isa;
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEBUG))
              {
                v72 = v67;
                v73 = [(HDHealthRecordFindReferencesTask *)v97 debugDescription];
                v74 = [v54 identifier];
                v75 = [v74 resourceType];
                *(_DWORD *)buf = 138543618;
                v117 = v73;
                __int16 v118 = 2114;
                id v119 = v75;
                _os_log_debug_impl(&dword_232E63000, v72, OS_LOG_TYPE_DEBUG, "%{public}@ processResourcesForReferenceExtractionRequest: resource type %{public}@. Skipping Reference extraction.", buf, 0x16u);
              }
              v46 = v96;
              [(HDReferenceExtractionProcessingContext *)v96 recordProcessedResource:v54];
            }
            else
            {
              v68 = [v54 identifier];
              v69 = [v68 resourceType];
              char v70 = [v69 isEqualToString:@"Medication"];

              v46 = v96;
              p_isa = (id *)&v97->super.isa;
              if ((v70 & 1) == 0)
              {
                _HKInitializeLogging();
                v71 = (void *)*MEMORY[0x263F09908];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
                {
                  v76 = v71;
                  v77 = [(HDHealthRecordFindReferencesTask *)v97 debugDescription];
                  v78 = [v54 identifier];
                  v79 = [v78 resourceType];
                  *(_DWORD *)buf = 138543618;
                  v117 = v77;
                  __int16 v118 = 2114;
                  id v119 = v79;
                  _os_log_error_impl(&dword_232E63000, v76, OS_LOG_TYPE_ERROR, "%{public}@ processResourcesForReferenceExtractionRequest: no extraction rules for resource type %{public}@", buf, 0x16u);
                }
              }
            }
          }

          uint64_t v51 = v99;
        }
        else
        {
          _HKInitializeLogging();
          v58 = (void *)*MEMORY[0x263F09908];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
          {
            v59 = v58;
            v60 = [p_isa debugDescription];
            *(_DWORD *)buf = 138543618;
            v117 = v60;
            __int16 v118 = 2114;
            id v119 = v54;
            _os_log_error_impl(&dword_232E63000, v59, OS_LOG_TYPE_ERROR, "%{public}@ processResourcesForReferenceExtractionRequest: cannot process resource: %{public}@", buf, 0x16u);
          }
        }
        ++v53;
      }
      while (v51 != v53);
      uint64_t v51 = [obja countByEnumeratingWithState:&v102 objects:v113 count:16];
    }
    while (v51);
  }

  id v80 = objc_alloc(MEMORY[0x263F45C58]);
  v81 = [(HDReferenceExtractionProcessingContext *)v46 completeResources];
  id v21 = [(HDReferenceExtractionProcessingContext *)v46 incompleteResources];
  v48 = [(HDReferenceExtractionProcessingContext *)v46 unresolvableReferences];
  v82 = v94;
  id v45 = [v94 nextPageURL];
  v47 = (void *)[v80 initWithCompleteResources:v81 incompleteResources:v21 unresolvableReferences:v48 nextSearchResultURL:v45];
  v83 = v93;
LABEL_59:

  return v47;
}

- (id)_processedContainReferencesResourceWithResource:(id)a3 processingContext:(id)a4 rule:(id)a5 allResources:(id)a6
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v59 = a6;
  long long v13 = [v10 identifier];
  v48 = [v13 resourceType];

  id v14 = [v10 serverBaseURL];
  id v15 = v10;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v45 = v12;
  id obj = [v12 containReferences];
  v46 = v15;
  unint64_t v16 = v15;
  uint64_t v50 = [obj countByEnumeratingWithState:&v68 objects:v83 count:16];
  if (v50)
  {
    uint64_t v49 = *(void *)v69;
    unint64_t v16 = v15;
    v60 = v11;
    v58 = v14;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v69 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v68 + 1) + 8 * i);
        v19 = [v16 JSONObject];
        id v67 = 0;
        v20 = +[HDFHIRReferenceProcessor referencesAtKeyPath:v18 resourceDictionary:v19 error:&v67];
        id v21 = v67;

        if (v20)
        {
          id v51 = v21;
          uint64_t v52 = v20;
          uint64_t v53 = i;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id v22 = v20;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v63 objects:v82 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v64;
            id v14 = v58;
            id v61 = v22;
            do
            {
              for (uint64_t j = 0; j != v24; ++j)
              {
                if (*(void *)v64 != v25) {
                  objc_enumerationMutation(v22);
                }
                unint64_t v27 = *(void **)(*((void *)&v63 + 1) + 8 * j);
                if ([(HDHealthRecordFindReferencesTask *)self _isIrretrievableReference:v27 serverBaseURL:v14])
                {
                  [v11 recordUnresolvableReference:v27 forResource:v16 hint:1];
                }
                else if ([(HDHealthRecordFindReferencesTask *)self _resourceReference:v27 containedInResource:v16])
                {
                  _HKInitializeLogging();
                  v28 = (void *)*MEMORY[0x263F09908];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEBUG)) {
                    -[HDHealthRecordFindReferencesTask _processedContainReferencesResourceWithResource:processingContext:rule:allResources:](v72, v28, self, &v73);
                  }
                }
                else if (+[HDFHIRReferenceProcessor referenceRequiresContaining:v27]|| ([(HDHealthRecordFindReferencesTask *)self _resourceReference:v27 presentInResources:v59], (uint64_t v29 = objc_claimAutoreleasedReturnValue()) == 0))
                {
                  _HKInitializeLogging();
                  v35 = (void *)*MEMORY[0x263F09908];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEBUG))
                  {
                    v37 = v35;
                    v38 = [(HDHealthRecordFindReferencesTask *)self debugDescription];
                    *(_DWORD *)buf = 138543618;
                    v75 = v38;
                    __int16 v76 = 2114;
                    v77 = v27;
                    _os_log_debug_impl(&dword_232E63000, v37, OS_LOG_TYPE_DEBUG, "%{public}@ containReferences: referenced resource not present, marking unresolved: %{public}@", buf, 0x16u);

                    id v14 = v58;
                  }
                  [v11 recordUnresolvedReference:v27 forResource:v16];
                  id v22 = v61;
                }
                else
                {
                  v30 = (void *)v29;
                  _HKInitializeLogging();
                  v31 = (void *)*MEMORY[0x263F09908];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEBUG))
                  {
                    v39 = v31;
                    v40 = [(HDHealthRecordFindReferencesTask *)self debugDescription];
                    *(_DWORD *)buf = 138543618;
                    v75 = v40;
                    __int16 v76 = 2114;
                    v77 = v30;
                    _os_log_debug_impl(&dword_232E63000, v39, OS_LOG_TYPE_DEBUG, "%{public}@ containReferences: found resource %{public}@, containing", buf, 0x16u);
                  }
                  id v62 = 0;
                  id v32 = +[HDFHIRReferenceProcessor newResourceFromResource:v16 containingResource:v30 reference:v27 error:&v62];
                  id v33 = v62;
                  if (v32)
                  {
                    id v34 = v32;

                    [v60 recordContainedResource:v30];
                    unint64_t v16 = v34;
                  }
                  else
                  {
                    _HKInitializeLogging();
                    v36 = (void *)*MEMORY[0x263F09908];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
                    {
                      log = v36;
                      v55 = [(HDHealthRecordFindReferencesTask *)self debugDescription];
                      v56 = [v30 identifier];
                      v54 = [v56 resourceType];
                      *(_DWORD *)buf = 138544130;
                      v75 = v55;
                      __int16 v76 = 2114;
                      v77 = v54;
                      __int16 v78 = 2114;
                      id v79 = v48;
                      __int16 v80 = 2114;
                      id v81 = v33;
                      _os_log_error_impl(&dword_232E63000, log, OS_LOG_TYPE_ERROR, "%{public}@ containReferences: failed to contain resource %{public}@ in resource %{public}@: %{public}@", buf, 0x2Au);
                    }
                    [v60 recordUnresolvedReference:v27 forResource:v16];
                  }

                  id v11 = v60;
                  id v22 = v61;
                  id v14 = v58;
                }
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v63 objects:v82 count:16];
            }
            while (v24);
          }
          else
          {
            id v14 = v58;
          }

          v20 = v52;
          uint64_t i = v53;
          id v21 = v51;
        }
        else
        {
          _HKInitializeLogging();
          v41 = (void *)*MEMORY[0x263F09908];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
          {
            uint64_t v42 = v41;
            v43 = [(HDHealthRecordFindReferencesTask *)self debugDescription];
            *(_DWORD *)buf = 138543874;
            v75 = v43;
            __int16 v76 = 2114;
            v77 = v48;
            __int16 v78 = 2114;
            id v79 = v21;
            _os_log_error_impl(&dword_232E63000, v42, OS_LOG_TYPE_ERROR, "%{public}@ containReferences: invalid reference on %{public}@ resource: %{public}@", buf, 0x20u);
          }
          [v11 recordUnresolvableReference:v18 forResource:v16 hint:2];
          id v14 = v58;
        }
      }
      uint64_t v50 = [obj countByEnumeratingWithState:&v68 objects:v83 count:16];
    }
    while (v50);
  }

  return v16;
}

- (id)_processedRetrieveReferencesResourceWithResource:(id)a3 processingContext:(id)a4 rule:(id)a5 allResources:(id)a6
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v63 = a4;
  id v11 = a5;
  id v12 = v10;
  id v13 = v11;
  id v61 = a6;
  id v14 = [v10 identifier];
  id v51 = [v14 resourceType];

  id v15 = [v10 serverBaseURL];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v50 = v13;
  id obj = [v13 retrieveReferences];
  uint64_t v54 = [obj countByEnumeratingWithState:&v70 objects:v83 count:16];
  if (v54)
  {
    uint64_t v53 = *(void *)v71;
    id v62 = v10;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v71 != v53) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v70 + 1) + 8 * v16);
        _HKInitializeLogging();
        uint64_t v18 = (void *)*MEMORY[0x263F09908];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEBUG))
        {
          v46 = v18;
          v47 = [(HDHealthRecordFindReferencesTask *)self debugDescription];
          *(_DWORD *)buf = 138543874;
          os_log_t v76 = v47;
          __int16 v77 = 2114;
          __int16 v78 = v17;
          __int16 v79 = 2114;
          __int16 v80 = v62;
          _os_log_debug_impl(&dword_232E63000, v46, OS_LOG_TYPE_DEBUG, "%{public}@ retrieveReferences: attempting to retrieve %{public}@ in %{public}@", buf, 0x20u);
        }
        uint64_t v56 = v16;
        v19 = [v62 JSONObject];
        id v69 = 0;
        v20 = +[HDFHIRReferenceProcessor referencesAtKeyPath:v17 resourceDictionary:v19 error:&v69];
        id v21 = v69;

        if (!v20)
        {
          _HKInitializeLogging();
          v28 = (void *)*MEMORY[0x263F09908];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
            goto LABEL_13;
          }
          uint64_t v23 = v28;
          uint64_t v24 = [(HDHealthRecordFindReferencesTask *)self debugDescription];
          *(_DWORD *)buf = 138544130;
          os_log_t v76 = v24;
          __int16 v77 = 2114;
          __int16 v78 = v17;
          __int16 v79 = 2114;
          __int16 v80 = v51;
          __int16 v81 = 2114;
          id v82 = v21;
          uint64_t v25 = v23;
          uint64_t v26 = "%{public}@ retrieveReferences: invalid reference at %{public}@ on %{public}@ resource: %{public}@";
          uint32_t v27 = 42;
          goto LABEL_40;
        }
        id v12 = v62;
        if (![v20 count])
        {
          _HKInitializeLogging();
          id v22 = (void *)*MEMORY[0x263F09908];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
          {
LABEL_13:
            id v12 = v62;
            [v63 recordUnresolvableReference:v17 forResource:v62 hint:2];
            goto LABEL_14;
          }
          uint64_t v23 = v22;
          uint64_t v24 = [(HDHealthRecordFindReferencesTask *)self debugDescription];
          *(_DWORD *)buf = 138543874;
          os_log_t v76 = v24;
          __int16 v77 = 2114;
          __int16 v78 = v17;
          __int16 v79 = 2114;
          __int16 v80 = v51;
          uint64_t v25 = v23;
          uint64_t v26 = "%{public}@ retrieveReferences: reference \"%{public}@\" on %{public}@ not present";
          uint32_t v27 = 32;
LABEL_40:
          _os_log_error_impl(&dword_232E63000, v25, OS_LOG_TYPE_ERROR, v26, buf, v27);

          goto LABEL_13;
        }
LABEL_14:
        v55 = v21;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v29 = v20;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v65 objects:v74 count:16];
        if (!v30) {
          goto LABEL_37;
        }
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v66;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v66 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(void *)(*((void *)&v65 + 1) + 8 * i);
            if ([(HDHealthRecordFindReferencesTask *)self _isIrretrievableReference:v34 serverBaseURL:v15])
            {
              [v63 recordUnresolvableReference:v34 forResource:v12 hint:1];
              continue;
            }
            v35 = v15;
            id v64 = 0;
            v36 = [(HDHealthRecordFindReferencesTask *)self _resourceForReference:v34 containedInResource:v12 error:&v64];
            id v37 = v64;
            if (v36)
            {
              _HKInitializeLogging();
              v38 = (void *)*MEMORY[0x263F09908];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEBUG))
              {
                v43 = v38;
                id v44 = [(HDHealthRecordFindReferencesTask *)self debugDescription];
                *(_DWORD *)buf = 138543618;
                os_log_t v76 = v44;
                __int16 v77 = 2114;
                __int16 v78 = v36;
                _os_log_debug_impl(&dword_232E63000, v43, OS_LOG_TYPE_DEBUG, "%{public}@ retrieveReferences: resource %{public}@ was contained", buf, 0x16u);
              }
              [v63 recordContainedResource:v36];
            }
            else
            {
              if (+[HDFHIRReferenceProcessor referenceRequiresContaining:v34]|| ([(HDHealthRecordFindReferencesTask *)self _resourceReference:v34 presentInResources:v61], (uint64_t v39 = objc_claimAutoreleasedReturnValue()) == 0))
              {
                _HKInitializeLogging();
                uint64_t v42 = (void *)*MEMORY[0x263F09908];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEBUG))
                {
                  loga = v42;
                  v57 = [(HDHealthRecordFindReferencesTask *)self debugDescription];
                  v58 = HKSensitiveLogItem();
                  *(_DWORD *)buf = 138543618;
                  os_log_t v76 = v57;
                  __int16 v77 = 2114;
                  __int16 v78 = v58;
                  _os_log_debug_impl(&dword_232E63000, loga, OS_LOG_TYPE_DEBUG, "%{public}@ retrieveReferences: referenced resource not present, marking unresolved: %{public}@", buf, 0x16u);
                }
                id v12 = v62;
                [v63 recordUnresolvedReference:v34 forResource:v62];
                goto LABEL_34;
              }
              v40 = (void *)v39;
              _HKInitializeLogging();
              v41 = (void *)*MEMORY[0x263F09908];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEBUG))
              {
                id v45 = v41;
                os_log_t log = [(HDHealthRecordFindReferencesTask *)self debugDescription];
                *(_DWORD *)buf = 138543618;
                os_log_t v76 = log;
                __int16 v77 = 2114;
                __int16 v78 = v40;
                _os_log_debug_impl(&dword_232E63000, v45, OS_LOG_TYPE_DEBUG, "%{public}@ retrieveReferences: found resource %{public}@", buf, 0x16u);
              }
              [v63 recordProcessedResource:v40];
            }
            id v12 = v62;
LABEL_34:

            id v15 = v35;
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v65 objects:v74 count:16];
        }
        while (v31);
LABEL_37:

        uint64_t v16 = v56 + 1;
      }
      while (v56 + 1 != v54);
      uint64_t v48 = [obj countByEnumeratingWithState:&v70 objects:v83 count:16];
      uint64_t v54 = v48;
    }
    while (v48);
  }

  return v12;
}

- (BOOL)processContainedResourcesInProcessingContext:(id)a3 error:(id *)a4
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v57 = a3;
  [v57 resources];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v68 objects:v82 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v69;
    id v9 = &off_264BD9000;
    id v49 = v5;
    uint64_t v56 = self;
    uint64_t v46 = *(void *)v69;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v69 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        if ([(HDHealthRecordFindReferencesTask *)self _canProcessResource:v11])
        {
          id v12 = [(HDHealthRecordRuleset *)self->_ruleset rulesetForFHIRResourceObject:v11];
          if (!v12) {
            continue;
          }
          id v13 = v12;
          long long v67 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v64 = 0u;
          id obj = [v12 retrieveReferences];
          uint64_t v51 = [obj countByEnumeratingWithState:&v64 objects:v81 count:16];
          if (v51)
          {
            uint64_t v53 = *(void *)v65;
            uint64_t v45 = v7;
            uint64_t v47 = i;
            uint64_t v48 = v13;
            do
            {
              for (uint64_t j = 0; j != v51; ++j)
              {
                if (*(void *)v65 != v53) {
                  objc_enumerationMutation(obj);
                }
                id v15 = *(void **)(*((void *)&v64 + 1) + 8 * j);
                _HKInitializeLogging();
                uint64_t v16 = (void *)*MEMORY[0x263F09908];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEBUG))
                {
                  v35 = v16;
                  v36 = [(HDHealthRecordFindReferencesTask *)self debugDescription];
                  *(_DWORD *)buf = 138543874;
                  v74 = v36;
                  __int16 v75 = 2114;
                  os_log_t v76 = v15;
                  __int16 v77 = 2114;
                  __int16 v78 = v11;
                  _os_log_debug_impl(&dword_232E63000, v35, OS_LOG_TYPE_DEBUG, "%{public}@ processContainedResources: looking at %{public}@ in %{public}@", buf, 0x20u);
                }
                v17 = v9[78];
                uint64_t v18 = [v11 JSONObject];
                id v63 = 0;
                v19 = [v17 referencesAtKeyPath:v15 resourceDictionary:v18 error:&v63];
                id v20 = v63;

                if (v19)
                {
                  uint64_t v52 = v20;
                  uint64_t v50 = j;
                  long long v61 = 0u;
                  long long v62 = 0u;
                  long long v59 = 0u;
                  long long v60 = 0u;
                  id v21 = v19;
                  uint64_t v22 = [v21 countByEnumeratingWithState:&v59 objects:v72 count:16];
                  if (v22)
                  {
                    uint64_t v23 = v22;
                    uint64_t v24 = *(void *)v60;
                    while (2)
                    {
                      for (uint64_t k = 0; k != v23; ++k)
                      {
                        if (*(void *)v60 != v24) {
                          objc_enumerationMutation(v21);
                        }
                        uint64_t v26 = *(void *)(*((void *)&v59 + 1) + 8 * k);
                        id v58 = 0;
                        uint32_t v27 = [(HDHealthRecordFindReferencesTask *)self _resourceForReference:v26 containedInResource:v11 error:&v58];
                        id v28 = v58;
                        if (v27)
                        {
                          id v29 = (void *)[v27 copyWithOriginDataFrom:v11];
                          _HKInitializeLogging();
                          uint64_t v30 = (void *)*MEMORY[0x263F09908];
                          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEBUG))
                          {
                            uint64_t v32 = v30;
                            id v33 = [(HDHealthRecordFindReferencesTask *)v56 debugDescription];
                            *(_DWORD *)buf = 138543618;
                            v74 = v33;
                            __int16 v75 = 2114;
                            os_log_t v76 = v29;
                            _os_log_debug_impl(&dword_232E63000, v32, OS_LOG_TYPE_DEBUG, "%{public}@ processContainedResources: found contained resource %{public}@", buf, 0x16u);
                          }
                          int v31 = [v57 foundResource:v29 parentResource:v11 error:a4];

                          self = v56;
                          if (!v31)
                          {

                            BOOL v43 = 0;
                            id v5 = v49;
                            goto LABEL_41;
                          }
                        }
                      }
                      uint64_t v23 = [v21 countByEnumeratingWithState:&v59 objects:v72 count:16];
                      if (v23) {
                        continue;
                      }
                      break;
                    }
                  }

                  id v9 = &off_264BD9000;
                  uint64_t i = v47;
                  uint64_t j = v50;
                  id v20 = v52;
                }
                else
                {
                  _HKInitializeLogging();
                  uint64_t v34 = (void *)*MEMORY[0x263F09908];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
                  {
                    id v37 = v34;
                    v38 = [(HDHealthRecordFindReferencesTask *)self debugDescription];
                    uint64_t v39 = [v48 resourceName];
                    *(_DWORD *)buf = 138544130;
                    v74 = v38;
                    __int16 v75 = 2114;
                    os_log_t v76 = v15;
                    __int16 v77 = 2114;
                    __int16 v78 = v39;
                    __int16 v79 = 2114;
                    id v80 = v20;
                    _os_log_error_impl(&dword_232E63000, v37, OS_LOG_TYPE_ERROR, "%{public}@ processContainedResources: invalid reference at %{public}@ on %{public}@ resource: %{public}@", buf, 0x2Au);

                    self = v56;
                  }
                }
              }
              id v13 = v48;
              id v5 = v49;
              uint64_t v8 = v46;
              uint64_t v7 = v45;
              uint64_t v51 = [obj countByEnumeratingWithState:&v64 objects:v81 count:16];
            }
            while (v51);
          }
        }
        else
        {
          _HKInitializeLogging();
          v40 = (void *)*MEMORY[0x263F09908];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
            continue;
          }
          id v13 = v40;
          [(HDHealthRecordFindReferencesTask *)self debugDescription];
          uint64_t v42 = v41 = v7;
          *(_DWORD *)buf = 138543618;
          v74 = v42;
          __int16 v75 = 2114;
          os_log_t v76 = v11;
          _os_log_error_impl(&dword_232E63000, v13, OS_LOG_TYPE_ERROR, "%{public}@ processContainedResources: cannot process resource: %{public}@", buf, 0x16u);

          uint64_t v7 = v41;
          uint64_t v8 = v46;
          id v5 = v49;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v68 objects:v82 count:16];
      BOOL v43 = 1;
      if (!v7) {
        goto LABEL_41;
      }
    }
  }
  BOOL v43 = 1;
LABEL_41:

  return v43;
}

- (BOOL)_canProcessResource:(id)a3
{
  uint64_t v4 = [a3 FHIRVersion];
  id v5 = [v4 FHIRRelease];

  uint64_t v6 = [(HDHealthRecordRuleset *)self->_ruleset FHIRRelease];
  LOBYTE(self) = v5 == v6;

  return (char)self;
}

- (id)_filterResources:(id)a3
{
  uint64_t v3 = objc_msgSend(a3, "hk_filter:", &__block_literal_global_1);
  uint64_t v4 = (void *)v3;
  id v5 = (void *)MEMORY[0x263EFFA68];
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  return v6;
}

uint64_t __53__HDHealthRecordFindReferencesTask__filterResources___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 resourceType];
  uint64_t v4 = [v3 isEqualToString:@"OperationOutcome"] ^ 1;

  return v4;
}

- (BOOL)_isIrretrievableReference:(id)a3 serverBaseURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7
    && +[HDFHIRReferenceProcessor referenceIsAbsolute:v6])
  {
    uint64_t v8 = (void *)[objc_alloc(NSURL) initWithString:v6];
    BOOL v9 = v8 == 0;
    if (!v8)
    {
      _HKInitializeLogging();
      id v10 = (void *)*MEMORY[0x263F09908];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
        -[HDHealthRecordFindReferencesTask _isIrretrievableReference:serverBaseURL:](v10, self);
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_resourceReference:(id)a3 containedInResource:(id)a4
{
  id v11 = 0;
  id v5 = +[HDFHIRReferenceProcessor resourceContainedInResource:a4 reference:a3 error:&v11];
  id v6 = v11;
  id v7 = v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (!v8)
  {
    _HKInitializeLogging();
    BOOL v9 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      -[HDHealthRecordFindReferencesTask _resourceReference:containedInResource:](v9, self);
    }
  }

  return v5 != 0;
}

- (id)_resourceReference:(id)a3 presentInResources:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  id v8 = (id)v7;
  if (v7)
  {
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      id v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v10);
        id v12 = (void *)MEMORY[0x237DB67E0](v7);
        id v13 = objc_msgSend(v11, "identifier", (void)v16);
        BOOL v14 = +[HDFHIRReferenceProcessor reference:v5 matchesIdentifier:v13];

        if (v14)
        {
          id v8 = v11;
          goto LABEL_11;
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      id v8 = (id)v7;
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)_resourceForReference:(id)a3 containedInResource:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[HDFHIRReferenceProcessor resourceContainedInResource:v8 reference:v7 error:a5];
  if (v9
    && +[HDFHIRReferenceProcessor referenceRequiresContaining:v7])
  {
    id v10 = [v9 JSONObject];
    id v11 = (void *)[v10 mutableCopy];

    id v12 = +[HDFHIRReferenceProcessor identifierForResource:v9 containedInResource:v8 error:a5];
    if (v12)
    {
      id v13 = v12;
      BOOL v14 = [v12 identifier];
      [v11 setObject:v14 forKeyedSubscript:@"id"];

      id v15 = (void *)MEMORY[0x263F45C10];
      long long v16 = [v9 FHIRVersion];
      long long v17 = [v9 receivedDate];
      uint64_t v18 = [v15 resourceObjectWithJSONObject:v11 serverBaseURL:0 FHIRVersion:v16 receivedDate:v17 error:a5];

      uint64_t v9 = v11;
    }
    else
    {
      uint64_t v18 = 0;
      id v13 = v11;
    }

    uint64_t v9 = (void *)v18;
  }

  return v9;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  id v5 = [(HDHealthRecordRuleset *)self->_ruleset FHIRRelease];
  id v6 = (void *)[v3 initWithFormat:@"<%@ [%@]>", v4, v5];

  return v6;
}

- (void).cxx_destruct
{
}

- (void)processResourcesForReferenceExtractionRequest:(void *)a3 error:(void *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = [a3 debugDescription];
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_error_impl(&dword_232E63000, v7, OS_LOG_TYPE_ERROR, "%{public}@: can only process one Bundle per call, but received multiple; dropping",
    a1,
    0xCu);
}

- (void)_processedContainReferencesResourceWithResource:(uint8_t *)a1 processingContext:(void *)a2 rule:(void *)a3 allResources:(void *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = [a3 debugDescription];
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_debug_impl(&dword_232E63000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ containReferences: already contained", a1, 0xCu);
}

- (void)_isIrretrievableReference:(void *)a1 serverBaseURL:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 debugDescription];
  id v11 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_0_2(&dword_232E63000, v5, v6, "%{public}@ irretrievable reference, not a valid URL: %@", v7, v8, v9, v10, 2u);
}

- (void)_resourceReference:(void *)a1 containedInResource:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 debugDescription];
  OUTLINED_FUNCTION_0_2(&dword_232E63000, v5, v6, "%{public}@: error instantiating contained resource: %{public}@", v7, v8, v9, v10, 2u);
}

@end