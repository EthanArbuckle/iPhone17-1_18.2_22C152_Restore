@interface FAFamilyEligibilityRequester
- (BOOL)allowsAuthenticationPrompt;
- (FAFamilyEligibilityRequester)init;
- (FAFamilyEligibilityRequester)initWithAccountManager:(id)a3;
- (id)_accountStore;
- (id)_appleAccount;
- (id)_grandSlamSigner;
- (void)requestFamilyEligibilityWithCompletion:(id)a3;
- (void)setAllowsAuthenticationPrompt:(BOOL)a3;
@end

@implementation FAFamilyEligibilityRequester

- (FAFamilyEligibilityRequester)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FAFamilyEligibilityRequester;
  v6 = [(FAFamilyEligibilityRequester *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    v7->_allowsAuthenticationPrompt = 0;
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    networkActivityQueue = v7->_networkActivityQueue;
    v7->_networkActivityQueue = v8;

    v10 = v7->_networkActivityQueue;
    v11 = dispatch_get_global_queue(25, 0);
    [(NSOperationQueue *)v10 setUnderlyingQueue:v11];
  }
  return v7;
}

- (FAFamilyEligibilityRequester)init
{
  return 0;
}

- (void)requestFamilyEligibilityWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke;
  aBlock[3] = &unk_264348B20;
  aBlock[4] = self;
  id v5 = _Block_copy(aBlock);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_2;
  v22[3] = &unk_264348B70;
  id v6 = v4;
  id v23 = v6;
  v7 = _Block_copy(v22);
  v8 = [(FAFamilyEligibilityRequester *)self _appleAccount];

  if (v8)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_29;
    v20[3] = &unk_264348B98;
    id v9 = v7;
    id v21 = v9;
    v10 = _Block_copy(v20);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_31;
    v16[3] = &unk_264348C10;
    v16[4] = self;
    id v11 = v5;
    id v17 = v11;
    id v18 = v10;
    id v19 = v9;
    id v12 = v10;
    objc_super v13 = _Block_copy(v16);
    (*((void (**)(id, void *))v11 + 2))(v11, v13);

    v14 = v21;
  }
  else
  {
    v15 = _FALogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[FAFamilyEligibilityRequester requestFamilyEligibilityWithCompletion:](v15);
    }

    v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F3BDB8] code:-1004 userInfo:0];
    (*((void (**)(void *, void, void *))v7 + 2))(v7, 0, v14);
  }
}

void __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F25858];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [*(id *)(a1 + 32) _grandSlamSigner];
  id v10 = (id)[v5 initWithGrandSlamSigner:v6];

  v7 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  v8 = objc_msgSend(v7, "ams_activeiTunesAccount");
  [v10 setITunesAccount:v8];

  id v9 = (void *)[objc_alloc(MEMORY[0x263F25938]) initWithRequest:v10 handler:v4];
  [*(id *)(*(void *)(a1 + 32) + 24) addOperation:v9];
}

void __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_3;
  block[3] = &unk_264348B48;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_29(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_2189F0000, v4, OS_LOG_TYPE_DEFAULT, "Eligibility Callback", v7, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v3)
  {
    id v6 = [v3 error];
    (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v3, v6);
  }
  else
  {
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F3BDB8] code:-1002 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
  }
}

void __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_31(id *a1, void *a2)
{
  v19[3] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 statusCode] == 401)
  {
    id v4 = _FALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2189F0000, v4, OS_LOG_TYPE_DEFAULT, "Family eligibility check request returned 401. We need to re-auth...", buf, 2u);
    }

    v18[0] = *MEMORY[0x263EFB390];
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1[4], "allowsAuthenticationPrompt"));
    v19[0] = v5;
    v18[1] = *MEMORY[0x263EFB388];
    id v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a1[4], "allowsAuthenticationPrompt") ^ 1);
    v19[1] = v6;
    v18[2] = *MEMORY[0x263EFB380];
    uint64_t v17 = *MEMORY[0x263F256D0];
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    v19[2] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

    id v9 = [a1[4] _accountStore];
    id v10 = [a1[4] _appleAccount];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_35;
    v11[3] = &unk_264348BE8;
    id v13 = a1[5];
    id v14 = a1[6];
    id v15 = a1[7];
    id v12 = v3;
    [v9 renewCredentialsForAccount:v10 options:v8 completion:v11];
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_35(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _FALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_2189F0000, v6, OS_LOG_TYPE_DEFAULT, "Result of renewing credentials for family eligibility check request: %ld. Error: %@", buf, 0x16u);
  }

  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_36;
    v7[3] = &unk_264348BC0;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

uint64_t __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (id)_grandSlamSigner
{
  grandSlamSigner = self->_grandSlamSigner;
  if (!grandSlamSigner)
  {
    id v4 = [(AIDAAccountManager *)self->_accountManager aidaAccountForService:*MEMORY[0x263F26D28]];
    id v5 = objc_alloc(MEMORY[0x263F25878]);
    id v6 = [(AIDAAccountManager *)self->_accountManager accountStore];
    id v7 = (AAGrandSlamSigner *)[v5 initWithAccountStore:v6 grandSlamAccount:v4 appTokenID:*MEMORY[0x263F256D0]];
    id v8 = self->_grandSlamSigner;
    self->_grandSlamSigner = v7;

    grandSlamSigner = self->_grandSlamSigner;
  }
  return grandSlamSigner;
}

- (id)_accountStore
{
  return (id)[(AIDAAccountManager *)self->_accountManager accountStore];
}

- (id)_appleAccount
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v3;
}

- (BOOL)allowsAuthenticationPrompt
{
  return self->_allowsAuthenticationPrompt;
}

- (void)setAllowsAuthenticationPrompt:(BOOL)a3
{
  self->_allowsAuthenticationPrompt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkActivityQueue, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_grandSlamSigner, 0);
}

- (void)requestFamilyEligibilityWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2189F0000, log, OS_LOG_TYPE_ERROR, "No Primary Apple Account provided, cannot check family eligibility", v1, 2u);
}

@end