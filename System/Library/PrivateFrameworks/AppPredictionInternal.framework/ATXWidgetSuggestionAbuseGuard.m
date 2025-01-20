@interface ATXWidgetSuggestionAbuseGuard
+ (id)sharedInstance;
- (ATXWidgetSuggestionAbuseGuard)initWithConfig:(id)a3 store:(id)a4;
- (BOOL)shouldDemoteSuggestionsForWidget:(id)a3 kind:(id)a4 intent:(id)a5;
- (void)_invalidatePreviousVerdicts;
- (void)_scheduleRefreshNoLaterThanDate:(id)a3;
@end

@implementation ATXWidgetSuggestionAbuseGuard

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6, &__block_literal_global);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult;
  return v2;
}

void __47__ATXWidgetSuggestionAbuseGuard_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  v1 = [ATXWidgetSuggestionAbuseGuard alloc];
  v2 = objc_opt_new();
  v3 = [MEMORY[0x1E4F4B0E8] sharedInstance];
  uint64_t v4 = [(ATXWidgetSuggestionAbuseGuard *)v1 initWithConfig:v2 store:v3];
  v5 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v4;
}

- (ATXWidgetSuggestionAbuseGuard)initWithConfig:(id)a3 store:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXWidgetSuggestionAbuseGuard;
  v9 = [(ATXWidgetSuggestionAbuseGuard *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a3);
    objc_storeStrong((id *)&v10->_store, a4);
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] distantFuture];
    scheduledRefreshDate = v10->_scheduledRefreshDate;
    v10->_scheduledRefreshDate = (NSDate *)v11;

    v13 = [[ATXInformationFilter alloc] initWithStore:v10->_store abuseControlConfig:v10->_config];
    filter = v10->_filter;
    v10->_filter = v13;
  }
  return v10;
}

- (BOOL)shouldDemoteSuggestionsForWidget:(id)a3 kind:(id)a4 intent:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  if (CFPreferencesGetAppBooleanValue(@"widgetKitDeveloperModeEnabled", @"com.apple.duetexpertd", 0))
  {
    LOBYTE(v29) = 0;
    if (CFPreferencesGetAppBooleanValue(@"ATXWidgetKitDeveloperModeSkipEntitlementCheck", (CFStringRef)*MEMORY[0x1E4F4B688], (Boolean *)&v29))
    {

LABEL_6:
      v13 = __atxlog_handle_relevant_shortcut();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [v10 intentDescription];
        int v29 = 136315906;
        v30 = "-[ATXWidgetSuggestionAbuseGuard shouldDemoteSuggestionsForWidget:kind:intent:]";
        __int16 v31 = 2112;
        id v32 = v11;
        __int16 v33 = 2112;
        id v34 = v9;
        __int16 v35 = 2112;
        v36 = v14;
        _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "%s: NO (WidgetKit Developer Mode enabled) for widget %@:%@:%@", (uint8_t *)&v29, 0x2Au);
      }
      BOOL v15 = 0;
      goto LABEL_25;
    }
    int v12 = [MEMORY[0x1E4F4AEF8] isDebuggingAllowedForExtensionBundleId:v11];

    if (v12) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  unint64_t v16 = [(ATXInformationFilter *)self->_filter numberOfSeenRotationsForWidget:v11 kind:v9 intent:v10 filterByClientModelId:0];
  unint64_t v17 = [(ATXTimelineAbuseControlConfig *)self->_config hardRotationQuotaForWidgetWithIdentifier:v11 kind:v9];
  if ((v17 & 0x8000000000000000) != 0 || v16 < v17)
  {
    v13 = [(ATXInformationStore *)self->_store mostRecentRotationRecordForWidget:v11 kind:v9 intent:v10 considerStalenessRotation:0 filterByClientModelId:0];
    store = self->_store;
    v20 = [v13 rotationDate];
    v21 = [(ATXInformationStore *)store firstEngagementOfWidget:v11 kind:v9 intent:v10 sinceTimestamp:v20];

    if (v13 && v21)
    {
      v22 = [v21 date];
      [v13 coolDownInterval];
      v23 = objc_msgSend(v22, "dateByAddingTimeInterval:");

      [v23 timeIntervalSinceNow];
      if (v24 > 0.0)
      {
        [(ATXWidgetSuggestionAbuseGuard *)self _scheduleRefreshNoLaterThanDate:v23];
        v26 = __atxlog_handle_relevant_shortcut();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = [v10 intentDescription];
          int v29 = 136315906;
          v30 = "-[ATXWidgetSuggestionAbuseGuard shouldDemoteSuggestionsForWidget:kind:intent:]";
          __int16 v31 = 2112;
          id v32 = v11;
          __int16 v33 = 2112;
          id v34 = v9;
          __int16 v35 = 2112;
          v36 = v27;
          _os_log_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_DEFAULT, "%s: YES (in cool down) for widget %@:%@:%@", (uint8_t *)&v29, 0x2Au);
        }
        BOOL v15 = 1;
        goto LABEL_24;
      }
    }
    v23 = __atxlog_handle_relevant_shortcut();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v25 = [v10 intentDescription];
      int v29 = 136315906;
      v30 = "-[ATXWidgetSuggestionAbuseGuard shouldDemoteSuggestionsForWidget:kind:intent:]";
      __int16 v31 = 2112;
      id v32 = v11;
      __int16 v33 = 2112;
      id v34 = v9;
      __int16 v35 = 2112;
      v36 = v25;
      _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, "%s: NO for widget %@:%@:%@", (uint8_t *)&v29, 0x2Au);
    }
    BOOL v15 = 0;
LABEL_24:

    goto LABEL_25;
  }
  v13 = __atxlog_handle_relevant_shortcut();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [v10 intentDescription];
    int v29 = 136315906;
    v30 = "-[ATXWidgetSuggestionAbuseGuard shouldDemoteSuggestionsForWidget:kind:intent:]";
    __int16 v31 = 2112;
    id v32 = v11;
    __int16 v33 = 2112;
    id v34 = v9;
    __int16 v35 = 2112;
    v36 = v18;
    _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "%s: YES (exceeds quota) for widget %@:%@:%@", (uint8_t *)&v29, 0x2Au);
  }
  BOOL v15 = 1;
LABEL_25:

  return v15;
}

- (void)_scheduleRefreshNoLaterThanDate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  scheduledRefreshDate = self->_scheduledRefreshDate;
  id v7 = [(NSDate *)scheduledRefreshDate earlierDate:v5];

  if (scheduledRefreshDate != v7)
  {
    objc_storeStrong((id *)&self->_scheduledRefreshDate, a3);
    id v8 = __atxlog_handle_relevant_shortcut();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[ATXWidgetSuggestionAbuseGuard _scheduleRefreshNoLaterThanDate:]";
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%s: Updated refresh date to %@.", buf, 0x16u);
    }

    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    id v10 = (const char *)*MEMORY[0x1E4F14170];
    [(NSDate *)self->_scheduledRefreshDate timeIntervalSinceNow];
    xpc_dictionary_set_int64(v9, v10, (uint64_t)v11);
    xpc_dictionary_set_int64(v9, (const char *)*MEMORY[0x1E4F141A8], 300);
    xpc_dictionary_set_BOOL(v9, (const char *)*MEMORY[0x1E4F14320], 1);
    xpc_dictionary_set_BOOL(v9, (const char *)*MEMORY[0x1E4F14138], 1);
    xpc_dictionary_set_BOOL(v9, (const char *)*MEMORY[0x1E4F142F8], 0);
    xpc_dictionary_set_string(v9, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__ATXWidgetSuggestionAbuseGuard__scheduleRefreshNoLaterThanDate___block_invoke;
    v12[3] = &unk_1E68AB3F0;
    v12[4] = self;
    atxRegisterCTSJobHandler("com.apple.duetexpertd.AbuseGuardRefresh", v9, v12);
  }
}

uint64_t __65__ATXWidgetSuggestionAbuseGuard__scheduleRefreshNoLaterThanDate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidatePreviousVerdicts];
}

- (void)_invalidatePreviousVerdicts
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = __atxlog_handle_relevant_shortcut();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[ATXWidgetSuggestionAbuseGuard _invalidatePreviousVerdicts]";
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"ATXWidgetSuggestionAbuseGuardRefresh" object:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledRefreshDate, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end