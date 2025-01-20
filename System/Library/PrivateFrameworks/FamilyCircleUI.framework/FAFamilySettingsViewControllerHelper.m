@interface FAFamilySettingsViewControllerHelper
- (BOOL)loadRemoteUIWithRequest:(id)a3 type:(int64_t)a4 completion:(id)a5;
- (BOOL)loadRemoteUIWithRequest:(id)a3 url:(id)a4 type:(int64_t)a5 completion:(id)a6;
- (FAFamilySettingsViewControllerHelper)initWithAppleAccount:(id)a3 grandSlamSigner:(id)a4 familyPictureStore:(id)a5 accountManager:(id)a6;
- (FAFamilySettingsViewControllerHelperDelegate)delegate;
- (NSURL)urlBeingLoaded;
- (UINavigationController)navigationController;
- (id)_appleIDGrandSlamSigner;
- (id)_itunesAccount;
- (id)_requestConfigurator;
- (id)remoteUIController:(id)a3 createPageWithName:(id)a4 attributes:(id)a5;
- (void)_fetchFamilyPaymentInfoWithCompletion:(id)a3;
- (void)_handleObjectModelChangeForController:(id)a3 objectModel:(id)a4 isModal:(BOOL)a5;
- (void)_setFresnoRemoteUIDelgate:(id)a3;
- (void)dealloc;
- (void)loadMemberDetailsForFamilyMember:(id)a3 completion:(id)a4;
- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4;
- (void)remoteUIController:(id)a3 didRemoveObjectModel:(id)a4;
- (void)remoteUIController:(id)a3 willLoadRequest:(id)a4;
- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4;
- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)remoteUIControllerDidDismiss:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setUrlBeingLoaded:(id)a3;
@end

@implementation FAFamilySettingsViewControllerHelper

- (FAFamilySettingsViewControllerHelper)initWithAppleAccount:(id)a3 grandSlamSigner:(id)a4 familyPictureStore:(id)a5 accountManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)FAFamilySettingsViewControllerHelper;
  v15 = [(FAFamilySettingsViewControllerHelper *)&v26 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_iCloudGrandSlamSigner, a4);
    objc_storeStrong((id *)&v16->_appleAccount, a3);
    objc_storeStrong((id *)&v16->_accountManager, a6);
    uint64_t v17 = [(AAGrandSlamSigner *)v16->_iCloudGrandSlamSigner accountStore];
    accountStore = v16->_accountStore;
    v16->_accountStore = (ACAccountStore *)v17;

    uint64_t v19 = [(AAGrandSlamSigner *)v16->_iCloudGrandSlamSigner grandSlamAccount];
    grandSlamAccount = v16->_grandSlamAccount;
    v16->_grandSlamAccount = (ACAccount *)v19;

    objc_storeStrong((id *)&v16->_familyPictureStore, a5);
    v21 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    networkingQueue = v16->_networkingQueue;
    v16->_networkingQueue = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    objectModelDecorators = v16->_objectModelDecorators;
    v16->_objectModelDecorators = v23;
  }
  return v16;
}

- (id)_appleIDGrandSlamSigner
{
  appleIDGrandSlamSigner = self->_appleIDGrandSlamSigner;
  if (!appleIDGrandSlamSigner)
  {
    id v4 = objc_alloc(MEMORY[0x263F25878]);
    v5 = (AAGrandSlamSigner *)[v4 initWithAccountStore:self->_accountStore grandSlamAccount:self->_grandSlamAccount appTokenID:*MEMORY[0x263F256C8]];
    v6 = self->_appleIDGrandSlamSigner;
    self->_appleIDGrandSlamSigner = v5;

    appleIDGrandSlamSigner = self->_appleIDGrandSlamSigner;
  }
  return appleIDGrandSlamSigner;
}

- (id)_requestConfigurator
{
  requestConfigurator = self->_requestConfigurator;
  if (!requestConfigurator)
  {
    id v4 = (FARequestConfigurator *)[objc_alloc(MEMORY[0x263F3BFA8]) initWithAccount:self->_appleAccount];
    v5 = self->_requestConfigurator;
    self->_requestConfigurator = v4;

    requestConfigurator = self->_requestConfigurator;
  }
  return requestConfigurator;
}

- (id)_itunesAccount
{
  itunesAccount = self->_itunesAccount;
  if (!itunesAccount)
  {
    id v4 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
    objc_msgSend(v4, "ams_activeiTunesAccount");
    v5 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    v6 = self->_itunesAccount;
    self->_itunesAccount = v5;

    itunesAccount = self->_itunesAccount;
  }
  return itunesAccount;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_networkingQueue cancelAllOperations];
  iCloudRemoteUIController = self->_iCloudRemoteUIController;
  if (iCloudRemoteUIController) {
    [(AAUIRemoteUIController *)iCloudRemoteUIController setDelegate:0];
  }
  appleIDRemoteUIController = self->_appleIDRemoteUIController;
  if (appleIDRemoteUIController) {
    [(AAUIRemoteUIController *)appleIDRemoteUIController setDelegate:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)FAFamilySettingsViewControllerHelper;
  [(FAFamilySettingsViewControllerHelper *)&v5 dealloc];
}

- (BOOL)loadRemoteUIWithRequest:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [v9 urlRequest];
  id v11 = (void *)[v10 mutableCopy];
  id v12 = [v9 urlRequest];

  id v13 = [v12 URL];
  LOBYTE(a4) = [(FAFamilySettingsViewControllerHelper *)self loadRemoteUIWithRequest:v11 url:v13 type:a4 completion:v8];

  return a4;
}

- (BOOL)loadRemoteUIWithRequest:(id)a3 url:(id)a4 type:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  urlBeingLoaded = self->_urlBeingLoaded;
  if (!urlBeingLoaded)
  {
    objc_storeStrong((id *)&self->_urlBeingLoaded, a4);
    id v14 = objc_alloc_init(MEMORY[0x263F25D30]);
    if (a5 == 1)
    {
      uint64_t v15 = 72;
    }
    else
    {
      if (a5 == 2) {
        objc_storeStrong((id *)&self->_familyV2RemoteUIController, v14);
      }
      uint64_t v15 = 64;
    }
    objc_storeStrong((id *)((char *)&self->super.isa + v15), v14);
    id v16 = objc_alloc(MEMORY[0x263F25D38]);
    uint64_t v17 = objc_msgSend(MEMORY[0x263F25D38], "fcui_defaultFresnoServerHooks");
    v18 = (AAUIServerUIHookHandler *)[v16 initWithRemoteUIController:v14 hooks:v17];
    serverUIHookHandler = self->_serverUIHookHandler;
    self->_serverUIHookHandler = v18;

    if (a5 == 2) {
      [(FAFamilySettingsViewControllerHelper *)self _setFresnoRemoteUIDelgate:v14];
    }
    else {
      [v14 setDelegate:self];
    }
    v20 = [(FAFamilySettingsViewControllerHelper *)self navigationController];
    [v14 setNavigationController:v20];

    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __84__FAFamilySettingsViewControllerHelper_loadRemoteUIWithRequest_url_type_completion___block_invoke;
    v22[3] = &unk_264349C38;
    objc_copyWeak(&v24, &location);
    id v23 = v12;
    [v14 loadRequest:v10 completion:v22];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return urlBeingLoaded == 0;
}

void __84__FAFamilySettingsViewControllerHelper_loadRemoteUIWithRequest_url_type_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__FAFamilySettingsViewControllerHelper_loadRemoteUIWithRequest_url_type_completion___block_invoke_2;
  v7[3] = &unk_264349C10;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  char v11 = a2;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);

  objc_destroyWeak(&v10);
}

void __84__FAFamilySettingsViewControllerHelper_loadRemoteUIWithRequest_url_type_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)WeakRetained[24];
  WeakRetained[24] = 0;

  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 32);
    v8[0] = 67109378;
    v8[1] = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_2189F0000, v4, OS_LOG_TYPE_DEFAULT, "Loading remote UI for family member details result: %d. Error: %@", (uint8_t *)v8, 0x12u);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

- (void)loadMemberDetailsForFamilyMember:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_memberBeingViewed, a3);
  __int16 v9 = [(FAFamilyRequest *)[FAFamilyMemberDetailsUIRequest alloc] initWithGrandSlamSigner:self->_iCloudGrandSlamSigner];
  uint64_t v10 = [(FAFamilyMember *)self->_memberBeingViewed dsid];
  uint64_t v11 = [v10 integerValue];

  memberBeingViewed = self->_memberBeingViewed;
  if (v11 < 1)
  {
    id v13 = [(FAFamilyMember *)memberBeingViewed inviteEmail];
    [(FAFamilyMemberDetailsUIRequest *)v9 setMemberEmail:v13];
  }
  else
  {
    id v13 = [(FAFamilyMember *)memberBeingViewed dsid];
    [(FAFamilyMemberDetailsUIRequest *)v9 setMemberDSID:v13];
  }

  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __84__FAFamilySettingsViewControllerHelper_loadMemberDetailsForFamilyMember_completion___block_invoke;
  v15[3] = &unk_264349C60;
  objc_copyWeak(&v17, &location);
  id v14 = v8;
  id v16 = v14;
  [(FAFamilyMemberDetailsUIRequest *)v9 URLRequestWithCompletion:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __84__FAFamilySettingsViewControllerHelper_loadMemberDetailsForFamilyMember_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  int v5 = (void *)[v4 mutableCopy];
  uint64_t v6 = [v4 URL];

  [WeakRetained loadRemoteUIWithRequest:v5 url:v6 type:0 completion:*(void *)(a1 + 32)];
}

- (void)_setFresnoRemoteUIDelgate:(id)a3
{
  id v4 = a3;
  id v7 = [[FACircleContext alloc] initWithEventType:@"FACircleEventTypeFamilySettings"];
  int v5 = [[FACircleRemoteUIDelegate alloc] initWithContext:v7 serverHookHandler:self->_serverUIHookHandler pictureStore:self->_familyPictureStore];
  familyRemoteUIDelegate = self->_familyRemoteUIDelegate;
  self->_familyRemoteUIDelegate = v5;

  [v4 setDelegate:self->_familyRemoteUIDelegate];
}

- (void)_fetchFamilyPaymentInfoWithCompletion:(id)a3
{
  id v4 = a3;
  self->_fetchingPaymentInfo = 1;
  int v5 = [(AAFamilyRequest *)[FAFamilyPaymentInfoRequest alloc] initWithGrandSlamSigner:self->_iCloudGrandSlamSigner];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __78__FAFamilySettingsViewControllerHelper__fetchFamilyPaymentInfoWithCompletion___block_invoke;
  id v13 = &unk_264349B48;
  id v14 = self;
  id v15 = v4;
  id v6 = v4;
  id v7 = _Block_copy(&v10);
  id v8 = objc_alloc(MEMORY[0x263F25938]);
  __int16 v9 = objc_msgSend(v8, "initWithRequest:handler:", v5, v7, v10, v11, v12, v13, v14);
  [(NSOperationQueue *)self->_networkingQueue addOperation:v9];
}

void __78__FAFamilySettingsViewControllerHelper__fetchFamilyPaymentInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 statusCode] == 401)
  {
    id v4 = _FALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2189F0000, v4, OS_LOG_TYPE_DEFAULT, "Family payment info request returned 401. We need to re-auth...", buf, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 112) renewCredentialsForAccount:*(void *)(*(void *)(a1 + 32) + 120) force:1 reason:0 completion:&__block_literal_global_11];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__FAFamilySettingsViewControllerHelper__fetchFamilyPaymentInfoWithCompletion___block_invoke_69;
  block[3] = &unk_264349B20;
  int v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __78__FAFamilySettingsViewControllerHelper__fetchFamilyPaymentInfoWithCompletion___block_invoke_67(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218242;
    uint64_t v7 = a2;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_2189F0000, v5, OS_LOG_TYPE_DEFAULT, "Result of renewing credentials for family payment info request: %ld. Error: %@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __78__FAFamilySettingsViewControllerHelper__fetchFamilyPaymentInfoWithCompletion___block_invoke_69(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 144) = 0;
  uint64_t v2 = [*(id *)(a1 + 40) creditCard];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 96);
  *(void *)(v3 + 96) = v2;

  *(unsigned char *)(*(void *)(a1 + 32) + 104) = 0;
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    int v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4
{
}

- (void)_handleObjectModelChangeForController:(id)a3 objectModel:(id)a4 isModal:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v7 = a4;
  __int16 v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 identifier];
    int v10 = 138412290;
    uint64_t v11 = v9;
    _os_log_impl(&dword_2189F0000, v8, OS_LOG_TYPE_DEFAULT, "handleObjectModelChangeForController - %@", (uint8_t *)&v10, 0xCu);
  }
  [(AAUIServerUIHookHandler *)self->_serverUIHookHandler processObjectModel:v7 isModal:v5];
}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
}

- (void)remoteUIController:(id)a3 willLoadRequest:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v6 = (AAUIRemoteUIController *)a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_currentRemoteUIRequest, a4);
  __int16 v8 = [v7 URL];
  char v9 = [v8 isEqual:self->_urlBeingLoaded];

  if ((v9 & 1) == 0)
  {
    int v10 = [v7 URL];
    uint64_t v11 = [v10 absoluteString];
    int v12 = [v11 containsString:@"prefs:itunes"];

    if (v12)
    {
      id v13 = (id)[(AAUIRemoteUIController *)v6 dismissObjectModelsAnimated:1 completion:0];
      dispatch_time_t v14 = dispatch_time(0, 500000000);
      dispatch_after(v14, MEMORY[0x263EF83A0], &__block_literal_global_76);
    }
    else
    {
      if (self->_appleIDRemoteUIController == v6)
      {
        id v15 = [(FAFamilySettingsViewControllerHelper *)self _appleIDGrandSlamSigner];
      }
      else if (self->_iCloudRemoteUIController == v6)
      {
        id v15 = self->_iCloudGrandSlamSigner;
        objc_msgSend(v7, "aa_addLoggedInAppleIDHeaderWithAccount:", self->_appleAccount);
      }
      else
      {
        id v15 = 0;
      }
      [(AAGrandSlamSigner *)v15 signURLRequest:v7 isUserInitiated:1];
      objc_msgSend(v7, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_appleAccount, 0);
      id v16 = [MEMORY[0x263F25820] clientInfoHeader];
      [v7 setValue:v16 forHTTPHeaderField:@"X-MMe-Client-Info"];

      id v17 = [MEMORY[0x263EFF960] currentLocale];
      v18 = [v17 objectForKey:*MEMORY[0x263EFF4D0]];
      uint64_t v19 = [v18 uppercaseString];
      [v7 setValue:v19 forHTTPHeaderField:@"X-MMe-Country"];

      v20 = [(FAFamilySettingsViewControllerHelper *)self _itunesAccount];
      v21 = objc_msgSend(v20, "ams_DSID");
      v22 = [v21 stringValue];

      if ([v22 length])
      {
        objc_msgSend(v7, "aa_addDeviceProvisioningInfoHeadersWithDSID:", v22);
      }
      else
      {
        id v23 = _FALogSystem();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          itunesAccount = self->_itunesAccount;
          int v26 = 138412290;
          v27 = itunesAccount;
          _os_log_impl(&dword_2189F0000, v23, OS_LOG_TYPE_DEFAULT, "No DSID for iTunes account ivar: %@", (uint8_t *)&v26, 0xCu);
        }
      }
      objc_msgSend(v7, "aa_addDeviceInternalDevHeaderIfEnabled");
      objc_msgSend(v7, "aa_addDeviceIDHeader");
      objc_msgSend(v7, "aa_addLocationSharingAllowedHeader");
      if ([(FAFamilyMember *)self->_memberBeingViewed isMe])
      {
        v25 = [(FAFamilySettingsViewControllerHelper *)self _itunesAccount];
        objc_msgSend(v7, "fam_addiTunesHeadersWithAccount:", v25);
      }
    }
  }
}

void __75__FAFamilySettingsViewControllerHelper_remoteUIController_willLoadRequest___block_invoke()
{
  uint64_t v2 = 0;
  v0 = [MEMORY[0x263F3C010] urlDestinationTo:6 error:&v2];
  v1 = [MEMORY[0x263F01880] defaultWorkspace];
  [v1 openSensitiveURL:v0 withOptions:0];
}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 statusCode] == 401)
  {
    __int16 v8 = _FALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2189F0000, v8, OS_LOG_TYPE_DEFAULT, "BML request returned 401. We need to re-auth...", buf, 2u);
    }

    [(ACAccountStore *)self->_accountStore renewCredentialsForAccount:self->_appleAccount force:1 reason:0 completion:&__block_literal_global_88];
  }
  else
  {
    if ([v7 statusCode] == 200)
    {
      char v9 = [v7 allHeaderFields];
      int v10 = [v9 valueForKey:@"X-Apple-Family-Changed"];

      if (v10)
      {
        uint64_t v11 = _FALogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v10;
          _os_log_impl(&dword_2189F0000, v11, OS_LOG_TYPE_DEFAULT, "Family properties changed while we're in BML: %@", buf, 0xCu);
        }

        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __82__FAFamilySettingsViewControllerHelper_remoteUIController_didReceiveHTTPResponse___block_invoke_89;
        block[3] = &unk_2643491B8;
        block[4] = self;
        id v27 = v10;
        id v28 = v7;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
      int v12 = [v7 allHeaderFields];
      id v13 = [v12 valueForKey:@"X-Apple-Family-Subscription-Changed"];

      if ([v13 BOOLValue])
      {
        dispatch_time_t v14 = _FALogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v13;
          _os_log_impl(&dword_2189F0000, v14, OS_LOG_TYPE_DEFAULT, "Family subscription properties changed: %@", buf, 0xCu);
        }

        dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_93);
      }
      id v15 = [v7 allHeaderFields];
      id v16 = [v15 valueForKey:@"X-MMe-Setup-Family-Linked-ITunes-AppleID"];

      if (v16)
      {
        id v17 = _FALogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v16;
          _os_log_impl(&dword_2189F0000, v17, OS_LOG_TYPE_DEFAULT, "Found updated linked Apple Account account header: %@", buf, 0xCu);
        }

        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __82__FAFamilySettingsViewControllerHelper_remoteUIController_didReceiveHTTPResponse___block_invoke_95;
        v24[3] = &unk_264348AE0;
        v24[4] = self;
        id v25 = v16;
        dispatch_async(MEMORY[0x263EF83A0], v24);
      }
      if ([(NSMutableURLRequest *)self->_currentRemoteUIRequest aa_addDeviceProvisioningInfoHeadersWithDSIDFromReponse:v7])
      {
        v18 = _FALogSystem();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2189F0000, v18, OS_LOG_TYPE_DEFAULT, "Device is provisioned... Reissuing request...", buf, 2u);
        }

        uint64_t v19 = [v6 loadCompletion];
        currentRemoteUIRequest = self->_currentRemoteUIRequest;
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __82__FAFamilySettingsViewControllerHelper_remoteUIController_didReceiveHTTPResponse___block_invoke_96;
        v22[3] = &unk_264348FA8;
        id v23 = v19;
        id v21 = v19;
        [v6 loadRequest:currentRemoteUIRequest completion:v22];
      }
    }
    else
    {
      int v10 = [(FAFamilySettingsViewControllerHelper *)self delegate];
      [v10 familySettingsHelperShowConnectivityAlert:self];
    }
  }
}

void __82__FAFamilySettingsViewControllerHelper_remoteUIController_didReceiveHTTPResponse___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218242;
    uint64_t v7 = a2;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_2189F0000, v5, OS_LOG_TYPE_DEFAULT, "Result of renewing credentials to continue BML flow: %ld. Error: %@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __82__FAFamilySettingsViewControllerHelper_remoteUIController_didReceiveHTTPResponse___block_invoke_89(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  [v2 familySettingsHelper:*(void *)(a1 + 32) handleFamilyStatusChange:*(void *)(a1 + 40) affectedFamilyMember:*(void *)(*(void *)(a1 + 32) + 32)];

  if (([*(id *)(a1 + 40) isEqualToString:@"MemberDeleted"] & 1) != 0
    || [*(id *)(a1 + 40) isEqualToString:@"InviteDeleted"])
  {
    id v3 = (id)[*(id *)(*(void *)(a1 + 32) + 64) popObjectModelAnimated:1];
  }
  id v4 = (void *)MEMORY[0x263F3BF10];
  uint64_t v5 = *(void *)(a1 + 48);
  return [v4 handleURLResponse:v5];
}

uint64_t __82__FAFamilySettingsViewControllerHelper_remoteUIController_didReceiveHTTPResponse___block_invoke_91()
{
  return [MEMORY[0x263F3BEE8] broadcastServicesChangedNotification];
}

void __82__FAFamilySettingsViewControllerHelper_remoteUIController_didReceiveHTTPResponse___block_invoke_95(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 familySettingsHelper:*(void *)(a1 + 32) updateMemberDetailsPageWithLinkedAppleID:*(void *)(a1 + 40)];
}

void __82__FAFamilySettingsViewControllerHelper_remoteUIController_didReceiveHTTPResponse___block_invoke_96(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    int v6 = _FALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_2189F0000, v6, OS_LOG_TYPE_DEFAULT, "Failed to load Family Settings remote UI: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (*a5 == 1) {
    [(FAFamilySettingsViewControllerHelper *)self _handleObjectModelChangeForController:v8 objectModel:v9 isModal:0];
  }
  uint64_t v10 = [v9 clientInfo];
  uint64_t v11 = [v10 objectForKey:@"paymentMethodUpdated"];
  int v12 = [v11 BOOLValue];

  if (v12)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __94__FAFamilySettingsViewControllerHelper_remoteUIController_didReceiveObjectModel_actionSignal___block_invoke;
    v18[3] = &unk_2643489F8;
    v18[4] = self;
    [(FAFamilySettingsViewControllerHelper *)self _fetchFamilyPaymentInfoWithCompletion:v18];
    if (*a5 == 4)
    {
      id v13 = [v9 allPages];
      uint64_t v14 = [v13 count];

      if (v14)
      {
        id v15 = [(FAFamilySettingsViewControllerHelper *)self navigationController];
        id v16 = [v15 viewControllers];

        uint64_t v17 = [v16 indexOfObject:self];
        if (v17 == [v16 count] - 2) {
          [v9 setPages:0];
        }
      }
    }
  }
}

void __94__FAFamilySettingsViewControllerHelper_remoteUIController_didReceiveObjectModel_actionSignal___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 familySettingsHelperDidUpdatePaymentInfo:*(void *)(a1 + 32)];
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a4;
  [(FAFamilySettingsViewControllerHelper *)self _handleObjectModelChangeForController:a3 objectModel:v8 isModal:v5];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = [v8 allPages];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * v13++) setHidesBottomBarWhenPushed:1];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v11);
  }

  uint64_t v14 = [v8 defaultPages];
  id v15 = [v14 firstObject];

  if (self->_memberBeingViewed)
  {
    if ([v15 hasTableView])
    {
      id v16 = [v8 sourceURL];

      if (v16)
      {
        uint64_t v17 = _FALogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v28 = 0;
          _os_log_impl(&dword_2189F0000, v17, OS_LOG_TYPE_DEFAULT, "Decorating RUI page...", v28, 2u);
        }

        v18 = [FAProfileViewTableViewDecorator alloc];
        uint64_t v19 = [v15 tableViewOM];
        v20 = [v19 tableView];
        id v21 = [v15 tableViewOM];
        v22 = [(FAProfileViewTableViewDecorator *)v18 initWithTableView:v20 ruiTableView:v21 forPerson:self->_memberBeingViewed pictureStore:self->_familyPictureStore];

        id v23 = [FAProfilePictureTableViewDecorator alloc];
        id v24 = [v15 tableViewOM];
        id v25 = [(FAProfilePictureTableViewDecorator *)v23 initWithTableView:v22 ruiTableView:v24 pictureStore:self->_familyPictureStore];

        objectModelDecorators = self->_objectModelDecorators;
        id v27 = [v8 sourceURL];
        [(NSMutableDictionary *)objectModelDecorators setObject:v25 forKey:v27];
      }
    }
  }
}

- (id)remoteUIController:(id)a3 createPageWithName:(id)a4 attributes:(id)a5
{
  id v5 = objc_alloc_init(MEMORY[0x263F25D28]);
  return v5;
}

- (void)remoteUIController:(id)a3 didRemoveObjectModel:(id)a4
{
  id v8 = a4;
  id v5 = [v8 sourceURL];

  if (v5)
  {
    objectModelDecorators = self->_objectModelDecorators;
    uint64_t v7 = [v8 sourceURL];
    [(NSMutableDictionary *)objectModelDecorators removeObjectForKey:v7];
  }
}

- (void)remoteUIControllerDidDismiss:(id)a3
{
}

- (FAFamilySettingsViewControllerHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FAFamilySettingsViewControllerHelperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UINavigationController)navigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  return (UINavigationController *)WeakRetained;
}

- (void)setNavigationController:(id)a3
{
}

- (NSURL)urlBeingLoaded
{
  return self->_urlBeingLoaded;
}

- (void)setUrlBeingLoaded:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBeingLoaded, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_familyPictureStore, 0);
  objc_storeStrong((id *)&self->_networkingQueue, 0);
  objc_storeStrong((id *)&self->_itunesAccount, 0);
  objc_storeStrong((id *)&self->_grandSlamAccount, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_paymentMethod, 0);
  objc_storeStrong((id *)&self->_familyRemoteUIDelegate, 0);
  objc_storeStrong((id *)&self->_familyV2RemoteUIController, 0);
  objc_storeStrong((id *)&self->_appleIDRemoteUIController, 0);
  objc_storeStrong((id *)&self->_iCloudRemoteUIController, 0);
  objc_storeStrong((id *)&self->_requestConfigurator, 0);
  objc_storeStrong((id *)&self->_currentRemoteUIRequest, 0);
  objc_storeStrong((id *)&self->_objectModelDecorators, 0);
  objc_storeStrong((id *)&self->_memberBeingViewed, 0);
  objc_storeStrong((id *)&self->_iCloudGrandSlamSigner, 0);
  objc_storeStrong((id *)&self->_appleIDGrandSlamSigner, 0);
  objc_storeStrong((id *)&self->_serverUIHookHandler, 0);
}

@end