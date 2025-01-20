@interface __NSCFURLSessionConnection
- (NSCachedURLResponse)_cachedResponse;
- (__NSCFURLSessionConnection)initWithTask:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (uint64_t)_setupForCache:(uint64_t)result expectedLength:(uint64_t)a2 response:(void *)a3;
- (uint64_t)_storeCachedResponse:(uint64_t)result;
- (void)_appendDataToCache:(uint64_t)a1;
- (void)_tossCache;
- (void)dealloc;
- (void)setIsDownload:(BOOL)a3;
- (void)withWorkQueueAsync:(dispatch_queue_t *)a1;
@end

@implementation __NSCFURLSessionConnection

- (void)withWorkQueueAsync:(dispatch_queue_t *)a1
{
  if (a1)
  {
    objc_msgSend(objc_getProperty(a1, a2, 8, 1), "_qos");
    objc_msgSend(objc_getProperty(a1, v3, 8, 1), "_voucher");
    v4 = (void *)dispatch_block_create_with_voucher_and_qos_class();
    dispatch_async(a1[2], v4);
    _Block_release(v4);
  }
}

- (void)_appendDataToCache:(uint64_t)a1
{
  if (a1)
  {
    v4 = (dispatch_object_t *)(a1 + 48);
    SEL v3 = *(NSObject **)(a1 + 48);
    if (v3)
    {
      size_t size = dispatch_data_get_size(v3);
      if (dispatch_data_get_size(a2) + size <= *(void *)(a1 + 56))
      {
        conCatData(v4, a2);
      }
      else
      {
        -[__NSCFURLSessionConnection _tossCache](a1);
      }
    }
  }
}

- (NSCachedURLResponse)_cachedResponse
{
  if (!a1) {
    return 0;
  }
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = *(int *)([v2 _inner] + 72);
    if (v3 == 2)
    {
      -[__NSCFURLSessionConnection _tossCache](a1);
      uint64_t v3 = 2;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  v4 = *(NSObject **)(a1 + 48);
  if (!v4) {
    return 0;
  }
  if (*(void *)(a1 + 40))
  {
    v5 = [[NSCachedURLResponse alloc] initWithResponse:*(void *)(a1 + 40) data:*(void *)(a1 + 48) userInfo:0 storagePolicy:v3];
    uint64_t v6 = [(NSCachedURLResponse *)v5 _CFCachedURLResponse];
    if (v6)
    {
      uint64_t v7 = *(void *)(v6 + 16);
      if (v7) {
        *(unsigned char *)(v7 + 24) = *(unsigned char *)(a1 + 32);
      }
    }

    *(void *)(a1 + 40) = 0;
    v4 = *(NSObject **)(a1 + 48);
  }
  else
  {
    v5 = 0;
  }
  dispatch_release(v4);
  *(void *)(a1 + 48) = 0;
  return v5;
}

- (void)_tossCache
{
  if (a1)
  {
    uint64_t v3 = (void *)(a1 + 48);
    v2 = *(NSObject **)(a1 + 48);
    if (v2)
    {
      dispatch_release(v2);
      *uint64_t v3 = 0;
      v3[1] = 0;

      *(void *)(a1 + 40) = 0;
    }
  }
}

- (uint64_t)_setupForCache:(uint64_t)result expectedLength:(uint64_t)a2 response:(void *)a3
{
  if (result)
  {
    uint64_t v3 = a2;
    v4 = (void *)result;
    if (*(void *)(result + 64) >= a2)
    {
      *(void *)(result + 48) = dispatch_data_create("", 0, 0, 0);
      if (v3 < 0) {
        uint64_t v3 = v4[8];
      }
      v4[7] = v3;
      result = [a3 copy];
      v4[5] = result;
    }
  }
  return result;
}

- (void)dealloc
{
  workQueue = self->_workQueue;
  if (workQueue)
  {
    dispatch_release(workQueue);
    self->_workQueue = 0;
  }
  objc_setProperty_atomic(self, v3, 0, 24);
  cacheResponse = self->_cacheResponse;
  if (cacheResponse)
  {

    self->_cacheResponse = 0;
  }
  cacheData = self->_cacheData;
  if (cacheData)
  {
    dispatch_release(cacheData);
    self->_cacheData = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)__NSCFURLSessionConnection;
  [(__NSCFURLSessionConnection *)&v7 dealloc];
}

- (uint64_t)_storeCachedResponse:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    result = objc_msgSend((id)objc_msgSend(a2, "data"), "length");
    if (result)
    {
      v4 = *(void **)(v3 + 8);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __51____NSCFURLSessionConnection__storeCachedResponse___block_invoke;
      v5[3] = &unk_1E52535D8;
      v5[4] = a2;
      v5[5] = v3;
      return [v4 _withXURLCache:v5];
    }
  }
  return result;
}

- (__NSCFURLSessionConnection)initWithTask:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)__NSCFURLSessionConnection;
  v8 = [(__NSCFURLSessionConnection *)&v12 init];
  if (v8)
  {
    v8->_task = (NSURLSessionTask *)a3;
    v8->_delegate = (__NSCFURLSessionConnectionDelegate *)a4;
    dispatch_retain((dispatch_object_t)a5);
    v8->_workQueue = (OS_dispatch_queue *)a5;
    task = v8->_task;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66____NSCFURLSessionConnection_initWithTask_delegate_delegateQueue___block_invoke;
    v11[3] = &unk_1E52535B0;
    v11[4] = v8;
    [(NSURLSessionTask *)task _withXURLCache:v11];
  }
  return v8;
}

- (void)setIsDownload:(BOOL)a3
{
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  uint64_t v3 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_184085000, v3, OS_LOG_TYPE_ERROR, "__NSCFURLSessionConnection: some sub-class failed to implement setIsDownload. File a bug!", v4, 2u);
  }
}

@end