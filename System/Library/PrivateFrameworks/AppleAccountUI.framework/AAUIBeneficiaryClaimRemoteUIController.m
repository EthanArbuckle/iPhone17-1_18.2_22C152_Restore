@interface AAUIBeneficiaryClaimRemoteUIController
- (AAUIBeneficiaryClaimRemoteUIController)initWithAppleAccount:(id)a3 claimCode:(id)a4;
- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5;
- (id)_authController;
- (id)_grandSlamAccount;
- (id)remoteUIController:(id)a3 createPageWithName:(id)a4 attributes:(id)a5;
- (void)_addHeadersToRequest:(id)a3;
- (void)_cancelButtonForRemoteObjectModelWasTapped:(id)a3;
- (void)_getServerUILoadDelegateWithCompletion:(id)a3;
- (void)_handleObjectModelChangeForController:(id)a3 objectModel:(id)a4 isModal:(BOOL)a5;
- (void)presentRemoteUIFromNavigationController:(id)a3 withCompletion:(id)a4;
- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4;
- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4;
- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5;
@end

@implementation AAUIBeneficiaryClaimRemoteUIController

- (AAUIBeneficiaryClaimRemoteUIController)initWithAppleAccount:(id)a3 claimCode:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAUIBeneficiaryClaimRemoteUIController;
  v9 = [(AAUIBeneficiaryClaimRemoteUIController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appleAccount, a3);
    objc_storeStrong((id *)&v10->_claimCode, a4);
  }

  return v10;
}

- (void)presentRemoteUIFromNavigationController:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to load Remote UI for Starting Beneficiary Claim...", buf, 2u);
  }

  id v9 = objc_alloc(MEMORY[0x263F257A0]);
  v10 = [(AAUIBeneficiaryClaimRemoteUIController *)self _grandSlamAccount];
  v11 = [(ACAccount *)self->_appleAccount accountStore];
  objc_super v12 = (void *)[v9 initWithGrandSlamAccount:v10 accountStore:v11 claimCode:self->_claimCode];

  v13 = objc_alloc_init(AAUIRemoteUIController);
  benefeciaryClaimRemoteUIController = self->_benefeciaryClaimRemoteUIController;
  self->_benefeciaryClaimRemoteUIController = v13;

  [(AAUIRemoteUIController *)self->_benefeciaryClaimRemoteUIController setNavigationController:v7];
  [(AAUIRemoteUIController *)self->_benefeciaryClaimRemoteUIController setDelegate:self];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __97__AAUIBeneficiaryClaimRemoteUIController_presentRemoteUIFromNavigationController_withCompletion___block_invoke;
  v17[3] = &unk_263F92A20;
  id v18 = v12;
  id v19 = v6;
  v17[4] = self;
  id v15 = v12;
  id v16 = v6;
  [(AAUIBeneficiaryClaimRemoteUIController *)self _getServerUILoadDelegateWithCompletion:v17];
}

void __97__AAUIBeneficiaryClaimRemoteUIController_presentRemoteUIFromNavigationController_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(*(void *)(a1 + 32) + 48);
    id v8 = [*(id *)(a1 + 40) urlRequest];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __97__AAUIBeneficiaryClaimRemoteUIController_presentRemoteUIFromNavigationController_withCompletion___block_invoke_2;
    v10[3] = &unk_263F93178;
    v10[4] = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    [v7 loadRequest:v8 completion:v10];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v6);
    }
  }
}

void __97__AAUIBeneficiaryClaimRemoteUIController_presentRemoteUIFromNavigationController_withCompletion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 48);
    *(_DWORD *)buf = 138412802;
    uint64_t v15 = v7;
    __int16 v16 = 1024;
    int v17 = a2;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "%@ done loading request with success %d. Error: %@", buf, 0x1Cu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__AAUIBeneficiaryClaimRemoteUIController_presentRemoteUIFromNavigationController_withCompletion___block_invoke_35;
  block[3] = &unk_263F93908;
  id v8 = *(id *)(a1 + 40);
  char v13 = a2;
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __97__AAUIBeneficiaryClaimRemoteUIController_presentRemoteUIFromNavigationController_withCompletion___block_invoke_35(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  [(AKAppleIDServerResourceLoadDelegate *)self->_serverUILoadDelegate processResponse:a5];
  [(AAUIBeneficiaryClaimRemoteUIController *)self _addHeadersToRequest:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v8 redirectResponse];
    id v11 = v10;
    if (v10)
    {
      id v12 = [v10 allHeaderFields];
      char v13 = [v12 objectForKey:@"X-Apple-2SV-Authenticate"];

      if (v13) {
        objc_storeStrong((id *)&self->_secondaryToken, v13);
      }
    }
  }
  secondaryToken = self->_secondaryToken;
  if (secondaryToken) {
    [v9 setValue:secondaryToken forHTTPHeaderField:@"X-Apple-2SV-Authenticate"];
  }

  return 1;
}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  serverUILoadDelegate = self->_serverUILoadDelegate;
  id v6 = a4;
  [(AKAppleIDServerResourceLoadDelegate *)serverUILoadDelegate processResponse:v6];
  uint64_t v7 = [v6 allHeaderFields];

  id obj = [v7 objectForKey:@"X-Apple-2SV-Authenticate"];

  id v8 = obj;
  if (obj)
  {
    objc_storeStrong((id *)&self->_secondaryToken, obj);
    id v8 = obj;
  }
}

- (id)remoteUIController:(id)a3 createPageWithName:(id)a4 attributes:(id)a5
{
  id v5 = objc_alloc_init(AAUIRemotePage);
  [(AAUIRemotePage *)v5 setHidesBottomBarWhenPushed:1];
  return v5;
}

- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(AAUIBeneficiaryClaimRemoteUIController *)self _handleObjectModelChangeForController:v7 objectModel:v6 isModal:0];
  }
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(AAUIBeneficiaryClaimRemoteUIController *)self _handleObjectModelChangeForController:v9 objectModel:v8 isModal:v5];
  }
}

- (void)_handleObjectModelChangeForController:(id)a3 objectModel:(id)a4 isModal:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = _AAUILogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v9 identifier];
    *(_DWORD *)buf = 138412290;
    v25 = v11;
    _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "Handling an object model: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&self->_currentObjectModel, a4);
  id v12 = [v9 defaultPages];
  char v13 = [v12 firstObject];
  v14 = [v13 navigationItem];

  uint64_t v15 = [v14 leftBarButtonItems];
  LODWORD(v13) = [v15 count] == 0;

  if (v13)
  {
    if (v5)
    {
      id v17 = objc_alloc(MEMORY[0x263F824A8]);
      __int16 v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v19 = [v18 localizedStringForKey:@"CANCEL" value:&stru_26BD39CD8 table:@"Localizable"];
      uint64_t v20 = (void *)[v17 initWithTitle:v19 style:0 target:self action:sel__cancelButtonForRemoteObjectModelWasTapped_];
      [v14 setLeftBarButtonItem:v20];
    }
  }
  else
  {
    objc_initWeak((id *)buf, v8);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __100__AAUIBeneficiaryClaimRemoteUIController__handleObjectModelChangeForController_objectModel_isModal___block_invoke;
    v21[3] = &unk_263F942A8;
    objc_copyWeak(&v22, (id *)buf);
    uint64_t v16 = *MEMORY[0x263F28EC8];
    BOOL v23 = v5;
    [v8 setHandlerForButtonName:v16 handler:v21];
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
}

void __100__AAUIBeneficiaryClaimRemoteUIController__handleObjectModelChangeForController_objectModel_isModal___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F28EF0]];
    int v8 = [v7 isEqualToString:*MEMORY[0x263F28ED0]];

    if (v8)
    {
      if (*(unsigned char *)(a1 + 40))
      {
        id v9 = (id)[WeakRetained dismissObjectModelsAnimated:1 completion:0];
      }
      else
      {
        v10 = _AAUILogSystem();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v11 = 0;
          _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "Cancel action received for a non-modal flow", v11, 2u);
        }
      }
    }
  }
}

- (void)_addHeadersToRequest:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Appending headers to page request %@...", (uint8_t *)&v11, 0xCu);
  }

  id v6 = [(AAUIBeneficiaryClaimRemoteUIController *)self _grandSlamAccount];
  id v7 = [(ACAccount *)self->_appleAccount accountStore];
  int v8 = [v7 credentialForAccount:v6 serviceID:*MEMORY[0x263F256C8]];

  id v9 = [v8 token];
  [(AKAppleIDServerResourceLoadDelegate *)self->_serverUILoadDelegate setServiceToken:v9];
  [(AKAppleIDServerResourceLoadDelegate *)self->_serverUILoadDelegate signRequest:v4];
  v10 = objc_msgSend(v6, "aida_dsid");
  objc_msgSend(v4, "aa_addDeviceProvisioningInfoHeadersWithDSID:", v10);
}

- (void)_cancelButtonForRemoteObjectModelWasTapped:(id)a3
{
  id v3 = (id)[(AAUIRemoteUIController *)self->_benefeciaryClaimRemoteUIController dismissObjectModelsAnimated:1 completion:0];
}

- (id)_grandSlamAccount
{
  grandSlamAccount = self->_grandSlamAccount;
  if (!grandSlamAccount)
  {
    id v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Fetching grandslam account from apple account", buf, 2u);
    }

    id v5 = [(ACAccount *)self->_appleAccount accountStore];
    objc_msgSend(v5, "aida_accountForiCloudAccount:", self->_appleAccount);
    id v6 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_grandSlamAccount;
    self->_grandSlamAccount = v6;

    grandSlamAccount = self->_grandSlamAccount;
    if (!grandSlamAccount)
    {
      int v8 = _AAUILogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Could not fetch GrandSlam Account, we're destined for failure!", v10, 2u);
      }

      grandSlamAccount = self->_grandSlamAccount;
    }
  }
  return grandSlamAccount;
}

- (id)_authController
{
  authController = self->_authController;
  if (!authController)
  {
    id v4 = (AKAppleIDAuthenticationController *)objc_alloc_init(MEMORY[0x263F29118]);
    id v5 = self->_authController;
    self->_authController = v4;

    authController = self->_authController;
  }
  return authController;
}

- (void)_getServerUILoadDelegateWithCompletion:(id)a3
{
  id v4 = (void (**)(id, AKAppleIDServerResourceLoadDelegate *, void))a3;
  serverUILoadDelegate = self->_serverUILoadDelegate;
  id v6 = _AAUILogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (serverUILoadDelegate)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "AKAppleIDServerResourceLoadDelegate cache available", buf, 2u);
    }

    if (v4) {
      v4[2](v4, self->_serverUILoadDelegate, 0);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Starting to fetch AKAppleIDServerResourceLoadDelegate", buf, 2u);
    }

    int v8 = [(AAUIBeneficiaryClaimRemoteUIController *)self _grandSlamAccount];
    id v9 = objc_alloc_init(MEMORY[0x263F29110]);
    v10 = objc_msgSend(v8, "aida_alternateDSID");
    [v9 setAltDSID:v10];

    [v9 setAnticipateEscrowAttempt:1];
    int v11 = [(AAUIBeneficiaryClaimRemoteUIController *)self _authController];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __81__AAUIBeneficiaryClaimRemoteUIController__getServerUILoadDelegateWithCompletion___block_invoke;
    v12[3] = &unk_263F942F8;
    v12[4] = self;
    uint64_t v13 = v4;
    [v11 getServerUILoadDelegateWithContext:v9 completion:v12];
  }
}

void __81__AAUIBeneficiaryClaimRemoteUIController__getServerUILoadDelegateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    BOOL v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "Error! Unable to get AKAppleIDServerResourceLoadDelegate. %@", buf, 0xCu);
    }
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __81__AAUIBeneficiaryClaimRemoteUIController__getServerUILoadDelegateWithCompletion___block_invoke_56;
  v12[3] = &unk_263F942D0;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v8;
  id v15 = v6;
  id v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

uint64_t __81__AAUIBeneficiaryClaimRemoteUIController__getServerUILoadDelegateWithCompletion___block_invoke_56(void *a1)
{
  v2 = (void *)a1[4];
  if (v2) {
    objc_storeStrong((id *)(a1[5] + 24), v2);
  }
  uint64_t result = a1[7];
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_claimCode, 0);
  objc_storeStrong((id *)&self->_currentObjectModel, 0);
  objc_storeStrong((id *)&self->_benefeciaryClaimRemoteUIController, 0);
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_secondaryToken, 0);
  objc_storeStrong((id *)&self->_serverUILoadDelegate, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_grandSlamAccount, 0);
}

@end