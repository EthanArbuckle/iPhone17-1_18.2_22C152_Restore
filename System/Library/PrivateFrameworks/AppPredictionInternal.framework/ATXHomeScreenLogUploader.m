@interface ATXHomeScreenLogUploader
+ (BOOL)_shouldProcessATXUIEvent:(id)a3 startTime:(double)a4;
- (ATXHomeScreenLogUploader)init;
- (id)_timeBasedMergePublisher:(id)a3 withOtherPublishers:(id)a4;
- (void)uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:(id)a3 customStartDate:(id)a4 dryRunCompletionHandler:(id)a5;
@end

@implementation ATXHomeScreenLogUploader

- (ATXHomeScreenLogUploader)init
{
  v20.receiver = self;
  v20.super_class = (Class)ATXHomeScreenLogUploader;
  v2 = [(ATXHomeScreenLogUploader *)&v20 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    widgetSetupDictionaries = v2->_widgetSetupDictionaries;
    v2->_widgetSetupDictionaries = (ATXHomeScreenLogWidgetSetupDictionaries *)v3;

    uint64_t v5 = objc_opt_new();
    widgetEventDictionaries = v2->_widgetEventDictionaries;
    v2->_widgetEventDictionaries = (ATXHomeScreenLogWidgetEventDictionaries *)v5;

    uint64_t v7 = objc_opt_new();
    widgetRotationDictionaries = v2->_widgetRotationDictionaries;
    v2->_widgetRotationDictionaries = (ATXHomeScreenLogWidgetRotationDictionaries *)v7;

    uint64_t v9 = objc_opt_new();
    systemEventDictionary = v2->_systemEventDictionary;
    v2->_systemEventDictionary = (ATXHomeScreenLogSystemEventDictionaries *)v9;

    uint64_t v11 = objc_opt_new();
    systemChangeDictionary = v2->_systemChangeDictionary;
    v2->_systemChangeDictionary = (ATXHomeScreenLogSystemChangeDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    widgetAddSheetDictionaries = v2->_widgetAddSheetDictionaries;
    v2->_widgetAddSheetDictionaries = (ATXHomeScreenLogWidgetAddSheetDictionaries *)v13;

    uint64_t v15 = objc_opt_new();
    widgetDiscoverabilityDictionaries = v2->_widgetDiscoverabilityDictionaries;
    v2->_widgetDiscoverabilityDictionaries = (ATXHomeScreenWidgetDiscoverabilityLogHarvester *)v15;

    uint64_t v17 = objc_opt_new();
    tvWidgetLogHarvester = v2->_tvWidgetLogHarvester;
    v2->_tvWidgetLogHarvester = (ATXTVWidgetLogHarvester *)v17;
  }
  return v2;
}

+ (BOOL)_shouldProcessATXUIEvent:(id)a3 startTime:(double)a4
{
  uint64_t v5 = [a3 homeScreenEvent];
  v6 = v5;
  if (!v5
    || ([v5 date],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v7 timeIntervalSinceReferenceDate],
        double v9 = v8,
        v7,
        v9 <= a4))
  {
    BOOL v11 = 0;
    goto LABEL_9;
  }
  id v10 = [v6 eventTypeString];
  if (([v10 isEqualToString:@"Unknown"] & 1) != 0
    || ([v10 isEqualToString:@"HomeScreenPageShown"] & 1) != 0
    || ([v10 isEqualToString:@"HomeScreenDisappeared"] & 1) != 0)
  {
    goto LABEL_6;
  }
  if (([v10 isEqualToString:@"StackChanged"] & 1) != 0
    || ([v10 isEqualToString:@"WidgetTapped"] & 1) != 0)
  {
LABEL_12:
    BOOL v11 = 1;
    goto LABEL_7;
  }
  if (([v10 isEqualToString:@"WidgetLongLook"] & 1) == 0
    && ([v10 isEqualToString:@"WidgetUserFeedback"] & 1) == 0
    && ([v10 isEqualToString:@"UserStackConfigChanged"] & 1) == 0)
  {
    if (([v10 isEqualToString:@"DeviceLocked"] & 1) != 0
      || ([v10 isEqualToString:@"DeviceUnlocked"] & 1) != 0
      || ([v10 isEqualToString:@"PinnedWidgetAdded"] & 1) != 0
      || ([v10 isEqualToString:@"PinnedWidgetDeleted"] & 1) != 0)
    {
      goto LABEL_12;
    }
    if (([v10 isEqualToString:@"SpecialPageAppeared"] & 1) == 0
      && ([v10 isEqualToString:@"SpecialPageDisappeared"] & 1) == 0)
    {
      if (([v10 isEqualToString:@"StackShown"] & 1) != 0
        || ([v10 isEqualToString:@"StackDisappeared"] & 1) != 0
        || ([v10 isEqualToString:@"StackCreated"] & 1) != 0
        || ([v10 isEqualToString:@"StackDeleted"] & 1) != 0
        || ([v10 isEqualToString:@"WidgetAddedToStack"] & 1) != 0
        || ([v10 isEqualToString:@"WidgetRemovedFromStack"] & 1) != 0)
      {
        goto LABEL_12;
      }
      if (([v10 isEqualToString:@"StackVisibilityChanged"] & 1) == 0
        && ([v10 isEqualToString:@"AppAdded"] & 1) == 0)
      {
        [v10 isEqualToString:@"AppRemoved"];
      }
    }
  }
LABEL_6:
  BOOL v11 = 0;
LABEL_7:

LABEL_9:
  return v11;
}

- (id)_timeBasedMergePublisher:(id)a3 withOtherPublishers:(id)a4
{
  return (id)[a3 orderedMergeWithOthers:a4 comparator:&__block_literal_global_242];
}

uint64_t __73__ATXHomeScreenLogUploader__timeBasedMergePublisher_withOtherPublishers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 timestamp];
  double v7 = v6;
  [v5 timestamp];
  if (v7 >= v8)
  {
    [v4 timestamp];
    double v11 = v10;
    [v5 timestamp];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (void)uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:(id)a3 customStartDate:(id)a4 dryRunCompletionHandler:(id)a5
{
  v127[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v8 didDefer] & 1) == 0)
  {
    id v76 = v10;
    double v11 = objc_opt_new();
    id v123 = 0;
    v78 = [v11 loadHomeScreenAndTodayPageConfigurationsWithError:&v123];
    id v77 = v123;

    if (!v78 || v77)
    {
      v14 = __atxlog_handle_home_screen();
      uint64_t v15 = v14;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[ATXHomeScreenLogUploader uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:customStartDate:dryRunCompletionHandler:]();
        uint64_t v15 = v14;
      }
    }
    else
    {
      if ([v8 didDefer])
      {
LABEL_47:

        id v10 = v76;
        goto LABEL_48;
      }
      if (v9)
      {
        [v9 timeIntervalSinceNow];
        double v13 = -v12;
      }
      else
      {
        double v13 = 86400.0;
      }
      v75 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-v13];
      [v75 timeIntervalSinceReferenceDate];
      uint64_t v17 = v16;
      [(ATXHomeScreenLogSystemEventDictionaries *)self->_systemEventDictionary updateSystemLevelSummaryForHomeScreenPages:v78 startDate:v75];
      [(ATXHomeScreenLogSystemChangeDictionary *)self->_systemChangeDictionary updateSystemChangeSummaryForHomeScreenPages:v78];
      [(ATXHomeScreenLogWidgetSetupDictionaries *)self->_widgetSetupDictionaries updateWidgetSetupSummaryForHomeScreenPages:v78];
      [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)self->_widgetDiscoverabilityDictionaries generateWidgetDiscoverabilityMetricsWithActivity:v8];
      [(ATXTVWidgetLogHarvester *)self->_tvWidgetLogHarvester generateTVWidgetMetrics];
      if (([v8 didDefer] & 1) == 0)
      {
        objc_initWeak(&location, self);
        dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
        v74 = [MEMORY[0x1E4F4AF88] sharedInstance];
        if ([MEMORY[0x1E4F93B08] isiPad]) {
          uint64_t v19 = 2;
        }
        else {
          uint64_t v19 = 0;
        }
        v119[0] = MEMORY[0x1E4F143A8];
        v119[1] = 3221225472;
        v119[2] = __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke;
        v119[3] = &unk_1E68B6120;
        objc_super v20 = v18;
        v120 = v20;
        objc_copyWeak(&v121, &location);
        [v74 fetchSuggestedGalleryItemsOfGridSize:v19 widgetFamilyMask:7294 withCompletionHandler:v119];
        if ([MEMORY[0x1E4F93B18] waitForSemaphore:v20 timeoutSeconds:2.0] == 1)
        {
          v21 = __atxlog_handle_home_screen();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            -[ATXHomeScreenLogUploader uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:customStartDate:dryRunCompletionHandler:].cold.5();
          }
        }
        dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
        v115[0] = MEMORY[0x1E4F143A8];
        v115[1] = 3221225472;
        v115[2] = __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_24;
        v115[3] = &unk_1E68B6148;
        v73 = v22;
        v116 = v73;
        objc_copyWeak(&v118, &location);
        v23 = v20;
        v117 = v23;
        [v74 fetchSmartStackOfVariant:0 completionHandler:v115];
        v66 = v23;
        if ([MEMORY[0x1E4F93B18] waitForSemaphore:v73 timeoutSeconds:2.0] == 1)
        {
          v24 = __atxlog_handle_home_screen();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[ATXHomeScreenLogUploader uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:customStartDate:dryRunCompletionHandler:].cold.4();
          }
        }
        uint64_t v111 = 0;
        v112 = (double *)&v111;
        uint64_t v113 = 0x2020000000;
        uint64_t v114 = 0;
        uint64_t v105 = 0;
        v106 = &v105;
        uint64_t v107 = 0x3032000000;
        v108 = __Block_byref_object_copy__105;
        v109 = __Block_byref_object_dispose__105;
        id v110 = (id)objc_opt_new();
        uint64_t v101 = 0;
        v102 = &v101;
        uint64_t v103 = 0x2020000000;
        uint64_t v104 = 0;
        v99[0] = 0;
        v99[1] = v99;
        v99[2] = 0x3032000000;
        v99[3] = __Block_byref_object_copy__105;
        v99[4] = __Block_byref_object_dispose__105;
        id v100 = (id)objc_opt_new();
        v97[0] = 0;
        v97[1] = v97;
        v97[2] = 0x2020000000;
        char v98 = 0;
        v95[0] = 0;
        v95[1] = v95;
        v95[2] = 0x3032000000;
        v95[3] = __Block_byref_object_copy__105;
        v95[4] = __Block_byref_object_dispose__105;
        id v96 = (id)objc_opt_new();
        double v25 = v13 + 43200.0;
        v26 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-(v13 + 43200.0)];
        [v26 timeIntervalSinceReferenceDate];
        double v28 = v27;

        v29 = objc_opt_new();
        v72 = [v29 genericEventPublisherFromStartTime:v28];

        v30 = BiomeLibrary();
        v31 = [v30 App];
        v32 = [v31 InFocus];
        v33 = [NSNumber numberWithDouble:v28];
        v71 = objc_msgSend(v32, "atx_publisherFromStartTime:", v33);

        v34 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-(v25 + 3600.0)];
        [v34 timeIntervalSinceReferenceDate];
        double v36 = v35;

        v37 = objc_opt_new();
        v70 = [v37 publisherFromStartTime:v36];

        v127[0] = v71;
        v127[1] = v70;
        v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v127 count:2];
        v69 = [(ATXHomeScreenLogUploader *)self _timeBasedMergePublisher:v72 withOtherPublishers:v38];

        v39 = objc_opt_new();
        v40 = objc_opt_new();
        v41 = [v69 filterWithIsIncluded:&__block_literal_global_35_5];
        v84[0] = MEMORY[0x1E4F143A8];
        v84[1] = 3221225472;
        v84[2] = __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_39;
        v84[3] = &unk_1E68B6170;
        objc_copyWeak(v94, &location);
        id v42 = v8;
        id v85 = v42;
        v88 = &v111;
        id v67 = v40;
        id v86 = v67;
        id v43 = v39;
        v94[1] = v17;
        id v68 = v43;
        id v87 = v43;
        v89 = &v101;
        v90 = v95;
        v91 = v97;
        v92 = v99;
        v93 = &v105;
        id v44 = (id)[v41 sinkWithCompletion:&__block_literal_global_38_4 receiveInput:v84];

        if (([v42 didDefer] & 1) == 0)
        {
          [(ATXHomeScreenLogWidgetSetupDictionaries *)self->_widgetSetupDictionaries updateWidgetLevelParentAppLaunches:v106[5]];
          double v45 = v112[3];
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          if (v45 >= v46)
          {
            v63 = __atxlog_handle_home_screen();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
              -[ATXTimelineRelevanceMetricHarvester _addRotationHistoryForWidgetBundleId:appBundleId:widgetKind:widgetSize:withPBTimelineRelevanceContainer:anonymizeTimestampsRelativeTo:]();
            }
          }
          else
          {
            v47 = __atxlog_handle_home_screen();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
              -[ATXHomeScreenLogUploader uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:customStartDate:dryRunCompletionHandler:]();
            }

            long long v82 = 0u;
            long long v83 = 0u;
            long long v80 = 0u;
            long long v81 = 0u;
            v48 = [v68 removeAndReturnCompletedSessions];
            uint64_t v49 = [v48 countByEnumeratingWithState:&v80 objects:v126 count:16];
            if (v49)
            {
              uint64_t v50 = *(void *)v81;
              do
              {
                for (uint64_t i = 0; i != v49; ++i)
                {
                  if (*(void *)v81 != v50) {
                    objc_enumerationMutation(v48);
                  }
                  v52 = *(void **)(*((void *)&v80 + 1) + 8 * i);
                  v53 = [v52 sessionEndDate];
                  [v53 timeIntervalSinceReferenceDate];
                  BOOL v55 = v54 < *(double *)&v17;

                  if (!v55)
                  {
                    [(ATXHomeScreenLogSystemEventDictionaries *)self->_systemEventDictionary updateSystemLevelSummaryWithRotationSession:v52];
                    [(ATXHomeScreenLogWidgetRotationDictionaries *)self->_widgetRotationDictionaries updateWithRotationSession:v52];
                  }
                }
                uint64_t v49 = [v48 countByEnumeratingWithState:&v80 objects:v126 count:16];
              }
              while (v49);
            }

            [(ATXHomeScreenLogSystemEventDictionaries *)self->_systemEventDictionary updateSystemLevelSummaryTotalUnlockSessions:v102[3]];
            [(ATXHomeScreenLogWidgetSetupDictionaries *)self->_widgetSetupDictionaries updateTotalUnlockSessions:v102[3]];
            [(ATXHomeScreenLogSystemEventDictionaries *)self->_systemEventDictionary populateUnlockSessionEngagementSummaryFromManager:v67];
            [(ATXHomeScreenLogSystemEventDictionaries *)self->_systemEventDictionary populateLifetimeNPlusOneStatistics];
            [(ATXHomeScreenLogSystemEventDictionaries *)self->_systemEventDictionary populateHasBehavioralData];
            [(ATXHomeScreenLogSystemEventDictionaries *)self->_systemEventDictionary populateUsedKettle];
            if (v76)
            {
              v124[0] = @"System Event Dictionary";
              v56 = [(ATXHomeScreenLogSystemEventDictionaries *)self->_systemEventDictionary dryRunResult];
              v125[0] = v56;
              v124[1] = @"System Change Dictionary";
              v57 = [(ATXHomeScreenLogSystemChangeDictionary *)self->_systemChangeDictionary dryRunResult];
              v125[1] = v57;
              v124[2] = @"Widget Setup Dictionary";
              v58 = [(ATXHomeScreenLogWidgetSetupDictionaries *)self->_widgetSetupDictionaries dryRunResult];
              v125[2] = v58;
              v124[3] = @"Widget Event Dictionary";
              v59 = [(ATXHomeScreenLogWidgetEventDictionaries *)self->_widgetEventDictionaries dryRunResult];
              v125[3] = v59;
              v124[4] = @"Widget Add Sheet Dictionary";
              v65 = [(ATXHomeScreenLogWidgetAddSheetDictionaries *)self->_widgetAddSheetDictionaries dryRunResult];
              v125[4] = v65;
              v124[5] = @"Widget Rotation Dictionary";
              v60 = [(ATXHomeScreenLogWidgetRotationDictionaries *)self->_widgetRotationDictionaries dryRunResult];
              v125[5] = v60;
              v124[6] = @"Default Stack Metrics Dictionary";
              v61 = [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)self->_widgetDiscoverabilityDictionaries dryRunResult];
              v125[6] = v61;
              v124[7] = @"TV Widget Metrics Dictionary";
              v62 = [(ATXTVWidgetLogHarvester *)self->_tvWidgetLogHarvester dryRunResult];
              v125[7] = v62;
              v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v125 forKeys:v124 count:8];

              (*((void (**)(id, NSObject *, void))v76 + 2))(v76, v63, 0);
              v64 = __atxlog_handle_home_screen();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D0FA3000, v64, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenLogUploader: Daily CoreAnalytics log upload dry-run complete - no actual logs uploaded", buf, 2u);
              }
            }
            else
            {
              [(ATXHomeScreenLogSystemEventDictionaries *)self->_systemEventDictionary sendToCoreAnalytics];
              [(ATXHomeScreenLogSystemChangeDictionary *)self->_systemChangeDictionary sendToCoreAnalytics];
              [(ATXHomeScreenLogWidgetSetupDictionaries *)self->_widgetSetupDictionaries sendToCoreAnalytics];
              [(ATXHomeScreenLogWidgetEventDictionaries *)self->_widgetEventDictionaries sendToCoreAnalytics];
              [(ATXHomeScreenLogWidgetAddSheetDictionaries *)self->_widgetAddSheetDictionaries sendToCoreAnalytics];
              [(ATXHomeScreenLogWidgetRotationDictionaries *)self->_widgetRotationDictionaries sendToCoreAnalytics];
              [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)self->_widgetDiscoverabilityDictionaries sendToCoreAnalytics];
              [(ATXTVWidgetLogHarvester *)self->_tvWidgetLogHarvester sendToCoreAnalytics];
              v63 = __atxlog_handle_home_screen();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D0FA3000, v63, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenLogUploader: Daily CoreAnalytics log upload complete", buf, 2u);
              }
            }
          }
        }
        objc_destroyWeak(v94);

        _Block_object_dispose(v95, 8);
        _Block_object_dispose(v97, 8);
        _Block_object_dispose(v99, 8);

        _Block_object_dispose(&v101, 8);
        _Block_object_dispose(&v105, 8);

        _Block_object_dispose(&v111, 8);
        objc_destroyWeak(&v118);

        objc_destroyWeak(&v121);
        objc_destroyWeak(&location);
      }
      uint64_t v15 = v75;
    }

    goto LABEL_47;
  }
LABEL_48:
}

void __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = v6;
  if (!v5 || v6)
  {
    id v10 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_cold_1();
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    id v9 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained[6] updateWidgetAddSheetSummaryForSuggestions:v5];
    }
    else
    {
      double v11 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_cold_2();
      }
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 count];
  if (v6 || !v7)
  {
    double v13 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_24_cold_1();
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v9 = WeakRetained;
    if (WeakRetained)
    {
      id v10 = (void *)*((void *)WeakRetained + 6);
      double v11 = [v5 firstObject];
      [v10 updateWidgetAddSheetSummaryForDefaultStack:v11];

      double v12 = *(NSObject **)(a1 + 32);
    }
    else
    {
      v14 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_24_cold_2();
      }

      double v12 = *(NSObject **)(a1 + 40);
    }
    dispatch_semaphore_signal(v12);
  }
}

uint64_t __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_32()
{
  return 1;
}

void __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 state];
  id v4 = __atxlog_handle_home_screen();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_2_cold_1(v2, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenLogUploader: Daily CoreAnalytics log processing (task 1 of 2) complete", v6, 2u);
  }
}

void __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 104));
  if (WeakRetained && ([*(id *)(a1 + 32) didDefer] & 1) == 0)
  {
    double v5 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    [v3 timestamp];
    if (v5 >= v6) {
      double v6 = v5;
    }
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6;
    uint64_t v7 = [v3 eventBody];

    if (v7)
    {
      id v8 = [v3 eventBody];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v10 = *(void **)(a1 + 40);
        double v11 = [v3 eventBody];
        uint64_t v12 = [v10 updateSessionStateWithUIEvent:v11];

        double v13 = *(void **)(a1 + 48);
        v14 = [v3 eventBody];
        [v13 updateWithUIEvent:v14];
      }
      else
      {
        uint64_t v12 = 0;
      }
      v16 = [v3 eventBody];
      objc_opt_class();
      char v17 = objc_opt_isKindOfClass();

      if (v17)
      {
        dispatch_semaphore_t v18 = *(void **)(a1 + 48);
        uint64_t v19 = [v3 eventBody];
        [v18 updateWithBlendingUICacheUpdate:v19];
      }
      else
      {
        objc_super v20 = [v3 eventBody];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
        }
        else
        {
          v21 = objc_opt_class();
          dispatch_semaphore_t v22 = [v3 eventBody];
          LODWORD(v21) = [v21 _shouldProcessATXUIEvent:v22 startTime:*(double *)(a1 + 112)];

          if (!v21) {
            goto LABEL_37;
          }
        }
        if (v12 == 1)
        {
          ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
          [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) removeAllObjects];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
        }
        v23 = [v3 eventBody];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          BOOL v55 = v23;
          uint64_t v56 = v12;
          v24 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
          double v25 = [v23 homeScreenEvent];
          v26 = [v25 stackId];
          double v27 = [v24 objectForKeyedSubscript:v26];
          double v28 = [v27 eventBody];
          double v54 = [v28 homeScreenEvent];

          uint64_t v29 = a1;
          +[ATXHomeScreenLogUploaderUtilities stackShownEventsForPseudoTapIfPossible:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) currentEvent:v3];
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          id obj = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v30 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v59;
            do
            {
              for (uint64_t i = 0; i != v31; ++i)
              {
                if (*(void *)v59 != v32) {
                  objc_enumerationMutation(obj);
                }
                v34 = *(void **)(*((void *)&v58 + 1) + 8 * i);
                [WeakRetained[4] updateSystemLevelSummaryForWidgetPseudoTapWithStackShownEvent:v34];
                [WeakRetained[2] updateWidgetLevelSummaryForWidgetPseudoTapWithStackShownEvent:v34];
                double v35 = (void *)MEMORY[0x1E4F4B440];
                double v36 = [v34 widgetBundleId];
                v37 = [v34 widgetKind];
                v38 = [v35 stringRepresentationForExtensionBundleId:v36 kind:v37];

                [*(id *)(*(void *)(*(void *)(v29 + 72) + 8) + 40) setObject:v34 forKeyedSubscript:v38];
              }
              uint64_t v31 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
            }
            while (v31);
          }
          id v39 = WeakRetained[4];
          v23 = v55;
          v40 = [v55 homeScreenEvent];
          [v39 updateSystemLevelSummaryForHomeScreenEvent:v40];

          id v41 = WeakRetained[5];
          id v42 = [v55 homeScreenEvent];
          [v41 updateSystemChangeSummaryForHomeScreenEvent:v42];

          id v43 = WeakRetained[2];
          id v44 = [v55 homeScreenEvent];
          [v43 updateWidgetLevelSummaryForHomeScreenEvent:v44 lastStackEvent:v54];

          uint64_t v12 = v56;
          a1 = v29;
        }
        else
        {
          double v45 = [v3 eventBody];
          objc_opt_class();
          char v46 = objc_opt_isKindOfClass();

          if (v46)
          {
            id v47 = v23;
            if (+[ATXHomeScreenLogUploaderUtilities isValidAppLaunch:v47])
            {
              uint64_t v48 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
              uint64_t v49 = [v47 bundleID];
              +[ATXHomeScreenLogUploaderUtilities incrementDictionary:v48 forKey:v49];

              *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
            }
          }
        }
        if (v12 == 2
          && !*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)
          && [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count])
        {
          id v50 = WeakRetained[4];
          v51 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) allValues];
          [v50 updateSystemLevelUnlockSessionsWithWidgetDwell:v51];

          id v52 = WeakRetained[2];
          v53 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) allValues];
          [v52 updateUnlockSessionsWithWidgetDwell:v53];
        }
      }
    }
    else
    {
      uint64_t v15 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_39_cold_1();
      }
    }
  }
LABEL_37:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tvWidgetLogHarvester, 0);
  objc_storeStrong((id *)&self->_widgetDiscoverabilityDictionaries, 0);
  objc_storeStrong((id *)&self->_widgetAddSheetDictionaries, 0);
  objc_storeStrong((id *)&self->_systemChangeDictionary, 0);
  objc_storeStrong((id *)&self->_systemEventDictionary, 0);
  objc_storeStrong((id *)&self->_widgetRotationDictionaries, 0);
  objc_storeStrong((id *)&self->_widgetEventDictionaries, 0);
  objc_storeStrong((id *)&self->_widgetSetupDictionaries, 0);
}

- (void)uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:customStartDate:dryRunCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "ATXHomeScreenLogUploader: Error while requesting home screen config - %@", v2, v3, v4, v5, v6);
}

- (void)uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:customStartDate:dryRunCompletionHandler:.cold.2()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEBUG, "ATXHomeScreenLogUploader: Biome timestamps are all in the past, proceeding to upload", v1, 2u);
}

- (void)uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:customStartDate:dryRunCompletionHandler:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ATXHomeScreenLogUploader: couldn't update AddSheetSummary for default stack because fetch timed out", v2, v3, v4, v5, v6);
}

- (void)uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:customStartDate:dryRunCompletionHandler:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ATXHomeScreenLogUploader: couldn't update AddSheetSummary for gallery widgets because fetch timed out", v2, v3, v4, v5, v6);
}

void __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "ATXHomeScreenLogUploader: Error while requesting add sheet suggestions - %@", v2, v3, v4, v5, v6);
}

void __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ATXHomeScreenLogUploader: couldn't update AddSheetSummary for gallery widgets because swelf is nil", v2, v3, v4, v5, v6);
}

void __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_24_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "ATXHomeScreenLogUploader: Error while requesting default smart stack - %@", v2, v3, v4, v5, v6);
}

void __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_24_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ATXHomeScreenLogUploader: couldn't update AddSheetSummary for default stack because swelf is nil", v2, v3, v4, v5, v6);
}

void __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 error];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXHomeScreenLogUploader: Error in CoreAnalytics log processing (task 1 of 2) : %@", v4, 0xCu);
}

void __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_39_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ATXHomeScreenLogUploader: Can't deserialize ATXHomeScreenEvent instance", v2, v3, v4, v5, v6);
}

@end