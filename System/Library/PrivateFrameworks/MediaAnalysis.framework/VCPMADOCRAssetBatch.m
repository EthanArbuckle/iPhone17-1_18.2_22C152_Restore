@interface VCPMADOCRAssetBatch
+ (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
- (VCPMADOCRAssetBatch)initWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
- (double)downloadInactiveTimeInterval;
- (id)acceptableResourcesForAsset:(id)a3 withResources:(id)a4;
- (id)localResourceForAsset:(id)a3 withAcceptableResources:(id)a4;
- (id)remoteResourceForAsset:(id)a3 withAcceptableResources:(id)a4;
- (int)prepare;
- (int)process;
- (int)publish;
- (int)removeDownloadRequestIDForAsset:(id)a3;
- (unint64_t)count;
- (void)addDownloadRequestID:(int)a3 forAsset:(id)a4;
- (void)addPhotosAsset:(id)a3 withPreviousStatus:(unint64_t)a4 attempts:(unint64_t)a5 andAttemptDate:(id)a6;
- (void)cancelRemainingDownloadsWithStatus:(int)a3;
- (void)processAssetEntry:(id)a3 resource:(id)a4 resourceURL:(id)a5;
@end

@implementation VCPMADOCRAssetBatch

- (VCPMADOCRAssetBatch)initWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)VCPMADOCRAssetBatch;
  v11 = [(VCPMADOCRAssetBatch *)&v27 init];
  if (v11)
  {
    uint64_t v12 = +[NSMutableArray array];
    assetEntries = v11->_assetEntries;
    v11->_assetEntries = (NSMutableArray *)v12;

    objc_storeStrong((id *)&v11->_analysisDatabase, a3);
    v11->_allowDownload = a4;
    id v14 = objc_retainBlock(v10);
    id cancelBlock = v11->_cancelBlock;
    v11->_id cancelBlock = v14;

    dispatch_group_t v16 = dispatch_group_create();
    downloadGroup = v11->_downloadGroup;
    v11->_downloadGroup = (OS_dispatch_group *)v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.mediaanalysisd.ocr.download", 0);
    downloadStateQueue = v11->_downloadStateQueue;
    v11->_downloadStateQueue = (OS_dispatch_queue *)v18;

    uint64_t v20 = +[NSMutableDictionary dictionary];
    downloadRequestIDs = v11->_downloadRequestIDs;
    v11->_downloadRequestIDs = (NSMutableDictionary *)v20;

    dispatch_group_t v22 = dispatch_group_create();
    computeGroup = v11->_computeGroup;
    v11->_computeGroup = (OS_dispatch_group *)v22;

    dispatch_queue_t v24 = dispatch_queue_create("com.apple.mediaanalysisd.ocr.compute", 0);
    computeQueue = v11->_computeQueue;
    v11->_computeQueue = (OS_dispatch_queue *)v24;
  }
  return v11;
}

+ (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [objc_alloc((Class)a1) initWithAnalysisDatabase:v8 allowDownload:v6 cancelBlock:v9];

  return v10;
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
  id v9 = self->_assetEntries;
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
        id v14 = [v13 localIdentifier];
        v15 = [v8 localIdentifier];
        unsigned int v16 = [v14 isEqualToString:v15];

        if (v16)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            dispatch_queue_t v18 = VCPLogInstance();
            os_log_type_t v19 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v18, v19))
            {
              uint64_t v20 = [v8 localIdentifier];
              *(_DWORD *)buf = 138412290;
              v29 = v20;
              _os_log_impl((void *)&_mh_execute_header, v18, v19, "[OCR][%@] Batch already contains asset; ignoring",
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
  id v9 = +[VCPMADOCRAssetEntry entryWithAsset:v8 previousStatus:a4 previousAttempts:a5 andLastAttemptDate:v23];
  [(NSMutableArray *)assetEntries addObject:v9];
LABEL_14:
}

- (int)prepare
{
  v4 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v4);

  v5 = VCPSignPostLog();
  BOOL v6 = v5;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADOCRAssetEntry_Prepare", (const char *)&unk_1001F3BD3, buf, 2u);
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
      v37 = v2;
      _os_log_impl((void *)&_mh_execute_header, oslog, v7, "[OCR] Preparing %d assets (QoS: %@)", buf, 0x12u);
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
      uint64_t v12 = 0;
      v13 = v2;
      do
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(osloga);
        }
        id v14 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v12);
        analysisDatabase = self->_analysisDatabase;
        unsigned int v16 = (char *)[v14 previousAttempts];
        v17 = [v14 asset];
        dispatch_queue_t v18 = +[NSDate now];
        id v19 = (id)[(VCPDatabaseWriter *)analysisDatabase setAttempts:v16 + 1 asset:v17 taskID:10 status:1 lastAttemptDate:v18];

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
        uint64_t v12 = (char *)v12 + 1;
        v13 = v2;
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
    long long v25 = VCPSignPostLog();
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
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, p_super, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADOCRAssetEntry_Prepare", (const char *)&unk_1001F3BD3, buf, 2u);
      }
      LODWORD(v2) = 0;
    }
LABEL_29:

    return (int)v2;
  }
  return result;
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
    os_log_type_t v7 = [v5 photoLibrary];
    unsigned int v6 = objc_msgSend(v7, "vcp_isSyndicationLibrary") ^ 1;
  }
  id v31 = +[NSMutableArray array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = v30;
  qos_class_t v9 = 0;
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
        v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([v13 type] == (id)1)
        {
          id v14 = v13;

          qos_class_t v9 = v14;
        }
        if (objc_msgSend(v13, "vcp_isPhoto"))
        {
          if ([v13 type] != (id)13 && objc_msgSend(v13, "type") != (id)8)
          {
            v15 = objc_msgSend(v13, "vcp_uniformTypeIdentifier");
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

  dispatch_queue_t v18 = +[PHAssetResource vcp_descendingSizeComparator];
  [v31 sortUsingComparator:v18];

  if (v9) {
    unsigned int v19 = v6;
  }
  else {
    unsigned int v19 = 0;
  }
  if (v19 == 1)
  {
    BOOL v20 = objc_msgSend(v9, "vcp_uniformTypeIdentifier");
    unsigned int v21 = [v20 conformsToType:UTTypePNG];

    if (v21) {
      [v31 addObject:v9];
    }
  }
  if (![v31 count])
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      dispatch_group_t v22 = VCPLogInstance();
      os_log_type_t v23 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v22, v23))
      {
        int v24 = [v5 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v37 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "[OCR][%@] No viable resources; allowing thumbnail",
          buf,
          0xCu);
      }
    }
    long long v25 = objc_msgSend(v8, "vcp_thumbnailResource");
    if (v25)
    {
      [v31 addObject:v25];
    }
    else if ((int)MediaAnalysisLogLevel() >= 4)
    {
      long long v26 = VCPLogInstance();
      os_log_type_t v27 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v26, v27))
      {
        v28 = [v5 localIdentifier];
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
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[OCR][%@] No medium image derivative available; allowing other high-res resources",
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
      v105 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[OCR][%@] Processing asset", buf, 0xCu);
    }
  }
  v15 = +[VCPWatchdog sharedWatchdog];
  [v15 pet];

  id cancelBlock = (unsigned int (**)(void))self->_cancelBlock;
  if (!cancelBlock || !cancelBlock[2]())
  {
    if ([v8 isAnalysisCompleteFromComputeSync])
    {
      if ((int)MediaAnalysisLogLevel() < 6) {
        goto LABEL_89;
      }
      unsigned int v21 = VCPLogInstance();
      os_log_type_t v22 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v21, v22))
      {
        os_log_type_t v23 = [v8 asset];
        int v24 = [v23 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v105 = v24;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "[OCR][Process][%@] Analysis already complete from compute sync ingestion; skipping",
          buf,
          0xCu);
      }
LABEL_88:

      goto LABEL_89;
    }
    long long v25 = VCPSignPostLog();
    os_signpost_id_t v26 = os_signpost_id_generate(v25);

    os_log_type_t v27 = VCPSignPostLog();
    v28 = v27;
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "VNImageRequestHandler_init", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    unsigned int v21 = [objc_alloc((Class)VNImageRequestHandler) initWithURL:v10 options:&__NSDictionary0__struct];
    long long v29 = VCPSignPostLog();
    id v30 = v29;
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_END, v26, "VNImageRequestHandler_init", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    v100 = +[NSMutableArray array];
    v99 = +[VNRecognizeDocumentsRequest mad_defaultRequest];
    if (VCPPhotosMRCCachingEnabled(objc_msgSend(v100, "addObject:")))
    {
      id v31 = +[VNDetectBarcodesRequest mad_defaultRequest];
      if (!v31)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v64 = VCPLogInstance();
          os_log_type_t v65 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v64, v65))
          {
            v66 = [v8 asset];
            v67 = [v66 localIdentifier];
            v68 = [0 description];
            *(_DWORD *)buf = 138412546;
            v105 = v67;
            __int16 v106 = 2112;
            id v107 = v68;
            _os_log_impl((void *)&_mh_execute_header, v64, v65, "[OCR][%@] Failed to configure VNDetectBarcodesRequest (%@)", buf, 0x16u);
          }
        }
        [v8 setStatus:4294967278];
        id v31 = 0;
        id v39 = 0;
        goto LABEL_87;
      }
      [v100 addObject:v31];
    }
    else
    {
      id v31 = 0;
    }
    long long v32 = [v8 asset];
    id v33 = objc_msgSend(v32, "vcp_ocrMajorDimensionForResource:", v9);

    if (v33)
    {
      [v99 setMaximumProcessingDimensionOnTheLongSide:v33];
      [v31 setMaximumProcessingDimensionOnTheLongSide:v33];
    }
    long long v34 = VCPSignPostLog();
    os_signpost_id_t v35 = os_signpost_id_generate(v34);

    __int16 v36 = VCPSignPostLog();
    v37 = v36;
    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_BEGIN, v35, "VNImageRequestHandler_performRequests", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    id v103 = 0;
    unsigned __int8 v38 = [v21 performRequests:v100 error:&v103];
    id v39 = v103;
    v40 = VCPSignPostLog();
    v41 = v40;
    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_INTERVAL_END, v35, "VNImageRequestHandler_performRequests", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if ((v38 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v60 = VCPLogInstance();
        os_log_type_t v61 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v60, v61))
        {
          v62 = [v8 asset];
          v63 = [v62 localIdentifier];
          *(_DWORD *)buf = 138412546;
          v105 = v63;
          __int16 v106 = 2112;
          id v107 = v39;
          _os_log_impl((void *)&_mh_execute_header, v60, v61, "[OCR][%@] Processing failed (%@)", buf, 0x16u);
        }
      }
      [v8 setStatus:4294967278];
      goto LABEL_87;
    }
    v42 = [v99 results];
    v98 = [v42 firstObject];

    if (!v98)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v69 = VCPLogInstance();
        os_log_type_t v70 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v69, v70))
        {
          v71 = [v8 asset];
          v72 = [v71 localIdentifier];
          *(_DWORD *)buf = 138412290;
          v105 = v72;
          _os_log_impl((void *)&_mh_execute_header, v69, v70, "[OCR][%@] Processing produced no results", buf, 0xCu);
        }
      }
      [v8 setStatus:4294967278];
      goto LABEL_86;
    }
    [v8 setVersion:8];
    v43 = [v98 getTranscript];
    BOOL v44 = [v43 length] == 0;

    if (v44)
    {
      uint64_t v55 = MediaAnalysisLogLevel();
      if ((int)v55 >= 6)
      {
        v73 = VCPLogInstance();
        os_log_type_t v74 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v73, v74))
        {
          v75 = [v8 asset];
          v76 = [v75 localIdentifier];
          *(_DWORD *)buf = 138412290;
          v105 = v76;
          _os_log_impl((void *)&_mh_execute_header, v73, v74, "[OCR][%@] No text recognized; skipping archive/persistence",
            buf,
            0xCu);
        }
      }
    }
    else
    {
      v45 = VCPSignPostLog();
      os_signpost_id_t v46 = os_signpost_id_generate(v45);

      v47 = VCPSignPostLog();
      v48 = v47;
      if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_INTERVAL_BEGIN, v46, "VNDocumentObservation_archive", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      id v102 = v39;
      v49 = +[NSKeyedArchiver archivedDataWithRootObject:v98 requiringSecureCoding:1 error:&v102];
      id v50 = v102;

      id v39 = v50;
      [v8 setOcrData:v49];

      v51 = VCPSignPostLog();
      v52 = v51;
      if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_END, v46, "VNDocumentObservation_archive", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      v53 = [v8 ocrData];
      BOOL v54 = v53 == 0;

      if (v54)
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v56 = VCPLogInstance();
          os_log_type_t v57 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v56, v57))
          {
            v58 = [v8 asset];
            v59 = [v58 localIdentifier];
            *(_DWORD *)buf = 138412290;
            v105 = v59;
            _os_log_impl((void *)&_mh_execute_header, v56, v57, "[OCR][%@] Failed to archive OCR results", buf, 0xCu);
          }
        }
        [v8 setStatus:4294967278];
LABEL_86:

LABEL_87:
        goto LABEL_88;
      }
    }
    if (VCPPhotosMRCCachingEnabled(v55))
    {
      v77 = [v31 results];
      BOOL v78 = [v77 count] == 0;

      if (v78)
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v93 = VCPLogInstance();
          os_log_type_t v94 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v93, v94))
          {
            v95 = [v8 asset];
            v96 = [v95 localIdentifier];
            *(_DWORD *)buf = 138412290;
            v105 = v96;
            _os_log_impl((void *)&_mh_execute_header, v93, v94, "[OCR][%@] No MRC detected; skipping archive/persistence",
              buf,
              0xCu);
          }
        }
      }
      else
      {
        v79 = VCPSignPostLog();
        os_signpost_id_t spid = os_signpost_id_generate(v79);

        v80 = VCPSignPostLog();
        v81 = v80;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v81, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VNBarcodeObservation_archive", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        v82 = [v31 results];
        id v101 = v39;
        v83 = +[NSKeyedArchiver archivedDataWithRootObject:v82 requiringSecureCoding:1 error:&v101];
        id v84 = v101;

        id v39 = v84;
        [v8 setMrcData:v83];

        v85 = VCPSignPostLog();
        v86 = v85;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v86, OS_SIGNPOST_INTERVAL_END, spid, "VNBarcodeObservation_archive", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        v87 = [v8 mrcData];
        BOOL v88 = v87 == 0;

        if (v88)
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v89 = VCPLogInstance();
            os_log_type_t v90 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v89, v90))
            {
              v91 = [v8 asset];
              v92 = [v91 localIdentifier];
              *(_DWORD *)buf = 138412290;
              v105 = v92;
              _os_log_impl((void *)&_mh_execute_header, v89, v90, "[OCR][%@] Failed to archive MRC results", buf, 0xCu);
            }
          }
          [v8 setStatus:4294967278];
        }
      }
    }
    goto LABEL_86;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    long long v17 = VCPLogInstance();
    os_log_type_t v18 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v17, v18))
    {
      long long v19 = [v8 asset];
      BOOL v20 = [v19 localIdentifier];
      *(_DWORD *)buf = 138412290;
      v105 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "[OCR][%@] Processing canceled; skipping asset", buf, 0xCu);
    }
  }
  [v8 setStatus:4294967168];
LABEL_89:
}

- (void)addDownloadRequestID:(int)a3 forAsset:(id)a4
{
  id v6 = a4;
  downloadStateQueue = self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100100F94;
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
  os_log_type_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  downloadStateQueue = self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100101114;
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
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  downloadStateQueue = self->_downloadStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100101304;
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
  v5[2] = sub_10010140C;
  v5[3] = &unk_10021C048;
  v5[4] = self;
  int v6 = a3;
  dispatch_sync(downloadStateQueue, v5);
  dispatch_group_wait((dispatch_group_t)self->_downloadGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (int)process
{
  double v3 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v3);

  id v4 = VCPSignPostLog();
  id v5 = v4;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADOCRAssetEntry_Process", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    int v6 = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      unsigned int v8 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v9 = qos_class_self();
      id v10 = VCPMAQoSDescription(v9);
      *(_DWORD *)buf = 67109378;
      LODWORD(v79[0]) = v8;
      WORD2(v79[0]) = 2112;
      *(void *)((char *)v79 + 6) = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[OCR] Processing %d assets (QoS: %@)", buf, 0x12u);
    }
  }
  uint64_t v11 = +[VCPWatchdog sharedWatchdog];
  [v11 pet];

  if (![(NSMutableArray *)self->_assetEntries count]) {
    goto LABEL_78;
  }
  int v67 = 0;
  unint64_t v12 = 0;
  os_log_type_t type = VCPLogToOSLogType[6];
  os_log_type_t v66 = VCPLogToOSLogType[5];
  os_log_type_t v70 = VCPLogToOSLogType[4];
  do
  {
    int v14 = +[VCPWatchdog sharedWatchdog];
    [v14 pet];

    v15 = [(NSMutableArray *)self->_assetEntries objectAtIndexedSubscript:v12];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      long long v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, type))
      {
        long long v17 = [v15 asset];
        os_log_type_t v18 = [v17 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v79[0] = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, type, "[OCR][%@] Staging asset", buf, 0xCu);
      }
    }
    long long v19 = [v15 asset];
    BOOL v20 = [v19 adjustmentVersion];
    BOOL v21 = v20 == 0;

    if (!v21)
    {
      os_log_type_t v22 = [v15 asset];
      os_log_type_t v23 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v22];

      int v24 = [v15 asset];
      long long v25 = [(VCPMADOCRAssetBatch *)self acceptableResourcesForAsset:v24 withResources:v23];

      os_signpost_id_t v26 = [v15 asset];
      os_log_type_t v27 = [(VCPMADOCRAssetBatch *)self localResourceForAsset:v26 withAcceptableResources:v25];

      if (v27)
      {
        computeGroup = self->_computeGroup;
        computeQueue = self->_computeQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001022B0;
        block[3] = &unk_10021BF68;
        block[4] = self;
        id v76 = v15;
        id v77 = v27;
        id v30 = v27;
        dispatch_group_async(computeGroup, computeQueue, block);

LABEL_17:
LABEL_46:

        goto LABEL_47;
      }
      if (self->_allowDownload)
      {
        long long v34 = [v15 asset];
        objc_msgSend(v34, "vcp_passedOCRGating");
        id v30 = (id)objc_claimAutoreleasedReturnValue();

        if ([v30 BOOLValue])
        {
          v69 = objc_msgSend(v23, "mad_computeSyncResource");
          if (v69)
          {
            os_signpost_id_t v35 = [v15 asset];
            objc_msgSend(v15, "setIsAnalysisCompleteFromComputeSync:", objc_msgSend(v69, "mad_isAnalysisCompleteFromComputeSyncForAsset:taskID:allowDownload:cancel:", v35, 10, 1, self->_cancelBlock));

            if ([v15 isAnalysisCompleteFromComputeSync])
            {
              if ((int)MediaAnalysisLogLevel() < 5)
              {
LABEL_56:

                goto LABEL_17;
              }
              __int16 v36 = VCPLogInstance();
              if (os_log_type_enabled(v36, v66))
              {
                v37 = [v15 asset];
                unsigned __int8 v38 = [v37 localIdentifier];
                *(_DWORD *)buf = 138412290;
                v79[0] = v38;
                _os_log_impl((void *)&_mh_execute_header, v36, v66, "[OCR][%@] Analysis complete with compute sync, skipping media resource download and processing", buf, 0xCu);
              }
LABEL_55:

              goto LABEL_56;
            }
            if ((int)MediaAnalysisLogLevel() >= 5)
            {
              id v39 = VCPLogInstance();
              if (os_log_type_enabled(v39, v66))
              {
                v40 = [v15 asset];
                v41 = [v40 localIdentifier];
                *(_DWORD *)buf = 138412290;
                v79[0] = v41;
                _os_log_impl((void *)&_mh_execute_header, v39, v66, "[OCR][%@] Analysis remains incomplete with compute sync, falling back to media resource download", buf, 0xCu);
              }
            }
          }
          v42 = [v15 asset];
          v43 = [(VCPMADOCRAssetBatch *)self remoteResourceForAsset:v42 withAcceptableResources:v25];

          if (v43)
          {
            dispatch_group_enter((dispatch_group_t)self->_downloadGroup);
            v72[0] = _NSConcreteStackBlock;
            v72[1] = 3221225472;
            v72[2] = sub_100102330;
            v72[3] = &unk_10021E188;
            v72[4] = self;
            id v44 = v15;
            id v73 = v44;
            __int16 v36 = v43;
            os_log_type_t v74 = v36;
            uint64_t v45 = +[PHAssetResourceManager vcp_requestFileURLForAssetResource:v36 taskID:10 completionHandler:v72];
            if (v45)
            {
              os_signpost_id_t v46 = [v44 asset];
              [(VCPMADOCRAssetBatch *)self addDownloadRequestID:v45 forAsset:v46];

              ++v67;
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() >= 4)
              {
                log = VCPLogInstance();
                if (os_log_type_enabled(log, v70))
                {
                  v64 = [v44 asset];
                  id v50 = [v64 localIdentifier];
                  *(_DWORD *)buf = 138412290;
                  v79[0] = v50;
                  _os_log_impl((void *)&_mh_execute_header, log, v70, "[OCR][%@] Failed to initialize resource download", buf, 0xCu);
                }
              }
              [v44 setStatus:4294943494];
              dispatch_group_leave((dispatch_group_t)self->_downloadGroup);
            }

            goto LABEL_55;
          }
        }
        else if (v30)
        {
          [v15 setVersion:0x7FFFLL];
          goto LABEL_17;
        }
      }
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v47 = VCPLogInstance();
        if (os_log_type_enabled(v47, v70))
        {
          v48 = [v15 asset];
          v49 = [v48 localIdentifier];
          *(_DWORD *)buf = 138412290;
          v79[0] = v49;
          _os_log_impl((void *)&_mh_execute_header, v47, v70, "[OCR][%@] No acceptable resource available", buf, 0xCu);
        }
      }
      [v15 setStatus:4294943494];
      goto LABEL_46;
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v31 = VCPLogInstance();
      if (os_log_type_enabled(v31, v70))
      {
        long long v32 = [v15 asset];
        id v33 = [v32 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v79[0] = v33;
        _os_log_impl((void *)&_mh_execute_header, v31, v70, "[OCR][%@] Asset has no adjustment version", buf, 0xCu);
      }
    }
    [v15 setStatus:4294943493];
LABEL_47:

    ++v12;
  }
  while (v12 < (unint64_t)[(NSMutableArray *)self->_assetEntries count]);
  if (v67)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v51 = VCPLogInstance();
      if (os_log_type_enabled(v51, type))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v79[0]) = v67;
        _os_log_impl((void *)&_mh_execute_header, v51, type, "[OCR] Waiting for %d downloads to complete", buf, 8u);
      }
    }
    while (1)
    {
      downloadGroup = self->_downloadGroup;
      dispatch_time_t v53 = dispatch_time(0, 250000000);
      if (!dispatch_group_wait(downloadGroup, v53)) {
        goto LABEL_78;
      }
      id cancelBlock = (unsigned int (**)(void))self->_cancelBlock;
      if (cancelBlock)
      {
        if (cancelBlock[2]()) {
          break;
        }
      }
      [(VCPMADOCRAssetBatch *)self downloadInactiveTimeInterval];
      if (v55 > 60.0)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v56 = VCPLogInstance();
          if (os_log_type_enabled(v56, v66))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v56, v66, "[OCR] Download inactivity timeout; cancelling downloads",
              buf,
              2u);
          }
          uint64_t v57 = 4294943494;
          goto LABEL_74;
        }
        uint64_t v57 = 4294943494;
LABEL_77:
        [(VCPMADOCRAssetBatch *)self cancelRemainingDownloadsWithStatus:v57];
        goto LABEL_78;
      }
    }
    if ((int)MediaAnalysisLogLevel() < 5)
    {
      uint64_t v57 = 4294967168;
    }
    else
    {
      v56 = VCPLogInstance();
      if (os_log_type_enabled(v56, v66))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v56, v66, "[OCR] Processing cancelled; cancelling downloads", buf, 2u);
      }
      uint64_t v57 = 4294967168;
LABEL_74:
    }
    goto LABEL_77;
  }
LABEL_78:
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v58 = VCPLogInstance();
    os_log_type_t v59 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v58, v59))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v58, v59, "[OCR] Waiting for compute to complete", buf, 2u);
    }
  }
  dispatch_group_wait((dispatch_group_t)self->_computeGroup, 0xFFFFFFFFFFFFFFFFLL);
  v60 = VCPSignPostLog();
  os_log_type_t v61 = v60;
  if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v60))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v61, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADOCRAssetEntry_Process", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  v62 = (uint64_t (**)(void))self->_cancelBlock;
  if (v62 && (v62[2]() & 1) != 0) {
    return -128;
  }
  else {
    return 0;
  }
}

- (int)publish
{
  v2 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v2);

  double v3 = VCPSignPostLog();
  id v4 = v3;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADOCRAssetEntry_Publish", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      unsigned int v7 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v8 = qos_class_self();
      qos_class_t v9 = VCPMAQoSDescription(v8);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)os_log_type_t v66 = v7;
      *(_WORD *)&v66[4] = 2112;
      *(void *)&v66[6] = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[OCR] Persisting %d assets (QoS: %@)", buf, 0x12u);
    }
  }
  if (![(NSMutableArray *)self->_assetEntries count]) {
    return 0;
  }
  p_cache = VCPRequestRebuildPersonsTask.cache;
  uint64_t v11 = +[MADStateHandler sharedStateHandler];
  objc_msgSend(v11, "addBreadcrumb:", @"[OCR] Persisting %d assets to Photos", -[NSMutableArray count](self->_assetEntries, "count"));

  unint64_t v12 = +[VCPWatchdog sharedWatchdog];
  [v12 pet];

  uint64_t v13 = +[MADStateHandler sharedStateHandler];
  [v13 enterKnownTimeoutRisk:1];

  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_100102F24;
  v63[3] = &unk_100219FC8;
  v63[4] = self;
  v51 = objc_retainBlock(v63);
  uint64_t v14 = [(NSMutableArray *)self->_assetEntries firstObject];
  v15 = [(id)v14 asset];
  v52 = [v15 photoLibrary];

  id cancelBlock = self->_cancelBlock;
  id v62 = 0;
  LOBYTE(v14) = objc_msgSend(v52, "mad_performChangesAndWait:cancelBlock:extendTimeoutBlock:error:", v51, cancelBlock, &stru_10021E1A8, &v62);
  id v54 = v62;
  long long v17 = +[MADStateHandler sharedStateHandler];
  [v17 exitKnownTimeoutRisk];

  os_log_type_t v18 = +[MADStateHandler sharedStateHandler];
  objc_msgSend(v18, "addBreadcrumb:", @"[OCR] Finished persisting %d assets to Photos", -[NSMutableArray count](self->_assetEntries, "count"));

  if ((v14 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v45 = VCPLogInstance();
      os_log_type_t v46 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v45, v46))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)os_log_type_t v66 = v54;
        _os_log_impl((void *)&_mh_execute_header, v45, v46, "[OCR] Failed to persist OCR results to Photos (%@)", buf, 0xCu);
      }
    }
    int v44 = [v54 code];
    goto LABEL_60;
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obj = self->_assetEntries;
  id v19 = [(NSMutableArray *)obj countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (!v19) {
    goto LABEL_62;
  }
  uint64_t v56 = *(void *)v59;
  while (2)
  {
    BOOL v20 = 0;
    BOOL v21 = p_cache;
    do
    {
      if (*(void *)v59 != v56) {
        objc_enumerationMutation(obj);
      }
      os_log_type_t v22 = *(void **)(*((void *)&v58 + 1) + 8 * (void)v20);
      if (![v22 status])
      {
        analysisDatabase = self->_analysisDatabase;
        long long v32 = [v22 asset];
        id v33 = [v32 localIdentifier];
        id v30 = (id)[(VCPDatabaseWriter *)analysisDatabase removeProcessingStatusForLocalIdentifier:v33 andTaskID:10];

        if (v30 != -108)
        {
          BOOL v34 = v30 == -36 || v30 == -23;
          p_cache = (void **)v30;
          if (!v34) {
            goto LABEL_43;
          }
          goto LABEL_45;
        }
LABEL_44:
        p_cache = (void **)v30;
        goto LABEL_45;
      }
      if ([v22 status] == -128)
      {
        id v24 = [v22 previousAttempts];
        long long v25 = self->_analysisDatabase;
        if (v24)
        {
          id v26 = [v22 previousAttempts];
          os_log_type_t v27 = [v22 asset];
          id v28 = [v22 previousStatus];
          long long v29 = [v22 lastAttemptDate];
          id v30 = (id)[(VCPDatabaseWriter *)v25 setAttempts:v26 asset:v27 taskID:10 status:v28 lastAttemptDate:v29];
        }
        else
        {
          os_log_type_t v27 = [v22 asset];
          long long v29 = [v27 localIdentifier];
          id v30 = (id)[(VCPDatabaseWriter *)v25 removeProcessingStatusForLocalIdentifier:v29 andTaskID:10];
        }

        if (v30 != -108 && v30 != -36)
        {
          p_cache = (void **)v30;
          if (v30 != -23) {
LABEL_43:
          }
            p_cache = v21;
LABEL_45:
          int v43 = 0;
          if (v30 != -108 && v30 != -36 && v30 != -23) {
            goto LABEL_48;
          }
          goto LABEL_49;
        }
        goto LABEL_44;
      }
      if ([v22 status] == -23802)
      {
        uint64_t v35 = 2;
      }
      else if ([v22 status] == -23808)
      {
        uint64_t v35 = 7;
      }
      else
      {
        uint64_t v35 = 3;
      }
      __int16 v36 = [v22 asset];
      v37 = [v22 currentAttemptDate];
      unsigned __int8 v38 = objc_msgSend(v36, "mad_nextAttemptDateForStatus:currentAttemptDate:attemptCount:", v35, v37, (char *)objc_msgSend(v22, "previousAttempts") + 1);

      id v39 = self->_analysisDatabase;
      v40 = [v22 asset];
      v41 = [v40 localIdentifier];
      id v42 = (id)[(VCPDatabaseWriter *)v39 updateProcessingStatus:v35 andNextAttemptDate:v38 forLocalIdentifier:v41 andTaskID:10];

      if (v42 == -108 || v42 == -36)
      {
        p_cache = (void **)v42;
      }
      else
      {
        p_cache = (void **)v42;
        if (v42 != -23) {
          p_cache = v21;
        }
      }

      int v43 = 0;
      if (v42 != -108 && v42 != -36 && v42 != -23) {
LABEL_48:
      }
        int v43 = 1;
LABEL_49:
      if (!v43)
      {

        int v44 = (int)p_cache;
        goto LABEL_60;
      }
      BOOL v20 = (char *)v20 + 1;
      BOOL v21 = p_cache;
    }
    while (v19 != v20);
    id v19 = [(NSMutableArray *)obj countByEnumeratingWithState:&v58 objects:v64 count:16];
    if (v19) {
      continue;
    }
    break;
  }
LABEL_62:

  unsigned int v48 = [(VCPDatabaseWriter *)self->_analysisDatabase commit];
  if (v48 == -108 || v48 == -36)
  {
    int v44 = v48;
  }
  else
  {
    int v44 = v48;
    if (v48 != -23) {
      int v44 = (int)p_cache;
    }
  }
  if (v48 != -108 && v48 != -36 && v48 != -23)
  {
    v49 = VCPSignPostLog();
    id v50 = v49;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v50, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADOCRAssetEntry_Publish", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    int v44 = 0;
  }
LABEL_60:

  return v44;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeQueue, 0);
  objc_storeStrong((id *)&self->_computeGroup, 0);
  objc_storeStrong((id *)&self->_downloadStateChange, 0);
  objc_storeStrong((id *)&self->_downloadRequestIDs, 0);
  objc_storeStrong((id *)&self->_downloadStateQueue, 0);
  objc_storeStrong((id *)&self->_downloadGroup, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_analysisDatabase, 0);
  objc_storeStrong((id *)&self->_assetEntries, 0);
}

@end