@interface AADeviceList
- (AADeviceList)initWithAccountManager:(id)a3;
- (AADeviceListDelegate)delegate;
- (NSArray)devices;
- (NSError)loadError;
- (id)_accountStore;
- (id)_aidaAccount;
- (id)_appleAccount;
- (id)_authController;
- (void)_createRequestForAccount:(id)a3 requestHandler:(id)a4;
- (void)_loadDeviceList;
- (void)_loadRequest:(id)a3 responseHandler:(id)a4;
- (void)_renewCredentials;
- (void)_setDeviceList:(id)a3 loadError:(id)a4;
- (void)refreshDeviceList;
- (void)setDelegate:(id)a3;
@end

@implementation AADeviceList

- (AADeviceList)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AADeviceList;
  v6 = [(AADeviceList *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    [(AADeviceList *)v7 refreshDeviceList];
  }

  return v7;
}

- (void)refreshDeviceList
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A11D8000, log, OS_LOG_TYPE_ERROR, "Failed to load device list - no primary Apple Account", v1, 2u);
}

- (id)_accountStore
{
  return (id)[(AIDAAccountManager *)self->_accountManager accountStore];
}

- (id)_appleAccount
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F4D8E8]];

  return v3;
}

- (id)_aidaAccount
{
  v3 = [(AADeviceList *)self _accountStore];
  v4 = [(AADeviceList *)self _appleAccount];
  id v5 = objc_msgSend(v3, "aida_accountForiCloudAccount:", v4);

  return v5;
}

- (id)_authController
{
  authController = self->_authController;
  if (!authController)
  {
    v4 = (AKAppleIDAuthenticationController *)objc_alloc_init(MEMORY[0x1E4F4EF68]);
    id v5 = self->_authController;
    self->_authController = v4;

    authController = self->_authController;
  }

  return authController;
}

- (void)_loadDeviceList
{
  v3 = [(AADeviceList *)self _appleAccount];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__AADeviceList__loadDeviceList__block_invoke;
  v4[3] = &unk_1E5A49190;
  v4[4] = self;
  [(AADeviceList *)self _createRequestForAccount:v3 requestHandler:v4];
}

uint64_t __31__AADeviceList__loadDeviceList__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (a3)
  {
    return [v3 _setDeviceList:0 loadError:a3];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __31__AADeviceList__loadDeviceList__block_invoke_2;
    v5[3] = &unk_1E5A49168;
    v5[4] = v3;
    return [v3 _loadRequest:a2 responseHandler:v5];
  }
}

void __31__AADeviceList__loadDeviceList__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) _setDeviceList:0 loadError:v5];
  }
  else if (v8)
  {
    v6 = *(void **)(a1 + 32);
    v7 = [v8 devices];
    [v6 _setDeviceList:v7 loadError:0];
  }
}

- (void)_setDeviceList:(id)a3 loadError:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  id v8 = self->_devices;
  objc_storeStrong((id *)&self->_devices, a3);
  objc_storeStrong((id *)&self->_loadError, a4);
  if (v10 || !v8)
  {
    objc_super v9 = [(AADeviceList *)self delegate];
    [v9 deviceListModified:v10];
  }
}

- (void)_createRequestForAccount:(id)a3 requestHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AADeviceListLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "Fetching the URL bag", buf, 2u);
  }

  objc_super v9 = [MEMORY[0x1E4F4F0C8] sharedBag];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke;
  v12[3] = &unk_1E5A48510;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 requestNewURLBagIfNecessaryWithCompletion:v12];
}

void __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke(id *a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AADeviceListLogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "Successfully fetched the URL bag", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke_cold_1();
  }

  id v8 = [MEMORY[0x1E4F4F0C8] sharedBag];
  objc_super v9 = [v8 trustedDevicesSummaryURL];

  id v10 = [MEMORY[0x1E4F18D50] requestWithURL:v9];
  id v11 = objc_alloc_init(MEMORY[0x1E4F4EF60]);
  v12 = objc_msgSend(a1[4], "aida_alternateDSID");
  [v11 setAltDSID:v12];

  id v13 = _AADeviceListLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "Fetching the server resource load delegate", buf, 2u);
  }

  v14 = [a1[5] _authController];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke_31;
  v17[3] = &unk_1E5A491E0;
  id v15 = a1[6];
  id v18 = v10;
  id v19 = v15;
  id v16 = v10;
  [v14 getServerUILoadDelegateWithContext:v11 completion:v17];
}

void __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _AADeviceListLogSystem();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "Successfully fetched the server resource load delegate", buf, 2u);
    }

    objc_super v9 = _AADeviceListLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "Signing the device list request", buf, 2u);
    }

    id v10 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke_32;
    v12[3] = &unk_1E5A491B8;
    id v13 = v10;
    id v14 = *(id *)(a1 + 40);
    [v5 signRequest:v13 withCompletionHandler:v12];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke_31_cold_1();
    }

    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v6);
    }
  }
}

void __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke_32(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AADeviceListLogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "Successfully signed the device list request", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke_32_cold_1();
  }

  id v8 = [*(id *)(a1 + 32) allHTTPHeaderFields];
  [v8 setValue:@"application/json" forKey:@"Accept"];
  [*(id *)(a1 + 32) setAllHTTPHeaderFields:v8];
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void, void))(v9 + 16))(v9, *(void *)(a1 + 32), 0);
  }
}

- (void)_loadRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__AADeviceList__loadRequest_responseHandler___block_invoke;
  v14[3] = &unk_1E5A49208;
  v14[4] = self;
  id v15 = v7;
  id v8 = v7;
  uint64_t v9 = (void *)MEMORY[0x1A622F430](v14);
  id v10 = _AADeviceListLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "Fetching the device list from the server", v13, 2u);
  }

  uint64_t v11 = [MEMORY[0x1E4F4F0D0] sharedAnisetteFreeURLSession];
  id v12 = (id)[v11 beginDataTaskWithRequest:v6 completionHandler:v9];
}

void __45__AADeviceList__loadRequest_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = _AADeviceListLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __45__AADeviceList__loadRequest_responseHandler___block_invoke_cold_3();
    }
    goto LABEL_17;
  }
  id v10 = v8;
  uint64_t v11 = [v10 statusCode];
  if (v11 == 401)
  {
    id v15 = _AADeviceListLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "Failed to fetch the device list from the server - need to renew credentials", v19, 2u);
    }

    [*(id *)(a1 + 32) _renewCredentials];
    goto LABEL_17;
  }
  if (v11 != 200)
  {
    id v16 = _AADeviceListLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __45__AADeviceList__loadRequest_responseHandler___block_invoke_cold_1(v10);
    }

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", -4402);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_17:
    id v12 = 0;
    goto LABEL_18;
  }
  id v12 = [[AATrustedDeviceListResponse alloc] initWithHTTPResponse:v10 data:v7];
  id v13 = _AADeviceListLogSystem();
  id v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "Successfully fetched the device list from the server", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __45__AADeviceList__loadRequest_responseHandler___block_invoke_cold_2(v14);
    }

    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", -4402);

    id v12 = 0;
    id v9 = (id)v18;
  }
LABEL_18:

  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, AATrustedDeviceListResponse *, id))(v17 + 16))(v17, v12, v9);
  }
}

- (void)_renewCredentials
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A11D8000, log, OS_LOG_TYPE_FAULT, "Failed to renew credentials for AIDA account - no AIDA account", v1, 2u);
}

void __33__AADeviceList__renewCredentials__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = _AADeviceListLogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __33__AADeviceList__renewCredentials__block_invoke_cold_1();
    }

    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:underlyingError:", -3, v5);
    [*(id *)(a1 + 32) _setDeviceList:0 loadError:v8];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "Successfully renewed credentials for AIDA account", buf, 2u);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__AADeviceList__renewCredentials__block_invoke_44;
    block[3] = &unk_1E5A48358;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __33__AADeviceList__renewCredentials__block_invoke_44(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadDeviceList];
}

- (NSArray)devices
{
  return self->_devices;
}

- (NSError)loadError
{
  return self->_loadError;
}

- (AADeviceListDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AADeviceListDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadError, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);

  objc_storeStrong((id *)&self->_authController, 0);
}

void __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to fetch the URL bag with error: %@", v2, v3, v4, v5, v6);
}

void __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke_31_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to fetch the server resource load delegate with error: %@", v2, v3, v4, v5, v6);
}

void __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke_32_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to sign the device list request with error: %@", v2, v3, v4, v5, v6);
}

void __45__AADeviceList__loadRequest_responseHandler___block_invoke_cold_1(void *a1)
{
  [a1 statusCode];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1A11D8000, v1, v2, "Failed to fetch the device list from the server - unexpected status code: %ld", v3, v4, v5, v6, v7);
}

void __45__AADeviceList__loadRequest_responseHandler___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A11D8000, log, OS_LOG_TYPE_ERROR, "Failed to fetch the device list from the server - invalid server response", v1, 2u);
}

void __45__AADeviceList__loadRequest_responseHandler___block_invoke_cold_3()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1A11D8000, v2, v3, "Failed to fetch the device list from the server - unexpected response class: %@", v4, v5, v6, v7, v8);
}

void __33__AADeviceList__renewCredentials__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to renew credentials for AIDA account with error: %@", v2, v3, v4, v5, v6);
}

@end