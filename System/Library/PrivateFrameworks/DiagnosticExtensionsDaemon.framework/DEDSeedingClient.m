@interface DEDSeedingClient
- (BOOL)isLoggedIn;
- (DEDBugSessionConfiguration)config;
- (DEDSeedingClient)initWithConfiguration:(id)a3 sessionID:(id)a4 delegate:(id)a5;
- (DEDSeedingClientDelegate)uploadDelegate;
- (NSString)bugSessionIdentifier;
- (NSURLSession)backgroundSession;
- (NSURLSession)foregroundSession;
- (OS_os_log)log;
- (id)HTTPErrorWithResponse:(id)a3 withData:(id)a4;
- (id)_formEncodedBodyForDictionary:(id)a3;
- (id)_keyValuePairsForKey:(id)a3 value:(id)a4;
- (id)_serverErrorFromTask:(id)a3;
- (id)baseURL;
- (id)beginUploadWithRequest:(id)a3 fromFileURL:(id)a4 error:(id *)a5;
- (id)bodyDataForParameters:(id)a3 encoding:(unint64_t)a4 error:(id *)a5;
- (id)contentTypeForParameterEncoding:(unint64_t)a3;
- (id)filePromiseURLForPromise:(id)a3;
- (id)filerURL;
- (id)loginWithTokenURL;
- (id)newFilePromiseURL;
- (id)newFilerTokenURL;
- (id)ongoingUploads;
- (id)promiseConfiguration;
- (id)seedingURL;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3;
- (void)cancelPromise:(id)a3 withSuccess:(id)a4 error:(id)a5;
- (void)cleanup;
- (void)dataForURL:(id)a3 success:(id)a4 error:(id)a5;
- (void)dataForURLRequest:(id)a3 success:(id)a4 error:(id)a5;
- (void)deleteResourceAtURL:(id)a3 success:(id)a4 error:(id)a5;
- (void)getFilerTokenForPromise:(id)a3 withSuccess:(id)a4 error:(id)a5;
- (void)getPromise:(id)a3 withSuccess:(id)a4 error:(id)a5;
- (void)jsonForURL:(id)a3 success:(id)a4 error:(id)a5;
- (void)jsonForURLRequest:(id)a3 success:(id)a4 error:(id)a5;
- (void)makePromiseWithUUID:(id)a3 extensionID:(id)a4 success:(id)a5 error:(id)a6;
- (void)ongoingUploads;
- (void)performHTTPMethod:(id)a3 toURL:(id)a4 parameters:(id)a5 encoding:(unint64_t)a6 success:(id)a7 error:(id)a8;
- (void)postToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7;
- (void)putToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7;
- (void)seedingLoginWithSuccess:(id)a3 error:(id)a4;
- (void)sendFile:(id)a3 promise:(id)a4 withCompletion:(id)a5;
- (void)setBackgroundSession:(id)a3;
- (void)setBugSessionIdentifier:(id)a3;
- (void)setConfig:(id)a3;
- (void)setForegroundSession:(id)a3;
- (void)setLog:(id)a3;
- (void)setUploadDelegate:(id)a3;
- (void)updatePromise:(id)a3 withAttachmentGroup:(id)a4 status:(int64_t)a5 success:(id)a6 error:(id)a7;
- (void)updatePromise:(id)a3 withFilename:(id)a4 size:(int64_t)a5 extensionID:(id)a6 status:(int64_t)a7 success:(id)a8 error:(id)a9;
- (void)updatePromise:(id)a3 withFilename:(id)a4 size:(int64_t)a5 status:(int64_t)a6 success:(id)a7 error:(id)a8;
@end

@implementation DEDSeedingClient

- (DEDSeedingClient)initWithConfiguration:(id)a3 sessionID:(id)a4 delegate:(id)a5
{
  v40[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v38.receiver = self;
  v38.super_class = (Class)DEDSeedingClient;
  v11 = [(DEDSeedingClient *)&v38 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_uploadDelegate, v10);
    uint64_t v13 = [v8 copy];
    config = v12->_config;
    v12->_config = (DEDBugSessionConfiguration *)v13;

    objc_storeStrong((id *)&v12->_bugSessionIdentifier, a4);
    v15 = +[DEDConfiguration sharedInstance];
    os_log_t v16 = os_log_create((const char *)[v15 loggingSubsystem], "seeding-client");
    log = v12->_log;
    v12->_log = (OS_os_log *)v16;

    if (!v12->_config)
    {
      v18 = v12->_log;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[DEDSeedingClient initWithConfiguration:sessionID:delegate:]((uint64_t)&v12->_bugSessionIdentifier, v18, v19, v20, v21, v22, v23, v24);
      }
    }
    v39[0] = @"X-SP-API";
    v25 = objc_msgSend(NSString, "stringWithFormat:", @"%.1f", 0x4010666660000000);
    v39[1] = @"User-Agent";
    v40[0] = v25;
    v40[1] = @"Feedback Assistant/remote";
    v26 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];

    v27 = v12->_log;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v27, OS_LOG_TYPE_INFO, "Using ephemeral url session configuration", buf, 2u);
    }
    v28 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
    [v28 setHTTPAdditionalHeaders:v26];
    [v28 setUpDataUsageWithConfiguration:v8];
    uint64_t v29 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v28];
    foregroundSession = v12->_foregroundSession;
    v12->_foregroundSession = (NSURLSession *)v29;

    v31 = [NSString stringWithFormat:@"ded:%@", v9];
    v32 = [MEMORY[0x263F08C00] backgroundSessionConfigurationWithIdentifier:v31];
    v33 = (void *)[v32 copy];

    [v33 setHTTPAdditionalHeaders:v26];
    [v33 setUpDataUsageWithConfiguration:v8];
    uint64_t v34 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v33 delegate:v12 delegateQueue:0];
    backgroundSession = v12->_backgroundSession;
    v12->_backgroundSession = (NSURLSession *)v34;
  }
  return v12;
}

- (void)seedingLoginWithSuccess:(id)a3 error:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  v6 = (void (**)(void))a3;
  id v7 = a4;
  if ([(DEDSeedingClient *)self isLoggedIn])
  {
    v6[2](v6);
  }
  else
  {
    id v8 = [(DEDSeedingClient *)self loginWithTokenURL];
    os_log_t v16 = @"device_token";
    id v9 = [(DEDSeedingClient *)self config];
    id v10 = [v9 seedingDeviceToken];
    v17[0] = v10;
    v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __50__DEDSeedingClient_seedingLoginWithSuccess_error___block_invoke;
    v14[3] = &unk_26453BCB0;
    v14[4] = self;
    v15 = v6;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __50__DEDSeedingClient_seedingLoginWithSuccess_error___block_invoke_49;
    v12[3] = &unk_26453BCD8;
    v12[4] = self;
    id v13 = v7;
    [(DEDSeedingClient *)self postToURL:v8 parameters:v11 encoding:2 success:v14 error:v12];
  }
}

uint64_t __50__DEDSeedingClient_seedingLoginWithSuccess_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, "logged in", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __50__DEDSeedingClient_seedingLoginWithSuccess_error___block_invoke_49(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __50__DEDSeedingClient_seedingLoginWithSuccess_error___block_invoke_49_cold_1();
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)sendFile:(id)a3 promise:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke;
  v17[3] = &unk_26453ACB8;
  v17[4] = self;
  id v18 = v9;
  id v19 = v8;
  id v20 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_76;
  v14[3] = &unk_26453BD28;
  v14[4] = self;
  id v15 = v18;
  id v16 = v20;
  id v11 = v20;
  id v12 = v18;
  id v13 = v8;
  [(DEDSeedingClient *)self seedingLoginWithSuccess:v17 error:v14];
}

void __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_2;
  v10[3] = &unk_26453BD00;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v11 = v4;
  uint64_t v12 = v5;
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_74;
  v7[3] = &unk_26453BD28;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  id v9 = *(id *)(a1 + 56);
  [v3 getFilerTokenForPromise:v4 withSuccess:v10 error:v7];
}

void __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = NSString;
  id v4 = a2;
  uint64_t v5 = [v4 entityID];
  v6 = [*(id *)(a1 + 32) UUIDString];
  id v7 = [v3 stringWithFormat:@"%@_-_%@", v5, v6];

  id v8 = (void *)MEMORY[0x263F089E0];
  id v9 = [*(id *)(a1 + 40) filerURL];
  id v10 = [v8 requestWithURL:v9];

  [v10 setHTTPMethod:@"POST"];
  id v11 = [v4 token];
  [v10 setValue:v11 forHTTPHeaderField:@"Auth_Token"];

  uint64_t v12 = [v4 dsid];

  [v10 setValue:v12 forHTTPHeaderField:@"DS_Person_ID"];
  [v10 setValue:v7 forHTTPHeaderField:@"Form_Response_ID"];
  [v10 setValue:@"application/gzip" forHTTPHeaderField:@"Content-Type"];
  id v13 = [*(id *)(a1 + 40) config];
  objc_msgSend(v10, "setAllowsCellularAccess:", objc_msgSend(v13, "allowsCellularUpload"));

  id v14 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  id v28 = 0;
  id v16 = [v14 beginUploadWithRequest:v10 fromFileURL:v15 error:&v28];
  id v17 = v28;
  id v18 = [*(id *)(a1 + 40) log];
  id v19 = v18;
  if (v16)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v16 taskIdentifier];
      uint64_t v21 = [*(id *)(a1 + 32) UUIDString];
      uint64_t v22 = [*(id *)(a1 + 40) config];
      int v23 = [v22 allowsCellularUpload];
      *(_DWORD *)buf = 134218498;
      uint64_t v30 = v20;
      __int16 v31 = 2114;
      v32 = v21;
      __int16 v33 = 1024;
      int v34 = v23;
      _os_log_impl(&dword_21FE04000, v19, OS_LOG_TYPE_DEFAULT, "created upload task [%lu] for promise UUID [%{public}@] with cellular access? [%i]", buf, 0x1Cu);
    }
    uint64_t v24 = [*(id *)(a1 + 40) log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = [v10 URL];
      v26 = [v10 allHTTPHeaderFields];
      *(_DWORD *)buf = 138412546;
      uint64_t v30 = (uint64_t)v25;
      __int16 v31 = 2112;
      v32 = v26;
      _os_log_impl(&dword_21FE04000, v24, OS_LOG_TYPE_DEFAULT, "Uploading to [%@] with headers [%@]", buf, 0x16u);
    }
    v27 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_2_cold_1((id *)(a1 + 32), v17);
    }

    v27 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v27();
}

void __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_74(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_74_cold_1(a1, v4);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_76(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_76_cold_1(a1, v4);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)getFilerTokenForPromise:(id)a3 withSuccess:(id)a4 error:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = NSNumber;
  id v11 = a3;
  uint64_t v12 = [(DEDSeedingClient *)self config];
  id v13 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v12, "seedingSubmissionID"));

  id v14 = [v11 UUIDString];

  uint64_t v15 = NSString;
  id v16 = [(DEDSeedingClient *)self config];
  uint64_t v17 = [v16 seedingSubmissionType];
  id v18 = "Unknown";
  if (v17 == 2) {
    id v18 = "FFU";
  }
  if (v17 == 1) {
    id v19 = "FR";
  }
  else {
    id v19 = v18;
  }
  uint64_t v20 = [v15 stringWithUTF8String:v19];

  uint64_t v21 = [(DEDSeedingClient *)self config];

  uint64_t v22 = [(DEDSeedingClient *)self log];
  int v23 = v22;
  if (v21 && v13 && v14 && v20)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[DEDSeedingClient getFilerTokenForPromise:withSuccess:error:]();
    }

    v30[0] = @"Form_Response_ID";
    v30[1] = @"Promise_UUID";
    v31[0] = v13;
    v31[1] = v14;
    v30[2] = @"Token_Type";
    v31[2] = v20;
    uint64_t v24 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];
    id v25 = [(DEDSeedingClient *)self newFilerTokenURL];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __62__DEDSeedingClient_getFilerTokenForPromise_withSuccess_error___block_invoke;
    v27[3] = &unk_26453BD50;
    v27[4] = self;
    id v28 = v8;
    id v29 = v9;
    [(DEDSeedingClient *)self postToURL:v25 parameters:v24 encoding:1 success:v27 error:v29];
  }
  else
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v26 = [(DEDSeedingClient *)self config];
      *(_DWORD *)buf = 138544130;
      __int16 v33 = v26;
      __int16 v34 = 2114;
      uint64_t v35 = v13;
      __int16 v36 = 2114;
      v37 = v14;
      __int16 v38 = 2114;
      v39 = v20;
      _os_log_error_impl(&dword_21FE04000, v23, OS_LOG_TYPE_ERROR, "Cannot get Filer Token. One of these is nil: Config: [%{public}@] Form_Response_ID:[%{public}@] UUID:[%{public}@] Type:[%{public}@]", buf, 0x2Au);
    }
    uint64_t v24 = [MEMORY[0x263F087E8] errorWithDomain:@"FBAFilerErrorDomain" code:3 userInfo:0];
    (*((void (**)(id, void *))v9 + 2))(v9, v24);
  }
}

void __62__DEDSeedingClient_getFilerTokenForPromise_withSuccess_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v19 = 0;
  id v3 = [MEMORY[0x263F08900] JSONObjectWithData:a2 options:0 error:&v19];
  id v4 = v19;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v3;
    v6 = [v5 objectForKeyedSubscript:@"error_code"];
    id v7 = [v5 objectForKeyedSubscript:@"token"];
    if ([v6 isEqual:&unk_26D1AF6F8]) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8 || ![v7 length])
    {
      id v16 = [*(id *)(a1 + 32) log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __62__DEDSeedingClient_getFilerTokenForPromise_withSuccess_error___block_invoke_cold_1(v6, v16);
      }

      uint64_t v17 = *(void *)(a1 + 48);
      id v9 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"FBAFilerErrorDomain", objc_msgSend(v6, "integerValue"), 0);
      (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v9);
    }
    else
    {
      id v9 = [v5 objectForKeyedSubscript:@"dsid"];
      id v10 = [DEDSeedingFilerToken alloc];
      id v11 = NSNumber;
      id v18 = [*(id *)(a1 + 32) config];
      uint64_t v12 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v18, "seedingSubmissionID"));
      id v13 = [*(id *)(a1 + 32) config];
      id v14 = -[DEDSeedingFilerToken initWithEntityID:type:token:dsid:](v10, "initWithEntityID:type:token:dsid:", v12, [v13 seedingSubmissionType], v7, v9);

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 48);
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"FBAFilerErrorDomain" code:2 userInfo:0];
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v5);
  }
}

- (void)dataForURLRequest:(id)a3 success:(id)a4 error:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DEDSeedingClient *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = [v8 HTTPMethod];
    id v13 = [v8 URL];
    id v14 = [v13 path];
    *(_DWORD *)buf = 138543618;
    id v28 = v12;
    __int16 v29 = 2114;
    uint64_t v30 = v14;
    _os_log_impl(&dword_21FE04000, v11, OS_LOG_TYPE_INFO, "-> %{public}@ %{public}@", buf, 0x16u);
  }
  CFTimeInterval v15 = CACurrentMediaTime();
  id v16 = [(DEDSeedingClient *)self foregroundSession];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __52__DEDSeedingClient_dataForURLRequest_success_error___block_invoke;
  v21[3] = &unk_26453BDC8;
  id v22 = v8;
  int v23 = self;
  CFTimeInterval v26 = v15;
  id v24 = v10;
  id v25 = v9;
  id v17 = v9;
  id v18 = v10;
  id v19 = v8;
  uint64_t v20 = [v16 dataTaskWithRequest:v19 completionHandler:v21];

  [v20 resume];
}

void __52__DEDSeedingClient_dataForURLRequest_success_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v25 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  id v10 = [DEDRequestRecord alloc];
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = [*(id *)(a1 + 40) foregroundSession];
  id v13 = [*(id *)(a1 + 40) foregroundSession];
  id v14 = [v13 configuration];
  CFTimeInterval v15 = [v14 HTTPCookieStorage];
  id v16 = [v15 cookies];
  uint64_t v17 = -[DEDRequestRecord initWithRequest:response:session:cookies:body:error:](v10, "initWithRequest:response:session:cookies:body:error:", v11, v9, v12, v16);

  id v18 = (void *)v17;
  id v19 = +[DEDRequestAdvertiser sharedInstance];
  [v19 broadcastRecord:v17];

  if (v8)
  {
    uint64_t v20 = _os_activity_create(&dword_21FE04000, "HTTP Error", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__DEDSeedingClient_dataForURLRequest_success_error___block_invoke_2;
    block[3] = &unk_26453BD78;
    block[4] = *(void *)(a1 + 40);
    id v33 = v9;
    id v34 = v25;
    id v35 = *(id *)(a1 + 32);
    id v36 = v8;
    uint64_t v38 = *(void *)(a1 + 64);
    id v37 = *(id *)(a1 + 48);
    os_activity_apply(v20, block);

    uint64_t v21 = v33;
LABEL_7:

    goto LABEL_8;
  }
  id v22 = objc_msgSend(NSString, "stringWithFormat:", @"%li", objc_msgSend(v9, "statusCode"));
  int v23 = [v22 characterAtIndex:0];

  if (v23 != 50)
  {
    uint64_t v20 = _os_activity_create(&dword_21FE04000, "HTTP Error", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __52__DEDSeedingClient_dataForURLRequest_success_error___block_invoke_3;
    v26[3] = &unk_26453BDA0;
    v26[4] = *(void *)(a1 + 40);
    id v27 = v9;
    id v28 = v25;
    id v29 = *(id *)(a1 + 32);
    uint64_t v31 = *(void *)(a1 + 64);
    id v30 = *(id *)(a1 + 48);
    os_activity_apply(v20, v26);

    uint64_t v21 = v27;
    goto LABEL_7;
  }
  +[DEDFeedbackAnalytics logEventWithRequest:httpStatusCode:nsurlErrorCode:success:startedAt:endedAt:](DEDFeedbackAnalytics, "logEventWithRequest:httpStatusCode:nsurlErrorCode:success:startedAt:endedAt:", *(void *)(a1 + 32), [v9 statusCode], 0, 1, *(double *)(a1 + 64), CACurrentMediaTime());
  uint64_t v24 = *(void *)(a1 + 56);
  if (v24) {
    (*(void (**)(uint64_t, id))(v24 + 16))(v24, v25);
  }
LABEL_8:
}

uint64_t __52__DEDSeedingClient_dataForURLRequest_success_error___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) HTTPErrorWithResponse:*(void *)(a1 + 40) withData:*(void *)(a1 + 48)];
  +[DEDFeedbackAnalytics logEventWithRequest:httpStatusCode:nsurlErrorCode:success:startedAt:endedAt:](DEDFeedbackAnalytics, "logEventWithRequest:httpStatusCode:nsurlErrorCode:success:startedAt:endedAt:", *(void *)(a1 + 56), [*(id *)(a1 + 40) statusCode], objc_msgSend(*(id *)(a1 + 64), "code"), 0, *(double *)(a1 + 80), CACurrentMediaTime());
  uint64_t result = *(void *)(a1 + 72);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __52__DEDSeedingClient_dataForURLRequest_success_error___block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) HTTPErrorWithResponse:*(void *)(a1 + 40) withData:*(void *)(a1 + 48)];
  +[DEDFeedbackAnalytics logEventWithRequest:httpStatusCode:nsurlErrorCode:success:startedAt:endedAt:](DEDFeedbackAnalytics, "logEventWithRequest:httpStatusCode:nsurlErrorCode:success:startedAt:endedAt:", *(void *)(a1 + 56), [*(id *)(a1 + 40) statusCode], 0, 0, *(double *)(a1 + 72), CACurrentMediaTime());
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2) {
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)jsonForURLRequest:(id)a3 success:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __52__DEDSeedingClient_jsonForURLRequest_success_error___block_invoke;
  v14[3] = &unk_26453BDF0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__DEDSeedingClient_jsonForURLRequest_success_error___block_invoke_104;
  v12[3] = &unk_26453BE18;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(DEDSeedingClient *)self dataForURLRequest:a3 success:v14 error:v12];
}

void __52__DEDSeedingClient_jsonForURLRequest_success_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 40))
  {
    id v8 = 0;
    id v3 = [MEMORY[0x263F08900] JSONObjectWithData:a2 options:0 error:&v8];
    id v4 = v8;
    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __52__DEDSeedingClient_jsonForURLRequest_success_error___block_invoke_cold_1();
      }

      uint64_t v6 = *(void *)(a1 + 48);
      if (!v6) {
        goto LABEL_9;
      }
      id v7 = *(void (**)(void))(v6 + 16);
    }
    else
    {
      id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v7();
LABEL_9:
  }
}

uint64_t __52__DEDSeedingClient_jsonForURLRequest_success_error___block_invoke_104(uint64_t a1)
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
  [(DEDSeedingClient *)self dataForURLRequest:v11 success:v10 error:v9];
}

- (void)jsonForURL:(id)a3 success:(id)a4 error:(id)a5
{
  id v8 = (void *)MEMORY[0x263F08BD8];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 requestWithURL:a3];
  [(DEDSeedingClient *)self jsonForURLRequest:v11 success:v10 error:v9];
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
  [(DEDSeedingClient *)self dataForURLRequest:v11 success:v10 error:v9];
}

- (void)performHTTPMethod:(id)a3 toURL:(id)a4 parameters:(id)a5 encoding:(unint64_t)a6 success:(id)a7 error:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  id v16 = (void *)MEMORY[0x263F089E0];
  id v17 = a5;
  id v18 = a3;
  id v19 = [v16 requestWithURL:a4];
  [v19 setHTTPMethod:v18];

  id v28 = 0;
  uint64_t v20 = [(DEDSeedingClient *)self bodyDataForParameters:v17 encoding:a6 error:&v28];

  id v21 = v28;
  if (v20)
  {
    [v19 setHTTPBody:v20];
    id v22 = [(DEDSeedingClient *)self contentTypeForParameterEncoding:a6];
    [v19 setValue:v22 forHTTPHeaderField:@"Content-Type"];
  }
  if (v21)
  {
    int v23 = [(DEDSeedingClient *)self log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[DEDSeedingClient performHTTPMethod:toURL:parameters:encoding:success:error:]();
    }

    uint64_t v24 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__DEDSeedingClient_performHTTPMethod_toURL_parameters_encoding_success_error___block_invoke;
    block[3] = &unk_26453A5E8;
    id v27 = v15;
    id v26 = v21;
    dispatch_async(v24, block);
  }
  else
  {
    [(DEDSeedingClient *)self dataForURLRequest:v19 success:v14 error:v15];
  }
}

uint64_t __78__DEDSeedingClient_performHTTPMethod_toURL_parameters_encoding_success_error___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (id)beginUploadWithRequest:(id)a3 fromFileURL:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v20 = 0;
  int v10 = [v9 checkResourceIsReachableAndReturnError:&v20];
  id v11 = v20;
  uint64_t v12 = v11;
  if (!v10 || v11)
  {
    id v18 = [(DEDSeedingClient *)self log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[DEDSeedingClient beginUploadWithRequest:fromFileURL:error:]((uint64_t)v9, v12, v18);
    }

    id v14 = 0;
    if (a5) {
      *a5 = v12;
    }
  }
  else
  {
    id v13 = [(DEDSeedingClient *)self backgroundSession];
    id v14 = [v13 uploadTaskWithRequest:v8 fromFile:v9];

    id v15 = [(DEDSeedingClient *)self log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v14 taskIdentifier];
      id v17 = [(DEDSeedingClient *)self bugSessionIdentifier];
      *(_DWORD *)buf = 134218242;
      uint64_t v22 = v16;
      __int16 v23 = 2114;
      uint64_t v24 = v17;
      _os_log_impl(&dword_21FE04000, v15, OS_LOG_TYPE_DEFAULT, "Beginning upload task with identifier [%lu] for session [%{public}@]", buf, 0x16u);
    }
    [v14 resume];
  }

  return v14;
}

- (id)ongoingUploads
{
  id v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:5];
  id v5 = [(DEDSeedingClient *)self backgroundSession];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __34__DEDSeedingClient_ongoingUploads__block_invoke;
  v13[3] = &unk_26453BE40;
  id v6 = v4;
  id v14 = v6;
  uint64_t v16 = &v17;
  id v7 = v3;
  id v15 = v7;
  [v5 getAllTasksWithCompletionHandler:v13];

  dispatch_time_t v8 = dispatch_time(0, 2000000000);
  dispatch_group_wait(v7, v8);
  if (!*((unsigned char *)v18 + 24))
  {
    id v9 = [(DEDSeedingClient *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[DEDSeedingClient ongoingUploads](v9);
    }
  }
  int v10 = v15;
  id v11 = v6;

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __34__DEDSeedingClient_ongoingUploads__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addObjectsFromArray:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  id v3 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v3);
}

- (void)cleanup
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [(DEDSeedingClient *)self backgroundSession];
  [v3 invalidateAndCancel];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(DEDSeedingClient *)self foregroundSession];
  id v5 = [v4 configuration];
  id v6 = [v5 HTTPCookieStorage];
  id v7 = [v6 cookies];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        id v13 = [(DEDSeedingClient *)self foregroundSession];
        id v14 = [v13 configuration];
        id v15 = [v14 HTTPCookieStorage];
        [v15 deleteCookie:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)makePromiseWithUUID:(id)a3 extensionID:(id)a4 success:(id)a5 error:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v15 = [(DEDSeedingClient *)self promiseConfiguration];
  long long v16 = (void *)[v14 initWithDictionary:v15];

  long long v17 = [v10 UUIDString];
  [v16 setObject:v17 forKeyedSubscript:@"uuid"];

  if (v11) {
    [v16 setObject:v11 forKeyedSubscript:@"de_bundle_identifier"];
  }
  long long v18 = [(DEDSeedingClient *)self log];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    long long v19 = [v10 UUIDString];
    *(_DWORD *)buf = 138543618;
    id v35 = v19;
    __int16 v36 = 2114;
    id v37 = v11;
    _os_log_impl(&dword_21FE04000, v18, OS_LOG_TYPE_DEFAULT, "will make promise with uuid: [%{public}@] extension: [%{public}@]", buf, 0x16u);
  }
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke;
  v28[3] = &unk_26453BE90;
  v28[4] = self;
  id v29 = v16;
  id v30 = v10;
  id v31 = v11;
  id v32 = v12;
  id v33 = v13;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke_125;
  v25[3] = &unk_26453BD28;
  v25[4] = self;
  id v26 = v29;
  id v27 = v33;
  id v20 = v33;
  id v21 = v29;
  id v22 = v12;
  id v23 = v11;
  id v24 = v10;
  [(DEDSeedingClient *)self seedingLoginWithSuccess:v28 error:v25];
}

void __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)[v2 newFilePromiseURL];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke_2;
  v7[3] = &unk_26453BE68;
  uint64_t v4 = *(void *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke_124;
  v5[3] = &unk_26453BCD8;
  v5[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 72);
  [v2 postToURL:v3 parameters:v4 encoding:2 success:v7 error:v5];
}

uint64_t __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 40) UUIDString];
    uint64_t v4 = *(void *)(a1 + 48);
    int v6 = 138543618;
    id v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_INFO, "did make promise with uuid: [%{public}@] extension: [%{public}@]", (uint8_t *)&v6, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke_124(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke_124_cold_1(v3, v4);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke_125(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke_125_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);
  }
}

- (void)getPromise:(id)a3 withSuccess:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __49__DEDSeedingClient_getPromise_withSuccess_error___block_invoke;
  v17[3] = &unk_26453BEE0;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __49__DEDSeedingClient_getPromise_withSuccess_error___block_invoke_4;
  v14[3] = &unk_26453BD28;
  v14[4] = self;
  id v15 = v18;
  id v16 = v20;
  id v11 = v20;
  id v12 = v18;
  id v13 = v9;
  [(DEDSeedingClient *)self seedingLoginWithSuccess:v17 error:v14];
}

void __49__DEDSeedingClient_getPromise_withSuccess_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 filePromiseURLForPromise:*(void *)(a1 + 40)];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__DEDSeedingClient_getPromise_withSuccess_error___block_invoke_2;
  v6[3] = &unk_26453BEB8;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__DEDSeedingClient_getPromise_withSuccess_error___block_invoke_3;
  v4[3] = &unk_26453BE18;
  id v5 = *(id *)(a1 + 56);
  [v2 jsonForURL:v3 success:v6 error:v4];
}

uint64_t __49__DEDSeedingClient_getPromise_withSuccess_error___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __49__DEDSeedingClient_getPromise_withSuccess_error___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __49__DEDSeedingClient_getPromise_withSuccess_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __49__DEDSeedingClient_getPromise_withSuccess_error___block_invoke_4_cold_1(a1, v4);
    }
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)updatePromise:(id)a3 withAttachmentGroup:(id)a4 status:(int64_t)a5 success:(id)a6 error:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v19 = [v14 archiveName];
  id v16 = [v14 totalFileSize];
  uint64_t v17 = [v16 integerValue];

  id v18 = [v14 extensionID];

  [(DEDSeedingClient *)self updatePromise:v15 withFilename:v19 size:v17 extensionID:v18 status:a5 success:v13 error:v12];
}

- (void)updatePromise:(id)a3 withFilename:(id)a4 size:(int64_t)a5 status:(int64_t)a6 success:(id)a7 error:(id)a8
{
  id v14 = a4;
  id v15 = a8;
  id v16 = a7;
  id v17 = a3;
  id v18 = [(DEDSeedingClient *)self log];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[DEDSeedingClient updatePromise:withFilename:size:status:success:error:]((uint64_t)v14, v18);
  }

  [(DEDSeedingClient *)self updatePromise:v17 withFilename:v14 size:a5 extensionID:0 status:a6 success:v16 error:v15];
}

- (void)updatePromise:(id)a3 withFilename:(id)a4 size:(int64_t)a5 extensionID:(id)a6 status:(int64_t)a7 success:(id)a8 error:(id)a9
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  id v20 = [(DEDSeedingClient *)self log];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = v16;
    id v28 = v18;
    id v21 = [v15 UUIDString];
    id v22 = "user_canceled";
    switch(a7)
    {
      case 0:
        break;
      case 1:
        id v22 = "promised";
        break;
      case 2:
        id v22 = "collected";
        break;
      case 3:
        id v22 = "uploading";
        break;
      case 4:
        id v22 = "uploaded";
        break;
      case 5:
        id v22 = "received";
        break;
      case 6:
        id v22 = "virus_scanning";
        break;
      case 7:
        id v22 = "analyzing:";
        break;
      case 8:
        id v22 = "done";
        break;
      case 9:
      case 10:
      case 11:
      case 12:
        goto LABEL_6;
      case 13:
        id v22 = "deleted";
        break;
      case 14:
        id v22 = "user_delete_requested";
        break;
      case 15:
        id v22 = "user_deleted";
        break;
      default:
        if (a7 == 99) {
          id v22 = "upload_error";
        }
        else {
LABEL_6:
        }
          id v22 = "Unknown";
        break;
    }
    id v23 = [NSNumber numberWithLongLong:a5];
    *(_DWORD *)buf = 138544386;
    v43 = v21;
    __int16 v44 = 2114;
    id v45 = v17;
    __int16 v46 = 2082;
    v47 = v22;
    __int16 v48 = 2114;
    id v16 = v27;
    id v49 = v27;
    __int16 v50 = 2114;
    v51 = v23;
    _os_log_impl(&dword_21FE04000, v20, OS_LOG_TYPE_DEFAULT, "Will update [%{public}@ | %{public}@ ] with status [%{public}s] filename [%{public}@] file size [%{public}@]", buf, 0x34u);

    id v18 = v28;
  }

  if (v15)
  {
    id v24 = "user_canceled";
    switch(a7)
    {
      case 0:
        break;
      case 1:
        id v24 = "promised";
        break;
      case 2:
        id v24 = "collected";
        break;
      case 3:
        id v24 = "uploading";
        break;
      case 4:
        id v24 = "uploaded";
        break;
      case 5:
        id v24 = "received";
        break;
      case 6:
        id v24 = "virus_scanning";
        break;
      case 7:
        id v24 = "analyzing:";
        break;
      case 8:
        id v24 = "done";
        break;
      case 9:
      case 10:
      case 11:
      case 12:
        goto LABEL_25;
      case 13:
        id v24 = "deleted";
        break;
      case 14:
        id v24 = "user_delete_requested";
        break;
      case 15:
        id v24 = "user_deleted";
        break;
      default:
        if (a7 == 99) {
          id v24 = "upload_error";
        }
        else {
LABEL_25:
        }
          id v24 = "Unknown";
        break;
    }
    id v26 = [NSString stringWithUTF8String:v24];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke;
    v33[3] = &unk_26453BF30;
    id v34 = v16;
    id v35 = v17;
    int64_t v41 = a5;
    id v36 = v15;
    id v37 = self;
    id v38 = v26;
    id v39 = v18;
    id v40 = v19;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke_141;
    v29[3] = &unk_26453BF58;
    v29[4] = self;
    id v30 = v36;
    id v31 = v38;
    id v32 = v40;
    uint64_t v25 = v38;
    [(DEDSeedingClient *)self seedingLoginWithSuccess:v33 error:v29];
  }
  else
  {
    uint64_t v25 = [(DEDSeedingClient *)self log];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[DEDSeedingClient updatePromise:withFilename:size:extensionID:status:success:error:]();
    }
  }
}

void __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke(uint64_t a1)
{
  v32[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:6];
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    [v2 setObject:v4 forKeyedSubscript:@"name"];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"de_bundle_identifier"];
  }
  uint64_t v6 = [NSNumber numberWithLongLong:*(void *)(a1 + 88)];
  [v3 setObject:v6 forKeyedSubscript:@"size"];

  id v7 = [*(id *)(a1 + 48) UUIDString];
  [v3 setObject:v7 forKeyedSubscript:@"uuid"];

  id v8 = [*(id *)(a1 + 56) promiseConfiguration];
  [v3 addEntriesFromDictionary:v8];

  uint64_t v9 = *(void *)(a1 + 64);
  v31[0] = @"status";
  v31[1] = @"options";
  v32[0] = v9;
  v32[1] = v3;
  id v10 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
  id v11 = [*(id *)(a1 + 56) log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [*(id *)(a1 + 48) UUIDString];
    uint64_t v13 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138543618;
    id v28 = v12;
    __int16 v29 = 2114;
    uint64_t v30 = v13;
    _os_log_impl(&dword_21FE04000, v11, OS_LOG_TYPE_INFO, "will update promise [%{public}@] with status [%{public}@]", buf, 0x16u);
  }
  id v14 = *(void **)(a1 + 56);
  id v15 = [v14 filePromiseURLForPromise:*(void *)(a1 + 48)];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke_139;
  v22[3] = &unk_26453BF08;
  int8x16_t v18 = *(int8x16_t *)(a1 + 48);
  id v16 = (id)v18.i64[0];
  int8x16_t v23 = vextq_s8(v18, v18, 8uLL);
  id v24 = *(id *)(a1 + 64);
  id v25 = *(id *)(a1 + 32);
  id v26 = *(id *)(a1 + 72);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke_140;
  v19[3] = &unk_26453BD28;
  id v17 = *(void **)(a1 + 64);
  v19[4] = *(void *)(a1 + 56);
  id v20 = v17;
  id v21 = *(id *)(a1 + 80);
  [v14 putToURL:v15 parameters:v10 encoding:2 success:v22 error:v19];
}

uint64_t __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke_139(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 40) UUIDString];
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    int v7 = 138543874;
    id v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v5;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, "did update promise [%{public}@] [%{public}@] [%{public}@]", (uint8_t *)&v7, 0x20u);
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke_140(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke_140_cold_1(a1, v3);
  }

  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke_141(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke_141_cold_1(a1);
    }
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)cancelPromise:(id)a3 withSuccess:(id)a4 error:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  __int16 v11 = [(DEDSeedingClient *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v8 UUIDString];
    int v13 = 138543362;
    id v14 = v12;
    _os_log_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEFAULT, "Will cancel promise [%{public}@]", (uint8_t *)&v13, 0xCu);
  }
  [(DEDSeedingClient *)self updatePromise:v8 withFilename:&stru_26D197018 size:0 status:0 success:v10 error:v9];
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DEDSeedingClient *)self log];
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[DEDSeedingClient URLSession:didBecomeInvalidWithError:](v6);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v10 = [v6 configuration];
    __int16 v11 = [v10 identifier];
    int v12 = 138543362;
    int v13 = v11;
    _os_log_impl(&dword_21FE04000, v9, OS_LOG_TYPE_INFO, "URL Session [%{public}@] became invalid", (uint8_t *)&v12, 0xCu);
  }
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DEDSeedingClient *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 configuration];
    id v7 = [v6 identifier];
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_INFO, "did finish event for URL Session [%{public}@]", (uint8_t *)&v8, 0xCu);
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  __int16 v11 = [(DEDSeedingClient *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [v8 configuration];
    int v13 = [v12 identifier];
    int v33 = 138543362;
    id v34 = v13;
    _os_log_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEFAULT, "URL Session [%{public}@] did receive challenge", (uint8_t *)&v33, 0xCu);
  }
  uint64_t v14 = [(DEDSeedingClient *)self config];
  uint64_t v15 = [v14 seedingEnvironment];

  if (v15 == 4)
  {
    id v16 = [(DEDSeedingClient *)self log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33) = 0;
      id v17 = "Running in development mode; skipping pinning check.";
LABEL_15:
      _os_log_impl(&dword_21FE04000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v33, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  int8x16_t v18 = [v9 protectionSpace];
  id v19 = [v18 host];
  id v20 = [(DEDSeedingClient *)self baseURL];
  id v21 = [v20 host];
  char v22 = [v19 isEqualToString:v21];

  if ((v22 & 1) == 0)
  {
    id v16 = [(DEDSeedingClient *)self log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33) = 0;
      id v17 = "Connecting to other server; skipping pinning check.";
      goto LABEL_15;
    }
LABEL_16:

    goto LABEL_17;
  }
  int8x16_t v23 = [v9 protectionSpace];
  id v24 = [v23 authenticationMethod];
  int v25 = [v24 isEqualToString:*MEMORY[0x263F08560]];

  if (!v25)
  {
LABEL_17:
    v10[2](v10, 1, 0);
    goto LABEL_18;
  }
  id v26 = [(DEDSeedingClient *)self baseURL];
  id v27 = [v26 host];

  uint64_t AppleSSLPinned = SecPolicyCreateAppleSSLPinned();
  if (!AppleSSLPinned) {
    goto LABEL_11;
  }
  __int16 v29 = (const void *)AppleSSLPinned;
  uint64_t v30 = [v9 protectionSpace];
  id v31 = (__SecTrust *)[v30 serverTrust];

  LODWORD(v30) = SecTrustSetPolicies(v31, v29);
  CFRelease(v29);
  if (v30) {
    goto LABEL_11;
  }
  int v33 = 0;
  if (!MEMORY[0x223C5FB80](v31, &v33) && (v33 == 4 || v33 == 1))
  {
    id v32 = [MEMORY[0x263F08BB8] credentialForTrust:v31];
    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v32);
  }
  else
  {
LABEL_11:
    v10[2](v10, 2, 0);
  }

LABEL_18:
}

- (id)_serverErrorFromTask:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 response];
  uint64_t v6 = [v5 statusCode];

  id v7 = [(DEDSeedingClient *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[DEDSeedingClient _serverErrorFromTask:]();
  }

  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%li", v6);
  int v9 = [v8 characterAtIndex:0];

  uint64_t v10 = 0;
  if (v9 != 50)
  {
    __int16 v11 = objc_opt_new();
    int v12 = [v4 originalRequest];
    int v13 = [v12 valueForHTTPHeaderField:@"Form_Response_ID"];

    if (v13) {
      [v11 setObject:v13 forKeyedSubscript:@"Form_Response_ID"];
    }
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:@"HTTPErrorDomain" code:v6 userInfo:v11];
    uint64_t v14 = [(DEDSeedingClient *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      [(DEDSeedingClient *)(uint64_t)v13 _serverErrorFromTask:v14];
    }
  }
  return v10;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a4;
  unint64_t v8 = (unint64_t)a5;
  uint64_t v9 = [(DEDSeedingClient *)self _serverErrorFromTask:v7];
  uint64_t v10 = [(DEDSeedingClient *)self log];
  __int16 v11 = v10;
  if (v8 | v9)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    uint64_t v12 = [v7 taskIdentifier];
    uint64_t v13 = [(DEDSeedingClient *)self bugSessionIdentifier];
    uint64_t v14 = (void *)v13;
    *(_DWORD *)id v20 = 134218498;
    if (v8) {
      uint64_t v15 = v8;
    }
    else {
      uint64_t v15 = v9;
    }
    *(void *)&v20[4] = v12;
    __int16 v21 = 2114;
    uint64_t v22 = v13;
    __int16 v23 = 2114;
    uint64_t v24 = v15;
    _os_log_error_impl(&dword_21FE04000, v11, OS_LOG_TYPE_ERROR, "Upload task [%lu] for session [%{public}@] completed with error %{public}@", v20, 0x20u);
  }
  else
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    uint64_t v16 = [v7 taskIdentifier];
    uint64_t v14 = [(DEDSeedingClient *)self bugSessionIdentifier];
    *(_DWORD *)id v20 = 134218242;
    *(void *)&v20[4] = v16;
    __int16 v21 = 2114;
    uint64_t v22 = (uint64_t)v14;
    _os_log_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEFAULT, "Upload task [%lu] completed successfully for session [%{public}@]", v20, 0x16u);
  }

LABEL_10:
  id v17 = [(DEDSeedingClient *)self uploadDelegate];
  int8x16_t v18 = v17;
  if (v8) {
    uint64_t v19 = v8;
  }
  else {
    uint64_t v19 = v9;
  }
  objc_msgSend(v17, "uploadTask:didCompleteWithError:", v7, v19, *(void *)v20);
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v10 = a4;
  id v11 = [(DEDSeedingClient *)self uploadDelegate];
  [v11 uploadTask:v10 didSendBytes:a6 totalBytesExpectedToSend:a7];
}

- (id)baseURL
{
  id v3 = [(DEDSeedingClient *)self config];
  uint64_t v4 = [v3 seedingEnvironment];

  if ((unint64_t)(v4 - 2) > 3)
  {
    uint64_t v6 = @"https://fba.apple.com/";
  }
  else
  {
    uint64_t v5 = [(DEDSeedingClient *)self config];
    uint64_t v6 = [v5 seedingHost];
  }
  id v7 = [NSURL URLWithString:v6];
  unint64_t v8 = v7;
  if (!v7 || ([v7 host], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    uint64_t v10 = [NSURL URLWithString:@"https://fba.apple.com/"];

    unint64_t v8 = (void *)v10;
  }

  return v8;
}

- (id)seedingURL
{
  id v3 = [(DEDSeedingClient *)self config];
  unint64_t v4 = [v3 seedingEnvironment];

  if (v4 < 4 || v4 == 5)
  {
    uint64_t v6 = [(DEDSeedingClient *)self baseURL];
    uint64_t v5 = [v6 URLByAppendingPathComponent:@"sp"];
  }
  else if (v4 == 4)
  {
    uint64_t v5 = [(DEDSeedingClient *)self baseURL];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)loginWithTokenURL
{
  uint64_t v2 = [(DEDSeedingClient *)self seedingURL];
  id v3 = [v2 URLByAppendingPathComponent:@"login/with_token"];

  return v3;
}

- (id)newFilePromiseURL
{
  uint64_t v2 = [(DEDSeedingClient *)self seedingURL];
  id v3 = [v2 URLByAppendingPathComponent:@"feedback/file_promise/new"];

  return v3;
}

- (id)filePromiseURLForPromise:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DEDSeedingClient *)self seedingURL];
  uint64_t v6 = NSString;
  id v7 = [v4 UUIDString];

  unint64_t v8 = [v6 stringWithFormat:@"feedback/file_promise/%@", v7];
  uint64_t v9 = [v5 URLByAppendingPathComponent:v8];

  return v9;
}

- (id)newFilerTokenURL
{
  uint64_t v2 = [(DEDSeedingClient *)self seedingURL];
  id v3 = [v2 URLByAppendingPathComponent:@"feedback/filer/get_token"];

  return v3;
}

- (id)filerURL
{
  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v4 = [v3 stringForKey:@"FBAFilerURL"];

  if (!v4 || ![(__CFString *)v4 length])
  {
    uint64_t v6 = [(DEDSeedingClient *)self config];
    if ([v6 seedingEnvironment] == 3)
    {
    }
    else
    {
      id v7 = [(DEDSeedingClient *)self config];
      uint64_t v8 = [v7 seedingEnvironment];

      if (v8 != 4)
      {

        id v4 = @"https://cssubmissions.apple.com/CusSeedSub/submit?version=2";
        goto LABEL_11;
      }
    }

    id v4 = @"https://cssubmissions-uat.corp.apple.com/CusSeedSub/submit?version=2";
    goto LABEL_11;
  }
  uint64_t v5 = [(DEDSeedingClient *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_INFO, "Using user default value for filer URL", v11, 2u);
  }

LABEL_11:
  uint64_t v9 = [NSURL URLWithString:v4];

  return v9;
}

- (id)HTTPErrorWithResponse:(id)a3 withData:(id)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 allHeaderFields];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"Content-Type"];
  if ([v8 containsString:@"application/json"]
    && [v5 statusCode] != 404)
  {
    uint64_t v9 = (__CFString *)[[NSString alloc] initWithData:v6 encoding:4];
  }
  else
  {
    uint64_t v9 = 0;
  }

  id v10 = objc_alloc(MEMORY[0x263EFF9A0]);
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = &stru_26D197018;
  }
  uint64_t v19 = @"body";
  v20[0] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
  uint64_t v13 = (void *)[v10 initWithDictionary:v12];

  if (v5)
  {
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "statusCode"));
    [v13 setObject:v14 forKeyedSubscript:@"HTTP Status Code"];

    uint64_t v15 = [v5 URL];

    if (v15)
    {
      uint64_t v16 = [v5 URL];
      [v13 setObject:v16 forKeyedSubscript:@"URL"];
    }
  }
  id v17 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"HTTPErrorDomain", objc_msgSend(v5, "statusCode"), v13);

  return v17;
}

- (id)promiseConfiguration
{
  v18[4] = *MEMORY[0x263EF8340];
  v17[0] = @"parent_type";
  id v3 = NSString;
  id v4 = [(DEDSeedingClient *)self config];
  uint64_t v5 = [v4 seedingSubmissionType];
  id v6 = "Unknown";
  if (v5 == 2) {
    id v6 = "FeedbackFollowup";
  }
  if (v5 == 1) {
    id v7 = "FormResponse";
  }
  else {
    id v7 = v6;
  }
  uint64_t v8 = [v3 stringWithUTF8String:v7];
  v18[0] = v8;
  v17[1] = @"parent_id";
  uint64_t v9 = NSNumber;
  id v10 = [(DEDSeedingClient *)self config];
  id v11 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "seedingSubmissionID"));
  v18[1] = v11;
  void v17[2] = @"device_udid";
  uint64_t v12 = +[DEDUtils uniqueDeviceSpecifier];
  v18[2] = v12;
  v17[3] = @"build";
  uint64_t v13 = +[DEDDevice currentDevice];
  uint64_t v14 = [v13 build];
  v18[3] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

- (id)bodyDataForParameters:(id)a3 encoding:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (!v8) {
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    uint64_t v9 = [(DEDSeedingClient *)self _formEncodedBodyForDictionary:v8];
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
  uint64_t v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"description" ascending:1 selector:sel_caseInsensitiveCompare_];
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
        uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v14 = [v25 objectForKey:v13];
        uint64_t v15 = [v13 description];
        uint64_t v16 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@":/?#[]@!$&'(void)*+,="];;
        id v17 = [v16 invertedSet];
        int8x16_t v18 = [v15 stringByAddingPercentEncodingWithAllowedCharacters:v17];
        uint64_t v19 = [(DEDSeedingClient *)self _keyValuePairsForKey:v18 value:v14];
        [v8 addObjectsFromArray:v19];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }

  id v20 = [v8 componentsJoinedByString:@"&"];
  __int16 v21 = [v20 dataUsingEncoding:4];

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
          uint64_t v16 = v5;
          if (*(void *)v47 != v39) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          int8x16_t v18 = NSString;
          uint64_t v19 = [v17 description];
          id v20 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@":/?#[]@!$&'()*+,="];;
          __int16 v21 = [v20 invertedSet];
          uint64_t v22 = [v19 stringByAddingPercentEncodingWithAllowedCharacters:v21];
          __int16 v23 = [v18 stringWithFormat:@"%@[%@]", v40, v22];

          id v5 = v16;
          uint64_t v24 = [v16 objectForKeyedSubscript:v17];
          uint64_t v25 = [(DEDSeedingClient *)self _keyValuePairsForKey:v23 value:v24];
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
          id v31 = [(DEDSeedingClient *)self _keyValuePairsForKey:v12 value:*(void *)(*((void *)&v42 + 1) + 8 * j)];
          [v11 addObjectsFromArray:v31];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v51 count:16];
      }
      while (v28);
    }

    goto LABEL_20;
  }
  id v34 = NSString;
  id v12 = [v5 description];
  uint64_t v11 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@":/?#[]@!$&'()*+,="];;
  uint64_t v35 = [v11 invertedSet];
  id v36 = [v12 stringByAddingPercentEncodingWithAllowedCharacters:v35];
  id v37 = [v34 stringWithFormat:@"%@=%@", v40, v36];
  __int16 v50 = v37;
  id v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];

LABEL_21:
  return v32;
}

- (BOOL)isLoggedIn
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = [(DEDSeedingClient *)self config];
  uint64_t v4 = [v3 seedingEnvironment];

  if (v4 == 3) {
    id v5 = @"_seedportal_session_uat";
  }
  else {
    id v5 = @"_seedportal_session";
  }
  id v6 = [(DEDSeedingClient *)self foregroundSession];
  id v7 = [v6 configuration];
  id v8 = [v7 HTTPCookieStorage];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = [(DEDSeedingClient *)self baseURL];
  uint64_t v10 = [v8 cookiesForURL:v9];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v24 = self;
    uint64_t v13 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "expiresDate", v24);
        id v17 = [MEMORY[0x263EFF910] date];
        if ([v17 compare:v16] == -1)
        {
          int8x16_t v18 = [v15 name];
          int v19 = [v18 isEqualToString:v5];

          if (v19)
          {
            __int16 v21 = [(DEDSeedingClient *)v24 log];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              uint64_t v22 = [(DEDSeedingClient *)v24 baseURL];
              *(_DWORD *)buf = 138543618;
              uint64_t v30 = v22;
              __int16 v31 = 2114;
              id v32 = v5;
              _os_log_impl(&dword_21FE04000, v21, OS_LOG_TYPE_INFO, "has valid cookie from [%{public}@] name [%{public}@]", buf, 0x16u);
            }
            BOOL v20 = 1;
            goto LABEL_18;
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    BOOL v20 = 0;
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_18:

  return v20;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLog:(id)a3
{
}

- (DEDBugSessionConfiguration)config
{
  return (DEDBugSessionConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfig:(id)a3
{
}

- (DEDSeedingClientDelegate)uploadDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uploadDelegate);
  return (DEDSeedingClientDelegate *)WeakRetained;
}

- (void)setUploadDelegate:(id)a3
{
}

- (NSURLSession)foregroundSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 32, 1);
}

- (void)setForegroundSession:(id)a3
{
}

- (NSString)bugSessionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBugSessionIdentifier:(id)a3
{
}

- (NSURLSession)backgroundSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBackgroundSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundSession, 0);
  objc_storeStrong((id *)&self->_bugSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_foregroundSession, 0);
  objc_destroyWeak((id *)&self->_uploadDelegate);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)initWithConfiguration:(uint64_t)a3 sessionID:(uint64_t)a4 delegate:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__DEDSeedingClient_seedingLoginWithSuccess_error___block_invoke_49_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "Error logging in: [%{public}@]", v2, v3, v4, v5, v6);
}

void __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_2_cold_1(id *a1, void *a2)
{
  uint64_t v3 = [*a1 UUIDString];
  uint64_t v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_3(&dword_21FE04000, v5, v6, "Error creating upload task for promise [%{public}@]. Error: %{public}@", v7, v8, v9, v10, 2u);
}

void __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_74_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)OUTLINED_FUNCTION_7_1(a1) UUIDString];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_4(&dword_21FE04000, a2, v4, "Error getting token to upload promise: [%{public}@]", v5);
}

void __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_76_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)OUTLINED_FUNCTION_7_1(a1) UUIDString];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_4(&dword_21FE04000, a2, v4, "Error logging in to upload promise: [%{public}@]", v5);
}

- (void)getFilerTokenForPromise:withSuccess:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_21FE04000, v0, OS_LOG_TYPE_DEBUG, "Getting Filer Token for promise UUID [%{public}@]", v1, 0xCu);
}

void __62__DEDSeedingClient_getFilerTokenForPromise_withSuccess_error___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = [a1 intValue];
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "Failed to get Filer Token with error code [%i]", (uint8_t *)v3, 8u);
}

void __52__DEDSeedingClient_jsonForURLRequest_success_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "Could not create object from JSON data. Error %@", v2, v3, v4, v5, v6);
}

- (void)performHTTPMethod:toURL:parameters:encoding:success:error:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "performHTTPMethod failed with error %@", v2, v3, v4, v5, v6);
}

- (void)beginUploadWithRequest:(uint64_t)a1 fromFileURL:(void *)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 localizedDescription];
  int v6 = 138543618;
  uint64_t v7 = a1;
  OUTLINED_FUNCTION_4_2();
  _os_log_fault_impl(&dword_21FE04000, a3, OS_LOG_TYPE_FAULT, "File [%{public}@] doesn't exist on disk. Not creating upload task. Error: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)ongoingUploads
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "Failed to get upload tasks. Timed out.", v1, 2u);
}

void __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke_124_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_4(&dword_21FE04000, a2, v4, "make promise failed with error [%{public}@]", v5);
}

void __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke_125_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __49__DEDSeedingClient_getPromise_withSuccess_error___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)OUTLINED_FUNCTION_7_1(a1) UUIDString];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_4(&dword_21FE04000, a2, v4, "Error logging in to get promise: [%{public}@]", v5);
}

- (void)updatePromise:(uint64_t)a1 withFilename:(NSObject *)a2 size:status:success:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[DEDSeedingClient updatePromise:withFilename:size:status:success:error:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_21FE04000, a2, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)&v2, 0x16u);
}

- (void)updatePromise:withFilename:size:extensionID:status:success:error:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "nil uuid promise for file [%{public}@] cannot update", v2, v3, v4, v5, v6);
}

void __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke_140_cold_1(uint64_t a1, void *a2)
{
  uint64_t v8 = [a2 description];
  OUTLINED_FUNCTION_1_3(&dword_21FE04000, v2, v3, "update promise to [%{public}@] failed with error [%{public}@]", v4, v5, v6, v7, 2u);
}

void __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke_141_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_7_1(a1) UUIDString];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_3(&dword_21FE04000, v2, v3, "Error logging in to update promise: [%{public}@] with status [%{public}@]", v4, v5, v6, v7, v8);
}

- (void)URLSession:(void *)a1 didBecomeInvalidWithError:.cold.1(void *a1)
{
  uint64_t v1 = [a1 configuration];
  uint64_t v2 = [v1 identifier];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_3(&dword_21FE04000, v3, v4, "URL Session [%{public}@] became invalid with error %{public}@", v5, v6, v7, v8, v9);
}

- (void)_serverErrorFromTask:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_9_0(&dword_21FE04000, a2, a3, "did complete upload with HTTP error [%ld] for upload identifier [%{public}@]", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_serverErrorFromTask:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_21FE04000, v0, OS_LOG_TYPE_DEBUG, "session task returned [%li] status code", v1, 0xCu);
}

- (void)HTTPErrorWithResponse:withData:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9_0(&dword_21FE04000, v0, v1, "Exception [%{public}@] decoding HTTP error for response [%{public}@]");
}

@end