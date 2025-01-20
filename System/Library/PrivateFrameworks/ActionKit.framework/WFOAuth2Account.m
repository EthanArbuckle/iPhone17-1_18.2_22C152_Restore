@interface WFOAuth2Account
+ (id)accountWithCredential:(id)a3;
+ (id)clientID;
+ (id)clientSecret;
+ (id)migrate:(id)a3;
+ (id)redirectURI;
+ (id)responseType;
+ (id)scopes;
+ (id)sessionManager;
- (BOOL)isValid;
- (WFOAuth2Credential)credential;
- (void)refreshWithCompletionHandler:(id)a3;
- (void)setCredential:(id)a3;
@end

@implementation WFOAuth2Account

+ (id)accountWithCredential:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"WFOAuth2Account.m", 59, @"Invalid parameter not satisfying: %@", @"credential" object file lineNumber description];
  }
  v6 = objc_opt_new();
  [v6 setCredential:v5];

  return v6;
}

+ (id)responseType
{
  v2 = @"code";
  return @"code";
}

+ (id)scopes
{
  return 0;
}

+ (id)redirectURI
{
  return 0;
}

+ (id)clientSecret
{
  return 0;
}

+ (id)clientID
{
  return 0;
}

+ (id)sessionManager
{
  return 0;
}

+ (id)migrate:(id)a3
{
  id v4 = a3;
  if (v4
    && ([MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:0],
        (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    v7 = [v5 objectForKeyedSubscript:@"expire_date"];
    if (v7)
    {
      v8 = (void *)MEMORY[0x263EFF910];
      v9 = [v6 objectForKeyedSubscript:@"expire_date"];
      [v9 doubleValue];
      v10 = objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
    }
    else
    {
      v10 = 0;
    }

    v12 = (void *)[v6 mutableCopy];
    v13 = NSNumber;
    [v10 timeIntervalSinceNow];
    v14 = objc_msgSend(v13, "numberWithDouble:");
    [v12 setValue:v14 forKey:@"expires_in"];

    v15 = [[WFOAuth2Credential alloc] initWithResponseObject:v12];
    v11 = [a1 accountWithCredential:v15];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
}

- (void)setCredential:(id)a3
{
}

- (WFOAuth2Credential)credential
{
  return self->_credential;
}

- (void)refreshWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WFOAuth2Account *)self credential];
  if ([v5 isExpired])
  {
    v6 = [(WFOAuth2Account *)self credential];
    v7 = [v6 refreshToken];

    if (v7)
    {
      v8 = [(id)objc_opt_class() sessionManager];
      v9 = [(WFOAuth2Account *)self credential];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __48__WFOAuth2Account_refreshWithCompletionHandler___block_invoke;
      v10[3] = &unk_264E59910;
      v10[4] = self;
      id v11 = v4;
      [v8 authenticateWithRefreshCredential:v9 completionHandler:v10];

      goto LABEL_7;
    }
  }
  else
  {
  }
  if (v4) {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
LABEL_7:
}

void __48__WFOAuth2Account_refreshWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7)
  {
    [*(id *)(a1 + 32) setCredential:v7];
    +[WFAccount saveAccount:*(void *)(a1 + 32)];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
}

- (BOOL)isValid
{
  v2 = [(WFOAuth2Account *)self credential];
  char v3 = [v2 isValid];

  return v3;
}

@end