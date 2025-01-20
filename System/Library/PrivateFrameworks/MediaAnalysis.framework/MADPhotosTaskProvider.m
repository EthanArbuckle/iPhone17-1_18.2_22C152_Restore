@interface MADPhotosTaskProvider
+ (id)name;
+ (void)unimplementedExceptionForMethodName:(id)a3;
- (BOOL)_isAssetEligible:(id)a3 withPreviousStatus:(unint64_t *)a4 previousAttempts:(int *)a5 lastAttemptDate:(id *)a6 allowDownload:(BOOL)a7;
- (BOOL)bypassDownload;
- (BOOL)checkCompatibilityForAsset:(id)a3;
- (MADPhotosTaskProvider)initWithPhotoLibrary:(id)a3 cancelBlock:(id)a4;
- (id)assetPriorities;
- (id)assetTaskWithAnalysisDatabase:(id)a3;
- (id)fetchOptionsForLibrary:(id)a3;
- (id)mediaTypePredicatesString;
- (id)nextAssetProcessingTask;
- (id)nextDownloadAssetProcessingTask;
- (id)photoLibrary;
- (int)_cleanupHardFailures;
- (int)downloadStatus;
- (int)status;
- (unint64_t)assetFetchCount;
- (unint64_t)batchAssetCount;
- (unint64_t)currentAssetPriority;
- (unint64_t)iterations;
- (unint64_t)photosMediaProcessingTaskID;
- (unint64_t)priority;
- (void)_collectNumberOfAssets:(unint64_t)a3 forCoreAnalyticsField:(id)a4;
- (void)evaluateAsset:(id)a3 forTask:(id)a4 download:(BOOL)a5;
- (void)markIgnoredAssetsAsProcessed;
- (void)performDownloadAssetEvaluationWithTask:(id)a3;
- (void)performDownloadRetryAssetEvaluationWithTask:(id)a3;
- (void)performFailedAssetEvaluationWithTask:(id)a3 localIdentifierBlock:(id)a4 fetchCount:(unint64_t)a5 assetCount:(unint64_t)a6 download:(BOOL)a7;
- (void)performFullAssetEvaluationWithTask:(id)a3 andContext:(id)a4;
- (void)performHardFailureAssetEvaluationWithTask:(id)a3;
- (void)performSoftFailureAssetEvaluationWithTask:(id)a3;
- (void)retireTask:(id)a3;
- (void)setStatus:(int)a3;
@end

@implementation MADPhotosTaskProvider

- (MADPhotosTaskProvider)initWithPhotoLibrary:(id)a3 cancelBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)MADPhotosTaskProvider;
  v9 = [(MADPhotosTaskProvider *)&v32 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    uint64_t v11 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v7];
    analysisDatabase = v10->_analysisDatabase;
    v10->_analysisDatabase = (VCPDatabaseWriter *)v11;

    v13 = VCPTaskIDDescription([(MADTaskProvider *)v10 taskID]);
    v14 = [(PHPhotoLibrary *)v10->_photoLibrary vcp_description];
    uint64_t v15 = +[NSString stringWithFormat:@"[%@][%@]", v13, v14];
    logPrefix = v10->_logPrefix;
    v10->_logPrefix = (NSString *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("MADPhotosTaskProvider.statusQueue", 0);
    statusQueue = v10->_statusQueue;
    v10->_statusQueue = (OS_dispatch_queue *)v17;

    v10->_status = 0;
    v10->_downloadStatus = 0;
    dispatch_queue_t v19 = dispatch_queue_create("MADPhotosTaskProvider.taskContextQueue", 0);
    taskContextQueue = v10->_taskContextQueue;
    v10->_taskContextQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = +[NSMutableArray array];
    taskContext = v10->_taskContext;
    v10->_taskContext = (NSMutableArray *)v21;

    uint64_t v23 = +[NSMutableArray array];
    ignoredAssets = v10->_ignoredAssets;
    v10->_ignoredAssets = (NSMutableArray *)v23;

    v10->_assetStage = 0;
    id v25 = objc_retainBlock(v8);
    id cancelBlock = v10->_cancelBlock;
    v10->_id cancelBlock = v25;

    uint64_t v27 = +[NSMutableSet set];
    activeAssets = v10->_activeAssets;
    v10->_activeAssets = (NSMutableSet *)v27;

    dispatch_queue_t v29 = dispatch_queue_create("MADPhotosTaskProvider.activeAssetsManagementQueue", 0);
    activeAssetsManagementQueue = v10->_activeAssetsManagementQueue;
    v10->_activeAssetsManagementQueue = (OS_dispatch_queue *)v29;

    [(MADPhotosTaskProvider *)v10 _cleanupHardFailures];
  }

  return v10;
}

- (unint64_t)priority
{
  unint64_t v3 = [(MADTaskProvider *)self taskID];
  uint64_t v4 = 10;
  uint64_t v5 = 20;
  if (v3 != 10) {
    uint64_t v5 = 0;
  }
  if (v3 != 12) {
    uint64_t v4 = v5;
  }
  if (v3 == 3) {
    uint64_t v6 = 30;
  }
  else {
    uint64_t v6 = v4;
  }
  if ([(PHPhotoLibrary *)self->_photoLibrary isSystemPhotoLibrary]) {
    return v6 + 2;
  }
  else {
    return v6 | [(PHPhotoLibrary *)self->_photoLibrary vcp_isSyndicationLibrary];
  }
}

- (unint64_t)iterations
{
  if ((id)[(MADTaskProvider *)self taskID] != (id)3) {
    return 1;
  }
  if ([(PHPhotoLibrary *)self->_photoLibrary isSystemPhotoLibrary]) {
    return 4;
  }
  return 1;
}

- (int)status
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  statusQueue = self->_statusQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F390;
  v5[3] = &unk_100219C88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(statusQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)downloadStatus
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  statusQueue = self->_statusQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F460;
  v5[3] = &unk_100219C88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(statusQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setStatus:(int)a3
{
  statusQueue = self->_statusQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000F4FC;
  v4[3] = &unk_100219CB0;
  int v5 = a3;
  v4[4] = self;
  dispatch_sync(statusQueue, v4);
}

- (void)_collectNumberOfAssets:(unint64_t)a3 forCoreAnalyticsField:(id)a4
{
  id v7 = a4;
  uint64_t v6 = +[VCPMADCoreAnalyticsManager sharedManager];
  if ((id)[(MADTaskProvider *)self taskID] == (id)10) {
    [v6 accumulateInt64Value:a3 forField:v7 andEvent:@"com.apple.mediaanalysisd.OCRAnalysisRunSession"];
  }
}

- (id)fetchOptionsForLibrary:(id)a3
{
  id v4 = a3;
  int v5 = +[PHAsset vcp_fetchOptionsForLibrary:v4 forTaskID:[(MADTaskProvider *)self taskID]];

  return v5;
}

- (int)_cleanupHardFailures
{
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v4 = VCPLogInstance();
    os_log_type_t v5 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v4, v5))
    {
      logPrefix = self->_logPrefix;
      *(_DWORD *)buf = 138412290;
      v45 = logPrefix;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "%@ Checking processing status from previous runs", buf, 0xCu);
    }
  }
  analysisDatabase = self->_analysisDatabase;
  id v43 = 0;
  unint64_t v8 = [(MADPhotosTaskProvider *)self processingStatusTaskID];
  int v9 = [(MADPhotosTaskProvider *)self mediaTypePredicatesString];
  [(VCPDatabaseWriter *)analysisDatabase fetchLocalIdentifiers:&v43 taskID:v8 processingStatus:1 additionalPredicates:v9];
  id v10 = v43;

  uint64_t v11 = (char *)[v10 count];
  if (v11)
  {
    v42 = v11;
    v12 = [(MADPhotosTaskProvider *)self fetchOptionsForLibrary:self->_photoLibrary];
    v13 = +[PHAsset fetchAssetsWithLocalIdentifiers:v10 options:v12];
    if ([v13 count])
    {
      unint64_t v15 = 0;
      os_log_type_t type = VCPLogToOSLogType[6];
      *(void *)&long long v14 = 138412546;
      long long v39 = v14;
      do
      {
        dispatch_queue_t v17 = [v13 objectAtIndexedSubscript:v15];
        if (objc_msgSend(v17, "vcp_needsProcessingForTask:", -[MADTaskProvider taskID](self, "taskID")))
        {
          LODWORD(v2) = analysisDatabase;
        }
        else
        {
          v18 = self->_analysisDatabase;
          dispatch_queue_t v19 = [v17 localIdentifier];
          id v20 = (id)[(VCPDatabaseWriter *)v18 removeProcessingStatusForLocalIdentifier:v19 andTaskID:[(MADPhotosTaskProvider *)self processingStatusTaskID]];

          if (v20 == -108 || v20 == -36)
          {
            v2 = (VCPDatabaseWriter *)v20;
          }
          else
          {
            v2 = (VCPDatabaseWriter *)v20;
            if (v20 != -23) {
              v2 = analysisDatabase;
            }
          }
          if (v20 == -108 || v20 == -36 || v20 == -23)
          {

            goto LABEL_38;
          }
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            uint64_t v21 = VCPLogInstance();
            if (os_log_type_enabled(v21, type))
            {
              unsigned int v40 = v2;
              v22 = v13;
              uint64_t v23 = v12;
              id v24 = v10;
              id v25 = self->_logPrefix;
              v26 = [v17 localIdentifier];
              *(_DWORD *)buf = v39;
              v45 = v25;
              id v10 = v24;
              v12 = v23;
              v13 = v22;
              v2 = (VCPDatabaseWriter *)v40;
              __int16 v46 = 2112;
              v47 = v26;
              _os_log_impl((void *)&_mh_execute_header, v21, type, "%@[%@] Asset is processed; clearing failure status",
                buf,
                0x16u);
            }
          }
          --v42;
          analysisDatabase = v2;
        }

        ++v15;
      }
      while (v15 < (unint64_t)[v13 count]);
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v27 = VCPLogInstance();
      os_log_type_t v28 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v27, v28))
      {
        dispatch_queue_t v29 = self->_logPrefix;
        *(_DWORD *)buf = 138412546;
        v45 = v29;
        __int16 v46 = 2048;
        v47 = v42;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "%@ %lu assets processing status changed to Hard Failure", buf, 0x16u);
      }
    }
    v30 = self->_analysisDatabase;
    unint64_t v31 = [(MADPhotosTaskProvider *)self processingStatusTaskID];
    objc_super v32 = [(MADPhotosTaskProvider *)self mediaTypePredicatesString];
    unsigned int v33 = [(VCPDatabaseWriter *)v30 hardFailAllRunningProcessingStatusForTaskID:v31 additionalPredicates:v32];

    if (v33 == -108 || v33 == -36)
    {
      unsigned int v34 = v33;
    }
    else
    {
      unsigned int v34 = v33;
      if (v33 != -23) {
        unsigned int v34 = v2;
      }
    }
    if (v33 == -108 || v33 == -36 || v33 == -23)
    {
      LODWORD(v2) = v34;
LABEL_38:

      goto LABEL_52;
    }
    unsigned int v35 = [(VCPDatabaseWriter *)self->_analysisDatabase commit];
    if (v35 == -108 || v35 == -36)
    {
      LODWORD(v2) = v35;
    }
    else
    {
      LODWORD(v2) = v35;
      if (v35 != -23) {
        LODWORD(v2) = v34;
      }
    }
    if (v35 == -108 || v35 == -23 || v35 == -36) {
      goto LABEL_38;
    }
    [(MADPhotosTaskProvider *)self _collectNumberOfAssets:v42 forCoreAnalyticsField:@"NumberOfAssetsHardFailure"];
    [(MADPhotosTaskProvider *)self _collectNumberOfAssets:v42 forCoreAnalyticsField:@"NumberOfAssetsIntoBlacklist"];
  }
  if ((int)MediaAnalysisLogLevel() < 7)
  {
    LODWORD(v2) = 0;
    goto LABEL_53;
  }
  v12 = VCPLogInstance();
  os_log_type_t v36 = VCPLogToOSLogType[7];
  if (os_log_type_enabled(v12, v36))
  {
    v37 = self->_logPrefix;
    *(_DWORD *)buf = 138412290;
    v45 = v37;
    _os_log_impl((void *)&_mh_execute_header, v12, v36, "%@ Processing status is up-to-date", buf, 0xCu);
  }
  LODWORD(v2) = 0;
LABEL_52:

LABEL_53:
  return (int)v2;
}

- (BOOL)_isAssetEligible:(id)a3 withPreviousStatus:(unint64_t *)a4 previousAttempts:(int *)a5 lastAttemptDate:(id *)a6 allowDownload:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  analysisDatabase = self->_analysisDatabase;
  id v31 = 0;
  long long v14 = [v12 localIdentifier];
  unsigned int v15 = [(VCPDatabaseWriter *)analysisDatabase queryProcessingStatus:a4 attempts:a5 lastAttemptDate:a6 andNextAttemptDate:&v31 forLocalIdentifier:v14 andTaskID:[(MADPhotosTaskProvider *)self processingStatusTaskID]];
  id v16 = v31;

  if (v15)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      dispatch_queue_t v17 = VCPLogInstance();
      os_log_type_t v18 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled(v17, v18))
      {
LABEL_6:

        goto LABEL_7;
      }
      logPrefix = self->_logPrefix;
      id v20 = [v12 localIdentifier];
      *(_DWORD *)buf = 138412802;
      unsigned int v33 = logPrefix;
      __int16 v34 = 2112;
      unsigned int v35 = v20;
      __int16 v36 = 1024;
      LODWORD(v37) = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "%@[%@] Failed to query processing status due to DB error %d", buf, 0x1Cu);
LABEL_5:

      goto LABEL_6;
    }
  }
  else
  {
    if (!*a5
      || (+[NSDate date],
          v22 = objc_claimAutoreleasedReturnValue(),
          id v23 = [v16 compare:v22],
          v22,
          v23 != (id)1)
      || v7 && *a5 == 1 && *a4 == 2)
    {
      BOOL v21 = 1;
      goto LABEL_14;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      dispatch_queue_t v17 = VCPLogInstance();
      os_log_type_t v25 = VCPLogToOSLogType[6];
      if (!os_log_type_enabled(v17, v25)) {
        goto LABEL_6;
      }
      v26 = self->_logPrefix;
      uint64_t v27 = [v12 localIdentifier];
      id v20 = VCPProcessingStatusDescription(*a4);
      int v28 = *a5;
      dispatch_queue_t v29 = +[VCPLogManager dateFormatter];
      v30 = [v29 stringFromDate:v16];
      *(_DWORD *)buf = 138413314;
      unsigned int v33 = v26;
      __int16 v34 = 2112;
      unsigned int v35 = v27;
      __int16 v36 = 2112;
      v37 = v20;
      __int16 v38 = 1024;
      int v39 = v28;
      __int16 v40 = 2112;
      v41 = v30;
      _os_log_impl((void *)&_mh_execute_header, v17, v25, "%@[%@] Asset skipped (%@|%d); revisit date: %@", buf, 0x30u);

      goto LABEL_5;
    }
  }
LABEL_7:
  BOOL v21 = 0;
LABEL_14:

  return v21;
}

- (void)evaluateAsset:(id)a3 forTask:(id)a4 download:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  logPrefix = self->_logPrefix;
  uint64_t v11 = [v8 localIdentifier];
  id v12 = +[NSString stringWithFormat:@"%@[%@][TaskID-%d]", logPrefix, v11, [(MADPhotosTaskProvider *)self processingStatusTaskID]];

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v13, v14))
    {
      CFStringRef v15 = @"dis";
      if (v5) {
        CFStringRef v15 = &stru_10021F768;
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%@ Evaluating asset ... (download %@allowed)", buf, 0x16u);
    }
  }
  id v16 = +[VCPWatchdog sharedWatchdog];
  [v16 pet];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v58 = 0;
  activeAssetsManagementQueue = self->_activeAssetsManagementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010938;
  block[3] = &unk_100219CD8;
  v54 = buf;
  block[4] = self;
  id v18 = v8;
  id v53 = v18;
  dispatch_sync(activeAssetsManagementQueue, block);
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      dispatch_queue_t v19 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[4];
      if (!os_log_type_enabled(v19, v20))
      {
LABEL_49:

        goto LABEL_50;
      }
      *(_DWORD *)v55 = 138412290;
      v56 = v12;
      BOOL v21 = "%@ Asset already added to a processing batch; skipping";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v19, v20, v21, v55, 0xCu);
      goto LABEL_49;
    }
    goto LABEL_50;
  }
  if ((id)[(MADTaskProvider *)self taskID] == (id)3)
  {
    v22 = [v18 photoLibrary];
    if (objc_msgSend(v22, "mad_pauseFCPeopleFurtherProcessing"))
    {
      unsigned int v23 = [v18 faceAnalysisVersion];
      if (_os_feature_enabled_impl()) {
        int v24 = 14;
      }
      else {
        int v24 = 11;
      }
      BOOL v25 = v24 == v23;

      if (v25)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          dispatch_queue_t v19 = VCPLogInstance();
          os_log_type_t v20 = VCPLogToOSLogType[5];
          if (!os_log_type_enabled(v19, v20)) {
            goto LABEL_49;
          }
          *(_DWORD *)v55 = 138412290;
          v56 = v12;
          BOOL v21 = "%@ already with FC version; skipping";
          goto LABEL_11;
        }
LABEL_50:
        [(MADPhotosTaskProvider *)self increaseProcessedJobCountByOne];
        goto LABEL_51;
      }
    }
    else
    {
    }
  }
  if ((id)[(MADTaskProvider *)self taskID] != (id)1)
  {
    if ((objc_msgSend(v18, "vcp_needsProcessingForTask:", -[MADTaskProvider taskID](self, "taskID")) & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        __int16 v38 = VCPLogInstance();
        os_log_type_t v39 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v38, v39))
        {
          *(_DWORD *)v55 = 138412290;
          v56 = v12;
          _os_log_impl((void *)&_mh_execute_header, v38, v39, "%@ Asset is up-to-date; skipping", v55, 0xCu);
        }
      }
      analysisDatabase = self->_analysisDatabase;
      dispatch_queue_t v19 = [v18 localIdentifier];
      [(VCPDatabaseWriter *)analysisDatabase removeProcessingStatusForLocalIdentifier:v19 andTaskID:[(MADPhotosTaskProvider *)self processingStatusTaskID]];
      goto LABEL_49;
    }
LABEL_32:
    uint64_t v51 = 0;
    int v50 = 0;
    id v49 = 0;
    unsigned __int8 v31 = [(MADPhotosTaskProvider *)self _isAssetEligible:v18 withPreviousStatus:&v51 previousAttempts:&v50 lastAttemptDate:&v49 allowDownload:v5];
    id v32 = v49;
    if (v31)
    {
      if ([(PHPhotoLibrary *)self->_photoLibrary vcp_requiresDownloadForTask:[(MADTaskProvider *)self taskID]]&& !v5&& (v51 == 7 || v51 == 2))
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          unsigned int v33 = VCPLogInstance();
          os_log_type_t v34 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v33, v34))
          {
            *(_DWORD *)v55 = 138412290;
            v56 = v12;
            unsigned int v35 = "%@ Asset requires resource download; skipping";
LABEL_60:
            _os_log_impl((void *)&_mh_execute_header, v33, v34, v35, v55, 0xCu);
            goto LABEL_61;
          }
          goto LABEL_61;
        }
      }
      else
      {
        if (self->_assetStage == 1 || v51 != 4)
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v41 = VCPLogInstance();
            os_log_type_t v42 = VCPLogToOSLogType[7];
            if (os_log_type_enabled(v41, v42))
            {
              *(_DWORD *)v55 = 138412290;
              v56 = v12;
              _os_log_impl((void *)&_mh_execute_header, v41, v42, "%@ Adding to process batch ...", v55, 0xCu);
            }
          }
          [v9 addPhotosAsset:v18 priority:self->_currentAssetPriority previousStatus:v51 attempts:v50 lastAttemptDate:v32];
          id v43 = [v9 assetLocalIdentifiers];
          v44 = [v18 localIdentifier];
          unsigned int v45 = [v43 containsObject:v44];

          if (v45)
          {
            __int16 v46 = self->_activeAssetsManagementQueue;
            v47[0] = _NSConcreteStackBlock;
            v47[1] = 3221225472;
            v47[2] = sub_1000109A8;
            v47[3] = &unk_100219D00;
            v47[4] = self;
            id v48 = v18;
            dispatch_sync(v46, v47);
          }
          goto LABEL_63;
        }
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          unsigned int v33 = VCPLogInstance();
          os_log_type_t v34 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v33, v34))
          {
            *(_DWORD *)v55 = 138412290;
            v56 = v12;
            unsigned int v35 = "%@ Asset has a previous hard failure; skipping";
            goto LABEL_60;
          }
          goto LABEL_61;
        }
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 7)
    {
      unsigned int v33 = VCPLogInstance();
      os_log_type_t v34 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v33, v34))
      {
        *(_DWORD *)v55 = 138412290;
        v56 = v12;
        unsigned int v35 = "%@ Asset not eligible for processing; skipping";
        goto LABEL_60;
      }
LABEL_61:
    }
    [(MADPhotosTaskProvider *)self increaseProcessedJobCountByOne];
LABEL_63:

    goto LABEL_51;
  }
  if ([(MADPhotosTaskProvider *)self checkCompatibilityForAsset:v18])
  {
    if ((objc_msgSend(v18, "mad_isFullAnalysisVersionOutdated:", (id)-[MADPhotosTaskProvider processingStatusTaskID](self, "processingStatusTaskID") == (id)255) & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v26 = VCPLogInstance();
        os_log_type_t v27 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v26, v27))
        {
          *(_DWORD *)v55 = 138412290;
          v56 = v12;
          _os_log_impl((void *)&_mh_execute_header, v26, v27, "%@ Asset is up-to-date; skipping", v55, 0xCu);
        }
      }
      int v28 = self->_analysisDatabase;
      dispatch_queue_t v29 = [v18 localIdentifier];
      [(VCPDatabaseWriter *)v28 removeProcessingStatusForLocalIdentifier:v29 andTaskID:[(MADPhotosTaskProvider *)self processingStatusTaskID]];

      if ((id)[(MADPhotosTaskProvider *)self processingStatusTaskID] != (id)1) {
        goto LABEL_50;
      }
      v30 = self->_analysisDatabase;
      dispatch_queue_t v19 = [v18 localIdentifier];
      [(VCPDatabaseWriter *)v30 removeProcessingStatusForLocalIdentifier:v19 andTaskID:255];
      goto LABEL_49;
    }
    goto LABEL_32;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    __int16 v36 = VCPLogInstance();
    os_log_type_t v37 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v36, v37))
    {
      *(_DWORD *)v55 = 138412290;
      v56 = v12;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "%@ Asset incompatible with the associated task; skipping",
        v55,
        0xCu);
    }
  }
LABEL_51:

  _Block_object_dispose(buf, 8);
}

- (void)markIgnoredAssetsAsProcessed
{
  if ([(NSMutableArray *)self->_ignoredAssets count])
  {
    id v3 = [(NSMutableArray *)self->_ignoredAssets count];
    if (v3 >= +[PHPhotoLibrary mad_maxIgnoredAssetsToMarkAsProcessed]|| self->_assetStage == 1)
    {
      id v4 = +[VCPWatchdog sharedWatchdog];
      [v4 pet];

      [(PHPhotoLibrary *)self->_photoLibrary mad_markAsProcessedByTask:[(MADPhotosTaskProvider *)self processingStatusTaskID] forAssets:self->_ignoredAssets];
      ignoredAssets = self->_ignoredAssets;
      [(NSMutableArray *)ignoredAssets removeAllObjects];
    }
  }
}

- (void)performFullAssetEvaluationWithTask:(id)a3 andContext:(id)a4
{
  id v6 = a3;
  id v72 = a4;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    BOOL v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      logPrefix = self->_logPrefix;
      *(_DWORD *)buf = 138412290;
      v86 = logPrefix;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "%@ Perform full asset evaluation ... ", buf, 0xCu);
    }
  }
  v81 = [(MADPhotosTaskProvider *)self assetPriorities];
  id v10 = [v81 count];
  if (v10)
  {
    unint64_t v76 = (unint64_t)v10;
    os_log_type_t type = VCPLogToOSLogType[5];
    os_log_type_t v75 = VCPLogToOSLogType[6];
    id v74 = v6;
    os_log_type_t v73 = VCPLogToOSLogType[3];
    while (1)
    {
      unint64_t fetchIdx = self->_fetchIdx;
      if (fetchIdx < [(PHFetchResult *)self->_fetchResult count])
      {
        do
        {
          fetchResult = self->_fetchResult;
          ++self->_fetchIdx;
          os_log_type_t v14 = -[PHFetchResult objectAtIndexedSubscript:](fetchResult, "objectAtIndexedSubscript:");
          if (+[PHPhotoLibrary mad_isProcessingNeededOnAsset:v14 forTaskID:[(MADPhotosTaskProvider *)self processingStatusTaskID]])
          {
            [(MADPhotosTaskProvider *)self evaluateAsset:v14 forTask:v6 download:0];
            if (objc_msgSend(v6, "hasAdequateAssets:", -[MADPhotosTaskProvider batchAssetCount](self, "batchAssetCount")))
            {
              unint64_t v68 = self->_fetchIdx;
              if (v68 >= [(PHFetchResult *)self->_fetchResult count] && self->_assetPrioritiesIdx >= v76) {
                self->_assetStage = 1;
              }
              [(VCPDatabaseWriter *)self->_analysisDatabase commit];

              goto LABEL_61;
            }
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 5)
            {
              CFStringRef v15 = VCPLogInstance();
              if (os_log_type_enabled(v15, type))
              {
                id v16 = self->_logPrefix;
                dispatch_queue_t v17 = [v14 localIdentifier];
                unint64_t v18 = [(MADPhotosTaskProvider *)self processingStatusTaskID];
                *(_DWORD *)buf = 138412802;
                v86 = v16;
                __int16 v87 = 2112;
                CFStringRef v88 = v17;
                __int16 v89 = 2048;
                unint64_t v90 = v18;
                _os_log_impl((void *)&_mh_execute_header, v15, type, "[%@][%@] Asset does not need processing in task %lu, ignoring... ", buf, 0x20u);
              }
            }
            [(NSMutableArray *)self->_ignoredAssets addObject:v14];
            analysisDatabase = self->_analysisDatabase;
            os_log_type_t v20 = [v14 localIdentifier];
            [(VCPDatabaseWriter *)analysisDatabase removeProcessingStatusForLocalIdentifier:v20 andTaskID:[(MADPhotosTaskProvider *)self processingStatusTaskID]];

            if ((id)[(MADPhotosTaskProvider *)self processingStatusTaskID] == (id)1)
            {
              BOOL v21 = self->_analysisDatabase;
              v22 = [v14 localIdentifier];
              [(VCPDatabaseWriter *)v21 removeProcessingStatusForLocalIdentifier:v22 andTaskID:255];
            }
            [(MADPhotosTaskProvider *)self markIgnoredAssetsAsProcessed];
          }

          unint64_t v23 = self->_fetchIdx;
        }
        while (v23 < [(PHFetchResult *)self->_fetchResult count]);
      }
      [(VCPDatabaseWriter *)self->_analysisDatabase commit];
      int v24 = self->_fetchResult;
      self->_fetchResult = 0;

      self->_unint64_t fetchIdx = 0;
      if (self->_assetPrioritiesIdx >= v76)
      {
        self->_assetStage = 1;
        goto LABEL_61;
      }
      BOOL v25 = +[VCPWatchdog sharedWatchdog];
      [v25 pet];

      CFStringRef v26 = @"All";
      if (v76 != 1)
      {
        os_log_type_t v27 = [v81 objectAtIndexedSubscript:self->_assetPrioritiesIdx];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Priority %lu", [v27 unsignedIntegerValue]);
        CFStringRef v26 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      }
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        int v28 = VCPLogInstance();
        if (os_log_type_enabled(v28, v75))
        {
          dispatch_queue_t v29 = self->_logPrefix;
          *(_DWORD *)buf = 138412546;
          v86 = v29;
          __int16 v87 = 2112;
          CFStringRef v88 = v26;
          _os_log_impl((void *)&_mh_execute_header, v28, v75, "%@ Fetching %@ assets...", buf, 0x16u);
        }
      }
      v30 = +[MADStateHandler sharedStateHandler];
      [v30 addBreadcrumb:@"%@ Fetching %@ assets...", self->_logPrefix, v26];

      ++self->_assetPrioritiesIdx;
      unsigned __int8 v31 = objc_msgSend(v81, "objectAtIndexedSubscript:");
      self->_unint64_t currentAssetPriority = (unint64_t)[v31 unsignedIntegerValue];

      uint64_t v78 = +[PHMediaProcessingAlgorithmVersionProvider mad_sharedVersionProviderWithPhotoLibrary:self->_photoLibrary];
      +[PHAsset mad_sceneConfidenceThresholdForTask:[(MADTaskProvider *)self taskID]];
      int v33 = v32;
      v79 = (__CFString *)v26;
      if ((id)[(MADTaskProvider *)self taskID] == (id)10)
      {
        os_log_type_t v34 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)[(VCPDatabaseWriter *)self->_analysisDatabase valueForKey:@"OCRAnalysisLastGatingIncludedFetchTimestamp"]];
        unsigned int v35 = +[NSDate now];
        [v35 timeIntervalSinceDate:v34];
        BOOL v37 = v36 < 604800.0;
      }
      else
      {
        BOOL v37 = 0;
      }
      __int16 v38 = VCPSignPostLog();
      os_signpost_id_t v39 = os_signpost_id_generate(v38);

      __int16 v40 = VCPSignPostLog();
      v41 = v40;
      os_signpost_id_t spid = v39;
      unint64_t v42 = v39 - 1;
      if (v42 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MADPhotosTaskProvider_FetchAssets", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if (v37)
      {
        photoLibrary = self->_photoLibrary;
        unint64_t v44 = [(MADPhotosTaskProvider *)self photosMediaProcessingTaskID];
        unint64_t currentAssetPriority = self->_currentAssetPriority;
        uint64_t v84 = 0;
        __int16 v46 = (id *)&v84;
        v47 = (void *)v78;
        LODWORD(v48) = v33;
        uint64_t v49 = [(PHPhotoLibrary *)photoLibrary fetchUnprocessedAssetsForMediaProcessingTaskID:v44 priority:currentAssetPriority algorithmVersion:v78 sceneConfidenceThreshold:&v84 error:v48];
      }
      else
      {
        if ((id)[(MADTaskProvider *)self taskID] == (id)10)
        {
          int v50 = self->_analysisDatabase;
          uint64_t v51 = +[NSDate now];
          [v51 timeIntervalSinceReferenceDate];
          [(VCPDatabaseWriter *)v50 setValue:(uint64_t)v52 forKey:@"OCRAnalysisLastGatingIncludedFetchTimestamp"];

          [(VCPDatabaseWriter *)self->_analysisDatabase commit];
        }
        id v53 = self->_photoLibrary;
        unint64_t v54 = [(MADPhotosTaskProvider *)self photosMediaProcessingTaskID];
        unint64_t v55 = self->_currentAssetPriority;
        uint64_t v83 = 0;
        __int16 v46 = (id *)&v83;
        v47 = (void *)v78;
        LODWORD(v56) = v33;
        uint64_t v49 = [(PHPhotoLibrary *)v53 fetchAssetsForMediaProcessingTaskID:v54 priority:v55 algorithmVersion:v78 sceneConfidenceThreshold:&v83 error:v56];
      }
      v57 = (PHFetchResult *)v49;
      char v58 = (__CFString *)*v46;
      v59 = self->_fetchResult;
      self->_fetchResult = v57;

      v60 = VCPSignPostLog();
      v61 = v60;
      id v6 = v74;
      if (v42 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v61, OS_SIGNPOST_INTERVAL_END, spid, "MADPhotosTaskProvider_FetchAssets", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      int v62 = MediaAnalysisLogLevel();
      if (!v58) {
        break;
      }
      if (v62 >= 3)
      {
        v63 = VCPLogInstance();
        if (os_log_type_enabled(v63, v73))
        {
          v64 = self->_logPrefix;
          *(_DWORD *)buf = 138412546;
          v86 = v64;
          __int16 v87 = 2112;
          CFStringRef v88 = v58;
          _os_log_impl((void *)&_mh_execute_header, v63, v73, "%@ Failed to fetch assets: %@", buf, 0x16u);
        }
LABEL_49:
      }
      if (v58) {
        goto LABEL_61;
      }
    }
    if (v62 >= 6)
    {
      v65 = VCPLogInstance();
      if (os_log_type_enabled(v65, v75))
      {
        v66 = self->_logPrefix;
        unsigned int v67 = [(PHFetchResult *)self->_fetchResult count];
        *(_DWORD *)buf = 138412546;
        v86 = v66;
        __int16 v87 = 1024;
        LODWORD(v88) = v67;
        _os_log_impl((void *)&_mh_execute_header, v65, v75, "%@ Fetched %d assets", buf, 0x12u);
      }
    }
    v63 = +[MADStateHandler sharedStateHandler];
    [v63 addBreadcrumb:@"%@ Fetched %d assets", self->_logPrefix, [(PHFetchResult *)self->_fetchResult count]];
    goto LABEL_49;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v69 = VCPLogInstance();
    os_log_type_t v70 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v69, v70))
    {
      v71 = self->_logPrefix;
      *(_DWORD *)buf = 138412290;
      v86 = v71;
      _os_log_impl((void *)&_mh_execute_header, v69, v70, "%@ Failed to perform full asset evaluation", buf, 0xCu);
    }
  }
LABEL_61:
}

- (void)performFailedAssetEvaluationWithTask:(id)a3 localIdentifierBlock:(id)a4 fetchCount:(unint64_t)a5 assetCount:(unint64_t)a6 download:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  uint64_t v51 = (void (**)(id, unint64_t))a4;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v12, v13))
    {
      logPrefix = self->_logPrefix;
      CFStringRef v15 = @"NO";
      if (v7) {
        CFStringRef v15 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      v63 = logPrefix;
      __int16 v64 = 2112;
      *(void *)v65 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "%@ Perform failed asset evaluation ... (download allowed: %@)", buf, 0x16u);
    }
  }
  self->_unint64_t currentAssetPriority = 0;
  double v56 = +[NSMutableSet set];
  os_log_type_t type = VCPLogToOSLogType[4];
  id v50 = v11;
  BOOL v53 = v7;
  unint64_t v52 = a6;
  while (1)
  {
    id v16 = v51[2](v51, a5);
    if (![v16 count]) {
      break;
    }
    if ([v56 count])
    {
      dispatch_queue_t v17 = +[NSMutableSet setWithArray:v16];
      [v17 minusSet:v56];
      uint64_t v18 = [v17 allObjects];

      id v16 = (void *)v18;
    }
    dispatch_queue_t v19 = +[VCPWatchdog sharedWatchdog];
    [v19 pet];

    os_log_type_t v20 = [(MADPhotosTaskProvider *)self fetchOptionsForLibrary:self->_photoLibrary];
    BOOL v21 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:0];
    unsigned int v67 = v21;
    v22 = +[NSArray arrayWithObjects:&v67 count:1];
    [v20 setSortDescriptors:v22];

    unint64_t v23 = +[MADStateHandler sharedStateHandler];
    [v23 addBreadcrumb:@"%@ Fetching %lu assets for retry with fetchOptions: %@", self->_logPrefix, objc_msgSend(v16, "count"), v20];

    unint64_t v55 = v20;
    +[PHAsset fetchAssetsWithLocalIdentifiers:v16 options:v20];
    BOOL v25 = v24 = v16;
    CFStringRef v26 = +[MADStateHandler sharedStateHandler];
    [v26 addBreadcrumb:@"%@ Fetched %lu assets for retry", self->_logPrefix, objc_msgSend(v24, "count")];

    v57 = v24;
    id v27 = [v24 count];
    BOOL v28 = v53;
    unint64_t v29 = v52;
    if (v27 != [v25 count])
    {
      v30 = +[NSMutableSet setWithArray:v24];
      if ([v25 count])
      {
        unint64_t v31 = 0;
        do
        {
          int v33 = [v25 objectAtIndexedSubscript:v31];
          os_log_type_t v34 = [v33 localIdentifier];
          [v30 removeObject:v34];

          ++v31;
        }
        while (v31 < (unint64_t)[v25 count]);
      }
      if ([v30 count])
      {
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v35 = v30;
        id v36 = [v35 countByEnumeratingWithState:&v58 objects:v66 count:16];
        if (v36)
        {
          id v37 = v36;
          uint64_t v38 = *(void *)v59;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(void *)v59 != v38) {
                objc_enumerationMutation(v35);
              }
              [(VCPDatabaseWriter *)self->_analysisDatabase removeProcessingStatusForLocalIdentifier:*(void *)(*((void *)&v58 + 1) + 8 * i) andTaskID:[(MADPhotosTaskProvider *)self processingStatusTaskID]];
            }
            id v37 = [v35 countByEnumeratingWithState:&v58 objects:v66 count:16];
          }
          while (v37);
        }

        [(VCPDatabaseWriter *)self->_analysisDatabase commit];
        id v11 = v50;
        BOOL v28 = v53;
        unint64_t v29 = v52;
      }
      else
      {
        BOOL v28 = v53;
        unint64_t v29 = v52;
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          __int16 v40 = VCPLogInstance();
          if (os_log_type_enabled(v40, type))
          {
            v41 = self->_logPrefix;
            unsigned int v42 = [v57 count];
            unsigned int v43 = [v25 count];
            *(_DWORD *)buf = 138412802;
            v63 = v41;
            __int16 v64 = 1024;
            *(_DWORD *)v65 = v42;
            *(_WORD *)&v65[4] = 1024;
            *(_DWORD *)&v65[6] = v43;
            _os_log_impl((void *)&_mh_execute_header, v40, type, "%@ Fetch count mismatch (%d vs %d); but no missing identifiers...",
              buf,
              0x18u);
          }
        }
      }
    }
    if ([v25 count])
    {
      uint64_t v44 = 0;
      while (1)
      {
        unsigned int v45 = [v25 objectAtIndexedSubscript:v44];
        [(MADPhotosTaskProvider *)self evaluateAsset:v45 forTask:v11 download:v28];
        __int16 v46 = [v45 localIdentifier];
        [v56 addObject:v46];

        if ([v11 hasAdequateAssets:v29]) {
          break;
        }

        if (++v44 >= (unint64_t)[v25 count]) {
          goto LABEL_33;
        }
      }
      [(VCPDatabaseWriter *)self->_analysisDatabase commit];

      int v48 = 1;
      v47 = v57;
    }
    else
    {
LABEL_33:
      [(VCPDatabaseWriter *)self->_analysisDatabase commit];
      v47 = v57;
      if ((unint64_t)[v57 count] >= a5) {
        int v48 = 0;
      }
      else {
        int v48 = 5;
      }
    }

    if (v48) {
      goto LABEL_40;
    }
  }

LABEL_40:
}

- (void)performSoftFailureAssetEvaluationWithTask:(id)a3
{
  id v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    BOOL v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      logPrefix = self->_logPrefix;
      *(_DWORD *)buf = 138412290;
      id v11 = logPrefix;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "%@ Perform soft failure asset evaluation ... ", buf, 0xCu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100011BA8;
  v9[3] = &unk_100219D28;
  v9[4] = self;
  os_log_type_t v8 = objc_retainBlock(v9);
  [(MADPhotosTaskProvider *)self performFailedAssetEvaluationWithTask:v4 localIdentifierBlock:v8 fetchCount:[(MADPhotosTaskProvider *)self assetFetchCount] assetCount:[(MADPhotosTaskProvider *)self batchAssetCount] download:0];
}

- (void)performHardFailureAssetEvaluationWithTask:(id)a3
{
  id v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    BOOL v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      logPrefix = self->_logPrefix;
      *(_DWORD *)buf = 138412290;
      id v11 = logPrefix;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "%@ Perform hard failure asset evaluation ... ", buf, 0xCu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100011DF4;
  v9[3] = &unk_100219D28;
  v9[4] = self;
  os_log_type_t v8 = objc_retainBlock(v9);
  [(MADPhotosTaskProvider *)self performFailedAssetEvaluationWithTask:v4 localIdentifierBlock:v8 fetchCount:10 assetCount:1 download:0];
}

- (id)nextAssetProcessingTask
{
  if ([(MADPhotosTaskProvider *)self status])
  {
    id v3 = 0;
  }
  else
  {
    id v4 = [(MADPhotosTaskProvider *)self assetTaskWithAnalysisDatabase:self->_analysisDatabase];
    BOOL v5 = [MADPhotosTaskContext alloc];
    os_log_type_t v6 = [v4 uuid];
    BOOL v7 = [(MADPhotosTaskContext *)v5 initWithTaskUUID:v6];

    if (!self->_assetStage) {
      [(MADPhotosTaskProvider *)self performFullAssetEvaluationWithTask:v4 andContext:v7];
    }
    os_log_type_t v8 = [v4 count];
    if (self->_assetStage == 1)
    {
      [(MADPhotosTaskProvider *)self markIgnoredAssetsAsProcessed];
      [(MADPhotosTaskProvider *)self performSoftFailureAssetEvaluationWithTask:v4];
      if (![v4 count]) {
        [(MADPhotosTaskProvider *)self performHardFailureAssetEvaluationWithTask:v4];
      }
    }
    -[MADPhotosTaskProvider _collectNumberOfAssets:forCoreAnalyticsField:](self, "_collectNumberOfAssets:forCoreAnalyticsField:", (unsigned char *)[v4 count] - v8, @"NumberOfAssetsOutFromBlacklist");
    if ([v4 count])
    {
      taskContextQueue = self->_taskContextQueue;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100012058;
      v11[3] = &unk_100219D00;
      v11[4] = self;
      id v12 = v7;
      dispatch_sync(taskContextQueue, v11);
      id v3 = v4;
    }
    else
    {
      id v3 = 0;
    }
  }
  return v3;
}

- (unint64_t)assetFetchCount
{
  return 2 * [(MADPhotosTaskProvider *)self batchAssetCount];
}

- (void)performDownloadAssetEvaluationWithTask:(id)a3
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001221C;
  v10[3] = &unk_100219D28;
  v10[4] = self;
  id v4 = a3;
  BOOL v5 = objc_retainBlock(v10);
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v6 = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      logPrefix = self->_logPrefix;
      id v9 = [(MADPhotosTaskProvider *)self mediaTypePredicatesString];
      *(_DWORD *)buf = 138412546;
      id v12 = logPrefix;
      __int16 v13 = 2112;
      os_log_type_t v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "%@ perform download assets with %@ ...", buf, 0x16u);
    }
  }
  [(MADPhotosTaskProvider *)self performFailedAssetEvaluationWithTask:v4 localIdentifierBlock:v5 fetchCount:[(MADPhotosTaskProvider *)self assetFetchCount] assetCount:[(MADPhotosTaskProvider *)self batchAssetCount] download:1];
}

- (void)performDownloadRetryAssetEvaluationWithTask:(id)a3
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100012454;
  v10[3] = &unk_100219D28;
  v10[4] = self;
  id v4 = a3;
  BOOL v5 = objc_retainBlock(v10);
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v6 = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      logPrefix = self->_logPrefix;
      id v9 = [(MADPhotosTaskProvider *)self mediaTypePredicatesString];
      *(_DWORD *)buf = 138412546;
      id v12 = logPrefix;
      __int16 v13 = 2112;
      os_log_type_t v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "%@ perform download retry assets with %@ ...", buf, 0x16u);
    }
  }
  [(MADPhotosTaskProvider *)self performFailedAssetEvaluationWithTask:v4 localIdentifierBlock:v5 fetchCount:[(MADPhotosTaskProvider *)self assetFetchCount] assetCount:[(MADPhotosTaskProvider *)self batchAssetCount] download:1];
}

- (id)nextDownloadAssetProcessingTask
{
  if (![(PHPhotoLibrary *)self->_photoLibrary vcp_requiresDownloadForTask:[(MADTaskProvider *)self taskID]]|| [(MADPhotosTaskProvider *)self bypassDownload]|| [(MADPhotosTaskProvider *)self downloadStatus]|| [(MADPhotosTaskProvider *)self status])
  {
    id v3 = 0;
  }
  else
  {
    BOOL v5 = [(MADPhotosTaskProvider *)self assetTaskWithAnalysisDatabase:self->_analysisDatabase];
    [(MADPhotosTaskProvider *)self performDownloadAssetEvaluationWithTask:v5];
    if ((objc_msgSend(v5, "hasAdequateAssets:", -[MADPhotosTaskProvider batchAssetCount](self, "batchAssetCount")) & 1) == 0)-[MADPhotosTaskProvider performDownloadRetryAssetEvaluationWithTask:](self, "performDownloadRetryAssetEvaluationWithTask:", v5); {
    -[MADPhotosTaskProvider _collectNumberOfAssets:forCoreAnalyticsField:](self, "_collectNumberOfAssets:forCoreAnalyticsField:", [v5 count], @"NumberOfAssetsOutFromBlacklist");
    }
    if ([v5 count]) {
      os_log_type_t v6 = v5;
    }
    else {
      os_log_type_t v6 = 0;
    }
    id v3 = v6;
  }
  return v3;
}

- (void)retireTask:(id)a3
{
  id v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    BOOL v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v5, v6))
    {
      logPrefix = self->_logPrefix;
      os_log_type_t v8 = objc_opt_class();
      id v9 = v8;
      id v10 = [v4 uuid];
      *(_DWORD *)buf = 138412802;
      os_log_type_t v20 = logPrefix;
      __int16 v21 = 2112;
      v22 = v8;
      __int16 v23 = 2112;
      int v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "%@ Retiring task %@ (%@)", buf, 0x20u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    activeAssetsManagementQueue = self->_activeAssetsManagementQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001283C;
    block[3] = &unk_100219D00;
    block[4] = self;
    id v12 = v4;
    id v18 = v12;
    dispatch_sync(activeAssetsManagementQueue, block);
    id v13 = [v12 status];
    if (v13) {
      [(MADPhotosTaskProvider *)self setStatus:v13];
    }
    taskContextQueue = self->_taskContextQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001289C;
    v15[3] = &unk_100219D00;
    v15[4] = self;
    id v16 = v12;
    dispatch_sync(taskContextQueue, v15);
  }
}

- (unint64_t)currentAssetPriority
{
  return self->_currentAssetPriority;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_activeAssetsManagementQueue, 0);
  objc_storeStrong((id *)&self->_activeAssets, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_ignoredAssets, 0);
  objc_storeStrong((id *)&self->_taskContext, 0);
  objc_storeStrong((id *)&self->_taskContextQueue, 0);
  objc_storeStrong((id *)&self->_statusQueue, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_analysisDatabase, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

+ (void)unimplementedExceptionForMethodName:(id)a3
{
  +[NSString stringWithFormat:@"[VCPMADPhotosProcessingTask %@] should not be called", a3];
  id v3 = +[NSException exceptionWithName:@"NotImplementedException" reason:objc_claimAutoreleasedReturnValue() userInfo:0];
  objc_exception_throw(v3);
}

+ (id)name
{
  return 0;
}

- (id)photoLibrary
{
  return self->_photoLibrary;
}

- (id)assetPriorities
{
  return &off_100230308;
}

- (id)mediaTypePredicatesString
{
  return 0;
}

- (BOOL)bypassDownload
{
  return 0;
}

- (unint64_t)photosMediaProcessingTaskID
{
  uint64_t v2 = [(MADTaskProvider *)self taskID];
  return PHMediaProcessingTaskIDForVCPTaskID(v2);
}

- (BOOL)checkCompatibilityForAsset:(id)a3
{
  return 1;
}

- (id)assetTaskWithAnalysisDatabase:(id)a3
{
  return 0;
}

- (unint64_t)batchAssetCount
{
  return 100;
}

@end