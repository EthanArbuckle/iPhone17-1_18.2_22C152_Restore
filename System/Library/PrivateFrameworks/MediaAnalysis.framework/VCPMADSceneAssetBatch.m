@interface VCPMADSceneAssetBatch
+ (BOOL)_allowConcurrentSceneProcessing;
+ (id)batchWithAnalysisDatabase:(id)a3 cancelBlock:(id)a4 monochromeBufferCreator:(id)a5 imageLoader:(id)a6 session:(id)a7 ivsPool:(id)a8 rotationModel:(id)a9 rotationBufferCreator:(id)a10 embeddingBufferCreator:(id)a11;
+ (unint64_t)_concurrentBlurExposureRotationQueueCount;
+ (unint64_t)_concurrentSceneNetQueueCount;
- (VCPMADSceneAssetBatch)initWithAnalysisDatabase:(id)a3 cancelBlock:(id)a4 monochromeBufferCreator:(id)a5 imageLoader:(id)a6 session:(id)a7 ivsPool:(id)a8 rotationModel:(id)a9 rotationBufferCreator:(id)a10 embeddingBufferCreator:(id)a11;
- (id)_extractAndSortBoundingBoxFromDetectedObjects:(id)a3;
- (id)_generateSceneClassificationsFromRequests:(id)a3 andIVSResults:(id)a4;
- (id)_processBoundingBoxFromDetectedObjects:(id)a3 forSceneClassID:(id)a4;
- (int)_collectResultsForAssetEntry:(id)a3 fromRequests:(id)a4 ivsResults:(id)a5;
- (int)_createRequests:(id *)a3 forAssetEntry:(id)a4;
- (int)_performBlurAnalysisForAssetEntry:(id)a3 withLumaPixelBuffer:(__CVBuffer *)a4;
- (int)_performEmbeddingAnalysisForAssetEntry:(id)a3 withColorPixelBuffer:(__CVBuffer *)a4;
- (int)_performExposureAnalysisForAssetEntry:(id)a3 withLumaPixelBuffer:(__CVBuffer *)a4;
- (int)_performRotationAnalysisForAssetEntry:(id)a3 withColorPixelBuffer:(__CVBuffer *)a4;
- (int)_performSceneNetAnalysisForAssetEntry:(id)a3 withImage:(id)a4 andRequests:(id)a5;
- (int)_performWallpaperAnalysisForAssetEntry:(id)a3 withSceneprint:(id)a4;
- (int)prepare;
- (int)process;
- (int)publish;
- (unint64_t)count;
- (void)_insertBoundingBox:(id)a3 toSortedBoundingBoxes:(id)a4;
- (void)_parseClassificationObservations:(id)a3 withPrefix:(id)a4 toClassificationResults:(id)a5;
- (void)_parsePhotosTaxonomyClassificationObservations:(id)a3 toClassificationResults:(id)a4 andDetectorSceneClassIds:(id)a5 isEntityNet:(BOOL)a6;
- (void)_processAssetEntry:(id)a3 resourceURL:(id)a4 completionHandler:(id)a5;
- (void)addPhotosAsset:(id)a3 withPreviousStatus:(unint64_t)a4 attempts:(unint64_t)a5 andAttemptDate:(id)a6;
@end

@implementation VCPMADSceneAssetBatch

+ (BOOL)_allowConcurrentSceneProcessing
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1002524A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1002524A8))
  {
    byte_1002524A0 = DeviceHasANE();
    __cxa_guard_release(&qword_1002524A8);
  }
  return byte_1002524A0;
}

+ (unint64_t)_concurrentSceneNetQueueCount
{
  return 4;
}

+ (unint64_t)_concurrentBlurExposureRotationQueueCount
{
  return 4;
}

- (VCPMADSceneAssetBatch)initWithAnalysisDatabase:(id)a3 cancelBlock:(id)a4 monochromeBufferCreator:(id)a5 imageLoader:(id)a6 session:(id)a7 ivsPool:(id)a8 rotationModel:(id)a9 rotationBufferCreator:(id)a10 embeddingBufferCreator:(id)a11
{
  id v47 = a3;
  id v48 = a4;
  id v46 = a5;
  id v45 = a6;
  id v44 = a7;
  id v43 = a8;
  id v42 = a9;
  id v41 = a10;
  id v40 = a11;
  v50.receiver = self;
  v50.super_class = (Class)VCPMADSceneAssetBatch;
  v18 = [(VCPMADSceneAssetBatch *)&v50 init];
  if (!v18) {
    goto LABEL_10;
  }
  uint64_t v19 = +[NSMutableArray array];
  assetEntries = v18->_assetEntries;
  v18->_assetEntries = (NSMutableArray *)v19;

  objc_storeStrong((id *)&v18->_analysisDatabase, a3);
  id v21 = objc_retainBlock(v48);
  id cancelBlock = v18->_cancelBlock;
  v18->_id cancelBlock = v21;

  objc_storeStrong((id *)&v18->_monochromeBufferCreator, a5);
  objc_storeStrong((id *)&v18->_imageLoader, a6);
  v23 = +[VCPMADProcessingJobManager sharedManager];
  uint64_t v24 = [v23 inProcessAssetBudget];
  inProcessAssetBudget = v18->_inProcessAssetBudget;
  v18->_inProcessAssetBudget = (OS_dispatch_semaphore *)v24;

  v18->_id scenenetQueuesAllowed = 1;
  if ([(id)objc_opt_class() _allowConcurrentSceneProcessing])
  {
    id scenenetQueuesAllowed = [(id)objc_opt_class() _concurrentSceneNetQueueCount];
    v18->_id scenenetQueuesAllowed = (unint64_t)scenenetQueuesAllowed;
  }
  else
  {
    id scenenetQueuesAllowed = (id)v18->_scenenetQueuesAllowed;
  }
  [v23 registerQueueGroupWithName:@"Scenenet" andNumberOfQueues:scenenetQueuesAllowed];
  dispatch_group_t v27 = dispatch_group_create();
  scenenetGroup = v18->_scenenetGroup;
  v18->_scenenetGroup = (OS_dispatch_group *)v27;

  v18->_id blurExposureRotationQueuesAllowed = 1;
  if ([(id)objc_opt_class() _allowConcurrentSceneProcessing])
  {
    id blurExposureRotationQueuesAllowed = [(id)objc_opt_class() _concurrentBlurExposureRotationQueueCount];
    v18->_id blurExposureRotationQueuesAllowed = (unint64_t)blurExposureRotationQueuesAllowed;
  }
  else
  {
    id blurExposureRotationQueuesAllowed = (id)v18->_blurExposureRotationQueuesAllowed;
  }
  [v23 registerQueueGroupWithName:@"BlurExposureRotation" andNumberOfQueues:blurExposureRotationQueuesAllowed];
  dispatch_group_t v30 = dispatch_group_create();
  blurExposureRotationGroup = v18->_blurExposureRotationGroup;
  v18->_blurExposureRotationGroup = (OS_dispatch_group *)v30;

  [v23 registerQueueGroupWithName:@"AssetProcessCompletion" andNumberOfQueues:1];
  dispatch_group_t v32 = dispatch_group_create();
  assetProcessCompletionGroup = v18->_assetProcessCompletionGroup;
  v18->_assetProcessCompletionGroup = (OS_dispatch_group *)v32;

  uint64_t v34 = [v23 getJobScheduler];
  id scheduler = v18->_scheduler;
  v18->_id scheduler = (id)v34;

  if (v18->_scheduler)
  {
    objc_storeStrong((id *)&v18->_session, a7);
    objc_storeStrong((id *)&v18->_ivsPool, a8);
    objc_storeStrong((id *)&v18->_rotationModel, a9);
    objc_storeStrong((id *)&v18->_rotationBufferCreator, a10);
    objc_storeStrong((id *)&v18->_embeddingBufferCreator, a11);

LABEL_10:
    v36 = v18;
    goto LABEL_16;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v37 = VCPLogInstance();
    os_log_type_t v38 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v37, v38))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Failed to get job scheduler to dispatch analysis jobs onto global queues across batches", buf, 2u);
    }
  }
  v36 = 0;
LABEL_16:

  return v36;
}

+ (id)batchWithAnalysisDatabase:(id)a3 cancelBlock:(id)a4 monochromeBufferCreator:(id)a5 imageLoader:(id)a6 session:(id)a7 ivsPool:(id)a8 rotationModel:(id)a9 rotationBufferCreator:(id)a10 embeddingBufferCreator:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = [objc_alloc((Class)a1) initWithAnalysisDatabase:v17 cancelBlock:v18 monochromeBufferCreator:v19 imageLoader:v20 session:v21 ivsPool:v22 rotationModel:v23 rotationBufferCreator:v24 embeddingBufferCreator:v25];

  return v26;
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_assetEntries count];
}

- (void)addPhotosAsset:(id)a3 withPreviousStatus:(unint64_t)a4 attempts:(unint64_t)a5 andAttemptDate:(id)a6
{
  id v8 = a3;
  id v23 = a6;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v9 = self->_assetEntries;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v25;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = [*(id *)(*((void *)&v24 + 1) + 8 * i) asset];
        v14 = [v13 localIdentifier];
        v15 = [v8 localIdentifier];
        unsigned int v16 = [v14 isEqualToString:v15];

        if (v16)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            id v18 = VCPLogInstance();
            os_log_type_t v19 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v18, v19))
            {
              id v20 = [v8 localIdentifier];
              *(_DWORD *)buf = 138412290;
              v29 = v20;
              _os_log_impl((void *)&_mh_execute_header, v18, v19, "[Scene][%@] Batch already contains asset; ignoring",
                buf,
                0xCu);
            }
          }
          goto LABEL_14;
        }
      }
      id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  assetEntries = self->_assetEntries;
  v9 = +[VCPMADSceneAssetEntry entryWithAsset:v8 previousStatus:a4 previousAttempts:a5 andLastAttemptDate:v23];
  [(NSMutableArray *)assetEntries addObject:v9];
LABEL_14:
}

- (int)prepare
{
  v33 = +[NSDate now];
  v4 = VCPSignPostLog();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  v6 = VCPSignPostLog();
  v7 = v6;
  unint64_t v31 = v5 - 1;
  os_signpost_id_t spid = v5;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "VCPMADSceneAssetBatch_Prepare", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v11 = qos_class_self();
      v2 = VCPMAQoSDescription(v11);
      *(_DWORD *)buf = 134218242;
      id v40 = v10;
      __int16 v41 = 2112;
      id v42 = v2;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[Scene] Preparing %lu assets (QoS: %@)", buf, 0x16u);
    }
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v12 = self->_assetEntries;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v35;
LABEL_10:
    v15 = 0;
    unsigned int v16 = v2;
    while (1)
    {
      if (*(void *)v35 != v14) {
        objc_enumerationMutation(v12);
      }
      id v17 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v15);
      analysisDatabase = self->_analysisDatabase;
      os_log_type_t v19 = (char *)[v17 previousAttempts];
      id v20 = [v17 asset];
      id v21 = +[NSDate now];
      id v22 = (id)[(VCPDatabaseWriter *)analysisDatabase setAttempts:v19 + 1 asset:v20 taskID:2 status:1 lastAttemptDate:v21];

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
      v15 = (char *)v15 + 1;
      unsigned int v16 = v2;
      if (v13 == v15)
      {
        id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
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
    long long v27 = VCPSignPostLog();
    v28 = v27;
    if (v31 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADSceneAssetBatch_Prepare", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    v12 = +[VCPMADCoreAnalyticsManager sharedManager];
    [v33 timeIntervalSinceNow];
    [(NSMutableArray *)v12 accumulateDoubleValue:@"TotalPrepareTimeInSeconds" forField:@"com.apple.mediaanalysisd.SceneAnalysisRunSession" andEvent:-v29];
    LODWORD(v2) = 0;
LABEL_39:

    int v26 = (int)v2;
  }

  return v26;
}

- (int)_createRequests:(id *)a3 forAssetEntry:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)VCPPreAnalysisRequests);
  v7 = +[VNClassifyImageAestheticsRequest vcp_sceneRequest];
  [v6 setAestheticsRequest:v7];

  id v8 = +[VNSceneClassificationRequest vcp_sceneRequest];
  [v6 setClassificationRequest:v8];

  os_log_type_t v9 = +[VNCreateSceneprintRequest vcp_sceneRequest];
  [v6 setSceneprintRequest:v9];

  id v10 = +[VNGenerateAttentionBasedSaliencyImageRequest vcp_sceneRequest];
  [v6 setSaliencyRequest:v10];

  if (+[VCPPreAnalysisRequests includeSO])
  {
    qos_class_t v11 = +[VNGenerateObjectnessBasedSaliencyImageRequest vcp_sceneRequest];
    [v6 setSaliencyObjectnessRequest:v11];
  }
  if (+[VCPPreAnalysisRequests includeJunk])
  {
    v12 = +[VNClassifyJunkImageRequest vcp_sceneRequest];
    [v6 setJunkImageRequest:v12];
  }
  if (+[VCPPreAnalysisRequests includeDO])
  {
    id v13 = +[VNRecognizeObjectsRequest vcp_sceneRequest];
    [v6 setObjectRequest:v13];
  }
  if (+[VCPPreAnalysisRequests includeLM])
  {
    uint64_t v14 = +[VNClassifyPotentialLandmarkRequest vcp_sceneRequest];
    [v6 setLandmarkRequest:v14];
  }
  if (+[VCPPreAnalysisRequests includeNSFW])
  {
    v15 = +[VNVYvzEtX1JlUdu8xx5qhDI vcp_sceneRequest];
    [v6 setNsfwRequest:v15];
  }
  if (+[VCPPreAnalysisRequests includeSE])
  {
    unsigned int v16 = +[VN6Mb1ME89lyW3HpahkEygIG vcp_sceneRequest];
    [v6 setTabooRequest:v16];
  }
  if (+[VCPPreAnalysisRequests includeSDG])
  {
    id v17 = +[VN5kJNH3eYuyaLxNpZr5Z7zi vcp_sceneRequest];
    [v6 setSemanticRequest:v17];
  }
  if (+[VCPPreAnalysisRequests includeWP])
  {
    id v18 = +[VNCreateSceneprintRequest vcp_sceneRequestForWallpaper];
    [v6 setSceneprintRawRequest:v18];
  }
  if (+[VCPPreAnalysisRequests includeMeme])
  {
    os_log_type_t v19 = +[VNClassifyMemeImageRequest vcp_sceneRequest];
    [v6 setMemeRequest:v19];
  }
  if (+[VCPPreAnalysisRequests includeDocument])
  {
    id v20 = +[VNRecognizeDocumentElementsRequest vcp_sceneRequest];
    [v6 setDocumentRequest:v20];
  }
  if (+[VCPPreAnalysisRequests includePA])
  {
    id v21 = +[VN1JC7R3k4455fKQz0dY1VhQ vcp_sceneRequest];
    [v6 setAdjustmentsRequest:v21];
  }
  if (+[VCPPreAnalysisRequests includeCN])
  {
    id v22 = +[VNClassifyCityNatureImageRequest vcp_sceneRequest];
    [v6 setCityNatureRequest:v22];
  }
  if (+[VCPPreAnalysisRequests includeDMF])
  {
    BOOL v23 = [v5 asset];
    id v24 = [v23 mediaType];

    if (v24 != (id)2)
    {
      unsigned int v25 = +[VNCreateImageFingerprintsRequest vcp_sceneRequest];
      [v6 setImagefingerprintsRequest:v25];
    }
  }
  if (+[VNRequest mad_includeEntityNet])
  {
    int v26 = +[VNClassifyImageRequest vcp_sceneRequest];
    [v6 setClassifyImageRequest:v26];
  }
  id v27 = v6;
  *a3 = v27;

  return 0;
}

- (int)_performWallpaperAnalysisForAssetEntry:(id)a3 withSceneprint:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = VCPSignPostLog();
    os_signpost_id_t v8 = os_signpost_id_generate(v7);

    os_log_type_t v9 = VCPSignPostLog();
    id v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "VCPWallpaperAnalysis", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    id v11 = objc_alloc_init((Class)VCPWallpaperAnalyzer);
    id v31 = 0;
    int v12 = [v11 analyzeWithSceneprint:v6 results:&v31 cancel:&stru_10021A4A8];
    id v13 = v31;
    uint64_t v14 = VCPSignPostLog();
    v15 = v14;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, v8, "VCPWallpaperAnalysis", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if (v12)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        unsigned int v16 = VCPLogInstance();
        os_log_type_t v17 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v16, v17))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, v17, "Failed to run VCPWallpaperAnalyzer::analyzeWithSceneprint:results:cancel:", buf, 2u);
        }
LABEL_25:
      }
    }
    else
    {
      id v21 = [v13 objectForKeyedSubscript:@"WPResults"];
      BOOL v22 = [v21 count] == (id)1;

      if (v22)
      {
        BOOL v23 = [v13 objectForKeyedSubscript:@"WPResults"];
        unsigned int v16 = [v23 objectAtIndexedSubscript:0];

        if (v16)
        {
          id v24 = [v16 objectForKeyedSubscript:@"wallpaperScore"];
          unsigned int v25 = v24;
          if (v24)
          {
            [v24 floatValue];
            int v27 = v26;
            v28 = [v5 results];
            LODWORD(v29) = v27;
            [v28 setWallpaperScore:v29];

            int v12 = 0;
          }
          else
          {
            int v12 = -18;
          }
        }
        else
        {
          int v12 = -18;
        }
        goto LABEL_25;
      }
      int v12 = -18;
    }

    goto LABEL_27;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v18 = VCPLogInstance();
    os_log_type_t v19 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = 0x3FE0000000000000;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "No sceneprint data for WP analysis; using default value %f",
        buf,
        0xCu);
    }
  }
  id v13 = [v5 results];
  LODWORD(v20) = 0.5;
  [v13 setWallpaperScore:v20];
  int v12 = 0;
LABEL_27:

  return v12;
}

- (id)_processBoundingBoxFromDetectedObjects:(id)a3 forSceneClassID:(id)a4
{
  id v5 = a3;
  id v55 = a4;
  v56 = v5;
  if (![v5 count])
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      uint64_t v14 = VCPLogInstance();
      os_log_type_t v19 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v14, v19))
      {
        *(_WORD *)buf = 0;
        double v20 = "[DO] detectedObjects count is 0; skip detectedObjects";
        id v21 = v14;
        os_log_type_t v22 = v19;
        uint32_t v23 = 2;
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v21, v22, v20, buf, v23);
      }
LABEL_47:
      id v18 = 0;
      goto LABEL_48;
    }
LABEL_23:
    id v18 = 0;
    goto LABEL_49;
  }
  if ([v5 count] != (id)1)
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v24 = v5;
    id v25 = [v24 countByEnumeratingWithState:&v61 objects:v74 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v62;
      float v27 = -1.0;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v62 != v26) {
            objc_enumerationMutation(v24);
          }
          double v29 = [*(id *)(*((void *)&v61 + 1) + 8 * i) objectForKeyedSubscript:@"Confidence"];
          [v29 floatValue];
          float v31 = v30;

          if (v31 > v27) {
            float v27 = v31;
          }
        }
        id v25 = [v24 countByEnumeratingWithState:&v61 objects:v74 count:16];
      }
      while (v25);
    }
    else
    {
      float v27 = -1.0;
    }

    double v32 = v27;
    if (v27 >= 0.01)
    {
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v34 = v24;
      id v35 = [v34 countByEnumeratingWithState:&v57 objects:v73 count:16];
      float v36 = v27 * 0.8;
      uint64_t v14 = 0;
      if (v35)
      {
        uint64_t v37 = *(void *)v58;
        float v38 = -1.0;
        float v39 = -1.0;
        do
        {
          for (j = 0; j != v35; j = (char *)j + 1)
          {
            if (*(void *)v58 != v37) {
              objc_enumerationMutation(v34);
            }
            __int16 v41 = *(void **)(*((void *)&v57 + 1) + 8 * (void)j);
            id v42 = [v41 objectForKeyedSubscript:@"Confidence"];
            [v42 floatValue];
            float v44 = v43;

            id v45 = [v41 objectForKeyedSubscript:@"size"];
            [v45 floatValue];
            float v47 = v46;

            if (v44 >= v36 && v47 > v38)
            {
              uint64_t v49 = [v41 objectForKeyedSubscript:@"BoundingBox"];

              float v38 = v47;
              float v39 = v44;
              uint64_t v14 = v49;
            }
          }
          id v35 = [v34 countByEnumeratingWithState:&v57 objects:v73 count:16];
        }
        while (v35);
      }
      else
      {
        float v38 = -1.0;
        float v39 = -1.0;
      }

      if (v38 == -1.0 || v39 == -1.0 || !v14)
      {
        if ((int)MediaAnalysisLogLevel() < 4) {
          goto LABEL_47;
        }
        v51 = VCPLogInstance();
        os_log_type_t v52 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v51, v52))
        {
          v53 = [v34 description];
          *(_DWORD *)buf = 134218498;
          double v68 = v32;
          __int16 v69 = 2048;
          double v70 = v36;
          __int16 v71 = 2112;
          v72 = v53;
          _os_log_impl((void *)&_mh_execute_header, v51, v52, "[DO] Failed to choose the best bounding box c_max: %f, c_threshold (0.8x): %f from %@", buf, 0x20u);
        }
        id v18 = 0;
      }
      else
      {
        v65[0] = @"classID";
        v65[1] = @"BoundingBox";
        v66[0] = v55;
        v66[1] = v14;
        v65[2] = @"score";
        *(float *)&double v50 = v38 * v39;
        v51 = +[NSNumber numberWithFloat:v50];
        v66[2] = v51;
        id v18 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:3];
      }

      goto LABEL_48;
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      uint64_t v14 = VCPLogInstance();
      os_log_type_t v33 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v14, v33))
      {
        *(_DWORD *)buf = 134217984;
        double v68 = v27;
        double v20 = "[DO] invalid confidenceMax: %f; skip detectedObjects";
        id v21 = v14;
        os_log_type_t v22 = v33;
        uint32_t v23 = 12;
        goto LABEL_22;
      }
      goto LABEL_47;
    }
    goto LABEL_23;
  }
  id v6 = [v5 firstObject];
  v7 = [v6 objectForKeyedSubscript:@"Confidence"];
  [v7 floatValue];
  float v9 = v8;

  id v10 = [v5 firstObject];
  id v11 = [v10 objectForKeyedSubscript:@"size"];
  [v11 floatValue];
  float v13 = v12;

  v76[0] = v55;
  v75[0] = @"classID";
  v75[1] = @"BoundingBox";
  uint64_t v14 = [v5 firstObject];
  v15 = [v14 objectForKeyedSubscript:@"BoundingBox"];
  v76[1] = v15;
  v75[2] = @"score";
  *(float *)&double v16 = v9 * v13;
  os_log_type_t v17 = +[NSNumber numberWithFloat:v16];
  v76[2] = v17;
  id v18 = +[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:3];

LABEL_48:
LABEL_49:

  return v18;
}

- (void)_insertBoundingBox:(id)a3 toSortedBoundingBoxes:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  if (v14 && v5)
  {
    id v6 = [v14 objectForKeyedSubscript:@"score"];
    [v6 floatValue];
    float v8 = v7;

    for (unint64_t i = 0; i < (unint64_t)[v5 count]; ++i)
    {
      id v10 = [v5 objectAtIndexedSubscript:i];
      id v11 = [v10 objectForKeyedSubscript:@"score"];
      [v11 floatValue];
      float v13 = v12;

      if (v13 < v8) {
        break;
      }
    }
    [v5 insertObject:v14 atIndex:i];
  }
}

- (id)_extractAndSortBoundingBoxFromDetectedObjects:(id)a3
{
  id v4 = a3;
  +[NSMutableDictionary dictionary];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100025CBC;
  v12[3] = &unk_10021A4D0;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v5;
  [v4 enumerateObjectsUsingBlock:v12];
  +[NSMutableArray array];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100026088;
  v10[3] = &unk_10021A4F8;
  v10[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];
  float v7 = v11;
  id v8 = v6;

  return v8;
}

- (void)_parseClassificationObservations:(id)a3 withPrefix:(id)a4 toClassificationResults:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v24 = a5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    os_log_type_t type = VCPLogToOSLogType[4];
    do
    {
      float v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v12);
        id v14 = [v13 identifier];
        [v13 confidence];
        if (v15 >= 0.01)
        {
          if (v8 && ([v14 hasPrefix:v8] & 1) == 0)
          {
            uint64_t v16 = +[NSString stringWithFormat:@"%@%@", v8, v14];

            id v14 = (void *)v16;
          }
          os_log_type_t v17 = VCPSpecialLabelToExtendedSceneClassificationID(v14);
          if (v17)
          {
            CFStringRef v31 = @"Confidence";
            [v13 confidence];
            id v18 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            double v32 = v18;
            os_log_type_t v19 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
            double v20 = [v17 stringValue];
            [v24 setObject:v19 forKeyedSubscript:v20];

            goto LABEL_12;
          }
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            id v18 = VCPLogInstance();
            if (os_log_type_enabled(v18, type))
            {
              id v21 = [v13 identifier];
              *(_DWORD *)buf = 138412290;
              float v30 = v21;
              _os_log_impl((void *)&_mh_execute_header, v18, type, "Unsupported observation label %@", buf, 0xCu);
            }
LABEL_12:
          }
        }

        float v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v22 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
      id v10 = v22;
    }
    while (v22);
  }
}

- (void)_parsePhotosTaxonomyClassificationObservations:(id)a3 toClassificationResults:(id)a4 andDetectorSceneClassIds:(id)a5 isEntityNet:(BOOL)a6
{
  BOOL v39 = a6;
  id v8 = a3;
  id v38 = a4;
  id v40 = a5;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v44;
    os_log_type_t type = VCPLogToOSLogType[7];
    os_log_type_t v37 = VCPLogToOSLogType[3];
    do
    {
      float v12 = 0;
      do
      {
        if (*(void *)v44 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v43 + 1) + 8 * (void)v12);
        [v13 confidence];
        if (v15 >= 0.01)
        {
          uint64_t v16 = +[PFSceneTaxonomy vcp_sharedTaxonomy];
          os_log_type_t v17 = [v13 identifier];
          id v18 = [v16 nodeForName:v17];

          if (v18)
          {
            [v18 highPrecisionThreshold];
            double v20 = v19;
            [v18 highRecallThreshold];
            double v22 = v21;
            [v18 searchThreshold];
            double v24 = v23;
            [v13 confidence];
            if (v22 >= v20) {
              double v26 = v20;
            }
            else {
              double v26 = v22;
            }
            if (v24 < v26) {
              double v26 = v24;
            }
            double v27 = v25;
            if (v26 < 0.01) {
              double v26 = 0.01;
            }
            if (v26 <= v27)
            {
              long long v28 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v18 extendedSceneClassId]);
              double v29 = [v28 stringValue];

              CFStringRef v49 = @"Confidence";
              [v13 confidence];
              float v30 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
              double v50 = v30;
              CFStringRef v31 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
              [v38 setObject:v31 forKeyedSubscript:v29];

              if (v40)
              {
                double v32 = [v18 detectors];
                v41[0] = _NSConcreteStackBlock;
                v41[1] = 3221225472;
                v41[2] = sub_100026960;
                v41[3] = &unk_10021A520;
                id v42 = v40;
                [v32 enumerateObjectsUsingBlock:v41];
              }
              goto LABEL_18;
            }
          }
          else
          {
            if (v39)
            {
              if ((int)MediaAnalysisLogLevel() < 7) {
                goto LABEL_19;
              }
              double v29 = VCPLogInstance();
              if (os_log_type_enabled(v29, type))
              {
                os_log_type_t v33 = [v13 identifier];
                *(_DWORD *)buf = 138412290;
                id v48 = v33;
                _os_log_impl((void *)&_mh_execute_header, v29, type, "Unsupported EntityNet label in PFSceneTaxonomyNode: %@", buf, 0xCu);
              }
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() < 3) {
                goto LABEL_19;
              }
              double v29 = VCPLogInstance();
              if (os_log_type_enabled(v29, v37))
              {
                id v34 = [v13 identifier];
                *(_DWORD *)buf = 138412290;
                id v48 = v34;
                _os_log_impl((void *)&_mh_execute_header, v29, v37, "Unsupported SceneNet label in PFSceneTaxonomyNode: %@", buf, 0xCu);
              }
            }
LABEL_18:
          }
LABEL_19:
        }
        float v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v35 = [v9 countByEnumeratingWithState:&v43 objects:v51 count:16];
      id v10 = v35;
    }
    while (v35);
  }
}

- (id)_generateSceneClassificationsFromRequests:(id)a3 andIVSResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableDictionary dictionary];
  unsigned int v9 = +[VCPPreAnalysisRequests includeDO];
  id v10 = +[NSMutableSet set];
  uint64_t v11 = [v6 classificationRequest];
  float v12 = [v11 results];
  if (v9) {
    id v13 = v10;
  }
  else {
    id v13 = 0;
  }
  [(VCPMADSceneAssetBatch *)self _parsePhotosTaxonomyClassificationObservations:v12 toClassificationResults:v8 andDetectorSceneClassIds:v13 isEntityNet:0];

  if (v9)
  {
    id v14 = [v6 objectRequest];
    float v15 = [v14 results];

    uint64_t v16 = [(VCPMADSceneAssetBatch *)self _extractAndSortBoundingBoxFromDetectedObjects:v15];
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x2020000000;
    v53[3] = 0;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10002711C;
    v49[3] = &unk_10021A548;
    id v50 = v10;
    id v51 = v8;
    os_log_type_t v52 = v53;
    [v16 enumerateObjectsUsingBlock:v49];

    _Block_object_dispose(v53, 8);
  }
  os_log_type_t v17 = [v6 classifyImageRequest];
  id v18 = [v17 results];
  [(VCPMADSceneAssetBatch *)self _parsePhotosTaxonomyClassificationObservations:v18 toClassificationResults:v8 andDetectorSceneClassIds:0 isEntityNet:1];

  double v19 = [v6 junkImageRequest];
  double v20 = [v19 results];
  [(VCPMADSceneAssetBatch *)self _parseClassificationObservations:v20 withPrefix:0 toClassificationResults:v8];

  double v21 = [v6 landmarkRequest];
  double v22 = [v21 results];
  [(VCPMADSceneAssetBatch *)self _parseClassificationObservations:v22 withPrefix:0 toClassificationResults:v8];

  double v23 = [v6 nsfwRequest];
  double v24 = [v23 results];
  [(VCPMADSceneAssetBatch *)self _parseClassificationObservations:v24 withPrefix:0 toClassificationResults:v8];

  float v25 = [v6 tabooRequest];
  double v26 = [v25 results];
  [(VCPMADSceneAssetBatch *)self _parseClassificationObservations:v26 withPrefix:0 toClassificationResults:v8];

  double v27 = [v6 semanticRequest];
  long long v28 = [v27 results];
  [(VCPMADSceneAssetBatch *)self _parseClassificationObservations:v28 withPrefix:0 toClassificationResults:v8];

  double v29 = [v6 memeRequest];
  float v30 = [v29 results];
  [(VCPMADSceneAssetBatch *)self _parseClassificationObservations:v30 withPrefix:@"meme_" toClassificationResults:v8];

  CFStringRef v31 = [v6 cityNatureRequest];
  double v32 = [v31 results];
  [(VCPMADSceneAssetBatch *)self _parseClassificationObservations:v32 withPrefix:0 toClassificationResults:v8];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  os_log_type_t v33 = [v6 documentRequest];
  id v34 = [v33 results];

  id v35 = [v34 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v46;
    do
    {
      for (unint64_t i = 0; i != v35; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v46 != v36) {
          objc_enumerationMutation(v34);
        }
        id v38 = [*(id *)(*((void *)&v45 + 1) + 8 * i) labels];
        [(VCPMADSceneAssetBatch *)self _parseClassificationObservations:v38 withPrefix:0 toClassificationResults:v8];
      }
      id v35 = [v34 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v35);
  }

  if (v7)
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100027320;
    v43[3] = &unk_10021A570;
    id v44 = v8;
    [v7 enumerateKeysAndObjectsUsingBlock:v43];
  }
  +[NSMutableSet set];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000274DC;
  v41[3] = &unk_10021A598;
  id v39 = (id)objc_claimAutoreleasedReturnValue();
  id v42 = v39;
  [v8 enumerateKeysAndObjectsUsingBlock:v41];

  return v39;
}

- (int)_collectResultsForAssetEntry:(id)a3 fromRequests:(id)a4 ivsResults:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v255 = a5;
  id v10 = [v8 asset];
  unsigned __int8 v11 = objc_msgSend(v10, "vcp_abnormalImageDimensionForSceneNet");

  if (v11)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v35 = VCPLogInstance();
      os_log_type_t v36 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v35, v36))
      {
        os_log_type_t v37 = [v8 asset];
        id v38 = [v37 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v267 = v38;
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "[%@] Ignoring SceneNet result for tiny asset", buf, 0xCu);
      }
    }
    uint64_t v16 = +[NSSet set];
    float v25 = [v8 results];
    [v25 setSceneClassifications:v16];
  }
  else
  {
    float v12 = [(VCPMADSceneAssetBatch *)self _generateSceneClassificationsFromRequests:v9 andIVSResults:v255];
    id v13 = [v8 results];
    [v13 setSceneClassifications:v12];

    id v14 = [v8 results];
    float v15 = [v14 sceneClassifications];
    uint64_t v16 = [v15 allObjects];

    os_log_type_t v17 = [v8 asset];
    id v18 = [v17 location];
    [v18 coordinate];
    double v20 = v19;

    double v21 = [v8 asset];
    double v22 = [v21 location];
    [v22 coordinate];
    double v24 = v23;

    float v25 = +[PFSceneGeography vcp_sharedSceneGeography];
    double v26 = +[PFSceneTaxonomy vcp_sharedTaxonomy];
    +[PNAssetCurationUtilities assetIconicScoreForSceneClassifications:v16 assetLatitude:v25 assetLongitude:v26 sceneGeography:v20 sceneTaxonomy:v24];
    double v28 = v27;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      double v29 = VCPLogInstance();
      os_log_type_t v30 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v29, v30))
      {
        CFStringRef v31 = [v8 asset];
        double v32 = [v31 localIdentifier];
        *(_DWORD *)buf = 138412546;
        v267 = v32;
        __int16 v268 = 2048;
        double v269 = v28;
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "[%@] Accepting iconicScore: %.3f", buf, 0x16u);
      }
    }
    os_log_type_t v33 = [v8 results];
    *(float *)&double v34 = v28;
    [v33 setIconicScore:v34];
  }
  id v39 = [v9 aestheticsRequest];
  id v40 = [v39 results];
  BOOL v41 = [v40 count] == (id)1;

  if (v41)
  {
    id v42 = [v9 aestheticsRequest];
    long long v43 = [v42 results];
    id v44 = [v43 firstObject];

    [v44 aestheticScore];
    int v46 = v45;
    long long v47 = [v8 results];
    LODWORD(v48) = v46;
    [v47 setOverallAestheticScore:v48];

    [v44 wellFramedSubjectScore];
    int v50 = v49;
    id v51 = [v8 results];
    LODWORD(v52) = v50;
    [v51 setWellFramedSubjectScore:v52];

    [v44 wellChosenBackgroundScore];
    int v54 = v53;
    id v55 = [v8 results];
    LODWORD(v56) = v54;
    [v55 setWellChosenSubjectScore:v56];

    [v44 tastefullyBlurredScore];
    int v58 = v57;
    long long v59 = [v8 results];
    LODWORD(v60) = v58;
    [v59 setTastefullyBlurredScore:v60];

    [v44 sharplyFocusedSubjectScore];
    int v62 = v61;
    long long v63 = [v8 results];
    LODWORD(v64) = v62;
    [v63 setSharplyFocusedSubjectScore:v64];

    [v44 wellTimedShotScore];
    int v66 = v65;
    v67 = [v8 results];
    LODWORD(v68) = v66;
    [v67 setWellTimedShotScore:v68];

    [v44 pleasantLightingScore];
    int v70 = v69;
    __int16 v71 = [v8 results];
    LODWORD(v72) = v70;
    [v71 setPleasantLightingScore:v72];

    [v44 pleasantReflectionsScore];
    int v74 = v73;
    v75 = [v8 results];
    LODWORD(v76) = v74;
    [v75 setPleasantReflectionsScore:v76];

    [v44 harmoniousColorScore];
    int v78 = v77;
    v79 = [v8 results];
    LODWORD(v80) = v78;
    [v79 setHarmoniousColorScore:v80];

    [v44 livelyColorScore];
    int v82 = v81;
    v83 = [v8 results];
    LODWORD(v84) = v82;
    [v83 setLivelyColorScore:v84];

    [v44 pleasantSymmetryScore];
    int v86 = v85;
    v87 = [v8 results];
    LODWORD(v88) = v86;
    [v87 setPleasantSymmetryScore:v88];

    [v44 pleasantPatternScore];
    int v90 = v89;
    v91 = [v8 results];
    LODWORD(v92) = v90;
    [v91 setPleasantPatternScore:v92];

    [v44 immersivenessScore];
    int v94 = v93;
    v95 = [v8 results];
    LODWORD(v96) = v94;
    [v95 setImmersivenessScore:v96];

    [v44 pleasantPerspectiveScore];
    int v98 = v97;
    v99 = [v8 results];
    LODWORD(v100) = v98;
    [v99 setPleasantPerspectiveScore:v100];

    [v44 pleasantPostProcessingScore];
    int v102 = v101;
    v103 = [v8 results];
    LODWORD(v104) = v102;
    [v103 setPleasantPostProcessingScore:v104];

    [v44 noiseScore];
    int v106 = v105;
    v107 = [v8 results];
    LODWORD(v108) = v106;
    [v107 setNoiseScore:v108];

    [v44 failureScore];
    int v110 = v109;
    v111 = [v8 results];
    LODWORD(v112) = v110;
    [v111 setFailureScore:v112];

    [v44 pleasantCompositionScore];
    int v114 = v113;
    v115 = [v8 results];
    LODWORD(v116) = v114;
    [v115 setPleasantCompositionScore:v116];

    [v44 interestingSubjectScore];
    int v118 = v117;
    v119 = [v8 results];
    LODWORD(v120) = v118;
    [v119 setInterestingSubjectScore:v120];

    [v44 intrusiveObjectPresenceScore];
    int v122 = v121;
    v123 = [v8 results];
    LODWORD(v124) = v122;
    [v123 setIntrusiveObjectPresenceScore:v124];

    [v44 pleasantCameraTiltScore];
    int v126 = v125;
    v127 = [v8 results];
    LODWORD(v128) = v126;
    [v127 setPleasantCameraTiltScore:v128];

    [v44 lowKeyLightingScore];
    int v130 = v129;
    v131 = [v8 results];
    LODWORD(v132) = v130;
    [v131 setLowLight:v132];

    v133 = [v9 saliencyRequest];
    v134 = [v133 results];
    BOOL v135 = [v134 count] == (id)1;

    if (v135)
    {
      v136 = [v9 saliencyRequest];
      v137 = [v136 results];
      v138 = [v137 firstObject];
      [v138 boundingBox];
      CGFloat x = v270.origin.x;
      CGFloat y = v270.origin.y;
      CGFloat width = v270.size.width;
      CGFloat height = v270.size.height;
      if (CGRectGetMinX(v270) < 0.0) {
        goto LABEL_21;
      }
      v271.origin.CGFloat x = x;
      v271.origin.CGFloat y = y;
      v271.size.CGFloat width = width;
      v271.size.CGFloat height = height;
      if (CGRectGetMinX(v271) > 1.0) {
        goto LABEL_21;
      }
      v272.origin.CGFloat x = x;
      v272.origin.CGFloat y = y;
      v272.size.CGFloat width = width;
      v272.size.CGFloat height = height;
      if (CGRectGetMinY(v272) < 0.0) {
        goto LABEL_21;
      }
      v273.origin.CGFloat x = x;
      v273.origin.CGFloat y = y;
      v273.size.CGFloat width = width;
      v273.size.CGFloat height = height;
      if (CGRectGetMinY(v273) > 1.0) {
        goto LABEL_21;
      }
      v274.origin.CGFloat x = x;
      v274.origin.CGFloat y = y;
      v274.size.CGFloat width = width;
      v274.size.CGFloat height = height;
      if (CGRectGetMaxX(v274) < 0.0) {
        goto LABEL_21;
      }
      v275.origin.CGFloat x = x;
      v275.origin.CGFloat y = y;
      v275.size.CGFloat width = width;
      v275.size.CGFloat height = height;
      if (CGRectGetMaxX(v275) > 1.0
        || (v276.origin.CGFloat x = x,
            v276.origin.CGFloat y = y,
            v276.size.CGFloat width = width,
            v276.size.CGFloat height = height,
            CGRectGetMaxY(v276) < 0.0))
      {
LABEL_21:

        goto LABEL_22;
      }
      v278.origin.CGFloat x = x;
      v278.origin.CGFloat y = y;
      v278.size.CGFloat width = width;
      v278.size.CGFloat height = height;
      BOOL v151 = CGRectGetMaxY(v278) > 1.0;

      if (v151)
      {
LABEL_22:
        v143 = VCPLogInstance();
        if (os_log_type_enabled(v143, OS_LOG_TYPE_FAULT))
        {
          v145 = [v8 asset];
          v146 = [v145 localIdentifier];
          v147 = [v9 saliencyRequest];
          v148 = [v147 results];
          v149 = [v148 firstObject];
          [v149 boundingBox];
          v150 = NSStringFromRect(v277);
          *(_DWORD *)buf = 138412546;
          v267 = v146;
          __int16 v268 = 2112;
          double v269 = *(double *)&v150;
          _os_log_fault_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_FAULT, "[%@] Unnormalized saliencyRequest bounding box %@; skip",
            buf,
            0x16u);
        }
        goto LABEL_24;
      }
      v152 = [v9 saliencyRequest];
      v153 = [v152 results];
      v154 = [v153 firstObject];
      [v154 boundingBox];
      double v156 = v155;
      double v158 = v157;
      double v160 = v159;
      double v162 = v161;
      v163 = [v8 results];
      objc_msgSend(v163, "setPreferredCropRect:", v156, v158, v160, v162);

      v164 = [v9 saliencyRequest];
      v165 = [v164 results];
      v166 = [v165 firstObject];
      [v166 narrowedBoundingBox];
      CGFloat v167 = v279.origin.x;
      CGFloat v168 = v279.origin.y;
      CGFloat v169 = v279.size.width;
      CGFloat v170 = v279.size.height;
      if (CGRectGetMinX(v279) < 0.0) {
        goto LABEL_35;
      }
      v280.origin.CGFloat x = v167;
      v280.origin.CGFloat y = v168;
      v280.size.CGFloat width = v169;
      v280.size.CGFloat height = v170;
      if (CGRectGetMinX(v280) > 1.0) {
        goto LABEL_35;
      }
      v281.origin.CGFloat x = v167;
      v281.origin.CGFloat y = v168;
      v281.size.CGFloat width = v169;
      v281.size.CGFloat height = v170;
      if (CGRectGetMinY(v281) < 0.0) {
        goto LABEL_35;
      }
      v282.origin.CGFloat x = v167;
      v282.origin.CGFloat y = v168;
      v282.size.CGFloat width = v169;
      v282.size.CGFloat height = v170;
      if (CGRectGetMinY(v282) > 1.0) {
        goto LABEL_35;
      }
      v283.origin.CGFloat x = v167;
      v283.origin.CGFloat y = v168;
      v283.size.CGFloat width = v169;
      v283.size.CGFloat height = v170;
      if (CGRectGetMaxX(v283) < 0.0) {
        goto LABEL_35;
      }
      v284.origin.CGFloat x = v167;
      v284.origin.CGFloat y = v168;
      v284.size.CGFloat width = v169;
      v284.size.CGFloat height = v170;
      if (CGRectGetMaxX(v284) > 1.0
        || (v285.origin.CGFloat x = v167,
            v285.origin.CGFloat y = v168,
            v285.size.CGFloat width = v169,
            v285.size.CGFloat height = v170,
            CGRectGetMaxY(v285) < 0.0))
      {
LABEL_35:

        goto LABEL_36;
      }
      v287.origin.CGFloat x = v167;
      v287.origin.CGFloat y = v168;
      v287.size.CGFloat width = v169;
      v287.size.CGFloat height = v170;
      BOOL v177 = CGRectGetMaxY(v287) > 1.0;

      if (v177)
      {
LABEL_36:
        v143 = VCPLogInstance();
        if (os_log_type_enabled(v143, OS_LOG_TYPE_FAULT))
        {
          v171 = [v8 asset];
          v172 = [v171 localIdentifier];
          v173 = [v9 saliencyRequest];
          v174 = [v173 results];
          v175 = [v174 firstObject];
          [v175 narrowedBoundingBox];
          v176 = NSStringFromRect(v286);
          *(_DWORD *)buf = 138412546;
          v267 = v172;
          __int16 v268 = 2112;
          double v269 = *(double *)&v176;
          _os_log_fault_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_FAULT, "[%@] Unnormalized saliencyRequest narrowed bounding box %@; skip",
            buf,
            0x16u);
        }
        goto LABEL_24;
      }
      v178 = [v9 saliencyRequest];
      v179 = [v178 results];
      v180 = [v179 firstObject];
      [v180 narrowedBoundingBox];
      double v182 = v181;
      double v184 = v183;
      double v186 = v185;
      double v188 = v187;
      v189 = [v8 results];
      objc_msgSend(v189, "setAcceptableCropRect:", v182, v184, v186, v188);

      if (+[VCPPreAnalysisRequests includeSO])
      {
        v190 = [v9 saliencyObjectnessRequest];
        v191 = [v190 results];
        BOOL v192 = [v191 count] == (id)1;

        if (!v192) {
          goto LABEL_85;
        }
        v193 = [v9 saliencyObjectnessRequest];
        v194 = [v193 results];
        v195 = [v194 firstObject];
        v249 = [v195 salientObjects];

        v196 = +[NSMutableArray array];
        long long v262 = 0u;
        long long v263 = 0u;
        long long v260 = 0u;
        long long v261 = 0u;
        v143 = v249;
        id v197 = [v143 countByEnumeratingWithState:&v260 objects:v265 count:16];
        if (v197)
        {
          uint64_t v252 = *(void *)v261;
LABEL_43:
          uint64_t v198 = 0;
          while (1)
          {
            if (*(void *)v261 != v252) {
              objc_enumerationMutation(v143);
            }
            v199 = *(void **)(*((void *)&v260 + 1) + 8 * v198);
            if ((unint64_t)[v196 count] > 2) {
              break;
            }
            [v199 boundingBox];
            CGFloat v200 = v288.origin.x;
            CGFloat v201 = v288.origin.y;
            CGFloat v202 = v288.size.width;
            CGFloat v203 = v288.size.height;
            if (CGRectGetMinX(v288) < 0.0) {
              goto LABEL_88;
            }
            v289.origin.CGFloat x = v200;
            v289.origin.CGFloat y = v201;
            v289.size.CGFloat width = v202;
            v289.size.CGFloat height = v203;
            if (CGRectGetMinX(v289) > 1.0) {
              goto LABEL_88;
            }
            v290.origin.CGFloat x = v200;
            v290.origin.CGFloat y = v201;
            v290.size.CGFloat width = v202;
            v290.size.CGFloat height = v203;
            if (CGRectGetMinY(v290) < 0.0) {
              goto LABEL_88;
            }
            v291.origin.CGFloat x = v200;
            v291.origin.CGFloat y = v201;
            v291.size.CGFloat width = v202;
            v291.size.CGFloat height = v203;
            if (CGRectGetMinY(v291) > 1.0) {
              goto LABEL_88;
            }
            v292.origin.CGFloat x = v200;
            v292.origin.CGFloat y = v201;
            v292.size.CGFloat width = v202;
            v292.size.CGFloat height = v203;
            if (CGRectGetMaxX(v292) < 0.0) {
              goto LABEL_88;
            }
            v293.origin.CGFloat x = v200;
            v293.origin.CGFloat y = v201;
            v293.size.CGFloat width = v202;
            v293.size.CGFloat height = v203;
            if (CGRectGetMaxX(v293) > 1.0) {
              goto LABEL_88;
            }
            v294.origin.CGFloat x = v200;
            v294.origin.CGFloat y = v201;
            v294.size.CGFloat width = v202;
            v294.size.CGFloat height = v203;
            if (CGRectGetMaxY(v294) < 0.0
              || (v295.origin.CGFloat x = v200,
                  v295.origin.CGFloat y = v201,
                  v295.size.CGFloat width = v202,
                  v295.size.CGFloat height = v203,
                  CGRectGetMaxY(v295) > 1.0))
            {
LABEL_88:
              v244 = VCPLogInstance();
              if (os_log_type_enabled(v244, OS_LOG_TYPE_FAULT))
              {
                v245 = [v8 asset];
                v246 = [v245 localIdentifier];
                [v199 boundingBox];
                v247 = NSStringFromRect(v296);
                *(_DWORD *)buf = 138412546;
                v267 = v246;
                __int16 v268 = 2112;
                double v269 = *(double *)&v247;
                _os_log_fault_impl((void *)&_mh_execute_header, v244, OS_LOG_TYPE_FAULT, "[%@] Unnormalized salientObject bounding box %@; skip",
                  buf,
                  0x16u);
              }
              goto LABEL_24;
            }
            [v199 boundingBox];
            v204 = +[NSValue valueWithRect:](NSValue, "valueWithRect:");
            [v196 addObject:v204];

            if (v197 == (id)++v198)
            {
              id v197 = [v143 countByEnumeratingWithState:&v260 objects:v265 count:16];
              if (v197) {
                goto LABEL_43;
              }
              break;
            }
          }
        }

        v205 = [v8 results];
        [v205 setObjectSaliencyRects:v196];
      }
      v206 = [v9 sceneprintRequest];
      v207 = [v206 results];
      BOOL v208 = [v207 count] == (id)1;

      if (v208)
      {
        v209 = [v9 sceneprintRequest];
        v210 = [v209 results];
        v211 = [v210 firstObject];
        v212 = [v211 sceneprints];
        v143 = [v212 firstObject];

        if ([v143 elementType] != (id)1) {
          goto LABEL_24;
        }
        if ([v143 elementCount] != (id)768) {
          goto LABEL_24;
        }
        v213 = [v143 descriptorData];
        BOOL v214 = [v213 length] == (id)3072;

        if (!v214) {
          goto LABEL_24;
        }
        v215 = +[NSKeyedArchiver archivedDataWithRootObject:v143 requiringSecureCoding:1 error:0];
        v216 = [v8 results];
        [v216 setSceneprintData:v215];

        if (+[VCPPreAnalysisRequests includePA])
        {
          v217 = [v9 adjustmentsRequest];
          v218 = [v217 results];
          BOOL v219 = [v218 count] == 0;

          if (v219) {
            goto LABEL_24;
          }
          v220 = [v9 adjustmentsRequest];
          v221 = [v220 results];
          v253 = [v221 objectAtIndexedSubscript:0];

          v250 = +[NSMutableDictionary dictionary];
          long long v258 = 0u;
          long long v259 = 0u;
          long long v256 = 0u;
          long long v257 = 0u;
          id obj = [v253 adjustmentKeys];
          id v222 = [obj countByEnumeratingWithState:&v256 objects:v264 count:16];
          if (v222)
          {
            uint64_t v223 = *(void *)v257;
            do
            {
              for (unint64_t i = 0; i != v222; unint64_t i = (char *)i + 1)
              {
                if (*(void *)v257 != v223) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v225 = *(void *)(*((void *)&v256 + 1) + 8 * i);
                v226 = [v253 adjustmentValuesForKey:v225];
                [v250 setObject:v226 forKeyedSubscript:v225];
              }
              id v222 = [obj countByEnumeratingWithState:&v256 objects:v264 count:16];
            }
            while (v222);
          }

          v227 = PHAssetMediaAnalysisDataWithColorNormalizationDictionaryAndRevision();
          v228 = [v8 results];
          [v228 setColorNormalizationData:v227];
        }
        v229 = [v9 imagefingerprintsRequest];
        BOOL v231 = (v11 & 1) == 0 && v229 != 0;

        if (!v231) {
          goto LABEL_97;
        }
        v232 = [v9 imagefingerprintsRequest];
        v233 = [v232 results];

        if ([v233 count])
        {
          v234 = [v233 firstObject];
          v235 = [v234 fingerprintHashes];

          if (v235 && [v235 count] == (id)2)
          {
            v236 = [v235 objectAtIndexedSubscript:0];
            v254 = [v236 hashData];

            if ([v254 length] == (id)24)
            {
              v237 = [v235 objectAtIndexedSubscript:1];
              v238 = [v237 hashData];

              if ([v238 length] == (id)24)
              {
                v251 = +[NSMutableData dataWithBytes:&unk_1001F201C length:1];
                [v251 appendData:v238];
                id v239 = v251;

                v240 = [v8 results];
                [v240 setDuplicateMatchingFeature:v254];

                v241 = [v8 results];
                [v241 setDuplicateMatchingAlternateFeature:v239];

                int v242 = 0;
                v238 = v239;
              }
              else
              {
                int v242 = 1;
              }
            }
            else
            {
              int v242 = 1;
            }

            if (v242) {
              goto LABEL_24;
            }
LABEL_97:
            int v144 = 0;
            goto LABEL_25;
          }
        }
        else
        {
        }
LABEL_24:
        int v144 = -18;
LABEL_25:

LABEL_86:
        goto LABEL_87;
      }
    }
LABEL_85:
    int v144 = -18;
    goto LABEL_86;
  }
  int v144 = -18;
LABEL_87:

  return v144;
}

- (int)_performSceneNetAnalysisForAssetEntry:(id)a3 withImage:(id)a4 andRequests:(id)a5
{
  id v7 = a3;
  id v102 = a4;
  int v97 = v7;
  id v98 = a5;
  id v8 = [v7 asset];
  id v9 = objc_msgSend(v8, "vcp_abnormalImageDimensionForSceneNet");

  if (!v9)
  {
    CFTypeRef cf = 0;
    [v98 mapAvailableRequestsToResolution];
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    int v101 = v117 = 0u;
    id v39 = [v101 allKeys];
    id v40 = 0;
    id v41 = [v39 countByEnumeratingWithState:&v116 objects:v123 count:16];
    if (v41)
    {
      uint64_t v99 = *(void *)v117;
      int v94 = v106;
      v95 = v111;
      *(void *)&long long v42 = 67109376;
      long long v93 = v42;
      id obj = v39;
      while (2)
      {
        long long v43 = 0;
        id v44 = v40;
        do
        {
          if (*(void *)v117 != v99) {
            objc_enumerationMutation(obj);
          }
          int v45 = *(void **)(*((void *)&v116 + 1) + 8 * (void)v43);
          if (+[VCPPreAnalysisRequests isDimensionUnknown:](VCPPreAnalysisRequests, "isDimensionUnknown:", v45, v93, v94, v95))
          {
            double Width = (double)CVPixelBufferGetWidth((CVPixelBufferRef)[v102 sourcePixelBuffer]);
            double Height = (double)CVPixelBufferGetHeight((CVPixelBufferRef)[v102 sourcePixelBuffer]);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            v111[0] = sub_10002A0A4;
            v111[1] = &unk_10021A5C0;
            id v112 = v101;
            int v113 = v45;
            double v114 = Width;
            double v115 = Height;
            if (qword_1002524B0 != -1) {
              dispatch_once(&qword_1002524B0, block);
            }
          }
          else
          {
            [v45 sizeValue];
            double Width = v48;
            double Height = v49;
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          LODWORD(v39) = [v102 pixelBuffer:&cf width:(unint64_t)Width height:(unint64_t)Height];
          if (v39)
          {
            id v40 = v44;
LABEL_66:

            char v65 = 0;
            os_log_type_t v37 = 0;
            goto LABEL_103;
          }
          id v50 = objc_alloc((Class)VNImageRequestHandler);
          id v39 = [v50 initWithCVPixelBuffer:cf options:&__NSDictionary0__struct session:self->_session];
          id v51 = [v101 objectForKeyedSubscript:v45];
          if ([v51 count] == (id)1)
          {
            v105[0] = _NSConcreteStackBlock;
            v105[1] = 3221225472;
            v106[0] = sub_10002A1B4;
            v106[1] = &unk_10021A408;
            id v107 = v51;
            double v108 = Width;
            double v109 = Height;
            if (qword_1002524B8 != -1) {
              dispatch_once(&qword_1002524B8, v105);
            }
          }
          double v52 = VCPSignPostLog();
          os_signpost_id_t v53 = os_signpost_id_generate(v52);

          int v54 = VCPSignPostLog();
          id v55 = v54;
          if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
          {
            *(_DWORD *)buf = v93;
            *(_DWORD *)int v125 = (int)Width;
            *(_WORD *)&v125[4] = 1024;
            *(_DWORD *)&v125[6] = (int)Height;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v55, OS_SIGNPOST_INTERVAL_BEGIN, v53, "VNImageRequestHandler_PerformRequests", "%dx%d", buf, 0xEu);
          }

          id v104 = v44;
          unsigned __int8 v56 = [v39 performRequests:v51 error:&v104];
          id v40 = v104;

          int v57 = VCPSignPostLog();
          int v58 = v57;
          if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
          {
            *(_DWORD *)buf = v93;
            *(_DWORD *)int v125 = (int)Width;
            *(_WORD *)&v125[4] = 1024;
            *(_DWORD *)&v125[6] = (int)Height;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v58, OS_SIGNPOST_INTERVAL_END, v53, "VNImageRequestHandler_PerformRequests", "%dx%d", buf, 0xEu);
          }

          if ((v56 & 1) == 0)
          {
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              long long v63 = VCPLogInstance();
              os_log_type_t v64 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v63, v64))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)int v125 = v40;
                _os_log_impl((void *)&_mh_execute_header, v63, v64, "Failed to run VNImageRequestHandler::performRequests: %@", buf, 0xCu);
              }
            }
            LODWORD(v39) = -18;
            goto LABEL_66;
          }

          long long v43 = (char *)v43 + 1;
          id v44 = v40;
        }
        while (v41 != v43);
        id v39 = obj;
        id v41 = [obj countByEnumeratingWithState:&v116 objects:v123 count:16];
        if (v41) {
          continue;
        }
        break;
      }
    }

    if (!+[VCPPreAnalysisRequests includeIVS])
    {
      os_log_type_t v37 = 0;
      goto LABEL_102;
    }
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    LODWORD(v39) = [v102 pixelBuffer:&cf width:299 height:299];
    if (v39)
    {
      os_log_type_t v37 = 0;
      int v60 = 1;
      goto LABEL_100;
    }
    int v69 = [(VCPObjectPool *)self->_ivsPool getObject];
    int v70 = [v69 object];
    BOOL v71 = v70 == 0;

    if (v71)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        os_log_type_t v37 = 0;
        int v60 = 1;
        goto LABEL_99;
      }
      int v77 = VCPLogInstance();
      os_log_type_t v85 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v77, v85))
      {
        int v86 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        *(void *)int v125 = v86;
        id v87 = v86;
        _os_log_impl((void *)&_mh_execute_header, v77, v85, "%@ unavailable for IVS", buf, 0xCu);
      }
      os_log_type_t v37 = 0;
      int v60 = 1;
    }
    else
    {
      double v72 = VCPSignPostLog();
      os_signpost_id_t v73 = os_signpost_id_generate(v72);

      int v74 = VCPSignPostLog();
      v75 = v74;
      if (v73 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v75, OS_SIGNPOST_INTERVAL_BEGIN, v73, "CommSafetyHandler_IVS", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      double v76 = [v69 object];
      id v103 = v40;
      int v77 = [v76 analyzePixelBuffer:cf error:&v103];
      id v78 = v103;

      v79 = VCPSignPostLog();
      double v80 = v79;
      if (v73 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v80, OS_SIGNPOST_INTERVAL_END, v73, "CommSafetyHandler_IVS", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if (v78)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          int v81 = VCPLogInstance();
          os_log_type_t v82 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v81, v82))
          {
            v83 = objc_opt_class();
            *(_DWORD *)buf = 138412546;
            *(void *)int v125 = v83;
            *(_WORD *)&v125[8] = 2112;
            id v126 = v78;
            id v84 = v83;
            _os_log_impl((void *)&_mh_execute_header, v81, v82, "Failed to run %@::analyzePixelBuffer:error: %@", buf, 0x16u);
          }
        }
        os_log_type_t v37 = 0;
        int v60 = 1;
      }
      else
      {
        os_log_type_t v37 = [v77 scoresForLabels];
        int v60 = 0;
      }
      id v40 = v78;
    }

LABEL_99:
    LODWORD(v39) = -18;
LABEL_100:
    if (v60)
    {
      char v65 = 0;
      goto LABEL_103;
    }
LABEL_102:
    char v65 = 1;
LABEL_103:

    sub_100004484(&cf);
    if ((v65 & 1) == 0) {
      goto LABEL_107;
    }
    goto LABEL_104;
  }
  id v10 = objc_msgSend(objc_alloc((Class)VNImageRequestHandler), "initWithCVPixelBuffer:options:session:", objc_msgSend(v102, "sourcePixelBuffer"), &__NSDictionary0__struct, self->_session);
  unsigned __int8 v11 = VCPSignPostLog();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  id v13 = VCPSignPostLog();
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "VNImageRequestHandler_PerformRequests", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  float v15 = [v98 gatherAvailableRequests];
  id v122 = 0;
  unsigned __int8 v16 = [v10 performRequests:v15 error:&v122];
  id v17 = v122;

  id v18 = VCPSignPostLog();
  double v19 = v18;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, v12, "VNImageRequestHandler_PerformRequests", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((v16 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int v61 = VCPLogInstance();
      os_log_type_t v62 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v61, v62))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)int v125 = v17;
        _os_log_impl((void *)&_mh_execute_header, v61, v62, "Failed to run VNImageRequestHandler::performRequests: %@", buf, 0xCu);
      }
    }
    os_log_type_t v37 = 0;
    goto LABEL_76;
  }
  if (+[VCPPreAnalysisRequests includeIVS])
  {
    double v21 = [(VCPObjectPool *)self->_ivsPool getObject];
    double v22 = [v21 object];
    BOOL v23 = v22 == 0;

    if (v23)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        os_log_type_t v37 = 0;
        int v38 = 1;
LABEL_75:

        if (v38)
        {
LABEL_76:

          LODWORD(v39) = -18;
          goto LABEL_107;
        }
        goto LABEL_77;
      }
      double v29 = VCPLogInstance();
      os_log_type_t v66 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v29, v66))
      {
        v67 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        *(void *)int v125 = v67;
        id v68 = v67;
        _os_log_impl((void *)&_mh_execute_header, v29, v66, "%@ unavailable for IVS", buf, 0xCu);
      }
      os_log_type_t v37 = 0;
      int v38 = 1;
    }
    else
    {
      double v24 = VCPSignPostLog();
      os_signpost_id_t v25 = os_signpost_id_generate(v24);

      double v26 = VCPSignPostLog();
      double v27 = v26;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "CommSafetyHandler_IVS", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      double v28 = [v21 object];
      id v121 = v17;
      double v29 = objc_msgSend(v28, "analyzePixelBuffer:error:", objc_msgSend(v102, "sourcePixelBuffer"), &v121);
      id v30 = v121;

      CFStringRef v31 = VCPSignPostLog();
      double v32 = v31;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, v25, "CommSafetyHandler_IVS", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if (v30)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          os_log_type_t v33 = VCPLogInstance();
          os_log_type_t v34 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v33, v34))
          {
            id v35 = objc_opt_class();
            *(_DWORD *)buf = 138412546;
            *(void *)int v125 = v35;
            *(_WORD *)&v125[8] = 2112;
            id v126 = v30;
            id v36 = v35;
            _os_log_impl((void *)&_mh_execute_header, v33, v34, "Failed to run %@::analyzePixelBuffer:error: %@", buf, 0x16u);
          }
        }
        os_log_type_t v37 = 0;
        int v38 = 1;
      }
      else
      {
        os_log_type_t v37 = [v29 scoresForLabels];
        int v38 = 0;
      }
      id v17 = v30;
    }

    goto LABEL_75;
  }
  os_log_type_t v37 = 0;
LABEL_77:

LABEL_104:
  if (!+[VCPPreAnalysisRequests includeWP]) {
    goto LABEL_106;
  }
  double v88 = [v98 sceneprintRequest];
  int v89 = [v88 results];

  id v39 = [v89 firstObject];
  int v90 = [v39 sceneprints];
  v91 = [v90 firstObject];

  LODWORD(v39) = [(VCPMADSceneAssetBatch *)self _performWallpaperAnalysisForAssetEntry:v97 withSceneprint:v91];
  if (!v39) {
LABEL_106:
  }
    LODWORD(v39) = [(VCPMADSceneAssetBatch *)self _collectResultsForAssetEntry:v97 fromRequests:v98 ivsResults:v37];
LABEL_107:

  return (int)v39;
}

- (int)_performBlurAnalysisForAssetEntry:(id)a3 withLumaPixelBuffer:(__CVBuffer *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4)
  {
    id v8 = VCPSignPostLog();
    os_signpost_id_t v9 = os_signpost_id_generate(v8);

    id v10 = VCPSignPostLog();
    unsigned __int8 v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(buf.data) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPSceneAnalyzerImageBlurAnalysis", (const char *)&unk_1001F3BD3, (uint8_t *)&buf, 2u);
    }

    id v12 = +[VCPPreAnalysisRequests sharpnessRevision];
    id v13 = objc_alloc((Class)VCPImageBlurAnalyzer);
    id v14 = [v7 asset];
    id v66 = objc_msgSend(v13, "initWithFaceResults:sdof:revision:", 0, objc_msgSend(v14, "vcp_isSdofPhoto"), v12);

    float v15 = [v7 asset];
    LOBYTE(v12) = objc_msgSend(v15, "vcp_abnormalImageDimensionForSceneNet") == 0;

    if (v12)
    {
      id v67 = 0;
      int v22 = [v66 analyzePixelBuffer:a4 flags:0 results:&v67 cancel:&stru_10021A600];
      id v23 = v67;
      id v24 = v23;
      if (!v22)
      {
        os_signpost_id_t v25 = [v23 objectForKeyedSubscript:@"BlurResults"];
        double v26 = [v25 objectAtIndexedSubscript:0];
        double v27 = [v26 objectForKeyedSubscript:@"attributes"];

        double v28 = [v27 objectForKeyedSubscript:@"sharpness"];
        [v28 floatValue];
        float v30 = v29;

        CFStringRef v31 = [v7 results];
        double v32 = v31;
        LODWORD(v33) = 1.0;
        if (v30 < 1.0) {
          *(float *)&double v33 = v30;
        }
        if (v30 <= 0.0) {
          *(float *)&double v33 = 0.0;
        }
        [v31 setBlurrinessScore:v33];

LABEL_40:
        long long v43 = VCPSignPostLog();
        id v44 = v43;
        if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
        {
          LOWORD(buf.data) = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_END, v9, "VCPSceneAnalyzerImageBlurAnalysis", (const char *)&unk_1001F3BD3, (uint8_t *)&buf, 2u);
        }

        int v22 = 0;
      }
    }
    else
    {
      size_t Width = CVPixelBufferGetWidth(a4);
      size_t Height = CVPixelBufferGetHeight(a4);
      size_t v18 = Height;
      if (Width <= Height) {
        size_t v19 = Height / Width;
      }
      else {
        size_t v19 = Width / Height;
      }
      double v76 = 0;
      int v22 = [(VCPPoolBasedPixelBufferCreator *)self->_monochromeBufferCreator createPixelBuffer:&v76];
      if (!v22)
      {
        CVPixelBufferRef v74 = a4;
        CVPixelBufferLockFlags v75 = 1;
        int v22 = CVPixelBufferLockBaseAddress(a4, 1uLL);
        LODWORD(v73) = v22;
        if (!v22
          || os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)
          && (LODWORD(buf.data) = 134218240,
              *(void **)((char *)&buf.data + 4) = v74,
              WORD2(buf.height) = 1024,
              *(_DWORD *)((char *)&buf.height + 6) = v22,
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&buf, 0x12u), (int v22 = v73) == 0))
        {
          LODWORD(v70) = 0;
          CVPixelBufferRef pixelBuffer = v76;
          CVPixelBufferLockFlags unlockFlags = 0;
          if (v76)
          {
            int v22 = CVPixelBufferLockBaseAddress(v76, 0);
            LODWORD(v70) = v22;
            if (v22)
            {
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)
                || (LODWORD(buf.data) = 134218240,
                    *(void **)((char *)&buf.data + 4) = pixelBuffer,
                    WORD2(buf.height) = 1024,
                    *(_DWORD *)((char *)&buf.height + 6) = v22,
                    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&buf, 0x12u), (int v22 = v70) != 0))
              {
                id v24 = 0;
LABEL_25:
                char v34 = 0;
                goto LABEL_29;
              }
            }
            BaseAddress = (char *)CVPixelBufferGetBaseAddress(a4);
            size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
            if (v19)
            {
              unint64_t v65 = 0;
              long long v47 = 0;
              uint64_t v48 = BytesPerRow;
              if (Width > v18) {
                uint64_t v48 = 1;
              }
              vImagePixelCount v63 = kVCPMAPreAnalysisScaledSize;
              uint64_t v62 = v48 * kVCPMAPreAnalysisScaledSize;
              float v49 = 0.0;
              while (1)
              {
                buf.data = BaseAddress;
                buf.CGFloat height = v63;
                buf.CGFloat width = v63;
                buf.rowBytes = BytesPerRow;
                dest.data = CVPixelBufferGetBaseAddress(v76);
                dest.CGFloat height = CVPixelBufferGetHeight(v76);
                dest.CGFloat width = CVPixelBufferGetWidth(v76);
                dest.rowBytes = CVPixelBufferGetBytesPerRow(v76);
                int v22 = vImageScale_Planar8(&buf, &dest, 0, 0);
                if (v22) {
                  break;
                }
                id v68 = v47;
                int v22 = [v66 analyzePixelBuffer:v76 flags:0 results:&v68 cancel:&stru_10021A5E0];
                id v24 = v68;

                if (v22) {
                  goto LABEL_25;
                }
                id v50 = [v24 objectForKeyedSubscript:@"BlurResults"];
                id v51 = [v50 objectAtIndexedSubscript:0];
                double v52 = [v51 objectForKeyedSubscript:@"attributes"];

                os_signpost_id_t v53 = [v52 objectForKeyedSubscript:@"sharpness"];
                int v54 = v53;
                if (v53)
                {
                  [v53 floatValue];
                  float v49 = v49 + v55;
                  ++v65;
                }

                BaseAddress += v62;
                long long v47 = v24;
                if (!--v19) {
                  goto LABEL_58;
                }
              }
              id v24 = v47;
              goto LABEL_25;
            }
            id v24 = 0;
            unint64_t v65 = 0;
            float v49 = 0.0;
LABEL_58:
            int v22 = sub_10002ABAC(&v70);
            if (v22) {
              goto LABEL_25;
            }
            int v22 = sub_10002ABAC(&v73);
            if (v22) {
              goto LABEL_25;
            }
            unsigned __int8 v56 = [v7 results];
            int v57 = v56;
            float v58 = v49 / (float)v65;
            float v59 = 1.0;
            if (v58 < 1.0) {
              float v59 = v49 / (float)v65;
            }
            BOOL v60 = v58 > 0.0;
            double v61 = 0.0;
            if (v60) {
              *(float *)&double v61 = v59;
            }
            [v56 setBlurrinessScore:v61];

            int v22 = 0;
            char v34 = 1;
          }
          else
          {
            BOOL v35 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v35) {
              sub_10003036C(v35, v36, v37, v38, v39, v40, v41, v42);
            }
            id v24 = 0;
            char v34 = 0;
            int v22 = -50;
            LODWORD(v70) = -50;
          }
LABEL_29:
          if (pixelBuffer
            && !v70
            && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_1000302FC();
          }
          if (v74
            && !v73
            && CVPixelBufferUnlockBaseAddress(v74, v75)
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_1000302FC();
          }
          sub_100004484((const void **)&v76);
          if ((v34 & 1) == 0) {
            goto LABEL_44;
          }
          goto LABEL_40;
        }
      }
      sub_100004484((const void **)&v76);
      id v24 = 0;
    }
LABEL_44:

    goto LABEL_45;
  }
  double v20 = [v6 results];
  LODWORD(v21) = 0.5;
  [v20 setBlurrinessScore:v21];

  int v22 = 0;
LABEL_45:

  return v22;
}

- (int)_performExposureAnalysisForAssetEntry:(id)a3 withLumaPixelBuffer:(__CVBuffer *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    id v7 = VCPSignPostLog();
    os_signpost_id_t v8 = os_signpost_id_generate(v7);

    os_signpost_id_t v9 = VCPSignPostLog();
    id v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)vImage_Buffer buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "VCPSceneAnalyzerExposureAnalysis", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    id v11 = objc_alloc_init((Class)VCPImageExposurePreAnalyzer);
    id v28 = 0;
    int v12 = [v11 analyzePixelBuffer:a4 flags:0 results:&v28 cancel:&stru_10021A620];
    id v13 = v28;
    if (!v12)
    {
      id v14 = VCPSignPostLog();
      float v15 = v14;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)double v27 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, v8, "VCPSceneAnalyzerExposureAnalysis", (const char *)&unk_1001F3BD3, v27, 2u);
      }

      unsigned __int8 v16 = [v13 objectForKeyedSubscript:@"ExposureResults"];
      id v17 = [v16 objectAtIndexedSubscript:0];
      size_t v18 = [v17 objectForKeyedSubscript:@"quality"];
      [v18 floatValue];
      float v20 = v19;

      double v21 = [v6 results];
      int v22 = v21;
      LODWORD(v23) = 1.0;
      if (v20 < 1.0) {
        *(float *)&double v23 = v20;
      }
      if (v20 <= 0.0) {
        *(float *)&double v23 = 0.0;
      }
      [v21 setExposureScore:v23];
    }
  }
  else
  {
    id v24 = [v5 results];
    LODWORD(v25) = 0.5;
    [v24 setExposureScore:v25];

    int v12 = 0;
  }

  return v12;
}

- (int)_performRotationAnalysisForAssetEntry:(id)a3 withColorPixelBuffer:(__CVBuffer *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (!a4)
  {
    id v13 = [v6 results];
    [v13 setProbableRotationDirection:1];

    id v14 = [v7 results];
    [v14 setProbableRotationDirectionConfidence:0.0];

    int v12 = 0;
    goto LABEL_9;
  }
  os_signpost_id_t v8 = VCPSignPostLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = VCPSignPostLog();
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf.data) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPSceneAnalyzerRotationAnalysisScaling", (const char *)&unk_1001F3BD3, (uint8_t *)&buf, 2u);
  }

  CVPixelBufferRef pixelBuffer = 0;
  [(VCPPoolBasedPixelBufferCreator *)self->_rotationBufferCreator createPixelBuffer:&pixelBuffer];
  CVPixelBufferRef v57 = a4;
  CVPixelBufferLockFlags unlockFlags = 1;
  int v12 = CVPixelBufferLockBaseAddress(a4, 1uLL);
  LODWORD(v56) = v12;
  if (!v12
    || os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)
    && (LODWORD(buf.data) = 134218240,
        *(void **)((char *)&buf.data + 4) = v57,
        WORD2(buf.height) = 1024,
        *(_DWORD *)((char *)&buf.height + 6) = v12,
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&buf, 0x12u), (int v12 = v56) == 0))
  {
    buf.data = CVPixelBufferGetBaseAddress(a4);
    buf.CGFloat height = CVPixelBufferGetHeight(a4);
    buf.CGFloat width = CVPixelBufferGetWidth(a4);
    buf.rowBytes = CVPixelBufferGetBytesPerRow(a4);
    LODWORD(v53) = 0;
    CVPixelBufferRef v54 = pixelBuffer;
    CVPixelBufferLockFlags v55 = 0;
    if (!pixelBuffer)
    {
      BOOL v41 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v41) {
        sub_10003036C(v41, v42, v43, v44, v45, v46, v47, v48);
      }
      int v12 = -50;
      goto LABEL_36;
    }
    int v12 = CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    LODWORD(v53) = v12;
    if (v12)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)
        || (LODWORD(v60.data) = 134218240,
            *(void **)((char *)&v60.data + 4) = v54,
            WORD2(v60.height) = 1024,
            *(_DWORD *)((char *)&v60.height + 6) = v12,
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&v60, 0x12u), (int v12 = v53) != 0))
      {
LABEL_36:
        if (v57
          && !v56
          && CVPixelBufferUnlockBaseAddress(v57, unlockFlags)
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_1000302FC();
        }
        goto LABEL_7;
      }
    }
    v60.data = CVPixelBufferGetBaseAddress(pixelBuffer);
    v60.CGFloat height = CVPixelBufferGetHeight(pixelBuffer);
    v60.CGFloat width = CVPixelBufferGetWidth(pixelBuffer);
    v60.rowBytes = CVPixelBufferGetBytesPerRow(pixelBuffer);
    int v12 = vImageScale_ARGB8888(&buf, &v60, 0, 0x20u);
    if (v12 || (int v12 = sub_10002ABAC(&v53)) != 0 || (int v12 = sub_10002ABAC(&v56)) != 0)
    {
LABEL_48:
      if (v54
        && !v53
        && CVPixelBufferUnlockBaseAddress(v54, v55)
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1000302FC();
      }
      goto LABEL_36;
    }
    unsigned __int8 v16 = VCPSignPostLog();
    id v17 = v16;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)double v52 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, v9, "VCPSceneAnalyzerRotationAnalysisScaling", (const char *)&unk_1001F3BD3, v52, 2u);
    }

    size_t v18 = VCPSignPostLog();
    os_signpost_id_t v19 = os_signpost_id_generate(v18);

    float v20 = VCPSignPostLog();
    double v21 = v20;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)double v52 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "VCPSceneAnalyzerRotationAnalysisInference", (const char *)&unk_1001F3BD3, v52, 2u);
    }

    CVPixelBufferRef v22 = pixelBuffer;
    double v23 = [(VCPMAMLModel *)self->_rotationModel inputFeatureName];
    id v24 = +[VCPMAMLFeatureProvider featureProviderWithCVPixelBuffer:v22 andFeatureName:v23];

    double v25 = [(VCPMAMLModel *)self->_rotationModel model];
    id v51 = 0;
    double v26 = [v25 predictionFromFeatures:v24 error:&v51];
    id v50 = v51;

    double v27 = [(VCPMAMLModel *)self->_rotationModel outputFeatureName];
    id v28 = [v26 featureValueForName:v27];

    float v29 = [v28 multiArrayValue];
    if ([v29 count] == (id)4)
    {
      uint64_t v30 = 0;
      __int16 v31 = 0;
      float v32 = 0.0;
      do
      {
        double v33 = objc_msgSend(v29, "objectAtIndexedSubscript:", v30, v50);
        [v33 floatValue];
        float v35 = v34;

        if (v35 > v32)
        {
          float v32 = v35;
          __int16 v31 = v30;
        }
        ++v30;
      }
      while (v30 != 4);
      uint64_t v36 = [v7 results];
      [v36 setProbableRotationDirection:(__int16)(v31 + 1)];

      uint64_t v37 = [v7 results];
      *(float *)&double v38 = v32;
      [v37 setProbableRotationDirectionConfidence:v38];

      uint64_t v39 = VCPSignPostLog();
      uint64_t v40 = v39;
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
      {
        *(_WORD *)double v52 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_END, v19, "VCPSceneAnalyzerRotationAnalysisInference", (const char *)&unk_1001F3BD3, v52, 2u);
      }
      int v12 = 0;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v12 = -18;
        goto LABEL_47;
      }
      uint64_t v40 = VCPLogInstance();
      os_log_type_t v49 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v40, v49))
      {
        *(_WORD *)double v52 = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, v49, "[ProbableRotation] invalid coreML results", v52, 2u);
      }
      int v12 = -18;
    }

LABEL_47:
    goto LABEL_48;
  }
LABEL_7:
  sub_100004484((const void **)&pixelBuffer);
LABEL_9:

  return v12;
}

- (int)_performEmbeddingAnalysisForAssetEntry:(id)a3 withColorPixelBuffer:(__CVBuffer *)a4
{
  id v6 = a3;
  id v7 = [v6 asset];
  os_signpost_id_t v8 = [v7 localIdentifier];
  os_signpost_id_t v9 = +[NSString stringWithFormat:@"[Scene][Embedding][%@]", v8];

  id v10 = VCPSignPostLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  int v12 = VCPSignPostLog();
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(buf.data) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "VCPSceneAnalyzerEmbeddingAnalysisScaling", (const char *)&unk_1001F3BD3, (uint8_t *)&buf, 2u);
  }

  CVPixelBufferRef pixelBuffer = 0;
  [(VCPPoolBasedPixelBufferCreator *)self->_embeddingBufferCreator createPixelBuffer:&pixelBuffer];
  LODWORD(v54) = 0;
  CVPixelBufferRef v55 = a4;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (a4)
  {
    int v14 = CVPixelBufferLockBaseAddress(a4, 1uLL);
    LODWORD(v54) = v14;
    if (v14)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      LODWORD(buf.data) = 134218240;
      *(void **)((char *)&buf.data + 4) = v55;
      WORD2(buf.height) = 1024;
      *(_DWORD *)((char *)&buf.height + 6) = v14;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&buf, 0x12u);
      int v14 = v54;
      if (v54) {
        goto LABEL_31;
      }
    }
    buf.data = CVPixelBufferGetBaseAddress(a4);
    buf.CGFloat height = CVPixelBufferGetHeight(a4);
    buf.CGFloat width = CVPixelBufferGetWidth(a4);
    buf.rowBytes = CVPixelBufferGetBytesPerRow(a4);
    LODWORD(v51) = 0;
    CVPixelBufferRef v52 = pixelBuffer;
    CVPixelBufferLockFlags v53 = 0;
    if (!pixelBuffer)
    {
      BOOL v40 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v40) {
        sub_10003036C(v40, v41, v42, v43, v44, v45, v46, v47);
      }
      int v14 = -50;
      goto LABEL_35;
    }
    int v14 = CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    LODWORD(v51) = v14;
    if (v14)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)
        || (LODWORD(v60.data) = 134218240,
            *(void **)((char *)&v60.data + 4) = v52,
            WORD2(v60.height) = 1024,
            *(_DWORD *)((char *)&v60.height + 6) = v14,
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&v60, 0x12u), (int v14 = v51) != 0))
      {
LABEL_35:
        if (v55
          && !v54
          && CVPixelBufferUnlockBaseAddress(v55, unlockFlags)
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_1000302FC();
        }
        goto LABEL_31;
      }
    }
    v60.data = CVPixelBufferGetBaseAddress(pixelBuffer);
    v60.CGFloat height = CVPixelBufferGetHeight(pixelBuffer);
    v60.CGFloat width = CVPixelBufferGetWidth(pixelBuffer);
    v60.rowBytes = CVPixelBufferGetBytesPerRow(pixelBuffer);
    int v14 = vImageScale_ARGB8888(&buf, &v60, 0, 0x20u);
    if (v14 || (int v14 = sub_10002ABAC(&v51)) != 0 || (int v14 = sub_10002ABAC(&v54)) != 0)
    {
LABEL_52:
      if (v52
        && !v51
        && CVPixelBufferUnlockBaseAddress(v52, v53)
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1000302FC();
      }
      goto LABEL_35;
    }
    float v15 = VCPSignPostLog();
    unsigned __int8 v16 = v15;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)float v58 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, v11, "VCPSceneAnalyzerEmbeddingAnalysisScaling", (const char *)&unk_1001F3BD3, v58, 2u);
    }

    id v17 = VCPSignPostLog();
    os_signpost_id_t v18 = os_signpost_id_generate(v17);

    os_signpost_id_t v19 = VCPSignPostLog();
    float v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)float v58 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "VCPSceneAnalyzerEmbeddingAnalysisInference", (const char *)&unk_1001F3BD3, v58, 2u);
    }

    double v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[VCPVideoTransformerBackbone revision]);
    CVPixelBufferRef v22 = +[VCPSharedImageBackboneAnalyzer sharedAnalyzerWithRevision:v21];

    id v50 = 0;
    int v14 = [v22 analyzePixelBuffer:pixelBuffer flags:0 results:&v50 cancel:&stru_10021A640];
    id v23 = v50;
    if (v14)
    {
LABEL_51:

      goto LABEL_52;
    }
    id v24 = VCPSignPostLog();
    double v25 = v24;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)float v58 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, v18, "VCPSceneAnalyzerEmbeddingAnalysisInference", (const char *)&unk_1001F3BD3, v58, 2u);
    }

    double v26 = [v23 objectForKeyedSubscript:@"ImageEmbeddingResults"];
    if ([v26 count])
    {
      double v27 = [v26 firstObject];
      id v28 = [v27 objectForKeyedSubscript:@"attributes"];
      float v29 = [v28 objectForKeyedSubscript:@"embeddings"];

      if (v29)
      {
        uint64_t v30 = [v6 results];
        [v30 setEmbeddingResults:v23];
        int v14 = 0;
LABEL_47:

LABEL_49:
LABEL_50:

        goto LABEL_51;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v30 = VCPLogInstance();
        os_log_type_t v49 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v30, v49))
        {
          *(_DWORD *)float v58 = 138412290;
          float v59 = v9;
          _os_log_impl((void *)&_mh_execute_header, v30, v49, "%@ Empty embedding data", v58, 0xCu);
        }
        int v14 = -18;
        goto LABEL_47;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v14 = -18;
        goto LABEL_50;
      }
      float v29 = VCPLogInstance();
      os_log_type_t v48 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v29, v48))
      {
        *(_DWORD *)float v58 = 138412290;
        float v59 = v9;
        _os_log_impl((void *)&_mh_execute_header, v29, v48, "%@ Empty embedding results", v58, 0xCu);
      }
    }
    int v14 = -18;
    goto LABEL_49;
  }
  BOOL v31 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v31) {
    sub_10003036C(v31, v32, v33, v34, v35, v36, v37, v38);
  }
  int v14 = -50;
LABEL_31:
  sub_100004484((const void **)&pixelBuffer);

  return v14;
}

- (void)_processAssetEntry:(id)a3 resourceURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v60 = a4;
  os_signpost_id_t v9 = (void (**)(void))a5;
  id v10 = [v8 asset];
  os_signpost_id_t v11 = [v10 localIdentifier];
  double v61 = +[NSString stringWithFormat:@"[Scene][%@]", v11];

  if (([v8 needsSceneProcessing] & 1) == 0
    && ([v8 needsEmbeddingProcessing] & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      BOOL v31 = VCPLogInstance();
      os_log_type_t v32 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v31, v32))
      {
        *(_DWORD *)vImage_Buffer buf = 138412290;
        *(void *)&uint8_t buf[4] = v61;
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "%@ Analysis meets requirement; skipping", buf, 0xCu);
      }
    }
    goto LABEL_32;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    int v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v12, v13))
    {
      int v14 = [v8 asset];
      objc_msgSend(v14, "vcp_typeDescription");
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      unsigned int v16 = [v8 needsSceneProcessing];
      unsigned int v17 = [v8 needsEmbeddingProcessing];
      CFStringRef v18 = @"NO";
      *(_DWORD *)vImage_Buffer buf = 138413058;
      *(void *)&uint8_t buf[4] = v61;
      if (v16) {
        CFStringRef v19 = @"YES";
      }
      else {
        CFStringRef v19 = @"NO";
      }
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      if (v17) {
        CFStringRef v18 = @"YES";
      }
      *(_WORD *)&buf[22] = 2112;
      os_log_type_t v85 = (uint64_t (*)(uint64_t, uint64_t))v19;
      LOWORD(v86) = 2112;
      *(void *)((char *)&v86 + 2) = v18;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "%@ Analyzing %@ (Scene:%@, Embedding:%@)", buf, 0x2Au);
    }
  }
  float v20 = +[VCPWatchdog sharedWatchdog];
  [v20 pet];

  id cancelBlock = (unsigned int (**)(void))self->_cancelBlock;
  if (cancelBlock && cancelBlock[2]())
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      CVPixelBufferRef v22 = VCPLogInstance();
      os_log_type_t v23 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v22, v23))
      {
        *(_DWORD *)vImage_Buffer buf = 138412290;
        *(void *)&uint8_t buf[4] = v61;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "%@ Processing canceled; skipping asset", buf, 0xCu);
      }
    }
    [v8 setStatus:4294967168];
LABEL_32:
    v9[2](v9);
    goto LABEL_57;
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_inProcessAssetBudget, 0xFFFFFFFFFFFFFFFFLL);
  id v24 = VCPSignPostLog();
  os_signpost_id_t v25 = os_signpost_id_generate(v24);

  double v26 = VCPSignPostLog();
  double v27 = v26;
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)vImage_Buffer buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "VCPMADSceneAssetEntryProcess_CreateVNRequests", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  *(void *)vImage_Buffer buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  os_log_type_t v85 = sub_10002C9D8;
  *(void *)&long long v86 = sub_10002C9E8;
  *((void *)&v86 + 1) = 0;
  id obj = 0;
  unsigned int v28 = [(VCPMADSceneAssetBatch *)self _createRequests:&obj forAssetEntry:v8];
  objc_storeStrong((id *)&v86 + 1, obj);
  if (v28)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      float v29 = VCPLogInstance();
      os_log_type_t v30 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v29, v30))
      {
        *(_DWORD *)double v80 = 138412290;
        int v81 = v61;
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "%@ Failed to create VNRequests", v80, 0xCu);
      }
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_inProcessAssetBudget);
    v9[2](v9);
  }
  else
  {
    uint64_t v33 = VCPSignPostLog();
    uint64_t v34 = v33;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      *(_WORD *)double v80 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_END, v25, "VCPMADSceneAssetEntryProcess_CreateVNRequests", (const char *)&unk_1001F3BD3, v80, 2u);
    }

    uint64_t v35 = VCPSignPostLog();
    os_signpost_id_t spid = os_signpost_id_generate(v35);

    uint64_t v36 = VCPSignPostLog();
    uint64_t v37 = v36;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)double v80 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADSceneAssetEntryProcess_Decode", (const char *)&unk_1001F3BD3, v80, 2u);
    }

    CFTypeRef cf = 0;
    CFTypeRef v78 = 0;
    imageLoader = self->_imageLoader;
    uint64_t v39 = [v8 asset];
    id v40 = objc_msgSend(v39, "vcp_abnormalImageDimensionForSceneNet");
    uint64_t v41 = [*(id *)(*(void *)&buf[8] + 40) mapAvailableRequestsToResolution];
    uint64_t v42 = [v41 allKeys];
    id v76 = 0;
    id v43 = [(VCPPreAnalysisImageLoader *)imageLoader loadImageURL:v60 abnormalDimension:v40 withNonPanoPreWarmSizes:v42 toColorPixelBuffer:&cf lumaPixelBuffer:&v78 andImage:&v76];
    id v44 = v76;
    [v8 setStatus:v43];

    uint64_t v45 = VCPSignPostLog();
    uint64_t v46 = v45;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      *(_WORD *)double v80 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADSceneAssetEntryProcess_Decode", (const char *)&unk_1001F3BD3, v80, 2u);
    }

    if ([v8 status])
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v47 = VCPLogInstance();
        os_log_type_t v48 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v47, v48))
        {
          *(_DWORD *)double v80 = 138412546;
          int v81 = v61;
          __int16 v82 = 2112;
          id v83 = v60;
          _os_log_impl((void *)&_mh_execute_header, v47, v48, "%@ Failed to load resourceURL: %@", v80, 0x16u);
        }
      }
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_inProcessAssetBudget);
      v9[2](v9);
    }
    else
    {
      id scheduler = (void (**)(id, const __CFString *, OS_dispatch_group *, void *))self->_scheduler;
      scenenetGroup = self->_scenenetGroup;
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_10002C9F0;
      v69[3] = &unk_10021A690;
      id v51 = v8;
      id v70 = v51;
      id v52 = v61;
      id v71 = v52;
      double v72 = self;
      id v73 = v44;
      CVPixelBufferLockFlags v75 = buf;
      CVPixelBufferLockFlags v53 = v9;
      id v74 = v53;
      scheduler[2](scheduler, @"Scenenet", scenenetGroup, v69);
      if (v78) {
        CFTypeRef v54 = CFRetain(v78);
      }
      else {
        CFTypeRef v54 = 0;
      }
      if (cf)
      {
        CFTypeRef v55 = CFRetain(cf);
        uint64_t v56 = v52;
      }
      else
      {
        uint64_t v56 = v52;
        CFTypeRef v55 = 0;
      }
      CVPixelBufferRef v57 = (void (**)(id, const __CFString *, OS_dispatch_group *, void *))self->_scheduler;
      blurExposureRotationGroup = self->_blurExposureRotationGroup;
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_10002CD90;
      v62[3] = &unk_10021A6B8;
      id v63 = v56;
      id v64 = v51;
      unint64_t v65 = self;
      CFTypeRef v67 = v54;
      CFTypeRef v68 = v55;
      id v66 = v53;
      v57[2](v57, @"BlurExposureRotation", blurExposureRotationGroup, v62);
    }
    sub_100004484(&cf);
    sub_100004484(&v78);
  }
  _Block_object_dispose(buf, 8);

LABEL_57:
}

- (int)process
{
  v2 = VCPSignPostLog();
  os_signpost_id_t spid = (char *)os_signpost_id_generate(v2);

  v3 = VCPSignPostLog();
  id v4 = v3;
  if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)vImage_Buffer buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "VCPMADSceneAssetBatch_Process", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    oslog = VCPLogInstance();
    os_log_type_t v5 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(oslog, v5))
    {
      id v6 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v7 = qos_class_self();
      id v8 = VCPMAQoSDescription(v7);
      *(_DWORD *)vImage_Buffer buf = 134218242;
      id v67 = v6;
      __int16 v68 = 2112;
      *(void *)int v69 = v8;
      _os_log_impl((void *)&_mh_execute_header, oslog, v5, "[Scene] Processing %lu assets (QoS: %@)", buf, 0x16u);
    }
  }
  os_signpost_id_t v9 = +[VCPWatchdog sharedWatchdog];
  [v9 pet];

  os_log_t osloga = +[NSDate now];
  unint64_t v56 = 0;
  os_log_type_t type = VCPLogToOSLogType[4];
  while (v56 < (unint64_t)[(NSMutableArray *)self->_assetEntries count])
  {
    CVPixelBufferRef v57 = [(NSMutableArray *)self->_assetEntries objectAtIndexedSubscript:v56];
    id v10 = [v57 asset];
    os_signpost_id_t v11 = [v10 localIdentifier];
    CVPixelBufferLockFlags v53 = +[NSString stringWithFormat:@"[Scene][%@]", v11];

    int v12 = [v57 asset];
    os_log_type_t v13 = [v12 adjustmentVersion];
    BOOL v14 = v13 == 0;

    if (!v14)
    {
      id v15 = VCPSignPostLog();
      os_signpost_id_t v16 = os_signpost_id_generate(v15);

      unsigned int v17 = VCPSignPostLog();
      CFStringRef v18 = v17;
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_WORD *)vImage_Buffer buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "VCPMADSceneAssetEntry_QueryResource", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      CFStringRef v19 = [v57 asset];
      id v51 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v19];

      CFTypeRef v55 = objc_msgSend(v51, "vcp_thumbnailResource");
      float v20 = VCPSignPostLog();
      double v21 = v20;
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)vImage_Buffer buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, v16, "VCPMADSceneAssetEntry_QueryResource", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      CVPixelBufferRef v22 = v57;
      if (objc_msgSend(v55, "vcp_isLocallyAvailable"))
      {
        if (objc_msgSend(v55, "vcp_hasExtremeAbnormalDimensionForScene"))
        {
          if ((int)MediaAnalysisLogLevel() < 4)
          {
            uint64_t v26 = 0;
          }
          else
          {
            os_log_type_t v23 = VCPLogInstance();
            if (os_log_type_enabled(v23, type))
            {
              unsigned int v24 = [v55 pixelWidth];
              unsigned int v25 = [v55 pixelHeight];
              *(_DWORD *)vImage_Buffer buf = 138412802;
              id v67 = v53;
              __int16 v68 = 1024;
              *(_DWORD *)int v69 = v24;
              *(_WORD *)&void v69[4] = 1024;
              *(_DWORD *)&v69[6] = v25;
              _os_log_impl((void *)&_mh_execute_header, v23, type, "%@ Asset has extreme abnormal dimension %dx%d; skipping",
                buf,
                0x18u);
            }
            uint64_t v26 = 0;
LABEL_48:

            CVPixelBufferRef v22 = v57;
          }
LABEL_51:
          [v22 setStatus:v26];
        }
        else
        {
          os_log_type_t v30 = VCPSignPostLog();
          os_signpost_id_t v31 = os_signpost_id_generate(v30);

          os_log_type_t v32 = VCPSignPostLog();
          uint64_t v33 = v32;
          if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
          {
            *(_WORD *)vImage_Buffer buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "VCPMADSceneAssetEntry_ProcessAsset", (const char *)&unk_1001F3BD3, buf, 2u);
          }

          uint64_t v34 = [v55 privateFileURL];
          v61[0] = _NSConcreteStackBlock;
          v61[1] = 3221225472;
          v61[2] = sub_10002DFB8;
          v61[3] = &unk_10021A6D8;
          v61[4] = v31;
          v61[5] = 0;
          [(VCPMADSceneAssetBatch *)self _processAssetEntry:v57 resourceURL:v34 completionHandler:v61];
        }
        goto LABEL_53;
      }
      if (v55)
      {
        if ((int)MediaAnalysisLogLevel() < 4)
        {
          uint64_t v26 = 4294943494;
          goto LABEL_51;
        }
        os_log_type_t v23 = VCPLogInstance();
        if (os_log_type_enabled(v23, type))
        {
          unsigned int v29 = [v55 isLocallyAvailable];
          *(_DWORD *)vImage_Buffer buf = 138412546;
          id v67 = v53;
          __int16 v68 = 1024;
          *(_DWORD *)int v69 = v29;
          _os_log_impl((void *)&_mh_execute_header, v23, type, "%@ Thumbnail PHAssetResource not locally available (Local: %d)", buf, 0x12u);
        }
      }
      else
      {
        os_log_type_t v23 = +[NSMutableArray array];
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v35 = v51;
        id v36 = [v35 countByEnumeratingWithState:&v62 objects:v70 count:16];
        if (v36)
        {
          uint64_t v37 = *(void *)v63;
          do
          {
            for (unint64_t i = 0; i != v36; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v63 != v37) {
                objc_enumerationMutation(v35);
              }
              uint64_t v39 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Type: %3d  Resolution: %5dx%-5d  Local: %d", [*(id *)(*((void *)&v62 + 1) + 8 * i) type], objc_msgSend(*(id *)(*((void *)&v62 + 1) + 8 * i), "pixelWidth"), objc_msgSend(*(id *)(*((void *)&v62 + 1) + 8 * i), "pixelHeight"), objc_msgSend(*(id *)(*((void *)&v62 + 1) + 8 * i), "isLocallyAvailable"));
              [v23 addObject:v39];
            }
            id v36 = [v35 countByEnumeratingWithState:&v62 objects:v70 count:16];
          }
          while (v36);
        }

        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          id v40 = VCPLogInstance();
          if (os_log_type_enabled(v40, type))
          {
            *(_DWORD *)vImage_Buffer buf = 138412546;
            id v67 = v53;
            __int16 v68 = 2112;
            *(void *)int v69 = v23;
            _os_log_impl((void *)&_mh_execute_header, v40, type, "%@ Asset has no thumbnail PHAssetResource; resources: %@",
              buf,
              0x16u);
          }
        }
      }
      uint64_t v26 = 4294943494;
      goto LABEL_48;
    }
    double v27 = v57;
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      unsigned int v28 = VCPLogInstance();
      if (os_log_type_enabled(v28, type))
      {
        *(_DWORD *)vImage_Buffer buf = 138412290;
        id v67 = v53;
        _os_log_impl((void *)&_mh_execute_header, v28, type, "%@ Asset has no adjustment version; skipping", buf, 0xCu);
      }

      double v27 = v57;
    }
    [v27 setStatus:4294943493];
LABEL_53:

    ++v56;
  }
  objc_initWeak((id *)buf, self);
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_10002E068;
  v58[3] = &unk_10021A700;
  objc_copyWeak(v60, (id *)buf);
  os_log_t oslogb = osloga;
  os_log_t v59 = oslogb;
  v60[1] = spid;
  v60[2] = 0;
  uint64_t v41 = objc_retainBlock(v58);
  id waitForProcessToComplete = self->_waitForProcessToComplete;
  self->_id waitForProcessToComplete = v41;

  id cancelBlock = (uint64_t (**)(void))self->_cancelBlock;
  if (cancelBlock && (cancelBlock[2]() & 1) != 0) {
    int v44 = -128;
  }
  else {
    int v44 = 0;
  }

  objc_destroyWeak(v60);
  objc_destroyWeak((id *)buf);

  return v44;
}

- (int)publish
{
  (*((void (**)(void))self->_waitForProcessToComplete + 2))();
  v2 = VCPTaskIDDescription(2);
  unsigned int v3 = [(id)objc_opt_class() _allowConcurrentSceneProcessing];
  CFStringRef v4 = @"Serial";
  if (v3) {
    CFStringRef v4 = @"Concurrent";
  }
  id v103 = +[NSString stringWithFormat:@"%@-%@-Analyze", v2, v4];

  VCPCoreAnalyticsQoSReportSpeed(v103, self->_processDuration * 1000.0 / (double)(unint64_t)[(NSMutableArray *)self->_assetEntries count]);
  id v102 = +[VCPMADCoreAnalyticsManager sharedManager];
  os_log_type_t v5 = VCPSignPostLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  qos_class_t v7 = VCPSignPostLog();
  id v8 = v7;
  unint64_t v99 = v6 - 1;
  os_signpost_id_t spid = v6;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)vImage_Buffer buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "VCPMADSceneAssetBatch_Publish", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_signpost_id_t v9 = VCPLogInstance();
    os_log_type_t v10 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v12 = qos_class_self();
      os_log_type_t v13 = VCPMAQoSDescription(v12);
      *(_DWORD *)vImage_Buffer buf = 134218242;
      id v139 = v11;
      __int16 v140 = 2112;
      v141 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "[Scene] Persisting %lu assets (QoS: %@) ...", buf, 0x16u);
    }
  }
  if (![(NSMutableArray *)self->_assetEntries count])
  {
    LODWORD(v121) = 0;
    goto LABEL_139;
  }
  BOOL v14 = [(NSMutableArray *)self->_assetEntries firstObject];
  id v15 = [v14 asset];
  int v101 = [v15 photoLibrary];

  int v106 = +[NSMutableSet set];
  unsigned int v16 = +[VCPVideoCNNAnalyzer isMUBackboneEnabled];
  id v121 = v17;
  if (!v16) {
    goto LABEL_60;
  }
  int v105 = +[NSMutableDictionary dictionary];
  id v108 = +[VCPVideoTransformerBackbone embeddingVersion];
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id obj = self->_assetEntries;
  id v18 = [(NSMutableArray *)obj countByEnumeratingWithState:&v131 objects:v137 count:16];
  if (!v18) {
    goto LABEL_43;
  }
  uint64_t v119 = *(void *)v132;
  os_log_type_t type = VCPLogToOSLogType[3];
  os_log_type_t v107 = VCPLogToOSLogType[7];
  do
  {
    CFStringRef v19 = 0;
    id v122 = v18;
    do
    {
      if (*(void *)v132 != v119) {
        objc_enumerationMutation(obj);
      }
      float v20 = *(void **)(*((void *)&v131 + 1) + 8 * (void)v19);
      CVPixelBufferRef v22 = [v20 asset];
      os_log_type_t v23 = [v22 localIdentifier];
      unsigned int v24 = +[NSString stringWithFormat:@"[Scene][Embedding][%@]", v23];

      if ([v20 status])
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_34;
        }
        unsigned int v25 = VCPLogInstance();
        if (os_log_type_enabled(v25, type))
        {
          unsigned int v26 = [v20 status];
          *(_DWORD *)vImage_Buffer buf = 138412546;
          id v139 = v24;
          __int16 v140 = 1024;
          LODWORD(v141) = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, type, "%@ Analysis failed (%d); skipping", buf, 0x12u);
        }
        goto LABEL_33;
      }
      if (![v20 needsEmbeddingProcessing]) {
        goto LABEL_34;
      }
      double v27 = [v20 results];
      unsigned int v28 = [v27 embeddingResults];
      unsigned int v25 = [v28 objectForKeyedSubscript:@"ImageEmbeddingResults"];

      unsigned int v29 = [v25 firstObject];
      os_log_type_t v30 = [v29 objectForKeyedSubscript:@"attributes"];
      os_signpost_id_t v31 = [v30 objectForKeyedSubscript:@"embeddings"];

      if (v31)
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          os_log_type_t v32 = VCPLogInstance();
          if (os_log_type_enabled(v32, v107))
          {
            *(_DWORD *)vImage_Buffer buf = 138412290;
            id v139 = v24;
            _os_log_impl((void *)&_mh_execute_header, v32, v107, "%@ Preparing VSKAsset ...", buf, 0xCu);
          }
        }
        uint64_t v33 = [v20 asset];
        uint64_t v34 = [v33 localIdentifier];
        id v35 = +[VSKAsset mad_stringIdentifierFromLocalIdentifier:v34 embeddingType:1];

        id v113 = +[VSKAsset mad_attributesWithEmbeddingVersion:v108];
        id v36 = objc_alloc((Class)VSKAsset);
        v136 = v31;
        uint64_t v37 = +[NSArray arrayWithObjects:&v136 count:1];
        id v38 = [v36 initWithStringIdentifier:v35 vectors:v37 attributes:v113 payload:0];

        if (v38)
        {
          uint64_t v39 = [v20 asset];
          id v40 = [v39 localIdentifier];
          [v105 setObject:v38 forKeyedSubscript:v40];

          uint64_t v41 = [v20 asset];
          uint64_t v42 = [v41 localIdentifier];
          [v106 addObject:v42];

          goto LABEL_29;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          uint64_t v41 = VCPLogInstance();
          if (os_log_type_enabled(v41, type))
          {
            *(_DWORD *)vImage_Buffer buf = 138412290;
            id v139 = v24;
            _os_log_impl((void *)&_mh_execute_header, v41, type, "%@ Failed to create VSKAsset", buf, 0xCu);
          }
LABEL_29:
        }
        goto LABEL_31;
      }
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_32;
      }
      id v35 = VCPLogInstance();
      if (os_log_type_enabled(v35, type))
      {
        *(_DWORD *)vImage_Buffer buf = 138412290;
        id v139 = v24;
        _os_log_impl((void *)&_mh_execute_header, v35, type, "%@ Missing embedding data; skipping", buf, 0xCu);
      }
LABEL_31:

LABEL_32:
LABEL_33:

LABEL_34:
      CFStringRef v19 = (char *)v19 + 1;
    }
    while (v122 != v19);
    id v18 = [(NSMutableArray *)obj countByEnumeratingWithState:&v131 objects:v137 count:16];
  }
  while (v18);
LABEL_43:

  id v121 = (id)[(VCPDatabaseWriter *)self->_analysisDatabase commit];
  if (v121 != -108 && v121 != -36 && v121 != -23 && [v105 count])
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v43 = VCPLogInstance();
      os_log_type_t v44 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v43, v44))
      {
        *(_WORD *)vImage_Buffer buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, v44, "[Scene][Embedding] Persisting VSKAssets ...", buf, 2u);
      }
    }
    uint64_t v45 = [v105 allValues];
    id cancelBlock = self->_cancelBlock;
    id v130 = 0;
    unsigned int v47 = +[MADVectorDatabaseUtilities updateWithAssetsEmbeddings:v45 photoLibrary:v101 cancelBlock:cancelBlock error:&v130];
    id v48 = v130;

    if (v47)
    {
      [v106 removeAllObjects];
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        os_log_type_t v49 = VCPLogInstance();
        os_log_type_t v50 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v49, v50))
        {
          *(_DWORD *)vImage_Buffer buf = 138412290;
          id v139 = v48;
          _os_log_impl((void *)&_mh_execute_header, v49, v50, "Failed to update vectorDB; skip updating Photos embedding version - %@",
            buf,
            0xCu);
        }
      }
    }
  }
  if (v121 != -108 && v121 != -36 && v121 != -23)
  {
LABEL_60:
    double v109 = +[NSDate now];
    id v51 = +[MADStateHandler sharedStateHandler];
    objc_msgSend(v51, "addBreadcrumb:", @"[Scene] Persisting %d assets to Photos", -[NSMutableArray count](self->_assetEntries, "count"));

    id v52 = +[VCPWatchdog sharedWatchdog];
    [v52 pet];

    uint64_t v53 = +[MADStateHandler sharedStateHandler];
    [(id)v53 enterKnownTimeoutRisk:1];

    v128[0] = _NSConcreteStackBlock;
    v128[1] = 3221225472;
    v128[2] = sub_10002F568;
    v128[3] = &unk_100219D70;
    v128[4] = self;
    id v129 = v106;
    v111 = objc_retainBlock(v128);
    id v54 = self->_cancelBlock;
    id v127 = 0;
    LOBYTE(v53) = objc_msgSend(v101, "mad_performChangesAndWait:cancelBlock:extendTimeoutBlock:error:", v111, v54, &stru_10021A720, &v127);
    id v112 = v127;
    CFTypeRef v55 = +[MADStateHandler sharedStateHandler];
    [v55 exitKnownTimeoutRisk];

    unint64_t v56 = +[MADStateHandler sharedStateHandler];
    objc_msgSend(v56, "addBreadcrumb:", @"[Scene] Finished persisting %d assets to Photos", -[NSMutableArray count](self->_assetEntries, "count"));

    if ((v53 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v91 = VCPLogInstance();
        os_log_type_t v92 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v91, v92))
        {
          *(_DWORD *)vImage_Buffer buf = 138412290;
          id v139 = v112;
          _os_log_impl((void *)&_mh_execute_header, v91, v92, "[Scene] Failed to persist Scene results to Photos (%@)", buf, 0xCu);
        }
      }
      LODWORD(v121) = [v112 code];
      goto LABEL_137;
    }
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    double v114 = self->_assetEntries;
    id v57 = 0;
    id v58 = [(NSMutableArray *)v114 countByEnumeratingWithState:&v123 objects:v135 count:16];
    if (v58)
    {
      *(void *)typea = 0;
      obja = 0;
      uint64_t v110 = 0;
      uint64_t v120 = *(void *)v124;
LABEL_63:
      os_log_t v59 = 0;
      id v60 = v57;
      while (1)
      {
        if (*(void *)v124 != v120) {
          objc_enumerationMutation(v114);
        }
        double v61 = *(void **)(*((void *)&v123 + 1) + 8 * (void)v59);
        if ([v61 status])
        {
          if ([v61 status] == -128)
          {
            id v63 = [v61 previousAttempts];
            analysisDatabase = self->_analysisDatabase;
            if (v63)
            {
              id v65 = [v61 previousAttempts];
              id v66 = [v61 asset];
              id v67 = [v61 previousStatus];
              __int16 v68 = [v61 lastAttemptDate];
              id v69 = (id)[(VCPDatabaseWriter *)analysisDatabase setAttempts:v65 asset:v66 taskID:2 status:v67 lastAttemptDate:v68];

              int v70 = 28;
              if (v69 == -108 || v69 == -36)
              {
                id v57 = v69;
              }
              else
              {
                id v57 = v69;
                if (v69 != -23)
                {
                  int v70 = 0;
                  id v57 = v60;
                }
              }
              if (v69 != -108 && v69 != -36 && v69 != -23) {
                goto LABEL_115;
              }
            }
            else
            {
              double v88 = [v61 asset];
              int v89 = [v88 localIdentifier];
              id v90 = (id)[(VCPDatabaseWriter *)analysisDatabase removeProcessingStatusForLocalIdentifier:v89 andTaskID:2];

              int v70 = 28;
              if (v90 == -108 || v90 == -36)
              {
                id v57 = v90;
              }
              else
              {
                id v57 = v90;
                if (v90 != -23)
                {
                  int v70 = 0;
                  id v57 = v60;
                }
              }
              if (v90 != -108 && v90 != -36 && v90 != -23) {
                goto LABEL_115;
              }
            }
          }
          else
          {
            unsigned int v76 = [v61 status];
            if (v76 == -23802) {
              int v77 = obja;
            }
            else {
              int v77 = obja + 1;
            }
            uint64_t v78 = *(void *)typea;
            if (v76 == -23802) {
              uint64_t v78 = *(void *)typea + 1;
            }
            *(void *)typea = v78;
            obja = v77;
            if (v76 == -23802) {
              uint64_t v79 = 2;
            }
            else {
              uint64_t v79 = 3;
            }
            double v80 = [v61 asset];
            int v81 = [v61 currentAttemptDate];
            __int16 v82 = objc_msgSend(v80, "mad_nextAttemptDateForStatus:currentAttemptDate:attemptCount:", v79, v81, (char *)objc_msgSend(v61, "previousAttempts") + 1);

            id v83 = self->_analysisDatabase;
            id v84 = [v61 asset];
            os_log_type_t v85 = [v84 localIdentifier];
            id v86 = (id)[(VCPDatabaseWriter *)v83 updateProcessingStatus:v79 andNextAttemptDate:v82 forLocalIdentifier:v85 andTaskID:2];

            if (v86 == -108 || v86 == -36)
            {
              id v87 = v86;
            }
            else
            {
              id v87 = v86;
              if (v86 != -23) {
                id v87 = v121;
              }
            }

            int v70 = 1;
            if (v86 == -108 || v86 == -36)
            {
              id v57 = v60;
              id v121 = v87;
              goto LABEL_116;
            }
            id v57 = v60;
            id v121 = v87;
            if (v86 != -23) {
              goto LABEL_115;
            }
          }
        }
        else
        {
          id v71 = self->_analysisDatabase;
          double v72 = [v61 asset];
          id v73 = [v72 localIdentifier];
          id v74 = (id)[(VCPDatabaseWriter *)v71 removeProcessingStatusForLocalIdentifier:v73 andTaskID:2];

          int v70 = 28;
          if (v74 == -108)
          {
            id v57 = v74;
          }
          else
          {
            BOOL v75 = v74 == -36 || v74 == -23;
            id v57 = v74;
            if (!v75)
            {
              int v70 = 0;
              id v57 = v60;
            }
          }
          if (v74 != -108 && v74 != -36 && v74 != -23)
          {
            ++v110;
LABEL_115:
            int v70 = 0;
          }
        }
LABEL_116:
        if (v70)
        {

          if (v70 == 28) {
            goto LABEL_136;
          }
          goto LABEL_137;
        }
        os_log_t v59 = (char *)v59 + 1;
        id v60 = v57;
        if (v58 == v59)
        {
          id v58 = [(NSMutableArray *)v114 countByEnumeratingWithState:&v123 objects:v135 count:16];
          if (v58) {
            goto LABEL_63;
          }
          goto LABEL_129;
        }
      }
    }
    *(void *)typea = 0;
    obja = 0;
    uint64_t v110 = 0;
LABEL_129:

    [v102 accumulateInt64Value:v110 forField:@"NumberOfAssetsAnalyzed" andEvent:@"com.apple.mediaanalysisd.SceneAnalysisRunSession"];
    [v102 accumulateInt64Value:obja forField:@"NumberOfAssetsSoftFailure" andEvent:@"com.apple.mediaanalysisd.SceneAnalysisRunSession"];
    [v102 accumulateInt64Value:*(void *)typea forField:@"NumberOfAssetsNoResource" andEvent:@"com.apple.mediaanalysisd.SceneAnalysisRunSession"];
    [v102 accumulateDoubleValue:@"TotalAnalyzingTimeInSeconds" forField:@"com.apple.mediaanalysisd.SceneAnalysisRunSession" andEvent:self->_processDuration];
    [v102 accumulateDoubleValue:@"TimeAnalyzingInSeconds" forField:@"com.apple.mediaanalysisd.SceneAnalysisRunSession" andEvent:self->_processDuration];
    [v109 timeIntervalSinceNow];
    [v102 accumulateDoubleValue:@"TotalPublishTimeInSeconds" forField:@"com.apple.mediaanalysisd.SceneAnalysisRunSession" andEvent:-v93];
    int v94 = VCPSignPostLog();
    v95 = v94;
    if (v99 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v94))
    {
      *(_WORD *)vImage_Buffer buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v95, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADSceneAssetBatch_Publish", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      double v96 = VCPLogInstance();
      os_log_type_t v97 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v96, v97))
      {
        *(_WORD *)vImage_Buffer buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v96, v97, "[Scene] Finished persisting", buf, 2u);
      }
    }
LABEL_136:
    [(VCPDatabaseWriter *)self->_analysisDatabase commit];
    LODWORD(v121) = v57;
LABEL_137:
  }
LABEL_139:

  return (int)v121;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_waitForProcessToComplete, 0);
  objc_storeStrong((id *)&self->_embeddingBufferCreator, 0);
  objc_storeStrong((id *)&self->_rotationBufferCreator, 0);
  objc_storeStrong((id *)&self->_rotationModel, 0);
  objc_storeStrong((id *)&self->_ivsPool, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_assetProcessCompletionGroup, 0);
  objc_storeStrong((id *)&self->_blurExposureRotationGroup, 0);
  objc_storeStrong((id *)&self->_scenenetGroup, 0);
  objc_storeStrong((id *)&self->_imageLoader, 0);
  objc_storeStrong((id *)&self->_monochromeBufferCreator, 0);
  objc_storeStrong((id *)&self->_inProcessAssetBudget, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_analysisDatabase, 0);
  objc_storeStrong((id *)&self->_assetEntries, 0);
}

@end