@interface AKASAuthorizationProvider
- (AKASAuthorizationProvider)initWithAppName:(id)a3 teamIdentifier:(id)a4 bundleIdentifier:(id)a5 authorizationRequest:(id)a6;
- (BOOL)_shouldContinueWithPasswordForError:(id)a3;
- (BOOL)alertHandlerShowAlert:(id)a3 primaryAction:(id)a4 altAction:(id)a5;
- (_ASAuthenticationPresentationProvider)presentationProvider;
- (_ASAuthenticationProviderLoginRowData)loginRowData;
- (id)_accountNameForLoginChoice:(id)a3;
- (id)_detailTextForLoginChoice:(id)a3;
- (id)_iconImageForLoginChoice:(id)a3;
- (id)_paneTitleForLoginChoice:(id)a3;
- (id)loginRowDataForLoginChoice:(id)a3;
- (void)_handleAuthorizationError:(id)a3;
- (void)_performAuthorizationWithCompletionHandler:(id)a3;
- (void)_showPasswordAuthenticationViewController;
- (void)passwordAuthenticationCompletedWithResults:(id)a3 error:(id)a4;
- (void)performAuthorizationWithCompletionHandler:(id)a3;
- (void)performAuthorizationWithLoginChoice:(id)a3 completionHandler:(id)a4;
- (void)setPresentationProvider:(id)a3;
@end

@implementation AKASAuthorizationProvider

- (AKASAuthorizationProvider)initWithAppName:(id)a3 teamIdentifier:(id)a4 bundleIdentifier:(id)a5 authorizationRequest:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)AKASAuthorizationProvider;
  v15 = [(AKASAuthorizationProvider *)&v29 init];
  if (v15)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F4F088]);
    [v16 setTeamID:v12];
    [v16 setBundleID:v13];
    [v16 setShouldSkipAuthorizationUI:1];
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F4F008]) initWithProxiedClientContext:v16];
    requestContext = v15->_requestContext;
    v15->_requestContext = (AKCredentialRequestContext *)v17;

    v19 = [v14 authkitAccount];

    if (!v19)
    {
      v20 = _AKLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[AKASAuthorizationProvider initWithAppName:teamIdentifier:bundleIdentifier:authorizationRequest:](v20);
      }

      v21 = [MEMORY[0x1E4F4EF40] sharedInstance];
      v22 = [v21 authKitAccountRequestingAuthorization];
      [v14 setAuthkitAccount:v22];
    }
    [(AKCredentialRequestContext *)v15->_requestContext setAuthorizationRequest:v14];
    v23 = [(AKCredentialRequestContext *)v15->_requestContext authorizationRequest];
    [v23 setClientID:v13];

    objc_storeStrong((id *)&v15->_appName, a3);
    v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.AuthKit.AKASAuthorizationProvider", v24);
    requestQueue = v15->_requestQueue;
    v15->_requestQueue = (OS_dispatch_queue *)v25;

    v27 = v15;
  }

  return v15;
}

- (void)performAuthorizationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__AKASAuthorizationProvider_performAuthorizationWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E648F2A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(requestQueue, v7);
}

void __71__AKASAuthorizationProvider_performAuthorizationWithCompletionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 24))
  {
    v1 = _AKLogSystem();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __71__AKASAuthorizationProvider_performAuthorizationWithCompletionHandler___block_invoke_cold_1(v1);
    }
  }
  else
  {
    uint64_t v3 = MEMORY[0x1C8777520](*(void *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    char v6 = [*(id *)(*(void *)(a1 + 32) + 8) _requirePassword];
    v7 = *(unsigned char **)(a1 + 32);
    if ((v6 & 1) != 0 || v7[40])
    {
      [v7 _showPasswordAuthenticationViewController];
    }
    else
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __71__AKASAuthorizationProvider_performAuthorizationWithCompletionHandler___block_invoke_25;
      v8[3] = &unk_1E648F6D0;
      v8[4] = v7;
      [v7 _performAuthorizationWithCompletionHandler:v8];
    }
  }
}

void __71__AKASAuthorizationProvider_performAuthorizationWithCompletionHandler___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__AKASAuthorizationProvider_performAuthorizationWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E648F278;
  id v12 = v5;
  uint64_t v13 = v7;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);
}

uint64_t __71__AKASAuthorizationProvider_performAuthorizationWithCompletionHandler___block_invoke_2(void *a1)
{
  uint64_t v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
  {
    uint64_t v4 = v2[3];
    if (v4)
    {
      (*(void (**)(void))(v4 + 16))(v2[3]);
      v2 = (void *)a1[5];
    }
    v2[3] = 0;
    return MEMORY[0x1F41817F8]();
  }
  else
  {
    uint64_t v5 = a1[6];
    return [v2 _handleAuthorizationError:v5];
  }
}

- (void)performAuthorizationWithLoginChoice:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = _AKLogSiwa();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[AKASAuthorizationProvider performAuthorizationWithLoginChoice:completionHandler:](v8);
    }

    id v9 = [v6 sharedAccount];
    id v10 = [(AKCredentialRequestContext *)self->_requestContext authorizationRequest];
    objc_msgSend(v10, "set_sharedAccount:", v9);

    id v11 = [(AKCredentialRequestContext *)self->_requestContext authorizationRequest];
    objc_msgSend(v11, "set_isAuthorizingUsingSharedAccount:", 1);
  }
  [(AKASAuthorizationProvider *)self performAuthorizationWithCompletionHandler:v7];
}

- (void)_showPasswordAuthenticationViewController
{
  id v9 = objc_alloc_init(AKAuthorizationPasswordAuthenticationViewController);
  id v3 = objc_alloc(MEMORY[0x1E4F4EFA0]);
  uint64_t v4 = [(AKCredentialRequestContext *)self->_requestContext authorizationRequest];
  uint64_t v5 = [v4 authkitAccount];
  id v6 = [v5 username];
  id v7 = (void *)[v3 initWithUsername:v6];

  [(AKAuthorizationPasswordAuthenticationViewController *)v9 setPresentationContext:v7];
  [(AKAuthorizationPasswordAuthenticationViewController *)v9 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationProvider);
  [WeakRetained authenticationProvider:self showViewController:v9];
}

- (void)_performAuthorizationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F4EF90]);
  requestContext = self->_requestContext;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__AKASAuthorizationProvider__performAuthorizationWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E648F6F8;
  id v9 = v4;
  id v7 = v4;
  [v5 performAuthorizationWithContext:requestContext completion:v8];
}

uint64_t __72__AKASAuthorizationProvider__performAuthorizationWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleAuthorizationError:(id)a3
{
  id v4 = a3;
  if ([(AKASAuthorizationProvider *)self _shouldContinueWithPasswordForError:v4])
  {
    self->_didFailWithErrorRequiringPasswordAuth = 1;
  }
  id v5 = [MEMORY[0x1E4F4EF48] sharedInstance];
  [v5 setUiProvider:self];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__AKASAuthorizationProvider__handleAuthorizationError___block_invoke;
  v6[3] = &unk_1E648F720;
  v6[4] = self;
  [v5 showAlertForError:v4 withCompletion:v6];
}

void __55__AKASAuthorizationProvider__handleAuthorizationError___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v13 = a3;
  id v5 = [v13 userInfo];
  id v6 = (void *)[v5 mutableCopy];

  if (a2) {
    [v6 setValue:MEMORY[0x1E4F1CC38] forKey:@"AKErrorAlertShouldDismissUIAfterPresentationKey"];
  }
  id v7 = (void *)MEMORY[0x1E4F28C58];
  if (v13)
  {
    id v8 = [v13 domain];
    id v9 = objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, objc_msgSend(v13, "code"), v6);
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4ED70] code:-7001 userInfo:v6];
  }
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(v10 + 24);
  if (v11)
  {
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v9);
    uint64_t v10 = *(void *)(a1 + 32);
    id v12 = *(void **)(v10 + 24);
  }
  else
  {
    id v12 = 0;
  }
  *(void *)(v10 + 24) = 0;
}

- (BOOL)_shouldContinueWithPasswordForError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  char v5 = [v4 isEqualToString:*MEMORY[0x1E4F4ED70]];

  BOOL v6 = (v5 & 1) == 0 && ([v3 code] == -7006 || objc_msgSend(v3, "code") == -7075);
  return v6;
}

- (_ASAuthenticationProviderLoginRowData)loginRowData
{
  id v3 = [(AKASAuthorizationProvider *)self _accountNameForLoginChoice:0];
  id v4 = [(AKASAuthorizationProvider *)self _paneTitleForLoginChoice:0];
  char v5 = [(AKASAuthorizationProvider *)self _detailTextForLoginChoice:0];
  BOOL v6 = [(AKASAuthorizationProvider *)self _iconImageForLoginChoice:0];
  id v7 = [AKLoginRowData alloc];
  if ([(AKCredentialRequestContext *)self->_requestContext _requirePassword]) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = [(AKLoginRowData *)v7 initWithIconImage:v6 paneTitleText:v4 titleText:v3 detailText:v5 authenticationType:v8];

  return (_ASAuthenticationProviderLoginRowData *)v9;
}

- (id)loginRowDataForLoginChoice:(id)a3
{
  id v4 = a3;
  char v5 = [(AKASAuthorizationProvider *)self _accountNameForLoginChoice:v4];
  BOOL v6 = [(AKASAuthorizationProvider *)self _paneTitleForLoginChoice:v4];
  id v7 = [(AKASAuthorizationProvider *)self _detailTextForLoginChoice:v4];
  uint64_t v8 = [(AKASAuthorizationProvider *)self _iconImageForLoginChoice:v4];

  id v9 = [AKLoginRowData alloc];
  if ([(AKCredentialRequestContext *)self->_requestContext _requirePassword]) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [(AKLoginRowData *)v9 initWithIconImage:v8 paneTitleText:v6 titleText:v5 detailText:v7 authenticationType:v10];

  return v11;
}

- (id)_accountNameForLoginChoice:(id)a3
{
  if (a3)
  {
    id v3 = [a3 user];
  }
  else
  {
    char v5 = [MEMORY[0x1E4F4F020] sharedManager];
    int v6 = [v5 isAABrandingEnabled];

    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F28F30]);
      uint64_t v8 = [MEMORY[0x1E4F4EF40] sharedInstance];
      id v9 = [(AKCredentialRequestContext *)self->_requestContext authorizationRequest];
      uint64_t v10 = [v9 authkitAccount];
      uint64_t v11 = [v8 familyNameForAccount:v10];
      [v7 setFamilyName:v11];

      id v12 = [MEMORY[0x1E4F4EF40] sharedInstance];
      id v13 = [(AKCredentialRequestContext *)self->_requestContext authorizationRequest];
      id v14 = [v13 authkitAccount];
      v15 = [v12 givenNameForAccount:v14];
      [v7 setGivenName:v15];

      id v16 = objc_alloc_init(MEMORY[0x1E4F28F38]);
      id v3 = [v16 stringFromPersonNameComponents:v7];
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F4F0E0];
      v18 = [(AKCredentialRequestContext *)self->_requestContext authorizationRequest];
      v19 = [v18 authkitAccount];
      v20 = [v19 username];
      id v3 = [v17 formattedUsernameFromUsername:v20];
    }
  }

  return v3;
}

- (id)_iconImageForLoginChoice:(id)a3
{
  id v3 = a3;
  +[AKAuthorizationSubPaneMetrics scopeImageViewSize];
  double v5 = v4;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v6 = [v3 sharedAccount];
      id v7 = [v6 shareInfo];
      uint64_t v8 = [v7 participantHandle];

      id v9 = +[AKSignInWithAppleAvatarManager avatarImageForUserHandle:v8 diameter:v5];
    }
    else
    {
      id v9 = +[AKSignInWithAppleAvatarManager avatarImageForPrimaryAccountOwnerWithDiameter:v5];
    }
  }
  else
  {
    uint64_t v10 = +[AKIcon iconWithName:@"blackLogo", v4, v4 size];
    id v9 = [v10 automaskedImage];
  }

  return v9;
}

- (id)_paneTitleForLoginChoice:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v5 = NSString;
    int v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"CREDENTIAL_PICKER_SHARED_ACCOUNT" value:&stru_1F1EE8138 table:@"Localizable"];
    appName = self->_appName;
    id v9 = [(AKASAuthorizationProvider *)self _accountNameForLoginChoice:v4];
    uint64_t v10 = objc_msgSend(v5, "stringWithFormat:", v7, appName, v9);
  }
  else
  {
    uint64_t v11 = NSString;
    int v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"AUTHORIZE_APPLE_ACCOUNT_WELCOME_BACK_APPNAME_FORMAT" value:&stru_1F1EE8138 table:@"Localizable"];
    uint64_t v10 = objc_msgSend(v11, "stringWithFormat:", v7, self->_appName);
  }

  return v10;
}

- (id)_detailTextForLoginChoice:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    double v5 = NSString;
    int v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"SIGN_IN_WITH_APPLE_PICKER" value:&stru_1F1EE8138 table:@"Localizable"];
    uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v9 = v8;
    if (isKindOfClass) {
      uint64_t v10 = @"AUTHORIZE_SHARED_ACCOUNT_LOGIN_CHOICE_SUBTITLE";
    }
    else {
      uint64_t v10 = @"AUTHORIZE_EXISTING_ACCOUNT_LOGIN_CHOICE_SUBTITLE";
    }
    id v12 = [v8 localizedStringForKey:v10 value:&stru_1F1EE8138 table:@"Localizable"];
    uint64_t v11 = [v5 stringWithFormat:@"%@ — %@", v7, v12];
  }
  else
  {
    int v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v11 = [v6 localizedStringForKey:@"SIGN_IN_WITH_APPLE_PICKER" value:&stru_1F1EE8138 table:@"Localizable"];
  }

  return v11;
}

- (void)passwordAuthenticationCompletedWithResults:(id)a3 error:(id)a4
{
  id v5 = a4;
  int v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "ak_isUserCancelError") & 1) == 0)
    {
      id v7 = _AKLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[AKASAuthorizationProvider passwordAuthenticationCompletedWithResults:error:]((uint64_t)v6, v7);
      }
    }
    completionHandlerForCurrentRequest = (void (**)(id, void, void *))self->_completionHandlerForCurrentRequest;
    if (completionHandlerForCurrentRequest)
    {
      completionHandlerForCurrentRequest[2](completionHandlerForCurrentRequest, 0, v6);
      id v9 = self->_completionHandlerForCurrentRequest;
    }
    else
    {
      id v9 = 0;
    }
    self->_completionHandlerForCurrentRequest = 0;
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__AKASAuthorizationProvider_passwordAuthenticationCompletedWithResults_error___block_invoke;
    v10[3] = &unk_1E648F6D0;
    v10[4] = self;
    [(AKASAuthorizationProvider *)self _performAuthorizationWithCompletionHandler:v10];
  }
}

void __78__AKASAuthorizationProvider_passwordAuthenticationCompletedWithResults_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__AKASAuthorizationProvider_passwordAuthenticationCompletedWithResults_error___block_invoke_2;
  block[3] = &unk_1E648F278;
  void block[4] = v7;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);
}

void __78__AKASAuthorizationProvider_passwordAuthenticationCompletedWithResults_error___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  id v3 = *(void (***)(void, void, void))(v2 + 24);
  if (v3)
  {
    v3[2](v3, a1[5], a1[6]);
    uint64_t v2 = a1[4];
    id v3 = *(void (***)(void, void, void))(v2 + 24);
  }
  *(void *)(v2 + 24) = 0;
}

- (BOOL)alertHandlerShowAlert:(id)a3 primaryAction:(id)a4 altAction:(id)a5
{
  p_presentationProvider = &self->_presentationProvider;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_presentationProvider);
  [WeakRetained authenticationProvider:self presentAlert:v11 primaryAction:v10 alternateAction:v9];

  return 1;
}

- (_ASAuthenticationPresentationProvider)presentationProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationProvider);

  return (_ASAuthenticationPresentationProvider *)WeakRetained;
}

- (void)setPresentationProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationProvider);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong(&self->_completionHandlerForCurrentRequest, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);

  objc_storeStrong((id *)&self->_requestContext, 0);
}

- (void)initWithAppName:(os_log_t)log teamIdentifier:bundleIdentifier:authorizationRequest:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C38C1000, log, OS_LOG_TYPE_ERROR, "Request did not contain a preset account. Attempting to set the account.", v1, 2u);
}

void __71__AKASAuthorizationProvider_performAuthorizationWithCompletionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C38C1000, log, OS_LOG_TYPE_ERROR, "Authentication provider cannot perform request because there is already a request being processed.", v1, 2u);
}

- (void)performAuthorizationWithLoginChoice:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C38C1000, log, OS_LOG_TYPE_DEBUG, "Selected shared account from credential picker", v1, 2u);
}

- (void)passwordAuthenticationCompletedWithResults:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_ERROR, "Password authentication failed in authentication provider with error: %@", (uint8_t *)&v2, 0xCu);
}

@end