@interface ACCBLEPairingProviderInternal
+ (id)SharedInstance;
- (ACCBLEPairingXPCServerProtocol)remoteObject;
- (NSLock)delegateListLock;
- (NSMutableDictionary)accessories;
- (NSMutableDictionary)delegateList;
- (NSString)providerUID;
- (NSXPCConnection)serverConnection;
- (id)initSharedInstance;
- (int)accDetectToken;
- (int)getAccDetectType:(int)a3;
- (int)lastScorpiusDetectType;
- (void)accessoryBLEPairingAttached:(id)a3 blePairingUUID:(id)a4 accInfoDict:(id)a5 supportedPairTypes:(id)a6;
- (void)accessoryBLEPairingDataUpdate:(id)a3 blePairingUUID:(id)a4 pairType:(unsigned __int8)a5 pairData:(id)a6;
- (void)accessoryBLEPairingDetachAll;
- (void)accessoryBLEPairingDetached:(id)a3 blePairingUUID:(id)a4;
- (void)accessoryBLEPairingFinished:(id)a3 blePairingUUID:(id)a4;
- (void)accessoryBLEPairingInfoUpdate:(id)a3 blePairingUUID:(id)a4 pairType:(unsigned __int8)a5 pairInfoList:(id)a6;
- (void)accessoryBLEPairingNoAccessories;
- (void)accessoryBLEPairingStateUpdate:(id)a3 blePairingUUID:(id)a4 validMask:(unsigned int)a5 btRadioOn:(BOOL)a6 pairingState:(int)a7 pairingModeOn:(BOOL)a8;
- (void)connectToServer;
- (void)dealloc;
- (void)devicePairingData:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 pairData:(id)a6;
- (void)deviceStateUpdate:(id)a3 blePairingUUID:(id)a4 bRadioOn:(BOOL)a5 pairState:(int)a6 bPairModeOn:(BOOL)a7;
- (void)deviceUpdatePairingInfo:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 pairInfo:(id)a6;
- (void)registerDelegate:(id)a3 provider:(id)a4 forUUID:(id)a5;
- (void)setAccDetectToken:(int)a3;
- (void)setAccessories:(id)a3;
- (void)setDelegateList:(id)a3;
- (void)setDelegateListLock:(id)a3;
- (void)setLastScorpiusDetectType:(int)a3;
- (void)setProviderUID:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)setServerConnection:(id)a3;
- (void)startBLEUpdates:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 bRadioUpdatesOn:(BOOL)a6 bPairInfoUpdatesOn:(BOOL)a7;
- (void)stopBLEUpdates:(id)a3 blePairingUUID:(id)a4;
- (void)unregisterDelegateForUUID:(id)a3;
@end

@implementation ACCBLEPairingProviderInternal

+ (id)SharedInstance
{
  if (SharedInstance_onceToken != -1) {
    dispatch_once(&SharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)SharedInstance__sharedInstance;
  return v2;
}

uint64_t __47__ACCBLEPairingProviderInternal_SharedInstance__block_invoke()
{
  SharedInstance__sharedInstance = [[ACCBLEPairingProviderInternal alloc] initSharedInstance];
  return MEMORY[0x270F9A758]();
}

- (id)initSharedInstance
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  init_logging();
  v26.receiver = self;
  v26.super_class = (Class)ACCBLEPairingProviderInternal;
  v3 = [(ACCBLEPairingProviderInternal *)&v26 init];
  if (v3)
  {
    v4 = [MEMORY[0x263F08C38] UUID];
    uint64_t v5 = [v4 UUIDString];
    providerUID = v3->_providerUID;
    v3->_providerUID = (NSString *)v5;

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      v7 = &_os_log_internal;
      id v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v3->_providerUID;
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v9;
      __int16 v28 = 2048;
      v29 = v3;
      _os_log_impl(&dword_220C96000, v7, OS_LOG_TYPE_DEFAULT, "ACCBLEPairingProvider init, _providerUID=%@, %p", buf, 0x16u);
    }

    v10 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    delegateListLock = v3->_delegateListLock;
    v3->_delegateListLock = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    delegateList = v3->_delegateList;
    v3->_delegateList = v12;

    serverConnection = v3->_serverConnection;
    v3->_serverConnection = 0;

    remoteObject = v3->_remoteObject;
    v3->_remoteObject = 0;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    accessories = v3->_accessories;
    v3->_accessories = v16;

    v3->_accDetectToken = -1;
    v3->_lastScorpiusDetectType = [(ACCBLEPairingProviderInternal *)v3 getAccDetectType:0xFFFFFFFFLL];
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v3);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __51__ACCBLEPairingProviderInternal_initSharedInstance__block_invoke;
    v23[3] = &unk_2645801C0;
    v18 = v3;
    v24 = v18;
    objc_copyWeak(&v25, (id *)buf);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.blepairing.availability-changed", v23);
    [(ACCBLEPairingProviderInternal *)v18 connectToServer];
    id v19 = MEMORY[0x263EF83A0];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __51__ACCBLEPairingProviderInternal_initSharedInstance__block_invoke_70;
    handler[3] = &unk_2645801E8;
    objc_copyWeak(&v22, (id *)buf);
    notify_register_dispatch("com.apple.accessories.scp.objdetect", &v3->_accDetectToken, MEMORY[0x263EF83A0], handler);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v25);

    objc_destroyWeak((id *)buf);
  }
  return v3;
}

void __51__ACCBLEPairingProviderInternal_initSharedInstance__block_invoke(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 32);
    v11[0] = 67109378;
    v11[1] = a2;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl(&dword_220C96000, v6, OS_LOG_TYPE_DEFAULT, "Server availability changed! State: %d UID: %@", (uint8_t *)v11, 0x12u);
  }

  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      id v8 = &_os_log_internal;
      id v9 = &_os_log_internal;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl(&dword_220C96000, v8, OS_LOG_TYPE_DEFAULT, "Trying to connect to server...", (uint8_t *)v11, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained connectToServer];
  }
}

void __51__ACCBLEPairingProviderInternal_initSharedInstance__block_invoke_70(uint64_t a1, uint64_t a2)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  location = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained getAccDetectType:a2];

  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    uint64_t v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_loadWeakRetained(location);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v46 = [v8 lastScorpiusDetectType];
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v4;
    _os_log_impl(&dword_220C96000, v7, OS_LOG_TYPE_DEFAULT, "lastDetectType %d -> %d", buf, 0xEu);
  }
  id v9 = objc_loadWeakRetained(location);
  [v9 setLastScorpiusDetectType:v4];

  id v10 = objc_loadWeakRetained(location);
  v11 = [v10 delegateListLock];
  [v11 lock];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v12 = objc_loadWeakRetained(location);
  uint64_t v13 = [v12 delegateList];
  uint64_t v14 = [v13 allValues];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v42;
    id v19 = &_os_log_internal;
    *(void *)&long long v16 = 134218240;
    long long v39 = v16;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v42 != v18) {
          objc_enumerationMutation(v14);
        }
        v21 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v22 = objc_msgSend(v21, "delegate", v39);
        v23 = [v21 provider];
        if (v22 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v24 = gLogObjects;
          int v25 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            objc_super v26 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v39;
              *(void *)v46 = v24;
              *(_WORD *)&v46[8] = 1024;
              LODWORD(v47) = v25;
              _os_log_error_impl(&dword_220C96000, v19, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v32 = v19;
            objc_super v26 = v19;
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)v46 = v22;
            *(_WORD *)&v46[8] = 2112;
            v47 = v23;
            _os_log_impl(&dword_220C96000, v26, OS_LOG_TYPE_INFO, "BLEPairingProvider delegate respond to blePairing:accessoryDetect:, delegate = %@, provider = %@", buf, 0x16u);
          }

          v31 = objc_loadWeakRetained(location);
          objc_msgSend(v22, "blePairing:accessoryDetect:", v23, -[NSObject lastScorpiusDetectType](v31, "lastScorpiusDetectType"));
        }
        else
        {
          uint64_t v27 = gLogObjects;
          int v28 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v29 = gNumLogObjects < 1;
          }
          else {
            BOOL v29 = 1;
          }
          if (v29)
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v39;
              *(void *)v46 = v27;
              *(_WORD *)&v46[8] = 1024;
              LODWORD(v47) = v28;
              _os_log_error_impl(&dword_220C96000, v19, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            uint64_t v30 = v19;
            v31 = v19;
          }
          else
          {
            v31 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)v46 = v22;
            *(_WORD *)&v46[8] = 2112;
            v47 = v23;
            _os_log_impl(&dword_220C96000, v31, OS_LOG_TYPE_INFO, "BLEPairingProvider delegate doesn't respond to blePairing:accessoryDetect:, delegate = %@, provider = %@", buf, 0x16u);
          }
        }
      }
      uint64_t v17 = [v14 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v17);
  }

  id v33 = objc_loadWeakRetained(location);
  v34 = [v33 delegateListLock];
  [v34 unlock];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v35 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    v35 = &_os_log_internal;
    id v36 = &_os_log_internal;
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    id v37 = objc_loadWeakRetained(location);
    v38 = [v37 providerUID];
    *(_DWORD *)buf = 138412290;
    *(void *)v46 = v38;
    _os_log_impl(&dword_220C96000, v35, OS_LOG_TYPE_INFO, "EXIT object detect notification handler, %@", buf, 0xCu);
  }
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    BOOL v5 = &_os_log_internal;
    id v4 = &_os_log_internal;
  }
  else
  {
    BOOL v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    providerUID = self->_providerUID;
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = providerUID;
    _os_log_impl(&dword_220C96000, v5, OS_LOG_TYPE_DEFAULT, "ACCBLEPairingProvider dealloc, _providerUID %@", buf, 0xCu);
  }

  notify_cancel(self->_accDetectToken);
  self->_accDetectToken = -1;
  accessoryServer_unregisterAvailabilityChangedHandler();
  uint64_t v7 = [(ACCBLEPairingProviderInternal *)self serverConnection];
  [v7 invalidate];

  [(ACCBLEPairingProviderInternal *)self setServerConnection:0];
  delegateList = self->_delegateList;
  self->_delegateList = 0;

  delegateListLock = self->_delegateListLock;
  self->_delegateListLock = 0;

  remoteObject = self->_remoteObject;
  self->_remoteObject = 0;

  accessories = self->_accessories;
  self->_accessories = 0;

  v12.receiver = self;
  v12.super_class = (Class)ACCBLEPairingProviderInternal;
  [(ACCBLEPairingProviderInternal *)&v12 dealloc];
}

- (void)registerDelegate:(id)a3 provider:(id)a4 forUUID:(id)a5
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v51 = a4;
  id v9 = a5;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 1;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    objc_super v12 = &_os_log_internal;
    id v11 = &_os_log_internal;
  }
  else
  {
    objc_super v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v57 = "-[ACCBLEPairingProviderInternal registerDelegate:provider:forUUID:]";
    __int16 v58 = 1024;
    int v59 = 315;
    __int16 v60 = 2112;
    id v61 = v8;
    __int16 v62 = 2112;
    id v63 = v9;
    _os_log_impl(&dword_220C96000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d, delegate %@, uuid %@", buf, 0x26u);
  }

  [(ACCBLEPairingProviderInternal *)self connectToServer];
  [(NSLock *)self->_delegateListLock lock];
  uint64_t v13 = [(NSMutableDictionary *)self->_accessories allValues];
  uint64_t v14 = (void *)[v13 copy];

  uint64_t v15 = [[ACCBLEPairingDelegateReference alloc] initWithDelegate:v8 provider:v51];
  [(NSMutableDictionary *)self->_delegateList setObject:v15 forKey:v9];
  if (accessoryServer_isServerAvailable())
  {
    v45 = v15;
    v46 = v14;
    id v47 = v9;
    v48 = self;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = v14;
    uint64_t v16 = [obj countByEnumeratingWithState:&v52 objects:v68 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v50 = *(void *)v53;
      uint64_t v18 = &_os_log_internal;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v53 != v50) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          uint64_t v21 = gLogObjects;
          int v22 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v23 = gNumLogObjects < 1;
          }
          else {
            BOOL v23 = 1;
          }
          if (v23)
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v57 = (const char *)v21;
              __int16 v58 = 1024;
              int v59 = v22;
              _os_log_error_impl(&dword_220C96000, v18, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            uint64_t v24 = v18;
            int v25 = v18;
          }
          else
          {
            int v25 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            objc_super v26 = [v20 accessoryUID];
            uint64_t v27 = [v20 blePairingUUID];
            *(_DWORD *)buf = 136316418;
            v57 = "-[ACCBLEPairingProviderInternal registerDelegate:provider:forUUID:]";
            __int16 v58 = 1024;
            int v59 = 333;
            __int16 v60 = 2112;
            id v61 = v26;
            __int16 v62 = 2112;
            id v63 = v27;
            __int16 v64 = 2112;
            id v65 = v8;
            __int16 v66 = 2112;
            id v67 = v51;
            _os_log_impl(&dword_220C96000, v25, OS_LOG_TYPE_DEFAULT, "%s:%d call accessoryAttached: accessory %@, blePairingUUID %@, call delegate=%@, provider=%@", buf, 0x3Au);
          }
          int v28 = [v20 accessoryUID];
          BOOL v29 = [v20 blePairingUUID];
          uint64_t v30 = [v20 accInfo];
          [v20 supportedPairTypes];
          v32 = v31 = v8;
          [v31 blePairing:v51 accessoryAttached:v28 blePairingUUID:v29 accInfoDict:v30 supportedPairTypes:v32];

          id v8 = v31;
          if ([v20 blePairingFinished])
          {
            uint64_t v33 = gLogObjects;
            int v34 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 1)
            {
              v35 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v57 = (const char *)v33;
                __int16 v58 = 1024;
                int v59 = v34;
                _os_log_error_impl(&dword_220C96000, v18, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              id v36 = v18;
              v35 = v18;
            }
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              id v37 = [v20 accessoryUID];
              v38 = [v20 blePairingUUID];
              *(_DWORD *)buf = 136316418;
              v57 = "-[ACCBLEPairingProviderInternal registerDelegate:provider:forUUID:]";
              __int16 v58 = 1024;
              int v59 = 344;
              __int16 v60 = 2112;
              id v61 = v37;
              __int16 v62 = 2112;
              id v63 = v38;
              __int16 v64 = 2112;
              id v65 = v31;
              __int16 v66 = 2112;
              id v67 = v51;
              _os_log_impl(&dword_220C96000, v35, OS_LOG_TYPE_DEFAULT, "%s:%d call pairingFinished: accessory %@, blePairingUUID %@, call delegate=%@, provider=%@", buf, 0x3Au);
            }
            long long v39 = [v20 accessoryUID];
            v40 = [v20 blePairingUUID];
            [v31 blePairing:v51 pairingFinished:v39 blePairingUUID:v40];
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v52 objects:v68 count:16];
      }
      while (v17);
    }

    id v9 = v47;
    self = v48;
    uint64_t v15 = v45;
    uint64_t v14 = v46;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      long long v41 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      long long v41 = &_os_log_internal;
      id v42 = &_os_log_internal;
    }
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      v57 = "-[ACCBLEPairingProviderInternal registerDelegate:provider:forUUID:]";
      __int16 v58 = 1024;
      int v59 = 355;
      __int16 v60 = 2112;
      id v61 = v8;
      __int16 v62 = 2112;
      id v63 = v51;
      _os_log_impl(&dword_220C96000, v41, OS_LOG_TYPE_INFO, "%s:%d NOT accessoryServer_isServerAvailable(), delegate=%@, provider=%@", buf, 0x26u);
    }

    if (objc_opt_respondsToSelector())
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        long long v43 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
        }
        long long v43 = &_os_log_internal;
        id v44 = &_os_log_internal;
      }
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v57 = "-[ACCBLEPairingProviderInternal registerDelegate:provider:forUUID:]";
        __int16 v58 = 1024;
        int v59 = 360;
        __int16 v60 = 2112;
        id v61 = v8;
        __int16 v62 = 2112;
        id v63 = v51;
        _os_log_impl(&dword_220C96000, v43, OS_LOG_TYPE_DEFAULT, "%s:%d call blePairingNoAccessories, delegate=%@, provider=%@", buf, 0x26u);
      }

      [v8 blePairingNoAccessories:v51];
    }
  }
  [(NSLock *)self->_delegateListLock unlock];
}

- (void)unregisterDelegateForUUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    uint64_t v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    id v9 = "-[ACCBLEPairingProviderInternal unregisterDelegateForUUID:]";
    __int16 v10 = 1024;
    int v11 = 371;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_220C96000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d, uuid %@", (uint8_t *)&v8, 0x1Cu);
  }

  [(NSLock *)self->_delegateListLock lock];
  [(NSMutableDictionary *)self->_delegateList removeObjectForKey:v4];
  [(NSLock *)self->_delegateListLock unlock];
}

- (void)connectToServer
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    BOOL v5 = &_os_log_internal;
    id v4 = &_os_log_internal;
  }
  else
  {
    BOOL v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    providerUID = self->_providerUID;
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = providerUID;
    _os_log_impl(&dword_220C96000, v5, OS_LOG_TYPE_DEFAULT, "ACCBLEPairingProvider connectToServer, _providerUID=%@", buf, 0xCu);
  }

  uint64_t v7 = self;
  objc_sync_enter(v7);
  int isServerAvailable = accessoryServer_isServerAvailable();
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects <= 0;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = !v9;
  if (isServerAvailable)
  {
    if (v10)
    {
      int v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      int v11 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = v7->_providerUID;
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl(&dword_220C96000, v11, OS_LOG_TYPE_DEFAULT, "ACCBLEPairingProvider connectToServer, _providerUID=%@, IS accessoryServer_isServerAvailable()", buf, 0xCu);
    }

    uint64_t v15 = [(ACCBLEPairingProviderInternal *)v7 serverConnection];
    BOOL v16 = v15 == 0;

    if (v16)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v17 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
        }
        uint64_t v17 = &_os_log_internal;
        id v20 = &_os_log_internal;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_220C96000, v17, OS_LOG_TYPE_DEFAULT, "Connecting to XPC server...", buf, 2u);
      }

      uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.accessories.blepairing" options:4096];
      [(ACCBLEPairingProviderInternal *)v7 setServerConnection:v21];

      int v22 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D2B62D8];
      BOOL v23 = [(ACCBLEPairingProviderInternal *)v7 serverConnection];
      [v23 setRemoteObjectInterface:v22];

      uint64_t v24 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D2B6338];
      int v25 = [(ACCBLEPairingProviderInternal *)v7 serverConnection];
      [v25 setExportedInterface:v24];

      objc_super v26 = [(ACCBLEPairingProviderInternal *)v7 serverConnection];
      [v26 setExportedObject:v7];

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v7);
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __48__ACCBLEPairingProviderInternal_connectToServer__block_invoke;
      v44[3] = &unk_264580210;
      objc_copyWeak(&v45, (id *)buf);
      uint64_t v27 = [(ACCBLEPairingProviderInternal *)v7 serverConnection];
      [v27 setInvalidationHandler:v44];

      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __48__ACCBLEPairingProviderInternal_connectToServer__block_invoke_153;
      v42[3] = &unk_264580210;
      objc_copyWeak(&v43, (id *)buf);
      int v28 = [(ACCBLEPairingProviderInternal *)v7 serverConnection];
      [v28 setInterruptionHandler:v42];

      BOOL v29 = [(ACCBLEPairingProviderInternal *)v7 serverConnection];
      [v29 resume];

      objc_destroyWeak(&v43);
      objc_destroyWeak(&v45);
      objc_destroyWeak((id *)buf);
    }
    uint64_t v30 = [(ACCBLEPairingProviderInternal *)v7 remoteObject];
    BOOL v31 = v30 == 0;

    if (v31)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v32 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
        }
        v32 = &_os_log_internal;
        id v33 = &_os_log_internal;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_220C96000, v32, OS_LOG_TYPE_DEFAULT, "Getting remote object...", buf, 2u);
      }

      int v34 = [(ACCBLEPairingProviderInternal *)v7 serverConnection];
      v35 = [v34 remoteObjectProxyWithErrorHandler:&__block_literal_global_157];
      [(ACCBLEPairingProviderInternal *)v7 setRemoteObject:v35];

      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v36 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
        }
        id v36 = &_os_log_internal;
        id v37 = &_os_log_internal;
      }
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v38 = [(ACCBLEPairingProviderInternal *)v7 remoteObject];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v38;
        _os_log_impl(&dword_220C96000, v36, OS_LOG_TYPE_DEFAULT, "Call initConnection to remoteObject=%@", buf, 0xCu);
      }
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v7);
      long long v39 = [(ACCBLEPairingProviderInternal *)v7 remoteObject];
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __48__ACCBLEPairingProviderInternal_connectToServer__block_invoke_158;
      v40[3] = &unk_264580258;
      objc_copyWeak(&v41, (id *)buf);
      [v39 initConnection:v40];

      objc_destroyWeak(&v41);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    if (v10)
    {
      __int16 v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      __int16 v12 = &_os_log_internal;
      id v18 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = v7->_providerUID;
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v19;
      _os_log_impl(&dword_220C96000, v12, OS_LOG_TYPE_DEFAULT, "ACCBLEPairingProvider connectToServer, _providerUID=%@, NOT accessoryServer_isServerAvailable()", buf, 0xCu);
    }
  }
  objc_sync_exit(v7);
}

void __48__ACCBLEPairingProviderInternal_connectToServer__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained serverConnection];
  [v3 setInvalidationHandler:0];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setRemoteObject:0];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setServerConnection:0];

  accessoryServer_serverIsUnreachable();
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    id v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v9 = 0;
    _os_log_impl(&dword_220C96000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated!", v9, 2u);
  }

  id v8 = objc_loadWeakRetained(v1);
  [v8 accessoryBLEPairingDetachAll];
}

void __48__ACCBLEPairingProviderInternal_connectToServer__block_invoke_153(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setRemoteObject:0];

  id v3 = objc_loadWeakRetained(v1);
  id v4 = [v3 serverConnection];
  [v4 invalidate];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setServerConnection:0];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    id v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_220C96000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted!", v8, 2u);
  }
}

void __48__ACCBLEPairingProviderInternal_connectToServer__block_invoke_154(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    id v5 = &_os_log_internal;
    id v4 = &_os_log_internal;
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_220C96000, v5, OS_LOG_TYPE_DEFAULT, "XPC connection error!", (uint8_t *)&v8, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    id v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v2;
    _os_log_impl(&dword_220C96000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }
}

void __48__ACCBLEPairingProviderInternal_connectToServer__block_invoke_158(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    id v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_220C96000, v6, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", (uint8_t *)v9, 8u);
  }

  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v8 = [WeakRetained serverConnection];
    [v8 invalidate];
  }
}

- (int)getAccDetectType:(int)a3
{
  uint64_t state64 = -1;
  if (a3 == -1)
  {
    int out_token = -1;
    if (!notify_register_check("com.apple.accessories.scp.objdetect", &out_token))
    {
      notify_get_state(out_token, &state64);
      notify_cancel(out_token);
    }
  }
  else
  {
    notify_get_state(a3, &state64);
  }
  return state64;
}

- (void)accessoryBLEPairingAttached:(id)a3 blePairingUUID:(id)a4 accInfoDict:(id)a5 supportedPairTypes:(id)a6
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(NSMutableDictionary *)self->_accessories objectForKey:v10];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      BOOL v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      BOOL v16 = &_os_log_internal;
      id v32 = &_os_log_internal;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v49 = (uint64_t)v10;
      __int16 v50 = 2112;
      id v51 = v15;
      id v33 = "accessoryBLEPairingAttached: accessory %@ (%@) already exists!";
      int v34 = v16;
      uint32_t v35 = 22;
LABEL_35:
      _os_log_impl(&dword_220C96000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
    }
  }
  else
  {
    long long v39 = [[ACCBLEPairingAccessory alloc] initWithAccessoryUID:v10 blePairingUUID:v11 andAccInfo:v12 supportedPairTypes:v13];
    -[NSMutableDictionary setObject:forKey:](self->_accessories, "setObject:forKey:");
    [(NSLock *)self->_delegateListLock lock];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v40 = self;
    id obj = [(NSMutableDictionary *)self->_delegateList allValues];
    uint64_t v17 = [obj countByEnumeratingWithState:&v44 objects:v58 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v43 = *(void *)v45;
      id v42 = v13;
      id v19 = &_os_log_internal;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          id v21 = v12;
          id v22 = v10;
          if (*(void *)v45 != v43) {
            objc_enumerationMutation(obj);
          }
          BOOL v23 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          uint64_t v24 = [v23 delegate];
          int v25 = [v23 provider];
          uint64_t v26 = gLogObjects;
          int v27 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v28 = gNumLogObjects < 1;
          }
          else {
            BOOL v28 = 1;
          }
          if (v28)
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v49 = v26;
              __int16 v50 = 1024;
              LODWORD(v51) = v27;
              _os_log_error_impl(&dword_220C96000, v19, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            BOOL v29 = v19;
            uint64_t v30 = v19;
          }
          else
          {
            uint64_t v30 = *(id *)gLogObjects;
          }
          id v10 = v22;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413058;
            uint64_t v49 = (uint64_t)v22;
            __int16 v50 = 2112;
            id v51 = v11;
            __int16 v52 = 2112;
            long long v53 = v24;
            __int16 v54 = 2112;
            id v55 = v25;
            _os_log_impl(&dword_220C96000, v30, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingAttached: accessory %@, blePairingUUID %@, call delegate=%@, provider=%@", buf, 0x2Au);
          }

          id v12 = v21;
          id v31 = v21;
          id v13 = v42;
          [v24 blePairing:v25 accessoryAttached:v22 blePairingUUID:v11 accInfoDict:v31 supportedPairTypes:v42];
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v44 objects:v58 count:16];
      }
      while (v18);
    }

    [(NSLock *)v40->_delegateListLock unlock];
    if (gLogObjects && gNumLogObjects >= 1)
    {
      BOOL v16 = *(id *)gLogObjects;
      uint64_t v15 = v39;
    }
    else
    {
      uint64_t v15 = v39;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      BOOL v16 = &_os_log_internal;
      id v36 = &_os_log_internal;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      uint64_t v49 = (uint64_t)v10;
      __int16 v50 = 2112;
      id v51 = v11;
      __int16 v52 = 2112;
      long long v53 = v15;
      __int16 v54 = 2112;
      id v55 = v12;
      __int16 v56 = 2112;
      id v57 = v13;
      id v33 = "accessoryBLEPairingAttached: accessory %@, blePairingUUID %@, accessory=%@, accInfoDict=%@, supportedPairTypes=%@";
      int v34 = v16;
      uint32_t v35 = 52;
      goto LABEL_35;
    }
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v37 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    id v37 = &_os_log_internal;
    id v38 = &_os_log_internal;
  }
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v49 = (uint64_t)v10;
    __int16 v50 = 2112;
    id v51 = v11;
    __int16 v52 = 2112;
    long long v53 = v15;
    _os_log_impl(&dword_220C96000, v37, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingAttached: accessory %@, blePairingUUID %@, accessory=%@", buf, 0x20u);
  }
}

- (void)accessoryBLEPairingDetached:(id)a3 blePairingUUID:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v34 = a4;
  id v7 = v6;
  uint64_t v8 = [(NSMutableDictionary *)self->_accessories objectForKey:v6];
  id v9 = (void *)v8;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects <= 0;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  if (v8)
  {
    if (v11)
    {
      id v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      id v12 = &_os_log_internal;
      id v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v40 = (uint64_t)v7;
      __int16 v41 = 2112;
      id v42 = v34;
      __int16 v43 = 2112;
      long long v44 = v9;
      _os_log_impl(&dword_220C96000, v12, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDetached: accessory %@, blePairingUUID %@, accessory=%@", buf, 0x20u);
    }
    id v32 = v9;

    [(NSLock *)self->_delegateListLock lock];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v31 = self;
    id obj = [(NSMutableDictionary *)self->_delegateList allValues];
    uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v36;
      uint64_t v18 = &_os_log_internal;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v21 = [v20 delegate];
          id v22 = [v20 provider];
          uint64_t v23 = gLogObjects;
          int v24 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v25 = gNumLogObjects < 1;
          }
          else {
            BOOL v25 = 1;
          }
          if (v25)
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v40 = v23;
              __int16 v41 = 1024;
              LODWORD(v42) = v24;
              _os_log_error_impl(&dword_220C96000, v18, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            uint64_t v26 = v18;
            int v27 = v18;
          }
          else
          {
            int v27 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413058;
            uint64_t v40 = (uint64_t)v7;
            __int16 v41 = 2112;
            id v42 = v34;
            __int16 v43 = 2112;
            long long v44 = v21;
            __int16 v45 = 2112;
            long long v46 = v22;
            _os_log_impl(&dword_220C96000, v27, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDetached: accessory %@, blePairingUUID %@, call delegate=%@, provider=%@", buf, 0x2Au);
          }

          [v21 blePairing:v22 accessoryDetached:v7 blePairingUUID:v34];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v47 count:16];
      }
      while (v16);
    }

    [(NSLock *)v31->_delegateListLock unlock];
    [(NSMutableDictionary *)v31->_accessories removeObjectForKey:v7];
    id v9 = v32;
  }
  else
  {
    if (v11)
    {
      id v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      id v13 = &_os_log_internal;
      id v28 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v40 = (uint64_t)v7;
      __int16 v41 = 2112;
      id v42 = 0;
      _os_log_impl(&dword_220C96000, v13, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDetached: accessory %@ (%@) does not exist!", buf, 0x16u);
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    BOOL v29 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    BOOL v29 = &_os_log_internal;
    id v30 = &_os_log_internal;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v40 = (uint64_t)v7;
    __int16 v41 = 2112;
    id v42 = v34;
    __int16 v43 = 2112;
    long long v44 = v9;
    _os_log_impl(&dword_220C96000, v29, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDetached: EXIT, accessory %@, blePairingUUID %@, accessory %@", buf, 0x20u);
  }
}

- (void)accessoryBLEPairingNoAccessories
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    id v5 = &_os_log_internal;
    id v4 = &_os_log_internal;
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_220C96000, v5, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingNoAccessories", buf, 2u);
  }

  [(NSLock *)self->_delegateListLock lock];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v20 = self;
  id v6 = [(NSMutableDictionary *)self->_delegateList allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    BOOL v10 = &_os_log_internal;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v13 = [v12 delegate];
        id v14 = [v12 provider];
        uint64_t v15 = gLogObjects;
        int v16 = gNumLogObjects;
        if (gLogObjects) {
          BOOL v17 = gNumLogObjects < 1;
        }
        else {
          BOOL v17 = 1;
        }
        if (v17)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v26 = v15;
            __int16 v27 = 1024;
            LODWORD(v28) = v16;
            _os_log_error_impl(&dword_220C96000, v10, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          uint64_t v18 = v10;
          id v19 = v10;
        }
        else
        {
          id v19 = *(id *)gLogObjects;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v26 = (uint64_t)v13;
          __int16 v27 = 2112;
          id v28 = v14;
          _os_log_impl(&dword_220C96000, v19, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingNoAccessories, call delegate=%@, provider=%@", buf, 0x16u);
        }

        if (objc_opt_respondsToSelector()) {
          [v13 blePairingNoAccessories:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v8);
  }

  [(NSLock *)v20->_delegateListLock unlock];
}

- (void)accessoryBLEPairingDetachAll
{
  id v2 = self;
  uint64_t v48 = *MEMORY[0x263EF8340];
  BOOL v3 = self->_accessories;
  id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  accessories = v2->_accessories;
  v2->_accessories = v4;

  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    uint64_t v8 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  else
  {
    uint64_t v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v45 = [(NSMutableDictionary *)v3 count];
    _os_log_impl(&dword_220C96000, v8, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDetachAll: notify detach of %lu accessories!", buf, 0xCu);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  BOOL v29 = v3;
  id obj = [(NSMutableDictionary *)v3 allValues];
  uint64_t v33 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v33)
  {
    uint64_t v9 = &_os_log_internal;
    uint64_t v31 = *(void *)v39;
    id v32 = v2;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v39 != v31) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v12 = gLogObjects;
        int v13 = gNumLogObjects;
        if (gLogObjects) {
          BOOL v14 = gNumLogObjects < 1;
        }
        else {
          BOOL v14 = 1;
        }
        if (v14)
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v45 = v12;
            __int16 v46 = 1024;
            int v47 = v13;
            _os_log_error_impl(&dword_220C96000, v9, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          uint64_t v15 = v9;
        }
        else
        {
          uint64_t v9 = *(id *)gLogObjects;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v45 = (uint64_t)v11;
          _os_log_impl(&dword_220C96000, v9, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDetachAll: accessory %@", buf, 0xCu);
        }

        [(NSLock *)v2->_delegateListLock lock];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        int v16 = [(NSMutableDictionary *)v2->_delegateList allValues];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v35;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v35 != v19) {
                objc_enumerationMutation(v16);
              }
              long long v21 = *(void **)(*((void *)&v34 + 1) + 8 * j);
              long long v22 = [v21 delegate];
              long long v23 = [v21 provider];
              long long v24 = [v11 accessoryUID];
              BOOL v25 = [v11 blePairingUUID];
              [v22 blePairing:v23 accessoryDetached:v24 blePairingUUID:v25];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
          }
          while (v18);
        }

        id v2 = v32;
        [(NSLock *)v32->_delegateListLock unlock];
        uint64_t v9 = &_os_log_internal;
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v33);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v26 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    uint64_t v26 = &_os_log_internal;
    id v27 = &_os_log_internal;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = [(NSMutableDictionary *)v29 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v45 = v28;
    _os_log_impl(&dword_220C96000, v26, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDetachAll: EXIT, notify detach of %lu accessories!", buf, 0xCu);
  }
}

- (void)accessoryBLEPairingStateUpdate:(id)a3 blePairingUUID:(id)a4 validMask:(unsigned int)a5 btRadioOn:(BOOL)a6 pairingState:(int)a7 pairingModeOn:(BOOL)a8
{
  BOOL v39 = a8;
  BOOL v37 = a6;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v40 = a4;
  long long v41 = v10;
  uint64_t v11 = [(NSMutableDictionary *)self->_accessories objectForKey:v10];
  uint64_t v12 = (void *)v11;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects <= 0;
  }
  else {
    BOOL v13 = 1;
  }
  int v14 = !v13;
  if (v11)
  {
    if (v14)
    {
      uint64_t v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      uint64_t v15 = &_os_log_internal;
      id v17 = &_os_log_internal;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413826;
      uint64_t v47 = (uint64_t)v41;
      __int16 v48 = 2112;
      id v49 = v40;
      __int16 v50 = 1024;
      unsigned int v51 = a5;
      __int16 v52 = 1024;
      BOOL v53 = v37;
      __int16 v54 = 1024;
      int v55 = a7;
      __int16 v56 = 1024;
      BOOL v57 = v39;
      __int16 v58 = 2112;
      uint64_t v59 = v12;
      _os_log_impl(&dword_220C96000, v15, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingStateUpdate: accessory %@, blePairingUUID %@, validMask=%x btRadioOn=%d pairingState=%d pairingModeOn=%d, accessory=%@", buf, 0x38u);
    }
    long long v34 = v12;

    [(NSLock *)self->_delegateListLock lock];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = [(NSMutableDictionary *)self->_delegateList allValues];
    uint64_t v18 = [obj countByEnumeratingWithState:&v42 objects:v62 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v43;
      long long v21 = &_os_log_internal;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v43 != v20) {
            objc_enumerationMutation(obj);
          }
          long long v23 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          long long v24 = [v23 delegate];
          BOOL v25 = [v23 provider];
          uint64_t v26 = gLogObjects;
          int v27 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v28 = gNumLogObjects < 1;
          }
          else {
            BOOL v28 = 1;
          }
          if (v28)
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v47 = v26;
              __int16 v48 = 1024;
              LODWORD(v49) = v27;
              _os_log_error_impl(&dword_220C96000, v21, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            BOOL v29 = v21;
            uint64_t v30 = v21;
          }
          else
          {
            uint64_t v30 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138414082;
            uint64_t v47 = (uint64_t)v41;
            __int16 v48 = 2112;
            id v49 = v40;
            __int16 v50 = 1024;
            unsigned int v51 = a5;
            __int16 v52 = 1024;
            BOOL v53 = v37;
            __int16 v54 = 1024;
            int v55 = a7;
            __int16 v56 = 1024;
            BOOL v57 = v39;
            __int16 v58 = 2112;
            uint64_t v59 = v24;
            __int16 v60 = 2112;
            id v61 = v25;
            _os_log_impl(&dword_220C96000, v30, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingStateUpdate: accessory %@, blePairingUUID %@, validMask=%x btRadioOn=%d pairingState=%d pairingModeOn=%d, call delegate=%@, provider=%@", buf, 0x42u);
          }

          [v24 blePairingStateUpdate:v25 validMask:a5 btRadioOn:v37 pairingState:a7 pairingModeOn:v39 accessory:v41 blePairingUUID:v40];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v42 objects:v62 count:16];
      }
      while (v19);
    }

    [(NSLock *)self->_delegateListLock unlock];
    uint64_t v12 = v34;
  }
  else
  {
    if (v14)
    {
      int v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      int v16 = &_os_log_internal;
      id v31 = &_os_log_internal;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v47 = (uint64_t)v41;
      __int16 v48 = 2112;
      id v49 = 0;
      _os_log_impl(&dword_220C96000, v16, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingStateUpdate: accessory %@ (%@) does not exist!", buf, 0x16u);
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v32 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    id v32 = &_os_log_internal;
    id v33 = &_os_log_internal;
  }
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413826;
    uint64_t v47 = (uint64_t)v41;
    __int16 v48 = 2112;
    id v49 = v40;
    __int16 v50 = 1024;
    unsigned int v51 = a5;
    __int16 v52 = 1024;
    BOOL v53 = v37;
    __int16 v54 = 1024;
    int v55 = a7;
    __int16 v56 = 1024;
    BOOL v57 = v39;
    __int16 v58 = 2112;
    uint64_t v59 = v12;
    _os_log_impl(&dword_220C96000, v32, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingStateUpdate: EXIT, accessory %@, blePairingUUID %@, validMask=%x btRadioOn=%d pairingState=%d pairingModeOn=%d, accessory=%@", buf, 0x38u);
  }
}

- (void)accessoryBLEPairingInfoUpdate:(id)a3 blePairingUUID:(id)a4 pairType:(unsigned __int8)a5 pairInfoList:(id)a6
{
  uint64_t v7 = a5;
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v37 = a4;
  id v36 = a6;
  long long v38 = v10;
  uint64_t v11 = [(NSMutableDictionary *)self->_accessories objectForKey:v10];
  uint64_t v12 = (void *)v11;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects <= 0;
  }
  else {
    BOOL v13 = 1;
  }
  int v14 = !v13;
  if (v11)
  {
    if (v14)
    {
      uint64_t v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      uint64_t v15 = &_os_log_internal;
      id v17 = &_os_log_internal;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      uint64_t v44 = (uint64_t)v38;
      __int16 v45 = 2112;
      id v46 = v37;
      __int16 v47 = 1024;
      int v48 = v7;
      __int16 v49 = 2112;
      id v50 = v36;
      __int16 v51 = 2112;
      __int16 v52 = v12;
      _os_log_impl(&dword_220C96000, v15, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingInfoUpdate: accessory %@, blePairingUUID %@, pairType=%d pairInfoList=%@, accessory=%@", buf, 0x30u);
    }

    [(NSLock *)self->_delegateListLock lock];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v34 = self;
    id obj = [(NSMutableDictionary *)self->_delegateList allValues];
    uint64_t v18 = [obj countByEnumeratingWithState:&v39 objects:v55 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v40;
      long long v21 = &_os_log_internal;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v40 != v20) {
            objc_enumerationMutation(obj);
          }
          long long v23 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          long long v24 = [v23 delegate];
          BOOL v25 = [v23 provider];
          uint64_t v26 = gLogObjects;
          int v27 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v28 = gNumLogObjects < 1;
          }
          else {
            BOOL v28 = 1;
          }
          if (v28)
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v44 = v26;
              __int16 v45 = 1024;
              LODWORD(v46) = v27;
              _os_log_error_impl(&dword_220C96000, v21, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            BOOL v29 = v21;
            uint64_t v30 = v21;
          }
          else
          {
            uint64_t v30 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413570;
            uint64_t v44 = (uint64_t)v38;
            __int16 v45 = 2112;
            id v46 = v37;
            __int16 v47 = 1024;
            int v48 = v7;
            __int16 v49 = 2112;
            id v50 = v36;
            __int16 v51 = 2112;
            __int16 v52 = v24;
            __int16 v53 = 2112;
            __int16 v54 = v25;
            _os_log_impl(&dword_220C96000, v30, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingInfoUpdate: accessory %@, blePairingUUID %@, pairType=%d pairInfoList=%@, call delegate=%@, provider=%@", buf, 0x3Au);
          }

          [v24 blePairingInfoUpdate:v25 pairType:v7 pairInfoList:v36 accessory:v38 blePairingUUID:v37];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v39 objects:v55 count:16];
      }
      while (v19);
    }

    [(NSLock *)v34->_delegateListLock unlock];
  }
  else
  {
    if (v14)
    {
      int v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      int v16 = &_os_log_internal;
      id v31 = &_os_log_internal;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v44 = (uint64_t)v38;
      __int16 v45 = 2112;
      id v46 = 0;
      _os_log_impl(&dword_220C96000, v16, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingInfoUpdate: accessory %@ (%@) does not exist!", buf, 0x16u);
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v32 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    id v32 = &_os_log_internal;
    id v33 = &_os_log_internal;
  }
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    uint64_t v44 = (uint64_t)v38;
    __int16 v45 = 2112;
    id v46 = v37;
    __int16 v47 = 1024;
    int v48 = v7;
    __int16 v49 = 2112;
    id v50 = v36;
    __int16 v51 = 2112;
    __int16 v52 = v12;
    _os_log_impl(&dword_220C96000, v32, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingInfoUpdate: EXIT, accessory %@, blePairingUUID %@, pairType=%d pairInfoList=%@, accessory=%@", buf, 0x30u);
  }
}

- (void)accessoryBLEPairingDataUpdate:(id)a3 blePairingUUID:(id)a4 pairType:(unsigned __int8)a5 pairData:(id)a6
{
  uint64_t v7 = a5;
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v37 = a4;
  id v36 = a6;
  long long v38 = v10;
  uint64_t v11 = [(NSMutableDictionary *)self->_accessories objectForKey:v10];
  uint64_t v12 = (void *)v11;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects <= 0;
  }
  else {
    BOOL v13 = 1;
  }
  int v14 = !v13;
  if (v11)
  {
    if (v14)
    {
      uint64_t v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      uint64_t v15 = &_os_log_internal;
      id v17 = &_os_log_internal;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      uint64_t v44 = (uint64_t)v38;
      __int16 v45 = 2112;
      id v46 = v37;
      __int16 v47 = 1024;
      int v48 = v7;
      __int16 v49 = 2112;
      id v50 = v36;
      __int16 v51 = 2112;
      __int16 v52 = v12;
      _os_log_impl(&dword_220C96000, v15, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDataUpdate: accessory %@, blePairingUUID %@, pairType=%d pairData=%@, accessory=%@", buf, 0x30u);
    }

    [(NSLock *)self->_delegateListLock lock];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v34 = self;
    id obj = [(NSMutableDictionary *)self->_delegateList allValues];
    uint64_t v18 = [obj countByEnumeratingWithState:&v39 objects:v55 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v40;
      long long v21 = &_os_log_internal;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v40 != v20) {
            objc_enumerationMutation(obj);
          }
          long long v23 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          long long v24 = [v23 delegate];
          BOOL v25 = [v23 provider];
          uint64_t v26 = gLogObjects;
          int v27 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v28 = gNumLogObjects < 1;
          }
          else {
            BOOL v28 = 1;
          }
          if (v28)
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v44 = v26;
              __int16 v45 = 1024;
              LODWORD(v46) = v27;
              _os_log_error_impl(&dword_220C96000, v21, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            BOOL v29 = v21;
            uint64_t v30 = v21;
          }
          else
          {
            uint64_t v30 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413570;
            uint64_t v44 = (uint64_t)v38;
            __int16 v45 = 2112;
            id v46 = v37;
            __int16 v47 = 1024;
            int v48 = v7;
            __int16 v49 = 2112;
            id v50 = v36;
            __int16 v51 = 2112;
            __int16 v52 = v24;
            __int16 v53 = 2112;
            __int16 v54 = v25;
            _os_log_impl(&dword_220C96000, v30, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDataUpdate: accessory %@, blePairingUUID %@, pairType=%d pairData=%@, call delegate=%@, provider=%@", buf, 0x3Au);
          }

          [v24 blePairingDataUpdate:v25 pairType:v7 pairData:v36 accessory:v38 blePairingUUID:v37];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v39 objects:v55 count:16];
      }
      while (v19);
    }

    [(NSLock *)v34->_delegateListLock unlock];
  }
  else
  {
    if (v14)
    {
      int v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      int v16 = &_os_log_internal;
      id v31 = &_os_log_internal;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v44 = (uint64_t)v38;
      __int16 v45 = 2112;
      id v46 = 0;
      _os_log_impl(&dword_220C96000, v16, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDataUpdate: accessory %@ (%@) does not exist!", buf, 0x16u);
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v32 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    id v32 = &_os_log_internal;
    id v33 = &_os_log_internal;
  }
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    uint64_t v44 = (uint64_t)v38;
    __int16 v45 = 2112;
    id v46 = v37;
    __int16 v47 = 1024;
    int v48 = v7;
    __int16 v49 = 2112;
    id v50 = v36;
    __int16 v51 = 2112;
    __int16 v52 = v12;
    _os_log_impl(&dword_220C96000, v32, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDataUpdate: EXIT, accessory %@, blePairingUUID %@, pairType=%d pairData=%@, accessory=%@", buf, 0x30u);
  }
}

- (void)accessoryBLEPairingFinished:(id)a3 blePairingUUID:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v41 = a4;
  long long v42 = v6;
  uint64_t v7 = [(NSMutableDictionary *)self->_accessories objectForKey:v6];
  uint64_t v8 = (NSMutableDictionary *)v7;
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects <= 0;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = !v9;
  uint64_t v11 = &off_220C9F000;
  if (v7)
  {
    if (v10)
    {
      uint64_t v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      uint64_t v12 = &_os_log_internal;
      id v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v49 = (uint64_t)v42;
      __int16 v50 = 2112;
      id v51 = v41;
      __int16 v52 = 2112;
      __int16 v53 = v8;
      _os_log_impl(&dword_220C96000, v12, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingFinished: accessory %@, blePairingUUID %@, accessory=%@", buf, 0x20u);
    }

    [(NSLock *)self->_delegateListLock lock];
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      uint64_t v15 = &_os_log_internal;
      id v16 = &_os_log_internal;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      delegateList = self->_delegateList;
      *(_DWORD *)buf = 138412802;
      uint64_t v49 = (uint64_t)v42;
      __int16 v50 = 2112;
      id v51 = v41;
      __int16 v52 = 2112;
      __int16 v53 = delegateList;
      _os_log_impl(&dword_220C96000, v15, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingFinished: accessory %@, blePairingUUID %@, _delegateList=%@", buf, 0x20u);
    }

    long long v40 = v8;
    [(NSMutableDictionary *)v8 setBlePairingFinished:1];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v39 = self;
    uint64_t v18 = [(NSMutableDictionary *)self->_delegateList allValues];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v44;
      long long v22 = &_os_log_internal;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v44 != v21) {
            objc_enumerationMutation(v18);
          }
          long long v24 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          BOOL v25 = [v24 delegate];
          uint64_t v26 = [v24 provider];
          char v27 = objc_opt_respondsToSelector();
          uint64_t v28 = gLogObjects;
          int v29 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v30 = gNumLogObjects <= 0;
          }
          else {
            BOOL v30 = 1;
          }
          int v31 = !v30;
          if (v27)
          {
            if (v31)
            {
              id v32 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v49 = v28;
                __int16 v50 = 1024;
                LODWORD(v51) = v29;
                _os_log_error_impl(&dword_220C96000, v22, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              long long v34 = v22;
              id v32 = v22;
            }
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v49 = (uint64_t)v26;
              __int16 v50 = 2112;
              id v51 = v25;
              _os_log_impl(&dword_220C96000, v32, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingFinished: delegate respond to blePairing:pairingFinished:blePairingUUID:, provider =%@, delegate = %@", buf, 0x16u);
            }

            [v25 blePairing:v26 pairingFinished:v42 blePairingUUID:v41];
          }
          else
          {
            if (v31)
            {
              id v33 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v49 = v28;
                __int16 v50 = 1024;
                LODWORD(v51) = v29;
                _os_log_error_impl(&dword_220C96000, v22, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              long long v35 = v22;
              id v33 = v22;
            }
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v49 = (uint64_t)v26;
              __int16 v50 = 2112;
              id v51 = v25;
              _os_log_impl(&dword_220C96000, v33, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingFinished: delegate doesn't respond to blePairing:pairingFinished:blePairingUUID:, provider = %@, delegate = %@", buf, 0x16u);
            }
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v20);
    }

    [(NSLock *)v39->_delegateListLock unlock];
    uint64_t v8 = v40;
    uint64_t v11 = &off_220C9F000;
  }
  else
  {
    if (v10)
    {
      BOOL v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      BOOL v13 = &_os_log_internal;
      id v36 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v49 = (uint64_t)v42;
      __int16 v50 = 2112;
      id v51 = 0;
      _os_log_impl(&dword_220C96000, v13, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingFinished: accessory %@ (%@) does not exist!", buf, 0x16u);
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v37 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    id v37 = &_os_log_internal;
    id v38 = &_os_log_internal;
  }
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = *((void *)v11 + 121);
    uint64_t v49 = (uint64_t)v42;
    __int16 v50 = 2112;
    id v51 = v41;
    __int16 v52 = 2112;
    __int16 v53 = v8;
    _os_log_impl(&dword_220C96000, v37, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingFinished: EXIT, accessory %@, blePairingUUID %@, accessory=%@", buf, 0x20u);
  }
}

- (void)startBLEUpdates:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 bRadioUpdatesOn:(BOOL)a6 bPairInfoUpdatesOn:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v12 = a3;
  BOOL v13 = (NSString *)a4;
  if (gLogObjects) {
    BOOL v14 = gNumLogObjects < 1;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    id v16 = &_os_log_internal;
    id v15 = &_os_log_internal;
  }
  else
  {
    id v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138413314;
    id v22 = v12;
    __int16 v23 = 2112;
    long long v24 = v13;
    __int16 v25 = 1024;
    int v26 = a5;
    __int16 v27 = 1024;
    BOOL v28 = v8;
    __int16 v29 = 1024;
    BOOL v30 = v7;
    _os_log_impl(&dword_220C96000, v16, OS_LOG_TYPE_DEFAULT, "startBLEUpdates: %@, blePairingUUID %@, pairType=%d bRadioUpdatesOn=%d bPairInfoUpdatesOn=%d", (uint8_t *)&v21, 0x28u);
  }

  remoteObject = self->_remoteObject;
  if (remoteObject)
  {
    [(ACCBLEPairingXPCServerProtocol *)remoteObject startBLEUpdates:v12 blePairingUUID:v13 pairType:a5 bRadioUpdatesOn:v8 bPairInfoUpdatesOn:v7];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      uint64_t v18 = &_os_log_internal;
      id v19 = &_os_log_internal;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      int v21 = 138412546;
      id v22 = v12;
      __int16 v23 = 2112;
      long long v24 = providerUID;
      _os_log_impl(&dword_220C96000, v18, OS_LOG_TYPE_DEFAULT, "startBLEUpdates: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (void)deviceStateUpdate:(id)a3 blePairingUUID:(id)a4 bRadioOn:(BOOL)a5 pairState:(int)a6 bPairModeOn:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  BOOL v9 = a5;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v12 = a3;
  BOOL v13 = (NSString *)a4;
  if (gLogObjects) {
    BOOL v14 = gNumLogObjects < 1;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    id v16 = &_os_log_internal;
    id v15 = &_os_log_internal;
  }
  else
  {
    id v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138413314;
    id v22 = v12;
    __int16 v23 = 2112;
    long long v24 = v13;
    __int16 v25 = 1024;
    BOOL v26 = v9;
    __int16 v27 = 1024;
    int v28 = v8;
    __int16 v29 = 1024;
    BOOL v30 = v7;
    _os_log_impl(&dword_220C96000, v16, OS_LOG_TYPE_DEFAULT, "deviceStateUpdate: %@, blePairingUUID %@, bRadioOn=%d pairState=%d bPairModeOn=%d", (uint8_t *)&v21, 0x28u);
  }

  remoteObject = self->_remoteObject;
  if (remoteObject)
  {
    [(ACCBLEPairingXPCServerProtocol *)remoteObject deviceStateUpdate:v12 blePairingUUID:v13 bRadioOn:v9 pairState:v8 bPairModeOn:v7];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      uint64_t v18 = &_os_log_internal;
      id v19 = &_os_log_internal;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      int v21 = 138412546;
      id v22 = v12;
      __int16 v23 = 2112;
      long long v24 = providerUID;
      _os_log_impl(&dword_220C96000, v18, OS_LOG_TYPE_DEFAULT, "deviceStateUpdate: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (void)devicePairingData:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 pairData:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v11 = (NSString *)a4;
  id v12 = a6;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 1;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    id v15 = &_os_log_internal;
    id v14 = &_os_log_internal;
  }
  else
  {
    id v15 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138413058;
    id v21 = v10;
    __int16 v22 = 2112;
    __int16 v23 = v11;
    __int16 v24 = 1024;
    int v25 = a5;
    __int16 v26 = 2112;
    id v27 = v12;
    _os_log_impl(&dword_220C96000, v15, OS_LOG_TYPE_DEFAULT, "devicePairingData: %@, blePairingUUID %@, pairType=%d pairData=%@", (uint8_t *)&v20, 0x26u);
  }

  remoteObject = self->_remoteObject;
  if (remoteObject)
  {
    [(ACCBLEPairingXPCServerProtocol *)remoteObject devicePairingData:v10 blePairingUUID:v11 pairType:a5 pairData:v12];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      id v17 = &_os_log_internal;
      id v18 = &_os_log_internal;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      int v20 = 138412546;
      id v21 = v10;
      __int16 v22 = 2112;
      __int16 v23 = providerUID;
      _os_log_impl(&dword_220C96000, v17, OS_LOG_TYPE_DEFAULT, "devicePairingData: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v20, 0x16u);
    }
  }
}

- (void)deviceUpdatePairingInfo:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 pairInfo:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v11 = (NSString *)a4;
  id v12 = a6;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 1;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    id v15 = &_os_log_internal;
    id v14 = &_os_log_internal;
  }
  else
  {
    id v15 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138413058;
    id v21 = v10;
    __int16 v22 = 2112;
    __int16 v23 = v11;
    __int16 v24 = 1024;
    int v25 = a5;
    __int16 v26 = 2112;
    id v27 = v12;
    _os_log_impl(&dword_220C96000, v15, OS_LOG_TYPE_DEFAULT, "deviceUpdatePairingInfo: %@, blePairingUUID %@, pairType=%d pairInfo=%@", (uint8_t *)&v20, 0x26u);
  }

  remoteObject = self->_remoteObject;
  if (remoteObject)
  {
    [(ACCBLEPairingXPCServerProtocol *)remoteObject deviceUpdatePairingInfo:v10 blePairingUUID:v11 pairType:a5 pairInfo:v12];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      id v17 = &_os_log_internal;
      id v18 = &_os_log_internal;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      int v20 = 138412546;
      id v21 = v10;
      __int16 v22 = 2112;
      __int16 v23 = providerUID;
      _os_log_impl(&dword_220C96000, v17, OS_LOG_TYPE_DEFAULT, "deviceUpdatePairingInfo: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v20, 0x16u);
    }
  }
}

- (void)stopBLEUpdates:(id)a3 blePairingUUID:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = (NSString *)a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    id v10 = &_os_log_internal;
    id v9 = &_os_log_internal;
  }
  else
  {
    id v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_220C96000, v10, OS_LOG_TYPE_DEFAULT, "stopBLEUpdates: %@, blePairingUUID %@", (uint8_t *)&v15, 0x16u);
  }

  remoteObject = self->_remoteObject;
  if (remoteObject)
  {
    [(ACCBLEPairingXPCServerProtocol *)remoteObject stopBLEUpdates:v6 blePairingUUID:v7];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      id v12 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = providerUID;
      _os_log_impl(&dword_220C96000, v12, OS_LOG_TYPE_DEFAULT, "stopBLEUpdates: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (int)lastScorpiusDetectType
{
  return self->_lastScorpiusDetectType;
}

- (void)setLastScorpiusDetectType:(int)a3
{
  self->_lastScorpiusDetectType = a3;
}

- (NSMutableDictionary)delegateList
{
  return self->_delegateList;
}

- (void)setDelegateList:(id)a3
{
}

- (NSLock)delegateListLock
{
  return self->_delegateListLock;
}

- (void)setDelegateListLock:(id)a3
{
}

- (NSString)providerUID
{
  return self->_providerUID;
}

- (void)setProviderUID:(id)a3
{
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
}

- (ACCBLEPairingXPCServerProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (NSMutableDictionary)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
}

- (int)accDetectToken
{
  return self->_accDetectToken;
}

- (void)setAccDetectToken:(int)a3
{
  self->_accDetectToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_providerUID, 0);
  objc_storeStrong((id *)&self->_delegateListLock, 0);
  objc_storeStrong((id *)&self->_delegateList, 0);
}

@end