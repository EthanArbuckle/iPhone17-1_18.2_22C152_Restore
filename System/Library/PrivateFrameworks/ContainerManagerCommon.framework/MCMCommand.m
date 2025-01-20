@interface MCMCommand
+ (Class)incomingMessageClass;
+ (id)relayToPrivilegedDaemonMessage:(id)a3 context:(id)a4;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommand)initWithContext:(id)a3 resultPromise:(id)a4;
- (MCMCommand)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMCommandContext)context;
- (MCMReply)reply;
- (MCMResultPromise)resultPromise;
- (void)execute;
@end

@implementation MCMCommand

- (MCMCommandContext)context
{
  return self->_context;
}

- (MCMResultPromise)resultPromise
{
  return self->_resultPromise;
}

- (MCMCommand)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [v8 resultPromise];
  v11 = [(MCMCommand *)self initWithContext:v9 resultPromise:v10];

  if (v11) {
    objc_storeStrong((id *)&v11->_reply, a5);
  }

  return v11;
}

- (MCMCommand)initWithContext:(id)a3 resultPromise:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MCMCommand;
  id v9 = [(MCMCommand *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_resultPromise, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reply, 0);
  objc_storeStrong((id *)&self->_resultPromise, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (MCMReply)reply
{
  return self->_reply;
}

- (void)execute
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSStringFromSelector(a2);
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v2 raise:v3, @"%@ was called on the base class %@", v4, v6 format];

  __break(1u);
}

- (BOOL)preflightClientAllowed
{
  return 0;
}

+ (id)relayToPrivilegedDaemonMessage:(id)a3 context:(id)a4
{
  buf[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  container_xpc_set_use_shared_connection();
  id v7 = [v6 clientIdentity];

  [v7 createLibsystemClient];
  id v8 = (void *)container_client_copy_encoded_xpc_object();
  if (v8)
  {
    id v9 = [v5 xpcObject];
    xpc_dictionary_set_value(v9, "ProxyForClient", v8);

    buf[0] = 0;
    v10 = [v5 xpcObject];
    v11 = (MCMError *)container_xpc_send_sync_message();

    if (v11)
    {
      objc_super v12 = [[MCMResultRelay alloc] initWithXPCReplyFromRelay:v11];
    }
    else
    {
      v14 = [[MCMError alloc] initWithLibsystemError:buf[0]];
      objc_super v12 = [(MCMResultBase *)[MCMResultRelay alloc] initWithError:v14];
    }
    container_error_free();
  }
  else
  {
    v11 = [[MCMError alloc] initWithErrorType:1 category:2];
    objc_super v12 = [[MCMResultBase alloc] initWithError:v11];
    uint64_t v13 = container_log_handle_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf[0]) = 134217984;
      *(void *)((char *)buf + 4) = 1;
      _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, "Could not serialize client for proxy; error = %llu",
        (uint8_t *)buf,
        0xCu);
    }
  }
  container_free_client();

  return v12;
}

+ (Class)incomingMessageClass
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSStringFromSelector(a2);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v2 raise:v3, @"%@ was called on the base class %@", v4, v6 format];

  __break(1u);
  return result;
}

+ (unint64_t)command
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSStringFromSelector(a2);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v2 raise:v3, @"%@ was called on the base class %@", v4, v6 format];

  __break(1u);
  return result;
}

@end