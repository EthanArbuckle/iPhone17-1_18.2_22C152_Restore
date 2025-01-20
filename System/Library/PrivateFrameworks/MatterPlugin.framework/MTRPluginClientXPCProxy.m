@interface MTRPluginClientXPCProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (MTRPluginClient)client;
- (MTRPluginClientXPCProxy)initWithClient:(id)a3;
- (void)callRemoteProxyObject:(id)a3;
- (void)device:(id)a3 receivedAttributeReport:(id)a4;
- (void)device:(id)a3 receivedEventReport:(id)a4;
- (void)forwardInvocation:(id)a3;
- (void)setClient:(id)a3;
@end

@implementation MTRPluginClientXPCProxy

- (MTRPluginClientXPCProxy)initWithClient:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginClientXPCProxy;
  v5 = [(MTRPluginClientXPCProxy *)&v8 init];
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v10 = v5;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ initWithClient %@", buf, 0x16u);
    }
    [(MTRPluginClientXPCProxy *)v5 setClient:v4];
    v6 = v5;
  }

  return v5;
}

- (void)callRemoteProxyObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x25A290B70]();
    v6 = [(MTRPluginClientXPCProxy *)self client];
    v7 = [v6 xpcConnection];

    objc_super v8 = [(MTRPluginClientXPCProxy *)self client];
    v9 = [v8 workQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __49__MTRPluginClientXPCProxy_callRemoteProxyObject___block_invoke;
    v11[3] = &unk_2653E6A50;
    id v12 = v7;
    id v13 = v4;
    id v10 = v7;
    dispatch_async(v9, v11);
  }
}

void __49__MTRPluginClientXPCProxy_callRemoteProxyObject___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteObjectProxy];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)device:(id)a3 receivedAttributeReport:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__MTRPluginClientXPCProxy_device_receivedAttributeReport___block_invoke;
  v10[3] = &unk_2653E6A78;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MTRPluginClientXPCProxy *)self callRemoteProxyObject:v10];
}

uint64_t __58__MTRPluginClientXPCProxy_device_receivedAttributeReport___block_invoke(uint64_t a1, void *a2)
{
  return [a2 device:*(void *)(a1 + 32) receivedAttributeReport:*(void *)(a1 + 40)];
}

- (void)device:(id)a3 receivedEventReport:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__MTRPluginClientXPCProxy_device_receivedEventReport___block_invoke;
  v10[3] = &unk_2653E6A78;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MTRPluginClientXPCProxy *)self callRemoteProxyObject:v10];
}

uint64_t __54__MTRPluginClientXPCProxy_device_receivedEventReport___block_invoke(uint64_t a1, void *a2)
{
  return [a2 device:*(void *)(a1 + 32) receivedEventReport:*(void *)(a1 + 40)];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (MTRPluginCheckProtocolContainsSelector(&unk_27046DEA0, a3)) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)MTRPluginClientXPCProxy;
  return [(MTRPluginClientXPCProxy *)&v6 respondsToSelector:a3];
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (MTRPluginCheckProtocolContainsSelector(&unk_27046DEA0, (const char *)[v4 selector]))
  {
    [v4 retainArguments];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__MTRPluginClientXPCProxy_forwardInvocation___block_invoke;
    v6[3] = &unk_2653E6AA0;
    id v7 = v4;
    [(MTRPluginClientXPCProxy *)self callRemoteProxyObject:v6];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MTRPluginClientXPCProxy;
    [(MTRPluginClientXPCProxy *)&v5 forwardInvocation:v4];
  }
}

uint64_t __45__MTRPluginClientXPCProxy_forwardInvocation___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invokeWithTarget:a2];
}

- (MTRPluginClient)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  return (MTRPluginClient *)WeakRetained;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
}

void __49__MTRPluginClientXPCProxy_callRemoteProxyObject___block_invoke_cold_1(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  id v1 = objc_begin_catch(a1);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v2 = 138412290;
    id v3 = v1;
    _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Exception calling remote proxy: %@", (uint8_t *)&v2, 0xCu);
  }
  objc_end_catch();
}

- (void)forwardInvocation:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_begin_catch(a1);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = a3;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Exception forwarding MTRXPCClientProtocol method: %@", (uint8_t *)&v4, 0xCu);
  }
  objc_end_catch();
}

@end