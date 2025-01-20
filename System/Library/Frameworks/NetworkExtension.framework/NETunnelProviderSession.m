@interface NETunnelProviderSession
- (BOOL)sendProviderMessage:(NSData *)messageData returnError:(NSError *)error responseHandler:(void *)responseHandler;
- (BOOL)startTunnelWithOptions:(NSDictionary *)options andReturnError:(NSError *)error;
- (void)stopTunnel;
@end

@implementation NETunnelProviderSession

- (BOOL)sendProviderMessage:(NSData *)messageData returnError:(NSError *)error responseHandler:(void *)responseHandler
{
  v43[2] = *MEMORY[0x1E4F143B8];
  v8 = messageData;
  v9 = responseHandler;
  if (error) {
    *error = 0;
  }
  if (+[NEProvider isRunningInProvider])
  {
    v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "App messages cannot be sent from Network Extension providers", buf, 2u);
    }

    if (error)
    {
      v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEVPNErrorDomain" code:3 userInfo:0];
LABEL_22:
      BOOL v30 = 0;
      *error = v11;
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if ([(NEVPNConnection *)self status] == NEVPNStatusInvalid || !self || !self->super._session)
  {
    if (error)
    {
      v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEVPNErrorDomain" code:1 userInfo:0];
      goto LABEL_22;
    }
LABEL_25:
    BOOL v30 = 0;
    goto LABEL_26;
  }
  self;
  if (sharedWrapperForSession__globals_init != -1) {
    dispatch_once(&sharedWrapperForSession__globals_init, &__block_literal_global_23089);
  }
  v43[0] = 0;
  v43[1] = 0;
  ne_session_get_configuration_id();
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v43];
  id v13 = (id)wrapperMap;
  objc_sync_enter(v13);
  v15 = [(id)wrapperMap objectForKeyedSubscript:v12];
  if (v15) {
    goto LABEL_17;
  }
  v16 = [NEIPCWrapper alloc];
  id v32 = v12;
  if (v16)
  {
    v42.receiver = v16;
    v42.super_class = (Class)NEIPCWrapper;
    v17 = [(NETunnelProviderSession *)&v42 init];
    v18 = v17;
    if (v17)
    {
      objc_storeStrong((id *)&v17->super._configManager, v12);
      v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v20 = dispatch_queue_create("NEIPCWrapper IPC queue", v19);
      status = (void *)v18->super._status;
      v18->super._status = (int64_t)v20;

      v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v23 = dispatch_queue_create("NEIPCWrapper send queue", v22);
      v24 = *(void **)&v18->super._installed;
      *(void *)&v18->super._installed = v23;

      dispatch_suspend(*(dispatch_object_t *)&v18->super._installed);
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v38 = 3221225472;
      v39 = __43__NEIPCWrapper_initWithSession_identifier___block_invoke;
      v40 = &unk_1E5993170;
      v15 = v18;
      v41 = v15;
      ne_session_establish_ipc();

LABEL_17:
      v25 = (void *)wrapperMap;
      id v26 = objc_getProperty(v15, v14, 32, 1);
      [v25 setObject:v15 forKeyedSubscript:v26];

      goto LABEL_18;
    }
  }

  v15 = 0;
LABEL_18:
  objc_sync_exit(v13);

  if (!v15)
  {
    if (error)
    {
      v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEVPNErrorDomain" code:1 userInfo:0];
      goto LABEL_22;
    }
    goto LABEL_25;
  }
  Property = objc_getProperty(v15, v27, 8, 1);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__NETunnelProviderSession_sendProviderMessage_returnError_responseHandler___block_invoke;
  block[3] = &unk_1E5992CA0;
  v34 = v15;
  v35 = v8;
  id v36 = v9;
  v29 = v15;
  dispatch_async(Property, block);

  BOOL v30 = 1;
LABEL_26:

  return v30;
}

void __75__NETunnelProviderSession_sendProviderMessage_returnError_responseHandler___block_invoke(uint64_t a1, const char *a2)
{
  v3 = *(void **)(a1 + 32);
  if (v3 && objc_getProperty(v3, a2, 24, 1))
  {
    v5 = *(void **)(a1 + 32);
    if (v5) {
      id Property = objc_getProperty(v5, v4, 24, 1);
    }
    else {
      id Property = 0;
    }
    v7 = *(void **)(a1 + 48);
    id v8 = *(id *)(a1 + 40);
    id v9 = MEMORY[0x1E4F14428];
    id v10 = v7;
    if (!Property) {
      goto LABEL_19;
    }
    id v11 = Property;
    objc_sync_enter(v11);
    if (objc_getProperty(v11, v12, 16, 1))
    {
      xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v13, "type", 0);
      if (v8)
      {
        id v15 = v8;
        xpc_dictionary_set_data(v13, "data", (const void *)[v15 bytes], objc_msgSend(v15, "length"));
      }
      if (v10)
      {
        xpc_dictionary_set_BOOL(v13, "needs-reply", 1);
        v17 = (_xpc_connection_s *)objc_getProperty(v11, v16, 16, 1);
        uint64_t handler = MEMORY[0x1E4F143A8];
        uint64_t v23 = 3221225472;
        v24 = __58__NEIPC_sendMessageWithType_data_replyQueue_replyHandler___block_invoke;
        v25 = &unk_1E5993310;
        id v26 = v10;
        xpc_connection_send_message_with_reply(v17, v13, MEMORY[0x1E4F14428], &handler);
      }
      else
      {
        v19 = (_xpc_connection_s *)objc_getProperty(v11, v14, 16, 1);
        xpc_connection_send_message(v19, v13);
      }
      -[NEIPC logMessageType:data:actionString:](0, v8, @"Sent");
    }
    else
    {
      if (!v10)
      {
LABEL_18:
        objc_sync_exit(v11);

LABEL_19:
        return;
      }
      uint64_t handler = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      v24 = __58__NEIPC_sendMessageWithType_data_replyQueue_replyHandler___block_invoke_2;
      v25 = &unk_1E5993770;
      id v26 = v10;
      dispatch_async(MEMORY[0x1E4F14428], &handler);
      xpc_object_t v13 = v26;
    }

    goto LABEL_18;
  }
  v18 = *(void **)(a1 + 48);
  if (v18)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __75__NETunnelProviderSession_sendProviderMessage_returnError_responseHandler___block_invoke_2;
    v20[3] = &unk_1E5993770;
    id v21 = v18;
    dispatch_async(MEMORY[0x1E4F14428], v20);
  }
}

uint64_t __75__NETunnelProviderSession_sendProviderMessage_returnError_responseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopTunnel
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if ([(NEVPNConnection *)self status] && self && self->super._session)
  {
    self;
    v10[0] = 0;
    v10[1] = 0;
    ne_session_get_configuration_id();
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v10];
    id v4 = (id)wrapperMap;
    objc_sync_enter(v4);
    v5 = [(id)wrapperMap objectForKeyedSubscript:v3];
    v7 = v5;
    if (v5)
    {
      id v8 = objc_getProperty(v5, v6, 24, 1);
      -[NEIPC stop](v8);

      -[NEIPCWrapper cancel](v7);
    }
    objc_sync_exit(v4);
  }
  v9.receiver = self;
  v9.super_class = (Class)NETunnelProviderSession;
  [(NEVPNConnection *)&v9 stopVPNTunnel];
}

- (BOOL)startTunnelWithOptions:(NSDictionary *)options andReturnError:(NSError *)error
{
  v5.receiver = self;
  v5.super_class = (Class)NETunnelProviderSession;
  return [(NEVPNConnection *)&v5 startVPNTunnelWithOptions:options andReturnError:error];
}

@end