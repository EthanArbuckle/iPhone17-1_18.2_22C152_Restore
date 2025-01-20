@interface MFAAPairingManager
+ (id)sharedManager;
- (MFAAPairingManager)init;
- (NSXPCConnection)xpcConnection;
- (id)_init;
- (void)addPairingWithToken:(id)a3 completionHandler:(id)a4;
- (void)generatePairingTokenWithCompletionHandler:(id)a3;
- (void)removePairingWithToken:(id)a3 completionHandler:(id)a4;
- (void)setXpcConnection:(id)a3;
- (void)verifyPairingWithToken:(id)a3 completionHandler:(id)a4;
@end

@implementation MFAAPairingManager

- (MFAAPairingManager)init
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
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
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    uint64_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v5 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(MFAATokenManager *)(uint64_t)self _init];
  }

  v11.receiver = self;
  v11.super_class = (Class)MFAAPairingManager;
  v6 = [(MFAAPairingManager *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.MFAAuthentication.MFAANetwork"];
    xpcConnection = v6->_xpcConnection;
    v6->_xpcConnection = (NSXPCConnection *)v7;

    v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CE94008];
    [(NSXPCConnection *)v6->_xpcConnection setRemoteObjectInterface:v9];

    [(NSXPCConnection *)v6->_xpcConnection resume];
  }
  return v6;
}

- (void)generatePairingTokenWithCompletionHandler:(id)a3
{
  v11[3] = *MEMORY[0x263EF8340];
  BOOL v3 = (void (**)(id, void *, void))a3;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_21DC52000, v6, OS_LOG_TYPE_DEFAULT, "Generating pairing token...", (uint8_t *)v11, 2u);
  }

  uint64_t v7 = [MEMORY[0x263F08C38] UUID];
  v11[0] = 0xAAAAAAAAAAAAAAAALL;
  v11[1] = 0xAAAAAAAAAAAAAAAALL;
  [v7 getUUIDBytes:v11];
  v8 = [MEMORY[0x263EFF990] dataWithBytes:v11 length:16];
  if ((unint64_t)[v8 length] <= 0x3F) {
    objc_msgSend(v8, "increaseLengthBy:", 64 - objc_msgSend(v8, "length"));
  }
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v9 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    v9 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    [(MFAAPairingManager *)(uint64_t)v7 generatePairingTokenWithCompletionHandler:v9];
  }

  v3[2](v3, v8, 0);
}

- (void)addPairingWithToken:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
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
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v6 length];
    v12 = "YES";
    *(_DWORD *)buf = 138478339;
    id v21 = v6;
    if (!v7) {
      v12 = "NO";
    }
    __int16 v22 = 2048;
    uint64_t v23 = v11;
    __int16 v24 = 2080;
    v25 = v12;
    _os_log_impl(&dword_21DC52000, v10, OS_LOG_TYPE_DEFAULT, "Adding pairing with token... (pairingToken: %{private}@, pairingToken.length: %lu, completion: %s)", buf, 0x20u);
  }

  if (v7)
  {
    v13 = [(MFAAPairingManager *)self xpcConnection];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __60__MFAAPairingManager_addPairingWithToken_completionHandler___block_invoke;
    v18[3] = &unk_264478B18;
    id v14 = v7;
    id v19 = v14;
    v15 = [v13 remoteObjectProxyWithErrorHandler:v18];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __60__MFAAPairingManager_addPairingWithToken_completionHandler___block_invoke_34;
    v16[3] = &unk_264478B18;
    id v17 = v14;
    [v15 addPairingWithToken:v6 withReply:v16];
  }
}

void __60__MFAAPairingManager_addPairingWithToken_completionHandler___block_invoke(uint64_t a1, void *a2)
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
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke_cold_1();
  }

  uint64_t v7 = *(void *)(a1 + 32);
  BOOL v8 = objc_msgSend(MEMORY[0x263F087E8], "MFAA_errorWithDomain:code:", @"MFAATokenManagerErrorDomain", -4);
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

uint64_t __60__MFAAPairingManager_addPairingWithToken_completionHandler___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removePairingWithToken:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
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
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v6 length];
    v12 = "YES";
    *(_DWORD *)buf = 138478339;
    id v21 = v6;
    if (!v7) {
      v12 = "NO";
    }
    __int16 v22 = 2048;
    uint64_t v23 = v11;
    __int16 v24 = 2080;
    v25 = v12;
    _os_log_impl(&dword_21DC52000, v10, OS_LOG_TYPE_DEFAULT, "Removing pairing with token... (pairingToken: %{private}@, pairingToken.length: %lu, completion: %s)", buf, 0x20u);
  }

  if (v7)
  {
    v13 = [(MFAAPairingManager *)self xpcConnection];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __63__MFAAPairingManager_removePairingWithToken_completionHandler___block_invoke;
    v18[3] = &unk_264478B18;
    id v14 = v7;
    id v19 = v14;
    v15 = [v13 remoteObjectProxyWithErrorHandler:v18];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __63__MFAAPairingManager_removePairingWithToken_completionHandler___block_invoke_35;
    v16[3] = &unk_264478B18;
    id v17 = v14;
    [v15 removePairingWithToken:v6 withReply:v16];
  }
}

void __63__MFAAPairingManager_removePairingWithToken_completionHandler___block_invoke(uint64_t a1, void *a2)
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
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke_cold_1();
  }

  uint64_t v7 = *(void *)(a1 + 32);
  BOOL v8 = objc_msgSend(MEMORY[0x263F087E8], "MFAA_errorWithDomain:code:", @"MFAATokenManagerErrorDomain", -4);
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

uint64_t __63__MFAAPairingManager_removePairingWithToken_completionHandler___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)verifyPairingWithToken:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
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
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v6 length];
    v12 = "YES";
    *(_DWORD *)buf = 138478339;
    id v21 = v6;
    if (!v7) {
      v12 = "NO";
    }
    __int16 v22 = 2048;
    uint64_t v23 = v11;
    __int16 v24 = 2080;
    v25 = v12;
    _os_log_impl(&dword_21DC52000, v10, OS_LOG_TYPE_DEFAULT, "Verifying pairing with token... (pairingToken: %{private}@, pairingToken.length: %lu, completion: %s)", buf, 0x20u);
  }

  if (v7)
  {
    v13 = [(MFAAPairingManager *)self xpcConnection];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __63__MFAAPairingManager_verifyPairingWithToken_completionHandler___block_invoke;
    v18[3] = &unk_264478B18;
    id v14 = v7;
    id v19 = v14;
    v15 = [v13 remoteObjectProxyWithErrorHandler:v18];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __63__MFAAPairingManager_verifyPairingWithToken_completionHandler___block_invoke_36;
    v16[3] = &unk_2644793B8;
    id v17 = v14;
    [v15 verifyPairingWithToken:v6 withReply:v16];
  }
}

void __63__MFAAPairingManager_verifyPairingWithToken_completionHandler___block_invoke(uint64_t a1, void *a2)
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
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke_cold_1();
  }

  uint64_t v7 = *(void *)(a1 + 32);
  BOOL v8 = objc_msgSend(MEMORY[0x263F087E8], "MFAA_errorWithDomain:code:", @"MFAATokenManagerErrorDomain", -4);
  (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
}

uint64_t __63__MFAAPairingManager_verifyPairingWithToken_completionHandler___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__MFAAPairingManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once_0 != -1) {
    dispatch_once(&sharedManager_once_0, block);
  }
  v2 = (void *)sharedManager_sharedInstance_0;
  return v2;
}

uint64_t __35__MFAAPairingManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedInstance_0 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  return MEMORY[0x270F9A758]();
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

- (void)generatePairingTokenWithCompletionHandler:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = 138478339;
  uint64_t v5 = a1;
  __int16 v6 = 2113;
  uint64_t v7 = a2;
  __int16 v8 = 2048;
  uint64_t v9 = [a2 length];
  _os_log_debug_impl(&dword_21DC52000, a3, OS_LOG_TYPE_DEBUG, "pairingToken: %{private}@, pairingTokenData: %{private}@, pairingTokenData.length: %lu", (uint8_t *)&v4, 0x20u);
}

@end