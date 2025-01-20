@interface VCPMediaTypeAnalysisTask
+ (BOOL)streamingAllowed;
+ (id)taskWithPhotoLibrary:(id)a3 mediaType:(int64_t)a4;
- (BOOL)_canDoFullAnalysis:(id)a3;
- (VCPMediaTypeAnalysisTask)init;
- (VCPMediaTypeAnalysisTask)initWithPhotoLibrary:(id)a3 mediaType:(int64_t)a4;
- (int)_processFetchedAssets:(id)a3 withProgressReport:(id)a4 andChangeManager:(id)a5;
- (int)mainInternal;
@end

@implementation VCPMediaTypeAnalysisTask

- (VCPMediaTypeAnalysisTask)init
{
  return 0;
}

- (VCPMediaTypeAnalysisTask)initWithPhotoLibrary:(id)a3 mediaType:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)VCPMediaTypeAnalysisTask;
  result = [(VCPTask *)&v6 initWithPhotoLibrary:a3];
  if (result) {
    result->_type = a4;
  }
  return result;
}

+ (id)taskWithPhotoLibrary:(id)a3 mediaType:(int64_t)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v5 mediaType:a4];

  return v6;
}

- (BOOL)_canDoFullAnalysis:(id)a3
{
  id v3 = a3;
  v4 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v3];
  id v5 = objc_msgSend(v3, "vcp_fullAnalysisTypes");
  LOBYTE(v5) = v5 == objc_msgSend(v3, "vcp_fullAnalysisTypesForResources:", v4);

  return (char)v5;
}

+ (BOOL)streamingAllowed
{
  return 1;
}

- (int)_processFetchedAssets:(id)a3 withProgressReport:(id)a4 andChangeManager:(id)a5
{
  id v64 = a3;
  id v60 = a4;
  id v59 = a5;
  v66 = self;
  if ([(VCPTask *)self isCancelled])
  {
    int v62 = -128;
    goto LABEL_82;
  }
  if (([(id)objc_opt_class() streamingAllowed] & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v11 = VCPLogInstance();
      os_log_type_t v12 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v11, v12))
      {
        *(_WORD *)buf = 0;
        v13 = "Streaming not allowed; skipping assets that require streaming";
        goto LABEL_18;
      }
LABEL_19:
    }
LABEL_20:
    char v58 = 0;
    goto LABEL_21;
  }
  v8 = [(VCPTask *)self photoLibrary];
  if (objc_msgSend(v8, "vcp_isCPLEnabled"))
  {
    v9 = [(VCPTask *)self photoLibrary];
    unsigned __int8 v10 = objc_msgSend(v9, "vcp_isCPLDownloadComplete");

    if ((v10 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v11 = VCPLogInstance();
        os_log_type_t v12 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v11, v12))
        {
          *(_WORD *)buf = 0;
          v13 = "Initial iCPL download is incomplete; skipping assets that require streaming";
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v11, v12, v13, buf, 2u);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
      goto LABEL_20;
    }
  }
  else
  {
  }
  v14 = +[VCPInternetReachability sharedInstance];
  unsigned __int8 v15 = [v14 hasWifiOrEthernetConnection];

  if ((v15 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v11 = VCPLogInstance();
      os_log_type_t v12 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v11, v12))
      {
        *(_WORD *)buf = 0;
        v13 = "Wifi/Ethernet connection unavailable; skipping assets that require streaming";
        goto LABEL_18;
      }
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  char v58 = 1;
LABEL_21:
  v16 = [(VCPTask *)v66 photoLibrary];
  v63 = +[VCPBatchAnalysisTask taskWithPhotoLibrary:v16];

  v17 = [(VCPTask *)v66 cancel];
  [v63 setCancel:v17];

  [v63 setPhotosChangeManager:v59];
  [v63 setProgressReporter:v60];
  [v63 setAllowStreaming:1];
  v61 = +[NSMutableArray array];
  unint64_t v18 = 0;
  os_log_type_t v54 = VCPLogToOSLogType[4];
  os_log_type_t type = VCPLogToOSLogType[7];
  os_log_type_t v57 = VCPLogToOSLogType[5];
  while (v18 < (unint64_t)[v64 count])
  {
    if (![(VCPTask *)v66 isCancelled])
    {
      v21 = +[VCPWatchdog sharedWatchdog];
      [v21 pet];

      v22 = [v64 objectAtIndexedSubscript:v18];
      v23 = [v22 localIdentifier];
      [v61 addObject:v23];

      v65 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v22];
      v24 = [(VCPTask *)v66 photoLibrary];
      if (!objc_msgSend(v24, "vcp_isCPLEnabled")) {
        goto LABEL_53;
      }
      unsigned __int8 v25 = [(VCPMediaTypeAnalysisTask *)v66 _canDoFullAnalysis:v22];

      if ((v25 & 1) == 0)
      {
        if ((v58 & 1) == 0)
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v29 = VCPLogInstance();
            if (os_log_type_enabled(v29, type))
            {
              v30 = [v22 localIdentifier];
              *(_DWORD *)buf = 138412290;
              v69 = v30;
              _os_log_impl((void *)&_mh_execute_header, v29, type, "[%@] Asset requiring streaming skipped", buf, 0xCu);
            }
          }
          [v60 increaseProcessedJobCountByOne];
          goto LABEL_52;
        }
        v24 = objc_msgSend(v65, "vcp_smallMovieDerivativeResource");
        if (!v24)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v31 = VCPLogInstance();
            if (os_log_type_enabled(v31, v54))
            {
              v32 = [v22 localIdentifier];
              *(_DWORD *)buf = 138412290;
              v69 = v32;
              _os_log_impl((void *)&_mh_execute_header, v31, v54, "[%@] Asset has no small video derivative; skipping",
                buf,
                0xCu);
            }
          }
          goto LABEL_51;
        }
        if ([v22 isVideo])
        {
          id v26 = [v24 fileSize];
          if (v26 > +[VCPDownloadManager maxSizeBytes])
          {
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v27 = VCPLogInstance();
              if (os_log_type_enabled(v27, type))
              {
                v28 = [v22 localIdentifier];
                *(_DWORD *)buf = 138412290;
                v69 = v28;
                _os_log_impl((void *)&_mh_execute_header, v27, type, "[%@] File size exceeds streaming threshold; skipping",
                  buf,
                  0xCu);
              }
              goto LABEL_34;
            }
            goto LABEL_51;
          }
          if (!v26 && objc_msgSend(v22, "vcp_isLongMovie"))
          {
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v27 = VCPLogInstance();
              if (os_log_type_enabled(v27, type))
              {
                v33 = [v22 localIdentifier];
                *(_DWORD *)buf = 138412290;
                v69 = v33;
                _os_log_impl((void *)&_mh_execute_header, v27, type, "[%@] Duration exceeds streaming threshold; skipping",
                  buf,
                  0xCu);
              }
LABEL_34:
            }
LABEL_51:
            [v60 increaseProcessedJobCountByOne];

LABEL_52:
            int v20 = 12;
LABEL_74:

            goto LABEL_75;
          }
          if (objc_msgSend(v22, "vcp_isVideoSlowmo")) {
            goto LABEL_51;
          }
        }
LABEL_53:
      }
      id location = 0;
      id v34 = [(VCPBackgroundAnalysisTask *)v66 missingAnalysisForAsset:v22 existingAnalysis:&location resources:v65 forLocalResourcesOnly:1];
      if (v34)
      {
        v35 = VCPSignPostLog();
        os_signpost_id_t v36 = os_signpost_id_generate(v35);

        v37 = VCPSignPostLog();
        v38 = v37;
        if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "VCPMediaTypeAnalysisTask_UnpackComputeSync", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        v39 = objc_msgSend(v65, "mad_computeSyncResource");
        v40 = [(VCPTask *)v66 cancel];
        v41 = objc_msgSend(v39, "mad_existingAnalysisFromComputeSyncForAsset:allowDownload:cancel:", v22, 0, v40);

        v42 = VCPSignPostLog();
        v43 = v42;
        if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, v36, "VCPMediaTypeAnalysisTask_UnpackComputeSync", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        if (v41)
        {
          objc_storeStrong(&location, v41);
          id v34 = [(VCPBackgroundAnalysisTask *)v66 missingAnalysisForAsset:v22 withExistingComputeSyncAnalysis:&location resources:v65 forLocalResourcesOnly:1];
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            v44 = VCPLogInstance();
            if (os_log_type_enabled(v44, v57))
            {
              v55 = [v22 localIdentifier];
              MediaAnalysisTypeShortDescription((uint64_t)objc_msgSend(location, "vcp_types"));
              id v45 = (id)objc_claimAutoreleasedReturnValue();
              v46 = MediaAnalysisTypeShortDescription((uint64_t)v34);
              *(_DWORD *)buf = 138412802;
              v69 = v55;
              __int16 v70 = 2112;
              id v71 = v45;
              __int16 v72 = 2112;
              v73 = v46;
              _os_log_impl((void *)&_mh_execute_header, v44, v57, "[%@] Reusing analysis results from compute sync (existing: %@, missing: %@)", buf, 0x20u);
            }
          }
        }
        [v63 addAnalysis:v34 withExistingAnalysis:location forAsset:v22];
        [v63 cost];
        if (v47 >= 100.0)
        {
          [v63 start];
          unsigned int v48 = [v63 error];
          if (v48)
          {
            int v20 = 1;
            int v62 = v48;
          }
          else
          {
            v49 = [(VCPTask *)v66 photoLibrary];
            v50 = +[VCPBatchAnalysisTask taskWithPhotoLibrary:v49];

            v51 = [(VCPTask *)v66 cancel];
            [v50 setCancel:v51];

            [v50 setPhotosChangeManager:v59];
            [v50 setProgressReporter:v60];
            int v20 = 0;
            v63 = v50;
          }
        }
        else
        {
          int v20 = 0;
        }
      }
      else
      {
        [v60 increaseProcessedJobCountByOne];
        int v20 = 12;
      }

      goto LABEL_74;
    }
    int v62 = -128;
    int v20 = 1;
LABEL_75:
    if (v20 != 12 && v20) {
      goto LABEL_81;
    }
    ++v18;
  }
  [v63 cost];
  if (v52 == 0.0 || ([v63 start], (int v62 = objc_msgSend(v63, "error")) == 0)) {
    int v62 = 0;
  }
LABEL_81:

LABEL_82:
  return v62;
}

- (int)mainInternal
{
  id v3 = VCPSignPostLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  id v5 = VCPSignPostLog();
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VCPMediaTypeAnalysisTask", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      if (self->_type == 1) {
        v9 = "photo";
      }
      else {
        v9 = "movie";
      }
      *(_DWORD *)buf = 136315138;
      v82 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Processing all %s assets...", buf, 0xCu);
    }
  }
  unsigned __int8 v10 = [(VCPTask *)self photoLibrary];
  id v11 = objc_msgSend(v10, "vcp_assetCountWithMediaType:forTaskID:", self->_type, 1);

  if (v11)
  {
    os_log_type_t v12 = [(VCPTask *)self progressHandler];
    BOOL v13 = v12 == 0;

    if (v13)
    {
      v16 = 0;
    }
    else
    {
      v14 = [(VCPTask *)self progressHandler];
      uint64_t v15 = +[VCPProgressReporter reporterWithIntervalSeconds:10 andTotalJobCount:v11 andBlock:v14];

      v16 = (void *)v15;
    }
    unint64_t v18 = [(VCPTask *)self photoLibrary];
    v79 = +[VCPPhotosAssetChangeManager managerForPhotoLibrary:v18];

    if (!v79)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v17 = -18;
LABEL_83:

        return v17;
      }
      int v20 = VCPLogInstance();
      os_log_type_t v44 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v20, v44))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, v44, "Failed to retrieve VCPPhotosAssetChangeManager", buf, 2u);
      }
      int v17 = -18;
LABEL_82:

      goto LABEL_83;
    }
    v19 = [(VCPTask *)self photoLibrary];
    int v20 = +[PHAsset vcp_fetchOptionsForLibrary:v19 forTaskID:1];

    v21 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:0];
    v80 = v21;
    v22 = +[NSArray arrayWithObjects:&v80 count:1];
    [v20 setSortDescriptors:v22];

    int64_t type = self->_type;
    if (type == 2)
    {
      id v45 = VCPSignPostLog();
      os_signpost_id_t spid = os_signpost_id_generate(v45);

      v46 = VCPSignPostLog();
      double v47 = v46;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMediaTypeAnalysisTask_Movie", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if (_os_feature_enabled_impl())
      {
        v29 = 0;
      }
      else
      {
        os_log_type_t v57 = +[MADStateHandler sharedStateHandler];
        [v57 addBreadcrumb:@"[MediaType] Fetching short videos"];

        char v58 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"duration <= %lu", +[PHAsset vcp_longMovieDurationThreshold]);
        [v20 setInternalPredicate:v58];

        v29 = +[PHAsset fetchAssetsWithMediaType:self->_type options:v20];
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          id v59 = VCPLogInstance();
          os_log_type_t v60 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v59, v60))
          {
            v61 = (const char *)[v29 count];
            *(_DWORD *)buf = 134217984;
            v82 = v61;
            _os_log_impl((void *)&_mh_execute_header, v59, v60, "Processing all %lu short movie assets...", buf, 0xCu);
          }
        }
        int v62 = +[MADStateHandler sharedStateHandler];
        objc_msgSend(v62, "addBreadcrumb:", @"[MediaType] Fetched %lu short videos", objc_msgSend(v29, "count"));

        int v17 = [(VCPMediaTypeAnalysisTask *)self _processFetchedAssets:v29 withProgressReport:v16 andChangeManager:v79];
        if (v17) {
          goto LABEL_69;
        }
      }
      v63 = +[MADStateHandler sharedStateHandler];
      [v63 addBreadcrumb:@"[MediaType] Fetching long videos"];

      id v64 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"duration > %lu", +[PHAsset vcp_longMovieDurationThreshold]);
      [v20 setInternalPredicate:v64];

      os_signpost_id_t v36 = +[PHAsset fetchAssetsWithMediaType:self->_type options:v20];

      v65 = +[MADStateHandler sharedStateHandler];
      objc_msgSend(v65, "addBreadcrumb:", @"[MediaType] Fetched %lu long videos", objc_msgSend(v36, "count"));

      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v66 = VCPLogInstance();
        os_log_type_t v67 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v66, v67))
        {
          v68 = (const char *)[v36 count];
          *(_DWORD *)buf = 134217984;
          v82 = v68;
          _os_log_impl((void *)&_mh_execute_header, v66, v67, "Processing all %lu long movie assets...", buf, 0xCu);
        }
      }
      int v17 = [(VCPMediaTypeAnalysisTask *)self _processFetchedAssets:v36 withProgressReport:v16 andChangeManager:v79];
      if (v17) {
        goto LABEL_68;
      }
      v69 = VCPSignPostLog();
      v42 = v69;
      if (spid - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v69)) {
        goto LABEL_67;
      }
      *(_WORD *)buf = 0;
      v43 = "VCPMediaTypeAnalysisTask_Movie";
    }
    else
    {
      if (type != 1)
      {
        unsigned int v48 = VCPSignPostLog();
        os_signpost_id_t v49 = os_signpost_id_generate(v48);

        v50 = VCPSignPostLog();
        v51 = v50;
        if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_INTERVAL_BEGIN, v49, "VCPMediaTypeAnalysisTask_Other", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        double v52 = +[MADStateHandler sharedStateHandler];
        [v52 addBreadcrumb:@"[MediaType] Fetching non image/videos"];

        os_signpost_id_t v36 = +[PHAsset fetchAssetsWithMediaType:self->_type options:v20];
        v53 = +[MADStateHandler sharedStateHandler];
        objc_msgSend(v53, "addBreadcrumb:", @"[MediaType] Fetched %lu non image/videos", objc_msgSend(v36, "count"));

        int v17 = [(VCPMediaTypeAnalysisTask *)self _processFetchedAssets:v36 withProgressReport:v16 andChangeManager:v79];
        if (v17) {
          goto LABEL_68;
        }
        os_log_type_t v54 = VCPSignPostLog();
        v42 = v54;
        if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v54)) {
          goto LABEL_67;
        }
        *(_WORD *)buf = 0;
        v43 = "VCPMediaTypeAnalysisTask_Other";
        v55 = v42;
        os_signpost_id_t v56 = v49;
        goto LABEL_66;
      }
      v24 = VCPSignPostLog();
      os_signpost_id_t spid = os_signpost_id_generate(v24);

      unsigned __int8 v25 = VCPSignPostLog();
      id v26 = v25;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMediaTypeAnalysisTask_Image", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      v27 = +[MADStateHandler sharedStateHandler];
      [v27 addBreadcrumb:@"[MediaType] Fetching face done images"];

      v28 = +[NSPredicate predicateWithFormat:@"faceAdjustmentVersion != nil"];
      [v20 setInternalPredicate:v28];

      v29 = +[PHAsset fetchAssetsWithMediaType:self->_type options:v20];
      v30 = +[MADStateHandler sharedStateHandler];
      objc_msgSend(v30, "addBreadcrumb:", @"[MediaType] Fetched %lu face done images", objc_msgSend(v29, "count"));

      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v31 = VCPLogInstance();
        os_log_type_t v32 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v31, v32))
        {
          v33 = (const char *)[v29 count];
          *(_DWORD *)buf = 134217984;
          v82 = v33;
          _os_log_impl((void *)&_mh_execute_header, v31, v32, "Processing all %lu photo assets with face detection finished...", buf, 0xCu);
        }
      }
      int v17 = [(VCPMediaTypeAnalysisTask *)self _processFetchedAssets:v29 withProgressReport:v16 andChangeManager:v79];
      if (v17) {
        goto LABEL_69;
      }
      id v34 = +[MADStateHandler sharedStateHandler];
      [v34 addBreadcrumb:@"[MediaType] Fetching face not done images"];

      v35 = +[NSPredicate predicateWithFormat:@"faceAdjustmentVersion == nil"];
      [v20 setInternalPredicate:v35];

      os_signpost_id_t v36 = +[PHAsset fetchAssetsWithMediaType:self->_type options:v20];

      v37 = +[MADStateHandler sharedStateHandler];
      objc_msgSend(v37, "addBreadcrumb:", @"[MediaType] Fetched %lu face not done images", objc_msgSend(v36, "count"));

      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v38 = VCPLogInstance();
        os_log_type_t v39 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v38, v39))
        {
          v40 = (const char *)[v36 count];
          *(_DWORD *)buf = 134217984;
          v82 = v40;
          _os_log_impl((void *)&_mh_execute_header, v38, v39, "Processing all %lu photo assets with face detection unfinished...", buf, 0xCu);
        }
      }
      int v17 = [(VCPMediaTypeAnalysisTask *)self _processFetchedAssets:v36 withProgressReport:v16 andChangeManager:v79];
      if (v17)
      {
LABEL_68:
        v29 = v36;
LABEL_69:

        __int16 v70 = [(VCPTask *)self photoLibrary];
        id v71 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v70];
        unsigned int v72 = [v71 commit];

        if (v72 == -108 || v72 == -36 || v72 == -23)
        {
          int v17 = v72;
        }
        else
        {
          if ([v79 publishPendingChanges] && (int)MediaAnalysisLogLevel() >= 4)
          {
            v73 = VCPLogInstance();
            os_log_type_t v74 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v73, v74))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v73, v74, "Failed to publish PHAssetPropertySetMediaAnalysis changes", buf, 2u);
            }
          }
          v75 = VCPSignPostLog();
          v76 = v75;
          if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v76, OS_SIGNPOST_INTERVAL_END, v4, "VCPMediaTypeAnalysisTask", (const char *)&unk_1001F3BD3, buf, 2u);
          }
        }
        goto LABEL_82;
      }
      v41 = VCPSignPostLog();
      v42 = v41;
      if (spid - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v41))
      {
LABEL_67:

        int v17 = 0;
        goto LABEL_68;
      }
      *(_WORD *)buf = 0;
      v43 = "VCPMediaTypeAnalysisTask_Image";
    }
    v55 = v42;
    os_signpost_id_t v56 = spid;
LABEL_66:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v55, OS_SIGNPOST_INTERVAL_END, v56, v43, (const char *)&unk_1001F3BD3, buf, 2u);
    goto LABEL_67;
  }
  return 0;
}

@end