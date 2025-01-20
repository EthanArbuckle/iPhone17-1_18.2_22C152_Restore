@interface ASWebAuthenticationSession
+ (void)handleSSOExtensionIdentifier:(id *)a3;
+ (void)resetSSOExtensionIdentifier;
- (ASWebAuthenticationSession)initWithURL:(NSURL *)URL callbackURLScheme:(NSString *)callbackURLScheme completionHandler:(ASWebAuthenticationSessionCompletionHandler)completionHandler;
- (ASWebAuthenticationSession)initWithURL:(id)a3 callback:(id)a4 completionHandler:(id)a5;
- (ASWebAuthenticationSession)initWithURL:(id)a3 callback:(id)a4 usingEphemeralSession:(BOOL)a5 jitEnabled:(BOOL)a6 completionHandler:(id)a7;
- (ASWebAuthenticationSession)initWithURL:(id)a3 callbackURLScheme:(id)a4 usingEphemeralSession:(BOOL)a5 completionHandler:(id)a6;
- (ASWebAuthenticationSession)initWithURL:(id)a3 callbackURLScheme:(id)a4 usingEphemeralSession:(BOOL)a5 jitEnabled:(BOOL)a6 completionHandler:(id)a7;
- (BOOL)_areAdditionalHeaderFieldsValid:(id)a3;
- (BOOL)_isForbiddenHeaderFieldName:(id)a3 value:(id)a4;
- (BOOL)_skipPresentationAnchorCheck;
- (BOOL)_startDryRun:(BOOL)a3;
- (BOOL)_validateAdditionalHeaderFieldsDryRun:(BOOL)a3;
- (BOOL)canStart;
- (BOOL)prefersEphemeralWebBrowserSession;
- (BOOL)shouldFailOnMDMProfileErrorResponse;
- (BOOL)start;
- (NSArray)customAnchorCertificates;
- (NSArray)proxiedAssociatedDomains;
- (NSDictionary)additionalHeaderFields;
- (id)presentationAnchorForAuthorizationController:(id)a3;
- (id)presentationContextProvider;
- (unint64_t)storageMode;
- (void)_cancelWithError:(id)a3;
- (void)_invalidate;
- (void)_setSkipPresentationAnchorCheck:(BOOL)a3;
- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4;
- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4;
- (void)cancel;
- (void)setAdditionalHeaderFields:(id)a3;
- (void)setCustomAnchorCertificates:(id)a3;
- (void)setPrefersEphemeralWebBrowserSession:(BOOL)prefersEphemeralWebBrowserSession;
- (void)setPresentationContextProvider:(id)presentationContextProvider;
- (void)setProxiedAssociatedDomains:(id)a3;
- (void)setShouldFailOnMDMProfileErrorResponse:(BOOL)a3;
- (void)setStorageMode:(unint64_t)a3;
@end

@implementation ASWebAuthenticationSession

- (ASWebAuthenticationSession)initWithURL:(NSURL *)URL callbackURLScheme:(NSString *)callbackURLScheme completionHandler:(ASWebAuthenticationSessionCompletionHandler)completionHandler
{
  return [(ASWebAuthenticationSession *)self initWithURL:URL callbackURLScheme:callbackURLScheme usingEphemeralSession:0 completionHandler:completionHandler];
}

- (ASWebAuthenticationSession)initWithURL:(id)a3 callback:(id)a4 completionHandler:(id)a5
{
  return [(ASWebAuthenticationSession *)self initWithURL:a3 callback:a4 usingEphemeralSession:0 jitEnabled:1 completionHandler:a5];
}

- (ASWebAuthenticationSession)initWithURL:(id)a3 callbackURLScheme:(id)a4 usingEphemeralSession:(BOOL)a5 completionHandler:(id)a6
{
  return [(ASWebAuthenticationSession *)self initWithURL:a3 callbackURLScheme:a4 usingEphemeralSession:a5 jitEnabled:1 completionHandler:a6];
}

- (ASWebAuthenticationSession)initWithURL:(id)a3 callbackURLScheme:(id)a4 usingEphemeralSession:(BOOL)a5 jitEnabled:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a3;
  v14 = +[ASWebAuthenticationSessionCallback callbackWithCustomScheme:a4];
  v15 = [(ASWebAuthenticationSession *)self initWithURL:v13 callback:v14 usingEphemeralSession:v8 jitEnabled:v7 completionHandler:v12];

  return v15;
}

- (ASWebAuthenticationSession)initWithURL:(id)a3 callback:(id)a4 usingEphemeralSession:(BOOL)a5 jitEnabled:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  v50[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v15 = [v13 customScheme];
  if (([v15 containsString:@":"] & 1) != 0
    || [v15 containsString:@"/"])
  {
    v16 = WBS_LOG_CHANNEL_PREFIXAuthenticationSession();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ASWebAuthenticationSession initWithURL:callback:usingEphemeralSession:jitEnabled:completionHandler:](v16);
    }
    if (dyld_program_sdk_at_least())
    {
      id v35 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"The provided scheme is not valid. A scheme should not include special characters such as \":\" or \"/\"." userInfo:0];
      objc_exception_throw(v35);
    }
  }
  v40.receiver = self;
  v40.super_class = (Class)ASWebAuthenticationSession;
  v17 = [(ASWebAuthenticationSession *)&v40 init];
  if (v17)
  {
    objc_initWeak(&location, v17);
    uint64_t v18 = MEMORY[0x21D484070](v14);
    id originalCompletionHandler = v17->_originalCompletionHandler;
    v17->_id originalCompletionHandler = (id)v18;

    [(ASWebAuthenticationSession *)v17 setPrefersEphemeralWebBrowserSession:v9];
    uint64_t v20 = +[ASAuthorizationSingleSignOnProvider authorizationProviderWithIdentityProviderURL:v12];
    ssoProvider = v17->_ssoProvider;
    v17->_ssoProvider = (ASAuthorizationSingleSignOnProvider *)v20;

    if ([(ASAuthorizationSingleSignOnProvider *)v17->_ssoProvider canPerformAuthorization]
      && objc_msgSend(v12, "safari_isEligibleforDirectSSO"))
    {
      v22 = WBS_LOG_CHANNEL_PREFIXAuthenticationSession();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21918F000, v22, OS_LOG_TYPE_DEFAULT, "Sending request direct to SSO extension.", buf, 2u);
      }
      v23 = [(ASAuthorizationSingleSignOnProvider *)v17->_ssoProvider createRequest];
      [v23 setRequestedOperation:@"direct_request"];
      v24 = [ASAuthorizationController alloc];
      v50[0] = v23;
      v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:1];
      uint64_t v26 = [(ASAuthorizationController *)v24 initWithAuthorizationRequests:v25];
      authorizationController = v17->_authorizationController;
      v17->_authorizationController = (ASAuthorizationController *)v26;

      [(ASAuthorizationController *)v17->_authorizationController setDelegate:v17];
      [(ASAuthorizationController *)v17->_authorizationController setPresentationContextProvider:v17];
      objc_storeStrong((id *)&v17->_callback, a4);
    }
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __102__ASWebAuthenticationSession_initWithURL_callback_usingEphemeralSession_jitEnabled_completionHandler___block_invoke;
    v36[3] = &unk_264396B98;
    objc_copyWeak(&v38, &location);
    id v37 = v14;
    v28 = (void *)MEMORY[0x21D484070](v36);
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2050000000;
    v29 = (void *)getSFAuthenticationSessionClass_softClass;
    uint64_t v49 = getSFAuthenticationSessionClass_softClass;
    if (!getSFAuthenticationSessionClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v42 = 3221225472;
      v43 = __getSFAuthenticationSessionClass_block_invoke;
      v44 = &unk_2643956C0;
      v45 = &v46;
      __getSFAuthenticationSessionClass_block_invoke((uint64_t)buf);
      v29 = (void *)v47[3];
    }
    v30 = v29;
    _Block_object_dispose(&v46, 8);
    uint64_t v31 = [[v30 alloc] initWithURL:v12 callback:v13 storageMode:v17->_storageMode jitEnabled:v8 completionHandler:v28];
    authenticationSession = v17->_authenticationSession;
    v17->_authenticationSession = (SFAuthenticationSession *)v31;

    v33 = v17;
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void, void))v14 + 2))(v14, 0, 0);
  }

  return v17;
}

void __102__ASWebAuthenticationSession_initWithURL_callback_usingEphemeralSession_jitEnabled_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _invalidate];

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v5;
  id v15 = v9;
  if (v9)
  {
    v10 = [v9 domain];
    int v11 = [v10 isEqualToString:@"com.apple.AuthenticationServices.WebAuthenticationSession"];

    if (v11)
    {
      id v12 = v15;
    }
    else
    {
      BOOL v14 = [v15 code] == 1;
      id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServices.WebAuthenticationSession" code:v14 userInfo:0];
    }
    id v13 = v12;
  }
  else
  {
    id v13 = 0;
  }

  (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v6, v13);
}

- (BOOL)canStart
{
  return [(ASWebAuthenticationSession *)self _startDryRun:1];
}

- (BOOL)start
{
  return [(ASWebAuthenticationSession *)self _startDryRun:0];
}

- (BOOL)_startDryRun:(BOOL)a3
{
  BOOL v3 = a3;
  v27[1] = *MEMORY[0x263EF8340];
  [(SFAuthenticationSession *)self->_authenticationSession setStorageMode:self->_storageMode];
  id v5 = (void *)[(NSDictionary *)self->_additionalHeaderFields copy];
  [(SFAuthenticationSession *)self->_authenticationSession setAdditionalHeaderFields:v5];

  if (self->_originalCompletionHandler)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationContextProvider);
    BOOL v7 = [WeakRetained presentationAnchorForWebAuthenticationSession:self];

    if (!dyld_program_sdk_at_least()
      || [(ASWebAuthenticationSession *)self _skipPresentationAnchorCheck])
    {
      goto LABEL_4;
    }
    if (v7)
    {
      v10 = [v7 windowScene];
      if (![v10 activationState])
      {

        goto LABEL_4;
      }
      char IsExtension = _UIApplicationIsExtension();

      if (IsExtension) {
        goto LABEL_4;
      }
      id v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = *MEMORY[0x263F07F80];
      uint64_t v24 = *MEMORY[0x263F07F80];
      v25 = @"The UIWindowScene for the returned window was not in the foreground active state.";
      BOOL v14 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      id v15 = v12;
      uint64_t v16 = 3;
    }
    else
    {
      v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = *MEMORY[0x263F07F80];
      uint64_t v26 = *MEMORY[0x263F07F80];
      v27[0] = @"Cannot start ASWebAuthenticationSession without providing presentation context. Set presentationContextProvider before calling -start.";
      BOOL v14 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
      id v15 = v17;
      uint64_t v16 = 2;
    }
    uint64_t v18 = [v15 errorWithDomain:@"com.apple.AuthenticationServices.WebAuthenticationSession" code:v16 userInfo:v14];

    if (!v18) {
      goto LABEL_4;
    }
    if (!v3)
    {
      v19 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v20 = [v19 bundleIdentifier];
      int v21 = [v20 hasPrefix:@"com.apple."];

      if (v21)
      {
        v22 = WBS_LOG_CHANNEL_PREFIXAuthenticationSession();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          [(ASWebAuthenticationSession *)v22 _startDryRun:v13];
        }

LABEL_4:
        if ([(ASWebAuthenticationSession *)self _validateAdditionalHeaderFieldsDryRun:v3])
        {
          int v8 = dyld_program_minos_at_least();
          if (!v3 && v8) {
            objc_storeStrong((id *)&self->_referenceToSelf, self);
          }
          if (self->_authorizationController
            && [(ASAuthorizationSingleSignOnProvider *)self->_ssoProvider canPerformAuthorization])
          {
            if (!v3) {
              [(ASAuthorizationController *)self->_authorizationController performRequests];
            }
            char v9 = 1;
            goto LABEL_32;
          }
          char v9 = [(SFAuthenticationSession *)self->_authenticationSession startASWebAuthenticationSessionInWindow:v7 dryRun:v3];
          if ((v9 & 1) != 0 || v3)
          {
LABEL_32:

            return v9;
          }
          [(ASWebAuthenticationSession *)self _invalidate];
        }
LABEL_31:
        char v9 = 0;
        goto LABEL_32;
      }
      [(ASWebAuthenticationSession *)self _cancelWithError:v18];
    }

    goto LABEL_31;
  }
  return 0;
}

- (void)cancel
{
  ssoProvider = self->_ssoProvider;
  self->_ssoProvider = 0;

  authorizationController = self->_authorizationController;
  self->_authorizationController = 0;

  [(ASWebAuthenticationSession *)self _invalidate];
  authenticationSession = self->_authenticationSession;

  [(SFAuthenticationSession *)authenticationSession cancel];
}

- (void)setPrefersEphemeralWebBrowserSession:(BOOL)prefersEphemeralWebBrowserSession
{
  BOOL v3 = prefersEphemeralWebBrowserSession;
  if (([(SFAuthenticationSession *)self->_authenticationSession isSessionStarted] & 1) == 0) {
    self->_storageMode = v3;
  }
}

- (BOOL)prefersEphemeralWebBrowserSession
{
  return self->_storageMode == 1;
}

- (NSArray)proxiedAssociatedDomains
{
  return (NSArray *)[(SFAuthenticationSession *)self->_authenticationSession proxiedAssociatedDomains];
}

- (void)setProxiedAssociatedDomains:(id)a3
{
  id v4 = a3;
  if (([(SFAuthenticationSession *)self->_authenticationSession isSessionStarted] & 1) == 0) {
    [(SFAuthenticationSession *)self->_authenticationSession setProxiedAssociatedDomains:v4];
  }
}

- (void)_invalidate
{
  self->_referenceToSelf = 0;
  MEMORY[0x270F9A758]();
}

- (void)_cancelWithError:(id)a3
{
  (*((void (**)(void))self->_originalCompletionHandler + 2))();
  id originalCompletionHandler = self->_originalCompletionHandler;
  self->_id originalCompletionHandler = 0;
}

- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4
{
  id v7 = a4;
  ssoProvider = self->_ssoProvider;
  self->_ssoProvider = 0;

  authorizationController = self->_authorizationController;
  self->_authorizationController = 0;

  if (objc_msgSend(v7, "safari_matchesErrorDomain:andCode:", @"com.apple.AuthenticationServices.AuthorizationError", 1003))
  {
    [(ASWebAuthenticationSession *)self performSelectorOnMainThread:sel__startDryRun_ withObject:MEMORY[0x263EFFA80] waitUntilDone:0];
  }
  else
  {
    (*((void (**)(void))self->_originalCompletionHandler + 2))();
    [(ASWebAuthenticationSession *)self _invalidate];
  }
}

- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4
{
  id v13 = a4;
  ssoProvider = self->_ssoProvider;
  self->_ssoProvider = 0;

  authorizationController = self->_authorizationController;
  self->_authorizationController = 0;

  id v7 = [v13 credential];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v9 = [v13 credential];
    v10 = [v9 authenticatedResponse];
    int v11 = [v10 URL];

    if ([(ASWebAuthenticationSessionCallback *)self->_callback matchesURL:v11])
    {
      (*((void (**)(void))self->_originalCompletionHandler + 2))();
    }
    else
    {
      id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:1002 userInfo:0];
      (*((void (**)(void))self->_originalCompletionHandler + 2))();
    }
  }
  else
  {
    char v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:1002 userInfo:0];
    (*((void (**)(void))self->_originalCompletionHandler + 2))();
  }

  [(ASWebAuthenticationSession *)self _invalidate];
}

- (id)presentationAnchorForAuthorizationController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationContextProvider);
  id v5 = [WeakRetained presentationAnchorForWebAuthenticationSession:self];

  return v5;
}

+ (void)handleSSOExtensionIdentifier:(id *)a3
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__ASWebAuthenticationSession_handleSSOExtensionIdentifier___block_invoke;
  v6[3] = &__block_descriptor_64_e20_v20__0B8__NSError_12l;
  long long v3 = *(_OWORD *)&a3->var0[4];
  long long v7 = *(_OWORD *)a3->var0;
  long long v8 = v3;
  long long v4 = *(_OWORD *)&a3->var0[4];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v4;
  [MEMORY[0x263F25240] isExtensionProcessWithAuditToken:v5 completion:v6];
}

void __59__ASWebAuthenticationSession_handleSSOExtensionIdentifier___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    *(_OWORD *)cfa = *(_OWORD *)(a1 + 32);
    long long v6 = *(_OWORD *)(a1 + 48);
    v2 = WBSApplicationIdentifierFromAuditToken();
    CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();
    objc_msgSend(MEMORY[0x263F25240], "setOriginatorBundleIdentifier:", v2, 0, cfa[1], v6);
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    long long v3 = (void *)MEMORY[0x263F25240];
    [v3 setOriginatorBundleIdentifier:0];
  }
}

+ (void)resetSSOExtensionIdentifier
{
}

- (id)presentationContextProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationContextProvider);

  return WeakRetained;
}

- (void)setPresentationContextProvider:(id)presentationContextProvider
{
}

- (NSDictionary)additionalHeaderFields
{
  return self->_additionalHeaderFields;
}

- (void)setAdditionalHeaderFields:(id)a3
{
}

- (BOOL)_skipPresentationAnchorCheck
{
  return self->__skipPresentationAnchorCheck;
}

- (void)_setSkipPresentationAnchorCheck:(BOOL)a3
{
  self->__skipPresentationAnchorCheck = a3;
}

- (BOOL)shouldFailOnMDMProfileErrorResponse
{
  return self->_shouldFailOnMDMProfileErrorResponse;
}

- (void)setShouldFailOnMDMProfileErrorResponse:(BOOL)a3
{
  self->_shouldFailOnMDMProfileErrorResponse = a3;
}

- (NSArray)customAnchorCertificates
{
  return self->_customAnchorCertificates;
}

- (void)setCustomAnchorCertificates:(id)a3
{
}

- (unint64_t)storageMode
{
  return self->_storageMode;
}

- (void)setStorageMode:(unint64_t)a3
{
  self->_storageMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customAnchorCertificates, 0);
  objc_storeStrong((id *)&self->_additionalHeaderFields, 0);
  objc_destroyWeak((id *)&self->_presentationContextProvider);
  objc_storeStrong((id *)&self->_referenceToSelf, 0);
  objc_storeStrong(&self->_originalCompletionHandler, 0);
  objc_storeStrong((id *)&self->_authenticationSession, 0);
  objc_storeStrong((id *)&self->_callback, 0);
  objc_storeStrong((id *)&self->_ssoProvider, 0);

  objc_storeStrong((id *)&self->_authorizationController, 0);
}

- (BOOL)_validateAdditionalHeaderFieldsDryRun:(BOOL)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = [(ASWebAuthenticationSession *)self additionalHeaderFields];
  BOOL v6 = [(ASWebAuthenticationSession *)self _areAdditionalHeaderFieldsValid:v5];

  if (!v6)
  {
    long long v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F08338];
    v13[0] = @"One or more provided headers are invalid.";
    long long v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    char v9 = [v7 errorWithDomain:@"com.apple.AuthenticationServices.WebAuthenticationSession" code:1 userInfo:v8];

    v10 = WBS_LOG_CHANNEL_PREFIXAuthenticationSession();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[ASWebAuthenticationSession(Shared) _validateAdditionalHeaderFieldsDryRun:]((uint64_t)v9, v10);
      if (a3) {
        goto LABEL_5;
      }
    }
    else if (a3)
    {
LABEL_5:

      return v6;
    }
    [(ASWebAuthenticationSession *)self _cancelWithError:v9];
    goto LABEL_5;
  }
  return v6;
}

- (BOOL)_areAdditionalHeaderFieldsValid:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __70__ASWebAuthenticationSession_Shared___areAdditionalHeaderFieldsValid___block_invoke;
    v7[3] = &unk_264396BF8;
    v7[4] = self;
    int v5 = objc_msgSend(v4, "safari_containsEntryPassingTest:", v7) ^ 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

uint64_t __70__ASWebAuthenticationSession_Shared___areAdditionalHeaderFieldsValid___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _isForbiddenHeaderFieldName:a2 value:a3];
}

- (BOOL)_isForbiddenHeaderFieldName:(id)a3 value:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [&unk_26CAA54A8 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v20 != v7) {
        objc_enumerationMutation(&unk_26CAA54A8);
      }
      if (objc_msgSend(v4, "safari_isCaseInsensitiveEqualToString:", *(void *)(*((void *)&v19 + 1) + 8 * v8))) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [&unk_26CAA54A8 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = [&unk_26CAA54C0 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (!v9)
    {
      BOOL v13 = 0;
      goto LABEL_19;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
LABEL_11:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(&unk_26CAA54C0);
      }
      if (objc_msgSend(v4, "safari_hasCaseInsensitivePrefix:", *(void *)(*((void *)&v15 + 1) + 8 * v12))) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [&unk_26CAA54C0 countByEnumeratingWithState:&v15 objects:v23 count:16];
        BOOL v13 = 0;
        if (v10) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
  }
  BOOL v13 = 1;
LABEL_19:

  return v13;
}

- (void)initWithURL:(os_log_t)log callback:usingEphemeralSession:jitEnabled:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "The provided scheme is not valid. A scheme should not include special characters such as \":\" or \"/\".", v1, 2u);
}

- (void)_startDryRun:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint64_t v6 = [a2 userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:a3];
  int v8 = 138543362;
  uint64_t v9 = v7;
  _os_log_error_impl(&dword_21918F000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Please adopt the new API as soon as possible (rdar://50384281).", (uint8_t *)&v8, 0xCu);
}

@end