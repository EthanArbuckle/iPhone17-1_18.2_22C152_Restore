@interface ACCFeatureAudioProduct
+ (id)sharedManager;
- (NSMutableSet)endpoints;
- (NSXPCConnection)xpcConnection;
- (id)_init;
- (void)_connectToACCFeatureAudioProduct;
- (void)_disconnectFromACCFeatureAudioProduct;
- (void)accessoryAttached:(id)a3 connection:(id)a4;
- (void)accessoryDetached:(id)a3 connection:(id)a4;
- (void)processAudioProductCerts:(id)a3 forModel:(id)a4 firstConnectionAfterPair:(BOOL)a5 connection:(id)a6 endpoint:(id)a7;
- (void)setEndpoints:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation ACCFeatureAudioProduct

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__ACCFeatureAudioProduct_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, block);
  }
  v2 = (void *)sharedManager_sharedInstance;
  return v2;
}

uint64_t __39__ACCFeatureAudioProduct_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedInstance = [objc_alloc(*(Class *)(a1 + 32)) _init];
  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  init_logging();
  v10.receiver = self;
  v10.super_class = (Class)ACCFeatureAudioProduct;
  v3 = [(ACCFeatureAudioProduct *)&v10 init];
  if (v3)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    endpoints = v3->_endpoints;
    v3->_endpoints = v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.coreaccessories.ACCFeatureAudioProductService"];
    xpcConnection = v3->_xpcConnection;
    v3->_xpcConnection = (NSXPCConnection *)v6;

    v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DA6B950];
    [(NSXPCConnection *)v3->_xpcConnection setRemoteObjectInterface:v8];

    [(NSXPCConnection *)v3->_xpcConnection resume];
  }
  return v3;
}

- (void)_connectToACCFeatureAudioProduct
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_226836000, log, OS_LOG_TYPE_DEBUG, "Already have connection to ACCFeatureAudioProduct!", v1, 2u);
}

- (void)_disconnectFromACCFeatureAudioProduct
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_226836000, log, OS_LOG_TYPE_DEBUG, "No connection to ACCFeatureAudioProduct, skip!", v1, 2u);
}

- (void)accessoryAttached:(id)a3 connection:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCFeatureAudioProduct _connectToACCFeatureAudioProduct]();
    }
    objc_super v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    objc_super v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_226836000, v10, OS_LOG_TYPE_INFO, "accessoryAttached: %@ connection: %@", (uint8_t *)&v11, 0x16u);
  }

  [(NSMutableSet *)self->_endpoints addObject:v6];
  if ([(NSMutableSet *)self->_endpoints count]) {
    [(ACCFeatureAudioProduct *)self _connectToACCFeatureAudioProduct];
  }
}

- (void)accessoryDetached:(id)a3 connection:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCFeatureAudioProduct _connectToACCFeatureAudioProduct]();
    }
    objc_super v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    objc_super v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_226836000, v10, OS_LOG_TYPE_INFO, "accessoryDetached: %@ connection: %@", (uint8_t *)&v11, 0x16u);
  }

  [(NSMutableSet *)self->_endpoints removeObject:v6];
  if (![(NSMutableSet *)self->_endpoints count]) {
    [(ACCFeatureAudioProduct *)self _disconnectFromACCFeatureAudioProduct];
  }
}

- (void)processAudioProductCerts:(id)a3 forModel:(id)a4 firstConnectionAfterPair:(BOOL)a5 connection:(id)a6 endpoint:(id)a7
{
  BOOL v9 = a5;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (gLogObjects) {
    BOOL v16 = gNumLogObjects < 1;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCFeatureAudioProduct _connectToACCFeatureAudioProduct]();
    }
    v18 = MEMORY[0x263EF8438];
    id v17 = MEMORY[0x263EF8438];
  }
  else
  {
    v18 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(%lu certs"), objc_msgSend(v12, "count");
    v19 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v28 = v19;
    __int16 v29 = 2112;
    id v30 = v13;
    __int16 v31 = 2112;
    id v32 = v14;
    __int16 v33 = 2112;
    id v34 = v15;
    _os_log_impl(&dword_226836000, v18, OS_LOG_TYPE_DEFAULT, "processAudioProductCerts: %@ forModel: %@ connection: %@ endpoint: %@", buf, 0x2Au);
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v20 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCFeatureAudioProduct _connectToACCFeatureAudioProduct]();
    }
    v20 = MEMORY[0x263EF8438];
    id v21 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    xpcConnection = self->_xpcConnection;
    *(_DWORD *)buf = 138412290;
    v28 = xpcConnection;
    _os_log_impl(&dword_226836000, v20, OS_LOG_TYPE_INFO, "processAudioProductCerts:forModel:endpoint: _xpcConnection %@", buf, 0xCu);
  }

  v23 = self->_xpcConnection;
  if (v23)
  {
    v24 = [(NSXPCConnection *)v23 remoteObjectProxyWithErrorHandler:&__block_literal_global];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __105__ACCFeatureAudioProduct_processAudioProductCerts_forModel_firstConnectionAfterPair_connection_endpoint___block_invoke_12;
    v25[3] = &unk_2647B7A60;
    id v26 = v15;
    [v24 processAudioProductCerts:v12 forModel:v13 firstConnectionAfterPair:v9 connection:v14 endpoint:v26 completionHandler:v25];
  }
}

void __105__ACCFeatureAudioProduct_processAudioProductCerts_forModel_firstConnectionAfterPair_connection_endpoint___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCFeatureAudioProduct _connectToACCFeatureAudioProduct]();
    }
    v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    __105__ACCFeatureAudioProduct_processAudioProductCerts_forModel_firstConnectionAfterPair_connection_endpoint___block_invoke_cold_1((uint64_t)v2, v5);
  }
}

void __105__ACCFeatureAudioProduct_processAudioProductCerts_forModel_firstConnectionAfterPair_connection_endpoint___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCFeatureAudioProduct _connectToACCFeatureAudioProduct]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_226836000, v6, OS_LOG_TYPE_DEFAULT, "processAudioProductCerts: %@, error %@", (uint8_t *)&v8, 0x16u);
  }
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSMutableSet)endpoints
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEndpoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __105__ACCFeatureAudioProduct_processAudioProductCerts_forModel_firstConnectionAfterPair_connection_endpoint___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_226836000, a2, OS_LOG_TYPE_FAULT, "can't invoke remote object %@", (uint8_t *)&v2, 0xCu);
}

@end