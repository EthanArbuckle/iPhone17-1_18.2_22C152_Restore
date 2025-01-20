@interface SOAuthorizationRequest
- (BOOL)_isUserInterfaceAllowed;
- (BOOL)isAuthorizationCanceled;
- (BOOL)isCFNetworkInterception;
- (BOOL)isCallerManaged;
- (BOOL)isUserInteractionEnabled;
- (NSArray)secKeyProxies;
- (NSData)auditTokenData;
- (NSData)httpBody;
- (NSDictionary)authorizationOptions;
- (NSDictionary)extensionData;
- (NSDictionary)httpHeaders;
- (NSError)canceledAuthorizationError;
- (NSString)callerBundleIdentifier;
- (NSString)callerTeamIdentifier;
- (NSString)identifier;
- (NSString)impersonationBundleIdentifier;
- (NSString)localizedCallerDisplayName;
- (NSString)realm;
- (NSString)requestedOperation;
- (NSURL)url;
- (POLoginManager)loginManager;
- (SOAuthorizationCredential)canceledAuthorizationCredential;
- (SOAuthorizationRequest)initWithRequestParameters:(id)a3 remoteExtensionContext:(id)a4;
- (id)_createSecKeyProxiesForSecKeys:(id)a3 error:(id *)a4;
- (id)_hostExtensionContext;
- (int)secKeyProxiesConnectedClients;
- (void)_completeFinishAuthorizationWithRequestIdentifier:(id)a3 error:(id)a4;
- (void)_hostExtensionContext;
- (void)_invalidateLoginManager;
- (void)cancel;
- (void)complete;
- (void)completeWithAuthorizationResult:(id)a3;
- (void)completeWithError:(id)a3;
- (void)completeWithHTTPAuthorizationHeaders:(id)a3;
- (void)completeWithHTTPResponse:(id)a3 httpBody:(id)a4;
- (void)doNotHandle;
- (void)presentAuthorizationViewControllerWithCompletion:(id)a3;
- (void)presentAuthorizationViewControllerWithHints:(id)a3 completion:(id)a4;
- (void)setAuditTokenData:(id)a3;
- (void)setAuthorizationCanceled:(BOOL)a3;
- (void)setAuthorizationOptions:(id)a3;
- (void)setCFNetworkInterception:(BOOL)a3;
- (void)setCallerBundleIdentifier:(id)a3;
- (void)setCallerManaged:(BOOL)a3;
- (void)setCallerTeamIdentifier:(id)a3;
- (void)setCanceledAuthorizationCredential:(id)a3;
- (void)setCanceledAuthorizationError:(id)a3;
- (void)setEnableUserInteraction:(BOOL)a3;
- (void)setExtensionData:(id)a3;
- (void)setHttpBody:(id)a3;
- (void)setHttpHeaders:(id)a3;
- (void)setImpersonationBundleIdentifier:(id)a3;
- (void)setLocalizedCallerDisplayName:(id)a3;
- (void)setRealm:(id)a3;
- (void)setRequestedOperation:(id)a3;
- (void)setSecKeyProxies:(id)a3;
- (void)setSecKeyProxiesConnectedClients:(int)a3;
- (void)setUrl:(id)a3;
@end

@implementation SOAuthorizationRequest

- (SOAuthorizationRequest)initWithRequestParameters:(id)a3 remoteExtensionContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SOAuthorizationRequest;
  v9 = [(SOAuthorizationRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestParameters, a3);
    objc_storeWeak((id *)&v10->_remoteExtensionContext, v8);
  }

  return v10;
}

- (void)doNotHandle
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "%@: cancel -> doNotHandle", v2, v3, v4, v5, v6);
}

- (void)cancel
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "%@: cancel -> cancel", v2, v3, v4, v5, v6);
}

- (void)complete
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "%@: cancel -> complete", v2, v3, v4, v5, v6);
}

- (void)completeWithHTTPAuthorizationHeaders:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = SO_LOG_SOAuthorizationRequest();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint8_t v6 = [(SOAuthorizationRequestParameters *)self->_requestParameters identifier];
    *(_DWORD *)buf = 136316163;
    v27 = "-[SOAuthorizationRequest completeWithHTTPAuthorizationHeaders:]";
    __int16 v28 = 2114;
    v29 = v6;
    __int16 v30 = 2160;
    uint64_t v31 = 1752392040;
    __int16 v32 = 2117;
    id v33 = v4;
    __int16 v34 = 2112;
    v35 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s extension API called, identifier = %{public}@, httpAuthorizationHeaders = %{sensitive, mask.hash}@ on %@", buf, 0x34u);
  }
  [(SOAuthorizationRequest *)self _invalidateLoginManager];
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v14 = objc_msgSend(v8, "objectForKeyedSubscript:", v13, (void)v21);
        v15 = [v14 description];
        v16 = [v13 description];
        [v7 setObject:v15 forKeyedSubscript:v16];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  id v17 = objc_alloc_init((Class)getSOAuthorizationCredentialClass());
  [v17 setHttpAuthorizationHeaders:v7];
  if ([(SOAuthorizationRequest *)self isAuthorizationCanceled])
  {
    v18 = SO_LOG_SOAuthorizationRequest();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[SOAuthorizationRequest completeWithHTTPAuthorizationHeaders:]();
    }

    objc_storeStrong((id *)&self->_canceledAuthorizationCredential, v17);
    canceledAuthorizationError = self->_canceledAuthorizationError;
    self->_canceledAuthorizationError = 0;
  }
  else
  {
    canceledAuthorizationError = [(SOAuthorizationRequest *)self _hostExtensionContext];
    v20 = [(SOAuthorizationRequestParameters *)self->_requestParameters identifier];
    [canceledAuthorizationError authorization:v20 didCompleteWithCredential:v17 error:0];
  }
}

- (void)completeWithHTTPResponse:(id)a3 httpBody:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = SO_LOG_SOAuthorizationRequest();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136316419;
    v15 = "-[SOAuthorizationRequest completeWithHTTPResponse:httpBody:]";
    __int16 v16 = 2160;
    uint64_t v17 = 1752392040;
    __int16 v18 = 2117;
    id v19 = v6;
    __int16 v20 = 2160;
    uint64_t v21 = 1752392040;
    __int16 v22 = 2117;
    id v23 = v7;
    __int16 v24 = 2112;
    v25 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s extension API called, httpResponse = %{sensitive, mask.hash}@, httpBody = %{sensitive, mask.hash}@ on %@", (uint8_t *)&v14, 0x3Eu);
  }

  [(SOAuthorizationRequest *)self _invalidateLoginManager];
  id v9 = objc_alloc_init((Class)getSOAuthorizationCredentialClass());
  [v9 setHttpResponse:v6];
  if (v7)
  {
    [v9 setHttpBody:v7];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF8F8]);
    [v9 setHttpBody:v10];
  }
  if ([(SOAuthorizationRequest *)self isAuthorizationCanceled])
  {
    uint64_t v11 = SO_LOG_SOAuthorizationRequest();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[SOAuthorizationRequest completeWithHTTPResponse:httpBody:]();
    }

    objc_storeStrong((id *)&self->_canceledAuthorizationCredential, v9);
    canceledAuthorizationError = self->_canceledAuthorizationError;
    self->_canceledAuthorizationError = 0;
  }
  else
  {
    canceledAuthorizationError = [(SOAuthorizationRequest *)self _hostExtensionContext];
    v13 = [(SOAuthorizationRequestParameters *)self->_requestParameters identifier];
    [canceledAuthorizationError authorization:v13 didCompleteWithCredential:v9 error:0];
  }
}

- (void)completeWithAuthorizationResult:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = SO_LOG_SOAuthorizationRequest();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315651;
    __int16 v32 = "-[SOAuthorizationRequest completeWithAuthorizationResult:]";
    __int16 v33 = 2113;
    id v34 = v4;
    __int16 v35 = 2112;
    uint64_t v36 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s extension API called, completeWithAuthorizationResult = %{private}@ on %@", buf, 0x20u);
  }

  [(SOAuthorizationRequest *)self _invalidateLoginManager];
  id v6 = (void *)[objc_alloc((Class)getSOAuthorizationCredentialClass()) initWithAuthorizationResult:v4];
  id v7 = [v4 privateKeys];
  uint64_t v8 = [v7 count];

  if (!v8) {
    goto LABEL_13;
  }
  id v9 = [v4 privateKeys];
  id v29 = 0;
  id v10 = [(SOAuthorizationRequest *)self _createSecKeyProxiesForSecKeys:v9 error:&v29];
  id canceledAuthorizationError = v29;
  secKeyProxies = self->_secKeyProxies;
  self->_secKeyProxies = v10;

  if (self->_secKeyProxies)
  {
    v13 = [MEMORY[0x263EFF980] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    int v14 = self->_secKeyProxies;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v18), "endpoint", (void)v25);
          [v13 addObject:v19];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v16);
    }

    [v6 setSecKeyProxyEndpoints:v13];
LABEL_13:
    if ([(SOAuthorizationRequest *)self isAuthorizationCanceled])
    {
      __int16 v20 = SO_LOG_SOAuthorizationRequest();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[SOAuthorizationRequest completeWithHTTPAuthorizationHeaders:]();
      }

      objc_storeStrong((id *)&self->_canceledAuthorizationCredential, v6);
      id canceledAuthorizationError = self->_canceledAuthorizationError;
      self->_id canceledAuthorizationError = 0;
    }
    else
    {
      id canceledAuthorizationError = [(SOAuthorizationRequest *)self _hostExtensionContext];
      uint64_t v21 = [(SOAuthorizationRequestParameters *)self->_requestParameters identifier];
      [canceledAuthorizationError authorization:v21 didCompleteWithCredential:v6 error:0];
    }
    goto LABEL_21;
  }
  __int16 v22 = SO_LOG_SOAuthorizationRequest();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[SOAuthorizationRequest completeWithAuthorizationResult:]();
  }

  id v23 = [(SOAuthorizationRequest *)self _hostExtensionContext];
  __int16 v24 = [(SOAuthorizationRequestParameters *)self->_requestParameters identifier];
  [v23 authorization:v24 didCompleteWithCredential:0 error:canceledAuthorizationError];

LABEL_21:
}

- (void)completeWithError:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = SO_LOG_SOAuthorizationRequest();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    objc_super v12 = "-[SOAuthorizationRequest completeWithError:]";
    __int16 v13 = 2114;
    id v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s extension API called, error = %{public}@ on %@", (uint8_t *)&v11, 0x20u);
  }

  [(SOAuthorizationRequest *)self _invalidateLoginManager];
  if ([(SOAuthorizationRequest *)self isAuthorizationCanceled])
  {
    id v6 = SO_LOG_SOAuthorizationRequest();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[SOAuthorizationRequest completeWithError:]();
    }

    canceledAuthorizationCredential = self->_canceledAuthorizationCredential;
    self->_canceledAuthorizationCredential = 0;

    uint64_t v8 = (NSError *)v4;
    id canceledAuthorizationError = self->_canceledAuthorizationError;
    self->_id canceledAuthorizationError = v8;
  }
  else
  {
    id canceledAuthorizationError = [(SOAuthorizationRequest *)self _hostExtensionContext];
    id v10 = [(SOAuthorizationRequestParameters *)self->_requestParameters identifier];
    [canceledAuthorizationError authorization:v10 didCompleteWithCredential:0 error:v4];
  }
}

- (void)presentAuthorizationViewControllerWithCompletion:(id)a3
{
}

- (void)presentAuthorizationViewControllerWithHints:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = SO_LOG_SOAuthorizationRequest();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v26 = "-[SOAuthorizationRequest presentAuthorizationViewControllerWithHints:completion:]";
    __int16 v27 = 2112;
    long long v28 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s extension API called on %@", buf, 0x16u);
  }

  if ([(SOAuthorizationRequest *)self isAuthorizationCanceled])
  {
    id v9 = SO_LOG_SOAuthorizationRequest();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SOAuthorizationRequest presentAuthorizationViewControllerWithHints:completion:]();
    }

    if (v7)
    {
      id v10 = [getSOErrorHelperClass_1() internalErrorWithMessage:@"Authorization has been already canceled"];
      v7[2](v7, 0, v10);
LABEL_22:
    }
  }
  else
  {
    if (![(SOAuthorizationRequestParameters *)self->_requestParameters isUserInteractionEnabled])
    {
      __int16 v13 = SO_LOG_SOAuthorizationRequest();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SOAuthorizationRequest presentAuthorizationViewControllerWithHints:completion:]();
      }

      if (v7)
      {
        id v14 = (void *)MEMORY[0x263F087E8];
        __int16 v15 = getASAuthorizationErrorDomain();
        uint64_t v16 = [v14 errorWithDomain:v15 code:1005 userInfo:0];
        v7[2](v7, 0, v16);
      }
      id v10 = [getSOErrorHelperClass_1() errorWithCode:-12];
      uint64_t v17 = SO_LOG_SOAuthorizationRequest();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        long long v26 = (const char *)v10;
        _os_log_impl(&dword_2185C9000, v17, OS_LOG_TYPE_DEFAULT, "finish authorization with error: %{public}@", buf, 0xCu);
      }

      uint64_t v18 = [(SOAuthorizationRequest *)self _hostExtensionContext];
      id v19 = [(SOAuthorizationRequestParameters *)self->_requestParameters identifier];
      [v18 authorization:v19 didCompleteWithCredential:0 error:v10];

      goto LABEL_22;
    }
    if ([(SOAuthorizationRequest *)self _isUserInterfaceAllowed])
    {
      int v11 = [(SOAuthorizationRequest *)self _hostExtensionContext];
      objc_super v12 = [(SOAuthorizationRequestParameters *)self->_requestParameters identifier];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __81__SOAuthorizationRequest_presentAuthorizationViewControllerWithHints_completion___block_invoke;
      v23[3] = &unk_26432AA18;
      v23[4] = self;
      __int16 v24 = v7;
      [v11 presentAuthorizationViewControllerWithHints:v6 requestIdentifier:v12 completion:v23];

      id v10 = v24;
      goto LABEL_22;
    }
    __int16 v20 = SO_LOG_SOAuthorizationRequest();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SOAuthorizationRequest presentAuthorizationViewControllerWithHints:completion:]();
    }

    if (v7)
    {
      uint64_t v21 = (void *)MEMORY[0x263F087E8];
      id v10 = getASAuthorizationErrorDomain();
      __int16 v22 = [v21 errorWithDomain:v10 code:1001 userInfo:0];
      v7[2](v7, 0, v22);

      goto LABEL_22;
    }
  }
}

void __81__SOAuthorizationRequest_presentAuthorizationViewControllerWithHints_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (*(void *)(a1 + 40))
  {
    if (v4 && [v4 code] == -8)
    {
      id v6 = [v5 userInfo];
      id v7 = [v6 objectForKeyedSubscript:@"Subcode"];

      if (v7 && [v7 intValue] == 1)
      {
        uint64_t v8 = SO_LOG_SOAuthorizationRequest();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          __81__SOAuthorizationRequest_presentAuthorizationViewControllerWithHints_completion___block_invoke_cold_1(a1, v8, v9, v10, v11, v12, v13, v14);
        }

        __int16 v15 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = getASAuthorizationErrorDomain();
        uint64_t v17 = [v15 errorWithDomain:v16 code:1001 userInfo:0];

        uint64_t v5 = (void *)v17;
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (BOOL)_isUserInterfaceAllowed
{
  uint64_t v2 = [(SOAuthorizationRequest *)self authorizationOptions];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v3 = (void *)getSOAuthorizationOptionCoreNoUserInterfaceSymbolLoc_ptr;
  uint64_t v12 = getSOAuthorizationOptionCoreNoUserInterfaceSymbolLoc_ptr;
  if (!getSOAuthorizationOptionCoreNoUserInterfaceSymbolLoc_ptr)
  {
    id v4 = (void *)AppSSOCoreLibrary_1();
    v10[3] = (uint64_t)dlsym(v4, "SOAuthorizationOptionCoreNoUserInterface");
    getSOAuthorizationOptionCoreNoUserInterfaceSymbolLoc_ptr = v10[3];
    uint64_t v3 = (void *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v3)
  {
    ASAuthorizationErrorDomain_cold_1 = (_Unwind_Exception *)getASAuthorizationErrorDomain_cold_1();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(ASAuthorizationErrorDomain_cold_1);
  }
  uint64_t v5 = [v2 objectForKeyedSubscript:*v3];
  int v6 = [v5 BOOLValue] ^ 1;

  return v6;
}

- (id)_hostExtensionContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteExtensionContext);
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = 0;
    id v4 = [WeakRetained hostContextWithError:&v8];
    uint64_t v5 = v8;
    if (!v4)
    {
      int v6 = SO_LOG_SOAuthorizationRequest();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SOAuthorizationRequest _hostExtensionContext]();
      }
    }
  }
  else
  {
    uint64_t v5 = SO_LOG_SOAuthorizationRequest();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SOAuthorizationRequest _hostExtensionContext](v5);
    }
    id v4 = 0;
  }

  return v4;
}

- (void)_completeFinishAuthorizationWithRequestIdentifier:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteExtensionContext);
  uint64_t v9 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained completeFinishAuthorization:v6 error:v7];
  }
  else
  {
    uint64_t v10 = SO_LOG_SOAuthorizationRequest();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SOAuthorizationRequest _hostExtensionContext](v10);
    }
  }
}

- (id)_createSecKeyProxiesForSecKeys:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [MEMORY[0x263EFF980] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(const void **)(*((void *)&v24 + 1) + 8 * i);
        CFTypeID v12 = CFGetTypeID(v11);
        if (v12 != SecKeyGetTypeID())
        {
          uint64_t v16 = SO_LOG_SOAuthorizationRequest();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[SOAuthorizationRequest _createSecKeyProxiesForSecKeys:error:]();
          }

          uint64_t v14 = obj;
          if (a4)
          {
            uint64_t v17 = (void *)MEMORY[0x263F087E8];
            uint64_t v18 = getASAuthorizationErrorDomain();
            *a4 = [v17 errorWithDomain:v18 code:1002 userInfo:0];
          }
          id v15 = 0;
          goto LABEL_15;
        }
        uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F16D70]) initWithKey:v11];
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __63__SOAuthorizationRequest__createSecKeyProxiesForSecKeys_error___block_invoke;
        v23[3] = &unk_26432AA40;
        v23[4] = self;
        [v13 setClientConnectionHandler:v23];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __63__SOAuthorizationRequest__createSecKeyProxiesForSecKeys_error___block_invoke_7;
        v22[3] = &unk_26432AA40;
        v22[4] = self;
        [v13 setClientDisconnectionHandler:v22];
        [v6 addObject:v13];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = obj;

  id v15 = v6;
LABEL_15:

  return v15;
}

void __63__SOAuthorizationRequest__createSecKeyProxiesForSecKeys_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  objc_msgSend(*(id *)(a1 + 32), "setSecKeyProxiesConnectedClients:", objc_msgSend(*(id *)(a1 + 32), "secKeyProxiesConnectedClients") + 1);
  id v5 = SO_LOG_SOAuthorizationRequest();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __63__SOAuthorizationRequest__createSecKeyProxiesForSecKeys_error___block_invoke_cold_1(a2, (uint64_t)v6, [*(id *)(a1 + 32) secKeyProxiesConnectedClients]);
  }

  objc_sync_exit(v4);
}

void __63__SOAuthorizationRequest__createSecKeyProxiesForSecKeys_error___block_invoke_7(uint64_t a1, uint64_t a2)
{
  v8[3] = *MEMORY[0x263EF8340];
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  objc_msgSend(*(id *)(a1 + 32), "setSecKeyProxiesConnectedClients:", objc_msgSend(*(id *)(a1 + 32), "secKeyProxiesConnectedClients") - 1);
  id v5 = SO_LOG_SOAuthorizationRequest();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __63__SOAuthorizationRequest__createSecKeyProxiesForSecKeys_error___block_invoke_7_cold_1(a2, (uint64_t)v8, [*(id *)(a1 + 32) secKeyProxiesConnectedClients]);
  }

  if (![*(id *)(a1 + 32) secKeyProxiesConnectedClients])
  {
    [*(id *)(a1 + 32) setSecKeyProxies:0];
    id v6 = *(id **)(a1 + 32);
    uint64_t v7 = [v6[1] identifier];
    [v6 _completeFinishAuthorizationWithRequestIdentifier:v7 error:0];
  }
  objc_sync_exit(v4);
}

- (void)_invalidateLoginManager
{
  loginManager = self->_loginManager;
  if (loginManager)
  {
    [(POLoginManager *)loginManager invalidate];
    id v4 = self->_loginManager;
    self->_loginManager = 0;
  }
}

- (NSURL)url
{
  return [(SOAuthorizationRequestParameters *)self->_requestParameters url];
}

- (void)setUrl:(id)a3
{
}

- (NSString)requestedOperation
{
  uint64_t v2 = [(SOAuthorizationRequestParameters *)self->_requestParameters requestedOperation];
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = &stru_26C9B0BC0;
  }
  id v4 = v2;

  return v4;
}

- (void)setRequestedOperation:(id)a3
{
}

- (NSDictionary)httpHeaders
{
  uint64_t v2 = [(SOAuthorizationRequestParameters *)self->_requestParameters httpHeaders];
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = (void *)MEMORY[0x263EFFA78];
  }
  id v4 = v2;

  return v4;
}

- (void)setHttpHeaders:(id)a3
{
}

- (NSData)httpBody
{
  uint64_t v2 = [(SOAuthorizationRequestParameters *)self->_requestParameters httpBody];
  uint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x263EFF8F8]);
  }
  id v5 = v4;

  return (NSData *)v5;
}

- (void)setHttpBody:(id)a3
{
}

- (NSString)realm
{
  uint64_t v2 = [(SOAuthorizationRequestParameters *)self->_requestParameters realm];
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = &stru_26C9B0BC0;
  }
  id v4 = v2;

  return v4;
}

- (void)setRealm:(id)a3
{
}

- (NSDictionary)extensionData
{
  uint64_t v2 = [(SOAuthorizationRequestParameters *)self->_requestParameters extensionData];
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = (void *)MEMORY[0x263EFFA78];
  }
  id v4 = v2;

  return v4;
}

- (void)setExtensionData:(id)a3
{
}

- (NSString)callerBundleIdentifier
{
  uint64_t v2 = [(SOAuthorizationRequestParameters *)self->_requestParameters callerBundleIdentifier];
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = &stru_26C9B0BC0;
  }
  id v4 = v2;

  return v4;
}

- (void)setCallerBundleIdentifier:(id)a3
{
}

- (NSData)auditTokenData
{
  uint64_t v2 = [(SOAuthorizationRequestParameters *)self->_requestParameters auditTokenData];
  uint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x263EFF8F8]);
  }
  id v5 = v4;

  return (NSData *)v5;
}

- (void)setAuditTokenData:(id)a3
{
}

- (NSDictionary)authorizationOptions
{
  uint64_t v2 = [(SOAuthorizationRequestParameters *)self->_requestParameters authorizationOptions];
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = (void *)MEMORY[0x263EFFA78];
  }
  id v4 = v2;

  return v4;
}

- (void)setAuthorizationOptions:(id)a3
{
}

- (BOOL)isCFNetworkInterception
{
  return [(SOAuthorizationRequestParameters *)self->_requestParameters isCFNetworkInterception];
}

- (void)setCFNetworkInterception:(BOOL)a3
{
}

- (BOOL)isCallerManaged
{
  return [(SOAuthorizationRequestParameters *)self->_requestParameters isCallerManaged];
}

- (void)setCallerManaged:(BOOL)a3
{
}

- (NSString)callerTeamIdentifier
{
  uint64_t v2 = [(SOAuthorizationRequestParameters *)self->_requestParameters callerTeamIdentifier];
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = &stru_26C9B0BC0;
  }
  id v4 = v2;

  return v4;
}

- (void)setCallerTeamIdentifier:(id)a3
{
}

- (NSString)localizedCallerDisplayName
{
  uint64_t v2 = [(SOAuthorizationRequestParameters *)self->_requestParameters localizedCallerDisplayName];
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = &stru_26C9B0BC0;
  }
  id v4 = v2;

  return v4;
}

- (void)setLocalizedCallerDisplayName:(id)a3
{
}

- (BOOL)isUserInteractionEnabled
{
  return [(SOAuthorizationRequestParameters *)self->_requestParameters isUserInteractionEnabled];
}

- (void)setEnableUserInteraction:(BOOL)a3
{
}

- (NSString)impersonationBundleIdentifier
{
  return [(SOAuthorizationRequestParameters *)self->_requestParameters impersonationBundleIdentifier];
}

- (void)setImpersonationBundleIdentifier:(id)a3
{
}

- (POLoginManager)loginManager
{
  if ([(SOAuthorizationRequestParameters *)self->_requestParameters pssoAuthenticationMethod] == 1000)
  {
    uint64_t v3 = 0;
  }
  else
  {
    if (!self->_loginManager)
    {
      uint64_t v13 = 0;
      uint64_t v14 = &v13;
      uint64_t v15 = 0x2050000000;
      id v4 = (void *)getPOLoginManagerClass_softClass;
      uint64_t v16 = getPOLoginManagerClass_softClass;
      if (!getPOLoginManagerClass_softClass)
      {
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __getPOLoginManagerClass_block_invoke;
        v12[3] = &unk_26432A2A8;
        v12[4] = &v13;
        __getPOLoginManagerClass_block_invoke((uint64_t)v12);
        id v4 = (void *)v14[3];
      }
      id v5 = v4;
      _Block_object_dispose(&v13, 8);
      id v6 = (POLoginManager *)objc_alloc_init(v5);
      loginManager = self->_loginManager;
      self->_loginManager = v6;
    }
    uint64_t v8 = [(SOAuthorizationRequest *)self _hostExtensionContext];
    [(POLoginManager *)self->_loginManager setHostExtensionContext:v8];

    uint64_t v9 = [(SOAuthorizationRequestParameters *)self->_requestParameters identifier];
    [(POLoginManager *)self->_loginManager setRequestIdentifier:v9];

    uint64_t v10 = [(SOAuthorizationRequestParameters *)self->_requestParameters extensionData];
    [(POLoginManager *)self->_loginManager setExtensionData:v10];

    uint64_t v3 = self->_loginManager;
  }
  return v3;
}

- (NSString)identifier
{
  return [(SOAuthorizationRequestParameters *)self->_requestParameters identifier];
}

- (BOOL)isAuthorizationCanceled
{
  return self->_authorizationCanceled;
}

- (void)setAuthorizationCanceled:(BOOL)a3
{
  self->_authorizationCanceled = a3;
}

- (SOAuthorizationCredential)canceledAuthorizationCredential
{
  return self->_canceledAuthorizationCredential;
}

- (void)setCanceledAuthorizationCredential:(id)a3
{
}

- (NSError)canceledAuthorizationError
{
  return self->_canceledAuthorizationError;
}

- (void)setCanceledAuthorizationError:(id)a3
{
}

- (NSArray)secKeyProxies
{
  return self->_secKeyProxies;
}

- (void)setSecKeyProxies:(id)a3
{
}

- (int)secKeyProxiesConnectedClients
{
  return self->_secKeyProxiesConnectedClients;
}

- (void)setSecKeyProxiesConnectedClients:(int)a3
{
  self->_secKeyProxiesConnectedClients = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secKeyProxies, 0);
  objc_storeStrong((id *)&self->_canceledAuthorizationError, 0);
  objc_storeStrong((id *)&self->_canceledAuthorizationCredential, 0);
  objc_storeStrong((id *)&self->_loginManager, 0);
  objc_destroyWeak((id *)&self->_remoteExtensionContext);
  objc_storeStrong((id *)&self->_requestParameters, 0);
}

- (void)completeWithHTTPAuthorizationHeaders:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "%@: cancel -> completeWithHTTPAuthorizationHeaders", v2, v3, v4, v5, v6);
}

- (void)completeWithHTTPResponse:httpBody:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "%@: cancel -> completeWithHTTPResponse", v2, v3, v4, v5, v6);
}

- (void)completeWithAuthorizationResult:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_2185C9000, v0, v1, "failed to create SecKey proxies: %{public}@", v2, v3, v4, v5, v6);
}

- (void)completeWithError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "%@: cancel -> completeWithError", v2, v3, v4, v5, v6);
}

- (void)presentAuthorizationViewControllerWithHints:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_2185C9000, v0, v1, "%@, authorization has been already canceled", v2, v3, v4, v5, v6);
}

- (void)presentAuthorizationViewControllerWithHints:completion:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_2185C9000, v0, v1, "%@, authorization wants to display UI but it is not allowed", v2, v3, v4, v5, v6);
}

- (void)presentAuthorizationViewControllerWithHints:completion:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_2185C9000, v0, v1, "%@, authorization wants to display UI but user interaction is not enabled", v2, v3, v4, v5, v6);
}

void __81__SOAuthorizationRequest_presentAuthorizationViewControllerWithHints_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_hostExtensionContext
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_2185C9000, v0, v1, "Failed to get host extension context with error = %{public}@", v2, v3, v4, v5, v6);
}

- (void)_createSecKeyProxiesForSecKeys:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_2185C9000, v0, v1, "invalid SecKey in the authorization result: %{public}@", v2, v3, v4, v5, v6);
}

void __63__SOAuthorizationRequest__createSecKeyProxiesForSecKeys_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_3_0(a1, a2, a3, 1.5047e-36);
  _os_log_debug_impl(&dword_2185C9000, v4, OS_LOG_TYPE_DEBUG, "SecKeyProxy:clientConnectionHandler(firstClientConnected: %d, connectedClients: %d)", v3, 0xEu);
}

void __63__SOAuthorizationRequest__createSecKeyProxiesForSecKeys_error___block_invoke_7_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_3_0(a1, a2, a3, 1.5047e-36);
  _os_log_debug_impl(&dword_2185C9000, v4, OS_LOG_TYPE_DEBUG, "SecKeyProxy:clientDisconnectionHandler(lastClientDisconnected: %d, connectedClients: %d)", v3, 0xEu);
}

@end