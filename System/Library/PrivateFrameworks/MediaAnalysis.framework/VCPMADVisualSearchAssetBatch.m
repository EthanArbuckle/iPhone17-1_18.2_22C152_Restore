@interface VCPMADVisualSearchAssetBatch
+ (id)batchWithServicePool:(id)a3 visionSession:(id)a4 analysisDatabase:(id)a5 cancelBlock:(id)a6;
+ (int)concurrentAssetCount;
- (CGRect)_computeRegionOfInterest:(__CVBuffer *)a3 orientation:(unsigned int)a4;
- (VCPMADVisualSearchAssetBatch)initWithServicePool:(id)a3 visionSession:(id)a4 analysisDatabase:(id)a5 cancelBlock:(id)a6;
- (int)_calculateStickerScore:(__CVBuffer *)a3 orientation:(unsigned int)a4 regionOfInterest:(CGRect)a5 stickerScore:(float *)a6;
- (int)prepare;
- (int)process;
- (int)publish;
- (unint64_t)count;
- (void)addPhotosAsset:(id)a3 withPreviousStatus:(unint64_t)a4 attempts:(unint64_t)a5 andAttemptDate:(id)a6;
@end

@implementation VCPMADVisualSearchAssetBatch

+ (int)concurrentAssetCount
{
  return 1;
}

- (VCPMADVisualSearchAssetBatch)initWithServicePool:(id)a3 visionSession:(id)a4 analysisDatabase:(id)a5 cancelBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)VCPMADVisualSearchAssetBatch;
  v15 = [(VCPMADVisualSearchAssetBatch *)&v24 init];
  if (v15)
  {
    uint64_t v16 = +[NSMutableArray array];
    assetEntries = v15->_assetEntries;
    v15->_assetEntries = (NSMutableArray *)v16;

    objc_storeStrong((id *)&v15->_servicePool, a3);
    objc_storeStrong((id *)&v15->_visionSession, a4);
    objc_storeStrong((id *)&v15->_analysisDatabase, a5);
    id v18 = objc_retainBlock(v14);
    id cancelBlock = v15->_cancelBlock;
    v15->_id cancelBlock = v18;

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.mediaanalysis.StickerScore", v20);
    stickerQueue = v15->_stickerQueue;
    v15->_stickerQueue = (OS_dispatch_queue *)v21;
  }
  return v15;
}

+ (id)batchWithServicePool:(id)a3 visionSession:(id)a4 analysisDatabase:(id)a5 cancelBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [objc_alloc((Class)a1) initWithServicePool:v10 visionSession:v11 analysisDatabase:v12 cancelBlock:v13];

  return v14;
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_assetEntries count];
}

- (void)addPhotosAsset:(id)a3 withPreviousStatus:(unint64_t)a4 attempts:(unint64_t)a5 andAttemptDate:(id)a6
{
  id v8 = a3;
  id v29 = a6;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v9 = self->_assetEntries;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v31;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = [*(id *)(*((void *)&v30 + 1) + 8 * i) asset];
        id v14 = [v13 localIdentifier];
        v15 = [v8 localIdentifier];
        unsigned int v16 = [v14 isEqualToString:v15];

        if (v16)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v22 = VCPLogInstance();
            os_log_type_t v23 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v22, v23))
            {
              objc_super v24 = [v8 localIdentifier];
              *(_DWORD *)buf = 138412290;
              v35 = v24;
              _os_log_impl((void *)&_mh_execute_header, v22, v23, "[VisualSearch][%@] Batch already contains asset; ignoring",
                buf,
                0xCu);
            }
          }
          goto LABEL_20;
        }
      }
      id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  unsigned int v17 = objc_msgSend(v8, "vcp_needsVisualSearchProcessing");
  unsigned int v18 = objc_msgSend(v8, "vcp_needsStickerGatingProcessing");
  uint64_t v19 = 2;
  if (!v17) {
    uint64_t v19 = 0;
  }
  if (v18) {
    uint64_t v20 = v19 | 4;
  }
  else {
    uint64_t v20 = v19;
  }
  if (v20)
  {
    assetEntries = self->_assetEntries;
    +[VCPMADVisualSearchAssetEntry entryWithAsset:previousStatus:previousAttempts:andLastAttemptDate:analysisTypes:](VCPMADVisualSearchAssetEntry, "entryWithAsset:previousStatus:previousAttempts:andLastAttemptDate:analysisTypes:", v8, a4, a5, v29);
    v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    [(NSMutableArray *)assetEntries addObject:v9];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 4) {
      goto LABEL_21;
    }
    VCPLogInstance();
    v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v25 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(&v9->super.super, v25))
    {
      v26 = [v8 localIdentifier];
      *(_DWORD *)buf = 138412290;
      v35 = v26;
      _os_log_impl((void *)&_mh_execute_header, &v9->super.super, v25, "[VisualSearch][%@] Asset is with up-to-date results, ignoring", buf, 0xCu);
    }
  }
LABEL_20:

LABEL_21:
}

- (CGRect)_computeRegionOfInterest:(__CVBuffer *)a3 orientation:(unsigned int)a4
{
  v5 = +[VIImage imageWithPixelBuffer:a3 orientation:*(void *)&a4];
  id v6 = objc_msgSend(objc_alloc((Class)VIRefineRegionRequest), "initWithImage:regionOfInterest:imageType:preferredMetalDevice:", v5, 1, 0, 0.0, 0.0, 1.0, 1.0);
  v7 = [(VCPObjectPool *)self->_servicePool getObject];
  id v8 = [v7 object];
  id v33 = 0;
  v9 = [v8 refineRegionsWithRequest:v6 error:&v33];
  id v10 = v33;

  if (v10)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v11 = VCPLogInstance();
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
    unsigned int v17 = [v9 refinedRegions];
    BOOL v18 = [v17 count] == 0;

    if (v18)
    {
      CGFloat width = 1.0;
      CGFloat x = 0.0;
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v27 = VCPLogInstance();
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
      uint64_t v19 = [v9 refinedRegions];
      uint64_t v20 = [v19 firstObject];

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
        dispatch_queue_t v21 = VCPLogInstance();
        os_log_type_t v22 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v21, v22))
        {
          [v20 confidence];
          float v24 = v23;
          os_log_type_t v25 = [v9 refinedRegions];
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
  *a6 = 0.0;
  id v7 = [objc_alloc((Class)VNImageRequestHandler) initWithCVPixelBuffer:a3 orientation:*(void *)&a4 options:&__NSDictionary0__struct session:self->_visionSession];
  id v8 = objc_alloc_init((Class)VNGenerateInstanceMaskGatingRequest);
  if (DeviceHasANE())
  {
    v9 = +[VNProcessingDevice defaultANEDevice];
    [v8 setProcessingDevice:v9];
  }
  id v26 = v8;
  id v10 = +[NSArray arrayWithObjects:&v26 count:1];
  id v23 = 0;
  unsigned __int8 v11 = [v7 performRequests:v10 error:&v23];
  id v12 = v23;

  if ((v11 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v15 = VCPLogInstance();
      os_log_type_t v19 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v15, v19))
      {
        uint64_t v20 = [v12 description];
        *(_DWORD *)buf = 138412290;
        os_log_type_t v25 = v20;
        _os_log_impl((void *)&_mh_execute_header, v15, v19, "[ImageStickerScore] Score generation failed (%@)", buf, 0xCu);
      }
      goto LABEL_12;
    }
LABEL_14:
    int v18 = -18;
    goto LABEL_15;
  }
  id v13 = [v8 results];
  BOOL v14 = [v13 count] == 0;

  if (v14)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v15 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v15, v21))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, v21, "[ImageStickerScore] No observations produced for image", buf, 2u);
      }
LABEL_12:
      int v18 = -18;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v15 = [v8 results];
  unsigned int v16 = [v15 firstObject];
  [v16 confidence];
  *(_DWORD *)a6 = v17;

  int v18 = 0;
LABEL_13:

LABEL_15:
  return v18;
}

- (int)prepare
{
  v4 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v4);

  v5 = VCPSignPostLog();
  id v6 = v5;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADVisualSearchAssetEntry_Prepare", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    oslog = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(oslog, v7))
    {
      unsigned int v8 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v9 = qos_class_self();
      v2 = VCPMAQoSDescription(v9);
      *(_DWORD *)buf = 67109378;
      unsigned int v35 = v8;
      __int16 v36 = 2112;
      CGFloat v37 = v2;
      _os_log_impl((void *)&_mh_execute_header, oslog, v7, "[VisualSearch] Preparing %d assets (QoS: %@)", buf, 0x12u);
    }
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  osloga = self->_assetEntries;
  id v10 = [(NSMutableArray *)osloga countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v30;
    while (2)
    {
      id v12 = 0;
      id v13 = v2;
      do
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(osloga);
        }
        BOOL v14 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v12);
        analysisDatabase = self->_analysisDatabase;
        unsigned int v16 = (char *)[v14 previousAttempts];
        int v17 = [v14 asset];
        int v18 = +[NSDate now];
        id v19 = (id)[(VCPDatabaseWriter *)analysisDatabase setAttempts:v16 + 1 asset:v17 taskID:12 status:1 lastAttemptDate:v18];

        if (v19 == -108)
        {
          v2 = v19;
        }
        else
        {
          BOOL v20 = v19 == -36 || v19 == -23;
          v2 = v19;
          if (!v20) {
            v2 = v13;
          }
        }
        if (v19 == -108 || (v19 != -36 ? (BOOL v21 = v19 == -23) : (BOOL v21 = 1), v21))
        {
          p_super = &osloga->super.super;
          goto LABEL_29;
        }
        id v12 = (char *)v12 + 1;
        id v13 = v2;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)osloga countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  int result = [(VCPDatabaseWriter *)self->_analysisDatabase commit];
  int v24 = result;
  if (result != -108 && result != -36 && result != -23) {
    int result = (int)v2;
  }
  if (v24 != -108 && v24 != -36 && v24 != -23)
  {
    os_log_type_t v25 = VCPSignPostLog();
    if (spid - 1 >= 0xFFFFFFFFFFFFFFFELL)
    {
      LODWORD(v2) = 0;
      p_super = v25;
    }
    else
    {
      p_super = v25;
      if (os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, p_super, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADVisualSearchAssetEntry_Prepare", (const char *)&unk_1001F3BD3, buf, 2u);
      }
      LODWORD(v2) = 0;
    }
LABEL_29:

    return (int)v2;
  }
  return result;
}

- (int)process
{
  signed int v3 = [(id)objc_opt_class() concurrentAssetCount];
  dsema = dispatch_semaphore_create(v3);
  v94 = dispatch_group_create();
  group = dispatch_group_create();
  v88 = [(VCPObjectPool *)self->_servicePool getObject];
  v4 = VCPSignPostLog();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  id v6 = VCPSignPostLog();
  os_log_type_t v7 = v6;
  os_signpost_id_t spid = v5;
  unint64_t v86 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "VCPMADVisualSearchAssetEntry_Process", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    unsigned int v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v8, v9))
    {
      unsigned int v10 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v11 = qos_class_self();
      id v12 = VCPMAQoSDescription(v11);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v10;
      LOWORD(v134) = 2112;
      *(void *)((char *)&v134 + 2) = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[VisualSearch] Processing %d assets (QoS: %@)", buf, 0x12u);
    }
  }
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  uint64_t v124 = 0;
  uint64_t v117 = 0;
  v118 = &v117;
  uint64_t v119 = 0x2020000000;
  uint64_t v120 = 0;
  *(void *)buf = 0;
  *(void *)&long long v134 = buf;
  *((void *)&v134 + 1) = 0x3032000000;
  v135 = sub_1000F7BD8;
  v136 = sub_1000F7BE8;
  id v137 = objc_alloc_init((Class)NSMutableDictionary);
  id v13 = +[NSDate now];
  [v13 timeIntervalSince1970];

  uint64_t v96 = 0;
  uint64_t v87 = 0;
  uint64_t v92 = 0;
  unint64_t v14 = 0;
  int v97 = 0;
  os_log_type_t type = VCPLogToOSLogType[5];
  os_log_type_t v99 = VCPLogToOSLogType[6];
  os_log_type_t v98 = VCPLogToOSLogType[4];
  uint64_t v81 = VIQueryContextLocationKey;
  uint64_t v80 = VIQueryContextImageTypeKey;
  *(void *)&long long v15 = 138413058;
  long long v79 = v15;
  while (v14 < (unint64_t)[(NSMutableArray *)self->_assetEntries count])
  {
    int v17 = +[VCPWatchdog sharedWatchdog];
    [v17 pet];

    id cancelBlock = (unsigned int (**)(void))self->_cancelBlock;
    if (!cancelBlock || !cancelBlock[2]())
    {
      id v19 = [(NSMutableArray *)self->_assetEntries objectAtIndexedSubscript:v14];
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        BOOL v21 = VCPLogInstance();
        if (os_log_type_enabled(v21, v99))
        {
          os_log_type_t v22 = [v19 asset];
          id v23 = [v22 localIdentifier];
          *(_DWORD *)v125 = 138412290;
          v126 = v23;
          _os_log_impl((void *)&_mh_execute_header, v21, v99, "[VisualSearch][%@] Processing asset", v125, 0xCu);
        }
      }
      int v24 = [v19 asset];
      os_log_type_t v25 = [v24 adjustmentVersion];
      BOOL v26 = v25 == 0;

      if (v26)
      {
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v52 = VCPLogInstance();
          if (os_log_type_enabled(v52, v98))
          {
            v53 = [v19 asset];
            v54 = [v53 localIdentifier];
            *(_DWORD *)v125 = 138412290;
            v126 = v54;
            _os_log_impl((void *)&_mh_execute_header, v52, v98, "[VisualSearch][%@] Asset has no adjustment version", v125, 0xCu);
          }
        }
        [v19 setStatus:4294943493];
        int v20 = 6;
        goto LABEL_76;
      }
      v27 = [v19 asset];
      os_log_type_t v28 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v27];

      long long v29 = objc_msgSend(v28, "vcp_thumbnailResource");
      long long v30 = v29;
      if (v29)
      {
        if ([v29 isLocallyAvailable])
        {
          long long v31 = VCPSignPostLog();
          os_signpost_id_t v32 = os_signpost_id_generate(v31);

          id v33 = VCPSignPostLog();
          v34 = v33;
          if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
          {
            *(_WORD *)v125 = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_BEGIN, v32, "VCPMADVisualSearchAssetBatch_Decode", (const char *)&unk_1001F3BD3, v125, 2u);
          }

          int v116 = 0;
          unsigned int v35 = +[VCPImageManager sharedImageManager];
          __int16 v36 = [v30 privateFileURL];
          CFTypeRef cf = [v35 pixelBufferWithFormat:875704438 fromImageURL:v36 flushCache:0 orientation:&v116];

          CGFloat v37 = VCPSignPostLog();
          __int16 v38 = v37;
          if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
          {
            *(_WORD *)v125 = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_INTERVAL_END, v32, "VCPMADVisualSearchAssetBatch_Decode", (const char *)&unk_1001F3BD3, v125, 2u);
          }

          if (cf)
          {
            if (([v19 analysisTypes] & 4) != 0)
            {
              stickerQueue = self->_stickerQueue;
              block[0] = _NSConcreteStackBlock;
              block[1] = 3321888768;
              block[2] = sub_1000F7BF0;
              block[3] = &unk_10021DFE8;
              v111 = v19;
              v112 = self;
              CFTypeRef v113 = cf;
              if (cf) {
                CFRetain(cf);
              }
              int v114 = v116;
              dispatch_group_async(group, stickerQueue, block);
              sub_100004484(&v113);

              ++v92;
            }
            ++v96;
            if (([v19 analysisTypes] & 2) == 0) {
              goto LABEL_73;
            }
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              __int16 v40 = VCPLogInstance();
              if (os_log_type_enabled(v40, v99))
              {
                v90 = [v19 asset];
                CGFloat v41 = [v90 localIdentifier];
                id v42 = [v30 type];
                unsigned int v43 = [v30 pixelWidth];
                unsigned int v44 = [v30 pixelHeight];
                *(_DWORD *)v125 = v79;
                v126 = v41;
                __int16 v127 = 2048;
                id v128 = v42;
                __int16 v129 = 1024;
                unsigned int v130 = v43;
                __int16 v131 = 1024;
                unsigned int v132 = v44;
                _os_log_impl((void *)&_mh_execute_header, v40, v99, "[VisualSearch][%@] Processing resource type %ld (%dx%d)", v125, 0x22u);
              }
            }
            uint64_t v45 = [v19 asset];
            CGRect v46 = +[VCPMADServiceImageAsset assetWithPhotosAsset:v45 clientBundleID:0 clientTeamID:0];

            v84 = objc_msgSend(v46, "vcp_annotationWithTypes:", 7);
            v91 = +[NSMutableDictionary dictionary];
            CGRect v47 = [v46 location];
            LOBYTE(v45) = v47 == 0;

            if ((v45 & 1) == 0)
            {
              v48 = [v46 location];
              [v91 setObject:v48 forKeyedSubscript:v81];
            }
            if ([v46 isScreenshot]) {
              [v91 setObject:&off_10022F1A8 forKeyedSubscript:v80];
            }
            id v109 = 0;
            v83 = +[VIQueryContext contextWithDictionary:v91 error:&v109];
            id v85 = v109;
            if (v85)
            {
              if ((int)MediaAnalysisLogLevel() >= 4)
              {
                CGRect v49 = VCPLogInstance();
                if (os_log_type_enabled(v49, v98))
                {
                  v50 = [v19 asset];
                  v51 = [v50 localIdentifier];
                  *(_DWORD *)v125 = 138412290;
                  v126 = v51;
                  _os_log_impl((void *)&_mh_execute_header, v49, v98, "[VisualSearch][%@] Failed to create query context", v125, 0xCu);
                }
              }
              [v19 setVisualSearchStatus:4294967278];
              int v20 = 6;
            }
            else
            {
              v63 = +[VIVisualQuery queryWithPixelBuffer:orientation:normalizedRegionOfInterest:annotation:queryContext:](VIVisualQuery, "queryWithPixelBuffer:orientation:normalizedRegionOfInterest:annotation:queryContext:", cf, 1, v84, v83, 0.0, 0.0, 1.0, 1.0);
              dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
              v64 = VCPSignPostLog();
              os_signpost_id_t v65 = os_signpost_id_generate(v64);

              v66 = VCPSignPostLog();
              v67 = v66;
              if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
              {
                *(_WORD *)v125 = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v67, OS_SIGNPOST_INTERVAL_BEGIN, v65, "VIService_VisualSearchGating", (const char *)&unk_1001F3BD3, v125, 2u);
              }

              dispatch_group_enter(v94);
              v68 = [v88 object];
              v100[0] = _NSConcreteStackBlock;
              v100[1] = 3221225472;
              v100[2] = sub_1000F7ED8;
              v100[3] = &unk_10021E020;
              os_signpost_id_t v107 = v65;
              uint64_t v108 = 0;
              v101 = v19;
              v104 = &v121;
              v105 = buf;
              v106 = &v117;
              v102 = dsema;
              v103 = v94;
              id v69 = [v68 parseWithVisualQuery:v63 cachedResults:0 completion:v100];

              int v20 = 0;
              ++v87;
            }

            if (!v85) {
LABEL_73:
            }
              int v20 = 0;
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              v60 = VCPLogInstance();
              if (os_log_type_enabled(v60, v98))
              {
                v61 = [v19 asset];
                v62 = [v61 localIdentifier];
                *(_DWORD *)v125 = 138412290;
                v126 = v62;
                _os_log_impl((void *)&_mh_execute_header, v60, v98, "[VisualSearch][%@] Failed to decode thumbnail", v125, 0xCu);
              }
            }
            [v19 setStatus:4294943494];
            int v20 = 6;
          }
          sub_100004484(&cf);
          goto LABEL_75;
        }
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v55 = VCPLogInstance();
          if (os_log_type_enabled(v55, v98))
          {
            v58 = [v19 asset];
            v59 = [v58 localIdentifier];
            *(_DWORD *)v125 = 138412290;
            v126 = v59;
            _os_log_impl((void *)&_mh_execute_header, v55, v98, "[VisualSearch][%@] Thumbnail resource not locally available", v125, 0xCu);
          }
          goto LABEL_61;
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v55 = VCPLogInstance();
        if (os_log_type_enabled(v55, v98))
        {
          v56 = [v19 asset];
          v57 = [v56 localIdentifier];
          *(_DWORD *)v125 = 138412290;
          v126 = v57;
          _os_log_impl((void *)&_mh_execute_header, v55, v98, "[VisualSearch][%@] No thumbnail resource", v125, 0xCu);
        }
LABEL_61:
      }
      [v19 setStatus:4294943494];
      int v20 = 6;
LABEL_75:

      goto LABEL_76;
    }
    if ((int)MediaAnalysisLogLevel() < 5)
    {
      int v97 = -128;
      int v20 = 4;
      goto LABEL_77;
    }
    id v19 = VCPLogInstance();
    if (os_log_type_enabled(v19, type))
    {
      *(_WORD *)v125 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, type, "[VisualSearch] Processing canceled", v125, 2u);
    }
    int v97 = -128;
    int v20 = 4;
LABEL_76:

LABEL_77:
    if (v20 == 4) {
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
        *(_DWORD *)v125 = 138412290;
        v126 = v75;
        _os_log_impl((void *)&_mh_execute_header, v73, v70, "[VisualSearch][%@] Marking asset as canceled", v125, 0xCu);
      }
    }
    [v72 setStatus:4294967168];

    ++v14;
  }
  dispatch_group_wait(v94, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  MADBMSendDomainSpecificAssetCounts(v122[3], v118[3], *(void **)(v134 + 40));
  if (v92) {
    MADPLLogBackgroundStaticStickerScoring();
  }
  v76 = VCPSignPostLog();
  v77 = v76;
  if (v86 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v76))
  {
    *(_WORD *)v125 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v77, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADVisualSearchAssetEntry_Process", (const char *)&unk_1001F3BD3, v125, 2u);
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v117, 8);
  _Block_object_dispose(&v121, 8);

  return v97;
}

- (int)publish
{
  signed int v3 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v3);

  v4 = VCPSignPostLog();
  os_signpost_id_t v5 = v4;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADVisualSearchAssetEntry_Publish", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  id v6 = buf;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      unsigned int v9 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v10 = qos_class_self();
      qos_class_t v11 = VCPMAQoSDescription(v10);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v67 = v9;
      *(_WORD *)&v67[4] = 2112;
      *(void *)&v67[6] = v11;
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

    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_1000F8E9C;
    v64[3] = &unk_100219FC8;
    v64[4] = self;
    v54 = objc_retainBlock(v64);
    long long v15 = [(NSMutableArray *)self->_assetEntries firstObject];
    unsigned int v16 = [v15 asset];
    v55 = [v16 photoLibrary];

    id cancelBlock = self->_cancelBlock;
    id v63 = 0;
    unsigned __int8 v18 = objc_msgSend(v55, "mad_performChangesAndWait:cancelBlock:extendTimeoutBlock:error:", v54, cancelBlock, &stru_10021E040, &v63);
    id v57 = v63;
    id v19 = +[MADStateHandler sharedStateHandler];
    [v19 exitKnownTimeoutRisk];

    int v20 = +[MADStateHandler sharedStateHandler];
    objc_msgSend(v20, "addBreadcrumb:", @"[VisualSearch] Finished persisting %d assets to Photos", -[NSMutableArray count](self->_assetEntries, "count"));

    if (v18)
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      obj = self->_assetEntries;
      id v21 = [(NSMutableArray *)obj countByEnumeratingWithState:&v59 objects:v65 count:16];
      if (v21)
      {
        uint64_t v58 = *(void *)v60;
        while (2)
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v60 != v58) {
              objc_enumerationMutation(obj);
            }
            id v23 = *(void **)(*((void *)&v59 + 1) + 8 * i);
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
                  long long v30 = [v23 lastAttemptDate];
                  id v31 = (id)[(VCPDatabaseWriter *)analysisDatabase setAttempts:v27 asset:v28 taskID:12 status:v29 lastAttemptDate:v30];
                }
                else
                {
                  uint64_t v45 = [v23 asset];
                  CGRect v46 = [v45 localIdentifier];
                  id v31 = (id)[(VCPDatabaseWriter *)analysisDatabase removeProcessingStatusForLocalIdentifier:v46 andTaskID:12];
                }
                if (v31 == -108 || v31 == -36)
                {
                  __int16 v36 = (uint8_t *)v31;
                }
                else
                {
                  __int16 v36 = (uint8_t *)v31;
                  if (v31 != -23) {
                    __int16 v36 = v6;
                  }
                }
                if (v31 == -108) {
                  goto LABEL_63;
                }
                if (v31 == -36) {
                  goto LABEL_63;
                }
                id v6 = v36;
                if (v31 == -23) {
                  goto LABEL_63;
                }
              }
              else
              {
                if ([v23 status] == -23802) {
                  uint64_t v37 = 2;
                }
                else {
                  uint64_t v37 = 3;
                }
                __int16 v38 = [v23 asset];
                CGFloat v39 = [v23 currentAttemptDate];
                __int16 v40 = objc_msgSend(v38, "mad_nextAttemptDateForStatus:currentAttemptDate:attemptCount:", v37, v39, (char *)objc_msgSend(v23, "previousAttempts") + 1);

                CGFloat v41 = self->_analysisDatabase;
                id v42 = [v23 asset];
                unsigned int v43 = [v42 localIdentifier];
                id v44 = (id)[(VCPDatabaseWriter *)v41 updateProcessingStatus:v37 andNextAttemptDate:v40 forLocalIdentifier:v43 andTaskID:12];

                if (v44 == -108 || v44 == -36)
                {
                  __int16 v36 = (uint8_t *)v44;
                }
                else
                {
                  __int16 v36 = (uint8_t *)v44;
                  if (v44 != -23) {
                    __int16 v36 = v6;
                  }
                }

                if (v44 == -108) {
                  goto LABEL_63;
                }
                if (v44 == -36) {
                  goto LABEL_63;
                }
                id v6 = v36;
                if (v44 == -23) {
                  goto LABEL_63;
                }
              }
            }
            else
            {
              os_signpost_id_t v32 = self->_analysisDatabase;
              id v33 = [v23 asset];
              v34 = [v33 localIdentifier];
              id v35 = (id)[(VCPDatabaseWriter *)v32 removeProcessingStatusForLocalIdentifier:v34 andTaskID:12];

              if (v35 == -108 || v35 == -36)
              {
                __int16 v36 = (uint8_t *)v35;
              }
              else
              {
                __int16 v36 = (uint8_t *)v35;
                if (v35 != -23) {
                  __int16 v36 = v6;
                }
              }
              if (v35 == -108 || v35 == -36 || (id v6 = v36, v35 == -23))
              {
LABEL_63:

                goto LABEL_64;
              }
            }
          }
          id v21 = [(NSMutableArray *)obj countByEnumeratingWithState:&v59 objects:v65 count:16];
          if (v21) {
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
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADVisualSearchAssetEntry_Publish", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        LODWORD(v36) = 0;
      }
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
          *(void *)v67 = v57;
          _os_log_impl((void *)&_mh_execute_header, v47, v48, "[VisualSearch] Failed to persist results to Photos (%@)", buf, 0xCu);
        }
      }
      LODWORD(v36) = [v57 code];
    }
LABEL_64:
  }
  else
  {
    LODWORD(v36) = 0;
  }
  return (int)v36;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_stickerQueue, 0);
  objc_storeStrong((id *)&self->_analysisDatabase, 0);
  objc_storeStrong((id *)&self->_visionSession, 0);
  objc_storeStrong((id *)&self->_servicePool, 0);
  objc_storeStrong((id *)&self->_assetEntries, 0);
}

@end