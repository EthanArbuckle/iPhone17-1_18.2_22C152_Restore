@interface ACCBLEPairingServerRemote
- (ACCBLEPairingServerRemote)initWithXPCConnection:(id)a3;
- (NSXPCConnection)XPCConnection;
- (void)dealloc;
- (void)devicePairingData:(id)a3 blePairingUUID:(id)a4 pairType:(unsigned __int8)a5 pairData:(id)a6;
- (void)deviceStateUpdate:(id)a3 blePairingUUID:(id)a4 bRadioOn:(BOOL)a5 pairState:(int)a6 bPairModeOn:(BOOL)a7;
- (void)deviceUpdatePairingInfo:(id)a3 blePairingUUID:(id)a4 pairType:(unsigned __int8)a5 pairInfo:(id)a6;
- (void)initConnection:(id)a3;
- (void)startBLEUpdates:(id)a3 blePairingUUID:(id)a4 pairType:(unsigned __int8)a5 bRadioUpdatesOn:(BOOL)a6 bPairInfoUpdatesOn:(BOOL)a7;
- (void)stopBLEUpdates:(id)a3 blePairingUUID:(id)a4;
@end

@implementation ACCBLEPairingServerRemote

- (ACCBLEPairingServerRemote)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 5;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v8 = &_os_log_default;
    id v7 = &_os_log_default;
  }
  else
  {
    v8 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v14 = [v5 hash];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "initWithXPCConnection: XPCConnection=%lu", buf, 0xCu);
  }

  v12.receiver = self;
  v12.super_class = (Class)ACCBLEPairingServerRemote;
  v9 = [(ACCBLEPairingServerRemote *)&v12 init];
  v10 = v9;
  if (v9)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v9->_XPCConnection, a3);
    }
    else
    {

      v10 = 0;
    }
  }

  return v10;
}

- (void)dealloc
{
  XPCConnection = self->_XPCConnection;
  self->_XPCConnection = 0;

  v4.receiver = self;
  v4.super_class = (Class)ACCBLEPairingServerRemote;
  [(ACCBLEPairingServerRemote *)&v4 dealloc];
}

- (void)initConnection:(id)a3
{
  objc_super v4 = (void (**)(id, BOOL))a3;
  id v5 = +[ACCBLEPairingServer sharedServer];
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = [(ACCBLEPairingServerRemote *)self XPCConnection];
    BOOL v7 = [v5 performSelector:"shouldAcceptXPCConnection:" withObject:v6] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 5;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    v10 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client has called initConnection method!", (uint8_t *)v14, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 5)
  {
    v11 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v11 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", (uint8_t *)v14, 8u);
  }

  if (v7)
  {
    v13 = +[ACCBLEPairingServer sharedServer];
    [v13 sendUpdatedSubscriberList];
  }
  v4[2](v4, v7);
}

- (void)startBLEUpdates:(id)a3 blePairingUUID:(id)a4 pairType:(unsigned __int8)a5 bRadioUpdatesOn:(BOOL)a6 bPairInfoUpdatesOn:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  int v9 = a5;
  id v12 = a3;
  id v13 = a4;
  if (gLogObjects) {
    BOOL v14 = gNumLogObjects < 5;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v16 = &_os_log_default;
    id v15 = &_os_log_default;
  }
  else
  {
    v16 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138413314;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 1024;
    int v27 = v9;
    __int16 v28 = 1024;
    BOOL v29 = v8;
    __int16 v30 = 1024;
    BOOL v31 = v7;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "BLEPairing startBLEUpdates: accessoryUID %@, blePairingUUID=%@, pairType=%d bRadioUpdatesOn=%d bPairInfoUpdatesOn=%d", (uint8_t *)&v22, 0x28u);
  }

  v17 = +[ACCBLEPairingServer sharedServer];
  unsigned int v18 = [v17 reserveAccessory:v12 xpcConn:self->_XPCConnection];

  if (v18)
  {
    platform_blePairing_startBLEUpdatesHandler(v12, v13, v9, v8, v7);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      v19 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v19 = &_os_log_default;
      id v20 = &_os_log_default;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [(NSXPCConnection *)self->_XPCConnection hash];
      int v22 = 138412546;
      id v23 = v12;
      __int16 v24 = 2048;
      id v25 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "BLEPairing startBLEUpdates: accessoryUID %@, NOT RESERVED connHash %lu", (uint8_t *)&v22, 0x16u);
    }
  }
}

- (void)deviceStateUpdate:(id)a3 blePairingUUID:(id)a4 bRadioOn:(BOOL)a5 pairState:(int)a6 bPairModeOn:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  if (gLogObjects) {
    BOOL v14 = gNumLogObjects < 5;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v16 = &_os_log_default;
    id v15 = &_os_log_default;
  }
  else
  {
    v16 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138413314;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 1024;
    BOOL v27 = v9;
    __int16 v28 = 1024;
    int v29 = a6;
    __int16 v30 = 1024;
    BOOL v31 = v7;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "BLEPairing deviceStateUpdate: accessoryUID %@, blePairingUUID=%@, bRadioOn=%d pairState=%d bPairModeOn=%d", (uint8_t *)&v22, 0x28u);
  }

  v17 = +[ACCBLEPairingServer sharedServer];
  unsigned int v18 = [v17 accessoryReserved:v12 xpcConn:self->_XPCConnection];

  if (v18)
  {
    platform_blePairing_deviceStateUpdateHandler(v12, v13, v9, a6, v7);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      v19 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v19 = &_os_log_default;
      id v20 = &_os_log_default;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [(NSXPCConnection *)self->_XPCConnection hash];
      int v22 = 138412546;
      id v23 = v12;
      __int16 v24 = 2048;
      id v25 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "BLEPairing deviceStateUpdate: accessoryUID %@, NOT RESERVED connHash %lu", (uint8_t *)&v22, 0x16u);
    }
  }
}

- (void)devicePairingData:(id)a3 blePairingUUID:(id)a4 pairType:(unsigned __int8)a5 pairData:(id)a6
{
  int v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 5;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v15 = &_os_log_default;
    id v14 = &_os_log_default;
  }
  else
  {
    id v15 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138413058;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    __int16 v25 = 1024;
    int v26 = v7;
    __int16 v27 = 2112;
    id v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "BLEPairing devicePairingData: accessoryUID %@, blePairingUUID=%@, pairType=%d pairData=%@", (uint8_t *)&v21, 0x26u);
  }

  v16 = +[ACCBLEPairingServer sharedServer];
  unsigned int v17 = [v16 accessoryReserved:v10 xpcConn:self->_XPCConnection];

  if (v17)
  {
    platform_blePairing_devicePairingDataHandler(v10, v11, v7, v12);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      unsigned int v18 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      unsigned int v18 = &_os_log_default;
      id v19 = &_os_log_default;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [(NSXPCConnection *)self->_XPCConnection hash];
      int v21 = 138412546;
      id v22 = v10;
      __int16 v23 = 2048;
      id v24 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "BLEPairing devicePairingData: accessoryUID %@, NOT RESERVED connHash %lu", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (void)deviceUpdatePairingInfo:(id)a3 blePairingUUID:(id)a4 pairType:(unsigned __int8)a5 pairInfo:(id)a6
{
  int v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 5;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v15 = &_os_log_default;
    id v14 = &_os_log_default;
  }
  else
  {
    id v15 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138413058;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    __int16 v25 = 1024;
    int v26 = v7;
    __int16 v27 = 2112;
    id v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "BLEPairing deviceUpdatePairingInfo: accessoryUID %@, blePairingUUID=%@, pairType=%d pairInfo=%@", (uint8_t *)&v21, 0x26u);
  }

  v16 = +[ACCBLEPairingServer sharedServer];
  unsigned int v17 = [v16 accessoryReserved:v10 xpcConn:self->_XPCConnection];

  if (v17)
  {
    platform_blePairing_deviceUpdatePairingInfoHandler(v10, v11, v7, v12);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      unsigned int v18 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      unsigned int v18 = &_os_log_default;
      id v19 = &_os_log_default;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [(NSXPCConnection *)self->_XPCConnection hash];
      int v21 = 138412546;
      id v22 = v10;
      __int16 v23 = 2048;
      id v24 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "BLEPairing deviceUpdatePairingInfo: accessoryUID %@, NOT RESERVED connHash %lu", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (void)stopBLEUpdates:(id)a3 blePairingUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 5;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BLEPairing stopBLEUpdate: accessoryUID %@, blePairingUUID=%@", (uint8_t *)&v16, 0x16u);
  }

  id v11 = +[ACCBLEPairingServer sharedServer];
  unsigned int v12 = [v11 accessoryReserved:v6 xpcConn:self->_XPCConnection];

  if (v12)
  {
    platform_blePairing_stopBLEUpdatesHandler(v6, v7);
    BOOL v13 = +[ACCBLEPairingServer sharedServer];
    [v13 releaseAccessory:v6 xpcConn:self->_XPCConnection];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      BOOL v13 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v13 = &_os_log_default;
      id v14 = &_os_log_default;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(NSXPCConnection *)self->_XPCConnection hash];
      int v16 = 138412546;
      id v17 = v6;
      __int16 v18 = 2048;
      id v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "BLEPairing stopBLEUpdate: accessoryUID %@, NOT RESERVED connHash %lu", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (NSXPCConnection)XPCConnection
{
  return self->_XPCConnection;
}

- (void).cxx_destruct
{
}

@end