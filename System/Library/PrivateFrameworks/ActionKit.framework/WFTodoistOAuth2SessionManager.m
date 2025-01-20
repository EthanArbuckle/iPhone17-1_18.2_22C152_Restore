@interface WFTodoistOAuth2SessionManager
+ (id)combinedScopeFromScopes:(id)a3;
- (WFTodoistOAuth2SessionManager)initWithClientID:(id)a3 clientSecret:(id)a4;
- (WFTodoistOAuth2SessionManager)initWithSessionConfiguration:(id)a3 clientID:(id)a4 clientSecret:(id)a5;
- (void)revokeCredential:(id)a3 completionHandler:(id)a4;
@end

@implementation WFTodoistOAuth2SessionManager

+ (id)combinedScopeFromScopes:(id)a3
{
  return (id)[a3 componentsJoinedByString:@","];
}

- (void)revokeCredential:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"WFTodoistOAuth2SessionManager.m", 54, @"Invalid parameter not satisfying: %@", @"credential" object file lineNumber description];
  }
  v9 = [NSURL URLWithString:@"https://todoist.com/api/access_tokens/revoke"];
  v10 = [MEMORY[0x263EFC5E8] requestWithURL:v9];
  [v10 _setNonAppInitiated:1];
  [v10 setHTTPMethod:@"POST"];
  v11 = objc_opt_new();
  v12 = [(WFOAuth2SessionManager *)self clientID];
  [v11 setObject:v12 forKey:@"client_id"];

  v13 = [v7 accessToken];
  [v11 setObject:v13 forKey:@"access_token"];

  v14 = [(WFOAuth2SessionManager *)self clientSecret];

  if (v14)
  {
    v15 = [(WFOAuth2SessionManager *)self clientSecret];
    [v11 setObject:v15 forKey:@"client_secret"];
  }
  v16 = [MEMORY[0x263F08900] dataWithJSONObject:v11 options:0 error:0];
  [v10 setHTTPBody:v16];

  [v10 setValue:@"application/json" forHTTPHeaderField:@"Content-Typee"];
  v17 = [(WFOAuth2SessionManager *)self session];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __68__WFTodoistOAuth2SessionManager_revokeCredential_completionHandler___block_invoke;
  v21[3] = &unk_264E5EC38;
  id v22 = v8;
  id v18 = v8;
  v19 = [v17 dataTaskWithRequest:v10 completionHandler:v21];
  [v19 resume];
}

void __68__WFTodoistOAuth2SessionManager_revokeCredential_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v7 length])
  {
    id v17 = v9;
    v10 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v17];
    id v11 = v17;

    uint64_t v12 = WFRFC6749Section5_2ErrorFromResponse(v10);
    v13 = (void *)v12;
    if (v12) {
      v14 = (void *)v12;
    }
    else {
      v14 = v11;
    }
    id v9 = v14;
  }
  uint64_t v15 = [v8 statusCode];
  uint64_t v16 = *(void *)(a1 + 32);
  if (v16) {
    (*(void (**)(uint64_t, BOOL, id))(v16 + 16))(v16, v15 == 204, v9);
  }
}

- (WFTodoistOAuth2SessionManager)initWithSessionConfiguration:(id)a3 clientID:(id)a4 clientSecret:(id)a5
{
  id v8 = NSURL;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v8 URLWithString:@"https://todoist.com/oauth/access_token"];
  v13 = [NSURL URLWithString:@"https://todoist.com/oauth/authorize"];
  v14 = [(WFOAuth2SessionManager *)self initWithSessionConfiguration:v11 tokenURL:v12 authorizationURL:v13 authenticationMethod:@"client_secret_post" clientID:v10 clientSecret:v9];

  return v14;
}

- (WFTodoistOAuth2SessionManager)initWithClientID:(id)a3 clientSecret:(id)a4
{
  return [(WFTodoistOAuth2SessionManager *)self initWithSessionConfiguration:0 clientID:a3 clientSecret:a4];
}

@end