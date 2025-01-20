@interface DAExchangeOAuthFlowController
- (DAExchangeOAuthFlowController)initWithAuthURI:(id)a3 easEndPoint:(id)a4 username:(id)a5 accountId:(id)a6 claims:(id)a7 isOnPrem:(BOOL)a8;
- (id)_accountDescription;
- (id)initialRedirectURL;
- (void)exchangeAuthCode:(id)a3 codeVerifier:(id)a4 claims:(id)a5 withCompletion:(id)a6;
@end

@implementation DAExchangeOAuthFlowController

- (DAExchangeOAuthFlowController)initWithAuthURI:(id)a3 easEndPoint:(id)a4 username:(id)a5 accountId:(id)a6 claims:(id)a7 isOnPrem:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a4;
  v19.receiver = self;
  v19.super_class = (Class)DAExchangeOAuthFlowController;
  v15 = [(DAEASOAuthFlowController *)&v19 initWithOAuthType:1 authURI:a3 username:a5 accountId:a6 claims:a7 isOnPrem:v8];
  v16 = v15;
  if (v15)
  {
    [(DAEASOAuthFlowController *)v15 setEasEndPoint:v14];
    v17 = +[DAEASOAuthClient clientIDForOAuthType:1];
    [(DAEASOAuthFlowController *)v16 setClientID:v17];
  }
  return v16;
}

- (id)initialRedirectURL
{
  return 0;
}

- (id)_accountDescription
{
  return @"Exchange";
}

- (void)exchangeAuthCode:(id)a3 codeVerifier:(id)a4 claims:(id)a5 withCompletion:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __85__DAExchangeOAuthFlowController_exchangeAuthCode_codeVerifier_claims_withCompletion___block_invoke;
  v12[3] = &unk_26490AA50;
  v12[4] = self;
  id v13 = v10;
  id v11 = v10;
  [(DAEASOAuthFlowController *)self exchangeAuthCode:a3 codeVerifier:a4 claims:a5 forTokensAndUsernameWithCompletion:v12];
}

void __85__DAExchangeOAuthFlowController_exchangeAuthCode_codeVerifier_claims_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v18 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v18 && v9)
  {
    v12 = objc_alloc_init(DAEASOAuthIdentity);
    [(DAEASOAuthIdentity *)v12 setAccessToken:v18];
    [(DAEASOAuthIdentity *)v12 setRefreshToken:v9];
    [(DAEASOAuthIdentity *)v12 setUsername:v10];
    [(DAEASOAuthIdentity *)v12 setDisplayName:v11];
    id v13 = [*(id *)(a1 + 32) oauthURI];
    [(DAEASOAuthIdentity *)v12 setOauthURI:v13];

    id v14 = [*(id *)(a1 + 32) tokenRequestURI];
    [(DAEASOAuthIdentity *)v12 setTokenRequestURI:v14];

    v15 = [*(id *)(a1 + 32) jwksData];
    [(DAEASOAuthIdentity *)v12 setJwksData:v15];

    v16 = [*(id *)(a1 + 32) jwksURI];
    [(DAEASOAuthIdentity *)v12 setJwksURI:v16];

    v17 = [*(id *)(a1 + 32) issuer];
    [(DAEASOAuthIdentity *)v12 setIssuer:v17];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

@end