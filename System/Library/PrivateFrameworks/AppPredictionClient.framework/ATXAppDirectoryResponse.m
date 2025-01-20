@interface ATXAppDirectoryResponse
- (ATXAppDirectoryCategory)hiddenAppsCategory;
- (ATXAppDirectoryResponse)initWithResponse:(id)a3 recentApps:(id)a4 hiddenApps:(id)a5 otherAppsOnScreen:(id)a6 numAppsToPredict:(unint64_t)a7 error:(id)a8;
- (ATXAppDirectoryResponse)initWithSuggestionLayout:(id)a3 recentApps:(id)a4 hiddenApps:(id)a5 otherAppsOnScreen:(id)a6 numAppsToPredict:(unint64_t)a7 error:(id)a8;
- (ATXAppDirectoryResponse)initWithoutDedupingForRecents:(id)a3 predictedApps:(id)a4 hiddenApps:(id)a5 error:(id)a6;
- (ATXResponse)response;
- (ATXSuggestionLayout)suggestionLayout;
- (NSArray)predictedApps;
- (NSArray)recentApps;
- (NSArray)recentAppsVisible;
- (NSError)error;
- (id)proactiveSuggestionForBundleId:(id)a3;
- (id)uuidForBundleId:(id)a3;
- (id)uuidsForBundleIds:(id)a3;
@end

@implementation ATXAppDirectoryResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionLayout, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_hiddenAppsCategory, 0);
  objc_storeStrong((id *)&self->_recentApps, 0);
  objc_storeStrong((id *)&self->_predictedApps, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_bundleIdToSuggestionMapping, 0);
}

- (ATXAppDirectoryResponse)initWithSuggestionLayout:(id)a3 recentApps:(id)a4 hiddenApps:(id)a5 otherAppsOnScreen:(id)a6 numAppsToPredict:(unint64_t)a7 error:(id)a8
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v72.receiver = self;
  v72.super_class = (Class)ATXAppDirectoryResponse;
  v19 = [(ATXAppDirectoryResponse *)&v72 init];
  v20 = v19;
  if (!v19) {
    goto LABEL_31;
  }
  objc_storeStrong((id *)&v19->_suggestionLayout, a3);
  uint64_t v21 = [v15 copy];
  recentApps = v20->_recentApps;
  v20->_recentApps = (NSArray *)v21;

  v23 = [[ATXAppDirectoryCategory alloc] initWithCategoryID:7 appBundleIDs:v16];
  hiddenAppsCategory = v20->_hiddenAppsCategory;
  v20->_hiddenAppsCategory = v23;

  v67 = objc_opt_new();
  v25 = (void *)CFPreferencesCopyAppValue(@"SuggestionsAppLibraryEnabled", @"com.apple.suggestions");
  if (v25)
  {
    v26 = v25;
    int v27 = [v25 BOOLValue];

    if (!v27)
    {
      uint64_t v49 = objc_opt_new();
      predictedApps = v20->_predictedApps;
      v20->_predictedApps = (NSArray *)v49;
      goto LABEL_24;
    }
  }
  id v57 = a8;
  id v58 = v18;
  id v59 = v17;
  v60 = v20;
  id v61 = v16;
  id v62 = v15;
  v65 = (NSArray *)objc_opt_new();
  context = (void *)MEMORY[0x1AD0D3C30]();
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v63 = v14;
  v28 = [v14 allSuggestionsInLayout];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v68 objects:v75 count:16];
  if (!v29) {
    goto LABEL_19;
  }
  uint64_t v30 = v29;
  uint64_t v31 = *(void *)v69;
  CFStringRef userName = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v32 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  do
  {
    for (uint64_t i = 0; i != v30; ++i)
    {
      if (*(void *)v69 != v31) {
        objc_enumerationMutation(v28);
      }
      v34 = *(void **)(*((void *)&v68 + 1) + 8 * i);
      v35 = [v34 executableSpecification];
      if ([v35 executableType] == 1)
      {
        v36 = [v34 executableSpecification];
        v37 = [v36 executableObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v39 = [v34 executableSpecification];
          uint64_t v40 = [v39 executableObject];

          v41 = (id)v40;
          v42 = (void *)CFPreferencesCopyValue(@"SBSearchSuggestAppDisabled", @"com.apple.spotlightui", userName, v32);
          LOBYTE(v40) = [v42 containsObject:v41];

          if ((v40 & 1) == 0) {
            [(NSArray *)v65 addObject:v41];
          }
          [v67 setObject:v34 forKey:v41];
          goto LABEL_17;
        }
      }
      else
      {
      }
      v41 = __atxlog_handle_app_library();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v74 = v34;
        _os_log_fault_impl(&dword_1A790D000, v41, OS_LOG_TYPE_FAULT, "ATXAppDirectoryResponse received suggestion that was not of type app: %@", buf, 0xCu);
      }
LABEL_17:
    }
    uint64_t v30 = [v28 countByEnumeratingWithState:&v68 objects:v75 count:16];
  }
  while (v30);
LABEL_19:

  v20 = v60;
  v43 = [(ATXAppDirectoryResponse *)v60 recentAppsVisible];
  predictedApps = v65;
  [(NSArray *)v65 removeObjectsInArray:v43];

  id v17 = v59;
  [(NSArray *)v65 removeObjectsInArray:v59];
  unint64_t v45 = [(NSArray *)v65 count];
  if (v45 >= a7) {
    unint64_t v46 = a7;
  }
  else {
    unint64_t v46 = v45;
  }
  uint64_t v47 = -[NSArray subarrayWithRange:](v65, "subarrayWithRange:", 0, v46);
  v48 = v60->_predictedApps;
  v60->_predictedApps = (NSArray *)v47;

  id v15 = v62;
  id v14 = v63;
  id v16 = v61;
  a8 = v57;
  id v18 = v58;
LABEL_24:

  uint64_t v50 = [v67 copy];
  bundleIdToSuggestionMapping = v20->_bundleIdToSuggestionMapping;
  v20->_bundleIdToSuggestionMapping = (NSDictionary *)v50;

  if (v18) {
    objc_storeStrong((id *)&v20->_error, a8);
  }
  p_error = (void **)&v20->_error;
  if (v20->_error)
  {
    v53 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      -[ATXAppDirectoryResponse initWithSuggestionLayout:recentApps:hiddenApps:otherAppsOnScreen:numAppsToPredict:error:]((uint64_t *)&v20->_error, v53);
    }

    v54 = *p_error;
    *p_error = 0;
  }
LABEL_31:

  return v20;
}

- (NSArray)recentAppsVisible
{
  recentApps = self->_recentApps;
  unint64_t v3 = [(NSArray *)recentApps count];
  if (v3 >= 4) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = v3;
  }

  return -[NSArray subarrayWithRange:](recentApps, "subarrayWithRange:", 0, v4);
}

- (NSArray)recentApps
{
  return self->_recentApps;
}

- (NSArray)predictedApps
{
  return self->_predictedApps;
}

- (ATXAppDirectoryCategory)hiddenAppsCategory
{
  return self->_hiddenAppsCategory;
}

- (NSError)error
{
  return self->_error;
}

- (ATXAppDirectoryResponse)initWithResponse:(id)a3 recentApps:(id)a4 hiddenApps:(id)a5 otherAppsOnScreen:(id)a6 numAppsToPredict:(unint64_t)a7 error:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  v44.receiver = self;
  v44.super_class = (Class)ATXAppDirectoryResponse;
  v20 = [(ATXAppDirectoryResponse *)&v44 init];
  uint64_t v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_response, a3);
    objc_storeStrong((id *)&v21->_recentApps, a4);
    v22 = [[ATXAppDirectoryCategory alloc] initWithCategoryID:7 appBundleIDs:v17];
    hiddenAppsCategory = v21->_hiddenAppsCategory;
    v21->_hiddenAppsCategory = v22;

    uint64_t v24 = objc_opt_new();
    bundleIdToSuggestionMapping = v21->_bundleIdToSuggestionMapping;
    v21->_bundleIdToSuggestionMapping = (NSDictionary *)v24;

    v26 = (void *)CFPreferencesCopyAppValue(@"SuggestionsAppLibraryEnabled", @"com.apple.suggestions");
    if (!v26) {
      goto LABEL_4;
    }
    int v27 = v26;
    int v28 = [v26 BOOLValue];

    if (!v28)
    {
      uint64_t v37 = objc_opt_new();
      predictedApps = v21->_predictedApps;
      v21->_predictedApps = (NSArray *)v37;
    }
    else
    {
LABEL_4:
      uint64_t v29 = [v15 predictedApps];
      predictedApps = objc_msgSend(v29, "_pas_filteredArrayWithTest:", &__block_literal_global_9);

      uint64_t v31 = (void *)[predictedApps mutableCopy];
      CFStringRef v32 = [(ATXAppDirectoryResponse *)v21 recentAppsVisible];
      [v31 removeObjectsInArray:v32];

      [v31 removeObjectsInArray:v18];
      unint64_t v33 = [v31 count];
      unint64_t v34 = v33 >= a7 ? a7 : v33;
      uint64_t v35 = objc_msgSend(v31, "subarrayWithRange:", 0, v34);
      v36 = v21->_predictedApps;
      v21->_predictedApps = (NSArray *)v35;
    }
    if (v19)
    {
      v38 = (NSError *)v19;
    }
    else
    {
      v38 = [v15 error];
    }
    error = v21->_error;
    v21->_error = v38;

    p_error = (void **)&v21->_error;
    if (v21->_error)
    {
      v41 = __atxlog_handle_app_library();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[ATXAppDirectoryResponse initWithSuggestionLayout:recentApps:hiddenApps:otherAppsOnScreen:numAppsToPredict:error:]((uint64_t *)&v21->_error, v41);
      }

      v42 = *p_error;
      *p_error = 0;
    }
  }

  return v21;
}

uint64_t __107__ATXAppDirectoryResponse_initWithResponse_recentApps_hiddenApps_otherAppsOnScreen_numAppsToPredict_error___block_invoke(uint64_t a1, void *a2)
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  id v4 = a2;
  v5 = (void *)CFPreferencesCopyValue(@"SBSearchSuggestAppDisabled", @"com.apple.spotlightui", v2, v3);
  LODWORD(v3) = [v5 containsObject:v4];

  return v3 ^ 1;
}

- (ATXAppDirectoryResponse)initWithoutDedupingForRecents:(id)a3 predictedApps:(id)a4 hiddenApps:(id)a5 error:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ATXAppDirectoryResponse;
  id v15 = [(ATXAppDirectoryResponse *)&v20 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_recentApps, a3);
    id v17 = [[ATXAppDirectoryCategory alloc] initWithCategoryID:7 appBundleIDs:v13];
    hiddenAppsCategory = v16->_hiddenAppsCategory;
    v16->_hiddenAppsCategory = v17;

    objc_storeStrong((id *)&v16->_predictedApps, a4);
    objc_storeStrong((id *)&v16->_error, a6);
  }

  return v16;
}

- (id)uuidsForBundleIds:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__ATXAppDirectoryResponse_uuidsForBundleIds___block_invoke;
  v5[3] = &unk_1E5D05DC0;
  v5[4] = self;
  CFStringRef v3 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v5);

  return v3;
}

id __45__ATXAppDirectoryResponse_uuidsForBundleIds___block_invoke(uint64_t a1, uint64_t a2)
{
  CFStringRef v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:a2];
  CFStringRef v3 = [v2 uuid];

  return v3;
}

- (id)uuidForBundleId:(id)a3
{
  CFStringRef v3 = [(NSDictionary *)self->_bundleIdToSuggestionMapping objectForKey:a3];
  id v4 = [v3 uuid];

  return v4;
}

- (id)proactiveSuggestionForBundleId:(id)a3
{
  return [(NSDictionary *)self->_bundleIdToSuggestionMapping objectForKey:a3];
}

- (ATXResponse)response
{
  return self->_response;
}

- (ATXSuggestionLayout)suggestionLayout
{
  return self->_suggestionLayout;
}

- (void)initWithSuggestionLayout:(uint64_t *)a1 recentApps:(NSObject *)a2 hiddenApps:otherAppsOnScreen:numAppsToPredict:error:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "ATXAppDirectoryResponse: Attempt to create a response with error %@. Scrubbing the error from the response to allow display of the error-free parts of the response", (uint8_t *)&v3, 0xCu);
}

@end