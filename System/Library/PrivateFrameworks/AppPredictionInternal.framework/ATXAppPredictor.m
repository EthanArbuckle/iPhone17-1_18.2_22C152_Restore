@interface ATXAppPredictor
@end

@implementation ATXAppPredictor

float __77___ATXAppPredictor__copyValidScoreInputsFromPredictionItem_toPredictionItem___block_invoke(uint64_t a1, unint64_t a2)
{
  double v2 = *(float *)(*(void *)(a1 + 32) + 4 * a2 + 16);
  if (v2 != -31337.0) {
    *(float *)&double v2 = ATXSetInput(*(void *)(a1 + 40), a2, v2);
  }
  return *(float *)&v2;
}

float __119___ATXAppPredictor__getPredictionForItems_clipBundleIdsToRank_consumerSubType_intent_scoreLogger_context_featureCache___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v4 = *(void *)(v3 + 48);
  if (0xDAB7EC1DD3431B57 * ((*(void *)(v3 + 56) - v4) >> 5) <= a2
    || ([*(id *)(a1 + 32) _predictionScoreAndUpdateConfidenceForItem:v4 + 3296 * a2 interpreter:*(void *)(a1 + 40) consumerSubType:*(unsigned __int8 *)(a1 + 72) scoreLogger:*(void *)(a1 + 48) intentType:*(void *)(a1 + 56)], uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8), v8 = *(void *)(v7 + 48), 0xDAB7EC1DD3431B57 * ((*(void *)(v7 + 56) - v8) >> 5) <= a2))
  {
    std::vector<ATXPredictionItem>::__throw_out_of_range[abi:ne180100]();
  }
  float result = v6;
  *(float *)(v8 + 3296 * a2 + 3284) = result;
  return result;
}

void __49___ATXAppPredictor_inputScoresForPredictionItem___block_invoke(uint64_t a1, uint64_t a2)
{
  double v2 = *(void **)(a1 + 32);
  double v3 = *(float *)(*(void *)(a1 + 40) + 4 * a2 + 16);
  id v4 = +[_ATXScoreTypes stringForScoreInput:a2];
  objc_msgSend(v2, "setScore:forKey:", v3);
}

uint64_t __32___ATXAppPredictor_initInternal__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _initAppLaunchAndInstallMonitors];
  [*(id *)(a1 + 32) _initDependencies];
  double v2 = *(void **)(a1 + 32);
  return [v2 _initFeaturizers];
}

void __36___ATXAppPredictor__updateFromAsset__block_invoke(uint64_t a1, uint64_t a2)
{
  double v3 = [*(id *)(*(void *)(a1 + 32) + 192) abGroupIdentifierForConsumerSubType:a2];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F4AE28] abGroupNilString];
  }
  id v6 = v5;

  [*(id *)(a1 + 40) addObject:v6];
}

uint64_t __60___ATXAppPredictor__addZeroDayAppIntentKeysToBundleIdTable___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) intern:a2];
}

void __52___ATXAppPredictor__initAppLaunchAndInstallMonitors__block_invoke(uint64_t a1)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 136));
  if ((v1 & 1) == 0)
  {
    double v3 = +[_ATXAppInfoManager sharedInstance];
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v4;

    uint64_t v7 = objc_alloc_init(ATXPredictionContextBuilder);
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 72);
    *(void *)(v8 + 72) = v7;

    v10 = [_ATXAppLaunchMonitor alloc];
    v11 = +[_ATXAppLaunchHistogramManager sharedInstance];
    v12 = +[_ATXAppLaunchSequenceManager sharedInstance];
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 56);
    v14 = +[_ATXDuetHelper sharedInstance];
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 72);
    v16 = objc_opt_new();
    uint64_t v17 = [(_ATXAppLaunchMonitor *)v10 initWithAppInfoManager:v3 appLaunchHistogramManager:v11 appLaunchSequenceManager:v12 appDailyDose:v13 duetHelper:v14 contextBuilder:v15 tracker:v16];
    uint64_t v18 = *(void *)(a1 + 32);
    v19 = *(void **)(v18 + 80);
    *(void *)(v18 + 80) = v17;

    [*(id *)(*(void *)(a1 + 32) + 80) start];
    v20 = __atxlog_handle_app_prediction();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      __52___ATXAppPredictor__initAppLaunchAndInstallMonitors__block_invoke_cold_2();
    }

    uint64_t v21 = +[ATXAppLaunchLogger sharedInstance];
    uint64_t v22 = *(void *)(a1 + 32);
    v23 = *(void **)(v22 + 104);
    *(void *)(v22 + 104) = v21;

    uint64_t v24 = objc_opt_new();
    uint64_t v25 = *(void *)(a1 + 32);
    v26 = *(void **)(v25 + 48);
    *(void *)(v25 + 48) = v24;

    v27 = [ATXAppIntentMonitor alloc];
    v28 = +[_ATXAppLaunchHistogramManager sharedInstance];
    v29 = +[_ATXAppLaunchSequenceManager sharedInstance];
    v30 = +[_ATXDataStore sharedInstance];
    uint64_t v31 = [(ATXAppIntentMonitor *)v27 initWithAppLaunchHistogramManager:v28 appInfoManager:v3 appActionLaunchSequenceManager:v29 dataStore:v30];
    uint64_t v32 = *(void *)(a1 + 32);
    v33 = *(void **)(v32 + 88);
    *(void *)(v32 + 88) = v31;

    [*(id *)(*(void *)(a1 + 32) + 88) start];
    v34 = __atxlog_handle_default();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      __52___ATXAppPredictor__initAppLaunchAndInstallMonitors__block_invoke_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 176), v3);
    v35 = [[_ATXAppInstallMonitor alloc] initWithAppInfoManager:*(void *)(*(void *)(a1 + 32) + 176)];
    uint64_t v36 = *(void *)(a1 + 32);
    v37 = *(void **)(v36 + 96);
    *(void *)(v36 + 96) = v35;

    [*(id *)(*(void *)(a1 + 32) + 96) start];
    id v38 = [[_ATXRecentInstallCache alloc] initTrackingAppsMoreRecentThan:300.0];
    uint64_t v39 = *(void *)(a1 + 32);
    v40 = *(void **)(v39 + 64);
    *(void *)(v39 + 64) = v38;

    atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 136));
    uint64_t v41 = objc_opt_new();
    uint64_t v42 = *(void *)(a1 + 32);
    v43 = *(void **)(v42 + 168);
    *(void *)(v42 + 168) = v41;
  }
}

void __37___ATXAppPredictor__initDependencies__block_invoke(uint64_t a1)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 137));
  if ((v1 & 1) == 0)
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 128);
    *(void *)(v4 + 128) = v3;

    uint64_t v6 = objc_opt_new();
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 208);
    *(void *)(v7 + 208) = v6;

    uint64_t v9 = +[ATXBBNotificationManager sharedInstance];
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 120);
    *(void *)(v10 + 120) = v9;

    uint64_t v12 = objc_opt_new();
    uint64_t v13 = *(void *)(a1 + 32);
    v14 = *(void **)(v13 + 184);
    *(void *)(v13 + 184) = v12;

    atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 137));
  }
}

uint64_t __43___ATXAppPredictor_resetRecentInstallCache__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) reset];
}

void __200___ATXAppPredictor_predictWithLimit_consumerSubType_intent_candidateBundleIdentifiers_candidateActiontypes_scoreLogger_predictionItemsToKeep_predictedItemsOutParameter_context_datastore_featureCache___block_invoke(uint64_t a1)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 144);
  uint64_t v4 = *(id **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = [v4[19] disabledBundleIds];
  uint64_t v8 = +[ATXDigitalHealthBlacklist sharedInstance];
  uint64_t v9 = [v8 blacklistedBundleIds];
  v63 = [v4 _appsToPredictWithConsumerSubType:v2 intent:v3 candidateBundleIdentifiers:v5 allSBApps:v6 appPredictionBlacklist:v7 digitalHealthBlacklist:v9];

  uint64_t v10 = objc_opt_new();
  if ([MEMORY[0x1E4F4B680] consumerTypeForSubType:*(unsigned __int8 *)(a1 + 144)] == 8)
  {
    v11 = +[ATXHistogramBundleIdTable sharedInstance];
    uint64_t v12 = *(void *)(a1 + 64);
    if (v12)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 64)];
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v22 = +[_ATXActionUtils actionKeyFilterForCandidateBundleIds:v63 candidateActionTypes:v13 blacklist:*(void *)(*(void *)(a1 + 32) + 160)];
    uint64_t v21 = [v11 allKeysFilteredBy:v22];

    if (v12) {
  }
    }
  else
  {
    uint64_t v14 = [v63 allObjects];
    if (+[ATXHeroClipManager clipsSupported])
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      uint64_t v15 = [MEMORY[0x1E4F59130] appClips];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v68 objects:v79 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v69 != v17) {
              objc_enumerationMutation(v15);
            }
            v19 = [*(id *)(*((void *)&v68 + 1) + 8 * i) bundleIdentifier];
            [v10 addObject:v19];
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v68 objects:v79 count:16];
        }
        while (v16);
      }
    }
    else
    {
      v20 = __atxlog_handle_hero();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, "Not predicting installed App Clips, since not allowed by MCProfileConnection", buf, 2u);
      }
    }
    uint64_t v21 = (void *)v14;
  }
  v64 = +[_ATXAppPredictor pruneItemsToRankForConsumerSubType:*(unsigned __int8 *)(a1 + 144) itemsToRank:v21 datastore:*(void *)(a1 + 72)];

  v23 = *(void **)(a1 + 32);
  if (v23) {
    [v23 _getPredictionForItems:v64 clipBundleIdsToRank:v10 consumerSubType:*(unsigned __int8 *)(a1 + 144) intent:*(void *)(a1 + 40) scoreLogger:*(void *)(a1 + 80) context:*(void *)(a1 + 88) featureCache:*(void *)(a1 + 96)];
  }
  else {
    memset(buf, 0, sizeof(buf));
  }
  uint64_t v24 = *(void *)(a1 + 112);
  std::vector<ATXPredictionItem>::__vdeallocate((id **)v24);
  *(_OWORD *)uint64_t v24 = *(_OWORD *)buf;
  *(void *)(v24 + 16) = *(void *)&buf[16];
  memset(buf, 0, sizeof(buf));
  v72 = buf;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100]((void ***)&v72);
  uint64_t v25 = __atxlog_handle_default();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    id v28 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:*(unsigned __int8 *)(a1 + 144)];
    uint64_t v29 = [v64 count];
    uint64_t v30 = [v10 count];
    unint64_t v31 = 0xDAB7EC1DD3431B57 * ((uint64_t)(*(void *)(*(void *)(a1 + 112) + 8) - **(void **)(a1 + 112)) >> 5);
    *(_DWORD *)buf = 138544386;
    *(void *)&buf[4] = v27;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v28;
    *(_WORD *)&buf[22] = 2050;
    uint64_t v74 = v29;
    __int16 v75 = 2050;
    uint64_t v76 = v30;
    __int16 v77 = 2050;
    unint64_t v78 = v31;
    _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ - finished app predictions for consumerSubType: %{public}@, num app candidates: %{public}lu, num clip candidates: %{public}lu, num predicted items: %{public}lu", buf, 0x34u);
  }
  id v65 = objc_alloc_init(MEMORY[0x1E4F4B288]);
  id v32 = objc_alloc(MEMORY[0x1E4F4B060]);
  v33 = [*(id *)(*(void *)(a1 + 32) + 200) objectAtIndexedSubscript:*(unsigned __int8 *)(a1 + 144)];
  v34 = objc_msgSend(v32, "initWithABGroup:assetVersion:", v33, objc_msgSend(MEMORY[0x1E4F4AF08], "version"));

  v35 = +[_ATXAppLaunchHistogramManager sharedInstance];
  uint64_t v36 = [v35 histogramForLaunchType:0];

  unint64_t v37 = *(void *)(a1 + 120);
  if (v37 && *(void *)(*(void *)(a1 + 112) + 8) != **(void **)(a1 + 112))
  {
    int v38 = 0;
    unint64_t v39 = 0;
    uint64_t v40 = 3284;
    do
    {
      uint64_t v41 = (void *)MEMORY[0x1D25F6CC0]();
      id v42 = *(id *)(**(void **)(a1 + 112) + v40 - 3284);
      if ([MEMORY[0x1E4F4B680] consumerTypeForSubType:*(unsigned __int8 *)(a1 + 144)] == 8
        || ATXShouldPredictBundle(*(void **)(*(void *)(a1 + 32) + 176), v42, v36))
      {
        if (v42)
        {
          LODWORD(v43) = *(_DWORD *)(**(void **)(a1 + 112) + v40);
          [v65 recordPrediction:v42 score:v43];
          uint64_t v44 = **(void **)(a1 + 112) + v40;
          LODWORD(v45) = *(_DWORD *)v44;
          [v34 recordPrediction:v42 actionHash:0 totalScore:v44 - 3268 scoreInputs:*(unsigned __int8 *)(v44 + 4) isMediumConfidenceForBlendingLayer:*(unsigned __int8 *)(v44 + 5) isHighConfidenceForBlendingLayer:v45];
        }
        ++v38;
      }

      unint64_t v37 = *(void *)(a1 + 120);
      if (v37 <= v38) {
        break;
      }
      ++v39;
      v40 += 3296;
    }
    while (0xDAB7EC1DD3431B57 * ((uint64_t)(*(void *)(*(void *)(a1 + 112) + 8) - **(void **)(a1 + 112)) >> 5) > v39);
  }
  v46 = *(char ***)(a1 + 128);
  if (v46)
  {
    uint64_t v47 = *(void *)(a1 + 112);
    v48 = +[_ATXGlobals sharedInstance];
    ATXKeepRandomPredictionItemsBelowLimit(v47, v37, v46, (int)[v48 numberOfRandomAppActionTypesToKeepForLogging]);
  }
  v49 = [ATXAppPredictorPredictionChunks alloc];
  v50 = [v65 finish];
  v51 = [v34 finish];
  uint64_t v52 = [(ATXAppPredictorPredictionChunks *)v49 initWithPredictionSetChunk:v50 feedbackStateChunk:v51];
  uint64_t v53 = *(void *)(*(void *)(a1 + 104) + 8);
  v54 = *(void **)(v53 + 40);
  *(void *)(v53 + 40) = v52;

  if ([MEMORY[0x1E4F4B680] consumerTypeForSubType:*(unsigned __int8 *)(a1 + 144)] != 8)
  {
    unsigned __int8 v55 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 136));
    if (v55)
    {
      v56 = [*(id *)(*(void *)(a1 + 32) + 176) allAppsWithInstallDate];
      if ([v56 count])
      {
LABEL_45:

        goto LABEL_46;
      }
      char v57 = _ZZZ200___ATXAppPredictor_predictWithLimit_consumerSubType_intent_candidateBundleIdentifiers_candidateActiontypes_scoreLogger_predictionItemsToKeep_predictedItemsOutParameter_context_datastore_featureCache__EUb_E23hasRunFirstTimeTraining;

      if ((v57 & 1) == 0)
      {
        _ZZZ200___ATXAppPredictor_predictWithLimit_consumerSubType_intent_candidateBundleIdentifiers_candidateActiontypes_scoreLogger_predictionItemsToKeep_predictedItemsOutParameter_context_datastore_featureCache__EUb_E23hasRunFirstTimeTraining = 1;
        v58 = __atxlog_handle_default();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0FA3000, v58, OS_LOG_TYPE_INFO, "Since app prediction expert has never been trained, training in background.", buf, 2u);
        }

        sel_getName(*(SEL *)(a1 + 136));
        v59 = (void *)os_transaction_create();
        v60 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v56 = dispatch_queue_attr_make_with_qos_class(v60, QOS_CLASS_BACKGROUND, 0);

        v61 = dispatch_queue_create("ATXAppPrediction-initialTrain", v56);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __200___ATXAppPredictor_predictWithLimit_consumerSubType_intent_candidateBundleIdentifiers_candidateActiontypes_scoreLogger_predictionItemsToKeep_predictedItemsOutParameter_context_datastore_featureCache___block_invoke_158;
        block[3] = &unk_1E68B48C0;
        block[4] = *(void *)(a1 + 32);
        id v67 = v59;
        id v62 = v59;
        dispatch_async(v61, block);

        goto LABEL_45;
      }
    }
  }
LABEL_46:
}

id __200___ATXAppPredictor_predictWithLimit_consumerSubType_intent_candidateBundleIdentifiers_candidateActiontypes_scoreLogger_predictionItemsToKeep_predictedItemsOutParameter_context_datastore_featureCache___block_invoke_158(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1D25F6CC0]();
  [*(id *)(a1 + 32) train];
  return self;
}

id __161___ATXAppPredictor_receiveFeedbackForConsumerType_consumerSubType_atxResponse_engagementType_engagedBundleId_bundleIdsShown_explicitlyRejectedBundleIds_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 200) objectAtIndexedSubscript:*(unsigned __int8 *)(a1 + 112)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 88) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v6 = *(void *)(a1 + 96);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 112);
  uint64_t v8 = +[ATXAppPredictionFeedbackItem feedbackItemsForResponse:*(void *)(a1 + 40)];
  +[ATXAppPredictorFeedback receiveFeedbackForConsumerType:v6 consumerSubType:v7 feedbackItemsForResponse:v8 engagementType:*(void *)(a1 + 104) engagedBundleId:*(void *)(a1 + 48) bundleIdsShown:*(void *)(a1 + 56) explicitlyRejectedBundleIds:*(void *)(a1 + 64) abGroupIdentifier:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) context:*(void *)(a1 + 72)];

  return self;
}

void __38___ATXAppPredictor_trainWithActivity___block_invoke(uint64_t a1)
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __atxlog_handle_default();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "Training app prediction expert", buf, 2u);
  }

  uint64_t v3 = +[_ATXDataStore sharedInstance];
  uint64_t v4 = +[_ATXGlobals sharedInstance];
  uint64_t v5 = +[ATXHeroAndClipConstants sharedInstance];
  uint64_t v6 = __atxlog_handle_default();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  uint64_t v8 = __atxlog_handle_default();
  uint64_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 136446210;
    v110 = "TOP_LEVEL";
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Train", "Component=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);
  }

  uint64_t v10 = (void *)os_transaction_create();
  v11 = __atxlog_handle_default();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_INFO, "Checking data store integrity", buf, 2u);
  }

  [v3 integrityCheckOrAbort];
  uint64_t v12 = __atxlog_handle_default();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_INFO, "Check for actions without titles", buf, 2u);
  }

  [v3 removeActionsWithoutTitle];
  uint64_t v13 = __atxlog_handle_default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __38___ATXAppPredictor_trainWithActivity___block_invoke_cold_5();
  }

  uint64_t v14 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v15 = [*(id *)(a1 + 32) appInstallMonitor];
  [v15 train];

  if ([*(id *)(a1 + 40) didDefer])
  {
    uint64_t v16 = __atxlog_handle_default();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v17 = "App prediction training deferring after app install monitor training";
LABEL_29:
      _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  uint64_t v18 = __atxlog_handle_default();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    __38___ATXAppPredictor_trainWithActivity___block_invoke_cold_4();
  }

  v19 = (void *)MEMORY[0x1D25F6CC0]();
  [*(id *)(*(void *)(a1 + 32) + 48) train];
  if (![*(id *)(a1 + 40) didDefer])
  {
    v20 = (void *)MEMORY[0x1D25F6CC0]();
    [*(id *)(*(void *)(a1 + 32) + 184) train];
    if ([*(id *)(a1 + 40) didDefer])
    {
      uint64_t v16 = __atxlog_handle_default();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v17 = "App prediction training deferring after micro location training";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    uint64_t v21 = (void *)MEMORY[0x1D25F6CC0]();
    [*(id *)(*(void *)(a1 + 32) + 56) train];
    if ([*(id *)(a1 + 40) didDefer])
    {
      uint64_t v16 = __atxlog_handle_default();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v17 = "App prediction training deferring after app daily dose training";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    uint64_t v22 = (void *)MEMORY[0x1D25F6CC0]();
    [*(id *)(*(void *)(a1 + 32) + 176) train];
    if ([*(id *)(a1 + 40) didDefer])
    {
      uint64_t v16 = __atxlog_handle_default();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v17 = "App prediction training deferring after app info manager training";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    v23 = __atxlog_handle_default();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      __38___ATXAppPredictor_trainWithActivity___block_invoke_cold_3();
    }

    uint64_t v16 = +[_ATXAppLaunchHistogramManager sharedInstance];
    v108 = +[_ATXAppLaunchSequenceManager sharedInstance];
    v107 = +[ATXHistogramBundleIdTable sharedInstance];
    uint64_t v24 = [[ATXPredictionDataHistograms alloc] initWithAppInfoManager:*(void *)(*(void *)(a1 + 32) + 176) bundleIdTable:v107 launchSequenceManager:v108 histogramManager:v16];
    [(ATXPredictionDataHistograms *)v24 verifyHistograms];
    if ([*(id *)(a1 + 40) didDefer])
    {
      uint64_t v25 = __atxlog_handle_default();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v26 = "App prediction training deferring after histogram verification";
LABEL_50:
        _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
      }
    }
    else
    {
      id v27 = [(ATXPredictionDataHistograms *)v24 appLaunchHistogram];
      [v4 appLaunchDecayHalflife];
      objc_msgSend(v27, "decayWithHalfLifeInDays:");

      id v28 = [(ATXPredictionDataHistograms *)v24 spotlightLaunchHistogram];
      [v4 spotlightLaunchDecayHalflife];
      objc_msgSend(v28, "decayWithHalfLifeInDays:");

      uint64_t v29 = [(ATXPredictionDataHistograms *)v24 homescreenLaunchHistogram];
      [v4 homescreenLaunchDecayHalflife];
      objc_msgSend(v29, "decayWithHalfLifeInDays:");

      uint64_t v30 = [(ATXPredictionDataHistograms *)v24 appDirectoryLaunchHistogram];
      [v4 appDirectoryLaunchDecayHalflife];
      objc_msgSend(v30, "decayWithHalfLifeInDays:");

      unint64_t v31 = [(ATXPredictionDataHistograms *)v24 airplaneModeLaunchHistogram];
      [v4 airplaneModeLaunchDecayHalflife];
      objc_msgSend(v31, "decayWithHalfLifeInDays:");

      id v32 = [(ATXPredictionDataHistograms *)v24 trendingLaunchHistogram];
      [v4 trendingLaunchDecayHalflife];
      objc_msgSend(v32, "decayWithHalfLifeInDays:");

      v33 = [(ATXPredictionDataHistograms *)v24 wifiLaunchHistogram];
      [v4 wifiSSIDLaunchDecayHalflife];
      objc_msgSend(v33, "decayWithHalfLifeInDays:");

      v34 = [(ATXPredictionDataHistograms *)v24 coreMotionLaunchHistogram];
      [v4 coreMotionLaunchDecayHalflife];
      objc_msgSend(v34, "decayWithHalfLifeInDays:");

      v35 = [(ATXPredictionDataHistograms *)v24 timeAndDayHistogram];
      [v4 timeAndDayAppLaunchesDecayHalflife];
      objc_msgSend(v35, "decayWithHalfLifeInDays:");

      uint64_t v36 = [(ATXPredictionDataHistograms *)v24 notificationsHistoryHistogram];
      [v4 notificationsHistoryDecayHalflife];
      objc_msgSend(v36, "decayWithHalfLifeInDays:");

      unint64_t v37 = [(ATXPredictionDataHistograms *)v24 appCoarseTimePOWLocationLaunchesHistogram];
      [v4 appAndActionCoarseTimePowLocationDecayHalflife];
      objc_msgSend(v37, "decayWithHalfLifeInDays:");

      int v38 = [(ATXPredictionDataHistograms *)v24 appSpecificTimeDOWLocationLaunchesHistogram];
      [v4 appAndActionSpecificTimePowLocationDecayHalflife];
      objc_msgSend(v38, "decayWithHalfLifeInDays:");

      unint64_t v39 = [(ATXPredictionDataHistograms *)v24 appCoarseTimePOWLocationConfirmsHistogram];
      [v4 appAndActionCoarseTimePowLocationDecayHalflife];
      objc_msgSend(v39, "decayWithHalfLifeInDays:");

      uint64_t v40 = [(ATXPredictionDataHistograms *)v24 appSpecificTimeDOWLocationConfirmsHistogram];
      [v4 appAndActionSpecificTimePowLocationDecayHalflife];
      objc_msgSend(v40, "decayWithHalfLifeInDays:");

      uint64_t v41 = [(ATXPredictionDataHistograms *)v24 appCoarseTimePOWLocationRejectsHistogram];
      [v4 appAndActionCoarseTimePowLocationDecayHalflife];
      objc_msgSend(v41, "decayWithHalfLifeInDays:");

      id v42 = [(ATXPredictionDataHistograms *)v24 appSpecificTimeDOWLocationRejectsHistogram];
      [v4 appAndActionSpecificTimePowLocationDecayHalflife];
      objc_msgSend(v42, "decayWithHalfLifeInDays:");

      double v43 = [(ATXPredictionDataHistograms *)v24 appSpecificGeoHashHistogram];
      [v4 appSpecificGeoHashDecayHalflife];
      objc_msgSend(v43, "decayWithHalfLifeInDays:");

      uint64_t v44 = [(ATXPredictionDataHistograms *)v24 appCoarseGeoHashHistogram];
      [v4 appCoarseGeoHashDecayHalflife];
      objc_msgSend(v44, "decayWithHalfLifeInDays:");

      double v45 = [(ATXPredictionDataHistograms *)v24 appZoom7GeoHashHistogram];
      [v4 appZoom7GeoHashDecayHalflife];
      objc_msgSend(v45, "decayWithHalfLifeInDays:");

      v46 = [(ATXPredictionDataHistograms *)v24 appLaunchesTwoHourTimeInterval];
      [v4 appLaunchesTwoHourTimeIntervalDecayHalflife];
      objc_msgSend(v46, "decayWithHalfLifeInDays:");

      uint64_t v47 = [(ATXPredictionDataHistograms *)v24 appConfirmsTwoHourTimeInterval];
      [v4 appConfirmsTwoHourTimeIntervalDecayHalflife];
      objc_msgSend(v47, "decayWithHalfLifeInDays:");

      v48 = [(ATXPredictionDataHistograms *)v24 appRejectsTwoHourTimeInterval];
      [v4 appRejectsTwoHourTimeIntervalDecayHalflife];
      objc_msgSend(v48, "decayWithHalfLifeInDays:");

      v49 = [(ATXPredictionDataHistograms *)v24 appConfirmsDayOfWeek];
      [v4 appConfirmsDayOfWeekDecayHalflife];
      objc_msgSend(v49, "decayWithHalfLifeInDays:");

      v50 = [(ATXPredictionDataHistograms *)v24 appRejectsDayOfWeek];
      [v4 appRejectsDayOfWeekDecayHalflife];
      objc_msgSend(v50, "decayWithHalfLifeInDays:");

      v51 = [(ATXPredictionDataHistograms *)v24 appConfirmsCoarseGeoHash];
      [v4 appConfirmsCoarseGeoHashDecayHalflife];
      objc_msgSend(v51, "decayWithHalfLifeInDays:");

      uint64_t v52 = [(ATXPredictionDataHistograms *)v24 appRejectsCoarseGeoHash];
      [v4 appRejectsCoarseGeoHashDecayHalflife];
      objc_msgSend(v52, "decayWithHalfLifeInDays:");

      uint64_t v53 = [(ATXPredictionDataHistograms *)v24 appConfirmsSpecificGeoHash];
      [v4 appConfirmsSpecificGeoHashDecayHalflife];
      objc_msgSend(v53, "decayWithHalfLifeInDays:");

      v54 = [(ATXPredictionDataHistograms *)v24 appRejectsSpecificGeoHash];
      [v4 appRejectsSpecificGeoHashDecayHalflife];
      objc_msgSend(v54, "decayWithHalfLifeInDays:");

      unsigned __int8 v55 = [(ATXPredictionDataHistograms *)v24 appExplicitRejectsCoarseTimePOWLocationHistogram];
      [v4 appExplicitRejectsCoarseTimePOWLocationDecayHalflife];
      objc_msgSend(v55, "decayWithHalfLifeInDays:");

      v56 = [(ATXPredictionDataHistograms *)v24 appClipsFeedbackHistogram];
      [v5 appClipsFeedbackHistogramHalfLifeInDays];
      objc_msgSend(v56, "decayWithHalfLifeInDays:");

      char v57 = [(ATXPredictionDataHistograms *)v24 unlockTimeHistogram];
      [v4 unlockTimeDecayHalflife];
      objc_msgSend(v57, "decayWithHalfLifeInDays:");

      v58 = [(ATXPredictionDataHistograms *)v24 dayOfWeekLaunchHistogram];
      [v4 dayOfWeekLaunchDecayHalflife];
      objc_msgSend(v58, "decayWithHalfLifeInDays:");

      v59 = [(ATXPredictionDataHistograms *)v24 homeScreenAppConfirmsCoarseTimePOWLocationHistogram];
      [v4 homeScreenAppConfirmsCoarseTimePOWLocationDecayHalflife];
      objc_msgSend(v59, "decayWithHalfLifeInDays:");

      v60 = [(ATXPredictionDataHistograms *)v24 homeScreenAppConfirmsSpecificTimeDOWLocationHistogram];
      [v4 homeScreenAppConfirmsSpecificTimeDOWLocationDecayHalflife];
      objc_msgSend(v60, "decayWithHalfLifeInDays:");

      v61 = [(ATXPredictionDataHistograms *)v24 homeScreenAppConfirmsTwoHourTimeIntervalHistogram];
      [v4 homeScreenAppConfirmsTwoHourTimeIntervalDecayHalflife];
      objc_msgSend(v61, "decayWithHalfLifeInDays:");

      id v62 = [(ATXPredictionDataHistograms *)v24 homeScreenAppConfirmsDayOfWeekHistogram];
      [v4 homeScreenAppConfirmsDayOfWeekDecayHalflife];
      objc_msgSend(v62, "decayWithHalfLifeInDays:");

      v63 = [(ATXPredictionDataHistograms *)v24 homeScreenAppConfirmsCoarseGeohashHistogram];
      [v4 homeScreenAppConfirmsCoarseGeohashDecayHalflife];
      objc_msgSend(v63, "decayWithHalfLifeInDays:");

      v64 = [(ATXPredictionDataHistograms *)v24 homeScreenAppConfirmsSpecificGeohashHistogram];
      [v4 homeScreenAppConfirmsSpecificGeohashDecayHalflife];
      objc_msgSend(v64, "decayWithHalfLifeInDays:");

      id v65 = [(ATXPredictionDataHistograms *)v24 homeScreenAppRejectsCoarseTimePOWLocationHistogram];
      [v4 homeScreenAppRejectsCoarseTimePOWLocationDecayHalflife];
      objc_msgSend(v65, "decayWithHalfLifeInDays:");

      v66 = [(ATXPredictionDataHistograms *)v24 homeScreenAppRejectsSpecificTimeDOWLocationHistogram];
      [v4 homeScreenAppRejectsSpecificTimeDOWLocationDecayHalflife];
      objc_msgSend(v66, "decayWithHalfLifeInDays:");

      id v67 = [(ATXPredictionDataHistograms *)v24 homeScreenAppRejectsTwoHourTimeIntervalHistogram];
      [v4 homeScreenAppRejectsTwoHourTimeIntervalDecayHalflife];
      objc_msgSend(v67, "decayWithHalfLifeInDays:");

      long long v68 = [(ATXPredictionDataHistograms *)v24 homeScreenAppRejectsDayOfWeekHistogram];
      [v4 homeScreenAppRejectsDayOfWeekDecayHalflife];
      objc_msgSend(v68, "decayWithHalfLifeInDays:");

      long long v69 = [(ATXPredictionDataHistograms *)v24 homeScreenAppRejectsCoarseGeohashHistogram];
      [v4 homeScreenAppRejectsCoarseGeohashDecayHalflife];
      objc_msgSend(v69, "decayWithHalfLifeInDays:");

      long long v70 = [(ATXPredictionDataHistograms *)v24 homeScreenAppRejectsSpecificGeohashHistogram];
      [v4 homeScreenAppRejectsSpecificGeohashDecayHalflife];
      objc_msgSend(v70, "decayWithHalfLifeInDays:");

      long long v71 = [(ATXPredictionDataHistograms *)v24 homeScreenAppExplicitRejectsCoarseTimePOWLocationHistogram];
      [v4 homeScreenAppExplicitRejectsCoarseTimePOWLocationDecayHalflife];
      objc_msgSend(v71, "decayWithHalfLifeInDays:");

      v72 = [(ATXPredictionDataHistograms *)v24 appDirectoryConfirmsCoarseTimePOWLocationHistogram];
      [v4 appDirectoryConfirmsCoarseTimePOWLocationDecayHalflife];
      objc_msgSend(v72, "decayWithHalfLifeInDays:");

      v73 = [(ATXPredictionDataHistograms *)v24 appDirectoryConfirmsSpecificTimeDOWLocationHistogram];
      [v4 appDirectoryConfirmsSpecificTimeDOWLocationDecayHalflife];
      objc_msgSend(v73, "decayWithHalfLifeInDays:");

      uint64_t v74 = [(ATXPredictionDataHistograms *)v24 appDirectoryConfirmsTwoHourTimeIntervalHistogram];
      [v4 appDirectoryConfirmsTwoHourTimeIntervalDecayHalflife];
      objc_msgSend(v74, "decayWithHalfLifeInDays:");

      __int16 v75 = [(ATXPredictionDataHistograms *)v24 appDirectoryConfirmsDayOfWeekHistogram];
      [v4 appDirectoryConfirmsDayOfWeekDecayHalflife];
      objc_msgSend(v75, "decayWithHalfLifeInDays:");

      uint64_t v76 = [(ATXPredictionDataHistograms *)v24 appDirectoryConfirmsCoarseGeohashHistogram];
      [v4 appDirectoryConfirmsCoarseGeohashDecayHalflife];
      objc_msgSend(v76, "decayWithHalfLifeInDays:");

      __int16 v77 = [(ATXPredictionDataHistograms *)v24 appDirectoryConfirmsSpecificGeohashHistogram];
      [v4 appDirectoryConfirmsSpecificGeohashDecayHalflife];
      objc_msgSend(v77, "decayWithHalfLifeInDays:");

      unint64_t v78 = [(ATXPredictionDataHistograms *)v24 appDirectoryRejectsCoarseTimePOWLocationHistogram];
      [v4 appDirectoryRejectsCoarseTimePOWLocationDecayHalflife];
      objc_msgSend(v78, "decayWithHalfLifeInDays:");

      v79 = [(ATXPredictionDataHistograms *)v24 appDirectoryRejectsSpecificTimeDOWLocationHistogram];
      [v4 appDirectoryRejectsSpecificTimeDOWLocationDecayHalflife];
      objc_msgSend(v79, "decayWithHalfLifeInDays:");

      uint64_t v80 = [(ATXPredictionDataHistograms *)v24 appDirectoryRejectsTwoHourTimeIntervalHistogram];
      [v4 appDirectoryRejectsTwoHourTimeIntervalDecayHalflife];
      objc_msgSend(v80, "decayWithHalfLifeInDays:");

      v81 = [(ATXPredictionDataHistograms *)v24 appDirectoryRejectsDayOfWeekHistogram];
      [v4 appDirectoryRejectsDayOfWeekDecayHalflife];
      objc_msgSend(v81, "decayWithHalfLifeInDays:");

      v82 = [(ATXPredictionDataHistograms *)v24 appDirectoryRejectsCoarseGeohashHistogram];
      [v4 appDirectoryRejectsCoarseGeohashDecayHalflife];
      objc_msgSend(v82, "decayWithHalfLifeInDays:");

      v83 = [(ATXPredictionDataHistograms *)v24 appDirectoryRejectsSpecificGeohashHistogram];
      [v4 appDirectoryRejectsSpecificGeohashDecayHalflife];
      objc_msgSend(v83, "decayWithHalfLifeInDays:");

      v84 = [(ATXPredictionDataHistograms *)v24 appDirectoryExplicitRejectsCoarseTimePOWLocationHistogram];
      [v4 appDirectoryExplicitRejectsCoarseTimePOWLocationDecayHalflife];
      objc_msgSend(v84, "decayWithHalfLifeInDays:");

      [v4 launchSequenceDecayHalflife];
      objc_msgSend(v108, "decayAllLaunchSequencesWithHalfLifeInDays:");
      [v4 appActionLaunchSequenceDecayHalflife];
      objc_msgSend(v108, "decayAllAppActionLaunchSequencesWithHalfLifeInDays:");
      v85 = [(ATXPredictionDataHistograms *)v24 appIntentLaunchHistogram];
      [v4 appActionLaunchDecayHalflife];
      objc_msgSend(v85, "decayWithHalfLifeInDays:");

      v86 = [(ATXPredictionDataHistograms *)v24 appIntentAirplaneModeLaunchHistogram];
      [v4 appActionAirplaneModeLaunchDecayHalflife];
      objc_msgSend(v86, "decayWithHalfLifeInDays:");

      v87 = [(ATXPredictionDataHistograms *)v24 appIntentTrendingLaunchHistogram];
      [v4 appActionTrendingLaunchDecayHalflife];
      objc_msgSend(v87, "decayWithHalfLifeInDays:");

      v88 = [(ATXPredictionDataHistograms *)v24 appIntentWifiHistogram];
      [v4 appActionWifiSSIDLaunchDecayHalflife];
      objc_msgSend(v88, "decayWithHalfLifeInDays:");

      v89 = [(ATXPredictionDataHistograms *)v24 appIntentCoreMotionLaunchHistogram];
      [v4 appActionCoreMotionLaunchDecayHalflife];
      objc_msgSend(v89, "decayWithHalfLifeInDays:");

      v90 = [(ATXPredictionDataHistograms *)v24 appIntentUnlockTimeHistogram];
      [v4 appActionUnlockTimeDecayHalflife];
      objc_msgSend(v90, "decayWithHalfLifeInDays:");

      v91 = [(ATXPredictionDataHistograms *)v24 appIntentDayOfWeekHistogram];
      [v4 appActionDayOfWeekLaunchDecayHalflife];
      objc_msgSend(v91, "decayWithHalfLifeInDays:");

      v92 = [(ATXPredictionDataHistograms *)v24 appForAllIntentsLaunchHistogram];
      [v4 appActionLaunchDecayHalflife];
      objc_msgSend(v92, "decayWithHalfLifeInDays:");

      v93 = [(ATXPredictionDataHistograms *)v24 appForAllIntentsAirplaneModeLaunchHistogram];
      [v4 appActionAirplaneModeLaunchDecayHalflife];
      objc_msgSend(v93, "decayWithHalfLifeInDays:");

      v94 = [(ATXPredictionDataHistograms *)v24 appForAllIntentsTrendingLaunchHistogram];
      [v4 appActionTrendingLaunchDecayHalflife];
      objc_msgSend(v94, "decayWithHalfLifeInDays:");

      v95 = [(ATXPredictionDataHistograms *)v24 appForAllIntentsWifiHistogram];
      [v4 appActionWifiSSIDLaunchDecayHalflife];
      objc_msgSend(v95, "decayWithHalfLifeInDays:");

      v96 = [(ATXPredictionDataHistograms *)v24 appForAllIntentsUnlockTimeHistogram];
      [v4 appActionUnlockTimeDecayHalflife];
      objc_msgSend(v96, "decayWithHalfLifeInDays:");

      v97 = [(ATXPredictionDataHistograms *)v24 appForAllIntentsDayOfWeekHistogram];
      [v4 appActionDayOfWeekLaunchDecayHalflife];
      objc_msgSend(v97, "decayWithHalfLifeInDays:");

      v98 = [(ATXPredictionDataHistograms *)v24 appForAllIntentsCoreMotionLaunchHistogram];
      [v4 appActionCoreMotionLaunchDecayHalflife];
      objc_msgSend(v98, "decayWithHalfLifeInDays:");

      v99 = [(ATXPredictionDataHistograms *)v24 poiCategoryHistogram];
      [v4 poiCategoryDecayHalfLife];
      objc_msgSend(v99, "decayWithHalfLifeInDays:");

      v100 = __atxlog_handle_default();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG)) {
        __38___ATXAppPredictor_trainWithActivity___block_invoke_cold_2();
      }

      v101 = +[_ATXFeedback sharedInstance];
      [v101 decayCounts];

      v102 = +[ATXActionFeedback sharedInstance];
      [v102 decayCounts];

      if ([*(id *)(a1 + 40) didDefer])
      {
        uint64_t v25 = __atxlog_handle_default();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v26 = "App prediction training deferring after decaying histograms and feedback";
          goto LABEL_50;
        }
      }
      else
      {
        [(ATXPredictionDataHistograms *)v24 removeExpiredData];
        if ([*(id *)(a1 + 40) didDefer])
        {
          uint64_t v25 = __atxlog_handle_default();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v26 = "App prediction training deferring after removing expired data";
            goto LABEL_50;
          }
        }
        else
        {
          v103 = [*(id *)(*(void *)(a1 + 32) + 176) allApps];
          [v3 trimActionHistoryWithAppWhitelist:v103];

          v104 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", (double)(int)objc_msgSend(v4, "messageContentTimeElapsed"));
          [v3 pruneMessageRecipientsAddedBefore:v104];

          v105 = __atxlog_handle_default();
          v106 = v105;
          if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v105))
          {
            *(_DWORD *)buf = 136446210;
            v110 = "TOP_LEVEL";
            _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v106, OS_SIGNPOST_INTERVAL_END, v7, "Train", "Component=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);
          }

          if (![*(id *)(a1 + 40) setDone])
          {
            uint64_t v25 = __atxlog_handle_default();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              __38___ATXAppPredictor_trainWithActivity___block_invoke_cold_1();
            }
            goto LABEL_51;
          }
          uint64_t v25 = __atxlog_handle_default();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v26 = "App prediction training activity successfully set to DONE";
            goto LABEL_50;
          }
        }
      }
    }
LABEL_51:

    goto LABEL_30;
  }
  uint64_t v16 = __atxlog_handle_default();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    uint64_t v17 = "App prediction training deferring after app launch location training";
    goto LABEL_29;
  }
LABEL_30:
}

void __52___ATXAppPredictor__initAppLaunchAndInstallMonitors__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "App intent monitor started", v2, v3, v4, v5, v6);
}

void __52___ATXAppPredictor__initAppLaunchAndInstallMonitors__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "App launch monitor started", v2, v3, v4, v5, v6);
}

void __38___ATXAppPredictor_trainWithActivity___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "App prediction training activity could not be set to DONE", v1, 2u);
}

void __38___ATXAppPredictor_trainWithActivity___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Decaying feedback", v2, v3, v4, v5, v6);
}

void __38___ATXAppPredictor_trainWithActivity___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Decaying histograms and verifying data integrity", v2, v3, v4, v5, v6);
}

void __38___ATXAppPredictor_trainWithActivity___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Training app launch location, microlocation, daily dose, app info manager", v2, v3, v4, v5, v6);
}

void __38___ATXAppPredictor_trainWithActivity___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Updating install date manager", v2, v3, v4, v5, v6);
}

@end