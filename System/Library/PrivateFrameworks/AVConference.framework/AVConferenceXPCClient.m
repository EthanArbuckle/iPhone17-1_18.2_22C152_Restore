@interface AVConferenceXPCClient
+ (id)AVConferenceXPCClientSingleton;
- (AVConferenceXPCClient)init;
- (BOOL)connectionPersists;
- (NSMutableDictionary)registeredBlocks;
- (OS_xpc_object)connection;
- (id)copyConnection;
- (id)createConnectionToServer;
- (id)newNSDictionaryFromNSDictionary:(id)a3;
- (id)newNSDictionaryFromNSError:(id)a3;
- (id)newNSDictionaryFromXPCDictionary:(id)a3;
- (id)newNSErrorFromNSDictionary:(id)a3;
- (id)newServerDiedDictionary;
- (id)newTimeoutDictionary;
- (id)newXPCDictionaryFromNSDictionary:(id)a3 error:(id *)a4;
- (id)sendMessageSync:(char *)a3;
- (id)sendMessageSync:(char *)a3 arguments:(id)a4;
- (id)sendMessageSync:(char *)a3 arguments:(id)a4 xpcArguments:(id)a5;
- (void)closeConnectionToServer;
- (void)dealloc;
- (void)deregisterFromService:(char *)a3;
- (void)registerBlockForService:(char *)a3 block:(id)a4;
- (void)registerBlockForService:(char *)a3 block:(id)a4 queue:(id)a5;
- (void)registerBlockForService:(char *)a3 block:(id)a4 queue:(id)global_queue eventLogLevel:(int)a6;
- (void)sendMessageAsync:(char *)a3;
- (void)sendMessageAsync:(char *)a3 arguments:(id)a4;
- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 reply:(id)a5;
- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 reply:(id)a5 queue:(id)a6;
- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 xpcArguments:(id)a5 reply:(id)a6;
- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 xpcArguments:(id)a5 reply:(id)a6 queue:(id)a7;
- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 xpcArguments:(id)a5 reply:(id)a6 queue:(id)a7 replyLogLevel:(int)a8;
- (void)setConnectionPersists:(BOOL)a3;
@end

@implementation AVConferenceXPCClient

uint64_t __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_75(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

xpc_object_t __39__AVConferenceXPCClient_copyConnection__block_invoke(uint64_t a1)
{
  xpc_object_t result = *(xpc_object_t *)(*(void *)(a1 + 32) + 8);
  if (result)
  {
    xpc_object_t result = xpc_retain(result);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

void __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_65(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MEMORY[0x1E4E59BB0](a2);
  if (v3 == MEMORY[0x1E4F145A8])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E4F14530]);
        *(_DWORD *)buf = 136315906;
        uint64_t v42 = v15;
        __int16 v43 = 2080;
        v44 = "-[AVConferenceXPCClient createConnectionToServer]_block_invoke";
        __int16 v45 = 1024;
        int v46 = 272;
        __int16 v47 = 2080;
        uint64_t v48 = (uint64_t)string;
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d XPC Client: Cannot talk to server because server died or parent deallocated, %s", buf, 0x26u);
      }
    }
    v18 = (void *)[*(id *)(a1 + 32) newServerDiedDictionary];
    id obja = *(id *)(*(void *)(a1 + 32) + 16);
    objc_sync_enter(obja);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v19 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v36 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v19);
          }
          v23 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(*((void *)&v37 + 1) + 8 * i)];
          uint64_t v24 = [v23 block];
          v25 = [v23 queue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_66;
          block[3] = &unk_1E6DB5000;
          block[4] = v18;
          block[5] = v24;
          dispatch_async(v25, block);
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v36 count:16];
      }
      while (v20);
    }
    objc_sync_exit(obja);

    [*(id *)(a1 + 32) closeConnectionToServer];
  }
  else
  {
    if (v3 != MEMORY[0x1E4F14590]) {
      return;
    }
    uint64_t v4 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(a2, "API"));
    id obj = *(id *)(*(void *)(a1 + 32) + 16);
    objc_sync_enter(obj);
    v5 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v4];
    if (v5)
    {
      xpc_object_t value = xpc_dictionary_get_value(a2, "XPCARGUMENTS");
      v7 = value;
      if (value)
      {
        xpc_retain(value);
        xpc_dictionary_set_value(a2, "XPCARGUMENTS", 0);
      }
      v8 = (void *)[*(id *)(a1 + 32) newNSDictionaryFromXPCDictionary:a2];
      v9 = (void *)[v8 mutableCopy];
      v10 = objc_msgSend(*(id *)(a1 + 32), "newNSErrorFromNSDictionary:", objc_msgSend(v8, "objectForKeyedSubscript:", @"ERROR"));
      if (v7)
      {
        [v9 setObject:v7 forKeyedSubscript:@"USERXPCARGUMENTS"];
        xpc_release(v7);
      }
      uint64_t v11 = [v5 block];
      v12 = [v5 queue];
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if ((int)[v5 eventLogLevel] > ErrorLogLevelForModule || (int)objc_msgSend(v5, "eventLogLevel") < 1) {
        goto LABEL_43;
      }
      [v5 eventLogLevel];
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      if ((int)[v5 eventLogLevel] <= 2)
      {
        if ((VRTraceIsOSFaultDisabled() & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT)) {
            __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_65_cold_3();
          }
          goto LABEL_43;
        }
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
LABEL_13:
        }
          __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_65_cold_2();
LABEL_43:
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_75;
        v34[3] = &unk_1E6DB4F60;
        v34[5] = v10;
        v34[6] = v11;
        v34[4] = v9;
        dispatch_async(v12, v34);

        objc_sync_exit(obj);
        return;
      }
      if ((int)[v5 eventLogLevel] <= 4)
      {
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_43;
        }
        goto LABEL_13;
      }
      if ((int)[v5 eventLogLevel] > 7)
      {
        if ((int)[v5 eventLogLevel] > 8) {
          goto LABEL_43;
        }
        v29 = *MEMORY[0x1E4F47A50];
        v30 = *MEMORY[0x1E4F47A50];
        if (!*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
            __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_65_cold_5();
          }
          goto LABEL_43;
        }
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_43;
        }
      }
      else
      {
        v29 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_43;
        }
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v42 = v14;
      __int16 v43 = 2080;
      v44 = "-[AVConferenceXPCClient createConnectionToServer]_block_invoke";
      __int16 v45 = 1024;
      int v46 = 313;
      __int16 v47 = 2112;
      uint64_t v48 = v4;
      _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d XPC Client: processing registered reply for service %@", buf, 0x26u);
      goto LABEL_43;
    }
    objc_sync_exit(obj);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E4F47A50];
      v28 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v42 = v26;
          __int16 v43 = 2080;
          v44 = "-[AVConferenceXPCClient createConnectionToServer]_block_invoke_2";
          __int16 v45 = 1024;
          int v46 = 328;
          __int16 v47 = 2112;
          uint64_t v48 = v4;
          _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d XPC Client: no registered block found for service %@", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_65_cold_1();
      }
    }
  }
}

- (id)newNSErrorFromNSDictionary:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v5 = [a3 objectForKeyedSubscript:@"ERROR_DOMAIN"];
  uint64_t v6 = (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"ERROR_CODE"), "intValue");
  uint64_t v7 = [a3 objectForKeyedSubscript:@"ERROR_USERINFO"];

  return (id)[v4 initWithDomain:v5 code:v6 userInfo:v7];
}

- (id)newNSDictionaryFromXPCDictionary:(id)a3
{
  if (!a3) {
    return 0;
  }
  xpc_dictionary_get_value(a3, "RESULTS");

  return (id)_CFXPCCreateCFObjectFromXPCObject();
}

- (void)registerBlockForService:(char *)a3 block:(id)a4 queue:(id)global_queue eventLogLevel:(int)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    uint64_t v7 = *(void *)&a6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      v13 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 136315906;
          uint64_t v18 = v11;
          __int16 v19 = 2080;
          uint64_t v20 = "-[AVConferenceXPCClient registerBlockForService:block:queue:eventLogLevel:]";
          __int16 v21 = 1024;
          int v22 = 533;
          __int16 v23 = 2080;
          uint64_t v24 = a3;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d XPC Client: Adding registered block for service %s", (uint8_t *)&v17, 0x26u);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        -[AVConferenceXPCClient registerBlockForService:block:queue:eventLogLevel:]();
      }
    }
    uint64_t v14 = (void *)[[NSString alloc] initWithCString:a3 encoding:4];
    if (!global_queue) {
      global_queue = dispatch_get_global_queue(2, 0);
    }
    registeredBlocks = self->registeredBlocks;
    objc_sync_enter(registeredBlocks);
    v16 = (XPCClientUser *)[(NSMutableDictionary *)self->registeredBlocks objectForKeyedSubscript:v14];
    if (!v16)
    {
      v16 = objc_alloc_init(XPCClientUser);
      [(NSMutableDictionary *)self->registeredBlocks setObject:v16 forKeyedSubscript:v14];
    }
    [(XPCClientUser *)v16 setBlock:a4];
    [(XPCClientUser *)v16 setQueue:global_queue];
    [(XPCClientUser *)v16 setEventLogLevel:v7];
    objc_sync_exit(registeredBlocks);
  }
}

- (id)sendMessageSync:(char *)a3 arguments:(id)a4 xpcArguments:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  id v8 = [(AVConferenceXPCClient *)self newXPCDictionaryFromNSDictionary:a4 error:0];
  xpc_dictionary_set_string(v8, "API", a3);
  if (a5) {
    xpc_dictionary_set_value(v8, "XPCARGUMENTS", a5);
  }
  if ([(AVConferenceXPCClient *)self connectionPersists]) {
    xpc_dictionary_set_BOOL(v8, "USERPERSISTENT", 1);
  }
  xpc_dictionary_set_BOOL(v8, "EXPECTSREPLY", 1);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315906;
        uint64_t v21 = v9;
        __int16 v22 = 2080;
        __int16 v23 = "-[AVConferenceXPCClient sendMessageSync:arguments:xpcArguments:]";
        __int16 v24 = 1024;
        int v25 = 485;
        __int16 v26 = 2080;
        v27 = a3;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d XPC Client: Sending sync message to server for service: %s", (uint8_t *)&v20, 0x26u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[AVConferenceXPCClient sendMessageSync:arguments:xpcArguments:]();
    }
  }
  v13 = [(AVConferenceXPCClient *)self copyConnection];
  xpc_object_t v14 = xpc_connection_send_message_with_reply_sync(v13, v8);
  uint64_t v15 = MEMORY[0x1E4E59BB0]();
  if (v15 == MEMORY[0x1E4F145A8])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      int v17 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVConferenceXPCClient sendMessageSync:arguments:xpcArguments:](v17, v14);
      }
    }
    id v16 = [(AVConferenceXPCClient *)self newServerDiedDictionary];
    [(AVConferenceXPCClient *)self closeConnectionToServer];
  }
  else
  {
    if (v15 == MEMORY[0x1E4F14590])
    {
      id v16 = [(AVConferenceXPCClient *)self newNSDictionaryFromXPCDictionary:v14];
      id v18 = -[AVConferenceXPCClient newNSErrorFromNSDictionary:](self, "newNSErrorFromNSDictionary:", [v16 objectForKeyedSubscript:@"ERROR"]);
      goto LABEL_22;
    }
    id v16 = 0;
  }
  id v18 = 0;
LABEL_22:
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v19 addEntriesFromDictionary:v16];
  objc_msgSend(v19, "setObject:forKeyedSubscript:", xpc_dictionary_get_value(v14, "XPCARGUMENTS"), @"USERXPCARGUMENTS");
  if (v18) {
    [v19 setObject:v18 forKeyedSubscript:@"ERROR"];
  }

  xpc_release(v14);
  xpc_release(v8);
  xpc_release(v13);
  return v19;
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 xpcArguments:(id)a5 reply:(id)a6 queue:(id)a7 replyLogLevel:(int)a8
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  if (a3)
  {
    global_queue = a7;
    id v15 = a4;
    id v16 = [(AVConferenceXPCClient *)self newXPCDictionaryFromNSDictionary:a4 error:&v26];
    int v17 = v16;
    if (v26)
    {
      if (v16) {
        xpc_release(v16);
      }
      if (a6) {
        (*((void (**)(id, void, uint64_t))a6 + 2))(a6, 0, v26);
      }
    }
    else
    {
      if (a5) {
        xpc_dictionary_set_value(v16, "XPCARGUMENTS", a5);
      }
      if ([(AVConferenceXPCClient *)self connectionPersists]) {
        xpc_dictionary_set_BOOL(v17, "USERPERSISTENT", 1);
      }

      xpc_dictionary_set_string(v17, "API", a3);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        uint64_t v21 = *MEMORY[0x1E4F47A50];
        __int16 v22 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v28 = v20;
            __int16 v29 = 2080;
            v30 = "-[AVConferenceXPCClient sendMessageAsync:arguments:xpcArguments:reply:queue:replyLogLevel:]";
            __int16 v31 = 1024;
            int v32 = 403;
            __int16 v33 = 2080;
            v34 = a3;
            _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d XPC Client: Sending message to server for service: %s", buf, 0x26u);
          }
        }
        else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          -[AVConferenceXPCClient sendMessageAsync:arguments:xpcArguments:reply:queue:replyLogLevel:]();
        }
      }
      __int16 v23 = [(AVConferenceXPCClient *)self copyConnection];
      if (a6)
      {
        if (!global_queue) {
          global_queue = dispatch_get_global_queue(2, 0);
        }
        dispatch_retain(global_queue);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke;
        v24[3] = &unk_1E6DB8550;
        int v25 = a8;
        v24[4] = self;
        v24[5] = global_queue;
        v24[6] = a6;
        v24[7] = a3;
        xpc_dictionary_set_BOOL(v17, "EXPECTSREPLY", 1);
        xpc_retain(v17);
        xpc_connection_send_message_with_reply(v23, v17, (dispatch_queue_t)self->replyQueue, v24);
      }
      else
      {
        xpc_dictionary_set_BOOL(v17, "EXPECTSREPLY", 0);
        xpc_retain(v17);
        xpc_connection_send_message(v23, v17);
      }
      xpc_release(v17);
      xpc_release(v17);
      xpc_release(v23);
    }
  }
  else if (a6)
  {
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "AVConferenceServiceError:detailCode:description:", 32031, 1, @"service is nil", a6, a7, *(void *)&a8);
    id v19 = (void (*)(id, void, uint64_t))*((void *)a6 + 2);
    v19(a6, 0, v18);
  }
}

- (id)newXPCDictionaryFromNSDictionary:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id result = (id)_CFXPCCreateXPCObjectFromCFObject();
    if (a4)
    {
      if (!result)
      {
        uint64_t v7 = (void *)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32031 detailCode:2 description:@"Failed to create XPC dictionary"];
        id result = 0;
        *a4 = v7;
      }
    }
  }
  else
  {
    return xpc_dictionary_create(0, 0, 0);
  }
  return result;
}

- (id)copyConnection
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__25;
  uint64_t v11 = __Block_byref_object_dispose__25;
  uint64_t v12 = 0;
  connectionQueue = self->connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__AVConferenceXPCClient_copyConnection__block_invoke;
  block[3] = &unk_1E6DB3EB8;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(connectionQueue, block);
  id v4 = (id)v8[5];
  if (!v4)
  {
    id v4 = [(AVConferenceXPCClient *)self createConnectionToServer];
    v8[5] = (uint64_t)v4;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)connectionPersists
{
  return self->connectionPersists;
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 xpcArguments:(id)a5 reply:(id)a6 queue:(id)a7
{
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 reply:(id)a5 queue:(id)a6
{
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 reply:(id)a5
{
}

- (id)sendMessageSync:(char *)a3 arguments:(id)a4
{
  return [(AVConferenceXPCClient *)self sendMessageSync:a3 arguments:a4 xpcArguments:0];
}

- (AVConferenceXPCClient)init
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)AVConferenceXPCClient;
  v2 = [(AVConferenceXPCClient *)&v14 init];
  if (v2)
  {
    if ((AVConferenceXPCClient *)objc_opt_class() == v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = v4;
      __int16 v17 = 2080;
      uint64_t v18 = "-[AVConferenceXPCClient init]";
      __int16 v19 = 1024;
      int v20 = 85;
      uint64_t v6 = "AVConferenceXPCClient [%s] %s:%d ";
      uint64_t v7 = v5;
      uint32_t v8 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v3 = (__CFString *)[(AVConferenceXPCClient *)v2 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = v9;
      __int16 v17 = 2080;
      uint64_t v18 = "-[AVConferenceXPCClient init]";
      __int16 v19 = 1024;
      int v20 = 85;
      __int16 v21 = 2112;
      __int16 v22 = v3;
      __int16 v23 = 2048;
      __int16 v24 = v2;
      uint64_t v6 = "AVConferenceXPCClient [%s] %s:%d %@(%p) ";
      uint64_t v7 = v10;
      uint32_t v8 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
LABEL_13:
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v2->replyQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVConferenceXPCClient.ReplyQueue", 0, CustomRootQueue);
    uint64_t v12 = VCDispatchQueue_GetCustomRootQueue(37);
    v2->connectionQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVConferenceXPCClient.ConnectionQueue", MEMORY[0x1E4F14430], v12);
    v2->registeredBlocks = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (id)createConnectionToServer
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__25;
  v10 = __Block_byref_object_dispose__25;
  uint64_t v11 = 0;
  connectionQueue = self->connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AVConferenceXPCClient_createConnectionToServer__block_invoke;
  block[3] = &unk_1E6DB3EB8;
  block[4] = self;
  block[5] = &v6;
  dispatch_barrier_sync(connectionQueue, block);
  uint64_t v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)registerBlockForService:(char *)a3 block:(id)a4 queue:(id)a5
{
}

- (void)registerBlockForService:(char *)a3 block:(id)a4
{
}

+ (id)AVConferenceXPCClientSingleton
{
  uint64_t v3 = objc_opt_class();
  objc_sync_enter(v3);
  uint64_t v4 = (unsigned char *)_xpcClientSingleton;
  if (!_xpcClientSingleton)
  {
    uint64_t v4 = objc_alloc_init((Class)a1);
    _xpcClientSingleton = (uint64_t)v4;
  }
  v4[40] = 1;
  objc_sync_exit(v3);
  return (id)_xpcClientSingleton;
}

uint64_t __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke_81(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

xpc_object_t __49__AVConferenceXPCClient_createConnectionToServer__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v2)
  {
    if (AVConferenceServer_ProcessIsAVConferenceServer()) {
      uint64_t v3 = "com.apple.avconference.xpc";
    }
    else {
      uint64_t v3 = "com.apple.videoconference.camera";
    }
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    uint64_t v5 = (os_log_t *)MEMORY[0x1E4F47A50];
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v16 = v6;
        __int16 v17 = 2080;
        uint64_t v18 = "-[AVConferenceXPCClient createConnectionToServer]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 254;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d XPC Client: creating new connection to server", buf, 0x1Cu);
      }
    }
    *(void *)(*(void *)(a1 + 32) + 8) = xpc_connection_create_mach_service(v3, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 24), 0);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
        *(_DWORD *)buf = 136316162;
        uint64_t v16 = v8;
        __int16 v17 = 2080;
        uint64_t v18 = "-[AVConferenceXPCClient createConnectionToServer]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 257;
        __int16 v21 = 2080;
        __int16 v22 = v3;
        __int16 v23 = 2048;
        uint64_t v24 = v10;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d name=%s, connection=%p", buf, 0x30u);
      }
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(_xpc_connection_s **)(v11 + 8);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_65;
    handler[3] = &unk_1E6DB79C0;
    handler[4] = v11;
    xpc_connection_set_event_handler(v12, handler);
    xpc_connection_resume(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8));
    v2 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  xpc_object_t result = xpc_retain(v2);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = MEMORY[0x1E4E59BB0](a2);
  if (v4 == MEMORY[0x1E4F145A8])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      int v7 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke_cold_5(v7, a2);
      }
    }
    uint64_t v6 = (void *)[*(id *)(a1 + 32) newServerDiedDictionary];
    [*(id *)(a1 + 32) closeConnectionToServer];
    uint64_t v5 = 0;
  }
  else if (v4 == MEMORY[0x1E4F14590])
  {
    uint64_t v6 = (void *)[*(id *)(a1 + 32) newNSDictionaryFromXPCDictionary:a2];
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "newNSErrorFromNSDictionary:", objc_msgSend(v6, "objectForKeyedSubscript:", @"ERROR"));
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  int v9 = *(_DWORD *)(a1 + 64);
  if (v9 <= ErrorLogLevelForModule && v9 >= 1)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    int v14 = *(_DWORD *)(a1 + 64);
    if (v14 > 2)
    {
      if (v14 <= 4)
      {
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_14;
        }
        goto LABEL_18;
      }
      if (v14 > 7)
      {
        if (v14 != 8) {
          goto LABEL_14;
        }
        id v15 = *MEMORY[0x1E4F47A50];
        uint64_t v16 = *MEMORY[0x1E4F47A50];
        if (!*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke_cold_4();
          }
          goto LABEL_14;
        }
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
      }
      else
      {
        id v15 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
      }
      uint64_t v17 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 136315906;
      uint64_t v20 = v13;
      __int16 v21 = 2080;
      __int16 v22 = "-[AVConferenceXPCClient sendMessageAsync:arguments:xpcArguments:reply:queue:replyLogLevel:]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 429;
      __int16 v25 = 2080;
      uint64_t v26 = v17;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d XPC Client: executing reply block for service %s", buf, 0x26u);
      goto LABEL_14;
    }
    if (VRTraceIsOSFaultDisabled())
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
LABEL_18:
      }
        __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke_cold_1();
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
    {
      __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke_cold_2();
    }
  }
LABEL_14:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke_81;
  block[3] = &unk_1E6DB4F60;
  uint64_t v11 = *(NSObject **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  block[5] = v5;
  void block[6] = v12;
  block[4] = v6;
  dispatch_async(v11, block);

  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((AVConferenceXPCClient *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(AVConferenceXPCClient *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    uint64_t v16 = "-[AVConferenceXPCClient dealloc]";
    __int16 v17 = 1024;
    int v18 = 97;
    __int16 v19 = 2112;
    uint64_t v20 = v3;
    __int16 v21 = 2048;
    __int16 v22 = self;
    uint64_t v6 = "AVConferenceXPCClient [%s] %s:%d %@(%p) ";
    int v7 = v10;
    uint32_t v8 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v14 = v4;
      __int16 v15 = 2080;
      uint64_t v16 = "-[AVConferenceXPCClient dealloc]";
      __int16 v17 = 1024;
      int v18 = 97;
      uint64_t v6 = "AVConferenceXPCClient [%s] %s:%d ";
      int v7 = v5;
      uint32_t v8 = 28;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  dispatch_release((dispatch_object_t)self->replyQueue);
  dispatch_release((dispatch_object_t)self->connectionQueue);

  connection = self->connection;
  if (connection)
  {
    xpc_release(connection);
    self->connection = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)AVConferenceXPCClient;
  [(AVConferenceXPCClient *)&v12 dealloc];
}

- (id)newNSDictionaryFromNSError:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(a3, "code"));
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", objc_msgSend(a3, "domain"), @"ERROR_DOMAIN", v4, @"ERROR_CODE", objc_msgSend(a3, "userInfo"), @"ERROR_USERINFO", 0);

  return v5;
}

- (id)newNSDictionaryFromNSDictionary:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = [a3 objectForKeyedSubscript:objc_msgSend(NSString, "stringWithFormat:", @"k_%d", v5)];
    uint64_t v7 = [a3 objectForKeyedSubscript:objc_msgSend(NSString, "stringWithFormat:", @"v_%d", v5)];
    if (!v6 || v7 == 0) {
      break;
    }
    uint64_t v5 = (v5 + 1);
    [v4 setObject:v7 forKeyedSubscript:v6];
  }
  return v4;
}

- (id)newServerDiedDictionary
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CA60]);
  return (id)objc_msgSend(v2, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"SERVERDIED", 0);
}

- (id)newTimeoutDictionary
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CA60]);
  return (id)objc_msgSend(v2, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"TIMEOUT", 0);
}

- (void)closeConnectionToServer
{
  v3[5] = *MEMORY[0x1E4F143B8];
  connectionQueue = self->connectionQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__AVConferenceXPCClient_closeConnectionToServer__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_barrier_async(connectionQueue, v3);
}

void __48__AVConferenceXPCClient_closeConnectionToServer__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v2 = VRTraceErrorLogLevelToCSTR();
      uint64_t v3 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 136315650;
        uint64_t v5 = v2;
        __int16 v6 = 2080;
        uint64_t v7 = "-[AVConferenceXPCClient closeConnectionToServer]_block_invoke";
        __int16 v8 = 1024;
        int v9 = 239;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d XPC Client: disposing off connection to server", (uint8_t *)&v4, 0x1Cu);
      }
    }
    xpc_release(*(xpc_object_t *)(*(void *)(a1 + 32) + 8));
    *(void *)(*(void *)(a1 + 32) + 8) = 0;
  }
}

uint64_t __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_66(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)sendMessageAsync:(char *)a3
{
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4
{
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 xpcArguments:(id)a5 reply:(id)a6
{
}

- (id)sendMessageSync:(char *)a3
{
  return [(AVConferenceXPCClient *)self sendMessageSync:a3 arguments:0];
}

- (void)deregisterFromService:(char *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      __int16 v6 = *MEMORY[0x1E4F47A50];
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 136315906;
          uint64_t v11 = v5;
          __int16 v12 = 2080;
          uint64_t v13 = "-[AVConferenceXPCClient deregisterFromService:]";
          __int16 v14 = 1024;
          int v15 = 563;
          __int16 v16 = 2080;
          __int16 v17 = a3;
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d XPC Client: Removing registered block for service %s", (uint8_t *)&v10, 0x26u);
        }
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[AVConferenceXPCClient deregisterFromService:]();
      }
    }
    __int16 v8 = (void *)[[NSString alloc] initWithCString:a3 encoding:4];
    registeredBlocks = self->registeredBlocks;
    objc_sync_enter(registeredBlocks);
    [(NSMutableDictionary *)self->registeredBlocks removeObjectForKey:v8];
    objc_sync_exit(registeredBlocks);
  }
}

- (OS_xpc_object)connection
{
  return self->connection;
}

- (NSMutableDictionary)registeredBlocks
{
  return self->registeredBlocks;
}

- (void)setConnectionPersists:(BOOL)a3
{
  self->connectionPersists = a3;
}

void __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_65_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7_10();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: no registered block found for service %@");
}

void __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_65_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: processing registered reply for service %@");
}

void __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_65_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_10_10(&dword_1E1EA4000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: processing registered reply for service %@");
}

void __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_65_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: processing registered reply for service %@");
}

- (void)sendMessageAsync:arguments:xpcArguments:reply:queue:replyLogLevel:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8();
  LODWORD(v5) = 403;
  OUTLINED_FUNCTION_7_10();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: Sending message to server for service: %s", v2, v3, v4, v5);
}

void __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: executing reply block for service %s", v2, v3, v4, v5);
}

void __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_10_10(&dword_1E1EA4000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: executing reply block for service %s", v2, v3, v4, v5);
}

void __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_9_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: executing reply block for service %s", v2, v3, v4, v5);
}

void __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke_cold_5(int a1, xpc_object_t xdict)
{
  xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14530]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, "AVConferenceXPCClient [%s] %s:%d XPC Client: received error from server while processing reply, %s", v4, v5, v6, v7, v8);
}

- (void)sendMessageSync:(int)a1 arguments:(xpc_object_t)xdict xpcArguments:.cold.1(int a1, xpc_object_t xdict)
{
  xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14530]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, "AVConferenceXPCClient [%s] %s:%d XPC Client: received error from server while processing reply, %s", v4, v5, v6, v7, v8);
}

- (void)sendMessageSync:arguments:xpcArguments:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8();
  LODWORD(v5) = 485;
  OUTLINED_FUNCTION_7_10();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: Sending sync message to server for service: %s", v2, v3, v4, v5);
}

- (void)registerBlockForService:block:queue:eventLogLevel:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8();
  LODWORD(v5) = 533;
  OUTLINED_FUNCTION_7_10();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: Adding registered block for service %s", v2, v3, v4, v5);
}

- (void)deregisterFromService:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8();
  LODWORD(v5) = 563;
  OUTLINED_FUNCTION_7_10();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: Removing registered block for service %s", v2, v3, v4, v5);
}

@end