@interface ACCConnectionInfoServerRemote
- (ACCConnectionInfoClientInfo)clientInfo;
- (ACCConnectionInfoServerRemote)initWithClientInfo:(id)a3;
- (BOOL)_checkClientEntitlements:(unint64_t)a3;
- (NSLock)remoteConnectionInfoServerLock;
- (NSMutableSet)interceptEnabled;
- (id)getFilterForClient:(id)a3;
- (void)accessoryEndpointsForConnection:(id)a3 withReply:(id)a4;
- (void)accessoryInfoForConnection:(id)a3 withReply:(id)a4;
- (void)accessoryInfoForEndpoint:(id)a3 connection:(id)a4 withReply:(id)a5;
- (void)accessoryProperty:(id)a3 forConnection:(id)a4 withReply:(id)a5;
- (void)accessoryProperty:(id)a3 forEndpoint:(id)a4 connection:(id)a5 withReply:(id)a6;
- (void)beginUserKeyErase:(id)a3 withReply:(id)a4;
- (void)beginVendorKeyErase:(id)a3 withReply:(id)a4;
- (void)cancelUserKeyErase:(id)a3 withReply:(id)a4;
- (void)cancelVendorKeyErase:(id)a3 withReply:(id)a4;
- (void)configStreamCategoriesRequest:(id)a3 connection:(id)a4;
- (void)configStreamPropertyRequest:(unsigned __int8)a3 forCategory:(unsigned __int16)a4 forEndpoint:(id)a5 connection:(id)a6;
- (void)configStreamPropertySetValue:(id)a3 forProperty:(unsigned __int8)a4 forCategory:(unsigned __int16)a5 forEndpoint:(id)a6 connection:(id)a7;
- (void)continueUserKeyErase:(id)a3 withSignature:(id)a4 andAccessoryNonce:(id)a5 forEndpoint:(id)a6 withReply:(id)a7;
- (void)continueVendorKeyErase:(id)a3 withSignature:(id)a4 andAccessoryNonce:(id)a5 forEndpoint:(id)a6 withReply:(id)a7;
- (void)copyLocalizedAccessoryName:(id)a3 withReply:(id)a4;
- (void)copyUserPrivateKey:(id)a3 withReply:(id)a4;
- (void)getAccessoryUserName:(id)a3 withReply:(id)a4;
- (void)getInterceptCountForEndpoint:(id)a3 connection:(id)a4 withReply:(id)a5;
- (void)getPairingStatus:(id)a3 withReply:(id)a4;
- (void)getPrivateNVMKeyValues:(id)a3 forEndpoint:(id)a4 withReply:(id)a5;
- (void)getPublicNVMKeyValues:(id)a3 forEndpoint:(id)a4 withReply:(id)a5;
- (void)initConnection:(id)a3;
- (void)interceptIncomingNTimes:(int)a3 forEndpoint:(id)a4 connection:(id)a5;
- (void)notifyOfClient:(id)a3 bundleID:(id)a4 withFilter:(id)a5;
- (void)notifyOfClient:(id)a3 bundleID:(id)a4 withFilter:(id)a5 forIdentifier:(id)a6;
- (void)provisionAccessoryForFindMy:(id)a3 withReply:(id)a4;
- (void)resetPairingInformation:(id)a3 withReply:(id)a4;
- (void)sendData:(id)a3 forEndpoint:(id)a4 connection:(id)a5;
- (void)setAccessoryUserName:(id)a3 forEndpoint:(id)a4 withReply:(id)a5;
- (void)setClientInfo:(id)a3;
- (void)setInterceptEnabled:(id)a3;
- (void)setPrivateNVMKeyValues:(id)a3 forEndpoint:(id)a4 withReply:(id)a5;
- (void)setPublicNVMKeyValues:(id)a3 forEndpoint:(id)a4 withReply:(id)a5;
@end

@implementation ACCConnectionInfoServerRemote

- (ACCConnectionInfoServerRemote)initWithClientInfo:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ACCConnectionInfoServerRemote;
  v5 = [(ACCConnectionInfoServerRemote *)&v12 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      objc_storeWeak((id *)&v5->_clientInfo, v4);
      v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      interceptEnabled = v6->_interceptEnabled;
      v6->_interceptEnabled = v7;

      v9 = (NSLock *)objc_alloc_init((Class)NSLock);
      remoteConnectionInfoServerLock = v6->_remoteConnectionInfoServerLock;
      v6->_remoteConnectionInfoServerLock = v9;
    }
    else
    {
      remoteConnectionInfoServerLock = v5;
      v6 = 0;
    }
  }
  return v6;
}

- (void)initConnection:(id)a3
{
  id v4 = (void (**)(id, BOOL))a3;
  v5 = +[ACCConnectionInfoServer sharedServer];
  if (objc_opt_respondsToSelector())
  {
    v6 = [(ACCConnectionInfoServerRemote *)self clientInfo];
    BOOL v7 = [v5 performSelector:"shouldAcceptXPCConnection:" withObject:v6] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 9;
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
    v10 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ConnectionInfo provider has called initConnectionToServer method!", (uint8_t *)v13, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 9)
  {
    v11 = *(id *)(gLogObjects + 64);
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
    v13[0] = 67109120;
    v13[1] = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", (uint8_t *)v13, 8u);
  }

  v4[2](v4, v7);
}

- (void)notifyOfClient:(id)a3 bundleID:(id)a4 withFilter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 9;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v13 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  else
  {
    v13 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412802;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ConnectionInfo client %@ (%@) registering withFilter %@", (uint8_t *)&v16, 0x20u);
  }

  v14 = +[ACCConnectionInfoServer sharedServer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientInfo);
  [v14 notifyOfClient:v8 bundleID:v9 forClient:WeakRetained withFilter:v10];
}

- (void)notifyOfClient:(id)a3 bundleID:(id)a4 withFilter:(id)a5 forIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (gLogObjects) {
    BOOL v14 = gNumLogObjects < 9;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    int v16 = &_os_log_default;
    id v15 = &_os_log_default;
  }
  else
  {
    int v16 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412802;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "ConnectionInfo client %@ (%@) registering withFilter %@", (uint8_t *)&v19, 0x20u);
  }

  id v17 = +[ACCConnectionInfoServer sharedServer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientInfo);
  [v17 notifyOfClient:v10 bundleID:v11 forClient:WeakRetained withFilter:v12 forIdentifier:v13];
}

- (id)getFilterForClient:(id)a3
{
  id v3 = a3;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 9;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    v6 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[ACCConnectionInfoServerRemote getFilterForClient:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  return 0;
}

- (void)accessoryEndpointsForConnection:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, id, CFSetRef))a4;
  CFSetRef v7 = platform_connectionInfo_accessoryEndpoints(v5);
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 9;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    uint64_t v10 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ACCConnectionInfoServerRemote accessoryEndpointsForConnection:withReply:]();
  }

  v6[2](v6, v5, v7);
}

- (void)accessoryInfoForConnection:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, id, int64x2_t *))a4;
  CFSetRef v7 = platform_connectionInfo_accessoryInfoForConnection(v5);
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 9;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    uint64_t v10 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ACCConnectionInfoServerRemote accessoryInfoForConnection:withReply:]();
  }

  v6[2](v6, v5, v7);
}

- (void)accessoryInfoForEndpoint:(id)a3 connection:(id)a4 withReply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id, id, int64x2_t *))a5;
  uint64_t v10 = platform_connectionInfo_accessoryInfoForEndpoint((uint64_t)v8, v7);
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 9;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v13 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  else
  {
    uint64_t v13 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412802;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    int v19 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "ConnectionInfo accessoryInfoForEndpoint: %@ - %@, send reply accInfo %@", (uint8_t *)&v14, 0x20u);
  }

  v9[2](v9, v7, v8, v10);
}

- (void)accessoryProperty:(id)a3 forConnection:(id)a4 withReply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id, id, void *))a5;
  uint64_t v10 = (void *)platform_connectionInfo_accessoryPropertyForConnection(v8, v7);
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 9;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v13 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  else
  {
    uint64_t v13 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412802;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    int v19 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "ConnectionInfo accessoryProperty: %@ forConnection: %@, send reply value %@", (uint8_t *)&v14, 0x20u);
  }

  v9[2](v9, v8, v7, v10);
}

- (void)accessoryProperty:(id)a3 forEndpoint:(id)a4 connection:(id)a5 withReply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, id, id, id, unsigned char *))a6;
  uint64_t v13 = platform_connectionInfo_accessoryPropertyForEndpoint((uint64_t)v11, v10, v9);
  if (gLogObjects) {
    BOOL v14 = gNumLogObjects < 9;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    __int16 v16 = &_os_log_default;
    id v15 = &_os_log_default;
  }
  else
  {
    __int16 v16 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138413058;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "ConnectionInfo accessoryProperty: %@ forEndpoint: %@ connection: %@, send reply value %@", (uint8_t *)&v17, 0x2Au);
  }

  v12[2](v12, v10, v11, v9, v13);
}

- (void)configStreamCategoriesRequest:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ACCConnectionInfoServer sharedServer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientInfo);
  id v10 = [v8 getClientUID:WeakRetained];

  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 9;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v13 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  else
  {
    uint64_t v13 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412802;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    __int16 v19 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "ConnectionInfo configStreamCategoriesRequest: %@ connection: %@ client: %@", (uint8_t *)&v14, 0x20u);
  }

  platform_connectionInfo_configStreamGetCategories(v10, (uint64_t)v7, v6);
}

- (void)configStreamPropertyRequest:(unsigned __int8)a3 forCategory:(unsigned __int16)a4 forEndpoint:(id)a5 connection:(id)a6
{
  uint64_t v7 = a4;
  uint64_t v8 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = +[ACCConnectionInfoServer sharedServer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientInfo);
  int v14 = [v12 getClientUID:WeakRetained];

  if (gLogObjects) {
    BOOL v15 = gNumLogObjects < 9;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v17 = &_os_log_default;
    id v16 = &_os_log_default;
  }
  else
  {
    id v17 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18[0] = 67110146;
    v18[1] = v8;
    __int16 v19 = 1024;
    int v20 = v7;
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    __int16 v25 = 2112;
    v26 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "ConnectionInfo configStreamPropertyRequest: %u forCategory: 0x%x forEndpoint: %@ connection: %@ client: %@", (uint8_t *)v18, 0x2Cu);
  }

  platform_connectionInfo_configStreamPropertyRequest(v14, (uint64_t)v11, v10, v7, v8);
}

- (void)configStreamPropertySetValue:(id)a3 forProperty:(unsigned __int8)a4 forCategory:(unsigned __int16)a5 forEndpoint:(id)a6 connection:(id)a7
{
  int v9 = a5;
  int v10 = a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  BOOL v15 = +[ACCConnectionInfoServer sharedServer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientInfo);
  id v17 = [v15 getClientUID:WeakRetained];

  if (gLogObjects && gNumLogObjects >= 9)
  {
    __int16 v18 = *(id *)(gLogObjects + 64);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    __int16 v18 = &_os_log_default;
    id v19 = &_os_log_default;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 134219522;
    id v21 = [v12 length];
    __int16 v22 = 1024;
    int v23 = v10;
    __int16 v24 = 1024;
    int v25 = v9;
    __int16 v26 = 2112;
    id v27 = v13;
    __int16 v28 = 2112;
    id v29 = v14;
    __int16 v30 = 2112;
    v31 = v17;
    __int16 v32 = 2112;
    id v33 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "ConnectionInfo configStreamPropertySetValue: (%lu bytes) forPropertyID:%u forCategory: 0x%x forEndpoint: %@ connection: %@ client: %@, propertyValue %@", (uint8_t *)&v20, 0x40u);
  }

  platform_connectionInfo_configStreamPropertySetValue(v17, (uint64_t)v14, v13, v9, v10, v12);
}

- (void)copyLocalizedAccessoryName:(id)a3 withReply:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  BOOL v4 = ACCConnectionInfoCopyLocalizedAccessoryNamePrivate();
  if (v5) {
    v5[2](v5, v4);
  }
}

- (void)interceptIncomingNTimes:(int)a3 forEndpoint:(id)a4 connection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int v10 = +[ACCConnectionInfoServer sharedServer];
  p_clientInfo = &self->_clientInfo;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientInfo);
  unsigned __int8 v13 = [v10 checkClient:WeakRetained hasEntitlement:@"com.apple.accessory.testing"];

  if (v13)
  {
    if ((a3 != 0) != [(NSMutableSet *)self->_interceptEnabled containsObject:v8])
    {
      interceptEnabled = self->_interceptEnabled;
      if (a3) {
        [(NSMutableSet *)interceptEnabled addObject:v8];
      }
      else {
        [(NSMutableSet *)interceptEnabled removeObject:v8];
      }
      BOOL v17 = self->_interceptEnabled != 0;
      id v18 = objc_loadWeakRetained((id *)p_clientInfo);
      [v10 setInterceptState:v17 forEndpoint:v8 connection:v9 clientInfo:v18];
    }
    platform_connectionInfo_setupInterceptForEndpoint((uint64_t)v9, v8, a3);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 9)
    {
      BOOL v15 = *(id *)(gLogObjects + 64);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v15 = &_os_log_default;
      id v16 = &_os_log_default;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "ConnectionInfo interceptIncomingNTimes: - client not entitled!", v19, 2u);
    }
  }
}

- (void)getInterceptCountForEndpoint:(id)a3 connection:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, id, id, uint64_t))a5;
  id v11 = +[ACCConnectionInfoServer sharedServer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientInfo);
  unsigned __int8 v13 = [v11 checkClient:WeakRetained hasEntitlement:@"com.apple.accessory.testing"];

  if (v13)
  {
    uint64_t InterceptCountForEndpoint = platform_connectionInfo_getInterceptCountForEndpoint((uint64_t)v9, v8);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 9)
    {
      BOOL v15 = *(id *)(gLogObjects + 64);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v15 = &_os_log_default;
      id v16 = &_os_log_default;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "ConnectionInfo interceptIncomingNTimes: - client not entitled!", (uint8_t *)&v19, 2u);
    }

    uint64_t InterceptCountForEndpoint = 0;
  }
  if (gLogObjects && gNumLogObjects >= 9)
  {
    BOOL v17 = *(id *)(gLogObjects + 64);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v17 = &_os_log_default;
    id v18 = &_os_log_default;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138412802;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 1024;
    int v24 = InterceptCountForEndpoint;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "ConnectionInfo getInterceptCountForEndpoint: %@ - %@, result %d", (uint8_t *)&v19, 0x1Cu);
  }

  v10[2](v10, v8, v9, InterceptCountForEndpoint);
}

- (void)sendData:(id)a3 forEndpoint:(id)a4 connection:(id)a5
{
  CFDataRef v8 = (const __CFData *)a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[ACCConnectionInfoServer sharedServer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientInfo);
  unsigned __int8 v13 = [v11 checkClient:WeakRetained hasEntitlement:@"com.apple.accessory.testing"];

  if (v13)
  {
    platform_connectionInfo_sendDataForEndpoint((uint64_t)v10, v9, v8);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 9)
    {
      id v14 = *(id *)(gLogObjects + 64);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v14 = &_os_log_default;
      id v15 = &_os_log_default;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "ConnectionInfo sendData: - client not entitled!", v16, 2u);
    }
  }
}

- (void)getAccessoryUserName:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __64__ACCConnectionInfoServerRemote_getAccessoryUserName_withReply___block_invoke;
  v15[3] = &unk_1002191C0;
  id v7 = a4;
  id v16 = v7;
  CFDataRef v8 = objc_retainBlock(v15);
  if (![(ACCConnectionInfoServerRemote *)self _checkClientEntitlements:1]) {
    goto LABEL_14;
  }
  if (gLogObjects && gNumLogObjects >= 9)
  {
    id v9 = *(id *)(gLogObjects + 64);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v9 = &_os_log_default;
    id v10 = &_os_log_default;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ConnectionInfo getAccessoryUserName", v14, 2u);
  }

  EndpointWithUUID = acc_manager_getEndpointWithUUID(v6);
  if (EndpointWithUUID && *EndpointWithUUID)
  {
    platform_connectionInfo_getAccessoryUserName(EndpointWithUUID[1], v6, v8);
  }
  else
  {
LABEL_14:
    id v12 = logObjectForModule();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACCConnectionInfoServerRemote getAccessoryUserName:withReply:]();
    }

    unsigned __int8 v13 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
  }
}

void __64__ACCConnectionInfoServerRemote_getAccessoryUserName_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 9;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    CFDataRef v8 = &_os_log_default;
    id v7 = &_os_log_default;
  }
  else
  {
    CFDataRef v8 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = a2 != 0;
    __int16 v10 = 2112;
    id v11 = a2;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ConnectionInfo getAccessoryUserName reply: %d, %@", (uint8_t *)v9, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setAccessoryUserName:(id)a3 forEndpoint:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __76__ACCConnectionInfoServerRemote_setAccessoryUserName_forEndpoint_withReply___block_invoke;
  v23[3] = &unk_1002191E8;
  id v10 = a5;
  id v24 = v10;
  id v11 = objc_retainBlock(v23);
  if (![(ACCConnectionInfoServerRemote *)self _checkClientEntitlements:1]) {
    goto LABEL_14;
  }
  if (gLogObjects && gNumLogObjects >= 9)
  {
    id v12 = *(id *)(gLogObjects + 64);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v12 = &_os_log_default;
    id v13 = &_os_log_default;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[ACCConnectionInfoServerRemote setAccessoryUserName:forEndpoint:withReply:]((uint64_t)v8, v12, v14, v15, v16, v17, v18, v19);
  }

  EndpointWithUUID = acc_manager_getEndpointWithUUID(v9);
  if (EndpointWithUUID && *EndpointWithUUID)
  {
    platform_connectionInfo_setAccessoryUserName((const __CFString *)v8, EndpointWithUUID[1], v9, v11);
  }
  else
  {
LABEL_14:
    __int16 v21 = logObjectForModule();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[ACCConnectionInfoServerRemote setAccessoryUserName:forEndpoint:withReply:]();
    }

    id v22 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:0];
    (*((void (**)(id, void *))v10 + 2))(v10, v22);
  }
}

void __76__ACCConnectionInfoServerRemote_setAccessoryUserName_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)provisionAccessoryForFindMy:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __71__ACCConnectionInfoServerRemote_provisionAccessoryForFindMy_withReply___block_invoke;
  v15[3] = &unk_1002191E8;
  id v7 = a4;
  id v16 = v7;
  id v8 = objc_retainBlock(v15);
  if (![(ACCConnectionInfoServerRemote *)self _checkClientEntitlements:1]) {
    goto LABEL_14;
  }
  if (gLogObjects && gNumLogObjects >= 9)
  {
    id v9 = *(id *)(gLogObjects + 64);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v9 = &_os_log_default;
    id v10 = &_os_log_default;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "ACCConnectionInfoServerRemote provisionAccessoryForFindMy", v14, 2u);
  }

  EndpointWithUUID = acc_manager_getEndpointWithUUID(v6);
  if (EndpointWithUUID && *EndpointWithUUID)
  {
    platform_connectionInfo_provisionPairing(EndpointWithUUID[1], v6, v8);
  }
  else
  {
LABEL_14:
    id v12 = logObjectForModule();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACCConnectionInfoServerRemote provisionAccessoryForFindMy:withReply:]();
    }

    id v13 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v13);
  }
}

void __71__ACCConnectionInfoServerRemote_provisionAccessoryForFindMy_withReply___block_invoke(uint64_t a1, void *a2)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPairingStatus:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ACCConnectionInfoServerRemote *)self _checkClientEntitlements:1])
  {
    EndpointWithUUID = (const void **)acc_manager_getEndpointWithUUID(v6);
    if (EndpointWithUUID && *EndpointWithUUID)
    {
      PairingStatus = platform_connectionInfo_getPairingStatus(EndpointWithUUID[1], v6);
      (*((void (**)(id, _DWORD *, void))v7 + 2))(v7, PairingStatus, 0);
      goto LABEL_5;
    }
    id v10 = logObjectForModule();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfoServerRemote getPairingStatus: error", v15, 2u);
    }
  }
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 9;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v13 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  else
  {
    id v13 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[ACCConnectionInfoServerRemote getPairingStatus:withReply:]();
  }

  uint64_t v14 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:0];
  (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v14);

LABEL_5:
}

- (void)resetPairingInformation:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __67__ACCConnectionInfoServerRemote_resetPairingInformation_withReply___block_invoke;
  v15[3] = &unk_1002191E8;
  id v7 = a4;
  id v16 = v7;
  id v8 = objc_retainBlock(v15);
  if (![(ACCConnectionInfoServerRemote *)self _checkClientEntitlements:1]) {
    goto LABEL_14;
  }
  if (gLogObjects && gNumLogObjects >= 9)
  {
    id v9 = *(id *)(gLogObjects + 64);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v9 = &_os_log_default;
    id v10 = &_os_log_default;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "ConnectionInfo resetPairingInformation", v14, 2u);
  }

  EndpointWithUUID = acc_manager_getEndpointWithUUID(v6);
  if (EndpointWithUUID && *EndpointWithUUID)
  {
    platform_connectionInfo_resetPairing(EndpointWithUUID[1], v6, v8);
  }
  else
  {
LABEL_14:
    id v12 = logObjectForModule();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACCConnectionInfoServerRemote resetPairingInformation:withReply:]();
    }

    id v13 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v13);
  }
}

void __67__ACCConnectionInfoServerRemote_resetPairingInformation_withReply___block_invoke(uint64_t a1, void *a2)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPrivateNVMKeyValues:(id)a3 forEndpoint:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __78__ACCConnectionInfoServerRemote_getPrivateNVMKeyValues_forEndpoint_withReply___block_invoke;
  v15[3] = &unk_100219210;
  id v10 = a5;
  id v16 = v10;
  BOOL v11 = objc_retainBlock(v15);
  if ([(ACCConnectionInfoServerRemote *)self _checkClientEntitlements:1]
    && (EndpointWithUUID = acc_manager_getEndpointWithUUID(v9)) != 0
    && *EndpointWithUUID)
  {
    platform_connectionInfo_getPrivateNvmKeyValues(EndpointWithUUID[1], v9, (uint64_t)v8, v11);
  }
  else
  {
    id v13 = logObjectForModule();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACCConnectionInfoServerRemote getPrivateNVMKeyValues:forEndpoint:withReply:]();
    }

    uint64_t v14 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:0];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __78__ACCConnectionInfoServerRemote_getPrivateNVMKeyValues_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 9;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __78__ACCConnectionInfoServerRemote_getPrivateNVMKeyValues_forEndpoint_withReply___block_invoke_cold_3((uint64_t)a2, v6);
  }

  if (gLogObjects && gNumLogObjects >= 9)
  {
    id v7 = *(id *)(gLogObjects + 64);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v7 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __78__ACCConnectionInfoServerRemote_getPrivateNVMKeyValues_forEndpoint_withReply___block_invoke_cold_1((uint64_t)a2, v7, v9, v10, v11, v12, v13, v14);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPrivateNVMKeyValues:(id)a3 forEndpoint:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __78__ACCConnectionInfoServerRemote_setPrivateNVMKeyValues_forEndpoint_withReply___block_invoke;
  v15[3] = &unk_1002191E8;
  id v10 = a5;
  id v16 = v10;
  uint64_t v11 = objc_retainBlock(v15);
  if ([(ACCConnectionInfoServerRemote *)self _checkClientEntitlements:1]
    && (EndpointWithUUID = acc_manager_getEndpointWithUUID(v9)) != 0
    && *EndpointWithUUID)
  {
    platform_connectionInfo_setPrivateNvmKeyValues(EndpointWithUUID[1], v9, (uint64_t)v8, v11);
  }
  else
  {
    uint64_t v13 = logObjectForModule();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACCConnectionInfoServerRemote setPrivateNVMKeyValues:forEndpoint:withReply:]();
    }

    uint64_t v14 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:0];
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

void __78__ACCConnectionInfoServerRemote_setPrivateNVMKeyValues_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPublicNVMKeyValues:(id)a3 forEndpoint:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __77__ACCConnectionInfoServerRemote_getPublicNVMKeyValues_forEndpoint_withReply___block_invoke;
  v16[3] = &unk_100219210;
  id v10 = a5;
  id v17 = v10;
  uint64_t v11 = objc_retainBlock(v16);
  if ([(ACCConnectionInfoServerRemote *)self _checkClientEntitlements:1])
  {
    EndpointWithUUID = acc_manager_getEndpointWithUUID(v9);
    if (EndpointWithUUID && *EndpointWithUUID)
    {
      platform_connectionInfo_getPublicNvmKeyValues(EndpointWithUUID[1], v9, (uint64_t)v8, v11);
      goto LABEL_5;
    }
    uint64_t v13 = logObjectForModule();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACCConnectionInfoServerRemote getPublicNVMKeyValues:forEndpoint:withReply:]();
    }
  }
  uint64_t v14 = logObjectForModule();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[ACCConnectionInfoServerRemote getPublicNVMKeyValues:forEndpoint:withReply:]();
  }

  uint64_t v15 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:0];
  (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v15);

LABEL_5:
}

void __77__ACCConnectionInfoServerRemote_getPublicNVMKeyValues_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 9;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __77__ACCConnectionInfoServerRemote_getPublicNVMKeyValues_forEndpoint_withReply___block_invoke_cold_3((uint64_t)a2, v6);
  }

  if (gLogObjects && gNumLogObjects >= 9)
  {
    id v7 = *(id *)(gLogObjects + 64);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v7 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __77__ACCConnectionInfoServerRemote_getPublicNVMKeyValues_forEndpoint_withReply___block_invoke_cold_1((uint64_t)a2, v7, v9, v10, v11, v12, v13, v14);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPublicNVMKeyValues:(id)a3 forEndpoint:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __77__ACCConnectionInfoServerRemote_setPublicNVMKeyValues_forEndpoint_withReply___block_invoke;
  v15[3] = &unk_1002191E8;
  id v10 = a5;
  id v16 = v10;
  uint64_t v11 = objc_retainBlock(v15);
  if ([(ACCConnectionInfoServerRemote *)self _checkClientEntitlements:1]
    && (EndpointWithUUID = acc_manager_getEndpointWithUUID(v9)) != 0
    && *EndpointWithUUID)
  {
    platform_connectionInfo_setPublicNvmKeyValues(EndpointWithUUID[1], v9, (uint64_t)v8, v11);
  }
  else
  {
    uint64_t v13 = logObjectForModule();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACCConnectionInfoServerRemote setPublicNVMKeyValues:forEndpoint:withReply:]();
    }

    uint64_t v14 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:0];
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

void __77__ACCConnectionInfoServerRemote_setPublicNVMKeyValues_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)beginVendorKeyErase:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __63__ACCConnectionInfoServerRemote_beginVendorKeyErase_withReply___block_invoke;
  v12[3] = &unk_100219238;
  id v7 = a4;
  id v13 = v7;
  id v8 = objc_retainBlock(v12);
  if ([(ACCConnectionInfoServerRemote *)self _checkClientEntitlements:1]
    && (EndpointWithUUID = acc_manager_getEndpointWithUUID(v6)) != 0
    && *EndpointWithUUID)
  {
    platform_connectionInfo_beginVendorKeyErase(EndpointWithUUID[1], v6, v8);
  }
  else
  {
    id v10 = logObjectForModule();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACCConnectionInfoServerRemote beginVendorKeyErase:withReply:]();
    }

    uint64_t v11 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __63__ACCConnectionInfoServerRemote_beginVendorKeyErase_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)continueVendorKeyErase:(id)a3 withSignature:(id)a4 andAccessoryNonce:(id)a5 forEndpoint:(id)a6 withReply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __110__ACCConnectionInfoServerRemote_continueVendorKeyErase_withSignature_andAccessoryNonce_forEndpoint_withReply___block_invoke;
  v21[3] = &unk_1002191E8;
  id v16 = a7;
  id v22 = v16;
  id v17 = objc_retainBlock(v21);
  if ([(ACCConnectionInfoServerRemote *)self _checkClientEntitlements:1]
    && (EndpointWithUUID = acc_manager_getEndpointWithUUID(v15)) != 0
    && *EndpointWithUUID)
  {
    platform_connectionInfo_continueVendorKeyErase(EndpointWithUUID[1], v15, (uint64_t)v12, (uint64_t)v13, (uint64_t)v14, v17);
  }
  else
  {
    uint64_t v19 = logObjectForModule();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ACCConnectionInfoServerRemote continueVendorKeyErase:withSignature:andAccessoryNonce:forEndpoint:withReply:]();
    }

    id v20 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:0];
    (*((void (**)(id, void *))v16 + 2))(v16, v20);
  }
}

void __110__ACCConnectionInfoServerRemote_continueVendorKeyErase_withSignature_andAccessoryNonce_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelVendorKeyErase:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  _DWORD v13[2] = __64__ACCConnectionInfoServerRemote_cancelVendorKeyErase_withReply___block_invoke;
  v13[3] = &unk_1002191E8;
  id v7 = a4;
  id v14 = v7;
  id v8 = objc_retainBlock(v13);
  if ([(ACCConnectionInfoServerRemote *)self _checkClientEntitlements:1]
    && (EndpointWithUUID = acc_manager_getEndpointWithUUID(v6)) != 0
    && *EndpointWithUUID)
  {
    platform_connectionInfo_cancelVendorKeyErase(EndpointWithUUID[1], v6, v8);
  }
  else
  {
    id v10 = logObjectForModule();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "ConnectionInfo cancelVendorKeyErase: error", v12, 2u);
    }

    uint64_t v11 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

void __64__ACCConnectionInfoServerRemote_cancelVendorKeyErase_withReply___block_invoke(uint64_t a1, void *a2)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)beginUserKeyErase:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __61__ACCConnectionInfoServerRemote_beginUserKeyErase_withReply___block_invoke;
  v12[3] = &unk_100219238;
  id v7 = a4;
  id v13 = v7;
  id v8 = objc_retainBlock(v12);
  if ([(ACCConnectionInfoServerRemote *)self _checkClientEntitlements:1]
    && (EndpointWithUUID = acc_manager_getEndpointWithUUID(v6)) != 0
    && *EndpointWithUUID)
  {
    platform_connectionInfo_beginUserKeyErase(EndpointWithUUID[1], v6, v8);
  }
  else
  {
    id v10 = logObjectForModule();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACCConnectionInfoServerRemote beginUserKeyErase:withReply:]();
    }

    uint64_t v11 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __61__ACCConnectionInfoServerRemote_beginUserKeyErase_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)continueUserKeyErase:(id)a3 withSignature:(id)a4 andAccessoryNonce:(id)a5 forEndpoint:(id)a6 withReply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __108__ACCConnectionInfoServerRemote_continueUserKeyErase_withSignature_andAccessoryNonce_forEndpoint_withReply___block_invoke;
  v21[3] = &unk_1002191E8;
  id v16 = a7;
  id v22 = v16;
  id v17 = objc_retainBlock(v21);
  if ([(ACCConnectionInfoServerRemote *)self _checkClientEntitlements:1]
    && (EndpointWithUUID = acc_manager_getEndpointWithUUID(v15)) != 0
    && *EndpointWithUUID)
  {
    platform_connectionInfo_continueUserKeyErase(EndpointWithUUID[1], v15, (uint64_t)v12, (uint64_t)v13, (uint64_t)v14, v17);
  }
  else
  {
    uint64_t v19 = logObjectForModule();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ACCConnectionInfoServerRemote continueUserKeyErase:withSignature:andAccessoryNonce:forEndpoint:withReply:]();
    }

    id v20 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:0];
    (*((void (**)(id, void *))v16 + 2))(v16, v20);
  }
}

void __108__ACCConnectionInfoServerRemote_continueUserKeyErase_withSignature_andAccessoryNonce_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelUserKeyErase:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  _DWORD v13[2] = __62__ACCConnectionInfoServerRemote_cancelUserKeyErase_withReply___block_invoke;
  v13[3] = &unk_1002191E8;
  id v7 = a4;
  id v14 = v7;
  id v8 = objc_retainBlock(v13);
  if ([(ACCConnectionInfoServerRemote *)self _checkClientEntitlements:1]
    && (EndpointWithUUID = acc_manager_getEndpointWithUUID(v6)) != 0
    && *EndpointWithUUID)
  {
    platform_connectionInfo_cancelUserKeyErase(EndpointWithUUID[1], v6, v8);
  }
  else
  {
    id v10 = logObjectForModule();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "ConnectionInfo cancelUserKeyErase: error", v12, 2u);
    }

    uint64_t v11 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

void __62__ACCConnectionInfoServerRemote_cancelUserKeyErase_withReply___block_invoke(uint64_t a1, void *a2)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)copyUserPrivateKey:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __62__ACCConnectionInfoServerRemote_copyUserPrivateKey_withReply___block_invoke;
  v12[3] = &unk_100219238;
  id v7 = a4;
  id v13 = v7;
  id v8 = objc_retainBlock(v12);
  if ([(ACCConnectionInfoServerRemote *)self _checkClientEntitlements:1]
    && (EndpointWithUUID = acc_manager_getEndpointWithUUID(v6)) != 0
    && *EndpointWithUUID)
  {
    platform_connectionInfo_copyUserPrivateKey(EndpointWithUUID[1], v6, v8);
  }
  else
  {
    id v10 = logObjectForModule();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACCConnectionInfoServerRemote copyUserPrivateKey:withReply:]();
    }

    uint64_t v11 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __62__ACCConnectionInfoServerRemote_copyUserPrivateKey_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 9;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v8 = &_os_log_default;
    id v7 = &_os_log_default;
  }
  else
  {
    id v8 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = a2 != 0;
    __int16 v10 = 1024;
    BOOL v11 = a3 != 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ConnectionInfo copyUserPrivateKey: reply: key:%d error:%d", (uint8_t *)v9, 0xEu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_checkClientEntitlements:(unint64_t)a3
{
  id v5 = +[ACCConnectionInfoServer sharedServer];
  if (a3)
  {
    uint64_t v6 = 1;
    while (1)
    {
      if (v6 == 1 && (a3 & 1) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_clientInfo);
        unsigned __int8 v8 = [v5 checkClient:WeakRetained hasEntitlement:@"com.apple.coreaccessories.entitlement.MFi4.client.FindMy"];

        if ((v8 & 1) == 0) {
          break;
        }
      }
      v6 *= 2;
      if (v6 - 1 >= a3) {
        goto LABEL_7;
      }
    }
    if (gLogObjects && gNumLogObjects >= 9)
    {
      __int16 v10 = *(id *)(gLogObjects + 64);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      __int16 v10 = &_os_log_default;
      id v11 = &_os_log_default;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      CFStringRef v14 = @"com.apple.coreaccessories.entitlement.MFi4.client.FindMy";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "ConnectionInfo: - client missing entitlement: %@!", (uint8_t *)&v13, 0xCu);
    }

    BOOL v9 = 0;
  }
  else
  {
LABEL_7:
    BOOL v9 = 1;
  }

  return v9;
}

- (ACCConnectionInfoClientInfo)clientInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientInfo);

  return (ACCConnectionInfoClientInfo *)WeakRetained;
}

- (void)setClientInfo:(id)a3
{
}

- (NSLock)remoteConnectionInfoServerLock
{
  return self->_remoteConnectionInfoServerLock;
}

- (NSMutableSet)interceptEnabled
{
  return self->_interceptEnabled;
}

- (void)setInterceptEnabled:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interceptEnabled, 0);
  objc_storeStrong((id *)&self->_remoteConnectionInfoServerLock, 0);

  objc_destroyWeak((id *)&self->_clientInfo);
}

- (void)getFilterForClient:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)accessoryEndpointsForConnection:withReply:.cold.1()
{
  OUTLINED_FUNCTION_3_16();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v0, v1, "ConnectionInfo accessoryEndpointsForConnection: %@, send reply accessoryEndpointList %@");
}

- (void)accessoryInfoForConnection:withReply:.cold.1()
{
  OUTLINED_FUNCTION_3_16();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v0, v1, "ConnectionInfo accessoryInfoForEndpoint: %@, send reply accInfo %@");
}

- (void)getAccessoryUserName:withReply:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ConnectionInfo getAccessoryUserName: error", v2, v3, v4, v5, v6);
}

- (void)setAccessoryUserName:forEndpoint:withReply:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ConnectionInfo setAccessoryUserName: error", v2, v3, v4, v5, v6);
}

- (void)setAccessoryUserName:(uint64_t)a3 forEndpoint:(uint64_t)a4 withReply:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)provisionAccessoryForFindMy:withReply:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ACCConnectionInfoServerRemote provisionAccessoryForFindMy: error", v2, v3, v4, v5, v6);
}

- (void)getPairingStatus:withReply:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ACCConnectionInfoServerRemote getPairingStatus: error", v2, v3, v4, v5, v6);
}

- (void)resetPairingInformation:withReply:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ConnectionInfo resetPairingInformation: error", v2, v3, v4, v5, v6);
}

- (void)getPrivateNVMKeyValues:forEndpoint:withReply:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ConnectionInfo getPrivateNVMKeyValues: error", v2, v3, v4, v5, v6);
}

void __78__ACCConnectionInfoServerRemote_getPrivateNVMKeyValues_forEndpoint_withReply___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __78__ACCConnectionInfoServerRemote_getPrivateNVMKeyValues_forEndpoint_withReply___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 != 0;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "AccConnectionInfoServerRemote: getPrivateNVMKeyValues: hasDict:%d", (uint8_t *)v2, 8u);
}

- (void)setPrivateNVMKeyValues:forEndpoint:withReply:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ConnectionInfo setPrivateNVMKeyValues: error", v2, v3, v4, v5, v6);
}

- (void)getPublicNVMKeyValues:forEndpoint:withReply:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ConnectionInfo getPublicNVMKeyValues: error", v2, v3, v4, v5, v6);
}

- (void)getPublicNVMKeyValues:forEndpoint:withReply:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Remote: getPublicNVMKeyValues: !pEndpoint || pEndpoint->pConnection", v2, v3, v4, v5, v6);
}

void __77__ACCConnectionInfoServerRemote_getPublicNVMKeyValues_forEndpoint_withReply___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __77__ACCConnectionInfoServerRemote_getPublicNVMKeyValues_forEndpoint_withReply___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 != 0;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "AccConnectionInfoServerRemote: getPublicNVMKeyValues: hasDict:%d", (uint8_t *)v2, 8u);
}

- (void)setPublicNVMKeyValues:forEndpoint:withReply:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ConnectionInfo setPublicNVMKeyValues: error", v2, v3, v4, v5, v6);
}

- (void)beginVendorKeyErase:withReply:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ConnectionInfo beginVendorKeyErase: error", v2, v3, v4, v5, v6);
}

- (void)continueVendorKeyErase:withSignature:andAccessoryNonce:forEndpoint:withReply:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ConnectionInfo continueVendorKeyErase: error", v2, v3, v4, v5, v6);
}

- (void)beginUserKeyErase:withReply:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ConnectionInfo beginUserKeyErase: error", v2, v3, v4, v5, v6);
}

- (void)continueUserKeyErase:withSignature:andAccessoryNonce:forEndpoint:withReply:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ConnectionInfo continueUserKeyErase: error", v2, v3, v4, v5, v6);
}

- (void)copyUserPrivateKey:withReply:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ConnectionInfo copyUserPrivateKey: error", v2, v3, v4, v5, v6);
}

@end