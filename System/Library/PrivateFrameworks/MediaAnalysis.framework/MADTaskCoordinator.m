@interface MADTaskCoordinator
- (BOOL)scheduleNextAssetProcessingTask;
- (BOOL)scheduleNextClusterProcessingTask;
- (BOOL)scheduleNextDownloadAssetProcessingTask;
- (MADTaskCoordinator)initWithPhotoLibraries:(id)a3 taskProviderTypes:(id)a4 options:(id)a5 cancelBlock:(id)a6 progressReporter:(id)a7;
- (int)createTaskProvidersWithPhotoLibraries:(id)a3 taskProviderTypes:(id)a4;
- (int)run;
- (unint64_t)taskIDForProviderType:(int64_t)a3;
- (void)dealloc;
- (void)evaluateScheduling;
- (void)executeAssetProcessingTask:(id)a3 fromTaskProvider:(id)a4;
- (void)executeClusterProcessingTask:(id)a3 fromTaskProvider:(id)a4;
- (void)executeDownloadAssetProcessingTask:(id)a3 fromTaskProvider:(id)a4;
@end

@implementation MADTaskCoordinator

- (void)dealloc
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_photoLibraries;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        MediaAnalysisDaemonReleaseSharedDataStores(*(void **)(*((void *)&v9 + 1) + 8 * (void)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)MADTaskCoordinator;
  [(MADTaskCoordinator *)&v8 dealloc];
}

- (unint64_t)taskIDForProviderType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 5) {
    return qword_1001F2360[a3 - 1];
  }
  int v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v5, v6))
    {
      v7[0] = 67109120;
      v7[1] = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Unknown task provider type: %d", (uint8_t *)v7, 8u);
    }
  }
  return 0;
}

- (int)createTaskProvidersWithPhotoLibraries:(id)a3 taskProviderTypes:(id)a4
{
  id v6 = a3;
  id v45 = a4;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
  if (!v7) {
    goto LABEL_43;
  }
  id v9 = v7;
  uint64_t v10 = *(void *)v59;
  os_log_type_t v11 = VCPLogToOSLogType[5];
  uint64_t v12 = VCPLogToOSLogType[4];
  *(void *)&long long v8 = 138412546;
  long long v41 = v8;
  uint64_t v42 = *(void *)v59;
  os_log_type_t v44 = v11;
  *(_DWORD *)type = VCPLogToOSLogType[4];
  do
  {
    v13 = 0;
    id v43 = v9;
    do
    {
      if (*(void *)v59 != v10) {
        objc_enumerationMutation(obj);
      }
      v14 = *(void **)(*((void *)&v58 + 1) + 8 * (void)v13);
      if ([v14 isReadyForAnalysis])
      {
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        v16 = v45;
        id v17 = [v16 countByEnumeratingWithState:&v54 objects:v68 count:16];
        if (!v17) {
          goto LABEL_40;
        }
        v47 = v13;
        uint64_t v18 = *(void *)v55;
        id v19 = v17;
        while (1)
        {
          v20 = 0;
          id v51 = v19;
          do
          {
            if (*(void *)v55 != v18) {
              objc_enumerationMutation(v16);
            }
            signed int v21 = objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * (void)v20), "intValue", v41);
            uint64_t v22 = [(MADTaskCoordinator *)self taskIDForProviderType:v21];
            if (objc_msgSend(v14, "vcp_requiresProcessingForTask:", v22))
            {
              v23 = v16;
              v53[0] = _NSConcreteStackBlock;
              v53[1] = 3221225472;
              v53[2] = sub_10015D7DC;
              v53[3] = &unk_10021EF90;
              v53[5] = v14;
              v53[6] = v22;
              v53[4] = self;
              v24 = objc_retainBlock(v53);
              if (v22 > 9)
              {
                if (v22 == 10)
                {
                  v28 = MADPhotosOCRTaskProvider;
                }
                else
                {
                  if (v22 != 12) {
                    goto LABEL_20;
                  }
                  v28 = MADPhotosVisualSearchTaskProvider;
                }
                v27 = (MADPhotosFaceTaskProvider *)[[v28 alloc] initWithPhotoLibrary:v14 cancelBlock:self->_cancelBlock];
              }
              else
              {
                if (v22 != 1)
                {
                  if (v22 == 3)
                  {
                    v25 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"SkipSyncGallery"];
                    id v26 = [v25 BOOLValue];

                    v27 = [[MADPhotosFaceTaskProvider alloc] initWithPhotoLibrary:v14 skipSyncGallery:v26 cancelBlock:self->_cancelBlock];
                    goto LABEL_29;
                  }
LABEL_20:
                  if ((int)MediaAnalysisLogLevel() >= 4)
                  {
                    VCPLogInstance();
                    v29 = (MADPhotosFullTaskProvider *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(&v29->super.super.super, type[0]))
                    {
                      v30 = objc_opt_class();
                      id v49 = v30;
                      v48 = [v14 photoLibraryURL];
                      uint64_t v31 = [v48 path];
                      *(_DWORD *)buf = 138412802;
                      v63 = v30;
                      __int16 v64 = 2048;
                      uint64_t v65 = v22;
                      __int16 v66 = 2112;
                      uint64_t v67 = v31;
                      v32 = (void *)v31;
                      _os_log_impl((void *)&_mh_execute_header, &v29->super.super.super, type[0], "[%@] Unsupported task type %lu for Library %@; skipping",
                        buf,
                        0x20u);
                    }
LABEL_30:
                  }
                  goto LABEL_31;
                }
                if (v21 == 5)
                {
                  v33 = [[MADPhotosFullTaskProvider alloc] initWithPhotoLibrary:v14 cancelBlock:self->_cancelBlock progressReporter:self->_progressReporter mediaType:1 mediaSubtype:8 imageOnlyAnalysis:0];
                  ((void (*)(void *, MADPhotosFullTaskProvider *))v24[2])(v24, v33);

                  v29 = [[MADPhotosFullTaskProvider alloc] initWithPhotoLibrary:v14 cancelBlock:self->_cancelBlock progressReporter:self->_progressReporter mediaType:2 mediaSubtype:0 imageOnlyAnalysis:0];
                  ((void (*)(void *, MADPhotosFullTaskProvider *))v24[2])(v24, v29);
                  goto LABEL_30;
                }
                if (v21 != 4)
                {
LABEL_31:

                  v16 = v23;
                  id v19 = v51;
                  goto LABEL_32;
                }
                v27 = [[MADPhotosFullTaskProvider alloc] initWithPhotoLibrary:v14 cancelBlock:self->_cancelBlock progressReporter:self->_progressReporter mediaType:1 mediaSubtype:0 imageOnlyAnalysis:1];
              }
LABEL_29:
              v29 = (MADPhotosFullTaskProvider *)v27;
              ((void (*)(void *, MADPhotosFaceTaskProvider *))v24[2])(v24, v27);
              goto LABEL_30;
            }
LABEL_32:
            v20 = (char *)v20 + 1;
          }
          while (v19 != v20);
          id v34 = [v16 countByEnumeratingWithState:&v54 objects:v68 count:16];
          id v19 = v34;
          if (!v34)
          {
            uint64_t v10 = v42;
            id v9 = v43;
            os_log_type_t v11 = v44;
            uint64_t v12 = *(unsigned int *)type;
            v13 = v47;
            goto LABEL_40;
          }
        }
      }
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v16 = VCPLogInstance();
        if (os_log_type_enabled(v16, v11))
        {
          uint64_t v35 = v12;
          v36 = objc_opt_class();
          id v52 = v36;
          v37 = [v14 photoLibraryURL];
          v38 = [v37 path];
          *(_DWORD *)buf = v41;
          v63 = v36;
          uint64_t v12 = v35;
          os_log_type_t v11 = v44;
          __int16 v64 = 2112;
          uint64_t v65 = (uint64_t)v38;
          _os_log_impl((void *)&_mh_execute_header, v16, v44, "[%@] Photo Library %@ is not ready; skipping",
            buf,
            0x16u);
        }
LABEL_40:
      }
      v13 = (char *)v13 + 1;
    }
    while (v13 != v9);
    id v9 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
  }
  while (v9);
LABEL_43:

  if ([(NSMutableArray *)self->_taskProviders count])
  {
    [(NSMutableArray *)self->_taskProviders sortUsingComparator:&stru_10021EFD0];
    int v39 = 0;
  }
  else
  {
    int v39 = -18;
  }

  return v39;
}

- (MADTaskCoordinator)initWithPhotoLibraries:(id)a3 taskProviderTypes:(id)a4 options:(id)a5 cancelBlock:(id)a6 progressReporter:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v52.receiver = self;
  v52.super_class = (Class)MADTaskCoordinator;
  uint64_t v18 = [(MADTaskCoordinator *)&v52 init];
  id v19 = v18;
  if (!v18) {
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v18->_photoLibraries, a3);
  objc_storeStrong((id *)&v19->_options, a5);
  id v20 = objc_retainBlock(v16);
  id cancelBlock = v19->_cancelBlock;
  v19->_id cancelBlock = v20;

  objc_storeStrong((id *)&v19->_progressReporter, a7);
  uint64_t v22 = +[NSMutableArray array];
  taskProviders = v19->_taskProviders;
  v19->_taskProviders = (NSMutableArray *)v22;

  uint64_t v24 = +[NSMutableSet set];
  taskTypes = v19->_taskTypes;
  v19->_taskTypes = (NSMutableSet *)v24;

  if (![(MADTaskCoordinator *)v19 createTaskProvidersWithPhotoLibraries:v13 taskProviderTypes:v14])
  {
    dispatch_queue_t v31 = dispatch_queue_create("MADTaskCoordinator.schedulingQueue", 0);
    schedulingQueue = v19->_schedulingQueue;
    v19->_schedulingQueue = (OS_dispatch_queue *)v31;

    dispatch_group_t v33 = dispatch_group_create();
    schedulingGroup = v19->_schedulingGroup;
    v19->_schedulingGroup = (OS_dispatch_group *)v33;

    dispatch_group_t v35 = dispatch_group_create();
    taskGroup = v19->_taskGroup;
    v19->_taskGroup = (OS_dispatch_group *)v35;

    dispatch_semaphore_t v37 = dispatch_semaphore_create(0);
    completionSemaphore = v19->_completionSemaphore;
    v19->_completionSemaphore = (OS_dispatch_semaphore *)v37;

    dispatch_semaphore_t v39 = dispatch_semaphore_create(1);
    assetTaskPrepareSemaphore = v19->_assetTaskPrepareSemaphore;
    v19->_assetTaskPrepareSemaphore = (OS_dispatch_semaphore *)v39;

    dispatch_semaphore_t v41 = dispatch_semaphore_create(1);
    assetTaskProcessSemaphore = v19->_assetTaskProcessSemaphore;
    v19->_assetTaskProcessSemaphore = (OS_dispatch_semaphore *)v41;

    dispatch_semaphore_t v43 = dispatch_semaphore_create(1);
    assetTaskPublishSemaphore = v19->_assetTaskPublishSemaphore;
    v19->_assetTaskPublishSemaphore = (OS_dispatch_semaphore *)v43;

    dispatch_semaphore_t v45 = dispatch_semaphore_create(1);
    downloadTaskSemaphore = v19->_downloadTaskSemaphore;
    v19->_downloadTaskSemaphore = (OS_dispatch_semaphore *)v45;

    dispatch_semaphore_t v47 = dispatch_semaphore_create(1);
    downloadCompleteSemaphore = v19->_downloadCompleteSemaphore;
    v19->_downloadCompleteSemaphore = (OS_dispatch_semaphore *)v47;

    dispatch_semaphore_t v49 = dispatch_semaphore_create(1);
    clusterTaskSemaphore = v19->_clusterTaskSemaphore;
    v19->_clusterTaskSemaphore = (OS_dispatch_semaphore *)v49;

LABEL_9:
    v30 = v19;
    goto LABEL_10;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v26 = VCPLogInstance();
    os_log_type_t v27 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v26, v27))
    {
      v28 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      long long v54 = v28;
      id v29 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "[%@] Failed to create task providers.", buf, 0xCu);
    }
  }
  v30 = 0;
LABEL_10:

  return v30;
}

- (void)executeAssetProcessingTask:(id)a3 fromTaskProvider:(id)a4
{
  id v6 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10015DE00;
  v11[3] = &unk_100219C10;
  id v12 = a4;
  id v13 = v6;
  id v14 = self;
  id v7 = v6;
  id v8 = v12;
  id v9 = objc_retainBlock(v11);
  [v7 setCancelBlock:self->_cancelBlock];
  dispatch_group_enter((dispatch_group_t)self->_taskGroup);
  uint64_t v10 = +[VCPMADQoSManager sharedManager];
  objc_msgSend(v10, "runAsyncBlock:withTaskID:", v9, objc_msgSend(v8, "taskID"));
}

- (BOOL)scheduleNextAssetProcessingTask
{
  id v3 = [(NSMutableArray *)self->_taskProviders count];
  if (v3)
  {
    uint64_t v5 = 0;
    os_log_type_t v6 = VCPLogToOSLogType[5];
    *(void *)&long long v4 = 138412546;
    long long v21 = v4;
    while (1)
    {
      id v8 = [(NSMutableArray *)self->_taskProviders objectAtIndexedSubscript:self->_assetTaskProviderIdx];
      id v9 = [v8 nextAssetProcessingTask];
      int v10 = MediaAnalysisLogLevel();
      if (v9) {
        break;
      }
      if (v10 >= 5)
      {
        os_log_type_t v11 = VCPLogInstance();
        if (os_log_type_enabled(v11, v6))
        {
          id v12 = [0 uuid];
          unint64_t assetTaskProviderIdx = self->_assetTaskProviderIdx;
          *(_DWORD *)buf = v21;
          v23 = v12;
          __int16 v24 = 1024;
          int v25 = assetTaskProviderIdx;
          _os_log_impl((void *)&_mh_execute_header, v11, v6, "[MADTaskCoordinator] No next asset task (%@) from provider %d", buf, 0x12u);
        }
      }
      unint64_t v14 = self->_assetTaskProviderIdx + 1;
      self->_unint64_t assetTaskProviderIdx = v14 % (unint64_t)[(NSMutableArray *)self->_taskProviders count];
      self->_assetTaskCounter = 0;

      if (++v5 >= (unint64_t)[(NSMutableArray *)self->_taskProviders count])
      {
        LOBYTE(v3) = 0;
        return (char)v3;
      }
    }
    if (v10 >= 5)
    {
      id v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, v6))
      {
        id v16 = [v9 uuid];
        unint64_t v17 = self->_assetTaskProviderIdx;
        *(_DWORD *)buf = v21;
        v23 = v16;
        __int16 v24 = 1024;
        int v25 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, v6, "[MADTaskCoordinator] Scheduling next asset task (%@) from provider %d", buf, 0x12u);
      }
    }
    -[MADTaskCoordinator executeAssetProcessingTask:fromTaskProvider:](self, "executeAssetProcessingTask:fromTaskProvider:", v9, v8, v21);
    unint64_t v18 = self->_assetTaskCounter + 1;
    self->_assetTaskCounter = v18;
    if (v18 >= (unint64_t)[v8 iterations])
    {
      unint64_t v19 = self->_assetTaskProviderIdx + 1;
      self->_unint64_t assetTaskProviderIdx = v19 % (unint64_t)[(NSMutableArray *)self->_taskProviders count];
      self->_assetTaskCounter = 0;
    }

    LOBYTE(v3) = 1;
  }
  return (char)v3;
}

- (void)executeDownloadAssetProcessingTask:(id)a3 fromTaskProvider:(id)a4
{
  id v6 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10015E6BC;
  v11[3] = &unk_100219C10;
  id v12 = a4;
  id v13 = v6;
  unint64_t v14 = self;
  id v7 = v6;
  id v8 = v12;
  id v9 = objc_retainBlock(v11);
  [v7 setCancelBlock:self->_cancelBlock];
  dispatch_group_enter((dispatch_group_t)self->_taskGroup);
  int v10 = +[VCPMADQoSManager sharedManager];
  objc_msgSend(v10, "runAsyncBlock:withTaskID:", v9, objc_msgSend(v8, "taskID"));
}

- (BOOL)scheduleNextDownloadAssetProcessingTask
{
  id v3 = [(NSMutableArray *)self->_taskProviders count];
  if (v3)
  {
    uint64_t v4 = 0;
    while (1)
    {
      id v6 = [(NSMutableArray *)self->_taskProviders objectAtIndexedSubscript:self->_downloadTaskProviderIdx];
      uint64_t v7 = [v6 nextDownloadAssetProcessingTask];
      if (v7) {
        break;
      }
      unint64_t v8 = self->_downloadTaskProviderIdx + 1;
      self->_unint64_t downloadTaskProviderIdx = v8 % (unint64_t)[(NSMutableArray *)self->_taskProviders count];
      self->_downloadTaskCounter = 0;

      if (++v4 >= (unint64_t)[(NSMutableArray *)self->_taskProviders count])
      {
        LOBYTE(v3) = 0;
        return (char)v3;
      }
    }
    id v9 = (void *)v7;
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      int v10 = VCPLogInstance();
      os_log_type_t v11 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v10, v11))
      {
        id v12 = [v9 uuid];
        unint64_t downloadTaskProviderIdx = self->_downloadTaskProviderIdx;
        int v17 = 138412546;
        unint64_t v18 = v12;
        __int16 v19 = 1024;
        int v20 = downloadTaskProviderIdx;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "[MADTaskCoordinator] Scheduling next download task (%@) from provider %d", (uint8_t *)&v17, 0x12u);
      }
    }
    [(MADTaskCoordinator *)self executeDownloadAssetProcessingTask:v9 fromTaskProvider:v6];
    unint64_t v14 = self->_downloadTaskCounter + 1;
    self->_downloadTaskCounter = v14;
    if (v14 >= (unint64_t)[v6 iterations])
    {
      unint64_t v15 = self->_downloadTaskProviderIdx + 1;
      self->_unint64_t downloadTaskProviderIdx = v15 % (unint64_t)[(NSMutableArray *)self->_taskProviders count];
      self->_downloadTaskCounter = 0;
    }

    LOBYTE(v3) = 1;
  }
  return (char)v3;
}

- (void)executeClusterProcessingTask:(id)a3 fromTaskProvider:(id)a4
{
  id v6 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10015F054;
  v11[3] = &unk_100219C10;
  id v12 = a4;
  id v13 = v6;
  unint64_t v14 = self;
  id v7 = v6;
  id v8 = v12;
  id v9 = objc_retainBlock(v11);
  [v7 setCancelBlock:self->_cancelBlock];
  dispatch_group_enter((dispatch_group_t)self->_taskGroup);
  int v10 = +[VCPMADQoSManager sharedManager];
  objc_msgSend(v10, "runAsyncBlock:withTaskID:", v9, objc_msgSend(v8, "taskID"));
}

- (BOOL)scheduleNextClusterProcessingTask
{
  id v3 = [(NSMutableArray *)self->_taskProviders count];
  if (v3)
  {
    uint64_t v4 = 0;
    while (1)
    {
      id v6 = [(NSMutableArray *)self->_taskProviders objectAtIndexedSubscript:self->_clusterTaskProviderIdx];
      uint64_t v7 = [v6 nextClusterProcessingTask];
      if (v7) {
        break;
      }
      unint64_t v8 = self->_clusterTaskProviderIdx + 1;
      self->_unint64_t clusterTaskProviderIdx = v8 % (unint64_t)[(NSMutableArray *)self->_taskProviders count];
      self->_clusterTaskCounter = 0;

      if (++v4 >= (unint64_t)[(NSMutableArray *)self->_taskProviders count])
      {
        LOBYTE(v3) = 0;
        return (char)v3;
      }
    }
    id v9 = (void *)v7;
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      int v10 = VCPLogInstance();
      os_log_type_t v11 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v10, v11))
      {
        id v12 = [v9 uuid];
        unint64_t clusterTaskProviderIdx = self->_clusterTaskProviderIdx;
        int v17 = 138412546;
        unint64_t v18 = v12;
        __int16 v19 = 1024;
        int v20 = clusterTaskProviderIdx;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "[MADTaskCoordinator] Scheduling next cluster task (%@) from provider %d", (uint8_t *)&v17, 0x12u);
      }
    }
    [(MADTaskCoordinator *)self executeClusterProcessingTask:v9 fromTaskProvider:v6];
    unint64_t v14 = self->_clusterTaskCounter + 1;
    self->_clusterTaskCounter = v14;
    if (v14 >= (unint64_t)[v6 iterations])
    {
      unint64_t v15 = self->_clusterTaskProviderIdx + 1;
      self->_unint64_t clusterTaskProviderIdx = v15 % (unint64_t)[(NSMutableArray *)self->_taskProviders count];
      self->_clusterTaskCounter = 0;
    }

    LOBYTE(v3) = 1;
  }
  return (char)v3;
}

- (void)evaluateScheduling
{
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[MADTaskCoordinator] Evaluating Scheduling...", buf, 2u);
    }
  }
  uint64_t v5 = VCPSignPostLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  uint64_t v7 = VCPSignPostLog();
  unint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)long long v21 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "MADTaskCoordinator_EvaluateScheduling", (const char *)&unk_1001F3BD3, v21, 2u);
  }

  id cancelBlock = (uint64_t (**)(void))self->_cancelBlock;
  if (cancelBlock && (cancelBlock[2]() & 1) != 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      int v10 = VCPLogInstance();
      os_log_type_t v11 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v10, v11))
      {
        *(_WORD *)int v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "[MADTaskCoordinator] Processing canceled", v20, 2u);
      }
    }
  }
  else
  {
    if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_assetTaskPrepareSemaphore, 0)
      && ![(MADTaskCoordinator *)self scheduleNextAssetProcessingTask])
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_assetTaskPrepareSemaphore);
    }
    id v12 = +[VCPInternetReachability sharedInstance];
    if ([v12 hasWifiOrEthernetConnection])
    {
      intptr_t v13 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_downloadTaskSemaphore, 0);

      if (!v13
        && ![(MADTaskCoordinator *)self scheduleNextDownloadAssetProcessingTask])
      {
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_downloadTaskSemaphore);
      }
    }
    else
    {
    }
    if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_clusterTaskSemaphore, 0)
      && ![(MADTaskCoordinator *)self scheduleNextClusterProcessingTask])
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_clusterTaskSemaphore);
    }
  }
  dispatch_group_leave((dispatch_group_t)self->_schedulingGroup);
  if (!dispatch_group_wait((dispatch_group_t)self->_taskGroup, 0)
    && !dispatch_group_wait((dispatch_group_t)self->_schedulingGroup, 0))
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      unint64_t v14 = VCPLogInstance();
      os_log_type_t v15 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v14, v15))
      {
        *(_WORD *)__int16 v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "[MADTaskCoordinator] All tasks complete", v19, 2u);
      }
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_completionSemaphore);
  }
  id v16 = VCPSignPostLog();
  int v17 = v16;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)unint64_t v18 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, v6, "MADTaskCoordinator_EvaluateScheduling", (const char *)&unk_1001F3BD3, v18, 2u);
  }
}

- (int)run
{
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[MADTaskCoordinator] Running...", buf, 2u);
    }
  }
  dispatch_group_enter((dispatch_group_t)self->_schedulingGroup);
  schedulingQueue = self->_schedulingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015F850;
  block[3] = &unk_10021C738;
  block[4] = self;
  dispatch_async(schedulingQueue, block);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_completionSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  id cancelBlock = (uint64_t (**)(void))self->_cancelBlock;
  if (cancelBlock && (cancelBlock[2]() & 1) != 0) {
    return -128;
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressReporter, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_clusterTaskSemaphore, 0);
  objc_storeStrong((id *)&self->_downloadCompleteSemaphore, 0);
  objc_storeStrong((id *)&self->_downloadTaskSemaphore, 0);
  objc_storeStrong((id *)&self->_assetTaskPublishSemaphore, 0);
  objc_storeStrong((id *)&self->_assetTaskProcessSemaphore, 0);
  objc_storeStrong((id *)&self->_assetTaskPrepareSemaphore, 0);
  objc_storeStrong((id *)&self->_completionSemaphore, 0);
  objc_storeStrong((id *)&self->_taskGroup, 0);
  objc_storeStrong((id *)&self->_schedulingGroup, 0);
  objc_storeStrong((id *)&self->_schedulingQueue, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_taskTypes, 0);
  objc_storeStrong((id *)&self->_taskProviders, 0);
  objc_storeStrong((id *)&self->_photoLibraries, 0);
}

@end