@interface ATXMediaActionPrediction
+ (BOOL)upcomingMediaPreferenceForINPlayMediaIntent:(id)a3;
+ (BOOL)upcomingMediaPreferenceForINPlayMediaIntent:(id)a3 withINUpcomingMediaManagerReturnValueForTests:(id)a4;
+ (id)findTopRankedINPlayMediaIntentFromArray:(id)a3;
+ (id)resolveBucketLevelPrediction:(id)a3 withUpcomingMedia:(id)a4;
+ (id)resolveContainerLevelPrediction:(id)a3 withUpcomingMedia:(id)a4;
+ (id)resolveItemLevelPrediction:(id)a3 withUpcomingMedia:(id)a4;
+ (id)resolvePlayMediaIntent:(id)a3 withUpcomingMedia:(id)a4;
+ (id)updatePlayMediaActionPredictions:(id)a3 withUpcomingMedia:(id)a4 forActionKey:(id)a5 appActionPredictionItem:(const ATXPredictionItem *)a6 appActionLogProbability:(double)a7 statistics:(id)a8;
+ (id)updatedPlayMediaAction:(id)a3;
+ (id)updatedPlayMediaAction:(id)a3 withUpcomingMedia:(id)a4;
@end

@implementation ATXMediaActionPrediction

+ (id)updatedPlayMediaAction:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F4AF00];
  v5 = [v3 bundleId];
  uint64_t v6 = [v4 isSystemAppForBundleId:v5];

  v7 = (void *)MEMORY[0x1E4F4B390];
  v8 = [v3 bundleId];
  v9 = [v7 getUpcomingMediaForBundle:v8 isInternalApplication:v6];

  v10 = [(id)objc_opt_class() updatedPlayMediaAction:v3 withUpcomingMedia:v9];

  return v10;
}

+ (id)updatedPlayMediaAction:(id)a3 withUpcomingMedia:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F4B2B0]) initWithPredictedItem:v5 score:0.0];
    v8 = [ATXActionPredictionContainer alloc];
    v9 = [v5 slotSet];
    v10 = [v5 actionKey];
    v11 = [(ATXActionPredictionContainer *)v8 initWithScoredAction:v7 slotSet:v9 actionKey:v10];

    v19[0] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v13 = [v5 actionKey];
    v14 = +[ATXMediaActionPrediction updatePlayMediaActionPredictions:v12 withUpcomingMedia:v6 forActionKey:v13 appActionPredictionItem:0 appActionLogProbability:0 statistics:0.0];

    if ([v14 count])
    {
      v15 = [v14 objectAtIndexedSubscript:0];
      v16 = [v15 scoredAction];
      v17 = [v16 predictedItem];
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)updatePlayMediaActionPredictions:(id)a3 withUpcomingMedia:(id)a4 forActionKey:(id)a5 appActionPredictionItem:(const ATXPredictionItem *)a6 appActionLogProbability:(double)a7 statistics:(id)a8
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v72 = a3;
  id v77 = a4;
  id v13 = a5;
  v75 = (id *)a8;
  v73 = v13;
  v74 = objc_opt_new();
  v81 = +[_ATXActionUtils getBundleIdFromActionKey:v13];
  if ([v72 count])
  {
    long long v86 = 0u;
    long long v85 = 0u;
    long long v84 = 0u;
    long long v83 = 0u;
    id obj = v72;
    uint64_t v14 = [obj countByEnumeratingWithState:&v83 objects:v93 count:16];
    if (!v14) {
      goto LABEL_39;
    }
    uint64_t v79 = *(void *)v84;
    while (1)
    {
      uint64_t v80 = v14;
      for (uint64_t i = 0; i != v80; ++i)
      {
        if (*(void *)v84 != v79) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        v17 = [v16 scoredAction];
        v18 = [v17 predictedItem];
        v19 = [v18 bundleId];
        char v20 = [v81 isEqualToString:v19];

        if (v20)
        {
          v21 = [v16 scoredAction];
          v22 = [v21 predictedItem];
          v23 = [v22 intent];
          v24 = [a1 resolvePlayMediaIntent:v23 withUpcomingMedia:v77];

          if (!v24) {
            goto LABEL_30;
          }
          v25 = [v24 first];
          v26 = [v24 second];
          char v27 = [v26 BOOLValue];

          if (v25)
          {
            if (v27)
            {
              v28 = __atxlog_handle_default();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v88 = v81;
                _os_log_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_INFO, "Media prediction for bundle %@ did use upcoming media. Creating new prediction, and setting isFutureMedia flag.", buf, 0xCu);
              }

              [v25 _setLaunchId:v81];
              id v29 = objc_alloc(MEMORY[0x1E4F4AE38]);
              v30 = [MEMORY[0x1E4F29128] UUID];
              LOBYTE(v71) = 1;
              v31 = (void *)[v29 initWithIntent:v25 actionUUID:v30 bundleId:v81 heuristic:0 heuristicMetadata:0 criteria:0 isFutureMedia:v71 title:0 subtitle:0];

              v32 = [ATXMinimalSlotResolutionParameters alloc];
              v33 = [v16 scoredAction];
              v34 = [v33 predictedItem];
              v35 = [v16 slotSet];
              v36 = [(ATXMinimalSlotResolutionParameters *)v32 initWithAction:v34 slots:v35];

              v37 = [ATXMinimalSlotResolutionParameters alloc];
              v38 = [v16 slotSet];
              v39 = [(ATXMinimalSlotResolutionParameters *)v37 initWithAction:v31 slots:v38];

              char v40 = [(ATXMinimalSlotResolutionParameters *)v36 isEqual:v39];
              if (v75) {
                char v41 = v40;
              }
              else {
                char v41 = 1;
              }
              if ((v41 & 1) == 0)
              {
                v42 = [v75[2] objectForKeyedSubscript:v36];
                [v75[2] setObject:v42 forKeyedSubscript:v39];

                [v75[2] removeObjectForKey:v36];
              }
              id v43 = objc_alloc(MEMORY[0x1E4F4B2B0]);
              [v16 score];
              v44 = objc_msgSend(v43, "initWithPredictedItem:score:", v31);
              v45 = [ATXActionPredictionContainer alloc];
              v46 = [v16 slotSet];
              v47 = [(ATXActionPredictionContainer *)v45 initWithScoredAction:v44 slotSet:v46 actionKey:v73];

              if (v16)
              {
                [v16 predictionItem];
                if (v47) {
                  goto LABEL_20;
                }
LABEL_27:
              }
              else
              {
                bzero(v82, 0xCE0uLL);
                if (!v47) {
                  goto LABEL_27;
                }
LABEL_20:
                [(ATXActionPredictionContainer *)v47 setPredictionItem:v82];
              }
              [v74 addObject:v47];
            }
            else
            {
              v51 = __atxlog_handle_default();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v88 = v81;
                _os_log_impl(&dword_1D0FA3000, v51, OS_LOG_TYPE_INFO, "Media prediction for bundle %@ did not need to use upcoming media. Returning original prediction.", buf, 0xCu);
              }

              [v74 addObject:v16];
            }
          }

          goto LABEL_30;
        }
        v24 = __atxlog_handle_default();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          v48 = [v16 scoredAction];
          v49 = [v48 predictedItem];
          v50 = [v49 bundleId];
          *(_DWORD *)buf = 138412802;
          v88 = v81;
          __int16 v89 = 2112;
          v90 = v73;
          __int16 v91 = 2112;
          v92 = v50;
          _os_log_fault_impl(&dword_1D0FA3000, v24, OS_LOG_TYPE_FAULT, "ERROR: bundleId extracted from actionKey (bundleId: %@, actionKey: %@) does not equal to bundleId in ATXActionPredictionContainer (bundleId in prediction: %@).", buf, 0x20u);
        }
LABEL_30:
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v83 objects:v93 count:16];
      if (!v14) {
        goto LABEL_39;
      }
    }
  }
  v52 = [a1 resolvePlayMediaIntent:0 withUpcomingMedia:v77];
  v53 = v52;
  if (!v52) {
    goto LABEL_41;
  }
  id obj = v52;
  v54 = [v52 first];
  v55 = [v53 second];
  char v56 = [v55 BOOLValue];

  if (v54)
  {
    v57 = __atxlog_handle_default();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v88 = v81;
      _os_log_impl(&dword_1D0FA3000, v57, OS_LOG_TYPE_INFO, "There were originally no media predictions returned for bundle %@. Used upcoming media to generate a prediction.", buf, 0xCu);
    }

    [v54 _setLaunchId:v81];
    id v58 = objc_alloc(MEMORY[0x1E4F4AE38]);
    v59 = [MEMORY[0x1E4F29128] UUID];
    LOBYTE(v71) = v56;
    v60 = (void *)[v58 initWithIntent:v54 actionUUID:v59 bundleId:v81 heuristic:0 heuristicMetadata:0 criteria:0 isFutureMedia:v71 title:0 subtitle:0];

    id v61 = objc_alloc(MEMORY[0x1E4F4B2B0]);
    LODWORD(v62) = 1.0;
    v63 = (void *)[v61 initWithPredictedItem:v60 score:v62];
    v64 = [ATXActionPredictionContainer alloc];
    v65 = [v60 slotSet];
    v66 = [(ATXActionPredictionContainer *)v64 initWithScoredAction:v63 slotSet:v65 actionKey:v73];

    +[ATXSlotResolution setSlotResolutionPredictionItemForTopUpcomingMediaActionContainer:v66 appActionPredictionItem:a6 appActionLogProbability:a7];
    [v74 addObject:v66];
  }
LABEL_39:

  if ([v74 count])
  {
    v67 = +[_ATXAppIconState sharedInstance];
    v68 = [v67 allInstalledAppsKnownToSpringBoard];
    objc_msgSend(v74, "atx_filterPlayMediaIntentsWithUnavailableAppDestinationGivenSBAppList:", v68);
    id v69 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_41:
    id v69 = v74;
  }

  return v69;
}

+ (BOOL)upcomingMediaPreferenceForINPlayMediaIntent:(id)a3 withINUpcomingMediaManagerReturnValueForTests:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = [v5 launchId];

    if (v7)
    {
      v8 = [v5 mediaItems];
      if (v8
        && ([v5 mediaItems],
            v9 = objc_claimAutoreleasedReturnValue(),
            uint64_t v10 = [v9 count],
            v9,
            v8,
            v10))
      {
        v11 = [v5 mediaItems];
        v12 = [v11 firstObject];
        uint64_t v13 = [v12 type];
      }
      else
      {
        v15 = [v5 mediaContainer];

        if (!v15)
        {
          v22 = __atxlog_handle_default();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            +[ATXMediaActionPrediction upcomingMediaPreferenceForINPlayMediaIntent:withINUpcomingMediaManagerReturnValueForTests:]((uint64_t)v5, v22);
          }

          v23 = [v5 launchId];
          int v24 = [&unk_1F27F3708 containsObject:v23];

          if (v24)
          {
            char v20 = __atxlog_handle_default();
            LOBYTE(v14) = 1;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              v25 = [v5 launchId];
              *(_DWORD *)buf = 138412290;
              v30 = v25;
              _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_INFO, "Logged error when getting upcomingMediaPreference, but since app is %@, we will prefer upcoming media for predictions.", buf, 0xCu);
            }
          }
          else
          {
            char v20 = __atxlog_handle_default();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              v26 = [v5 launchId];
              *(_DWORD *)buf = 138412290;
              v30 = v26;
              _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_INFO, "Logged error when getting upcomingMediaPreference, and since app is %@ (not Podcasts or TV), we will not prefer upcoming media for predictions.", buf, 0xCu);
            }
            LOBYTE(v14) = 0;
          }
          goto LABEL_14;
        }
        v11 = [v5 mediaContainer];
        uint64_t v13 = [v11 type];
      }

      if (v6)
      {
        int v14 = [v6 isEqualToNumber:&unk_1F27F1D70];
      }
      else
      {
        v16 = [MEMORY[0x1E4F30810] sharedManager];
        v17 = [v5 launchId];
        id v28 = 0;
        uint64_t v18 = [v16 _predictionModeForBundleId:v17 type:v13 error:&v28];
        id v19 = v28;

        int v14 = v18 == 1;
      }
      char v20 = __atxlog_handle_default();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        char v27 = [v5 launchId];
        *(_DWORD *)buf = 138412802;
        v30 = v27;
        __int16 v31 = 2048;
        uint64_t v32 = v13;
        __int16 v33 = 1024;
        int v34 = v14;
        _os_log_debug_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEBUG, "Checked upcoming media preference for %@ for media type %ld. Should prefer upcoming media for predictions? %d", buf, 0x1Cu);
      }
LABEL_14:

      goto LABEL_15;
    }
  }
  LOBYTE(v14) = 0;
LABEL_15:

  return v14;
}

+ (BOOL)upcomingMediaPreferenceForINPlayMediaIntent:(id)a3
{
  return +[ATXMediaActionPrediction upcomingMediaPreferenceForINPlayMediaIntent:a3 withINUpcomingMediaManagerReturnValueForTests:0];
}

+ (id)resolvePlayMediaIntent:(id)a3 withUpcomingMedia:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 preferenceForUpcomingMediaIsSet] & 1) == 0) {
    objc_msgSend(v7, "setPreferUpcomingMediaForPredictions:", +[ATXMediaActionPrediction upcomingMediaPreferenceForINPlayMediaIntent:](ATXMediaActionPrediction, "upcomingMediaPreferenceForINPlayMediaIntent:", v6));
  }
  v8 = [v7 sortedUpcomingMedia];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    if (([v7 preferUpcomingMediaForPredictions] & 1) == 0)
    {
      uint64_t v12 = [objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v6 second:&unk_1F27F1D88];
LABEL_27:
      uint64_t v18 = (void *)v12;
      goto LABEL_28;
    }
LABEL_20:
    uint64_t v18 = 0;
    goto LABEL_28;
  }
  if (v6)
  {
    uint64_t v10 = [v6 buckets];
    if (v10)
    {
      v11 = [v6 mediaContainer];
      if (v11)
      {
      }
      else
      {
        id v19 = [v6 mediaItems];

        if (!v19)
        {
          v25 = __atxlog_handle_default();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            +[ATXMediaActionPrediction resolvePlayMediaIntent:withUpcomingMedia:].cold.4();
          }

          uint64_t v12 = [a1 resolveBucketLevelPrediction:v6 withUpcomingMedia:v7];
          goto LABEL_27;
        }
      }
    }
    char v20 = [v6 mediaContainer];
    if (v20)
    {
      v21 = [v6 mediaItems];

      if (!v21)
      {
        int v24 = __atxlog_handle_default();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          +[ATXMediaActionPrediction resolvePlayMediaIntent:withUpcomingMedia:]();
        }

        uint64_t v12 = [a1 resolveContainerLevelPrediction:v6 withUpcomingMedia:v7];
        goto LABEL_27;
      }
    }
    v22 = [v6 mediaItems];

    if (v22)
    {
      v23 = __atxlog_handle_default();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        +[ATXMediaActionPrediction resolvePlayMediaIntent:withUpcomingMedia:]();
      }

      uint64_t v12 = [a1 resolveItemLevelPrediction:v6 withUpcomingMedia:v7];
      goto LABEL_27;
    }
    goto LABEL_20;
  }
  uint64_t v13 = __atxlog_handle_default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    +[ATXMediaActionPrediction resolvePlayMediaIntent:withUpcomingMedia:]();
  }

  id v14 = objc_alloc(MEMORY[0x1E4F93BB8]);
  v15 = [v7 sortedUpcomingMedia];
  v16 = [v15 firstObject];
  v17 = [v16 first];
  uint64_t v18 = (void *)[v14 initWithFirst:v17 second:&unk_1F27F1D70];

LABEL_28:
  return v18;
}

+ (id)resolveBucketLevelPrediction:(id)a3 withUpcomingMedia:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 buckets];
  uint64_t v9 = [v8 firstObject];
  uint64_t v10 = [v9 vocabularyIdentifier];

  if (v10)
  {
    v11 = [v7 bucketValidUpcomingMedia];
    uint64_t v12 = [v11 objectForKeyedSubscript:v10];
  }
  else
  {
    uint64_t v12 = 0;
  }
  if ([v12 count])
  {
    id v13 = objc_alloc(MEMORY[0x1E4F93BB8]);
    id v14 = [a1 findTopRankedINPlayMediaIntentFromArray:v12];
    v15 = (void *)[v13 initWithFirst:v14 second:&unk_1F27F1D70];
LABEL_8:

    goto LABEL_9;
  }
  if ([v7 preferUpcomingMediaForPredictions])
  {
    id v16 = objc_alloc(MEMORY[0x1E4F93BB8]);
    id v14 = [v7 sortedUpcomingMedia];
    v17 = [v14 firstObject];
    uint64_t v18 = [v17 first];
    v15 = (void *)[v16 initWithFirst:v18 second:&unk_1F27F1D70];

    goto LABEL_8;
  }
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v6 second:&unk_1F27F1D88];
LABEL_9:

  return v15;
}

+ (id)resolveContainerLevelPrediction:(id)a3 withUpcomingMedia:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 mediaContainer];
  uint64_t v9 = [v8 identifier];

  if (v9)
  {
    uint64_t v10 = [v7 containerValidUpcomingMedia];
    v11 = [v10 objectForKeyedSubscript:v9];

    uint64_t v12 = [v7 containerExpiredUpcomingMedia];
    id v13 = [v12 objectForKeyedSubscript:v9];
  }
  else
  {
    v11 = 0;
    id v13 = 0;
  }
  if ([v11 count])
  {
    id v14 = objc_alloc(MEMORY[0x1E4F93BB8]);
    v15 = [a1 findTopRankedINPlayMediaIntentFromArray:v11];
    id v16 = (void *)[v14 initWithFirst:v15 second:&unk_1F27F1D70];
LABEL_6:

    goto LABEL_13;
  }
  if ([v7 preferUpcomingMediaForPredictions])
  {
    if (![v7 isInternalApplication])
    {
      id v19 = objc_alloc(MEMORY[0x1E4F93BB8]);
      v15 = [v7 sortedUpcomingMedia];
      char v20 = [v15 firstObject];
      v21 = [v20 first];
      id v16 = (void *)[v19 initWithFirst:v21 second:&unk_1F27F1D70];

      goto LABEL_6;
    }
    if ([v13 count])
    {
      id v16 = 0;
      goto LABEL_13;
    }
    uint64_t v17 = [a1 resolveBucketLevelPrediction:v6 withUpcomingMedia:v7];
  }
  else
  {
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v6 second:&unk_1F27F1D88];
  }
  id v16 = (void *)v17;
LABEL_13:

  return v16;
}

+ (id)resolveItemLevelPrediction:(id)a3 withUpcomingMedia:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 mediaContainer];

  if (v8)
  {
    uint64_t v9 = [a1 resolveContainerLevelPrediction:v6 withUpcomingMedia:v7];
    goto LABEL_15;
  }
  uint64_t v10 = [v6 mediaItems];
  v11 = [v10 firstObject];
  uint64_t v12 = [v11 identifier];

  if (v12)
  {
    id v13 = [v7 itemValidUpcomingMedia];
    id v14 = [v13 objectForKeyedSubscript:v12];
  }
  else
  {
    id v14 = 0;
  }
  if (![v14 count])
  {
    if ([v7 preferUpcomingMediaForPredictions])
    {
      if (![v7 isInternalApplication])
      {
        id v19 = objc_alloc(MEMORY[0x1E4F93BB8]);
        id v16 = [v7 sortedUpcomingMedia];
        char v20 = [v16 firstObject];
        v21 = [v20 first];
        uint64_t v9 = (void *)[v19 initWithFirst:v21 second:&unk_1F27F1D70];

        goto LABEL_8;
      }
      uint64_t v17 = [a1 resolveBucketLevelPrediction:v6 withUpcomingMedia:v7];
    }
    else
    {
      uint64_t v17 = [objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v6 second:&unk_1F27F1D88];
    }
    uint64_t v9 = (void *)v17;
    goto LABEL_14;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F93BB8]);
  id v16 = [a1 findTopRankedINPlayMediaIntentFromArray:v14];
  uint64_t v9 = (void *)[v15 initWithFirst:v16 second:&unk_1F27F1D70];
LABEL_8:

LABEL_14:
LABEL_15:

  return v9;
}

+ (id)findTopRankedINPlayMediaIntentFromArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a3;
  v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    uint64_t v7 = 0x8000000000000000;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "second", (void)v15);
        BOOL v11 = [v10 longValue] < v7;

        if (!v11)
        {
          uint64_t v12 = [v9 second];
          uint64_t v7 = [v12 longValue];

          uint64_t v13 = [v9 first];

          v4 = (void *)v13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  return v4;
}

+ (void)upcomingMediaPreferenceForINPlayMediaIntent:(uint64_t)a1 withINUpcomingMediaManagerReturnValueForTests:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Attempted to get upcoming media preference, but prediction did not contain mediaContainer or any mediaItems. Prediction was %@", (uint8_t *)&v2, 0xCu);
}

+ (void)resolvePlayMediaIntent:withUpcomingMedia:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Predicted media intent was nil, resolving by taking the first item in Upcoming Media.", v2, v3, v4, v5, v6);
}

+ (void)resolvePlayMediaIntent:withUpcomingMedia:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Predicted media intent is resolved up to the item level. Resolving the item level prediction.", v2, v3, v4, v5, v6);
}

+ (void)resolvePlayMediaIntent:withUpcomingMedia:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Predicted media intent is resolved up to the media container level. Resolving the container level prediction.", v2, v3, v4, v5, v6);
}

+ (void)resolvePlayMediaIntent:withUpcomingMedia:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Predicted media intent is resolved up to the bucket level. Resolving the bucket level prediction.", v2, v3, v4, v5, v6);
}

@end