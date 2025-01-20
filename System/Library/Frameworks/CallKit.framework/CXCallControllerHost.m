@interface CXCallControllerHost
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CXCallControllerHost)init;
- (CXCallControllerHost)initWithCalls:(id)a3 delegate:(id)a4 queue:(id)a5;
- (CXCallControllerHost)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (CXCallControllerHostDelegate)delegate;
- (NSMutableDictionary)callUUIDToCallMap;
- (NSMutableDictionary)callUUIDToPublicCallUUIDMap;
- (NSMutableSet)connections;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (id)_callsForCallControllerHostConnection:(id)a3;
- (id)_sanitizedCallFromCall:(id)a3 forCallControllerHostConnection:(id)a4;
- (int)clientsShouldConnectToken;
- (void)_performDelegateCallback:(id)a3;
- (void)addOrUpdateCall:(id)a3;
- (void)callControllerHostConnection:(id)a3 requestCalls:(id)a4;
- (void)callControllerHostConnection:(id)a3 requestTransaction:(id)a4 completion:(id)a5;
- (void)callControllerHostConnectionInvalidated:(id)a3;
- (void)dealloc;
- (void)removeCall:(id)a3;
- (void)setCallUUIDToCallMap:(id)a3;
- (void)setCallUUIDToPublicCallUUIDMap:(id)a3;
- (void)setConnections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setXpcListener:(id)a3;
@end

@implementation CXCallControllerHost

- (CXCallControllerHost)init
{
  return 0;
}

- (CXCallControllerHost)initWithCalls:(id)a3 delegate:(id)a4 queue:(id)a5
{
  if (a5) {
    id v6 = a5;
  }
  else {
    id v6 = (id)MEMORY[0x1E4F14428];
  }
  v7 = [(CXCallControllerHost *)self initWithDelegate:a4 delegateQueue:v6];

  return v7;
}

- (CXCallControllerHost)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CXCallControllerHost;
  id v8 = [(CXCallControllerHost *)&v20 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    v10 = (void *)*((void *)v8 + 6);
    *((void *)v8 + 6) = v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    v12 = (void *)*((void *)v8 + 7);
    *((void *)v8 + 7) = v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
    v14 = (void *)*((void *)v8 + 8);
    *((void *)v8 + 8) = v13;

    objc_storeWeak((id *)v8 + 3, v6);
    objc_storeStrong((id *)v8 + 4, a4);
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[@"com.apple.callkit.callcontrollerhost" UTF8String], 0);
    v16 = (void *)*((void *)v8 + 2);
    *((void *)v8 + 2) = v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.callkit.callcontrollerhost"];
    v18 = (void *)*((void *)v8 + 5);
    *((void *)v8 + 5) = v17;

    [*((id *)v8 + 5) setDelegate:v8];
    notify_register_dispatch("com.apple.callkit.callcontroller.shouldconnect", (int *)v8 + 2, *((dispatch_queue_t *)v8 + 2), &__block_literal_global_1);
    notify_set_state(*((_DWORD *)v8 + 2), 0);
    [*((id *)v8 + 5) resume];
  }

  return (CXCallControllerHost *)v8;
}

- (void)dealloc
{
  notify_cancel(self->_clientsShouldConnectToken);
  v3.receiver = self;
  v3.super_class = (Class)CXCallControllerHost;
  [(CXCallControllerHost *)&v3 dealloc];
}

- (void)addOrUpdateCall:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallControllerHost *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__CXCallControllerHost_addOrUpdateCall___block_invoke;
  v7[3] = &unk_1E5CADC68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __40__CXCallControllerHost_addOrUpdateCall___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) callUUIDToCallMap];
  uint64_t v3 = [v2 count];

  if (!v3)
  {
    notify_set_state(*(_DWORD *)(*(void *)(a1 + 32) + 8), 1uLL);
    notify_post("com.apple.callkit.callcontroller.shouldconnect");
  }
  uint64_t v4 = *(void *)(a1 + 40);
  v5 = [*(id *)(a1 + 32) callUUIDToCallMap];
  id v6 = [*(id *)(a1 + 40) UUID];
  [v5 setObject:v4 forKeyedSubscript:v6];

  id v7 = [*(id *)(a1 + 32) callUUIDToPublicCallUUIDMap];
  id v8 = [*(id *)(a1 + 40) UUID];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [*(id *)(a1 + 32) callUUIDToPublicCallUUIDMap];
    v12 = [*(id *)(a1 + 40) UUID];
    [v11 setObject:v10 forKeyedSubscript:v12];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "connections", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v19 = [*(id *)(a1 + 32) _sanitizedCallFromCall:*(void *)(a1 + 40) forCallControllerHostConnection:v18];
        if (v19) {
          [v18 addOrUpdateCall:v19];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }
}

- (void)removeCall:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallControllerHost *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__CXCallControllerHost_removeCall___block_invoke;
  v7[3] = &unk_1E5CADC68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __35__CXCallControllerHost_removeCall___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) callUUIDToCallMap];
  uint64_t v3 = [v2 count];

  if (!v3) {
    notify_set_state(*(_DWORD *)(*(void *)(a1 + 32) + 8), 0);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "connections", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v10 = [*(id *)(a1 + 32) _sanitizedCallFromCall:*(void *)(a1 + 40) forCallControllerHostConnection:v9];
        if (v10) {
          [v9 removeCall:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  uint64_t v11 = [*(id *)(a1 + 32) callUUIDToCallMap];
  v12 = [*(id *)(a1 + 40) UUID];
  [v11 removeObjectForKey:v12];

  uint64_t v13 = [*(id *)(a1 + 32) callUUIDToPublicCallUUIDMap];
  uint64_t v14 = [*(id *)(a1 + 40) UUID];
  [v13 removeObjectForKey:v14];
}

- (void)_performDelegateCallback:(id)a3
{
  dispatch_block_t block = a3;
  id v4 = [(CXCallControllerHost *)self queue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(CXCallControllerHost *)self delegate];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = [(CXCallControllerHost *)self delegateQueue];

    if (v7)
    {
      id v8 = [(CXCallControllerHost *)self delegateQueue];
      dispatch_async(v8, block);
    }
  }
}

- (id)_sanitizedCallFromCall:(id)a3 forCallControllerHostConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CXCallControllerHost *)self queue];
  dispatch_assert_queue_V2(v8);

  if ([v7 isPermittedToUsePrivateAPI])
  {
    uint64_t v9 = (CXCall *)v6;
LABEL_6:
    long long v15 = v9;
    goto LABEL_10;
  }
  uint64_t v10 = [v6 providerIdentifier];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    v12 = [v6 providerIdentifier];
    uint64_t v13 = [v7 applicationIdentifier];
    int v14 = [v12 isEqualToString:v13];

    if (v14)
    {
      uint64_t v9 = [v6 sanitizedCopy];
      goto LABEL_6;
    }
  }
  long long v16 = [(CXCallControllerHost *)self callUUIDToPublicCallUUIDMap];
  long long v17 = [v6 UUID];
  long long v18 = [v16 objectForKeyedSubscript:v17];

  if (v18)
  {
    v19 = [CXCall alloc];
    uint64_t v20 = [(CXCallControllerHost *)self callUUIDToPublicCallUUIDMap];
    long long v21 = [v6 UUID];
    long long v22 = [v20 objectForKeyedSubscript:v21];
    long long v15 = [(CXCall *)v19 initWithUUID:v22];

    [v6 updateSanitizedCopy:v15 withZone:0];
  }
  else
  {
    long long v15 = 0;
  }
LABEL_10:

  return v15;
}

- (id)_callsForCallControllerHostConnection:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CXCallControllerHost *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = [(CXCallControllerHost *)self callUUIDToCallMap];
  id v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [(CXCallControllerHost *)self callUUIDToCallMap];
  uint64_t v10 = [v9 allValues];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = [(CXCallControllerHost *)self _sanitizedCallFromCall:*(void *)(*((void *)&v18 + 1) + 8 * i) forCallControllerHostConnection:v4];
        if (v15) {
          [v8 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  long long v16 = (void *)[v8 copy];

  return v16;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = CXDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v5;
    _os_log_impl(&dword_1A6E3A000, v6, OS_LOG_TYPE_DEFAULT, "Asked to accept new connection from %@", buf, 0xCu);
  }

  *(_OWORD *)buf = 0u;
  long long v20 = 0u;
  if (v5) {
    [v5 auditToken];
  }
  if (ba_is_process_extension())
  {
    id v7 = CXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long v17 = 138412290;
      id v18 = v5;
      id v8 = "Process is a background asset extension; rejecting connection %@";
LABEL_11:
      _os_log_impl(&dword_1A6E3A000, v7, OS_LOG_TYPE_DEFAULT, v8, v17, 0xCu);
    }
  }
  else
  {
    if (!objc_msgSend(v5, "cx_isProcessOnDemandInstallCapable"))
    {
      uint64_t v10 = [CXCallControllerHostConnection alloc];
      uint64_t v11 = [(CXCallControllerHost *)self queue];
      uint64_t v12 = [(CXCallControllerHostConnection *)v10 initWithConnection:v5 serialQueue:v11];

      [(CXCallControllerHostConnection *)v12 setDelegate:self];
      uint64_t v13 = [(CXCallControllerHost *)self queue];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __59__CXCallControllerHost_listener_shouldAcceptNewConnection___block_invoke;
      v15[3] = &unk_1E5CADC68;
      v15[4] = self;
      long long v16 = v12;
      id v7 = v12;
      dispatch_async(v13, v15);

      BOOL v9 = 1;
      goto LABEL_14;
    }
    id v7 = CXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long v17 = 138412290;
      id v18 = v5;
      id v8 = "Process is an App Clip extension; rejecting connection %@";
      goto LABEL_11;
    }
  }
  BOOL v9 = 0;
LABEL_14:

  return v9;
}

void __59__CXCallControllerHost_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connections];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)callControllerHostConnectionInvalidated:(id)a3
{
  id v4 = a3;
  id v5 = [(CXCallControllerHost *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CXCallControllerHost *)self connections];
  [v6 removeObject:v4];
}

- (void)callControllerHostConnection:(id)a3 requestCalls:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(CXCallControllerHost *)self queue];
  dispatch_assert_queue_V2(v8);

  BOOL v9 = CXDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_1A6E3A000, v9, OS_LOG_TYPE_DEFAULT, "callControllerHostConnection: %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v10 = [(CXCallControllerHost *)self _callsForCallControllerHostConnection:v6];
  v7[2](v7, v10);
}

- (void)callControllerHostConnection:(id)a3 requestTransaction:(id)a4 completion:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(CXCallControllerHost *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = CXDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v37 = v8;
    __int16 v38 = 2112;
    id v39 = v9;
    _os_log_impl(&dword_1A6E3A000, v12, OS_LOG_TYPE_DEFAULT, "callControllerHostConnection: %@ transaction: %@", buf, 0x16u);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v13 = [v9 actions];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v14)
  {

    goto LABEL_18;
  }
  uint64_t v15 = v14;
  v26 = v10;
  int v16 = 0;
  int v17 = 0;
  uint64_t v18 = *(void *)v32;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v32 != v18) {
        objc_enumerationMutation(v13);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v17 = 1;
      }
      else
      {
        objc_opt_class();
        v16 |= objc_opt_isKindOfClass();
      }
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
  }
  while (v15);

  if (v17 & v16)
  {
    long long v20 = CXDefaultLog();
    id v10 = v26;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[CXCallControllerHost callControllerHostConnection:requestTransaction:completion:]((uint64_t)v8, v20);
    }

    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = 6;
LABEL_21:
    v24 = objc_msgSend(v21, "cx_requestTransactionErrorWithCode:", v22);
    (*((void (**)(id, void *))v10 + 2))(v10, v24);

    goto LABEL_22;
  }
  id v10 = v26;
  if ((v17 & 1) == 0)
  {
    if ((v16 & 1) != 0 && [v8 isChannelTransactionRequestPermitted]) {
      goto LABEL_28;
    }
LABEL_18:
    uint64_t v23 = CXDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[CXCallControllerHost callControllerHostConnection:requestTransaction:completion:]((uint64_t)v8, v23);
    }

    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = 1;
    goto LABEL_21;
  }
  if (([v8 isCallTransactionRequestPermitted] & 1) == 0) {
    goto LABEL_18;
  }
LABEL_28:
  if (([v8 isPermittedToUsePrivateAPI] & 1) == 0)
  {
    uint64_t v25 = [v9 sanitizedCopy];

    id v9 = (id)v25;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __83__CXCallControllerHost_callControllerHostConnection_requestTransaction_completion___block_invoke;
  v27[3] = &unk_1E5CADE60;
  v27[4] = self;
  id v28 = v8;
  id v9 = v9;
  id v29 = v9;
  id v30 = v26;
  [(CXCallControllerHost *)self _performDelegateCallback:v27];

LABEL_22:
}

void __83__CXCallControllerHost_callControllerHostConnection_requestTransaction_completion___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) applicationIdentifier];
  [v4 callControllerHost:v2 clientWithIdentifier:v3 requestedTransaction:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CXCallControllerHostDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXCallControllerHostDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (NSMutableDictionary)callUUIDToCallMap
{
  return self->_callUUIDToCallMap;
}

- (void)setCallUUIDToCallMap:(id)a3
{
}

- (NSMutableDictionary)callUUIDToPublicCallUUIDMap
{
  return self->_callUUIDToPublicCallUUIDMap;
}

- (void)setCallUUIDToPublicCallUUIDMap:(id)a3
{
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (int)clientsShouldConnectToken
{
  return self->_clientsShouldConnectToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_callUUIDToPublicCallUUIDMap, 0);
  objc_storeStrong((id *)&self->_callUUIDToCallMap, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)callControllerHostConnection:(uint64_t)a1 requestTransaction:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Connection is not permitted to issue transaction requests: %@", (uint8_t *)&v2, 0xCu);
}

- (void)callControllerHostConnection:(uint64_t)a1 requestTransaction:(NSObject *)a2 completion:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Transaction contains call and channel actions; rejecting request by connection %@",
    (uint8_t *)&v2,
    0xCu);
}

@end