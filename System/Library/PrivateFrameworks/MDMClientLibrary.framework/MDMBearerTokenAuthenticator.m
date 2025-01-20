@interface MDMBearerTokenAuthenticator
+ (NSString)authenticationMethod;
+ (id)_createAuthInvalidError;
- (BOOL)authenticateRequest:(id)a3 error:(id *)a4;
- (BOOL)canRefreshToken;
- (BOOL)doesWebAuthentication;
- (BOOL)validAuthParams:(id)a3;
- (MDMBearerTokenAuthenticator)initWithRMAccountID:(id)a3;
- (MDMBearerTokenAuthenticator)initWithTokens:(id)a3;
- (NSString)token;
- (id)prepareForReauthenticationWithAuthParams:(id)a3 accountID:(id)a4 error:(id *)a5;
- (id)webAuthenticationURLForAuthParams:(id)a3 userIdentifier:(id)a4;
- (void)authTokensWithCallbackURL:(id)a3 authParams:(id)a4 completionHandler:(id)a5;
- (void)setToken:(id)a3;
@end

@implementation MDMBearerTokenAuthenticator

- (MDMBearerTokenAuthenticator)initWithRMAccountID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MDMBearerTokenAuthenticator;
  v5 = [(MDMBearerTokenAuthenticator *)&v12 init];
  if (v5)
  {
    id v11 = 0;
    uint64_t v6 = +[MDMAccountUtilities bearerTokenForRMAccountID:v4 error:&v11];
    id v7 = v11;
    token = v5->_token;
    v5->_token = (NSString *)v6;

    if (v7)
    {
      v9 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = v7;
        _os_log_impl(&dword_1DD340000, v9, OS_LOG_TYPE_ERROR, "Could not extract auth token from RM account: %{public}@", buf, 0xCu);
      }
    }
  }
  return v5;
}

- (MDMBearerTokenAuthenticator)initWithTokens:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MDMBearerTokenAuthenticator;
  v5 = [(MDMBearerTokenAuthenticator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"token"];
    token = v5->_token;
    v5->_token = (NSString *)v6;
  }
  return v5;
}

+ (NSString)authenticationMethod
{
  return (NSString *)@"apple-as-web";
}

- (BOOL)validAuthParams:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"method"];
  v5 = +[MDMBearerTokenAuthenticator authenticationMethod];
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
  uint64_t v6 = [(MDMBearerTokenAuthenticator *)self token];

  if (v6)
  {
    BOOL v7 = [(MDMBearerTokenAuthenticator *)self token];
    v8 = DMCHTTPAuthStringWithAuthToken();
    [v5 addValue:v8 forHTTPHeaderField:*MEMORY[0x1E4F5E6D8]];
  }
  return v6 != 0;
}

- (BOOL)doesWebAuthentication
{
  return 1;
}

- (id)webAuthenticationURLForAuthParams:(id)a3 userIdentifier:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(MDMBearerTokenAuthenticator *)self validAuthParams:v6])
  {
    v8 = (void *)MEMORY[0x1E4F1CB10];
    objc_super v9 = [v6 objectForKeyedSubscript:@"url"];
    v10 = [v8 URLWithString:v9];

    if (v10)
    {
      id v11 = [MEMORY[0x1E4F29088] componentsWithURL:v10 resolvingAgainstBaseURL:0];
      if (v7)
      {
        objc_super v12 = [MEMORY[0x1E4F290C8] queryItemWithName:@"user-identifier" value:v7];
        v16[0] = v12;
        v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
        [v11 setQueryItems:v13];
      }
      id v14 = [v11 URL];
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)authTokensWithCallbackURL:(id)a3 authParams:(id)a4 completionHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a5;
  v8 = [MEMORY[0x1E4F29088] componentsWithURL:v6 resolvingAgainstBaseURL:0];
  objc_super v9 = [v8 scheme];
  char v10 = [v9 isEqualToString:@"apple-remotemanagement-user-login"];

  if ((v10 & 1) == 0)
  {
    v19 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = v19;
      v21 = [v8 scheme];
      *(_DWORD *)buf = 138543362;
      v34 = v21;
      _os_log_impl(&dword_1DD340000, v20, OS_LOG_TYPE_ERROR, "Incorrect auth callback scheme: %{public}@", buf, 0xCu);
    }
LABEL_17:
    v22 = +[MDMBearerTokenAuthenticator _createAuthInvalidError];
    v7[2](v7, 0, v22);
    goto LABEL_18;
  }
  id v25 = v6;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = [v8 queryItems];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (!v12)
  {
LABEL_10:

LABEL_15:
    v24 = *(NSObject **)DMCLogObjects();
    id v6 = v25;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v25;
      _os_log_impl(&dword_1DD340000, v24, OS_LOG_TYPE_ERROR, "Invalid auth redirect URL response: %{public}@", buf, 0xCu);
    }
    goto LABEL_17;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v27;
LABEL_4:
  uint64_t v15 = 0;
  while (1)
  {
    if (*(void *)v27 != v14) {
      objc_enumerationMutation(v11);
    }
    v16 = *(void **)(*((void *)&v26 + 1) + 8 * v15);
    v17 = [v16 name];
    char v18 = [v17 isEqualToString:@"access-token"];

    if (v18) {
      break;
    }
    if (v13 == ++v15)
    {
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v13) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  v22 = [v16 value];

  if (!v22) {
    goto LABEL_15;
  }
  v30 = @"token";
  v31 = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  ((void (**)(id, void *, void *))v7)[2](v7, v23, 0);

  id v6 = v25;
LABEL_18:
}

- (BOOL)canRefreshToken
{
  return 0;
}

- (id)prepareForReauthenticationWithAuthParams:(id)a3 accountID:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [v7 objectForKeyedSubscript:@"url"];
  if (v9 && ([MEMORY[0x1E4F1CB10] URLWithString:v9], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v11 = (void *)v10;
    uint64_t v12 = [MEMORY[0x1E4F179C8] defaultStore];
    id v22 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __88__MDMBearerTokenAuthenticator_prepareForReauthenticationWithAuthParams_accountID_error___block_invoke;
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
      v17 = *(NSObject **)(DMCLogObjects() + 8);
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

void __88__MDMBearerTokenAuthenticator_prepareForReauthenticationWithAuthParams_accountID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 absoluteString];
  objc_msgSend(v5, "dmc_setBearerReauthURL:", v4);

  objc_msgSend(v5, "dmc_setBearerReauthParams:", *(void *)(a1 + 40));
}

+ (id)_createAuthInvalidError
{
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F5E6B0];
  id v4 = DMCErrorArray();
  id v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15024, v4, *MEMORY[0x1E4F5E6B8], 0);

  return v5;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end