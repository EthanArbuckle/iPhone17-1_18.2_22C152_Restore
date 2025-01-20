@interface WFOAuth2WebAuthorizationSession
- (ASWebAuthenticationSession)authenticationSession;
- (BOOL)resumeSessionWithResponseObject:(id)a3;
- (BOOL)resumeSessionWithURL:(id)a3;
- (NSString)responseKey;
- (NSString)responseType;
- (NSString)state;
- (NSURL)authorizationURL;
- (NSURL)redirectURI;
- (WFOAuth2SessionManager)sessionManager;
- (WFOAuth2WebAuthorizationSession)initWithSessionManager:(id)a3 authorizationURL:(id)a4 responseType:(id)a5 redirectURI:(id)a6 specifyRedirectURI:(BOOL)a7 completionHandler:(id)a8;
- (WFWebAuthenticationSessionPresentationContext)presentationContext;
- (id)authenticationSessionWithPresentationAnchor:(id)a3;
- (id)completionHandler;
- (void)setAuthenticationSession:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setPresentationContext:(id)a3;
@end

@implementation WFOAuth2WebAuthorizationSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseKey, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_authenticationSession, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_responseType, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_redirectURI, 0);
  objc_storeStrong((id *)&self->_authorizationURL, 0);
}

- (NSString)responseKey
{
  return self->_responseKey;
}

- (void)setPresentationContext:(id)a3
{
}

- (WFWebAuthenticationSessionPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setAuthenticationSession:(id)a3
{
}

- (ASWebAuthenticationSession)authenticationSession
{
  return self->_authenticationSession;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)responseType
{
  return self->_responseType;
}

- (WFOAuth2SessionManager)sessionManager
{
  return self->_sessionManager;
}

- (NSURL)redirectURI
{
  return self->_redirectURI;
}

- (NSURL)authorizationURL
{
  return self->_authorizationURL;
}

- (BOOL)resumeSessionWithURL:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F08BA0] componentsWithURL:v3 resolvingAgainstBaseURL:0];
  v5 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v6 = [v4 queryItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v12 = [v11 value];
        v13 = [v11 name];
        [v5 setValue:v12 forKey:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v8);
  }

  v14 = [v4 fragment];
  v15 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  v16 = [v15 invertedSet];
  uint64_t v17 = [v14 rangeOfCharacterFromSet:v16];

  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v38 = v3;
    v18 = objc_opt_new();
    [v18 setPercentEncodedQuery:v14];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v19 = [v18 queryItems];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v41 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v40 + 1) + 8 * j);
          v25 = objc_msgSend(v24, "value", v38);
          v26 = [v24 name];
          [v5 setValue:v25 forKey:v26];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v21);
    }

    id v3 = v38;
  }
  v27 = [(WFOAuth2WebAuthorizationSession *)self redirectURI];
  v28 = v27;
  if (!v27)
  {
    v32 = [(WFOAuth2WebAuthorizationSession *)self responseKey];
    v33 = [v5 objectForKeyedSubscript:v32];
    if (v33
      && ([v5 objectForKeyedSubscript:@"state"],
          (v34 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      v36 = [v5 objectForKeyedSubscript:@"error"];

      if (v33) {
      if (!v36)
      }
        goto LABEL_26;
    }
LABEL_30:
    BOOL v35 = [(WFOAuth2WebAuthorizationSession *)self resumeSessionWithResponseObject:v5];
    goto LABEL_31;
  }
  v29 = [v27 host];
  if ([v29 isEqualToString:@"workflow.is"])
  {
    v30 = [v3 scheme];
    char v31 = [v30 isEqualToString:@"workflow"];
  }
  else
  {
    char v31 = 0;
  }

  if (objc_msgSend(v3, "wfo_isEqualToRedirectURI:", v28) & 1) != 0 || (v31) {
    goto LABEL_30;
  }
LABEL_26:
  BOOL v35 = 0;
LABEL_31:

  return v35;
}

- (BOOL)resumeSessionWithResponseObject:(id)a3
{
  v34[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WFOAuth2WebAuthorizationSession *)self completionHandler];
  [(WFOAuth2WebAuthorizationSession *)self setCompletionHandler:0];
  if (v5)
  {
    [(ASWebAuthenticationSession *)self->_authenticationSession cancel];
    v6 = WFRFC6749Section5_2ErrorFromResponse(v4);
    if (v6)
    {
      ((void (**)(void, void, void *))v5)[2](v5, 0, v6);
LABEL_18:

      goto LABEL_19;
    }
    uint64_t v7 = [(WFOAuth2WebAuthorizationSession *)self state];
    if ([v7 length]
      && ([v4 objectForKeyedSubscript:@"state"],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v8 isEqualToString:v7],
          v8,
          (v9 & 1) == 0))
    {
      v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v33 = *MEMORY[0x263F08320];
      v34[0] = @"The state parameter on the received callback was invalid.";
      v10 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
      v11 = [v15 errorWithDomain:@"WFOAuth2ErrorDomain" code:200 userInfo:v10];
      ((void (**)(void, void, void *))v5)[2](v5, 0, v11);
    }
    else
    {
      v10 = [(WFOAuth2WebAuthorizationSession *)self responseKey];
      v11 = [v4 objectForKeyedSubscript:v10];
      if ([v11 length])
      {
        v12 = [(WFOAuth2WebAuthorizationSession *)self responseType];
        if ([v12 isEqualToString:@"code"])
        {
          v13 = [(WFOAuth2WebAuthorizationSession *)self sessionManager];
          id v14 = [(WFOAuth2WebAuthorizationSession *)self redirectURI];
          [v13 authenticateWithCode:v11 redirectURI:v14 completionHandler:v5];
        }
        else
        {
          if (![v12 isEqualToString:@"token"])
          {
LABEL_16:

            goto LABEL_17;
          }
          v28 = v12;
          uint64_t v29 = WFRFC6749Section5_2ErrorFromResponse(v4);
          id v14 = v4;
          uint64_t v20 = [v14 objectForKeyedSubscript:@"expires_in"];
          uint64_t v21 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
          uint64_t v22 = [v21 invertedSet];
          v30 = v20;
          uint64_t v23 = [v20 rangeOfCharacterFromSet:v22];

          if (v23 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v24 = (void *)[v14 mutableCopy];
            v25 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v30, "longLongValue"));
            [v24 setObject:v25 forKeyedSubscript:@"expires_in"];

            id v14 = v24;
          }
          v26 = [[WFOAuth2Credential alloc] initWithResponseObject:v14];
          v13 = (void *)v29;
          ((void (**)(void, WFOAuth2Credential *, uint64_t))v5)[2](v5, v26, v29);

          v12 = v28;
        }

        goto LABEL_16;
      }
      v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = *MEMORY[0x263F08320];
      uint64_t v17 = [NSString stringWithFormat:@"The \"%@\" parameter on the received callback was missing.", v10];
      v32 = v17;
      v18 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      v19 = [v16 errorWithDomain:@"WFOAuth2ErrorDomain" code:200 userInfo:v18];
      ((void (**)(void, void, void *))v5)[2](v5, 0, v19);
    }
LABEL_17:

    goto LABEL_18;
  }
LABEL_19:

  return v5 != 0;
}

- (id)authenticationSessionWithPresentationAnchor:(id)a3
{
  id v4 = a3;
  authenticationSession = self->_authenticationSession;
  if (!authenticationSession)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__WFOAuth2WebAuthorizationSession_authenticationSessionWithPresentationAnchor___block_invoke;
    aBlock[3] = &unk_264E5D408;
    objc_copyWeak(&v20, &location);
    v6 = _Block_copy(aBlock);
    uint64_t v7 = [(WFOAuth2WebAuthorizationSession *)self redirectURI];
    uint64_t v8 = [v7 scheme];

    if (![(__CFString *)v8 caseInsensitiveCompare:@"http"]
      || ![(__CFString *)v8 caseInsensitiveCompare:@"https"])
    {

      uint64_t v8 = @"workflow";
    }
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2050000000;
    char v9 = (void *)getASWebAuthenticationSessionClass_softClass;
    uint64_t v26 = getASWebAuthenticationSessionClass_softClass;
    if (!getASWebAuthenticationSessionClass_softClass)
    {
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __getASWebAuthenticationSessionClass_block_invoke;
      v22[3] = &unk_264E5EC88;
      v22[4] = &v23;
      __getASWebAuthenticationSessionClass_block_invoke((uint64_t)v22);
      char v9 = (void *)v24[3];
    }
    v10 = v9;
    _Block_object_dispose(&v23, 8);
    id v11 = [v10 alloc];
    v12 = [(WFOAuth2WebAuthorizationSession *)self authorizationURL];
    v13 = (void *)[v11 initWithURL:v12 callbackURLScheme:v8 completionHandler:v6];
    [(WFOAuth2WebAuthorizationSession *)self setAuthenticationSession:v13];

    id v14 = [[WFWebAuthenticationSessionPresentationContext alloc] initWithPresentationAnchor:v4];
    [(WFOAuth2WebAuthorizationSession *)self setPresentationContext:v14];

    v15 = [(WFOAuth2WebAuthorizationSession *)self presentationContext];
    v16 = [(WFOAuth2WebAuthorizationSession *)self authenticationSession];
    [v16 setPresentationContextProvider:v15];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    authenticationSession = self->_authenticationSession;
  }
  uint64_t v17 = authenticationSession;

  return v17;
}

void __79__WFOAuth2WebAuthorizationSession_authenticationSessionWithPresentationAnchor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (!v9 || v5)
  {
    uint64_t v8 = [WeakRetained completionHandler];
    [v7 setCompletionHandler:0];
    if (v8) {
      ((void (**)(void, void, id))v8)[2](v8, 0, v5);
    }
  }
  else
  {
    [WeakRetained resumeSessionWithURL:v9];
  }
}

- (WFOAuth2WebAuthorizationSession)initWithSessionManager:(id)a3 authorizationURL:(id)a4 responseType:(id)a5 redirectURI:(id)a6 specifyRedirectURI:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  v55[2] = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v47 = [MEMORY[0x263F08690] currentHandler];
    [v47 handleFailureInMethod:a2, self, @"WFOAuth2WebAuthorizationSession.m", 52, @"Invalid parameter not satisfying: %@", @"sessionManager" object file lineNumber description];

    if (v17)
    {
LABEL_3:
      if (v18) {
        goto LABEL_4;
      }
LABEL_15:
      v49 = [MEMORY[0x263F08690] currentHandler];
      [v49 handleFailureInMethod:a2, self, @"WFOAuth2WebAuthorizationSession.m", 54, @"Invalid parameter not satisfying: %@", @"responseType" object file lineNumber description];

      if (v20) {
        goto LABEL_5;
      }
      goto LABEL_16;
    }
  }
  v48 = [MEMORY[0x263F08690] currentHandler];
  [v48 handleFailureInMethod:a2, self, @"WFOAuth2WebAuthorizationSession.m", 53, @"Invalid parameter not satisfying: %@", @"authorizationURL" object file lineNumber description];

  if (!v18) {
    goto LABEL_15;
  }
LABEL_4:
  if (v20) {
    goto LABEL_5;
  }
LABEL_16:
  uint64_t v50 = [MEMORY[0x263F08690] currentHandler];
  [v50 handleFailureInMethod:a2, self, @"WFOAuth2WebAuthorizationSession.m", 55, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_5:
  v53.receiver = self;
  v53.super_class = (Class)WFOAuth2WebAuthorizationSession;
  uint64_t v21 = [(WFOAuth2WebAuthorizationSession *)&v53 init];
  uint64_t v22 = v21;
  if (v21)
  {
    SEL v52 = a2;
    objc_storeStrong((id *)&v21->_sessionManager, a3);
    uint64_t v23 = [v18 copy];
    responseType = v22->_responseType;
    v22->_responseType = (NSString *)v23;

    uint64_t v25 = [v19 copy];
    redirectURI = v22->_redirectURI;
    v22->_redirectURI = (NSURL *)v25;

    v27 = [MEMORY[0x263F08C38] UUID];
    v28 = [v27 UUIDString];
    uint64_t v29 = [v28 stringByReplacingOccurrencesOfString:@"-" withString:&stru_26F008428];
    uint64_t v30 = [v29 lowercaseString];
    state = v22->_state;
    v22->_state = (NSString *)v30;

    v32 = _Block_copy(v20);
    id completionHandler = v22->_completionHandler;
    v22->_id completionHandler = v32;

    v54[0] = @"code";
    v54[1] = @"token";
    v55[0] = @"code";
    v55[1] = @"access_token";
    v34 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
    uint64_t v35 = [v34 objectForKeyedSubscript:v18];
    responseKey = v22->_responseKey;
    v22->_responseKey = (NSString *)v35;

    if (!v22->_responseKey)
    {
      v51 = [MEMORY[0x263F08690] currentHandler];
      [v51 handleFailureInMethod:v52, v22, @"WFOAuth2WebAuthorizationSession.m", 69, @"Unknown response type \"%@\"", v18 object file lineNumber description];
    }
    v37 = objc_opt_new();
    id v38 = [MEMORY[0x263F08BD0] queryItemWithName:@"response_type" value:v18];
    [v37 addObject:v38];

    v39 = [MEMORY[0x263F08BD0] queryItemWithName:@"state" value:v22->_state];
    [v37 addObject:v39];

    if (v19 && v9)
    {
      long long v40 = (void *)MEMORY[0x263F08BD0];
      long long v41 = [v19 absoluteString];
      long long v42 = [v40 queryItemWithName:@"redirect_uri" value:v41];
      [v37 addObject:v42];
    }
    uint64_t v43 = objc_msgSend(v17, "wfo_URLByAppendingQueryItems:", v37);
    authorizationURL = v22->_authorizationURL;
    v22->_authorizationURL = (NSURL *)v43;

    long long v45 = v22;
  }

  return v22;
}

@end