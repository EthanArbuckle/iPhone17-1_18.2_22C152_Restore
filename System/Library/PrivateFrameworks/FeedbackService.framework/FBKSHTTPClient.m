@interface FBKSHTTPClient
- (FBKSHTTPClient)init;
- (NSHTTPCookie)seedPortalSession;
- (NSURLSession)session;
- (id)formattedRequestHeader:(id)a3 session:(id)a4 cookies:(id)a5;
- (id)logHTTPErrorWithResponse:(id)a3 withData:(id)a4 fromRequest:(id)a5;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)dataForURL:(id)a3 success:(id)a4 error:(id)a5;
- (void)dataForURLRequest:(id)a3 success:(id)a4 error:(id)a5;
- (void)dataForURLRequest:(id)a3 successWithResponse:(id)a4 error:(id)a5;
- (void)jsonForURLRequest:(id)a3 success:(id)a4 error:(id)a5;
- (void)setSeedPortalSession:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation FBKSHTTPClient

- (FBKSHTTPClient)init
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)FBKSHTTPClient;
  v2 = [(FBKSHTTPClient *)&v27 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFC648] defaultSessionConfiguration];
    v4 = (void *)[v3 copy];

    [v4 setURLCache:0];
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [v5 infoDictionary];

    v26 = v6;
    uint64_t v7 = [v6 objectForKey:@"CFBundleShortVersionString"];
    uint64_t v8 = [v6 objectForKey:*MEMORY[0x263EFFB70]];
    memset(&v30, 0, 512);
    uname(&v30);
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s", v30.machine);
    v10 = @"Unknown";
    v24 = (void *)v8;
    v25 = (void *)v7;
    if (v8) {
      v10 = (__CFString *)v8;
    }
    if (v7) {
      v10 = (__CFString *)v7;
    }
    v11 = v10;
    v12 = +[FBKSSharedConstants productVersion];
    v13 = +[FBKSSharedConstants swVers];
    v14 = NSString;
    v15 = [MEMORY[0x263F08AB0] processInfo];
    v16 = [v15 processName];
    v17 = [v14 stringWithFormat:@"%@/%@ (Feedback Framework) (%@ %@) (Build %@) (Model %@)", v16, v11, @"iOS", v12, v13, v9];

    v18 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:6];
    v28[0] = @"X-SP-API";
    v19 = objc_msgSend(NSString, "stringWithFormat:", @"%.1f", 4.3);
    v29[0] = v19;
    v29[1] = v17;
    v28[1] = @"User-Agent";
    v28[2] = @"Accept";
    v28[3] = @"Content-Type";
    v29[2] = @"application/json";
    v29[3] = @"application/json";
    v20 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:4];
    [v18 addEntriesFromDictionary:v20];

    [v4 setHTTPAdditionalHeaders:v18];
    uint64_t v21 = [MEMORY[0x263EFC640] sessionWithConfiguration:v4 delegate:v2 delegateQueue:0];
    session = v2->_session;
    v2->_session = (NSURLSession *)v21;
  }
  return v2;
}

- (void)jsonForURLRequest:(id)a3 success:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__FBKSHTTPClient_jsonForURLRequest_success_error___block_invoke;
  v14[3] = &unk_2653132A0;
  id v15 = v8;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__FBKSHTTPClient_jsonForURLRequest_success_error___block_invoke_46;
  v12[3] = &unk_2653132C8;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(FBKSHTTPClient *)self dataForURLRequest:a3 success:v14 error:v12];
}

void __50__FBKSHTTPClient_jsonForURLRequest_success_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32))
  {
    id v8 = 0;
    v3 = [MEMORY[0x263F08900] JSONObjectWithData:a2 options:0 error:&v8];
    id v4 = v8;
    if (v4)
    {
      v5 = Log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __50__FBKSHTTPClient_jsonForURLRequest_success_error___block_invoke_cold_1();
      }

      uint64_t v6 = *(void *)(a1 + 40);
      if (!v6) {
        goto LABEL_9;
      }
      uint64_t v7 = *(void (**)(void))(v6 + 16);
    }
    else
    {
      uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v7();
LABEL_9:
  }
}

uint64_t __50__FBKSHTTPClient_jsonForURLRequest_success_error___block_invoke_46(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dataForURLRequest:(id)a3 success:(id)a4 error:(id)a5
{
  id v8 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__FBKSHTTPClient_dataForURLRequest_success_error___block_invoke;
  v10[3] = &unk_2653132F0;
  id v11 = v8;
  id v9 = v8;
  [(FBKSHTTPClient *)self dataForURLRequest:a3 successWithResponse:v10 error:a5];
}

uint64_t __50__FBKSHTTPClient_dataForURLRequest_success_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)formattedRequestHeader:(id)a3 session:(id)a4 cookies:(id)a5
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v43 = a5;
  id v9 = (void *)MEMORY[0x263F089D8];
  id v10 = [v7 HTTPMethod];
  id v11 = [v7 URL];
  v12 = [v11 debugDescription];
  id v13 = [v9 stringWithFormat:@"%@ %@\n", v10, v12];

  v44 = v7;
  v14 = [v7 URL];
  id v15 = [v14 host];
  [v13 appendFormat:@"Host: %@\n", v15];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v45 = v8;
  id v16 = [v8 configuration];
  v17 = [v16 HTTPAdditionalHeaders];

  uint64_t v18 = [v17 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v55 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        v23 = [v45 configuration];
        v24 = [v23 HTTPAdditionalHeaders];
        v25 = [v24 objectForKeyedSubscript:v22];
        [v13 appendFormat:@"%@: %@\n", v22, v25];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v19);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v26 = v43;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v51 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        v32 = [v31 name];
        v33 = [v31 value];
        [v13 appendFormat:@"%@: %@\n", v32, v33];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v28);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v34 = [v44 allHTTPHeaderFields];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v36; ++k)
      {
        if (*(void *)v47 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = *(void *)(*((void *)&v46 + 1) + 8 * k);
        v40 = [v44 valueForHTTPHeaderField:v39];
        [v13 appendFormat:@"%@: %@\n", v39, v40];
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v36);
  }

  v41 = [NSString stringWithFormat:@"%@", v13];

  return v41;
}

- (void)dataForURLRequest:(id)a3 successWithResponse:(id)a4 error:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = Log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = [v8 HTTPMethod];
    id v13 = [v8 URL];
    v14 = [v13 path];
    *(_DWORD *)buf = 138543618;
    uint64_t v29 = v12;
    __int16 v30 = 2114;
    uint64_t v31 = v14;
    _os_log_impl(&dword_24DF86000, v11, OS_LOG_TYPE_INFO, "-> %{public}@ %{public}@", buf, 0x16u);
  }
  id v15 = [(FBKSHTTPClient *)self session];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __62__FBKSHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke;
  v23 = &unk_265313368;
  v24 = self;
  id v25 = v8;
  id v26 = v10;
  id v27 = v9;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  uint64_t v19 = [v15 dataTaskWithRequest:v18 completionHandler:&v20];

  objc_msgSend(v19, "resume", v20, v21, v22, v23, v24);
}

void __62__FBKSHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v40 = a4;
  id v8 = v7;
  id v9 = (void *)MEMORY[0x263EFC5D0];
  id v10 = [v8 allHeaderFields];
  uint64_t v39 = v8;
  id v11 = [v8 URL];
  v12 = [v9 cookiesWithResponseHeaderFields:v10 forURL:v11];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v55;
    id v38 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v55 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        uint64_t v19 = [v18 name];
        if ([v19 isEqualToString:@"_seedportal_session"])
        {

LABEL_12:
          [*(id *)(a1 + 32) setSeedPortalSession:v18];
          id v6 = v38;
          goto LABEL_13;
        }
        uint64_t v20 = [v18 name];
        int v21 = [v20 isEqualToString:@"_seedportal_session_uat"];

        if (v21) {
          goto LABEL_12;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v54 objects:v64 count:16];
      id v6 = v38;
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  uint64_t v22 = Log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = [*(id *)(a1 + 40) HTTPMethod];
    v24 = [*(id *)(a1 + 40) URL];
    id v25 = [v24 path];
    uint64_t v26 = [v39 statusCode];
    *(_DWORD *)buf = 138543874;
    v59 = v23;
    __int16 v60 = 2114;
    uint64_t v61 = v25;
    __int16 v62 = 2048;
    uint64_t v63 = v26;
    _os_log_impl(&dword_24DF86000, v22, OS_LOG_TYPE_INFO, "<- %{public}@ %{public}@ %li", buf, 0x20u);
  }
  if (v40)
  {
    if ([v40 code] == -999)
    {
      id v27 = [v40 domain];
      int v28 = [v27 isEqualToString:*MEMORY[0x263F08570]];

      if (v28)
      {
        uint64_t v29 = Log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v30 = [*(id *)(a1 + 40) URL];
          uint64_t v31 = [v30 path];
          *(_DWORD *)buf = 138543362;
          v59 = v31;
          _os_log_impl(&dword_24DF86000, v29, OS_LOG_TYPE_DEFAULT, "Request was cancelled, ignoring error on [%{public}@]", buf, 0xCu);
        }
        goto LABEL_22;
      }
    }
    uint64_t v29 = _os_activity_create(&dword_24DF86000, "HTTP Error", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__FBKSHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke_63;
    block[3] = &unk_265313318;
    block[4] = *(void *)(a1 + 32);
    id v49 = v39;
    id v50 = v6;
    id v51 = *(id *)(a1 + 40);
    id v52 = v40;
    id v53 = *(id *)(a1 + 48);
    os_activity_apply(v29, block);

    uint64_t v32 = v49;
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  v33 = objc_msgSend(NSString, "stringWithFormat:", @"%li", objc_msgSend(v39, "statusCode"));
  if ([v33 characterAtIndex:0] == 50)
  {
  }
  else
  {
    uint64_t v34 = [v39 statusCode];

    if (v34 != 302)
    {
      uint64_t v29 = _os_activity_create(&dword_24DF86000, "HTTP Error", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __62__FBKSHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke_2;
      v42[3] = &unk_265313340;
      id v36 = v6;
      uint64_t v37 = *(void *)(a1 + 32);
      id v43 = v36;
      uint64_t v44 = v37;
      id v45 = v39;
      id v46 = *(id *)(a1 + 40);
      id v47 = *(id *)(a1 + 48);
      os_activity_apply(v29, v42);

      uint64_t v32 = v43;
      goto LABEL_21;
    }
  }
  uint64_t v35 = *(void *)(a1 + 56);
  if (v35) {
    (*(void (**)(uint64_t, id, void *))(v35 + 16))(v35, v6, v39);
  }
LABEL_23:
}

void __62__FBKSHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke_63(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) logHTTPErrorWithResponse:*(void *)(a1 + 40) withData:*(void *)(a1 + 48) fromRequest:*(void *)(a1 + 56)];
  id v2 = *(id *)(a1 + 64);
  if (v10)
  {
    v3 = [*(id *)(a1 + 64) userInfo];

    if (v3)
    {
      id v4 = (void *)MEMORY[0x263EFF9A0];
      v5 = [*(id *)(a1 + 64) userInfo];
      v3 = [v4 dictionaryWithDictionary:v5];

      [v3 setObject:v10 forKeyedSubscript:@"SeedingHTTPRequestDetails"];
    }
    id v6 = (void *)MEMORY[0x263F087E8];
    id v7 = [*(id *)(a1 + 64) domain];
    uint64_t v8 = objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, objc_msgSend(*(id *)(a1 + 64), "code"), v3);

    id v2 = (id)v8;
  }
  uint64_t v9 = *(void *)(a1 + 72);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v2);
  }
}

void __62__FBKSHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v24 = 0;
    v3 = [MEMORY[0x263F08900] JSONObjectWithData:v2 options:0 error:&v24];
    id v4 = v24;
    v5 = 0;
    if (FBKSIsValidErrorResponse(v3))
    {
      id v6 = v3;
      id v7 = (void *)MEMORY[0x263EFF980];
      uint64_t v8 = [v6 objectForKeyedSubscript:@"errors"];
      uint64_t v9 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = objc_msgSend(v6, "objectForKeyedSubscript:", @"errors", 0);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = FBKSErrorForDict(*(void **)(*((void *)&v20 + 1) + 8 * v14));
            if (v15) {
              [v9 addObject:v15];
            }

            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v12);
      }

      v5 = (void *)[v9 copy];
    }
  }
  else
  {
    v5 = 0;
  }
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
  id v17 = v16;
  if (v5) {
    [v16 setObject:v5 forKey:@"FBKSSeedPortalErrorsKey"];
  }
  id v18 = [*(id *)(a1 + 40) logHTTPErrorWithResponse:*(void *)(a1 + 48) withData:*(void *)(a1 + 32) fromRequest:*(void *)(a1 + 56)];
  if (v18) {
    [v17 setObject:v18 forKeyedSubscript:@"SeedingHTTPRequestDetails"];
  }
  if (*(void *)(a1 + 64))
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"HTTPErrorDomain", objc_msgSend(*(id *)(a1 + 48), "statusCode"), v17);
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)dataForURL:(id)a3 success:(id)a4 error:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x263EFC630];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 requestWithURL:a3];
  [(FBKSHTTPClient *)self dataForURLRequest:v11 success:v10 error:v9];
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v4 = a4;
  v5 = Log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[FBKSHTTPClient URLSession:didBecomeInvalidWithError:]();
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(id, uint64_t, void))a5;
  int v8 = +[FBKSSharedConstants environment];
  if (FBKSHasInternalUI() && (v8 & 0xFFFFFFFD) == 1)
  {
    id v9 = Log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v31 = 0;
      id v10 = "Running in development/stagingDev mode; skipping pinning check (internal only).";
      id v11 = (uint8_t *)&v31;
LABEL_13:
      _os_log_impl(&dword_24DF86000, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  uint64_t v12 = [v6 protectionSpace];
  uint64_t v13 = [v12 host];
  uint64_t v14 = +[FBKSSharedConstants appleSeedURL];
  uint64_t v15 = [v14 host];
  char v16 = [v13 isEqualToString:v15];

  if ((v16 & 1) == 0)
  {
    id v9 = Log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v10 = "Connecting to other server; skipping pinning check.";
      id v11 = buf;
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
  id v17 = [v6 protectionSpace];
  id v18 = [v17 authenticationMethod];
  int v19 = [v18 isEqualToString:*MEMORY[0x263EFC5A0]];

  if (!v19)
  {
LABEL_15:
    v7[2](v7, 1, 0);
    goto LABEL_16;
  }
  long long v20 = +[FBKSSharedConstants appleSeedURL];
  long long v21 = [v20 host];

  uint64_t AppleSSLPinned = SecPolicyCreateAppleSSLPinned();
  if (AppleSSLPinned)
  {
    long long v23 = (const void *)AppleSSLPinned;
    id v24 = [v6 protectionSpace];
    id v25 = (__SecTrust *)[v24 serverTrust];

    LODWORD(v24) = SecTrustSetPolicies(v25, v23);
    CFRelease(v23);
    if (!v24)
    {
      CFErrorRef error = 0;
      if (SecTrustEvaluateWithError(v25, &error))
      {
        uint64_t v26 = [MEMORY[0x263EFC610] credentialForTrust:v25];
        ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v26);

        goto LABEL_10;
      }
      if (error)
      {
        id v27 = error;
        int v28 = Log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[FBKSHTTPClient URLSession:didReceiveChallenge:completionHandler:](v27, v28);
        }

        CFRelease(error);
      }
    }
  }
  v7[2](v7, 2, 0);
LABEL_10:

LABEL_16:
}

- (id)logHTTPErrorWithResponse:(id)a3 withData:(id)a4 fromRequest:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:5];
  id v11 = Log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[FBKSHTTPClient logHTTPErrorWithResponse:withData:fromRequest:].cold.5(v7, v9, v11);
  }

  uint64_t v12 = [v7 allHeaderFields];
  uint64_t v13 = [v9 URL];
  uint64_t v14 = [v13 description];
  uint64_t v15 = (void *)v14;
  if (v14) {
    char v16 = (__CFString *)v14;
  }
  else {
    char v16 = &stru_270018890;
  }
  [v10 setObject:v16 forKeyedSubscript:@"url"];

  uint64_t v17 = [v9 HTTPMethod];
  id v18 = (void *)v17;
  if (v17) {
    int v19 = (__CFString *)v17;
  }
  else {
    int v19 = &stru_270018890;
  }
  [v10 setObject:v19 forKeyedSubscript:@"HTTP method"];

  uint64_t v20 = FBKSStringFromEnvironment(+[FBKSSharedConstants environment]);
  long long v21 = (void *)v20;
  if (v20) {
    long long v22 = (__CFString *)v20;
  }
  else {
    long long v22 = &stru_270018890;
  }
  [v10 setObject:v22 forKeyedSubscript:@"environment"];

  long long v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "statusCode"));
  [v10 setObject:v23 forKeyedSubscript:@"HTTP error"];

  uint64_t v24 = [v12 objectForKeyedSubscript:@"X-Request-Id"];
  id v25 = (void *)v24;
  if (v24) {
    uint64_t v26 = (__CFString *)v24;
  }
  else {
    uint64_t v26 = &stru_270018890;
  }
  [v10 setObject:v26 forKeyedSubscript:@"request id"];

  id v27 = [v12 objectForKeyedSubscript:@"Content-Type"];
  if ((([v27 containsString:@"application/json"] & 1) != 0
     || [v27 containsString:@"text/html"])
    && [v7 statusCode] != 404)
  {
    id v38 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
    int v28 = Log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[FBKSHTTPClient logHTTPErrorWithResponse:withData:fromRequest:].cold.4();
    }

    uint64_t v29 = Log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      __int16 v30 = [v12 objectForKeyedSubscript:@"X-Request-Id"];
      -[FBKSHTTPClient logHTTPErrorWithResponse:withData:fromRequest:](v30, (uint64_t)v39, v29);
    }

    __int16 v31 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_32;
    }
    uint64_t v32 = [v31 objectForKeyedSubscript:@"errors"];
    if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v33 = [v32 firstObject];
      uint64_t v34 = [v33 objectForKeyedSubscript:@"message"];

      if (!v34) {
        goto LABEL_31;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v34 = [v31 objectForKeyedSubscript:@"error"];
      if (!v34) {
        goto LABEL_31;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_31;
      }
    }
    [v10 setObject:v34 forKeyedSubscript:@"error message"];
LABEL_31:

LABEL_32:
  }
  uint64_t v35 = Log();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
    -[FBKSHTTPClient logHTTPErrorWithResponse:withData:fromRequest:]();
  }

  id v36 = [NSDictionary dictionaryWithDictionary:v10];

  return v36;
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSession:(id)a3
{
}

- (NSHTTPCookie)seedPortalSession
{
  return (NSHTTPCookie *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSeedPortalSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seedPortalSession, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __50__FBKSHTTPClient_jsonForURLRequest_success_error___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_24DF86000, v0, v1, "Could not create object from JSON data. Error %@", v2);
}

- (void)URLSession:didBecomeInvalidWithError:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_24DF86000, v0, v1, "URLSession became invalid with error %@", v2);
}

- (void)URLSession:(void *)a1 didReceiveChallenge:(NSObject *)a2 completionHandler:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 debugDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_24DF86000, a2, v4, "Error in certificate: %{public}@", v5);
}

- (void)logHTTPErrorWithResponse:withData:fromRequest:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_24DF86000, v1, OS_LOG_TYPE_ERROR, "Exception [%{public}@] decoding HTTP error for response [%{public}@]", v2, 0x16u);
}

- (void)logHTTPErrorWithResponse:withData:fromRequest:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_24DF86000, v0, OS_LOG_TYPE_DEBUG, "SP2 Request Attributes: %@", v1, 0xCu);
}

- (void)logHTTPErrorWithResponse:(__CFString *)a1 withData:(uint64_t)a2 fromRequest:(NSObject *)a3 .cold.3(__CFString *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = @"unknown";
  if (a1) {
    uint64_t v4 = a1;
  }
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = v4;
  OUTLINED_FUNCTION_1(&dword_24DF86000, a3, (uint64_t)a3, "Request ID: [%{public}@]", (uint8_t *)a2);
}

- (void)logHTTPErrorWithResponse:withData:fromRequest:.cold.4()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_24DF86000, v0, v1, "Error Body: [%{public}@]", v2);
}

- (void)logHTTPErrorWithResponse:(void *)a1 withData:(void *)a2 fromRequest:(NSObject *)a3 .cold.5(void *a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 statusCode];
  uint64_t v6 = [a2 HTTPMethod];
  id v7 = [a2 URL];
  id v8 = [v7 path];
  int v9 = 134218498;
  uint64_t v10 = v5;
  __int16 v11 = 2114;
  uint64_t v12 = v6;
  __int16 v13 = 2114;
  uint64_t v14 = v8;
  _os_log_error_impl(&dword_24DF86000, a3, OS_LOG_TYPE_ERROR, "HTTP Error: [%ld] from request: [%{public}@ %{public}@]", (uint8_t *)&v9, 0x20u);
}

@end