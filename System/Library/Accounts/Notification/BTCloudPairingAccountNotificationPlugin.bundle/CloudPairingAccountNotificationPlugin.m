@interface CloudPairingAccountNotificationPlugin
- (OS_xpc_object)cloudKitConnection;
- (id)daemonConection;
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
- (void)account:(id)a3 didPerformActionsForDataclasses:(id)a4;
- (void)accountModified;
- (void)setCloudKitConnection:(id)a3;
@end

@implementation CloudPairingAccountNotificationPlugin

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v25 = a4;
    __int16 v26 = 2112;
    id v27 = v12;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl(&dword_240571000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[BluetoothUserAccountPlugin] changeType: %d oldAccount: %@ account: %@", buf, 0x1Cu);
  }
  if (v10) {
    v13 = v10;
  }
  else {
    v13 = v12;
  }
  id v14 = v13;
  v15 = [v14 accountType];
  v16 = [v15 identifier];
  char v17 = [v16 isEqualToString:*MEMORY[0x263EFAE58]];

  if (v17)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_240572BCC;
    block[3] = &unk_2650C1C10;
    int v23 = a4;
    id v19 = v10;
    id v20 = v14;
    id v21 = v12;
    v22 = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_240571000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[BluetoothUserAccountPlugin] No Apple Account Identifier Found", buf, 2u);
  }
}

- (void)account:(id)a3 didPerformActionsForDataclasses:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_240571000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[BluetoothUserAccountPlugin] didPerformActionsForDataclasses: %@ for account: %@", (uint8_t *)&v8, 0x16u);
  }
  if ((([v7 containsObject:*MEMORY[0x263EFAC30]] & 1) != 0
     || ([v7 containsObject:*MEMORY[0x263EFAD00]] & 1) != 0
     || ([v7 containsObject:*MEMORY[0x263EFAC38]] & 1) != 0
     || ([v7 containsObject:*MEMORY[0x263EFAD48]] & 1) != 0
     || [v7 containsObject:*MEMORY[0x263EFACB0]])
    && [v6 isActive]
    && [v6 isAuthenticated])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_240571000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[BluetoothUserAccountPlugin] interested account properties changed: %@ for account: %@", (uint8_t *)&v8, 0x16u);
    }
    [(CloudPairingAccountNotificationPlugin *)self accountModified];
  }
}

- (id)daemonConection
{
  v3 = [(CloudPairingAccountNotificationPlugin *)self cloudKitConnection];

  if (v3)
  {
LABEL_6:
    __int16 v10 = [(CloudPairingAccountNotificationPlugin *)self cloudKitConnection];
    goto LABEL_7;
  }
  v4 = dispatch_get_global_queue(2, 0);
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.BTServer.cloudpairing", v4, 2uLL);
  [(CloudPairingAccountNotificationPlugin *)self setCloudKitConnection:mach_service];

  id v6 = [(CloudPairingAccountNotificationPlugin *)self cloudKitConnection];

  BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v7)
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_240571000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[BluetoothUserAccountPlugin] Got to connect to cloudpaird", v12, 2u);
    }
    int v8 = [(CloudPairingAccountNotificationPlugin *)self cloudKitConnection];
    xpc_connection_set_event_handler(v8, &unk_26F4A5E58);

    id v9 = [(CloudPairingAccountNotificationPlugin *)self cloudKitConnection];
    xpc_connection_resume(v9);

    goto LABEL_6;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_240571000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[BluetoothUserAccountPlugin] Failed to connect to cloudpaird", buf, 2u);
  }
  __int16 v10 = 0;
LABEL_7:
  return v10;
}

- (void)accountModified
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_240571000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[BluetoothUserAccountPlugin] primaryAccountModified", v6, 2u);
  }
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "kMsgId", (const char *)[@"SignInStatusChanged" UTF8String]);
  v4 = [(CloudPairingAccountNotificationPlugin *)self daemonConection];

  if (v4)
  {
    v5 = [(CloudPairingAccountNotificationPlugin *)self daemonConection];
    xpc_connection_send_message(v5, v3);
  }
}

- (OS_xpc_object)cloudKitConnection
{
  return self->_cloudKitConnection;
}

- (void)setCloudKitConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end