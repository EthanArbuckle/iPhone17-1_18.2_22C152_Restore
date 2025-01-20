@interface ATXFallbackActionsFeedback
+ (id)sharedInstance;
- (id)clientModelIds;
- (void)receiveUIFeedbackResult:(id)a3;
- (void)receiveUIFeedbackResult:(id)a3 histogramManager:(id)a4;
@end

@implementation ATXFallbackActionsFeedback

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_4 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_4, &__block_literal_global_37);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_5;
  return v2;
}

void __44__ATXFallbackActionsFeedback_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  v1 = objc_alloc_init(ATXFallbackActionsFeedback);
  v2 = (void *)sharedInstance__pasExprOnceResult_5;
  sharedInstance__pasExprOnceResult_5 = (uint64_t)v1;
}

- (id)clientModelIds
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:10];
  v4 = [v2 setWithObject:v3];

  return v4;
}

- (void)receiveUIFeedbackResult:(id)a3
{
  id v4 = a3;
  id v5 = +[_ATXAppLaunchHistogramManager sharedInstance];
  [(ATXFallbackActionsFeedback *)self receiveUIFeedbackResult:v4 histogramManager:v5];
}

- (void)receiveUIFeedbackResult:(id)a3 histogramManager:(id)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 histogramForLaunchType:90];
  v48 = v7;
  v9 = [v7 histogramForLaunchType:91];
  uint64_t v10 = [v6 context];
  if (v10
    && (v11 = (void *)v10,
        [v6 context],
        v12 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v12,
        v11,
        (isKindOfClass & 1) != 0))
  {
    v14 = [v6 context];
    v15 = [v14 timeContext];
    v16 = [v15 date];
  }
  else
  {
    v16 = objc_opt_new();
    v14 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[ATXFallbackActionsFeedback receiveUIFeedbackResult:histogramManager:]((uint64_t)self, (uint64_t)v6, v14);
    }
  }

  v17 = [v6 shownSuggestions];
  v18 = +[_ATXActionUtils atxActionsFromProactiveSuggestions:v17];
  v19 = (void *)[v18 mutableCopy];

  v49 = v6;
  v20 = [v6 engagedSuggestions];
  v21 = +[_ATXActionUtils atxActionsFromProactiveSuggestions:v20];

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v22 = v21;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v58 objects:v72 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v59;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v59 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = [*(id *)(*((void *)&v58 + 1) + 8 * v26) actionKey];
        LODWORD(v28) = 1.0;
        [v8 addLaunchWithBundleId:v27 date:v16 timeZone:0 weight:v28];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v58 objects:v72 count:16];
    }
    while (v24);
  }

  [v19 removeObjectsInArray:v22];
  v29 = [v49 rejectedSuggestions];
  v30 = +[_ATXActionUtils atxActionsFromProactiveSuggestions:v29];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v31 = v30;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v54 objects:v71 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v55;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v55 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = [*(id *)(*((void *)&v54 + 1) + 8 * v35) actionKey];
        LODWORD(v37) = 3.0;
        [v9 addLaunchWithBundleId:v36 date:v16 timeZone:0 weight:v37];

        ++v35;
      }
      while (v33 != v35);
      uint64_t v33 = [v31 countByEnumeratingWithState:&v54 objects:v71 count:16];
    }
    while (v33);
  }

  [v19 removeObjectsInArray:v31];
  id v38 = v19;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v50 objects:v70 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v51;
    do
    {
      uint64_t v42 = 0;
      do
      {
        if (*(void *)v51 != v41) {
          objc_enumerationMutation(v38);
        }
        v43 = [*(id *)(*((void *)&v50 + 1) + 8 * v42) actionKey];
        LODWORD(v44) = 1.0;
        [v9 addLaunchWithBundleId:v43 date:v16 timeZone:0 weight:v44];

        ++v42;
      }
      while (v40 != v42);
      uint64_t v40 = [v38 countByEnumeratingWithState:&v50 objects:v70 count:16];
    }
    while (v40);
  }
  v45 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v46 = (objc_class *)objc_opt_class();
    v47 = NSStringFromClass(v46);
    *(_DWORD *)buf = 138413058;
    v63 = v47;
    __int16 v64 = 2112;
    id v65 = v22;
    __int16 v66 = 2112;
    id v67 = v31;
    __int16 v68 = 2112;
    id v69 = v38;
    _os_log_impl(&dword_1D0FA3000, v45, OS_LOG_TYPE_DEFAULT, "%@ - feedback for fallback actions processed - Engaged: %@\nExpl Rejected: %@\n Impl Rejected: %@", buf, 0x2Au);
  }
}

- (void)receiveUIFeedbackResult:(NSObject *)a3 histogramManager:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_fault_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_FAULT, "%@ - could not find time context in result: %@", (uint8_t *)&v7, 0x16u);
}

@end