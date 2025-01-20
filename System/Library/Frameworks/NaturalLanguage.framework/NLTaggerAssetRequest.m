@interface NLTaggerAssetRequest
+ (void)checkAssetRequests;
- (BOOL)isFulfilled;
- (NLTaggerAssetRequest)initWithLanguage:(id)a3 tagScheme:(id)a4 completionHandler:(id)a5;
- (void)completeWithResult:(int64_t)a3 error:(id)a4;
- (void)waitForFulfillment;
@end

@implementation NLTaggerAssetRequest

+ (void)checkAssetRequests
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (_assetRequestQueue) {
    BOOL v2 = _assetRequests == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__1;
    v16 = __Block_byref_object_dispose__1;
    id v17 = [MEMORY[0x1E4F1CA48] array];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__NLTaggerAssetRequest_checkAssetRequests__block_invoke;
    block[3] = &unk_1E5C53CE8;
    block[4] = &v12;
    dispatch_sync((dispatch_queue_t)_assetRequestQueue, block);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v3 = (id)v13[5];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v8;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "completeWithResult:error:", 0, 0, (void)v7);
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v18 count:16];
      }
      while (v4);
    }

    _Block_object_dispose(&v12, 8);
  }
}

uint64_t __42__NLTaggerAssetRequest_checkAssetRequests__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)_assetRequests;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "isFulfilled", (void)v9)) {
          [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  return [(id)_assetRequests removeObjectsInArray:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

- (NLTaggerAssetRequest)initWithLanguage:(id)a3 tagScheme:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v12 = v11;
  v13 = 0;
  if (v9 && v10 && v11)
  {
    v19.receiver = self;
    v19.super_class = (Class)NLTaggerAssetRequest;
    uint64_t v14 = [(NLTaggerAssetRequest *)&v19 init];
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_language, a3);
      objc_storeStrong((id *)&v15->_tagScheme, a4);
      uint64_t v16 = MEMORY[0x1AD0BBB20](v12);
      id completionHandler = v15->_completionHandler;
      v15->_id completionHandler = (id)v16;
    }
    self = v15;
    v13 = self;
  }

  return v13;
}

- (BOOL)isFulfilled
{
  id v2 = self;
  uint64_t v3 = +[NLTagger availableTagSchemesForLanguage:self->_language];
  LOBYTE(v2) = [v3 containsObject:v2->_tagScheme];

  return (char)v2;
}

- (void)completeWithResult:(int64_t)a3 error:(id)a4
{
}

- (void)waitForFulfillment
{
  if (waitForFulfillment_onceToken != -1) {
    dispatch_once(&waitForFulfillment_onceToken, &__block_literal_global_139);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__NLTaggerAssetRequest_waitForFulfillment__block_invoke_2;
  block[3] = &unk_1E5C53888;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)_assetRequestQueue, block);
}

uint64_t __42__NLTaggerAssetRequest_waitForFulfillment__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.NaturalLanguage.AssetRequest", 0);
  v1 = (void *)_assetRequestQueue;
  _assetRequestQueue = (uint64_t)v0;

  _assetRequests = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);

  return MEMORY[0x1F41817F8]();
}

uint64_t __42__NLTaggerAssetRequest_waitForFulfillment__block_invoke_2(uint64_t a1)
{
  return [(id)_assetRequests addObject:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_tagScheme, 0);

  objc_storeStrong((id *)&self->_language, 0);
}

@end