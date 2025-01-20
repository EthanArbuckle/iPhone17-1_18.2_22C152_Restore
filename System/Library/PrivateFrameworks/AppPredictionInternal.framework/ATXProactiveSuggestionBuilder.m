@interface ATXProactiveSuggestionBuilder
+ (BOOL)_isHeroAppForPredictionItem:(ATXPredictionItem *)a3;
+ (BOOL)_isHeuristicActionForActionResult:(id)a3;
+ (BOOL)_isInstalledAppClipForPredictionItem:(ATXPredictionItem *)a3;
+ (BOOL)_isMagicalMomentForPredictionItem:(ATXPredictionItem *)a3;
+ (BOOL)isMMAnchorWhitelistedForHomeScreen:(int64_t)a3;
+ (id)_actionPredictionReasonForActionResult:(id)a3 reasons:(id)a4;
+ (id)_appPredictionReasonForPredictionItem:(ATXPredictionItem *)a3 reasons:(id)a4;
+ (id)_executableSpecForAppClipWithHeroAppPrediction:(id)a3;
+ (id)_executableSpecForAppWithBundleId:(id)a3;
+ (id)_executableSpecForScoredAction:(id)a3;
+ (id)_executableSpecForSpotlightAction:(id)a3;
+ (id)_proactiveSuggestionForSpotlightPOIFromHeroAppPrediction:(id)a3 clientModelSpec:(id)a4;
+ (id)_proactiveSuggestionFromAppPredictionItem:(ATXPredictionItem *)a3 clientModelSpec:(id)a4 reasons:(id)a5;
+ (id)_proactiveSuggestionFromHeroAppPrediction:(id)a3 clientModelSpec:(id)a4 reasons:(id)a5;
+ (id)_proactiveSuggestionFromMagicalMomentsPredictionBundleId:(id)a3 mmSignals:(id)a4 clientModelSpec:(id)a5 reasons:(id)a6;
+ (id)_proactiveSuggestionsFromActionResult:(id)a3 clientModelSpec:(id)a4 reasons:(id)a5;
+ (id)_proactiveSuggestionsFromHeuristicActionResult:(id)a3 clientModelSpec:(id)a4 reasons:(id)a5 allowedOnLockscreen:(BOOL)a6;
+ (id)_scoreSpecForAppClipWithScore:(double)a3 mediumThreshold:(double)a4 highThreshold:(double)a5;
+ (id)_scoreSpecForAppWithScore:(double)a3 isHighConfidence:(BOOL)a4;
+ (id)_scoreSpecForHeroAppPrediction:(id)a3;
+ (id)_scoreSpecForMagicalMomentsPredictionWithMmSignals:(id)a3;
+ (id)_scoreSpecForPredictionItem:(ATXPredictionItem *)a3;
+ (id)_scoreSpecForScore:(double)a3 highThreshold:(double)a4 mediumThreshold:(double)a5;
+ (id)_uiSpecForAppClipWithBundleId:(id)a3 title:(id)a4 subtitle:(id)a5 predictionReason:(id)a6;
+ (id)_uiSpecForAppWithBundleId:(id)a3 scoreSpec:(id)a4 predictionReason:(id)a5;
+ (id)_uiSpecForAppWithBundleId:(id)a3 scoreSpec:(id)a4 predictionReason:(id)a5 allowedOnHomescreen:(BOOL)a6;
+ (id)_uiSpecForHeroAppPrediction:(id)a3 scoreSpec:(id)a4 predictionReason:(id)a5;
+ (id)_uiSpecForMMAppWithBundleId:(id)a3 scoreSpec:(id)a4 predictionReasonString:(id)a5 anchor:(int64_t)a6 predictionReasons:(unint64_t)a7;
+ (id)_uiSpecForScoredAction:(id)a3 scoreSpec:(id)a4 clientModelSpec:(id)a5 predictionReason:(id)a6;
+ (id)_uiSpecForScoredAction:(id)a3 scoreSpec:(id)a4 clientModelSpec:(id)a5 predictionReason:(id)a6 allowedOnLockscreen:(BOOL)a7 allowedOnHomescreen:(BOOL)a8;
+ (id)_uiSpecForScoredAction:(id)a3 scoreSpec:(id)a4 clientModelSpec:(id)a5 predictionReason:(id)a6 allowedOnLockscreen:(BOOL)a7 allowedOnHomescreen:(BOOL)a8 predictionReasons:(unint64_t)a9;
+ (id)_uiSpecForScoredAction:(id)a3 scoreSpec:(id)a4 clientModelSpec:(id)a5 predictionReason:(id)a6 allowedOnLockscreen:(BOOL)a7 predictionReasons:(unint64_t)a8;
+ (id)_uiSpecForScoredAction:(id)a3 scoreSpec:(id)a4 clientModelSpec:(id)a5 predictionReason:(id)a6 shouldClearOnEngagement:(BOOL)a7 allowedOnLockscreen:(BOOL)a8;
+ (id)_uiSpecForScoredAction:(id)a3 scoreSpec:(id)a4 clientModelSpec:(id)a5 predictionReason:(id)a6 shouldClearOnEngagement:(BOOL)a7 allowedOnLockscreen:(BOOL)a8 allowedOnHomescreen:(BOOL)a9 predictionReasons:(unint64_t)a10;
+ (id)_uiSpecForSpotlightPOIPrediction:(id)a3 predictionReasons:(unint64_t)a4;
+ (id)cachedTitleAndSubtitleForAction:(id)a3;
+ (id)executableIdForAction:(id)a3;
+ (id)predictionReasonForAnchorModelPrediction:(id)a3;
+ (id)proactiveSuggestionForAppClipFromHeroAppPrediction:(id)a3 clientModelSpec:(id)a4 mediumThreshold:(double)a5 highThreshold:(double)a6 reasons:(id)a7;
+ (id)proactiveSuggestionForAppClipsFromHeroAppPredictions:(id)a3 clientModelSpec:(id)a4 mediumThreshold:(double)a5 highThreshold:(double)a6;
+ (id)proactiveSuggestionForAppWithAnchorModelPrediction:(id)a3 clientModelSpec:(id)a4 mediumThreshold:(double)a5 highThreshold:(double)a6 allowedOnHomescreen:(BOOL)a7;
+ (id)proactiveSuggestionForAppWithBundleId:(id)a3 score:(double)a4 clientModelSpec:(id)a5 mediumThreshold:(double)a6 highThreshold:(double)a7 predictionReason:(id)a8 allowedOnHomescreen:(BOOL)a9;
+ (id)proactiveSuggestionForLinkActionPrediction:(id)a3 score:(double)a4 clientModelSpec:(id)a5 mediumThreshold:(double)a6 highThreshold:(double)a7 predictionReason:(id)a8 allowedOnHomescreen:(BOOL)a9;
+ (id)proactiveSuggestionForLockscreenAction:(id)a3 clientModelSpec:(id)a4;
+ (id)proactiveSuggestionsForAnchorModelFromScoredActionWithReason:(id)a3 clientModelSpec:(id)a4 mediumThreshold:(double)a5 highThreshold:(double)a6 allowedOnHomescreen:(BOOL)a7 predictionReasons:(unint64_t)a8;
+ (id)proactiveSuggestionsForAppsWithHeroAppPredictions:(id)a3 clientModelSpec:(id)a4;
+ (id)proactiveSuggestionsForAppsWithMagicalMomentsMap:(id)a3 clientModelSpec:(id)a4;
+ (id)proactiveSuggestionsForLockscreenActions:(id)a3 clientModelSpec:(id)a4;
+ (id)proactiveSuggestionsForSpotlightPOIWithHeroAppPredictions:(id)a3 clientModelSpec:(id)a4;
+ (id)proactiveSuggestionsFromActionResults:(id)a3 clientModelSpec:(id)a4;
+ (id)proactiveSuggestionsFromAppPredictionItems:(const void *)a3 clientModelSpec:(id)a4 maxSuggestionsToSendToBlendingLayer:(int)a5;
+ (id)proactiveSuggestionsFromHeuristicActionResults:(id)a3 clientModelSpec:(id)a4;
+ (id)proactiveSuggestionsFromScoredAction:(id)a3 clientModelSpec:(id)a4 mediumThreshold:(double)a5 highThreshold:(double)a6 predictionReason:(id)a7 allowedOnHomescreen:(BOOL)a8 predictionReasons:(unint64_t)a9;
+ (int64_t)_confidenceCategoryForPredictionItem:(ATXPredictionItem *)a3;
+ (int64_t)_confidenceCategoryForScore:(double)a3 highThreshold:(double)a4 mediumThreshold:(double)a5;
+ (int64_t)_confidenceCategoryGivenIsHighConfidence:(BOOL)a3;
+ (unint64_t)_actionPredictionReasonsForActionResult:(id)a3 reasons:(id)a4;
+ (unint64_t)predictionReasonsForAnchorModelPrediction:(id)a3;
@end

@implementation ATXProactiveSuggestionBuilder

+ (id)proactiveSuggestionsForAnchorModelFromScoredActionWithReason:(id)a3 clientModelSpec:(id)a4 mediumThreshold:(double)a5 highThreshold:(double)a6 allowedOnHomescreen:(BOOL)a7 predictionReasons:(unint64_t)a8
{
  BOOL v9 = a7;
  id v14 = a4;
  id v15 = a3;
  v16 = [v15 scoredAction];
  v17 = [v15 reason];

  v18 = [a1 proactiveSuggestionsFromScoredAction:v16 clientModelSpec:v14 mediumThreshold:v17 highThreshold:v9 predictionReason:a8 allowedOnHomescreen:a5 predictionReasons:a6];

  return v18;
}

+ (id)proactiveSuggestionForAppWithAnchorModelPrediction:(id)a3 clientModelSpec:(id)a4 mediumThreshold:(double)a5 highThreshold:(double)a6 allowedOnHomescreen:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [a1 predictionReasonForAnchorModelPrediction:v13];
  id v15 = (void *)v14;
  v16 = &stru_1F2740B58;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  v17 = v16;

  v18 = [v13 candidateId];
  [v13 score];
  double v20 = v19;

  v21 = [a1 proactiveSuggestionForAppWithBundleId:v18 score:v12 clientModelSpec:v17 mediumThreshold:v7 highThreshold:v20 predictionReason:a5 allowedOnHomescreen:a6];

  return v21;
}

+ (id)predictionReasonForAnchorModelPrediction:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 anchorType];
  v6 = +[ATXAnchor anchorClassFromAnchorTypeString:v5];

  if (!v6)
  {
    BOOL v7 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      +[ATXProactiveSuggestionBuilder predictionReasonForAnchorModelPrediction:](v3, v7);
    }
  }
  v8 = [v3 anchorEvent];
  BOOL v9 = [(objc_class *)v6 anchorOccurenceDateFromDuetEvent:v8];

  v10 = [v4 actionAnchorReasonForAnchorType:@"Generic"];
  v11 = [v3 candidateType];
  int v12 = [v11 isEqualToString:@"app"];

  if (!v12)
  {
    double v20 = [v3 candidateType];
    if ([v20 isEqualToString:@"action"])
    {
    }
    else
    {
      v22 = [v3 candidateType];
      int v23 = [v22 isEqualToString:@"linkaction"];

      if (!v23) {
        goto LABEL_18;
      }
    }
    v24 = objc_opt_new();
    [v24 timeIntervalSince1970];
    double v26 = v25;
    [v9 timeIntervalSince1970];
    double v28 = v26 - v27;

    if (v28 < 480.0)
    {
      uint64_t v18 = [v3 anchorType];
      uint64_t v19 = [v4 actionAnchorReasonForAnchorType:v18];
      goto LABEL_14;
    }
    uint64_t v21 = [v4 actionAnchorReasonForAnchorType:@"Generic"];
LABEL_16:
    v29 = (void *)v21;
    goto LABEL_17;
  }
  id v13 = objc_opt_new();
  [v13 timeIntervalSince1970];
  double v15 = v14;
  [v9 timeIntervalSince1970];
  double v17 = v15 - v16;

  if (v17 >= 480.0)
  {
    uint64_t v21 = [v4 appAnchorReasonForAnchorType:@"Generic"];
    goto LABEL_16;
  }
  uint64_t v18 = [v3 anchorType];
  uint64_t v19 = [v4 appAnchorReasonForAnchorType:v18];
LABEL_14:
  v29 = (void *)v19;

  v10 = (void *)v18;
LABEL_17:

  v10 = v29;
LABEL_18:

  return v10;
}

+ (unint64_t)predictionReasonsForAnchorModelPrediction:(id)a3
{
  id v3 = [a3 anchorType];
  int64_t v4 = +[ATXAnchor stringToAnchorType:v3];

  if (v4 == 20) {
    return 0x1000000000;
  }
  else {
    return (unint64_t)(v4 == 21) << 37;
  }
}

+ (id)proactiveSuggestionForLinkActionPrediction:(id)a3 score:(double)a4 clientModelSpec:(id)a5 mediumThreshold:(double)a6 highThreshold:(double)a7 predictionReason:(id)a8 allowedOnHomescreen:(BOOL)a9
{
  BOOL v9 = a9;
  id v16 = a3;
  id v17 = a5;
  id v54 = a8;
  uint64_t v18 = [a1 _scoreSpecForScore:a4 highThreshold:a7 mediumThreshold:a6];
  id v19 = [NSString alloc];
  double v20 = [v16 bundleId];
  uint64_t v21 = [v16 action];
  v22 = [v21 identifier];
  uint64_t v52 = [v19 initWithFormat:@"%@:%@", v20, v22];

  int v23 = objc_opt_new();
  v24 = [v16 bundleId];
  double v25 = [v16 action];
  double v26 = [v25 identifier];
  id v55 = 0;
  v53 = v23;
  double v27 = [v23 actionForBundleIdentifier:v24 andActionIdentifier:v26 error:&v55];
  id v28 = v55;

  v29 = v28;
  if (v28)
  {
    v30 = v27;
    v31 = v18;
    v32 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v35 = (void *)v52;
      +[ATXProactiveSuggestionBuilder proactiveSuggestionForLinkActionPrediction:score:clientModelSpec:mediumThreshold:highThreshold:predictionReason:allowedOnHomescreen:]();
      v33 = 0;
      v34 = v54;
    }
    else
    {
      v33 = 0;
      v34 = v54;
      v35 = (void *)v52;
    }
  }
  else
  {
    BOOL v51 = v9;
    v36 = [v27 title];
    v37 = [v36 key];
    v38 = v37;
    v30 = v27;
    if (v37)
    {
      v32 = v37;
    }
    else
    {
      v39 = [v16 action];
      v32 = [v39 identifier];
    }
    v40 = [v27 descriptionMetadata];
    v41 = [v40 descriptionText];
    uint64_t v42 = [v41 key];

    v49 = (void *)v42;
    v50 = (void *)[[NSString alloc] initWithFormat:@"%@ | %@", v32, v42];
    v35 = (void *)v52;
    v43 = (void *)[objc_alloc(MEMORY[0x1E4F93950]) initWithExecutableObject:v16 executableDescription:v50 executableIdentifier:v52 suggestionExecutableType:10];
    if ([v18 suggestedConfidenceCategory] <= 2) {
      uint64_t v44 = 44;
    }
    else {
      uint64_t v44 = 40;
    }
    v48 = [MEMORY[0x1E4F93960] layoutConfigurationsForLayoutOptions:v44];
    LOWORD(v47) = 256;
    v31 = v18;
    v34 = v54;
    v45 = objc_msgSend(objc_alloc(MEMORY[0x1E4F93978]), "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", v32, v42, v54, v48, 0, v51, v47);
    v33 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:v17 executableSpecification:v43 uiSpecification:v45 scoreSpecification:v31];

    v29 = 0;
  }

  return v33;
}

+ (id)proactiveSuggestionsForAppsWithMagicalMomentsMap:(id)a3 clientModelSpec:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  BOOL v9 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v16 = objc_msgSend(v10, "objectForKeyedSubscript:", v15, (void)v19);
        id v17 = [a1 _proactiveSuggestionFromMagicalMomentsPredictionBundleId:v15 mmSignals:v16 clientModelSpec:v7 reasons:v8];
        if (v17) {
          [v9 addObject:v17];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  return v9;
}

+ (id)_proactiveSuggestionFromMagicalMomentsPredictionBundleId:(id)a3 mmSignals:(id)a4 clientModelSpec:(id)a5 reasons:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ((unint64_t)[v11 predictionIndex] <= 2)
  {
    uint64_t v15 = [a1 _executableSpecForAppWithBundleId:v10];
    id v16 = [a1 _scoreSpecForMagicalMomentsPredictionWithMmSignals:v11];
    id v17 = objc_msgSend(v13, "appMagicalMomentReasonForAnchorType:", objc_msgSend(v11, "anchorType"));
    uint64_t v18 = objc_msgSend(a1, "_uiSpecForMMAppWithBundleId:scoreSpec:predictionReasonString:anchor:predictionReasons:", v10, v16, v17, objc_msgSend(v11, "anchorType"), objc_msgSend(v11, "atxReason"));
    if (v18)
    {
      double v14 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:v12 executableSpecification:v15 uiSpecification:v18 scoreSpecification:v16];
    }
    else
    {
      long long v19 = __atxlog_handle_default();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        +[ATXProactiveSuggestionBuilder _proactiveSuggestionFromMagicalMomentsPredictionBundleId:mmSignals:clientModelSpec:reasons:]();
      }

      double v14 = 0;
    }
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

+ (id)_uiSpecForMMAppWithBundleId:(id)a3 scoreSpec:(id)a4 predictionReasonString:(id)a5 anchor:(int64_t)a6 predictionReasons:(unint64_t)a7
{
  id v12 = a5;
  id v13 = a3;
  if ([a4 suggestedConfidenceCategory] <= 2) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 42;
  }
  uint64_t v15 = [MEMORY[0x1E4F93960] layoutConfigurationsForLayoutOptions:v14];
  LOWORD(v18) = 1;
  id v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F93978]), "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:", v13, 0, v12, v15, 0, objc_msgSend(a1, "isMMAnchorWhitelistedForHomeScreen:", a6), v18, a7);

  return v16;
}

+ (id)_scoreSpecForMagicalMomentsPredictionWithMmSignals:(id)a3
{
  id v3 = a3;
  if ([v3 predictionIndex])
  {
    uint64_t v4 = 2;
  }
  else
  {
    [v3 confidence];
    if (v5 > 0.25) {
      uint64_t v4 = 4;
    }
    else {
      uint64_t v4 = 2;
    }
  }
  id v6 = objc_alloc(MEMORY[0x1E4F93968]);
  [v3 confidence];
  id v7 = objc_msgSend(v6, "initWithRawScore:suggestedConfidenceCategory:", v4);

  return v7;
}

+ (BOOL)isMMAnchorWhitelistedForHomeScreen:(int64_t)a3
{
  uint64_t v4 = +[_ATXGlobals sharedInstance];
  double v5 = [v4 whitelistedAnchorsForMagicalMomentsOnHomeScreen];

  id v6 = [NSNumber numberWithInteger:a3];
  LOBYTE(v4) = [v5 containsObject:v6];

  return (char)v4;
}

+ (id)proactiveSuggestionsForLockscreenActions:(id)a3 clientModelSpec:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__ATXProactiveSuggestionBuilder_proactiveSuggestionsForLockscreenActions_clientModelSpec___block_invoke;
  v10[3] = &unk_1E68AD038;
  id v11 = v6;
  id v12 = a1;
  id v7 = v6;
  v8 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v10);

  return v8;
}

id __90__ATXProactiveSuggestionBuilder_proactiveSuggestionsForLockscreenActions_clientModelSpec___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = __atxlog_handle_blending();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "lockscreen: converting action to proactive suggestion: %@", (uint8_t *)&v8, 0xCu);
  }

  double v5 = [*(id *)(a1 + 40) proactiveSuggestionForLockscreenAction:v3 clientModelSpec:*(void *)(a1 + 32)];
  id v6 = __atxlog_handle_blending();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __90__ATXProactiveSuggestionBuilder_proactiveSuggestionsForLockscreenActions_clientModelSpec___block_invoke_cold_1();
  }

  return v5;
}

+ (id)proactiveSuggestionForLockscreenAction:(id)a3 clientModelSpec:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 predictedItem];
  id v8 = objc_alloc(MEMORY[0x1E4F93968]);
  [v6 score];
  float v10 = v9;

  id v11 = (void *)[v8 initWithRawScore:4 suggestedConfidenceCategory:v10];
  id v12 = objc_alloc(MEMORY[0x1E4F93950]);
  id v13 = [v7 description];
  uint64_t v14 = [v7 actionUUID];
  uint64_t v15 = [v14 UUIDString];
  id v16 = (void *)[v12 initWithExecutableObject:v7 executableDescription:v13 executableIdentifier:v15 suggestionExecutableType:2];

  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F93960]) initWithApplicableSuggestionLayout:5];
  id v18 = objc_alloc(MEMORY[0x1E4F93978]);
  long long v19 = [v7 actionTitle];
  long long v20 = [v7 actionSubtitle];
  v25[0] = v17;
  long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  long long v22 = (void *)[v18 initWithTitle:v19 subtitle:v20 preferredLayoutConfigs:v21 allowedOnLockscreen:1 allowedOnHomeScreen:0 allowedOnSpotlight:0];

  int v23 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:v5 executableSpecification:v16 uiSpecification:v22 scoreSpecification:v11];
  return v23;
}

+ (id)proactiveSuggestionsForAppsWithHeroAppPredictions:(id)a3 clientModelSpec:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __99__ATXProactiveSuggestionBuilder_proactiveSuggestionsForAppsWithHeroAppPredictions_clientModelSpec___block_invoke;
  v12[3] = &unk_1E68AD060;
  id v13 = v5;
  id v14 = v7;
  id v8 = v7;
  id v9 = v5;
  float v10 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v12);

  return v10;
}

id __99__ATXProactiveSuggestionBuilder_proactiveSuggestionsForAppsWithHeroAppPredictions_clientModelSpec___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[ATXProactiveSuggestionBuilder _proactiveSuggestionFromHeroAppPrediction:a2 clientModelSpec:*(void *)(a1 + 32) reasons:*(void *)(a1 + 40)];
}

+ (id)_proactiveSuggestionFromHeroAppPrediction:(id)a3 clientModelSpec:(id)a4 reasons:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 bundleId];
  id v12 = [a1 _executableSpecForAppWithBundleId:v11];
  id v13 = [a1 _scoreSpecForHeroAppPrediction:v8];
  id v14 = [v10 appHeroAppReason];

  uint64_t v15 = [a1 _uiSpecForHeroAppPrediction:v8 scoreSpec:v13 predictionReason:v14];
  if (v15)
  {
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:v9 executableSpecification:v12 uiSpecification:v15 scoreSpecification:v13];
  }
  else
  {
    id v17 = __atxlog_handle_default();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[ATXProactiveSuggestionBuilder _proactiveSuggestionFromHeroAppPrediction:clientModelSpec:reasons:]();
    }

    id v16 = 0;
  }

  return v16;
}

+ (id)_scoreSpecForHeroAppPrediction:(id)a3
{
  if ([a3 rank] == 1) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 3;
  }
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F93968]) initWithRawScore:v3 suggestedConfidenceCategory:1.0];
  return v4;
}

+ (id)_uiSpecForHeroAppPrediction:(id)a3 scoreSpec:(id)a4 predictionReason:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 bundleId];
  uint64_t v11 = [v8 suggestedConfidenceCategory];

  if (v11 <= 2) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 42;
  }
  id v13 = [MEMORY[0x1E4F93960] layoutConfigurationsForLayoutOptions:v12];
  id v14 = objc_alloc(MEMORY[0x1E4F93978]);
  BOOL v15 = (unint64_t)[v9 rank] < 3;
  unint64_t v16 = [v9 rank];

  BYTE1(v19) = 0;
  LOBYTE(v19) = v16 > 2;
  id v17 = objc_msgSend(v14, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", v10, 0, v7, v13, 0, v15, v19);

  return v17;
}

+ (id)proactiveSuggestionsForSpotlightPOIWithHeroAppPredictions:(id)a3 clientModelSpec:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __107__ATXProactiveSuggestionBuilder_proactiveSuggestionsForSpotlightPOIWithHeroAppPredictions_clientModelSpec___block_invoke;
  v9[3] = &unk_1E68AD088;
  id v10 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v9);

  return v7;
}

id __107__ATXProactiveSuggestionBuilder_proactiveSuggestionsForSpotlightPOIWithHeroAppPredictions_clientModelSpec___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[ATXProactiveSuggestionBuilder _proactiveSuggestionForSpotlightPOIFromHeroAppPrediction:a2 clientModelSpec:*(void *)(a1 + 32)];
}

+ (id)_proactiveSuggestionForSpotlightPOIFromHeroAppPrediction:(id)a3 clientModelSpec:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v6 rank] < 3)
  {
    id v8 = [v6 bundleId];
    uint64_t v11 = [v6 poiMuid];
    uint64_t v12 = (void *)v11;
    if (v8 && v11)
    {
      id v13 = (void *)[objc_alloc(MEMORY[0x1E4F4B328]) initWithPOIName:v8 muid:v11 criteria:0];
      id v14 = [a1 _executableSpecForSpotlightAction:v13];
      BOOL v15 = [a1 _scoreSpecForHeroAppPrediction:v6];
      unint64_t v16 = [a1 _uiSpecForSpotlightPOIPrediction:v8 predictionReasons:0x800000];
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:v7 executableSpecification:v14 uiSpecification:v16 scoreSpecification:v15];
    }
    else
    {
      id v17 = __atxlog_handle_default();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[ATXProactiveSuggestionBuilder _proactiveSuggestionForSpotlightPOIFromHeroAppPrediction:clientModelSpec:]();
      }

      id v10 = 0;
    }
  }
  else
  {
    id v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = NSStringFromClass((Class)a1);
      int v19 = 138412546;
      long long v20 = v9;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%@ - _proactiveSuggestionForSpotlightPOIFromHeroAppPrediction: %@ not included on Spotlight, returning nil", (uint8_t *)&v19, 0x16u);
    }
    id v10 = 0;
  }

  return v10;
}

+ (id)_executableSpecForSpotlightAction:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F93950];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 actionDescription];
  id v7 = [v4 actionIdentifier];
  id v8 = (void *)[v5 initWithExecutableObject:v4 executableDescription:v6 executableIdentifier:v7 suggestionExecutableType:8];

  return v8;
}

+ (id)_uiSpecForSpotlightPOIPrediction:(id)a3 predictionReasons:(unint64_t)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4F93960];
  id v6 = a3;
  id v7 = (void *)[[v5 alloc] initWithApplicableSuggestionLayout:5];
  v12[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  LOWORD(v11) = 1;
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F93978]), "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:", v6, 0, 0, v8, 0, 0, v11, a4);

  return v9;
}

+ (id)proactiveSuggestionForAppClipsFromHeroAppPredictions:(id)a3 clientModelSpec:(id)a4 mediumThreshold:(double)a5 highThreshold:(double)a6
{
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = objc_opt_new();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __132__ATXProactiveSuggestionBuilder_proactiveSuggestionForAppClipsFromHeroAppPredictions_clientModelSpec_mediumThreshold_highThreshold___block_invoke;
  v17[3] = &unk_1E68AD0B0;
  id v19 = v12;
  id v20 = a1;
  double v21 = a5;
  double v22 = a6;
  id v18 = v10;
  id v13 = v12;
  id v14 = v10;
  BOOL v15 = objc_msgSend(v11, "_pas_mappedArrayWithTransform:", v17);

  return v15;
}

id __132__ATXProactiveSuggestionBuilder_proactiveSuggestionForAppClipsFromHeroAppPredictions_clientModelSpec_mediumThreshold_highThreshold___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 48) proactiveSuggestionForAppClipFromHeroAppPrediction:a2 clientModelSpec:*(void *)(a1 + 32) mediumThreshold:*(void *)(a1 + 40) highThreshold:*(double *)(a1 + 56) reasons:*(double *)(a1 + 64)];
  uint64_t v3 = __atxlog_handle_blending();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __132__ATXProactiveSuggestionBuilder_proactiveSuggestionForAppClipsFromHeroAppPredictions_clientModelSpec_mediumThreshold_highThreshold___block_invoke_cold_1();
  }

  return v2;
}

+ (id)proactiveSuggestionForAppClipFromHeroAppPrediction:(id)a3 clientModelSpec:(id)a4 mediumThreshold:(double)a5 highThreshold:(double)a6 reasons:(id)a7
{
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  BOOL v15 = [v14 bundleId];
  unint64_t v16 = [v14 clipMetadata];
  id v17 = [v16 clipName];

  id v18 = [v14 clipMetadata];
  id v19 = [v18 clipCaption];

  [v14 score];
  double v21 = v20;
  double v22 = [a1 _executableSpecForAppClipWithHeroAppPrediction:v14];

  uint64_t v23 = [v12 appLocationBasedAppClipReason];

  uint64_t v24 = [a1 _uiSpecForAppClipWithBundleId:v15 title:v17 subtitle:v19 predictionReason:v23];
  double v25 = [a1 _scoreSpecForAppClipWithScore:v21 mediumThreshold:a5 highThreshold:a6];
  double v26 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:v13 executableSpecification:v22 uiSpecification:v24 scoreSpecification:v25];

  return v26;
}

+ (id)_executableSpecForAppClipWithHeroAppPrediction:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bundleId];
  id v5 = objc_alloc(MEMORY[0x1E4F93950]);
  id v6 = (void *)[[NSString alloc] initWithFormat:@"%@:CLIP", v4];
  id v7 = (void *)[[NSString alloc] initWithFormat:@"%@:CLIP", v4];
  id v8 = (void *)[v5 initWithExecutableObject:v3 executableDescription:v6 executableIdentifier:v7 suggestionExecutableType:5];

  return v8;
}

+ (id)_uiSpecForAppClipWithBundleId:(id)a3 title:(id)a4 subtitle:(id)a5 predictionReason:(id)a6
{
  id v8 = (objc_class *)MEMORY[0x1E4F93978];
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [v8 alloc];
  id v13 = [MEMORY[0x1E4F93960] layoutConfigurationsForLayoutOptions:40];
  LOWORD(v16) = 1;
  id v14 = objc_msgSend(v12, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:", v11, v10, v9, v13, 0, 1, v16, 0x800000);

  return v14;
}

+ (id)_scoreSpecForAppClipWithScore:(double)a3 mediumThreshold:(double)a4 highThreshold:(double)a5
{
  uint64_t v6 = [a1 _confidenceCategoryForScore:a3 highThreshold:a5 mediumThreshold:a4];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F93968]) initWithRawScore:v6 suggestedConfidenceCategory:a3];
  return v7;
}

+ (id)executableIdForAction:(id)a3
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 actionKey];
  id v7 = NSNumber;
  uint64_t v8 = [v4 paramHash];

  id v9 = [v7 numberWithUnsignedInteger:v8];
  id v10 = (void *)[v5 initWithFormat:@"%@:%lld", v6, objc_msgSend(v9, "longLongValue")];

  return v10;
}

+ (id)proactiveSuggestionsFromScoredAction:(id)a3 clientModelSpec:(id)a4 mediumThreshold:(double)a5 highThreshold:(double)a6 predictionReason:(id)a7 allowedOnHomescreen:(BOOL)a8 predictionReasons:(unint64_t)a9
{
  BOOL v10 = a8;
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  if (v16)
  {
    [v16 score];
    double v20 = [a1 _scoreSpecForScore:v19 highThreshold:a6 mediumThreshold:a5];
    double v21 = [a1 _executableSpecForScoredAction:v16];
    if (v21)
    {
      double v22 = [a1 _uiSpecForScoredAction:v16 scoreSpec:v20 clientModelSpec:v17 predictionReason:v18 allowedOnLockscreen:1 allowedOnHomescreen:v10 predictionReasons:a9];
      uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:v17 executableSpecification:v21 uiSpecification:v22 scoreSpecification:v20];
    }
    else
    {
      uint64_t v24 = __atxlog_handle_default();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        +[ATXProactiveSuggestionBuilder proactiveSuggestionsFromScoredAction:clientModelSpec:mediumThreshold:highThreshold:predictionReason:allowedOnHomescreen:predictionReasons:]();
      }

      uint64_t v23 = 0;
    }
  }
  else
  {
    double v20 = __atxlog_handle_default();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[ATXProactiveSuggestionBuilder proactiveSuggestionsFromScoredAction:clientModelSpec:mediumThreshold:highThreshold:predictionReason:allowedOnHomescreen:predictionReasons:]((objc_class *)a1);
    }
    uint64_t v23 = 0;
  }

  return v23;
}

+ (id)cachedTitleAndSubtitleForAction:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 intent];
  if (v4
    && (id v5 = (void *)v4,
        [v3 intent],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        v5,
        (isKindOfClass & 1) == 0))
  {
    BOOL v10 = +[ATXIntentMetadataCache sharedInstance];
    id v11 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v12 = [v11 localeIdentifier];

    id v13 = [v3 intent];
    uint64_t v8 = [v10 titleForIntent:v13 localeIdentifier:v12];

    id v14 = [v3 intent];
    id v9 = [v10 subtitleForIntent:v14 localeIdentifier:v12];
  }
  else
  {
    uint64_t v8 = [v3 actionTitle];
    id v9 = [v3 actionSubtitle];
  }
  BOOL v15 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v8 second:v9];

  return v15;
}

+ (id)_executableSpecForScoredAction:(id)a3
{
  uint64_t v4 = [a3 predictedItem];
  id v5 = [(id)objc_opt_class() cachedTitleAndSubtitleForAction:v4];
  uint64_t v6 = [v5 first];
  id v7 = [v5 second];
  uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"%@ | %@", v6, v7];
  id v9 = [a1 executableIdForAction:v4];
  BOOL v10 = (void *)[objc_alloc(MEMORY[0x1E4F93950]) initWithExecutableObject:v4 executableDescription:v8 executableIdentifier:v9 suggestionExecutableType:2];

  return v10;
}

+ (id)_uiSpecForScoredAction:(id)a3 scoreSpec:(id)a4 clientModelSpec:(id)a5 predictionReason:(id)a6 shouldClearOnEngagement:(BOOL)a7 allowedOnLockscreen:(BOOL)a8
{
  LOBYTE(v9) = 1;
  return (id)[a1 _uiSpecForScoredAction:a3 scoreSpec:a4 clientModelSpec:a5 predictionReason:a6 shouldClearOnEngagement:a7 allowedOnLockscreen:a8 allowedOnHomescreen:v9 predictionReasons:0];
}

+ (id)_uiSpecForScoredAction:(id)a3 scoreSpec:(id)a4 clientModelSpec:(id)a5 predictionReason:(id)a6 shouldClearOnEngagement:(BOOL)a7 allowedOnLockscreen:(BOOL)a8 allowedOnHomescreen:(BOOL)a9 predictionReasons:(unint64_t)a10
{
  BOOL v10 = a8;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  if ([a4 suggestedConfidenceCategory] <= 2) {
    uint64_t v17 = 44;
  }
  else {
    uint64_t v17 = 40;
  }
  id v18 = [MEMORY[0x1E4F93960] layoutConfigurationsForLayoutOptions:v17];
  float v19 = [v15 clientModelId];

  double v20 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:3];
  int v21 = [v19 isEqualToString:v20];

  if (v21)
  {
    uint64_t v22 = [MEMORY[0x1E4F93960] layoutConfigurationsForLayoutOptions:40];

    id v18 = (void *)v22;
  }
  uint64_t v23 = [v16 predictedItem];
  uint64_t v24 = [v23 actionType];

  double v25 = (void *)MEMORY[0x1E4F4B2B8];
  double v26 = [v16 predictedItem];
  int v27 = [v25 isActionEligibleForSettingsSuggestions:v26];

  int v28 = v27 ^ 1;
  if (v24 == 5) {
    unsigned int v29 = 0;
  }
  else {
    unsigned int v29 = v27 ^ 1;
  }
  if (v10) {
    uint64_t v30 = v29;
  }
  else {
    uint64_t v30 = 0;
  }
  BOOL v31 = v24 != 5 && a9;
  uint64_t v32 = v31 & v28;
  v33 = [v16 predictedItem];

  v34 = [(id)objc_opt_class() cachedTitleAndSubtitleForAction:v33];
  v35 = [v34 first];
  v36 = [v34 second];
  BYTE1(v39) = a7;
  LOBYTE(v39) = v28;
  v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4F93978]), "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:", v35, v36, v14, v18, v30, v32, v39, a10);

  return v37;
}

+ (id)_uiSpecForScoredAction:(id)a3 scoreSpec:(id)a4 clientModelSpec:(id)a5 predictionReason:(id)a6 allowedOnLockscreen:(BOOL)a7 allowedOnHomescreen:(BOOL)a8
{
  return (id)[a1 _uiSpecForScoredAction:a3 scoreSpec:a4 clientModelSpec:a5 predictionReason:a6 allowedOnLockscreen:a7 allowedOnHomescreen:a8 predictionReasons:0];
}

+ (id)_uiSpecForScoredAction:(id)a3 scoreSpec:(id)a4 clientModelSpec:(id)a5 predictionReason:(id)a6 allowedOnLockscreen:(BOOL)a7 predictionReasons:(unint64_t)a8
{
  return (id)[a1 _uiSpecForScoredAction:a3 scoreSpec:a4 clientModelSpec:a5 predictionReason:a6 allowedOnLockscreen:a7 allowedOnHomescreen:1 predictionReasons:a8];
}

+ (id)_uiSpecForScoredAction:(id)a3 scoreSpec:(id)a4 clientModelSpec:(id)a5 predictionReason:(id)a6 allowedOnLockscreen:(BOOL)a7 allowedOnHomescreen:(BOOL)a8 predictionReasons:(unint64_t)a9
{
  BOOL v29 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [v15 predictedItem];
  uint64_t v17 = [v16 intent];
  if (v17)
  {
    id v18 = +[ATXIntentMetadataCache sharedInstance];
    unsigned int v19 = [v18 supportsBackgroundExecutionForIntent:v17];
  }
  else
  {
    unsigned int v19 = 0;
  }
  double v20 = [v16 userActivityWebpageURL];
  int v21 = objc_msgSend(v20, "atx_isOpenableFaceTimeURL");

  uint64_t v22 = [v17 _className];
  int v23 = [v22 isEqualToString:@"MTCreateAlarmIntent"];

  LOBYTE(v26) = a8;
  uint64_t v24 = [a1 _uiSpecForScoredAction:v15 scoreSpec:v14 clientModelSpec:v13 predictionReason:v12 shouldClearOnEngagement:v23 | v21 | v19 allowedOnLockscreen:v29 allowedOnHomescreen:v26 predictionReasons:a9];

  return v24;
}

+ (id)_uiSpecForScoredAction:(id)a3 scoreSpec:(id)a4 clientModelSpec:(id)a5 predictionReason:(id)a6
{
  return (id)[a1 _uiSpecForScoredAction:a3 scoreSpec:a4 clientModelSpec:a5 predictionReason:a6 allowedOnLockscreen:1 allowedOnHomescreen:1];
}

+ (id)_scoreSpecForScore:(double)a3 highThreshold:(double)a4 mediumThreshold:(double)a5
{
  uint64_t v6 = [a1 _confidenceCategoryForScore:a3 highThreshold:a4 mediumThreshold:a5];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F93968]) initWithRawScore:v6 suggestedConfidenceCategory:a3];
  return v7;
}

+ (id)proactiveSuggestionForAppWithBundleId:(id)a3 score:(double)a4 clientModelSpec:(id)a5 mediumThreshold:(double)a6 highThreshold:(double)a7 predictionReason:(id)a8 allowedOnHomescreen:(BOOL)a9
{
  BOOL v9 = a9;
  id v16 = a3;
  id v17 = a5;
  id v18 = a8;
  unsigned int v19 = [a1 _executableSpecForAppWithBundleId:v16];
  double v20 = [a1 _scoreSpecForScore:a4 highThreshold:a7 mediumThreshold:a6];
  int v21 = [a1 _uiSpecForAppWithBundleId:v16 scoreSpec:v20 predictionReason:v18 allowedOnHomescreen:v9];

  if (v21)
  {
    uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:v17 executableSpecification:v19 uiSpecification:v21 scoreSpecification:v20];
  }
  else
  {
    int v23 = __atxlog_handle_default();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      +[ATXProactiveSuggestionBuilder proactiveSuggestionForAppWithBundleId:score:clientModelSpec:mediumThreshold:highThreshold:predictionReason:allowedOnHomescreen:]();
    }

    uint64_t v22 = 0;
  }

  return v22;
}

+ (id)_uiSpecForAppWithBundleId:(id)a3 scoreSpec:(id)a4 predictionReason:(id)a5
{
  return (id)[a1 _uiSpecForAppWithBundleId:a3 scoreSpec:a4 predictionReason:a5 allowedOnHomescreen:1];
}

+ (id)_uiSpecForAppWithBundleId:(id)a3 scoreSpec:(id)a4 predictionReason:(id)a5 allowedOnHomescreen:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a3;
  if ([a4 suggestedConfidenceCategory] < 3)
  {
    id v11 = [MEMORY[0x1E4F93960] layoutConfigurationsForLayoutOptions:2];
    id v12 = objc_alloc(MEMORY[0x1E4F93978]);
    LOWORD(v19) = 1;
    id v13 = v10;
    id v14 = v9;
    id v15 = v11;
    uint64_t v16 = 1;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F93960] layoutConfigurationsForLayoutOptions:42];
    id v12 = objc_alloc(MEMORY[0x1E4F93978]);
    LOWORD(v19) = 1;
    id v13 = v10;
    id v14 = v9;
    id v15 = v11;
    uint64_t v16 = v6;
  }
  id v17 = objc_msgSend(v12, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", v13, 0, v14, v15, 0, v16, v19);

  return v17;
}

+ (id)_executableSpecForAppWithBundleId:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F93950];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithExecutableObject:v4 executableDescription:v4 executableIdentifier:v4 suggestionExecutableType:1];

  return v5;
}

+ (id)_scoreSpecForAppWithScore:(double)a3 isHighConfidence:(BOOL)a4
{
  uint64_t v5 = [a1 _confidenceCategoryGivenIsHighConfidence:a4];
  BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F93968]) initWithRawScore:v5 suggestedConfidenceCategory:a3];
  return v6;
}

+ (int64_t)_confidenceCategoryGivenIsHighConfidence:(BOOL)a3
{
  if (a3) {
    return 4;
  }
  else {
    return 2;
  }
}

+ (int64_t)_confidenceCategoryForScore:(double)a3 highThreshold:(double)a4 mediumThreshold:(double)a5
{
  int64_t v5 = 3;
  if (a3 < a5) {
    int64_t v5 = 2;
  }
  if (a3 >= a4) {
    return 4;
  }
  else {
    return v5;
  }
}

+ (id)proactiveSuggestionsFromHeuristicActionResults:(id)a3 clientModelSpec:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v6, "atx_actionsFromActionResults");
  id v9 = +[ATXDisplayCacheLockscreenFilter indicesOfLockScreenActionsForActionPredictions:v8 criteria:0];
  id v10 = objc_opt_new();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __112__ATXProactiveSuggestionBuilder_PredictionItem__proactiveSuggestionsFromHeuristicActionResults_clientModelSpec___block_invoke;
  v16[3] = &unk_1E68B62E0;
  id v20 = a1;
  id v11 = v7;
  id v17 = v11;
  id v18 = v10;
  id v12 = v9;
  id v19 = v12;
  id v13 = v10;
  id v14 = objc_msgSend(v6, "_pas_mappedArrayWithIndexedTransform:", v16);

  return v14;
}

id __112__ATXProactiveSuggestionBuilder_PredictionItem__proactiveSuggestionsFromHeuristicActionResults_clientModelSpec___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = objc_msgSend(*(id *)(a1 + 56), "_proactiveSuggestionsFromHeuristicActionResult:clientModelSpec:reasons:allowedOnLockscreen:", v5, *(void *)(a1 + 32), *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "containsIndex:", a3));

  return v6;
}

+ (id)_proactiveSuggestionsFromHeuristicActionResult:(id)a3 clientModelSpec:(id)a4 reasons:(id)a5 allowedOnLockscreen:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v10 scoredAction];

  if (v13)
  {
    id v14 = (id *)[v10 predictionItem];
    id v15 = v14 + 1;
    id v16 = *v14;
    id v26 = v16;
    memcpy(v27, v15, sizeof(v27));
    if (a1)
    {
      id v17 = [a1 _scoreSpecForPredictionItem:&v26];
    }
    else
    {

      id v17 = 0;
    }
    id v19 = objc_msgSend(v10, "scoredAction", v26);
    id v20 = [a1 _executableSpecForScoredAction:v19];

    if (v20)
    {
      int v21 = [a1 _actionPredictionReasonForActionResult:v10 reasons:v12];
      uint64_t v22 = [a1 _actionPredictionReasonsForActionResult:v10 reasons:v12];
      int v23 = [v10 scoredAction];
      uint64_t v24 = [a1 _uiSpecForScoredAction:v23 scoreSpec:v17 clientModelSpec:v11 predictionReason:v21 allowedOnLockscreen:v6 predictionReasons:v22];

      id v18 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:v11 executableSpecification:v20 uiSpecification:v24 scoreSpecification:v17];
    }
    else
    {
      int v21 = __atxlog_handle_default();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass((Class)a1);
        objc_claimAutoreleasedReturnValue();
        +[ATXProactiveSuggestionBuilder(PredictionItem) _proactiveSuggestionsFromHeuristicActionResult:clientModelSpec:reasons:allowedOnLockscreen:]();
      }
      id v18 = 0;
    }
  }
  else
  {
    id v17 = __atxlog_handle_default();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass((Class)a1);
      objc_claimAutoreleasedReturnValue();
      +[ATXProactiveSuggestionBuilder(PredictionItem) _proactiveSuggestionsFromHeuristicActionResult:clientModelSpec:reasons:allowedOnLockscreen:]();
    }
    id v18 = 0;
  }

  return v18;
}

+ (id)proactiveSuggestionsFromActionResults:(id)a3 clientModelSpec:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __103__ATXProactiveSuggestionBuilder_PredictionItem__proactiveSuggestionsFromActionResults_clientModelSpec___block_invoke;
  v13[3] = &unk_1E68B6308;
  id v16 = a1;
  id v9 = v7;
  id v14 = v9;
  id v15 = v8;
  id v10 = v8;
  id v11 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v13);

  return v11;
}

id __103__ATXProactiveSuggestionBuilder_PredictionItem__proactiveSuggestionsFromActionResults_clientModelSpec___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 48) _proactiveSuggestionsFromActionResult:a2 clientModelSpec:*(void *)(a1 + 32) reasons:*(void *)(a1 + 40)];
  return v2;
}

+ (id)_proactiveSuggestionsFromActionResult:(id)a3 clientModelSpec:(id)a4 reasons:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 scoredAction];

  if (v11)
  {
    id v12 = (id *)[v8 predictionItem];
    id v13 = v12 + 1;
    id v14 = *v12;
    id v23 = v14;
    memcpy(v24, v13, sizeof(v24));
    if (a1)
    {
      id v15 = [a1 _scoreSpecForPredictionItem:&v23];
    }
    else
    {

      id v15 = 0;
    }
    id v17 = objc_msgSend(v8, "scoredAction", v23);
    id v18 = [a1 _executableSpecForScoredAction:v17];

    if (v18)
    {
      id v19 = [a1 _actionPredictionReasonForActionResult:v8 reasons:v10];
      id v20 = [v8 scoredAction];
      int v21 = [a1 _uiSpecForScoredAction:v20 scoreSpec:v15 clientModelSpec:v9 predictionReason:v19];

      id v16 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:v9 executableSpecification:v18 uiSpecification:v21 scoreSpecification:v15];
    }
    else
    {
      id v19 = __atxlog_handle_default();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass((Class)a1);
        objc_claimAutoreleasedReturnValue();
        +[ATXProactiveSuggestionBuilder(PredictionItem) _proactiveSuggestionsFromHeuristicActionResult:clientModelSpec:reasons:allowedOnLockscreen:]();
      }
      id v16 = 0;
    }
  }
  else
  {
    id v15 = __atxlog_handle_default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass((Class)a1);
      objc_claimAutoreleasedReturnValue();
      +[ATXProactiveSuggestionBuilder(PredictionItem) _proactiveSuggestionsFromActionResult:clientModelSpec:reasons:]();
    }
    id v16 = 0;
  }

  return v16;
}

+ (id)_actionPredictionReasonForActionResult:(id)a3 reasons:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 _isHeuristicActionForActionResult:v6])
  {
    id v8 = [v6 scoredAction];
    id v9 = [v8 predictedItem];
    id v10 = [v9 heuristic];

    id v11 = [v7 actionHeuristicReasonForHeuristicName:v10];
  }
  else
  {
    id v11 = [v7 actionBehavioralReason];
  }

  return v11;
}

+ (unint64_t)_actionPredictionReasonsForActionResult:(id)a3 reasons:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([a1 _isHeuristicActionForActionResult:v5])
  {
    id v6 = [v5 scoredAction];
    id v7 = [v6 predictedItem];
    id v8 = [v7 heuristic];

    if ([v8 hasPrefix:@"changeAlarmBeforeHoliday"])
    {
      unint64_t v9 = 0x800000000;
    }
    else
    {
      id v10 = __atxlog_handle_default();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromClass((Class)a1);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        id v12 = [v5 scoredAction];
        id v13 = [v12 predictedItem];
        id v14 = [v13 heuristic];
        int v16 = 138412546;
        id v17 = v11;
        __int16 v18 = 2112;
        id v19 = v14;
        _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "%@ - _actionPredictionReasonsForActionResult: heuristic %@ reason bit set to Unknown", (uint8_t *)&v16, 0x16u);
      }
      unint64_t v9 = 0;
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

+ (BOOL)_isHeuristicActionForActionResult:(id)a3
{
  id v3 = a3;
  id v4 = [v3 scoredAction];
  id v5 = [v4 predictedItem];
  if ([v5 isHeuristic])
  {
    id v6 = [v3 scoredAction];
    id v7 = [v6 predictedItem];
    id v8 = [v7 heuristic];
    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)proactiveSuggestionsFromAppPredictionItems:(const void *)a3 clientModelSpec:(id)a4 maxSuggestionsToSendToBlendingLayer:(int)a5
{
  id v16 = a4;
  id v15 = objc_opt_new();
  id v7 = objc_opt_new();
  uint64_t v8 = 0;
  for (unint64_t i = 0;
        [v7 count] <= (unint64_t)a5
     && 0xDAB7EC1DD3431B57 * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 5) > i;
        ++i)
  {
    id v10 = (void *)MEMORY[0x1D25F6CC0]();
    id v11 = ATXProactiveSuggestionBuilder;
    id v12 = (id *)(*(void *)a3 + v8);
    id v13 = *v12;
    id v17 = v13;
    memcpy(v18, v12 + 1, sizeof(v18));
    if (ATXProactiveSuggestionBuilder)
    {
      id v11 = +[ATXProactiveSuggestionBuilder _proactiveSuggestionFromAppPredictionItem:&v17 clientModelSpec:v16 reasons:v15];
      if (v11) {
        [v7 addObject:v11];
      }
    }
    else
    {
    }
    v8 += 3296;
  }

  return v7;
}

+ (id)_proactiveSuggestionFromAppPredictionItem:(ATXPredictionItem *)a3 clientModelSpec:(id)a4 reasons:(id)a5
{
  MEMORY[0x1F4188790](a1, a2);
  id v6 = v5;
  uint64_t v8 = v7;
  id v10 = v9;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v12 = v11;
  id v13 = v6;
  id v14 = [v10 _executableSpecForAppWithBundleId:*v8];
  id v15 = *v8;
  id v24 = v15;
  memcpy(v25, v8 + 1, sizeof(v25));
  if (v10)
  {
    id v16 = [v10 _scoreSpecForPredictionItem:&v24];
    id v22 = *v8;
    memcpy(v23, v8 + 1, sizeof(v23));
    id v17 = [v10 _appPredictionReasonForPredictionItem:&v22 reasons:v13];
  }
  else
  {

    id v22 = *v8;
    memcpy(v23, v8 + 1, sizeof(v23));

    id v16 = 0;
    id v17 = 0;
  }
  __int16 v18 = objc_msgSend(v10, "_uiSpecForAppWithBundleId:scoreSpec:predictionReason:", *v8, v16, v17, v22);
  if (v18)
  {
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:v12 executableSpecification:v14 uiSpecification:v18 scoreSpecification:v16];
  }
  else
  {
    uint64_t v20 = __atxlog_handle_default();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass((Class)v10);
      objc_claimAutoreleasedReturnValue();
      +[ATXProactiveSuggestionBuilder(PredictionItem) _proactiveSuggestionFromAppPredictionItem:clientModelSpec:reasons:]();
    }

    id v19 = 0;
  }

  return v19;
}

+ (id)_appPredictionReasonForPredictionItem:(ATXPredictionItem *)a3 reasons:(id)a4
{
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v5 = v4;
  id v7 = v6;
  id v9 = v8;
  id v10 = *(id *)v5;
  id v18 = v10;
  memcpy(v19, (const void *)(v5 + 8), sizeof(v19));
  if (!v7)
  {

    id v16 = *(id *)v5;
    memcpy(v17, (const void *)(v5 + 8), sizeof(v17));

    id v14 = *(id *)v5;
    memcpy(v15, (const void *)(v5 + 8), sizeof(v15));

    goto LABEL_5;
  }
  if ([v7 _isInstalledAppClipForPredictionItem:&v18])
  {
    uint64_t v11 = [v9 appInstalledAppClipReason];
    goto LABEL_10;
  }
  id v16 = *(id *)v5;
  memcpy(v17, (const void *)(v5 + 8), sizeof(v17));
  if ([v7 _isHeroAppForPredictionItem:&v16])
  {
    uint64_t v11 = [v9 appHeroAppReason];
    goto LABEL_10;
  }
  id v14 = *(id *)v5;
  memcpy(v15, (const void *)(v5 + 8), sizeof(v15));
  if (![v7 _isMagicalMomentForPredictionItem:&v14])
  {
LABEL_5:
    uint64_t v11 = objc_msgSend(v9, "appBehavioralReason", v14);
    goto LABEL_10;
  }
  uint64_t v11 = objc_msgSend(v9, "appMagicalMomentReasonForAnchorType:", (uint64_t)*(float *)(v5 + 304), v14);
LABEL_10:
  id v12 = (void *)v11;

  return v12;
}

+ (BOOL)_isHeroAppForPredictionItem:(ATXPredictionItem *)a3
{
  BOOL v3 = a3->inputSignals[75] == 0.0 && a3->inputSignals[73] > 0.0;

  return v3;
}

+ (BOOL)_isInstalledAppClipForPredictionItem:(ATXPredictionItem *)a3
{
  BOOL v3 = a3->inputSignals[769] == 1.0;

  return v3;
}

+ (BOOL)_isMagicalMomentForPredictionItem:(ATXPredictionItem *)a3
{
  BOOL v3 = a3->inputSignals[75] == 0.0 && a3->inputSignals[73] <= 0.0;

  return v3;
}

+ (id)_scoreSpecForPredictionItem:(ATXPredictionItem *)a3
{
  p_actionHash = &a3->actionHash;
  id v6 = a3->key;
  id v10 = v6;
  memcpy(v11, p_actionHash, sizeof(v11));
  if (a1) {
    a1 = (id)[a1 _confidenceCategoryForPredictionItem:&v10];
  }
  else {

  }
  id v7 = objc_alloc(MEMORY[0x1E4F93968]);
  id v8 = objc_msgSend(v7, "initWithRawScore:suggestedConfidenceCategory:", a1, a3->score, v10);

  return v8;
}

+ (int64_t)_confidenceCategoryForPredictionItem:(ATXPredictionItem *)a3
{
  if (a3->isHighConfidenceForBlendingLayer)
  {
    int64_t v3 = 4;
  }
  else if (a3->isMediumConfidenceForBlendingLayer)
  {
    int64_t v3 = 3;
  }
  else
  {
    int64_t v3 = 2;
  }

  return v3;
}

+ (void)predictionReasonForAnchorModelPrediction:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [a1 anchorType];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Failed to retrieve Anchor Class Name from Anchor Type: %@", (uint8_t *)&v4, 0xCu);
}

+ (void)proactiveSuggestionForLinkActionPrediction:score:clientModelSpec:mediumThreshold:highThreshold:predictionReason:allowedOnHomescreen:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_4();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1D0FA3000, v1, OS_LOG_TYPE_ERROR, "Suggestion Builder: Unable to retrieve Link metadata for action %@. Error: %@", v2, 0x16u);
}

+ (void)_proactiveSuggestionFromMagicalMomentsPredictionBundleId:mmSignals:clientModelSpec:reasons:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  os_log_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v2, v3, "%@ - _proactiveSuggestionFromMagicalMomentsPredictionBundleId: %@ could not generate uiSpec, returning nil", v4, v5, v6, v7, v8);
}

void __90__ATXProactiveSuggestionBuilder_proactiveSuggestionsForLockscreenActions_clientModelSpec___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  os_log_t v1 = [*v0 clientModelId];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "<<%@>> produced an Action Proactive Suggestion: %@", v4, v5, v6, v7, v8);
}

+ (void)_proactiveSuggestionFromHeroAppPrediction:clientModelSpec:reasons:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  os_log_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v2, v3, "%@ - _proactiveSuggestionFromHeroAppPrediction: %@ could not generate uiSpec, returning nil", v4, v5, v6, v7, v8);
}

+ (void)_proactiveSuggestionForSpotlightPOIFromHeroAppPrediction:clientModelSpec:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  os_log_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v2, v3, "%@ - _proactiveSuggestionForSpotlightPOIFromHeroAppPrediction: %@ no poiMuid found, returning nil", v4, v5, v6, v7, v8);
}

void __132__ATXProactiveSuggestionBuilder_proactiveSuggestionForAppClipsFromHeroAppPredictions_clientModelSpec_mediumThreshold_highThreshold___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  os_log_t v1 = [*v0 clientModelId];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "<<%@>> produced an App Clip Prediction Proactive Suggestion: %@", v4, v5, v6, v7, v8);
}

+ (void)proactiveSuggestionsFromScoredAction:(objc_class *)a1 clientModelSpec:mediumThreshold:highThreshold:predictionReason:allowedOnHomescreen:predictionReasons:.cold.1(objc_class *a1)
{
  os_log_t v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v2, v3, "%@ - proactiveSuggestionsFromScoredAction: %@ had no scoredAction, returning nil", v4, v5, v6, v7, v8);
}

+ (void)proactiveSuggestionsFromScoredAction:clientModelSpec:mediumThreshold:highThreshold:predictionReason:allowedOnHomescreen:predictionReasons:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  os_log_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v2, v3, "%@ - proactiveSuggestionsFromScoredAction: %@ could not generate executableSpec, returning nil", v4, v5, v6, v7, v8);
}

+ (void)proactiveSuggestionForAppWithBundleId:score:clientModelSpec:mediumThreshold:highThreshold:predictionReason:allowedOnHomescreen:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  os_log_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v2, v3, "%@ - proactiveSuggestionForAppWithBundleId: %@ could not generate uiSpec, returning nil", v4, v5, v6, v7, v8);
}

@end