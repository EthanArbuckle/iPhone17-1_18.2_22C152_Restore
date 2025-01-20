@interface GEOTileServerProxy
- (GEOTileServerProxy)initWithCacheDBLocation:(id)a3 cacheFilesLocation:(id)a4 manifestConfiguration:(id)a5 locale:(id)a6 delegateQueue:(id)a7 delegate:(id)a8;
- (GEOTileServerProxyDelegate)delegate;
- (uint64_t)cancel:(void *)a1 batchID:(const char *)a2;
- (uint64_t)generateRequestedFromTileLoaderBeginSignpost:(void *)a1 tileKey:(const char *)a2 options:;
- (uint64_t)reportCorruptTile:(void *)a1;
- (uint64_t)reprioritizeKey:(void *)a1 newPriority:(const char *)a2 batchID:;
- (unint64_t)calculateFreeableSizeSync;
- (unint64_t)shrinkDiskCacheToSizeSync:(unint64_t)a3;
- (void)beginPreloadSessionOfSize:(unint64_t)a3;
- (void)calculateFreeableSize;
- (void)close;
- (void)dealloc;
- (void)endPreloadSession;
- (void)enumerateAllKeysIncludingData:(BOOL)a3 onQueue:(id)a4 group:(id)a5 dataHandler:(id)a6;
- (void)flushPendingWrites;
- (void)generateRequestedFromTileLoaderEndSignpost:(unint64_t)a3;
- (void)loadTiles:(id)a3 batchID:(int)a4 priorities:(const unsigned int *)a5 hasAdditionalInfos:(const BOOL *)a6 additionalInfos:(const GEOTileLoaderAdditionalInfo *)a7 signpostIDs:(const unint64_t *)a8 createTimes:(const double *)a9 reason:(unsigned __int8)a10 options:(unint64_t)a11 auditToken:(id)a12;
- (void)open;
- (void)shrinkDiskCacheToSize:(unint64_t)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
@end

@implementation GEOTileServerProxy

void __117__GEOTileServerProxy_initWithCacheDBLocation_cacheFilesLocation_manifestConfiguration_locale_delegateQueue_delegate___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained delegate];
  objc_initWeak(&location, (id)v3);

  id v4 = objc_loadWeakRetained(&location);
  LOBYTE(v3) = objc_opt_respondsToSelector();

  if (v3)
  {
    id v5 = objc_loadWeakRetained(&location);
    id v6 = objc_loadWeakRetained(v1);
    [v5 proxyDidDownloadRegionalResources:v6];
  }
  objc_destroyWeak(&location);
}

- (GEOTileServerProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOTileServerProxyDelegate *)WeakRetained;
}

- (GEOTileServerProxy)initWithCacheDBLocation:(id)a3 cacheFilesLocation:(id)a4 manifestConfiguration:(id)a5 locale:(id)a6 delegateQueue:(id)a7 delegate:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v30.receiver = self;
  v30.super_class = (Class)GEOTileServerProxy;
  v20 = [(GEOTileServerProxy *)&v30 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_manifestConfiguration, a5);
    objc_storeStrong((id *)&v21->_locale, a6);
    uint64_t v22 = geo_dispatch_queue_create_with_target();
    delegateQueue = v21->_delegateQueue;
    v21->_delegateQueue = (OS_dispatch_queue *)v22;

    objc_storeWeak((id *)&v21->_delegate, v19);
    objc_initWeak(&location, v21);
    v24 = v21->_delegateQueue;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __117__GEOTileServerProxy_initWithCacheDBLocation_cacheFilesLocation_manifestConfiguration_locale_delegateQueue_delegate___block_invoke;
    v27[3] = &unk_1E53DD2C0;
    objc_copyWeak(&v28, &location);
    notify_register_dispatch("kGEORegionalResourcesTileRequesterDidDownloadNotification", &v21->_resourceNotificationToken, v24, v27);
    v25 = v21;
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v21;
}

- (void)dealloc
{
  int resourceNotificationToken = self->_resourceNotificationToken;
  if (resourceNotificationToken)
  {
    notify_cancel(resourceNotificationToken);
    self->_int resourceNotificationToken = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)GEOTileServerProxy;
  [(GEOTileServerProxy *)&v4 dealloc];
}

- (void)open
{
}

- (void)close
{
}

- (void)loadTiles:(id)a3 batchID:(int)a4 priorities:(const unsigned int *)a5 hasAdditionalInfos:(const BOOL *)a6 additionalInfos:(const GEOTileLoaderAdditionalInfo *)a7 signpostIDs:(const unint64_t *)a8 createTimes:(const double *)a9 reason:(unsigned __int8)a10 options:(unint64_t)a11 auditToken:(id)a12
{
}

- (uint64_t)cancel:(void *)a1 batchID:(const char *)a2
{
  return [a1 doesNotRecognizeSelector:a2];
}

- (uint64_t)reprioritizeKey:(void *)a1 newPriority:(const char *)a2 batchID:
{
  return [a1 doesNotRecognizeSelector:a2];
}

- (uint64_t)reportCorruptTile:(void *)a1
{
  return [a1 doesNotRecognizeSelector:a2];
}

- (void)flushPendingWrites
{
}

- (void)calculateFreeableSize
{
}

- (void)shrinkDiskCacheToSize:(unint64_t)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
}

- (unint64_t)calculateFreeableSizeSync
{
  return 0;
}

- (unint64_t)shrinkDiskCacheToSizeSync:(unint64_t)a3
{
  return 0;
}

- (void)beginPreloadSessionOfSize:(unint64_t)a3
{
}

- (void)endPreloadSession
{
}

- (uint64_t)generateRequestedFromTileLoaderBeginSignpost:(void *)a1 tileKey:(const char *)a2 options:
{
  return [a1 doesNotRecognizeSelector:a2];
}

- (void)generateRequestedFromTileLoaderEndSignpost:(unint64_t)a3
{
}

- (void)enumerateAllKeysIncludingData:(BOOL)a3 onQueue:(id)a4 group:(id)a5 dataHandler:(id)a6
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end