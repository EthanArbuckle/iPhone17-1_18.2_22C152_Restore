@interface ACCHIDServerRemote
- (ACCHIDServerRemote)initWithXPCConnection:(id)a3;
- (NSXPCConnection)XPCConnection;
- (void)componentUpdate:(id)a3 componentID:(id)a4 enabled:(BOOL)a5 withReply:(id)a6;
- (void)getReport:(id)a3 componentID:(id)a4 reportType:(id)a5 reportID:(id)a6 withReply:(id)a7;
- (void)initConnection:(id)a3;
- (void)outReport:(id)a3 componentID:(id)a4 report:(id)a5 withReply:(id)a6;
@end

@implementation ACCHIDServerRemote

- (ACCHIDServerRemote)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACCHIDServerRemote;
  v6 = [(ACCHIDServerRemote *)&v9 init];
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
  id v5 = +[ACCHIDServer sharedServer];
  if (objc_opt_respondsToSelector())
  {
    v6 = [(ACCHIDServerRemote *)self XPCConnection];
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
      platform_bluetooth_copyNameForMacAddress_cold_2();
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
    LOWORD(v13[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[#HID] Client has called initConnection method!", (uint8_t *)v13, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 5)
  {
    v11 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_bluetooth_copyNameForMacAddress_cold_2();
    }
    v11 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[#HID] shouldStayConnected: %d", (uint8_t *)v13, 8u);
  }

  v4[2](v4, v7);
}

- (void)outReport:(id)a3 componentID:(id)a4 report:(id)a5 withReply:(id)a6
{
  id v11 = a6;
  uint64_t v9 = platform_hid_send_out_report(a3, a4, a5);
  v10 = v11;
  if (v11)
  {
    (*((void (**)(id, uint64_t))v11 + 2))(v11, v9);
    v10 = v11;
  }
}

- (void)getReport:(id)a3 componentID:(id)a4 reportType:(id)a5 reportID:(id)a6 withReply:(id)a7
{
  id v13 = a7;
  uint64_t report = platform_hid_send_get_report(a3, a4, a5, a6);
  id v12 = v13;
  if (v13)
  {
    (*((void (**)(id, uint64_t))v13 + 2))(v13, report);
    id v12 = v13;
  }
}

- (void)componentUpdate:(id)a3 componentID:(id)a4 enabled:(BOOL)a5 withReply:(id)a6
{
  id v11 = a6;
  uint64_t v9 = platform_hid_send_component_update(a3, a4, a5);
  v10 = v11;
  if (v11)
  {
    (*((void (**)(id, uint64_t))v11 + 2))(v11, v9);
    v10 = v11;
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