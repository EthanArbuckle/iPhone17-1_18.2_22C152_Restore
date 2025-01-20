@interface CRSSessionController
- (BSServiceConnection)connection;
- (CRSSessionController)init;
- (RBSProcessHandle)process;
- (void)invalidate;
- (void)setConnection:(id)a3;
- (void)setProcess:(id)a3;
@end

@implementation CRSSessionController

- (CRSSessionController)init
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)CRSSessionController;
  v2 = [(CRSSessionController *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (void *)MEMORY[0x263F2B9C0];
    v5 = +[CRSSessionSpecification identifier];
    v6 = [v4 endpointForMachName:@"com.apple.CarPlayApp.service" service:v5 instance:0];

    uint64_t v7 = [MEMORY[0x263F2B9B8] connectionWithEndpoint:v6];
    connection = v3->_connection;
    v3->_connection = (BSServiceConnection *)v7;

    v9 = v3->_connection;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __28__CRSSessionController_init__block_invoke;
    v13[3] = &unk_264443180;
    v14 = v3;
    [(BSServiceConnection *)v9 configureConnection:v13];
    v10 = CRSLogForCategory(3uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v3->_connection;
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl(&dword_21D3CC000, v10, OS_LOG_TYPE_DEFAULT, "Activating connection! %@", buf, 0xCu);
    }

    [(BSServiceConnection *)v3->_connection activate];
  }
  return v3;
}

void __28__CRSSessionController_init__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = +[CRSSessionSpecification serviceQuality];
  [v5 setServiceQuality:v3];

  v4 = +[CRSSessionSpecification interface];
  [v5 setInterface:v4];

  [v5 setInterfaceTarget:*(void *)(a1 + 32)];
  [v5 setActivationHandler:&__block_literal_global_0];
  [v5 setInterruptionHandler:&__block_literal_global_6];
  [v5 setInvalidationHandler:&__block_literal_global_9];
}

void __28__CRSSessionController_init__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = CRSLogForCategory(3uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_21D3CC000, v3, OS_LOG_TYPE_DEFAULT, "Connection activated! %@", (uint8_t *)&v4, 0xCu);
  }
}

void __28__CRSSessionController_init__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = CRSLogForCategory(3uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_21D3CC000, v3, OS_LOG_TYPE_DEFAULT, "Connection interrupted! Reactivating... %@", (uint8_t *)&v4, 0xCu);
  }

  [v2 activate];
}

void __28__CRSSessionController_init__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = CRSLogForCategory(3uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_21D3CC000, v3, OS_LOG_TYPE_DEFAULT, "Connection invalidated! %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_invalidated)
  {
    int v4 = CRSLogForCategory(3uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      connection = self->_connection;
      int v6 = 138412290;
      uint64_t v7 = connection;
      _os_log_impl(&dword_21D3CC000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating connection! %@", (uint8_t *)&v6, 0xCu);
    }

    [(BSServiceConnection *)self->_connection invalidate];
    self->_lock_invalidated = 1;
  }
  os_unfair_lock_unlock(p_lock);
}

- (RBSProcessHandle)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

@end