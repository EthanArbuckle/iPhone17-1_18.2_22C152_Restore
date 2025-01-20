@interface ATXUserActivityStream
- (id)_getActivityEventFromBMAppActivity:(id)a3 bundleIdFilter:(id)a4;
- (id)getActivityIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4;
- (id)getActivityIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5;
- (id)getActivityIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5 limit:(unint64_t)a6;
- (unint64_t)numberOfActivityEventsBetweenStartDate:(id)a3 endDate:(id)a4;
- (void)_enumerateActivityIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5 reversed:(BOOL)a6 block:(id)a7;
@end

@implementation ATXUserActivityStream

- (id)getActivityIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4
{
  return [(ATXUserActivityStream *)self getActivityIntentEventsBetweenStartDate:a3 endDate:a4 bundleIdFilter:0];
}

- (id)getActivityIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5
{
  return [(ATXUserActivityStream *)self getActivityIntentEventsBetweenStartDate:a3 endDate:a4 bundleIdFilter:a5 limit:100];
}

- (id)getActivityIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5 limit:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __94__ATXUserActivityStream_getActivityIntentEventsBetweenStartDate_endDate_bundleIdFilter_limit___block_invoke;
  v21 = &unk_1E5D07688;
  id v22 = v13;
  unint64_t v23 = a6;
  id v14 = v13;
  [(ATXUserActivityStream *)self _enumerateActivityIntentEventsBetweenStartDate:v12 endDate:v11 bundleIdFilter:v10 reversed:1 block:&v18];

  v15 = objc_msgSend(v14, "reverseObjectEnumerator", v18, v19, v20, v21);
  v16 = [v15 allObjects];

  return v16;
}

BOOL __94__ATXUserActivityStream_getActivityIntentEventsBetweenStartDate_endDate_bundleIdFilter_limit___block_invoke(uint64_t a1, uint64_t a2)
{
  return (unint64_t)[*(id *)(a1 + 32) count] < *(void *)(a1 + 40);
}

- (unint64_t)numberOfActivityEventsBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__ATXUserActivityStream_numberOfActivityEventsBetweenStartDate_endDate___block_invoke;
  v10[3] = &unk_1E5D076B0;
  v10[4] = &v11;
  [(ATXUserActivityStream *)self _enumerateActivityIntentEventsBetweenStartDate:v6 endDate:v7 bundleIdFilter:0 reversed:0 block:v10];
  unint64_t v8 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __72__ATXUserActivityStream_numberOfActivityEventsBetweenStartDate_endDate___block_invoke(uint64_t a1)
{
  return 1;
}

- (void)_enumerateActivityIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5 reversed:(BOOL)a6 block:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = (void *)MEMORY[0x1AD0D3C30]();
  v17 = BiomeLibrary();
  uint64_t v18 = [v17 App];
  uint64_t v19 = [v18 Activity];
  v20 = v19;
  if (v8) {
    id v21 = v13;
  }
  else {
    id v21 = v12;
  }
  if (v8) {
    id v22 = v12;
  }
  else {
    id v22 = v13;
  }
  unint64_t v23 = objc_msgSend(v19, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v21, v22, 0, 0, v8);

  v24 = +[ATXIntentGlobals sharedInstance];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __110__ATXUserActivityStream__enumerateActivityIntentEventsBetweenStartDate_endDate_bundleIdFilter_reversed_block___block_invoke_7;
  v29[3] = &unk_1E5D09E68;
  id v30 = v24;
  v31 = self;
  id v25 = v14;
  id v32 = v25;
  id v26 = v15;
  id v33 = v26;
  id v27 = v24;
  id v28 = (id)[v23 sinkWithCompletion:&__block_literal_global_83 shouldContinue:v29];
}

void __110__ATXUserActivityStream__enumerateActivityIntentEventsBetweenStartDate_endDate_bundleIdFilter_reversed_block___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __110__ATXUserActivityStream__enumerateActivityIntentEventsBetweenStartDate_endDate_bundleIdFilter_reversed_block___block_invoke_cold_1(v2);
    }
  }
}

uint64_t __110__ATXUserActivityStream__enumerateActivityIntentEventsBetweenStartDate_endDate_bundleIdFilter_reversed_block___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((![*(id *)(a1 + 32) onlyUseEligibleForPrediction]
     || ([v3 eventBody],
         v4 = objc_claimAutoreleasedReturnValue(),
         int v5 = [v4 isEligibleForPrediction],
         v4,
         v5))
    && ([*(id *)(a1 + 40) _getActivityEventFromBMAppActivity:v3 bundleIdFilter:*(void *)(a1 + 48)],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (void *)v6;
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

- (id)_getActivityEventFromBMAppActivity:(id)a3 bundleIdFilter:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 eventBody];
  id v8 = objc_alloc(MEMORY[0x1E4F29128]);
  v9 = [v7 userActivityUUID];
  id v10 = (void *)[v8 initWithUUIDString:v9];

  if (v10)
  {
    uint64_t v11 = [v7 bundleID];
    if ([v11 length])
    {
      if (v6 && ([v6 isEqualToString:v11] & 1) == 0)
      {
        v17 = __atxlog_handle_default();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[ATXUserActivityStream _getActivityEventFromBMAppActivity:bundleIdFilter:].cold.7();
        }
      }
      else
      {
        id v12 = +[ATXIntentGlobals sharedInstance];
        int v13 = [v12 onlyAcceptBecomeCurrentNSUAs];

        if (!v13
          || ([v7 beginningOfActivity] & 1) != 0
          || ([v11 isEqualToString:@"com.apple.mobilesafari"] & 1) != 0)
        {
          id v14 = [v7 userActivityRequiredString];

          if (v14)
          {
            id v15 = objc_alloc(MEMORY[0x1E4F22488]);
            v16 = [v7 userActivityRequiredString];
            v17 = [v15 _initWithUserActivityStrings:v16 secondaryString:0 optionalData:0];

            uint64_t v18 = [v17 activityType];
            if (!v18)
            {
              id v33 = __atxlog_handle_default();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                -[ATXUserActivityStream _getActivityEventFromBMAppActivity:bundleIdFilter:].cold.4();
              }
              id v32 = 0;
              goto LABEL_40;
            }
            uint64_t v19 = (void *)MEMORY[0x1E4F1C9C8];
            [v5 timestamp];
            uint64_t v39 = objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
            v40 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v39 endDate:v39];
            v20 = [v7 itemIdentifier];

            if (!v20)
            {
              unint64_t v23 = __atxlog_handle_default();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                -[ATXUserActivityStream _getActivityEventFromBMAppActivity:bundleIdFilter:].cold.5();
              }
              id v32 = 0;
              goto LABEL_39;
            }
            id v21 = [v7 itemRelatedContentURL];
            v38 = v18;
            if (v21
              || ([v7 itemRelatedUniqueIdentifier],
                  (id v21 = objc_claimAutoreleasedReturnValue()) != 0))
            {
            }
            else
            {
              v36 = [v7 contentDescription];

              if (!v36)
              {
                unint64_t v23 = 0;
                goto LABEL_15;
              }
            }
            id v22 = objc_alloc(MEMORY[0x1E4F23850]);
            unint64_t v23 = [v22 initWithContentType:*MEMORY[0x1E4F44370]];
            v24 = [v7 itemRelatedUniqueIdentifier];
            [v23 setRelatedUniqueIdentifier:v24];

            id v25 = [v7 itemRelatedContentURL];
            [v23 setContentURL:v25];

            id v26 = [v7 contentDescription];
            [v23 setContentDescription:v26];

LABEL_15:
            id v27 = [ATXAction alloc];
            id v28 = [v7 userActivityRequiredString];
            v29 = [v7 itemIdentifier];
            LOBYTE(v37) = 0;
            id v30 = [(ATXAction *)v27 initWithNSUserActivityString:v28 actionUUID:v10 bundleId:v11 itemIdentifier:v29 contentAttributeSet:v23 heuristic:0 heuristicMetadata:0 isFutureMedia:v37 title:0 subtitle:0];

            if ([(ATXAction *)v30 hasActionTitle])
            {
              v31 = +[ATXAction getNSUATypefromActivityType:v38];
              id v32 = [[ATXIntentEvent alloc] initWithBundleId:v11 intentType:v31 dateInterval:v40 action:v30];

              uint64_t v18 = v38;
            }
            else
            {
              v34 = __atxlog_handle_default();
              uint64_t v18 = v38;
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
                -[ATXUserActivityStream _getActivityEventFromBMAppActivity:bundleIdFilter:].cold.6();
              }

              id v32 = 0;
            }

LABEL_39:
            id v33 = v39;

LABEL_40:
            goto LABEL_41;
          }
          v17 = __atxlog_handle_default();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            -[ATXUserActivityStream _getActivityEventFromBMAppActivity:bundleIdFilter:]();
          }
        }
        else
        {
          v17 = __atxlog_handle_default();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v11;
            _os_log_impl(&dword_1A790D000, v17, OS_LOG_TYPE_INFO, "Donation Processing (NSUA) - skipping non-beginning activity for bundleId: %@", buf, 0xCu);
          }
        }
      }
    }
    else
    {
      v17 = __atxlog_handle_default();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[ATXUserActivityStream _getActivityEventFromBMAppActivity:bundleIdFilter:](v7);
      }
    }
    id v32 = 0;
LABEL_41:

    goto LABEL_42;
  }
  uint64_t v11 = __atxlog_handle_default();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    -[ATXUserActivityStream _getActivityEventFromBMAppActivity:bundleIdFilter:](v11);
  }
  id v32 = 0;
LABEL_42:

  return v32;
}

void __110__ATXUserActivityStream__enumerateActivityIntentEventsBetweenStartDate_endDate_bundleIdFilter_reversed_block___block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v2, v3, "ATXUserActivityStream: Can't read App.Activity stream with error: %@", v4, v5, v6, v7, v8);
}

- (void)_getActivityEventFromBMAppActivity:(os_log_t)log bundleIdFilter:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "Donation Processing (NSUA) - Unable to parse UUID", v1, 2u);
}

- (void)_getActivityEventFromBMAppActivity:(void *)a1 bundleIdFilter:.cold.2(void *a1)
{
  v1 = [a1 userActivityUUID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v2, v3, "Donation Processing (NSUA) - No bundleId found for eventUUID: %@", v4, v5, v6, v7, v8);
}

- (void)_getActivityEventFromBMAppActivity:bundleIdFilter:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Donation Processing (NSUA) - Nil requiredString for bundleId: %@", v2, v3, v4, v5, v6);
}

- (void)_getActivityEventFromBMAppActivity:bundleIdFilter:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Donation Processing (NSUA) - Nil activityType for NSUserActivity: %@", v2, v3, v4, v5, v6);
}

- (void)_getActivityEventFromBMAppActivity:bundleIdFilter:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Donation Processing (NSUA) - No item identifier for activity: %@", v2, v3, v4, v5, v6);
}

- (void)_getActivityEventFromBMAppActivity:bundleIdFilter:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Donation Processing (NSUA) - Nil or empty title attached to event of activityType: %@ -- filtering out", v2, v3, v4, v5, v6);
}

- (void)_getActivityEventFromBMAppActivity:bundleIdFilter:.cold.7()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1A790D000, v1, OS_LOG_TYPE_DEBUG, "Donation Processing (NSUA) - Rejected: filtered out bundle id %@ that doesn't match %@", v2, 0x16u);
}

@end