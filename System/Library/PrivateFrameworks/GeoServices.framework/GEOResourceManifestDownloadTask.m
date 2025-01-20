@interface GEOResourceManifestDownloadTask
- (GEOResourceManifestDownloadTask)init;
- (GEOResourceManifestDownloadTask)initWithURL:(id)a3 eTag:(id)a4;
- (void)_finishWithUpdatedManifest:(id)a3 newETag:(id)a4 isExistingManifestCurrent:(BOOL)a5 error:(id)a6;
- (void)_recordNetworkEventDataForTask:(id)a3;
- (void)cancel;
- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4;
- (void)dataURLSession:(id)a3 shouldConvertDataTask:(id)a4 toDownloadTaskForEstimatedResponseSize:(unint64_t)a5 completionHandler:(id)a6;
- (void)startWithQueue:(id)a3 completionHandler:(id)a4;
@end

@implementation GEOResourceManifestDownloadTask

uint64_t __102__GEOResourceManifestDownloadTask__finishWithUpdatedManifest_newETag_isExistingManifestCurrent_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 48));
}

- (void)startWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__GEOResourceManifestDownloadTask_startWithQueue_completionHandler___block_invoke;
    v9[3] = &unk_1E53D7F70;
    v9[4] = self;
    id v10 = v6;
    id v11 = v8;
    GEOOnce((uint64_t)&self->_started, v9);
  }
}

- (GEOResourceManifestDownloadTask)initWithURL:(id)a3 eTag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GEOResourceManifestDownloadTask;
  v8 = [(GEOResourceManifestDownloadTask *)&v16 init];
  v9 = v8;
  if (v8)
  {
    v8->_started.lock._os_unfair_lock_opaque = 0;
    v8->_started.didRun = 0;
    uint64_t v10 = geo_dispatch_queue_create();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [v6 copy];
    url = v9->_url;
    v9->_url = (NSURL *)v12;

    objc_storeStrong((id *)&v9->_existingETag, a4);
    v14 = v9;
  }

  return v9;
}

- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v5 = (GEODataURLSessionTask *)a4;
  if (self->_task == v5)
  {
    id v6 = GEOGetResourceManifestLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [(GEODataURLSessionTask *)v5 originalRequestURL];
      v8 = [(GEODataURLSessionTask *)v5 error];
      v9 = [v8 domain];
      uint64_t v10 = [(GEODataURLSessionTask *)v5 error];
      *(_DWORD *)buf = 138543874;
      v32 = v7;
      __int16 v33 = 2114;
      v34 = v9;
      __int16 v35 = 1024;
      int v36 = [v10 code];
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "Finished loading manifest from '%{public}@': error: %{public}@ / %u", buf, 0x1Cu);
    }
    [(GEOResourceManifestDownloadTask *)self _recordNetworkEventDataForTask:v5];
    id v29 = 0;
    id v30 = 0;
    BOOL v11 = [(GEODataURLSessionTask *)v5 didValidateEntityTagForData:&v30 entityTag:&v29];
    id v12 = v30;
    id v13 = v29;
    if (v11)
    {
      v14 = GEOGetResourceManifestLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "Cached manifest is still current (HTTP 304)", buf, 2u);
      }

      [(GEOResourceManifestDownloadTask *)self _finishWithUpdatedManifest:0 newETag:0 isExistingManifestCurrent:1 error:0];
    }
    else
    {
      id v28 = 0;
      BOOL v15 = [(GEODataURLSessionTask *)v5 validateTransportWithError:&v28];
      id v16 = v28;
      if (v15)
      {
        v17 = [(GEODataURLSessionTask *)v5 downloadedFileURL];
        v18 = [v17 path];
        uint64_t v19 = [v18 length];

        if (v19)
        {
          v20 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v17 options:1 error:0];
          v21 = [[GEOResources alloc] initWithData:v20];
          if ([(GEOResources *)v21 isValid])
          {
            v22 = [(GEODataURLSessionTask *)v5 entityTag];
            [(GEOResourceManifestDownloadTask *)self _finishWithUpdatedManifest:v21 newETag:v22 isExistingManifestCurrent:0 error:0];
          }
          else
          {
            v25 = GEOGetResourceManifestLog();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              url = self->_url;
              *(_DWORD *)buf = 138543362;
              v32 = url;
              _os_log_impl(&dword_188D96000, v25, OS_LOG_TYPE_ERROR, "Error parsing manifest data from URL: %{public}@", buf, 0xCu);
            }

            uint64_t v27 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 userInfo:0];

            [(GEOResourceManifestDownloadTask *)self _finishWithUpdatedManifest:0 newETag:0 isExistingManifestCurrent:0 error:v27];
            id v16 = (id)v27;
          }
        }
        else
        {
          v23 = GEOGetResourceManifestLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            v32 = v5;
            _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_FAULT, "Manifest temp URL is empty from task: %{public}@", buf, 0xCu);
          }

          uint64_t v24 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-18 reason:@"Downloaded manifest temp file missing"];

          [(GEOResourceManifestDownloadTask *)self _finishWithUpdatedManifest:0 newETag:0 isExistingManifestCurrent:0 error:v24];
          id v16 = (id)v24;
        }
      }
      else
      {
        [(GEOResourceManifestDownloadTask *)self _finishWithUpdatedManifest:0 newETag:0 isExistingManifestCurrent:0 error:v16];
      }
    }
  }
}

- (void)_recordNetworkEventDataForTask:(id)a3
{
  id v3 = a3;
  GEOApplicationIdentifierOrProcessName();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [v3 error];
  v5 = [v3 clientMetrics];

  +[GEONetworkEventDataRecorder recordNetworkEventDataForDataRequestKind:3 usedBackgroundURL:MEMORY[0x1E4F1CC28] requestAppIdentifier:v6 appMajorVersion:0 appMinorVersion:0 error:v4 clientMetrics:v5 additionalStates:0];
}

- (void)_finishWithUpdatedManifest:(id)a3 newETag:(id)a4 isExistingManifestCurrent:(BOOL)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __102__GEOResourceManifestDownloadTask__finishWithUpdatedManifest_newETag_isExistingManifestCurrent_error___block_invoke;
  v17[3] = &unk_1E53E8368;
  p_finished = &self->_finished;
  v17[4] = self;
  id v18 = v10;
  BOOL v21 = a5;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  GEOOnce((uint64_t)p_finished, v17);
}

void __68__GEOResourceManifestDownloadTask_startWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__GEOResourceManifestDownloadTask_startWithQueue_completionHandler___block_invoke_2;
  block[3] = &unk_1E53D7F70;
  block[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, block);
}

void __102__GEOResourceManifestDownloadTask__finishWithUpdatedManifest_newETag_isExistingManifestCurrent_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x18C120660](*(void *)(*(void *)(a1 + 32) + 72));
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = 0;

  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__GEOResourceManifestDownloadTask__finishWithUpdatedManifest_newETag_isExistingManifestCurrent_error___block_invoke_2;
  block[3] = &unk_1E53E8340;
  id v13 = v2;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  char v14 = *(unsigned char *)(a1 + 64);
  id v12 = *(id *)(a1 + 56);
  id v6 = v2;
  dispatch_async(v5, block);
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = 0;
}

- (void)dataURLSession:(id)a3 shouldConvertDataTask:(id)a4 toDownloadTaskForEstimatedResponseSize:(unint64_t)a5 completionHandler:(id)a6
{
}

void __68__GEOResourceManifestDownloadTask_startWithQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  uint64_t v2 = [*(id *)(a1 + 48) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v2;

  id v5 = +[GEORequestCounter sharedCounter];
  id v6 = +[GEOApplicationAuditToken currentProcessAuditToken];
  char v14 = [v5 requestCounterTicketForType:3 auditToken:v6 traits:0];

  uint64_t v7 = [[GEODataRequest alloc] initWithKind:3 URL:*(void *)(*(void *)(a1 + 32) + 40) auditToken:0 timeoutInterval:0 additionalHTTPHeaders:0 bodyData:0 userAgent:0.0 entityTag:*(void *)(*(void *)(a1 + 32) + 48) cachedData:0 requestCounterTicket:v14 multipathServiceType:0 multipathAlternatePort:0 throttleToken:0 options:2];
  int BOOL = GEOConfigGetBOOL(GeoServicesConfig_TransactionsForMigration, (uint64_t)off_1E9113DF8);
  if (BOOL)
  {
    v9 = _GEOCreateTransaction();
  }
  else
  {
    v9 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), v9);
  if (BOOL) {

  }
  id v10 = +[GEODataURLSession sharedDataURLSession];
  uint64_t v11 = [v10 taskWithRequest:v7 delegate:*(void *)(a1 + 32) delegateQueue:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 56);
  *(void *)(v12 + 56) = v11;

  [*(id *)(*(void *)(a1 + 32) + 56) start];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_existingETag, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (GEOResourceManifestDownloadTask)init
{
  result = (GEOResourceManifestDownloadTask *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (void)cancel
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__GEOResourceManifestDownloadTask_cancel__block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __41__GEOResourceManifestDownloadTask_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) cancel];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  v4 = *(void **)(a1 + 32);
  id v5 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2 reason:@"Canceled"];
  [v4 _finishWithUpdatedManifest:0 newETag:0 isExistingManifestCurrent:0 error:v5];
}

@end