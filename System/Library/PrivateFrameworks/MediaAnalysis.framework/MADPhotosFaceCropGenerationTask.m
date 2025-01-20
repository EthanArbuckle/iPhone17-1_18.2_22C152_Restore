@interface MADPhotosFaceCropGenerationTask
- (MADPhotosFaceCropGenerationTask)init;
- (double)downloadInactiveTimeInterval;
- (int)removeDownloadRequestIDForAsset:(id)a3;
- (unint64_t)count;
- (void)addDownloadRequestID:(int)a3 forAsset:(id)a4;
- (void)addFace:(id)a3;
- (void)cancelRemainingDownloadsWithStatus:(int)a3;
- (void)download;
- (void)prepare;
- (void)process;
@end

@implementation MADPhotosFaceCropGenerationTask

- (MADPhotosFaceCropGenerationTask)init
{
  v13.receiver = self;
  v13.super_class = (Class)MADPhotosFaceCropGenerationTask;
  v2 = [(MADProcessingTask *)&v13 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableSet set];
    faces = v2->_faces;
    v2->_faces = (NSMutableSet *)v3;

    dispatch_group_t v5 = dispatch_group_create();
    downloadGroup = v2->_downloadGroup;
    v2->_downloadGroup = (OS_dispatch_group *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.mediaanalysisd.facecrop.download", v7);
    downloadStateQueue = v2->_downloadStateQueue;
    v2->_downloadStateQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    downloadRequestIDs = v2->_downloadRequestIDs;
    v2->_downloadRequestIDs = (NSMutableDictionary *)v10;
  }
  return v2;
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableSet *)self->_faces count];
}

- (void)addFace:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_faces containsObject:v4])
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      dispatch_group_t v5 = VCPLogInstance();
      os_log_type_t v6 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v5, v6))
      {
        v7 = [v4 localIdentifier];
        int v8 = 138412290;
        v9 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "[FaceCrop][%@] Batch already contains face; ignoring",
          (uint8_t *)&v8,
          0xCu);
      }
    }
  }
  else
  {
    [(NSMutableSet *)self->_faces addObject:v4];
  }
}

- (void)prepare
{
  id v48 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v48 start];
  uint64_t v3 = VCPSignPostLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  dispatch_group_t v5 = VCPSignPostLog();
  os_log_type_t v6 = v5;
  unint64_t v47 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "MADPhotosFaceCropGenerationTask_Prepare", (const char *)&unk_1001F3BD3, buf, 2u);
  }
  os_signpost_id_t spid = v4;

  v7 = +[PHAsset fetchAssetsGroupedByFaceUUIDForFaces:self->_faces];
  v52 = +[NSMutableDictionary dictionary];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v46 = self;
  int v8 = self->_faces;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v57 objects:v68 count:16];
  v51 = v7;
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v58;
    uint64_t v12 = VCPLogToOSLogType[3];
    os_log_type_t type = VCPLogToOSLogType[3];
    do
    {
      objc_super v13 = 0;
      do
      {
        if (*(void *)v58 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v13);
        v15 = objc_msgSend(v14, "uuid", spid);
        v16 = [v7 objectForKeyedSubscript:v15];

        if (v16)
        {
          v17 = [v16 localIdentifier];

          if (v17)
          {
            uint64_t v18 = v12;
            v19 = [v16 localIdentifier];
            v20 = [v52 objectForKeyedSubscript:v19];

            if (v20)
            {
              v21 = [v20 faces];
              [(MADPhotosFaceCropGenerationEntry *)v21 addObject:v14];
            }
            else
            {
              v21 = [[MADPhotosFaceCropGenerationEntry alloc] initWithAsset:v16 andFace:v14];
              if (v21)
              {
                v23 = [v16 localIdentifier];
                [v52 setObject:v21 forKeyedSubscript:v23];
              }
              else
              {
                if ((int)MediaAnalysisLogLevel() < 3) {
                  goto LABEL_20;
                }
                v23 = VCPLogInstance();
                if (os_log_type_enabled(v23, (os_log_type_t)v18))
                {
                  v50 = [v16 localIdentifier];
                  v24 = [v14 localIdentifier];
                  *(_DWORD *)buf = 138412546;
                  v63 = v50;
                  __int16 v64 = 2112;
                  v65 = v24;
                  _os_log_impl((void *)&_mh_execute_header, v23, type, "[FaceCrop] Failed to create entry asset %@ and face %@; skip",
                    buf,
                    0x16u);
                }
              }
            }
LABEL_20:
            uint64_t v12 = v18;

            v7 = v51;
            goto LABEL_21;
          }
          v20 = VCPLogInstance();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            v22 = [v14 localIdentifier];
            *(_DWORD *)buf = 138412546;
            v63 = v16;
            __int16 v64 = 2112;
            v65 = v22;
            _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "[FaceCrop] Asset %@ containing face (%@) misses localIdentifier; skip",
              buf,
              0x16u);
          }
        }
        else
        {
          v20 = VCPLogInstance();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
            sub_1000AD818(v66, v14, &v67, v20);
          }
        }
LABEL_21:

        objc_super v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id v25 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v57 objects:v68 count:16];
      id v10 = v25;
    }
    while (v25);
  }

  uint64_t v26 = [v52 allValues];
  assetEntries = v46->_assetEntries;
  v46->_assetEntries = (NSArray *)v26;

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v28 = v46->_assetEntries;
  id v29 = [(NSArray *)v28 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v54;
    os_log_type_t v32 = VCPLogToOSLogType[4];
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v54 != v31) {
          objc_enumerationMutation(v28);
        }
        v34 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        v35 = objc_msgSend(v34, "asset", spid);
        v36 = +[VCPFaceUtils preferredResourcesForFaceProcessingWithAsset:v35];

        v37 = +[VCPFaceUtils resourceForFaceProcessing:v36 allowStreaming:1];
        [v34 setResource:v37];

        v38 = [v34 resource];

        if (!v38 && (int)MediaAnalysisLogLevel() >= 4)
        {
          v39 = VCPLogInstance();
          if (os_log_type_enabled(v39, v32))
          {
            v40 = [v34 asset];
            v41 = [v40 localIdentifier];
            *(_DWORD *)buf = 138412290;
            v63 = v41;
            _os_log_impl((void *)&_mh_execute_header, v39, v32, "[FaceCrop][%@] Failed to identify resource", buf, 0xCu);
          }
        }
      }
      id v30 = [(NSArray *)v28 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v30);
  }

  v42 = VCPSignPostLog();
  v43 = v42;
  if (v47 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, spid, "MADPhotosFaceCropGenerationTask_Prepare", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  [v48 stop];
  v44 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v48 elapsedTimeSeconds];
  objc_msgSend(v44, "accumulateDoubleValue:forField:andEvent:", @"TotalPrepareTimeInSeconds", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
}

- (void)addDownloadRequestID:(int)a3 forAsset:(id)a4
{
  id v6 = a4;
  downloadStateQueue = self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AC250;
  block[3] = &unk_10021C7B0;
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
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  downloadStateQueue = self->_downloadStateQueue;
  int v14 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AC3CC;
  block[3] = &unk_100219CD8;
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
  v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  downloadStateQueue = self->_downloadStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AC5C0;
  v5[3] = &unk_100219C88;
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
  v5[2] = sub_1000AC6CC;
  v5[3] = &unk_100219CB0;
  v5[4] = self;
  int v6 = a3;
  dispatch_sync(downloadStateQueue, v5);
  dispatch_group_wait((dispatch_group_t)self->_downloadGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)download
{
  id v53 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v53 start];
  double v3 = VCPSignPostLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  dispatch_group_t v5 = VCPSignPostLog();
  int v6 = v5;
  unint64_t v52 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "MADPhotosFaceCropGenerationTask_Download", (const char *)&unk_1001F3BD3, buf, 2u);
  }
  os_signpost_id_t spid = v4;

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      unsigned int v9 = [(NSArray *)self->_assetEntries count];
      qos_class_t v10 = qos_class_self();
      uint64_t v11 = VCPMAQoSDescription(v10);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)__int16 v64 = v9;
      *(_WORD *)&v64[4] = 2112;
      *(void *)&v64[6] = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[FaceCrop][Download] Downloading %d assets (QoS: %@)", buf, 0x12u);
    }
  }
  uint64_t v12 = +[MADStateHandler sharedStateHandler];
  objc_msgSend(v12, "addBreadcrumb:", @"[FaceCropGeneration] Downloading %d assets", -[NSArray count](self->_assetEntries, "count"));

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obj = self->_assetEntries;
  id v13 = [(NSArray *)obj countByEnumeratingWithState:&v58 objects:v62 count:16];
  int v14 = &OBJC_IVAR___VCPAssetAnalysisTask__types;
  if (v13)
  {
    id v15 = v13;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v59;
    os_log_type_t type = VCPLogToOSLogType[4];
    long long v54 = self;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v59 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        v20 = +[VCPWatchdog sharedWatchdog];
        [v20 pet];

        v21 = [v19 resource];

        if (v21)
        {
          uint64_t v22 = v14[77];
          dispatch_group_enter(*(dispatch_group_t *)((char *)&self->super.super.super.super.isa + v22));
          v23 = [v19 resource];
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472;
          v57[2] = sub_1000ACF78;
          v57[3] = &unk_10021C7D8;
          v57[4] = self;
          v57[5] = v19;
          uint64_t v24 = +[PHAssetResourceManager vcp_requestFileURLForAssetResource:v23 taskID:3 completionHandler:v57];

          if (v24)
          {
            id v25 = [v19 asset];
            [(MADPhotosFaceCropGenerationTask *)self addDownloadRequestID:v24 forAsset:v25];

            uint64_t v16 = (v16 + 1);
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              uint64_t v26 = VCPLogInstance();
              if (os_log_type_enabled(v26, type))
              {
                v27 = [v19 asset];
                [v27 localIdentifier];
                uint64_t v28 = v16;
                v30 = id v29 = v14;
                *(_DWORD *)buf = 138412290;
                *(void *)__int16 v64 = v30;
                _os_log_impl((void *)&_mh_execute_header, v26, type, "[FaceCrop][Download][%@] Failed to initialize resource download", buf, 0xCu);

                int v14 = v29;
                uint64_t v16 = v28;
                self = v54;
              }
            }
            [v19 setStatus:4294943494];
            dispatch_group_leave(*(dispatch_group_t *)((char *)&self->super.super.super.super.isa + v22));
          }
        }
      }
      id v15 = [(NSArray *)obj countByEnumeratingWithState:&v58 objects:v62 count:16];
    }
    while (v15);
  }
  else
  {
    LODWORD(v16) = 0;
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v31 = VCPLogInstance();
    os_log_type_t v32 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v31, v32))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)__int16 v64 = v16;
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "[FaceCrop][Download] Waiting for %d downloads to complete", buf, 8u);
    }
  }
  uint64_t v33 = v14[77];
  while (1)
  {
    v34 = *(NSObject **)((char *)&self->super.super.super.super.isa + v33);
    dispatch_time_t v35 = dispatch_time(0, 500000000);
    if (!dispatch_group_wait(v34, v35)) {
      break;
    }
    uint64_t v36 = [(MADProcessingTask *)self cancelBlock];
    if (v36)
    {
      v37 = (void *)v36;
      v38 = [(MADProcessingTask *)self cancelBlock];
      int v39 = v38[2]();

      if (v39)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v45 = VCPLogInstance();
          os_log_type_t v46 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v45, v46))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v45, v46, "[FaceCrop][Download] Processing cancelled; cancelling downloads",
              buf,
              2u);
          }
        }
        v43 = self;
        uint64_t v44 = 4294967168;
        goto LABEL_44;
      }
    }
    [(MADPhotosFaceCropGenerationTask *)self downloadInactiveTimeInterval];
    if (v40 > 60.0)
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v41 = VCPLogInstance();
        os_log_type_t v42 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v41, v42))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, v42, "[FaceCrop][Download] Download inactivity timeout; cancelling downloads",
            buf,
            2u);
        }
      }
      v43 = self;
      uint64_t v44 = 4294943494;
LABEL_44:
      [(MADPhotosFaceCropGenerationTask *)v43 cancelRemainingDownloadsWithStatus:v44];
      break;
    }
  }
  unint64_t v47 = VCPSignPostLog();
  id v48 = v47;
  if (v52 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_INTERVAL_END, spid, "MADPhotosFaceCropGenerationTask_Download", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  v49 = +[MADStateHandler sharedStateHandler];
  objc_msgSend(v49, "addBreadcrumb:", @"[FaceCropGeneration] Finished downloading %d assets", -[NSArray count](self->_assetEntries, "count"));

  [v53 stop];
  v50 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v53 elapsedTimeSeconds];
  objc_msgSend(v50, "accumulateDoubleValue:forField:andEvent:", @"TotalDownloadTimeInSeconds", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
}

- (void)process
{
  id v52 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v52 start];
  double v3 = VCPSignPostLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  dispatch_group_t v5 = VCPSignPostLog();
  int v6 = v5;
  unint64_t v48 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "MADPhotosFaceCropGenerationTask_Process", (const char *)&unk_1001F3BD3, buf, 2u);
  }
  os_signpost_id_t v47 = v4;

  v51 = +[VCPMADCoreAnalyticsManager sharedManager];
  v7 = [(NSMutableSet *)self->_faces anyObject];
  uint64_t v8 = [v7 photoLibrary];

  v49 = +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:v8];
  v50 = (void *)v8;
  id v58 = [objc_alloc((Class)VCPFaceCropManager) initWithPhotoLibrary:v8 andContext:v49];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  unsigned int v9 = self->_assetEntries;
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v63;
    os_log_type_t type = VCPLogToOSLogType[3];
    long long v55 = v9;
    long long v56 = self;
    uint64_t v54 = *(void *)v63;
    while (2)
    {
      id v13 = 0;
      id v59 = v11;
      do
      {
        if (*(void *)v63 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v62 + 1) + 8 * (void)v13);
        uint64_t v16 = +[VCPWatchdog sharedWatchdog];
        [v16 pet];

        uint64_t v17 = [(MADProcessingTask *)self cancelBlock];
        if (v17)
        {
          uint64_t v18 = (void *)v17;
          v19 = [(MADProcessingTask *)self cancelBlock];
          char v20 = v19[2]();

          if (v20)
          {
            goto LABEL_34;
          }
        }
        uint64_t v21 = [v14 resource];
        if (v21)
        {
          uint64_t v22 = (void *)v21;
          unsigned int v23 = [v14 status];

          if (!v23)
          {
            uint64_t v24 = VCPSignPostLog();
            os_signpost_id_t v25 = os_signpost_id_generate(v24);

            uint64_t v26 = VCPSignPostLog();
            v27 = v26;
            unint64_t v28 = v25 - 1;
            if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "VCPFaceProcessingGenerateFaceCrop", (const char *)&unk_1001F3BD3, buf, 2u);
            }

            id v29 = [v14 downloadURL];
            os_signpost_id_t spid = v25;
            if (v29)
            {
              uint64_t v30 = [v14 downloadURL];
            }
            else
            {
              uint64_t v31 = [v14 resource];
              uint64_t v30 = [v31 privateFileURL];
            }
            os_log_type_t v32 = [v14 faces];
            uint64_t v33 = [v32 allObjects];
            v34 = [v14 asset];
            dispatch_time_t v35 = [v14 resource];
            long long v60 = (void *)v30;
            id v61 = 0;
            unsigned __int8 v36 = [v58 generateAndPersistFaceCropsForFaces:v33 withAsset:v34 resource:v35 resourceURL:v30 error:&v61];
            id v37 = v61;

            self = v56;
            id v11 = v59;
            if ((v36 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
            {
              v38 = VCPLogInstance();
              if (os_log_type_enabled(v38, type))
              {
                int v39 = [v14 asset];
                double v40 = [v39 localIdentifier];
                *(_DWORD *)buf = 138412546;
                uint64_t v67 = v40;
                __int16 v68 = 2112;
                id v69 = v37;
                _os_log_impl((void *)&_mh_execute_header, v38, type, "[FaceCrop][%@] Failed to generate - %@", buf, 0x16u);

                id v11 = v59;
              }
            }
            v41 = VCPSignPostLog();
            os_log_type_t v42 = v41;
            if (v28 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_END, spid, "VCPFaceProcessingGenerateFaceCrop", (const char *)&unk_1001F3BD3, buf, 2u);
            }

            v43 = [v14 downloadURL];

            uint64_t v12 = v54;
            unsigned int v9 = v55;
            if (v43)
            {
              uint64_t v44 = [v14 downloadURL];
              +[PHAssetResourceManager vcp_flushResourceURL:v44];

              id v11 = v59;
              [v14 setDownloadURL:0];
            }
          }
        }
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v62 objects:v70 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_34:

  v45 = VCPSignPostLog();
  os_log_type_t v46 = v45;
  if (v48 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_INTERVAL_END, v47, "MADPhotosFaceCropGenerationTask_Process", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  [v52 stop];
  [v52 elapsedTimeSeconds];
  objc_msgSend(v51, "accumulateDoubleValue:forField:andEvent:", @"TotalAnalyzingTimeInSeconds", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
  objc_msgSend(v51, "accumulateInt64Value:forField:andEvent:", -[NSArray count](self->_assetEntries, "count"), @"NumberOfFacecropsGenerated", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadStateChange, 0);
  objc_storeStrong((id *)&self->_downloadRequestIDs, 0);
  objc_storeStrong((id *)&self->_downloadStateQueue, 0);
  objc_storeStrong((id *)&self->_downloadGroup, 0);
  objc_storeStrong((id *)&self->_assetEntries, 0);
  objc_storeStrong((id *)&self->_faces, 0);
}

@end