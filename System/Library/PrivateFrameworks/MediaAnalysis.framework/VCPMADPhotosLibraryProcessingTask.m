@interface VCPMADPhotosLibraryProcessingTask
- (BOOL)run:(id *)a3;
- (VCPMADPhotosLibraryProcessingTask)initWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (id)assetPriorities;
- (int)_checkHardFailuresForPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4;
- (int)_processDownloadEligibleAssetsInPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5;
- (int)_processFailedAssetsInPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5;
- (int)_processPhotoLibrary:(id)a3 withProgress:(id)a4;
- (int)completeSceneProcessingWithProgress:(id)a3;
- (int)processAllAssetsInPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5;
@end

@implementation VCPMADPhotosLibraryProcessingTask

- (VCPMADPhotosLibraryProcessingTask)initWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000EB368;
  v21[3] = &unk_10021AD08;
  id v14 = a6;
  id v22 = v14;
  v20.receiver = self;
  v20.super_class = (Class)VCPMADPhotosLibraryProcessingTask;
  v15 = [(VCPMADPhotosProcessingTask *)&v20 initWithCompletionHandler:v21];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)(v15 + 28), a3);
    id v17 = objc_retainBlock(v13);
    v18 = *(void **)(v16 + 36);
    *(void *)(v16 + 36) = v17;

    [v16 setCancelBlock:v12];
  }

  return (VCPMADPhotosLibraryProcessingTask *)v16;
}

- (int)completeSceneProcessingWithProgress:(id)a3
{
  id v4 = a3;
  [v4 setTotalUnitCount:100];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000EB57C;
  v12[3] = &unk_10021C3B8;
  v12[4] = self;
  id v6 = v4;
  id v13 = v6;
  v7 = objc_retainBlock(v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000EB77C;
  v11[3] = &unk_100219D98;
  v11[4] = self;
  v8 = objc_retainBlock(v11);
  v9 = +[VCPMADSceneLibraryProcessingTask taskWithPhotoLibraries:*(void *)(&self->super._publishError + 1) cancelBlock:v8 progressHandler:v7 andCompletionHandler:&stru_10021DCC0];
  LODWORD(self) = [v9 run];

  return (int)self;
}

- (int)_checkHardFailuresForPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4
{
  id v34 = a3;
  id v36 = a4;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v6 = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v6, v7))
    {
      v8 = [(id)objc_opt_class() name];
      *(_DWORD *)buf = 138412290;
      v39 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%@] Checking processing status from previous runs", buf, 0xCu);
    }
  }
  id v37 = 0;
  objc_msgSend(v36, "fetchLocalIdentifiers:withTaskID:andProcessingStatus:", &v37, objc_msgSend((id)objc_opt_class(), "taskID"), 1);
  id v35 = v37;
  v9 = (char *)[v35 count];
  if (v9)
  {
    v10 = &ADClientSetValueForScalarKey_ptr;
    +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:](PHAsset, "vcp_fetchOptionsForLibrary:forTaskID:", v34, [(id)objc_opt_class() taskID]);
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    id v11 = +[PHAsset fetchAssetsWithLocalIdentifiers:v35 options:log];
    unint64_t v12 = 0;
    os_log_type_t type = VCPLogToOSLogType[6];
    *(void *)&long long v13 = 138412546;
    long long v31 = v13;
    while (v12 < (unint64_t)objc_msgSend(v11, "count", v31))
    {
      v15 = [v11 objectAtIndexedSubscript:v12];
      if ([(VCPMADPhotosProcessingTask *)self shouldProcessAsset:v15])
      {
        char v16 = 1;
        id v17 = v10;
      }
      else
      {
        v18 = [v15 localIdentifier];
        v19 = (_UNKNOWN **)objc_msgSend(v36, "removeProcessingStatusForLocalIdentifier:andTaskID:", v18, objc_msgSend((id)objc_opt_class(), "taskID"));

        if (v19 == -108 || v19 == -36)
        {
          id v17 = v19;
        }
        else
        {
          id v17 = v19;
          if (v19 != -23) {
            id v17 = v10;
          }
        }
        char v16 = 0;
        if (v19 != -108 && v19 != -36 && v19 != -23)
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            objc_super v20 = VCPLogInstance();
            if (os_log_type_enabled(v20, type))
            {
              v21 = [(id)objc_opt_class() name];
              id v22 = [v15 localIdentifier];
              *(_DWORD *)buf = v31;
              v39 = v21;
              __int16 v40 = 2112;
              v41 = v22;
              _os_log_impl((void *)&_mh_execute_header, v20, type, "[%@][%@] Asset is processed; clearing failure status",
                buf,
                0x16u);
            }
          }
          --v9;
          char v16 = 1;
        }
      }

      ++v12;
      v10 = v17;
      if ((v16 & 1) == 0) {
        goto LABEL_37;
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, type))
      {
        v24 = [(id)objc_opt_class() name];
        *(_DWORD *)buf = v31;
        v39 = v24;
        __int16 v40 = 2048;
        v41 = v9;
        _os_log_impl((void *)&_mh_execute_header, v23, type, "[%@] %lu assets processing status changed to Hard Failure", buf, 0x16u);
      }
    }
    unsigned int v25 = objc_msgSend(v36, "hardFailAllRunningProcessingStatusForTaskID:", objc_msgSend((id)objc_opt_class(), "taskID"));
    if (v25 == -108 || v25 == -36)
    {
      LODWORD(v17) = v25;
    }
    else
    {
      LODWORD(v17) = v25;
      if (v25 != -23) {
        LODWORD(v17) = v10;
      }
    }
    if (v25 == -108
      || v25 == -36
      || v25 == -23
      || (unsigned int v26 = [v36 commit], LODWORD(v17) = v26, v26 == -108)
      || v26 == -36
      || v26 == -23)
    {
LABEL_37:

      goto LABEL_46;
    }
  }
  if ((int)MediaAnalysisLogLevel() < 7)
  {
    LODWORD(v17) = 0;
  }
  else
  {
    v27 = VCPLogInstance();
    os_log_type_t v28 = VCPLogToOSLogType[7];
    os_log_t log = v27;
    if (os_log_type_enabled(v27, v28))
    {
      v29 = [(id)objc_opt_class() name];
      *(_DWORD *)buf = 138412290;
      v39 = v29;
      _os_log_impl((void *)&_mh_execute_header, log, v28, "[%@] Processing status is up-to-date", buf, 0xCu);
    }
    LODWORD(v17) = 0;
LABEL_46:
  }
  return (int)v17;
}

- (id)assetPriorities
{
  return &off_100230518;
}

- (int)processAllAssetsInPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5
{
  id v51 = a3;
  id v47 = a4;
  id v48 = a5;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v8, v9))
    {
      v10 = [(id)objc_opt_class() name];
      *(_DWORD *)buf = 138412290;
      v54 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[%@] Evaluating all assets in Photo Library", buf, 0xCu);
    }
  }
  id v11 = [(VCPMADPhotosLibraryProcessingTask *)self assetPriorities];
  uint64_t v12 = 1;
  os_log_type_t type = VCPLogToOSLogType[5];
  os_log_type_t v49 = VCPLogToOSLogType[3];
  os_log_type_t v45 = VCPLogToOSLogType[6];
  while (v12 - 1 < (unint64_t)[v11 count])
  {
    if ((unint64_t)[v11 count] >= 2 && (int)MediaAnalysisLogLevel() >= 5)
    {
      id v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, type))
      {
        v15 = [(id)objc_opt_class() name];
        *(_DWORD *)buf = 138412546;
        v54 = v15;
        __int16 v55 = 2048;
        uint64_t v56 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, type, "[%@] Evaluating P%lu assets", buf, 0x16u);
      }
    }
    char v16 = [v11 objectAtIndexedSubscript:v12 - 1];
    id v17 = [v16 unsignedIntegerValue];

    v18 = +[PHMediaProcessingAlgorithmVersionProvider mad_sharedVersionProviderWithPhotoLibrary:v51];
    +[PHAsset mad_sceneConfidenceThresholdForTask:](PHAsset, "mad_sceneConfidenceThresholdForTask:", [(id)objc_opt_class() taskID]);
    int v20 = v19;
    v21 = +[MADStateHandler sharedStateHandler];
    id v22 = [(id)objc_opt_class() name];
    [v21 addBreadcrumb:@"[%@] Fetching Priority%lu assets", v22, v12];

    v23 = VCPSignPostLog();
    os_signpost_id_t v24 = os_signpost_id_generate(v23);

    unsigned int v25 = VCPSignPostLog();
    unsigned int v26 = v25;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "VCPMADPhotosLibraryProcessingTask_FetchAssets", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    id v27 = [(id)objc_opt_class() taskID];
    uint64_t v28 = PHMediaProcessingTaskIDForVCPTaskID((uint64_t)v27);
    id v52 = 0;
    LODWORD(v29) = v20;
    v30 = [v51 fetchAssetsForMediaProcessingTaskID:v28 priority:v17 algorithmVersion:v18 sceneConfidenceThreshold:&v52 error:v29];
    id v31 = v52;
    v32 = VCPSignPostLog();
    v33 = v32;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, v24, "VCPMADPhotosLibraryProcessingTask_FetchAssets", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if (v31)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v34 = VCPLogInstance();
        if (os_log_type_enabled(v34, v49))
        {
          id v35 = [(id)objc_opt_class() name];
          *(_DWORD *)buf = 138412546;
          v54 = v35;
          __int16 v55 = 2112;
          uint64_t v56 = (uint64_t)v31;
          _os_log_impl((void *)&_mh_execute_header, v34, v49, "[%@] Failed to fetch assets: %@", buf, 0x16u);
        }
      }
      int v50 = -18;
      BOOL v36 = 1;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        id v37 = VCPLogInstance();
        if (os_log_type_enabled(v37, v45))
        {
          v38 = [(id)objc_opt_class() name];
          unsigned int v39 = [v30 count];
          *(_DWORD *)buf = 138412546;
          v54 = v38;
          __int16 v55 = 1024;
          LODWORD(v56) = v39;
          _os_log_impl((void *)&_mh_execute_header, v37, v45, "[%@] Fetched %d assets", buf, 0x12u);
        }
      }
      __int16 v40 = +[MADStateHandler sharedStateHandler];
      v41 = [(id)objc_opt_class() name];
      [v40 addBreadcrumb:@"[%@] Fetched %d Priority%lu assets", v41, objc_msgSend(v30, "count"), v12];

      unsigned int v42 = [(VCPMADPhotosProcessingTask *)self processAssetsInFetchResult:v30 withAnalysisDatabase:v47 allowDownload:0 progress:v48];
      BOOL v36 = v42 != 0;
      int v43 = v50;
      if (v42) {
        int v43 = v42;
      }
      int v50 = v43;
    }

    ++v12;
    if (v36) {
      goto LABEL_34;
    }
  }
  int v50 = [(VCPMADPhotosProcessingTask *)self waitForPublishing];
LABEL_34:

  return v50;
}

- (int)_processDownloadEligibleAssetsInPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5
{
  id v50 = a3;
  id v8 = a4;
  id v51 = a5;
  uint64_t v9 = (uint64_t)buf;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = [(id)objc_opt_class() name];
      *(_DWORD *)buf = 138412290;
      v60 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%@] Evaluating download eligible assets", buf, 0xCu);
    }
  }
  objc_msgSend(v51, "setTotalUnitCount:", (int)objc_msgSend(v8, "queryAssetCountForTaskID:withStatus:andAttempts:", objc_msgSend((id)objc_opt_class(), "taskID"), 2, 1));
  os_log_type_t type = VCPLogToOSLogType[7];
  do
  {
    if ([(VCPMADPhotosLibraryProcessingTask *)self isCanceled])
    {
      uint64_t v9 = 4294967168;
      int v14 = 1;
    }
    else
    {
      v15 = +[VCPWatchdog sharedWatchdog];
      [v15 pet];

      id v57 = 0;
      id v16 = objc_msgSend(v8, "fetchLocalIdentifiers:withProcessingStatus:andTaskID:andAttempts:andFetchLimit:", &v57, 2, objc_msgSend((id)objc_opt_class(), "taskID"), 1, 100);
      id v17 = v57;
      v18 = v17;
      if (v16 == -108 || v16 == -36)
      {
        uint64_t v19 = (uint64_t)v16;
      }
      else
      {
        uint64_t v19 = (uint64_t)v16;
        if (v16 != -23) {
          uint64_t v19 = v9;
        }
      }
      int v14 = 1;
      if (v16 != -108 && v16 != -36 && v16 != -23)
      {
        if ([v17 count])
        {
          int v20 = +[MADStateHandler sharedStateHandler];
          v21 = [(id)objc_opt_class() name];
          [v20 addBreadcrumb:@"[%@] Fetching %d download eligible assets", v21, objc_msgSend(v18, "count")];

          id v52 = +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:](PHAsset, "vcp_fetchOptionsForLibrary:forTaskID:", v50, [(id)objc_opt_class() taskID]);
          id v22 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:0];
          v63 = v22;
          v23 = +[NSArray arrayWithObjects:&v63 count:1];
          [v52 setSortDescriptors:v23];

          os_signpost_id_t v24 = +[PHAsset fetchAssetsWithLocalIdentifiers:v18 options:v52];
          unsigned int v25 = +[MADStateHandler sharedStateHandler];
          unsigned int v26 = [(id)objc_opt_class() name];
          [v25 addBreadcrumb:@"[%@] Fetched %d download eligible assets", v26, objc_msgSend(v18, "count")];

          uint64_t v27 = [(VCPMADPhotosProcessingTask *)self processAssetsInFetchResult:v24 withAnalysisDatabase:v8 allowDownload:1 progress:0];
          if (v27
            || ((uint64_t v28 = [(VCPMADPhotosProcessingTask *)self waitForPublishing], v27 = v28,
                                                                                                   v28)
              ? (unsigned int v29 = v28)
              : (unsigned int v29 = v19),
                v28))
          {
            int v14 = 1;
          }
          else
          {
            unsigned int v49 = v29;
            objc_msgSend(v51, "setCompletedUnitCount:", (char *)objc_msgSend(v24, "count") + (void)objc_msgSend(v51, "completedUnitCount"));
            id v30 = [objc_alloc((Class)NSMutableSet) initWithArray:v18];
            for (unint64_t i = 0; i < (unint64_t)[v24 count]; ++i)
            {
              v33 = [v24 objectAtIndexedSubscript:i];
              id v34 = [v33 localIdentifier];
              [v30 removeObject:v34];
            }
            if ([v30 count])
            {
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                id v35 = VCPLogInstance();
                if (os_log_type_enabled(v35, type))
                {
                  BOOL v36 = [(id)objc_opt_class() name];
                  id v37 = [v30 count];
                  *(_DWORD *)buf = 138412546;
                  v60 = v36;
                  __int16 v61 = 2048;
                  id v62 = v37;
                  _os_log_impl((void *)&_mh_execute_header, v35, type, "[%@] Dropping processing status for %lu unknown localIdentifiers", buf, 0x16u);
                }
              }
              long long v55 = 0u;
              long long v56 = 0u;
              long long v53 = 0u;
              long long v54 = 0u;
              id obj = v30;
              id v38 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
              if (v38)
              {
                uint64_t v47 = *(void *)v54;
                while (2)
                {
                  unsigned int v39 = 0;
                  unsigned int v40 = v49;
                  do
                  {
                    if (*(void *)v54 != v47) {
                      objc_enumerationMutation(obj);
                    }
                    unsigned int v41 = objc_msgSend(v8, "removeProcessingStatusForLocalIdentifier:andTaskID:", *(void *)(*((void *)&v53 + 1) + 8 * (void)v39), objc_msgSend((id)objc_opt_class(), "taskID"));
                    if (v41 == -108)
                    {
                      unsigned int v49 = -108;
                    }
                    else
                    {
                      BOOL v42 = v41 == -36 || v41 == -23;
                      unsigned int v49 = v41;
                      if (!v42) {
                        unsigned int v49 = v40;
                      }
                    }
                    if (v41 == -108 || (v41 != -36 ? (BOOL v43 = v41 == -23) : (BOOL v43 = 1), v43))
                    {
                      int v14 = 1;
                      goto LABEL_59;
                    }
                    unsigned int v39 = (char *)v39 + 1;
                    unsigned int v40 = v49;
                  }
                  while (v38 != v39);
                  id v38 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
                  int v14 = 0;
                  if (v38) {
                    continue;
                  }
                  break;
                }
              }
              else
              {
                int v14 = 0;
              }
LABEL_59:
            }
            else
            {
              int v14 = 0;
            }

            uint64_t v27 = v49;
          }

          uint64_t v19 = v27;
        }
        else
        {
          int v14 = 5;
        }
      }

      uint64_t v9 = v19;
    }
  }
  while (!v14);
  if (v14 == 5) {
    int v44 = 0;
  }
  else {
    int v44 = v9;
  }

  return v44;
}

- (int)_processFailedAssetsInPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5
{
  id v49 = a3;
  id v9 = a4;
  id v48 = a5;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    uint64_t v5 = VCPLogInstance();
    os_log_type_t v10 = VCPLogToOSLogType[5];
    if (os_log_type_enabled((os_log_t)v5, v10))
    {
      os_log_type_t v11 = [(id)objc_opt_class() name];
      *(_DWORD *)buf = 138412290;
      v58 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, v10, "[%@] Evaluating failed assets for retry eligibility", buf, 0xCu);
    }
  }
  unsigned int v47 = objc_msgSend(v49, "vcp_allowInMemoryDownload");
  objc_msgSend(v48, "setTotalUnitCount:", objc_msgSend(v9, "queryEligibleToRetryAssetCountWithTaskID:", objc_msgSend((id)objc_opt_class(), "taskID")));
  os_log_type_t type = VCPLogToOSLogType[7];
  do
  {
    if ([(VCPMADPhotosLibraryProcessingTask *)self isCanceled])
    {
      uint64_t v5 = 4294967168;
      int v13 = 1;
    }
    else
    {
      int v14 = +[VCPWatchdog sharedWatchdog];
      [v14 pet];

      id v55 = 0;
      id v15 = objc_msgSend(v9, "fetchLocalIdentifiersEligibleForRetry:withTaskID:andFetchLimit:", &v55, objc_msgSend((id)objc_opt_class(), "taskID"), 100);
      id v16 = v55;
      id v17 = v16;
      if (v15 == -108 || v15 == -36)
      {
        uint64_t v18 = (uint64_t)v15;
      }
      else
      {
        uint64_t v18 = (uint64_t)v15;
        if (v15 != -23) {
          uint64_t v18 = v5;
        }
      }
      int v13 = 1;
      if (v15 != -108 && v15 != -36 && v15 != -23)
      {
        if ([v16 count])
        {
          uint64_t v19 = +[MADStateHandler sharedStateHandler];
          int v20 = [(id)objc_opt_class() name];
          [v19 addBreadcrumb:@"[%@] Fetching %d retry eligible assets", v20, objc_msgSend(v17, "count")];

          id v50 = +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:](PHAsset, "vcp_fetchOptionsForLibrary:forTaskID:", v49, [(id)objc_opt_class() taskID]);
          v21 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:0];
          __int16 v61 = v21;
          id v22 = +[NSArray arrayWithObjects:&v61 count:1];
          [v50 setSortDescriptors:v22];

          v23 = +[PHAsset fetchAssetsWithLocalIdentifiers:v17 options:v50];
          os_signpost_id_t v24 = +[MADStateHandler sharedStateHandler];
          unsigned int v25 = [(id)objc_opt_class() name];
          [v24 addBreadcrumb:@"[%@] Fetched %d retry eligible assets", v25, objc_msgSend(v17, "count")];

          uint64_t v26 = [(VCPMADPhotosProcessingTask *)self processAssetsInFetchResult:v23 withAnalysisDatabase:v9 allowDownload:v47 progress:0];
          if (!v26)
          {
            uint64_t v26 = [(VCPMADPhotosProcessingTask *)self waitForPublishing];
            if (!v26)
            {
              objc_msgSend(v48, "setCompletedUnitCount:", (char *)objc_msgSend(v23, "count") + (void)objc_msgSend(v48, "completedUnitCount"));
              [v23 count];
              id v27 = [objc_alloc((Class)NSMutableSet) initWithArray:v17];
              unint64_t v28 = 0;
              unsigned int v46 = v18;
              while (v28 < (unint64_t)[v23 count])
              {
                id v30 = [v23 objectAtIndexedSubscript:v28];
                id v31 = [v30 localIdentifier];
                [v27 removeObject:v31];

                ++v28;
              }
              if ([v27 count])
              {
                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  v32 = VCPLogInstance();
                  if (os_log_type_enabled(v32, type))
                  {
                    v33 = [(id)objc_opt_class() name];
                    id v34 = [v27 count];
                    *(_DWORD *)buf = 138412546;
                    v58 = v33;
                    __int16 v59 = 2048;
                    id v60 = v34;
                    _os_log_impl((void *)&_mh_execute_header, v32, type, "[%@] Dropping processing status for %lu unknown localIdentifiers", buf, 0x16u);
                  }
                }
                long long v53 = 0u;
                long long v54 = 0u;
                long long v51 = 0u;
                long long v52 = 0u;
                id obj = v27;
                id v35 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
                if (v35)
                {
                  uint64_t v44 = *(void *)v52;
                  while (2)
                  {
                    BOOL v36 = 0;
                    unsigned int v37 = v46;
                    do
                    {
                      if (*(void *)v52 != v44) {
                        objc_enumerationMutation(obj);
                      }
                      unsigned int v38 = objc_msgSend(v9, "removeProcessingStatusForLocalIdentifier:andTaskID:", *(void *)(*((void *)&v51 + 1) + 8 * (void)v36), objc_msgSend((id)objc_opt_class(), "taskID"));
                      if (v38 == -108)
                      {
                        unsigned int v46 = -108;
                      }
                      else
                      {
                        BOOL v39 = v38 == -36 || v38 == -23;
                        unsigned int v46 = v38;
                        if (!v39) {
                          unsigned int v46 = v37;
                        }
                      }
                      if (v38 == -108 || (v38 != -36 ? (BOOL v40 = v38 == -23) : (BOOL v40 = 1), v40))
                      {
                        int v13 = 1;
                        goto LABEL_51;
                      }
                      BOOL v36 = (char *)v36 + 1;
                      unsigned int v37 = v46;
                    }
                    while (v35 != v36);
                    id v35 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
                    int v13 = 0;
                    if (v35) {
                      continue;
                    }
                    break;
                  }
                }
                else
                {
                  int v13 = 0;
                }
LABEL_51:
              }
              else
              {
                int v13 = 0;
              }

              uint64_t v26 = v46;
            }
          }

          uint64_t v18 = v26;
        }
        else
        {
          int v13 = 5;
        }
      }

      uint64_t v5 = v18;
    }
  }
  while (!v13);
  if (v13 == 5) {
    int v41 = 0;
  }
  else {
    int v41 = v5;
  }

  return v41;
}

- (int)_processPhotoLibrary:(id)a3 withProgress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000ED758;
  v30[3] = &unk_100219D98;
  v30[4] = self;
  id v8 = objc_retainBlock(v30);
  [v7 setTotalUnitCount:10];
  +[VCPAnalysisProgressQuery reportProgressForPhotoLibrary:taskID:logMessage:cancelOrExtendTimeoutBlock:](VCPAnalysisProgressQuery, "reportProgressForPhotoLibrary:taskID:logMessage:cancelOrExtendTimeoutBlock:", v6, [(id)objc_opt_class() taskID], @"Checking progress before task", v8);
  id v9 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v9 start];
  os_log_type_t v10 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v6];
  if (v10)
  {
    unsigned int v11 = [(VCPMADPhotosLibraryProcessingTask *)self _checkHardFailuresForPhotoLibrary:v6 withAnalysisDatabase:v10];
    if (!v11)
    {
      if ([(id)objc_opt_class() taskID] != (id)2
        || ([(VCPMADPhotosLibraryProcessingTask *)self cancelBlock],
            uint64_t v12 = objc_claimAutoreleasedReturnValue(),
            +[MADPhotosLibraryRestoreTask taskWithPhotoLibrary:progressHandler:completionHandler:cancelBlock:](MADPhotosLibraryRestoreTask, "taskWithPhotoLibrary:progressHandler:completionHandler:cancelBlock:", v6, 0, 0, v12), v13 = objc_claimAutoreleasedReturnValue(), unsigned int v11 = [v13 run], v13, v12, !v11))
      {
        unsigned int v15 = objc_msgSend(v6, "vcp_allowInMemoryDownload");
        uint64_t v16 = v15 ? 5 : 9;
        id v17 = objc_msgSend(v7, "vcp_childWithPendingUnitCount:", v16);
        unsigned int v11 = [(VCPMADPhotosLibraryProcessingTask *)self processAllAssetsInPhotoLibrary:v6 withAnalysisDatabase:v10 andProgress:v17];
        if (v11
          || v15
          && (objc_msgSend(v7, "vcp_childWithPendingUnitCount:", 4),
              id v27 = objc_claimAutoreleasedReturnValue(),
              unsigned int v11 = [(VCPMADPhotosLibraryProcessingTask *)self _processDownloadEligibleAssetsInPhotoLibrary:v6 withAnalysisDatabase:v10 andProgress:v27], v27, v11))
        {
          int v18 = 6;
        }
        else
        {
          unsigned int v11 = 0;
          int v18 = 0;
        }

        if (v18 != 6)
        {
          unint64_t v28 = objc_msgSend(v7, "vcp_childWithPendingUnitCount:", 1);
          unsigned int v29 = [(VCPMADPhotosLibraryProcessingTask *)self _processFailedAssetsInPhotoLibrary:v6 withAnalysisDatabase:v10 andProgress:v28];

          if (v29) {
            unsigned int v11 = v29;
          }
        }
      }
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v19 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v19, v20))
      {
        v21 = [(id)objc_opt_class() name];
        *(_DWORD *)buf = 138412290;
        v32 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "[%@] Failed to load MediaAnalysis database", buf, 0xCu);
      }
    }
    unsigned int v11 = -18;
  }
  unsigned int v22 = [v10 commit];
  int v23 = v22;
  if (v22 != -108 && v22 != -36 && v22 != -23)
  {
    [v10 flush];
    [v9 stop];
    [v9 elapsedTimeSeconds];
    unsigned int v25 = +[NSString stringWithFormat:@"Checking progress after task (%.2f seconds)", v24];
    +[VCPAnalysisProgressQuery reportProgressForPhotoLibrary:taskID:logMessage:cancelOrExtendTimeoutBlock:](VCPAnalysisProgressQuery, "reportProgressForPhotoLibrary:taskID:logMessage:cancelOrExtendTimeoutBlock:", v6, [(id)objc_opt_class() taskID], v25, v8);

    int v23 = v11;
  }

  return v23;
}

- (BOOL)run:(id *)a3
{
  +[NSProgress progressWithTotalUnitCount:](NSProgress, "progressWithTotalUnitCount:", 100 * (void)[*(id *)(&self->super._publishError + 1) count]);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_1000EE1BC;
  v57[3] = &unk_100219D70;
  v57[4] = self;
  id v49 = (id)objc_claimAutoreleasedReturnValue();
  id v58 = v49;
  unsigned int v47 = +[VCPTimer timerWithIntervalSeconds:10 isOneShot:0 andBlock:v57];
  uint64_t v4 = *(uint64_t *)((char *)&self->_photoLibraries + 4);
  if (v4) {
    (*(void (**)(double))(v4 + 16))(0.0);
  }
  if ([(id)objc_opt_class() taskID] == (id)2
    || (objc_msgSend(v49, "vcp_childWithPendingUnitCount:", objc_msgSend(*(id *)(&self->super._publishError + 1), "count")), v5 = objc_claimAutoreleasedReturnValue(), signed int v6 = -[VCPMADPhotosLibraryProcessingTask completeSceneProcessingWithProgress:](self, "completeSceneProcessingWithProgress:", v5), v5, !v6))
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = *(id *)(&self->super._publishError + 1);
    id v14 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
    if (!v14) {
      goto LABEL_52;
    }
    uint64_t v52 = *(void *)v54;
    os_log_type_t type = VCPLogToOSLogType[5];
    while (1)
    {
      unsigned int v15 = 0;
      do
      {
        if (*(void *)v54 != v52) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v15);
        if ([v16 isReadyForAnalysis])
        {
          if (objc_msgSend(v16, "vcp_requiresProcessingForTask:", objc_msgSend((id)objc_opt_class(), "taskID")))
          {
            if (objc_msgSend(v16, "vcp_anyAssetsForTaskID:", objc_msgSend((id)objc_opt_class(), "taskID")))
            {
              int v18 = VCPSignPostLog();
              os_signpost_id_t v19 = os_signpost_id_generate(v18);

              os_log_type_t v20 = VCPSignPostLog();
              v21 = v20;
              if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "VCPProcessPhotoLibrary", (const char *)&unk_1001F3BD3, buf, 2u);
              }

              if ((int)MediaAnalysisLogLevel() >= 5)
              {
                unsigned int v22 = VCPLogInstance();
                if (os_log_type_enabled(v22, type))
                {
                  int v23 = [(id)objc_opt_class() name];
                  uint64_t v24 = [v16 photoLibraryURL];
                  *(_DWORD *)buf = 138412546;
                  id v62 = v23;
                  __int16 v63 = 2112;
                  v64 = v24;
                  _os_log_impl((void *)&_mh_execute_header, v22, type, "[%@] Processing library %@", buf, 0x16u);
                }
              }
              unsigned int v25 = objc_msgSend(v49, "vcp_childWithPendingUnitCount:", 99);
              signed int v26 = [(VCPMADPhotosLibraryProcessingTask *)self _processPhotoLibrary:v16 withProgress:v25];

              id v27 = VCPSignPostLog();
              unint64_t v28 = v27;
              if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, v19, "VCPProcessPhotoLibrary", (const char *)&unk_1001F3BD3, buf, 2u);
              }

              if (!v26)
              {
                MediaAnalysisDaemonReleaseSharedDataStores(v16);
                int v34 = 0;
                goto LABEL_45;
              }
              if (!a3)
              {
                int v34 = 1;
                goto LABEL_45;
              }
              NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
              unsigned int v29 = "failed";
              if (v26 == -128) {
                unsigned int v29 = "canceled";
              }
              id v30 = +[NSString stringWithFormat:@"Processing %s", v29];
              id v60 = v30;
              id v31 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
              v32 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v26 userInfo:v31];
              id v33 = *a3;
              *a3 = v32;

              int v34 = 1;
              goto LABEL_43;
            }
            if ((int)MediaAnalysisLogLevel() < 5)
            {
LABEL_44:
              int v34 = 3;
              goto LABEL_45;
            }
            id v30 = VCPLogInstance();
            if (os_log_type_enabled(v30, type))
            {
              int v41 = [(id)objc_opt_class() name];
              BOOL v42 = [v16 photoLibraryURL];
              BOOL v43 = [v42 path];
              *(_DWORD *)buf = 138412546;
              id v62 = v41;
              __int16 v63 = 2112;
              v64 = v43;
              _os_log_impl((void *)&_mh_execute_header, v30, type, "[%@] PhotoLibrary %@ is empty; skipping",
                buf,
                0x16u);
            }
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() < 5) {
              goto LABEL_44;
            }
            id v30 = VCPLogInstance();
            if (os_log_type_enabled(v30, type))
            {
              unsigned int v38 = [(id)objc_opt_class() name];
              BOOL v39 = [v16 photoLibraryURL];
              BOOL v40 = [v39 path];
              *(_DWORD *)buf = 138412546;
              id v62 = v38;
              __int16 v63 = 2112;
              v64 = v40;
              _os_log_impl((void *)&_mh_execute_header, v30, type, "[%@] Photo Library does not require processing; skipping library (%@)",
                buf,
                0x16u);
            }
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 5) {
            goto LABEL_44;
          }
          id v30 = VCPLogInstance();
          if (os_log_type_enabled(v30, type))
          {
            id v35 = [(id)objc_opt_class() name];
            BOOL v36 = [v16 photoLibraryURL];
            unsigned int v37 = [v36 path];
            *(_DWORD *)buf = 138412546;
            id v62 = v35;
            __int16 v63 = 2112;
            v64 = v37;
            _os_log_impl((void *)&_mh_execute_header, v30, type, "[%@] Photo Library %@ is not ready; skipping",
              buf,
              0x16u);
          }
        }
        int v34 = 3;
LABEL_43:

LABEL_45:
        if (v34 != 3 && v34) {
          goto LABEL_9;
        }
        unsigned int v15 = (char *)v15 + 1;
      }
      while (v14 != v15);
      id v44 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
      id v14 = v44;
      if (!v44)
      {
LABEL_52:

        uint64_t v45 = *(uint64_t *)((char *)&self->_photoLibraries + 4);
        if (v45) {
          (*(void (**)(double))(v45 + 16))(100.0);
        }
        [v47 destroy];
        id obj = [(VCPMADPhotosLibraryProcessingTask *)self completionHandler];
        (*((void (**)(id, void, void))obj + 2))(obj, 0, 0);
        BOOL v13 = 1;
        goto LABEL_55;
      }
    }
  }
  if (a3)
  {
    NSErrorUserInfoKey v66 = NSLocalizedDescriptionKey;
    uint64_t v7 = [(id)objc_opt_class() name];
    id v8 = "failed";
    if (v6 == -128) {
      id v8 = "canceled";
    }
    id obj = (id)v7;
    id v9 = +[NSString stringWithFormat:@"[%@] Pre Analysis %s", v7, v8];
    v67 = v9;
    os_log_type_t v10 = +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    unsigned int v11 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:v10];
    id v12 = *a3;
    *a3 = v11;

LABEL_9:
    BOOL v13 = 0;
LABEL_55:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_photoLibraries + 4), 0);
  objc_storeStrong((id *)(&self->super._publishError + 1), 0);
}

@end