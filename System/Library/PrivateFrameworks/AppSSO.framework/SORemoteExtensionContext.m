@interface SORemoteExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (ASAuthorizationProviderExtensionAuthorizationRequestHandler)extensionViewController;
- (BOOL)canOpenURL:(id)a3;
- (SOExtensionViewService)viewService;
- (id)authorizationRequestHandlerWithRequestParameters:(id)a3 error:(id *)a4;
- (id)extensionAuthorizationRequestHandlerWithError:(id *)a3;
- (id)findRequestForIdentifier:(id)a3;
- (id)hostContextWithError:(id *)a3;
- (id)registrationCompletion;
- (id)rotationCompletion;
- (id)synchronousHostContextWithError:(id *)a3;
- (void)_disableAppSSOInCFNetwork;
- (void)beginAuthorizationWithRequestParameters:(id)a3 completion:(id)a4;
- (void)beginAuthorizationWithServiceXPCEndpoint:(id)a3 completion:(id)a4;
- (void)beginDeviceRegistrationUsingOptions:(int64_t)a3 extensionData:(id)a4 completion:(id)a5;
- (void)beginUserRegistrationUsingUserName:(id)a3 authenticationMethod:(int)a4 options:(int64_t)a5 extensionData:(id)a6 completion:(id)a7;
- (void)canPerformRegistrationCompletion:(id)a3;
- (void)cancelAuthorization:(id)a3 completion:(id)a4;
- (void)completeFinishAuthorization:(id)a3 error:(id)a4;
- (void)finishAuthorization:(id)a3 completion:(id)a4;
- (void)keyWillRotateForKeyType:(int64_t)a3 keyProxyEndpoint:(id)a4 extensionData:(id)a5 completion:(id)a6;
- (void)openURL:(id)a3 completionHandler:(id)a4;
- (void)protocolVersionCompletion:(id)a3;
- (void)registrationDidCancelWithCompletion:(id)a3;
- (void)registrationDidCompleteWithCompletion:(id)a3;
- (void)removeRequestForIdentifier:(id)a3;
- (void)saveRequest:(id)a3 forIdentifier:(id)a4;
- (void)setRegistrationCompletion:(id)a3;
- (void)setRotationCompletion:(id)a3;
- (void)setViewService:(id)a3;
- (void)supportedDeviceEncryptionAlgorithmsCompletion:(id)a3;
- (void)supportedDeviceSigningAlgorithmsCompletion:(id)a3;
- (void)supportedGrantTypesCompletion:(id)a3;
- (void)supportedUserSecureEnclaveKeySigningAlgorithmsCompletion:(id)a3;
@end

@implementation SORemoteExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol___interface;
  return v2;
}

uint64_t __59__SORemoteExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol___interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9C9488];
  return MEMORY[0x270F9A758]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_55);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  return v2;
}

uint64_t __61__SORemoteExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol___interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9B73F0];
  return MEMORY[0x270F9A758]();
}

- (void)saveRequest:(id)a3 forIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  requests = v8->_requests;
  if (!requests)
  {
    uint64_t v10 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    v11 = v8->_requests;
    v8->_requests = (NSMapTable *)v10;

    requests = v8->_requests;
  }
  [(NSMapTable *)requests setObject:v6 forKey:v7];
  v12 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMapTable count](v8->_requests, "count"));
    int v14 = 136315650;
    v15 = "-[SORemoteExtensionContext saveRequest:forIdentifier:]";
    __int16 v16 = 2114;
    v17 = v13;
    __int16 v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_2185C9000, v12, OS_LOG_TYPE_DEFAULT, "%s current requests: %{public}@ on %@", (uint8_t *)&v14, 0x20u);
  }
  objc_sync_exit(v8);
}

- (id)findRequestForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  requests = v5->_requests;
  if (!requests)
  {
    uint64_t v7 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    v8 = v5->_requests;
    v5->_requests = (NSMapTable *)v7;

    requests = v5->_requests;
  }
  v9 = [(NSMapTable *)requests objectForKey:v4];
  objc_sync_exit(v5);

  return v9;
}

- (void)removeRequestForIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  requests = v5->_requests;
  if (!requests)
  {
    uint64_t v7 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    v8 = v5->_requests;
    v5->_requests = (NSMapTable *)v7;

    requests = v5->_requests;
  }
  [(NSMapTable *)requests removeObjectForKey:v4];
  v9 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMapTable count](v5->_requests, "count"));
    int v11 = 136315650;
    v12 = "-[SORemoteExtensionContext removeRequestForIdentifier:]";
    __int16 v13 = 2114;
    int v14 = v10;
    __int16 v15 = 2112;
    __int16 v16 = v5;
    _os_log_impl(&dword_2185C9000, v9, OS_LOG_TYPE_DEFAULT, "%s current requests: %{public}@ on %@", (uint8_t *)&v11, 0x20u);
  }
  objc_sync_exit(v5);
}

- (ASAuthorizationProviderExtensionAuthorizationRequestHandler)extensionViewController
{
  extensionAuthorizationRequestHandler = self->_extensionAuthorizationRequestHandler;
  if (extensionAuthorizationRequestHandler)
  {
    v3 = extensionAuthorizationRequestHandler;
  }
  else
  {
    v3 = [(SORemoteExtensionContext *)self _principalObject];
  }
  return v3;
}

- (id)authorizationRequestHandlerWithRequestParameters:(id)a3 error:(id *)a4
{
  if ([a3 isUserInteractionEnabled])
  {
    id v6 = [(SORemoteExtensionContext *)self extensionViewController];
    if (a4 && !v6)
    {
      id v7 = [getSOErrorHelperClass() internalErrorWithMessage:@"failed to get extension view controller"];
      id v6 = 0;
      *a4 = v7;
    }
  }
  else
  {
    id v6 = [(SORemoteExtensionContext *)self extensionAuthorizationRequestHandlerWithError:a4];
  }
  return v6;
}

- (id)extensionAuthorizationRequestHandlerWithError:(id *)a3
{
  if (self->_extensionAuthorizationRequestHandler)
  {
    if (!a3)
    {
LABEL_4:
      v5 = self->_extensionAuthorizationRequestHandler;
      goto LABEL_5;
    }
LABEL_3:
    *a3 = 0;
    goto LABEL_4;
  }
  id v7 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SORemoteExtensionContext extensionAuthorizationRequestHandlerWithError:].cold.4(v7);
  }

  v8 = [MEMORY[0x263F086E0] mainBundle];
  v9 = [v8 infoDictionary];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"NSExtension"];

  int v11 = [v10 objectForKeyedSubscript:@"NSExtensionPrincipalClass"];
  v12 = v11;
  if (v11)
  {
    __int16 v13 = NSClassFromString(v11);
    if (v13)
    {
      int v14 = (ASAuthorizationProviderExtensionAuthorizationRequestHandler *)objc_alloc_init(v13);
      goto LABEL_16;
    }
    v24 = SO_LOG_SORemoteExtensionContext();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[SORemoteExtensionContext extensionAuthorizationRequestHandlerWithError:]();
    }

    if (a3)
    {
      id SOErrorHelperClass = getSOErrorHelperClass();
      v26 = @"failed to get extension principalClass";
LABEL_26:
      *a3 = [SOErrorHelperClass internalErrorWithMessage:v26];
    }
  }
  else
  {
    uint64_t v15 = [v10 objectForKeyedSubscript:@"NSExtensionMainStoryboard"];
    if (!v15)
    {
      v27 = SO_LOG_SORemoteExtensionContext();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[SORemoteExtensionContext extensionAuthorizationRequestHandlerWithError:]();
      }

      if (!a3) {
        goto LABEL_32;
      }
      id SOErrorHelperClass = getSOErrorHelperClass();
      v26 = @"failed to get extension NSExtensionPrincipalClass or NSExtensionMainStoryboard";
      goto LABEL_26;
    }
    __int16 v16 = (void *)v15;
    uint64_t v17 = (void *)MEMORY[0x263F1C9E8];
    __int16 v18 = [MEMORY[0x263F086E0] mainBundle];
    v19 = [v17 storyboardWithName:v16 bundle:v18];

    uint64_t v20 = [v19 instantiateInitialViewController];
    if (v20)
    {
      int v14 = (ASAuthorizationProviderExtensionAuthorizationRequestHandler *)v20;

LABEL_16:
      v21 = [MEMORY[0x263F08DA8] _sharedExtensionContextVendor];
      v22 = [(SORemoteExtensionContext *)self _UUID];
      [v21 _setPrincipalObject:v14 forUUID:v22];

      extensionAuthorizationRequestHandler = self->_extensionAuthorizationRequestHandler;
      self->_extensionAuthorizationRequestHandler = v14;

      if (!a3) {
        goto LABEL_4;
      }
      goto LABEL_3;
    }
    v28 = SO_LOG_SORemoteExtensionContext();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[SORemoteExtensionContext extensionAuthorizationRequestHandlerWithError:]();
    }

    if (a3)
    {
      *a3 = [getSOErrorHelperClass() internalErrorWithMessage:@"failed to instantiate initial view controller from storyboard"];
    }
  }
LABEL_32:

  v5 = 0;
LABEL_5:
  return v5;
}

- (id)hostContextWithError:(id *)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  id v4 = [(SORemoteExtensionContext *)self _auxiliaryConnection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SORemoteExtensionContext_hostContextWithError___block_invoke;
  v7[3] = &unk_26432A390;
  v7[4] = &v8;
  v5 = [v4 remoteObjectProxyWithErrorHandler:v7];

  if (a3) {
    *a3 = (id) v9[5];
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __49__SORemoteExtensionContext_hostContextWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __49__SORemoteExtensionContext_hostContextWithError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (id)synchronousHostContextWithError:(id *)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  id v4 = [(SORemoteExtensionContext *)self _auxiliaryConnection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__SORemoteExtensionContext_synchronousHostContextWithError___block_invoke;
  v7[3] = &unk_26432A390;
  v7[4] = &v8;
  uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v7];

  if (a3) {
    *a3 = (id) v9[5];
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __60__SORemoteExtensionContext_synchronousHostContextWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__SORemoteExtensionContext_synchronousHostContextWithError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (void)beginAuthorizationWithRequestParameters:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  uint64_t v8 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 identifier];
    *(_DWORD *)buf = 136315906;
    v23 = "-[SORemoteExtensionContext beginAuthorizationWithRequestParameters:completion:]";
    __int16 v24 = 2114;
    v25 = v9;
    __int16 v26 = 2114;
    id v27 = v6;
    __int16 v28 = 2112;
    v29 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier = %{public}@, %{public}@ on %@", buf, 0x2Au);
  }
  id v21 = 0;
  uint64_t v10 = [(SORemoteExtensionContext *)self authorizationRequestHandlerWithRequestParameters:v6 error:&v21];
  id v11 = v21;
  if (!v10)
  {
    if (v7) {
      v7[2](v7, 0, v11);
    }
    goto LABEL_20;
  }
  if (objc_opt_respondsToSelector())
  {
    v12 = [v6 requestedOperation];
    if ([v12 isEqualToString:@"configuration_removed"])
    {
      char v13 = dyld_program_sdk_at_least();

      if ((v13 & 1) == 0)
      {
        int v14 = SO_LOG_SORemoteExtensionContext();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2185C9000, v14, OS_LOG_TYPE_INFO, "SOAuthorizationOperationConfigurationRemoved requires extension built with newer SDK", buf, 2u);
        }

        if (v7)
        {
          uint64_t v15 = [getSOErrorHelperClass() errorWithCode:-5];
LABEL_15:
          __int16 v16 = (void *)v15;
          v7[2](v7, 0, (id)v15);

          goto LABEL_20;
        }
        goto LABEL_20;
      }
    }
    else
    {
    }
    [(SORemoteExtensionContext *)self _disableAppSSOInCFNetwork];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __79__SORemoteExtensionContext_beginAuthorizationWithRequestParameters_completion___block_invoke;
    v17[3] = &unk_26432A3B8;
    id v18 = v6;
    v19 = self;
    id v20 = v10;
    dispatch_async(MEMORY[0x263EF83A0], v17);
    if (v7) {
      v7[2](v7, 1, 0);
    }

    goto LABEL_20;
  }
  if (v7)
  {
    uint64_t v15 = [getSOErrorHelperClass() internalErrorWithMessage:@"required beginAuthorizationWithRequest is not implemented in extension"];
    goto LABEL_15;
  }
LABEL_20:
}

void __79__SORemoteExtensionContext_beginAuthorizationWithRequestParameters_completion___block_invoke(uint64_t a1)
{
  v2 = [[SOAuthorizationRequest alloc] initWithRequestParameters:*(void *)(a1 + 32) remoteExtensionContext:*(void *)(a1 + 40)];
  id v3 = (void *)[objc_alloc((Class)getASAuthorizationProviderExtensionAuthorizationRequestClass()) initWithAuthorizationRequest:v2];
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = [*(id *)(a1 + 32) identifier];
  [v4 saveRequest:v3 forIdentifier:v5];

  id v6 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __79__SORemoteExtensionContext_beginAuthorizationWithRequestParameters_completion___block_invoke_cold_2();
  }

  [*(id *)(a1 + 48) beginAuthorizationWithRequest:v3];
  id v7 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __79__SORemoteExtensionContext_beginAuthorizationWithRequestParameters_completion___block_invoke_cold_1();
  }
}

- (void)beginAuthorizationWithServiceXPCEndpoint:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "-[SORemoteExtensionContext beginAuthorizationWithServiceXPCEndpoint:completion:]";
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %@", buf, 0x20u);
  }

  v9 = (SOExtensionServiceConnection *)[(id)objc_opt_new() initWithListenerEndpoint:v6];
  extensionServiceConnection = self->_extensionServiceConnection;
  self->_extensionServiceConnection = v9;

  id v11 = self->_extensionServiceConnection;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__SORemoteExtensionContext_beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke;
  v13[3] = &unk_26432A3E0;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [(SOExtensionServiceConnection *)v11 beginAuthorizationWithCompletion:v13];
}

void __80__SORemoteExtensionContext_beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v7);
    }
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    id v21 = 0;
    uint64_t v10 = [v9 authorizationRequestHandlerWithRequestParameters:v5 error:&v21];
    id v7 = v21;
    if (v10)
    {
      if (objc_opt_respondsToSelector())
      {
        [*(id *)(a1 + 32) _disableAppSSOInCFNetwork];
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __80__SORemoteExtensionContext_beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke_2;
        v17[3] = &unk_26432A3B8;
        id v11 = v5;
        uint64_t v12 = *(void *)(a1 + 32);
        id v18 = v11;
        uint64_t v19 = v12;
        id v20 = v10;
        dispatch_async(MEMORY[0x263EF83A0], v17);
        uint64_t v13 = *(void *)(a1 + 40);
        if (v13) {
          (*(void (**)(uint64_t, uint64_t, void))(v13 + 16))(v13, 1, 0);
        }
      }
      else
      {
        uint64_t v15 = *(void *)(a1 + 40);
        if (v15)
        {
          __int16 v16 = [getSOErrorHelperClass() internalErrorWithMessage:@"required beginAuthorizationWithRequest is not implemented in extension"];
          (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);
        }
      }
    }
    else
    {
      uint64_t v14 = *(void *)(a1 + 40);
      if (v14) {
        (*(void (**)(uint64_t, void, id))(v14 + 16))(v14, 0, v7);
      }
    }
  }
}

void __80__SORemoteExtensionContext_beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke_2(uint64_t a1)
{
  v2 = [[SOAuthorizationRequest alloc] initWithRequestParameters:*(void *)(a1 + 32) remoteExtensionContext:*(void *)(a1 + 40)];
  id v3 = (void *)[objc_alloc((Class)getASAuthorizationProviderExtensionAuthorizationRequestClass()) initWithAuthorizationRequest:v2];
  id v4 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) identifier];
  [v4 saveRequest:v3 forIdentifier:v5];

  id v6 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __80__SORemoteExtensionContext_beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke_2_cold_2();
  }

  [*(id *)(a1 + 48) beginAuthorizationWithRequest:v3];
  id v7 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __79__SORemoteExtensionContext_beginAuthorizationWithRequestParameters_completion___block_invoke_cold_1();
  }
}

- (void)cancelAuthorization:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  uint64_t v8 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v26 = "-[SORemoteExtensionContext cancelAuthorization:completion:]";
    __int16 v27 = 2114;
    id v28 = v6;
    __int16 v29 = 2112;
    uint64_t v30 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier = %{public}@ on %@", buf, 0x20u);
  }

  v9 = [(SORemoteExtensionContext *)self findRequestForIdentifier:v6];
  [(SORemoteExtensionContext *)self removeRequestForIdentifier:v6];
  if (v9)
  {
    uint64_t v10 = [v9 authorizationRequest];
    [v10 setAuthorizationCanceled:1];

    id v11 = [v9 authorizationRequest];
    [v11 setCanceledAuthorizationCredential:0];

    uint64_t v12 = [getSOErrorHelperClass() errorWithCode:-2];
    uint64_t v13 = [v9 authorizationRequest];
    [v13 setCanceledAuthorizationError:v12];

    if (v7)
    {
      uint64_t v14 = [v9 authorizationRequest];
      uint64_t v15 = [v14 canceledAuthorizationCredential];
      __int16 v16 = [v9 authorizationRequest];
      __int16 v17 = [v16 canceledAuthorizationError];
      v7[2](v7, v15, v17);
    }
    id v18 = [(SORemoteExtensionContext *)self extensionViewController];
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __59__SORemoteExtensionContext_cancelAuthorization_completion___block_invoke;
      v22[3] = &unk_26432A408;
      id v23 = v9;
      __int16 v24 = self;
      dispatch_async(MEMORY[0x263EF83A0], v22);
    }
    else
    {
      id v21 = SO_LOG_SORemoteExtensionContext();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2185C9000, v21, OS_LOG_TYPE_DEFAULT, "optional API cancelAuthorizationWithRequest is not implemented in extension", buf, 2u);
      }
    }
  }
  else
  {
    id v20 = SO_LOG_SORemoteExtensionContext();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2185C9000, v20, OS_LOG_TYPE_DEFAULT, "Request already completed.", buf, 2u);
    }

    v7[2](v7, 0, 0);
  }
}

void __59__SORemoteExtensionContext_cancelAuthorization_completion___block_invoke(uint64_t a1)
{
  v2 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __59__SORemoteExtensionContext_cancelAuthorization_completion___block_invoke_cold_2(a1, v2);
  }

  id v3 = [*(id *)(a1 + 40) extensionViewController];
  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = (uint64_t *)(a1 + 32);
  [v3 cancelAuthorizationWithRequest:v5];

  id v6 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __59__SORemoteExtensionContext_cancelAuthorization_completion___block_invoke_cold_1(v4, v6);
  }
}

- (void)finishAuthorization:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v8 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315650;
    id v20 = "-[SORemoteExtensionContext finishAuthorization:completion:]";
    __int16 v21 = 2114;
    id v22 = v6;
    __int16 v23 = 2112;
    __int16 v24 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier = %{public}@ on %@", (uint8_t *)&v19, 0x20u);
  }

  v9 = [(SORemoteExtensionContext *)self findRequestForIdentifier:v6];
  uint64_t v10 = [v9 authorizationRequest];
  objc_sync_enter(v10);
  id v11 = [v9 authorizationRequest];
  int v12 = [v11 secKeyProxiesConnectedClients];

  if (v12)
  {
    uint64_t v13 = SO_LOG_SORemoteExtensionContext();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      __int16 v17 = [v9 authorizationRequest];
      int v18 = [v17 secKeyProxiesConnectedClients];
      int v19 = 67109120;
      LODWORD(v20) = v18;
      _os_log_debug_impl(&dword_2185C9000, v13, OS_LOG_TYPE_DEBUG, "postponing finishAuthorization completion because of connected secKeyProxies clients (%d)", (uint8_t *)&v19, 8u);
    }
    uint64_t v14 = (void *)MEMORY[0x21D46DFC0](v7);
    id finishAuthorizationCompletion = self->_finishAuthorizationCompletion;
    self->_id finishAuthorizationCompletion = v14;

    objc_sync_exit(v10);
  }
  else
  {
    __int16 v16 = [v9 authorizationRequest];
    [v16 setSecKeyProxies:0];

    objc_sync_exit(v10);
    if (v7) {
      v7[2](v7, 1, 0);
    }
    [(SORemoteExtensionContext *)self removeRequestForIdentifier:v6];
  }
}

- (void)completeFinishAuthorization:(id)a3 error:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315906;
    uint64_t v15 = "-[SORemoteExtensionContext completeFinishAuthorization:error:]";
    __int16 v16 = 2114;
    id v17 = v6;
    __int16 v18 = 2114;
    id v19 = v7;
    __int16 v20 = 2112;
    __int16 v21 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier = %{public}@, error: %{public}@ on %@", (uint8_t *)&v14, 0x2Au);
  }

  v9 = [(SORemoteExtensionContext *)self findRequestForIdentifier:v6];
  uint64_t v10 = [v9 authorizationRequest];
  objc_sync_enter(v10);
  id finishAuthorizationCompletion = (void (**)(id, BOOL, id))self->_finishAuthorizationCompletion;
  if (finishAuthorizationCompletion)
  {
    finishAuthorizationCompletion[2](finishAuthorizationCompletion, v7 == 0, v7);
    id v12 = self->_finishAuthorizationCompletion;
    self->_id finishAuthorizationCompletion = 0;

    objc_sync_exit(v10);
    [(SORemoteExtensionContext *)self removeRequestForIdentifier:v6];
  }
  else
  {
    uint64_t v13 = SO_LOG_SORemoteExtensionContext();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[SORemoteExtensionContext completeFinishAuthorization:error:](v13);
    }

    objc_sync_exit(v10);
  }
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315907;
    int v14 = "-[SORemoteExtensionContext openURL:completionHandler:]";
    __int16 v15 = 2160;
    uint64_t v16 = 1752392040;
    __int16 v17 = 2117;
    id v18 = v6;
    __int16 v19 = 2112;
    __int16 v20 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s URL: %{sensitive, mask.hash}@ on %@", buf, 0x2Au);
  }

  id v12 = 0;
  v9 = [(SORemoteExtensionContext *)self hostContextWithError:&v12];
  id v10 = v12;
  if (v9)
  {
    [v9 openURL:v6 completionHandler:v7];
  }
  else
  {
    id v11 = SO_LOG_SORemoteExtensionContext();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SORemoteExtensionContext openURL:completionHandler:]();
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (BOOL)canOpenURL:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315907;
    *(void *)&uint8_t buf[4] = "-[SORemoteExtensionContext canOpenURL:]";
    *(_WORD *)&buf[12] = 2160;
    *(void *)&buf[14] = 1752392040;
    *(_WORD *)&buf[22] = 2117;
    id v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s URL: %{sensitive, mask.hash}@ on %@", buf, 0x2Au);
  }

  id v12 = 0;
  id v6 = [(SORemoteExtensionContext *)self synchronousHostContextWithError:&v12];
  id v7 = v12;
  if (v6)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v14) = 0;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __39__SORemoteExtensionContext_canOpenURL___block_invoke;
    v11[3] = &unk_26432A430;
    v11[4] = buf;
    [v6 canOpenURL:v4 completionHandler:v11];
    BOOL v8 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v9 = SO_LOG_SORemoteExtensionContext();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SORemoteExtensionContext canOpenURL:]();
    }

    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __39__SORemoteExtensionContext_canOpenURL___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)beginDeviceRegistrationUsingOptions:(int64_t)a3 extensionData:(id)a4 completion:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = (void (**)(id, uint64_t))a5;
  BOOL v8 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [NSNumber numberWithInteger:a3];
    int v11 = 136315650;
    id v12 = "-[SORemoteExtensionContext beginDeviceRegistrationUsingOptions:extensionData:completion:]";
    __int16 v13 = 2114;
    id v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s options = %{public}@ on %@", (uint8_t *)&v11, 0x20u);
  }
  id v10 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2185C9000, v10, OS_LOG_TYPE_DEFAULT, "extension PSSO API beginDeviceRegistrationUsingLoginManager is not implemented in extension", (uint8_t *)&v11, 2u);
  }

  if (v7) {
    v7[2](v7, 3);
  }
}

- (void)beginUserRegistrationUsingUserName:(id)a3 authenticationMethod:(int)a4 options:(int64_t)a5 extensionData:(id)a6 completion:(id)a7
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v8 = (void (**)(id, uint64_t))a7;
  v9 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    id v12 = "-[SORemoteExtensionContext beginUserRegistrationUsingUserName:authenticationMethod:options:extensionData:completion:]";
    __int16 v13 = 2112;
    id v14 = self;
    _os_log_impl(&dword_2185C9000, v9, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v11, 0x16u);
  }

  id v10 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2185C9000, v10, OS_LOG_TYPE_DEFAULT, "extension PSSO API beginUserRegistrationUsingLoginManager is not implemented in extension", (uint8_t *)&v11, 2u);
  }

  if (v8) {
    v8[2](v8, 3);
  }
}

- (void)registrationDidCompleteWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  uint64_t v5 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    BOOL v8 = "-[SORemoteExtensionContext registrationDidCompleteWithCompletion:]";
    __int16 v9 = 2112;
    id v10 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_2185C9000, v6, OS_LOG_TYPE_DEFAULT, "extension PSSO API registrationDidComplete is not implemented in extension", (uint8_t *)&v7, 2u);
  }

  v4[2](v4);
}

- (void)registrationDidCancelWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  uint64_t v5 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    BOOL v8 = "-[SORemoteExtensionContext registrationDidCancelWithCompletion:]";
    __int16 v9 = 2112;
    id v10 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_2185C9000, v6, OS_LOG_TYPE_DEFAULT, "extension PSSO API registrationDidCancel is not implemented in extension", (uint8_t *)&v7, 2u);
  }

  v4[2](v4);
}

- (void)supportedGrantTypesCompletion:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  id v4 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2185C9000, v4, OS_LOG_TYPE_DEFAULT, "extension PSSO API supportedGrantTypes is not implemented in extension", v5, 2u);
  }

  if (v3) {
    v3[2](v3, 0);
  }
}

- (void)protocolVersionCompletion:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  id v4 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2185C9000, v4, OS_LOG_TYPE_DEFAULT, "extension PSSO API protocolVersion is not implemented in extension", v5, 2u);
  }

  if (v3) {
    v3[2](v3, 0);
  }
}

- (void)canPerformRegistrationCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    BOOL v8 = "-[SORemoteExtensionContext canPerformRegistrationCompletion:]";
    __int16 v9 = 2112;
    id v10 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[SORemoteExtensionContext canPerformRegistrationCompletion:](v6);
  }

  v4[2](v4, 0);
}

- (void)_disableAppSSOInCFNetwork
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[SORemoteExtensionContext _disableAppSSOInCFNetwork]";
    __int16 v6 = 2112;
    int v7 = self;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }

  [MEMORY[0x263F08BF8] _disableAppSSO];
}

- (void)supportedDeviceSigningAlgorithmsCompletion:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  int v4 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2185C9000, v4, OS_LOG_TYPE_DEFAULT, "extension PSSO API supportedDeviceSigningAlgorithms is not implemented in extension", v5, 2u);
  }

  if (v3) {
    v3[2](v3, 0);
  }
}

- (void)supportedDeviceEncryptionAlgorithmsCompletion:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  int v4 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2185C9000, v4, OS_LOG_TYPE_DEFAULT, "extension PSSO API supportedDeviceEncryptionAlgorithms is not implemented in extension", v5, 2u);
  }

  if (v3) {
    v3[2](v3, 0);
  }
}

- (void)supportedUserSecureEnclaveKeySigningAlgorithmsCompletion:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  int v4 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2185C9000, v4, OS_LOG_TYPE_DEFAULT, "extension PSSO API supportedUserSecureEnclaveKeySigningAlgorithms is not implemented in extension", v5, 2u);
  }

  if (v3) {
    v3[2](v3, 0);
  }
}

- (void)keyWillRotateForKeyType:(int64_t)a3 keyProxyEndpoint:(id)a4 extensionData:(id)a5 completion:(id)a6
{
  __int16 v6 = (void (**)(id, uint64_t))a6;
  int v7 = SO_LOG_SORemoteExtensionContext();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_2185C9000, v7, OS_LOG_TYPE_DEFAULT, "extension PSSO API keyWillRotateForKeyType is not implemented in extension", v8, 2u);
  }

  if (v6) {
    v6[2](v6, 1);
  }
}

- (SOExtensionViewService)viewService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewService);
  return (SOExtensionViewService *)WeakRetained;
}

- (void)setViewService:(id)a3
{
}

- (id)registrationCompletion
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setRegistrationCompletion:(id)a3
{
}

- (id)rotationCompletion
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setRotationCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rotationCompletion, 0);
  objc_storeStrong(&self->_registrationCompletion, 0);
  objc_destroyWeak((id *)&self->_viewService);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong(&self->_finishAuthorizationCompletion, 0);
  objc_storeStrong((id *)&self->_extensionAuthorizationRequestHandler, 0);
  objc_storeStrong((id *)&self->_extensionServiceConnection, 0);
}

- (void)extensionAuthorizationRequestHandlerWithError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_2185C9000, v0, v1, "Failed to get NSExtensionPrincipalClass or NSExtensionMainStoryboard: %{public}@", v2, v3, v4, v5, v6);
}

- (void)extensionAuthorizationRequestHandlerWithError:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_2185C9000, v0, v1, "Failed to instantiate initial view controller from storyboard: %{public}@", v2, v3, v4, v5, v6);
}

- (void)extensionAuthorizationRequestHandlerWithError:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_2185C9000, v0, v1, "Failed to get extension principalClass for principalClassName: %{public}@", v2, v3, v4, v5, v6);
}

- (void)extensionAuthorizationRequestHandlerWithError:(os_log_t)log .cold.4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_2185C9000, log, OS_LOG_TYPE_DEBUG, "creating extension authorization request handler", v1, 2u);
}

void __49__SORemoteExtensionContext_hostContextWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_2185C9000, v0, v1, "Error getting host context %{public}@", v2, v3, v4, v5, v6);
}

void __60__SORemoteExtensionContext_synchronousHostContextWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_2185C9000, v0, v1, "Error getting synchronous host context %{public}@", v2, v3, v4, v5, v6);
}

void __79__SORemoteExtensionContext_beginAuthorizationWithRequestParameters_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_4(v0) identifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2185C9000, v2, v3, "finished extension API beginAuthorizationWithRequest, requestIdentifier = %{public}@, %{public}@", v4, v5, v6, v7, v8);
}

void __79__SORemoteExtensionContext_beginAuthorizationWithRequestParameters_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_4(v0) identifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2185C9000, v2, v3, "calling extension API beginAuthorizationWithRequest, requestIdentifier = %{public}@ %{public}@", v4, v5, v6, v7, v8);
}

void __80__SORemoteExtensionContext_beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_4(v0) identifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2185C9000, v2, v3, "calling extension API beginAuthorizationWithRequest, requestIdentifier = %{public}@, %{public}@", v4, v5, v6, v7, v8);
}

void __59__SORemoteExtensionContext_cancelAuthorization_completion___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_2185C9000, a2, OS_LOG_TYPE_DEBUG, "finished extension API cancelAuthorizationWithRequest, %{public}@", (uint8_t *)&v3, 0xCu);
}

void __59__SORemoteExtensionContext_cancelAuthorization_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_2185C9000, a2, OS_LOG_TYPE_DEBUG, "calling extension API cancelAuthorizationWithRequest, %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)completeFinishAuthorization:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_2185C9000, log, OS_LOG_TYPE_DEBUG, "no finishAuthorization completion block => ignoring complete request", v1, 2u);
}

- (void)openURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_2185C9000, v0, v1, "failed to get host context to open URL, error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)canOpenURL:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_2185C9000, v0, v1, "failed to get synchronous host context to open URL, error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)canPerformRegistrationCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2185C9000, log, OS_LOG_TYPE_ERROR, "Extension has not implemented registration protocol.", v1, 2u);
}

@end