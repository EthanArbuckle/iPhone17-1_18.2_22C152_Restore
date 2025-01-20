@interface ATXActionFeedback
+ (id)sharedInstance;
- (ATXActionFeedback)init;
- (ATXActionFeedback)initWithPredictionContextBuilder:(id)a3 actionFeedbackWeights:(id)a4 appLaunchHistogramManager:(id)a5 actionNotificationServer:(id)a6 recentEngagmentCache:(id)a7 appIntentMonitor:(id)a8 dataStore:(id)a9 blendingHyperParameters:(id)a10;
- (id)_actionResponseFromUIFeedbackResult:(id)a3 shownActions:(id)a4 rejectedActions:(id)a5 engagedAction:(id)a6 engagedSuggestion:(id)a7;
- (id)_scoredActionsFromProactiveSuggestions:(id)a3;
- (id)clientModelIds;
- (unint64_t)_feedbackStageForUIFeedbackResult:(id)a3 engagedSuggestion:(id)a4;
- (void)_assertHistogram:(id)a3 weight:(float)a4;
- (void)_updateAppLaunchCategoricalHistogram:(int64_t)a3 bundleId:(id)a4 category:(id)a5 context:(id)a6 weight:(float)a7;
- (void)_updateAppLaunchHistogram:(int64_t)a3 bundleId:(id)a4 context:(id)a5 weight:(float)a6;
- (void)applyFinalFeedbackForActionResponse:(id)a3 engagementType:(unint64_t)a4 context:(id)a5;
- (void)decayCounts;
- (void)logHeuristicFeedback:(id)a3;
- (void)logHeuristicFeedbackToPortraitForAction:(id)a3 withActionType:(unsigned __int16)a4;
- (void)logHeuristicFeedbackToSuggestionsForAction:(id)a3 withActionType:(unsigned __int16)a4;
- (void)receiveFeedbackWithActionResponse:(id)a3 context:(id)a4;
- (void)receiveLockscreenFeedbackWithAction:(id)a3 actionResponse:(id)a4 engagement:(BOOL)a5 triggeredByUserInteraction:(BOOL)a6;
- (void)receiveLockscreenFeedbackWithAction:(id)a3 actionResponse:(id)a4 engagement:(BOOL)a5 triggeredByUserInteraction:(BOOL)a6 currentDate:(id)a7;
- (void)receiveUIFeedbackResult:(id)a3;
- (void)resetData;
- (void)sessionLogWithActionResponse:(id)a3 engagementType:(unint64_t)a4 context:(id)a5;
- (void)unloadCachedHistograms;
@end

@implementation ATXActionFeedback

- (ATXActionFeedback)init
{
  v3 = +[ATXPredictionContextBuilder sharedInstance];
  v4 = +[ATXActionFeedbackWeights sharedInstance];
  v5 = +[_ATXAppLaunchHistogramManager sharedInstance];
  v6 = +[ATXActionNotificationServer sharedInstance];
  v7 = [MEMORY[0x1E4F4B2A0] sharedInstance];
  v8 = +[_ATXAppPredictor sharedInstance];
  v9 = [v8 appIntentMonitor];
  v10 = +[_ATXDataStore sharedInstance];
  v11 = [MEMORY[0x1E4F93550] sharedInstance];
  v12 = [(ATXActionFeedback *)self initWithPredictionContextBuilder:v3 actionFeedbackWeights:v4 appLaunchHistogramManager:v5 actionNotificationServer:v6 recentEngagmentCache:v7 appIntentMonitor:v9 dataStore:v10 blendingHyperParameters:v11];

  return v12;
}

- (ATXActionFeedback)initWithPredictionContextBuilder:(id)a3 actionFeedbackWeights:(id)a4 appLaunchHistogramManager:(id)a5 actionNotificationServer:(id)a6 recentEngagmentCache:(id)a7 appIntentMonitor:(id)a8 dataStore:(id)a9 blendingHyperParameters:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)ATXActionFeedback;
  v18 = [(ATXActionFeedback *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_predictionContextBuilder, a3);
    objc_storeStrong((id *)&v19->_actionFeedbackWeights, a4);
    objc_storeStrong((id *)&v19->_appLaunchHistogramManager, a5);
    objc_storeStrong((id *)&v19->_notificationServer, a6);
    objc_storeStrong((id *)&v19->_recentEngagementCache, a7);
    objc_storeStrong((id *)&v19->_appIntentMonitor, a8);
    objc_storeStrong((id *)&v19->_dataStore, a9);
    objc_storeStrong((id *)&v19->_blendingHyperParameters, a10);
  }

  return v19;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_21 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_21, &__block_literal_global_124);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_27;
  return v2;
}

void __35__ATXActionFeedback_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  v1 = objc_alloc_init(ATXActionFeedback);
  v2 = (void *)sharedInstance__pasExprOnceResult_27;
  sharedInstance__pasExprOnceResult_27 = (uint64_t)v1;
}

- (id)clientModelIds
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v3 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:6];
  v4 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:7];
  v5 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:3];
  v6 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:9];
  v7 = objc_msgSend(v2, "initWithObjects:", v3, v4, v5, v6, 0);

  return v7;
}

- (id)_scoredActionsFromProactiveSuggestions:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_26_0);
}

id __60__ATXActionFeedback__scoredActionsFromProactiveSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 atxActionExecutableObject];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F4B2B0]);
    v5 = [v2 scoreSpecification];
    [v5 rawScore];
    *(float *)&double v6 = v6;
    v7 = (void *)[v4 initWithPredictedItem:v3 score:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)_feedbackStageForUIFeedbackResult:(id)a3 engagedSuggestion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = +[_ATXActionUtils atxActionFromProactiveSuggestion:v6];
    uint64_t v8 = [v7 intent];
    if (v8)
    {
      v9 = (void *)v8;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        unint64_t v11 = 3;
LABEL_13:

        goto LABEL_17;
      }
    }
    uint64_t v12 = [v7 intent];
    if (v12)
    {
      v13 = (void *)v12;
      objc_opt_class();
      char v14 = objc_opt_isKindOfClass();

      if ((v14 & 1) == 0)
      {
        unint64_t v11 = 5;
        goto LABEL_13;
      }
    }
  }
  v15 = [v5 engagedSuggestions];
  if ([v15 count]) {
    goto LABEL_11;
  }
  v16 = [v5 rejectedSuggestions];
  if ([v16 count])
  {

LABEL_11:
    unint64_t v11 = 2;
    goto LABEL_17;
  }
  int v17 = [v5 consumerSubType];

  if (v17 == 22) {
    unint64_t v11 = 4;
  }
  else {
    unint64_t v11 = 2;
  }
LABEL_17:

  return v11;
}

- (id)_actionResponseFromUIFeedbackResult:(id)a3 shownActions:(id)a4 rejectedActions:(id)a5 engagedAction:(id)a6 engagedSuggestion:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v38 = a6;
  id v37 = a5;
  id v36 = a4;
  char v14 = [v12 session];
  v15 = [v12 shownSuggestions];
  v16 = [(ATXActionFeedback *)self _scoredActionsFromProactiveSuggestions:v15];

  id v17 = objc_alloc(MEMORY[0x1E4F4AE60]);
  v18 = [v12 clientCacheUpdate];
  v19 = [v18 feedbackMetadata];
  v20 = [v12 shownSuggestions];
  id v21 = [v14 blendingUICacheUpdateUUID];
  id v22 = [v14 sessionStartDate];
  id v23 = (void *)[v17 initWithScoredActions:v16 cacheFileData:v19 proactiveSuggestions:v20 blendingModelUICacheUpdateUUID:v21 consumerSubType:0 predictionDate:v22 error:0];

  uint64_t v24 = [v12 consumerSubType];
  unint64_t v25 = [(ATXActionFeedback *)self _feedbackStageForUIFeedbackResult:v12 engagedSuggestion:v13];

  id v26 = [v14 sessionEndDate];
  [v23 updateConsumerSubType:v24 engagedAction:v38 shownActions:v36 feedbackStage:v25 explicitlyDismissedActions:v37 searchedActionType:4 engagedAppString:0 uiFeedbackDate:v26];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v27 = v16;
    id v28 = v12;
    v29 = [v28 partialEngagementWasCompleteMatch];

    if (v29)
    {
      v30 = [v28 partialEngagementWasCompleteMatch];
      int v31 = [v30 BOOLValue];

      v32 = [v28 matchingIntentDonatedAction];
      v33 = [v28 matchingIntentDonationDate];
      [v23 updateWithMatchingIntentDonatedAction:v32 intentDonationDate:v33 matchingIntentWasCompleteMatch:v31 != 0];
    }
    else
    {
      [v23 updateWithMatchingIntentDonatedAction:0 intentDonationDate:0 matchingIntentWasCompleteMatch:0];
    }

    v16 = v27;
  }

  return v23;
}

- (void)receiveUIFeedbackResult:(id)a3
{
  id v4 = a3;
  id v5 = [v4 shownSuggestions];
  id v6 = +[_ATXActionUtils atxActionsFromProactiveSuggestions:v5];

  v7 = [v4 rejectedSuggestions];
  uint64_t v8 = +[_ATXActionUtils atxActionsFromProactiveSuggestions:v7];

  v9 = [v4 engagedSuggestions];
  v10 = (void *)[v9 count];

  if (v10)
  {
    unint64_t v11 = [v4 engagedSuggestions];
    id v12 = +[_ATXActionUtils atxActionsFromProactiveSuggestions:v11];

    if ([v12 count])
    {
      id v13 = [v12 objectAtIndex:0];
      char v14 = [v4 engagedSuggestions];
      v10 = [v14 objectAtIndex:0];
    }
    else
    {
      v10 = 0;
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }
  v15 = [(ATXActionFeedback *)self _actionResponseFromUIFeedbackResult:v4 shownActions:v6 rejectedActions:v8 engagedAction:v13 engagedSuggestion:v10];
  v16 = [v4 context];

  if (!v16)
  {
    v20 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[ATXActionFeedback receiveUIFeedbackResult:]();
    }
    goto LABEL_14;
  }
  id v17 = [v4 context];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v20 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[ATXActionFeedback receiveUIFeedbackResult:]();
    }
LABEL_14:

    goto LABEL_15;
  }
  v19 = [v4 context];
  [(ATXActionFeedback *)self receiveFeedbackWithActionResponse:v15 context:v19];

LABEL_15:
}

- (void)decayCounts
{
  id v10 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager categoricalHistogramForLaunchType:33];
  v3 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager categoricalHistogramForLaunchType:34];
  id v4 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:35];
  id v5 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:36];
  +[_ATXFeedbackConstants actionDecayHalfLifeSeconds];
  [v10 decayWithHalfLifeInDays:v6 / 86400.0];
  +[_ATXFeedbackConstants actionDecayHalfLifeSeconds];
  [v3 decayWithHalfLifeInDays:v7 / 86400.0];
  +[_ATXFeedbackConstants actionDecayHalfLifeSeconds];
  [v4 decayWithHalfLifeInDays:v8 / 86400.0];
  +[_ATXFeedbackConstants actionDecayHalfLifeSeconds];
  [v5 decayWithHalfLifeInDays:v9 / 86400.0];
}

- (void)_assertHistogram:(id)a3 weight:(float)a4
{
  id v5 = a3;
  if (!v5)
  {
    double v6 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ATXActionFeedback _assertHistogram:weight:]();
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"attempted to update a nil histogram in action feedback"];
  }
  if (a4 < 0.0)
  {
    double v7 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ATXActionFeedback _assertHistogram:weight:]();
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"attempted to update a histogram with a negative weight in action feedback"];
  }
}

- (void)_updateAppLaunchHistogram:(int64_t)a3 bundleId:(id)a4 context:(id)a5 weight:(float)a6
{
  id v17 = a4;
  id v10 = a5;
  unint64_t v11 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:a3];
  *(float *)&double v12 = a6;
  [(ATXActionFeedback *)self _assertHistogram:v11 weight:v12];
  int v13 = (int)a6;
  if ((int)a6 >= 1)
  {
    do
    {
      char v14 = [v10 timeContext];
      v15 = [v14 date];
      LODWORD(v16) = 1.0;
      [v11 addLaunchWithBundleId:v17 date:v15 timeZone:0 weight:v16];

      --v13;
    }
    while (v13);
  }
}

- (void)_updateAppLaunchCategoricalHistogram:(int64_t)a3 bundleId:(id)a4 category:(id)a5 context:(id)a6 weight:(float)a7
{
  id v20 = a4;
  id v12 = a5;
  id v13 = a6;
  char v14 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager categoricalHistogramForLaunchType:a3];
  *(float *)&double v15 = a7;
  [(ATXActionFeedback *)self _assertHistogram:v14 weight:v15];
  int v16 = (int)a7;
  if ((int)a7 >= 1)
  {
    do
    {
      id v17 = [v13 timeContext];
      v18 = [v17 date];
      LODWORD(v19) = 1.0;
      [v14 addLaunchWithBundleId:v20 date:v18 category:v12 weight:v19];

      --v16;
    }
    while (v16);
  }
}

- (void)applyFinalFeedbackForActionResponse:(id)a3 engagementType:(unint64_t)a4 context:(id)a5
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = __atxlog_handle_feedback();
  v110 = v8;
  v106 = self;
  id v107 = v9;
  unint64_t v101 = a4;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = [MEMORY[0x1E4F4AE58] engagementTypeToString:a4];
    id v12 = objc_msgSend(MEMORY[0x1E4F4B680], "stringForConsumerSubtype:", objc_msgSend(v8, "consumerSubType"));
    id v13 = objc_msgSend(MEMORY[0x1E4F4AE58], "actionFeedbackStageToString:", objc_msgSend(v8, "feedbackStage"));
    char v14 = [v8 shownActions];
    double v15 = [v8 engagedAction];
    int v16 = [v8 explicitlyDismissedActions];
    *(_DWORD *)buf = 138413570;
    double v126 = v11;
    __int16 v127 = 2112;
    uint64_t v128 = (uint64_t)v12;
    __int16 v129 = 2112;
    v130 = v13;
    __int16 v131 = 2112;
    v132 = v14;
    __int16 v133 = 2112;
    v134 = v15;
    __int16 v135 = 2112;
    v136 = v16;
    _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "applyFinalFeedbackForActionResponse called with engagement type: %@, consumerSubType: %@, feedbackStage: %@, shownActions:%@, engagedAction:%@, explicitlyRejectedActions:%@", buf, 0x3Eu);

    self = v106;
    a4 = v101;
  }
  -[ATXActionFeedbackWeights confirmWeightForFeedbackStage:consumerSubType:](self->_actionFeedbackWeights, "confirmWeightForFeedbackStage:consumerSubType:", [v8 feedbackStage], objc_msgSend(v8, "consumerSubType"));
  float v18 = v17;
  -[ATXActionFeedbackWeights rejectWeightForFeedbackStage:consumerSubType:](self->_actionFeedbackWeights, "rejectWeightForFeedbackStage:consumerSubType:", [v8 feedbackStage], objc_msgSend(v8, "consumerSubType"));
  float v20 = v19;
  id v21 = [v9 locationMotionContext];
  uint64_t v103 = [v21 geohash];

  id v22 = [v9 locationMotionContext];
  uint64_t v102 = [v22 coarseGeohash];

  id v23 = [v8 engagedAction];
  if (v23)
  {
    uint64_t v24 = [v8 engagedAction];
    uint64_t v25 = [v24 actionKey];
  }
  else
  {
    uint64_t v25 = 0;
  }

  id v26 = [v9 timeContext];
  v105 = [v26 date];

  v112 = (void *)v25;
  if (v25)
  {
    switch(a4)
    {
      case 0uLL:
      case 1uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
LABEL_23:
        int v48 = 1;
        goto LABEL_24;
      case 2uLL:
      case 3uLL:
      case 4uLL:
        id v27 = [v8 engagedAction];
        int v28 = [v27 isHeuristic];

        v29 = __atxlog_handle_feedback();
        BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
        if (v28)
        {
          if (v30)
          {
            *(_DWORD *)buf = 134218242;
            double v126 = v18;
            __int16 v127 = 2112;
            uint64_t v128 = v25;
            _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_INFO, "Final engagement of weight %f feedback for heuristic action prediction: %@", buf, 0x16u);
          }

          int v31 = [v8 engagedAction];
          v32 = [v31 heuristic];
          *(float *)&double v33 = v18;
          [(ATXActionFeedback *)self _updateAppLaunchHistogram:35 bundleId:v32 context:v9 weight:v33];
        }
        else
        {
          if (v30)
          {
            *(_DWORD *)buf = 134218242;
            double v126 = v18;
            __int16 v127 = 2112;
            uint64_t v128 = v25;
            _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_INFO, "Final engagement feedback of weight %f for model-based action prediction: %@", buf, 0x16u);
          }

          int v31 = [v8 engagedAction];
          v32 = [v31 bundleId];
          v34 = +[_ATXActionUtils getActionTypeFromActionKey:v25];
          *(float *)&double v35 = v18;
          [(ATXActionFeedback *)self _updateAppLaunchCategoricalHistogram:33 bundleId:v32 category:v34 context:v9 weight:v35];
        }
        id v36 = [v8 engagedAction];
        id v37 = [v36 slotSet];

        id v38 = __atxlog_handle_feedback();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
          -[ATXActionFeedback applyFinalFeedbackForActionResponse:engagementType:context:].cold.4();
        }

        if (v18 == 0.0)
        {
          v39 = __atxlog_handle_feedback();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(MEMORY[0x1E4F4AE58], "actionFeedbackStageToString:", objc_msgSend(v8, "feedbackStage"));
            double v40 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            v41 = objc_msgSend(MEMORY[0x1E4F4B680], "stringForConsumerSubtype:", objc_msgSend(v8, "consumerSubType"));
            *(_DWORD *)buf = 138412546;
            double v126 = v40;
            __int16 v127 = 2112;
            uint64_t v128 = (uint64_t)v41;
            _os_log_impl(&dword_1D0FA3000, v39, OS_LOG_TYPE_DEFAULT, "Encountered confirmation feedback with a weight of 0 for feedbackStage=%@ and consumerSubType=%@", buf, 0x16u);
          }
        }
        else
        {
          dataStore = self->_dataStore;
          v39 = +[_ATXActionUtils getActionTypeFromActionKey:v25];
          v43 = [v8 engagedAction];
          v44 = [v43 bundleId];
          v45 = [v8 engagedAction];
          v46 = [v8 engagedAction];
          v47 = [v46 actionUUID];
          LOBYTE(v100) = [v8 consumerSubType];
          [(_ATXDataStore *)dataStore recordConfirms:2 rejects:v39 forFeedbackType:v44 forActionType:v45 bundleId:v37 action:v47 slotSet:v18 actionUUID:0.0 date:v105 consumerSubType:v100 geohash:v103 coarseGeohash:v102];

          a4 = v101;
        }

        goto LABEL_22;
      case 5uLL:
LABEL_28:
        v54 = __atxlog_handle_feedback();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          double v55 = [MEMORY[0x1E4F4AE58] engagementTypeToString:a4];
          *(_DWORD *)buf = 138412290;
          double v126 = v55;
          _os_log_impl(&dword_1D0FA3000, v54, OS_LOG_TYPE_INFO, "Exact slot match required on non-rejected items for engagement type %@", buf, 0xCu);
        }
        uint64_t v53 = [v8 engagedAction];
        goto LABEL_31;
      case 6uLL:
LABEL_27:
        uint64_t v53 = [v8 matchingIntentDonatedAction];
LABEL_31:
        v111 = (void *)v53;
        int v48 = 1;
        break;
      default:
LABEL_70:
        int v48 = 0;
LABEL_24:
        v49 = __atxlog_handle_feedback();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          -[ATXActionFeedback applyFinalFeedbackForActionResponse:engagementType:context:](a4, v49);
        }

        v50 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v51 = *MEMORY[0x1E4F1C3B8];
        v52 = [MEMORY[0x1E4F4AE58] engagementTypeToString:a4];
        [v50 raise:v51, @"Invalid engagement type of %@ encountered", v52 format];

        v111 = 0;
        break;
    }
  }
  else
  {
LABEL_22:
    switch(a4)
    {
      case 0uLL:
      case 1uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
        goto LABEL_23;
      case 2uLL:
      case 6uLL:
        goto LABEL_27;
      case 3uLL:
        v98 = __atxlog_handle_feedback();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
        {
          double v99 = [MEMORY[0x1E4F4AE58] engagementTypeToString:3];
          *(_DWORD *)buf = 138412290;
          double v126 = v99;
          _os_log_impl(&dword_1D0FA3000, v98, OS_LOG_TYPE_INFO, "Only actionKey match required on non-rejected items for engagement type %@", buf, 0xCu);
        }
        v111 = [v8 matchingIntentDonatedAction];
        int v48 = 0;
        break;
      case 4uLL:
      case 5uLL:
        goto LABEL_28;
      default:
        goto LABEL_70;
    }
  }
  v56 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
    -[ATXActionFeedback applyFinalFeedbackForActionResponse:engagementType:context:](v8);
  }

  v113 = objc_opt_new();
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  v57 = [v8 shownActions];
  uint64_t v58 = [v57 countByEnumeratingWithState:&v119 objects:v124 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v120;
    uint64_t v61 = 1;
    do
    {
      for (uint64_t i = 0; i != v59; ++i)
      {
        if (*(void *)v120 != v60) {
          objc_enumerationMutation(v57);
        }
        v63 = *(void **)(*((void *)&v119 + 1) + 8 * i);
        if (v48)
        {
          if (+[_ATXActionUtils isContainmentBetweenAction:v111 other:*(void *)(*((void *)&v119 + 1) + 8 * i)])
          {
            continue;
          }
        }
        else
        {
          v64 = [*(id *)(*((void *)&v119 + 1) + 8 * i) actionKey];
          char v65 = [v112 isEqualToString:v64];

          if (v65) {
            continue;
          }
        }
        v66 = __atxlog_handle_feedback();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          double v126 = v20;
          __int16 v127 = 2048;
          uint64_t v128 = v61 + i;
          __int16 v129 = 2112;
          v130 = v63;
          _os_log_debug_impl(&dword_1D0FA3000, v66, OS_LOG_TYPE_DEBUG, "Rejecting (with weight %f at rank %lu) action: %@", buf, 0x20u);
        }

        [v113 addObject:v63];
      }
      uint64_t v59 = [v57 countByEnumeratingWithState:&v119 objects:v124 count:16];
      v61 += i;
    }
    while (v59);
  }

  v67 = __atxlog_handle_feedback();
  v68 = v113;
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
    -[ATXActionFeedback applyFinalFeedbackForActionResponse:engagementType:context:](v113);
  }

  v69 = v110;
  v71 = v106;
  v70 = v107;
  if ([v113 count])
  {
    id v72 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v73 = [v110 explicitlyDismissedActions];
    v104 = (void *)[v72 initWithArray:v73];

    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id obj = v113;
    uint64_t v74 = [obj countByEnumeratingWithState:&v115 objects:v123 count:16];
    if (v74)
    {
      uint64_t v75 = v74;
      uint64_t v114 = *(void *)v116;
      v76 = off_1E68AA000;
      do
      {
        uint64_t v77 = 0;
        uint64_t v108 = v75;
        do
        {
          if (*(void *)v116 != v114) {
            objc_enumerationMutation(obj);
          }
          v78 = *(void **)(*((void *)&v115 + 1) + 8 * v77);
          v79 = [v78 heuristic];
          uint64_t v80 = [v79 length];

          if (v80)
          {
            v81 = [v78 heuristic];
            *(float *)&double v82 = v20;
            [(ATXActionFeedback *)v71 _updateAppLaunchHistogram:36 bundleId:v81 context:v70 weight:v82];
          }
          else
          {
            v81 = [v78 bundleId];
            v83 = v76[343];
            v84 = [v78 actionKey];
            v85 = [(__objc2_class *)v83 getActionTypeFromActionKey:v84];
            *(float *)&double v86 = v20;
            [(ATXActionFeedback *)v71 _updateAppLaunchCategoricalHistogram:34 bundleId:v81 category:v85 context:v70 weight:v86];
          }
          if (v20 == 0.0)
          {
            v87 = __atxlog_handle_feedback();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(MEMORY[0x1E4F4AE58], "actionFeedbackStageToString:", objc_msgSend(v110, "feedbackStage"));
              double v88 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              v89 = objc_msgSend(MEMORY[0x1E4F4B680], "stringForConsumerSubtype:", objc_msgSend(v110, "consumerSubType"));
              *(_DWORD *)buf = 138412546;
              double v126 = v88;
              __int16 v127 = 2112;
              uint64_t v128 = (uint64_t)v89;
              _os_log_impl(&dword_1D0FA3000, v87, OS_LOG_TYPE_DEFAULT, "Encountered rejection feedback with a weight of 0 for feedbackStage=%@ and consumerSubType=%@", buf, 0x16u);
            }
          }
          else
          {
            v87 = [v78 slotSet];
            v90 = v71->_dataStore;
            if ([v104 containsObject:v78]) {
              uint64_t v91 = 2;
            }
            else {
              uint64_t v91 = 1;
            }
            v92 = v76;
            v93 = v76[343];
            v94 = [v78 actionKey];
            v95 = [(__objc2_class *)v93 getActionTypeFromActionKey:v94];
            v96 = [v78 bundleId];
            v97 = [v78 actionUUID];
            LOBYTE(v100) = [v110 consumerSubType];
            [(_ATXDataStore *)v90 recordConfirms:v91 rejects:v95 forFeedbackType:v96 forActionType:v78 bundleId:v87 action:v97 slotSet:0.0 actionUUID:v20 date:v105 consumerSubType:v100 geohash:v103 coarseGeohash:v102];

            v71 = v106;
            v70 = v107;

            v76 = v92;
            uint64_t v75 = v108;
          }
          ++v77;
        }
        while (v75 != v77);
        uint64_t v75 = [obj countByEnumeratingWithState:&v115 objects:v123 count:16];
      }
      while (v75);
    }

    v69 = v110;
    v68 = v113;
  }
  [(ATXActionFeedback *)v71 sessionLogWithActionResponse:v69 engagementType:v101 context:v70];
  [(ATXActionFeedback *)v71 logHeuristicFeedback:v69];
  ATXUpdatePredictionsDefaultInterval(3);
}

- (void)sessionLogWithActionResponse:(id)a3 engagementType:(unint64_t)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[ATXActionFeedback sessionLogWithActionResponse:engagementType:context:]();
  }

  +[ATXActionSessionLog performSessionLoggingWithActionResponse:v8 engagementType:a4 context:v7 isShadowLog:0 forTestingMode:0];
}

- (void)receiveFeedbackWithActionResponse:(id)a3 context:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v63 = a4;
  id obj = self;
  objc_sync_enter(obj);
  id v7 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v77 = v6;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_INFO, "receiveFeedbackWithActionResponse called with actionResponse of %@", buf, 0xCu);
  }

  switch([v6 feedbackStage])
  {
    case 0:
    case 1:
    case 7:
    case 8:
      id v8 = __atxlog_handle_feedback();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = objc_msgSend(MEMORY[0x1E4F4AE58], "actionFeedbackStageToString:", objc_msgSend(v6, "feedbackStage"));
        -[ATXActionFeedback receiveFeedbackWithActionResponse:context:].cold.5(v9, (uint64_t)buf, v8);
      }

      id v10 = (void *)MEMORY[0x1E4F1CA00];
      double v11 = objc_msgSend(MEMORY[0x1E4F4AE58], "actionFeedbackStageToString:", objc_msgSend(v6, "feedbackStage"));
      [v10 raise:*MEMORY[0x1E4F1C3B8], @"invalid feedbackStage of %@ on ATXActionResponse", v11 format];
      goto LABEL_64;
    case 2:
    case 3:
      id v12 = [v6 engagedAction];
      BOOL v13 = v12 == 0;

      if (v13)
      {
        [(ATXActionFeedback *)obj applyFinalFeedbackForActionResponse:v6 engagementType:5 context:v63];
      }
      else
      {
        recentEngagementCache = obj->_recentEngagementCache;
        double v15 = [v6 engagedAction];
        [(ATXRecentActionEngagementCache *)recentEngagementCache addEngagedAction:v15];
      }
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v27 = [v6 explicitlyDismissedActions];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v70 objects:v75 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v71;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v71 != v29) {
              objc_enumerationMutation(v27);
            }
            [(ATXRecentActionEngagementCache *)obj->_recentEngagementCache addEngagedAction:*(void *)(*((void *)&v70 + 1) + 8 * i)];
          }
          uint64_t v28 = [v27 countByEnumeratingWithState:&v70 objects:v75 count:16];
        }
        while (v28);
      }
      goto LABEL_37;
    case 4:
    case 6:
      int v16 = [v6 engagedAction];
      BOOL v17 = v16 == 0;

      if (!v17)
      {
        float v18 = __atxlog_handle_feedback();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          float v19 = [v6 engagedAction];
          -[ATXActionFeedback receiveFeedbackWithActionResponse:context:](v19, (uint64_t)buf, v18);
        }

        float v20 = (void *)MEMORY[0x1E4F1CA00];
        id v21 = [v6 engagedAction];
        [v20 raise:*MEMORY[0x1E4F1C3B8], @"non-nil engagedAction in lock screen expiration feedback: %@", v21 format];
      }
      goto LABEL_18;
    case 5:
      id v22 = [v6 engagedAction];
      BOOL v23 = v22 == 0;

      if (v23)
      {
LABEL_18:
        [(ATXActionFeedback *)obj applyFinalFeedbackForActionResponse:v6 engagementType:5 context:v63];
      }
      else
      {
        uint64_t v24 = [v6 engagedAction];
        BOOL v25 = [v24 actionType] == 1;

        if (v25)
        {
          id v26 = __atxlog_handle_feedback();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            -[ATXActionFeedback receiveFeedbackWithActionResponse:context:]();
          }

          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"NSUA with background execution"];
        }
        else
        {
          id v27 = [v6 engagedAction];
          [(ATXRecentActionEngagementCache *)obj->_recentEngagementCache addEngagedAction:v27];
          if ([v27 isHeuristic])
          {
            int v31 = __atxlog_handle_feedback();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
              -[ATXActionFeedback receiveFeedbackWithActionResponse:context:]();
            }
          }
          else
          {
            v32 = [v27 intent];
            if (v32 && (char v33 = [v27 isHeuristic], v32, (v33 & 1) == 0))
            {
              v34 = [v27 actionKey];
              int v31 = +[_ATXActionUtils getActionTypeFromActionKey:v34];

              id v35 = objc_alloc(MEMORY[0x1E4F28C18]);
              id v36 = [v63 timeContext];
              id v37 = [v36 date];
              id v38 = [v63 timeContext];
              v39 = [v38 date];
              double v40 = (void *)[v35 initWithStartDate:v37 endDate:v39];

              id v41 = objc_alloc(MEMORY[0x1E4F4B0F8]);
              v42 = [v27 bundleId];
              v43 = (void *)[v41 initWithBundleId:v42 intentType:v31 dateInterval:v40 action:v27];

              LODWORD(v44) = 1.0;
              [(ATXAppIntentMonitor *)obj->_appIntentMonitor updateActionPredictionPipelineForIntentEvent:v43 weight:0 appSessionStartDate:0 appSessionEndDate:v44];
            }
            else
            {
              int v31 = __atxlog_handle_feedback();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
                -[ATXActionFeedback receiveFeedbackWithActionResponse:context:].cold.4();
              }
            }
          }

LABEL_37:
        }
      }
      break;
    default:
      break;
  }
  uint64_t v45 = [v6 consumerSubType];
  double v11 = [MEMORY[0x1E4F4B680] uiTypeForActionConsumerSubType:v45];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v46 = [v6 shownActions];
  uint64_t v47 = [v46 countByEnumeratingWithState:&v66 objects:v74 count:16];
  if (v47)
  {
    uint64_t v48 = *(void *)v67;
    do
    {
      uint64_t v49 = 0;
      do
      {
        if (*(void *)v67 != v48) {
          objc_enumerationMutation(v46);
        }
        v50 = *(void **)(*((void *)&v66 + 1) + 8 * v49);
        uint64_t v51 = [v50 actionKey];
        v52 = [v6 engagedAction];
        uint64_t v53 = [v52 isEqual:v50];

        if (v53)
        {
          v54 = [v6 engagedAction];
          if ([v54 actionType] == 1)
          {

            goto LABEL_47;
          }
          BOOL v55 = [v6 feedbackStage] == 5;

          if (v55)
          {
LABEL_47:
            v56 = __atxlog_handle_feedback();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)char v65 = 0;
              _os_log_impl(&dword_1D0FA3000, v56, OS_LOG_TYPE_INFO, "logging direct engagement on NSUserActivity-based UI or background-executable intent interaction", v65, 2u);
            }

LABEL_50:
            uint64_t v57 = 4;
          }
          else
          {
            if ([v6 feedbackStage] != 3) {
              goto LABEL_50;
            }
            uint64_t v58 = [v6 matchingIntentDonatedAction];
            if (v58 && (char v59 = [v6 matchingIntentWasCompleteMatch], v58, (v59 & 1) != 0))
            {
              uint64_t v57 = 2;
            }
            else
            {
              uint64_t v60 = [v6 matchingIntentDonatedAction];
              if (v60 && (int v61 = [v6 matchingIntentWasCompleteMatch], v60, !v61)) {
                uint64_t v57 = 3;
              }
              else {
                uint64_t v57 = 6;
              }
            }
          }
          [(ATXActionFeedback *)obj applyFinalFeedbackForActionResponse:v6 engagementType:v57 context:v63];
        }
        [(_ATXDataStore *)obj->_dataStore updateOrInsertPredictionsAndFeedbackForAppAction:v51 feedbackReceived:v53 forUIType:v11];

        ++v49;
      }
      while (v47 != v49);
      uint64_t v62 = [v46 countByEnumeratingWithState:&v66 objects:v74 count:16];
      uint64_t v47 = v62;
    }
    while (v62);
  }

LABEL_64:
  objc_sync_exit(obj);
}

- (void)receiveLockscreenFeedbackWithAction:(id)a3 actionResponse:(id)a4 engagement:(BOOL)a5 triggeredByUserInteraction:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (id)objc_opt_new();
  [(ATXActionFeedback *)self receiveLockscreenFeedbackWithAction:v11 actionResponse:v10 engagement:v7 triggeredByUserInteraction:v6 currentDate:v12];
}

- (void)receiveLockscreenFeedbackWithAction:(id)a3 actionResponse:(id)a4 engagement:(BOOL)a5 triggeredByUserInteraction:(BOOL)a6 currentDate:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  sel_getName(a2);
  int v16 = (void *)os_transaction_create();
  BOOL v17 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [v13 actionKey];
    float v19 = (void *)v18;
    float v20 = @"NO";
    if (v9) {
      id v21 = @"YES";
    }
    else {
      id v21 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    uint64_t v44 = v18;
    v46 = v21;
    __int16 v45 = 2112;
    if (v8) {
      float v20 = @"YES";
    }
    __int16 v47 = 2112;
    uint64_t v48 = v20;
    _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "received lockscreen feedback for actionKey: %@ with engagment: %@ and triggeredByUserInteraction: %@", buf, 0x20u);
  }
  buf[0] = 0;
  CFStringRef v22 = (const __CFString *)*MEMORY[0x1E4F4B688];
  if (CFPreferencesGetAppBooleanValue(@"displayDonationsOnLockscreen", (CFStringRef)*MEMORY[0x1E4F4B688], buf))
  {
    BOOL v23 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v24 = "Developer mode detected -- skipping lock screen action feedback for notification";
LABEL_14:
      _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  buf[0] = 0;
  if (CFPreferencesGetAppBooleanValue(@"zkwActionsDemoModeEnabled", v22, buf))
  {
    BOOL v23 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v24 = "Demo mode detected -- skipping lock screen action feedback for notification";
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!v9 || v8)
  {
    id v26 = [(ATXPredictionContextBuilderProtocol *)self->_predictionContextBuilder predictionContextForCurrentContext];
    if (!v26)
    {
      uint64_t v28 = __atxlog_handle_feedback();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[ATXActionFeedback receiveLockscreenFeedbackWithAction:actionResponse:engagement:triggeredByUserInteraction:currentDate:]();
      }

      goto LABEL_33;
    }
    if (v9 || v8)
    {
      if (!v8 || v9)
      {
        if (!v9 || !v8)
        {
          BOOL v30 = __atxlog_handle_feedback();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            -[ATXActionFeedback receiveLockscreenFeedbackWithAction:actionResponse:engagement:triggeredByUserInteraction:currentDate:]();
          }

          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"reached end of receiveLockscreenFeedbackWithAction"];
          goto LABEL_33;
        }
        int v31 = [v13 userActivity];

        if (v31)
        {
          id v39 = v13;
          v32 = (void *)MEMORY[0x1E4F1C978];
          char v33 = &v39;
        }
        else
        {
          v34 = [v13 intent];
          int v35 = objc_msgSend(v34, "atx_supportsBackgroundExecution");

          if (v35)
          {
            id v38 = v13;
            id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
            objc_msgSend(v14, "updateConsumerSubType:engagedAction:shownActions:feedbackStage:explicitlyDismissedActions:searchedActionType:engagedAppString:uiFeedbackDate:", 22, v13, v27, 5, 0, 4, 0, v15, v37);
            goto LABEL_32;
          }
          id v36 = __atxlog_handle_feedback();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v44 = (uint64_t)v13;
            _os_log_impl(&dword_1D0FA3000, v36, OS_LOG_TYPE_DEFAULT, "received lockscreen feedback for action with non-background executable Intent: %@", buf, 0xCu);
          }

          id v37 = v13;
          v32 = (void *)MEMORY[0x1E4F1C978];
          char v33 = &v37;
        }
        id v27 = [v32 arrayWithObjects:v33 count:1];
        objc_msgSend(v14, "updateConsumerSubType:engagedAction:shownActions:feedbackStage:explicitlyDismissedActions:searchedActionType:engagedAppString:uiFeedbackDate:", 22, v13, v27, 2, 0, 4, 0, v15, v37);
        goto LABEL_32;
      }
      id v41 = v13;
      id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
      id v40 = v13;
      uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
      [v14 updateConsumerSubType:22 engagedAction:0 shownActions:v27 feedbackStage:2 explicitlyDismissedActions:v29 searchedActionType:4 engagedAppString:0 uiFeedbackDate:v15];
    }
    else
    {
      id v42 = v13;
      id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
      objc_msgSend(v14, "updateConsumerSubType:engagedAction:shownActions:feedbackStage:explicitlyDismissedActions:searchedActionType:engagedAppString:uiFeedbackDate:", 22, 0, v27, 4, 0, 4, 0, v15, v37);
    }
LABEL_32:

    [(ATXActionFeedback *)self receiveFeedbackWithActionResponse:v14 context:v26];
LABEL_33:

    goto LABEL_16;
  }
  BOOL v25 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    -[ATXActionFeedback receiveLockscreenFeedbackWithAction:actionResponse:engagement:triggeredByUserInteraction:currentDate:]();
  }

  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"received lockscreen feedback with triggeredByUserInteraction: NO and engagement: YES"];
LABEL_16:
}

- (void)unloadCachedHistograms
{
  [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager purgeHistogramForLaunchType:33];
  [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager purgeHistogramForLaunchType:34];
  [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager purgeHistogramForLaunchType:35];
  appLaunchHistogramManager = self->_appLaunchHistogramManager;
  [(_ATXAppLaunchHistogramManager *)appLaunchHistogramManager purgeHistogramForLaunchType:36];
}

- (void)resetData
{
  id v6 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager categoricalHistogramForLaunchType:33];
  v3 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager categoricalHistogramForLaunchType:34];
  id v4 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:35];
  id v5 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:36];
  [v6 resetData];
  [v3 resetData];
  [v4 resetData];
  [v5 resetData];
}

- (void)logHeuristicFeedback:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 engagedAction];
  if (v5)
  {
    id v6 = (void *)v5;
    BOOL v7 = [v4 engagedAction];
    BOOL v8 = [v7 heuristic];

    if (v8)
    {
      BOOL v9 = [v4 engagedAction];
      [(ATXActionFeedback *)self logHeuristicFeedbackToPortraitForAction:v9 withActionType:2];

      id v10 = [v4 engagedAction];
      [(ATXActionFeedback *)self logHeuristicFeedbackToSuggestionsForAction:v10 withActionType:5];
    }
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = [v4 shownActions];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        int v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        BOOL v17 = [v16 heuristic];

        if (v17)
        {
          [(ATXActionFeedback *)self logHeuristicFeedbackToPortraitForAction:v16 withActionType:1];
          [(ATXActionFeedback *)self logHeuristicFeedbackToSuggestionsForAction:v16 withActionType:4];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v13);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v18 = objc_msgSend(v4, "explicitlyDismissedActions", 0);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        BOOL v23 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        uint64_t v24 = [v23 heuristic];

        if (v24) {
          [(ATXActionFeedback *)self logHeuristicFeedbackToSuggestionsForAction:v23 withActionType:8];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }
}

- (void)logHeuristicFeedbackToSuggestionsForAction:(id)a3 withActionType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 heuristicMetadata];
  if (v6)
  {
    BOOL v7 = (void *)v6;
    BOOL v8 = [v5 heuristicMetadata];
    uint64_t v9 = *MEMORY[0x1E4F4AD98];
    id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F4AD98]];

    if (v10)
    {
      id v11 = [v5 heuristic];
      int v12 = [v11 hasPrefix:@"checkInForEvent"];

      if (v12)
      {
        uint64_t v13 = [v5 userActivity];
        uint64_t v14 = [v13 activityType];
        int v15 = [v14 isEqualToString:*MEMORY[0x1E4F28AC0]];

        if (v15) {
          unsigned __int16 v16 = 26;
        }
        else {
          unsigned __int16 v16 = 25;
        }
        uint64_t v27 = 0;
        long long v28 = &v27;
        uint64_t v29 = 0x2050000000;
        BOOL v17 = (void *)getSGSuggestionsServiceClass_softClass;
        uint64_t v30 = getSGSuggestionsServiceClass_softClass;
        if (!getSGSuggestionsServiceClass_softClass)
        {
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __getSGSuggestionsServiceClass_block_invoke;
          v26[3] = &unk_1E68AB438;
          v26[4] = &v27;
          __getSGSuggestionsServiceClass_block_invoke((uint64_t)v26);
          BOOL v17 = (void *)v28[3];
        }
        id v18 = v17;
        _Block_object_dispose(&v27, 8);
        if (!v18)
        {
          BOOL v23 = [MEMORY[0x1E4F28B00] currentHandler];
          [NSString stringWithUTF8String:"-[ATXActionFeedback logHeuristicFeedbackToSuggestionsForAction:withActionType:]"];
          uint64_t v24 = v25 = v16;
          [v23 handleFailureInFunction:v24 file:@"ATXActionFeedback.m" lineNumber:769 description:@"Failed to dyload SGSuggestionService"];

          unsigned __int16 v16 = v25;
        }
        uint64_t v19 = __atxlog_handle_heuristic();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[ATXActionFeedback logHeuristicFeedbackToSuggestionsForAction:withActionType:]();
        }

        uint64_t v20 = [v18 serviceForEvents];
        uint64_t v21 = [v5 heuristicMetadata];
        CFStringRef v22 = [v21 objectForKeyedSubscript:v9];
        [v20 logEventInteractionForEventWithUniqueKey:v22 interface:v16 actionType:v4];
      }
    }
  }
}

- (void)logHeuristicFeedbackToPortraitForAction:(id)a3 withActionType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 heuristicMetadata];
  if (v6)
  {
    BOOL v7 = (void *)v6;
    BOOL v8 = [v5 heuristicMetadata];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"eventIdentifier"];

    if (v9)
    {
      id v10 = [v5 heuristic];
      char v11 = [v10 hasPrefix:@"showExtraordinaryEvent"];

      if (v11)
      {
        uint64_t v12 = 4;
        goto LABEL_9;
      }
      uint64_t v13 = [v5 heuristic];
      if ([v13 hasPrefix:@"meetingDND"])
      {
      }
      else
      {
        uint64_t v14 = [v5 heuristic];
        char v15 = [v14 hasPrefix:@"suggestedEventDND"];

        if ((v15 & 1) == 0)
        {
          uint64_t v20 = [v5 heuristic];
          char v21 = [v20 hasPrefix:@"runningLate"];

          if (v21)
          {
            uint64_t v12 = 3;
          }
          else
          {
            CFStringRef v22 = [v5 heuristic];
            char v23 = [v22 hasPrefix:@"sendETA"];

            if (v23)
            {
              uint64_t v12 = 10;
            }
            else
            {
              uint64_t v24 = [v5 heuristic];
              char v25 = [v24 hasPrefix:@"requestRideToNextEvent"];

              if (v25)
              {
                uint64_t v12 = 5;
              }
              else
              {
                long long v26 = [v5 heuristic];
                char v27 = [v26 hasPrefix:@"setAlarmForUnusualEarlyEvents"];

                if ((v27 & 1) == 0)
                {
                  BOOL v17 = __atxlog_handle_heuristic();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                    -[ATXActionFeedback logHeuristicFeedbackToPortraitForAction:withActionType:](v5, v17);
                  }
                  goto LABEL_12;
                }
                uint64_t v12 = 9;
              }
            }
          }
LABEL_9:
          unsigned __int16 v16 = __atxlog_handle_heuristic();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            -[ATXActionFeedback logHeuristicFeedbackToPortraitForAction:withActionType:]();
          }

          BOOL v17 = objc_opt_new();
          id v18 = [v5 heuristicMetadata];
          uint64_t v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F4AD90]];
          [v17 logEventInteractionForEventWithEventIdentifier:v19 interface:v12 actionType:v4];

LABEL_12:
          goto LABEL_13;
        }
      }
      uint64_t v12 = 7;
      goto LABEL_9;
    }
  }
LABEL_13:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendingHyperParameters, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_appIntentMonitor, 0);
  objc_storeStrong((id *)&self->_recentEngagementCache, 0);
  objc_storeStrong((id *)&self->_notificationServer, 0);
  objc_storeStrong((id *)&self->_appLaunchHistogramManager, 0);
  objc_storeStrong((id *)&self->_actionFeedbackWeights, 0);
  objc_storeStrong((id *)&self->_predictionContextBuilder, 0);
}

- (void)receiveUIFeedbackResult:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "The context is nil even though -receiveFeedbackWithActionResponse:context: expects a non-null value", v2, v3, v4, v5, v6);
}

- (void)receiveUIFeedbackResult:.cold.2()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "The context is not a ATXPredictionContext which -receiveFeedbackWithActionResponse:context: expects", v1, 2u);
}

- (void)_assertHistogram:weight:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "attempted to update a histogram with a negative weight in action feedback", v2, v3, v4, v5, v6);
}

- (void)_assertHistogram:weight:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "attempted to update a nil histogram in action feedback", v2, v3, v4, v5, v6);
}

- (void)applyFinalFeedbackForActionResponse:(void *)a1 engagementType:context:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v1, v2, "Rejected action count: %lu", v3, v4, v5, v6, v7);
}

- (void)applyFinalFeedbackForActionResponse:(void *)a1 engagementType:context:.cold.2(void *a1)
{
  uint64_t v1 = [a1 shownActions];
  [v1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v2, v3, "Shown action count: %lu", v4, v5, v6, v7, v8);
}

- (void)applyFinalFeedbackForActionResponse:(uint64_t)a1 engagementType:(NSObject *)a2 context:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F4AE58] engagementTypeToString:a1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_7(&dword_1D0FA3000, a2, v4, "Invalid engagement type of %@ encountered", v5);
}

- (void)applyFinalFeedbackForActionResponse:engagementType:context:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEBUG, "Final slot set in engagment feedback for action prediction: %@", v1, 0xCu);
}

- (void)sessionLogWithActionResponse:engagementType:context:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Generating Session Log", v2, v3, v4, v5, v6);
}

- (void)receiveFeedbackWithActionResponse:(NSObject *)a3 context:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_7(&dword_1D0FA3000, a3, (uint64_t)a3, "non-nil engagedAction in lock screen expiration feedback: %@", (uint8_t *)a2);
}

- (void)receiveFeedbackWithActionResponse:context:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "NSUA with background execution", v2, v3, v4, v5, v6);
}

- (void)receiveFeedbackWithActionResponse:context:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Not updating action prediction pipeline for engaged heuristic", v2, v3, v4, v5, v6);
}

- (void)receiveFeedbackWithActionResponse:context:.cold.4()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "detected nil intent for engaged action", v1, 2u);
}

- (void)receiveFeedbackWithActionResponse:(NSObject *)a3 context:.cold.5(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_7(&dword_1D0FA3000, a3, (uint64_t)a3, "invalid feedbackStage of %@ on ATXActionResponse", (uint8_t *)a2);
}

- (void)receiveLockscreenFeedbackWithAction:actionResponse:engagement:triggeredByUserInteraction:currentDate:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "No context - cannot process feedback while class-c locked!", v2, v3, v4, v5, v6);
}

- (void)receiveLockscreenFeedbackWithAction:actionResponse:engagement:triggeredByUserInteraction:currentDate:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "reached end of receiveLockscreenFeedbackWithAction", v2, v3, v4, v5, v6);
}

- (void)receiveLockscreenFeedbackWithAction:actionResponse:engagement:triggeredByUserInteraction:currentDate:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "received lockscreen feedback with triggeredByUserInteraction: NO and engagement: YES", v2, v3, v4, v5, v6);
}

- (void)logHeuristicFeedbackToSuggestionsForAction:withActionType:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Logging Heuristic interactions to Suggestions", v2, v3, v4, v5, v6);
}

- (void)logHeuristicFeedbackToPortraitForAction:withActionType:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Logging Heuristic interactions to Portrait", v2, v3, v4, v5, v6);
}

- (void)logHeuristicFeedbackToPortraitForAction:(void *)a1 withActionType:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 heuristic];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_7(&dword_1D0FA3000, a2, v4, "No supported interface for heuristic: %@", v5);
}

@end