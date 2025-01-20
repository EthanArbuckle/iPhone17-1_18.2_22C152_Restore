@interface MPStoreSocialRequestOperation
+ (id)_stringRepresentationForHTTPBodyType:(int64_t)a3;
+ (id)_stringRepresentationForHTTPMethod:(int64_t)a3;
+ (id)_urlStringForKey:(id)a3 inBag:(id)a4;
- (MPStoreSocialRequestOperation)initWithDataSource:(id)a3;
- (MPStoreSocialRequestOperationDataSource)dataSource;
- (id)_requestURLFromBag:(id)a3;
- (id)responseHandler;
- (void)cancel;
- (void)execute;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPStoreSocialRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (MPStoreSocialRequestOperationDataSource)dataSource
{
  return self->_dataSource;
}

- (id)_requestURLFromBag:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MPStoreSocialRequestOperationDataSource *)self->_dataSource bagKey];
  if (v5)
  {
    v6 = [(id)objc_opt_class() _urlStringForKey:v5 inBag:v4];
    if (v6) {
      goto LABEL_17;
    }
    if (objc_opt_respondsToSelector())
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v7 = [(MPStoreSocialRequestOperationDataSource *)self->_dataSource fallbackBagKeys];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = [(id)objc_opt_class() _urlStringForKey:*(void *)(*((void *)&v17 + 1) + 8 * i) inBag:v4];
            if (v12)
            {
              v6 = (void *)v12;

              goto LABEL_17;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([(MPStoreSocialRequestOperationDataSource *)self->_dataSource fallbackURLString],
        (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v13 = 0;
    goto LABEL_18;
  }
LABEL_17:
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v6];
  v15 = [(MPStoreSocialRequestOperationDataSource *)self->_dataSource queryItems];
  [v14 setQueryItems:v15];

  v13 = [v14 URL];

LABEL_18:

  return v13;
}

- (void)execute
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__MPStoreSocialRequestOperation_execute__block_invoke;
  v11[3] = &unk_1E57F9B00;
  v11[4] = self;
  v3 = (void *)MEMORY[0x19971E0F0](v11, a2);
  id v4 = objc_alloc(MEMORY[0x1E4FB8758]);
  v5 = [MEMORY[0x1E4FB87B8] activeAccount];
  v6 = (void *)[v4 initWithIdentity:v5];

  v7 = [MEMORY[0x1E4FB8788] sharedBagProvider];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__MPStoreSocialRequestOperation_execute__block_invoke_2;
  v9[3] = &unk_1E57F6218;
  v9[4] = self;
  id v10 = v3;
  id v8 = v3;
  [v7 getBagForRequestContext:v6 withCompletionHandler:v9];
}

void __40__MPStoreSocialRequestOperation_execute__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 280);
  *(void *)(v4 + 280) = 0;

  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__40322;
  v14 = __Block_byref_object_dispose__40323;
  id v15 = 0;
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 272);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__MPStoreSocialRequestOperation_execute__block_invoke_4;
  v9[3] = &unk_1E57F9F20;
  v9[4] = v6;
  void v9[5] = &v10;
  dispatch_sync(v7, v9);
  uint64_t v8 = v11[5];
  if (v8) {
    (*(void (**)(uint64_t, BOOL, id))(v8 + 16))(v8, v3 == 0, v3);
  }
  [*(id *)(a1 + 32) finishWithError:v3];
  _Block_object_dispose(&v10, 8);
}

void __40__MPStoreSocialRequestOperation_execute__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    v5 = [*(id *)(a1 + 32) _requestURLFromBag:a2];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v5];
    v7 = objc_msgSend((id)objc_opt_class(), "_stringRepresentationForHTTPMethod:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 288), "httpMethod"));
    [v6 setHTTPMethod:v7];
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 288) httpBody];
    if (v8)
    {
      uint64_t v9 = objc_msgSend((id)objc_opt_class(), "_stringRepresentationForHTTPBodyType:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 288), "httpBodyType"));
      [v6 setValue:v9 forHTTPHeaderField:@"Content-Type"];

      [v6 setHTTPBody:v8];
    }
    id v10 = objc_alloc(MEMORY[0x1E4FB8758]);
    v11 = [MEMORY[0x1E4FB87B8] activeAccount];
    uint64_t v12 = (void *)[v10 initWithIdentity:v11];

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB8760]) initWithURLRequest:v6 requestContext:v12];
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(void **)(v14 + 280);
    *(void *)(v14 + 280) = v13;

    v16 = [MEMORY[0x1E4FB87A8] defaultSession];
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void *)(v17 + 280);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __40__MPStoreSocialRequestOperation_execute__block_invoke_3;
    v19[3] = &unk_1E57F8C38;
    v19[4] = v17;
    id v20 = *(id *)(a1 + 40);
    [v16 enqueueDataRequest:v18 withCompletionHandler:v19];
  }
}

void __40__MPStoreSocialRequestOperation_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  id v5 = a2;
  uint64_t v6 = [v5 urlResponse];
  v7 = [v5 parsedBodyDictionary];

  uint64_t v8 = v12;
  if (!v12)
  {
    if ([*(id *)(a1 + 32) isCancelled])
    {
      uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPStoreSocialErrorDomain" code:-3001 userInfo:0];
    }
    else if ([v6 statusCode] == 200)
    {
      if (v7)
      {
        id v10 = objc_msgSend(v7, "ic_stringValueForKey:", @"status");
        char v11 = [v10 isEqualToString:@"success"];

        if (v11)
        {
          uint64_t v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MPStoreSocialErrorDomain" code:-3000 userInfo:0];
    }
    else
    {
      uint64_t v9 = +[MPStoreSocialServiceController _internalErrorForHTTPResponseCode:](MPStoreSocialServiceController, "_internalErrorForHTTPResponseCode:", [v6 statusCode]);
    }
    uint64_t v8 = (void *)v9;
  }
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __40__MPStoreSocialRequestOperation_execute__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x19971E0F0](*(void *)(*(void *)(a1 + 32) + 296));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)MPStoreSocialRequestOperation;
  [(MPAsyncOperation *)&v4 cancel];
  if (self->_request)
  {
    uint64_t v3 = [MEMORY[0x1E4FB87A8] defaultSession];
    [v3 cancelRequest:self->_request];
  }
}

- (void)setResponseHandler:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__MPStoreSocialRequestOperation_setResponseHandler___block_invoke;
  v7[3] = &unk_1E57F9140;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __52__MPStoreSocialRequestOperation_setResponseHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 296);
  *(void *)(v3 + 296) = v2;
}

- (MPStoreSocialRequestOperation)initWithDataSource:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPStoreSocialRequestOperation;
  id v6 = [(MPAsyncOperation *)&v10 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MPStoreSocialRequestOperation.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v6->_accessQueue;
    v6->_accessQueue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v6;
}

+ (id)_urlStringForKey:(id)a3 inBag:(id)a4
{
  id v5 = a3;
  id v6 = [a4 dictionaryForBagKey:*MEMORY[0x1E4FB8558]];
  dispatch_queue_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKey:v5];
    if (_NSIsNSString()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)_stringRepresentationForHTTPMethod:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return off_1E57F6238[a3];
  }
}

+ (id)_stringRepresentationForHTTPBodyType:(int64_t)a3
{
  uint64_t v3 = @"application/json; charset=utf-8";
  if (a3 != 1) {
    uint64_t v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return @"application/x-www-form-urlencoded";
  }
}

@end