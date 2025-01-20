@interface _EMRemoteInterfaceDistantObject
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isSynchronous;
- (BOOL)respondsToSelector:(SEL)a3;
- (EMRemoteConnection)remoteInterface;
- (EMRemoteProxyGenerator)proxyGenerator;
- (_EMRemoteInterfaceDistantObject)initWithRemoteInterface:(id)a3 proxyGenerator:(id)a4 synchronous:(BOOL)a5 reattemptHandler:(id)a6;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)reattemptHandler;
- (id)reattemptingRemoteObjectProxy;
- (id)reattemptingRemoteObjectProxyWithReattemptHandler:(id)a3;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)_forwardStackInvocation:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)setProxyGenerator:(id)a3;
@end

@implementation _EMRemoteInterfaceDistantObject

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reattemptHandler, 0);
  objc_storeStrong((id *)&self->_proxyGenerator, 0);
  objc_storeStrong((id *)&self->_remoteInterface, 0);
}

- (void)_forwardStackInvocation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_proxyGenerator)
  {
    [(EMRemoteConnection *)self->_remoteInterface _sendInvocation:v4 withProxy:self];
  }
  else
  {
    v5 = +[EMRemoteConnection log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543618;
      v10 = self;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Client instance no longer valid. Skipping fowarding stack invocation %{public}@", (uint8_t *)&v9, 0x16u);
    }

    if (self->_reattemptHandler)
    {
      v6 = +[EMRemoteConnection log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543618;
        v10 = self;
        __int16 v11 = 2114;
        id v12 = v4;
        _os_log_impl(&dword_1BEFDB000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Invoking reattemptHandler with EMConnectionInvalidated error for invocation %{public}@", (uint8_t *)&v9, 0x16u);
      }

      reattemptHandler = (void (**)(id, void *))self->_reattemptHandler;
      v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EMErrorDomain" code:2 userInfo:0];
      reattemptHandler[2](reattemptHandler, v8);
    }
  }
}

- (id)reattemptHandler
{
  return self->_reattemptHandler;
}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (_EMRemoteInterfaceDistantObject)initWithRemoteInterface:(id)a3 proxyGenerator:(id)a4 synchronous:(BOOL)a5 reattemptHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)_EMRemoteInterfaceDistantObject;
  v14 = [(_EMRemoteInterfaceDistantObject *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_remoteInterface, a3);
    objc_storeStrong((id *)&v15->_proxyGenerator, a4);
    v15->_synchronous = a5;
    uint64_t v16 = [v13 copy];
    id reattemptHandler = v15->_reattemptHandler;
    v15->_id reattemptHandler = (id)v16;
  }
  return v15;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v5 = -[EMRemoteConnection _methodSignatureForRemoteSelector:](self->_remoteInterface, "_methodSignatureForRemoteSelector:");
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_EMRemoteInterfaceDistantObject;
    id v7 = [(_EMRemoteInterfaceDistantObject *)&v10 methodSignatureForSelector:a3];
  }
  v8 = v7;

  return v8;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = (Protocol *)a3;
  v8.receiver = self;
  v8.super_class = (Class)_EMRemoteInterfaceDistantObject;
  if ([(_EMRemoteInterfaceDistantObject *)&v8 conformsToProtocol:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [(EMRemoteConnection *)self->_remoteInterface protocol];
    BOOL v5 = protocol_conformsToProtocol(v6, v4);
  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (-[EMRemoteConnection _respondsToRemoteSelector:](self->_remoteInterface, "_respondsToRemoteSelector:")) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)_EMRemoteInterfaceDistantObject;
  return [(_EMRemoteInterfaceDistantObject *)&v6 respondsToSelector:a3];
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_proxyGenerator)
  {
    [(EMRemoteConnection *)self->_remoteInterface _sendInvocation:v4 withProxy:self];
  }
  else
  {
    BOOL v5 = +[EMRemoteConnection log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543618;
      objc_super v10 = self;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Client instance no longer valid. Skipping forwarding invocation %{public}@", (uint8_t *)&v9, 0x16u);
    }

    if (self->_reattemptHandler)
    {
      objc_super v6 = +[EMRemoteConnection log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543618;
        objc_super v10 = self;
        __int16 v11 = 2114;
        id v12 = v4;
        _os_log_impl(&dword_1BEFDB000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Invoking reattemptHandler with EMConnectionInvalidated error for invocation %{public}@", (uint8_t *)&v9, 0x16u);
      }

      id reattemptHandler = (void (**)(id, void *))self->_reattemptHandler;
      objc_super v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EMErrorDomain" code:2 userInfo:0];
      reattemptHandler[2](reattemptHandler, v8);
    }
  }
}

- (id)reattemptingRemoteObjectProxy
{
  id v3 = objc_alloc((Class)objc_opt_class());
  remoteInterface = self->_remoteInterface;
  proxyGenerator = self->_proxyGenerator;
  objc_super v6 = defaultReattemptingHandlerForConnection(remoteInterface);
  id v7 = (void *)[v3 initWithRemoteInterface:remoteInterface proxyGenerator:proxyGenerator synchronous:0 reattemptHandler:v6];

  return v7;
}

- (id)remoteObjectProxy
{
  id v3 = objc_alloc((Class)objc_opt_class());
  remoteInterface = self->_remoteInterface;
  proxyGenerator = self->_proxyGenerator;
  objc_super v6 = defaultNonReattemptingHandlerForConnection(remoteInterface);
  id v7 = (void *)[v3 initWithRemoteInterface:remoteInterface proxyGenerator:proxyGenerator synchronous:0 reattemptHandler:v6];

  return v7;
}

- (id)reattemptingRemoteObjectProxyWithReattemptHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRemoteInterface:self->_remoteInterface proxyGenerator:self->_proxyGenerator synchronous:0 reattemptHandler:v4];

  return v5;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  remoteInterface = self->_remoteInterface;
  proxyGenerator = self->_proxyGenerator;
  objc_super v8 = nonReattemptingHandlerForErrorHandler(v4);
  int v9 = (void *)[v5 initWithRemoteInterface:remoteInterface proxyGenerator:proxyGenerator synchronous:0 reattemptHandler:v8];

  return v9;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  remoteInterface = self->_remoteInterface;
  proxyGenerator = self->_proxyGenerator;
  objc_super v8 = nonReattemptingHandlerForErrorHandler(v4);
  int v9 = (void *)[v5 initWithRemoteInterface:remoteInterface proxyGenerator:proxyGenerator synchronous:1 reattemptHandler:v8];

  return v9;
}

- (EMRemoteConnection)remoteInterface
{
  return self->_remoteInterface;
}

- (EMRemoteProxyGenerator)proxyGenerator
{
  return self->_proxyGenerator;
}

- (void)setProxyGenerator:(id)a3
{
}

@end