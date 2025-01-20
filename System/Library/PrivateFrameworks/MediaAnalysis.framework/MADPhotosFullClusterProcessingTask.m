@interface MADPhotosFullClusterProcessingTask
+ (id)taskWithPhotoLibrary:(id)a3;
- (BOOL)fullModeClusterOnly;
- (BOOL)requiresProgressQuery;
- (MADPhotosFullClusterProcessingTask)initWithPhotoLibrary:(id)a3;
- (unint64_t)queryMediaAnalysisImagePriority1ProgressPercentage;
- (void)cacheMediaAnalysisImagePriority1Progress;
- (void)process;
- (void)setFullModeClusterOnly:(BOOL)a3;
- (void)setRequiresProgressQuery:(BOOL)a3;
@end

@implementation MADPhotosFullClusterProcessingTask

- (MADPhotosFullClusterProcessingTask)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADPhotosFullClusterProcessingTask;
  v6 = [(MADProcessingTask *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    uint64_t v8 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v7->_photoLibrary];
    database = v7->_database;
    v7->_database = (VCPDatabaseWriter *)v8;
  }
  return v7;
}

+ (id)taskWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithPhotoLibrary:v4];

  return v5;
}

- (unint64_t)queryMediaAnalysisImagePriority1ProgressPercentage
{
  uint64_t v13 = 0;
  unint64_t v14 = 0;
  photoLibrary = self->_photoLibrary;
  id v12 = 0;
  unsigned __int8 v4 = [(PHPhotoLibrary *)photoLibrary mad_calculateProgressPercentage:&v14 totalAssetCount:&v13 progressPercentageWithFailure:0 taskID:1 phTaskID:17 priority:1 failedAssetCount:0 error:&v12];
  id v5 = v12;
  if (v4)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v6 = VCPLogInstance();
      os_log_type_t v7 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v16) = v14;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "[FullCluster] Full analysis image priority 1 progress: %u", buf, 8u);
      }
    }
    [(VCPDatabaseWriter *)self->_database setValue:v14 forKey:@"MediaAnalysisImagePriority1ProgressPercentage"];
    [(VCPDatabaseWriter *)self->_database setValue:v13 forKey:@"MediaAnalysisImagePriority1TotalAssetCount"];
    [(VCPDatabaseWriter *)self->_database commit];
    unint64_t v8 = v14;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v9 = VCPLogInstance();
      os_log_type_t v10 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "[FullCluster] Failed to query full analysis image priority 1 progress: %@", buf, 0xCu);
      }
    }
    unint64_t v8 = 0;
  }

  return v8;
}

- (void)cacheMediaAnalysisImagePriority1Progress
{
  uint64_t v3 = mach_absolute_time();
  unsigned __int8 v4 = VCPSignPostLog();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  v6 = VCPSignPostLog();
  os_log_type_t v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "MADPhotosFullClusterProcessingTask_QueryProgress", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  unint64_t v8 = [(MADPhotosFullClusterProcessingTask *)self queryMediaAnalysisImagePriority1ProgressPercentage];
  v9 = VCPSignPostLog();
  os_log_type_t v10 = v9;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, v5, "MADPhotosFullClusterProcessingTask_QueryProgress", (const char *)&unk_1001F3BD3, v18, 2u);
  }

  if (v3)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  objc_super v11 = +[NSDate now];
  [v11 timeIntervalSinceReferenceDate];
  uint64_t v13 = (uint64_t)v12;

  int64_t v14 = [(VCPDatabaseWriter *)self->_database valueForKey:@"MediaAnalysisImagePriority1MCEnableTimestamp"];
  int64_t v15 = [(VCPDatabaseWriter *)self->_database valueForKey:@"MediaAnalysisImagePriority1CompleteTimestamp"];
  if (v8 >= 0x5A)
  {
    if (v15)
    {
      if (v14) {
        goto LABEL_21;
      }
    }
    else
    {
      [(VCPDatabaseWriter *)self->_database setValue:v13 forKey:@"MediaAnalysisImagePriority1CompleteTimestamp"];
      if (v14) {
        goto LABEL_21;
      }
    }
    [(VCPDatabaseWriter *)self->_database setValue:v13 forKey:@"MediaAnalysisImagePriority1MCEnableTimestamp"];
    goto LABEL_21;
  }
  if (v8 < 0x4B)
  {
    [(VCPDatabaseWriter *)self->_database removeKey:@"MediaAnalysisImagePriority1CompleteTimestamp"];
    database = self->_database;
    CFStringRef v17 = @"MediaAnalysisImagePriority1MCEnableTimestamp";
  }
  else
  {
    if (!v14) {
      [(VCPDatabaseWriter *)self->_database setValue:v13 forKey:@"MediaAnalysisImagePriority1MCEnableTimestamp"];
    }
    database = self->_database;
    CFStringRef v17 = @"MediaAnalysisImagePriority1CompleteTimestamp";
  }
  [(VCPDatabaseWriter *)database removeKey:v17];
LABEL_21:
  [(VCPDatabaseWriter *)self->_database commit];
}

- (void)process
{
  if ((+[VCPVideoCNNAnalyzer isMUBackboneEnabled] & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() < 7) {
      return;
    }
    uint64_t v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[7];
    if (!os_log_type_enabled(v3, v4)) {
      goto LABEL_105;
    }
    *(_WORD *)buf = 0;
    os_signpost_id_t v5 = "[FullCluster] Embedding generation disabled, skip vector database rebuild and VU gallery update";
    goto LABEL_9;
  }
  if ([(PHPhotoLibrary *)self->_photoLibrary vcp_isSyndicationLibrary])
  {
    if ((int)MediaAnalysisLogLevel() < 7) {
      return;
    }
    uint64_t v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[7];
    if (!os_log_type_enabled(v3, v4)) {
      goto LABEL_105;
    }
    *(_WORD *)buf = 0;
    os_signpost_id_t v5 = "[FullCluster] Skip vector database rebuild and gallery update for syndication library";
    goto LABEL_9;
  }
  v6 = [(MADProcessingTask *)self cancelBlock];
  if (v6)
  {
    os_log_type_t v7 = [(MADProcessingTask *)self cancelBlock];
    int v8 = v7[2]();

    if (v8)
    {
      if ((int)MediaAnalysisLogLevel() < 4) {
        return;
      }
      uint64_t v3 = VCPLogInstance();
      os_log_type_t v4 = VCPLogToOSLogType[4];
      if (!os_log_type_enabled(v3, v4)) {
        goto LABEL_105;
      }
      *(_WORD *)buf = 0;
      os_signpost_id_t v5 = "[FullCluster] Task cancelled, skip VSK rebuild and VU clustering";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v3, v4, v5, buf, 2u);
      goto LABEL_105;
    }
  }
  v9 = +[VCPWatchdog sharedWatchdog];
  [v9 pet];

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v11))
    {
      BOOL requiresProgressQuery = self->_requiresProgressQuery;
      BOOL fullModeClusterOnly = self->_fullModeClusterOnly;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v103 = requiresProgressQuery;
      *(_WORD *)&v103[4] = 1024;
      *(_DWORD *)&v103[6] = fullModeClusterOnly;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[FullCluster] Requesting clustering (requiresProgressQuery: %d, fullModeClusterOnly: %d)...", buf, 0xEu);
    }
  }
  int64_t v14 = VCPSignPostLog();
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  id v16 = VCPSignPostLog();
  CFStringRef v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "MADPhotosFullClusterProcessingTask_Process", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if (self->_requiresProgressQuery) {
    [(MADPhotosFullClusterProcessingTask *)self cacheMediaAnalysisImagePriority1Progress];
  }
  uint64_t v18 = [(VCPDatabaseWriter *)self->_database valueForKey:@"MediaAnalysisImagePriority1MCEnableTimestamp"];
  uint64_t v19 = [(VCPDatabaseWriter *)self->_database valueForKey:@"MediaAnalysisImagePriority1LastFullModeClusterTimestamp"];
  v20 = +[NSDate now];
  [v20 timeIntervalSinceReferenceDate];
  double v22 = v21;

  if (v18 && (double)((uint64_t)v22 - v19) >= 86400.0)
  {
    uint64_t v95 = 0;
    int v93 = 0;
    unsigned int v97 = 1;
    goto LABEL_32;
  }
  if (!self->_fullModeClusterOnly)
  {
    unsigned int v97 = 0;
    uint64_t v95 = 1;
    int v93 = 1;
LABEL_32:
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v26 = VCPLogInstance();
      os_log_type_t v27 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v26, v27))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v103 = v97;
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "[FullCluster] Rebuilding VSK (force: %d)...", buf, 8u);
      }
    }
    v28 = +[MADVectorDatabaseManager sharedDatabaseWithPhotoLibrary:self->_photoLibrary];
    uint64_t v3 = v28;
    if (v28)
    {
      v29 = [v28 databaseDirectoryURL];
      BOOL v30 = v29 == 0;

      if (!v30)
      {
        v31 = [(MADProcessingTask *)self cancelBlock];
        id v101 = 0;
        unsigned int v32 = [v3 rebuildWithForce:v97 cancelBlock:v31 extendTimeoutBlock:&stru_10021F228 error:&v101];
        v96 = v101;

        if (v32 && (int)MediaAnalysisLogLevel() >= 4)
        {
          v33 = VCPLogInstance();
          os_log_type_t v34 = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v33, v34))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v103 = v96;
            _os_log_impl((void *)&_mh_execute_header, v33, v34, "[FullCluster] (not disrupting) Failed to build vector database - %@", buf, 0xCu);
          }
        }
        v35 = [(MADProcessingTask *)self cancelBlock];
        if (v35)
        {
          v36 = [(MADProcessingTask *)self cancelBlock];
          int v37 = v36[2]();

          if (v37)
          {
            if ((int)MediaAnalysisLogLevel() < 4)
            {
LABEL_103:
              v40 = v96;
              goto LABEL_104;
            }
            v38 = VCPLogInstance();
            os_log_type_t v39 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v38, v39))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v38, v39, "[FullCluster] Task cancelled, skip VU clustering", buf, 2u);
            }
LABEL_102:

            goto LABEL_103;
          }
        }
        v38 = +[MADVUWGalleryManager sharedGalleryForPhotoLibrary:self->_photoLibrary];
        v92 = v38;
        if (!v38)
        {
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_102;
          }
          v62 = VCPLogInstance();
          os_log_type_t v63 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v62, v63))
          {
            v64 = [(PHPhotoLibrary *)self->_photoLibrary photoLibraryURL];
            *(_DWORD *)buf = 138412290;
            *(void *)v103 = v64;
            _os_log_impl((void *)&_mh_execute_header, v62, v63, "[FullCluster] Failed to obtain VUWGallery for library %@", buf, 0xCu);
          }
LABEL_101:

          v38 = v92;
          goto LABEL_102;
        }
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v44 = VCPLogInstance();
          os_log_type_t v45 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v44, v45))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v103 = v93;
            _os_log_impl((void *)&_mh_execute_header, v44, v45, "[FullCluster] Updating VU gallery under mode %d...", buf, 8u);
          }
        }
        v46 = VCPSignPostLog();
        os_signpost_id_t spid = os_signpost_id_generate(v46);

        v47 = VCPSignPostLog();
        v48 = v47;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VUWGallery_updateForType_Scene", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        v100[0] = _NSConcreteStackBlock;
        v100[1] = 3221225472;
        v100[2] = sub_100174E98;
        v100[3] = &unk_10021E4F0;
        v100[4] = self;
        v91 = objc_retainBlock(v100);
        v49 = [v3 databaseDirectoryURL];
        id v99 = 0;
        unsigned __int8 v50 = [v38 updateForType:0 withVectorStore:v49 mode:v95 progressHandler:v91 error:&v99];
        v94 = v99;

        if ((v50 & 1) == 0)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v54 = VCPLogInstance();
            os_log_type_t v65 = VCPLogToOSLogType[3];
            if (os_log_type_enabled(v54, v65))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v103 = v94;
              v56 = "[FullCluster] Failed to update gallery: %@";
              v57 = v54;
              os_log_type_t v58 = v65;
              uint32_t v59 = 12;
              goto LABEL_75;
            }
LABEL_99:
          }
LABEL_100:

          v62 = v94;
          goto LABEL_101;
        }
        v51 = [(MADProcessingTask *)self cancelBlock];
        if (v51)
        {
          v52 = [(MADProcessingTask *)self cancelBlock];
          int v53 = v52[2]();

          if (v53)
          {
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              v54 = VCPLogInstance();
              os_log_type_t v55 = VCPLogToOSLogType[4];
              if (os_log_type_enabled(v54, v55))
              {
                *(_WORD *)buf = 0;
                v56 = "[FullCluster] Task cancelled, VU clustering incomplete";
                v57 = v54;
                os_log_type_t v58 = v55;
                uint32_t v59 = 2;
LABEL_75:
                _os_log_impl((void *)&_mh_execute_header, v57, v58, v56, buf, v59);
                goto LABEL_99;
              }
              goto LABEL_99;
            }
            goto LABEL_100;
          }
        }
        v66 = VCPSignPostLog();
        v67 = v66;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v67, OS_SIGNPOST_INTERVAL_END, spid, "VUWGallery_updateForType_Scene", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        if (!v97)
        {
LABEL_96:
          v89 = VCPSignPostLog();
          v54 = v89;
          if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v54, OS_SIGNPOST_INTERVAL_END, v15, "MADPhotosFullClusterProcessingTask_Process", (const char *)&unk_1001F3BD3, buf, 2u);
          }
          goto LABEL_99;
        }
        database = self->_database;
        v69 = +[NSDate now];
        [v69 timeIntervalSinceReferenceDate];
        [(VCPDatabaseWriter *)database setValue:(uint64_t)v70 forKey:@"MediaAnalysisImagePriority1LastFullModeClusterTimestamp"];

        [(VCPDatabaseWriter *)self->_database commit];
        v71 = VCPSignPostLog();
        os_signpost_id_t v72 = os_signpost_id_generate(v71);

        v73 = VCPSignPostLog();
        v74 = v73;
        if (v72 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v74, OS_SIGNPOST_INTERVAL_BEGIN, v72, "PhotoLibraryClient_SignalAvailabilityStateChange", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        v75 = [(PHPhotoLibrary *)self->_photoLibrary photoLibrary];
        v76 = [v75 assetsdClient];
        v77 = [v76 libraryInternalClient];
        id v98 = 0;
        unsigned int v78 = [v77 signalAvailabilityStateDidChangeWithError:&v98];
        id v79 = v98;

        if (v78)
        {
          if ((int)MediaAnalysisLogLevel() < 5) {
            goto LABEL_92;
          }
          v80 = VCPLogInstance();
          os_log_type_t v81 = VCPLogToOSLogType[5];
          if (!os_log_type_enabled(v80, v81)) {
            goto LABEL_91;
          }
          *(_WORD *)buf = 0;
          v82 = "[FullCluster] Signalled Photos availability state change";
          v83 = v80;
          os_log_type_t v84 = v81;
          uint32_t v85 = 2;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_92;
          }
          v80 = VCPLogInstance();
          os_log_type_t v86 = VCPLogToOSLogType[3];
          if (!os_log_type_enabled(v80, v86))
          {
LABEL_91:

LABEL_92:
            v87 = VCPSignPostLog();
            v88 = v87;
            if (v72 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v87))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v88, OS_SIGNPOST_INTERVAL_END, v72, "PhotoLibraryClient_SignalAvailabilityStateChange", (const char *)&unk_1001F3BD3, buf, 2u);
            }

            goto LABEL_96;
          }
          *(_DWORD *)buf = 138412290;
          *(void *)v103 = v79;
          v82 = "[FullCluster] Failed to signal Photos availability state change: %@";
          v83 = v80;
          os_log_type_t v84 = v86;
          uint32_t v85 = 12;
        }
        _os_log_impl((void *)&_mh_execute_header, v83, v84, v82, buf, v85);
        goto LABEL_91;
      }
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_105;
      }
      v40 = VCPLogInstance();
      os_log_type_t v60 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v40, v60))
      {
        v61 = [(PHPhotoLibrary *)self->_photoLibrary photoLibraryURL];
        *(_DWORD *)buf = 138412290;
        *(void *)v103 = v61;
        v43 = v40;
        _os_log_impl((void *)&_mh_execute_header, v40, v60, "[FullCluster] Failed to obtain vector database directory for library %@", buf, 0xCu);

        goto LABEL_68;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_105;
      }
      v40 = VCPLogInstance();
      os_log_type_t v41 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v40, v41))
      {
        v42 = [(PHPhotoLibrary *)self->_photoLibrary photoLibraryURL];
        *(_DWORD *)buf = 138412290;
        *(void *)v103 = v42;
        v43 = v40;
        _os_log_impl((void *)&_mh_execute_header, v40, v41, "[FullCluster] Failed to obtain vector database for library %@", buf, 0xCu);

LABEL_68:
        v40 = v43;
      }
    }
LABEL_104:

    goto LABEL_105;
  }
  if ((int)MediaAnalysisLogLevel() < 5) {
    return;
  }
  uint64_t v3 = VCPLogInstance();
  os_log_type_t v23 = VCPLogToOSLogType[5];
  if (os_log_type_enabled(v3, v23))
  {
    v24 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)v18];
    v25 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)v19];
    *(_DWORD *)buf = 138412546;
    *(void *)v103 = v24;
    *(_WORD *)&v103[8] = 2112;
    v104 = v25;
    _os_log_impl((void *)&_mh_execute_header, v3, v23, "[FullCluster] Conditions not met for full-mode clustering (MC enable timestamp: %@, last full-mode clustering timestamp: %@), skip VSK rebuild and VU clustering", buf, 0x16u);
  }
LABEL_105:
}

- (BOOL)requiresProgressQuery
{
  return self->_requiresProgressQuery;
}

- (void)setRequiresProgressQuery:(BOOL)a3
{
  self->_BOOL requiresProgressQuery = a3;
}

- (BOOL)fullModeClusterOnly
{
  return self->_fullModeClusterOnly;
}

- (void)setFullModeClusterOnly:(BOOL)a3
{
  self->_BOOL fullModeClusterOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end