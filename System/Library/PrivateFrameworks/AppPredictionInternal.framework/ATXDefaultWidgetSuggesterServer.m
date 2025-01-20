@interface ATXDefaultWidgetSuggesterServer
+ (id)sharedInstance;
- (ATXDefaultWidgetSuggesterServer)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)shouldSuggestTVWithCompletionHandler:(id)a3;
- (void)updateCachedValuesWithActivity:(id)a3;
@end

@implementation ATXDefaultWidgetSuggesterServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_39 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_39, &__block_literal_global_215);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_50;
  return v2;
}

void __49__ATXDefaultWidgetSuggesterServer_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_50;
  sharedInstance__pasExprOnceResult_50 = v1;
}

- (ATXDefaultWidgetSuggesterServer)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXDefaultWidgetSuggesterServer;
  v2 = [(ATXDefaultWidgetSuggesterServer *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29290]);
    uint64_t v4 = [v3 initWithMachServiceName:*MEMORY[0x1E4F4B4F8]];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F4B4F8];
  objc_super v7 = [v5 valueForEntitlement:*MEMORY[0x1E4F4B4F8]];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0 && ([v7 BOOLValue] & 1) != 0)
  {
    v8 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[ATXDefaultWidgetSuggesterServer listener:shouldAcceptNewConnection:](v8, v9, v10, v11, v12, v13, v14, v15);
    }

    v16 = ATXDefaultWidgetSuggesterInterface();
    [v5 setExportedInterface:v16];

    [v5 setExportedObject:self];
    [v5 setInterruptionHandler:&__block_literal_global_15_5];
    [v5 setInvalidationHandler:&__block_literal_global_18_4];
    [v5 resume];
    BOOL v17 = 1;
  }
  else
  {
    v18 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationDigestRankerServer listener:shouldAcceptNewConnection:]((uint64_t)v5, v6, v18);
    }

    BOOL v17 = 0;
  }

  return v17;
}

void __70__ATXDefaultWidgetSuggesterServer_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __70__ATXDefaultWidgetSuggesterServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

void __70__ATXDefaultWidgetSuggesterServer_listener_shouldAcceptNewConnection___block_invoke_16()
{
  v0 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __70__ATXDefaultWidgetSuggesterServer_listener_shouldAcceptNewConnection___block_invoke_16_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (void)shouldSuggestTVWithCompletionHandler:(id)a3
{
  uint64_t v3 = (void (**)(id, uint64_t, void))a3;
  uint64_t v4 = [ATXDefaultWidgetSuggester alloc];
  uint64_t v5 = +[_ATXAppLaunchHistogramManager sharedInstance];
  uint64_t v6 = [(ATXDefaultWidgetSuggester *)v4 initWithHistogramManager:v5];

  v3[2](v3, [(ATXDefaultWidgetSuggester *)v6 shouldSuggestTV], 0);
}

- (void)updateCachedValuesWithActivity:(id)a3
{
  if (([a3 didDefer] & 1) == 0)
  {
    uint64_t v3 = [ATXDefaultWidgetSuggester alloc];
    uint64_t v4 = +[_ATXAppLaunchHistogramManager sharedInstance];
    v22 = [(ATXDefaultWidgetSuggester *)v3 initWithHistogramManager:v4];

    [(ATXDefaultWidgetSuggester *)v22 upcomingMediaCountForTVApp];
    double v6 = v5;
    [(ATXDefaultWidgetSuggester *)v22 intentDonationCountForTVApp];
    double v8 = v7;
    [(ATXDefaultWidgetSuggester *)v22 appLaunchCountForTVApp];
    double v10 = v9;
    LODWORD(v4) = objc_msgSend(MEMORY[0x1E4F4AFB0], "shouldSuggestTVWithAppLaunchCount:intentDonationCount:upcomingMediaCount:");
    id v11 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v12 = (void *)[v11 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    uint64_t v13 = (void *)MEMORY[0x1E4F4AFB0];
    uint64_t v14 = *MEMORY[0x1E4F4B5A8];
    [v12 doubleForKey:*MEMORY[0x1E4F4B5A8]];
    double v16 = v15;
    uint64_t v17 = *MEMORY[0x1E4F4B5B8];
    [v12 doubleForKey:*MEMORY[0x1E4F4B5B8]];
    double v19 = v18;
    uint64_t v20 = *MEMORY[0x1E4F4B5C0];
    [v12 doubleForKey:*MEMORY[0x1E4F4B5C0]];
    LODWORD(v13) = [v13 shouldSuggestTVWithAppLaunchCount:v16 intentDonationCount:v19 upcomingMediaCount:v21];
    [v12 setDouble:v20 forKey:v6];
    [v12 setDouble:v17 forKey:v8];
    [v12 setDouble:v14 forKey:v10];
    if (v4 != v13) {
      notify_post((const char *)[(id)*MEMORY[0x1E4F4AD80] UTF8String]);
    }
  }
}

- (void).cxx_destruct
{
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __70__ATXDefaultWidgetSuggesterServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __70__ATXDefaultWidgetSuggesterServer_listener_shouldAcceptNewConnection___block_invoke_16_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end