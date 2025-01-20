@interface CARNavigationOwnershipManager
- (BOOL)ownershipRequested;
- (BOOL)supportsAccNav;
- (CARNavigationOwnershipManager)initWithIdentifier:(id)a3 delegate:(id)a4;
- (CARNavigationOwnershipManagerDelegate)delegate;
- (NSString)identifier;
- (NSString)lastNavigatingBundleIdentifier;
- (NSXPCConnection)connection;
- (unint64_t)owner;
- (void)_handleConnectionReset;
- (void)_setupConnection;
- (void)invalidate;
- (void)navigationOwnershipChangedTo:(unint64_t)a3;
- (void)releaseNavigationOwnership;
- (void)requestNavigationOwnership;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOwnershipRequested:(BOOL)a3;
- (void)setSupportsAccNav:(BOOL)a3;
@end

@implementation CARNavigationOwnershipManager

- (CARNavigationOwnershipManager)initWithIdentifier:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CARNavigationOwnershipManager;
  v8 = [(CARNavigationOwnershipManager *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_storeWeak((id *)&v8->_delegate, v7);
    v8->_ownershipRequested = 0;
    [(CARNavigationOwnershipManager *)v8 _setupConnection];
  }

  return v8;
}

- (void)invalidate
{
  id v2 = [(CARNavigationOwnershipManager *)self connection];
  [v2 invalidate];
}

- (void)requestNavigationOwnership
{
  v3 = [(CARNavigationOwnershipManager *)self connection];
  v4 = [v3 remoteObjectProxy];
  v5 = [(CARNavigationOwnershipManager *)self identifier];
  [v4 addNavigationOwnerWithIdentifier:v5];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CARNavigationOwnershipManager_requestNavigationOwnership__block_invoke;
  block[3] = &unk_1E5E3A938;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __59__CARNavigationOwnershipManager_requestNavigationOwnership__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOwnershipRequested:1];
}

- (void)releaseNavigationOwnership
{
  v3 = [(CARNavigationOwnershipManager *)self connection];
  v4 = [v3 remoteObjectProxy];
  v5 = [(CARNavigationOwnershipManager *)self identifier];
  [v4 removeNavigationOwnerWithIdentifier:v5];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CARNavigationOwnershipManager_releaseNavigationOwnership__block_invoke;
  block[3] = &unk_1E5E3A938;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __59__CARNavigationOwnershipManager_releaseNavigationOwnership__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOwnershipRequested:0];
}

- (unint64_t)owner
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = [(CARNavigationOwnershipManager *)self connection];
  v5 = [v4 remoteObjectProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__CARNavigationOwnershipManager_owner__block_invoke;
  v10[3] = &unk_1E5E3C218;
  objc_super v12 = &v13;
  id v6 = v3;
  v11 = v6;
  [v5 fetchNavigationOwnerWithReply:v10];

  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v6, v7);
  unint64_t v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

intptr_t __38__CARNavigationOwnershipManager_owner__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSString)lastNavigatingBundleIdentifier
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  id v18 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = [(CARNavigationOwnershipManager *)self connection];
  v5 = [v4 remoteObjectProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__CARNavigationOwnershipManager_lastNavigatingBundleIdentifier__block_invoke;
  v10[3] = &unk_1E5E3C240;
  objc_super v12 = &v13;
  id v6 = v3;
  v11 = v6;
  [v5 fetchNavigationIdentifierWithReply:v10];

  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v6, v7);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return (NSString *)v8;
}

void __63__CARNavigationOwnershipManager_lastNavigatingBundleIdentifier__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_setupConnection
{
  dispatch_semaphore_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.carkit.navowners.service" options:4096];
  id v4 = CRCarPlayNavigationOwnerClientInterface();
  [v3 setExportedInterface:v4];

  [v3 setExportedObject:self];
  v5 = CRCarPlayNavigationOwnersServiceInterface();
  [v3 setRemoteObjectInterface:v5];

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__CARNavigationOwnershipManager__setupConnection__block_invoke;
  v8[3] = &unk_1E5E3AC10;
  objc_copyWeak(&v9, &location);
  [v3 setInterruptionHandler:v8];
  id v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v7 = 0;
    _os_log_impl(&dword_1ABB00000, v6, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit navigation ownership service.", v7, 2u);
  }

  [v3 resume];
  [(CARNavigationOwnershipManager *)self setConnection:v3];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__CARNavigationOwnershipManager__setupConnection__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setupConnection];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _handleConnectionReset];
}

- (void)_handleConnectionReset
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CARNavigationOwnershipManager__handleConnectionReset__block_invoke;
  block[3] = &unk_1E5E3A938;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __55__CARNavigationOwnershipManager__handleConnectionReset__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) ownershipRequested])
  {
    id v2 = [*(id *)(a1 + 32) connection];
    id v3 = [v2 remoteObjectProxy];
    id v4 = [*(id *)(a1 + 32) identifier];
    [v3 addNavigationOwnerWithIdentifier:v4];

    v5 = CarGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) identifier];
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "Requesting navigation ownership after connection interruption with identifier: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)navigationOwnershipChangedTo:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"None";
    if (a3 == 1) {
      id v6 = @"iOS";
    }
    if (a3 == 2) {
      id v6 = @"Car";
    }
    int v7 = v6;
    *(_DWORD *)buf = 138412546;
    v10 = self;
    __int16 v11 = 2112;
    objc_super v12 = v7;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "%@: Navigation ownership changed to %@", buf, 0x16u);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__CARNavigationOwnershipManager_navigationOwnershipChangedTo___block_invoke;
  v8[3] = &unk_1E5E3B9A8;
  void v8[4] = self;
  v8[5] = a3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __62__CARNavigationOwnershipManager_navigationOwnershipChangedTo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 navigationOwnershipChangedToOwner:*(void *)(a1 + 40)];
}

- (BOOL)supportsAccNav
{
  return self->_supportsAccNav;
}

- (void)setSupportsAccNav:(BOOL)a3
{
  self->_supportsAccNav = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (BOOL)ownershipRequested
{
  return self->_ownershipRequested;
}

- (void)setOwnershipRequested:(BOOL)a3
{
  self->_ownershipRequested = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CARNavigationOwnershipManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CARNavigationOwnershipManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end