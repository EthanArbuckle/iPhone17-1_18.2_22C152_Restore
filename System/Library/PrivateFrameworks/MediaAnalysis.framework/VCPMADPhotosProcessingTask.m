@interface VCPMADPhotosProcessingTask
+ (NSString)name;
+ (unint64_t)taskID;
+ (void)unimplementedExceptionForMethodName:(id)a3;
- (BOOL)_isAssetEligible:(id)a3 withAnalysisDatabase:(id)a4 previousStatus:(unint64_t *)a5 previousAttempts:(int *)a6 lastAttemptDate:(id *)a7 allowDownload:(BOOL)a8;
- (BOOL)shouldProcessAsset:(id)a3;
- (VCPMADPhotosProcessingTask)initWithCompletionHandler:(id)a3;
- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
- (int)_processAssetsInBatch:(id)a3;
- (int)processAssetsInFetchResult:(id)a3 withAnalysisDatabase:(id)a4 allowDownload:(BOOL)a5 progress:(id)a6;
- (int)waitForPublishing;
@end

@implementation VCPMADPhotosProcessingTask

- (VCPMADPhotosProcessingTask)initWithCompletionHandler:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VCPMADPhotosProcessingTask;
  v3 = [(VCPMADPhotosProcessingTask *)&v9 initWithCompletionHandler:a3];
  if (v3)
  {
    dispatch_group_t v4 = dispatch_group_create();
    publishGroup = v3->_publishGroup;
    v3->_publishGroup = (OS_dispatch_group *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.mediaanalysisd.photosprocessing.publish", 0);
    publishQueue = v3->_publishQueue;
    v3->_publishQueue = (OS_dispatch_queue *)v6;
  }
  return v3;
}

- (BOOL)_isAssetEligible:(id)a3 withAnalysisDatabase:(id)a4 previousStatus:(unint64_t *)a5 previousAttempts:(int *)a6 lastAttemptDate:(id *)a7 allowDownload:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  id v33 = 0;
  id v14 = a4;
  v15 = [v13 localIdentifier];
  unsigned int v16 = objc_msgSend(v14, "queryProcessingStatus:attempts:lastAttemptDate:andNextAttemptDate:forLocalIdentifier:andTaskID:", a5, a6, a7, &v33, v15, objc_msgSend((id)objc_opt_class(), "taskID"));

  id v17 = v33;
  if (v16)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v18 = VCPLogInstance();
      os_log_type_t v19 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v18, v19))
      {
        v20 = [(id)objc_opt_class() name];
        v21 = [v13 localIdentifier];
        *(_DWORD *)buf = 138412802;
        v35 = v20;
        __int16 v36 = 2112;
        v37 = v21;
        __int16 v38 = 1024;
        LODWORD(v39) = v16;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "[%@][%@] Failed to query processing status due to DB error %d", buf, 0x1Cu);
      }
LABEL_5:
    }
  }
  else
  {
    if (!*a6
      || (+[NSDate date],
          v23 = objc_claimAutoreleasedReturnValue(),
          id v24 = [v17 compare:v23],
          v23,
          v24 != (id)1)
      || v8 && *a6 == 1 && *a5 == 2)
    {
      BOOL v22 = 1;
      goto LABEL_13;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v18 = VCPLogInstance();
      os_log_type_t v26 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v18, v26))
      {
        v27 = [(id)objc_opt_class() name];
        v28 = [v13 localIdentifier];
        v29 = VCPProcessingStatusDescription(*a5);
        int v30 = *a6;
        v31 = +[VCPLogManager dateFormatter];
        v32 = [v31 stringFromDate:v17];
        *(_DWORD *)buf = 138413314;
        v35 = v27;
        __int16 v36 = 2112;
        v37 = v28;
        __int16 v38 = 2112;
        v39 = v29;
        __int16 v40 = 1024;
        int v41 = v30;
        __int16 v42 = 2112;
        v43 = v32;
        _os_log_impl((void *)&_mh_execute_header, v18, v26, "[%@][%@] Asset skipped (%@|%d); revisit date: %@",
          buf,
          0x30u);
      }
      goto LABEL_5;
    }
  }
  BOOL v22 = 0;
LABEL_13:

  return v22;
}

- (int)_processAssetsInBatch:(id)a3
{
  id v4 = a3;
  v5 = +[MADStateHandler sharedStateHandler];
  objc_msgSend(v5, "addBreadcrumb:", @"Processing batch size %lu", objc_msgSend(v4, "count"));

  unsigned int v6 = [v4 prepare];
  if (v6)
  {
    int v7 = v6;
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      BOOL v8 = VCPLogInstance();
      os_log_type_t v9 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled(v8, v9))
      {
LABEL_13:

        goto LABEL_14;
      }
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      v10 = "Failed to prepare batch: %@";
LABEL_5:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v10, buf, 0xCu);
      goto LABEL_13;
    }
  }
  else
  {
    unsigned int v11 = [v4 process];
    int v7 = v11;
    if (v11 != -128 && v11)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        BOOL v8 = VCPLogInstance();
        os_log_type_t v9 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v8, v9)) {
          goto LABEL_13;
        }
        *(_DWORD *)buf = 138412290;
        id v20 = v4;
        v10 = "Failed to process batch: %@";
        goto LABEL_5;
      }
    }
    else
    {
      v12 = +[MADStateHandler sharedStateHandler];
      objc_msgSend(v12, "addBreadcrumb:", @"Finished processing batch size %lu", objc_msgSend(v4, "count"));

      dispatch_group_wait((dispatch_group_t)self->_publishGroup, 0xFFFFFFFFFFFFFFFFLL);
      if (!self->_publishError)
      {
        publishGroup = self->_publishGroup;
        publishQueue = self->_publishQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001366E0;
        block[3] = &unk_100219D00;
        id v17 = v4;
        v18 = self;
        dispatch_group_async(publishGroup, publishQueue, block);
        BOOL v8 = v17;
        goto LABEL_13;
      }
    }
  }
LABEL_14:

  return v7;
}

- (int)processAssetsInFetchResult:(id)a3 withAnalysisDatabase:(id)a4 allowDownload:(BOOL)a5 progress:(id)a6
{
  BOOL v8 = a5;
  id v11 = a3;
  id v12 = a4;
  id v57 = a6;
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_10013731C;
  v83[3] = &unk_10021CAE0;
  v83[4] = self;
  v59 = v12;
  BOOL v53 = v8;
  id v55 = [(VCPMADPhotosProcessingTask *)self batchWithAnalysisDatabase:v12 allowDownload:v8 cancelBlock:v83];
  objc_msgSend(v57, "setTotalUnitCount:", objc_msgSend(v11, "count"));
  v60 = +[NSMutableArray array];
  unint64_t v13 = 0;
  id v14 = 0;
  uint64_t v79 = 0;
  v80 = &v79;
  v50 = v67;
  v49 = v65;
  uint64_t v81 = 0x2020000000;
  int v82 = 0;
  os_log_type_t type = VCPLogToOSLogType[7];
  os_log_type_t v54 = VCPLogToOSLogType[5];
  v51 = v71;
  v52 = v75;
  while (v13 < (unint64_t)objc_msgSend(v11, "count", v49, v50, v51, v52))
  {
    if ([(VCPMADPhotosProcessingTask *)self isCanceled])
    {
      uint64_t v6 = 4294967168;
      int v16 = 1;
      goto LABEL_56;
    }
    id v17 = +[VCPWatchdog sharedWatchdog];
    [v17 pet];

    v18 = [v11 objectAtIndexedSubscript:v13];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      os_log_type_t v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, type))
      {
        id v20 = [(id)objc_opt_class() name];
        v21 = [v18 localIdentifier];
        *(_DWORD *)buf = 138412546;
        id v85 = v20;
        __int16 v86 = 2112;
        v87 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, type, "[%@][%@] Evaluating asset...", buf, 0x16u);
      }
    }
    if (!v14)
    {
      id v14 = [v18 photoLibrary];
    }
    if ((+[PHPhotoLibrary mad_isProcessingNeededOnAsset:forTaskID:](PHPhotoLibrary, "mad_isProcessingNeededOnAsset:forTaskID:", v18, [(id)objc_opt_class() taskID]) & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, v54))
        {
          id v28 = (id)objc_opt_class();
          v29 = [v18 localIdentifier];
          unsigned int v30 = [(id)objc_opt_class() taskID];
          *(_DWORD *)buf = 138412802;
          id v85 = v28;
          __int16 v86 = 2112;
          v87 = v29;
          __int16 v88 = 1024;
          unsigned int v89 = v30;
          _os_log_impl((void *)&_mh_execute_header, v27, v54, "[%@][%@] Asset does not need processing in task %u, ignoring... ", buf, 0x1Cu);
        }
      }
      [v60 addObject:v18];
      v31 = [v18 localIdentifier];
      objc_msgSend(v59, "removeProcessingStatusForLocalIdentifier:andTaskID:", v31, objc_msgSend((id)objc_opt_class(), "taskID"));

      [v59 commit];
      id v32 = [v60 count];
      if (v32 >= +[PHPhotoLibrary mad_maxIgnoredAssetsToMarkAsProcessed])
      {
        id v33 = +[VCPWatchdog sharedWatchdog];
        [v33 pet];

        objc_msgSend(v14, "mad_markAsProcessedByTask:forAssets:", objc_msgSend((id)objc_opt_class(), "taskID"), v60);
        [v60 removeAllObjects];
      }
      int v16 = 4;
      goto LABEL_55;
    }
    if (![(VCPMADPhotosProcessingTask *)self shouldProcessAsset:v18])
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v34 = VCPLogInstance();
        if (os_log_type_enabled(v34, type))
        {
          v35 = [(id)objc_opt_class() name];
          __int16 v36 = [v18 localIdentifier];
          *(_DWORD *)buf = 138412546;
          id v85 = v35;
          __int16 v86 = 2112;
          v87 = v36;
          _os_log_impl((void *)&_mh_execute_header, v34, type, "[%@][%@] Asset up-to-date; skipping", buf, 0x16u);
        }
      }
      v37 = [v18 localIdentifier];
      id v38 = objc_msgSend(v59, "removeProcessingStatusForLocalIdentifier:andTaskID:", v37, objc_msgSend((id)objc_opt_class(), "taskID"));

      if (v38 == -108 || v38 == -36)
      {
        uint64_t v39 = (uint64_t)v38;
      }
      else
      {
        uint64_t v39 = (uint64_t)v38;
        if (v38 != -23) {
          uint64_t v39 = v6;
        }
      }
      int v16 = 1;
      if (v38 != -108 && v38 != -36 && v38 != -23)
      {
        [v59 commit];
        objc_msgSend(v57, "setCompletedUnitCount:", (char *)objc_msgSend(v57, "completedUnitCount") + 1);
        int v16 = 4;
      }
      uint64_t v6 = v39;
      goto LABEL_55;
    }
    uint64_t v78 = 0;
    int v77 = 0;
    id v76 = 0;
    unsigned __int8 v22 = [(VCPMADPhotosProcessingTask *)self _isAssetEligible:v18 withAnalysisDatabase:v59 previousStatus:&v78 previousAttempts:&v77 lastAttemptDate:&v76 allowDownload:v53];
    id v56 = v76;
    if ((v22 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        __int16 v40 = VCPLogInstance();
        if (os_log_type_enabled(v40, type))
        {
          int v41 = [(id)objc_opt_class() name];
          __int16 v42 = [v18 localIdentifier];
          *(_DWORD *)buf = 138412546;
          id v85 = v41;
          __int16 v86 = 2112;
          v87 = v42;
          _os_log_impl((void *)&_mh_execute_header, v40, type, "[%@][%@] Asset not eligible for processing; skipping",
            buf,
            0x16u);
        }
      }
      objc_msgSend(v57, "setCompletedUnitCount:", (char *)objc_msgSend(v57, "completedUnitCount") + 1);
      int v16 = 4;
      goto LABEL_54;
    }
    if (v78 == 4)
    {
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v75[0] = sub_100137324;
      v75[1] = &unk_10021CAE0;
      v75[2] = self;
      v23 = [(VCPMADPhotosProcessingTask *)self batchWithAnalysisDatabase:v59 allowDownload:v53 cancelBlock:v74];
      [v23 addPhotosAsset:v18 withPreviousStatus:v78 attempts:v77 andAttemptDate:v56];
      id v24 = +[VCPMADQoSManager sharedManager];
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v71[0] = sub_10013732C;
      v71[1] = &unk_100219CD8;
      v73 = &v79;
      v71[2] = self;
      id v25 = v23;
      id v72 = v25;
      objc_msgSend(v24, "runBlock:withTaskID:", v70, objc_msgSend((id)objc_opt_class(), "taskID"));

      objc_msgSend(v57, "setCompletedUnitCount:", (char *)objc_msgSend(v57, "completedUnitCount") + 1);
      unsigned int v26 = *((_DWORD *)v80 + 6);
      if (v26) {
        int v16 = 1;
      }
      else {
        int v16 = 4;
      }
      if (v26) {
        uint64_t v6 = v26;
      }
      else {
        uint64_t v6 = v6;
      }

      goto LABEL_53;
    }
    [v55 addPhotosAsset:v18 withPreviousStatus:v78 attempts:v77 andAttemptDate:v56];
    if ((unint64_t)[v55 count] >= 0x64)
    {
      v43 = +[VCPMADQoSManager sharedManager];
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v67[0] = sub_100137364;
      v67[1] = &unk_100219CD8;
      v69 = &v79;
      v67[2] = self;
      id v55 = v55;
      id v68 = v55;
      objc_msgSend(v43, "runBlock:withTaskID:", v66, objc_msgSend((id)objc_opt_class(), "taskID"));

      objc_msgSend(v57, "setCompletedUnitCount:", (char *)objc_msgSend(v55, "count") + (void)objc_msgSend(v57, "completedUnitCount"));
      if (*((_DWORD *)v80 + 6))
      {
        int v16 = 1;
        id v25 = v68;
        uint64_t v6 = *((unsigned int *)v80 + 6);
      }
      else
      {
        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472;
        v65[0] = sub_10013739C;
        v65[1] = &unk_10021CAE0;
        v65[2] = self;
        uint64_t v44 = [(VCPMADPhotosProcessingTask *)self batchWithAnalysisDatabase:v59 allowDownload:v53 cancelBlock:v64];

        int v16 = 0;
        id v25 = v68;
        id v55 = (id)v44;
      }
LABEL_53:

      goto LABEL_54;
    }
    int v16 = 0;
LABEL_54:

LABEL_55:
LABEL_56:
    if ((v16 | 4) != 4) {
      goto LABEL_64;
    }
    ++v13;
  }
  if ([v60 count])
  {
    v45 = +[VCPWatchdog sharedWatchdog];
    [v45 pet];

    objc_msgSend(v14, "mad_markAsProcessedByTask:forAssets:", objc_msgSend((id)objc_opt_class(), "taskID"), v60);
    [v60 removeAllObjects];
  }
  if (![v55 count]) {
    goto LABEL_63;
  }
  v46 = +[VCPMADQoSManager sharedManager];
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_1001373A4;
  v61[3] = &unk_100219CD8;
  v63 = &v79;
  v61[4] = self;
  id v47 = v55;
  id v62 = v47;
  objc_msgSend(v46, "runBlock:withTaskID:", v61, objc_msgSend((id)objc_opt_class(), "taskID"));

  objc_msgSend(v57, "setCompletedUnitCount:", (char *)objc_msgSend(v47, "count") + (void)objc_msgSend(v57, "completedUnitCount"));
  LODWORD(v6) = *((_DWORD *)v80 + 6);

  if (v6) {
    id v55 = v47;
  }
  else {
LABEL_63:
  }
    LODWORD(v6) = 0;
LABEL_64:
  _Block_object_dispose(&v79, 8);

  return v6;
}

- (int)waitForPublishing
{
  return self->_publishError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishQueue, 0);
  objc_storeStrong((id *)&self->_publishGroup, 0);
}

+ (void)unimplementedExceptionForMethodName:(id)a3
{
  +[NSString stringWithFormat:@"[VCPMADPhotosProcessingTask %@] should not be called", a3];
  id v3 = +[NSException exceptionWithName:@"NotImplementedException" reason:objc_claimAutoreleasedReturnValue() userInfo:0];
  objc_exception_throw(v3);
}

+ (NSString)name
{
  return 0;
}

+ (unint64_t)taskID
{
  return 0;
}

- (BOOL)shouldProcessAsset:(id)a3
{
  return 0;
}

- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5
{
  return 0;
}

@end