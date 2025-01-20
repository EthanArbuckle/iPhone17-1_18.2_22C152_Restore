@interface CRSUIVolumeNotificationAssertion
- (BOOL)blockNotification;
- (BOOL)isValid;
- (BSServiceConnection)connection;
- (CRSUIVolumeNotificationAssertion)init;
- (NSUUID)identifier;
- (void)_handleConnectionActivated;
- (void)cancelSuspension;
- (void)invalidate;
- (void)setBlockNotification:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)suspendNotifications;
@end

@implementation CRSUIVolumeNotificationAssertion

- (CRSUIVolumeNotificationAssertion)init
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)CRSUIVolumeNotificationAssertion;
  v2 = [(CRSUIVolumeNotificationAssertion *)&v19 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08C38] UUID];
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = (void *)MEMORY[0x263F3F690];
    v6 = +[CRSUIVolumeNotificationSpecification identifier];
    v7 = [(NSUUID *)v2->_identifier UUIDString];
    v8 = [v5 endpointForMachName:@"com.apple.CarPlayApp.volume-notification-service" service:v6 instance:v7];

    uint64_t v9 = [MEMORY[0x263F3F688] connectionWithEndpoint:v8];
    connection = v2->_connection;
    v2->_connection = (BSServiceConnection *)v9;

    objc_initWeak(&location, v2);
    v11 = v2->_connection;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __40__CRSUIVolumeNotificationAssertion_init__block_invoke;
    v15[3] = &unk_264307720;
    v16 = v2;
    objc_copyWeak(&v17, &location);
    [(BSServiceConnection *)v11 configureConnection:v15];
    v12 = CRSUILogForCategory(1uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v2->_connection;
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_impl(&dword_21817A000, v12, OS_LOG_TYPE_DEFAULT, "Volume notification activating connection! %@", buf, 0xCu);
    }

    [(BSServiceConnection *)v2->_connection activate];
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }
  return v2;
}

void __40__CRSUIVolumeNotificationAssertion_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[CRSUIVolumeNotificationSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  v5 = +[CRSUIVolumeNotificationSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__CRSUIVolumeNotificationAssertion_init__block_invoke_2;
  v6[3] = &unk_264307798;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  [v3 setActivationHandler:v6];
  [v3 setInterruptionHandler:&__block_literal_global_1];
  [v3 setInvalidationHandler:&__block_literal_global_8_0];
  objc_destroyWeak(&v7);
}

void __40__CRSUIVolumeNotificationAssertion_init__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = CRSUILogForCategory(2uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_21817A000, v4, OS_LOG_TYPE_DEFAULT, "Volume notification connection activated! %@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionActivated];
}

void __40__CRSUIVolumeNotificationAssertion_init__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CRSUILogForCategory(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __40__CRSUIVolumeNotificationAssertion_init__block_invoke_5_cold_1((uint64_t)v2, v3);
  }
}

void __40__CRSUIVolumeNotificationAssertion_init__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CRSUILogForCategory(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __40__CRSUIVolumeNotificationAssertion_init__block_invoke_6_cold_1((uint64_t)v2, v3);
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

- (void)suspendNotifications
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_connectionActivated && !self->_lock_invalidated)
  {
    v5 = CRSUILogForCategory(2uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_21817A000, v5, OS_LOG_TYPE_DEFAULT, "Acquiring assertion", v8, 2u);
    }

    int v6 = [(CRSUIVolumeNotificationAssertion *)self connection];
    id v7 = [v6 remoteTarget];
    [v7 clientSuspendNotifications];

    uint64_t v4 = 12;
  }
  else
  {
    uint64_t v4 = 15;
  }
  *((unsigned char *)&self->super.isa + v4) = 1;
  os_unfair_lock_unlock(p_lock);
}

- (void)cancelSuspension
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_acquired && !self->_lock_invalidated)
  {
    uint64_t v4 = CRSUILogForCategory(2uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [(CRSUIVolumeNotificationAssertion *)self connection];
      int v6 = [(CRSUIVolumeNotificationAssertion *)self connection];
      id v7 = [v6 remoteTarget];
      int v10 = 138412546;
      v11 = v5;
      __int16 v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_21817A000, v4, OS_LOG_TYPE_DEFAULT, "Relinquishing volume notification assertion connection: %@. Remote target: %@", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v8 = [(CRSUIVolumeNotificationAssertion *)self connection];
    uint64_t v9 = [v8 remoteTarget];
    [v9 clientCancelSuspension];

    self->_lock_acquired = 0;
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
    uint64_t v4 = CRSUILogForCategory(2uLL);
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
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_pendingAcquire)
  {
    self->_lock_pendingAcquire = 0;
    uint64_t v4 = CRSUILogForCategory(2uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_21817A000, v4, OS_LOG_TYPE_DEFAULT, "Acquiring volume notification assertion", v7, 2u);
    }

    v5 = [(CRSUIVolumeNotificationAssertion *)self connection];
    int v6 = [v5 remoteTarget];
    [v6 clientSuspendNotifications];

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

- (BOOL)blockNotification
{
  return self->_blockNotification;
}

- (void)setBlockNotification:(BOOL)a3
{
  self->_blockNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __40__CRSUIVolumeNotificationAssertion_init__block_invoke_5_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21817A000, a2, OS_LOG_TYPE_ERROR, "Volume notification connection interrupted! %@", (uint8_t *)&v2, 0xCu);
}

void __40__CRSUIVolumeNotificationAssertion_init__block_invoke_6_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21817A000, a2, OS_LOG_TYPE_ERROR, "Volume notification connection Volume invalidated! %@", (uint8_t *)&v2, 0xCu);
}

@end