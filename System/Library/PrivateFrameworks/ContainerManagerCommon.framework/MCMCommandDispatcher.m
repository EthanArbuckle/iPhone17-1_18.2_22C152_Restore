@interface MCMCommandDispatcher
- (Class)_commandClassFromXPCMessage:(id)a3 context:(id)a4 error:(id *)a5;
- (MCMCommandDispatcher)init;
- (NSMutableDictionary)messageToCommandClassMap;
- (id)_commandFromCommandClass:(Class)a3 message:(id)a4 context:(id)a5 reply:(id)a6 error:(id *)a7;
- (id)_ifNeededRelayMessage:(id)a3 context:(id)a4;
- (id)_messageFromCommandClass:(Class)a3 xpcMessage:(id)a4 context:(id)a5 error:(id *)a6;
- (void)dispatchMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (void)registerCommandClass:(Class)a3;
@end

@implementation MCMCommandDispatcher

- (void)dispatchMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  v23[1] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 resultPromise];
  v23[0] = 0;
  v12 = [(MCMCommandDispatcher *)self _commandClassFromXPCMessage:v8 context:v9 error:v23];
  v13 = (MCMError *)v23[0];
  v14 = v13;
  if (v12)
  {
    v22 = v13;
    v15 = [(MCMCommandDispatcher *)self _messageFromCommandClass:v12 xpcMessage:v8 context:v9 error:&v22];
    v16 = v22;

    if (v15)
    {
      uint64_t v17 = [(MCMCommandDispatcher *)self _ifNeededRelayMessage:v15 context:v9];
      if (!v17)
      {
        v21 = v16;
        v19 = [(MCMCommandDispatcher *)self _commandFromCommandClass:v12 message:v15 context:v9 reply:v10 error:&v21];
        v14 = v21;

        if (v19)
        {
          if (([(MCMResultBase *)v19 preflightClientAllowed] & 1) == 0)
          {
            v16 = [[MCMError alloc] initWithErrorType:55 category:3];

            v20 = [[MCMResultBase alloc] initWithError:v16];
            [v11 completeWithResult:v20];

            goto LABEL_7;
          }
          [(MCMResultBase *)v19 execute];
        }
        else
        {
          v19 = [[MCMResultBase alloc] initWithError:v14];
          [v11 completeWithResult:v19];
        }

        goto LABEL_8;
      }
      v18 = (void *)v17;
      [v11 completeWithResult:v17];
    }
    else
    {
      v15 = [[MCMResultBase alloc] initWithError:v16];
      [v11 completeWithResult:v15];
    }
LABEL_7:
    v14 = v16;
    goto LABEL_8;
  }
  v15 = [[MCMResultBase alloc] initWithError:v13];
  [v11 completeWithResult:v15];
LABEL_8:
}

- (id)_messageFromCommandClass:(Class)a3 xpcMessage:(id)a4 context:(id)a5 error:(id *)a6
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  v19[0] = 1;
  v11 = (void *)[(objc_class *)a3 incomingMessageClass];
  if (v11)
  {
    uint64_t v12 = [v11 xpcMessageFromXPCObject:v9 context:v10 error:v19];
    if (v12)
    {
      v13 = (void *)v12;
      v14 = 0;
      goto LABEL_9;
    }
    v15 = [MCMError alloc];
    uint64_t v16 = v19[0];
    uint64_t v17 = 3;
  }
  else
  {
    v15 = [MCMError alloc];
    uint64_t v16 = 40;
    uint64_t v17 = 4;
  }
  v14 = [(MCMError *)v15 initWithErrorType:v16 category:v17];
  if (a6)
  {
    v14 = v14;
    v13 = 0;
    *a6 = v14;
  }
  else
  {
    v13 = 0;
  }
LABEL_9:

  return v13;
}

- (id)_ifNeededRelayMessage:(id)a3 context:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 disposition];
  if (v7 == 2)
  {
    uint64_t v12 = container_log_handle_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134217984;
      uint64_t v17 = [v5 command];
      _os_log_impl(&dword_1D7739000, v12, OS_LOG_TYPE_DEFAULT, "Relaying [%llu] to daemon.", (uint8_t *)&v16, 0xCu);
    }

    v13 = +[MCMCommand relayToPrivilegedDaemonMessage:v5 context:v6];
  }
  else
  {
    if (v7 != 1)
    {
      id v10 = [MCMError alloc];
      uint64_t v11 = 72;
      goto LABEL_9;
    }
    id v8 = containermanager_copy_global_configuration();
    int v9 = [v8 runmode];

    if (v9 == 3)
    {
      id v10 = [MCMError alloc];
      uint64_t v11 = 100;
LABEL_9:
      v14 = [(MCMError *)v10 initWithErrorType:v11 category:3];
      v13 = [[MCMResultBase alloc] initWithError:v14];

      goto LABEL_11;
    }
    v13 = 0;
  }
LABEL_11:

  return v13;
}

- (id)_commandFromCommandClass:(Class)a3 message:(id)a4 context:(id)a5 reply:(id)a6 error:(id *)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  v14 = (void *)[[a3 alloc] initWithMessage:v13 context:v12 reply:v11];

  if (a7 && !v14) {
    *a7 = [[MCMError alloc] initWithErrorType:38 category:3];
  }

  return v14;
}

- (Class)_commandClassFromXPCMessage:(id)a3 context:(id)a4 error:(id *)a5
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "Command");
  id v8 = [(MCMCommandDispatcher *)self messageToCommandClassMap];
  int v9 = [NSNumber numberWithUnsignedLongLong:uint64];
  id v10 = (void *)[v8 objectForKeyedSubscript:v9];

  if (a5 && !v10) {
    *a5 = [[MCMError alloc] initWithErrorType:72 category:3];
  }

  return (Class)v10;
}

- (NSMutableDictionary)messageToCommandClassMap
{
  return self->_messageToCommandClassMap;
}

- (void).cxx_destruct
{
  p_messageToCommandClassMap = &self->_messageToCommandClassMap;

  objc_storeStrong((id *)p_messageToCommandClassMap, 0);
}

- (void)registerCommandClass:(Class)a3
{
  id v5 = [(MCMCommandDispatcher *)self messageToCommandClassMap];
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[objc_class command](a3, "command"));
  [v5 setObject:a3 forKeyedSubscript:v4];
}

- (MCMCommandDispatcher)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)MCMCommandDispatcher;
  v2 = [(MCMCommandDispatcher *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    messageToCommandClassMap = v2->_messageToCommandClassMap;
    v2->_messageToCommandClassMap = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end