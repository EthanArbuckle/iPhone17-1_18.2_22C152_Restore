@interface ATXMagicalMomentsBlendingUpdater
+ (id)clientModelForMagicalMomentsPredictions;
+ (id)clientModelSpecForMagicalMomentsPredictions;
+ (id)feedbackMetadataForMmMap:(id)a3;
+ (void)updateBlendingLayerWithMagicalMomentsMap:(id)a3;
@end

@implementation ATXMagicalMomentsBlendingUpdater

+ (void)updateBlendingLayerWithMagicalMomentsMap:(id)a3
{
  id v4 = a3;
  v5 = +[ATXAppPredictionBlacklist sharedInstance];
  v6 = [v5 disabledBundleIds];

  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __77__ATXMagicalMomentsBlendingUpdater_updateBlendingLayerWithMagicalMomentsMap___block_invoke;
  v19 = &unk_1E68B6070;
  id v7 = v6;
  id v20 = v7;
  v21 = &v22;
  v8 = [v4 keysOfEntriesPassingTest:&v16];
  v9 = v8;
  if (*((unsigned char *)v23 + 24))
  {
    v10 = objc_msgSend(v8, "allObjects", v16, v17, v18, v19);
    uint64_t v11 = [v4 dictionaryWithValuesForKeys:v10];

    id v4 = (id)v11;
  }
  v12 = objc_msgSend(a1, "clientModelSpecForMagicalMomentsPredictions", v16, v17, v18, v19);
  v13 = +[ATXProactiveSuggestionBuilder proactiveSuggestionsForAppsWithMagicalMomentsMap:v4 clientModelSpec:v12];
  v14 = [a1 clientModelForMagicalMomentsPredictions];
  v15 = [a1 feedbackMetadataForMmMap:v4];
  if (v15) {
    [v14 updateSuggestions:v13 feedbackMetadata:v15];
  }

  _Block_object_dispose(&v22, 8);
}

uint64_t __77__ATXMagicalMomentsBlendingUpdater_updateBlendingLayerWithMagicalMomentsMap___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) containsObject:v3];
  if (v4)
  {
    v5 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Removing blacklisted bundle id: %@", (uint8_t *)&v7, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }

  return v4 ^ 1u;
}

+ (id)feedbackMetadataForMmMap:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v11 = NSNumber;
        v12 = [v5 objectForKeyedSubscript:v10];
        v13 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "anchorType"));
        [v4 setObject:v13 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  v14 = (void *)MEMORY[0x1D25F6CC0]();
  id v20 = 0;
  v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v20];
  id v16 = v20;
  if (v16)
  {
    uint64_t v17 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[ATXMagicalMomentsBlendingUpdater feedbackMetadataForMmMap:]((uint64_t)v16, v17);
    }

    id v18 = 0;
  }
  else
  {
    id v18 = v15;
  }

  return v18;
}

+ (id)clientModelSpecForMagicalMomentsPredictions
{
  v2 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:24];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F93948]) initWithClientModelId:v2 clientModelVersion:@"1.0" engagementResetPolicy:0];

  return v3;
}

+ (id)clientModelForMagicalMomentsPredictions
{
  v2 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:24];
  id v3 = objc_alloc(MEMORY[0x1E4F93940]);
  int v4 = +[ATXClientModelSuggestionReceiver sharedInstance];
  id v5 = [v4 blendingLayerServer];
  uint64_t v6 = (void *)[v3 initWithClientModelId:v2 blendingLayerServer:v5];

  return v6;
}

+ (void)feedbackMetadataForMmMap:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Error while archiving feedback metadata: %@. Not updating blending with mm predictions.", (uint8_t *)&v2, 0xCu);
}

@end