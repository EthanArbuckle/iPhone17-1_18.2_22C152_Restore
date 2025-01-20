@interface ATXSuggestedPagesGlobalModeAffinityAppDataSource
- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4;
@end

@implementation ATXSuggestedPagesGlobalModeAffinityAppDataSource

- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4
{
  unint64_t v4 = +[ATXSuggestedPagesUtils modeForSuggestedPageType:](ATXSuggestedPagesUtils, "modeForSuggestedPageType:", a3, a4);
  v5 = +[ATXGlobalAppModeAffinityModel supportedModeTypes];
  v6 = [NSNumber numberWithUnsignedInteger:v4];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    v8 = +[ATXModeEntityScorerServer sharedInstance];
    v9 = [v8 rankedAppsForMode:v4];
    v10 = objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_115);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __96__ATXSuggestedPagesGlobalModeAffinityAppDataSource_provideAppsForSuggestedPageType_environment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = [v2 scoreMetadata];
  unint64_t v4 = [v3 featureVector];

  v5 = [v4 objectForKeyedSubscript:@"correlationNumLocalOccurrences"];
  v6 = [v4 objectForKeyedSubscript:@"correlationEntitySpecificFeatures"];
  int v7 = [v6 objectForKeyedSubscript:@"globalModeAffinityPrior"];

  v8 = 0;
  if (v5 && v7)
  {
    [v7 doubleValue];
    if (v9 <= 9.0 || [v5 integerValue] < 2)
    {
      v8 = 0;
    }
    else
    {
      v10 = __atxlog_handle_modes();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = [v2 identifier];
        int v15 = 138412546;
        v16 = v11;
        __int16 v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_INFO, "ATXSuggestedPagesGlobalModeAffinityAppDataSource: %@ passes threshold with score: %@", (uint8_t *)&v15, 0x16u);
      }
      id v12 = objc_alloc(MEMORY[0x1E4F4B070]);
      v13 = [v2 identifier];
      [v7 doubleValue];
      v8 = objc_msgSend(v12, "initWithBundleId:predictionSource:score:", v13, @"Global Mode Entity");
    }
  }

  return v8;
}

@end