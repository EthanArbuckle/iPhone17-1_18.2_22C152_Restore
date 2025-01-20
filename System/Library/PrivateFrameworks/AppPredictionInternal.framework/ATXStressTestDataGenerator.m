@interface ATXStressTestDataGenerator
- (id)_startCallIntentWithRecipientName:(id)a3;
- (id)_visitWebpageNSUAForURLString:(id)a3;
- (void)_updateActionFeedbackWithConfirmsAndRejects;
- (void)_updateDonationPipelineWithIntentsAndNSUAs;
- (void)clearAllDataForStressCycler;
- (void)clearAllDataForStressCyclerWithCompletion:(id)a3;
- (void)clearDataForBehavioralActionPredictions;
- (void)enumerateSampleIntentAndUserActivityATXActionsWithBlock:(id)a3;
- (void)enumerateSampleIntentAndUserActivityEventsWithBlock:(id)a3;
- (void)generateDataForBehavioralActionPredictions;
- (void)seedAllDataForStressCycler;
- (void)setupForStressCyclerWithCompletion:(id)a3;
@end

@implementation ATXStressTestDataGenerator

- (void)clearAllDataForStressCycler
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  sel_getName(a2);
  v3 = (void *)os_transaction_create();
  [(ATXStressTestDataGenerator *)self clearDataForBehavioralActionPredictions];
  v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "%@ - clearAllDataForStressCycler finished", (uint8_t *)&v7, 0xCu);
  }
}

- (void)seedAllDataForStressCycler
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  sel_getName(a2);
  v3 = (void *)os_transaction_create();
  [(ATXStressTestDataGenerator *)self generateDataForBehavioralActionPredictions];
  v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "%@ - seedAllDataForStressCycler finished", (uint8_t *)&v7, 0xCu);
  }
}

- (void)setupForStressCyclerWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  [(ATXStressTestDataGenerator *)self clearAllDataForStressCycler];
  [(ATXStressTestDataGenerator *)self seedAllDataForStressCycler];
  v4[2](v4, 0);

  xpc_transaction_exit_clean();
}

- (void)clearAllDataForStressCyclerWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  [(ATXStressTestDataGenerator *)self clearAllDataForStressCycler];
  v4[2](v4, 0);
}

- (void)generateDataForBehavioralActionPredictions
{
  [(ATXStressTestDataGenerator *)self _updateDonationPipelineWithIntentsAndNSUAs];
  [(ATXStressTestDataGenerator *)self _updateActionFeedbackWithConfirmsAndRejects];
}

- (void)clearDataForBehavioralActionPredictions
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  +[_ATXActionUtils resetActionPredictions];
  v2 = __atxlog_handle_default();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "%@ - BehavioralActionPredictions: cleared all action prediction data", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_updateDonationPipelineWithIntentsAndNSUAs
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [ATXAppIntentMonitor alloc];
  v4 = +[_ATXAppLaunchHistogramManager sharedInstance];
  int v5 = +[_ATXAppInfoManager sharedInstance];
  v6 = +[_ATXAppLaunchSequenceManager sharedInstance];
  uint64_t v7 = +[_ATXDataStore sharedInstance];
  v8 = [(ATXAppIntentMonitor *)v3 initWithAppLaunchHistogramManager:v4 appInfoManager:v5 appActionLaunchSequenceManager:v6 dataStore:v7];

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __101__ATXStressTestDataGenerator_BehavioralActionPredictions___updateDonationPipelineWithIntentsAndNSUAs__block_invoke;
  v14[3] = &unk_1E68B00E0;
  uint64_t v9 = v8;
  v15 = v9;
  v16 = &v17;
  [(ATXStressTestDataGenerator *)self enumerateSampleIntentAndUserActivityEventsWithBlock:v14];
  v10 = __atxlog_handle_default();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    uint64_t v13 = v18[3];
    *(_DWORD *)buf = 138412546;
    v22 = v12;
    __int16 v23 = 2048;
    uint64_t v24 = v13;
    _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "%@ - BehavioralActionPredictions: finished updating donation pipeline with: %lu actions", buf, 0x16u);
  }
  _Block_object_dispose(&v17, 8);
}

void __101__ATXStressTestDataGenerator_BehavioralActionPredictions___updateDonationPipelineWithIntentsAndNSUAs__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v4 startDate];
  v6 = [v4 endDate];
  LODWORD(v7) = 1.0;
  [v3 updateActionPredictionPipelineForIntentEvent:v4 weight:v5 appSessionStartDate:v6 appSessionEndDate:v7];

  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (void)_updateActionFeedbackWithConfirmsAndRejects
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = +[_ATXDataStore sharedInstance];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __102__ATXStressTestDataGenerator_BehavioralActionPredictions___updateActionFeedbackWithConfirmsAndRejects__block_invoke;
  v9[3] = &unk_1E68B0108;
  id v10 = &unk_1F27F2C58;
  id v4 = v3;
  id v11 = v4;
  v12 = &v13;
  [(ATXStressTestDataGenerator *)self enumerateSampleIntentAndUserActivityATXActionsWithBlock:v9];
  int v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    uint64_t v8 = v14[3];
    *(_DWORD *)buf = 138412546;
    v18 = v7;
    __int16 v19 = 2048;
    uint64_t v20 = v8;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%@ - BehavioralActionPredictions: finished updating action feedback %lu times", buf, 0x16u);
  }
  _Block_object_dispose(&v13, 8);
}

void __102__ATXStressTestDataGenerator_BehavioralActionPredictions___updateActionFeedbackWithConfirmsAndRejects__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v36;
    id v4 = off_1E68AA000;
    uint64_t v34 = a1;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v5;
        char v30 = [*(id *)(*((void *)&v35 + 1) + 8 * v5) unsignedIntValue];
        uint64_t v6 = 3;
        do
        {
          uint64_t v33 = v6;
          BOOL v7 = arc4random_uniform(0xFFFFFFFF) == -1;
          BOOL v8 = arc4random_uniform(0xFFFFFFFF) == -1;
          v31 = *(void **)(a1 + 40);
          BOOL v32 = v8;
          uint64_t v9 = v4[343];
          id v10 = [v3 actionKey];
          id v11 = [(__objc2_class *)v9 getActionTypeFromActionKey:v10];
          v12 = [v3 bundleId];
          uint64_t v13 = [v3 slotSet];
          v14 = [v3 actionUUID];
          uint64_t v15 = objc_opt_new();
          LOBYTE(v24) = v30;
          [v31 recordConfirms:2 rejects:v11 forFeedbackType:v12 forActionType:v3 bundleId:v13 action:v14 slotSet:1.0 actionUUID:0.0 date:v15 consumerSubType:v24 geohash:v7 coarseGeohash:v8];

          uint64_t v16 = *(void **)(v34 + 40);
          uint64_t v17 = [v3 actionKey];
          v18 = +[_ATXActionUtils getActionTypeFromActionKey:v17];
          __int16 v19 = [v3 bundleId];
          uint64_t v20 = [v3 slotSet];
          uint64_t v21 = [v3 actionUUID];
          v22 = objc_opt_new();
          LOBYTE(v25) = v30;
          __int16 v23 = v16;
          a1 = v34;
          id v4 = off_1E68AA000;
          [v23 recordConfirms:2 rejects:v18 forFeedbackType:v19 forActionType:v3 bundleId:v20 action:v21 slotSet:0.0 actionUUID:1.0 date:v22 consumerSubType:v25 geohash:v7 coarseGeohash:v32];

          *(void *)(*(void *)(*(void *)(v34 + 48) + 8) + 24) += 2;
          uint64_t v6 = v33 - 1;
        }
        while (v33 != 1);
        uint64_t v5 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v28);
  }
}

- (id)_visitWebpageNSUAForURLString:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F22488];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = (void *)[v5 initWithActivityType:*MEMORY[0x1E4F28AC0]];
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v4];
  [v6 setWebpageURL:v7];

  BOOL v8 = (void *)[[NSString alloc] initWithFormat:@"SC DEBUG: %@", v4];
  [v6 setTitle:v8];

  [v6 setEligibleForPrediction:1];
  return v6;
}

- (id)_startCallIntentWithRecipientName:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F305B8];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithValue:v4 type:0];
  id v6 = objc_alloc(MEMORY[0x1E4F305B0]);
  BOOL v7 = [NSString stringWithFormat:@"SC DEBUG: %@", v4];

  BOOL v8 = (void *)[v6 initWithPersonHandle:v5 nameComponents:0 displayName:v7 image:0 contactIdentifier:0 customIdentifier:0];
  id v9 = objc_alloc(MEMORY[0x1E4F30760]);
  v13[0] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v11 = (void *)[v9 initWithCallRecordFilter:0 callRecordToCallBack:0 audioRoute:1 destinationType:1 contacts:v10 callCapability:1];

  return v11;
}

- (void)enumerateSampleIntentAndUserActivityATXActionsWithBlock:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  long long v37 = +[_ATXAppIconState sharedInstance];
  id v5 = [v37 allAppsKnownToSpringBoard];
  id v6 = objc_msgSend(v5, "subarrayWithRange:", 0, 30);

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v6;
  uint64_t v40 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v45;
    unint64_t v7 = 0x1E4F29000uLL;
    unint64_t v8 = 0x1E4F28000uLL;
    unint64_t v9 = 0x1E4F4A000uLL;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v45 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = v10;
        uint64_t v43 = *(void *)(*((void *)&v44 + 1) + 8 * v10);
        context = (void *)MEMORY[0x1D25F6CC0]();
        for (uint64_t i = 0; i != 5; ++i)
        {
          unint64_t v12 = v7;
          id v13 = objc_alloc(*(Class *)(v7 + 24));
          [*(id *)(v8 + 3792) numberWithUnsignedInteger:i];
          uint64_t v15 = v14 = v8;
          uint64_t v16 = (void *)[v13 initWithFormat:@"https://www.example%@.com", v15];

          uint64_t v17 = [(ATXStressTestDataGenerator *)self _visitWebpageNSUAForURLString:v16];
          v18 = self;
          id v19 = objc_alloc(*(Class *)(v9 + 3640));
          unint64_t v20 = v9;
          uint64_t v21 = objc_opt_new();
          LOBYTE(v36) = 0;
          v22 = (void *)[v19 initWithNSUserActivity:v17 actionUUID:v21 bundleId:v43 contentAttributeSet:0 itemIdentifier:0 heuristic:0 heuristicMetadata:0 criteria:0 isFutureMedia:v36 title:v16 subtitle:v16];

          uint64_t v23 = MEMORY[0x1D25F6CC0]();
          v4[2](v4, v22);
          uint64_t v24 = (void *)v23;
          unint64_t v9 = v20;

          self = v18;
          unint64_t v8 = v14;

          unint64_t v7 = v12;
        }
        for (uint64_t j = 0; j != 5; ++j)
        {
          id v26 = objc_alloc(*(Class *)(v7 + 24));
          uint64_t v27 = [*(id *)(v8 + 3792) numberWithUnsignedInteger:j];
          uint64_t v28 = (void *)[v26 initWithFormat:@"Contact Name: %@", v27];

          uint64_t v29 = [(ATXStressTestDataGenerator *)self _startCallIntentWithRecipientName:v28];
          id v30 = objc_alloc(*(Class *)(v9 + 3640));
          v31 = objc_opt_new();
          LOBYTE(v35) = 0;
          BOOL v32 = (void *)[v30 initWithIntent:v29 actionUUID:v31 bundleId:v43 heuristic:0 heuristicMetadata:0 criteria:0 isFutureMedia:v35 title:v28 subtitle:v28];

          uint64_t v33 = MEMORY[0x1D25F6CC0]();
          v4[2](v4, v32);
          uint64_t v34 = (void *)v33;
          unint64_t v9 = v20;

          self = v18;
          unint64_t v8 = v14;

          unint64_t v7 = v12;
        }
        uint64_t v10 = v42 + 1;
      }
      while (v42 + 1 != v40);
      uint64_t v40 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v40);
  }
}

- (void)enumerateSampleIntentAndUserActivityEventsWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __111__ATXStressTestDataGenerator_BehavioralActionPredictions__enumerateSampleIntentAndUserActivityEventsWithBlock___block_invoke;
  v6[3] = &unk_1E68B0130;
  id v7 = v4;
  id v5 = v4;
  [(ATXStressTestDataGenerator *)self enumerateSampleIntentAndUserActivityATXActionsWithBlock:v6];
}

void __111__ATXStressTestDataGenerator_BehavioralActionPredictions__enumerateSampleIntentAndUserActivityEventsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v4 = objc_opt_new();
  id v5 = (void *)[v3 initWithStartDate:v4 duration:20.0];

  id v6 = [v16 intent];

  if (v6)
  {
    id v7 = [v16 intent];
    unint64_t v8 = [v7 _className];
  }
  else
  {
    unint64_t v9 = [v16 userActivity];

    if (!v9) {
      goto LABEL_7;
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F4AE38];
    id v7 = [v16 userActivity];
    id v11 = [v7 activityType];
    unint64_t v8 = [v10 getNSUATypefromActivityType:v11];
  }
  if (v8)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F4B0F8]);
    id v13 = [v16 bundleId];
    unint64_t v14 = (void *)[v12 initWithBundleId:v13 intentType:v8 dateInterval:v5 action:v16];

    uint64_t v15 = (void *)MEMORY[0x1D25F6CC0]();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
LABEL_7:
}

@end