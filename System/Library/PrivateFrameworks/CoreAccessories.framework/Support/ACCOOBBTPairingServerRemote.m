@interface ACCOOBBTPairingServerRemote
- (ACCOOBBTPairingServerRemote)initWithXPCConnection:(id)a3;
- (NSXPCConnection)XPCConnection;
- (void)dealloc;
- (void)initConnection:(id)a3;
- (void)linkKeyInfo:(id)a3 oobBtPairingUID:(id)a4 linkKey:(id)a5 deviceMacAddr:(id)a6;
- (void)notifyOfProvider:(id)a3;
- (void)requestLegacyConnectionIDForAccessoryUID:(id)a3;
- (void)startOOBBTPairing:(id)a3;
- (void)stopOOBBTPairing:(id)a3;
@end

@implementation ACCOOBBTPairingServerRemote

- (ACCOOBBTPairingServerRemote)initWithXPCConnection:(id)a3
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
  v12.super_class = (Class)ACCOOBBTPairingServerRemote;
  v9 = [(ACCOOBBTPairingServerRemote *)&v12 init];
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
  v4.super_class = (Class)ACCOOBBTPairingServerRemote;
  [(ACCOOBBTPairingServerRemote *)&v4 dealloc];
}

- (void)initConnection:(id)a3
{
  objc_super v4 = (void (**)(id, BOOL))a3;
  id v5 = +[ACCOOBBTPairingServer sharedServer];
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = [(ACCOOBBTPairingServerRemote *)self XPCConnection];
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
    v13 = +[ACCOOBBTPairingServer sharedServer];
    [v13 sendUpdatedSubscriberList];
  }
  v4[2](v4, v7);
}

- (void)notifyOfProvider:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 5;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    BOOL v7 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCOOBBTPairingServerRemote notifyOfProvider:]((uint64_t)v4, v7);
  }

  BOOL v8 = +[ACCOOBBTPairingServer sharedServer];
  id v9 = [(ACCOOBBTPairingServerRemote *)self XPCConnection];
  [v8 notifyOfProvider:v4 connection:v9];
}

- (void)startOOBBTPairing:(id)a3
{
  id v3 = a3;
  BOOL isSupported = platform_oobBtPairing2_isSupported((uint64_t)v3);
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects <= 4;
  }
  else {
    BOOL v5 = 1;
  }
  int v6 = !v5;
  if (isSupported)
  {
    if (v6)
    {
      BOOL v7 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v7 = &_os_log_default;
      id v9 = &_os_log_default;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "OOBBTPairing2 startOOBBTPairing: accessoryUID %@, oobBtPairing2", (uint8_t *)&v11, 0xCu);
    }

    platform_oobBtPairing2_startOobBtPairingHandler(v3);
  }
  else
  {
    if (v6)
    {
      BOOL v8 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v8 = &_os_log_default;
      id v10 = &_os_log_default;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "OOBBTPairing startOOBBTPairing: accessoryUID %@, oobBtPairing", (uint8_t *)&v11, 0xCu);
    }

    platform_oobBtPairing_startOobBtPairingHandler(v3);
  }
}

- (void)stopOOBBTPairing:(id)a3
{
  id v3 = a3;
  BOOL isSupported = platform_oobBtPairing2_isSupported((uint64_t)v3);
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects <= 4;
  }
  else {
    BOOL v5 = 1;
  }
  int v6 = !v5;
  if (isSupported)
  {
    if (v6)
    {
      BOOL v7 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v7 = &_os_log_default;
      id v9 = &_os_log_default;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "OOBBTPairing2 stopOOBBTPairing: accessoryUID %@, oobBtPairing2", (uint8_t *)&v11, 0xCu);
    }

    platform_oobBtPairing2_stopOobBtPairingHandler(v3);
  }
  else
  {
    if (v6)
    {
      BOOL v8 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v8 = &_os_log_default;
      id v10 = &_os_log_default;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "OOBBTPairing stopOOBBTPairing: accessoryUID %@, oobBtPairing", (uint8_t *)&v11, 0xCu);
    }

    platform_oobBtPairing_stopOobBtPairingHandler(v3);
  }
}

- (void)linkKeyInfo:(id)a3 oobBtPairingUID:(id)a4 linkKey:(id)a5 deviceMacAddr:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
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
    v15 = &_os_log_default;
    id v14 = &_os_log_default;
  }
  else
  {
    v15 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v18 = 138413058;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "OOBBTPairing linkKeyInfo: accessoryUID %@, oobBtPairingUID=%@, deviceMacAddr=%@ linkKey=%@", (uint8_t *)&v18, 0x2Au);
  }

  if (platform_oobBtPairing2_isSupported((uint64_t)v9))
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      v16 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v16 = &_os_log_default;
      id v17 = &_os_log_default;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "OOBBTPairing linkKeyInfo: accessoryUID %@, oobBtPairing2, not supported", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    platform_oobBtPairing_linkKeyInfoHandler(v9, v10, v11, v12);
  }
}

- (void)requestLegacyConnectionIDForAccessoryUID:(id)a3
{
}

- (NSXPCConnection)XPCConnection
{
  return self->_XPCConnection;
}

- (void).cxx_destruct
{
}

- (void)notifyOfProvider:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "OOBBTPairing serverRemote, notifyOfProvider: %@", (uint8_t *)&v2, 0xCu);
}

@end