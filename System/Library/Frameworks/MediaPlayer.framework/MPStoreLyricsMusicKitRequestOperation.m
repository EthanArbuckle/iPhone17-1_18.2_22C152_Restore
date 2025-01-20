@interface MPStoreLyricsMusicKitRequestOperation
+ (BOOL)supportsLyricsForURLBag:(id)a3;
+ (id)_lyricsURLForURLBag:(id)a3 identifier:(int64_t)a4;
- (MPStoreLyricsMusicKitRequestOperation)init;
- (id)responseHandler;
- (int64_t)songAdamID;
- (void)_enqueueOperationWithURL:(id)a3;
- (void)cancel;
- (void)execute;
- (void)finishWithError:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setSongAdamID:(int64_t)a3;
@end

@implementation MPStoreLyricsMusicKitRequestOperation

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

- (void)_enqueueOperationWithURL:(id)a3
{
  id v4 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__56494;
  v16[4] = __Block_byref_object_dispose__56495;
  id v17 = 0;
  v5 = [(NSOperationQueue *)self->_operationQueue qualityOfService];
  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x1E4FB85A0]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke;
  v11[3] = &unk_1E57FA2D8;
  objc_copyWeak(v14, &location);
  id v7 = v4;
  id v12 = v7;
  v13 = v16;
  v14[1] = v5;
  v8 = (void *)[v6 initWithStartHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke_5;
  v9[3] = &unk_1E57FA328;
  objc_copyWeak(&v10, &location);
  v9[4] = v16;
  [v8 setCancellationHandler:v9];
  [(NSOperationQueue *)self->_operationQueue addOperation:v8];
  objc_destroyWeak(&v10);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(v16, 8);
}

void __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (([WeakRetained isCancelled] & 1) == 0 && (objc_msgSend(v3, "isCancelled") & 1) == 0)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4FB8660]) initWithBlock:&__block_literal_global_56500];
    id v6 = [MEMORY[0x1E4F290D0] requestWithURL:*(void *)(a1 + 32)];
    id v7 = WeakRetained[35];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke_3;
    v12[3] = &unk_1E57FA2B0;
    uint64_t v8 = *(void *)(a1 + 40);
    id v13 = v6;
    id v14 = v5;
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v17 = v8;
    uint64_t v18 = v9;
    v15 = WeakRetained;
    id v16 = v3;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v7, v12);
  }
}

void __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke_5(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained[35];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke_6;
  block[3] = &unk_1E57FA300;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v3, block);
}

void __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke_6(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v2 = [MEMORY[0x1E4FB87A8] defaultSession];
    [v2 cancelRequest:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  }
}

void __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke_3(void *a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4FB8668]) initWithURLRequest:a1[4] requestContext:a1[5]];
  uint64_t v3 = *(void *)(a1[8] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = [MEMORY[0x1E4FB87A8] sharedSessionManager];
  id v6 = [v5 sessionWithQualityOfService:a1[9]];

  uint64_t v7 = *(void *)(*(void *)(a1[8] + 8) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke_4;
  v9[3] = &unk_1E57FA288;
  uint64_t v8 = (void *)a1[7];
  v9[4] = a1[6];
  id v10 = v8;
  [v6 enqueueDataRequest:v7 withCompletionHandler:v9];
}

void __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0
    && ([*(id *)(a1 + 40) isCancelled] & 1) == 0)
  {
    if (v6)
    {
      uint64_t v7 = objc_msgSend(v6, "msv_errorByWrappingWithDomain:code:debugDescription:", @"MPStoreLyricsRequestErrorDomain", -3007, @"Data request error");
      [*(id *)(a1 + 40) finishWithError:v7];
      [*(id *)(a1 + 32) finishWithError:v7];
LABEL_17:

      goto LABEL_18;
    }
    uint64_t v7 = [v5 urlResponse];
    uint64_t v8 = [v5 parsedBodyDictionary];
    if ([v7 statusCode] == 200)
    {
      if (v8)
      {
        uint64_t v9 = objc_msgSend(v8, "ic_arrayValueForKey:", @"data");
        v22 = [v9 firstObject];
        id v10 = objc_msgSend(v22, "ic_dictionaryValueForKey:", @"attributes");
        id v11 = objc_msgSend(v10, "ic_stringValueForKey:", @"ttml");
        id v12 = objc_msgSend(v10, "ic_dictionaryValueForKey:", @"playParams");
        id v13 = objc_msgSend(v12, "ic_stringValueForKey:", @"id");

        if (v11)
        {
          v21 = v9;
          id v14 = objc_opt_new();
          [v14 setLyricsContent:v11];
          [v14 setLyricsID:v13];
          v15 = [*(id *)(a1 + 32) responseHandler];

          if (v15)
          {
            id v16 = [*(id *)(a1 + 32) responseHandler];
            ((void (**)(void, void *, void))v16)[2](v16, v14, 0);
          }
          [*(id *)(a1 + 32) finish];
          uint64_t v9 = v21;
        }
        else
        {
          id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPStoreLyricsRequestErrorDomain", -3004, @"Couldn't find ttml property in received response dictionary");
          [*(id *)(a1 + 40) finishWithError:v14];
          [*(id *)(a1 + 32) finishWithError:v14];
        }

        goto LABEL_16;
      }
      v20 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPStoreLyricsRequestErrorDomain", -3003, @"Invalid response dictionary received");
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      v23 = @"HTTPStatusCodeKey";
      uint64_t v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "statusCode"));
      v24[0] = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      v20 = objc_msgSend(v17, "msv_errorWithDomain:code:userInfo:debugDescription:", @"MPStoreLyricsRequestErrorDomain", -3003, v19, @"Invalid response status code received");
    }
    [*(id *)(a1 + 40) finishWithError:v20];
    [*(id *)(a1 + 32) finishWithError:v20];

LABEL_16:
    goto LABEL_17;
  }
LABEL_18:
}

void __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  ICBundleIdentifierForSystemApplicationType();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [MEMORY[0x1E4FB85B0] clientInfoForMusicKitRequestWithClientIdentifier:v6 clientVersion:@"1"];
  [v2 setClientInfo:v3];
  id v4 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  [v2 setIdentityStore:v4];

  id v5 = [MEMORY[0x1E4FB87B8] activeAccount];
  [v2 setIdentity:v5];
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPStoreLyricsMusicKitRequestOperation;
  [(MPAsyncOperation *)&v7 finishWithError:v4];
  if (v4)
  {
    id v5 = [(MPStoreLyricsMusicKitRequestOperation *)self responseHandler];

    if (v5)
    {
      id v6 = [(MPStoreLyricsMusicKitRequestOperation *)self responseHandler];
      ((void (**)(void, void, id))v6)[2](v6, 0, v4);
    }
  }
}

- (void)cancel
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)MPStoreLyricsMusicKitRequestOperation;
  [(MPAsyncOperation *)&v13 cancel];
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPStoreLyricsRequestErrorDomain", -3008, @"Operation was cancelled");
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(NSOperationQueue *)self->_operationQueue operations];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) finishWithError:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }

  [(MPStoreLyricsMusicKitRequestOperation *)self finishWithError:v3];
}

- (void)execute
{
  if ([(MPStoreLyricsMusicKitRequestOperation *)self songAdamID])
  {
    if (!self->_operationQueue)
    {
      uint64_t v3 = (NSOperationQueue *)objc_opt_new();
      operationQueue = self->_operationQueue;
      self->_operationQueue = v3;

      [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:2];
      [(NSOperationQueue *)self->_operationQueue setName:@"com.apple.MediaPlayer.MPStoreLyricsMusicKitRequestOperation.operationQueue"];
      uint64_t v5 = [MEMORY[0x1E4F29060] currentThread];
      -[NSOperationQueue setQualityOfService:](self->_operationQueue, "setQualityOfService:", [v5 qualityOfService]);
    }
    id v6 = objc_alloc(MEMORY[0x1E4FB8758]);
    uint64_t v7 = [MEMORY[0x1E4FB87B8] activeAccount];
    uint64_t v8 = (void *)[v6 initWithIdentity:v7];

    long long v9 = [MEMORY[0x1E4FB8788] sharedBagProvider];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__MPStoreLyricsMusicKitRequestOperation_execute__block_invoke;
    v11[3] = &unk_1E57FA240;
    void v11[4] = self;
    [v9 getBagForRequestContext:v8 withCompletionHandler:v11];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPStoreLyricsRequestErrorDomain", -3001, @"No adam ID provided");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [(MPStoreLyricsMusicKitRequestOperation *)self finishWithError:v10];
  }
}

void __48__MPStoreLyricsMusicKitRequestOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v6 = *(void **)(a1 + 32);
    if (v5)
    {
      uint64_t v7 = objc_msgSend(v5, "msv_errorByWrappingWithDomain:code:debugDescription:", @"MPStoreLyricsRequestErrorDomain", -3002, @"Failed to load bag for activeAccount");
      [v6 finishWithError:v7];
    }
    else
    {
      uint64_t v8 = objc_msgSend((id)objc_opt_class(), "_lyricsURLForURLBag:identifier:", v11, objc_msgSend(*(id *)(a1 + 32), "songAdamID"));
      long long v9 = *(void **)(a1 + 32);
      if (v8)
      {
        uint64_t v7 = (void *)v8;
        [v9 _enqueueOperationWithURL:v8];
      }
      else
      {
        id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPStoreLyricsRequestErrorDomain", -3002, @"Failed to generate Lyrics URL from bag values and identifier");
        [v9 finishWithError:v10];

        uint64_t v7 = 0;
      }
    }
  }
}

- (MPStoreLyricsMusicKitRequestOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPStoreLyricsMusicKitRequestOperation;
  id v2 = [(MPAsyncOperation *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MediaPlayer.LyricsMusicKitRequest.access", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)_lyricsURLForURLBag:(id)a3 identifier:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_super v6 = [v5 stringForBagKey:*MEMORY[0x1E4FB8530]];
  if (_NSIsNSString())
  {
    uint64_t v7 = NSString;
    uint64_t v8 = (char *)&v25 + 1;
    int64_t quot = a4;
    do
    {
      lldiv_t v10 = lldiv(quot, 10);
      int64_t quot = v10.quot;
      if (v10.rem >= 0) {
        LOBYTE(v11) = v10.rem;
      }
      else {
        uint64_t v11 = -v10.rem;
      }
      *(v8 - 2) = v11 + 48;
      long long v12 = (const UInt8 *)(v8 - 2);
      --v8;
    }
    while (v10.quot);
    if (a4 < 0)
    {
      *(v8 - 2) = 45;
      long long v12 = (const UInt8 *)(v8 - 2);
    }
    objc_super v13 = (__CFString *)CFStringCreateWithBytes(0, v12, (char *)&v25 - (char *)v12, 0x8000100u, 0);
    id v14 = [v7 stringWithFormat:@"%@/%@%@/%@%@", @"/v1/catalog", v6, @"/songs", v13, @"/syllable-lyrics"];

    uint64_t v15 = (void *)MEMORY[0x1E4F29088];
    id v16 = MusicURLWithPathUsingURLBag(v14, v5, 0);
    uint64_t v17 = [v15 componentsWithURL:v16 resolvingAgainstBaseURL:1];

    uint64_t v18 = MusicURLQueryItemLanguageWithURLBag(v5);
    if (v18)
    {
      v19 = [v17 queryItems];
      v20 = v19;
      if (!v19) {
        v19 = (void *)MEMORY[0x1E4F1CBF0];
      }
      v21 = [v19 arrayByAddingObject:v18];
      [v17 setQueryItems:v21];
    }
    v22 = [v17 URL];
  }
  else
  {
    id v14 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_ERROR, "countryCode not found in bag", buf, 2u);
    }
    v22 = 0;
  }

  return v22;
}

+ (BOOL)supportsLyricsForURLBag:(id)a3
{
  dispatch_queue_t v3 = [a1 _lyricsURLForURLBag:a3 identifier:0];
  BOOL v4 = v3 != 0;

  return v4;
}

@end