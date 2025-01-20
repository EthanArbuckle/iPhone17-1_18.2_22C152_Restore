@interface ATXInformationFilter
+ (int64_t)chsFamilyForTimelineRelevanceSuggestionLayoutOptions:(unint64_t)a3;
- (ATXInformationFilter)initWithStore:(id)a3 abuseControlConfig:(id)a4;
- (ATXInformationFilter)initWithStore:(id)a3 abuseControlConfig:(id)a4 histogram:(id)a5 digitalHealthBlockList:(id)a6;
- (BOOL)_canSuggestionPassAppLaunchCheck:(id)a3;
- (BOOL)_isFirstPartyApp:(id)a3;
- (BOOL)_isSuggestionBlockedByDismiss:(id)a3 withGuardedData:(id)a4;
- (BOOL)_shouldBlockTimelineSuggestion:(id)a3 updatingAbuseControlOutcomes:(id)a4;
- (BOOL)shouldDisableRandomization:(id)a3;
- (BOOL)stalenessRotationsAreEnabled:(id)a3;
- (id)_fetchAppLaunchCountForBundleId:(id)a3;
- (id)filterInfoSuggestions:(id)a3;
- (int64_t)_numberOfSeenRotationsForSuggestion:(id)a3;
- (int64_t)numberOfSeenRotationsForWidget:(id)a3 kind:(id)a4 intent:(id)a5 filterByClientModelId:(id)a6;
- (void)_demoteFirstPartyDonatedSuggestionIfNecessary:(id)a3;
- (void)_populateDismissRecordsCacheAsynchronously;
- (void)_removeExpiredDismissRecordsAsynchronously;
- (void)recordDismissOfSuggestion:(id)a3 isDismissalLongTerm:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation ATXInformationFilter

- (ATXInformationFilter)initWithStore:(id)a3 abuseControlConfig:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[ATXDigitalHealthBlacklist sharedInstance];
  v9 = [(ATXInformationFilter *)self initWithStore:v7 abuseControlConfig:v6 histogram:0 digitalHealthBlockList:v8];

  return v9;
}

- (ATXInformationFilter)initWithStore:(id)a3 abuseControlConfig:(id)a4 histogram:(id)a5 digitalHealthBlockList:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v33.receiver = self;
  v33.super_class = (Class)ATXInformationFilter;
  v15 = [(ATXInformationFilter *)&v33 init];
  if (v15)
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    id v17 = objc_claimAutoreleasedReturnValue();
    id v32 = v11;
    v18 = (const char *)[v17 UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id obj = a6;
    id v19 = v14;
    id v20 = v13;
    v22 = id v21 = v12;
    dispatch_queue_t v23 = dispatch_queue_create(v18, v22);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v23;

    id v12 = v21;
    id v13 = v20;
    id v14 = v19;

    uint64_t v25 = objc_opt_new();
    appLaunchCountsByBundleId = v15->_appLaunchCountsByBundleId;
    v15->_appLaunchCountsByBundleId = (NSCache *)v25;

    objc_storeStrong((id *)&v15->_store, a3);
    objc_storeStrong((id *)&v15->_abuseControlConfig, a4);
    objc_storeStrong((id *)&v15->_histogram, a5);
    objc_storeStrong((id *)&v15->_digitalHealthBlockList, obj);
    v27 = objc_opt_new();
    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F93B80]) initWithGuardedData:v27 serialQueue:v15->_queue];
    lock = v15->_lock;
    v15->_lock = (_PASQueueLock *)v28;

    [(ATXInformationFilter *)v15 _populateDismissRecordsCacheAsynchronously];
    id v11 = v32;
  }

  return v15;
}

- (void)recordDismissOfSuggestion:(id)a3 isDismissalLongTerm:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__ATXInformationFilter_recordDismissOfSuggestion_isDismissalLongTerm_completionHandler___block_invoke;
  v13[3] = &unk_1E68ABBC0;
  BOOL v17 = a4;
  id v14 = v8;
  v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v13];
}

void __88__ATXInformationFilter_recordDismissOfSuggestion_isDismissalLongTerm_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v3 = a2;
  double v4 = dbl_1D142B050[*(unsigned char *)(a1 + 56) == 0];
  id v5 = objc_alloc(MEMORY[0x1E4F4B0E0]);
  id v6 = (id *)(a1 + 32);
  id v7 = [*(id *)(a1 + 32) widgetBundleIdentifier];
  id v8 = [*(id *)(a1 + 32) criterion];
  id v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v4];
  v10 = [*(id *)(a1 + 32) endDate];
  id v11 = (void *)[v5 initWithWidgetBundleId:v7 criterion:v8 blockWidgetUntilDate:v9 blockCriterionUntilDate:v10];

  if ([*(id *)(*(void *)(a1 + 40) + 32) appendDismissRecord:v11])
  {
    id v12 = (void *)v3[1];
    id v13 = [*v6 widgetBundleIdentifier];
    id v14 = [v12 objectForKeyedSubscript:v13];

    if (!v14)
    {
      v15 = objc_opt_new();
      id v16 = (void *)v3[1];
      BOOL v17 = [*v6 widgetBundleIdentifier];
      [v16 setObject:v15 forKeyedSubscript:v17];
    }
    v18 = (void *)v3[1];
    id v19 = [*v6 widgetBundleIdentifier];
    id v20 = [v18 objectForKeyedSubscript:v19];
    [v20 addObject:v11];

    id v21 = 0;
  }
  else
  {
    v22 = __atxlog_handle_gi();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __88__ATXInformationFilter_recordDismissOfSuggestion_isDismissalLongTerm_completionHandler___block_invoke_cold_1((id *)(a1 + 32), v22);
    }

    id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32[0] = @"failed to insert dismiss record into DB.";
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    id v21 = (void *)[v23 initWithDomain:@"ATXInformationFilterError" code:-1 userInfo:v24];
  }
  uint64_t v25 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__ATXInformationFilter_recordDismissOfSuggestion_isDismissalLongTerm_completionHandler___block_invoke_35;
  block[3] = &unk_1E68ABB98;
  id v26 = *(id *)(a1 + 48);
  id v29 = v21;
  id v30 = v26;
  id v27 = v21;
  dispatch_async(v25, block);
}

uint64_t __88__ATXInformationFilter_recordDismissOfSuggestion_isDismissalLongTerm_completionHandler___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)filterInfoSuggestions:(id)a3
{
  id v4 = a3;
  id v5 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ATXInformationFilter filterInfoSuggestions:]((uint64_t)self, v5);
  }

  id v6 = objc_opt_new();
  id v7 = objc_opt_new();
  lock = self->_lock;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  BOOL v17 = __46__ATXInformationFilter_filterInfoSuggestions___block_invoke;
  v18 = &unk_1E68ABBE8;
  id v19 = self;
  id v20 = v4;
  id v9 = v6;
  id v21 = v9;
  v22 = v7;
  id v10 = v7;
  id v11 = v4;
  [(_PASQueueLock *)lock runWithLockAcquired:&v15];
  [(ATXInformationFilter *)self _removeExpiredDismissRecordsAsynchronously];
  [(ATXInformationStore *)self->_store updateEndDateForInfoSuggestions:v10];
  id v12 = v22;
  id v13 = v9;

  return v13;
}

void __46__ATXInformationFilter_filterInfoSuggestions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:19];
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v6 = [*(id *)(*(void *)(a1 + 32) + 40) denyList];
  v115 = (void *)[v5 initWithArray:v6];

  v129 = [*(id *)(*(void *)(a1 + 32) + 56) blacklistedBundleIds];
  v114 = objc_opt_new();
  v117 = objc_opt_new();
  context = objc_opt_new();
  uint64_t v132 = a1;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v141 objects:v159 count:16];
  v116 = v3;
  v121 = (void *)v4;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v142;
    id v125 = v7;
    uint64_t v127 = *(void *)v142;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v142 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v141 + 1) + 8 * i);
        id v13 = (void *)MEMORY[0x1D25F6CC0]();
        id v14 = [v12 appBundleIdentifier];
        int v15 = [v129 containsObject:v14];

        if (v15)
        {
          uint64_t v16 = (void *)MEMORY[0x1E4F939E0];
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          BOOL v17 = v16;
          v18 = v12;
          uint64_t v19 = 22;
LABEL_10:
          id v21 = objc_msgSend(v17, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v18, v19);
          [context addObject:v21];
          goto LABEL_33;
        }
        if ([*(id *)(v132 + 32) _isSuggestionBlockedByDismiss:v12 withGuardedData:v3])
        {
          id v20 = (void *)MEMORY[0x1E4F939E0];
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          BOOL v17 = v20;
          v18 = v12;
          uint64_t v19 = 1;
          goto LABEL_10;
        }
        v22 = [v12 clientModelId];
        int v23 = [v22 isEqualToString:v4];

        if (!v23)
        {
          [*(id *)(v132 + 32) _demoteFirstPartyDonatedSuggestionIfNecessary:v12];
          id v28 = [NSString alloc];
          id v29 = [v12 widgetBundleIdentifier];
          id v30 = [v12 widgetKind];
          uint64_t v31 = [v12 layouts];
          id v32 = [v12 intent];
          id v21 = (void *)[v28 initWithFormat:@"%@.%@.%lu.%lld.%ld", v29, v30, v31, objc_msgSend(v32, "atx_indexingHash"), objc_msgSend(v12, "confidenceLevel")];

          objc_super v33 = [v117 objectForKeyedSubscript:v21];
          if (v33)
          {
            v34 = (void *)MEMORY[0x1E4F939E0];
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            v35 = objc_msgSend(v34, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v33, 5);
            [context addObject:v35];
          }
          [v117 setObject:v12 forKeyedSubscript:v21];

          id v3 = v116;
          uint64_t v4 = (uint64_t)v121;
          id v7 = v125;
          goto LABEL_32;
        }
        id v24 = [NSString alloc];
        uint64_t v25 = [v12 widgetBundleIdentifier];
        id v26 = [v12 widgetKind];
        id v21 = (void *)[v24 initWithFormat:@"%@.%@", v25, v26];

        id v27 = [v12 widgetBundleIdentifier];
        if ([v115 containsObject:v27])
        {
        }
        else
        {
          char v36 = [v115 containsObject:v21];

          if ((v36 & 1) == 0)
          {
            v39 = [v12 sourceIdentifier];
            v40 = [v114 objectForKeyedSubscript:v39];

            if (v40)
            {
              v41 = *(void **)(*(void *)(v132 + 32) + 32);
              v42 = [v40 suggestionIdentifier];
              int v43 = [v41 rotationExistsForSuggestionWithId:v42 considerStalenessRotation:0];

              uint64_t v44 = *(void *)(v132 + 32);
              v45 = *(void **)(v44 + 32);
              if (v43)
              {
                v46 = [v40 suggestionIdentifier];
                int v47 = [v45 didSuggestionReachDurationLimit:v46];

                v48 = (void *)MEMORY[0x1E4F939E0];
                [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
                if (v47)
                {
                  v49 = objc_msgSend(v48, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v40, 3);
                  [context addObject:v49];

                  v50 = [v12 sourceIdentifier];
                  [v114 setObject:v12 forKeyedSubscript:v50];
                }
                else
                {
                  v50 = objc_msgSend(v48, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v12, 4);
                  [context addObject:v50];
                }
                id v7 = v125;
              }
              else
              {
                v51 = [*(id *)(v44 + 32) firstTimeAtWhichSuggestionPassedTimelineFilters:v40];

                id v7 = v125;
                if (v51)
                {
                  v52 = (void *)MEMORY[0x1E4F939E0];
                  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
                  v53 = v52;
                  v54 = v12;
                  uint64_t v55 = 4;
                }
                else
                {
                  v56 = [v12 sourceIdentifier];
                  [v114 setObject:v12 forKeyedSubscript:v56];

                  v57 = (void *)MEMORY[0x1E4F939E0];
                  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
                  v53 = v57;
                  v54 = v40;
                  uint64_t v55 = 5;
                }
                v50 = objc_msgSend(v53, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v54, v55);
                [context addObject:v50];
              }
              uint64_t v4 = (uint64_t)v121;
            }
            else
            {
              v50 = [v12 sourceIdentifier];
              [v114 setObject:v12 forKeyedSubscript:v50];
            }

            id v3 = v116;
            goto LABEL_32;
          }
        }
        v37 = (void *)MEMORY[0x1E4F939E0];
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        v38 = objc_msgSend(v37, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v12, 2);
        [context addObject:v38];

LABEL_32:
        uint64_t v10 = v127;
LABEL_33:
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v141 objects:v159 count:16];
    }
    while (v9);
  }

  v58 = *(void **)(v132 + 48);
  v59 = [v117 allValues];
  [v58 addObjectsFromArray:v59];

  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  v60 = [v114 allValues];
  uint64_t v61 = [v60 countByEnumeratingWithState:&v137 objects:v158 count:16];
  if (!v61) {
    goto LABEL_60;
  }
  uint64_t v62 = v61;
  uint64_t v63 = *(void *)v138;
  CFStringRef v64 = (const __CFString *)*MEMORY[0x1E4F4B688];
  do
  {
    for (uint64_t j = 0; j != v62; ++j)
    {
      if (*(void *)v138 != v63) {
        objc_enumerationMutation(v60);
      }
      v66 = *(void **)(*((void *)&v137 + 1) + 8 * j);
      v67 = (void *)MEMORY[0x1D25F6CC0]();
      id v68 = [v66 widgetBundleIdentifier];
      if (CFPreferencesGetAppBooleanValue(@"widgetKitDeveloperModeEnabled", @"com.apple.duetexpertd", 0))
      {
        keyExistsAndHasValidFormat[0] = 0;
        if (CFPreferencesGetAppBooleanValue(@"ATXWidgetKitDeveloperModeSkipEntitlementCheck", v64, keyExistsAndHasValidFormat))
        {

LABEL_45:
          v70 = __atxlog_handle_timeline();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)keyExistsAndHasValidFormat = 0;
            _os_log_impl(&dword_1D0FA3000, v70, OS_LOG_TYPE_DEFAULT, "ATXInformationFilter: WidgetKit Developer Mode is enabled and debug is allowed for widget; bypassing abuse control",
              keyExistsAndHasValidFormat,
              2u);
          }

          [*(id *)(v132 + 48) addObject:v66];
          v71 = (void *)MEMORY[0x1E4F939E0];
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          v72 = objc_msgSend(v71, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v66, 14);
          [context addObject:v72];

          goto LABEL_58;
        }
        int v69 = [MEMORY[0x1E4F4AEF8] isDebuggingAllowedForExtensionBundleId:v68];

        if (v69) {
          goto LABEL_45;
        }
      }
      else
      {
      }
      if (([*(id *)(v132 + 32) _shouldBlockTimelineSuggestion:v66 updatingAbuseControlOutcomes:context] & 1) == 0)
      {
        v75 = [v66 endDate];
        v76 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:3153600000.0];
        int v77 = [v75 isEqualToDate:v76];

        if (v77)
        {
          v78 = [v66 startDate];
          uint64_t v79 = v132;
          unint64_t v80 = [*(id *)(*(void *)(v132 + 32) + 40) defaultDurationForTimelineSuggestions];
          goto LABEL_56;
        }
LABEL_57:
        [*(id *)(v132 + 48) addObject:v66];
        goto LABEL_58;
      }
      v73 = [v66 relevanceScore];
      [v73 doubleValue];
      if (v74 < 2.22044605e-16)
      {

        goto LABEL_58;
      }
      int v81 = [*(id *)(v132 + 32) stalenessRotationsAreEnabled:v66];

      if (v81)
      {
        [v66 setConfidenceLevel:1];
        v82 = [v66 endDate];
        v83 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:3153600000.0];
        int v84 = [v82 isEqualToDate:v83];

        if (v84)
        {
          v78 = [v66 startDate];
          uint64_t v79 = v132;
          unint64_t v80 = [*(id *)(*(void *)(v132 + 32) + 40) defaultDurationForFallbackTimelineSuggestions];
LABEL_56:
          v85 = [v78 dateByAddingTimeInterval:(double)v80];
          [v66 setEndDate:v85];

          [*(id *)(v79 + 56) addObject:v66];
        }
        goto LABEL_57;
      }
LABEL_58:
    }
    uint64_t v62 = [v60 countByEnumeratingWithState:&v137 objects:v158 count:16];
  }
  while (v62);
LABEL_60:

  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id obj = context;
  uint64_t v86 = [obj countByEnumeratingWithState:&v133 objects:v157 count:16];
  v87 = v121;
  v88 = v115;
  if (v86)
  {
    uint64_t v89 = v86;
    v90 = 0;
    uint64_t v91 = *(void *)v134;
    uint64_t v118 = *(void *)v134;
    while (1)
    {
      uint64_t v92 = 0;
      uint64_t v119 = v89;
      do
      {
        v93 = v90;
        if (*(void *)v134 != v91) {
          objc_enumerationMutation(obj);
        }
        v94 = *(void **)(*((void *)&v133 + 1) + 8 * v92);
        contexta = (void *)MEMORY[0x1D25F6CC0]();
        v95 = [v94 suggestion];
        v96 = [v95 clientModelId];
        int v97 = [v96 isEqualToString:v87];

        if (v97)
        {
          v90 = __atxlog_handle_timeline();

          v98 = *(void **)(*(void *)(v132 + 32) + 32);
          v99 = [v94 suggestion];
          v100 = [v99 suggestionIdentifier];
          uint64_t v101 = [v98 mostRecentAbuseControlOutcomeForSuggestionId:v100];

          if (v101 == [v94 abuseControlOutcome]) {
            goto LABEL_72;
          }
          v102 = __atxlog_handle_timeline();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)keyExistsAndHasValidFormat = 0;
            _os_log_impl(&dword_1D0FA3000, v102, OS_LOG_TYPE_DEFAULT, "ATXInformationFilter: Abuse Control Outcome for timeline suggestion has changed", keyExistsAndHasValidFormat, 2u);
          }

          v103 = *(void **)(*(void *)(v132 + 32) + 32);
          v93 = [v94 suggestion];
          v104 = [v93 suggestionIdentifier];
          [v94 timestamp];
          objc_msgSend(v103, "addAbuseControlOutcomeForSuggestion:forTimestamp:outcome:", v104, (uint64_t)v105, objc_msgSend(v94, "abuseControlOutcome"));
        }
        else
        {
          v90 = __atxlog_handle_gi();
        }

LABEL_72:
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          v106 = v90;
          v126 = [v94 suggestion];
          v122 = [v126 suggestionIdentifier];
          v124 = [v94 suggestion];
          v107 = [v124 sourceIdentifier];
          v123 = [v94 suggestion];
          [v123 widgetBundleIdentifier];
          v108 = v128 = v90;
          v109 = [v94 suggestion];
          v110 = [v109 startDate];
          v111 = [v94 suggestion];
          v112 = [v111 endDate];
          v113 = objc_msgSend(MEMORY[0x1E4F939E0], "descriptionForOutcome:", objc_msgSend(v94, "abuseControlOutcome"));
          *(_DWORD *)keyExistsAndHasValidFormat = 138544642;
          v146 = v122;
          __int16 v147 = 2112;
          v148 = v107;
          __int16 v149 = 2112;
          v150 = v108;
          __int16 v151 = 2112;
          v152 = v110;
          __int16 v153 = 2112;
          v154 = v112;
          __int16 v155 = 2114;
          v156 = v113;
          _os_log_impl(&dword_1D0FA3000, v106, OS_LOG_TYPE_DEFAULT, "ATXInformationFilter: Abuse Control Outcome for timeline suggestion [suggestionId: %{public}@, src:%@, widget:%@, startDate:%@, endDate:%@] with reason: %{public}@.", keyExistsAndHasValidFormat, 0x3Eu);

          uint64_t v91 = v118;
          uint64_t v89 = v119;
          v87 = v121;

          v90 = v128;
        }
        ++v92;
      }
      while (v89 != v92);
      uint64_t v89 = [obj countByEnumeratingWithState:&v133 objects:v157 count:16];
      if (!v89)
      {

        v88 = v115;
        break;
      }
    }
  }
}

- (BOOL)_canSuggestionPassAppLaunchCheck:(id)a3
{
  uint64_t v4 = [a3 appBundleIdentifier];
  id v5 = [(NSCache *)self->_appLaunchCountsByBundleId objectForKey:v4];
  if ([(ATXInformationFilter *)self _isFirstPartyApp:v4]) {
    double v6 = 3.0;
  }
  else {
    double v6 = 8.0;
  }
  if (v5 && ([v5 doubleValue], v7 >= v6)
    || ([(ATXInformationFilter *)self _fetchAppLaunchCountForBundleId:v4],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v5,
        [(NSCache *)self->_appLaunchCountsByBundleId setObject:v8 forKey:v4],
        (id v5 = (void *)v8) != 0))
  {
    [v5 doubleValue];
    BOOL v10 = v9 >= v6;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)_fetchAppLaunchCountForBundleId:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  histogram = self->_histogram;
  if (!histogram)
  {
    double v6 = +[_ATXAppLaunchHistogramManager sharedInstance];
    double v7 = [v6 histogramForLaunchType:0];
    uint64_t v8 = self->_histogram;
    self->_histogram = v7;

    histogram = self->_histogram;
  }
  double v9 = NSNumber;
  v13[0] = v4;
  BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [(_ATXAppLaunchHistogram *)histogram totalLaunchesForBundleIds:v10];
  id v11 = objc_msgSend(v9, "numberWithDouble:");

  return v11;
}

- (BOOL)_isFirstPartyApp:(id)a3
{
  id v3 = [a3 lowercaseString];
  if ([MEMORY[0x1E4F4AF00] isSystemAppForBundleId:v3]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 hasPrefix:@"com.apple."];
  }

  return v4;
}

- (void)_populateDismissRecordsCacheAsynchronously
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__ATXInformationFilter__populateDismissRecordsCacheAsynchronously__block_invoke;
  v3[3] = &unk_1E68ABC10;
  v3[4] = self;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v3];
}

void __66__ATXInformationFilter__populateDismissRecordsCacheAsynchronously__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [*(id *)(*(void *)(a1 + 32) + 32) readAllDismissRecords];
  id v5 = v4;
  if (v4)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          BOOL v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v11 = (void *)v3[1];
          id v12 = [v10 widgetBundleId];
          id v13 = [v11 objectForKeyedSubscript:v12];

          if (!v13)
          {
            id v14 = objc_opt_new();
            int v15 = (void *)v3[1];
            uint64_t v16 = [v10 widgetBundleId];
            [v15 setObject:v14 forKeyedSubscript:v16];
          }
          BOOL v17 = (void *)v3[1];
          v18 = [v10 widgetBundleId];
          uint64_t v19 = [v17 objectForKeyedSubscript:v18];
          [v19 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v20 = __atxlog_handle_gi();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __66__ATXInformationFilter__populateDismissRecordsCacheAsynchronously__block_invoke_cold_1();
    }
  }
}

- (void)_removeExpiredDismissRecordsAsynchronously
{
}

void __66__ATXInformationFilter__removeExpiredDismissRecordsAsynchronously__block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  id v3 = objc_opt_new();
  char v4 = (void *)v2[1];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__ATXInformationFilter__removeExpiredDismissRecordsAsynchronously__block_invoke_2;
  v6[3] = &unk_1E68ABC80;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __66__ATXInformationFilter__removeExpiredDismissRecordsAsynchronously__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  double v9 = __66__ATXInformationFilter__removeExpiredDismissRecordsAsynchronously__block_invoke_3;
  BOOL v10 = &unk_1E68ABC58;
  id v11 = *(id *)(a1 + 32);
  id v12 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:&v7];
  objc_msgSend(v4, "removeObjectsAtIndexes:", v6, v7, v8, v9, v10);
}

void __66__ATXInformationFilter__removeExpiredDismissRecordsAsynchronously__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v13 = v5;
  uint64_t v7 = [v5 blockWidgetUntilDate];
  uint64_t v8 = [v6 laterDate:v7];
  double v9 = v8;
  if (v8 == *(void **)(a1 + 32))
  {
    BOOL v10 = [v13 blockCriterionUntilDate];
    id v11 = [v9 laterDate:v10];
    id v12 = *(void **)(a1 + 32);

    if (v11 == v12) {
      [*(id *)(a1 + 40) addIndex:a3];
    }
  }
  else
  {
  }
}

- (BOOL)_isSuggestionBlockedByDismiss:(id)a3 withGuardedData:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)*((void *)a4 + 1);
  uint64_t v7 = [v5 widgetBundleIdentifier];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    double v9 = [MEMORY[0x1E4F1C9C8] date];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      long long v23 = v8;
      uint64_t v12 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          int v15 = [v14 blockWidgetUntilDate];
          uint64_t v16 = [v9 earlierDate:v15];

          if (v16 == v9)
          {
LABEL_14:
            LOBYTE(v11) = 1;
            goto LABEL_15;
          }
          BOOL v17 = [v14 blockCriterionUntilDate];
          v18 = [v9 earlierDate:v17];
          if (v18 == v9)
          {
            uint64_t v19 = [v5 criterion];
            id v20 = [v14 criterion];
            char v21 = [v19 isEqualToString:v20];

            if (v21) {
              goto LABEL_14;
            }
          }
          else
          {
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v11) {
          continue;
        }
        break;
      }
LABEL_15:
      uint64_t v8 = v23;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (void)_demoteFirstPartyDonatedSuggestionIfNecessary:(id)a3
{
  id v10 = a3;
  id v4 = [v10 appBundleIdentifier];
  if ([v4 isEqualToString:@"com.apple.mobileslideshow"])
  {
  }
  else
  {
    id v5 = [v10 appBundleIdentifier];
    int v6 = [v5 isEqualToString:@"com.apple.news"];

    uint64_t v7 = v10;
    if (!v6) {
      goto LABEL_6;
    }
  }
  store = self->_store;
  double v9 = [v10 suggestionIdentifier];
  LODWORD(store) = [(ATXInformationStore *)store didSuggestionReachDurationLimit:v9];

  uint64_t v7 = v10;
  if (store)
  {
    [v10 setConfidenceLevel:1];
    uint64_t v7 = v10;
  }
LABEL_6:
}

- (BOOL)shouldDisableRandomization:(id)a3
{
  id v4 = a3;
  abuseControlConfig = self->_abuseControlConfig;
  int v6 = [v4 widgetBundleIdentifier];
  uint64_t v7 = [v4 widgetKind];
  int v8 = [(ATXTimelineAbuseControlConfig *)abuseControlConfig randomizationDisabledForWidgetWithIdentifier:v6 kind:v7];

  if (v8)
  {
    store = self->_store;
    id v10 = [v4 widgetBundleIdentifier];
    uint64_t v11 = [v4 widgetKind];
    uint64_t v12 = [(ATXInformationStore *)store distinctScoresForWidget:v10 kind:v11];

    if ((unint64_t)[v12 count] < 2)
    {
      LOBYTE(v8) = 0;
    }
    else
    {
      id v13 = [v4 relevanceScore];
      id v14 = [v12 objectAtIndexedSubscript:0];
      int v8 = [v13 isEqualToNumber:v14] ^ 1;
    }
  }

  return v8;
}

- (BOOL)stalenessRotationsAreEnabled:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  abuseControlConfig = self->_abuseControlConfig;
  int v6 = [v4 widgetBundleIdentifier];
  uint64_t v7 = [v4 widgetKind];
  BOOL v8 = [(ATXTimelineAbuseControlConfig *)abuseControlConfig stalenessDisabledForWidgetWithIdentifier:v6 kind:v7];

  if (v8)
  {
    double v9 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [v4 widgetBundleIdentifier];
      uint64_t v11 = [v4 widgetKind];
      int v13 = 138412546;
      id v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "ATXInformationFilter: Staleness rotations are not enabled for widget with bundleId: %@, widget kind: %@", (uint8_t *)&v13, 0x16u);
    }
  }

  return !v8;
}

- (int64_t)_numberOfSeenRotationsForSuggestion:(id)a3
{
  id v4 = a3;
  id v5 = [v4 widgetBundleIdentifier];
  int v6 = [v4 widgetKind];
  uint64_t v7 = [v4 intent];

  BOOL v8 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:19];
  int64_t v9 = [(ATXInformationFilter *)self numberOfSeenRotationsForWidget:v5 kind:v6 intent:v7 filterByClientModelId:v8];

  return v9;
}

- (int64_t)numberOfSeenRotationsForWidget:(id)a3 kind:(id)a4 intent:(id)a5 filterByClientModelId:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(ATXInformationStore *)self->_store engagementTimestampsForExtensionBundleId:v10 kind:v11 intent:v12 engagementType:3];
  if ([v14 count])
  {
    id v31 = v11;
    id v32 = v10;
    id v29 = v13;
    id v30 = v12;
    [(ATXInformationStore *)self->_store proactiveRotationsForWidgetInThePastDay:v10 kind:v11 intent:v12 filterByClientModelId:v13];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      unint64_t v17 = 0;
      int64_t v33 = 0;
      uint64_t v18 = *(void *)v36;
LABEL_4:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v35 + 1) + 8 * v19);
        if (v17 >= [v14 count]) {
          break;
        }
        char v21 = [v20 rotationDate];
        [v20 durationLimit];
        long long v22 = objc_msgSend(v21, "dateByAddingTimeInterval:");
        while (1)
        {

          if (v17 >= [v14 count]) {
            break;
          }
          char v21 = [v14 objectAtIndexedSubscript:v17];
          long long v23 = [v20 rotationDate];
          long long v24 = [v23 earlierDate:v21];

          if (v24 != v21)
          {
            long long v25 = [v21 earlierDate:v22];

            int64_t v26 = v33;
            if (v25 == v21) {
              int64_t v26 = v33 + 1;
            }
            int64_t v33 = v26;

            break;
          }
          ++v17;
        }

        if (++v19 == v16)
        {
          uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
          if (v16) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    else
    {
      int64_t v33 = 0;
    }

    id v11 = v31;
    id v10 = v32;
    id v13 = v29;
    id v12 = v30;
    int64_t v27 = v33;
  }
  else
  {
    int64_t v27 = 0;
  }

  return v27;
}

- (BOOL)_shouldBlockTimelineSuggestion:(id)a3 updatingAbuseControlOutcomes:(id)a4
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v138 = a4;
  int v6 = [v5 relevanceScore];

  if (!v6)
  {
    unint64_t v17 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[ATXInformationFilter _shouldBlockTimelineSuggestion:updatingAbuseControlOutcomes:]();
    }

    uint64_t v18 = (void *)MEMORY[0x1E4F939E0];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v19 = objc_msgSend(v18, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 7);
    [v138 addObject:v19];

    goto LABEL_12;
  }
  uint64_t v7 = [v5 relevanceScore];
  [v7 doubleValue];
  double v9 = v8;

  if (v9 <= 0.0)
  {
    id v20 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[ATXInformationFilter _shouldBlockTimelineSuggestion:updatingAbuseControlOutcomes:]();
    }

    char v21 = (void *)MEMORY[0x1E4F939E0];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    long long v22 = objc_msgSend(v21, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 8);
    [v138 addObject:v22];

    goto LABEL_12;
  }
  store = self->_store;
  id v11 = [v5 suggestionIdentifier];
  LODWORD(store) = [(ATXInformationStore *)store rotationExistsForSuggestionWithId:v11 considerStalenessRotation:0];

  id v12 = self->_store;
  if (!store)
  {
    long long v25 = [(ATXInformationStore *)self->_store firstTimeAtWhichSuggestionPassedTimelineFilters:v5];

    if (v25)
    {
      int64_t v26 = __atxlog_handle_timeline();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v27 = [v5 suggestionIdentifier];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v27;
        _os_log_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_DEFAULT, "TimelineFilter: suggestion %@ passed (suggestion has passed before and haven't been rotated to)", buf, 0xCu);
      }
      id v28 = (void *)MEMORY[0x1E4F939E0];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      id v29 = objc_msgSend(v28, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 17);
      [v138 addObject:v29];

      goto LABEL_21;
    }
    long long v136 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:19];
    v34 = [v5 widgetBundleIdentifier];
    long long v35 = [v5 widgetKind];
    long long v36 = [v5 intent];
    int64_t v134 = [(ATXInformationFilter *)self numberOfSeenRotationsForWidget:v34 kind:v35 intent:v36 filterByClientModelId:v136];

    abuseControlConfig = self->_abuseControlConfig;
    long long v38 = [v5 widgetBundleIdentifier];
    v39 = [v5 widgetKind];
    uint64_t v40 = [(ATXTimelineAbuseControlConfig *)abuseControlConfig hardRotationQuotaForWidgetWithIdentifier:v38 kind:v39];

    if ((v40 & 0x8000000000000000) == 0 && v134 >= v40)
    {
      v41 = (void *)MEMORY[0x1E4F939E0];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      v42 = objc_msgSend(v41, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 9);
      [v138 addObject:v42];

      BOOL v23 = 1;
LABEL_78:

      goto LABEL_13;
    }
    int v43 = self->_store;
    uint64_t v44 = [v5 widgetBundleIdentifier];
    v45 = [v5 widgetKind];
    v46 = [v5 intent];
    long long v135 = [(ATXInformationStore *)v43 mostRecentRotationRecordForWidget:v44 kind:v45 intent:v46 considerStalenessRotation:0 filterByClientModelId:v136];

    if (v135)
    {
      int v47 = [MEMORY[0x1E4F1C9C8] now];
      v48 = [v135 rotationDate];
      [v47 timeIntervalSinceDate:v48];
      double v50 = v49;

      v51 = [v5 criterion];
      v52 = [v135 criterion];
      int v53 = [v51 isEqualToString:v52];

      if (v53)
      {
        [v135 durationLimit];
        if (v54 < v50)
        {
          [v135 coolDownInterval];
          if (v50 < v55) {
            goto LABEL_31;
          }
        }
      }
      else
      {
        [v135 coolDownInterval];
        if (v50 < v56)
        {
LABEL_31:
          v57 = (void *)MEMORY[0x1E4F939E0];
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          v58 = objc_msgSend(v57, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 10);
          [v138 addObject:v58];

          BOOL v23 = 1;
LABEL_77:

          goto LABEL_78;
        }
      }
    }
    v59 = self->_abuseControlConfig;
    v60 = [v5 widgetBundleIdentifier];
    uint64_t v61 = [v5 widgetKind];
    uint64_t v62 = [(ATXTimelineAbuseControlConfig *)v59 softRotationQuotaForWidgetWithIdentifier:v60 kind:v61];

    if (v62 < 0)
    {
      v70 = __atxlog_handle_timeline();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        v71 = [v5 suggestionIdentifier];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v71;
        _os_log_impl(&dword_1D0FA3000, v70, OS_LOG_TYPE_DEFAULT, "TimelineFilter: suggestion %@ passed (unlimited soft rotation quota)", buf, 0xCu);
      }
      [(ATXInformationStore *)self->_store recordSuggestionPassedTimelineFiltersForTheFirstTime:v5];
      v72 = (void *)MEMORY[0x1E4F939E0];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      v73 = objc_msgSend(v72, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 15);
      [v138 addObject:v73];

      BOOL v23 = 0;
      goto LABEL_77;
    }
    uint64_t v132 = v62;
    uint64_t v63 = self->_store;
    CFStringRef v64 = [v5 widgetBundleIdentifier];
    v65 = [v5 widgetKind];
    uint64_t v66 = objc_msgSend((id)objc_opt_class(), "chsFamilyForTimelineRelevanceSuggestionLayoutOptions:", objc_msgSend(v5, "layouts"));
    v67 = [v5 intent];
    long long v133 = [(ATXInformationStore *)v63 recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget:v64 kind:v65 family:v66 intent:v67];

    if ((unint64_t)[v133 count] <= 9)
    {
      id v68 = (void *)MEMORY[0x1E4F939E0];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      int v69 = objc_msgSend(v68, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 11);
      [v138 addObject:v69];

      BOOL v23 = 1;
LABEL_76:

      goto LABEL_77;
    }
    double v74 = [v133 firstObject];
    v75 = [v74 date];

    id v76 = v75;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    id v77 = v133;
    uint64_t v78 = [v77 countByEnumeratingWithState:&v148 objects:v162 count:16];
    if (v78)
    {
      uint64_t v79 = *(void *)v149;
      unint64_t v80 = v76;
      do
      {
        uint64_t v81 = 0;
        v82 = v76;
        v83 = v80;
        do
        {
          if (*(void *)v149 != v79) {
            objc_enumerationMutation(v77);
          }
          int v84 = *(void **)(*((void *)&v148 + 1) + 8 * v81);
          v85 = [v84 date];
          id v76 = [v85 earlierDate:v82];

          uint64_t v86 = [v84 date];
          unint64_t v80 = [v86 laterDate:v83];

          ++v81;
          v82 = v76;
          v83 = v80;
        }
        while (v78 != v81);
        uint64_t v78 = [v77 countByEnumeratingWithState:&v148 objects:v162 count:16];
      }
      while (v78);
    }
    else
    {
      unint64_t v80 = v76;
    }

    [v80 timeIntervalSinceDate:v76];
    double v88 = v87 / 86400.0;
    BOOL v89 = v87 / 86400.0 < 1.0;
    unint64_t v90 = [v77 count];
    if (v89) {
      double v91 = 1.0;
    }
    else {
      double v91 = v88;
    }
    double v92 = (double)v90 / v91;
    double v93 = (double)v132 / v92;
    if (v93 >= 1.0)
    {
      v107 = __atxlog_handle_timeline();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        v108 = [v5 suggestionIdentifier];
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v108;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v92;
        *(_WORD *)&buf[22] = 2048;
        uint64_t v159 = v132;
        _os_log_impl(&dword_1D0FA3000, v107, OS_LOG_TYPE_DEFAULT, "TimelineFilter: suggestion %@ passed (avgNumEntryPerDay %f < softRotationQuota %ld)", buf, 0x20u);
      }
      v109 = (void *)MEMORY[0x1E4F939E0];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      v110 = objc_msgSend(v109, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 16);
      [v138 addObject:v110];

      [(ATXInformationStore *)self->_store recordSuggestionPassedTimelineFiltersForTheFirstTime:v5];
    }
    else
    {
      unint64_t v94 = [v77 count];
      v95 = [v5 relevanceScore];
      [v95 doubleValue];
      double v97 = v96;

      unint64_t v98 = (unint64_t)(v93 * (double)v94);
      v99 = [v77 objectAtIndexedSubscript:v98];
      v100 = [v99 relevance];
      [v100 score];
      double v102 = v101;

      if (v97 - v102 <= 2.22044605e-16)
      {
        if (v102 - v97 <= 2.22044605e-16)
        {
          if (-[ATXInformationFilter shouldDisableRandomization:](self, "shouldDisableRandomization:", v5, v102 - v97))
          {
            v115 = (void *)MEMORY[0x1E4F939E0];
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            v116 = objc_msgSend(v115, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 23);
            [v138 addObject:v116];
          }
          else
          {
            if (v134 < v132)
            {
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x2020000000;
              uint64_t v159 = 0;
              uint64_t v159 = [v77 count];
              uint64_t v144 = 0;
              v145 = &v144;
              uint64_t v146 = 0x2020000000;
              uint64_t v147 = 0;
              v139[0] = MEMORY[0x1E4F143A8];
              v139[1] = 3221225472;
              v139[2] = __84__ATXInformationFilter__shouldBlockTimelineSuggestion_updatingAbuseControlOutcomes___block_invoke;
              v139[3] = &unk_1E68ABCA8;
              double v143 = v102;
              long long v141 = &v144;
              long long v142 = buf;
              id v140 = v77;
              [v140 enumerateObjectsUsingBlock:v139];
              double v117 = (double)(v98 - *(void *)(*(void *)&buf[8] + 24) + 1) / (double)(unint64_t)v145[3];
              double v118 = v117 + (double)arc4random_uniform(0xFFFFFFFF) / -4294967300.0;
              BOOL v23 = v118 <= 2.22044605e-16;
              if (v118 <= 2.22044605e-16)
              {
                uint64_t v119 = __atxlog_handle_timeline();
                if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
                {
                  v120 = [v5 suggestionIdentifier];
                  *(_DWORD *)v152 = 138412802;
                  __int16 v153 = v120;
                  __int16 v154 = 2048;
                  double v155 = v97;
                  __int16 v156 = 2048;
                  double v157 = v117;
                  _os_log_impl(&dword_1D0FA3000, v119, OS_LOG_TYPE_DEFAULT, "Suggestion %@ failed relevance score test (score == threshold == %f, bad luck with probability %f)", v152, 0x20u);
                }
                v121 = (void *)MEMORY[0x1E4F939E0];
                [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
                v122 = objc_msgSend(v121, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 13);
                [v138 addObject:v122];
              }
              else
              {
                uint64_t v127 = __atxlog_handle_timeline();
                if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
                {
                  v129 = [v5 suggestionIdentifier];
                  *(_DWORD *)v152 = 138412802;
                  __int16 v153 = v129;
                  __int16 v154 = 2048;
                  double v155 = v97;
                  __int16 v156 = 2048;
                  double v157 = v117;
                  _os_log_impl(&dword_1D0FA3000, v127, OS_LOG_TYPE_DEFAULT, "TimelineFilter: suggestion %@ passed (score == threshold == %f, good luck with probability %f)", v152, 0x20u);
                }
                v130 = (void *)MEMORY[0x1E4F939E0];
                [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
                v131 = objc_msgSend(v130, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 20);
                [v138 addObject:v131];

                [(ATXInformationStore *)self->_store recordSuggestionPassedTimelineFiltersForTheFirstTime:v5];
              }

              _Block_object_dispose(&v144, 8);
              _Block_object_dispose(buf, 8);
              goto LABEL_75;
            }
            v123 = __atxlog_handle_timeline();
            if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
            {
              v124 = [v5 suggestionIdentifier];
              *(_DWORD *)buf = 138413058;
              *(void *)&buf[4] = v124;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = v97;
              *(_WORD *)&buf[22] = 2048;
              uint64_t v159 = v134;
              __int16 v160 = 2048;
              uint64_t v161 = v132;
              _os_log_impl(&dword_1D0FA3000, v123, OS_LOG_TYPE_DEFAULT, "Suggestion %@ failed relevance score test (score == threshold == %f, but numRotation %ld >= softRotationQuota %ld)", buf, 0x2Au);
            }
            id v125 = (void *)MEMORY[0x1E4F939E0];
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            v126 = objc_msgSend(v125, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 6);
            [v138 addObject:v126];
          }
        }
        else
        {
          v111 = __atxlog_handle_timeline();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
          {
            v112 = [v5 suggestionIdentifier];
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = v112;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v97;
            *(_WORD *)&buf[22] = 2048;
            uint64_t v159 = *(void *)&v102;
            _os_log_impl(&dword_1D0FA3000, v111, OS_LOG_TYPE_DEFAULT, "Suggestion %@ failed relevance score test (score %f < threshold %f)", buf, 0x20u);
          }
          v113 = (void *)MEMORY[0x1E4F939E0];
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          v114 = objc_msgSend(v113, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 12);
          [v138 addObject:v114];
        }
        BOOL v23 = 1;
LABEL_75:

        goto LABEL_76;
      }
      v103 = __atxlog_handle_timeline();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
      {
        v104 = [v5 suggestionIdentifier];
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v104;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v97;
        *(_WORD *)&buf[22] = 2048;
        uint64_t v159 = *(void *)&v102;
        _os_log_impl(&dword_1D0FA3000, v103, OS_LOG_TYPE_DEFAULT, "TimelineFilter: suggestion %@ passed (score %f > threshold %f)", buf, 0x20u);
      }
      double v105 = (void *)MEMORY[0x1E4F939E0];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      v106 = objc_msgSend(v105, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 19);
      [v138 addObject:v106];

      [(ATXInformationStore *)self->_store recordSuggestionPassedTimelineFiltersForTheFirstTime:v5];
    }
    BOOL v23 = 0;
    goto LABEL_75;
  }
  id v13 = [v5 suggestionIdentifier];
  int v14 = [(ATXInformationStore *)v12 didSuggestionReachDurationLimit:v13];

  if (!v14)
  {
    id v30 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = [v5 suggestionIdentifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v31;
      _os_log_impl(&dword_1D0FA3000, v30, OS_LOG_TYPE_DEFAULT, "TimelineFilter: suggestion %@ passed (rotation for this suggestion exists and is within duration limit)", buf, 0xCu);
    }
    id v32 = (void *)MEMORY[0x1E4F939E0];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    int64_t v33 = objc_msgSend(v32, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 18);
    [v138 addObject:v33];

LABEL_21:
    BOOL v23 = 0;
    goto LABEL_13;
  }
  uint64_t v15 = (void *)MEMORY[0x1E4F939E0];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v16 = objc_msgSend(v15, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 3);
  [v138 addObject:v16];

LABEL_12:
  BOOL v23 = 1;
LABEL_13:

  return v23;
}

void __84__ATXInformationFilter__shouldBlockTimelineSuggestion_updatingAbuseControlOutcomes___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  uint64_t v7 = [v16 relevance];
  [v7 score];
  double v9 = v8;
  double v10 = *(double *)(a1 + 56);

  if (v9 == v10)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v11 == [*(id *)(a1 + 32) count]) {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
    }
  }
  id v12 = [v16 relevance];
  [v12 score];
  double v14 = v13;
  double v15 = *(double *)(a1 + 56);

  if (v14 < v15) {
    *a4 = 1;
  }
}

+ (int64_t)chsFamilyForTimelineRelevanceSuggestionLayoutOptions:(unint64_t)a3
{
  if ((uint64_t)a3 > 63)
  {
    if (a3 == 64) {
      return 3;
    }
    if (a3 == 128) {
      return 4;
    }
  }
  else
  {
    if (a3 == 8) {
      return 1;
    }
    if (a3 == 16) {
      return 2;
    }
  }
  id v4 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    +[ATXInformationFilter chsFamilyForTimelineRelevanceSuggestionLayoutOptions:]();
  }

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digitalHealthBlockList, 0);
  objc_storeStrong((id *)&self->_histogram, 0);
  objc_storeStrong((id *)&self->_abuseControlConfig, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_appLaunchCountsByBundleId, 0);
}

void __88__ATXInformationFilter_recordDismissOfSuggestion_isDismissalLongTerm_completionHandler___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [*a1 widgetBundleIdentifier];
  id v5 = [*a1 criterion];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  double v9 = v5;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXInformationFilter: failed to insert dismiss record (widget %@, criterion %@) into DB.", (uint8_t *)&v6, 0x16u);
}

- (void)filterInfoSuggestions:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [*(id *)(a1 + 40) timelineRelevanceABGroup];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "ATXInformationFilter: Enrolled in AB group '%@'", (uint8_t *)&v4, 0xCu);
}

void __66__ATXInformationFilter__populateDismissRecordsCacheAsynchronously__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "ATXInformationFilter: Error reading dismiss records from DB. Continuing with empty cache!", v1, 2u);
}

- (void)_shouldBlockTimelineSuggestion:updatingAbuseControlOutcomes:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "TimelineFilter: See timelineSuggestion candidate with nil relevance. This should never happen.", v2, v3, v4, v5, v6);
}

- (void)_shouldBlockTimelineSuggestion:updatingAbuseControlOutcomes:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "TimelineFilter: See timelineSuggestion candidate with non-positive score. This should never happen.", v2, v3, v4, v5, v6);
}

+ (void)chsFamilyForTimelineRelevanceSuggestionLayoutOptions:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "ATXInformationFilter: Each timeline relevance suggestion is associated with a unique size of either small, medium or large. Expected a match with one of the following suggestion layouts: ATXSuggestionLayoutOption2Rows2Columns, ATXSuggestionLayoutOption2Rows4Columns, ATXSuggestionLayoutOption4Rows4Columns, or ATXSuggestionLayoutOption4Rows8Columns.", v2, v3, v4, v5, v6);
}

@end