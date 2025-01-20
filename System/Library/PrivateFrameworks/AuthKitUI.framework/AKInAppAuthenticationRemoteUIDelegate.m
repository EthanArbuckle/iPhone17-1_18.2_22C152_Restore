@interface AKInAppAuthenticationRemoteUIDelegate
- (AAUICDPStingrayRemoteUIController)stingrayController;
- (AKAppleIDServerUIContextController)serverUIContextController;
- (AKInAppAuthenticationRemoteUIDelegate)initWithContext:(id)a3;
- (BOOL)_isDeferrableFinalResponseHarvested;
- (BOOL)overrideFirstActionSignal;
- (RUIObjectModel)currentRemoteOM;
- (UINavigationController)modalRemoteUINavController;
- (unint64_t)_passwordResetRequestType;
- (void)_addBackButtonForController:(id)a3;
- (void)_handleBackButtonTap:(id)a3;
- (void)_processAndHandleConflictErrorFromResponse:(id)a3;
- (void)_showAlert:(id)a3;
- (void)clearObjectModel;
- (void)remoteUIController:(id)a3 didDismissModalNavigationWithObjectModels:(id)a4;
- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5;
- (void)remoteUIController:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4 forRequest:(id)a5;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6;
- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4;
- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)setOverrideFirstActionSignal:(BOOL)a3;
- (void)setServerUIContextController:(id)a3;
- (void)setStingrayController:(id)a3;
@end

@implementation AKInAppAuthenticationRemoteUIDelegate

- (AKInAppAuthenticationRemoteUIDelegate)initWithContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKInAppAuthenticationRemoteUIDelegate;
  v5 = [(AKInAppAuthenticationRemoteUIDelegate *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_context, v4);
  }

  return v6;
}

- (void)clearObjectModel
{
  self->_currentRemoteOM = 0;
  MEMORY[0x1F41817F8]();
}

- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a6;
  [(AKAppleIDServerUIContextController *)self->_serverUIContextController processResponse:a5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v12 = [WeakRetained presentingViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [v12 topViewController];
    v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v13;
      _os_log_impl(&dword_1C38C1000, v14, OS_LOG_TYPE_DEFAULT, "Starting nav controller: %@", buf, 0xCu);
    }

    objc_storeWeak((id *)&self->_topViewControllerOnLoadStart, v13);
  }
  v15 = [WeakRetained httpHeadersForRemoteUI];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __117__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke;
  v26[3] = &unk_1E648FD28;
  id v16 = v9;
  id v27 = v16;
  [v15 enumerateKeysAndObjectsUsingBlock:v26];
  if ([WeakRetained needsCredentialRecovery]) {
    int v17 = [WeakRetained isRequestedFromOOPViewService];
  }
  else {
    int v17 = 0;
  }
  v18 = [MEMORY[0x1E4F4F020] sharedManager];
  int v19 = [v18 isForgotPasswordNativeTakeoverEnabled];

  if (v19 && v17)
  {
    unint64_t v20 = [(AKInAppAuthenticationRemoteUIDelegate *)self _passwordResetRequestType];
    v21 = [NSNumber numberWithUnsignedInteger:v20];
    v22 = [v21 stringValue];
    [v16 setValue:v22 forHTTPHeaderField:*MEMORY[0x1E4F4ED10]];

    if ([WeakRetained isNativeTakeover])
    {
      v23 = (void *)MEMORY[0x1E4F4EF08];
LABEL_14:
      [v16 setValue:*v23 forHTTPHeaderField:*MEMORY[0x1E4F4EE30]];
      goto LABEL_15;
    }
    v24 = [WeakRetained serviceIdentifier];
    int v25 = [v24 isEqualToString:*MEMORY[0x1E4F4ED88]];

    if (v25)
    {
      v23 = (void *)MEMORY[0x1E4F4EF00];
      goto LABEL_14;
    }
  }
LABEL_15:
  [(AKAppleIDServerUIContextController *)self->_serverUIContextController signRequest:v16 withCompletionHandler:v10];
}

uint64_t __117__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4 forRequest:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  objc_super v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v7;
    _os_log_impl(&dword_1C38C1000, v8, OS_LOG_TYPE_DEFAULT, "A server UI request load succeeded with response: %@", (uint8_t *)&v16, 0xCu);
  }

  [(AKAppleIDServerUIContextController *)self->_serverUIContextController processResponse:v7];
  if ([(AKInAppAuthenticationRemoteUIDelegate *)self _isDeferrableFinalResponseHarvested])
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1C38C1000, v9, OS_LOG_TYPE_DEFAULT, "A deferrable final response detected, waiting for object model to load before completing", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    if (self->_currentRemoteOM)
    {
      id v10 = [(AKAppleIDServerUIContextController *)self->_serverUIContextController serverDataHarvester];
      [v10 harvestDataFromServerUIObjectModel:self->_currentRemoteOM];
    }
    v11 = [(AKAppleIDServerUIContextController *)self->_serverUIContextController serverUIDelegate];
    int v12 = [v11 isResponseFinal:v7];

    if (v12)
    {
      modalRemoteUINavController = self->_modalRemoteUINavController;
      v14 = _AKLogSystem();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (modalRemoteUINavController)
      {
        if (v15)
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1C38C1000, v14, OS_LOG_TYPE_DEFAULT, "We are inside a modal flow, deferring response processing", (uint8_t *)&v16, 2u);
        }

        objc_storeStrong((id *)&self->_deferredResponse, a4);
      }
      else
      {
        if (v15)
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1C38C1000, v14, OS_LOG_TYPE_DEFAULT, "Final response detected and we are not modal, finishing...", (uint8_t *)&v16, 2u);
        }

        [(AKAppleIDServerUIContextController *)self->_serverUIContextController completeWithFinalResponse:v7];
      }
    }
  }
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    if ([v9 code] == -999
      && ([v9 domain],
          v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 isEqualToString:*MEMORY[0x1E4F289A0]],
          v11,
          v12))
    {
      v13 = _AKLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C38C1000, v13, OS_LOG_TYPE_DEFAULT, "User cancelled error, nothing to do here", buf, 2u);
      }
    }
    else
    {
      v14 = [v9 userInfo];
      v13 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F95F90]];

      if ([v13 statusCode] == 401)
      {
        BOOL v15 = _AKLogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C38C1000, v15, OS_LOG_TYPE_DEFAULT, "Received a 401 , Trying to refresh tokens", buf, 2u);
        }

        int v16 = objc_alloc_init(AKAuthHandlerUIImpl);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
        id v24 = 0;
        uint64_t v18 = [(AKAuthHandlerUIImpl *)v16 buildReauthenticationContextFromContext:WeakRetained error:&v24];
        id v19 = v24;

        if (v19)
        {
          [(AKInAppAuthenticationRemoteUIDelegate *)self _showAlert:v9];
        }
        else
        {
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __94__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_didFinishLoadWithError_forRequest___block_invoke;
          v21[3] = &unk_1E648FD50;
          v21[4] = self;
          id v22 = v8;
          id v23 = v10;
          [(AKAuthHandlerImpl *)v16 reauthenticateWithContext:v18 completionWithResults:v21];
        }
      }
      else if ([v13 statusCode] == 409)
      {
        unint64_t v20 = _AKLogSystem();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C38C1000, v20, OS_LOG_TYPE_DEFAULT, "Received a 409 , Trying to rsolve the conflict by calling the appropriate endpoint.", buf, 2u);
        }

        [(AKInAppAuthenticationRemoteUIDelegate *)self _processAndHandleConflictErrorFromResponse:v13];
      }
      else
      {
        [(AKInAppAuthenticationRemoteUIDelegate *)self _showAlert:v9];
      }
    }
  }
}

void __94__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_didFinishLoadWithError_forRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = *(id **)(a1 + 32);
  if (v5)
  {
    id v7 = [v6[5] serverUIDelegate];
    [v7 updateWithAuthResults:v5];

    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1C38C1000, v8, OS_LOG_TYPE_DEFAULT, "Tokens refreshed try reloading the server UI", v9, 2u);
    }

    [*(id *)(a1 + 40) loadRequest:*(void *)(a1 + 48) completion:0];
  }
  else
  {
    [v6 _showAlert:a3];
  }
}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = (UINavigationController *)a4;
  v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1C38C1000, v6, OS_LOG_TYPE_DEFAULT, "Presenting modal nav controller: %@", (uint8_t *)&v10, 0xCu);
  }

  modalRemoteUINavController = self->_modalRemoteUINavController;
  self->_modalRemoteUINavController = v5;
  id v8 = v5;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained willPresentModalNavigationController:v8];
}

- (void)remoteUIController:(id)a3 didDismissModalNavigationWithObjectModels:(id)a4
{
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_1C38C1000, v5, OS_LOG_TYPE_DEFAULT, "Dismissed the modal nav controller", v12, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  modalRemoteUINavController = self->_modalRemoteUINavController;
  self->_modalRemoteUINavController = 0;

  [WeakRetained willPresentModalNavigationController:0];
  if (self->_deferredResponse)
  {
    [WeakRetained setPresentingServerUI:0];
    [(AKAppleIDServerUIContextController *)self->_serverUIContextController completeWithFinalResponse:self->_deferredResponse];
    deferredResponse = self->_deferredResponse;
    self->_deferredResponse = 0;
  }
  else
  {
    serverUIContextController = self->_serverUIContextController;
    deferredResponse = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7003);
    int v10 = [(AKAppleIDServerUIContextController *)self->_serverUIContextController serverDataHarvester];
    v11 = [v10 harvestedData];
    [(AKAppleIDServerUIContextController *)serverUIContextController completeWithError:deferredResponse additionalData:v11];
  }
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v48 = v9;
    __int16 v49 = 1024;
    BOOL v50 = a5 != 0;
    _os_log_impl(&dword_1C38C1000, v10, OS_LOG_TYPE_DEFAULT, "Server UI object model received: %@ - %d", buf, 0x12u);
  }

  objc_storeStrong((id *)&self->_currentRemoteOM, a4);
  v11 = [v9 allPages];
  if ([v11 count])
  {
  }
  else
  {
    uint64_t v12 = [v9 clientInfo];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      v14 = _AKLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C38C1000, v14, OS_LOG_TYPE_DEFAULT, "Request doesn't present anything, invoking processObjectModel since willPresentObjectModel won't get called", buf, 2u);
      }

      [(AAUICDPStingrayRemoteUIController *)self->_stingrayController processObjectModel:v9 isModal:0];
    }
  }
  BOOL v15 = [v8 navigationController];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  id v17 = objc_loadWeakRetained((id *)&self->_topViewControllerOnLoadStart);
  if ([WeakRetained forceInlinePresentation] && v17)
  {
    uint64_t v18 = [WeakRetained presentingViewController];
    id v19 = [v18 topViewController];

    if (v19 == v17)
    {
      uint64_t v41 = MEMORY[0x1E4F143A8];
      uint64_t v42 = 3221225472;
      v43 = __95__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_didReceiveObjectModel_actionSignal___block_invoke;
      v44 = &unk_1E648F2C8;
      id v45 = WeakRetained;
      id v46 = v17;
      dispatch_async(MEMORY[0x1E4F14428], &v41);
    }
    else
    {
      unint64_t v20 = _AKLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C38C1000, v20, OS_LOG_TYPE_DEFAULT, "Top view controller has changed since load start. Aborting flow.", buf, 2u);
      }

      if (a5) {
        *a5 = 0;
      }
    }
  }
  if (a5)
  {
    unint64_t v21 = *a5;
    if (*a5 == 1)
    {
      id v22 = _AKLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C38C1000, v22, OS_LOG_TYPE_DEFAULT, "Server UI is being dismissed.", buf, 2u);
      }

      if (self->_deferredResponse)
      {
        id v23 = _AKLogSystem();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C38C1000, v23, OS_LOG_TYPE_DEFAULT, "We have a deferred server response, waiting until dismissal completion", buf, 2u);
        }
      }
      else
      {
        [WeakRetained setPresentingServerUI:0];
        id v23 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7003);
        [WeakRetained completeWithError:v23];
      }
    }
    id v24 = objc_msgSend(v15, "presentedViewController", v41, v42, v43, v44);

    unint64_t v25 = *a5;
    if (v24)
    {
      unint64_t v26 = 2;
      if (v25 && v25 != 5) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
    if ((v25 | 2) == 2)
    {
      unint64_t v26 = 5;
LABEL_34:
      *a5 = v26;
    }
  }
  else
  {
    unint64_t v21 = 0;
  }
LABEL_35:
  if (objc_msgSend(WeakRetained, "forceInlinePresentation", v41, v42, v43, v44))
  {
    id v27 = _AKLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C38C1000, v27, OS_LOG_TYPE_DEFAULT, "Starting inline presentation", buf, 2u);
    }

    if (a5)
    {
      *a5 = v21;
      v28 = _AKLogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = [NSNumber numberWithUnsignedInteger:*a5];
        *(_DWORD *)buf = 138412290;
        id v48 = v29;
        _os_log_impl(&dword_1C38C1000, v28, OS_LOG_TYPE_DEFAULT, "Incoming signal: %@", buf, 0xCu);
      }
      if (self->_overrideFirstActionSignal)
      {
        if (*a5 != 2)
        {
          if (*a5 != 5) {
            goto LABEL_56;
          }
          *a5 = 2;
        }
        if ([WeakRetained needsCredentialRecovery]) {
          int v30 = [WeakRetained isRequestedFromOOPViewService];
        }
        else {
          int v30 = 0;
        }
        v31 = [MEMORY[0x1E4F4F020] sharedManager];
        int v32 = [v31 isForgotPasswordNativeTakeoverEnabled];

        v33 = [v15 viewControllers];
        uint64_t v34 = [v33 count];

        if (v32 && v30)
        {
          if (v34)
          {
            v35 = [v15 viewControllers];
            uint64_t v36 = [v35 count];

            if (v36 == 1)
            {
              v37 = [v9 defaultPages];
              v38 = [v37 firstObject];

              [v38 setLeftNavigationBarButtonItem:0];
              [(AKInAppAuthenticationRemoteUIDelegate *)self _addBackButtonForController:v17];
            }
          }
        }
        else
        {
          if (v34)
          {
            v39 = [v9 defaultPages];
            v40 = [v39 firstObject];

            [v40 setLeftNavigationBarButtonItem:0];
          }
          [(AKInAppAuthenticationRemoteUIDelegate *)self _addBackButtonForController:v17];
        }
      }
    }
  }
LABEL_56:
}

uint64_t __95__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_didReceiveObjectModel_actionSignal___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    id v4 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v4 willShowViewController:*(void *)(a1 + 40)];
    }
  }

  return MEMORY[0x1F4181870]();
}

- (void)_addBackButtonForController:(id)a3
{
  id v4 = a3;
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1C38C1000, v5, OS_LOG_TYPE_DEFAULT, "Handling first action signal", v11, 2u);
  }

  [MEMORY[0x1E4F42BE8] _setUseCustomBackButtonAction:1];
  self->_navBarButtonOverridden = 1;
  id v6 = objc_alloc(MEMORY[0x1E4F427C0]);
  id v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  id v8 = [v7 localizedStringForKey:@"GENERIC_BACK_BUTTON" value:&stru_1F1EE8138 table:@"Localizable"];
  id v9 = (void *)[v6 initWithTitle:v8 style:0 target:self action:sel__handleBackButtonTap_];
  int v10 = [v4 navigationItem];

  [v10 setBackBarButtonItem:v9];
  self->_overrideFirstActionSignal = 0;
}

- (void)_handleBackButtonTap:(id)a3
{
  id v5 = a3;
  if (self->_navBarButtonOverridden)
  {
    [MEMORY[0x1E4F42BE8] _setUseCustomBackButtonAction:0];
    self->_navBarButtonOverridden = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained _handleBackButtonTap:v5];
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    id v25 = v9;
    _os_log_impl(&dword_1C38C1000, v10, OS_LOG_TYPE_DEFAULT, "Server UI will present an object model: %@", (uint8_t *)&v24, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained setPresentingServerUI:1];
  if (!v5 && [WeakRetained forceInlinePresentation])
  {
    uint64_t v12 = [v8 navigationController];
    uint64_t v13 = [v12 viewControllers];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      int v15 = [WeakRetained needsCredentialRecovery]
          ? [WeakRetained isRequestedFromOOPViewService]
          : 0;
      int v16 = [MEMORY[0x1E4F4F020] sharedManager];
      int v17 = [v16 isForgotPasswordNativeTakeoverEnabled];

      if (!v17
        || !v15
        || ([v12 viewControllers],
            uint64_t v18 = objc_claimAutoreleasedReturnValue(),
            uint64_t v19 = [v18 count],
            v18,
            v19 == 1))
      {
        unint64_t v20 = [v9 defaultPages];
        unint64_t v21 = [v20 firstObject];

        [v21 setLeftNavigationBarButtonItem:0];
      }
    }
  }
  if (self->_currentRemoteOM
    && [(AKInAppAuthenticationRemoteUIDelegate *)self _isDeferrableFinalResponseHarvested])
  {
    id v22 = _AKLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1C38C1000, v22, OS_LOG_TYPE_DEFAULT, "Deferred final response detected, finishing...", (uint8_t *)&v24, 2u);
    }

    id v23 = [(AKAppleIDServerUIContextController *)self->_serverUIContextController serverDataHarvester];
    [v23 harvestDataFromServerUIObjectModel:self->_currentRemoteOM];

    [(AKAppleIDServerUIContextController *)self->_serverUIContextController completeWithFinalResponse:0];
  }
  else
  {
    [(AAUICDPStingrayRemoteUIController *)self->_stingrayController processObjectModel:v9 isModal:v5];
  }
}

- (void)remoteUIController:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_didReceiveChallenge_completionHandler___block_invoke;
  v11[3] = &unk_1E648F2A0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

uint64_t __98__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __98__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_didReceiveChallenge_completionHandler___block_invoke_cold_2(v2);
  }

  v3 = [*(id *)(a1 + 32) protectionSpace];
  id v4 = [v3 authenticationMethod];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F28988]];

  if (!v5) {
    goto LABEL_5;
  }
  id v6 = (void *)MEMORY[0x1E4F4EFF8];
  id v7 = [*(id *)(a1 + 32) protectionSpace];
  uint64_t v8 = [v7 serverTrust];
  id v9 = [*(id *)(a1 + 32) protectionSpace];
  id v10 = [v9 host];
  LODWORD(v6) = [v6 isValidCertificateTrust:v8 forHostname:v10];

  if (!v6)
  {
    id v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __98__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_didReceiveChallenge_completionHandler___block_invoke_cold_1(v12);
    }

    v11 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
LABEL_5:
    v11 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  return v11();
}

- (unint64_t)_passwordResetRequestType
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v3 = [MEMORY[0x1E4F4EF40] sharedInstance];
  id v4 = [v3 primaryAuthKitAccount];

  if (!v4)
  {
    unint64_t v11 = 0;
    goto LABEL_10;
  }
  uint64_t v5 = [WeakRetained username];
  if (!v5)
  {
LABEL_9:
    unint64_t v11 = 2;
    goto LABEL_10;
  }
  id v6 = (void *)v5;
  id v7 = [WeakRetained username];
  if (![v7 length])
  {

    goto LABEL_9;
  }
  uint64_t v8 = [v4 username];
  id v9 = [WeakRetained username];
  int v10 = [v8 isEqualToString:v9];

  if (v10) {
    unint64_t v11 = 1;
  }
  else {
    unint64_t v11 = 2;
  }
LABEL_10:

  return v11;
}

- (BOOL)_isDeferrableFinalResponseHarvested
{
  v3 = [(AKAppleIDServerUIContextController *)self->_serverUIContextController serverDataHarvester];
  id v4 = [v3 harvestedData];
  uint64_t v5 = *MEMORY[0x1E4F4ED38];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4ED38]];
  if ([v6 isEqualToString:*MEMORY[0x1E4F4ED50]])
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v8 = [(AKAppleIDServerUIContextController *)self->_serverUIContextController serverDataHarvester];
    id v9 = [v8 harvestedData];
    int v10 = [v9 objectForKeyedSubscript:v5];
    char v7 = [v10 isEqualToString:*MEMORY[0x1E4F4ED58]];
  }
  return v7;
}

- (void)_showAlert:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v3;
    _os_log_impl(&dword_1C38C1000, v4, OS_LOG_TYPE_DEFAULT, "A server UI load failed with error %@", buf, 0xCu);
  }

  uint64_t v5 = (void *)MEMORY[0x1E4F42728];
  id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  char v7 = [v6 localizedStringForKey:@"VERIFICATION_FAILED" value:&stru_1F1EE8138 table:@"Localizable"];
  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  id v9 = [v8 localizedStringForKey:@"SERVER_ERROR" value:&stru_1F1EE8138 table:@"Localizable"];
  int v10 = [v5 alertControllerWithTitle:v7 message:v9 preferredStyle:1];

  unint64_t v11 = (void *)MEMORY[0x1E4F42720];
  id v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  id v13 = [v12 localizedStringForKey:@"OK" value:&stru_1F1EE8138 table:@"Localizable"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __52__AKInAppAuthenticationRemoteUIDelegate__showAlert___block_invoke;
  v21[3] = &unk_1E648FD78;
  v21[4] = self;
  id v22 = v3;
  id v14 = v3;
  int v15 = [v11 actionWithTitle:v13 style:1 handler:v21];
  [v10 addAction:v15];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  int v17 = [WeakRetained presentingViewController];
  uint64_t v18 = [v17 presentedViewController];
  uint64_t v19 = v18;
  if (!v18) {
    uint64_t v18 = v17;
  }
  [v18 presentViewController:v10 animated:1 completion:0];
}

void __52__AKInAppAuthenticationRemoteUIDelegate__showAlert___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:underlyingError:", -7019, *(void *)(a1 + 40));
  [WeakRetained completeWithError:v2];
}

- (void)_processAndHandleConflictErrorFromResponse:(id)a3
{
  id v4 = a3;
  if (-[AKInAppAuthenticationRemoteUIDelegate _isDeferrableFinalResponseHarvested](self, "_isDeferrableFinalResponseHarvested")|| (-[AKAppleIDServerUIContextController serverUIDelegate](self->_serverUIContextController, "serverUIDelegate"), uint64_t v5 = [(AKAppleIDServerUIContextController *)self->_serverUIContextController processResponse:v4];
  {
    uint64_t v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1C38C1000, v8, OS_LOG_TYPE_DEFAULT, "A deferrable final response detected, waiting for object model to load before completing", v9, 2u);
    }
  }
  else
  {
    char v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C38C1000, v7, OS_LOG_TYPE_DEFAULT, "We have a conflict but complete response.", buf, 2u);
    }

    [(AKAppleIDServerUIContextController *)self->_serverUIContextController completeWithFinalResponse:v4];
  }
}

- (AKAppleIDServerUIContextController)serverUIContextController
{
  return self->_serverUIContextController;
}

- (void)setServerUIContextController:(id)a3
{
}

- (RUIObjectModel)currentRemoteOM
{
  return self->_currentRemoteOM;
}

- (UINavigationController)modalRemoteUINavController
{
  return self->_modalRemoteUINavController;
}

- (BOOL)overrideFirstActionSignal
{
  return self->_overrideFirstActionSignal;
}

- (void)setOverrideFirstActionSignal:(BOOL)a3
{
  self->_overrideFirstActionSignal = a3;
}

- (AAUICDPStingrayRemoteUIController)stingrayController
{
  return self->_stingrayController;
}

- (void)setStingrayController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stingrayController, 0);
  objc_storeStrong((id *)&self->_modalRemoteUINavController, 0);
  objc_storeStrong((id *)&self->_currentRemoteOM, 0);
  objc_storeStrong((id *)&self->_serverUIContextController, 0);
  objc_storeStrong((id *)&self->_deferredResponse, 0);
  objc_destroyWeak((id *)&self->_topViewControllerOnLoadStart);

  objc_destroyWeak((id *)&self->_context);
}

void __98__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_didReceiveChallenge_completionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C38C1000, log, OS_LOG_TYPE_ERROR, "Server cert validity check failed!", v1, 2u);
}

void __98__AKInAppAuthenticationRemoteUIDelegate_remoteUIController_didReceiveChallenge_completionHandler___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C38C1000, log, OS_LOG_TYPE_DEBUG, "Server UI received a challange, validating...", v1, 2u);
}

@end