@interface IDSXPCConnectionTimeoutProxy
- (BOOL)_invocationHasBlock:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (IDSXPCConnection)connection;
- (IDSXPCConnectionTimeoutProxy)initWithTarget:(id)a3 connection:(id)a4 timeoutInSeconds:(double)a5 errorHandler:(id)a6;
- (double)timeout;
- (id)errorHandler;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)target;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)setConnection:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setTarget:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation IDSXPCConnectionTimeoutProxy

- (IDSXPCConnectionTimeoutProxy)initWithTarget:(id)a3 connection:(id)a4 timeoutInSeconds:(double)a5 errorHandler:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = [v12 queue];
  dispatch_assert_queue_V2(v14);

  v15 = [MEMORY[0x1E4F6B460] xpc];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v23 = v11;
    __int16 v24 = 2114;
    id v25 = v12;
    __int16 v26 = 2048;
    v27 = self;
    _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "Alloc'ing IDSXPCConnectionTimeoutProxy {target: %{public}@, connection: %{public}@, pointer: %p}", buf, 0x20u);
  }

  v21.receiver = self;
  v21.super_class = (Class)IDSXPCConnectionTimeoutProxy;
  v16 = [(IDSXPCConnectionTimeoutProxy *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong(&v16->_target, a3);
    objc_storeStrong((id *)&v17->_connection, a4);
    v17->_timeout = a5;
    uint64_t v18 = MEMORY[0x192FE03B0](v13);
    id errorHandler = v17->_errorHandler;
    v17->_id errorHandler = (id)v18;
  }
  return v17;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F6B460] xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id target = self->_target;
    connection = self->_connection;
    *(_DWORD *)buf = 138543874;
    id v8 = target;
    __int16 v9 = 2114;
    v10 = connection;
    __int16 v11 = 2048;
    id v12 = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Dealloc'ing IDSXPCConnectionTimeoutProxy {target: %{public}@, connection: %{public}@, pointer: %p}", buf, 0x20u);
  }

  v6.receiver = self;
  v6.super_class = (Class)IDSXPCConnectionTimeoutProxy;
  [(IDSXPCConnectionTimeoutProxy *)&v6 dealloc];
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(IDSXPCConnectionTimeoutProxy *)self connection];
  objc_super v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  if ([(IDSXPCConnectionTimeoutProxy *)self _invocationHasBlock:v4])
  {
    v7 = [MEMORY[0x1E4F29128] UUID];
    id v8 = NSStringFromSelector((SEL)[v4 selector]);
    __int16 v9 = NSNumber;
    [(IDSXPCConnectionTimeoutProxy *)self timeout];
    v10 = objc_msgSend(v9, "numberWithDouble:");
    __int16 v11 = [(IDSXPCConnectionTimeoutProxy *)self connection];
    id v12 = [v11 queue];
    uint64_t v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v12);

    [(IDSXPCConnectionTimeoutProxy *)self timeout];
    dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    dispatch_source_set_timer(v13, v15, 0xFFFFFFFFFFFFFFFFLL, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_1919E7948;
    handler[3] = &unk_1E5729680;
    id v16 = v8;
    id v39 = v16;
    id v17 = v7;
    id v40 = v17;
    id v18 = v10;
    id v41 = v18;
    v42 = self;
    dispatch_source_set_event_handler(v13, handler);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = sub_1919E7B44;
    v34[3] = &unk_1E5728DA8;
    id v19 = v16;
    id v35 = v19;
    id v20 = v17;
    id v36 = v20;
    objc_super v21 = v13;
    v37 = v21;
    v22 = (void *)MEMORY[0x192FE03B0](v34);
    id v23 = [(IDSXPCConnectionTimeoutProxy *)self connection];
    __int16 v24 = [v23 pendingTransactions];
    [v24 setObject:v22 forKeyedSubscript:v20];

    dispatch_resume(v21);
    id v25 = [MEMORY[0x1E4F6B460] xpc];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v46 = v19;
      __int16 v47 = 2114;
      id v48 = v20;
      __int16 v49 = 2114;
      id v50 = v18;
      _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "Starting timeout for xpc message {selector: %{public}@, uuid: %{public}@, timeout: %{public}@}", buf, 0x20u);
    }

    __int16 v26 = [(IDSXPCConnectionTimeoutProxy *)self target];
    v43 = @"IDSXPCConnectionTransactionUUID";
    id v44 = v20;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_1919E7C08;
    v32[3] = &unk_1E572C8A8;
    v32[4] = self;
    id v33 = v20;
    id v28 = v20;
    v29 = [v26 remoteObjectProxyWithUserInfo:v27 errorHandler:v32];
  }
  else
  {
    v30 = [(IDSXPCConnectionTimeoutProxy *)self target];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = sub_1919E7CCC;
    v31[3] = &unk_1E572CD28;
    v31[4] = self;
    v29 = [v30 remoteObjectProxyWithErrorHandler:v31];
  }
  [v4 invokeWithTarget:v29];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  id v4 = [(IDSXPCConnectionTimeoutProxy *)self connection];
  v5 = [v4 queue];
  dispatch_assert_queue_V2(v5);

  objc_super v6 = [(IDSXPCConnectionTimeoutProxy *)self target];
  char v7 = objc_opt_respondsToSelector();

  return v7 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v5 = [(IDSXPCConnectionTimeoutProxy *)self connection];
  objc_super v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  char v7 = [(IDSXPCConnectionTimeoutProxy *)self target];
  id v8 = [v7 methodSignatureForSelector:a3];

  return v8;
}

- (BOOL)_invocationHasBlock:(id)a3
{
  v3 = [a3 methodSignature];
  if ([v3 numberOfArguments])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = v3;
      int v6 = strcmp((const char *)[v5 getArgumentTypeAtIndex:v4], "@?");
      BOOL v7 = v6 == 0;
      if (!v6) {
        break;
      }
      ++v4;
    }
    while (v4 < [v5 numberOfArguments]);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (IDSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong(&self->_target, 0);
}

@end