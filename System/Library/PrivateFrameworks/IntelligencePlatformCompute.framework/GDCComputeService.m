@interface GDCComputeService
- (BOOL)clearViewWithName:(id)a3 fullRebuild:(BOOL)a4 error:(id *)a5;
- (BOOL)stopWithError:(id *)a3;
- (BOOL)truncateViewWithName:(id)a3 fullRebuild:(BOOL)a4 error:(id *)a5;
- (GDCComputeService)init;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)updateGroupWithName:(id)a3 namesAndRequests:(id)a4 error:(id *)a5;
- (id)updateViewWithName:(id)a3 viewUpdateSourceRequests:(id)a4 error:(id *)a5;
- (void)dealloc;
- (void)locked_establishConnection;
@end

@implementation GDCComputeService

void __71__GDCComputeService_updateViewWithName_viewUpdateSourceRequests_error___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)updateViewWithName:(id)a3 viewUpdateSourceRequests:(id)a4 error:(id *)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy_;
  v41 = __Block_byref_object_dispose_;
  id v42 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  v8 = GDCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v6;
    _os_log_impl(&dword_253E94000, v8, OS_LOG_TYPE_DEFAULT, "GDCComputeService: updateViewWithName called: %@", buf, 0xCu);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v47 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v13 = GDCLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = [v12 description];
          *(_DWORD *)buf = 138412546;
          id v44 = v6;
          __int16 v45 = 2112;
          v46 = v14;
          _os_log_impl(&dword_253E94000, v13, OS_LOG_TYPE_DEFAULT, "GDCComputeService: updateViewWithName: request: %@ %@", buf, 0x16u);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v47 count:16];
    }
    while (v9);
  }

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __71__GDCComputeService_updateViewWithName_viewUpdateSourceRequests_error___block_invoke;
  v24[3] = &unk_26539AF58;
  id v15 = v6;
  id v25 = v15;
  v26 = &v31;
  v16 = [(GDCComputeService *)self synchronousRemoteObjectProxyWithErrorHandler:v24];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __71__GDCComputeService_updateViewWithName_viewUpdateSourceRequests_error___block_invoke_23;
  v23[3] = &unk_26539AF80;
  v23[4] = &v37;
  v23[5] = &v31;
  [v16 updateViewWithName:v15 viewUpdateSourceRequests:obj reply:v23];

  v17 = (void *)v38[5];
  if (a5 && !v17)
  {
    *a5 = (id) v32[5];
    v17 = (void *)v38[5];
  }
  id v18 = v17;

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v18;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  [(GDCComputeService *)v5 locked_establishConnection];
  id v6 = [(NSXPCConnection *)v5->_connection synchronousRemoteObjectProxyWithErrorHandler:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)locked_establishConnection
{
  if (!self->_connection)
  {
    v3 = GDCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_253E94000, v3, OS_LOG_TYPE_DEFAULT, "GDCComputeService: establishing connection.", (uint8_t *)buf, 2u);
    }

    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.intelligenceplatform.IntelligencePlatformComputeService"];
    connection = self->_connection;
    self->_connection = v4;

    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:self->_serverInterface];
    [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global];
    objc_initWeak(buf, self);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __47__GDCComputeService_locked_establishConnection__block_invoke_21;
    v6[3] = &unk_26539AF30;
    objc_copyWeak(&v7, buf);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v6];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v7);
    objc_destroyWeak(buf);
  }
}

- (GDCComputeService)init
{
  v16.receiver = self;
  v16.super_class = (Class)GDCComputeService;
  v2 = [(GDCComputeService *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270371678];
    serverInterface = v2->_serverInterface;
    v2->_serverInterface = (NSXPCInterface *)v3;

    id v5 = v2->_serverInterface;
    id v6 = (void *)MEMORY[0x25A271A60]();
    id v7 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    [(NSXPCInterface *)v5 setClasses:v9 forSelector:sel_updateViewWithName_viewUpdateSourceRequests_reply_ argumentIndex:0 ofReply:1];

    uint64_t v10 = v2->_serverInterface;
    id v11 = (void *)MEMORY[0x25A271A60]();
    id v12 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
    [(NSXPCInterface *)v10 setClasses:v14 forSelector:sel_updateGroupWithName_namesAndRequests_reply_ argumentIndex:0 ofReply:1];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)GDCComputeService;
  [(GDCComputeService *)&v3 dealloc];
}

void __47__GDCComputeService_locked_establishConnection__block_invoke()
{
  v0 = GDCLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __47__GDCComputeService_locked_establishConnection__block_invoke_cold_1(v0);
  }
}

void __47__GDCComputeService_locked_establishConnection__block_invoke_21(uint64_t a1)
{
  v2 = GDCLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __47__GDCComputeService_locked_establishConnection__block_invoke_21_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    objc_sync_enter(v5);
    id v6 = (void *)v5[1];
    v5[1] = 0;

    objc_sync_exit(v5);
  }
}

void __71__GDCComputeService_updateViewWithName_viewUpdateSourceRequests_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = GDCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__GDCComputeService_updateViewWithName_viewUpdateSourceRequests_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (id)updateGroupWithName:(id)a3 namesAndRequests:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x3032000000;
  long long v29 = __Block_byref_object_copy_;
  long long v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v10 = GDCLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v8;
    _os_log_impl(&dword_253E94000, v10, OS_LOG_TYPE_DEFAULT, "GDCComputeService: updateGroupWithName called: %@", buf, 0xCu);
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __64__GDCComputeService_updateGroupWithName_namesAndRequests_error___block_invoke;
  v17[3] = &unk_26539AF58;
  id v11 = v8;
  id v18 = v11;
  v19 = &v20;
  id v12 = [(GDCComputeService *)self synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __64__GDCComputeService_updateGroupWithName_namesAndRequests_error___block_invoke_25;
  v16[3] = &unk_26539AF80;
  v16[4] = &v26;
  v16[5] = &v20;
  [v12 updateGroupWithName:v11 namesAndRequests:v9 reply:v16];

  uint64_t v13 = (void *)v27[5];
  if (a5 && !v13)
  {
    *a5 = (id) v21[5];
    uint64_t v13 = (void *)v27[5];
  }
  id v14 = v13;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

void __64__GDCComputeService_updateGroupWithName_namesAndRequests_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = GDCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__GDCComputeService_updateGroupWithName_namesAndRequests_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __64__GDCComputeService_updateGroupWithName_namesAndRequests_error___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)clearViewWithName:(id)a3 fullRebuild:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v9 = GDCLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v8;
    __int16 v31 = 1024;
    BOOL v32 = v6;
    _os_log_impl(&dword_253E94000, v9, OS_LOG_TYPE_DEFAULT, "GDCComputeService: clearViewWithName called [name: %@, fullRebuild: %d]", buf, 0x12u);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __57__GDCComputeService_clearViewWithName_fullRebuild_error___block_invoke;
  v16[3] = &unk_26539AF58;
  id v10 = v8;
  id v17 = v10;
  id v18 = &v19;
  id v11 = [(GDCComputeService *)self synchronousRemoteObjectProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __57__GDCComputeService_clearViewWithName_fullRebuild_error___block_invoke_26;
  v15[3] = &unk_26539AFA8;
  v15[4] = &v25;
  v15[5] = &v19;
  [v11 clearViewWithName:v10 fullRebuild:v6 reply:v15];

  int v12 = *((unsigned __int8 *)v26 + 24);
  if (a5 && !*((unsigned char *)v26 + 24))
  {
    *a5 = (id) v20[5];
    int v12 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v13 = v12 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

void __57__GDCComputeService_clearViewWithName_fullRebuild_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = GDCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __57__GDCComputeService_clearViewWithName_fullRebuild_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __57__GDCComputeService_clearViewWithName_fullRebuild_error___block_invoke_26(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)truncateViewWithName:(id)a3 fullRebuild:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v9 = GDCLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v8;
    __int16 v31 = 1024;
    BOOL v32 = v6;
    _os_log_impl(&dword_253E94000, v9, OS_LOG_TYPE_DEFAULT, "GDCComputeService: truncateViewWithName called [name: %@, fullRebuild: %d]", buf, 0x12u);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __60__GDCComputeService_truncateViewWithName_fullRebuild_error___block_invoke;
  v16[3] = &unk_26539AF58;
  id v10 = v8;
  id v17 = v10;
  id v18 = &v19;
  id v11 = [(GDCComputeService *)self synchronousRemoteObjectProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__GDCComputeService_truncateViewWithName_fullRebuild_error___block_invoke_28;
  v15[3] = &unk_26539AFA8;
  v15[4] = &v25;
  v15[5] = &v19;
  [v11 truncateViewWithName:v10 fullRebuild:v6 reply:v15];

  int v12 = *((unsigned __int8 *)v26 + 24);
  if (a5 && !*((unsigned char *)v26 + 24))
  {
    *a5 = (id) v20[5];
    int v12 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v13 = v12 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

void __60__GDCComputeService_truncateViewWithName_fullRebuild_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = GDCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__GDCComputeService_truncateViewWithName_fullRebuild_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __60__GDCComputeService_truncateViewWithName_fullRebuild_error___block_invoke_28(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)stopWithError:(id *)a3
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  objc_super v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v5 = GDCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_253E94000, v5, OS_LOG_TYPE_DEFAULT, "GDCComputeService: stop called", buf, 2u);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __35__GDCComputeService_stopWithError___block_invoke;
  v11[3] = &unk_26539AFD0;
  v11[4] = &v13;
  BOOL v6 = [(GDCComputeService *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __35__GDCComputeService_stopWithError___block_invoke_29;
  v10[3] = &unk_26539AFA8;
  v10[4] = &v19;
  v10[5] = &v13;
  [v6 stopWithReply:v10];

  int v7 = *((unsigned __int8 *)v20 + 24);
  if (a3 && !*((unsigned char *)v20 + 24))
  {
    *a3 = (id) v14[5];
    int v7 = *((unsigned __int8 *)v20 + 24);
  }
  BOOL v8 = v7 != 0;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v8;
}

void __35__GDCComputeService_stopWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = GDCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __35__GDCComputeService_stopWithError___block_invoke_cold_1((uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __35__GDCComputeService_stopWithError___block_invoke_29(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __47__GDCComputeService_locked_establishConnection__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_253E94000, log, OS_LOG_TYPE_ERROR, "GDCComputeService: interrupted.", v1, 2u);
}

void __47__GDCComputeService_locked_establishConnection__block_invoke_21_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_253E94000, log, OS_LOG_TYPE_ERROR, "GDCComputeService: invalidated.", v1, 2u);
}

void __71__GDCComputeService_updateViewWithName_viewUpdateSourceRequests_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_253E94000, v0, v1, "GDCComputeService: error during updateViewWithName %@ call: %@");
}

void __64__GDCComputeService_updateGroupWithName_namesAndRequests_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_253E94000, v0, v1, "GDCComputeService: error during updateGroupWithName %@ call: %@");
}

void __57__GDCComputeService_clearViewWithName_fullRebuild_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_253E94000, v0, v1, "GDCComputeService: error during clearViewWithName %@ call: %@");
}

void __60__GDCComputeService_truncateViewWithName_fullRebuild_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_253E94000, v0, v1, "GDCComputeService: error during truncateViewWithName %@ call: %@");
}

void __35__GDCComputeService_stopWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_253E94000, a2, OS_LOG_TYPE_ERROR, "GDCComputeService: error during stop: %@", (uint8_t *)&v2, 0xCu);
}

@end