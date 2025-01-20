@interface CRSUIPunchThroughController
- (BSServiceConnection)connection;
- (CRSUIPunchThroughController)initWithPunchThroughIdentifier:(id)a3;
- (CRSUIPunchThroughControllerDelegate)delegate;
- (NSString)punchThroughIdentifier;
- (void)_handleConnectionActivated;
- (void)invalidate;
- (void)requestDismissalWithCompletion:(id)a3;
- (void)requestPresentationWithCompletion:(id)a3;
- (void)serverDismissedPunchThroughIdentifier:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPunchThroughIdentifier:(id)a3;
@end

@implementation CRSUIPunchThroughController

- (CRSUIPunchThroughController)initWithPunchThroughIdentifier:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CRSUIPunchThroughController;
  v6 = [(CRSUIPunchThroughController *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_punchThroughIdentifier, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v8 = (void *)MEMORY[0x263F3F690];
    v9 = +[CRSUIPunchThroughSpecification identifier];
    v10 = [v8 endpointForMachName:@"com.apple.CarPlayApp.punch-through-service" service:v9 instance:0];

    uint64_t v11 = [MEMORY[0x263F3F688] connectionWithEndpoint:v10];
    connection = v7->_connection;
    v7->_connection = (BSServiceConnection *)v11;

    objc_initWeak(&location, v7);
    v13 = v7->_connection;
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __62__CRSUIPunchThroughController_initWithPunchThroughIdentifier___block_invoke;
    v20 = &unk_264307868;
    objc_copyWeak(&v21, &location);
    [(BSServiceConnection *)v13 configureConnection:&v17];
    v14 = CRSUILogForCategory(5uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v7->_connection;
      *(_DWORD *)buf = 138412290;
      v25 = v15;
      _os_log_impl(&dword_21817A000, v14, OS_LOG_TYPE_DEFAULT, "Activating connection! %@", buf, 0xCu);
    }

    [(BSServiceConnection *)v7->_connection activate];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __62__CRSUIPunchThroughController_initWithPunchThroughIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[CRSUIPunchThroughSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  id v5 = +[CRSUIPunchThroughSpecification interface];
  [v3 setInterface:v5];

  v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 setInterfaceTarget:WeakRetained];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__CRSUIPunchThroughController_initWithPunchThroughIdentifier___block_invoke_2;
  v8[3] = &unk_264307798;
  objc_copyWeak(&v9, v6);
  [v3 setActivationHandler:v8];
  [v3 setInterruptionHandler:&__block_literal_global_9];
  [v3 setInvalidationHandler:&__block_literal_global_7];
  objc_destroyWeak(&v9);
}

void __62__CRSUIPunchThroughController_initWithPunchThroughIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = CRSUILogForCategory(5uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_21817A000, v4, OS_LOG_TYPE_DEFAULT, "Connection activated! %@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionActivated];
}

void __62__CRSUIPunchThroughController_initWithPunchThroughIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CRSUILogForCategory(5uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke_5_cold_1((uint64_t)v2, v3);
  }
}

void __62__CRSUIPunchThroughController_initWithPunchThroughIdentifier___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CRSUILogForCategory(5uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke_2_cold_1((uint64_t)v2, v3);
  }
}

- (void)requestPresentationWithCompletion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_connectionActivated)
  {
    if (!self->_lock_invalidated)
    {
      id v5 = [(CRSUIPunchThroughController *)self connection];
      int v6 = [v5 remoteTarget];
      id v7 = [(CRSUIPunchThroughController *)self punchThroughIdentifier];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __65__CRSUIPunchThroughController_requestPresentationWithCompletion___block_invoke;
      v10[3] = &unk_264307770;
      id v11 = v4;
      [v6 clientRequestPresentationForPunchThroughIdentifier:v7 completion:v10];

      id lock_pendingPresentationCompletion = v11;
LABEL_6:
    }
  }
  else if (!self->_lock_invalidated)
  {
    self->_lock_hasPendingPresentationRequest = 1;
    id v9 = (void *)MEMORY[0x21D464300](v4);
    id lock_pendingPresentationCompletion = self->_lock_pendingPresentationCompletion;
    self->_id lock_pendingPresentationCompletion = v9;
    goto LABEL_6;
  }
  self->_lock_presented = 1;
  os_unfair_lock_unlock(&self->_lock);
}

void __65__CRSUIPunchThroughController_requestPresentationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__CRSUIPunchThroughController_requestPresentationWithCompletion___block_invoke_2;
  v6[3] = &unk_2643079C0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __65__CRSUIPunchThroughController_requestPresentationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(void *)(a1 + 32) == 0);
  }
  return result;
}

- (void)requestDismissalWithCompletion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_connectionActivated && !self->_lock_invalidated && self->_lock_presented)
  {
    id v5 = [(CRSUIPunchThroughController *)self connection];
    int v6 = [v5 remoteTarget];
    id v7 = [(CRSUIPunchThroughController *)self punchThroughIdentifier];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __62__CRSUIPunchThroughController_requestDismissalWithCompletion___block_invoke;
    v8[3] = &unk_264307770;
    id v9 = v4;
    [v6 clientRequestDismissalForPunchThroughIdentifier:v7 completion:v8];
  }
  self->_lock_presented = 0;
  os_unfair_lock_unlock(&self->_lock);
}

void __62__CRSUIPunchThroughController_requestDismissalWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__CRSUIPunchThroughController_requestDismissalWithCompletion___block_invoke_2;
  v6[3] = &unk_2643079C0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __62__CRSUIPunchThroughController_requestDismissalWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(void *)(a1 + 32) == 0);
  }
  return result;
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_invalidated)
  {
    id v4 = CRSUILogForCategory(5uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      connection = self->_connection;
      int v6 = 138412290;
      id v7 = connection;
      _os_log_impl(&dword_21817A000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating connection! %@", (uint8_t *)&v6, 0xCu);
    }

    [(BSServiceConnection *)self->_connection invalidate];
    self->_lock_invalidated = 1;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)serverDismissedPunchThroughIdentifier:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_presented = 0;
  os_unfair_lock_unlock(p_lock);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__CRSUIPunchThroughController_serverDismissedPunchThroughIdentifier___block_invoke;
  block[3] = &unk_264307AF0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __69__CRSUIPunchThroughController_serverDismissedPunchThroughIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 punchThroughControllerDidDismiss:*(void *)(a1 + 32)];
}

- (void)_handleConnectionActivated
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_hasPendingPresentationRequest)
  {
    id v4 = (void *)MEMORY[0x21D464300](self->_lock_pendingPresentationCompletion);
    id v5 = [(CRSUIPunchThroughController *)self connection];
    int v6 = [v5 remoteTarget];
    id v7 = [(CRSUIPunchThroughController *)self punchThroughIdentifier];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__CRSUIPunchThroughController__handleConnectionActivated__block_invoke;
    v10[3] = &unk_264307770;
    id v11 = v4;
    id v8 = v4;
    [v6 clientRequestPresentationForPunchThroughIdentifier:v7 completion:v10];

    self->_lock_hasPendingPresentationRequest = 0;
    id lock_pendingPresentationCompletion = self->_lock_pendingPresentationCompletion;
    self->_id lock_pendingPresentationCompletion = 0;
  }
  self->_lock_connectionActivated = 1;
  os_unfair_lock_unlock(p_lock);
}

void __57__CRSUIPunchThroughController__handleConnectionActivated__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__CRSUIPunchThroughController__handleConnectionActivated__block_invoke_2;
  v6[3] = &unk_2643079C0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __57__CRSUIPunchThroughController__handleConnectionActivated__block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(void *)(a1 + 32) == 0);
  }
  return result;
}

- (CRSUIPunchThroughControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CRSUIPunchThroughControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)punchThroughIdentifier
{
  return self->_punchThroughIdentifier;
}

- (void)setPunchThroughIdentifier:(id)a3
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
  objc_storeStrong((id *)&self->_punchThroughIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_lock_pendingPresentationCompletion, 0);
}

@end