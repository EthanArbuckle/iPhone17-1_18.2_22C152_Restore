@interface ATXAppPredictorFeedback
+ (double)_bucketize:(double)result bucketSize:(double)a4;
+ (id)_appDictionaryForFeedbackItem:(id)a3;
+ (id)_getLastAppIntentsWithEngagedAction:(id)a3 combinedIntentStream:(id)a4 limit:(int)a5;
+ (id)_getLastAppsWithEngagedApp:(id)a3 limit:(int)a4;
+ (id)constructFeatureDictionaryWithFeedbackItems:(id)a3 engagedItem:(id)a4 shownItemIndexes:(id)a5 consumerType:(unint64_t)a6 histogramBundleIdTable:(id)a7;
+ (id)constructSessionLogDictionaryWithFeedbackItems:(id)a3 engagedBundleId:(id)a4 shownBundleIdIndexes:(id)a5 consumerType:(unint64_t)a6 consumerSubType:(unsigned __int8)a7 outcome:(unint64_t)a8 annotation:(id)a9 context:(id)a10;
+ (int64_t)getEngagedItemIndexWithFeedbackItems:(id)a3 engagedItem:(id)a4;
+ (unint64_t)_outcomeForEngagementType:(unint64_t)a3;
+ (void)_sessionObjectLoggingForFeedbackItems:(id)a3 engagedBundleId:(id)a4 shownBundleIdIndexes:(id)a5 consumerType:(unint64_t)a6 consumerSubType:(unsigned __int8)a7 outcome:(unint64_t)a8 context:(id)a9;
+ (void)_tryLogInstalledAppClipSessionEngagementMetricWithConsumerSubType:(unsigned __int8)a3 engagedBundleId:(id)a4 bundleIdsShown:(id)a5 explicitlyRejectedBundleIds:(id)a6 abGroupIdentifier:(id)a7 tracker:(id)a8;
+ (void)checkFeedbackContainsUninstalledApps:(id)a3 consumerSubType:(unsigned __int8)a4 aggregateLogger:(id)a5;
+ (void)logEngagedMMMetricsEntryForBundle:(id)a3 anchorType:(int64_t)a4 consumerSubType:(unsigned __int8)a5 score:(double)a6;
+ (void)logShownMMMetricsEntryForBundle:(id)a3 anchorType:(int64_t)a4 consumerSubType:(unsigned __int8)a5 score:(double)a6;
+ (void)receiveFeedbackForConsumerType:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 feedbackItemsForResponse:(id)a5 engagementType:(unint64_t)a6 engagedBundleId:(id)a7 bundleIdsShown:(id)a8 explicitlyRejectedBundleIds:(id)a9 abGroupIdentifier:(id)a10 context:(id)a11;
+ (void)receiveFeedbackForConsumerType:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 feedbackItemsForResponse:(id)a5 engagementType:(unint64_t)a6 engagedBundleId:(id)a7 bundleIdsShown:(id)a8 explicitlyRejectedBundleIds:(id)a9 abGroupIdentifier:(id)a10 context:(id)a11 feedbackInstance:(id)a12 aggregateLogger:(id)a13 petTracker:(id)a14;
- (ATXAppPredictorFeedback)init;
- (ATXAppPredictorFeedback)initWithPredictionContextBuilder:(id)a3 feedbackInstance:(id)a4 aggregateLogger:(id)a5 petTracker:(id)a6;
- (id)_bundleIdsFromProactiveSuggestions:(id)a3;
- (id)_engagedBundleIdFromEngagedSuggestion:(id)a3 feedbackSession:(id)a4;
- (id)clientModelIds;
- (unint64_t)_engagementTypeFromEngagedSuggestion:(id)a3 engagedBundleId:(id)a4 shownBundleIds:(id)a5 didSearchDuringSession:(BOOL)a6;
- (unint64_t)_engagementTypeFromUIFeedbackResult:(id)a3 engagedSuggestion:(id)a4 engagedBundleId:(id)a5 shownBundleIds:(id)a6;
- (void)_syncForTests;
- (void)receiveUIFeedbackResult:(id)a3;
@end

@implementation ATXAppPredictorFeedback

+ (void)checkFeedbackContainsUninstalledApps:(id)a3 consumerSubType:(unsigned __int8)a4 aggregateLogger:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__ATXAppPredictorFeedback_checkFeedbackContainsUninstalledApps_consumerSubType_aggregateLogger___block_invoke;
  aBlock[3] = &unk_1E68AD4C0;
  id v17 = v7;
  id v18 = v8;
  unsigned __int8 v19 = a4;
  id v9 = v8;
  id v10 = v7;
  v11 = _Block_copy(aBlock);
  v12 = dispatch_get_global_queue(9, 0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __96__ATXAppPredictorFeedback_checkFeedbackContainsUninstalledApps_consumerSubType_aggregateLogger___block_invoke_2;
  v14[3] = &unk_1E68AB618;
  id v15 = v11;
  id v13 = v11;
  dispatch_async(v12, v14);
}

void __96__ATXAppPredictorFeedback_checkFeedbackContainsUninstalledApps_consumerSubType_aggregateLogger___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = +[_ATXAppIconState sharedInstance];
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4 = [v2 allInstalledAppsKnownToSpringBoard];
  v5 = (void *)[v3 initWithArray:v4];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "bundleId", (void)v14);
        int v13 = [v5 containsObject:v12];

        v9 += v13 ^ 1u;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);

    if (v9) {
      [*(id *)(a1 + 40) logPredictUninstalledApps:v9 consumerSubType:*(unsigned __int8 *)(a1 + 48)];
    }
  }
  else
  {
  }
}

uint64_t __96__ATXAppPredictorFeedback_checkFeedbackContainsUninstalledApps_consumerSubType_aggregateLogger___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (ATXAppPredictorFeedback)init
{
  id v3 = +[ATXPredictionContextBuilder sharedInstance];
  v4 = +[_ATXFeedback sharedInstance];
  v5 = +[_ATXAggregateLogger sharedInstance];
  id v6 = objc_opt_new();
  uint64_t v7 = [(ATXAppPredictorFeedback *)self initWithPredictionContextBuilder:v3 feedbackInstance:v4 aggregateLogger:v5 petTracker:v6];

  return v7;
}

- (ATXAppPredictorFeedback)initWithPredictionContextBuilder:(id)a3 feedbackInstance:(id)a4 aggregateLogger:(id)a5 petTracker:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ATXAppPredictorFeedback;
  int v13 = [(ATXAppPredictorFeedback *)&v21 init];
  if (v13)
  {
    long long v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    id v15 = objc_claimAutoreleasedReturnValue();
    long long v16 = (const char *)[v15 UTF8String];
    long long v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create(v16, v17);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v13->_feedbackInstance, a4);
    objc_storeStrong((id *)&v13->_aggregateLogger, a5);
    objc_storeStrong((id *)&v13->_petTracker, a6);
  }

  return v13;
}

- (id)_bundleIdsFromProactiveSuggestions:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_95);
}

uint64_t __62__ATXAppPredictorFeedback__bundleIdsFromProactiveSuggestions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bundleIdExecutableObject];
}

- (unint64_t)_engagementTypeFromEngagedSuggestion:(id)a3 engagedBundleId:(id)a4 shownBundleIds:(id)a5 didSearchDuringSession:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (v10)
  {
    int v13 = [v11 containsObject:v10];
    int v14 = v13;
    if (v9)
    {
      if (v13)
      {
        unint64_t v15 = 1;
        goto LABEL_13;
      }
LABEL_12:
      unint64_t v15 = 2;
      goto LABEL_13;
    }
    if ([v12 containsObject:v10]) {
      unint64_t v15 = 3;
    }
    else {
      unint64_t v15 = 1;
    }
    if (!v14) {
      goto LABEL_12;
    }
  }
  else if (v6)
  {
    unint64_t v15 = 4;
  }
  else
  {
    unint64_t v15 = 5;
  }
LABEL_13:

  return v15;
}

- (unint64_t)_engagementTypeFromUIFeedbackResult:(id)a3 engagedSuggestion:(id)a4 engagedBundleId:(id)a5 shownBundleIds:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  int v13 = [a3 session];
  int v14 = [v13 sessionMetadata];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  long long v16 = [v13 sessionMetadata];
  if (isKindOfClass) {
    goto LABEL_2;
  }
  objc_opt_class();
  char v18 = objc_opt_isKindOfClass();

  if (v18)
  {
    unint64_t v17 = [(ATXAppPredictorFeedback *)self _engagementTypeFromEngagedSuggestion:v10 engagedBundleId:v11 shownBundleIds:v12 didSearchDuringSession:0];
    goto LABEL_11;
  }
  uint64_t v19 = [v13 sessionMetadata];
  objc_opt_class();
  char v20 = objc_opt_isKindOfClass();

  if ((v20 & 1) == 0)
  {
    unint64_t v17 = 0;
    goto LABEL_11;
  }
  long long v16 = [v13 sessionMetadata];
  objc_super v21 = [v16 engagedBundleId];

  if (!v21) {
    goto LABEL_2;
  }
  v22 = [v16 engagedBundleIdInTopAppsVisible];
  char v23 = [v22 BOOLValue];

  if (v23) {
    unint64_t v17 = 6;
  }
  else {
LABEL_2:
  }
    unint64_t v17 = -[ATXAppPredictorFeedback _engagementTypeFromEngagedSuggestion:engagedBundleId:shownBundleIds:didSearchDuringSession:](self, "_engagementTypeFromEngagedSuggestion:engagedBundleId:shownBundleIds:didSearchDuringSession:", v10, v11, v12, [v16 didSearchDuringSession]);

LABEL_11:
  return v17;
}

- (id)_engagedBundleIdFromEngagedSuggestion:(id)a3 feedbackSession:(id)a4
{
  id v5 = a4;
  BOOL v6 = [a3 bundleIdExecutableObject];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
    goto LABEL_10;
  }
  id v9 = [v5 sessionMetadata];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v9 engagedAppString];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v8 = 0;
      goto LABEL_9;
    }
    uint64_t v10 = [v9 engagedBundleId];
  }
  id v8 = (id)v10;
LABEL_9:

LABEL_10:
  return v8;
}

- (id)clientModelIds
{
  v2 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:15];
  id v3 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:16];
  v4 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:17];
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v2, v3, v4, 0);

  return v5;
}

- (void)receiveUIFeedbackResult:(id)a3
{
  id v5 = a3;
  BOOL v6 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ATXAppPredictorFeedback receiveUIFeedbackResult:].cold.5((uint64_t)v5, v6);
  }

  uint64_t v7 = [v5 shownSuggestions];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = [v5 consumerSubType];
    uint64_t v10 = [MEMORY[0x1E4F4B680] consumerTypeForSubType:v9];
    if (!v9 || (uint64_t v11 = v10) == 0)
    {
      int v13 = __atxlog_handle_feedback();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ATXAppPredictorFeedback receiveUIFeedbackResult:](v13);
      }
      goto LABEL_24;
    }
    id v12 = [v5 engagedSuggestions];
    int v13 = [v12 firstObject];

    int v14 = [v5 session];
    unint64_t v15 = [(ATXAppPredictorFeedback *)self _engagedBundleIdFromEngagedSuggestion:v13 feedbackSession:v14];

    long long v16 = [v5 shownSuggestions];
    unint64_t v17 = [(ATXAppPredictorFeedback *)self _bundleIdsFromProactiveSuggestions:v16];

    char v18 = [v5 rejectedSuggestions];
    uint64_t v19 = [(ATXAppPredictorFeedback *)self _bundleIdsFromProactiveSuggestions:v18];

    unint64_t v20 = [(ATXAppPredictorFeedback *)self _engagementTypeFromUIFeedbackResult:v5 engagedSuggestion:v13 engagedBundleId:v15 shownBundleIds:v17];
    if (!v20)
    {
LABEL_23:

LABEL_24:
      goto LABEL_25;
    }
    unint64_t v21 = v20;
    v36 = v15;
    v37 = v19;
    v35 = v17;
    v22 = [v5 clientCacheUpdate];
    char v23 = [v22 feedbackMetadata];
    v24 = +[ATXAppPredictionFeedbackItem feedbackItemsForCacheFileData:v23];

    v34 = v24;
    if (![v24 count])
    {
      v30 = __atxlog_handle_feedback();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        -[ATXAppPredictorFeedback receiveUIFeedbackResult:](v30);
      }
      unint64_t v17 = v35;
      unint64_t v15 = v36;
      uint64_t v19 = v37;
      v29 = v34;
      goto LABEL_22;
    }
    v25 = +[_ATXAppPredictor sharedInstance];
    v26 = [v25 abGroupIdentifiers];
    v33 = [v26 objectAtIndexedSubscript:v9];

    v27 = [v5 context];
    if (v27)
    {
      objc_opt_class();
      unint64_t v17 = v35;
      unint64_t v15 = v36;
      if (objc_opt_isKindOfClass())
      {
        sel_getName(a2);
        v28 = (void *)os_transaction_create();
        queue = self->_queue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __51__ATXAppPredictorFeedback_receiveUIFeedbackResult___block_invoke;
        block[3] = &unk_1E68B07E0;
        block[4] = self;
        uint64_t v46 = v11;
        char v48 = v9;
        v29 = v34;
        id v39 = v34;
        unint64_t v47 = v21;
        id v40 = v36;
        id v41 = v35;
        id v42 = v37;
        v30 = v33;
        v43 = v33;
        id v44 = v27;
        id v45 = v28;
        v31 = v28;
        dispatch_sync(queue, block);

LABEL_21:
        uint64_t v19 = v37;
LABEL_22:

        goto LABEL_23;
      }
      v31 = __atxlog_handle_feedback();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
        -[ATXAppPredictorFeedback receiveUIFeedbackResult:].cold.4((uint64_t)v27, v31);
      }
    }
    else
    {
      v31 = __atxlog_handle_feedback();
      unint64_t v17 = v35;
      unint64_t v15 = v36;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[ATXAppPredictorFeedback receiveUIFeedbackResult:](v31);
      }
    }
    v30 = v33;
    v29 = v34;
    goto LABEL_21;
  }
LABEL_25:
}

id __51__ATXAppPredictorFeedback_receiveUIFeedbackResult___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  [(id)objc_opt_class() receiveFeedbackForConsumerType:*(void *)(a1 + 96) consumerSubType:*(unsigned __int8 *)(a1 + 112) feedbackItemsForResponse:*(void *)(a1 + 40) engagementType:*(void *)(a1 + 104) engagedBundleId:*(void *)(a1 + 48) bundleIdsShown:*(void *)(a1 + 56) explicitlyRejectedBundleIds:*(void *)(a1 + 64) abGroupIdentifier:*(void *)(a1 + 72) context:*(void *)(a1 + 80) feedbackInstance:*(void *)(*(void *)(a1 + 32) + 16) aggregateLogger:*(void *)(*(void *)(a1 + 32) + 24) petTracker:*(void *)(*(void *)(a1 + 32) + 32)];
  return self;
}

+ (void)receiveFeedbackForConsumerType:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 feedbackItemsForResponse:(id)a5 engagementType:(unint64_t)a6 engagedBundleId:(id)a7 bundleIdsShown:(id)a8 explicitlyRejectedBundleIds:(id)a9 abGroupIdentifier:(id)a10 context:(id)a11
{
  unsigned int v24 = a4;
  id v15 = a11;
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a5;
  unint64_t v21 = objc_opt_class();
  id v26 = +[_ATXFeedback sharedInstance];
  v22 = +[_ATXAggregateLogger sharedInstance];
  char v23 = objc_opt_new();
  [v21 receiveFeedbackForConsumerType:a3 consumerSubType:v24 feedbackItemsForResponse:v20 engagementType:a6 engagedBundleId:v19 bundleIdsShown:v18 explicitlyRejectedBundleIds:v17 abGroupIdentifier:v16 context:v15 feedbackInstance:v26 aggregateLogger:v22 petTracker:v23];
}

+ (void)receiveFeedbackForConsumerType:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 feedbackItemsForResponse:(id)a5 engagementType:(unint64_t)a6 engagedBundleId:(id)a7 bundleIdsShown:(id)a8 explicitlyRejectedBundleIds:(id)a9 abGroupIdentifier:(id)a10 context:(id)a11 feedbackInstance:(id)a12 aggregateLogger:(id)a13 petTracker:(id)a14
{
  uint64_t v16 = a4;
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v18 = a5;
  id v101 = a7;
  id v19 = a8;
  id v89 = a9;
  id v96 = a10;
  id v85 = a11;
  id v84 = a12;
  id v20 = a13;
  id v82 = a14;
  id v21 = v18;
  id v83 = a1;
  unsigned int v97 = v16;
  v99 = v20;
  [a1 checkFeedbackContainsUninstalledApps:v21 consumerSubType:v16 aggregateLogger:v20];
  v22 = objc_opt_new();
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v23 = v21;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v103 objects:v117 count:16];
  if (!v24) {
    goto LABEL_15;
  }
  uint64_t v25 = v24;
  uint64_t v26 = 0;
  uint64_t v27 = *(void *)v104;
  do
  {
    uint64_t v28 = 0;
    do
    {
      if (*(void *)v104 != v27) {
        objc_enumerationMutation(v23);
      }
      v29 = *(void **)(*((void *)&v103 + 1) + 8 * v28);
      v30 = [v29 bundleId];
      int v31 = [v19 containsObject:v30];

      if (v31)
      {
        [v22 addIndex:v26 + v28];
        v32 = __atxlog_handle_default();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_10;
        }
        *(_DWORD *)buf = 138412290;
        v108 = v29;
        v33 = v32;
        v34 = "Displayed item in feedback:\n%@";
      }
      else
      {
        v32 = __atxlog_handle_default();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_10;
        }
        *(_DWORD *)buf = 138412290;
        v108 = v29;
        v33 = v32;
        v34 = "Non-displayed item in feedback:\n%@";
      }
      _os_log_debug_impl(&dword_1D0FA3000, v33, OS_LOG_TYPE_DEBUG, v34, buf, 0xCu);
LABEL_10:

      ++v28;
    }
    while (v25 != v28);
    uint64_t v35 = [v23 countByEnumeratingWithState:&v103 objects:v117 count:16];
    uint64_t v25 = v35;
    v26 += v28;
  }
  while (v35);
LABEL_15:

  unint64_t v36 = +[ATXAppPredictorFeedback _outcomeForEngagementType:a6];
  v93 = objc_opt_new();
  uint64_t v37 = [v19 count];
  unint64_t v38 = v36 - 3;
  unint64_t v98 = v36;
  if (v36 == 3 || v36 == 6) {
    uint64_t v40 = v37 + 1;
  }
  else {
    uint64_t v40 = v37;
  }
  unint64_t v100 = v40;
  id v41 = +[_ATXGlobals sharedInstance];
  [v41 appPredictionSessionDataHarvestSamplingRate];
  BOOL v95 = +[_ATXAggregateLogger yesWithProbability:](_ATXAggregateLogger, "yesWithProbability:");

  id v42 = +[_ATXGlobals sharedInstance];
  unint64_t v94 = [v42 appPredictionSessionDataHarvestingMaxItems];

  v43 = [MEMORY[0x1E4F29128] UUID];
  v90 = [v43 UUIDString];

  id v44 = v101;
  if ([v23 count] && v100)
  {
    unint64_t v45 = 0;
    BOOL v46 = v38 < 3;
    uint64_t v47 = 3;
    if (v38 < 3) {
      uint64_t v47 = 4;
    }
    uint64_t v92 = v47;
    if (!v101) {
      BOOL v46 = 1;
    }
    BOOL v91 = v46;
    unint64_t v86 = v98 - 1;
    unint64_t v48 = 1;
    while (1)
    {
      v49 = [v23 objectAtIndexedSubscript:v48 - 1];
      v50 = [v49 bundleId];

      id v51 = [v23 objectAtIndexedSubscript:v48 - 1];
      float v52 = *(float *)([v51 scoreInputs] + 300);

      if ([v19 containsObject:v50]) {
        break;
      }
      if (v44 && ([v50 isEqualToString:v44] & 1) != 0)
      {
        uint64_t v59 = 2;
        goto LABEL_40;
      }
LABEL_51:

      if (v48 < [v23 count])
      {
        ++v48;
        if (v45 < v100) {
          continue;
        }
      }
      goto LABEL_55;
    }
    if (v52 == 0.0)
    {
      id v53 = [v23 objectAtIndexedSubscript:v48 - 1];
      unint64_t v54 = v45;
      uint64_t v55 = (uint64_t)*(float *)([v53 scoreInputs] + 288);
      id v56 = [v23 objectAtIndexedSubscript:v48 - 1];
      uint64_t v57 = [v56 scoreInputs];
      uint64_t v58 = v55;
      unint64_t v45 = v54;
      +[ATXAppPredictorFeedback logShownMMMetricsEntryForBundle:v50 anchorType:v58 consumerSubType:v97 score:*(float *)(v57 + 280)];

      id v44 = v101;
    }
    uint64_t v59 = v92;
    if (!v91)
    {
      if ([v50 isEqualToString:v44])
      {
        unint64_t v60 = v98;
        if (v86 >= 8) {
          uint64_t v59 = 0;
        }
        else {
          uint64_t v59 = qword_1D142B778[v86];
        }
        goto LABEL_41;
      }
      uint64_t v59 = 3;
    }
    [v93 addObject:v50];
LABEL_40:
    unint64_t v60 = v98;
LABEL_41:
    v102 = v50;
    if (v45 < v94 && v95)
    {
      [v23 objectAtIndexedSubscript:v48 - 1];
      v63 = unint64_t v62 = v45;
      +[ATXAppPredictionDataHarvester harvestDataFromPredictionItem:v63 itemIndex:v62 itemOutcome:v59 sessionOutcome:v60 sessionUUID:v90];

      unint64_t v45 = v62;
    }
    unint64_t v64 = v45 + 1;
    id v65 = [v23 objectAtIndexedSubscript:v48 - 1];
    uint64_t v66 = [v65 scoreInputs];
    v67 = [v23 objectAtIndexedSubscript:v48 - 1];
    [v67 totalScore];
    objc_msgSend(v99, "logPredictionOfAppWithBundleId:inputs:outcome:rank:score:forABGroup:", v102, v66, v59, v48 - 1, v96);

    if (v59)
    {
      id v44 = v101;
    }
    else
    {
      id v44 = v101;
      if (v52 == 0.0)
      {
        id v68 = [v23 objectAtIndexedSubscript:v48 - 1];
        uint64_t v69 = (uint64_t)*(float *)([v68 scoreInputs] + 288);
        id v70 = [v23 objectAtIndexedSubscript:v48 - 1];
        +[ATXAppPredictorFeedback logEngagedMMMetricsEntryForBundle:anchorType:consumerSubType:score:](ATXAppPredictorFeedback, "logEngagedMMMetricsEntryForBundle:anchorType:consumerSubType:score:", v101, v69, v97, *(float *)([v70 scoreInputs] + 280));
      }
    }
    unint64_t v45 = v64;
    v50 = v102;
    goto LABEL_51;
  }
LABEL_55:
  unint64_t v71 = a3;
  id v72 = v89;
  if (([MEMORY[0x1E4F93B10] isClassCLocked] & 1) == 0 && a3 <= 0xF && ((1 << a3) & 0xC006) != 0)
  {
    id v73 = v44;
    v74 = v73;
    if (a6 == 6)
    {

      v74 = 0;
    }
    [v84 feedbackLaunchedWithConsumerType:a3 forBundleId:v74 rejected:v93 explicitlyRejected:v89 context:v85];
    v75 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      v76 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v97];
      v77 = [MEMORY[0x1E4F4B680] stringForEngagementType:a6];
      *(_DWORD *)buf = 138413314;
      v108 = v76;
      __int16 v109 = 2112;
      v110 = v77;
      __int16 v111 = 2112;
      id v112 = v74;
      __int16 v113 = 2112;
      id v114 = v93;
      __int16 v115 = 2112;
      id v116 = v89;
      _os_log_impl(&dword_1D0FA3000, v75, OS_LOG_TYPE_DEFAULT, "ATXAppPredictorFeedback recorded feedback for consumerSubType: %@ \nengagementType: %@ \nengaged: %@ \nrejected: %@ explicitlyRejected: %@", buf, 0x34u);

      id v72 = v89;
      unint64_t v71 = a3;
    }
  }
  uint64_t v78 = v97;
  [v99 logPredictionEventWith:v19 outcome:v98 forABGroup:v96 consumerType:v71 andSubType:v97];
  v79 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
  {
    v80 = +[_ATXAggregateLogger stringForPredictionOutcome:v98];
    v81 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v97];
    *(_DWORD *)buf = 138413058;
    v108 = v80;
    __int16 v109 = 2112;
    v110 = v81;
    __int16 v111 = 2112;
    id v112 = v96;
    __int16 v113 = 2112;
    id v114 = v19;
    _os_log_impl(&dword_1D0FA3000, v79, OS_LOG_TYPE_DEFAULT, "ATXAppPredictorFeedback logged session with outcome: %@ consumerSubType: %@, abGroup: %@, bundleIdsShown: %@", buf, 0x2Au);

    uint64_t v78 = v97;
    unint64_t v71 = a3;
  }

  [v83 _tryLogInstalledAppClipSessionEngagementMetricWithConsumerSubType:v78 engagedBundleId:v44 bundleIdsShown:v19 explicitlyRejectedBundleIds:v72 abGroupIdentifier:v96 tracker:v82];
  +[ATXAppPredictorFeedback _sessionObjectLoggingForFeedbackItems:v23 engagedBundleId:v44 shownBundleIdIndexes:v22 consumerType:v71 consumerSubType:v78 outcome:v98 context:v85];
}

+ (void)_tryLogInstalledAppClipSessionEngagementMetricWithConsumerSubType:(unsigned __int8)a3 engagedBundleId:(id)a4 bundleIdsShown:(id)a5 explicitlyRejectedBundleIds:(id)a6 abGroupIdentifier:(id)a7 tracker:(id)a8
{
  uint64_t v12 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = objc_msgSend(a5, "_pas_filteredArrayWithTest:", &__block_literal_global_40_2);
  if ([v18 count])
  {
    if (v14) {
      int v19 = [MEMORY[0x1E4F4AF00] isAppClipWebClipBundleId:v14];
    }
    else {
      int v19 = 0;
    }
    id v20 = objc_msgSend(v15, "_pas_filteredArrayWithTest:", &__block_literal_global_43);
    uint64_t v21 = [v20 count];

    if (v19 && ([v18 containsObject:v14] & 1) != 0) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = 2 * (v21 != 0);
    }
    id v23 = objc_opt_new();
    [v23 setEngagementType:v22];
    uint64_t v24 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v12];
    [v23 setConsumerSubType:v24];

    objc_msgSend(v23, "setNumSuggestionsShown:", objc_msgSend(v18, "count"));
    [v23 setAbGroup:v16];
    [v17 trackScalarForMessage:v23];
    uint64_t v25 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      +[ATXAppPredictorFeedback _tryLogInstalledAppClipSessionEngagementMetricWithConsumerSubType:engagedBundleId:bundleIdsShown:explicitlyRejectedBundleIds:abGroupIdentifier:tracker:]((uint64_t)a1, v23, v25);
    }
  }
}

uint64_t __178__ATXAppPredictorFeedback__tryLogInstalledAppClipSessionEngagementMetricWithConsumerSubType_engagedBundleId_bundleIdsShown_explicitlyRejectedBundleIds_abGroupIdentifier_tracker___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F4AF00] isAppClipWebClipBundleId:a2];
}

uint64_t __178__ATXAppPredictorFeedback__tryLogInstalledAppClipSessionEngagementMetricWithConsumerSubType_engagedBundleId_bundleIdsShown_explicitlyRejectedBundleIds_abGroupIdentifier_tracker___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F4AF00] isAppClipWebClipBundleId:a2];
}

+ (void)logShownMMMetricsEntryForBundle:(id)a3 anchorType:(int64_t)a4 consumerSubType:(unsigned __int8)a5 score:(double)a6
{
  if (a5 == 35)
  {
    id v9 = a3;
    id v15 = (id)objc_opt_new();
    [v15 setBundleId:v9];

    objc_msgSend(v15, "setAnchor:", +[ATXMMAppPredictionExpert mmAnchorTypeToMMProtobufAnchor:](ATXMMAppPredictionExpert, "mmAnchorTypeToMMProtobufAnchor:", a4));
    uint64_t v10 = +[_ATXAppPredictor sharedInstance];
    uint64_t v11 = [v10 abGroupIdentifiers];
    uint64_t v12 = [v11 objectAtIndexedSubscript:16];

    [v15 setAbGroup:v12];
    int v13 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:35];
    [v15 setConsumerSubType:v13];

    id v14 = [MEMORY[0x1E4F93728] sharedInstance];
    [v14 trackDistributionForMessage:v15 value:a6];
  }
}

+ (void)logEngagedMMMetricsEntryForBundle:(id)a3 anchorType:(int64_t)a4 consumerSubType:(unsigned __int8)a5 score:(double)a6
{
  if (a5 == 35)
  {
    id v9 = a3;
    id v15 = (id)objc_opt_new();
    objc_msgSend(v15, "setAnchor:", +[ATXMMAppPredictionExpert mmAnchorTypeToMMProtobufAnchor:](ATXMMAppPredictionExpert, "mmAnchorTypeToMMProtobufAnchor:", a4));
    [v15 setBundleId:v9];

    uint64_t v10 = +[_ATXAppPredictor sharedInstance];
    uint64_t v11 = [v10 abGroupIdentifiers];
    uint64_t v12 = [v11 objectAtIndexedSubscript:16];

    [v15 setAbGroup:v12];
    int v13 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:35];
    [v15 setConsumerSubType:v13];

    id v14 = [MEMORY[0x1E4F93728] sharedInstance];
    [v14 trackDistributionForMessage:v15 value:a6];
  }
}

+ (unint64_t)_outcomeForEngagementType:(unint64_t)a3
{
  unint64_t result = 0;
  switch(a3)
  {
    case 0uLL:
    case 7uLL:
      v4 = __atxlog_handle_default();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        +[ATXAppPredictorFeedback _outcomeForEngagementType:](a3, v4);
      }

      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Invalid ATXEngagementType value of %lu received in feedback", a3);
      __break(1u);
      JUMPOUT(0x1D119AD78);
    case 2uLL:
      unint64_t result = 3;
      break;
    case 3uLL:
      unint64_t result = 2;
      break;
    case 4uLL:
    case 5uLL:
    case 6uLL:
      unint64_t result = a3;
      break;
    default:
      return result;
  }
  return result;
}

+ (void)_sessionObjectLoggingForFeedbackItems:(id)a3 engagedBundleId:(id)a4 shownBundleIdIndexes:(id)a5 consumerType:(unint64_t)a6 consumerSubType:(unsigned __int8)a7 outcome:(unint64_t)a8 context:(id)a9
{
  uint64_t v10 = a7;
  id v25 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a9;
  char v17 = [v16 isOverridden];
  if ((a8 & 0xFFFFFFFFFFFFFFFELL) != 4 && (v17 & 1) == 0)
  {
    id v18 = +[_ATXGlobals sharedInstance];
    [v18 sessionObjectLogSamplingRate];
    double v20 = v19;

    int v21 = [MEMORY[0x1E4F93B08] isInternalBuild];
    double v22 = v20 * 10.0;
    if (v20 * 10.0 > 1.0) {
      double v22 = 1.0;
    }
    if (!v21) {
      double v22 = v20;
    }
    if (+[_ATXAggregateLogger yesWithProbability:v22])
    {
      id v23 = (void *)MEMORY[0x1D25F6CC0]();
      uint64_t v24 = +[ATXAppPredictorFeedback constructSessionLogDictionaryWithFeedbackItems:v25 engagedBundleId:v14 shownBundleIdIndexes:v15 consumerType:a6 consumerSubType:v10 outcome:a8 annotation:0 context:v16];
      +[ATXAWDUtils logAppPredictionDictionaryViaAWD:v24];
    }
  }
}

+ (int64_t)getEngagedItemIndexWithFeedbackItems:(id)a3 engagedItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    int64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = [v5 objectAtIndexedSubscript:v7];
      id v9 = [v8 bundleId];
      char v10 = [v6 isEqualToString:v9];

      if (v10) {
        break;
      }
      if (++v7 >= (unint64_t)[v5 count]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    int64_t v7 = -1;
  }

  return v7;
}

+ (id)constructFeatureDictionaryWithFeedbackItems:(id)a3 engagedItem:(id)a4 shownItemIndexes:(id)a5 consumerType:(unint64_t)a6 histogramBundleIdTable:(id)a7
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = (id)[v11 count];
  if (v15)
  {
    uint64_t v69 = v14;
    id v70 = v13;
    id v71 = v12;
    uint64_t v16 = [v13 count];
    char v17 = +[_ATXGlobals sharedInstance];
    id v18 = v17;
    unint64_t v65 = a6;
    if (a6 == 8) {
      int v19 = [v17 extraIntentsToLog];
    }
    else {
      int v19 = [v17 extraAppsToLog];
    }
    int v20 = v19;

    if (v16 + v20 >= (uint64_t)v15) {
      unint64_t v21 = (unint64_t)v15;
    }
    else {
      unint64_t v21 = v16 + v20;
    }
    double v22 = objc_opt_new();
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v23 = v11;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v89 objects:v95 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v90;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v90 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void **)(*((void *)&v89 + 1) + 8 * i);
          v29 = [v28 bundleId];
          [v22 setObject:v28 forKeyedSubscript:v29];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v89 objects:v95 count:16];
      }
      while (v25);
    }
    id v67 = v11;

    v30 = objc_opt_new();
    id v31 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v32 = [v22 allKeys];
    v33 = (void *)[v31 initWithArray:v32];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __136__ATXAppPredictorFeedback_constructFeatureDictionaryWithFeedbackItems_engagedItem_shownItemIndexes_consumerType_histogramBundleIdTable___block_invoke;
    aBlock[3] = &unk_1E68B0808;
    id v34 = v33;
    id v86 = v34;
    id v72 = v30;
    id v87 = v72;
    unint64_t v88 = v21;
    uint64_t v35 = (void (**)(void *, void *))_Block_copy(aBlock);
    int64_t v36 = +[ATXAppPredictorFeedback getEngagedItemIndexWithFeedbackItems:v23 engagedItem:v71];
    if (v36 != -1)
    {
      uint64_t v37 = [v23 objectAtIndexedSubscript:v36];
      v35[2](v35, v37);
    }
    int64_t v63 = v36;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v82 = 0u;
    long long v81 = 0u;
    unint64_t v38 = [v23 objectsAtIndexes:v70];
    uint64_t v39 = [v38 countByEnumeratingWithState:&v81 objects:v94 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v82;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v82 != v41) {
            objc_enumerationMutation(v38);
          }
          v35[2](v35, *(void **)(*((void *)&v81 + 1) + 8 * j));
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v81 objects:v94 count:16];
      }
      while (v40);
    }

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v68 = v34;
    v43 = +[ATXUtils shuffle:v34];
    uint64_t v44 = [v43 countByEnumeratingWithState:&v77 objects:v93 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v78;
LABEL_26:
      uint64_t v47 = 0;
      while (1)
      {
        if (*(void *)v78 != v46) {
          objc_enumerationMutation(v43);
        }
        uint64_t v48 = *(void *)(*((void *)&v77 + 1) + 8 * v47);
        if ([v72 count] >= v21) {
          break;
        }
        v49 = [v22 objectForKeyedSubscript:v48];
        v35[2](v35, v49);

        if (v45 == ++v47)
        {
          uint64_t v45 = [v43 countByEnumeratingWithState:&v77 objects:v93 count:16];
          if (v45) {
            goto LABEL_26;
          }
          break;
        }
      }
    }

    v50 = v68;
    if (v65 == 8 && v63 != -1)
    {
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __136__ATXAppPredictorFeedback_constructFeatureDictionaryWithFeedbackItems_engagedItem_shownItemIndexes_consumerType_histogramBundleIdTable___block_invoke_2;
      v73[3] = &unk_1E68B0830;
      id v74 = v22;
      id v75 = v68;
      id v76 = v72;
      id v51 = (void (**)(void *, void *))_Block_copy(v73);
      float v52 = [v23 objectAtIndexedSubscript:v63];
      id v53 = [v52 bundleId];
      unint64_t v54 = +[_ATXActionUtils getBundleIdAndActionTypeFromActionKey:v53];

      if (v54)
      {
        unint64_t v64 = [v54 first];
        [v54 second];
        uint64_t v55 = v66 = v52;
        id v56 = [MEMORY[0x1E4F1CA80] setWithObject:v64];
        uint64_t v57 = +[_ATXActionUtils actionKeyFilterForCandidateBundleIds:v56 candidateActionTypes:0 blacklist:0];
        uint64_t v58 = [v69 allKeysFilteredBy:v57];

        v51[2](v51, v58);
        uint64_t v59 = [MEMORY[0x1E4F1CA80] setWithObject:v55];
        unint64_t v60 = +[_ATXActionUtils actionKeyFilterForCandidateBundleIds:0 candidateActionTypes:v59 blacklist:0];
        v61 = [v69 allKeysFilteredBy:v60];

        v51[2](v51, v61);
        v50 = v68;

        float v52 = v66;
      }
    }
    id v15 = v72;

    id v11 = v67;
    id v13 = v70;
    id v12 = v71;
    id v14 = v69;
  }

  return v15;
}

void __136__ATXAppPredictorFeedback_constructFeatureDictionaryWithFeedbackItems_engagedItem_shownItemIndexes_consumerType_histogramBundleIdTable___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 bundleId];
  if ([*(id *)(a1 + 32) containsObject:v3]
    && (unint64_t)[*(id *)(a1 + 40) count] < *(void *)(a1 + 48))
  {
    v4 = *(void **)(a1 + 40);
    id v5 = +[ATXAppPredictorFeedback _appDictionaryForFeedbackItem:v6];
    [v4 addObject:v5];

    [*(id *)(a1 + 32) removeObject:v3];
  }
}

void __136__ATXAppPredictorFeedback_constructFeatureDictionaryWithFeedbackItems_engagedItem_shownItemIndexes_consumerType_histogramBundleIdTable___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        id v9 = (void *)MEMORY[0x1D25F6CC0](v4);
        char v10 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8, (void)v13);
        if ([*(id *)(a1 + 40) containsObject:v8])
        {
          id v11 = *(void **)(a1 + 48);
          id v12 = +[ATXAppPredictorFeedback _appDictionaryForFeedbackItem:v10];
          [v11 addObject:v12];

          [*(id *)(a1 + 40) removeObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v5 = v4;
    }
    while (v4);
  }
}

+ (id)constructSessionLogDictionaryWithFeedbackItems:(id)a3 engagedBundleId:(id)a4 shownBundleIdIndexes:(id)a5 consumerType:(unint64_t)a6 consumerSubType:(unsigned __int8)a7 outcome:(unint64_t)a8 annotation:(id)a9 context:(id)a10
{
  uint64_t v11 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a9;
  id v19 = a10;
  if ([v19 isOverridden])
  {
    id v20 = 0;
  }
  else
  {
    v180 = v18;
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v181 = v15;
    unint64_t v21 = +[ATXHistogramBundleIdTable sharedInstance];
    unint64_t v170 = a6;
    double v22 = +[ATXAppPredictorFeedback constructFeatureDictionaryWithFeedbackItems:v15 engagedItem:v16 shownItemIndexes:v17 consumerType:a6 histogramBundleIdTable:v21];
    [v20 setObject:v22 forKeyedSubscript:@"AppData"];

    id v23 = [NSNumber numberWithUnsignedInteger:a8];
    [v20 setObject:v23 forKeyedSubscript:@"Outcome"];

    uint64_t v24 = objc_msgSend(NSNumber, "numberWithInteger:", +[ATXAppPredictorFeedback getEngagedItemIndexWithFeedbackItems:engagedItem:](ATXAppPredictorFeedback, "getEngagedItemIndexWithFeedbackItems:engagedItem:", v15, v16));
    [v20 setObject:v24 forKeyedSubscript:@"EngagedApp"];

    [v20 setObject:&unk_1F27F0DC8 forKeyedSubscript:@"session_log_version"];
    +[ATXFileUtil cacheAgeForConsumerType:v11];
    uint64_t v26 = [NSNumber numberWithDouble:floor(v25 / 10.0) * 10.0];
    [v20 setObject:v26 forKeyedSubscript:@"PredictionCacheAge"];

    uint64_t v27 = [v19 timeContext];
    v174 = [v27 date];

    uint64_t v28 = +[_ATXAppLaunchHistogramManager sharedInstance];
    v29 = [v28 histogramForLaunchType:0];

    v30 = +[_ATXAppLaunchHistogramManager sharedInstance];
    v179 = [v30 histogramForLaunchType:1];

    id v31 = +[_ATXAppLaunchHistogramManager sharedInstance];
    v178 = [v31 histogramForLaunchType:2];

    v32 = +[_ATXAppLaunchHistogramManager sharedInstance];
    v177 = [v32 histogramForLaunchType:3];

    v33 = +[_ATXAppLaunchHistogramManager sharedInstance];
    v176 = [v33 histogramForLaunchType:5];

    id v34 = +[_ATXAppLaunchHistogramManager sharedInstance];
    v175 = [v34 categoricalHistogramForLaunchType:4];

    uint64_t v35 = +[_ATXAppLaunchHistogramManager sharedInstance];
    uint64_t v36 = [v35 categoricalHistogramForLaunchType:37];

    uint64_t v37 = [v19 userContext];
    uint64_t v38 = [v37 lastAppLaunch];

    v167 = (void *)v36;
    v171 = (void *)v38;
    unsigned int v166 = v11;
    if (v38)
    {
      uint64_t v39 = +[_ATXAppLaunchSequenceManager sharedInstance];
      uint64_t v40 = [v39 launchSequenceForBundle:v38];
    }
    else
    {
      uint64_t v40 = 0;
    }
    [v29 totalLaunches];
    double v42 = fabs(v41);
    BOOL v43 = v42 <= INFINITY;
    if (v42 >= INFINITY) {
      double v44 = -31337.0;
    }
    else {
      double v44 = v41;
    }
    if (v43) {
      double v41 = v44;
    }
    uint64_t v45 = [NSNumber numberWithLongLong:(uint64_t)v41];
    [v20 setObject:v45 forKeyedSubscript:@"TotalLaunches"];

    [v29 totalTimeOfDayLaunchesForDate:v174];
    double v47 = fabs(v46);
    BOOL v48 = v47 <= INFINITY;
    if (v47 >= INFINITY) {
      double v49 = -31337.0;
    }
    else {
      double v49 = v46;
    }
    if (v48) {
      double v46 = v49;
    }
    v50 = [NSNumber numberWithLongLong:(uint64_t)v46];
    [v20 setObject:v50 forKeyedSubscript:@"TotalTimeOfDayLaunches"];

    [v179 totalLaunches];
    double v52 = fabs(v51);
    BOOL v53 = v52 <= INFINITY;
    if (v52 >= INFINITY) {
      double v54 = -31337.0;
    }
    else {
      double v54 = v51;
    }
    if (v53) {
      double v51 = v54;
    }
    uint64_t v55 = [NSNumber numberWithLongLong:(uint64_t)v51];
    [v20 setObject:v55 forKeyedSubscript:@"TotalSpotlightLaunches"];

    [v179 totalTimeOfDayLaunchesForDate:v174];
    double v57 = fabs(v56);
    BOOL v58 = v57 <= INFINITY;
    if (v57 >= INFINITY) {
      double v59 = -31337.0;
    }
    else {
      double v59 = v56;
    }
    if (v58) {
      double v56 = v59;
    }
    unint64_t v60 = [NSNumber numberWithLongLong:(uint64_t)v56];
    [v20 setObject:v60 forKeyedSubscript:@"TotalSpotlightTimeOfDayLaunches"];

    [v178 totalLaunches];
    double v62 = fabs(v61);
    BOOL v63 = v62 <= INFINITY;
    if (v62 >= INFINITY) {
      double v64 = -31337.0;
    }
    else {
      double v64 = v61;
    }
    if (v63) {
      double v61 = v64;
    }
    unint64_t v65 = [NSNumber numberWithLongLong:(uint64_t)v61];
    [v20 setObject:v65 forKeyedSubscript:@"TotalDayOfWeekLaunches"];

    [v178 totalTimeOfDayLaunchesForDate:v174];
    double v67 = fabs(v66);
    BOOL v68 = v67 <= INFINITY;
    if (v67 >= INFINITY) {
      double v69 = -31337.0;
    }
    else {
      double v69 = v66;
    }
    if (v68) {
      double v66 = v69;
    }
    id v70 = [NSNumber numberWithLongLong:(uint64_t)v66];
    [v20 setObject:v70 forKeyedSubscript:@"TotalCurrentDayOfWeekLaunches"];

    id v71 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v72 = [v71 component:32 fromDate:v174];
    uint64_t v73 = [v71 component:512 fromDate:v174] - 1;
    id v74 = [NSNumber numberWithInteger:v72 / 4];
    [v20 setObject:v74 forKeyedSubscript:@"TimeOfDayInterval"];

    id v75 = [NSNumber numberWithInteger:v73];
    [v20 setObject:v75 forKeyedSubscript:@"DayOfWeek"];

    [v40 subsequentLaunchTotalCount];
    double v77 = fabs(v76);
    BOOL v78 = v77 <= INFINITY;
    if (v77 >= INFINITY) {
      double v79 = -31337.0;
    }
    else {
      double v79 = v76;
    }
    if (v78) {
      double v76 = v79;
    }
    long long v80 = [NSNumber numberWithLongLong:(uint64_t)v76];
    [v20 setObject:v80 forKeyedSubscript:@"TotalLaunchSequences"];

    [v177 totalLaunches];
    double v82 = fabs(v81);
    BOOL v83 = v82 <= INFINITY;
    if (v82 >= INFINITY) {
      double v84 = -31337.0;
    }
    else {
      double v84 = v81;
    }
    if (v83) {
      double v81 = v84;
    }
    id v85 = [NSNumber numberWithLongLong:(uint64_t)v81];
    [v20 setObject:v85 forKeyedSubscript:@"TotalAirplaneModeLaunches"];

    id v86 = NSNumber;
    id v87 = [v19 deviceStateContext];
    unint64_t v88 = objc_msgSend(v86, "numberWithInt:", objc_msgSend(v87, "inAirplaneMode"));
    [v20 setObject:v88 forKeyedSubscript:@"InAirplaneMode"];

    [v176 totalLaunches];
    double v90 = fabs(v89);
    BOOL v91 = v90 <= INFINITY;
    if (v90 >= INFINITY) {
      double v92 = -31337.0;
    }
    else {
      double v92 = v89;
    }
    if (v91) {
      double v89 = v92;
    }
    v93 = [NSNumber numberWithLongLong:(uint64_t)v89];
    [v20 setObject:v93 forKeyedSubscript:@"TotalTrendingLaunches"];

    unint64_t v94 = [v19 deviceStateContext];
    BOOL v95 = [v94 wifiSSID];

    [v175 totalLaunches];
    double v97 = fabs(v96);
    BOOL v98 = v97 <= INFINITY;
    if (v97 >= INFINITY) {
      double v99 = -31337.0;
    }
    else {
      double v99 = v96;
    }
    if (v98) {
      double v96 = v99;
    }
    unint64_t v100 = [NSNumber numberWithLongLong:(uint64_t)v96];
    [v20 setObject:v100 forKeyedSubscript:@"TotalWifiLaunches"];

    v172 = v29;
    id v173 = v17;
    v168 = v40;
    if ([v95 length])
    {
      [v175 totalLaunchesForCategory:v95];
      double v102 = fabs(v101);
      BOOL v103 = v102 <= INFINITY;
      if (v102 >= INFINITY) {
        double v104 = -31337.0;
      }
      else {
        double v104 = v101;
      }
      if (v103) {
        double v101 = v104;
      }
      long long v105 = [NSNumber numberWithLongLong:(uint64_t)v101];
      [v20 setObject:v105 forKeyedSubscript:@"TotalSSIDLaunches"];
    }
    else
    {
      [v20 setObject:&unk_1F27F0DE0 forKeyedSubscript:@"TotalSSIDLaunches"];
    }
    [v167 totalLaunches];
    double v107 = fabs(v106);
    BOOL v108 = v107 <= INFINITY;
    if (v107 >= INFINITY) {
      double v109 = -31337.0;
    }
    else {
      double v109 = v106;
    }
    if (v108) {
      double v106 = v109;
    }
    v110 = [NSNumber numberWithLongLong:(uint64_t)v106];
    [v20 setObject:v110 forKeyedSubscript:@"CoreMotionLaunches"];

    __int16 v111 = (void *)MEMORY[0x1E4F93608];
    id v112 = [v19 locationMotionContext];
    __int16 v113 = objc_msgSend(v111, "getMotionStringFromMotionType:", objc_msgSend(v112, "motionType"));

    v169 = v71;
    if ([v113 length])
    {
      [v167 totalLaunchesForCategory:v113];
      double v115 = fabs(v114);
      BOOL v116 = v115 <= INFINITY;
      if (v115 >= INFINITY) {
        double v117 = -31337.0;
      }
      else {
        double v117 = v114;
      }
      if (v116) {
        double v114 = v117;
      }
      uint64_t v118 = [NSNumber numberWithLongLong:(uint64_t)v114];
      [v20 setObject:v118 forKeyedSubscript:@"CoreMotionCurrentMotionLaunches"];
    }
    else
    {
      [v20 setObject:&unk_1F27F0DE0 forKeyedSubscript:@"CoreMotionCurrentMotionLaunches"];
    }
    v119 = [MEMORY[0x1E4F4B680] stringForConsumerType:v170];
    [v20 setObject:v119 forKeyedSubscript:@"ConsumerType"];

    v120 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v166];
    [v20 setObject:v120 forKeyedSubscript:@"ConsumerSubType"];

    if ([v180 length]) {
      [v20 setObject:v180 forKeyedSubscript:@"annotation"];
    }
    if ([MEMORY[0x1E4F93B08] isInternalBuild]) {
      [v20 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"IsInternalBuild"];
    }
    if ((v166 - 48) > 0xD0u)
    {
      v122 = +[_ATXAppPredictor sharedInstance];
      v123 = [v122 abGroupIdentifiers];
      v124 = [v123 objectAtIndexedSubscript:v166];

      [v20 setObject:v124 forKeyedSubscript:@"ABGroup"];
    }
    else
    {
      uint64_t v121 = [v20 setObject:@"ERROR!" forKeyedSubscript:@"ABGroup"];
    }
    v125 = (void *)MEMORY[0x1D25F6CC0](v121);
    v126 = +[_ATXGlobals sharedInstance];
    if ([v126 sessionLoggingCurrentLOITypeEnable])
    {
      v127 = [v19 locationMotionContext];
      v128 = [v127 currentLOI];

      if (v128) {
        uint64_t v129 = [v128 type];
      }
      else {
        uint64_t v129 = -1;
      }
      v130 = [MEMORY[0x1E4F935D0] stringForLOIType:v129];
      [v20 setObject:v130 forKeyedSubscript:@"CurrentLOIType"];
    }
    if ([v126 sessionLoggingHomeDistanceEnable])
    {
      v131 = objc_opt_class();
      v132 = [v19 locationMotionContext];
      [v132 distanceFromHomeOfCurrentLocationInMeters];
      double v134 = v133;
      [v126 sessionLoggingDistanceAccuracy];
      [v131 _bucketize:v134 bucketSize:v135];
      double v137 = v136;

      if (v137 >= 0.0)
      {
        v138 = [NSNumber numberWithDouble:v137];
        [v20 setObject:v138 forKeyedSubscript:@"LocationDistanceFromHome"];
      }
    }
    if ([v126 sessionLoggingWorkDistanceEnable])
    {
      v139 = objc_opt_class();
      v140 = [v19 locationMotionContext];
      [v140 distanceFromWorkOfCurrentLocationInMeters];
      double v142 = v141;
      [v126 sessionLoggingDistanceAccuracy];
      [v139 _bucketize:v142 bucketSize:v143];
      double v145 = v144;

      if (v145 >= 0.0)
      {
        v146 = [NSNumber numberWithDouble:v145];
        [v20 setObject:v146 forKeyedSubscript:@"LocationDistanceFromWork"];
      }
    }
    if ([v126 sessionLoggingSchoolDistanceEnable])
    {
      v147 = objc_opt_class();
      v148 = [v19 locationMotionContext];
      [v148 distanceFromSchoolOfCurrentLocationInMeters];
      double v150 = v149;
      [v126 sessionLoggingDistanceAccuracy];
      [v147 _bucketize:v150 bucketSize:v151];
      double v153 = v152;

      if (v153 >= 0.0)
      {
        v154 = [NSNumber numberWithDouble:v153];
        [v20 setObject:v154 forKeyedSubscript:@"LocationDistanceFromSchool"];
      }
    }
    if ([v126 sessionLoggingGymDistanceEnable])
    {
      v155 = objc_opt_class();
      v156 = [v19 locationMotionContext];
      [v156 distanceFromGymOfCurrentLocationInMeters];
      double v158 = v157;
      [v126 sessionLoggingDistanceAccuracy];
      [v155 _bucketize:v158 bucketSize:v159];
      double v161 = v160;

      if (v161 >= 0.0)
      {
        v162 = [NSNumber numberWithDouble:v161];
        [v20 setObject:v162 forKeyedSubscript:@"LocationDistanceFromGym"];
      }
    }
    v163 = +[_ATXGlobals sharedInstance];
    v164 = +[ATXAppPredictorFeedback _getLastAppsWithEngagedApp:limit:](ATXAppPredictorFeedback, "_getLastAppsWithEngagedApp:limit:", v16, [v163 sessionLoggingAppSequenceLength]);

    if ([v164 count]) {
      [v20 setObject:v164 forKeyedSubscript:@"AppSequence"];
    }

    id v18 = v180;
    id v15 = v181;
    id v17 = v173;
  }

  return v20;
}

+ (double)_bucketize:(double)result bucketSize:(double)a4
{
  if (result >= 0.0) {
    return (double)(int)(result / a4) * a4;
  }
  return result;
}

+ (id)_getLastAppsWithEngagedApp:(id)a3 limit:(int)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (__CFString *)a3;
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = [v6 dateByAddingTimeInterval:-7200.0];
  uint64_t v8 = +[_ATXDuetHelper sharedInstance];
  v32 = (void *)v7;
  id v9 = [v8 getAppLaunchesBetweenStartDate:v7 endDate:v6];
  char v10 = (void *)[v9 mutableCopy];

  if (!v5 || ([(__CFString *)v5 isEqualToString:&stru_1F2740B58] & 1) != 0)
  {
    uint64_t v11 = v5;
    uint64_t v5 = @"NONE";
    goto LABEL_4;
  }
  if (![v10 count]) {
    goto LABEL_5;
  }
  uint64_t v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v10, "count") - 1);
  id v19 = [v11 bundleId];
  int v20 = [v19 isEqualToString:v5];

  if (!v20)
  {
LABEL_4:

LABEL_5:
    id v12 = [[_ATXAppLaunch alloc] initWithBundleId:v5 startDate:v6 endDate:v6 timeZone:0 reason:0];
    [v10 addObject:v12];

    goto LABEL_6;
  }
  unint64_t v21 = [v11 endDate];
  [v6 timeIntervalSinceDate:v21];
  double v23 = v22;

  if (v23 > 300.0) {
    goto LABEL_5;
  }
LABEL_6:
  unint64_t v13 = [v10 count];
  unint64_t v14 = [v10 count];
  if (v13 <= a4)
  {
    if (v14 >= a4)
    {
      id v16 = v10;
    }
    else
    {
      id v16 = (id)objc_opt_new();
      if ([v10 count] != a4)
      {
        unint64_t v17 = 0;
        do
        {
          id v18 = [[_ATXAppLaunch alloc] initWithBundleId:@"NONE" startDate:v6 endDate:v6 timeZone:0 reason:0];
          [v16 addObject:v18];

          ++v17;
        }
        while (a4 - [v10 count] > v17);
      }
      [v16 addObjectsFromArray:v10];
    }
  }
  else
  {
    id v15 = objc_msgSend(v10, "subarrayWithRange:", v14 - a4, a4);
    id v16 = (id)[v15 mutableCopy];
  }
  uint64_t v24 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v25 = v16;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v34 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = [*(id *)(*((void *)&v33 + 1) + 8 * i) bundleId];
        [v24 addObject:v30];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v27);
  }

  return v24;
}

+ (id)_getLastAppIntentsWithEngagedAction:(id)a3 combinedIntentStream:(id)a4 limit:(int)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_opt_new();
  uint64_t v56 = [v9 dateByAddingTimeInterval:-14400.0];
  char v10 = objc_msgSend(v8, "getActivityAndIntentEventsBetweenStartDate:endDate:ascending:");
  uint64_t v11 = (void *)[v10 mutableCopy];

  uint64_t v12 = [v7 actionKey];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    unint64_t v14 = [v7 actionKey];
    char v15 = [v14 isEqualToString:&stru_1F2740B58];

    if ((v15 & 1) == 0)
    {
      if ([v11 count])
      {
        double v54 = v9;
        id v16 = [v11 objectAtIndexedSubscript:0];
        unint64_t v17 = [v16 action];
        id v18 = [v17 actionKey];
        id v19 = [v7 actionKey];
        int v20 = [v18 isEqualToString:v19];

        if (v20)
        {
          unint64_t v21 = [v16 endDate];
          id v9 = v54;
          [v54 timeIntervalSinceDate:v21];
          double v23 = v22;

          if (v23 <= 30.0) {
            goto LABEL_9;
          }
        }
        else
        {

          id v9 = v54;
        }
      }
      uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F4B0F8]) initWithBundleId:@"NONE" intentType:@"NONE" dateInterval:0 action:v7];
      [v11 insertObject:v24 atIndex:0];
    }
  }
LABEL_9:
  double v57 = objc_opt_new();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v25 = v11;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    id v53 = v7;
    uint64_t v55 = v9;
    id v52 = v8;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = *(void *)v61;
    uint64_t v31 = a5;
    v32 = &stru_1F2740B58;
    obuint64_t j = v25;
    uint64_t v59 = v31;
    while (2)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v61 != v30) {
          objc_enumerationMutation(obj);
        }
        if (v28 == v31)
        {
          BOOL v43 = obj;

          id v8 = v52;
          id v7 = v53;
          id v9 = v55;
          double v46 = (void *)v56;
          uint64_t v45 = v57;
          goto LABEL_30;
        }
        long long v34 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        long long v35 = [v34 action];
        long long v36 = [v35 actionKey];

        if (v36)
        {
          uint64_t v37 = [v34 action];
          uint64_t v38 = [v37 actionKey];
          int v39 = [v38 isEqualToString:v32];

          if (v39)
          {
            ++v29;
            uint64_t v31 = v59;
          }
          else
          {
            if (([(__CFString *)v32 isEqualToString:&stru_1F2740B58] & 1) == 0)
            {
              uint64_t v40 = [NSString stringWithFormat:@"%@:%ld", v32, v29];
              [v57 addObject:v40];

              ++v28;
            }
            uint64_t v31 = v59;
            double v41 = [v34 action];
            uint64_t v42 = [v41 actionKey];

            v32 = (__CFString *)v42;
            uint64_t v29 = 1;
          }
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v60 objects:v64 count:16];
      if (v27) {
        continue;
      }
      break;
    }
    BOOL v43 = obj;

    if (v29)
    {
      if (v28 == v31)
      {
        id v8 = v52;
        id v7 = v53;
        id v9 = v55;
        uint64_t v45 = v57;
      }
      else
      {
        double v44 = [NSString stringWithFormat:@"%@:%ld", v32, v29];
        uint64_t v45 = v57;
        [v57 addObject:v44];

        ++v28;
        id v8 = v52;
        id v7 = v53;
        id v9 = v55;
      }
      uint64_t v47 = v59;
    }
    else
    {
      uint64_t v47 = v31;
      id v8 = v52;
      id v7 = v53;
      id v9 = v55;
      uint64_t v45 = v57;
    }
  }
  else
  {

    uint64_t v28 = 0;
    uint64_t v47 = a5;
    v32 = &stru_1F2740B58;
    uint64_t v45 = v57;
    BOOL v43 = v25;
  }
  uint64_t v48 = v47 - v28;
  double v46 = (void *)v56;
  if (v47 > v28)
  {
    do
    {
      [v45 addObject:@"NONE"];
      --v48;
    }
    while (v48);
  }
LABEL_30:
  double v49 = [v45 reverseObjectEnumerator];
  v50 = [v49 allObjects];

  return v50;
}

+ (id)_appDictionaryForFeedbackItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:818];
  for (uint64_t i = 0; i != 817; ++i)
  {
    id v6 = v3;
    double v7 = *(float *)([v6 scoreInputs] + 4 * i);
    double v8 = fabs(v7);
    BOOL v9 = v8 <= INFINITY;
    if (v8 >= INFINITY) {
      double v10 = -31337.0;
    }
    else {
      double v10 = v7;
    }
    if (v9) {
      double v7 = v10;
    }
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithDouble:", v7, v10);
    uint64_t v12 = +[_ATXScoreTypes aggdStringForScoreInput:i];
    [v4 setObject:v11 forKeyedSubscript:v12];
  }
  unint64_t v13 = +[_ATXAppInfoManager sharedInstance];
  unint64_t v14 = [v6 bundleId];
  char v15 = [v13 genreIdForBundleId:v14];
  [v4 setObject:v15 forKeyedSubscript:@"GenreId"];

  id v16 = [v6 bundleId];
  unint64_t v17 = [v13 subGenreIdsForBundleId:v16];
  [v4 setObject:v17 forKeyedSubscript:@"SubGenreIds"];

  [v6 totalScore];
  double v19 = v18;
  double v20 = fabs(v19);
  BOOL v21 = v20 <= INFINITY;
  if (v20 >= INFINITY) {
    double v22 = -31337.0;
  }
  else {
    double v22 = v19;
  }
  if (v21) {
    double v19 = v22;
  }
  double v23 = objc_msgSend(NSNumber, "numberWithDouble:", v19, v22);
  [v4 setObject:v23 forKeyedSubscript:@"Score"];

  uint64_t v24 = [v6 bundleId];
  [v4 setObject:v24 forKeyedSubscript:@"BundleId"];

  return v4;
}

- (void)_syncForTests
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_petTracker, 0);
  objc_storeStrong((id *)&self->_aggregateLogger, 0);
  objc_storeStrong((id *)&self->_feedbackInstance, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)receiveUIFeedbackResult:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXAppPredictorFeedback receiveUIFeedbackResult received an invalid unknown consumer", v1, 2u);
}

- (void)receiveUIFeedbackResult:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "ATXAppPredictorFeedback feedbackItemsForCacheFileData returned 0 feedback items", v1, 2u);
}

- (void)receiveUIFeedbackResult:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Not processing feedback because returned context object was nil", v1, 2u);
}

- (void)receiveUIFeedbackResult:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138543362;
  id v6 = v4;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Unexpected type of context: %{public}@", (uint8_t *)&v5, 0xCu);
}

- (void)receiveUIFeedbackResult:(uint64_t)a1 .cold.5(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "ATXAppPredictorFeedback receiveUIFeedbackResult got result - %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_tryLogInstalledAppClipSessionEngagementMetricWithConsumerSubType:(NSObject *)a3 engagedBundleId:bundleIdsShown:explicitlyRejectedBundleIds:abGroupIdentifier:tracker:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [a2 consumerSubType];
  uint64_t v8 = [a2 engagementType];
  if (v8 > 2)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
    BOOL v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = off_1E68B0850[(int)v8];
  }
  int v10 = [a2 numSuggestionsShown];
  uint64_t v11 = [a2 abGroup];
  *(_DWORD *)buf = 138413314;
  id v13 = v6;
  __int16 v14 = 2112;
  char v15 = v7;
  __int16 v16 = 2112;
  unint64_t v17 = v9;
  __int16 v18 = 1024;
  int v19 = v10;
  __int16 v20 = 2112;
  BOOL v21 = v11;
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBInstalledAppClipSessionEngagementTracker with consumerSubType: %@ and engagementType: %@ numSuggestionsShown: %u abGroup: %@", buf, 0x30u);
}

+ (void)_outcomeForEngagementType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Invalid ATXEngagementType value of %lu received in feedback", (uint8_t *)&v2, 0xCu);
}

@end