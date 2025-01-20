@interface _GEOSearchAttributionManifestVersionMigrationTask
- (GEOActiveTileGroupMigrationTaskOptions)options;
- (NSObject)transaction;
- (NSProgress)progress;
- (_GEOSearchAttributionManifestVersionMigrationTask)init;
- (_GEOSearchAttributionManifestVersionMigrationTask)initWithMigrator:(id)a3 newSearchAttributionManifestURL:(id)a4 oldTileGroup:(id)a5;
- (int64_t)estimatedWeight;
- (void)_completeWithError:(id)a3;
- (void)_handleResponse:(id)a3 withData:(id)a4 error:(id)a5;
- (void)cancel;
- (void)dealloc;
- (void)removeOldData:(id)a3;
- (void)setOptions:(id)a3;
- (void)setTransaction:(id)a3;
- (void)startWithCompletionHandler:(id)a3 callbackQueue:(id)a4;
@end

@implementation _GEOSearchAttributionManifestVersionMigrationTask

- (_GEOSearchAttributionManifestVersionMigrationTask)init
{
  result = (_GEOSearchAttributionManifestVersionMigrationTask *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (_GEOSearchAttributionManifestVersionMigrationTask)initWithMigrator:(id)a3 newSearchAttributionManifestURL:(id)a4 oldTileGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)_GEOSearchAttributionManifestVersionMigrationTask;
  v11 = [(_GEOSearchAttributionManifestVersionMigrationTask *)&v25 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_migrator, v8);
    uint64_t v13 = geo_dispatch_queue_create_with_workloop_qos();
    workQueue = v12->_workQueue;
    v12->_workQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = [v9 copy];
    newSearchAttributionManifestURL = v12->_newSearchAttributionManifestURL;
    v12->_newSearchAttributionManifestURL = (NSURL *)v15;

    objc_storeStrong((id *)&v12->_oldTileGroup, a5);
    uint64_t v17 = +[GEOReportedProgress progressWithTotalUnitCount:1];
    progress = v12->_progress;
    v12->_progress = (GEOReportedProgress *)v17;

    [(GEOReportedProgress *)v12->_progress setKind:*MEMORY[0x1E4F28898]];
    objc_initWeak(&location, v12);
    v19 = v12->_progress;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __115___GEOSearchAttributionManifestVersionMigrationTask_initWithMigrator_newSearchAttributionManifestURL_oldTileGroup___block_invoke;
    v22[3] = &unk_1E53D7B90;
    objc_copyWeak(&v23, &location);
    [(GEOReportedProgress *)v19 setCancellationHandler:v22];
    v20 = v12;
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)dealloc
{
  [(NSURLSession *)self->_urlSession invalidateAndCancel];
  v3.receiver = self;
  v3.super_class = (Class)_GEOSearchAttributionManifestVersionMigrationTask;
  [(_GEOSearchAttributionManifestVersionMigrationTask *)&v3 dealloc];
}

- (int64_t)estimatedWeight
{
  return 1;
}

- (NSProgress)progress
{
  return [(GEOReportedProgress *)self->_progress progress];
}

- (void)startWithCompletionHandler:(id)a3 callbackQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_running = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_migrator);
  [WeakRetained _addRunningTask:self];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94___GEOSearchAttributionManifestVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke;
  block[3] = &unk_1E53D8E18;
  id v13 = v7;
  id v14 = v6;
  block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(workQueue, block);
}

- (void)_handleResponse:(id)a3 withData:(id)a4 error:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (GEOSearchAttributionManifest *)a5;
  downloadTask = self->_downloadTask;
  self->_downloadTask = 0;

  requestCounterTicket = self->_requestCounterTicket;
  self->_requestCounterTicket = 0;

  if (v10)
  {
    id v13 = [(GEOSearchAttributionManifest *)v10 domain];
    if ([v13 isEqualToString:*MEMORY[0x1E4F289A0]])
    {
      uint64_t v14 = [(GEOSearchAttributionManifest *)v10 code];

      if (v14 == -999)
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = -2;
        uint64_t v17 = 0;
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  if (!v9)
  {
    v19 = 0;
    goto LABEL_12;
  }
  v18 = [[GEOSearchAttributionManifest alloc] initWithData:v9];
  if (v18)
  {
    v19 = v18;
    goto LABEL_12;
  }
  uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v17 = @"Could not parse attribution manifest";
  uint64_t v16 = -11;
LABEL_11:
  uint64_t v20 = [v15 GEOErrorWithCode:v16 reason:v17];

  v19 = 0;
  id v10 = (GEOSearchAttributionManifest *)v20;
LABEL_12:
  [(GEORequestCounterTicket *)self->_requestCounterTicket requestCompleted:v10];
  if (v10)
  {
    v21 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v10;
      _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_ERROR, "[SearchAttributionManifest] Failed to load new attribution manifest: %{public}@", buf, 0xCu);
    }

    [(_GEOSearchAttributionManifestVersionMigrationTask *)self _completeWithError:v10];
  }
  else
  {
    [(GEOSearchAttributionManifest *)v19 setTimestamp:CFAbsoluteTimeGetCurrent()];
    v22 = [v8 URL];
    id v23 = [v22 absoluteString];
    [(GEOSearchAttributionManifest *)v19 setSourceURL:v23];

    v24 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_INFO, "[SearchAttributionManifest] Received valid new search attribution manifest.", buf, 2u);
    }

    objc_super v25 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v19;
      _os_log_impl(&dword_188D96000, v25, OS_LOG_TYPE_DEBUG, "[SearchAttributionManifest] New search attribution manifest: %{public}@", buf, 0xCu);
    }

    v26 = +[GEOFilePaths pathFor:30];
    v27 = [v26 stringByDeletingLastPathComponent];

    v28 = [MEMORY[0x1E4F28CB8] defaultManager];
    buf[0] = 0;
    if (![v28 fileExistsAtPath:v27 isDirectory:buf] || !buf[0]) {
      [v28 createDirectoryAtPath:v27 withIntermediateDirectories:1 attributes:0 error:0];
    }
    v29 = [(GEOSearchAttributionManifest *)v19 data];
    v30 = +[GEOFilePaths pathFor:30];
    id v32 = 0;
    int v31 = [v29 writeToFile:v30 options:268435457 error:&v32];
    id v10 = (GEOSearchAttributionManifest *)v32;

    if (v31)
    {
      notify_post(GEOSearchAttributionManifestUpdatedDarwinNotificationName);
      objc_storeStrong((id *)&self->_attributionManifest, v19);
    }
    [(_GEOSearchAttributionManifestVersionMigrationTask *)self _completeWithError:v10];
  }
}

- (void)cancel
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59___GEOSearchAttributionManifestVersionMigrationTask_cancel__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_completeWithError:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C120660](self->_completionHandler);
  id v6 = self->_callbackQueue;
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  callbackQueue = self->_callbackQueue;
  self->_callbackQueue = 0;

  [(GEOReportedProgress *)self->_progress setCompletedUnitCount:[(GEOReportedProgress *)self->_progress totalUnitCount]];
  if (v5 && v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72___GEOSearchAttributionManifestVersionMigrationTask__completeWithError___block_invoke;
    v10[3] = &unk_1E53D7C50;
    id v12 = v5;
    id v11 = v4;
    dispatch_async((dispatch_queue_t)v6, v10);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_migrator);
  [WeakRetained _removeRunningTask:self];
}

- (void)removeOldData:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  objc_super v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = +[GEOFilePaths pathFor:16];
  v5 = [v3 contentsOfDirectoryAtPath:v4 error:0];

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  obuint64_t j = v5;
  uint64_t v40 = [obj countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v40)
  {
    uint64_t v38 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v67 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v66 + 1) + 8 * i);
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v8 = -[GEOSearchAttributionManifest searchAttributionSources]((id *)&self->_attributionManifest->super.super.isa);
        uint64_t v48 = [v8 countByEnumeratingWithState:&v62 objects:v75 count:16];
        if (!v48)
        {

LABEL_43:
          id v32 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v71 = v7;
            _os_log_impl(&dword_188D96000, v32, OS_LOG_TYPE_DEBUG, "[SearchAttributionManifest] Removing %{public}@", buf, 0xCu);
          }

          v33 = [MEMORY[0x1E4F28CB8] defaultManager];
          v34 = +[GEOFilePaths pathFor:16];
          uint64_t v35 = [v34 stringByAppendingPathComponent:v7];
          [v33 removeItemAtPath:v35 error:0];

          continue;
        }
        uint64_t v41 = i;
        id v42 = v8;
        char v9 = 0;
        uint64_t v46 = *(void *)v63;
        do
        {
          for (uint64_t j = 0; j != v48; ++j)
          {
            if (*(void *)v63 != v46) {
              objc_enumerationMutation(v42);
            }
            id v11 = *(id **)(*((void *)&v62 + 1) + 8 * j);
            long long v58 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            id v12 = -[GEOSearchAttributionSource localizedAttributions](v11);
            uint64_t v13 = [v12 countByEnumeratingWithState:&v58 objects:v74 count:16];
            if (v13)
            {
              uint64_t v14 = *(void *)v59;
              char v15 = v9;
              uint64_t v43 = *(void *)v59;
              v49 = v12;
              while (2)
              {
                uint64_t v16 = 0;
                uint64_t v44 = v13;
                do
                {
                  char v47 = v15;
                  if (*(void *)v59 != v14) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v45 = v16;
                  uint64_t v17 = *(id **)(*((void *)&v58 + 1) + 8 * v16);
                  v18 = (void *)MEMORY[0x18C1203C0]();
                  long long v54 = 0u;
                  long long v55 = 0u;
                  long long v56 = 0u;
                  long long v57 = 0u;
                  v19 = -[GEOLocalizedAttribution logoURLs](v17);
                  uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v73 count:16];
                  if (v20)
                  {
                    uint64_t v21 = v20;
                    uint64_t v22 = *(void *)v55;
LABEL_18:
                    uint64_t v23 = 0;
                    while (1)
                    {
                      if (*(void *)v55 != v22) {
                        objc_enumerationMutation(v19);
                      }
                      v24 = [*(id *)(*((void *)&v54 + 1) + 8 * v23) lastPathComponent];
                      char v25 = [v24 isEqualToString:v7];

                      if (v25) {
                        goto LABEL_36;
                      }
                      if (v21 == ++v23)
                      {
                        uint64_t v21 = [v19 countByEnumeratingWithState:&v54 objects:v73 count:16];
                        if (v21) {
                          goto LABEL_18;
                        }
                        break;
                      }
                    }
                  }

                  if (v47) {
                    goto LABEL_37;
                  }
                  v18 = (void *)MEMORY[0x18C1203C0]();
                  long long v50 = 0u;
                  long long v51 = 0u;
                  long long v52 = 0u;
                  long long v53 = 0u;
                  v19 = -[GEOLocalizedAttribution snippetLogoURLs](v17);
                  uint64_t v26 = [v19 countByEnumeratingWithState:&v50 objects:v72 count:16];
                  if (v26)
                  {
                    uint64_t v27 = v26;
                    uint64_t v28 = *(void *)v51;
LABEL_27:
                    uint64_t v29 = 0;
                    while (1)
                    {
                      if (*(void *)v51 != v28) {
                        objc_enumerationMutation(v19);
                      }
                      v30 = [*(id *)(*((void *)&v50 + 1) + 8 * v29) lastPathComponent];
                      char v31 = [v30 isEqualToString:v7];

                      if (v31) {
                        break;
                      }
                      if (v27 == ++v29)
                      {
                        uint64_t v27 = [v19 countByEnumeratingWithState:&v50 objects:v72 count:16];
                        if (v27) {
                          goto LABEL_27;
                        }
                        goto LABEL_33;
                      }
                    }
LABEL_36:

LABEL_37:
                    char v9 = 1;
                    id v12 = v49;
                    goto LABEL_38;
                  }
LABEL_33:

                  char v15 = 0;
                  uint64_t v16 = v45 + 1;
                  uint64_t v14 = v43;
                  id v12 = v49;
                }
                while (v45 + 1 != v44);
                uint64_t v13 = [v49 countByEnumeratingWithState:&v58 objects:v74 count:16];
                char v15 = 0;
                char v9 = 0;
                if (v13) {
                  continue;
                }
                break;
              }
            }
LABEL_38:
          }
          uint64_t v48 = [v42 countByEnumeratingWithState:&v62 objects:v75 count:16];
        }
        while (v48);

        uint64_t i = v41;
        if ((v9 & 1) == 0) {
          goto LABEL_43;
        }
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v40);
  }
}

- (NSObject)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (GEOActiveTileGroupMigrationTaskOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_attributionManifest, 0);
  objc_storeStrong((id *)&self->_requestCounterTicket, 0);
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_oldTileGroup, 0);
  objc_storeStrong((id *)&self->_newSearchAttributionManifestURL, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_destroyWeak((id *)&self->_migrator);
}

@end