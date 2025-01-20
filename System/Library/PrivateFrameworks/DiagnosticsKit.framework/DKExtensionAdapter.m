@interface DKExtensionAdapter
+ (id)extensionAdapterWithExtensionAttributes:(id)a3;
- (DKExtensionAdapter)initWithExtensionAttributes:(id)a3;
- (DKExtensionAttributes)extensionAttributes;
- (NSMutableDictionary)extensionToRequestIdentifierLookup;
- (NSMutableDictionary)requestLookup;
- (NSString)description;
- (OS_dispatch_queue)adapterConnectQueue;
- (OS_dispatch_queue)adapterQueue;
- (id)_requestForExtensionRequestIdentifier:(id)a3;
- (void)_attachHandlersToExtension:(id)a3;
- (void)_didCancelExtensionRequest:(id)a3 error:(id)a4;
- (void)_didCompleteExtensionRequest:(id)a3;
- (void)_didInterruptExtensionRequest:(id)a3;
- (void)beginRequest:(id)a3 payload:(id)a4 completion:(id)a5;
- (void)cancelAll;
- (void)request:(id)a3 didCompleteWithPayload:(id)a4 error:(id)a5;
- (void)setAdapterConnectQueue:(id)a3;
- (void)setAdapterQueue:(id)a3;
- (void)setExtensionToRequestIdentifierLookup:(id)a3;
- (void)setRequestLookup:(id)a3;
@end

@implementation DKExtensionAdapter

- (DKExtensionAdapter)initWithExtensionAttributes:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DKExtensionAdapter;
  v6 = [(DKExtensionAdapter *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extensionAttributes, a3);
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    requestLookup = v7->_requestLookup;
    v7->_requestLookup = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    extensionToRequestIdentifierLookup = v7->_extensionToRequestIdentifierLookup;
    v7->_extensionToRequestIdentifierLookup = (NSMutableDictionary *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.DiagnosticsKit.extensionAdapterQueue", 0);
    adapterQueue = v7->_adapterQueue;
    v7->_adapterQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.DiagnosticsKit.extensionAdapterConnectQueue", 0);
    adapterConnectQueue = v7->_adapterConnectQueue;
    v7->_adapterConnectQueue = (OS_dispatch_queue *)v14;

    [(DKExtensionAdapter *)v7 _attachHandlersToExtension:v5];
  }

  return v7;
}

+ (id)extensionAdapterWithExtensionAttributes:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithExtensionAttributes:v4];

  return v5;
}

- (void)beginRequest:(id)a3 payload:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(DKExtensionAdapter *)self requestLookup];
  objc_sync_enter(v11);
  dispatch_queue_t v12 = [(DKExtensionAdapter *)self requestLookup];
  v13 = [v8 requestIdentifier];
  [v12 setObject:v8 forKeyedSubscript:v13];

  objc_sync_exit(v11);
  dispatch_queue_t v14 = objc_opt_new();
  v15 = (void *)[v10 copy];
  [v14 setCompletion:v15];

  [v14 setCompletionHandlerExecuted:0];
  [v8 setContext:v14];
  [v8 setDelegate:self];
  uint64_t v33 = 0;
  v34[0] = &v33;
  v34[1] = 0x3032000000;
  v34[2] = __Block_byref_object_copy__1;
  v34[3] = __Block_byref_object_dispose__1;
  id v35 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  id v32 = 0;
  v16 = [(DKExtensionAdapter *)self adapterConnectQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__DKExtensionAdapter_beginRequest_payload_completion___block_invoke;
  block[3] = &unk_264E869D0;
  v25 = &v27;
  id v17 = v8;
  id v24 = v17;
  v26 = &v33;
  dispatch_sync(v16, block);

  if (v28[5])
  {
    v18 = [(DKExtensionAdapter *)self extensionToRequestIdentifierLookup];
    objc_sync_enter(v18);
    v19 = [v17 requestIdentifier];
    v20 = [(DKExtensionAdapter *)self extensionToRequestIdentifierLookup];
    [v20 setObject:v19 forKeyedSubscript:v28[5]];

    objc_sync_exit(v18);
    [v17 beginWithPayload:v9];
  }
  else
  {
    v21 = DiagnosticsKitLogHandleForCategory(1);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = [v17 requestIdentifier];
      -[DKExtensionAdapter beginRequest:payload:completion:](v22, (uint64_t)v34, buf, v21);
    }

    +[DKAnalytics sendAnalyticsWithEvent:3 error:*(void *)(v34[0] + 40)];
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
}

void __54__DKExtensionAdapter_beginRequest_payload_completion___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 connectWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)cancelAll
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(DKExtensionAdapter *)self requestLookup];
  objc_sync_enter(v3);
  uint64_t v4 = [(DKExtensionAdapter *)self requestLookup];
  uint64_t v5 = [v4 allValues];
  v6 = (void *)[v5 copy];

  objc_sync_exit(v3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "cancel", (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)request:(id)a3 didCompleteWithPayload:(id)a4 error:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [v8 requestIdentifier];
  long long v12 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412802;
    v25 = v11;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl(&dword_23D039000, v12, OS_LOG_TYPE_DEFAULT, "[RID: %@] request:didCompleteWithPayload: %@, error: %@", (uint8_t *)&v24, 0x20u);
  }

  long long v13 = [v8 extensionRequestIdentifier];

  if (v13)
  {
    long long v14 = [(DKExtensionAdapter *)self extensionToRequestIdentifierLookup];
    objc_sync_enter(v14);
    v15 = [(DKExtensionAdapter *)self extensionToRequestIdentifierLookup];
    uint64_t v16 = [v8 extensionRequestIdentifier];
    [v15 removeObjectForKey:v16];

    objc_sync_exit(v14);
  }
  id v17 = [(DKExtensionAdapter *)self requestLookup];
  objc_sync_enter(v17);
  v18 = [(DKExtensionAdapter *)self requestLookup];
  [v18 removeObjectForKey:v11];

  objc_sync_exit(v17);
  v19 = [v8 context];
  v20 = [v19 completion];
  if (v20)
  {
    char v21 = [v19 completionHandlerExecuted];

    if ((v21 & 1) == 0)
    {
      v22 = DiagnosticsKitLogHandleForCategory(1);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138412290;
        v25 = v11;
        _os_log_impl(&dword_23D039000, v22, OS_LOG_TYPE_DEFAULT, "[RID: %@] Calling final completion.", (uint8_t *)&v24, 0xCu);
      }

      v23 = [v19 completion];
      ((void (**)(void, id, id))v23)[2](v23, v9, v10);

      [v19 setCompletion:0];
      [v19 setCompletionHandlerExecuted:1];
    }
  }
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = [(DKExtensionAdapter *)self extensionAttributes];
  id v7 = [v3 stringWithFormat:@"<%@: %p; attributes: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (void)_attachHandlersToExtension:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke;
  v12[3] = &unk_264E869F8;
  objc_copyWeak(&v13, &location);
  uint64_t v5 = [v4 extension];
  [v5 setRequestCompletionBlock:v12];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_2;
  v10[3] = &unk_264E86A48;
  objc_copyWeak(&v11, &location);
  v6 = [v4 extension];
  [v6 setRequestCancellationBlock:v10];

  uint64_t v8 = MEMORY[0x263EF8330];
  objc_copyWeak(&v9, &location);
  id v7 = objc_msgSend(v4, "extension", v8, 3221225472, __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_2_29, &unk_264E86A70);
  [v7 setRequestInterruptionBlock:&v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_23D039000, v5, OS_LOG_TYPE_DEFAULT, "[ERID: %@] requestCompletionBlock", buf, 0xCu);
  }

  if (WeakRetained)
  {
    v6 = [WeakRetained adapterQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_25;
    v7[3] = &unk_264E867B0;
    v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_25(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didCompleteExtensionRequest:*(void *)(a1 + 40)];
}

void __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "[ERID: %@] requestCancellationBlock", buf, 0xCu);
  }

  +[DKAnalytics sendAnalyticsWithEvent:4 error:v6];
  if (WeakRetained)
  {
    id v9 = [WeakRetained adapterQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_27;
    block[3] = &unk_264E86A20;
    void block[4] = WeakRetained;
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_27(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didCancelExtensionRequest:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

void __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_2_29(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_2_29_cold_1();
  }

  id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"DKExtensionInterrupted" code:0 userInfo:0];
  +[DKAnalytics sendAnalyticsWithEvent:5 error:v6];

  if (WeakRetained)
  {
    id v7 = [WeakRetained adapterQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_34;
    v8[3] = &unk_264E867B0;
    v8[4] = WeakRetained;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_34(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didInterruptExtensionRequest:*(void *)(a1 + 40)];
}

- (id)_requestForExtensionRequestIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DKExtensionAdapter *)self requestLookup];
  objc_sync_enter(v5);
  id v6 = [(DKExtensionAdapter *)self extensionToRequestIdentifierLookup];
  id v7 = [v6 objectForKeyedSubscript:v4];

  objc_sync_exit(v5);
  id v8 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "[RID: %@] [ERID: %@] Looking up request identifier", (uint8_t *)&v13, 0x16u);
  }

  if (v7)
  {
    id v9 = [(DKExtensionAdapter *)self requestLookup];
    objc_sync_enter(v9);
    id v10 = [(DKExtensionAdapter *)self requestLookup];
    id v11 = [v10 objectForKeyedSubscript:v7];

    objc_sync_exit(v9);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)_didCompleteExtensionRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(DKExtensionAdapter *)self _requestForExtensionRequestIdentifier:v4];
  id v6 = v5;
  if (v5)
  {
    [v5 complete];
  }
  else
  {
    id v7 = DiagnosticsKitLogHandleForCategory(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[DKExtensionAdapter _didCompleteExtensionRequest:]();
    }
  }
}

- (void)_didCancelExtensionRequest:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DKExtensionAdapter *)self _requestForExtensionRequestIdentifier:v6];
  id v9 = v8;
  if (v8)
  {
    [v8 cancelWithError:v7];
  }
  else
  {
    id v10 = DiagnosticsKitLogHandleForCategory(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[DKExtensionAdapter _didCancelExtensionRequest:error:]();
    }
  }
}

- (void)_didInterruptExtensionRequest:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v23 = a3;
  int v24 = -[DKExtensionAdapter _requestForExtensionRequestIdentifier:](self, "_requestForExtensionRequestIdentifier:");
  id v4 = [(DKExtensionAdapter *)self requestLookup];
  objc_sync_enter(v4);
  id v5 = [(DKExtensionAdapter *)self requestLookup];
  id v6 = [v5 allValues];
  id v7 = (void *)[v6 copy];

  objc_sync_exit(v4);
  id v8 = DiagnosticsKitLogHandleForCategory(1);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v24)
  {
    if (v9) {
      -[DKExtensionAdapter _didInterruptExtensionRequest:](v24, v8);
    }
  }
  else if (v9)
  {
    -[DKExtensionAdapter _didInterruptExtensionRequest:]();
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        __int16 v15 = DiagnosticsKitLogHandleForCategory(1);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = [v14 requestIdentifier];
          *(_DWORD *)buf = 138412290;
          uint64_t v30 = v16;
          _os_log_impl(&dword_23D039000, v15, OS_LOG_TYPE_DEFAULT, "[RID: %@] Calling interrupt", buf, 0xCu);
        }
        [v14 interrupt];
        uint64_t v17 = [v14 extensionRequestIdentifier];

        if (v17)
        {
          v18 = DiagnosticsKitLogHandleForCategory(1);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = [v14 requestIdentifier];
            *(_DWORD *)buf = 138412290;
            uint64_t v30 = v19;
            _os_log_impl(&dword_23D039000, v18, OS_LOG_TYPE_DEFAULT, "[RID: %@] Cancelling extension request", buf, 0xCu);
          }
          v20 = [(DKExtensionAdapter *)self extensionAttributes];
          char v21 = [v20 extension];
          v22 = [v14 extensionRequestIdentifier];
          [v21 cancelExtensionRequestWithIdentifier:v22];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v11);
  }
}

- (DKExtensionAttributes)extensionAttributes
{
  return self->_extensionAttributes;
}

- (NSMutableDictionary)requestLookup
{
  return self->_requestLookup;
}

- (void)setRequestLookup:(id)a3
{
}

- (NSMutableDictionary)extensionToRequestIdentifierLookup
{
  return self->_extensionToRequestIdentifierLookup;
}

- (void)setExtensionToRequestIdentifierLookup:(id)a3
{
}

- (OS_dispatch_queue)adapterQueue
{
  return self->_adapterQueue;
}

- (void)setAdapterQueue:(id)a3
{
}

- (OS_dispatch_queue)adapterConnectQueue
{
  return self->_adapterConnectQueue;
}

- (void)setAdapterConnectQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapterConnectQueue, 0);
  objc_storeStrong((id *)&self->_adapterQueue, 0);
  objc_storeStrong((id *)&self->_extensionToRequestIdentifierLookup, 0);
  objc_storeStrong((id *)&self->_requestLookup, 0);
  objc_storeStrong((id *)&self->_extensionAttributes, 0);
}

- (void)beginRequest:(uint8_t *)buf payload:(os_log_t)log completion:.cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5 = *(void *)(*(void *)a2 + 40);
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = v5;
  _os_log_error_impl(&dword_23D039000, log, OS_LOG_TYPE_ERROR, "[RID: %@] Did not get extension request identifier, error: %@", buf, 0x16u);
}

void __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_2_29_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23D039000, v0, v1, "[ERID: %@] requestInterruptionBlock", v2, v3, v4, v5, v6);
}

- (void)_didCompleteExtensionRequest:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23D039000, v0, v1, "[ERID: %@] Received completion for an unknown request.", v2, v3, v4, v5, v6);
}

- (void)_didCancelExtensionRequest:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23D039000, v0, v1, "[ERID: %@] Received cancellation for an unknown request.", v2, v3, v4, v5, v6);
}

- (void)_didInterruptExtensionRequest:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23D039000, v0, v1, "[ERID: %@] Received interruption for an unknown request.", v2, v3, v4, v5, v6);
}

- (void)_didInterruptExtensionRequest:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 requestIdentifier];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_23D039000, a2, OS_LOG_TYPE_ERROR, "[RID: %@] Received interruption for active request.", v4, 0xCu);
}

@end