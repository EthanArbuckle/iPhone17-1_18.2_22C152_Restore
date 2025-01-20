@interface ACCBLEPairingProvider
- (ACCBLEPairingProvider)initWithDelegate:(id)a3;
- (ACCBLEPairingProviderProtocol)delegate;
- (NSString)delegateUUID;
- (int)lastScorpiusDetectType;
- (void)dealloc;
- (void)devicePairingData:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 pairData:(id)a6;
- (void)deviceStateUpdate:(id)a3 blePairingUUID:(id)a4 bRadioOn:(BOOL)a5 pairState:(int)a6 bPairModeOn:(BOOL)a7;
- (void)deviceUpdatePairingInfo:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 pairInfo:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setDelegateUUID:(id)a3;
- (void)setLastScorpiusDetectType:(int)a3;
- (void)startBLEUpdates:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 bRadioUpdatesOn:(BOOL)a6 bPairInfoUpdatesOn:(BOOL)a7;
- (void)stopBLEUpdates:(id)a3 blePairingUUID:(id)a4;
@end

@implementation ACCBLEPairingProvider

- (ACCBLEPairingProvider)initWithDelegate:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  init_logging();
  v15.receiver = self;
  v15.super_class = (Class)ACCBLEPairingProvider;
  v5 = [(ACCBLEPairingProvider *)&v15 init];
  if (v5)
  {
    v6 = +[ACCBLEPairingProviderInternal SharedInstance];
    v7 = [MEMORY[0x263F08C38] UUID];
    uint64_t v8 = [v7 UUIDString];
    delegateUUID = v5->_delegateUUID;
    v5->_delegateUUID = (NSString *)v8;

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      v10 = &_os_log_internal;
      id v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v5->_delegateUUID;
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_impl(&dword_220C96000, v10, OS_LOG_TYPE_DEFAULT, "ACCBLEPairingProvider init, %@", buf, 0xCu);
    }

    id v13 = objc_storeWeak((id *)&v5->_delegate, v4);
    [v6 registerDelegate:v4 provider:v5 forUUID:v5->_delegateUUID];
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = +[ACCBLEPairingProviderInternal SharedInstance];
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
    delegateUUID = self->_delegateUUID;
    *(_DWORD *)buf = 138412290;
    v10 = delegateUUID;
    _os_log_impl(&dword_220C96000, v6, OS_LOG_TYPE_DEFAULT, "ACCBLEPairingProvider dealloc, %@", buf, 0xCu);
  }

  [v3 unregisterDelegateForUUID:self->_delegateUUID];
  objc_storeWeak((id *)&self->_delegate, 0);

  v8.receiver = self;
  v8.super_class = (Class)ACCBLEPairingProvider;
  [(ACCBLEPairingProvider *)&v8 dealloc];
}

- (int)lastScorpiusDetectType
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = +[ACCBLEPairingProviderInternal SharedInstance];
  int v3 = [v2 lastScorpiusDetectType];

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
    int v8 = 136315650;
    v9 = "-[ACCBLEPairingProvider lastScorpiusDetectType]";
    __int16 v10 = 1024;
    int v11 = 1025;
    __int16 v12 = 1024;
    int v13 = v3;
    _os_log_impl(&dword_220C96000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d result %d ", (uint8_t *)&v8, 0x18u);
  }

  return v3;
}

- (void)setLastScorpiusDetectType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v4 = +[ACCBLEPairingProviderInternal SharedInstance];
  int v5 = [v4 lastScorpiusDetectType];

  v6 = +[ACCBLEPairingProviderInternal SharedInstance];
  [v6 setLastScorpiusDetectType:v3];

  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    v9 = &_os_log_internal;
    id v8 = &_os_log_internal;
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315906;
    int v11 = "-[ACCBLEPairingProvider setLastScorpiusDetectType:]";
    __int16 v12 = 1024;
    int v13 = 1033;
    __int16 v14 = 1024;
    int v15 = v5;
    __int16 v16 = 1024;
    int v17 = v3;
    _os_log_impl(&dword_220C96000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d  %d -> %d ", (uint8_t *)&v10, 0x1Eu);
  }
}

- (void)startBLEUpdates:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 bRadioUpdatesOn:(BOOL)a6 bPairInfoUpdatesOn:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  __int16 v14 = +[ACCBLEPairingProviderInternal SharedInstance];
  if (gLogObjects) {
    BOOL v15 = gNumLogObjects < 1;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    int v17 = &_os_log_internal;
    id v16 = &_os_log_internal;
  }
  else
  {
    int v17 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    delegateUUID = self->_delegateUUID;
    int v19 = 136316674;
    v20 = "-[ACCBLEPairingProvider startBLEUpdates:blePairingUUID:pairType:bRadioUpdatesOn:bPairInfoUpdatesOn:]";
    __int16 v21 = 2112;
    v22 = delegateUUID;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 1024;
    int v28 = v9;
    __int16 v29 = 1024;
    BOOL v30 = v8;
    __int16 v31 = 1024;
    BOOL v32 = v7;
    _os_log_impl(&dword_220C96000, v17, OS_LOG_TYPE_DEFAULT, "%s: delegateUUID %@, startBLEUpdates: %@, blePairingUUID %@, pairType=%d bRadioUpdatesOn=%d bPairInfoUpdatesOn=%d", (uint8_t *)&v19, 0x3Cu);
  }

  [v14 startBLEUpdates:v12 blePairingUUID:v13 pairType:v9 bRadioUpdatesOn:v8 bPairInfoUpdatesOn:v7];
}

- (void)deviceStateUpdate:(id)a3 blePairingUUID:(id)a4 bRadioOn:(BOOL)a5 pairState:(int)a6 bPairModeOn:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  BOOL v9 = a5;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  __int16 v14 = +[ACCBLEPairingProviderInternal SharedInstance];
  if (gLogObjects) {
    BOOL v15 = gNumLogObjects < 1;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    int v17 = &_os_log_internal;
    id v16 = &_os_log_internal;
  }
  else
  {
    int v17 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    delegateUUID = self->_delegateUUID;
    int v19 = 136316674;
    v20 = "-[ACCBLEPairingProvider deviceStateUpdate:blePairingUUID:bRadioOn:pairState:bPairModeOn:]";
    __int16 v21 = 2112;
    v22 = delegateUUID;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 1024;
    BOOL v28 = v9;
    __int16 v29 = 1024;
    int v30 = v8;
    __int16 v31 = 1024;
    BOOL v32 = v7;
    _os_log_impl(&dword_220C96000, v17, OS_LOG_TYPE_DEFAULT, "%s: delegateUUID %@, deviceStateUpdate: %@, blePairingUUID %@, bRadioOn=%d pairState=%d bPairModeOn=%d", (uint8_t *)&v19, 0x3Cu);
  }

  [v14 deviceStateUpdate:v12 blePairingUUID:v13 bRadioOn:v9 pairState:v8 bPairModeOn:v7];
}

- (void)devicePairingData:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 pairData:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = +[ACCBLEPairingProviderInternal SharedInstance];
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
    delegateUUID = self->_delegateUUID;
    int v18 = 136316418;
    int v19 = "-[ACCBLEPairingProvider devicePairingData:blePairingUUID:pairType:pairData:]";
    __int16 v20 = 2112;
    __int16 v21 = delegateUUID;
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 1024;
    int v27 = v7;
    __int16 v28 = 2112;
    id v29 = v12;
    _os_log_impl(&dword_220C96000, v16, OS_LOG_TYPE_DEFAULT, "%s: delegateUUID %@, devicePairingData: %@, blePairingUUID %@, pairType=%d pairData=%@", (uint8_t *)&v18, 0x3Au);
  }

  [v13 devicePairingData:v10 blePairingUUID:v11 pairType:v7 pairData:v12];
}

- (void)deviceUpdatePairingInfo:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 pairInfo:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = +[ACCBLEPairingProviderInternal SharedInstance];
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
    delegateUUID = self->_delegateUUID;
    int v18 = 136316418;
    int v19 = "-[ACCBLEPairingProvider deviceUpdatePairingInfo:blePairingUUID:pairType:pairInfo:]";
    __int16 v20 = 2112;
    __int16 v21 = delegateUUID;
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 1024;
    int v27 = v7;
    __int16 v28 = 2112;
    id v29 = v12;
    _os_log_impl(&dword_220C96000, v16, OS_LOG_TYPE_DEFAULT, "%s: delegateUUID %@, deviceUpdatePairingInfo: %@, blePairingUUID %@, pairType=%d pairInfo=%@", (uint8_t *)&v18, 0x3Au);
  }

  [v13 deviceUpdatePairingInfo:v10 blePairingUUID:v11 pairType:v7 pairInfo:v12];
}

- (void)stopBLEUpdates:(id)a3 blePairingUUID:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[ACCBLEPairingProviderInternal SharedInstance];
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 1;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
    }
    id v11 = &_os_log_internal;
    id v10 = &_os_log_internal;
  }
  else
  {
    id v11 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    delegateUUID = self->_delegateUUID;
    int v13 = 136315906;
    BOOL v14 = "-[ACCBLEPairingProvider stopBLEUpdates:blePairingUUID:]";
    __int16 v15 = 2112;
    id v16 = delegateUUID;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_220C96000, v11, OS_LOG_TYPE_DEFAULT, "%s: delegateUUID %@, stopBLEUpdates: %@, blePairingUUID %@", (uint8_t *)&v13, 0x2Au);
  }

  [v8 stopBLEUpdates:v6 blePairingUUID:v7];
}

- (ACCBLEPairingProviderProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACCBLEPairingProviderProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)delegateUUID
{
  return self->_delegateUUID;
}

- (void)setDelegateUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end