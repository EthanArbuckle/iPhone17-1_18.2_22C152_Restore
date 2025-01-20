@interface MADMomentsDeferredProcessingTask
+ (id)_allProcessingTypes;
+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
- (BOOL)run:(id *)a3;
- (MADMomentsDeferredProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
- (id)_earliestRequestDateFromAssetEntries:(id)a3;
- (void)_cleanupRequestedAssets:(id)a3 fromDatabase:(id)a4 withProcessingType:(unint64_t)a5 photoLibrary:(id)a6 unprocessedAssets:(id *)a7 earliestAssetModificationDate:(id *)a8;
@end

@implementation MADMomentsDeferredProcessingTask

- (MADMomentsDeferredProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v8 = a3;
  v9 = (Block_layout *)a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10004BD58;
  v17[3] = &unk_10021AD08;
  id v10 = a5;
  id v18 = v10;
  v16.receiver = self;
  v16.super_class = (Class)MADMomentsDeferredProcessingTask;
  v11 = [(MADMomentsDeferredProcessingTask *)&v16 initWithCompletionHandler:v17];
  if (v11)
  {
    if (v9) {
      v12 = v9;
    }
    else {
      v12 = &stru_10021AD28;
    }
    v13 = objc_retainBlock(v12);
    id progressHandler = v11->_progressHandler;
    v11->_id progressHandler = v13;

    [(MADMomentsDeferredProcessingTask *)v11 setCancelBlock:v8];
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

+ (id)_allProcessingTypes
{
  v2 = +[NSNumber numberWithUnsignedInteger:MADDeferredProcessingTypeScene];
  v6[0] = v2;
  v3 = +[NSNumber numberWithUnsignedInteger:MADDeferredProcessingTypeQuickFaceIdentification];
  v6[1] = v3;
  v4 = +[NSArray arrayWithObjects:v6 count:2];

  return v4;
}

- (id)_earliestRequestDateFromAssetEntries:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  v4 = 0;
  id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "requestDate", (void)v12);
        [v8 timeIntervalSinceReferenceDate];
        if (v9 != 0.0 && (!v4 || [v4 compare:v8] == (id)1))
        {
          id v10 = v8;

          v4 = v10;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v4;
}

- (void)_cleanupRequestedAssets:(id)a3 fromDatabase:(id)a4 withProcessingType:(unint64_t)a5 photoLibrary:(id)a6 unprocessedAssets:(id *)a7 earliestAssetModificationDate:(id *)a8
{
  id v48 = a3;
  id v55 = a4;
  id v54 = a6;
  id v11 = VCPSignPostLog();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  long long v13 = VCPSignPostLog();
  long long v14 = v13;
  os_signpost_id_t spid = v12;
  unint64_t v45 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "MADMoments_CleanupProcessedAssets", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  id v49 = +[NSMutableArray array];
  v47 = +[PHAsset vcp_fetchOptionsForLibrary:v54 forTaskID:a5];
  long long v15 = VCPSignPostLog();
  os_signpost_id_t v16 = os_signpost_id_generate(v15);

  v17 = VCPSignPostLog();
  id v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "MADMoments_FetchPHAssets", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  v52 = +[PHAsset fetchAssetsWithLocalIdentifiers:v48 options:v47];
  v19 = VCPSignPostLog();
  v20 = v19;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, v16, "MADMoments_FetchPHAssets", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  id v50 = [objc_alloc((Class)NSMutableSet) initWithArray:v48];
  id v21 = 0;
  unint64_t v22 = 0;
  uint64_t v23 = MADDeferredProcessingTypeScene;
  uint64_t v24 = MADDeferredProcessingTypeQuickFaceIdentification;
  while (1)
  {
    id v53 = v21;
    if (v22 >= (unint64_t)objc_msgSend(v52, "count", spid)) {
      break;
    }
    v26 = [v52 objectAtIndexedSubscript:v22];
    v27 = [v26 localIdentifier];
    [v50 removeObject:v27];

    if (a8)
    {
      v28 = [v26 adjustmentTimestamp];
      if (v28) {
        [v26 adjustmentTimestamp];
      }
      else {
      v29 = [v26 creationDate];
      }

      if (v29)
      {
        v30 = v53;
        if (!v53 || (v30 = v53, [v53 compare:v29] == (id)1))
        {
          id v31 = v29;

          id v53 = v31;
        }
      }
    }
    if (v23 == a5 && !objc_msgSend(v26, "vcp_needSceneProcessing")
      || v24 == a5 && objc_msgSend(v26, "vcp_quickFaceClassificationDone"))
    {
      v32 = [v26 localIdentifier];
      [v55 removeMomentsScheduledAssetWithLocalIdentifier:v32 andTaskID:a5];
    }
    else
    {
      v32 = [v26 localIdentifier];
      [v49 addObject:v32];
    }

    id v21 = v53;
    ++v22;
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v33 = v50;
  id v34 = [v33 countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v57;
    os_log_type_t v36 = VCPLogToOSLogType[4];
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v57 != v35) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v40 = VCPLogInstance();
          if (os_log_type_enabled(v40, v36))
          {
            v41 = [v54 photoLibraryURL];
            *(_DWORD *)buf = 138412546;
            uint64_t v61 = v38;
            __int16 v62 = 2112;
            v63 = v41;
            _os_log_impl((void *)&_mh_execute_header, v40, v36, "[Moments] Invalid local identifier %@ in Photo Library %@", buf, 0x16u);
          }
        }
        [v55 removeMomentsScheduledAssetWithLocalIdentifier:v38 andTaskID:a5];
      }
      id v34 = [v33 countByEnumeratingWithState:&v56 objects:v64 count:16];
    }
    while (v34);
  }

  [v55 commit];
  if (a7) {
    *a7 = v49;
  }
  if (a8) {
    *a8 = v53;
  }
  v42 = VCPSignPostLog();
  v43 = v42;
  if (v45 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, spid, "MADMoments_CleanupProcessedAssets", (const char *)&unk_1001F3BD3, buf, 2u);
  }
}

- (BOOL)run:(id *)a3
{
  id v3 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
  v4 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v3];

  v68 = v4;
  unsigned int v66 = [v4 keyExistsInKeyValueStore:@"PFSkipChecksumTimestamp"];
  if (v66)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v5 = VCPLogInstance();
      os_log_type_t v6 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v5, v6))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "[Moments] Detected previous crash after skipping checksum for PFCachingArchiveIndex, restoring checksum", buf, 2u);
      }
    }
    PFCachingArchiveIndexSetSkipChecksumValidation();
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v7, v8))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "[Moments] Skip checksum for PFCachingArchiveIndex ... ", buf, 2u);
      }
    }
    PFCachingArchiveIndexSetSkipChecksumValidation();
    double v9 = +[NSDate now];
    [v9 timeIntervalSinceReferenceDate];
    [v68 setValue:(uint64_t)v10 forKey:@"PFSkipChecksumTimestamp"];

    [v68 commit];
  }
  id v11 = +[VCPPhotoLibraryManager sharedManager];
  v67 = [v11 allPhotoLibraries];

  v73 = [(id)objc_opt_class() _allProcessingTypes];
  id v12 = [v67 count];
  id v13 = [v73 count];
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id obj = v67;
  id v14 = [obj countByEnumeratingWithState:&v110 objects:v124 count:16];
  if (!v14) {
    goto LABEL_77;
  }
  uint64_t v92 = 0;
  uint64_t v79 = (void)v13 * (void)v12;
  uint64_t v72 = *(void *)v111;
  id v78 = (id)MADDeferredProcessingTypeScene;
  id v77 = (id)MADDeferredProcessingTypeQuickFaceIdentification;
  os_log_type_t v76 = VCPLogToOSLogType[3];
  os_log_type_t type = VCPLogToOSLogType[6];
  do
  {
    v75 = 0;
    id v71 = v14;
    do
    {
      if (*(void *)v111 != v72) {
        objc_enumerationMutation(obj);
      }
      v90 = *(void **)(*((void *)&v110 + 1) + 8 * (void)v75);
      v88 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v90];
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      id v81 = v73;
      id v15 = [v81 countByEnumeratingWithState:&v106 objects:v123 count:16];
      if (v15)
      {
        uint64_t v84 = *(void *)v107;
LABEL_19:
        id v83 = v15;
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v107 != v84) {
            objc_enumerationMutation(v81);
          }
          v17 = *(void **)(*((void *)&v106 + 1) + 8 * v16);
          id v18 = +[NSDate now];
          [v18 timeIntervalSince1970];
          double v20 = v19;

          id v21 = [v17 unsignedIntegerValue];
          v89 = VCPTaskIDDescription((uint64_t)v21);
          id v105 = 0;
          [v88 fetchMomentsScheduledAssetEntries:&v105 forTaskID:v21];
          id v94 = v105;
          unint64_t v22 = [v94 count];
          ++v92;
          if (v22) {
            break;
          }
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v39 = VCPLogInstance();
            if (os_log_type_enabled(v39, type))
            {
              v40 = [v90 photoLibraryURL];
              *(_DWORD *)buf = 138412546;
              *(void *)v119 = v89;
              *(_WORD *)&v119[8] = 2112;
              *(void *)&v119[10] = v40;
              _os_log_impl((void *)&_mh_execute_header, v39, type, "[Moments] No assets scheduled for %@ in Photo Library %@", buf, 0x16u);
            }
LABEL_57:
          }
          if ((id)++v16 == v83)
          {
            id v15 = [v81 countByEnumeratingWithState:&v106 objects:v123 count:16];
            if (v15) {
              goto LABEL_19;
            }
            goto LABEL_60;
          }
        }
        uint64_t v23 = [(MADMomentsDeferredProcessingTask *)self _earliestRequestDateFromAssetEntries:v94];
        uint64_t v24 = +[NSMutableArray array];
        v87 = v23;
        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        id v25 = v94;
        id v26 = [v25 countByEnumeratingWithState:&v101 objects:v122 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v102;
          do
          {
            for (i = 0; i != v26; i = (char *)i + 1)
            {
              if (*(void *)v102 != v27) {
                objc_enumerationMutation(v25);
              }
              v29 = [*(id *)(*((void *)&v101 + 1) + 8 * i) localIdentifier];
              [v24 addObject:v29];
            }
            id v26 = [v25 countByEnumeratingWithState:&v101 objects:v122 count:16];
          }
          while (v26);
        }

        id v99 = 0;
        id v100 = 0;
        [(MADMomentsDeferredProcessingTask *)self _cleanupRequestedAssets:v24 fromDatabase:v88 withProcessingType:v21 photoLibrary:v90 unprocessedAssets:&v100 earliestAssetModificationDate:&v99];
        id v30 = v100;
        id v31 = v99;
        if ([v30 count])
        {
          [v30 count];
          v85 = v31;
          v98[0] = _NSConcreteStackBlock;
          v98[1] = 3221225472;
          v98[2] = sub_10004D87C;
          v98[3] = &unk_10021AD50;
          v98[4] = self;
          v98[5] = v92;
          v98[6] = v79;
          v86 = objc_retainBlock(v98);
          v32 = VCPSignPostLog();
          os_signpost_id_t v33 = os_signpost_id_generate(v32);

          id v34 = VCPSignPostLog();
          uint64_t v35 = v34;
          if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "MADMoments_ProcessAssets", (const char *)&unk_1001F3BD3, buf, 2u);
          }

          if (v21 == v78)
          {
            os_log_type_t v36 = [VCPMADSceneAssetProcessingTask alloc];
            v37 = [v90 photoLibraryURL];
            v97[0] = _NSConcreteStackBlock;
            v97[1] = 3221225472;
            v97[2] = sub_10004D8BC;
            v97[3] = &unk_100219D98;
            v97[4] = self;
            uint64_t v38 = [(VCPMADSceneAssetProcessingTask *)v36 initWithLocalIdentifiers:v30 fromPhotoLibraryWithURL:v37 cancelBlock:v97 progressHandler:v86 completionHandler:&stru_10021AD90];

            signed int v82 = [(VCPMADSceneAssetProcessingTask *)v38 run];
          }
          else
          {
            if (v21 != v77)
            {
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                long long v59 = VCPLogInstance();
                if (os_log_type_enabled(v59, v76))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v119 = v21;
                  _os_log_impl((void *)&_mh_execute_header, v59, v76, "[Moments] Unexpected processing type: %u", buf, 8u);
                }
              }
              NSErrorUserInfoKey v120 = NSLocalizedDescriptionKey;
              id v48 = +[NSString stringWithFormat:@"[Moments] Unexpected processing type: %u", v21];
              id v121 = v48;
              id v53 = +[NSDictionary dictionaryWithObjects:&v121 forKeys:&v120 count:1];
              v60 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v53];
              id v54 = *a3;
              *a3 = v60;
              goto LABEL_72;
            }
            v43 = [VCPMADQuickFaceIDAssetProcessingTask alloc];
            v44 = [v90 photoLibraryURL];
            v96[0] = _NSConcreteStackBlock;
            v96[1] = 3221225472;
            v96[2] = sub_10004D8C8;
            v96[3] = &unk_100219D98;
            v96[4] = self;
            uint64_t v38 = [(VCPMADQuickFaceIDAssetProcessingTask *)v43 initWithLocalIdentifiers:v30 fromPhotoLibraryWithURL:v44 cancelBlock:v96 progressHandler:v86 completionHandler:&stru_10021ADB0];

            signed int v82 = [(VCPMADSceneAssetProcessingTask *)v38 run];
          }

          unint64_t v45 = VCPSignPostLog();
          v46 = v45;
          if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_INTERVAL_END, v33, "MADMoments_ProcessAssets", (const char *)&unk_1001F3BD3, buf, 2u);
          }

          id v95 = 0;
          v47 = v30;
          [(MADMomentsDeferredProcessingTask *)self _cleanupRequestedAssets:v30 fromDatabase:v88 withProcessingType:v21 photoLibrary:v90 unprocessedAssets:&v95 earliestAssetModificationDate:0];
          id v48 = v95;
          if ([v48 count] && (int)MediaAnalysisLogLevel() >= 3)
          {
            id v49 = VCPLogInstance();
            if (os_log_type_enabled(v49, v76))
            {
              unsigned int v50 = [v48 count];
              v51 = [v90 photoLibraryURL];
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)v119 = v50;
              *(_WORD *)&v119[4] = 2112;
              *(void *)&v119[6] = v89;
              *(_WORD *)&v119[14] = 2112;
              *(void *)&v119[16] = v51;
              _os_log_impl((void *)&_mh_execute_header, v49, v76, "[Moments] Failed to process %u assets for %@ in Photo Library %@", buf, 0x1Cu);
            }
          }
          [v47 count];
          MADPLLogMomentsDeferredProcessing();
          VCPCoreAnalyticsReportEventMomentsDeferredProcessing((uint64_t)v22, (unsigned char *)[v47 count] - (unsigned char *)objc_msgSend(v48, "count"), v22 - (unsigned char *)objc_msgSend(v47, "count"), (uint64_t)objc_msgSend(v48, "count"), v87, v85, (uint64_t)v21, v90, v20);
          if (v82)
          {
            id v30 = v47;
            if (v82 == -128)
            {
              if (a3)
              {
                NSErrorUserInfoKey v116 = NSLocalizedDescriptionKey;
                id v53 = +[NSString stringWithFormat:@"[Moments] Deferred processing %@ cancelled", v89];
                v117 = v53;
                id v54 = +[NSDictionary dictionaryWithObjects:&v117 forKeys:&v116 count:1];
                id v55 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v54];
                long long v56 = *a3;
                *a3 = v55;
                goto LABEL_66;
              }
LABEL_73:

              int v52 = 0;
              goto LABEL_74;
            }
            if (!a3) {
              goto LABEL_73;
            }
            NSErrorUserInfoKey v114 = NSLocalizedDescriptionKey;
            uint64_t v91 = [v90 photoLibraryURL];
            id v54 = +[NSString stringWithFormat:@"[Moments] Deferred processing %@ failed for assets in Photo Library %@", v89, v91];
            v115 = v54;
            long long v56 = +[NSDictionary dictionaryWithObjects:&v115 forKeys:&v114 count:1];
            id v53 = (void *)v91;
            long long v57 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v82 userInfo:v56];
            id v58 = *a3;
            *a3 = v57;

LABEL_66:
LABEL_72:

            goto LABEL_73;
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v41 = VCPLogInstance();
            if (os_log_type_enabled(v41, type))
            {
              v42 = [v90 photoLibraryURL];
              *(_DWORD *)buf = 138412546;
              *(void *)v119 = v89;
              *(_WORD *)&v119[8] = 2112;
              *(void *)&v119[10] = v42;
              _os_log_impl((void *)&_mh_execute_header, v41, type, "[Moments] All assets scheduled for %@ in Photo Library %@ have already been processed", buf, 0x16u);
            }
          }
          MADPLLogMomentsDeferredProcessing();
          VCPCoreAnalyticsReportEventMomentsDeferredProcessing((uint64_t)v22, 0, (uint64_t)v22, 0, v87, v31, (uint64_t)v21, v90, v20);
        }
        v39 = v87;
        goto LABEL_57;
      }
LABEL_60:

      MediaAnalysisDaemonReleaseSharedDataStores(v90);
      int v52 = 1;
LABEL_74:

      if (!v52)
      {

        BOOL v64 = 0;
        goto LABEL_85;
      }
      v75 = (char *)v75 + 1;
    }
    while (v75 != v71);
    id v14 = [obj countByEnumeratingWithState:&v110 objects:v124 count:16];
  }
  while (v14);
LABEL_77:

  uint64_t v61 = [(MADMomentsDeferredProcessingTask *)self completionHandler];
  v61[2](v61, 0, 0);

  if ((v66 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      __int16 v62 = VCPLogInstance();
      os_log_type_t v63 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v62, v63))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v62, v63, "[Moments] Restore checksum for PFCachingArchiveIndex ... ", buf, 2u);
      }
    }
    PFCachingArchiveIndexSetSkipChecksumValidation();
    [v68 removeKey:@"PFSkipChecksumTimestamp"];
    [v68 commit];
  }
  BOOL v64 = 1;
LABEL_85:

  return v64;
}

- (void).cxx_destruct
{
}

@end