@interface ATXActionPredictions
+ (BOOL)actionScoreAboveThresholdOrWhitelistedAction:(id)a3 confidenceThreshold:(double)a4 actionKeyWhitelist:(id)a5 actionTypeWhitelist:(id)a6;
+ (BOOL)isActionPredictionContainerEligibleForLimit:(id)a3;
+ (id)_actionPredictionCandidatesForCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 firstStageScoreLogger:(id)a5 secondStageScoreLogger:(id)a6 multiStageScoreLogger:(id)a7 context:(id)a8 featureCache:(id)a9 remainingPredictionItems:(void *)a10;
+ (id)_actionPredictionCandidatesForCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 firstStageScoreLogger:(id)a5 secondStageScoreLogger:(id)a6 multiStageScoreLogger:(id)a7 featureCache:(id)a8 remainingPredictionItems:(void *)a9;
+ (id)_predictionsForConsumerSubType:(unsigned __int8)a3 thirdStageScoreLogger:(id)a4 multiStageScoreLogger:(id)a5 actionPredictionCandidates:(id)a6 remainingPredictionItems:(void *)a7 predictionsPerAppActionLimit:(id)a8;
+ (id)_predictionsForConsumerSubType:(unsigned __int8)a3 thirdStageScoreLogger:(id)a4 multiStageScoreLogger:(id)a5 context:(id)a6 actionPredictionCandidates:(id)a7 remainingPredictionItems:(void *)a8 predictionsPerAppActionLimit:(id)a9;
+ (id)actionResultsForCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 consumerSubType:(unsigned __int8)a5 firstStageScoreLogger:(id)a6 secondStageScoreLogger:(id)a7 thirdStageScoreLogger:(id)a8 multiStageScoreLogger:(id)a9 predictionsPerAppActionLimit:(id)a10;
+ (id)actionsFromActions:(id)a3 byMovingActionsWithBundleIdentifiers:(id)a4 toRemainingPredictionItems:(void *)a5;
+ (id)filterHighQualityActionResults:(id)a3 consumerSubType:(unsigned __int8)a4;
+ (id)predictionsWithCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 consumerSubType:(unsigned __int8)a5 firstStageScoreLogger:(id)a6 secondStageScoreLogger:(id)a7 thirdStageScoreLogger:(id)a8 multiStageScoreLogger:(id)a9;
+ (id)removeActionsBelowThresholdForActionPredictions:(id)a3 withThreshold:(double)a4 actionKeyWhitelist:(id)a5 actionTypeWhitelist:(id)a6;
+ (id)scoredActionsWithoutLog:(id)a3;
+ (id)sortStageScores:(id)a3;
+ (unint64_t)numActionResultsWithOnlyPredictionItemForLogging:(id)a3;
+ (void)fetchDataAndUpdateContentAttributeSetForActions:(id)a3;
+ (void)penalizeMultipleActionsPerAppAndKeepSorted:(id)a3;
+ (void)setTVActionPredictionsConfidenceToLow:(id)a3;
@end

@implementation ATXActionPredictions

+ (BOOL)isActionPredictionContainerEligibleForLimit:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F4B2B8];
  v4 = [a3 scoredAction];
  v5 = [v4 predictedItem];
  LOBYTE(v3) = [v3 isActionEligibleForSettingsSuggestions:v5];

  return v3 ^ 1;
}

+ (id)actionResultsForCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 consumerSubType:(unsigned __int8)a5 firstStageScoreLogger:(id)a6 secondStageScoreLogger:(id)a7 thirdStageScoreLogger:(id)a8 multiStageScoreLogger:(id)a9 predictionsPerAppActionLimit:(id)a10
{
  uint64_t v12 = a5;
  id v16 = a8;
  id v17 = a9;
  id v18 = a10;
  memset(v22, 0, sizeof(v22));
  v19 = [a1 _actionPredictionCandidatesForCandidateBundleIdentifiers:a3 candidateActiontypes:a4 firstStageScoreLogger:a6 secondStageScoreLogger:a7 multiStageScoreLogger:v17 featureCache:0 remainingPredictionItems:v22];
  v20 = +[ATXActionPredictions _predictionsForConsumerSubType:v12 thirdStageScoreLogger:v16 multiStageScoreLogger:v17 actionPredictionCandidates:v19 remainingPredictionItems:v22 predictionsPerAppActionLimit:v18];

  v23 = (void **)v22;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100](&v23);

  return v20;
}

+ (id)predictionsWithCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 consumerSubType:(unsigned __int8)a5 firstStageScoreLogger:(id)a6 secondStageScoreLogger:(id)a7 thirdStageScoreLogger:(id)a8 multiStageScoreLogger:(id)a9
{
  uint64_t v9 = a5;
  v10 = [a1 actionResultsForCandidateBundleIdentifiers:a3 candidateActiontypes:a4 consumerSubType:a5 firstStageScoreLogger:a6 secondStageScoreLogger:a7 thirdStageScoreLogger:a8 multiStageScoreLogger:a9 predictionsPerAppActionLimit:0];
  v11 = +[ATXDisplayCacheIntermediateFormat fromActions:v10];
  uint64_t v12 = v11;
  if (v11)
  {
    v13 = [v11 actions];
    if (v9 == 22)
    {
      v14 = [v12 lockscreenPredictionIndices];
      uint64_t v15 = [v13 objectsAtIndexes:v14];

      v13 = (void *)v15;
    }
    id v16 = [v12 predictionChunks];
    id v17 = ATXCacheFileJoinChunks();

    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F4AE60]) initWithScoredActions:v13 cacheFileData:v17 consumerSubType:v9 error:0];
    v19 = 0;
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ActionPredictions" code:1001 userInfo:0];
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F4AE60]) initWithScoredActions:0 cacheFileData:0 consumerSubType:v9 error:v20];
    v19 = (void *)v20;
  }
  v21 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v18 second:v19];

  return v21;
}

+ (id)_actionPredictionCandidatesForCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 firstStageScoreLogger:(id)a5 secondStageScoreLogger:(id)a6 multiStageScoreLogger:(id)a7 featureCache:(id)a8 remainingPredictionItems:(void *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v21 = +[_ATXAppPredictor sharedInstance];
  v22 = [v21 appLaunchMonitor];

  if (v22)
  {
    v23 = +[ATXPredictionContextBuilder sharedInstance];
    v24 = [v23 predictionContextForCurrentContext];

    if (!v24)
    {
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2, a1, @"ATXActionPredictions.mm", 137, @"Invalid parameter not satisfying: %@", @"predictionContext" object file lineNumber description];
    }
    v25 = [a1 _actionPredictionCandidatesForCandidateBundleIdentifiers:v15 candidateActiontypes:v16 firstStageScoreLogger:v17 secondStageScoreLogger:v18 multiStageScoreLogger:v19 context:v24 featureCache:v20 remainingPredictionItems:a9];
  }
  else
  {
    v25 = objc_opt_new();
  }

  return v25;
}

+ (id)_predictionsForConsumerSubType:(unsigned __int8)a3 thirdStageScoreLogger:(id)a4 multiStageScoreLogger:(id)a5 actionPredictionCandidates:(id)a6 remainingPredictionItems:(void *)a7 predictionsPerAppActionLimit:(id)a8
{
  uint64_t v12 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = +[ATXPredictionContextBuilder sharedInstance];
  id v20 = [v19 predictionContextForCurrentContext];

  if (!v20)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"ATXActionPredictions.mm", 156, @"Invalid parameter not satisfying: %@", @"predictionContext" object file lineNumber description];
  }
  v21 = [a1 _predictionsForConsumerSubType:v12 thirdStageScoreLogger:v15 multiStageScoreLogger:v16 context:v20 actionPredictionCandidates:v17 remainingPredictionItems:a7 predictionsPerAppActionLimit:v18];

  return v21;
}

+ (id)_actionPredictionCandidatesForCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 firstStageScoreLogger:(id)a5 secondStageScoreLogger:(id)a6 multiStageScoreLogger:(id)a7 context:(id)a8 featureCache:(id)a9 remainingPredictionItems:(void *)a10
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v73 = a3;
  id v74 = a4;
  id v78 = a5;
  id v83 = a6;
  id v84 = a7;
  id v86 = a8;
  id v75 = a9;
  v80 = objc_opt_new();
  v72 = (void *)MEMORY[0x1D25F6CC0]();
  v76 = +[_ATXAppPredictor sharedInstance];
  v82 = +[_ATXGlobals sharedInstance];
  id v15 = objc_msgSend(v76, "predictWithLimit:consumerSubType:intent:candidateBundleIdentifiers:candidateActiontypes:scoreLogger:predictionItemsToKeep:predictedItemsOutParameter:context:featureCache:", (int)objc_msgSend(v82, "actionPredictionFirstStageBeamWidth"), 24, 0, v73, v74, v78, a10, 0, v86, v75);
  if (v78)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
      v99[0] = MEMORY[0x1E4F143A8];
      v99[1] = 3221225472;
      v99[2] = __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke;
      v99[3] = &unk_1E68AF850;
      id v17 = v16;
      v100 = v17;
      [v78 flushWithCompletion:v99];
      [MEMORY[0x1E4F93B18] waitForSemaphore:v17 timeoutSeconds:&__block_literal_global_129 onAcquire:&__block_literal_global_43_0 onTimeout:5.0];
    }
  }
  if (v15 && ([v15 predictionSetChunk], (id v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v71 = v15;
    id v19 = [v15 feedbackStateChunk];
    BOOL v20 = v19 == 0;

    if (v20)
    {
      v54 = v80;
    }
    else
    {
      v21 = __atxlog_handle_default();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        +[ATXActionPredictions _actionPredictionCandidatesForCandidateBundleIdentifiers:candidateActiontypes:firstStageScoreLogger:secondStageScoreLogger:multiStageScoreLogger:context:featureCache:remainingPredictionItems:]();
      }

      v22 = (void *)MEMORY[0x1E4F4B290];
      v23 = [v71 predictionSetChunk];
      v70 = [v22 bundleIdReader:v23];

      v88 = [v70 readScoredPredictionsWithLimit:0x7FFFFFFFLL];
      v24 = [v71 feedbackStateChunk];
      +[ATXActionCacheReader getActionKeyToPredictionItemMapFromChunk:v24];

      v77 = objc_opt_new();
      v25 = objc_opt_new();
      v26 = __atxlog_handle_default();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        uint64_t v29 = [v88 count];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v28;
        __int16 v103 = 2050;
        uint64_t v104 = v29;
        _os_log_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ - Stage 1 Action Predictions returned num candidates: %{public}lu", buf, 0x16u);
      }
      +[ATXActionPredictionsHelpers applyLogSoftmaxToPredictions:v88];
      v85 = objc_opt_new();
      v81 = objc_opt_new();
      unint64_t v91 = 0;
      uint64_t v79 = arc4random_uniform([v88 count]);
      while ([v88 count] > v91)
      {
        context = (void *)MEMORY[0x1D25F6CC0]();
        v90 = [v88 objectAtIndexedSubscript:v91];
        *(void *)buf = [v90 predictedItem];
        v30 = std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::find<NSString * {__strong}>(v98, (id *)buf);
        if (v30)
        {
          v89 = [v85 statisticsForActionKey:*(void *)buf context:v86];
          uint64_t v31 = *(void *)buf;
          [v90 score];
          float v33 = v32;
          [v82 predictionsForMultiStageLoggingLimit];
          double v35 = v34;
          v36 = [v86 timeContext];
          v37 = [v36 date];
          if (v91 == v79) {
            [v85 actionPredictionsForActionKey:v31 statistics:v89 appActionPredictionItem:v30 + 3 appActionLogProbability:v83 scoreLogger:(int)v35 andLimit:0 forMagicalMoments:v33 predictionItemsToKeep:a10 currentDate:v37];
          }
          else {
          v38 = [v85 actionPredictionsForActionKey:v31 statistics:v89 appActionPredictionItem:v30 + 3 appActionLogProbability:v83 scoreLogger:(int)v35 andLimit:0 forMagicalMoments:v33 currentDate:v37];
          }

          [v81 updateActionStatisticsForSlotResolutionStatistics:v89 candidateActionPredictions:v38];
          if (v84)
          {
            v39 = NSNumber;
            [v90 score];
            v40 = objc_msgSend(v39, "numberWithFloat:");
            v41 = NSString;
            uint64_t v42 = *(void *)buf;
            [v90 score];
            v44 = [v41 stringWithFormat:@"%@:%f", v42, v43];
            [v77 setObject:v40 forKeyedSubscript:v44];

            long long v96 = 0u;
            long long v97 = 0u;
            long long v94 = 0u;
            long long v95 = 0u;
            id v45 = v38;
            uint64_t v46 = [v45 countByEnumeratingWithState:&v94 objects:v101 count:16];
            if (v46)
            {
              uint64_t v47 = *(void *)v95;
              do
              {
                for (uint64_t i = 0; i != v46; ++i)
                {
                  if (*(void *)v95 != v47) {
                    objc_enumerationMutation(v45);
                  }
                  v49 = *(void **)(*((void *)&v94 + 1) + 8 * i);
                  v50 = [v49 scoredAction];
                  v51 = [v50 description];

                  v52 = NSNumber;
                  [v49 score];
                  v53 = objc_msgSend(v52, "numberWithFloat:");
                  [v25 setObject:v53 forKeyedSubscript:v51];
                }
                uint64_t v46 = [v45 countByEnumeratingWithState:&v94 objects:v101 count:16];
              }
              while (v46);
            }
          }
          if ([v38 count]) {
            [v80 addObjectsFromArray:v38];
          }
        }
        ++v91;
      }
      v55 = __atxlog_handle_default();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = (objc_class *)objc_opt_class();
        v57 = NSStringFromClass(v56);
        uint64_t v58 = [v80 count];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v57;
        __int16 v103 = 2050;
        uint64_t v104 = v58;
        _os_log_impl(&dword_1D0FA3000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@ - Stage 2 Action Predictions returned num candidates from slot exploration: %{public}lu", buf, 0x16u);
      }
      v59 = +[ATXActionPredictionsProcessor removeAlarmActionsInconsistentWithAlarmAppState:v80];
      v54 = (void *)[v59 mutableCopy];

      v60 = objc_opt_new();
      [v60 setFeatureValuesAndFilterPredictableActions:v54 actionStatistics:v81];
      if (v83)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          dispatch_semaphore_t v61 = dispatch_semaphore_create(0);
          v92[0] = MEMORY[0x1E4F143A8];
          v92[1] = 3221225472;
          v92[2] = __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_54;
          v92[3] = &unk_1E68AF850;
          v62 = v61;
          v93 = v62;
          [v83 flushWithCompletion:v92];
          [MEMORY[0x1E4F93B18] waitForSemaphore:v62 timeoutSeconds:&__block_literal_global_57_0 onAcquire:&__block_literal_global_60_1 onTimeout:5.0];
        }
      }
      if (v84)
      {
        v63 = +[ATXActionPredictions sortStageScores:v77];
        [v84 logStageScores:v63 forStageType:0];

        v64 = +[ATXActionPredictions sortStageScores:v25];
        [v84 logStageScores:v64 forStageType:1];
      }
      v65 = __atxlog_handle_default();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        v66 = (objc_class *)objc_opt_class();
        v67 = NSStringFromClass(v66);
        uint64_t v68 = [v54 count];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v67;
        __int16 v103 = 2050;
        uint64_t v104 = v68;
        _os_log_impl(&dword_1D0FA3000, v65, OS_LOG_TYPE_DEFAULT, "%{public}@ - Stage 2 Action Predictions retained num candidates after post-processing: %{public}lu", buf, 0x16u);
      }
      std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::~__hash_table((uint64_t)v98);
    }
    id v15 = v71;
  }
  else
  {
    v54 = v80;
  }

  return v54;
}

intptr_t __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_2()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_2_cold_1();
  }
}

void __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_41()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_41_cold_1();
  }
}

intptr_t __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_54(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_2_55()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_2_55_cold_1();
  }
}

void __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_58()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_58_cold_1();
  }
}

+ (id)_predictionsForConsumerSubType:(unsigned __int8)a3 thirdStageScoreLogger:(id)a4 multiStageScoreLogger:(id)a5 context:(id)a6 actionPredictionCandidates:(id)a7 remainingPredictionItems:(void *)a8 predictionsPerAppActionLimit:(id)a9
{
  uint64_t v12 = a3;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v58 = a4;
  id v57 = a5;
  id v53 = a6;
  obuint64_t j = a7;
  id v56 = a9;
  context = (void *)MEMORY[0x1D25F6CC0]();
  v13 = objc_opt_new();
  v54 = objc_opt_new();
  [v54 scoreActions:obj scoreLogger:v58 consumerSubType:v12];
  v14 = __atxlog_handle_default();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = (objc_class *)objc_opt_class();
    dispatch_semaphore_t v16 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v16;
    __int16 v74 = 2050;
    uint64_t v75 = [obj count];
    _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - Stage 3 Action Predictions scored num candidates: %{public}lu", buf, 0x16u);
  }
  id v17 = ATXSortAndLimitPredictionsWhileKeepingPredictionItems(obj, v56, (int64x2_t *)a8);

  id obja = v17;
  if (v57)
  {
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v69 objects:v77 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v70 != v20) {
            objc_enumerationMutation(v18);
          }
          v22 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          v23 = [v22 scoredAction];
          v24 = [v23 description];

          v25 = NSNumber;
          [v22 score];
          v26 = objc_msgSend(v25, "numberWithFloat:");
          [v13 setObject:v26 forKeyedSubscript:v24];
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v69 objects:v77 count:16];
      }
      while (v19);
    }
  }
  if (v58)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __188__ATXActionPredictions__predictionsForConsumerSubType_thirdStageScoreLogger_multiStageScoreLogger_context_actionPredictionCandidates_remainingPredictionItems_predictionsPerAppActionLimit___block_invoke;
      v67[3] = &unk_1E68AF850;
      v28 = v27;
      uint64_t v68 = v28;
      [v58 flushWithCompletion:v67];
      [MEMORY[0x1E4F93B18] waitForSemaphore:v28 timeoutSeconds:&__block_literal_global_62 onAcquire:&__block_literal_global_65_3 onTimeout:5.0];
    }
  }
  if (v57)
  {
    uint64_t v29 = +[ATXActionPredictions sortStageScores:v13];
    [v57 logStageScores:v29 forStageType:2];
  }
  +[ATXActionPredictionsHelpers sortPredictions:obja];
  +[ATXActionPredictions penalizeMultipleActionsPerAppAndKeepSorted:obja];
  +[ATXActionPredictions fetchDataAndUpdateContentAttributeSetForActions:obja];
  v30 = +[ATXActionPredictionsProcessor removeDuplicateActionPredictions:obja];
  uint64_t v31 = (void *)[v30 mutableCopy];

  float v32 = +[ATXActionPredictionsProcessor removeMissingOrBlockedRecipientPredictions:v31];
  id objc = (id)[v32 mutableCopy];

  float v33 = +[ATXActionPredictionsProcessor removeDuplicateTVActionPredictions:objc];
  double v34 = (void *)[v33 mutableCopy];

  if (v12 != 22) {
    [(id)objc_opt_class() setTVActionPredictionsConfidenceToLow:v34];
  }
  double v35 = objc_opt_new();
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id objb = v34;
  uint64_t v36 = [objb countByEnumeratingWithState:&v63 objects:v76 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v64;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v64 != v37) {
          objc_enumerationMutation(objb);
        }
        v39 = *(void **)(*((void *)&v63 + 1) + 8 * j);
        if (v39) {
          [*(id *)(*((void *)&v63 + 1) + 8 * j) predictionItem];
        }
        else {
          bzero(buf, 0xCE0uLL);
        }
        v40 = [ATXActionResult alloc];
        v41 = [v39 scoredAction];
        uint64_t v42 = [v39 actionKey];
        float v43 = [(ATXActionResult *)v40 initWithScoredAction:v41 predictionItem:buf actionKey:v42];

        [v35 addObject:v43];
      }
      uint64_t v36 = [objb countByEnumeratingWithState:&v63 objects:v76 count:16];
    }
    while (v36);
  }

  uint64_t v45 = *(void *)a8;
  uint64_t v44 = *((void *)a8 + 1);
  if (*(void *)a8 != v44)
  {
    do
    {
      id v46 = [[ATXActionResult alloc] initForLoggingWithPredictionItem:v45];
      [v35 addObject:v46];

      v45 += 3296;
    }
    while (v45 != v44);
  }
  uint64_t v47 = __atxlog_handle_default();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v48 = (objc_class *)objc_opt_class();
    v49 = NSStringFromClass(v48);
    uint64_t v50 = [v35 count];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v49;
    __int16 v74 = 2050;
    uint64_t v75 = v50;
    _os_log_impl(&dword_1D0FA3000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ - Stage 3 Action Predictions returned num predictions: %{public}lu", buf, 0x16u);
  }

  return v35;
}

intptr_t __188__ATXActionPredictions__predictionsForConsumerSubType_thirdStageScoreLogger_multiStageScoreLogger_context_actionPredictionCandidates_remainingPredictionItems_predictionsPerAppActionLimit___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __188__ATXActionPredictions__predictionsForConsumerSubType_thirdStageScoreLogger_multiStageScoreLogger_context_actionPredictionCandidates_remainingPredictionItems_predictionsPerAppActionLimit___block_invoke_2()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __188__ATXActionPredictions__predictionsForConsumerSubType_thirdStageScoreLogger_multiStageScoreLogger_context_actionPredictionCandidates_remainingPredictionItems_predictionsPerAppActionLimit___block_invoke_2_cold_1();
  }
}

void __188__ATXActionPredictions__predictionsForConsumerSubType_thirdStageScoreLogger_multiStageScoreLogger_context_actionPredictionCandidates_remainingPredictionItems_predictionsPerAppActionLimit___block_invoke_63()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __188__ATXActionPredictions__predictionsForConsumerSubType_thirdStageScoreLogger_multiStageScoreLogger_context_actionPredictionCandidates_remainingPredictionItems_predictionsPerAppActionLimit___block_invoke_63_cold_1();
  }
}

+ (id)actionsFromActions:(id)a3 byMovingActionsWithBundleIdentifiers:(id)a4 toRemainingPredictionItems:(void *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_opt_new();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __107__ATXActionPredictions_actionsFromActions_byMovingActionsWithBundleIdentifiers_toRemainingPredictionItems___block_invoke;
  v16[3] = &unk_1E68B2828;
  id v10 = v8;
  id v17 = v10;
  uint64_t v19 = a5;
  id v11 = v9;
  id v18 = v11;
  [v7 enumerateObjectsUsingBlock:v16];
  uint64_t v12 = [v11 count];
  if (v12 == [v7 count])
  {
    id v13 = v7;
  }
  else
  {
    id v13 = [v7 objectsAtIndexes:v11];
  }
  v14 = v13;

  return v14;
}

void __107__ATXActionPredictions_actionsFromActions_byMovingActionsWithBundleIdentifiers_toRemainingPredictionItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = *(void **)(a1 + 32);
  id v7 = [v5 scoredAction];
  id v8 = [v7 predictedItem];
  uint64_t v9 = [v8 bundleId];
  LODWORD(v6) = [v6 containsObject:v9];

  if (v6)
  {
    id v10 = *(uint64_t **)(a1 + 48);
    if (v10)
    {
      uint64_t v12 = *v10;
      uint64_t v11 = v10[1];
      id v13 = +[_ATXGlobals sharedInstance];
      int v14 = [v13 numberOfActionsToKeepForLogging];

      if (0xDAB7EC1DD3431B57 * ((v11 - v12) >> 5) < v14)
      {
        id v15 = *(char ***)(a1 + 48);
        if (v5) {
          [v5 predictionItem];
        }
        else {
          bzero(&v37, 0xCE0uLL);
        }
        unint64_t v16 = (unint64_t)v15[2];
        id v17 = v15[1];
        if ((unint64_t)v17 >= v16)
        {
          unint64_t v20 = 0xDAB7EC1DD3431B57 * ((v17 - *v15) >> 5);
          if (v20 + 1 > 0x13E22CBCE4A902) {
            std::vector<ATXPredictionItem>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v21 = 0xDAB7EC1DD3431B57 * ((uint64_t)(v16 - (void)*v15) >> 5);
          uint64_t v22 = 2 * v21;
          if (2 * v21 <= v20 + 1) {
            uint64_t v22 = v20 + 1;
          }
          if (v21 >= 0x9F1165E725481) {
            unint64_t v23 = 0x13E22CBCE4A902;
          }
          else {
            unint64_t v23 = v22;
          }
          v39[4] = v15 + 2;
          if (v23)
          {
            v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ATXPredictionItem>>((uint64_t)(v15 + 2), v23);
            uint64_t v26 = v25;
          }
          else
          {
            v24 = 0;
            uint64_t v26 = 0;
          }
          dispatch_semaphore_t v27 = &v24[3296 * v20];
          id v28 = v37;
          id v37 = 0;
          *(void *)dispatch_semaphore_t v27 = v28;
          memcpy(v27 + 8, v38, 0xCD2uLL);
          v30 = *v15;
          uint64_t v29 = v15[1];
          if (v29 == *v15)
          {
            double v35 = v15[1];
            uint64_t v31 = v27;
          }
          else
          {
            uint64_t v31 = v27;
            do
            {
              float v32 = v29 - 3296;
              uint64_t v33 = *((void *)v29 - 412);
              double v34 = v31 - 3288;
              v31 -= 3296;
              *((void *)v29 - 412) = 0;
              *(void *)uint64_t v31 = v33;
              memcpy(v34, v29 - 3288, 0xCD2uLL);
              uint64_t v29 = v32;
            }
            while (v32 != v30);
            double v35 = *v15;
            uint64_t v29 = v15[1];
          }
          uint64_t v19 = v27 + 3296;
          *id v15 = v31;
          v39[0] = v35;
          v39[1] = v35;
          v15[1] = v19;
          v39[2] = v29;
          uint64_t v36 = v15[2];
          v15[2] = &v24[3296 * v26];
          v39[3] = v36;
          std::__split_buffer<ATXPredictionItem>::~__split_buffer((uint64_t)v39);
        }
        else
        {
          id v18 = v37;
          id v37 = 0;
          *(void *)id v17 = v18;
          memcpy(v17 + 8, v38, 0xCD2uLL);
          uint64_t v19 = v17 + 3296;
        }
        v15[1] = v19;
      }
    }
  }
  else
  {
    [*(id *)(a1 + 40) addIndex:a3];
  }
}

+ (void)fetchDataAndUpdateContentAttributeSetForActions:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "scoredAction", (void)v9);
        id v8 = [v7 predictedItem];
        +[_ATXActionUtils fetchDataAndUpdateContentAttributeSetForAction:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

+ (void)setTVActionPredictionsConfidenceToLow:(id)a3
{
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v17 = v3;
  uint64_t v4 = [MEMORY[0x1E4F4AE38] getActionKeyForBundleId:@"com.apple.tv" actionType:@"INPlayMediaIntent"];
  long long v28 = 0u;
  long long v27 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  id v5 = v17;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v10 = [v9 actionKey];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          if (v9)
          {
            [v9 predictionItem];
            id v12 = v22[0];
            id v13 = v22[1];
            int v14 = v24;
          }
          else
          {
            bzero(v22, 0xCE0uLL);
            id v13 = 0;
            id v12 = 0;
            int v14 = 0;
          }
          id v15 = v12;
          memcpy(v29, v23, sizeof(v29));
          id v16 = v15;
          v18[0] = v16;
          v18[1] = v13;
          memcpy(v19, v29, sizeof(v19));
          int v20 = v14;
          __int16 v21 = 0;
          if (v9) {
            [v9 setPredictionItem:v18];
          }
          else {
        }
          }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }
}

+ (id)filterHighQualityActionResults:(id)a3 consumerSubType:(unsigned __int8)a4
{
  int v4 = a4;
  id v5 = a3;
  uint64_t v6 = +[_ATXGlobals sharedInstance];
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__60;
  float v32 = __Block_byref_object_dispose__60;
  id v33 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__ATXActionPredictions_filterHighQualityActionResults_consumerSubType___block_invoke;
  aBlock[3] = &unk_1E68B2870;
  aBlock[4] = &v28;
  uint64_t v7 = (void (**)(void))_Block_copy(aBlock);
  if (v4 == 46)
  {
    uint64_t v16 = objc_msgSend(v5, "_pas_filteredArrayWithTest:", &__block_literal_global_82);
    id v17 = (void *)v29[5];
    v29[5] = v16;

    id v18 = (void *)v29[5];
    unint64_t v19 = [v18 count];
    int v20 = [v6 maxSettingsZKWSuggestionsToBlend];
    if (v19 >= v20) {
      unint64_t v21 = v20;
    }
    else {
      unint64_t v21 = v19;
    }
    uint64_t v22 = objc_msgSend(v18, "subarrayWithRange:", 0, v21);
    long long v10 = (void *)v29[5];
    v29[5] = v22;
    goto LABEL_8;
  }
  if (v4 == 38)
  {
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    long long v9 = [v6 whitelistedActionKeysForHomeScreen];
    long long v10 = [v8 setWithArray:v9];

    int v11 = (void *)MEMORY[0x1E4F1CAD0];
    id v12 = [v6 whitelistedActionTypesForHomeScreen];
    id v13 = [v11 setWithArray:v12];

    [v6 behavioralHomeScreenActionMinimumConfidenceThreshold];
    uint64_t v14 = +[ATXActionPredictions removeActionsBelowThresholdForActionPredictions:withThreshold:actionKeyWhitelist:actionTypeWhitelist:](ATXActionPredictions, "removeActionsBelowThresholdForActionPredictions:withThreshold:actionKeyWhitelist:actionTypeWhitelist:", v5, v10, v13);
    id v15 = (void *)v29[5];
    v29[5] = v14;

    v7[2](v7);
LABEL_8:

    goto LABEL_10;
  }
  [v6 actionExperienceMediumConfidenceThreshold];
  uint64_t v23 = +[ATXActionPredictions removeActionsBelowThresholdForActionPredictions:withThreshold:actionKeyWhitelist:actionTypeWhitelist:](ATXActionPredictions, "removeActionsBelowThresholdForActionPredictions:withThreshold:actionKeyWhitelist:actionTypeWhitelist:", v5, 0, 0);
  int v24 = (void *)v29[5];
  v29[5] = v23;

  v7[2](v7);
LABEL_10:
  id v25 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  return v25;
}

uint64_t __71__ATXActionPredictions_filterHighQualityActionResults_consumerSubType___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "_pas_filteredArrayWithTest:", &__block_literal_global_79);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __71__ATXActionPredictions_filterHighQualityActionResults_consumerSubType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F4B2B8];
  uint64_t v3 = [a2 scoredAction];
  uint64_t v4 = [v3 predictedItem];
  uint64_t v5 = [v2 isActionEligibleForSettingsSuggestions:v4] ^ 1;

  return v5;
}

uint64_t __71__ATXActionPredictions_filterHighQualityActionResults_consumerSubType___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F4B2B8];
  uint64_t v3 = [a2 scoredAction];
  uint64_t v4 = [v3 predictedItem];
  uint64_t v5 = [v2 isActionEligibleForSettingsSuggestions:v4];

  return v5;
}

+ (id)removeActionsBelowThresholdForActionPredictions:(id)a3 withThreshold:(double)a4 actionKeyWhitelist:(id)a5 actionTypeWhitelist:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v9 = a5;
  id v10 = a6;
  id v25 = (id)objc_opt_new();
  unint64_t v11 = [(id)objc_opt_class() numActionResultsWithOnlyPredictionItemForLogging:v23];
  if ([v23 count])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obuint64_t j = v23;
    uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if (+[ATXActionPredictions actionScoreAboveThresholdOrWhitelistedAction:v15 confidenceThreshold:v9 actionKeyWhitelist:v10 actionTypeWhitelist:a4])
          {
            [v25 addObject:v15];
          }
          else
          {
            uint64_t v16 = +[_ATXGlobals sharedInstance];
            BOOL v17 = v11 < (int)[v16 numberOfActionsToKeepForLogging];

            if (v17)
            {
              id v18 = -[ATXActionResult initForLoggingWithPredictionItem:]([ATXActionResult alloc], "initForLoggingWithPredictionItem:", [v15 predictionItem]);
              [v25 addObject:v18];

              ++v11;
            }
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
      }
      while (v12);
    }
  }
  unint64_t v19 = __atxlog_handle_default();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = [v25 count];
    uint64_t v21 = [v23 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v31 = v20;
    __int16 v32 = 2048;
    double v33 = a4;
    __int16 v34 = 2048;
    uint64_t v35 = v21;
    _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_INFO, "Filtered %tu predictions with score above %0.2f threshold, out of %tu.", buf, 0x20u);
  }

  return v25;
}

+ (unint64_t)numActionResultsWithOnlyPredictionItemForLogging:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a3;
  unint64_t v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "scoredAction", (void)v13);
        if (!v9)
        {
          id v10 = [v8 actionKey];
          unsigned int v11 = [v10 isEqualToString:@"predictionItem"];

          v4 += v11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v4;
}

+ (BOOL)actionScoreAboveThresholdOrWhitelistedAction:(id)a3 confidenceThreshold:(double)a4 actionKeyWhitelist:(id)a5 actionTypeWhitelist:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [v9 scoredAction];

  if (v12)
  {
    long long v13 = [v9 scoredAction];
    [v13 score];
    double v15 = v14;

    if (v15 >= a4)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      long long v16 = [v9 scoredAction];
      BOOL v17 = [v16 predictedItem];
      uint64_t v18 = [v17 intent];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_7;
      }
      uint64_t v20 = [v9 scoredAction];
      uint64_t v21 = [v20 predictedItem];
      uint64_t v22 = [(id)v21 intent];

      id v23 = [v22 _nonNilParameters];
      LOBYTE(v21) = [v23 containsObject:@"content"];

      if (v21)
      {
        LOBYTE(v12) = 0;
      }
      else
      {
LABEL_7:
        int v24 = [v9 actionKey];
        id v25 = +[_ATXActionUtils getActionTypeFromActionKey:v24];
        if ([v10 containsObject:v24]) {
          LOBYTE(v12) = 1;
        }
        else {
          LOBYTE(v12) = [v11 containsObject:v25];
        }
      }
    }
  }

  return (char)v12;
}

+ (id)scoredActionsWithoutLog:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "scoredAction", (void)v13);
        id v11 = (void *)[v10 copy];

        [v9 score];
        objc_msgSend(v11, "setScore:");
        [v4 addObject:v11];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (void)penalizeMultipleActionsPerAppAndKeepSorted:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v23 = +[_ATXGlobals sharedInstance];
  id v3 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = v22;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v9 = (void *)MEMORY[0x1E4F4B2B8];
        id v10 = [v8 scoredAction];
        id v11 = [v10 predictedItem];
        LOBYTE(v9) = [v9 isActionEligibleForSettingsSuggestions:v11];

        if ((v9 & 1) == 0)
        {
          uint64_t v12 = [v8 scoredAction];
          long long v13 = [v12 predictedItem];
          long long v14 = [v13 bundleId];

          long long v15 = [v3 objectForKeyedSubscript:v14];
          uint64_t v16 = [v15 integerValue];

          BOOL v17 = [NSNumber numberWithInteger:v16 + 1];
          [v3 setObject:v17 forKeyedSubscript:v14];

          if (v16 >= 1)
          {
            [v23 penaltyForMultipleActionsPerApp];
            double v19 = v18;
            [v8 score];
            double v21 = v19 + v20;
            *(float *)&double v21 = v21;
            [v8 setScore:v21];
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v5);
  }

  +[ATXActionPredictionsHelpers sortPredictions:v4];
}

+ (id)sortStageScores:(id)a3
{
  id v3 = [a3 keysSortedByValueUsingComparator:&__block_literal_global_92];
  return v3;
}

uint64_t __40__ATXActionPredictions_sortStageScores___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 doubleValue];
  double v7 = v6;
  [v5 doubleValue];
  if (v7 <= v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v7 < v8) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v9;
  }

  return v10;
}

+ (void)_actionPredictionCandidatesForCandidateBundleIdentifiers:candidateActiontypes:firstStageScoreLogger:secondStageScoreLogger:multiStageScoreLogger:context:featureCache:remainingPredictionItems:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Querying for action predictions.", v2, v3, v4, v5, v6);
}

void __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Slot  Resolution Score Logging - Stage One Succeeded", v2, v3, v4, v5, v6);
}

void __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_41_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Slot Resolution Score Logging - Stage One Timed Out", v2, v3, v4, v5, v6);
}

void __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_2_55_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Slot Resolution Score Logging - Stage Two Succeeded", v2, v3, v4, v5, v6);
}

void __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_58_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Slot Resolution Score Logging - Stage Two Timed Out", v2, v3, v4, v5, v6);
}

void __188__ATXActionPredictions__predictionsForConsumerSubType_thirdStageScoreLogger_multiStageScoreLogger_context_actionPredictionCandidates_remainingPredictionItems_predictionsPerAppActionLimit___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Slot Resolution Score Logging - Stage Three Succeeded", v2, v3, v4, v5, v6);
}

void __188__ATXActionPredictions__predictionsForConsumerSubType_thirdStageScoreLogger_multiStageScoreLogger_context_actionPredictionCandidates_remainingPredictionItems_predictionsPerAppActionLimit___block_invoke_63_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Slot Resolution Score Logging - Stage Three Timed Out", v2, v3, v4, v5, v6);
}

@end