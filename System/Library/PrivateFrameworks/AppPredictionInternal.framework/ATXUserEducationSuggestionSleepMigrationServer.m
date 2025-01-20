@interface ATXUserEducationSuggestionSleepMigrationServer
- (ATXUserEducationSuggestionSleepMigrationServer)initWithConnector:(id)a3;
- (void)_processModeChangeEvent:(id)a3;
- (void)dealloc;
- (void)processModeChangeEvent:(id)a3;
- (void)sendSuggestion:(id)a3 withEventType:(unint64_t)a4;
@end

@implementation ATXUserEducationSuggestionSleepMigrationServer

- (ATXUserEducationSuggestionSleepMigrationServer)initWithConnector:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATXUserEducationSuggestionSleepMigrationServer;
  v6 = [(ATXUserEducationSuggestionBaseServer *)&v14 init];
  if (v6)
  {
    v7 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[ATXUserEducationSuggestionSleepMigrationServer initWithConnector:]";
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%s: starting server", buf, 0xCu);
    }

    v8 = (ATXHomeScreenConfigCache *)objc_alloc_init(MEMORY[0x1E4F4B078]);
    homeScreenConfigCache = v6->_homeScreenConfigCache;
    v6->_homeScreenConfigCache = v8;

    v10 = (ATXInstalledSuggestedPagesTracker *)objc_alloc_init(MEMORY[0x1E4F4B0F0]);
    installedSuggestedPagesTracker = v6->_installedSuggestedPagesTracker;
    v6->_installedSuggestedPagesTracker = v10;

    objc_storeStrong((id *)&v6->_connector, a3);
    v12 = +[ATXUserEducationSuggestionModeChangeNotifier sharedInstance];
    [v12 registerObserver:v6];
  }
  return v6;
}

- (void)dealloc
{
  v3 = +[ATXUserEducationSuggestionModeChangeNotifier sharedInstance];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ATXUserEducationSuggestionSleepMigrationServer;
  [(ATXUserEducationSuggestionSleepMigrationServer *)&v4 dealloc];
}

- (void)processModeChangeEvent:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__ATXUserEducationSuggestionSleepMigrationServer_processModeChangeEvent___block_invoke;
  v6[3] = &unk_1E68AB870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ATXUserEducationSuggestionBaseServer *)self performBlockOnInternalSerialQueue:v6];
}

uint64_t __73__ATXUserEducationSuggestionSleepMigrationServer_processModeChangeEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processModeChangeEvent:*(void *)(a1 + 40)];
}

- (void)_processModeChangeEvent:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 semanticType];
  v6 = __atxlog_handle_context_user_education_suggestions();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 == 3)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]";
      __int16 v38 = 2114;
      v39 = v4;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "%s: processing new userFocusComputedModeEvent: %{public}@", buf, 0x16u);
    }

    v6 = [objc_alloc(MEMORY[0x1E4F4B3F0]) initWithRandomUUID];
    int v8 = [v6 suggestionWasAlreadyShown];
    int v9 = [v6 suggestionWasAlreadyDismissed];
    if ([v4 starting])
    {
      if (v8)
      {
        v10 = __atxlog_handle_context_user_education_suggestions();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v37 = "-[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]";
          v11 = "%s: Not showing user education suggestion because it was already shown";
LABEL_28:
          v12 = v10;
          uint32_t v13 = 12;
          goto LABEL_29;
        }
        goto LABEL_30;
      }
      objc_super v14 = ATXSleepSuggestedHomePageWasCreatedDuringMigration();
      v15 = v14;
      if (v14)
      {
        if ([v14 BOOLValue])
        {

          id v16 = objc_alloc(MEMORY[0x1E4F29128]);
          uint64_t v17 = [v4 mode];
          v15 = (void *)[v16 initWithUUIDString:v17];

          if (!v15)
          {
            v21 = __atxlog_handle_context_user_education_suggestions();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              -[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]();
            }
            goto LABEL_49;
          }
          homeScreenConfigCache = self->_homeScreenConfigCache;
          id v35 = 0;
          v19 = [(ATXHomeScreenConfigCache *)homeScreenConfigCache loadHomeScreenPageConfigurationsIncludingHidden:1 error:&v35];
          v20 = v35;
          v21 = v20;
          if (!v19 || v20)
          {
            v23 = __atxlog_handle_context_user_education_suggestions();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              -[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]();
            }
            goto LABEL_48;
          }
          v22 = objc_opt_new();
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __74__ATXUserEducationSuggestionSleepMigrationServer__processModeChangeEvent___block_invoke;
          v32[3] = &unk_1E68B4E80;
          id v33 = v15;
          v23 = v22;
          v34 = v23;
          [v19 enumerateObjectsUsingBlock:v32];
          if ((unint64_t)[v23 count] >= 2)
          {
            v24 = __atxlog_handle_context_user_education_suggestions();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v37 = "-[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]";
              _os_log_impl(&dword_1D0FA3000, v24, OS_LOG_TYPE_DEFAULT, "%s: Not showing suggestion because there's more than 1 home page associated with sleep. This would be an indication that the user has customized their sleep pages, therefore doesn't qualify for the discovery platter.", buf, 0xCu);
            }
            goto LABEL_47;
          }
          v24 = [v23 firstObject];
          v27 = [v24 uniqueIdentifier];
          if ([v27 length])
          {
            installedSuggestedPagesTracker = self->_installedSuggestedPagesTracker;
            v28 = [v24 uniqueIdentifier];
            uint64_t v31 = [(ATXInstalledSuggestedPagesTracker *)installedSuggestedPagesTracker suggestedPageTypeWithIdentifier:v28];

            if (v31 == 4)
            {
              [(ATXUserEducationSuggestionSleepMigrationServer *)self sendSuggestion:v6 withEventType:0];
LABEL_47:

LABEL_48:
LABEL_49:

              goto LABEL_50;
            }
          }
          else
          {
          }
          v29 = __atxlog_handle_context_user_education_suggestions();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v37 = "-[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]";
            _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_DEFAULT, "%s: Not showing suggestion because there aren't any installed suggested pages for sleep", buf, 0xCu);
          }

          goto LABEL_47;
        }
        v26 = __atxlog_handle_context_user_education_suggestions();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v37 = "-[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]";
          _os_log_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_DEFAULT, "%s: Not showing user education suggestion because a suggested page was not created as part of the sleep migration flow, or the sleep migration didn't happen.", buf, 0xCu);
        }
      }
      else
      {
        v26 = __atxlog_handle_context_user_education_suggestions();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:](v26);
        }
      }

LABEL_50:
      goto LABEL_51;
    }
    if ((v8 ^ 1 | v9))
    {
      if ((v8 & 1) == 0)
      {
        v10 = __atxlog_handle_context_user_education_suggestions();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v37 = "-[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]";
          v11 = "%s: Not dismissing suggestion because it hasn't been shown yet.";
          goto LABEL_28;
        }
        goto LABEL_30;
      }
      if (v9)
      {
        v10 = __atxlog_handle_context_user_education_suggestions();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v37 = "-[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]";
          v11 = "%s: Not dismissing suggestion because it has already been dismissed.";
          goto LABEL_28;
        }
LABEL_30:
      }
    }
    else
    {
      v25 = __atxlog_handle_context_user_education_suggestions();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v37 = "-[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]";
        _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "%s: Dismissing suggestion because we're exiting Sleep mode and its been shown but not yet dismissed", buf, 0xCu);
      }

      [(ATXUserEducationSuggestionSleepMigrationServer *)self sendSuggestion:v6 withEventType:1];
    }
  }
  else if (v7)
  {
    [v4 atx_dndModeSemanticType];
    v10 = DNDModeSemanticTypeToString();
    *(_DWORD *)buf = 136315394;
    v37 = "-[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]";
    __int16 v38 = 2114;
    v39 = v10;
    v11 = "%s: Not processing mode change event because mode: %{public}@ is not Sleep";
    v12 = v6;
    uint32_t v13 = 22;
LABEL_29:
    _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    goto LABEL_30;
  }
LABEL_51:
}

void __74__ATXUserEducationSuggestionSleepMigrationServer__processModeChangeEvent___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 associatedModeUUIDs];
  id v4 = [*(id *)(a1 + 32) UUIDString];
  int v5 = [v3 containsObject:v4];

  if (v5) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (void)sendSuggestion:(id)a3 withEventType:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F4B3D8]) initWithUserEducationSuggestion:v6 userEducationSuggestionEventType:a4];
  int v8 = __atxlog_handle_context_user_education_suggestions();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    v11 = "-[ATXUserEducationSuggestionSleepMigrationServer sendSuggestion:withEventType:]";
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%s: Sending suggestion: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  int v9 = [(ATXUserEducationSuggestionConnector *)self->_connector remoteObjectProxy];
  [v9 didReceiveUserEducationSuggestionEvent:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenConfigCache, 0);
  objc_storeStrong((id *)&self->_installedSuggestedPagesTracker, 0);
  objc_storeStrong((id *)&self->_connector, 0);
}

- (void)_processModeChangeEvent:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]";
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "%s: Not showing user education suggestion because there was an error while trying to determine whether a suggested page was created during sleep migration.", (uint8_t *)&v1, 0xCu);
}

- (void)_processModeChangeEvent:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_12();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "%s: Not showing suggestion. Unable to get mode uuid from event %{public}@", (uint8_t *)v1, 0x16u);
}

- (void)_processModeChangeEvent:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_12();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "%s: Not showing suggestion because was unable to get configured home screen pages. Error: %{public}@", (uint8_t *)v1, 0x16u);
}

@end