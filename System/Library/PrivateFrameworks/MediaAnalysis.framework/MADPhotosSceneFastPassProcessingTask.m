@interface MADPhotosSceneFastPassProcessingTask
+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
- (BOOL)_processWithLocalIdentifiers:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)run:(id *)a3;
- (MADPhotosSceneFastPassProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
- (int)_requestAssetResource:(id)a3;
@end

@implementation MADPhotosSceneFastPassProcessingTask

- (MADPhotosSceneFastPassProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v8 = a3;
  v9 = (Block_layout *)a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10016D850;
  v19[3] = &unk_10021AD08;
  id v10 = a5;
  id v20 = v10;
  v18.receiver = self;
  v18.super_class = (Class)MADPhotosSceneFastPassProcessingTask;
  v11 = [(MADPhotosSceneFastPassProcessingTask *)&v18 initWithCompletionHandler:v19];
  if (v11)
  {
    if (v9) {
      v12 = v9;
    }
    else {
      v12 = &stru_10021F1C8;
    }
    v13 = objc_retainBlock(v12);
    id progressHandler = v11->_progressHandler;
    v11->_id progressHandler = v13;

    dispatch_group_t v15 = dispatch_group_create();
    downloadGroup = v11->_downloadGroup;
    v11->_downloadGroup = (OS_dispatch_group *)v15;

    [(MADPhotosSceneFastPassProcessingTask *)v11 setCancelBlock:v8];
  }

  return v11;
}

+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)a1) initWithCancelBlock:v8 progressHandler:v9 andCompletionHandler:v10];

  return v11;
}

- (BOOL)_processWithLocalIdentifiers:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [VCPMADSceneAssetProcessingTask alloc];
  id v11 = [v9 photoLibraryURL];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10016DC44;
  v20[3] = &unk_100219D98;
  v20[4] = self;
  v12 = [(VCPMADSceneAssetProcessingTask *)v10 initWithLocalIdentifiers:v8 fromPhotoLibraryWithURL:v11 cancelBlock:v20 progressHandler:self->_progressHandler completionHandler:&stru_10021F1E8];

  v13 = +[VCPWatchdog sharedWatchdog];
  [v13 pet];

  if (v12)
  {
    signed int v14 = [(VCPMADSceneAssetProcessingTask *)v12 run];
    if (!v14)
    {
      BOOL v18 = 1;
      goto LABEL_7;
    }
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    dispatch_group_t v15 = +[NSString stringWithFormat:@"[MADPhotosSceneFastPassTask] Failed to process asset batch ... "];
    v22 = v15;
    v16 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v17 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v14 userInfo:v16];
  }
  else
  {
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    dispatch_group_t v15 = +[NSString stringWithFormat:@"[MADPhotosSceneFastPassTask] Failed to create asset batch ... "];
    v24 = v15;
    v16 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v17 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v16];
  }
  *a5 = v17;

  BOOL v18 = 0;
LABEL_7:

  return v18;
}

- (int)_requestAssetResource:(id)a3
{
  id v4 = a3;
  v5 = [v4 assetLocalIdentifier];
  v6 = +[NSString stringWithFormat:@"[Scene-FP][Download][%@]", v5];

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v6;
      __int16 v29 = 2112;
      id v30 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "%@ Attempt to download resource: %@", buf, 0x16u);
    }
  }
  id v9 = objc_alloc_init((Class)PHAssetResourceRequestOptions);
  [v9 setNetworkAccessAllowed:1];
  [v9 setDownloadPriority:0];
  [v9 setDownloadIntent:2];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10016E00C;
  v25[3] = &unk_10021BEF0;
  id v10 = v6;
  id v26 = v10;
  [v9 setProgressHandler:v25];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10016E0EC;
  v23[3] = &unk_10021DA50;
  id v11 = v10;
  id v24 = v11;
  v12 = objc_retainBlock(v23);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10016E1B8;
  v20[3] = &unk_10021DA78;
  id v13 = v11;
  id v21 = v13;
  v22 = self;
  signed int v14 = objc_retainBlock(v20);
  dispatch_group_t v15 = +[PHAssetResourceManager defaultManager];
  int v16 = [v15 requestFileURLForAssetResource:v4 options:v9 urlReceivedHandler:v12 completionHandler:v14];

  if (!v16 && (int)MediaAnalysisLogLevel() >= 3)
  {
    v17 = VCPLogInstance();
    os_log_type_t v18 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "%@ Failed to issue download request", buf, 0xCu);
    }
  }
  return v16;
}

- (BOOL)run:(id *)a3
{
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v124 = @"[Scene-FP]";
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "%@ Running MADPhotosSceneFastPassTask ... ", buf, 0xCu);
    }
  }
  v5 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v5);

  v6 = VCPSignPostLog();
  v7 = v6;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MADPhotosSceneFastPassProcessingTask", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  os_log_type_t v8 = +[VCPPhotoLibraryManager sharedManager];
  id v9 = +[PHPhotoLibrary systemPhotoLibraryURL];
  v113 = [v8 photoLibraryWithURL:v9];

  if (!v113)
  {
    NSErrorUserInfoKey v130 = NSLocalizedDescriptionKey;
    id v11 = [0 photoLibraryURL];
    v12 = [v11 path];
    id v13 = +[NSString stringWithFormat:@"%@ Failed to open Photo Library (%@)", @"[Scene-FP]", v12];
    v131 = v13;
    signed int v14 = +[NSDictionary dictionaryWithObjects:&v131 forKeys:&v130 count:1];
    id v114 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v14];

    dispatch_group_t v15 = a3;
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int v16 = VCPLogInstance();
      os_log_type_t v17 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v16, v17))
      {
        os_log_type_t v18 = [v114 description];
        *(_DWORD *)buf = 138412290;
        CFStringRef v124 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "%@", buf, 0xCu);
      }
      dispatch_group_t v15 = a3;
    }
    if (!v15) {
      goto LABEL_23;
    }
LABEL_17:
    id v19 = v114;
    BOOL v20 = 0;
    id v21 = *v15;
    id v114 = v19;
    *dispatch_group_t v15 = v19;
LABEL_122:

    goto LABEL_123;
  }
  if ([v113 isReadyForAnalysisCPLInitialDownloadCompleted])
  {
    if ([v113 isCloudPhotoLibraryEnabled])
    {
      id v10 = +[VCPInternetReachability sharedInstance];
      unsigned int v107 = [v10 hasWifiOrEthernetConnection];
    }
    else
    {
      unsigned int v107 = 0;
    }
    __int16 v29 = +[VCPWatchdog sharedWatchdog];
    [v29 pet];

    id v114 = +[NSMutableArray array];
    v108 = +[NSMutableArray array];
    v110 = +[PHAsset vcp_fetchOptionsForLibrary:v113 forTaskID:2];
    id v30 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:0];
    v127 = v30;
    v31 = +[NSArray arrayWithObjects:&v127 count:1];
    [v110 setSortDescriptors:v31];

    [v110 setFetchLimit:2000];
    v32 = +[PHAsset fetchAssetsWithOptions:v110];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v33 = VCPLogInstance();
      os_log_type_t v34 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v33, v34))
      {
        id v35 = [v32 count];
        *(_DWORD *)buf = 138412546;
        CFStringRef v124 = @"[Scene-FP]";
        __int16 v125 = 2048;
        id v126 = v35;
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "%@ Evaluating %lu recently assets", buf, 0x16u);
      }
    }
    unint64_t v36 = 0;
    os_log_type_t v109 = VCPLogToOSLogType[7];
    os_log_type_t v106 = VCPLogToOSLogType[3];
    os_log_type_t type = VCPLogToOSLogType[5];
    while (v36 < (unint64_t)[v32 count])
    {
      v38 = [v32 objectAtIndexedSubscript:v36];
      v39 = [v38 localIdentifier];
      v40 = +[NSString stringWithFormat:@"[Scene-FP][Prepare][%@]", v39];

      if ([(MADPhotosSceneFastPassProcessingTask *)self isCanceled])
      {
        v41 = +[NSString stringWithFormat:@"%@ Processed canceled", v40];
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v42 = VCPLogInstance();
          if (os_log_type_enabled(v42, type))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v124 = v41;
            _os_log_impl((void *)&_mh_execute_header, v42, type, "%@", buf, 0xCu);
          }
        }
        if (a3)
        {
          NSErrorUserInfoKey v121 = NSLocalizedDescriptionKey;
          v43 = +[NSString stringWithFormat:@"%@", v41];
          v122 = v43;
          v44 = +[NSDictionary dictionaryWithObjects:&v122 forKeys:&v121 count:1];
          v45 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v44];
          id v46 = *a3;
          *a3 = v45;
        }
        int v47 = 1;
      }
      else
      {
        v48 = +[VCPWatchdog sharedWatchdog];
        [v48 pet];

        v49 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v38];
        objc_msgSend(v49, "vcp_thumbnailResource");
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          if ([(__CFString *)v41 vcp_isLocallyAvailable])
          {
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v50 = VCPLogInstance();
              if (os_log_type_enabled(v50, v109))
              {
                *(_DWORD *)buf = 138412290;
                CFStringRef v124 = v40;
                _os_log_impl((void *)&_mh_execute_header, v50, v109, "%@ Thumbnail is ready for analysis", buf, 0xCu);
              }
            }
            v51 = [v38 localIdentifier];
            [v114 addObject:v51];
          }
          else if (v107)
          {
            v53 = [v38 localIdentifier];
            [v108 addObject:v53];

            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v54 = VCPLogInstance();
              if (os_log_type_enabled(v54, v109))
              {
                *(_DWORD *)buf = 138412290;
                CFStringRef v124 = v40;
                _os_log_impl((void *)&_mh_execute_header, v54, v109, "%@ Initialting to download thumbnail ... ", buf, 0xCu);
              }
            }
            dispatch_group_enter((dispatch_group_t)self->_downloadGroup);
            v55 = dispatch_get_global_queue(0, 0);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10016F7F8;
            block[3] = &unk_100219D70;
            block[4] = self;
            v41 = v41;
            v120 = v41;
            dispatch_async(v55, block);
          }
          int v47 = 0;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v52 = VCPLogInstance();
            if (os_log_type_enabled(v52, v106))
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v124 = v40;
              _os_log_impl((void *)&_mh_execute_header, v52, v106, "%@ Invalid thumbnail resource; skipping ...",
                buf,
                0xCu);
            }
          }
          int v47 = 16;
        }
      }

      if ((v47 | 0x10) != 0x10) {
        goto LABEL_120;
      }
      ++v36;
    }
    if (![v114 count]) {
      goto LABEL_83;
    }
    v57 = +[VCPWatchdog sharedWatchdog];
    [v57 pet];

    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v58 = VCPLogInstance();
      os_log_type_t v59 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v58, v59))
      {
        id v60 = [v114 count];
        *(_DWORD *)buf = 138412546;
        CFStringRef v124 = @"[Scene-FP]";
        __int16 v125 = 2048;
        id v126 = v60;
        _os_log_impl((void *)&_mh_execute_header, v58, v59, "%@ Processing %lu thumbnail-ready assets ... ", buf, 0x16u);
      }
    }
    v61 = VCPSignPostLog();
    os_signpost_id_t v62 = os_signpost_id_generate(v61);

    v63 = VCPSignPostLog();
    v64 = v63;
    if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v64, OS_SIGNPOST_INTERVAL_BEGIN, v62, "MADPhotosSceneFastPassProcessingTask_ProcessLocal", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    id v118 = 0;
    unsigned __int8 v65 = [(MADPhotosSceneFastPassProcessingTask *)self _processWithLocalIdentifiers:v114 photoLibrary:v113 error:&v118];
    id v66 = v118;
    v67 = v66;
    if (v65)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v68 = VCPLogInstance();
        os_log_type_t v69 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v68, v69))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v124 = @"[Scene-FP]";
          _os_log_impl((void *)&_mh_execute_header, v68, v69, "%@ Processed thumbnail-ready assets", buf, 0xCu);
        }
      }
      v70 = VCPSignPostLog();
      v71 = v70;
      if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v71, OS_SIGNPOST_INTERVAL_END, v62, "MADPhotosSceneFastPassProcessingTask_ProcessLocal", (const char *)&unk_1001F3BD3, buf, 2u);
      }
    }
    else
    {
      if (a3)
      {
        id v72 = [v66 copy];
        id v73 = *a3;
        *a3 = v72;
      }
      if ((int)MediaAnalysisLogLevel() < 3)
      {
LABEL_82:

        if ((v65 & 1) == 0) {
          goto LABEL_120;
        }
LABEL_83:
        if (![v108 count])
        {
LABEL_116:
          v102 = VCPSignPostLog();
          v103 = v102;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v102))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v103, OS_SIGNPOST_INTERVAL_END, spid, "MADPhotosSceneFastPassProcessingTask", (const char *)&unk_1001F3BD3, buf, 2u);
          }

          v104 = [(MADPhotosSceneFastPassProcessingTask *)self completionHandler];
          v104[2](v104, 0, 0);

          BOOL v20 = 1;
LABEL_121:

          id v21 = v108;
          goto LABEL_122;
        }
        v75 = +[VCPWatchdog sharedWatchdog];
        [v75 pet];

        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v76 = VCPLogInstance();
          os_log_type_t v77 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v76, v77))
          {
            id v78 = [v108 count];
            *(_DWORD *)buf = 138412546;
            CFStringRef v124 = @"[Scene-FP]";
            __int16 v125 = 2048;
            id v126 = v78;
            _os_log_impl((void *)&_mh_execute_header, v76, v77, "%@ Waiting for %lu thumbnails to download ... ", buf, 0x16u);
          }
        }
        v79 = VCPSignPostLog();
        os_signpost_id_t v80 = os_signpost_id_generate(v79);

        v81 = VCPSignPostLog();
        v82 = v81;
        if (v80 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v81))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v82, OS_SIGNPOST_INTERVAL_BEGIN, v80, "MADPhotosSceneFastPassProcessingTask_DownloadWait", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        dispatch_group_wait((dispatch_group_t)self->_downloadGroup, 0xFFFFFFFFFFFFFFFFLL);
        v83 = VCPSignPostLog();
        v84 = v83;
        if (v80 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v83))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v84, OS_SIGNPOST_INTERVAL_END, v80, "MADPhotosSceneFastPassProcessingTask_DownloadWait", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v85 = VCPLogInstance();
          os_log_type_t v86 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v85, v86))
          {
            id v87 = [v108 count];
            *(_DWORD *)buf = 138412546;
            CFStringRef v124 = @"[Scene-FP]";
            __int16 v125 = 2048;
            id v126 = v87;
            _os_log_impl((void *)&_mh_execute_header, v85, v86, "%@ Processing %lu thumbnail-downloaded assets ... ", buf, 0x16u);
          }
        }
        v88 = VCPSignPostLog();
        os_signpost_id_t v89 = os_signpost_id_generate(v88);

        v90 = VCPSignPostLog();
        v91 = v90;
        if (v89 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v90))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v91, OS_SIGNPOST_INTERVAL_BEGIN, v89, "MADPhotosSceneFastPassProcessingTask_ProcessDownloaded", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        v92 = +[VCPWatchdog sharedWatchdog];
        [v92 pet];

        id v117 = 0;
        unsigned __int8 v93 = [(MADPhotosSceneFastPassProcessingTask *)self _processWithLocalIdentifiers:v108 photoLibrary:v113 error:&v117];
        id v94 = v117;
        v95 = v94;
        if (v93)
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v96 = VCPLogInstance();
            os_log_type_t v97 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v96, v97))
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v124 = @"[Scene-FP]";
              _os_log_impl((void *)&_mh_execute_header, v96, v97, "%@ Processed thumbnail-downloaded assets", buf, 0xCu);
            }
          }
          v98 = VCPSignPostLog();
          v99 = v98;
          if (v89 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v98))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v99, OS_SIGNPOST_INTERVAL_END, v89, "MADPhotosSceneFastPassProcessingTask_ProcessDownloaded", (const char *)&unk_1001F3BD3, buf, 2u);
          }
        }
        else
        {
          if (a3)
          {
            id v100 = [v94 copy];
            id v101 = *a3;
            *a3 = v100;
          }
          if ((int)MediaAnalysisLogLevel() < 3)
          {
LABEL_115:

            if (v93) {
              goto LABEL_116;
            }
LABEL_120:
            BOOL v20 = 0;
            goto LABEL_121;
          }
          v99 = VCPLogInstance();
          if (os_log_type_enabled(v99, v106))
          {
            *(_DWORD *)buf = 138412546;
            CFStringRef v124 = @"[Scene-FP]";
            __int16 v125 = 2112;
            id v126 = v95;
            _os_log_impl((void *)&_mh_execute_header, v99, v106, "%@ Failed to process thumbnail-downloaded assets - %@ ", buf, 0x16u);
          }
        }

        goto LABEL_115;
      }
      v71 = VCPLogInstance();
      if (os_log_type_enabled(v71, v106))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v124 = @"[Scene-FP]";
        __int16 v125 = 2112;
        id v126 = v67;
        _os_log_impl((void *)&_mh_execute_header, v71, v106, "%@ Failed to process thumbnail-ready assets - %@ ", buf, 0x16u);
      }
    }

    goto LABEL_82;
  }
  NSErrorUserInfoKey v128 = NSLocalizedDescriptionKey;
  v22 = [v113 photoLibraryURL];
  NSErrorUserInfoKey v23 = [v22 path];
  id v24 = +[NSString stringWithFormat:@"%@ Photo Library not ready for analysis (%@)", @"[Scene-FP]", v23];
  v129 = v24;
  v25 = +[NSDictionary dictionaryWithObjects:&v129 forKeys:&v128 count:1];
  id v114 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v25];

  dispatch_group_t v15 = a3;
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v26 = VCPLogInstance();
    os_log_type_t v27 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v26, v27))
    {
      id v28 = [v114 description];
      *(_DWORD *)buf = 138412290;
      CFStringRef v124 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "%@", buf, 0xCu);
    }
    dispatch_group_t v15 = a3;
  }
  if (v15) {
    goto LABEL_17;
  }
LABEL_23:
  BOOL v20 = 0;
LABEL_123:

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadGroup, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

@end