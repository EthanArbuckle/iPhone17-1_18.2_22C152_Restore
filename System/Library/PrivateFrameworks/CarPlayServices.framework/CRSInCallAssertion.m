@interface CRSInCallAssertion
- (BOOL)allowsBanners;
- (BSServiceConnection)connection;
- (CRSInCallAssertion)initWithReason:(id)a3;
- (NSString)reason;
- (void)_handleConnectionActivated;
- (void)_handleConnectionInterrupted;
- (void)activate;
- (void)invalidate;
- (void)setAllowsBanners:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setReason:(id)a3;
@end

@implementation CRSInCallAssertion

- (CRSInCallAssertion)initWithReason:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CRSInCallAssertion;
  v5 = [(CRSInCallAssertion *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    v5->_lock._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock((os_unfair_lock_t)&__counterLock);
    uint64_t v8 = __instanceCounter++;
    os_unfair_lock_unlock((os_unfair_lock_t)&__counterLock);
    v9 = NSString;
    v10 = [(CRSInCallAssertion *)v5 reason];
    v11 = [v9 stringWithFormat:@"%@-%i-%u", v10, getpid(), v8];

    v12 = (void *)MEMORY[0x263F2B9C0];
    v13 = +[CRSInCallAssertionSpecification identifier];
    v14 = [v12 endpointForMachName:@"com.apple.CarPlayApp.non-launching-service" service:v13 instance:v11];

    uint64_t v15 = [MEMORY[0x263F2B9B8] connectionWithEndpoint:v14];
    connection = v5->_connection;
    v5->_connection = (BSServiceConnection *)v15;

    objc_initWeak(&location, v5);
    v17 = v5->_connection;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __37__CRSInCallAssertion_initWithReason___block_invoke;
    v21[3] = &unk_264443470;
    v22 = v5;
    objc_copyWeak(&v23, &location);
    [(BSServiceConnection *)v17 configureConnection:v21];
    v18 = CRSLogForCategory(2uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v5->_connection;
      *(_DWORD *)buf = 138412290;
      v27 = v19;
      _os_log_impl(&dword_21D3CC000, v18, OS_LOG_TYPE_DEFAULT, "Activating connection! %@", buf, 0xCu);
    }

    [(BSServiceConnection *)v5->_connection activate];
    objc_destroyWeak(&v23);

    objc_destroyWeak(&location);
  }

  return v5;
}

void __37__CRSInCallAssertion_initWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[CRSInCallAssertionSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  v5 = +[CRSInCallAssertionSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __37__CRSInCallAssertion_initWithReason___block_invoke_2;
  v11[3] = &unk_264443448;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  [v3 setActivationHandler:v11];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __37__CRSInCallAssertion_initWithReason___block_invoke_3;
  v9 = &unk_264443448;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  [v3 setInterruptionHandler:&v6];
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_5, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
}

void __37__CRSInCallAssertion_initWithReason___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionActivated];
}

void __37__CRSInCallAssertion_initWithReason___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionInterrupted];
}

void __37__CRSInCallAssertion_initWithReason___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CRSLogForCategory(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __37__CRSInCallAssertion_initWithReason___block_invoke_4_cold_1((uint64_t)v2, v3);
  }
}

- (void)activate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_activated && !self->_lock_invalidated)
  {
    v5 = CRSLogForCategory(2uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_21D3CC000, v5, OS_LOG_TYPE_DEFAULT, "Requesting presentation!", v8, 2u);
    }

    uint64_t v6 = [(CRSInCallAssertion *)self connection];
    uint64_t v7 = [v6 remoteTarget];
    [v7 presentInCallService];

    uint64_t v4 = 13;
  }
  else
  {
    uint64_t v4 = 12;
  }
  *((unsigned char *)&self->super.isa + v4) = 1;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)allowsBanners
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_allowsBanners;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAllowsBanners:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_allowsBanners = v3;
  if (self->_lock_activated)
  {
    uint64_t v6 = [(BSServiceConnection *)self->_connection remoteTarget];
    uint64_t v7 = [NSNumber numberWithBool:v3];
    [v6 setAllowsBanners:v7];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_invalidated)
  {
    uint64_t v4 = CRSLogForCategory(2uLL);
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

- (void)_handleConnectionActivated
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v3 = CRSLogForCategory(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    int v9 = 138412290;
    id v10 = connection;
    _os_log_impl(&dword_21D3CC000, v3, OS_LOG_TYPE_DEFAULT, "Connection activated! %@", (uint8_t *)&v9, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_pendingPresent)
  {
    self->_lock_pendingPresent = 0;
    v5 = CRSLogForCategory(2uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_21D3CC000, v5, OS_LOG_TYPE_DEFAULT, "Requesting presentation!", (uint8_t *)&v9, 2u);
    }

    int v6 = [(BSServiceConnection *)self->_connection remoteTarget];
    [v6 presentInCallService];

    self->_lock_presented = 1;
  }
  uint64_t v7 = [(BSServiceConnection *)self->_connection remoteTarget];
  uint64_t v8 = [NSNumber numberWithBool:self->_lock_allowsBanners];
  [v7 setAllowsBanners:v8];

  self->_lock_activated = 1;
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_handleConnectionInterrupted
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21D3CC000, a2, OS_LOG_TYPE_ERROR, "Connection interrupted! Reactivating... %@", (uint8_t *)&v3, 0xCu);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
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
  objc_storeStrong((id *)&self->_reason, 0);
}

void __37__CRSInCallAssertion_initWithReason___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21D3CC000, a2, OS_LOG_TYPE_ERROR, "Connection invalidated! %@", (uint8_t *)&v2, 0xCu);
}

@end