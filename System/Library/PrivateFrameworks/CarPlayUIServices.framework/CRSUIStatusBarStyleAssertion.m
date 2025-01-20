@interface CRSUIStatusBarStyleAssertion
- (BOOL)isValid;
- (BOOL)siriPresentation;
- (BSServiceConnection)connection;
- (CRSUIStatusBarStyleAssertion)initWithInterfaceStyle:(int64_t)a3;
- (CRSUIStatusBarStyleAssertion)initWithInterfaceStyle:(int64_t)a3 colorVariant:(int64_t)a4;
- (CRSUIStatusBarStyleAssertion)initWithInterfaceStyle:(int64_t)a3 contrast:(int64_t)a4;
- (NSUUID)identifier;
- (id)_initWithInterfaceStyle:(int64_t)a3 colorVariant:(int64_t)a4 siriPresentation:(BOOL)a5;
- (id)initForSiriPresentation;
- (int64_t)colorVariant;
- (int64_t)interfaceStyle;
- (void)_handleConnectionActivated;
- (void)acquireWithAnimationSettings:(id)a3;
- (void)invalidate;
- (void)relinquishWithAnimationSettings:(id)a3;
- (void)setColorVariant:(int64_t)a3;
- (void)setConnection:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterfaceStyle:(int64_t)a3;
- (void)setSiriPresentation:(BOOL)a3;
@end

@implementation CRSUIStatusBarStyleAssertion

- (CRSUIStatusBarStyleAssertion)initWithInterfaceStyle:(int64_t)a3
{
  return [(CRSUIStatusBarStyleAssertion *)self initWithInterfaceStyle:a3 colorVariant:-1];
}

- (CRSUIStatusBarStyleAssertion)initWithInterfaceStyle:(int64_t)a3 colorVariant:(int64_t)a4
{
  return (CRSUIStatusBarStyleAssertion *)[(CRSUIStatusBarStyleAssertion *)self _initWithInterfaceStyle:a3 colorVariant:a4 siriPresentation:0];
}

- (CRSUIStatusBarStyleAssertion)initWithInterfaceStyle:(int64_t)a3 contrast:(int64_t)a4
{
  if (a4 == 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = -1;
  }
  if (a4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  return (CRSUIStatusBarStyleAssertion *)[(CRSUIStatusBarStyleAssertion *)self _initWithInterfaceStyle:a3 colorVariant:v5 siriPresentation:0];
}

- (id)initForSiriPresentation
{
  return [(CRSUIStatusBarStyleAssertion *)self _initWithInterfaceStyle:0 colorVariant:-1 siriPresentation:1];
}

- (id)_initWithInterfaceStyle:(int64_t)a3 colorVariant:(int64_t)a4 siriPresentation:(BOOL)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)CRSUIStatusBarStyleAssertion;
  v8 = [(CRSUIStatusBarStyleAssertion *)&v26 init];
  v9 = v8;
  if (v8)
  {
    v8->_interfaceStyle = a3;
    v8->_colorVariant = a4;
    v8->_siriPresentation = a5;
    uint64_t v10 = [MEMORY[0x263F08C38] UUID];
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v10;

    v9->_lock._os_unfair_lock_opaque = 0;
    v12 = (void *)MEMORY[0x263F3F690];
    v13 = +[CRSUIStatusBarStyleSpecification identifier];
    v14 = [(NSUUID *)v9->_identifier UUIDString];
    v15 = [v12 endpointForMachName:@"com.apple.CarPlayApp.status-bar-service" service:v13 instance:v14];

    uint64_t v16 = [MEMORY[0x263F3F688] connectionWithEndpoint:v15];
    connection = v9->_connection;
    v9->_connection = (BSServiceConnection *)v16;

    objc_initWeak(&location, v9);
    v18 = v9->_connection;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke;
    v22[3] = &unk_264307720;
    v23 = v9;
    objc_copyWeak(&v24, &location);
    [(BSServiceConnection *)v18 configureConnection:v22];
    v19 = CRSUILogForCategory(1uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v9->_connection;
      *(_DWORD *)buf = 138412290;
      v28 = v20;
      _os_log_impl(&dword_21817A000, v19, OS_LOG_TYPE_DEFAULT, "Activating connection! %@", buf, 0xCu);
    }

    [(BSServiceConnection *)v9->_connection activate];
    objc_destroyWeak(&v24);

    objc_destroyWeak(&location);
  }
  return v9;
}

void __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[CRSUIStatusBarStyleSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  uint64_t v5 = +[CRSUIStatusBarStyleSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke_2;
  v6[3] = &unk_264307798;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  [v3 setActivationHandler:v6];
  [v3 setInterruptionHandler:&__block_literal_global_2];
  [v3 setInvalidationHandler:&__block_literal_global_8_1];
  objc_destroyWeak(&v7);
}

void __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = CRSUILogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_21817A000, v4, OS_LOG_TYPE_DEFAULT, "Connection activated! %@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionActivated];
}

void __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CRSUILogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke_5_cold_1((uint64_t)v2, v3);
  }
}

void __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CRSUILogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke_2_cold_1((uint64_t)v2, v3);
  }
}

- (BOOL)isValid
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_acquired;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)acquireWithAnimationSettings:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BSDispatchQueueAssertMain();
  os_unfair_lock_lock(&self->_lock);
  int v6 = [MEMORY[0x263F1CBD0] _synchronizedDrawingFence];
  if (self->_lock_connectionActivated && !self->_lock_invalidated)
  {
    if ([(CRSUIStatusBarStyleAssertion *)self siriPresentation])
    {
      id v7 = CRSUILogForCategory(1uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13[0]) = 0;
        _os_log_impl(&dword_21817A000, v7, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for Siri presentation", (uint8_t *)v13, 2u);
      }

      uint64_t v8 = [(CRSUIStatusBarStyleAssertion *)self connection];
      v9 = [v8 remoteTarget];
      [v9 clientAcquireForSiriPresentationWithFenceHandle:v6 animationSettings:v5];
    }
    else
    {
      if ([(CRSUIStatusBarStyleAssertion *)self interfaceStyle])
      {
        uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[CRSUIStatusBarStyleAssertion interfaceStyle](self, "interfaceStyle"));
      }
      else
      {
        uint64_t v8 = 0;
      }
      if ([(CRSUIStatusBarStyleAssertion *)self colorVariant] == -1)
      {
        v9 = 0;
      }
      else
      {
        v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[CRSUIStatusBarStyleAssertion colorVariant](self, "colorVariant"));
      }
      uint64_t v10 = CRSUILogForCategory(1uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v13[0] = 67109376;
        v13[1] = [(CRSUIStatusBarStyleAssertion *)self interfaceStyle];
        __int16 v14 = 1024;
        int v15 = [(CRSUIStatusBarStyleAssertion *)self colorVariant];
        _os_log_impl(&dword_21817A000, v10, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for interface style: %d, color variant: %d", (uint8_t *)v13, 0xEu);
      }

      v11 = [(CRSUIStatusBarStyleAssertion *)self connection];
      v12 = [v11 remoteTarget];
      [v12 clientAcquireWithInterfaceStyle:v8 colorVariant:v9 fenceHandle:v6 animationSettings:v5];
    }
    self->_lock_acquired = 1;
  }
  else
  {
    self->_lock_pendingAcquire = 1;
    objc_storeStrong((id *)&self->_lock_pendingAcquireFence, v6);
    objc_storeStrong((id *)&self->_lock_pendingAcquireAnimationSettings, a3);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)relinquishWithAnimationSettings:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  os_unfair_lock_lock(&self->_lock);
  id v5 = [MEMORY[0x263F1CBD0] _synchronizedDrawingFence];
  if (self->_lock_acquired && !self->_lock_invalidated)
  {
    int v6 = CRSUILogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21817A000, v6, OS_LOG_TYPE_DEFAULT, "Relinquishing status bar style assertion", v9, 2u);
    }

    id v7 = [(CRSUIStatusBarStyleAssertion *)self connection];
    uint64_t v8 = [v7 remoteTarget];
    [v8 clientReliquishWithFenceHandle:v5 animationSettings:v4];

    self->_lock_acquired = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_invalidated)
  {
    id v4 = CRSUILogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      connection = self->_connection;
      int v6 = 138412290;
      id v7 = connection;
      _os_log_impl(&dword_21817A000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating connection! %@", (uint8_t *)&v6, 0xCu);
    }

    [(BSServiceConnection *)self->_connection invalidate];
    self->_lock_invalidated = 1;
    self->_lock_acquired = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_handleConnectionActivated
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_pendingAcquire)
  {
    self->_lock_pendingAcquire = 0;
    if ([(CRSUIStatusBarStyleAssertion *)self siriPresentation])
    {
      id v4 = CRSUILogForCategory(1uLL);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12[0]) = 0;
        _os_log_impl(&dword_21817A000, v4, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for Siri presentation", (uint8_t *)v12, 2u);
      }

      id v5 = [(CRSUIStatusBarStyleAssertion *)self connection];
      int v6 = [v5 remoteTarget];
      [v6 clientAcquireForSiriPresentationWithFenceHandle:self->_lock_pendingAcquireFence animationSettings:self->_lock_pendingAcquireAnimationSettings];
    }
    else
    {
      if ([(CRSUIStatusBarStyleAssertion *)self interfaceStyle])
      {
        id v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[CRSUIStatusBarStyleAssertion interfaceStyle](self, "interfaceStyle"));
      }
      else
      {
        id v5 = 0;
      }
      if ([(CRSUIStatusBarStyleAssertion *)self colorVariant] == -1)
      {
        int v6 = 0;
      }
      else
      {
        int v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[CRSUIStatusBarStyleAssertion colorVariant](self, "colorVariant"));
      }
      id v7 = CRSUILogForCategory(1uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v12[0] = 67109376;
        v12[1] = [(CRSUIStatusBarStyleAssertion *)self interfaceStyle];
        __int16 v13 = 1024;
        int v14 = [(CRSUIStatusBarStyleAssertion *)self colorVariant];
        _os_log_impl(&dword_21817A000, v7, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for interface style: %d, contrast: %d", (uint8_t *)v12, 0xEu);
      }

      uint64_t v8 = [(CRSUIStatusBarStyleAssertion *)self connection];
      v9 = [v8 remoteTarget];
      [v9 clientAcquireWithInterfaceStyle:v5 colorVariant:v6 fenceHandle:self->_lock_pendingAcquireFence animationSettings:self->_lock_pendingAcquireAnimationSettings];
    }
    lock_pendingAcquireFence = self->_lock_pendingAcquireFence;
    self->_lock_pendingAcquireFence = 0;

    lock_pendingAcquireAnimationSettings = self->_lock_pendingAcquireAnimationSettings;
    self->_lock_pendingAcquireAnimationSettings = 0;

    self->_lock_acquired = 1;
  }
  self->_lock_connectionActivated = 1;
  os_unfair_lock_unlock(p_lock);
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)interfaceStyle
{
  return self->_interfaceStyle;
}

- (void)setInterfaceStyle:(int64_t)a3
{
  self->_interfaceStyle = a3;
}

- (int64_t)colorVariant
{
  return self->_colorVariant;
}

- (void)setColorVariant:(int64_t)a3
{
  self->_colorVariant = a3;
}

- (BOOL)siriPresentation
{
  return self->_siriPresentation;
}

- (void)setSiriPresentation:(BOOL)a3
{
  self->_siriPresentation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_lock_pendingAcquireAnimationSettings, 0);
  objc_storeStrong((id *)&self->_lock_pendingAcquireFence, 0);
}

void __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke_5_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21817A000, a2, OS_LOG_TYPE_ERROR, "Connection interrupted! %@", (uint8_t *)&v2, 0xCu);
}

@end