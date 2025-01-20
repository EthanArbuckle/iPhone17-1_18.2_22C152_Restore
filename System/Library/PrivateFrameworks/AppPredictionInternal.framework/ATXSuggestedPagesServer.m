@interface ATXSuggestedPagesServer
+ (id)sharedInstance;
- (ATXSuggestedPagesServer)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (int64_t)_fetchPageTypeForModeUUID:(id)a3;
- (void)prewarmCachedSuggestedPagesWithActivity:(id)a3;
- (void)suggestedPagesWithFilter:(id)a3 layoutOptions:(id)a4 completionHandler:(id)a5;
- (void)updateSuggestedPagesWithCompletionHandler:(id)a3;
@end

@implementation ATXSuggestedPagesServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_11 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_11, &__block_literal_global_85);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_14;
  return v2;
}

void __41__ATXSuggestedPagesServer_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_14;
  sharedInstance__pasExprOnceResult_14 = v1;
}

- (ATXSuggestedPagesServer)init
{
  v14.receiver = self;
  v14.super_class = (Class)ATXSuggestedPagesServer;
  v2 = [(ATXSuggestedPagesServer *)&v14 init];
  if (v2)
  {
    v3 = __atxlog_handle_modes();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "ATXSuggestedPagesServer: launched", v13, 2u);
    }

    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.proactive.SuggestedPages"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    uint64_t v6 = objc_opt_new();
    uninstallNotification = v2->_uninstallNotification;
    v2->_uninstallNotification = (_ATXInternalUninstallNotification *)v6;

    [(_ATXInternalUninstallNotification *)v2->_uninstallNotification registerForNotificationsWithUninstallBlock:&__block_literal_global_18_0];
    uint64_t v8 = objc_opt_new();
    lockedOrHiddenAppNotification = v2->_lockedOrHiddenAppNotification;
    v2->_lockedOrHiddenAppNotification = (ATXInternalLockedOrHiddenAppNotification *)v8;

    [(ATXInternalLockedOrHiddenAppNotification *)v2->_lockedOrHiddenAppNotification registerForNotificationsWithLockedOrHiddenAppBlock:&__block_literal_global_23_0];
    uint64_t v10 = objc_opt_new();
    unlockedOrUnhiddenAppNotification = v2->_unlockedOrUnhiddenAppNotification;
    v2->_unlockedOrUnhiddenAppNotification = (ATXInternalUnLockedOrUnHiddenAppNotification *)v10;

    [(ATXInternalUnLockedOrUnHiddenAppNotification *)v2->_unlockedOrUnhiddenAppNotification registerForNotificationsWithUnLockedOrUnHiddenAppBlock:&__block_literal_global_27];
  }
  return v2;
}

void __31__ATXSuggestedPagesServer_init__block_invoke()
{
  id v0 = (id)objc_opt_new();
  [v0 evictCachedSuggestedPages];
}

void __31__ATXSuggestedPagesServer_init__block_invoke_2()
{
  id v0 = (id)objc_opt_new();
  [v0 evictCachedSuggestedPages];
}

void __31__ATXSuggestedPagesServer_init__block_invoke_3()
{
  id v0 = (id)objc_opt_new();
  [v0 evictCachedSuggestedPages];
}

- (void)suggestedPagesWithFilter:(id)a3 layoutOptions:(id)a4 completionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)os_transaction_create();
  if ([v8 pageType] == 2 || !objc_msgSend(v8, "pageType"))
  {
    v13 = [v8 modeUUID];

    if (!v13)
    {
LABEL_10:
      (*((void (**)(id, void, void))v10 + 2))(v10, MEMORY[0x1E4F1CBF0], 0);
      goto LABEL_11;
    }
    objc_super v14 = __atxlog_handle_modes();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "ATXSuggestedPagesServer: looking up mode type via DND", (uint8_t *)&v25, 2u);
    }

    v15 = [v8 modeUUID];
    unint64_t v12 = [(ATXSuggestedPagesServer *)self _fetchPageTypeForModeUUID:v15];
  }
  else
  {
    unint64_t v12 = [v8 pageType];
  }
  if (v12 < 4 || v12 == 12) {
    goto LABEL_10;
  }
  v16 = objc_opt_new();
  v17 = [v16 cachedSuggestedPagesForPageType:v12];
  uint64_t v18 = [v17 count];
  v19 = __atxlog_handle_modes();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v20)
    {
      v21 = NSStringFromATXSuggestedPageType();
      int v25 = 138543362;
      v26 = v21;
      _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "ATXSuggestedPagesServer: using cached pages for page type: %{public}@", (uint8_t *)&v25, 0xCu);
    }
    (*((void (**)(id, void *, void))v10 + 2))(v10, v17, 0);
  }
  else
  {
    if (v20)
    {
      v22 = NSStringFromATXSuggestedPageType();
      int v25 = 138543362;
      v26 = v22;
      _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "ATXSuggestedPagesServer: generating pages for page type: %{public}@", (uint8_t *)&v25, 0xCu);
    }
    v23 = objc_opt_new();
    v24 = [v23 generateSuggestedPagesForPageType:v12 layoutOptions:v9];
    [v16 cacheSuggestedPages:v24 forPageType:v12];
    (*((void (**)(id, void *, void))v10 + 2))(v10, v24, 0);
  }
LABEL_11:
}

- (void)updateSuggestedPagesWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  [(ATXSuggestedPagesServer *)self prewarmCachedSuggestedPagesWithActivity:0];
  v4[2](v4, 0);
}

- (void)prewarmCachedSuggestedPagesWithActivity:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)os_transaction_create();
  v5 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  v7 = objc_opt_new();
  uint64_t v8 = 4;
  while (1)
  {
    id v9 = (void *)MEMORY[0x1D25F6CC0]();
    if ([v3 didDefer]) {
      break;
    }
    id v10 = [v5 generateSuggestedPagesForPageType:v8 layoutOptions:v6];
    [v7 cacheSuggestedPages:v10 forPageType:v8];

    if (++v8 == 13) {
      goto LABEL_8;
    }
  }
  v11 = __atxlog_handle_modes();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    uint64_t v13 = v8;
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "Deferred caching suggested pages before processing: %ld", (uint8_t *)&v12, 0xCu);
  }

LABEL_8:
}

- (int64_t)_fetchPageTypeForModeUUID:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F4AF78];
  id v4 = a3;
  v5 = [v3 sharedInstance];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];

  v7 = [v5 dndModeForDNDModeWithUUID:v6];

  if (!v7)
  {
LABEL_7:
    int64_t v9 = 1;
    goto LABEL_8;
  }
  uint64_t v8 = [v7 semanticType];
  if ((unint64_t)(v8 + 1) >= 0xB)
  {
    id v10 = __atxlog_handle_modes();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[ATXSuggestedPagesServer _fetchPageTypeForModeUUID:](v7, v10);
    }

    goto LABEL_7;
  }
  int64_t v9 = v8 + 3;
LABEL_8:

  return v9;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = __atxlog_handle_modes();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v12 = 0;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "ATXSuggestedPagesServer: connection attempted", v12, 2u);
  }

  v7 = [v5 valueForEntitlement:@"com.apple.proactive.SuggestedPages"];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0 && ([v7 BOOLValue] & 1) != 0)
  {
    uint64_t v8 = ATXSuggestedPagesInterface();
    [v5 setExportedInterface:v8];

    [v5 setExportedObject:self];
    [v5 setInterruptionHandler:&__block_literal_global_37];
    [v5 setInvalidationHandler:&__block_literal_global_40_1];
    [v5 resume];
    BOOL v9 = 1;
  }
  else
  {
    id v10 = __atxlog_handle_modes();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXSuggestedPagesServer listener:shouldAcceptNewConnection:]((uint64_t)v5, v10);
    }

    BOOL v9 = 0;
  }

  return v9;
}

void __62__ATXSuggestedPagesServer_listener_shouldAcceptNewConnection___block_invoke()
{
  id v0 = __atxlog_handle_modes();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __62__ATXSuggestedPagesServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0);
  }
}

void __62__ATXSuggestedPagesServer_listener_shouldAcceptNewConnection___block_invoke_38()
{
  id v0 = __atxlog_handle_modes();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __62__ATXSuggestedPagesServer_listener_shouldAcceptNewConnection___block_invoke_38_cold_1(v0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockedOrUnhiddenAppNotification, 0);
  objc_storeStrong((id *)&self->_lockedOrHiddenAppNotification, 0);
  objc_storeStrong((id *)&self->_uninstallNotification, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)_fetchPageTypeForModeUUID:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 semanticType];
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "fetchPageTypeForModeUUID: unhandled type: %ld", (uint8_t *)&v3, 0xCu);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = @"com.apple.proactive.SuggestedPages";
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXSuggestedPagesServer: rejecting connection %@ without entitlement %@", (uint8_t *)&v2, 0x16u);
}

void __62__ATXSuggestedPagesServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXSuggestedPagesServer: interruption", v1, 2u);
}

void __62__ATXSuggestedPagesServer_listener_shouldAcceptNewConnection___block_invoke_38_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXSuggestedPagesServer: invalidated", v1, 2u);
}

@end