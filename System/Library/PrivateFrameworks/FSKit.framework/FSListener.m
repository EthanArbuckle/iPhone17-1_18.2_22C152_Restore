@interface FSListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (Class)clientClass;
- (NSObject)proxy;
- (NSXPCInterface)interface;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (id)initUsingInterface:(id)a3 clientClass:(Class)a4 queue:(id)a5 andProxy:(id)a6;
@end

@implementation FSListener

- (id)initUsingInterface:(id)a3 clientClass:(Class)a4 queue:(id)a5 andProxy:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)FSListener;
  v14 = [(FSListener *)&v24 init];
  if (v14)
  {
    if (a4
      && v11
      && v13
      && ([v11 protocol],
          v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [(objc_class *)a4 conformsToProtocol:v15],
          v15,
          (v16 & 1) != 0))
    {
      if ([(objc_class *)a4 conformsToProtocol:&unk_270006228])
      {
        uint64_t v17 = [MEMORY[0x263F08D88] anonymousListener];
        listener = v14->_listener;
        v14->_listener = (NSXPCListener *)v17;

        [(NSXPCListener *)v14->_listener setDelegate:v14];
        [(NSXPCListener *)v14->_listener resume];
        objc_storeStrong((id *)&v14->_interface, a3);
        objc_storeStrong((id *)&v14->_clientClass, a4);
        objc_storeStrong((id *)&v14->_proxy, a6);
        objc_storeStrong((id *)&v14->_queue, a5);
        goto LABEL_8;
      }
      v20 = (void *)MEMORY[0x263EFF940];
      uint64_t v21 = *MEMORY[0x263EFF498];
      v22 = @"Attempt to create listener using proxy object which does not conform to FSConnectorMaker";
    }
    else
    {
      v20 = (void *)MEMORY[0x263EFF940];
      uint64_t v21 = *MEMORY[0x263EFF498];
      v22 = @"Attempt to create listener using proxy object which does not conform to exported protocol";
    }
    id v23 = [v20 exceptionWithName:v21 reason:v22 userInfo:0];
    objc_exception_throw(v23);
  }
LABEL_8:

  return v14;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = fskit_std_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_24DDB2000, v6, OS_LOG_TYPE_INFO, "handling incoming connection", v8, 2u);
  }

  [v5 setExportedInterface:self->_interface];
  [v5 setExportedObject:self->_proxy];
  if (self->_queue) {
    objc_msgSend(v5, "_setQueue:");
  }
  [v5 resume];

  return 1;
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8, 1);
}

- (NSXPCInterface)interface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSObject)proxy
{
  return objc_getProperty(self, a2, 32, 1);
}

- (Class)clientClass
{
  return (Class)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientClass, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end