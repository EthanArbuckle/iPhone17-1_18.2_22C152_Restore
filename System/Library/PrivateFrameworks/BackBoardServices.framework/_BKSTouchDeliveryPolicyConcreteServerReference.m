@interface _BKSTouchDeliveryPolicyConcreteServerReference
- (_BKSTouchDeliveryPolicyConcreteServerInterface)server;
- (id)errorHandler;
- (void)ipc_addPolicy:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setServer:(id)a3;
@end

@implementation _BKSTouchDeliveryPolicyConcreteServerReference

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

- (void)setErrorHandler:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setServer:(id)a3
{
}

- (_BKSTouchDeliveryPolicyConcreteServerInterface)server
{
  return self->_server;
}

- (void)ipc_addPolicy:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = NSString;
      v9 = (objc_class *)[v5 classForCoder];
      if (!v9) {
        v9 = (objc_class *)objc_opt_class();
      }
      v10 = NSStringFromClass(v9);
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = [v8 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"policy", v10, v12];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v14 = NSStringFromSelector(a2);
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        *(_DWORD *)buf = 138544642;
        id v18 = v14;
        __int16 v19 = 2114;
        v20 = v16;
        __int16 v21 = 2048;
        v22 = self;
        __int16 v23 = 2114;
        v24 = @"BKSTouchDeliveryPolicyServerInterface.m";
        __int16 v25 = 1024;
        int v26 = 50;
        __int16 v27 = 2114;
        v28 = v13;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v13 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA2F0A4);
    }
  }

  v6 = BKLogTouchDeliveryPolicy();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v5;
    _os_log_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_DEFAULT, "TDPS client ipc_addPolicy:%{public}@", buf, 0xCu);
  }

  if (v5)
  {
    v7 = [(NSXPCConnection *)self->_server->_connection remoteObjectProxyWithErrorHandler:self->_errorHandler];
    objc_msgSend(v7, "ipc_addPolicy:", v5);
  }
}

@end