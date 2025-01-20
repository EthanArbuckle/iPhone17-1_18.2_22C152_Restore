@interface MDMSSAuthenticationRequestDelegate
+ (id)instanceWithAuthenticationContext:(id)a3;
- (id)storeLoginFailedError;
- (void)authenticateRequest:(id)a3 didReceiveResponse:(id)a4;
- (void)startWithCompletionBlock:(id)a3;
@end

@implementation MDMSSAuthenticationRequestDelegate

+ (id)instanceWithAuthenticationContext:(id)a3
{
  id v3 = a3;
  v4 = [MDMSSAuthenticationRequestDelegate alloc];
  v5 = (void *)[objc_alloc(MEMORY[0x263F7B118]) initWithAuthenticationContext:v3];

  v6 = [(MDMSSRequestDelegate *)v4 initWithRequest:v5];
  return v6;
}

- (id)storeLoginFailedError
{
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38AF8];
  v4 = DMCErrorArray();
  v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 30000, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (void)startWithCompletionBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *, void))a3;
  BOOL v5 = +[MDMMCInterface isLimitedAppsMode];
  v6 = *(NSObject **)DMCLogObjects();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_DEFAULT, "Not prompting for iTunes account in a limited apps mode.", buf, 2u);
    }
    if (v4)
    {
      v8 = [(MDMSSAuthenticationRequestDelegate *)self storeLoginFailedError];
      v4[2](v4, v8, 0);
    }
  }
  else
  {
    if (v7)
    {
      v9 = v6;
      *(_DWORD *)buf = 138543362;
      id v14 = (id)objc_opt_class();
      id v10 = v14;
      _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ starting user authentication.", buf, 0xCu);
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __63__MDMSSAuthenticationRequestDelegate_startWithCompletionBlock___block_invoke;
    v11[3] = &unk_264B9E838;
    v11[4] = self;
    v12 = v4;
    [(MDMSSRequestDelegate *)self _startTimeout:v11 completionBlock:900.0];
  }
}

void __63__MDMSSAuthenticationRequestDelegate_startWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;

  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v3)
    {
      (*(void (**)(void, void, id))(v6 + 16))(*(void *)(a1 + 40), 0, v3);
    }
    else
    {
      BOOL v7 = [*(id *)(a1 + 32) storeLoginFailedError];
      (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
    }
  }
}

- (void)authenticateRequest:(id)a3 didReceiveResponse:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [v5 authenticateResponseType];
  BOOL v7 = *(NSObject **)DMCLogObjects();
  if (v6 == 4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_230A49000, v7, OS_LOG_TYPE_DEFAULT, "User successfully logged into iTunes account.", (uint8_t *)&v11, 2u);
    }
    id v8 = [v5 authenticatedAccount];
    authenticatedAccount = self->_authenticatedAccount;
    self->_authenticatedAccount = v8;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v10 = v7;
    int v11 = 134217984;
    uint64_t v12 = [v5 authenticateResponseType];
    _os_log_impl(&dword_230A49000, v10, OS_LOG_TYPE_ERROR, "User failed to log into iTunes account. Reason code: %ld", (uint8_t *)&v11, 0xCu);
  }
}

- (void).cxx_destruct
{
}

@end