@interface _BMXPCTransport
+ (id)_handleEvent:(id)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (NSDictionary)remoteUserInfo;
- (NSMutableDictionary)exportedUserInfo;
- (_BMXPCTransport)initWithConnection:(id)a3;
- (id)errorHandler;
- (id)messageHandler;
- (id)sendMessageWithReplySync:(id)a3;
- (int)auditSessionIdentifier;
- (int)processIdentifier;
- (unsigned)effectiveGroupIdentifier;
- (unsigned)effectiveUserIdentifier;
- (void)_setTargetUserIdentifier:(unsigned int)a3;
- (void)_willSendMessage:(id)a3;
- (void)activate;
- (void)cancel;
- (void)dealloc;
- (void)resume;
- (void)sendBarrierBlock:(id)a3;
- (void)sendMessage:(id)a3;
- (void)sendMessageWithReply:(id)a3 onQueue:(id)a4 replyHandler:(id)a5;
- (void)sendNotification:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setMessageHandler:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)suspend;
@end

@implementation _BMXPCTransport

- (NSDictionary)remoteUserInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakContext);
  v3 = [WeakRetained remoteUserInfo];

  return (NSDictionary *)v3;
}

- (void)activate
{
}

- (_BMXPCTransport)initWithConnection:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_BMXPCTransport;
  v6 = [(_BMXPCTransport *)&v13 init];
  if (v6)
  {
    v7 = objc_opt_new();
    v8 = objc_opt_new();
    [v7 setExportedUserInfo:v8];

    v9 = objc_opt_new();
    [v7 setRemoteUserInfo:v9];

    objc_storeWeak((id *)&v6->_weakContext, v7);
    objc_storeStrong((id *)&v6->_connection, a3);
    connection = v6->_connection;
    v11 = +[_BMXPCTransport _handleEvent:v7];
    xpc_connection_set_event_handler(connection, v11);
  }
  return v6;
}

- (void)setTargetQueue:(id)a3
{
  targetq = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakContext);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = [WeakRetained queue];

    if (v6 != targetq)
    {
      [v5 setQueue:targetq];
      xpc_connection_set_target_queue(self->_connection, targetq);
    }
  }
}

+ (id)_handleEvent:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32___BMXPCTransport__handleEvent___block_invoke;
  v7[3] = &unk_1E6022F10;
  id v8 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x1B3EB5AC0](v7);

  return v5;
}

- (void)setMessageHandler:(id)a3
{
  p_weakContext = &self->_weakContext;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_weakContext);
  [WeakRetained setMessageHandler:v4];
}

- (void)setErrorHandler:(id)a3
{
  p_weakContext = &self->_weakContext;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_weakContext);
  [WeakRetained setErrorHandler:v4];
}

- (void)sendMessage:(id)a3
{
  xpc_object_t message = a3;
  [(_BMXPCTransport *)self _willSendMessage:message];
  xpc_connection_send_message(self->_connection, message);
}

- (id)sendMessageWithReplySync:(id)a3
{
  id v4 = a3;
  [(_BMXPCTransport *)self _willSendMessage:v4];
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(self->_connection, v4);

  return v5;
}

- (void)_willSendMessage:(id)a3
{
  xpc_object_t xdict = a3;
  id v4 = [(_BMXPCTransport *)self exportedUserInfo];
  if ([v4 count])
  {
    xpc_object_t v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(xdict, "bm_info", v5);
  }
}

- (NSMutableDictionary)exportedUserInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakContext);
  id v3 = [WeakRetained exportedUserInfo];

  return (NSMutableDictionary *)v3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return ($115C4C562B26FF47E01F9F4EA65B5887 *)MEMORY[0x1F40CEBE8](self->_connection, retstr);
}

- (void)cancel
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakContext);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_BMXPCTransport;
  [(_BMXPCTransport *)&v2 dealloc];
}

- (void)resume
{
}

- (void)sendMessageWithReply:(id)a3 onQueue:(id)a4 replyHandler:(id)a5
{
  id v8 = a5;
  v9 = a4;
  xpc_object_t message = a3;
  [(_BMXPCTransport *)self _willSendMessage:message];
  xpc_connection_send_message_with_reply(self->_connection, message, v9, v8);
}

- (id)messageHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakContext);
  id v3 = [WeakRetained messageHandler];

  return v3;
}

- (id)errorHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakContext);
  id v3 = [WeakRetained errorHandler];

  return v3;
}

- (int)auditSessionIdentifier
{
  return xpc_connection_get_asid(self->_connection);
}

- (unsigned)effectiveGroupIdentifier
{
  return xpc_connection_get_egid(self->_connection);
}

- (unsigned)effectiveUserIdentifier
{
  return xpc_connection_get_euid(self->_connection);
}

- (int)processIdentifier
{
  return xpc_connection_get_pid(self->_connection);
}

- (void)sendBarrierBlock:(id)a3
{
}

- (void)sendNotification:(id)a3
{
  id v4 = a3;
  [(_BMXPCTransport *)self _willSendMessage:v4];
  xpc_connection_send_notification();
}

- (void)suspend
{
}

- (void)_setTargetUserIdentifier:(unsigned int)a3
{
  if (a3)
  {
    connection = self->_connection;
    MEMORY[0x1F40CECE8](connection, *(void *)&a3);
  }
  else
  {
    id v4 = __biome_log_for_category(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[_BMXPCTransport _setTargetUserIdentifier:](v4);
    }
  }
}

- (void)_setTargetUserIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B30A0000, log, OS_LOG_TYPE_FAULT, "Ignoring _setTargetUserIdentifier: because chosen UID is 0", v1, 2u);
}

@end