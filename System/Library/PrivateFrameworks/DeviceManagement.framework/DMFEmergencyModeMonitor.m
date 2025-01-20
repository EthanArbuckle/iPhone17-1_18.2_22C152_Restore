@interface DMFEmergencyModeMonitor
+ (DMFEmergencyModeMonitor)sharedMonitor;
+ (id)remoteInterface;
- (BOOL)disableEmergencyModeWithError:(id *)a3;
- (BOOL)enableEmergencyModeForDuration:(double)a3 withError:(id *)a4;
- (BOOL)enableEmergencyModeWithError:(id *)a3;
- (DMFEmergencyModeMonitor)init;
- (DMFEmergencyModeMonitor)initWithXPCConnection:(id)a3;
- (NSXPCConnection)xpcConnection;
- (id)emergencyModeStatusWithError:(id *)a3;
- (void)dealloc;
- (void)emergencyModeStatusWithCompletionHandler:(id)a3;
@end

@implementation DMFEmergencyModeMonitor

uint64_t __42__DMFEmergencyModeMonitor_remoteInterface__block_invoke()
{
  remoteInterface_remoteInterface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F18B5818];
  return MEMORY[0x1F41817F8]();
}

- (DMFEmergencyModeMonitor)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.dmd.emergency-mode" options:4096];
  v4 = [(DMFEmergencyModeMonitor *)self initWithXPCConnection:v3];

  return v4;
}

void __68__DMFEmergencyModeMonitor_emergencyModeStatusWithCompletionHandler___block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = v5;
    [v7 doubleValue];
    if (v8 <= 0.0)
    {
      [v7 doubleValue];
      double v13 = v12;
      v9 = DMFEmergencyModeLog();
      BOOL v14 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v13 >= 0.0)
      {
        if (v14)
        {
          LOWORD(v17) = 0;
          v10 = "Emergency Mode is disabled";
          v15 = v9;
          uint32_t v16 = 2;
          goto LABEL_14;
        }
      }
      else if (v14)
      {
        int v17 = 138543362;
        id v18 = v7;
        v10 = "Emergency Mode was disabled %{public}@ seconds ago";
        goto LABEL_11;
      }
    }
    else
    {
      v9 = DMFEmergencyModeLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543362;
        id v18 = v7;
        v10 = "Emergency Mode is enabled for %{public}@ more seconds";
LABEL_11:
        v15 = v9;
        uint32_t v16 = 12;
LABEL_14:
        _os_log_impl(&dword_1BE0E2000, v15, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v16);
      }
    }

    (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v7);
    goto LABEL_16;
  }
  v11 = DMFEmergencyModeLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    __56__DMFEmergencyModeMonitor_emergencyModeStatusWithError___block_invoke_65_cold_1();
  }

  (*(void (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0);
LABEL_16:
}

- (void)emergencyModeStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(DMFEmergencyModeMonitor *)self xpcConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__DMFEmergencyModeMonitor_emergencyModeStatusWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E6372AA0;
  id v6 = v4;
  id v12 = v6;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v11];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__DMFEmergencyModeMonitor_emergencyModeStatusWithCompletionHandler___block_invoke_67;
  v9[3] = &unk_1E6372AC8;
  id v10 = v6;
  id v8 = v6;
  [v7 emergencyModeStatusWithCompletionHandler:v9];
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (DMFEmergencyModeMonitor)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFEmergencyModeMonitor;
  id v6 = [(DMFEmergencyModeMonitor *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    id v8 = +[DMFEmergencyModeMonitor remoteInterface];
    [(NSXPCConnection *)v7->_xpcConnection setRemoteObjectInterface:v8];

    [(NSXPCConnection *)v7->_xpcConnection resume];
  }

  return v7;
}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken != -1) {
    dispatch_once(&remoteInterface_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)remoteInterface_remoteInterface;
  return v2;
}

+ (DMFEmergencyModeMonitor)sharedMonitor
{
  if (sharedMonitor_onceToken != -1) {
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedMonitor_emergencyModeMonitor;
  return (DMFEmergencyModeMonitor *)v2;
}

uint64_t __40__DMFEmergencyModeMonitor_sharedMonitor__block_invoke()
{
  sharedMonitor_emergencyModeMonitor = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)DMFEmergencyModeMonitor;
  [(DMFEmergencyModeMonitor *)&v3 dealloc];
}

- (BOOL)enableEmergencyModeWithError:(id *)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = __Block_byref_object_copy__0;
  BOOL v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  id v4 = [(DMFEmergencyModeMonitor *)self xpcConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke;
  v9[3] = &unk_1E6372A28;
  void v9[4] = &v10;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v9];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke_62;
  v8[3] = &unk_1E6372A28;
  v8[4] = &v10;
  [v5 enableEmergencyModeWithCompletionHandler:v8];
  if (a3) {
    *a3 = (id) v11[5];
  }
  BOOL v6 = v11[5] == 0;

  _Block_object_dispose(&v10, 8);
  return v6;
}

void __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DMFEmergencyModeLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke_62(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DMFEmergencyModeLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke_62_cold_1();
    }

    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = v3;
    uint64_t v5 = *(NSObject **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1BE0E2000, v5, OS_LOG_TYPE_DEFAULT, "Emergency Mode enabled", v8, 2u);
  }
}

- (BOOL)enableEmergencyModeForDuration:(double)a3 withError:(id *)a4
{
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__0;
  uint32_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  uint64_t v6 = [(DMFEmergencyModeMonitor *)self xpcConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__DMFEmergencyModeMonitor_enableEmergencyModeForDuration_withError___block_invoke;
  v11[3] = &unk_1E6372A28;
  void v11[4] = &v12;
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v11];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__DMFEmergencyModeMonitor_enableEmergencyModeForDuration_withError___block_invoke_63;
  v10[3] = &unk_1E6372A50;
  *(double *)&v10[5] = a3;
  v10[4] = &v12;
  [v7 enableEmergencyModeForDuration:v10 withCompletionHandler:a3];
  if (a4) {
    *a4 = (id) v13[5];
  }
  BOOL v8 = v13[5] == 0;

  _Block_object_dispose(&v12, 8);
  return v8;
}

void __68__DMFEmergencyModeMonitor_enableEmergencyModeForDuration_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DMFEmergencyModeLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __68__DMFEmergencyModeMonitor_enableEmergencyModeForDuration_withError___block_invoke_63(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = DMFEmergencyModeLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __68__DMFEmergencyModeMonitor_enableEmergencyModeForDuration_withError___block_invoke_63_cold_1(a1, (uint64_t)v3, v5);
    }

    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = v3;
    uint64_t v5 = *(NSObject **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 134217984;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1BE0E2000, v5, OS_LOG_TYPE_DEFAULT, "Emergency Mode enabled for duration %f", (uint8_t *)&v9, 0xCu);
  }
}

- (BOOL)disableEmergencyModeWithError:(id *)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = __Block_byref_object_copy__0;
  uint64_t v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  id v4 = [(DMFEmergencyModeMonitor *)self xpcConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__DMFEmergencyModeMonitor_disableEmergencyModeWithError___block_invoke;
  v9[3] = &unk_1E6372A28;
  void v9[4] = &v10;
  uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v9];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__DMFEmergencyModeMonitor_disableEmergencyModeWithError___block_invoke_64;
  v8[3] = &unk_1E6372A28;
  v8[4] = &v10;
  [v5 disableEmergencyModeWithCompletionHandler:v8];
  if (a3) {
    *a3 = (id) v11[5];
  }
  BOOL v6 = v11[5] == 0;

  _Block_object_dispose(&v10, 8);
  return v6;
}

void __57__DMFEmergencyModeMonitor_disableEmergencyModeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DMFEmergencyModeLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __57__DMFEmergencyModeMonitor_disableEmergencyModeWithError___block_invoke_64(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DMFEmergencyModeLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __57__DMFEmergencyModeMonitor_disableEmergencyModeWithError___block_invoke_64_cold_1();
    }

    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = v3;
    uint64_t v5 = *(NSObject **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1BE0E2000, v5, OS_LOG_TYPE_DEFAULT, "Emergency Mode disabled", v8, 2u);
  }
}

- (id)emergencyModeStatusWithError:(id *)a3
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = __Block_byref_object_copy__0;
  uint64_t v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  id v4 = [(DMFEmergencyModeMonitor *)self xpcConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__DMFEmergencyModeMonitor_emergencyModeStatusWithError___block_invoke;
  v9[3] = &unk_1E6372A28;
  void v9[4] = &v16;
  uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v9];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__DMFEmergencyModeMonitor_emergencyModeStatusWithError___block_invoke_65;
  v8[3] = &unk_1E6372A78;
  v8[4] = &v16;
  void v8[5] = &v10;
  [v5 emergencyModeStatusWithCompletionHandler:v8];
  if (a3) {
    *a3 = (id) v17[5];
  }
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);

  return v6;
}

void __56__DMFEmergencyModeMonitor_emergencyModeStatusWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DMFEmergencyModeLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __56__DMFEmergencyModeMonitor_emergencyModeStatusWithError___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = v5;
    [v7 doubleValue];
    if (v8 <= 0.0)
    {
      [v7 doubleValue];
      double v14 = v13;
      int v9 = DMFEmergencyModeLog();
      BOOL v15 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v14 >= 0.0)
      {
        if (v15)
        {
          LOWORD(v20) = 0;
          uint64_t v10 = "Emergency Mode is disabled";
          uint64_t v16 = v9;
          uint32_t v17 = 2;
          goto LABEL_14;
        }
      }
      else if (v15)
      {
        int v20 = 138543362;
        id v21 = v7;
        uint64_t v10 = "Emergency Mode was disabled %{public}@ seconds ago";
        goto LABEL_11;
      }
    }
    else
    {
      int v9 = DMFEmergencyModeLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138543362;
        id v21 = v7;
        uint64_t v10 = "Emergency Mode is enabled for %{public}@ more seconds";
LABEL_11:
        uint64_t v16 = v9;
        uint32_t v17 = 12;
LABEL_14:
        _os_log_impl(&dword_1BE0E2000, v16, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v20, v17);
      }
    }

    uint64_t v12 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    goto LABEL_16;
  }
  uint64_t v11 = DMFEmergencyModeLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    __56__DMFEmergencyModeMonitor_emergencyModeStatusWithError___block_invoke_65_cold_1();
  }

  uint64_t v12 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v7 = v6;
LABEL_16:
  id v18 = v7;
  uint64_t v19 = *v12;
  *uint64_t v12 = v18;
}

void __68__DMFEmergencyModeMonitor_emergencyModeStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DMFEmergencyModeLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

void __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BE0E2000, v0, v1, "Could not create Emergency Mode proxy: %{public}@", v2, v3, v4, v5, v6);
}

void __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke_62_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BE0E2000, v0, v1, "Failed to enabled Emergency Mode: %{public}@", v2, v3, v4, v5, v6);
}

void __68__DMFEmergencyModeMonitor_enableEmergencyModeForDuration_withError___block_invoke_63_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1BE0E2000, log, OS_LOG_TYPE_ERROR, "Failed to enabled Emergency Mode for duration %f: %{public}@", (uint8_t *)&v4, 0x16u);
}

void __57__DMFEmergencyModeMonitor_disableEmergencyModeWithError___block_invoke_64_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BE0E2000, v0, v1, "Failed to disable Emergency Mode: %{public}@", v2, v3, v4, v5, v6);
}

void __56__DMFEmergencyModeMonitor_emergencyModeStatusWithError___block_invoke_65_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BE0E2000, v0, v1, "Failed to fetch Emergency Mode status: %{public}@", v2, v3, v4, v5, v6);
}

@end