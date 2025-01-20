@interface MDMOAuth2Authenticator
+ (NSString)authenticationMethod;
+ (id)_createOAuth2InvalidError;
+ (id)deserializeTokens:(id)a3;
+ (id)serializeTokens:(id)a3;
- (BOOL)authenticateRequest:(id)a3 error:(id *)a4;
- (BOOL)canRefreshToken;
- (BOOL)doesWebAuthentication;
- (BOOL)validAuthParams:(id)a3;
- (MDMOAuth2Authenticator)initWithRMAccountID:(id)a3;
- (MDMOAuth2Authenticator)initWithTokens:(id)a3;
- (NSDictionary)tokens;
- (NSString)personaID;
- (NSString)state;
- (id)_authorizationGrantURLWithAuthParams:(id)a3;
- (id)prepareForReauthenticationWithAuthParams:(id)a3 accountID:(id)a4 error:(id *)a5;
- (id)webAuthenticationURLForAuthParams:(id)a3 userIdentifier:(id)a4;
- (void)_executeTokenRequestWithURL:(id)a3 body:(id)a4 completionHandler:(id)a5;
- (void)_processTokenResponse:(id)a3 data:(id)a4 error:(id)a5 completionHandler:(id)a6;
- (void)_refreshRequestWithRefreshToken:(id)a3 authParams:(id)a4 completionHandler:(id)a5;
- (void)_tokenRequestWithCode:(id)a3 authParams:(id)a4 completionHandler:(id)a5;
- (void)authTokensWithCallbackURL:(id)a3 authParams:(id)a4 completionHandler:(id)a5;
- (void)refreshTokenWithAuthParams:(id)a3 accountID:(id)a4 completionHandler:(id)a5;
- (void)setPersonaID:(id)a3;
- (void)setState:(id)a3;
- (void)setTokens:(id)a3;
@end

@implementation MDMOAuth2Authenticator

- (MDMOAuth2Authenticator)initWithRMAccountID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MDMOAuth2Authenticator;
  v5 = [(MDMOAuth2Authenticator *)&v18 init];
  if (v5)
  {
    id v17 = 0;
    v6 = +[MDMAccountUtilities rmAccountWithIdentifier:v4 fromStore:0 error:&v17];
    id v7 = v17;
    if (v6)
    {
      v8 = [v6 credential];
      v9 = [v8 token];
      uint64_t v10 = +[MDMOAuth2Authenticator deserializeTokens:v9];
      tokens = v5->_tokens;
      v5->_tokens = (NSDictionary *)v10;

      uint64_t v12 = objc_msgSend(v6, "dmc_personaIdentifier");
      personaID = v5->_personaID;
      v5->_personaID = (NSString *)v12;
    }
    else
    {
      v14 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v7;
        _os_log_impl(&dword_1DD340000, v14, OS_LOG_TYPE_ERROR, "Could not extract auth tokens from RM account: %{public}@", buf, 0xCu);
      }
      v15 = v5->_tokens;
      v5->_tokens = (NSDictionary *)MEMORY[0x1E4F1CC08];

      v8 = v5->_personaID;
      v5->_personaID = 0;
    }
  }
  return v5;
}

- (MDMOAuth2Authenticator)initWithTokens:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MDMOAuth2Authenticator;
  v6 = [(MDMOAuth2Authenticator *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tokens, a3);
    personaID = v7->_personaID;
    v7->_personaID = 0;
  }
  return v7;
}

+ (NSString)authenticationMethod
{
  return (NSString *)@"apple-oauth2";
}

- (BOOL)validAuthParams:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"method"];
  id v5 = +[MDMOAuth2Authenticator authenticationMethod];
  if ([v4 isEqualToString:v5])
  {
    v6 = [v3 objectForKeyedSubscript:@"authorization-url"];
    if (v6)
    {
      id v7 = [v3 objectForKeyedSubscript:@"token-url"];
      if (v7)
      {
        v8 = [v3 objectForKeyedSubscript:@"client-id"];
        if (v8)
        {
          v9 = [v3 objectForKeyedSubscript:@"redirect-url"];
          BOOL v10 = v9 != 0;
        }
        else
        {
          BOOL v10 = 0;
        }
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)serializeTokens:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  id v5 = [v3 objectForKeyedSubscript:@"expires"];
  if (v5)
  {
    v6 = [v4 stringFromDate:v5];
  }
  else
  {
    v6 = 0;
  }
  id v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  v8 = [v3 objectForKeyedSubscript:@"access_token"];
  [v7 setObject:v8 forKeyedSubscript:@"access_token"];

  v9 = [v3 objectForKeyedSubscript:@"refresh_token"];
  [v7 setObject:v9 forKeyedSubscript:@"refresh_token"];

  [v7 setObject:v6 forKeyedSubscript:@"expires"];
  id v15 = 0;
  BOOL v10 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:0 error:&v15];
  id v11 = v15;
  if (v10)
  {
    uint64_t v12 = (__CFString *)[[NSString alloc] initWithData:v10 encoding:4];
  }
  else
  {
    v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v7;
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_impl(&dword_1DD340000, v13, OS_LOG_TYPE_ERROR, "Could not serialize JSON data for token: %{public}@ %{public}@", buf, 0x16u);
    }
    uint64_t v12 = &stru_1F38828A0;
  }

  return v12;
}

+ (id)deserializeTokens:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 dataUsingEncoding:4];
  id v14 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v3 options:0 error:&v14];
  id v5 = v14;
  if (v4)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    id v7 = [v4 objectForKeyedSubscript:@"expires"];
    if (v7)
    {
      v8 = [v6 dateFromString:v7];
    }
    else
    {
      v8 = 0;
    }
    BOOL v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    id v11 = [v4 objectForKeyedSubscript:@"access_token"];
    [v10 setObject:v11 forKeyedSubscript:@"access_token"];

    uint64_t v12 = [v4 objectForKeyedSubscript:@"refresh_token"];
    [v10 setObject:v12 forKeyedSubscript:@"refresh_token"];

    [v10 setObject:v8 forKeyedSubscript:@"expires"];
  }
  else
  {
    v9 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v16 = v3;
      __int16 v17 = 2114;
      id v18 = v5;
      _os_log_impl(&dword_1DD340000, v9, OS_LOG_TYPE_ERROR, "Could not deserialize JSON data for token: %{public}@ %{public}@", buf, 0x16u);
    }
    BOOL v10 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v10;
}

- (BOOL)authenticateRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(MDMOAuth2Authenticator *)self tokens];
  id v7 = [v6 objectForKeyedSubscript:@"access_token"];

  if (v7)
  {
    v8 = DMCHTTPAuthStringWithAuthToken();
    [v5 addValue:v8 forHTTPHeaderField:*MEMORY[0x1E4F5E6D8]];
  }
  return v7 != 0;
}

- (BOOL)doesWebAuthentication
{
  return 1;
}

- (id)webAuthenticationURLForAuthParams:(id)a3 userIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MDMOAuth2Authenticator *)self validAuthParams:v6])
  {
    v8 = objc_opt_new();
    v9 = [v8 UUIDString];
    [(MDMOAuth2Authenticator *)self setState:v9];

    BOOL v10 = [(MDMOAuth2Authenticator *)self _authorizationGrantURLWithAuthParams:v6];
    if (v10)
    {
      id v11 = [MEMORY[0x1E4F29088] componentsWithURL:v10 resolvingAgainstBaseURL:0];
      uint64_t v12 = v11;
      if (v7)
      {
        v13 = [v11 queryItems];
        id v14 = [MEMORY[0x1E4F290C8] queryItemWithName:@"login_hint" value:v7];
        id v15 = [v13 arrayByAddingObject:v14];
        [v12 setQueryItems:v15];
      }
      v16 = [v12 URL];
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)authTokensWithCallbackURL:(id)a3 authParams:(id)a4 completionHandler:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, void, void *))a5;
  id v11 = [MEMORY[0x1E4F29088] componentsWithURL:v8 resolvingAgainstBaseURL:0];
  uint64_t v12 = [v11 scheme];
  char v13 = [v12 isEqualToString:@"apple-remotemanagement-user-login"];

  if ((v13 & 1) == 0)
  {
    v31 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = v31;
      v33 = [v11 scheme];
      *(_DWORD *)buf = 138543362;
      id v46 = v33;
      _os_log_impl(&dword_1DD340000, v32, OS_LOG_TYPE_ERROR, "Incorrect auth callback scheme: %{public}@", buf, 0xCu);
    }
    __int16 v17 = +[MDMOAuth2Authenticator _createOAuth2InvalidError];
    v10[2](v10, 0, v17);
    goto LABEL_27;
  }
  v39 = self;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v14 = [v11 queryItems];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (!v15)
  {

    id v18 = 0;
    __int16 v17 = 0;
    goto LABEL_23;
  }
  uint64_t v16 = v15;
  v36 = v10;
  id v37 = v9;
  id v38 = v8;
  __int16 v17 = 0;
  id v18 = 0;
  uint64_t v19 = *(void *)v41;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v41 != v19) {
        objc_enumerationMutation(v14);
      }
      uint64_t v21 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      v22 = [v21 name];
      int v23 = [v22 isEqualToString:@"code"];

      if (v23)
      {
        uint64_t v24 = [v21 value];
        v25 = v17;
        __int16 v17 = (void *)v24;
      }
      else
      {
        v26 = [v21 name];
        int v27 = [v26 isEqualToString:@"state"];

        if (!v27) {
          continue;
        }
        uint64_t v28 = [v21 value];
        v25 = v18;
        id v18 = (void *)v28;
      }
    }
    uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v44 count:16];
  }
  while (v16);

  if (v17)
  {
    id v9 = v37;
    id v8 = v38;
    BOOL v10 = v36;
    if (v18)
    {
      v29 = [(MDMOAuth2Authenticator *)v39 state];
      char v30 = [v18 isEqualToString:v29];

      if (v30)
      {
        [(MDMOAuth2Authenticator *)v39 _tokenRequestWithCode:v17 authParams:v37 completionHandler:v36];
        goto LABEL_26;
      }
    }
  }
  else
  {
    id v9 = v37;
    id v8 = v38;
    BOOL v10 = v36;
  }
LABEL_23:
  v34 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v46 = v8;
    _os_log_impl(&dword_1DD340000, v34, OS_LOG_TYPE_ERROR, "Invalid OAuth2 redirect URL response: %{public}@", buf, 0xCu);
  }
  v35 = +[MDMOAuth2Authenticator _createOAuth2InvalidError];
  v10[2](v10, 0, v35);

LABEL_26:
LABEL_27:
}

- (BOOL)canRefreshToken
{
  v2 = [(MDMOAuth2Authenticator *)self tokens];
  id v3 = [v2 objectForKeyedSubscript:@"refresh_token"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)prepareForReauthenticationWithAuthParams:(id)a3 accountID:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 objectForKeyedSubscript:@"authorization-url"];
  if (v9 && ([MEMORY[0x1E4F1CB10] URLWithString:v9], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v11 = (void *)v10;
    uint64_t v12 = [MEMORY[0x1E4F179C8] defaultStore];
    id v22 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __83__MDMOAuth2Authenticator_prepareForReauthenticationWithAuthParams_accountID_error___block_invoke;
    v19[3] = &unk_1E6CBCA60;
    id v13 = v11;
    id v20 = v13;
    id v21 = v7;
    char v14 = objc_msgSend(v12, "dmc_updateAccountWithIdentifier:error:updateBlock:", v8, &v22, v19);
    id v15 = v22;

    if (v14)
    {
      id v16 = v13;
    }
    else
    {
      __int16 v17 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v15;
        _os_log_impl(&dword_1DD340000, v17, OS_LOG_TYPE_ERROR, "Unable to update RM account when doing AuthServices re-authentication. Error: %{public}@", buf, 0xCu);
      }
      id v16 = 0;
      if (a5 && v15)
      {
        id v16 = 0;
        *a5 = v15;
      }
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

void __83__MDMOAuth2Authenticator_prepareForReauthenticationWithAuthParams_accountID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  BOOL v4 = [v3 absoluteString];
  objc_msgSend(v5, "dmc_setBearerReauthURL:", v4);

  objc_msgSend(v5, "dmc_setBearerReauthParams:", *(void *)(a1 + 40));
}

- (void)refreshTokenWithAuthParams:(id)a3 accountID:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(MDMOAuth2Authenticator *)self tokens];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"refresh_token"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__MDMOAuth2Authenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke;
  v15[3] = &unk_1E6CBCED8;
  id v16 = v8;
  id v17 = v9;
  v15[4] = self;
  id v13 = v8;
  id v14 = v9;
  [(MDMOAuth2Authenticator *)self _refreshRequestWithRefreshToken:v12 authParams:v10 completionHandler:v15];
}

void __81__MDMOAuth2Authenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) setTokens:v5];
    *(void *)&long long v29 = 0;
    *((void *)&v29 + 1) = &v29;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__5;
    v32 = __Block_byref_object_dispose__5;
    id v33 = 0;
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    id v7 = (void *)MEMORY[0x1E4F5E7B0];
    id v8 = [*(id *)(a1 + 32) personaID];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __81__MDMOAuth2Authenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke_73;
    v18[3] = &unk_1E6CBCDE8;
    id v21 = &v23;
    id v9 = *(id *)(a1 + 40);
    id v22 = &v29;
    uint64_t v10 = *(void *)(a1 + 32);
    id v19 = v9;
    uint64_t v20 = v10;
    id v11 = (id)[v7 performBlockUnderPersona:v8 block:v18];

    if (*((unsigned char *)v24 + 24))
    {
      uint64_t v12 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD340000, v12, OS_LOG_TYPE_INFO, "Refreshed OAuth2 tokens", buf, 2u);
      }
      (*(void (**)(void, id, void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5, 0, v13);
    }
    else
    {
      id v15 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v28 = v17;
        _os_log_impl(&dword_1DD340000, v15, OS_LOG_TYPE_ERROR, "Failed to update OAuth2 tokens during refresh: %{public}@", buf, 0xCu);
      }
      (*(void (**)(void, void, void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, *(void *)(*((void *)&v29 + 1) + 40), v16);
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    id v14 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v29) = 138543362;
      *(void *)((char *)&v29 + 4) = v6;
      _os_log_impl(&dword_1DD340000, v14, OS_LOG_TYPE_ERROR, "Unable to refresh OAuth2 token: %{public}@", (uint8_t *)&v29, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __81__MDMOAuth2Authenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke_73(void *a1)
{
  v2 = [MEMORY[0x1E4F179C8] defaultStore];
  uint64_t v3 = *(void *)(a1[7] + 8);
  BOOL v4 = *(void **)(v3 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__MDMOAuth2Authenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke_2;
  v7[3] = &unk_1E6CBC708;
  uint64_t v5 = a1[4];
  v7[4] = a1[5];
  id obj = v4;
  char v6 = objc_msgSend(v2, "dmc_updateAccountWithIdentifier:error:updateBlock:", v5, &obj, v7);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v6;
}

void __81__MDMOAuth2Authenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 tokens];
  id v5 = +[MDMOAuth2Authenticator serializeTokens:v4];

  objc_msgSend(v3, "dmc_setBearerToken:", v5);
}

- (id)_authorizationGrantURLWithAuthParams:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MDMOAuth2Authenticator *)self validAuthParams:v4])
  {
    id v5 = (void *)MEMORY[0x1E4F1CB10];
    char v6 = [v4 objectForKeyedSubscript:@"authorization-url"];
    id v7 = [v5 URLWithString:v6];

    id v8 = [v4 objectForKeyedSubscript:@"client-id"];
    id v9 = [v4 objectForKeyedSubscript:@"redirect-url"];
    uint64_t v10 = [v4 objectForKeyedSubscript:@"scope"];
    id v11 = [MEMORY[0x1E4F29088] componentsWithURL:v7 resolvingAgainstBaseURL:0];
    uint64_t v12 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v13 = [v11 queryItems];
    id v14 = (void *)v13;
    if (v13) {
      uint64_t v15 = v13;
    }
    else {
      uint64_t v15 = MEMORY[0x1E4F1CBF0];
    }
    uint64_t v16 = [v12 arrayWithArray:v15];

    uint64_t v17 = [MEMORY[0x1E4F290C8] queryItemWithName:@"response_type" value:@"code"];
    [v16 addObject:v17];

    id v18 = [MEMORY[0x1E4F290C8] queryItemWithName:@"client_id" value:v8];
    [v16 addObject:v18];

    id v19 = [MEMORY[0x1E4F290C8] queryItemWithName:@"redirect_uri" value:v9];
    [v16 addObject:v19];

    if (v10)
    {
      uint64_t v20 = [MEMORY[0x1E4F290C8] queryItemWithName:@"scope" value:v10];
      [v16 addObject:v20];
    }
    id v21 = (void *)MEMORY[0x1E4F290C8];
    id v22 = [(MDMOAuth2Authenticator *)self state];
    uint64_t v23 = [v21 queryItemWithName:@"state" value:v22];
    [v16 addObject:v23];

    [v11 setQueryItems:v16];
    id v24 = [v11 URL];
  }
  else
  {
    uint64_t v25 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v27 = 138543362;
      id v28 = v4;
      _os_log_impl(&dword_1DD340000, v25, OS_LOG_TYPE_ERROR, "Invalid OAuth2 parameters: %{public}@", (uint8_t *)&v27, 0xCu);
    }
    id v24 = 0;
  }

  return v24;
}

- (void)_tokenRequestWithCode:(id)a3 authParams:(id)a4 completionHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(MDMOAuth2Authenticator *)self validAuthParams:v9])
  {
    id v11 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v12 = [v9 objectForKeyedSubscript:@"token-url"];
    uint64_t v13 = [v11 URLWithString:v12];

    uint64_t v23 = [v9 objectForKeyedSubscript:@"client-id"];
    id v14 = [v9 objectForKeyedSubscript:@"redirect-url"];
    uint64_t v15 = [MEMORY[0x1E4F290C8] queryItemWithName:@"grant_type" value:@"authorization_code"];
    v25[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F290C8] queryItemWithName:@"code" value:v8];
    v25[1] = v16;
    [MEMORY[0x1E4F290C8] queryItemWithName:@"redirect_uri" value:v14];
    uint64_t v17 = v24 = v8;
    v25[2] = v17;
    id v18 = [MEMORY[0x1E4F290C8] queryItemWithName:@"client_id" value:v23];
    v25[3] = v18;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];

    uint64_t v20 = [MEMORY[0x1E4F29088] componentsWithURL:v13 resolvingAgainstBaseURL:0];
    [v20 setQueryItems:v19];
    id v21 = [v20 percentEncodedQuery];
    [(MDMOAuth2Authenticator *)self _executeTokenRequestWithURL:v13 body:v21 completionHandler:v10];

    id v8 = v24;
    id v10 = (id)v23;
  }
  else
  {
    id v22 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v9;
      _os_log_impl(&dword_1DD340000, v22, OS_LOG_TYPE_ERROR, "Invalid OAuth2 parameters: %{public}@", buf, 0xCu);
    }
    uint64_t v13 = +[MDMOAuth2Authenticator _createOAuth2InvalidError];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
  }
}

- (void)_refreshRequestWithRefreshToken:(id)a3 authParams:(id)a4 completionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(MDMOAuth2Authenticator *)self validAuthParams:v9])
  {
    id v11 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v12 = [v9 objectForKeyedSubscript:@"token-url"];
    uint64_t v13 = [v11 URLWithString:v12];

    uint64_t v14 = [v9 objectForKeyedSubscript:@"client-id"];
    uint64_t v15 = [MEMORY[0x1E4F290C8] queryItemWithName:@"grant_type" value:@"refresh_token"];
    v22[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F290C8] queryItemWithName:@"refresh_token" value:v8];
    v22[1] = v16;
    uint64_t v17 = [MEMORY[0x1E4F290C8] queryItemWithName:@"client_id" value:v14];
    v22[2] = v17;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];

    id v19 = [MEMORY[0x1E4F29088] componentsWithURL:v13 resolvingAgainstBaseURL:0];
    [v19 setQueryItems:v18];
    uint64_t v20 = [v19 percentEncodedQuery];
    [(MDMOAuth2Authenticator *)self _executeTokenRequestWithURL:v13 body:v20 completionHandler:v10];

    id v10 = (id)v14;
  }
  else
  {
    id v21 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v9;
      _os_log_impl(&dword_1DD340000, v21, OS_LOG_TYPE_ERROR, "Invalid OAuth2 parameters: %{public}@", buf, 0xCu);
    }
    uint64_t v13 = +[MDMOAuth2Authenticator _createOAuth2InvalidError];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
  }
}

- (void)_executeTokenRequestWithURL:(id)a3 body:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F28E88];
  id v10 = a4;
  id v11 = [v9 requestWithURL:a3];
  [v11 setAttribution:1];
  [v11 setHTTPMethod:*MEMORY[0x1E4F5E718]];
  [v11 setTimeoutInterval:90.0];
  uint64_t v12 = [v10 dataUsingEncoding:4];

  [v11 setHTTPBody:v12];
  [v11 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
  uint64_t v13 = objc_opt_new();
  uint64_t v14 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD340000, v14, OS_LOG_TYPE_INFO, "Getting OAuth2 for bearer token...", buf, 2u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__MDMOAuth2Authenticator__executeTokenRequestWithURL_body_completionHandler___block_invoke;
  v16[3] = &unk_1E6CBCE38;
  v16[4] = self;
  id v17 = v8;
  id v15 = v8;
  [v13 startWithRequest:v11 username:0 password:0 anchorCertificateRefs:0 completionBlock:v16];
}

uint64_t __77__MDMOAuth2Authenticator__executeTokenRequestWithURL_body_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _processTokenResponse:a3 data:a2 error:a4 completionHandler:*(void *)(a1 + 40)];
}

- (void)_processTokenResponse:(id)a3 data:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (char *)a5;
  uint64_t v12 = (void (**)(id, void, id))a6;
  uint64_t v13 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v13;
    *(_DWORD *)buf = 134218242;
    v35 = (const char *)[v10 length];
    __int16 v36 = 2114;
    id v37 = v9;
    _os_log_impl(&dword_1DD340000, v14, OS_LOG_TYPE_DEFAULT, "Getting OAuth2 bearer token finished with data: %lu bytes, response: %{public}@", buf, 0x16u);
  }
  if (v11)
  {
    id v15 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v11;
      _os_log_impl(&dword_1DD340000, v15, OS_LOG_TYPE_ERROR, "Failed to get OAuth2 bearer token with error: %{public}@", buf, 0xCu);
    }
    v12[2](v12, 0, v11);
    goto LABEL_29;
  }
  uint64_t v16 = [v9 statusCode];
  if (v16 == 200)
  {
    id v33 = 0;
    id v17 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v10 options:0 error:&v33];
    id v18 = (char *)v33;
    if (v18)
    {
      id v19 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v18;
        _os_log_impl(&dword_1DD340000, v19, OS_LOG_TYPE_ERROR, "Failed to deserialize server's response with error: %{public}@", buf, 0xCu);
      }
      v12[2](v12, 0, v18);
      goto LABEL_28;
    }
    uint64_t v23 = [v17 objectForKeyedSubscript:@"token_type"];
    id v24 = [v17 objectForKeyedSubscript:@"access_token"];
    v32 = [v17 objectForKeyedSubscript:@"refresh_token"];
    uint64_t v25 = [v17 objectForKeyedSubscript:@"expires_in"];
    char v26 = v25;
    if (v25)
    {
      v31 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", (double)(int)objc_msgSend(v25, "intValue"));
      if (!v23) {
        goto LABEL_24;
      }
    }
    else
    {
      v31 = 0;
      if (!v23) {
        goto LABEL_24;
      }
    }
    if (![v23 caseInsensitiveCompare:@"Bearer"] && v24)
    {
      id v27 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
      uint64_t v30 = v24;
      [v27 setObject:v24 forKeyedSubscript:@"access_token"];
      [v27 setObject:v32 forKeyedSubscript:@"refresh_token"];
      [v27 setObject:v31 forKeyedSubscript:@"expires"];
      uint64_t v28 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "-[MDMOAuth2Authenticator _processTokenResponse:data:error:completionHandler:]";
        __int16 v36 = 2112;
        id v37 = v27;
        _os_log_impl(&dword_1DD340000, v28, OS_LOG_TYPE_DEBUG, "%s results: %@", buf, 0x16u);
      }
      ((void (**)(id, void *, id))v12)[2](v12, v27, 0);
      id v24 = v30;
      goto LABEL_27;
    }
LABEL_24:
    uint64_t v29 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v35 = (const char *)v17;
      _os_log_impl(&dword_1DD340000, v29, OS_LOG_TYPE_ERROR, "Failed to get OAuth2 bearer token invalid response: %{public}@}", buf, 0xCu);
    }
    id v27 = +[MDMOAuth2Authenticator _createOAuth2InvalidError];
    v12[2](v12, 0, v27);
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  uint64_t v20 = (const char *)v16;
  id v21 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v35 = v20;
    _os_log_impl(&dword_1DD340000, v21, OS_LOG_TYPE_ERROR, "Failed to get OAuth2 bearer token with HTTP status: %ld", buf, 0xCu);
  }
  id v22 = +[MDMOAuth2Authenticator _createOAuth2InvalidError];
  v12[2](v12, 0, v22);

LABEL_29:
}

+ (id)_createOAuth2InvalidError
{
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F5E6B0];
  id v4 = DMCErrorArray();
  id v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15025, v4, *MEMORY[0x1E4F5E6B8], 0);

  return v5;
}

- (NSDictionary)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_tokens, 0);
}

@end