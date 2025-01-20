@interface WFDropboxAppAuthorizationSession
- (BOOL)resumeSessionWithURL:(id)a3;
- (NSArray)authorizationURLs;
- (NSString)clientID;
- (NSString)state;
- (NSURL)cancelURI;
- (NSURL)successURI;
- (WFDropboxAppAuthorizationSession)initWithClientID:(id)a3 completionHandler:(id)a4;
- (id)completionHandler;
- (void)setCompletionHandler:(id)a3;
@end

@implementation WFDropboxAppAuthorizationSession

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_cancelURI, 0);
  objc_storeStrong((id *)&self->_successURI, 0);
  objc_storeStrong((id *)&self->_authorizationURLs, 0);
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

- (NSString)clientID
{
  return self->_clientID;
}

- (NSURL)cancelURI
{
  return self->_cancelURI;
}

- (NSURL)successURI
{
  return self->_successURI;
}

- (NSArray)authorizationURLs
{
  return self->_authorizationURLs;
}

- (BOOL)resumeSessionWithURL:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WFDropboxAppAuthorizationSession *)self completionHandler];
  if (!v5) {
    goto LABEL_16;
  }
  v6 = [(WFDropboxAppAuthorizationSession *)self successURI];
  int v7 = objc_msgSend(v4, "wfo_isEqualToRedirectURI:", v6);

  if (v7)
  {
    v8 = [MEMORY[0x263F08BA0] componentsWithURL:v4 resolvingAgainstBaseURL:0];
    v9 = objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v37 = v8;
    v10 = [v8 queryItems];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v50 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v39 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          v16 = [v15 value];
          v17 = [v15 name];
          [v9 setValue:v16 forKey:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v38 objects:v50 count:16];
      }
      while (v12);
    }

    v18 = [v9 objectForKeyedSubscript:@"state"];
    v19 = [(WFDropboxAppAuthorizationSession *)self state];
    char v20 = [v18 isEqualToString:v19];

    if ((v20 & 1) == 0)
    {
      v30 = (void *)MEMORY[0x263F087E8];
      uint64_t v48 = *MEMORY[0x263F08320];
      v49 = @"The state parameter on the received callback was invalid.";
      BOOL v29 = 1;
      v31 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      v32 = [v30 errorWithDomain:@"WFOAuth2ErrorDomain" code:200 userInfo:v31];
      ((void (**)(void, void, void *))v5)[2](v5, 0, v32);

      goto LABEL_19;
    }
    v21 = [v9 objectForKeyedSubscript:@"oauth_token_secret"];
    if (![v21 length])
    {
      v33 = (void *)MEMORY[0x263F087E8];
      uint64_t v46 = *MEMORY[0x263F08320];
      v47 = @"The \"oauth_token_secret\" parameter on the received callback was missing.";
      v34 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      v35 = [v33 errorWithDomain:@"WFOAuth2ErrorDomain" code:200 userInfo:v34];
      ((void (**)(void, void, void *))v5)[2](v5, 0, v35);

      BOOL v29 = 1;
      goto LABEL_19;
    }
    v22 = [WFOAuth2Credential alloc];
    v44 = @"access_token";
    v45 = v21;
    v23 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    v24 = [(WFOAuth2Credential *)v22 initWithResponseObject:v23];
    ((void (**)(void, WFOAuth2Credential *, void))v5)[2](v5, v24, 0);

    v25 = v37;
    goto LABEL_15;
  }
  v26 = [(WFDropboxAppAuthorizationSession *)self cancelURI];
  int v27 = objc_msgSend(v4, "wfo_isEqualToRedirectURI:", v26);

  if (!v27)
  {
LABEL_16:
    BOOL v29 = 0;
    goto LABEL_19;
  }
  v28 = (void *)MEMORY[0x263F087E8];
  uint64_t v42 = *MEMORY[0x263F08320];
  v43 = @"The user cancelled the request.";
  v25 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  v9 = [v28 errorWithDomain:@"WFOAuth2ErrorDomain" code:106 userInfo:v25];
  ((void (**)(void, void, void *))v5)[2](v5, 0, v9);
LABEL_15:

  [(WFDropboxAppAuthorizationSession *)self setCompletionHandler:0];
  BOOL v29 = 1;
LABEL_19:

  return v29;
}

- (WFDropboxAppAuthorizationSession)initWithClientID:(id)a3 completionHandler:(id)a4
{
  v52[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v43 = [MEMORY[0x263F08690] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"WFDropboxAppAuthorizationSession.m", 31, @"Invalid parameter not satisfying: %@", @"clientID" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v44 = [MEMORY[0x263F08690] currentHandler];
  [v44 handleFailureInMethod:a2, self, @"WFDropboxAppAuthorizationSession.m", 32, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  v50.receiver = self;
  v50.super_class = (Class)WFDropboxAppAuthorizationSession;
  uint64_t v11 = [(WFDropboxAppAuthorizationSession *)&v50 init];
  uint64_t v12 = v11;
  if (v11)
  {
    id v45 = v8;
    objc_storeStrong((id *)&v11->_clientID, a3);
    uint64_t v13 = [MEMORY[0x263F08C38] UUID];
    v14 = [v13 UUIDString];
    v15 = [v14 stringByReplacingOccurrencesOfString:@"-" withString:&stru_26F008428];
    v16 = [v15 lowercaseString];
    uint64_t v17 = [@"oauth2:" stringByAppendingString:v16];
    state = v12->_state;
    v12->_state = (NSString *)v17;

    v19 = NSURL;
    char v20 = [NSString stringWithFormat:@"db-%@://1/connect", v12->_clientID];
    uint64_t v21 = [v19 URLWithString:v20];
    successURI = v12->_successURI;
    v12->_successURI = (NSURL *)v21;

    v23 = NSURL;
    v24 = [NSString stringWithFormat:@"db-%@://1/cancel", v12->_clientID];
    uint64_t v25 = [v23 URLWithString:v24];
    cancelURI = v12->_cancelURI;
    v12->_cancelURI = (NSURL *)v25;

    int v27 = _Block_copy(v10);
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = v27;

    BOOL v29 = [MEMORY[0x263F08BD0] queryItemWithName:@"k" value:v12->_clientID];
    v52[0] = v29;
    v30 = [MEMORY[0x263F08BD0] queryItemWithName:@"s" value:0];
    v52[1] = v30;
    v31 = [MEMORY[0x263F08BD0] queryItemWithName:@"state" value:v12->_state];
    v52[2] = v31;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:3];

    v33 = objc_opt_new();
    [v33 setHost:@"1"];
    [v33 setPath:@"/connect"];
    [v33 setQueryItems:v32];
    v34 = (NSArray *)objc_opt_new();
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v35 = [&unk_26F0765D8 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v47;
      do
      {
        uint64_t v38 = 0;
        do
        {
          if (*(void *)v47 != v37) {
            objc_enumerationMutation(&unk_26F0765D8);
          }
          [v33 setScheme:*(void *)(*((void *)&v46 + 1) + 8 * v38)];
          long long v39 = [v33 URL];
          [(NSArray *)v34 addObject:v39];

          ++v38;
        }
        while (v36 != v38);
        uint64_t v36 = [&unk_26F0765D8 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v36);
    }
    authorizationURLs = v12->_authorizationURLs;
    v12->_authorizationURLs = v34;

    long long v41 = v12;
    id v8 = v45;
  }

  return v12;
}

@end