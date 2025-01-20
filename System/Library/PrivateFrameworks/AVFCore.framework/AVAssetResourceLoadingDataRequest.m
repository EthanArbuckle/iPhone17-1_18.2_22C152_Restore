@interface AVAssetResourceLoadingDataRequest
- (AVAssetResourceLoadingDataRequest)init;
- (AVAssetResourceLoadingDataRequest)initWithLoadingRequest:(id)a3 requestedOffset:(int64_t)a4 requestedLength:(int64_t)a5 requestsAllDataToEndOfResource:(BOOL)a6 canSupplyIncrementalDataImmediately:(BOOL)a7;
- (BOOL)requestsAllDataToEndOfResource;
- (NSInteger)requestedLength;
- (__CFDictionary)_requestInfo;
- (id)_loadingRequest;
- (id)description;
- (uint64_t)currentOffset;
- (uint64_t)requestedOffset;
- (void)dealloc;
- (void)respondWithData:(NSData *)data;
@end

@implementation AVAssetResourceLoadingDataRequest

- (AVAssetResourceLoadingDataRequest)init
{
  return [(AVAssetResourceLoadingDataRequest *)self initWithLoadingRequest:0 requestedOffset:0 requestedLength:0 requestsAllDataToEndOfResource:0 canSupplyIncrementalDataImmediately:0];
}

- (AVAssetResourceLoadingDataRequest)initWithLoadingRequest:(id)a3 requestedOffset:(int64_t)a4 requestedLength:(int64_t)a5 requestsAllDataToEndOfResource:(BOOL)a6 canSupplyIncrementalDataImmediately:(BOOL)a7
{
  v15.receiver = self;
  v15.super_class = (Class)AVAssetResourceLoadingDataRequest;
  v12 = [(AVAssetResourceLoadingDataRequest *)&v15 init];
  if (v12)
  {
    if (a3
      && (v13 = objc_alloc_init(AVAssetResourceLoadingDataRequestInternal),
          (v12->_dataRequest = v13) != 0))
    {
      v12->_dataRequest->weakReferenceToLoadingRequest = (AVWeakReference *)(id)[a3 _weakReference];
      v12->_dataRequest->requestedOffset = a4;
      v12->_dataRequest->requestedLength = a5;
      v12->_dataRequest->currentOffset = a4;
      v12->_dataRequest->dataResponseQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avassetresourceloadingdatarequest");
      v12->_dataRequest->requestsAllDataToEndOfResource = a6;
      v12->_dataRequest->canSupplyIncrementalDataImmediately = a7;
      CFRetain(v12->_dataRequest);
    }
    else
    {

      return 0;
    }
  }
  return v12;
}

- (void)dealloc
{
  dataRequest = self->_dataRequest;
  if (dataRequest)
  {

    v4 = (dispatch_object_t *)self->_dataRequest;
    if (v4[4])
    {
      dispatch_release(v4[4]);
      v4 = (dispatch_object_t *)self->_dataRequest;
    }
    CFRelease(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAssetResourceLoadingDataRequest;
  [(AVAssetResourceLoadingDataRequest *)&v5 dealloc];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  uint64_t v6 = [(AVAssetResourceLoadingDataRequest *)self requestedOffset];
  NSInteger v7 = [(AVAssetResourceLoadingDataRequest *)self requestedLength];
  if ([(AVAssetResourceLoadingDataRequest *)self requestsAllDataToEndOfResource]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"<%@: %p, requested offset = %lld, requested length = %lld, requests all data to end of resource = %@, current offset = %lld>", v5, self, v6, v7, v8, -[AVAssetResourceLoadingDataRequest currentOffset](self, "currentOffset")];
}

- (uint64_t)requestedOffset
{
  return self->_dataRequest->requestedOffset;
}

- (NSInteger)requestedLength
{
  return self->_dataRequest->requestedLength;
}

- (BOOL)requestsAllDataToEndOfResource
{
  return self->_dataRequest->requestsAllDataToEndOfResource;
}

- (uint64_t)currentOffset
{
  uint64_t v6 = 0;
  NSInteger v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dataResponseQueue = self->_dataRequest->dataResponseQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__AVAssetResourceLoadingDataRequest_currentOffset__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(dataResponseQueue, v5);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__AVAssetResourceLoadingDataRequest_currentOffset__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 24);
  return result;
}

- (id)_loadingRequest
{
  return [(AVWeakReference *)self->_dataRequest->weakReferenceToLoadingRequest referencedObject];
}

- (__CFDictionary)_requestInfo
{
  id v2 = [(AVAssetResourceLoadingDataRequest *)self _loadingRequest];
  return (__CFDictionary *)[v2 _requestInfo];
}

- (void)respondWithData:(NSData *)data
{
  NSUInteger v5 = [(NSData *)data length];
  if (v5)
  {
    NSUInteger v6 = v5;
    BOOL canSupplyIncrementalDataImmediately = self->_dataRequest->canSupplyIncrementalDataImmediately;
    id v8 = [(AVAssetResourceLoadingDataRequest *)self _loadingRequest];
    if (canSupplyIncrementalDataImmediately) {
      [v8 _sendDataToCustomURLHandler:data];
    }
    else {
      [v8 _appendToCachedData:data];
    }
    dataResponseQueue = self->_dataRequest->dataResponseQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__AVAssetResourceLoadingDataRequest_respondWithData___block_invoke;
    v10[3] = &unk_1E57B2228;
    v10[4] = self;
    v10[5] = v6;
    av_readwrite_dispatch_queue_write(dataResponseQueue, v10);
  }
}

uint64_t __53__AVAssetResourceLoadingDataRequest_respondWithData___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += *(void *)(result + 40);
  return result;
}

@end