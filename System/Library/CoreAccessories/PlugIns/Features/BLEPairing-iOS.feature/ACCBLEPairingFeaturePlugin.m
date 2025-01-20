@interface ACCBLEPairingFeaturePlugin
- (ACCBLEPairingProvider)blePairingProvider;
- (ACCBLEPairingShim)blePairingShim;
- (ACCiAP2ShimServer)iap2server;
- (BOOL)_isSupportedType:(unsigned __int8)a3 supportedListData:(id)a4;
- (BOOL)isRunning;
- (NSMutableDictionary)blePairingAccessoryList;
- (NSString)description;
- (NSString)pluginName;
- (OS_dispatch_queue)blePairingQueue;
- (id)bleAccessoryForConnectionID:(unsigned int)a3;
- (void)blePairing:(id)a3 accessoryAttached:(id)a4 blePairingUUID:(id)a5 accInfoDict:(id)a6 supportedPairTypes:(id)a7;
- (void)blePairing:(id)a3 accessoryDetached:(id)a4 blePairingUUID:(id)a5;
- (void)blePairingDataUpdate:(id)a3 pairType:(int)a4 pairData:(id)a5 accessory:(id)a6 blePairingUUID:(id)a7;
- (void)blePairingInfoUpdate:(id)a3 pairType:(int)a4 pairInfoList:(id)a5 accessory:(id)a6 blePairingUUID:(id)a7;
- (void)blePairingStateUpdate:(id)a3 validMask:(unsigned int)a4 btRadioOn:(BOOL)a5 pairingState:(int)a6 pairingModeOn:(BOOL)a7 accessory:(id)a8 blePairingUUID:(id)a9;
- (void)deviceSend:(id)a3 pairType:(int)a4 pairingData:(id)a5;
- (void)deviceStartBLEUpdates:(id)a3 pairType:(int)a4 btRadio:(BOOL)a5 pairInfo:(BOOL)a6;
- (void)deviceStateUpdate:(id)a3 btRadio:(unsigned __int8)a4 pairStatus:(int)a5 pairModeOn:(BOOL)a6 forceUpdates:(BOOL)a7;
- (void)deviceStopBLEUpdates:(id)a3;
- (void)deviceUpdate:(id)a3 pairType:(int)a4 pairInfo:(id)a5;
- (void)initPlugin;
- (void)setBlePairingAccessoryList:(id)a3;
- (void)setBlePairingProvider:(id)a3;
- (void)setBlePairingQueue:(id)a3;
- (void)setBlePairingShim:(id)a3;
- (void)setIap2server:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)startPlugin;
- (void)stopPlugin;
@end

@implementation ACCBLEPairingFeaturePlugin

- (NSString)pluginName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(ACCBLEPairingFeaturePlugin *)self pluginName];
  uint64_t v5 = obfuscatedPointer((uint64_t)self);
  BOOL v6 = [(ACCBLEPairingFeaturePlugin *)self isRunning];
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

  blePairingProvider = self->_blePairingProvider;
  self->_blePairingProvider = 0;

  blePairingAccessoryList = self->_blePairingAccessoryList;
  self->_blePairingAccessoryList = 0;

  [(ACCBLEPairingFeaturePlugin *)self setIsRunning:0];
  BOOL v6 = (void *)MEMORY[0x263F23098];
  [v6 resetServerState];
}

- (void)startPlugin
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_225708000, MEMORY[0x263EF8438], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
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
      -[ACCBLEPairingFeaturePlugin startPlugin]();
    }
    uint8_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint8_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225708000, v5, OS_LOG_TYPE_DEFAULT, "Stopping BLE Pairing feature plugin...", buf, 2u);
  }

  [(ACCBLEPairingFeaturePlugin *)self setIsRunning:0];
  [(ACCiAP2ShimServer *)self->_iap2server removeDelegate:self->_blePairingShim];
  blePairingShim = self->_blePairingShim;
  self->_blePairingShim = 0;

  dispatch_sync((dispatch_queue_t)self->_blePairingQueue, &__block_literal_global);
  blePairingProvider = self->_blePairingProvider;
  self->_blePairingProvider = 0;

  blePairingQueue = self->_blePairingQueue;
  self->_blePairingQueue = 0;

  blePairingAccessoryList = self->_blePairingAccessoryList;
  self->_blePairingAccessoryList = 0;

  [(ACCiAP2ShimServer *)self->_iap2server stopServer];
  iap2server = self->_iap2server;
  self->_iap2server = 0;

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingFeaturePlugin startPlugin]();
    }
    v11 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_225708000, v11, OS_LOG_TYPE_DEFAULT, "Stopping BLE Pairing feature plugin... finished", v13, 2u);
  }
}

- (void)blePairing:(id)a3 accessoryAttached:(id)a4 blePairingUUID:(id)a5 accInfoDict:(id)a6 supportedPairTypes:(id)a7
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (gLogObjects) {
    BOOL v17 = gNumLogObjects < 1;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingFeaturePlugin startPlugin]();
    }
    v19 = MEMORY[0x263EF8438];
    id v18 = MEMORY[0x263EF8438];
  }
  else
  {
    v19 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    blePairingShim = self->_blePairingShim;
    iap2server = self->_iap2server;
    blePairingProvider = self->_blePairingProvider;
    *(_DWORD *)buf = 138413570;
    id v34 = v12;
    __int16 v35 = 2112;
    id v36 = v13;
    __int16 v37 = 2112;
    id v38 = v14;
    __int16 v39 = 2112;
    v40 = blePairingProvider;
    __int16 v41 = 2112;
    v42 = blePairingShim;
    __int16 v43 = 2112;
    v44 = iap2server;
    _os_log_impl(&dword_225708000, v19, OS_LOG_TYPE_INFO, "blePairing: %@ accessoryAttached: %@, blePairingUUID=%@, _blePairingProvider=%@ _blePairingShim=%@ _iap2server=%@", buf, 0x3Eu);
  }

  if (v15)
  {
    v23 = [v15 objectForKey:*MEMORY[0x263F22C20]];
  }
  else
  {
    v23 = 0;
  }
  if ([v23 isEqualToString:@"A1603"]
    && ![(ACCBLEPairingFeaturePlugin *)self _isSupportedType:1 supportedListData:v16])
  {
    blePairingQueue = self->_blePairingQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __105__ACCBLEPairingFeaturePlugin_blePairing_accessoryAttached_blePairingUUID_accInfoDict_supportedPairTypes___block_invoke;
    block[3] = &unk_26474EFD0;
    v28 = v13;
    id v29 = v15;
    id v30 = v14;
    id v31 = v16;
    v32 = self;
    dispatch_async(blePairingQueue, block);

    v24 = v28;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v24 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingFeaturePlugin startPlugin]();
      }
      v24 = MEMORY[0x263EF8438];
      id v25 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v34 = v12;
      __int16 v35 = 2112;
      id v36 = v13;
      __int16 v37 = 2112;
      id v38 = v14;
      _os_log_impl(&dword_225708000, v24, OS_LOG_TYPE_INFO, "blePairing: %@ accessoryAttached: %@, blePairingUUID=%@, detected non-supported, don't use shim plugin", buf, 0x20u);
    }
  }
}

void __105__ACCBLEPairingFeaturePlugin_blePairing_accessoryAttached_blePairingUUID_accInfoDict_supportedPairTypes___block_invoke(void *a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F23090]) initWithUID:a1[4] keyTag:@"BLEPairing" features:0];
  BOOL v3 = (void *)a1[5];
  if (v3)
  {
    uint64_t v4 = [v3 objectForKey:*MEMORY[0x263F22C20]];
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint8_t v5 = (void *)a1[5];
  if (v5)
  {
    uint64_t v6 = [v5 objectForKey:*MEMORY[0x263F22C18]];
  }
  else
  {
    uint64_t v6 = 0;
  }
  v7 = (void *)a1[5];
  if (v7)
  {
    uint64_t v8 = [v7 objectForKey:*MEMORY[0x263F22C28]];
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9 = (void *)a1[5];
  if (v9)
  {
    uint64_t v10 = [v9 objectForKey:*MEMORY[0x263F22C30]];
  }
  else
  {
    uint64_t v10 = 0;
  }
  v11 = (void *)a1[5];
  if (v11)
  {
    id v12 = [v11 objectForKey:*MEMORY[0x263F22C08]];
  }
  else
  {
    id v12 = 0;
  }
  id v13 = (void *)a1[5];
  if (v13)
  {
    id v14 = [v13 objectForKey:*MEMORY[0x263F22C10]];
  }
  else
  {
    id v14 = 0;
  }
  __int16 v41 = (void *)v8;
  if (v8) {
    id v15 = (__CFString *)v8;
  }
  else {
    id v15 = &stru_26D8E1940;
  }
  [v2 setName:v15];
  __int16 v39 = (void *)v4;
  if (v4) {
    id v16 = (__CFString *)v4;
  }
  else {
    id v16 = &stru_26D8E1940;
  }
  [v2 setModel:v16];
  if (v6) {
    BOOL v17 = (__CFString *)v6;
  }
  else {
    BOOL v17 = &stru_26D8E1940;
  }
  objc_msgSend(v2, "setManufacturer:", v17, v6);
  v40 = (void *)v10;
  if (v10) {
    id v18 = (__CFString *)v10;
  }
  else {
    id v18 = &stru_26D8E1940;
  }
  [v2 setSerialNumber:v18];
  if (v12) {
    v19 = v12;
  }
  else {
    v19 = &stru_26D8E1940;
  }
  [v2 setFirmwareVersion:v19];
  if (v14) {
    v20 = v14;
  }
  else {
    v20 = &stru_26D8E1940;
  }
  [v2 setHardwareVersion:v20];
  [v2 addFeature:4];
  v21 = objc_alloc_init(ACCBLEPairingAccessory);
  [(ACCBLEPairingAccessory *)v21 setIap2ShimAccessory:v2];
  [(ACCBLEPairingAccessory *)v21 setBlePairingUUID:a1[6]];
  [(ACCBLEPairingAccessory *)v21 setSupportedPairTypes:a1[7]];
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v22 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingFeaturePlugin startPlugin]();
    }
    v22 = MEMORY[0x263EF8438];
    id v23 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    __105__ACCBLEPairingFeaturePlugin_blePairing_accessoryAttached_blePairingUUID_accInfoDict_supportedPairTypes___block_invoke_cold_3(v2, v22);
  }

  v24 = *(void **)(a1[8] + 48);
  id v25 = [v2 connectionIDObj];
  [v24 setObject:v21 forKey:v25];

  [*(id *)(a1[8] + 16) addAccessory:v2];
  if (a1[6] && *(void *)(a1[8] + 40) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v26 = [v2 accessoryInfoDict];
    v27 = [v26 mutableCopy];

    v28 = [NSNumber numberWithBool:1];
    [v27 setObject:v28 forKey:*MEMORY[0x263F22C68]];

    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v29 = *(id *)gLogObjects;
      id v31 = v38;
      id v30 = v39;
    }
    else
    {
      id v31 = v38;
      id v30 = v39;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingFeaturePlugin startPlugin]();
      }
      id v29 = MEMORY[0x263EF8438];
      id v35 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v36 = a1[6];
      uint64_t v37 = a1[7];
      *(_DWORD *)buf = 138413058;
      __int16 v43 = v21;
      __int16 v44 = 2112;
      uint64_t v45 = v36;
      __int16 v46 = 2112;
      v47 = v27;
      __int16 v48 = 2112;
      uint64_t v49 = v37;
      _os_log_debug_impl(&dword_225708000, v29, OS_LOG_TYPE_DEBUG, "accessoryAttached: call shim accessoryAttached: bleAccessory=%@ blePairingUUID=%@ pAccDict=%@ supportedPairTypes=%@", buf, 0x2Au);
    }

    [*(id *)(a1[8] + 40) accessoryAttached:v21 blePairingUUID:a1[6] accInfoDict:v27 supportedPairTypes:a1[7]];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v27 = *(id *)gLogObjects;
      id v31 = v38;
      id v30 = v39;
    }
    else
    {
      id v31 = v38;
      id v30 = v39;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingFeaturePlugin startPlugin]();
      }
      v27 = MEMORY[0x263EF8438];
      id v32 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v33 = (ACCBLEPairingAccessory *)a1[6];
      uint64_t v34 = *(void *)(a1[8] + 40);
      *(_DWORD *)buf = 138412546;
      __int16 v43 = v33;
      __int16 v44 = 2112;
      uint64_t v45 = v34;
      _os_log_impl(&dword_225708000, v27, OS_LOG_TYPE_INFO, "Invalid blePairingUUID(%@) or _blePairingShim(%@)", buf, 0x16u);
    }
  }
}

- (void)blePairing:(id)a3 accessoryDetached:(id)a4 blePairingUUID:(id)a5
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
      -[ACCBLEPairingFeaturePlugin startPlugin]();
    }
    id v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    id v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    blePairingShim = self->_blePairingShim;
    iap2server = self->_iap2server;
    blePairingProvider = self->_blePairingProvider;
    *(_DWORD *)buf = 138413570;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = blePairingProvider;
    __int16 v31 = 2112;
    id v32 = blePairingShim;
    __int16 v33 = 2112;
    uint64_t v34 = iap2server;
    _os_log_impl(&dword_225708000, v13, OS_LOG_TYPE_INFO, "blePairing: %@ accessoryDetached: %@, blePairingUUID=%@, _blePairingProvider=%@ _blePairingShim=%@ _iap2server=%@", buf, 0x3Eu);
  }

  blePairingQueue = self->_blePairingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__ACCBLEPairingFeaturePlugin_blePairing_accessoryDetached_blePairingUUID___block_invoke;
  block[3] = &unk_26474EFF8;
  void block[4] = self;
  id v21 = v9;
  id v22 = v10;
  id v18 = v10;
  id v19 = v9;
  dispatch_async(blePairingQueue, block);
}

void __74__ACCBLEPairingFeaturePlugin_blePairing_accessoryDetached_blePairingUUID___block_invoke(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1[4] + 16) findAccessoryForAccessoryUID:a1[5] andKeyTag:@"BLEPairing"];
  if (v2 && a1[6] && *(void *)(a1[4] + 40) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [*(id *)(a1[4] + 16) removeAccessory:v2];
    BOOL v3 = *(void **)(a1[4] + 48);
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v2, "connectionID"));
    uint8_t v5 = [v3 objectForKey:v4];

    [*(id *)(a1[4] + 40) accessoryDetached:v5 blePairingUUID:a1[6]];
    uint64_t v6 = *(void **)(a1[4] + 48);
    v7 = [v2 connectionIDObj];
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
        -[ACCBLEPairingFeaturePlugin startPlugin]();
      }
      uint8_t v5 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    else
    {
      uint8_t v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = a1[6];
      uint64_t v11 = *(void *)(a1[4] + 40);
      int v12 = 138412802;
      id v13 = v2;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_225708000, v5, OS_LOG_TYPE_INFO, "Invalid accessory(%@) or blePairingUUID(%@) or _blePairingShim(%@)", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)blePairingStateUpdate:(id)a3 validMask:(unsigned int)a4 btRadioOn:(BOOL)a5 pairingState:(int)a6 pairingModeOn:(BOOL)a7 accessory:(id)a8 blePairingUUID:(id)a9
{
  BOOL v10 = a7;
  BOOL v12 = a5;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a8;
  id v17 = a9;
  if (gLogObjects) {
    BOOL v18 = gNumLogObjects < 1;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingFeaturePlugin startPlugin]();
    }
    v20 = MEMORY[0x263EF8438];
    id v19 = MEMORY[0x263EF8438];
  }
  else
  {
    v20 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    blePairingProvider = self->_blePairingProvider;
    blePairingShim = self->_blePairingShim;
    *(_DWORD *)buf = 138414338;
    id v34 = v15;
    __int16 v35 = 1024;
    unsigned int v36 = a4;
    __int16 v37 = 1024;
    BOOL v38 = v12;
    __int16 v39 = 1024;
    int v40 = a6;
    __int16 v41 = 1024;
    BOOL v42 = v10;
    __int16 v43 = 2112;
    id v44 = v16;
    __int16 v45 = 2112;
    id v46 = v17;
    __int16 v47 = 2112;
    __int16 v48 = blePairingProvider;
    __int16 v49 = 2112;
    uint64_t v50 = blePairingShim;
    _os_log_impl(&dword_225708000, v20, OS_LOG_TYPE_INFO, "blePairingStateUpdate: %@ validMask: %d btRadioOn: %d pairingState: %d pairingModeOn: %d accessory: %@ blePairingUUID: %@, _blePairingProvider=%@ _blePairingShim=%@", buf, 0x4Cu);
  }

  blePairingQueue = self->_blePairingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __124__ACCBLEPairingFeaturePlugin_blePairingStateUpdate_validMask_btRadioOn_pairingState_pairingModeOn_accessory_blePairingUUID___block_invoke;
  block[3] = &unk_26474F020;
  void block[4] = self;
  id v27 = v16;
  id v28 = v17;
  BOOL v31 = v12;
  unsigned int v29 = a4;
  int v30 = a6;
  BOOL v32 = v10;
  id v24 = v17;
  id v25 = v16;
  dispatch_async(blePairingQueue, block);
}

void __124__ACCBLEPairingFeaturePlugin_blePairingStateUpdate_validMask_btRadioOn_pairingState_pairingModeOn_accessory_blePairingUUID___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) findAccessoryForAccessoryUID:*(void *)(a1 + 40) andKeyTag:@"BLEPairing"];
  if (v2
    && *(void *)(a1 + 48)
    && *(void *)(*(void *)(a1 + 32) + 40)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    BOOL v3 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v4 = [v2 connectionIDObj];
    uint8_t v5 = [v3 objectForKey:v4];

    [*(id *)(*(void *)(a1 + 32) + 40) stateUpdate:v5 blePairingUUID:*(void *)(a1 + 48) validMask:*(unsigned int *)(a1 + 56) btRadioOn:*(unsigned __int8 *)(a1 + 64) pairingState:*(unsigned int *)(a1 + 60) pairingModeOn:*(unsigned __int8 *)(a1 + 65)];
  }
  else
  {
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 1;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingFeaturePlugin startPlugin]();
      }
      uint8_t v5 = MEMORY[0x263EF8438];
      id v7 = MEMORY[0x263EF8438];
    }
    else
    {
      uint8_t v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 40);
      int v10 = 138412802;
      uint64_t v11 = v2;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_225708000, v5, OS_LOG_TYPE_INFO, "Invalid accessory(%@) or blePairingUUID(%@) or _blePairingShim(%@)", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (void)blePairingInfoUpdate:(id)a3 pairType:(int)a4 pairInfoList:(id)a5 accessory:(id)a6 blePairingUUID:(id)a7
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
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
      -[ACCBLEPairingFeaturePlugin startPlugin]();
    }
    BOOL v18 = MEMORY[0x263EF8438];
    id v17 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v18 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    blePairingProvider = self->_blePairingProvider;
    blePairingShim = self->_blePairingShim;
    *(_DWORD *)buf = 138413826;
    id v31 = v12;
    __int16 v32 = 1024;
    int v33 = a4;
    __int16 v34 = 2112;
    id v35 = v13;
    __int16 v36 = 2112;
    id v37 = v14;
    __int16 v38 = 2112;
    id v39 = v15;
    __int16 v40 = 2112;
    __int16 v41 = blePairingProvider;
    __int16 v42 = 2112;
    __int16 v43 = blePairingShim;
    _os_log_impl(&dword_225708000, v18, OS_LOG_TYPE_INFO, "blePairingInfoUpdate: %@ pairType: %d pairInfoList: %@ accessory: %@ blePairingUUID: %@, _blePairingProvider=%@ _blePairingShim=%@", buf, 0x44u);
  }

  blePairingQueue = self->_blePairingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98__ACCBLEPairingFeaturePlugin_blePairingInfoUpdate_pairType_pairInfoList_accessory_blePairingUUID___block_invoke;
  block[3] = &unk_26474F048;
  void block[4] = self;
  id v26 = v14;
  int v29 = a4;
  id v27 = v15;
  id v28 = v13;
  id v22 = v13;
  id v23 = v15;
  id v24 = v14;
  dispatch_async(blePairingQueue, block);
}

void __98__ACCBLEPairingFeaturePlugin_blePairingInfoUpdate_pairType_pairInfoList_accessory_blePairingUUID___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) findAccessoryForAccessoryUID:*(void *)(a1 + 40) andKeyTag:@"BLEPairing"];
  if (v2
    && *(void *)(a1 + 48)
    && *(void *)(*(void *)(a1 + 32) + 40)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    BOOL v3 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v4 = [v2 connectionIDObj];
    uint8_t v5 = [v3 objectForKey:v4];

    [*(id *)(*(void *)(a1 + 32) + 40) stateUpdate:v5 blePairingUUID:*(void *)(a1 + 48) pairType:*(unsigned int *)(a1 + 64) pairInfoList:*(void *)(a1 + 56)];
  }
  else
  {
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 1;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingFeaturePlugin startPlugin]();
      }
      uint8_t v5 = MEMORY[0x263EF8438];
      id v7 = MEMORY[0x263EF8438];
    }
    else
    {
      uint8_t v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 40);
      int v10 = 138412802;
      uint64_t v11 = v2;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_225708000, v5, OS_LOG_TYPE_INFO, "Invalid accessory(%@) or blePairingUUID(%@) or _blePairingShim(%@)", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (void)blePairingDataUpdate:(id)a3 pairType:(int)a4 pairData:(id)a5 accessory:(id)a6 blePairingUUID:(id)a7
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
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
      -[ACCBLEPairingFeaturePlugin startPlugin]();
    }
    BOOL v18 = MEMORY[0x263EF8438];
    id v17 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v18 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    blePairingProvider = self->_blePairingProvider;
    blePairingShim = self->_blePairingShim;
    *(_DWORD *)buf = 138413826;
    id v31 = v12;
    __int16 v32 = 1024;
    int v33 = a4;
    __int16 v34 = 2112;
    id v35 = v13;
    __int16 v36 = 2112;
    id v37 = v14;
    __int16 v38 = 2112;
    id v39 = v15;
    __int16 v40 = 2112;
    __int16 v41 = blePairingProvider;
    __int16 v42 = 2112;
    __int16 v43 = blePairingShim;
    _os_log_impl(&dword_225708000, v18, OS_LOG_TYPE_INFO, "blePairingDataUpdate: %@ pairType: %d pairData: %@ accessory: %@ blePairingUUID: %@, _blePairingProvider=%@ _blePairingShim=%@", buf, 0x44u);
  }

  blePairingQueue = self->_blePairingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__ACCBLEPairingFeaturePlugin_blePairingDataUpdate_pairType_pairData_accessory_blePairingUUID___block_invoke;
  block[3] = &unk_26474F048;
  void block[4] = self;
  id v26 = v14;
  int v29 = a4;
  id v27 = v15;
  id v28 = v13;
  id v22 = v13;
  id v23 = v15;
  id v24 = v14;
  dispatch_async(blePairingQueue, block);
}

void __94__ACCBLEPairingFeaturePlugin_blePairingDataUpdate_pairType_pairData_accessory_blePairingUUID___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) findAccessoryForAccessoryUID:*(void *)(a1 + 40) andKeyTag:@"BLEPairing"];
  if (v2
    && *(void *)(a1 + 48)
    && *(void *)(*(void *)(a1 + 32) + 40)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    BOOL v3 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v4 = [v2 connectionIDObj];
    uint8_t v5 = [v3 objectForKey:v4];

    [*(id *)(*(void *)(a1 + 32) + 40) dataUpdate:v5 blePairingUUID:*(void *)(a1 + 48) pairType:*(unsigned int *)(a1 + 64) pairData:*(void *)(a1 + 56)];
  }
  else
  {
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 1;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingFeaturePlugin startPlugin]();
      }
      uint8_t v5 = MEMORY[0x263EF8438];
      id v7 = MEMORY[0x263EF8438];
    }
    else
    {
      uint8_t v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 40);
      int v10 = 138412802;
      uint64_t v11 = v2;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_225708000, v5, OS_LOG_TYPE_INFO, "Invalid accessory(%@) or blePairingUUID(%@) or _blePairingShim(%@)", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (id)bleAccessoryForConnectionID:(unsigned int)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy_;
  __int16 v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  blePairingQueue = self->_blePairingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__ACCBLEPairingFeaturePlugin_bleAccessoryForConnectionID___block_invoke;
  block[3] = &unk_26474F070;
  void block[4] = self;
  void block[5] = &v8;
  unsigned int v7 = a3;
  dispatch_sync(blePairingQueue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __58__ACCBLEPairingFeaturePlugin_bleAccessoryForConnectionID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  id v6 = [NSNumber numberWithUnsignedLong:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = [v2 objectForKey:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint8_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)deviceStartBLEUpdates:(id)a3 pairType:(int)a4 btRadio:(BOOL)a5 pairInfo:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingFeaturePlugin startPlugin]();
    }
    id v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    id v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    blePairingProvider = self->_blePairingProvider;
    blePairingShim = self->_blePairingShim;
    *(_DWORD *)buf = 138413570;
    id v24 = v10;
    __int16 v25 = 1024;
    int v26 = a4;
    __int16 v27 = 1024;
    BOOL v28 = v7;
    __int16 v29 = 1024;
    BOOL v30 = v6;
    __int16 v31 = 2112;
    __int16 v32 = blePairingProvider;
    __int16 v33 = 2112;
    __int16 v34 = blePairingShim;
    _os_log_impl(&dword_225708000, v13, OS_LOG_TYPE_INFO, "blePairing deviceStartBLEUpdates: %@ pairType:%d btRadio:%d pairInfoUpdateOn:%d, _blePairingProvider=%@ _blePairingShim=%@", buf, 0x32u);
  }

  blePairingQueue = self->_blePairingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__ACCBLEPairingFeaturePlugin_deviceStartBLEUpdates_pairType_btRadio_pairInfo___block_invoke;
  block[3] = &unk_26474F098;
  void block[4] = self;
  id v19 = v10;
  int v20 = a4;
  BOOL v21 = v7;
  BOOL v22 = v6;
  id v17 = v10;
  dispatch_async(blePairingQueue, block);
}

void __78__ACCBLEPairingFeaturePlugin_deviceStartBLEUpdates_pairType_btRadio_pairInfo___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    id v11 = [*(id *)(a1 + 40) iap2ShimAccessory];
    uint64_t v3 = [v11 accessoryUID];
    uint64_t v4 = [*(id *)(a1 + 40) blePairingUUID];
    [v2 startBLEUpdates:v3 blePairingUUID:v4 pairType:*(unsigned int *)(a1 + 48) bRadioUpdatesOn:*(unsigned __int8 *)(a1 + 52) bPairInfoUpdatesOn:*(unsigned __int8 *)(a1 + 53)];
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
        -[ACCBLEPairingFeaturePlugin startPlugin]();
      }
      BOOL v7 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v7 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 40) iap2ShimAccessory];
      uint64_t v9 = [v8 accessoryUID];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412546;
      id v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_225708000, v7, OS_LOG_TYPE_DEFAULT, "blePairing deviceStartBLEUpdates: %@, skip processing, _blePairingProvider(%@) nil", buf, 0x16u);
    }
  }
}

- (void)deviceStateUpdate:(id)a3 btRadio:(unsigned __int8)a4 pairStatus:(int)a5 pairModeOn:(BOOL)a6 forceUpdates:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  int v10 = a4;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v12 = a3;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 1;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingFeaturePlugin startPlugin]();
    }
    uint64_t v15 = MEMORY[0x263EF8438];
    id v14 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v15 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    blePairingProvider = self->_blePairingProvider;
    blePairingShim = self->_blePairingShim;
    *(_DWORD *)buf = 138413826;
    id v26 = v12;
    __int16 v27 = 1024;
    int v28 = v10;
    __int16 v29 = 1024;
    int v30 = a5;
    __int16 v31 = 1024;
    BOOL v32 = v8;
    __int16 v33 = 1024;
    BOOL v34 = v7;
    __int16 v35 = 2112;
    __int16 v36 = blePairingProvider;
    __int16 v37 = 2112;
    __int16 v38 = blePairingShim;
    _os_log_impl(&dword_225708000, v15, OS_LOG_TYPE_INFO, "blePairing deviceStateUpdate: %@ btRadio:%d pairStatus:%d pairModeOn:%d forceUpdates:%d, _blePairingProvider=%@ _blePairingShim=%@", buf, 0x38u);
  }

  blePairingQueue = self->_blePairingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__ACCBLEPairingFeaturePlugin_deviceStateUpdate_btRadio_pairStatus_pairModeOn_forceUpdates___block_invoke;
  block[3] = &unk_26474F098;
  void block[4] = self;
  id v21 = v12;
  char v23 = v10;
  int v22 = a5;
  BOOL v24 = v8;
  id v19 = v12;
  dispatch_async(blePairingQueue, block);
}

void __91__ACCBLEPairingFeaturePlugin_deviceStateUpdate_btRadio_pairStatus_pairModeOn_forceUpdates___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    id v11 = [*(id *)(a1 + 40) iap2ShimAccessory];
    uint64_t v3 = [v11 accessoryUID];
    uint64_t v4 = [*(id *)(a1 + 40) blePairingUUID];
    [v2 deviceStateUpdate:v3 blePairingUUID:v4 bRadioOn:*(unsigned char *)(a1 + 52) != 0 pairState:*(unsigned int *)(a1 + 48) bPairModeOn:*(unsigned __int8 *)(a1 + 53)];
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
        -[ACCBLEPairingFeaturePlugin startPlugin]();
      }
      BOOL v7 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v7 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [*(id *)(a1 + 40) iap2ShimAccessory];
      uint64_t v9 = [v8 accessoryUID];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412546;
      BOOL v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_225708000, v7, OS_LOG_TYPE_DEFAULT, "blePairing deviceStateUpdate: %@, skip processing, _blePairingProvider(%@) nil or doesn't support selector", buf, 0x16u);
    }
  }
}

- (void)deviceSend:(id)a3 pairType:(int)a4 pairingData:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 1;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingFeaturePlugin startPlugin]();
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
    blePairingProvider = self->_blePairingProvider;
    blePairingShim = self->_blePairingShim;
    *(_DWORD *)buf = 138413314;
    id v23 = v8;
    __int16 v24 = 1024;
    int v25 = a4;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    __int16 v29 = blePairingProvider;
    __int16 v30 = 2112;
    __int16 v31 = blePairingShim;
    _os_log_impl(&dword_225708000, v12, OS_LOG_TYPE_INFO, "blePairing deviceSend: %@ pairType:%d pairingData:%@, _blePairingProvider=%@ _blePairingShim=%@", buf, 0x30u);
  }

  blePairingQueue = self->_blePairingQueue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __62__ACCBLEPairingFeaturePlugin_deviceSend_pairType_pairingData___block_invoke;
  v18[3] = &unk_26474F0C0;
  v18[4] = self;
  id v19 = v8;
  int v21 = a4;
  id v20 = v9;
  id v16 = v9;
  id v17 = v8;
  dispatch_async(blePairingQueue, v18);
}

void __62__ACCBLEPairingFeaturePlugin_deviceSend_pairType_pairingData___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    id v11 = [*(id *)(a1 + 40) iap2ShimAccessory];
    uint64_t v3 = [v11 accessoryUID];
    uint64_t v4 = [*(id *)(a1 + 40) blePairingUUID];
    [v2 devicePairingData:v3 blePairingUUID:v4 pairType:*(unsigned int *)(a1 + 56) pairData:*(void *)(a1 + 48)];
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
        -[ACCBLEPairingFeaturePlugin startPlugin]();
      }
      BOOL v7 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v7 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 40) iap2ShimAccessory];
      id v9 = [v8 accessoryUID];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412546;
      BOOL v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_225708000, v7, OS_LOG_TYPE_DEFAULT, "blePairing deviceSend: %@, skip processing, _blePairingProvider(%@) nil or doesn't support selector", buf, 0x16u);
    }
  }
}

- (void)deviceUpdate:(id)a3 pairType:(int)a4 pairInfo:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 1;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingFeaturePlugin startPlugin]();
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
    blePairingProvider = self->_blePairingProvider;
    blePairingShim = self->_blePairingShim;
    *(_DWORD *)buf = 138413314;
    id v23 = v8;
    __int16 v24 = 1024;
    int v25 = a4;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    __int16 v29 = blePairingProvider;
    __int16 v30 = 2112;
    __int16 v31 = blePairingShim;
    _os_log_impl(&dword_225708000, v12, OS_LOG_TYPE_INFO, "blePairing deviceUpdate: %@ pairType:%d pairingInfo:%@, _blePairingProvider=%@ _blePairingShim=%@", buf, 0x30u);
  }

  blePairingQueue = self->_blePairingQueue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __61__ACCBLEPairingFeaturePlugin_deviceUpdate_pairType_pairInfo___block_invoke;
  v18[3] = &unk_26474F0C0;
  v18[4] = self;
  id v19 = v8;
  int v21 = a4;
  id v20 = v9;
  id v16 = v9;
  id v17 = v8;
  dispatch_async(blePairingQueue, v18);
}

void __61__ACCBLEPairingFeaturePlugin_deviceUpdate_pairType_pairInfo___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    id v11 = [*(id *)(a1 + 40) iap2ShimAccessory];
    uint64_t v3 = [v11 accessoryUID];
    uint64_t v4 = [*(id *)(a1 + 40) blePairingUUID];
    [v2 deviceUpdatePairingInfo:v3 blePairingUUID:v4 pairType:*(unsigned int *)(a1 + 56) pairInfo:*(void *)(a1 + 48)];
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
        -[ACCBLEPairingFeaturePlugin startPlugin]();
      }
      BOOL v7 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v7 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 40) iap2ShimAccessory];
      id v9 = [v8 accessoryUID];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412546;
      BOOL v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_225708000, v7, OS_LOG_TYPE_DEFAULT, "blePairing deviceUpdate: %@, skip processing, _blePairingProvider(%@) nil or doesn't support selector", buf, 0x16u);
    }
  }
}

- (void)deviceStopBLEUpdates:(id)a3
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
      -[ACCBLEPairingFeaturePlugin startPlugin]();
    }
    BOOL v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    blePairingProvider = self->_blePairingProvider;
    blePairingShim = self->_blePairingShim;
    *(_DWORD *)buf = 138412802;
    id v15 = v4;
    __int16 v16 = 2112;
    id v17 = blePairingProvider;
    __int16 v18 = 2112;
    id v19 = blePairingShim;
    _os_log_impl(&dword_225708000, v7, OS_LOG_TYPE_INFO, "blePairing deviceStopBLEUpdates: %@, _blePairingProvider=%@ _blePairingShim=%@", buf, 0x20u);
  }

  blePairingQueue = self->_blePairingQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__ACCBLEPairingFeaturePlugin_deviceStopBLEUpdates___block_invoke;
  v12[3] = &unk_26474F0E8;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_async(blePairingQueue, v12);
}

void __51__ACCBLEPairingFeaturePlugin_deviceStopBLEUpdates___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    id v11 = [*(id *)(a1 + 40) iap2ShimAccessory];
    uint64_t v3 = [v11 accessoryUID];
    id v4 = [*(id *)(a1 + 40) blePairingUUID];
    [v2 stopBLEUpdates:v3 blePairingUUID:v4];
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
        -[ACCBLEPairingFeaturePlugin startPlugin]();
      }
      BOOL v7 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v7 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 40) iap2ShimAccessory];
      id v9 = [v8 accessoryUID];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412546;
      id v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_225708000, v7, OS_LOG_TYPE_DEFAULT, "blePairing deviceStopBLEUpdates: %@, skip processing, _blePairingProvider(%@) nil or doesn't support selector", buf, 0x16u);
    }
  }
}

- (BOOL)_isSupportedType:(unsigned __int8)a3 supportedListData:(id)a4
{
  int v4 = a3;
  id v5 = a4;
  id v6 = v5;
  if (v5 && [v5 length] && objc_msgSend(v6, "length"))
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = v6;
      int v9 = *(unsigned __int8 *)([v8 bytes] + v7);
      BOOL v10 = v9 == v4;
      if (v9 == v4) {
        break;
      }
      ++v7;
    }
    while ([v8 length] > v7);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
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

- (ACCBLEPairingProvider)blePairingProvider
{
  return self->_blePairingProvider;
}

- (void)setBlePairingProvider:(id)a3
{
}

- (OS_dispatch_queue)blePairingQueue
{
  return self->_blePairingQueue;
}

- (void)setBlePairingQueue:(id)a3
{
}

- (ACCBLEPairingShim)blePairingShim
{
  return self->_blePairingShim;
}

- (void)setBlePairingShim:(id)a3
{
}

- (NSMutableDictionary)blePairingAccessoryList
{
  return self->_blePairingAccessoryList;
}

- (void)setBlePairingAccessoryList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blePairingAccessoryList, 0);
  objc_storeStrong((id *)&self->_blePairingShim, 0);
  objc_storeStrong((id *)&self->_blePairingQueue, 0);
  objc_storeStrong((id *)&self->_blePairingProvider, 0);
  objc_storeStrong((id *)&self->_iap2server, 0);
}

void __105__ACCBLEPairingFeaturePlugin_blePairing_accessoryAttached_blePairingUUID_accInfoDict_supportedPairTypes___block_invoke_cold_3(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = [a1 connectionIDObj];
  int v5 = 138412546;
  id v6 = a1;
  __int16 v7 = 2112;
  id v8 = v4;
  _os_log_debug_impl(&dword_225708000, a2, OS_LOG_TYPE_DEBUG, "accessoryAttached: accessory=%@ connectionIDObj=%@", (uint8_t *)&v5, 0x16u);
}

@end