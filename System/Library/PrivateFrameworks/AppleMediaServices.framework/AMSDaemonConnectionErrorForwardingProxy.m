@interface AMSDaemonConnectionErrorForwardingProxy
- (AMSDaemonConnectionErrorForwardingProxy)initWithProxy:(id)a3 fromInterface:(id)a4;
- (AMSDaemonConnectionErrorForwardingProxy)initWithProxy:(id)a3 fromInterface:(id)a4 isSync:(BOOL)a5;
- (BOOL)isSync;
- (NSXPCInterface)interface;
- (NSXPCProxyCreating)proxy;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation AMSDaemonConnectionErrorForwardingProxy

- (id)methodSignatureForSelector:(SEL)a3
{
  v4 = [(AMSDaemonConnectionErrorForwardingProxy *)self proxy];
  v5 = [v4 methodSignatureForSelector:a3];

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0;
  v5 = [(AMSDaemonConnectionErrorForwardingProxy *)self _blockToInvokeWithErrorForwardingForInvocation:v4 errorArgumentIndex:&v25];
  if (v5)
  {
    uint64_t v6 = [v4 selector];
    v7 = [(AMSDaemonConnectionErrorForwardingProxy *)self interface];
    v8 = AMSLogKey();
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __61__AMSDaemonConnectionErrorForwardingProxy_forwardInvocation___block_invoke;
    v19 = &unk_1E55A1910;
    id v20 = v8;
    id v21 = v7;
    uint64_t v23 = v6;
    uint64_t v24 = v25;
    id v22 = v5;
    id v9 = v7;
    id v10 = v8;
    v11 = _Block_copy(&v16);
    BOOL v12 = [(AMSDaemonConnectionErrorForwardingProxy *)self isSync];
    v13 = [(AMSDaemonConnectionErrorForwardingProxy *)self proxy];
    v14 = v13;
    if (v12) {
      [v13 synchronousRemoteObjectProxyWithErrorHandler:v11];
    }
    else {
    v15 = [v13 remoteObjectProxyWithErrorHandler:v11];
    }

    [v4 invokeWithTarget:v15];
  }
  else
  {
    id v10 = [(AMSDaemonConnectionErrorForwardingProxy *)self proxy];
    [v4 invokeWithTarget:v10];
  }
}

- (NSXPCProxyCreating)proxy
{
  return self->_proxy;
}

- (BOOL)isSync
{
  return self->_isSync;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

- (NSXPCInterface)interface
{
  return self->_interface;
}

- (AMSDaemonConnectionErrorForwardingProxy)initWithProxy:(id)a3 fromInterface:(id)a4 isSync:(BOOL)a5
{
  v8 = (NSXPCProxyCreating *)a3;
  id v9 = (NSXPCInterface *)a4;
  proxy = self->_proxy;
  self->_proxy = v8;
  v11 = v8;

  interface = self->_interface;
  self->_interface = v9;

  self->_isSync = a5;
  return self;
}

- (AMSDaemonConnectionErrorForwardingProxy)initWithProxy:(id)a3 fromInterface:(id)a4
{
  return [(AMSDaemonConnectionErrorForwardingProxy *)self initWithProxy:a3 fromInterface:a4 isSync:0];
}

void __61__AMSDaemonConnectionErrorForwardingProxy_forwardInvocation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  AMSError(0, @"AMSDaemonConnectionErrorForwardingProxy received XPC error", @"XPC error occurred while waiting for a reply from service proxy.", v3);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543874;
    uint64_t v16 = v6;
    __int16 v17 = 2114;
    uint64_t v18 = v7;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] XPC error occurred during proxy call. error = %{public}@", buf, 0x20u);
  }
  id v9 = [*(id *)(a1 + 40) replyBlockSignatureForSelector:*(void *)(a1 + 56)];
  id v10 = (void *)MEMORY[0x1E4F1CA38];
  id v11 = v9;
  BOOL v12 = objc_msgSend(v10, "signatureWithObjCTypes:", objc_msgSend(v11, "UTF8String"));
  v13 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v12];
  [v13 setArgument:&v14 atIndex:*(void *)(a1 + 64) + 1];
  [v13 invokeWithTarget:*(void *)(a1 + 48)];
}

@end