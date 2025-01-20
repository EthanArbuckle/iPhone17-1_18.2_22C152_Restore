@interface WFPinboardSessionManager
- (NSDateFormatter)dateTimeFormatter;
- (NSString)apiToken;
- (NSString)password;
- (NSString)username;
- (NSURL)baseURL;
- (NSURLSession)session;
- (WFPinboardSessionManager)init;
- (WFPinboardSessionManager)initWithSession:(id)a3;
- (WFPinboardSessionManager)initWithSessionConfiguration:(id)a3;
- (id)authenticatedTaskWithURL:(id)a3 completionHandler:(id)a4;
- (void)addBookmark:(id)a3 withTitle:(id)a4 parameters:(id)a5 completion:(id)a6;
- (void)getBookmarksWithTags:(id)a3 limit:(unint64_t)a4 completion:(id)a5;
- (void)getModifiedDateWithCompletion:(id)a3;
- (void)setApiToken:(id)a3;
- (void)setPassword:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation WFPinboardSessionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateTimeFormatter, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_apiToken, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (NSDateFormatter)dateTimeFormatter
{
  return self->_dateTimeFormatter;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setApiToken:(id)a3
{
}

- (NSString)apiToken
{
  return self->_apiToken;
}

- (void)setPassword:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setUsername:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (NSURLSession)session
{
  return self->_session;
}

- (id)authenticatedTaskWithURL:(id)a3 completionHandler:(id)a4
{
  v39[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = (objc_class *)MEMORY[0x263F08BA0];
  id v8 = a3;
  v9 = (void *)[[v7 alloc] initWithURL:v8 resolvingAgainstBaseURL:0];

  v10 = objc_opt_new();
  [v10 setObject:@"json" forKey:@"format"];
  v11 = [(WFPinboardSessionManager *)self apiToken];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    v13 = [(WFPinboardSessionManager *)self apiToken];
    [v10 setValue:v13 forKey:@"auth_token"];
  }
  v14 = [v9 percentEncodedQuery];
  if ([v14 length])
  {
    v15 = [v9 percentEncodedQuery];
    v16 = [v15 stringByAppendingString:@"&"];
  }
  else
  {
    v16 = &stru_26F008428;
  }

  v17 = objc_msgSend(NSURL, "dc_queryStringWithQueryDictionary:", v10);
  v18 = [(__CFString *)v16 stringByAppendingString:v17];
  [v9 setPercentEncodedQuery:v18];

  id v19 = objc_alloc(MEMORY[0x263EFC5E8]);
  v20 = [v9 URL];
  v21 = (void *)[v19 initWithURL:v20];

  [v21 _setNonAppInitiated:1];
  v22 = [(WFPinboardSessionManager *)self apiToken];
  if ([v22 length]) {
    goto LABEL_7;
  }
  v27 = [(WFPinboardSessionManager *)self username];
  if (![v27 length])
  {

LABEL_7:
    goto LABEL_8;
  }
  v28 = [(WFPinboardSessionManager *)self password];
  uint64_t v29 = [v28 length];

  if (v29)
  {
    v36 = [(WFPinboardSessionManager *)self username];
    v39[0] = v36;
    v35 = [(WFPinboardSessionManager *)self password];
    v39[1] = v35;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
    v31 = [v30 componentsJoinedByString:@":"];
    v32 = [v31 dataUsingEncoding:4];
    v33 = [v32 base64EncodedStringWithOptions:0];

    v34 = [@"Basic " stringByAppendingString:v33];
    [v21 setValue:v34 forHTTPHeaderField:@"Authorization"];
  }
LABEL_8:
  v23 = [(WFPinboardSessionManager *)self session];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __71__WFPinboardSessionManager_authenticatedTaskWithURL_completionHandler___block_invoke;
  v37[3] = &unk_264E5EC38;
  id v38 = v6;
  id v24 = v6;
  v25 = [v23 dataTaskWithRequest:v21 completionHandler:v37];

  return v25;
}

void __71__WFPinboardSessionManager_authenticatedTaskWithURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v22[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (![v7 length])
  {
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15) {
      (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v9);
    }
    goto LABEL_7;
  }
  if ([v8 statusCode] != 401)
  {
    id v20 = v9;
    v17 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v20];
    id v16 = v20;

    uint64_t v18 = *(void *)(a1 + 32);
    if (v17)
    {
      id v19 = *(void (**)(void))(v18 + 16);
    }
    else
    {
      if (!v18)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v19 = *(void (**)(void))(v18 + 16);
    }
    v19();
    goto LABEL_13;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F08320];
    uint64_t v12 = WFLocalizedString(@"Your username and password or API token are incorrect.");
    v22[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    v14 = [v11 errorWithDomain:@"WFPinboardErrorDomain" code:1000 userInfo:v13];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v14);
  }
LABEL_7:
  id v16 = v9;
LABEL_14:
}

- (void)getModifiedDateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(WFPinboardSessionManager *)self baseURL];
  id v6 = [v5 URLByAppendingPathComponent:@"posts/update"];

  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __58__WFPinboardSessionManager_getModifiedDateWithCompletion___block_invoke;
  uint64_t v12 = &unk_264E5B148;
  v13 = self;
  id v14 = v4;
  id v7 = v4;
  id v8 = [(WFPinboardSessionManager *)self authenticatedTaskWithURL:v6 completionHandler:&v9];
  objc_msgSend(v8, "resume", v9, v10, v11, v12, v13);
}

void __58__WFPinboardSessionManager_getModifiedDateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v11)
  {
    id v6 = [*(id *)(a1 + 32) dateTimeFormatter];
    id v7 = [v11 objectForKey:@"update_time"];
    id v8 = [v6 dateFromString:v7];

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v8, v5);
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v5);
    }
  }
}

- (void)getBookmarksWithTags:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_opt_new();
  id v11 = [v9 componentsJoinedByString:@","];

  [v10 setValue:v11 forKey:@"tag"];
  if (a4)
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a4);
    [v10 setValue:v12 forKey:@"results"];
  }
  v13 = [(WFPinboardSessionManager *)self baseURL];
  id v14 = [v13 URLByAppendingPathComponent:@"posts/all"];

  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v14 resolvingAgainstBaseURL:0];
  id v16 = objc_msgSend(NSURL, "dc_queryStringWithQueryDictionary:", v10);
  [v15 setPercentEncodedQuery:v16];

  v17 = [v15 URL];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __66__WFPinboardSessionManager_getBookmarksWithTags_limit_completion___block_invoke;
  v20[3] = &unk_264E5E6B8;
  id v21 = v8;
  id v18 = v8;
  id v19 = [(WFPinboardSessionManager *)self authenticatedTaskWithURL:v17 completionHandler:v20];

  [v19 resume];
}

void __66__WFPinboardSessionManager_getBookmarksWithTags_limit_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v8)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = *(void (**)(void))(v6 + 16);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = *(void (**)(void))(v6 + 16);
  }
  v7();
LABEL_7:
}

- (void)addBookmark:(id)a3 withTitle:(id)a4 parameters:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_opt_new();
  uint64_t v15 = [v13 absoluteString];

  [v14 setValue:v15 forKey:@"url"];
  [v14 setValue:v12 forKey:@"description"];

  id v16 = [v10 objectForKey:@"extended"];
  [v14 setValue:v16 forKey:@"extended"];

  v17 = [v10 objectForKey:@"tags"];
  id v18 = [v17 componentsJoinedByString:@","];
  [v14 setValue:v18 forKey:@"tags"];

  id v19 = [(WFPinboardSessionManager *)self dateTimeFormatter];
  id v20 = [v10 objectForKey:@"dt"];
  id v21 = [v19 stringFromDate:v20];
  [v14 setValue:v21 forKey:@"dt"];

  v22 = [v10 objectForKey:@"replace"];

  if (v22)
  {
    v23 = [v10 objectForKey:@"replace"];
    if ([v23 BOOLValue]) {
      id v24 = @"yes";
    }
    else {
      id v24 = @"no";
    }
    [v14 setObject:v24 forKey:@"replace"];
  }
  v25 = [v10 objectForKey:@"shared"];

  if (v25)
  {
    v26 = [v10 objectForKey:@"shared"];
    if ([v26 BOOLValue]) {
      v27 = @"yes";
    }
    else {
      v27 = @"no";
    }
    [v14 setObject:v27 forKey:@"shared"];
  }
  v28 = [v10 objectForKey:@"toread"];

  if (v28)
  {
    uint64_t v29 = [v10 objectForKey:@"toread"];
    if ([v29 BOOLValue]) {
      v30 = @"yes";
    }
    else {
      v30 = @"no";
    }
    [v14 setObject:v30 forKey:@"toread"];
  }
  v31 = [(WFPinboardSessionManager *)self baseURL];
  v32 = [v31 URLByAppendingPathComponent:@"posts/add"];

  v33 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v32 resolvingAgainstBaseURL:0];
  v34 = objc_msgSend(NSURL, "dc_queryStringWithQueryDictionary:", v14);
  [v33 setPercentEncodedQuery:v34];

  v35 = [v33 URL];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __72__WFPinboardSessionManager_addBookmark_withTitle_parameters_completion___block_invoke;
  v38[3] = &unk_264E5E6B8;
  id v39 = v11;
  id v36 = v11;
  v37 = [(WFPinboardSessionManager *)self authenticatedTaskWithURL:v35 completionHandler:v38];

  [v37 resume];
}

void __72__WFPinboardSessionManager_addBookmark_withTitle_parameters_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 objectForKey:@"result_code"];
    id v8 = v7;
    if (v7)
    {
      char v9 = [v7 isEqualToString:@"done"];
      if (!v6 && (v9 & 1) == 0)
      {
        id v10 = (void *)MEMORY[0x263F087E8];
        uint64_t v14 = *MEMORY[0x263F08320];
        v15[0] = v8;
        id v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
        id v6 = [v10 errorWithDomain:@"WFPinboardErrorDomain" code:1001 userInfo:v11];
      }
    }
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      (*(void (**)(uint64_t, BOOL, id))(v12 + 16))(v12, v6 == 0, v6);
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v6);
    }
  }
}

- (WFPinboardSessionManager)initWithSession:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFPinboardSessionManager.m", 45, @"Invalid parameter not satisfying: %@", @"session" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)WFPinboardSessionManager;
  id v7 = [(WFPinboardSessionManager *)&v20 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_session, a3);
    uint64_t v9 = [NSURL URLWithString:@"https://api.pinboard.in/v1/"];
    baseURL = v8->_baseURL;
    v8->_baseURL = (NSURL *)v9;

    id v11 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    dateTimeFormatter = v8->_dateTimeFormatter;
    v8->_dateTimeFormatter = v11;

    uint64_t v13 = v8->_dateTimeFormatter;
    uint64_t v14 = [MEMORY[0x263EFFA18] timeZoneWithAbbreviation:@"UTC"];
    [(NSDateFormatter *)v13 setTimeZone:v14];

    uint64_t v15 = v8->_dateTimeFormatter;
    id v16 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSDateFormatter *)v15 setLocale:v16];

    [(NSDateFormatter *)v8->_dateTimeFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    v17 = v8;
  }

  return v8;
}

- (WFPinboardSessionManager)initWithSessionConfiguration:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFC640];
  if (a3)
  {
    id v5 = objc_msgSend(MEMORY[0x263EFC640], "sessionWithConfiguration:");
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x263EFC648], "wf_defaultSessionConfiguration");
    id v5 = [v4 sessionWithConfiguration:v6];
  }
  id v7 = [(WFPinboardSessionManager *)self initWithSession:v5];

  return v7;
}

- (WFPinboardSessionManager)init
{
  return [(WFPinboardSessionManager *)self initWithSessionConfiguration:0];
}

@end