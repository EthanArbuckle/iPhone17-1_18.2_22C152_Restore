@interface AAAutoAccountVerifier
- (AAAutoAccountVerifier)init;
- (AAAutoAccountVerifier)initWithAccount:(id)a3;
- (ACAccount)account;
- (BOOL)search:(id)a3 didFindResults:(id)a4;
- (void)_resendVerificationEmailForAccount:(id)a3 completion:(id)a4;
- (void)_validateToken:(id)a3;
- (void)_verify;
- (void)cancel;
- (void)search:(id)a3 didFinishWithError:(id)a4;
- (void)sendVerificationEmail;
- (void)setAccount:(id)a3;
- (void)verifyWithHandler:(id)a3;
@end

@implementation AAAutoAccountVerifier

- (AAAutoAccountVerifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)AAAutoAccountVerifier;
  v2 = [(AAAutoAccountVerifier *)&v6 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    requesterQueue = v2->_requesterQueue;
    v2->_requesterQueue = v3;

    v2->_attempts = 0;
    v2->_canceled = 0;
  }
  return v2;
}

- (AAAutoAccountVerifier)initWithAccount:(id)a3
{
  id v5 = a3;
  objc_super v6 = [(AAAutoAccountVerifier *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (void)sendVerificationEmail
{
  account = self->_account;
  if (account) {
    [(AAAutoAccountVerifier *)self _resendVerificationEmailForAccount:account completion:&__block_literal_global_15];
  }
}

void __46__AAAutoAccountVerifier_sendVerificationEmail__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _AALogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "Sent verification email", (uint8_t *)&v8, 2u);
    }
  }
  else if (v6)
  {
    v7 = [v4 localizedDescription];
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "Error sending verification email: %@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)verifyWithHandler:(id)a3
{
  if (self->_handler != a3)
  {
    id v4 = (void *)[a3 copy];
    id handler = self->_handler;
    self->_id handler = v4;
  }
  dispatch_time_t v6 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AAAutoAccountVerifier_verifyWithHandler___block_invoke;
  block[3] = &unk_1E5A48358;
  block[4] = self;
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
}

uint64_t __43__AAAutoAccountVerifier_verifyWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _verify];
}

- (void)cancel
{
  v3 = _AALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v6 = 0;
    _os_log_impl(&dword_1A11D8000, v3, OS_LOG_TYPE_DEFAULT, "Verifier canceling all operations", v6, 2u);
  }

  self->_canceled = 1;
  [(NSOperationQueue *)self->_requesterQueue cancelAllOperations];
  [(MSSearch *)self->_search cancel];
  search = self->_search;
  self->_search = 0;

  id handler = self->_handler;
  if (handler) {
    (*((void (**)(id, void, void))handler + 2))(handler, 0, 0);
  }
}

- (void)_verify
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getMSResultsKeySubject(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAAutoAccountVerifier.m", 34, @"%s", dlerror());

  __break(1u);
}

- (void)_validateToken:(id)a3
{
  id v4 = a3;
  id v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "Validating token", buf, 2u);
  }

  dispatch_time_t v6 = [[AACompleteEmailVettingRequest alloc] initWithAccount:self->_account token:v4];
  v7 = [AARequester alloc];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__AAAutoAccountVerifier__validateToken___block_invoke;
  v9[3] = &unk_1E5A49B18;
  v9[4] = self;
  int v8 = [(AARequester *)v7 initWithRequest:v6 handler:v9];
  [(NSOperationQueue *)self->_requesterQueue addOperation:v8];
}

void __40__AAAutoAccountVerifier__validateToken___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    id v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v6 = [v3 error];
      v7 = [v6 description];
      int v14 = 138412290;
      v15 = v7;
      _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "Error vetting email address: %@", (uint8_t *)&v14, 0xCu);
    }
    BOOL v8 = 0;
  }
  else
  {
    id v9 = v3;
    BOOL v8 = ![v9 vettingStatus] || objc_msgSend(v9, "vettingStatus") == 1;
  }
  uint64_t v10 = _AALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = @"Not validated";
    if (v8) {
      v11 = @"Validated";
    }
    int v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "Calling handler with validation result: %@", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 32);
  v13 = [v3 error];
  (*(void (**)(uint64_t, BOOL, void *))(v12 + 16))(v12, v8, v13);
}

- (void)_resendVerificationEmailForAccount:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(AAEmailVettingRequest *)[AAInitiateEmailVettingRequest alloc] initWithAccount:v6];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__AAAutoAccountVerifier__resendVerificationEmailForAccount_completion___block_invoke;
  v9[3] = &unk_1E5A481E8;
  id v10 = v5;
  id v8 = v5;
  [(AARequest *)v7 performRequestWithHandler:v9];
}

void __71__AAAutoAccountVerifier__resendVerificationEmailForAccount_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v5 = [a3 error];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
}

- (BOOL)search:(id)a3 didFindResults:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "search founds results", buf, 2u);
  }

  if ([v5 count])
  {
    v30 = self;
    v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v5;
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "Email search found results: %@", buf, 0xCu);
    }

    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    id v9 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v32 = v5;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v16 = getMSResultsKeyDateSent();
          v17 = [v15 objectForKey:v16];

          v18 = [v15 objectForKey:_AAVettingToken];
          v19 = [v18 lastObject];

          if (v19)
          {
            [v8 setValue:v19 forKey:v17];
            [v9 addObject:v19];
            v20 = _AALogSystem();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v39 = v19;
              _os_log_impl(&dword_1A11D8000, v20, OS_LOG_TYPE_DEFAULT, "Found token: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v12);
    }

    uint64_t v21 = [v9 count];
    BOOL v22 = v21 == 0;
    if (v21)
    {
      id v23 = [v8 allKeys];
      v24 = v23;
      if ((unint64_t)[v23 count] >= 2)
      {
        v24 = [v23 sortedArrayUsingSelector:sel_compare_];
      }
      v25 = objc_msgSend(v24, "lastObject", v30);
      v26 = [v8 objectForKey:v25];

      v27 = _AALogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v26;
        _os_log_impl(&dword_1A11D8000, v27, OS_LOG_TYPE_DEFAULT, "Most recent token: %@", buf, 0xCu);
      }

      [v31 _validateToken:v26];
      [v31[1] cancel];
      id v28 = v31[1];
      v31[1] = 0;
    }
    id v5 = v32;
  }
  else
  {
    BOOL v22 = 1;
  }

  return v22;
}

- (void)search:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Email search finished with error: %@", buf, 0xCu);
  }

  search = self->_search;
  if (search)
  {
    [(MSSearch *)search cancel];
    id v8 = self->_search;
    self->_search = 0;

    if (v5 && [v5 code] != 1501)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __51__AAAutoAccountVerifier_search_didFinishWithError___block_invoke;
      v11[3] = &unk_1E5A488A8;
      v11[4] = self;
      id v12 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v11);
    }
    else if (!self->_canceled)
    {
      dispatch_time_t v9 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__AAAutoAccountVerifier_search_didFinishWithError___block_invoke_2;
      block[3] = &unk_1E5A48358;
      block[4] = self;
      dispatch_after(v9, MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __51__AAAutoAccountVerifier_search_didFinishWithError___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 40));
  }
  return result;
}

uint64_t __51__AAAutoAccountVerifier_search_didFinishWithError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _verify];
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_requesterQueue, 0);

  objc_storeStrong((id *)&self->_search, 0);
}

@end