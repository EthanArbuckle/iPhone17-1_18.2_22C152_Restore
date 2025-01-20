@interface AKAppleIDFollowUpServerUIPresenter
- (AKAppleIDAuthenticationInAppExtensionContext)authContext;
- (AKAppleIDFollowUpServerUIPresenter)init;
- (AKExtensionlessFollowUpHelperContext)followupHelperContext;
- (AKFollowUpProvider)followUpProvider;
- (BOOL)_shouldSignWithIDMSAppleIDHeader;
- (BOOL)shouldAcknowledgeUserAction;
- (id)_authKitAccountWithAltDSID:(id)a3;
- (id)_fetchCurrentFollowUpItem;
- (id)_makeAppleIDAuthenticationController;
- (id)_urlAtKey:(id)a3;
- (void)_fetchCurrentFollowUpItem;
- (void)_performAuthKitActionWithResponse:(id)a3 additionalData:(id)a4 error:(id)a5;
- (void)_performClientCompletionWithServerResponse:(id)a3 additionalData:(id)a4 error:(id)a5;
- (void)_performClientCompletionWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_prepareServerUIContext;
- (void)_presentServerUIWithConfiguration:(id)a3;
- (void)_signRequestAndPrepareServerConfig:(id)a3;
- (void)_signWithIDMSAppleIDHeaderForRequest:(id)a3 withCompletion:(id)a4;
- (void)acknowledgeActionTakenOnFollowUpWithIdentifier:(id)a3 withAdditionalData:(id)a4 completion:(id)a5;
- (void)handleFinalResponse:(id)a3 additionalData:(id)a4 error:(id)a5;
- (void)presentServerUIWithContext:(id)a3 withCompletion:(id)a4;
- (void)presentServerUIWithContext:(id)a3 withCompletion:(id)a4 withResponse:(id)a5;
- (void)setAuthContext:(id)a3;
- (void)setFollowUpProvider:(id)a3;
- (void)setFollowupHelperContext:(id)a3;
- (void)signAdditionalHeadersWithRequest:(id)a3;
@end

@implementation AKAppleIDFollowUpServerUIPresenter

- (AKAppleIDFollowUpServerUIPresenter)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKAppleIDFollowUpServerUIPresenter;
  v2 = [(AKAppleIDFollowUpServerUIPresenter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    eventHandler = v2->_eventHandler;
    v2->_eventHandler = (AKAppleIDServerUIEventHandlerImp *)v3;
  }
  return v2;
}

- (void)presentServerUIWithContext:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, void, void *))a4;
  v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDFollowUpServerUIPresenter presentServerUIWithContext:withCompletion:].cold.4();
  }

  objc_storeStrong((id *)&self->_followupHelperContext, a3);
  v10 = [(AKAppleIDFollowUpServerUIPresenter *)self _fetchCurrentFollowUpItem];
  item = self->_item;
  self->_item = v10;

  v12 = [(FLFollowUpItem *)self->_item userInfo];
  v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F4EE68]];

  if (v13)
  {
    v14 = [(AKAppleIDFollowUpServerUIPresenter *)self _authKitAccountWithAltDSID:v13];
    if (v14)
    {
      v15 = [v7 urlKey];
      v16 = [(AKAppleIDFollowUpServerUIPresenter *)self _urlAtKey:v15];

      if (v16)
      {
        objc_storeStrong((id *)&self->_initialURL, v16);
        v17 = (void *)MEMORY[0x1C8777520](v8);
        id presentingClientCompletion = self->_presentingClientCompletion;
        self->_id presentingClientCompletion = v17;

        v19 = objc_alloc_init(AKAppleIDAuthenticationInAppExtensionContext);
        authContext = self->_authContext;
        self->_authContext = v19;

        [(AKAppleIDAuthenticationInAppExtensionContext *)self->_authContext setAltDSID:v13];
        v21 = [v14 username];
        [(AKAppleIDAuthenticationInAppExtensionContext *)self->_authContext setUsername:v21];

        [(AKAppleIDAuthenticationInAppExtensionContext *)self->_authContext setCellularDataAttributionAppBundleID:*MEMORY[0x1E4F4EE28]];
        [(AKAppleIDAuthenticationInAppExtensionContext *)self->_authContext set_shouldSendIdentityTokenForRemoteUI:0];
        v22 = [v7 presentingViewController];
        [(AKAppleIDAuthenticationInAppContext *)self->_authContext setPresentingViewController:v22];

        [(AKAppleIDFollowUpServerUIPresenter *)self _prepareServerUIContext];
      }
      else
      {
        v25 = _AKLogSystem();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[AKAppleIDFollowUpServerUIPresenter presentServerUIWithContext:withCompletion:](v7);
        }

        v26 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7097);
        v8[2](v8, 0, v26);
      }
    }
    else
    {
      v24 = _AKLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[AKAppleIDFollowUpServerUIPresenter presentServerUIWithContext:withCompletion:]();
      }

      v16 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7055);
      v8[2](v8, 0, v16);
    }
  }
  else
  {
    v23 = _AKLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDFollowUpServerUIPresenter presentServerUIWithContext:withCompletion:]();
    }

    v14 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7025);
    v8[2](v8, 0, v14);
  }
}

- (void)presentServerUIWithContext:(id)a3 withCompletion:(id)a4 withResponse:(id)a5
{
  id v8 = a4;
  id v11 = a3;
  v9 = (void *)MEMORY[0x1C8777520](a5);
  id presentingClientResponseCompletion = self->_presentingClientResponseCompletion;
  self->_id presentingClientResponseCompletion = v9;

  [(AKAppleIDFollowUpServerUIPresenter *)self presentServerUIWithContext:v11 withCompletion:v8];
}

- (id)_authKitAccountWithAltDSID:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F4EF40];
  id v4 = a3;
  v5 = [v3 sharedInstance];
  objc_super v6 = [v5 authKitAccountWithAltDSID:v4 error:0];

  return v6;
}

- (id)_urlAtKey:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F4F0C8];
  id v4 = a3;
  v5 = [v3 sharedBag];
  objc_super v6 = [v5 urlAtKey:v4];

  return v6;
}

- (void)_prepareServerUIContext
{
  uint64_t v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v3, OS_LOG_TYPE_DEFAULT, "Preparing the server UI Load Delegate", buf, 2u);
  }

  id v4 = [(AKAppleIDFollowUpServerUIPresenter *)self _makeAppleIDAuthenticationController];
  authController = self->_authController;
  self->_authController = v4;

  id v6 = objc_alloc_init(MEMORY[0x1E4F4EF60]);
  id v7 = [(AKAppleIDAuthenticationInAppExtensionContext *)self->_authContext altDSID];
  [v6 setAltDSID:v7];

  [v6 setAnticipateEscrowAttempt:1];
  id v8 = self->_authController;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__AKAppleIDFollowUpServerUIPresenter__prepareServerUIContext__block_invoke;
  v9[3] = &unk_1E648FF90;
  v9[4] = self;
  [(AKAppleIDAuthenticationController *)v8 getServerUILoadDelegateWithContext:v6 completion:v9];
}

void __61__AKAppleIDFollowUpServerUIPresenter__prepareServerUIContext__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 80) urlKey];
    [v9 setBagUrlKey:v6];

    [*(id *)(a1 + 32) _signRequestAndPrepareServerConfig:v9];
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    if (v5)
    {
      [v7 _performClientCompletionWithSuccess:0 error:v5];
    }
    else
    {
      id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7019);
      [v7 _performClientCompletionWithSuccess:0 error:v8];
    }
  }
}

- (id)_makeAppleIDAuthenticationController
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F4EF68]);

  return v2;
}

- (void)_signRequestAndPrepareServerConfig:(id)a3
{
  id v4 = a3;
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1C38C1000, v5, OS_LOG_TYPE_DEFAULT, "Preparing server configuration...", (uint8_t *)buf, 2u);
  }

  id v6 = [MEMORY[0x1E4F4EF40] sharedInstance];
  id v7 = [v4 altDSID];
  id v8 = [v6 appleIDAccountWithAltDSID:v7];

  id v9 = [v6 settingsServiceTokenForAccount:v8];
  if ([v9 length])
  {
    [v4 setServiceToken:v9];
    [v4 setServiceTokenIdentifier:@"com.apple.gs.appleid.auth"];
  }
  v10 = [MEMORY[0x1E4F28E88] requestWithURL:self->_initialURL];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F4F0A8]) initWithRequest:v10 requestType:0];
  [v11 setResourceLoadDelegate:v4];
  if (self->_item
    && [(AKAppleIDFollowUpServerUIPresenter *)self _shouldSignWithIDMSAppleIDHeader])
  {
    v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1C38C1000, v12, OS_LOG_TYPE_DEFAULT, "Signing with idms header", (uint8_t *)buf, 2u);
    }

    v13 = [(FLFollowUpItem *)self->_item userInfo];
    uint64_t v14 = *MEMORY[0x1E4F4EE70];
    v15 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F4EE70]];

    if (v15)
    {
      v16 = [v11 resourceLoadDelegate];
      [(FLFollowUpItem *)self->_item userInfo];
      v17 = v23 = v8;
      v18 = [v17 objectForKeyedSubscript:v14];
      [v16 setContinuityIDMSData:v18];

      id v8 = v23;
    }
    else
    {
      v16 = _AKLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[AKAppleIDFollowUpServerUIPresenter _signRequestAndPrepareServerConfig:]((uint64_t)self);
      }
    }
  }
  [v11 setPresentationType:2];
  objc_initWeak(buf, self);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __73__AKAppleIDFollowUpServerUIPresenter__signRequestAndPrepareServerConfig___block_invoke;
  v24[3] = &unk_1E648FFB8;
  objc_copyWeak(&v25, buf);
  v19 = (void *)MEMORY[0x1C8777520](v24);
  id serverUICompletion = self->_serverUICompletion;
  self->_id serverUICompletion = v19;

  v21 = [[AKAppleIDServerUIContextController alloc] initWithRequestConfiguration:v11 completion:self->_serverUICompletion];
  serverUIContextController = self->_serverUIContextController;
  self->_serverUIContextController = v21;

  [(AKAppleIDFollowUpServerUIPresenter *)self _presentServerUIWithConfiguration:v11];
  objc_destroyWeak(&v25);
  objc_destroyWeak(buf);
}

void __73__AKAppleIDFollowUpServerUIPresenter__signRequestAndPrepareServerConfig___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_1C38C1000, v11, OS_LOG_TYPE_DEFAULT, "Server UI finished processing", v14, 2u);
    }

    [WeakRetained _performClientCompletionWithServerResponse:v7 additionalData:v8 error:v9];
    if (v9)
    {
      uint64_t v12 = 0;
      id v13 = v9;
    }
    else
    {
      uint64_t v12 = 1;
      id v13 = 0;
    }
    [WeakRetained _performClientCompletionWithSuccess:v12 error:v13];
  }
}

- (void)_presentServerUIWithConfiguration:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_1C38C1000, v5, OS_LOG_TYPE_DEFAULT, "Presenting server provided UI with configuration %@", buf, 0xCu);
  }

  item = self->_item;
  id v7 = _AKLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (item)
  {
    if (v8) {
      -[AKAppleIDFollowUpServerUIPresenter _presentServerUIWithConfiguration:]();
    }

    id v7 = [(AKExtensionlessFollowUpHelperContext *)self->_followupHelperContext uniqueItemIdentifier];
    [(AKAppleIDFollowUpServerUIPresenter *)self acknowledgeActionTakenOnFollowUpWithIdentifier:v7 withAdditionalData:0 completion:0];
  }
  else if (v8)
  {
    -[AKAppleIDFollowUpServerUIPresenter _presentServerUIWithConfiguration:]();
  }

  authContext = self->_authContext;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__AKAppleIDFollowUpServerUIPresenter__presentServerUIWithConfiguration___block_invoke;
  v10[3] = &unk_1E648FFE0;
  v10[4] = self;
  [(AKAppleIDAuthenticationInAppContext *)authContext presentServerProvidedUIWithConfiguration:v4 completion:v10];
}

void __72__AKAppleIDFollowUpServerUIPresenter__presentServerUIWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  [v7 _performClientCompletionWithServerResponse:v10 additionalData:v9 error:v8];
  [*(id *)(*(void *)(a1 + 32) + 8) processResponse:v10];
  [*(id *)(a1 + 32) _performAuthKitActionWithResponse:v10 additionalData:v9 error:v8];
}

- (void)acknowledgeActionTakenOnFollowUpWithIdentifier:(id)a3 withAdditionalData:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(AKAppleIDFollowUpServerUIPresenter *)self shouldAcknowledgeUserAction])
  {
    id v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1C38C1000, v11, OS_LOG_TYPE_DEFAULT, "Sending acknowledgment for follow up item with id: %@", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__0;
    v32 = __Block_byref_object_dispose__0;
    id v33 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
    id v12 = objc_opt_new();
    uint64_t v13 = [(FLFollowUpItem *)self->_item userInfo];
    uint64_t v14 = *MEMORY[0x1E4F4EE70];
    v15 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F4EE70]];

    v16 = [(FLFollowUpItem *)self->_item userInfo];
    v17 = [v16 objectForKeyedSubscript:@"txnid"];

    v18 = [(AKExtensionlessFollowUpHelperContext *)self->_followupHelperContext uniqueItemIdentifier];
    [v12 setItemIdentifier:v18];

    v19 = [(FLFollowUpItem *)self->_item userInfo];
    v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F4EE68]];
    [v12 setAltDSID:v20];

    [v12 setAkAction:@"open"];
    [v12 setIsContinuityPush:1];
    if (v15)
    {
      v21 = [(FLFollowUpItem *)self->_item userInfo];
      v22 = [v21 objectForKeyedSubscript:v14];
      [v12 setIdmsData:v22];
    }
    if (v17)
    {
      v23 = [(FLFollowUpItem *)self->_item userInfo];
      v24 = [v23 objectForKeyedSubscript:@"txnid"];
      [v12 setTxnid:v24];
    }
    id v25 = *(void **)(*((void *)&buf + 1) + 40);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __115__AKAppleIDFollowUpServerUIPresenter_acknowledgeActionTakenOnFollowUpWithIdentifier_withAdditionalData_completion___block_invoke;
    v26[3] = &unk_1E6490008;
    p_long long buf = &buf;
    id v27 = v10;
    [v25 teardownFollowUpWithContext:v12 completion:v26];

    _Block_object_dispose(&buf, 8);
  }
  else if (v10)
  {
    (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1, 0);
  }
}

void __115__AKAppleIDFollowUpServerUIPresenter_acknowledgeActionTakenOnFollowUpWithIdentifier_withAdditionalData_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    int v11 = 138412546;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1C38C1000, v6, OS_LOG_TYPE_DEFAULT, "Followup teardown is complete with success: %@, error: %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);
  }
}

- (void)signAdditionalHeadersWithRequest:(id)a3
{
  id v4 = a3;
  if (self->_item
    && [(AKAppleIDFollowUpServerUIPresenter *)self _shouldSignWithIDMSAppleIDHeader])
  {
    id v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1C38C1000, v5, OS_LOG_TYPE_DEFAULT, "Signing with idms header", v9, 2u);
    }

    id v6 = [(FLFollowUpItem *)self->_item userInfo];
    id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4EE70]];

    if (v7)
    {
      [v4 setValue:v7 forHTTPHeaderField:@"X-Apple-I-IdMS-Data"];
    }
    else
    {
      uint64_t v8 = _AKLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[AKAppleIDFollowUpServerUIPresenter signAdditionalHeadersWithRequest:]((uint64_t)self);
      }
    }
  }
}

- (BOOL)_shouldSignWithIDMSAppleIDHeader
{
  id v2 = [(FLFollowUpItem *)self->_item actions];
  uint64_t v3 = [v2 firstObject];
  id v4 = [v3 identifier];
  char v5 = [v4 isEqualToString:@"continuity_push_followup_notification"];

  return v5;
}

- (BOOL)shouldAcknowledgeUserAction
{
  id v2 = [(FLFollowUpItem *)self->_item actions];
  uint64_t v3 = [v2 firstObject];
  id v4 = [v3 identifier];
  char v5 = [v4 isEqualToString:@"continuity_push_followup_notification"];

  return v5;
}

- (id)_fetchCurrentFollowUpItem
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(AKExtensionlessFollowUpHelperContext *)self->_followupHelperContext uniqueItemIdentifier];
    *(_DWORD *)long long buf = 138412290;
    v19 = v4;
    _os_log_impl(&dword_1C38C1000, v3, OS_LOG_TYPE_DEFAULT, "Fetching follow up item with id: %@", buf, 0xCu);
  }
  FLFollowUpItemClass = (objc_class *)CoreFollowUpLibraryCore();
  if (FLFollowUpItemClass) {
    FLFollowUpItemClass = (objc_class *)getFLFollowUpItemClass();
  }
  id v6 = objc_alloc_init(FLFollowUpItemClass);
  id v7 = [(AKAppleIDFollowUpServerUIPresenter *)self followUpProvider];

  if (!v7)
  {
    uint64_t v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[AKAppleIDFollowUpServerUIPresenter _fetchCurrentFollowUpItem]();
    }

    id v9 = [MEMORY[0x1E4F4F048] sharedAuthKitFollowupProvider];
    [(AKAppleIDFollowUpServerUIPresenter *)self setFollowUpProvider:v9];
  }
  uint64_t v10 = [(AKAppleIDFollowUpServerUIPresenter *)self followUpProvider];
  id v17 = 0;
  int v11 = [v10 pendingFollowUpItems:&v17];
  id v12 = v17;

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__AKAppleIDFollowUpServerUIPresenter__fetchCurrentFollowUpItem__block_invoke;
  v16[3] = &unk_1E6490030;
  v16[4] = self;
  __int16 v13 = objc_msgSend(v11, "aaf_firstObjectPassingTest:", v16);

  if (v12 || !v13)
  {
    id v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDFollowUpServerUIPresenter _fetchCurrentFollowUpItem]((uint64_t)self);
    }
  }

  return v13;
}

uint64_t __63__AKAppleIDFollowUpServerUIPresenter__fetchCurrentFollowUpItem__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 80) uniqueItemIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)_signWithIDMSAppleIDHeaderForRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  if (self->_item)
  {
    uint64_t v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1C38C1000, v8, OS_LOG_TYPE_DEFAULT, "Signing with IDMS data", v12, 2u);
    }

    id v9 = [(FLFollowUpItem *)self->_item userInfo];
    uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F4EE70]];

    if (v10)
    {
      [v6 setValue:v10 forHTTPHeaderField:@"X-Apple-I-IdMS-Data"];
    }
    else
    {
      int v11 = _AKLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[AKAppleIDFollowUpServerUIPresenter signAdditionalHeadersWithRequest:]((uint64_t)self);
      }
    }
  }
  v7[2](v7, v6);
}

- (void)_performClientCompletionWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  id v6 = [(AKAppleIDServerUIContextController *)self->_serverUIContextController serverUIDelegate];
  [v6 setContinuityIDMSData:0];

  id presentingClientCompletion = (void (**)(id, BOOL, id))self->_presentingClientCompletion;
  if (presentingClientCompletion) {
    presentingClientCompletion[2](presentingClientCompletion, v4, v8);
  }
  [(AKAppleIDAuthenticationInAppContext *)self->_authContext dismissServerProvidedUIWithCompletion:0];
}

- (void)_performClientCompletionWithServerResponse:(id)a3 additionalData:(id)a4 error:(id)a5
{
  if (self->_presentingClientResponseCompletion)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    int v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1C38C1000, v11, OS_LOG_TYPE_DEFAULT, "Handing the server response to the calling client", v12, 2u);
    }

    (*((void (**)(void))self->_presentingClientResponseCompletion + 2))();
  }
}

- (void)_performAuthKitActionWithResponse:(id)a3 additionalData:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(AKAppleIDServerUIContextController *)self->_serverUIContextController serverUIDelegate];
  if (([v11 isAuthenticationRequired:v8] & 1) != 0
    || ([v10 userInfo],
        id v12 = objc_claimAutoreleasedReturnValue(),
        [v12 objectForKeyedSubscript:@"statusCode"],
        __int16 v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 isEqual:&unk_1F1F037F8],
        v13,
        v12,
        v14))
  {
    uint64_t v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C38C1000, v15, OS_LOG_TYPE_DEFAULT, "Signal received with authentication required", buf, 2u);
    }

    eventHandler = self->_eventHandler;
    authContext = self->_authContext;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __93__AKAppleIDFollowUpServerUIPresenter__performAuthKitActionWithResponse_additionalData_error___block_invoke;
    v33[3] = &unk_1E648FCD8;
    v33[4] = self;
    id v34 = v11;
    [(AKAppleIDServerUIEventHandlerImp *)eventHandler reauthenticateWithContext:authContext withCompletion:v33];
    v18 = v34;
LABEL_6:

    goto LABEL_7;
  }
  if ([v11 isResponseActionable:v8])
  {
    v19 = _AKLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C38C1000, v19, OS_LOG_TYPE_DEFAULT, "Signal received with an actionable response", buf, 2u);
    }

    uint64_t v20 = self->_authContext;
    authController = self->_authController;
    v21 = self->_eventHandler;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __93__AKAppleIDFollowUpServerUIPresenter__performAuthKitActionWithResponse_additionalData_error___block_invoke_57;
    v32[3] = &unk_1E648F720;
    v32[4] = self;
    [(AKAppleIDServerUIEventHandlerImp *)v21 updateStateWithExternalAuthenticationResponse:v8 forContext:v20 withAuthController:authController completion:v32];
  }
  else
  {
    if ([v11 isResponseFinalForHSA2ServerFlow:v8])
    {
      v23 = _AKLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1C38C1000, v23, OS_LOG_TYPE_DEFAULT, "Signal received for Final HSAA2 Server Flow", buf, 2u);
      }

      v24 = self->_eventHandler;
      id v25 = self->_authContext;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __93__AKAppleIDFollowUpServerUIPresenter__performAuthKitActionWithResponse_additionalData_error___block_invoke_58;
      v29[3] = &unk_1E6490058;
      v29[4] = self;
      id v30 = v8;
      id v31 = v9;
      [(AKAppleIDServerUIEventHandlerImp *)v24 startCDPRepairWithContext:v25 withAdditionalData:v31 completion:v29];

      v18 = v30;
      goto LABEL_6;
    }
    int v26 = [v11 isResponseCompleteAndConflict:v8];
    id v27 = _AKLogSystem();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1C38C1000, v27, OS_LOG_TYPE_DEFAULT, "Signal received with complete", buf, 2u);
      }

      [(AKAppleIDFollowUpServerUIPresenter *)self _performClientCompletionWithSuccess:1 error:0];
    }
    else
    {
      if (v28)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1C38C1000, v27, OS_LOG_TYPE_DEFAULT, "Handling final response", buf, 2u);
      }

      [(AKAppleIDFollowUpServerUIPresenter *)self handleFinalResponse:v8 additionalData:v9 error:v10];
    }
  }
LABEL_7:
}

uint64_t __93__AKAppleIDFollowUpServerUIPresenter__performAuthKitActionWithResponse_additionalData_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  if (a3) {
    return [v4 _performClientCompletionWithSuccess:0 error:a3];
  }
  else {
    return [v4 _signRequestAndPrepareServerConfig:*(void *)(a1 + 40)];
  }
}

uint64_t __93__AKAppleIDFollowUpServerUIPresenter__performAuthKitActionWithResponse_additionalData_error___block_invoke_57(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _performClientCompletionWithSuccess:a2 error:a3];
}

void __93__AKAppleIDFollowUpServerUIPresenter__performAuthKitActionWithResponse_additionalData_error___block_invoke_58(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if ((a2 & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 24) postCDPFollowUpForError:v5];
    id v5 = v6;
  }
  [*(id *)(a1 + 32) handleFinalResponse:*(void *)(a1 + 40) additionalData:*(void *)(a1 + 48) error:v5];
}

- (void)handleFinalResponse:(id)a3 additionalData:(id)a4 error:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F4EF70] signalFromServerResponse:v7];
  id v10 = [(AKAppleIDServerUIContextController *)self->_serverUIContextController serverUIDelegate];
  int v11 = [v10 isResponseFinal:v7];

  if (!v11)
  {
    if (v9 == 2)
    {
      uint64_t v15 = _AKLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_1C38C1000, v15, OS_LOG_TYPE_DEFAULT, "Signal received to cancel", (uint8_t *)&v25, 2u);
      }

      serverUIContextController = self->_serverUIContextController;
      id v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = -7003;
LABEL_16:
      v24 = objc_msgSend(v17, "ak_errorWithCode:", v18);
      [(AKAppleIDServerUIContextController *)serverUIContextController completeWithError:v24];

      goto LABEL_21;
    }
    if ((unint64_t)(v9 - 7) > 1)
    {
      v19 = _AKLogSystem();
      BOOL v23 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (v9 == 1)
      {
        if (v23)
        {
          LOWORD(v25) = 0;
          _os_log_impl(&dword_1C38C1000, v19, OS_LOG_TYPE_DEFAULT, "Signal received to skip user action", (uint8_t *)&v25, 2u);
        }

        serverUIContextController = self->_serverUIContextController;
        id v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v18 = -7038;
        goto LABEL_16;
      }
      if (v23)
      {
        int v25 = 138412290;
        id v26 = v7;
        uint64_t v20 = "Unknown server response %@";
        v21 = v19;
        uint32_t v22 = 12;
        goto LABEL_19;
      }
    }
    else
    {
      v19 = _AKLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        uint64_t v20 = "Signal received to teardown/ delete";
        v21 = v19;
        uint32_t v22 = 2;
LABEL_19:
        _os_log_impl(&dword_1C38C1000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v25, v22);
      }
    }

    [(AKAppleIDFollowUpServerUIPresenter *)self _performClientCompletionWithSuccess:0 error:0];
    goto LABEL_21;
  }
  id v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_1C38C1000, v12, OS_LOG_TYPE_DEFAULT, "Signal received with final response", (uint8_t *)&v25, 2u);
  }

  eventHandler = self->_eventHandler;
  int v14 = [(AKAppleIDAuthenticationInAppExtensionContext *)self->_authContext altDSID];
  [(AKAppleIDServerUIEventHandlerImp *)eventHandler updateAccountUsernameForAltDSID:v14 withHarvestedData:v8];

  [(AKAppleIDServerUIContextController *)self->_serverUIContextController completeWithFinalResponse:v7];
LABEL_21:
}

- (AKFollowUpProvider)followUpProvider
{
  return (AKFollowUpProvider *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFollowUpProvider:(id)a3
{
}

- (AKExtensionlessFollowUpHelperContext)followupHelperContext
{
  return self->_followupHelperContext;
}

- (void)setFollowupHelperContext:(id)a3
{
}

- (AKAppleIDAuthenticationInAppExtensionContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_followupHelperContext, 0);
  objc_storeStrong((id *)&self->followUpProvider, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_initialURL, 0);
  objc_storeStrong(&self->_serverUICompletion, 0);
  objc_storeStrong(&self->_presentingClientResponseCompletion, 0);
  objc_storeStrong(&self->_presentingClientCompletion, 0);
  objc_storeStrong((id *)&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_authController, 0);

  objc_storeStrong((id *)&self->_serverUIContextController, 0);
}

- (void)presentServerUIWithContext:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1C38C1000, v0, OS_LOG_TYPE_ERROR, "No altDSID provided in FollowUp, cannot present server UI.", v1, 2u);
}

- (void)presentServerUIWithContext:withCompletion:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1C38C1000, v0, OS_LOG_TYPE_ERROR, "No account found with altDSID %@, cannot present server UI", v1, 0xCu);
}

- (void)presentServerUIWithContext:(void *)a1 withCompletion:.cold.3(void *a1)
{
  v1 = [a1 urlKey];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_0(&dword_1C38C1000, v2, v3, "Failed to find Url key: %@ in bag, cannot present server UI", v4, v5, v6, v7, v8);
}

- (void)presentServerUIWithContext:withCompletion:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1C38C1000, v0, OS_LOG_TYPE_DEBUG, "Present Server UI with follow up context: %@", v1, 0xCu);
}

- (void)_signRequestAndPrepareServerConfig:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_4_1(a1) uniqueItemIdentifier];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_0(&dword_1C38C1000, v2, v3, "Failed to find IDMS data with id: %@", v4, v5, v6, v7, v8);
}

- (void)_presentServerUIWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Follow up item is missing, user interaction will not be acknowledged with server.", v2, v3, v4, v5, v6);
}

- (void)_presentServerUIWithConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Acknowledging user interacted with continuity push", v2, v3, v4, v5, v6);
}

- (void)signAdditionalHeadersWithRequest:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_4_1(a1) uniqueItemIdentifier];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_0(&dword_1C38C1000, v2, v3, "Failed to find IDMS data with id: %@", v4, v5, v6, v7, v8);
}

- (void)_fetchCurrentFollowUpItem
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Client did not provide a followUpProvider, defaulting to the AuthKit default one, which will only work with follow ups posted by AuthKit.", v2, v3, v4, v5, v6);
}

@end