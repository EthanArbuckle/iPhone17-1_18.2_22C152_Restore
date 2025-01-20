@interface ASCAuthorizationPresenter
- (ASCAuthorizationPresenter)init;
- (ASCAuthorizationPresenterDelegate)delegate;
- (BOOL)_isErrorDueToNewAlertHandleRequest:(id)a3;
- (BOOL)_isPresentationContextValid:(id)a3 error:(id *)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)_invalidateWithError:(id)a3;
- (void)_performQueuedUpdatesIfNecessary;
- (void)authorizationRequestFinishedWithCredential:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)authorizationRequestInitiatedWithLoginChoice:(id)a3 authenticatedContext:(id)a4 completionHandler:(id)a5;
- (void)cableClientWillAuthenticate;
- (void)cableClientWillConnect;
- (void)dismiss;
- (void)dismissWithError:(id)a3;
- (void)initializeClientToViewServiceConnection;
- (void)presentAuthorizationWithContext:(id)a3 forProcess:(id)a4 completionHandler:(id)a5;
- (void)presentError:(id)a3 forService:(id)a4 completionHandler:(id)a5;
- (void)presentExportFlowWithData:(id)a3 forProcess:(id)a4 windowSceneIdentifier:(id)a5 completionHandler:(id)a6;
- (void)presentPINEntryInterface;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startCABLEAuthenticationWithCompletionHandler:(id)a3;
- (void)updateInterfaceForUserVisibleError:(id)a3;
- (void)updateInterfaceWithLoginChoices:(id)a3;
- (void)validateUserEnteredPIN:(id)a3 completionHandler:(id)a4;
@end

@implementation ASCAuthorizationPresenter

- (ASCAuthorizationPresenter)init
{
  v9.receiver = self;
  v9.super_class = (Class)ASCAuthorizationPresenter;
  v2 = [(ASCAuthorizationPresenter *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.AuthenticationServicesCore.AuthorizationPresenterInvalidationQueue", 0);
    invalidationQueue = v2->_invalidationQueue;
    v2->_invalidationQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.AuthenticationServicesCore.AuthorizationPresenterInterfaceUpdateQueue", 0);
    interfaceUpdateQueue = v2->_interfaceUpdateQueue;
    v2->_interfaceUpdateQueue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)presentAuthorizationWithContext:(id)a3 forProcess:(id)a4 completionHandler:(id)a5
{
  v47[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v43 = 0;
  BOOL v11 = [(ASCAuthorizationPresenter *)self _isPresentationContextValid:v8 error:&v43];
  id v12 = v43;
  if (v11)
  {
    id v42 = v12;
    v13 = [MEMORY[0x263F08910] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v42];
    id v14 = v42;

    if (v13)
    {
      v15 = _Block_copy(v10);
      id credentialResultHandler = self->_credentialResultHandler;
      self->_id credentialResultHandler = v15;

      v17 = [MEMORY[0x263F08D88] anonymousListener];
      remoteListener = self->_remoteListener;
      self->_remoteListener = v17;

      [(NSXPCListener *)self->_remoteListener setDelegate:self];
      [(NSXPCListener *)self->_remoteListener resume];
      v46 = @"ASCAuthorizationPresentationContextData";
      v47[0] = v13;
      v40 = v13;
      v19 = [NSDictionary dictionaryWithObjects:v47 forKeys:&v46 count:1];
      id v20 = objc_alloc(MEMORY[0x263F79410]);
      uint64_t v21 = [v20 initWithServiceName:authenticationServicesViewServiceBundleIdentifier viewControllerClassName:@"ASViewServiceViewController"];
      v22 = objc_opt_new();
      v23 = [(NSXPCListener *)self->_remoteListener endpoint];
      v24 = [v23 _endpoint];
      [v22 setXpcEndpoint:v24];

      [v22 setUserInfo:v19];
      v41 = (void *)v21;
      v25 = (SBSRemoteAlertHandle *)[MEMORY[0x263F79428] newHandleWithDefinition:v21 configurationContext:v22];
      remoteAlertHandle = self->_remoteAlertHandle;
      self->_remoteAlertHandle = v25;

      char v27 = objc_opt_respondsToSelector();
      v28 = self->_remoteAlertHandle;
      if (v27) {
        [(SBSRemoteAlertHandle *)v28 registerObserver:self];
      }
      else {
        [(SBSRemoteAlertHandle *)v28 addObserver:self];
      }
      int v30 = MKBGetDeviceLockState();
      v13 = v40;
      if (v30 && v30 != 3)
      {
        v35 = WBS_LOG_CHANNEL_PREFIXAuthorization();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          -[ASCAuthorizationPresenter presentAuthorizationWithContext:forProcess:completionHandler:]();
        }
        v36 = (void *)MEMORY[0x263F087E8];
        uint64_t v44 = *MEMORY[0x263F08338];
        v45 = @"Device must be unlocked to perform request.";
        v31 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1, v19);
        v37 = [v36 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:v31];
        [(ASCAuthorizationPresenter *)self _invalidateWithError:v37];

        v19 = v39;
      }
      else
      {
        v31 = objc_opt_new();
        if (v9)
        {
          v32 = [MEMORY[0x263F79440] predicateForProcess:v9];
          [v8 windowSceneIdentifier];
          v33 = v38 = v19;
          [v32 setScenePersistentIdentifier:v33];

          v34 = (void *)[objc_alloc(MEMORY[0x263F79438]) initWithTargetPredicate:v32];
          [v31 setPresentationTarget:v34];

          v19 = v38;
        }
        [(SBSRemoteAlertHandle *)self->_remoteAlertHandle activateWithContext:v31];
      }
    }
    else
    {
      v29 = WBS_LOG_CHANNEL_PREFIXAuthorization();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[ASCAuthorizationPresenter presentAuthorizationWithContext:forProcess:completionHandler:](v29);
      }
      (*((void (**)(id, void, id))v10 + 2))(v10, 0, v14);
    }
  }
  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v12);
    id v14 = v12;
  }
}

- (void)presentError:(id)a3 forService:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__ASCAuthorizationPresenter_presentError_forService_completionHandler___block_invoke;
  v10[3] = &unk_26439F350;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

void __71__ASCAuthorizationPresenter_presentError_forService_completionHandler___block_invoke(uint64_t a1)
{
  v2 = NSString;
  dispatch_queue_t v3 = _WBSLocalizedString();
  objc_msgSend(v2, "stringWithFormat:", v3, *(void *)(a1 + 32));
  alertHeader = (__CFString *)objc_claimAutoreleasedReturnValue();

  v4 = [MEMORY[0x263F66290] currentDevice];
  int v5 = [v4 deviceClass];

  if (v5 == 3)
  {
    id v6 = NSString;
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    id v6 = NSString;
LABEL_5:
    id v7 = _WBSLocalizedString();
    objc_msgSend(v6, "stringWithFormat:", v7, *(void *)(a1 + 32));
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:
  CFStringRef v9 = (const __CFString *)_WBSLocalizedString();
  CFUserNotificationDisplayAlert(0.0, 2uLL, 0, 0, 0, alertHeader, v8, v9, 0, 0, 0);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateInterfaceWithLoginChoices:(id)a3
{
  id v4 = a3;
  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__ASCAuthorizationPresenter_updateInterfaceWithLoginChoices___block_invoke;
  v7[3] = &unk_26439EFE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(interfaceUpdateQueue, v7);
}

void __61__ASCAuthorizationPresenter_updateInterfaceWithLoginChoices___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  dispatch_queue_t v3 = *(void **)(v2 + 48);
  if (v3) {
    [v3 updateInterfaceWithLoginChoices:v1];
  }
  else {
    objc_storeStrong((id *)(v2 + 64), v1);
  }
}

- (void)presentPINEntryInterface
{
  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__ASCAuthorizationPresenter_presentPINEntryInterface__block_invoke;
  block[3] = &unk_26439ED00;
  block[4] = self;
  dispatch_async(interfaceUpdateQueue, block);
}

void *__53__ASCAuthorizationPresenter_presentPINEntryInterface__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  result = *(void **)(v1 + 48);
  if (result) {
    return (void *)[result presentPINEntryInterface];
  }
  *(unsigned char *)(v1 + 72) = 1;
  return result;
}

- (void)updateInterfaceForUserVisibleError:(id)a3
{
  id v4 = a3;
  int v5 = [v4 domain];
  char v6 = [v5 isEqualToString:@"com.apple.AuthenticationServicesCore.AuthorizationError"];

  if (v6)
  {
    uint64_t v7 = [v4 code];
    if ((unint64_t)(v7 - 4) < 4 || v7 == 13)
    {
      [(ASCViewServiceProtocol *)self->_viewServiceProxy updateInterfaceForUserVisibleError:v4];
    }
    else
    {
      CFStringRef v9 = WBS_LOG_CHANNEL_PREFIXAuthorization();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ASCAuthorizationPresenter updateInterfaceForUserVisibleError:](v9);
      }
    }
  }
  else
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ASCAuthorizationPresenter updateInterfaceForUserVisibleError:](v8);
    }
  }
}

- (void)dismiss
{
  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__ASCAuthorizationPresenter_dismiss__block_invoke;
  block[3] = &unk_26439ED00;
  block[4] = self;
  dispatch_async(interfaceUpdateQueue, block);
}

uint64_t __36__ASCAuthorizationPresenter_dismiss__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) dismiss];
}

- (void)dismissWithError:(id)a3
{
  id v4 = a3;
  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__ASCAuthorizationPresenter_dismissWithError___block_invoke;
  v7[3] = &unk_26439EFE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(interfaceUpdateQueue, v7);
}

uint64_t __46__ASCAuthorizationPresenter_dismissWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) dismissWithError:*(void *)(a1 + 40)];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    [v7 auditToken];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  char HasEntitlement = WBSAuditTokenHasEntitlement();
  if (HasEntitlement)
  {
    objc_storeStrong((id *)&self->_viewServiceConnection, a4);
    id v10 = +[ASCAuthorizationPresenterHostInterface xpcInterface];
    [(NSXPCConnection *)self->_viewServiceConnection setExportedInterface:v10];

    [(NSXPCConnection *)self->_viewServiceConnection setExportedObject:self];
    id v11 = +[ASCViewServiceInterface xpcInterface];
    [(NSXPCConnection *)self->_viewServiceConnection setRemoteObjectInterface:v11];

    [(NSXPCConnection *)self->_viewServiceConnection resume];
    id v12 = [(NSXPCConnection *)self->_viewServiceConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_5];
    viewServiceProxy = self->_viewServiceProxy;
    self->_viewServiceProxy = v12;

    [(ASCAuthorizationPresenter *)self _performQueuedUpdatesIfNecessary];
    id v14 = WBS_LOG_CHANNEL_PREFIXServiceLifecycle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_219326000, v14, OS_LOG_TYPE_DEFAULT, "Accepting connection", v17, 2u);
    }
  }
  else
  {
    v15 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ASCAuthorizationPresenter listener:shouldAcceptNewConnection:]();
    }
    [(SBSRemoteAlertHandle *)self->_remoteAlertHandle invalidate];
  }

  return HasEntitlement;
}

void __64__ASCAuthorizationPresenter_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __64__ASCAuthorizationPresenter_listener_shouldAcceptNewConnection___block_invoke_cold_1();
  }
}

- (BOOL)_isPresentationContextValid:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 cableAuthenticatorURL];

  if (v6) {
    goto LABEL_2;
  }
  CFStringRef v9 = [v5 loginChoices];
  if ([v9 count])
  {
  }
  else
  {
    char v10 = [v5 isProxiedRequest];

    if ((v10 & 1) == 0)
    {
      if (!a4)
      {
LABEL_14:
        BOOL v7 = 0;
        goto LABEL_3;
      }
      id v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = *MEMORY[0x263F08338];
      v20[0] = @"Invalid request: 0 login choices";
      v13 = NSDictionary;
      id v14 = (__CFString **)v20;
      v15 = &v19;
LABEL_13:
      v16 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:1];
      *a4 = [v12 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:v16];

      goto LABEL_14;
    }
  }
  if (![v5 isRegistrationRequest])
  {
LABEL_2:
    BOOL v7 = 1;
    goto LABEL_3;
  }
  uint64_t v11 = [v5 requestTypes];
  BOOL v7 = (v11 & 0xFFFFFFFFFFFFFFABLL) == 0;
  if (a4 && (v11 & 0xFFFFFFFFFFFFFFABLL) != 0)
  {
    id v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08338];
    long long v18 = @"Registration requests cannot be used with other types of requests.";
    v13 = NSDictionary;
    id v14 = &v18;
    v15 = &v17;
    goto LABEL_13;
  }
LABEL_3:

  return v7;
}

- (void)_performQueuedUpdatesIfNecessary
{
  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__ASCAuthorizationPresenter__performQueuedUpdatesIfNecessary__block_invoke;
  block[3] = &unk_26439ED00;
  block[4] = self;
  dispatch_async(interfaceUpdateQueue, block);
}

void __61__ASCAuthorizationPresenter__performQueuedUpdatesIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 64))
  {
    objc_msgSend(*(id *)(v2 + 48), "updateInterfaceWithLoginChoices:");
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 64);
    *(void *)(v3 + 64) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v2 + 72))
  {
    [*(id *)(v2 + 48) presentPINEntryInterface];
    *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v2 + 73))
  {
    [*(id *)(v2 + 48) cableClientWillConnect];
    *(unsigned char *)(*(void *)(a1 + 32) + 73) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v2 + 74))
  {
    [*(id *)(v2 + 48) cableClientWillAuthenticate];
    *(unsigned char *)(*(void *)(a1 + 32) + 74) = 0;
  }
}

- (void)_invalidateWithError:(id)a3
{
  id v4 = a3;
  invalidationQueue = self->_invalidationQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__ASCAuthorizationPresenter__invalidateWithError___block_invoke;
  v7[3] = &unk_26439EFE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(invalidationQueue, v7);
}

void __50__ASCAuthorizationPresenter__invalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 80);
  if (v3)
  {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
    uint64_t v4 = 80;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 16);
    if (!v5) {
      return;
    }
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, 0, *(void *)(a1 + 40));
    uint64_t v4 = 16;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  BOOL v7 = *(void **)(v6 + v4);
  *(void *)(v6 + v4) = 0;
}

- (void)cableClientWillConnect
{
  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__ASCAuthorizationPresenter_cableClientWillConnect__block_invoke;
  block[3] = &unk_26439ED00;
  block[4] = self;
  dispatch_async(interfaceUpdateQueue, block);
}

void *__51__ASCAuthorizationPresenter_cableClientWillConnect__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  result = *(void **)(v1 + 48);
  if (result) {
    return (void *)[result cableClientWillConnect];
  }
  *(unsigned char *)(v1 + 73) = 1;
  return result;
}

- (void)cableClientWillAuthenticate
{
  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__ASCAuthorizationPresenter_cableClientWillAuthenticate__block_invoke;
  block[3] = &unk_26439ED00;
  block[4] = self;
  dispatch_async(interfaceUpdateQueue, block);
}

void *__56__ASCAuthorizationPresenter_cableClientWillAuthenticate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  result = *(void **)(v1 + 48);
  if (result) {
    return (void *)[result cableClientWillAuthenticate];
  }
  *(unsigned char *)(v1 + 74) = 1;
  return result;
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[ASCAuthorizationPresenter remoteAlertHandleDidDeactivate:]();
  }
  uint64_t v5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:2 userInfo:0];
  [(ASCAuthorizationPresenter *)self _invalidateWithError:v5];
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(ASCAuthorizationPresenter *)self _isErrorDueToNewAlertHandleRequest:v5];
  BOOL v7 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      uint64_t v9 = 2;
      _os_log_impl(&dword_219326000, v8, OS_LOG_TYPE_INFO, "Alert handle deactivated by new request.", v11, 2u);
    }
    else
    {
      uint64_t v9 = 2;
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ASCAuthorizationPresenter remoteAlertHandle:didInvalidateWithError:](v8);
    }
    uint64_t v9 = 1;
  }
  char v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:v9 userInfo:0];
  [(ASCAuthorizationPresenter *)self _invalidateWithError:v10];
}

- (BOOL)_isErrorDueToNewAlertHandleRequest:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = *MEMORY[0x263F79558];
  v8[0] = &unk_26CAC2798;
  uint64_t v3 = NSDictionary;
  id v4 = a3;
  id v5 = [v3 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  LOBYTE(v3) = objc_msgSend(v4, "safari_matchesErrorDomainsAndCodes:", v5);

  return (char)v3;
}

- (void)authorizationRequestInitiatedWithLoginChoice:(id)a3 authenticatedContext:(id)a4 completionHandler:(id)a5
{
  p_delegate = &self->_delegate;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained authorizationPresenter:self credentialRequestedForLoginChoice:v11 authenticatedContext:v10 completionHandler:v9];
}

- (void)authorizationRequestFinishedWithCredential:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained authorizationPresenter:self didFinishWithCredential:v13 error:v8];

  id credentialResultHandler = (void (**)(id, id, id))self->_credentialResultHandler;
  if (credentialResultHandler)
  {
    credentialResultHandler[2](credentialResultHandler, v13, v8);
    id v12 = self->_credentialResultHandler;
    self->_id credentialResultHandler = 0;
  }
  v9[2](v9);
}

- (void)validateUserEnteredPIN:(id)a3 completionHandler:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained authorizationPresenter:self validateUserEnteredPIN:v8 completionHandler:v7];
}

- (void)initializeClientToViewServiceConnection
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXServiceLifecycle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_219326000, v2, OS_LOG_TYPE_DEFAULT, "Connection initialized", v3, 2u);
  }
}

- (void)startCABLEAuthenticationWithCompletionHandler:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained authorizationPresenter:self startCABLEAuthenticationWithCompletionHandler:v5];
}

- (void)presentExportFlowWithData:(id)a3 forProcess:(id)a4 windowSceneIdentifier:(id)a5 completionHandler:(id)a6
{
  v52[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v45 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x263F08D68] currentConnection];
  id v14 = [MEMORY[0x263F08D88] anonymousListener];
  remoteListener = self->_remoteListener;
  self->_remoteListener = v14;

  [(NSXPCListener *)self->_remoteListener setDelegate:self];
  [(NSXPCListener *)self->_remoteListener resume];
  v16 = _Block_copy(v12);
  id presentExportFlowResultHandler = self->_presentExportFlowResultHandler;
  self->_id presentExportFlowResultHandler = v16;

  if (v13)
  {
    [v13 auditToken];
  }
  else
  {
    long long v47 = 0u;
    long long v48 = 0u;
  }
  long long v18 = WBSApplicationIdentifierFromAuditToken();
  id v46 = 0;
  uint64_t v19 = objc_msgSend(v18, "safari_bundleIdentifierFromApplicationIdentifier:", &v46);
  id v20 = v46;
  uint64_t v21 = v20;
  if (v19)
  {
    id v42 = v20;
    id v43 = v11;
    v51[0] = @"ASCAuthorizationCredentialExchangeExporterBundleID";
    v51[1] = @"ASCAuthorizationCredentialExchangeData";
    v52[0] = v19;
    v52[1] = v10;
    id v44 = v10;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
    id v23 = objc_alloc(MEMORY[0x263F79410]);
    uint64_t v24 = [v23 initWithServiceName:authenticationServicesViewServiceBundleIdentifier viewControllerClassName:@"ASViewServiceViewController"];
    v25 = objc_opt_new();
    v26 = [(NSXPCListener *)self->_remoteListener endpoint];
    char v27 = [v26 _endpoint];
    [v25 setXpcEndpoint:v27];

    v41 = (void *)v22;
    uint64_t v28 = v22;
    v29 = (void *)v24;
    [v25 setUserInfo:v28];
    int v30 = (SBSRemoteAlertHandle *)[MEMORY[0x263F79428] newHandleWithDefinition:v24 configurationContext:v25];
    remoteAlertHandle = self->_remoteAlertHandle;
    self->_remoteAlertHandle = v30;

    char v32 = objc_opt_respondsToSelector();
    v33 = self->_remoteAlertHandle;
    if (v32) {
      [(SBSRemoteAlertHandle *)v33 registerObserver:self];
    }
    else {
      [(SBSRemoteAlertHandle *)v33 addObserver:self];
    }
    id v11 = v43;
    int v34 = MKBGetDeviceLockState();
    id v10 = v44;
    if (v34 && v34 != 3)
    {
      v38 = WBS_LOG_CHANNEL_PREFIXAuthorization();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[ASCAuthorizationPresenter presentAuthorizationWithContext:forProcess:completionHandler:]();
      }
      v39 = (void *)MEMORY[0x263F087E8];
      uint64_t v49 = *MEMORY[0x263F08338];
      v50 = @"Device must be unlocked to perform request.";
      v35 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      v40 = [v39 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:v35];
      [(ASCAuthorizationPresenter *)self _invalidateWithError:v40];

      id v11 = v43;
      id v10 = v44;
    }
    else
    {
      v35 = objc_opt_new();
      if (v43)
      {
        v36 = [MEMORY[0x263F79440] predicateForProcess:v43];
        [v36 setScenePersistentIdentifier:v45];
        v37 = (void *)[objc_alloc(MEMORY[0x263F79438]) initWithTargetPredicate:v36];
        [v35 setPresentationTarget:v37];

        id v10 = v44;
        id v11 = v43;
      }
      [(SBSRemoteAlertHandle *)self->_remoteAlertHandle activateWithContext:v35];
      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }

    uint64_t v21 = v42;
  }
  else
  {
    (*((void (**)(id, id))v12 + 2))(v12, v20);
  }
}

- (ASCAuthorizationPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASCAuthorizationPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_presentExportFlowResultHandler, 0);
  objc_storeStrong((id *)&self->_loginChoicesForQueuedUpdate, 0);
  objc_storeStrong((id *)&self->_interfaceUpdateQueue, 0);
  objc_storeStrong((id *)&self->_viewServiceProxy, 0);
  objc_storeStrong((id *)&self->_viewServiceConnection, 0);
  objc_storeStrong((id *)&self->_invalidationQueue, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong(&self->_credentialResultHandler, 0);

  objc_storeStrong((id *)&self->_remoteListener, 0);
}

- (void)presentAuthorizationWithContext:(void *)a1 forProcess:completionHandler:.cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Failed to get context data for presentation with error: %{private}@", v6, v7, v8, v9, v10);
}

- (void)presentAuthorizationWithContext:forProcess:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Cancelling request because we are trying to present UI but the device is not unlocked", v2, v3, v4, v5, v6);
}

- (void)updateInterfaceForUserVisibleError:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  [(id)OUTLINED_FUNCTION_1() code];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v3, v4, "Asked to display error with unrecognized code: %ld", v5, v6, v7, v8, v9);
}

- (void)updateInterfaceForUserVisibleError:(void *)a1 .cold.2(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_1() domain];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Asked to present unsupported error: %{public}@.", v6, v7, v8, v9, v10);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Invalid process tried to connect to AuthenticationServicesAgent acting as AuthenticationServicesUI.", v2, v3, v4, v5, v6);
}

void __64__ASCAuthorizationPresenter_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Failed to connect client process to AuthenticationServices view service", v2, v3, v4, v5, v6);
}

- (void)remoteAlertHandleDidDeactivate:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Alert handle deactivated.", v2, v3, v4, v5, v6);
}

- (void)remoteAlertHandle:(void *)a1 didInvalidateWithError:.cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Alert handle invalidated with error: %{public}@", v6, v7, v8, v9, v10);
}

@end