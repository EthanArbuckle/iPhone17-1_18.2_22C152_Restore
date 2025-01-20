@interface MADFullAnalysisResultsSynchronizationTask
+ (id)taskWithPhotoLibrary:(id)a3;
- (MADFullAnalysisResultsSynchronizationTask)initWithPhotoLibrary:(id)a3;
- (int)mainInternal;
- (int)synchronizePhotosDatabaseForProcessedAssets;
- (int)synchronizePhotosDatabaseForProcessedAssetsWithImageOnly:(BOOL)a3;
- (unint64_t)versionResetOptionsForTaskID:(unint64_t)a3;
- (void)resetAnalysisVersionForMediaProcessingTaskID:(unint64_t)a3 assetIdentifiers:(id)a4;
@end

@implementation MADFullAnalysisResultsSynchronizationTask

- (MADFullAnalysisResultsSynchronizationTask)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MADFullAnalysisResultsSynchronizationTask;
  v5 = [(VCPTask *)&v15 initWithPhotoLibrary:v4];
  v6 = v5;
  if (v5)
  {
    v5->_status = 0;
    uint64_t v7 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v4];
    analysisDatabase = v6->_analysisDatabase;
    v6->_analysisDatabase = (VCPDatabaseWriter *)v7;

    dispatch_group_t v9 = dispatch_group_create();
    dispatchGroup = v6->_dispatchGroup;
    v6->_dispatchGroup = (OS_dispatch_group *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.mediaanalysisd.FullAnalysisSyncTask", v11);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v12;
  }
  return v6;
}

+ (id)taskWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v3];

  return v4;
}

- (unint64_t)versionResetOptionsForTaskID:(unint64_t)a3
{
  if (a3 == 17) {
    return 4097;
  }
  int v3 = a3;
  if (a3 == 1) {
    return 10241;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v5, v6))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Unexpected taskID (%d), using PHMediaProcessingResetOption_Version option only", (uint8_t *)v7, 8u);
    }
  }
  return 1;
}

- (void)resetAnalysisVersionForMediaProcessingTaskID:(unint64_t)a3 assetIdentifiers:(id)a4
{
  id v6 = a4;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v7, v8))
    {
      id v9 = (id)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      id v32 = v9;
      __int16 v33 = 2048;
      id v34 = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%@] Resetting analysis version for %lu assets", buf, 0x16u);
    }
  }
  if (!self->_status)
  {
    v10 = [(VCPTask *)self cancel];
    if (v10
      && ([(VCPTask *)self cancel],
          v11 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
          int v12 = v11[2](),
          v11,
          v10,
          v12))
    {
      self->_status = -128;
    }
    else
    {
      uint64_t v29 = mach_absolute_time();
      v13 = VCPSignPostLog();
      os_signpost_id_t v14 = os_signpost_id_generate(v13);

      objc_super v15 = VCPSignPostLog();
      v16 = v15;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "MADFullAnalysisResultsSynchronizationTask_ResetAnalysisVersion", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      v17 = +[VCPWatchdog sharedWatchdog];
      [v17 pet];

      v18 = +[MADStateHandler sharedStateHandler];
      [v18 addBreadcrumb:@"[%@] Resetting MediaAnalysis version for %lu assets in Photos DB", objc_opt_class(), objc_msgSend(v6, "count")];

      v19 = [(VCPTask *)self photoLibrary];
      id v30 = 0;
      unsigned __int8 v20 = objc_msgSend(v19, "resetStateForMediaProcessingTaskID:assetIdentifiers:resetOptions:error:", a3, v6, -[MADFullAnalysisResultsSynchronizationTask versionResetOptionsForTaskID:](self, "versionResetOptionsForTaskID:", a3), &v30);
      id v21 = v30;

      v22 = +[MADStateHandler sharedStateHandler];
      [v22 addBreadcrumb:@"[%@] Finished resetting MediaAnalysis version for %lu assets in Photos DB", objc_opt_class(), objc_msgSend(v6, "count")];

      if ((v20 & 1) == 0)
      {
        self->_status = -18;
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v23 = VCPLogInstance();
          os_log_type_t v24 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v23, v24))
          {
            v25 = objc_opt_class();
            *(_DWORD *)buf = 138412802;
            id v32 = v25;
            __int16 v33 = 2048;
            id v34 = (id)a3;
            __int16 v35 = 2112;
            id v36 = v21;
            id v26 = v25;
            _os_log_impl((void *)&_mh_execute_header, v23, v24, "[%@] Failed to reset analysis version for assets with PHMediaProcessingTaskID %lu, error: %@", buf, 0x20u);
          }
        }
      }
      v27 = VCPSignPostLog();
      v28 = v27;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, v14, "MADFullAnalysisResultsSynchronizationTask_ResetAnalysisVersion", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if (v29)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
    }
  }
}

- (int)synchronizePhotosDatabaseForProcessedAssetsWithImageOnly:(BOOL)a3
{
  BOOL v74 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v4 = VCPLogInstance();
    os_log_type_t v5 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v4, v5))
    {
      *(_DWORD *)buf = 138412546;
      id v86 = (id)objc_opt_class();
      __int16 v87 = 1024;
      LODWORD(v88) = v74;
      id v6 = v86;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "[%@] Start synchronizing photos database for processed assets, imageOnly %d", buf, 0x12u);
    }
  }
  uint64_t v72 = mach_absolute_time();
  uint64_t v7 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v7);

  os_log_type_t v8 = VCPSignPostLog();
  id v9 = v8;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MADFullAnalysisResultsSynchronizationTask_SynchronizePhotosDatabase", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  uint64_t v10 = 17;
  if (!v74) {
    uint64_t v10 = 1;
  }
  uint64_t v75 = v10;
  v11 = [(VCPTask *)self photoLibrary];
  v73 = +[PHMediaProcessingAlgorithmVersionProvider mad_sharedVersionProviderWithPhotoLibrary:v11];

  +[PHAsset mad_sceneConfidenceThresholdForTask:1];
  int v13 = v12;
  os_signpost_id_t v14 = +[VCPWatchdog sharedWatchdog];
  [v14 pet];

  objc_super v15 = [(VCPTask *)self cancel];
  if (v15
    && ([(VCPTask *)self cancel],
        v16 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
        char v17 = v16[2](),
        v16,
        v15,
        v18 = v73,
        (v17 & 1) != 0))
  {
    LODWORD(v19) = -128;
  }
  else
  {
    uint64_t v20 = mach_absolute_time();
    id v21 = VCPSignPostLog();
    os_signpost_id_t v22 = os_signpost_id_generate(v21);

    v23 = VCPSignPostLog();
    os_log_type_t v24 = v23;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "MADFullAnalysisResultsSynchronizationTask_FetchProcessedAssets", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    v25 = +[MADStateHandler sharedStateHandler];
    [v25 addBreadcrumb:@"[%@] Fetching processed assets from Photos DB", objc_opt_class()];

    id v26 = [(VCPTask *)self photoLibrary];
    id v84 = 0;
    LODWORD(v27) = v13;
    v28 = [v26 fetchProcessedAssetsForMediaProcessingTaskID:v75 priority:0 algorithmVersion:v73 sceneConfidenceThreshold:&v84 error:v27];
    id v70 = v84;

    uint64_t v29 = +[MADStateHandler sharedStateHandler];
    [v29 addBreadcrumb:@"[%@] Fetched %lu processed assets from Photos DB", objc_opt_class(), objc_msgSend(v28, "count")];

    id v30 = VCPSignPostLog();
    v31 = v30;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, v22, "MADFullAnalysisResultsSynchronizationTask_FetchProcessedAssets", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if (v20)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    if (v70)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v32 = VCPLogInstance();
        os_log_type_t v33 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v32, v33))
        {
          id v34 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          id v86 = v34;
          __int16 v87 = 2112;
          id v88 = v70;
          id v35 = v34;
          _os_log_impl((void *)&_mh_execute_header, v32, v33, "[%@] Failed to fetch processed assets from Photo Library, error %@", buf, 0x16u);
        }
      }
      id v76 = 0;
      LODWORD(v19) = -18;
    }
    else
    {
      id v76 = 0;
      uint64_t v19 = 0;
      unint64_t v36 = 0;
      os_log_type_t type = VCPLogToOSLogType[3];
      while (v36 < (unint64_t)[v28 count])
      {
        v38 = +[VCPWatchdog sharedWatchdog];
        [v38 pet];

        v39 = [(VCPTask *)self cancel];
        if (v39
          && ([(VCPTask *)self cancel],
              v40 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
              char v41 = v40[2](),
              v40,
              v39,
              (v41 & 1) != 0))
        {
          uint64_t v19 = 4294967168;
          int v42 = 6;
        }
        else
        {
          v43 = [v28 objectAtIndexedSubscript:v36];
          v44 = [v43 mediaAnalysisProperties];

          if (v44
            && ([v28 objectAtIndexedSubscript:v36],
                v45 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v46 = +[PHPhotoLibrary additionalCheckForProcessingNeededForAsset:v45 taskID:v75 priority:0], v45, (v46 & 1) != 0))
          {
            if (!v76) {
              id v76 = objc_alloc_init((Class)NSMutableArray);
            }
            if (v74) {
              uint64_t v47 = (int)[v44 mediaAnalysisImageVersion];
            }
            else {
              uint64_t v47 = (uint64_t)[v44 mediaAnalysisVersion];
            }
            v48 = [v28 objectAtIndexedSubscript:v36];
            v49 = [v48 localIdentifier];

            analysisDatabase = self->_analysisDatabase;
            id v83 = 0;
            uint64_t v51 = [(VCPDatabaseWriter *)analysisDatabase queryAssetWithLocalIdentifier:v49 forMediaAnalysisVersion:&v83];
            id v52 = v83;
            v53 = v52;
            if (v51)
            {
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                v54 = VCPLogInstance();
                if (os_log_type_enabled(v54, type))
                {
                  v55 = objc_opt_class();
                  *(_DWORD *)buf = 138412546;
                  id v86 = v55;
                  __int16 v87 = 2112;
                  id v88 = v49;
                  id v56 = v55;
                  _os_log_impl((void *)&_mh_execute_header, v54, type, "[%@][%@] Failed to query mediaanalysis version", buf, 0x16u);
                }
              }
              int v42 = 6;
            }
            else
            {
              if ((uint64_t)[v52 integerValue] < v47) {
                [v76 addObject:v49];
              }
              if ((unint64_t)[v76 count] < 0x64)
              {
                int v42 = 0;
              }
              else
              {
                dispatchGroup = self->_dispatchGroup;
                dispatchQueue = self->_dispatchQueue;
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472;
                block[2] = sub_10008D118;
                block[3] = &unk_10021C1A0;
                block[4] = self;
                id v81 = v76;
                uint64_t v82 = v75;
                dispatch_group_async(dispatchGroup, dispatchQueue, block);

                int v42 = 0;
                id v76 = 0;
              }
              uint64_t v51 = v19;
            }

            uint64_t v19 = v51;
          }
          else
          {
            int v42 = 15;
          }
        }
        if (v42 != 15 && v42)
        {

          goto LABEL_61;
        }
        ++v36;
      }
      if ([v76 count])
      {
        v59 = self->_dispatchGroup;
        v60 = self->_dispatchQueue;
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472;
        v77[2] = sub_10008D128;
        v77[3] = &unk_10021C1A0;
        v77[4] = self;
        id v78 = v76;
        uint64_t v79 = v75;
        dispatch_group_async(v59, v60, v77);

        id v76 = 0;
      }
    }

    v18 = v76;
  }

LABEL_61:
  dispatch_group_wait((dispatch_group_t)self->_dispatchGroup, 0xFFFFFFFFFFFFFFFFLL);
  if (!v19) {
    LODWORD(v19) = self->_status;
  }
  v61 = VCPSignPostLog();
  v62 = v61;
  if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v61))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v62, OS_SIGNPOST_INTERVAL_END, spid, "MADFullAnalysisResultsSynchronizationTask_SynchronizePhotosDatabase", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if (v72)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v63 = VCPLogInstance();
    os_log_type_t v64 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v63, v64))
    {
      v65 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v86 = v65;
      id v66 = v65;
      _os_log_impl((void *)&_mh_execute_header, v63, v64, "[%@] Finish synchronizing photos database for processed asstes", buf, 0xCu);
    }
  }
  return v19;
}

- (int)synchronizePhotosDatabaseForProcessedAssets
{
  int v3 = VCPPhotosDatabaseSyncTimestampKeyForTask(1);
  uint64_t v4 = [(VCPDatabaseWriter *)self->_analysisDatabase valueForKey:v3];
  if (v4)
  {
    os_log_type_t v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)v4];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v6 = VCPLogInstance();
      os_log_type_t v7 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v6, v7))
      {
        id v8 = (id)objc_opt_class();
        id v9 = [v5 description];
        int v17 = 138412546;
        id v18 = v8;
        __int16 v19 = 2112;
        uint64_t v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%@] Last Photos database synchronization for processed assets conducted on %@", (uint8_t *)&v17, 0x16u);
      }
    }
  }
  else
  {
    int v12 = [(MADFullAnalysisResultsSynchronizationTask *)self synchronizePhotosDatabaseForProcessedAssetsWithImageOnly:1];
    if (v12) {
      goto LABEL_22;
    }
    int v12 = [(MADFullAnalysisResultsSynchronizationTask *)self synchronizePhotosDatabaseForProcessedAssetsWithImageOnly:0];
    if (v12) {
      goto LABEL_22;
    }
    analysisDatabase = self->_analysisDatabase;
    os_signpost_id_t v14 = +[NSDate now];
    [v14 timeIntervalSinceReferenceDate];
    int v12 = [(VCPDatabaseWriter *)analysisDatabase setValue:(uint64_t)v15 forKey:v3];

    if (v12) {
      goto LABEL_22;
    }
  }
  unsigned int v10 = [(VCPDatabaseWriter *)self->_analysisDatabase commit];
  if (v10 == -108)
  {
    int v12 = -108;
  }
  else
  {
    BOOL v11 = v10 == -36 || v10 == -23;
    int v12 = v10;
    if (!v11) {
      int v12 = 0;
    }
  }
  if (v10 != -108 && v10 != -36 && v10 != -23) {
    int v12 = 0;
  }
LABEL_22:

  return v12;
}

- (int)mainInternal
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    int v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)int v12 = 138412290;
      *(void *)&v12[4] = objc_opt_class();
      id v5 = *(id *)&v12[4];
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%@] Synchronizing MediaAnalysis database with Photos database...", v12, 0xCu);
    }
  }
  int v6 = [(MADFullAnalysisResultsSynchronizationTask *)self synchronizePhotosDatabaseForProcessedAssets];
  if (!v6 && (int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      id v9 = objc_opt_class();
      *(_DWORD *)int v12 = 138412290;
      *(void *)&v12[4] = v9;
      id v10 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%@] Finished synchronizing MediaAnalysis database with Photos database.", v12, 0xCu);
    }
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_analysisDatabase, 0);
}

@end