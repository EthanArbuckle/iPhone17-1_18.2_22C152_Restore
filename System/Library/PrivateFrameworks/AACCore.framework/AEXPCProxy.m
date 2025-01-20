@interface AEXPCProxy
- (id)initWithOrigin:(void *)a3 interface:;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)makeConnection;
- (void)connection;
- (void)connectionDidInterrupt;
- (void)connectionDidInvalidate;
- (void)dealloc;
- (void)invalidate;
- (void)remoteObjectProxyWithErrorHandler:(void *)a1;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)synchronousRemoteObjectProxyWithErrorHandler:(void *)a1;
@end

@implementation AEXPCProxy

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AEXPCProxy;
  [(AEXPCProxy *)&v3 dealloc];
}

- (id)initWithOrigin:(void *)a3 interface:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)AEXPCProxy;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 4, a2);
      objc_storeStrong(a1 + 5, a3);
    }
  }

  return a1;
}

- (void)remoteObjectProxyWithErrorHandler:(void *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = -[AEXPCProxy connection](v2);
    v2 = [v4 remoteObjectProxyWithErrorHandler:v3];
  }
  return v2;
}

- (void)connection
{
  if (val)
  {
    v2 = val;
    id v3 = (void *)val[1];
    if (!v3)
    {
      uint64_t v4 = -[AEXPCProxy makeConnection]((id *)val);
      v5 = (void *)v2[1];
      v2[1] = v4;

      id v3 = (void *)v2[1];
    }
    val = v3;
    uint64_t v1 = vars8;
  }
  return val;
}

- (void)synchronousRemoteObjectProxyWithErrorHandler:(void *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    uint64_t v4 = -[AEXPCProxy connection](v2);
    v2 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v3];
  }
  return v2;
}

- (void)invalidate
{
}

- (id)makeConnection
{
  if (val)
  {
    objc_initWeak(&location, val);
    id v2 = val[4];
    id v3 = [v2 makeConnection];

    id v4 = val[5];
    [v3 setRemoteObjectInterface:v4];

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __28__AEXPCProxy_makeConnection__block_invoke;
    v8[3] = &unk_264EA37A8;
    objc_copyWeak(&v9, &location);
    [v3 setInterruptionHandler:v8];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __28__AEXPCProxy_makeConnection__block_invoke_2;
    v6[3] = &unk_264EA37A8;
    objc_copyWeak(&v7, &location);
    [v3 setInvalidationHandler:v6];
    [v3 resume];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

void __28__AEXPCProxy_makeConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[AEXPCProxy connectionDidInterrupt](WeakRetained);
}

- (void)connectionDidInterrupt
{
  if (a1)
  {
    uint64_t v1 = [a1 interruptionHandler];
    if (v1)
    {
      id v2 = v1;
      v1[2]();
      uint64_t v1 = v2;
    }
  }
}

void __28__AEXPCProxy_makeConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[AEXPCProxy connectionDidInvalidate](WeakRetained);
}

- (void)connectionDidInvalidate
{
  if (a1)
  {
    uint64_t v3 = [a1 invalidationHandler];
    [a1 setInvalidationHandler:0];
    id v2 = (void *)v3;
    if (v3)
    {
      (*(void (**)(uint64_t))(v3 + 16))(v3);
      id v2 = (void *)v3;
    }
  }
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end