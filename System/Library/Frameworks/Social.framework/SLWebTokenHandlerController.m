@interface SLWebTokenHandlerController
+ (id)emailAddressFromIdToken:(id)a3;
- (SLWebClient)webClient;
- (SLWebTokenHandlerController)initWithWebClient:(id)a3;
- (void)_exchangeAuthCode:(id)a3 usingRedirect:(id)a4 codeVerifier:(id)a5 forTokensWithCompletion:(id)a6;
- (void)_fetchNamesForAuthResponse:(id)a3 completion:(id)a4;
- (void)_fetchNamesForToken:(id)a3 usingFallbackURL:(id)a4 completion:(id)a5;
- (void)exchangeAuthCode:(id)a3 usingRedirect:(id)a4 codeVerifier:(id)a5 forAccountResponse:(id)a6;
- (void)exchangeAuthCode:(id)a3 usingRedirect:(id)a4 codeVerifier:(id)a5 forTokensAndUsernameWithCompletion:(id)a6;
@end

@implementation SLWebTokenHandlerController

- (SLWebTokenHandlerController)initWithWebClient:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SLWebTokenHandlerController;
  v6 = [(SLWebTokenHandlerController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webClient, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.social.exchangeAuthTokenQueue", v8);
    webClientQueue = v7->_webClientQueue;
    v7->_webClientQueue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (void)exchangeAuthCode:(id)a3 usingRedirect:(id)a4 codeVerifier:(id)a5 forTokensAndUsernameWithCompletion:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __110__SLWebTokenHandlerController_exchangeAuthCode_usingRedirect_codeVerifier_forTokensAndUsernameWithCompletion___block_invoke;
  v12[3] = &unk_1E64672D0;
  id v13 = v10;
  id v11 = v10;
  [(SLWebTokenHandlerController *)self exchangeAuthCode:a3 usingRedirect:a4 codeVerifier:a5 forAccountResponse:v12];
}

void __110__SLWebTokenHandlerController_exchangeAuthCode_usingRedirect_codeVerifier_forTokensAndUsernameWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v12 = [v6 token];
  v7 = [v6 refreshToken];
  v8 = [v6 idToken];
  dispatch_queue_t v9 = [v6 expiryDate];
  id v10 = [v6 usernames];
  id v11 = [v6 displayName];

  (*(void (**)(uint64_t, id, void *, void *, void *, void *, void *, id))(v4 + 16))(v4, v12, v7, v8, v9, v10, v11, v5);
}

- (void)exchangeAuthCode:(id)a3 usingRedirect:(id)a4 codeVerifier:(id)a5 forAccountResponse:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__SLWebTokenHandlerController_exchangeAuthCode_usingRedirect_codeVerifier_forAccountResponse___block_invoke;
  v12[3] = &unk_1E6467320;
  void v12[4] = self;
  id v13 = v10;
  id v11 = v10;
  [(SLWebTokenHandlerController *)self _exchangeAuthCode:a3 usingRedirect:a4 codeVerifier:a5 forTokensWithCompletion:v12];
}

void __94__SLWebTokenHandlerController_exchangeAuthCode_usingRedirect_codeVerifier_forAccountResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __94__SLWebTokenHandlerController_exchangeAuthCode_usingRedirect_codeVerifier_forAccountResponse___block_invoke_2;
    v5[3] = &unk_1E64672F8;
    uint64_t v4 = *(void **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    [v4 _fetchNamesForAuthResponse:v6 completion:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __94__SLWebTokenHandlerController_exchangeAuthCode_usingRedirect_codeVerifier_forAccountResponse___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  uint64_t v8 = *(void *)(a1 + 40);
  if (v12)
  {
    id v9 = a4;
    id v10 = [[SLWebTokenHandlerResponse alloc] initWithTokenResponse:*(void *)(a1 + 32) usernames:v12 displayname:v7];
    (*(void (**)(uint64_t, SLWebTokenHandlerResponse *, id))(v8 + 16))(v8, v10, v9);
  }
  else
  {
    id v11 = *(void (**)(uint64_t, void, SLWebTokenHandlerResponse *))(v8 + 16);
    id v10 = a4;
    v11(v8, 0, v10);
  }
}

- (void)_exchangeAuthCode:(id)a3 usingRedirect:(id)a4 codeVerifier:(id)a5 forTokensWithCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  webClientQueue = self->_webClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__SLWebTokenHandlerController__exchangeAuthCode_usingRedirect_codeVerifier_forTokensWithCompletion___block_invoke;
  block[3] = &unk_1E6467370;
  block[4] = self;
  id v20 = v11;
  id v21 = v10;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  dispatch_async(webClientQueue, block);
}

void __100__SLWebTokenHandlerController__exchangeAuthCode_usingRedirect_codeVerifier_forTokensWithCompletion___block_invoke(uint64_t a1)
{
  id v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) tokenRequestClass];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) clientID];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 16) clientSecret];
  id v6 = *(void **)(a1 + 40);
  id v7 = v6;
  if (!v6)
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 16) clientRedirect];
  }
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [*(id *)(*(void *)(a1 + 32) + 16) tokenURL];
  id v10 = [v3 urlRequestForClientID:v4 secret:v5 redirectURI:v7 authCode:v8 tokenURL:v9 codeVerifier:*(void *)(a1 + 56)];

  if (!v6) {
  _SLLog(v1, 7, @"Sending SLWebOAuth2TokenRequest");
  }
  id v11 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
  id v12 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v11];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __100__SLWebTokenHandlerController__exchangeAuthCode_usingRedirect_codeVerifier_forTokensWithCompletion___block_invoke_2;
  id v17 = &unk_1E6467348;
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(id *)(a1 + 64);
  id v13 = [v12 dataTaskWithRequest:v10 completionHandler:&v14];
  objc_msgSend(v13, "resume", v14, v15, v16, v17, v18);
}

void __100__SLWebTokenHandlerController__exchangeAuthCode_usingRedirect_codeVerifier_forTokensWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = *(void **)(*(void *)(a1 + 32) + 16);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v11 = objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "tokenResponseClass")), "initWithData:urlResponse:error:", v10, v9, v8);

  id v12 = [v11 error];

  if (v12)
  {
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = [v11 error];
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);
LABEL_8:

    goto LABEL_9;
  }
  if ([v11 statusCode] != 200
    || ([v11 token], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0)
    || (id v16 = (void *)v15,
        [v11 refreshToken],
        id v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        !v17))
  {
    uint64_t v18 = NSString;
    id v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "statusCode"));
    id v20 = [v11 errorMessage];
    uint64_t v14 = [v18 stringWithFormat:@"Server failed to exchange auth code for tokens, with status code %@ and error message %@", v19, v20];

    id v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F178F0];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26[0] = v14;
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    v24 = [v21 errorWithDomain:v22 code:1 userInfo:v23];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_8;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_9:
}

+ (id)emailAddressFromIdToken:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 componentsSeparatedByString:@"."];
    if ([v6 count] == 3)
    {
      id v7 = [v6 objectAtIndexedSubscript:1];
      id v8 = objc_msgSend(v7, "stringByPaddingToLength:withString:startingAtIndex:", (objc_msgSend(v7, "length") & 3) + objc_msgSend(v7, "length"), @"=", 0);

      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
      if (v9)
      {
        id v15 = 0;
        id v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v9 options:0 error:&v15];
        id v11 = v15;
        id v12 = v11;
        if (!v10 || v11)
        {
          _SLLog(v3, 3, @"error decoding id token: %@");
          uint64_t v13 = 0;
        }
        else
        {
          uint64_t v13 = [v10 objectForKeyedSubscript:@"email"];
        }
      }
      else
      {
        _SLLog(v3, 3, @"error decoding base64 data ,got back nil: %{private}@");
        uint64_t v13 = 0;
      }
    }
    else
    {
      [v6 count];
      _SLLog(v3, 3, @"id token has unexpected number of components: %d");
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)_fetchNamesForAuthResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  webClientQueue = self->_webClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__SLWebTokenHandlerController__fetchNamesForAuthResponse_completion___block_invoke;
  block[3] = &unk_1E64673C0;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(webClientQueue, block);
}

void __69__SLWebTokenHandlerController__fetchNamesForAuthResponse_completion___block_invoke(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F290D0];
  id v4 = [*(id *)(a1 + 32) token];
  id v5 = [*(id *)(*(void *)(a1 + 40) + 16) userInfoURL];
  id v6 = objc_msgSend(v3, "sl_urlRequestWithToken:forURLString:", v4, v5);

  id v11 = [*(id *)(*(void *)(a1 + 40) + 16) userInfoURL];
  _SLLog(v1, 7, @"Sending SLWebUserInfoRequest to %@");

  id v7 = objc_msgSend(MEMORY[0x1E4F290F0], "ephemeralSessionConfiguration", v11);
  id v8 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__SLWebTokenHandlerController__fetchNamesForAuthResponse_completion___block_invoke_2;
  v12[3] = &unk_1E6467398;
  id v9 = *(void **)(a1 + 48);
  void v12[4] = *(void *)(a1 + 40);
  id v14 = v9;
  id v13 = *(id *)(a1 + 32);
  id v10 = [v8 dataTaskWithRequest:v6 completionHandler:v12];
  [v10 resume];
}

void __69__SLWebTokenHandlerController__fetchNamesForAuthResponse_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v8 = *(void **)(*(void *)(a1 + 32) + 16);
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  id v12 = objc_msgSend(objc_alloc((Class)objc_msgSend(v8, "webUserInfoResponseClass")), "initWithData:urlResponse:error:", v11, v10, v9);

  id v13 = [v12 error];

  if (!v13)
  {
    if ([v12 statusCode] != 200) {
      goto LABEL_7;
    }
    uint64_t v16 = [v12 emailAddresses];
    if (!v16) {
      goto LABEL_7;
    }
    id v17 = (void *)v16;
    uint64_t v18 = [v12 emailAddresses];
    uint64_t v19 = [v18 count];

    if (v19)
    {
      uint64_t v20 = *(void *)(a1 + 48);
      id v15 = [v12 emailAddresses];
      id v21 = [v12 displayName];
      (*(void (**)(uint64_t, void *, void *, void))(v20 + 16))(v20, v15, v21, 0);
    }
    else
    {
LABEL_7:
      _SLLog(v4, 3, @"Problem occurred with user info request. Extracting email address from id token.");
      uint64_t v22 = [*(id *)(a1 + 40) idToken];
      id v15 = +[SLWebTokenHandlerController emailAddressFromIdToken:v22];

      if (v15)
      {
        uint64_t v23 = *(void *)(a1 + 48);
        v36[0] = v15;
        id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
        v24 = [v12 displayName];
        (*(void (**)(uint64_t, void *, void *, void))(v23 + 16))(v23, v21, v24, 0);
      }
      else
      {
        _SLLog(v4, 3, @"Could not extract email address from id token.");
        id v21 = [*(id *)(*(void *)(a1 + 32) + 16) fallbackUserInfoURL];
        if (v21)
        {
          _SLLog(v4, 3, @"Trying fallbackUserInfoURL.");
          uint64_t v25 = *(void **)(a1 + 32);
          v26 = [*(id *)(a1 + 40) token];
          [v25 _fetchNamesForToken:v26 usingFallbackURL:v21 completion:*(void *)(a1 + 48)];

          goto LABEL_12;
        }
        _SLLog(v4, 3, @"No fallbackUserInfoURL. Fetch names failed.");
        v27 = NSString;
        v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "statusCode"));
        v29 = [v12 errorMessage];
        v24 = [v27 stringWithFormat:@"Server failed to return user info emailAddresses, with status code %@ and error message %@", v28, v29];

        v30 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v31 = *MEMORY[0x1E4F178F0];
        uint64_t v34 = *MEMORY[0x1E4F28568];
        v35 = v24;
        v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        v33 = [v30 errorWithDomain:v31 code:1 userInfo:v32];

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v14 = *(void *)(a1 + 48);
  id v15 = [v12 error];
  (*(void (**)(uint64_t, void, void, void *))(v14 + 16))(v14, 0, 0, v15);
LABEL_13:
}

- (void)_fetchNamesForToken:(id)a3 usingFallbackURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  webClientQueue = self->_webClientQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__SLWebTokenHandlerController__fetchNamesForToken_usingFallbackURL_completion___block_invoke;
  v15[3] = &unk_1E64673E8;
  id v16 = v8;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(webClientQueue, v15);
}

void __79__SLWebTokenHandlerController__fetchNamesForToken_usingFallbackURL_completion___block_invoke(void *a1)
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F290D0], "sl_urlRequestWithToken:forURLString:", a1[4], a1[5]);
  _SLLog(v1, 7, @"Fallback: Sending SLWebUserInfoRequest");
  uint64_t v4 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
  id v5 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v4];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __79__SLWebTokenHandlerController__fetchNamesForToken_usingFallbackURL_completion___block_invoke_2;
  id v11 = &unk_1E6467348;
  id v6 = (void *)a1[7];
  uint64_t v12 = a1[6];
  id v13 = v6;
  id v7 = [v5 dataTaskWithRequest:v3 completionHandler:&v8];
  objc_msgSend(v7, "resume", v8, v9, v10, v11, v12);
}

void __79__SLWebTokenHandlerController__fetchNamesForToken_usingFallbackURL_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 16);
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  uint64_t v12 = objc_msgSend(objc_alloc((Class)objc_msgSend(v8, "fallbackWebUserInfoResponseClass")), "initWithData:urlResponse:error:", v11, v10, v9);

  id v13 = [v12 error];

  if (v13)
  {
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = [v12 error];
    (*(void (**)(uint64_t, void, void, void *))(v14 + 16))(v14, 0, 0, v15);
  }
  else
  {
    if ([v12 statusCode] != 200) {
      goto LABEL_7;
    }
    uint64_t v16 = [v12 emailAddresses];
    if (!v16) {
      goto LABEL_7;
    }
    id v17 = (void *)v16;
    uint64_t v18 = [v12 emailAddresses];
    uint64_t v19 = [v18 count];

    if (v19)
    {
      uint64_t v20 = *(void *)(a1 + 40);
      id v15 = [v12 emailAddresses];
      id v21 = [v12 displayName];
      (*(void (**)(uint64_t, void *, void *, void))(v20 + 16))(v20, v15, v21, 0);
    }
    else
    {
LABEL_7:
      _SLLog(v4, 3, @"Fallback: Problem occurred with user info request. Fetch names failed.");
      uint64_t v22 = NSString;
      uint64_t v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "statusCode"));
      v24 = [v12 errorMessage];
      id v15 = [v22 stringWithFormat:@"Server failed to return user info emailAddresses, with status code %@ and error message %@", v23, v24];

      uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F178F0];
      uint64_t v28 = *MEMORY[0x1E4F28568];
      v29[0] = v15;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      id v21 = [v25 errorWithDomain:v26 code:1 userInfo:v27];

      (*(void (**)(void, void, void, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, v21);
    }
  }
}

- (SLWebClient)webClient
{
  return (SLWebClient *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webClient, 0);

  objc_storeStrong((id *)&self->_webClientQueue, 0);
}

@end