@interface ResourceLoader
+ (id)_localDateFormatter;
+ (id)_rfc1123DateFormatter;
- (NSOperationQueue)queue;
- (NSURLCache)urlCache;
- (NSURLSession)session;
- (ResourceLoader)init;
- (double)_simulatedLatency;
- (void)asynchronousDataFromURL:(id)a3 completionBlock:(id)a4;
- (void)flushCache;
- (void)refreshCacheForRequest:(id)a3 usingCachedResponse:(id)a4 completionBlock:(id)a5;
- (void)setQueue:(id)a3;
- (void)setSession:(id)a3;
- (void)setUrlCache:(id)a3;
@end

@implementation ResourceLoader

+ (id)_rfc1123DateFormatter
{
  if (_rfc1123DateFormatter_onceToken != -1) {
    dispatch_once(&_rfc1123DateFormatter_onceToken, &__block_literal_global_30);
  }
  v2 = (void *)_rfc1123DateFormatter_formatter;
  return v2;
}

void __39__ResourceLoader__rfc1123DateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)_rfc1123DateFormatter_formatter;
  _rfc1123DateFormatter_formatter = (uint64_t)v0;

  [(id)_rfc1123DateFormatter_formatter setDateFormat:@"EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'"];
  id v2 = [MEMORY[0x263EFFA18] timeZoneWithName:@"GMT"];
  [(id)_rfc1123DateFormatter_formatter setTimeZone:v2];
}

+ (id)_localDateFormatter
{
  id v2 = (void *)_localDateFormatter_formatter;
  if (!_localDateFormatter_formatter)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F08790]);
    v4 = (void *)_localDateFormatter_formatter;
    _localDateFormatter_formatter = (uint64_t)v3;

    v5 = [MEMORY[0x263EFFA18] systemTimeZone];
    [(id)_localDateFormatter_formatter setTimeZone:v5];

    [(id)_localDateFormatter_formatter setDateStyle:1];
    [(id)_localDateFormatter_formatter setTimeStyle:2];
    id v2 = (void *)_localDateFormatter_formatter;
  }
  return v2;
}

- (ResourceLoader)init
{
  v13.receiver = self;
  v13.super_class = (Class)ResourceLoader;
  id v2 = [(ResourceLoader *)&v13 init];
  if (v2)
  {
    id v3 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    v4 = [&stru_26D197018 stringByAppendingPathComponent:@"DeviceImages"];
    v5 = (void *)[objc_alloc(MEMORY[0x263F08B98]) initWithMemoryCapacity:0x400000 diskCapacity:52428800 diskPath:v4];
    [(ResourceLoader *)v2 setUrlCache:v5];

    id v6 = objc_alloc_init(MEMORY[0x263F08A48]);
    [(ResourceLoader *)v2 setQueue:v6];

    v7 = [(ResourceLoader *)v2 queue];
    [v7 setQualityOfService:25];

    v8 = [(ResourceLoader *)v2 urlCache];
    [v3 setURLCache:v8];

    v9 = (void *)MEMORY[0x263F08BF8];
    v10 = [(ResourceLoader *)v2 queue];
    v11 = [v9 sessionWithConfiguration:v3 delegate:v2 delegateQueue:v10];
    [(ResourceLoader *)v2 setSession:v11];
  }
  return v2;
}

- (void)refreshCacheForRequest:(id)a3 usingCachedResponse:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)MEMORY[0x263EFFA40];
  id v11 = a4;
  v12 = [v10 standardUserDefaults];
  int v13 = [v12 BOOLForKey:@"verboseNetworking"];

  v14 = [v11 response];

  v15 = [v14 allHeaderFields];

  v16 = (void *)MEMORY[0x263F089E0];
  v17 = [v8 URL];
  [v8 timeoutInterval];
  v18 = objc_msgSend(v16, "requestWithURL:cachePolicy:timeoutInterval:", v17, 0);

  v19 = [v15 objectForKeyedSubscript:@"Last-Modified"];
  uint64_t v20 = [v15 objectForKeyedSubscript:@"Etag"];
  v21 = (void *)v20;
  if (v11 && v19 && v20)
  {
    [v18 setValue:v19 forHTTPHeaderField:@"If-Modified-Since"];
    [v18 setValue:v21 forHTTPHeaderField:@"If-None-Match"];
  }
  if (v13)
  {
    v22 = (void *)MEMORY[0x263F089D8];
    v23 = [v18 URL];
    v24 = [v22 stringWithFormat:@"%@ GET %@\n", self, v23];

    v25 = [v8 allHTTPHeaderFields];

    if (v25)
    {
      v26 = [v8 allHTTPHeaderFields];
      v27 = [v26 description];
      [v24 appendString:v27];
    }
  }
  v28 = [(ResourceLoader *)self session];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __77__ResourceLoader_refreshCacheForRequest_usingCachedResponse_completionBlock___block_invoke;
  v32[3] = &unk_26453BAB0;
  v32[4] = self;
  id v33 = v18;
  id v34 = v9;
  id v29 = v9;
  id v30 = v18;
  v31 = [v28 dataTaskWithRequest:v30 completionHandler:v32];

  [v31 resume];
}

void __77__ResourceLoader_refreshCacheForRequest_usingCachedResponse_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  [*(id *)(a1 + 32) _simulatedLatency];
  double v11 = v10;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v8;
    uint64_t v13 = [v12 statusCode];
  }
  else
  {
    uint64_t v13 = 0;
    id v12 = 0;
  }
  v14 = [MEMORY[0x263EFF9A0] dictionaryWithObject:*(void *)(a1 + 40) forKey:@"request"];
  v15 = v14;
  if (v8) {
    [v14 setObject:v8 forKeyedSubscript:ResourceLoaderPayloadResponseKey];
  }
  if (v9) {
    [v15 setObject:v9 forKeyedSubscript:ResourceLoaderPayloadErrorKey];
  }
  uint64_t v16 = [v12 statusCode];
  if (v7 && v16 == 200) {
    [v15 setObject:v7 forKeyedSubscript:ResourceLoaderPayloadDataKey];
  }
  if (v13 != 200 && v13 != 304)
  {
    v17 = [MEMORY[0x263F087E8] errorWithDomain:ResourceLoaderErrorDomain code:v13 userInfo:0];
    if (!v9) {
      [v15 setObject:v17 forKeyedSubscript:ResourceLoaderPayloadErrorKey];
    }
  }
  if (v11 <= 0.0)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
    v19 = dispatch_get_global_queue(0, 0);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __77__ResourceLoader_refreshCacheForRequest_usingCachedResponse_completionBlock___block_invoke_2;
    v20[3] = &unk_26453A5E8;
    id v22 = *(id *)(a1 + 48);
    id v21 = v15;
    dispatch_after(v18, v19, v20);
  }
}

uint64_t __77__ResourceLoader_refreshCacheForRequest_usingCachedResponse_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)asynchronousDataFromURL:(id)a3 completionBlock:(id)a4
{
  v40[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, uint64_t))a4;
  if (![v6 isFileURL])
  {
    double v10 = [(ResourceLoader *)self urlCache];
    double v11 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v6 cachePolicy:0 timeoutInterval:120.0];
    id v12 = [v10 cachedResponseForRequest:v11];
    v32 = [v12 response];
    uint64_t v13 = [v32 allHeaderFields];
    v14 = [v13 objectForKeyedSubscript:@"Expires"];
    if ([v14 length])
    {
      v15 = +[ResourceLoader _rfc1123DateFormatter];
      uint64_t v16 = [v15 dateFromString:v14];

      v17 = v16;
      if (v16)
      {
        [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
        double v19 = v18;
        [v16 timeIntervalSinceReferenceDate];
        BOOL v21 = v19 > v20;
        if (!v7) {
          goto LABEL_13;
        }
        goto LABEL_9;
      }
    }
    else
    {
      v17 = 0;
    }
    BOOL v21 = 1;
    if (!v7)
    {
LABEL_13:

      goto LABEL_14;
    }
LABEL_9:
    v31 = v17;
    id v22 = [v12 data];

    if (v22)
    {
      uint64_t v37 = ResourceLoaderPayloadDataKey;
      v23 = [v12 data];
      v38 = v23;
      [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      id v30 = v12;
      v24 = v13;
      v25 = v14;
      v26 = self;
      v28 = BOOL v27 = v21;

      v7[2](v7, v28, 1);
      BOOL v21 = v27;
      self = v26;
      v14 = v25;
      uint64_t v13 = v24;
      id v12 = v30;
    }
    v17 = v31;
    if (v21)
    {
      id v29 = [(ResourceLoader *)self queue];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __58__ResourceLoader_asynchronousDataFromURL_completionBlock___block_invoke;
      v33[3] = &unk_26453ACB8;
      v33[4] = self;
      id v34 = v11;
      id v35 = v12;
      v36 = v7;
      [v29 addOperationWithBlock:v33];

      v17 = v31;
    }
    goto LABEL_13;
  }
  id v8 = (void *)MEMORY[0x263EFF8F8];
  id v9 = [v6 path];
  double v10 = [v8 dataWithContentsOfFile:v9];

  uint64_t v39 = ResourceLoaderPayloadDataKey;
  v40[0] = v10;
  double v11 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
  v7[2](v7, v11, 1);
LABEL_14:
}

void __58__ResourceLoader_asynchronousDataFromURL_completionBlock___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__ResourceLoader_asynchronousDataFromURL_completionBlock___block_invoke_2;
  v4[3] = &unk_26453BAD8;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 refreshCacheForRequest:v2 usingCachedResponse:v3 completionBlock:v4];
}

uint64_t __58__ResourceLoader_asynchronousDataFromURL_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)flushCache
{
  id v2 = [(ResourceLoader *)self urlCache];
  [v2 removeAllCachedResponses];
}

- (double)_simulatedLatency
{
  if (_simulatedLatency_onceToken != -1) {
    dispatch_once(&_simulatedLatency_onceToken, &__block_literal_global_65);
  }
  return *(double *)&_simulatedLatency_retValue;
}

void __35__ResourceLoader__simulatedLatency__block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v3 = [v0 objectForKey:@"ISSimulateLatency"];

  v1 = v3;
  if (v3)
  {
    [v3 doubleValue];
    v1 = v3;
    _simulatedLatency_retValue = v2;
  }
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSURLCache)urlCache
{
  return self->_urlCache;
}

- (void)setUrlCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlCache, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end