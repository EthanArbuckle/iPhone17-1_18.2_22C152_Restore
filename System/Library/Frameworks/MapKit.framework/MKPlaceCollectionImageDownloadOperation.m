@interface MKPlaceCollectionImageDownloadOperation
- (BOOL)executing;
- (BOOL)finished;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (MKPlaceCollectionImageDownloadOperation)initWithUrl:(id)a3 downloadCache:(id)a4 cacheId:(id)a5;
- (NSCache)downloadCache;
- (NSString)cacheId;
- (NSURL)url;
- (NSURLSessionDataTask)downloadTask;
- (UIImage)downloadedImage;
- (void)cancel;
- (void)main;
- (void)markOperationAsComplete;
- (void)setCacheId:(id)a3;
- (void)setDownloadCache:(id)a3;
- (void)setDownloadTask:(id)a3;
- (void)setDownloadedImage:(id)a3;
- (void)setExecuting:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)setUrl:(id)a3;
- (void)start;
@end

@implementation MKPlaceCollectionImageDownloadOperation

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)main
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(MKPlaceCollectionImageDownloadOperation *)self downloadCache];
  v4 = [(MKPlaceCollectionImageDownloadOperation *)self cacheId];
  v5 = [v3 objectForKey:v4];

  if (v5)
  {
    v6 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = [(MKPlaceCollectionImageDownloadOperation *)self name];
      *(_DWORD *)buf = 138412290;
      v23 = v7;
      _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_DEBUG, "[!]Download cache already has image: %@", buf, 0xCu);
    }
    [(MKPlaceCollectionImageDownloadOperation *)self markOperationAsComplete];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F290D0]);
    v9 = [(MKPlaceCollectionImageDownloadOperation *)self url];
    v10 = (void *)[v8 initWithURL:v9 cachePolicy:2 timeoutInterval:15.0];

    objc_initWeak(&location, self);
    v11 = [MEMORY[0x1E4F1C9C8] date];
    v12 = [MEMORY[0x1E4F290E0] sharedSession];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __47__MKPlaceCollectionImageDownloadOperation_main__block_invoke;
    v18[3] = &unk_1E54BB738;
    objc_copyWeak(&v20, &location);
    id v13 = v11;
    id v19 = v13;
    v14 = [v12 dataTaskWithRequest:v10 completionHandler:v18];
    downloadTask = self->_downloadTask;
    self->_downloadTask = v14;

    if ([(MKPlaceCollectionImageDownloadOperation *)self isCancelled])
    {
      v16 = MKGetCuratedCollectionsLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = [(MKPlaceCollectionImageDownloadOperation *)self cacheId];
        *(_DWORD *)buf = 138412290;
        v23 = v17;
        _os_log_impl(&dword_18BAEC000, v16, OS_LOG_TYPE_DEBUG, "Download Operation is cancelled for: %@", buf, 0xCu);
      }
    }
    else
    {
      [(NSURLSessionDataTask *)self->_downloadTask resume];
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

- (NSCache)downloadCache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downloadCache);

  return (NSCache *)WeakRetained;
}

- (NSString)cacheId
{
  return self->_cacheId;
}

- (NSURL)url
{
  return self->_url;
}

void __47__MKPlaceCollectionImageDownloadOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v9 || ![v7 length])
  {
    v11 = MKGetCuratedCollectionsLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    v12 = [WeakRetained name];
    int v23 = 138412546;
    uint64_t v24 = v12;
    __int16 v25 = 2112;
    uint64_t v26 = (uint64_t)v9;
    _os_log_impl(&dword_18BAEC000, v11, OS_LOG_TYPE_ERROR, "[!!]Image download failed for: %@. Error: %@", (uint8_t *)&v23, 0x16u);
  }
  else
  {
    v11 = [objc_alloc(MEMORY[0x1E4F42A80]) initWithData:v7];
    id v13 = MKGetCuratedCollectionsLog();
    v12 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = [WeakRetained name];
        v15 = [MEMORY[0x1E4F1C9C8] date];
        [v15 timeIntervalSinceDate:*(void *)(a1 + 32)];
        int v23 = 138412802;
        uint64_t v24 = v14;
        __int16 v25 = 2048;
        uint64_t v26 = v16;
        __int16 v27 = 2112;
        v28 = v11;
        _os_log_impl(&dword_18BAEC000, v12, OS_LOG_TYPE_DEBUG, "[⌛]Completed image download for (%@) in: %f seconds. Image: %@. ", (uint8_t *)&v23, 0x20u);
      }
      v12 = [WeakRetained downloadCache];
      v17 = [WeakRetained cacheId];
      [v12 setObject:v11 forKey:v17];
      goto LABEL_11;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = [WeakRetained cacheId];
      int v23 = 138412802;
      uint64_t v24 = v7;
      __int16 v25 = 2112;
      uint64_t v26 = (uint64_t)v8;
      __int16 v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_18BAEC000, v12, OS_LOG_TYPE_ERROR, "[⌛] Failed to build UIImage from data: %@, \nResponse: %@. \nCache ID: %@", (uint8_t *)&v23, 0x20u);
LABEL_11:
    }
  }

LABEL_13:
  v18 = MKGetCuratedCollectionsLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    id v19 = [WeakRetained downloadCache];
    id v20 = [WeakRetained downloadCache];
    v21 = [v20 allObjects];
    uint64_t v22 = [v21 count];
    int v23 = 138412546;
    uint64_t v24 = v19;
    __int16 v25 = 2048;
    uint64_t v26 = v22;
    _os_log_impl(&dword_18BAEC000, v18, OS_LOG_TYPE_DEBUG, "Download cache %@ has %ld items.", (uint8_t *)&v23, 0x16u);
  }
  [WeakRetained markOperationAsComplete];
}

- (void)markOperationAsComplete
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = MKGetCuratedCollectionsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(MKPlaceCollectionImageDownloadOperation *)self name];
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_DEBUG, "Download operation finished %@", (uint8_t *)&v5, 0xCu);
  }
  [(MKPlaceCollectionImageDownloadOperation *)self willChangeValueForKey:@"isFinished"];
  [(MKPlaceCollectionImageDownloadOperation *)self willChangeValueForKey:@"isExecuting"];
  [(MKPlaceCollectionImageDownloadOperation *)self setExecuting:0];
  [(MKPlaceCollectionImageDownloadOperation *)self setFinished:1];
  [(MKPlaceCollectionImageDownloadOperation *)self didChangeValueForKey:@"isExecuting"];
  [(MKPlaceCollectionImageDownloadOperation *)self didChangeValueForKey:@"isFinished"];
}

- (MKPlaceCollectionImageDownloadOperation)initWithUrl:(id)a3 downloadCache:(id)a4 cacheId:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MKPlaceCollectionImageDownloadOperation;
  v12 = [(MKPlaceCollectionImageDownloadOperation *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    objc_storeWeak((id *)&v13->_downloadCache, v10);
    objc_storeStrong((id *)&v13->_cacheId, a5);
    [(MKPlaceCollectionImageDownloadOperation *)v13 setName:v11];
    v13->_executing = 0;
    v13->_finished = 0;
  }

  return v13;
}

- (void)start
{
  if ([(MKPlaceCollectionImageDownloadOperation *)self isCancelled])
  {
    [(MKPlaceCollectionImageDownloadOperation *)self willChangeValueForKey:@"isFinished"];
    self->_finished = 1;
    [(MKPlaceCollectionImageDownloadOperation *)self didChangeValueForKey:@"isFinished"];
  }
  else
  {
    [(MKPlaceCollectionImageDownloadOperation *)self willChangeValueForKey:@"isExecuting"];
    self->_executing = 1;
    [(MKPlaceCollectionImageDownloadOperation *)self didChangeValueForKey:@"isExecuting"];
    [(MKPlaceCollectionImageDownloadOperation *)self main];
  }
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (void)setExecuting:(BOOL)a3
{
  self->_executing = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_downloadCache);
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_storeStrong((id *)&self->_cacheId, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_downloadedImage, 0);
}

- (void)cancel
{
  v3 = [(MKPlaceCollectionImageDownloadOperation *)self downloadTask];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)MKPlaceCollectionImageDownloadOperation;
  [(MKPlaceCollectionImageDownloadOperation *)&v4 cancel];
}

- (BOOL)executing
{
  return self->_executing;
}

- (BOOL)finished
{
  return self->_finished;
}

- (UIImage)downloadedImage
{
  return self->_downloadedImage;
}

- (void)setDownloadedImage:(id)a3
{
}

- (void)setUrl:(id)a3
{
}

- (void)setCacheId:(id)a3
{
}

- (NSURLSessionDataTask)downloadTask
{
  return self->_downloadTask;
}

- (void)setDownloadTask:(id)a3
{
}

- (void)setDownloadCache:(id)a3
{
}

@end