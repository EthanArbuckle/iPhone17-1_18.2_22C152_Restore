@interface ATXAppDirectoryServer
+ (id)sharedInstance;
- (ATXAppDirectoryServer)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)appLaunchDatesWithReply:(id)a3;
- (void)categoriesWithReply:(id)a3;
- (void)notifyBookmarksDidChange;
- (void)requestNotificationWhenCategoriesAreReady;
@end

@implementation ATXAppDirectoryServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_31 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_31, &__block_literal_global_176);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_41;
  return v2;
}

void __39__ATXAppDirectoryServer_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_41;
  sharedInstance__pasExprOnceResult_41 = v1;
}

- (ATXAppDirectoryServer)init
{
  v9.receiver = self;
  v9.super_class = (Class)ATXAppDirectoryServer;
  v2 = [(ATXAppDirectoryServer *)&v9 init];
  if (v2)
  {
    v3 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryServer launched", v8, 2u);
    }

    id v4 = objc_alloc(MEMORY[0x1E4F29290]);
    uint64_t v5 = [v4 initWithMachServiceName:*MEMORY[0x1E4F4B4B0]];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v5;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (void)categoriesWithReply:(id)a3
{
  id v3 = a3;
  id v4 = +[ATXAppDirectoryOrderingProvider sharedInstance];
  [v4 categoriesWithReply:v3];
}

- (void)appLaunchDatesWithReply:(id)a3
{
  id v3 = a3;
  id v4 = +[ATXAppDirectoryOrderingProvider sharedInstance];
  [v4 appLaunchDatesWithReply:v3];
}

- (void)notifyBookmarksDidChange
{
  id v2 = +[ATXAppDirectoryOrderingProvider sharedInstance];
  [v2 notifyBookmarksDidChange];
}

- (void)requestNotificationWhenCategoriesAreReady
{
  id v2 = +[ATXAppDirectoryOrderingProvider sharedInstance];
  [v2 requestNotificationWhenCategoriesAreReady];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryServer connection attempted", v13, 2u);
  }

  uint64_t v7 = *MEMORY[0x1E4F4B4B0];
  v8 = [v5 valueForEntitlement:*MEMORY[0x1E4F4B4B0]];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0 && ([v8 BOOLValue] & 1) != 0)
  {
    objc_super v9 = ATXAppDirectoryInterface();
    [v5 setExportedInterface:v9];

    [v5 setExportedObject:self];
    [v5 setInterruptionHandler:&__block_literal_global_19_1];
    [v5 setInvalidationHandler:&__block_literal_global_22_0];
    [v5 resume];
    BOOL v10 = 1;
  }
  else
  {
    v11 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXAppDirectoryServer listener:shouldAcceptNewConnection:]((uint64_t)v5, v7, v11);
    }

    BOOL v10 = 0;
  }

  return v10;
}

void __60__ATXAppDirectoryServer_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __60__ATXAppDirectoryServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0);
  }
}

void __60__ATXAppDirectoryServer_listener_shouldAcceptNewConnection___block_invoke_20()
{
  v0 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __60__ATXAppDirectoryServer_listener_shouldAcceptNewConnection___block_invoke_20_cold_1(v0);
  }
}

- (void).cxx_destruct
{
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXAppDirectoryServer: Rejecting connection %@ without entitlement %@", (uint8_t *)&v3, 0x16u);
}

void __60__ATXAppDirectoryServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXAppDirectoryServer: Unexpected interruption on App Directory interface", v1, 2u);
}

void __60__ATXAppDirectoryServer_listener_shouldAcceptNewConnection___block_invoke_20_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXAppDirectoryServer: Connection invalidated on App Directory interface. Client went away.", v1, 2u);
}

@end