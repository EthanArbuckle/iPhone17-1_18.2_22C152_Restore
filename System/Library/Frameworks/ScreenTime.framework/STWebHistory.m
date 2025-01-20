@interface STWebHistory
- (NSString)bundleIdentifier;
- (NSXPCConnection)xpcConnection;
- (STWebHistory)init;
- (STWebHistory)initWithBundleIdentifier:(NSString *)bundleIdentifier error:(NSError *)error;
- (STWebHistory)initWithBundleIdentifier:(id)a3;
- (void)deleteAllHistory;
- (void)deleteHistoryDuringInterval:(NSDateInterval *)interval;
- (void)deleteHistoryForURL:(NSURL *)url;
@end

@implementation STWebHistory

- (STWebHistory)initWithBundleIdentifier:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STWebHistory;
  id v3 = a3;
  v4 = [(STWebHistory *)&v10 init];
  uint64_t v5 = objc_msgSend(v3, "copy", v10.receiver, v10.super_class);

  bundleIdentifier = v4->_bundleIdentifier;
  v4->_bundleIdentifier = (NSString *)v5;

  v7 = +[STScreenTimeAgentConnection newConnection];
  xpcConnection = v4->_xpcConnection;
  v4->_xpcConnection = v7;

  [(NSXPCConnection *)v4->_xpcConnection resume];
  return v4;
}

- (STWebHistory)initWithBundleIdentifier:(NSString *)bundleIdentifier error:(NSError *)error
{
  v17[1] = *MEMORY[0x263EF8340];
  v6 = bundleIdentifier;
  v7 = +[STWebService clientBundleIdentifier];
  if ([(NSString *)v6 isEqualToString:v7]
    || ([MEMORY[0x263F318B0] supportedWebBrowserBundleIdentifiersForDeviceFamily:102],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 containsObject:v7],
        v8,
        v9))
  {
    error = [(STWebHistory *)self initWithBundleIdentifier:v6];
  }
  else
  {

    if (error)
    {
      v11 = +[STScreenTimeBundle bundle];
      v12 = [v11 localizedStringForKey:@"UnsupportedWebBrowserError" value:&stru_26D7C1938 table:0];

      v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F67300];
      uint64_t v16 = *MEMORY[0x263F08320];
      v17[0] = v12;
      v15 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
      *error = [v13 errorWithDomain:v14 code:100 userInfo:v15];

      error = 0;
    }
  }

  return (STWebHistory *)error;
}

- (STWebHistory)init
{
  id v3 = +[STWebService clientBundleIdentifier];
  v4 = [(STWebHistory *)self initWithBundleIdentifier:v3];

  return v4;
}

- (void)deleteHistoryForURL:(NSURL *)url
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v4 = url;
  if (_os_feature_enabled_impl())
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__0;
    v26 = __Block_byref_object_dispose__0;
    id v27 = 0;
    uint64_t v5 = [(STWebHistory *)self xpcConnection];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __36__STWebHistory_deleteHistoryForURL___block_invoke;
    v21[3] = &unk_2646E72A8;
    v21[4] = &v22;
    v6 = [v5 remoteObjectProxyWithErrorHandler:v21];

    v7 = [(STWebHistory *)self bundleIdentifier];
    v8 = +[STWebService clientBundleURL];
    if (v8)
    {
      int v9 = (void *)[objc_alloc(MEMORY[0x263F08B18]) initWithURL:v8 readonly:1];
    }
    else
    {
      v12 = &_os_log_internal;
      id v13 = &_os_log_internal;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = +[STWebService clientBundleIdentifier];
        [(STWebHistory *)v14 deleteHistoryForURL:v15];
      }

      int v9 = 0;
    }

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __36__STWebHistory_deleteHistoryForURL___block_invoke_2;
    v19[3] = &unk_2646E7328;
    v20 = v4;
    [v6 deleteWebHistoryForURL:v20 webApplication:v7 clientBundleURLWrapper:v9 replyHandler:v19];

    if (v23[5] && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      -[STWebHistory deleteHistoryForURL:]();
    }

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    objc_super v10 = (void *)MEMORY[0x263F672A0];
    v11 = [(STWebHistory *)self xpcConnection];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __36__STWebHistory_deleteHistoryForURL___block_invoke_13;
    v16[3] = &unk_2646E7378;
    v17 = v4;
    v18 = self;
    [v10 proxyFromConnection:v11 proxyHandler:v16];
  }
}

void __36__STWebHistory_deleteHistoryForURL___block_invoke(uint64_t a1, void *a2)
{
}

void __36__STWebHistory_deleteHistoryForURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
    __36__STWebHistory_deleteHistoryForURL___block_invoke_2_cold_1();
  }
}

void __36__STWebHistory_deleteHistoryForURL___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = [*(id *)(a1 + 40) bundleIdentifier];
    int v9 = +[STWebService clientBundleURL];
    if (v9)
    {
      objc_super v10 = (void *)[objc_alloc(MEMORY[0x263F08B18]) initWithURL:v9 readonly:1];
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __36__STWebHistory_deleteHistoryForURL___block_invoke_13_cold_2();
      }
      objc_super v10 = 0;
    }

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __36__STWebHistory_deleteHistoryForURL___block_invoke_2_14;
    v13[3] = &unk_2646E7350;
    int8x16_t v12 = *(int8x16_t *)(a1 + 32);
    id v11 = (id)v12.i64[0];
    int8x16_t v14 = vextq_s8(v12, v12, 8uLL);
    [v5 deleteWebHistoryForURL:v7 webApplication:v8 clientBundleURLWrapper:v10 replyHandler:v13];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    __36__STWebHistory_deleteHistoryForURL___block_invoke_13_cold_1();
  }
}

void __36__STWebHistory_deleteHistoryForURL___block_invoke_2_14(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
    __36__STWebHistory_deleteHistoryForURL___block_invoke_2_14_cold_1();
  }
}

- (void)deleteHistoryDuringInterval:(NSDateInterval *)interval
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v4 = interval;
  if (_os_feature_enabled_impl())
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__0;
    v26 = __Block_byref_object_dispose__0;
    id v27 = 0;
    id v5 = [(STWebHistory *)self xpcConnection];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __44__STWebHistory_deleteHistoryDuringInterval___block_invoke;
    v21[3] = &unk_2646E72A8;
    v21[4] = &v22;
    id v6 = [v5 remoteObjectProxyWithErrorHandler:v21];

    uint64_t v7 = [(STWebHistory *)self bundleIdentifier];
    v8 = +[STWebService clientBundleURL];
    if (v8)
    {
      int v9 = (void *)[objc_alloc(MEMORY[0x263F08B18]) initWithURL:v8 readonly:1];
    }
    else
    {
      int8x16_t v12 = &_os_log_internal;
      id v13 = &_os_log_internal;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int8x16_t v14 = +[STWebService clientBundleIdentifier];
        [(STWebHistory *)v14 deleteHistoryForURL:v15];
      }

      int v9 = 0;
    }

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __44__STWebHistory_deleteHistoryDuringInterval___block_invoke_2;
    v19[3] = &unk_2646E7328;
    v20 = v4;
    [v6 deleteWebHistoryDuringInterval:v20 webApplication:v7 clientBundleURLWrapper:v9 replyHandler:v19];

    if (v23[5] && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      -[STWebHistory deleteHistoryForURL:]();
    }

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    objc_super v10 = (void *)MEMORY[0x263F672A0];
    id v11 = [(STWebHistory *)self xpcConnection];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __44__STWebHistory_deleteHistoryDuringInterval___block_invoke_16;
    v16[3] = &unk_2646E7378;
    v17 = v4;
    v18 = self;
    [v10 proxyFromConnection:v11 proxyHandler:v16];
  }
}

void __44__STWebHistory_deleteHistoryDuringInterval___block_invoke(uint64_t a1, void *a2)
{
}

void __44__STWebHistory_deleteHistoryDuringInterval___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
    __44__STWebHistory_deleteHistoryDuringInterval___block_invoke_2_cold_1();
  }
}

void __44__STWebHistory_deleteHistoryDuringInterval___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = [*(id *)(a1 + 40) bundleIdentifier];
    int v9 = +[STWebService clientBundleURL];
    if (v9)
    {
      objc_super v10 = (void *)[objc_alloc(MEMORY[0x263F08B18]) initWithURL:v9 readonly:1];
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __36__STWebHistory_deleteHistoryForURL___block_invoke_13_cold_2();
      }
      objc_super v10 = 0;
    }

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __44__STWebHistory_deleteHistoryDuringInterval___block_invoke_2_17;
    v13[3] = &unk_2646E7350;
    int8x16_t v12 = *(int8x16_t *)(a1 + 32);
    id v11 = (id)v12.i64[0];
    int8x16_t v14 = vextq_s8(v12, v12, 8uLL);
    [v5 deleteWebHistoryDuringInterval:v7 webApplication:v8 clientBundleURLWrapper:v10 replyHandler:v13];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    __36__STWebHistory_deleteHistoryForURL___block_invoke_13_cold_1();
  }
}

void __44__STWebHistory_deleteHistoryDuringInterval___block_invoke_2_17(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
    __44__STWebHistory_deleteHistoryDuringInterval___block_invoke_2_17_cold_1();
  }
}

- (void)deleteAllHistory
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__0;
    v20 = __Block_byref_object_dispose__0;
    id v21 = 0;
    id v3 = [(STWebHistory *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __32__STWebHistory_deleteAllHistory__block_invoke;
    v15[3] = &unk_2646E72A8;
    v15[4] = &v16;
    v4 = [v3 remoteObjectProxyWithErrorHandler:v15];

    id v5 = [(STWebHistory *)self bundleIdentifier];
    id v6 = +[STWebService clientBundleURL];
    if (v6)
    {
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F08B18]) initWithURL:v6 readonly:1];
    }
    else
    {
      objc_super v10 = &_os_log_internal;
      id v11 = &_os_log_internal;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int8x16_t v12 = +[STWebService clientBundleIdentifier];
        [(STWebHistory *)v12 deleteHistoryForURL:v13];
      }

      uint64_t v7 = 0;
    }

    [v4 deleteAllWebApplicationHistory:v5 clientBundleURLWrapper:v7 replyHandler:&__block_literal_global];
    if (v17[5])
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        -[STWebHistory deleteHistoryForURL:]();
      }
    }

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v8 = (void *)MEMORY[0x263F672A0];
    int v9 = [(STWebHistory *)self xpcConnection];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __32__STWebHistory_deleteAllHistory__block_invoke_18;
    v14[3] = &unk_2646E72F8;
    v14[4] = self;
    [v8 proxyFromConnection:v9 proxyHandler:v14];
  }
}

void __32__STWebHistory_deleteAllHistory__block_invoke(uint64_t a1, void *a2)
{
}

void __32__STWebHistory_deleteAllHistory__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
    __32__STWebHistory_deleteAllHistory__block_invoke_2_cold_1();
  }
}

void __32__STWebHistory_deleteAllHistory__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) bundleIdentifier];
    v8 = +[STWebService clientBundleURL];
    if (v8)
    {
      int v9 = (void *)[objc_alloc(MEMORY[0x263F08B18]) initWithURL:v8 readonly:1];
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __36__STWebHistory_deleteHistoryForURL___block_invoke_13_cold_2();
      }
      int v9 = 0;
    }

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __32__STWebHistory_deleteAllHistory__block_invoke_2_19;
    v10[3] = &unk_2646E7328;
    v10[4] = *(void *)(a1 + 32);
    [v5 deleteAllWebApplicationHistory:v7 clientBundleURLWrapper:v9 replyHandler:v10];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    __36__STWebHistory_deleteHistoryForURL___block_invoke_13_cold_1();
  }
}

void __32__STWebHistory_deleteAllHistory__block_invoke_2_19(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
    __32__STWebHistory_deleteAllHistory__block_invoke_2_19_cold_1();
  }
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)deleteHistoryForURL:.cold.1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0(&dword_2249CB000, &_os_log_internal, v0, "Failed to fetch ScreenTime Agent proxy: %{public}@", v1, v2, v3, v4, 2u);
}

- (void)deleteHistoryForURL:(uint64_t)a3 .cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4(&dword_2249CB000, &_os_log_internal, a3, "Could not find client bundle URL. Starting to delete web history without granting ScreenTimeAgent access to the client application. %{public}@ will only be able to delete untrusted web history.", (uint8_t *)a2);
}

void __36__STWebHistory_deleteHistoryForURL___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2249CB000, &_os_log_internal, v0, "Failed to delete history for %@ with error: %{public}@", v1, v2, v3, v4, v5);
}

void __36__STWebHistory_deleteHistoryForURL___block_invoke_13_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2249CB000, &_os_log_internal, v0, "Failed to create proxy: %{public}@", v1, v2, v3, v4, v5);
}

void __36__STWebHistory_deleteHistoryForURL___block_invoke_13_cold_2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  uint64_t v0 = +[STWebService clientBundleIdentifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_2249CB000, &_os_log_internal, v1, "Could not find client bundle URL. Starting to delete web history without granting ScreenTimeAgent access to the client application. %{public}@ will only be able to delete untrusted web history.", v2);
}

void __36__STWebHistory_deleteHistoryForURL___block_invoke_2_14_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2249CB000, &_os_log_internal, v0, "Failed to delete history for %@ with error: %{public}@", v1, v2, v3, v4, v5);
}

void __44__STWebHistory_deleteHistoryDuringInterval___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2249CB000, &_os_log_internal, v0, "Failed to delete history during %@ with error: %{public}@", v1, v2, v3, v4, v5);
}

void __44__STWebHistory_deleteHistoryDuringInterval___block_invoke_2_17_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2249CB000, &_os_log_internal, v0, "Failed to delete history during %@ with error: %{public}@", v1, v2, v3, v4, v5);
}

void __32__STWebHistory_deleteAllHistory__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2249CB000, &_os_log_internal, v0, "Failed to delete all web history with error: %{public}@", v1, v2, v3, v4, v5);
}

void __32__STWebHistory_deleteAllHistory__block_invoke_2_19_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2249CB000, &_os_log_internal, v0, "Failed to delete all web history: %{public}@", v1, v2, v3, v4, v5);
}

@end