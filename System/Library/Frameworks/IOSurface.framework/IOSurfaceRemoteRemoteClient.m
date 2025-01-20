@interface IOSurfaceRemoteRemoteClient
- (BOOL)_removeSurface:(unsigned int)a3;
- (IOSurfaceRemoteRemoteClient)initWithRemoteConnection:(id)a3 disconnectedQueue:(id)a4 disconnectedHandler:(id)a5;
- (NSMutableDictionary)surfaceStates;
- (OS_dispatch_queue)disconnectedQueue;
- (OS_xpc_object)remoteConnection;
- (__IOSurfaceClient)_getClient:(unsigned int)a3 inboundExtradata:(id)a4 outboundExtraData:(id *)a5;
- (id)description;
- (id)disconnectedHandler;
- (int)pid;
- (void)_addSurface:(__IOSurfaceClient *)a3 mappedAddress:(void *)a4 mappedSize:(unint64_t)a5 extraData:(id)a6;
- (void)_handleError:(id)a3;
- (void)_handleMessage:(id)a3;
- (void)dealloc;
- (void)setDisconnectedHandler:(id)a3;
- (void)setDisconnectedQueue:(id)a3;
- (void)setPid:(int)a3;
- (void)setRemoteConnection:(id)a3;
- (void)setSurfaceStates:(id)a3;
@end

@implementation IOSurfaceRemoteRemoteClient

- (IOSurfaceRemoteRemoteClient)initWithRemoteConnection:(id)a3 disconnectedQueue:(id)a4 disconnectedHandler:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v8 = (_xpc_connection_s *)a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IOSurfaceRemoteRemoteClient;
  v11 = [(IOSurfaceRemoteRemoteClient *)&v17 init];
  v12 = objc_opt_new();
  [(IOSurfaceRemoteRemoteClient *)v11 setSurfaceStates:v12];

  [(IOSurfaceRemoteRemoteClient *)v11 setDisconnectedQueue:v9];
  [(IOSurfaceRemoteRemoteClient *)v11 setDisconnectedHandler:v10];
  [(IOSurfaceRemoteRemoteClient *)v11 setRemoteConnection:v8];
  [(IOSurfaceRemoteRemoteClient *)v11 setPid:xpc_connection_get_pid(v8)];
  objc_initWeak(&location, v11);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __94__IOSurfaceRemoteRemoteClient_initWithRemoteConnection_disconnectedQueue_disconnectedHandler___block_invoke;
  handler[3] = &unk_1E5D1E030;
  objc_copyWeak(&v15, &location);
  xpc_connection_set_event_handler(v8, handler);
  xpc_connection_activate(v8);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

void __94__IOSurfaceRemoteRemoteClient_initWithRemoteConnection_disconnectedQueue_disconnectedHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (MEMORY[0x1AD0D65F0](v4) == MEMORY[0x1E4F145A8]) {
      [WeakRetained _handleError:v4];
    }
    else {
      [WeakRetained _handleMessage:v4];
    }
  }
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v3 = [(IOSurfaceRemoteRemoteClient *)self remoteConnection];
  xpc_connection_cancel(v3);

  v4.receiver = self;
  v4.super_class = (Class)IOSurfaceRemoteRemoteClient;
  [(IOSurfaceRemoteRemoteClient *)&v4 dealloc];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"IOSurfaceRemoteRemoteClient { remote_pid=%d }", -[IOSurfaceRemoteRemoteClient pid](self, "pid"));
}

- (void)_handleError:(id)a3
{
  v5[5] = *MEMORY[0x1E4F143B8];
  objc_super v4 = [(IOSurfaceRemoteRemoteClient *)self disconnectedQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__IOSurfaceRemoteRemoteClient__handleError___block_invoke;
  v5[3] = &unk_1E5D1E0A8;
  v5[4] = self;
  dispatch_async(v4, v5);
}

void __44__IOSurfaceRemoteRemoteClient__handleError___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) disconnectedHandler];
  v2[2](v2, *(void *)(a1 + 32));
}

- (void)_addSurface:(__IOSurfaceClient *)a3 mappedAddress:(void *)a4 mappedSize:(unint64_t)a5 extraData:(id)a6
{
  id v10 = a6;
  v11 = [NSNumber numberWithUnsignedInt:IOSurfaceClientGetID((uint64_t)a3)];
  v12 = [(IOSurfaceRemoteRemoteClient *)self surfaceStates];
  v13 = [v12 objectForKeyedSubscript:v11];

  if (v13)
  {
    [(IOSurfaceRemotePerSurfacePerClientState *)v13 addClientReferenceToSurfaceWithExtraData:v10];
  }
  else
  {
    v13 = [[IOSurfaceRemotePerSurfacePerClientState alloc] initWithSurface:a3 mappedAddress:a4 mappedSize:a5 extraData:v10];
    v14 = [(IOSurfaceRemoteRemoteClient *)self surfaceStates];
    [v14 setObject:v13 forKeyedSubscript:v11];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[IOSurfaceRemoteRemoteClient _addSurface:mappedAddress:mappedSize:extraData:](self);
  }
}

- (BOOL)_removeSurface:(unsigned int)a3
{
  objc_super v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  uint64_t v5 = [(IOSurfaceRemoteRemoteClient *)self surfaceStates];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    if ([v6 removeClientReferenceToSurface])
    {
      v7 = [(IOSurfaceRemoteRemoteClient *)self surfaceStates];
      [v7 setObject:0 forKeyedSubscript:v4];
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[IOSurfaceRemoteRemoteClient _removeSurface:](self);
    }
  }

  return v6 != 0;
}

- (__IOSurfaceClient)_getClient:(unsigned int)a3 inboundExtradata:(id)a4 outboundExtraData:(id *)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = [NSNumber numberWithUnsignedInt:v6];
  id v10 = [(IOSurfaceRemoteRemoteClient *)self surfaceStates];
  v11 = [v10 objectForKeyedSubscript:v9];

  if (!v11)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v15 = [NSString stringWithUTF8String:"-[IOSurfaceRemoteRemoteClient _getClient:inboundExtradata:outboundExtraData:]"];
    [v14 handleFailureInFunction:v15 file:@"IOSurfaceRemoteServer.m" lineNumber:384 description:@"BUG: Missing state?!?"];
  }
  *a5 = [v11 mergeExtraData:v8];
  v12 = (__IOSurfaceClient *)[v11 surface];

  return v12;
}

- (void)_handleMessage:(id)a3
{
  v19[1] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v6 = xpc_dictionary_get_remote_connection(v4);
  v7 = (_xpc_connection_s *)v6;
  if (reply && v6)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "Method");
    BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    if (uint64 < 0x1B)
    {
      if (v9) {
        -[IOSurfaceRemoteRemoteClient _handleMessage:](uint64, self);
      }
      v12 = _handleMessage__method_dispatch[uint64];
      if (uint64 > 2)
      {
        int v13 = -536870160;
        uint64_t v14 = xpc_dictionary_get_uint64(v4, "SurfaceID");
        uint64_t v15 = v14;
        if (uint64 == 3)
        {
          if ([(IOSurfaceRemoteRemoteClient *)self _removeSurface:v14]) {
            int v13 = 0;
          }
          else {
            int v13 = -536870160;
          }
        }
        else
        {
          xpc_dictionary_set_uint64(reply, "SurfaceID", v14);
          v16 = xpc_dictionary_get_value(v4, "ExtraData");
          v19[0] = 0;
          objc_super v17 = [(IOSurfaceRemoteRemoteClient *)self _getClient:v15 inboundExtradata:v16 outboundExtraData:v19];
          id v18 = v19[0];

          if (v17)
          {
            int v13 = ((uint64_t (*)(IOSurfaceRemoteRemoteClient *, __IOSurfaceClient *, id, xpc_object_t))v12)(self, v17, v4, reply);
            _ioSurfaceAddClientState((uint64_t)v17, v15, reply);
            if (v18) {
              xpc_dictionary_set_value(reply, "ExtraData", v18);
            }
          }
        }
      }
      else
      {
        int v13 = ((uint64_t (*)(IOSurfaceRemoteRemoteClient *, id, xpc_object_t))v12)(self, v4, reply);
      }
      uint64_t v11 = v13;
      id v10 = reply;
    }
    else
    {
      if (v9) {
        -[IOSurfaceRemoteRemoteClient _handleMessage:](self, uint64);
      }
      id v10 = reply;
      uint64_t v11 = -536870201;
    }
    xpc_dictionary_set_uint64(v10, "ErrorCode", v11);
    xpc_connection_send_message(v7, reply);
  }
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSMutableDictionary)surfaceStates
{
  return self->_surfaceStates;
}

- (void)setSurfaceStates:(id)a3
{
}

- (OS_xpc_object)remoteConnection
{
  return self->_remoteConnection;
}

- (void)setRemoteConnection:(id)a3
{
}

- (OS_dispatch_queue)disconnectedQueue
{
  return self->_disconnectedQueue;
}

- (void)setDisconnectedQueue:(id)a3
{
}

- (id)disconnectedHandler
{
  return self->_disconnectedHandler;
}

- (void)setDisconnectedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_disconnectedHandler, 0);
  objc_storeStrong((id *)&self->_disconnectedQueue, 0);
  objc_storeStrong((id *)&self->_remoteConnection, 0);

  objc_storeStrong((id *)&self->_surfaceStates, 0);
}

- (void)_addSurface:(void *)a1 mappedAddress:mappedSize:extraData:.cold.1(void *a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  [a1 pid];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1A7C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Surface %d created by client pid=%d", v1, 0xEu);
}

- (void)_removeSurface:(void *)a1 .cold.1(void *a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  [a1 pid];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1A7C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Surface %d released by client pid=%d", v1, 0xEu);
}

- (void)_handleMessage:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  uint64_t v3 = a2;
  __int16 v4 = 1024;
  int v5 = [a1 pid];
  _os_log_debug_impl(&dword_1A7C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Received unknown client method %lu from client %d", (uint8_t *)&v2, 0x12u);
}

- (void)_handleMessage:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = _handleMessage__method_name[a1];
  int v3 = 134218498;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  uint64_t v6 = v2;
  __int16 v7 = 1024;
  int v8 = [a2 pid];
  _os_log_debug_impl(&dword_1A7C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Received client method %lu (%s) from client %d", (uint8_t *)&v3, 0x1Cu);
}

@end