@interface MSOAuthTokenHandler
+ (id)tokenHandlerWithConfiguration:(id)a3 existingCredential:(id)a4 URLSessionConfiguration:(id)a5 parentNetworkActivity:(id)a6;
- (CMSAuthenticationConfiguration)authorizationConfiguration;
- (CMSAuthenticationCredential)authorizationCredential;
- (CMSNetworkActivity)networkActivity;
- (CMSNetworkActivity)parentNetworkActivity;
- (MSOAuthTokenHandler)initWithConfiguration:(id)a3 existingCredential:(id)a4 URLSessionConfiguration:(id)a5 parentNetworkActivity:(id)a6;
- (NSURLSessionConfiguration)URLSessionConfiguration;
- (void)fetchTokens:(id)a3;
- (void)performTokenFetchTaskWithSession:(id)a3 bodyString:(id)a4 completionHandler:(id)a5;
- (void)performTokenGrantRequestWithSession:(id)a3 completionHandler:(id)a4;
- (void)performTokenRefreshWithSession:(id)a3 completionHandler:(id)a4;
- (void)setNetworkActivity:(id)a3;
@end

@implementation MSOAuthTokenHandler

+ (id)tokenHandlerWithConfiguration:(id)a3 existingCredential:(id)a4 URLSessionConfiguration:(id)a5 parentNetworkActivity:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[MSOAuthTokenHandler alloc] initWithConfiguration:v12 existingCredential:v11 URLSessionConfiguration:v10 parentNetworkActivity:v9];

  return v13;
}

- (MSOAuthTokenHandler)initWithConfiguration:(id)a3 existingCredential:(id)a4 URLSessionConfiguration:(id)a5 parentNetworkActivity:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MSOAuthTokenHandler;
  v15 = [(MSOAuthTokenHandler *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_authorizationConfiguration, a3);
    objc_storeStrong((id *)&v16->_authorizationCredential, a4);
    objc_storeStrong((id *)&v16->_URLSessionConfiguration, a5);
    objc_storeStrong((id *)&v16->_parentNetworkActivity, a6);
  }

  return v16;
}

- (void)performTokenFetchTaskWithSession:(id)a3 bodyString:(id)a4 completionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v28 = a3;
  id v10 = _MSLogingFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v8;
    _os_log_impl(&dword_225D52000, v10, OS_LOG_TYPE_INFO, "bodyString: %@", buf, 0xCu);
  }

  id v11 = (void *)MEMORY[0x263F089E0];
  id v12 = [(CMSAuthenticationConfiguration *)self->_authorizationConfiguration authorizationURL];
  id v13 = [v11 requestWithURL:v12];

  [v13 setHTTPMethod:@"POST"];
  [v13 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
  id v14 = NSString;
  v15 = [(CMSAuthenticationConfiguration *)self->_authorizationConfiguration clientID];
  v16 = [(CMSAuthenticationConfiguration *)self->_authorizationConfiguration clientSecret];
  v17 = [v14 stringWithFormat:@"%@:%@", v15, v16];

  objc_super v18 = [v17 dataUsingEncoding:4];
  v19 = [v18 base64EncodedStringWithOptions:0];
  v20 = [NSString stringWithFormat:@"Basic %@", v19];
  [v13 setValue:v20 forHTTPHeaderField:@"Authorization"];
  [v8 dataUsingEncoding:4];
  v21 = v27 = v8;
  [v13 setHTTPBody:v21];

  v22 = [MEMORY[0x263EFF910] now];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke;
  v29[3] = &unk_2647752B8;
  id v30 = v22;
  id v31 = v9;
  id v23 = v9;
  id v24 = v22;
  v25 = [v28 dataTaskWithRequest:v13 completionHandler:v29];

  v26 = [(MSOAuthTokenHandler *)self networkActivity];
  [v26 associateWithTask:v25];

  [v25 resume];
}

void __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = a4;
  id v10 = _MSLogingFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v75 = v8;
    __int16 v76 = 2112;
    id v77 = v7;
    __int16 v78 = 2112;
    uint64_t v79 = v9;
    _os_log_impl(&dword_225D52000, v10, OS_LOG_TYPE_INFO, "task complete: resp: %@ data: %@ error: %@", buf, 0x20u);
  }

  if (v9)
  {
    id v11 = _MSLogingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke_cold_5();
    }
  }
  id v12 = 0;
  if (!v7 || !v8)
  {
    v19 = 0;
    id v31 = 0;
    v32 = 0;
    id v33 = 0;
    uint64_t v34 = 0;
    goto LABEL_45;
  }
  id v13 = v8;
  if ([v13 statusCode] == 200)
  {
    id v63 = 0;
    id v14 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v63];
    v58 = v14;
    id v59 = v63;
    if (v14)
    {
      uint64_t v15 = [v14 objectForKeyedSubscript:@"token_type"];
      objc_opt_class();
      v57 = (void *)v15;
      if (objc_opt_isKindOfClass())
      {
        id v12 = [v14 objectForKeyedSubscript:@"access_token"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v16 = [v14 objectForKeyedSubscript:@"scope"];
          if (v16)
          {
            v17 = (void *)v16;
            objc_opt_class();
            v61 = v17;
            if (objc_opt_isKindOfClass()) {
              goto LABEL_19;
            }
            objc_super v18 = _MSLogingFacility();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke_cold_3();
            }
          }
          v61 = 0;
LABEL_19:
          v19 = [v14 objectForKeyedSubscript:@"refresh_token"];
          if (v19)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v20 = v19;
              v21 = _MSLogingFacility();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke_cold_2();
              }

              v19 = 0;
            }
          }
          v22 = [v14 objectForKeyedSubscript:@"expires_in"];
          if (!v22 || (objc_opt_respondsToSelector() & 1) == 0 || ([v22 doubleValue], v23 <= 0.0))
          {
            id v31 = 0;
LABEL_42:

            if (v12)
            {
              v32 = v57;
              id v33 = v61;
              uint64_t v34 = +[CMSAuthenticationCredential authCredentialWithToken:v12 tokenType:v57 expirationDate:v31 scope:v61 refreshToken:v19];
            }
            else
            {
              uint64_t v34 = 0;
              v32 = v57;
              id v33 = v61;
            }
            goto LABEL_45;
          }
          double v24 = v23;
          v25 = [v13 valueForHTTPHeaderField:@"Date"];
          if (!v25) {
            goto LABEL_29;
          }
          id v26 = objc_alloc_init(MEMORY[0x263F08790]);
          [v26 setDateFormat:@"EE, dd LLL yyyy HH:mm:ss zz"];
          uint64_t v54 = v9;
          v27 = v12;
          id v28 = v19;
          v29 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US"];
          [v26 setLocale:v29];

          v19 = v28;
          id v12 = v27;
          uint64_t v9 = v54;
          uint64_t v55 = [v26 dateFromString:v25];

          id v30 = (id)v55;
          if (!v55) {
LABEL_29:
          }
            id v30 = *(id *)(a1 + 32);
          v56 = v30;
          id v31 = [v30 dateByAddingTimeInterval:v24];

LABEL_41:
          goto LABEL_42;
        }
        v53 = (void *)MEMORY[0x263F087E8];
        v72 = @"MSUserInfoErrorStringKey";
        v73 = @"No access_token in response data";
        v22 = [NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
        uint64_t v42 = [v53 errorWithDomain:@"com.apple.mediasetup.errorDomain" code:8 userInfo:v22];
        v61 = 0;
        id v31 = 0;
        v19 = 0;
LABEL_40:
        v25 = (void *)v9;
        uint64_t v9 = v42;
        goto LABEL_41;
      }
      v43 = (void *)MEMORY[0x263F087E8];
      v70 = @"MSUserInfoErrorStringKey";
      v71 = @"No token_type in response data";
      v22 = [NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      uint64_t v42 = [v43 errorWithDomain:@"com.apple.mediasetup.errorDomain" code:8 userInfo:v22];
      v61 = 0;
    }
    else
    {
      v40 = _MSLogingFacility();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke_cold_1();
      }

      v41 = (void *)MEMORY[0x263F087E8];
      v68 = @"MSUserInfoErrorStringKey";
      v69 = @"unable to parse json data";
      v22 = [NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      uint64_t v42 = [v41 errorWithDomain:@"com.apple.mediasetup.errorDomain" code:8 userInfo:v22];
      v61 = 0;
      v57 = 0;
    }
    id v31 = 0;
    v19 = 0;
    id v12 = 0;
    goto LABEL_40;
  }
  v35 = objc_msgSend(NSString, "stringWithFormat:", @"non-200 status code: %ld", objc_msgSend(v13, "statusCode"));
  v36 = _MSLogingFacility();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke_cold_4(v13, v36);
  }

  v37 = (void *)MEMORY[0x263F087E8];
  v66 = @"MSUserInfoErrorStringKey";
  v67 = v35;
  v38 = [NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
  uint64_t v39 = [v37 errorWithDomain:@"com.apple.mediasetup.errorDomain" code:8 userInfo:v38];

  id v12 = 0;
  v19 = 0;
  v32 = 0;
  id v33 = 0;
  uint64_t v34 = 0;
  uint64_t v9 = v39;
  id v31 = 0;
LABEL_45:
  if (!(v34 | v9))
  {
    v60 = (void *)MEMORY[0x263F087E8];
    v62 = v31;
    v64 = @"MSUserInfoErrorStringKey";
    v65 = @"could not create credential from response data";
    [NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    v44 = v12;
    v45 = v19;
    v46 = v33;
    v47 = v32;
    id v48 = v8;
    id v49 = v7;
    v51 = uint64_t v50 = a1;
    uint64_t v52 = [v60 errorWithDomain:@"com.apple.mediasetup.errorDomain" code:8 userInfo:v51];

    a1 = v50;
    id v7 = v49;
    id v8 = v48;
    v32 = v47;
    id v33 = v46;
    v19 = v45;
    id v12 = v44;
    uint64_t v9 = v52;
    id v31 = v62;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)performTokenGrantRequestWithSession:(id)a3 completionHandler:(id)a4
{
  v6 = (void *)MEMORY[0x263F089D8];
  id v7 = a4;
  id v8 = a3;
  id v13 = [v6 string];
  [v13 appendString:@"grant_type=client_credentials"];
  uint64_t v9 = [(CMSAuthenticationConfiguration *)self->_authorizationConfiguration scope];

  if (v9)
  {
    id v10 = [(CMSAuthenticationConfiguration *)self->_authorizationConfiguration scope];
    id v11 = [v10 formEncodedString];
    [v13 appendFormat:@"&scope=%@", v11];
  }
  id v12 = [NSString stringWithString:v13];
  [(MSOAuthTokenHandler *)self performTokenFetchTaskWithSession:v8 bodyString:v12 completionHandler:v7];
}

- (void)performTokenRefreshWithSession:(id)a3 completionHandler:(id)a4
{
  v6 = (void *)MEMORY[0x263F089D8];
  id v7 = a4;
  id v8 = a3;
  id v15 = [v6 string];
  [v15 appendString:@"grant_type=refresh_token"];
  uint64_t v9 = [(CMSAuthenticationCredential *)self->_authorizationCredential refreshToken];
  id v10 = [v9 formEncodedString];
  [v15 appendFormat:@"&refresh_token=%@", v10];

  id v11 = [(CMSAuthenticationCredential *)self->_authorizationCredential scope];

  if (v11)
  {
    id v12 = [(CMSAuthenticationCredential *)self->_authorizationCredential scope];
    id v13 = [v12 formEncodedString];
    [v15 appendFormat:@"&scope=%@", v13];
  }
  id v14 = [NSString stringWithString:v15];
  [(MSOAuthTokenHandler *)self performTokenFetchTaskWithSession:v8 bodyString:v14 completionHandler:v7];
}

- (void)fetchTokens:(id)a3
{
  id v4 = a3;
  URLSessionConfiguration = self->_URLSessionConfiguration;
  if (URLSessionConfiguration)
  {
    v6 = URLSessionConfiguration;
  }
  else
  {
    v6 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
  }
  id v7 = v6;
  id v8 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v6];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __35__MSOAuthTokenHandler_fetchTokens___block_invoke;
  v28[3] = &unk_2647752E0;
  id v9 = v4;
  id v30 = v9;
  id v10 = v8;
  id v29 = v10;
  id v11 = (void *)MEMORY[0x22A63F920](v28);
  authorizationCredential = self->_authorizationCredential;
  if (authorizationCredential
    && ([(CMSAuthenticationCredential *)authorizationCredential refreshToken],
        id v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v13))
  {
    id v14 = objc_alloc(MEMORY[0x263F32800]);
    id v15 = [(MSOAuthTokenHandler *)self parentNetworkActivity];
    uint64_t v16 = (void *)[v14 initWithLabel:2 parentActivity:v15];
    [(MSOAuthTokenHandler *)self setNetworkActivity:v16];

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __35__MSOAuthTokenHandler_fetchTokens___block_invoke_2;
    v25[3] = &unk_264775330;
    v17 = &v27;
    v25[4] = self;
    v27 = v11;
    id v26 = v10;
    id v18 = v11;
    [(MSOAuthTokenHandler *)self performTokenRefreshWithSession:v26 completionHandler:v25];
  }
  else
  {
    id v19 = objc_alloc(MEMORY[0x263F32800]);
    v20 = [(MSOAuthTokenHandler *)self parentNetworkActivity];
    v21 = (void *)[v19 initWithLabel:1 parentActivity:v20];
    [(MSOAuthTokenHandler *)self setNetworkActivity:v21];

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __35__MSOAuthTokenHandler_fetchTokens___block_invoke_4;
    v23[3] = &unk_264775308;
    v17 = &v24;
    v23[4] = self;
    double v24 = v11;
    id v22 = v11;
    [(MSOAuthTokenHandler *)self performTokenGrantRequestWithSession:v10 completionHandler:v23];
  }
}

uint64_t __35__MSOAuthTokenHandler_fetchTokens___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 invalidateAndCancel];
}

void __35__MSOAuthTokenHandler_fetchTokens___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) networkActivity];
    [v7 completeActivity:2];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263F32800]);
    id v9 = [*(id *)(a1 + 32) networkActivity];
    id v10 = (void *)[v8 initWithLabel:1 parentActivity:v9];

    id v11 = [*(id *)(a1 + 32) networkActivity];
    [v11 completeActivity:3];

    [*(id *)(a1 + 32) setNetworkActivity:v10];
    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __35__MSOAuthTokenHandler_fetchTokens___block_invoke_3;
    v14[3] = &unk_264775308;
    v14[4] = v12;
    id v15 = *(id *)(a1 + 48);
    [v12 performTokenGrantRequestWithSession:v13 completionHandler:v14];
  }
}

void __35__MSOAuthTokenHandler_fetchTokens___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v9 = a2;
  id v7 = [v5 networkActivity];
  if (v9) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 3;
  }
  [v7 completeActivity:v8];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __35__MSOAuthTokenHandler_fetchTokens___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v9 = a2;
  id v7 = [v5 networkActivity];
  if (v9) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 3;
  }
  [v7 completeActivity:v8];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (CMSAuthenticationConfiguration)authorizationConfiguration
{
  return (CMSAuthenticationConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (CMSAuthenticationCredential)authorizationCredential
{
  return (CMSAuthenticationCredential *)objc_getProperty(self, a2, 16, 1);
}

- (NSURLSessionConfiguration)URLSessionConfiguration
{
  return (NSURLSessionConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (CMSNetworkActivity)parentNetworkActivity
{
  return self->_parentNetworkActivity;
}

- (CMSNetworkActivity)networkActivity
{
  return self->_networkActivity;
}

- (void)setNetworkActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkActivity, 0);
  objc_storeStrong((id *)&self->_parentNetworkActivity, 0);
  objc_storeStrong((id *)&self->_URLSessionConfiguration, 0);
  objc_storeStrong((id *)&self->_authorizationCredential, 0);

  objc_storeStrong((id *)&self->_authorizationConfiguration, 0);
}

void __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_225D52000, v0, v1, "unable to parse json data: %@", v2, v3, v4, v5, v6);
}

void __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_225D52000, v0, v1, "Unusable refresh_token %@", v2, v3, v4, v5, v6);
}

void __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_225D52000, v0, v1, "Unusable scope %@", v2, v3, v4, v5, v6);
}

void __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke_cold_4(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  [a1 statusCode];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_225D52000, a2, OS_LOG_TYPE_ERROR, "non-200 status code: %ld", v3, 0xCu);
}

void __85__MSOAuthTokenHandler_performTokenFetchTaskWithSession_bodyString_completionHandler___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_225D52000, v0, v1, "Task failed: Error: %@", v2, v3, v4, v5, v6);
}

@end