@interface AMSMockURLResponse
+ (AMSMockURLResponse)responseWithError:(id)a3;
+ (AMSMockURLResponse)responseWithHARFile:(id)a3;
+ (AMSMockURLResponse)responseWithStatus:(unint64_t)a3 headers:(id)a4 body:(id)a5;
+ (id)responseFromActualResponse;
- ($56E2DEC5DBDA16B35585CCB237684122)handleReceivedRequest:(SEL)a3;
- (AMSMockURLResponse)init;
- (BOOL)performActualRequest;
- (NSData)body;
- (NSDictionary)headers;
- (NSError)error;
- (NSMutableArray)responseHandlerBlocks;
- (NSURLRequest)originalRequest;
- (NSURLSessionTask)runningTask;
- (unint64_t)statusCode;
- (void)addResponseHandler:(id)a3;
- (void)setBody:(id)a3;
- (void)setError:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setPerformActualRequest:(BOOL)a3;
- (void)setResponseHandlerBlocks:(id)a3;
- (void)setRunningTask:(id)a3;
- (void)setStatusCode:(unint64_t)a3;
- (void)stopRunningTasks;
@end

@implementation AMSMockURLResponse

- (AMSMockURLResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)AMSMockURLResponse;
  v2 = [(AMSMockURLResponse *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    responseHandlerBlocks = v2->_responseHandlerBlocks;
    v2->_responseHandlerBlocks = v3;
  }
  return v2;
}

+ (id)responseFromActualResponse
{
  v2 = objc_alloc_init(AMSMockURLResponse);
  [(AMSMockURLResponse *)v2 setPerformActualRequest:1];
  return v2;
}

+ (AMSMockURLResponse)responseWithError:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(AMSMockURLResponse);
  [(AMSMockURLResponse *)v4 setError:v3];

  return v4;
}

+ (AMSMockURLResponse)responseWithStatus:(unint64_t)a3 headers:(id)a4 body:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = objc_alloc_init(AMSMockURLResponse);
  [(AMSMockURLResponse *)v9 setStatusCode:a3];
  [(AMSMockURLResponse *)v9 setHeaders:v8];

  [(AMSMockURLResponse *)v9 setBody:v7];
  return v9;
}

+ (AMSMockURLResponse)responseWithHARFile:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 objectForKeyedSubscript:@"log"];
  v4 = [v3 objectForKeyedSubscript:@"entries"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  objc_super v6 = [v5 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  id v8 = [v7 objectForKeyedSubscript:@"response"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_14;
  }
  id v9 = v8;

  if (!v9)
  {
LABEL_14:
    v14 = 0;
    v15 = 0;
    goto LABEL_48;
  }
  v10 = objc_alloc_init(AMSMockURLResponse);
  [(AMSMockURLResponse *)v10 setStatusCode:500];
  v11 = [v9 objectForKeyedSubscript:@"status"];
  if (objc_opt_respondsToSelector()) {
    -[AMSMockURLResponse setStatusCode:](v10, "setStatusCode:", [v11 integerValue]);
  }
  v54 = v10;
  v12 = [v9 objectForKeyedSubscript:@"headers"];
  objc_opt_class();
  id v52 = v7;
  id v53 = v5;
  v50 = v11;
  v51 = v9;
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  v16 = objc_opt_new();
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v13;
  uint64_t v17 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
  unint64_t v18 = 0x1E4F29000uLL;
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v58;
    v21 = @"name";
    v22 = @"value";
    do
    {
      uint64_t v23 = 0;
      uint64_t v55 = v19;
      do
      {
        if (*(void *)v58 != v20) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v57 + 1) + 8 * v23);
        v25 = [v24 objectForKeyedSubscript:v21];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v26 = v25;
        }
        else {
          id v26 = 0;
        }

        v27 = [v26 lowercaseString];

        uint64_t v28 = [v24 objectForKeyedSubscript:v22];
        v29 = (void *)v28;
        if (v27 && v28)
        {
          v30 = [v16 objectForKeyedSubscript:v27];

          if (v30)
          {
            v31 = [v16 objectForKeyedSubscript:v27];
            [v31 stringByAppendingFormat:@", %@", v29, v50];
            uint64_t v32 = v20;
            v33 = v22;
            v34 = v21;
            v36 = unint64_t v35 = v18;
            [v16 setObject:v36 forKeyedSubscript:v27];

            unint64_t v18 = v35;
            v21 = v34;
            v22 = v33;
            uint64_t v20 = v32;
            uint64_t v19 = v55;
          }
          else
          {
            [v16 setObject:v29 forKeyedSubscript:v27];
          }
        }

        ++v23;
      }
      while (v19 != v23);
      uint64_t v19 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v19);
  }

  if (v16) {
    [(AMSMockURLResponse *)v54 setHeaders:v16];
  }
  v14 = v51;
  v37 = [v51 objectForKeyedSubscript:@"content"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v38 = v37;
  }
  else {
    id v38 = 0;
  }

  v39 = [v38 objectForKeyedSubscript:@"text"];
  objc_opt_class();
  id v5 = v53;
  if (objc_opt_isKindOfClass()) {
    id v40 = v39;
  }
  else {
    id v40 = 0;
  }

  v41 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v40 options:0];
  if (v41)
  {
    uint64_t v42 = [objc_alloc(*(Class *)(v18 + 24)) initWithData:v41 encoding:4];

    id v40 = (id)v42;
  }
  if (v40)
  {
    v43 = [v40 dataUsingEncoding:4];
  }
  else
  {
    v43 = 0;
  }
  [(AMSMockURLResponse *)v54 setBody:v43];
  v44 = objc_msgSend(v16, "ams_objectForCaseInsensitiveKey:", @"content-encoding");
  uint64_t v45 = [(AMSMockURLResponse *)v54 body];
  if (v45)
  {
    v46 = (void *)v45;
    int v47 = [v44 containsString:@"gzip"];

    if (v47)
    {
      v48 = +[AMSData compressedGzippedDataWithData:v43];
      [(AMSMockURLResponse *)v54 setBody:v48];
    }
  }

  id v7 = v52;
  v15 = v54;
LABEL_48:

  return v15;
}

- ($56E2DEC5DBDA16B35585CCB237684122)handleReceivedRequest:(SEL)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(AMSMockURLResponse *)self error];

  if (v7)
  {
    retstr->var2 = 0;
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = [(AMSMockURLResponse *)self error];
  }
  else
  {
    uint64_t v61 = 0;
    uint64_t v62 = (id *)&v61;
    uint64_t v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__50;
    v65 = __Block_byref_object_dispose__50;
    id v66 = 0;
    uint64_t v55 = 0;
    v56 = (id *)&v55;
    uint64_t v57 = 0x3032000000;
    long long v58 = __Block_byref_object_copy__50;
    long long v59 = __Block_byref_object_dispose__50;
    id v60 = 0;
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x3032000000;
    id v52 = __Block_byref_object_copy__50;
    id v53 = __Block_byref_object_dispose__50;
    id v54 = 0;
    if ([(AMSMockURLResponse *)self performActualRequest])
    {
      id v8 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
      id v9 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v8];
      dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __44__AMSMockURLResponse_handleReceivedRequest___block_invoke;
      v44[3] = &unk_1E55A4D08;
      v46 = &v61;
      int v47 = &v55;
      v48 = &v49;
      v11 = v10;
      uint64_t v45 = v11;
      v12 = [v9 dataTaskWithRequest:v6 completionHandler:v44];
      [(AMSMockURLResponse *)self setRunningTask:v12];

      id v13 = [(AMSMockURLResponse *)self runningTask];
      [v13 resume];

      dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      [v9 finishTasksAndInvalidate];
      unint64_t v14 = [(AMSMockURLResponse *)self statusCode];
      v15 = self;
      if (!v14) {
        v15 = (AMSMockURLResponse *)v62[5];
      }
      uint64_t v16 = [(AMSMockURLResponse *)v15 statusCode];
      uint64_t v17 = [(AMSMockURLResponse *)self headers];
      unint64_t v18 = v17;
      if (v17)
      {
        id v19 = v17;
      }
      else
      {
        id v19 = [v62[5] allHeaderFields];
      }
      v27 = v19;

      uint64_t v28 = [(AMSMockURLResponse *)self body];
      id v29 = v28;
      if (!v28) {
        id v29 = v56[5];
      }
      objc_storeStrong(v56 + 5, v29);

      id v30 = objc_alloc(MEMORY[0x1E4F18D40]);
      v31 = [v62[5] URL];
      uint64_t v32 = [v30 initWithURL:v31 statusCode:v16 HTTPVersion:@"1.1" headerFields:v27];
      id v33 = v62[5];
      v62[5] = (id)v32;
    }
    else
    {
      id v20 = objc_alloc(MEMORY[0x1E4F18D40]);
      v21 = [v6 URL];
      unint64_t v22 = [(AMSMockURLResponse *)self statusCode];
      uint64_t v23 = [(AMSMockURLResponse *)self headers];
      uint64_t v24 = [v20 initWithURL:v21 statusCode:v22 HTTPVersion:@"1.1" headerFields:v23];
      id v25 = v62[5];
      v62[5] = (id)v24;

      uint64_t v26 = [(AMSMockURLResponse *)self body];
      id v8 = v56[5];
      v56[5] = (id)v26;
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v34 = [(AMSMockURLResponse *)self responseHandlerBlocks];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v40 objects:v67 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v41 != v36) {
            objc_enumerationMutation(v34);
          }
          id v38 = (*(void (**)(void))(*(void *)(*((void *)&v40 + 1) + 8 * i) + 16))();
          if (v38) {
            objc_storeStrong(v62 + 5, v38);
          }
        }
        uint64_t v35 = [v34 countByEnumeratingWithState:&v40 objects:v67 count:16];
      }
      while (v35);
    }

    retstr->var0 = v56[5];
    retstr->var1 = v62[5];
    retstr->var2 = (id)v50[5];
    _Block_object_dispose(&v49, 8);

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&v61, 8);
  }
  return result;
}

void __44__AMSMockURLResponse_handleReceivedRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v19 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v19;
  }
  else {
    id v10 = 0;
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v7;
  id v15 = v7;

  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v9;
  id v18 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)addResponseHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(AMSMockURLResponse *)self responseHandlerBlocks];
  id v5 = (void *)[v4 copy];

  [v6 addObject:v5];
}

- (void)stopRunningTasks
{
  id v2 = [(AMSMockURLResponse *)self runningTask];
  [v2 cancel];
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (unint64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(unint64_t)a3
{
  self->_statusCode = a3;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
}

- (NSData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (BOOL)performActualRequest
{
  return self->_performActualRequest;
}

- (void)setPerformActualRequest:(BOOL)a3
{
  self->_performActualRequest = a3;
}

- (NSURLRequest)originalRequest
{
  return self->_originalRequest;
}

- (NSMutableArray)responseHandlerBlocks
{
  return self->_responseHandlerBlocks;
}

- (void)setResponseHandlerBlocks:(id)a3
{
}

- (NSURLSessionTask)runningTask
{
  return self->_runningTask;
}

- (void)setRunningTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningTask, 0);
  objc_storeStrong((id *)&self->_responseHandlerBlocks, 0);
  objc_storeStrong((id *)&self->_originalRequest, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end