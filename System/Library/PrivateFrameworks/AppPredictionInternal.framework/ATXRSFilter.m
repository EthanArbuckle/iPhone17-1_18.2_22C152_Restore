@interface ATXRSFilter
- (ATXRSFilter)init;
- (ATXRSFilter)initWithAppLaunchHistogramManager:(id)a3;
- (id)_candidatesByUsingAppLaunchHistogramsToFilterCandidates:(id)a3;
- (id)filterCandidatesBySuggestionRequirements:(id)a3;
@end

@implementation ATXRSFilter

- (ATXRSFilter)init
{
  v3 = +[_ATXAppLaunchHistogramManager sharedInstance];
  v4 = [(ATXRSFilter *)self initWithAppLaunchHistogramManager:v3];

  return v4;
}

- (ATXRSFilter)initWithAppLaunchHistogramManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXRSFilter;
  v6 = [(ATXRSFilter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appLaunchHistogramManager, a3);
  }

  return v7;
}

- (id)filterCandidatesBySuggestionRequirements:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v26 = objc_opt_new();
  v4 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F4B688];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v11 = [v10 widgetDescriptor];
        v12 = [v11 extensionBundleIdentifier];

        v13 = v12;
        v14 = v13;
        v15 = v4;
        if (CFPreferencesGetAppBooleanValue(@"widgetKitDeveloperModeEnabled", @"com.apple.duetexpertd", 0))
        {
          keyExistsAndHasValidFormat[0] = 0;
          if (CFPreferencesGetAppBooleanValue(@"ATXWidgetKitDeveloperModeSkipEntitlementCheck", v8, keyExistsAndHasValidFormat))
          {
          }
          else
          {
            int v16 = [MEMORY[0x1E4F4AEF8] isDebuggingAllowedForExtensionBundleId:v13];

            v15 = v4;
            if (!v16) {
              goto LABEL_14;
            }
          }
          v14 = __atxlog_handle_relevant_shortcut();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v17 = [v10 widgetDescriptor];
            *(_DWORD *)keyExistsAndHasValidFormat = 138412290;
            uint64_t v33 = (uint64_t)v17;
            _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "ATXRSFilter: WidgetKit Developer Mode enabled. Bypassing filtering for debug allowed widget: %@", keyExistsAndHasValidFormat, 0xCu);
          }
          v15 = v26;
        }

LABEL_14:
        [v15 addObject:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v6);
  }

  v18 = __atxlog_handle_relevant_shortcut();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)keyExistsAndHasValidFormat = 0;
    _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "ATXRSFilter: Filtering candidates...", keyExistsAndHasValidFormat, 2u);
  }

  v19 = (void *)[v4 copy];
  v20 = [(ATXRSFilter *)self _candidatesByUsingAppLaunchHistogramsToFilterCandidates:v19];

  v21 = [v26 arrayByAddingObjectsFromArray:v20];
  v22 = __atxlog_handle_relevant_shortcut();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [v21 count];
    *(_DWORD *)keyExistsAndHasValidFormat = 134217984;
    uint64_t v33 = v23;
    _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "ATXRSFilter: %lu candidates passed suggestion filters", keyExistsAndHasValidFormat, 0xCu);
  }

  return v21;
}

- (id)_candidatesByUsingAppLaunchHistogramsToFilterCandidates:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v54 = (id)objc_opt_new();
  v52 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:5];
  uint64_t v5 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:2];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = v4;
  uint64_t v56 = [obj countByEnumeratingWithState:&v68 objects:v83 count:16];
  if (v56)
  {
    uint64_t v55 = *(void *)v69;
    unint64_t v7 = 0x1E4F1C000uLL;
    *(void *)&long long v6 = 138412802;
    long long v51 = v6;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v69 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v57 = v8;
        objc_super v9 = *(void **)(*((void *)&v68 + 1) + 8 * v8);
        v10 = objc_msgSend(v9, "donationBundleIdentifier", v51);
        v11 = +[ATXRSWidgetSuggestionProducer replacementContainerBundleIdForDonationBundleId:v10];
        v12 = v11;
        if (v11)
        {
          id v13 = v11;
        }
        else
        {
          id v13 = [v9 donationBundleIdentifier];
        }
        v14 = v13;

        id v15 = v14;
        if (([v15 isEqualToString:@"com.apple.Health.Sleep"] & 1) != 0
          || [v15 isEqualToString:@"com.apple.PeopleViewService"])
        {

LABEL_12:
          [v54 addObject:v9];
          goto LABEL_13;
        }
        int v16 = [v15 isEqualToString:@"com.apple.gamecenter.widgets"];

        if (v16) {
          goto LABEL_12;
        }
        id v82 = v15;
        v17 = [*(id *)(v7 + 2424) arrayWithObjects:&v82 count:1];
        [v52 totalLaunchesForBundleIds:v17];
        double v19 = v18;

        if (v19 >= 10.0)
        {
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v28 = [v9 relevantContexts];
          uint64_t v63 = [v28 countByEnumeratingWithState:&v64 objects:v81 count:16];
          if (!v63)
          {

            goto LABEL_12;
          }
          id v61 = v28;
          uint64_t v62 = *(void *)v65;
          char v29 = 1;
          v58 = v9;
          id v59 = v15;
          do
          {
            for (uint64_t i = 0; i != v63; ++i)
            {
              if (*(void *)v65 != v62) {
                objc_enumerationMutation(v61);
              }
              long long v31 = *(void **)(*((void *)&v64 + 1) + 8 * i);
              Class v32 = NSClassFromString(&cfstr_Atxdaterelevan.isa);
              id v33 = v31;
              if (v32)
              {
                if (objc_opt_isKindOfClass()) {
                  v34 = v33;
                }
                else {
                  v34 = 0;
                }
              }
              else
              {
                v34 = 0;
              }
              id v35 = v34;

              if (v35)
              {
                id v80 = v15;
                v36 = [*(id *)(v7 + 2424) arrayWithObjects:&v80 count:1];
                v37 = [v35 startDate];
                LODWORD(v38) = 1.0;
                [v5 totalLaunchesForBundleIds:v36 forDate:v37 distanceScale:v38];
                double v40 = v39;

                if (v40 < 5.0)
                {
                  v41 = __atxlog_handle_relevant_shortcut();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                  {
                    v60 = [v9 widgetDescriptor];
                    v42 = [v60 extensionBundleIdentifier];
                    v43 = [v9 widgetDescriptor];
                    v44 = [v43 kind];
                    v45 = [v9 intent];
                    [v45 intentDescription];
                    v47 = v46 = v5;
                    v48 = [v35 startDate];
                    *(_DWORD *)buf = 138413058;
                    v73 = v42;
                    __int16 v74 = 2112;
                    v75 = v44;
                    __int16 v76 = 2112;
                    v77 = v47;
                    __int16 v78 = 2112;
                    v79 = v48;
                    _os_log_impl(&dword_1D0FA3000, v41, OS_LOG_TYPE_DEFAULT, "ATXRSFilter: Candidate (%@ - %@ - %@) failed dayOfWeek filter for start date: %@", buf, 0x2Au);

                    uint64_t v5 = v46;
                    objc_super v9 = v58;

                    id v15 = v59;
                    unint64_t v7 = 0x1E4F1C000;
                  }
                  char v29 = 0;
                }
              }
            }
            uint64_t v63 = [v61 countByEnumeratingWithState:&v64 objects:v81 count:16];
          }
          while (v63);

          if (v29) {
            goto LABEL_12;
          }
        }
        else
        {
          v20 = __atxlog_handle_relevant_shortcut();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = [v9 widgetDescriptor];
            v22 = [v21 extensionBundleIdentifier];
            uint64_t v23 = [v9 widgetDescriptor];
            v24 = [v23 kind];
            [v9 intent];
            v26 = id v25 = v15;
            v27 = [v26 intentDescription];
            *(_DWORD *)buf = v51;
            v73 = v22;
            __int16 v74 = 2112;
            v75 = v24;
            __int16 v76 = 2112;
            v77 = v27;
            _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, "ATXRSFilter: Candidate (%@ - %@ - %@) failed trendingAppLaunchPopularity filter", buf, 0x20u);

            id v15 = v25;
          }
        }
LABEL_13:

        uint64_t v8 = v57 + 1;
      }
      while (v57 + 1 != v56);
      uint64_t v49 = [obj countByEnumeratingWithState:&v68 objects:v83 count:16];
      uint64_t v56 = v49;
    }
    while (v49);
  }

  return v54;
}

- (void).cxx_destruct
{
}

@end