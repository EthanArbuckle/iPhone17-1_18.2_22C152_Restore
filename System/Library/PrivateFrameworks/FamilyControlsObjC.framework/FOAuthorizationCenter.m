@interface FOAuthorizationCenter
+ (FOAuthorizationCenter)sharedCenter;
- (FOAuthorizationCenter)init;
- (NSArray)authorizationRecords;
- (NSObject)connectionLock;
- (NSXPCConnection)currentConnection;
- (id)authorizationsPlist;
- (id)xpcConnection;
- (void)authorizationsPlist;
- (void)clearCurrentConnectionAndInvalidate:(BOOL)a3;
- (void)dealloc;
- (void)requestAuthorizationForRecordIdentifier:(id)a3 completionHandler:(id)a4;
- (void)requestInternalAuthorizationForMember:(int64_t)a3 completionHandler:(id)a4;
- (void)resetAuthorizationForRecordIdentifier:(id)a3 completionHandler:(id)a4;
- (void)revokeAuthorizationForDeletionForRecordIdentifier:(id)a3 completionHandler:(id)a4;
- (void)revokeAuthorizationForRecordIdentifier:(id)a3 completionHandler:(id)a4;
- (void)revokeInternalAuthorizationWithCompletionHandler:(id)a3;
- (void)setCurrentConnection:(id)a3;
@end

@implementation FOAuthorizationCenter

+ (FOAuthorizationCenter)sharedCenter
{
  if (sharedCenter_onceToken != -1) {
    dispatch_once(&sharedCenter_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedCenter_sharedCenter;

  return (FOAuthorizationCenter *)v2;
}

uint64_t __37__FOAuthorizationCenter_sharedCenter__block_invoke()
{
  sharedCenter_sharedCenter = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (FOAuthorizationCenter)init
{
  v7.receiver = self;
  v7.super_class = (Class)FOAuthorizationCenter;
  v2 = [(FOAuthorizationCenter *)&v7 init];
  currentConnection = v2->_currentConnection;
  v2->_currentConnection = 0;

  uint64_t v4 = objc_opt_new();
  connectionLock = v2->_connectionLock;
  v2->_connectionLock = v4;

  return v2;
}

- (void)dealloc
{
  [(FOAuthorizationCenter *)self clearCurrentConnectionAndInvalidate:1];
  v3.receiver = self;
  v3.super_class = (Class)FOAuthorizationCenter;
  [(FOAuthorizationCenter *)&v3 dealloc];
}

- (id)xpcConnection
{
  objc_super v3 = self->_connectionLock;
  objc_sync_enter(v3);
  p_currentConnection = &self->_currentConnection;
  currentConnection = self->_currentConnection;
  if (!currentConnection)
  {
    id v6 = +[FOAgentConnectionPrivate newConnection];
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __38__FOAuthorizationCenter_xpcConnection__block_invoke;
    v11[3] = &unk_2645E6B40;
    objc_copyWeak(&v12, &location);
    [v6 setInterruptionHandler:v11];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __38__FOAuthorizationCenter_xpcConnection__block_invoke_2;
    v9[3] = &unk_2645E6B40;
    objc_copyWeak(&v10, &location);
    [v6 setInvalidationHandler:v9];
    objc_storeStrong((id *)p_currentConnection, v6);
    [v6 activate];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

    currentConnection = *p_currentConnection;
  }
  objc_super v7 = currentConnection;
  objc_sync_exit(v3);

  return v7;
}

void __38__FOAuthorizationCenter_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained clearCurrentConnectionAndInvalidate:1];
}

void __38__FOAuthorizationCenter_xpcConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained clearCurrentConnectionAndInvalidate:0];
}

- (void)clearCurrentConnectionAndInvalidate:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self->_connectionLock;
  objc_sync_enter(obj);
  if (v3)
  {
    [(NSXPCConnection *)self->_currentConnection setInvalidationHandler:0];
    [(NSXPCConnection *)self->_currentConnection invalidate];
  }
  currentConnection = self->_currentConnection;
  self->_currentConnection = 0;

  objc_sync_exit(obj);
}

- (id)authorizationsPlist
{
  v2 = +[FOLocations familyControlsAuthorization];

  if (v2)
  {
    BOOL v3 = NSURL;
    uint64_t v4 = +[FOLocations familyControlsAuthorization];
    v5 = [v4 path];
    id v6 = [v3 fileURLWithPath:v5];

    id v11 = 0;
    objc_super v7 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithContentsOfURL:v6 error:&v11];
    id v8 = v11;
    if (v8)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        -[FOAuthorizationCenter authorizationsPlist]();
      }
      id v9 = (id)MEMORY[0x263EFFA68];
    }
    else
    {
      id v9 = v7;
    }
  }
  else
  {
    id v9 = (id)MEMORY[0x263EFFA68];
  }

  return v9;
}

- (NSArray)authorizationRecords
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(FOAuthorizationCenter *)self authorizationsPlist];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_super v7 = [FOAuthorizationRecord alloc];
        id v8 = [v6 valueForKey:@"bundleIdentifier"];
        id v9 = [v6 valueForKey:@"teamIdentifier"];
        id v10 = objc_alloc(MEMORY[0x263F08C38]);
        id v11 = [v6 valueForKey:@"recordIdentifier"];
        id v12 = (void *)[v10 initWithUUIDString:v11];
        v13 = [v6 valueForKey:@"status"];
        uint64_t v14 = [v13 integerValue];
        v15 = [v6 valueForKey:@"type"];
        v16 = -[FOAuthorizationRecord initWithBundleIdentifier:teamIdentifier:recordIdentifier:status:type:](v7, "initWithBundleIdentifier:teamIdentifier:recordIdentifier:status:type:", v8, v9, v12, v14, [v15 integerValue]);

        [v20 addObject:v16];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }

  return (NSArray *)v20;
}

- (void)requestAuthorizationForRecordIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FOAuthorizationCenter *)self xpcConnection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_2645E6B90;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  +[FOXPCRemoteObjectProxy proxyFromConnection:v8 withRetryCount:1 proxyHandler:v11];
}

void __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_2;
    v8[3] = &unk_2645E6B68;
    id v9 = v7;
    id v10 = *(id *)(a1 + 40);
    [v5 requestAuthorizationWithRecordIdentifier:v9 replyHandler:v8];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_2_cold_1();
    }
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v4();
}

- (void)requestInternalAuthorizationForMember:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(FOAuthorizationCenter *)self xpcConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__FOAuthorizationCenter_requestInternalAuthorizationForMember_completionHandler___block_invoke;
  v9[3] = &unk_2645E6BE0;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  +[FOXPCRemoteObjectProxy proxyFromConnection:v7 withRetryCount:1 proxyHandler:v9];
}

void __81__FOAuthorizationCenter_requestInternalAuthorizationForMember_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __81__FOAuthorizationCenter_requestInternalAuthorizationForMember_completionHandler___block_invoke_2;
    v8[3] = &unk_2645E6BB8;
    uint64_t v7 = *(void *)(a1 + 40);
    id v9 = *(id *)(a1 + 32);
    [v5 requestInternalAuthorizationForMember:v7 replyHandler:v8];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __81__FOAuthorizationCenter_requestInternalAuthorizationForMember_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __81__FOAuthorizationCenter_requestInternalAuthorizationForMember_completionHandler___block_invoke_2_cold_1();
    }
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v4();
}

- (void)resetAuthorizationForRecordIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FOAuthorizationCenter *)self xpcConnection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __81__FOAuthorizationCenter_resetAuthorizationForRecordIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_2645E6B90;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  +[FOXPCRemoteObjectProxy proxyFromConnection:v8 withRetryCount:1 proxyHandler:v11];
}

void __81__FOAuthorizationCenter_resetAuthorizationForRecordIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __81__FOAuthorizationCenter_resetAuthorizationForRecordIdentifier_completionHandler___block_invoke_2;
    v8[3] = &unk_2645E6B68;
    id v9 = v7;
    id v10 = *(id *)(a1 + 40);
    [v5 resetAuthorizationWithRecordIdentifier:v9 replyHandler:v8];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __81__FOAuthorizationCenter_resetAuthorizationForRecordIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __81__FOAuthorizationCenter_resetAuthorizationForRecordIdentifier_completionHandler___block_invoke_2_cold_1();
    }
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v4();
}

- (void)revokeAuthorizationForRecordIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FOAuthorizationCenter *)self xpcConnection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__FOAuthorizationCenter_revokeAuthorizationForRecordIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_2645E6B90;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  +[FOXPCRemoteObjectProxy proxyFromConnection:v8 withRetryCount:1 proxyHandler:v11];
}

void __82__FOAuthorizationCenter_revokeAuthorizationForRecordIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __82__FOAuthorizationCenter_revokeAuthorizationForRecordIdentifier_completionHandler___block_invoke_2;
    v8[3] = &unk_2645E6B68;
    id v9 = v7;
    id v10 = *(id *)(a1 + 40);
    [v5 revokeAuthorizationWithRecordIdentifier:v9 replyHandler:v8];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __82__FOAuthorizationCenter_revokeAuthorizationForRecordIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __82__FOAuthorizationCenter_revokeAuthorizationForRecordIdentifier_completionHandler___block_invoke_2_cold_1();
    }
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v4();
}

- (void)revokeAuthorizationForDeletionForRecordIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FOAuthorizationCenter *)self xpcConnection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __93__FOAuthorizationCenter_revokeAuthorizationForDeletionForRecordIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_2645E6B90;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  +[FOXPCRemoteObjectProxy proxyFromConnection:v8 withRetryCount:1 proxyHandler:v11];
}

void __93__FOAuthorizationCenter_revokeAuthorizationForDeletionForRecordIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __93__FOAuthorizationCenter_revokeAuthorizationForDeletionForRecordIdentifier_completionHandler___block_invoke_2;
    v8[3] = &unk_2645E6B68;
    id v9 = v7;
    id v10 = *(id *)(a1 + 40);
    [v5 revokeAuthorizationForDeletionWithRecordIdentifier:v9 replyHandler:v8];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __93__FOAuthorizationCenter_revokeAuthorizationForDeletionForRecordIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __93__FOAuthorizationCenter_revokeAuthorizationForDeletionForRecordIdentifier_completionHandler___block_invoke_2_cold_1();
    }
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v4();
}

- (void)revokeInternalAuthorizationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(FOAuthorizationCenter *)self xpcConnection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__FOAuthorizationCenter_revokeInternalAuthorizationWithCompletionHandler___block_invoke;
  v7[3] = &unk_2645E6C08;
  id v8 = v4;
  id v6 = v4;
  +[FOXPCRemoteObjectProxy proxyFromConnection:v5 withRetryCount:1 proxyHandler:v7];
}

void __74__FOAuthorizationCenter_revokeInternalAuthorizationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __74__FOAuthorizationCenter_revokeInternalAuthorizationWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_2645E6BB8;
    id v8 = *(id *)(a1 + 32);
    [v5 revokeInternalAuthorizationWithReplyHandler:v7];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __74__FOAuthorizationCenter_revokeInternalAuthorizationWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __74__FOAuthorizationCenter_revokeInternalAuthorizationWithCompletionHandler___block_invoke_2_cold_1();
    }
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v4();
}

- (NSXPCConnection)currentConnection
{
  return self->_currentConnection;
}

- (void)setCurrentConnection:(id)a3
{
}

- (NSObject)connectionLock
{
  return self->_connectionLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionLock, 0);

  objc_storeStrong((id *)&self->_currentConnection, 0);
}

- (void)authorizationsPlist
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_221CA3000, &_os_log_internal, v0, "Failed to read Authorizations.plist: %{public}@", v1, v2, v3, v4, v5);
}

void __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_221CA3000, &_os_log_internal, v0, "Failed to create proxy with error: %{public}@", v1, v2, v3, v4, v5);
}

void __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221CA3000, &_os_log_internal, v0, "Failed to request authorization for record identifier: %{public}@ with error: %{public}@", v1, v2, v3, v4, v5);
}

void __81__FOAuthorizationCenter_requestInternalAuthorizationForMember_completionHandler___block_invoke_2_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_221CA3000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to request internal authorization", v0, 2u);
}

void __81__FOAuthorizationCenter_resetAuthorizationForRecordIdentifier_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221CA3000, &_os_log_internal, v0, "Failed to reset authorization for record identifier: %{public}@ with error: %{public}@", v1, v2, v3, v4, v5);
}

void __82__FOAuthorizationCenter_revokeAuthorizationForRecordIdentifier_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221CA3000, &_os_log_internal, v0, "Failed to revoke authorization for record identifier: %{public}@ with error: %{public}@", v1, v2, v3, v4, v5);
}

void __93__FOAuthorizationCenter_revokeAuthorizationForDeletionForRecordIdentifier_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221CA3000, &_os_log_internal, v0, "Failed to revoke authorization for deletion for record identifier: %{public}@ with error: %{public}@", v1, v2, v3, v4, v5);
}

void __74__FOAuthorizationCenter_revokeInternalAuthorizationWithCompletionHandler___block_invoke_2_cold_1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_221CA3000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to revoke internal authorization with error: %{public}@", v0, 0xCu);
}

@end