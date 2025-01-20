@interface ATXNPlusOneStudyUploader
- (BOOL)_processClientModelUpdateStreamFromStartTime:(double)a3 shortcutSuggestionHandler:(id)a4 infoSuggestionHandler:(id)a5 activity:(id)a6;
- (id)_applyPrivacyFilterToEvents:(id)a3;
- (id)_emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity:(id)a3;
- (id)_preparedEventsFromEmptyEvents:(id)a3 activity:(id)a4;
- (id)_preparedEvents_appLaunchPopularity:(id)a3 activity:(id)a4;
- (id)_preparedEvents_appPushNotificationEnabled:(id)a3 activity:(id)a4;
- (id)_preparedEvents_appScreenTimeCategory:(id)a3 activity:(id)a4;
- (id)_preparedEvents_numAppLaunches:(id)a3 activity:(id)a4;
- (id)_preparedEvents_suggestionCounts:(id)a3 activity:(id)a4;
- (id)_preparedEvents_widgetExistsOnScreen:(id)a3 activity:(id)a4;
- (void)_sendEventsToCoreAnalytics:(id)a3;
- (void)dryRunResultFilterByExtensionBundleId:(id)a3 completionHandler:(id)a4;
- (void)uploadStudyDataToCoreAnalyticsWithActivity:(id)a3;
@end

@implementation ATXNPlusOneStudyUploader

- (void)uploadStudyDataToCoreAnalyticsWithActivity:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(9, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__ATXNPlusOneStudyUploader_uploadStudyDataToCoreAnalyticsWithActivity___block_invoke;
  v7[3] = &unk_1E68AB870;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __71__ATXNPlusOneStudyUploader_uploadStudyDataToCoreAnalyticsWithActivity___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "ATXNPlusOneStudyUploader: Start to prepare N+1 study data.", (uint8_t *)&v7, 2u);
  }

  if (([*(id *)(a1 + 32) didDefer] & 1) == 0)
  {
    v3 = [*(id *)(a1 + 40) _emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity:*(void *)(a1 + 32)];
    if ([v3 count] && (objc_msgSend(*(id *)(a1 + 32), "didDefer") & 1) == 0)
    {
      id v4 = [*(id *)(a1 + 40) _preparedEventsFromEmptyEvents:v3 activity:*(void *)(a1 + 32)];

      if ([v4 count] && (objc_msgSend(*(id *)(a1 + 32), "didDefer") & 1) == 0)
      {
        v3 = [*(id *)(a1 + 40) _applyPrivacyFilterToEvents:v4];

        if ([v3 count] && (objc_msgSend(*(id *)(a1 + 32), "didDefer") & 1) == 0)
        {
          [*(id *)(a1 + 40) _sendEventsToCoreAnalytics:v3];
          v5 = __atxlog_handle_home_screen();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v6 = [v3 count];
            int v7 = 134217984;
            uint64_t v8 = v6;
            _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXNPlusOneStudyUploader: Sent %lu events to CoreAnalytics.", (uint8_t *)&v7, 0xCu);
          }
        }
      }
      else
      {
        v3 = v4;
      }
    }
  }
}

- (void)dryRunResultFilterByExtensionBundleId:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__ATXNPlusOneStudyUploader_dryRunResultFilterByExtensionBundleId_completionHandler___block_invoke;
  block[3] = &unk_1E68AF2D0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __84__ATXNPlusOneStudyUploader_dryRunResultFilterByExtensionBundleId_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __84__ATXNPlusOneStudyUploader_dryRunResultFilterByExtensionBundleId_completionHandler___block_invoke_cold_2();
  }

  uint64_t v3 = [*(id *)(a1 + 32) _emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity:0];
  id v4 = (void *)v3;
  if (*(void *)(a1 + 40))
  {
    v5 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v12 = [v11 extensionBundleId];
          int v13 = [v12 isEqualToString:*(void *)(a1 + 40)];

          if (v13) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = (void *)v3;
  }
  v14 = [*(id *)(a1 + 32) _preparedEventsFromEmptyEvents:v5 activity:0];

  v15 = [*(id *)(a1 + 32) _applyPrivacyFilterToEvents:v14];

  v16 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        v23 = [v22 coreAnalyticsEvent];
        v24 = (void *)[v23 mutableCopy];

        unint64_t v25 = [v22 appScreenTimeCategory] - 1;
        v26 = @"Unknown";
        if (v25 <= 0xE) {
          v26 = off_1E68B20C8[v25];
        }
        [v24 setObject:v26 forKeyedSubscript:@"appScreenTimeCategory"];
        [v16 addObject:v24];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v19);
  }

  v27 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    __84__ATXNPlusOneStudyUploader_dryRunResultFilterByExtensionBundleId_completionHandler___block_invoke_cold_1(v17);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F4B430] sharedInstance];
  id v17 = 0;
  v5 = [v4 fetchHomeScreenWidgetDescriptorMetadataWithError:&v17];
  id v6 = v17;

  if (v6)
  {
    uint64_t v7 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ATXNPlusOneStudyUploader _emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity:]();
    }
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = objc_opt_new();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __84__ATXNPlusOneStudyUploader__emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity___block_invoke;
    v14[3] = &unk_1E68B1FE0;
    id v15 = v3;
    id v10 = v9;
    id v16 = v10;
    [v5 enumerateKeysAndObjectsUsingBlock:v14];
    v11 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ATXNPlusOneStudyUploader _emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity:](v10);
    }

    id v12 = v16;
    uint64_t v7 = v10;

    uint64_t v8 = v7;
  }

  return v8;
}

void __84__ATXNPlusOneStudyUploader__emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  if ([*(id *)(a1 + 32) didDefer])
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v9 = objc_opt_new();
    id v10 = [v7 extensionBundleId];
    [v9 setExtensionBundleId:v10];

    v11 = [v7 kind];
    [v9 setWidgetKind:v11];

    id v12 = [v8 containerBundleId];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      v14 = [v8 containerBundleId];
      [v9 setAppBundleId:v14];
    }
    else
    {
      v14 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __84__ATXNPlusOneStudyUploader__emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity___block_invoke_cold_1(v9);
      }
    }

    [*(id *)(a1 + 40) addObject:v9];
  }
}

- (void)_sendEventsToCoreAnalytics:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[ATXNPlusOneStudyUploader _sendEventsToCoreAnalytics:]();
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "coreAnalyticsEvent", (void)v11);
        AnalyticsSendEvent();

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)_preparedEventsFromEmptyEvents:(id)a3 activity:(id)a4
{
  id v6 = a4;
  id v7 = [(ATXNPlusOneStudyUploader *)self _preparedEvents_widgetExistsOnScreen:a3 activity:v6];
  if (![v7 count] || (objc_msgSend(v6, "didDefer") & 1) != 0) {
    goto LABEL_3;
  }
  uint64_t v9 = [(ATXNPlusOneStudyUploader *)self _preparedEvents_appPushNotificationEnabled:v7 activity:v6];

  if (![v9 count] || (objc_msgSend(v6, "didDefer") & 1) != 0) {
    goto LABEL_6;
  }
  id v7 = [(ATXNPlusOneStudyUploader *)self _preparedEvents_appLaunchPopularity:v9 activity:v6];

  if (![v7 count] || (objc_msgSend(v6, "didDefer") & 1) != 0) {
    goto LABEL_3;
  }
  uint64_t v9 = [(ATXNPlusOneStudyUploader *)self _preparedEvents_appScreenTimeCategory:v7 activity:v6];

  if (![v9 count] || (objc_msgSend(v6, "didDefer") & 1) != 0)
  {
LABEL_6:
    uint64_t v8 = 0;
    id v7 = v9;
    goto LABEL_7;
  }
  id v7 = [(ATXNPlusOneStudyUploader *)self _preparedEvents_numAppLaunches:v9 activity:v6];

  if (![v7 count] || (objc_msgSend(v6, "didDefer") & 1) != 0)
  {
LABEL_3:
    uint64_t v8 = 0;
    goto LABEL_7;
  }
  long long v11 = [(ATXNPlusOneStudyUploader *)self _preparedEvents_suggestionCounts:v7 activity:v6];

  long long v12 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ATXNPlusOneStudyUploader _preparedEventsFromEmptyEvents:activity:]();
  }

  id v7 = v11;
  uint64_t v8 = v7;
LABEL_7:

  return v8;
}

- (id)_preparedEvents_widgetExistsOnScreen:(id)a3 activity:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v46 = a4;
  id v6 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ATXNPlusOneStudyUploader _preparedEvents_widgetExistsOnScreen:activity:]();
  }

  id v67 = 0;
  v41 = objc_opt_new();
  id v7 = [v41 loadHomeScreenAndTodayPageConfigurationsWithError:&v67];
  id v8 = v67;
  v42 = v8;
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  v40 = v7;
  if (v9)
  {
    v39 = v5;
    id v10 = objc_opt_new();
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    obuint64_t j = v7;
    uint64_t v45 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
    if (v45)
    {
      uint64_t v44 = *(void *)v64;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v64 != v44) {
            objc_enumerationMutation(obj);
          }
          long long v13 = *(void **)(*((void *)&v63 + 1) + 8 * v12);
          if (objc_msgSend(v46, "didDefer", v39, v40))
          {
            id v5 = v39;
            id v11 = v39;

            goto LABEL_43;
          }
          uint64_t v47 = v12;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          id v48 = [v13 stacks];
          uint64_t v50 = [v48 countByEnumeratingWithState:&v59 objects:v70 count:16];
          if (v50)
          {
            uint64_t v49 = *(void *)v60;
            do
            {
              for (uint64_t i = 0; i != v50; ++i)
              {
                if (*(void *)v60 != v49) {
                  objc_enumerationMutation(v48);
                }
                id v15 = *(void **)(*((void *)&v59 + 1) + 8 * i);
                long long v55 = 0u;
                long long v56 = 0u;
                long long v57 = 0u;
                long long v58 = 0u;
                uint64_t v16 = [v15 widgets];
                uint64_t v17 = [v16 countByEnumeratingWithState:&v55 objects:v69 count:16];
                if (v17)
                {
                  uint64_t v18 = v17;
                  uint64_t v19 = *(void *)v56;
                  do
                  {
                    for (uint64_t j = 0; j != v18; ++j)
                    {
                      if (*(void *)v56 != v19) {
                        objc_enumerationMutation(v16);
                      }
                      v21 = *(void **)(*((void *)&v55 + 1) + 8 * j);
                      v22 = [v21 extensionBundleId];
                      v23 = [v10 objectForKeyedSubscript:v22];

                      if (!v23)
                      {
                        v24 = objc_opt_new();
                        unint64_t v25 = [v21 extensionBundleId];
                        [v10 setObject:v24 forKeyedSubscript:v25];
                      }
                      v26 = [v21 extensionBundleId];
                      v27 = [v10 objectForKeyedSubscript:v26];
                      long long v28 = [v21 widgetKind];
                      [v27 addObject:v28];
                    }
                    uint64_t v18 = [v16 countByEnumeratingWithState:&v55 objects:v69 count:16];
                  }
                  while (v18);
                }
              }
              uint64_t v50 = [v48 countByEnumeratingWithState:&v59 objects:v70 count:16];
            }
            while (v50);
          }

          uint64_t v12 = v47 + 1;
        }
        while (v47 + 1 != v45);
        uint64_t v45 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
        if (v45) {
          continue;
        }
        break;
      }
    }

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v29 = v39;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v51 objects:v68 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v52;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v52 != v32) {
            objc_enumerationMutation(v29);
          }
          long long v34 = *(void **)(*((void *)&v51 + 1) + 8 * k);
          long long v35 = objc_msgSend(v34, "extensionBundleId", v39);
          v36 = [v10 objectForKeyedSubscript:v35];
          v37 = [v34 widgetKind];
          objc_msgSend(v34, "setWidgetExistsOnScreen:", objc_msgSend(v36, "containsObject:", v37));
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v51 objects:v68 count:16];
      }
      while (v31);
    }

    id v11 = v29;
    id v5 = v39;
  }
  else
  {
    id v10 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[ATXNPlusOneStudyUploader _preparedEvents_widgetExistsOnScreen:activity:]();
    }
    id v11 = 0;
  }
LABEL_43:

  return v11;
}

- (id)_preparedEvents_appPushNotificationEnabled:(id)a3 activity:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ATXNPlusOneStudyUploader _preparedEvents_appPushNotificationEnabled:activity:]();
  }

  id v8 = [MEMORY[0x1E4FB3840] currentNotificationSettingsCenter];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
LABEL_5:
    uint64_t v13 = 0;
    uint64_t v27 = v11;
    while (1)
    {
      if (*(void *)v29 != v12) {
        objc_enumerationMutation(v9);
      }
      long long v14 = *(void **)(*((void *)&v28 + 1) + 8 * v13);
      if ([v6 didDefer]) {
        break;
      }
      id v15 = [v14 appBundleId];

      if (v15)
      {
        uint64_t v16 = [v14 appBundleId];
        uint64_t v17 = [v8 notificationSourceWithIdentifier:v16];

        if ([v17 isHiddenFromSettings]) {
          goto LABEL_12;
        }
        uint64_t v18 = [v17 sourceSettings];
        [v18 notificationSettings];
        id v19 = v9;
        v21 = uint64_t v20 = v8;
        uint64_t v22 = v12;
        uint64_t v23 = [v21 authorizationStatus];

        id v8 = v20;
        id v9 = v19;

        BOOL v24 = v23 == 1;
        uint64_t v12 = v22;
        uint64_t v11 = v27;
        if (!v24) {
LABEL_12:
        }
          [v14 setAppPushNotificationEnabled:1];
      }
      else
      {
        [v14 setAppPushNotificationEnabled:1];
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v11) {
          goto LABEL_5;
        }
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:

    id v25 = v9;
  }

  return v9;
}

- (id)_preparedEvents_appLaunchPopularity:(id)a3 activity:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ATXNPlusOneStudyUploader _preparedEvents_appLaunchPopularity:activity:]();
  }

  id v8 = +[_ATXAppLaunchHistogramManager sharedInstance];
  id v9 = [v8 histogramForLaunchType:0];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
LABEL_5:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v21 != v13) {
        objc_enumerationMutation(v10);
      }
      id v15 = *(void **)(*((void *)&v20 + 1) + 8 * v14);
      if (objc_msgSend(v6, "didDefer", (void)v20)) {
        break;
      }
      uint64_t v16 = [v15 appBundleId];

      if (v16)
      {
        uint64_t v17 = [v15 appBundleId];
        [v9 overallLaunchPopularityForBundleId:v17];
        objc_msgSend(v15, "setAppLaunchPopularity:");
      }
      else
      {
        [v15 setAppLaunchPopularity:1.0];
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          goto LABEL_5;
        }
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:

    id v18 = v10;
  }

  return v10;
}

- (id)_preparedEvents_appScreenTimeCategory:(id)a3 activity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ATXNPlusOneStudyUploader _preparedEvents_appScreenTimeCategory:activity:]();
  }

  id v8 = objc_opt_new();
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __75__ATXNPlusOneStudyUploader__preparedEvents_appScreenTimeCategory_activity___block_invoke;
  id v15 = &unk_1E68B2030;
  id v16 = v6;
  id v17 = v8;
  id v9 = v8;
  id v10 = v6;
  [v5 enumerateObjectsUsingBlock:&v12];
  objc_msgSend(v5, "removeObjectsAtIndexes:", v9, v12, v13, v14, v15);

  return v5;
}

void __75__ATXNPlusOneStudyUploader__preparedEvents_appScreenTimeCategory_activity___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([*(id *)(a1 + 32) didDefer])
  {
    *a4 = 1;
  }
  else
  {
    id v8 = [v7 appBundleId];

    if (v8)
    {
      id v9 = (void *)MEMORY[0x1D25F6CC0]();
      dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
      uint64_t v11 = (void *)MEMORY[0x1E4F580B0];
      uint64_t v12 = [v7 appBundleId];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __75__ATXNPlusOneStudyUploader__preparedEvents_appScreenTimeCategory_activity___block_invoke_2;
      v21[3] = &unk_1E68B2008;
      id v13 = v7;
      id v22 = v13;
      id v14 = *(id *)(a1 + 40);
      dispatch_semaphore_t v24 = v10;
      uint64_t v25 = a3;
      id v23 = v14;
      id v15 = v10;
      [v11 categoryForBundleID:v12 withCompletionHandler:v21];

      id v16 = (void *)MEMORY[0x1E4F93B18];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __75__ATXNPlusOneStudyUploader__preparedEvents_appScreenTimeCategory_activity___block_invoke_207;
      v17[3] = &unk_1E68AE7A8;
      id v18 = v13;
      id v19 = *(id *)(a1 + 40);
      uint64_t v20 = a3;
      [v16 waitForSemaphore:v15 timeoutSeconds:0 onAcquire:v17 onTimeout:5.0];
    }
    else
    {
      [v7 setAppScreenTimeCategory:0];
    }
  }
}

void __75__ATXNPlusOneStudyUploader__preparedEvents_appScreenTimeCategory_activity___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __75__ATXNPlusOneStudyUploader__preparedEvents_appScreenTimeCategory_activity___block_invoke_2_cold_1(a1);
    }

    [*(id *)(a1 + 40) addIndex:*(void *)(a1 + 56)];
  }
  else
  {
    id v7 = [a2 identifier];
    if ([v7 isEqualToString:*MEMORY[0x1E4F58068]])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F58050]])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F58078]])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F58018]])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F58048]])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F58010]])
    {
      uint64_t v8 = 6;
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F58000]])
    {
      uint64_t v8 = 7;
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F58030]])
    {
      uint64_t v8 = 8;
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F58008]])
    {
      uint64_t v8 = 9;
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F58038]])
    {
      uint64_t v8 = 10;
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F58020]])
    {
      uint64_t v8 = 11;
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F58028]])
    {
      uint64_t v8 = 12;
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F58088]])
    {
      uint64_t v8 = 13;
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F58040]])
    {
      uint64_t v8 = 14;
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F58080]])
    {
      uint64_t v8 = 15;
    }
    else
    {
      uint64_t v8 = 0;
    }

    [*(id *)(a1 + 32) setAppScreenTimeCategory:v8];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

uint64_t __75__ATXNPlusOneStudyUploader__preparedEvents_appScreenTimeCategory_activity___block_invoke_207(uint64_t a1)
{
  v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __75__ATXNPlusOneStudyUploader__preparedEvents_appScreenTimeCategory_activity___block_invoke_207_cold_1(a1);
  }

  return [*(id *)(a1 + 40) addIndex:*(void *)(a1 + 48)];
}

- (id)_preparedEvents_numAppLaunches:(id)a3 activity:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ATXNPlusOneStudyUploader _preparedEvents_numAppLaunches:activity:]();
  }

  uint64_t v8 = objc_opt_new();
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v56 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        id v14 = [v13 appBundleId];
        BOOL v15 = v14 == 0;

        if (v15)
        {
          long long v21 = objc_opt_new();
          [v13 setAppLaunchCounts:v21];
        }
        else
        {
          id v16 = [v13 appBundleId];
          id v17 = [v8 objectForKeyedSubscript:v16];
          BOOL v18 = v17 == 0;

          if (v18)
          {
            id v19 = objc_opt_new();
            uint64_t v20 = [v13 appBundleId];
            [v8 setObject:v19 forKeyedSubscript:v20];
          }
          long long v21 = [v13 appBundleId];
          id v22 = [v8 objectForKeyedSubscript:v21];
          [v13 setAppLaunchCounts:v22];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v10);
  }

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v24 = v23;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v26 = v25;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v28 = v27;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v30 = v29;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v32 = v31;
  if ([v6 didDefer])
  {
    id v33 = v9;
  }
  else
  {
    uint64_t v49 = 0;
    uint64_t v50 = &v49;
    uint64_t v51 = 0x3032000000;
    long long v52 = __Block_byref_object_copy__57;
    long long v53 = __Block_byref_object_dispose__57;
    id v54 = v9;
    long long v34 = BiomeLibrary();
    long long v35 = [v34 App];
    v36 = [v35 InFocus];
    v37 = [NSNumber numberWithDouble:v32 + -2419200.0];
    uint64_t v38 = objc_msgSend(v36, "atx_publisherFromStartTime:", v37);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __68__ATXNPlusOneStudyUploader__preparedEvents_numAppLaunches_activity___block_invoke;
    v48[3] = &unk_1E68AC060;
    v48[4] = &v49;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __68__ATXNPlusOneStudyUploader__preparedEvents_numAppLaunches_activity___block_invoke_212;
    v41[3] = &unk_1E68B2058;
    id v42 = v6;
    id v43 = v8;
    double v44 = v30 + -1209600.0;
    double v45 = v28 + -604800.0;
    double v46 = v26 + -259200.0;
    double v47 = v24 + -86400.0;
    id v39 = (id)[v38 sinkWithCompletion:v48 receiveInput:v41];

    id v33 = (id)v50[5];
    _Block_object_dispose(&v49, 8);
  }
  return v33;
}

void __68__ATXNPlusOneStudyUploader__preparedEvents_numAppLaunches_activity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    id v4 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __68__ATXNPlusOneStudyUploader__preparedEvents_numAppLaunches_activity___block_invoke_cold_1(v3);
    }

    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

void __68__ATXNPlusOneStudyUploader__preparedEvents_numAppLaunches_activity___block_invoke_212(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) didDefer] & 1) == 0)
  {
    id v4 = [v3 eventBody];

    if (v4)
    {
      uint64_t v5 = [v3 eventBody];
      if ([v5 starting])
      {
        id v6 = *(void **)(a1 + 40);
        id v7 = [v5 bundleID];
        uint64_t v8 = [v6 objectForKeyedSubscript:v7];

        if (v8)
        {
          id v9 = *(void **)(a1 + 40);
          uint64_t v10 = [v5 bundleID];
          uint64_t v11 = [v9 objectForKeyedSubscript:v10];

          objc_msgSend(v11, "setNumAppLaunchPast28Day:", objc_msgSend(v11, "numAppLaunchPast28Day") + 1);
          uint64_t v12 = [v5 absoluteTimestamp];
          [v12 timeIntervalSinceReferenceDate];
          double v14 = v13;
          double v15 = *(double *)(a1 + 48);

          if (v14 > v15) {
            objc_msgSend(v11, "setNumAppLaunchPast14Day:", objc_msgSend(v11, "numAppLaunchPast14Day") + 1);
          }
          id v16 = [v5 absoluteTimestamp];
          [v16 timeIntervalSinceReferenceDate];
          double v18 = v17;
          double v19 = *(double *)(a1 + 56);

          if (v18 > v19) {
            objc_msgSend(v11, "setNumAppLaunchPast7Day:", objc_msgSend(v11, "numAppLaunchPast7Day") + 1);
          }
          uint64_t v20 = [v5 absoluteTimestamp];
          [v20 timeIntervalSinceReferenceDate];
          double v22 = v21;
          double v23 = *(double *)(a1 + 64);

          if (v22 > v23) {
            objc_msgSend(v11, "setNumAppLaunchPast3Day:", objc_msgSend(v11, "numAppLaunchPast3Day") + 1);
          }
          double v24 = [v5 absoluteTimestamp];
          [v24 timeIntervalSinceReferenceDate];
          double v26 = v25;
          double v27 = *(double *)(a1 + 72);

          if (v26 > v27) {
            objc_msgSend(v11, "setNumAppLaunchPastDay:", objc_msgSend(v11, "numAppLaunchPastDay") + 1);
          }
        }
      }
    }
    else
    {
      double v28 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        __68__ATXNPlusOneStudyUploader__preparedEvents_numAppLaunches_activity___block_invoke_212_cold_1(v3);
      }
    }
  }
}

- (id)_preparedEvents_suggestionCounts:(id)a3 activity:(id)a4
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v36 = a4;
  id v6 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ATXNPlusOneStudyUploader _preparedEvents_suggestionCounts:activity:]();
  }

  id v7 = objc_opt_new();
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v81 objects:v97 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v82 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        double v13 = [v12 extensionBundleId];
        double v14 = [v12 widgetKind];
        double v15 = [v13 stringByAppendingString:v14];

        [v7 setObject:v12 forKeyedSubscript:v15];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v81 objects:v97 count:16];
    }
    while (v9);
  }

  id v16 = objc_opt_new();
  double v17 = objc_opt_new();
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x2020000000;
  uint64_t v80 = 0;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  uint64_t v76 = 0;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2020000000;
  uint64_t v72 = 0;
  uint64_t v65 = 0;
  long long v66 = &v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 0;
  uint64_t v61 = 0;
  long long v62 = &v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v64 = 0;
  uint64_t v57 = 0;
  long long v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = 0;
  uint64_t v51 = 0;
  long long v52 = &v51;
  uint64_t v53 = 0x3032000000;
  id v54 = __Block_byref_object_copy__57;
  long long v55 = __Block_byref_object_dispose__57;
  id v35 = v8;
  id v56 = v35;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__ATXNPlusOneStudyUploader__preparedEvents_suggestionCounts_activity___block_invoke;
  aBlock[3] = &unk_1E68B2080;
  id v18 = v16;
  id v45 = v18;
  id v19 = v7;
  id v46 = v19;
  double v47 = &v51;
  id v48 = &v69;
  uint64_t v49 = &v73;
  uint64_t v50 = &v77;
  uint64_t v20 = _Block_copy(aBlock);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __70__ATXNPlusOneStudyUploader__preparedEvents_suggestionCounts_activity___block_invoke_217;
  v37[3] = &unk_1E68B2080;
  id v21 = v17;
  id v38 = v21;
  id v22 = v19;
  id v39 = v22;
  v40 = &v51;
  v41 = &v57;
  id v42 = &v61;
  id v43 = &v65;
  double v23 = _Block_copy(v37);
  if ([v36 didDefer]) {
    goto LABEL_15;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  if ([(ATXNPlusOneStudyUploader *)self _processClientModelUpdateStreamFromStartTime:v20 shortcutSuggestionHandler:v23 infoSuggestionHandler:v36 activity:v24 + -86400.0])
  {
    double v25 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = v78[3];
      uint64_t v29 = v74[3];
      uint64_t v30 = v70[3];
      uint64_t v31 = v66[3];
      uint64_t v32 = v62[3];
      uint64_t v33 = v58[3];
      *(_DWORD *)buf = 134219264;
      uint64_t v86 = v28;
      __int16 v87 = 2048;
      uint64_t v88 = v29;
      __int16 v89 = 2048;
      uint64_t v90 = v30;
      __int16 v91 = 2048;
      uint64_t v92 = v31;
      __int16 v93 = 2048;
      uint64_t v94 = v32;
      __int16 v95 = 2048;
      uint64_t v96 = v33;
      _os_log_debug_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEBUG, "ATXNPlusOneStudyUploader: totalShortcutConversionCount %lu (high threshold) %lu (med threshold) %lu (low threshold), totalInfoHeuristicsCount %lu (high threshold) %lu (med threshold) %lu (low threshold).", buf, 0x3Eu);
    }

LABEL_15:
    id v26 = (id)v52[5];
    goto LABEL_17;
  }
  id v26 = 0;
LABEL_17:

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v77, 8);

  return v26;
}

void __70__ATXNPlusOneStudyUploader__preparedEvents_suggestionCounts_activity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 scoreSpecification];
  uint64_t v5 = [v4 suggestedConfidenceCategory];

  if (v5 >= 2)
  {
    id v6 = [v3 executableSpecification];
    id v7 = [v6 executableClassString];
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v10 = [v7 isEqualToString:v9];

    if (v10)
    {
      uint64_t v11 = [v3 executableSpecification];
      uint64_t v12 = [v11 executableObject];

      if (([*(id *)(a1 + 32) containsObject:v12] & 1) == 0)
      {
        [*(id *)(a1 + 32) addObject:v12];
        uint64_t v13 = [v12 intent];
        if (v13)
        {
          double v14 = (void *)v13;
          double v15 = +[ATXIntentMetadataCache sharedInstance];
          id v16 = [v12 intent];
          int v17 = [v15 isEligibleForWidgetsForIntent:v16];

          if (v17)
          {
            id v18 = [MEMORY[0x1E4F4B430] sharedInstance];
            id v19 = [v12 intent];
            uint64_t v20 = [v18 homeScreenDescriptorForIntent:v19];

            if (v20)
            {
              id v21 = [v20 extensionBundleIdentifier];
              id v22 = [v20 kind];
              double v23 = [v21 stringByAppendingString:v22];

              double v24 = [*(id *)(a1 + 40) objectForKeyedSubscript:v23];
              double v25 = v24;
              if (v24)
              {
                objc_msgSend(v24, "setSuggestionCountShortcutConversionLow:", objc_msgSend(v24, "suggestionCountShortcutConversionLow") + 1);
                ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
                id v26 = [v3 scoreSpecification];
                uint64_t v27 = [v26 suggestedConfidenceCategory];

                if (v27 >= 3)
                {
                  objc_msgSend(v25, "setSuggestionCountShortcutConversionMed:", objc_msgSend(v25, "suggestionCountShortcutConversionMed") + 1);
                  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
                  uint64_t v28 = [v3 scoreSpecification];
                  uint64_t v29 = [v28 suggestedConfidenceCategory];

                  if (v29 == 4)
                  {
                    objc_msgSend(v25, "setSuggestionCountShortcutConversionHigh:", objc_msgSend(v25, "suggestionCountShortcutConversionHigh") + 1);
                    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
                  }
                }
              }
              else
              {
                uint64_t v30 = __atxlog_handle_home_screen();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
                  __70__ATXNPlusOneStudyUploader__preparedEvents_suggestionCounts_activity___block_invoke_cold_1();
                }

                uint64_t v31 = *(void *)(*(void *)(a1 + 48) + 8);
                uint64_t v32 = *(void **)(v31 + 40);
                *(void *)(v31 + 40) = 0;
              }
            }
          }
        }
      }
    }
  }
}

void __70__ATXNPlusOneStudyUploader__preparedEvents_suggestionCounts_activity___block_invoke_217(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 scoreSpecification];
  uint64_t v5 = [v4 suggestedConfidenceCategory];

  if (v5 >= 2)
  {
    id v6 = [v3 executableSpecification];
    id v7 = [v6 executableObject];

    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v7 suggestionIdentifier];
    LOBYTE(v8) = [v8 containsObject:v9];

    if ((v8 & 1) == 0)
    {
      int v10 = *(void **)(a1 + 32);
      uint64_t v11 = [v7 suggestionIdentifier];
      [v10 addObject:v11];

      uint64_t v12 = [v7 widgetBundleIdentifier];
      uint64_t v13 = [v7 widgetKind];
      double v14 = [v12 stringByAppendingString:v13];

      double v15 = [*(id *)(a1 + 40) objectForKeyedSubscript:v14];
      id v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "setSuggestionCountInfoHeuristicLow:", objc_msgSend(v15, "suggestionCountInfoHeuristicLow") + 1);
        ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        int v17 = [v3 scoreSpecification];
        uint64_t v18 = [v17 suggestedConfidenceCategory];

        if (v18 >= 3)
        {
          objc_msgSend(v16, "setSuggestionCountInfoHeuristicMed:", objc_msgSend(v16, "suggestionCountInfoHeuristicMed") + 1);
          ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
          id v19 = [v3 scoreSpecification];
          uint64_t v20 = [v19 suggestedConfidenceCategory];

          if (v20 == 4)
          {
            objc_msgSend(v16, "setSuggestionCountInfoHeuristicHigh:", objc_msgSend(v16, "suggestionCountInfoHeuristicHigh") + 1);
            ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
          }
        }
      }
      else
      {
        id v21 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
          __70__ATXNPlusOneStudyUploader__preparedEvents_suggestionCounts_activity___block_invoke_217_cold_1();
        }

        uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
        double v23 = *(void **)(v22 + 40);
        *(void *)(v22 + 40) = 0;
      }
    }
  }
}

- (BOOL)_processClientModelUpdateStreamFromStartTime:(double)a3 shortcutSuggestionHandler:(id)a4 infoSuggestionHandler:(id)a5 activity:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  uint64_t v27 = 0;
  v28[0] = &v27;
  v28[1] = 0x2020000000;
  v28[2] = 0;
  uint64_t v12 = objc_opt_new();
  uint64_t v13 = [v12 publisherFromStartTime:a3];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __130__ATXNPlusOneStudyUploader__processClientModelUpdateStreamFromStartTime_shortcutSuggestionHandler_infoSuggestionHandler_activity___block_invoke;
  v26[3] = &unk_1E68AC060;
  v26[4] = &v29;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __130__ATXNPlusOneStudyUploader__processClientModelUpdateStreamFromStartTime_shortcutSuggestionHandler_infoSuggestionHandler_activity___block_invoke_219;
  v21[3] = &unk_1E68B20A8;
  id v14 = v11;
  id v22 = v14;
  id v15 = v9;
  id v23 = v15;
  double v25 = &v27;
  id v16 = v10;
  id v24 = v16;
  id v17 = (id)[v13 sinkWithCompletion:v26 receiveInput:v21];

  uint64_t v18 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[ATXNPlusOneStudyUploader _processClientModelUpdateStreamFromStartTime:shortcutSuggestionHandler:infoSuggestionHandler:activity:]((uint64_t)v28, v18);
  }

  char v19 = *((unsigned char *)v30 + 24);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v29, 8);

  return v19;
}

void __130__ATXNPlusOneStudyUploader__processClientModelUpdateStreamFromStartTime_shortcutSuggestionHandler_infoSuggestionHandler_activity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    id v4 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __130__ATXNPlusOneStudyUploader__processClientModelUpdateStreamFromStartTime_shortcutSuggestionHandler_infoSuggestionHandler_activity___block_invoke_cold_1(v3);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void __130__ATXNPlusOneStudyUploader__processClientModelUpdateStreamFromStartTime_shortcutSuggestionHandler_infoSuggestionHandler_activity___block_invoke_219(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([*(id *)(a1 + 32) didDefer] & 1) == 0)
  {
    id v4 = [v3 eventBody];

    if (!v4)
    {
      uint64_t v5 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __130__ATXNPlusOneStudyUploader__processClientModelUpdateStreamFromStartTime_shortcutSuggestionHandler_infoSuggestionHandler_activity___block_invoke_219_cold_1(v3);
      }
      goto LABEL_15;
    }
    uint64_t v5 = [v3 eventBody];
    id v6 = (void *)MEMORY[0x1E4F93940];
    id v7 = [v5 clientModelId];
    unint64_t v8 = [v6 clientModelTypeFromClientModelId:v7];

    if (v8 <= 0x12)
    {
      if (((1 << v8) & 0x88A) != 0)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v9 = [v5 suggestions];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v25 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = (void *)MEMORY[0x1D25F6CC0]();
              (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
          }
          while (v11);
        }
      }
      else
      {
        if (v8 != 18) {
          goto LABEL_15;
        }
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v9 = [v5 suggestions];
        uint64_t v15 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v21 != v17) {
                objc_enumerationMutation(v9);
              }
              char v19 = (void *)MEMORY[0x1D25F6CC0]();
              (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
            }
            uint64_t v16 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v16);
        }
      }

      ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    }
LABEL_15:
  }
}

- (id)_applyPrivacyFilterToEvents:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([MEMORY[0x1E4F93B08] isInternalBuild])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = (id)objc_opt_new();
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
          uint64_t v11 = objc_msgSend(v10, "appBundleId", (void)v16);
          if (v11)
          {
            uint64_t v12 = (void *)v11;
            uint64_t v13 = [v10 appLaunchCounts];
            uint64_t v14 = [v13 numAppLaunchPast28Day];

            if (v14 < 5) {
              continue;
            }
          }
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

void __84__ATXNPlusOneStudyUploader_dryRunResultFilterByExtensionBundleId_completionHandler___block_invoke_cold_1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v1, v2, "ATXNPlusOneStudyUploader: Sent %lu events to atxtool.", v3, v4, v5, v6, v7);
}

void __84__ATXNPlusOneStudyUploader_dryRunResultFilterByExtensionBundleId_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "ATXNPlusOneStudyUploader: Start to prepare N+1 study data for dry run.", v2, v3, v4, v5, v6);
}

- (void)_emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity:(void *)a1 .cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v1, v2, "ATXNPlusOneStudyUploader: There are %lu widgets eligible for N+1 on this device.", v3, v4, v5, v6, v7);
}

- (void)_emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "ATXNPlusOneStudyUploader: Error fetching widget descriptors - %{public}@", v1, 0xCu);
}

void __84__ATXNPlusOneStudyUploader__emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity___block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [a1 extensionBundleId];
  id v9 = [a1 widgetKind];
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "ATXNPlusOneStudyUploader: Unable to get App Bundle Id for extensionBundleId %@, kind %@", v5, v6, v7, v8, 2u);
}

- (void)_sendEventsToCoreAnalytics:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "ATXNPlusOneStudyUploader: Sending events to CoreAnalytics...", v2, v3, v4, v5, v6);
}

- (void)_preparedEventsFromEmptyEvents:activity:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "ATXNPlusOneStudyUploader: Done populating fields of all events.", v2, v3, v4, v5, v6);
}

- (void)_preparedEvents_widgetExistsOnScreen:activity:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "ATXNPlusOneStudyUploader: Error loading Home Screen config - %{public}@", v1, 0xCu);
}

- (void)_preparedEvents_widgetExistsOnScreen:activity:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "ATXNPlusOneStudyUploader: Populating widgetExistsOnScreen for events...", v2, v3, v4, v5, v6);
}

- (void)_preparedEvents_appPushNotificationEnabled:activity:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "ATXNPlusOneStudyUploader: Populating appPushNotificationEnabled for events...", v2, v3, v4, v5, v6);
}

- (void)_preparedEvents_appLaunchPopularity:activity:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "ATXNPlusOneStudyUploader: Populating appLaunchPopularity for events...", v2, v3, v4, v5, v6);
}

- (void)_preparedEvents_appScreenTimeCategory:activity:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "ATXNPlusOneStudyUploader: Populating appScreenTimeCategory for events...", v2, v3, v4, v5, v6);
}

void __75__ATXNPlusOneStudyUploader__preparedEvents_appScreenTimeCategory_activity___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) appBundleId];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v2, v3, "ATXNPlusOneStudyUploader: Error querying Screen Time Category ID for bundle ID %@ - %{public}@", v4, v5, v6, v7, v8);
}

void __75__ATXNPlusOneStudyUploader__preparedEvents_appScreenTimeCategory_activity___block_invoke_207_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) appBundleId];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "ATXNPlusOneStudyUploader: Error querying Screen Time Category ID for bundle ID %@ - Query timed out", v4, v5, v6, v7, v8);
}

- (void)_preparedEvents_numAppLaunches:activity:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "ATXNPlusOneStudyUploader: Populating numAppLaunches for events...", v2, v3, v4, v5, v6);
}

void __68__ATXNPlusOneStudyUploader__preparedEvents_numAppLaunches_activity___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "ATXNPlusOneStudyUploader: Biome AppLaunchStream query completion is not successful due to error: %{public}@", v4, v5, v6, v7, v8);
}

void __68__ATXNPlusOneStudyUploader__preparedEvents_numAppLaunches_activity___block_invoke_212_cold_1(void *a1)
{
  [a1 error];
  OUTLINED_FUNCTION_0_9(&dword_1D0FA3000, v1, v2, "ATXNPlusOneStudyUploader: Found nil eventBody from Biome AppLaunchStream query (Biome event error code %d)", v3, v4, v5, v6, 0);
}

- (void)_preparedEvents_suggestionCounts:activity:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "ATXNPlusOneStudyUploader: Populating suggestionCounts for events...", v2, v3, v4, v5, v6);
}

void __70__ATXNPlusOneStudyUploader__preparedEvents_suggestionCounts_activity___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "ATXNPlusOneStudyUploader: Shortcut conversion widget does not have corresponding event. This implies that ATXWidgetDescriptorCache must have returned inconsistent result.", v1, 2u);
}

void __70__ATXNPlusOneStudyUploader__preparedEvents_suggestionCounts_activity___block_invoke_217_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "ATXNPlusOneStudyUploader: Info Heuristic widget does not have corresponding event. This implies that ATXWidgetDescriptorCache must have returned inconsistent result.", v1, 2u);
}

- (void)_processClientModelUpdateStreamFromStartTime:(uint64_t)a1 shortcutSuggestionHandler:(NSObject *)a2 infoSuggestionHandler:activity:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 24);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "ATXNPlusOneStudyUploader: Processed %lu relevant client model updates in the past 24 hrs.", (uint8_t *)&v3, 0xCu);
}

void __130__ATXNPlusOneStudyUploader__processClientModelUpdateStreamFromStartTime_shortcutSuggestionHandler_infoSuggestionHandler_activity___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "ATXNPlusOneStudyUploader: Biome ClientModelStream query completion is not successful due to error: %{public}@", v4, v5, v6, v7, v8);
}

void __130__ATXNPlusOneStudyUploader__processClientModelUpdateStreamFromStartTime_shortcutSuggestionHandler_infoSuggestionHandler_activity___block_invoke_219_cold_1(void *a1)
{
  [a1 error];
  OUTLINED_FUNCTION_0_9(&dword_1D0FA3000, v1, v2, "ATXNPlusOneStudyUploader: Found nil eventBody from Biome ClientModelStream query (Biome event error code %d)", v3, v4, v5, v6, 0);
}

@end