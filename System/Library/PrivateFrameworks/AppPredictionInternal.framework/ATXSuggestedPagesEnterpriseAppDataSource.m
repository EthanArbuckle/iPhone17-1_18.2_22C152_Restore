@interface ATXSuggestedPagesEnterpriseAppDataSource
- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4;
@end

@implementation ATXSuggestedPagesEnterpriseAppDataSource

- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4
{
  id v5 = a4;
  if (a3 == 7)
  {
    v6 = [MEMORY[0x1E4F74230] sharedConnection];
    uint64_t v7 = [v6 managedAppIDs];
    v8 = (void *)v7;
    v9 = (void *)MEMORY[0x1E4F1CBF0];
    if (v7) {
      v9 = (void *)v7;
    }
    id v10 = v9;

    v11 = __atxlog_handle_modes();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ATXSuggestedPagesEnterpriseAppDataSource provideAppsForSuggestedPageType:environment:]((uint64_t)v10, v11);
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __88__ATXSuggestedPagesEnterpriseAppDataSource_provideAppsForSuggestedPageType_environment___block_invoke;
    v14[3] = &unk_1E68AD010;
    id v15 = v5;
    v12 = objc_msgSend(v10, "_pas_mappedArrayWithTransform:", v14);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id __88__ATXSuggestedPagesEnterpriseAppDataSource_provideAppsForSuggestedPageType_environment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([MEMORY[0x1E4F4AF00] isBetaAppForBundle:v3])
  {
    v4 = __atxlog_handle_modes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v3;
      id v5 = "ATXSuggestedPagesEnterpriseAppDataSource: not considering beta app: %@";
LABEL_8:
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    v6 = [*(id *)(a1 + 32) appLaunchCounts];
    uint64_t v7 = [v6 objectForKeyedSubscript:v3];
    uint64_t v8 = [v7 rawLaunchCount];

    if (v8)
    {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:v3 predictionSource:@"Enterprise"];
      goto LABEL_10;
    }
    v4 = __atxlog_handle_modes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v3;
      id v5 = "ATXSuggestedPagesEnterpriseAppDataSource: not considering app that was not launched: %@";
      goto LABEL_8;
    }
  }

  v9 = 0;
LABEL_10:

  return v9;
}

- (void)provideAppsForSuggestedPageType:(uint64_t)a1 environment:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "ATXSuggestedPagesEnterpriseAppDataSource: suggested enterprise apps: %@", (uint8_t *)&v2, 0xCu);
}

@end