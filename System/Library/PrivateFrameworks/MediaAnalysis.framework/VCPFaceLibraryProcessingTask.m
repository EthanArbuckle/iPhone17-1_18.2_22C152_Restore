@interface VCPFaceLibraryProcessingTask
+ (id)taskWithPhotoLibraries:(id)a3 andOptions:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6 andCancelBlock:(id)a7;
- (BOOL)_readyToProcessProcessLibrary:(id)a3;
- (BOOL)autoCancellable;
- (BOOL)isCancelled;
- (VCPFaceLibraryProcessingTask)init;
- (VCPFaceLibraryProcessingTask)initWithPhotoLibraries:(id)a3 andOptions:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6 andCancelBlock:(id)a7;
- (float)resourceRequirement;
- (id)_processingTaskForPhotoLibrary:(id)a3;
- (int)_addBatchWithAsset:(id)a3 isRetry:(BOOL)a4 withTask:(id)a5;
- (int)_analyzeAllAssetsWithTask:(id)a3;
- (int)_buildPersonsForPhotoLibrary:(id)a3 withClusterer:(id)a4 andContext:(id)a5;
- (int)_clusterAndProcessPersonsForPhotoLibrary:(id)a3 withContext:(id)a4 progressMade:(BOOL *)a5;
- (int)_clusterFacesWithClusterer:(id)a3;
- (int)_detectFacesForPhotoLibrary:(id)a3;
- (int)_generateAndDetectFaceCropsForPhotoLibrary:(id)a3;
- (int)_maintainProcessingStatusWithTask:(id)a3;
- (int)_processAutoCounterForPhotoLibrary:(id)a3;
- (int)_processFetchedAssets:(id)a3 withProcessingTask:(id)a4 andProgressReporter:(id)a5;
- (int)_processLibrary:(id)a3;
- (int)_processLocalIdentifiers:(id)a3 change:(id)a4 insert:(BOOL)a5 withTask:(id)a6;
- (int)_retryEligibleAssetsWithTask:(id)a3 andStatus:(unint64_t)a4 andReporter:(id)a5;
- (int)_retryFailedAssetsWithTask:(id)a3;
- (int)_screenLocalIdentifiers:(id)a3 withTask:(id)a4 andPreviousStatus:(unint64_t)a5 andProgressReporter:(id)a6;
- (int)_streamAnalysisWithTask:(id)a3 andProcessingStatus:(unint64_t)a4;
- (int)_updateQuickFaceIDModelForPhotoLibrary:(id)a3 withContext:(id)a4 andQuickFaceIDManager:(id)a5;
- (int)completeSceneProcessing;
- (int)run;
- (int)runGalleryProcessingForPhotoLibrary:(id)a3 progressHandler:(id)a4;
- (int)runLegacyProcessingForPhotoLibrary:(id)a3 progressHandler:(id)a4;
- (void)cancel;
- (void)dealloc;
@end

@implementation VCPFaceLibraryProcessingTask

- (VCPFaceLibraryProcessingTask)init
{
  return 0;
}

- (VCPFaceLibraryProcessingTask)initWithPhotoLibraries:(id)a3 andOptions:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6 andCancelBlock:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  v15 = (Block_layout *)a5;
  v16 = (Block_layout *)a6;
  v17 = (Block_layout *)a7;
  v43.receiver = self;
  v43.super_class = (Class)VCPFaceLibraryProcessingTask;
  v18 = [(VCPFaceLibraryProcessingTask *)&v43 init];
  v19 = v18;
  v20 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_photoLibraries, a3);
    uint64_t v21 = +[NSMutableDictionary dictionary];
    processingTasks = v20->_processingTasks;
    v20->_processingTasks = (NSMutableDictionary *)v21;

    p_options = (id *)&v19->_options;
    objc_storeStrong((id *)&v19->_options, a4);
    if (v15) {
      v24 = v15;
    }
    else {
      v24 = &stru_10021CDB8;
    }
    v25 = objc_retainBlock(v24);
    id progressHandler = v20->_progressHandler;
    v20->_id progressHandler = v25;

    if (v16) {
      v27 = v16;
    }
    else {
      v27 = &stru_10021CDD8;
    }
    v28 = objc_retainBlock(v27);
    id completionHandler = v20->_completionHandler;
    v20->_id completionHandler = v28;

    if (v17) {
      v30 = v17;
    }
    else {
      v30 = &stru_10021CDF8;
    }
    v31 = objc_retainBlock(v30);
    id cancelBlock = v20->_cancelBlock;
    v20->_id cancelBlock = v31;

    uint64_t v33 = +[NSMutableSet set];
    assetBatch = v20->_assetBatch;
    v20->_assetBatch = (NSMutableSet *)v33;

    v20->_subtasks = -1;
    v35 = [(NSDictionary *)v20->_options objectForKeyedSubscript:@"ModifyPersonRequest"];
    unsigned int v36 = [v35 BOOLValue];

    if (v36)
    {
      uint64_t v37 = 52;
    }
    else
    {
      v38 = [*p_options objectForKeyedSubscript:@"AutoCounterOnly"];
      unsigned int v39 = [v38 BOOLValue];

      if (!v39)
      {
        v41 = [*p_options objectForKeyedSubscript:@"SubTasks"];

        if (v41)
        {
          v42 = [*p_options objectForKeyedSubscript:@"SubTasks"];
          v20->_subtasks = (unint64_t)[v42 unsignedIntegerValue];
        }
        goto LABEL_16;
      }
      uint64_t v37 = 128;
    }
    v20->_subtasks = v37;
LABEL_16:
    [(id)objc_opt_class() _logSubtasks:v20->_subtasks];
  }

  return v20;
}

+ (id)taskWithPhotoLibraries:(id)a3 andOptions:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6 andCancelBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibraries:v11 andOptions:v12 andProgressHandler:v13 andCompletionHandler:v14 andCancelBlock:v15];

  return v16;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0) {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPFaceLibraryProcessingTask;
  [(VCPFaceLibraryProcessingTask *)&v4 dealloc];
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void)cancel
{
}

- (BOOL)isCancelled
{
  if ((*((uint64_t (**)(void))self->_cancelBlock + 2))()) {
    return 1;
  }
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_cancel);
  return v4 & 1;
}

- (id)_processingTaskForPhotoLibrary:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  processingTasks = v5->_processingTasks;
  v7 = [v4 databaseUUID];
  v8 = [(NSMutableDictionary *)processingTasks objectForKeyedSubscript:v7];

  if (!v8)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v9 = VCPLogInstance();
      os_log_type_t v10 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "[FaceLibraryProcessing] Creating VCPFaceProcessingTask for library %@", buf, 0xCu);
      }
    }
    id v11 = +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:v4];
    id v12 = [(NSDictionary *)v5->_options objectForKeyedSubscript:@"ModifyPersonRequest"];
    unsigned int v13 = [v12 BOOLValue];

    if (v13) {
      [v11 setSkipGallerySyncing:1];
    }
    objc_initWeak((id *)buf, v5);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000CB4EC;
    v22[3] = &unk_10021CE20;
    objc_copyWeak(&v23, (id *)buf);
    id v14 = objc_retainBlock(v22);
    id v15 = +[VCPFaceProcessingTask taskWithPhotoLibrary:v4 andContext:v11 andCancelBlock:v14];
    id v16 = v5->_processingTasks;
    v17 = [v4 databaseUUID];
    [(NSMutableDictionary *)v16 setObject:v15 forKeyedSubscript:v17];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  v18 = v5->_processingTasks;
  v19 = [v4 databaseUUID];
  v20 = [(NSMutableDictionary *)v18 objectForKeyedSubscript:v19];

  objc_sync_exit(v5);
  return v20;
}

- (int)_addBatchWithAsset:(id)a3 isRetry:(BOOL)a4 withTask:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (![(VCPFaceLibraryProcessingTask *)self isCancelled])
  {
    id v11 = +[VCPWatchdog sharedWatchdog];
    [v11 pet];

    if ((objc_msgSend(v8, "vcp_needsFaceProcessing") & 1) == 0)
    {
      if (!v6) {
        goto LABEL_18;
      }
      v18 = [v9 database];
      v19 = [v8 localIdentifier];
      [v18 removeProcessingStatusForLocalIdentifier:v19 andTaskID:3];

      v20 = [v9 database];
      [v20 commit];

      if ((int)MediaAnalysisLogLevel() < 6) {
        goto LABEL_18;
      }
      id v15 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v15, v21))
      {
        v22 = [v8 localIdentifier];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v22;
        _os_log_impl((void *)&_mh_execute_header, v15, v21, "[FaceLibraryProcessing][%@] Analysis is up-to-date", buf, 0xCu);
      }
      goto LABEL_17;
    }
    id v12 = [v8 photoLibrary];
    if (objc_msgSend(v12, "mad_pauseFCPeopleFurtherProcessing"))
    {
      unsigned int v13 = [v8 faceAnalysisVersion];
      if (_os_feature_enabled_impl()) {
        int v14 = 14;
      }
      else {
        int v14 = 11;
      }

      if (v14 == v13)
      {
        if ((int)MediaAnalysisLogLevel() < 5)
        {
LABEL_18:
          int v10 = 0;
          goto LABEL_62;
        }
        id v15 = VCPLogInstance();
        os_log_type_t v16 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v15, v16))
        {
          v17 = [v8 localIdentifier];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v17;
          _os_log_impl((void *)&_mh_execute_header, v15, v16, "[%@][FaceAnalysisStateCheck] already with FC version; skip",
            buf,
            0xCu);
        }
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
    }
    uint64_t v60 = 0;
    int v59 = 0;
    id v23 = [v9 database];
    id v58 = 0;
    v24 = [v8 localIdentifier];
    int v10 = [v23 queryProcessingStatus:&v60 attempts:&v59 lastAttemptDate:0 andNextAttemptDate:&v58 forLocalIdentifier:v24 andTaskID:3];
    id v25 = v58;

    if (v10)
    {
LABEL_61:

      goto LABEL_62;
    }
    uint64_t v26 = v60;
    if (v60 == 7 || v60 == 2)
    {
      id v23 = [v9 photoLibrary];
      if (objc_msgSend(v23, "vcp_supportsInMemoryDownload"))
      {
        v27 = [v9 photoLibrary];
        if (objc_msgSend(v27, "vcp_allowInMemoryDownload")) {
          unsigned int v28 = [v9 allowStreaming] ^ 1;
        }
        else {
          unsigned int v28 = 1;
        }
      }
      else
      {
        unsigned int v28 = 0;
      }
    }
    else
    {
      unsigned int v28 = 0;
    }
    if (v26 == 7 || v26 == 2) {

    }
    if (v28)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v29 = VCPLogInstance();
        os_log_type_t v30 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v29, v30))
        {
          v31 = [v8 localIdentifier];
          VCPProcessingStatusDescription(v60);
          id v32 = (id)objc_claimAutoreleasedReturnValue();
          int v33 = v59;
          v34 = +[VCPLogManager dateFormatter];
          v35 = [v34 stringFromDate:v25];
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v31;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v32;
          *(_WORD *)&buf[22] = 1024;
          int v62 = v33;
          __int16 v63 = 2112;
          v64 = v35;
          _os_log_impl((void *)&_mh_execute_header, v29, v30, "[FaceLibraryProcessing][%@] Analysis deferred (%@|%d): no Internet access or streaming is disabled; revisit date: %@",
            buf,
            0x26u);
        }
LABEL_49:

        goto LABEL_50;
      }
      goto LABEL_50;
    }
    unsigned int v36 = +[NSDate now];
    if ([v25 compare:v36] == (id)1)
    {
      BOOL v38 = v60 != 2 || v59 != 1;

      if (v38)
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v29 = VCPLogInstance();
          os_log_type_t v39 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v29, v39))
          {
            v40 = [v8 localIdentifier];
            VCPProcessingStatusDescription(v60);
            id v41 = (id)objc_claimAutoreleasedReturnValue();
            int v42 = v59;
            objc_super v43 = +[VCPLogManager dateFormatter];
            v44 = [v43 stringFromDate:v25];
            *(_DWORD *)buf = 138413058;
            *(void *)&uint8_t buf[4] = v40;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v41;
            *(_WORD *)&buf[22] = 1024;
            int v62 = v42;
            __int16 v63 = 2112;
            v64 = v44;
            _os_log_impl((void *)&_mh_execute_header, v29, v39, "[FaceLibraryProcessing][%@] Analysis deferred (%@|%d); revisit date: %@",
              buf,
              0x26u);
          }
          goto LABEL_49;
        }
LABEL_50:
        int v10 = 0;
        goto LABEL_61;
      }
    }
    else
    {
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    int v62 = 0;
    v51 = _NSConcreteStackBlock;
    uint64_t v52 = 3221225472;
    v53 = sub_1000CBDC4;
    v54 = &unk_10021C020;
    v57 = buf;
    id v55 = v9;
    v56 = self;
    v45 = objc_retainBlock(&v51);
    assetBatch = self->_assetBatch;
    if (v60 == 4)
    {
      if ([(NSMutableSet *)assetBatch count])
      {
        v47 = +[VCPMADQoSManager sharedManager];
        [v47 runBlock:v45 withTaskID:3];

        [(NSMutableSet *)self->_assetBatch removeAllObjects];
        int v10 = *(_DWORD *)(*(void *)&buf[8] + 24);
        if (v10) {
          goto LABEL_60;
        }
      }
      [(NSMutableSet *)self->_assetBatch addObject:v8];
      v48 = +[VCPMADQoSManager sharedManager];
      [v48 runBlock:v45 withTaskID:3];

      [(NSMutableSet *)self->_assetBatch removeAllObjects];
    }
    else
    {
      -[NSMutableSet addObject:](assetBatch, "addObject:", v8, v51, v52, v53, v54);
      if ((unint64_t)[(NSMutableSet *)self->_assetBatch count] < 0x64) {
        goto LABEL_59;
      }
      v49 = +[VCPMADQoSManager sharedManager];
      [v49 runBlock:v45 withTaskID:3];

      [(NSMutableSet *)self->_assetBatch removeAllObjects];
    }
    int v10 = *(_DWORD *)(*(void *)&buf[8] + 24);
    if (v10)
    {
LABEL_60:

      _Block_object_dispose(buf, 8);
      goto LABEL_61;
    }
LABEL_59:
    int v10 = 0;
    goto LABEL_60;
  }
  int v10 = -128;
LABEL_62:

  return v10;
}

- (int)_screenLocalIdentifiers:(id)a3 withTask:(id)a4 andPreviousStatus:(unint64_t)a5 andProgressReporter:(id)a6
{
  id v9 = a3;
  id v49 = a4;
  v46 = v9;
  id v47 = a6;
  id v48 = [objc_alloc((Class)NSMutableSet) initWithArray:v9];
  int v10 = [v49 photoLibrary];
  uint64_t v11 = +[PHAsset vcp_fetchOptionsForLibrary:v10 forTaskID:3];

  v45 = (void *)v11;
  id v12 = +[PHAsset fetchAssetsWithLocalIdentifiers:v9 options:v11];
  uint64_t v13 = 0;
  id v14 = [v12 count];
  if (v14)
  {
    uint64_t v15 = 0;
    while (1)
    {
      v17 = [v12 objectAtIndexedSubscript:v15];
      if ([(VCPFaceLibraryProcessingTask *)self isCancelled])
      {
        uint64_t v13 = 4294967168;
        int v18 = 7;
      }
      else
      {
        v19 = [v17 localIdentifier];
        [v48 removeObject:v19];

        [v47 increaseProcessedJobCountByOne];
        unsigned int v20 = [(VCPFaceLibraryProcessingTask *)self _addBatchWithAsset:v17 isRetry:1 withTask:v49];
        int v18 = v20 ? 7 : 0;
        uint64_t v13 = v20 ? v20 : v13;
      }

      if (v18) {
        break;
      }
      if (v14 == (id)++v15) {
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    if ([(NSMutableSet *)self->_assetBatch count])
    {
      *(void *)&long long v61 = 0;
      *((void *)&v61 + 1) = &v61;
      uint64_t v62 = 0x2020000000;
      int v63 = 0;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_1000CC45C;
      v54[3] = &unk_10021C020;
      v57 = &v61;
      id v55 = v49;
      v56 = self;
      os_log_type_t v21 = objc_retainBlock(v54);
      v22 = +[VCPMADQoSManager sharedManager];
      [v22 runBlock:v21 withTaskID:3];

      [(NSMutableSet *)self->_assetBatch removeAllObjects];
      int v23 = *(_DWORD *)(*((void *)&v61 + 1) + 24);
      if (v23)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v24 = VCPLogInstance();
          os_log_type_t v25 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v24, v25))
          {
            int v26 = *(_DWORD *)(*((void *)&v61 + 1) + 24);
            *(_DWORD *)buf = 67109120;
            int v60 = v26;
            _os_log_impl((void *)&_mh_execute_header, v24, v25, "[FaceLibraryProcessing] Failed to process asset batch (error: %d)", buf, 8u);
          }
        }
        *(_DWORD *)(*((void *)&v61 + 1) + 24) = v23;

        _Block_object_dispose(&v61, 8);
        goto LABEL_49;
      }

      _Block_object_dispose(&v61, 8);
    }
    v27 = +[VCPMADCoreAnalyticsManager sharedManager];
    [v27 accumulateInt64Value:v14 forField:@"NumberOfAssetsOutFromBlacklist" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

    if ([v48 count])
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v28 = v48;
      id v29 = [v28 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v29)
      {
        uint64_t v30 = *(void *)v51;
LABEL_26:
        v31 = 0;
        uint64_t v32 = v13;
        while (1)
        {
          if (*(void *)v51 != v30) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void *)(*((void *)&v50 + 1) + 8 * (void)v31);
          v34 = [v49 database];
          id v35 = [v34 removeProcessingStatusForLocalIdentifier:v33 andTaskID:3];

          int v36 = 7;
          if (v35 == -108)
          {
            uint64_t v13 = (uint64_t)v35;
          }
          else
          {
            BOOL v37 = v35 == -36 || v35 == -23;
            uint64_t v13 = (uint64_t)v35;
            if (!v37)
            {
              int v36 = 0;
              uint64_t v13 = v32;
            }
          }
          if (v35 == -108) {
            break;
          }
          if (v35 == -36 || v35 == -23) {
            break;
          }
          v31 = (char *)v31 + 1;
          uint64_t v32 = v13;
          if (v29 == v31)
          {
            id v29 = [v28 countByEnumeratingWithState:&v50 objects:v58 count:16];
            if (v29) {
              goto LABEL_26;
            }
            goto LABEL_43;
          }
        }

        if (v36 == 7) {
          goto LABEL_49;
        }
      }
      else
      {
LABEL_43:
      }
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        os_log_type_t v39 = VCPLogInstance();
        os_log_type_t v40 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v39, v40))
        {
          id v41 = [v28 count];
          LODWORD(v61) = 134217984;
          *(void *)((char *)&v61 + 4) = v41;
          _os_log_impl((void *)&_mh_execute_header, v39, v40, "[FaceLibraryProcessing] Removed %lu unknown assets", (uint8_t *)&v61, 0xCu);
        }
      }
    }
  }
LABEL_49:
  int v42 = [v49 database];
  int v43 = [v42 commit];

  if (v43 != -108 && v43 != -36 && v43 != -23) {
    int v43 = v13;
  }

  return v43;
}

- (int)_streamAnalysisWithTask:(id)a3 andProcessingStatus:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 photoLibrary];
  unsigned __int8 v8 = objc_msgSend(v7, "vcp_allowInMemoryDownload");

  if ((v8 & 1) == 0)
  {
LABEL_47:
    int v32 = 0;
    goto LABEL_48;
  }
  id v9 = [v6 photoLibrary];
  id v10 = objc_msgSend(v9, "mad_pauseFCPeopleFurtherProcessing");

  if (v10)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v11 = VCPLogInstance();
      os_log_type_t v12 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v11, v12))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "[FaceLibraryProcessing] Pause using large derivatives for FC people processing", buf, 2u);
      }
    }
    goto LABEL_47;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    uint64_t v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = [v6 photoLibrary];
      os_log_type_t v16 = [v15 photoLibraryURL];
      v17 = [v16 path];
      int v18 = VCPProcessingStatusDescription(a4);
      *(_DWORD *)buf = 138412546;
      id v42 = v17;
      __int16 v43 = 2112;
      id v44 = v18;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[FaceLibraryProcessing] Stream Library %@ for eligible %@ assets", buf, 0x16u);
    }
  }
  uint64_t v19 = [v6 database];
  signed int v20 = [(id)v19 queryAssetCountForTaskID:3 withStatus:a4 andAttempts:1];

  if (!v20) {
    goto LABEL_47;
  }
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000CCA68;
  v40[3] = &unk_10021BEF0;
  v40[4] = self;
  BOOL v37 = objc_retainBlock(v40);
  BOOL v38 = +[VCPProgressReporter reporterWithIntervalSeconds:10 andTotalJobCount:v20 andBlock:v37];
  os_log_type_t v35 = VCPLogToOSLogType[3];
  os_log_type_t type = VCPLogToOSLogType[7];
  *(void *)&long long v21 = 134218242;
  long long v34 = v21;
  do
  {
    if ([(VCPFaceLibraryProcessingTask *)self isCancelled])
    {
      uint64_t v19 = 4294967168;
      int v23 = 1;
      goto LABEL_42;
    }
    v24 = [v6 database];
    id v39 = 0;
    id v25 = [v24 fetchLocalIdentifiers:&v39 withProcessingStatus:a4 andTaskID:3 andAttempts:1 andFetchLimit:100];
    id v26 = v39;

    if (v25 == -108 || v25 == -36)
    {
      uint64_t v27 = (uint64_t)v25;
    }
    else
    {
      uint64_t v27 = (uint64_t)v25;
      if (v25 != -23) {
        uint64_t v27 = v19;
      }
    }
    int v23 = 1;
    if (v25 != -108 && v25 != -36 && v25 != -23)
    {
      if ([v26 count])
      {
        [v6 setAllowStreaming:1];
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          id v28 = VCPLogInstance();
          if (os_log_type_enabled(v28, type))
          {
            id v29 = [v26 count];
            *(_DWORD *)buf = v34;
            id v42 = v29;
            __int16 v43 = 2112;
            id v44 = v26;
            _os_log_impl((void *)&_mh_execute_header, v28, type, "[FaceLibraryProcessing] Screening %lu assets: %@", buf, 0x16u);
          }
        }
        uint64_t v30 = -[VCPFaceLibraryProcessingTask _screenLocalIdentifiers:withTask:andPreviousStatus:andProgressReporter:](self, "_screenLocalIdentifiers:withTask:andPreviousStatus:andProgressReporter:", v26, v6, a4, v38, v34);
        if (!v30)
        {
          int v23 = 0;
          goto LABEL_41;
        }
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          uint64_t v27 = v30;
          goto LABEL_41;
        }
        v31 = VCPLogInstance();
        if (os_log_type_enabled(v31, v35))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, v35, "[FaceLibraryProcessing] Failed to screen assets", buf, 2u);
        }
        uint64_t v27 = v30;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 7)
        {
          int v23 = 11;
          goto LABEL_41;
        }
        v31 = VCPLogInstance();
        if (os_log_type_enabled(v31, type))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, type, "[FaceLibraryProcessing] No qualified assets", buf, 2u);
        }
        int v23 = 11;
      }
    }
LABEL_41:

    uint64_t v19 = v27;
LABEL_42:
  }
  while (!v23);
  if (v23 == 11) {
    int v32 = 0;
  }
  else {
    int v32 = v19;
  }

LABEL_48:
  return v32;
}

- (int)_retryEligibleAssetsWithTask:(id)a3 andStatus:(unint64_t)a4 andReporter:(id)a5
{
  id v9 = a3;
  id v45 = a5;
  id v10 = [v9 database];
  uint64_t v11 = [v10 queryEligibleToRetryAssetCountWithProcessingStatus:a4 andTaskID:3];

  if (!v11)
  {
LABEL_7:
    int v16 = 0;
    goto LABEL_66;
  }
  os_log_type_t v12 = [v9 photoLibrary];
  uint64_t v13 = (uint64_t)objc_msgSend(v12, "mad_pauseFCPeopleFurtherProcessing");

  if (v13)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      os_log_type_t v14 = VCPLogInstance();
      os_log_type_t v15 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v14, v15))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "[FaceLibraryProcessing] Pause using large derivatives for FC people processing", buf, 2u);
      }
    }
    goto LABEL_7;
  }
  if (a4 <= 7 && ((1 << a4) & 0x9C) != 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      int v18 = VCPLogInstance();
      os_log_type_t v19 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v18, v19))
      {
        signed int v20 = [v9 photoLibrary];
        v5 = [v20 photoLibraryURL];
        uint64_t v13 = [v5 path];
        long long v21 = VCPProcessingStatusDescription(a4);
        *(_DWORD *)buf = 138412802;
        uint64_t v48 = v13;
        __int16 v49 = 2048;
        long long v50 = v11;
        __int16 v51 = 2112;
        long long v52 = v21;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "[FaceLibraryProcessing] Retry Library %@ with %lu eligible %@ assets", buf, 0x20u);
      }
LABEL_16:
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    int v18 = VCPLogInstance();
    os_log_type_t v22 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v18, v22))
    {
      int v23 = [v9 photoLibrary];
      v5 = [v23 photoLibraryURL];
      uint64_t v13 = [v5 path];
      v24 = VCPProcessingStatusDescription(a4);
      *(_DWORD *)buf = 138412802;
      uint64_t v48 = v13;
      __int16 v49 = 2048;
      long long v50 = v11;
      __int16 v51 = 2112;
      long long v52 = v24;
      _os_log_impl((void *)&_mh_execute_header, v18, v22, "[FaceLibraryProcessing][UNEXPECTED] Retry Library %@ with %lu eligible %@ assets", buf, 0x20u);
    }
    goto LABEL_16;
  }
  os_log_type_t v42 = VCPLogToOSLogType[3];
  os_log_type_t v43 = VCPLogToOSLogType[7];
  os_log_type_t type = VCPLogToOSLogType[6];
  *(void *)&long long v17 = 134218242;
  long long v41 = v17;
  do
  {
    if ([(VCPFaceLibraryProcessingTask *)self isCancelled])
    {
      uint64_t v13 = 4294967168;
LABEL_20:
      int v26 = 1;
      goto LABEL_62;
    }
    if ((a4 == 7 || a4 == 2)
      && (objc_msgSend(v9, "photoLibrary", v41),
          v5 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "vcp_supportsInMemoryDownload")))
    {
      uint64_t v27 = [v9 photoLibrary];
      unsigned int v28 = objc_msgSend(v27, "vcp_allowInMemoryDownload");

      int v29 = v28 ^ 1;
    }
    else
    {
      int v29 = 0;
    }
    if (a4 == 7 || a4 == 2) {

    }
    if (v29)
    {
      if ((int)MediaAnalysisLogLevel() < 6)
      {
        uint64_t v13 = 0;
        goto LABEL_20;
      }
      uint64_t v30 = VCPLogInstance();
      if (os_log_type_enabled(v30, type))
      {
        v31 = VCPProcessingStatusDescription(a4);
        *(_DWORD *)buf = 138412290;
        uint64_t v48 = (uint64_t)v31;
        _os_log_impl((void *)&_mh_execute_header, v30, type, "[FaceLibraryProcessing] Internet unavailable; skip %@ assets",
          buf,
          0xCu);
      }
      uint64_t v32 = 0;
      int v26 = 1;
    }
    else
    {
      uint64_t v33 = [v9 database];
      id v46 = 0;
      id v34 = [v33 fetchEligibleToRetryLocalIdentifiers:&v46 withProcessingStatus:a4 andTaskID:3 andFetchLimit:100];
      uint64_t v30 = v46;

      if (v34 == -108 || v34 == -36)
      {
        uint64_t v32 = (uint64_t)v34;
      }
      else
      {
        uint64_t v32 = (uint64_t)v34;
        if (v34 != -23) {
          uint64_t v32 = v13;
        }
      }
      int v26 = 1;
      if (v34 == -108 || v34 == -36 || v34 == -23) {
        goto LABEL_61;
      }
      if ([v30 count])
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          os_log_type_t v35 = VCPLogInstance();
          if (os_log_type_enabled(v35, v43))
          {
            id v36 = [v30 count];
            *(_DWORD *)buf = v41;
            uint64_t v48 = (uint64_t)v36;
            __int16 v49 = 2112;
            long long v50 = v30;
            _os_log_impl((void *)&_mh_execute_header, v35, v43, "[FaceLibraryProcessing] Screening %lu assets: %@", buf, 0x16u);
          }
        }
        BOOL v37 = objc_msgSend(v9, "photoLibrary", v41);
        objc_msgSend(v9, "setAllowStreaming:", objc_msgSend(v37, "vcp_allowInMemoryDownload"));

        uint64_t v38 = [(VCPFaceLibraryProcessingTask *)self _screenLocalIdentifiers:v30 withTask:v9 andPreviousStatus:a4 andProgressReporter:v45];
        if (!v38)
        {
          int v26 = 0;
          goto LABEL_61;
        }
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          uint64_t v32 = v38;
          goto LABEL_61;
        }
        id v39 = VCPLogInstance();
        if (os_log_type_enabled(v39, v42))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, v42, "[FaceLibraryProcessing] Failed to screen assets", buf, 2u);
        }
        uint64_t v32 = v38;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 7)
        {
          int v26 = 11;
          goto LABEL_61;
        }
        id v39 = VCPLogInstance();
        if (os_log_type_enabled(v39, v43))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, v43, "[FaceLibraryProcessing] No qualified assets", buf, 2u);
        }
        int v26 = 11;
      }
    }
LABEL_61:

    uint64_t v13 = v32;
LABEL_62:
  }
  while (!v26);
  if (v26 == 11) {
    int v16 = 0;
  }
  else {
    int v16 = v13;
  }
LABEL_66:

  return v16;
}

- (int)_retryFailedAssetsWithTask:(id)a3
{
  id v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v5, v6))
    {
      v7 = [v4 photoLibrary];
      unsigned __int8 v8 = [v7 photoLibraryURL];
      id v9 = [v8 path];
      *(_DWORD *)buf = 138412290;
      int v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[FaceLibraryProcessing] Retry Library %@ for eligible failed assets", buf, 0xCu);
    }
  }
  id v10 = [v4 database];
  id v11 = [v10 queryEligibleToRetryAssetCountWithTaskID:3];

  if (v11)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000CD4D0;
    v16[3] = &unk_10021BEF0;
    v16[4] = self;
    os_log_type_t v12 = objc_retainBlock(v16);
    uint64_t v13 = +[VCPProgressReporter reporterWithIntervalSeconds:10 andTotalJobCount:v11 andBlock:v12];
    int v14 = [(VCPFaceLibraryProcessingTask *)self _retryEligibleAssetsWithTask:v4 andStatus:0 andReporter:v13];
    if (!v14)
    {
      int v14 = [(VCPFaceLibraryProcessingTask *)self _retryEligibleAssetsWithTask:v4 andStatus:1 andReporter:v13];
      if (!v14)
      {
        int v14 = [(VCPFaceLibraryProcessingTask *)self _retryEligibleAssetsWithTask:v4 andStatus:2 andReporter:v13];
        if (!v14)
        {
          int v14 = [(VCPFaceLibraryProcessingTask *)self _retryEligibleAssetsWithTask:v4 andStatus:7 andReporter:v13];
          if (!v14)
          {
            int v14 = [(VCPFaceLibraryProcessingTask *)self _retryEligibleAssetsWithTask:v4 andStatus:3 andReporter:v13];
            if (!v14) {
              int v14 = [(VCPFaceLibraryProcessingTask *)self _retryEligibleAssetsWithTask:v4 andStatus:4 andReporter:v13];
            }
          }
        }
      }
    }
  }
  else
  {
    int v14 = 0;
  }

  return v14;
}

- (int)_processFetchedAssets:(id)a3 withProcessingTask:(id)a4 andProgressReporter:(id)a5
{
  id v9 = a3;
  id v38 = a4;
  id v36 = a5;
  BOOL v37 = +[NSMutableArray array];
  unint64_t v10 = 0;
  os_log_type_t type = VCPLogToOSLogType[5];
  *(void *)&long long v11 = 138412802;
  long long v34 = v11;
  while (v10 < (unint64_t)objc_msgSend(v9, "count", v34))
  {
    if ([(VCPFaceLibraryProcessingTask *)self isCancelled])
    {
      int v5 = -128;
      int v13 = 1;
    }
    else
    {
      int v14 = [v9 objectAtIndexedSubscript:v10];
      [v36 increaseProcessedJobCountByOne];
      if (+[PHPhotoLibrary mad_isProcessingNeededOnAsset:v14 forTaskID:3])
      {
        unsigned int v15 = [(VCPFaceLibraryProcessingTask *)self _addBatchWithAsset:v14 isRetry:0 withTask:v38];
        int v13 = v15 != 0;
        if (v15) {
          int v5 = v15;
        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          int v16 = VCPLogInstance();
          if (os_log_type_enabled(v16, type))
          {
            id v17 = (id)objc_opt_class();
            int v18 = [v14 localIdentifier];
            *(_DWORD *)buf = v34;
            *(void *)&uint8_t buf[4] = v17;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v18;
            *(_WORD *)&buf[22] = 2048;
            uint64_t v46 = 3;
            _os_log_impl((void *)&_mh_execute_header, v16, type, "[%@][%@] Asset does not need processing in task %lu, ignoring... ", buf, 0x20u);
          }
        }
        [v37 addObject:v14];
        os_log_type_t v19 = [v38 database];
        signed int v20 = [v14 localIdentifier];
        [v19 removeProcessingStatusForLocalIdentifier:v20 andTaskID:3];

        long long v21 = [v38 database];
        [v21 commit];

        id v22 = [v37 count];
        if (v22 >= +[PHPhotoLibrary mad_maxIgnoredAssetsToMarkAsProcessed])
        {
          int v23 = +[VCPWatchdog sharedWatchdog];
          [v23 pet];

          v24 = [v38 photoLibrary];
          objc_msgSend(v24, "mad_markAsProcessedByTask:forAssets:", 3, v37);

          [v37 removeAllObjects];
        }
        int v13 = 4;
      }
    }
    if ((v13 | 4) != 4) {
      goto LABEL_30;
    }
    ++v10;
  }
  if ([v37 count])
  {
    id v25 = +[VCPWatchdog sharedWatchdog];
    [v25 pet];

    int v26 = [v38 photoLibrary];
    objc_msgSend(v26, "mad_markAsProcessedByTask:forAssets:", 3, v37);

    [v37 removeAllObjects];
  }
  if (![(NSMutableSet *)self->_assetBatch count]) {
    goto LABEL_29;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LODWORD(v46) = 0;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000CDA80;
  v39[3] = &unk_10021C020;
  os_log_type_t v42 = buf;
  id v40 = v38;
  long long v41 = self;
  uint64_t v27 = objc_retainBlock(v39);
  unsigned int v28 = +[VCPMADQoSManager sharedManager];
  [v28 runBlock:v27 withTaskID:3];

  [(NSMutableSet *)self->_assetBatch removeAllObjects];
  int v29 = *(_DWORD *)(*(void *)&buf[8] + 24);
  if (v29)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v30 = VCPLogInstance();
      os_log_type_t v31 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v30, v31))
      {
        int v32 = *(_DWORD *)(*(void *)&buf[8] + 24);
        *(_DWORD *)os_log_type_t v43 = 67109120;
        int v44 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "[FaceLibraryProcessing] Failed to process asset batch: %d", v43, 8u);
      }
    }
    int v5 = v29;
  }

  _Block_object_dispose(buf, 8);
  if (!v29) {
LABEL_29:
  }
    int v5 = 0;
LABEL_30:

  return v5;
}

- (int)_analyzeAllAssetsWithTask:(id)a3
{
  id v44 = a3;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    unsigned __int8 v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v3, v4))
    {
      int v5 = [v44 photoLibrary];
      os_log_type_t v6 = [v5 photoLibraryURL];
      v7 = [v6 path];
      *(_DWORD *)buf = 138412290;
      *(void *)long long v52 = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[FaceLibraryProcessing] Analyzing Library %@", buf, 0xCu);
    }
  }
  unsigned __int8 v8 = [v44 photoLibrary];
  id v9 = objc_msgSend(v8, "vcp_assetCountForTaskID:", 3);

  if (v9)
  {
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1000CE194;
    v50[3] = &unk_10021BEF0;
    v50[4] = self;
    id v36 = objc_retainBlock(v50);
    id v38 = +[VCPProgressReporter reporterWithIntervalSeconds:10 andTotalJobCount:v9 andBlock:v36];
    [v44 setAllowStreaming:0];
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      unint64_t v10 = VCPLogInstance();
      os_log_type_t v11 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v10, v11))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "[FaceLibraryProcessing] Analyzing with local resources ... ", buf, 2u);
      }
    }
    os_log_type_t v12 = [v44 photoLibrary];
    os_log_type_t v43 = +[PHMediaProcessingAlgorithmVersionProvider mad_sharedVersionProviderWithPhotoLibrary:v12];

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v13 = [&off_1002304E8 countByEnumeratingWithState:&v46 objects:v53 count:16];
    if (v13)
    {
      uint64_t v42 = *(void *)v47;
      os_log_type_t type = VCPLogToOSLogType[5];
      os_log_type_t v39 = VCPLogToOSLogType[3];
      os_log_type_t v37 = VCPLogToOSLogType[6];
      *(void *)&long long v14 = 134217984;
      long long v35 = v14;
LABEL_12:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v47 != v42) {
          objc_enumerationMutation(&off_1002304E8);
        }
        int v16 = *(void **)(*((void *)&v46 + 1) + 8 * v15);
        id v18 = [v16 unsignedIntegerValue];
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          os_log_type_t v19 = VCPLogInstance();
          if (os_log_type_enabled(v19, type))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)long long v52 = v18;
            _os_log_impl((void *)&_mh_execute_header, v19, type, "[FaceLibraryProcessing] Processing P%d assets ... ", buf, 8u);
          }
        }
        signed int v20 = VCPSignPostLog();
        os_signpost_id_t v21 = os_signpost_id_generate(v20);

        id v22 = VCPSignPostLog();
        int v23 = v22;
        if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "VCPFaceLibraryProcessingTask_FetchAssets", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        v24 = [v44 photoLibrary];
        +[PHAsset mad_peopleThreshold];
        id v45 = 0;
        id v25 = objc_msgSend(v24, "fetchAssetsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:error:", 3, v18, v43, &v45);
        id v26 = v45;

        uint64_t v27 = VCPSignPostLog();
        unsigned int v28 = v27;
        if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, v21, "VCPFaceLibraryProcessingTask_FetchAssets", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        if (v26)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            int v29 = VCPLogInstance();
            if (os_log_type_enabled(v29, v39))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)long long v52 = v18;
              *(_WORD *)&v52[4] = 2112;
              *(void *)&v52[6] = v26;
              _os_log_impl((void *)&_mh_execute_header, v29, v39, "[FaceLibraryProcessing] Failed to fetch P%d assets: %@", buf, 0x12u);
            }
          }
          LODWORD(v8) = -18;
          BOOL v30 = 1;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            os_log_type_t v31 = VCPLogInstance();
            if (os_log_type_enabled(v31, v37))
            {
              id v32 = [v25 count];
              *(_DWORD *)buf = v35;
              *(void *)long long v52 = v32;
              _os_log_impl((void *)&_mh_execute_header, v31, v37, "[FaceLibraryProcessing] Fetched %lu assets", buf, 0xCu);
            }
          }
          unsigned int v33 = -[VCPFaceLibraryProcessingTask _processFetchedAssets:withProcessingTask:andProgressReporter:](self, "_processFetchedAssets:withProcessingTask:andProgressReporter:", v25, v44, v38, v35);
          BOOL v30 = v33 != 0;
          if (v33) {
            LODWORD(v8) = v33;
          }
        }

        if (v30) {
          break;
        }
        if (v13 == (id)++v15)
        {
          id v13 = [&off_1002304E8 countByEnumeratingWithState:&v46 objects:v53 count:16];
          if (v13) {
            goto LABEL_12;
          }
          goto LABEL_40;
        }
      }
    }
    else
    {
LABEL_40:
      LODWORD(v8) = 0;
    }
  }
  else
  {
    LODWORD(v8) = 0;
  }

  return (int)v8;
}

- (int)_processLocalIdentifiers:(id)a3 change:(id)a4 insert:(BOOL)a5 withTask:(id)a6
{
  BOOL v41 = a5;
  id v37 = a3;
  id v40 = a4;
  id v42 = a6;
  unint64_t v10 = [v42 photoLibrary];
  os_log_type_t v11 = +[PHAsset vcp_fetchOptionsForLibrary:v10 forTaskID:3];

  id v38 = v11;
  os_log_type_t v12 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:0];
  long long v47 = v12;
  id v13 = +[NSArray arrayWithObjects:&v47 count:1];
  [v11 setSortDescriptors:v13];

  long long v14 = [v37 allObjects];
  uint64_t v15 = +[PHAsset fetchAssetsWithLocalIdentifiers:v14 options:v11];

  unint64_t v17 = 0;
  os_log_type_t type = VCPLogToOSLogType[6];
  CFStringRef v18 = @"inserted";
  if (!v41) {
    CFStringRef v18 = @"editted";
  }
  CFStringRef v36 = v18;
  *(void *)&long long v16 = 138412546;
  long long v35 = v16;
  while (v17 < (unint64_t)objc_msgSend(v15, "count", v35, v36))
  {
    signed int v20 = [v15 objectAtIndexedSubscript:v17];
    if ([(VCPFaceLibraryProcessingTask *)self isCancelled])
    {
      char v21 = 0;
      int v6 = -128;
      goto LABEL_28;
    }
    if (!v41)
    {
      id v22 = [v20 objectID];
      if (([v40 contentOrThumbnailChangedForPHAssetOID:v22] & 1) == 0)
      {
        os_log_type_t v31 = [v20 objectID];
        if (![v40 trashedStateChangedForPHAssetOID:v31]
          || ([v20 isTrashed] & 1) != 0)
        {
          id v32 = [v20 objectID];
          if (([v40 hiddenStateChangedForPHAssetOID:v32] & 1) == 0)
          {

LABEL_27:
            char v21 = 1;
            goto LABEL_28;
          }
          unsigned __int8 v33 = [v20 isHidden];

          if (v33) {
            goto LABEL_27;
          }
          goto LABEL_10;
        }
      }
    }
LABEL_10:
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      int v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, type))
      {
        v24 = [v20 localIdentifier];
        *(_DWORD *)buf = v35;
        *(void *)&uint8_t buf[4] = v24;
        __int16 v45 = 2112;
        CFStringRef v46 = v36;
        _os_log_impl((void *)&_mh_execute_header, v23, type, "[FaceLibraryProcessing][%@] Asset %@", buf, 0x16u);
      }
    }
    *(void *)buf = 0;
    int v43 = 0;
    id v25 = [v42 database];
    id v26 = [v20 localIdentifier];
    unsigned int v27 = [v25 queryProcessingStatus:buf attempts:&v43 lastAttemptDate:0 andNextAttemptDate:0 forLocalIdentifier:v26 andTaskID:3];

    if (!v27 && v43 && (*(void *)buf == 7 || *(void *)buf == 2))
    {
      unsigned int v28 = [v42 database];
      int v29 = [v20 localIdentifier];
      [v28 removeProcessingStatusForLocalIdentifier:v29 andTaskID:3];
    }
    unsigned int v30 = [(VCPFaceLibraryProcessingTask *)self _addBatchWithAsset:v20 isRetry:0 withTask:v42];
    if (!v30) {
      goto LABEL_27;
    }
    char v21 = 0;
    int v6 = v30;
LABEL_28:

    ++v17;
    if ((v21 & 1) == 0) {
      goto LABEL_32;
    }
  }
  int v6 = 0;
LABEL_32:

  return v6;
}

- (int)_maintainProcessingStatusWithTask:(id)a3
{
  id v40 = a3;
  os_log_type_t v4 = [v40 database];
  id v41 = 0;
  [v4 fetchLocalIdentifiers:&v41 withTaskID:3 andProcessingStatus:1];
  id v38 = v41;

  id v37 = (char *)[v38 count];
  if (!v37) {
    goto LABEL_57;
  }
  int v5 = [v40 photoLibrary];
  CFStringRef v36 = +[PHAsset vcp_fetchOptionsForLibrary:v5 forTaskID:3];

  int v6 = +[PHAsset fetchAssetsWithLocalIdentifiers:v38 options:v36];
  unint64_t v7 = 0;
  os_log_type_t type = VCPLogToOSLogType[5];
  os_log_type_t v8 = VCPLogToOSLogType[6];
  *(void *)&long long v9 = 138412290;
  long long v35 = v9;
  while (v7 < (unint64_t)objc_msgSend(v6, "count", v35))
  {
    os_log_type_t v11 = [v6 objectAtIndexedSubscript:v7];
    os_log_type_t v12 = [v11 photoLibrary];
    if (objc_msgSend(v12, "mad_pauseFCPeopleFurtherProcessing"))
    {
      unsigned int v13 = [v11 faceAnalysisVersion];
      if (_os_feature_enabled_impl()) {
        int v14 = 14;
      }
      else {
        int v14 = 11;
      }
      BOOL v15 = v14 == v13;

      if (v15)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          long long v16 = VCPLogInstance();
          if (os_log_type_enabled(v16, type))
          {
            unint64_t v17 = [v11 localIdentifier];
            *(_DWORD *)buf = v35;
            int v43 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, type, "[FaceLibraryProcessing][%@] already with FC version; skip",
              buf,
              0xCu);
          }
        }
        int v18 = 4;
        goto LABEL_17;
      }
    }
    else
    {
    }
    if (objc_msgSend(v11, "vcp_needsFaceProcessing"))
    {
      int v18 = 0;
LABEL_17:
      id v19 = v3;
      goto LABEL_18;
    }
    signed int v20 = [v40 database];
    char v21 = [v11 localIdentifier];
    id v22 = [v20 removeProcessingStatusForLocalIdentifier:v21 andTaskID:3];

    if (v22 == -108 || v22 == -36)
    {
      id v19 = v22;
    }
    else
    {
      id v19 = v22;
      if (v22 != -23) {
        id v19 = v3;
      }
    }
    int v18 = 1;
    if (v22 != -108 && v22 != -36 && v22 != -23)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        int v23 = VCPLogInstance();
        if (os_log_type_enabled(v23, v8))
        {
          v24 = [v11 localIdentifier];
          *(_DWORD *)buf = v35;
          int v43 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, v8, "[FaceLibraryProcessing][%@] Analysis is up-to-date", buf, 0xCu);
        }
      }
      int v18 = 0;
      --v37;
    }
LABEL_18:

    if ((v18 | 4) != 4) {
      goto LABEL_46;
    }
    ++v7;
    id v3 = v19;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v25 = VCPLogInstance();
    if (os_log_type_enabled(v25, v8))
    {
      *(_DWORD *)buf = 134217984;
      int v43 = v37;
      _os_log_impl((void *)&_mh_execute_header, v25, v8, "[FaceLibraryProcessing] Change %lu processing status to Hard Failure", buf, 0xCu);
    }
  }
  id v26 = [v40 database];
  unsigned int v27 = [v26 hardFailAllRunningProcessingStatusForTaskID:3];

  if (v27 == -108 || v27 == -36)
  {
    unsigned int v28 = v27;
  }
  else
  {
    unsigned int v28 = v27;
    if (v27 != -23) {
      unsigned int v28 = v3;
    }
  }
  if (v27 == -108 || v27 == -36 || v27 == -23)
  {
    LODWORD(v19) = v28;
LABEL_46:

    goto LABEL_61;
  }
  int v29 = [v40 database];
  unsigned int v30 = [v29 commit];

  if (v30 == -108 || v30 == -36)
  {
    LODWORD(v19) = v30;
  }
  else
  {
    LODWORD(v19) = v30;
    if (v30 != -23) {
      LODWORD(v19) = v28;
    }
  }
  if (v30 == -108 || v30 == -36 || v30 == -23) {
    goto LABEL_46;
  }
  os_log_type_t v31 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v31 accumulateInt64Value:v37 forField:@"NumberOfAssetsHardFailure" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

LABEL_57:
  if ((int)MediaAnalysisLogLevel() < 6)
  {
    LODWORD(v19) = 0;
  }
  else
  {
    id v32 = VCPLogInstance();
    os_log_type_t v33 = VCPLogToOSLogType[6];
    CFStringRef v36 = v32;
    if (os_log_type_enabled(v32, v33))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "[FaceLibraryProcessing] Processing status is up-to-date", buf, 2u);
    }
    LODWORD(v19) = 0;
LABEL_61:
  }
  return (int)v19;
}

- (int)_processLibrary:(id)a3
{
  id v4 = a3;
  int v5 = [(VCPFaceLibraryProcessingTask *)self _processingTaskForPhotoLibrary:v4];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000CF198;
  v28[3] = &unk_100219D98;
  v28[4] = self;
  int v6 = objc_retainBlock(v28);
  unint64_t v7 = [v5 photoLibrary];
  +[VCPAnalysisProgressQuery reportProgressForPhotoLibrary:v7 taskID:3 logMessage:@"[FaceLibraryProcessing] Before task" cancelOrExtendTimeoutBlock:v6];

  id v8 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v8 start];
  unsigned int v9 = [(VCPFaceLibraryProcessingTask *)self _maintainProcessingStatusWithTask:v5];
  if (!v9)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      unint64_t v10 = VCPLogInstance();
      os_log_type_t v11 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v10, v11))
      {
        os_log_type_t v12 = [v5 database];
        unsigned int v13 = [v12 queryAssetCountForTaskID:3];
        *(_DWORD *)buf = 67109120;
        unsigned int v30 = v13;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "[FaceLibraryProcessing] Start with %d failed assets", buf, 8u);
      }
    }
    unsigned int v9 = [(VCPFaceLibraryProcessingTask *)self _analyzeAllAssetsWithTask:v5];
    if (!v9)
    {
      unsigned int v9 = [(VCPFaceLibraryProcessingTask *)self _streamAnalysisWithTask:v5 andProcessingStatus:2];
      if (!v9) {
        unsigned int v9 = [(VCPFaceLibraryProcessingTask *)self _retryFailedAssetsWithTask:v5];
      }
    }
  }
  unsigned int v15 = [v5 flush];
  long long v16 = [v5 database];
  int v17 = [v16 commit];

  if (v17 != -108 && v17 != -36 && v17 != -23)
  {
    int v18 = [v5 database];
    [v18 flush];

    [v8 stop];
    [v8 elapsedTimeSeconds];
    signed int v20 = +[NSString stringWithFormat:@"[FaceLibraryProcessing] Checking progress after task (%.2f seconds)", v19];
    char v21 = [v5 photoLibrary];
    +[VCPAnalysisProgressQuery reportProgressForPhotoLibrary:v21 taskID:3 logMessage:v20 cancelOrExtendTimeoutBlock:v6];

    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v22 = VCPLogInstance();
      os_log_type_t v23 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v22, v23))
      {
        v24 = [v5 database];
        unsigned int v25 = [v24 queryAssetCountForTaskID:3];
        *(_DWORD *)buf = 67109120;
        unsigned int v30 = v25;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "[FaceLibraryProcessing] Finished with with %d failed assets", buf, 8u);
      }
    }
    id v26 = [v5 database];
    [v26 cacheCurrentFaceProgress];

    if (v15) {
      int v17 = v15;
    }
    else {
      int v17 = v9;
    }
  }
  return v17;
}

- (int)completeSceneProcessing
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000CF410;
  v10[3] = &unk_10021BEF0;
  v10[4] = self;
  id v4 = objc_retainBlock(v10);
  photoLibraries = self->_photoLibraries;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000CF504;
  v9[3] = &unk_100219D98;
  v9[4] = self;
  int v6 = +[VCPMADSceneLibraryProcessingTask taskWithPhotoLibraries:photoLibraries cancelBlock:v9 progressHandler:v4 andCompletionHandler:&stru_10021CE40];
  int v7 = [v6 run];

  return v7;
}

- (BOOL)_readyToProcessProcessLibrary:(id)a3
{
  id v3 = a3;
  if (([v3 isReadyForAnalysis] & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      int v5 = VCPLogInstance();
      os_log_type_t v6 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v5, v6))
      {
        int v7 = [v3 photoLibraryURL];
        id v8 = [v7 path];
        int v13 = 138412290;
        int v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "[FaceLibraryProcessing] Photo Library is not ready for analysis; skipping library (%@)",
          (uint8_t *)&v13,
          0xCu);
      }
      goto LABEL_10;
    }
LABEL_11:
    BOOL v4 = 0;
    goto LABEL_12;
  }
  if ((objc_msgSend(v3, "vcp_anyAssetsForTaskID:", 3) & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      int v5 = VCPLogInstance();
      os_log_type_t v9 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v5, v9))
      {
        unint64_t v10 = [v3 photoLibraryURL];
        os_log_type_t v11 = [v10 path];
        int v13 = 138412290;
        int v14 = v11;
        _os_log_impl((void *)&_mh_execute_header, v5, v9, "[FaceLibraryProcessing] Photo library is empty; skipping library (%@)",
          (uint8_t *)&v13,
          0xCu);
      }
LABEL_10:

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  BOOL v4 = 1;
LABEL_12:

  return v4;
}

- (int)_detectFacesForPhotoLibrary:(id)a3
{
  id v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    int v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[FaceLibraryProcessing] Start face detect and feature extraction", buf, 2u);
    }
  }
  int v7 = [(VCPFaceLibraryProcessingTask *)self _processLibrary:v4];
  if (v7)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v8 = VCPLogInstance();
      os_log_type_t v9 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v8, v9))
      {
        __int16 v14 = 0;
        unint64_t v10 = "Finished face detect and feature extraction";
        os_log_type_t v11 = (uint8_t *)&v14;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v8, v9, v10, v11, 2u);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v8, v9))
    {
      __int16 v13 = 0;
      unint64_t v10 = "[FaceLibraryProcessing] Finished face detect and feature extraction";
      os_log_type_t v11 = (uint8_t *)&v13;
      goto LABEL_12;
    }
LABEL_13:
  }
  return v7;
}

- (int)_generateAndDetectFaceCropsForPhotoLibrary:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[v4 countOfFaceCropsToBeGenerated];
  unint64_t v6 = (unint64_t)[v4 countOfUnprocessedFaceCrops];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    int v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[FaceLibraryProcessing] Start FaceCrop generation and detection", buf, 2u);
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    os_log_type_t v9 = VCPLogInstance();
    os_log_type_t v10 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "[FaceLibraryProcessing] countOfFaceCropsToBeGenerated: %lu, countOfUnprocessedFaceCrops: %lu", buf, 0x16u);
    }
  }
  if (v5 | v6)
  {
    os_log_type_t v11 = [(VCPFaceLibraryProcessingTask *)self _processingTaskForPhotoLibrary:v4];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    int v37 = 0;
    os_log_type_t v12 = [v11 photoLibrary];
    id v13 = objc_msgSend(v12, "vcp_supportsInMemoryDownload");

    if (!v13
      || ([v11 photoLibrary],
          __int16 v14 = objc_claimAutoreleasedReturnValue(),
          unsigned int v15 = objc_msgSend(v14, "vcp_allowInMemoryDownload"),
          v14,
          v15))
    {
      [v11 setAllowStreaming:v13];
      unsigned int v28 = _NSConcreteStackBlock;
      uint64_t v29 = 3221225472;
      unsigned int v30 = sub_1000CFC4C;
      os_log_type_t v31 = &unk_100219F30;
      os_log_type_t v33 = buf;
      id v32 = v11;
      long long v16 = objc_retainBlock(&v28);
      int v17 = +[VCPMADQoSManager sharedManager];
      [v17 runBlock:v16 withTaskID:3];
    }
    if (*(_DWORD *)(*(void *)&buf[8] + 24))
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        int v18 = VCPLogInstance();
        os_log_type_t v19 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v18, v19))
        {
          int v20 = *(_DWORD *)(*(void *)&buf[8] + 24);
          *(_DWORD *)long long v34 = 67109120;
          int v35 = v20;
          char v21 = "[FaceLibraryProcessing] Failed to generate and detect FaceCrops - %d";
          id v22 = v18;
          os_log_type_t v23 = v19;
          uint32_t v24 = 8;
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v22, v23, v21, v34, v24);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 6)
    {
      int v18 = VCPLogInstance();
      os_log_type_t v26 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v18, v26))
      {
        *(_WORD *)long long v34 = 0;
        char v21 = "[FaceLibraryProcessing] Finished FaceCrop generation and detection";
        id v22 = v18;
        os_log_type_t v23 = v26;
        uint32_t v24 = 2;
        goto LABEL_21;
      }
LABEL_22:
    }
    int v25 = *(_DWORD *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);

    goto LABEL_24;
  }
  int v25 = 0;
LABEL_24:

  return v25;
}

- (int)_updateQuickFaceIDModelForPhotoLibrary:(id)a3 withContext:(id)a4 andQuickFaceIDManager:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000D0038;
  v22[3] = &unk_100219D98;
  void v22[4] = self;
  os_log_type_t v9 = objc_retainBlock(v22);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000D0040;
  v21[3] = &unk_100219FC8;
  v21[4] = self;
  os_log_type_t v10 = objc_retainBlock(v21);
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v11 = VCPLogInstance();
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[FaceLibraryProcessing] Start QuickFaceID model update", buf, 2u);
    }
  }
  char v20 = 0;
  int v13 = [v8 generateVIPModelWithType:0 ignoreLastGenerationTime:0 evaluationMode:0 allowUnverifiedPerson:0 modelGenerated:&v20 extendTimeout:v10 andCancel:v9];
  if (!v13)
  {
    if (v20)
    {
      __int16 v14 = +[VCPMADCoreAnalyticsManager sharedManager];
      [v14 accumulateInt64Value:1 forField:@"PeopleVIPGenerated" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
    }
    int v13 = [v8 generateVIPModelWithType:1 ignoreLastGenerationTime:0 evaluationMode:0 allowUnverifiedPerson:0 modelGenerated:&v20 extendTimeout:v10 andCancel:v9];
    if (!v13)
    {
      if (v20)
      {
        int v18 = +[VCPMADCoreAnalyticsManager sharedManager];
        [v18 accumulateInt64Value:1 forField:@"PetsVIPGenerated" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
      }
      if ((objc_msgSend(v7, "mad_useVUGallery") & 1) != 0
        || (int v13 = [v8 classifyVIPPets]) == 0)
      {
        if ((int)MediaAnalysisLogLevel() < 6)
        {
          int v13 = 0;
          goto LABEL_13;
        }
        unsigned int v15 = VCPLogInstance();
        os_log_type_t v19 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v15, v19))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, v19, "[FaceLibraryProcessing] Finished QuickFaceID model update", buf, 2u);
        }
        int v13 = 0;
        goto LABEL_12;
      }
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    unsigned int v15 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 67109120;
      int v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[FaceLibraryProcessing] Failed to update QuickFaceID model - %d", buf, 8u);
    }
LABEL_12:
  }
LABEL_13:

  return v13;
}

- (int)_clusterFacesWithClusterer:(id)a3
{
  uint64_t v24 = 0;
  int v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  int v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  char v20 = sub_1000D03A0;
  char v21 = &unk_100219F30;
  os_log_type_t v23 = &v24;
  id v3 = a3;
  id v22 = v3;
  id v4 = objc_retainBlock(&v18);
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    unint64_t v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[FaceLibraryProcessing]  Start face clustering", buf, 2u);
    }
  }
  id v7 = +[VCPMADQoSManager sharedManager];
  [v7 runBlock:v4 withTaskID:3];

  if (*((_DWORD *)v25 + 6))
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v8 = VCPLogInstance();
      os_log_type_t v9 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v8, v9))
      {
        int v10 = *((_DWORD *)v25 + 6);
        *(_DWORD *)buf = 67109120;
        int v29 = v10;
        os_log_type_t v11 = "[FaceLibraryProcessing] Failed to cluster faces - %d";
        os_log_type_t v12 = v8;
        os_log_type_t v13 = v9;
        uint32_t v14 = 8;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, buf, v14);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v8 = VCPLogInstance();
    os_log_type_t v15 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v8, v15))
    {
      *(_WORD *)buf = 0;
      os_log_type_t v11 = "[FaceLibraryProcessing] Finished face clustering";
      os_log_type_t v12 = v8;
      os_log_type_t v13 = v15;
      uint32_t v14 = 2;
      goto LABEL_12;
    }
LABEL_13:
  }
  os_log_type_t v16 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v16 accumulateInt64Value:1 forField:@"NumberOfClusterEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

  LODWORD(v16) = *((_DWORD *)v25 + 6);
  _Block_object_dispose(&v24, 8);

  return (int)v16;
}

- (int)_buildPersonsForPhotoLibrary:(id)a3 withClusterer:(id)a4 andContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000D0820;
  v41[3] = &unk_100219D98;
  v41[4] = self;
  os_log_type_t v11 = objc_retainBlock(v41);
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x2020000000;
  int v40 = 0;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000D0828;
  v30[3] = &unk_10021CE88;
  CFStringRef v36 = &v37;
  id v12 = v8;
  id v31 = v12;
  id v13 = v9;
  id v32 = v13;
  id v14 = v10;
  id v33 = v14;
  long long v34 = &stru_10021CE60;
  os_log_type_t v15 = v11;
  id v35 = v15;
  os_log_type_t v16 = objc_retainBlock(v30);
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    int v17 = VCPLogInstance();
    os_log_type_t v18 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v17, v18))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "[FaceLibraryProcessing] Start person building", buf, 2u);
    }
  }
  uint64_t v19 = +[VCPMADQoSManager sharedManager];
  [v19 runBlock:v16 withTaskID:3];

  if (*((_DWORD *)v38 + 6))
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      char v20 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v20, v21))
      {
        int v22 = *((_DWORD *)v38 + 6);
        *(_DWORD *)buf = 67109120;
        int v43 = v22;
        os_log_type_t v23 = "[FaceLibraryProcessing] Failed to build persons - %d";
        uint64_t v24 = v20;
        os_log_type_t v25 = v21;
        uint32_t v26 = 8;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v24, v25, v23, buf, v26);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 6)
  {
    char v20 = VCPLogInstance();
    os_log_type_t v27 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v20, v27))
    {
      *(_WORD *)buf = 0;
      os_log_type_t v23 = "[FaceLibraryProcessing] Finished person building";
      uint64_t v24 = v20;
      os_log_type_t v25 = v27;
      uint32_t v26 = 2;
      goto LABEL_12;
    }
LABEL_13:
  }
  unsigned int v28 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v28 accumulateInt64Value:1 forField:@"NumberOfPersonBuildingEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

  LODWORD(v28) = *((_DWORD *)v38 + 6);
  _Block_object_dispose(&v37, 8);

  return (int)v28;
}

- (int)_clusterAndProcessPersonsForPhotoLibrary:(id)a3 withContext:(id)a4 progressMade:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000D0E88;
  v35[3] = &unk_100219D98;
  v35[4] = self;
  id v10 = objc_retainBlock(v35);
  *a5 = 0;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v11 = VCPLogInstance();
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[FaceLibraryProcessing] Started face clustering and person workflow", buf, 2u);
    }
  }
  if ((self->_subtasks & 0x10) != 0)
  {
    id v26 = objc_msgSend(v8, "mad_countOfUnclusteredFaces");
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      os_log_type_t v27 = VCPLogInstance();
      os_log_type_t v28 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v27, v28))
      {
        *(_DWORD *)buf = 134217984;
        id v37 = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "[FaceLibraryProcessing] countOfUnclusteredFaces (before): %lu", buf, 0xCu);
      }
    }
    if ([(VCPFaceLibraryProcessingTask *)self isCancelled])
    {
      id v13 = 0;
LABEL_43:
      int v17 = -128;
      goto LABEL_44;
    }
    id v30 = [objc_alloc((Class)VCPFaceClusterer) initWithPhotoLibrary:v8 context:v9 cancelOrExtendTimeoutBlock:v10];
    id v13 = v30;
    if (v26 || [v30 clustererState] != (id)40)
    {
      int v17 = [(VCPFaceLibraryProcessingTask *)self _clusterFacesWithClusterer:v13];
      if (v17) {
        goto LABEL_44;
      }
    }
    id v31 = objc_msgSend(v8, "mad_countOfUnclusteredFaces");
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v32 = VCPLogInstance();
      os_log_type_t v33 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v32, v33))
      {
        *(_DWORD *)buf = 134217984;
        id v37 = v31;
        _os_log_impl((void *)&_mh_execute_header, v32, v33, "[FaceLibraryProcessing] countOfUnclusteredFaces (after): %lu", buf, 0xCu);
      }
    }
    *a5 = v26 != v31;
  }
  else
  {
    id v13 = 0;
  }
  id v14 = [v8 countOfDirtyFaceGroups];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    os_log_type_t v15 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 134217984;
      id v37 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[FaceLibraryProcessing] countOfDirtyFaceGroups (before): %lu", buf, 0xCu);
    }
  }
  if (!v14) {
    goto LABEL_33;
  }
  if ([(VCPFaceLibraryProcessingTask *)self isCancelled]) {
    goto LABEL_43;
  }
  if (!v13) {
    id v13 = [objc_alloc((Class)VCPFaceClusterer) initWithPhotoLibrary:v8 context:v9 cancelOrExtendTimeoutBlock:v10];
  }
  if ([(VCPFaceLibraryProcessingTask *)self isCancelled]) {
    goto LABEL_43;
  }
  if ((self->_subtasks & 0x20) != 0)
  {
    int v17 = [(VCPFaceLibraryProcessingTask *)self _buildPersonsForPhotoLibrary:v8 withClusterer:v13 andContext:v9];
    if (v17) {
      goto LABEL_44;
    }
    id v18 = [v8 countOfDirtyFaceGroups];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v19 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v19, v20))
      {
        *(_DWORD *)buf = 134217984;
        id v37 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "[FaceLibraryProcessing] countOfDirtyFaceGroups (after): %lu", buf, 0xCu);
      }
    }
    BOOL v22 = *a5 || v14 != v18;
    *a5 = v22;
  }
  if ([(VCPFaceLibraryProcessingTask *)self isCancelled]) {
    goto LABEL_43;
  }
  if ((self->_subtasks & 0x40) == 0
    || !*a5
    || ([(VCPFaceLibraryProcessingTask *)self _processingTaskForPhotoLibrary:v8],
        os_log_type_t v23 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v23 promotePersons],
        v23,
        !v17))
  {
LABEL_33:
    if ((int)MediaAnalysisLogLevel() < 6)
    {
      int v17 = 0;
      goto LABEL_57;
    }
    uint64_t v24 = VCPLogInstance();
    os_log_type_t v25 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v24, v25))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "[FaceLibraryProcessing] Finished face clustering and person workflow", buf, 2u);
    }
    int v17 = 0;
    goto LABEL_47;
  }
LABEL_44:
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v24 = VCPLogInstance();
    os_log_type_t v29 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v24, v29))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v37) = v17;
      _os_log_impl((void *)&_mh_execute_header, v24, v29, "[FaceLibraryProcessing] Failed to cluster and build persons - %d", buf, 8u);
    }
LABEL_47:
  }
LABEL_57:

  return v17;
}

- (int)_processAutoCounterForPhotoLibrary:(id)a3
{
  id v4 = a3;
  int v5 = _os_feature_enabled_impl();
  if ([v4 isSystemPhotoLibrary] & v5) == 1 && (VCPMAIsAppleInternal())
  {
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_1000D1A64;
    v66[3] = &unk_100219D98;
    v66[4] = self;
    id v58 = objc_retainBlock(v66);
    os_log_type_t v6 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"SkipAutoCounters"];
    if (v6)
    {
      id v7 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"SkipAutoCounters"];
      BOOL v8 = [v7 integerValue] == (id)1;
    }
    else
    {
      BOOL v8 = 0;
    }

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v10 = VCPLogInstance();
      os_log_type_t v11 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v10, v11))
      {
        CFStringRef v12 = @"NO";
        if (v8) {
          CFStringRef v12 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        CFStringRef v68 = @"[FaceLibraryProcessing][AutoCounter]";
        __int16 v69 = 2112;
        uint64_t v70 = (uint64_t)v12;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "%@ Skipping - %@", buf, 0x16u);
      }
    }
    if (v8)
    {
      int v9 = 0;
LABEL_73:

      goto LABEL_74;
    }
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_1000D1A6C;
    v65[3] = &unk_100219D98;
    v65[4] = self;
    v57 = objc_retainBlock(v65);
    id v64 = 0;
    +[VCPAnalysisProgressQuery queryProgressDetail:&v64 photoLibrary:v4 taskID:3 cancelOrExtendTimeoutBlock:v57];
    id v13 = v64;
    id v14 = [v13 objectForKeyedSubscript:@"total-allowed"];
    uint64_t v15 = (uint64_t)[v14 integerValue];

    os_log_type_t v16 = [v13 objectForKeyedSubscript:@"processed"];
    id v17 = [v16 integerValue];

    id v18 = [v13 objectForKeyedSubscript:@"failed"];
    id v19 = [v18 integerValue];

    if (v15 < 1)
    {
      BOOL v21 = 0;
      BOOL v20 = 0;
      BOOL v22 = 0;
      BOOL v23 = 0;
      BOOL v24 = 0;
      if (!v15) {
        goto LABEL_19;
      }
    }
    else
    {
      BOOL v20 = 100 * ((uint64_t)v17 + (uint64_t)v19) / v15 > 98;
      BOOL v21 = 100 * (uint64_t)v19 / v15 > 5;
    }
    BOOL v24 = v20 && !v21;
    BOOL v22 = v21;
    BOOL v23 = v20;
LABEL_19:
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      os_log_type_t v25 = VCPLogInstance();
      os_log_type_t v26 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v25, v26))
      {
        *(_DWORD *)buf = 138413058;
        CFStringRef v68 = @"[FaceLibraryProcessing][AutoCounter]";
        __int16 v69 = 2048;
        uint64_t v70 = v15;
        __int16 v71 = 2048;
        id v72 = v17;
        __int16 v73 = 2048;
        id v74 = v19;
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "%@ Progress: totalCount = %ld, processed = %ld, failed = %ld", buf, 0x2Au);
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      os_log_type_t v27 = VCPLogInstance();
      os_log_type_t v28 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v27, v28))
      {
        os_log_type_t v29 = +[NSNumber numberWithBool:v23];
        id v30 = +[NSNumber numberWithBool:v22];
        *(_DWORD *)buf = 138412802;
        CFStringRef v68 = @"[FaceLibraryProcessing][AutoCounter]";
        __int16 v69 = 2112;
        uint64_t v70 = (uint64_t)v29;
        __int16 v71 = 2112;
        id v72 = v30;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "%@ Progress: isFaceProcessingDone = %@, tooManyFailed = %@", buf, 0x20u);
      }
    }
    if (!v24)
    {
      int v9 = 0;
LABEL_72:

      goto LABEL_73;
    }
    id v31 = +[VCPPhotosAutoCounterWorker workerWithPhotoLibrary:v4];
    id v32 = [v31 optInPersonCount];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      os_log_type_t v33 = VCPLogInstance();
      os_log_type_t v34 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v33, v34))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v68 = @"[FaceLibraryProcessing][AutoCounter]";
        __int16 v69 = 2048;
        uint64_t v70 = (uint64_t)v32;
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "%@ Opt-in person count - %lu", buf, 0x16u);
      }
    }
    if (!v32)
    {
      int v9 = 0;
LABEL_71:

      goto LABEL_72;
    }
    if (objc_msgSend(v4, "mad_useVUGallery"))
    {
      uint64_t v62 = 0;
      uint64_t v63 = 0;
      id v35 = (id *)&v62;
      CFStringRef v36 = (id *)&v63;
      unsigned int v37 = [v31 exportVUGalleryClusterStates:&v63 error:&v62 extendTimeoutBlock:&stru_10021CEA8 cancelBlock:v58];
    }
    else
    {
      uint64_t v60 = 0;
      uint64_t v61 = 0;
      id v35 = (id *)&v60;
      CFStringRef v36 = (id *)&v61;
      unsigned int v37 = [v31 exportClustersStates:&v61 error:&v60 extendTimeoutBlock:&stru_10021CEA8 cancelBlock:v58];
    }
    unsigned int v38 = v37;
    id v39 = *v36;
    id v40 = *v35;
    if (v38)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v9 = 0;
LABEL_70:

        goto LABEL_71;
      }
      id v41 = VCPLogInstance();
      os_log_type_t v42 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v41, v42))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v68 = @"[FaceLibraryProcessing][AutoCounter]";
        __int16 v69 = 2112;
        uint64_t v70 = (uint64_t)v40;
        _os_log_impl((void *)&_mh_execute_header, v41, v42, "%@ Failed to export cluster state - %@", buf, 0x16u);
      }
      goto LABEL_68;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      int v43 = VCPLogInstance();
      os_log_type_t v44 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v43, v44))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v68 = @"[FaceLibraryProcessing][AutoCounter]";
        __int16 v69 = 2112;
        uint64_t v70 = (uint64_t)v39;
        _os_log_impl((void *)&_mh_execute_header, v43, v44, "%@ Exported cluster state to %@", buf, 0x16u);
      }
    }
    v59[1] = 0;
    VCPFetchPersonPromoterClusterForEvaluation();
    id v41 = 0;
    unsigned int v45 = [v31 calculateAndReportClusterAccuracyWithVisionClusterURL:v39 andPersonClusters:v41 results:0 extendTimeoutBlock:&stru_10021CEA8 cancelBlock:v58];
    if (v45)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
LABEL_68:
        int v9 = 0;
LABEL_69:

        goto LABEL_70;
      }
      CFStringRef v46 = VCPLogInstance();
      os_log_type_t v47 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v46, v47))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v68 = @"[FaceLibraryProcessing][AutoCounter]";
        __int16 v69 = 1024;
        LODWORD(v70) = v45;
        _os_log_impl((void *)&_mh_execute_header, v46, v47, "%@ Failed to process cluster state (%d)", buf, 0x12u);
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        long long v48 = VCPLogInstance();
        os_log_type_t v49 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v48, v49))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v68 = @"[FaceLibraryProcessing][AutoCounter]";
          _os_log_impl((void *)&_mh_execute_header, v48, v49, "%@ Successfully calculate and report AutoCounter", buf, 0xCu);
        }
      }
      CFStringRef v46 = +[VCPFaceProcessingVersionManager sharedManagerForPhotoLibrary:v4];
      if ((int)[v46 currentProcessingVersion] <= 14)
      {
        v59[0] = 0;
        int v9 = objc_msgSend(v4, "vcp_bumpFaceProcessingToVersion:withError:", 15, v59);
        id v50 = v59[0];
        if (v9)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            __int16 v51 = VCPLogInstance();
            os_log_type_t v52 = VCPLogToOSLogType[3];
            log = v51;
            if (os_log_type_enabled(v51, v52))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v68 = @"[FaceLibraryProcessing][AutoCounter]";
              __int16 v69 = 2112;
              uint64_t v70 = (uint64_t)v50;
              _os_log_impl((void *)&_mh_execute_header, log, v52, "%@ Failed to bump face processing version - %@", buf, 0x16u);
            }
          }
          goto LABEL_69;
        }
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          long long v53 = VCPLogInstance();
          os_log_type_t v54 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v53, v54))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v68 = @"[FaceLibraryProcessing][AutoCounter]";
            _os_log_impl((void *)&_mh_execute_header, v53, v54, "%@ Successfully bumpped face processing version", buf, 0xCu);
          }
        }
      }
    }

    goto LABEL_68;
  }
  int v9 = 0;
LABEL_74:

  return v9;
}

- (int)runLegacyProcessingForPhotoLibrary:(id)a3 progressHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:v6];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000D2130;
  v36[3] = &unk_100219D98;
  v36[4] = self;
  os_log_type_t v33 = objc_retainBlock(v36);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000D2138;
  v35[3] = &unk_100219FC8;
  v35[4] = self;
  int v9 = objc_retainBlock(v35);
  if ((self->_subtasks & 2) != 0)
  {
    int v10 = [(VCPFaceLibraryProcessingTask *)self _detectFacesForPhotoLibrary:v6];
    if (v10) {
      goto LABEL_44;
    }
  }
  if (objc_msgSend(v6, "vcp_isSyndicationLibrary"))
  {
    os_log_type_t v11 = +[VCPDefaultPhotoLibraryManager sharedManager];
    CFStringRef v12 = [v11 defaultPhotoLibrary];

    id v13 = [objc_alloc((Class)VCPPhotosQuickFaceIdentificationManager) initWithPhotoLibrary:v12];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000D21B8;
    v34[3] = &unk_100219D98;
    uint8_t v34[4] = self;
    [v13 personIdentificationForSyndicationPhotoLibrary:v6 withCancelOrExtendTimeoutBlock:v34];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v14 = VCPLogInstance();
      os_log_type_t v15 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v14, v15))
      {
        os_log_type_t v16 = [v6 photoLibraryURL];
        id v17 = [v16 path];
        *(_DWORD *)buf = 138412290;
        unsigned int v38 = v17;
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "[FaceLibraryProcessing] Skipping clustering and person processing for syndication library (%@)", buf, 0xCu);
      }
    }
    goto LABEL_41;
  }
  unint64_t subtasks = self->_subtasks;
  if ((subtasks & 8) != 0)
  {
    id v19 = [objc_alloc((Class)VCPPhotosQuickFaceIdentificationManager) initWithPhotoLibrary:v6];
    BOOL v20 = [v19 fetchEntityForModelType:0 evaluationMode:0 allowUnverifiedPerson:0];
    uint64_t v32 = (uint64_t)[v20 count];

    int v10 = [(VCPFaceLibraryProcessingTask *)self _updateQuickFaceIDModelForPhotoLibrary:v6 withContext:v8 andQuickFaceIDManager:v19];
    if (v10)
    {
      CFStringRef v12 = v19;
      goto LABEL_43;
    }
    CFStringRef v12 = v19;
    if ((self->_subtasks & 0x40) == 0) {
      goto LABEL_16;
    }
LABEL_14:
    if ((MADPersonPromoterHasProcessedForLibrary() & 1) == 0)
    {
      BOOL v21 = [(VCPFaceLibraryProcessingTask *)self _processingTaskForPhotoLibrary:v6];
      int v10 = [v21 promotePersons];

      if (v10) {
        goto LABEL_43;
      }
    }
    goto LABEL_16;
  }
  CFStringRef v12 = 0;
  uint64_t v32 = -1;
  if ((subtasks & 0x40) != 0) {
    goto LABEL_14;
  }
LABEL_16:
  id v13 = +[VCPProgressReporter reporterWithIntervalSeconds:10 andTotalJobCount:1 andBlock:v7];
  int v10 = 0;
  do
  {
    buf[0] = 0;
    unint64_t v23 = self->_subtasks;
    if ((v23 & 4) != 0)
    {
      unsigned int v24 = [(VCPFaceLibraryProcessingTask *)self _generateAndDetectFaceCropsForPhotoLibrary:v6];
      if (v24) {
        goto LABEL_22;
      }
      unint64_t v23 = self->_subtasks;
    }
    if ((v23 & 0x70) != 0)
    {
      unsigned int v24 = [(VCPFaceLibraryProcessingTask *)self _clusterAndProcessPersonsForPhotoLibrary:v6 withContext:v8 progressMade:buf];
      if (v24)
      {
LABEL_22:
        int v25 = 1;
        int v10 = v24;
        goto LABEL_26;
      }
    }
    if (buf[0])
    {
      int v25 = 0;
    }
    else
    {
      [v13 increaseProcessedJobCountByOne];
      int v25 = 11;
    }
LABEL_26:
  }
  while (!v25);
  if (v25 == 11)
  {
    if ((self->_subtasks & 8) == 0) {
      goto LABEL_38;
    }
    if (v32 == -1) {
      goto LABEL_38;
    }
    os_log_type_t v26 = [v12 fetchEntityForModelType:0 evaluationMode:0 allowUnverifiedPerson:0];
    BOOL v27 = 10 * (uint64_t)[v26 count] > (unint64_t)(11 * v32);

    if (!v27) {
      goto LABEL_38;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      os_log_type_t v28 = VCPLogInstance();
      os_log_type_t v29 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v28, v29))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "[FaceLibraryProcessing] Catch up VIP Persons Model", buf, 2u);
      }
    }
    buf[0] = 0;
    int v10 = [v12 generateVIPModelWithType:0 ignoreLastGenerationTime:1 evaluationMode:0 allowUnverifiedPerson:0 modelGenerated:buf extendTimeout:v9 andCancel:v33];
    if (!v10)
    {
      if (buf[0])
      {
        id v30 = +[VCPMADCoreAnalyticsManager sharedManager];
        [v30 accumulateInt64Value:1 forField:@"PeopleVIPGenerated" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
      }
LABEL_38:
      if ((self->_subtasks & 0x80) != 0) {
        [(VCPFaceLibraryProcessingTask *)self _processAutoCounterForPhotoLibrary:v6];
      }
      (*((void (**)(double))self->_progressHandler + 2))(100.0);
LABEL_41:
      int v10 = 0;
    }
  }

LABEL_43:
LABEL_44:

  return v10;
}

- (int)runGalleryProcessingForPhotoLibrary:(id)a3 progressHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v32 = +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:v6];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000D2874;
  v35[3] = &unk_100219D98;
  v35[4] = self;
  id v30 = objc_retainBlock(v35);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000D287C;
  v34[3] = &unk_100219FC8;
  uint8_t v34[4] = self;
  id v31 = objc_retainBlock(v34);
  if ((self->_subtasks & 2) != 0)
  {
    int v8 = [(VCPFaceLibraryProcessingTask *)self _detectFacesForPhotoLibrary:v6];
    if (v8) {
      goto LABEL_41;
    }
  }
  if (objc_msgSend(v6, "vcp_isSyndicationLibrary") && (_os_feature_enabled_impl() & 1) == 0)
  {
    unint64_t v23 = +[VCPDefaultPhotoLibraryManager sharedManager];
    id v9 = [v23 defaultPhotoLibrary];

    id v11 = [objc_alloc((Class)VCPPhotosQuickFaceIdentificationManager) initWithPhotoLibrary:v9];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000D28FC;
    v33[3] = &unk_100219D98;
    v33[4] = self;
    [v11 personIdentificationForSyndicationPhotoLibrary:v6 withCancelOrExtendTimeoutBlock:v33];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      unsigned int v24 = VCPLogInstance();
      os_log_type_t v25 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v24, v25))
      {
        os_log_type_t v26 = [v6 photoLibraryURL];
        BOOL v27 = [v26 path];
        *(_DWORD *)buf = 138412290;
        unsigned int v37 = v27;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "[FaceLibraryProcessing] Skipping clustering and person processing for syndication library (%@)", buf, 0xCu);
      }
    }
    goto LABEL_38;
  }
  if ((self->_subtasks & 8) != 0 && (objc_msgSend(v6, "vcp_isSyndicationLibrary") & 1) == 0)
  {
    id v9 = [objc_alloc((Class)VCPPhotosQuickFaceIdentificationManager) initWithPhotoLibrary:v6];
    os_log_type_t v29 = [v9 fetchEntityForModelType:0 evaluationMode:0 allowUnverifiedPerson:0];
    uint64_t v10 = (uint64_t)[v29 count];

    int v8 = [(VCPFaceLibraryProcessingTask *)self _updateQuickFaceIDModelForPhotoLibrary:v6 withContext:v32 andQuickFaceIDManager:v9];
    if (v8) {
      goto LABEL_40;
    }
  }
  else
  {
    id v9 = 0;
    uint64_t v10 = -1;
  }
  id v11 = +[VCPProgressReporter reporterWithIntervalSeconds:10 andTotalJobCount:1 andBlock:v7];
  int v8 = 0;
  do
  {
    buf[0] = 0;
    unint64_t subtasks = self->_subtasks;
    if ((subtasks & 4) != 0)
    {
      unsigned int v14 = [(VCPFaceLibraryProcessingTask *)self _generateAndDetectFaceCropsForPhotoLibrary:v6];
      if (v14)
      {
        int v15 = 1;
        int v8 = v14;
        goto LABEL_19;
      }
      unint64_t subtasks = self->_subtasks;
    }
    if ((subtasks & 0x70) != 0
      && ([(VCPFaceLibraryProcessingTask *)self _processingTaskForPhotoLibrary:v6],
          os_log_type_t v16 = objc_claimAutoreleasedReturnValue(),
          unsigned int v17 = [v16 processGalleryPersons:buf],
          v16,
          v17))
    {
      int v15 = 1;
      int v8 = v17;
    }
    else if (buf[0])
    {
      int v15 = 0;
    }
    else
    {
      [v11 increaseProcessedJobCountByOne];
      int v15 = 9;
    }
LABEL_19:
  }
  while (!v15);
  if (v15 == 9)
  {
    if ((self->_subtasks & 8) == 0) {
      goto LABEL_31;
    }
    if (v10 == -1) {
      goto LABEL_31;
    }
    id v18 = [v9 fetchEntityForModelType:0 evaluationMode:0 allowUnverifiedPerson:0];
    BOOL v19 = 10 * (uint64_t)[v18 count] > (unint64_t)(11 * v10);

    if (!v19) {
      goto LABEL_31;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      BOOL v20 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v20, v21))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "[FaceLibraryProcessing] Catch up VIP Persons Model", buf, 2u);
      }
    }
    buf[0] = 0;
    int v8 = [v9 generateVIPModelWithType:0 ignoreLastGenerationTime:1 evaluationMode:0 allowUnverifiedPerson:0 modelGenerated:buf extendTimeout:v31 andCancel:v30];
    if (!v8)
    {
      if (buf[0])
      {
        BOOL v22 = +[VCPMADCoreAnalyticsManager sharedManager];
        [v22 accumulateInt64Value:1 forField:@"PeopleVIPGenerated" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
      }
LABEL_31:
      if ((self->_subtasks & 0x80) != 0) {
        [(VCPFaceLibraryProcessingTask *)self _processAutoCounterForPhotoLibrary:v6];
      }
      (*((void (**)(double))self->_progressHandler + 2))(100.0);
LABEL_38:
      int v8 = 0;
    }
  }

LABEL_40:
LABEL_41:

  return v8;
}

- (int)run
{
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  if (self->_subtasks)
  {
    unsigned int v3 = [(VCPFaceLibraryProcessingTask *)self completeSceneProcessing];
    if (v3)
    {
      int v4 = v3;
      (*((void (**)(void))self->_completionHandler + 2))();
      return v4;
    }
  }
  int v5 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v5);

  id v6 = VCPSignPostLog();
  id v7 = v6;
  unint64_t v8 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPFaceLibraryProcessingTask", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  id v9 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v9 start];
  (*((void (**)(double))self->_progressHandler + 2))(10.0);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000D2F4C;
  v39[3] = &unk_10021BEF0;
  void v39[4] = self;
  uint64_t v10 = objc_retainBlock(v39);
  unint64_t v11 = 0;
  int v4 = 0;
  while (v11 < [(NSArray *)self->_photoLibraries count])
  {
    if ([(VCPFaceLibraryProcessingTask *)self isCancelled]) {
      goto LABEL_10;
    }
    unsigned int v14 = +[VCPWatchdog sharedWatchdog];
    [v14 pet];

    int v15 = [(NSArray *)self->_photoLibraries objectAtIndexedSubscript:v11];
    unsigned __int8 v16 = [(VCPFaceLibraryProcessingTask *)self _readyToProcessProcessLibrary:v15];

    if (v16)
    {
      unsigned int v17 = [(NSArray *)self->_photoLibraries objectAtIndexedSubscript:v11];
      unsigned int v18 = objc_msgSend(v17, "mad_useVUGallery");

      BOOL v19 = [(NSArray *)self->_photoLibraries objectAtIndexedSubscript:v11];
      if (v18) {
        unsigned int v20 = [(VCPFaceLibraryProcessingTask *)self runGalleryProcessingForPhotoLibrary:v19 progressHandler:v10];
      }
      else {
        unsigned int v20 = [(VCPFaceLibraryProcessingTask *)self runLegacyProcessingForPhotoLibrary:v19 progressHandler:v10];
      }
      unsigned int v21 = v20;

      if (v21) {
        int v4 = v21;
      }
      if (v4 == -128)
      {
LABEL_10:
        int v4 = -128;
        int v13 = 2;
        goto LABEL_20;
      }
      int v13 = 0;
    }
    else
    {
      int v13 = 4;
    }
LABEL_20:
    if ((v13 | 4) != 4) {
      break;
    }
    ++v11;
  }
  [v9 stop];
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    BOOL v22 = VCPLogInstance();
    os_log_type_t v23 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v22, v23))
    {
      [v9 elapsedTimeSeconds];
      CFStringRef v25 = @"interrupted";
      *(_DWORD *)buf = 138412802;
      if (!v4) {
        CFStringRef v25 = @"finished";
      }
      CFStringRef v41 = v25;
      __int16 v42 = 2048;
      uint64_t v43 = v24;
      __int16 v44 = 1024;
      int v45 = v4;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Face Processing %@ after %0.6fs (%d)", buf, 0x1Cu);
    }
  }
  os_log_type_t v26 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v9 elapsedTimeSeconds];
  os_log_type_t v28 = +[NSNumber numberWithLongLong:vcvtpd_s64_f64(v27)];
  [v26 setValue:v28 forField:@"TotalAnalyzingTimeInSeconds" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

  os_log_type_t v29 = VCPSignPostLog();
  id v30 = v29;
  if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_END, spid, "VCPFaceLibraryProcessingTask", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  VCPPerformance_ReportSummary();
  if ((self->_subtasks & 2) != 0)
  {
    if (_os_feature_enabled_impl())
    {
      id v31 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
      unsigned int v32 = objc_msgSend(v31, "mad_useVUGallery");

      if (v32)
      {
        os_log_type_t v33 = objc_alloc_init(MADContactsPersonProcessingTask);
        [(MADProcessingTask *)v33 setCancelBlock:self->_cancelBlock];
        [(MADContactsPersonProcessingTask *)v33 process];
      }
    }
    if (_os_feature_enabled_impl())
    {
      os_log_type_t v34 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
      unsigned int v35 = objc_msgSend(v34, "mad_useVUGallery");

      if (v35)
      {
        CFStringRef v36 = objc_alloc_init(MADHomePersonProcessingTask);
        [(MADProcessingTask *)v36 setCancelBlock:self->_cancelBlock];
        [(MADHomePersonProcessingTask *)v36 process];
      }
    }
  }
  (*((void (**)(void))self->_completionHandler + 2))();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingTasks, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_assetBatch, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_photoLibraries, 0);
}

@end