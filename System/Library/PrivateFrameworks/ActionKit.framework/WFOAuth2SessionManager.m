@interface WFOAuth2SessionManager
+ (id)combinedScopeFromScopes:(id)a3;
- (NSString)authenticationMethod;
- (NSString)clientID;
- (NSString)clientSecret;
- (NSURL)authorizationURL;
- (NSURL)tokenURL;
- (NSURLSession)session;
- (WFOAuth2SessionManager)initWithSessionConfiguration:(id)a3 tokenURL:(id)a4 authorizationURL:(id)a5 authenticationMethod:(id)a6 clientID:(id)a7 clientSecret:(id)a8;
- (id)authorizationSessionWithAuthorizationURL:(id)a3 responseType:(id)a4 scopes:(id)a5 redirectURI:(id)a6 specifyRedirectURI:(BOOL)a7 completionHandler:(id)a8;
- (id)authorizationSessionWithResponseType:(id)a3 scopes:(id)a4 redirectURI:(id)a5 completionHandler:(id)a6;
- (void)authenticateWithCode:(id)a3 redirectURI:(id)a4 completionHandler:(id)a5;
- (void)authenticateWithParameters:(id)a3 completionHandler:(id)a4;
- (void)authenticateWithRefreshCredential:(id)a3 completionHandler:(id)a4;
- (void)authenticateWithRequest:(id)a3 refreshToken:(id)a4 completionHandler:(id)a5;
- (void)authenticateWithScopes:(id)a3 completionHandler:(id)a4;
- (void)authenticateWithUsername:(id)a3 password:(id)a4 scopes:(id)a5 completionHandler:(id)a6;
- (void)sendRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation WFOAuth2SessionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_authenticationMethod, 0);
  objc_storeStrong((id *)&self->_clientSecret, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_authorizationURL, 0);
  objc_storeStrong((id *)&self->_tokenURL, 0);
}

- (NSURLSession)session
{
  return self->_session;
}

- (NSString)authenticationMethod
{
  return self->_authenticationMethod;
}

- (NSString)clientSecret
{
  return self->_clientSecret;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSURL)authorizationURL
{
  return self->_authorizationURL;
}

- (NSURL)tokenURL
{
  return self->_tokenURL;
}

- (id)authorizationSessionWithAuthorizationURL:(id)a3 responseType:(id)a4 scopes:(id)a5 redirectURI:(id)a6 specifyRedirectURI:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v28 = a7;
  id v13 = a8;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = [(id)objc_opt_class() combinedScopeFromScopes:v15];

  v19 = objc_opt_new();
  v20 = (void *)MEMORY[0x263F08BD0];
  v21 = [(WFOAuth2SessionManager *)self clientID];
  v22 = [v20 queryItemWithName:@"client_id" value:v21];
  [v19 addObject:v22];

  if (v18)
  {
    v23 = [MEMORY[0x263F08BD0] queryItemWithName:@"scope" value:v18];
    [v19 addObject:v23];
  }
  v24 = [WFOAuth2WebAuthorizationSession alloc];
  v25 = objc_msgSend(v17, "wfo_URLByAppendingQueryItems:", v19);

  v26 = [(WFOAuth2WebAuthorizationSession *)v24 initWithSessionManager:self authorizationURL:v25 responseType:v16 redirectURI:v14 specifyRedirectURI:v28 completionHandler:v13];
  return v26;
}

- (id)authorizationSessionWithResponseType:(id)a3 scopes:(id)a4 redirectURI:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(WFOAuth2SessionManager *)self authorizationURL];
  id v15 = [(WFOAuth2SessionManager *)self authorizationSessionWithAuthorizationURL:v14 responseType:v13 scopes:v12 redirectURI:v11 specifyRedirectURI:1 completionHandler:v10];

  return v15;
}

- (void)sendRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFOAuth2SessionManager *)self session];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__WFOAuth2SessionManager_sendRequest_completionHandler___block_invoke;
  v11[3] = &unk_264E5EC38;
  id v12 = v6;
  id v9 = v6;
  id v10 = [v8 dataTaskWithRequest:v7 completionHandler:v11];

  [v10 resume];
}

void __56__WFOAuth2SessionManager_sendRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v7 length])
  {
    id v31 = v9;
    id v10 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v31];
    id v11 = v31;

    if (!v10)
    {
      id v12 = objc_opt_new();
      id v13 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
      [v12 setQuery:v13];

      id v14 = [v12 queryItems];
      if ([v14 count])
      {
        v25 = v12;
        uint64_t v26 = a1;
        id v15 = objc_opt_new();
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v24 = v14;
        id v16 = v14;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v28 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              v22 = [v21 value];
              v23 = [v21 name];
              [v15 setValue:v22 forKey:v23];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
          }
          while (v18);
        }

        id v10 = (void *)[v15 copy];
        id v11 = 0;
        id v12 = v25;
        a1 = v26;
        id v14 = v24;
      }
      else
      {
        id v10 = 0;
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    id v9 = v11;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)authenticateWithRequest:(id)a3 refreshToken:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __81__WFOAuth2SessionManager_authenticateWithRequest_refreshToken_completionHandler___block_invoke;
  v12[3] = &unk_264E5E318;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(WFOAuth2SessionManager *)self sendRequest:a3 completionHandler:v12];
}

void __81__WFOAuth2SessionManager_authenticateWithRequest_refreshToken_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v15 = a2;
  id v6 = a4;
  uint64_t v7 = [v15 objectForKeyedSubscript:@"refresh_token"];
  id v8 = (void *)v7;
  if (*(void *)(a1 + 32)) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v10 = (void *)[v15 mutableCopy];
    [v10 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"refresh_token"];
    uint64_t v11 = [v10 copy];

    id v15 = (id)v11;
  }
  id v12 = [[WFOAuth2Credential alloc] initWithResponseObject:v15];
  uint64_t v13 = *(void *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, WFOAuth2Credential *, id))(v13 + 16))(v13, v12, v6);
  }
  else
  {
    id v14 = WFRFC6749Section5_2ErrorFromResponse(v15);
    (*(void (**)(uint64_t, WFOAuth2Credential *, void *))(v13 + 16))(v13, v12, v14);
  }
}

- (void)authenticateWithParameters:(id)a3 completionHandler:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"WFOAuth2SessionManager.m", 118, @"Invalid parameter not satisfying: %@", @"parameters" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  long long v30 = [MEMORY[0x263F08690] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"WFOAuth2SessionManager.m", 119, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  id v10 = (void *)MEMORY[0x263EFC5E8];
  uint64_t v11 = [(WFOAuth2SessionManager *)self tokenURL];
  id v12 = [v10 requestWithURL:v11];

  [v12 _setNonAppInitiated:1];
  [v12 setHTTPMethod:@"POST"];
  uint64_t v13 = [(WFOAuth2SessionManager *)self authenticationMethod];
  if ([v13 isEqualToString:@"client_secret_basic"])
  {
    id v14 = [(WFOAuth2SessionManager *)self clientID];
    id v15 = [(WFOAuth2SessionManager *)self clientSecret];
    objc_msgSend(v12, "wfo_setAuthorizationWithUsername:password:", v14, v15);
  }
  else
  {
    if (![v13 isEqualToString:@"client_secret_post"]) {
      goto LABEL_10;
    }
    id v16 = (void *)MEMORY[0x263F08BD0];
    uint64_t v17 = [(WFOAuth2SessionManager *)self clientID];
    uint64_t v18 = [v16 queryItemWithName:@"client_id" value:v17];
    uint64_t v19 = [v7 arrayByAddingObject:v18];

    id v14 = [(WFOAuth2SessionManager *)self clientSecret];
    if (![v14 length])
    {
      id v7 = v19;
      goto LABEL_9;
    }
    id v15 = [MEMORY[0x263F08BD0] queryItemWithName:@"client_secret" value:v14];
    id v7 = [v19 arrayByAddingObject:v15];
  }
LABEL_9:

LABEL_10:
  objc_msgSend(v12, "wfo_setBodyWithQueryItems:", v7);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v20 = v7;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    id v31 = v13;
    v32 = v9;
    uint64_t v23 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v26 = [v25 name];
        int v27 = [v26 isEqualToString:@"refresh_token"];

        if (v27)
        {
          long long v28 = [v25 value];
          goto LABEL_20;
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v22) {
        continue;
      }
      break;
    }
    long long v28 = 0;
LABEL_20:
    uint64_t v13 = v31;
    BOOL v9 = v32;
  }
  else
  {
    long long v28 = 0;
  }

  [(WFOAuth2SessionManager *)self authenticateWithRequest:v12 refreshToken:v28 completionHandler:v9];
}

- (void)authenticateWithRefreshCredential:(id)a3 completionHandler:(id)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  BOOL v9 = [v8 refreshToken];

  if (!v9)
  {
    id v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFOAuth2SessionManager.m", 108, @"Invalid parameter not satisfying: %@", @"refreshCredential.refreshToken" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    id v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFOAuth2SessionManager.m", 109, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  id v10 = [MEMORY[0x263F08BD0] queryItemWithName:@"grant_type" value:@"refresh_token"];
  v17[0] = v10;
  uint64_t v11 = (void *)MEMORY[0x263F08BD0];
  id v12 = [v8 refreshToken];

  uint64_t v13 = [v11 queryItemWithName:@"refresh_token" value:v12];
  v17[1] = v13;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  [(WFOAuth2SessionManager *)self authenticateWithParameters:v14 completionHandler:v7];
}

- (void)authenticateWithCode:(id)a3 redirectURI:(id)a4 completionHandler:(id)a5
{
  v22[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    id v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"WFOAuth2SessionManager.m", 94, @"Invalid parameter not satisfying: %@", @"code" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  uint64_t v21 = [MEMORY[0x263F08690] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"WFOAuth2SessionManager.m", 95, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  uint64_t v13 = [MEMORY[0x263F08BD0] queryItemWithName:@"grant_type" value:@"authorization_code"];
  v22[0] = v13;
  id v14 = [MEMORY[0x263F08BD0] queryItemWithName:@"code" value:v9];
  v22[1] = v14;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];

  if (v10)
  {
    id v16 = (void *)MEMORY[0x263F08BD0];
    uint64_t v17 = [v10 absoluteString];
    uint64_t v18 = [v16 queryItemWithName:@"redirect_uri" value:v17];
    uint64_t v19 = [v15 arrayByAddingObject:v18];

    id v15 = (void *)v19;
  }
  [(WFOAuth2SessionManager *)self authenticateWithParameters:v15 completionHandler:v12];
}

- (void)authenticateWithUsername:(id)a3 password:(id)a4 scopes:(id)a5 completionHandler:(id)a6
{
  v25[3] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"WFOAuth2SessionManager.m", 77, @"Invalid parameter not satisfying: %@", @"password" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  uint64_t v22 = [MEMORY[0x263F08690] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"WFOAuth2SessionManager.m", 76, @"Invalid parameter not satisfying: %@", @"username" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v24 = [MEMORY[0x263F08690] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"WFOAuth2SessionManager.m", 78, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  id v15 = [MEMORY[0x263F08BD0] queryItemWithName:@"grant_type" value:@"password"];
  v25[0] = v15;
  id v16 = [MEMORY[0x263F08BD0] queryItemWithName:@"username" value:v11];
  v25[1] = v16;
  uint64_t v17 = [MEMORY[0x263F08BD0] queryItemWithName:@"password" value:v12];
  v25[2] = v17;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];

  uint64_t v19 = [(id)objc_opt_class() combinedScopeFromScopes:v13];
  if (v19)
  {
    id v20 = [MEMORY[0x263F08BD0] queryItemWithName:@"scope" value:v19];
    uint64_t v21 = [v18 arrayByAddingObject:v20];

    uint64_t v18 = (void *)v21;
  }
  [(WFOAuth2SessionManager *)self authenticateWithParameters:v18 completionHandler:v14];
}

- (void)authenticateWithScopes:(id)a3 completionHandler:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263F08BD0];
  id v8 = a3;
  id v9 = [v7 queryItemWithName:@"grant_type" value:@"client_credentials"];
  v14[0] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];

  id v11 = [(id)objc_opt_class() combinedScopeFromScopes:v8];

  if (v11)
  {
    id v12 = [MEMORY[0x263F08BD0] queryItemWithName:@"scope" value:v11];
    uint64_t v13 = [v10 arrayByAddingObject:v12];

    id v10 = (void *)v13;
  }
  [(WFOAuth2SessionManager *)self authenticateWithParameters:v10 completionHandler:v6];
}

- (WFOAuth2SessionManager)initWithSessionConfiguration:(id)a3 tokenURL:(id)a4 authorizationURL:(id)a5 authenticationMethod:(id)a6 clientID:(id)a7 clientSecret:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (v18)
  {
    if (v19) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v38 = [MEMORY[0x263F08690] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"WFOAuth2SessionManager.m", 45, @"Invalid parameter not satisfying: %@", @"authenticationMethod" object file lineNumber description];

    if (v19) {
      goto LABEL_3;
    }
  }
  v39 = [MEMORY[0x263F08690] currentHandler];
  [v39 handleFailureInMethod:a2, self, @"WFOAuth2SessionManager.m", 46, @"Invalid parameter not satisfying: %@", @"clientID" object file lineNumber description];

LABEL_3:
  v40.receiver = self;
  v40.super_class = (Class)WFOAuth2SessionManager;
  uint64_t v21 = [(WFOAuth2SessionManager *)&v40 init];
  if (v21)
  {
    uint64_t v22 = (void *)MEMORY[0x263EFC640];
    uint64_t v23 = v15;
    if (!v15)
    {
      uint64_t v23 = objc_msgSend(MEMORY[0x263EFC648], "wf_defaultSessionConfiguration");
    }
    uint64_t v24 = [v22 sessionWithConfiguration:v23];
    session = v21->_session;
    v21->_session = (NSURLSession *)v24;

    if (!v15) {
    uint64_t v26 = [v16 copy];
    }
    tokenURL = v21->_tokenURL;
    v21->_tokenURL = (NSURL *)v26;

    uint64_t v28 = [v17 copy];
    authorizationURL = v21->_authorizationURL;
    v21->_authorizationURL = (NSURL *)v28;

    uint64_t v30 = [v18 copy];
    authenticationMethod = v21->_authenticationMethod;
    v21->_authenticationMethod = (NSString *)v30;

    uint64_t v32 = [v19 copy];
    clientID = v21->_clientID;
    v21->_clientID = (NSString *)v32;

    uint64_t v34 = [v20 copy];
    clientSecret = v21->_clientSecret;
    v21->_clientSecret = (NSString *)v34;

    long long v36 = v21;
  }

  return v21;
}

+ (id)combinedScopeFromScopes:(id)a3
{
  return (id)[a3 componentsJoinedByString:@" "];
}

@end