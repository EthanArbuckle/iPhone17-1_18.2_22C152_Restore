@interface WFDropboxOAuth2SessionManager
- (WFDropboxOAuth2SessionManager)initWithClientID:(id)a3 clientSecret:(id)a4;
- (WFDropboxOAuth2SessionManager)initWithSessionConfiguration:(id)a3 clientID:(id)a4 clientSecret:(id)a5;
- (id)appAuthorizationSessionWithCompletionHandler:(id)a3;
- (id)authorizationSessionWithCompletionHandler:(id)a3;
- (void)authenticateWithLegacyAccessToken:(id)a3 accessTokenSecret:(id)a4 completionHandler:(id)a5;
- (void)revokeCredential:(id)a3 completionHandler:(id)a4;
@end

@implementation WFDropboxOAuth2SessionManager

- (void)revokeCredential:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFDropboxOAuth2SessionManager.m", 97, @"Invalid parameter not satisfying: %@", @"credential" object file lineNumber description];
  }
  v9 = [NSURL URLWithString:@"https://api.dropboxapi.com/1/disable_access_token"];
  v10 = [MEMORY[0x263EFC5E8] requestWithURL:v9];
  [v10 _setNonAppInitiated:1];
  objc_msgSend(v10, "wfo_setAuthorizationWithCredential:", v7);
  v11 = [(WFOAuth2SessionManager *)self session];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __68__WFDropboxOAuth2SessionManager_revokeCredential_completionHandler___block_invoke;
  v15[3] = &unk_264E5EC38;
  id v16 = v8;
  id v12 = v8;
  v13 = [v11 dataTaskWithRequest:v10 completionHandler:v15];
  [v13 resume];
}

void __68__WFDropboxOAuth2SessionManager_revokeCredential_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = [a3 statusCode];
  v10 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 200, 100);
  uint64_t v11 = [v10 containsIndex:v9];

  if ([v7 length])
  {
    id v18 = v8;
    id v12 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v18];
    id v13 = v18;

    uint64_t v11 = [v12 count] == 0;
    uint64_t v14 = WFRFC6749Section5_2ErrorFromResponse(v12);
    v15 = (void *)v14;
    if (v14) {
      id v16 = (void *)v14;
    }
    else {
      id v16 = v13;
    }
    id v8 = v16;
  }
  uint64_t v17 = *(void *)(a1 + 32);
  if (v17) {
    (*(void (**)(uint64_t, uint64_t, id))(v17 + 16))(v17, v11, v8);
  }
}

- (WFDropboxOAuth2SessionManager)initWithSessionConfiguration:(id)a3 clientID:(id)a4 clientSecret:(id)a5
{
  v22[2] = *MEMORY[0x263EF8340];
  id v8 = NSURL;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 URLWithString:@"https://www.dropbox.com/1/oauth2/authorize"];
  id v13 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v14 = [v13 localeIdentifier];

  v15 = [MEMORY[0x263F08BD0] queryItemWithName:@"disable_signup" value:@"true"];
  v22[0] = v15;
  id v16 = [MEMORY[0x263F08BD0] queryItemWithName:@"locale" value:v14];
  v22[1] = v16;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];

  id v18 = [NSURL URLWithString:@"https://api.dropboxapi.com/1/oauth2/token"];
  v19 = objc_msgSend(v12, "wfo_URLByAppendingQueryItems:", v17);
  v20 = [(WFOAuth2SessionManager *)self initWithSessionConfiguration:v11 tokenURL:v18 authorizationURL:v19 authenticationMethod:@"client_secret_post" clientID:v10 clientSecret:v9];

  return v20;
}

- (WFDropboxOAuth2SessionManager)initWithClientID:(id)a3 clientSecret:(id)a4
{
  return [(WFDropboxOAuth2SessionManager *)self initWithSessionConfiguration:0 clientID:a3 clientSecret:a4];
}

- (void)authenticateWithLegacyAccessToken:(id)a3 accessTokenSecret:(id)a4 completionHandler:(id)a5
{
  v56[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v41 = [MEMORY[0x263F08690] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"WFDropboxOAuth2SessionManager.m", 33, @"Invalid parameter not satisfying: %@", @"accessToken" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v42 = [MEMORY[0x263F08690] currentHandler];
  [v42 handleFailureInMethod:a2, self, @"WFDropboxOAuth2SessionManager.m", 34, @"Invalid parameter not satisfying: %@", @"accessTokenSecret" object file lineNumber description];

LABEL_3:
  v48 = v11;
  if (!v11)
  {
    v43 = [MEMORY[0x263F08690] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"WFDropboxOAuth2SessionManager.m", 35, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v46 = [NSURL URLWithString:@"https://api.dropboxapi.com/1/oauth2/token_from_oauth1"];
  id v12 = objc_msgSend(MEMORY[0x263EFC5E8], "requestWithURL:");
  [v12 _setNonAppInitiated:1];
  v45 = v12;
  [v12 setHTTPMethod:@"POST"];
  id v13 = [(WFOAuth2SessionManager *)self clientSecret];
  v56[0] = v13;
  v56[1] = v10;
  v49 = v10;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];
  uint64_t v15 = [v14 componentsJoinedByString:@"&"];

  id v16 = objc_opt_new();
  uint64_t v17 = [MEMORY[0x263F08BD0] queryItemWithName:@"oauth_version" value:@"1.0"];
  [v16 addObject:v17];

  id v18 = (void *)MEMORY[0x263F08BD0];
  v47 = self;
  v19 = [(WFOAuth2SessionManager *)self clientID];
  v20 = [v18 queryItemWithName:@"oauth_consumer_key" value:v19];
  [v16 addObject:v20];

  v50 = v9;
  v21 = [MEMORY[0x263F08BD0] queryItemWithName:@"oauth_token" value:v9];
  [v16 addObject:v21];

  v22 = [MEMORY[0x263F08BD0] queryItemWithName:@"oauth_signature_method" value:@"PLAINTEXT"];
  [v16 addObject:v22];

  v44 = (void *)v15;
  v23 = [MEMORY[0x263F08BD0] queryItemWithName:@"oauth_signature" value:v15];
  [v16 addObject:v23];

  v24 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  v25 = (void *)[v24 mutableCopy];

  [v25 addCharactersInString:@"-_.~"];
  v26 = objc_opt_new();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v27 = v16;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v52 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v33 = [v32 name];
        v34 = [v33 stringByAddingPercentEncodingWithAllowedCharacters:v25];

        v35 = [v32 value];
        v36 = [v35 stringByAddingPercentEncodingWithAllowedCharacters:v25];

        v37 = [NSString stringWithFormat:@"%@=\"%@\"", v34, v36];
        [v26 addObject:v37];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v29);
  }

  v38 = NSString;
  v39 = [v26 componentsJoinedByString:@","];
  v40 = [v38 stringWithFormat:@"OAuth %@", v39];

  [v45 setValue:v40 forHTTPHeaderField:@"Authorization"];
  [(WFOAuth2SessionManager *)v47 authenticateWithRequest:v45 refreshToken:0 completionHandler:v48];
}

- (id)appAuthorizationSessionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [WFDropboxAppAuthorizationSession alloc];
  v6 = [(WFOAuth2SessionManager *)self clientID];
  id v7 = [(WFDropboxAppAuthorizationSession *)v5 initWithClientID:v6 completionHandler:v4];

  return v7;
}

- (id)authorizationSessionWithCompletionHandler:(id)a3
{
  id v4 = NSURL;
  v5 = NSString;
  id v6 = a3;
  id v7 = [(WFOAuth2SessionManager *)self clientID];
  id v8 = [v5 stringWithFormat:@"db-%@://2/token", v7];
  id v9 = [v4 URLWithString:v8];

  v12.receiver = self;
  v12.super_class = (Class)WFDropboxOAuth2SessionManager;
  id v10 = [(WFOAuth2SessionManager *)&v12 authorizationSessionWithResponseType:@"token" scopes:0 redirectURI:v9 completionHandler:v6];

  return v10;
}

@end