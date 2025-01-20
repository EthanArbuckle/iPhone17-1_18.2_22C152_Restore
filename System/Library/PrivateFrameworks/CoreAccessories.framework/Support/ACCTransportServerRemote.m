@interface ACCTransportServerRemote
- (ACCTransportClientInfo)clientInfo;
- (ACCTransportServerRemote)initWithClientInfo:(id)a3;
- (void)accessoryInfoForConnectionWithUUID:(id)a3 withReply:(id)a4;
- (void)accessoryInfoForEndpointWithUUID:(id)a3 withReply:(id)a4;
- (void)authStatusForConnectionWithUUID:(id)a3 authType:(int)a4 withReply:(id)a5;
- (void)connectionUUIDForEndpointWithUUID:(id)a3 withReply:(id)a4;
- (void)createConnectionWithType:(int)a3 andIdentifier:(id)a4 withReply:(id)a5;
- (void)createEndpointWithTransportType:(int)a3 andProtocol:(int)a4 andIdentifier:(id)a5 forConnectionWithUUID:(id)a6 withReply:(id)a7;
- (void)destroyConnectionWithUUID:(id)a3 withReply:(id)a4;
- (void)destroyEndpointWithUUID:(id)a3 withReply:(id)a4;
- (void)enableSecureTunnelDataReceiveHandlerForEndpoint:(id)a3;
- (void)endpointUUIDsForConnectionWithUUID:(id)a3 withReply:(id)a4;
- (void)identifierForConnectionWithUUID:(id)a3 withReply:(id)a4;
- (void)identifierForEndpointWithUUID:(id)a3 withReply:(id)a4;
- (void)isConnectionAuthenticatedForUUID:(id)a3 withReply:(id)a4;
- (void)launchServer;
- (void)processIncomingData:(id)a3 forEndpointWithUUID:(id)a4 withReply:(id)a5;
- (void)propertiesForConnectionWithUUID:(id)a3 withReply:(id)a4;
- (void)propertiesForEndpointWithUUID:(id)a3 withReply:(id)a4;
- (void)publishConnectionWithUUID:(id)a3 withReply:(id)a4;
- (void)removeProperty:(id)a3 forConnectionWithUUID:(id)a4 withReply:(id)a5;
- (void)removeProperty:(id)a3 forEndpointWithUUID:(id)a4 withReply:(id)a5;
- (void)sendOutgoingSecureTunnelData:(id)a3 forEndpointWithUUID:(id)a4 forType:(unsigned __int16)a5 withResult:(id)a6;
- (void)setAccessoryInfo:(id)a3 forEndpointWithUUID:(id)a4 withReply:(id)a5;
- (void)setClientInfo:(id)a3;
- (void)setConnectionAuthenticated:(id)a3 state:(BOOL)a4;
- (void)setProperties:(id)a3 forConnectionWithUUID:(id)a4 withReply:(id)a5;
- (void)setProperties:(id)a3 forEndpointWithUUID:(id)a4 withReply:(id)a5;
@end

@implementation ACCTransportServerRemote

- (ACCTransportServerRemote)initWithClientInfo:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ACCTransportServerRemote;
  v5 = [(ACCTransportServerRemote *)&v8 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      objc_storeWeak((id *)&v5->_clientInfo, v4);
    }
    else
    {

      v6 = 0;
    }
  }

  return v6;
}

- (void)launchServer
{
  kdebug_trace();
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 3;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    id v4 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "launchServer called!", v5, 2u);
  }
}

- (void)createConnectionWithType:(int)a3 andIdentifier:(id)a4 withReply:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, uint64_t, id))a5;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __77__ACCTransportServerRemote_createConnectionWithType_andIdentifier_withReply___block_invoke;
  v20[3] = &unk_1002170E0;
  v20[4] = self;
  v10 = acc_manager_newConnection(a3, v8, v20);
  if (v10 && *v10)
  {
    v11 = (id)*v10;
    v12 = [(ACCTransportServerRemote *)self clientInfo];
    v13 = [v12 connectionUUIDs];
    [v13 addObject:v11];

    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v14 = 0;
    v11 = 0;
  }
  if (gLogObjects) {
    BOOL v15 = gNumLogObjects < 3;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v17 = &_os_log_default;
    id v16 = &_os_log_default;
  }
  else
  {
    v17 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = [(ACCTransportServerRemote *)self clientInfo];
    v19 = [v18 connectionUUIDs];
    *(_DWORD *)buf = 67109890;
    int v22 = a3;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    v26 = v11;
    __int16 v27 = 2112;
    v28 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "createConnectionWithType: %{coreacc:ACCConnection_Type_t}d andIdentifier: %@ withReply: , connectionUUID = %@, connectionUUIDs = %@", buf, 0x26u);
  }
  if (v9) {
    v9[2](v9, v14, v11);
  }
}

id __77__ACCTransportServerRemote_createConnectionWithType_andIdentifier_withReply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = +[ACCTransportServer sharedServer];
  v9 = [*(id *)(a1 + 32) clientInfo];
  id v10 = [v8 sendOutgoingData:a4 forEndpointWithUUID:a3 connectionUUID:a2 toClient:v9];

  return v10;
}

- (void)setProperties:(id)a3 forConnectionWithUUID:(id)a4 withReply:(id)a5
{
  id v8 = (char *)a3;
  v9 = a4;
  id v10 = (void (**)(id, void))a5;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 3;
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
    v13 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = [(ACCTransportServerRemote *)self clientInfo];
    BOOL v15 = [v14 connectionUUIDs];
    *(_DWORD *)buf = 138412802;
    v33 = v8;
    __int16 v34 = 2112;
    v35 = v9;
    __int16 v36 = 2112;
    v37 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "setProperties: %@ forConnectionWithUUID: %@ withReply: , connectionUUIDs = %@", buf, 0x20u);
  }
  id v16 = [(ACCTransportServerRemote *)self clientInfo];
  v17 = [v16 connectionUUIDs];
  unsigned int v18 = [v17 containsObject:v9];

  if (v18)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __74__ACCTransportServerRemote_setProperties_forConnectionWithUUID_withReply___block_invoke;
    v24[3] = &unk_100217130;
    v19 = v9;
    __int16 v25 = v19;
    v26 = v8;
    __int16 v27 = &v28;
    if ((acc_manager_protectedConnectionCall(v19, 0, 0, v24) & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        v20 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v20 = &_os_log_default;
        id v23 = &_os_log_default;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "-[ACCTransportServerRemote setProperties:forConnectionWithUUID:withReply:]";
        __int16 v34 = 2112;
        v35 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: didn't find connectionUUID %@", buf, 0x16u);
      }
    }
    v21 = v25;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v21 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v21 = &_os_log_default;
      id v22 = &_os_log_default;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = (const char *)v9;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Attempt to modify properties on connection not created by client, ignore! connectionUUID %@", buf, 0xCu);
    }
  }

  if (v10) {
    v10[2](v10, *((unsigned __int8 *)v29 + 24));
  }
  _Block_object_dispose(&v28, 8);
}

uint64_t __74__ACCTransportServerRemote_setProperties_forConnectionWithUUID_withReply___block_invoke(uint64_t a1, uint64_t a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
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
    v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __74__ACCTransportServerRemote_setProperties_forConnectionWithUUID_withReply___block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = acc_connection_setProperties(a2, *(const __CFDictionary **)(a1 + 40));
  return 1;
}

- (void)removeProperty:(id)a3 forConnectionWithUUID:(id)a4 withReply:(id)a5
{
  id v8 = (char *)a3;
  v9 = a4;
  id v10 = (void (**)(id, void))a5;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 3;
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
    v13 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = [(ACCTransportServerRemote *)self clientInfo];
    BOOL v15 = [v14 connectionUUIDs];
    *(_DWORD *)buf = 138412802;
    v33 = v8;
    __int16 v34 = 2112;
    v35 = v9;
    __int16 v36 = 2112;
    v37 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "removeProperty: %@ forConnectionWithUUID: %@ withReply: , connectionUUIDs = %@", buf, 0x20u);
  }
  id v16 = [(ACCTransportServerRemote *)self clientInfo];
  v17 = [v16 connectionUUIDs];
  unsigned int v18 = [v17 containsObject:v9];

  if (v18)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __75__ACCTransportServerRemote_removeProperty_forConnectionWithUUID_withReply___block_invoke;
    v24[3] = &unk_100217130;
    v19 = v9;
    __int16 v25 = v19;
    v26 = v8;
    __int16 v27 = &v28;
    if ((acc_manager_protectedConnectionCall(v19, 0, 0, v24) & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        v20 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v20 = &_os_log_default;
        id v23 = &_os_log_default;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "-[ACCTransportServerRemote removeProperty:forConnectionWithUUID:withReply:]";
        __int16 v34 = 2112;
        v35 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: didn't find connectionUUID %@", buf, 0x16u);
      }
    }
    v21 = v25;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v21 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v21 = &_os_log_default;
      id v22 = &_os_log_default;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = (const char *)v9;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Attempt to modify properties on connection not created by client, ignore! connectionUUID %@", buf, 0xCu);
    }
  }

  if (v10) {
    v10[2](v10, *((unsigned __int8 *)v29 + 24));
  }
  _Block_object_dispose(&v28, 8);
}

uint64_t __75__ACCTransportServerRemote_removeProperty_forConnectionWithUUID_withReply___block_invoke(uint64_t a1, uint64_t a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
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
    v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __75__ACCTransportServerRemote_removeProperty_forConnectionWithUUID_withReply___block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = acc_connection_removeProperty(a2, *(const void **)(a1 + 40));
  return 1;
}

- (void)createEndpointWithTransportType:(int)a3 andProtocol:(int)a4 andIdentifier:(id)a5 forConnectionWithUUID:(id)a6 withReply:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void (**)(id, BOOL, id))a7;
  BOOL v15 = (id *)acc_manager_newEndpointForConnectionWithUUID(v13, a3, a4, v12);
  id v16 = v15;
  if (v15) {
    id v17 = v15[2];
  }
  else {
    id v17 = 0;
  }
  if (gLogObjects) {
    BOOL v18 = gNumLogObjects < 3;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v20 = &_os_log_default;
    id v19 = &_os_log_default;
  }
  else
  {
    v20 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = [(ACCTransportServerRemote *)self clientInfo];
    id v22 = [v21 connectionUUIDs];
    v23[0] = 67110402;
    v23[1] = a3;
    __int16 v24 = 1024;
    int v25 = a4;
    __int16 v26 = 2112;
    id v27 = v12;
    __int16 v28 = 2112;
    id v29 = v13;
    __int16 v30 = 2112;
    id v31 = v17;
    __int16 v32 = 2112;
    v33 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "createEndpointWithTransportType:  %{coreacc:ACCEndpoint_TransportType_t}d andProtocol: %{coreacc:ACCEndpoint_Protocol_t}d andIdentifier: %@ forConnectionWithUUID: %@ withReply: , endpointUUID = %@, connectionUUIDs = %@", (uint8_t *)v23, 0x36u);
  }
  if (v14) {
    v14[2](v14, v16 != 0, v17);
  }
}

- (void)setAccessoryInfo:(id)a3 forEndpointWithUUID:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __75__ACCTransportServerRemote_setAccessoryInfo_forEndpointWithUUID_withReply___block_invoke;
  v14[3] = &unk_100219288;
  v14[4] = self;
  id v16 = &v17;
  id v11 = v8;
  id v15 = v11;
  if ((acc_manager_protectedEndpointCall(v9, 0, 0, v14) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      id v12 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v12 = &_os_log_default;
      id v13 = &_os_log_default;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v22 = "-[ACCTransportServerRemote setAccessoryInfo:forEndpointWithUUID:withReply:]";
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: didn't find endpointUUID %@", buf, 0x16u);
    }
  }
  if (v10) {
    v10[2](v10, *((unsigned __int8 *)v18 + 24));
  }

  _Block_object_dispose(&v17, 8);
}

uint64_t __75__ACCTransportServerRemote_setAccessoryInfo_forEndpointWithUUID_withReply___block_invoke(uint64_t a1, id **a2)
{
  id v4 = **a2;
  id v5 = [*(id *)(a1 + 32) clientInfo];
  v6 = [v5 connectionUUIDs];
  unsigned int v7 = [v6 containsObject:v4];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = acc_endpoint_setAccessoryInfoOverridesWithDictionary((uint64_t)a2, *(const void **)(a1 + 40));
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      id v8 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v8 = &_os_log_default;
      id v9 = &_os_log_default;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Attempt to modify accessoryInfo on connection not created by client, ignore! connectionUUID %@", (uint8_t *)&v11, 0xCu);
    }
  }
  return 1;
}

- (void)setProperties:(id)a3 forEndpointWithUUID:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __72__ACCTransportServerRemote_setProperties_forEndpointWithUUID_withReply___block_invoke;
  v15[3] = &unk_1002192B0;
  v15[4] = self;
  BOOL v18 = &v19;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  if ((acc_manager_protectedEndpointCall(v12, 0, 0, v15) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      id v13 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v13 = &_os_log_default;
      id v14 = &_os_log_default;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v24 = "-[ACCTransportServerRemote setProperties:forEndpointWithUUID:withReply:]";
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: didn't find endpointUUID %@", buf, 0x16u);
    }
  }
  if (v10) {
    v10[2](v10, *((unsigned __int8 *)v20 + 24));
  }

  _Block_object_dispose(&v19, 8);
}

uint64_t __72__ACCTransportServerRemote_setProperties_forEndpointWithUUID_withReply___block_invoke(uint64_t a1, id **a2)
{
  if (*a2)
  {
    id v4 = **a2;
    id v5 = [*(id *)(a1 + 32) clientInfo];
    v6 = [v5 connectionUUIDs];
    unsigned int v7 = [v6 containsObject:v4];

    if (v7)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = acc_endpoint_setProperties((pthread_mutex_t *)a2, *(const __CFDictionary **)(a1 + 40));
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        id v10 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v10 = &_os_log_default;
        id v12 = &_os_log_default;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = *(void *)(a1 + 48);
        int v15 = 138412546;
        uint64_t v16 = v13;
        __int16 v17 = 2112;
        BOOL v18 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Attempt to modify properties on endpoint of connection not created by client, ignore! endpointUUID %@, connectionUUID %@", (uint8_t *)&v15, 0x16u);
      }
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 3;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v4 = &_os_log_default;
      id v9 = &_os_log_default;
    }
    else
    {
      id v4 = *(id *)(gLogObjects + 16);
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      int v15 = 138412290;
      uint64_t v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Attempt to modify properties on endpoint of connection but cannot get connection for endpointUUID %@", (uint8_t *)&v15, 0xCu);
    }
  }

  return 1;
}

- (void)removeProperty:(id)a3 forEndpointWithUUID:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __73__ACCTransportServerRemote_removeProperty_forEndpointWithUUID_withReply___block_invoke;
  v15[3] = &unk_1002192B0;
  v15[4] = self;
  BOOL v18 = &v19;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  if ((acc_manager_protectedEndpointCall(v12, 0, 0, v15) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      uint64_t v13 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v13 = &_os_log_default;
      id v14 = &_os_log_default;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v24 = "-[ACCTransportServerRemote removeProperty:forEndpointWithUUID:withReply:]";
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: didn't find endpointUUID %@", buf, 0x16u);
    }
  }
  if (v10) {
    v10[2](v10, *((unsigned __int8 *)v20 + 24));
  }

  _Block_object_dispose(&v19, 8);
}

uint64_t __73__ACCTransportServerRemote_removeProperty_forEndpointWithUUID_withReply___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 8)
    && ([*(id *)(a1 + 32) clientInfo],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 connectionUUIDs],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 containsObject:*(void *)(a2 + 8)],
        v5,
        v4,
        v6))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = acc_endpoint_removeProperty((pthread_mutex_t *)a2, *(const void **)(a1 + 40));
  }
  else
  {
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 3;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v9 = &_os_log_default;
      id v8 = &_os_log_default;
    }
    else
    {
      id v9 = *(id *)(gLogObjects + 16);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      int v12 = 138412290;
      uint64_t v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Attempt to modify properties on endpoint not created by client, ignore! endpointUUID %@", (uint8_t *)&v12, 0xCu);
    }
  }
  return 1;
}

- (void)publishConnectionWithUUID:(id)a3 withReply:(id)a4
{
  id v7 = a4;
  uint64_t v5 = acc_manager_publishConnectionWithUUID(a3);
  unsigned int v6 = v7;
  if (v7)
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, v5);
    unsigned int v6 = v7;
  }
}

- (void)destroyEndpointWithUUID:(id)a3 withReply:(id)a4
{
  id v7 = a4;
  uint64_t v5 = acc_manager_removeEndpointWithUUID(a3);
  unsigned int v6 = v7;
  if (v7)
  {
    (*((void (**)(id, const void **))v7 + 2))(v7, v5);
    unsigned int v6 = v7;
  }
}

- (void)destroyConnectionWithUUID:(id)a3 withReply:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  CFSetRef v7 = acc_manager_removeConnectionWithUUID(v6);
  id v8 = [(ACCTransportServerRemote *)self clientInfo];
  id v9 = [v8 connectionUUIDs];
  [v9 removeObject:v6];

  uint64_t v10 = v11;
  if (v11)
  {
    (*((void (**)(id, const __CFSet *))v11 + 2))(v11, v7);
    uint64_t v10 = v11;
  }
}

- (void)connectionUUIDForEndpointWithUUID:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  id v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __72__ACCTransportServerRemote_connectionUUIDForEndpointWithUUID_withReply___block_invoke;
  v9[3] = &unk_1002171A8;
  v9[4] = &v10;
  if ((acc_manager_protectedEndpointCall(v5, 0, 0, v9) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      CFSetRef v7 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      CFSetRef v7 = &_os_log_default;
      id v8 = &_os_log_default;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v17 = "-[ACCTransportServerRemote connectionUUIDForEndpointWithUUID:withReply:]";
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: didn't find endpointUUID %@", buf, 0x16u);
    }
  }
  if (v6) {
    v6[2](v6, v11[5]);
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __72__ACCTransportServerRemote_connectionUUIDForEndpointWithUUID_withReply___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
  }
  return 1;
}

- (void)endpointUUIDsForConnectionWithUUID:(id)a3 withReply:(id)a4
{
  id v9 = a3;
  id v5 = (void (**)(id, void *))a4;
  if (v5)
  {
    if (v9)
    {
      CFSetRef v6 = acc_manager_copyEndpointUUIDsForConnection(v9);
      if (v6) {
        CFSetRef v7 = v6;
      }
      else {
        CFSetRef v7 = 0;
      }
    }
    else
    {
      CFSetRef v7 = 0;
    }
    id v8 = [(__CFSet *)v7 allObjects];
    v5[2](v5, v8);
  }
}

- (void)authStatusForConnectionWithUUID:(id)a3 authType:(int)a4 withReply:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void))a5;
  if (v8)
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    int v19 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __79__ACCTransportServerRemote_authStatusForConnectionWithUUID_authType_withReply___block_invoke;
    v12[3] = &unk_1002192D8;
    id v9 = v7;
    int v15 = a4;
    id v13 = v9;
    id v14 = &v16;
    if ((acc_manager_protectedConnectionCall(v9, 0, 0, v12) & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        uint64_t v10 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        uint64_t v10 = &_os_log_default;
        id v11 = &_os_log_default;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v21 = "-[ACCTransportServerRemote authStatusForConnectionWithUUID:authType:withReply:]";
        __int16 v22 = 2112;
        id v23 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: didn't find connectionUUID %@", buf, 0x16u);
      }
    }
    v8[2](v8, *((unsigned int *)v17 + 6));

    _Block_object_dispose(&v16, 8);
  }
}

uint64_t __79__ACCTransportServerRemote_authStatusForConnectionWithUUID_authType_withReply___block_invoke(uint64_t a1, uint64_t a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    CFSetRef v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    CFSetRef v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __79__ACCTransportServerRemote_authStatusForConnectionWithUUID_authType_withReply___block_invoke_cold_1();
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = acc_connection_getAuthStatus(a2, *(unsigned int *)(a1 + 48));
  return 1;
}

- (void)isConnectionAuthenticatedForUUID:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  CFSetRef v6 = (void (**)(id, void))a4;
  if (v6)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __71__ACCTransportServerRemote_isConnectionAuthenticatedForUUID_withReply___block_invoke;
    v10[3] = &unk_100219300;
    id v7 = v5;
    id v11 = v7;
    uint64_t v12 = &v13;
    if ((acc_manager_protectedConnectionCall(v7, 0, 0, v10) & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        id v8 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v8 = &_os_log_default;
        id v9 = &_os_log_default;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v18 = "-[ACCTransportServerRemote isConnectionAuthenticatedForUUID:withReply:]";
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: didn't find connectionUUID %@", buf, 0x16u);
      }
    }
    v6[2](v6, *((unsigned __int8 *)v14 + 24));

    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __71__ACCTransportServerRemote_isConnectionAuthenticatedForUUID_withReply___block_invoke(uint64_t a1, BOOL a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    CFSetRef v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    CFSetRef v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __71__ACCTransportServerRemote_isConnectionAuthenticatedForUUID_withReply___block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = acc_connection_isAuthenticated(a2, 6);
  return 1;
}

- (void)setConnectionAuthenticated:(id)a3 state:(BOOL)a4
{
  BOOL v4 = a4;
  CFSetRef v6 = (char *)a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 3;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v9 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    id v9 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v6;
    __int16 v28 = 1024;
    LODWORD(v29) = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "setConnectionAuthenticated: %@ state: %d", buf, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientInfo);
  id v11 = [WeakRetained XPCConnection];
  unsigned int v12 = [v11 hasEntitlement:@"com.apple.accessories.transport.allowauth"];

  if (v12)
  {
    uint64_t v13 = [(ACCTransportServerRemote *)self clientInfo];
    id v14 = [v13 connectionUUIDs];
    unsigned int v15 = [v14 containsObject:v6];

    if (v15)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      _DWORD v23[2] = __61__ACCTransportServerRemote_setConnectionAuthenticated_state___block_invoke;
      v23[3] = &unk_100219328;
      BOOL v25 = v4;
      char v16 = v6;
      id v24 = v16;
      if ((acc_manager_protectedConnectionCall(v16, 0, 0, v23) & 1) == 0)
      {
        if (gLogObjects && gNumLogObjects >= 3)
        {
          id v17 = *(id *)(gLogObjects + 16);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          id v17 = &_os_log_default;
          id v22 = &_os_log_default;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          id v27 = "-[ACCTransportServerRemote setConnectionAuthenticated:state:]";
          __int16 v28 = 2112;
          id v29 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: didn't find connectionUUID %@", buf, 0x16u);
        }
      }
      uint64_t v18 = v24;
      goto LABEL_41;
    }
    if (gLogObjects && gNumLogObjects >= 3)
    {
      uint64_t v18 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v18 = &_os_log_default;
      id v21 = &_os_log_default;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v6;
      id v20 = "Attempt to set Authenticated state on connection not created by client, ignore! connectionUUID %@";
      goto LABEL_33;
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      uint64_t v18 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v18 = &_os_log_default;
      id v19 = &_os_log_default;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v6;
      id v20 = "setConnectionAuthenticated: %@, ERROR: No entitlement!";
LABEL_33:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
    }
  }
LABEL_41:
}

uint64_t __61__ACCTransportServerRemote_setConnectionAuthenticated_state___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 40)) {
    int v4 = 2;
  }
  else {
    int v4 = 1;
  }
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 3;
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
    BOOL v7 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = *(unsigned __int8 *)(a1 + 40);
    int v11 = 136316162;
    unsigned int v12 = "-[ACCTransportServerRemote setConnectionAuthenticated:state:]_block_invoke";
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 1024;
    int v16 = v10;
    __int16 v17 = 1024;
    int v18 = v4;
    __int16 v19 = 1024;
    int v20 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s: %@ state: %d, status %{coreacc:ACCAuthInfo_Status_t}d for type %{coreacc:ACCAuthInfo_Type_t}d", (uint8_t *)&v11, 0x28u);
  }

  acc_connection_setAuthStatus(a2, 0, v4);
  return 1;
}

- (void)accessoryInfoForConnectionWithUUID:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    int v16 = __Block_byref_object_copy__4;
    __int16 v17 = __Block_byref_object_dispose__4;
    id v18 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __73__ACCTransportServerRemote_accessoryInfoForConnectionWithUUID_withReply___block_invoke;
    v10[3] = &unk_100219300;
    id v7 = v5;
    id v11 = v7;
    unsigned int v12 = &v13;
    if ((acc_manager_protectedConnectionCall(v7, 0, 0, v10) & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        id v8 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v8 = &_os_log_default;
        id v9 = &_os_log_default;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v20 = "-[ACCTransportServerRemote accessoryInfoForConnectionWithUUID:withReply:]";
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: didn't find connectionUUID %@", buf, 0x16u);
      }
    }
    v6[2](v6, v14[5]);

    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __73__ACCTransportServerRemote_accessoryInfoForConnectionWithUUID_withReply___block_invoke(uint64_t a1, uint64_t a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
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
    id v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __73__ACCTransportServerRemote_accessoryInfoForConnectionWithUUID_withReply___block_invoke_cold_1();
  }

  if (a2)
  {
    uint64_t AccessoryInfo = acc_connection_getAccessoryInfo(a2);
    id v8 = acc_accInfo_copyAccessoryInfoDictionary(AccessoryInfo);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    int v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  return 1;
}

- (void)accessoryInfoForEndpointWithUUID:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy__4;
    uint64_t v14 = __Block_byref_object_dispose__4;
    id v15 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __71__ACCTransportServerRemote_accessoryInfoForEndpointWithUUID_withReply___block_invoke;
    v9[3] = &unk_1002171A8;
    v9[4] = &v10;
    if ((acc_manager_protectedEndpointCall(v5, 0, 0, v9) & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        id v7 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v7 = &_os_log_default;
        id v8 = &_os_log_default;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v17 = "-[ACCTransportServerRemote accessoryInfoForEndpointWithUUID:withReply:]";
        __int16 v18 = 2112;
        id v19 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: didn't find endpointUUID %@", buf, 0x16u);
      }
    }
    v6[2](v6, v11[5]);
    _Block_object_dispose(&v10, 8);
  }
}

uint64_t __71__ACCTransportServerRemote_accessoryInfoForEndpointWithUUID_withReply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t AccessoryInfo = acc_endpoint_getAccessoryInfo(a2);
  BOOL v4 = acc_accInfo_copyAccessoryInfoDictionary(AccessoryInfo);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 1;
}

- (void)propertiesForConnectionWithUUID:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    int v16 = __Block_byref_object_copy__4;
    __int16 v17 = __Block_byref_object_dispose__4;
    id v18 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __70__ACCTransportServerRemote_propertiesForConnectionWithUUID_withReply___block_invoke;
    v10[3] = &unk_100219300;
    id v7 = v5;
    id v11 = v7;
    uint64_t v12 = &v13;
    if ((acc_manager_protectedConnectionCall(v7, 0, 0, v10) & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        id v8 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v8 = &_os_log_default;
        id v9 = &_os_log_default;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v20 = "-[ACCTransportServerRemote propertiesForConnectionWithUUID:withReply:]";
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: didn't find connectionUUID %@", buf, 0x16u);
      }
    }
    v6[2](v6, v14[5]);

    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __70__ACCTransportServerRemote_propertiesForConnectionWithUUID_withReply___block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
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
    id v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __70__ACCTransportServerRemote_propertiesForConnectionWithUUID_withReply___block_invoke_cold_1();
  }

  CFDictionaryRef v7 = acc_connection_copyProperties(a2);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return 1;
}

- (void)propertiesForEndpointWithUUID:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    int v16 = __Block_byref_object_copy__4;
    __int16 v17 = __Block_byref_object_dispose__4;
    id v18 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __68__ACCTransportServerRemote_propertiesForEndpointWithUUID_withReply___block_invoke;
    v10[3] = &unk_100219350;
    id v7 = v5;
    id v11 = v7;
    uint64_t v12 = &v13;
    if ((acc_manager_protectedEndpointCall(v7, 0, 0, v10) & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        uint64_t v8 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        uint64_t v8 = &_os_log_default;
        id v9 = &_os_log_default;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v20 = "-[ACCTransportServerRemote propertiesForEndpointWithUUID:withReply:]";
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: didn't find endpointUUID %@", buf, 0x16u);
      }
    }
    v6[2](v6, v14[5]);

    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __68__ACCTransportServerRemote_propertiesForEndpointWithUUID_withReply___block_invoke(uint64_t a1, pthread_mutex_t *a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
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
    id v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __68__ACCTransportServerRemote_propertiesForEndpointWithUUID_withReply___block_invoke_cold_1();
  }

  id v7 = acc_endpoint_copyProperties(a2);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return 1;
}

- (void)identifierForConnectionWithUUID:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    int v16 = __Block_byref_object_copy__4;
    __int16 v17 = __Block_byref_object_dispose__4;
    id v18 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __70__ACCTransportServerRemote_identifierForConnectionWithUUID_withReply___block_invoke;
    v10[3] = &unk_100219300;
    id v7 = v5;
    id v11 = v7;
    uint64_t v12 = &v13;
    if ((acc_manager_protectedConnectionCall(v7, 0, 0, v10) & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        uint64_t v8 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        uint64_t v8 = &_os_log_default;
        id v9 = &_os_log_default;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v20 = "-[ACCTransportServerRemote identifierForConnectionWithUUID:withReply:]";
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: didn't find connectionUUID %@", buf, 0x16u);
      }
    }
    v6[2](v6, v14[5]);

    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __70__ACCTransportServerRemote_identifierForConnectionWithUUID_withReply___block_invoke(uint64_t a1, uint64_t a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
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
    id v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __70__ACCTransportServerRemote_identifierForConnectionWithUUID_withReply___block_invoke_cold_1();
  }

  CFTypeRef v7 = acc_connection_copyIdentifier(a2);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return 1;
}

- (void)identifierForEndpointWithUUID:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    int v16 = __Block_byref_object_copy__4;
    __int16 v17 = __Block_byref_object_dispose__4;
    id v18 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __68__ACCTransportServerRemote_identifierForEndpointWithUUID_withReply___block_invoke;
    v10[3] = &unk_100219350;
    id v7 = v5;
    id v11 = v7;
    uint64_t v12 = &v13;
    if ((acc_manager_protectedEndpointCall(v7, 0, 0, v10) & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        uint64_t v8 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        uint64_t v8 = &_os_log_default;
        id v9 = &_os_log_default;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v20 = "-[ACCTransportServerRemote identifierForEndpointWithUUID:withReply:]";
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: didn't find endpointUUID %@", buf, 0x16u);
      }
    }
    v6[2](v6, v14[5]);

    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __68__ACCTransportServerRemote_identifierForEndpointWithUUID_withReply___block_invoke(uint64_t a1, uint64_t a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
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
    id v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __68__ACCTransportServerRemote_identifierForEndpointWithUUID_withReply___block_invoke_cold_1();
  }

  CFTypeRef v7 = acc_endpoint_copyIdentifier(a2);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return 1;
}

- (void)processIncomingData:(id)a3 forEndpointWithUUID:(id)a4 withReply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, BOOL))a5;
  if (v7 && v8)
  {
    id v10 = v7;
    BOOL v11 = acc_manager_processIncomingDataForEndpointWithUUID(v8, (uint64_t)v10);
    CFRelease(v10);
    if (!v9) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (gLogObjects) {
    BOOL v12 = gNumLogObjects < 3;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v14 = &_os_log_default;
    id v13 = &_os_log_default;
  }
  else
  {
    uint64_t v14 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[ACCTransportPluginManager processIncomingData:forEndpointWithUUID:](v14);
  }

  BOOL v11 = 0;
  if (v9) {
LABEL_16:
  }
    v9[2](v9, v11);
LABEL_17:
}

- (void)sendOutgoingSecureTunnelData:(id)a3 forEndpointWithUUID:(id)a4 forType:(unsigned __int16)a5 withResult:(id)a6
{
  int v7 = a5;
  id v9 = a3;
  id v10 = (char *)a4;
  BOOL v11 = (void (**)(id, void))a6;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  if (gLogObjects) {
    BOOL v12 = gNumLogObjects < 3;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v14 = &_os_log_default;
    id v13 = &_os_log_default;
  }
  else
  {
    uint64_t v14 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v26 = v10;
    __int16 v27 = 1024;
    LODWORD(v28[0]) = v7;
    WORD2(v28[0]) = 2112;
    *(void *)((char *)v28 + 6) = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "sendOutgoingSecureTunnelData, endpoint %@, type %d, dataOut %@", buf, 0x1Cu);
  }

  if (v9)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __96__ACCTransportServerRemote_sendOutgoingSecureTunnelData_forEndpointWithUUID_forType_withResult___block_invoke;
    v17[3] = &unk_100219378;
    id v18 = v9;
    id v19 = &v21;
    __int16 v20 = v7;
    if ((acc_manager_protectedEndpointCall(v10, 0, 0, v17) & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        uint64_t v15 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        uint64_t v15 = &_os_log_default;
        id v16 = &_os_log_default;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v26 = "-[ACCTransportServerRemote sendOutgoingSecureTunnelData:forEndpointWithUUID:forType:withResult:]";
        __int16 v27 = 2112;
        v28[0] = v10;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: didn't find endpointUUID %@", buf, 0x16u);
      }
    }
  }
  if (v11) {
    v11[2](v11, *((unsigned __int8 *)v22 + 24));
  }
  _Block_object_dispose(&v21, 8);
}

uint64_t __96__ACCTransportServerRemote_sendOutgoingSecureTunnelData_forEndpointWithUUID_forType_withResult___block_invoke(uint64_t a1, uint64_t a2)
{
  CFDataRef v4 = (const __CFData *)*(id *)(a1 + 32);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = acc_endpoint_processOutgoingSecureTunnelDataForClient(a2, *(unsigned __int8 *)(a1 + 48), v4);
  if (v4) {
    CFRelease(v4);
  }
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (void)enableSecureTunnelDataReceiveHandlerForEndpoint:(id)a3
{
  id v3 = a3;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
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
    id v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notified that a secure tunnel handler has been added for endpoint: %@", (uint8_t *)&v10, 0xCu);
  }

  if (!v3)
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      int v7 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      int v7 = &_os_log_default;
      id v8 = &_os_log_default;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportServerRemote enableSecureTunnelDataReceiveHandlerForEndpoint:](v7);
    }
    goto LABEL_29;
  }
  if ((acc_manager_protectedEndpointCall(v3, 0, 0, &__block_literal_global_28) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      int v7 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      int v7 = &_os_log_default;
      id v9 = &_os_log_default;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportServerRemote enableSecureTunnelDataReceiveHandlerForEndpoint:]((uint64_t)v3, v7);
    }
LABEL_29:
  }
}

BOOL __76__ACCTransportServerRemote_enableSecureTunnelDataReceiveHandlerForEndpoint___block_invoke(id a1, ACCEndpoint_s *a2, void *a3)
{
  if (a2->var1)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __76__ACCTransportServerRemote_enableSecureTunnelDataReceiveHandlerForEndpoint___block_invoke_2;
    v6[3] = &__block_descriptor_40_e35_v24__0____CFString__8____CFData__16l;
    v6[4] = a2;
    BOOL v4 = objc_retainBlock(v6);
    acc_endpoint_setEndpointSecureTunnelDataReceiveTypeHandler(a2, 1, v4);
  }
  return 1;
}

void __76__ACCTransportServerRemote_enableSecureTunnelDataReceiveHandlerForEndpoint___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 3;
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
    id v8 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    uint64_t v11 = a2;
    __int16 v12 = 2112;
    uint64_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SecureTunnelHandler endpoint: %@, data:%@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = +[ACCTransportServer sharedServer];
  [v9 receivedSecureTunnelData:a3 forEndpointWithUUID:a2 connectionUUID:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (ACCTransportClientInfo)clientInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientInfo);

  return (ACCTransportClientInfo *)WeakRetained;
}

- (void)setClientInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

void __74__ACCTransportServerRemote_setProperties_forConnectionWithUUID_withReply___block_invoke_cold_1()
{
  v1[0] = 136315650;
  OUTLINED_FUNCTION_4_5();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: connectionUUID %@, properties %@", (uint8_t *)v1, 0x20u);
}

void __75__ACCTransportServerRemote_removeProperty_forConnectionWithUUID_withReply___block_invoke_cold_1()
{
  v1[0] = 136315650;
  OUTLINED_FUNCTION_4_5();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: connectionUUID %@, key %@", (uint8_t *)v1, 0x20u);
}

void __79__ACCTransportServerRemote_authStatusForConnectionWithUUID_authType_withReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_15(__stack_chk_guard);
  int v1 = *(_DWORD *)(v0 + 48);
  int v4 = 136315650;
  id v5 = "-[ACCTransportServerRemote authStatusForConnectionWithUUID:authType:withReply:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v2;
  __int16 v8 = 1024;
  int v9 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s: connectionUUID %@, authType %{coreacc:ACCAuthInfo_Type_t}d", (uint8_t *)&v4, 0x1Cu);
}

void __71__ACCTransportServerRemote_isConnectionAuthenticatedForUUID_withReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_15(__stack_chk_guard);
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_3_19((void *)&_mh_execute_header, v0, v1, "%s: connectionUUID %@", v2, v3, v4, v5, 2u);
}

void __73__ACCTransportServerRemote_accessoryInfoForConnectionWithUUID_withReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_15(__stack_chk_guard);
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_3_19((void *)&_mh_execute_header, v0, v1, "%s: connectionUUID %@", v2, v3, v4, v5, 2u);
}

void __70__ACCTransportServerRemote_propertiesForConnectionWithUUID_withReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_15(__stack_chk_guard);
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_3_19((void *)&_mh_execute_header, v0, v1, "%s: connectionUUID %@", v2, v3, v4, v5, 2u);
}

void __68__ACCTransportServerRemote_propertiesForEndpointWithUUID_withReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_15(__stack_chk_guard);
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_3_19((void *)&_mh_execute_header, v0, v1, "%s: endpointUUID %@", v2, v3, v4, v5, 2u);
}

void __70__ACCTransportServerRemote_identifierForConnectionWithUUID_withReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_15(__stack_chk_guard);
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_3_19((void *)&_mh_execute_header, v0, v1, "%s: connectionUUID %@", v2, v3, v4, v5, 2u);
}

void __68__ACCTransportServerRemote_identifierForEndpointWithUUID_withReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_15(__stack_chk_guard);
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_3_19((void *)&_mh_execute_header, v0, v1, "%s: endpointUUID %@", v2, v3, v4, v5, 2u);
}

- (void)enableSecureTunnelDataReceiveHandlerForEndpoint:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "dataOut or endpointUUID is nil!", v1, 2u);
}

- (void)enableSecureTunnelDataReceiveHandlerForEndpoint:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[ACCTransportServerRemote enableSecureTunnelDataReceiveHandlerForEndpoint:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: didn't find endpointUUID %@", (uint8_t *)&v2, 0x16u);
}

@end