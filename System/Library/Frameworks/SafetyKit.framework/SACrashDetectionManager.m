@interface SACrashDetectionManager
+ (BOOL)availableOverrideSetting;
+ (BOOL)isAvailable;
- (SAAuthorizationStatus)authorizationStatus;
- (SAClient)client;
- (SACrashDetectionManager)init;
- (id)delegate;
- (void)_appDidBecomeActive:(id)a3;
- (void)_callDelegateWithCrashEvent:(id)a3;
- (void)init;
- (void)requestAuthorizationWithCompletionHandler:(void *)handler;
- (void)setDelegate:(id)delegate;
- (void)updateMostRecentCrashDetectionEvent:(id)a3;
@end

@implementation SACrashDetectionManager

+ (BOOL)isAvailable
{
  if (!+[SAEntitlement currentProcessHasEntitlement:@"com.apple.developer.severe-vehicular-crash-event"])
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2 object:a1 file:@"SACrashDetectionManager.m" lineNumber:42 description:@"SafetyKit Crash Detection entitlement is required for this API"];
  }
  if (!+[SAGestalt isProductionFused]
    && +[SAGestalt isInternalBuild]
    && ([(id)objc_opt_class() availableOverrideSetting] & 1) != 0)
  {
    return 1;
  }

  return +[SAGestalt deviceSupportsKappa];
}

- (SACrashDetectionManager)init
{
  v21.receiver = self;
  v21.super_class = (Class)SACrashDetectionManager;
  v2 = [(SACrashDetectionManager *)&v21 init];
  if (v2)
  {
    v3 = sa_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      [(SACrashDetectionManager *)v3 init];
    }

    if ([(id)objc_opt_class() isAvailable])
    {
      v11 = [(SACrashDetectionManager *)v2 client];
      [v11 setCrashDetectionClientDelegate:v2];

      v12 = [MEMORY[0x263F08A00] defaultCenter];
      [v12 addObserver:v2 selector:sel__appDidBecomeActive_ name:@"UIApplicationDidBecomeActiveNotification" object:0];
    }
    else
    {
      v12 = sa_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(SACrashDetectionManager *)v12 init];
      }
    }
  }
  return v2;
}

- (SAAuthorizationStatus)authorizationStatus
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!+[SAEntitlement currentProcessHasEntitlement:@"com.apple.developer.severe-vehicular-crash-event"])
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SACrashDetectionManager.m" lineNumber:73 description:@"SafetyKit Crash Detection entitlement is required for this API"];
  }
  if ([(id)objc_opt_class() isAvailable])
  {
    uint64_t v4 = TCCAccessPreflight();
    return +[SAAuthorization authorizationStatusWithTCCPreflightResult:v4];
  }
  else
  {
    uint64_t v6 = sa_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[SACrashDetectionManager authorizationStatus]";
      _os_log_impl(&dword_245182000, v6, OS_LOG_TYPE_DEFAULT, "%s - Manager is unavailable, returning SAAuthorizationStatusDenied", (uint8_t *)&v8, 0xCu);
    }

    return 1;
  }
}

- (void)setDelegate:(id)delegate
{
  id v5 = delegate;
  if (!+[SAEntitlement currentProcessHasEntitlement:@"com.apple.developer.severe-vehicular-crash-event"])
  {
    uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"SACrashDetectionManager.m" lineNumber:87 description:@"SafetyKit Crash Detection entitlement is required to use this API"];
  }
  char v6 = [(id)objc_opt_class() isAvailable];
  uint64_t v7 = sa_default_log();
  int v8 = v7;
  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SACrashDetectionManager setDelegate:](v8, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SACrashDetectionManager setDelegate:]();
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained != v5)
  {
    objc_storeWeak((id *)&self->_delegate, v5);
    int v8 = [(SACrashDetectionManager *)self client];
    [v8 requestMostRecentCrashDetectionEvent];
LABEL_10:
  }
}

- (void)requestAuthorizationWithCompletionHandler:(void *)handler
{
  id v5 = handler;
  if (!+[SAEntitlement currentProcessHasEntitlement:@"com.apple.developer.severe-vehicular-crash-event"])
  {
    v37 = [MEMORY[0x263F08690] currentHandler];
    [v37 handleFailureInMethod:a2 object:self file:@"SACrashDetectionManager.m" lineNumber:102 description:@"SafetyKit Crash Detection entitlement is required to use this API"];
  }
  char v6 = sa_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SACrashDetectionManager requestAuthorizationWithCompletionHandler:].cold.5(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  if ([(id)objc_opt_class() isAvailable])
  {
    int64_t v14 = +[SAAuthorization authorizationStatusWithTCCPreflightResult:TCCAccessPreflight()];
    if (v14 == 2)
    {
      v5[2](v5, 2, 0);
      uint64_t v15 = sa_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[SACrashDetectionManager requestAuthorizationWithCompletionHandler:](v15, v16, v17, v18, v19, v20, v21, v22);
      }
LABEL_16:

      goto LABEL_20;
    }
    uint64_t v31 = v14;
    v32 = [MEMORY[0x263F1C408] sharedApplication];
    uint64_t v33 = [v32 applicationState];

    v34 = sa_default_log();
    v35 = v34;
    if (v33 == 2)
    {
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[SACrashDetectionManager requestAuthorizationWithCompletionHandler:](v31, v35);
      }

      uint64_t v15 = +[SAError errorWithCode:4];
      ((void (**)(void *, uint64_t, NSObject *))v5)[2](v5, v31, v15);
      goto LABEL_16;
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      -[SACrashDetectionManager requestAuthorizationWithCompletionHandler:]();
    }

    v36 = [(SACrashDetectionManager *)self client];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __69__SACrashDetectionManager_requestAuthorizationWithCompletionHandler___block_invoke;
    v38[3] = &unk_2651C9628;
    v38[4] = self;
    v39 = v5;
    [v36 requestCrashDetectionAuthorization:v38];
  }
  else
  {
    v23 = sa_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[SACrashDetectionManager requestAuthorizationWithCompletionHandler:].cold.4(v23, v24, v25, v26, v27, v28, v29, v30);
    }

    v5[2](v5, 1, 0);
  }
LABEL_20:
}

void __69__SACrashDetectionManager_requestAuthorizationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  char v6 = sa_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __69__SACrashDetectionManager_requestAuthorizationWithCompletionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (a2 == 2)
  {
    uint64_t v7 = [*(id *)(a1 + 32) client];
    [v7 requestMostRecentCrashDetectionEvent];
  }
}

+ (BOOL)availableOverrideSetting
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 valueForKey:@"SACrashDetectionManagerAvailable"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (SAClient)client
{
  return +[SAClient sharedInstance];
}

- (void)_appDidBecomeActive:(id)a3
{
  char v4 = sa_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SACrashDetectionManager _appDidBecomeActive:](v4, v5, v6, v7, v8, v9, v10, v11);
  }

  uint64_t v12 = [(SACrashDetectionManager *)self client];
  [v12 requestMostRecentCrashDetectionEvent];
}

- (void)_callDelegateWithCrashEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sa_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SACrashDetectionManager _callDelegateWithCrashEvent:]();
  }

  uint64_t v6 = [(SACrashDetectionManager *)self delegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 crashDetectionManager:self didDetectEvent:v4];
  }
}

- (void)updateMostRecentCrashDetectionEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sa_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SACrashDetectionManager updateMostRecentCrashDetectionEvent:]();
  }

  [(SACrashDetectionManager *)self _callDelegateWithCrashEvent:v4];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void).cxx_destruct
{
}

- (void)init
{
}

- (void)setDelegate:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_245182000, v0, v1, "%s, %@", v2, v3, v4, v5, 2u);
}

- (void)setDelegate:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)requestAuthorizationWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)requestAuthorizationWithCompletionHandler:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = [MEMORY[0x263F1C408] sharedApplication];
  int v5 = 136315650;
  uint64_t v6 = "-[SACrashDetectionManager requestAuthorizationWithCompletionHandler:]";
  __int16 v7 = 2048;
  uint64_t v8 = a1;
  __int16 v9 = 2048;
  uint64_t v10 = [v4 applicationState];
  _os_log_error_impl(&dword_245182000, a2, OS_LOG_TYPE_ERROR, "%s - Application not in foreground, not requesting authorization, status: %lu, application: %lu", (uint8_t *)&v5, 0x20u);
}

- (void)requestAuthorizationWithCompletionHandler:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_245182000, v0, v1, "%s - Requesting authorization from server, currentStatus: %lu", v2, v3, v4, v5, 2u);
}

- (void)requestAuthorizationWithCompletionHandler:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)requestAuthorizationWithCompletionHandler:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __69__SACrashDetectionManager_requestAuthorizationWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_245182000, v0, v1, "%s - Authorization requested from server, newStatus: %lu", v2, v3, v4, v5, 2u);
}

- (void)_appDidBecomeActive:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_callDelegateWithCrashEvent:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_245182000, v0, v1, "%s, crashEvent: %@", v2, v3, v4, v5, 2u);
}

- (void)updateMostRecentCrashDetectionEvent:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_245182000, v0, v1, "%s, event: %@", v2, v3, v4, v5, 2u);
}

@end