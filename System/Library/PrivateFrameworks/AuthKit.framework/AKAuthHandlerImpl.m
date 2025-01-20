@interface AKAuthHandlerImpl
- (BOOL)forceSilentAuth;
- (id)buildReauthenticationContextFromContext:(id)a3 error:(id *)a4;
- (void)reauthenticateWithContext:(id)a3 completion:(id)a4;
- (void)reauthenticateWithContext:(id)a3 completionWithResults:(id)a4;
- (void)setForceSilentAuth:(BOOL)a3;
@end

@implementation AKAuthHandlerImpl

- (id)buildReauthenticationContextFromContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 _updateWithValuesFromContext:v6];
  [v7 setIsUsernameEditable:0];
  [v7 setShouldSkipSettingsLaunchAlert:1];
  v8 = [v7 username];

  if (v8)
  {
LABEL_8:
    if ([(AKAuthHandlerImpl *)self forceSilentAuth]) {
      [v7 setAuthenticationType:1];
    }
    id v17 = v7;
    goto LABEL_11;
  }
  v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193494000, v9, OS_LOG_TYPE_DEFAULT, "Missing username, trying to fetch one via idMS account", buf, 2u);
  }

  v10 = +[AKAccountManager sharedInstance];
  v11 = [v6 altDSID];
  v12 = [v10 authKitAccountWithAltDSID:v11 error:0];

  v13 = [v12 username];

  v14 = _AKLogSystem();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Using idMS account username", v19, 2u);
    }

    v16 = [v12 username];
    [v7 setUsername:v16];

    goto LABEL_8;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[AKAuthHandlerImpl buildReauthenticationContextFromContext:error:](v15);
  }

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7022);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v17 = 0;
LABEL_11:

  return v17;
}

- (void)reauthenticateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__AKAuthHandlerImpl_reauthenticateWithContext_completion___block_invoke;
  v8[3] = &unk_1E575EAE8;
  id v9 = v6;
  id v7 = v6;
  [(AKAuthHandlerImpl *)self reauthenticateWithContext:a3 completionWithResults:v8];
}

uint64_t __58__AKAuthHandlerImpl_reauthenticateWithContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reauthenticateWithContext:(id)a3 completionWithResults:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(AKAppleIDAuthenticationController);
  [(AKAppleIDAuthenticationController *)v7 authenticateWithContext:v6 completion:v5];
}

- (BOOL)forceSilentAuth
{
  return self->_forceSilentAuth;
}

- (void)setForceSilentAuth:(BOOL)a3
{
  self->_forceSilentAuth = a3;
}

- (void)buildReauthenticationContextFromContext:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Matching account missing, there be dragons ahead!", v1, 2u);
}

@end