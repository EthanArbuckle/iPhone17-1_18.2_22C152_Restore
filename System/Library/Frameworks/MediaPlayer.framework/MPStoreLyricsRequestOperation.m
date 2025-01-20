@interface MPStoreLyricsRequestOperation
+ (BOOL)supportsLyricsForURLBag:(id)a3;
+ (id)_lyricsURLForURLBag:(id)a3;
- (MPStoreLyricsRequestOperation)init;
- (id)responseHandler;
- (int64_t)songAdamID;
- (void)_enqueueOperationWithURL:(id)a3 storeURLBag:(id)a4 allowingAuthentication:(BOOL)a5;
- (void)cancel;
- (void)execute;
- (void)finishWithError:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setSongAdamID:(int64_t)a3;
@end

@implementation MPStoreLyricsRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setSongAdamID:(int64_t)a3
{
  self->_songAdamID = a3;
}

- (int64_t)songAdamID
{
  return self->_songAdamID;
}

- (void)_enqueueOperationWithURL:(id)a3 storeURLBag:(id)a4 allowingAuthentication:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__18303;
  v19[4] = __Block_byref_object_dispose__18304;
  id v20 = 0;
  id v10 = objc_alloc(MEMORY[0x1E4FB85A0]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke;
  v14[3] = &unk_1E57F0E08;
  BOOL v18 = a5;
  id v11 = v8;
  id v15 = v11;
  v16 = self;
  v17 = v19;
  v12 = (void *)[v10 initWithStartHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke_5;
  v13[3] = &unk_1E57F9F20;
  v13[4] = self;
  v13[5] = v19;
  [v12 setCancellationHandler:v13];
  [(NSOperationQueue *)self->_operationQueue addOperation:v12];

  _Block_object_dispose(v19, 8);
}

void __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4FB8758]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke_2;
  v19[3] = &__block_descriptor_33_e26_v16__0__ICRequestContext_8l;
  char v20 = *(unsigned char *)(a1 + 56);
  v5 = (void *)[v4 initWithBlock:v19];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:*(void *)(a1 + 32)];
  [v6 setHTTPMethod:@"GET"];
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(NSObject **)(v7 + 280);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke_3;
  v13[3] = &unk_1E57F0DE0;
  uint64_t v9 = *(void *)(a1 + 48);
  id v17 = v3;
  uint64_t v18 = v9;
  id v14 = v6;
  id v15 = v5;
  uint64_t v16 = v7;
  id v10 = v3;
  id v11 = v5;
  id v12 = v6;
  dispatch_async(v8, v13);
}

void __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke_5(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 280);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke_6;
  block[3] = &unk_1E57FA300;
  block[4] = *(void *)(a1 + 40);
  dispatch_async(v1, block);
}

void __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke_6(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v2 = [MEMORY[0x1E4FB87A8] defaultSession];
    [v2 cancelRequest:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  }
}

void __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4FB87B8];
  id v4 = a2;
  v5 = [v3 activeAccount];
  [v4 setIdentity:v5];

  id v6 = objc_alloc(MEMORY[0x1E4FB8768]);
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  id v8 = (id)[v6 initWithUserInteractionLevel:v7];
  [v4 setAuthenticationProvider:v8];
}

void __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke_3(void *a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4FB8760]) initWithURLRequest:a1[4] requestContext:a1[5]];
  uint64_t v3 = *(void *)(a1[8] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = [MEMORY[0x1E4FB87A8] defaultSession];
  uint64_t v6 = *(void *)(*(void *)(a1[8] + 8) + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke_4;
  v8[3] = &unk_1E57FA288;
  uint64_t v7 = (void *)a1[7];
  v8[4] = a1[6];
  id v9 = v7;
  [v5 enqueueDataRequest:v6 withCompletionHandler:v8];
}

void __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) != 0
    || ([*(id *)(a1 + 40) isCancelled] & 1) != 0)
  {
    goto LABEL_25;
  }
  id v7 = v6;
  id v8 = [v5 urlResponse];
  id v9 = [v5 parsedBodyDictionary];
  if (!v7 && [v8 statusCode] != 200)
  {
    id v17 = (void *)MEMORY[0x1E4F28C58];
    v23 = @"HTTPStatusCodeKey";
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "statusCode"));
    v24[0] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    id v7 = [v17 errorWithDomain:@"MPStoreLyricsRequestErrorDomain" code:-3003 userInfo:v19];

    v13 = 0;
    goto LABEL_21;
  }
  if (!v9)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = -3003;
    goto LABEL_9;
  }
  if (objc_msgSend(v9, "ic_intValueForKey:", @"error") == 214)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = -3005;
LABEL_9:
    uint64_t v12 = [v10 errorWithDomain:@"MPStoreLyricsRequestErrorDomain" code:v11 userInfo:0];

    v13 = 0;
    id v7 = (id)v12;
    goto LABEL_21;
  }
  id v14 = objc_msgSend(v9, "ic_stringValueForKey:", @"ttml");
  id v15 = objc_msgSend(v9, "ic_stringValueForKey:", @"lyricsId");
  if (v14)
  {
    if (_NSIsNSString())
    {
      id v16 = v15;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        char v20 = 0;
        goto LABEL_19;
      }
      objc_msgSend(NSString, "stringWithFormat:", @"%lli", objc_msgSend(v15, "longLongValue"));
      id v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    char v20 = v16;
LABEL_19:
    v13 = objc_opt_new();
    [v13 setLyricsContent:v14];
    [v13 setLyricsID:v20];
    goto LABEL_20;
  }
  [MEMORY[0x1E4F28C58] errorWithDomain:@"MPStoreLyricsRequestErrorDomain" code:-3004 userInfo:0];
  v13 = 0;
  char v20 = v7;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

LABEL_21:
  [*(id *)(a1 + 40) finishWithError:v7];
  [*(id *)(a1 + 32) finishWithError:v7];
  if (v13)
  {
    v21 = [*(id *)(a1 + 32) responseHandler];

    if (v21)
    {
      v22 = [*(id *)(a1 + 32) responseHandler];
      ((void (**)(void, void *, void))v22)[2](v22, v13, 0);
    }
  }

LABEL_25:
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)MPStoreLyricsRequestOperation;
  [(MPAsyncOperation *)&v3 cancel];
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
  [(MPAsyncOperation *)self finish];
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPStoreLyricsRequestOperation;
  [(MPAsyncOperation *)&v7 finishWithError:v4];
  if (v4)
  {
    id v5 = [(MPStoreLyricsRequestOperation *)self responseHandler];

    if (v5)
    {
      id v6 = [(MPStoreLyricsRequestOperation *)self responseHandler];
      ((void (**)(void, void, id))v6)[2](v6, 0, v4);
    }
  }
}

- (void)execute
{
  if ([(MPStoreLyricsRequestOperation *)self songAdamID])
  {
    if (!self->_operationQueue)
    {
      objc_super v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
      operationQueue = self->_operationQueue;
      self->_operationQueue = v3;

      [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:2];
      [(NSOperationQueue *)self->_operationQueue setName:@"com.apple.MediaPlayer.MPStoreLyricsRequestOperation.operationQueue"];
      id v5 = self->_operationQueue;
      id v6 = [MEMORY[0x1E4F29060] currentThread];
      -[NSOperationQueue setQualityOfService:](v5, "setQualityOfService:", [v6 qualityOfService]);
    }
    id v7 = objc_alloc(MEMORY[0x1E4FB8758]);
    id v8 = [MEMORY[0x1E4FB87B8] activeAccount];
    id v9 = (void *)[v7 initWithIdentity:v8];

    id v10 = [MEMORY[0x1E4FB8788] sharedBagProvider];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __40__MPStoreLyricsRequestOperation_execute__block_invoke;
    v12[3] = &unk_1E57FA240;
    v12[4] = self;
    [v10 getBagForRequestContext:v9 withCompletionHandler:v12];
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPStoreLyricsRequestErrorDomain" code:-3001 userInfo:0];
    [(MPStoreLyricsRequestOperation *)self finishWithError:v11];
  }
}

void __40__MPStoreLyricsRequestOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28A50];
    id v32 = v6;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    id v10 = [v8 errorWithDomain:@"MPStoreLyricsRequestErrorDomain" code:-3002 userInfo:v9];

    [*(id *)(a1 + 32) finishWithError:v10];
  }
  else
  {
    uint64_t v11 = [(id)objc_opt_class() _lyricsURLForURLBag:v5];
    if (v11)
    {
      id v10 = (void *)v11;
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v11 resolvingAgainstBaseURL:0];
      v13 = [v12 queryItems];
      id v14 = (void *)[v13 mutableCopy];

      if (!v14) {
        id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      }
      id v15 = objc_alloc(MEMORY[0x1E4F290C8]);
      uint64_t quot = [*(id *)(a1 + 32) songAdamID];
      uint64_t v17 = quot;
      uint64_t v18 = (char *)&v33 + 1;
      do
      {
        lldiv_t v19 = lldiv(quot, 10);
        uint64_t quot = v19.quot;
        if (v19.rem >= 0) {
          LOBYTE(v20) = v19.rem;
        }
        else {
          uint64_t v20 = -v19.rem;
        }
        *(v18 - 2) = v20 + 48;
        v21 = (const UInt8 *)(v18 - 2);
        --v18;
      }
      while (v19.quot);
      if (v17 < 0)
      {
        *(v18 - 2) = 45;
        v21 = (const UInt8 *)(v18 - 2);
      }
      v22 = (__CFString *)CFStringCreateWithBytes(0, v21, (char *)&v33 - (char *)v21, 0x8000100u, 0);
      v23 = (void *)[v15 initWithName:@"id" value:v22];

      [v14 addObject:v23];
      id v24 = objc_alloc(MEMORY[0x1E4F290C8]);
      v25 = [MEMORY[0x1E4F1CA20] preferredLanguages];
      v26 = [v25 firstObject];
      v27 = (void *)[v24 initWithName:@"l" value:v26];

      [v14 addObject:v27];
      [v12 setQueryItems:v14];
      v28 = [v12 URL];
      if (v28)
      {
        [*(id *)(a1 + 32) _enqueueOperationWithURL:v28 storeURLBag:v5 allowingAuthentication:1];
      }
      else
      {
        v30 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPStoreLyricsRequestErrorDomain" code:-3000 userInfo:0];
        [*(id *)(a1 + 32) finishWithError:v30];
      }
    }
    else
    {
      v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPStoreLyricsRequestErrorDomain" code:-3002 userInfo:0];
      [*(id *)(a1 + 32) finishWithError:v29];

      id v10 = 0;
    }
  }
}

- (MPStoreLyricsRequestOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPStoreLyricsRequestOperation;
  uint64_t v2 = [(MPAsyncOperation *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MediaPlayer.LyricsRequest.access", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)_lyricsURLForURLBag:(id)a3
{
  dispatch_queue_t v3 = [a3 dictionaryForBagKey:*MEMORY[0x1E4FB8560]];
  if (!_NSIsNSDictionary()) {
    goto LABEL_8;
  }
  id v4 = [v3 objectForKey:@"ttmlLyrics"];
  if (!v4)
  {
    id v4 = [v3 objectForKey:@"lyrics"];
  }
  if ((_NSIsNSString() & 1) == 0)
  {

LABEL_8:
    id v4 = 0;
    goto LABEL_9;
  }
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
    goto LABEL_10;
  }
LABEL_9:
  id v5 = 0;
LABEL_10:

  return v5;
}

+ (BOOL)supportsLyricsForURLBag:(id)a3
{
  dispatch_queue_t v3 = [a1 _lyricsURLForURLBag:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

@end