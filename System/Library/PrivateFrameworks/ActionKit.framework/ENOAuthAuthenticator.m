@interface ENOAuthAuthenticator
+ (id)deviceDescription;
+ (id)parametersFromQueryString:(id)a3;
+ (id)queryStringFromParameters:(id)a3;
- (BOOL)canHandleSwitchProfileURL:(id)a3;
- (BOOL)handleOpenURL:(id)a3;
- (BOOL)inProgress;
- (BOOL)isActiveBecauseOfCallback;
- (BOOL)isCancelled;
- (BOOL)isSwitchingInProgress;
- (BOOL)preferRegistration;
- (BOOL)supportsLinkedAppNotebook;
- (BOOL)useWebAuthenticationOnly;
- (BOOL)userSelectedLinkedAppNotebook;
- (ENAuthenticatorDelegate)delegate;
- (ENCredentialStore)credentialStore;
- (NSArray)profiles;
- (NSMutableData)receivedData;
- (NSString)consumerKey;
- (NSString)consumerSecret;
- (NSString)currentProfile;
- (NSString)host;
- (NSString)tokenSecret;
- (NSURLResponse)response;
- (id)callbackScheme;
- (id)oauthCallback;
- (id)userAuthorizationURLStringWithParameters:(id)a3;
- (int64_t)state;
- (void)authenticate;
- (void)completeAuthenticationWithCredentials:(id)a3 usesLinkedAppNotebook:(BOOL)a4;
- (void)completeAuthenticationWithError:(id)a3;
- (void)didFinishLoading;
- (void)disableIsActiveBecauseOfCallback;
- (void)emptyCookieJar;
- (void)enableIsActiveBecauseOfCallback;
- (void)failedWithError:(id)a3;
- (void)getOAuthTokenForURL:(id)a3;
- (void)gotCallbackURL:(id)a3;
- (void)handleDidBecomeActive;
- (void)receivedData:(id)a3;
- (void)receivedResponse:(id)a3;
- (void)setConsumerKey:(id)a3;
- (void)setConsumerSecret:(id)a3;
- (void)setCredentialStore:(id)a3;
- (void)setCurrentProfile:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHost:(id)a3;
- (void)setInProgress:(BOOL)a3;
- (void)setIsActiveBecauseOfCallback:(BOOL)a3;
- (void)setIsCancelled:(BOOL)a3;
- (void)setIsSwitchingInProgress:(BOOL)a3;
- (void)setPreferRegistration:(BOOL)a3;
- (void)setProfiles:(id)a3;
- (void)setReceivedData:(id)a3;
- (void)setResponse:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSupportsLinkedAppNotebook:(BOOL)a3;
- (void)setTokenSecret:(id)a3;
- (void)setUseWebAuthenticationOnly:(BOOL)a3;
- (void)setUserSelectedLinkedAppNotebook:(BOOL)a3;
- (void)startOauthAuthentication;
- (void)switchProfile;
- (void)updateCurrentBootstrapProfileWithName:(id)a3;
@end

@implementation ENOAuthAuthenticator

+ (id)parametersFromQueryString:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v17 = v3;
  v5 = [v3 componentsSeparatedByString:@"&"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) componentsSeparatedByString:@"="];
        if ([v10 count] == 2)
        {
          v11 = [v10 objectAtIndex:0];
          v12 = objc_msgSend(v11, "en_stringByUrlDecoding");

          v13 = [v10 objectAtIndex:1];
          v14 = objc_msgSend(v13, "en_stringByUrlDecoding");

          if (v12) {
            BOOL v15 = v14 == 0;
          }
          else {
            BOOL v15 = 1;
          }
          if (!v15) {
            [v4 setObject:v14 forKey:v12];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)queryStringFromParameters:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  v5 = [v3 array];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__ENOAuthAuthenticator_queryStringFromParameters___block_invoke;
  v9[3] = &unk_264E5A8A8;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  uint64_t v7 = [v6 componentsJoinedByString:@"&"];

  return v7;
}

void __50__ENOAuthAuthenticator_queryStringFromParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = NSString;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(a2, "en_stringByUrlEncoding");
  uint64_t v8 = objc_msgSend(v6, "en_stringByUrlEncoding");

  [v5 stringWithFormat:@"%@=%@", v7, v8];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) addObject:v9];
}

+ (id)deviceDescription
{
  return &stru_26F008428;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_receivedData, 0);
  objc_storeStrong((id *)&self->_tokenSecret, 0);
  objc_storeStrong((id *)&self->_credentialStore, 0);
  objc_storeStrong((id *)&self->_currentProfile, 0);
  objc_storeStrong((id *)&self->_profiles, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_consumerSecret, 0);
  objc_storeStrong((id *)&self->_consumerKey, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setResponse:(id)a3
{
}

- (NSURLResponse)response
{
  return self->_response;
}

- (void)setReceivedData:(id)a3
{
}

- (NSMutableData)receivedData
{
  return self->_receivedData;
}

- (void)setUserSelectedLinkedAppNotebook:(BOOL)a3
{
  self->_userSelectedLinkedAppNotebook = a3;
}

- (BOOL)userSelectedLinkedAppNotebook
{
  return self->_userSelectedLinkedAppNotebook;
}

- (void)setIsActiveBecauseOfCallback:(BOOL)a3
{
  self->_isActiveBecauseOfCallback = a3;
}

- (BOOL)isActiveBecauseOfCallback
{
  return self->_isActiveBecauseOfCallback;
}

- (void)setIsSwitchingInProgress:(BOOL)a3
{
  self->_isSwitchingInProgress = a3;
}

- (BOOL)isSwitchingInProgress
{
  return self->_isSwitchingInProgress;
}

- (void)setTokenSecret:(id)a3
{
}

- (NSString)tokenSecret
{
  return self->_tokenSecret;
}

- (void)setCredentialStore:(id)a3
{
}

- (ENCredentialStore)credentialStore
{
  return self->_credentialStore;
}

- (void)setCurrentProfile:(id)a3
{
}

- (NSString)currentProfile
{
  return self->_currentProfile;
}

- (void)setProfiles:(id)a3
{
}

- (NSArray)profiles
{
  return self->_profiles;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setInProgress:(BOOL)a3
{
  self->_inProgress = a3;
}

- (BOOL)inProgress
{
  return self->_inProgress;
}

- (void)setPreferRegistration:(BOOL)a3
{
  self->_preferRegistration = a3;
}

- (BOOL)preferRegistration
{
  return self->_preferRegistration;
}

- (void)setUseWebAuthenticationOnly:(BOOL)a3
{
  self->_useWebAuthenticationOnly = a3;
}

- (BOOL)useWebAuthenticationOnly
{
  return self->_useWebAuthenticationOnly;
}

- (void)setSupportsLinkedAppNotebook:(BOOL)a3
{
  self->_supportsLinkedAppNotebook = a3;
}

- (BOOL)supportsLinkedAppNotebook
{
  return self->_supportsLinkedAppNotebook;
}

- (void)setHost:(id)a3
{
}

- (NSString)host
{
  return self->_host;
}

- (void)setConsumerSecret:(id)a3
{
}

- (NSString)consumerSecret
{
  return self->_consumerSecret;
}

- (void)setConsumerKey:(id)a3
{
}

- (NSString)consumerKey
{
  return self->_consumerKey;
}

- (void)setDelegate:(id)a3
{
}

- (ENAuthenticatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ENAuthenticatorDelegate *)WeakRetained;
}

- (void)getOAuthTokenForURL:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  id v6 = [v4 query];

  uint64_t v7 = [v5 parametersFromQueryString:v6];

  uint64_t v8 = [v7 objectForKey:@"oauth_token"];
  long long v18 = [v7 objectForKey:@"oauth_verifier"];
  id v9 = [v7 objectForKey:@"sandbox_lnb"];
  -[ENOAuthAuthenticator setUserSelectedLinkedAppNotebook:](self, "setUserSelectedLinkedAppNotebook:", [v9 BOOLValue]);

  id v10 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v18, @"oauth_verifier", 0);
  v11 = [(ENOAuthAuthenticator *)self host];
  v12 = [(ENOAuthAuthenticator *)self consumerKey];
  v13 = [(ENOAuthAuthenticator *)self consumerSecret];
  v14 = [(ENOAuthAuthenticator *)self tokenSecret];
  BOOL v15 = +[ENGCOAuth URLRequestForPath:@"/oauth" GETParameters:v10 scheme:@"https" host:v11 consumerKey:v12 consumerSecret:v13 accessToken:v8 tokenSecret:v14];

  v16 = [MEMORY[0x263EFC640] sharedSession];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __44__ENOAuthAuthenticator_getOAuthTokenForURL___block_invoke;
  v19[3] = &unk_264E58688;
  v19[4] = self;
  v17 = [v16 dataTaskWithRequest:v15 completionHandler:v19];

  [v17 resume];
}

void __44__ENOAuthAuthenticator_getOAuthTokenForURL___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8) {
    [*(id *)(a1 + 32) failedWithError:v8];
  }
  if (v7) {
    [*(id *)(a1 + 32) receivedResponse:v7];
  }
  if (v9) {
    [*(id *)(a1 + 32) receivedData:v9];
  }
  [*(id *)(a1 + 32) didFinishLoading];
}

- (void)gotCallbackURL:(id)a3
{
  uint64_t v4 = [NSURL URLWithString:a3];
  id v6 = (id)v4;
  if (v4)
  {
    [(ENOAuthAuthenticator *)self getOAuthTokenForURL:v4];
  }
  else
  {
    v5 = [MEMORY[0x263F087E8] errorWithDomain:@"ENErrorDomain" code:11 userInfo:0];
    [(ENOAuthAuthenticator *)self completeAuthenticationWithError:v5];
  }
}

- (BOOL)canHandleSwitchProfileURL:(id)a3
{
  id v4 = a3;
  v5 = [v4 path];
  id v6 = [v5 componentsSeparatedByString:@"/"];
  unint64_t v7 = [v6 count];
  if (v7 <= 1)
  {
    NSLog(&cfstr_UrlHasInvalidC.isa, v4, [v6 count]);
  }
  else
  {
    id v8 = [v6 objectAtIndexedSubscript:1];
    [(ENOAuthAuthenticator *)self updateCurrentBootstrapProfileWithName:v8];
  }
  return v7 > 1;
}

- (void)disableIsActiveBecauseOfCallback
{
}

- (void)enableIsActiveBecauseOfCallback
{
  [(ENOAuthAuthenticator *)self setIsActiveBecauseOfCallback:1];
  [(ENOAuthAuthenticator *)self performSelector:sel_disableIsActiveBecauseOfCallback withObject:0 afterDelay:2.0];
}

- (BOOL)handleOpenURL:(id)a3
{
  id v4 = a3;
  v5 = [v4 host];
  int v6 = [v5 isEqualToString:@"invalidURL"];

  if (!v6)
  {
    [(ENOAuthAuthenticator *)self setState:2];
    id v8 = NSString;
    id v9 = [(ENOAuthAuthenticator *)self consumerKey];
    id v10 = [v8 stringWithFormat:@"en-%@", v9];

    v11 = [v4 scheme];
    if ([v10 isEqualToString:v11])
    {
      v12 = [v4 host];
      int v13 = [@"oauth" isEqualToString:v12];

      if (v13)
      {
        v14 = NSString;
        BOOL v15 = [(ENOAuthAuthenticator *)self consumerKey];
        v16 = [v14 stringWithFormat:@"en-%@://oauth/", v15];

        v17 = [v4 absoluteString];
        long long v18 = [v17 stringByReplacingOccurrencesOfString:v16 withString:&stru_26F008428];

        [(ENOAuthAuthenticator *)self gotCallbackURL:v18];
LABEL_10:
        BOOL v7 = 1;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
    }
    long long v19 = [v4 scheme];
    if ([v10 isEqualToString:v19])
    {
      long long v20 = [v4 host];
      int v21 = [@"loginCancelled" isEqualToString:v20];

      if (v21)
      {
        [(ENOAuthAuthenticator *)self gotCallbackURL:0];
        goto LABEL_10;
      }
    }
    else
    {
    }
    v22 = [v4 scheme];
    if ([v10 isEqualToString:v22])
    {
      uint64_t v23 = [v4 host];
      int v24 = [@"incorrectProfile" isEqualToString:v23];

      if (v24)
      {
        [(ENOAuthAuthenticator *)self enableIsActiveBecauseOfCallback];
        BOOL v7 = [(ENOAuthAuthenticator *)self canHandleSwitchProfileURL:v4];
        goto LABEL_17;
      }
    }
    else
    {
    }
    BOOL v7 = 0;
    goto LABEL_17;
  }
  NSLog(&cfstr_InvalidUrlSent.isa);
  BOOL v7 = 0;
LABEL_18:

  return v7;
}

- (void)updateCurrentBootstrapProfileWithName:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = [(ENOAuthAuthenticator *)self profiles];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = [v10 name];
        int v12 = [v4 isEqualToString:v11];

        if (v12)
        {
          int v13 = [v10 name];
          [(ENOAuthAuthenticator *)self setCurrentProfile:v13];

          v14 = [v10 settings];
          BOOL v15 = [v14 serviceHost];
          [(ENOAuthAuthenticator *)self setHost:v15];

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [(ENOAuthAuthenticator *)self startOauthAuthentication];
}

- (void)switchProfile
{
  id v3 = [(ENOAuthAuthenticator *)self profiles];
  uint64_t v4 = [v3 count];

  unint64_t v5 = 0;
  if (v4)
  {
    do
    {
      uint64_t v6 = [(ENOAuthAuthenticator *)self profiles];
      uint64_t v7 = [v6 objectAtIndex:v5];

      uint64_t v8 = [(ENOAuthAuthenticator *)self currentProfile];
      id v9 = [v7 name];
      char v10 = [v8 isEqualToString:v9];

      if (v10) {
        break;
      }
      ++v5;
      v11 = [(ENOAuthAuthenticator *)self profiles];
      unint64_t v12 = [v11 count];
    }
    while (v5 < v12);
  }
  int v13 = [(ENOAuthAuthenticator *)self profiles];
  unint64_t v14 = v5 + 1;
  BOOL v15 = [(ENOAuthAuthenticator *)self profiles];
  objc_msgSend(v13, "objectAtIndex:", v14 % objc_msgSend(v15, "count"));
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  long long v16 = [v17 name];
  [(ENOAuthAuthenticator *)self updateCurrentBootstrapProfileWithName:v16];
}

- (void)completeAuthenticationWithError:(id)a3
{
  id v5 = a3;
  if (![(ENOAuthAuthenticator *)self isCancelled])
  {
    [(ENOAuthAuthenticator *)self setState:0];
    uint64_t v4 = [(ENOAuthAuthenticator *)self delegate];
    [v4 authenticatorDidFailWithError:v5];
  }
}

- (void)completeAuthenticationWithCredentials:(id)a3 usesLinkedAppNotebook:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  if (![(ENOAuthAuthenticator *)self isCancelled])
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v7 = v6;
    if (v4) {
      [v6 setObject:MEMORY[0x263EFFA88] forKey:@"ENOAuthAuthenticatorAuthInfoAppNotebookIsLinked"];
    }
    uint64_t v8 = [(ENOAuthAuthenticator *)self delegate];
    [v8 authenticatorDidAuthenticateWithCredentials:v9 authInfo:v7];
  }
}

- (void)didFinishLoading
{
  v32[1] = *MEMORY[0x263EF8340];
  if (![(ENOAuthAuthenticator *)self isCancelled])
  {
    id v3 = [NSString alloc];
    BOOL v4 = [(ENOAuthAuthenticator *)self receivedData];
    id v5 = (void *)[v3 initWithData:v4 encoding:4];

    id v6 = [(ENOAuthAuthenticator *)self response];
    char v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0
      && ([(ENOAuthAuthenticator *)self response],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          id v9 = (void *)[v8 statusCode],
          v8,
          v9 != (void *)200))
    {
      NSLog(&cfstr_ReceivedErrorH.isa, v9);
      NSLog(&stru_26F00EA68.isa, v5);
      if (v9)
      {
        v28 = [NSNumber numberWithInteger:v9];
        v31 = @"statusCode";
        v32[0] = v28;
        id v9 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
      }
      unint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:@"ENErrorDomain" code:1 userInfo:v9];
      [(ENOAuthAuthenticator *)self completeAuthenticationWithError:v12];
    }
    else
    {
      id v9 = [(id)objc_opt_class() parametersFromQueryString:v5];
      char v10 = [v9 objectForKey:@"oauth_callback_confirmed"];

      if (v10)
      {
        v11 = [v9 objectForKey:@"oauth_token_secret"];
        [(ENOAuthAuthenticator *)self setTokenSecret:v11];

        unint64_t v12 = [(ENOAuthAuthenticator *)self userAuthorizationURLStringWithParameters:v9];
        int v13 = [NSURL URLWithString:v12];
        unint64_t v14 = [(ENOAuthAuthenticator *)self delegate];
        BOOL v15 = [(ENOAuthAuthenticator *)self oauthCallback];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __40__ENOAuthAuthenticator_didFinishLoading__block_invoke;
        v30[3] = &unk_264E55DC8;
        v30[4] = self;
        [v14 authenticatorShouldShowAuthorizationUIWithURL:v13 callbackPrefix:v15 completionBlock:v30];
      }
      else
      {
        unint64_t v12 = [v9 objectForKey:@"oauth_token"];
        int v13 = [v9 objectForKey:@"edam_noteStoreUrl"];
        unint64_t v14 = [v9 objectForKey:@"edam_userId"];
        BOOL v15 = [v9 objectForKey:@"edam_webApiUrlPrefix"];
        long long v16 = [v9 objectForKey:@"edam_expires"];
        id v17 = (void *)MEMORY[0x263EFF910];
        [v16 doubleValue];
        long long v19 = [v17 dateWithTimeIntervalSince1970:v18 / 1000.0];
        if (v12 && v13 && v14 && v15)
        {
          long long v20 = [ENCredentials alloc];
          [(ENOAuthAuthenticator *)self host];
          v29 = v16;
          uint64_t v21 = v15;
          v22 = v19;
          uint64_t v23 = v14;
          int v24 = v13;
          v26 = v25 = v12;
          v27 = [(ENCredentials *)v20 initWithHost:v26 edamUserId:v23 noteStoreUrl:v24 webApiUrlPrefix:v21 authenticationToken:v25 expirationDate:v22];

          unint64_t v12 = v25;
          int v13 = v24;
          unint64_t v14 = v23;
          long long v19 = v22;
          BOOL v15 = v21;
          long long v16 = v29;
          [(ENOAuthAuthenticator *)self completeAuthenticationWithCredentials:v27 usesLinkedAppNotebook:[(ENOAuthAuthenticator *)self userSelectedLinkedAppNotebook]];
          [(ENOAuthAuthenticator *)self setState:3];
        }
        else
        {
          v27 = [MEMORY[0x263F087E8] errorWithDomain:@"ENErrorDomain" code:0 userInfo:0];
          [(ENOAuthAuthenticator *)self completeAuthenticationWithError:v27];
        }
      }
    }

    [(ENOAuthAuthenticator *)self setReceivedData:0];
    [(ENOAuthAuthenticator *)self setResponse:0];
  }
}

uint64_t __40__ENOAuthAuthenticator_didFinishLoading__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) getOAuthTokenForURL:a2];
}

- (void)receivedData:(id)a3
{
  id v4 = a3;
  id v5 = [(ENOAuthAuthenticator *)self receivedData];
  [v5 appendData:v4];
}

- (void)receivedResponse:(id)a3
{
  [(ENOAuthAuthenticator *)self setResponse:a3];
  id v4 = [MEMORY[0x263EFF990] data];
  [(ENOAuthAuthenticator *)self setReceivedData:v4];
}

- (void)failedWithError:(id)a3
{
  id v4 = a3;
  if (![(ENOAuthAuthenticator *)self isCancelled])
  {
    [(ENOAuthAuthenticator *)self setReceivedData:0];
    [(ENOAuthAuthenticator *)self setResponse:0];
    [(ENOAuthAuthenticator *)self completeAuthenticationWithError:v4];
  }
}

- (void)handleDidBecomeActive
{
  unint64_t v3 = [(ENOAuthAuthenticator *)self state];
  BOOL v4 = v3 > 3 || v3 == 1;
  if (v4 && ![(ENOAuthAuthenticator *)self isActiveBecauseOfCallback])
  {
    [(ENOAuthAuthenticator *)self gotCallbackURL:0];
    [(ENOAuthAuthenticator *)self setState:0];
  }
}

- (id)userAuthorizationURLStringWithParameters:(id)a3
{
  v18[4] = *MEMORY[0x263EF8340];
  BOOL v4 = NSString;
  id v5 = a3;
  id v6 = [v4 string];
  char v7 = [(id)objc_opt_class() deviceDescription];
  uint64_t v8 = (void *)MEMORY[0x263EFF9A0];
  v17[0] = @"oauth_token";
  id v9 = objc_msgSend(v5, "objectForKey:");

  v18[0] = v9;
  v18[1] = @"ios";
  v17[1] = @"inapp";
  v17[2] = @"deviceDescription";
  v17[3] = @"deviceIdentifier";
  v18[2] = v7;
  v18[3] = v6;
  char v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  v11 = [v8 dictionaryWithDictionary:v10];

  if ([(ENOAuthAuthenticator *)self supportsLinkedAppNotebook]) {
    [v11 setObject:@"true" forKey:@"supportLinkedSandbox"];
  }
  if ([(ENOAuthAuthenticator *)self preferRegistration]) {
    [v11 setObject:@"true" forKey:@"preferRegistration"];
  }
  unint64_t v12 = [(id)objc_opt_class() queryStringFromParameters:v11];
  int v13 = NSString;
  unint64_t v14 = [(ENOAuthAuthenticator *)self host];
  BOOL v15 = [v13 stringWithFormat:@"%@://%@/OAuth.action?%@", @"https", v14, v12];

  return v15;
}

- (id)oauthCallback
{
  v2 = NSString;
  unint64_t v3 = [(ENOAuthAuthenticator *)self callbackScheme];
  BOOL v4 = [v2 stringWithFormat:@"%@://response", v3];

  return v4;
}

- (id)callbackScheme
{
  v2 = NSString;
  unint64_t v3 = [(ENOAuthAuthenticator *)self consumerKey];
  BOOL v4 = [v3 stringByReplacingOccurrencesOfString:@"_" withString:@"+"];
  id v5 = [v2 stringWithFormat:@"en-%@", v4];

  return v5;
}

- (void)startOauthAuthentication
{
  if (![(ENOAuthAuthenticator *)self isCancelled])
  {
    unint64_t v3 = NSDictionary;
    BOOL v4 = [(ENOAuthAuthenticator *)self oauthCallback];
    id v5 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, @"oauth_callback", 0);
    id v6 = [(ENOAuthAuthenticator *)self host];
    char v7 = [(ENOAuthAuthenticator *)self consumerKey];
    uint64_t v8 = [(ENOAuthAuthenticator *)self consumerSecret];
    id v9 = +[ENGCOAuth URLRequestForPath:@"/oauth" GETParameters:v5 scheme:@"https" host:v6 consumerKey:v7 consumerSecret:v8 accessToken:0 tokenSecret:0];

    char v10 = [MEMORY[0x263EFC640] sharedSession];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __48__ENOAuthAuthenticator_startOauthAuthentication__block_invoke;
    v12[3] = &unk_264E58688;
    v12[4] = self;
    v11 = [v10 dataTaskWithRequest:v9 completionHandler:v12];

    [v11 resume];
  }
}

void __48__ENOAuthAuthenticator_startOauthAuthentication__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8) {
    [*(id *)(a1 + 32) failedWithError:v8];
  }
  if (v7) {
    [*(id *)(a1 + 32) receivedResponse:v7];
  }
  if (v9) {
    [*(id *)(a1 + 32) receivedData:v9];
  }
  [*(id *)(a1 + 32) didFinishLoading];
}

- (void)authenticate
{
  if ([(ENOAuthAuthenticator *)self inProgress])
  {
    unint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"ENOAuthAuthenticator.m" lineNumber:84 description:@"Authenticator is a single-use-only object!"];
  }
  BOOL v4 = [(ENOAuthAuthenticator *)self delegate];

  if (!v4)
  {
    int v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"ENOAuthAuthenticator.m" lineNumber:85 description:@"Must set authenticator delegate"];
  }
  if ([(ENOAuthAuthenticator *)self inProgress])
  {
    id v14 = +[ENSession sharedSession];
    id v5 = [v14 logger];
    id v6 = [NSString stringWithFormat:@"Cannot reuse single instance of %@", objc_opt_class()];
    [v5 evernoteLogErrorString:v6];
  }
  else
  {
    [(ENOAuthAuthenticator *)self setInProgress:1];
    [(ENOAuthAuthenticator *)self emptyCookieJar];
    id v7 = objc_alloc_init(ENCredentialStore);
    [(ENOAuthAuthenticator *)self setCredentialStore:v7];

    id v8 = [MEMORY[0x263EFF960] currentLocale];
    id v9 = [v8 localeIdentifier];

    char v10 = [(ENOAuthAuthenticator *)self delegate];
    v11 = [v10 userStoreClientForBootstrapping];

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __36__ENOAuthAuthenticator_authenticate__block_invoke;
    v15[3] = &unk_264E55DA0;
    v15[4] = self;
    [v11 fetchBootstrapInfoWithLocale:v9 completion:v15];
  }
}

void __36__ENOAuthAuthenticator_authenticate__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v12 = v5;
  if (a3)
  {
    [*(id *)(a1 + 32) startOauthAuthentication];
  }
  else
  {
    id v6 = [v5 profiles];
    id v7 = [v6 objectAtIndex:0];

    id v8 = [v12 profiles];
    [*(id *)(a1 + 32) setProfiles:v8];

    id v9 = [v7 name];
    [*(id *)(a1 + 32) setCurrentProfile:v9];

    char v10 = [v7 settings];
    v11 = [v10 serviceHost];
    [*(id *)(a1 + 32) setHost:v11];

    [*(id *)(a1 + 32) startOauthAuthentication];
  }
}

- (void)emptyCookieJar
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(ENOAuthAuthenticator *)self host];

  if (v3)
  {
    BOOL v4 = [MEMORY[0x263EFC5D8] sharedHTTPCookieStorage];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = objc_msgSend(v4, "cookies", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          char v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v11 = [v10 domain];
          id v12 = [(ENOAuthAuthenticator *)self host];
          int v13 = [v11 hasSuffix:v12];

          if (v13) {
            [v4 deleteCookie:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

@end