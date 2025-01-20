@interface CBXpcConnection
- (CBXpcConnection)initWithDelegate:(id)a3 queue:(id)a4 options:(id)a5 sessionType:(int)a6;
- (CBXpcConnectionDelegate)delegate;
- (id)_allocXpcMsg:(unsigned __int16)a3 args:(id)a4;
- (id)_nameForMessage:(unsigned __int16)a3;
- (id)getEventQueue;
- (id)getWhbLocalIdForRemoteId:(id)a3;
- (id)sendSyncMsg:(unsigned __int16)a3 args:(id)a4;
- (void)_applicationDidEnterBackgroundNotification;
- (void)_applicationWillEnterForegroundNotification;
- (void)_checkIn;
- (void)_checkOut;
- (void)_handleConnectionEvent:(id)a3;
- (void)_handleFinalized;
- (void)_handleInvalid;
- (void)_handleMsg:(id)a3;
- (void)_handleReset;
- (void)_sendBarrier;
- (void)connect;
- (void)didReceiveForwardedDelegateCallbackMessage:(id)a3;
- (void)didReceiveForwardedMessage:(id)a3;
- (void)disconnect;
- (void)forwardWhbMsg:(unsigned __int16)a3 args:(id)a4 cnx:(id)a5;
- (void)removeWhbRemoteId:(id)a3;
- (void)sendMsg:(unsigned __int16)a3 args:(id)a4;
- (void)sendMsgWithReply:(unsigned __int16)a3 args:(id)a4 replyBlock:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)setWhbLocalId:(id)a3 forRemoteId:(id)a4;
- (void)setWhbReplyHandler:(id)a3;
@end

@implementation CBXpcConnection

uint64_t __62__CBXpcConnection_initWithDelegate_queue_options_sessionType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleConnectionEvent:a2];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_whbRemoteToLocalUuidMap, 0);
  objc_storeStrong(&self->_whbReplyHandler, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_eventQueue, 0);
}

- (void)disconnect
{
  objc_storeWeak((id *)&self->_delegate, 0);
  [(CBXpcConnection *)self _checkOut];
  id whbReplyHandler = self->_whbReplyHandler;
  self->_id whbReplyHandler = 0;

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];
}

- (void)_checkOut
{
}

- (void)sendMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(CBXpcConnection *)self _allocXpcMsg:v4 args:v6];
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  v8 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    v9 = v8;
    v10 = [(CBXpcConnection *)self _nameForMessage:v4];
    int v11 = 138412546;
    v12 = v10;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_debug_impl(&dword_1AB9F0000, v9, OS_LOG_TYPE_DEBUG, "Sending XPC message %@: %@", (uint8_t *)&v11, 0x16u);

    xpc_connection_send_message(self->_xpcConnection, v7);
    if (!self->_uiAppIsBackgrounded) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  xpc_connection_send_message(self->_xpcConnection, v7);
  if (self->_uiAppIsBackgrounded) {
LABEL_5:
  }
    [(CBXpcConnection *)self _sendBarrier];
LABEL_6:
}

- (id)_allocXpcMsg:(unsigned __int16)a3 args:(id)a4
{
  unsigned int v4 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  *(_OWORD *)keys = xmmword_1E5E33D58;
  id v10 = 0;
  xpc_object_t v9 = xpc_int64_create(v4);
  if (v5)
  {
    CBXpcCreateXPCDictionaryWithNSDictionary(v5);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    size_t v6 = 2;
  }
  else
  {
    size_t v6 = 1;
  }
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, &v9, v6);

  return v7;
}

- (CBXpcConnection)initWithDelegate:(id)a3 queue:(id)a4 options:(id)a5 sessionType:(int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v46.receiver = self;
  v46.super_class = (Class)CBXpcConnection;
  __int16 v13 = [(CBXpcConnection *)&v46 init];
  if (v13)
  {
    id v14 = v13;
    if (v11)
    {
      uint64_t v15 = v11;
    }
    else
    {
      uint64_t v15 = MEMORY[0x1E4F14428];
      id v17 = MEMORY[0x1E4F14428];
    }
    objc_storeWeak((id *)&v14->_delegate, v10);
    if (MGGetBoolAnswer())
    {
      v18 = "com.apple.server.bluetooth.le.att.xpc";
      if (a6 == 3) {
        v18 = "com.apple.server.bluetooth.classic.xpc";
      }
      if (a6 == 2) {
        v19 = "com.apple.server.bluetooth.le.pipe.xpc";
      }
      else {
        v19 = v18;
      }
      label = dispatch_queue_get_label(v15);
      v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v22 = dispatch_queue_create_with_target_V2(label, v21, v15);
      eventQueue = v14->_eventQueue;
      v14->_eventQueue = (OS_dispatch_queue *)v22;

      if (v12) {
        v24 = (NSMutableDictionary *)[v12 mutableCopy];
      }
      else {
        v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      options = v14->_options;
      v14->_options = v24;

      v14->_sessionType = a6;
      int relative_priority_ptr = 0;
      dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(v15, &relative_priority_ptr);
      v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v28 = dispatch_queue_attr_make_with_qos_class(v27, qos_class, relative_priority_ptr);

      v29 = (void *)dispatch_workloop_copy_current();
      v30 = v29;
      if (v29)
      {
        v31 = v29;
        xpcQueue = v14->_xpcQueue;
        v14->_xpcQueue = v31;
      }
      else
      {
        xpcQueue = [NSString stringWithFormat:@"com.apple.CoreBluetooth.%@", objc_opt_class()];
        dispatch_queue_t v33 = dispatch_queue_create((const char *)[(OS_dispatch_queue *)xpcQueue UTF8String], v28);
        v34 = v14->_xpcQueue;
        v14->_xpcQueue = (OS_dispatch_queue *)v33;
      }
      xpc_connection_t mach_service = xpc_connection_create_mach_service(v19, (dispatch_queue_t)v14->_xpcQueue, 0);
      xpcConnection = v14->_xpcConnection;
      v14->_xpcConnection = mach_service;

      v14->_uiAppIsBackgrounded = 0;
      if (NSClassFromString(&cfstr_Uiapplication.isa))
      {
        v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v37 addObserver:v14 selector:sel__applicationDidEnterBackgroundNotification name:@"UIApplicationDidEnterBackgroundNotification" object:0];

        v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v38 addObserver:v14 selector:sel__applicationWillEnterForegroundNotification name:@"UIApplicationWillEnterForegroundNotification" object:0];
      }
      v39 = v14->_xpcConnection;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __62__CBXpcConnection_initWithDelegate_queue_options_sessionType___block_invoke;
      handler[3] = &unk_1E5E31608;
      v16 = v14;
      v44 = v16;
      xpc_connection_set_event_handler(v39, handler);
      xpc_connection_resume(v14->_xpcConnection);
      v16->_xpcConnectionConnected = 0;
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__CBXpcConnection_initWithDelegate_queue_options_sessionType___block_invoke_2;
      block[3] = &unk_1E5E31248;
      v42 = v14;
      dispatch_async(v15, block);

      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)connect
{
  if (!self->_xpcConnectionConnected)
  {
    self->_xpcConnectionConnected = 1;
    [(CBXpcConnection *)self _checkIn];
    options = self->_options;
    [(NSMutableDictionary *)options removeObjectForKey:@"kCBInitOptionShowPowerAlert"];
  }
}

- (void)_checkIn
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  unsigned int v4 = [v3 bundleIdentifier];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [NSString stringWithUTF8String:getprogname()];
  }
  xpc_object_t v7 = v6;

  options = self->_options;
  v11[0] = @"kCBMsgArgOptions";
  v11[1] = @"kCBMsgArgName";
  v12[0] = options;
  v12[1] = v7;
  v11[2] = @"kCBMsgArgType";
  xpc_object_t v9 = [NSNumber numberWithUnsignedInt:self->_sessionType];
  v11[3] = @"kCBMsgArgVersion";
  v12[2] = v9;
  v12[3] = &unk_1F0301BB8;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  [(CBXpcConnection *)self sendMsg:1 args:v10];
}

- (void)_handleConnectionEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MEMORY[0x1AD1120E0]();
  if (v5 == MEMORY[0x1E4F14590])
  {
    [(CBXpcConnection *)self _handleMsg:v4];
  }
  else if (v5 == MEMORY[0x1E4F145A8])
  {
    if (v4 == (id)MEMORY[0x1E4F14520])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

      if (WeakRetained) {
        [(CBXpcConnection *)self _handleReset];
      }
      else {
        [(CBXpcConnection *)self _handleFinalized];
      }
LABEL_6:

      return;
    }
    if (v4 == (id)MEMORY[0x1E4F14528])
    {
      [(CBXpcConnection *)self _handleInvalid];
    }
    else
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      __int16 v13 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      -[CBXpcConnection _handleConnectionEvent:]((uint64_t)v4, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    id v6 = CBLogComponent;
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    -[CBXpcConnection _handleConnectionEvent:]((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (void)_handleMsg:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned __int16 int64 = xpc_dictionary_get_int64(v4, "kCBMsgId");
  id v6 = xpc_dictionary_get_value(v4, "kCBMsgArgs");
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = CBXpcCreateNSDictionaryWithXpcDictionary(v6);
    if (!IsAppleInternalBuild()) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (!IsAppleInternalBuild()) {
      goto LABEL_8;
    }
  }
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  uint64_t v9 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = v9;
    uint64_t v11 = [(CBXpcConnection *)self _nameForMessage:int64];
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    v20 = v8;
    _os_log_debug_impl(&dword_1AB9F0000, v10, OS_LOG_TYPE_DEBUG, "Received XPC message %@: %@", buf, 0x16u);

    if (int64 == 5) {
      goto LABEL_9;
    }
LABEL_11:
    eventQueue = self->_eventQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __30__CBXpcConnection__handleMsg___block_invoke;
    v13[3] = &unk_1E5E33D70;
    v13[4] = self;
    unsigned __int16 v16 = int64;
    id v14 = v8;
    id v15 = v4;
    dispatch_async(eventQueue, v13);

    goto LABEL_12;
  }
LABEL_8:
  if (int64 != 5) {
    goto LABEL_11;
  }
LABEL_9:
  [(CBXpcConnection *)self _handleFinalized];
LABEL_12:
}

- (void)_handleInvalid
{
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1AB9F0000, v0, OS_LOG_TYPE_ERROR, "XPC connection invalid", v1, 2u);
}

- (void)_handleFinalized
{
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1AB9F0000, v0, OS_LOG_TYPE_DEBUG, "XPC connection finalized", v1, 2u);
}

void __33__CBXpcConnection__handleInvalid__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 xpcConnectionIsInvalid];
}

uint64_t __30__CBXpcConnection__handleMsg___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 xpcConnectionDidReceiveMsg:*(unsigned __int16 *)(a1 + 56) args:*(void *)(a1 + 40)];

  uint64_t result = *(void *)(*(void *)(a1 + 32) + 56);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (CBXpcConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CBXpcConnectionDelegate *)WeakRetained;
}

void __62__CBXpcConnection_initWithDelegate_queue_options_sessionType___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 xpcConnectionIsInvalid];
}

- (id)getEventQueue
{
  return self->_eventQueue;
}

- (id)sendSyncMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = (OS_dispatch_queue *)a4;
  id v7 = [(CBXpcConnection *)self _allocXpcMsg:v4 args:v6];
  if (v4 != 63)
  {
    if (CBLogInitOnce == -1)
    {
      uint64_t v12 = (void *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_8;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      uint64_t v12 = (void *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_8;
      }
    }
    uint64_t v9 = v12;
    uint64_t v10 = [(CBXpcConnection *)self _nameForMessage:v4];
    int v20 = 138412546;
    uint64_t v21 = v10;
    __int16 v22 = 2112;
    v23 = v6;
    _os_log_debug_impl(&dword_1AB9F0000, v9, OS_LOG_TYPE_DEBUG, "Sending synchronous XPC message %@: %@", (uint8_t *)&v20, 0x16u);
    goto LABEL_5;
  }
  if (CBLogInitOnce == -1)
  {
    uint64_t v8 = (void *)CBLogComponent;
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    goto LABEL_4;
  }
  dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  uint64_t v8 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
LABEL_4:
    uint64_t v9 = v8;
    uint64_t v10 = [(CBXpcConnection *)self _nameForMessage:63];
    xpcQueue = self->_xpcQueue;
    int v20 = 138412803;
    uint64_t v21 = v10;
    __int16 v22 = 2112;
    v23 = xpcQueue;
    __int16 v24 = 2113;
    v25 = v6;
    _os_log_impl(&dword_1AB9F0000, v9, OS_LOG_TYPE_DEFAULT, "Sending synchronous XPC message %@ : on %@ with args: %{private}@", (uint8_t *)&v20, 0x20u);
LABEL_5:
  }
LABEL_8:
  xpc_object_t v13 = xpc_connection_send_message_with_reply_sync(self->_xpcConnection, v7);
  id v14 = v13;
  if (v13)
  {
    CBXpcCreateNSDictionaryWithXpcDictionary(v13);
    id v15 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    if (CBLogInitOnce == -1) {
      goto LABEL_10;
    }
LABEL_15:
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    unsigned __int16 v16 = (void *)CBLogComponent;
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_11;
    }
    goto LABEL_16;
  }
  id v15 = 0;
  if (CBLogInitOnce != -1) {
    goto LABEL_15;
  }
LABEL_10:
  unsigned __int16 v16 = (void *)CBLogComponent;
  if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_11;
  }
LABEL_16:
  uint64_t v18 = v16;
  __int16 v19 = [(CBXpcConnection *)self _nameForMessage:v4];
  int v20 = 138412546;
  uint64_t v21 = v19;
  __int16 v22 = 2112;
  v23 = v15;
  _os_log_debug_impl(&dword_1AB9F0000, v18, OS_LOG_TYPE_DEBUG, "Received synchronous XPC reply %@: %@", (uint8_t *)&v20, 0x16u);

LABEL_11:

  return v15;
}

- (void)sendMsgWithReply:(unsigned __int16)a3 args:(id)a4 replyBlock:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CBXpcConnection *)self _allocXpcMsg:v6 args:v8];
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  uint64_t v11 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    id v15 = v11;
    unsigned __int16 v16 = [(CBXpcConnection *)self _nameForMessage:v6];
    *(_DWORD *)buf = 138412546;
    int v20 = v16;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_debug_impl(&dword_1AB9F0000, v15, OS_LOG_TYPE_DEBUG, "Sending XPC message w/ reply %@: %@", buf, 0x16u);
  }
  xpcConnection = self->_xpcConnection;
  eventQueue = self->_eventQueue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __52__CBXpcConnection_sendMsgWithReply_args_replyBlock___block_invoke;
  handler[3] = &unk_1E5E32250;
  id v18 = v9;
  id v14 = v9;
  xpc_connection_send_message_with_reply(xpcConnection, v10, eventQueue, handler);
}

void __52__CBXpcConnection_sendMsgWithReply_args_replyBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = CBXpcCreateNSDictionaryWithXpcDictionary(v3);

  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v5, v6);
}

- (void)forwardWhbMsg:(unsigned __int16)a3 args:(id)a4 cnx:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  unsigned int v10 = convertToWhbMsgId(v6);
  if (v10)
  {
    xpc_dictionary_set_int64(v9, "kCBMsgId", v10);
    if (v7)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v7];
      [v11 removeObjectForKey:@"kCBMsgArgDeviceUUID"];
      uint64_t v12 = [v8 peerDevice];
      xpc_object_t v13 = [v12 identifier];
      [v11 setValue:v13 forKey:@"kCBMsgArgDeviceUUID"];

      id v14 = CBXpcCreateXPCDictionaryWithNSDictionary(v11);
      xpc_dictionary_set_value(v9, "kCBMsgArgs", v14);
    }
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    id v15 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      xpc_object_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1AB9F0000, v15, OS_LOG_TYPE_DEFAULT, "Forwarding WHB XPC message %@: %@", (uint8_t *)&v16, 0x16u);
    }
    [v8 xpcForwardMessage:v9];
  }
  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBXpcConnection forwardWhbMsg:args:cnx:]();
    }
  }
}

- (void)didReceiveForwardedMessage:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 int64 = xpc_dictionary_get_int64(v4, "kCBMsgId");
  uint64_t v6 = convertToCBMsgId(int64);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = xpc_dictionary_get_value(v4, "kCBMsgArgs");
    xpc_object_t v9 = v8;
    if (v8)
    {
      CBXpcCreateNSDictionaryWithXpcDictionary(v8);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = (void *)[v10 mutableCopy];
      uint64_t v12 = [v10 valueForKey:@"kCBMsgArgDeviceUUID"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v14 = [v10 valueForKey:@"kCBMsgArgDeviceUUID"];
        if (v14)
        {
          [v11 removeObjectForKey:@"kCBMsgArgDeviceUUID"];
          id v15 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v14];
          [v11 setValue:v15 forKey:@"kCBMsgArgDeviceUUID"];
        }
        id v16 = v11;
      }
      else
      {
        id v16 = v10;
      }
    }
    else
    {
      id v16 = 0;
    }
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    xpc_object_t v17 = (void *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    {
      __int16 v18 = v17;
      id v19 = [(CBXpcConnection *)self _nameForMessage:v7];
      int v20 = 138412546;
      __int16 v21 = v19;
      __int16 v22 = 2112;
      id v23 = v16;
      _os_log_debug_impl(&dword_1AB9F0000, v18, OS_LOG_TYPE_DEBUG, "WHB forwarded (Initiator->Receiver bluetoothd) msg %@, args %@", (uint8_t *)&v20, 0x16u);
    }
    [(CBXpcConnection *)self sendMsg:v7 args:v16];
  }
  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBXpcConnection didReceiveForwardedMessage:]();
    }
  }
}

- (void)didReceiveForwardedDelegateCallbackMessage:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  __int16 int64 = xpc_dictionary_get_int64(v4, "kCBMsgId");
  uint64_t v7 = convertToCBMsgId(int64);
  if (v7)
  {
    uint64_t v8 = v7;
    xpc_dictionary_set_int64(v5, "kCBMsgId", v7);
    xpc_object_t v9 = xpc_dictionary_get_value(v4, "kCBMsgArgs");
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = CBXpcCreateNSDictionaryWithXpcDictionary(v9);
      __int16 v18 = [v11 valueForKey:@"kCBMsgArgDeviceUUID"];
      uint64_t v12 = -[CBXpcConnection getWhbLocalIdForRemoteId:](self, "getWhbLocalIdForRemoteId:");
      xpc_object_t v13 = (void *)[v11 mutableCopy];
      [v13 removeObjectForKey:@"kCBMsgArgDeviceUUID"];
      [v13 setValue:v12 forKey:@"kCBMsgArgDeviceUUID"];
      id v14 = CBXpcCreateXPCDictionaryWithNSDictionary(v13);
      xpc_dictionary_set_value(v5, "kCBMsgArgs", v14);
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      id v15 = (void *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      {
        id v16 = v15;
        xpc_object_t v17 = [(CBXpcConnection *)self _nameForMessage:v8];
        *(_DWORD *)buf = 138412546;
        int v20 = v17;
        __int16 v21 = 2112;
        __int16 v22 = v13;
        _os_log_debug_impl(&dword_1AB9F0000, v16, OS_LOG_TYPE_DEBUG, "WHB reply (Receiver->Initiator) msg %@ %@", buf, 0x16u);
      }
    }
    [(CBXpcConnection *)self _handleMsg:v5];
  }
  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBXpcConnection didReceiveForwardedDelegateCallbackMessage:]();
    }
  }
}

- (void)setWhbReplyHandler:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__CBXpcConnection_setWhbReplyHandler___block_invoke;
  v8[3] = &unk_1E5E33D38;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x1AD111AA0](v8);
  id whbReplyHandler = self->_whbReplyHandler;
  self->_id whbReplyHandler = v6;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __38__CBXpcConnection_setWhbReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  unsigned __int16 int64 = xpc_dictionary_get_int64(v3, "kCBMsgId");
  uint64_t v6 = convertToWhbMsgId(int64);
  if (v6)
  {
    uint64_t v7 = v6;
    xpc_dictionary_set_int64(v4, "kCBMsgId", v6);
    uint64_t v8 = xpc_dictionary_get_value(v3, "kCBMsgArgs");
    id v9 = v8;
    if (v8)
    {
      CBXpcCreateNSDictionaryWithXpcDictionary(v8);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = (void *)[v10 mutableCopy];
      uint64_t v12 = [v10 valueForKey:@"kCBMsgArgDeviceUUID"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v14 = [v10 valueForKey:@"kCBMsgArgDeviceUUID"];
        if (v14)
        {
          [v11 removeObjectForKey:@"kCBMsgArgDeviceUUID"];
          id v15 = [v14 UUIDString];
          [v11 setValue:v15 forKey:@"kCBMsgArgDeviceUUID"];
        }
        id v16 = v11;
      }
      else
      {
        id v16 = v10;
      }

      xpc_object_t v17 = CBXpcCreateXPCDictionaryWithNSDictionary(v16);
      xpc_dictionary_set_value(v4, "kCBMsgArgs", v17);
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      __int16 v18 = (void *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      {
        id v19 = v18;
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        __int16 v21 = [WeakRetained _nameForMessage:v7];
        int v22 = 138412546;
        uint64_t v23 = v21;
        __int16 v24 = 2112;
        id v25 = v10;
        _os_log_debug_impl(&dword_1AB9F0000, v19, OS_LOG_TYPE_DEBUG, "WhbReplyHandler w/ msgId %@ args %@", (uint8_t *)&v22, 0x16u);
      }
    }
    else
    {
      id v16 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      __38__CBXpcConnection_setWhbReplyHandler___block_invoke_cold_1();
    }
  }
}

- (void)setWhbLocalId:(id)a3 forRemoteId:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_whbRemoteToLocalUuidMap)
  {
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    whbRemoteToLocalUuidMap = self->_whbRemoteToLocalUuidMap;
    self->_whbRemoteToLocalUuidMap = v8;
  }
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  id v10 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1AB9F0000, v10, OS_LOG_TYPE_DEFAULT, "Started tracking Whb localId %@ with remoteId %@", (uint8_t *)&v11, 0x16u);
  }
  [(NSMutableDictionary *)self->_whbRemoteToLocalUuidMap setValue:v6 forKey:v7];
}

- (id)getWhbLocalIdForRemoteId:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_whbRemoteToLocalUuidMap valueForKey:a3];
}

- (void)removeWhbRemoteId:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  id v5 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1AB9F0000, v5, OS_LOG_TYPE_DEFAULT, "Removing tracking of remoteId %@", (uint8_t *)&v6, 0xCu);
  }
  [(NSMutableDictionary *)self->_whbRemoteToLocalUuidMap removeObjectForKey:v4];
}

- (void)setTargetQueue:(id)a3
{
  xpcQueue = a3;
  if (!a3) {
    xpcQueue = self->_xpcQueue;
  }
  xpcConnection = self->_xpcConnection;
  id v5 = a3;
  xpc_connection_set_target_queue(xpcConnection, xpcQueue);
}

- (void)_sendBarrier
{
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1AB9F0000, v0, OS_LOG_TYPE_DEBUG, "Sending XPC barrier", v1, 2u);
}

intptr_t __31__CBXpcConnection__sendBarrier__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_nameForMessage:(unsigned __int16)a3
{
  id v3 = [NSNumber numberWithUnsignedShort:a3];
  id v4 = [v3 stringValue];

  return v4;
}

- (void)_handleReset
{
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1AB9F0000, v0, OS_LOG_TYPE_ERROR, "XPC connection interrupted, resetting", v1, 2u);
}

void __31__CBXpcConnection__handleReset__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _checkIn];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 xpcConnectionDidReset];
}

- (void)_applicationDidEnterBackgroundNotification
{
  self->_uiAppIsBackgrounded = 1;
  [(CBXpcConnection *)self _sendBarrier];
}

- (void)_applicationWillEnterForegroundNotification
{
  self->_uiAppIsBackgrounded = 0;
}

- (void)setDelegate:(id)a3
{
}

- (void)forwardWhbMsg:args:cnx:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_3(&dword_1AB9F0000, v0, v1, "Invalid WHMsgId %d. Ignoring forwarding", v2, v3, v4, v5, v6);
}

- (void)didReceiveForwardedMessage:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_3(&dword_1AB9F0000, v0, v1, "Invalid CBMsgId %d. Ignoring receive forwarding", v2, v3, v4, v5, v6);
}

- (void)didReceiveForwardedDelegateCallbackMessage:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_3(&dword_1AB9F0000, v0, v1, "Invalid CBMsgId %d. Ignoring XPC msg", v2, v3, v4, v5, v6);
}

void __38__CBXpcConnection_setWhbReplyHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_3(&dword_1AB9F0000, v0, v1, "Invalid WHBMsgId %d. Ignoring reply", v2, v3, v4, v5, v6);
}

- (void)_handleConnectionEvent:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleConnectionEvent:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end