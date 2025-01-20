@interface CRKValidXPCConnectionProvider
- (CRKValidXPCConnectionProvider)initWithBuilder:(id)a3;
- (NSXPCConnection)backingConnection;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (id)builder;
- (id)captureConnection;
- (id)invokeBuilder;
- (id)makeConnection;
- (id)unprotectedConnection;
- (void)connectionDied:(id)a3;
- (void)dealloc;
- (void)setBackingConnection:(id)a3;
- (void)tearDownConnection;
@end

@implementation CRKValidXPCConnectionProvider

- (void)dealloc
{
  [(CRKValidXPCConnectionProvider *)self tearDownConnection];
  v3.receiver = self;
  v3.super_class = (Class)CRKValidXPCConnectionProvider;
  [(CRKValidXPCConnectionProvider *)&v3 dealloc];
}

- (CRKValidXPCConnectionProvider)initWithBuilder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRKValidXPCConnectionProvider;
  v5 = [(CRKValidXPCConnectionProvider *)&v12 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x22A620AF0](v4);
    id builder = v5->_builder;
    v5->_id builder = (id)v6;

    id v8 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v5];
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;
  }
  return v5;
}

- (NSXPCConnection)connection
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  objc_super v3 = [(CRKValidXPCConnectionProvider *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__CRKValidXPCConnectionProvider_connection__block_invoke;
  v6[3] = &unk_2646F55B8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSXPCConnection *)v4;
}

uint64_t __43__CRKValidXPCConnectionProvider_connection__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) unprotectedConnection];

  return MEMORY[0x270F9A758]();
}

- (id)unprotectedConnection
{
  objc_super v3 = [(CRKValidXPCConnectionProvider *)self backingConnection];

  if (!v3)
  {
    id v4 = [(CRKValidXPCConnectionProvider *)self makeConnection];
    [(CRKValidXPCConnectionProvider *)self setBackingConnection:v4];
  }

  return [(CRKValidXPCConnectionProvider *)self backingConnection];
}

- (id)makeConnection
{
  objc_super v3 = [(CRKValidXPCConnectionProvider *)self invokeBuilder];
  objc_initWeak(&location, v3);
  objc_initWeak(&from, self);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __47__CRKValidXPCConnectionProvider_makeConnection__block_invoke;
  uint64_t v9 = &unk_2646F5608;
  objc_copyWeak(&v10, &from);
  objc_copyWeak(&v11, &location);
  id v4 = (void *)MEMORY[0x22A620AF0](&v6);
  objc_msgSend(v3, "setInterruptionHandler:", v4, v6, v7, v8, v9);
  [v3 setInvalidationHandler:v4];
  [v3 resume];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v3;
}

void __47__CRKValidXPCConnectionProvider_makeConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained queue];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __47__CRKValidXPCConnectionProvider_makeConnection__block_invoke_2;
    v5[3] = &unk_2646F55E0;
    v5[4] = v3;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    dispatch_async(v4, v5);

    objc_destroyWeak(&v6);
  }
}

void __47__CRKValidXPCConnectionProvider_makeConnection__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 connectionDied:WeakRetained];
}

- (id)invokeBuilder
{
  objc_super v3 = (void *)MEMORY[0x22A6208B0](self, a2);
  id v4 = [(CRKValidXPCConnectionProvider *)self builder];
  v5 = v4[2]();

  return v5;
}

- (void)connectionDied:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKValidXPCConnectionProvider *)self backingConnection];

  if (v5 == v4)
  {
    if (_CRKLogGeneral_onceToken_34 != -1) {
      dispatch_once(&_CRKLogGeneral_onceToken_34, &__block_literal_global_103);
    }
    id v6 = _CRKLogGeneral_logObj_34;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_34, OS_LOG_TYPE_ERROR)) {
      -[CRKValidXPCConnectionProvider connectionDied:]((uint64_t)v4, v6);
    }
    [(CRKValidXPCConnectionProvider *)self tearDownConnection];
  }
}

- (void)tearDownConnection
{
  id v2 = [(CRKValidXPCConnectionProvider *)self captureConnection];
  [v2 setInterruptionHandler:0];
  [v2 setInvalidationHandler:0];
  [v2 invalidate];
}

- (id)captureConnection
{
  objc_super v3 = [(CRKValidXPCConnectionProvider *)self backingConnection];
  [(CRKValidXPCConnectionProvider *)self setBackingConnection:0];

  return v3;
}

- (NSXPCConnection)backingConnection
{
  return self->_backingConnection;
}

- (void)setBackingConnection:(id)a3
{
}

- (id)builder
{
  return self->_builder;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_builder, 0);

  objc_storeStrong((id *)&self->_backingConnection, 0);
}

- (void)connectionDied:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "XPC connection died: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end