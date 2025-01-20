@interface MPRequest
+ (Class)responseClass;
+ (double)expectedMaximumResponseTimeInterval;
- (MPRequest)init;
- (NSArray)middlewareClasses;
- (NSError)cancelationError;
- (NSOperationQueue)calloutQueue;
- (NSOperationQueue)queue;
- (NSString)description;
- (NSString)label;
- (OS_dispatch_queue)cleanupQueue;
- (double)timeoutInterval;
- (id)_stateDumpObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)performWithCompletion:(id)a3;
- (int64_t)qualityOfService;
- (void)_performWithCompletion:(id)a3;
- (void)cancel;
- (void)prepareForResponseWithCompletion:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMiddlewareClasses:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setTimeoutInterval:(double)a3;
@end

@implementation MPRequest

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(MPRequest *)self label];
  v6 = (void *)[v5 copy];
  [v4 setLabel:v6];

  v7 = [(MPRequest *)self middlewareClasses];
  v8 = (void *)[v7 copy];
  [v4 setMiddlewareClasses:v8];

  objc_msgSend(v4, "setQualityOfService:", -[MPRequest qualityOfService](self, "qualityOfService"));
  [(MPRequest *)self timeoutInterval];
  objc_msgSend(v4, "setTimeoutInterval:");
  return v4;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MPRequest *)self label];
  v6 = [v3 stringWithFormat:@"<%@: %p label=%@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSString)label
{
  return self->_label;
}

- (MPRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPRequest;
  result = [(MPRequest *)&v3 init];
  if (result) {
    result->_qualityOfService = -1;
  }
  return result;
}

- (void)setLabel:(id)a3
{
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (void)setMiddlewareClasses:(id)a3
{
}

- (id)performWithCompletion:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)[(MPRequest *)self copy];
  v7 = [MEMORY[0x1E4F1C9C8] date];
  v8 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v50 = v6;
    __int16 v51 = 2114;
    v52 = self;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_INFO, "START Request: %{public}@ aka [%{public}@]", buf, 0x16u);
  }

  id v9 = [NSString stringWithFormat:@"com.apple.MediaPlaybackCore/%@.cleanup", objc_opt_class()];
  v10 = (const char *)[v9 UTF8String];
  v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
  v13 = (void *)v6[6];
  v6[6] = v12;

  [(id)objc_opt_class() expectedMaximumResponseTimeInterval];
  double v15 = v14;
  [(MPRequest *)self timeoutInterval];
  v16 = 0;
  if (v15 >= v17)
  {
    v18 = [v6 cleanupQueue];
    v19 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v18);

    dispatch_time_t v20 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
    dispatch_source_set_timer(v19, v20, 0x3B9ACA00uLL, 0x3B9ACA00uLL);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __35__MPRequest_performWithCompletion___block_invoke;
    handler[3] = &unk_1E57F9F98;
    v16 = v19;
    v47 = v16;
    v48 = v6;
    dispatch_source_set_event_handler(v16, handler);
    dispatch_resume(v16);
  }
  [(MPRequest *)self timeoutInterval];
  if (v21 <= 0.0)
  {
    v26 = 0;
  }
  else
  {
    v22 = dispatch_get_global_queue(17, 0);
    v23 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v22);

    [(MPRequest *)self timeoutInterval];
    dispatch_time_t v25 = dispatch_time(0, (uint64_t)(v24 * 1000000000.0));
    dispatch_source_set_timer(v23, v25, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __35__MPRequest_performWithCompletion___block_invoke_82;
    v42[3] = &unk_1E57FA038;
    v26 = v23;
    v43 = v26;
    v44 = self;
    v45 = v6;
    dispatch_source_set_event_handler(v26, v42);
    dispatch_resume(v26);
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __35__MPRequest_performWithCompletion___block_invoke_84;
  v35[3] = &unk_1E57EDB50;
  id v40 = v5;
  SEL v41 = a2;
  v35[4] = self;
  v27 = v6;
  id v36 = v27;
  v37 = v16;
  v38 = v26;
  v39 = v7;
  id v28 = v7;
  v29 = v26;
  v30 = v16;
  id v31 = v5;
  [v27 prepareForResponseWithCompletion:v35];
  v32 = v39;
  v33 = v27;

  return v33;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

void __35__MPRequest_performWithCompletion___block_invoke_84(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    objc_super v3 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    v3();
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x1E4F77968]);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __35__MPRequest_performWithCompletion___block_invoke_2;
    v17[3] = &unk_1E57F1F98;
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    uint64_t v20 = *(void *)(a1 + 80);
    v17[4] = v5;
    id v18 = v6;
    id v19 = *(id *)(a1 + 72);
    v7 = (void *)[v4 initWithDeallocHandler:v17];
    v8 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __35__MPRequest_performWithCompletion___block_invoke_3;
    v10[3] = &unk_1E57EDB28;
    id v11 = v8;
    id v12 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 64);
    id v15 = v7;
    id v16 = *(id *)(a1 + 72);
    id v9 = v7;
    [v11 _performWithCompletion:v10];
  }
}

- (void)prepareForResponseWithCompletion:(id)a3
{
}

- (OS_dispatch_queue)cleanupQueue
{
  return self->_cleanupQueue;
}

+ (double)expectedMaximumResponseTimeInterval
{
  return 3.0;
}

- (void)_performWithCompletion:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
  queue = self->_queue;
  self->_queue = v5;

  v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
  calloutQueue = self->_calloutQueue;
  self->_calloutQueue = v7;

  if (self->_qualityOfService)
  {
    -[NSOperationQueue setQualityOfService:](self->_queue, "setQualityOfService:");
    [(NSOperationQueue *)self->_calloutQueue setQualityOfService:self->_qualityOfService];
  }
  id v9 = [NSString stringWithFormat:@"com.apple.MediaPlaybackCore/%@", objc_opt_class()];
  [(NSOperationQueue *)self->_queue setName:v9];

  v10 = [NSString stringWithFormat:@"com.apple.MediaPlaybackCore/%@.callout", objc_opt_class()];
  [(NSOperationQueue *)self->_calloutQueue setName:v10];

  id v11 = +[MPMiddlewareOperationMap mapForRequest:self];
  id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v13 = dispatch_queue_create("com.apple.MPRequest.invalidationQueue", v12);

  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__408;
  v57[4] = __Block_byref_object_dispose__409;
  id v58 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  char v56 = 0;
  id v14 = (void *)MEMORY[0x1E4F28B48];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __36__MPRequest__performWithCompletion___block_invoke;
  v49[3] = &unk_1E57F28E8;
  id v33 = v4;
  id v52 = v33;
  v49[4] = self;
  id v15 = v11;
  id v50 = v15;
  v34 = v13;
  __int16 v51 = v34;
  uint64_t v53 = v57;
  v54 = v55;
  id v16 = [v14 blockOperationWithBlock:v49];
  v32 = v15;
  double v17 = [v15 allOperations];
  id v18 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    id v19 = [v17 valueForKeyPath:@"class.description"];
    uint64_t v20 = [v19 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138543362;
    v61 = v20;
    _os_log_impl(&dword_1952E8000, v18, OS_LOG_TYPE_DEBUG, "MIDDLEWARE: [%{public}@]", buf, 0xCu);
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v17;
  uint64_t v21 = [obj countByEnumeratingWithState:&v45 objects:v59 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v46 != v22) {
          objc_enumerationMutation(obj);
        }
        double v24 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if ([v24 conformsToProtocol:&unk_1EE71B3D8])
        {
          id v25 = v24;
          v26 = (objc_class *)objc_opt_class();
          v27 = NSStringFromClass(v26);
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __36__MPRequest__performWithCompletion___block_invoke_113;
          v39[3] = &unk_1E57EDBA0;
          v43 = v55;
          id v28 = v27;
          id v40 = v28;
          SEL v41 = self;
          v42 = v34;
          v44 = v57;
          [v25 setInvalidationHandler:v39];
        }
        objc_msgSend(v24, "setQualityOfService:", -[MPRequest qualityOfService](self, "qualityOfService"));
        [v16 addDependency:v24];
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v45 objects:v59 count:16];
    }
    while (v21);
  }

  cleanupQueue = self->_cleanupQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MPRequest__performWithCompletion___block_invoke_2_116;
  block[3] = &unk_1E57FA038;
  block[4] = self;
  id v37 = obj;
  id v38 = v16;
  id v30 = v16;
  id v31 = obj;
  dispatch_sync(cleanupQueue, block);

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

void __36__MPRequest__performWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __36__MPRequest__performWithCompletion___block_invoke_2;
  v44[3] = &unk_1E57EDB78;
  id v2 = *(id *)(a1 + 56);
  uint64_t v31 = a1;
  v44[4] = *(void *)(a1 + 32);
  id v45 = v2;
  v27 = (void (**)(void, void))MEMORY[0x19971E0F0](v44);
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    v27[2](v27, 0);
  }
  else
  {
    id v3 = objc_alloc((Class)[(id)objc_opt_class() responseClass]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) allMiddleware];
    id val = (id)[v3 initWithRequest:v4 middleware:v5];

    objc_initWeak(&location, val);
    v6 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__MPRequest__performWithCompletion___block_invoke_4;
    block[3] = &unk_1E57FA328;
    block[4] = *(void *)(a1 + 64);
    double v24 = &v42;
    objc_copyWeak(&v42, &location);
    dispatch_sync(v6, block);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      v7 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v49 = v8;
        _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_INFO, "INVALIDATE: Response invalid before completion. Request: %{public}@", buf, 0xCu);
      }

      objc_msgSend(val, "invalidate", &v42);
    }
    id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v24);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v10 = [*(id *)(a1 + 40) allMiddleware];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v11)
    {
      id obj = v10;
      uint64_t v29 = *(void *)v38;
      do
      {
        uint64_t v30 = v11;
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v38 != v29) {
            objc_enumerationMutation(obj);
          }
          v32 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          dispatch_queue_t v13 = [MEMORY[0x1E4F1CA48] array];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v14 = [*(id *)(v31 + 40) operationsForMiddleware:v32];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v46 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v34;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v34 != v16) {
                  objc_enumerationMutation(v14);
                }
                id v18 = *(void **)(*((void *)&v33 + 1) + 8 * j);
                if ([v18 conformsToProtocol:&unk_1EE71B3D8])
                {
                  id v19 = v18;
                  uint64_t v20 = [v19 invalidationObservers];
                  [v13 addObjectsFromArray:v20];

                  uint64_t v21 = [v19 error];
                  LOBYTE(v20) = v21 == 0;

                  if ((v20 & 1) == 0)
                  {
                    uint64_t v22 = [v19 error];
                    [v9 addObject:v22];
                  }
                }
              }
              uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v46 count:16];
            }
            while (v15);
          }

          if ([v13 count]) {
            [v32 setInvalidationObservers:v13];
          }
        }
        v10 = obj;
        uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
      }
      while (v11);
    }

    if ([v9 count])
    {
      v23 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingErrors:debugDescription:", @"MPRequestErrorDomain", 1, v9, @"Errors found in middleware operations");
      ((void (*)(void (**)(void, void), void, void *))v27[2])(v27, 0, v23);
    }
    else
    {
      ((void (*)(void (**)(void, void), id, void))v27[2])(v27, val, 0);
    }

    objc_destroyWeak(v25);
    objc_destroyWeak(&location);
  }
}

void __36__MPRequest__performWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MPRequest__performWithCompletion___block_invoke_3;
  block[3] = &unk_1E57F9EA8;
  block[4] = v2;
  dispatch_sync(v3, block);
}

void __35__MPRequest_performWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(a1 + 40);
  if (v8) {
    dispatch_source_cancel(v8);
  }
  id v9 = *(NSObject **)(a1 + 48);
  if (v9) {
    dispatch_source_cancel(v9);
  }
  [*(id *)(a1 + 56) timeIntervalSinceNow];
  if (v10 >= 0.0) {
    double v11 = v10;
  }
  else {
    double v11 = -v10;
  }
  id v12 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  dispatch_queue_t v13 = v12;
  if (v6)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = objc_msgSend(v6, "msv_description");
      int v17 = 138544130;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      id v20 = v5;
      __int16 v21 = 2048;
      double v22 = v11;
      __int16 v23 = 2114;
      double v24 = v15;
      _os_log_impl(&dword_1952E8000, v13, OS_LOG_TYPE_ERROR, "FINISH Request: %{public}@ Response: %{public}@ [%fs] error=%{public}@", (uint8_t *)&v17, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    int v17 = 138543874;
    uint64_t v18 = v16;
    __int16 v19 = 2114;
    id v20 = v5;
    __int16 v21 = 2048;
    double v22 = v11;
    _os_log_impl(&dword_1952E8000, v13, OS_LOG_TYPE_INFO, "FINISH Request: %{public}@ Response: %{public}@ [%fs]", (uint8_t *)&v17, 0x20u);
  }

  [*(id *)(a1 + 64) disarm];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

uint64_t __36__MPRequest__performWithCompletion___block_invoke_114(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __36__MPRequest__performWithCompletion___block_invoke_2_116(void *a1)
{
  [*(id *)(a1[4] + 56) addOperations:a1[5] waitUntilFinished:0];
  uint64_t v2 = *(void **)(a1[4] + 32);
  uint64_t v3 = a1[6];

  return [v2 addOperation:v3];
}

void __36__MPRequest__performWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;
}

uint64_t __19__MPRequest_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) cancelAllOperations];
}

void __36__MPRequest__performWithCompletion___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void __36__MPRequest__performWithCompletion___block_invoke_4(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__MPRequest__performWithCompletion___block_invoke_5;
  v5[3] = &unk_1E57F6EF0;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  uint64_t v2 = MEMORY[0x19971E0F0](v5);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  objc_destroyWeak(&v6);
}

void __36__MPRequest__performWithCompletion___block_invoke_113(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
  id v5 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = a1[4];
      uint64_t v8 = a1[5];
      *(_DWORD *)buf = 138543874;
      uint64_t v17 = v7;
      __int16 v18 = 2114;
      id v19 = v3;
      __int16 v20 = 2114;
      uint64_t v21 = v8;
      id v9 = "INVALIDATE: Middleware: %{public}@ [%{public}@, but already invalid] request: %{public}@";
      double v10 = v6;
      os_log_type_t v11 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_1952E8000, v10, v11, v9, buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = a1[4];
    uint64_t v13 = a1[5];
    *(_DWORD *)buf = 138543874;
    uint64_t v17 = v12;
    __int16 v18 = 2114;
    id v19 = v3;
    __int16 v20 = 2114;
    uint64_t v21 = v13;
    id v9 = "INVALIDATE: Middleware: %{public}@ [%{public}@] request: %{public}@";
    double v10 = v6;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }

  uint64_t v14 = a1[6];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MPRequest__performWithCompletion___block_invoke_114;
  block[3] = &unk_1E57FA300;
  block[4] = a1[8];
  dispatch_sync(v14, block);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_middlewareClasses, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cleanupQueue, 0);
  objc_storeStrong((id *)&self->_cancelationError, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (void)cancel
{
  cleanupQueue = self->_cleanupQueue;
  if (cleanupQueue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __19__MPRequest_cancel__block_invoke;
    block[3] = &unk_1E57F9EA8;
    block[4] = self;
    dispatch_sync(cleanupQueue, block);
  }
}

- (NSArray)middlewareClasses
{
  return self->_middlewareClasses;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (NSError)cancelationError
{
  return self->_cancelationError;
}

- (NSOperationQueue)calloutQueue
{
  return self->_calloutQueue;
}

- (id)_stateDumpObject
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = @"label";
  uint64_t v2 = [(MPRequest *)self label];
  id v3 = (void *)v2;
  int v4 = @"<NULL>";
  if (v2) {
    int v4 = (__CFString *)v2;
  }
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

void __35__MPRequest_performWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  uint64_t v28 = a1;
  uint64_t v2 = [*(id *)(a1 + 40) queue];
  id v3 = [v2 operations];

  int v4 = os_log_create("com.apple.amp.mediaplayer", "Middleware_Oversize");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [v3 valueForKeyPath:@"class.description"];
    uint64_t v7 = [v6 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138543618;
    uint64_t v36 = v5;
    __int16 v37 = 2114;
    long long v38 = v7;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "TIMEOUT Request: %{public}@ timing out. Remaining operations: [%{public}@]", buf, 0x16u);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v31;
    uint64_t v13 = &selRef___MPModelStoreBrowseSectionPropertyUniformContentItemType__MAPPING_MISSING__;
    uint64_t v14 = "com.apple.amp.mediaplayer";
    uint64_t v15 = "Middleware_Oversize";
    *(void *)&long long v10 = 138543618;
    long long v27 = v10;
    do
    {
      uint64_t v16 = 0;
      uint64_t v29 = v11;
      do
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v17 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
        if (objc_msgSend(v17, "conformsToProtocol:", v13[429], v27))
        {
          id v18 = v17;
          if (objc_opt_respondsToSelector())
          {
            id v19 = os_log_create(v14, v15);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v20 = v12;
              uint64_t v21 = v15;
              uint64_t v22 = v13;
              id v23 = v8;
              double v24 = v14;
              uint64_t v25 = *(void *)(v28 + 40);
              v26 = [v18 timeoutDescription];
              *(_DWORD *)buf = v27;
              uint64_t v36 = v25;
              uint64_t v14 = v24;
              id v8 = v23;
              uint64_t v13 = v22;
              uint64_t v15 = v21;
              uint64_t v12 = v20;
              uint64_t v11 = v29;
              __int16 v37 = 2114;
              long long v38 = v26;
              _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_DEFAULT, "TIMEOUT Request: %{public}@ Operation: %{public}@", buf, 0x16u);
            }
          }
        }
        ++v16;
      }
      while (v11 != v16);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v11);
  }
}

uint64_t __35__MPRequest_performWithCompletion___block_invoke_82(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v8 = 138543362;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "TIMEOUT Request: %{public}@ timing out.", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPRequestErrorDomain" code:2 userInfo:0];
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return [*(id *)(a1 + 48) cancel];
}

void __35__MPRequest_performWithCompletion___block_invoke_2(void *a1)
{
  if (MSVDeviceOSIsInternalInstall())
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:a1[7], a1[4], @"MPRequest.m", 105, @"-[MPRequest _performWithCompletion: failed to call completion %@", a1[5] object file lineNumber description];
  }
  uint64_t v2 = a1[6];
  id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPRequestErrorDomain" code:2 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v4);
}

+ (Class)responseClass
{
  uint64_t v4 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  if (v4 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, a1, @"MPRequest.m", 26, @"Subclass %@ must implement -%@ defined in %@.", v8, v9, @"[MPRequest class]" object file lineNumber description];
  }

  return (Class)objc_opt_class();
}

@end