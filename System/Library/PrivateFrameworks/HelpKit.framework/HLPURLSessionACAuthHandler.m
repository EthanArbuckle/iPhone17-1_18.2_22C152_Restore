@interface HLPURLSessionACAuthHandler
+ (BOOL)canAuthenticateWithURLResponse:(id)a3;
- (HLPURLSessionACAuthContext)authContext;
- (HLPURLSessionACAuthContext)authenticationContext;
- (HLPURLSessionACAuthHandler)initWithAuthenticationContext:(id)a3;
- (OS_dispatch_queue)syncQueue;
- (PPCExtensibleSSOAuthenticator)ssoAuthenticator;
- (id)customHeaderFields;
- (void)authenticateWithCompletion:(id)a3;
- (void)setAuthContext:(id)a3;
- (void)setSsoAuthenticator:(id)a3;
- (void)setSyncQueue:(id)a3;
@end

@implementation HLPURLSessionACAuthHandler

+ (BOOL)canAuthenticateWithURLResponse:(id)a3
{
  id v3 = a3;
  if (+[HLPCommonDefines isInternalBuild])
  {
    id v4 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (canAuthenticateWithURLResponse__onceToken != -1) {
        dispatch_once(&canAuthenticateWithURLResponse__onceToken, &__block_literal_global_0);
      }
      uint64_t v5 = [v4 statusCode];
      v6 = (void *)canAuthenticateWithURLResponse__supportedStatusCodes;
      v7 = [NSNumber numberWithInteger:v5];
      char v8 = [v6 containsObject:v7];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

uint64_t __61__HLPURLSessionACAuthHandler_canAuthenticateWithURLResponse___block_invoke()
{
  canAuthenticateWithURLResponse__supportedStatusCodes = [MEMORY[0x263EFFA08] setWithArray:&unk_26D2A8568];
  return MEMORY[0x270F9A758]();
}

- (HLPURLSessionACAuthHandler)initWithAuthenticationContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HLPURLSessionACAuthHandler;
  v6 = [(HLPURLSessionACAuthHandler *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_authContext, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.tips.ACAuthHandler.syncQueue", 0);
    syncQueue = v7->_syncQueue;
    v7->_syncQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (void)authenticateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HLPURLSessionACAuthHandler *)self syncQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__HLPURLSessionACAuthHandler_authenticateWithCompletion___block_invoke;
  block[3] = &unk_264578B58;
  block[4] = self;
  dispatch_sync(v5, block);

  v6 = [(HLPURLSessionACAuthHandler *)self ssoAuthenticator];

  if (v6)
  {
    v7 = [(HLPURLSessionACAuthHandler *)self ssoAuthenticator];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __57__HLPURLSessionACAuthHandler_authenticateWithCompletion___block_invoke_2;
    v9[3] = &unk_264578B80;
    v9[4] = self;
    id v10 = v4;
    [v7 authenticateWithCompletion:v9];
  }
  else
  {
    dispatch_queue_t v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:13 userInfo:0];
    (*((void (**)(id, void, void, void, void *))v4 + 2))(v4, 0, 0, 0, v8);
  }
}

void __57__HLPURLSessionACAuthHandler_authenticateWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) ssoAuthenticator];
  if (v2)
  {
  }
  else if (PingPongClientLibraryCore())
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    id v3 = (void *)getPPCExtensibleSSOAuthenticatorClass_softClass;
    uint64_t v19 = getPPCExtensibleSSOAuthenticatorClass_softClass;
    if (!getPPCExtensibleSSOAuthenticatorClass_softClass)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __getPPCExtensibleSSOAuthenticatorClass_block_invoke;
      v15[3] = &unk_264578BE0;
      v15[4] = &v16;
      __getPPCExtensibleSSOAuthenticatorClass_block_invoke((uint64_t)v15);
      id v3 = (void *)v17[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v16, 8);
    id v5 = objc_alloc_init(v4);
    [*(id *)(a1 + 32) setSsoAuthenticator:v5];
  }
  v6 = [*(id *)(a1 + 32) authContext];
  v7 = [v6 appIdentifier];
  dispatch_queue_t v8 = [*(id *)(a1 + 32) ssoAuthenticator];
  [v8 setAppIdentifier:v7];

  v9 = [*(id *)(a1 + 32) authContext];
  id v10 = [v9 enviromentIdentifier];
  objc_super v11 = [*(id *)(a1 + 32) ssoAuthenticator];
  [v11 setEnvIdentifier:v10];

  v12 = [*(id *)(a1 + 32) authContext];
  v13 = [v12 interactivityMode];
  v14 = [*(id *)(a1 + 32) ssoAuthenticator];
  [v14 setInteractivity:v13];
}

void __57__HLPURLSessionACAuthHandler_authenticateWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v25[3] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  v7 = (id *)getkExtensibleSSOUsernameKeySymbolLoc_ptr;
  uint64_t v21 = getkExtensibleSSOUsernameKeySymbolLoc_ptr;
  if (!getkExtensibleSSOUsernameKeySymbolLoc_ptr)
  {
    dispatch_queue_t v8 = (void *)PingPongClientLibrary();
    v19[3] = (uint64_t)dlsym(v8, "kExtensibleSSOUsernameKey");
    getkExtensibleSSOUsernameKeySymbolLoc_ptr = v19[3];
    v7 = (id *)v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v7) {
    goto LABEL_15;
  }
  id v9 = *v7;
  id v10 = [v5 objectForKeyedSubscript:v9];

  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  objc_super v11 = (id *)getkExtensibleSSOTokenKeySymbolLoc_ptr;
  uint64_t v21 = getkExtensibleSSOTokenKeySymbolLoc_ptr;
  if (!getkExtensibleSSOTokenKeySymbolLoc_ptr)
  {
    v12 = (void *)PingPongClientLibrary();
    v19[3] = (uint64_t)dlsym(v12, "kExtensibleSSOTokenKey");
    getkExtensibleSSOTokenKeySymbolLoc_ptr = v19[3];
    objc_super v11 = (id *)v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v11)
  {
LABEL_15:
    __57__HLPURLSessionACAuthHandler_authenticateWithCompletion___block_invoke_2_cold_1();
    __break(1u);
  }
  id v13 = *v11;
  v14 = [v5 objectForKeyedSubscript:v13];

  v15 = [*(id *)(a1 + 32) authContext];
  uint64_t v16 = [v15 clientIdentifier];

  if ([v10 length] && objc_msgSend(v14, "length"))
  {
    if ([v16 length])
    {
      v24[0] = @"X-AppleConnect-User";
      v24[1] = @"X-AppleConnect-Token";
      v25[0] = v10;
      v25[1] = v14;
      v24[2] = @"X-Client-Id";
      v25[2] = v16;
      [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
    }
    else
    {
      v22[0] = @"X-AppleConnect-User";
      v22[1] = @"X-AppleConnect-Token";
      v23[0] = v10;
      v23[1] = v14;
      [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    v17 = };
  }
  else
  {
    v17 = 0;
  }
  (*(void (**)(void, void *, void *, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v10, v14, v17);
}

- (id)customHeaderFields
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [(HLPURLSessionACAuthHandler *)self authContext];
  id v3 = [v2 clientIdentifier];

  if ([v3 length])
  {
    id v6 = @"X-Client-Id";
    v7[0] = v3;
    id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (HLPURLSessionACAuthContext)authenticationContext
{
  return self->_authenticationContext;
}

- (HLPURLSessionACAuthContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (PPCExtensibleSSOAuthenticator)ssoAuthenticator
{
  return self->_ssoAuthenticator;
}

- (void)setSsoAuthenticator:(id)a3
{
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_ssoAuthenticator, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

uint64_t __57__HLPURLSessionACAuthHandler_authenticateWithCompletion___block_invoke_2_cold_1()
{
  return __getPPCExtensibleSSOAuthenticatorClass_block_invoke_cold_1();
}

@end