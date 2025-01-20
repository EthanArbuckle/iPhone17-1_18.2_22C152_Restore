@interface ILMessageFilter
- (ILMessageFilter)init;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)performCapabilitiesQueryRequest:(id)a3 completion:(id)a4;
- (void)performClassificationReportRequest:(id)a3 completion:(id)a4;
- (void)performQueryRequest:(id)a3 completion:(id)a4;
- (void)performReportRequest:(id)a3 completion:(id)a4;
@end

@implementation ILMessageFilter

- (ILMessageFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)ILMessageFilter;
  v2 = [(ILMessageFilter *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.identitylookup.messagefilter", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ILMessageFilter;
  [(ILMessageFilter *)&v3 dealloc];
}

- (NSXPCConnection)connection
{
  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.IdentityLookup.MessageFilter"];
    v5 = self->_connection;
    self->_connection = v4;

    objc_super v6 = objc_msgSend(MEMORY[0x263F08D80], "il_messageFilterHostInterface");
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];

    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __29__ILMessageFilter_connection__block_invoke;
    v10[3] = &unk_26446FA18;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v10];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __29__ILMessageFilter_connection__block_invoke_2;
    v8[3] = &unk_26446FA18;
    objc_copyWeak(&v9, &location);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v8];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

void __29__ILMessageFilter_connection__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = ILDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = WeakRetained;
    _os_log_impl(&dword_21DAC7000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for message filter %@", buf, 0xCu);
  }

  objc_super v3 = [WeakRetained queue];

  if (v3)
  {
    v4 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__ILMessageFilter_connection__block_invoke_8;
    block[3] = &unk_26446F9F0;
    block[4] = WeakRetained;
    dispatch_async(v4, block);
  }
}

uint64_t __29__ILMessageFilter_connection__block_invoke_8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
}

void __29__ILMessageFilter_connection__block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = ILDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = WeakRetained;
    _os_log_impl(&dword_21DAC7000, v2, OS_LOG_TYPE_DEFAULT, "Default connection invalidated for message filter %@", buf, 0xCu);
  }

  objc_super v3 = [WeakRetained queue];

  if (v3)
  {
    v4 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__ILMessageFilter_connection__block_invoke_10;
    block[3] = &unk_26446F9F0;
    block[4] = WeakRetained;
    dispatch_async(v4, block);
  }
}

void __29__ILMessageFilter_connection__block_invoke_10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(ILMessageFilter *)self connection];
  objc_super v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (void)performQueryRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ILMessageFilter *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ILMessageFilter_performQueryRequest_completion___block_invoke;
  block[3] = &unk_26446FA40;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __50__ILMessageFilter_performQueryRequest_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__ILMessageFilter_performQueryRequest_completion___block_invoke_2;
  v4[3] = &unk_26446F8E8;
  id v5 = *(id *)(a1 + 48);
  objc_super v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 performQueryRequest:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

void __50__ILMessageFilter_performQueryRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ILDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __50__ILMessageFilter_performQueryRequest_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performReportRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ILMessageFilter *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__ILMessageFilter_performReportRequest_completion___block_invoke;
  block[3] = &unk_26446FA40;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __51__ILMessageFilter_performReportRequest_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__ILMessageFilter_performReportRequest_completion___block_invoke_2;
  v4[3] = &unk_26446F8E8;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 performReportRequest:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

void __51__ILMessageFilter_performReportRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ILDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__ILMessageFilter_performReportRequest_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performCapabilitiesQueryRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ILMessageFilter *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__ILMessageFilter_performCapabilitiesQueryRequest_completion___block_invoke;
  block[3] = &unk_26446FA40;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __62__ILMessageFilter_performCapabilitiesQueryRequest_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__ILMessageFilter_performCapabilitiesQueryRequest_completion___block_invoke_2;
  v4[3] = &unk_26446F8E8;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 performCapabilitiesQueryRequest:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

void __62__ILMessageFilter_performCapabilitiesQueryRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ILDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__ILMessageFilter_performCapabilitiesQueryRequest_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performClassificationReportRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ILMessageFilter *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__ILMessageFilter_performClassificationReportRequest_completion___block_invoke;
  block[3] = &unk_26446FA40;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __65__ILMessageFilter_performClassificationReportRequest_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__ILMessageFilter_performClassificationReportRequest_completion___block_invoke_2;
  v4[3] = &unk_26446F8E8;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 performClassificationReportRequest:*(void *)(a1 + 40)];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __65__ILMessageFilter_performClassificationReportRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ILDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __50__ILMessageFilter_performQueryRequest_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __50__ILMessageFilter_performQueryRequest_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21DAC7000, v0, v1, "received error calling remote object proxy: %@", v2, v3, v4, v5, v6);
}

void __51__ILMessageFilter_performReportRequest_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21DAC7000, v0, v1, "received error calling remote object proxy for performReportRequest: %@", v2, v3, v4, v5, v6);
}

void __62__ILMessageFilter_performCapabilitiesQueryRequest_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21DAC7000, v0, v1, "received error calling remote object proxy for performCapabilitiesQueryRequest: %@", v2, v3, v4, v5, v6);
}

@end