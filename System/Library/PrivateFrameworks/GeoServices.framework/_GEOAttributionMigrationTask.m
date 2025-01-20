@interface _GEOAttributionMigrationTask
- (BOOL)_hasExistingUsableDownloadForURL:(id)a3 withChecksum:(id)a4;
- (GEOActiveTileGroupMigrationTaskOptions)options;
- (NSObject)transaction;
- (NSProgress)progress;
- (_GEOAttributionMigrationTask)init;
- (_GEOAttributionMigrationTask)initWithMigrator:(id)a3 manifestConfiguration:(id)a4 newTileGroup:(id)a5 inResourceManifest:(id)a6 oldTileGroup:(id)a7 dataSet:(id)a8;
- (int64_t)estimatedWeight;
- (void)_finishWithError:(id)a3;
- (void)_finishedAllTasks;
- (void)_startWithCompletionHandler:(id)a3 callbackQueue:(id)a4;
- (void)cancel;
- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4;
- (void)removeOldData:(id)a3;
- (void)setOptions:(id)a3;
- (void)setTransaction:(id)a3;
- (void)startWithCompletionHandler:(id)a3 callbackQueue:(id)a4;
@end

@implementation _GEOAttributionMigrationTask

- (_GEOAttributionMigrationTask)init
{
  result = (_GEOAttributionMigrationTask *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (_GEOAttributionMigrationTask)initWithMigrator:(id)a3 manifestConfiguration:(id)a4 newTileGroup:(id)a5 inResourceManifest:(id)a6 oldTileGroup:(id)a7 dataSet:(id)a8
{
  id v14 = a3;
  id v27 = a4;
  id v26 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)_GEOAttributionMigrationTask;
  v18 = [(_GEOAttributionMigrationTask *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_migrator, v14);
    objc_storeStrong((id *)&v19->_manifestConfiguration, a4);
    objc_storeStrong((id *)&v19->_newTileGroup, a5);
    objc_storeStrong((id *)&v19->_resourceManifest, a6);
    objc_storeStrong((id *)&v19->_oldTileGroup, a7);
    objc_storeStrong((id *)&v19->_dataSetDescription, a8);
    uint64_t v20 = geo_dispatch_queue_create();
    workQueue = v19->_workQueue;
    v19->_workQueue = (OS_dispatch_queue *)v20;

    uint64_t v22 = +[GEOReportedProgress progressWithTotalUnitCount:](GEOReportedProgress, "progressWithTotalUnitCount:", -1, v26, v27);
    progress = v19->_progress;
    v19->_progress = (GEOReportedProgress *)v22;

    v24 = v19;
  }

  return v19;
}

- (int64_t)estimatedWeight
{
  return 0;
}

- (NSProgress)progress
{
  return [(GEOReportedProgress *)self->_progress progress];
}

- (void)startWithCompletionHandler:(id)a3 callbackQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73___GEOAttributionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke;
  block[3] = &unk_1E53D8E18;
  id v12 = v7;
  id v13 = v6;
  block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (BOOL)_hasExistingUsableDownloadForURL:(id)a3 withChecksum:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a3 lastPathComponent];
  v8 = [(NSURL *)self->_destinationDirectory URLByAppendingPathComponent:v7];
  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v10 = [v8 path];
  int v11 = [v9 fileExistsAtPath:v10];

  if (v11)
  {
    if (v6)
    {
      id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v8 options:1 error:0];
      id v13 = objc_msgSend(v12, "_geo_SHA256Hash");
      int v14 = [v13 isEqualToData:v6];
      id v15 = GEOGetResourceManifestLog();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
      if (v14)
      {
        if (v16)
        {
          int v19 = 138543362;
          uint64_t v20 = v7;
          id v17 = "[Attribution] Existing file %{public}@ matches expected checksum";
LABEL_10:
          _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v19, 0xCu);
        }
      }
      else if (v16)
      {
        int v19 = 138543362;
        uint64_t v20 = v7;
        id v17 = "[Attribution] Existing file %{public}@ does not match expected checksum";
        goto LABEL_10;
      }

      goto LABEL_12;
    }
    LOBYTE(v14) = 1;
  }
  else
  {
    LOBYTE(v14) = 0;
  }
LABEL_12:

  return v14;
}

- (void)_startWithCompletionHandler:(id)a3 callbackQueue:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v45 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_migrator);
  [WeakRetained _addRunningTask:self];

  v8 = +[GEOFilePaths urlFor:20];
  destinationDirectory = self->_destinationDirectory;
  self->_destinationDirectory = v8;

  objc_storeStrong((id *)&self->_callbackQueue, a4);
  id v46 = v6;
  id v10 = (void *)[v6 copy];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v10;

  id v12 = [MEMORY[0x1E4F1CA80] set];
  id v13 = [MEMORY[0x1E4F1CA80] set];
  id obj = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(GEOTileGroup *)self->_newTileGroup attributionIndexsCount])
  {
    uint64_t v14 = 0;
    while (1)
    {
      unint64_t v15 = [(GEOTileGroup *)self->_newTileGroup attributionIndexAtIndex:v14];
      if ([(GEOResources *)self->_resourceManifest attributionsCount] <= v15) {
        break;
      }
      BOOL v16 = [(GEOResources *)self->_resourceManifest attributionAtIndex:v15];
      id v17 = v16;
      if (!self->_dataSetDescription
        || ![v16 hasDataSet]
        || (int v18 = [v17 dataSet],
            v18 == [(GEODataSetDescription *)self->_dataSetDescription identifier]))
      {
        if ([v17 hasPlainTextURL])
        {
          int v19 = (void *)MEMORY[0x1E4F1CB10];
          uint64_t v20 = [v17 plainTextURL];
          uint64_t v21 = [v19 URLWithString:v20];

          if (v21)
          {
            uint64_t v22 = [v21 lastPathComponent];
            if ([v22 length])
            {
              [v12 addObject:v22];
              v23 = [v17 plainTextURLSHA256Checksum];
              BOOL v24 = [(_GEOAttributionMigrationTask *)self _hasExistingUsableDownloadForURL:v21 withChecksum:v23];

              if (!v24)
              {
                [v13 addObject:v21];
                if ([v17 hasPlainTextURLSHA256Checksum])
                {
                  v25 = [v17 plainTextURLSHA256Checksum];
                  [obj setObject:v25 forKey:v21];
                }
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: filename.length > 0", buf, 2u);
            }
          }
        }
      }

      if (++v14 >= [(GEOTileGroup *)self->_newTileGroup attributionIndexsCount]) {
        goto LABEL_19;
      }
    }
    v42 = objc_msgSend(NSString, "stringWithFormat:", @"Attribution index %i outside of list length %lu", v15, -[GEOResources attributionsCount](self->_resourceManifest, "attributionsCount"));
    v43 = GEOGetResourceManifestLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v55 = (uint64_t)v42;
      _os_log_impl(&dword_188D96000, v43, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    [(GEOReportedProgress *)self->_progress setTotalUnitCount:1];
    v44 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:v42];
    [(_GEOAttributionMigrationTask *)self _finishWithError:v44];

    goto LABEL_36;
  }
LABEL_19:
  objc_storeStrong((id *)&self->_allAttributionFilenames, v12);
  objc_storeStrong((id *)&self->_urlToChecksum, obj);
  uint64_t v26 = [v13 count];
  id v27 = GEOGetResourceManifestLog();
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
  if (!v26)
  {
    if (v28)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v27, OS_LOG_TYPE_INFO, "[Attribution] No new plain-text attribution to download. Finished", buf, 2u);
    }

    [(GEOReportedProgress *)self->_progress setTotalUnitCount:1];
    [(_GEOAttributionMigrationTask *)self _finishWithError:0];
LABEL_36:
    v37 = v45;
    v41 = v46;
    goto LABEL_37;
  }
  if (v28)
  {
    uint64_t v29 = [v13 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v55 = v29;
    _os_log_impl(&dword_188D96000, v27, OS_LOG_TYPE_INFO, "[Attribution] Need to load %llu plain-text attributions", buf, 0xCu);
  }

  v30 = [v13 allObjects];
  v31 = objc_msgSend(v30, "_geo_map:", &__block_literal_global_21);

  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __74___GEOAttributionMigrationTask__startWithCompletionHandler_callbackQueue___block_invoke_2;
  v52[3] = &unk_1E53DAAB8;
  v52[4] = self;
  v32 = objc_msgSend(v31, "_geo_map:", v52);
  v33 = (NSMutableArray *)[v32 mutableCopy];
  inProgressTasks = self->_inProgressTasks;
  self->_inProgressTasks = v33;

  [(GEOReportedProgress *)self->_progress setTotalUnitCount:[(NSMutableArray *)self->_inProgressTasks count]];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v35 = self->_inProgressTasks;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v48 objects:v53 count:16];
  v37 = v45;
  if (v36)
  {
    uint64_t v38 = v36;
    uint64_t v39 = *(void *)v49;
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v49 != v39) {
          objc_enumerationMutation(v35);
        }
        [*(id *)(*((void *)&v48 + 1) + 8 * v40++) start];
      }
      while (v38 != v40);
      uint64_t v38 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v38);
  }

  v41 = v46;
LABEL_37:
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49___GEOAttributionMigrationTask__finishWithError___block_invoke;
  v7[3] = &unk_1E53D8998;
  p_finished = &self->_finished;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  GEOOnce((uint64_t)p_finished, v7);
}

- (void)_finishedAllTasks
{
}

- (void)cancel
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38___GEOAttributionMigrationTask_cancel__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)removeOldData:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", a3);
  v5 = [v4 contentsOfDirectoryAtURL:self->_destinationDirectory includingPropertiesForKeys:0 options:0 error:0];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v19;
    *(void *)&long long v8 = 138543362;
    long long v17 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        id v13 = objc_msgSend(v12, "lastPathComponent", v17, (void)v18);
        if ([v13 length])
        {
          if (![(NSSet *)self->_allAttributionFilenames containsObject:v13])
          {
            uint64_t v14 = GEOGetResourceManifestLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v17;
              v23 = v13;
              _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "[Attribution] Removing %{public}@", buf, 0xCu);
            }

            unint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
            [v15 removeItemAtURL:v12 error:0];
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: fileName.length > 0", buf, 2u);
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v16 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
      uint64_t v9 = v16;
    }
    while (v16);
  }
}

- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(NSMutableArray *)self->_inProgressTasks removeObject:v5];
  int64_t v6 = [(GEOReportedProgress *)self->_progress totalUnitCount];
  int64_t v7 = [(GEOReportedProgress *)self->_progress completedUnitCount];
  progress = self->_progress;
  if (v6 <= v7) {
    uint64_t v9 = [(GEOReportedProgress *)progress totalUnitCount];
  }
  else {
    uint64_t v9 = [(GEOReportedProgress *)progress completedUnitCount] + 1;
  }
  [(GEOReportedProgress *)self->_progress setCompletedUnitCount:v9];
  uint64_t v10 = [v5 error];

  if (!v10)
  {
    id v13 = [v5 downloadedFileURL];

    if (!v13)
    {
      uint64_t v11 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"Unexpectedly-missing file URL"];
      goto LABEL_6;
    }
    uint64_t v14 = [v5 originalURLRequest];
    unint64_t v15 = [v14 URL];
    id v12 = [v15 lastPathComponent];

    if (!v12)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: filename != nil", buf, 2u);
      }
      uint64_t v16 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"Unexpectedly-empty file name"];
      [(_GEOAttributionMigrationTask *)self _finishWithError:v16];
      goto LABEL_44;
    }
    uint64_t v16 = [(NSURL *)self->_destinationDirectory URLByAppendingPathComponent:v12];
    long long v17 = GEOGetResourceManifestLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v65 = v12;
      _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_DEBUG, "[Attribution] Finished downloading %{public}@", buf, 0xCu);
    }

    urlToChecksum = self->_urlToChecksum;
    long long v19 = [v5 originalURLRequest];
    long long v20 = [v19 URL];
    long long v21 = [(NSDictionary *)urlToChecksum objectForKeyedSubscript:v20];

    if (v21)
    {
      id v22 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v23 = [v5 downloadedFileURL];
      id v24 = (id)[v22 initWithContentsOfURL:v23];

      if (v24)
      {
        uint64_t v25 = objc_msgSend(v24, "_geo_SHA256Hash");
        if (([v25 isEqualToData:v21] & 1) == 0)
        {
          long long v50 = GEOGetResourceManifestLog();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v65 = v21;
            _os_log_impl(&dword_188D96000, v50, OS_LOG_TYPE_FAULT, "[Attribution] Checksum of downloaded file %{public}@ does not match expected value", buf, 0xCu);
          }

          long long v51 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"Checksum mismatch"];
          [(_GEOAttributionMigrationTask *)self _finishWithError:v51];

          goto LABEL_43;
        }
      }
    }
    uint64_t v26 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v27 = [v16 path];
    int v28 = [v26 fileExistsAtPath:v27];

    if (v28)
    {
      uint64_t v29 = GEOGetResourceManifestLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v65 = v16;
        _os_log_impl(&dword_188D96000, v29, OS_LOG_TYPE_INFO, "[Attribution] File already exists at destination. Will overwrite. (%{public}@)", buf, 0xCu);
      }

      v30 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v61 = 0;
      char v31 = [v30 removeItemAtURL:v16 error:&v61];
      id v24 = v61;

      if ((v31 & 1) == 0)
      {
        long long v48 = GEOGetResourceManifestLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v65 = v24;
          long long v49 = "[Attribution] Error removing existing file at path: %{public}@";
          goto LABEL_38;
        }
LABEL_39:

        [(_GEOAttributionMigrationTask *)self _finishWithError:v24];
LABEL_43:

LABEL_44:
        goto LABEL_45;
      }
    }
    unsigned __int8 v60 = 0;
    v32 = [MEMORY[0x1E4F28CB8] defaultManager];
    v33 = [(NSURL *)self->_destinationDirectory path];
    int v34 = [v32 fileExistsAtPath:v33 isDirectory:&v60];
    int v35 = v60;

    if (!v34 || !v35)
    {
      uint64_t v36 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v36 createDirectoryAtURL:self->_destinationDirectory withIntermediateDirectories:1 attributes:0 error:0];
    }
    v37 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v38 = [v5 downloadedFileURL];
    id v59 = 0;
    char v39 = [v37 moveItemAtURL:v38 toURL:v16 error:&v59];
    id v24 = v59;

    if (v39)
    {
      uint64_t v56 = v21;
      uint64_t v40 = [MEMORY[0x1E4F28CB8] defaultManager];
      v41 = [v16 path];
      id v58 = 0;
      v42 = [v40 attributesOfItemAtPath:v41 error:&v58];
      id v43 = v58;

      if (!v43)
      {
        uint64_t v44 = *MEMORY[0x1E4F28330];
        id v45 = [v42 objectForKeyedSubscript:*MEMORY[0x1E4F28330]];
        uint64_t v46 = [v45 isEqualToNumber:&unk_1ED73D5D0];

        if ((v46 & 1) == 0)
        {
          uint64_t v52 = *MEMORY[0x1E4F28378];
          v62[0] = *MEMORY[0x1E4F28370];
          v62[1] = v44;
          v63[0] = v52;
          v63[1] = &unk_1ED73D5D0;
          v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];

          v53 = [MEMORY[0x1E4F28CB8] defaultManager];
          v54 = [v16 path];
          id v57 = 0;
          [v53 setAttributes:v47 ofItemAtPath:v54 error:&v57];
          id v43 = v57;

          if (v43)
          {
            uint64_t v55 = GEOGetResourceManifestLog();
            long long v21 = v56;
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v65 = v43;
              _os_log_impl(&dword_188D96000, v55, OS_LOG_TYPE_ERROR, "[Attribution] Couldn't set permissions for attribution file: %{public}@", buf, 0xCu);
            }

            goto LABEL_30;
          }
LABEL_29:
          long long v21 = v56;
LABEL_30:
          if (![(NSMutableArray *)self->_inProgressTasks count]) {
            [(_GEOAttributionMigrationTask *)self _finishedAllTasks];
          }

          goto LABEL_43;
        }
        id v43 = 0;
      }
      v47 = v42;
      goto LABEL_29;
    }
    long long v48 = GEOGetResourceManifestLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v65 = v24;
      long long v49 = "[Attribution] Failed to move downloaded file to destination: %{public}@";
LABEL_38:
      _os_log_impl(&dword_188D96000, v48, OS_LOG_TYPE_ERROR, v49, buf, 0xCu);
      goto LABEL_39;
    }
    goto LABEL_39;
  }
  uint64_t v11 = [v5 error];
LABEL_6:
  id v12 = (void *)v11;
  [(_GEOAttributionMigrationTask *)self _finishWithError:v11];
LABEL_45:
}

- (GEOActiveTileGroupMigrationTaskOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSObject)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlToChecksum, 0);
  objc_storeStrong((id *)&self->_allAttributionFilenames, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_destinationDirectory, 0);
  objc_storeStrong((id *)&self->_inProgressTasks, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_dataSetDescription, 0);
  objc_storeStrong((id *)&self->_oldTileGroup, 0);
  objc_storeStrong((id *)&self->_resourceManifest, 0);
  objc_storeStrong((id *)&self->_newTileGroup, 0);
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);

  objc_destroyWeak((id *)&self->_migrator);
}

@end