@interface C2NetworkingDelegateURLSessionDataTask
+ (unint64_t)nextTaskIdentifier;
- (C2NetworkingDelegateURLSession)session;
- (C2NetworkingDelegateURLSessionDataTask)init;
- (C2RequestOptions)c2RequestOptions;
- (NSDictionary)timingData;
- (NSError)syntheticError;
- (NSString)taskDescription;
- (NSURLRequest)currentRequest;
- (NSURLRequest)originalRequest;
- (NSURLResponse)response;
- (NSURLSessionAppleIDContext)_appleIDContext;
- (OS_dispatch_queue)clientQueue;
- (double)_timeoutIntervalForResource;
- (int64_t)countOfBytesClientExpectsToReceive;
- (int64_t)countOfBytesClientExpectsToSend;
- (int64_t)countOfBytesExpectedToReceive;
- (int64_t)countOfBytesExpectedToSend;
- (int64_t)countOfBytesReceived;
- (int64_t)countOfBytesSent;
- (int64_t)state;
- (unint64_t)taskIdentifier;
- (void)__didReceiveData:(id)a3 completionHandler:(id)a4;
- (void)_drainInputStream:(id)a3 sinkData:(id)a4 completionHandler:(id)a5;
- (void)_setAppleIDContext:(id)a3;
- (void)cancel;
- (void)handleCompletion;
- (void)handleResponse:(id)a3 completionHandler:(id)a4;
- (void)processRequest:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
- (void)resume;
- (void)setC2RequestOptions:(id)a3;
- (void)setClientQueue:(id)a3;
- (void)setCountOfBytesClientExpectsToReceive:(int64_t)a3;
- (void)setCountOfBytesClientExpectsToSend:(int64_t)a3;
- (void)setCountOfBytesExpectedToReceive:(int64_t)a3;
- (void)setCountOfBytesExpectedToSend:(int64_t)a3;
- (void)setCountOfBytesReceived:(int64_t)a3;
- (void)setCountOfBytesSent:(int64_t)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setOriginalRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)setSession:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSyntheticError:(id)a3;
- (void)setTaskDescription:(id)a3;
- (void)setTimingData:(id)a3;
- (void)set_timeoutIntervalForResource:(double)a3;
- (void)setupRequest:(id)a3;
- (void)setupRequestBodyForRequest:(id)a3 completionHandler:(id)a4;
- (void)streamResponseBody:(id)a3 offset:(unsigned int)a4 completionHandler:(id)a5;
- (void)willSendRequest:(id)a3;
@end

@implementation C2NetworkingDelegateURLSessionDataTask

+ (unint64_t)nextTaskIdentifier
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  unint64_t v3 = nextTaskIdentifier_nextTaskIdentifier++;
  objc_sync_exit(v2);

  return v3;
}

- (C2NetworkingDelegateURLSessionDataTask)init
{
  v7.receiver = self;
  v7.super_class = (Class)C2NetworkingDelegateURLSessionDataTask;
  v2 = [(C2NetworkingDelegateURLSessionDataTask *)&v7 init];
  if (v2)
  {
    v2->_taskIdentifier = [(id)objc_opt_class() nextTaskIdentifier];
    unint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.C2NetworkingDelegateURLSessionDataTask", v3);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)setupRequest:(id)a3
{
  dispatch_queue_t v4 = (void (**)(id, void))a3;
  v5 = [(C2NetworkingDelegateURLSessionDataTask *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(C2NetworkingDelegateURLSessionDataTask *)self syntheticError];

  if (v6)
  {
    v4[2](v4, 0);
  }
  else
  {
    objc_super v7 = [(C2NetworkingDelegateURLSessionDataTask *)self session];
    v8 = [v7 networkingDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v10 = [(C2NetworkingDelegateURLSessionDataTask *)self session];
      v11 = [v10 networkingDelegate];
      v12 = [(C2NetworkingDelegateURLSessionDataTask *)self currentRequest];
      v13 = [(C2NetworkingDelegateURLSessionDataTask *)self session];
      v14 = [v13 configuration];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __55__C2NetworkingDelegateURLSessionDataTask_setupRequest___block_invoke;
      v15[3] = &unk_1E6CCC268;
      v15[4] = self;
      v16 = v4;
      [v11 willHandleRequest:v12 configuration:v14 completionHandler:v15];
    }
    else
    {
      [(C2NetworkingDelegateURLSessionDataTask *)self willSendRequest:v4];
    }
  }
}

void __55__C2NetworkingDelegateURLSessionDataTask_setupRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5) {
    [*(id *)(a1 + 32) setSyntheticError:v5];
  }
  if (v6) {
    [*(id *)(a1 + 32) setTimingData:v6];
  }
  objc_super v7 = [*(id *)(a1 + 32) clientQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__C2NetworkingDelegateURLSessionDataTask_setupRequest___block_invoke_2;
  v9[3] = &unk_1E6CCC240;
  v8 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  dispatch_async(v7, v9);
}

uint64_t __55__C2NetworkingDelegateURLSessionDataTask_setupRequest___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) willSendRequest:*(void *)(a1 + 40)];
}

- (void)willSendRequest:(id)a3
{
  dispatch_queue_t v4 = (void (**)(id, void))a3;
  id v5 = [(C2NetworkingDelegateURLSessionDataTask *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(C2NetworkingDelegateURLSessionDataTask *)self syntheticError];

  if (v6)
  {
    v4[2](v4, 0);
  }
  else
  {
    objc_super v7 = [(C2NetworkingDelegateURLSessionDataTask *)self session];
    v8 = [v7 delegateQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__C2NetworkingDelegateURLSessionDataTask_willSendRequest___block_invoke;
    v9[3] = &unk_1E6CCC240;
    v9[4] = self;
    id v10 = v4;
    [v8 addOperationWithBlock:v9];
  }
}

void __58__C2NetworkingDelegateURLSessionDataTask_willSendRequest___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) session];
  unint64_t v3 = [v2 sessionDelegate];
  dispatch_queue_t v4 = [*(id *)(a1 + 32) session];
  id v5 = *(void **)(a1 + 32);
  id v6 = [v5 currentRequest];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__C2NetworkingDelegateURLSessionDataTask_willSendRequest___block_invoke_2;
  v8[3] = &unk_1E6CCC2B8;
  objc_super v7 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  objc_msgSend(v3, "URLSession:task:_willSendRequestForEstablishedConnection:completionHandler:", v4, v5, v6, v8);
}

void __58__C2NetworkingDelegateURLSessionDataTask_willSendRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = [*(id *)(a1 + 32) clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__C2NetworkingDelegateURLSessionDataTask_willSendRequest___block_invoke_3;
  v7[3] = &unk_1E6CCC290;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __58__C2NetworkingDelegateURLSessionDataTask_willSendRequest___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_drainInputStream:(id)a3 sinkData:(id)a4 completionHandler:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  v11 = [(C2NetworkingDelegateURLSessionDataTask *)self clientQueue];
  dispatch_assert_queue_V2(v11);

  v12 = [(C2NetworkingDelegateURLSessionDataTask *)self syntheticError];

  if (v12)
  {
    v10[2](v10, 0);
  }
  else
  {
    bzero(v28, 0x8000uLL);
    uint64_t v13 = [v8 read:v28 maxLength:0x8000];
    if (v13 < 1)
    {
      [v8 close];
      -[C2NetworkingDelegateURLSessionDataTask setCountOfBytesSent:](self, "setCountOfBytesSent:", [v9 length]);
      v19 = [(C2NetworkingDelegateURLSessionDataTask *)self clientQueue];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __87__C2NetworkingDelegateURLSessionDataTask__drainInputStream_sinkData_completionHandler___block_invoke_3;
      v20[3] = &unk_1E6CCC290;
      v22 = v10;
      id v21 = v9;
      dispatch_async(v19, v20);

      v18 = v22;
    }
    else
    {
      uint64_t v14 = v13;
      v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v28 length:v13];
      [v9 appendData:v15];

      v16 = [(C2NetworkingDelegateURLSessionDataTask *)self session];
      v17 = [v16 delegateQueue];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __87__C2NetworkingDelegateURLSessionDataTask__drainInputStream_sinkData_completionHandler___block_invoke;
      v23[3] = &unk_1E6CCC308;
      v23[4] = self;
      uint64_t v27 = v14;
      id v24 = v9;
      id v25 = v8;
      v26 = v10;
      [v17 addOperationWithBlock:v23];

      v18 = v24;
    }
  }
}

void __87__C2NetworkingDelegateURLSessionDataTask__drainInputStream_sinkData_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 sessionDelegate];
  dispatch_queue_t v4 = [*(id *)(a1 + 32) session];
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) length];
  [v3 URLSession:v4 task:v6 didSendBodyData:v5 totalBytesSent:v7 totalBytesExpectedToSend:*MEMORY[0x1E4F28A18]];

  id v8 = [*(id *)(a1 + 32) clientQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__C2NetworkingDelegateURLSessionDataTask__drainInputStream_sinkData_completionHandler___block_invoke_2;
  v9[3] = &unk_1E6CCC2E0;
  v9[4] = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 56);
  dispatch_async(v8, v9);
}

uint64_t __87__C2NetworkingDelegateURLSessionDataTask__drainInputStream_sinkData_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _drainInputStream:*(void *)(a1 + 40) sinkData:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

uint64_t __87__C2NetworkingDelegateURLSessionDataTask__drainInputStream_sinkData_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setupRequestBodyForRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  id v8 = [(C2NetworkingDelegateURLSessionDataTask *)self clientQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(C2NetworkingDelegateURLSessionDataTask *)self syntheticError];

  if (v9)
  {
    v7[2](v7, 0);
  }
  else
  {
    id v10 = [v6 HTTPBodyStream];
    id v11 = v10;
    if (v10)
    {
      [v10 open];
      id v12 = [(C2NetworkingDelegateURLSessionDataTask *)self clientQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __87__C2NetworkingDelegateURLSessionDataTask_setupRequestBodyForRequest_completionHandler___block_invoke;
      block[3] = &unk_1E6CCC330;
      block[4] = self;
      id v21 = v11;
      v22 = v7;
      dispatch_async(v12, block);
    }
    else
    {
      uint64_t v13 = [v6 HTTPBody];
      if (v13)
      {
        uint64_t v14 = [(C2NetworkingDelegateURLSessionDataTask *)self session];
        v15 = [v14 delegateQueue];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __87__C2NetworkingDelegateURLSessionDataTask_setupRequestBodyForRequest_completionHandler___block_invoke_2;
        v16[3] = &unk_1E6CCC358;
        v16[4] = self;
        id v17 = v13;
        v19 = v7;
        id v18 = v6;
        [v15 addOperationWithBlock:v16];
      }
      else
      {
        v7[2](v7, 0);
      }
    }
  }
}

void __87__C2NetworkingDelegateURLSessionDataTask_setupRequestBodyForRequest_completionHandler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v4 = (id)objc_opt_new();
  [v2 _drainInputStream:v3 sinkData:v4 completionHandler:a1[6]];
}

void __87__C2NetworkingDelegateURLSessionDataTask_setupRequestBodyForRequest_completionHandler___block_invoke_2(id *a1)
{
  v2 = [a1[4] session];
  uint64_t v3 = [v2 sessionDelegate];
  id v4 = [a1[4] session];
  objc_msgSend(v3, "URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:", v4, a1[4], objc_msgSend(a1[5], "length"), objc_msgSend(a1[5], "length"), objc_msgSend(a1[5], "length"));

  uint64_t v5 = [a1[4] clientQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__C2NetworkingDelegateURLSessionDataTask_setupRequestBodyForRequest_completionHandler___block_invoke_3;
  v6[3] = &unk_1E6CCC290;
  id v8 = a1[7];
  id v7 = a1[6];
  dispatch_async(v5, v6);
}

void __87__C2NetworkingDelegateURLSessionDataTask_setupRequestBodyForRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) HTTPBody];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)processRequest:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = [(C2NetworkingDelegateURLSessionDataTask *)self clientQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(C2NetworkingDelegateURLSessionDataTask *)self syntheticError];

  if (v12)
  {
    v10[2](v10, 0);
  }
  else
  {
    uint64_t v13 = [(C2NetworkingDelegateURLSessionDataTask *)self session];
    uint64_t v14 = [v13 networkingDelegate];
    char v15 = objc_opt_respondsToSelector();

    v16 = [(C2NetworkingDelegateURLSessionDataTask *)self session];
    id v17 = [v16 networkingDelegate];
    if (v15)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke;
      v29[3] = &unk_1E6CCC3A8;
      v29[4] = self;
      v30 = v10;
      [v17 processRequest:v8 callback:v29];

      id v18 = v30;
    }
    else
    {
      char v19 = objc_opt_respondsToSelector();

      v20 = [(C2NetworkingDelegateURLSessionDataTask *)self session];
      id v21 = [v20 networkingDelegate];
      if (v19)
      {
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_3;
        v27[3] = &unk_1E6CCC3D0;
        v27[4] = self;
        v28 = v10;
        [v21 handleRequest:v8 completionHandler:v27];

        id v18 = v28;
      }
      else
      {
        char v22 = objc_opt_respondsToSelector();

        if ((v22 & 1) == 0) {
          -[C2NetworkingDelegateURLSessionDataTask processRequest:configuration:completionHandler:](self);
        }
        v23 = [(C2NetworkingDelegateURLSessionDataTask *)self session];
        id v24 = [v23 networkingDelegate];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_5;
        v25[3] = &unk_1E6CCC3D0;
        v25[4] = self;
        v26 = v10;
        [v24 handleRequest:v8 configuration:v9 completionHandler:v25];

        id v18 = v26;
      }
    }
  }
}

void __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_2;
  block[3] = &unk_1E6CCC380;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_2(void *a1)
{
  uint64_t v1 = a1[6];
  id v2 = +[C2NetworkingResponse responseWithURLResponse:a1[4] body:a1[5]];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_4;
  v7[3] = &unk_1E6CCC290;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_6;
  v7[3] = &unk_1E6CCC290;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_7()
{
  qword_1EB9BD4E0 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

- (void)handleResponse:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = [(C2NetworkingDelegateURLSessionDataTask *)self clientQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(C2NetworkingDelegateURLSessionDataTask *)self syntheticError];

  if (v9)
  {
    v7[2](v7);
  }
  else
  {
    [(C2NetworkingDelegateURLSessionDataTask *)self setResponse:v6];
    id v10 = [(C2NetworkingDelegateURLSessionDataTask *)self session];
    id v11 = [v10 delegateQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__C2NetworkingDelegateURLSessionDataTask_handleResponse_completionHandler___block_invoke;
    v12[3] = &unk_1E6CCC330;
    v12[4] = self;
    id v13 = v6;
    id v14 = v7;
    [v11 addOperationWithBlock:v12];
  }
}

void __75__C2NetworkingDelegateURLSessionDataTask_handleResponse_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 sessionDelegate];
  id v4 = [*(id *)(a1 + 32) session];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__C2NetworkingDelegateURLSessionDataTask_handleResponse_completionHandler___block_invoke_2;
  v7[3] = &unk_1E6CCC420;
  void v7[4] = v5;
  id v8 = *(id *)(a1 + 48);
  [v3 URLSession:v4 dataTask:v5 didReceiveResponse:v6 completionHandler:v7];
}

void __75__C2NetworkingDelegateURLSessionDataTask_handleResponse_completionHandler___block_invoke_2(uint64_t a1, unint64_t a2)
{
  if (a2 >= 2) {
    __75__C2NetworkingDelegateURLSessionDataTask_handleResponse_completionHandler___block_invoke_2_cold_1();
  }
  id v4 = [*(id *)(a1 + 32) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__C2NetworkingDelegateURLSessionDataTask_handleResponse_completionHandler___block_invoke_3;
  block[3] = &unk_1E6CCC3F8;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  unint64_t v9 = a2;
  void block[4] = v5;
  id v8 = v6;
  dispatch_async(v4, block);
}

uint64_t __75__C2NetworkingDelegateURLSessionDataTask_handleResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  if (!*(void *)(a1 + 48)) {
    [*(id *)(a1 + 32) cancel];
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)streamResponseBody:(id)a3 offset:(unsigned int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  unint64_t v9 = (void (**)(void))a5;
  id v10 = [(C2NetworkingDelegateURLSessionDataTask *)self clientQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(C2NetworkingDelegateURLSessionDataTask *)self syntheticError];

  if (v11)
  {
    v9[2](v9);
  }
  else
  {
    id v12 = [(C2NetworkingDelegateURLSessionDataTask *)self session];
    id v13 = [v12 networkingDelegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      char v15 = [(C2NetworkingDelegateURLSessionDataTask *)self session];
      v16 = [v15 networkingDelegate];
      int v17 = [v16 responseBufferSize];
    }
    else
    {
      int v17 = 0x8000;
    }
    id v18 = [(C2NetworkingDelegateURLSessionDataTask *)self session];
    char v19 = [v18 delegateQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __86__C2NetworkingDelegateURLSessionDataTask_streamResponseBody_offset_completionHandler___block_invoke;
    v20[3] = &unk_1E6CCC448;
    unsigned int v24 = a4;
    int v25 = v17;
    id v21 = v8;
    char v22 = self;
    v23 = v9;
    [v19 addOperationWithBlock:v20];
  }
}

void __86__C2NetworkingDelegateURLSessionDataTask_streamResponseBody_offset_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) length];
  int v3 = *(_DWORD *)(a1 + 56);
  if (v2 == v3)
  {
    id v4 = [*(id *)(a1 + 40) clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__C2NetworkingDelegateURLSessionDataTask_streamResponseBody_offset_completionHandler___block_invoke_4;
    block[3] = &unk_1E6CCC470;
    id v9 = *(id *)(a1 + 48);
    dispatch_async(v4, block);

    uint64_t v5 = v9;
  }
  else
  {
    if ((v2 - v3) >= *(_DWORD *)(a1 + 60)) {
      int v6 = *(_DWORD *)(a1 + 60);
    }
    else {
      int v6 = v2 - v3;
    }
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:");
    id v7 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __86__C2NetworkingDelegateURLSessionDataTask_streamResponseBody_offset_completionHandler___block_invoke_2;
    v10[3] = &unk_1E6CCC448;
    v10[4] = v7;
    id v11 = *(id *)(a1 + 32);
    int v13 = *(_DWORD *)(a1 + 56);
    int v14 = v6;
    id v12 = *(id *)(a1 + 48);
    objc_msgSend(v7, "__didReceiveData:completionHandler:", v5, v10);
  }
}

void __86__C2NetworkingDelegateURLSessionDataTask_streamResponseBody_offset_completionHandler___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) clientQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __86__C2NetworkingDelegateURLSessionDataTask_streamResponseBody_offset_completionHandler___block_invoke_3;
  v4[3] = &unk_1E6CCC448;
  int v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  uint64_t v7 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, v4);
}

uint64_t __86__C2NetworkingDelegateURLSessionDataTask_streamResponseBody_offset_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) streamResponseBody:*(void *)(a1 + 40) offset:(*(_DWORD *)(a1 + 60) + *(_DWORD *)(a1 + 56)) completionHandler:*(void *)(a1 + 48)];
}

uint64_t __86__C2NetworkingDelegateURLSessionDataTask_streamResponseBody_offset_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)__didReceiveData:(id)a3 completionHandler:(id)a4
{
  id v9 = (void (**)(void))a4;
  id v6 = a3;
  uint64_t v7 = [(C2NetworkingDelegateURLSessionDataTask *)self session];
  id v8 = [v7 sessionDelegate];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v8, "URLSession:dataTask:_didReceiveData:completionHandler:", v7, self, v6, v9);
  }
  else
  {
    [v8 URLSession:v7 dataTask:self didReceiveData:v6];

    v9[2]();
  }
}

- (void)handleCompletion
{
  int v3 = [(C2NetworkingDelegateURLSessionDataTask *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(C2NetworkingDelegateURLSessionDataTask *)self syntheticError];
  id v5 = [(C2NetworkingDelegateURLSessionDataTask *)self session];
  id v6 = [v5 delegateQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__C2NetworkingDelegateURLSessionDataTask_handleCompletion__block_invoke;
  v8[3] = &unk_1E6CCC498;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 addOperationWithBlock:v8];
}

void __58__C2NetworkingDelegateURLSessionDataTask_handleCompletion__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) session];
  int v2 = [v4 sessionDelegate];
  int v3 = [*(id *)(a1 + 32) session];
  [v2 URLSession:v3 task:*(void *)(a1 + 32) didCompleteWithError:*(void *)(a1 + 40)];
}

- (void)resume
{
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke;
  block[3] = &unk_1E6CCBF00;
  void block[4] = self;
  dispatch_async(clientQueue, block);
}

uint64_t __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke_2;
  v3[3] = &unk_1E6CCC510;
  v3[4] = v1;
  return [v1 setupRequest:v3];
}

void __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke_3;
  v6[3] = &unk_1E6CCC4E8;
  id v4 = *(void **)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  [v4 setupRequestBodyForRequest:v5 completionHandler:v6];
}

void __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (void *)[v3 mutableCopy];
  [v5 setHTTPBody:v4];

  id v6 = *(void **)(a1 + 40);
  id v7 = [v6 session];
  id v8 = [v7 configuration];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke_4;
  v9[3] = &unk_1E6CCC4C0;
  v9[4] = *(void *)(a1 + 40);
  [v6 processRequest:v5 configuration:v8 completionHandler:v9];
}

void __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 urlResponse];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke_5;
  v7[3] = &unk_1E6CCC498;
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v6 = v3;
  [v4 handleResponse:v5 completionHandler:v7];
}

void __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke_5(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) body];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke_6;
  v4[3] = &unk_1E6CCBF00;
  v4[4] = *(void *)(a1 + 32);
  [v2 streamResponseBody:v3 offset:0 completionHandler:v4];
}

uint64_t __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleCompletion];
}

- (void)cancel
{
  id v3 = [(C2NetworkingDelegateURLSessionDataTask *)self syntheticError];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"C2NetworkingDelegateURLSessionErrorDomain" code:-1 userInfo:0];
    [(C2NetworkingDelegateURLSessionDataTask *)self setSyntheticError:v4];
  }
}

- (unint64_t)taskIdentifier
{
  return self->_taskIdentifier;
}

- (NSString)taskDescription
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTaskDescription:(id)a3
{
}

- (int64_t)countOfBytesReceived
{
  return self->_countOfBytesReceived;
}

- (void)setCountOfBytesReceived:(int64_t)a3
{
  self->_countOfBytesReceived = a3;
}

- (int64_t)countOfBytesSent
{
  return self->_countOfBytesSent;
}

- (void)setCountOfBytesSent:(int64_t)a3
{
  self->_countOfBytesSent = a3;
}

- (int64_t)countOfBytesExpectedToSend
{
  return self->_countOfBytesExpectedToSend;
}

- (void)setCountOfBytesExpectedToSend:(int64_t)a3
{
  self->_countOfBytesExpectedToSend = a3;
}

- (int64_t)countOfBytesExpectedToReceive
{
  return self->_countOfBytesExpectedToReceive;
}

- (void)setCountOfBytesExpectedToReceive:(int64_t)a3
{
  self->_countOfBytesExpectedToReceive = a3;
}

- (int64_t)countOfBytesClientExpectsToSend
{
  return self->_countOfBytesClientExpectsToSend;
}

- (void)setCountOfBytesClientExpectsToSend:(int64_t)a3
{
  self->_countOfBytesClientExpectsToSend = a3;
}

- (int64_t)countOfBytesClientExpectsToReceive
{
  return self->_countOfBytesClientExpectsToReceive;
}

- (void)setCountOfBytesClientExpectsToReceive:(int64_t)a3
{
  self->_countOfBytesClientExpectsToReceive = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSURLRequest)originalRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOriginalRequest:(id)a3
{
}

- (NSURLRequest)currentRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCurrentRequest:(id)a3
{
}

- (NSURLResponse)response
{
  return (NSURLResponse *)objc_getProperty(self, a2, 96, 1);
}

- (void)setResponse:(id)a3
{
}

- (C2RequestOptions)c2RequestOptions
{
  return self->_c2RequestOptions;
}

- (void)setC2RequestOptions:(id)a3
{
}

- (NSError)syntheticError
{
  return (NSError *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSyntheticError:(id)a3
{
}

- (NSDictionary)timingData
{
  return self->_timingData;
}

- (void)setTimingData:(id)a3
{
}

- (C2NetworkingDelegateURLSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (C2NetworkingDelegateURLSession *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (double)_timeoutIntervalForResource
{
  return self->__timeoutIntervalForResource;
}

- (void)set_timeoutIntervalForResource:(double)a3
{
  self->__timeoutIntervalForResource = a3;
}

- (NSURLSessionAppleIDContext)_appleIDContext
{
  return (NSURLSessionAppleIDContext *)objc_getProperty(self, a2, 144, 1);
}

- (void)_setAppleIDContext:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->__appleIDContext, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_timingData, 0);
  objc_storeStrong((id *)&self->_syntheticError, 0);
  objc_storeStrong((id *)&self->_c2RequestOptions, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_originalRequest, 0);
  objc_storeStrong((id *)&self->_taskDescription, 0);
}

- (void)processRequest:(void *)a1 configuration:completionHandler:.cold.1(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (_MergedGlobals != -1) {
    dispatch_once(&_MergedGlobals, &__block_literal_global_5);
  }
  int v2 = (void *)qword_1EB9BD4E0;
  if (os_log_type_enabled((os_log_t)qword_1EB9BD4E0, OS_LOG_TYPE_ERROR))
  {
    id v3 = v2;
    id v4 = [a1 session];
    id v5 = [a1 session];
    id v6 = [v5 networkingDelegate];
    int v7 = 138412802;
    id v8 = a1;
    __int16 v9 = 2112;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1DD523000, v3, OS_LOG_TYPE_ERROR, "Unable to identify appropriate selector on network delegate. self=%@, session=%@, networkingDelegate=%@", (uint8_t *)&v7, 0x20u);
  }
  __assert_rtn("-[C2NetworkingDelegateURLSessionDataTask processRequest:configuration:completionHandler:]", "C2NetworkingDelegateURLSession.m", 209, "false");
}

void __75__C2NetworkingDelegateURLSessionDataTask_handleResponse_completionHandler___block_invoke_2_cold_1()
{
  __assert_rtn("-[C2NetworkingDelegateURLSessionDataTask handleResponse:completionHandler:]_block_invoke_2", "C2NetworkingDelegateURLSession.m", 222, "responseDisposition == NSURLSessionResponseAllow || responseDisposition == NSURLSessionResponseCancel");
}

@end