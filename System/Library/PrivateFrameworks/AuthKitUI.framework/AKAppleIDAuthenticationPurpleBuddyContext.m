@interface AKAppleIDAuthenticationPurpleBuddyContext
- (AKAppleIDAuthenticationPurpleBuddyContext)init;
- (NSString)passwordForCreating;
- (NSString)usernameForCreating;
- (UINavigationController)navigationController;
- (void)dismissBasicLoginUIWithCompletion:(id)a3;
- (void)dismissServerProvidedUIWithCompletion:(id)a3;
- (void)passwordForCreating;
- (void)presentBasicLoginUIWithCompletion:(id)a3;
- (void)presentBiometricOrPasscodeValidationForAppleID:(id)a3 completion:(id)a4;
- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)setNavigationController:(id)a3;
@end

@implementation AKAppleIDAuthenticationPurpleBuddyContext

- (AKAppleIDAuthenticationPurpleBuddyContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)AKAppleIDAuthenticationPurpleBuddyContext;
  v2 = [(AKAppleIDAuthenticationPurpleBuddyContext *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(AKAppleIDAuthenticationPurpleBuddyContext *)v2 setShouldUpdatePersistentServiceTokens:1];
    [(AKAppleIDAuthenticationPurpleBuddyContext *)v3 setAuthenticationType:2];
    [(AKAppleIDAuthenticationPurpleBuddyContext *)v3 setSupportsPiggybacking:1];
    [(AKAppleIDAuthenticationInAppContext *)v3 setForceInlinePresentation:1];
  }
  return v3;
}

- (NSString)usernameForCreating
{
  v2 = [(AKAppleIDAuthenticationInAppContext *)self serverDataHarvester];
  v3 = [v2 harvestedData];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F4EE10]];

  return (NSString *)v4;
}

- (NSString)passwordForCreating
{
  v3 = [(AKAppleIDAuthenticationInAppContext *)self serverDataHarvester];
  v4 = [v3 harvestedData];
  objc_super v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4EDE8]];

  v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(AKAppleIDAuthenticationPurpleBuddyContext *)self passwordForCreating];
  }

  return (NSString *)v5;
}

- (void)presentBasicLoginUIWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(AKAppleIDAuthenticationPurpleBuddyContext *)self _shortLivedToken];

  if (v5)
  {
    v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C38C1000, v6, OS_LOG_TYPE_DEFAULT, "Suppressing interactive login for SLT upgrade", buf, 2u);
    }

    if (v4)
    {
      v7 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7027);
      (*((void (**)(id, void, void, void, void *))v4 + 2))(v4, 0, 0, 0, v7);
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AKAppleIDAuthenticationPurpleBuddyContext;
    [(AKAppleIDAuthenticationInAppContext *)&v8 presentBasicLoginUIWithCompletion:v4];
  }
}

- (void)dismissBasicLoginUIWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  objc_super v5 = [(AKAppleIDAuthenticationPurpleBuddyContext *)self _shortLivedToken];

  if (v5)
  {
    v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C38C1000, v6, OS_LOG_TYPE_DEFAULT, "Suppressing login dismiss for SLT upgrade", buf, 2u);
    }

    if (v4)
    {
      v7 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7027);
      v4[2](v4, 0, v7);
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AKAppleIDAuthenticationPurpleBuddyContext;
    [(AKAppleIDAuthenticationInAppContext *)&v8 dismissBasicLoginUIWithCompletion:v4];
  }
}

- (void)dismissServerProvidedUIWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__AKAppleIDAuthenticationPurpleBuddyContext_dismissServerProvidedUIWithCompletion___block_invoke;
  v6[3] = &unk_1E648F2A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

id __83__AKAppleIDAuthenticationPurpleBuddyContext_dismissServerProvidedUIWithCompletion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isPresentingServerUI])
  {
    v2 = [*(id *)(a1 + 32) presentingViewController];
    [v2 dismissViewControllerAnimated:1 completion:0];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)AKAppleIDAuthenticationPurpleBuddyContext;
  return objc_msgSendSuper2(&v5, sel_dismissServerProvidedUIWithCompletion_, v3);
}

- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v10 domain];
  if (![v14 isEqualToString:*MEMORY[0x1E4F4ED70]])
  {

    goto LABEL_8;
  }
  uint64_t v15 = [v10 code];

  if (v15 != -7034)
  {
LABEL_8:
    v17.receiver = self;
    v17.super_class = (Class)AKAppleIDAuthenticationPurpleBuddyContext;
    [(AKAppleIDAuthenticationInAppContext *)&v17 _presentLoginAlertWithError:v10 title:v11 message:v12 waitForInteraction:1 completion:v13];
    goto LABEL_9;
  }
  v16 = _AKLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v16, OS_LOG_TYPE_DEFAULT, "Suppressing error for forced failure", buf, 2u);
  }

  if (v13) {
    (*((void (**)(id, void, void, void, id))v13 + 2))(v13, 0, 0, 0, v10);
  }
LABEL_9:
}

- (void)presentBiometricOrPasscodeValidationForAppleID:(id)a3 completion:(id)a4
{
  objc_super v5 = (void *)MEMORY[0x1E4F28C58];
  id v6 = a4;
  objc_msgSend(v5, "ak_errorWithCode:", -7027);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v6, 0, v7);
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AKAppleIDAuthenticationPurpleBuddyContext;
  id v7 = a4;
  [(AKAppleIDAuthenticationInAppContext *)&v9 remoteUIController:a3 didReceiveObjectModel:v7 actionSignal:a5];
  objc_super v8 = objc_msgSend(MEMORY[0x1E4F95F68], "setupAssistantStyle", v9.receiver, v9.super_class);
  [v8 applyToObjectModel:v7];
}

- (UINavigationController)navigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);

  return (UINavigationController *)WeakRetained;
}

- (void)setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationController);
  objc_destroyWeak((id *)&self->_topViewControllerOnLoadStart);

  objc_storeStrong((id *)&self->_overrideFirstActionSignal, 0);
}

- (void)passwordForCreating
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [a1 serverDataHarvester];
  if (a2)
  {
    uint64_t v7 = [a2 length];
    id v6 = @"(******)";
    if (!v7) {
      id v6 = @"(empty)";
    }
  }
  else
  {
    id v6 = @"(null)";
  }
  int v8 = 138478083;
  objc_super v9 = v5;
  __int16 v10 = 2113;
  id v11 = v6;
  _os_log_debug_impl(&dword_1C38C1000, a3, OS_LOG_TYPE_DEBUG, "Buddy password from harverster %{private}@ - %{private}@", (uint8_t *)&v8, 0x16u);
}

@end