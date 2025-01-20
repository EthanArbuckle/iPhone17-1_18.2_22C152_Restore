@interface ACCAssistiveTouchServerRemote
- (ACCAssistiveTouchServerRemote)initWithXPCConnection:(id)a3;
- (NSXPCConnection)XPCConnection;
- (void)initConnection:(id)a3;
- (void)notifyEnabledState:(BOOL)a3 provider:(id)a4;
@end

@implementation ACCAssistiveTouchServerRemote

- (ACCAssistiveTouchServerRemote)initWithXPCConnection:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "assistiveTouch initWithXPCConnection: XPCConnection=%lu", buf, 0xCu);
  }

  v12.receiver = self;
  v12.super_class = (Class)ACCAssistiveTouchServerRemote;
  v9 = [(ACCAssistiveTouchServerRemote *)&v12 init];
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

- (void)initConnection:(id)a3
{
  v4 = (void (**)(id, BOOL))a3;
  id v5 = +[ACCAssistiveTouchServer sharedServer];
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = [(ACCAssistiveTouchServerRemote *)self XPCConnection];
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
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "assistiveTouch Client has called initConnection method!", (uint8_t *)v14, 2u);
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
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "assistiveTouch shouldStayConnected: %d", (uint8_t *)v14, 8u);
  }

  if (v7)
  {
    v13 = +[ACCAssistiveTouchServer sharedServer];
    [v13 sendUpdatedSubscriberList];
  }
  v4[2](v4, v7);
}

- (void)notifyEnabledState:(BOOL)a3 provider:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
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
    BOOL v8 = &_os_log_default;
    id v7 = &_os_log_default;
  }
  else
  {
    BOOL v8 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = v5;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "assistiveTouch Received notifyEnabledState %@ enabled=%d", buf, 0x12u);
  }

  id v9 = +[ACCAssistiveTouchServer sharedServer];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __61__ACCAssistiveTouchServerRemote_notifyEnabledState_provider___block_invoke;
  v10[3] = &__block_descriptor_33_e22_v24__0__NSString_8_B16l;
  BOOL v11 = v4;
  [v9 iterateAttachedConnectionsSync:v10];
}

void __61__ACCAssistiveTouchServerRemote_notifyEnabledState_provider___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (NSXPCConnection)XPCConnection
{
  return self->_XPCConnection;
}

- (void).cxx_destruct
{
}

@end