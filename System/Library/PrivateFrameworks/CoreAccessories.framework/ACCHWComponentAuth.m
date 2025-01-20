@interface ACCHWComponentAuth
+ (id)sharedManager;
- (ACCHWComponentAuth)init;
- (NSXPCConnection)xpcConnection;
- (id)_init;
- (void)_init;
- (void)authenticateBatteryWithChallenge:(id)a3 completionHandler:(id)a4;
- (void)authenticateTouchControllerWithChallenge:(id)a3 completionHandler:(id)a4;
- (void)authenticateTouchControllerWithChallenge:(id)a3 completionHandler:(id)a4 updateRegistry:(BOOL)a5;
- (void)authenticateVeridianWithChallenge:(id)a3 completionHandler:(id)a4;
- (void)authenticateVeridianWithChallenge:(id)a3 completionHandler:(id)a4 updateRegistry:(BOOL)a5 updateUIProperty:(BOOL)a6 logToAnalytics:(BOOL)a7;
- (void)setXpcConnection:(id)a3;
- (void)signVeridianChallenge:(id)a3 completionHandler:(id)a4;
- (void)verifyBatteryMatch:(id)a3 completionHandler:(id)a4;
@end

@implementation ACCHWComponentAuth

- (ACCHWComponentAuth)init
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(sel_sharedManager);
  v9 = NSStringFromSelector(a2);
  [v4 raise:v5, @"Use +[%@ %@] instead of -%@.", v7, v8, v9 format];

  return 0;
}

- (id)_init
{
  init_logging();
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 4;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v5 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(ACCHWComponentAuth *)(uint64_t)self _init];
  }

  v14.receiver = self;
  v14.super_class = (Class)ACCHWComponentAuth;
  v6 = [(ACCHWComponentAuth *)&v14 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.ACCHWComponentAuthService"];
    xpcConnection = v6->_xpcConnection;
    v6->_xpcConnection = (NSXPCConnection *)v7;

    v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C7B260];
    [(NSXPCConnection *)v6->_xpcConnection setRemoteObjectInterface:v9];

    [(NSXPCConnection *)v6->_xpcConnection resume];
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v10 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      v10 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_DEFAULT, "resumed XPC connection", v13, 2u);
    }
  }
  return v6;
}

- (void)authenticateBatteryWithChallenge:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 4;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    v10 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  else
  {
    v10 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = "YES";
    if (!v7) {
      id v11 = "NO";
    }
    *(_DWORD *)buf = 136315138;
    v19 = v11;
    _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_DEFAULT, "Authenticating battery... (completionHandler: %s)", buf, 0xCu);
  }

  v12 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke;
  block[3] = &unk_1E6074860;
  id v16 = v6;
  id v17 = v7;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  dispatch_sync(v12, block);
}

void __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) xpcConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_2;
  v7[3] = &unk_1E6073DE0;
  id v8 = *(id *)(a1 + 48);
  BOOL v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_24;
  v5[3] = &unk_1E6074838;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 authenticateBatteryWithChallenge:v4 completionHandler:v5];
}

void __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_24(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 4;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    v15 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
  }
  else
  {
    v15 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v19[0] = 67109632;
    v19[1] = a2;
    __int16 v20 = 1024;
    int v21 = a5;
    __int16 v22 = 1024;
    int v23 = a6;
    _os_log_impl(&dword_1B3C21000, v15, OS_LOG_TYPE_INFO, "battery authPassed = %d, fdrValidationStatus %d, authError %d", (uint8_t *)v19, 0x14u);
  }

  uint64_t v16 = *(void *)(a1 + 32);
  if (v16)
  {
    (*(void (**)(uint64_t, uint64_t, id, id, uint64_t, uint64_t))(v16 + 16))(v16, a2, v11, v12, a5, a6);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      id v17 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v17 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_24_cold_1();
    }
  }
}

- (void)authenticateTouchControllerWithChallenge:(id)a3 completionHandler:(id)a4
{
}

- (void)authenticateTouchControllerWithChallenge:(id)a3 completionHandler:(id)a4 updateRegistry:(BOOL)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 4;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v12 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v12 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v13 = "YES";
    if (!v9) {
      BOOL v13 = "NO";
    }
    *(_DWORD *)buf = 136315138;
    __int16 v22 = v13;
    _os_log_impl(&dword_1B3C21000, v12, OS_LOG_TYPE_DEFAULT, "Authenticating touch controller... (completionHandler: %s)", buf, 0xCu);
  }

  id v14 = dispatch_get_global_queue(25, 0);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __96__ACCHWComponentAuth_authenticateTouchControllerWithChallenge_completionHandler_updateRegistry___block_invoke;
  v17[3] = &unk_1E6074888;
  id v18 = v8;
  id v19 = v9;
  v17[4] = self;
  BOOL v20 = a5;
  id v15 = v8;
  id v16 = v9;
  dispatch_sync(v14, v17);
}

void __96__ACCHWComponentAuth_authenticateTouchControllerWithChallenge_completionHandler_updateRegistry___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) xpcConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__ACCHWComponentAuth_authenticateTouchControllerWithChallenge_completionHandler_updateRegistry___block_invoke_2;
  v7[3] = &unk_1E6073DE0;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __96__ACCHWComponentAuth_authenticateTouchControllerWithChallenge_completionHandler_updateRegistry___block_invoke_27;
  v5[3] = &unk_1E6074838;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 authenticateTouchControllerWithChallenge:v4 completionHandler:v5 updateRegistry:*(unsigned __int8 *)(a1 + 56)];
}

void __96__ACCHWComponentAuth_authenticateTouchControllerWithChallenge_completionHandler_updateRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __96__ACCHWComponentAuth_authenticateTouchControllerWithChallenge_completionHandler_updateRegistry___block_invoke_27(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 4;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v15 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v15 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v19[0] = 67109632;
    v19[1] = a2;
    __int16 v20 = 1024;
    int v21 = a5;
    __int16 v22 = 1024;
    int v23 = a6;
    _os_log_impl(&dword_1B3C21000, v15, OS_LOG_TYPE_INFO, "touch authPassed = %d, fdrValidationStatus %d, authError %d", (uint8_t *)v19, 0x14u);
  }

  uint64_t v16 = *(void *)(a1 + 32);
  if (v16)
  {
    (*(void (**)(uint64_t, uint64_t, id, id, uint64_t, uint64_t))(v16 + 16))(v16, a2, v11, v12, a5, a6);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      id v17 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v17 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_24_cold_1();
    }
  }
}

- (void)authenticateVeridianWithChallenge:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 4;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v10 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v10 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = "YES";
    if (!v7) {
      id v11 = "NO";
    }
    *(_DWORD *)buf = 136315138;
    id v19 = v11;
    _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_DEFAULT, "Authenticating battery... (completionHandler: %s)", buf, 0xCu);
  }

  id v12 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler___block_invoke;
  block[3] = &unk_1E6074860;
  id v16 = v6;
  id v17 = v7;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  dispatch_sync(v12, block);
}

void __74__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) xpcConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler___block_invoke_2;
  v7[3] = &unk_1E6073DE0;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler___block_invoke_28;
  v5[3] = &unk_1E6074838;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 authenticateVeridianWithChallenge:v4 completionHandler:v5];
}

void __74__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler___block_invoke_28(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 4;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v15 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v15 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v19[0] = 67109632;
    v19[1] = a2;
    __int16 v20 = 1024;
    int v21 = a5;
    __int16 v22 = 1024;
    int v23 = a6;
    _os_log_impl(&dword_1B3C21000, v15, OS_LOG_TYPE_INFO, "battery authPassed = %d, fdrValidationStatus %d, authError %d", (uint8_t *)v19, 0x14u);
  }

  uint64_t v16 = *(void *)(a1 + 32);
  if (v16)
  {
    (*(void (**)(uint64_t, uint64_t, id, id, uint64_t, uint64_t))(v16 + 16))(v16, a2, v11, v12, a5, a6);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      id v17 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v17 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_24_cold_1();
    }
  }
}

- (void)authenticateVeridianWithChallenge:(id)a3 completionHandler:(id)a4 updateRegistry:(BOOL)a5 updateUIProperty:(BOOL)a6 logToAnalytics:(BOOL)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if (gLogObjects) {
    BOOL v14 = gNumLogObjects < 4;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v16 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v16 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = "YES";
    if (!v13) {
      id v17 = "NO";
    }
    *(_DWORD *)buf = 136315138;
    v28 = v17;
    _os_log_impl(&dword_1B3C21000, v16, OS_LOG_TYPE_DEFAULT, "Authenticating battery... (completionHandler: %s)", buf, 0xCu);
  }

  id v18 = dispatch_get_global_queue(25, 0);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __121__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics___block_invoke;
  v21[3] = &unk_1E60748B0;
  id v22 = v12;
  id v23 = v13;
  v21[4] = self;
  BOOL v24 = a5;
  BOOL v25 = a6;
  BOOL v26 = a7;
  id v19 = v12;
  id v20 = v13;
  dispatch_sync(v18, v21);
}

void __121__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) xpcConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __121__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics___block_invoke_2;
  v7[3] = &unk_1E6073DE0;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __121__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics___block_invoke_29;
  v5[3] = &unk_1E6074838;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 authenticateVeridianWithChallenge:v4 completionHandler:v5 updateRegistry:*(unsigned __int8 *)(a1 + 56) updateUIProperty:*(unsigned __int8 *)(a1 + 57) logToAnalytics:*(unsigned __int8 *)(a1 + 58)];
}

void __121__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __121__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics___block_invoke_29(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 4;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v15 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v15 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v19[0] = 67109632;
    v19[1] = a2;
    __int16 v20 = 1024;
    int v21 = a5;
    __int16 v22 = 1024;
    int v23 = a6;
    _os_log_impl(&dword_1B3C21000, v15, OS_LOG_TYPE_INFO, "battery authPassed = %d, fdrValidationStatus %d, authError %d", (uint8_t *)v19, 0x14u);
  }

  uint64_t v16 = *(void *)(a1 + 32);
  if (v16)
  {
    (*(void (**)(uint64_t, uint64_t, id, id, uint64_t, uint64_t))(v16 + 16))(v16, a2, v11, v12, a5, a6);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      id v17 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v17 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_24_cold_1();
    }
  }
}

- (void)signVeridianChallenge:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 4;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v10 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v10 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = "YES";
    if (!v7) {
      id v11 = "NO";
    }
    *(_DWORD *)buf = 136315138;
    id v19 = v11;
    _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_DEFAULT, "Signing battery challenge... (completionHandler: %s)", buf, 0xCu);
  }

  id v12 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__ACCHWComponentAuth_signVeridianChallenge_completionHandler___block_invoke;
  block[3] = &unk_1E6074860;
  id v16 = v6;
  id v17 = v7;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  dispatch_sync(v12, block);
}

void __62__ACCHWComponentAuth_signVeridianChallenge_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) xpcConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__ACCHWComponentAuth_signVeridianChallenge_completionHandler___block_invoke_2;
  v7[3] = &unk_1E6073DE0;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__ACCHWComponentAuth_signVeridianChallenge_completionHandler___block_invoke_30;
  v5[3] = &unk_1E60748D8;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 signVeridianChallenge:v4 completionHandler:v5];
}

void __62__ACCHWComponentAuth_signVeridianChallenge_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__ACCHWComponentAuth_signVeridianChallenge_completionHandler___block_invoke_30(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 4;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v11 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v11 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v15[0] = 67109120;
    v15[1] = a4;
    _os_log_impl(&dword_1B3C21000, v11, OS_LOG_TYPE_INFO, "signed battery challenge authError %d", (uint8_t *)v15, 8u);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    (*(void (**)(uint64_t, id, id, uint64_t))(v12 + 16))(v12, v7, v8, a4);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      id v13 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v13 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_24_cold_1();
    }
  }
}

- (void)verifyBatteryMatch:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 4;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v10 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = "YES";
    if (!v7) {
      id v11 = "NO";
    }
    *(_DWORD *)buf = 136315138;
    id v19 = v11;
    _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_DEFAULT, "Verifying battery match... (completionHandler: %s)", buf, 0xCu);
  }

  uint64_t v12 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ACCHWComponentAuth_verifyBatteryMatch_completionHandler___block_invoke;
  block[3] = &unk_1E6074860;
  id v16 = v6;
  id v17 = v7;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  dispatch_sync(v12, block);
}

void __59__ACCHWComponentAuth_verifyBatteryMatch_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) xpcConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ACCHWComponentAuth_verifyBatteryMatch_completionHandler___block_invoke_2;
  v7[3] = &unk_1E6073DE0;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__ACCHWComponentAuth_verifyBatteryMatch_completionHandler___block_invoke_32;
  v5[3] = &unk_1E6074900;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 verifyBatteryMatch:v4 completionHandler:v5];
}

void __59__ACCHWComponentAuth_verifyBatteryMatch_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__ACCHWComponentAuth_verifyBatteryMatch_completionHandler___block_invoke_32(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_INFO, "battery match verification authError %d", (uint8_t *)v10, 8u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      id v8 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_24_cold_1();
    }
  }
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__ACCHWComponentAuth_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once_1 != -1) {
    dispatch_once(&sharedManager_once_1, block);
  }
  v2 = (void *)sharedManager_sharedInstance_1;

  return v2;
}

uint64_t __35__ACCHWComponentAuth_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedInstance_1 = [objc_alloc(*(Class *)(a1 + 32)) _init];

  return MEMORY[0x1F41817F8]();
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  BOOL v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1B3C21000, a2, OS_LOG_TYPE_DEBUG, "Initializing %@...", v5, 0xCu);
}

void __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_24_cold_1()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_1B3C21000, v0, v1, "no completion handler!", v2, v3, v4, v5, v6);
}

@end