@interface MADPhotosVisualSearchAssetProcessingTask
+ (id)taskWithServicePool:(id)a3 visionSession:(id)a4 analysisDatabase:(id)a5;
+ (int)concurrentAssetCount;
- (CGRect)_computeRegionOfInterest:(__CVBuffer *)a3 orientation:(unsigned int)a4;
- (MADPhotosVisualSearchAssetProcessingTask)initWithServicePool:(id)a3 visionSession:(id)a4 analysisDatabase:(id)a5;
- (id)assetLocalIdentifiers;
- (int)_calculateStickerScore:(__CVBuffer *)a3 orientation:(unsigned int)a4 regionOfInterest:(CGRect)a5 stickerScore:(float *)a6;
- (int)_prepare;
- (int)_process;
- (int)_publish;
- (int)status;
- (unint64_t)count;
- (void)addPhotosAsset:(id)a3 priority:(unint64_t)a4 previousStatus:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7;
- (void)prepare;
- (void)process;
- (void)publish;
@end

@implementation MADPhotosVisualSearchAssetProcessingTask

- (MADPhotosVisualSearchAssetProcessingTask)initWithServicePool:(id)a3 visionSession:(id)a4 analysisDatabase:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MADPhotosVisualSearchAssetProcessingTask;
  v12 = [(MADProcessingTask *)&v19 init];
  if (v12)
  {
    uint64_t v13 = +[NSMutableArray array];
    assetEntries = v12->_assetEntries;
    v12->_assetEntries = (NSMutableArray *)v13;

    objc_storeStrong((id *)&v12->_servicePool, a3);
    objc_storeStrong((id *)&v12->_visionSession, a4);
    objc_storeStrong((id *)&v12->_analysisDatabase, a5);
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.mediaanalysis.StickerScore", v15);
    stickerQueue = v12->_stickerQueue;
    v12->_stickerQueue = (OS_dispatch_queue *)v16;
  }
  return v12;
}

+ (id)taskWithServicePool:(id)a3 visionSession:(id)a4 analysisDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)a1) initWithServicePool:v8 visionSession:v9 analysisDatabase:v10];

  return v11;
}

+ (int)concurrentAssetCount
{
  return 1;
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
  v4 = self->_assetEntries;
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
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v8, "asset", (void)v13);
        id v11 = [v10 localIdentifier];
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
  v39.receiver = self;
  v39.super_class = (Class)MADPhotosVisualSearchAssetProcessingTask;
  unint64_t v32 = a5;
  unint64_t v33 = a6;
  id v34 = a7;
  -[MADPhotosAssetProcessingTask addPhotosAsset:priority:previousStatus:attempts:lastAttemptDate:](&v39, "addPhotosAsset:priority:previousStatus:attempts:lastAttemptDate:", v12, a4, a5, a6);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v31 = 56;
  long long v13 = self->_assetEntries;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v36;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "asset", v31);
        v18 = [v17 localIdentifier];
        objc_super v19 = [v12 localIdentifier];
        unsigned int v20 = [v18 isEqualToString:v19];

        if (v20)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v26 = VCPLogInstance();
            os_log_type_t v27 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v26, v27))
            {
              v28 = [v12 localIdentifier];
              *(_DWORD *)buf = 138412290;
              v41 = v28;
              _os_log_impl((void *)&_mh_execute_header, v26, v27, "[VisualSearch][%@] Batch already contains asset; ignoring",
                buf,
                0xCu);
            }
          }
          goto LABEL_20;
        }
      }
      id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v35 objects:v42 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  unsigned int v21 = objc_msgSend(v12, "vcp_needsVisualSearchProcessing");
  unsigned int v22 = objc_msgSend(v12, "vcp_needsStickerGatingProcessing");
  uint64_t v23 = 2;
  if (!v21) {
    uint64_t v23 = 0;
  }
  if (v22) {
    uint64_t v24 = v23 | 4;
  }
  else {
    uint64_t v24 = v23;
  }
  if (v24)
  {
    v25 = *(Class *)((char *)&self->super.super.super.super.super.isa + v31);
    +[MADVisualSearchAssetEntry entryWithAsset:previousStatus:previousAttempts:andLastAttemptDate:analysisTypes:](MADVisualSearchAssetEntry, "entryWithAsset:previousStatus:previousAttempts:andLastAttemptDate:analysisTypes:", v12, v32, v33, v34);
    long long v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    [v25 addObject:v13];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 4) {
      goto LABEL_21;
    }
    VCPLogInstance();
    long long v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v29 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(&v13->super.super, v29))
    {
      v30 = [v12 localIdentifier];
      *(_DWORD *)buf = 138412290;
      v41 = v30;
      _os_log_impl((void *)&_mh_execute_header, &v13->super.super, v29, "[VisualSearch][%@] Asset is with up-to-date results, ignoring", buf, 0xCu);
    }
  }
LABEL_20:

LABEL_21:
}

- (int)_prepare
{
  id v32 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v32 start];
  v4 = VCPSignPostLog();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  uint64_t v6 = VCPSignPostLog();
  v7 = v6;
  unint64_t v30 = v5 - 1;
  os_signpost_id_t spid = v5;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "MADPhotosVisualSearchAssetProcessingTask_Prepare", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v8 = VCPLogInstance();
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
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[VisualSearch] Preparing %d assets (QoS: %@)", buf, 0x12u);
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
    uint64_t v15 = 0;
    long long v16 = v2;
    while (1)
    {
      if (*(void *)v34 != v14) {
        objc_enumerationMutation(v12);
      }
      v17 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v15);
      analysisDatabase = self->_analysisDatabase;
      objc_super v19 = (char *)[v17 previousAttempts];
      unsigned int v20 = [v17 asset];
      unsigned int v21 = +[NSDate now];
      id v22 = (id)[(VCPDatabaseWriter *)analysisDatabase setAttempts:v19 + 1 asset:v20 taskID:12 status:1 lastAttemptDate:v21];

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
      uint64_t v15 = (char *)v15 + 1;
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
    os_log_type_t v27 = VCPSignPostLog();
    v28 = v27;
    if (v30 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, spid, "MADPhotosVisualSearchAssetProcessingTask_Prepare", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    [v32 stop];
    id v12 = +[VCPMADCoreAnalyticsManager sharedManager];
    [v32 elapsedTimeSeconds];
    -[NSMutableArray accumulateDoubleValue:forField:andEvent:](v12, "accumulateDoubleValue:forField:andEvent:", @"TotalPrepareTimeInSeconds", @"com.apple.mediaanalysisd.VisualSearchAnalysisRunSession");
    LODWORD(v2) = 0;
LABEL_39:

    int v26 = (int)v2;
  }

  return v26;
}

- (void)prepare
{
  self->_status = [(MADPhotosVisualSearchAssetProcessingTask *)self _prepare];
}

- (CGRect)_computeRegionOfInterest:(__CVBuffer *)a3 orientation:(unsigned int)a4
{
  os_signpost_id_t v5 = +[VIImage imageWithPixelBuffer:a3 orientation:*(void *)&a4];
  id v6 = objc_msgSend(objc_alloc((Class)VIRefineRegionRequest), "initWithImage:regionOfInterest:imageType:preferredMetalDevice:", v5, 1, 0, 0.0, 0.0, 1.0, 1.0);
  v7 = [(VCPObjectPool *)self->_servicePool getObject];
  id v8 = [v7 object];
  id v33 = 0;
  os_log_type_t v9 = [v8 refineRegionsWithRequest:v6 error:&v33];
  id v10 = v33;

  if (v10)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      qos_class_t v11 = VCPLogInstance();
      os_log_type_t v12 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138412290;
        CGFloat v35 = *(double *)&v10;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "[StickerScore] Failed to detect screenshot ROI (%@)", buf, 0xCu);
      }
    }
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }
  else
  {
    v17 = [v9 refinedRegions];
    BOOL v18 = [v17 count] == 0;

    if (v18)
    {
      CGFloat width = 1.0;
      CGFloat x = 0.0;
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        os_log_type_t v27 = VCPLogInstance();
        os_log_type_t v28 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v27, v28))
        {
          *(_DWORD *)buf = 138412290;
          CGFloat v35 = 0.0;
          _os_log_impl((void *)&_mh_execute_header, v27, v28, "[StickerScore] Screenshot has no ROI (%@)", buf, 0xCu);
        }
      }
      CGFloat y = 0.0;
      CGFloat height = 1.0;
    }
    else
    {
      objc_super v19 = [v9 refinedRegions];
      unsigned int v20 = [v19 firstObject];

      [v20 regionOfInterest];
      v49.origin.CGFloat x = 0.0;
      v49.origin.CGFloat y = 0.0;
      v49.size.CGFloat width = 1.0;
      v49.size.CGFloat height = 1.0;
      CGRect v47 = CGRectIntersection(v46, v49);
      CGFloat x = v47.origin.x;
      CGFloat y = v47.origin.y;
      CGFloat width = v47.size.width;
      CGFloat height = v47.size.height;
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        unsigned int v21 = VCPLogInstance();
        os_log_type_t v22 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v21, v22))
        {
          [v20 confidence];
          float v24 = v23;
          unsigned int v25 = [v9 refinedRegions];
          unsigned int v26 = [v25 count];
          *(_DWORD *)buf = 134219264;
          CGFloat v35 = x;
          __int16 v36 = 2048;
          CGFloat v37 = y;
          __int16 v38 = 2048;
          CGFloat v39 = width;
          __int16 v40 = 2048;
          CGFloat v41 = height;
          __int16 v42 = 2048;
          double v43 = v24;
          __int16 v44 = 1024;
          unsigned int v45 = v26;
          _os_log_impl((void *)&_mh_execute_header, v21, v22, "[StickerScore] Screenshot ROI: (%0.2f, %0.2f) %0.2fx%0.2f Confidence: %0.2f [1 of %d]", buf, 0x3Au);
        }
      }
    }
  }

  double v29 = x;
  double v30 = y;
  double v31 = width;
  double v32 = height;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (int)_calculateStickerScore:(__CVBuffer *)a3 orientation:(unsigned int)a4 regionOfInterest:(CGRect)a5 stickerScore:(float *)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  *a6 = 0.0;
  id v11 = [objc_alloc((Class)VNImageRequestHandler) initWithCVPixelBuffer:a3 orientation:*(void *)&a4 options:&__NSDictionary0__struct session:self->_visionSession];
  id v12 = objc_alloc_init((Class)VNGenerateInstanceMaskGatingRequest);
  if (DeviceHasANE())
  {
    id v13 = +[VNProcessingDevice defaultANEDevice];
    [v12 setProcessingDevice:v13];
  }
  objc_msgSend(v12, "setRegionOfInterest:", x, y, width, height);
  id v30 = v12;
  uint64_t v14 = +[NSArray arrayWithObjects:&v30 count:1];
  id v27 = 0;
  unsigned __int8 v15 = [v11 performRequests:v14 error:&v27];
  id v16 = v27;

  if ((v15 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      objc_super v19 = VCPLogInstance();
      os_log_type_t v23 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v19, v23))
      {
        float v24 = [v16 description];
        *(_DWORD *)buf = 138412290;
        double v29 = v24;
        _os_log_impl((void *)&_mh_execute_header, v19, v23, "[ImageStickerScore] Score generation failed (%@)", buf, 0xCu);
      }
      goto LABEL_12;
    }
LABEL_14:
    int v22 = -18;
    goto LABEL_15;
  }
  v17 = [v12 results];
  BOOL v18 = [v17 count] == 0;

  if (v18)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      objc_super v19 = VCPLogInstance();
      os_log_type_t v25 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v19, v25))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, v25, "[ImageStickerScore] No observations produced for image", buf, 2u);
      }
LABEL_12:
      int v22 = -18;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  objc_super v19 = [v12 results];
  unsigned int v20 = [v19 firstObject];
  [v20 confidence];
  *(_DWORD *)a6 = v21;

  int v22 = 0;
LABEL_13:

LABEL_15:
  return v22;
}

- (int)_process
{
  id v99 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v99 start];
  signed int v3 = [(id)objc_opt_class() concurrentAssetCount];
  dsema = dispatch_semaphore_create(v3);
  v96 = dispatch_group_create();
  group = dispatch_group_create();
  v90 = [(VCPObjectPool *)self->_servicePool getObject];
  v4 = VCPSignPostLog();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  id v6 = VCPSignPostLog();
  v7 = v6;
  os_signpost_id_t spid = v5;
  unint64_t v88 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "MADPhotosVisualSearchAssetProcessingTask_Process", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v8, v9))
    {
      unsigned int v10 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v11 = qos_class_self();
      id v12 = VCPMAQoSDescription(v11);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v10;
      LOWORD(v136) = 2112;
      *(void *)((char *)&v136 + 2) = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[VisualSearch] Processing %d assets (QoS: %@)", buf, 0x12u);
    }
  }
  uint64_t v123 = 0;
  v124 = &v123;
  uint64_t v125 = 0x2020000000;
  uint64_t v126 = 0;
  uint64_t v119 = 0;
  v120 = &v119;
  uint64_t v121 = 0x2020000000;
  uint64_t v122 = 0;
  *(void *)buf = 0;
  *(void *)&long long v136 = buf;
  *((void *)&v136 + 1) = 0x3032000000;
  v137 = sub_100105CC4;
  v138 = sub_100105CD4;
  id v139 = objc_alloc_init((Class)NSMutableDictionary);
  id v13 = +[NSDate now];
  [v13 timeIntervalSince1970];

  uint64_t v98 = 0;
  uint64_t v89 = 0;
  uint64_t v94 = 0;
  unint64_t v14 = 0;
  os_log_type_t type = VCPLogToOSLogType[5];
  os_log_type_t v100 = VCPLogToOSLogType[4];
  os_log_type_t v101 = VCPLogToOSLogType[6];
  uint64_t v83 = VIQueryContextImageTypeKey;
  uint64_t v84 = VIQueryContextLocationKey;
  while (v14 < (unint64_t)[(NSMutableArray *)self->_assetEntries count])
  {
    id v16 = +[VCPWatchdog sharedWatchdog];
    [v16 pet];

    v17 = [(MADProcessingTask *)self cancelBlock];
    if (!v17
      || ([(MADProcessingTask *)self cancelBlock],
          BOOL v18 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
          int v19 = v18[2](),
          v18,
          v17,
          !v19))
    {
      unsigned int v20 = [(NSMutableArray *)self->_assetEntries objectAtIndexedSubscript:v14];
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        int v22 = VCPLogInstance();
        if (os_log_type_enabled(v22, v101))
        {
          os_log_type_t v23 = [v20 asset];
          float v24 = [v23 localIdentifier];
          *(_DWORD *)v127 = 138412290;
          v128 = v24;
          _os_log_impl((void *)&_mh_execute_header, v22, v101, "[VisualSearch][%@] Processing asset", v127, 0xCu);
        }
      }
      os_log_type_t v25 = [v20 asset];
      unsigned int v26 = [v25 adjustmentVersion];
      BOOL v27 = v26 == 0;

      if (v27)
      {
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v53 = VCPLogInstance();
          if (os_log_type_enabled(v53, v100))
          {
            v54 = [v20 asset];
            v55 = [v54 localIdentifier];
            *(_DWORD *)v127 = 138412290;
            v128 = v55;
            _os_log_impl((void *)&_mh_execute_header, v53, v100, "[VisualSearch][%@] Asset has no adjustment version", v127, 0xCu);
          }
        }
        [v20 setStatus:4294943493];
        int v21 = 6;
        goto LABEL_76;
      }
      os_log_type_t v28 = [v20 asset];
      double v29 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v28];

      id v30 = objc_msgSend(v29, "vcp_thumbnailResource");
      double v31 = v30;
      if (v30)
      {
        if ([v30 isLocallyAvailable])
        {
          double v32 = VCPSignPostLog();
          os_signpost_id_t v33 = os_signpost_id_generate(v32);

          long long v34 = VCPSignPostLog();
          CGFloat v35 = v34;
          if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
          {
            *(_WORD *)v127 = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "VCPMADVisualSearchAssetBatch_Decode", (const char *)&unk_1001F3BD3, v127, 2u);
          }

          int v118 = 0;
          __int16 v36 = +[VCPImageManager sharedImageManager];
          CGFloat v37 = [v31 privateFileURL];
          CFTypeRef cf = [v36 pixelBufferWithFormat:875704438 fromImageURL:v37 flushCache:0 orientation:&v118];

          __int16 v38 = VCPSignPostLog();
          CGFloat v39 = v38;
          if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
          {
            *(_WORD *)v127 = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_END, v33, "VCPMADVisualSearchAssetBatch_Decode", (const char *)&unk_1001F3BD3, v127, 2u);
          }

          if (cf)
          {
            if (([v20 analysisTypes] & 4) != 0)
            {
              stickerQueue = self->_stickerQueue;
              block[0] = _NSConcreteStackBlock;
              block[1] = 3321888768;
              block[2] = sub_100105CDC;
              block[3] = &unk_10021DFE8;
              v113 = v20;
              v114 = self;
              CFTypeRef v115 = cf;
              if (cf) {
                CFRetain(cf);
              }
              int v116 = v118;
              dispatch_group_async(group, stickerQueue, block);
              sub_100004484(&v115);

              ++v94;
            }
            ++v98;
            if (([v20 analysisTypes] & 2) == 0) {
              goto LABEL_73;
            }
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              CGFloat v41 = VCPLogInstance();
              if (os_log_type_enabled(v41, v101))
              {
                v92 = [v20 asset];
                __int16 v42 = [v92 localIdentifier];
                id v43 = [v31 type];
                unsigned int v44 = [v31 pixelWidth];
                unsigned int v45 = [v31 pixelHeight];
                *(_DWORD *)v127 = 138413058;
                v128 = v42;
                __int16 v129 = 2048;
                id v130 = v43;
                __int16 v131 = 1024;
                unsigned int v132 = v44;
                __int16 v133 = 1024;
                unsigned int v134 = v45;
                _os_log_impl((void *)&_mh_execute_header, v41, v101, "[VisualSearch][%@] Processing resource type %ld (%dx%d)", v127, 0x22u);
              }
            }
            uint64_t v46 = [v20 asset];
            CGRect v47 = +[VCPMADServiceImageAsset assetWithPhotosAsset:v46 clientBundleID:0 clientTeamID:0];

            v93 = +[NSMutableDictionary dictionary];
            v48 = [v47 location];
            LOBYTE(v46) = v48 == 0;

            if ((v46 & 1) == 0)
            {
              CGRect v49 = [v47 location];
              [v93 setObject:v49 forKeyedSubscript:v84];
            }
            if ([v47 isScreenshot]) {
              [v93 setObject:&off_10022F1C0 forKeyedSubscript:v83];
            }
            id v111 = 0;
            v86 = +[VIQueryContext contextWithDictionary:v93 error:&v111];
            id v87 = v111;
            if (v87)
            {
              if ((int)MediaAnalysisLogLevel() >= 4)
              {
                v50 = VCPLogInstance();
                if (os_log_type_enabled(v50, v100))
                {
                  v51 = [v20 asset];
                  v52 = [v51 localIdentifier];
                  *(_DWORD *)v127 = 138412290;
                  v128 = v52;
                  _os_log_impl((void *)&_mh_execute_header, v50, v100, "[VisualSearch][%@] Failed to create query context", v127, 0xCu);
                }
              }
              [v20 setVisualSearchStatus:4294967278];
              int v21 = 6;
            }
            else
            {
              v81 = objc_msgSend(v47, "vcp_annotationWithTypes:", 7);
              v82 = +[VIVisualQuery queryWithPixelBuffer:orientation:normalizedRegionOfInterest:annotation:queryContext:](VIVisualQuery, "queryWithPixelBuffer:orientation:normalizedRegionOfInterest:annotation:queryContext:", cf, 1, 0.0, 0.0, 1.0, 1.0);
              dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
              v64 = VCPSignPostLog();
              os_signpost_id_t v65 = os_signpost_id_generate(v64);

              v66 = VCPSignPostLog();
              v67 = v66;
              if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
              {
                *(_WORD *)v127 = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v67, OS_SIGNPOST_INTERVAL_BEGIN, v65, "VIService_VisualSearchGating", (const char *)&unk_1001F3BD3, v127, 2u);
              }

              dispatch_group_enter(v96);
              v68 = [v90 object];
              v102[0] = _NSConcreteStackBlock;
              v102[1] = 3221225472;
              v102[2] = sub_100105FA4;
              v102[3] = &unk_10021E020;
              os_signpost_id_t v109 = v65;
              uint64_t v110 = 0;
              v103 = v20;
              v106 = &v123;
              v107 = buf;
              v108 = &v119;
              v104 = dsema;
              v105 = v96;
              id v69 = [v68 parseWithVisualQuery:v82 cachedResults:0 completion:v102];

              int v21 = 0;
              ++v89;
            }

            if (!v87) {
LABEL_73:
            }
              int v21 = 0;
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              v61 = VCPLogInstance();
              if (os_log_type_enabled(v61, v100))
              {
                v62 = [v20 asset];
                v63 = [v62 localIdentifier];
                *(_DWORD *)v127 = 138412290;
                v128 = v63;
                _os_log_impl((void *)&_mh_execute_header, v61, v100, "[VisualSearch][%@] Failed to decode thumbnail", v127, 0xCu);
              }
            }
            [v20 setStatus:4294943494];
            int v21 = 6;
          }
          sub_100004484(&cf);
          goto LABEL_75;
        }
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v56 = VCPLogInstance();
          if (os_log_type_enabled(v56, v100))
          {
            v59 = [v20 asset];
            v60 = [v59 localIdentifier];
            *(_DWORD *)v127 = 138412290;
            v128 = v60;
            _os_log_impl((void *)&_mh_execute_header, v56, v100, "[VisualSearch][%@] Thumbnail resource not locally available", v127, 0xCu);
          }
          goto LABEL_61;
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v56 = VCPLogInstance();
        if (os_log_type_enabled(v56, v100))
        {
          v57 = [v20 asset];
          v58 = [v57 localIdentifier];
          *(_DWORD *)v127 = 138412290;
          v128 = v58;
          _os_log_impl((void *)&_mh_execute_header, v56, v100, "[VisualSearch][%@] No thumbnail resource", v127, 0xCu);
        }
LABEL_61:
      }
      [v20 setStatus:4294943494];
      int v21 = 6;
LABEL_75:

      goto LABEL_76;
    }
    if ((int)MediaAnalysisLogLevel() < 5)
    {
      int v21 = 4;
      goto LABEL_77;
    }
    unsigned int v20 = VCPLogInstance();
    if (os_log_type_enabled(v20, type))
    {
      *(_WORD *)v127 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, type, "[VisualSearch] Processing canceled", v127, 2u);
    }
    int v21 = 4;
LABEL_76:

LABEL_77:
    if (v21 == 4) {
      break;
    }
    ++v14;
  }
  os_log_type_t v70 = VCPLogToOSLogType[7];
  while (v14 < (unint64_t)[(NSMutableArray *)self->_assetEntries count])
  {
    v72 = [(NSMutableArray *)self->_assetEntries objectAtIndexedSubscript:v14];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v73 = VCPLogInstance();
      if (os_log_type_enabled(v73, v70))
      {
        v74 = [v72 asset];
        v75 = [v74 localIdentifier];
        *(_DWORD *)v127 = 138412290;
        v128 = v75;
        _os_log_impl((void *)&_mh_execute_header, v73, v70, "[VisualSearch][%@] Marking asset as canceled", v127, 0xCu);
      }
    }
    [v72 setStatus:4294967168];

    ++v14;
  }
  dispatch_group_wait(v96, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  MADBMSendDomainSpecificAssetCounts(v124[3], v120[3], *(void **)(v136 + 40));
  if (v94) {
    MADPLLogBackgroundStaticStickerScoring();
  }
  v76 = VCPSignPostLog();
  v77 = v76;
  if (v88 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v76))
  {
    *(_WORD *)v127 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v77, OS_SIGNPOST_INTERVAL_END, spid, "MADPhotosVisualSearchAssetProcessingTask_Process", (const char *)&unk_1001F3BD3, v127, 2u);
  }

  [v99 stop];
  v78 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v99 elapsedTimeSeconds];
  objc_msgSend(v78, "accumulateDoubleValue:forField:andEvent:", @"TotalAnalyzingTimeInSeconds", @"com.apple.mediaanalysisd.VisualSearchAnalysisRunSession");

  v79 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v99 elapsedTimeSeconds];
  objc_msgSend(v79, "accumulateDoubleValue:forField:andEvent:", @"TotalProcessTimeInSeconds", @"com.apple.mediaanalysisd.VisualSearchAnalysisRunSession");

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v119, 8);
  _Block_object_dispose(&v123, 8);

  return 0;
}

- (void)process
{
  if (!self->_status) {
    self->_status = [(MADPhotosVisualSearchAssetProcessingTask *)self _process];
  }
}

- (int)_publish
{
  id v59 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v59 start];
  v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  v4 = VCPSignPostLog();
  os_signpost_id_t v5 = v4;
  os_signpost_id_t spid = v3;
  unint64_t v53 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MADPhotosVisualSearchAssetProcessingTask_Publish", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  id v6 = &OBJC_IVAR___VCPAssetAnalysisTask__types;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      unsigned int v9 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v10 = qos_class_self();
      qos_class_t v11 = VCPMAQoSDescription(v10);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v72 = v9;
      *(_WORD *)&v72[4] = 2112;
      *(void *)&v72[6] = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[VisualSearch] Persisting %d assets (QoS: %@)", buf, 0x12u);
    }
  }
  if ([(NSMutableArray *)self->_assetEntries count])
  {
    id v12 = +[MADStateHandler sharedStateHandler];
    objc_msgSend(v12, "addBreadcrumb:", @"[VisualSearch] Persisting %d assets to Photos", -[NSMutableArray count](self->_assetEntries, "count"));

    id v13 = +[VCPWatchdog sharedWatchdog];
    [v13 pet];

    unint64_t v14 = +[MADStateHandler sharedStateHandler];
    [v14 enterKnownTimeoutRisk:1];

    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_100107150;
    v69[3] = &unk_100219FC8;
    v69[4] = self;
    v57 = objc_retainBlock(v69);
    uint64_t v15 = [(NSMutableArray *)self->_assetEntries firstObject];
    id v16 = [(id)v15 asset];
    v58 = [v16 photoLibrary];

    v17 = [(MADProcessingTask *)self cancelBlock];
    id v68 = 0;
    LOBYTE(v15) = objc_msgSend(v58, "mad_performChangesAndWait:cancelBlock:extendTimeoutBlock:error:", v57, v17, &stru_10021E1C8, &v68);
    id v61 = v68;

    BOOL v18 = +[MADStateHandler sharedStateHandler];
    [v18 exitKnownTimeoutRisk];

    int v19 = +[MADStateHandler sharedStateHandler];
    objc_msgSend(v19, "addBreadcrumb:", @"[VisualSearch] Finished persisting %d assets to Photos", -[NSMutableArray count](self->_assetEntries, "count"));

    if (v15)
    {
      v55 = +[VCPMADCoreAnalyticsManager sharedManager];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      obj = self->_assetEntries;
      id v20 = [(NSMutableArray *)obj countByEnumeratingWithState:&v64 objects:v70 count:16];
      unsigned int v21 = 0;
      if (v20)
      {
        uint64_t v62 = *(void *)v65;
        while (2)
        {
          id v60 = v20;
          for (i = 0; i != v60; i = (char *)i + 1)
          {
            if (*(void *)v65 != v62) {
              objc_enumerationMutation(obj);
            }
            os_log_type_t v23 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            if (![v23 status])
            {
              if ([v23 visualSearchStatus]) {
                id v24 = [v23 visualSearchStatus];
              }
              else {
                id v24 = [v23 stickerStatus];
              }
              [v23 setStatus:v24];
            }
            if ([v23 status])
            {
              if ([v23 status] == -128)
              {
                id v25 = [v23 previousAttempts];
                analysisDatabase = self->_analysisDatabase;
                if (v25)
                {
                  id v27 = [v23 previousAttempts];
                  os_log_type_t v28 = [v23 asset];
                  id v29 = [v23 previousStatus];
                  id v30 = [v23 lastAttemptDate];
                  id v31 = (id)[(VCPDatabaseWriter *)analysisDatabase setAttempts:v27 asset:v28 taskID:12 status:v29 lastAttemptDate:v30];
                }
                else
                {
                  os_log_type_t v28 = [v23 asset];
                  id v30 = [v28 localIdentifier];
                  id v31 = (id)[(VCPDatabaseWriter *)analysisDatabase removeProcessingStatusForLocalIdentifier:v30 andTaskID:12];
                }

                if (v31 == -108 || v31 == -36)
                {
                  __int16 v36 = (int *)v31;
                }
                else
                {
                  __int16 v36 = (int *)v31;
                  if (v31 != -23) {
                    __int16 v36 = v6;
                  }
                }
                if (v31 == -108 || v31 == -36 || v31 == -23) {
                  goto LABEL_71;
                }
                unsigned int v21 = [v23 status];
                id v6 = v36;
              }
              else
              {
                unsigned int v37 = [v23 status];
                if (v37 == -23802) {
                  uint64_t v38 = 2;
                }
                else {
                  uint64_t v38 = 3;
                }
                CGFloat v39 = [v23 asset];
                __int16 v40 = [v23 currentAttemptDate];
                CGFloat v41 = objc_msgSend(v39, "mad_nextAttemptDateForStatus:currentAttemptDate:attemptCount:", v38, v40, (char *)objc_msgSend(v23, "previousAttempts") + 1);

                __int16 v42 = self->_analysisDatabase;
                id v43 = [v23 asset];
                unsigned int v44 = [v43 localIdentifier];
                id v45 = (id)[(VCPDatabaseWriter *)v42 updateProcessingStatus:v38 andNextAttemptDate:v41 forLocalIdentifier:v44 andTaskID:12];

                if (v45 == -108 || v45 == -36)
                {
                  __int16 v36 = (int *)v45;
                }
                else
                {
                  __int16 v36 = (int *)v45;
                  if (v45 != -23) {
                    __int16 v36 = v6;
                  }
                }
                if (v45 != -108 && v45 != -36 && v45 != -23)
                {
                  if (v37 == -23802) {
                    CFStringRef v46 = @"NumberOfAssetsNoResource";
                  }
                  else {
                    CFStringRef v46 = @"NumberOfAssetsSoftFailure";
                  }
                  [v55 accumulateInt64Value:1 forField:v46 andEvent:@"com.apple.mediaanalysisd.VisualSearchAnalysisRunSession"];
                }

                if (v45 == -108) {
                  goto LABEL_71;
                }
                if (v45 == -36) {
                  goto LABEL_71;
                }
                id v6 = v36;
                if (v45 == -23) {
                  goto LABEL_71;
                }
              }
            }
            else
            {
              double v32 = self->_analysisDatabase;
              os_signpost_id_t v33 = [v23 asset];
              long long v34 = [v33 localIdentifier];
              id v35 = (id)[(VCPDatabaseWriter *)v32 removeProcessingStatusForLocalIdentifier:v34 andTaskID:12];

              if (v35 == -108 || v35 == -36)
              {
                __int16 v36 = (int *)v35;
              }
              else
              {
                __int16 v36 = (int *)v35;
                if (v35 != -23) {
                  __int16 v36 = v6;
                }
              }
              if (v35 == -108 || v35 == -36 || v35 == -23)
              {
LABEL_71:

                goto LABEL_72;
              }
              [v55 accumulateInt64Value:1 forField:@"NumberOfAssetsAnalyzed" andEvent:@"com.apple.mediaanalysisd.VisualSearchAnalysisRunSession"];
              id v6 = v36;
            }
          }
          id v20 = [(NSMutableArray *)obj countByEnumeratingWithState:&v64 objects:v70 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      unsigned int v50 = [(VCPDatabaseWriter *)self->_analysisDatabase commit];
      if (v50 == -108 || v50 == -36)
      {
        LODWORD(v36) = v50;
      }
      else
      {
        LODWORD(v36) = v50;
        if (v50 != -23) {
          LODWORD(v36) = v6;
        }
      }
      if (v50 != -108 && v50 != -36 && v50 != -23)
      {
        v51 = VCPSignPostLog();
        v52 = v51;
        if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_END, spid, "MADPhotosVisualSearchAssetProcessingTask_Publish", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        [v59 stop];
        [v59 elapsedTimeSeconds];
        objc_msgSend(v55, "accumulateDoubleValue:forField:andEvent:", @"TotalPublishTimeInSeconds", @"com.apple.mediaanalysisd.VisualSearchAnalysisRunSession");
        LODWORD(v36) = v21;
      }
LABEL_72:
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        CGRect v47 = VCPLogInstance();
        os_log_type_t v48 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v47, v48))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v72 = v61;
          _os_log_impl((void *)&_mh_execute_header, v47, v48, "[VisualSearch] Failed to persist results to Photos (%@)", buf, 0xCu);
        }
      }
      LODWORD(v36) = [v61 code];
    }
  }
  else
  {
    LODWORD(v36) = 0;
  }

  return (int)v36;
}

- (void)publish
{
  if (!self->_status) {
    self->_status = [(MADPhotosVisualSearchAssetProcessingTask *)self _publish];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerQueue, 0);
  objc_storeStrong((id *)&self->_analysisDatabase, 0);
  objc_storeStrong((id *)&self->_visionSession, 0);
  objc_storeStrong((id *)&self->_servicePool, 0);
  objc_storeStrong((id *)&self->_assetEntries, 0);
}

@end