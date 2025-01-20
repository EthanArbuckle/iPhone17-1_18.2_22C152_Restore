@interface ATXAnchorModelActionPredictionPostProcessor
+ (id)anchorPredictionScoredActionTuplesFromPredictions:(id)a3;
+ (void)inPlaceDeduplicateAnchorPredictionScoredActionTuples:(id)a3;
- (ATXAnchorModelActionPredictionPostProcessor)initWithAnchorModelPrediction:(id)a3;
- (ATXAnchorModelActionPredictionPostProcessor)initWithAnchorModelPrediction:(id)a3 blacklist:(id)a4;
- (BOOL)scoredActionIsBlacklisted:(id)a3;
- (BOOL)shouldCheckUpcomingMediaForIntent:(id)a3;
- (id)postProcessScoredAction:(id)a3;
- (id)recoverATXScoredAction;
- (id)replaceActionWithUpcomingMediaIfNeeded:(id)a3;
- (id)replacementActionWithResolvedMediaIntentContainer:(id)a3 originalAction:(id)a4;
- (id)replacementIntentFromUpcomingMediaForBundleId:(id)a3 intent:(id)a4;
- (void)recoverATXScoredAction;
@end

@implementation ATXAnchorModelActionPredictionPostProcessor

- (ATXAnchorModelActionPredictionPostProcessor)initWithAnchorModelPrediction:(id)a3
{
  id v4 = a3;
  v5 = +[ATXActionPredictionBlacklist sharedInstanceWithAppPredictionBlacklist];
  v6 = [(ATXAnchorModelActionPredictionPostProcessor *)self initWithAnchorModelPrediction:v4 blacklist:v5];

  return v6;
}

- (ATXAnchorModelActionPredictionPostProcessor)initWithAnchorModelPrediction:(id)a3 blacklist:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXAnchorModelActionPredictionPostProcessor;
  v9 = [(ATXAnchorModelActionPredictionPostProcessor *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_anchorModelPrediction, a3);
    uint64_t v11 = objc_opt_new();
    storeWrapper = v10->_storeWrapper;
    v10->_storeWrapper = (ATXAnchorModelDataStoreWrapper *)v11;

    objc_storeStrong((id *)&v10->_blacklist, a4);
  }

  return v10;
}

- (id)recoverATXScoredAction
{
  p_anchorModelPrediction = (uint64_t *)&self->_anchorModelPrediction;
  id v4 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction candidateType];
  int v5 = [v4 isEqualToString:@"action"];

  if (v5)
  {
    v6 = [(ATXAnchorModelDataStoreWrapper *)self->_storeWrapper scoredActionFromAnchorModelPrediction:self->_anchorModelPrediction];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      v9 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        [(ATXAnchorModelActionPredictionPostProcessor *)p_anchorModelPrediction recoverATXScoredAction];
      }
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)postProcessScoredAction:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_12;
  }
  int v5 = v4;
  v6 = [v4 predictedItem];
  id v7 = [v6 intent];

  if (!v7) {
    goto LABEL_7;
  }
  id v8 = objc_opt_new();
  v9 = [v5 predictedItem];
  v10 = [v9 intent];
  char v11 = [v8 shouldPredictIntent:v10];

  if (v11)
  {
    if ([(ATXAnchorModelActionPredictionPostProcessor *)self scoredActionIsBlacklisted:v5])
    {
      v12 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        anchorModelPrediction = self->_anchorModelPrediction;
        int v18 = 138412290;
        v19 = anchorModelPrediction;
        objc_super v14 = "Suppresing anchor model prediction because scoredAction is blacklisted. Prediction: %@";
LABEL_10:
        _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, 0xCu);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
LABEL_7:
    v15 = [(ATXAnchorModelActionPredictionPostProcessor *)self replaceActionWithUpcomingMediaIfNeeded:v5];

    goto LABEL_13;
  }
  v12 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v16 = self->_anchorModelPrediction;
    int v18 = 138412290;
    v19 = v16;
    objc_super v14 = "Suppresing anchor model prediction because action valuation says we shouldn't predict the intent. Prediction: %@";
    goto LABEL_10;
  }
LABEL_11:

LABEL_12:
  v15 = 0;
LABEL_13:
  return v15;
}

- (BOOL)scoredActionIsBlacklisted:(id)a3
{
  id v4 = a3;
  int v5 = [v4 predictedItem];
  v6 = [v5 actionKey];

  if (v6)
  {
    id v7 = +[_ATXActionUtils getBundleIdAndActionTypeFromActionKey:v6];
    id v8 = v7;
    if (!v7)
    {
      LOBYTE(self) = 1;
      goto LABEL_7;
    }
    v9 = [v7 first];
    v10 = [v8 second];
    LODWORD(self) = ![(ATXActionPredictionBlacklist *)self->_blacklist shouldPredictBundleId:v9 action:v10];
  }
  else
  {
    self = (ATXAnchorModelActionPredictionPostProcessor *)self->_blacklist;
    id v8 = [v4 predictedItem];
    v9 = [v8 bundleId];
    LOBYTE(self) = [(ATXAnchorModelActionPredictionPostProcessor *)self isBundleIdBlacklisted:v9];
  }

LABEL_7:
  return (char)self;
}

- (id)replaceActionWithUpcomingMediaIfNeeded:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 predictedItem];
  v6 = [v5 intent];
  BOOL v7 = [(ATXAnchorModelActionPredictionPostProcessor *)self shouldCheckUpcomingMediaForIntent:v6];

  if (v7)
  {
    id v8 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Checking Upcoming Media for Anchor Model prediction...", (uint8_t *)&v28, 2u);
    }

    v9 = [v4 predictedItem];
    v10 = [v9 bundleId];
    char v11 = [v4 predictedItem];
    v12 = [v11 intent];
    v13 = [(ATXAnchorModelActionPredictionPostProcessor *)self replacementIntentFromUpcomingMediaForBundleId:v10 intent:v12];

    if (v13)
    {
      id v14 = [(ATXAnchorModelActionPredictionPostProcessor *)self replacementActionWithResolvedMediaIntentContainer:v13 originalAction:v4];
      v15 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v28) = 0;
        _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_INFO, "Updating Anchor Model prediction with Upcoming Media...", (uint8_t *)&v28, 2u);
      }

      v16 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = [v4 predictedItem];
        int v18 = [v17 actionTitle];
        v19 = [v4 predictedItem];
        uint64_t v20 = [v19 actionSubtitle];
        int v28 = 138412546;
        v29 = v18;
        __int16 v30 = 2112;
        v31 = v20;
        _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_INFO, "Old action title: %@, subtitle: %@", (uint8_t *)&v28, 0x16u);
      }
      v21 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [v14 predictedItem];
        v23 = [v22 actionTitle];
        v24 = [v14 predictedItem];
        v25 = [v24 actionSubtitle];
        int v28 = 138412546;
        v29 = v23;
        __int16 v30 = 2112;
        v31 = v25;
        _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "New action title: %@, subtitle: %@", (uint8_t *)&v28, 0x16u);
      }
    }
    else
    {
      v21 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        anchorModelPrediction = self->_anchorModelPrediction;
        int v28 = 138412290;
        v29 = anchorModelPrediction;
        _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "Suppresing Anchor Model prediction because of Upcoming Media. Prediction: %@", (uint8_t *)&v28, 0xCu);
      }
      id v14 = 0;
    }
  }
  else
  {
    id v14 = v4;
  }

  return v14;
}

- (BOOL)shouldCheckUpcomingMediaForIntent:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    int v5 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ATXAnchorModelActionPredictionPostProcessor shouldCheckUpcomingMediaForIntent:](v5);
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v5 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ATXAnchorModelActionPredictionPostProcessor shouldCheckUpcomingMediaForIntent:](v5);
    }
LABEL_8:

    BOOL v4 = 0;
    goto LABEL_9;
  }
  BOOL v4 = 1;
LABEL_9:

  return v4;
}

- (id)replacementIntentFromUpcomingMediaForBundleId:(id)a3 intent:(id)a4
{
  int v5 = (void *)MEMORY[0x1E4F4AF00];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 isSystemAppForBundleId:v7];
  v9 = [MEMORY[0x1E4F4B390] getUpcomingMediaForBundle:v7 isInternalApplication:v8];

  v10 = +[ATXMediaActionPrediction resolvePlayMediaIntent:v6 withUpcomingMedia:v9];

  return v10;
}

- (id)replacementActionWithResolvedMediaIntentContainer:(id)a3 originalAction:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 first];
  v9 = [v7 second];

  char v10 = [v9 BOOLValue];
  if (v8)
  {
    if (v10)
    {
      char v11 = [v6 predictedItem];
      v12 = [v11 bundleId];
      [v8 _setLaunchId:v12];

      id v13 = objc_alloc(MEMORY[0x1E4F4AE38]);
      id v14 = [MEMORY[0x1E4F29128] UUID];
      v15 = [v6 predictedItem];
      v16 = [v15 bundleId];
      LOBYTE(v25) = 1;
      v17 = (void *)[v13 initWithIntent:v8 actionUUID:v14 bundleId:v16 heuristic:0 heuristicMetadata:0 criteria:0 isFutureMedia:v25 title:0 subtitle:0];

      id v18 = objc_alloc(MEMORY[0x1E4F4B2B0]);
      [v6 score];
      id v19 = (id)objc_msgSend(v18, "initWithPredictedItem:score:", v17);
    }
    else
    {
      v22 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        anchorModelPrediction = self->_anchorModelPrediction;
        *(_DWORD *)buf = 138412290;
        v27 = anchorModelPrediction;
        _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_INFO, "Returning original Anchor Model prediction because we didn't use Upcoming Media to update the prediction. Prediction: \n%@", buf, 0xCu);
      }

      id v19 = v6;
    }
  }
  else
  {
    uint64_t v20 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = self->_anchorModelPrediction;
      *(_DWORD *)buf = 138412290;
      v27 = v21;
      _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_INFO, "Suppresing Anchor Model prediction because intent returned by Upcoming Media was nil. Prediction: \n%@", buf, 0xCu);
    }

    id v19 = 0;
  }

  return v19;
}

+ (id)anchorPredictionScoredActionTuplesFromPredictions:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v44 = objc_opt_new();
  BOOL v4 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_INFO, "============================================================================\n", buf, 2u);
  }

  int v5 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [v3 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v53 = v6;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_INFO, "Action prediction post processor STARTING processing anchor model %lu predictions", buf, 0xCu);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v3;
  uint64_t v7 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    char v10 = &dword_1D0FA3000;
    uint64_t v11 = *(void *)v49;
    v12 = @"action";
    do
    {
      uint64_t v13 = 0;
      uint64_t v45 = v8;
      do
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v48 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x1D25F6CC0]();
        v16 = __atxlog_handle_anchor();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(v10, v16, OS_LOG_TYPE_INFO, "====\n", buf, 2u);
        }

        v17 = __atxlog_handle_anchor();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v53 = v9;
          _os_log_impl(v10, v17, OS_LOG_TYPE_INFO, "Action prediction post processor STARTING processing anchor model prediction %lu.", buf, 0xCu);
        }

        id v18 = [v14 candidateType];
        char v19 = [v18 isEqualToString:v12];

        if (v19)
        {
          v47 = v15;
          uint64_t v20 = v12;
          uint64_t v21 = v9;
          uint64_t v22 = v11;
          v23 = v10;
          v24 = [[ATXAnchorModelActionPredictionPostProcessor alloc] initWithAnchorModelPrediction:v14];
          uint64_t v25 = [(ATXAnchorModelActionPredictionPostProcessor *)v24 recoverATXScoredAction];
          v26 = [(ATXAnchorModelActionPredictionPostProcessor *)v24 postProcessScoredAction:v25];

          uint64_t v27 = +[ATXProactiveSuggestionBuilder predictionReasonForAnchorModelPrediction:v14];
          uint64_t v28 = (void *)v27;
          v29 = &stru_1F2740B58;
          if (v27) {
            v29 = (__CFString *)v27;
          }
          __int16 v30 = v29;

          if (v26)
          {
            v31 = [[ATXScoredActionWithReason alloc] initWithScoredAction:v26 predictionReason:v30];
            uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v14 second:v31];
            [v44 addObject:v32];
          }
          v33 = __atxlog_handle_anchor();
          char v10 = v23;
          uint64_t v34 = v21;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v53 = v21;
            _os_log_impl(v10, v33, OS_LOG_TYPE_INFO, "Action prediction post processor DONE processing anchor model prediction %lu. \n====\n", buf, 0xCu);
          }

          v35 = __atxlog_handle_anchor();
          v12 = v20;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(v10, v35, OS_LOG_TYPE_INFO, "====\n", buf, 2u);
          }

          uint64_t v9 = v34 + 1;
          uint64_t v11 = v22;
          uint64_t v8 = v45;
          v15 = v47;
        }
        else
        {
          v36 = __atxlog_handle_anchor();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v53 = v9;
            _os_log_impl(v10, v36, OS_LOG_TYPE_INFO, "Prediction was not an action. Action prediction post processor DONE processing anchor model prediction %lu.", buf, 0xCu);
          }

          __atxlog_handle_anchor();
          v24 = (ATXAnchorModelActionPredictionPostProcessor *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(v10, &v24->super, OS_LOG_TYPE_INFO, "====\n", buf, 2u);
          }
        }

        ++v13;
      }
      while (v8 != v13);
      uint64_t v8 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v8);
  }

  [a1 inPlaceDeduplicateAnchorPredictionScoredActionTuples:v44];
  v37 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v38 = [obj count];
    uint64_t v39 = [v44 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v53 = v38;
    __int16 v54 = 2048;
    uint64_t v55 = v39;
    _os_log_impl(&dword_1D0FA3000, v37, OS_LOG_TYPE_DEFAULT, "Action prediction post processor DONE processing anchor model %lu predictions. Left with %lu predictions.", buf, 0x16u);
  }

  v40 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v40, OS_LOG_TYPE_DEFAULT, "============================================================================\n", buf, 2u);
  }

  v41 = (void *)[v44 copy];
  return v41;
}

+ (void)inPlaceDeduplicateAnchorPredictionScoredActionTuples:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_33);
  int v5 = +[ATXActionPredictionsProcessor indicesOfNonDuplicateScoredActions:v4];
  uint64_t v6 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 134217984;
    uint64_t v11 = [v3 count];
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "Deduplicating action predictions. Number of original predictions: %lu...", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, objc_msgSend(v3, "count"));
  [v7 removeIndexes:v5];
  [v3 removeObjectsAtIndexes:v7];
  uint64_t v8 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v3 count];
    int v10 = 134217984;
    uint64_t v11 = v9;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_INFO, "After deduplicating, number of action predictions: %lu. Done.", (uint8_t *)&v10, 0xCu);
  }
}

id __100__ATXAnchorModelActionPredictionPostProcessor_inPlaceDeduplicateAnchorPredictionScoredActionTuples___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 second];
  id v3 = [v2 scoredAction];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklist, 0);
  objc_storeStrong((id *)&self->_storeWrapper, 0);
  objc_storeStrong((id *)&self->_anchorModelPrediction, 0);
}

- (void)recoverATXScoredAction
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Unable to retrieve ATXScoredAction for Anchor Model prediction. Skipping this prediction. %@", (uint8_t *)&v3, 0xCu);
}

- (void)shouldCheckUpcomingMediaForIntent:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Ignoring Upcoming Media for Anchor Model prediction because there's no intent...", v1, 2u);
}

- (void)shouldCheckUpcomingMediaForIntent:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Ignoring Upcoming Media for Anchor Model prediction because intent is not INPlayMediaIntent...", v1, 2u);
}

@end