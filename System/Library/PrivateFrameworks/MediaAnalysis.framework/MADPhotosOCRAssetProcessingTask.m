@interface MADPhotosOCRAssetProcessingTask
+ (id)taskWithAnalysisDatabase:(id)a3;
- (MADPhotosOCRAssetProcessingTask)initWithAnalysisDatabase:(id)a3;
- (double)downloadInactiveTimeInterval;
- (id)acceptableResourcesForAsset:(id)a3 withResources:(id)a4;
- (id)assetLocalIdentifiers;
- (id)localResourceForAsset:(id)a3 withAcceptableResources:(id)a4;
- (id)remoteResourceForAsset:(id)a3 withAcceptableResources:(id)a4;
- (int)_prepare;
- (int)_process;
- (int)_publish;
- (int)removeDownloadRequestIDForAsset:(id)a3;
- (int)status;
- (unint64_t)count;
- (void)addDownloadRequestID:(int)a3 forAsset:(id)a4;
- (void)addPhotosAsset:(id)a3 priority:(unint64_t)a4 previousStatus:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7;
- (void)cancelRemainingDownloadsWithStatus:(int)a3;
- (void)dealloc;
- (void)download;
- (void)prepare;
- (void)process;
- (void)processAssetEntry:(id)a3 resource:(id)a4 resourceURL:(id)a5;
- (void)publish;
@end

@implementation MADPhotosOCRAssetProcessingTask

- (MADPhotosOCRAssetProcessingTask)initWithAnalysisDatabase:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MADPhotosOCRAssetProcessingTask;
  v6 = [(MADProcessingTask *)&v20 init];
  if (v6)
  {
    uint64_t v7 = +[NSMutableArray array];
    assetEntries = v6->_assetEntries;
    v6->_assetEntries = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_analysisDatabase, a3);
    v6->_shouldSkipPhotosPersist = 0;
    dispatch_group_t v9 = dispatch_group_create();
    downloadGroup = v6->_downloadGroup;
    v6->_downloadGroup = (OS_dispatch_group *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.mediaanalysisd.ocr.download", 0);
    downloadStateQueue = v6->_downloadStateQueue;
    v6->_downloadStateQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = +[NSMutableDictionary dictionary];
    downloadRequestIDs = v6->_downloadRequestIDs;
    v6->_downloadRequestIDs = (NSMutableDictionary *)v13;

    dispatch_group_t v15 = dispatch_group_create();
    computeGroup = v6->_computeGroup;
    v6->_computeGroup = (OS_dispatch_group *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.mediaanalysisd.ocr.compute", 0);
    computeQueue = v6->_computeQueue;
    v6->_computeQueue = (OS_dispatch_queue *)v17;
  }
  return v6;
}

+ (id)taskWithAnalysisDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithAnalysisDatabase:v4];

  return v5;
}

- (void)dealloc
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_assetEntries;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v8 = [v7 downloadURL];
        BOOL v9 = v8 == 0;

        if (!v9)
        {
          v10 = [v7 downloadURL];
          +[PHAssetResourceManager vcp_flushResourceURL:v10];
        }
      }
      id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  v11.receiver = self;
  v11.super_class = (Class)MADPhotosOCRAssetProcessingTask;
  [(MADPhotosOCRAssetProcessingTask *)&v11 dealloc];
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_assetEntries count];
}

- (id)assetLocalIdentifiers
{
  v3 = +[NSMutableSet set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_assetEntries;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v8, "asset", (void)v13);
        objc_super v11 = [v10 localIdentifier];
        [v3 addObject:v11];
      }
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v3;
}

- (int)status
{
  return self->_status;
}

- (void)addPhotosAsset:(id)a3 priority:(unint64_t)a4 previousStatus:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7
{
  id v12 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MADPhotosOCRAssetProcessingTask;
  unint64_t v26 = a5;
  unint64_t v27 = a6;
  id v28 = a7;
  -[MADPhotosAssetProcessingTask addPhotosAsset:priority:previousStatus:attempts:lastAttemptDate:](&v33, "addPhotosAsset:priority:previousStatus:attempts:lastAttemptDate:", v12, a4, a5, a6);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v25 = 56;
  long long v13 = self->_assetEntries;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v30;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v13);
        }
        dispatch_queue_t v17 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "asset", v25);
        v18 = [v17 localIdentifier];
        v19 = [v12 localIdentifier];
        unsigned int v20 = [v18 isEqualToString:v19];

        if (v20)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v22 = VCPLogInstance();
            os_log_type_t v23 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v22, v23))
            {
              v24 = [v12 localIdentifier];
              *(_DWORD *)buf = 138412290;
              v35 = v24;
              _os_log_impl((void *)&_mh_execute_header, v22, v23, "[OCR][%@] Batch already contains asset; ignoring",
                buf,
                0xCu);
            }
          }
          goto LABEL_14;
        }
      }
      id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v29 objects:v36 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  v21 = *(Class *)((char *)&self->super.super.super.super.super.isa + v25);
  long long v13 = +[MADOCRAssetEntry entryWithAsset:v12 previousStatus:v26 previousAttempts:v27 andLastAttemptDate:v28];
  [v21 addObject:v13];
LABEL_14:
}

- (void)addDownloadRequestID:(int)a3 forAsset:(id)a4
{
  id v6 = a4;
  downloadStateQueue = self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007F148;
  block[3] = &unk_10021BFF8;
  block[4] = self;
  id v10 = v6;
  int v11 = a3;
  id v8 = v6;
  dispatch_sync(downloadStateQueue, block);
}

- (int)removeDownloadRequestIDForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  downloadStateQueue = self->_downloadStateQueue;
  int v14 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007F2E0;
  block[3] = &unk_10021C020;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(downloadStateQueue, block);
  LODWORD(downloadStateQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)downloadStateQueue;
}

- (double)downloadInactiveTimeInterval
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  downloadStateQueue = self->_downloadStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007F4F0;
  v5[3] = &unk_100219F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(downloadStateQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)cancelRemainingDownloadsWithStatus:(int)a3
{
  downloadStateQueue = self->_downloadStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007F610;
  v5[3] = &unk_10021C048;
  v5[4] = self;
  int v6 = a3;
  dispatch_sync(downloadStateQueue, v5);
  dispatch_group_wait((dispatch_group_t)self->_downloadGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)download
{
  id v74 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v74 start];
  double v3 = +[MADStateHandler sharedStateHandler];
  objc_msgSend(v3, "addBreadcrumb:", @"[OCR] Downloading %d assets", -[NSMutableArray count](self->_assetEntries, "count"));

  id v4 = VCPSignPostLog();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  int v6 = VCPSignPostLog();
  uint64_t v7 = v6;
  os_signpost_id_t spid = v5;
  unint64_t v73 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "MADPhotosOCRAssetProcessingTask_Download", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v8, v9))
    {
      unsigned int v10 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v11 = qos_class_self();
      id v12 = VCPMAQoSDescription(v11);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v93 = v10;
      *(_WORD *)&v93[4] = 2112;
      *(void *)&v93[6] = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[OCR][Download] Downloading %d assets (QoS: %@)", buf, 0x12u);
    }
  }
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  obj = self->_assetEntries;
  id v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v86 objects:v91 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v87;
    os_log_type_t v15 = VCPLogToOSLogType[6];
    os_log_type_t type = VCPLogToOSLogType[4];
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v87 != v14) {
          objc_enumerationMutation(obj);
        }
        dispatch_queue_t v17 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v18 = VCPLogInstance();
          if (os_log_type_enabled(v18, v15))
          {
            v19 = [v17 asset];
            unsigned int v20 = [v19 localIdentifier];
            *(_DWORD *)buf = 138412290;
            *(void *)v93 = v20;
            _os_log_impl((void *)&_mh_execute_header, v18, v15, "[OCR][Download][%@] Finding download resource", buf, 0xCu);
          }
        }
        v21 = [v17 asset];
        v22 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v21];

        [v17 setAcceptableResources:v22];
        os_log_type_t v23 = [v17 asset];
        uint64_t v24 = [(MADPhotosOCRAssetProcessingTask *)self acceptableResourcesForAsset:v23 withResources:v22];

        uint64_t v25 = (void *)v24;
        unint64_t v26 = [v17 asset];
        unint64_t v27 = [(MADPhotosOCRAssetProcessingTask *)self remoteResourceForAsset:v26 withAcceptableResources:v25];
        [v17 setDownloadResource:v27];

        id v28 = [v17 downloadResource];
        BOOL v29 = v28 == 0;

        if (v29)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            long long v30 = VCPLogInstance();
            if (os_log_type_enabled(v30, type))
            {
              long long v31 = [v17 asset];
              long long v32 = [v31 localIdentifier];
              *(_DWORD *)buf = 138412290;
              *(void *)v93 = v32;
              _os_log_impl((void *)&_mh_execute_header, v30, type, "[OCR][Download][%@] Failed to find download resource", buf, 0xCu);
            }
          }
          [v17 setStatus:4294943494];
        }
      }
      id v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v86 objects:v91 count:16];
    }
    while (v13);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v78 = self->_assetEntries;
  id v33 = [(NSMutableArray *)v78 countByEnumeratingWithState:&v82 objects:v90 count:16];
  if (!v33)
  {
    int obja = 0;
    goto LABEL_52;
  }
  int obja = 0;
  uint64_t v34 = *(void *)v83;
  os_log_type_t typea = VCPLogToOSLogType[5];
  os_log_type_t v75 = VCPLogToOSLogType[4];
  do
  {
    for (j = 0; j != v33; j = (char *)j + 1)
    {
      if (*(void *)v83 != v34) {
        objc_enumerationMutation(v78);
      }
      v36 = *(void **)(*((void *)&v82 + 1) + 8 * (void)j);
      v37 = +[VCPWatchdog sharedWatchdog];
      [v37 pet];

      v38 = [v36 acceptableResources];
      v39 = objc_msgSend(v38, "mad_computeSyncResource");

      if (v39)
      {
        v40 = [v36 asset];
        v41 = [(MADProcessingTask *)self cancelBlock];
        objc_msgSend(v36, "setIsAnalysisCompleteFromComputeSync:", objc_msgSend(v39, "mad_isAnalysisCompleteFromComputeSyncForAsset:taskID:allowDownload:cancel:", v40, 10, 1, v41));

        if ([v36 isAnalysisCompleteFromComputeSync])
        {
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            v42 = VCPLogInstance();
            if (os_log_type_enabled(v42, typea))
            {
              v43 = [v36 asset];
              v44 = [v43 localIdentifier];
              *(_DWORD *)buf = 138412290;
              *(void *)v93 = v44;
              _os_log_impl((void *)&_mh_execute_header, v42, typea, "[OCR][Download][%@] Analysis complete with compute sync, skipping media resource download", buf, 0xCu);
            }
          }
          goto LABEL_48;
        }
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v45 = VCPLogInstance();
          if (os_log_type_enabled(v45, typea))
          {
            v46 = [v36 asset];
            v47 = [v46 localIdentifier];
            *(_DWORD *)buf = 138412290;
            *(void *)v93 = v47;
            _os_log_impl((void *)&_mh_execute_header, v45, typea, "[OCR][Download][%@] Analysis remains incomplete with compute sync, falling back to media resource download", buf, 0xCu);
          }
        }
      }
      v48 = [v36 downloadResource];
      BOOL v49 = v48 == 0;

      if (!v49)
      {
        dispatch_group_enter((dispatch_group_t)self->_downloadGroup);
        v50 = [v36 downloadResource];
        v81[0] = _NSConcreteStackBlock;
        v81[1] = 3221225472;
        v81[2] = sub_1000804F0;
        v81[3] = &unk_10021C070;
        v81[4] = self;
        v81[5] = v36;
        uint64_t v51 = +[PHAssetResourceManager vcp_requestFileURLForAssetResource:v50 taskID:10 completionHandler:v81];

        if (v51)
        {
          v52 = [v36 asset];
          [(MADPhotosOCRAssetProcessingTask *)self addDownloadRequestID:v51 forAsset:v52];

          ++obja;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v53 = VCPLogInstance();
            if (os_log_type_enabled(v53, v75))
            {
              v54 = [v36 asset];
              v55 = [v54 localIdentifier];
              *(_DWORD *)buf = 138412290;
              *(void *)v93 = v55;
              _os_log_impl((void *)&_mh_execute_header, v53, v75, "[OCR][Download][%@] Failed to initialize resource download", buf, 0xCu);
            }
          }
          [v36 setStatus:4294943494];
          dispatch_group_leave((dispatch_group_t)self->_downloadGroup);
        }
      }
LABEL_48:
    }
    id v33 = [(NSMutableArray *)v78 countByEnumeratingWithState:&v82 objects:v90 count:16];
  }
  while (v33);
LABEL_52:

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v56 = VCPLogInstance();
    os_log_type_t v57 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v56, v57))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v93 = obja;
      _os_log_impl((void *)&_mh_execute_header, v56, v57, "[OCR][Download] Waiting for %d downloads to complete", buf, 8u);
    }
  }
  while (1)
  {
    downloadGroup = self->_downloadGroup;
    dispatch_time_t v59 = dispatch_time(0, 500000000);
    if (!dispatch_group_wait(downloadGroup, v59)) {
      break;
    }
    v60 = [(MADProcessingTask *)self cancelBlock];
    if (v60)
    {
      v61 = [(MADProcessingTask *)self cancelBlock];
      int v62 = v61[2]();

      if (v62)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v66 = VCPLogInstance();
          os_log_type_t v67 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v66, v67))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v66, v67, "[OCR][Download] Processing cancelled; cancelling downloads",
              buf,
              2u);
          }
        }
        [(MADPhotosOCRAssetProcessingTask *)self cancelRemainingDownloadsWithStatus:4294967168];
        break;
      }
    }
    [(MADPhotosOCRAssetProcessingTask *)self downloadInactiveTimeInterval];
    if (v63 > 60.0)
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v64 = VCPLogInstance();
        os_log_type_t v65 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v64, v65))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v64, v65, "[OCR][Download] Download inactivity timeout; cancelling downloads",
            buf,
            2u);
        }
      }
      [(MADPhotosOCRAssetProcessingTask *)self cancelRemainingDownloadsWithStatus:4294943494];
      break;
    }
  }
  v68 = VCPSignPostLog();
  v69 = v68;
  if (v73 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v69, OS_SIGNPOST_INTERVAL_END, spid, "MADPhotosOCRAssetProcessingTask_Download", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  v70 = +[MADStateHandler sharedStateHandler];
  objc_msgSend(v70, "addBreadcrumb:", @"[OCR] Finished downloading %d assets", -[NSMutableArray count](self->_assetEntries, "count"));

  [v74 stop];
  v71 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v74 elapsedTimeSeconds];
  objc_msgSend(v71, "accumulateDoubleValue:forField:andEvent:", @"TotalDownloadTimeInSeconds", @"com.apple.mediaanalysisd.OCRAnalysisRunSession");
}

- (int)_prepare
{
  id v32 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v32 start];
  id v4 = VCPSignPostLog();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  int v6 = VCPSignPostLog();
  uint64_t v7 = v6;
  unint64_t v30 = v5 - 1;
  os_signpost_id_t spid = v5;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "MADPhotosOCRAssetProcessingTask_Prepare", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v8, v9))
    {
      unsigned int v10 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v11 = qos_class_self();
      v2 = VCPMAQoSDescription(v11);
      *(_DWORD *)buf = 67109378;
      unsigned int v39 = v10;
      __int16 v40 = 2112;
      v41 = v2;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[OCR][Prepare] Preparing %d assets (QoS: %@)", buf, 0x12u);
    }
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v12 = self->_assetEntries;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v34;
LABEL_10:
    os_log_type_t v15 = 0;
    long long v16 = v2;
    while (1)
    {
      if (*(void *)v34 != v14) {
        objc_enumerationMutation(v12);
      }
      dispatch_queue_t v17 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v15);
      analysisDatabase = self->_analysisDatabase;
      v19 = (char *)[v17 previousAttempts];
      unsigned int v20 = [v17 asset];
      v21 = +[NSDate now];
      id v22 = (id)[(VCPDatabaseWriter *)analysisDatabase setAttempts:v19 + 1 asset:v20 taskID:10 status:1 lastAttemptDate:v21];

      if (v22 == -108)
      {
        v2 = v22;
      }
      else
      {
        BOOL v23 = v22 == -36 || v22 == -23;
        v2 = v22;
        if (!v23) {
          v2 = v16;
        }
      }
      if (v22 == -108) {
        goto LABEL_39;
      }
      if (v22 == -36 || v22 == -23) {
        goto LABEL_39;
      }
      os_log_type_t v15 = (char *)v15 + 1;
      long long v16 = v2;
      if (v13 == v15)
      {
        id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v13) {
          goto LABEL_10;
        }
        break;
      }
    }
  }

  unsigned int v25 = [(VCPDatabaseWriter *)self->_analysisDatabase commit];
  if (v25 == -108 || v25 == -36)
  {
    int v26 = v25;
  }
  else
  {
    int v26 = v25;
    if (v25 != -23) {
      int v26 = (int)v2;
    }
  }
  if (v25 != -108 && v25 != -36 && v25 != -23)
  {
    unint64_t v27 = VCPSignPostLog();
    id v28 = v27;
    if (v30 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, spid, "MADPhotosOCRAssetProcessingTask_Prepare", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    [v32 stop];
    id v12 = +[VCPMADCoreAnalyticsManager sharedManager];
    [v32 elapsedTimeSeconds];
    -[NSMutableArray accumulateDoubleValue:forField:andEvent:](v12, "accumulateDoubleValue:forField:andEvent:", @"TotalPrepareTimeInSeconds", @"com.apple.mediaanalysisd.OCRAnalysisRunSession");
    LODWORD(v2) = 0;
LABEL_39:

    int v26 = (int)v2;
  }

  return v26;
}

- (void)prepare
{
  self->_status = [(MADPhotosOCRAssetProcessingTask *)self _prepare];
}

- (id)acceptableResourcesForAsset:(id)a3 withResources:(id)a4
{
  id v5 = a3;
  id v30 = a4;
  if ([v5 hasAdjustments])
  {
    unsigned int v6 = 0;
  }
  else
  {
    uint64_t v7 = [v5 photoLibrary];
    unsigned int v6 = objc_msgSend(v7, "vcp_isSyndicationLibrary") ^ 1;
  }
  id v31 = +[NSMutableArray array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = v30;
  os_log_type_t v9 = 0;
  id v10 = [v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v33;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([v13 type] == (id)1)
        {
          id v14 = v13;

          os_log_type_t v9 = v14;
        }
        if (objc_msgSend(v13, "vcp_isPhoto"))
        {
          if ([v13 type] != (id)13 && objc_msgSend(v13, "type") != (id)8)
          {
            os_log_type_t v15 = objc_msgSend(v13, "vcp_uniformTypeIdentifier");
            unsigned __int8 v16 = +[VCPImageManager canDecodeAcceleratedUniformTypeIdentifier:v15];

            if (v16)
            {
              unsigned int v17 = [v13 type] == (id)1 ? v6 : 1;
              if (v17 == 1
                && ([v13 analysisType] == (id)2 || objc_msgSend(v13, "analysisType") == (id)1))
              {
                [v31 addObject:v13];
              }
            }
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v10);
  }

  v18 = +[PHAssetResource vcp_descendingSizeComparator];
  [v31 sortUsingComparator:v18];

  if (v9) {
    unsigned int v19 = v6;
  }
  else {
    unsigned int v19 = 0;
  }
  if (v19 == 1)
  {
    unsigned int v20 = objc_msgSend(v9, "vcp_uniformTypeIdentifier");
    unsigned int v21 = [v20 conformsToType:UTTypePNG];

    if (v21) {
      [v31 addObject:v9];
    }
  }
  if (![v31 count])
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      id v22 = VCPLogInstance();
      os_log_type_t v23 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = [v5 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v37 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "[OCR][%@] No viable resources; allowing thumbnail",
          buf,
          0xCu);
      }
    }
    unsigned int v25 = objc_msgSend(v8, "vcp_thumbnailResource");
    if (v25)
    {
      [v31 addObject:v25];
    }
    else if ((int)MediaAnalysisLogLevel() >= 4)
    {
      int v26 = VCPLogInstance();
      os_log_type_t v27 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v26, v27))
      {
        id v28 = [v5 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v37 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "[OCR][%@] Asset has no thumbnail resource", buf, 0xCu);
      }
    }
  }
  return v31;
}

- (id)localResourceForAsset:(id)a3 withAcceptableResources:(id)a4
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = a4;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "isLocallyAvailable", (void)v10))
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)remoteResourceForAsset:(id)a3 withAcceptableResources:(id)a4
{
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "analysisType", (void)v16) == (id)1)
        {
          id v14 = v10;

          goto LABEL_15;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    long long v11 = VCPLogInstance();
    os_log_type_t v12 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v11, v12))
    {
      long long v13 = [v5 localIdentifier];
      *(_DWORD *)buf = 138412290;
      unsigned int v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[OCR][Download][%@] No medium image derivative available; allowing other high-res resources",
        buf,
        0xCu);
    }
  }
  objc_msgSend(v6, "firstObject", (void)v16);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v14;
}

- (void)processAssetEntry:(id)a3 resource:(id)a4 resourceURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    long long v11 = VCPLogInstance();
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      long long v13 = [v8 asset];
      id v14 = [v13 localIdentifier];
      *(_DWORD *)buf = 138412290;
      v121 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[OCR][Process][%@] Processing asset", buf, 0xCu);
    }
  }
  os_log_type_t v15 = +[VCPWatchdog sharedWatchdog];
  [v15 pet];

  long long v16 = [(MADProcessingTask *)self cancelBlock];
  if (!v16
    || ([(MADProcessingTask *)self cancelBlock],
        long long v17 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
        int v18 = v17[2](),
        v17,
        v16,
        !v18))
  {
    if ([v8 isAnalysisCompleteFromComputeSync])
    {
      if ((int)MediaAnalysisLogLevel() < 6) {
        goto LABEL_100;
      }
      os_log_type_t v23 = VCPLogInstance();
      os_log_type_t v24 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v23, v24))
      {
        unsigned int v25 = [v8 asset];
        int v26 = [v25 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v121 = v26;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "[OCR][Process][%@] Analysis already complete from compute sync ingestion; skipping",
          buf,
          0xCu);
      }
LABEL_99:

      goto LABEL_100;
    }
    os_log_type_t v27 = VCPSignPostLog();
    os_signpost_id_t v28 = os_signpost_id_generate(v27);

    BOOL v29 = VCPSignPostLog();
    id v30 = v29;
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_BEGIN, v28, "VNImageRequestHandler_init", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    v114 = [objc_alloc((Class)VNImageRequestHandler) initWithURL:v10 options:&__NSDictionary0__struct];
    id v31 = VCPSignPostLog();
    long long v32 = v31;
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, v28, "VNImageRequestHandler_init", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    v116 = +[NSMutableArray array];
    v115 = +[VNRecognizeDocumentsRequest mad_defaultRequest];
    if (VCPPhotosMRCCachingEnabled(objc_msgSend(v116, "addObject:")))
    {
      long long v33 = +[VNDetectBarcodesRequest mad_defaultRequest];
      if (!v33)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          os_log_type_t v65 = VCPLogInstance();
          os_log_type_t v66 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v65, v66))
          {
            os_log_type_t v67 = [v8 asset];
            v68 = [v67 localIdentifier];
            v69 = [0 description];
            *(_DWORD *)buf = 138412546;
            v121 = v68;
            __int16 v122 = 2112;
            id v123 = v69;
            _os_log_impl((void *)&_mh_execute_header, v65, v66, "[OCR][Process][%@] Failed to configure VNDetectBarcodesRequest (%@)", buf, 0x16u);
          }
        }
        [v8 setStatus:4294967278];
        long long v33 = 0;
        id v41 = 0;
        goto LABEL_98;
      }
      [v116 addObject:v33];
    }
    else
    {
      long long v33 = 0;
    }
    long long v34 = [v8 asset];
    id v35 = objc_msgSend(v34, "vcp_ocrMajorDimensionForResource:", v9);

    if (v35)
    {
      [v115 setMaximumProcessingDimensionOnTheLongSide:v35];
      [v33 setMaximumProcessingDimensionOnTheLongSide:v35];
    }
    long long v36 = VCPSignPostLog();
    os_signpost_id_t v37 = os_signpost_id_generate(v36);

    v38 = VCPSignPostLog();
    unsigned int v39 = v38;
    if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_BEGIN, v37, "VNImageRequestHandler_performRequests", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    id v119 = 0;
    unsigned __int8 v40 = [v114 performRequests:v116 error:&v119];
    id v41 = v119;
    v42 = VCPSignPostLog();
    v43 = v42;
    if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, v37, "VNImageRequestHandler_performRequests", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if ((v40 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v61 = VCPLogInstance();
        os_log_type_t v62 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v61, v62))
        {
          double v63 = [v8 asset];
          v64 = [v63 localIdentifier];
          *(_DWORD *)buf = 138412546;
          v121 = v64;
          __int16 v122 = 2112;
          id v123 = v41;
          _os_log_impl((void *)&_mh_execute_header, v61, v62, "[OCR][Process][%@] Processing failed (%@)", buf, 0x16u);
        }
      }
      [v8 setStatus:4294967278];
      goto LABEL_98;
    }
    v44 = [v115 results];
    v113 = [v44 firstObject];

    if (!v113)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v70 = VCPLogInstance();
        os_log_type_t v71 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v70, v71))
        {
          v72 = [v8 asset];
          unint64_t v73 = [v72 localIdentifier];
          *(_DWORD *)buf = 138412290;
          v121 = v73;
          _os_log_impl((void *)&_mh_execute_header, v70, v71, "[OCR][Process][%@] Processing produced no results", buf, 0xCu);
        }
      }
      [v8 setStatus:4294967278];
      goto LABEL_97;
    }
    [v8 setVersion:8];
    v45 = [v113 getTranscript];
    id v111 = [v45 length];

    if (v111)
    {
      v46 = VCPSignPostLog();
      os_signpost_id_t v47 = os_signpost_id_generate(v46);

      v48 = VCPSignPostLog();
      BOOL v49 = v48;
      if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v49, OS_SIGNPOST_INTERVAL_BEGIN, v47, "VNDocumentObservation_archive", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      id v118 = v41;
      v50 = +[NSKeyedArchiver archivedDataWithRootObject:v113 requiringSecureCoding:1 error:&v118];
      id v51 = v118;

      id v41 = v51;
      [v8 setOcrData:v50];

      v52 = VCPSignPostLog();
      v53 = v52;
      if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v53, OS_SIGNPOST_INTERVAL_END, v47, "VNDocumentObservation_archive", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      v54 = [v8 ocrData];
      BOOL v55 = v54 == 0;

      if (v55)
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          os_log_type_t v57 = VCPLogInstance();
          os_log_type_t v58 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v57, v58))
          {
            dispatch_time_t v59 = objc_msgSend(v8, "asset", v111);
            v60 = [v59 localIdentifier];
            *(_DWORD *)buf = 138412290;
            v121 = v60;
            _os_log_impl((void *)&_mh_execute_header, v57, v58, "[OCR][Process][%@] Failed to archive OCR results", buf, 0xCu);
          }
        }
        objc_msgSend(v8, "setStatus:", 4294967278, v111);
LABEL_97:

LABEL_98:
        os_log_type_t v23 = v114;
        goto LABEL_99;
      }
    }
    else
    {
      uint64_t v56 = MediaAnalysisLogLevel();
      if ((int)v56 >= 6)
      {
        id v74 = VCPLogInstance();
        os_log_type_t v75 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v74, v75))
        {
          v76 = [v8 asset];
          v77 = [v76 localIdentifier];
          *(_DWORD *)buf = 138412290;
          v121 = v77;
          _os_log_impl((void *)&_mh_execute_header, v74, v75, "[OCR][Process][%@] No text recognized; skipping archive/persistence",
            buf,
            0xCu);
        }
      }
    }
    if (VCPPhotosMRCCachingEnabled(v56))
    {
      v78 = [v33 results];
      BOOL v79 = [v78 count] == 0;

      if (!v79)
      {
        v80 = VCPSignPostLog();
        os_signpost_id_t v81 = os_signpost_id_generate(v80);

        long long v82 = VCPSignPostLog();
        long long v83 = v82;
        if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v82))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v83, OS_SIGNPOST_INTERVAL_BEGIN, v81, "VNBarcodeObservation_archive", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        long long v84 = [v33 results];
        id v117 = v41;
        long long v85 = +[NSKeyedArchiver archivedDataWithRootObject:v84 requiringSecureCoding:1 error:&v117];
        id v86 = v117;

        id v41 = v86;
        [v8 setMrcData:v85];

        long long v87 = VCPSignPostLog();
        long long v88 = v87;
        if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v87))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v88, OS_SIGNPOST_INTERVAL_END, v81, "VNBarcodeObservation_archive", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        long long v89 = [v8 mrcData];
        BOOL v90 = v89 == 0;

        if (v90)
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v107 = VCPLogInstance();
            os_log_type_t v108 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v107, v108))
            {
              v109 = [v8 asset];
              v110 = [v109 localIdentifier];
              *(_DWORD *)buf = 138412290;
              v121 = v110;
              _os_log_impl((void *)&_mh_execute_header, v107, v108, "[OCR][Process][%@] Failed to archive MRC results", buf, 0xCu);
            }
          }
          objc_msgSend(v8, "setStatus:", 4294967278, v111);
          goto LABEL_97;
        }
        int v91 = 1;
        goto LABEL_83;
      }
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v92 = VCPLogInstance();
        os_log_type_t v93 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v92, v93))
        {
          v94 = [v8 asset];
          v95 = [v94 localIdentifier];
          *(_DWORD *)buf = 138412290;
          v121 = v95;
          _os_log_impl((void *)&_mh_execute_header, v92, v93, "[OCR][Process][%@] No MRC detected; skipping archive/persistence",
            buf,
            0xCu);
        }
      }
    }
    int v91 = 0;
LABEL_83:
    v96 = objc_msgSend(v8, "downloadURL", v111);
    BOOL v97 = v96 == 0;

    if (!v97)
    {
      v98 = [v8 downloadURL];
      +[PHAssetResourceManager vcp_flushResourceURL:v98];

      [v8 setDownloadURL:0];
    }
    v99 = [v8 asset];
    v100 = objc_msgSend(v99, "vcp_passedOCRGating");

    v101 = +[VCPMADCoreAnalyticsManager sharedManager];
    unsigned int v102 = [v100 BOOLValue];
    if (v112) {
      int v103 = 1;
    }
    else {
      int v103 = v91;
    }
    BOOL v104 = v103 == 0;
    if (v103) {
      v105 = &VCPAnalyticsFieldNumberOfAssetsPassGateWithText;
    }
    else {
      v105 = &VCPAnalyticsFieldNumberOfAssetsPassGateWithoutText;
    }
    v106 = &VCPAnalyticsFieldNumberOfAssetsNotPassGateWithText;
    if (v104) {
      v106 = &VCPAnalyticsFieldNumberOfAssetsNotPassGateWithoutText;
    }
    if (!v102) {
      v105 = v106;
    }
    [v101 accumulateInt64Value:1 forField:*v105 andEvent:@"com.apple.mediaanalysisd.OCRAnalysisRunSession"];

    goto LABEL_97;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    long long v19 = VCPLogInstance();
    os_log_type_t v20 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v19, v20))
    {
      unsigned int v21 = [v8 asset];
      id v22 = [v21 localIdentifier];
      *(_DWORD *)buf = 138412290;
      v121 = v22;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "[OCR][Process][%@] Processing canceled; skipping asset",
        buf,
        0xCu);
    }
  }
  [v8 setStatus:4294967168];
LABEL_100:
}

- (int)_process
{
  id v57 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v57 start];
  v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  id v4 = VCPSignPostLog();
  id v5 = v4;
  unint64_t v55 = v3 - 1;
  os_signpost_id_t spid = v3;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MADPhotosOCRAssetProcessingTask_Process", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v6 = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      unsigned int v8 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v9 = qos_class_self();
      id v10 = VCPMAQoSDescription(v9);
      *(_DWORD *)buf = 67109378;
      LODWORD(v66[0]) = v8;
      WORD2(v66[0]) = 2112;
      *(void *)((char *)v66 + 6) = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[OCR][Process] Processing %d assets (QoS: %@)", buf, 0x12u);
    }
  }
  long long v11 = +[VCPWatchdog sharedWatchdog];
  [v11 pet];

  unint64_t v12 = 0;
  char v58 = [(NSMutableArray *)self->_assetEntries count] != 0;
  os_log_type_t v13 = VCPLogToOSLogType[6];
  os_log_type_t type = VCPLogToOSLogType[4];
  while (v12 < (unint64_t)[(NSMutableArray *)self->_assetEntries count])
  {
    os_log_type_t v15 = [(NSMutableArray *)self->_assetEntries objectAtIndexedSubscript:v12];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      long long v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, v13))
      {
        long long v17 = [v15 asset];
        int v18 = [v17 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v66[0] = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, v13, "[OCR][Process][%@] Staging asset", buf, 0xCu);
      }
    }
    if ([v15 status])
    {
      if ((int)MediaAnalysisLogLevel() < 4) {
        goto LABEL_35;
      }
      long long v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, type))
      {
        os_log_type_t v20 = [v15 asset];
        unsigned int v21 = [v20 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v66[0] = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, type, "[OCR][Process][%@] Asset has failure status; skipping",
          buf,
          0xCu);
      }
      goto LABEL_29;
    }
    id v22 = [v15 asset];
    os_log_type_t v23 = [v22 adjustmentVersion];
    BOOL v24 = v23 == 0;

    if (!v24)
    {
      unsigned int v25 = [v15 downloadResource];
      int v26 = [v15 downloadURL];
      if (v26)
      {
        os_log_type_t v27 = +[VCPMADCoreAnalyticsManager sharedManager];
        [v27 accumulateInt64Value:1 forField:@"NumbeOfResourceDownloads" andEvent:@"com.apple.mediaanalysisd.OCRAnalysisRunSession"];

        goto LABEL_21;
      }
      unsigned int v39 = [v15 asset];
      unsigned __int8 v40 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v39];

      id v41 = [v15 asset];
      v42 = [(MADPhotosOCRAssetProcessingTask *)self acceptableResourcesForAsset:v41 withResources:v40];

      v43 = [v15 asset];
      long long v19 = [(MADPhotosOCRAssetProcessingTask *)self localResourceForAsset:v43 withAcceptableResources:v42];

      if (v19)
      {
        int v26 = [v19 privateFileURL];

        if (v26)
        {
          unsigned int v25 = v19;
LABEL_21:
          os_signpost_id_t v28 = [v15 asset];
          BOOL v29 = [v28 characterRecognitionProperties];
          id v30 = [v29 algorithmVersion];

          BOOL v32 = [v15 version] == 0x7FFF && v30 == (id)0x7FFF;
          computeGroup = self->_computeGroup;
          computeQueue = self->_computeQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100082F60;
          block[3] = &unk_10021C098;
          block[4] = self;
          id v62 = v15;
          long long v19 = v25;
          double v63 = v19;
          id v64 = v26;
          id v35 = v26;
          dispatch_group_async(computeGroup, computeQueue, block);

          v58 &= v32;
LABEL_28:

LABEL_29:
          goto LABEL_35;
        }
      }
      else
      {
      }
      v44 = [v15 asset];
      objc_msgSend(v44, "vcp_passedOCRGating");
      id v35 = (id)objc_claimAutoreleasedReturnValue();

      if ([v35 BOOLValue])
      {
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v45 = VCPLogInstance();
          if (os_log_type_enabled(v45, type))
          {
            v46 = [v15 asset];
            os_signpost_id_t v47 = [v46 localIdentifier];
            *(_DWORD *)buf = 138412290;
            v66[0] = v47;
            _os_log_impl((void *)&_mh_execute_header, v45, type, "[OCR][Process][%@] No acceptable resource available", buf, 0xCu);
          }
        }
        [v15 setStatus:4294943494];
      }
      else
      {
        [v15 setVersion:0x7FFFLL];
        v48 = +[VCPMADCoreAnalyticsManager sharedManager];
        [v48 accumulateInt64Value:1 forField:@"NumberOfAssetsGated" andEvent:@"com.apple.mediaanalysisd.OCRAnalysisRunSession"];
      }
      goto LABEL_28;
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      long long v36 = VCPLogInstance();
      if (os_log_type_enabled(v36, type))
      {
        os_signpost_id_t v37 = [v15 asset];
        v38 = [v37 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v66[0] = v38;
        _os_log_impl((void *)&_mh_execute_header, v36, type, "[OCR][Process][%@] Asset has no adjustment version; skipping",
          buf,
          0xCu);
      }
    }
    [v15 setStatus:4294943493];
LABEL_35:

    ++v12;
  }
  self->_shouldSkipPhotosPersist = v58 & 1;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    BOOL v49 = VCPLogInstance();
    if (os_log_type_enabled(v49, v13))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, v13, "[OCR][Process] Waiting for compute to complete", buf, 2u);
    }
  }
  dispatch_group_wait((dispatch_group_t)self->_computeGroup, 0xFFFFFFFFFFFFFFFFLL);
  v50 = VCPSignPostLog();
  id v51 = v50;
  if (v55 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_INTERVAL_END, spid, "MADPhotosOCRAssetProcessingTask_Process", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  [v57 stop];
  v52 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v57 elapsedTimeSeconds];
  objc_msgSend(v52, "accumulateDoubleValue:forField:andEvent:", @"TotalAnalyzingTimeInSeconds", @"com.apple.mediaanalysisd.OCRAnalysisRunSession");

  v53 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v57 elapsedTimeSeconds];
  objc_msgSend(v53, "accumulateDoubleValue:forField:andEvent:", @"TotalProcessTimeInSeconds", @"com.apple.mediaanalysisd.OCRAnalysisRunSession");

  return 0;
}

- (void)process
{
  if (!self->_status) {
    self->_status = [(MADPhotosOCRAssetProcessingTask *)self _process];
  }
}

- (int)_publish
{
  id v64 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v64 start];
  os_signpost_id_t v3 = VCPSignPostLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  id v5 = VCPSignPostLog();
  id v6 = v5;
  unint64_t v60 = v4 - 1;
  os_signpost_id_t spid = v4;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "MADPhotosOCRAssetProcessingTask_Publish", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      unsigned int v9 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v10 = qos_class_self();
      VCPMAQoSDescription(v10);
      id p_cache = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v77 = v9;
      *(_WORD *)&v77[4] = 2112;
      *(void *)&v77[6] = p_cache;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[OCR][Publish] Persisting %d assets (QoS: %@)", buf, 0x12u);
    }
  }
  if (![(NSMutableArray *)self->_assetEntries count])
  {
    LODWORD(p_cache) = 0;
    goto LABEL_87;
  }
  long long v11 = [(NSMutableArray *)self->_assetEntries firstObject];
  unint64_t v12 = [v11 asset];
  id v62 = [v12 photoLibrary];

  if (self->_shouldSkipPhotosPersist)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      os_log_type_t v13 = VCPLogInstance();
      os_log_type_t v14 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v13, v14))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "[OCR][Publish] Skipped Photos persist since all assets were and still are gated", buf, 2u);
      }
    }
  }
  else
  {
    id p_cache = VCPRequestRebuildPersonsTask.cache;
    os_log_type_t v15 = +[MADStateHandler sharedStateHandler];
    objc_msgSend(v15, "addBreadcrumb:", @"[OCR] Persisting %d assets to Photos", -[NSMutableArray count](self->_assetEntries, "count"));

    long long v16 = +[VCPWatchdog sharedWatchdog];
    [v16 pet];

    long long v17 = +[MADStateHandler sharedStateHandler];
    [v17 enterKnownTimeoutRisk:1];

    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_100083B24;
    v74[3] = &unk_100219FC8;
    v74[4] = self;
    int v18 = objc_retainBlock(v74);
    long long v19 = [(MADProcessingTask *)self cancelBlock];
    id v73 = 0;
    unsigned __int8 v20 = objc_msgSend(v62, "mad_performChangesAndWait:cancelBlock:extendTimeoutBlock:error:", v18, v19, &stru_10021C0B8, &v73);
    id v21 = v73;

    id v22 = +[MADStateHandler sharedStateHandler];
    [v22 exitKnownTimeoutRisk];

    os_log_type_t v23 = +[MADStateHandler sharedStateHandler];
    objc_msgSend(v23, "addBreadcrumb:", @"[OCR] Finished persisting %d assets to Photos", -[NSMutableArray count](self->_assetEntries, "count"));

    if ((v20 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        BOOL v24 = VCPLogInstance();
        os_log_type_t v25 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v24, v25))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v77 = v21;
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "[OCR][Publish] Failed to persist OCR results to Photos (%@)", buf, 0xCu);
        }
      }
      id p_cache = [v21 code];
    }

    if ((v20 & 1) == 0) {
      goto LABEL_86;
    }
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obj = self->_assetEntries;
  id v26 = [(NSMutableArray *)obj countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (!v26)
  {
    unsigned int v63 = 0;
    LODWORD(v27) = p_cache;
    goto LABEL_73;
  }
  unsigned int v63 = 0;
  uint64_t v67 = *(void *)v70;
  id v27 = p_cache;
  do
  {
    id v66 = v26;
    for (i = 0; i != v66; i = (char *)i + 1)
    {
      if (*(void *)v70 != v67) {
        objc_enumerationMutation(obj);
      }
      BOOL v29 = *(void **)(*((void *)&v69 + 1) + 8 * i);
      if (![v29 status])
      {
        analysisDatabase = self->_analysisDatabase;
        v38 = [v29 asset];
        unsigned int v39 = [v38 localIdentifier];
        id v40 = (id)[(VCPDatabaseWriter *)analysisDatabase removeProcessingStatusForLocalIdentifier:v39 andTaskID:10];

        if (v40 == -108)
        {
          id p_cache = v40;
        }
        else
        {
          BOOL v41 = v40 == -36 || v40 == -23;
          id p_cache = v40;
          if (!v41) {
            id p_cache = v27;
          }
        }
        if (v40 == -108) {
          goto LABEL_85;
        }
        if (v40 == -36 || v40 == -23) {
          goto LABEL_85;
        }
        v48 = +[VCPMADCoreAnalyticsManager sharedManager];
        [v48 accumulateInt64Value:1 forField:@"NumberOfAssetsAnalyzed" andEvent:@"com.apple.mediaanalysisd.OCRAnalysisRunSession"];

        goto LABEL_59;
      }
      if ([v29 status] == -128)
      {
        id v30 = [v29 previousAttempts];
        id v31 = self->_analysisDatabase;
        if (v30)
        {
          id v32 = [v29 previousAttempts];
          long long v33 = [v29 asset];
          id v34 = [v29 previousStatus];
          id v35 = [v29 lastAttemptDate];
          id v36 = (id)[(VCPDatabaseWriter *)v31 setAttempts:v32 asset:v33 taskID:10 status:v34 lastAttemptDate:v35];
        }
        else
        {
          long long v33 = [v29 asset];
          id v35 = [v33 localIdentifier];
          id v36 = (id)[(VCPDatabaseWriter *)v31 removeProcessingStatusForLocalIdentifier:v35 andTaskID:10];
        }

        if (v36 == -108 || v36 == -36)
        {
          id p_cache = v36;
        }
        else
        {
          id p_cache = v36;
          if (v36 != -23) {
            id p_cache = v27;
          }
        }
        if (v36 == -108 || v36 == -36 || v36 == -23) {
          goto LABEL_85;
        }
        unsigned int v63 = [v29 status];
LABEL_59:
        id v27 = p_cache;
        continue;
      }
      v42 = +[VCPMADCoreAnalyticsManager sharedManager];
      v43 = @"NumberOfAssetsSoftFailure";
      if ([v29 status] == -23802)
      {
        v44 = @"NumberOfAssetsNoResource";
        uint64_t v45 = 2;
      }
      else
      {
        if ([v29 status] != -23808)
        {
          uint64_t v45 = 3;
          goto LABEL_61;
        }
        unsigned int v63 = [v29 status];
        v44 = @"NumberOfAssetsDownloadThrottled";
        uint64_t v45 = 7;
      }
      v46 = v44;

      v43 = v46;
LABEL_61:
      [v42 accumulateInt64Value:1 forField:v43 andEvent:@"com.apple.mediaanalysisd.OCRAnalysisRunSession"];
      [v42 accumulateInt64Value:1 forField:@"NumberOfAssetsIntoBlacklist" andEvent:@"com.apple.mediaanalysisd.OCRAnalysisRunSession"];
      BOOL v49 = [v29 asset];
      v50 = [v29 currentAttemptDate];
      id v51 = objc_msgSend(v49, "mad_nextAttemptDateForStatus:currentAttemptDate:attemptCount:", v45, v50, (char *)objc_msgSend(v29, "previousAttempts") + 1);

      v52 = self->_analysisDatabase;
      v53 = [v29 asset];
      v54 = [v53 localIdentifier];
      id v55 = (id)[(VCPDatabaseWriter *)v52 updateProcessingStatus:v45 andNextAttemptDate:v51 forLocalIdentifier:v54 andTaskID:10];

      if (v55 == -108 || v55 == -36)
      {
        id p_cache = v55;
      }
      else
      {
        id p_cache = v55;
        if (v55 != -23) {
          id p_cache = v27;
        }
      }

      if (v55 == -108) {
        goto LABEL_85;
      }
      if (v55 == -36) {
        goto LABEL_85;
      }
      id v27 = p_cache;
      if (v55 == -23) {
        goto LABEL_85;
      }
    }
    id v26 = [(NSMutableArray *)obj countByEnumeratingWithState:&v69 objects:v75 count:16];
  }
  while (v26);
LABEL_73:

  unsigned int v56 = [(VCPDatabaseWriter *)self->_analysisDatabase commit];
  if (v56 == -108 || v56 == -36)
  {
    LODWORD(p_cache) = v56;
  }
  else
  {
    LODWORD(p_cache) = v56;
    if (v56 != -23) {
      LODWORD(p_cache) = v27;
    }
  }
  if (v56 != -108 && v56 != -36 && v56 != -23)
  {
    id v57 = VCPSignPostLog();
    char v58 = v57;
    if (v60 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v58, OS_SIGNPOST_INTERVAL_END, spid, "MADPhotosOCRAssetProcessingTask_Publish", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    [v64 stop];
    obj = +[VCPMADCoreAnalyticsManager sharedManager];
    [v64 elapsedTimeSeconds];
    -[NSMutableArray accumulateDoubleValue:forField:andEvent:](obj, "accumulateDoubleValue:forField:andEvent:", @"TotalPublishTimeInSeconds", @"com.apple.mediaanalysisd.OCRAnalysisRunSession");
    LODWORD(p_cache) = v63;
LABEL_85:
  }
LABEL_86:

LABEL_87:
  return (int)p_cache;
}

- (void)publish
{
  if (!self->_status) {
    self->_status = [(MADPhotosOCRAssetProcessingTask *)self _publish];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeQueue, 0);
  objc_storeStrong((id *)&self->_computeGroup, 0);
  objc_storeStrong((id *)&self->_downloadStateChange, 0);
  objc_storeStrong((id *)&self->_downloadRequestIDs, 0);
  objc_storeStrong((id *)&self->_downloadStateQueue, 0);
  objc_storeStrong((id *)&self->_downloadGroup, 0);
  objc_storeStrong((id *)&self->_analysisDatabase, 0);
  objc_storeStrong((id *)&self->_assetEntries, 0);
}

@end