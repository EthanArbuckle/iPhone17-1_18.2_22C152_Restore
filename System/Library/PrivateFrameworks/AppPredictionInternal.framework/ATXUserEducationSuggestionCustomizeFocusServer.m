@interface ATXUserEducationSuggestionCustomizeFocusServer
- (ATXUserEducationSuggestionCustomizeFocusServer)initWithConnector:(id)a3;
- (void)_processModeChangeEvent:(id)a3;
- (void)dealloc;
- (void)processModeChangeEvent:(id)a3;
- (void)sendSuggestion:(id)a3 eventType:(unint64_t)a4;
@end

@implementation ATXUserEducationSuggestionCustomizeFocusServer

- (ATXUserEducationSuggestionCustomizeFocusServer)initWithConnector:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXUserEducationSuggestionCustomizeFocusServer;
  v6 = [(ATXUserEducationSuggestionBaseServer *)&v12 init];
  if (v6)
  {
    v7 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[ATXUserEducationSuggestionCustomizeFocusServer initWithConnector:]";
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%s: starting server", buf, 0xCu);
    }

    uint64_t v8 = [MEMORY[0x1E4F4AF78] sharedInstance];
    modeConfigurationClient = v6->_modeConfigurationClient;
    v6->_modeConfigurationClient = (ATXDNDModeConfigurationClient *)v8;

    objc_storeStrong((id *)&v6->_connector, a3);
    v10 = +[ATXUserEducationSuggestionModeChangeNotifier sharedInstance];
    [v10 registerObserver:v6];
  }
  return v6;
}

- (void)dealloc
{
  v3 = +[ATXUserEducationSuggestionModeChangeNotifier sharedInstance];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ATXUserEducationSuggestionCustomizeFocusServer;
  [(ATXUserEducationSuggestionCustomizeFocusServer *)&v4 dealloc];
}

- (void)processModeChangeEvent:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__ATXUserEducationSuggestionCustomizeFocusServer_processModeChangeEvent___block_invoke;
  v6[3] = &unk_1E68AB870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ATXUserEducationSuggestionBaseServer *)self performBlockOnInternalSerialQueue:v6];
}

uint64_t __73__ATXUserEducationSuggestionCustomizeFocusServer_processModeChangeEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processModeChangeEvent:*(void *)(a1 + 40)];
}

- (void)_processModeChangeEvent:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "atx_dndModeSemanticType");
  DNDModeSemanticTypeToString();
  v6 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  char v7 = [MEMORY[0x1E4F4B3D0] suggestionsAreSupportedForModeSemanticType:v5];
  uint64_t v8 = __atxlog_handle_context_user_education_suggestions();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%s: processing new userFocusComputedModeEvent: %{public}@", buf, 0x16u);
    }

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F4B3D0]) initWithModeSemanticType:v5];
    int v10 = [v8 suggestionWasAlreadyShown];
    int v11 = [v8 suggestionWasAlreadyDismissed];
    if ([v4 starting])
    {
      if (v10)
      {
        objc_super v12 = __atxlog_handle_context_user_education_suggestions();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v6;
          _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "%s: Not showing user education suggestion because it was already shown in mode: %@", buf, 0x16u);
        }
LABEL_33:

        goto LABEL_54;
      }
      if ([v4 updateSource] != 1)
      {
        objc_super v12 = __atxlog_handle_context_user_education_suggestions();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]";
          _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "%s: Not showing user education suggestion because mode update source wasn't local.", buf, 0xCu);
        }
        goto LABEL_33;
      }
      id v14 = objc_alloc(MEMORY[0x1E4F29128]);
      uint64_t v15 = [v4 mode];
      v16 = (void *)[v14 initWithUUIDString:v15];

      if (!v16)
      {
        v18 = __atxlog_handle_context_user_education_suggestions();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]();
        }
        goto LABEL_53;
      }
      v17 = [(ATXDNDModeConfigurationClient *)self->_modeConfigurationClient modeConfigurationForDNDModeWithUUID:v16 useCache:0];
      v18 = v17;
      if (v17)
      {
        v19 = [v17 configuration];
        if ([v19 applicationConfigurationType] == 2)
        {
          v20 = [v18 configuration];
          BOOL v21 = [v20 senderConfigurationType] == 2;

          if (v21)
          {
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v44 = __Block_byref_object_copy__58;
            v45 = __Block_byref_object_dispose__58;
            id v46 = 0;
            dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
            getPRSServiceClass();
            v23 = objc_opt_new();
            v33[0] = MEMORY[0x1E4F143A8];
            v33[1] = 3221225472;
            v33[2] = __74__ATXUserEducationSuggestionCustomizeFocusServer__processModeChangeEvent___block_invoke;
            v33[3] = &unk_1E68B2200;
            v24 = v22;
            v34 = v24;
            id v25 = v23;
            id v35 = v25;
            v36 = buf;
            [v25 fetchActiveConfiguration:v33];
            if ([MEMORY[0x1E4F93B18] waitForSemaphore:v24 timeoutSeconds:5.0] == 1)
            {
              v26 = __atxlog_handle_context_user_education_suggestions();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                -[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]();
              }
              goto LABEL_51;
            }
            if (*(void *)(*(void *)&buf[8] + 40))
            {
              if (objc_msgSend(v16, "isEqual:"))
              {
                [(ATXUserEducationSuggestionCustomizeFocusServer *)self sendSuggestion:v8 eventType:0];
LABEL_52:

                _Block_object_dispose(buf, 8);
                goto LABEL_53;
              }
              v26 = __atxlog_handle_context_user_education_suggestions();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v32 = *(void *)(*(void *)&buf[8] + 40);
                *(_DWORD *)v37 = 136315650;
                v38 = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]";
                __int16 v39 = 2112;
                v40 = v16;
                __int16 v41 = 2112;
                uint64_t v42 = v32;
                v29 = "%s: Not showing user education suggestion because current mode: %@ is not equal to the poster's linked mode: %@.";
                v30 = v26;
                uint32_t v31 = 32;
                goto LABEL_50;
              }
            }
            else
            {
              v26 = __atxlog_handle_context_user_education_suggestions();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v37 = 136315138;
                v38 = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]";
                v29 = "%s: Not showing user education suggestion because current poster is not linked to a mode.";
                v30 = v26;
                uint32_t v31 = 12;
LABEL_50:
                _os_log_impl(&dword_1D0FA3000, v30, OS_LOG_TYPE_DEFAULT, v29, v37, v31);
              }
            }
LABEL_51:

            goto LABEL_52;
          }
        }
        else
        {
        }
        v28 = __atxlog_handle_context_user_education_suggestions();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]";
          _os_log_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_DEFAULT, "%s: Not showing user education suggestion because current mode is not toothless.", buf, 0xCu);
        }
      }
      else
      {
        v28 = __atxlog_handle_context_user_education_suggestions();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]();
        }
      }

LABEL_53:
      goto LABEL_54;
    }
    if ((v10 ^ 1 | v11))
    {
      if ((v10 & 1) == 0)
      {
        objc_super v12 = __atxlog_handle_context_user_education_suggestions();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]";
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v6;
          _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "%s: Not dismissing suggestion for mode %{public}@ because it hasn't been shown yet.", buf, 0x16u);
        }
        goto LABEL_33;
      }
      if (v11)
      {
        objc_super v12 = __atxlog_handle_context_user_education_suggestions();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]";
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v6;
          _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "%s: Not dismissing suggestion for mode %{public}@ because it has already been dismissed.", buf, 0x16u);
        }
        goto LABEL_33;
      }
    }
    else
    {
      v27 = __atxlog_handle_context_user_education_suggestions();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2114;
        v44 = v6;
        _os_log_impl(&dword_1D0FA3000, v27, OS_LOG_TYPE_DEFAULT, "%s: Dismissing suggestion for mode %{public}@ because we're exiting %{public}@ mode and its been shown but not yet dismissed", buf, 0x20u);
      }

      [(ATXUserEducationSuggestionCustomizeFocusServer *)self sendSuggestion:v8 eventType:1];
    }
  }
  else if (v9)
  {
    v13 = [MEMORY[0x1E4F4B3D0] supportedModeSemanticTypeStrings];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    v44 = v13;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%s: Not processing mode change event because mode: %{public}@ is not in the supported modes: %{public}@", buf, 0x20u);
  }
LABEL_54:
}

void __74__ATXUserEducationSuggestionCustomizeFocusServer__processModeChangeEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74__ATXUserEducationSuggestionCustomizeFocusServer__processModeChangeEvent___block_invoke_16;
    v8[3] = &unk_1E68B21D8;
    v6 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 32);
    [v6 fetchFocusUUIDForConfiguration:a2 completion:v8];
  }
  else
  {
    char v7 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      objc_super v12 = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]_block_invoke";
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to fetch poster configuration. Error: %{public}@", buf, 0x16u);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void __74__ATXUserEducationSuggestionCustomizeFocusServer__processModeChangeEvent___block_invoke_16(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)sendSuggestion:(id)a3 eventType:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = (void *)[objc_alloc(MEMORY[0x1E4F4B3D8]) initWithUserEducationSuggestion:v6 userEducationSuggestionEventType:a4];
  uint64_t v8 = __atxlog_handle_context_user_education_suggestions();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    int v11 = "-[ATXUserEducationSuggestionCustomizeFocusServer sendSuggestion:eventType:]";
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%s: Sending suggestion: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = [(ATXUserEducationSuggestionConnector *)self->_connector remoteObjectProxy];
  [v9 didReceiveUserEducationSuggestionEvent:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeConfigurationClient, 0);
  objc_storeStrong((id *)&self->_connector, 0);
}

- (void)_processModeChangeEvent:.cold.1()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "%s: Not showing suggestion. Unable to get mode uuid from event %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_processModeChangeEvent:.cold.2()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "%s: unable to get mode configuration for current mode uuid: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_processModeChangeEvent:.cold.3()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "%s: Timed out querying for focus mode UUID associated with the current mode: %{public}@", v2, v3, v4, v5, 2u);
}

@end