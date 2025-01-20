@interface VCPMADPECAssetBatch
+ (id)batchWithServicePool:(id)a3 analysisDatabase:(id)a4 cancelBlock:(id)a5;
- (VCPMADPECAssetBatch)initWithServicePool:(id)a3 analysisDatabase:(id)a4 cancelBlock:(id)a5;
- (id)resultFromVISearchResults:(id)a3;
- (int)prepare;
- (int)process;
- (int)publish;
- (unint64_t)count;
- (unint64_t)processAssetBatchWithVIService:(id)a3;
- (void)addPhotosAsset:(id)a3 withPreviousStatus:(unint64_t)a4 attempts:(unint64_t)a5 andAttemptDate:(id)a6;
@end

@implementation VCPMADPECAssetBatch

- (id)resultFromVISearchResults:(id)a3
{
  id v31 = a3;
  id v39 = objc_alloc_init((Class)NSMutableDictionary);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v31;
  id v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16, v31);
  if (v34)
  {
    uint64_t v33 = *(void *)v45;
    os_log_type_t type = VCPLogToOSLogType[7];
    os_log_type_t v42 = VCPLogToOSLogType[3];
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v45 != v33) {
          objc_enumerationMutation(obj);
        }
        v38 = [*(id *)(*((void *)&v44 + 1) + 8 * i) regionOfInterestResults];
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v3 = VCPLogInstance();
          if (os_log_type_enabled(v3, type))
          {
            unsigned int v4 = [v38 count];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v49 = v4;
            _os_log_impl((void *)&_mh_execute_header, v3, type, "[PEC] %d ROIs", buf, 8u);
          }
        }
        unint64_t v40 = 0;
        while (2)
        {
          if (v40 < (unint64_t)[v38 count])
          {
            v5 = [v38 objectAtIndexedSubscript:v40];
            v6 = [v5 resultItems];

            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v7 = VCPLogInstance();
              if (os_log_type_enabled(v7, type))
              {
                unsigned int v8 = [v6 count];
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v49 = v8;
                *(_WORD *)&v49[4] = 1024;
                *(_DWORD *)&v49[6] = v40;
                _os_log_impl((void *)&_mh_execute_header, v7, type, "[PEC] %d items in ROI-%d", buf, 0xEu);
              }
            }
            unint64_t v9 = 0;
LABEL_17:
            if (v9 >= (unint64_t)[v6 count])
            {

              ++v40;
              continue;
            }
            v10 = [v6 objectAtIndexedSubscript:v9];
            v11 = [v10 searchableKnowledgeObject];

            if (!v11)
            {
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                v13 = VCPLogInstance();
                if (os_log_type_enabled(v13, v42))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v49 = v40;
                  *(_WORD *)&v49[4] = 1024;
                  *(_DWORD *)&v49[6] = v9;
                  v15 = v13;
                  os_log_type_t v16 = v42;
                  v17 = "[PEC] ROI-%d item-%d: Empty CSUSearchableKnowledgeObject";
                  uint32_t v18 = 14;
LABEL_26:
                  _os_log_impl((void *)&_mh_execute_header, v15, v16, v17, buf, v18);
                }
LABEL_35:
              }
LABEL_36:

              ++v9;
              goto LABEL_17;
            }
            id v12 = +[PHSceneClassification mad_typeFromCSUIdType:](PHSceneClassification, "mad_typeFromCSUIdType:", [v11 idType]);
            if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                v13 = VCPLogInstance();
                if (os_log_type_enabled(v13, v42))
                {
                  unsigned int v14 = [v11 idType];
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v49 = v14;
                  v15 = v13;
                  os_log_type_t v16 = v42;
                  v17 = "[PEC] Unexpected CSUSearchableKnowledgeObjectIdType %d";
                  uint32_t v18 = 8;
                  goto LABEL_26;
                }
                goto LABEL_35;
              }
              goto LABEL_36;
            }
            entityStore = self->_entityStore;
            id v43 = 0;
            [(CSUSearchableKnowledgeObjectStore *)entityStore storeEntity:v11 uniqueIdWriteback:0 error:&v43];
            v13 = v43;
            if (v13)
            {
              if ((int)MediaAnalysisLogLevel() < 3) {
                goto LABEL_35;
              }
              v20 = VCPLogInstance();
              if (os_log_type_enabled(v20, v42))
              {
                id v21 = [v11 qid];
                v22 = [v11 localizedLabelDictionary];
                v23 = [v22 allValues];
                *(_DWORD *)buf = 134218498;
                *(void *)v49 = v21;
                *(_WORD *)&v49[8] = 2112;
                v50 = v23;
                __int16 v51 = 2112;
                v52 = v13;
                _os_log_impl((void *)&_mh_execute_header, v20, v42, "[PEC] Failed to store entity (%llu, %@) with error (%@)", buf, 0x20u);
              }
              goto LABEL_34;
            }
            id v24 = objc_alloc((Class)PHSceneClassification);
            id v25 = [v11 qid];
            [v11 confidenceValue];
            v20 = objc_msgSend(v24, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", v25, v12);
            if (v20)
            {
              v26 = +[NSNumber numberWithInteger:v12];
              v27 = [v39 objectForKeyedSubscript:v26];
              v28 = +[NSMutableArray arrayWithArray:v27];

              [v28 addObject:v20];
              v29 = +[NSNumber numberWithInteger:v12];
              [v39 setObject:v28 forKeyedSubscript:v29];

              goto LABEL_33;
            }
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v28 = VCPLogInstance();
              if (os_log_type_enabled(v28, v42))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v28, v42, "[PEC] failed to create the sceneClassification object", buf, 2u);
              }
LABEL_33:
            }
LABEL_34:

            goto LABEL_35;
          }
          break;
        }
      }
      id v34 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v34);
  }

  return v39;
}

- (VCPMADPECAssetBatch)initWithServicePool:(id)a3 analysisDatabase:(id)a4 cancelBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)VCPMADPECAssetBatch;
  id v12 = [(VCPMADPECAssetBatch *)&v24 init];
  if (v12)
  {
    uint64_t v13 = +[NSMutableArray array];
    assetEntries = v12->_assetEntries;
    v12->_assetEntries = (NSMutableArray *)v13;

    v15 = v12->_assetEntries;
    if (v15)
    {
      objc_storeStrong((id *)&v12->_servicePool, a3);
      objc_storeStrong((id *)&v12->_analysisDatabase, a4);
      id v16 = objc_retainBlock(v11);
      id cancelBlock = v12->_cancelBlock;
      v12->_id cancelBlock = v16;

      dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
      processSemaphore = v12->_processSemaphore;
      v12->_processSemaphore = (OS_dispatch_semaphore *)v18;

      v15 = v12->_processSemaphore;
      if (v15)
      {
        dispatch_group_t v20 = dispatch_group_create();
        processGroup = v12->_processGroup;
        v12->_processGroup = (OS_dispatch_group *)v20;

        if (v12->_processGroup) {
          v15 = v12;
        }
        else {
          v15 = 0;
        }
      }
    }
  }
  else
  {
    v15 = 0;
  }
  v22 = v15;

  return v22;
}

+ (id)batchWithServicePool:(id)a3 analysisDatabase:(id)a4 cancelBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)a1) initWithServicePool:v8 analysisDatabase:v9 cancelBlock:v10];

  return v11;
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
        uint64_t v13 = [*(id *)(*((void *)&v24 + 1) + 8 * i) asset];
        unsigned int v14 = [v13 localIdentifier];
        v15 = [v8 localIdentifier];
        unsigned int v16 = [v14 isEqualToString:v15];

        if (v16)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            dispatch_semaphore_t v18 = VCPLogInstance();
            os_log_type_t v19 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v18, v19))
            {
              dispatch_group_t v20 = [v8 localIdentifier];
              *(_DWORD *)buf = 138412290;
              v29 = v20;
              _os_log_impl((void *)&_mh_execute_header, v18, v19, "[PEC][%@] Batch already contains asset; ignoring",
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
  id v9 = +[VCPMADPECAssetEntry entryWithAsset:v8 previousStatus:a4 previousAttempts:a5 andLastAttemptDate:v23];
  [(NSMutableArray *)assetEntries addObject:v9];
LABEL_14:
}

- (int)prepare
{
  unsigned int v4 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v4);

  v5 = VCPSignPostLog();
  v6 = v5;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADPECAssetEntry_Prepare", (const char *)&unk_1001F3BD3, buf, 2u);
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
      _os_log_impl((void *)&_mh_execute_header, oslog, v7, "[PEC] Preparing %d assets (QoS: %@)", buf, 0x12u);
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
      uint64_t v13 = v2;
      do
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(osloga);
        }
        unsigned int v14 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v12);
        analysisDatabase = self->_analysisDatabase;
        unsigned int v16 = (char *)[v14 previousAttempts];
        v17 = [v14 asset];
        dispatch_semaphore_t v18 = +[NSDate now];
        id v19 = (id)[(VCPDatabaseWriter *)analysisDatabase setAttempts:v16 + 1 asset:v17 taskID:16 status:1 lastAttemptDate:v18];

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
        uint64_t v13 = v2;
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
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, p_super, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADPECAssetEntry_Prepare", (const char *)&unk_1001F3BD3, buf, 2u);
      }
      LODWORD(v2) = 0;
    }
LABEL_29:

    return (int)v2;
  }
  return result;
}

- (unint64_t)processAssetBatchWithVIService:(id)a3
{
  id v124 = a3;
  if ((int)MediaAnalysisLogLevel() <= 5)
  {
    os_log_type_t type = VCPLogToOSLogType[6];
  }
  else
  {
    unsigned int v4 = VCPLogInstance();
    os_log_type_t type = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v4, type))
    {
      unsigned int v5 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v6 = qos_class_self();
      os_log_type_t v7 = VCPMAQoSDescription(v6);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, type, "[PEC] Processing %d assets (QoS: %@)", buf, 0x12u);
    }
  }
  unint64_t v8 = 0;
  os_log_type_t v122 = VCPLogToOSLogType[5];
  os_log_type_t v125 = VCPLogToOSLogType[4];
  uint64_t v118 = VIQueryContextLocationKey;
  uint64_t v117 = VIQueryContextImageTypeKey;
  os_log_type_t v123 = VCPLogToOSLogType[7];
  while (v8 < (unint64_t)[(NSMutableArray *)self->_assetEntries count])
  {
    id v10 = +[VCPWatchdog sharedWatchdog];
    [v10 pet];

    id cancelBlock = (unsigned int (**)(void))self->_cancelBlock;
    if (!cancelBlock || !cancelBlock[2]())
    {
      id v12 = [(NSMutableArray *)self->_assetEntries objectAtIndexedSubscript:v8];
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        unsigned int v14 = VCPLogInstance();
        if (os_log_type_enabled(v14, type))
        {
          v15 = [v12 asset];
          unsigned int v16 = [v15 localIdentifier];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, type, "[PEC][%@] Processing asset", buf, 0xCu);
        }
      }
      v17 = [v12 asset];
      dispatch_semaphore_t v18 = [v17 adjustmentVersion];
      BOOL v19 = v18 == 0;

      if (v19)
      {
        if ((int)MediaAnalysisLogLevel() < 4)
        {
          uint64_t v25 = 4294943493;
        }
        else
        {
          v22 = VCPLogInstance();
          if (os_log_type_enabled(v22, v125))
          {
            long long v26 = [v12 asset];
            long long v27 = [v26 localIdentifier];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v27;
            _os_log_impl((void *)&_mh_execute_header, v22, v125, "[PEC][%@] Asset has no adjustment version", buf, 0xCu);
          }
          uint64_t v25 = 4294943493;
LABEL_28:
        }
      }
      else
      {
        BOOL v20 = [v12 asset];
        unsigned int v21 = objc_msgSend(v20, "vcp_needsVisualSearchProcessing");

        if (!v21)
        {
          v28 = [v12 asset];
          v128 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v28];

          long long v29 = objc_msgSend(v128, "vcp_thumbnailResource");
          v126 = v29;
          if (v29)
          {
            if ([v29 isLocallyAvailable])
            {
              long long v30 = VCPSignPostLog();
              os_signpost_id_t v31 = os_signpost_id_generate(v30);

              long long v32 = VCPSignPostLog();
              uint64_t v33 = v32;
              if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "VCPMADPECAssetBatch_Decode", (const char *)&unk_1001F3BD3, buf, 2u);
              }

              id v34 = +[VCPImageManager sharedImageManager];
              unsigned int v35 = [v126 privateFileURL];
              id v154 = [v34 pixelBufferWithFormat:875704438 fromImageURL:v35 flushCache:0];

              __int16 v36 = VCPSignPostLog();
              v37 = v36;
              if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_END, v31, "VCPMADPECAssetBatch_Decode", (const char *)&unk_1001F3BD3, buf, 2u);
              }

              if (v154)
              {
                v38 = [v12 asset];
                v121 = +[VCPMADServiceImageAsset assetWithPhotosAsset:v38 clientBundleID:0 clientTeamID:0];

                if (v121)
                {
                  v114 = objc_msgSend(v121, "vcp_annotationWithTypes:", 7);
                  if (v114)
                  {
                    v116 = +[NSMutableDictionary dictionary];
                    id v39 = [v121 location];
                    BOOL v40 = v39 == 0;

                    if (!v40)
                    {
                      v41 = [v121 location];
                      [v116 setObject:v41 forKeyedSubscript:v118];
                    }
                    if ([v121 isScreenshot]) {
                      [v116 setObject:&off_10022F148 forKeyedSubscript:v117];
                    }
                    id v153 = 0;
                    v113 = +[VIQueryContext contextWithDictionary:v116 error:&v153];
                    id v112 = v153;
                    if (v112 || !v113)
                    {
                      if ((int)MediaAnalysisLogLevel() >= 4)
                      {
                        v69 = VCPLogInstance();
                        if (os_log_type_enabled(v69, v125))
                        {
                          v70 = [v12 asset];
                          v71 = [v70 localIdentifier];
                          *(_DWORD *)buf = 138412546;
                          *(void *)&uint8_t buf[4] = v71;
                          *(_WORD *)&buf[12] = 2112;
                          *(void *)&buf[14] = v112;
                          _os_log_impl((void *)&_mh_execute_header, v69, v125, "[PEC][%@] Failed to create query context (%@)", buf, 0x16u);
                        }
                      }
                      [v12 setStatus:4294967278];
                      int v13 = 6;
                    }
                    else
                    {
                      v111 = +[VIVisualQuery queryWithPixelBuffer:orientation:normalizedRegionOfInterest:annotation:queryContext:](VIVisualQuery, "queryWithPixelBuffer:orientation:normalizedRegionOfInterest:annotation:queryContext:", v154, 1, v114, v113, 0.0, 0.0, 1.0, 1.0);
                      if (v111)
                      {
                        os_log_type_t v42 = [v12 asset];
                        v110 = [v42 visualSearchProperties];

                        id v43 = [v110 visualSearchData];
                        LODWORD(v42) = v43 == 0;

                        if (v42)
                        {
                          if ((int)MediaAnalysisLogLevel() >= 7)
                          {
                            v75 = VCPLogInstance();
                            if (os_log_type_enabled(v75, v123))
                            {
                              v76 = [v12 asset];
                              v77 = [v76 localIdentifier];
                              *(_DWORD *)buf = 138412290;
                              *(void *)&uint8_t buf[4] = v77;
                              _os_log_impl((void *)&_mh_execute_header, v75, v123, "[PEC][%@] Asset visual search data is empty", buf, 0xCu);
                            }
                          }
                          -[NSObject setVersion:](v12, "setVersion:", 5, v110);
                          int v13 = 6;
                        }
                        else
                        {
                          *(void *)buf = 0;
                          *(void *)&buf[8] = buf;
                          *(void *)&buf[16] = 0x3032000000;
                          v164 = sub_1000E4AE0;
                          v165 = sub_1000E4AF0;
                          id v166 = 0;
                          uint64_t v147 = 0;
                          v148 = &v147;
                          uint64_t v149 = 0x3032000000;
                          v150 = sub_1000E4AE0;
                          v151 = sub_1000E4AF0;
                          id v152 = 0;
                          long long v44 = VCPSignPostLog();
                          os_signpost_id_t v45 = os_signpost_id_generate(v44);

                          long long v46 = VCPSignPostLog();
                          long long v47 = v46;
                          if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
                          {
                            LOWORD(v158) = 0;
                            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_BEGIN, v45, "VIService_PECParsing", (const char *)&unk_1001F3BD3, (uint8_t *)&v158, 2u);
                          }

                          dispatch_group_enter((dispatch_group_t)self->_processGroup);
                          v48 = [v124 object];
                          v49 = [v110 visualSearchData];
                          v140[0] = _NSConcreteStackBlock;
                          v140[1] = 3221225472;
                          v140[2] = sub_1000E4AF8;
                          v140[3] = &unk_10021D408;
                          os_signpost_id_t v145 = v45;
                          uint64_t v146 = 0;
                          v50 = v12;
                          v142 = self;
                          v143 = buf;
                          v144 = &v147;
                          v120 = v50;
                          v141 = v50;
                          id v51 = [v48 getEncryptedSearchDomainsWithVisualQuery:v111 cachedResults:v49 completion:v140];

                          dispatch_semaphore_wait((dispatch_semaphore_t)self->_processSemaphore, 0xFFFFFFFFFFFFFFFFLL);
                          if ([v120 status])
                          {
                            if ((int)MediaAnalysisLogLevel() >= 4)
                            {
                              v52 = VCPLogInstance();
                              if (os_log_type_enabled(v52, v125))
                              {
                                v53 = [v120 asset];
                                v54 = [v53 localIdentifier];
                                LODWORD(v158) = 138412290;
                                *(void *)((char *)&v158 + 4) = v54;
                                _os_log_impl((void *)&_mh_execute_header, v52, v125, "[PEC][%@] Failed with parseWithVisualQuery", (uint8_t *)&v158, 0xCu);

                                int v13 = 6;
                                goto LABEL_136;
                              }
LABEL_129:
                              int v13 = 6;
                              goto LABEL_136;
                            }
LABEL_118:
                            int v13 = 6;
                          }
                          else
                          {
                            v78 = *(void **)(*(void *)&buf[8] + 40);
                            if (!v78
                              || ([v78 visualUnderstanding],
                                  v79 = objc_claimAutoreleasedReturnValue(),
                                  BOOL v80 = v79 == 0,
                                  v79,
                                  v80))
                            {
                              if ((int)MediaAnalysisLogLevel() >= 4)
                              {
                                v97 = VCPLogInstance();
                                if (os_log_type_enabled(v97, v125))
                                {
                                  v98 = [v120 asset];
                                  v99 = [v98 localIdentifier];
                                  LODWORD(v158) = 138412290;
                                  *(void *)((char *)&v158 + 4) = v99;
                                  _os_log_impl((void *)&_mh_execute_header, v97, v125, "[PEC][%@] Failed to obtain VI parsing result", (uint8_t *)&v158, 0xCu);
                                }
                              }
                              -[NSObject setStatus:](v120, "setStatus:", 4294967278, v110);
                              goto LABEL_118;
                            }
                            if (![(id)v148[5] count])
                            {
                              if ((int)MediaAnalysisLogLevel() >= 7)
                              {
                                v100 = VCPLogInstance();
                                if (os_log_type_enabled(v100, v123))
                                {
                                  v101 = [v120 asset];
                                  v102 = [v101 localIdentifier];
                                  LODWORD(v158) = 138412290;
                                  *(void *)((char *)&v158 + 4) = v102;
                                  _os_log_impl((void *)&_mh_execute_header, v100, v123, "[PEC][%@] getEncryptedSearchDomainsWithVisualQuery found no supported encrypted search domain", (uint8_t *)&v158, 0xCu);
                                }
                              }
                              -[NSObject setVersion:](v120, "setVersion:", 5, v110);
                              goto LABEL_118;
                            }
                            v81 = v154;
                            v82 = [*(id *)(*(void *)&buf[8] + 40) visualUnderstanding];
                            v83 = [v82 imageRegions];
                            v84 = [*(id *)(*(void *)&buf[8] + 40) visualUnderstanding];
                            v85 = [v84 payload];
                            uint64_t v119 = +[VIParsedVisualQuery queryWithPixelBuffer:v81 orientation:1 imageRegions:v83 textBlockAnnotation:0 queryContext:v113 payload:v85];

                            v52 = v119;
                            if (!v119)
                            {
                              if ((int)MediaAnalysisLogLevel() >= 4)
                              {
                                v103 = VCPLogInstance();
                                if (os_log_type_enabled(v103, v125))
                                {
                                  v104 = [v120 asset];
                                  v105 = [v104 localIdentifier];
                                  LODWORD(v158) = 138412290;
                                  *(void *)((char *)&v158 + 4) = v105;
                                  _os_log_impl((void *)&_mh_execute_header, v103, v125, "[PEC][%@] Failed to create the parsed query", (uint8_t *)&v158, 0xCu);
                                }
                                v52 = 0;
                              }
                              -[NSObject setStatus:](v120, "setStatus:", 4294967278, v110);
                              goto LABEL_129;
                            }
                            *(void *)&long long v158 = 0;
                            *((void *)&v158 + 1) = &v158;
                            uint64_t v159 = 0x3032000000;
                            v160 = sub_1000E4AE0;
                            v161 = sub_1000E4AF0;
                            id v162 = +[NSMutableArray array];
                            long long v138 = 0u;
                            long long v139 = 0u;
                            long long v136 = 0u;
                            long long v137 = 0u;
                            id obj = (id)v148[5];
                            id v86 = [obj countByEnumeratingWithState:&v136 objects:v157 count:16];
                            if (v86)
                            {
                              uint64_t v87 = *(void *)v137;
                              do
                              {
                                for (i = 0; i != v86; i = (char *)i + 1)
                                {
                                  if (*(void *)v137 != v87) {
                                    objc_enumerationMutation(obj);
                                  }
                                  uint64_t v89 = *(void *)(*((void *)&v136 + 1) + 8 * i);
                                  v90 = VCPSignPostLog();
                                  os_signpost_id_t v91 = os_signpost_id_generate(v90);

                                  v92 = VCPSignPostLog();
                                  v93 = v92;
                                  if (v91 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v92))
                                  {
                                    *(_WORD *)v155 = 0;
                                    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v93, OS_SIGNPOST_INTERVAL_BEGIN, v91, "VIService_PECVISearch", (const char *)&unk_1001F3BD3, v155, 2u);
                                  }

                                  dispatch_group_enter((dispatch_group_t)self->_processGroup);
                                  v94 = [v124 object];
                                  v129[0] = _NSConcreteStackBlock;
                                  v129[1] = 3221225472;
                                  v129[2] = sub_1000E4DF0;
                                  v129[3] = &unk_10021DB68;
                                  os_signpost_id_t v134 = v91;
                                  uint64_t v135 = 0;
                                  v130 = v120;
                                  uint64_t v131 = v89;
                                  v132 = self;
                                  v133 = &v158;
                                  id v95 = [v94 encryptedSearchWithParsedVisualQuery:v119 domain:v89 completion:v129];

                                  dispatch_semaphore_wait((dispatch_semaphore_t)self->_processSemaphore, 0xFFFFFFFFFFFFFFFFLL);
                                }
                                id v86 = [obj countByEnumeratingWithState:&v136 objects:v157 count:16];
                              }
                              while (v86);
                            }

                            if ([(id)v148[5] count])
                            {
                              v96 = [(VCPMADPECAssetBatch *)self resultFromVISearchResults:*(void *)(*((void *)&v158 + 1) + 40)];
                              [v120 setResult:v96];
                            }
                            else
                            {
                              if ((int)MediaAnalysisLogLevel() >= 7)
                              {
                                v106 = VCPLogInstance();
                                if (os_log_type_enabled(v106, v123))
                                {
                                  v107 = [v120 asset];
                                  v108 = [v107 localIdentifier];
                                  *(_DWORD *)v155 = 138412290;
                                  v156 = v108;
                                  _os_log_impl((void *)&_mh_execute_header, v106, v123, "[PEC][%@] getEncryptedSearchDomainsWithVisualQuery found no supported encrypted search domain", v155, 0xCu);
                                }
                              }
                              -[NSObject setVersion:](v120, "setVersion:", 5, v110);
                            }
                            _Block_object_dispose(&v158, 8);

                            int v13 = 0;
                            v52 = v119;
LABEL_136:
                          }
                          _Block_object_dispose(&v147, 8);

                          _Block_object_dispose(buf, 8);
                        }
                      }
                      else
                      {
                        if ((int)MediaAnalysisLogLevel() >= 4)
                        {
                          v72 = VCPLogInstance();
                          if (os_log_type_enabled(v72, v125))
                          {
                            v73 = [v12 asset];
                            v74 = [v73 localIdentifier];
                            *(_DWORD *)buf = 138412290;
                            *(void *)&uint8_t buf[4] = v74;
                            _os_log_impl((void *)&_mh_execute_header, v72, v125, "[PEC][%@] Failed to create the query", buf, 0xCu);
                          }
                        }
                        [v12 setStatus:4294967278];
                        int v13 = 6;
                      }
                    }
                  }
                  else
                  {
                    if ((int)MediaAnalysisLogLevel() >= 4)
                    {
                      v66 = VCPLogInstance();
                      if (os_log_type_enabled(v66, v125))
                      {
                        v67 = [v12 asset];
                        v68 = [v67 localIdentifier];
                        *(_DWORD *)buf = 138412290;
                        *(void *)&uint8_t buf[4] = v68;
                        _os_log_impl((void *)&_mh_execute_header, v66, v125, "[PEC][%@] Failed to create annotation", buf, 0xCu);
                      }
                    }
                    [v12 setStatus:4294967278];
                    int v13 = 6;
                  }
                }
                else
                {
                  if ((int)MediaAnalysisLogLevel() >= 4)
                  {
                    v63 = VCPLogInstance();
                    if (os_log_type_enabled(v63, v125))
                    {
                      v64 = [v12 asset];
                      v65 = [v64 localIdentifier];
                      *(_DWORD *)buf = 138412290;
                      *(void *)&uint8_t buf[4] = v65;
                      _os_log_impl((void *)&_mh_execute_header, v63, v125, "[PEC][%@] Failed to create imageAsset", buf, 0xCu);
                    }
                  }
                  [v12 setStatus:4294967278];
                  int v13 = 6;
                }
              }
              else
              {
                if ((int)MediaAnalysisLogLevel() >= 4)
                {
                  v60 = VCPLogInstance();
                  if (os_log_type_enabled(v60, v125))
                  {
                    v61 = [v12 asset];
                    v62 = [v61 localIdentifier];
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v62;
                    _os_log_impl((void *)&_mh_execute_header, v60, v125, "[PEC][%@] Failed to decode thumbnail", buf, 0xCu);
                  }
                }
                [v12 setStatus:4294943494];
                int v13 = 6;
              }
              sub_100004484((const void **)&v154);
LABEL_144:

              goto LABEL_145;
            }
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              v55 = VCPLogInstance();
              if (os_log_type_enabled(v55, v125))
              {
                v58 = [v12 asset];
                v59 = [v58 localIdentifier];
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v59;
                _os_log_impl((void *)&_mh_execute_header, v55, v125, "[PEC][%@] Thumbnail resource not locally available", buf, 0xCu);
              }
              goto LABEL_65;
            }
          }
          else if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v55 = VCPLogInstance();
            if (os_log_type_enabled(v55, v125))
            {
              v56 = [v12 asset];
              v57 = [v56 localIdentifier];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v57;
              _os_log_impl((void *)&_mh_execute_header, v55, v125, "[PEC][%@] No thumbnail resource", buf, 0xCu);
            }
LABEL_65:
          }
          [v12 setStatus:4294943494];
          int v13 = 6;
          goto LABEL_144;
        }
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v22 = VCPLogInstance();
          if (os_log_type_enabled(v22, v123))
          {
            id v23 = [v12 asset];
            int v24 = [v23 localIdentifier];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v24;
            _os_log_impl((void *)&_mh_execute_header, v22, v123, "[PEC][%@] Asset does not have up-to-date VS Processing", buf, 0xCu);
          }
          uint64_t v25 = 4294967278;
          goto LABEL_28;
        }
        uint64_t v25 = 4294967278;
      }
      [v12 setStatus:v25];
      int v13 = 6;
      goto LABEL_145;
    }
    if ((int)MediaAnalysisLogLevel() < 5)
    {
      int v13 = 4;
      goto LABEL_146;
    }
    id v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, v122))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v122, "[PEC] Processing canceled", buf, 2u);
    }
    int v13 = 4;
LABEL_145:

LABEL_146:
    if (v13 == 4) {
      break;
    }
    ++v8;
  }
  dispatch_group_wait((dispatch_group_t)self->_processGroup, 0xFFFFFFFFFFFFFFFFLL);

  return v8;
}

- (int)process
{
  v3 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v3);

  unsigned int v4 = VCPSignPostLog();
  unsigned int v5 = v4;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADPECAssetEntry_Process", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  qos_class_t v6 = [(NSMutableArray *)self->_assetEntries firstObject];
  os_log_type_t v7 = [v6 asset];
  long long v27 = [v7 photoLibrary];

  unint64_t v8 = +[CSUSearchableKnowledgeObjectStore mad_sharedStoreForPhotoLibrary:v27];
  entityStore = self->_entityStore;
  self->_entityStore = v8;

  if (self->_entityStore)
  {
    uint64_t v10 = [(VCPObjectPool *)self->_servicePool getObject];
    int v24 = (void *)v10;
    if (v10)
    {
      unint64_t v11 = [(VCPMADPECAssetBatch *)self processAssetBatchWithVIService:v10];
      int v25 = 0;
      uint64_t v12 = 4294967168;
    }
    else
    {
      unint64_t v11 = 0;
      uint64_t v12 = 4294967188;
      int v25 = -108;
    }
    os_log_type_t v15 = VCPLogToOSLogType[7];
    while (v11 < (unint64_t)[(NSMutableArray *)self->_assetEntries count])
    {
      v17 = [(NSMutableArray *)self->_assetEntries objectAtIndexedSubscript:v11];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        dispatch_semaphore_t v18 = VCPLogInstance();
        if (os_log_type_enabled(v18, v15))
        {
          BOOL v19 = [v17 asset];
          BOOL v20 = [v19 localIdentifier];
          *(_DWORD *)buf = 138412290;
          long long v29 = v20;
          _os_log_impl((void *)&_mh_execute_header, v18, v15, "[PEC][%@] Marking asset as canceled", buf, 0xCu);
        }
      }
      [v17 setStatus:v12];

      ++v11;
    }
    unsigned int v21 = VCPSignPostLog();
    v22 = v21;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADPECAssetEntry_Process", (const char *)&unk_1001F3BD3, buf, 2u);
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      int v25 = -18;
      goto LABEL_24;
    }
    int v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[3];
    int v24 = v13;
    if (os_log_type_enabled(v13, v14))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[PEC] Failed to initialize CSU store", buf, 2u);
    }
    int v25 = -18;
  }

LABEL_24:
  return v25;
}

- (int)publish
{
  v3 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v3);

  unsigned int v4 = VCPSignPostLog();
  unsigned int v5 = v4;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADPECAssetEntry_Publish", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  qos_class_t v6 = buf;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      unsigned int v9 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v10 = qos_class_self();
      unint64_t v11 = VCPMAQoSDescription(v10);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v68 = v9;
      *(_WORD *)&v68[4] = 2112;
      *(void *)&v68[6] = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[PEC] Persisting %d assets (QoS: %@)", buf, 0x12u);
    }
  }
  if ([(NSMutableArray *)self->_assetEntries count])
  {
    uint64_t v12 = +[MADStateHandler sharedStateHandler];
    objc_msgSend(v12, "addBreadcrumb:", @"[PEC] Persisting %d assets to Photos", -[NSMutableArray count](self->_assetEntries, "count"));

    int v13 = +[VCPWatchdog sharedWatchdog];
    [v13 pet];

    os_log_type_t v14 = +[MADStateHandler sharedStateHandler];
    [v14 enterKnownTimeoutRisk:1];

    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_1000E5E4C;
    v65[3] = &unk_100219FC8;
    v65[4] = self;
    v55 = objc_retainBlock(v65);
    os_log_type_t v15 = [(NSMutableArray *)self->_assetEntries firstObject];
    unsigned int v16 = [v15 asset];
    v56 = [v16 photoLibrary];

    id cancelBlock = self->_cancelBlock;
    id v64 = 0;
    unsigned __int8 v18 = objc_msgSend(v56, "mad_performChangesAndWait:cancelBlock:extendTimeoutBlock:error:", v55, cancelBlock, &stru_10021DB88, &v64);
    id v58 = v64;
    BOOL v19 = +[MADStateHandler sharedStateHandler];
    [v19 exitKnownTimeoutRisk];

    BOOL v20 = +[MADStateHandler sharedStateHandler];
    objc_msgSend(v20, "addBreadcrumb:", @"[PEC] Finished persisting %d assets to Photos", -[NSMutableArray count](self->_assetEntries, "count"));

    if (v18)
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id obj = self->_assetEntries;
      id v21 = [(NSMutableArray *)obj countByEnumeratingWithState:&v60 objects:v66 count:16];
      if (v21)
      {
        uint64_t v59 = *(void *)v61;
        while (2)
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v61 != v59) {
              objc_enumerationMutation(obj);
            }
            id v23 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            if ([v23 status])
            {
              if ([v23 status] == -128)
              {
                id v24 = [v23 previousAttempts];
                analysisDatabase = self->_analysisDatabase;
                if (v24)
                {
                  id v26 = [v23 previousAttempts];
                  long long v27 = [v23 asset];
                  id v28 = [v23 previousStatus];
                  long long v29 = [v23 lastAttemptDate];
                  id v30 = (id)[(VCPDatabaseWriter *)analysisDatabase setAttempts:v26 asset:v27 taskID:16 status:v28 lastAttemptDate:v29];
                }
                else
                {
                  os_signpost_id_t v45 = [v23 asset];
                  long long v46 = [v45 localIdentifier];
                  id v30 = (id)[(VCPDatabaseWriter *)analysisDatabase removeProcessingStatusForLocalIdentifier:v46 andTaskID:16];
                }
                if (v30 == -108 || v30 == -36)
                {
                  __int16 v36 = (uint8_t *)v30;
                }
                else
                {
                  __int16 v36 = (uint8_t *)v30;
                  if (v30 != -23) {
                    __int16 v36 = v6;
                  }
                }
                if (v30 == -108) {
                  goto LABEL_62;
                }
                if (v30 == -36) {
                  goto LABEL_62;
                }
                qos_class_t v6 = v36;
                if (v30 == -23) {
                  goto LABEL_62;
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
                v38 = [v23 asset];
                id v39 = [v23 currentAttemptDate];
                BOOL v40 = objc_msgSend(v38, "mad_nextAttemptDateForStatus:currentAttemptDate:attemptCount:", v37, v39, (char *)objc_msgSend(v23, "previousAttempts") + 1);

                v41 = self->_analysisDatabase;
                os_log_type_t v42 = [v23 asset];
                id v43 = [v42 localIdentifier];
                id v44 = (id)[(VCPDatabaseWriter *)v41 updateProcessingStatus:v37 andNextAttemptDate:v40 forLocalIdentifier:v43 andTaskID:16];

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
                  goto LABEL_62;
                }
                if (v44 == -36) {
                  goto LABEL_62;
                }
                qos_class_t v6 = v36;
                if (v44 == -23) {
                  goto LABEL_62;
                }
              }
            }
            else
            {
              os_signpost_id_t v31 = self->_analysisDatabase;
              long long v32 = [v23 asset];
              uint64_t v33 = [v32 localIdentifier];
              id v34 = (id)[(VCPDatabaseWriter *)v31 removeProcessingStatusForLocalIdentifier:v33 andTaskID:16];

              if (v34 == -108)
              {
                __int16 v36 = (uint8_t *)v34;
              }
              else
              {
                BOOL v35 = v34 == -36 || v34 == -23;
                __int16 v36 = (uint8_t *)v34;
                if (!v35) {
                  __int16 v36 = v6;
                }
              }
              if (v34 == -108 || (v34 != -36 ? (BOOL v47 = v34 == -23) : (BOOL v47 = 1), v6 = v36, v47))
              {
LABEL_62:

                goto LABEL_63;
              }
            }
          }
          id v21 = [(NSMutableArray *)obj countByEnumeratingWithState:&v60 objects:v66 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

      unsigned int v51 = [(VCPDatabaseWriter *)self->_analysisDatabase commit];
      if (v51 == -108 || v51 == -36)
      {
        LODWORD(v36) = v51;
      }
      else
      {
        LODWORD(v36) = v51;
        if (v51 != -23) {
          LODWORD(v36) = v6;
        }
      }
      if (v51 != -108 && v51 != -36 && v51 != -23)
      {
        v52 = VCPSignPostLog();
        v53 = v52;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v53, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADPECAssetEntry_Publish", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        LODWORD(v36) = 0;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v48 = VCPLogInstance();
        os_log_type_t v49 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v48, v49))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v68 = v58;
          _os_log_impl((void *)&_mh_execute_header, v48, v49, "[PEC] Failed to persist results to Photos (%@)", buf, 0xCu);
        }
      }
      LODWORD(v36) = [v58 code];
    }
LABEL_63:
  }
  else
  {
    LODWORD(v36) = 0;
  }
  return (int)v36;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processGroup, 0);
  objc_storeStrong((id *)&self->_processSemaphore, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_entityStore, 0);
  objc_storeStrong((id *)&self->_analysisDatabase, 0);
  objc_storeStrong((id *)&self->_servicePool, 0);
  objc_storeStrong((id *)&self->_assetEntries, 0);
}

@end