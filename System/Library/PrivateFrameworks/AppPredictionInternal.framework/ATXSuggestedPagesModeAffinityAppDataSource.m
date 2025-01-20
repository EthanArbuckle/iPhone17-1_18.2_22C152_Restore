@interface ATXSuggestedPagesModeAffinityAppDataSource
- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4;
@end

@implementation ATXSuggestedPagesModeAffinityAppDataSource

- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4
{
  id v5 = a4;
  if ((unint64_t)(a3 - 3) < 9 && ((0x143u >> (a3 - 3)) & 1) != 0
    || (unint64_t v6 = +[ATXSuggestedPagesUtils modeForSuggestedPageType:a3], v6 == 16))
  {
    v7 = 0;
  }
  else
  {
    unint64_t v8 = v6;
    v9 = +[ATXModeEntityScorerServer sharedInstance];
    v10 = [v9 rankedAppsForMode:v8];
    v7 = objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_214);
  }
  return v7;
}

id __90__ATXSuggestedPagesModeAffinityAppDataSource_provideAppsForSuggestedPageType_environment___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 scoreMetadata];
  [v3 score];
  double v5 = v4;
  id v6 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v7 = (void *)[v6 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  unint64_t v8 = objc_opt_new();
  v9 = [v7 objectForKey:*MEMORY[0x1E4F4B5C8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 doubleValue];
  }
  else {
    [v8 suggestedPagesModeAffinityAppDataSourceScoreThreshold];
  }
  double v11 = v10;

  if (v5 <= v11)
  {
    v16 = 0;
  }
  else
  {
    v12 = __atxlog_handle_modes();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __90__ATXSuggestedPagesModeAffinityAppDataSource_provideAppsForSuggestedPageType_environment___block_invoke_cold_1(v2, v12);
    }

    id v13 = objc_alloc(MEMORY[0x1E4F4B070]);
    v14 = [v2 bundleId];
    v15 = [v2 scoreMetadata];
    [v15 score];
    v16 = objc_msgSend(v13, "initWithBundleId:predictionSource:score:", v14, @"Mode Entity");
  }
  return v16;
}

void __90__ATXSuggestedPagesModeAffinityAppDataSource_provideAppsForSuggestedPageType_environment___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v4 = [a1 bundleId];
  double v5 = [a1 scoreMetadata];
  [v5 score];
  int v7 = 138412546;
  unint64_t v8 = v4;
  __int16 v9 = 2048;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "ATXSuggestedPagesModeAffinityAppDataSource: %@ passes threshold with score: %f", (uint8_t *)&v7, 0x16u);
}

@end