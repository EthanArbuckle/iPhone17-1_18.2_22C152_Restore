@interface FBKSSeedPortalAPI
- (FBKSHTTPClientProtocol)coreHTTPClient;
- (NSHTTPCookie)seedPortalSession;
- (NSURL)feedbackURL;
- (NSURL)seedPortalURL;
- (id)_filterForValue;
- (id)formItemsURLFormTat:(id)a3;
- (id)initClient:(id)a3;
- (id)loginWithTokenURL;
- (id)signOutURL;
- (id)unauthenticatedLoginURL;
- (signed)environment;
- (void)loadFormItemWithFormTat:(id)a3 withCompletion:(id)a4;
- (void)logOutServerSideWithCompletion:(id)a3;
- (void)seedPortalLoginAsUnauthenticatedUserWithSuccessHandler:(id)a3 error:(id)a4;
- (void)seedPortalLoginWithDeviceToken:(id)a3 success:(id)a4 error:(id)a5;
- (void)setCoreHTTPClient:(id)a3;
- (void)setEnvironment:(signed __int16)a3;
- (void)setFeedbackURL:(id)a3;
- (void)setSeedPortalURL:(id)a3;
@end

@implementation FBKSSeedPortalAPI

- (id)initClient:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FBKSSeedPortalAPI;
  v6 = [(FBKSSeedPortalAPI *)&v16 init];
  if (v6)
  {
    [(FBKSSeedPortalAPI *)v6 setEnvironment:+[FBKSSharedConstants environment]];
    v7 = +[FBKSSharedConstants appleSeedURL];
    if ([(FBKSSeedPortalAPI *)v6 environment] != 3)
    {
      uint64_t v8 = [v7 URLByAppendingPathComponent:@"sp"];

      v7 = (void *)v8;
    }
    objc_storeStrong((id *)&v6->_seedPortalURL, v7);
    v9 = [(FBKSSeedPortalAPI *)v6 seedPortalURL];
    uint64_t v10 = [v9 URLByAppendingPathComponent:@"feedback"];
    feedbackURL = v6->_feedbackURL;
    v6->_feedbackURL = (NSURL *)v10;

    v12 = FBKSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v6->_feedbackURL;
      *(_DWORD *)buf = 138543362;
      double v18 = *(double *)&v13;
      _os_log_impl(&dword_24DF86000, v12, OS_LOG_TYPE_DEFAULT, "Feedback URL [%{public}@]", buf, 0xCu);
    }

    v14 = FBKSLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v18 = 4.3;
      _os_log_impl(&dword_24DF86000, v14, OS_LOG_TYPE_DEFAULT, "SP2 API Version [%.1f]", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_coreHTTPClient, a3);
  }

  return v6;
}

- (NSHTTPCookie)seedPortalSession
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(FBKSSeedPortalAPI *)v2 coreHTTPClient];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(FBKSSeedPortalAPI *)v2 coreHTTPClient];
    v6 = [v5 seedPortalSession];
  }
  else
  {
    v6 = 0;
  }
  objc_sync_exit(v2);

  return (NSHTTPCookie *)v6;
}

- (id)loginWithTokenURL
{
  v2 = [(FBKSSeedPortalAPI *)self seedPortalURL];
  v3 = [v2 URLByAppendingPathComponent:@"login/with_token"];

  return v3;
}

- (id)unauthenticatedLoginURL
{
  v2 = [(FBKSSeedPortalAPI *)self seedPortalURL];
  v3 = [v2 URLByAppendingPathComponent:@"login/with_anon"];

  return v3;
}

- (id)signOutURL
{
  v2 = [(FBKSSeedPortalAPI *)self seedPortalURL];
  v3 = [v2 URLByAppendingPathComponent:@"signout"];

  return v3;
}

- (id)formItemsURLFormTat:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(FBKSSeedPortalAPI *)self feedbackURL];
  v6 = v5;
  if (v4)
  {
    v7 = [NSString stringWithFormat:@"form_items/%@", v4];
    uint64_t v8 = [v6 URLByAppendingPathComponent:v7];
  }
  else
  {
    uint64_t v8 = [v5 URLByAppendingPathComponent:@"form_items.json"];
  }

  v9 = [MEMORY[0x263F08BA0] componentsWithURL:v8 resolvingAgainstBaseURL:0];
  uint64_t v10 = (void *)MEMORY[0x263F08BD0];
  v11 = [(FBKSSeedPortalAPI *)self _filterForValue];
  v12 = [v10 queryItemWithName:@"filter_for" value:v11];
  v16[0] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [v9 setQueryItems:v13];

  v14 = [v9 URL];

  return v14;
}

- (id)_filterForValue
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"OSXProjects"];

  id v4 = @"macos";
  if ((v3 & 1) == 0)
  {
    int64_t v5 = +[FBKSSharedConstants platform];
    v6 = @"ios";
    if (v5 != 1) {
      v6 = @"macos";
    }
    if (v5 == 2) {
      return @"visionos";
    }
    else {
      return v6;
    }
  }
  return v4;
}

- (void)seedPortalLoginWithDeviceToken:(id)a3 success:(id)a4 error:(id)a5
{
  v23[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)MEMORY[0x263EFC5E8];
  v11 = (void (**)(id, id))a5;
  v12 = [(FBKSSeedPortalAPI *)self loginWithTokenURL];
  v13 = [v10 requestWithURL:v12];

  [v13 setHTTPMethod:@"POST"];
  v22 = @"device_token";
  v23[0] = v8;
  v14 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
  id v21 = 0;
  v15 = [MEMORY[0x263F08900] dataWithJSONObject:v14 options:0 error:&v21];
  id v16 = v21;
  if (v16)
  {
    v17 = FBKSSP2Log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[FBKSSeedPortalAPI seedPortalLoginWithDeviceToken:success:error:]((uint64_t)v16, v17);
    }

    v11[2](v11, v16);
  }
  else
  {
    [v13 setHTTPBody:v15];
    [v13 setHTTPContentType:@"application/json; charset=utf-8"];
    double v18 = [(FBKSSeedPortalAPI *)self coreHTTPClient];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __66__FBKSSeedPortalAPI_seedPortalLoginWithDeviceToken_success_error___block_invoke;
    v19[3] = &unk_2653133A8;
    v20 = (void (**)(id, id))v9;
    [v18 jsonForURLRequest:v13 success:v19 error:v11];

    v11 = v20;
  }
}

void __66__FBKSSeedPortalAPI_seedPortalLoginWithDeviceToken_success_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[FBKSUserLoginInfo alloc] initWithDictionary:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)seedPortalLoginAsUnauthenticatedUserWithSuccessHandler:(id)a3 error:(id)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFC5E8];
  id v8 = a4;
  id v9 = [(FBKSSeedPortalAPI *)self unauthenticatedLoginURL];
  uint64_t v10 = [v7 requestWithURL:v9];

  [v10 setHTTPMethod:@"POST"];
  [v10 setHTTPContentType:@"application/json; charset=utf-8"];
  v11 = [(FBKSSeedPortalAPI *)self coreHTTPClient];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__FBKSSeedPortalAPI_seedPortalLoginAsUnauthenticatedUserWithSuccessHandler_error___block_invoke;
  v13[3] = &unk_2653133A8;
  id v14 = v6;
  id v12 = v6;
  [v11 jsonForURLRequest:v10 success:v13 error:v8];
}

void __82__FBKSSeedPortalAPI_seedPortalLoginAsUnauthenticatedUserWithSuccessHandler_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[FBKSUserLoginInfo alloc] initWithDictionary:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)logOutServerSideWithCompletion:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(FBKSSeedPortalAPI *)self signOutURL];
  id v6 = [(FBKSSeedPortalAPI *)self coreHTTPClient];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__FBKSSeedPortalAPI_logOutServerSideWithCompletion___block_invoke;
  v12[3] = &unk_2653133D0;
  id v13 = v4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__FBKSSeedPortalAPI_logOutServerSideWithCompletion___block_invoke_2;
  v9[3] = &unk_2653133F8;
  id v10 = v5;
  id v11 = v13;
  id v7 = v13;
  id v8 = v5;
  [v6 dataForURL:v8 success:v12 error:v9];
}

uint64_t __52__FBKSSeedPortalAPI_logOutServerSideWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __52__FBKSSeedPortalAPI_logOutServerSideWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = FBKSSP2Log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52__FBKSSeedPortalAPI_logOutServerSideWithCompletion___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void)loadFormItemWithFormTat:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  id v9 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v8];

  id v10 = [(FBKSSeedPortalAPI *)self formItemsURLFormTat:v9];
  id v11 = [MEMORY[0x263EFC630] requestWithURL:v10];
  id v12 = [(FBKSSeedPortalAPI *)self coreHTTPClient];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60__FBKSSeedPortalAPI_loadFormItemWithFormTat_withCompletion___block_invoke;
  v17[3] = &unk_265313420;
  id v18 = v6;
  id v19 = v7;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__FBKSSeedPortalAPI_loadFormItemWithFormTat_withCompletion___block_invoke_57;
  v15[3] = &unk_2653132C8;
  id v16 = v19;
  id v13 = v19;
  id v14 = v6;
  [v12 jsonForURLRequest:v11 success:v17 error:v15];
}

void __60__FBKSSeedPortalAPI_loadFormItemWithFormTat_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.FeedbackService" code:-1001 userInfo:0];
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v4);
    }
    id v6 = FBKSSP2Log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __60__FBKSSeedPortalAPI_loadFormItemWithFormTat_withCompletion___block_invoke_cold_1(v6);
    }
  }
}

uint64_t __60__FBKSSeedPortalAPI_loadFormItemWithFormTat_withCompletion___block_invoke_57(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (signed)environment
{
  return self->_environment;
}

- (void)setEnvironment:(signed __int16)a3
{
  self->_environment = a3;
}

- (NSURL)seedPortalURL
{
  return self->_seedPortalURL;
}

- (void)setSeedPortalURL:(id)a3
{
}

- (NSURL)feedbackURL
{
  return self->_feedbackURL;
}

- (void)setFeedbackURL:(id)a3
{
}

- (FBKSHTTPClientProtocol)coreHTTPClient
{
  return self->_coreHTTPClient;
}

- (void)setCoreHTTPClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreHTTPClient, 0);
  objc_storeStrong((id *)&self->_feedbackURL, 0);
  objc_storeStrong((id *)&self->_seedPortalURL, 0);
}

- (void)seedPortalLoginWithDeviceToken:(uint64_t)a1 success:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24DF86000, a2, OS_LOG_TYPE_ERROR, "Encountered an error serializing JSON: %@", (uint8_t *)&v2, 0xCu);
}

void __52__FBKSSeedPortalAPI_logOutServerSideWithCompletion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*(id *)(a1 + 32) path];
  int v6 = 138543618;
  id v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_24DF86000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Failed with error [%{public}@]", (uint8_t *)&v6, 0x16u);
}

void __60__FBKSSeedPortalAPI_loadFormItemWithFormTat_withCompletion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24DF86000, log, OS_LOG_TYPE_ERROR, "bad data format in forms index", v1, 2u);
}

@end