@interface ENDownloadManager
- (BOOL)_copyDownloadedFileAtPath:(id)a3 toPath:(id)a4 removeExisting:(BOOL)a5 error:(id *)a6;
- (BOOL)_enumerateDownloadsWithError:(id *)a3 handler:(id)a4;
- (BOOL)_readStateIfNecessaryWithError:(id *)a3;
- (BOOL)_saveState;
- (BOOL)_saveStateWithError:(id *)a3;
- (BOOL)_shouldFetchFromEndpointWithState:(id)a3 time:(double)a4;
- (BOOL)enumerateDownloadsWithError:(id *)a3 handler:(id)a4;
- (BOOL)resetStateFile;
- (ENDownloadManager)initWithDirectoryURL:(id)a3 queue:(id)a4;
- (ENDownloadManager)initWithQueue:(id)a3;
- (ENDownloadManagerState)state;
- (NSBackgroundActivityScheduler)fetchScheduler;
- (NSURL)directoryURL;
- (NSURLSession)URLSession;
- (double)_aggregateDownloadIntervalFromEndpoints:(id)a3;
- (id)_baseDirectoryPathForEndpointWithState:(id)a3;
- (id)_countOfAvailableDownloadsWithError:(id *)a3;
- (id)_downloadsDirectoryPathForEndpointState:(id)a3;
- (id)_indexFilePathForEndpointState:(id)a3;
- (id)_nextFilePathToDownloadWithEndpointState:(id)a3;
- (id)countOfAvailableDownloadsWithError:(id *)a3;
- (id)createScheduler;
- (id)description;
- (id)errorMetricReporter;
- (unint64_t)enabledEndpointCount;
- (void)_activate;
- (void)_backgroundActivityFiredWithCompletion:(id)a3;
- (void)_downloadIndexWithTask:(id)a3;
- (void)_downloadNextFileFromServerWithTask:(id)a3;
- (void)_handleFileDownloadFinishedForTask:(id)a3 serverFilePath:(id)a4 downloadedFilePath:(id)a5;
- (void)_handleIndexFileDownloadFinishedForTask:(id)a3 filePath:(id)a4;
- (void)_invalidate;
- (void)_performDownloadsWithScheduler:(id)a3 atDate:(id)a4 forced:(BOOL)a5 completion:(id)a6;
- (void)_purgeAllDownloads;
- (void)_purgeExpiredDownloadsWithDate:(id)a3;
- (void)_purgeKeepingDownloadsForIdentifiers:(id)a3 expiryDate:(id)a4;
- (void)_reportErrorMetric:(unsigned int)a3;
- (void)_reportErrorMetricForHTTPStatus:(int64_t)a3 forIndexFile:(BOOL)a4;
- (void)_setDownloadEndpoints:(id)a3;
- (void)_update;
- (void)_updateFetchSchedule;
- (void)activate;
- (void)invalidate;
- (void)performDownloadsAtDate:(id)a3 forced:(BOOL)a4 completion:(id)a5;
- (void)performDownloadsForced:(BOOL)a3 completion:(id)a4;
- (void)purgeAllDownloads;
- (void)purgeExpiredDownloadsWithDate:(id)a3;
- (void)setDownloadEndpoints:(id)a3;
- (void)setErrorMetricReporter:(id)a3;
- (void)setURLSession:(id)a3;
- (void)update;
@end

@implementation ENDownloadManager

- (ENDownloadManager)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = ENDataVaultPath();
  v6 = [v5 stringByAppendingPathComponent:@"Downloads"];

  v7 = [MEMORY[0x1E4F1CB08] fileURLWithPath:v6];
  v8 = [(ENDownloadManager *)self initWithDirectoryURL:v7 queue:v4];

  return v8;
}

- (ENDownloadManager)initWithDirectoryURL:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ENDownloadManager;
  v8 = [(ENDownloadManager *)&v16 init];
  if (!v8) {
    goto LABEL_4;
  }
  uint64_t v9 = [v6 copy];
  directoryURL = v8->_directoryURL;
  v8->_directoryURL = (NSURL *)v9;

  objc_storeStrong((id *)&v8->_queue, a4);
  v11 = [(NSURL *)v8->_directoryURL URLByAppendingPathComponent:@"state.dat"];
  v12 = [v11 path];

  if (v12)
  {
    v13 = [[ENSecureArchiveFileWrapper alloc] initWithPath:v12];
    stateFileWrapper = v8->_stateFileWrapper;
    v8->_stateFileWrapper = v13;

LABEL_4:
    v12 = v8;
  }

  return v12;
}

- (void)activate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__ENDownloadManager_activate__block_invoke;
  block[3] = &unk_1E69ACA50;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __29__ENDownloadManager_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (!self->_URLSession)
  {
    v3 = [MEMORY[0x1E4F18DC8] defaultSessionConfiguration];
    id v4 = ENBundleIdentifierForURLSessions();
    objc_msgSend(v3, "set_sourceApplicationBundleIdentifier:", v4);

    v5 = [MEMORY[0x1E4F18DB8] sessionWithConfiguration:v3];
    URLSession = self->_URLSession;
    self->_URLSession = v5;
  }

  [(ENDownloadManager *)self _update];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__ENDownloadManager_invalidate__block_invoke;
  block[3] = &unk_1E69ACA50;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __31__ENDownloadManager_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  self->_invalidated = 1;
  [(NSBackgroundActivityScheduler *)self->_fetchScheduler invalidate];
  fetchScheduler = self->_fetchScheduler;
  self->_fetchScheduler = 0;

  [(ENSecureArchiveFileWrapper *)self->_stateFileWrapper close];
  [(NSURLSession *)self->_URLSession invalidateAndCancel];
  URLSession = self->_URLSession;
  self->_URLSession = 0;
}

- (void)_reportErrorMetric:(unsigned int)a3
{
  errorMetricReporter = (void (**)(id, void))self->_errorMetricReporter;
  if (errorMetricReporter) {
    errorMetricReporter[2](errorMetricReporter, *(void *)&a3);
  }
}

- (void)_reportErrorMetricForHTTPStatus:(int64_t)a3 forIndexFile:(BOOL)a4
{
  if (a4) {
    int v4 = 8000;
  }
  else {
    int v4 = 9000;
  }
  if ((unint64_t)a3 <= 0x3E7) {
    int v5 = a3;
  }
  else {
    int v5 = 0;
  }
  [(ENDownloadManager *)self _reportErrorMetric:(v4 + v5)];
}

- (id)countOfAvailableDownloadsWithError:(id *)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ENDownloadManager_countOfAvailableDownloadsWithError___block_invoke;
  block[3] = &unk_1E69ACD50;
  block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __56__ENDownloadManager_countOfAvailableDownloadsWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _countOfAvailableDownloadsWithError:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)_countOfAvailableDownloadsWithError:(id *)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__ENDownloadManager__countOfAvailableDownloadsWithError___block_invoke;
  v5[3] = &unk_1E69ADEE8;
  v5[4] = &v6;
  if ([(ENDownloadManager *)self _enumerateDownloadsWithError:a3 handler:v5])
  {
    uint64_t v3 = [MEMORY[0x1E4F28EC8] numberWithInteger:v7[3]];
  }
  else
  {
    uint64_t v3 = 0;
  }
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __57__ENDownloadManager__countOfAvailableDownloadsWithError___block_invoke(uint64_t a1)
{
  return 2;
}

- (BOOL)enumerateDownloadsWithError:(id *)a3 handler:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__ENDownloadManager_enumerateDownloadsWithError_handler___block_invoke;
  v10[3] = &unk_1E69ADF10;
  id v12 = &v14;
  v13 = a3;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  dispatch_barrier_sync(queue, v10);
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

uint64_t __57__ENDownloadManager_enumerateDownloadsWithError_handler___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _enumerateDownloadsWithError:*(void *)(a1 + 56) handler:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_enumerateDownloadsWithError:(id *)a3 handler:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = (uint64_t (**)(id, void, void *, id *))a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28CC0]);
  v43 = self;
  [(ENDownloadManagerState *)self->_state endpointStates];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v39 = a3;
    id v11 = 0;
    uint64_t v12 = *(void *)v63;
    v50 = v6;
    uint64_t v41 = *(void *)v63;
    uint64_t v42 = *MEMORY[0x1E4F1C510];
    id v40 = v8;
    while (2)
    {
      uint64_t v13 = 0;
      uint64_t v44 = v10;
      do
      {
        if (*(void *)v63 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v62 + 1) + 8 * v13);
        v51 = objc_msgSend(v14, "endpoint", v38);
        if ([v51 enabled])
        {
          v15 = (void *)MEMORY[0x1E4F1CB08];
          uint64_t v16 = [(ENDownloadManager *)v43 _downloadsDirectoryPathForEndpointState:v14];
          uint64_t v17 = [v15 fileURLWithPath:v16 isDirectory:1];

          if (v17)
          {
            id v48 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
            uint64_t v68 = v42;
            v18 = [MEMORY[0x1E4F1C970] arrayWithObjects:&v68 count:1];
            v47 = (void *)v17;
            v19 = [v7 enumeratorAtURL:v17 includingPropertiesForKeys:v18 options:1 errorHandler:0];

            long long v61 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v58 = 0u;
            id obj = v19;
            uint64_t v20 = [obj countByEnumeratingWithState:&v58 objects:v67 count:16];
            uint64_t v45 = v13;
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v59;
              while (2)
              {
                uint64_t v23 = 0;
                v24 = v11;
                do
                {
                  if (*(void *)v59 != v22) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v25 = *(void *)(*((void *)&v58 + 1) + 8 * v23);
                  v26 = (void *)MEMORY[0x1D9439DC0]();
                  id v57 = v24;
                  uint64_t v27 = v50[2](v50, v25, v51, &v57);
                  id v11 = v57;

                  if (v27 == 1)
                  {
                    [v48 addObject:v25];
                  }
                  else if (!v27)
                  {
                    if (v11
                      && gLogCategory__ENDownloadManager <= 90
                      && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
                    {
                      v38 = CUPrintNSError();
                      LogPrintF_safe();
                    }
                    int v46 = 1;
                    goto LABEL_28;
                  }
                  ++v23;
                  v24 = v11;
                }
                while (v21 != v23);
                uint64_t v21 = [obj countByEnumeratingWithState:&v58 objects:v67 count:16];
                if (v21) {
                  continue;
                }
                break;
              }
              int v46 = 0;
LABEL_28:
              id v8 = v40;
            }
            else
            {
              int v46 = 0;
            }

            long long v55 = 0u;
            long long v56 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            id v28 = v48;
            uint64_t v29 = [v28 countByEnumeratingWithState:&v53 objects:v66 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v54;
              do
              {
                for (uint64_t i = 0; i != v30; ++i)
                {
                  v33 = v11;
                  if (*(void *)v54 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  uint64_t v34 = *(void *)(*((void *)&v53 + 1) + 8 * i);
                  id v52 = v11;
                  char v35 = objc_msgSend(v7, "removeItemAtURL:error:", v34, &v52, v38);
                  id v11 = v52;

                  if ((v35 & 1) == 0
                    && gLogCategory__ENDownloadManager <= 90
                    && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
                  {
                    v38 = CUPrintNSError();
                    LogPrintF_safe();
                  }
                }
                uint64_t v30 = [v28 countByEnumeratingWithState:&v53 objects:v66 count:16];
              }
              while (v30);
            }

            if (v46)
            {
              if (v39 && v11) {
                id *v39 = v11;
              }
              BOOL v36 = v11 == 0;

              goto LABEL_50;
            }

            uint64_t v12 = v41;
            uint64_t v10 = v44;
            uint64_t v13 = v45;
          }
          else
          {
            uint64_t v10 = v44;
          }
        }

        ++v13;
      }
      while (v13 != v10);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v62 objects:v69 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    BOOL v36 = 1;
LABEL_50:
    id v6 = v50;
  }
  else
  {
    id v11 = 0;
    BOOL v36 = 1;
  }

  return v36;
}

- (void)update
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__ENDownloadManager_update__block_invoke;
  block[3] = &unk_1E69ACA50;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __27__ENDownloadManager_update__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

- (void)_update
{
  uint64_t v2 = self;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v48 = 0;
  BOOL v3 = [(ENDownloadManager *)self _readStateIfNecessaryWithError:&v48];
  id v4 = v48;
  int v5 = v4;
  if (v3)
  {
    id v6 = v2->_pendingEndpoints;
    if (v6)
    {
      v39 = v5;
      v37 = v6;
      [(ENDownloadManagerState *)v2->_state setEndpoints:v6];
      [(ENDownloadManager *)v2 _saveState];
      pendingEndpoints = v2->_pendingEndpoints;
      v2->_pendingEndpoints = 0;

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v38 = v2;
      id v8 = [(ENDownloadManagerState *)v2->_state endpointStates];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        unint64_t v11 = 0x1E69AC000uLL;
        uint64_t v12 = &unk_1EA6B2000;
        uint64_t v13 = *(void *)v45;
        uint64_t v40 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v45 != v13) {
              objc_enumerationMutation(v8);
            }
            v15 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            uint64_t v16 = objc_msgSend(*(id *)(v11 + 1152), "sharedENLoggingPrefs", v31, v33, v34, v35, v36);
            int v17 = [v16 isSensitiveLoggingAllowed];

            if (v17)
            {
              int v18 = v12[290];
              if (v18 <= 30 && (v18 != -1 || _LogCategory_Initialize()))
              {
                v19 = [v15 shortIdentifier];
                v43 = [v15 endpoint];
                uint64_t v20 = [v43 serverBaseURL];
                uint64_t v42 = [v15 endpoint];
                int v21 = [v42 enabled];
                uint64_t v22 = "no";
                if (v21) {
                  uint64_t v22 = "yes";
                }
                uint64_t v41 = v22;
                uint64_t v23 = [v15 endpoint];
                [v23 downloadInterval];
                CUPrintDurationDouble();
                uint64_t v25 = v24 = v12;
                v26 = [v15 lastFetchAttemptDate];
                [v26 timeIntervalSinceNow];
                CUPrintDurationDouble();
                v36 = char v35 = v25;
                v33 = v20;
                uint64_t v34 = v41;
                uint64_t v31 = v19;
                LogPrintF_safe();

                uint64_t v12 = v24;
                uint64_t v13 = v40;

                unint64_t v11 = 0x1E69AC000;
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
        }
        while (v10);
      }

      uint64_t v2 = v38;
      int v5 = v39;
      id v6 = v37;
    }
    [(ENDownloadManager *)v2 _updateFetchSchedule];
    goto LABEL_19;
  }
  id v27 = v4;
  id v28 = [v27 domain];
  if ([v28 isEqualToString:*MEMORY[0x1E4F25700]])
  {
    uint64_t v29 = [v27 code];

    if (v29 == 16)
    {
      if (gLogCategory_ENDownloadManager <= 30
        && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      goto LABEL_20;
    }
  }
  else
  {
  }
  if (gLogCategory__ENDownloadManager <= 90
    && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    v32 = CUPrintNSError();
    LogPrintF_safe();
  }
  if (v27)
  {
    id v6 = [v27 domain];
    if (([(NSArray *)v6 isEqualToString:*MEMORY[0x1E4F281F0]] & 1) == 0)
    {
LABEL_19:

      goto LABEL_20;
    }
    uint64_t v30 = [v27 code];

    if (v30 == 4864)
    {
      [(ENDownloadManager *)v2 _reportErrorMetric:2004];
      [(ENDownloadManager *)v2 resetStateFile];
    }
  }
LABEL_20:
}

- (void)setDownloadEndpoints:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__ENDownloadManager_setDownloadEndpoints___block_invoke;
  v7[3] = &unk_1E69ACBE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __42__ENDownloadManager_setDownloadEndpoints___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setDownloadEndpoints:*(void *)(a1 + 40)];
}

- (void)_setDownloadEndpoints:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (gLogCategory_ENDownloadManager <= 10)
  {
    if (gLogCategory_ENDownloadManager != -1 || (v5 = _LogCategory_Initialize(), id v4 = v9, v5))
    {
      uint64_t v8 = [v4 count];
      LogPrintF_safe();
      id v4 = v9;
    }
  }
  id v6 = (NSArray *)objc_msgSend(v4, "copy", v8);
  pendingEndpoints = self->_pendingEndpoints;
  self->_pendingEndpoints = v6;

  [(ENDownloadManager *)self _update];
}

- (unint64_t)enabledEndpointCount
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [(ENDownloadManagerState *)self->_state endpointStates];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) endpoint];
        v5 += [v8 enabled];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)performDownloadsForced:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__ENDownloadManager_performDownloadsForced_completion___block_invoke;
  block[3] = &unk_1E69ADF60;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(queue, block);
}

void __55__ENDownloadManager_performDownloadsForced_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [MEMORY[0x1E4F1C9C0] date];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__ENDownloadManager_performDownloadsForced_completion___block_invoke_2;
  v5[3] = &unk_1E69ADF38;
  id v6 = *(id *)(a1 + 40);
  [v2 _performDownloadsWithScheduler:0 atDate:v3 forced:v4 completion:v5];
}

uint64_t __55__ENDownloadManager_performDownloadsForced_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performDownloadsAtDate:(id)a3 forced:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__ENDownloadManager_performDownloadsAtDate_forced_completion___block_invoke;
  v13[3] = &unk_1E69ADF88;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(queue, v13);
}

void __62__ENDownloadManager_performDownloadsAtDate_forced_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__ENDownloadManager_performDownloadsAtDate_forced_completion___block_invoke_2;
  v4[3] = &unk_1E69ADF38;
  id v5 = *(id *)(a1 + 48);
  [v1 _performDownloadsWithScheduler:0 atDate:v2 forced:v3 completion:v4];
}

uint64_t __62__ENDownloadManager_performDownloadsAtDate_forced_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performDownloadsWithScheduler:(id)a3 atDate:(id)a4 forced:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v10 = a4;
  id v36 = a6;
  if (gLogCategory_ENDownloadManager <= 50
    && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    if (v40) {
      id v11 = "scheduled";
    }
    else {
      id v11 = "immediate";
    }
    if (v7) {
      id v12 = " (forced)";
    }
    else {
      id v12 = "";
    }
    long long v13 = [(ENDownloadManagerState *)self->_state endpoints];
    v33 = v12;
    uint64_t v34 = [v13 count];
    v32 = v11;
    LogPrintF_safe();
  }
  group = dispatch_group_create();
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = [(ENDownloadManagerState *)self->_state endpointStates];
  uint64_t v43 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v43)
  {
    uint64_t v42 = *(void *)v53;
    BOOL v38 = v7;
    id v37 = v10;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v53 != v42) {
          objc_enumerationMutation(obj);
        }
        BOOL v16 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        objc_msgSend(v10, "timeIntervalSinceReferenceDate", v32, v33, v34, v35);
        if (-[ENDownloadManager _shouldFetchFromEndpointWithState:time:](self, "_shouldFetchFromEndpointWithState:time:", v16)|| (int v17 = "Skipping", v7))
        {
          int v18 = +[ENDownloadTask taskWithEndpointState:v16 date:v10 group:group scheduler:v40];
          [v16 setLastFetchAttemptDate:v10];
          dispatch_group_enter(group);
          [v14 addObject:v18];

          int v17 = "Initiating";
        }
        if (gLogCategory_ENDownloadManager <= 50
          && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
        {
          v19 = [v16 shortIdentifier];
          uint64_t v20 = [v16 endpoint];
          [v20 downloadInterval];
          CUPrintDurationDouble();
          v22 = int v21 = self;
          uint64_t v23 = [v16 lastFetchAttemptDate];
          [v23 timeIntervalSinceNow];
          CUPrintDurationDouble();
          v35 = uint64_t v34 = (uint64_t)v22;
          v32 = v17;
          v33 = v19;
          LogPrintF_safe();

          self = v21;
          id v10 = v37;
          BOOL v7 = v38;
        }
      }
      uint64_t v43 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v43);
  }

  if ([v14 count])
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v24 = v14;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v49 != v27) {
            objc_enumerationMutation(v24);
          }
          -[ENDownloadManager _downloadIndexWithTask:](self, "_downloadIndexWithTask:", *(void *)(*((void *)&v48 + 1) + 8 * j), v32, v33, v34);
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v26);
    }

    [(ENDownloadManager *)self _saveState];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__ENDownloadManager__performDownloadsWithScheduler_atDate_forced_completion___block_invoke;
  block[3] = &unk_1E69ACB40;
  id v45 = v14;
  long long v46 = self;
  id v47 = v36;
  id v30 = v36;
  id v31 = v14;
  dispatch_group_notify(group, queue, block);
}

uint64_t __77__ENDownloadManager__performDownloadsWithScheduler_atDate_forced_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v3)
  {

    uint64_t v11 = *(void *)(a1 + 48);
LABEL_13:
    uint64_t v12 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 16))(v11, v12);
  }
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  int v6 = 0;
  uint64_t v7 = *(void *)v15;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v2);
      }
      id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
      v5 += objc_msgSend(v9, "downloadCount", (void)v14);
      v6 |= [v9 didDefer];
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v4);

  if (v5 >= 1)
  {
    id v10 = [MEMORY[0x1E4F28EB0] defaultCenter];
    [v10 postNotificationName:@"ENDownloadManagerDownloadsAvailable" object:*(void *)(a1 + 40)];
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if ((v6 & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t v12 = 2;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 16))(v11, v12);
}

- (BOOL)_shouldFetchFromEndpointWithState:(id)a3 time:(double)a4
{
  id v5 = a3;
  int v6 = [v5 endpoint];
  if ([v6 enabled])
  {
    uint64_t v7 = [v5 lastFetchAttemptDate];
    id v8 = v7;
    if (v7)
    {
      [v7 timeIntervalSinceReferenceDate];
      double v10 = v9;
      [v6 downloadInterval];
      BOOL v12 = v10 + v11 * 0.75 < a4;
    }
    else
    {
      BOOL v12 = 1;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)_downloadIndexWithTask:(id)a3
{
  id v4 = a3;
  id v5 = [v4 endpointState];
  int v6 = [v5 endpoint];

  uint64_t v7 = [v6 serverIndexURL];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F18D58]) initWithURL:v7];
  [v8 addValue:@"text/plain" forHTTPHeaderField:@"Accept"];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  URLSession = self->_URLSession;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  long long v16 = __44__ENDownloadManager__downloadIndexWithTask___block_invoke;
  long long v17 = &unk_1E69ADFD8;
  int v18 = self;
  id v19 = v6;
  id v20 = v4;
  CFAbsoluteTime v21 = Current;
  id v11 = v4;
  id v12 = v6;
  long long v13 = [(NSURLSession *)URLSession downloadTaskWithRequest:v8 completionHandler:&v14];
  objc_msgSend(v13, "resume", v14, v15, v16, v17, v18);
}

void __44__ENDownloadManager__downloadIndexWithTask___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  double v10 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__ENDownloadManager__downloadIndexWithTask___block_invoke_2;
  block[3] = &unk_1E69ADFB0;
  id v17 = v8;
  id v18 = *(id *)(a1 + 40);
  id v19 = v9;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 32);
  id v20 = v11;
  uint64_t v21 = v12;
  uint64_t v23 = *(void *)(a1 + 56);
  id v22 = v7;
  id v13 = v7;
  id v14 = v9;
  id v15 = v8;
  dispatch_sync(v10, block);
}

void __44__ENDownloadManager__downloadIndexWithTask___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v17 = v2;
    uint64_t v3 = [v17 statusCode];
    id v4 = [v17 MIMEType];
    if (gLogCategory_ENDownloadManager <= 50
      && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
    {
      id v5 = [*(id *)(a1 + 56) endpointState];
      int v6 = [v5 shortIdentifier];
      CFAbsoluteTimeGetCurrent();
      long long v16 = CUPrintDurationDouble();
      LogPrintF_safe();
    }
    if (v3 == 200)
    {
      id v8 = [v4 lowercaseString];
      int v9 = [v8 isEqualToString:@"text/plain"];

      if (v9)
      {
        uint64_t v11 = *(void *)(a1 + 56);
        double v10 = *(void **)(a1 + 64);
        uint64_t v12 = [*(id *)(a1 + 72) path];
        [v10 _handleIndexFileDownloadFinishedForTask:v11 filePath:v12];
LABEL_15:

        return;
      }
      uint64_t v12 = ENErrorF();
      objc_msgSend(*(id *)(a1 + 64), "_reportErrorMetric:", 2001, v4);
    }
    else
    {
      uint64_t v12 = ENErrorF();
      objc_msgSend(*(id *)(a1 + 64), "_reportErrorMetricForHTTPStatus:forIndexFile:", v3, 1, v3);
    }
    [*(id *)(a1 + 56) finishDeferred:0 error:v12];
    goto LABEL_15;
  }
  if (gLogCategory_ENDownloadManager <= 90
    && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    CUPrintNSError();
    v15 = uint64_t v14 = v7;
    LogPrintF_safe();
  }
  objc_msgSend(*(id *)(a1 + 56), "finishDeferred:error:", 0, *(void *)(a1 + 48), v14, v15);
  id v13 = *(void **)(a1 + 64);

  [v13 _reportErrorMetric:2000];
}

- (id)_baseDirectoryPathForEndpointWithState:(id)a3
{
  directoryURL = self->_directoryURL;
  int v6 = [a3 identifier];
  uint64_t v7 = [v6 UUIDString];
  id v8 = [(NSURL *)directoryURL URLByAppendingPathComponent:v7];
  int v9 = [v8 path];

  if (!v9)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B08] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"ENDownloadManager.m", 482, @"Invalid parameter not satisfying: %@", @"path != nil" object file lineNumber description];
  }

  return v9;
}

- (id)_downloadsDirectoryPathForEndpointState:(id)a3
{
  uint64_t v3 = [(ENDownloadManager *)self _baseDirectoryPathForEndpointWithState:a3];
  id v4 = [v3 stringByAppendingPathComponent:@"Downloads"];

  return v4;
}

- (id)_indexFilePathForEndpointState:(id)a3
{
  uint64_t v3 = [(ENDownloadManager *)self _baseDirectoryPathForEndpointWithState:a3];
  id v4 = [v3 stringByAppendingPathComponent:@"index.txt"];

  return v4;
}

- (BOOL)_copyDownloadedFileAtPath:(id)a3 toPath:(id)a4 removeExisting:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = v9;
  if (v11)
  {
    uint64_t v12 = [v10 stringByDeletingLastPathComponent];
    id v13 = objc_alloc_init(MEMORY[0x1E4F28CC0]);
    if ([v13 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:a6])
    {
      if (v7
        && [v13 fileExistsAtPath:v10]
        && ([v13 removeItemAtPath:v10 error:a6] & 1) == 0)
      {
        if (gLogCategory_ENDownloadManager > 90
          || gLogCategory_ENDownloadManager == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_22;
        }
      }
      else
      {
        if ([v13 copyItemAtPath:v11 toPath:v10 error:a6])
        {
          BOOL v14 = 1;
LABEL_23:

          goto LABEL_24;
        }
        if (gLogCategory_ENDownloadManager > 90
          || gLogCategory_ENDownloadManager == -1 && !_LogCategory_Initialize())
        {
LABEL_22:
          BOOL v14 = 0;
          goto LABEL_23;
        }
      }
    }
    else if (gLogCategory_ENDownloadManager > 90 {
           || gLogCategory_ENDownloadManager == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_22;
    }
    LogPrintF_safe();
    goto LABEL_22;
  }
  if (a6)
  {
    ENErrorF();
    BOOL v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_24:

  return v14;
}

- (void)_handleIndexFileDownloadFinishedForTask:(id)a3 filePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_invalidated)
  {
    id v8 = ENErrorF();
    [v6 finishDeferred:0 error:v8];
  }
  else
  {
    id v8 = [v6 endpointState];
    if (gLogCategory_ENDownloadManager <= 50
      && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
    {
      id v13 = [v6 shortIdentifier];
      id v15 = v7;
      LogPrintF_safe();
    }
    id v9 = -[ENDownloadManager _indexFilePathForEndpointState:](self, "_indexFilePathForEndpointState:", v8, v13, v15);
    id v18 = 0;
    BOOL v10 = [(ENDownloadManager *)self _copyDownloadedFileAtPath:v7 toPath:v9 removeExisting:1 error:&v18];
    id v11 = v18;
    if (v10)
    {
      [(ENDownloadManager *)self _downloadNextFileFromServerWithTask:v6];
    }
    else if (gLogCategory_ENDownloadManager <= 90 {
           && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
    }
    {
      uint64_t v12 = [v6 shortIdentifier];
      id v17 = CUPrintNSError();
      LogPrintF_safe();

      objc_msgSend(v6, "finishDeferred:error:", 0, v11, v12, v17);
    }
    else
    {
      objc_msgSend(v6, "finishDeferred:error:", 0, v11, v14, v16);
    }
  }
}

- (void)_downloadNextFileFromServerWithTask:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_invalidated)
  {
    id v6 = ENErrorF();
    [v5 finishDeferred:0 error:v6];
LABEL_21:

    goto LABEL_22;
  }
  if (![v4 shouldDefer])
  {
    id v6 = [v5 endpointState];
    id v7 = [v6 endpoint];
    id v8 = [(ENDownloadManager *)self _nextFilePathToDownloadWithEndpointState:v6];
    if (v8)
    {
      id v9 = [v7 serverURLForFileWithRelativePath:v8];
      if (v9)
      {
        BOOL v10 = (void *)[objc_alloc(MEMORY[0x1E4F18D58]) initWithURL:v9];
        [v10 setValue:@"application/zip" forHTTPHeaderField:@"Accept"];
        id v11 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v12 = [v11 isSensitiveLoggingAllowed];

        if (v12
          && gLogCategory_ENDownloadManager <= 50
          && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
        {
          id v13 = [v9 absoluteURL];
          id v19 = [v5 shortIdentifier];
          LogPrintF_safe();
        }
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        URLSession = self->_URLSession;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __57__ENDownloadManager__downloadNextFileFromServerWithTask___block_invoke;
        v20[3] = &unk_1E69AE028;
        v20[4] = self;
        id v21 = v5;
        id v22 = v9;
        CFAbsoluteTime v25 = Current;
        id v23 = v8;
        id v24 = v6;
        id v17 = [(NSURLSession *)URLSession downloadTaskWithRequest:v10 completionHandler:v20];
        [v17 resume];
      }
      else
      {
        uint64_t v14 = ENErrorF();
        [v5 finishDeferred:0 error:v14];
      }
    }
    else
    {
      if (gLogCategory_ENDownloadManager <= 50
        && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
      {
        id v18 = [v6 identifier];
        LogPrintF_safe();
      }
      objc_msgSend(v5, "finishDeferred:error:", 0, 0, v18);
    }

    goto LABEL_21;
  }
  [v5 finishDeferred:1 error:0];
LABEL_22:
}

void __57__ENDownloadManager__downloadNextFileFromServerWithTask___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ENDownloadManager__downloadNextFileFromServerWithTask___block_invoke_2;
  block[3] = &unk_1E69AE000;
  id v15 = v8;
  id v16 = *(id *)(a1 + 40);
  id v17 = v9;
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(id *)(a1 + 48);
  uint64_t v23 = *(void *)(a1 + 72);
  id v20 = *(id *)(a1 + 56);
  id v21 = v7;
  id v22 = *(id *)(a1 + 64);
  id v11 = v7;
  id v12 = v9;
  id v13 = v8;
  dispatch_sync(v10, block);
}

void __57__ENDownloadManager__downloadNextFileFromServerWithTask___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v23 = v2;
    uint64_t v3 = [v23 statusCode];
    id v4 = [v23 MIMEType];
    uint64_t v5 = [v23 expectedContentLength];
    if (gLogCategory_ENDownloadManager <= 50)
    {
      uint64_t v6 = v5;
      if (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize())
      {
        id v7 = [*(id *)(a1 + 64) absoluteURL];
        id v8 = [*(id *)(a1 + 40) shortIdentifier];
        CFAbsoluteTimeGetCurrent();
        CUPrintDurationDouble();
        id v21 = v4;
        v19 = uint64_t v22 = v6;
        uint64_t v20 = v3;
        uint64_t v17 = (uint64_t)v7;
        uint64_t v18 = v8;
        LogPrintF_safe();
      }
    }
    if (v3 == 403)
    {
      if (gLogCategory_ENDownloadManager <= 90
        && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(*(id *)(a1 + 40), "shortIdentifier", v17, v18, v19, v20, v21, v22);
        v18 = uint64_t v17 = 403;
        LogPrintF_safe();
      }
      objc_msgSend(*(id *)(a1 + 88), "setLastDownloadedFilePath:", *(void *)(a1 + 72), v17, v18);
      [*(id *)(a1 + 56) _saveState];
      [*(id *)(a1 + 56) _downloadNextFileFromServerWithTask:*(void *)(a1 + 40)];
      goto LABEL_21;
    }
    if (v3 == 200)
    {
      BOOL v10 = [v4 lowercaseString];
      int v11 = [v10 isEqualToString:@"application/zip"];

      if (v11)
      {
        id v12 = *(void **)(a1 + 56);
        uint64_t v13 = *(void *)(a1 + 40);
        uint64_t v14 = *(void *)(a1 + 72);
        id v15 = [*(id *)(a1 + 80) path];
        [v12 _handleFileDownloadFinishedForTask:v13 serverFilePath:v14 downloadedFilePath:v15];

LABEL_21:

        return;
      }
      id v16 = ENErrorF();
      objc_msgSend(*(id *)(a1 + 56), "_reportErrorMetric:", 2003, v4);
    }
    else
    {
      id v16 = ENErrorF();
      objc_msgSend(*(id *)(a1 + 56), "_reportErrorMetricForHTTPStatus:forIndexFile:", v3, 0, v3);
    }
    [*(id *)(a1 + 40) finishDeferred:0 error:v16];

    goto LABEL_21;
  }
  [*(id *)(a1 + 40) finishDeferred:0 error:*(void *)(a1 + 48)];
  id v9 = *(void **)(a1 + 56);

  [v9 _reportErrorMetric:2002];
}

- (void)_handleFileDownloadFinishedForTask:(id)a3 serverFilePath:(id)a4 downloadedFilePath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v8 endpointState];
  if (gLogCategory_ENDownloadManager <= 50
    && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    uint64_t v22 = [v8 shortIdentifier];
    LogPrintF_safe();
  }
  id v12 = objc_msgSend(v9, "pathComponents", v22);
  uint64_t v13 = [v12 componentsJoinedByString:@"_"];

  uint64_t v14 = [(ENDownloadManager *)self _downloadsDirectoryPathForEndpointState:v11];
  id v15 = [v14 stringByAppendingPathComponent:v13];

  id v26 = 0;
  LOBYTE(v13) = [(ENDownloadManager *)self _copyDownloadedFileAtPath:v10 toPath:v15 removeExisting:0 error:&v26];

  id v16 = v26;
  if (v13)
  {
    uint64_t v17 = [v8 date];
    [v11 setLastSuccessfulFetchDate:v17];

    [v11 setLastDownloadedFilePath:v9];
    id v25 = v16;
    BOOL v18 = [(ENDownloadManager *)self _saveStateWithError:&v25];
    id v19 = v25;

    if (!v18
      && gLogCategory_ENDownloadManager <= 90
      && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v20 = [v8 shortIdentifier];
      CUPrintNSError();
      v24 = id v23 = v20;
      LogPrintF_safe();
    }
    objc_msgSend(v8, "incrementDownloadCount", v23, v24);
    [(ENDownloadManager *)self _downloadNextFileFromServerWithTask:v8];
  }
  else
  {
    if (gLogCategory_ENDownloadManager <= 90
      && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
    {
      id v21 = [v8 shortIdentifier];
      CUPrintNSError();
      v24 = id v23 = v21;
      LogPrintF_safe();
    }
    objc_msgSend(v8, "finishDeferred:error:", 0, v16, v23, v24);
    id v19 = v16;
  }
}

- (id)_nextFilePathToDownloadWithEndpointState:(id)a3
{
  id v4 = a3;
  id v5 = [(ENDownloadManager *)self _indexFilePathForEndpointState:v4];
  int v6 = open((const char *)[v5 fileSystemRepresentation], 0);
  if (v6 < 0)
  {
    if (gLogCategory_ENDownloadManager <= 90
      && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
    {
      BOOL v18 = [v4 shortIdentifier];
      __error();
      LogPrintF_safe();
    }
    id v16 = 0;
  }
  else
  {
    int v7 = v6;
    id v8 = [v4 lastDownloadedFilePath];
    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__5;
    uint64_t v34 = __Block_byref_object_dispose__5;
    id v35 = 0;
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__5;
    id v28 = __Block_byref_object_dispose__5;
    id v29 = 0;
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    id v9 = [MEMORY[0x1E4F28B80] whitespaceAndNewlineCharacterSet];
    id v10 = v8;
    id v11 = v4;
    char v12 = ENReadLinesFromFile();
    id v13 = 0;
    close(v7);
    if (v12)
    {
      if (*((unsigned char *)v21 + 24)) {
        uint64_t v14 = v25;
      }
      else {
        uint64_t v14 = v31;
      }
      id v16 = (id)v14[5];
    }
    else
    {
      if (gLogCategory_ENDownloadManager <= 90
        && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
      {
        id v15 = [v11 shortIdentifier];
        id v19 = CUPrintNSError();
        LogPrintF_safe();
      }
      id v16 = 0;
    }

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v30, 8);
  }

  return v16;
}

void __62__ENDownloadManager__nextFilePathToDownloadWithEndpointState___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id obj = [a2 stringByTrimmingCharactersInSet:*(void *)(a1 + 32)];
  if ([obj length])
  {
    id v5 = *(void **)(a1 + 40);
    if (v5
      && !*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
      && [v5 isEqualToString:obj])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      goto LABEL_17;
    }
    int v6 = [*(id *)(a1 + 48) endpoint];
    int v7 = [v6 serverURLForFileWithRelativePath:obj];

    if (v7)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), obj);
LABEL_9:
        *a3 = 1;
        goto LABEL_17;
      }
      uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v10 = *(void *)(v8 + 40);
      id v9 = (id *)(v8 + 40);
      if (!v10)
      {
        objc_storeStrong(v9, obj);
        if (!*(void *)(a1 + 40)) {
          goto LABEL_9;
        }
      }
    }
    else if (gLogCategory_ENDownloadManager <= 90 {
           && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF_safe();
    }
  }
LABEL_17:
}

- (void)purgeAllDownloads
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ENDownloadManager_purgeAllDownloads__block_invoke;
  block[3] = &unk_1E69ACA50;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __38__ENDownloadManager_purgeAllDownloads__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeAllDownloads];
}

- (void)_purgeAllDownloads
{
  if (gLogCategory_ENDownloadManager <= 50
    && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  uint64_t v3 = [MEMORY[0x1E4F1CAD8] set];
  id v4 = [MEMORY[0x1E4F1C9C0] distantPast];
  [(ENDownloadManager *)self _purgeKeepingDownloadsForIdentifiers:v3 expiryDate:v4];

  id v5 = [(ENDownloadManagerState *)self->_state endpoints];
  state = self->_state;
  self->_state = 0;

  [(ENSecureArchiveFileWrapper *)self->_stateFileWrapper close];
  int v7 = [MEMORY[0x1E4F28CC0] defaultManager];
  uint64_t v8 = [(ENSecureArchiveFileWrapper *)self->_stateFileWrapper path];
  id v12 = 0;
  char v9 = [v7 removeItemAtPath:v8 error:&v12];
  id v10 = v12;

  if ((v9 & 1) == 0
    && gLogCategory__ENDownloadManager <= 90
    && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    id v11 = CUPrintNSError();
    LogPrintF_safe();
  }
  -[ENDownloadManager _setDownloadEndpoints:](self, "_setDownloadEndpoints:", v5, v11);
}

- (void)purgeExpiredDownloadsWithDate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__ENDownloadManager_purgeExpiredDownloadsWithDate___block_invoke;
  v7[3] = &unk_1E69ACBE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __51__ENDownloadManager_purgeExpiredDownloadsWithDate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeExpiredDownloadsWithDate:*(void *)(a1 + 40)];
}

- (void)_purgeExpiredDownloadsWithDate:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_state)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA88]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = [(ENDownloadManagerState *)self->_state endpointStates];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v16 = v4;
      char v9 = 0;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v13 = [v12 endpoint];
          int v14 = [v13 enabled];

          if (v14)
          {
            id v15 = [v12 identifier];
            [v5 addObject:v15];
          }
          else
          {
            [v12 setLastDownloadedFilePath:0];
            char v9 = 1;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);

      id v4 = v16;
      [(ENDownloadManager *)self _purgeKeepingDownloadsForIdentifiers:v5 expiryDate:v16];
      if (v9) {
        [(ENDownloadManager *)self _saveState];
      }
    }
    else
    {

      [(ENDownloadManager *)self _purgeKeepingDownloadsForIdentifiers:v5 expiryDate:v4];
    }
  }
  else if (gLogCategory__ENDownloadManager <= 90 {
         && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
}

- (void)_purgeKeepingDownloadsForIdentifiers:(id)a3 expiryDate:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v28 = a4;
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F28CC0]);
  id v29 = self;
  [v6 enumeratorAtURL:self->_directoryURL includingPropertiesForKeys:0 options:1 errorHandler:0];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v46 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v11 = (void *)MEMORY[0x1D9439DC0]();
        LOBYTE(v39[0]) = 0;
        id v12 = [v10 path];
        int v13 = [v6 fileExistsAtPath:v12 isDirectory:v39];
        if (LOBYTE(v39[0])) {
          int v14 = v13;
        }
        else {
          int v14 = 0;
        }
        if (v14 == 1)
        {
          id v15 = [v10 path];
          id v16 = [v15 lastPathComponent];

          long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F29120]) initWithUUIDString:v16];
          if (v17 && ([v31 containsObject:v17] & 1) == 0) {
            [v30 addObject:v10];
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v7);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v18 = v30;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v42 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        if (gLogCategory_ENDownloadManager <= 50
          && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
        {
          uint64_t v27 = objc_msgSend(v22, "path", v27);
          LogPrintF_safe();
        }
        id v40 = 0;
        char v23 = objc_msgSend(v6, "removeItemAtURL:error:", v22, &v40, v27);
        id v24 = v40;
        if ((v23 & 1) == 0
          && gLogCategory__ENDownloadManager <= 90
          && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
        {
          uint64_t v27 = CUPrintNSError();
          LogPrintF_safe();
        }
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v19);
  }

  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0;
  id v37 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __69__ENDownloadManager__purgeKeepingDownloadsForIdentifiers_expiryDate___block_invoke;
  v33[3] = &unk_1E69AE078;
  id v35 = v39;
  id v25 = v28;
  id v34 = v25;
  id v36 = v38;
  [(ENDownloadManager *)v29 _enumerateDownloadsWithError:&v37 handler:v33];
  id v26 = v37;
  if (gLogCategory_ENDownloadManager <= 50
    && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v39, 8);
}

uint64_t __69__ENDownloadManager__purgeKeepingDownloadsForIdentifiers_expiryDate___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  ++*(void *)(*(void *)(a1[5] + 8) + 24);
  id v13 = 0;
  uint64_t v4 = *MEMORY[0x1E4F1C510];
  id v12 = 0;
  char v5 = [v3 getResourceValue:&v13 forKey:v4 error:&v12];
  id v6 = v13;
  id v7 = v12;
  if ((v5 & 1) == 0)
  {
    if (gLogCategory__ENDownloadManager <= 90
      && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
    {
      id v11 = CUPrintNSError();
      LogPrintF_safe();
    }
    goto LABEL_14;
  }
  if (!v6)
  {
    if (gLogCategory__ENDownloadManager <= 90
      && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    goto LABEL_14;
  }
  id v8 = [v6 earlierDate:a1[4]];

  if (v8 != v6)
  {
LABEL_14:
    uint64_t v9 = 2;
    goto LABEL_15;
  }
  ++*(void *)(*(void *)(a1[6] + 8) + 24);
  uint64_t v9 = 1;
LABEL_15:

  return v9;
}

- (BOOL)resetStateFile
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CC0]);
  directoryURL = self->_directoryURL;
  if (directoryURL)
  {
    char v5 = [(NSURL *)directoryURL URLByAppendingPathComponent:@"state.dat"];
    id v6 = [v5 path];

    if (v6)
    {
      id v13 = 0;
      char v7 = [v3 removeItemAtPath:v6 error:&v13];
      id v8 = v13;
      if (v7)
      {
        state = self->_state;
        self->_state = 0;

        [(ENSecureArchiveFileWrapper *)self->_stateFileWrapper close];
        if (gLogCategory_ENDownloadManager <= 50
          && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        BOOL v10 = 1;
        goto LABEL_9;
      }
      if (gLogCategory__ENDownloadManager <= 90
        && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
      {
        id v12 = CUPrintNSError();
        LogPrintF_safe();
      }
    }
    else
    {
      if (gLogCategory__ENDownloadManager <= 90
        && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      id v8 = 0;
    }
    BOOL v10 = 0;
LABEL_9:

    goto LABEL_10;
  }
  if (gLogCategory__ENDownloadManager <= 90
    && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  BOOL v10 = 0;
LABEL_10:

  return v10;
}

- (void)_updateFetchSchedule
{
  pendingEndpoints = self->_pendingEndpoints;
  if (pendingEndpoints)
  {
    uint64_t v4 = pendingEndpoints;
  }
  else
  {
    uint64_t v4 = [(ENDownloadManagerState *)self->_state endpoints];
  }
  char v5 = v4;
  if (!self->_fetchScheduler && ([(NSArray *)v4 count] || !self->_didUnscheduleOnce))
  {
    id v6 = [(ENDownloadManager *)self createScheduler];
    fetchScheduler = self->_fetchScheduler;
    self->_fetchScheduler = v6;

    [(NSBackgroundActivityScheduler *)self->_fetchScheduler setQualityOfService:17];
    [(NSBackgroundActivityScheduler *)self->_fetchScheduler setInterval:1.79769313e308];
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E4F14138], 1);
    xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E4F14338], 1);
    xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E4F14320], 1);
    [(NSBackgroundActivityScheduler *)self->_fetchScheduler _setAdditionalXPCActivityProperties:v8];
  }
  if ([(NSArray *)v5 count])
  {
    [(ENDownloadManager *)self _aggregateDownloadIntervalFromEndpoints:v5];
    double v10 = v9;
    [(NSBackgroundActivityScheduler *)self->_fetchScheduler interval];
    if (v11 != v10)
    {
      if (gLogCategory_ENDownloadManager <= 50
        && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
      {
        id v12 = [(NSBackgroundActivityScheduler *)self->_fetchScheduler identifier];
        uint64_t v20 = CUPrintDurationDouble();
        uint64_t v21 = [(NSArray *)v5 count];
        uint64_t v19 = v12;
        LogPrintF_safe();
      }
      -[NSBackgroundActivityScheduler setInterval:](self->_fetchScheduler, "setInterval:", v10, v19, v20, v21);
      [(NSBackgroundActivityScheduler *)self->_fetchScheduler setTolerance:v10 * 0.25];
      [(NSBackgroundActivityScheduler *)self->_fetchScheduler setRepeats:1];
      int v14 = self->_queue;
      id location = 0;
      objc_initWeak(&location, self);
      id v15 = self->_fetchScheduler;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __41__ENDownloadManager__updateFetchSchedule__block_invoke;
      v22[3] = &unk_1E69AE0A0;
      objc_copyWeak(&v24, &location);
      id v16 = v14;
      char v23 = v16;
      [(NSBackgroundActivityScheduler *)v15 scheduleWithBlock:v22];

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v13 = self->_fetchScheduler;
    if (v13)
    {
      if (gLogCategory_ENDownloadManager <= 50)
      {
        if (gLogCategory_ENDownloadManager != -1 || (int v17 = _LogCategory_Initialize(), v13 = self->_fetchScheduler, v17))
        {
          uint64_t v19 = [(NSBackgroundActivityScheduler *)v13 identifier];
          LogPrintF_safe();

          id v13 = self->_fetchScheduler;
        }
      }
      [(NSBackgroundActivityScheduler *)v13 invalidate];
      id v18 = self->_fetchScheduler;
      self->_fetchScheduler = 0;

      self->_didUnscheduleOnce = 1;
    }
  }
}

void __41__ENDownloadManager__updateFetchSchedule__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = *(NSObject **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__ENDownloadManager__updateFetchSchedule__block_invoke_2;
    v7[3] = &unk_1E69ACF50;
    id v8 = WeakRetained;
    id v9 = v3;
    dispatch_async(v6, v7);
  }
  else
  {
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1);
  }
}

uint64_t __41__ENDownloadManager__updateFetchSchedule__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _backgroundActivityFiredWithCompletion:*(void *)(a1 + 40)];
}

- (void)_backgroundActivityFiredWithCompletion:(id)a3
{
  id v6 = (void (**)(id, uint64_t))a3;
  if (gLogCategory_ENDownloadManager <= 50
    && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  uint64_t v4 = self->_fetchScheduler;
  if (v4)
  {
    [(ENDownloadManager *)self _update];
    char v5 = [MEMORY[0x1E4F1C9C0] date];
    [(ENDownloadManager *)self _performDownloadsWithScheduler:v4 atDate:v5 forced:0 completion:v6];
  }
  else
  {
    if (gLogCategory_ENDownloadManager <= 50
      && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v6[2](v6, 1);
  }
}

- (double)_aggregateDownloadIntervalFromEndpoints:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  double v5 = 86400.0;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v14;
    double v8 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 enabled])
        {
          [v10 downloadInterval];
          if (v11 < v8) {
            double v8 = v11;
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
    if (v8 <= 28800.0)
    {
      double v5 = 28800.0;
      if (v8 <= 14400.0) {
        double v5 = dbl_1D3A7B2E0[v8 > 7200.0];
      }
    }
  }

  return v5;
}

- (BOOL)_readStateIfNecessaryWithError:(id *)a3
{
  if (self->_state)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    uint64_t v7 = [(NSURL *)self->_directoryURL path];
    if (!v7)
    {
      long long v15 = [MEMORY[0x1E4F28B08] currentHandler];
      [v15 handleFailureInMethod:a2, self, @"ENDownloadManager.m", 991, @"Invalid parameter not satisfying: %@", @"directoryPath != nil" object file lineNumber description];
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F28CC0]);
    if ([v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:a3])
    {
      if (![(NSURL *)self->_directoryURL setResourceValue:MEMORY[0x1E4F1CC30] forKey:*MEMORY[0x1E4F1C638] error:a3]&& gLogCategory_ENDownloadManager <= 90&& (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      stateFileWrapper = self->_stateFileWrapper;
      id v16 = 0;
      BOOL v3 = [(ENSecureArchiveFileWrapper *)stateFileWrapper readObject:&v16 ofClass:objc_opt_class() error:a3];
      id v10 = v16;
      double v11 = v10;
      if (v3)
      {
        if (v10) {
          id v12 = (ENDownloadManagerState *)v10;
        }
        else {
          id v12 = objc_alloc_init(ENDownloadManagerState);
        }
        state = self->_state;
        self->_state = v12;
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)_saveState
{
  id v6 = 0;
  BOOL v2 = [(ENDownloadManager *)self _saveStateWithError:&v6];
  id v3 = v6;
  if (!v2
    && gLogCategory_ENDownloadManager <= 90
    && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    double v5 = CUPrintNSError();
    LogPrintF_safe();
  }
  return v2;
}

- (BOOL)_saveStateWithError:(id *)a3
{
  state = self->_state;
  return !state
      || [(ENSecureArchiveFileWrapper *)self->_stateFileWrapper saveObject:state error:a3];
}

- (id)createScheduler
{
  BOOL v2 = (void *)[objc_alloc(MEMORY[0x1E4F28B30]) initWithIdentifier:@"com.apple.ExposureNotification.periodicDownload"];

  return v2;
}

- (id)description
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [(ENDownloadManager *)self state];
  id v3 = [v2 endpointStates];

  uint64_t v4 = [v3 count];
  id v34 = 0;
  double v5 = "s";
  if (v4 == 1) {
    double v5 = "";
  }
  uint64_t v23 = v4;
  uint64_t v27 = v5;
  NSAppendPrintF_safe();
  id v6 = v34;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v3;
  uint64_t v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16, v23, v27);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "endpoint", v24);
        id v25 = [v12 region];
        NSAppendPrintF_safe();
        id v13 = v6;

        if ((objc_msgSend(v12, "enabled", v25) & 1) == 0)
        {
          NSAppendPrintF_safe();
          id v14 = v13;

          id v13 = v14;
        }
        uint64_t v15 = [v11 lastFetchAttemptDate];
        uint64_t v16 = [v11 lastSuccessfulFetchDate];
        if (v15 | v16)
        {
          [(id)v15 timeIntervalSinceNow];
          uint64_t v18 = -v17;
          [(id)v16 timeIntervalSinceNow];
          uint64_t v26 = v18;
          uint64_t v28 = -v19;
          NSAppendPrintF();
          id v20 = v13;

          id v13 = v20;
        }
        uint64_t v21 = objc_msgSend(v12, "serverBaseURL", v26, v28);
        id v24 = [v21 absoluteString];
        NSAppendPrintF_safe();
        id v6 = v13;
      }
      uint64_t v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16, v24);
    }
    while (v8);
  }

  return v6;
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (id)errorMetricReporter
{
  return self->_errorMetricReporter;
}

- (void)setErrorMetricReporter:(id)a3
{
}

- (NSBackgroundActivityScheduler)fetchScheduler
{
  return self->_fetchScheduler;
}

- (NSURLSession)URLSession
{
  return self->_URLSession;
}

- (void)setURLSession:(id)a3
{
}

- (ENDownloadManagerState)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_fetchScheduler, 0);
  objc_storeStrong(&self->_errorMetricReporter, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
  objc_storeStrong((id *)&self->_stateFileWrapper, 0);
  objc_storeStrong((id *)&self->_pendingEndpoints, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end