@interface VCPAnalysisProgressQuery
+ (BOOL)_screenProgress;
+ (id)_processedPredicateForTaskID:(unint64_t)a3;
+ (int)_queryProgressDetailExpress:(id *)a3 photoLibrary:(id)a4 taskID:(unint64_t)a5 cancelOrExtendTimeoutBlock:(id)a6;
+ (int)_scanPhotoLibrary:(id)a3 taskID:(unint64_t)a4 statistics:(id *)a5 cancelOrExtendTimeoutBlock:(id)a6;
+ (int)queryAnalysisProgress:(float *)a3 photoLibrary:(id)a4 taskID:(unint64_t)a5 cancelOrExtendTimeoutBlock:(id)a6;
+ (int)queryCachedFaceAnalysisProgress:(id *)a3 photoLibrary:(id)a4;
+ (int)queryProgressDetail:(id *)a3 photoLibrary:(id)a4 taskID:(unint64_t)a5 cancelOrExtendTimeoutBlock:(id)a6;
+ (unint64_t)_countAnalysisWithAssetBatch:(id)a3 taskID:(unint64_t)a4;
+ (unint64_t)_countFaceAnalysisWithAssetBatch:(id)a3;
+ (unint64_t)_countFailuresWithAssetBatch:(id)a3 database:(id)a4 taskID:(unint64_t)a5;
+ (unint64_t)_countOCRAnalysisWithAssetBatch:(id)a3;
+ (unint64_t)_countPECAnalysisWithAssetBatch:(id)a3;
+ (unint64_t)_countSceneAnalysisWithAssetBatch:(id)a3;
+ (unint64_t)_countVisualSearchAnalysisWithAssetBatch:(id)a3;
+ (unint64_t)_vipStatusForPhotoLibrary:(id)a3 type:(unint64_t)a4;
+ (unint64_t)countAllAssetsForTaskID:(unint64_t)a3 photoLibrary:(id)a4 error:(id *)a5;
+ (unint64_t)countProcessedAssetsForTaskID:(unint64_t)a3 photoLibrary:(id)a4 error:(id *)a5;
+ (void)_countMediaAnalysisWithAssetBatch:(id)a3 database:(id)a4 analyzedCount:(unint64_t *)a5 completeAnalyzedCount:(unint64_t *)a6 partialAnalyzedCount:(unint64_t *)a7;
@end

@implementation VCPAnalysisProgressQuery

+ (unint64_t)countAllAssetsForTaskID:(unint64_t)a3 photoLibrary:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  objc_msgSend(MEMORY[0x1E4F38EC0], "mad_sceneConfidenceThresholdForTask:", a3);
  float v9 = v8;
  uint64_t v10 = PHMediaProcessingTaskIDForVCPTaskID(a3);
  id v17 = 0;
  *(float *)&double v11 = v9;
  unint64_t v12 = [v7 countOfAllAssetsForMediaProcessingTaskID:v10 priority:0 sceneConfidenceThreshold:&v17 error:v11];
  id v13 = v17;
  if (v13)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = VCPTaskIDDescription(a3);
        *(_DWORD *)buf = 138412802;
        v19 = v15;
        __int16 v20 = 2048;
        double v21 = v9;
        __int16 v22 = 2112;
        id v23 = v13;
        _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "[%@] Failed to query total asset count - scene threshold %.2f - %@", buf, 0x20u);
      }
    }
    unint64_t v12 = 0;
    if (a5) {
      *a5 = (id)[v13 copy];
    }
  }

  return v12;
}

+ (unint64_t)countProcessedAssetsForTaskID:(unint64_t)a3 photoLibrary:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  float v8 = objc_msgSend(MEMORY[0x1E4F39158], "mad_sharedVersionProviderWithPhotoLibrary:", v7);
  objc_msgSend(MEMORY[0x1E4F38EC0], "mad_sceneConfidenceThresholdForTask:", a3);
  int v10 = v9;
  uint64_t v11 = PHMediaProcessingTaskIDForVCPTaskID(a3);
  id v18 = 0;
  LODWORD(v12) = v10;
  unint64_t v13 = [v7 countOfProcessedAssetsForMediaProcessingTaskID:v11 priority:0 algorithmVersion:v8 sceneConfidenceThreshold:&v18 error:v12];
  id v14 = v18;
  if (v14)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = VCPTaskIDDescription(a3);
        *(_DWORD *)buf = 138412546;
        __int16 v20 = v16;
        __int16 v21 = 2112;
        id v22 = v14;
        _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "[%@] Failed to fetch processed assets - %@", buf, 0x16u);
      }
    }
    unint64_t v13 = 0;
    if (a5) {
      *a5 = (id)[v14 copy];
    }
  }

  return v13;
}

+ (void)_countMediaAnalysisWithAssetBatch:(id)a3 database:(id)a4 analyzedCount:(unint64_t *)a5 completeAnalyzedCount:(unint64_t *)a6 partialAnalyzedCount:(unint64_t *)a7
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v33 = a4;
  v39 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v8);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = [*(id *)(*((void *)&v44 + 1) + 8 * i) localIdentifier];
        [v39 addObject:v13];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v10);
  }

  v38 = [v33 queryAnalysisPropertiesForAssets:v39];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v9;
  uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v14)
  {
    unint64_t v34 = 0;
    unint64_t v35 = 0;
    unint64_t v15 = 0;
    uint64_t v37 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v41 != v37) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v40 + 1) + 8 * j);
        id v18 = (void *)MEMORY[0x1C186D320]();
        v19 = [v17 localIdentifier];
        __int16 v20 = [v38 objectForKeyedSubscript:v19];

        int v21 = objc_msgSend(v17, "vcp_needsFullAnalysisProcessing:", 0);
        if (v20)
        {
          id v22 = objc_msgSend(v20, "vcp_dateModified");
          uint64_t v23 = objc_msgSend(v17, "vcp_modificationDate");
          if ([v22 isEqualToDate:v23])
          {
            BOOL v24 = objc_msgSend(v20, "vcp_version") == 70;

            if (v24)
            {
              uint64_t v25 = objc_msgSend(v17, "vcp_fullAnalysisTypes");
              unint64_t v26 = objc_msgSend(v20, "vcp_types") & v25 & 0xFFFFFFFFFFEFFFFFLL;
              BOOL v27 = v26 == (v25 & 0xFFFFFFFFFFEFFFFFLL);
              if (v26 == (v25 & 0xFFFFFFFFFFEFFFFFLL)) {
                unint64_t v28 = v35;
              }
              else {
                unint64_t v28 = v35 + 1;
              }
              unint64_t v29 = v34;
              if (v27) {
                unint64_t v29 = v34 + 1;
              }
              unint64_t v34 = v29;
              unint64_t v35 = v28;
            }
          }
          else
          {
          }
        }

        v15 += v21 ^ 1u;
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v14);
  }
  else
  {
    unint64_t v34 = 0;
    unint64_t v35 = 0;
    unint64_t v15 = 0;
  }

  *a5 = v15;
  *a6 = v34;
  *a7 = v35;
}

+ (unint64_t)_countFaceAnalysisWithAssetBatch:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a3;
  unint64_t v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "faceAdjustmentVersion", (void)v13);
        uint64_t v10 = [v8 adjustmentVersion];
        unsigned int v11 = [v9 isEqualToDate:v10];

        v4 += v11;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v4;
}

+ (unint64_t)_countSceneAnalysisWithAssetBatch:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  unint64_t v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v4 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "vcp_needSceneProcessing", (void)v9) ^ 1;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return v4;
}

+ (unint64_t)_countOCRAnalysisWithAssetBatch:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  unint64_t v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v4 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "vcp_needsOCRProcessing", (void)v9) ^ 1;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return v4;
}

+ (unint64_t)_countVisualSearchAnalysisWithAssetBatch:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  unint64_t v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v8, "vcp_needsVisualSearchProcessing", (void)v10) & 1) == 0) {
          v4 += objc_msgSend(v8, "vcp_needsStickerGatingProcessing") ^ 1;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v4;
}

+ (unint64_t)_countPECAnalysisWithAssetBatch:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  unint64_t v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v4 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "vcp_needsPECProcessing", (void)v9) ^ 1;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return v4;
}

+ (unint64_t)_countAnalysisWithAssetBatch:(id)a3 taskID:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((uint64_t)a4 <= 9)
  {
    if (a4 == 2)
    {
      uint64_t v7 = [a1 _countSceneAnalysisWithAssetBatch:v6];
      goto LABEL_12;
    }
    if (a4 == 3)
    {
      uint64_t v7 = [a1 _countFaceAnalysisWithAssetBatch:v6];
      goto LABEL_12;
    }
  }
  else
  {
    switch(a4)
    {
      case 0xAuLL:
        uint64_t v7 = [a1 _countOCRAnalysisWithAssetBatch:v6];
        goto LABEL_12;
      case 0xCuLL:
        uint64_t v7 = [a1 _countVisualSearchAnalysisWithAssetBatch:v6];
        goto LABEL_12;
      case 0x10uLL:
        uint64_t v7 = [a1 _countPECAnalysisWithAssetBatch:v6];
LABEL_12:
        unint64_t v8 = v7;
        goto LABEL_13;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    long long v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 134217984;
      unint64_t v12 = a4;
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "Query progress: unsupport taskID %lu", (uint8_t *)&v11, 0xCu);
    }
  }
  unint64_t v8 = 0;
LABEL_13:

  return v8;
}

+ (unint64_t)_countFailuresWithAssetBatch:(id)a3 database:(id)a4 taskID:(unint64_t)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v9 = v8;
  if (a5 <= 0x10)
  {
    if (((1 << a5) & 0x1140C) != 0)
    {
      long long v10 = [v8 queryFailedProcessingStatusFromAssets:v7 forTaskID:a5];
      uint64_t v11 = [v10 count];
LABEL_4:
      unint64_t v12 = v11;

      goto LABEL_5;
    }
    if (a5 == 1)
    {
      long long v10 = [v8 blacklistedLocalIdentifiersFromAssets:v7];
      uint64_t v11 = [v10 count];
      goto LABEL_4;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v14 = VCPLogInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 134217984;
      unint64_t v16 = a5;
      _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "Query progress: unsupport taskID %lu", (uint8_t *)&v15, 0xCu);
    }
  }
  unint64_t v12 = 0;
LABEL_5:

  return v12;
}

+ (unint64_t)_vipStatusForPhotoLibrary:(id)a3 type:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_msgSend(v5, "vcp_vipModelLastGenerationDateForVIPType:", a4);
  id v7 = [MEMORY[0x1E4F1C9C8] now];
  [v7 timeIntervalSinceDate:v6];
  double v9 = v8;

  long long v10 = objc_msgSend(v5, "vcp_vipModelFilepathForVIPType:", a4);
  uint64_t v11 = +[VCPFaceIDModel loadVIPModelAtPath:v10 withVIPType:a4 error:0];

  uint64_t v12 = 2;
  if (v9 >= (double)0x15180uLL) {
    uint64_t v12 = 1;
  }
  if (v11) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = 0;
  }

  return v13;
}

+ (int)_scanPhotoLibrary:(id)a3 taskID:(unint64_t)a4 statistics:(id *)a5 cancelOrExtendTimeoutBlock:(id)a6
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  v64 = (unsigned int (**)(void))a6;
  v55 = a5;
  if (a5)
  {
    unint64_t v63 = a4;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      double v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        long long v10 = VCPTaskIDDescription(a4);
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v63;
        __int16 v74 = 2112;
        v75 = v10;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "Query progress: scan library for %lu - %@", buf, 0x16u);
      }
      a4 = v63;
    }
    v61 = +[VCPDatabaseReader databaseForPhotoLibrary:v58];
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    v56 = objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_fetchOptionsForLibrary:forTaskID:", v58, a4);
    uint64_t v12 = mach_absolute_time();
    unint64_t v13 = VCPSignPostLog();
    os_signpost_id_t v14 = os_signpost_id_generate(v13);

    int v15 = VCPSignPostLog();
    unint64_t v16 = v15;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "VCPAnalysisProgressQueryScanPhotoLibraryFetch", "", buf, 2u);
    }

    uint64_t v17 = [MEMORY[0x1E4F38EC0] fetchAssetsWithOptions:v56];
    uint64_t v18 = VCPSignPostLog();
    v19 = v18;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v19, OS_SIGNPOST_INTERVAL_END, v14, "VCPAnalysisProgressQueryScanPhotoLibraryFetch", "", buf, 2u);
    }

    if (v12)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v59 = 0;
    uint64_t v60 = 0;
    uint64_t v22 = 0;
    unint64_t v23 = 0;
    while (1)
    {
      if (v23 >= [v17 count])
      {
        if ([v11 count])
        {
          if (v64 && v64[2]())
          {
            if ((int)MediaAnalysisLogLevel() < 5)
            {
LABEL_30:
              int v31 = -128;
              goto LABEL_53;
            }
            id v33 = VCPLogInstance();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_DEFAULT, "Cancelled during _scanPhotoLibrary", buf, 2u);
            }
            int v31 = -128;
LABEL_52:

LABEL_53:
LABEL_54:

            goto LABEL_55;
          }
          v21 += [v11 count];
          v22 += [a1 _countFailuresWithAssetBatch:v11 database:v61 taskID:v63];
          if (v63 == 1)
          {
            *(void *)buf = 0;
            uint64_t v65 = 0;
            uint64_t v66 = 0;
            [a1 _countMediaAnalysisWithAssetBatch:v11 database:v61 analyzedCount:buf completeAnalyzedCount:&v66 partialAnalyzedCount:&v65];
            v20 += *(void *)buf;
            v59 += v66;
            v60 += v65;
          }
          else
          {
            v20 += objc_msgSend(a1, "_countAnalysisWithAssetBatch:taskID:", v11);
          }
        }
        unint64_t v34 = (void *)MEMORY[0x1E4F1CA60];
        v71[0] = @"failed";
        unint64_t v35 = [NSNumber numberWithUnsignedInteger:v22];
        v72[0] = v35;
        v71[1] = @"processed";
        v36 = [NSNumber numberWithUnsignedInteger:v20];
        v72[1] = v36;
        v71[2] = @"total-allowed";
        uint64_t v37 = [NSNumber numberWithUnsignedInteger:v21];
        v72[2] = v37;
        v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:3];
        id v57 = [v34 dictionaryWithDictionary:v38];

        if (v63 == 1)
        {
          uint64_t v42 = [v58 countOfAllAssetsForMediaProcessingTaskID:PHMediaProcessingTaskIDForVCPTaskID(1) priority:2 sceneConfidenceThreshold:0 error:0.0];
          uint64_t v43 = PHMediaProcessingTaskIDForVCPTaskID(1);
          long long v44 = objc_msgSend(MEMORY[0x1E4F39158], "mad_sharedVersionProviderWithPhotoLibrary:", v58);
          uint64_t v45 = [v58 countOfProcessedAssetsForMediaProcessingTaskID:v43 priority:2 algorithmVersion:v44 sceneConfidenceThreshold:0 error:0.0];

          uint64_t v46 = [v58 countOfAllAssetsForMediaProcessingTaskID:PHMediaProcessingTaskIDForVCPTaskID(1) priority:4 sceneConfidenceThreshold:0 error:0.0];
          uint64_t v47 = PHMediaProcessingTaskIDForVCPTaskID(1);
          v48 = objc_msgSend(MEMORY[0x1E4F39158], "mad_sharedVersionProviderWithPhotoLibrary:", v58);
          uint64_t v49 = [v58 countOfProcessedAssetsForMediaProcessingTaskID:v47 priority:4 algorithmVersion:v48 sceneConfidenceThreshold:0 error:0.0];

          v67[0] = @"full-analysis-complete-processed";
          v39 = [NSNumber numberWithUnsignedInteger:v59];
          v68[0] = v39;
          v67[1] = @"full-analysis-partial-processed";
          long long v40 = [NSNumber numberWithUnsignedInteger:v60];
          v68[1] = v40;
          v67[2] = @"full-analysis-livephoto-processed";
          long long v41 = [NSNumber numberWithUnsignedInteger:v45];
          v68[2] = v41;
          v67[3] = @"full-analysis-livephoto-count";
          uint64_t v50 = [NSNumber numberWithUnsignedInteger:v42];
          v68[3] = v50;
          v67[4] = @"full-analysis-video-processed";
          v51 = [NSNumber numberWithUnsignedInteger:v49];
          v68[4] = v51;
          v67[5] = @"full-analysis-video-count";
          v52 = [NSNumber numberWithUnsignedInteger:v46];
          v68[5] = v52;
          v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:6];
          [v57 addEntriesFromDictionary:v53];

LABEL_50:
        }
        else if (v63 == 3)
        {
          v69[0] = @"pet-vip-status";
          v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "_vipStatusForPhotoLibrary:type:", v58, 1));
          v70[0] = v39;
          v69[1] = @"person-vip-status";
          long long v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "_vipStatusForPhotoLibrary:type:", v58, 0));
          v70[1] = v40;
          long long v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:2];
          [v57 addEntriesFromDictionary:v41];
          goto LABEL_50;
        }
        id v33 = v57;
        int v31 = 0;
        id *v55 = v33;
        goto LABEL_52;
      }
      BOOL v24 = (void *)MEMORY[0x1C186D320]();
      uint64_t v25 = [v17 objectAtIndexedSubscript:v23];
      [v11 addObject:v25];

      if ((unint64_t)[v11 count] >= 0x3E8)
      {
        if (v64 && v64[2]())
        {
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            unint64_t v26 = VCPLogInstance();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_DEFAULT, "Cancelled during _scanPhotoLibrary", buf, 2u);
            }
          }
          char v27 = 0;
          goto LABEL_29;
        }
        uint64_t v28 = [v11 count];
        uint64_t v29 = [a1 _countFailuresWithAssetBatch:v11 database:v61 taskID:v63];
        if (v63 == 1)
        {
          *(void *)buf = 0;
          uint64_t v65 = 0;
          uint64_t v66 = 0;
          [a1 _countMediaAnalysisWithAssetBatch:v11 database:v61 analyzedCount:buf completeAnalyzedCount:&v66 partialAnalyzedCount:&v65];
          uint64_t v30 = *(void *)buf;
          v59 += v66;
          v60 += v65;
        }
        else
        {
          uint64_t v30 = objc_msgSend(a1, "_countAnalysisWithAssetBatch:taskID:", v11);
        }
        [v11 removeAllObjects];
        v21 += v28;
        v22 += v29;
        v20 += v30;
      }
      char v27 = 1;
LABEL_29:
      ++v23;
      if ((v27 & 1) == 0) {
        goto LABEL_30;
      }
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v32 = VCPLogInstance();
    v61 = v32;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_ERROR, "Query progress: output parameter statistics must be non-nil", buf, 2u);
    }
    int v31 = -50;
    goto LABEL_54;
  }
  int v31 = -50;
LABEL_55:

  return v31;
}

+ (id)_processedPredicateForTaskID:(unint64_t)a3
{
  if ((uint64_t)a3 > 11)
  {
    if (a3 == 12)
    {
      id v5 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v10 = VCPPhotosVisualSearchAlgorithmVersion();
      uint64_t v11 = 1;
      unint64_t v4 = @"mediaAnalysisAttributes.visualSearchAttributes.algorithmVersion >= %d && mediaAnalysisAttributes.visualSearchAttributes.stickerConfidenceAlgorithmVersion >= %d";
LABEL_13:
      id v3 = v5;
      goto LABEL_14;
    }
    if (a3 == 16)
    {
      objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"mediaAnalysisAttributes.vaAnalysisVersion >= %d", 5, v11, v12);
      goto LABEL_15;
    }
LABEL_10:
    BOOL v6 = +[VCPVideoCNNAnalyzer isMUBackboneEnabled];
    id v5 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v7 = VCPPhotosSceneProcessingVersionInternal();
    if (v6)
    {
      uint64_t v11 = (__int16)*MEMORY[0x1E4F8D118];
      uint64_t v12 = 70;
      uint64_t v10 = v7;
      unint64_t v4 = @"additionalAttributes.sceneAnalysisVersion  >= %d &&  additionalAttributes.sceneAnalysisVersion  != %d &&  mediaAnalysisAttributes.imageEmbeddingVersion >= %d ";
    }
    else
    {
      uint64_t v10 = v7;
      uint64_t v11 = (__int16)*MEMORY[0x1E4F8D118];
      unint64_t v4 = @"additionalAttributes.sceneAnalysisVersion  >= %d &&  additionalAttributes.sceneAnalysisVersion  != %d ";
    }
    goto LABEL_13;
  }
  if (a3 != 3)
  {
    if (a3 == 10)
    {
      objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"mediaAnalysisAttributes.characterRecognitionAttributes.algorithmVersion >= %d", 8, v11, v12);
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  id v3 = (void *)MEMORY[0x1E4F28F60];
  unint64_t v4 = @"faceAdjustmentVersion != nil";
LABEL_14:
  objc_msgSend(v3, "predicateWithFormat:", v4, v10, v11, v12);
  double v8 = LABEL_15:;
  return v8;
}

+ (int)_queryProgressDetailExpress:(id *)a3 photoLibrary:(id)a4 taskID:(unint64_t)a5 cancelOrExtendTimeoutBlock:(id)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v55 = (unsigned int (**)(void))a6;
  if (a5 <= 0x10 && ((1 << a5) & 0x1140C) != 0)
  {
    uint64_t v10 = mach_absolute_time();
    uint64_t v11 = VCPSignPostLog();
    os_signpost_id_t v12 = os_signpost_id_generate(v11);

    unint64_t v13 = VCPSignPostLog();
    os_signpost_id_t v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "VCPAnalysisProgressQueryExpressPathFetchTotalCount", "", buf, 2u);
    }

    uint64_t v15 = objc_msgSend(v9, "vcp_assetCountForTaskID:", a5);
    unint64_t v16 = VCPSignPostLog();
    uint64_t v17 = v16;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v17, OS_SIGNPOST_INTERVAL_END, v12, "VCPAnalysisProgressQueryExpressPathFetchTotalCount", "", buf, 2u);
    }

    if (v10)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    v53 = [a1 _processedPredicateForTaskID:a5];
    uint64_t v18 = mach_absolute_time();
    v19 = VCPSignPostLog();
    os_signpost_id_t v20 = os_signpost_id_generate(v19);

    uint64_t v21 = VCPSignPostLog();
    uint64_t v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "VCPAnalysisProgressQueryExpressPathFetchProcessedCount", "", buf, 2u);
    }

    uint64_t v23 = objc_msgSend(v9, "vcp_processedAssetCountForTaskID:", a5);
    BOOL v24 = VCPSignPostLog();
    uint64_t v25 = v24;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v25, OS_SIGNPOST_INTERVAL_END, v20, "VCPAnalysisProgressQueryExpressPathFetchProcessedCount", "", buf, 2u);
    }

    if (v18)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    unint64_t v26 = +[VCPDatabaseReader databaseForPhotoLibrary:v9];
    uint64_t v27 = [v26 countForTaskID:a5 withProcessingStatus:2];
    uint64_t v28 = [v26 countForTaskID:a5 withProcessingStatus:7];
    uint64_t v29 = [v26 countForTaskID:a5 withProcessingStatus:3];
    uint64_t v30 = [v26 countForTaskID:a5 withProcessingStatus:4];
    if (v28 + v27 + v29 + v30 >= (unint64_t)(v15 - v23)) {
      uint64_t v31 = v15 - v23;
    }
    else {
      uint64_t v31 = v28 + v27 + v29 + v30;
    }
    v32 = (void *)MEMORY[0x1E4F1CA60];
    v58[0] = @"failed";
    id v33 = [NSNumber numberWithUnsignedInteger:v31];
    v59[0] = v33;
    v58[1] = @"processed";
    unint64_t v34 = [NSNumber numberWithUnsignedInteger:v23];
    v59[1] = v34;
    v58[2] = @"total-allowed";
    unint64_t v35 = [NSNumber numberWithUnsignedInteger:v15];
    v59[2] = v35;
    v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:3];
    uint64_t v37 = [v32 dictionaryWithDictionary:v36];

    if (a5 == 3)
    {
      if (v55 && v55[2]())
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v38 = VCPLogInstance();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v38, OS_LOG_TYPE_DEFAULT, "Cancelled during _queryProgressDetailExpress", buf, 2u);
          }
LABEL_34:

          goto LABEL_35;
        }
        goto LABEL_35;
      }
      uint64_t v39 = objc_msgSend(v9, "vcp_assetCountForTaskID:withPriority:", 3, 1);
      if (v55 && v55[2]())
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v38 = VCPLogInstance();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v38, OS_LOG_TYPE_DEFAULT, "Cancelled during _queryProgressDetailExpress", buf, 2u);
          }
          goto LABEL_34;
        }
LABEL_35:
        int v40 = -128;
LABEL_38:

        goto LABEL_39;
      }
      uint64_t v41 = objc_msgSend(v9, "vcp_processedAssetCountForTaskID:withPriority:", 3, 1);
      uint64_t v42 = [v26 valueForKey:@"NumberOfProcessedAssetsAfterPromoterForPhotosFaceProcessing"];
      uint64_t v43 = [v26 valueForKey:@"VCPKeyValueLastPromoterTimestamp"];
      v56[0] = @"prioritized-processed";
      v52 = [NSNumber numberWithUnsignedInteger:v41];
      v57[0] = v52;
      v56[1] = @"prioritized-total-allowed";
      long long v44 = [NSNumber numberWithUnsignedInteger:v39];
      v57[1] = v44;
      v56[2] = @"pet-vip-status";
      uint64_t v45 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "_vipStatusForPhotoLibrary:type:", v9, 1));
      v57[2] = v45;
      v56[3] = @"person-vip-status";
      uint64_t v46 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "_vipStatusForPhotoLibrary:type:", v9, 0));
      v57[3] = v46;
      v56[4] = @"processed-assets-with-promoter";
      uint64_t v47 = [NSNumber numberWithInteger:v42];
      v57[4] = v47;
      v56[5] = @"last-promoter-timestamp";
      v48 = [NSNumber numberWithLongLong:v43];
      v57[5] = v48;
      uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:6];
      [v37 addEntriesFromDictionary:v49];
    }
    int v40 = 0;
    *a3 = v37;
    goto LABEL_38;
  }
  if ((int)MediaAnalysisLogLevel() < 3)
  {
    int v40 = -50;
    goto LABEL_40;
  }
  v51 = VCPLogInstance();
  v53 = v51;
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v61 = a5;
    _os_log_impl(&dword_1BBEDA000, v51, OS_LOG_TYPE_ERROR, "Query progress: unsupported taskID (%lu)", buf, 0xCu);
  }
  int v40 = -50;
LABEL_39:

LABEL_40:
  return v40;
}

+ (BOOL)_screenProgress
{
  return 0;
}

+ (int)queryProgressDetail:(id *)a3 photoLibrary:(id)a4 taskID:(unint64_t)a5 cancelOrExtendTimeoutBlock:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  os_signpost_id_t v12 = v11;
  if (!v11 || !(*((unsigned int (**)(id))v11 + 2))(v11))
  {
    uint64_t v16 = mach_absolute_time();
    uint64_t v17 = VCPSignPostLog();
    os_signpost_id_t v18 = os_signpost_id_generate(v17);

    v19 = VCPSignPostLog();
    os_signpost_id_t v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "VCPAnalysisProgressQueryProgressDetail", "", buf, 2u);
    }

    if (a5 <= 0x10)
    {
      if (((1 << a5) & 0x1140C) != 0)
      {
        if (([a1 _screenProgress] & 1) == 0)
        {
          int v15 = [a1 _queryProgressDetailExpress:a3 photoLibrary:v10 taskID:a5 cancelOrExtendTimeoutBlock:v12];
          goto LABEL_27;
        }
LABEL_16:
        id v26 = 0;
        int v15 = +[VCPAnalysisProgressQuery _scanPhotoLibrary:v10 taskID:a5 statistics:&v26 cancelOrExtendTimeoutBlock:v12];
        uint64_t v21 = v26;
        unint64_t v13 = v21;
        if (!v15)
        {
          unint64_t v13 = v21;
          *a3 = v13;
          uint64_t v22 = VCPSignPostLog();
          uint64_t v23 = v22;
          if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v23, OS_SIGNPOST_INTERVAL_END, v18, "VCPAnalysisProgressQueryProgressDetail", "", buf, 2u);
          }

          if (v16)
          {
            mach_absolute_time();
            VCPPerformance_LogMeasurement();
          }
        }
        goto LABEL_26;
      }
      if (a5 == 1) {
        goto LABEL_16;
      }
    }
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      int v15 = -50;
      goto LABEL_27;
    }
    unint64_t v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      BOOL v24 = VCPTaskIDDescription(a5);
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = v24;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "Query progress: unsupported taskID (%@)", buf, 0xCu);
    }
    int v15 = -50;
    goto LABEL_26;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    unint64_t v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      os_signpost_id_t v14 = VCPTaskIDDescription(a5);
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = v14;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEFAULT, "[%@] Cancelled during queryProgressDetail", buf, 0xCu);
    }
    int v15 = -128;
LABEL_26:

    goto LABEL_27;
  }
  int v15 = -128;
LABEL_27:

  return v15;
}

+ (int)queryAnalysisProgress:(float *)a3 photoLibrary:(id)a4 taskID:(unint64_t)a5 cancelOrExtendTimeoutBlock:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  uint64_t v27 = mach_absolute_time();
  os_signpost_id_t v12 = VCPSignPostLog();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);

  os_signpost_id_t v14 = VCPSignPostLog();
  int v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VCPAnalysisProgressQueryProgress", "", buf, 2u);
  }

  id v29 = 0;
  int v16 = [a1 queryProgressDetail:&v29 photoLibrary:v10 taskID:a5 cancelOrExtendTimeoutBlock:v11];
  id v17 = v29;
  os_signpost_id_t v18 = v17;
  if (!v16)
  {
    v19 = [v17 objectForKeyedSubscript:@"processed"];
    unint64_t v20 = [v19 unsignedIntegerValue];

    uint64_t v21 = [v18 objectForKeyedSubscript:@"total-allowed"];
    unint64_t v22 = [v21 unsignedIntegerValue];

    if (v22) {
      float v23 = (float)v20 / (float)v22;
    }
    else {
      float v23 = 1.0;
    }
    *a3 = v23;
    BOOL v24 = VCPSignPostLog();
    uint64_t v25 = v24;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)uint64_t v28 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v25, OS_SIGNPOST_INTERVAL_END, v13, "VCPAnalysisProgressQueryProgress", "", v28, 2u);
    }

    if (v27)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
  }

  return v16;
}

+ (int)queryCachedFaceAnalysisProgress:(id *)a3 photoLibrary:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v31 = a4;
  if (a3)
  {
    uint64_t v30 = mach_absolute_time();
    id v5 = VCPSignPostLog();
    os_signpost_id_t v6 = os_signpost_id_generate(v5);

    uint64_t v7 = VCPSignPostLog();
    double v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "VCPAnalysisProgressQueryCachedFaceAnalysisProgress", "", buf, 2u);
    }

    id v9 = +[VCPDatabaseReader databaseForPhotoLibrary:v31];
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 valueForKey:@"NumberOfAssetsAllowedForPhotosFaceProcessing"];
      if (v11)
      {
        uint64_t v29 = [v10 valueForKey:@"NumberOfAssetsAnalyzedForPhotosFaceProcessing"];
        uint64_t v12 = [v10 valueForKey:@"NumberOfPrioritizedAssetsAnalyzedForPhotosFaceProcessing"];
        uint64_t v13 = [v10 valueForKey:@"NumberOfPrioritizedAssetsAllowedForPhotosFaceProcessing"];
        uint64_t v14 = [v10 valueForKey:@"NumberOfProcessedAssetsAfterPromoterForPhotosFaceProcessing"];
        uint64_t v27 = [v10 valueForKey:@"VCPKeyValueLastPromoterTimestamp"];
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          int v15 = VCPLogInstance();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v35 = v29;
            __int16 v36 = 2048;
            uint64_t v37 = v11;
            _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEBUG, "[CachedProgress] Query cached face progress: %ld out of %ld", buf, 0x16u);
          }
        }
        v32[0] = @"prioritized-processed";
        int v16 = objc_msgSend(NSNumber, "numberWithInteger:", v12, v27);
        v33[0] = v16;
        v32[1] = @"prioritized-total-allowed";
        id v17 = [NSNumber numberWithInteger:v13];
        v33[1] = v17;
        v32[2] = @"processed";
        os_signpost_id_t v18 = [NSNumber numberWithInteger:v29];
        v33[2] = v18;
        v32[3] = @"total-allowed";
        v19 = [NSNumber numberWithInteger:v11];
        v33[3] = v19;
        v32[4] = @"processed-assets-with-promoter";
        unint64_t v20 = [NSNumber numberWithInteger:v14];
        v33[4] = v20;
        v32[5] = @"last-promoter-timestamp";
        uint64_t v21 = [NSNumber numberWithLongLong:v28];
        v33[5] = v21;
        *a3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:6];

        unint64_t v22 = VCPSignPostLog();
        float v23 = v22;
        if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v23, OS_SIGNPOST_INTERVAL_END, v6, "VCPAnalysisProgressQueryCachedFaceAnalysisProgress", "", buf, 2u);
        }

        if (v30)
        {
          mach_absolute_time();
          VCPPerformance_LogMeasurement();
        }
        goto LABEL_30;
      }
      if ((int)MediaAnalysisLogLevel() < 3)
      {
LABEL_30:
        int v24 = 0;
        goto LABEL_32;
      }
      uint64_t v25 = VCPLogInstance();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_ERROR, "[CachedProgress] No cached values", buf, 2u);
      }
      int v24 = 0;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v24 = -18;
        goto LABEL_32;
      }
      uint64_t v25 = VCPLogInstance();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_ERROR, "[CachedProgress] Failed to open MediaAnalysis database", buf, 2u);
      }
      int v24 = -18;
    }

LABEL_32:
    goto LABEL_33;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "[CachedProgress] Nil input parameter 'progress'", buf, 2u);
    }
    int v24 = -50;
    goto LABEL_32;
  }
  int v24 = -50;
LABEL_33:

  return v24;
}

@end