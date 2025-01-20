@interface ATXUserAppPreferenceDataSource
- (ATXUserAppPreferenceDataSource)initWithDevice:(id)a3;
- (BOOL)appSupportsParameterCombination:(id)a3 forIntent:(id)a4 forBundleId:(id)a5;
- (BOOL)parametersExistInValidCombinationsForParameters:(id)a3 andValidCombinations:(id)a4;
- (void)preferredAppForIntentName:(id)a3 andParameterCombination:(id)a4 callback:(id)a5;
- (void)preferredAppForIntentName:(id)a3 andParameterCombination:(id)a4 skipAppSchemaCheck:(BOOL)a5 callback:(id)a6;
@end

@implementation ATXUserAppPreferenceDataSource

- (ATXUserAppPreferenceDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXUserAppPreferenceDataSource;
  v6 = [(ATXUserAppPreferenceDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (BOOL)parametersExistInValidCombinationsForParameters:(id)a3 andValidCombinations:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v5];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = objc_msgSend(v6, "allKeys", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v13 + 1) + 8 * i) isEqualToSet:v7])
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (BOOL)appSupportsParameterCombination:(id)a3 forIntent:(id)a4 forBundleId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([MEMORY[0x1E4F4AF00] isSystemAppForBundleId:v10])
  {
    v11 = [v9 _parameterCombinations];
    BOOL v12 = [(ATXUserAppPreferenceDataSource *)self parametersExistInValidCombinationsForParameters:v8 andValidCombinations:v11];
  }
  else
  {
    v11 = [MEMORY[0x1E4F4AF00] schemaWithoutFallbackForBundle:v10];
    if (v11)
    {
      long long v13 = [v9 _className];
      long long v14 = [v11 _parameterCombinationsForClassName:v13];
      BOOL v12 = [(ATXUserAppPreferenceDataSource *)self parametersExistInValidCombinationsForParameters:v8 andValidCombinations:v14];
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (void)preferredAppForIntentName:(id)a3 andParameterCombination:(id)a4 callback:(id)a5
{
}

- (void)preferredAppForIntentName:(id)a3 andParameterCombination:(id)a4 skipAppSchemaCheck:(BOOL)a5 callback:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = (NSString *)a3;
  id v11 = a4;
  id v12 = a6;
  long long v13 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_1D0F43000, v13, OS_LOG_TYPE_INFO, "Looking for preferred app to handle %@ with parameter combination %@", buf, 0x16u);
  }

  long long v14 = objc_opt_new();
  Class v15 = NSClassFromString(v10);
  if (v15 && ([(objc_class *)v15 isSubclassOfClass:objc_opt_class()] & 1) != 0)
  {
    long long v16 = objc_opt_new();
    dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v49 = __Block_byref_object_copy_;
    v50 = __Block_byref_object_dispose_;
    id v51 = 0;
    uint64_t v18 = +[ATXIntentToAppBundleIdCache sharedInstance];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __112__ATXUserAppPreferenceDataSource_preferredAppForIntentName_andParameterCombination_skipAppSchemaCheck_callback___block_invoke;
    v40[3] = &unk_1E68A4C28;
    v46 = buf;
    v19 = v17;
    v41 = v19;
    BOOL v47 = a5;
    id v20 = v14;
    id v42 = v20;
    v43 = self;
    id v44 = v11;
    id v21 = v16;
    id v45 = v21;
    [v18 fetchBundleIdsForIntent:v21 completionHandler:v40];

    if ([MEMORY[0x1E4F93B18] waitForSemaphore:v19 timeoutSeconds:1.0] == 1
      || ![v20 count])
    {
      (*((void (**)(id, void, void))v12 + 2))(v12, 0, *(void *)(*(void *)&buf[8] + 40));
    }
    else if ([v20 count] == 1)
    {
      v22 = [v20 objectAtIndexedSubscript:0];
      (*((void (**)(id, void *, void))v12 + 2))(v12, v22, 0);
    }
    else
    {
      uint64_t v34 = 0;
      v35 = &v34;
      uint64_t v36 = 0x3032000000;
      v37 = __Block_byref_object_copy_;
      v38 = __Block_byref_object_dispose_;
      id v39 = 0;
      v30 = BiomeLibrary();
      v23 = [v30 App];
      v24 = [v23 Intent];
      v25 = objc_msgSend(v24, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 0, 0, 1);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __112__ATXUserAppPreferenceDataSource_preferredAppForIntentName_andParameterCombination_skipAppSchemaCheck_callback___block_invoke_19;
      v31[3] = &unk_1E68A4C70;
      id v26 = v20;
      id v32 = v26;
      v33 = &v34;
      id v27 = (id)[v25 sinkWithCompletion:&__block_literal_global shouldContinue:v31];

      v28 = (void *)v35[5];
      v29 = v28;
      if (!v28)
      {
        v29 = [v26 objectAtIndexedSubscript:0];
      }
      (*((void (**)(id, void *, void))v12 + 2))(v12, v29, 0);
      if (!v28) {

      }
      _Block_object_dispose(&v34, 8);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
  }
}

void __112__ATXUserAppPreferenceDataSource_preferredAppForIntentName_andParameterCombination_skipAppSchemaCheck_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    goto LABEL_22;
  }
  id v19 = v6;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [v5 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (!v8) {
    goto LABEL_20;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v21;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v21 != v10) {
        objc_enumerationMutation(v5);
      }
      uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v11);
      uint64_t v26 = v12;
      long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      int CanLearnFromApp = ATXHeuristicCanLearnFromApp(v13);

      if (CanLearnFromApp)
      {
        if (*(unsigned char *)(a1 + 80)) {
          goto LABEL_13;
        }
        int v15 = [*(id *)(a1 + 48) appSupportsParameterCombination:*(void *)(a1 + 56) forIntent:*(void *)(a1 + 64) forBundleId:v12];
        long long v16 = __atxlog_handle_heuristic();
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
        if (v15)
        {
          if (v17)
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v25 = v12;
            _os_log_impl(&dword_1D0F43000, v16, OS_LOG_TYPE_INFO, "Bundle ID %@ supports intent, adding it to candidate for user app preference.", buf, 0xCu);
          }

LABEL_13:
          [*(id *)(a1 + 40) addObject:v12];
          goto LABEL_14;
        }
        if (v17)
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v25 = v12;
          _os_log_impl(&dword_1D0F43000, v16, OS_LOG_TYPE_INFO, "Bundle ID %@ supports intent, but it does not support the specific parameter combination we want to predict.", buf, 0xCu);
        }
      }
LABEL_14:
      ++v11;
    }
    while (v9 != v11);
    uint64_t v18 = [v5 countByEnumeratingWithState:&v20 objects:v27 count:16];
    uint64_t v9 = v18;
  }
  while (v18);
LABEL_20:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v7 = v19;
LABEL_22:
}

void __112__ATXUserAppPreferenceDataSource_preferredAppForIntentName_andParameterCombination_skipAppSchemaCheck_callback___block_invoke_17(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    v4 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __112__ATXUserAppPreferenceDataSource_preferredAppForIntentName_andParameterCombination_skipAppSchemaCheck_callback___block_invoke_17_cold_1(v2, v4);
    }
  }
}

uint64_t __112__ATXUserAppPreferenceDataSource_preferredAppForIntentName_andParameterCombination_skipAppSchemaCheck_callback___block_invoke_19(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  v4 = [v3 bundleID];

  if (v4 && [*(id *)(a1 + 32) containsObject:v4])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

- (void).cxx_destruct
{
}

void __112__ATXUserAppPreferenceDataSource_preferredAppForIntentName_andParameterCombination_skipAppSchemaCheck_callback___block_invoke_17_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 error];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_ERROR, "Could not scan intent stream to determine most recently donated intent: %@", (uint8_t *)&v4, 0xCu);
}

@end