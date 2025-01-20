@interface MADSpotlightMovieAssetBatch
+ (id)batchWithCancelBlock:(id)a3;
- (MADSpotlightMovieAssetBatch)initWithCancelBlock:(id)a3;
- (id)createSearchableItemForAssetEntry:(id)a3 andImageAssetEntry:(id)a4;
- (id)logPrefix;
- (id)mergeVideoScenes:(id)a3 withExistingResult:(id)a4;
- (id)truncateTimeRangeResults:(id)a3 withTimeCap:(double)a4;
- (int)prepare;
- (int)process;
- (int)publish;
- (unint64_t)count;
- (void)_processActionResults:(id)a3 andTimeRangeResults:(id)a4 withAssetDuration:(double)a5 forAssetEntry:(id)a6;
- (void)_processEmbeddingResults:(id)a3 andSummarizedEmbeddingResults:(id)a4 forAssetEntry:(id)a5;
- (void)_processSafetyResults:(id)a3 forAssetEntry:(id)a4;
- (void)_processSceneResults:(id)a3 andTimeRangeResults:(id)a4 forAssetEntry:(id)a5;
- (void)_processTimeRangeResults:(id)a3 forAssetEntry:(id)a4;
- (void)addAsset:(id)a3;
- (void)processAssetEntry:(id)a3;
@end

@implementation MADSpotlightMovieAssetBatch

- (MADSpotlightMovieAssetBatch)initWithCancelBlock:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)MADSpotlightMovieAssetBatch;
  v5 = [(MADSpotlightMovieAssetBatch *)&v31 init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = +[NSMutableArray array];
  assetEntries = v5->_assetEntries;
  v5->_assetEntries = (NSMutableArray *)v6;

  dispatch_group_t v8 = dispatch_group_create();
  computeGroup = v5->_computeGroup;
  v5->_computeGroup = (OS_dispatch_group *)v8;

  v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v11 = dispatch_queue_create("com.apple.mediaanalysisd.spotlight.video.compute", v10);
  computeQueue = v5->_computeQueue;
  v5->_computeQueue = (OS_dispatch_queue *)v11;

  id v13 = objc_retainBlock(v4);
  id cancelBlock = v5->_cancelBlock;
  v5->_id cancelBlock = v13;

  id v15 = objc_alloc((Class)SCMLHandler);
  uint64_t v38 = SCMLUseAnyAvailableDevice;
  v39 = &__kCFBooleanTrue;
  v16 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  id v30 = 0;
  v17 = (SCMLHandler *)[v15 initWithOptions:v16 error:&v30];
  id v18 = v30;
  commSafetyHandler = v5->_commSafetyHandler;
  v5->_commSafetyHandler = v17;

  if (v5->_commSafetyHandler && !v18)
  {
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.mediaanalysisd.spotlight.image.request", 0);
    requestQueue = v5->_requestQueue;
    v5->_requestQueue = (OS_dispatch_queue *)v20;

    uint64_t v22 = +[NSMutableArray array];
    imageAssetEntries = v5->_imageAssetEntries;
    v5->_imageAssetEntries = (NSMutableArray *)v22;

LABEL_5:
    v24 = v5;
    goto LABEL_9;
  }
  v25 = VCPLogInstance();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    v27 = [(MADSpotlightMovieAssetBatch *)v5 logPrefix];
    id v28 = (id)objc_opt_class();
    v29 = [v18 description];
    *(_DWORD *)buf = 138412802;
    v33 = v27;
    __int16 v34 = 2112;
    id v35 = v28;
    __int16 v36 = 2112;
    v37 = v29;
    _os_log_fault_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "[%@] Failed to create %@: %@", buf, 0x20u);
  }
  v24 = 0;
LABEL_9:

  return v24;
}

+ (id)batchWithCancelBlock:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithCancelBlock:v4];

  return v5;
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_assetEntries count];
}

- (id)logPrefix
{
  return @"Spotlight|Movie";
}

- (void)addAsset:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = self->_assetEntries;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "asset", (void)v20);
        v10 = [v9 uniqueIdentifier];
        dispatch_queue_t v11 = [v4 uniqueIdentifier];
        unsigned int v12 = [v10 isEqual:v11];

        if (v12)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v16 = VCPLogInstance();
            os_log_type_t v17 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v16, v17))
            {
              id v18 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
              v19 = [v4 uniqueIdentifier];
              *(_DWORD *)buf = 138412546;
              v25 = v18;
              __int16 v26 = 2112;
              v27 = v19;
              _os_log_impl((void *)&_mh_execute_header, v16, v17, "[%@][%@] Batch already contains asset; ignoring",
                buf,
                0x16u);
            }
          }
          goto LABEL_15;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    assetEntries = self->_assetEntries;
    v14 = +[MADSpotlightMovieAssetEntry entryWithAsset:v4];
    [(NSMutableArray *)assetEntries addObject:v14];

    imageAssetEntries = self->_imageAssetEntries;
    id v5 = +[MADSpotlightImageAssetEntry entryWithAsset:v4];
    [(NSMutableArray *)imageAssetEntries addObject:v5];
LABEL_15:
  }
}

- (int)prepare
{
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obj = self->_assetEntries;
  id v2 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v2)
  {
    uint64_t v4 = *(void *)v31;
    os_log_type_t v5 = VCPLogToOSLogType[5];
    *(void *)&long long v3 = 138412546;
    long long v26 = v3;
    do
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v31 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          dispatch_group_t v8 = VCPLogInstance();
          if (os_log_type_enabled(v8, v5))
          {
            v9 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
            v10 = [v7 asset];
            dispatch_queue_t v11 = [v10 uniqueIdentifier];
            *(_DWORD *)buf = v26;
            id v35 = v9;
            __int16 v36 = 2112;
            id v37 = v11;
            _os_log_impl((void *)&_mh_execute_header, v8, v5, "[%@][Prepare] %@", buf, 0x16u);
          }
        }
        unsigned int v12 = objc_msgSend(v7, "asset", v26);
        [v12 setStatus:1];

        id v13 = [v7 asset];
        objc_msgSend(v13, "setAttemptCount:", objc_msgSend(v13, "attemptCount") + 1);

        v14 = [v7 asset];
        double v15 = MADRetryBackoffTime((int)[v14 attemptCount]);

        v16 = +[NSDate dateWithTimeIntervalSinceNow:v15];
        os_log_type_t v17 = [v7 asset];
        [v17 setNextAttemptDate:v16];
      }
      id v2 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v2);
  }

  id v18 = +[MADSystemDataStore systemDataStore];
  id v29 = 0;
  unsigned __int8 v19 = [v18 commitChangesOrRollback:&v29];
  id v20 = v29;

  if (v19)
  {
    int v21 = 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      long long v22 = VCPLogInstance();
      os_log_type_t v23 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v22, v23))
      {
        v24 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
        *(_DWORD *)buf = 138412546;
        id v35 = v24;
        __int16 v36 = 2112;
        id v37 = v20;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "[%@][Prepare] Failed during commit changes (%@)", buf, 0x16u);
      }
    }
    int v21 = [v20 code];
  }

  return v21;
}

- (int)process
{
  if ([(NSMutableArray *)self->_assetEntries count])
  {
    uint64_t v3 = 0;
    os_log_type_t v31 = VCPLogToOSLogType[4];
    os_log_type_t type = VCPLogToOSLogType[5];
    *(void *)&long long v2 = 138412802;
    long long v30 = v2;
    while (1)
    {
      uint64_t v4 = [(NSMutableArray *)self->_assetEntries objectAtIndexedSubscript:v3];
      __int16 v34 = [(NSMutableArray *)self->_imageAssetEntries objectAtIndexedSubscript:v3];
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        os_log_type_t v5 = VCPLogInstance();
        if (os_log_type_enabled(v5, type))
        {
          id v6 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
          uint64_t v7 = [v4 asset];
          dispatch_group_t v8 = [v7 uniqueIdentifier];
          *(_DWORD *)buf = 138412546;
          v40 = v6;
          __int16 v41 = 2112;
          v42 = v8;
          _os_log_impl((void *)&_mh_execute_header, v5, type, "[%@][Process] %@", buf, 0x16u);
        }
      }
      objc_msgSend(v4, "setStatus:", objc_msgSend(v4, "consumeSandboxExtension", v30));
      v9 = [v4 asset];
      v10 = [v9 url];
      dispatch_queue_t v11 = [v10 path];
      if (!v11) {
        break;
      }
      unsigned int v12 = +[NSFileManager defaultManager];
      id v13 = [v4 asset];
      v14 = [v13 url];
      double v15 = [v14 path];
      unsigned int v16 = [v12 fileExistsAtPath:v15];

      if (!v16) {
        goto LABEL_11;
      }
      computeGroup = self->_computeGroup;
      computeQueue = self->_computeQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001675F0;
      block[3] = &unk_10021BF68;
      block[4] = self;
      id v37 = v4;
      id v38 = v34;
      dispatch_group_async(computeGroup, computeQueue, block);

LABEL_16:
      if (++v3 >= (unint64_t)[(NSMutableArray *)self->_assetEntries count]) {
        goto LABEL_17;
      }
    }

LABEL_11:
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      unsigned __int8 v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, v31))
      {
        id v20 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
        int v21 = [v4 asset];
        long long v22 = [v21 uniqueIdentifier];
        os_log_type_t v23 = [v4 asset];
        v24 = [v23 url];
        v25 = [v24 path];
        *(_DWORD *)buf = v30;
        v40 = v20;
        __int16 v41 = 2112;
        v42 = v22;
        __int16 v43 = 2112;
        v44 = v25;
        _os_log_impl((void *)&_mh_execute_header, v19, v31, "[%@][Process][%@] File does not exist (%@)", buf, 0x20u);
      }
    }
    [v4 setStatus:4294967278];
    goto LABEL_16;
  }
LABEL_17:
  if ((int)MediaAnalysisLogLevel() > 5)
  {
    long long v26 = VCPLogInstance();
    os_log_type_t v27 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v26, v27))
    {
      id v28 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
      *(_DWORD *)buf = 138412290;
      v40 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "[%@][Process] Waiting for compute to complete", buf, 0xCu);
    }
  }
  dispatch_group_wait((dispatch_group_t)self->_computeGroup, 0xFFFFFFFFFFFFFFFFLL);
  return 0;
}

- (void)_processSceneResults:(id)a3 andTimeRangeResults:(id)a4 forAssetEntry:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v37 = v8;
  id v38 = a5;
  if (v7) {
    [v8 setObject:v7 forKey:@"ClassificationResults"];
  }
  v9 = +[NSMutableDictionary dictionary];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v7;
  id type = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (type)
  {
    uint64_t v40 = *(void *)v54;
    do
    {
      for (i = 0; i != type; i = (char *)i + 1)
      {
        if (*(void *)v54 != v40) {
          objc_enumerationMutation(obj);
        }
        v10 = [*(id *)(*((void *)&v53 + 1) + 8 * i) objectForKeyedSubscript:@"attributes"];
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v11 = v10;
        id v12 = [v11 countByEnumeratingWithState:&v49 objects:v60 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v50;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v50 != v13) {
                objc_enumerationMutation(v11);
              }
              uint64_t v15 = *(void *)(*((void *)&v49 + 1) + 8 * (void)j);
              unsigned int v16 = [v11 objectForKeyedSubscript:v15];
              [v16 floatValue];
              float v18 = v17;

              unsigned __int8 v19 = [v9 objectForKeyedSubscript:v15];
              if (v19)
              {
                int v21 = [v9 objectForKeyedSubscript:v15];
                [v21 floatValue];
                BOOL v23 = v18 > v22;

                if (!v23) {
                  continue;
                }
              }
              *(float *)&double v20 = v18;
              v24 = +[NSNumber numberWithFloat:v20];
              [v9 setObject:v24 forKeyedSubscript:v15];
            }
            id v12 = [v11 countByEnumeratingWithState:&v49 objects:v60 count:16];
          }
          while (v12);
        }
      }
      id type = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (type);
  }

  v44 = +[NSMutableSet set];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v25 = [v9 allKeys];
  id v26 = [v25 countByEnumeratingWithState:&v45 objects:v59 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v46;
    os_log_type_t typea = VCPLogToOSLogType[3];
    do
    {
      id v28 = 0;
      do
      {
        if (*(void *)v46 != v27) {
          objc_enumerationMutation(v25);
        }
        id v29 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v28);
        long long v30 = [v9 objectForKeyedSubscript:v29];
        [v30 doubleValue];
        double v32 = v31;

        long long v33 = +[PFSceneTaxonomy vcp_sharedTaxonomy];
        __int16 v34 = objc_msgSend(v33, "nodeForExtendedSceneClassId:", objc_msgSend(v29, "longLongValue"));

        if (v34)
        {
          id v35 = objc_msgSend(objc_alloc((Class)PHSceneClassification), "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", objc_msgSend(v34, "extendedSceneClassId"), 0, v32, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height, 0.0, 0.0);
          if (v35) {
            [v44 addObject:v35];
          }
LABEL_28:

          goto LABEL_29;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          id v35 = VCPLogInstance();
          if (os_log_type_enabled(v35, typea))
          {
            *(_DWORD *)buf = 138412290;
            v58 = v29;
            _os_log_impl((void *)&_mh_execute_header, v35, typea, "Failed to create PFSceneTaxonomyNode for scene ID: %@", buf, 0xCu);
          }
          goto LABEL_28;
        }
LABEL_29:

        id v28 = (char *)v28 + 1;
      }
      while (v26 != v28);
      id v36 = [v25 countByEnumeratingWithState:&v45 objects:v59 count:16];
      id v26 = v36;
    }
    while (v36);
  }

  [v38 setSceneClassifications:v44];
}

- (void)_processSafetyResults:(id)a3 forAssetEntry:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSMutableSet set];
  if ([v5 count])
  {
    id v8 = [v5 objectAtIndexedSubscript:0];
    v9 = [v8 objectForKeyedSubscript:@"attributes"];
    v10 = [v9 objectForKeyedSubscript:@"SensitivitySceneResults"];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100167D6C;
    v11[3] = &unk_10021F168;
    id v12 = v7;
    [v10 enumerateKeysAndObjectsUsingBlock:v11];
  }
  [v6 setNsfwClassifications:v7];
}

- (void)_processActionResults:(id)a3 andTimeRangeResults:(id)a4 withAssetDuration:(double)a5 forAssetEntry:(id)a6
{
  long long v48 = self;
  id v52 = a3;
  id v50 = a4;
  id v51 = a6;
  long long v54 = +[NSMutableArray array];
  v60 = +[NSMutableDictionary dictionary];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = v52;
  id v56 = [obj countByEnumeratingWithState:&v69 objects:v79 count:16];
  if (v56)
  {
    uint64_t v55 = *(void *)v70;
    do
    {
      for (i = 0; i != v56; i = (char *)i + 1)
      {
        if (*(void *)v70 != v55) {
          objc_enumerationMutation(obj);
        }
        id v58 = objc_msgSend(*(id *)(*((void *)&v69 + 1) + 8 * i), "mutableCopy", v48);
        v9 = [v58 objectForKeyedSubscript:@"attributes"];
        id v59 = [v9 mutableCopy];

        v10 = [v59 objectForKeyedSubscript:@"humanActions"];
        id v11 = [v10 mutableCopy];

        id v12 = +[NSMutableArray array];
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        uint64_t v13 = [v11 allKeys];
        id v14 = [v13 countByEnumeratingWithState:&v65 objects:v78 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v66;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v66 != v15) {
                objc_enumerationMutation(v13);
              }
              float v17 = *(void **)(*((void *)&v65 + 1) + 8 * (void)j);
              float v18 = [v11 objectForKeyedSubscript:v17];
              [v18 floatValue];
              float v20 = v19;

              int v21 = VCPHumanActionOperatingPointFromActionID(v17);
              [v21 floatValue];
              float v23 = v22;

              v24 = VCPHumanActionOperatingPointFromActionID(v17);
              BOOL v26 = v20 < v23 || v24 == 0;

              if (v26)
              {
                [v12 addObject:v17];
              }
              else
              {
                uint64_t v27 = [v60 objectForKeyedSubscript:v17];
                if (!v27
                  || ([v60 objectForKeyedSubscript:v17],
                      id v29 = objc_claimAutoreleasedReturnValue(),
                      [v29 floatValue],
                      BOOL v31 = v20 > v30,
                      v29,
                      v27,
                      v31))
                {
                  *(float *)&double v28 = v20;
                  double v32 = +[NSNumber numberWithFloat:v28];
                  [v60 setObject:v32 forKeyedSubscript:v17];
                }
              }
            }
            id v14 = [v13 countByEnumeratingWithState:&v65 objects:v78 count:16];
          }
          while (v14);
        }

        [v11 removeObjectsForKeys:v12];
        if ([v11 count])
        {
          [v59 setObject:v11 forKeyedSubscript:@"humanActions"];
          [v58 setObject:v59 forKeyedSubscript:@"attributes"];
          [v54 addObject:v58];
        }
      }
      id v56 = [obj countByEnumeratingWithState:&v69 objects:v79 count:16];
    }
    while (v56);
  }

  if (v54) {
    [v50 setObject:v54 forKey:@"HumanActionClassificationResults"];
  }
  long long v33 = +[NSMutableSet set];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  __int16 v34 = [v60 allKeys];
  id v35 = [v34 countByEnumeratingWithState:&v61 objects:v77 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v62;
    while (2)
    {
      for (k = 0; k != v35; k = (char *)k + 1)
      {
        if (*(void *)v62 != v36) {
          objc_enumerationMutation(v34);
        }
        id v38 = *(void **)(*((void *)&v61 + 1) + 8 * (void)k);
        v39 = [v60 objectForKeyedSubscript:v38];
        [v39 floatValue];
        float v41 = v40;

        id v42 = objc_msgSend(objc_alloc((Class)PHDetectionTrait), "initWithType:value:score:startTime:duration:", 1, (__int16)objc_msgSend(v38, "intValue"), v41, 0.0, a5);
        if (!v42)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            __int16 v43 = VCPLogInstance();
            os_log_type_t v44 = VCPLogToOSLogType[3];
            if (os_log_type_enabled(v43, v44))
            {
              long long v45 = [v49 logPrefix];
              long long v46 = [v51 asset];
              long long v47 = [v46 uniqueIdentifier];
              *(_DWORD *)buf = 138412546;
              v74 = v45;
              __int16 v75 = 2112;
              v76 = v47;
              _os_log_impl((void *)&_mh_execute_header, v43, v44, "[%@][%@] Failed to generate PHDetectionTrait for human action", buf, 0x16u);
            }
          }
          [v51 setStatus:4294967278];

          goto LABEL_44;
        }
        [v33 addObject:v42];
      }
      id v35 = [v34 countByEnumeratingWithState:&v61 objects:v77 count:16];
      if (v35) {
        continue;
      }
      break;
    }
  }

  [v51 setActionClassifications:v33];
LABEL_44:
}

- (void)_processTimeRangeResults:(id)a3 forAssetEntry:(id)a4
{
  id v5 = a3;
  id v51 = a4;
  id v6 = v5;
  id v50 = v6;
  long long v53 = +[VCPDataCompressor compressor];
  id v7 = 0;
  int v8 = 0;
  v9 = 0;
  os_log_type_t type = VCPLogToOSLogType[4];
  while (1)
  {
    CFStringRef v65 = @"metadataRanges";
    id v66 = v6;
    v10 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    id v11 = +[VCPProtoAssetAnalysis filesystemMovieAnalysisFromLegacyDictionary:v10];

    if (!v11)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v24 = VCPLogInstance();
        os_log_type_t v25 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v24, v25))
        {
          BOOL v26 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
          uint64_t v27 = [v51 asset];
          double v28 = [v27 uniqueIdentifier];
          *(_DWORD *)buf = 138412546;
          id v56 = v26;
          __int16 v57 = 2112;
          id v58 = v28;
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "[%@][Process][%@] Failed to convert asset analysis; skipping",
            buf,
            0x16u);
        }
      }
      [v51 setStatus:4294967278];
      goto LABEL_24;
    }
    id v12 = [v11 data];

    if (!v12)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v29 = VCPLogInstance();
        os_log_type_t v30 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v29, v30))
        {
          BOOL v31 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
          double v32 = [v51 asset];
          long long v33 = [v32 uniqueIdentifier];
          *(_DWORD *)buf = 138412546;
          id v56 = v31;
          __int16 v57 = 2112;
          id v58 = v33;
          _os_log_impl((void *)&_mh_execute_header, v29, v30, "[%@][Process][%@] Failed to serialize asset analysis; skipping",
            buf,
            0x16u);
        }
      }
      id v7 = 0;
      [v51 setStatus:4294967278];
LABEL_24:
      id v12 = v7;
      goto LABEL_41;
    }
    uint64_t v13 = [v53 compressData:v12];
    id v14 = v13;
    if (!v13)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        __int16 v34 = VCPLogInstance();
        os_log_type_t v35 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v34, v35))
        {
          uint64_t v36 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
          id v37 = [v51 asset];
          id v38 = [v37 uniqueIdentifier];
          *(_DWORD *)buf = 138412546;
          id v56 = v36;
          __int16 v57 = 2112;
          id v58 = v38;
          _os_log_impl((void *)&_mh_execute_header, v34, v35, "[%@][Process][%@] Failed to compress serialized asset analysis", buf, 0x16u);
        }
      }
      [v51 setStatus:4294967278];
      goto LABEL_40;
    }
    id v15 = [v13 length];
    if (v15 <= [v12 length])
    {
      id v16 = v14;

      id v12 = v16;
    }
    if ((unint64_t)[v12 length] <= 0x1000)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v39 = VCPLogInstance();
        if (os_log_type_enabled(v39, type))
        {
          float v40 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
          float v41 = [v51 asset];
          id v42 = [v41 uniqueIdentifier];
          id v43 = [v12 length];
          *(_DWORD *)buf = 138413058;
          id v56 = v40;
          __int16 v57 = 2112;
          id v58 = v42;
          __int16 v59 = 2048;
          id v60 = v43;
          __int16 v61 = 1024;
          int v62 = 4096;
          _os_log_impl((void *)&_mh_execute_header, v39, type, "[%@][Process][%@] Serialized analysis %lu bytes within %d bytes cap", buf, 0x26u);
        }
      }

      id v14 = [v12 copy];
      [v51 setTimeRangeResults:v14];
      goto LABEL_40;
    }
    double v17 = pow(0.7, (double)v8) * 900.0;
    uint64_t v18 = [(MADSpotlightMovieAssetBatch *)self truncateTimeRangeResults:v6 withTimeCap:v17];

    if (v8 >= 0xE) {
      break;
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      float v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, type))
      {
        float v20 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
        int v21 = [v51 asset];
        float v22 = [v21 uniqueIdentifier];
        id v23 = [v12 length];
        *(_DWORD *)buf = 138413314;
        id v56 = v20;
        __int16 v57 = 2112;
        id v58 = v22;
        __int16 v59 = 2048;
        id v60 = v23;
        __int16 v61 = 1024;
        int v62 = 4096;
        __int16 v63 = 2048;
        double v64 = v17;
        _os_log_impl((void *)&_mh_execute_header, v19, type, "[%@][Process][%@] Serialized analysis %lu bytes; exceeds per-entry limit %d bytes;retry truncating data with t"
          "imeRange cap:%fs",
          buf,
          0x30u);
      }
    }

    ++v8;
    id v7 = v12;
    id v6 = (id)v18;
    v9 = v11;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    os_log_type_t v44 = VCPLogInstance();
    os_log_type_t v45 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v44, v45))
    {
      long long v46 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
      long long v47 = [v51 asset];
      long long v48 = [v47 uniqueIdentifier];
      id v49 = [v12 length];
      *(_DWORD *)buf = 138412802;
      id v56 = v46;
      __int16 v57 = 2112;
      id v58 = v48;
      __int16 v59 = 2048;
      id v60 = v49;
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "[%@][Process][%@] Serialized analysis size %lu bytes;exceeds size limit and hit truncation retry limit, skipping the asset",
        buf,
        0x20u);
    }
  }
  [v51 setStatus:4294967278];
  id v6 = (id)v18;
LABEL_40:

LABEL_41:
}

- (id)truncateTimeRangeResults:(id)a3 withTimeCap:(double)a4
{
  id v5 = a3;
  id v6 = +[NSMutableDictionary dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [v5 allKeys];
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v12 = [v5 objectForKeyedSubscript:v11];
        for (unint64_t j = 0; ; ++j)
        {
          if ((unint64_t)[v12 count] <= j)
          {
            id v15 = v12;
            goto LABEL_12;
          }
          CFDictionaryRef v14 = [v12 objectAtIndexedSubscript:j];
          memset(&v18, 0, sizeof(v18));
          CMTimeRangeMakeFromDictionary(&v18, v14);
          CMTime start = v18.start;
          if (CMTimeGetSeconds(&start) > a4) {
            break;
          }
        }
        id v15 = objc_msgSend(v12, "subarrayWithRange:", 0, j);

LABEL_12:
        [v6 setObject:v15 forKey:v11];
      }
      id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v6;
}

- (void)_processEmbeddingResults:(id)a3 andSummarizedEmbeddingResults:(id)a4 forAssetEntry:(id)a5
{
  id v7 = a3;
  id v38 = a4;
  id v41 = a5;
  os_log_type_t v45 = v7;
  id v42 = +[NSMutableArray array];
  if ([v7 count])
  {
    if ([v38 count])
    {
      id v8 = [v38 objectAtIndexedSubscript:0];
      uint64_t v9 = objc_msgSend(v8, "objectForKeyedSubscript:");
      v10 = [v9 objectForKeyedSubscript:@"embeddingIds"];

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id obj = v10;
      id v11 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
      if (!v11) {
        goto LABEL_22;
      }
      uint64_t v12 = *(void *)v48;
      os_log_type_t type = VCPLogToOSLogType[3];
      os_log_type_t v39 = VCPLogToOSLogType[4];
      while (1)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v48 != v12) {
            objc_enumerationMutation(obj);
          }
          CFDictionaryRef v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          id v15 = objc_msgSend(v14, "integerValue", v38);
          if (v15 >= [v45 count])
          {
            if ((int)MediaAnalysisLogLevel() < 3) {
              continue;
            }
            id v16 = VCPLogInstance();
            if (os_log_type_enabled(v16, type))
            {
              long long v19 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
              long long v20 = [v41 asset];
              long long v21 = [v20 uniqueIdentifier];
              *(_DWORD *)buf = 138412546;
              id v52 = v19;
              __int16 v53 = 2112;
              long long v54 = v21;
              _os_log_impl((void *)&_mh_execute_header, v16, type, "[%@][Process][%@] Summarized video embedding ID out of bound", buf, 0x16u);
            }
          }
          else
          {
            id v16 = objc_msgSend(v45, "objectAtIndexedSubscript:", objc_msgSend(v14, "integerValue"));
            double v17 = [v16 objectForKeyedSubscript:@"attributes"];
            CMTimeRange v18 = [v17 objectForKeyedSubscript:@"embeddings"];

            if (v18)
            {
              [v42 addObject:v18];
            }
            else if ((int)MediaAnalysisLogLevel() >= 4)
            {
              long long v22 = VCPLogInstance();
              if (os_log_type_enabled(v22, v39))
              {
                id v23 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
                v24 = [v41 asset];
                os_log_type_t v25 = [v24 uniqueIdentifier];
                *(_DWORD *)buf = 138412546;
                id v52 = v23;
                __int16 v53 = 2112;
                long long v54 = v25;
                _os_log_impl((void *)&_mh_execute_header, v22, v39, "[%@][Process][%@] No video summarized embedding in results", buf, 0x16u);
              }
            }
          }
        }
        id v11 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
        if (!v11)
        {
LABEL_22:

          goto LABEL_23;
        }
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      long long v33 = VCPLogInstance();
      os_log_type_t v34 = VCPLogToOSLogType[4];
      id obj = v33;
      if (os_log_type_enabled(v33, v34))
      {
        os_log_type_t v35 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
        uint64_t v36 = [v41 asset];
        id v37 = [v36 uniqueIdentifier];
        *(_DWORD *)buf = 138412546;
        id v52 = v35;
        __int16 v53 = 2112;
        long long v54 = v37;
        _os_log_impl((void *)&_mh_execute_header, obj, v34, "[%@][Process][%@] No video summarized embedding results", buf, 0x16u);
      }
LABEL_23:
    }
    id v46 = 0;
    BOOL v26 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v45, 200, 0, &v46, v38);
    id v27 = v46;
    if (v27)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        double v28 = VCPLogInstance();
        os_log_type_t v29 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v28, v29))
        {
          os_log_type_t v30 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
          BOOL v31 = [v41 asset];
          double v32 = [v31 uniqueIdentifier];
          *(_DWORD *)buf = 138412802;
          id v52 = v30;
          __int16 v53 = 2112;
          long long v54 = v32;
          __int16 v55 = 2112;
          id v56 = v27;
          _os_log_impl((void *)&_mh_execute_header, v28, v29, "[%@][Process][%@] Failed to convert timeRangeEmbeddings (%@)", buf, 0x20u);
        }
      }
      [v41 setStatus:4294967278];
    }
    else
    {
      [v41 setTimerangeEmbeddings:v26];
      [v41 setSummarizedEmbeddings:v42];
      objc_msgSend(v41, "setEmbeddingVersion:", +[VCPMediaAnalyzer getUnifiedEmbeddingVersion](VCPMediaAnalyzer, "getUnifiedEmbeddingVersion"));
    }
  }
}

- (void)processAssetEntry:(id)a3
{
  id v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
      id v8 = [v4 asset];
      uint64_t v9 = [v8 uniqueIdentifier];
      v10 = [v4 asset];
      id v11 = [v10 url];
      uint64_t v12 = [v11 path];
      LODWORD(buf[0].value) = 138412802;
      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v7;
      LOWORD(buf[0].flags) = 2112;
      *(void *)((char *)&buf[0].flags + 2) = v9;
      HIWORD(buf[0].epoch) = 2112;
      buf[1].value = (CMTimeValue)v12;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[%@][Process][%@] Processing asset: %@", (uint8_t *)buf, 0x20u);
    }
  }
  id cancelBlock = (unsigned int (**)(void))self->_cancelBlock;
  if (cancelBlock && cancelBlock[2]())
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      CFDictionaryRef v14 = VCPLogInstance();
      os_log_type_t v15 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v14, v15))
      {
        id v16 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
        double v17 = [v4 asset];
        CMTimeRange v18 = [v17 uniqueIdentifier];
        LODWORD(buf[0].value) = 138412546;
        *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v16;
        LOWORD(buf[0].flags) = 2112;
        *(void *)((char *)&buf[0].flags + 2) = v18;
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "[%@][Process][%@] Processing canceled; skipping asset",
          (uint8_t *)buf,
          0x16u);
      }
    }
    [v4 setStatus:4294967168];
  }
  else
  {
    uint64_t v19 = 0x40040004000;
    if (DeviceHasANE()
      && +[VCPVideoCNNAnalyzer isMUBackboneEnabled])
    {
      uint64_t v19 = 0xC0040004000;
    }
    id v20 = objc_alloc((Class)MADMovieBlastDoorAnalyzer);
    long long v21 = [v4 asset];
    long long v22 = [v21 url];
    id v23 = [v20 initWithMovieURL:v22 analysisTypes:v19 cancelBlock:self->_cancelBlock];

    id v46 = 0;
    v24 = [v23 analyzeAsset:&v46];
    id v25 = v46;
    if (!v24 && (int)MediaAnalysisLogLevel() >= 4)
    {
      BOOL v26 = VCPLogInstance();
      os_log_type_t v27 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v26, v27))
      {
        os_log_type_t v44 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
        double v28 = [v4 asset];
        os_log_type_t v29 = [v28 uniqueIdentifier];
        os_log_type_t v30 = [v25 description];
        LODWORD(buf[0].value) = 138412802;
        *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v44;
        LOWORD(buf[0].flags) = 2112;
        *(void *)((char *)&buf[0].flags + 2) = v29;
        HIWORD(buf[0].epoch) = 2112;
        buf[1].value = (CMTimeValue)v30;
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "[%@][Process][%@] Movie blastdoor analysis failed to complete: %@", (uint8_t *)buf, 0x20u);
      }
    }
    BOOL v31 = +[NSMutableDictionary dictionary];
    double v32 = [v24 objectForKeyedSubscript:@"ClassificationResults"];
    [(MADSpotlightMovieAssetBatch *)self _processSceneResults:v32 andTimeRangeResults:v31 forAssetEntry:v4];

    long long v33 = [v24 objectForKeyedSubscript:@"SafetyResults"];
    [(MADSpotlightMovieAssetBatch *)self _processSafetyResults:v33 forAssetEntry:v4];

    if (v23) {
      [v23 timeRange];
    }
    else {
      memset(buf, 0, sizeof(buf));
    }
    CMTime time = buf[1];
    double Seconds = CMTimeGetSeconds(&time);
    os_log_type_t v35 = [v24 objectForKeyedSubscript:@"HumanActionClassificationResults"];
    [(MADSpotlightMovieAssetBatch *)self _processActionResults:v35 andTimeRangeResults:v31 withAssetDuration:v4 forAssetEntry:Seconds];

    uint64_t v36 = [v4 actionClassifications];
    LODWORD(v35) = v36 == 0;

    if (v35)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        os_log_type_t v39 = VCPLogInstance();
        os_log_type_t v40 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v39, v40))
        {
          id v41 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
          id v42 = [v4 asset];
          id v43 = [v42 uniqueIdentifier];
          LODWORD(buf[0].value) = 138412546;
          *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v41;
          LOWORD(buf[0].flags) = 2112;
          *(void *)((char *)&buf[0].flags + 2) = v43;
          _os_log_impl((void *)&_mh_execute_header, v39, v40, "[%@][Process][%@] Failed to generate PHDetectionTrait for human action", (uint8_t *)buf, 0x16u);
        }
      }
      [v4 setStatus:4294967278];
    }
    else
    {
      id v37 = [v24 objectForKeyedSubscript:@"VideoEmbeddingResults"];
      id v38 = [v24 objectForKeyedSubscript:@"SummarizedEmbeddingResults"];
      [(MADSpotlightMovieAssetBatch *)self _processEmbeddingResults:v37 andSummarizedEmbeddingResults:v38 forAssetEntry:v4];

      [(MADSpotlightMovieAssetBatch *)self _processTimeRangeResults:v31 forAssetEntry:v4];
      [v4 setMediaAnalysisVersion:70];
    }
  }
}

- (id)mergeVideoScenes:(id)a3 withExistingResult:(id)a4
{
  id v27 = a3;
  id v31 = a4;
  double v28 = +[NSMutableArray array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = [v31 photosSceneClassifications];
  id v6 = [v5 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v41;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v41 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if ([v9 mediaType] == (id)1 && objc_msgSend(v9, "sceneType") == (id)1) {
          [v28 addObject:v9];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v6);
  }

  v10 = +[NSMutableDictionary dictionary];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v28;
  id v11 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v37;
    do
    {
      for (unint64_t j = 0; j != v11; unint64_t j = (char *)j + 1)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(obj);
        }
        CFDictionaryRef v14 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
        os_log_type_t v15 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v14 sceneIdentifier]);
        [v10 setObject:v14 forKey:v15];
      }
      id v11 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v11);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v29 = v27;
  id v16 = [v29 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v33;
    do
    {
      for (k = 0; k != v16; k = (char *)k + 1)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v29);
        }
        uint64_t v19 = *(void **)(*((void *)&v32 + 1) + 8 * (void)k);
        id v20 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v19 sceneIdentifier]);
        long long v21 = [v10 objectForKey:v20];

        if (!v21
          || ([v31 photosSceneAnalysisVersion],
              long long v22 = objc_claimAutoreleasedReturnValue(),
              BOOL v23 = [v22 intValue] == 100,
              v22,
              !v23))
        {
          v24 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v19 sceneIdentifier]);
          [v10 setObject:v19 forKey:v24];
        }
      }
      id v16 = [v29 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v16);
  }

  id v25 = [v10 allValues];

  return v25;
}

- (id)createSearchableItemForAssetEntry:(id)a3 andImageAssetEntry:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v62 = v6;
  uint64_t v7 = [v5 asset];
  id v8 = [v7 typeIdentifier];
  uint64_t v9 = +[UTType typeWithIdentifier:v8];

  __int16 v63 = (void *)v9;
  if (!v9)
  {
    id v33 = 0;
    goto LABEL_33;
  }
  id v10 = [objc_alloc((Class)CSSearchableItemAttributeSet) initWithContentType:v9];
  id v11 = [v5 asset];
  uint64_t v12 = [v11 url];
  [v10 setContentURL:v12];

  uint64_t v13 = [v5 asset];
  CFDictionaryRef v14 = [v13 bundleIdentifier];
  [v10 setBundleID:v14];

  if (v6)
  {
    os_log_type_t v15 = [v6 attributeSet];
    id v16 = v15;
    if (v15)
    {
      uint64_t v17 = [v15 photosSceneAnalysisVersion];
      [v10 setPhotosSceneAnalysisVersion:v17];

      CMTimeRange v18 = [v16 photosSceneClassifications];
      [v10 setPhotosSceneClassifications:v18];

      uint64_t v19 = [v16 aestheticScore];
      [v10 setAestheticScore:v19];

      id v20 = [v16 contentRating];
      [v10 setContentRating:v20];

      long long v21 = [v16 textContentPieces];
      [v10 setTextContentPieces:v21];

      long long v22 = [v16 photosCharacterRecognitionAnalysisVersion];
      [v10 setPhotosCharacterRecognitionAnalysisVersion:v22];
    }
  }
  double v64 = +[NSMutableArray array];
  BOOL v23 = [v5 sceneClassifications];
  v24 = +[PHSearch spotlightSceneClassificationsFromPhotosSceneClassifications:v23 algorithmVersion:100];

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v25 = v24;
  id v26 = [v25 countByEnumeratingWithState:&v69 objects:v78 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v70;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v70 != v27) {
          objc_enumerationMutation(v25);
        }
        id v29 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        [v29 setSceneType:1];
        [v29 setMediaType:2];
      }
      id v26 = [v25 countByEnumeratingWithState:&v69 objects:v78 count:16];
    }
    while (v26);
  }

  os_log_type_t v30 = [v10 photosSceneAnalysisVersion];
  BOOL v31 = v30 == 0;

  if (v31)
  {
    id v32 = v25;
  }
  else
  {
    id v32 = [(MADSpotlightMovieAssetBatch *)self mergeVideoScenes:v25 withExistingResult:v10];
  }
  id v34 = v32;
  if (v32) {
    [v64 addObjectsFromArray:v32];
  }
  id v60 = v34;
  long long v35 = [v5 actionClassifications];
  long long v36 = +[PHSearch spotlightSceneClassificationsFromDetectionTraits:v35];

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v37 = v36;
  id v38 = [v37 countByEnumeratingWithState:&v65 objects:v77 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v66;
    do
    {
      for (unint64_t j = 0; j != v38; unint64_t j = (char *)j + 1)
      {
        if (*(void *)v66 != v39) {
          objc_enumerationMutation(v37);
        }
        long long v41 = *(void **)(*((void *)&v65 + 1) + 8 * (void)j);
        [v41 setSceneType:2];
        [v41 setMediaType:2];
      }
      id v38 = [v37 countByEnumeratingWithState:&v65 objects:v77 count:16];
    }
    while (v38);
  }

  if (v37) {
    [v64 addObjectsFromArray:v37];
  }
  id v42 = [v64 copy];
  [v10 setPhotosSceneClassifications:v42];

  long long v43 = [v5 nsfwClassifications];
  os_log_type_t v44 = +[PHSearch spotlightContentRatingFromPhotosSceneClassifications:v43 algorithmVersion:100];
  [v10 setContentRating:v44];

  os_log_type_t v45 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 mediaAnalysisVersion]);
  [v10 setPhotosMediaAnalysisVersion:v45];

  id v46 = [v5 timeRangeResults];
  [v10 setMediaAnalysisTimeRangeData:v46];

  if ([v5 embeddingVersion] == (id)4 || objc_msgSend(v5, "embeddingVersion") == (id)5)
  {
    id v47 = objc_alloc((Class)_CSEmbedding);
    unsigned __int16 v48 = (unsigned __int16)[v5 embeddingVersion];
    long long v49 = [v5 summarizedEmbeddings];
    id v50 = [v47 initWithFormat:1 dimension:1 version:v48 vectors:v49];
    [v10 setPhotoEmbedding:v50];

    id v51 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 embeddingVersion]);
    [v10 setMediaEmbeddingVersion:v51];

    id v52 = [v5 timerangeEmbeddings];
    [v10 setMediaAnalysisTimeRangeEmbeddings:v52];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_32;
    }
    id v52 = VCPLogInstance();
    os_log_type_t v57 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v52, v57))
    {
      id v58 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
      id v59 = [v5 embeddingVersion];
      *(_DWORD *)buf = 138412546;
      v74 = v58;
      __int16 v75 = 2048;
      id v76 = v59;
      _os_log_impl((void *)&_mh_execute_header, v52, v57, "[%@][Publish] Embedding version: %ld not supported, skip embedding publishing", buf, 0x16u);
    }
  }

LABEL_32:
  id v53 = objc_alloc((Class)CSSearchableItem);
  long long v54 = [v5 asset];
  __int16 v55 = [v54 uniqueIdentifier];
  id v33 = [v53 initWithUniqueIdentifier:v55 domainIdentifier:0 attributeSet:v10];

  [v33 setIsUpdate:1];
LABEL_33:

  return v33;
}

- (int)publish
{
  uint64_t v95 = 0;
  v96 = &v95;
  uint64_t v97 = 0x2020000000;
  int v98 = 0;
  long long v72 = +[NSMutableDictionary dictionary];
  unint64_t v2 = 0;
  os_log_type_t v3 = VCPLogToOSLogType[5];
  while (v2 < (unint64_t)[(NSMutableArray *)self->_assetEntries count])
  {
    id v4 = [(NSMutableArray *)self->_assetEntries objectAtIndexedSubscript:v2];
    id v5 = [v4 asset];
    id v6 = [v5 uniqueIdentifier];
    uint64_t v7 = [(NSMutableArray *)self->_imageAssetEntries objectAtIndexedSubscript:v2];
    id v8 = [v7 uniqueIdentifier];
    if ([v6 isEqualToString:v8])
    {
      uint64_t v9 = [(NSMutableArray *)self->_imageAssetEntries objectAtIndexedSubscript:v2];
    }
    else
    {
      uint64_t v9 = 0;
    }

    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      id v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, v3))
      {
        id v11 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
        uint64_t v12 = [v4 asset];
        uint64_t v13 = [v12 uniqueIdentifier];
        *(_DWORD *)buf = 138412546;
        v100 = v11;
        __int16 v101 = 2112;
        id v102 = v13;
        _os_log_impl((void *)&_mh_execute_header, v10, v3, "[%@][Publish] %@", buf, 0x16u);
      }
    }
    if ([v4 status])
    {
      if ([v4 status] != -128)
      {
        uint64_t v17 = [v4 asset];
        [v17 setStatus:3];
        goto LABEL_20;
      }
      id v14 = [v4 previousStatus];
      os_log_type_t v15 = [v4 asset];
      [v15 setStatus:v14];

      id v16 = [v4 asset];
      objc_msgSend(v16, "setAttemptCount:", objc_msgSend(v16, "attemptCount") - 1);

      uint64_t v17 = +[NSDate date];
      CMTimeRange v18 = [v4 asset];
      [v18 setNextAttemptDate:v17];
    }
    else
    {
      uint64_t v19 = [(MADSpotlightMovieAssetBatch *)self createSearchableItemForAssetEntry:v4 andImageAssetEntry:v9];
      uint64_t v17 = v19;
      if (v19)
      {
        id v20 = [v19 bundleID];
        long long v21 = [v72 objectForKeyedSubscript:v20];
        BOOL v22 = v21 == 0;

        if (v22)
        {
          BOOL v23 = +[NSMutableArray array];
          v24 = [v17 bundleID];
          [v72 setObject:v23 forKeyedSubscript:v24];
        }
        CMTimeRange v18 = [v17 bundleID];
        id v25 = [v72 objectForKeyedSubscript:v18];
        [v25 addObject:v17];
      }
      else
      {
        CMTimeRange v18 = [v4 asset];
        [v18 setStatus:3];
      }
    }

LABEL_20:
    ++v2;
  }
  group = dispatch_group_create();
  id v76 = +[NSMutableSet set];
  __int16 v75 = +[NSMutableSet set];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v26 = v72;
  id v27 = [v26 countByEnumeratingWithState:&v91 objects:v106 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v92;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v92 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = *(void *)(*((void *)&v91 + 1) + 8 * i);
        dispatch_group_enter(group);
        id v31 = [objc_alloc((Class)CSSearchableIndex) initWithName:v30 bundleIdentifier:v30];
        id v32 = [v26 objectForKeyedSubscript:v30];
        v84[0] = _NSConcreteStackBlock;
        v84[1] = 3221225472;
        v84[2] = sub_10016B930;
        v84[3] = &unk_10021F070;
        v84[4] = self;
        id v33 = v26;
        id v85 = v33;
        uint64_t v86 = v30;
        v90 = &v95;
        id v87 = v76;
        id v88 = v75;
        v89 = group;
        [v31 indexSearchableItems:v32 completionHandler:v84];
      }
      id v27 = [v33 countByEnumeratingWithState:&v91 objects:v106 count:16];
    }
    while (v27);
  }
  long long v71 = v26;

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v34 = self->_assetEntries;
  id v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v80 objects:v105 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v81;
    os_log_type_t v37 = VCPLogToOSLogType[6];
    os_log_type_t type = VCPLogToOSLogType[3];
    do
    {
      for (unint64_t j = 0; j != v35; unint64_t j = (char *)j + 1)
      {
        if (*(void *)v81 != v36) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = *(void **)(*((void *)&v80 + 1) + 8 * (void)j);
        long long v40 = objc_msgSend(v39, "asset", v71);
        long long v41 = [v40 uniqueIdentifier];
        unsigned int v42 = [v76 containsObject:v41];

        if (v42)
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            long long v43 = VCPLogInstance();
            if (os_log_type_enabled(v43, v37))
            {
              os_log_type_t v44 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
              os_log_type_t v45 = [v39 asset];
              id v46 = [v45 uniqueIdentifier];
              *(_DWORD *)buf = 138412546;
              v100 = v44;
              __int16 v101 = 2112;
              id v102 = v46;
              _os_log_impl((void *)&_mh_execute_header, v43, v37, "[%@][Publish] Mark %@ as soft failure", buf, 0x16u);
            }
          }
          id v47 = [v39 asset];
          [v47 setStatus:3];
        }
        unsigned __int16 v48 = [v39 asset];
        long long v49 = [v48 uniqueIdentifier];
        unsigned int v50 = [v75 containsObject:v49];

        if (v50)
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            id v51 = VCPLogInstance();
            if (os_log_type_enabled(v51, v37))
            {
              id v52 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
              id v53 = [v39 asset];
              long long v54 = [v53 uniqueIdentifier];
              *(_DWORD *)buf = 138412546;
              v100 = v52;
              __int16 v101 = 2112;
              id v102 = v54;
              _os_log_impl((void *)&_mh_execute_header, v51, v37, "[%@][Publish] Delete entry %@.", buf, 0x16u);
            }
          }
          __int16 v55 = [v39 asset];
          id v56 = [v55 uniqueIdentifier];
          id v79 = 0;
          unsigned __int8 v57 = +[MADManagedSpotlightEntry deleteEntryWithUniqueIdentifier:v56 error:&v79];
          id v58 = v79;

          if ((v57 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
          {
            id v59 = VCPLogInstance();
            if (os_log_type_enabled(v59, type))
            {
              id v60 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
              __int16 v61 = [v39 asset];
              int v62 = [v61 uniqueIdentifier];
              *(_DWORD *)buf = 138412802;
              v100 = v60;
              __int16 v101 = 2112;
              id v102 = v62;
              __int16 v103 = 2112;
              id v104 = v58;
              _os_log_impl((void *)&_mh_execute_header, v59, type, "[%@][Publish] %@ Failed to delete entry (%@)", buf, 0x20u);
            }
          }
        }
      }
      id v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v80 objects:v105 count:16];
    }
    while (v35);
  }

  __int16 v63 = +[MADSystemDataStore systemDataStore];
  id v78 = 0;
  unsigned int v64 = [v63 commitChangesOrRollback:&v78];
  id v65 = v78;

  if (v64)
  {
    int v66 = *((_DWORD *)v96 + 6);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      long long v67 = VCPLogInstance();
      os_log_type_t v68 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v67, v68))
      {
        long long v69 = [(MADSpotlightMovieAssetBatch *)self logPrefix];
        *(_DWORD *)buf = 138412546;
        v100 = v69;
        __int16 v101 = 2112;
        id v102 = v65;
        _os_log_impl((void *)&_mh_execute_header, v67, v68, "[%@] Publish failed during commit changes (%@)", buf, 0x16u);
      }
    }
    int v66 = objc_msgSend(v65, "code", v71);
    *((_DWORD *)v96 + 6) = v66;
  }

  _Block_object_dispose(&v95, 8);
  return v66;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commSafetyHandler, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_imageAssetEntries, 0);
  objc_storeStrong((id *)&self->_imageBackboneAnalyzer, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_computeQueue, 0);
  objc_storeStrong((id *)&self->_computeGroup, 0);
  objc_storeStrong((id *)&self->_assetEntries, 0);
}

@end