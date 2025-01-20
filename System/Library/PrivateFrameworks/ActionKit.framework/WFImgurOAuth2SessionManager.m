@interface WFImgurOAuth2SessionManager
- (WFImgurOAuth2SessionManager)initWithClientID:(id)a3 clientSecret:(id)a4;
- (WFImgurOAuth2SessionManager)initWithSessionConfiguration:(id)a3 clientID:(id)a4 clientSecret:(id)a5;
- (id)authorizationSessionWithResponseType:(id)a3 scopes:(id)a4 redirectURI:(id)a5 completionHandler:(id)a6;
- (void)sendRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation WFImgurOAuth2SessionManager

- (void)sendRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__WFImgurOAuth2SessionManager_sendRequest_completionHandler___block_invoke;
  v9[3] = &unk_264E5A2C8;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)WFImgurOAuth2SessionManager;
  id v7 = v6;
  [(WFOAuth2SessionManager *)&v8 sendRequest:a3 completionHandler:v9];
}

void __61__WFImgurOAuth2SessionManager_sendRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v7 objectForKeyedSubscript:@"data"];
  objc_opt_class();
  id v11 = v10;
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  v14 = [v13 objectForKeyedSubscript:@"error"];

  objc_opt_class();
  id v15 = v14;
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  if (!v9 && v17)
  {
    v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F08320];
    v21[0] = v17;
    v19 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v9 = [v18 errorWithDomain:@"WFOAuth2ErrorDomain" code:-1 userInfo:v19];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)authorizationSessionWithResponseType:(id)a3 scopes:(id)a4 redirectURI:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(WFOAuth2SessionManager *)self authorizationURL];
  id v15 = [(WFOAuth2SessionManager *)self authorizationSessionWithAuthorizationURL:v14 responseType:v13 scopes:v12 redirectURI:v11 specifyRedirectURI:0 completionHandler:v10];

  return v15;
}

- (WFImgurOAuth2SessionManager)initWithSessionConfiguration:(id)a3 clientID:(id)a4 clientSecret:(id)a5
{
  id v8 = NSURL;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 URLWithString:@"https://api.imgur.com/oauth2/token"];
  id v13 = [NSURL URLWithString:@"https://api.imgur.com/oauth2/authorize"];
  v14 = [(WFOAuth2SessionManager *)self initWithSessionConfiguration:v11 tokenURL:v12 authorizationURL:v13 authenticationMethod:@"client_secret_post" clientID:v10 clientSecret:v9];

  return v14;
}

- (WFImgurOAuth2SessionManager)initWithClientID:(id)a3 clientSecret:(id)a4
{
  return [(WFImgurOAuth2SessionManager *)self initWithSessionConfiguration:0 clientID:a3 clientSecret:a4];
}

@end