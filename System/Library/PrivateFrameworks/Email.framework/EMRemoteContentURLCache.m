@interface EMRemoteContentURLCache
- (BOOL)_isCanceledResponse:(uint64_t)a1;
- (void)_getCachedResponseForDataTask:(char)a3 ignoreExistingCancelation:(void *)a4 completionHandler:;
- (void)_storeCancelationForDataTask:(void *)a1;
- (void)getCachedResponseForDataTask:(id)a3 completionHandler:(id)a4;
- (void)storeCachedResponse:(id)a3 forDataTask:(id)a4;
- (void)storeCancelationIfNeededForDataTask:(id)a3 completionHandler:(id)a4;
- (void)storeResponseIfNeeded:(id)a3 withData:(id)a4 forDataTask:(id)a5 completionHandler:(id)a6;
@end

@implementation EMRemoteContentURLCache

- (void)storeCachedResponse:(id)a3 forDataTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 response];
  BOOL v9 = -[EMRemoteContentURLCache _isCanceledResponse:]((uint64_t)self, v8);

  if (!v9)
  {
    v10.receiver = self;
    v10.super_class = (Class)EMRemoteContentURLCache;
    [(NSURLCache *)&v10 storeCachedResponse:v6 forDataTask:v7];
  }
}

- (BOOL)_isCanceledResponse:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  BOOL v5 = 0;
  if (a1 && v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v4 statusCode] == 204
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v6 = [v4 valueForHTTPHeaderField:@"x-apple-canceled"];
      BOOL v5 = v6 != 0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (void)storeResponseIfNeeded:(id)a3 withData:(id)a4 forDataTask:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void))a6;
  if (-[EMRemoteContentURLCache _isCanceledResponse:]((uint64_t)self, v10))
  {
    v13[2](v13, 0);
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __88__EMRemoteContentURLCache_storeResponseIfNeeded_withData_forDataTask_completionHandler___block_invoke;
    v14[3] = &unk_1E63E5ED8;
    id v15 = v10;
    id v16 = v11;
    id v17 = v12;
    v18 = self;
    v19 = v13;
    -[EMRemoteContentURLCache _getCachedResponseForDataTask:ignoreExistingCancelation:completionHandler:](self, v17, 1, v14);
  }
}

void __88__EMRemoteContentURLCache_storeResponseIfNeeded_withData_forDataTask_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F18D20]) initWithResponse:*(void *)(a1 + 32) data:*(void *)(a1 + 40) userInfo:0 storagePolicy:0];
    uint64_t v5 = *(void *)(a1 + 48);
    v7.receiver = *(id *)(a1 + 56);
    v7.super_class = (Class)EMRemoteContentURLCache;
    objc_msgSendSuper2(&v7, sel_storeCachedResponse_forDataTask_, v4, v5);
  }
  uint64_t v6 = *(void *)(a1 + 64);
  if (v6) {
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v3 == 0);
  }
}

- (void)_getCachedResponseForDataTask:(char)a3 ignoreExistingCancelation:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __101__EMRemoteContentURLCache__getCachedResponseForDataTask_ignoreExistingCancelation_completionHandler___block_invoke;
    v10[3] = &unk_1E63E5F28;
    v10[4] = a1;
    char v13 = a3;
    id v11 = v7;
    id v12 = v8;
    v9.receiver = a1;
    v9.super_class = (Class)EMRemoteContentURLCache;
    objc_msgSendSuper2(&v9, sel_getCachedResponseForDataTask_completionHandler_, v11, v10);
  }
}

- (void)storeCancelationIfNeededForDataTask:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__EMRemoteContentURLCache_storeCancelationIfNeededForDataTask_completionHandler___block_invoke;
  v10[3] = &unk_1E63E5F00;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[EMRemoteContentURLCache _getCachedResponseForDataTask:ignoreExistingCancelation:completionHandler:](self, v9, 1, v10);
}

void __81__EMRemoteContentURLCache_storeCancelationIfNeededForDataTask_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (!v4) {
    -[EMRemoteContentURLCache _storeCancelationForDataTask:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, BOOL))(v3 + 16))(v3, v4 == 0);
  }
}

- (void)_storeCancelationForDataTask:(void *)a1
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    if (_storeCancelationForDataTask__onceToken != -1) {
      dispatch_once(&_storeCancelationForDataTask__onceToken, &__block_literal_global_43);
    }
    id v4 = objc_alloc(MEMORY[0x1E4F18D40]);
    uint64_t v5 = [v3 originalRequest];
    id v6 = [v5 URL];
    id v7 = (void *)[v4 initWithURL:v6 statusCode:204 HTTPVersion:@"HTTP/1.1" headerFields:_storeCancelationForDataTask__sHeaders];

    id v8 = objc_alloc(MEMORY[0x1E4F18D20]);
    uint64_t v9 = _storeCancelationForDataTask__sEmptyData;
    v14 = @"LastAccessed";
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    v15[0] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v12 = (void *)[v8 initWithResponse:v7 data:v9 userInfo:v11 storagePolicy:0];

    v13.receiver = a1;
    v13.super_class = (Class)EMRemoteContentURLCache;
    objc_msgSendSuper2(&v13, sel_storeCachedResponse_forDataTask_, v12, v3);
  }
}

- (void)getCachedResponseForDataTask:(id)a3 completionHandler:(id)a4
{
}

void __101__EMRemoteContentURLCache__getCachedResponseForDataTask_ignoreExistingCancelation_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 response];
  if (-[EMRemoteContentURLCache _isCanceledResponse:](*(void *)(a1 + 32), v3))
  {
    id v4 = [v6 userInfo];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"LastAccessed"];

    if (*(unsigned char *)(a1 + 56) || (objc_msgSend(v5, "ef_isMoreThanTimeIntervalAgo:", 300.0) & 1) == 0)
    {
      [*(id *)(a1 + 32) removeCachedResponseForDataTask:*(void *)(a1 + 40)];

      id v6 = 0;
    }
    else
    {
      -[EMRemoteContentURLCache _storeCancelationForDataTask:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __56__EMRemoteContentURLCache__storeCancelationForDataTask___block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
  v1 = (void *)_storeCancelationForDataTask__sEmptyData;
  _storeCancelationForDataTask__sEmptyData = (uint64_t)v0;

  id v4 = @"x-apple-canceled";
  v5[0] = @"1";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  id v3 = (void *)_storeCancelationForDataTask__sHeaders;
  _storeCancelationForDataTask__sHeaders = v2;
}

@end