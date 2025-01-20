@interface PHAsset(MediaAnalysisOCRProcessing)
+ (double)vcp_ocrGatingThreshold;
- (BOOL)vcp_isDownloadGated;
- (id)vcp_passedOCRGating;
- (uint64_t)vcp_needsOCRProcessing;
- (uint64_t)vcp_ocrMajorDimensionForResource:()MediaAnalysisOCRProcessing;
@end

@implementation PHAsset(MediaAnalysisOCRProcessing)

- (uint64_t)vcp_needsOCRProcessing
{
  v2 = [a1 characterRecognitionProperties];
  if ([v2 algorithmVersion] < 8 || objc_msgSend(v2, "algorithmVersion") == 0x7FFF)
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = [v2 adjustmentVersion];
    v5 = [a1 adjustmentVersion];
    uint64_t v3 = [v4 isEqualToDate:v5] ^ 1;
  }
  return v3;
}

- (BOOL)vcp_isDownloadGated
{
  v1 = [a1 characterRecognitionProperties];
  BOOL v2 = [v1 algorithmVersion] == 0x7FFF;

  return v2;
}

+ (double)vcp_ocrGatingThreshold
{
  return 0.11;
}

- (id)vcp_passedOCRGating
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [a1 sceneAnalysisProperties];
  int v3 = [v2 sceneAnalysisVersion];
  if (VCPPhotosSceneProcessingVersionInternal() != v3)
  {
    __int16 v4 = [v2 sceneAnalysisVersion];
    if (*MEMORY[0x1E4F8D118] != v4) {
      goto LABEL_16;
    }
  }
  v5 = [v2 sceneAnalysisTimestamp];
  v6 = [a1 adjustmentVersion];
  int v7 = [v5 isEqualToDate:v6];

  if (!v7)
  {
LABEL_16:
    if ((int)MediaAnalysisLogLevel() < 7)
    {
      v14 = 0;
      goto LABEL_27;
    }
    v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v15 = [a1 localIdentifier];
      *(_DWORD *)buf = 138412290;
      v29 = v15;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEBUG, "[%@] Asset scene properties unavailable or out-of-date", buf, 0xCu);
    }
    v14 = 0;
    goto LABEL_26;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v8 = objc_msgSend(a1, "sceneClassifications", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v12 extendedSceneIdentifier] == 2147482063)
        {
          [v12 confidence];
          double v17 = v16;
          objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_ocrGatingThreshold");
          double v19 = v18;
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v20 = VCPLogInstance();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              v21 = [a1 localIdentifier];
              [v12 confidence];
              *(_DWORD *)buf = 138412802;
              v29 = v21;
              __int16 v30 = 2048;
              uint64_t v31 = v22;
              __int16 v32 = 1024;
              BOOL v33 = v17 >= v19;
              _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEBUG, "[%@] Text Confidence: %0.2f Passed Gating: %d", buf, 0x1Cu);
            }
          }
          v14 = [NSNumber numberWithBool:v17 >= v19];
          goto LABEL_26;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v34 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v13 = [a1 localIdentifier];
      *(_DWORD *)buf = 138412290;
      v29 = v13;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEBUG, "[%@] Text Confidence: 0.00f Passed Gating: 0 [Absent]", buf, 0xCu);
    }
    v14 = (void *)MEMORY[0x1E4F1CC28];
LABEL_26:

    goto LABEL_27;
  }
  v14 = (void *)MEMORY[0x1E4F1CC28];
LABEL_27:

  return v14;
}

- (uint64_t)vcp_ocrMajorDimensionForResource:()MediaAnalysisOCRProcessing
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 pixelWidth];
  int v6 = [v4 pixelHeight];
  int v7 = v6;
  if (v5 && v6) {
    goto LABEL_9;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [a1 localIdentifier];
      int v15 = 138413058;
      double v16 = v9;
      __int16 v17 = 1024;
      int v18 = [v4 type];
      __int16 v19 = 1024;
      int v20 = v5;
      __int16 v21 = 1024;
      int v22 = v7;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "[%@] Resource (%d) has invalid dimensions (%dx%d); falling back to asset",
        (uint8_t *)&v15,
        0x1Eu);
    }
  }
  int v5 = [a1 pixelWidth];
  int v10 = [a1 pixelHeight];
  int v7 = v10;
  if (v5 && v10)
  {
LABEL_9:
    uint64_t v11 = objc_msgSend(a1, "vcp_targetMajorDimensionForImageWithWidth:height:andMinPreferredMinorDimension:", v5, v7, 1210);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = [a1 localIdentifier];
        int v15 = 138412802;
        double v16 = v13;
        __int16 v17 = 1024;
        int v18 = v5;
        __int16 v19 = 1024;
        int v20 = v7;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "[%@] Asset has invalid dimensions (%dx%d)", (uint8_t *)&v15, 0x18u);
      }
    }
    uint64_t v11 = 0;
  }

  return v11;
}

@end