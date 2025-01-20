@interface MPStoreModelRequestOperation
- (MPStoreModelRequest)request;
- (MPStoreModelRequestOperation)init;
- (MPStoreModelRequestOperation)initWithRequest:(id)a3 responseHandler:(id)a4;
- (double)adjustTimeoutInterval:(double)a3;
- (double)remainingTimeInterval;
- (id)_URLLoadRequestWithRequest:(id)a3 requestContext:(id)a4;
- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4;
- (id)responseHandler;
- (void)_executeItemMetadataLoadForRequestedItemIdentifiers:(id)a3 reason:(unint64_t)a4 requestContext:(id)a5;
- (void)_executeURLLoadWithRequest:(id)a3 storeURLBag:(id)a4 requestContext:(id)a5;
- (void)_executeURLLoadWithRequests:(id)a3 storeURLBag:(id)a4 requestContext:(id)a5;
- (void)_finishWithResponse:(id)a3 error:(id)a4;
- (void)_handleTimeout;
- (void)_tearDownTimeoutTimerSource;
- (void)assertRunningInAccessQueue;
- (void)cancel;
- (void)dealloc;
- (void)dispatchAsync:(id)a3;
- (void)dispatchSync:(id)a3;
- (void)execute;
- (void)finishWithError:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPStoreModelRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_timeoutTimerSource, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_childOperation, 0);

  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setRequest:(id)a3
{
}

- (MPStoreModelRequest)request
{
  return self->_request;
}

- (id)_URLLoadRequestWithRequest:(id)a3 requestContext:(id)a4
{
  id v6 = a4;
  request = self->_request;
  id v8 = a3;
  if ([(MPStoreModelRequest *)request authenticationOptions])
  {
    v10 = [v6 clientInfo];
    v11 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
    v12 = (void *)MEMORY[0x1E4FB85B0];
    v13 = [v10 clientIdentifier];
    v14 = [v10 clientVersion];
    v15 = [v12 clientInfoForMusicKitRequestWithClientIdentifier:v13 clientVersion:v14 bundleIdentifier:v11];

    id v16 = objc_alloc(MEMORY[0x1E4FB8660]);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __74__MPStoreModelRequestOperation__URLLoadRequestWithRequest_requestContext___block_invoke;
    v24 = &unk_1E57F85E8;
    id v25 = v15;
    id v26 = v6;
    id v17 = v15;
    v18 = (void *)[v16 initWithBlock:&v21];
    id v19 = objc_alloc(MEMORY[0x1E4FB8668]);
    v9 = objc_msgSend(v19, "initWithURLRequest:requestContext:", v8, v18, v21, v22, v23, v24);

    id v8 = v10;
  }
  else
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB8760]) initWithURLRequest:v8 requestContext:v6];
  }

  return v9;
}

void __74__MPStoreModelRequestOperation__URLLoadRequestWithRequest_requestContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setClientInfo:v3];
  id v5 = [*(id *)(a1 + 40) identity];
  [v4 setIdentity:v5];
}

- (void)_tearDownTimeoutTimerSource
{
  timeoutTimerSource = self->_timeoutTimerSource;
  if (timeoutTimerSource)
  {
    dispatch_source_cancel(timeoutTimerSource);
    id v4 = self->_timeoutTimerSource;
    self->_timeoutTimerSource = 0;
  }
}

- (void)_handleTimeout
{
  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-1001 userInfo:0];
  [(MPStoreModelRequestOperation *)self _finishWithResponse:0 error:v3];

  [(MPStoreModelRequestOperation *)self cancel];
}

- (void)_executeURLLoadWithRequests:(id)a3 storeURLBag:(id)a4 requestContext:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v23 = a5;
  uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  id v8 = objc_opt_new();
  v9 = dispatch_group_create();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v33 + 1) + 8 * v13);
        dispatch_group_enter(v9);
        v15 = [(MPStoreModelRequestOperation *)self _URLLoadRequestWithRequest:v14 requestContext:v23];
        id v16 = [MEMORY[0x1E4FB87A8] highPrioritySession];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __87__MPStoreModelRequestOperation__executeURLLoadWithRequests_storeURLBag_requestContext___block_invoke;
        v28[3] = &unk_1E57F6140;
        v28[4] = self;
        id v29 = v8;
        id v30 = v22;
        uint64_t v31 = v14;
        v32 = v9;
        [v16 enqueueDataRequest:v15 withCompletionHandler:v28];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v11);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__MPStoreModelRequestOperation__executeURLLoadWithRequests_storeURLBag_requestContext___block_invoke_3;
  block[3] = &unk_1E57F62E8;
  block[4] = self;
  id v25 = v8;
  id v17 = v8;
  id v26 = obj;
  id v27 = v22;
  id v18 = v22;
  id v19 = obj;
  id v20 = v17;
  dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);
}

void __87__MPStoreModelRequestOperation__executeURLLoadWithRequests_storeURLBag_requestContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 272);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__MPStoreModelRequestOperation__executeURLLoadWithRequests_storeURLBag_requestContext___block_invoke_2;
  block[3] = &unk_1E57F6118;
  id v13 = v6;
  id v14 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  id v15 = v8;
  uint64_t v16 = v9;
  id v17 = v5;
  id v10 = v5;
  id v11 = v6;
  dispatch_sync(v7, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __87__MPStoreModelRequestOperation__executeURLLoadWithRequests_storeURLBag_requestContext___block_invoke_3(id *a1)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  v2 = *((void *)a1[4] + 34);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__MPStoreModelRequestOperation__executeURLLoadWithRequests_storeURLBag_requestContext___block_invoke_4;
  block[3] = &unk_1E57F9F20;
  id v26 = &v27;
  id v25 = a1[5];
  dispatch_sync(v2, block);
  uint64_t v3 = v28[3];
  if (v3)
  {
    if (v3 == 1)
    {
      id v4 = a1[4];
      id v5 = [a1[5] firstObject];
      [v4 _finishWithResponse:0 error:v5];
    }
    else
    {
      id v15 = (void *)MEMORY[0x1E4F28C58];
      id v16 = a1[5];
      long long v34 = @"errors";
      v35[0] = v16;
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      id v5 = [v15 errorWithDomain:@"MPMusicAPIErrorDomain" code:1000 userInfo:v17];

      [a1[4] _finishWithResponse:0 error:v5];
    }
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1[6], "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = a1[6];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = [a1[7] objectForKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * v9)];
          if (v10) {
            [v5 addObject:v10];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v33 count:16];
      }
      while (v7);
    }

    unint64_t v11 = [v5 count];
    if (v11 >= [a1[6] count])
    {
      id v18 = a1[4];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __87__MPStoreModelRequestOperation__executeURLLoadWithRequests_storeURLBag_requestContext___block_invoke_5;
      v19[3] = &unk_1E57F60A0;
      v19[4] = v18;
      [v18 produceResponseWithLoadedOutput:v5 completion:v19];
    }
    else
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28228];
      v32 = @"Failed to get response body objects for each request in the compound URL load group.";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      id v14 = [v12 errorWithDomain:@"MPMusicAPIErrorDomain" code:1000 userInfo:v13];

      [a1[4] _finishWithResponse:0 error:v14];
    }
  }

  _Block_object_dispose(&v27, 8);
}

uint64_t __87__MPStoreModelRequestOperation__executeURLLoadWithRequests_storeURLBag_requestContext___block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __87__MPStoreModelRequestOperation__executeURLLoadWithRequests_storeURLBag_requestContext___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _finishWithResponse:a2 error:a3];
}

void __87__MPStoreModelRequestOperation__executeURLLoadWithRequests_storeURLBag_requestContext___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(v2, "addObject:");
  }
  else
  {
    id v3 = [*(id *)(a1 + 64) parsedBody];
    [*(id *)(a1 + 48) setObject:v3 forKeyedSubscript:*(void *)(a1 + 56)];
  }
}

- (void)_executeURLLoadWithRequest:(id)a3 storeURLBag:(id)a4 requestContext:(id)a5
{
  id v6 = [(MPStoreModelRequestOperation *)self _URLLoadRequestWithRequest:a3 requestContext:a5];
  uint64_t v7 = [MEMORY[0x1E4FB87A8] highPrioritySession];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__MPStoreModelRequestOperation__executeURLLoadWithRequest_storeURLBag_requestContext___block_invoke;
  v8[3] = &unk_1E57F60F0;
  v8[4] = self;
  [v7 enqueueDataRequest:v6 withCompletionHandler:v8];
}

void __86__MPStoreModelRequestOperation__executeURLLoadWithRequest_storeURLBag_requestContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3)
  {
    id v4 = *(void **)(a1 + 32);
    [v4 _finishWithResponse:0 error:a3];
  }
  else
  {
    id v6 = [a2 parsedBody];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __86__MPStoreModelRequestOperation__executeURLLoadWithRequest_storeURLBag_requestContext___block_invoke_2;
    v7[3] = &unk_1E57F60A0;
    v7[4] = *(void *)(a1 + 32);
    [v3 produceResponseWithLoadedOutput:v6 completion:v7];
  }
}

uint64_t __86__MPStoreModelRequestOperation__executeURLLoadWithRequest_storeURLBag_requestContext___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _finishWithResponse:a2 error:a3];
}

- (void)_executeItemMetadataLoadForRequestedItemIdentifiers:(id)a3 reason:(unint64_t)a4 requestContext:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init(MPStoreItemMetadataRequest);
  unint64_t v11 = [v8 clientInfo];
  [(MPStoreItemMetadataRequest *)v10 setClientInfo:v11];

  uint64_t v12 = [v8 identity];

  [(MPStoreItemMetadataRequest *)v10 setUserIdentity:v12];
  [(MPStoreItemMetadataRequest *)v10 setItemIdentifiers:v9];

  [(MPStoreItemMetadataRequest *)v10 setReason:a4];
  id v13 = +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __106__MPStoreModelRequestOperation__executeItemMetadataLoadForRequestedItemIdentifiers_reason_requestContext___block_invoke;
  v15[3] = &unk_1E57F60C8;
  v15[4] = self;
  id v14 = (id)[v13 getStoreItemMetadataForRequest:v10 responseHandler:v15];
}

void __106__MPStoreModelRequestOperation__executeItemMetadataLoadForRequestedItemIdentifiers_reason_requestContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    [*(id *)(a1 + 32) _finishWithResponse:0 error:a3];
  }
  else if ([v5 isFinalResponse])
  {
    uint64_t v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __106__MPStoreModelRequestOperation__executeItemMetadataLoadForRequestedItemIdentifiers_reason_requestContext___block_invoke_2;
    v8[3] = &unk_1E57F60A0;
    v8[4] = v7;
    [v7 produceResponseWithLoadedOutput:v6 completion:v8];
  }
}

uint64_t __106__MPStoreModelRequestOperation__executeItemMetadataLoadForRequestedItemIdentifiers_reason_requestContext___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _finishWithResponse:a2 error:a3];
}

- (void)_finishWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  accessSerialQueue = self->_accessSerialQueue;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __58__MPStoreModelRequestOperation__finishWithResponse_error___block_invoke;
  id v13 = &unk_1E57F9F98;
  id v14 = self;
  id v15 = v6;
  id v8 = v6;
  id v9 = a4;
  dispatch_sync(accessSerialQueue, &v10);
  -[MPStoreModelRequestOperation finishWithError:](self, "finishWithError:", v9, v10, v11, v12, v13, v14);
}

void __58__MPStoreModelRequestOperation__finishWithResponse_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _tearDownTimeoutTimerSource];
  v2 = *(void **)(a1 + 40);
  id v3 = (id *)(*(void *)(a1 + 32) + 288);

  objc_storeStrong(v3, v2);
}

- (void)dispatchSync:(id)a3
{
}

- (void)dispatchAsync:(id)a3
{
}

- (void)assertRunningInAccessQueue
{
}

- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4
{
  return 0;
}

- (double)adjustTimeoutInterval:(double)a3
{
  return a3;
}

- (double)remainingTimeInterval
{
  uint64_t v12 = 0;
  id v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v8 = 0;
  id v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  accessSerialQueue = self->_accessSerialQueue;
  uint64_t v11 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MPStoreModelRequestOperation_remainingTimeInterval__block_invoke;
  block[3] = &unk_1E57F9278;
  void block[4] = self;
  void block[5] = &v12;
  block[6] = &v8;
  dispatch_sync(accessSerialQueue, block);
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v13[3] + v9[3] - v3;
  if (v4 >= 0.0) {
    double v5 = v4;
  }
  else {
    double v5 = 0.0;
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

uint64_t __53__MPStoreModelRequestOperation_remainingTimeInterval__block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 296);
  v2 = (id *)a1[4];
  [v2[39] timeoutInterval];
  uint64_t result = objc_msgSend(v2, "adjustTimeoutInterval:");
  *(void *)(*(void *)(a1[6] + 8) + 24) = v4;
  return result;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__10;
  id v19 = __Block_byref_object_dispose__11;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__39338;
  accessSerialQueue = self->_accessSerialQueue;
  id v13 = __Block_byref_object_dispose__39339;
  id v14 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MPStoreModelRequestOperation_finishWithError___block_invoke;
  block[3] = &unk_1E57F9278;
  void block[4] = self;
  void block[5] = &v9;
  block[6] = &v15;
  dispatch_sync(accessSerialQueue, block);
  uint64_t v6 = v16[5];
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v10[5], v4);
  }
  v7.receiver = self;
  v7.super_class = (Class)MPStoreModelRequestOperation;
  [(MPAsyncOperation *)&v7 finishWithError:v4];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
}

void __48__MPStoreModelRequestOperation_finishWithError___block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 288));
  uint64_t v2 = MEMORY[0x19971E0F0](*(void *)(a1[4] + 320));
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[4];
  uint64_t v6 = *(void **)(v5 + 320);
  *(void *)(v5 + 320) = 0;
}

- (void)execute
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  id v4 = v3;
  [(MPStoreModelRequest *)self->_request timeoutInterval];
  uint64_t v6 = v5;
  objc_initWeak(&location, self);
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MPStoreModelRequestOperation_execute__block_invoke;
  block[3] = &unk_1E57F6050;
  void block[4] = self;
  v22[1] = v4;
  v22[2] = v6;
  objc_copyWeak(v22, &location);
  dispatch_async(accessSerialQueue, block);
  uint64_t v8 = [MEMORY[0x1E4FB85B0] defaultInfo];
  uint64_t v9 = [(MPStoreModelRequest *)self->_request clientIdentifier];
  uint64_t v10 = [(MPStoreModelRequest *)self->_request clientVersion];
  if (v9 | v10)
  {
    uint64_t v11 = (void *)[v8 mutableCopy];
    uint64_t v12 = v11;
    if (v9) {
      [v11 setClientIdentifier:v9];
    }
    if (v10) {
      [v12 setClientVersion:v10];
    }
    uint64_t v13 = [v12 copy];

    uint64_t v8 = (void *)v13;
  }
  id v14 = objc_alloc(MEMORY[0x1E4FB8758]);
  uint64_t v15 = [(MPAsyncOperation *)self userIdentity];
  id v16 = (void *)[v14 initWithIdentity:v15 clientInfo:v8];

  uint64_t v17 = [MEMORY[0x1E4FB8788] sharedBagProvider];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __39__MPStoreModelRequestOperation_execute__block_invoke_3;
  v19[3] = &unk_1E57F6078;
  v19[4] = self;
  id v18 = v16;
  id v20 = v18;
  [v17 getBagForRequestContext:v18 withCompletionHandler:v19];

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
}

void __39__MPStoreModelRequestOperation_execute__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 296) = *(void *)(a1 + 48);
  uint64_t v2 = dispatch_get_global_queue(-32768, 0);
  dispatch_source_t v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v2);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 304);
  *(void *)(v4 + 304) = v3;

  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 304);
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 304);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __39__MPStoreModelRequestOperation_execute__block_invoke_2;
  handler[3] = &unk_1E57F6EF0;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 304));
  objc_destroyWeak(&v10);
}

void __39__MPStoreModelRequestOperation_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_time_t v7 = os_log_create("com.apple.amp.mediaplayer", "Default");
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = [v5 serverEnvironment];
      uint64_t v11 = [v5 serverCorrelationKey];
      uint64_t v12 = objc_msgSend(v6, "msv_description");
      *(_DWORD *)buf = 138544130;
      uint64_t v26 = v9;
      __int16 v27 = 2114;
      v28 = v10;
      __int16 v29 = 2114;
      uint64_t v30 = v11;
      __int16 v31 = 2114;
      v32 = v12;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Got bag from server environment '%{public}@' with correlation key '%{public}@'. error=%{public}@", buf, 0x2Au);
    }
    [*(id *)(a1 + 32) _finishWithResponse:0 error:v6];
    goto LABEL_18;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = [v5 serverEnvironment];
    uint64_t v15 = [v5 serverCorrelationKey];
    *(_DWORD *)buf = 138543874;
    uint64_t v26 = v13;
    __int16 v27 = 2114;
    v28 = v14;
    __int16 v29 = 2114;
    uint64_t v30 = v15;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Got bag from server environment '%{public}@' with correlation key '%{public}@'.", buf, 0x20u);
  }
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v16 = *(void **)(a1 + 32);
    id v24 = 0;
    uint64_t v17 = [v16 configurationForLoadingModelDataWithStoreURLBag:v5 error:&v24];
    id v18 = v24;
    if (v18)
    {
      [*(id *)(a1 + 32) _finishWithResponse:0 error:v18];
LABEL_17:

      goto LABEL_18;
    }
    uint64_t v19 = [v17 type];
    if (v19 == 2)
    {
      long long v22 = *(void **)(a1 + 32);
      long long v21 = [v17 URLRequests];
      [v22 _executeURLLoadWithRequests:v21 storeURLBag:v5 requestContext:*(void *)(a1 + 40)];
    }
    else if (v19 == 1)
    {
      long long v23 = *(void **)(a1 + 32);
      long long v21 = [v17 requestedItemIdentifiers];
      objc_msgSend(v23, "_executeItemMetadataLoadForRequestedItemIdentifiers:reason:requestContext:", v21, objc_msgSend(v17, "itemMetadataRequestReason"), *(void *)(a1 + 40));
    }
    else
    {
      if (v19) {
        goto LABEL_17;
      }
      id v20 = *(void **)(a1 + 32);
      long long v21 = [v17 URLRequest];
      [v20 _executeURLLoadWithRequest:v21 storeURLBag:v5 requestContext:*(void *)(a1 + 40)];
    }

    goto LABEL_17;
  }
LABEL_18:
}

void __39__MPStoreModelRequestOperation_execute__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _handleTimeout];
    id WeakRetained = v2;
  }
}

- (void)cancel
{
  uint64_t v6 = 0;
  dispatch_time_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__39338;
  id v10 = __Block_byref_object_dispose__39339;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MPStoreModelRequestOperation_cancel__block_invoke;
  block[3] = &unk_1E57F9F20;
  void block[4] = self;
  void block[5] = &v6;
  dispatch_sync(accessSerialQueue, block);
  [(id)v7[5] cancel];
  v4.receiver = self;
  v4.super_class = (Class)MPStoreModelRequestOperation;
  [(MPAsyncOperation *)&v4 cancel];
  _Block_object_dispose(&v6, 8);
}

void __38__MPStoreModelRequestOperation_cancel__block_invoke(uint64_t a1)
{
}

- (void)dealloc
{
  [(MPStoreModelRequestOperation *)self _tearDownTimeoutTimerSource];
  v3.receiver = self;
  v3.super_class = (Class)MPStoreModelRequestOperation;
  [(MPStoreModelRequestOperation *)&v3 dealloc];
}

- (MPStoreModelRequestOperation)initWithRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MPStoreModelRequestOperation *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    request = v8->_request;
    v8->_request = (MPStoreModelRequest *)v9;

    uint64_t v11 = [v7 copy];
    id responseHandler = v8->_responseHandler;
    v8->_id responseHandler = (id)v11;
  }
  return v8;
}

- (MPStoreModelRequestOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPStoreModelRequestOperation;
  id v2 = [(MPAsyncOperation *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MediaPlayer.MPStoreModelRequestOperation.accessSerialQueue", 0);
    accessSerialQueue = v2->_accessSerialQueue;
    v2->_accessSerialQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end