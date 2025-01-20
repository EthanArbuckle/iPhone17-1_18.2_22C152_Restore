@interface ATXDefaultWidgetSuggesterClient
+ (BOOL)shouldSuggestTVWithAppLaunchCount:(double)a3 intentDonationCount:(double)a4 upcomingMediaCount:(double)a5;
- (ATXDefaultWidgetSuggesterClient)init;
- (void)defaultWidgetSuggestionOfType:(int64_t)a3 completionHandler:(id)a4;
- (void)logEventForDefaultWidgetSuggestionType:(int64_t)a3 event:(int64_t)a4;
@end

@implementation ATXDefaultWidgetSuggesterClient

- (ATXDefaultWidgetSuggesterClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXDefaultWidgetSuggesterClient;
  v2 = [(ATXDefaultWidgetSuggesterClient *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.proactive.DefaultWidgetSuggester" options:0];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    v5 = ATXDefaultWidgetSuggesterInterface();
    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:&__block_literal_global_66];
    [(NSXPCConnection *)v2->_xpcConnection resume];
  }
  return v2;
}

void __39__ATXDefaultWidgetSuggesterClient_init__block_invoke()
{
  v0 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __39__ATXDefaultWidgetSuggesterClient_init__block_invoke_cold_1();
  }
}

+ (BOOL)shouldSuggestTVWithAppLaunchCount:(double)a3 intentDonationCount:(double)a4 upcomingMediaCount:(double)a5
{
  return a5 >= 1.0 && a3 >= 3.0;
}

- (void)defaultWidgetSuggestionOfType:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3 == 1)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1CB18]);
    v8 = (void *)[v7 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    uint64_t v9 = [v8 integerForKey:*MEMORY[0x1E4F4B5F0]];
    if (v9 < 1)
    {
      v13 = [v8 objectForKey:*MEMORY[0x1E4F4B5A8]];
      v14 = [v8 objectForKey:*MEMORY[0x1E4F4B5B8]];
      uint64_t v15 = [v8 objectForKey:*MEMORY[0x1E4F4B5C0]];
      v16 = (void *)v15;
      if (v13) {
        BOOL v17 = v15 == 0;
      }
      else {
        BOOL v17 = 1;
      }
      if (v17 || v14 == 0)
      {
        v19 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A790D000, v19, OS_LOG_TYPE_DEFAULT, "ATXDefaultWidgetSuggesterClient: requesting full computation of TV widget suggstion", buf, 2u);
        }

        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke;
        v42[3] = &unk_1E5D08878;
        id v43 = v8;
        id v20 = v6;
        id v44 = v20;
        uint64_t v45 = 1;
        v21 = (void *)MEMORY[0x1AD0D3E40](v42);
        xpcConnection = self->_xpcConnection;
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke_19;
        v40[3] = &unk_1E5D04F50;
        id v23 = v21;
        id v41 = v23;
        v24 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v40];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke_21;
        v36[3] = &unk_1E5D088A0;
        id v37 = v23;
        id v38 = v20;
        uint64_t v39 = 1;
        id v25 = v23;
        [v24 shouldSuggestTVWithCompletionHandler:v36];
      }
      else
      {
        v26 = objc_opt_class();
        [v13 doubleValue];
        double v28 = v27;
        [v14 doubleValue];
        double v30 = v29;
        [v16 doubleValue];
        int v32 = [v26 shouldSuggestTVWithAppLaunchCount:v28 intentDonationCount:v30 upcomingMediaCount:v31];
        v33 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v47 = v32;
          *(_WORD *)&v47[4] = 2114;
          *(void *)&v47[6] = v13;
          __int16 v48 = 2114;
          v49 = v14;
          __int16 v50 = 2114;
          v51 = v16;
          _os_log_impl(&dword_1A790D000, v33, OS_LOG_TYPE_DEFAULT, "ATXDefaultWidgetSuggesterClient: returning TV widget suggestion (%{BOOL}d) using cached app launches: %{public}@, intent donations: %{public}@, upcoming media: %{public}@", buf, 0x26u);
        }

        if (v32)
        {
          v35 = [[ATXDefaultWidgetSuggestion alloc] initWithType:1];
          (*((void (**)(id, ATXDefaultWidgetSuggestion *))v6 + 2))(v6, v35);
        }
        else
        {
          (*((void (**)(id, void))v6 + 2))(v6, 0);
        }
      }
    }
    else
    {
      uint64_t v10 = v9;
      v11 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v47 = v10;
        _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "ATXDefaultWidgetSuggesterClient: not making a TV suggestion that we have feedback for: %ld", buf, 0xCu);
      }

      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
  else
  {
    v12 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[ATXDefaultWidgetSuggesterClient defaultWidgetSuggestionOfType:completionHandler:]();
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F4B5B0]];
  if (!v2)
  {
    v4 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      v8 = "ATXDefaultWidgetSuggesterClient: no cached AzulF key";
      uint64_t v9 = (uint8_t *)&v12;
LABEL_13:
      _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
LABEL_14:

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke_cold_1();
    }
    goto LABEL_14;
  }
  int v3 = [v2 BOOLValue];
  v4 = __atxlog_handle_home_screen();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v5)
    {
      __int16 v10 = 0;
      v8 = "ATXDefaultWidgetSuggesterClient: returning TV widget suggestion (NO) using cached AzulF BOOL";
      uint64_t v9 = (uint8_t *)&v10;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "ATXDefaultWidgetSuggesterClient: returning TV widget suggestion (YES) using cached AzulF BOOL", buf, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [[ATXDefaultWidgetSuggestion alloc] initWithType:*(void *)(a1 + 48)];
  (*(void (**)(uint64_t, ATXDefaultWidgetSuggestion *))(v6 + 16))(v6, v7);

LABEL_15:
}

void __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke_19_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke_21(void *a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = __atxlog_handle_home_screen();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke_21_cold_1((uint64_t)v5, v7);
    }

LABEL_9:
    (*(void (**)(void))(a1[4] + 16))();
    goto LABEL_10;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "ATXDefaultWidgetSuggesterClient: returning TV widget suggestion (%{BOOL}d) after full computation", (uint8_t *)v10, 8u);
  }

  if (!a2) {
    goto LABEL_9;
  }
  uint64_t v8 = a1[5];
  uint64_t v9 = [[ATXDefaultWidgetSuggestion alloc] initWithType:a1[6]];
  (*(void (**)(uint64_t, ATXDefaultWidgetSuggestion *))(v8 + 16))(v8, v9);

LABEL_10:
}

- (void)logEventForDefaultWidgetSuggestionType:(int64_t)a3 event:(int64_t)a4
{
  if (a3 == 1)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CB18]);
    id v10 = (id)[v5 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    [v10 setInteger:a4 forKey:*MEMORY[0x1E4F4B5F0]];
    if (a4 == 3)
    {
      uint64_t v6 = (uint64_t *)MEMORY[0x1E4F4B5E8];
    }
    else
    {
      if (a4 != 1)
      {
LABEL_11:

        return;
      }
      uint64_t v6 = (uint64_t *)MEMORY[0x1E4F4B5E0];
    }
    uint64_t v8 = *v6;
    uint64_t v9 = [v10 objectForKey:*v6];

    if (!v9)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      objc_msgSend(v10, "setDouble:forKey:", v8);
    }
    goto LABEL_11;
  }
  id v7 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    -[ATXDefaultWidgetSuggesterClient defaultWidgetSuggestionOfType:completionHandler:]();
  }
}

- (void).cxx_destruct
{
}

void __39__ATXDefaultWidgetSuggesterClient_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A790D000, v0, OS_LOG_TYPE_ERROR, "ATXDefaultWidgetSuggesterClient: connection to ATXDefaultWidgetSuggester server interrupted", v1, 2u);
}

- (void)defaultWidgetSuggestionOfType:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "ATXDefaultWidgetSuggesterClient: currently only the TV widget is supported", v2, v3, v4, v5, v6);
}

void __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "ATXDefaultWidgetSuggesterClient: the cached value is not of type NSNumber", v2, v3, v4, v5, v6);
}

void __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke_19_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "ATXDefaultWidgetSuggesterClient: XPC error; could not compute TV widget suggestion via duetexpertd: %@",
    (uint8_t *)&v2,
    0xCu);
}

void __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke_21_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "ATXDefaultWidgetSuggesterClient: could not compute TV widget suggestion via duetexpertd: %@", (uint8_t *)&v2, 0xCu);
}

@end