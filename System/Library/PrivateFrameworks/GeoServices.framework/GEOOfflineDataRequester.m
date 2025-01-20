@interface GEOOfflineDataRequester
- (GEOOfflineDataRequest)request;
- (GEOOfflineDataRequester)initWithRequest:(id)a3 requestOptions:(unint64_t)a4 auditToken:(id)a5 log:(id)a6 logPrefix:(id)a7;
- (GEOOfflineDataRequesterDelegate)delegate;
- (void)cancel;
- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4;
- (void)setDelegate:(id)a3;
- (void)start;
@end

@implementation GEOOfflineDataRequester

- (GEOOfflineDataRequester)initWithRequest:(id)a3 requestOptions:(unint64_t)a4 auditToken:(id)a5 log:(id)a6 logPrefix:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)GEOOfflineDataRequester;
  v17 = [(GEOOfflineDataRequester *)&v27 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_request, a3);
    v18->_requestOptions = a4;
    objc_storeStrong((id *)&v18->_auditToken, a5);
    objc_storeStrong((id *)&v18->_log, a6);
    uint64_t v19 = [v16 copy];
    logPrefix = v18->_logPrefix;
    v18->_logPrefix = (NSString *)v19;

    uint64_t v21 = +[GEODataURLSession sharedDataURLSession];
    dataSession = v18->_dataSession;
    v18->_dataSession = (GEODataURLSession *)v21;

    uint64_t v23 = geo_dispatch_queue_create_with_workloop_qos();
    workQueue = v18->_workQueue;
    v18->_workQueue = (OS_dispatch_queue *)v23;

    v25 = v18;
  }

  return v18;
}

- (void)start
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__GEOOfflineDataRequester_start__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __32__GEOOfflineDataRequester_start__block_invoke(uint64_t a1)
{
  v2 = +[GEORequestCounter sharedCounter];
  v3 = v2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v4)
  {
    id v15 = [v2 requestCounterTicketForType:2859 auditToken:v4 traits:0];
  }
  else
  {
    v5 = +[GEOApplicationAuditToken currentProcessAuditToken];
    id v15 = [v3 requestCounterTicketForType:2859 auditToken:v5 traits:0];
  }
  v6 = [GEODataRequest alloc];
  v7 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v7) {
    v7 = (void *)v7[2];
  }
  v8 = v7;
  v9 = [(GEODataRequest *)v6 initWithKind:2859 URL:v8 auditToken:*(void *)(*(void *)(a1 + 32) + 16) timeoutInterval:0 additionalHTTPHeaders:0 bodyData:0 userAgent:GEOConfigGetDouble(GeoOfflineConfig_BatchDownloadTimeout, (uint64_t)off_1E91158C8) entityTag:0 cachedData:0 requestCounterTicket:v15 multipathServiceType:0 multipathAlternatePort:0 throttleToken:0 options:*(void *)(*(void *)(a1 + 32) + 24)];

  v10 = +[GEODataURLSession sharedDataURLSession];
  LODWORD(v11) = *MEMORY[0x1E4F28A00];
  uint64_t v12 = [v10 downloadTaskWithRequest:v9 priority:*(void *)(a1 + 32) delegate:*(void *)(*(void *)(a1 + 32) + 64) delegateQueue:v11];
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = *(void **)(v13 + 72);
  *(void *)(v13 + 72) = v12;

  [*(id *)(*(void *)(a1 + 32) + 72) start];
}

- (void)cancel
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__GEOOfflineDataRequester_cancel__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __33__GEOOfflineDataRequester_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) cancel];
}

- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 failedDueToCancel])
  {
    v6 = [(GEOOfflineDataRequester *)self delegate];
    v7 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2 reason:0];
    [v6 offlineRequester:self didFailWithError:v7];
  }
  else
  {
    id v46 = 0;
    char v8 = [v5 validateTransportWithError:&v46];
    id v9 = v46;
    v10 = v9;
    if (v8)
    {
      id v39 = v9;
      v40 = v5;
      double v11 = [v5 downloadedFileURL];
      log = self->_log;
      id v45 = 0;
      uint64_t v13 = +[GEOUnarchiver getContentsOfArchiveAtURL:v11 log:log error:&v45];
      id v14 = v45;

      if (!v13)
      {
        id v15 = [(GEOOfflineDataRequester *)self delegate];
        [v15 offlineRequester:self didFailWithError:v14];
      }
      id v38 = v14;
      id v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v17 = v13;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v51 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v42 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            uint64_t v23 = [v22 filePath];
            v24 = [v23 lastPathComponent];

            v25 = objc_msgSend(MEMORY[0x1E4F1C9B8], "_geo_dataForHexString:", v24);
            if (v25)
            {
              [v16 setObject:v22 forKey:v25];
            }
            else
            {
              v26 = self->_log;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
              {
                logPrefix = self->_logPrefix;
                *(_DWORD *)buf = 138543618;
                v48 = logPrefix;
                __int16 v49 = 2114;
                uint64_t v50 = (uint64_t)v24;
                _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_FAULT, "%{public}@ Archive contains unexpected filename: %{public}@", buf, 0x16u);
              }
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v51 count:16];
        }
        while (v19);
      }

      v28 = self->_log;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v29 = self->_logPrefix;
        v30 = v28;
        uint64_t v31 = [v16 count];
        *(_DWORD *)buf = 138543618;
        v48 = v29;
        __int16 v49 = 2050;
        uint64_t v50 = v31;
        _os_log_impl(&dword_188D96000, v30, OS_LOG_TYPE_DEBUG, "%{public}@ Archive contains %{public}llu data keys", buf, 0x16u);
      }
      v32 = [GEOTileData alloc];
      id v5 = v40;
      v33 = [v40 downloadedFileURL];
      v34 = [(GEOTileData *)v32 initWithFileURL:v33];

      v35 = [(GEOOfflineDataRequester *)self delegate];
      v36 = [v40 entityTag];
      [v35 offlineRequester:self didFinishWithData:v34 withETag:v36 containingDataKeys:v16];

      v37 = v38;
      v10 = v39;
    }
    else
    {
      v37 = [(GEOOfflineDataRequester *)self delegate];
      [v37 offlineRequester:self didFailWithError:v10];
    }
  }
}

- (GEOOfflineDataRequest)request
{
  return self->_request;
}

- (GEOOfflineDataRequesterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOOfflineDataRequesterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_dataSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end