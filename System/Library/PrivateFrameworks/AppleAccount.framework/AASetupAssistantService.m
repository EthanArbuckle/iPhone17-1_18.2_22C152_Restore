@interface AASetupAssistantService
+ (id)urlConfiguration;
+ (void)resetURLConfiguration;
- (AASetupAssistantService)init;
- (AASetupAssistantService)initWithAccount:(id)a3;
- (AASetupAssistantService)initWithAppleID:(id)a3 password:(id)a4;
- (NSString)appleID;
- (NSString)emailChoice;
- (NSString)password;
- (id)_signingSession;
- (void)_doHSADeviceProvisioningSynchronizationWithDSID:(id)a3 data:(id)a4;
- (void)_doHSADeviceProvisioningWithDSID:(id)a3 data:(id)a4;
- (void)_doHSADeviceReprovisioningWithDSID:(id)a3;
- (void)authenticateWithHandler:(id)a3;
- (void)createAppleIDWithParameters:(id)a3 handler:(id)a4;
- (void)createAppleIDWithParameters:(id)a3 handlerWithResponse:(id)a4;
- (void)dealloc;
- (void)downloadURLConfiguration:(id)a3;
- (void)loginDelegatesWithParameters:(id)a3 completion:(id)a4;
- (void)setAppleID:(id)a3;
- (void)setCookieStorage:(OpaqueCFHTTPCookieStorage *)a3;
- (void)setEmailChoice:(id)a3;
- (void)setPassword:(id)a3;
- (void)setupDelegateAccountsWithParameters:(id)a3 handler:(id)a4;
- (void)shouldPresentUpgradeFlowWithCompletion:(id)a3;
- (void)updateAppleIDWithParameters:(id)a3 handler:(id)a4;
- (void)upgradeiCloudTermsIfNecessaryWithCustomHeaders:(id)a3 handler:(id)a4;
- (void)upgradeiCloudTermsIfNecessaryWithHandler:(id)a3;
@end

@implementation AASetupAssistantService

+ (id)urlConfiguration
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  v2 = objc_alloc_init(AASetupAssistantConfigRequest);
  [(AARequest *)v2 setFlushCache:__flushURLConfigCache];
  __flushURLConfigCache = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__AASetupAssistantService_urlConfiguration__block_invoke;
  v7[3] = &unk_1E5A48420;
  v9 = &v10;
  v4 = v3;
  v8 = v4;
  [(AARequest *)v2 performRequestWithHandler:v7];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

void __43__AASetupAssistantService_urlConfiguration__block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)resetURLConfiguration
{
  __flushURLConfigCache = 1;
}

- (AASetupAssistantService)init
{
  v6.receiver = self;
  v6.super_class = (Class)AASetupAssistantService;
  v2 = [(AASetupAssistantService *)&v6 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    requesterQueue = v2->_requesterQueue;
    v2->_requesterQueue = v3;
  }
  return v2;
}

- (AASetupAssistantService)initWithAppleID:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(AASetupAssistantService *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    appleID = v8->_appleID;
    v8->_appleID = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    password = v8->_password;
    v8->_password = (NSString *)v11;
  }
  return v8;
}

- (AASetupAssistantService)initWithAccount:(id)a3
{
  id v5 = a3;
  id v6 = [(AASetupAssistantService *)self init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v8 = [v5 username];
    uint64_t v9 = [v8 copy];
    appleID = v7->_appleID;
    v7->_appleID = (NSString *)v9;

    uint64_t v11 = [(ACAccount *)v7->_account credential];
    uint64_t v12 = [v11 password];
    uint64_t v13 = [v12 copy];
    password = v7->_password;
    v7->_password = (NSString *)v13;
  }
  return v7;
}

- (void)dealloc
{
  cookieStorage = self->_cookieStorage;
  if (cookieStorage) {
    CFRelease(cookieStorage);
  }
  v4.receiver = self;
  v4.super_class = (Class)AASetupAssistantService;
  [(AASetupAssistantService *)&v4 dealloc];
}

- (void)setCookieStorage:(OpaqueCFHTTPCookieStorage *)a3
{
  cookieStorage = self->_cookieStorage;
  if (cookieStorage != a3)
  {
    if (cookieStorage) {
      CFRelease(cookieStorage);
    }
    self->_cookieStorage = a3;
    if (a3)
    {
      CFRetain(a3);
    }
  }
}

- (void)downloadURLConfiguration:(id)a3
{
  id v3 = a3;
  objc_super v4 = dispatch_queue_create("urlConfigurationQueue", 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AASetupAssistantService_downloadURLConfiguration___block_invoke;
  block[3] = &unk_1E5A48448;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __52__AASetupAssistantService_downloadURLConfiguration___block_invoke(uint64_t a1)
{
  id v2 = +[AASetupAssistantService urlConfiguration];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)authenticateWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_queue_create("authenticationRequestQueue", 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__AASetupAssistantService_authenticateWithHandler___block_invoke;
  v7[3] = &unk_1E5A48470;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __51__AASetupAssistantService_authenticateWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 40);
  id v3 = [AASetupAssistantAuthenticateRequest alloc];
  id v4 = *(void **)(a1 + 32);
  if (v2)
  {
    id v5 = [(AAAuthenticateRequest *)v3 initWithAccount:v4[5]];
    id v6 = [[AADeviceProvisioningSession alloc] initWithAccount:*(void *)(*(void *)(a1 + 32) + 40)];
    [(AADeviceProvisioningSession *)v6 addProvisioningInfoToAARequest:v5];
  }
  else
  {
    id v6 = [v4 appleID];
    id v7 = [*(id *)(a1 + 32) password];
    id v5 = [(AAAuthenticateRequest *)v3 initWithUsername:v6 password:v7];
  }
  [(AARequest *)v5 setCookieStorage:*(void *)(*(void *)(a1 + 32) + 48)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__AASetupAssistantService_authenticateWithHandler___block_invoke_2;
  v8[3] = &unk_1E5A481E8;
  id v9 = *(id *)(a1 + 40);
  [(AARequest *)v5 performRequestWithHandler:v8];
}

void __51__AASetupAssistantService_authenticateWithHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__AASetupAssistantService_authenticateWithHandler___block_invoke_3;
  v6[3] = &unk_1E5A48470;
  id v7 = v4;
  id v8 = *(id *)(a1 + 32);
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __51__AASetupAssistantService_authenticateWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = [v2 error];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)createAppleIDWithParameters:(id)a3 handler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__AASetupAssistantService_createAppleIDWithParameters_handler___block_invoke;
  v8[3] = &unk_1E5A48498;
  id v9 = v6;
  id v7 = v6;
  [(AASetupAssistantService *)self createAppleIDWithParameters:a3 handlerWithResponse:v8];
}

uint64_t __63__AASetupAssistantService_createAppleIDWithParameters_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a4, a6);
  }
  return result;
}

- (void)createAppleIDWithParameters:(id)a3 handlerWithResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "createAppleIDWithParameters start", buf, 2u);
  }

  id v9 = dispatch_queue_create("createAppleIDQueue", 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__AASetupAssistantService_createAppleIDWithParameters_handlerWithResponse___block_invoke;
  block[3] = &unk_1E5A484C0;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __75__AASetupAssistantService_createAppleIDWithParameters_handlerWithResponse___block_invoke(id *a1)
{
  uint64_t v2 = (void *)[a1[4] mutableCopy];
  uint64_t v3 = [a1[5] appleID];
  [v2 setValue:v3 forKey:@"apple-id"];

  id v4 = [a1[5] password];
  [v2 setValue:v4 forKey:@"password"];

  id v5 = +[AADeviceInfo appleIDClientIdentifier];
  [v2 setValue:v5 forKey:@"client-id"];

  id v6 = [AASetupAssistantCreateRequest alloc];
  id v7 = a1[5];
  uint64_t v8 = v7[5];
  id v9 = [v7 _signingSession];
  id v10 = [(AASetupAssistantCreateRequest *)v6 initWithAccount:v8 withAppleIDParameters:v2 signingSession:v9];

  id v11 = (void *)*((void *)a1[5] + 5);
  if (v11)
  {
    uint64_t v12 = objc_msgSend(v11, "aa_personID");

    if (v12)
    {
      id v13 = [[AADeviceProvisioningSession alloc] initWithAccount:*((void *)a1[5] + 5)];
      [(AADeviceProvisioningSession *)v13 addProvisioningInfoToAARequest:v10];
    }
  }
  [(AARequest *)v10 setCookieStorage:*((void *)a1[5] + 6)];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__AASetupAssistantService_createAppleIDWithParameters_handlerWithResponse___block_invoke_2;
  v14[3] = &unk_1E5A481E8;
  id v15 = a1[6];
  [(AARequest *)v10 performRequestWithHandler:v14];
}

void __75__AASetupAssistantService_createAppleIDWithParameters_handlerWithResponse___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 statusCode] != 401)
  {
    if (!v6)
    {
      id v9 = 0;
      id v10 = 0;
      int v11 = 0;
      uint64_t v8 = v7;
      goto LABEL_13;
    }
    id v12 = v6;
    uint64_t v13 = [v12 status];
    if (v13
      && (v14 = (void *)v13,
          [v12 status],
          id v15 = objc_claimAutoreleasedReturnValue(),
          int v16 = [v15 intValue],
          v15,
          v14,
          !v16))
    {
      id v10 = [v12 personID];
      id v9 = [v12 appleID];
      int v11 = 1;
    }
    else
    {
      id v10 = [v12 statusMessage];

      if (v10)
      {
        v17 = [MEMORY[0x1E4F1CA60] dictionary];
        v18 = [v12 statusMessage];
        [v17 setObject:v18 forKey:*MEMORY[0x1E4F28568]];

        v19 = (void *)MEMORY[0x1E4F28C58];
        v20 = [v12 status];
        uint64_t v8 = objc_msgSend(v19, "errorWithDomain:code:userInfo:", @"com.apple.appleaccount", (int)objc_msgSend(v20, "intValue"), v17);

        id v9 = 0;
        id v10 = 0;
        int v11 = 0;
        goto LABEL_12;
      }
      id v9 = 0;
      int v11 = 0;
    }
    uint64_t v8 = v7;
    goto LABEL_12;
  }
  uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.appleaccount" code:401 userInfo:0];
  id v9 = 0;
  id v10 = 0;
  int v11 = 0;
  id v12 = v7;
LABEL_12:

LABEL_13:
  v21 = _AALogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22[0] = 67109378;
    v22[1] = v11;
    __int16 v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_1A11D8000, v21, OS_LOG_TYPE_DEFAULT, "createAppleIDWithParameters calling handler with success %d error %@", (uint8_t *)v22, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateAppleIDWithParameters:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "updateAppleIDWithParameters start", buf, 2u);
  }

  id v9 = dispatch_queue_create("updateAppleIDQueue", 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AASetupAssistantService_updateAppleIDWithParameters_handler___block_invoke;
  block[3] = &unk_1E5A484C0;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __63__AASetupAssistantService_updateAppleIDWithParameters_handler___block_invoke(id *a1)
{
  uint64_t v2 = (void *)[a1[4] mutableCopy];
  uint64_t v3 = [a1[5] appleID];
  [v2 setValue:v3 forKey:@"apple-id"];

  id v4 = [a1[5] password];
  [v2 setValue:v4 forKey:@"password"];

  id v5 = +[AADeviceInfo appleIDClientIdentifier];
  [v2 setValue:v5 forKey:@"client-id"];

  id v6 = [AASetupAssistantUpdateRequest alloc];
  id v7 = a1[5];
  uint64_t v8 = v7[5];
  id v9 = [v7 _signingSession];
  id v10 = [(AASetupAssistantCreateRequest *)v6 initWithAccount:v8 withAppleIDParameters:v2 signingSession:v9];

  id v11 = a1[5];
  if (v11[5])
  {
    id v12 = [[AADeviceProvisioningSession alloc] initWithAccount:*((void *)a1[5] + 5)];
    [(AADeviceProvisioningSession *)v12 addProvisioningInfoToAARequest:v10];

    id v11 = a1[5];
  }
  [(AARequest *)v10 setCookieStorage:v11[6]];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__AASetupAssistantService_updateAppleIDWithParameters_handler___block_invoke_2;
  v13[3] = &unk_1E5A481E8;
  id v14 = a1[6];
  [(AARequest *)v10 performRequestWithHandler:v13];
}

void __63__AASetupAssistantService_updateAppleIDWithParameters_handler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8)
  {
    v22 = 0;
    int v16 = 0;
    int v23 = 0;
    v21 = v9;
    goto LABEL_11;
  }
  id v11 = v8;
  uint64_t v12 = [v11 status];
  if (v12)
  {
    id v13 = (void *)v12;
    id v14 = [v11 status];
    int v15 = [v14 intValue];

    if (!v15)
    {
      int v16 = [v11 personID];
      v22 = [v11 appleID];
      int v23 = 1;
      goto LABEL_9;
    }
  }
  int v16 = [v11 statusMessage];

  if (!v16)
  {
    v22 = 0;
    int v23 = 0;
LABEL_9:
    v21 = v10;
    goto LABEL_10;
  }
  v17 = [MEMORY[0x1E4F1CA60] dictionary];
  v18 = [v11 statusMessage];
  [v17 setObject:v18 forKey:*MEMORY[0x1E4F28568]];

  v19 = (void *)MEMORY[0x1E4F28C58];
  v20 = [v11 status];
  v21 = objc_msgSend(v19, "errorWithDomain:code:userInfo:", @"com.apple.appleaccount", (int)objc_msgSend(v20, "intValue"), v17);

  v22 = 0;
  int v16 = 0;
  int v23 = 0;
LABEL_10:

LABEL_11:
  v24 = _AALogSystem();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25[0] = 67109378;
    v25[1] = v23;
    __int16 v26 = 2112;
    v27 = v21;
    _os_log_impl(&dword_1A11D8000, v24, OS_LOG_TYPE_DEFAULT, "updateAppleIDWithParameters calling handler with success %d error %@", (uint8_t *)v25, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setupDelegateAccountsWithParameters:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "setupDelegateAccountsWithParameters start", buf, 2u);
  }

  id v9 = dispatch_queue_create("setupDelegateAccountsQueue", 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__AASetupAssistantService_setupDelegateAccountsWithParameters_handler___block_invoke;
  block[3] = &unk_1E5A484C0;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __71__AASetupAssistantService_setupDelegateAccountsWithParameters_handler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setValue:*(void *)(a1 + 32) forKey:@"delegates"];
  uint64_t v3 = [*(id *)(a1 + 40) appleID];
  [v2 setValue:v3 forKey:@"apple-id"];

  id v4 = [*(id *)(a1 + 40) password];
  [v2 setValue:v4 forKey:@"password"];

  id v5 = [*(id *)(a1 + 40) emailChoice];
  [v2 setValue:v5 forKey:@"email-choice"];

  id v6 = +[AADeviceInfo appleIDClientIdentifier];
  [v2 setValue:v6 forKey:@"client-id"];

  id v7 = [AASetupAssistantSetupDelegatesRequest alloc];
  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = v8[5];
  id v10 = [v8 _signingSession];
  id v11 = [(AASetupAssistantSetupDelegatesRequest *)v7 initWithAccount:v9 withSetupParameters:v2 signingSession:v10];

  uint64_t v12 = *(void *)(a1 + 40);
  if (*(void *)(v12 + 40))
  {
    id v13 = [[AADeviceProvisioningSession alloc] initWithAccount:*(void *)(*(void *)(a1 + 40) + 40)];
    [(AADeviceProvisioningSession *)v13 addProvisioningInfoToAARequest:v11];

    uint64_t v12 = *(void *)(a1 + 40);
  }
  [(AARequest *)v11 setCookieStorage:*(void *)(v12 + 48)];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__AASetupAssistantService_setupDelegateAccountsWithParameters_handler___block_invoke_2;
  v14[3] = &unk_1E5A481E8;
  id v15 = *(id *)(a1 + 48);
  [(AARequest *)v11 performRequestWithHandler:v14];
}

void __71__AASetupAssistantService_setupDelegateAccountsWithParameters_handler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8)
  {
    v22 = 0;
    v21 = v9;
    goto LABEL_11;
  }
  id v11 = v8;
  uint64_t v12 = [v11 status];
  if (v12)
  {
    id v13 = (void *)v12;
    id v14 = [v11 status];
    int v15 = [v14 intValue];

    if (!v15)
    {
      v22 = [v11 responseParameters];
      goto LABEL_9;
    }
  }
  int v16 = [v11 statusMessage];

  if (!v16)
  {
    v22 = 0;
LABEL_9:
    v21 = v10;
    goto LABEL_10;
  }
  v17 = [MEMORY[0x1E4F1CA60] dictionary];
  v18 = [v11 statusMessage];
  [v17 setObject:v18 forKey:*MEMORY[0x1E4F28568]];

  v19 = (void *)MEMORY[0x1E4F28C58];
  v20 = [v11 status];
  v21 = objc_msgSend(v19, "errorWithDomain:code:userInfo:", @"com.apple.appleaccount", (int)objc_msgSend(v20, "intValue"), v17);

  v22 = 0;
LABEL_10:

LABEL_11:
  int v23 = _AALogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    uint64_t v25 = v21;
    _os_log_impl(&dword_1A11D8000, v23, OS_LOG_TYPE_DEFAULT, "setupDelegateAccountsWithParameters calling handler with error %@", (uint8_t *)&v24, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loginDelegatesWithParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "loginDelegatesWithParameters start", buf, 2u);
  }

  id v9 = dispatch_queue_create("loginDelegatesQueue", 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AASetupAssistantService_loginDelegatesWithParameters_completion___block_invoke;
  block[3] = &unk_1E5A484C0;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __67__AASetupAssistantService_loginDelegatesWithParameters_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setValue:*(void *)(a1 + 32) forKey:@"delegates"];
  uint64_t v3 = [*(id *)(a1 + 40) appleID];
  [v2 setValue:v3 forKey:@"apple-id"];

  id v4 = [*(id *)(a1 + 40) password];
  [v2 setValue:v4 forKey:@"password"];

  id v5 = [*(id *)(a1 + 40) emailChoice];
  [v2 setValue:v5 forKey:@"email-choice"];

  id v6 = +[AADeviceInfo appleIDClientIdentifier];
  [v2 setValue:v6 forKey:@"client-id"];

  id v7 = [AALoginOrCreateDelegatesRequest alloc];
  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = v8[5];
  id v10 = [v8 _signingSession];
  id v11 = [(AALoginOrCreateDelegatesRequest *)v7 initWithAccount:v9 parameters:v2 signingSession:v10];

  uint64_t v12 = *(void *)(a1 + 40);
  if (*(void *)(v12 + 40))
  {
    id v13 = [[AADeviceProvisioningSession alloc] initWithAccount:*(void *)(*(void *)(a1 + 40) + 40)];
    [(AADeviceProvisioningSession *)v13 addProvisioningInfoToAARequest:v11];

    uint64_t v12 = *(void *)(a1 + 40);
  }
  [(AARequest *)v11 setCookieStorage:*(void *)(v12 + 48)];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__AASetupAssistantService_loginDelegatesWithParameters_completion___block_invoke_2;
  v14[3] = &unk_1E5A481E8;
  id v15 = *(id *)(a1 + 48);
  [(AARequest *)v11 performRequestWithHandler:v14];
}

void __67__AASetupAssistantService_loginDelegatesWithParameters_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  id v11 = v9;
  uint64_t v12 = v11;
  if (v10)
  {
    uint64_t v13 = [v10 status];
    if (!v13
      || (id v14 = (void *)v13,
          [v10 status],
          id v15 = objc_claimAutoreleasedReturnValue(),
          int v16 = [v15 intValue],
          v15,
          v14,
          uint64_t v12 = v11,
          v16))
    {
      v17 = [v10 statusMessage];

      uint64_t v12 = v11;
      if (v17)
      {
        uint64_t v25 = *MEMORY[0x1E4F28568];
        v18 = [v10 statusMessage];
        v26[0] = v18;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];

        v20 = (void *)MEMORY[0x1E4F28C58];
        v21 = [v10 status];
        uint64_t v12 = objc_msgSend(v20, "errorWithDomain:code:userInfo:", @"com.apple.appleaccount", (int)objc_msgSend(v21, "intValue"), v19);
      }
    }
  }
  v22 = _AALogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    int v24 = v12;
    _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "loginDelegatesWithParameters calling completion handler with error %@", (uint8_t *)&v23, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)upgradeiCloudTermsIfNecessaryWithHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__AASetupAssistantService_upgradeiCloudTermsIfNecessaryWithHandler___block_invoke;
  v6[3] = &unk_1E5A484E8;
  id v7 = v4;
  id v5 = v4;
  [(AASetupAssistantService *)self upgradeiCloudTermsIfNecessaryWithCustomHeaders:0 handler:v6];
}

uint64_t __68__AASetupAssistantService_upgradeiCloudTermsIfNecessaryWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)upgradeiCloudTermsIfNecessaryWithCustomHeaders:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_account)
  {
    id v8 = dispatch_queue_create("upgradeTermsQueue", 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__AASetupAssistantService_upgradeiCloudTermsIfNecessaryWithCustomHeaders_handler___block_invoke;
    block[3] = &unk_1E5A484C0;
    void block[4] = self;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    id v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "Error: No AppleAccount set on AASetupAssistant Service", v10, 2u);
    }

    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.appleaccount" code:0 userInfo:0];
    (*((void (**)(id, void, void, NSObject *))v7 + 2))(v7, 0, 0, v8);
  }
}

void __82__AASetupAssistantService_upgradeiCloudTermsIfNecessaryWithCustomHeaders_handler___block_invoke(uint64_t a1)
{
  id v2 = [[AASetupAssistantTermsFetchRequest alloc] initWithAccount:*(void *)(*(void *)(a1 + 32) + 40)];
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    uint64_t v3 = [[AADeviceProvisioningSession alloc] initWithAccount:*(void *)(*(void *)(a1 + 32) + 40)];
    [(AADeviceProvisioningSession *)v3 addProvisioningInfoToAARequest:v2];
  }
  if (*(void *)(a1 + 40)) {
    -[AARequest setCustomHeaders:](v2, "setCustomHeaders:");
  }
  [(AARequest *)v2 setCookieStorage:*(void *)(*(void *)(a1 + 32) + 48)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __82__AASetupAssistantService_upgradeiCloudTermsIfNecessaryWithCustomHeaders_handler___block_invoke_2;
  v4[3] = &unk_1E5A481E8;
  id v5 = *(id *)(a1 + 48);
  [(AARequest *)v2 performRequestWithHandler:v4];
}

void __82__AASetupAssistantService_upgradeiCloudTermsIfNecessaryWithCustomHeaders_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 xmlUIData];
    id v9 = _AALogSystem();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "We got the new iCloud Terms from the server", (uint8_t *)&v12, 2u);
      }
    }
    else if (v10)
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "Fetching iCloud Terms failed with error: %@", (uint8_t *)&v12, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "Fetching iCloud Terms failed with error: %@", (uint8_t *)&v12, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)shouldPresentUpgradeFlowWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "shouldPresentUpgradeFlowWithCompletion start", buf, 2u);
  }

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = [(AASetupAssistantService *)self appleID];
  [v6 setValue:v7 forKey:@"apple-id"];

  id v8 = [(AASetupAssistantService *)self password];
  [v6 setValue:v8 forKey:@"password"];

  id v9 = +[AADeviceInfo appleIDClientIdentifier];
  [v6 setValue:v9 forKey:@"client-id"];

  BOOL v10 = [[AASetupAssistantUpgradeStatusRequest alloc] initWithAccount:self->_account];
  if (self->_account)
  {
    id v11 = [[AADeviceProvisioningSession alloc] initWithAccount:self->_account];
    [(AADeviceProvisioningSession *)v11 addProvisioningInfoToAARequest:v10];
  }
  [(AARequest *)v10 setCookieStorage:self->_cookieStorage];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__AASetupAssistantService_shouldPresentUpgradeFlowWithCompletion___block_invoke;
  v13[3] = &unk_1E5A481E8;
  id v14 = v4;
  id v12 = v4;
  [(AARequest *)v10 performRequestWithHandler:v13];
}

void __66__AASetupAssistantService_shouldPresentUpgradeFlowWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = v6;
    id v9 = [v8 upgradeStatus];
    BOOL v10 = _AALogSystem();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "We got the upgrade status from the server", (uint8_t *)&v14, 2u);
      }

      (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v9 BOOLValue], v7);
    }
    else
    {
      if (v11)
      {
        id v13 = [v8 responseDictionary];
        int v14 = 138412546;
        id v15 = v7;
        __int16 v16 = 2112;
        v17 = v13;
        _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "Fetching upgrade status failed with error: %@ response: %@", (uint8_t *)&v14, 0x16u);
      }
      (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1, v7);
    }
  }
  else
  {
    id v12 = _AALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "Fetching upgrade status got no response and error: %@", (uint8_t *)&v14, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)_signingSession
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!self->_signingSession) {
    goto LABEL_7;
  }
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:self->_signingSessionCreationDate];
  double v5 = v4;

  if (v5 > 540.0)
  {
    id v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "shared signing session expired. creating a new signing session.", buf, 2u);
    }

    signingSession = self->_signingSession;
    self->_signingSession = 0;
  }
  if (!self->_signingSession)
  {
LABEL_7:
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    signingSessionCreationDate = self->_signingSessionCreationDate;
    self->_signingSessionCreationDate = v8;

    BOOL v10 = +[AASetupAssistantService urlConfiguration];
    BOOL v11 = [v10 signingSessionCertURL];
    id v12 = +[AASetupAssistantService urlConfiguration];
    id v13 = [v12 signingSessionURL];
    id v22 = 0;
    int v14 = +[AASigningSession establishedSessionWithCertURL:v11 sessionURL:v13 error:&v22];
    id v15 = (AASigningSession *)v22;
    __int16 v16 = self->_signingSession;
    self->_signingSession = v14;

    if (v15)
    {
      v17 = _AALogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int v24 = v15;
        _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "Failed to create a shared signing session: %@", buf, 0xCu);
      }
    }
  }
  uint64_t v18 = _AALogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = self->_signingSession;
    *(_DWORD *)buf = 138412290;
    int v24 = v19;
    _os_log_impl(&dword_1A11D8000, v18, OS_LOG_TYPE_DEFAULT, "using shared signing session %@", buf, 0xCu);
  }

  v20 = self->_signingSession;

  return v20;
}

- (void)_doHSADeviceProvisioningWithDSID:(id)a3 data:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"AASetupAssistantService.m" lineNumber:479 description:@"No DSID passed"];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2 object:self file:@"AASetupAssistantService.m" lineNumber:480 description:@"No data passed"];

LABEL_3:
  BOOL v10 = [[AADeviceProvisioningSession alloc] initWithDSID:v7];
  [(AADeviceProvisioningSession *)v10 setCookieStorageRef:self->_cookieStorage];
  int v11 = [(AADeviceProvisioningSession *)v10 provisionDeviceWithData:v9];
  id v12 = _AALogSystem();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      __int16 v19 = 0;
      int v14 = "Device provisioning failed";
      id v15 = (uint8_t *)&v19;
LABEL_8:
      _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
    }
  }
  else if (v13)
  {
    __int16 v18 = 0;
    int v14 = "Device provisioning completed sucessfully";
    id v15 = (uint8_t *)&v18;
    goto LABEL_8;
  }
}

- (void)_doHSADeviceProvisioningSynchronizationWithDSID:(id)a3 data:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"AASetupAssistantService.m" lineNumber:496 description:@"No DSID passed"];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2 object:self file:@"AASetupAssistantService.m" lineNumber:497 description:@"No data passed"];

LABEL_3:
  BOOL v10 = [[AADeviceProvisioningSession alloc] initWithDSID:v7];
  [(AADeviceProvisioningSession *)v10 setCookieStorageRef:self->_cookieStorage];
  int v11 = [(AADeviceProvisioningSession *)v10 synchronizeProvisioningWithData:v9];
  id v12 = _AALogSystem();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      __int16 v19 = 0;
      int v14 = "Device provisioning sync failed";
      id v15 = (uint8_t *)&v19;
LABEL_8:
      _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
    }
  }
  else if (v13)
  {
    __int16 v18 = 0;
    int v14 = "Device provisioning sync completed successfully";
    id v15 = (uint8_t *)&v18;
    goto LABEL_8;
  }
}

- (void)_doHSADeviceReprovisioningWithDSID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"AASetupAssistantService.m" lineNumber:512 description:@"No DSID passed"];
  }
  id v6 = [[AADeviceProvisioningSession alloc] initWithDSID:v5];
  int v7 = [(AADeviceProvisioningSession *)v6 eraseProvisioning];
  if (v7)
  {
    int v8 = v7;
    id v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v8;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "Something went wrong when trying to erase the device provisioning: %d", (uint8_t *)v11, 8u);
    }
  }
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSString)emailChoice
{
  return self->_emailChoice;
}

- (void)setEmailChoice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingSessionCreationDate, 0);
  objc_storeStrong((id *)&self->_signingSession, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_emailChoice, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_appleID, 0);

  objc_storeStrong((id *)&self->_requesterQueue, 0);
}

@end