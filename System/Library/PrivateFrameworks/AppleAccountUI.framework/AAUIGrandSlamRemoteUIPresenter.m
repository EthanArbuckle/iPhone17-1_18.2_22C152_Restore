@interface AAUIGrandSlamRemoteUIPresenter
- (AAUIGrandSlamRemoteUIPresenter)initWithAccountManager:(id)a3 hookType:(unint64_t)a4 presenter:(id)a5;
- (AAUIGrandSlamRemoteUIPresenter)initWithAccountManager:(id)a3 hookType:(unint64_t)a4 presenter:(id)a5 cdpContext:(id)a6;
- (AAUIGrandSlamRemoteUIPresenter)initWithAccountManager:(id)a3 presenter:(id)a4;
- (AAUIGrandSlamRemoteUIPresenter)initWithAccountManager:(id)a3 presenter:(id)a4 hooks:(id)a5;
- (AAUIGrandSlamRemoteUIPresenterDelegate)delegate;
- (BOOL)_checkFlowEndForResponse:(id)a3;
- (BOOL)_isAuthError:(id)a3;
- (BOOL)isModalInPresentation;
- (BOOL)showCancelInModalPresentation;
- (UIViewController)presenter;
- (id)_accountStore;
- (id)_appleAccount;
- (id)_authContext;
- (id)_grandSlamAccount;
- (id)_remoteUICancelButtonForPage:(id)a3;
- (id)remoteUIController:(id)a3 createPageWithName:(id)a4 attributes:(id)a5;
- (void)_addHeadersToRequest:(id)a3 withCompletion:(id)a4;
- (void)_addRemoteUIEventHandler;
- (void)_getServerUILoadDelegateWithCompletion:(id)a3;
- (void)loadRequest:(id)a3;
- (void)loadRequest:(id)a3 completion:(id)a4;
- (void)remoteUIController:(id)a3 didDismissModalNavigationWithObjectModels:(id)a4;
- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5;
- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4;
- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6;
- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4;
- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)remoteUIControllerDidDismiss:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setModalInPresentation:(BOOL)a3;
- (void)setPresenter:(id)a3;
- (void)setShowCancelInModalPresentation:(BOOL)a3;
@end

@implementation AAUIGrandSlamRemoteUIPresenter

- (AAUIGrandSlamRemoteUIPresenter)initWithAccountManager:(id)a3 presenter:(id)a4
{
  return [(AAUIGrandSlamRemoteUIPresenter *)self initWithAccountManager:a3 hookType:0 presenter:a4];
}

- (AAUIGrandSlamRemoteUIPresenter)initWithAccountManager:(id)a3 hookType:(unint64_t)a4 presenter:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = objc_opt_new();
  v11 = [v10 hooksFor:a4 accountManager:v9];
  v12 = [(AAUIGrandSlamRemoteUIPresenter *)self initWithAccountManager:v9 presenter:v8 hooks:v11];

  return v12;
}

- (AAUIGrandSlamRemoteUIPresenter)initWithAccountManager:(id)a3 hookType:(unint64_t)a4 presenter:(id)a5 cdpContext:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = objc_opt_new();
  v14 = [v13 hooksFor:a4 accountManager:v12 cdpContext:v10];

  v15 = [(AAUIGrandSlamRemoteUIPresenter *)self initWithAccountManager:v12 presenter:v11 hooks:v14];
  return v15;
}

- (AAUIGrandSlamRemoteUIPresenter)initWithAccountManager:(id)a3 presenter:(id)a4 hooks:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AAUIGrandSlamRemoteUIPresenter;
  id v12 = [(AAUIGrandSlamRemoteUIPresenter *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountManager, a3);
    objc_storeWeak((id *)&v13->_presenter, v10);
    v14 = (RemoteUIController *)objc_alloc_init(MEMORY[0x263F637E8]);
    remoteUIController = v13->_remoteUIController;
    v13->_remoteUIController = v14;

    [(RemoteUIController *)v13->_remoteUIController setDelegate:v13];
    [(AAUIGrandSlamRemoteUIPresenter *)v13 _addRemoteUIEventHandler];
    if (v11)
    {
      uint64_t v16 = [objc_alloc(MEMORY[0x263F637C0]) initWithRemoteUIController:v13->_remoteUIController hooks:v11];
      serverUIHookHandler = v13->_serverUIHookHandler;
      v13->_serverUIHookHandler = (RUIServerHookHandler *)v16;

      v18 = objc_alloc_init(AAUIServerHookHandlerDelegate);
      serverUIHookHandlerDelegate = v13->_serverUIHookHandlerDelegate;
      v13->_serverUIHookHandlerDelegate = v18;

      [(RUIServerHookHandler *)v13->_serverUIHookHandler setDelegate:v13->_serverUIHookHandlerDelegate];
    }
  }

  return v13;
}

- (void)loadRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__AAUIGrandSlamRemoteUIPresenter_loadRequest___block_invoke;
  v6[3] = &unk_263F929D0;
  id v7 = v4;
  id v5 = v4;
  [(AAUIGrandSlamRemoteUIPresenter *)self loadRequest:v5 completion:v6];
}

void __46__AAUIGrandSlamRemoteUIPresenter_loadRequest___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) URL];
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "RemoteUI request load success for %@", (uint8_t *)&v9, 0xCu);
    }
  }
  if (v5)
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46__AAUIGrandSlamRemoteUIPresenter_loadRequest___block_invoke_cold_1(a1, (uint64_t)v5, v8);
    }
  }
}

- (void)loadRequest:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!self->_currentRequest)
  {
    objc_storeStrong((id *)&self->_currentRequest, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    id v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v7;
      __int16 v15 = 2112;
      id v16 = WeakRetained;
      _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "AAUIGrandSlamRemoteUIPresenter loading request %@ on presenter %@ ", (uint8_t *)&v13, 0x16u);
    }

    [(RemoteUIController *)self->_remoteUIController setHostViewController:WeakRetained];
    if (![(AAUIGrandSlamRemoteUIPresenter *)self isModalInPresentation])
    {
      uint64_t v11 = [WeakRetained navigationController];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = WeakRetained;

        uint64_t v11 = v12;
      }
      [(RemoteUIController *)self->_remoteUIController setNavigationController:v11];
    }
    [(RemoteUIController *)self->_remoteUIController loadRequest:v7 completion:v8];
  }
}

- (id)_appleAccount
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v3;
}

- (id)_accountStore
{
  return (id)[(AIDAAccountManager *)self->_accountManager accountStore];
}

- (id)_grandSlamAccount
{
  grandSlamAccount = self->_grandSlamAccount;
  if (!grandSlamAccount)
  {
    id v4 = [(AAUIGrandSlamRemoteUIPresenter *)self _appleAccount];

    if (v4)
    {
      id v5 = [(AAUIGrandSlamRemoteUIPresenter *)self _accountStore];
      v6 = [(AAUIGrandSlamRemoteUIPresenter *)self _appleAccount];
      objc_msgSend(v5, "aida_accountForiCloudAccount:", v6);
      id v7 = (ACAccount *)objc_claimAutoreleasedReturnValue();
      id v8 = self->_grandSlamAccount;
      self->_grandSlamAccount = v7;
    }
    grandSlamAccount = self->_grandSlamAccount;
    if (!grandSlamAccount)
    {
      int v9 = _AAUILogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Could not fetch GrandSlam Account", v11, 2u);
      }

      grandSlamAccount = self->_grandSlamAccount;
    }
  }
  return grandSlamAccount;
}

- (id)_authContext
{
  id v3 = objc_alloc_init(MEMORY[0x263F29110]);
  [v3 setVerifyCredentialReason:3];
  id v4 = [(AAUIGrandSlamRemoteUIPresenter *)self _appleAccount];
  id v5 = objc_msgSend(v4, "aa_altDSID");
  [v3 setAltDSID:v5];

  return v3;
}

- (id)_remoteUICancelButtonForPage:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v8 = @"label";
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"Cancel" value:&stru_26BD39CD8 table:@"Localizable"];
  v9[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  v6 = (void *)[objc_alloc(MEMORY[0x263F63778]) initWithAttributes:v5 parent:0];
  return v6;
}

- (void)_addRemoteUIEventHandler
{
  objc_initWeak(&location, self);
  remoteUIController = self->_remoteUIController;
  uint64_t v4 = *MEMORY[0x263F28EC8];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__AAUIGrandSlamRemoteUIPresenter__addRemoteUIEventHandler__block_invoke;
  v5[3] = &unk_263F929F8;
  objc_copyWeak(&v6, &location);
  [(RemoteUIController *)remoteUIController setHandlerForElementName:v4 handler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__AAUIGrandSlamRemoteUIPresenter__addRemoteUIEventHandler__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F28EF0]];
  if ([v8 isEqualToString:*MEMORY[0x263F28ED0]])
  {
    int v9 = [v6 visiblePage];
    [v9 dismissIfPresentedWithCompletion:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v11 = [WeakRetained delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    int v13 = _AAUILogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [WeakRetained delegate];
      int v16 = 138412290;
      uint64_t v17 = v14;
      _os_log_impl(&dword_209754000, v13, OS_LOG_TYPE_DEFAULT, "Calling remoteUIDidHandleButton for delegate %@", (uint8_t *)&v16, 0xCu);
    }
    __int16 v15 = [WeakRetained delegate];
    [v15 remoteUIDidHandleButton:v7];
  }
}

- (void)_addHeadersToRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__AAUIGrandSlamRemoteUIPresenter__addHeadersToRequest_withCompletion___block_invoke;
  v10[3] = &unk_263F92A20;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(AAUIGrandSlamRemoteUIPresenter *)self _getServerUILoadDelegateWithCompletion:v10];
}

void __70__AAUIGrandSlamRemoteUIPresenter__addHeadersToRequest_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v5);
    }
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) _grandSlamAccount];
    id v8 = [*(id *)(a1 + 32) _accountStore];
    id v9 = [v8 credentialForAccount:v7 serviceID:*MEMORY[0x263F256C8]];

    id v10 = [v9 token];
    [*(id *)(*(void *)(a1 + 32) + 32) setServiceToken:v10];
    [*(id *)(*(void *)(a1 + 32) + 32) signRequest:*(void *)(a1 + 40)];
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = objc_msgSend(v7, "aida_dsid");
    objc_msgSend(v11, "aa_addDeviceProvisioningInfoHeadersWithDSID:", v12);

    int v13 = [*(id *)(a1 + 32) delegate];
    LOBYTE(v12) = objc_opt_respondsToSelector();

    if (v12)
    {
      id v14 = [*(id *)(a1 + 32) delegate];
      [v14 remoteUIWillLoadRequest:*(void *)(a1 + 40)];
    }
    uint64_t v15 = *(void *)(a1 + 48);
    if (v15) {
      (*(void (**)(uint64_t, uint64_t, void))(v15 + 16))(v15, 1, 0);
    }
  }
}

- (void)_getServerUILoadDelegateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  resourceLoadDelegate = self->_resourceLoadDelegate;
  if (resourceLoadDelegate)
  {
    (*((void (**)(id, AKAppleIDServerResourceLoadDelegate *, void))v4 + 2))(v4, resourceLoadDelegate, 0);
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x263F29118]);
    id v8 = [(AAUIGrandSlamRemoteUIPresenter *)self _authContext];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    void v9[2] = __73__AAUIGrandSlamRemoteUIPresenter__getServerUILoadDelegateWithCompletion___block_invoke;
    v9[3] = &unk_263F92A48;
    v9[4] = self;
    id v10 = v5;
    [v7 getServerUILoadDelegateWithContext:v8 completion:v9];
  }
}

void __73__AAUIGrandSlamRemoteUIPresenter__getServerUILoadDelegateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __73__AAUIGrandSlamRemoteUIPresenter__getServerUILoadDelegateWithCompletion___block_invoke_cold_1((uint64_t)v7, v8);
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    [v6 setShouldSendSigningHeaders:1];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a2);
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

- (BOOL)_isAuthError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_11;
  }
  uint64_t v5 = [v3 userInfo];
  if (!v5) {
    goto LABEL_11;
  }
  id v6 = (void *)v5;
  id v7 = [v4 domain];

  if (!v7) {
    goto LABEL_11;
  }
  id v8 = [v4 domain];
  char v9 = [v8 isEqualToString:*MEMORY[0x263F63820]];
  if ((v9 & 1) == 0)
  {
    id v7 = [v4 domain];
    if (([v7 isEqualToString:*MEMORY[0x263F63830]] & 1) == 0)
    {

LABEL_11:
      BOOL v13 = 0;
      goto LABEL_12;
    }
  }
  id v10 = [v4 userInfo];
  id v11 = [v10 objectForKeyedSubscript:@"statusCode"];
  uint64_t v12 = [v11 integerValue];

  if ((v9 & 1) == 0) {
  if (v12 != 401)
  }
    goto LABEL_11;
  BOOL v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)_checkFlowEndForResponse:(id)a3
{
  id v3 = [a3 allHeaderFields];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F28EE8]];
  if ([v4 isEqualToString:*MEMORY[0x263F28EE0]]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEqualToString:*MEMORY[0x263F28ED8]];
  }

  return v5;
}

- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6
{
  resourceLoadDelegate = self->_resourceLoadDelegate;
  id v10 = a6;
  id v11 = a4;
  [(AKAppleIDServerResourceLoadDelegate *)resourceLoadDelegate processResponse:a5];
  [(AAUIGrandSlamRemoteUIPresenter *)self _addHeadersToRequest:v11 withCompletion:v10];
}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v30 = self;
    __int16 v31 = 2112;
    id v32 = v6;
    __int16 v33 = 2112;
    id v34 = v7;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "%@: Controller (%@) did receive HTTP response (%@)", buf, 0x20u);
  }

  [(AKAppleIDServerResourceLoadDelegate *)self->_resourceLoadDelegate processResponse:v7];
  [(RUIServerHookHandler *)self->_serverUIHookHandler processServerResponse:v7];
  self->_isEndOfFlow = [(AAUIGrandSlamRemoteUIPresenter *)self _checkFlowEndForResponse:v7];
  char v9 = self->_currentRequest;
  if ([v7 statusCode] == 401)
  {
    id v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v7 URL];
      *(_DWORD *)buf = 138412290;
      v30 = v11;
      _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "Remote UI request returned 401 for %@", buf, 0xCu);
    }
    uint64_t v12 = *MEMORY[0x263EFB390];
    v28[0] = MEMORY[0x263EFFA88];
    uint64_t v13 = *MEMORY[0x263EFB380];
    v27[0] = v12;
    v27[1] = v13;
    uint64_t v26 = *MEMORY[0x263F256C8];
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
    v28[1] = v14;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

    id v16 = [(AAUIGrandSlamRemoteUIPresenter *)self _accountStore];
    uint64_t v17 = [(AAUIGrandSlamRemoteUIPresenter *)self _grandSlamAccount];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __76__AAUIGrandSlamRemoteUIPresenter_remoteUIController_didReceiveHTTPResponse___block_invoke;
    v21[3] = &unk_263F92A90;
    id v22 = v7;
    v23 = self;
    v24 = v9;
    id v25 = v6;
    [v16 renewCredentialsForAccount:v17 options:v15 completion:v21];

    goto LABEL_9;
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    uint64_t v15 = objc_loadWeakRetained((id *)p_delegate);
    [v15 remoteUIDidReceiveHTTPResponse:v7];
LABEL_9:
  }
}

void __76__AAUIGrandSlamRemoteUIPresenter_remoteUIController_didReceiveHTTPResponse___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 32) URL];
    int v13 = 138412802;
    id v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = a2;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "renewing account token for request URL %@ with result %ld error %@", (uint8_t *)&v13, 0x20u);
  }
  if (a2)
  {
    if (a2 == 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 72));

      if (WeakRetained)
      {
        if (!v5)
        {
          char v9 = (void *)MEMORY[0x263F087E8];
          uint64_t v10 = -1;
          goto LABEL_13;
        }
LABEL_14:
        id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 72));
        [v12 remoteUIRequestComplete:*(void *)(a1 + 48) error:v5];
      }
    }
    else if (a2 == 2)
    {
      id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 72));

      if (v8)
      {
        if (!v5)
        {
          char v9 = (void *)MEMORY[0x263F087E8];
          uint64_t v10 = 0;
LABEL_13:
          objc_msgSend(v9, "aa_errorWithCode:", v10);
          id v5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
  }
  else
  {
    [*(id *)(a1 + 56) loadRequest:*(void *)(a1 + 48) completion:&__block_literal_global_3];
  }
}

void __76__AAUIGrandSlamRemoteUIPresenter_remoteUIController_didReceiveHTTPResponse___block_invoke_64(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"NO";
    if (a2) {
      id v6 = @"YES";
    }
    int v7 = 138412546;
    id v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "RemoteUI Retry request completed with success: %@, error: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = _AAUILogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v8 URL];
    int v16 = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Remote UI load finish with error %@ request %@", (uint8_t *)&v16, 0x16u);
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    int v13 = WeakRetained;
    BOOL v14 = [(AAUIGrandSlamRemoteUIPresenter *)self _isAuthError:v7];

    if (v8)
    {
      if (!v14)
      {
        id v15 = objc_loadWeakRetained((id *)p_delegate);
        [v15 remoteUIRequestComplete:v8 error:v7];
      }
    }
  }
}

- (id)remoteUIController:(id)a3 createPageWithName:(id)a4 attributes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_alloc_init(AAUIRemotePage);
  [(AAUIRemotePage *)v11 setHidesBottomBarWhenPushed:1];
  if ([(AAUIGrandSlamRemoteUIPresenter *)self isModalInPresentation])
  {
    if ([(AAUIGrandSlamRemoteUIPresenter *)self showCancelInModalPresentation])
    {
      id v12 = [v8 displayedPages];
      uint64_t v13 = [v12 count];

      if (!v13)
      {
        BOOL v14 = [(AAUIGrandSlamRemoteUIPresenter *)self _remoteUICancelButtonForPage:v11];
        [(AAUIRemotePage *)v11 setLeftNavigationBarButtonItem:v14];

        objc_initWeak(&location, v11);
        id v15 = [(AAUIRemotePage *)v11 leftNavigationBarButtonItem];
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __83__AAUIGrandSlamRemoteUIPresenter_remoteUIController_createPageWithName_attributes___block_invoke;
        v17[3] = &unk_263F92AB8;
        objc_copyWeak(&v18, &location);
        [v15 setAction:v17];

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
    }
  }

  return v11;
}

void __83__AAUIGrandSlamRemoteUIPresenter_remoteUIController_createPageWithName_attributes___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissIfPresentedWithCompletion:0];
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  unint64_t v11 = *a5;
  if (*a5)
  {
LABEL_4:
    if (v11 == 1 && self->_isEndOfFlow)
    {
      p_delegate = &self->_delegate;
      id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        id v17 = objc_loadWeakRetained((id *)p_delegate);
        [v17 remoteUIDidEndFlow:v8];
      }
    }
    goto LABEL_11;
  }
  id v12 = [v9 allPages];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    unint64_t v11 = *a5;
    goto LABEL_4;
  }
  id v18 = _AAUILogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    uint64_t v20 = self;
    _os_log_impl(&dword_209754000, v18, OS_LOG_TYPE_DEFAULT, "%@: Undefined action signal and no page, not displaying modally", (uint8_t *)&v19, 0xCu);
  }

  [(RUIServerHookHandler *)self->_serverUIHookHandler processObjectModel:v10 isModal:0];
LABEL_11:
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = _AAUILogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v11 = @"NO";
    int v16 = 138413058;
    id v17 = self;
    if (v5) {
      unint64_t v11 = @"YES";
    }
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "%@: Controller (%@) will present objectModel (%@) modally (%@)", (uint8_t *)&v16, 0x2Au);
  }

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v15 = objc_loadWeakRetained((id *)p_delegate);
    [v15 remoteUIWillPresentObjectModel:v9 modally:v5];
  }
}

- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = _AAUILogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v11 = @"NO";
    int v16 = 138413058;
    id v17 = self;
    if (v5) {
      unint64_t v11 = @"YES";
    }
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "%@: Controller (%@) did present objectModel (%@) modally (%@)", (uint8_t *)&v16, 0x2Au);
  }

  [(RUIServerHookHandler *)self->_serverUIHookHandler processObjectModel:v9 isModal:v5];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v15 = objc_loadWeakRetained((id *)p_delegate);
    [v15 remoteUIDidPresentObjectModel:v9 modally:v5];
  }
}

- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "%@: Controller (%@) did refresh objectModel (%@)", (uint8_t *)&v9, 0x20u);
  }

  [(RUIServerHookHandler *)self->_serverUIHookHandler processObjectModel:v7 isModal:0];
}

- (void)remoteUIController:(id)a3 didDismissModalNavigationWithObjectModels:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Dismissing modal for delegate %@", (uint8_t *)&v13, 0xCu);
    }
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 remoteUIDidDismiss:v5];
  }
  __int16 v11 = _AAUILogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    serverUIHookHandler = self->_serverUIHookHandler;
    int v13 = 138412546;
    id v14 = v5;
    __int16 v15 = 2112;
    int v16 = serverUIHookHandler;
    _os_log_impl(&dword_209754000, v11, OS_LOG_TYPE_DEFAULT, "Dismissing modal for controller: %@, serverHookHandler: %@", (uint8_t *)&v13, 0x16u);
  }
}

- (void)remoteUIControllerDidDismiss:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    int v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "%@: Did dismiss controller (%@)", (uint8_t *)&v12, 0x16u);
  }

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (AAUIGrandSlamRemoteUIPresenter *)objc_loadWeakRetained((id *)p_delegate);
      int v12 = 138412290;
      int v13 = v10;
      _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Dismissing controller for delegate %@", (uint8_t *)&v12, 0xCu);
    }
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    [v11 remoteUIDidDismiss:v4];
  }
}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    serverUIHookHandler = self->_serverUIHookHandler;
    int v10 = 138413058;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = serverUIHookHandler;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "%@: Will present modal for controller (%@) with navigationController (%@) using handler (%@)", (uint8_t *)&v10, 0x2Au);
  }
}

- (AAUIGrandSlamRemoteUIPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUIGrandSlamRemoteUIPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (UIViewController *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (BOOL)isModalInPresentation
{
  return self->_modalInPresentation;
}

- (void)setModalInPresentation:(BOOL)a3
{
  self->_modalInPresentation = a3;
}

- (BOOL)showCancelInModalPresentation
{
  return self->_showCancelInModalPresentation;
}

- (void)setShowCancelInModalPresentation:(BOOL)a3
{
  self->_showCancelInModalPresentation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serverUIHookHandlerDelegate, 0);
  objc_storeStrong((id *)&self->_serverUIHookHandler, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_resourceLoadDelegate, 0);
  objc_storeStrong((id *)&self->_grandSlamAccount, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
}

void __46__AAUIGrandSlamRemoteUIPresenter_loadRequest___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [*(id *)(a1 + 32) URL];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_209754000, a3, OS_LOG_TYPE_ERROR, "RemoteUI load error for request %@ error %@", (uint8_t *)&v6, 0x16u);
}

void __73__AAUIGrandSlamRemoteUIPresenter__getServerUILoadDelegateWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_209754000, a2, OS_LOG_TYPE_ERROR, "AAUIGrandSlamRemoteUIPresenter resource load delegate error %@", (uint8_t *)&v2, 0xCu);
}

@end