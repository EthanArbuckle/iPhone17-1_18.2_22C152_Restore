@interface ACCOOBBTPairingFeaturePlugin
- (ACCOOBBTPairingProvider)oobBtPairingProvider;
- (ACCOOBBTPairingShim)oobBtPairingShim;
- (ACCiAP2ShimServer)iap2server;
- (BOOL)isRunning;
- (NSMutableDictionary)oobBtPairingAccessoryList;
- (NSString)description;
- (NSString)pluginName;
- (OS_dispatch_queue)oobBtPairingQueue;
- (id)oobBtAccessoryForConnectionID:(unsigned int)a3;
- (void)initPlugin;
- (void)linkKey:(id)a3 deviceMacAddr:(id)a4 accessory:(id)a5;
- (void)oobBtPairing:(id)a3 accessoryAttached:(id)a4 accInfoDict:(id)a5;
- (void)oobBtPairing:(id)a3 accessoryDetached:(id)a4;
- (void)oobBtPairing:(id)a3 accessoryInfo:(id)a4 oobBtPairingUID:(id)a5 accessoryMacAddr:(id)a6 deviceClass:(unsigned int)a7;
- (void)oobBtPairing:(id)a3 completion:(id)a4 oobBtPairingUID:(id)a5 accessoryMacAddr:(id)a6 result:(unsigned __int8)a7;
- (void)oobBtPairing:(id)a3 legacyConnectionIDForAccessoryUID:(id)a4 connectionID:(unsigned int)a5;
- (void)setIap2server:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setOobBtPairingAccessoryList:(id)a3;
- (void)setOobBtPairingProvider:(id)a3;
- (void)setOobBtPairingQueue:(id)a3;
- (void)setOobBtPairingShim:(id)a3;
- (void)startOOBBTPairing:(id)a3;
- (void)startPlugin;
- (void)stopOOBBTPairing:(id)a3;
- (void)stopPlugin;
@end

@implementation ACCOOBBTPairingFeaturePlugin

- (NSString)pluginName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(ACCOOBBTPairingFeaturePlugin *)self pluginName];
  uint64_t v5 = obfuscatedPointer((uint64_t)self);
  BOOL v6 = [(ACCOOBBTPairingFeaturePlugin *)self isRunning];
  v7 = "NO";
  if (v6) {
    v7 = "YES";
  }
  v8 = [v3 stringWithFormat:@"<%@: %p> isRunning: %s", v4, v5, v7];

  return (NSString *)v8;
}

- (void)initPlugin
{
  init_logging();
  iap2server = self->_iap2server;
  self->_iap2server = 0;

  oobBtPairingProvider = self->_oobBtPairingProvider;
  self->_oobBtPairingProvider = 0;

  oobBtPairingAccessoryList = self->_oobBtPairingAccessoryList;
  self->_oobBtPairingAccessoryList = 0;

  [(ACCOOBBTPairingFeaturePlugin *)self setIsRunning:0];
  BOOL v6 = (void *)MEMORY[0x263F23098];
  [v6 resetServerState];
}

- (void)startPlugin
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    uint64_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221CBA000, v5, OS_LOG_TYPE_DEFAULT, "Starting OOBBT Pairing feature plugin...", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    BOOL v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    BOOL v6 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_221CBA000, v6, OS_LOG_TYPE_INFO, "Create/Get shared ACCiAP2ShimServer...", v24, 2u);
  }

  v8 = [MEMORY[0x263F23098] sharedInstance];
  iap2server = self->_iap2server;
  self->_iap2server = v8;

  [(ACCiAP2ShimServer *)self->_iap2server startServer];
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v10 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    v10 = MEMORY[0x263EF8438];
    id v11 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_221CBA000, v10, OS_LOG_TYPE_INFO, "Create ACCOOBBTPairingProvider...", v23, 2u);
  }

  v12 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coreaccessories.plugin.oobBtPairing", 0);
  oobBtPairingQueue = self->_oobBtPairingQueue;
  self->_oobBtPairingQueue = v12;

  v14 = (ACCOOBBTPairingProvider *)[objc_alloc(MEMORY[0x263F23088]) initWithDelegate:self];
  oobBtPairingProvider = self->_oobBtPairingProvider;
  self->_oobBtPairingProvider = v14;

  v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  oobBtPairingAccessoryList = self->_oobBtPairingAccessoryList;
  self->_oobBtPairingAccessoryList = v16;

  v18 = [[ACCOOBBTPairingShim alloc] initWithDelegate:self];
  oobBtPairingShim = self->_oobBtPairingShim;
  self->_oobBtPairingShim = v18;

  [(ACCiAP2ShimServer *)self->_iap2server addDelegate:self->_oobBtPairingShim];
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v20 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    v20 = MEMORY[0x263EF8438];
    id v21 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_221CBA000, v20, OS_LOG_TYPE_INFO, "Starting OOBBT Pairing feature plugin... finished, set isRunning", v22, 2u);
  }

  [(ACCOOBBTPairingFeaturePlugin *)self setIsRunning:1];
}

- (void)stopPlugin
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    uint64_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221CBA000, v5, OS_LOG_TYPE_DEFAULT, "Stopping OOBBT Pairing feature plugin...", buf, 2u);
  }

  [(ACCOOBBTPairingFeaturePlugin *)self setIsRunning:0];
  [(ACCiAP2ShimServer *)self->_iap2server removeDelegate:self->_oobBtPairingShim];
  oobBtPairingShim = self->_oobBtPairingShim;
  self->_oobBtPairingShim = 0;

  dispatch_sync((dispatch_queue_t)self->_oobBtPairingQueue, &__block_literal_global);
  oobBtPairingProvider = self->_oobBtPairingProvider;
  self->_oobBtPairingProvider = 0;

  oobBtPairingQueue = self->_oobBtPairingQueue;
  self->_oobBtPairingQueue = 0;

  oobBtPairingAccessoryList = self->_oobBtPairingAccessoryList;
  self->_oobBtPairingAccessoryList = 0;

  [(ACCiAP2ShimServer *)self->_iap2server stopServer];
  iap2server = self->_iap2server;
  self->_iap2server = 0;

  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    id v11 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_221CBA000, v11, OS_LOG_TYPE_INFO, "Stopping OBBT Pairing feature plugin... finished", v13, 2u);
  }
}

- (void)oobBtPairing:(id)a3 accessoryAttached:(id)a4 accInfoDict:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    oobBtPairingShim = self->_oobBtPairingShim;
    iap2server = self->_iap2server;
    oobBtPairingProvider = self->_oobBtPairingProvider;
    *(_DWORD *)buf = 138413314;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    v29 = oobBtPairingProvider;
    __int16 v30 = 2112;
    v31 = oobBtPairingShim;
    __int16 v32 = 2112;
    v33 = iap2server;
    _os_log_impl(&dword_221CBA000, v13, OS_LOG_TYPE_INFO, "oobBtPairing: %@ accessoryAttached: %@, _oobBtPairingProvider=%@ _oobBtPairingShim=%@ _iap2server=%@", buf, 0x34u);
  }

  oobBtPairingQueue = self->_oobBtPairingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__ACCOOBBTPairingFeaturePlugin_oobBtPairing_accessoryAttached_accInfoDict___block_invoke;
  block[3] = &unk_2645E7C90;
  id v21 = v10;
  id v22 = v9;
  v23 = self;
  id v18 = v9;
  id v19 = v10;
  dispatch_async(oobBtPairingQueue, block);
}

void __75__ACCOOBBTPairingFeaturePlugin_oobBtPairing_accessoryAttached_accInfoDict___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x263F23048]];
  v36 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x263F23040]];
  BOOL v3 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x263F23050]];
  v35 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x263F23058]];
  id v4 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x263F23030]];
  uint64_t v5 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x263F23038]];
  BOOL v6 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x263F23078]];
  id v7 = *(void **)(a1 + 32);
  id v8 = [NSString stringWithCString:MEMORY[0x263F230A0] encoding:4];
  v39 = [v7 objectForKey:v8];

  id v9 = *(void **)(a1 + 32);
  id v10 = [NSString stringWithCString:MEMORY[0x263F230A8] encoding:4];
  uint64_t v11 = [v9 objectForKey:v10];

  v38 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x263F23060]];
  v40 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x263F23028]];
  id v12 = (ACCOOBBTPairingAccessory *)[objc_alloc(MEMORY[0x263F23090]) initWithUID:*(void *)(a1 + 40) keyTag:@"OOBBTPairing" features:0];
  v13 = v12;
  if (v3) {
    v14 = v3;
  }
  else {
    v14 = &stru_26D4344B8;
  }
  [(ACCOOBBTPairingAccessory *)v12 setName:v14];
  if (v2) {
    v15 = v2;
  }
  else {
    v15 = &stru_26D4344B8;
  }
  [(ACCOOBBTPairingAccessory *)v13 setModel:v15];
  if (v36) {
    v16 = v36;
  }
  else {
    v16 = &stru_26D4344B8;
  }
  [(ACCOOBBTPairingAccessory *)v13 setManufacturer:v16];
  if (v35) {
    v17 = v35;
  }
  else {
    v17 = &stru_26D4344B8;
  }
  [(ACCOOBBTPairingAccessory *)v13 setSerialNumber:v17];
  if (v4) {
    id v18 = v4;
  }
  else {
    id v18 = &stru_26D4344B8;
  }
  [(ACCOOBBTPairingAccessory *)v13 setFirmwareVersion:v18];
  if (v5) {
    id v19 = v5;
  }
  else {
    id v19 = &stru_26D4344B8;
  }
  [(ACCOOBBTPairingAccessory *)v13 setHardwareVersion:v19];
  if (v6) {
    -[ACCOOBBTPairingAccessory setConnectionID:](v13, "setConnectionID:", [v6 unsignedLongValue]);
  }
  [(ACCOOBBTPairingAccessory *)v13 setDontPublish:1];
  if ([v40 BOOLValue]) {
    uint64_t v20 = 23;
  }
  else {
    uint64_t v20 = 15;
  }
  [(ACCOOBBTPairingAccessory *)v13 addFeature:v20];
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v21 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    id v21 = MEMORY[0x263EF8438];
    id v22 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    __75__ACCOOBBTPairingFeaturePlugin_oobBtPairing_accessoryAttached_accInfoDict___block_invoke_cold_4(v13, v21);
  }

  v23 = objc_alloc_init(ACCOOBBTPairingAccessory);
  [(ACCOOBBTPairingAccessory *)v23 setCertData:v39];
  v37 = (void *)v11;
  [(ACCOOBBTPairingAccessory *)v23 setCertSerial:v11];
  [(ACCOOBBTPairingAccessory *)v23 setIap2ShimAccessory:v13];
  -[ACCOOBBTPairingAccessory setCarPlaySupported:](v23, "setCarPlaySupported:", [v38 charValue] != 0);
  -[ACCOOBBTPairingAccessory setOobPairing2Supported:](v23, "setOobPairing2Supported:", [v40 charValue] != 0);
  [(ACCOOBBTPairingAccessory *)v13 setContext:v23];
  [*(id *)(*(void *)(a1 + 48) + 16) addAccessory:v13];
  if (!*(void *)(*(void *)(a1 + 48) + 40) || (objc_opt_respondsToSelector() & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v25 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingAccessory init]();
      }
      id v25 = MEMORY[0x263EF8438];
      id v26 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      id v27 = *(ACCOOBBTPairingAccessory **)(*(void *)(a1 + 48) + 40);
      *(_DWORD *)buf = 138412290;
      v42 = v27;
      _os_log_impl(&dword_221CBA000, v25, OS_LOG_TYPE_INFO, "Invalid _oobBtPairingShim(%@)", buf, 0xCu);
    }

    if (!v6) {
      goto LABEL_53;
    }
LABEL_46:
    __int16 v28 = *(void **)(*(void *)(a1 + 48) + 48);
    v29 = [(ACCOOBBTPairingAccessory *)v13 connectionIDObj];
    [v28 setObject:v23 forKey:v29];

    goto LABEL_62;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v24 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    v24 = MEMORY[0x263EF8438];
    id v30 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v34 = [*(id *)(*(void *)(a1 + 48) + 24) accessoryInfoDictionaryForLogging:*(void *)(a1 + 32)];
    *(_DWORD *)buf = 138412546;
    v42 = v23;
    __int16 v43 = 2112;
    v44 = v34;
    _os_log_debug_impl(&dword_221CBA000, v24, OS_LOG_TYPE_DEBUG, "accessoryAttached: call shim accessoryAttached: oobBtAccessory=%@ accInfoDict=%@", buf, 0x16u);
  }
  [*(id *)(*(void *)(a1 + 48) + 40) accessoryAttached:v23 accInfoDict:*(void *)(a1 + 32)];
  if (v6) {
    goto LABEL_46;
  }
LABEL_53:
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v31 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    v31 = MEMORY[0x263EF8438];
    id v32 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v33 = [*(id *)(*(void *)(a1 + 48) + 24) accessoryInfoDictionaryForLogging:*(void *)(a1 + 32)];
    *(_DWORD *)buf = 138412546;
    v42 = v13;
    __int16 v43 = 2112;
    v44 = v33;
    _os_log_impl(&dword_221CBA000, v31, OS_LOG_TYPE_INFO, "accessoryAttached: missing connectionID request and wait, accessory=%@ accInfoDict=%@", buf, 0x16u);
  }
  [*(id *)(*(void *)(a1 + 48) + 24) requestLegacyConnectionIDForAccessoryUID:*(void *)(a1 + 40)];
LABEL_62:
}

- (void)oobBtPairing:(id)a3 accessoryDetached:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
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
      -[ACCOOBBTPairingAccessory init]();
    }
    id v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    id v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    oobBtPairingShim = self->_oobBtPairingShim;
    iap2server = self->_iap2server;
    oobBtPairingProvider = self->_oobBtPairingProvider;
    *(_DWORD *)buf = 138413314;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    v23 = oobBtPairingProvider;
    __int16 v24 = 2112;
    id v25 = oobBtPairingShim;
    __int16 v26 = 2112;
    id v27 = iap2server;
    _os_log_impl(&dword_221CBA000, v10, OS_LOG_TYPE_INFO, "oobBtPairing: %@ accessoryDetached: %@, _oobBtPairingProvider=%@ _oobBtPairingShim=%@ _iap2server=%@", buf, 0x34u);
  }

  oobBtPairingQueue = self->_oobBtPairingQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__ACCOOBBTPairingFeaturePlugin_oobBtPairing_accessoryDetached___block_invoke;
  v16[3] = &unk_2645E7CB8;
  v16[4] = self;
  id v17 = v7;
  id v15 = v7;
  dispatch_async(oobBtPairingQueue, v16);
}

void __63__ACCOOBBTPairingFeaturePlugin_oobBtPairing_accessoryDetached___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) findAccessoryForAccessoryUID:*(void *)(a1 + 40) andKeyTag:@"OOBBTPairing"];
  if (v2 && *(void *)(*(void *)(a1 + 32) + 40) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) removeAccessory:v2];
    BOOL v3 = *(void **)(*(void *)(a1 + 32) + 48);
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v2, "connectionID"));
    uint64_t v5 = [v3 objectForKey:v4];

    [*(id *)(*(void *)(a1 + 32) + 40) accessoryDetached:v5];
    id v6 = *(void **)(*(void *)(a1 + 32) + 48);
    id v7 = [v2 connectionIDObj];
    [v6 removeObjectForKey:v7];
  }
  else
  {
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 1;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingAccessory init]();
      }
      uint64_t v5 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 40);
      int v11 = 138412546;
      id v12 = v2;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_impl(&dword_221CBA000, v5, OS_LOG_TYPE_INFO, "Invalid accessory(%@) or _oobBtPairingShim(%@)", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)oobBtPairing:(id)a3 accessoryInfo:(id)a4 oobBtPairingUID:(id)a5 accessoryMacAddr:(id)a6 deviceClass:(unsigned int)a7
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (gLogObjects) {
    BOOL v16 = gNumLogObjects < 1;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    id v18 = MEMORY[0x263EF8438];
    id v17 = MEMORY[0x263EF8438];
  }
  else
  {
    id v18 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    oobBtPairingProvider = self->_oobBtPairingProvider;
    oobBtPairingShim = self->_oobBtPairingShim;
    *(_DWORD *)buf = 138413826;
    id v31 = v12;
    __int16 v32 = 2112;
    id v33 = v13;
    __int16 v34 = 2112;
    id v35 = v14;
    __int16 v36 = 2112;
    id v37 = v15;
    __int16 v38 = 1024;
    unsigned int v39 = a7;
    __int16 v40 = 2112;
    v41 = oobBtPairingProvider;
    __int16 v42 = 2112;
    __int16 v43 = oobBtPairingShim;
    _os_log_impl(&dword_221CBA000, v18, OS_LOG_TYPE_INFO, "oobBtPairing: %@ accessoryInfo: %@ oobBtPairingUID: %@ accessoryMacAddr:%@ deviceClass: %d, _oobBtPairingProvider=%@ _oobBtPairingShim=%@", buf, 0x44u);
  }

  oobBtPairingQueue = self->_oobBtPairingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__ACCOOBBTPairingFeaturePlugin_oobBtPairing_accessoryInfo_oobBtPairingUID_accessoryMacAddr_deviceClass___block_invoke;
  block[3] = &unk_2645E7CE0;
  void block[4] = self;
  id v26 = v13;
  id v27 = v14;
  id v28 = v15;
  unsigned int v29 = a7;
  id v22 = v15;
  id v23 = v14;
  id v24 = v13;
  dispatch_async(oobBtPairingQueue, block);
}

uint64_t __104__ACCOOBBTPairingFeaturePlugin_oobBtPairing_accessoryInfo_oobBtPairingUID_accessoryMacAddr_deviceClass___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) findAccessoryForAccessoryUID:*(void *)(a1 + 40) andKeyTag:@"OOBBTPairing"];
  if (v2)
  {
    if (*(void *)(a1 + 48))
    {
      if (*(void *)(*(void *)(a1 + 32) + 40))
      {
        id v7 = (void *)v2;
        if (objc_opt_respondsToSelector())
        {
          BOOL v3 = *(void **)(*(void *)(a1 + 32) + 48);
          id v4 = [v7 connectionIDObj];
          uint64_t v5 = [v3 objectForKey:v4];

          [*(id *)(*(void *)(a1 + 32) + 40) accessoryInfo:v5 oobBtPairingUID:*(void *)(a1 + 48) accessoryMacAddr:*(void *)(a1 + 56) deviceClass:*(unsigned int *)(a1 + 64)];
        }
      }
    }
  }
  return MEMORY[0x270F9A758]();
}

- (void)oobBtPairing:(id)a3 completion:(id)a4 oobBtPairingUID:(id)a5 accessoryMacAddr:(id)a6 result:(unsigned __int8)a7
{
  int v7 = a7;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (gLogObjects) {
    BOOL v16 = gNumLogObjects < 1;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    id v18 = MEMORY[0x263EF8438];
    id v17 = MEMORY[0x263EF8438];
  }
  else
  {
    id v18 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    oobBtPairingProvider = self->_oobBtPairingProvider;
    oobBtPairingShim = self->_oobBtPairingShim;
    *(_DWORD *)buf = 138413826;
    id v31 = v12;
    __int16 v32 = 2112;
    id v33 = v13;
    __int16 v34 = 2112;
    id v35 = v14;
    __int16 v36 = 2112;
    id v37 = v15;
    __int16 v38 = 1024;
    int v39 = v7;
    __int16 v40 = 2112;
    v41 = oobBtPairingProvider;
    __int16 v42 = 2112;
    __int16 v43 = oobBtPairingShim;
    _os_log_impl(&dword_221CBA000, v18, OS_LOG_TYPE_INFO, "oobBtPairing: %@ completion: %@ oobBtPairingUID: %@ accessoryMacAddr: %@ result: %d, _oobBtPairingProvider=%@ _oobBtPairingShim=%@", buf, 0x44u);
  }

  oobBtPairingQueue = self->_oobBtPairingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__ACCOOBBTPairingFeaturePlugin_oobBtPairing_completion_oobBtPairingUID_accessoryMacAddr_result___block_invoke;
  block[3] = &unk_2645E7D08;
  void block[4] = self;
  id v26 = v13;
  id v27 = v14;
  id v28 = v15;
  char v29 = v7;
  id v22 = v15;
  id v23 = v14;
  id v24 = v13;
  dispatch_async(oobBtPairingQueue, block);
}

uint64_t __96__ACCOOBBTPairingFeaturePlugin_oobBtPairing_completion_oobBtPairingUID_accessoryMacAddr_result___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) findAccessoryForAccessoryUID:*(void *)(a1 + 40) andKeyTag:@"OOBBTPairing"];
  if (v2)
  {
    if (*(void *)(a1 + 48))
    {
      if (*(void *)(*(void *)(a1 + 32) + 40))
      {
        id v12 = (void *)v2;
        if (objc_opt_respondsToSelector())
        {
          BOOL v3 = *(void **)(*(void *)(a1 + 32) + 48);
          id v4 = [v12 connectionIDObj];
          uint64_t v5 = [v3 objectForKey:v4];

          uint64_t v6 = *(void *)(a1 + 32);
          int v7 = *(void **)(v6 + 40);
          uint64_t v9 = *(void *)(a1 + 48);
          uint64_t v8 = *(void *)(a1 + 56);
          if (v8)
          {
            [*(id *)(v6 + 40) accessoryPairingCompletion:v5 oobBtPairingUID:*(void *)(a1 + 48) accessoryMacAddr:v8 sendStop:0 result:*(unsigned __int8 *)(a1 + 64)];
          }
          else
          {
            uint64_t v10 = [v5 currentRemoteMACAddress];
            [v7 accessoryPairingCompletion:v5 oobBtPairingUID:v9 accessoryMacAddr:v10 sendStop:*(void *)(a1 + 56) == 0 result:*(unsigned __int8 *)(a1 + 64)];
          }
        }
      }
    }
  }
  return MEMORY[0x270F9A758]();
}

- (void)oobBtPairing:(id)a3 legacyConnectionIDForAccessoryUID:(id)a4 connectionID:(unsigned int)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 1;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    id v12 = MEMORY[0x263EF8438];
    id v11 = MEMORY[0x263EF8438];
  }
  else
  {
    id v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    oobBtPairingProvider = self->_oobBtPairingProvider;
    oobBtPairingShim = self->_oobBtPairingShim;
    *(_DWORD *)buf = 138413314;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 1024;
    unsigned int v25 = a5;
    __int16 v26 = 2112;
    id v27 = oobBtPairingProvider;
    __int16 v28 = 2112;
    char v29 = oobBtPairingShim;
    _os_log_impl(&dword_221CBA000, v12, OS_LOG_TYPE_INFO, "oobBtPairing: %@ legacyConnectionIDForAccessoryUID: %@ connectionID: %u, _oobBtPairingProvider=%@ _oobBtPairingShim=%@", buf, 0x30u);
  }

  oobBtPairingQueue = self->_oobBtPairingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__ACCOOBBTPairingFeaturePlugin_oobBtPairing_legacyConnectionIDForAccessoryUID_connectionID___block_invoke;
  block[3] = &unk_2645E7D30;
  void block[4] = self;
  id v18 = v9;
  unsigned int v19 = a5;
  id v16 = v9;
  dispatch_async(oobBtPairingQueue, block);
}

void __92__ACCOOBBTPairingFeaturePlugin_oobBtPairing_legacyConnectionIDForAccessoryUID_connectionID___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(*(void *)(a1 + 32) + 16) findAccessoryForAccessoryUID:*(void *)(a1 + 40) andKeyTag:@"OOBBTPairing"];
  if (v7)
  {
    if ([v7 connectionID])
    {
      uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
      BOOL v3 = [v7 connectionIDObj];
      [v2 removeObjectForKey:v3];
    }
    [v7 setConnectionID:*(unsigned int *)(a1 + 48)];
    if ([v7 connectionID])
    {
      id v4 = *(void **)(*(void *)(a1 + 32) + 48);
      uint64_t v5 = [v7 context];
      uint64_t v6 = [v7 connectionIDObj];
      [v4 setObject:v5 forKey:v6];
    }
  }
}

- (id)oobBtAccessoryForConnectionID:(unsigned int)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy_;
  id v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  oobBtPairingQueue = self->_oobBtPairingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__ACCOOBBTPairingFeaturePlugin_oobBtAccessoryForConnectionID___block_invoke;
  block[3] = &unk_2645E7D58;
  void block[4] = self;
  void block[5] = &v8;
  unsigned int v7 = a3;
  dispatch_sync(oobBtPairingQueue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __62__ACCOOBBTPairingFeaturePlugin_oobBtAccessoryForConnectionID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  id v6 = [NSNumber numberWithUnsignedLong:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = [v2 objectForKey:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)startOOBBTPairing:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    unsigned int v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    unsigned int v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    oobBtPairingProvider = self->_oobBtPairingProvider;
    oobBtPairingShim = self->_oobBtPairingShim;
    *(_DWORD *)buf = 138412802;
    id v15 = v4;
    __int16 v16 = 2112;
    id v17 = oobBtPairingProvider;
    __int16 v18 = 2112;
    unsigned int v19 = oobBtPairingShim;
    _os_log_impl(&dword_221CBA000, v7, OS_LOG_TYPE_INFO, "oobBtPairing startOOBBTPairing: %@, _oobBtPairingProvider=%@ _oobBtPairingShim=%@", buf, 0x20u);
  }

  oobBtPairingQueue = self->_oobBtPairingQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__ACCOOBBTPairingFeaturePlugin_startOOBBTPairing___block_invoke;
  v12[3] = &unk_2645E7CB8;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_async(oobBtPairingQueue, v12);
}

void __50__ACCOOBBTPairingFeaturePlugin_startOOBBTPairing___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    id v10 = [*(id *)(a1 + 40) iap2ShimAccessory];
    uint64_t v3 = [v10 accessoryUID];
    [v2 startOOBBTPairing:v3];
  }
  else
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 1;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingAccessory init]();
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
      unsigned int v7 = [*(id *)(a1 + 40) iap2ShimAccessory];
      uint64_t v8 = [v7 accessoryUID];
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412546;
      id v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl(&dword_221CBA000, v6, OS_LOG_TYPE_DEFAULT, "oobBtPairing startOOBBTPairing: %@, skip processing, _oobBtPairingProvider(%@) nil", buf, 0x16u);
    }
  }
}

- (void)linkKey:(id)a3 deviceMacAddr:(id)a4 accessory:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    __int16 v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    __int16 v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = [v8 length];
    oobBtPairingProvider = self->_oobBtPairingProvider;
    oobBtPairingShim = self->_oobBtPairingShim;
    *(_DWORD *)buf = 134219010;
    uint64_t v26 = v14;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v10;
    __int16 v31 = 2112;
    __int16 v32 = oobBtPairingProvider;
    __int16 v33 = 2112;
    __int16 v34 = oobBtPairingShim;
    _os_log_impl(&dword_221CBA000, v13, OS_LOG_TYPE_INFO, "oobBtPairing linkKey: (len=%lu) deviceMacAddr: %@ accessory: %@, _oobBtPairingProvider=%@ _oobBtPairingShim=%@", buf, 0x34u);
  }

  oobBtPairingQueue = self->_oobBtPairingQueue;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __64__ACCOOBBTPairingFeaturePlugin_linkKey_deviceMacAddr_accessory___block_invoke;
  v21[3] = &unk_2645E7D80;
  v21[4] = self;
  id v22 = v10;
  id v23 = v8;
  id v24 = v9;
  id v18 = v9;
  id v19 = v8;
  id v20 = v10;
  dispatch_async(oobBtPairingQueue, v21);
}

void __64__ACCOOBBTPairingFeaturePlugin_linkKey_deviceMacAddr_accessory___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    id v12 = [*(id *)(a1 + 40) iap2ShimAccessory];
    uint64_t v3 = [v12 accessoryUID];
    BOOL v4 = [*(id *)(a1 + 40) currentOOBBTPairingUID];
    [v2 linkKeyInfo:v3 oobBtPairingUID:v4 linkKey:*(void *)(a1 + 48) deviceMacAddr:*(void *)(a1 + 56)];
  }
  else
  {
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects < 1;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingAccessory init]();
      }
      unsigned int v7 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    else
    {
      unsigned int v7 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 48) length];
      uint64_t v9 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 134218754;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      _os_log_impl(&dword_221CBA000, v7, OS_LOG_TYPE_DEFAULT, "oobBtPairing linkKey: (len=%lu) deviceMacAddr: %@ accessory: %@, skip processing, _oobBtPairingProvider(%@) nil", buf, 0x2Au);
    }
  }
}

- (void)stopOOBBTPairing:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    unsigned int v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    unsigned int v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    oobBtPairingProvider = self->_oobBtPairingProvider;
    oobBtPairingShim = self->_oobBtPairingShim;
    *(_DWORD *)buf = 138412802;
    id v15 = v4;
    __int16 v16 = 2112;
    __int16 v17 = oobBtPairingProvider;
    __int16 v18 = 2112;
    __int16 v19 = oobBtPairingShim;
    _os_log_impl(&dword_221CBA000, v7, OS_LOG_TYPE_INFO, "oobBtPairing stopOOBBTPairing: %@, _oobBtPairingProvider=%@ _oobBtPairingShim=%@", buf, 0x20u);
  }

  oobBtPairingQueue = self->_oobBtPairingQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__ACCOOBBTPairingFeaturePlugin_stopOOBBTPairing___block_invoke;
  v12[3] = &unk_2645E7CB8;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_async(oobBtPairingQueue, v12);
}

void __49__ACCOOBBTPairingFeaturePlugin_stopOOBBTPairing___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    id v9 = [*(id *)(a1 + 40) iap2ShimAccessory];
    uint64_t v3 = [v9 accessoryUID];
    [v2 stopOOBBTPairing:v3];
  }
  else
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 1;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingAccessory init]();
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
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_221CBA000, v6, OS_LOG_TYPE_DEFAULT, "oobBtPairing stopOOBBTPairing: %@, skip processing, _oobBtPairingProvider(%@) nil", buf, 0x16u);
    }
  }
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (ACCiAP2ShimServer)iap2server
{
  return self->_iap2server;
}

- (void)setIap2server:(id)a3
{
}

- (ACCOOBBTPairingProvider)oobBtPairingProvider
{
  return self->_oobBtPairingProvider;
}

- (void)setOobBtPairingProvider:(id)a3
{
}

- (OS_dispatch_queue)oobBtPairingQueue
{
  return self->_oobBtPairingQueue;
}

- (void)setOobBtPairingQueue:(id)a3
{
}

- (ACCOOBBTPairingShim)oobBtPairingShim
{
  return self->_oobBtPairingShim;
}

- (void)setOobBtPairingShim:(id)a3
{
}

- (NSMutableDictionary)oobBtPairingAccessoryList
{
  return self->_oobBtPairingAccessoryList;
}

- (void)setOobBtPairingAccessoryList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oobBtPairingAccessoryList, 0);
  objc_storeStrong((id *)&self->_oobBtPairingShim, 0);
  objc_storeStrong((id *)&self->_oobBtPairingQueue, 0);
  objc_storeStrong((id *)&self->_oobBtPairingProvider, 0);
  objc_storeStrong((id *)&self->_iap2server, 0);
}

void __75__ACCOOBBTPairingFeaturePlugin_oobBtPairing_accessoryAttached_accInfoDict___block_invoke_cold_4(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v4 = [a1 connectionIDObj];
  int v5 = 138412546;
  id v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_221CBA000, a2, OS_LOG_TYPE_DEBUG, "accessoryAttached: accessory=%@ connectionIDObj=%@", (uint8_t *)&v5, 0x16u);
}

@end