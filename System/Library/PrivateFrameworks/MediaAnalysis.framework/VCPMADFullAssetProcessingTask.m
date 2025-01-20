@interface VCPMADFullAssetProcessingTask
+ (id)taskWithPhotoLibrary:(id)a3 localIdentifiers:(id)a4;
- (BOOL)shouldSkipAnalysisForAsset:(id)a3 withResources:(id)a4 logPrefix:(id)a5;
- (VCPMADFullAssetProcessingTask)initWithPhotoLibrary:(id)a3 localIdentifiers:(id)a4;
- (int)mainInternal;
- (int)processAsset:(id)a3;
- (int)processAssetsWithProgressReporter:(id)a3;
- (int)processPendingBatch;
- (void)resetPendingBatch;
@end

@implementation VCPMADFullAssetProcessingTask

- (VCPMADFullAssetProcessingTask)initWithPhotoLibrary:(id)a3 localIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(VCPTask *)self initWithPhotoLibrary:v6];
  v9 = v8;
  if (!v8) {
    goto LABEL_3;
  }
  objc_storeStrong((id *)&v8->_localIdentifiers, a4);
  uint64_t v10 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v6];
  database = v9->_database;
  v9->_database = (VCPDatabaseWriter *)v10;

  uint64_t v12 = +[VCPPhotosAssetChangeManager managerForPhotoLibrary:v6];
  changeManager = v9->_changeManager;
  v9->_changeManager = (VCPPhotosAssetChangeManager *)v12;

  if (!v9->_changeManager)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v15 = VCPLogInstance();
      os_log_type_t v16 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v15, v16))
      {
        v18[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Failed to create VCPPhotosAssetChangeManager", (uint8_t *)v18, 2u);
      }
    }
    v14 = 0;
  }
  else
  {
LABEL_3:
    v14 = v9;
  }

  return v14;
}

+ (id)taskWithPhotoLibrary:(id)a3 localIdentifiers:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v6 localIdentifiers:v5];

  return v7;
}

- (void)resetPendingBatch
{
  v3 = [(VCPTask *)self photoLibrary];
  v4 = +[VCPBatchAnalysisTask taskWithPhotoLibrary:v3];
  pendingBatch = self->_pendingBatch;
  self->_pendingBatch = v4;

  [(VCPBatchAnalysisTask *)self->_pendingBatch setPhotosChangeManager:self->_changeManager];
  id v6 = [(VCPTask *)self cancel];
  [(VCPTask *)self->_pendingBatch setCancel:v6];
}

- (int)processPendingBatch
{
  [(VCPBatchAnalysisTask *)self->_pendingBatch start];
  int v3 = [(VCPTask *)self->_pendingBatch error];
  if (!v3) {
    [(VCPMADFullAssetProcessingTask *)self resetPendingBatch];
  }
  return v3;
}

- (BOOL)shouldSkipAnalysisForAsset:(id)a3 withResources:(id)a4 logPrefix:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_networkAvailable)
  {
    if (objc_msgSend(v8, "vcp_isLivePhoto")
      && (objc_msgSend(v9, "vcp_hasLocalPhoto:", objc_msgSend(v8, "hasAdjustments")) & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v11 = VCPLogInstance();
        os_log_type_t v12 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v11, v12))
        {
          int v20 = 138412290;
          id v21 = v10;
          v13 = "%@ Live Photo has no local image; skipping";
          goto LABEL_20;
        }
        goto LABEL_27;
      }
      goto LABEL_21;
    }
    if (objc_msgSend(v8, "vcp_isVideoSlowmo"))
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v11 = VCPLogInstance();
        os_log_type_t v12 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v11, v12))
        {
          int v20 = 138412290;
          id v21 = v10;
          v13 = "%@ Slowmo not supported for streaming analysis; skipping";
LABEL_20:
          _os_log_impl((void *)&_mh_execute_header, v11, v12, v13, (uint8_t *)&v20, 0xCu);
          goto LABEL_27;
        }
        goto LABEL_27;
      }
      goto LABEL_21;
    }
    v11 = objc_msgSend(v9, "vcp_smallMovieDerivativeResource");
    if (v11)
    {
      if ([v8 isVideo])
      {
        id v14 = [v11 fileSize];
        if (v14 > +[VCPDownloadManager maxSizeBytes])
        {
          if ((int)MediaAnalysisLogLevel() < 7) {
            goto LABEL_27;
          }
          v15 = VCPLogInstance();
          os_log_type_t v16 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v15, v16))
          {
            int v20 = 138412290;
            id v21 = v10;
            v17 = "%@ File size exceeds streaming threshold; skipping";
LABEL_25:
            _os_log_impl((void *)&_mh_execute_header, v15, v16, v17, (uint8_t *)&v20, 0xCu);
            goto LABEL_26;
          }
          goto LABEL_26;
        }
        if (!v14 && objc_msgSend(v8, "vcp_isLongMovie"))
        {
          if ((int)MediaAnalysisLogLevel() < 7) {
            goto LABEL_27;
          }
          v15 = VCPLogInstance();
          os_log_type_t v16 = VCPLogToOSLogType[7];
          if (!os_log_type_enabled(v15, v16)) {
            goto LABEL_26;
          }
          int v20 = 138412290;
          id v21 = v10;
          v17 = "%@ Duration exceeds streaming threshold; skipping";
          goto LABEL_25;
        }
      }
      BOOL v18 = 0;
      goto LABEL_28;
    }
    if ((int)MediaAnalysisLogLevel() < 4) {
      goto LABEL_27;
    }
    v15 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v15, v16))
    {
      int v20 = 138412290;
      id v21 = v10;
      v17 = "%@ Asset has no small video derivative; skipping";
      goto LABEL_25;
    }
LABEL_26:

    goto LABEL_27;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v11 = VCPLogInstance();
    os_log_type_t v12 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v11, v12))
    {
      int v20 = 138412290;
      id v21 = v10;
      v13 = "%@ Network unavailable; skipping";
      goto LABEL_20;
    }
LABEL_27:
    BOOL v18 = 1;
LABEL_28:

    goto LABEL_29;
  }
LABEL_21:
  BOOL v18 = 1;
LABEL_29:

  return v18;
}

- (int)processAsset:(id)a3
{
  id v4 = a3;
  id v5 = [v4 localIdentifier];
  id v6 = +[NSString stringWithFormat:@"[VCPMADFullAssetProcessingTask][%@]", v5];

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v7, v8))
    {
      id v9 = objc_msgSend(v4, "vcp_typeDescription");
      *(_DWORD *)buf = 138412546;
      v57 = v6;
      __int16 v58 = 2112;
      v59 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "%@ Evaluating %@ asset", buf, 0x16u);
    }
  }
  if (objc_msgSend(v4, "vcp_eligibleForFullAnalysis")
    && ![(VCPBatchAnalysisTask *)self->_pendingBatch containsAsset:v4])
  {
    database = self->_database;
    os_log_type_t v12 = [v4 localIdentifier];
    id v55 = 0;
    [(VCPDatabaseWriter *)database analysisForAsset:v12 analysis:&v55];
    id v13 = v55;

    id v14 = MediaAnalysisStripOutdatedAnalysis(v4, v13);

    unint64_t v15 = (unint64_t)objc_msgSend(v4, "vcp_fullAnalysisTypes") & 0xFFFFFFFFDFEFFFFFLL;
    unint64_t v16 = v15 & ~(unint64_t)objc_msgSend(v14, "vcp_types");
    if (!v16)
    {
      int v10 = 0;
LABEL_47:

      goto LABEL_48;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v17 = VCPLogInstance();
      os_log_type_t v18 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v17, v18))
      {
        v19 = MediaAnalysisTypeDescription((uint64_t)objc_msgSend(v14, "vcp_types"));
        *(_DWORD *)buf = 138412546;
        v57 = v6;
        __int16 v58 = 2112;
        v59 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "%@ existing analyses from MA DB %@", buf, 0x16u);
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      int v20 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v20, v21))
      {
        v22 = MediaAnalysisTypeDescription(v16);
        *(_DWORD *)buf = 138412546;
        v57 = v6;
        __int16 v58 = 2112;
        v59 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "%@ missing analyses from MA DB %@", buf, 0x16u);
      }
    }
    v23 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v4];
    unint64_t v24 = (unint64_t)objc_msgSend(v4, "vcp_fullAnalysisTypesForResources:", v23);
    if ((v24 & v16) == v16)
    {
      unint64_t v52 = v24 & ~objc_msgSend(v14, "vcp_types") & 0x100000 | v16;
    }
    else
    {
      unint64_t v52 = v16;
      if ([(VCPMADFullAssetProcessingTask *)self shouldSkipAnalysisForAsset:v4 withResources:v23 logPrefix:v6])
      {
        int v10 = 0;
LABEL_46:

        goto LABEL_47;
      }
    }
    unint64_t v47 = v24;
    *(void *)type = v15;
    unint64_t v50 = v24 & v16;
    unint64_t v54 = v16;
    v25 = VCPSignPostLog();
    os_signpost_id_t v26 = os_signpost_id_generate(v25);

    v27 = VCPSignPostLog();
    v28 = v27;
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "VCPMADFullAssetProcessingTask_UnpackComputeSync", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    v29 = objc_msgSend(v23, "mad_computeSyncResource");
    v30 = [(VCPTask *)self cancel];
    v51 = v29;
    v31 = objc_msgSend(v29, "mad_existingAnalysisFromComputeSyncForAsset:allowDownload:cancel:", v4, 0, v30);

    v32 = VCPSignPostLog();
    v33 = v32;
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, v26, "VCPMADFullAssetProcessingTask_UnpackComputeSync", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if (v31)
    {
      v34 = MediaAnalysisStripOutdatedAnalysis(v4, v31);

      unint64_t v35 = *(void *)type & ~(unint64_t)objc_msgSend(v34, "vcp_types");
      unint64_t v36 = v16;
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v37 = VCPLogInstance();
        os_log_type_t typea = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v37, typea))
        {
          v38 = MediaAnalysisTypeShortDescription((uint64_t)objc_msgSend(v34, "vcp_types"));
          MediaAnalysisTypeShortDescription(v35);
          v39 = unint64_t v53 = v35;
          *(_DWORD *)buf = 138412802;
          v57 = v6;
          __int16 v58 = 2112;
          v59 = v38;
          __int16 v60 = 2112;
          v61 = v39;
          _os_log_impl((void *)&_mh_execute_header, v37, typea, "%@ Reusing analysis results from compute sync (existing: %@, missing: %@)", buf, 0x20u);

          unint64_t v35 = v53;
        }

        unint64_t v36 = v54;
      }
      if ((v35 & ~v47) != 0)
      {
        if ([(VCPMADFullAssetProcessingTask *)self shouldSkipAnalysisForAsset:v4 withResources:v23 logPrefix:v6])
        {
          goto LABEL_44;
        }
      }
      else
      {
        v35 |= v47 & ~objc_msgSend(v34, "vcp_types") & 0x100000;
      }
    }
    else
    {
      v34 = v14;
      unint64_t v35 = v52;
      unint64_t v36 = v16;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v40 = v31;
      unint64_t v41 = v35;
      v42 = VCPLogInstance();
      os_log_type_t v43 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v42, v43))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v6;
        _os_log_impl((void *)&_mh_execute_header, v42, v43, "%@ Queuing asset for analysis", buf, 0xCu);
      }

      unint64_t v35 = v41;
      v31 = v40;
      unint64_t v36 = v54;
    }
    [(VCPBatchAnalysisTask *)self->_pendingBatch addAnalysis:v35 withExistingAnalysis:v34 forAsset:v4 allowStreaming:v50 != v36];
    [(VCPBatchAnalysisTask *)self->_pendingBatch cost];
    if (v44 >= 100.0)
    {
      unsigned int v45 = [(VCPMADFullAssetProcessingTask *)self processPendingBatch];
      if (v45)
      {
        int v10 = v45;
LABEL_45:

        id v14 = v34;
        goto LABEL_46;
      }
    }
LABEL_44:
    int v10 = 0;
    goto LABEL_45;
  }
  int v10 = 0;
LABEL_48:

  return v10;
}

- (int)processAssetsWithProgressReporter:(id)a3
{
  id v4 = a3;
  id v5 = [(VCPTask *)self photoLibrary];
  id v6 = +[PHAsset vcp_fetchOptionsForLibrary:v5 forTaskID:1];

  id v7 = +[PHAsset fetchAssetsWithLocalIdentifiers:self->_localIdentifiers options:v6];
  if ([v7 count])
  {
    uint64_t v8 = 0;
    while (1)
    {
      if ([(VCPTask *)self isCancelled]) {
        break;
      }
      int v10 = +[VCPWatchdog sharedWatchdog];
      [v10 pet];

      v11 = [v7 objectAtIndexedSubscript:v8];
      int v12 = [(VCPMADFullAssetProcessingTask *)self processAsset:v11];

      if (v12) {
        goto LABEL_10;
      }
      [v4 increaseProcessedJobCountByOne];
      if (++v8 >= (unint64_t)[v7 count]) {
        goto LABEL_6;
      }
    }
    int v12 = -128;
LABEL_10:
  }
  else
  {
LABEL_6:
    [(VCPBatchAnalysisTask *)self->_pendingBatch cost];
    if (v13 == 0.0 || (int v12 = [(VCPMADFullAssetProcessingTask *)self processPendingBatch]) == 0)
    {
      id v14 = +[VNSession globalSession];
      [v14 releaseCachedResources];

      int v12 = 0;
    }
  }

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
      NSUInteger v5 = [(NSArray *)self->_localIdentifiers count];
      int v28 = 138412546;
      CFStringRef v29 = @"[VCPMADFullAssetProcessingTask]";
      __int16 v30 = 2048;
      NSUInteger v31 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "%@ Processing %lu assets for full analysis ...", (uint8_t *)&v28, 0x16u);
    }
  }
  id v6 = [(VCPTask *)self photoLibrary];
  unsigned int v7 = [v6 isCloudPhotoLibraryEnabled];

  if (v7)
  {
    uint64_t v8 = +[VCPInternetReachability sharedInstance];
    self->_networkAvailable = [v8 hasWifiOrEthernetConnection];

    if (self->_networkAvailable)
    {
      id v9 = [(VCPTask *)self cancel];
      int v10 = +[VCPDownloadManager sharedManager];
      [v10 setCancel:v9];

LABEL_8:
      goto LABEL_9;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v9 = VCPLogInstance();
      os_log_type_t v27 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v9, v27))
      {
        int v28 = 138412290;
        CFStringRef v29 = @"[VCPMADFullAssetProcessingTask]";
        _os_log_impl((void *)&_mh_execute_header, v9, v27, "%@ Wifi/Ethernet connection unavailable; disabling streaming analysis",
          (uint8_t *)&v28,
          0xCu);
      }
      goto LABEL_8;
    }
  }
LABEL_9:
  [(VCPMADFullAssetProcessingTask *)self resetPendingBatch];
  v11 = [(VCPTask *)self progressHandler];

  if (v11)
  {
    NSUInteger v12 = [(NSArray *)self->_localIdentifiers count];
    double v13 = [(VCPTask *)self progressHandler];
    v11 = +[VCPProgressReporter reporterWithIntervalSeconds:10 andTotalJobCount:v12 andBlock:v13];
  }
  id v14 = VCPSignPostLog();
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  unint64_t v16 = VCPSignPostLog();
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v28) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "VCPMADFullAssetProcessingTask_Process", (const char *)&unk_1001F3BD3, (uint8_t *)&v28, 2u);
  }

  unsigned int v18 = [(VCPMADFullAssetProcessingTask *)self processAssetsWithProgressReporter:v11];
  if (!v18)
  {
    v19 = VCPSignPostLog();
    int v20 = v19;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      LOWORD(v28) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, v15, "VCPMADFullAssetProcessingTask_Process", (const char *)&unk_1001F3BD3, (uint8_t *)&v28, 2u);
    }
  }
  os_log_type_t v21 = +[VCPDownloadManager sharedManager];
  [v21 flush];

  if ([(VCPPhotosAssetChangeManager *)self->_changeManager publishPendingChanges]
    && (int)MediaAnalysisLogLevel() >= 4)
  {
    v22 = VCPLogInstance();
    os_log_type_t v23 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v22, v23))
    {
      int v28 = 138412290;
      CFStringRef v29 = @"[VCPMADFullAssetProcessingTask]";
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "%@ Failed to publish PHAssetPropertySetMediaAnalysis changes", (uint8_t *)&v28, 0xCu);
    }
  }
  unsigned int v24 = [(VCPDatabaseWriter *)self->_database commit];
  int v25 = v24;
  if (v24 != -108 && v24 != -36 && v24 != -23) {
    int v25 = v18;
  }

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localIdentifiers, 0);
  objc_storeStrong((id *)&self->_pendingBatch, 0);
  objc_storeStrong((id *)&self->_changeManager, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end