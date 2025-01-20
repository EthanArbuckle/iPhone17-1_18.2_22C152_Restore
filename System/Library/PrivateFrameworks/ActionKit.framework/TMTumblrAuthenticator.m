@interface TMTumblrAuthenticator
+ (id)sharedInstance;
+ (void)signRequest:(id)a3 withParameters:(id)a4 consumerKey:(id)a5 consumerSecret:(id)a6 token:(id)a7 tokenSecret:(id)a8;
- (BOOL)handleOpenURL:(id)a3;
- (NSString)OAuthConsumerKey;
- (NSString)OAuthConsumerSecret;
- (NSString)threeLeggedOAuthTokenSecret;
- (id)threeLeggedOAuthCallback;
- (void)authenticate:(id)a3 urlBlock:(id)a4 callback:(id)a5;
- (void)setOAuthConsumerKey:(id)a3;
- (void)setOAuthConsumerSecret:(id)a3;
- (void)setThreeLeggedOAuthCallback:(id)a3;
- (void)setThreeLeggedOAuthTokenSecret:(id)a3;
- (void)xAuth:(id)a3 password:(id)a4 callback:(id)a5;
@end

@implementation TMTumblrAuthenticator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threeLeggedOAuthTokenSecret, 0);
  objc_storeStrong(&self->_threeLeggedOAuthCallback, 0);
  objc_storeStrong((id *)&self->_OAuthConsumerSecret, 0);
  objc_storeStrong((id *)&self->_OAuthConsumerKey, 0);
}

- (void)setThreeLeggedOAuthTokenSecret:(id)a3
{
}

- (NSString)threeLeggedOAuthTokenSecret
{
  return self->_threeLeggedOAuthTokenSecret;
}

- (void)setThreeLeggedOAuthCallback:(id)a3
{
}

- (id)threeLeggedOAuthCallback
{
  return self->_threeLeggedOAuthCallback;
}

- (void)setOAuthConsumerSecret:(id)a3
{
}

- (NSString)OAuthConsumerSecret
{
  return self->_OAuthConsumerSecret;
}

- (void)setOAuthConsumerKey:(id)a3
{
}

- (NSString)OAuthConsumerKey
{
  return self->_OAuthConsumerKey;
}

- (void)xAuth:(id)a3 password:(id)a4 callback:(id)a5
{
  v29[4] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v28[0] = @"x_auth_username";
  v28[1] = @"x_auth_password";
  v29[0] = a3;
  v29[1] = a4;
  v29[2] = @"client_auth";
  v28[2] = @"x_auth_mode";
  v28[3] = @"api_key";
  id v9 = a4;
  id v10 = a3;
  v11 = [(TMTumblrAuthenticator *)self OAuthConsumerKey];
  v29[3] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:4];

  v13 = mutableRequestWithURLString(@"https://www.tumblr.com/oauth/access_token");
  [v13 _setNonAppInitiated:1];
  [v13 setHTTPMethod:@"POST"];
  v14 = TMDictionaryToQueryString(v12);
  v15 = [v14 dataUsingEncoding:4];
  [v13 setHTTPBody:v15];

  v16 = objc_opt_class();
  v17 = [(TMTumblrAuthenticator *)self OAuthConsumerKey];
  v18 = [(TMTumblrAuthenticator *)self OAuthConsumerSecret];
  [v16 signRequest:v13 withParameters:v12 consumerKey:v17 consumerSecret:v18 token:0 tokenSecret:0];

  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  v25 = __49__TMTumblrAuthenticator_xAuth_password_callback___block_invoke;
  v26 = &unk_264E59560;
  id v27 = v8;
  id v19 = v8;
  v20 = _Block_copy(&v23);
  v21 = (void *)MEMORY[0x263EFC608];
  v22 = objc_msgSend(MEMORY[0x263F08A48], "mainQueue", v23, v24, v25, v26);
  [v21 sendAsynchronousRequest:v13 queue:v22 completionHandler:v20];
}

void __49__TMTumblrAuthenticator_xAuth_password_callback___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v18 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      (*(void (**)(uint64_t, void, void, id))(v9 + 16))(v9, 0, 0, v8);
    }
  }
  else
  {
    uint64_t v10 = [v18 statusCode];
    if (v10 == 200)
    {
      v11 = formEncodedDataToDictionary(v7);
      v12 = v11;
      uint64_t v13 = *(void *)(a1 + 32);
      if (v13)
      {
        v14 = [v11 objectForKeyedSubscript:@"oauth_token"];
        v15 = [v12 objectForKeyedSubscript:@"oauth_token_secret"];
        (*(void (**)(uint64_t, void *, void *, void))(v13 + 16))(v13, v14, v15, 0);
      }
    }
    else
    {
      uint64_t v16 = *(void *)(a1 + 32);
      if (v16)
      {
        v17 = [MEMORY[0x263F087E8] errorWithDomain:@"Authentication request failed" code:v10 userInfo:0];
        (*(void (**)(uint64_t, void, void, void *))(v16 + 16))(v16, 0, 0, v17);
      }
    }
  }
}

- (BOOL)handleOpenURL:(id)a3
{
  v37[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 host];
  int v6 = [v5 isEqualToString:@"tumblr-authorize"];

  if (v6)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__TMTumblrAuthenticator_handleOpenURL___block_invoke;
    aBlock[3] = &unk_264E5EE70;
    aBlock[4] = self;
    id v7 = (void (**)(void))_Block_copy(aBlock);
    id v8 = [v4 query];
    uint64_t v9 = type metadata for some(v8);

    uint64_t v10 = [v9 allKeys];
    uint64_t v11 = [v10 count];
    BOOL v12 = v11 != 0;

    if (v11)
    {
      v31 = [v9 objectForKeyedSubscript:@"oauth_token"];
      v36 = @"oauth_verifier";
      uint64_t v13 = objc_msgSend(v9, "objectForKeyedSubscript:");
      v37[0] = v13;
      v14 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];

      v15 = mutableRequestWithURLString(@"https://www.tumblr.com/oauth/access_token");
      [v15 _setNonAppInitiated:1];
      [v15 setHTTPMethod:@"POST"];
      TMDictionaryToQueryString(v14);
      v17 = uint64_t v16 = v7;
      id v18 = [v17 dataUsingEncoding:4];
      [v15 setHTTPBody:v18];

      uint64_t v19 = objc_opt_class();
      v20 = [(TMTumblrAuthenticator *)self OAuthConsumerKey];
      v21 = [(TMTumblrAuthenticator *)self OAuthConsumerSecret];
      [(TMTumblrAuthenticator *)self threeLeggedOAuthTokenSecret];
      v22 = BOOL v32 = v12;
      uint64_t v23 = (void *)v19;
      id v7 = v16;
      [v23 signRequest:v15 withParameters:v14 consumerKey:v20 consumerSecret:v21 token:v31 tokenSecret:v22];

      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __39__TMTumblrAuthenticator_handleOpenURL___block_invoke_2;
      v33[3] = &unk_264E59538;
      v33[4] = self;
      v34 = v16;
      uint64_t v24 = _Block_copy(v33);
      v25 = (void *)MEMORY[0x263EFC608];
      v26 = [MEMORY[0x263F08A48] mainQueue];
      [v25 sendAsynchronousRequest:v15 queue:v26 completionHandler:v24];

      BOOL v12 = v32;
    }
    else
    {
      id v27 = [(TMTumblrAuthenticator *)self threeLeggedOAuthCallback];

      if (v27)
      {
        v28 = [(TMTumblrAuthenticator *)self threeLeggedOAuthCallback];
        v29 = [MEMORY[0x263F087E8] errorWithDomain:@"Permission denied by user" code:0 userInfo:0];
        ((void (**)(void, void, void, void *))v28)[2](v28, 0, 0, v29);
      }
      v7[2](v7);
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

uint64_t __39__TMTumblrAuthenticator_handleOpenURL___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setThreeLeggedOAuthTokenSecret:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setThreeLeggedOAuthCallback:0];
}

void __39__TMTumblrAuthenticator_handleOpenURL___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v16 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 32) threeLeggedOAuthCallback];

    if (!v9) {
      goto LABEL_10;
    }
    uint64_t v10 = [*(id *)(a1 + 32) threeLeggedOAuthCallback];
    ((void (**)(void, void, void, id))v10)[2](v10, 0, 0, v8);
  }
  else
  {
    uint64_t v11 = [v16 statusCode];
    BOOL v12 = [*(id *)(a1 + 32) threeLeggedOAuthCallback];

    if (!v12) {
      goto LABEL_10;
    }
    if (v11 == 200)
    {
      formEncodedDataToDictionary(v7);
      uint64_t v10 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [*(id *)(a1 + 32) threeLeggedOAuthCallback];
      v14 = [v10 objectForKeyedSubscript:@"oauth_token"];
      v15 = [v10 objectForKeyedSubscript:@"oauth_token_secret"];
      ((void (**)(void, void *, void *, void))v13)[2](v13, v14, v15, 0);
    }
    else
    {
      uint64_t v10 = [*(id *)(a1 + 32) threeLeggedOAuthCallback];
      uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"Authentication request failed" code:v11 userInfo:0];
      v10[2](v10, 0, 0, v13);
    }
  }
LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)authenticate:(id)a3 urlBlock:(id)a4 callback:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  [(TMTumblrAuthenticator *)self setThreeLeggedOAuthTokenSecret:0];
  uint64_t v11 = NSString;
  BOOL v12 = [NSString stringWithFormat:@"%@://tumblr-authorize", v10];

  uint64_t v13 = TMURLEncode(v12);
  v14 = [v11 stringWithFormat:@"https://www.tumblr.com/oauth/request_token?oauth_callback=%@", v13];

  v15 = mutableRequestWithURLString((uint64_t)v14);
  [v15 _setNonAppInitiated:1];
  id v16 = objc_opt_class();
  v17 = [(TMTumblrAuthenticator *)self OAuthConsumerKey];
  id v18 = [(TMTumblrAuthenticator *)self OAuthConsumerSecret];
  [v16 signRequest:v15 withParameters:0 consumerKey:v17 consumerSecret:v18 token:0 tokenSecret:0];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__TMTumblrAuthenticator_authenticate_urlBlock_callback___block_invoke;
  aBlock[3] = &unk_264E59510;
  aBlock[4] = self;
  id v25 = v9;
  id v26 = v8;
  id v19 = v8;
  id v20 = v9;
  v21 = _Block_copy(aBlock);
  v22 = (void *)MEMORY[0x263EFC608];
  uint64_t v23 = [MEMORY[0x263F08A48] mainQueue];
  [v22 sendAsynchronousRequest:v15 queue:v23 completionHandler:v21];
}

void __56__TMTumblrAuthenticator_authenticate_urlBlock_callback___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v20 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, void, void, id))(v9 + 16))(v9, 0, 0, v8);
    }
  }
  else
  {
    uint64_t v10 = [v20 statusCode];
    uint64_t v11 = *(void *)(a1 + 40);
    if (v10 == 200)
    {
      [*(id *)(a1 + 32) setThreeLeggedOAuthCallback:*(void *)(a1 + 40)];
      BOOL v12 = formEncodedDataToDictionary(v7);
      uint64_t v13 = [v12 objectForKeyedSubscript:@"oauth_token_secret"];
      [*(id *)(a1 + 32) setThreeLeggedOAuthTokenSecret:v13];

      v14 = NSURL;
      v15 = NSString;
      id v16 = [v12 objectForKeyedSubscript:@"oauth_token"];
      v17 = [v15 stringWithFormat:@"https://www.tumblr.com/oauth/authorize?oauth_token=%@", v16];
      id v18 = [v14 URLWithString:v17];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else if (v11)
    {
      id v19 = [MEMORY[0x263F087E8] errorWithDomain:@"Authentication request failed" code:v10 userInfo:0];
      (*(void (**)(uint64_t, void, void, void *))(v11 + 16))(v11, 0, 0, v19);
    }
  }
}

+ (void)signRequest:(id)a3 withParameters:(id)a4 consumerKey:(id)a5 consumerSecret:(id)a6 token:(id)a7 tokenSecret:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = +[TMSDKUserAgent userAgentHeaderString];
  [v18 setValue:v19 forHTTPHeaderField:@"User-Agent"];

  id v24 = [v18 URL];
  id v20 = [v18 HTTPMethod];
  v21 = [MEMORY[0x263F08AB0] processInfo];
  v22 = [v21 globallyUniqueString];
  uint64_t v23 = +[TMOAuth headerForURL:v24 method:v20 postParameters:v17 nonce:v22 consumerKey:v16 consumerSecret:v15 token:v14 tokenSecret:v13];

  [v18 setValue:v23 forHTTPHeaderField:@"Authorization"];
}

+ (id)sharedInstance
{
  if (sharedInstance_predicate != -1) {
    dispatch_once(&sharedInstance_predicate, &__block_literal_global_25308);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

void __39__TMTumblrAuthenticator_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(TMTumblrAuthenticator);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;
}

@end