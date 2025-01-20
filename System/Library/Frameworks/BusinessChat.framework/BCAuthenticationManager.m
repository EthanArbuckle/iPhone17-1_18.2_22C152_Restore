@interface BCAuthenticationManager
- (BCAuthenticationManager)initWithAuthenticationRequest:(id)a3;
- (BCOAuth2RequestProtocol)authenticationRequest;
- (uint64_t)processQueryItems:(void *)a3 completion:;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)exchangeCode:(void *)a3 completion:;
- (void)fetchTokenWithRequest:(id)a3 completion:(id)a4;
- (void)setAuthenticationRequest:(id)a3;
@end

@implementation BCAuthenticationManager

- (BCAuthenticationManager)initWithAuthenticationRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCAuthenticationManager;
  v6 = [(BCAuthenticationManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_authenticationRequest, a3);
  }

  return v7;
}

- (void)fetchTokenWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = LogCategory_Daemon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v9 = [v6 URL];
    v10 = [v9 baseURL];
    *(_DWORD *)buf = 138412290;
    v62 = v10;
    _os_log_impl(&dword_228C26000, v8, OS_LOG_TYPE_DEFAULT, "BCAuthenticationManager: fetchToken for URL: %@", buf, 0xCu);
  }
  id v11 = objc_alloc(MEMORY[0x263F08BA0]);
  v12 = [v6 URL];
  v13 = (void *)[v11 initWithURL:v12 resolvingAgainstBaseURL:0];

  v14 = [v13 queryItems];
  uint64_t v15 = [v14 count];

  if (!v15) {
    goto LABEL_44;
  }
  v16 = [v13 queryItems];
  int v17 = -[BCAuthenticationManager processQueryItems:completion:]((uint64_t)self, v16, v7);

  v18 = LogCategory_Daemon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    [v13 queryItems];
    v20 = v19 = self;
    *(_DWORD *)buf = 138412546;
    v62 = v20;
    __int16 v63 = 1024;
    int v64 = v17;
    _os_log_impl(&dword_228C26000, v18, OS_LOG_TYPE_DEFAULT, "BCAuthenticationManager: queryitems %@ processed: %d", buf, 0x12u);

    self = v19;
  }

  if ((v17 & 1) == 0)
  {
LABEL_44:
    v54 = v13;
    v21 = [v6 URL];
    -[NSURL fragments](v21);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    id v23 = v7;
    if (self)
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      v24 = [v22 allKeys];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v55 objects:buf count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        v53 = self;
        id v52 = v6;
        uint64_t v27 = *(void *)v56;
LABEL_10:
        uint64_t v28 = 0;
        while (1)
        {
          if (*(void *)v56 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v55 + 1) + 8 * v28);
          v30 = [v22 objectForKeyedSubscript:v29];
          if (v30)
          {
            if ([v29 isEqualToString:@"code"])
            {
              self = v53;
              -[BCAuthenticationManager exchangeCode:completion:](v53, v30, v23);
LABEL_22:

              int v31 = 1;
              id v6 = v52;
              goto LABEL_23;
            }
            if ([v29 isEqualToString:@"access_token"])
            {
              (*((void (**)(id, void *, void))v23 + 2))(v23, v30, 0);
              self = v53;
              goto LABEL_22;
            }
          }

          if (v26 == ++v28)
          {
            uint64_t v26 = [v24 countByEnumeratingWithState:&v55 objects:buf count:16];
            if (v26) {
              goto LABEL_10;
            }
            int v31 = 0;
            id v6 = v52;
            self = v53;
            v13 = v54;
            goto LABEL_24;
          }
        }
      }
      int v31 = 0;
LABEL_23:
      v13 = v54;
LABEL_24:
    }
    else
    {
      int v31 = 0;
    }
    v32 = (void (**)(void, void, void))v23;

    v33 = LogCategory_Daemon();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v62) = v31;
      _os_log_impl(&dword_228C26000, v33, OS_LOG_TYPE_DEFAULT, "BCAuthenticationManager: fragements processed: %d", buf, 8u);
    }

    if ((v31 & 1) == 0)
    {
      v34 = [v6 valueForHTTPHeaderField:@"Content-Type"];
      int v35 = [v34 isEqualToString:@"application/x-www-form-urlencoded"];

      if (v35)
      {
        v36 = [v6 HTTPBody];

        if (v36)
        {
          id v37 = [NSString alloc];
          v38 = [v6 HTTPBody];
          v39 = (void *)[v37 initWithData:v38 encoding:4];

          id v40 = objc_alloc_init(MEMORY[0x263F08BA0]);
          [v40 setQuery:v39];
          v41 = [v40 queryItems];
          v42 = self;
          v43 = v41;
          int v44 = -[BCAuthenticationManager processQueryItems:completion:]((uint64_t)v42, v41, v32);

          v45 = LogCategory_Daemon();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v62 = v39;
            __int16 v63 = 1024;
            int v64 = v44;
            _os_log_impl(&dword_228C26000, v45, OS_LOG_TYPE_DEFAULT, "BCAuthenticationManager: body %@ processed: %d", buf, 0x12u);
          }

          if (v44) {
            goto LABEL_40;
          }
        }
        else
        {
          v46 = LogCategory_Daemon();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_228C26000, v46, OS_LOG_TYPE_DEFAULT, "Request has Content-Type application/x-www-form-urlencoded but HTTPBody is empty.", buf, 2u);
          }
        }
      }
      id v47 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v59 = *MEMORY[0x263F08320];
      v60 = @"Missing access token from response";
      v48 = [NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      v49 = (void *)[v47 initWithDomain:@"com.apple.icloud.messages.business.authentication.error" code:0 userInfo:v48];

      v50 = LogCategory_Daemon();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        v51 = [v49 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v62 = v51;
        _os_log_error_impl(&dword_228C26000, v50, OS_LOG_TYPE_ERROR, "BCAuthenticationManager: not enough information to process: %@", buf, 0xCu);
      }
      ((void (**)(void, void, void *))v32)[2](v32, 0, v49);
    }
  }
LABEL_40:
}

- (uint64_t)processQueryItems:(void *)a3 completion:
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_20;
  }
  id v7 = LogCategory_Daemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228C26000, v7, OS_LOG_TYPE_DEFAULT, "BCAuthenticationManager: process query items", buf, 2u);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (!v9)
  {
    a1 = 0;
    goto LABEL_19;
  }
  uint64_t v10 = v9;
  v20 = (void *)a1;
  v21 = (void (**)(void, void, void))v6;
  id v22 = v5;
  uint64_t v11 = *(void *)v24;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v24 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      v14 = [v13 value];
      if (v14)
      {
        uint64_t v15 = [v13 name];
        int v16 = [v15 isEqualToString:@"code"];

        if (v16)
        {
          id v6 = v21;
          -[BCAuthenticationManager exchangeCode:completion:](v20, v14, v21);
        }
        else
        {
          int v17 = [v13 name];
          int v18 = [v17 isEqualToString:@"access_token"];

          if (!v18) {
            goto LABEL_12;
          }
          id v6 = v21;
          ((void (**)(void, void *, void))v21)[2](v21, v14, 0);
        }

        a1 = 1;
        id v5 = v22;
        goto LABEL_19;
      }
LABEL_12:
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v10) {
      continue;
    }
    break;
  }
  a1 = 0;
  id v6 = v21;
  id v5 = v22;
LABEL_19:

LABEL_20:
  return a1;
}

- (void)exchangeCode:(void *)a3 completion:
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  id v7 = [a1 authenticationRequest];
  id v8 = [v7 oauth2];

  uint64_t v9 = [v8 tokenExchangeURL];
  uint64_t v10 = LogCategory_Daemon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v9 absoluteString];
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v11;
    _os_log_impl(&dword_228C26000, v10, OS_LOG_TYPE_DEFAULT, "BCAuthenticationManager: exchange code url: %@", buf, 0xCu);
  }
  v12 = [v8 tokenExchangeBodyWithCode:v6];

  v13 = [v12 dataUsingEncoding:4];
  v14 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v9];
  [v14 setHTTPMethod:@"POST"];
  [v14 setHTTPBody:v13];
  [v14 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
  uint64_t v15 = (void *)MEMORY[0x263F08BF8];
  int v16 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  int v17 = [v15 sessionWithConfiguration:v16 delegate:a1 delegateQueue:0];

  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  id v22 = __51__BCAuthenticationManager_exchangeCode_completion___block_invoke;
  long long v23 = &unk_2648521A0;
  id v18 = v5;
  long long v24 = a1;
  id v25 = v18;
  v19 = [v17 dataTaskWithRequest:v14 completionHandler:&v20];
  objc_msgSend(v19, "resume", v20, v21, v22, v23);
}

void __51__BCAuthenticationManager_exchangeCode_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id v8 = LogCategory_Daemon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228C26000, v8, OS_LOG_TYPE_DEFAULT, "BCAuthenticationManager: exchange code response received", buf, 2u);
  }

  if (v7)
  {
    uint64_t v9 = LogCategory_Daemon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v7;
      _os_log_impl(&dword_228C26000, v9, OS_LOG_TYPE_DEFAULT, "BCAuthenticationManager: failed to retrieve token: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v6)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(a1 + 40);
    id v12 = v6;
    v13 = v10;
    if (v11)
    {
      v14 = LogCategory_Daemon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v12;
        _os_log_impl(&dword_228C26000, v14, OS_LOG_TYPE_DEFAULT, "BCAuthenticationManager: access token for data: %@", buf, 0xCu);
      }

      id v30 = 0;
      uint64_t v15 = [MEMORY[0x263F08900] JSONObjectWithData:v12 options:1 error:&v30];
      id v16 = v30;
      if (v16)
      {
        int v17 = LogCategory_Daemon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = [v16 localizedDescription];
          *(_DWORD *)buf = 138412290;
          id v36 = v18;
          _os_log_impl(&dword_228C26000, v17, OS_LOG_TYPE_DEFAULT, "BCAuthenticationManager: error serializing data to JSON: %@", buf, 0xCu);
        }
        v13[2](v13, 0, v16);
      }
      else
      {
        long long v23 = [v15 objectForKeyedSubscript:@"access_token"];
        if (v23)
        {
          ((void (**)(id, void *, id))v13)[2](v13, v23, 0);
        }
        else
        {
          id v24 = objc_alloc(MEMORY[0x263F087E8]);
          uint64_t v33 = *MEMORY[0x263F08320];
          v34 = @"Missing access token from response";
          id v25 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
          long long v26 = (void *)[v24 initWithDomain:@"com.apple.icloud.messages.business.authentication.error" code:2 userInfo:v25];

          uint64_t v27 = LogCategory_Daemon();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            uint64_t v29 = [v26 localizedDescription];
            *(_DWORD *)buf = 138412290;
            id v36 = v29;
            _os_log_error_impl(&dword_228C26000, v27, OS_LOG_TYPE_ERROR, "BCAuthenticationManager: cannot parse access_token: %@", buf, 0xCu);
          }
          v13[2](v13, 0, v26);
        }
      }
    }
  }
  else
  {
    id v19 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v31 = *MEMORY[0x263F08320];
    v32 = @"Empty data received";
    uint64_t v20 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    uint64_t v21 = (void *)[v19 initWithDomain:@"com.apple.icloud.messages.business.authentication.error" code:0 userInfo:v20];

    id v22 = LogCategory_Daemon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = [v21 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v36 = v28;
      _os_log_error_impl(&dword_228C26000, v22, OS_LOG_TYPE_ERROR, "BCAuthenticationManager: cannot parse access_token: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  uint64_t v9 = (void (**)(id, void, void *))a5;
  id v6 = [a4 protectionSpace];
  uint64_t v7 = [v6 serverTrust];

  if (v7)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F08BB8]) initWithTrust:v7];
    v9[2](v9, 0, v8);
  }
  else
  {
    v9[2](v9, 0, 0);
  }
}

- (BCOAuth2RequestProtocol)authenticationRequest
{
  return self->_authenticationRequest;
}

- (void)setAuthenticationRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end