@interface MDMMAIDBearerTokenAuthenticator
+ (NSString)authenticationMethod;
+ (id)_createAuthInvalidError;
+ (id)_createGeneralServerError;
+ (id)_createManagedAppleAccountInvalidatedError;
+ (id)_createMissingBearerTokenError;
+ (id)authenticatorWithAnchorCertificateRefs:(id)a3;
- (BOOL)authenticateRequest:(id)a3 error:(id *)a4;
- (BOOL)canRefreshToken;
- (BOOL)doesWebAuthentication;
- (BOOL)validAuthParams:(id)a3;
- (MDMMAIDBearerTokenAuthenticator)initWithRMAccountID:(id)a3;
- (MDMMAIDBearerTokenAuthenticator)initWithTokens:(id)a3;
- (NSArray)anchorCertificateRefs;
- (NSString)personaID;
- (NSString)token;
- (id)prepareForReauthenticationWithAuthParams:(id)a3 accountID:(id)a4 error:(id *)a5;
- (void)_executeExchangeRequestWithURL:(id)a3 accountID:(id)a4 completionHandler:(id)a5;
- (void)_processTokenResponse:(id)a3 data:(id)a4 error:(id)a5 completionHandler:(id)a6;
- (void)fetchTokenWithAuthParams:(id)a3 accountID:(id)a4 completionHandler:(id)a5;
- (void)refreshTokenWithAuthParams:(id)a3 accountID:(id)a4 completionHandler:(id)a5;
- (void)setAnchorCertificateRefs:(id)a3;
- (void)setPersonaID:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation MDMMAIDBearerTokenAuthenticator

+ (id)authenticatorWithAnchorCertificateRefs:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setAnchorCertificateRefs:v3];

  return v4;
}

- (MDMMAIDBearerTokenAuthenticator)initWithRMAccountID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MDMMAIDBearerTokenAuthenticator;
  v5 = [(MDMMAIDBearerTokenAuthenticator *)&v16 init];
  if (v5)
  {
    id v15 = 0;
    v6 = +[MDMAccountUtilities rmAccountWithIdentifier:v4 fromStore:0 error:&v15];
    id v7 = v15;
    if (v6)
    {
      uint64_t v8 = objc_msgSend(v6, "dmc_bearerToken");
      token = v5->_token;
      v5->_token = (NSString *)v8;

      uint64_t v10 = objc_msgSend(v6, "dmc_personaIdentifier");
      personaID = v5->_personaID;
      v5->_personaID = (NSString *)v10;
    }
    else
    {
      v12 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v7;
        _os_log_impl(&dword_1DD340000, v12, OS_LOG_TYPE_ERROR, "Could not extract auth token from RM account: %{public}@", buf, 0xCu);
      }
      v13 = v5->_token;
      v5->_token = 0;

      personaID = v5->_personaID;
      v5->_personaID = 0;
    }
  }
  return v5;
}

- (MDMMAIDBearerTokenAuthenticator)initWithTokens:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MDMMAIDBearerTokenAuthenticator;
  v5 = [(MDMMAIDBearerTokenAuthenticator *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"token"];
    token = v5->_token;
    v5->_token = (NSString *)v6;

    personaID = v5->_personaID;
    v5->_personaID = 0;
  }
  return v5;
}

+ (NSString)authenticationMethod
{
  return (NSString *)@"apple-maid";
}

- (BOOL)validAuthParams:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"method"];
  v5 = +[MDMMAIDBearerTokenAuthenticator authenticationMethod];
  if ([v4 isEqualToString:v5])
  {
    uint64_t v6 = [v3 objectForKeyedSubscript:@"url"];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)authenticateRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(MDMMAIDBearerTokenAuthenticator *)self token];

  if (v6)
  {
    BOOL v7 = [(MDMMAIDBearerTokenAuthenticator *)self token];
    uint64_t v8 = DMCHTTPAuthStringWithAuthToken();
    [v5 addValue:v8 forHTTPHeaderField:*MEMORY[0x1E4F5E6D8]];
  }
  return v6 != 0;
}

- (BOOL)doesWebAuthentication
{
  return 0;
}

- (BOOL)canRefreshToken
{
  return 1;
}

- (id)prepareForReauthenticationWithAuthParams:(id)a3 accountID:(id)a4 error:(id *)a5
{
  id v5 = objc_msgSend(a3, "objectForKeyedSubscript:", @"url", a4, a5);
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)fetchTokenWithAuthParams:(id)a3 accountID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(MDMMAIDBearerTokenAuthenticator *)self validAuthParams:v8])
  {
    v11 = (void *)MEMORY[0x1E4F1CB10];
    v12 = [v8 objectForKeyedSubscript:@"url"];
    v13 = [v11 URLWithString:v12];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __88__MDMMAIDBearerTokenAuthenticator_fetchTokenWithAuthParams_accountID_completionHandler___block_invoke;
    v15[3] = &unk_1E6CBCDC0;
    v15[4] = self;
    id v16 = v10;
    [(MDMMAIDBearerTokenAuthenticator *)self _executeExchangeRequestWithURL:v13 accountID:v9 completionHandler:v15];
  }
  else
  {
    v14 = +[MDMMAIDBearerTokenAuthenticator _createAuthInvalidError];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __88__MDMMAIDBearerTokenAuthenticator_fetchTokenWithAuthParams_accountID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    BOOL v7 = [v5 objectForKeyedSubscript:@"token"];
    [*(id *)(a1 + 32) setToken:v7];

    id v8 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1DD340000, v8, OS_LOG_TYPE_INFO, "Fetched MAID tokens", (uint8_t *)&v11, 2u);
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v10 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      id v12 = v6;
      _os_log_impl(&dword_1DD340000, v10, OS_LOG_TYPE_ERROR, "Unable to fetch MAID token: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

- (void)refreshTokenWithAuthParams:(id)a3 accountID:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__MDMMAIDBearerTokenAuthenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke;
  v12[3] = &unk_1E6CBCE10;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(MDMMAIDBearerTokenAuthenticator *)self fetchTokenWithAuthParams:a3 accountID:v11 completionHandler:v12];
}

void __90__MDMMAIDBearerTokenAuthenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (v7) {
    goto LABEL_9;
  }
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__4;
  v31 = __Block_byref_object_dispose__4;
  id v32 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  id v8 = (void *)MEMORY[0x1E4F5E7B0];
  id v9 = [*(id *)(a1 + 32) personaID];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __90__MDMMAIDBearerTokenAuthenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke_11;
  v18[3] = &unk_1E6CBCDE8;
  v21 = &v23;
  id v10 = *(id *)(a1 + 40);
  v22 = &v27;
  uint64_t v11 = *(void *)(a1 + 32);
  id v19 = v10;
  uint64_t v20 = v11;
  id v12 = (id)[v8 performBlockUnderPersona:v9 block:v18];

  int v13 = *((unsigned __int8 *)v24 + 24);
  if (*((unsigned char *)v24 + 24))
  {
    id v14 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD340000, v14, OS_LOG_TYPE_INFO, "Refreshed MAID tokens", buf, 2u);
    }
  }
  else
  {
    id v15 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = v28[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = v17;
      _os_log_impl(&dword_1DD340000, v15, OS_LOG_TYPE_ERROR, "Failed to update account MAID tokens during refresh: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, v28[5], v16);
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  if (v13) {
LABEL_9:
  }
    (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5, v7, v6);
}

void __90__MDMMAIDBearerTokenAuthenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke_11(void *a1)
{
  v2 = [MEMORY[0x1E4F179C8] defaultStore];
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v4 = *(void **)(v3 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__MDMMAIDBearerTokenAuthenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke_2;
  v7[3] = &unk_1E6CBC708;
  uint64_t v5 = a1[4];
  v7[4] = a1[5];
  id obj = v4;
  char v6 = objc_msgSend(v2, "dmc_updateAccountWithIdentifier:error:updateBlock:", v5, &obj, v7);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v6;
}

void __90__MDMMAIDBearerTokenAuthenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 token];
  objc_msgSend(v3, "dmc_setBearerToken:", v4);
}

- (void)_executeExchangeRequestWithURL:(id)a3 accountID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F28E88];
  id v10 = a4;
  uint64_t v11 = [v9 requestWithURL:a3];
  [v11 setAttribution:1];
  [v11 setHTTPMethod:*MEMORY[0x1E4F5E710]];
  [v11 setTimeoutInterval:90.0];
  id v12 = objc_alloc_init(MEMORY[0x1E4F5E790]);
  int v13 = [[MDMMAIDAuthenticator alloc] initWithRMAccountID:v10];

  [v12 setAuthenticator:v13];
  id v14 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD340000, v14, OS_LOG_TYPE_INFO, "Exchanging MAID for bearer token...", buf, 2u);
  }
  id v15 = [(MDMMAIDBearerTokenAuthenticator *)self anchorCertificateRefs];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __94__MDMMAIDBearerTokenAuthenticator__executeExchangeRequestWithURL_accountID_completionHandler___block_invoke;
  v17[3] = &unk_1E6CBCE38;
  v17[4] = self;
  id v18 = v8;
  id v16 = v8;
  [v12 startWithRequest:v11 username:0 password:0 anchorCertificateRefs:v15 completionBlock:v17];
}

uint64_t __94__MDMMAIDBearerTokenAuthenticator__executeExchangeRequestWithURL_accountID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _processTokenResponse:a3 data:a2 error:a4 completionHandler:*(void *)(a1 + 40)];
}

- (void)_processTokenResponse:(id)a3 data:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (char *)a5;
  id v12 = (void (**)(id, void, id))a6;
  int v13 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    *(_DWORD *)buf = 134218242;
    uint64_t v29 = (const char *)[v10 length];
    __int16 v30 = 2114;
    id v31 = v9;
    _os_log_impl(&dword_1DD340000, v14, OS_LOG_TYPE_DEFAULT, "Exchange MAID for bearer token finished with data: %lu bytes, response: %{public}@", buf, 0x16u);
  }
  if (v11)
  {
    id v15 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v11;
      _os_log_impl(&dword_1DD340000, v15, OS_LOG_TYPE_ERROR, "Failed to exchange for bearer token with error: %{public}@", buf, 0xCu);
    }
    v12[2](v12, 0, v11);
  }
  else
  {
    uint64_t v16 = [v9 statusCode];
    if (v16 == 200)
    {
      id v25 = 0;
      uint64_t v17 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v10 options:0 error:&v25];
      id v18 = (char *)v25;
      if (v18)
      {
        id v19 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v29 = v18;
          _os_log_impl(&dword_1DD340000, v19, OS_LOG_TYPE_ERROR, "Failed to deserialize server's response with error: %{public}@", buf, 0xCu);
        }
        v12[2](v12, 0, v18);
      }
      else
      {
        v21 = [v17 objectForKeyedSubscript:@"bearer-token"];
        uint64_t v22 = [v21 length];
        uint64_t v23 = *(NSObject **)DMCLogObjects();
        if (v22)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v29 = "-[MDMMAIDBearerTokenAuthenticator _processTokenResponse:data:error:completionHandler:]";
            __int16 v30 = 2112;
            id v31 = v17;
            _os_log_impl(&dword_1DD340000, v23, OS_LOG_TYPE_DEBUG, "%s results: %@", buf, 0x16u);
          }
          char v26 = @"token";
          uint64_t v27 = v21;
          v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
          ((void (**)(id, void *, id))v12)[2](v12, v24, 0);
        }
        else
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DD340000, v23, OS_LOG_TYPE_ERROR, "Server response doesn't contain the bearer token", buf, 2u);
          }
          v24 = +[MDMMAIDBearerTokenAuthenticator _createMissingBearerTokenError];
          v12[2](v12, 0, v24);
        }
      }
    }
    else
    {
      if (v16 == 401) {
        +[MDMMAIDBearerTokenAuthenticator _createManagedAppleAccountInvalidatedError];
      }
      else {
      uint64_t v20 = +[MDMMAIDBearerTokenAuthenticator _createGeneralServerError];
      }
      v12[2](v12, 0, v20);
    }
  }
}

+ (id)_createAuthInvalidError
{
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F5E6B0];
  id v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15024, v4, *MEMORY[0x1E4F5E6B8], 0);

  return v5;
}

+ (id)_createMissingBearerTokenError
{
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F5E6B0];
  id v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 15003, v4, 0, *MEMORY[0x1E4F5E6B8], 0);

  return v5;
}

+ (id)_createGeneralServerError
{
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F5E6B0];
  id v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 15003, v4, 0, *MEMORY[0x1E4F5E6B8], 0);

  return v5;
}

+ (id)_createManagedAppleAccountInvalidatedError
{
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F5E6B0];
  id v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 15009, v4, 0, *MEMORY[0x1E4F5E6B8], 0);

  return v5;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
}

- (NSArray)anchorCertificateRefs
{
  return self->_anchorCertificateRefs;
}

- (void)setAnchorCertificateRefs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorCertificateRefs, 0);
  objc_storeStrong((id *)&self->_personaID, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

@end