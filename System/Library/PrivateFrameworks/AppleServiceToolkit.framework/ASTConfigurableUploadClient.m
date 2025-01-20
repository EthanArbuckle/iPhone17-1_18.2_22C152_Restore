@interface ASTConfigurableUploadClient
- (ASTConfigurableUploadClient)initWithASTSession:(id)a3 withDelegate:(id)a4;
- (ASTConfigurableUploadClient)initWithASTSession:(id)a3 withURLSession:(id)a4 withURLRequestFactory:(id)a5 withDelegate:(id)a6;
- (ASTConfigurableUploadClient)initWithURLSession:(id)a3 withURLRequestFactory:(id)a4 withDelegate:(id)a5;
- (ASTSession)session;
- (ASTUploadClientDelegate)delegate;
- (NSArray)uploadStatus;
- (NSMutableDictionary)taskMap;
- (NSURLRequestFactory)urlFactory;
- (NSURLSession)urlSession;
- (unint64_t)uploadWithObject:(id)a3 andExtra:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)cancelAll;
- (void)cancelUploadWithId:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setSession:(id)a3;
- (void)setTaskMap:(id)a3;
- (void)setUrlFactory:(id)a3;
- (void)setUrlSession:(id)a3;
- (void)uploadTaskDidComplete:(unint64_t)a3 withResponse:(id)a4 andError:(id)a5;
@end

@implementation ASTConfigurableUploadClient

- (NSArray)uploadStatus
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(ASTConfigurableUploadClient *)self taskMap];
  v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) metaInfo];
        [v3 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = (void *)[v3 copy];

  return (NSArray *)v11;
}

- (ASTConfigurableUploadClient)initWithASTSession:(id)a3 withURLSession:(id)a4 withURLRequestFactory:(id)a5 withDelegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)ASTConfigurableUploadClient;
  long long v14 = [(ASTConfigurableUploadClient *)&v26 init];
  long long v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_session, v10);
    long long v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    taskMap = v15->_taskMap;
    v15->_taskMap = v16;

    objc_storeStrong((id *)&v15->_urlFactory, a5);
    if (v11)
    {
      uint64_t v18 = (NSURLSession *)v11;
      urlSession = v15->_urlSession;
      v15->_urlSession = v18;
    }
    else
    {
      v20 = (void *)MEMORY[0x263F08BF8];
      urlSession = [MEMORY[0x263F08C00] defaultSessionConfiguration];
      uint64_t v21 = [v20 sessionWithConfiguration:urlSession delegate:v15 delegateQueue:0];
      v22 = v15->_urlSession;
      v15->_urlSession = (NSURLSession *)v21;
    }
    objc_storeWeak((id *)&v15->_delegate, v13);
    v23 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_23CA80000, v23, OS_LOG_TYPE_DEFAULT, "[Uploader] Started a new upload session on AST Session", v25, 2u);
    }
  }
  return v15;
}

- (ASTConfigurableUploadClient)initWithASTSession:(id)a3 withDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ASTConfigurableUploadClient;
  uint64_t v8 = [(ASTConfigurableUploadClient *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_session, v6);
    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    taskMap = v9->_taskMap;
    v9->_taskMap = v10;

    id v12 = (void *)MEMORY[0x263F08BF8];
    id v13 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    uint64_t v14 = [v12 sessionWithConfiguration:v13 delegate:v9 delegateQueue:0];
    urlSession = v9->_urlSession;
    v9->_urlSession = (NSURLSession *)v14;

    objc_storeWeak((id *)&v9->_delegate, v7);
    long long v16 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_23CA80000, v16, OS_LOG_TYPE_DEFAULT, "[Uploader] Started a new upload session on AST Session", v18, 2u);
    }
  }
  return v9;
}

- (ASTConfigurableUploadClient)initWithURLSession:(id)a3 withURLRequestFactory:(id)a4 withDelegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)ASTConfigurableUploadClient;
  id v11 = [(ASTConfigurableUploadClient *)&v23 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_session, 0);
    id v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    taskMap = v12->_taskMap;
    v12->_taskMap = v13;

    objc_storeStrong((id *)&v12->_urlFactory, a4);
    if (v8)
    {
      long long v15 = (NSURLSession *)v8;
      urlSession = v12->_urlSession;
      v12->_urlSession = v15;
    }
    else
    {
      v17 = (void *)MEMORY[0x263F08BF8];
      urlSession = [MEMORY[0x263F08C00] defaultSessionConfiguration];
      uint64_t v18 = [v17 sessionWithConfiguration:urlSession delegate:v12 delegateQueue:0];
      objc_super v19 = v12->_urlSession;
      v12->_urlSession = (NSURLSession *)v18;
    }
    objc_storeWeak((id *)&v12->_delegate, v10);
    v20 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_23CA80000, v20, OS_LOG_TYPE_DEFAULT, "[Uploader] Started a new upload session on AST Session", v22, 2u);
    }
  }
  return v12;
}

- (unint64_t)uploadWithObject:(id)a3 andExtra:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ASTConfigurableUploadClient *)self urlFactory];
  id v9 = [v8 urlRequest];

  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__3;
  v71 = __Block_byref_object_dispose__3;
  id v72 = 0;
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = __57__ASTConfigurableUploadClient_uploadWithObject_andExtra___block_invoke;
  v66[3] = &unk_264E7DD10;
  v66[4] = self;
  v66[5] = &v67;
  id v10 = (void *)MEMORY[0x23ECF0530](v66);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v6;
    id v12 = [(ASTConfigurableUploadClient *)self urlSession];
    id v13 = [v12 uploadTaskWithRequest:v9 fromFile:v11 completionHandler:v10];

    uint64_t v14 = [ASTUploadItem alloc];
    long long v15 = [v9 URL];
    uint64_t v16 = [(ASTUploadItem *)v14 initWithDestinationUrl:v15 andSourceUrl:v11 andTask:v13];
    v17 = (void *)v68[5];
    v68[5] = v16;

    id v65 = 0;
    uint64_t v18 = *MEMORY[0x263EFF688];
    uint64_t v64 = 0;
    [v11 getResourceValue:&v65 forKey:v18 error:&v64];
    objc_super v19 = v65;
LABEL_5:
    objc_super v26 = v19;

    v58 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "taskIdentifier"));
    v27 = [v7 allKeys];
    if ([v27 containsObject:@"name"]) {
      [v7 objectForKeyedSubscript:@"name"];
    }
    else {
    v62 = [MEMORY[0x263EFF9D0] null];
    }

    v28 = [v7 allKeys];
    v59 = v26;
    if ([v28 containsObject:@"id"]) {
      [v7 objectForKeyedSubscript:@"id"];
    }
    else {
    v61 = [MEMORY[0x263EFF9D0] null];
    }

    v29 = [v7 allKeys];
    v56 = v10;
    if ([v29 containsObject:@"sig"]) {
      [v7 objectForKeyedSubscript:@"sig"];
    }
    else {
    v60 = [MEMORY[0x263EFF9D0] null];
    }

    v30 = [v7 allKeys];
    if ([v30 containsObject:@"pubKeyDigest"]) {
      [v7 objectForKeyedSubscript:@"pubKeyDigest"];
    }
    else {
    v31 = [MEMORY[0x263EFF9D0] null];
    }
    v32 = v9;

    v33 = [v7 allKeys];
    if ([v33 containsObject:@"cert"]) {
      [v7 objectForKeyedSubscript:@"cert"];
    }
    else {
    v34 = [MEMORY[0x263EFF9D0] null];
    }

    v35 = [(id)v68[5] metaInfo];
    [v35 setObject:v61 forKeyedSubscript:@"id"];

    v36 = [(id)v68[5] metaInfo];
    [v36 setObject:v62 forKeyedSubscript:@"name"];

    v37 = [(id)v68[5] metaInfo];
    [v37 setObject:v60 forKeyedSubscript:@"sig"];

    v38 = [(id)v68[5] metaInfo];
    [v38 setObject:v31 forKeyedSubscript:@"pubKeyDigest"];

    v39 = [(id)v68[5] metaInfo];
    [v39 setObject:v34 forKeyedSubscript:@"cert"];

    v40 = [(id)v68[5] metaInfo];
    [v40 setObject:@"QUEUED" forKeyedSubscript:@"status"];

    v41 = [(id)v68[5] metaInfo];
    [v41 setObject:v59 forKeyedSubscript:@"size"];

    v42 = [v32 URL];
    v43 = [v42 absoluteString];
    v44 = [(id)v68[5] metaInfo];
    [v44 setObject:v43 forKeyedSubscript:@"uploadUrl"];

    v45 = [(ASTConfigurableUploadClient *)self taskMap];
    [v45 setObject:v68[5] forKey:v58];

    [v13 resume];
    v46 = [(id)v68[5] metaInfo];
    [v46 setObject:@"UPLOADING" forKeyedSubscript:@"status"];

    v47 = [(ASTConfigurableUploadClient *)self delegate];
    if (v47)
    {
      v48 = [(ASTConfigurableUploadClient *)self delegate];
      char v49 = objc_opt_respondsToSelector();

      if (v49)
      {
        v50 = [(ASTConfigurableUploadClient *)self delegate];
        uint64_t v51 = [v13 taskIdentifier];
        v52 = [v32 URL];
        [v50 ASTUploadClient:self didStartFileUploadWithId:v51 andUrl:v52];
      }
    }
    unint64_t v53 = objc_msgSend(v13, "taskIdentifier", v56);

    id v9 = v32;
    id v10 = v57;
    v54 = v59;
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = v6;
    uint64_t v21 = [(ASTConfigurableUploadClient *)self urlSession];
    id v13 = [v21 uploadTaskWithRequest:v9 fromData:v20 completionHandler:v10];

    v22 = [ASTUploadItem alloc];
    objc_super v23 = [v9 URL];
    uint64_t v24 = [(ASTUploadItem *)v22 initWithDestinationUrl:v23 andSourceData:v20 andTask:v13];
    v25 = (void *)v68[5];
    v68[5] = v24;

    objc_super v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "length"));
    goto LABEL_5;
  }
  v54 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23CA80000, v54, OS_LOG_TYPE_DEFAULT, "[Uploader] Failed to create task for upload file", buf, 2u);
  }
  id v13 = 0;
  unint64_t v53 = -1;
LABEL_27:

  _Block_object_dispose(&v67, 8);
  return v53;
}

void __57__ASTConfigurableUploadClient_uploadWithObject_andExtra___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) task];
    uint64_t v10 = [v9 taskIdentifier];
    id v11 = [v6 URL];
    int v14 = 134218754;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    v17 = v11;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "[Uploader] Completed upload task for upload file [%li - %@] with response: %@ and error: %@.", (uint8_t *)&v14, 0x2Au);
  }
  id v12 = *(void **)(a1 + 32);
  id v13 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) task];
  objc_msgSend(v12, "uploadTaskDidComplete:withResponse:andError:", objc_msgSend(v13, "taskIdentifier"), v6, v7);
}

- (void)cancelUploadWithId:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v6 = [(ASTConfigurableUploadClient *)self taskMap];
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (v7)
  {
    id v8 = [v7 task];
    [v8 cancel];

    id v9 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v7 task];
      id v11 = [v10 originalRequest];
      id v12 = [v11 URL];
      int v14 = 134218242;
      unint64_t v15 = a3;
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_23CA80000, v9, OS_LOG_TYPE_DEFAULT, "[Uploader] Canceled task for upload file [%li - %@]", (uint8_t *)&v14, 0x16u);
    }
    id v13 = [(ASTConfigurableUploadClient *)self taskMap];
    [v13 removeObjectForKey:v5];
  }
  else
  {
    id v13 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      unint64_t v15 = a3;
      _os_log_impl(&dword_23CA80000, v13, OS_LOG_TYPE_DEFAULT, "[Uploader] No task exist for upload file (%li), failed to cancel", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)uploadTaskDidComplete:(unint64_t)a3 withResponse:(id)a4 andError:(id)a5
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(ASTConfigurableUploadClient *)self taskMap];
  unint64_t v51 = a3;
  id v11 = [NSNumber numberWithUnsignedInteger:a3];
  id v12 = [v10 objectForKeyedSubscript:v11];

  id v13 = [v12 destinationUrl];
  int v14 = @"FAILED";
  id v15 = v8;
  __int16 v16 = v15;
  if (!v15)
  {
    v52 = v14;
    if (v9) {
      goto LABEL_30;
    }
LABEL_8:
    if (v12) {
      [v12 setIsComplete:1];
    }
    id v19 = [v12 metaInfo];
    [v19 setObject:v52 forKeyedSubscript:@"status"];
    goto LABEL_35;
  }
  uint64_t v17 = [v15 statusCode];
  if (v17 > 399)
  {
    uint64_t v18 = @"Upload failed with status: %ld. Bad request made.";
    v52 = v14;
    switch(v17)
    {
      case 400:
        break;
      case 401:
        uint64_t v18 = @"Upload failed with status: %ld. Unauthorized access.";
        goto LABEL_24;
      case 402:
      case 405:
      case 406:
      case 407:
      case 408:
      case 409:
        goto LABEL_17;
      case 403:
        uint64_t v18 = @"Upload failed with status: %ld. Action is forbidden.";
        goto LABEL_24;
      case 404:
        uint64_t v18 = @"Upload failed with status: %ld. Item not found.";
        goto LABEL_24;
      case 410:
        uint64_t v18 = @"Upload failed with status: %ld. Version mismatch.";
        goto LABEL_24;
      default:
        switch(v17)
        {
          case 499:
            uint64_t v18 = @"Upload failed with status: %ld. Client timed out.";
            break;
          case 500:
            uint64_t v18 = @"Upload failed with status: %ld. Remote server error.";
            break;
          case 502:
            uint64_t v18 = @"Upload failed with status: %ld. Bad gateway.";
            break;
          case 503:
            uint64_t v18 = @"Upload failed with status: %ld. Remote server unavailable.";
            break;
          default:
            goto LABEL_17;
        }
        goto LABEL_24;
    }
  }
  else
  {
    switch(v17)
    {
      case 200:
        v52 = @"SUCCESSFUL";

        uint64_t v18 = @"Upload complete with status: %ld";
        break;
      case 202:
        v52 = @"SUCCESSFUL";

        uint64_t v18 = @"Upload complete with status: %ld. Item was added to an async scan queue.";
        break;
      case 204:
        v52 = @"SUCCESSFUL";

        uint64_t v18 = @"Upload complete with status: %ld. Item was previously added to an async scan queue.";
        break;
      default:
LABEL_17:
        uint64_t v18 = @"Upload failed with status: %ld. Unhandled response from server.";
LABEL_24:
        v52 = v14;
        break;
    }
  }
  __int16 v20 = objc_msgSend(NSString, "stringWithFormat:", v18, objc_msgSend(v16, "statusCode"));
  id v21 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v61 = v20;
    _os_log_impl(&dword_23CA80000, v21, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  if (([(__CFString *)v52 isEqualToString:@"SUCCESSFUL"] & 1) == 0)
  {
    uint64_t v22 = (void *)MEMORY[0x263F087E8];
    v58[0] = @"httpResponseCode";
    v50 = v12;
    objc_super v23 = v14;
    uint64_t v24 = v13;
    v25 = v9;
    objc_super v26 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v16, "statusCode"));
    v58[1] = @"errorDetails";
    v59[0] = v26;
    v59[1] = v20;
    v27 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:2];
    uint64_t v28 = [v22 errorWithDomain:@"ASTErrorDomain" code:-5000 userInfo:v27];

    id v13 = v24;
    int v14 = v23;
    id v12 = v50;

    id v9 = (id)v28;
  }

  if (!v9) {
    goto LABEL_8;
  }
LABEL_30:
  if (v12) {
    [v12 setIsFailed:1];
  }
  v29 = [v12 metaInfo];
  [v29 setObject:v14 forKeyedSubscript:@"status"];

  uint64_t v30 = [(ASTConfigurableUploadClient *)self delegate];
  if (v30)
  {
    v31 = (void *)v30;
    v32 = [(ASTConfigurableUploadClient *)self delegate];
    char v33 = objc_opt_respondsToSelector();

    if (v33)
    {
      id v19 = [(ASTConfigurableUploadClient *)self delegate];
      [v19 ASTUploadClient:self fileUploadWasInterrupted:v51 andUrl:v13 withError:v9];
LABEL_35:
    }
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v34 = [(ASTConfigurableUploadClient *)self taskMap];
  v35 = [v34 allValues];

  uint64_t v36 = [v35 countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v54;
    while (2)
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v54 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        if (([v40 isComplete] & 1) == 0 && !objc_msgSend(v40, "isFailed"))
        {
          v41 = v9;
          int v42 = 0;
          goto LABEL_48;
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v53 objects:v57 count:16];
      if (v37) {
        continue;
      }
      break;
    }
  }
  v41 = v9;

  int v42 = 1;
  v35 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23CA80000, v35, OS_LOG_TYPE_DEFAULT, "[Uploader] All upload tasks completed", buf, 2u);
    int v42 = 1;
  }
LABEL_48:

  v43 = [(ASTConfigurableUploadClient *)self delegate];

  if (v43)
  {
    v44 = [(ASTConfigurableUploadClient *)self delegate];
    char v45 = objc_opt_respondsToSelector();

    if (v45)
    {
      v46 = [(ASTConfigurableUploadClient *)self delegate];
      [v46 ASTUploadClient:self didCompleteFileUploadWithId:v51 andUrl:v13];
    }
    if (v42)
    {
      v47 = [(ASTConfigurableUploadClient *)self delegate];
      char v48 = objc_opt_respondsToSelector();

      if (v48)
      {
        char v49 = [(ASTConfigurableUploadClient *)self delegate];
        [v49 ASTUploadClientDidCompleteFileUpload:self];
      }
    }
  }
}

- (void)cancelAll
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(ASTConfigurableUploadClient *)self taskMap];
  v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v8 isComplete] & 1) == 0)
        {
          id v9 = [v8 task];
          [v9 cancel];

          [v8 setIsComplete:1];
          uint64_t v10 = [v8 metaInfo];
          [v10 setObject:@"UPLOADING" forKeyedSubscript:@"status"];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v21 = a4;
  id v7 = [(ASTConfigurableUploadClient *)self taskMap];
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "taskIdentifier"));
  id v9 = [v7 objectForKeyedSubscript:v8];

  uint64_t v10 = ASTUploadStatusSuccessful;
  if (a5) {
    uint64_t v10 = ASTUploadStatusUploading;
  }
  long long v11 = *v10;
  long long v12 = [v9 metaInfo];
  [v12 setObject:v11 forKeyedSubscript:@"status"];

  if (!a5)
  {
    uint64_t v13 = [(ASTConfigurableUploadClient *)self delegate];
    if (v13)
    {
      long long v14 = (void *)v13;
      id v15 = [(ASTConfigurableUploadClient *)self delegate];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        uint64_t v17 = [(ASTConfigurableUploadClient *)self delegate];
        uint64_t v18 = [v21 taskIdentifier];
        id v19 = [v21 originalRequest];
        __int16 v20 = [v19 URL];
        [v17 ASTUploadClient:self fileUploadWasInterrupted:v18 andUrl:v20 withError:0];
      }
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v19 = a4;
  uint64_t v11 = [(ASTConfigurableUploadClient *)self delegate];
  if (v11)
  {
    long long v12 = (void *)v11;
    uint64_t v13 = [(ASTConfigurableUploadClient *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = [(ASTConfigurableUploadClient *)self delegate];
      uint64_t v16 = [v19 taskIdentifier];
      uint64_t v17 = [v19 originalRequest];
      uint64_t v18 = [v17 URL];
      [v15 ASTUploadClient:self fileUploadStatusForId:v16 andUrl:v18 didSendBodyData:a5 totalBytesSent:a6 totalBytesExpectedToSend:a7];
    }
  }
}

- (ASTSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (ASTSession *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (ASTUploadClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASTUploadClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)taskMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTaskMap:(id)a3
{
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
}

- (NSURLRequestFactory)urlFactory
{
  return self->_urlFactory;
}

- (void)setUrlFactory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlFactory, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_taskMap, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_session);
}

@end