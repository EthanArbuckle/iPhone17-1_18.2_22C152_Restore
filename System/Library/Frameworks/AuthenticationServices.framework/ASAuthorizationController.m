@interface ASAuthorizationController
+ (ASAuthorizationController)new;
- (ASAuthorizationController)init;
- (ASAuthorizationController)initWithAuthorizationRequests:(NSArray *)authorizationRequests;
- (BOOL)_onlyHasAppleIDRequest:(id)a3;
- (BOOL)_shouldConvertExtensionAndWebKitErrors;
- (BOOL)useAlternativeSecurityKeysIcon;
- (NSArray)authorizationRequests;
- (NSArray)customAuthorizationMethods;
- (NSArray)proxiedAssociatedDomains;
- (NSData)proxiedIconData;
- (NSNumber)proxiedIconScale;
- (NSString)proxiedAppIdentifier;
- (NSString)proxiedAppName;
- (NSString)proxiedBundleIdentifier;
- (NSString)proxiedOriginDeviceName;
- (NSString)proxiedTeamIdentifier;
- (NSString)proxySheetHeaderOverride;
- (NSString)proxySheetNoCredentialsErrorMessageOverride;
- (NSString)proxySheetNoCredentialsErrorTitleOverride;
- (NSString)proxySheetSubtitleOverride;
- (NSString)proxySheetTitleOverride;
- (id)_authKitRequestFromAppleIDRequest:(id)a3;
- (id)_authKitRequests;
- (id)_authenticatedResponseFromHTTPResponse:(id)a3 httpBody:(id)a4;
- (id)_authenticationServicesAgentProxy;
- (id)_authorizationFromAuthKitResult:(id)a3;
- (id)_authorizationRequestsHandledByAuthenticationServicesDaemon:(id)a3;
- (id)_convertCoreErrorToPublicError:(id)a3;
- (id)_convertCredentialProviderErrorToPublicError:(id)a3;
- (id)_convertWebKitErrorToPublicError:(id)a3;
- (id)_publicErrorFromAuthKitError:(id)a3;
- (id)_requestContextWithRequests:(id)a3 error:(id *)a4;
- (id)delegate;
- (id)presentationContextProvider;
- (void)_completeWithAuthorization:(id)a3;
- (void)_failWithError:(id)a3;
- (void)_finishAppSSO;
- (void)_performAuthKitRequests:(id)a3 options:(unint64_t)a4;
- (void)_performAuthorizationRequests:(id)a3 requestStyle:(int64_t)a4 requestOptions:(unint64_t)a5;
- (void)_performRequestsWithStyle:(int64_t)a3 options:(unint64_t)a4;
- (void)_shouldConvertExtensionAndWebKitErrors;
- (void)authorization:(id)a3 didCompleteWithAuthorizationResult:(id)a4;
- (void)authorization:(id)a3 didCompleteWithError:(id)a4;
- (void)authorization:(id)a3 didCompleteWithHTTPAuthorizationHeaders:(id)a4;
- (void)authorization:(id)a3 didCompleteWithHTTPResponse:(id)a4 httpBody:(id)a5;
- (void)authorization:(id)a3 presentViewController:(id)a4 withCompletion:(id)a5;
- (void)authorizationDidCancel:(id)a3;
- (void)authorizationDidComplete:(id)a3;
- (void)authorizationDidNotHandle:(id)a3;
- (void)cancel;
- (void)deleteAllPasskeysForRelyingParty:(id)a3 completionHandler:(id)a4;
- (void)deletePasskeyForRelyingParty:(id)a3 withCredentialID:(id)a4 completionHandler:(id)a5;
- (void)getPasskeysDataForRelyingParty:(id)a3 withCompletionHandler:(id)a4;
- (void)performAutoFillAssistedRequests;
- (void)performRequests;
- (void)performRequestsWithOptions:(ASAuthorizationControllerRequestOptions)options;
- (void)performSilentRequests;
- (void)preflightCanCreateICloudKeychainPasskeyWithCompletionHandler:(id)a3;
- (void)renamePasskeyWithCredentialID:(id)a3 newName:(id)a4 completionHandler:(id)a5;
- (void)setCustomAuthorizationMethods:(NSArray *)customAuthorizationMethods;
- (void)setDelegate:(id)delegate;
- (void)setPresentationContextProvider:(id)presentationContextProvider;
- (void)setProxiedAppIdentifier:(id)a3;
- (void)setProxiedAppName:(id)a3;
- (void)setProxiedAssociatedDomains:(id)a3;
- (void)setProxiedBundleIdentifier:(id)a3;
- (void)setProxiedIconData:(id)a3;
- (void)setProxiedIconScale:(id)a3;
- (void)setProxiedOriginDeviceName:(id)a3;
- (void)setProxiedTeamIdentifier:(id)a3;
- (void)setProxySheetHeaderOverride:(id)a3;
- (void)setProxySheetNoCredentialsErrorMessageOverride:(id)a3;
- (void)setProxySheetNoCredentialsErrorTitleOverride:(id)a3;
- (void)setProxySheetSubtitleOverride:(id)a3;
- (void)setProxySheetTitleOverride:(id)a3;
- (void)setUseAlternativeSecurityKeysIcon:(BOOL)a3;
@end

@implementation ASAuthorizationController

+ (ASAuthorizationController)new
{
  return 0;
}

- (ASAuthorizationController)init
{
  return 0;
}

- (ASAuthorizationController)initWithAuthorizationRequests:(NSArray *)authorizationRequests
{
  v6 = authorizationRequests;
  if (![(NSArray *)v6 count])
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"ASAuthorizationController.m", 285, @"Invalid parameter not satisfying: %@", @"authorizationRequests.count" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)ASAuthorizationController;
  v7 = [(ASAuthorizationController *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_authorizationRequests, authorizationRequests);
  }

  return v8;
}

- (void)performRequests
{
}

- (void)_performRequestsWithStyle:(int64_t)a3 options:(unint64_t)a4
{
  v68[1] = *MEMORY[0x263EF8340];
  authorizationRequests = self->_authorizationRequests;
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __63__ASAuthorizationController__performRequestsWithStyle_options___block_invoke;
  v65[3] = &__block_descriptor_40_e32_B16__0__ASAuthorizationRequest_8l;
  v65[4] = a3;
  v49 = [(NSArray *)authorizationRequests safari_filterObjectsUsingBlock:v65];
  if ([v49 count])
  {
    if (a3 == 2)
    {
      v14 = NSString;
      v9 = [v49 firstObject];
      v15 = (objc_class *)objc_opt_class();
      objc_super v11 = NSStringFromClass(v15);
      uint64_t v12 = [v14 stringWithFormat:@"\"%@\" does not support conditional requests.", v11];
    }
    else
    {
      if (a3 != 1)
      {
        v13 = @"Unexpected failure.";
        goto LABEL_10;
      }
      v8 = NSString;
      v9 = [v49 firstObject];
      v10 = (objc_class *)objc_opt_class();
      objc_super v11 = NSStringFromClass(v10);
      uint64_t v12 = [v8 stringWithFormat:@"\"%@\" does not support AutoFill assistance.", v11];
    }
    v13 = (__CFString *)v12;

LABEL_10:
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v67 = *MEMORY[0x263F08338];
    v68[0] = v13;
    v17 = [NSDictionary dictionaryWithObjects:v68 forKeys:&v67 count:1];
    v18 = [v16 errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:1004 userInfo:v17];

    [(ASAuthorizationController *)self _failWithError:v18];
    goto LABEL_11;
  }
  if ([(ASAuthorizationController *)self _shouldPerformRequestsWithAuthKit:self->_authorizationRequests])
  {
    v13 = [(ASAuthorizationController *)self _authKitRequests];
    [(ASAuthorizationController *)self _performAuthKitRequests:v13 options:a4];
  }
  else
  {
    v13 = [(ASAuthorizationController *)self _authorizationRequestsHandledByAuthenticationServicesDaemon:self->_authorizationRequests];
    if ([(__CFString *)v13 count])
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __63__ASAuthorizationController__performRequestsWithStyle_options___block_invoke_2;
      block[3] = &unk_264396368;
      block[4] = self;
      v13 = v13;
      v62 = v13;
      int64_t v63 = a3;
      unint64_t v64 = a4;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      uint64_t v55 = 0;
      v56 = &v55;
      uint64_t v57 = 0x3032000000;
      v58 = __Block_byref_object_copy__1;
      v59 = __Block_byref_object_dispose__1;
      id v60 = 0;
      v19 = self->_authorizationRequests;
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __63__ASAuthorizationController__performRequestsWithStyle_options___block_invoke_42;
      v54[3] = &unk_264396390;
      v54[4] = &v55;
      [(NSArray *)v19 enumerateObjectsUsingBlock:v54];
      v20 = (void *)v56[5];
      if (v20)
      {
        v21 = [v20 provider];
        v22 = [v21 url];
        appSSORequestURL = self->_appSSORequestURL;
        self->_appSSORequestURL = v22;

        v24 = [MEMORY[0x263EFF9A0] dictionary];
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        v25 = [(id)v56[5] authorizationOptions];
        uint64_t v26 = [v25 countByEnumeratingWithState:&v50 objects:v66 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v51;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v51 != v27) {
                objc_enumerationMutation(v25);
              }
              v29 = *(void **)(*((void *)&v50 + 1) + 8 * i);
              v30 = [v29 value];
              v31 = [v29 name];
              if (v30) {
                v32 = v30;
              }
              else {
                v32 = &stru_26CA92B70;
              }
              [v24 setObject:v32 forKeyedSubscript:v31];
            }
            uint64_t v26 = [v25 countByEnumeratingWithState:&v50 objects:v66 count:16];
          }
          while (v26);
        }

        v33 = [(id)v56[5] state];

        if (v33)
        {
          v34 = [(id)v56[5] state];
          [v24 setObject:v34 forKeyedSubscript:@"state"];
        }
        v35 = [(id)v56[5] nonce];

        if (v35)
        {
          v36 = [(id)v56[5] nonce];
          [v24 setObject:v36 forKeyedSubscript:@"nonce"];
        }
        v37 = [(id)v56[5] requestedScopes];

        if (v37)
        {
          v38 = [(id)v56[5] requestedScopes];
          v39 = [v38 componentsJoinedByString:@" "];
          [v24 setObject:v39 forKeyedSubscript:@"scope"];
        }
        id v40 = objc_alloc_init(MEMORY[0x263F25248]);
        v41 = [(id)v56[5] requestedOperation];
        [v40 setOperation:v41];

        [v40 setUrl:self->_appSSORequestURL];
        v42 = (void *)[v24 copy];
        [v40 setHttpHeaders:v42];

        id v43 = objc_alloc_init(MEMORY[0x263EFF8F8]);
        [v40 setHttpBody:v43];

        [v40 setUseInternalExtensions:0];
        v44 = (SOAuthorization *)objc_alloc_init(MEMORY[0x263F25240]);
        appSSOAuthorization = self->_appSSOAuthorization;
        self->_appSSOAuthorization = v44;

        v46 = (void *)[v24 copy];
        [self->_appSSOAuthorization setAuthorizationOptions:v46];

        -[SOAuthorization setEnableUserInteraction:](self->_appSSOAuthorization, "setEnableUserInteraction:", [(id)v56[5] isUserInterfaceEnabled]);
        [self->_appSSOAuthorization setDelegate:self];
        v47 = [(ASAuthorizationController *)self presentationContextProvider];
        v48 = [v47 presentationAnchorForAuthorizationController:self];
        [self->_appSSOAuthorization setEnableEmbeddedAuthorizationViewController:v48 != 0];

        [self->_appSSOAuthorization beginAuthorizationWithParameters:v40];
        _Block_object_dispose(&v55, 8);
      }
      else
      {
        _Block_object_dispose(&v55, 8);
      }
    }
  }
LABEL_11:
}

uint64_t __63__ASAuthorizationController__performRequestsWithStyle_options___block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsStyle:*(void *)(a1 + 32)] ^ 1;
}

uint64_t __63__ASAuthorizationController__performRequestsWithStyle_options___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performAuthorizationRequests:*(void *)(a1 + 40) requestStyle:*(void *)(a1 + 48) requestOptions:*(void *)(a1 + 56)];
}

void __63__ASAuthorizationController__performRequestsWithStyle_options___block_invoke_42(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_performAuthKitRequests:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  v6 = (objc_class *)MEMORY[0x263F291B8];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setCredentialRequests:v7];

  [v8 setRequestOptions:v4 & 1];
  id v9 = objc_alloc_init(MEMORY[0x263F29138]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__ASAuthorizationController__performAuthKitRequests_options___block_invoke;
  v10[3] = &unk_2643963B8;
  v10[4] = self;
  [v9 performAuthorizationWithContext:v8 completion:v10];
}

void __61__ASAuthorizationController__performAuthKitRequests_options___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    id v4 = [v3 _authorizationFromAuthKitResult:a2];
    objc_msgSend(*(id *)(a1 + 32), "_completeWithAuthorization:");
  }
  else
  {
    objc_msgSend(v3, "_publicErrorFromAuthKitError:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_failWithError:");
  }
}

- (id)_publicErrorFromAuthKitError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F28F30]];

  if (v5)
  {
    uint64_t v6 = [v3 code];
    if (v6 == -7089 || v6 == -7003) {
      uint64_t v8 = 1001;
    }
    else {
      uint64_t v8 = 1000;
    }
  }
  else
  {
    uint64_t v8 = 1000;
  }
  id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:v8 userInfo:0];

  return v9;
}

- (void)performAutoFillAssistedRequests
{
  id v3 = (OS_os_activity *)_os_activity_create(&dword_21918F000, "AutoFill authorization request", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DETACHED);
  authorizationActivity = self->_authorizationActivity;
  self->_authorizationActivity = v3;

  int v5 = self->_authorizationActivity;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__ASAuthorizationController_performAutoFillAssistedRequests__block_invoke;
  block[3] = &unk_264395388;
  block[4] = self;
  os_activity_apply(v5, block);
}

uint64_t __60__ASAuthorizationController_performAutoFillAssistedRequests__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performRequestsWithStyle:1 options:0];
}

- (void)performSilentRequests
{
}

- (void)getPasskeysDataForRelyingParty:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ASAuthorizationController *)self _authenticationServicesAgentProxy];
  [v8 getPasskeysDataForRelyingParty:v7 withCompletionHandler:v6];
}

- (void)deletePasskeyForRelyingParty:(id)a3 withCredentialID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ASAuthorizationController *)self _authenticationServicesAgentProxy];
  [v11 deletePasskeyForRelyingParty:v10 withCredentialID:v9 completionHandler:v8];
}

- (void)deleteAllPasskeysForRelyingParty:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ASAuthorizationController *)self _authenticationServicesAgentProxy];
  [v8 deleteAllPasskeysForRelyingParty:v7 completionHandler:v6];
}

- (void)preflightCanCreateICloudKeychainPasskeyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ASAuthorizationController *)self _authenticationServicesAgentProxy];
  [v5 preflightCanCreateICloudKeychainPasskeyWithCompletionHandler:v4];
}

- (void)renamePasskeyWithCredentialID:(id)a3 newName:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ASAuthorizationController *)self _authenticationServicesAgentProxy];
  [v11 renamePasskeyWithCredentialID:v10 newName:v9 completionHandler:v8];
}

- (void)cancel
{
  id v2 = [(ASAuthorizationController *)self _authenticationServicesAgentProxy];
  [v2 cancelCurrentRequest];
}

- (id)_authKitRequests
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  authorizationRequests = self->_authorizationRequests;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __45__ASAuthorizationController__authKitRequests__block_invoke;
  id v11 = &unk_2643963E0;
  uint64_t v12 = self;
  id v13 = v3;
  id v5 = v3;
  [(NSArray *)authorizationRequests enumerateObjectsUsingBlock:&v8];
  id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return v6;
}

void __45__ASAuthorizationController__authKitRequests__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [*(id *)(a1 + 32) _authKitRequestFromAppleIDRequest:v5];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    id v3 = objc_alloc_init(MEMORY[0x263F29228]);
  }
  id v4 = v3;
  [*(id *)(a1 + 40) addObject:v3];

LABEL_6:
}

- (id)_authKitRequestFromAppleIDRequest:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F29160];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 user];
  [v5 setUserIdentifier:v6];

  id v7 = [v4 state];
  [v5 setState:v7];

  uint64_t v8 = [v4 nonce];
  [v5 setNonce:v8];

  uint64_t v9 = [MEMORY[0x263EFF980] array];
  id v10 = [v4 requestedScopes];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__ASAuthorizationController__authKitRequestFromAppleIDRequest___block_invoke;
  v13[3] = &unk_264396408;
  id v14 = v9;
  id v11 = v9;
  [v10 enumerateObjectsUsingBlock:v13];

  [v5 setRequestedScopes:v11];

  return v5;
}

void __63__ASAuthorizationController__authKitRequestFromAppleIDRequest___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isEqualToString:@"full_name"])
  {
    id v3 = (void *)MEMORY[0x263F29020];
  }
  else
  {
    if (![v4 isEqualToString:@"email"]) {
      goto LABEL_6;
    }
    id v3 = (void *)MEMORY[0x263F29018];
  }
  [*(id *)(a1 + 32) addObject:*v3];
LABEL_6:
}

- (id)_authorizationFromAuthKitResult:(id)a3
{
  id v3 = a3;
  id v4 = [v3 credential];
  id v5 = [v3 credential];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v4 authenticationServicesCredential];
    uint64_t v8 = off_264394998;
LABEL_5:
    id v14 = objc_alloc_init(*v8);
    goto LABEL_7;
  }
  uint64_t v9 = [v3 credential];
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();

  if (v10)
  {
    id v11 = [ASPasswordCredential alloc];
    uint64_t v12 = [v4 userIdentifier];
    id v13 = [v4 password];
    id v7 = [(ASPasswordCredential *)v11 initWithUser:v12 password:v13];

    uint64_t v8 = off_2643949B0;
    goto LABEL_5;
  }
  id v7 = 0;
  id v14 = 0;
LABEL_7:
  v15 = [[ASAuthorization alloc] initWithProvider:v14 credential:v7];

  return v15;
}

- (void)_finishAppSSO
{
  appSSOAuthorization = self->_appSSOAuthorization;
  self->_appSSOAuthorization = 0;

  appSSORequestURL = self->_appSSORequestURL;
  self->_appSSORequestURL = 0;

  appSSOViewController = self->_appSSOViewController;
  if (appSSOViewController)
  {
    [(UIViewController *)appSSOViewController dismissViewControllerAnimated:1 completion:0];
    id v6 = self->_appSSOViewController;
    self->_appSSOViewController = 0;

    appSSOPresentationAnchor = self->_appSSOPresentationAnchor;
    self->_appSSOPresentationAnchor = 0;
  }
}

- (id)_authenticatedResponseFromHTTPResponse:(id)a3 httpBody:(id)a4
{
  id v5 = a3;
  id v6 = [MEMORY[0x263F08900] JSONObjectWithData:a4 options:0 error:0];
  objc_opt_class();
  id v7 = v5;
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    if ([v6 count])
    {
      uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v9 = [v5 allHeaderFields];
      uint64_t v10 = [v9 count];

      if (v10)
      {
        id v11 = [v5 allHeaderFields];
        [v8 addEntriesFromDictionary:v11];
      }
      [v8 addEntriesFromDictionary:v6];
      id v12 = objc_alloc(MEMORY[0x263F088A0]);
      id v13 = [v5 URL];
      id v7 = objc_msgSend(v12, "initWithURL:statusCode:HTTPVersion:headerFields:", v13, objc_msgSend(v5, "statusCode"), @"HTTP/1.1", v8);
    }
  }

  return v7;
}

- (void)performRequestsWithOptions:(ASAuthorizationControllerRequestOptions)options
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = (OS_os_activity *)_os_activity_create(&dword_21918F000, "Modal authorization request with options", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DETACHED);
  authorizationActivity = self->_authorizationActivity;
  self->_authorizationActivity = v5;

  id v7 = [(NSArray *)self->_authorizationRequests safari_firstObjectPassingTest:&__block_literal_global_14];
  uint64_t v8 = v7;
  if (v7 && [v7 requestStyle] == 1)
  {
    v14[0] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    authorizationRequests = self->_authorizationRequests;
    self->_authorizationRequests = v9;

    uint64_t v11 = 2;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = self->_authorizationActivity;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__ASAuthorizationController_performRequestsWithOptions___block_invoke_2;
  block[3] = &unk_264396450;
  block[4] = self;
  void block[5] = v11;
  block[6] = options;
  os_activity_apply(v12, block);
}

uint64_t __56__ASAuthorizationController_performRequestsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __56__ASAuthorizationController_performRequestsWithOptions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performRequestsWithStyle:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
}

- (void)authorizationDidNotHandle:(id)a3
{
  if ((dyld_program_sdk_at_least() & 1) != 0
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        WeakRetained,
        (isKindOfClass & 1) != 0))
  {
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:1003 userInfo:0];
    [(ASAuthorizationController *)self _failWithError:v6];
  }
  else
  {
    id v6 = +[ASAuthorizationSingleSignOnCredential emptyCredential];
    id v7 = +[ASAuthorizationSingleSignOnProvider authorizationProviderWithIdentityProviderURL:self->_appSSORequestURL];
    uint64_t v8 = [[ASAuthorization alloc] initWithProvider:v7 credential:v6];
    [(ASAuthorizationController *)self _completeWithAuthorization:v8];
  }

  [(ASAuthorizationController *)self _finishAppSSO];
}

- (void)authorizationDidCancel:(id)a3
{
  id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:1001 userInfo:0];
  [(ASAuthorizationController *)self _failWithError:v4];
  [(ASAuthorizationController *)self _finishAppSSO];
}

- (void)authorizationDidComplete:(id)a3
{
  id v6 = +[ASAuthorizationSingleSignOnCredential emptyCredential];
  id v4 = +[ASAuthorizationSingleSignOnProvider authorizationProviderWithIdentityProviderURL:self->_appSSORequestURL];
  id v5 = [[ASAuthorization alloc] initWithProvider:v4 credential:v6];
  [(ASAuthorizationController *)self _completeWithAuthorization:v5];
  [(ASAuthorizationController *)self _finishAppSSO];
}

- (void)authorization:(id)a3 didCompleteWithHTTPAuthorizationHeaders:(id)a4
{
  id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:1002 userInfo:0];
  [(ASAuthorizationController *)self _failWithError:v5];
  [(ASAuthorizationController *)self _finishAppSSO];
}

- (void)authorization:(id)a3 didCompleteWithHTTPResponse:(id)a4 httpBody:(id)a5
{
  id v9 = [(ASAuthorizationController *)self _authenticatedResponseFromHTTPResponse:a4 httpBody:a5];
  if (v9)
  {
    id v6 = [[ASAuthorizationSingleSignOnCredential alloc] initWithAuthenticatedResponse:v9];
    id v7 = +[ASAuthorizationSingleSignOnProvider authorizationProviderWithIdentityProviderURL:self->_appSSORequestURL];
    uint64_t v8 = [[ASAuthorization alloc] initWithProvider:v7 credential:v6];
    [(ASAuthorizationController *)self _completeWithAuthorization:v8];
  }
  else
  {
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:1002 userInfo:0];
    [(ASAuthorizationController *)self _failWithError:v6];
  }

  [(ASAuthorizationController *)self _finishAppSSO];
}

- (void)authorization:(id)a3 didCompleteWithAuthorizationResult:(id)a4
{
  id v14 = a4;
  id v5 = [v14 httpAuthorizationHeaders];

  if (v5) {
    goto LABEL_2;
  }
  id v6 = [v14 httpResponse];

  if (!v6) {
    goto LABEL_5;
  }
  id v7 = [v14 httpResponse];
  uint64_t v8 = [v14 httpBody];
  id v6 = [(ASAuthorizationController *)self _authenticatedResponseFromHTTPResponse:v7 httpBody:v8];

  if (!v6)
  {
LABEL_2:
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:1002 userInfo:0];
    [(ASAuthorizationController *)self _failWithError:v6];
    [(ASAuthorizationController *)self _finishAppSSO];
  }
  else
  {
LABEL_5:
    id v9 = [ASAuthorizationSingleSignOnCredential alloc];
    uint64_t v10 = [v14 privateKeys];
    uint64_t v11 = [(ASAuthorizationSingleSignOnCredential *)v9 initWithAuthenticatedResponse:v6 privateKeys:v10];

    id v12 = +[ASAuthorizationSingleSignOnProvider authorizationProviderWithIdentityProviderURL:self->_appSSORequestURL];
    id v13 = [[ASAuthorization alloc] initWithProvider:v12 credential:v11];
    [(ASAuthorizationController *)self _completeWithAuthorization:v13];
    [(ASAuthorizationController *)self _finishAppSSO];
  }
}

- (void)authorization:(id)a3 didCompleteWithError:(id)a4
{
  id v10 = a4;
  id v5 = [v10 domain];
  char v6 = [v5 isEqualToString:@"com.apple.AuthenticationServices.AuthorizationError"];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    if (objc_msgSend(v10, "safari_matchesErrorDomain:andCode:", *MEMORY[0x263F25270], -12)) {
      uint64_t v8 = 1005;
    }
    else {
      uint64_t v8 = 1000;
    }
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:v8 userInfo:0];

    id v7 = (id)v9;
  }
  id v11 = v7;
  [(ASAuthorizationController *)self _failWithError:v7];
  [(ASAuthorizationController *)self _finishAppSSO];
}

- (void)authorization:(id)a3 presentViewController:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __80__ASAuthorizationController_authorization_presentViewController_withCompletion___block_invoke;
  v37[3] = &unk_264396478;
  id v11 = v10;
  id v38 = v11;
  id v12 = (void (**)(void, void, void))MEMORY[0x21D484070](v37);
  id v13 = [(ASAuthorizationController *)self presentationContextProvider];
  id v14 = [v13 presentationAnchorForAuthorizationController:self];
  appSSOPresentationAnchor = self->_appSSOPresentationAnchor;
  self->_appSSOPresentationAnchor = v14;

  if (self->_appSSOPresentationAnchor)
  {
    p_appSSOViewController = &self->_appSSOViewController;
    objc_storeStrong((id *)&self->_appSSOViewController, a4);
    v17 = [MEMORY[0x263F82E10] _viewControllerForFullScreenPresentationFromView:self->_appSSOPresentationAnchor];
    if (v17)
    {
      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__1;
      v35 = __Block_byref_object_dispose__1;
      id v36 = 0;
      v18 = (void *)MEMORY[0x263EFFA20];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __80__ASAuthorizationController_authorization_presentViewController_withCompletion___block_invoke_2;
      v28[3] = &unk_2643964A0;
      v30 = &v31;
      v19 = v12;
      id v29 = v19;
      uint64_t v20 = [v18 timerWithTimeInterval:0 repeats:v28 block:3.0];
      v21 = (void *)v32[5];
      v32[5] = v20;

      v22 = [MEMORY[0x263EFF9F0] mainRunLoop];
      [v22 addTimer:v32[5] forMode:*MEMORY[0x263EFF588]];

      v23 = *p_appSSOViewController;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __80__ASAuthorizationController_authorization_presentViewController_withCompletion___block_invoke_94;
      v25[3] = &unk_2643964C8;
      uint64_t v27 = &v31;
      uint64_t v26 = v19;
      [v17 presentViewController:v23 animated:1 completion:v25];

      _Block_object_dispose(&v31, 8);
    }
    else
    {
      id v24 = objc_alloc_init(MEMORY[0x263F82F58]);
      [v24 _presentViewController:*p_appSSOViewController sendingView:0 animated:1];
      v12[2](v12, 1, 0);
    }
  }
  else
  {
    v17 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:1004 userInfo:0];
    ((void (**)(void, void, void *))v12)[2](v12, 0, v17);
  }
}

uint64_t __80__ASAuthorizationController_authorization_presentViewController_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __80__ASAuthorizationController_authorization_presentViewController_withCompletion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __80__ASAuthorizationController_authorization_presentViewController_withCompletion___block_invoke_2_cold_1(v2);
    }
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    uint64_t v5 = *(void *)(a1 + 32);
    char v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:1004 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
  }
}

void *__80__ASAuthorizationController_authorization_presentViewController_withCompletion___block_invoke_94(uint64_t a1)
{
  uint64_t result = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    [result invalidate];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return (void *)v5();
  }
  return result;
}

- (BOOL)_onlyHasAppleIDRequest:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)_authorizationRequestsHandledByAuthenticationServicesDaemon:(id)a3
{
  return (id)objc_msgSend(a3, "safari_filterObjectsUsingBlock:", &__block_literal_global_97);
}

uint64_t __89__ASAuthorizationController__authorizationRequestsHandledByAuthenticationServicesDaemon___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void)_performAuthorizationRequests:(id)a3 requestStyle:(int64_t)a4 requestOptions:(unint64_t)a5
{
  char v5 = a5;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __87__ASAuthorizationController__performAuthorizationRequests_requestStyle_requestOptions___block_invoke;
  v20[3] = &unk_2643964F0;
  v20[4] = self;
  id v8 = a3;
  id v9 = (void (**)(void, void, void))MEMORY[0x21D484070](v20);
  id v19 = 0;
  id v10 = [(ASAuthorizationController *)self _requestContextWithRequests:v8 error:&v19];

  id v11 = v19;
  if (v10)
  {
    id v12 = [v10 authenticatedContext];

    if (v12) {
      a4 = 2;
    }
    [v10 setRequestStyle:a4];
    [v10 setRequestOptions:v5 & 1];
    id v13 = [(ASAuthorizationController *)self presentationContextProvider];
    id v14 = [v13 presentationAnchorForAuthorizationController:self];

    v15 = [v14 windowScene];
    v16 = [v15 _sceneIdentifier];
    [v10 setWindowSceneIdentifier:v16];

    if ((unint64_t)a4 >= 2)
    {
      if (a4 != 2)
      {
LABEL_12:

        goto LABEL_13;
      }
      v17 = [(ASAuthorizationController *)self _authenticationServicesAgentProxy];
      [v17 performSilentAuthorizationRequestsForContext:v10 withCompletionHandler:v9];
    }
    else
    {
      v17 = [(ASAuthorizationController *)self _authenticationServicesAgentProxy];
      [v17 performAuthorizationRequestsForContext:v10 withCompletionHandler:v9];
    }

    goto LABEL_12;
  }
  v18 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[ASAuthorizationController _performAuthorizationRequests:requestStyle:requestOptions:](v18);
  }
  ((void (**)(void, void, id))v9)[2](v9, 0, v11);
LABEL_13:
}

void __87__ASAuthorizationController__performAuthorizationRequests_requestStyle_requestOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v4 = +[ASAuthorization authorizationFromCredential:a2];
    [v2 _completeWithAuthorization:v4];
  }
  else
  {
    id v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "_failWithError:");
  }
}

- (id)_authenticationServicesAgentProxy
{
  authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
  if (!authenticationServicesAgentProxy)
  {
    id v4 = (ASCAgentProxy *)objc_alloc_init(MEMORY[0x263F293B0]);
    char v5 = self->_authenticationServicesAgentProxy;
    self->_authenticationServicesAgentProxy = v4;

    authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
  }

  return authenticationServicesAgentProxy;
}

- (id)_requestContextWithRequests:(id)a3 error:(id *)a4
{
  v91[1] = *MEMORY[0x263EF8340];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v67 objects:v85 count:16];
  id v61 = v4;
  if (!v5)
  {
    v62 = 0;
    unint64_t v63 = 0;
    unint64_t v7 = 0;
    uint64_t v64 = 0;
    uint64_t v66 = 0;
    id v8 = 0;
    id v9 = 0;
    uint64_t v10 = 0;
LABEL_45:

    v35 = [(id)v66 relyingPartyIdentifier];
    uint64_t v36 = [(id)v63 relyingPartyIdentifier];
    id v14 = (void *)v36;
    if (v35 && v36 && ([v35 isEqualToString:v36] & 1) == 0)
    {
      v37 = (void *)MEMORY[0x263F087E8];
      uint64_t v75 = *MEMORY[0x263F08320];
      v76 = @"All Public Key Credential requests must use the same relyingPartyIdentifier.";
      id v38 = NSDictionary;
      v39 = &v76;
      id v40 = &v75;
      goto LABEL_58;
    }
    if (v66 | v64 | v63 | v7 && !v8)
    {
      v37 = (void *)MEMORY[0x263F087E8];
      uint64_t v73 = *MEMORY[0x263F08320];
      v74 = @"All Public Key Credential requests must specify a relyingPartyIdentifier.";
      id v38 = NSDictionary;
      v39 = &v74;
      id v40 = &v73;
LABEL_58:
      objc_msgSend(v38, "dictionaryWithObjects:forKeys:count:", v39, v40, 1, v57);
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      [v37 errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:1004 userInfo:v41];
      v44 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    }
    id v41 = (id)[objc_alloc(MEMORY[0x263F293D0]) initWithRequestTypes:v10];
    [v41 setAppleIDAuthorizationRequest:v9];
    [v41 setRelyingPartyIdentifier:v8];
    [v41 setPlatformKeyCredentialCreationOptions:v66];
    [v41 setPlatformKeyCredentialAssertionOptions:v64];
    [v41 setSecurityKeyCredentialCreationOptions:v63];
    [v41 setSecurityKeyCredentialAssertionOptions:v7];
    [v41 setAuthenticatedContext:v62];
    [v41 setProxiedAppName:self->_proxiedAppName];
    [v41 setProxiedAppIdentifier:self->_proxiedAppIdentifier];
    [v41 setProxiedBundleIdentifier:self->_proxiedBundleIdentifier];
    [v41 setProxiedTeamIdentifier:self->_proxiedTeamIdentifier];
    [v41 setProxiedAssociatedDomains:self->_proxiedAssociatedDomains];
    [v41 setProxiedIconData:self->_proxiedIconData];
    [v41 setProxiedIconScale:self->_proxiedIconScale];
    [v41 setProxiedOriginDeviceName:self->_proxiedOriginDeviceName];
    [v41 setProxySheetHeaderOverride:self->_proxySheetHeaderOverride];
    [v41 setProxySheetTitleOverride:self->_proxySheetTitleOverride];
    [v41 setProxySheetSubtitleOverride:self->_proxySheetSubtitleOverride];
    [v41 setProxySheetNoCredentialsErrorTitleOverride:self->_proxySheetNoCredentialsErrorTitleOverride];
    [v41 setProxySheetNoCredentialsErrorMessageOverride:self->_proxySheetNoCredentialsErrorMessageOverride];
    [v41 setUseAlternativeSecurityKeysIcon:self->_useAlternativeSecurityKeysIcon];
    if (self->_proxySheetHeaderOverride || self->_proxySheetTitleOverride || self->_proxySheetSubtitleOverride)
    {
      if ((v10 & 0xFFFFFFFFFFFFFFCFLL) != 0)
      {
LABEL_56:
        v42 = (void *)MEMORY[0x263F087E8];
        uint64_t v71 = *MEMORY[0x263F08320];
        v72 = @"Proxy sheet overrides are only available for security key requests.";
        id v43 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1, v57);
        *a4 = [v42 errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:1004 userInfo:v43];

        id v4 = v61;
        v44 = 0;
LABEL_59:

        goto LABEL_63;
      }
    }
    else if (self->_useAlternativeSecurityKeysIcon && (v10 & 0xFFFFFFFFFFFFFFCFLL) != 0)
    {
      goto LABEL_56;
    }
    *a4 = 0;
    id v41 = v41;
    v44 = v41;
    goto LABEL_59;
  }
  uint64_t v6 = v5;
  v62 = 0;
  unint64_t v63 = 0;
  unint64_t v7 = 0;
  uint64_t v64 = 0;
  uint64_t v66 = 0;
  id v8 = 0;
  id v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)v68;
  uint64_t v57 = &v80;
  uint64_t v65 = *(void *)v68;
LABEL_3:
  id v60 = (void *)v7;
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v68 != v11) {
      objc_enumerationMutation(v4);
    }
    id v13 = *(void **)(*((void *)&v67 + 1) + 8 * v12);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    id v14 = 0;
    uint64_t v15 = 1;
LABEL_18:
    int v27 = dyld_program_sdk_at_least();
    if ((v15 & v10) != 0 && v27)
    {
      v47 = (void *)MEMORY[0x263F087E8];
      uint64_t v90 = *MEMORY[0x263F08320];
      v91[0] = @"Found duplicate requests. Only one of each type of request is currently supported.";
      v48 = NSDictionary;
      v49 = (__CFString **)v91;
      long long v50 = &v90;
      goto LABEL_61;
    }
    if (((1 << v15) & 6) == 0)
    {
      if (((1 << v15) & 0x10010) != 0)
      {
        if ((v10 & 0xFFFFFFFFFFFFFFEBLL) != 0)
        {
          v47 = (void *)MEMORY[0x263F087E8];
          uint64_t v88 = *MEMORY[0x263F08320];
          v89 = @"Registration requests cannot be used with other types of requests.";
          v48 = NSDictionary;
          v49 = &v89;
          long long v50 = &v88;
LABEL_61:
          long long v51 = objc_msgSend(v48, "dictionaryWithObjects:forKeys:count:", v49, v50, 1, &v80);
          *a4 = [v47 errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:1004 userInfo:v51];

LABEL_62:
          v44 = 0;
          v35 = v4;
          unint64_t v7 = (unint64_t)v60;
          goto LABEL_63;
        }
      }
      else
      {
        if (((1 << v15) & 0x100000100) == 0) {
          goto LABEL_62;
        }
        if ((v10 & 0x14) != 0)
        {
          v47 = (void *)MEMORY[0x263F087E8];
          uint64_t v86 = *MEMORY[0x263F08320];
          v87 = @"Registration requests cannot be used with other types of requests.";
          v48 = NSDictionary;
          v49 = &v87;
          long long v50 = &v86;
          goto LABEL_61;
        }
      }
    }
    v10 |= v15;
    if (v14 && v8)
    {
      if (([v14 isEqualToString:v8] & 1) == 0)
      {
        v45 = (void *)MEMORY[0x263F087E8];
        uint64_t v77 = *MEMORY[0x263F08320];
        v78 = @"All Public Key Credential requests must use the same relyingPartyIdentifier.";
        v46 = [NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
        *a4 = [v45 errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:1004 userInfo:v46];

        goto LABEL_62;
      }
LABEL_31:
      id v28 = v14;

      id v8 = v28;
      goto LABEL_32;
    }
    if (v14) {
      goto LABEL_31;
    }
LABEL_32:
    if (v6 == ++v12)
    {
      uint64_t v34 = [v4 countByEnumeratingWithState:&v67 objects:v85 count:16];
      uint64_t v6 = v34;
      unint64_t v7 = (unint64_t)v60;
      if (!v34) {
        goto LABEL_45;
      }
      goto LABEL_3;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = objc_alloc_init(MEMORY[0x263F29160]);

    v17 = [v13 user];
    [v16 setUserIdentifier:v17];

    v18 = [v13 state];
    [v16 setState:v18];

    id v19 = [v13 nonce];
    [v16 setNonce:v19];
    id v14 = 0;
    uint64_t v15 = 2;
    id v9 = v16;
LABEL_17:

    uint64_t v11 = v65;
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v13;
    uint64_t v20 = [v19 coreCredentialCreationOptions];

    id v14 = [v19 relyingPartyIdentifier];
    v21 = [v19 attestationPreference];
    char v22 = [v21 isEqualToString:@"none"];

    if ((v22 & 1) == 0)
    {
      v23 = [v19 attestationPreference];
      char v24 = [v23 isEqualToString:@"enterprise"];

      if ((v24 & 1) == 0)
      {
        long long v53 = (void *)MEMORY[0x263F087E8];
        uint64_t v83 = *MEMORY[0x263F08320];
        v84 = @"Passkeys do not support attestation.";
        v54 = [NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
        *a4 = [v53 errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:1004 userInfo:v54];

        v44 = 0;
        unint64_t v7 = (unint64_t)v60;
        id v4 = v61;
        v35 = v61;
        uint64_t v66 = v20;
        goto LABEL_63;
      }
    }
    uint64_t v15 = 4;
    uint64_t v66 = v20;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v13;
    id v14 = [v19 relyingPartyIdentifier];
    uint64_t v25 = [v19 coreCredentialAssertionOptions];

    uint64_t v26 = [v19 authenticatedContext];

    uint64_t v15 = 8;
    v62 = (void *)v26;
    id v4 = v61;
    uint64_t v64 = v25;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v33 = WBS_LOG_CHANNEL_PREFIXAuthorization();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        [(ASAuthorizationController *)v79 _requestContextWithRequests:(uint64_t)v13 error:&v80];
      }
      goto LABEL_32;
    }
    id v19 = v13;
    id v14 = [v19 relyingPartyIdentifier];
    uint64_t v32 = [v19 coreCredentialAssertionOptions];

    uint64_t v15 = 32;
    id v60 = (void *)v32;
    goto LABEL_17;
  }
  id v19 = v13;
  id v29 = [v19 coreCredentialCreationOptions];

  v30 = [v29 supportedAlgorithmIdentifiers];
  uint64_t v31 = [v30 count];

  if (v31)
  {
    id v14 = [v19 relyingPartyIdentifier];
    uint64_t v15 = 16;
    unint64_t v63 = (unint64_t)v29;
LABEL_14:
    id v4 = v61;
    goto LABEL_17;
  }
  uint64_t v55 = (void *)MEMORY[0x263F087E8];
  uint64_t v81 = *MEMORY[0x263F08320];
  v82 = @"No algorithms specified for ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest.";
  v56 = [NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
  *a4 = [v55 errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:1004 userInfo:v56];

  v44 = 0;
  id v14 = v19;
  unint64_t v7 = (unint64_t)v60;
  id v4 = v61;
  v35 = v61;
  unint64_t v63 = (unint64_t)v29;
LABEL_63:

  return v44;
}

- (id)_convertCoreErrorToPublicError:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 code];
  uint64_t v5 = 0;
  if (v4 > 11)
  {
    if (v4 == 12) {
      goto LABEL_10;
    }
    if (v4 == 14)
    {
      id v13 = (void *)MEMORY[0x263F087E8];
      id v9 = [v3 userInfo];
      uint64_t v10 = v13;
      uint64_t v11 = 1002;
      goto LABEL_15;
    }
    if (v4 != 17) {
      goto LABEL_16;
    }
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08608];
    v16[0] = v3;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
LABEL_13:
    id v9 = (void *)v7;
    uint64_t v10 = v6;
    uint64_t v11 = 1004;
    goto LABEL_15;
  }
  switch(v4)
  {
    case 0:
      uint64_t v12 = (void *)MEMORY[0x263F087E8];
      id v9 = [v3 userInfo];
      uint64_t v10 = v12;
      uint64_t v11 = 1000;
      goto LABEL_15;
    case 1:
      uint64_t v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v7 = [v3 userInfo];
      goto LABEL_13;
    case 2:
LABEL_10:
      id v8 = (void *)MEMORY[0x263F087E8];
      id v9 = [v3 userInfo];
      uint64_t v10 = v8;
      uint64_t v11 = 1001;
LABEL_15:
      uint64_t v5 = [v10 errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:v11 userInfo:v9];

      break;
  }
LABEL_16:

  return v5;
}

- (id)_convertCredentialProviderErrorToPublicError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 code];
  if (v5 == 102)
  {
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = 1006;
    goto LABEL_5;
  }
  if (v5 == 100)
  {
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = 1001;
LABEL_5:
    id v8 = [v6 errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:v7 userInfo:0];
    goto LABEL_7;
  }
  authorizationActivity = self->_authorizationActivity;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__ASAuthorizationController__convertCredentialProviderErrorToPublicError___block_invoke;
  block[3] = &unk_264395388;
  id v12 = v4;
  os_activity_apply(authorizationActivity, block);

  id v8 = 0;
LABEL_7:

  return v8;
}

void __74__ASAuthorizationController__convertCredentialProviderErrorToPublicError___block_invoke(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __74__ASAuthorizationController__convertCredentialProviderErrorToPublicError___block_invoke_cold_1(a1, v2);
  }
}

- (id)_convertWebKitErrorToPublicError:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 code];
  if (v5 == 31)
  {
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = 1001;
    goto LABEL_5;
  }
  if (v5 == 8)
  {
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = 1006;
LABEL_5:
    id v8 = [v6 errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:v7 userInfo:0];
    goto LABEL_7;
  }
  authorizationActivity = self->_authorizationActivity;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __62__ASAuthorizationController__convertWebKitErrorToPublicError___block_invoke;
  v17 = &unk_264395388;
  id v10 = v4;
  id v18 = v10;
  os_activity_apply(authorizationActivity, &v14);
  uint64_t v11 = (void *)MEMORY[0x263F087E8];
  uint64_t v19 = *MEMORY[0x263F08608];
  v20[0] = v10;
  id v12 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, &v19, 1, v14, v15, v16, v17);
  id v8 = [v11 errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:1004 userInfo:v12];

LABEL_7:

  return v8;
}

void __62__ASAuthorizationController__convertWebKitErrorToPublicError___block_invoke(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __62__ASAuthorizationController__convertWebKitErrorToPublicError___block_invoke_cold_1(a1, v2);
  }
}

- (void)_completeWithAuthorization:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__ASAuthorizationController__completeWithAuthorization___block_invoke;
  v10[3] = &unk_264396518;
  v10[4] = self;
  uint64_t v5 = (void (**)(void, void))MEMORY[0x21D484070](v10);
  appSSOAuthorization = self->_appSSOAuthorization;
  if (appSSOAuthorization
    && ([appSSOAuthorization isUserInteractionEnabled] & 1) == 0)
  {
    ((void (**)(void, id))v5)[2](v5, v4);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__ASAuthorizationController__completeWithAuthorization___block_invoke_122;
    block[3] = &unk_264395D78;
    id v9 = v5;
    id v8 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __56__ASAuthorizationController__completeWithAuthorization___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__ASAuthorizationController__completeWithAuthorization___block_invoke_2;
  v7[3] = &unk_264395428;
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  os_activity_apply(v5, v7);
}

void __56__ASAuthorizationController__completeWithAuthorization___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = [v3 credential];
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_21918F000, v4, OS_LOG_TYPE_DEFAULT, "Successfully completed authorization: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 80));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained authorizationController:*(void *)(a1 + 40) didCompleteWithAuthorization:*(void *)(a1 + 32)];
  }
}

uint64_t __56__ASAuthorizationController__completeWithAuthorization___block_invoke_122(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_failWithError:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__ASAuthorizationController__failWithError___block_invoke;
  v10[3] = &unk_2643961F0;
  v10[4] = self;
  uint64_t v5 = (void (**)(void, void))MEMORY[0x21D484070](v10);
  appSSOAuthorization = self->_appSSOAuthorization;
  if (appSSOAuthorization
    && ([appSSOAuthorization isUserInteractionEnabled] & 1) == 0)
  {
    ((void (**)(void, id))v5)[2](v5, v4);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__ASAuthorizationController__failWithError___block_invoke_129;
    block[3] = &unk_264395D78;
    uint64_t v9 = v5;
    id v8 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __44__ASAuthorizationController__failWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__ASAuthorizationController__failWithError___block_invoke_2;
  v7[3] = &unk_264395428;
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  os_activity_apply(v5, v7);
}

void __44__ASAuthorizationController__failWithError___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 domain];
  int v4 = [v3 isEqualToString:*MEMORY[0x263F29388]];

  uint64_t v5 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v6 = [v5 _convertCoreErrorToPublicError:v2];
  }
  else
  {
    if (![v5 _shouldConvertExtensionAndWebKitErrors]) {
      goto LABEL_9;
    }
    int v7 = [v2 domain];
    int v8 = [v7 isEqualToString:@"ASExtensionErrorDomain"];

    if (v8)
    {
      uint64_t v6 = [*(id *)(a1 + 40) _convertCredentialProviderErrorToPublicError:v2];
    }
    else
    {
      uint64_t v9 = [v2 domain];
      int v10 = [v9 isEqualToString:@"WKErrorDomain"];

      if (!v10) {
        goto LABEL_9;
      }
      uint64_t v6 = [*(id *)(a1 + 40) _convertWebKitErrorToPublicError:v2];
    }
  }
  uint64_t v11 = (void *)v6;

  id v2 = v11;
LABEL_9:
  if (!v2)
  {
    id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:1000 userInfo:0];
  }
  id v12 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __44__ASAuthorizationController__failWithError___block_invoke_2_cold_1(v12);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 80));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained authorizationController:*(void *)(a1 + 40) didCompleteWithError:v2];
  }
}

uint64_t __44__ASAuthorizationController__failWithError___block_invoke_129(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)_shouldConvertExtensionAndWebKitErrors
{
  id v2 = objc_alloc(MEMORY[0x263F01878]);
  id v3 = [MEMORY[0x263F086E0] mainBundle];
  int v4 = [v3 bundleIdentifier];
  id v15 = 0;
  uint64_t v5 = (void *)[v2 initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v15];
  id v6 = v15;

  if (v6)
  {
    int v7 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ASAuthorizationController _shouldConvertExtensionAndWebKitErrors](v7);
    }
    goto LABEL_6;
  }
  unsigned int v8 = [v5 platform] - 1;
  if (v8 > 0xB || ((0xC63u >> v8) & 1) == 0)
  {
LABEL_6:
    BOOL v9 = 0;
    goto LABEL_7;
  }
  uint64_t v11 = qword_219232870[v8];
  id v12 = [v5 SDKVersion];
  id v13 = [v12 componentsSeparatedByString:@"."];
  uint64_t v14 = [v13 firstObject];

  if ([v14 length]) {
    BOOL v9 = [v14 integerValue] >= v11;
  }
  else {
    BOOL v9 = 0;
  }

LABEL_7:
  return v9;
}

- (NSArray)authorizationRequests
{
  return self->_authorizationRequests;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
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

- (NSArray)customAuthorizationMethods
{
  return self->_customAuthorizationMethods;
}

- (void)setCustomAuthorizationMethods:(NSArray *)customAuthorizationMethods
{
}

- (NSString)proxiedAppName
{
  return self->_proxiedAppName;
}

- (void)setProxiedAppName:(id)a3
{
}

- (NSString)proxiedAppIdentifier
{
  return self->_proxiedAppIdentifier;
}

- (void)setProxiedAppIdentifier:(id)a3
{
}

- (NSString)proxiedBundleIdentifier
{
  return self->_proxiedBundleIdentifier;
}

- (void)setProxiedBundleIdentifier:(id)a3
{
}

- (NSString)proxiedTeamIdentifier
{
  return self->_proxiedTeamIdentifier;
}

- (void)setProxiedTeamIdentifier:(id)a3
{
}

- (NSArray)proxiedAssociatedDomains
{
  return self->_proxiedAssociatedDomains;
}

- (void)setProxiedAssociatedDomains:(id)a3
{
}

- (NSData)proxiedIconData
{
  return self->_proxiedIconData;
}

- (void)setProxiedIconData:(id)a3
{
}

- (NSNumber)proxiedIconScale
{
  return self->_proxiedIconScale;
}

- (void)setProxiedIconScale:(id)a3
{
}

- (NSString)proxiedOriginDeviceName
{
  return self->_proxiedOriginDeviceName;
}

- (void)setProxiedOriginDeviceName:(id)a3
{
}

- (NSString)proxySheetHeaderOverride
{
  return self->_proxySheetHeaderOverride;
}

- (void)setProxySheetHeaderOverride:(id)a3
{
}

- (NSString)proxySheetTitleOverride
{
  return self->_proxySheetTitleOverride;
}

- (void)setProxySheetTitleOverride:(id)a3
{
}

- (NSString)proxySheetSubtitleOverride
{
  return self->_proxySheetSubtitleOverride;
}

- (void)setProxySheetSubtitleOverride:(id)a3
{
}

- (NSString)proxySheetNoCredentialsErrorTitleOverride
{
  return self->_proxySheetNoCredentialsErrorTitleOverride;
}

- (void)setProxySheetNoCredentialsErrorTitleOverride:(id)a3
{
}

- (NSString)proxySheetNoCredentialsErrorMessageOverride
{
  return self->_proxySheetNoCredentialsErrorMessageOverride;
}

- (void)setProxySheetNoCredentialsErrorMessageOverride:(id)a3
{
}

- (BOOL)useAlternativeSecurityKeysIcon
{
  return self->_useAlternativeSecurityKeysIcon;
}

- (void)setUseAlternativeSecurityKeysIcon:(BOOL)a3
{
  self->_useAlternativeSecurityKeysIcon = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxySheetNoCredentialsErrorMessageOverride, 0);
  objc_storeStrong((id *)&self->_proxySheetNoCredentialsErrorTitleOverride, 0);
  objc_storeStrong((id *)&self->_proxySheetSubtitleOverride, 0);
  objc_storeStrong((id *)&self->_proxySheetTitleOverride, 0);
  objc_storeStrong((id *)&self->_proxySheetHeaderOverride, 0);
  objc_storeStrong((id *)&self->_proxiedOriginDeviceName, 0);
  objc_storeStrong((id *)&self->_proxiedIconScale, 0);
  objc_storeStrong((id *)&self->_proxiedIconData, 0);
  objc_storeStrong((id *)&self->_proxiedAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_proxiedTeamIdentifier, 0);
  objc_storeStrong((id *)&self->_proxiedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_proxiedAppIdentifier, 0);
  objc_storeStrong((id *)&self->_proxiedAppName, 0);
  objc_storeStrong((id *)&self->_customAuthorizationMethods, 0);
  objc_destroyWeak((id *)&self->_presentationContextProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_authorizationRequests, 0);
  objc_storeStrong((id *)&self->_referenceToSelf, 0);
  objc_storeStrong((id *)&self->_authorizationActivity, 0);
  objc_storeStrong((id *)&self->_authenticationServicesAgentProxy, 0);
  objc_storeStrong((id *)&self->_appSSOViewController, 0);
  objc_storeStrong((id *)&self->_appSSOPresentationAnchor, 0);
  objc_storeStrong((id *)&self->_appSSORequestURL, 0);

  objc_storeStrong((id *)&self->_appSSOAuthorization, 0);
}

void __80__ASAuthorizationController_authorization_presentViewController_withCompletion___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "Timed out presenting SSO authorization view controller.", v1, 2u);
}

- (void)_performAuthorizationRequests:(os_log_t)log requestStyle:requestOptions:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "Rejecting invalid requests.", v1, 2u);
}

- (void)_requestContextWithRequests:(uint64_t)a3 error:(uint64_t *)a4 .cold.1(uint8_t *a1, void *a2, uint64_t a3, uint64_t *a4)
{
  id v6 = a2;
  uint64_t v7 = objc_opt_class();
  *(_DWORD *)a1 = 138477827;
  *a4 = v7;
  _os_log_error_impl(&dword_21918F000, v6, OS_LOG_TYPE_ERROR, "Found request for unexpected type: %{private}@", a1, 0xCu);
}

void __74__ASAuthorizationController__convertCredentialProviderErrorToPublicError___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v5, v6, "Received unexpected credential provider error: %{public}@", v7, v8, v9, v10, v11);
}

void __62__ASAuthorizationController__convertWebKitErrorToPublicError___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v5, v6, "Received unexpected WebKit error: %{public}@", v7, v8, v9, v10, v11);
}

void __44__ASAuthorizationController__failWithError___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v4, v5, "ASAuthorizationController credential request failed with error: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_shouldConvertExtensionAndWebKitErrors
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(), "safari_privacyPreservingError");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v4, v5, "Failed to get application extension record: %{public}@", v6, v7, v8, v9, v10);
}

@end