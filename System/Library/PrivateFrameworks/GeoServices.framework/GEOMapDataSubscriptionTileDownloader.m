@interface GEOMapDataSubscriptionTileDownloader
+ (NSString)loggingDescription;
- (GEOMapDataSubscription)subscription;
- (GEOMapDataSubscriptionDataDownloaderDelegate)delegate;
- (GEOMapDataSubscriptionTileDownloader)initWithSubscription:(id)a3 diskCache:(id)a4 reason:(unsigned __int8)a5 requestOptions:(unint64_t)a6 auditToken:(id)a7 manifestManager:(id)a8 delegate:(id)a9 delegateQueue:(id)a10 log:(id)a11 logPrefix:(id)a12 tileRequesterCreationBlock:(id)a13;
- (NSProgress)progress;
- (OS_dispatch_queue)delegateQueue;
- (unint64_t)bytesDownloaded;
- (unint64_t)failedTiles;
- (unint64_t)numberOfTilesAttempted;
- (unint64_t)numberOfTilesConsidered;
- (unint64_t)successfulTiles;
- (void)batchTileRequester:(uint64_t)a3 failedToLoadKey:(uint64_t)a4 error:(uint64_t)a5;
- (void)batchTileRequester:(void *)a3 receivedData:(void *)a4 tileEdition:(unsigned int)a5 tileSet:(unsigned int)a6 etag:(void *)a7 forKey:(uint64_t)a8 userInfo:(uint64_t)a9;
- (void)batchTileRequesterDidFinish:(id)a3;
- (void)cancel;
- (void)pause;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
@end

@implementation GEOMapDataSubscriptionTileDownloader

+ (NSString)loggingDescription
{
  return (NSString *)@"tiles";
}

- (GEOMapDataSubscriptionTileDownloader)initWithSubscription:(id)a3 diskCache:(id)a4 reason:(unsigned __int8)a5 requestOptions:(unint64_t)a6 auditToken:(id)a7 manifestManager:(id)a8 delegate:(id)a9 delegateQueue:(id)a10 log:(id)a11 logPrefix:(id)a12 tileRequesterCreationBlock:(id)a13
{
  unsigned int v32 = a5;
  id v35 = a3;
  id v34 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  v36.receiver = self;
  v36.super_class = (Class)GEOMapDataSubscriptionTileDownloader;
  v24 = [(GEOMapDataSubscriptionTileDownloader *)&v36 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_diskCache, a4);
    objc_storeWeak((id *)&v25->_delegate, v19);
    objc_storeStrong((id *)&v25->_delegateQueue, a10);
    v26 = [_GEOMapDataSubscriptionBatchTileRequester alloc];
    v27 = [v22 stringByAppendingString:@" [Tile]"];
    uint64_t v28 = [(_GEOMapDataSubscriptionBatchTileRequester *)v26 initWithSubscription:v35 diskCache:v34 reason:v32 auditToken:v17 requestOptions:a6 manifestManager:v18 log:v21 logPrefix:v27 tileRequesterCreationBlock:v23];
    batchRequester = v25->_batchRequester;
    v25->_batchRequester = (_GEOMapDataSubscriptionBatchTileRequester *)v28;

    [(GEOBatchTileRequester *)v25->_batchRequester setDelegate:v25];
    [(GEOBatchTileRequester *)v25->_batchRequester setDelegateQueue:v20];
    v30 = v25;
  }

  return v25;
}

- (GEOMapDataSubscription)subscription
{
  return [(_GEOMapDataSubscriptionBatchTileRequester *)self->_batchRequester subscription];
}

- (NSProgress)progress
{
  return [(_GEOMapDataSubscriptionBatchTileRequester *)self->_batchRequester progress];
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
  id v5 = a3;
  [(GEOBatchTileRequester *)self->_batchRequester setDelegateQueue:v5];
}

- (void)resume
{
}

- (void)pause
{
}

- (void)cancel
{
}

- (unint64_t)numberOfTilesConsidered
{
  return [(_GEOMapDataSubscriptionBatchTileRequester *)self->_batchRequester numberOfTilesConsidered];
}

- (unint64_t)numberOfTilesAttempted
{
  return [(GEOBatchTileRequester *)self->_batchRequester numberOfTilesAttempted];
}

- (unint64_t)successfulTiles
{
  return [(GEOBatchTileRequester *)self->_batchRequester successfulTiles];
}

- (unint64_t)failedTiles
{
  return [(GEOBatchTileRequester *)self->_batchRequester failedTiles];
}

- (unint64_t)bytesDownloaded
{
  return [(GEOBatchTileRequester *)self->_batchRequester bytesDownloaded];
}

- (void)batchTileRequester:(void *)a3 receivedData:(void *)a4 tileEdition:(unsigned int)a5 tileSet:(unsigned int)a6 etag:(void *)a7 forKey:(uint64_t)a8 userInfo:(uint64_t)a9
{
  v34[2] = *MEMORY[0x1E4F143B8];
  v34[0] = a9;
  v34[1] = a10;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a11;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  if (_GEOTileResponseIsCacheable((unsigned __int8 *)v34, v17))
  {
    id v18 = *(void **)(a1 + 40);
    id v19 = [v14 countryCode];
    id v20 = [v14 region];
    id v21 = [*(id *)(a1 + 32) devicePostureCountry];
    id v22 = [*(id *)(a1 + 32) devicePostureRegion];
    LODWORD(v18) = _GEOTileResponseIsAllowableForKey((uint64_t)v34, v18, v19, v20, v21, v22);

    if (v18)
    {
      id v23 = [v17 objectForKeyedSubscript:@"CachedDataWasCurrent"];
      objc_opt_class();
      v31 = v23;
      if (objc_opt_isKindOfClass()) {
        char v24 = [v23 BOOLValue];
      }
      else {
        char v24 = 0;
      }
      char v25 = [v14 reason];
      v26 = *(void **)(a1 + 32);
      uint64_t v27 = v34[0] & 0x7F;
      uint64_t v28 = [(id)a1 subscription];
      v29 = [v28 identifier];
      BYTE1(v30) = v24;
      LOBYTE(v30) = v25;
      objc_msgSend(v26, "addData:forKey:edition:set:provider:etag:reason:isIdenticalToExistingStaleData:forSubscriptionWithIdentifier:", v15, v34, a5, a6, v27, v16, v30, v29);
    }
  }
}

- (void)batchTileRequester:(uint64_t)a3 failedToLoadKey:(uint64_t)a4 error:(uint64_t)a5
{
  id v7 = a6;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  v8 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v7;
}

- (void)batchTileRequesterDidFinish:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_delegateQueue);
  v4 = self->_firstError;
  id v5 = [(GEOMapDataSubscriptionTileDownloader *)self delegate];
  [v5 downloader:self didFinishWithError:v4];
}

- (GEOMapDataSubscriptionDataDownloaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOMapDataSubscriptionDataDownloaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstError, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_diskCache, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_batchRequester, 0);
}

@end