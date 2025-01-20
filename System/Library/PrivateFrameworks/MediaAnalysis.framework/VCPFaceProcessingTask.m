@interface VCPFaceProcessingTask
+ (BOOL)_concurrentFaceProcessing;
+ (BOOL)_concurrentFaceStagings;
+ (id)taskWithPhotoLibrary:(id)a3 andContext:(id)a4 andCancelBlock:(id)a5;
+ (unint64_t)_concurrentFaceProcessingThreadCount;
- (BOOL)_copyResourceFromURL:(id)a3 toURL:(id *)a4 forAsset:(id)a5 error:(id *)a6;
- (BOOL)allowStreaming;
- (BOOL)autoCancellable;
- (BOOL)isCancelled;
- (PHPhotoLibrary)photoLibrary;
- (VCPDatabaseWriter)database;
- (VCPFaceProcessingTask)init;
- (VCPFaceProcessingTask)initWithPhotoLibrary:(id)a3 andContext:(id)a4 andCancelBlock:(id)a5;
- (float)resourceRequirement;
- (int)_detectAsset:(id)a3 withResults:(id *)a4 andBatchContext:(id)a5;
- (int)_dispatchAssets:(id)a3 withBatchContext:(id)a4;
- (int)_publishClusterAndPersonProcessingWithBatchContext:(id)a3;
- (int)_recoverAttemptsForAssets:(id)a3 withProcessingStatusMap:(id)a4;
- (int)_removeTemporaryDownloadDirectory;
- (int)flush;
- (int)processAssets:(id)a3;
- (int)processFaceCrops;
- (int)processGalleryPersons:(BOOL *)a3;
- (int)promotePersons;
- (int)promotePets;
- (int)run;
- (void)_asyncAnalyzeAsset:(id)a3 andBatchContext:(id)a4;
- (void)_processDetectionResults:(id)a3 withDetectionStatus:(int)a4 asset:(id)a5 andBatchContext:(id)a6;
- (void)cancel;
- (void)dealloc;
- (void)setAllowStreaming:(BOOL)a3;
@end

@implementation VCPFaceProcessingTask

- (VCPFaceProcessingTask)init
{
  return 0;
}

- (VCPFaceProcessingTask)initWithPhotoLibrary:(id)a3 andContext:(id)a4 andCancelBlock:(id)a5
{
  id v9 = a3;
  id v68 = a4;
  v10 = (Block_layout *)a5;
  v75.receiver = self;
  v75.super_class = (Class)VCPFaceProcessingTask;
  v11 = [(VCPFaceProcessingTask *)&v75 init];
  v12 = v11;
  if (v11)
  {
    p_photoLibrary = (id *)&v11->_photoLibrary;
    objc_storeStrong((id *)&v11->_photoLibrary, a3);
    p_context = &v12->_context;
    objc_storeStrong((id *)&v12->_context, a4);
    if (v10) {
      v15 = v10;
    }
    else {
      v15 = &stru_10021CB78;
    }
    v67 = objc_retainBlock(v15);
    v16 = objc_retainBlock(v67);
    id cancelBlock = v12->_cancelBlock;
    v12->_id cancelBlock = v16;

    uint64_t v18 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:*p_photoLibrary];
    database = v12->_database;
    v12->_database = (VCPDatabaseWriter *)v18;

    v20 = (VCPFaceAnalyzer *)[objc_alloc((Class)VCPFaceAnalyzer) initWithContext:*p_context];
    analyzer = v12->_analyzer;
    v12->_analyzer = v20;

    v22 = (VCPFaceCropManager *)[objc_alloc((Class)VCPFaceCropManager) initWithPhotoLibrary:*p_photoLibrary andContext:*p_context];
    faceCropManager = v12->_faceCropManager;
    v12->_faceCropManager = v22;

    if (objc_msgSend(v9, "mad_useVUGallery"))
    {
      if (objc_msgSend(*p_photoLibrary, "vcp_isSyndicationLibrary"))
      {
        v24 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
        v25 = objc_msgSend(v24, "vcp_visionCacheStorageDirectoryURL");

        v26 = [sub_1000C1B90() syndication];
      }
      else
      {
        uint64_t v33 = objc_msgSend(*p_photoLibrary, "vcp_visionCacheStorageDirectoryURL");
        v26 = [sub_1000C1B90() photos];
        v25 = v33;
      }
      uint64_t v76 = 0;
      v77 = &v76;
      uint64_t v78 = 0x2050000000;
      v34 = (void *)qword_100252680;
      uint64_t v79 = qword_100252680;
      if (!qword_100252680)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v81 = sub_1000CAB24;
        v82 = &unk_100219E10;
        v83 = &v76;
        sub_1000CAB24((uint64_t)&buf);
        v34 = (void *)v77[3];
      }
      v35 = v34;
      _Block_object_dispose(&v76, 8);
      id v72 = 0;
      v36 = (GDVUVisualUnderstandingService *)[[v35 alloc] initWithClient:v26 version:1 url:v25 error:&v72];
      publishDetectionAndProcessPersonQueue = (OS_dispatch_queue *)v72;
      vuService = v12->_vuService;
      v12->_vuService = v36;

      if (!v12->_vuService)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v65 = VCPLogInstance();
          os_log_type_t v66 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v65, v66))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = publishDetectionAndProcessPersonQueue;
            _os_log_impl((void *)&_mh_execute_header, v65, v66, "Failed to create GDVUVisualUnderstandingService - %@", (uint8_t *)&buf, 0xCu);
          }
        }
        v27 = 0;
        goto LABEL_21;
      }
      if (![v68 skipGallerySyncing])
      {
        id v39 = objc_alloc_init((Class)VCPTimeMeasurement);
        [v39 start];
        qos_class_t v40 = qos_class_self();
        v41 = dispatch_get_global_queue(v40, 0);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000C1C74;
        block[3] = &unk_100219D70;
        v70 = v12;
        id v71 = v39;
        id v42 = v39;
        dispatch_async(v41, block);
      }
    }
    else
    {
      id v28 = objc_alloc((Class)VCPFaceClusterer);
      id v29 = *p_photoLibrary;
      v30 = *p_context;
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_1000C1B2C;
      v73[3] = &unk_10021BF40;
      v74 = v67;
      v31 = (VCPFaceClusterer *)[v28 initWithPhotoLibrary:v29 context:v30 cancelOrExtendTimeoutBlock:v73];
      faceClusterer = v12->_faceClusterer;
      v12->_faceClusterer = v31;

      v25 = v74;
    }

    dispatch_group_t v43 = dispatch_group_create();
    downloadGroup = v12->_downloadGroup;
    v12->_downloadGroup = (OS_dispatch_group *)v43;

    dispatch_group_t v45 = dispatch_group_create();
    detectionGroup = v12->_detectionGroup;
    v12->_detectionGroup = (OS_dispatch_group *)v45;

    v47 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v48 = dispatch_queue_create("com.apple.mediaanalysis.detectionQueue", v47);
    detectionQueue = v12->_detectionQueue;
    v12->_detectionQueue = (OS_dispatch_queue *)v48;

    v50 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v51 = dispatch_queue_create("com.apple.mediaanalysis.postDetectionQueue", v50);
    postDetectionQueue = v12->_postDetectionQueue;
    v12->_postDetectionQueue = (OS_dispatch_queue *)v51;

    v12->_detectionProcessingJobCount = 0;
    v12->_detectionProcessingQueuesAllowed = 0;
    v53 = +[NSMutableArray array];
    for (unint64_t i = 0; i < (unint64_t)[(id)objc_opt_class() _concurrentFaceProcessingThreadCount]; ++i)
    {
      id v55 = +[NSString stringWithFormat:@"com.apple.mediaanalysis.detectionQueue%lu", i];
      v56 = dispatch_queue_create((const char *)[v55 UTF8String], 0);
      qos_class_t v57 = qos_class_self();
      v58 = dispatch_get_global_queue(v57, 0);
      dispatch_set_target_queue(v56, v58);

      [(NSArray *)v53 addObject:v56];
    }
    detectionProcessingQueues = v12->_detectionProcessingQueues;
    v12->_detectionProcessingQueues = v53;
    v26 = v53;

    v12->_publishDetectionAndProcessPersonStatus = 0;
    dispatch_group_t v60 = dispatch_group_create();
    publishDetectionAndProcessPersonGroup = v12->_publishDetectionAndProcessPersonGroup;
    v12->_publishDetectionAndProcessPersonGroup = (OS_dispatch_group *)v60;

    v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v62 = dispatch_queue_create("com.apple.mediaanalysis.processPersonQueue", v25);
    publishDetectionAndProcessPersonQueue = v12->_publishDetectionAndProcessPersonQueue;
    v12->_publishDetectionAndProcessPersonQueue = (OS_dispatch_queue *)v62;
    v27 = v12;
LABEL_21:

    goto LABEL_22;
  }
  v27 = 0;
LABEL_22:
  v63 = v27;

  return v63;
}

+ (id)taskWithPhotoLibrary:(id)a3 andContext:(id)a4 andCancelBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v7 andContext:v8 andCancelBlock:v9];

  return v10;
}

- (void)dealloc
{
  [(VCPFaceProcessingTask *)self _removeTemporaryDownloadDirectory];
  v3.receiver = self;
  v3.super_class = (Class)VCPFaceProcessingTask;
  [(VCPFaceProcessingTask *)&v3 dealloc];
}

- (float)resourceRequirement
{
  return 1.0;
}

- (void)cancel
{
}

- (BOOL)isCancelled
{
  if ((*((uint64_t (**)(void))self->_cancelBlock + 2))()) {
    return 1;
  }
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_cancel);
  return v4 & 1;
}

- (int)_removeTemporaryDownloadDirectory
{
  v2 = +[NSFileManager defaultManager];
  objc_super v3 = NSTemporaryDirectory();
  unsigned __int8 v4 = [v3 stringByAppendingPathComponent:kDownloadCacheDirectory];
  v5 = +[NSURL fileURLWithPath:v4];

  v6 = [v5 path];
  unsigned __int8 v7 = [v2 fileExistsAtPath:v6 isDirectory:0];

  if (v7)
  {
    id v15 = 0;
    unsigned __int8 v8 = [v2 removeItemAtURL:v5 error:&v15];
    id v9 = v15;
    if ((v8 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v10 = VCPLogInstance();
        os_log_type_t v11 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v10, v11))
        {
          *(_DWORD *)long long buf = 138412546;
          v17 = v5;
          __int16 v18 = 2112;
          v19 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, v11, "Failed to remove temporary download directory %@ - %@", buf, 0x16u);
        }
      }
      int v12 = -36;
      goto LABEL_12;
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 7)
    {
      int v12 = 0;
      goto LABEL_14;
    }
    id v9 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v9, v13))
    {
      *(_DWORD *)long long buf = 138412290;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, v13, "Temporary download directory %@ does not exist", buf, 0xCu);
    }
  }
  int v12 = 0;
LABEL_12:

LABEL_14:
  return v12;
}

+ (BOOL)_concurrentFaceProcessing
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100252668, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100252668))
  {
    byte_100252660 = DeviceHasANE();
    __cxa_guard_release(&qword_100252668);
  }
  return byte_100252660;
}

+ (unint64_t)_concurrentFaceProcessingThreadCount
{
  return 4;
}

+ (BOOL)_concurrentFaceStagings
{
  return 0;
}

- (int)_detectAsset:(id)a3 withResults:(id *)a4 andBatchContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  *a4 = 0;
  if (![(VCPFaceProcessingTask *)self isCancelled])
  {
    os_log_type_t v11 = [v8 adjustmentVersion];

    if (!v11)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v10 = -23803;
        goto LABEL_46;
      }
      id v15 = VCPLogInstance();
      os_log_type_t v18 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v15, v18))
      {
        v19 = [v8 localIdentifier];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v51 = (uint64_t)v19;
        _os_log_impl((void *)&_mh_execute_header, v15, v18, "[%@] Adjustment version is nil", buf, 0xCu);
      }
      int v10 = -23803;
LABEL_45:

      goto LABEL_46;
    }
    int v12 = [v9 completedLocalIdentifiersFromComputeSync];
    os_log_type_t v13 = [v8 localIdentifier];
    unsigned int v14 = [v12 containsObject:v13];

    if (v14)
    {
      if ((int)MediaAnalysisLogLevel() < 6)
      {
        int v10 = 0;
        goto LABEL_46;
      }
      id v15 = VCPLogInstance();
      os_log_type_t v16 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v15, v16))
      {
        v17 = [v8 localIdentifier];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v51 = (uint64_t)v17;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "[Face][%@] Analysis already complete from compute sync ingestion; skipping",
          buf,
          0xCu);
      }
      int v10 = 0;
      goto LABEL_45;
    }
    v20 = [v8 localIdentifier];
    id v15 = [v9 resourceForLocalIdentifier:v20];

    v21 = [v15 resourceURL];
    if (!v21
      || (+[NSFileManager defaultManager],
          v22 = objc_claimAutoreleasedReturnValue(),
          [v21 path],
          v23 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v24 = [v22 fileExistsAtPath:v23],
          v23,
          v22,
          (v24 & 1) == 0))
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v10 = -23802;
LABEL_44:

        goto LABEL_45;
      }
      v34 = VCPLogInstance();
      os_log_type_t v40 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v34, v40))
      {
        v41 = [v8 localIdentifier];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v51 = (uint64_t)v41;
        _os_log_impl((void *)&_mh_execute_header, v34, v40, "[%@] No local resource", buf, 0xCu);
      }
      int v10 = -23802;
LABEL_43:

      goto LABEL_44;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v25 = VCPLogInstance();
      os_log_type_t v26 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v25, v26))
      {
        spida = [v8 localIdentifier];
        objc_msgSend(v8, "vcp_typeDescription");
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        id v28 = [v15 resource];
        *(_DWORD *)long long buf = 138413058;
        uint64_t v51 = (uint64_t)spida;
        __int16 v52 = 2112;
        *(void *)v53 = v27;
        *(_WORD *)&v53[8] = 2048;
        id v54 = [v28 type];
        __int16 v55 = 2112;
        v56 = v21;
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "[Face][%@] Analyzing %@ using resource (%lu) %@", buf, 0x2Au);
      }
    }
    id v29 = VCPSignPostLog();
    os_signpost_id_t spid = os_signpost_id_generate(v29);

    v30 = VCPSignPostLog();
    v31 = v30;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPFaceProcessingAnalyzeAsset", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    analyzer = self->_analyzer;
    uint64_t v33 = [v15 resource];
    id v49 = 0;
    int v10 = [(VCPFaceAnalyzer *)analyzer analyzeAsset:v8 withResource:v33 resourceURL:v21 isBestResource:[v15 isBestResource] quickMode:0 results:&v49];
    v34 = v49;

    if (!v10 && v34)
    {
      v35 = [v34 objectForKeyedSubscript:@"ImageTooSmall"];
      unsigned int v46 = [v35 BOOLValue];

      unsigned int v36 = [v15 isBestResource];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v37 = VCPLogInstance();
        os_log_type_t v38 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v37, v38))
        {
          uint64_t v39 = [v8 localIdentifier];
          *(_DWORD *)long long buf = 138412802;
          uint64_t v51 = v39;
          __int16 v52 = 1024;
          *(_DWORD *)v53 = v46;
          *(_WORD *)&v53[4] = 1024;
          *(_DWORD *)&v53[6] = v36;
          dispatch_group_t v45 = (void *)v39;
          _os_log_impl((void *)&_mh_execute_header, v37, v38, "[%@] Resource Too Small: %d; Best Resource: %d",
            buf,
            0x18u);
        }
      }
      if ((v46 ^ 1 | v36))
      {
        int v10 = 0;
      }
      else
      {
        int v10 = -23802;
        if (!_os_feature_enabled_impl()) {
          goto LABEL_39;
        }
      }
      *a4 = v34;
    }
LABEL_39:
    id v42 = VCPSignPostLog();
    dispatch_group_t v43 = v42;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, spid, "VCPFaceProcessingAnalyzeAsset", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    goto LABEL_43;
  }
  int v10 = -128;
LABEL_46:

  return v10;
}

- (void)_processDetectionResults:(id)a3 withDetectionStatus:(int)a4 asset:(id)a5 andBatchContext:(id)a6
{
  v65 = self;
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v69 = +[VCPMADCoreAnalyticsManager sharedManager];
  int v12 = [v11 completedLocalIdentifiersFromComputeSync];
  os_log_type_t v13 = [v10 localIdentifier];
  unsigned int v14 = [v12 containsObject:v13];

  if (!v14)
  {
    v19 = [v10 localIdentifier];
    v20 = [v11 resourceForLocalIdentifier:v19];

    id v68 = v20;
    if ([v20 requestDownload])
    {
      v21 = [v20 resourceURL];
      if (v21)
      {
        v22 = +[NSFileManager defaultManager];
        id v70 = 0;
        unsigned __int8 v23 = [v22 removeItemAtURL:v21 error:&v70];
        id v24 = v70;

        if ((v23 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
        {
          v25 = VCPLogInstance();
          os_log_type_t v26 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v25, v26))
          {
            id v27 = [v10 localIdentifier];
            *(_DWORD *)long long buf = 138412802;
            uint64_t v76 = v27;
            __int16 v77 = 2112;
            *(void *)uint64_t v78 = v21;
            *(_WORD *)&v78[8] = 2112;
            id v79 = v24;
            _os_log_impl((void *)&_mh_execute_header, v25, v26, "[%@] Failed to remove downloaded resource %@ - %@", buf, 0x20u);
          }
        }
      }
      else
      {
        id v24 = 0;
      }
    }
    if (!v9 || a4)
    {
      int v44 = _os_feature_enabled_impl();
      if (v9) {
        int v45 = v44;
      }
      else {
        int v45 = 0;
      }
      if (a4 == -23802 && v45)
      {
        v71[0] = @"version";
        unsigned int v46 = [v10 photoLibrary];
        v47 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v46, "mad_faceProcessingInternalVersion"));
        v72[0] = v47;
        v71[1] = @"dateAnalyzed";
        dispatch_queue_t v48 = +[NSDate date];
        v72[1] = v48;
        v72[2] = &off_10022DDF8;
        v71[2] = @"performedAnalysisTypes";
        v71[3] = @"metadataRanges";
        v72[3] = v9;
        id v49 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:4];

        v50 = [v11 changeBatch];
        [v50 updateAsset:v10 withAnalysis:v49];
      }
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        uint64_t v51 = VCPLogInstance();
        os_log_type_t v52 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v51, v52))
        {
          v53 = [v10 localIdentifier];
          unsigned int v54 = [v20 downloadStatus];
          *(_DWORD *)long long buf = 138412802;
          uint64_t v76 = v53;
          __int16 v77 = 1024;
          *(_DWORD *)uint64_t v78 = a4;
          *(_WORD *)&v78[4] = 1024;
          *(_DWORD *)&v78[6] = v54;
          _os_log_impl((void *)&_mh_execute_header, v51, v52, "[%@] Analysis failed (detection:%d) (download:%d)", buf, 0x18u);
        }
      }
      v31 = @"NumberOfAssetsSoftFailure";
      if (a4 == -23802)
      {
        if ([v20 requestDownload]
          && [v20 downloadStatus] == -23808)
        {
          __int16 v55 = &VCPAnalyticsFieldNumberOfAssetsDownloadThrottled;
          uint64_t v56 = 7;
        }
        else
        {
          __int16 v55 = &VCPAnalyticsFieldNumberOfAssetsNoResource;
          uint64_t v56 = 2;
        }
        v58 = *v55;

        v31 = v58;
      }
      else
      {
        uint64_t v56 = 3;
      }
      v59 = objc_msgSend(v11, "processingStatusMap", v65);
      dispatch_group_t v60 = [v10 localIdentifier];
      uint64_t v39 = [v59 objectForKeyedSubscript:v60];

      v61 = [v39 currentAttemptDate];
      v41 = objc_msgSend(v10, "mad_nextAttemptDateForStatus:currentAttemptDate:attemptCount:", v56, v61, (char *)objc_msgSend(v39, "previousAttempts") + 1);

      dispatch_queue_t v62 = *(void **)(v67 + 160);
      v63 = [v10 localIdentifier];
      [v62 updateProcessingStatus:v56 andNextAttemptDate:v41 forLocalIdentifier:v63 andTaskID:3];

      if (a4 != -128)
      {
        v64 = [v11 unprocessedAssets];
        [v64 removeObject:v10];
      }
      [v69 accumulateInt64Value:1 forField:v31 andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
    }
    else
    {
      v73[0] = @"version";
      id v28 = [v10 photoLibrary];
      id v29 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v28, "mad_faceProcessingInternalVersion"));
      v74[0] = v29;
      v73[1] = @"dateAnalyzed";
      v30 = +[NSDate date];
      v74[1] = v30;
      v74[2] = &off_10022DDF8;
      v73[2] = @"performedAnalysisTypes";
      v73[3] = @"metadataRanges";
      v74[3] = v9;
      v31 = +[NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:4];

      v32 = [v11 changeBatch];
      unsigned int v33 = [v32 updateAsset:v10 withAnalysis:v31];

      if (!v33)
      {
        qos_class_t v57 = [v11 processedAssets];
        [v57 addObject:v10];

        [v69 accumulateInt64Value:1 forField:@"NumberOfAssetsAnalyzed" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
LABEL_46:

        goto LABEL_47;
      }
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v34 = VCPLogInstance();
        os_log_type_t v35 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v34, v35))
        {
          unsigned int v36 = [v10 localIdentifier];
          *(_DWORD *)long long buf = 138412546;
          uint64_t v76 = v36;
          __int16 v77 = 1024;
          *(_DWORD *)uint64_t v78 = v33;
          _os_log_impl((void *)&_mh_execute_header, v34, v35, "[%@] Analysis failed to update change (%d)", buf, 0x12u);
        }
      }
      v37 = objc_msgSend(v11, "processingStatusMap", v65);
      os_log_type_t v38 = [v10 localIdentifier];
      uint64_t v39 = [v37 objectForKeyedSubscript:v38];

      os_log_type_t v40 = [v39 currentAttemptDate];
      v41 = objc_msgSend(v10, "mad_nextAttemptDateForStatus:currentAttemptDate:attemptCount:", 3, v40, (char *)objc_msgSend(v39, "previousAttempts") + 1);

      id v42 = *(void **)(v66 + 160);
      dispatch_group_t v43 = [v10 localIdentifier];
      [v42 updateProcessingStatus:3 andNextAttemptDate:v41 forLocalIdentifier:v43 andTaskID:3];

      [v69 accumulateInt64Value:1 forField:@"NumberOfAssetsSoftFailure" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
    }

    goto LABEL_46;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v15 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      v17 = objc_msgSend(v10, "localIdentifier", v65);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v76 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[%@] Analysis already complete from compute sync ingestion; skip updating change batch",
        buf,
        0xCu);
    }
  }
  os_log_type_t v18 = objc_msgSend(v11, "processedAssets", v65);
  [v18 addObject:v10];

  [v69 accumulateInt64Value:1 forField:@"NumberOfAssetsAnalyzed" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
LABEL_47:
}

- (void)_asyncAnalyzeAsset:(id)a3 andBatchContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  detectionQueue = self->_detectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C3548;
  block[3] = &unk_10021BF68;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(detectionQueue, block);
}

- (BOOL)_copyResourceFromURL:(id)a3 toURL:(id *)a4 forAsset:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v31 = a5;
  id v10 = +[NSFileManager defaultManager];
  id v11 = NSTemporaryDirectory();
  id v12 = [v11 stringByAppendingPathComponent:kDownloadCacheDirectory];
  id v13 = +[NSURL fileURLWithPath:v12];

  if ([v10 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:a6])
  {
    unsigned int v14 = [v31 localIdentifier];
    id v15 = +[PHObject uuidFromLocalIdentifier:v14];
    os_log_type_t v16 = [v9 pathExtension];
    v17 = +[NSString stringWithFormat:@"%@.%@", v15, v16];

    os_log_type_t v18 = +[NSURL fileURLWithPath:v17 relativeToURL:v13];
    unsigned int v19 = [v10 copyItemAtURL:v9 toURL:v18 error:a6];
    if (v19)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v20 = VCPLogInstance();
        os_log_type_t v21 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v20, v21))
        {
          v22 = [v31 localIdentifier];
          *(_DWORD *)long long buf = 138412802;
          unsigned int v33 = v22;
          __int16 v34 = 2112;
          id v35 = v9;
          __int16 v36 = 2112;
          id v37 = v18;
          _os_log_impl((void *)&_mh_execute_header, v20, v21, "[%@] Succesfully copied downloaded file from %@ to %@", buf, 0x20u);
        }
      }
      *a4 = v18;
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      os_log_type_t v26 = VCPLogInstance();
      os_log_type_t v27 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v26, v27))
      {
        id v28 = [v31 localIdentifier];
        id v29 = *a6;
        *(_DWORD *)long long buf = 138413058;
        unsigned int v33 = v28;
        __int16 v34 = 2112;
        id v35 = v9;
        __int16 v36 = 2112;
        id v37 = v18;
        __int16 v38 = 2112;
        id v39 = v29;
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "[%@] Failed to copy downloaded file from %@ to %@ - %@", buf, 0x2Au);
      }
    }

LABEL_18:
    goto LABEL_19;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v17 = VCPLogInstance();
    os_log_type_t v23 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v17, v23))
    {
      id v24 = [v31 localIdentifier];
      id v25 = *a6;
      *(_DWORD *)long long buf = 138412802;
      unsigned int v33 = v24;
      __int16 v34 = 2112;
      id v35 = v13;
      __int16 v36 = 2112;
      id v37 = v25;
      _os_log_impl((void *)&_mh_execute_header, v17, v23, "[%@] Failed to create directory %@ to store downloaded files - %@", buf, 0x20u);
    }
    LOBYTE(v19) = 0;
    goto LABEL_18;
  }
  LOBYTE(v19) = 0;
LABEL_19:

  return v19;
}

- (int)_dispatchAssets:(id)a3 withBatchContext:(id)a4
{
  id v6 = a3;
  id v72 = a4;
  [v72 setHasPanorama:0];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v93 objects:v101 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v94;
    do
    {
      id v9 = 0;
      id v10 = v4;
      do
      {
        if (*(void *)v94 != v8) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v93 + 1) + 8 * (void)v9);
        if (([v72 hasPanorama] & 1) == 0 && objc_msgSend(v11, "vcp_isPano")) {
          [v72 setHasPanorama:1];
        }
        id v13 = [v72 unprocessedAssets];
        [v13 addObject:v11];

        *(void *)long long buf = 0;
        int v92 = 0;
        database = self->_database;
        id v91 = 0;
        id v15 = [v11 localIdentifier];
        id v4 = (id)[(VCPDatabaseWriter *)database queryProcessingStatus:buf attempts:&v92 lastAttemptDate:&v91 andNextAttemptDate:0 forLocalIdentifier:v15 andTaskID:3];
        id v16 = v91;

        if (v4)
        {
          int v17 = 0;
        }
        else
        {
          os_log_type_t v18 = +[VCPFaceAssetProcessingStatusEntry entryWithPreviousStatus:*(void *)buf previousAttempts:v92 andLastAttemptDate:v16];
          unsigned int v19 = [v72 processingStatusMap];
          v20 = [v11 localIdentifier];
          [v19 setObject:v18 forKeyedSubscript:v20];

          os_log_type_t v21 = self->_database;
          uint64_t v22 = v92;
          os_log_type_t v23 = +[NSDate now];
          id v4 = (id)[(VCPDatabaseWriter *)v21 setAttempts:v22 + 1 asset:v11 taskID:3 status:1 lastAttemptDate:v23];

          int v17 = 0;
          if (v4 != -108 && v4 != -36 && v4 != -23)
          {
            int v17 = 1;
            id v4 = v10;
          }
        }

        if (!v17) {
          goto LABEL_62;
        }
        id v9 = (char *)v9 + 1;
        id v10 = v4;
      }
      while (v7 != v9);
      id v24 = [obj countByEnumeratingWithState:&v93 objects:v101 count:16];
      id v7 = v24;
    }
    while (v24);
  }

  LODWORD(v4) = [(VCPDatabaseWriter *)self->_database commit];
  if (!v4)
  {
    if ([(id)objc_opt_class() _concurrentFaceProcessing]
      && ([v72 hasPanorama] & 1) == 0)
    {
      id v26 = [(id)objc_opt_class() _concurrentFaceProcessingThreadCount];
      unint64_t v25 = 4;
      if ((unint64_t)v26 < 4) {
        unint64_t v25 = (unint64_t)v26;
      }
    }
    else
    {
      unint64_t v25 = 1;
    }
    self->_detectionProcessingQueuesAllowed = v25;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v66 = obj;
    id v27 = [v66 countByEnumeratingWithState:&v87 objects:v100 count:16];
    if (v27)
    {
      uint64_t v69 = *(void *)v88;
      os_log_type_t v63 = VCPLogToOSLogType[4];
      os_log_type_t type = VCPLogToOSLogType[5];
      do
      {
        id v70 = v27;
        for (unint64_t i = 0; i != v70; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v88 != v69) {
            objc_enumerationMutation(v66);
          }
          id v29 = *(void **)(*((void *)&v87 + 1) + 8 * i);
          id v31 = +[VCPWatchdog sharedWatchdog];
          [v31 pet];

          v32 = +[VCPFaceUtils preferredResourcesForFaceProcessingWithAsset:v29];
          unsigned int v33 = [v72 processingStatusMap];
          __int16 v34 = [v29 localIdentifier];
          id v35 = [v33 objectForKeyedSubscript:v34];

          if (v35 && ![v35 previousAttempts] && _os_feature_enabled_impl())
          {
            uint64_t v36 = objc_msgSend(v32, "vcp_thumbnailResource");
          }
          else
          {
            uint64_t v36 = +[VCPFaceUtils resourceForFaceProcessing:v32 allowStreaming:self->_allowStreaming];
          }
          id v37 = (void *)v36;
          id v38 = +[VCPFaceUtils isBestResourceForFaceProcessing:v36 fromResources:v32];
          if (!v37)
          {
            dispatch_group_enter((dispatch_group_t)self->_detectionGroup);
LABEL_45:
            int v45 = [v37 privateFileURL];
            unsigned int v46 = [v29 localIdentifier];
            [v72 storeResource:v37 resourceURL:v45 isBestResource:v38 requestDownload:0 downloadStatus:0 forLocalIdentifier:v46];

            [(VCPFaceProcessingTask *)self _asyncAnalyzeAsset:v29 andBatchContext:v72];
            goto LABEL_59;
          }
          unsigned __int8 v39 = objc_msgSend(v37, "vcp_isLocallyAvailable");
          dispatch_group_enter((dispatch_group_t)self->_detectionGroup);
          if (v39) {
            goto LABEL_45;
          }
          os_log_type_t v40 = +[PHAssetResource vcp_allResourcesForAsset:v29];
          id v71 = objc_msgSend(v40, "mad_computeSyncResource");

          if (!v71) {
            goto LABEL_50;
          }
          v86[0] = _NSConcreteStackBlock;
          v86[1] = 3221225472;
          v86[2] = sub_1000C47C8;
          v86[3] = &unk_100219D98;
          v86[4] = self;
          if (!objc_msgSend(v71, "mad_isAnalysisCompleteFromComputeSyncForAsset:taskID:allowDownload:cancel:", v29, 3, 1, v86))
          {
            if ((int)MediaAnalysisLogLevel() >= 5)
            {
              v47 = VCPLogInstance();
              if (os_log_type_enabled(v47, type))
              {
                dispatch_queue_t v48 = [v29 localIdentifier];
                *(_DWORD *)long long buf = 138412290;
                *(void *)&uint8_t buf[4] = v48;
                _os_log_impl((void *)&_mh_execute_header, v47, type, "[Face][Download][%@] Analysis remains incomplete with compute sync, falling back to media resource download", buf, 0xCu);
              }
            }
LABEL_50:
            v84[0] = _NSConcreteStackBlock;
            v84[1] = 3221225472;
            v84[2] = sub_1000C47D0;
            v84[3] = &unk_100219FC8;
            id v49 = v72;
            id v85 = v49;
            uint64_t v67 = objc_retainBlock(v84);
            v80[0] = _NSConcreteStackBlock;
            v80[1] = 3221225472;
            v80[2] = sub_1000C4830;
            v80[3] = &unk_10021CBC8;
            v80[4] = self;
            v80[5] = v29;
            id v50 = v49;
            id v81 = v50;
            id v51 = v37;
            id v82 = v51;
            char v83 = (char)v38;
            id v68 = objc_retainBlock(v80);
            v74[0] = _NSConcreteStackBlock;
            v74[1] = 3221225472;
            v74[2] = sub_1000C496C;
            v74[3] = &unk_10021CBF0;
            id v52 = v50;
            id v75 = v52;
            id v53 = v51;
            char v79 = (char)v38;
            id v76 = v53;
            __int16 v77 = v29;
            uint64_t v78 = self;
            unsigned int v54 = objc_retainBlock(v74);
            dispatch_group_enter((dispatch_group_t)self->_downloadGroup);
            id v55 = +[PHAssetResourceManager vcp_requestFileURLForAssetResource:v53 withTaskID:3 timeoutHandler:v67 urlHandler:v68 andCompletionHandler:v54];
            if (v55)
            {
              uint64_t v56 = +[NSNumber numberWithInt:v55];
              qos_class_t v57 = [v52 downloadRequests];
              v58 = [v29 localIdentifier];
              [v57 setObject:v56 forKeyedSubscript:v58];

              [v52 updateLastestDownloadTimestamp];
            }
            else
            {
              dispatch_group_leave((dispatch_group_t)self->_downloadGroup);
              if ((int)MediaAnalysisLogLevel() >= 4)
              {
                v59 = VCPLogInstance();
                if (os_log_type_enabled(v59, v63))
                {
                  uint64_t v60 = [v29 localIdentifier];
                  *(_DWORD *)long long buf = 138412546;
                  *(void *)&uint8_t buf[4] = v60;
                  __int16 v98 = 2112;
                  id v99 = v53;
                  v61 = (void *)v60;
                  _os_log_impl((void *)&_mh_execute_header, v59, v63, "[%@] Failed to request download resource %@", buf, 0x16u);
                }
              }
              [(VCPFaceProcessingTask *)self _asyncAnalyzeAsset:v29 andBatchContext:v52];
            }

            goto LABEL_58;
          }
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            v41 = VCPLogInstance();
            if (os_log_type_enabled(v41, type))
            {
              id v42 = [v29 localIdentifier];
              *(_DWORD *)long long buf = 138412290;
              *(void *)&uint8_t buf[4] = v42;
              _os_log_impl((void *)&_mh_execute_header, v41, type, "[Face][Download][%@] Analysis complete with compute sync, skipping media resource download", buf, 0xCu);
            }
          }
          dispatch_group_t v43 = [v72 completedLocalIdentifiersFromComputeSync];
          int v44 = [v29 localIdentifier];
          [v43 addObject:v44];

          [(VCPFaceProcessingTask *)self _asyncAnalyzeAsset:v29 andBatchContext:v72];
LABEL_58:

LABEL_59:
        }
        id v27 = [v66 countByEnumeratingWithState:&v87 objects:v100 count:16];
      }
      while (v27);
    }
    LODWORD(v4) = 0;
LABEL_62:
  }
  return (int)v4;
}

- (int)processAssets:(id)a3
{
  id v4 = a3;
  id v6 = +[VCPFaceProcessingBatchContext batchContextWithPhotoLibrary:self->_photoLibrary clusterer:self->_faceClusterer andContext:self->_context];
  if (v6)
  {
    id v32 = objc_alloc_init((Class)VCPTimeMeasurement);
    [v32 start];
    id v7 = objc_alloc_init((Class)VCPTimeMeasurement);
    [v7 start];
    int v8 = [(VCPFaceProcessingTask *)self _dispatchAssets:v4 withBatchContext:v6];
    if (v8) {
      goto LABEL_41;
    }
    downloadGroup = self->_downloadGroup;
    dispatch_time_t v10 = dispatch_time(0, 100000000);
    if (dispatch_group_wait(downloadGroup, v10))
    {
      os_log_type_t v11 = VCPLogToOSLogType[7];
      do
      {
        if ([(VCPFaceProcessingTask *)self isCancelled]
          || [v6 downloadTimedout])
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            id v12 = VCPLogInstance();
            if (os_log_type_enabled(v12, v11))
            {
              id v13 = [v6 downloadRequests];
              id v14 = [v13 count];
              *(_DWORD *)long long buf = 134217984;
              id v34 = v14;
              _os_log_impl((void *)&_mh_execute_header, v12, v11, "Cancelling all %lu download requests", buf, 0xCu);
            }
          }
          id v15 = [v6 downloadRequests];
          [v15 enumerateKeysAndObjectsUsingBlock:&stru_10021CC30];

          dispatch_group_wait((dispatch_group_t)self->_downloadGroup, 0xFFFFFFFFFFFFFFFFLL);
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            id v16 = VCPLogInstance();
            if (os_log_type_enabled(v16, v11))
            {
              int v17 = [v6 downloadRequests];
              id v18 = [v17 count];
              *(_DWORD *)long long buf = 134217984;
              id v34 = v18;
              _os_log_impl((void *)&_mh_execute_header, v16, v11, "Cancelled all %lu download requests", buf, 0xCu);
            }
          }
        }
        unsigned int v19 = self->_downloadGroup;
        dispatch_time_t v20 = dispatch_time(0, 100000000);
      }
      while (dispatch_group_wait(v19, v20));
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      os_log_type_t v21 = VCPLogInstance();
      os_log_type_t v22 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v21, v22))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Waiting for detection-group to finish", buf, 2u);
      }
    }
    dispatch_group_wait((dispatch_group_t)self->_detectionGroup, 0xFFFFFFFFFFFFFFFFLL);
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      os_log_type_t v23 = VCPLogInstance();
      os_log_type_t v24 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v23, v24))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "Detection-group finished", buf, 2u);
      }
    }
    [v7 stop];
    unint64_t v25 = +[VCPMADCoreAnalyticsManager sharedManager];
    [v7 elapsedTimeSeconds];
    objc_msgSend(v25, "accumulateDoubleValue:forField:andEvent:", @"FaceDetectionElapsedTimeInSeconds", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

    int v8 = [(VCPFaceProcessingTask *)self _publishClusterAndPersonProcessingWithBatchContext:v6];
    if (v8) {
      goto LABEL_41;
    }
    if ([v6 downloadTimedout])
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v26 = VCPLogInstance();
        os_log_type_t v27 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v26, v27))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, v27, "Network error; skip to next batch", buf, 2u);
        }
LABEL_39:
      }
    }
    else
    {
      if ([(VCPFaceProcessingTask *)self isCancelled])
      {
        int v8 = -128;
LABEL_41:

        goto LABEL_42;
      }
      if ([v4 count])
      {
        [v32 stop];
        if ([v6 hasPanorama])
        {
          CFStringRef v28 = @"Serial-With-Panorama";
        }
        else if ([(id)objc_opt_class() _concurrentFaceProcessing])
        {
          CFStringRef v28 = @"Concurrent";
        }
        else
        {
          CFStringRef v28 = @"Serial";
        }
        id v29 = VCPTaskIDDescription(3);
        id v26 = +[NSString stringWithFormat:@"%@-%@-Analyze", v29, v28];

        [v32 elapsedTimeSeconds];
        VCPCoreAnalyticsQoSReportSpeed(v26, v30 * 1000.0 / (double)(unint64_t)[v4 count]);
        goto LABEL_39;
      }
    }
    int v8 = 0;
    goto LABEL_41;
  }
  int v8 = -18;
LABEL_42:

  return v8;
}

- (int)_recoverAttemptsForAssets:(id)a3 withProcessingStatusMap:(id)a4
{
  id v5 = a3;
  id v28 = a4;
  os_log_type_t v24 = v5;
  if (![v5 count]) {
    goto LABEL_31;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    uint64_t v26 = *(void *)v30;
    while (2)
    {
      id v7 = 0;
      id v8 = a4;
      do
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v7);
        os_log_type_t v11 = [v9 localIdentifier];
        id v12 = [v28 objectForKeyedSubscript:v11];

        id v13 = [v12 previousAttempts];
        database = self->_database;
        if (v13)
        {
          id v15 = [v12 previousAttempts];
          id v16 = [v12 previousStatus];
          int v17 = [v12 lastAttemptDate];
          id v18 = (id)[(VCPDatabaseWriter *)database setAttempts:v15 asset:v9 taskID:3 status:v16 lastAttemptDate:v17];
        }
        else
        {
          unsigned int v19 = [v9 localIdentifier];
          id v18 = (id)[(VCPDatabaseWriter *)database removeProcessingStatusForLocalIdentifier:v19 andTaskID:3];
        }
        if (v18 == -108 || v18 == -36)
        {
          a4 = v18;
        }
        else
        {
          a4 = v18;
          if (v18 != -23) {
            a4 = v8;
          }
        }
        BOOL v20 = 0;
        if (v18 != -108 && v18 != -36) {
          BOOL v20 = v18 != -23;
        }

        if (!v20)
        {

          int v21 = (int)a4;
          goto LABEL_32;
        }
        id v7 = (char *)v7 + 1;
        id v8 = a4;
      }
      while (v6 != v7);
      id v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  unsigned int v22 = [(VCPDatabaseWriter *)self->_database commit];
  if (v22 == -108 || v22 == -36)
  {
    int v21 = v22;
  }
  else
  {
    int v21 = v22;
    if (v22 != -23) {
      int v21 = (int)a4;
    }
  }
  if (v22 != -108 && v22 != -36 && v22 != -23) {
LABEL_31:
  }
    int v21 = 0;
LABEL_32:

  return v21;
}

- (int)promotePersons
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000C57D4;
  v12[3] = &unk_100219F30;
  v12[4] = self;
  v12[5] = &v13;
  v2 = objc_retainBlock(v12);
  id v3 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v3 start];
  id v4 = +[VCPMADQoSManager sharedManager];
  [v4 runBlock:v2 withTaskID:3];

  [v3 stop];
  id v5 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v3 elapsedTimeSeconds];
  objc_msgSend(v5, "accumulateDoubleValue:forField:andEvent:", @"PersonPromotingElapsedTimeInSeconds", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

  id v6 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v6 accumulateInt64Value:1 forField:@"NumberOfPersonPromotingEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

  int v7 = *((_DWORD *)v14 + 6);
  if (v7 && (int)MediaAnalysisLogLevel() >= 3)
  {
    id v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v8, v9))
    {
      int v10 = *((_DWORD *)v14 + 6);
      *(_DWORD *)long long buf = 67109120;
      int v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[FaceProcessing] Failed to promote person - %d", buf, 8u);
    }
  }
  _Block_object_dispose(&v13, 8);
  return v7;
}

- (int)promotePets
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000C5B54;
  v12[3] = &unk_100219F08;
  v12[4] = self;
  v12[5] = &v13;
  v2 = objc_retainBlock(v12);
  id v3 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v3 start];
  id v4 = +[VCPMADQoSManager sharedManager];
  [v4 runBlock:v2 withTaskID:3];

  [v3 stop];
  id v5 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v3 elapsedTimeSeconds];
  objc_msgSend(v5, "accumulateDoubleValue:forField:andEvent:", @"PetPromotingElapsedTimeInSeconds", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

  id v6 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v6 accumulateInt64Value:1 forField:@"NumberOfPetPromotingEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

  int v7 = *((_DWORD *)v14 + 6);
  if (v7 && (int)MediaAnalysisLogLevel() >= 3)
  {
    id v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v8, v9))
    {
      int v10 = *((_DWORD *)v14 + 6);
      *(_DWORD *)long long buf = 67109120;
      int v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[FaceProcessing] Failed to promote pet - %d", buf, 8u);
    }
  }
  _Block_object_dispose(&v13, 8);
  return v7;
}

- (int)processGalleryPersons:(BOOL *)a3
{
  id v4 = +[MADGDUtilities sharedInstance];
  [v4 flush];

  id v5 = [(PHPhotoLibrary *)self->_photoLibrary vcp_description];
  v184 = +[NSString stringWithFormat:@"[FaceLibraryProcessing][Person][%@]", v5];

  v217[0] = _NSConcreteStackBlock;
  v217[1] = 3221225472;
  v217[2] = sub_1000C8380;
  v217[3] = &unk_100219D98;
  v217[4] = self;
  v183 = objc_retainBlock(v217);
  id v6 = [(PHPhotoLibrary *)self->_photoLibrary mad_countOfUnclusteredFaces];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    int v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v184;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "%@ Found %lu faces to add to Gallery", buf, 0x16u);
    }
  }
  if (v6)
  {
    id v9 = objc_alloc_init((Class)VCPTimeMeasurement);
    [v9 start];
    uint64_t v10 = mach_absolute_time();
    os_log_type_t v11 = VCPSignPostLog();
    os_signpost_id_t v12 = os_signpost_id_generate(v11);

    uint64_t v13 = VCPSignPostLog();
    id v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FaceLibraryProcessingSendFaces", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    uint64_t v15 = [(PHPhotoLibrary *)self->_photoLibrary mad_unclusteredFacesFetchOptions];
    v225[0] = PHFacePropertySetIdentifier;
    v225[1] = PHFacePropertySetCore;
    v225[2] = PHFacePropertySetClustering;
    v225[3] = PHFacePropertySetPersonBuilder;
    int v16 = +[NSArray arrayWithObjects:v225 count:4];
    [v15 setFetchPropertySets:v16];

    int v17 = +[PHFace fetchFacesWithOptions:v15];
    int v18 = +[MADGDUtilities sharedInstance];
    unsigned int v19 = [(GDVUVisualUnderstandingService *)self->_vuService gallery];
    id v216 = 0;
    unsigned __int8 v20 = [v18 prepareClusteringWithFaces:v17 gallery:v19 cancelOrExtendTimeoutBlock:v183 error:&v216];
    id v185 = v216;

    if ((v20 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
    {
      int v21 = VCPLogInstance();
      os_log_type_t v22 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v21, v22))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v184;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v185;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "%@ Failed to add faces to Gallery - %@", buf, 0x16u);
      }
    }
    os_log_type_t v23 = VCPSignPostLog();
    os_log_type_t v24 = v23;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, v12, "FaceLibraryProcessingSendFaces", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if (v10)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    [v9 stop];
    unint64_t v25 = +[VCPMADCoreAnalyticsManager sharedManager];
    [v9 elapsedTimeSeconds];
    objc_msgSend(v25, "accumulateDoubleValue:forField:andEvent:", @"FaceClusteringElapsedTimeInSeconds", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

    id v26 = [(PHPhotoLibrary *)self->_photoLibrary mad_countOfUnclusteredFaces];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      os_log_type_t v27 = VCPLogInstance();
      os_log_type_t v28 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v27, v28))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v185;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "%@ Found %lu (expected 0) faces yet to add to Gallery", buf, 0x16u);
      }
    }
    id v29 = v185;
  }
  else
  {
    id v29 = 0;
  }
  v186 = v29;
  +[PNPersonPromoter setProcessed:0 forLibrary:self->_photoLibrary];
  long long v30 = [(GDVUVisualUnderstandingService *)self->_vuService gallery];
  unsigned int v178 = [v30 ready];

  if (v178)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      long long v31 = VCPLogInstance();
      os_log_type_t v32 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v31, v32))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v184;
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "%@ Gallery is ready; skip updating", buf, 0xCu);
      }

      id v29 = v186;
    }
LABEL_50:
    v187 = v29;
    database = self->_database;
    id v211 = 0;
    unsigned int v51 = [(VCPDatabaseWriter *)database queryChangeToken:&v211 forTaskID:3 andChangeTokenType:2];
    id v182 = v211;
    if (v51 && (int)MediaAnalysisLogLevel() >= 3)
    {
      id v52 = VCPLogInstance();
      os_log_type_t v53 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v52, v53))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v184;
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = v51;
        _os_log_impl((void *)&_mh_execute_header, v52, v53, "%@ Failed to query previous MADGDChangeBookmark (code:%d)", buf, 0x12u);
      }
    }
    if (v182)
    {
      uint64_t v218 = 0;
      v219 = &v218;
      uint64_t v220 = 0x2050000000;
      unsigned int v54 = (void *)qword_100252688;
      uint64_t v221 = qword_100252688;
      if (!qword_100252688)
      {
        *(void *)long long buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_1000CAB7C;
        uint64_t v223 = (uint64_t)&unk_100219E10;
        v224[0] = &v218;
        sub_1000CAB7C((uint64_t)buf);
        unsigned int v54 = (void *)v219[3];
      }
      id v55 = v54;
      _Block_object_dispose(&v218, 8);
      id v210 = 0;
      uint64_t v56 = [v55 decodeFromData:v182 error:&v210];
      id v57 = v210;
      if (!v56 && (int)MediaAnalysisLogLevel() >= 3)
      {
        v58 = VCPLogInstance();
        os_log_type_t v59 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v58, v59))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v184;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v57;
          _os_log_impl((void *)&_mh_execute_header, v58, v59, "%@ Failed to retrieve previous MADGDChangeBookmark - %@", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v56 = 0;
    }
    v175 = +[NSMutableSet set];
    if (v56)
    {
      v206[0] = _NSConcreteStackBlock;
      v206[1] = 3221225472;
      v206[2] = sub_1000C851C;
      v206[3] = &unk_10021CCF0;
      id v60 = v175;
      id v207 = v60;
      id v61 = v184;
      id v208 = v61;
      v209 = self;
      dispatch_queue_t v62 = objc_retainBlock(v206);
      vuService = self->_vuService;
      id v205 = 0;
      v181 = [(GDVUVisualUnderstandingService *)vuService changesSince:v56 error:&v205 body:v62];
      id v64 = v205;
      if (!v181)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v65 = VCPLogInstance();
          os_log_type_t v66 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v65, v66))
          {
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = v61;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v64;
            _os_log_impl((void *)&_mh_execute_header, v65, v66, "%@ Failed to fetch Gallery updates; falls to full sync - %@",
              buf,
              0x16u);
          }
        }
        [v60 removeAllObjects];
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        uint64_t v67 = VCPLogInstance();
        os_log_type_t v68 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v67, v68))
        {
          id v69 = [v60 count];
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v61;
          *(_WORD *)&unsigned char buf[12] = 2048;
          *(void *)&buf[14] = v69;
          _os_log_impl((void *)&_mh_execute_header, v67, v68, "%@ Fetched %lu entities to update", buf, 0x16u);
        }
      }
    }
    else
    {
      v181 = 0;
    }
    uint64_t v70 = mach_absolute_time();
    id v71 = VCPSignPostLog();
    os_signpost_id_t v72 = os_signpost_id_generate(v71);

    v73 = VCPSignPostLog();
    v74 = v73;
    if (v72 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v74, OS_SIGNPOST_INTERVAL_BEGIN, v72, "GalleryPhotosUpdate_UpdateEndToEnd", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    v176 = +[NSDate now];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v75 = VCPLogInstance();
      os_log_type_t v76 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v75, v76))
      {
        id v77 = [v175 count];
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v184;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = v77;
        _os_log_impl((void *)&_mh_execute_header, v75, v76, "%@ Initiate all entities from Gallery to PhotosDB (with %lu changed entities)", buf, 0x16u);
      }
    }
    v172 = +[NSMutableSet set];
    if (([(PHPhotoLibrary *)self->_photoLibrary vcp_isSyndicationLibrary] & 1) == 0)
    {
      uint64_t v78 = +[MADGDUtilities fetchKeyFaceLocalIdentifiersForPhotoLibrary:self->_photoLibrary];
      if ([v78 count]) {
        [v172 unionSet:v78];
      }
    }
    uint64_t v218 = 0;
    v219 = &v218;
    uint64_t v220 = 0x2020000000;
    uint64_t v221 = 0;
    v164 = [(PHPhotoLibrary *)self->_photoLibrary mad_allPersonsFetchOptionsWithDetectionTypes:0 andVerifiedTypes:0];
    [v164 setFetchLimit:1];
    [v164 setShouldPrefetchCount:1];
    v196[0] = _NSConcreteStackBlock;
    v196[1] = 3221225472;
    v196[2] = sub_1000C8904;
    v196[3] = &unk_10021CD18;
    v204 = &v218;
    id v79 = v184;
    id v197 = v79;
    id v173 = v56;
    id v198 = v173;
    id v165 = v175;
    id v199 = v165;
    id v167 = v164;
    id v200 = v167;
    v201 = self;
    v203 = v183;
    id v166 = v172;
    id v202 = v166;
    v177 = objc_retainBlock(v196);
    v80 = +[MADGDUtilities sharedInstance];
    [v80 flush];

    id v81 = self->_vuService;
    id v195 = 0;
    v168 = [(GDVUVisualUnderstandingService *)v81 entitiesFor:0 error:&v195 body:v177];
    id v169 = v195;
    if (v169 || [(VCPFaceProcessingTask *)self isCancelled])
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v84 = 0;
LABEL_118:
        long long v96 = VCPSignPostLog();
        v97 = v96;
        if (v72 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v96))
        {
          *(_WORD *)long long buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v97, OS_SIGNPOST_INTERVAL_END, v72, "GalleryPhotosUpdate_UpdateEndToEnd", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        if (v70)
        {
          mach_absolute_time();
          VCPPerformance_LogMeasurement();
        }
        __int16 v98 = +[VCPMADCoreAnalyticsManager sharedManager];
        [v176 timeIntervalSinceNow];
        [v98 accumulateDoubleValue:@"PersonBuildingElapsedTimeInSeconds" forField:@"com.apple.mediaanalysisd.FaceAnalysisRunSession" andEvent:-v99];
        [v98 accumulateInt64Value:1 forField:@"NumberOfPersonBuildingEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
        v174 = [(PHPhotoLibrary *)self->_photoLibrary mad_allPersonsFetchOptionsWithDetectionTypes:&off_100230488 andVerifiedTypes:&off_1002304A0];
        v100 = +[PHPerson fetchPersonsWithOptions:](PHPerson, "fetchPersonsWithOptions:");
        v101 = [v100 count];

        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v102 = VCPLogInstance();
          os_log_type_t v103 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v102, v103))
          {
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = v79;
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(void *)&buf[14] = v101;
            _os_log_impl((void *)&_mh_execute_header, v102, v103, "%@ Start Person Promoting with %lu graph verified person", buf, 0x16u);
          }
        }
        int v40 = [(VCPFaceProcessingTask *)self promotePersons];
        if (v40) {
          goto LABEL_202;
        }
        v104 = +[PHPerson fetchPersonsWithOptions:v174];
        v105 = [v104 count];

        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v106 = VCPLogInstance();
          os_log_type_t v107 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v106, v107))
          {
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = v79;
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(void *)&buf[14] = v105 - v101;
            _os_log_impl((void *)&_mh_execute_header, v106, v107, "%@ Finished Person Promoting with %lu new Graph verified persons", buf, 0x16u);
          }
        }
        if (a3 && v105 != v101) {
          *a3 = 1;
        }
        v163 = [(PHPhotoLibrary *)self->_photoLibrary mad_allPersonsFetchOptionsWithDetectionTypes:&off_1002304B8 andVerifiedTypes:&off_1002304D0];
        v108 = +[PHPerson fetchPersonsWithOptions:](PHPerson, "fetchPersonsWithOptions:");
        v109 = [v108 count];

        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v110 = VCPLogInstance();
          os_log_type_t v111 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v110, v111))
          {
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = v79;
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(void *)&buf[14] = v109;
            _os_log_impl((void *)&_mh_execute_header, v110, v111, "%@ Start Pet Promoting with %lu graph verified pet", buf, 0x16u);
          }
        }
        int v40 = [(VCPFaceProcessingTask *)self promotePets];
        if (v40)
        {
LABEL_201:

LABEL_202:
          _Block_object_dispose(&v218, 8);

          id v42 = v187;
          goto LABEL_203;
        }
        v112 = +[PHPerson fetchPersonsWithOptions:v163];
        v113 = [v112 count];

        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v114 = VCPLogInstance();
          os_log_type_t v115 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v114, v115))
          {
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = v79;
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(void *)&buf[14] = v113 - v109;
            _os_log_impl((void *)&_mh_execute_header, v114, v115, "%@ Finished Pet Promoting with %lu new Graph verified pets", buf, 0x16u);
          }
        }
        if (a3 && v113 != v109) {
          *a3 = 1;
        }
        +[PNPersonPromoter setProcessed:1 forLibrary:self->_photoLibrary];
        if ((v84 | v178 ^ 1) != 1)
        {
LABEL_200:
          [(VCPDatabaseWriter *)self->_database cacheProcessedAssetCountAfterPromoter:[(VCPDatabaseWriter *)self->_database valueForKey:@"NumberOfAssetsAnalyzedForPhotosFaceProcessing"]];
          goto LABEL_201;
        }
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v116 = VCPLogInstance();
          os_log_type_t v117 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v116, v117))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v79;
            _os_log_impl((void *)&_mh_execute_header, v116, v117, "%@ Start updating VUWGallery plugins", buf, 0xCu);
          }
        }
        v191[0] = _NSConcreteStackBlock;
        v191[1] = 3221225472;
        v191[2] = sub_1000C9098;
        v191[3] = &unk_10021CD40;
        v191[4] = self;
        id v171 = v79;
        id v192 = v171;
        v118 = objc_retainBlock(v191);
        v119 = +[MADVUWGalleryManager sharedGalleryForPhotoLibrary:self->_photoLibrary];
        uint64_t v179 = mach_absolute_time();
        v120 = VCPSignPostLog();
        os_signpost_id_t v121 = os_signpost_id_generate(v120);

        v122 = VCPSignPostLog();
        v123 = v122;
        if (v121 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v122))
        {
          *(_WORD *)long long buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v123, OS_SIGNPOST_INTERVAL_BEGIN, v121, "MADVUWGalleryPluginTypeDeviceOwner", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        id v190 = 0;
        unsigned __int8 v124 = [v119 updatePlugin:0 progressHandler:v118 error:&v190];
        id v125 = v190;
        if ((v124 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
        {
          id v126 = v125;
          v127 = VCPLogInstance();
          os_log_type_t v128 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v127, v128))
          {
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = v171;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v126;
            _os_log_impl((void *)&_mh_execute_header, v127, v128, "%@ Failed to update device owner - %@", buf, 0x16u);
          }

          id v125 = v126;
        }
        v129 = VCPSignPostLog();
        v130 = v129;
        if (v121 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v129))
        {
          *(_WORD *)long long buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v130, OS_SIGNPOST_INTERVAL_END, v121, "MADVUWGalleryPluginTypeDeviceOwner", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        if (v179)
        {
          mach_absolute_time();
          VCPPerformance_LogMeasurement();
        }
        if (!DeviceWithGreymatterSupport()) {
          goto LABEL_195;
        }
        uint64_t v180 = mach_absolute_time();
        v131 = VCPSignPostLog();
        os_signpost_id_t v132 = os_signpost_id_generate(v131);

        v133 = VCPSignPostLog();
        v134 = v133;
        if (v132 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v133))
        {
          *(_WORD *)long long buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v134, OS_SIGNPOST_INTERVAL_BEGIN, v132, "MADVUWGalleryPluginTypePersonalization", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        id v189 = v125;
        unsigned __int8 v135 = [v119 updatePlugin:1 progressHandler:v118 error:&v189];
        id v136 = v189;
        v137 = v125;
        id v125 = v136;

        if ((v135 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
        {
          id v138 = v125;
          v139 = VCPLogInstance();
          os_log_type_t v140 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v139, v140))
          {
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = v171;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v138;
            _os_log_impl((void *)&_mh_execute_header, v139, v140, "%@ Failed to update personalization - %@", buf, 0x16u);
          }

          id v125 = v138;
        }
        v141 = VCPSignPostLog();
        v142 = v141;
        if (v132 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v141))
        {
          *(_WORD *)long long buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v142, OS_SIGNPOST_INTERVAL_END, v132, "MADVUWGalleryPluginTypePersonalization", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        if (v180)
        {
          mach_absolute_time();
          VCPPerformance_LogMeasurement();
        }
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          id v143 = v125;
          v144 = VCPLogInstance();
          os_log_type_t v145 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v144, v145))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v171;
            _os_log_impl((void *)&_mh_execute_header, v144, v145, "%@ Finished personalization plugin", buf, 0xCu);
          }

          id v125 = v143;
        }
        if (![(VCPDatabaseWriter *)self->_database valueForKey:@"PrioritizedFaceAnalysisCheckpointReportedTimestamp"]|| [(VCPDatabaseWriter *)self->_database valueForKey:@"PersonalizationCheckpointReportedTimestamp"])
        {
LABEL_195:
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            id v159 = v125;
            v160 = VCPLogInstance();
            os_log_type_t v161 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v160, v161))
            {
              *(_DWORD *)long long buf = 138412290;
              *(void *)&uint8_t buf[4] = v171;
              _os_log_impl((void *)&_mh_execute_header, v160, v161, "%@ Finished updating VUWGallery plugins", buf, 0xCu);
            }

            id v125 = v159;
          }

          goto LABEL_200;
        }
        id v188 = v125;
        unsigned __int8 v146 = +[BGSystemTaskCheckpoints reportFeatureCheckpoint:50 forFeature:802 error:&v188];
        id v147 = v188;
        v148 = v125;
        id v125 = v147;

        if (v146)
        {
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            v149 = VCPLogInstance();
            os_log_type_t v150 = VCPLogToOSLogType[5];
            if (os_log_type_enabled(v149, v150))
            {
              *(_DWORD *)long long buf = 138412802;
              *(void *)&uint8_t buf[4] = v171;
              *(_WORD *)&unsigned char buf[12] = 2048;
              *(void *)&buf[14] = 30;
              *(_WORD *)&buf[22] = 2048;
              uint64_t v223 = 802;
              v151 = "%@ Reported checkpoint %lu for %lu";
              v152 = v149;
              os_log_type_t v153 = v150;
              uint32_t v154 = 32;
LABEL_192:
              _os_log_impl((void *)&_mh_execute_header, v152, v153, v151, buf, v154);
              goto LABEL_193;
            }
            goto LABEL_193;
          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v149 = VCPLogInstance();
          os_log_type_t v155 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v149, v155))
          {
            *(_DWORD *)long long buf = 138413058;
            *(void *)&uint8_t buf[4] = v171;
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(void *)&buf[14] = 30;
            *(_WORD *)&buf[22] = 2048;
            uint64_t v223 = 802;
            LOWORD(v224[0]) = 2112;
            *(void *)((char *)v224 + 2) = v125;
            v151 = "%@ Failed to report checkpoint %lu for %lu - %@";
            v152 = v149;
            os_log_type_t v153 = v155;
            uint32_t v154 = 42;
            goto LABEL_192;
          }
LABEL_193:
        }
        v156 = self->_database;
        v157 = +[NSDate now];
        [v157 timeIntervalSinceReferenceDate];
        [(VCPDatabaseWriter *)v156 setValue:(uint64_t)v158 forKey:@"PersonalizationCheckpointReportedTimestamp"];

        [(VCPDatabaseWriter *)self->_database commit];
        goto LABEL_195;
      }
      id v82 = VCPLogInstance();
      os_log_type_t v83 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v82, v83))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v79;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v169;
        _os_log_impl((void *)&_mh_execute_header, v82, v83, "%@ Failed to initialize entities from Gallery - %@", buf, 0x16u);
      }
      int v84 = 0;
    }
    else if (v56)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v85 = VCPLogInstance();
        os_log_type_t v86 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v85, v86))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v79;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v168;
          _os_log_impl((void *)&_mh_execute_header, v85, v86, "%@ Update MADGDChangeBookmark %@", buf, 0x16u);
        }
      }
      id v193 = 0;
      long long v87 = [v181 encodeToDataAndReturnError:&v193];
      id v82 = v193;
      if (!v87 && (int)MediaAnalysisLogLevel() >= 3)
      {
        long long v88 = VCPLogInstance();
        os_log_type_t v89 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v88, v89))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v79;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v82;
          _os_log_impl((void *)&_mh_execute_header, v88, v89, "%@ Failed to encode updated MADGDChangeBookmark - %@", buf, 0x16u);
        }
      }
      [(VCPDatabaseWriter *)self->_database updateChangeToken:v87 forTaskID:3 andChangeTokenType:2];
      [(VCPDatabaseWriter *)self->_database commit];
      id v90 = v181;

      int v84 = 0;
      id v173 = v90;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v91 = VCPLogInstance();
        os_log_type_t v92 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v91, v92))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v79;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v168;
          _os_log_impl((void *)&_mh_execute_header, v91, v92, "%@ Initiate MADGDChangeBookmark %@", buf, 0x16u);
        }
      }
      id v194 = 0;
      long long v93 = [v168 encodeToDataAndReturnError:&v194];
      id v82 = v194;
      if (!v93 && (int)MediaAnalysisLogLevel() >= 3)
      {
        long long v94 = VCPLogInstance();
        os_log_type_t v95 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v94, v95))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v79;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v82;
          _os_log_impl((void *)&_mh_execute_header, v94, v95, "%@ Failed to encode initial MADGDChangeBookmark - %@", buf, 0x16u);
        }
      }
      [(VCPDatabaseWriter *)self->_database setChangeToken:v93 forTaskID:3 andChangeTokenType:2];
      [(VCPDatabaseWriter *)self->_database commit];
      id v173 = v168;

      int v84 = 1;
    }

    goto LABEL_118;
  }
  id v33 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v33 start];
  uint64_t v34 = mach_absolute_time();
  id v35 = VCPSignPostLog();
  os_signpost_id_t v36 = os_signpost_id_generate(v35);

  id v37 = VCPSignPostLog();
  id v38 = v37;
  if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "FaceProcessingClusterFace", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  unsigned __int8 v39 = [(GDVUVisualUnderstandingService *)self->_vuService gallery];
  int v40 = (int)v186;
  id v215 = v186;
  v212[0] = _NSConcreteStackBlock;
  v212[1] = 3221225472;
  v212[2] = sub_1000C83DC;
  v212[3] = &unk_10021CCC8;
  id v41 = v184;
  id v213 = v41;
  v214 = v183;
  [v39 updateAndReturnError:&v215 progressHandler:v212];
  id v42 = v215;

  if (v42)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      dispatch_group_t v43 = VCPLogInstance();
      os_log_type_t v44 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v43, v44))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v41;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v42;
        _os_log_impl((void *)&_mh_execute_header, v43, v44, "%@ Failed to update gallery for face clustering and person building - %@", buf, 0x16u);
      }
    }
    [v33 stop];
    int v40 = [v42 code];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      int v45 = VCPLogInstance();
      int v40 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v45, (os_log_type_t)VCPLogToOSLogType[6]))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v41;
        _os_log_impl((void *)&_mh_execute_header, v45, (os_log_type_t)v40, "%@ Finished Face Clustering", buf, 0xCu);
      }
    }
    [v33 stop];
    unsigned int v46 = +[VCPMADCoreAnalyticsManager sharedManager];
    [v33 elapsedTimeSeconds];
    objc_msgSend(v46, "accumulateDoubleValue:forField:andEvent:", @"FaceClusteringElapsedTimeInSeconds", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

    v47 = +[VCPMADCoreAnalyticsManager sharedManager];
    [v47 accumulateInt64Value:1 forField:@"NumberOfClusterEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

    dispatch_queue_t v48 = VCPSignPostLog();
    id v49 = v48;
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v49, OS_SIGNPOST_INTERVAL_END, v36, "FaceProcessingClusterFace", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if (v34)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
  }

  if (!v42)
  {
    id v29 = 0;
    goto LABEL_50;
  }
LABEL_203:

  return v40;
}

- (int)_publishClusterAndPersonProcessingWithBatchContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 unprocessedAssets];
  id v6 = [v4 processingStatusMap];
  unsigned int publishDetectionAndProcessPersonStatus = [(VCPFaceProcessingTask *)self _recoverAttemptsForAssets:v5 withProcessingStatusMap:v6];

  if (!publishDetectionAndProcessPersonStatus)
  {
    dispatch_group_wait((dispatch_group_t)self->_publishDetectionAndProcessPersonGroup, 0xFFFFFFFFFFFFFFFFLL);
    if (self->_publishDetectionAndProcessPersonStatus)
    {
      id v9 = [v4 processedAssets];
      uint64_t v10 = [v4 processingStatusMap];
      unsigned int publishDetectionAndProcessPersonStatus = [(VCPFaceProcessingTask *)self _recoverAttemptsForAssets:v9 withProcessingStatusMap:v10];

      if (!publishDetectionAndProcessPersonStatus) {
        unsigned int publishDetectionAndProcessPersonStatus = self->_publishDetectionAndProcessPersonStatus;
      }
    }
    else
    {
      publishDetectionAndProcessPersonGroup = self->_publishDetectionAndProcessPersonGroup;
      publishDetectionAndProcessPersonQueue = self->_publishDetectionAndProcessPersonQueue;
      uint64_t v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      uint64_t v15 = sub_1000C939C;
      int v16 = &unk_100219D70;
      id v17 = v4;
      int v18 = self;
      dispatch_group_async(publishDetectionAndProcessPersonGroup, publishDetectionAndProcessPersonQueue, &v13);
      if ((objc_msgSend((id)objc_opt_class(), "_concurrentFaceStagings", v13, v14, v15, v16) & 1) == 0) {
        dispatch_group_wait((dispatch_group_t)self->_publishDetectionAndProcessPersonGroup, 0xFFFFFFFFFFFFFFFFLL);
      }

      unsigned int publishDetectionAndProcessPersonStatus = 0;
    }
  }

  return publishDetectionAndProcessPersonStatus;
}

- (int)processFaceCrops
{
  unsigned int v42 = [(PHPhotoLibrary *)self->_photoLibrary vcp_allowInMemoryDownload];
  unsigned __int8 v39 = self;
  id v35 = [(PHPhotoLibrary *)self->_photoLibrary newFaceCropsToBeGeneratedFetchOptions];
  os_log_type_t v44 = +[PHFace fetchFacesWithOptions:](PHFace, "fetchFacesWithOptions:");
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)long long buf = 134217984;
      *(void *)&uint8_t buf[4] = [v44 count];
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "%lu face(s) need to generate facecrops", buf, 0xCu);
    }
  }
  id v41 = +[PHAsset fetchAssetsGroupedByFaceUUIDForFaces:v44];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1000CA814;
  v47[3] = &unk_100219D98;
  v47[4] = v39;
  dispatch_group_t v43 = objc_retainBlock(v47);
  unint64_t v5 = 0;
  os_log_type_t v36 = VCPLogToOSLogType[3];
  os_log_type_t v37 = VCPLogToOSLogType[4];
  os_log_type_t type = VCPLogToOSLogType[6];
  *(void *)&long long v6 = 138412546;
  long long v34 = v6;
  while (1)
  {
    if (v5 >= (unint64_t)objc_msgSend(v44, "count", v34))
    {
      *(void *)long long buf = 0;
      int v31 = [(VCPFaceCropManager *)v39->_faceCropManager processDirtyFaceCrops:buf withCancelBlock:v43 andExtendTimeoutBlock:&stru_10021CD80];
      os_log_type_t v32 = +[VCPMADCoreAnalyticsManager sharedManager];
      [v32 accumulateInt64Value:*(void *)buf forField:@"NumberOfFacecropsAnalyzed" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

      goto LABEL_44;
    }
    uint64_t v8 = ((uint64_t (*)(void))v43[2])();
    if ((v8 & 1) == 0)
    {
      sub_1000CA7B0((id)v8);
      uint64_t v10 = [v44 objectAtIndexedSubscript:v5];
      os_log_type_t v11 = [v10 uuid];
      os_signpost_id_t v12 = [v41 objectForKeyedSubscript:v11];

      uint64_t v13 = +[VCPFaceUtils preferredResourcesForFaceProcessingWithAsset:v12];
      uint64_t v14 = +[VCPFaceUtils resourceForFaceProcessing:v13 allowStreaming:v42];
      if (+[VCPFaceUtils isBestResourceForFaceProcessing:v14 fromResources:v13])
      {
        uint64_t v15 = [v14 privateFileURL];
        if (v42
          && (+[NSFileManager defaultManager],
              int v16 = objc_claimAutoreleasedReturnValue(),
              [v15 path],
              id v17 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v18 = [v16 fileExistsAtPath:v17],
              v17,
              v16,
              (v18 & 1) == 0))
        {
          unsigned int v46 = v15;
          +[PHAssetResourceManager vcp_requestFileURLForAssetResource:v14 withTaskID:3 toResourceURL:&v46 cancel:v43];
          unsigned int v19 = v46;
        }
        else
        {
          unsigned int v19 = v15;
        }
        if (v19)
        {
          unsigned __int8 v20 = VCPSignPostLog();
          os_signpost_id_t spid = os_signpost_id_generate(v20);

          int v21 = VCPSignPostLog();
          os_log_type_t v22 = v21;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPFaceProcessingGenerateFaceCrop", (const char *)&unk_1001F3BD3, buf, 2u);
          }

          faceCropManager = v39->_faceCropManager;
          unsigned int v51 = v10;
          os_log_type_t v24 = +[NSArray arrayWithObjects:&v51 count:1];
          id v45 = 0;
          LOBYTE(faceCropManager) = [(VCPFaceCropManager *)faceCropManager generateAndPersistFaceCropsForFaces:v24 withAsset:v12 resource:v14 resourceURL:v19 error:&v45];
          unint64_t v25 = v45;

          if ((faceCropManager & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
          {
            id v26 = VCPLogInstance();
            if (os_log_type_enabled(v26, v36))
            {
              os_log_type_t v27 = [v12 localIdentifier];
              *(_DWORD *)long long buf = v34;
              *(void *)&uint8_t buf[4] = v27;
              __int16 v49 = 2112;
              id v50 = v25;
              _os_log_impl((void *)&_mh_execute_header, v26, v36, "[FaceCropGeneration][%@] Failed to generate - %@", buf, 0x16u);
            }
          }
          os_log_type_t v28 = VCPSignPostLog();
          id v29 = v28;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_END, spid, "VCPFaceProcessingGenerateFaceCrop", (const char *)&unk_1001F3BD3, buf, 2u);
          }

          int v9 = 0;
LABEL_35:

LABEL_37:
          goto LABEL_38;
        }
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          unint64_t v25 = VCPLogInstance();
          if (os_log_type_enabled(v25, v37))
          {
            long long v30 = [v12 localIdentifier];
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v30;
            _os_log_impl((void *)&_mh_execute_header, v25, v37, "[FaceCropGeneration][%@] No local or downloaded resource; skipping",
              buf,
              0xCu);
          }
          int v9 = 6;
          goto LABEL_35;
        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 6)
        {
          int v9 = 6;
LABEL_38:

          goto LABEL_39;
        }
        unsigned int v19 = VCPLogInstance();
        if (os_log_type_enabled(v19, type))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, type, "[FaceCropGeneration] No applicable resource; skipping",
            buf,
            2u);
        }
      }
      int v9 = 6;
      goto LABEL_37;
    }
    int v9 = 1;
LABEL_39:
    if (v9 != 6)
    {
      if (v9) {
        break;
      }
    }
    ++v5;
  }
  int v31 = -128;
LABEL_44:

  return v31;
}

- (int)flush
{
  return self->_publishDetectionAndProcessPersonStatus;
}

- (int)run
{
  return -4;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (VCPDatabaseWriter)database
{
  return self->_database;
}

- (BOOL)allowStreaming
{
  return self->_allowStreaming;
}

- (void)setAllowStreaming:(BOOL)a3
{
  self->_allowStreaming = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_vuService, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_publishDetectionAndProcessPersonQueue, 0);
  objc_storeStrong((id *)&self->_publishDetectionAndProcessPersonGroup, 0);
  objc_storeStrong((id *)&self->_postDetectionQueue, 0);
  objc_storeStrong((id *)&self->_detectionProcessingQueues, 0);
  objc_storeStrong((id *)&self->_detectionQueue, 0);
  objc_storeStrong((id *)&self->_detectionGroup, 0);
  objc_storeStrong((id *)&self->_downloadGroup, 0);
  objc_storeStrong((id *)&self->_faceClusterer, 0);
  objc_storeStrong((id *)&self->_faceCropManager, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end