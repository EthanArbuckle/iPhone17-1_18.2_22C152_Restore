@interface DAEASOAuthFlowController
+ (id)upgradeAuthorizationEndpoint:(id)a3;
+ (id)upgradeTokenEndpoint:(id)a3;
- (BOOL)isOnPrem;
- (BOOL)shouldHideWebViewForLoadWithRequest:(id)a3;
- (DAEASOAuthFlowController)initWithOAuthType:(unint64_t)a3 authURI:(id)a4 username:(id)a5 accountId:(id)a6 claims:(id)a7 isOnPrem:(BOOL)a8;
- (DAEASOAuthPKCEChallenge)challenge;
- (NSData)jwksData;
- (NSString)accountId;
- (NSString)claimsChallenge;
- (NSString)clientID;
- (NSString)easEndPoint;
- (NSString)issuer;
- (NSString)jwksURI;
- (NSString)oauthURI;
- (NSString)redirectURI;
- (NSString)state;
- (NSString)tokenRequestURI;
- (NSString)username;
- (id)_accountDescription;
- (id)_urlRequestForOAuthTokenFromAuthCode:(id)a3 codeVerifier:(id)a4 claims:(id)a5;
- (id)authURLForUsername:(id)a3;
- (id)authURLForUsername:(id)a3 originalAuthURL:(id)a4;
- (id)initialRedirectURL;
- (id)onPremAuthURLForUsername:(id)a3 originalAuthURL:(id)a4 resource:(id)a5;
- (id)requestForAuthURL:(id)a3;
- (unint64_t)oauthType;
- (void)_assignConnectionPropertiesToSessionConfiguration:(id)a3;
- (void)_exchangeAuthCode:(id)a3 codeVerifier:(id)a4 claims:(id)a5 forTokensAndUsernameWithCompletion:(id)a6;
- (void)_exchangeAuthCode:(id)a3 codeVerifier:(id)a4 claims:(id)a5 forTokensWithCompletion:(id)a6;
- (void)exchangeAuthCode:(id)a3 codeVerifier:(id)a4 claims:(id)a5 forTokensAndUsernameWithCompletion:(id)a6;
- (void)retrieveJWKSDataFromURI:(id)a3 withCompletion:(id)a4;
- (void)retrieveOpenIDMetadataFromURI:(id)a3 withCompletion:(id)a4;
- (void)setAccountId:(id)a3;
- (void)setAuthFlowCompletion:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setClaimsChallenge:(id)a3;
- (void)setClientID:(id)a3;
- (void)setEasEndPoint:(id)a3;
- (void)setIsOnPrem:(BOOL)a3;
- (void)setIssuer:(id)a3;
- (void)setJwksData:(id)a3;
- (void)setJwksURI:(id)a3;
- (void)setOauthType:(unint64_t)a3;
- (void)setOauthURI:(id)a3;
- (void)setRedirectURI:(id)a3;
- (void)setState:(id)a3;
- (void)setTokenRequestURI:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation DAEASOAuthFlowController

- (DAEASOAuthFlowController)initWithOAuthType:(unint64_t)a3 authURI:(id)a4 username:(id)a5 accountId:(id)a6 claims:(id)a7 isOnPrem:(BOOL)a8
{
  v14 = (__CFString *)a4;
  id v30 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v14) {
    v17 = v14;
  }
  else {
    v17 = @"https://login.microsoftonline.com/consumers/oauth2/v2.0/authorize/";
  }
  if (!a8)
  {
    uint64_t v18 = +[DAEASOAuthFlowController upgradeAuthorizationEndpoint:v17];

    v17 = (__CFString *)v18;
  }
  v31.receiver = self;
  v31.super_class = (Class)DAEASOAuthFlowController;
  v19 = [(DAEASOAuthFlowController *)&v31 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_accountId, a6);
    v20->_oauthType = a3;
    objc_storeStrong((id *)&v20->_oauthURI, v17);
    objc_storeStrong((id *)&v20->_username, a5);
    tokenRequestURI = v20->_tokenRequestURI;
    v20->_tokenRequestURI = (NSString *)@"https://login.microsoftonline.com/consumers/oauth2/v2.0/token";

    uint64_t v22 = +[DAEASOAuthClient clientIDForOAuthType:[(DAEASOAuthFlowController *)v20 oauthType]];
    clientID = v20->_clientID;
    v20->_clientID = (NSString *)v22;

    id v24 = objc_alloc_init(MEMORY[0x263F08C38]);
    uint64_t v25 = [v24 UUIDString];
    state = v20->_state;
    v20->_state = (NSString *)v25;

    v27 = [[DAEASOAuthPKCEChallenge alloc] initWithCodeChallengeMethod:1];
    challenge = v20->_challenge;
    v20->_challenge = v27;

    objc_storeStrong((id *)&v20->_claimsChallenge, a7);
    v20->_isOnPrem = a8;
  }

  return v20;
}

- (id)initialRedirectURL
{
  return 0;
}

- (void)setAuthFlowCompletion:(id)a3
{
  self->_completion = (id)MEMORY[0x230F5DCD0](a3, a2);
  MEMORY[0x270F9A758]();
}

- (id)authURLForUsername:(id)a3
{
  return [(DAEASOAuthFlowController *)self authURLForUsername:a3 originalAuthURL:@"https://login.microsoftonline.com/consumers/oauth2/v2.0/authorize/"];
}

- (id)authURLForUsername:(id)a3 originalAuthURL:(id)a4
{
  id v19 = a4;
  id v18 = a3;
  unint64_t v6 = [(DAEASOAuthFlowController *)self oauthType];
  v7 = [(DAEASOAuthFlowController *)self easEndPoint];
  v8 = +[DAEASOAuthClient defaultScopeForOAuthType:v6 withResourceIdentifier:v7 forToken:0 isOnPrem:[(DAEASOAuthFlowController *)self isOnPrem]];

  v9 = [(DAEASOAuthFlowController *)self clientID];
  v10 = [(DAEASOAuthFlowController *)self redirectURI];
  v11 = v10;
  if (!v10)
  {
    v11 = +[DAEASOAuthClient clientRedirect];
  }
  v12 = [(DAEASOAuthFlowController *)self state];
  v13 = [(DAEASOAuthFlowController *)self challenge];
  v14 = [v13 codeChallenge];
  id v15 = [(DAEASOAuthFlowController *)self challenge];
  id v16 = +[DAEASOAuthRequest urlForOAuthURI:clientID:redirectURI:scope:username:state:codeChallenge:codeChallengeMethod:](DAEASOAuthRequest, "urlForOAuthURI:clientID:redirectURI:scope:username:state:codeChallenge:codeChallengeMethod:", v19, v9, v11, v8, v18, v12, v14, [v15 codeChallengeMethod]);

  if (!v10) {
  return v16;
  }
}

- (id)onPremAuthURLForUsername:(id)a3 originalAuthURL:(id)a4 resource:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(DAEASOAuthFlowController *)self clientID];
  v12 = [(DAEASOAuthFlowController *)self redirectURI];
  v13 = v12;
  if (!v12)
  {
    v13 = +[DAEASOAuthClient clientRedirect];
  }
  v14 = [(DAEASOAuthFlowController *)self state];
  id v15 = [(DAEASOAuthFlowController *)self claimsChallenge];
  id v16 = +[DAEASOAuthRequest urlForOnPremOAuthURI:v9 clientID:v11 redirectURI:v13 username:v10 state:v14 resource:v8 claims:v15];

  if (!v12) {
  return v16;
  }
}

- (id)_accountDescription
{
  return @"Outlook";
}

- (id)requestForAuthURL:(id)a3
{
  v3 = +[DAEASOAuthRequest requestForURL:a3];
  v4 = (void *)[v3 mutableCopy];

  return v4;
}

- (BOOL)shouldHideWebViewForLoadWithRequest:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 URL];
  BOOL v6 = +[DAEASOAuthRequest urlPageWillContainAuthorizationCode:v5];

  if (v6)
  {
    v7 = DALoggingwithCategory();
    uint64_t v8 = MEMORY[0x263F38F90];
    os_log_type_t v9 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
    if (os_log_type_enabled(v7, v9))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C076000, v7, v9, "DAEASOAuthFlowController shouldHideWebViewForLoadWithRequest: waiting for authentication code from page reload URL", buf, 2u);
    }

    id v10 = +[DAEASOAuthRequest authCodeFromRequest:v4];
    v11 = +[DAEASOAuthRequest stateFromRequest:v4];
    uint64_t v12 = +[DAEASOAuthRequest errorDomainFromRequest:v4];
    uint64_t v13 = +[DAEASOAuthRequest errorDescriptionFromRequest:v4];
    if (v12 | v13)
    {
      v14 = DALoggingwithCategory();
      os_log_type_t v15 = *(unsigned char *)(v8 + 3);
      if (os_log_type_enabled(v14, v15))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v33 = v12;
        __int16 v34 = 2112;
        uint64_t v35 = v13;
        _os_log_impl(&dword_22C076000, v14, v15, "Exchange Hotmail OAuth:Failed with error %@, error_description %@", buf, 0x16u);
      }

      id v16 = objc_alloc(MEMORY[0x263F087E8]);
      v17 = (void *)[v16 initWithDomain:*MEMORY[0x263F38F08] code:93 userInfo:0];
      (*((void (**)(void))self->_completion + 2))();
    }
    else
    {
      v28 = v11;
      if (v10
        && ([(DAEASOAuthFlowController *)self state],
            id v18 = objc_claimAutoreleasedReturnValue(),
            int v19 = [v11 isEqualToString:v18],
            v18,
            v19))
      {
        v20 = DALoggingwithCategory();
        if (os_log_type_enabled(v20, v9))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C076000, v20, v9, "Exchange Hotmail OAuth: Found an Auth Code String", buf, 2u);
        }

        v21 = [(DAEASOAuthFlowController *)self challenge];
        uint64_t v22 = [v21 codeVerifier];
        v23 = [(DAEASOAuthFlowController *)self claimsChallenge];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __64__DAEASOAuthFlowController_shouldHideWebViewForLoadWithRequest___block_invoke;
        v29[3] = &unk_26490A910;
        id v30 = v10;
        objc_super v31 = self;
        [(DAEASOAuthFlowController *)self exchangeAuthCode:v30 codeVerifier:v22 claims:v23 forTokensAndUsernameWithCompletion:v29];
      }
      else
      {
        id v24 = DALoggingwithCategory();
        os_log_type_t v25 = *(unsigned char *)(v8 + 3);
        if (os_log_type_enabled(v24, v25))
        {
          v26 = [(DAEASOAuthFlowController *)self state];
          *(_DWORD *)buf = 138412802;
          uint64_t v33 = (uint64_t)v10;
          __int16 v34 = 2112;
          uint64_t v35 = (uint64_t)v28;
          __int16 v36 = 2112;
          v37 = v26;
          _os_log_impl(&dword_22C076000, v24, v25, "Exchange Hotmail OAuth:Failed with authCode %@, state %@ self.state %@", buf, 0x20u);
        }
        (*((void (**)(void))self->_completion + 2))();
      }
      v11 = v28;
    }
  }
  return v6;
}

void __64__DAEASOAuthFlowController_shouldHideWebViewForLoadWithRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__DAEASOAuthFlowController_shouldHideWebViewForLoadWithRequest___block_invoke_2;
  block[3] = &unk_26490A8E8;
  id v24 = v11;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v16 = *(id *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  id v28 = v16;
  uint64_t v29 = v17;
  id v30 = v15;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = v11;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __64__DAEASOAuthFlowController_shouldHideWebViewForLoadWithRequest___block_invoke_2(uint64_t a1)
{
  v21[10] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (v3 = *(void *)(a1 + 40)) != 0 && (uint64_t v4 = *(void *)(a1 + 48)) != 0 && (v5 = *(void *)(a1 + 56)) != 0)
  {
    v20[0] = @"authCode";
    v20[1] = @"accessToken";
    BOOL v6 = *(void **)(a1 + 72);
    v21[0] = *(void *)(a1 + 64);
    v21[1] = v2;
    v20[2] = @"refreshToken";
    v20[3] = @"username";
    v21[2] = v3;
    v21[3] = v4;
    v21[4] = v5;
    v20[4] = @"displayName";
    v20[5] = @"oauthURI";
    v7 = [v6 oauthURI];
    v21[5] = v7;
    v20[6] = @"tokenRequestURI";
    uint64_t v8 = [*(id *)(a1 + 72) tokenRequestURI];
    v21[6] = v8;
    v20[7] = @"jwksURI";
    os_log_type_t v9 = [*(id *)(a1 + 72) jwksURI];
    v21[7] = v9;
    v20[8] = @"issuer";
    id v10 = [*(id *)(a1 + 72) issuer];
    v21[8] = v10;
    v20[9] = @"jwksData";
    id v11 = [*(id *)(a1 + 72) jwksData];
    v21[9] = v11;
    id v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    id v13 = DALoggingwithCategory();
    os_log_type_t v14 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
    if (os_log_type_enabled(v13, v14))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_22C076000, v13, v14, "Exchange Hotmail OAuth:Completed Fetching Tokens", (uint8_t *)&v18, 2u);
    }

    (*(void (**)(void))(*(void *)(*(void *)(a1 + 72) + 8) + 16))();
  }
  else
  {
    id v15 = DALoggingwithCategory();
    os_log_type_t v16 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = *(void *)(a1 + 80);
      int v18 = 138543362;
      uint64_t v19 = v17;
      _os_log_impl(&dword_22C076000, v15, v16, "Exchange Hotmail OAuth:Completed Fetching Tokens With Error %{public}@", (uint8_t *)&v18, 0xCu);
    }

    (*(void (**)(void))(*(void *)(*(void *)(a1 + 72) + 8) + 16))();
  }
}

- (id)_urlRequestForOAuthTokenFromAuthCode:(id)a3 codeVerifier:(id)a4 claims:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DAEASOAuthFlowController *)self redirectURI];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = +[DAEASOAuthClient clientRedirect];
  }
  os_log_type_t v14 = v13;

  unint64_t v15 = [(DAEASOAuthFlowController *)self oauthType];
  os_log_type_t v16 = [(DAEASOAuthFlowController *)self easEndPoint];
  uint64_t v17 = +[DAEASOAuthClient defaultScopeForOAuthType:v15 withResourceIdentifier:v16 isOnPrem:[(DAEASOAuthFlowController *)self isOnPrem]];

  int v18 = [(DAEASOAuthFlowController *)self tokenRequestURI];
  uint64_t v19 = [(DAEASOAuthFlowController *)self clientID];
  id v20 = +[DAEASOAuthTokenRequest urlRequestForTokenRequestURI:v18 clientID:v19 redirectURI:v14 authCode:v10 scope:v17 codeVerifier:v9 claims:v8];

  return v20;
}

- (void)exchangeAuthCode:(id)a3 codeVerifier:(id)a4 claims:(id)a5 forTokensAndUsernameWithCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  os_log_type_t v14 = [(DAEASOAuthFlowController *)self oauthURI];

  if (v14)
  {
    if ([(DAEASOAuthFlowController *)self isOnPrem])
    {
      unint64_t v15 = NSURL;
      os_log_type_t v16 = [(DAEASOAuthFlowController *)self oauthURI];
      uint64_t v17 = [v15 URLWithString:v16];

      int v18 = [v17 URLByDeletingLastPathComponent];

      uint64_t v19 = [v18 URLByAppendingPathComponent:@"token"];

      id v20 = [v19 absoluteString];
      [(DAEASOAuthFlowController *)self setTokenRequestURI:v20];

      [(DAEASOAuthFlowController *)self _exchangeAuthCode:v10 codeVerifier:v11 claims:v12 forTokensAndUsernameWithCompletion:v13];
    }
    else
    {
      id v25 = [(DAEASOAuthFlowController *)self oauthURI];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __100__DAEASOAuthFlowController_exchangeAuthCode_codeVerifier_claims_forTokensAndUsernameWithCompletion___block_invoke;
      v26[3] = &unk_26490A960;
      v26[4] = self;
      id v30 = v13;
      id v27 = v10;
      id v28 = v11;
      id v29 = v12;
      [(DAEASOAuthFlowController *)self retrieveOpenIDMetadataFromURI:v25 withCompletion:v26];
    }
  }
  else
  {
    id v21 = DALoggingwithCategory();
    uint64_t v22 = *(unsigned __int8 *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v21, *(os_log_type_t *)(MEMORY[0x263F38F90] + 3)))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C076000, v21, (os_log_type_t)v22, "Cannot exchange auth code for tokens. self.oauthURI is nil.", buf, 2u);
    }

    id v23 = objc_alloc(MEMORY[0x263F087E8]);
    id v24 = (void *)[v23 initWithDomain:*MEMORY[0x263F38F08] code:93 userInfo:0];
    (*((void (**)(id, void, void, void, void, void *))v13 + 2))(v13, 0, 0, 0, 0, v24);
  }
}

void __100__DAEASOAuthFlowController_exchangeAuthCode_codeVerifier_claims_forTokensAndUsernameWithCompletion___block_invoke(id *a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a3;
  id v10 = a4;
  if (a5)
  {
    (*((void (**)(void))a1[8] + 2))();
  }
  else
  {
    [a1[4] setTokenRequestURI:a2];
    [a1[4] setJwksURI:v9];
    [a1[4] setIssuer:v10];
    if (v9)
    {
      id v11 = a1[4];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __100__DAEASOAuthFlowController_exchangeAuthCode_codeVerifier_claims_forTokensAndUsernameWithCompletion___block_invoke_46;
      v16[3] = &unk_26490A938;
      v16[4] = v11;
      id v17 = a1[5];
      id v18 = a1[6];
      id v19 = a1[7];
      id v20 = a1[8];
      [v11 retrieveJWKSDataFromURI:v9 withCompletion:v16];
    }
    else
    {
      id v12 = DALoggingwithCategory();
      os_log_type_t v13 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
      if (os_log_type_enabled(v12, v13))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C076000, v12, v13, "Cannot exchange auth code for tokens. jwksURI is nil.", buf, 2u);
      }

      id v14 = objc_alloc(MEMORY[0x263F087E8]);
      unint64_t v15 = (void *)[v14 initWithDomain:*MEMORY[0x263F38F08] code:93 userInfo:0];
      (*((void (**)(void))a1[8] + 2))();
    }
  }
}

uint64_t __100__DAEASOAuthFlowController_exchangeAuthCode_codeVerifier_claims_forTokensAndUsernameWithCompletion___block_invoke_46(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
    return v4();
  }
  else
  {
    [*(id *)(a1 + 32) setJwksData:a2];
    BOOL v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    return [v6 _exchangeAuthCode:v7 codeVerifier:v8 claims:v9 forTokensAndUsernameWithCompletion:v10];
  }
}

- (void)retrieveOpenIDMetadataFromURI:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__DAEASOAuthFlowController_retrieveOpenIDMetadataFromURI_withCompletion___block_invoke;
  block[3] = &unk_26490A9B0;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __73__DAEASOAuthFlowController_retrieveOpenIDMetadataFromURI_withCompletion___block_invoke(id *a1)
{
  uint64_t v2 = +[DAEASOpenIDMetadataRequest openIDrequestURLFor:a1[4]];
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 _setNonAppInitiated:1];
  uint64_t v4 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
  [a1[5] _assignConnectionPropertiesToSessionConfiguration:v4];
  uint64_t v5 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v4];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __73__DAEASOAuthFlowController_retrieveOpenIDMetadataFromURI_withCompletion___block_invoke_2;
  uint64_t v10 = &unk_26490A988;
  id v12 = a1[6];
  id v11 = a1[4];
  id v6 = [v5 dataTaskWithRequest:v3 completionHandler:&v7];
  objc_msgSend(v6, "resume", v7, v8, v9, v10);
}

void __73__DAEASOAuthFlowController_retrieveOpenIDMetadataFromURI_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = [[DAEASOpenIDMetadataResponse alloc] initWithData:v9 urlResponse:v8 error:v7];

  id v11 = [(DAEASOpenIDMetadataResponse *)v10 error];
  if (v11) {
    goto LABEL_2;
  }
  uint64_t v17 = [(DAEASOpenIDMetadataResponse *)v10 tokenRequestURI];
  if (!v17) {
    goto LABEL_3;
  }
  id v11 = (void *)v17;
  uint64_t v18 = [(DAEASOpenIDMetadataResponse *)v10 jwksURI];
  if (!v18)
  {
LABEL_2:
  }
  else
  {
    id v19 = (void *)v18;
    id v20 = [(DAEASOpenIDMetadataResponse *)v10 issuer];

    if (v20)
    {
      uint64_t v21 = *(void *)(a1 + 40);
      os_log_type_t v16 = [(DAEASOpenIDMetadataResponse *)v10 tokenRequestURI];
      uint64_t v22 = [(DAEASOpenIDMetadataResponse *)v10 jwksURI];
      id v23 = [(DAEASOpenIDMetadataResponse *)v10 issuer];
      (*(void (**)(uint64_t, void *, void *, void *, void))(v21 + 16))(v21, v16, v22, v23, 0);

      goto LABEL_6;
    }
  }
LABEL_3:
  id v12 = DALoggingwithCategory();
  os_log_type_t v13 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    int v24 = 138412546;
    uint64_t v25 = v14;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl(&dword_22C076000, v12, v13, "DAEASOAuthFlowController couldn't retrieve OpenID metadata from URI: %@ Error: %@", (uint8_t *)&v24, 0x16u);
  }

  uint64_t v15 = *(void *)(a1 + 40);
  os_log_type_t v16 = [(DAEASOpenIDMetadataResponse *)v10 error];
  (*(void (**)(uint64_t, void, void, void, void *))(v15 + 16))(v15, 0, 0, 0, v16);
LABEL_6:
}

- (void)retrieveJWKSDataFromURI:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__DAEASOAuthFlowController_retrieveJWKSDataFromURI_withCompletion___block_invoke;
  block[3] = &unk_26490A9B0;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __67__DAEASOAuthFlowController_retrieveJWKSDataFromURI_withCompletion___block_invoke(id *a1)
{
  id v2 = objc_alloc(MEMORY[0x263F089E0]);
  uint64_t v3 = (void *)[objc_alloc(NSURL) initWithString:a1[4]];
  uint64_t v4 = (void *)[v2 initWithURL:v3];

  [v4 _setNonAppInitiated:1];
  uint64_t v5 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
  [a1[5] _assignConnectionPropertiesToSessionConfiguration:v5];
  id v6 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v5];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __67__DAEASOAuthFlowController_retrieveJWKSDataFromURI_withCompletion___block_invoke_2;
  id v11 = &unk_26490A988;
  id v13 = a1[6];
  id v12 = a1[4];
  id v7 = [v6 dataTaskWithRequest:v4 completionHandler:&v8];
  objc_msgSend(v7, "resume", v8, v9, v10, v11);
}

void __67__DAEASOAuthFlowController_retrieveJWKSDataFromURI_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = v6;
  if (!a2 || v6)
  {
    uint64_t v9 = DALoggingwithCategory();
    os_log_type_t v10 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138412546;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl(&dword_22C076000, v9, v10, "DAEASOAuthFlowController couldn't retrieve JWKS data from URI: %@ Error: %@", (uint8_t *)&v12, 0x16u);
    }

    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
}

- (void)_exchangeAuthCode:(id)a3 codeVerifier:(id)a4 claims:(id)a5 forTokensAndUsernameWithCompletion:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __101__DAEASOAuthFlowController__exchangeAuthCode_codeVerifier_claims_forTokensAndUsernameWithCompletion___block_invoke;
  v12[3] = &unk_26490A9D8;
  v12[4] = self;
  id v13 = v10;
  id v11 = v10;
  [(DAEASOAuthFlowController *)self _exchangeAuthCode:a3 codeVerifier:a4 claims:a5 forTokensWithCompletion:v12];
}

void __101__DAEASOAuthFlowController__exchangeAuthCode_codeVerifier_claims_forTokensAndUsernameWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = DALoggingwithCategory();
  os_log_type_t v14 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v13, v14))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_22C076000, v13, v14, "EAS OAuth: Received Tokens", v17, 2u);
  }

  uint64_t v15 = *(void *)(a1 + 40);
  if (v9 && v10)
  {
    uint64_t v16 = [*(id *)(a1 + 32) _accountDescription];
    (*(void (**)(uint64_t, id, id, id, void *, void))(v15 + 16))(v15, v9, v10, v11, v16, 0);
  }
  else
  {
    (*(void (**)(void, void, void, void, void, id))(v15 + 16))(*(void *)(a1 + 40), 0, 0, 0, 0, v12);
  }
}

- (void)_exchangeAuthCode:(id)a3 codeVerifier:(id)a4 claims:(id)a5 forTokensWithCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  os_log_type_t v14 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__DAEASOAuthFlowController__exchangeAuthCode_codeVerifier_claims_forTokensWithCompletion___block_invoke;
  block[3] = &unk_26490AA28;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

void __90__DAEASOAuthFlowController__exchangeAuthCode_codeVerifier_claims_forTokensWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _urlRequestForOAuthTokenFromAuthCode:*(void *)(a1 + 40) codeVerifier:*(void *)(a1 + 48) claims:*(void *)(a1 + 56)];
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 _setNonAppInitiated:1];
  uint64_t v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = [v3 URL];
    id v7 = [NSString alloc];
    uint64_t v8 = [v3 HTTPBody];
    id v9 = (void *)[v7 initWithData:v8 encoding:4];
    *(_DWORD *)buf = 138412546;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_22C076000, v4, v5, "DAEASOAuthFlowController: Sending request: %@ %@", buf, 0x16u);
  }
  id v10 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
  [*(id *)(a1 + 32) _assignConnectionPropertiesToSessionConfiguration:v10];
  id v11 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v10];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __90__DAEASOAuthFlowController__exchangeAuthCode_codeVerifier_claims_forTokensWithCompletion___block_invoke_60;
  id v16 = &unk_26490AA00;
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = *(id *)(a1 + 64);
  id v12 = [v11 dataTaskWithRequest:v3 completionHandler:&v13];
  objc_msgSend(v12, "resume", v13, v14, v15, v16, v17);
}

void __90__DAEASOAuthFlowController__exchangeAuthCode_codeVerifier_claims_forTokensWithCompletion___block_invoke_60(uint64_t a1, void *a2, void *a3, void *a4)
{
  v45[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = [[DAEASOAuthTokenResponse alloc] initWithData:v9 urlResponse:v8 error:v7];

  id v11 = [(DAEASOAuthTokenResponse *)v10 error];
  if (v11)
  {

LABEL_3:
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = [(DAEASOAuthTokenResponse *)v10 error];
    (*(void (**)(uint64_t, void, void, void, void *))(v12 + 16))(v12, 0, 0, 0, v13);
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v14 = [(DAEASOAuthTokenResponse *)v10 idToken];

  if (!v14) {
    goto LABEL_3;
  }
  id v15 = [(DAEASOAuthTokenResponse *)v10 user_id];
  id v16 = *(void **)(a1 + 32);
  if (v15)
  {
    [v16 setUsername:v15];
  }
  else
  {
    uint64_t v17 = [v16 username];
    [*(id *)(a1 + 32) setUsername:v17];
  }
  if ([(DAEASOAuthTokenResponse *)v10 statusCode] != 200
    || ([(DAEASOAuthTokenResponse *)v10 accessToken], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) == 0)
    || (id v19 = (void *)v18,
        [(DAEASOAuthTokenResponse *)v10 refreshToken],
        id v20 = objc_claimAutoreleasedReturnValue(),
        v20,
        v19,
        !v20))
  {
    v32 = NSString;
    uint64_t v33 = objc_msgSend(NSNumber, "numberWithInteger:", -[DAEASOAuthTokenResponse statusCode](v10, "statusCode"));
    __int16 v34 = [(DAEASOAuthTokenResponse *)v10 errorMessage];
    uint64_t v13 = [v32 stringWithFormat:@"Server failed to exchange auth code for tokens, with status code %@ and error message %@", v33, v34];

    uint64_t v35 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263EFB070];
    uint64_t v42 = *MEMORY[0x263F08320];
    v43 = v13;
    v37 = NSDictionary;
    uint64_t v38 = &v43;
    v39 = &v42;
LABEL_15:
    v40 = [v37 dictionaryWithObjects:v38 forKeys:v39 count:1];
    v41 = [v35 errorWithDomain:v36 code:1 userInfo:v40];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_16;
  }
  if (([*(id *)(a1 + 32) isOnPrem] & 1) == 0)
  {
    __int16 v21 = [DAEASOAuthJWTValidator alloc];
    id v22 = [(DAEASOAuthTokenResponse *)v10 idToken];
    uint64_t v23 = [(DAEASOAuthJWTValidator *)v21 initWithIdToken:v22];

    int v24 = [*(id *)(a1 + 32) jwksData];
    uint64_t v25 = [*(id *)(a1 + 32) clientID];
    __int16 v26 = [*(id *)(a1 + 32) issuer];
    BOOL v27 = [(DAEASOAuthJWTValidator *)v23 idTokenValidWithJWKS:v24 withAudience:v25 withIssuer:v26];

    if (!v27)
    {
      uint64_t v13 = [NSString stringWithFormat:@"Could not validate the id_token received from the server"];
      uint64_t v35 = (void *)MEMORY[0x263F087E8];
      uint64_t v36 = *MEMORY[0x263EFB070];
      uint64_t v44 = *MEMORY[0x263F08320];
      v45[0] = v13;
      v37 = NSDictionary;
      uint64_t v38 = (void **)v45;
      v39 = &v44;
      goto LABEL_15;
    }
  }
  uint64_t v28 = *(void *)(a1 + 40);
  id v29 = [(DAEASOAuthTokenResponse *)v10 accessToken];
  id v30 = [(DAEASOAuthTokenResponse *)v10 refreshToken];
  objc_super v31 = [*(id *)(a1 + 32) username];
  (*(void (**)(uint64_t, void *, void *, void *, void))(v28 + 16))(v28, v29, v30, v31, 0);

LABEL_17:
}

- (void)_assignConnectionPropertiesToSessionConfiguration:(id)a3
{
  accountId = self->_accountId;
  id v4 = a3;
  objc_msgSend(v4, "set_sourceApplicationSecondaryIdentifier:", accountId);
  objc_msgSend(v4, "set_sourceApplicationBundleIdentifier:", *MEMORY[0x263F3B8C8]);
}

+ (id)upgradeAuthorizationEndpoint:(id)a3
{
  id v3 = a3;
  id v4 = [NSURL URLWithString:v3];
  os_log_type_t v5 = v4;
  if (v4
    && ([v4 host], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v7 = (void *)v6,
        [v5 path],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    id v9 = [v5 lastPathComponent];
    id v10 = [v5 URLByDeletingLastPathComponent];

    id v11 = [v10 lastPathComponent];
    uint64_t v12 = [v11 caseInsensitiveCompare:@"v2.0"];

    if (v12)
    {
      uint64_t v13 = [v10 URLByAppendingPathComponent:@"v2.0"];

      id v10 = [v13 URLByAppendingPathComponent:v9];

      id v14 = [v10 absoluteString];
    }
    else
    {
      id v14 = v3;
    }
    id v15 = v14;

    os_log_type_t v5 = v10;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (id)upgradeTokenEndpoint:(id)a3
{
  return +[DAEASOAuthFlowController upgradeAuthorizationEndpoint:a3];
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (DAEASOAuthPKCEChallenge)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (NSString)redirectURI
{
  return self->_redirectURI;
}

- (void)setRedirectURI:(id)a3
{
}

- (unint64_t)oauthType
{
  return self->_oauthType;
}

- (void)setOauthType:(unint64_t)a3
{
  self->_oauthType = a3;
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
}

- (NSString)oauthURI
{
  return self->_oauthURI;
}

- (void)setOauthURI:(id)a3
{
}

- (NSString)tokenRequestURI
{
  return self->_tokenRequestURI;
}

- (void)setTokenRequestURI:(id)a3
{
}

- (NSString)jwksURI
{
  return self->_jwksURI;
}

- (void)setJwksURI:(id)a3
{
}

- (NSData)jwksData
{
  return self->_jwksData;
}

- (void)setJwksData:(id)a3
{
}

- (NSString)issuer
{
  return self->_issuer;
}

- (void)setIssuer:(id)a3
{
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)easEndPoint
{
  return self->_easEndPoint;
}

- (void)setEasEndPoint:(id)a3
{
}

- (NSString)claimsChallenge
{
  return self->_claimsChallenge;
}

- (void)setClaimsChallenge:(id)a3
{
}

- (BOOL)isOnPrem
{
  return self->_isOnPrem;
}

- (void)setIsOnPrem:(BOOL)a3
{
  self->_isOnPrem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_claimsChallenge, 0);
  objc_storeStrong((id *)&self->_easEndPoint, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_jwksData, 0);
  objc_storeStrong((id *)&self->_jwksURI, 0);
  objc_storeStrong((id *)&self->_tokenRequestURI, 0);
  objc_storeStrong((id *)&self->_oauthURI, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
  objc_storeStrong((id *)&self->_redirectURI, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end