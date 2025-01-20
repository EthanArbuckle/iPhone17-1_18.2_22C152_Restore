@interface ATXHeroClipManager
+ (BOOL)clipsSupported;
+ (id)addPredictionLocationToHeroAppPredictions:(id)a3 location:(id)a4;
+ (id)sortPredictionsOnFeedback:(id)a3;
+ (void)openAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4;
- (ATXAppClipsFeedback)feedback;
- (ATXHeroClipManager)init;
- (ATXHeroClipManager)initWithFeedback:(id)a3;
- (ATXHeroClipManager)initWithFeedback:(id)a3 tracker:(id)a4;
- (id)_populateMetadataInHeroAppPrediction:(id)a3;
- (void)donateAppClipsWithHeroAppPredictions:(id)a3;
- (void)logSuppressionMetricWithHeroAppPrediction:(id)a3 suppresionType:(int)a4;
@end

@implementation ATXHeroClipManager

+ (BOOL)clipsSupported
{
  v2 = (void *)MEMORY[0x1D25F6CC0](a1, a2);
  if ([MEMORY[0x1E4F590F8] isSupported])
  {
    v3 = (void *)CFPreferencesCopyAppValue(@"SuggestionsSuggestAppClips", @"com.apple.suggestions");
    v4 = v3;
    if (v3) {
      char v5 = [v3 BOOLValue];
    }
    else {
      char v5 = 1;
    }
  }
  else
  {
    char v5 = 0;
  }
  return v5;
}

- (ATXHeroClipManager)init
{
  v3 = objc_opt_new();
  v4 = [(ATXHeroClipManager *)self initWithFeedback:v3];

  return v4;
}

- (ATXHeroClipManager)initWithFeedback:(id)a3
{
  id v4 = a3;
  char v5 = objc_opt_new();
  v6 = [(ATXHeroClipManager *)self initWithFeedback:v4 tracker:v5];

  return v6;
}

- (ATXHeroClipManager)initWithFeedback:(id)a3 tracker:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXHeroClipManager;
  v9 = [(ATXHeroClipManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_feedback, a3);
    objc_storeStrong((id *)&v10->_tracker, a4);
  }

  return v10;
}

- (void)donateAppClipsWithHeroAppPredictions:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(id)objc_opt_class() clipsSupported] & 1) == 0)
  {
    char v5 = __atxlog_handle_hero();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Clearing App Clips Suggestions, since ClipServices are not supported on this device.", buf, 2u);
    }

    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }
  if (![(ATXAppClipsFeedback *)self->_feedback shouldShowAppClips])
  {

    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }
  id v6 = (id)objc_opt_new();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v48 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        if ([(ATXAppClipsFeedback *)self->_feedback shouldShowAppClipWithHeroAppPrediction:v12])
        {
          [v6 addObject:v12];
        }
        else
        {
          [(ATXHeroClipManager *)self logSuppressionMetricWithHeroAppPrediction:v12 suppresionType:1];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    v13 = [MEMORY[0x1E4F1C9C8] now];
    v14 = [MEMORY[0x1E4F935D0] sharedInstance];
    v15 = [v14 getCurrentPreciseLocation];

    v16 = __atxlog_handle_hero();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      [v13 timeIntervalSinceNow];
      *(_DWORD *)buf = 134217984;
      double v54 = -v17;
      _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "Took %f seconds to fetch precise location", buf, 0xCu);
    }

    if (v15)
    {
      v18 = (void *)[v6 copy];
      v19 = +[ATXHeroDataServerHelper inRadiusPredictionsFrom:v6 currentLocation:v15];
      v20 = (void *)[v19 mutableCopy];

      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v6 = v18;
      uint64_t v21 = [v6 countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v44 != v23) {
              objc_enumerationMutation(v6);
            }
            uint64_t v25 = *(void *)(*((void *)&v43 + 1) + 8 * j);
            if (([v20 containsObject:v25] & 1) == 0) {
              [(ATXHeroClipManager *)self logSuppressionMetricWithHeroAppPrediction:v25 suppresionType:0];
            }
          }
          uint64_t v22 = [v6 countByEnumeratingWithState:&v43 objects:v52 count:16];
        }
        while (v22);
      }
    }
    else
    {
      v26 = __atxlog_handle_hero();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[ATXHeroClipManager donateAppClipsWithHeroAppPredictions:]();
      }

      v20 = objc_opt_new();
    }

    v27 = [(id)objc_opt_class() addPredictionLocationToHeroAppPredictions:v20 location:v15];
    id v6 = (id)[v27 mutableCopy];
  }
  v28 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v29 = v6;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v40 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v39 + 1) + 8 * k);
        v35 = -[ATXHeroClipManager _populateMetadataInHeroAppPrediction:](self, "_populateMetadataInHeroAppPrediction:", v34, (void)v39);
        if (v35) {
          [v28 addObject:v35];
        }
        else {
          [(ATXHeroClipManager *)self logSuppressionMetricWithHeroAppPrediction:v34 suppresionType:2];
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v31);
  }

  v36 = [(id)objc_opt_class() sortPredictionsOnFeedback:v28];
  v37 = __atxlog_handle_hero();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = [v36 description];
    *(_DWORD *)buf = 138412290;
    double v54 = *(double *)&v38;
    _os_log_impl(&dword_1D0FA3000, v37, OS_LOG_TYPE_DEFAULT, "Sending app clips predictions to blending layer. Predictions: %@", buf, 0xCu);
  }
  +[ATXAppClipsBlendingUpdater updateBlendingLayerWithHeroAppPredictions:v36];
}

- (void)logSuppressionMetricWithHeroAppPrediction:(id)a3 suppresionType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v9 = (id)objc_opt_new();
  id v7 = [v6 bundleId];
  [v9 setBundleId:v7];

  uint64_t v8 = [v6 urlHash];

  [v9 setUrlHash:v8];
  [v9 setSuppressionType:v4];
  [(ATXPETEventTracker2Protocol *)self->_tracker trackScalarForMessage:v9];
}

- (id)_populateMetadataInHeroAppPrediction:(id)a3
{
  id v4 = a3;
  [(ATXAppClipsFeedback *)self->_feedback feedbackScoreForAppClipWithHeroAppPrediction:v4];
  objc_msgSend(v4, "setScore:");
  char v5 = [v4 urlHash];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F590E8]);
    id v7 = [v4 urlHash];
    uint64_t v8 = (void *)[v6 initWithURLHash:v7];

    uint64_t v39 = 0;
    long long v40 = &v39;
    uint64_t v41 = 0x3032000000;
    long long v42 = __Block_byref_object_copy__82;
    long long v43 = __Block_byref_object_dispose__82;
    id v44 = 0;
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__82;
    v37 = __Block_byref_object_dispose__82;
    id v38 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke;
    v23[3] = &unk_1E68B3FA8;
    v26 = &v29;
    uint64_t v10 = v9;
    v24 = v10;
    v27 = &v39;
    v11 = v8;
    uint64_t v25 = v11;
    v28 = &v33;
    [v11 requestMetadataWithCompletion:v23];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_2;
    v22[3] = &unk_1E68AB438;
    v22[4] = &v29;
    [MEMORY[0x1E4F93B18] waitForSemaphore:v10 timeoutSeconds:&__block_literal_global_175 onAcquire:v22 onTimeout:30.0];
    if (*((unsigned char *)v30 + 24))
    {
      id v12 = 0;
    }
    else
    {
      v19 = [(id)v40[5] clipBundleID];
      [v4 setBundleId:v19];

      [v4 setClipMetadata:v40[5]];
      v20 = [(id)v34[5] path];
      [(id)v40[5] setFullAppCachedIconFilePath:v20];

      id v12 = v4;
    }

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v33, 8);

    _Block_object_dispose(&v39, 8);
  }
  else
  {
    v11 = __atxlog_handle_hero();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXHeroClipManager _populateMetadataInHeroAppPrediction:]((uint64_t)v4, v11, v13, v14, v15, v16, v17, v18);
    }
    id v12 = 0;
  }

  return v12;
}

void __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = __atxlog_handle_hero();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_cold_2((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_28;
    v19[3] = &unk_1E68B3F80;
    uint64_t v16 = *(void **)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 64);
    uint64_t v21 = *(void *)(a1 + 48);
    uint64_t v22 = v17;
    id v20 = *(id *)(a1 + 32);
    [v16 requestDownloadedIconWithMetadata:v15 completion:v19];
  }
  else
  {
    uint64_t v18 = __atxlog_handle_hero();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  char v5 = __atxlog_handle_hero();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = [v4 absoluteString];
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "Got clip icon! %@", (uint8_t *)&v8, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_28_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_2(uint64_t a1)
{
  v2 = __atxlog_handle_hero();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_2_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

+ (id)sortPredictionsOnFeedback:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4F29008];
  id v4 = a3;
  char v5 = (void *)[[v3 alloc] initWithKey:@"score" ascending:0];
  id v6 = __atxlog_handle_hero();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "Sorting clip predictions based on score.", v10, 2u);
  }

  v11[0] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  int v8 = [v4 sortedArrayUsingDescriptors:v7];

  return v8;
}

+ (id)addPredictionLocationToHeroAppPredictions:(id)a3 location:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "coordinate", (void)v16);
        objc_msgSend(v13, "setLatitudeAtPredictionTime:");
        [v6 coordinate];
        [v13 setLongitudeAtPredictionTime:v14];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (void)openAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 clipsSupported])
  {
    id v8 = [v6 clipMetadata];
    uint64_t v9 = [v8 clipURL];

    if (v9)
    {
      uint64_t v10 = [v6 clipMetadata];
      uint64_t v11 = [v10 clipURL];

      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F590F0]) initWithURL:v11];
      [v12 setShouldReturnErrorOnUserCancellation:1];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __66__ATXHeroClipManager_openAppClipWithHeroAppPrediction_completion___block_invoke;
      v17[3] = &unk_1E68AB5F0;
      id v18 = v11;
      id v19 = v7;
      id v13 = v11;
      [v12 requestClipWithCompletion:v17];

      goto LABEL_10;
    }
    double v14 = __atxlog_handle_hero();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[ATXHeroClipManager openAppClipWithHeroAppPrediction:completion:]();
    }
  }
  else
  {
    double v14 = __atxlog_handle_hero();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "Ignoring App Clips Suggestions, since ClipServices are not supported on this device.", buf, 2u);
    }
  }

  uint64_t v12 = +[ATXHeroAndClipConstants sharedInstance];
  uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
  long long v16 = [v12 appClipsErrorDomain];
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, objc_msgSend(v12, "appClipsLaunchErrorCode"), 0);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v7) {
    (*((void (**)(id, id))v7 + 2))(v7, v13);
  }
LABEL_10:
}

void __66__ATXHeroClipManager_openAppClipWithHeroAppPrediction_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = __atxlog_handle_hero();
  id v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __66__ATXHeroClipManager_openAppClipWithHeroAppPrediction_completion___block_invoke_cold_1((uint64_t)v5, v7, v11, v12, v13, v14, v15, v16);
    }

    if ([v5 code] != 8)
    {
      long long v17 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v17 openURL:*(void *)(a1 + 32) withOptions:0];
    }
    uint64_t v18 = *(void *)(a1 + 40);
    if (v18)
    {
      uint64_t v10 = *(void (**)(void))(v18 + 16);
      goto LABEL_13;
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v19 = 138412290;
      uint64_t v20 = v8;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_INFO, "Request succeeded for app clip with url: %@", (uint8_t *)&v19, 0xCu);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      uint64_t v10 = *(void (**)(void))(v9 + 16);
LABEL_13:
      v10();
    }
  }
}

- (ATXAppClipsFeedback)feedback
{
  return self->_feedback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
}

- (void)donateAppClipsWithHeroAppPredictions:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Could not get precise location. Clearing predictions.", v2, v3, v4, v5, v6);
}

- (void)_populateMetadataInHeroAppPrediction:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Clip metadata not received.", v2, v3, v4, v5, v6);
}

void __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_28_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Clip icon request returned nil iconURL!", v2, v3, v4, v5, v6);
}

void __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Timed out while fetching metadata from clipservices", v2, v3, v4, v5, v6);
}

+ (void)openAppClipWithHeroAppPrediction:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "URL does not exist in clip metadata.", v2, v3, v4, v5, v6);
}

void __66__ATXHeroClipManager_openAppClipWithHeroAppPrediction_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end