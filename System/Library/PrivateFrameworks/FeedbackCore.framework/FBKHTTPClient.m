@interface FBKHTTPClient
- (BOOL)_shouldSimulateInvalidSessionWithRequestAndHalt:(id)a3 successHandler:(id)a4 errorHandler:(id)a5;
- (BOOL)didTearDown;
- (FBKHTTPClient)init;
- (NSURLSession)session;
- (id)_formEncodedBodyForDictionary:(id)a3;
- (id)_keyValuePairsForKey:(id)a3 value:(id)a4;
- (id)bodyDataForParameters:(id)a3 encoding:(unint64_t)a4 error:(id *)a5;
- (id)bundle;
- (id)contentTypeForParameterEncoding:(unint64_t)a3;
- (id)logHTTPErrorWithResponse:(id)a3 withData:(id)a4 fromRequest:(id)a5;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)dataForURL:(id)a3 success:(id)a4 error:(id)a5;
- (void)dataForURL:(id)a3 successWithResponse:(id)a4 error:(id)a5;
- (void)dataForURLRequest:(id)a3 success:(id)a4 error:(id)a5;
- (void)dataForURLRequest:(id)a3 successWithResponse:(id)a4 error:(id)a5;
- (void)deleteAtURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7;
- (void)deleteResourceAtURL:(id)a3 success:(id)a4 error:(id)a5;
- (void)didLogInWithLoginUserInfo:(id)a3 completion:(id)a4;
- (void)didLogOutWithCompletion:(id)a3;
- (void)jsonForURL:(id)a3 success:(id)a4 error:(id)a5;
- (void)jsonForURLRequest:(id)a3 success:(id)a4 error:(id)a5;
- (void)performHTTPMethod:(id)a3 toURL:(id)a4 parameters:(id)a5 encoding:(unint64_t)a6 success:(id)a7 error:(id)a8;
- (void)postToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7;
- (void)putToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7;
- (void)setDidTearDown:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)tearDown;
@end

@implementation FBKHTTPClient

- (FBKHTTPClient)init
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  v55.receiver = self;
  v55.super_class = (Class)FBKHTTPClient;
  v2 = [(FBKHTTPClient *)&v55 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    v4 = (void *)[v3 copy];

    v51 = v4;
    [v4 setURLCache:0];
    v45 = v2;
    v5 = [(FBKHTTPClient *)v2 bundle];
    v6 = [v5 infoDictionary];

    uint64_t v7 = [v6 objectForKey:@"CFBundleShortVersionString"];
    v50 = v6;
    uint64_t v8 = [v6 objectForKey:*MEMORY[0x263EFFB70]];
    memset(&v58, 0, 512);
    uname(&v58);
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s", v58.machine);
    v10 = @"Unknown";
    v49 = (void *)v8;
    if (v8) {
      v10 = (__CFString *)v8;
    }
    v54 = (void *)v7;
    if (v7) {
      v10 = (__CFString *)v7;
    }
    v11 = v10;
    uint64_t v12 = +[FBKSSharedConstants productVersion];
    uint64_t v13 = +[FBKSSharedConstants swVers];
    BOOL v14 = +[FBKSharedConstants isRunningInFBA];
    v15 = @"Feedback Framework";
    if (v14) {
      v15 = @"Feedback Assistant";
    }
    v47 = v11;
    v48 = (void *)v9;
    v53 = (void *)v13;
    v46 = (void *)v12;
    v52 = [NSString stringWithFormat:@"%@/%@ (%@ %@) (Build %@) (Model %@)", v15, v11, @"iOS", v12, v13, v9];
    v16 = (void *)MEMORY[0x263EFF960];
    v17 = [MEMORY[0x263EFF960] preferredLanguages];
    v18 = [v16 minimizedLanguagesFromLanguages:v17];

    uint64_t v19 = [v18 count];
    if (v19)
    {
      unint64_t v20 = v19;
      v21 = (void *)MEMORY[0x263F089D8];
      v22 = [v18 objectAtIndexedSubscript:0];
      v23 = [v21 stringWithString:v22];

      if (v20 >= 5) {
        unint64_t v24 = 5;
      }
      else {
        unint64_t v24 = v20;
      }
      if (v24 >= 2)
      {
        uint64_t v25 = 9;
        for (uint64_t i = 1; i != v24; ++i)
        {
          v27 = [v18 objectAtIndexedSubscript:i];
          [v23 appendFormat:@",%@;q=0.%u", v27, v25];

          uint64_t v25 = (v25 - 1);
        }
      }
      v28 = (__CFString *)[v23 copy];
    }
    else
    {
      v28 = @"en";
    }
    v29 = objc_opt_new();
    v56[0] = @"X-SP-API";
    v30 = objc_msgSend(NSString, "stringWithFormat:", @"%.1f", *MEMORY[0x263F3C5F8]);
    v57[0] = v30;
    v57[1] = v52;
    v56[1] = @"User-Agent";
    v56[2] = @"X-FBA-VERSION";
    v31 = [NSString stringWithFormat:@"%@", v54];
    v57[2] = v31;
    v57[3] = @"iOS";
    v56[3] = @"X-FBA-PLATFORM";
    v56[4] = @"X-FBA-OSBUILD";
    v56[5] = @"Accept";
    v56[6] = @"Content-Type";
    v57[4] = v53;
    v57[5] = @"application/json";
    v56[7] = @"Accept-Language";
    v57[6] = @"application/json";
    v57[7] = v28;
    v32 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:8];
    [v29 addEntriesFromDictionary:v32];

    v33 = [MEMORY[0x263EFF960] preferredLanguages];
    v34 = [MEMORY[0x263EFF960] systemLanguages];
    v35 = [MEMORY[0x263F086E0] preferredLocalizationsFromArray:v34 forPreferences:v33];
    v36 = [v35 firstObject];
    if (v36) {
      [v29 setValue:v36 forKey:@"X-System-Language"];
    }
    v37 = [v33 componentsJoinedByString:@","];
    if (v33) {
      [v29 setValue:v37 forKey:@"X-User-Preferred-Languages"];
    }
    v44 = v28;
    v38 = [MEMORY[0x263F0FD88] siriLanguageCode];
    if (v38) {
      [v29 setValue:v38 forKey:@"X-Siri-Language"];
    }
    v39 = +[FBKSSharedConstants overrideGeoCountryCode];

    if (v39)
    {
      v40 = +[FBKSSharedConstants overrideGeoCountryCode];
      [v29 setValue:v40 forKey:@"X-SP-Geo-Override"];
    }
    [v51 setHTTPAdditionalHeaders:v29];
    v2 = v45;
    uint64_t v41 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v51 delegate:v45 delegateQueue:0];
    session = v45->_session;
    v45->_session = (NSURLSession *)v41;
  }
  return v2;
}

- (void)didLogOutWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[FBKLog net];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_DEFAULT, "cancelling all requests", buf, 2u);
  }

  v6 = [(FBKHTTPClient *)self session];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__FBKHTTPClient_didLogOutWithCompletion___block_invoke;
  v8[3] = &unk_264875AD0;
  id v9 = v4;
  id v7 = v4;
  [v6 getAllTasksWithCompletionHandler:v8];
}

void __41__FBKHTTPClient_didLogOutWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v13;
    *(void *)&long long v5 = 138412290;
    long long v11 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        v10 = +[FBKLog net];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v11;
          v17 = v9;
          _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_DEFAULT, "cancelling task [%@]", buf, 0xCu);
        }

        [v9 cancel];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v6);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)didLogInWithLoginUserInfo:(id)a3 completion:(id)a4
{
}

- (void)dataForURLRequest:(id)a3 success:(id)a4 error:(id)a5
{
  id v8 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__FBKHTTPClient_dataForURLRequest_success_error___block_invoke;
  v10[3] = &unk_264874C38;
  id v11 = v8;
  id v9 = v8;
  [(FBKHTTPClient *)self dataForURLRequest:a3 successWithResponse:v10 error:a5];
}

uint64_t __49__FBKHTTPClient_dataForURLRequest_success_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dataForURLRequest:(id)a3 successWithResponse:(id)a4 error:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[FBKLog net];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    long long v12 = [v8 HTTPMethod];
    long long v13 = [v8 URL];
    long long v14 = [v13 path];
    *(_DWORD *)buf = 138543618;
    v35 = v12;
    __int16 v36 = 2114;
    v37 = v14;
    _os_log_impl(&dword_22A36D000, v11, OS_LOG_TYPE_INFO, "-> %{public}@ %{public}@", buf, 0x16u);
  }
  long long v15 = [MEMORY[0x263F08890] sharedHTTPCookieStorage];
  v16 = [v15 cookies];

  CFTimeInterval v17 = CACurrentMediaTime();
  v18 = [(FBKHTTPClient *)self session];
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  v26 = __61__FBKHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke;
  v27 = &unk_264875B70;
  id v28 = v8;
  v29 = self;
  CFTimeInterval v33 = v17;
  id v30 = v16;
  id v31 = v10;
  id v32 = v9;
  id v19 = v9;
  id v20 = v10;
  id v21 = v16;
  id v22 = v8;
  v23 = [v18 dataTaskWithRequest:v22 completionHandler:&v24];

  objc_msgSend(v23, "resume", v24, v25, v26, v27);
}

void __61__FBKHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  id v11 = +[FBKLog net];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    long long v12 = [*(id *)(a1 + 32) HTTPMethod];
    long long v13 = [*(id *)(a1 + 32) URL];
    long long v14 = [v13 path];
    *(_DWORD *)buf = 138543874;
    v50 = v12;
    __int16 v51 = 2114;
    v52 = v14;
    __int16 v53 = 2048;
    uint64_t v54 = [v10 statusCode];
    _os_log_impl(&dword_22A36D000, v11, OS_LOG_TYPE_INFO, "<- %{public}@ %{public}@ %li", buf, 0x20u);
  }
  long long v15 = +[FBKRequestsLog sharedInstance];
  int v16 = [v15 active];

  if (v16)
  {
    CFTimeInterval v17 = [FBKRequestRecordWrapper alloc];
    uint64_t v18 = *(void *)(a1 + 32);
    id v19 = [*(id *)(a1 + 40) session];
    id v20 = [(FBKRequestRecordWrapper *)v17 initWithRequest:v18 response:v10 session:v19 cookies:*(void *)(a1 + 48) body:v7 error:v9];

    id v21 = +[FBKRequestsLog sharedInstance];
    [v21 addRequest:v20];
  }
  if (v9)
  {
    if ([v9 code] == -999)
    {
      id v22 = [v9 domain];
      int v23 = [v22 isEqualToString:*MEMORY[0x263F08570]];

      if (v23)
      {
        uint64_t v24 = +[FBKLog net];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = [*(id *)(a1 + 32) URL];
          v26 = [v25 path];
          *(_DWORD *)buf = 138543362;
          v50 = v26;
          _os_log_impl(&dword_22A36D000, v24, OS_LOG_TYPE_DEFAULT, "Request was cancelled, ignoring error on [%{public}@]", buf, 0xCu);
        }
        goto LABEL_12;
      }
    }
    uint64_t v24 = _os_activity_create(&dword_22A36D000, "HTTP Error", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__FBKHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke_103;
    block[3] = &unk_264875AF8;
    block[4] = *(void *)(a1 + 40);
    id v43 = v10;
    id v44 = v7;
    id v45 = *(id *)(a1 + 32);
    id v46 = v9;
    uint64_t v48 = *(void *)(a1 + 72);
    id v47 = *(id *)(a1 + 56);
    os_activity_apply(v24, block);

    v27 = v43;
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  id v28 = objc_msgSend(NSString, "stringWithFormat:", @"%li", objc_msgSend(v10, "statusCode"));
  if ([v28 characterAtIndex:0] == 50)
  {
  }
  else
  {
    uint64_t v29 = [v10 statusCode];

    if (v29 != 302)
    {
      uint64_t v24 = _os_activity_create(&dword_22A36D000, "HTTP Error", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __61__FBKHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke_2;
      v33[3] = &unk_264875B48;
      id v34 = v7;
      id v35 = *(id *)(a1 + 32);
      id v39 = *(id *)(a1 + 64);
      id v36 = v10;
      id v31 = *(id *)(a1 + 56);
      uint64_t v32 = *(void *)(a1 + 40);
      id v40 = v31;
      uint64_t v37 = v32;
      id v38 = v36;
      uint64_t v41 = *(void *)(a1 + 72);
      os_activity_apply(v24, v33);

      v27 = v34;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x263F3A148], "logEventWithRequest:httpStatusCode:nsurlErrorCode:success:startedAt:endedAt:", *(void *)(a1 + 32), objc_msgSend(v10, "statusCode"), 0, 1, *(double *)(a1 + 72), CACurrentMediaTime());
  uint64_t v30 = *(void *)(a1 + 64);
  if (v30) {
    (*(void (**)(uint64_t, id, id))(v30 + 16))(v30, v7, v10);
  }
LABEL_13:
}

void __61__FBKHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke_103(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) logHTTPErrorWithResponse:*(void *)(a1 + 40) withData:*(void *)(a1 + 48) fromRequest:*(void *)(a1 + 56)];
  id v2 = *(id *)(a1 + 64);
  if (v10)
  {
    id v3 = [*(id *)(a1 + 64) userInfo];

    if (v3)
    {
      uint64_t v4 = (void *)MEMORY[0x263EFF9A0];
      long long v5 = [*(id *)(a1 + 64) userInfo];
      id v3 = [v4 dictionaryWithDictionary:v5];

      [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x263F3C670]];
    }
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    id v7 = [*(id *)(a1 + 64) domain];
    uint64_t v8 = objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, objc_msgSend(*(id *)(a1 + 64), "code"), v3);

    id v2 = (id)v8;
  }
  objc_msgSend(MEMORY[0x263F3A148], "logEventWithRequest:httpStatusCode:nsurlErrorCode:success:startedAt:endedAt:", *(void *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "statusCode"), objc_msgSend(*(id *)(a1 + 64), "code"), 0, *(double *)(a1 + 80), CACurrentMediaTime());
  uint64_t v9 = *(void *)(a1 + 72);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v2);
  }
}

void __61__FBKHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke_2(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v37 = 0;
    id v3 = [MEMORY[0x263F08900] JSONObjectWithData:v2 options:0 error:&v37];
    id v4 = v37;
    long long v5 = 0;
    uint64_t v6 = 0;
    if (FBKSIsValidErrorResponse())
    {
      id v28 = v4;
      uint64_t v29 = v3;
      id v7 = v3;
      uint64_t v8 = (void *)MEMORY[0x263EFF980];
      uint64_t v9 = [v7 objectForKeyedSubscript:@"errors"];
      id v10 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v27 = v7;
      id v11 = [v7 objectForKeyedSubscript:@"errors"];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v40 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        long long v5 = 0;
        uint64_t v14 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v34 != v14) {
              objc_enumerationMutation(v11);
            }
            int v16 = FBKSErrorForDict(*(void **)(*((void *)&v33 + 1) + 8 * i));
            CFTimeInterval v17 = v16;
            if (v16)
            {
              if ([v16 code] == 16)
              {
                uint64_t v18 = [FBKBoxedRequest alloc];
                uint64_t v19 = *(void *)(a1 + 40);
                v30[0] = MEMORY[0x263EF8330];
                v30[1] = 3221225472;
                v30[2] = __61__FBKHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke_3;
                v30[3] = &unk_264875B20;
                id v32 = *(id *)(a1 + 72);
                id v31 = *(id *)(a1 + 48);
                uint64_t v20 = [(FBKBoxedRequest *)v18 initWithRequest:v19 successBlock:v30 errorBlock:*(void *)(a1 + 80)];

                id v21 = [MEMORY[0x263F08A00] defaultCenter];
                id v38 = @"error";
                id v39 = v17;
                id v22 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
                [v21 postNotificationName:@"FBKSessionDidBecomeInvalidNotification" object:v20 userInfo:v22];

                long long v5 = (void *)v20;
              }
              [v10 addObject:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v40 count:16];
        }
        while (v13);
      }
      else
      {
        long long v5 = 0;
      }

      uint64_t v6 = (void *)[v10 copy];
      id v4 = v28;
      id v3 = v29;
    }
  }
  else
  {
    long long v5 = 0;
    uint64_t v6 = 0;
  }
  int v23 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
  uint64_t v24 = v23;
  if (v6) {
    [v23 setObject:v6 forKey:*MEMORY[0x263F3C638]];
  }
  uint64_t v25 = [*(id *)(a1 + 56) logHTTPErrorWithResponse:*(void *)(a1 + 64) withData:*(void *)(a1 + 32) fromRequest:*(void *)(a1 + 40)];
  if (v25) {
    [v24 setObject:v25 forKeyedSubscript:*MEMORY[0x263F3C670]];
  }
  if (!v5 && *(void *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x263F3A148], "logEventWithRequest:httpStatusCode:nsurlErrorCode:success:startedAt:endedAt:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 64), "statusCode"), 0, 0, *(double *)(a1 + 88), CACurrentMediaTime());
    v26 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"HTTPErrorDomain", objc_msgSend(*(id *)(a1 + 64), "statusCode"), v24);
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

uint64_t __61__FBKHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

- (void)jsonForURLRequest:(id)a3 success:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __49__FBKHTTPClient_jsonForURLRequest_success_error___block_invoke;
  v14[3] = &unk_264874C10;
  id v15 = v8;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__FBKHTTPClient_jsonForURLRequest_success_error___block_invoke_125;
  v12[3] = &unk_2648743D8;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(FBKHTTPClient *)self dataForURLRequest:a3 success:v14 error:v12];
}

void __49__FBKHTTPClient_jsonForURLRequest_success_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32))
  {
    id v8 = 0;
    id v3 = [MEMORY[0x263F08900] JSONObjectWithData:a2 options:0 error:&v8];
    id v4 = v8;
    if (v4)
    {
      long long v5 = +[FBKLog net];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __49__FBKHTTPClient_jsonForURLRequest_success_error___block_invoke_cold_1();
      }

      uint64_t v6 = *(void *)(a1 + 40);
      if (!v6) {
        goto LABEL_9;
      }
      id v7 = *(void (**)(void))(v6 + 16);
    }
    else
    {
      id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v7();
LABEL_9:
  }
}

uint64_t __49__FBKHTTPClient_jsonForURLRequest_success_error___block_invoke_125(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dataForURL:(id)a3 success:(id)a4 error:(id)a5
{
  id v8 = (void *)MEMORY[0x263F08BD8];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 requestWithURL:a3];
  [(FBKHTTPClient *)self dataForURLRequest:v11 success:v10 error:v9];
}

- (void)dataForURL:(id)a3 successWithResponse:(id)a4 error:(id)a5
{
  id v8 = (void *)MEMORY[0x263F08BD8];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 requestWithURL:a3];
  [(FBKHTTPClient *)self dataForURLRequest:v11 successWithResponse:v10 error:v9];
}

- (void)jsonForURL:(id)a3 success:(id)a4 error:(id)a5
{
  id v8 = (void *)MEMORY[0x263F08BD8];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 requestWithURL:a3];
  [(FBKHTTPClient *)self jsonForURLRequest:v11 success:v10 error:v9];
}

- (void)postToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7
{
}

- (void)putToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7
{
}

- (void)deleteResourceAtURL:(id)a3 success:(id)a4 error:(id)a5
{
  id v8 = (void *)MEMORY[0x263F089E0];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 requestWithURL:a3];
  [v11 setHTTPMethod:@"DELETE"];
  [(FBKHTTPClient *)self dataForURLRequest:v11 success:v10 error:v9];
}

- (void)deleteAtURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7
{
}

- (void)performHTTPMethod:(id)a3 toURL:(id)a4 parameters:(id)a5 encoding:(unint64_t)a6 success:(id)a7 error:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  id v16 = (void *)MEMORY[0x263F089E0];
  id v17 = a5;
  id v18 = a3;
  uint64_t v19 = [v16 requestWithURL:a4];
  [v19 setHTTPMethod:v18];

  id v28 = 0;
  uint64_t v20 = [(FBKHTTPClient *)self bodyDataForParameters:v17 encoding:a6 error:&v28];

  id v21 = v28;
  if (v20)
  {
    [v19 setHTTPBody:v20];
    id v22 = [(FBKHTTPClient *)self contentTypeForParameterEncoding:a6];
    [v19 setValue:v22 forHTTPHeaderField:@"Content-Type"];
  }
  if (v21)
  {
    int v23 = +[FBKLog net];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[FBKHTTPClient performHTTPMethod:toURL:parameters:encoding:success:error:]();
    }

    uint64_t v24 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__FBKHTTPClient_performHTTPMethod_toURL_parameters_encoding_success_error___block_invoke;
    block[3] = &unk_2648741F8;
    id v27 = v15;
    id v26 = v21;
    dispatch_async(v24, block);
  }
  else
  {
    [(FBKHTTPClient *)self dataForURLRequest:v19 success:v14 error:v15];
  }
}

uint64_t __75__FBKHTTPClient_performHTTPMethod_toURL_parameters_encoding_success_error___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v4 = a4;
  long long v5 = +[FBKLog net];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[FBKHTTPClient URLSession:didBecomeInvalidWithError:]();
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(id, uint64_t, void))a5;
  uint64_t v8 = +[FBKSSharedConstants environment];
  int v9 = v8;
  if (FBKIsInternalInstall(v8, v10) && (v9 & 0xFFFFFFFD) == 1)
  {
    id v11 = +[FBKLog net];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v33 = 0;
      uint64_t v12 = "Running in development/stagingDev mode; skipping pinning check (internal only).";
      id v13 = (uint8_t *)&v33;
LABEL_13:
      _os_log_impl(&dword_22A36D000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  id v14 = [v6 protectionSpace];
  id v15 = [v14 host];
  id v16 = +[FBKSSharedConstants appleSeedURL];
  id v17 = [v16 host];
  char v18 = [v15 isEqualToString:v17];

  if ((v18 & 1) == 0)
  {
    id v11 = +[FBKLog net];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v12 = "Connecting to other server; skipping pinning check.";
      id v13 = buf;
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v19 = [v6 protectionSpace];
  uint64_t v20 = [v19 authenticationMethod];
  int v21 = [v20 isEqualToString:*MEMORY[0x263F08560]];

  if (!v21)
  {
LABEL_15:
    v7[2](v7, 1, 0);
    goto LABEL_16;
  }
  id v22 = +[FBKSSharedConstants appleSeedURL];
  int v23 = [v22 host];

  uint64_t AppleSSLPinned = SecPolicyCreateAppleSSLPinned();
  if (AppleSSLPinned)
  {
    uint64_t v25 = (const void *)AppleSSLPinned;
    id v26 = [v6 protectionSpace];
    id v27 = (__SecTrust *)[v26 serverTrust];

    LODWORD(v26) = SecTrustSetPolicies(v27, v25);
    CFRelease(v25);
    if (!v26)
    {
      CFErrorRef error = 0;
      if (SecTrustEvaluateWithError(v27, &error))
      {
        id v28 = [MEMORY[0x263F08BB8] credentialForTrust:v27];
        ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v28);

        goto LABEL_10;
      }
      if (error)
      {
        uint64_t v29 = error;
        uint64_t v30 = +[FBKLog net];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[FBKHTTPClient URLSession:didReceiveChallenge:completionHandler:](v29, v30);
        }

        CFRelease(error);
      }
    }
  }
  v7[2](v7, 2, 0);
LABEL_10:

LABEL_16:
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v9 = a4;
  id v10 = a6;
  id v11 = (void (**)(id, id))a7;
  uint64_t v12 = [v9 originalRequest];
  id v13 = [v12 URL];
  id v14 = [v13 absoluteString];
  if (([v14 containsString:@"file_promise"] & 1) == 0)
  {

    goto LABEL_7;
  }
  id v15 = [v9 originalRequest];
  id v16 = [v15 URL];
  id v17 = [v16 absoluteString];
  int v18 = [v17 containsString:@"download"];

  if (!v18)
  {
LABEL_7:
    v11[2](v11, v10);
    goto LABEL_8;
  }
  uint64_t v19 = +[FBKLog net];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20[0] = 0;
    _os_log_impl(&dword_22A36D000, v19, OS_LOG_TYPE_INFO, "File Promise redirect detected; cancelling redirect.",
      (uint8_t *)v20,
      2u);
  }

  v11[2](v11, 0);
LABEL_8:
}

- (id)bodyDataForParameters:(id)a3 encoding:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (!v8) {
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    uint64_t v9 = [(FBKHTTPClient *)self _formEncodedBodyForDictionary:v8];
    goto LABEL_7;
  }
  if (a4 != 2)
  {
LABEL_5:
    id v10 = 0;
    goto LABEL_8;
  }
  uint64_t v9 = [MEMORY[0x263F08900] dataWithJSONObject:v8 options:0 error:a5];
LABEL_7:
  id v10 = (void *)v9;
LABEL_8:

  return v10;
}

- (id)contentTypeForParameterEncoding:(unint64_t)a3
{
  if (a3 == 2) {
    return @"application/json; charset=utf-8";
  }
  else {
    return @"application/x-www-form-urlencoded; charset=utf-8";
  }
}

- (id)_formEncodedBodyForDictionary:(id)a3
{
  v31[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 allKeys];
  long long v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"description" ascending:1 selector:sel_caseInsensitiveCompare_];
  v31[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
  id v7 = [v4 sortedArrayUsingDescriptors:v6];

  uint64_t v25 = v3;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v14 = [v25 objectForKey:v13];
        id v15 = [v13 description];
        id v16 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@":/?#[]@!$&'()*+,="];;
        id v17 = [v16 invertedSet];
        int v18 = [v15 stringByAddingPercentEncodingWithAllowedCharacters:v17];
        uint64_t v19 = [(FBKHTTPClient *)self _keyValuePairsForKey:v18 value:v14];
        [v8 addObjectsFromArray:v19];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }

  uint64_t v20 = [v8 componentsJoinedByString:@"&"];
  int v21 = [v20 dataUsingEncoding:4];

  return v21;
}

- (id)_keyValuePairsForKey:(id)a3 value:(id)a4
{
  v53[1] = *MEMORY[0x263EF8340];
  id v40 = a3;
  id v5 = a4;
  id v6 = objc_opt_class();
  if ([v6 isSubclassOfClass:objc_opt_class()])
  {
    id v7 = [v5 allKeys];
    id v8 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"description" ascending:1 selector:sel_caseInsensitiveCompare_];
    v53[0] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:1];
    uint64_t v10 = [v7 sortedArrayUsingDescriptors:v9];

    uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id obj = v12;
      uint64_t v39 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          id v16 = v5;
          if (*(void *)v47 != v39) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          int v18 = NSString;
          uint64_t v19 = [v17 description];
          uint64_t v20 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@":/?#[]@!$&'()*+,="];;
          int v21 = [v20 invertedSet];
          id v22 = [v19 stringByAddingPercentEncodingWithAllowedCharacters:v21];
          int v23 = [v18 stringWithFormat:@"%@[%@]", v40, v22];

          id v5 = v16;
          uint64_t v24 = [v16 objectForKeyedSubscript:v17];
          uint64_t v25 = [(FBKHTTPClient *)self _keyValuePairsForKey:v23 value:v24];
          [v11 addObjectsFromArray:v25];
        }
        id v12 = obj;
        uint64_t v14 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v14);
    }

LABEL_20:
    id v32 = (void *)[v11 copy];
    goto LABEL_21;
  }
  if (([v6 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || [v6 isSubclassOfClass:objc_opt_class()])
  {
    id v12 = [v40 stringByAppendingString:@"[]"];
    uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v26 = v5;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v43 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = [(FBKHTTPClient *)self _keyValuePairsForKey:v12 value:*(void *)(*((void *)&v42 + 1) + 8 * j)];
          [v11 addObjectsFromArray:v31];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v51 count:16];
      }
      while (v28);
    }

    goto LABEL_20;
  }
  long long v34 = NSString;
  id v12 = [v5 description];
  uint64_t v11 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@":/?#[]@!$&'()*+,="];;
  long long v35 = [v11 invertedSet];
  long long v36 = [v12 stringByAddingPercentEncodingWithAllowedCharacters:v35];
  id v37 = [v34 stringWithFormat:@"%@=%@", v40, v36];
  v50 = v37;
  id v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];

LABEL_21:

  return v32;
}

- (id)logHTTPErrorWithResponse:(id)a3 withData:(id)a4 fromRequest:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:5];
  uint64_t v11 = +[FBKLog net];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[FBKHTTPClient logHTTPErrorWithResponse:withData:fromRequest:].cold.5(v7, v9, v11);
  }

  id v12 = [v7 allHeaderFields];
  uint64_t v13 = [v9 URL];
  uint64_t v14 = [v13 description];
  id v15 = (void *)v14;
  if (v14) {
    id v16 = (__CFString *)v14;
  }
  else {
    id v16 = &stru_26DDF6A30;
  }
  [v10 setObject:v16 forKeyedSubscript:*MEMORY[0x263F3C668]];

  uint64_t v17 = [v9 HTTPMethod];
  int v18 = (void *)v17;
  if (v17) {
    uint64_t v19 = (__CFString *)v17;
  }
  else {
    uint64_t v19 = &stru_26DDF6A30;
  }
  [v10 setObject:v19 forKeyedSubscript:*MEMORY[0x263F3C650]];

  +[FBKSSharedConstants environment];
  uint64_t v20 = FBKSStringFromEnvironment();
  int v21 = (void *)v20;
  if (v20) {
    id v22 = (__CFString *)v20;
  }
  else {
    id v22 = &stru_26DDF6A30;
  }
  [v10 setObject:v22 forKeyedSubscript:*MEMORY[0x263F3C640]];

  int v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "statusCode"));
  [v10 setObject:v23 forKeyedSubscript:*MEMORY[0x263F3C648]];

  uint64_t v24 = [v12 objectForKeyedSubscript:@"X-Request-Id"];
  uint64_t v25 = (void *)v24;
  if (v24) {
    id v26 = (__CFString *)v24;
  }
  else {
    id v26 = &stru_26DDF6A30;
  }
  [v10 setObject:v26 forKeyedSubscript:*MEMORY[0x263F3C660]];

  uint64_t v27 = [v12 objectForKeyedSubscript:@"Content-Type"];
  if ((([v27 containsString:@"application/json"] & 1) != 0
     || [v27 containsString:@"text/html"])
    && [v7 statusCode] != 404)
  {
    id v40 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
    uint64_t v28 = +[FBKLog net];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[FBKHTTPClient logHTTPErrorWithResponse:withData:fromRequest:].cold.4();
    }

    uint64_t v29 = +[FBKLog net];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = [v12 objectForKeyedSubscript:@"X-Request-Id"];
      -[FBKHTTPClient logHTTPErrorWithResponse:withData:fromRequest:](v30, buf, v29);
    }

    id v31 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v32 = [v31 objectForKeyedSubscript:@"errors"];
      if (v32)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          __int16 v33 = [v32 firstObject];
          long long v34 = [v33 objectForKeyedSubscript:@"message"];

          if (v34)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v10 setObject:v34 forKeyedSubscript:*MEMORY[0x263F3C658]];
            }
          }
        }
      }
      long long v35 = [v31 objectForKeyedSubscript:@"message"];
      if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        [v10 setObject:v35 forKeyedSubscript:*MEMORY[0x263F3C658]];
      }
      else
      {
        long long v36 = [v31 objectForKeyedSubscript:@"error"];
        if (v36)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v10 setObject:v36 forKeyedSubscript:*MEMORY[0x263F3C658]];
          }
        }
      }
    }
  }
  id v37 = +[FBKLog net];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
    -[FBKHTTPClient logHTTPErrorWithResponse:withData:fromRequest:]();
  }

  id v38 = [NSDictionary dictionaryWithDictionary:v10];

  return v38;
}

- (id)bundle
{
  return (id)[MEMORY[0x263F086E0] mainBundle];
}

- (void)tearDown
{
  [(FBKHTTPClient *)self setDidTearDown:1];
  id v3 = [(FBKHTTPClient *)self session];
  [v3 invalidateAndCancel];

  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  uint64_t v10 = __Block_byref_object_dispose__2;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  id v4 = [(FBKHTTPClient *)self session];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__FBKHTTPClient_tearDown__block_invoke;
  v5[3] = &unk_264873E40;
  v5[4] = &v6;
  [v4 resetWithCompletionHandler:v5];

  dispatch_semaphore_wait((dispatch_semaphore_t)v7[5], 0xFFFFFFFFFFFFFFFFLL);
  _Block_object_dispose(&v6, 8);
}

intptr_t __25__FBKHTTPClient_tearDown__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
}

- (BOOL)_shouldSimulateInvalidSessionWithRequestAndHalt:(id)a3 successHandler:(id)a4 errorHandler:(id)a5
{
  return 0;
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSession:(id)a3
{
}

- (BOOL)didTearDown
{
  return self->_didTearDown;
}

- (void)setDidTearDown:(BOOL)a3
{
  self->_didTearDown = a3;
}

- (void).cxx_destruct
{
}

void __49__FBKHTTPClient_jsonForURLRequest_success_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Could not create object from JSON data. Error %@", v2, v3, v4, v5, v6);
}

- (void)performHTTPMethod:toURL:parameters:encoding:success:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "performHTTPMethod failed with error %@", v2, v3, v4, v5, v6);
}

- (void)URLSession:didBecomeInvalidWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "URLSession became invalid with error %@", v2, v3, v4, v5, v6);
}

- (void)URLSession:(void *)a1 didReceiveChallenge:(NSObject *)a2 completionHandler:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 debugDescription];
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Error in certificate: %{public}@", v4, 0xCu);
}

- (void)logHTTPErrorWithResponse:withData:fromRequest:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_22A36D000, v1, OS_LOG_TYPE_ERROR, "Exception [%{public}@] decoding HTTP error for response [%{public}@]", v2, 0x16u);
}

- (void)logHTTPErrorWithResponse:withData:fromRequest:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_22A36D000, v0, OS_LOG_TYPE_DEBUG, "SP2 Request Attributes: %@", v1, 0xCu);
}

- (void)logHTTPErrorWithResponse:(__CFString *)a1 withData:(uint8_t *)buf fromRequest:(os_log_t)log .cold.3(__CFString *a1, uint8_t *buf, os_log_t log)
{
  uint64_t v4 = @"unknown";
  if (a1) {
    uint64_t v4 = a1;
  }
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = v4;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "Request ID: [%{public}@]", buf, 0xCu);
}

- (void)logHTTPErrorWithResponse:withData:fromRequest:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Error Body: [%{public}@]", v2, v3, v4, v5, v6);
}

- (void)logHTTPErrorWithResponse:(void *)a1 withData:(void *)a2 fromRequest:(NSObject *)a3 .cold.5(void *a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 statusCode];
  uint8_t v6 = [a2 HTTPMethod];
  id v7 = [a2 URL];
  uint64_t v8 = [v7 path];
  int v9 = 134218498;
  uint64_t v10 = v5;
  __int16 v11 = 2114;
  id v12 = v6;
  __int16 v13 = 2114;
  uint64_t v14 = v8;
  _os_log_error_impl(&dword_22A36D000, a3, OS_LOG_TYPE_ERROR, "HTTP Error: [%ld] from request: [%{public}@ %{public}@]", (uint8_t *)&v9, 0x20u);
}

@end