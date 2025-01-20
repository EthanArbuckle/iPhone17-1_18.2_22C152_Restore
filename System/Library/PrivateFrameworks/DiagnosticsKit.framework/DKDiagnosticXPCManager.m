@interface DKDiagnosticXPCManager
- (DKDiagnosticXPCManager)init;
- (DKDiagnosticXPCManager)initWithBundleIdentifier:(id)a3 connectionRoute:(unint64_t)a4;
- (DKUIResponder)uiResponder;
- (NSMutableArray)activeDiagnostics;
- (NSMutableDictionary)diagnostics;
- (id)attributesForIdentifier:(id)a3;
- (void)beginDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 completion:(id)a5;
- (void)cancelAllDiagnostics;
- (void)diagnosticsWithCompletion:(id)a3;
- (void)getAsset:(id)a3 completion:(id)a4;
- (void)registerDiagnosticWithAttributes:(id)a3;
- (void)setActiveDiagnostics:(id)a3;
- (void)setDiagnostics:(id)a3;
- (void)setUiResponder:(id)a3;
- (void)showUI:(id)a3 completion:(id)a4;
@end

@implementation DKDiagnosticXPCManager

- (DKDiagnosticXPCManager)init
{
  return [(DKDiagnosticXPCManager *)self initWithBundleIdentifier:@"Default" connectionRoute:1];
}

- (DKDiagnosticXPCManager)initWithBundleIdentifier:(id)a3 connectionRoute:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[DKDiagnosticXPCManager initWithBundleIdentifier:connectionRoute:]";
    _os_log_impl(&dword_23D039000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v14.receiver = self;
  v14.super_class = (Class)DKDiagnosticXPCManager;
  v8 = [(DKDiagnosticManager *)&v14 initWithBundleIdentifier:v6 connectionRoute:a4];

  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    diagnostics = v8->_diagnostics;
    v8->_diagnostics = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    activeDiagnostics = v8->_activeDiagnostics;
    v8->_activeDiagnostics = v11;
  }
  return v8;
}

- (void)beginDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[DKDiagnosticXPCManager beginDiagnosticWithIdentifier:parameters:completion:]";
    _os_log_impl(&dword_23D039000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v12 = [(DKDiagnosticManager *)self diagnosticsManagerQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke;
  v16[3] = &unk_264E86980;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  dispatch_async(v12, v16);
}

void __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke(uint64_t a1)
{
  v30[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) diagnostics];
  v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F08D68]);
    v5 = [v3 serviceName];
    id v6 = (void *)[v4 initWithServiceName:v5];

    v7 = [[DKDiagnosticHostContext alloc] initWithConnection:v6];
    id v8 = [[DKDiagnosticServiceRequest alloc] initWithHostServicesDelegate:*(void *)(a1 + 32)];
    [(DKDiagnosticServiceRequest *)v8 setCompletion:*(void *)(a1 + 56)];
    [(DKDiagnosticServiceRequest *)v8 setConnection:v6];
    [(DKDiagnosticServiceRequest *)v8 setContext:v7];
    [(DKDiagnosticHostContext *)v7 setDelegate:v8];
    id v9 = [*(id *)(a1 + 32) activeDiagnostics];
    [v9 addObject:v8];

    id v10 = +[DKDiagnosticHostContext _extensionAuxiliaryVendorProtocol];
    [v6 setRemoteObjectInterface:v10];

    [v6 setExportedObject:v7];
    v11 = +[DKDiagnosticHostContext _extensionAuxiliaryHostProtocol];
    [v6 setExportedInterface:v11];

    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_initWeak(&from, v8);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_2;
    v22[3] = &unk_264E86908;
    objc_copyWeak(&v23, &from);
    objc_copyWeak(&v24, &location);
    [v6 setInvalidationHandler:v22];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_7;
    v20[3] = &unk_264E86930;
    objc_copyWeak(&v21, &from);
    [v6 setInterruptionHandler:v20];
    [v6 resume];
    v12 = DiagnosticsKitLogHandleForCategory(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [*(id *)(a1 + 40) longValue];
      *(_DWORD *)buf = 134217984;
      uint64_t v28 = v13;
      _os_log_impl(&dword_23D039000, v12, OS_LOG_TYPE_DEFAULT, "Found diagnostic for ID: %ld", buf, 0xCu);
    }

    uint64_t v14 = *(void *)(a1 + 48);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_8;
    v18[3] = &unk_264E86958;
    objc_copyWeak(&v19, &from);
    [(DKDiagnosticHostContext *)v7 startWithPayload:v14 completion:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    id v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08320];
    v16 = DKErrorLocalizedDescriptionForCode(-1000);
    v30[0] = v16;
    id v17 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    id v6 = [v15 errorWithDomain:@"DKErrorDomain" code:-1000 userInfo:v17];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __58__DKDiagnosticService_listener_shouldAcceptNewConnection___block_invoke_cold_1((uint64_t)WeakRetained, v3);
  }

  [WeakRetained didInvalidate];
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = [v4 activeDiagnostics];
  [v5 removeObject:WeakRetained];
}

void __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_7_cold_1((uint64_t)WeakRetained, v2);
  }

  [WeakRetained didInterrupt];
}

void __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_8(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_23D039000, v4, OS_LOG_TYPE_DEFAULT, "Started: %d", (uint8_t *)v6, 8u);
  }

  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained didFailStart];
  }
}

- (void)diagnosticsWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[DKDiagnosticXPCManager diagnosticsWithCompletion:]";
    _os_log_impl(&dword_23D039000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v6 = [(DKDiagnosticManager *)self diagnosticListQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__DKDiagnosticXPCManager_diagnosticsWithCompletion___block_invoke;
  v8[3] = &unk_264E86850;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __52__DKDiagnosticXPCManager_diagnosticsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) diagnostics];
  v2 = [v3 allValues];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

- (id)attributesForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[DKDiagnosticXPCManager attributesForIdentifier:]";
    _os_log_impl(&dword_23D039000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  id v6 = [(DKDiagnosticManager *)self diagnosticListQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__DKDiagnosticXPCManager_attributesForIdentifier___block_invoke;
  block[3] = &unk_264E869A8;
  id v11 = v4;
  p_long long buf = &buf;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(v6, block);

  id v8 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v8;
}

void __50__DKDiagnosticXPCManager_attributesForIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) diagnostics];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)cancelAllDiagnostics
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v16 = "-[DKDiagnosticXPCManager cancelAllDiagnostics]";
    _os_log_impl(&dword_23D039000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(DKDiagnosticXPCManager *)self activeDiagnostics];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) context];
        [v9 cancelWithCompletion:&__block_literal_global_9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

void __46__DKDiagnosticXPCManager_cancelAllDiagnostics__block_invoke()
{
  v0 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_23D039000, v0, OS_LOG_TYPE_DEFAULT, "DKDiagnosticXPCManager: Finished canceling all diags", v1, 2u);
  }
}

- (void)registerDiagnosticWithAttributes:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    long long v11 = "-[DKDiagnosticXPCManager registerDiagnosticWithAttributes:]";
    _os_log_impl(&dword_23D039000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v6 = [(DKDiagnosticManager *)self diagnosticListQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__DKDiagnosticXPCManager_registerDiagnosticWithAttributes___block_invoke;
  v8[3] = &unk_264E867B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_barrier_async(v6, v8);
}

void __59__DKDiagnosticXPCManager_registerDiagnosticWithAttributes___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) diagnostics];
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  [v4 setObject:v2 forKeyedSubscript:v3];
}

- (void)getAsset:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    long long v13 = "-[DKDiagnosticXPCManager getAsset:completion:]";
    _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  id v9 = [(DKDiagnosticManager *)self assetResponder];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    long long v11 = [(DKDiagnosticManager *)self assetResponder];
    [v11 getAsset:v6 completion:v7];
  }
}

- (void)showUI:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    long long v13 = "-[DKDiagnosticXPCManager showUI:completion:]";
    _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  id v9 = [(DKDiagnosticXPCManager *)self uiResponder];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    long long v11 = [(DKDiagnosticXPCManager *)self uiResponder];
    [v11 showUI:v6 completion:v7];
  }
}

- (DKUIResponder)uiResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiResponder);
  return (DKUIResponder *)WeakRetained;
}

- (void)setUiResponder:(id)a3
{
}

- (NSMutableDictionary)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
{
}

- (NSMutableArray)activeDiagnostics
{
  return self->_activeDiagnostics;
}

- (void)setActiveDiagnostics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDiagnostics, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_destroyWeak((id *)&self->_uiResponder);
}

void __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_7_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D039000, a2, OS_LOG_TYPE_ERROR, "Connection interrupted: %@", (uint8_t *)&v2, 0xCu);
}

@end