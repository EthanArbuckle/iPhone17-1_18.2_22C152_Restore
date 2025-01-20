@interface ATXAppBlendingUpdater
+ (id)clientModelForAppPredictionsForClientModelId:(id)a3;
+ (id)clientModelIdForConsumerSubType:(unsigned __int8)a3;
+ (id)clientModelSpecForAppPredictionsForClientModelId:(id)a3;
+ (void)updateBlendingLayerForConsumerSubType:(unsigned __int8)a3;
@end

@implementation ATXAppBlendingUpdater

+ (id)clientModelIdForConsumerSubType:(unsigned __int8)a3
{
  v5 = 0;
  if (a3 <= 0x25u)
  {
    if (((1 << a3) & 0x39E) != 0)
    {
      uint64_t v6 = 15;
LABEL_4:
      v5 = objc_msgSend(MEMORY[0x1E4F93940], "clientModelIdFromClientModelType:", v6, v3);
      goto LABEL_5;
    }
    if (a3 == 35)
    {
      uint64_t v6 = 17;
      goto LABEL_4;
    }
    if (a3 == 37)
    {
      uint64_t v6 = 16;
      goto LABEL_4;
    }
  }
LABEL_5:
  return v5;
}

+ (id)clientModelSpecForAppPredictionsForClientModelId:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[_ATXGlobals sharedInstance];
  v5 = [v4 appPredictionBlendingModelVersion];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F93948]) initWithClientModelId:v3 clientModelVersion:v5 engagementResetPolicy:0];
  return v6;
}

+ (id)clientModelForAppPredictionsForClientModelId:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F93940]);
  v5 = +[ATXClientModelSuggestionReceiver sharedInstance];
  uint64_t v6 = [v5 blendingLayerServer];
  v7 = (void *)[v4 initWithClientModelId:v3 blendingLayerServer:v6];

  return v7;
}

+ (void)updateBlendingLayerForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F4AEE8] assetMappingWithCachedAssets];
  v5 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
  uint64_t v6 = [v5 stringByAppendingPathComponent:@"caches/ATXCacheFile"];
  v7 = [v4 getFullCachePathWithBaseCachePath:v6 consumerSubType:v3];

  id v19 = 0;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v7 options:1 error:&v19];
  id v9 = v19;
  if (v8)
  {
    v10 = +[ATXAppBlendingUpdater clientModelIdForConsumerSubType:v3];
    if (v10)
    {
      +[ATXAppPredictionFeedbackItem predictionItemsInFeedbackChunkFromCacheFileData:v8];
      v11 = [(id)objc_opt_class() clientModelSpecForAppPredictionsForClientModelId:v10];
      v12 = +[ATXProactiveSuggestionBuilder proactiveSuggestionsFromAppPredictionItems:buf clientModelSpec:v11 maxSuggestionsToSendToBlendingLayer:75];
      v13 = [(id)objc_opt_class() clientModelForAppPredictionsForClientModelId:v10];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __63__ATXAppBlendingUpdater_updateBlendingLayerForConsumerSubType___block_invoke;
      v17[3] = &__block_descriptor_33_e20_v20__0B8__NSError_12l;
      char v18 = v3;
      [v13 updateSuggestions:v12 feedbackMetadata:v8 completionHandler:v17];

      v20 = buf;
      std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100]((void ***)&v20);
    }
    else
    {
      v15 = __atxlog_handle_default();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v3];
        +[ATXAppBlendingUpdater updateBlendingLayerForConsumerSubType:v15];
      }
    }
  }
  else
  {
    v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v3];
      +[ATXAppBlendingUpdater updateBlendingLayerForConsumerSubType:(uint64_t)buf];
    }
  }
}

void __63__ATXAppBlendingUpdater_updateBlendingLayerForConsumerSubType___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:*(unsigned __int8 *)(a1 + 32)];
      int v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "Successfully updated blending for %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:*(unsigned __int8 *)(a1 + 32)];
      __63__ATXAppBlendingUpdater_updateBlendingLayerForConsumerSubType___block_invoke_cold_1(v8, (uint64_t)v5, (uint64_t)&v9);
    }
  }
}

+ (void)updateBlendingLayerForConsumerSubType:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3_2((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_error_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_ERROR, "Nil cacheFileData found when trying to update blending for %@. Error: %@", v4, 0x16u);
}

+ (void)updateBlendingLayerForConsumerSubType:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Nil clientModelId found when trying to update blending for %@.", buf, 0xCu);
}

void __63__ATXAppBlendingUpdater_updateBlendingLayerForConsumerSubType___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3_2((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_error_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_ERROR, "Error updating blending for %@ with error: %@", v4, 0x16u);
}

@end