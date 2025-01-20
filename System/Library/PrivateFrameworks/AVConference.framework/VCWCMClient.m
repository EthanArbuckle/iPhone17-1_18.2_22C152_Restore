@interface VCWCMClient
- (OS_dispatch_queue)connectionQueue;
- (OS_xpc_object)connection;
- (VCWCMClient)init;
- (WCMClientDelegate)wcmClientDelegate;
- (void)dealloc;
- (void)setWcmClientDelegate:(id)a3;
- (void)startWCMClient;
- (void)stopWCMClient;
@end

@implementation VCWCMClient

- (VCWCMClient)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCWCMClient;
  v2 = [(VCWCMClient *)&v5 init];
  if (v2)
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->connectionQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCWCMClient.connectionQueue", 0, CustomRootQueue);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCWCMClient *)self stopWCMClient];
  dispatch_release((dispatch_object_t)self->connectionQueue);

  v3.receiver = self;
  v3.super_class = (Class)VCWCMClient;
  [(VCWCMClient *)&v3 dealloc];
}

- (void)startWCMClient
{
  v3[5] = *MEMORY[0x1E4F143B8];
  connectionQueue = self->connectionQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __29__VCWCMClient_startWCMClient__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(connectionQueue, v3);
}

void __29__VCWCMClient_startWCMClient__block_invoke(uint64_t a1)
{
  keys[1] = *(char **)MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    global_queue = dispatch_get_global_queue(0, 0);
    *(void *)(*(void *)(a1 + 32) + 8) = xpc_connection_create_mach_service("com.apple.WirelessCoexManager", global_queue, 0);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(_xpc_connection_s **)(v3 + 8);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __29__VCWCMClient_startWCMClient__block_invoke_2;
    handler[3] = &unk_1E6DB79C0;
    handler[4] = v3;
    xpc_connection_set_event_handler(v4, handler);
    xpc_connection_resume(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8));
    keys[0] = "kWCMRegisterProcess_ProcessId";
    xpc_object_t v5 = xpc_uint64_create(2uLL);
    xpc_object_t values = v5;
    xpc_object_t v6 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
    *(_OWORD *)v19 = xmmword_1E6DB9E68;
    xpc_object_t v7 = xpc_uint64_create(1uLL);
    v18[0] = v7;
    v18[1] = v6;
    xpc_object_t v8 = xpc_dictionary_create((const char *const *)v19, v18, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8), v8);
    xpc_release(v5);
    xpc_release(v7);
    xpc_release(v6);
    xpc_release(v8);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        v15 = "-[VCWCMClient startWCMClient]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 153;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WCM: WCMClient started.", buf, 0x1Cu);
      }
    }
  }
}

void __29__VCWCMClient_startWCMClient__block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)stopWCMClient
{
  v3[5] = *MEMORY[0x1E4F143B8];
  connectionQueue = self->connectionQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__VCWCMClient_stopWCMClient__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_sync(connectionQueue, v3);
}

void __28__VCWCMClient_stopWCMClient__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2)
  {
    xpc_release(v2);
    *(void *)(*(void *)(a1 + 32) + 8) = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315650;
        uint64_t v6 = v3;
        __int16 v7 = 2080;
        xpc_object_t v8 = "-[VCWCMClient stopWCMClient]_block_invoke";
        __int16 v9 = 1024;
        int v10 = 165;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WCM: WCMClient stopped.", (uint8_t *)&v5, 0x1Cu);
      }
    }
  }
}

- (OS_xpc_object)connection
{
  return self->connection;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->connectionQueue;
}

- (WCMClientDelegate)wcmClientDelegate
{
  return self->wcmClientDelegate;
}

- (void)setWcmClientDelegate:(id)a3
{
}

@end