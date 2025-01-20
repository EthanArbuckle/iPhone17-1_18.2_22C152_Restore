@interface ACCCommunicationsServerRemote
- (ACCCommunicationsServerRemote)initWithXPCConnection:(id)a3;
- (NSXPCConnection)XPCConnection;
- (void)callStateDidChange:(id)a3;
- (void)commStatusDidChange:(id)a3;
- (void)initConnection:(id)a3;
- (void)listUpdate:(id)a3 forType:(int)a4 coalesced:(BOOL)a5;
@end

@implementation ACCCommunicationsServerRemote

- (ACCCommunicationsServerRemote)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACCCommunicationsServerRemote;
  v6 = [(ACCCommunicationsServerRemote *)&v9 init];
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_XPCConnection, a3);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (void)initConnection:(id)a3
{
  v4 = (void (**)(id, BOOL))a3;
  id v5 = +[ACCCommunicationsServer sharedServer];
  if (objc_opt_respondsToSelector())
  {
    v6 = [(ACCCommunicationsServerRemote *)self XPCConnection];
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
    LOWORD(v15[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[#Communications] Client has called initConnection method!", (uint8_t *)v15, 2u);
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
    v15[0] = 67109120;
    v15[1] = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[#Communications] shouldStayConnected: %d", (uint8_t *)v15, 8u);
  }

  if (v7)
  {
    v13 = +[ACCCommunicationsServer sharedServer];
    [v13 sendUpdatedSubscriberList];

    v14 = +[ACCCommunicationsServer sharedServer];
    [v14 refreshClientData];
  }
  v4[2](v4, v7);
}

- (void)callStateDidChange:(id)a3
{
  id v3 = a3;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 5;
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
    v6 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[#Communications] Received call state update!", v15, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 5)
  {
    BOOL v7 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v7 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCCommunicationsServerRemote callStateDidChange:]((uint64_t)v3, v7, v9, v10, v11, v12, v13, v14);
  }

  platform_communications_callStateUpdate((uint64_t)v3);
}

- (void)commStatusDidChange:(id)a3
{
  id v3 = a3;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 5;
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
    v6 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[#Communications] Received communications update!", v15, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 5)
  {
    BOOL v7 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v7 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCCommunicationsServerRemote commStatusDidChange:]((uint64_t)v3, v7, v9, v10, v11, v12, v13, v14);
  }

  platform_communications_communicationsUpdate((uint64_t)v3);
}

- (void)listUpdate:(id)a3 forType:(int)a4 coalesced:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
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
    uint64_t v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    uint64_t v10 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = "NO";
    if (v5) {
      uint64_t v11 = "YES";
    }
    v20[0] = 67109378;
    v20[1] = a4;
    __int16 v21 = 2080;
    v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[#Communications] Received list update! (type: %{coreacc:ACCCommunications_ListUpdate_Type_t}d, coalesced: %s)", (uint8_t *)v20, 0x12u);
  }

  if (gLogObjects && gNumLogObjects >= 5)
  {
    uint64_t v12 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v12 = &_os_log_default;
    id v13 = &_os_log_default;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACCCommunicationsServerRemote listUpdate:forType:coalesced:]((uint64_t)v7, v12, v14, v15, v16, v17, v18, v19);
  }

  platform_communications_listUpdate(a4, (uint64_t)v7, v5);
}

- (NSXPCConnection)XPCConnection
{
  return self->_XPCConnection;
}

- (void).cxx_destruct
{
}

- (void)callStateDidChange:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)commStatusDidChange:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)listUpdate:(uint64_t)a3 forType:(uint64_t)a4 coalesced:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end