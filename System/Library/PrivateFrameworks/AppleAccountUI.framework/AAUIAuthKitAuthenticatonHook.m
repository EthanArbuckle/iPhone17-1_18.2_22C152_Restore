@interface AAUIAuthKitAuthenticatonHook
- (AAUIAuthKitAuthenticatonHook)initWithUsername:(id)a3 altDSID:(id)a4;
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (RUIServerHookResponse)serverHookResponse;
- (id)_authContextFromAttributes:(id)a3;
- (void)_reauthenticateWithServerAttributes:(id)a3 completion:(id)a4;
- (void)_updateResponseWithAuthResults:(id)a3;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setServerHookResponse:(id)a3;
@end

@implementation AAUIAuthKitAuthenticatonHook

- (AAUIAuthKitAuthenticatonHook)initWithUsername:(id)a3 altDSID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(AAUIAuthKitAuthenticatonHook *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appleId, a3);
    objc_storeStrong((id *)&v10->_altDSID, a4);
  }

  return v10;
}

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"ak:auth"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char v4 = [v3 clientInfo];

  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F63818]];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  char v7 = [v6 isEqualToString:@"ak:auth"];
  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 clientInfo];
  [(AAUIAuthKitAuthenticatonHook *)self _reauthenticateWithServerAttributes:v7 completion:v6];
}

- (void)_reauthenticateWithServerAttributes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AAUIAuthKitAuthenticatonHook *)self _authContextFromAttributes:v6];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__13;
  v18 = __Block_byref_object_dispose__13;
  id v19 = objc_alloc_init(MEMORY[0x263F29118]);
  v9 = (void *)v15[5];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__AAUIAuthKitAuthenticatonHook__reauthenticateWithServerAttributes_completion___block_invoke;
  v11[3] = &unk_263F94398;
  v13 = &v14;
  id v10 = v7;
  v11[4] = self;
  id v12 = v10;
  [v9 authenticateWithContext:v8 completion:v11];

  _Block_object_dispose(&v14, 8);
}

void __79__AAUIAuthKitAuthenticatonHook__reauthenticateWithServerAttributes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  if (v6)
  {
    v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __79__AAUIAuthKitAuthenticatonHook__reauthenticateWithServerAttributes_completion___block_invoke_cold_1((uint64_t)v6, v9);
    }

    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      v11 = *(void (**)(void))(v10 + 16);
LABEL_8:
      v11();
    }
  }
  else
  {
    [*(id *)(a1 + 32) _updateResponseWithAuthResults:v5];
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12)
    {
      v11 = *(void (**)(void))(v12 + 16);
      goto LABEL_8;
    }
  }
}

- (id)_authContextFromAttributes:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F292A8]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v7 = [WeakRetained presentationContextForHook:self];
  [v5 setPresentingViewController:v7];

  [v5 setAuthenticationType:2];
  [v5 setIsUsernameEditable:0];
  [v5 setAltDSID:self->_altDSID];
  objc_opt_class();
  id v8 = [v4 objectForKeyedSubscript:@"username"];
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  uint64_t v10 = [v9 length];
  appleId = (NSString *)v9;
  if (!v10)
  {
    if (![(NSString *)self->_appleId length]) {
      goto LABEL_8;
    }
    appleId = self->_appleId;
  }
  [v5 setUsername:appleId];
LABEL_8:
  objc_opt_class();
  id v12 = [v4 objectForKeyedSubscript:@"authTitle"];
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  if ([v13 length]) {
    [v5 setTitle:v13];
  }
  objc_opt_class();
  id v14 = [v4 objectForKeyedSubscript:@"authBody"];
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }

  if ([v15 length]) {
    [v5 setReason:v15];
  }
  objc_opt_class();
  id v16 = [v4 objectForKeyedSubscript:@"authOK"];
  if (objc_opt_isKindOfClass()) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }

  if ([v17 length]) {
    [v5 setDefaultButtonString:v17];
  }
  objc_opt_class();
  id v18 = [v4 objectForKeyedSubscript:@"authIsEphemeral"];
  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }

  if (v19) {
    objc_msgSend(v5, "setIsEphemeral:", objc_msgSend(v19, "BOOLValue"));
  }
  objc_opt_class();
  id v20 = [v4 objectForKeyedSubscript:*MEMORY[0x263F63828]];
  if (objc_opt_isKindOfClass()) {
    id v21 = v20;
  }
  else {
    id v21 = 0;
  }

  if ([v21 length]) {
    objc_msgSend(v5, "setForceInlinePresentation:", objc_msgSend(v21, "BOOLValue"));
  }
  objc_opt_class();
  id v22 = [v4 objectForKeyedSubscript:@"biometric"];
  if (objc_opt_isKindOfClass()) {
    id v23 = v22;
  }
  else {
    id v23 = 0;
  }

  if ([v23 BOOLValue]) {
    [v5 setVerifyCredentialReason:3];
  }

  return v5;
}

- (void)_updateResponseWithAuthResults:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F28FF0]];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F637C8]);
    uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F28F88]];

    id v8 = @"biometric";
    if (!v7) {
      id v8 = @"password";
    }
    v10[0] = @"password";
    v10[1] = @"authType";
    v11[0] = v5;
    v11[1] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    [v6 setAdditionalPayload:v9];

    [(AAUIAuthKitAuthenticatonHook *)self setServerHookResponse:v6];
  }
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RUIServerHookResponse)serverHookResponse
{
  return self->_serverHookResponse;
}

- (void)setServerHookResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHookResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_appleId, 0);
}

void __79__AAUIAuthKitAuthenticatonHook__reauthenticateWithServerAttributes_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_209754000, a2, OS_LOG_TYPE_ERROR, "Error during authentication - %@", (uint8_t *)&v2, 0xCu);
}

@end