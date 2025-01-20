@interface PHAsset(MediaAnalysis)
+ (float)mad_sceneConfidenceThresholdForTask:()MediaAnalysis;
+ (id)vcp_fetchOptionsForLibrary:()MediaAnalysis forTaskID:;
+ (uint64_t)vcp_longMovieDurationThreshold;
+ (uint64_t)vcp_shortMovieDurationThreshold;
- (BOOL)vcp_needsImageCaptionProcessing;
- (BOOL)vcp_needsVideoCaptionProcessing;
- (__CFString)vcp_typeDescription;
- (double)vcp_originalSize;
- (id)vcp_modificationDate;
- (uint64_t)vcp_eligibleForVideoDownload:()MediaAnalysis;
- (uint64_t)vcp_hasAdjustments:()MediaAnalysis;
- (uint64_t)vcp_isLongMovie;
- (uint64_t)vcp_needsFullAnalysisProcessing:()MediaAnalysis;
- (uint64_t)vcp_needsProcessingForTask:()MediaAnalysis;
- (uint64_t)vcp_targetMajorDimensionForImageWithWidth:()MediaAnalysis height:andMinPreferredMinorDimension:;
- (unint64_t)vcp_majorDimensionForResource:()MediaAnalysis withTargetResolution:;
@end

@implementation PHAsset(MediaAnalysis)

+ (float)mad_sceneConfidenceThresholdForTask:()MediaAnalysis
{
  if (a3 == 10)
  {
    objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_ocrGatingThreshold");
    return v5;
  }
  else
  {
    float result = 0.0;
    if (a3 == 3)
    {
      v4 = (void *)MEMORY[0x1E4F38EC0];
      objc_msgSend(v4, "mad_peopleThreshold", 0.0);
    }
  }
  return result;
}

+ (uint64_t)vcp_longMovieDurationThreshold
{
  return 60;
}

+ (uint64_t)vcp_shortMovieDurationThreshold
{
  return 1;
}

- (__CFString)vcp_typeDescription
{
  if ([a1 mediaType] == 1)
  {
    if (([a1 mediaSubtypes] & 8) != 0) {
      return @"Live Photo";
    }
    if ([a1 mediaSubtypes]) {
      return @"Pano Photo";
    }
    if (([a1 mediaSubtypes] & 4) != 0) {
      return @"Screenshot";
    }
    if (([a1 mediaSubtypes] & 2) != 0) {
      return @"HDR Photo";
    }
    char v2 = [a1 mediaSubtypes];
    v3 = @"SDOF Photo";
    v4 = @"Photo";
    BOOL v5 = (v2 & 0x10) == 0;
  }
  else
  {
    if ([a1 mediaType] != 2) {
      return @"Unknown";
    }
    if (([a1 mediaSubtypes] & 0x20000) != 0) {
      return @"Slow-mo Movie";
    }
    uint64_t v6 = [a1 mediaSubtypes];
    v3 = @"Timelapse Movie";
    v4 = @"Movie";
    BOOL v5 = (v6 & 0x40000) == 0;
  }
  if (v5) {
    return v4;
  }
  else {
    return v3;
  }
}

- (double)vcp_originalSize
{
  double v2 = (double)(unint64_t)[a1 pixelWidth];
  [a1 pixelHeight];
  return v2;
}

- (id)vcp_modificationDate
{
  double v2 = [a1 adjustmentTimestamp];
  if (v2)
  {
    v3 = [a1 adjustmentTimestamp];
  }
  else
  {
    v4 = [a1 creationDate];
    if (v4) {
      [a1 creationDate];
    }
    else {
    v3 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
  }
  return v3;
}

- (uint64_t)vcp_eligibleForVideoDownload:()MediaAnalysis
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([a1 isVideo] & 1) != 0 || (objc_msgSend(a1, "vcp_isLivePhoto"))
    && (objc_msgSend(a1, "vcp_isVideoSlowmo") & 1) == 0)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E4F38F68], "vcp_allAcceptableResourcesForAsset:", a1);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v6 = objc_msgSend(v4, "vcp_smallMovieDerivativeResource");
    if (v6)
    {
      if ([a1 isVideo])
      {
        unint64_t v7 = [v6 fileSize];
        if (v7 > +[VCPDownloadManager maxSizeBytes])
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v8 = VCPLogInstance();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            {
              v9 = [a1 localIdentifier];
              int v13 = 138412290;
              v14 = v9;
              _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEBUG, "[%@] File size exceeds streaming threshold; skipping",
                (uint8_t *)&v13,
                0xCu);
            }
LABEL_16:

            goto LABEL_17;
          }
          goto LABEL_17;
        }
        if (!v7 && objc_msgSend(a1, "vcp_isLongMovie"))
        {
          if ((int)MediaAnalysisLogLevel() < 7) {
            goto LABEL_17;
          }
          v8 = VCPLogInstance();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            v11 = [a1 localIdentifier];
            int v13 = 138412290;
            v14 = v11;
            _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEBUG, "[%@] Duration exceeds streaming threshold; skipping",
              (uint8_t *)&v13,
              0xCu);
          }
          goto LABEL_16;
        }
      }
      uint64_t v5 = 1;
      goto LABEL_24;
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = [a1 localIdentifier];
        int v13 = 138412290;
        v14 = v10;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEFAULT, "[%@] Asset has no small video derivative; skipping",
          (uint8_t *)&v13,
          0xCu);
      }
      goto LABEL_16;
    }
LABEL_17:
    uint64_t v5 = 0;
LABEL_24:

    goto LABEL_25;
  }
  uint64_t v5 = 0;
LABEL_25:

  return v5;
}

+ (id)vcp_fetchOptionsForLibrary:()MediaAnalysis forTaskID:
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = a4 - 1;
  if (unint64_t)(a4 - 1) < 0x10 && ((0x8EBFu >> v6))
  {
    uint64_t v8 = qword_1BC283578[v6];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      unint64_t v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v70 = a4;
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "Unknown VCPTaskID (%lu); redirect to VCPTaskID_MediaAnalysis",
          buf,
          0xCu);
      }
    }
    uint64_t v8 = 1;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F390A8]);
  [v9 setIncludeAssetSourceTypes:5];
  if (v8 > 11)
  {
    if (v8 == 12 || v8 == 16)
    {
LABEL_16:
      v10 = objc_msgSend(MEMORY[0x1E4F28F60], "vcp_imagesPredicate:", 0);
      [v9 setPredicate:v10];
      goto LABEL_17;
    }
  }
  else
  {
    if ((unint64_t)(v8 - 2) < 2) {
      goto LABEL_18;
    }
    if (v8 == 10)
    {
LABEL_12:
      v10 = objc_msgSend(MEMORY[0x1E4F28F60], "vcp_nonPanoPredicate:", 0);
      [v9 setPredicate:v10];
LABEL_17:

      goto LABEL_18;
    }
  }
  [v9 setIncludeAllBurstAssets:1];
  switch(v8)
  {
    case 10:
      goto LABEL_12;
    case 11:
      v10 = objc_msgSend(MEMORY[0x1E4F28F60], "vcp_fullAnalysisPredatesVersionInternalPredicate:", 39);
      v49 = objc_msgSend(MEMORY[0x1E4F28F60], "vcp_livePhotosPredicate:", 1);
      v42 = objc_msgSend(MEMORY[0x1E4F28F60], "vcp_moviesPredicate:", 1);
      v43 = (void *)MEMORY[0x1E4F28BA0];
      v68[0] = v49;
      v68[1] = v42;
      v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
      v45 = [v43 orPredicateWithSubpredicates:v44];

      v46 = (void *)MEMORY[0x1E4F28BA0];
      v67[0] = v10;
      v67[1] = v45;
      v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
      v48 = [v46 andPredicateWithSubpredicates:v47];
      [v9 setInternalPredicate:v48];

      goto LABEL_17;
    case 12:
    case 16:
      goto LABEL_16;
    default:
      break;
  }
LABEL_18:
  if ([MEMORY[0x1E4F39220] isMultiLibraryModeEnabled])
  {
    v11 = v5;
    if (!v5)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F39220], "vcp_defaultPhotoLibrary");
    }
    [v9 setPhotoLibrary:v11];
    if (!v5) {
  }
    }
  [v9 setIncludeGuestAssets:1];
  switch(v8)
  {
    case 1:
      uint64_t v12 = *MEMORY[0x1E4F394F0];
      v66[0] = *MEMORY[0x1E4F394D8];
      v66[1] = v12;
      uint64_t v13 = *MEMORY[0x1E4F39540];
      v66[2] = *MEMORY[0x1E4F39500];
      v66[3] = v13;
      uint64_t v14 = *MEMORY[0x1E4F39478];
      v66[4] = *MEMORY[0x1E4F39548];
      v66[5] = v14;
      uint64_t v15 = *MEMORY[0x1E4F39578];
      v66[6] = *MEMORY[0x1E4F39430];
      v66[7] = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:8];
      [v9 setFetchPropertySets:v16];

      if (objc_msgSend(v5, "vcp_isSyndicationLibrary"))
      {
        uint64_t v65 = *MEMORY[0x1E4F39460];
        v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
        [v9 addFetchPropertySets:v17];
        goto LABEL_39;
      }
      goto LABEL_40;
    case 2:
      uint64_t v18 = *MEMORY[0x1E4F39540];
      v64[0] = *MEMORY[0x1E4F394F0];
      v64[1] = v18;
      uint64_t v19 = *MEMORY[0x1E4F39478];
      v64[2] = *MEMORY[0x1E4F39490];
      v64[3] = v19;
      uint64_t v20 = *MEMORY[0x1E4F39578];
      v64[4] = *MEMORY[0x1E4F39430];
      v64[5] = v20;
      v64[6] = *MEMORY[0x1E4F394D8];
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:7];
      [v9 setFetchPropertySets:v17];
      goto LABEL_39;
    case 3:
      if ([v5 isSystemPhotoLibrary]) {
        [v9 setIncludeGuestAssets:0];
      }
      uint64_t v21 = *MEMORY[0x1E4F39478];
      v63[0] = *MEMORY[0x1E4F394F0];
      v63[1] = v21;
      uint64_t v22 = *MEMORY[0x1E4F39430];
      v63[2] = *MEMORY[0x1E4F39540];
      v63[3] = v22;
      uint64_t v23 = *MEMORY[0x1E4F394D8];
      v63[4] = *MEMORY[0x1E4F39578];
      v63[5] = v23;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:6];
      [v9 setFetchPropertySets:v17];
      goto LABEL_39;
    case 4:
      uint64_t v24 = *MEMORY[0x1E4F394F0];
      v61[0] = *MEMORY[0x1E4F394D8];
      v61[1] = v24;
      uint64_t v25 = *MEMORY[0x1E4F39540];
      v61[2] = *MEMORY[0x1E4F39500];
      v61[3] = v25;
      uint64_t v26 = *MEMORY[0x1E4F39478];
      v61[4] = *MEMORY[0x1E4F39548];
      v61[5] = v26;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:6];
      [v9 setFetchPropertySets:v17];
      goto LABEL_39;
    case 5:
      [v9 setIncludeTrashedAssets:1];
      goto LABEL_32;
    case 6:
      uint64_t v28 = *MEMORY[0x1E4F394F0];
      v60[0] = *MEMORY[0x1E4F394D8];
      v60[1] = v28;
      uint64_t v29 = *MEMORY[0x1E4F39540];
      v60[2] = *MEMORY[0x1E4F39500];
      v60[3] = v29;
      uint64_t v30 = *MEMORY[0x1E4F39478];
      v60[4] = *MEMORY[0x1E4F39548];
      v60[5] = v30;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:6];
      [v9 setFetchPropertySets:v17];
      goto LABEL_39;
    case 8:
      uint64_t v31 = *MEMORY[0x1E4F39478];
      v62[0] = *MEMORY[0x1E4F394F0];
      v62[1] = v31;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
      [v9 setFetchPropertySets:v17];
      goto LABEL_39;
    case 10:
      uint64_t v32 = *MEMORY[0x1E4F394F0];
      v59[0] = *MEMORY[0x1E4F39430];
      v59[1] = v32;
      uint64_t v33 = *MEMORY[0x1E4F39478];
      v59[2] = *MEMORY[0x1E4F39540];
      v59[3] = v33;
      uint64_t v34 = *MEMORY[0x1E4F394D8];
      v59[4] = *MEMORY[0x1E4F39578];
      v59[5] = v34;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:6];
      [v9 setFetchPropertySets:v17];
      goto LABEL_39;
    case 11:
      uint64_t v35 = *MEMORY[0x1E4F394F0];
      v58[0] = *MEMORY[0x1E4F394D8];
      v58[1] = v35;
      v58[2] = *MEMORY[0x1E4F39478];
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:3];
      [v9 setFetchPropertySets:v17];
      goto LABEL_39;
    case 12:
      uint64_t v36 = *MEMORY[0x1E4F39540];
      v52[0] = *MEMORY[0x1E4F394F0];
      v52[1] = v36;
      uint64_t v37 = *MEMORY[0x1E4F39578];
      uint64_t v53 = *MEMORY[0x1E4F394D8];
      uint64_t v54 = v37;
      uint64_t v38 = *MEMORY[0x1E4F39430];
      uint64_t v55 = *MEMORY[0x1E4F39478];
      uint64_t v56 = v38;
      uint64_t v57 = v53;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:7];
      [v9 setFetchPropertySets:v17];
      goto LABEL_39;
    case 16:
      uint64_t v39 = *MEMORY[0x1E4F39540];
      v51[0] = *MEMORY[0x1E4F394F0];
      v51[1] = v39;
      uint64_t v40 = *MEMORY[0x1E4F39578];
      v51[2] = *MEMORY[0x1E4F394D8];
      v51[3] = v40;
      v51[4] = *MEMORY[0x1E4F39478];
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:5];
      [v9 setFetchPropertySets:v17];
      goto LABEL_39;
    default:
LABEL_32:
      uint64_t v27 = *MEMORY[0x1E4F39478];
      v50[0] = *MEMORY[0x1E4F394F0];
      v50[1] = v27;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
      [v9 setFetchPropertySets:v17];
LABEL_39:

LABEL_40:
      return v9;
  }
}

- (uint64_t)vcp_hasAdjustments:()MediaAnalysis
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend(a1, "vcp_isVideoSlowmo"))
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "type", (void)v10) == 6)
          {
            uint64_t v6 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    uint64_t v6 = [a1 hasAdjustments];
  }

  return v6;
}

- (uint64_t)vcp_targetMajorDimensionForImageWithWidth:()MediaAnalysis height:andMinPreferredMinorDimension:
{
  double v7 = (double)a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a3 >= a4) {
    int v8 = a4;
  }
  else {
    int v8 = a3;
  }
  if ((double)v8 > v7)
  {
    int v10 = vcvtmd_s64_f64(log2((double)v8 / v7));
    int v11 = 1 << (v10 - 1);
    if (!v10) {
      int v11 = 0;
    }
    signed int v12 = ((v11 + a3) >> v10) & 0xFFFFFFFE;
    signed int v13 = ((v11 + a4) >> v10) & 0xFFFFFFFE;
    if (v12 * v13 >= 3657831)
    {
      double v14 = (double)a3;
      signed int v15 = (int)(sqrt((double)a3 * 3048192.0 / (double)a4) + 0.5) & 0xFFFFFFFE;
      signed int v16 = (int)(sqrt((double)a4 * 3048192.0 / v14) + 0.5) & 0xFFFFFFFE;
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v17 = VCPLogInstance();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v18 = [a1 localIdentifier];
          int v26 = 138412802;
          uint64_t v27 = v18;
          __int16 v28 = 1024;
          signed int v29 = v15;
          __int16 v30 = 1024;
          signed int v31 = v16;
          _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEBUG, "[%@] Processing image at scaled resolution (%dx%d)", (uint8_t *)&v26, 0x18u);
        }
      }
      if (v15 <= v16) {
        return v16;
      }
      else {
        return v15;
      }
    }
    int v20 = MediaAnalysisLogLevel();
    if (v10 >= 1)
    {
      if (v20 >= 7)
      {
        uint64_t v21 = VCPLogInstance();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v22 = [a1 localIdentifier];
          int v26 = 138412802;
          uint64_t v27 = v22;
          __int16 v28 = 1024;
          signed int v29 = v12;
          __int16 v30 = 1024;
          signed int v31 = v13;
          _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEBUG, "[%@] Processing image at subsampled resolution (%dx%d)", (uint8_t *)&v26, 0x18u);
        }
      }
      if (v12 <= v13) {
        return v13;
      }
      else {
        return v12;
      }
    }
    if (v20 >= 7)
    {
      uint64_t v24 = VCPLogInstance();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v25 = [a1 localIdentifier];
        int v26 = 138412802;
        uint64_t v27 = v25;
        __int16 v28 = 1024;
        signed int v29 = a3;
        __int16 v30 = 1024;
        signed int v31 = a4;
        _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_DEBUG, "[%@] Processing image at full resolution (%dx%d)", (uint8_t *)&v26, 0x18u);
      }
    }
  }
  return 0;
}

- (unint64_t)vcp_majorDimensionForResource:()MediaAnalysis withTargetResolution:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = v6;
  if (!a4)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v27 = VCPLogInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        __int16 v28 = [a1 localIdentifier];
        int v36 = 138412546;
        uint64_t v37 = v28;
        __int16 v38 = 1024;
        int v39 = 0;
        _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "[%@] Invalid target resolution (%d)", (uint8_t *)&v36, 0x12u);
      }
    }
    goto LABEL_46;
  }
  int v8 = [v6 pixelWidth];
  int v9 = [v7 pixelHeight];
  int v10 = v9;
  if (!v8 || !v9)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        signed int v12 = [a1 localIdentifier];
        int v36 = 138413058;
        uint64_t v37 = v12;
        __int16 v38 = 1024;
        int v39 = [v7 type];
        __int16 v40 = 1024;
        int v41 = v8;
        __int16 v42 = 1024;
        int v43 = v10;
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "[%@] Resource (%d) has invalid dimensions (%dx%d); falling back to asset",
          (uint8_t *)&v36,
          0x1Eu);
      }
    }
    int v8 = [a1 pixelWidth];
    int v13 = [a1 pixelHeight];
    int v10 = v13;
    if (!v8 || !v13)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        signed int v29 = VCPLogInstance();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          signed int v31 = [a1 localIdentifier];
          int v36 = 138412802;
          uint64_t v37 = v31;
          __int16 v38 = 1024;
          int v39 = v8;
          __int16 v40 = 1024;
          int v41 = v10;
          _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_ERROR, "[%@] Asset has invalid dimensions (%dx%d)", (uint8_t *)&v36, 0x18u);
        }
        goto LABEL_45;
      }
      goto LABEL_46;
    }
  }
  if (v8 * v10 <= a4)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      signed int v29 = VCPLogInstance();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        __int16 v30 = [a1 localIdentifier];
        int v36 = 138412802;
        uint64_t v37 = v30;
        __int16 v38 = 1024;
        int v39 = v8;
        __int16 v40 = 1024;
        int v41 = v10;
        _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_DEBUG, "[%@] Processing image at full resolution (%dx%d)", (uint8_t *)&v36, 0x18u);
      }
      goto LABEL_45;
    }
LABEL_46:
    unint64_t v26 = 0;
    goto LABEL_47;
  }
  double v14 = (double)v8;
  double v15 = (double)v10;
  double v16 = (double)a4;
  unint64_t v17 = vcvtmd_u64_f64(log2(sqrt((double)v10 * (double)v8 / ((double)a4 * 0.9))));
  uint64_t v18 = 1 << (v17 - 1);
  if (!v17) {
    uint64_t v18 = 0;
  }
  unint64_t v19 = ((unint64_t)(v18 + v8) >> v17) & 0xFFFFFFFFFFFFFFFELL;
  unint64_t v20 = ((unint64_t)(v18 + v10) >> v17) & 0xFFFFFFFFFFFFFFFELL;
  if (v19 * v20 > (unint64_t)(v16 * 6.0 / 5.0))
  {
    unsigned int v21 = (int)(sqrt(v16 * v14 / v15) + 0.5) & 0xFFFFFFFE;
    unsigned int v22 = (int)(sqrt(v16 * v15 / v14) + 0.5) & 0xFFFFFFFE;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v24 = [a1 localIdentifier];
        int v36 = 138412802;
        uint64_t v37 = v24;
        __int16 v38 = 1024;
        int v39 = v21;
        __int16 v40 = 1024;
        int v41 = v22;
        _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEBUG, "[%@] Processing image at scaled resolution (%dx%d)", (uint8_t *)&v36, 0x18u);
      }
    }
    if (v21 <= v22) {
      signed int v25 = v22;
    }
    else {
      signed int v25 = v21;
    }
    unint64_t v26 = v25;
    goto LABEL_47;
  }
  if (!v17)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      signed int v29 = VCPLogInstance();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v34 = [a1 localIdentifier];
        int v36 = 138412802;
        uint64_t v37 = v34;
        __int16 v38 = 1024;
        int v39 = v8;
        __int16 v40 = 1024;
        int v41 = v10;
        _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_DEBUG, "[%@] Processing image at full resolution (%dx%d)", (uint8_t *)&v36, 0x18u);
      }
LABEL_45:

      goto LABEL_46;
    }
    goto LABEL_46;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v32 = VCPLogInstance();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = [a1 localIdentifier];
      int v36 = 138412802;
      uint64_t v37 = v33;
      __int16 v38 = 1024;
      int v39 = v19;
      __int16 v40 = 1024;
      int v41 = v20;
      _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_DEBUG, "[%@] Processing image at subsampled resolution (%dx%d)", (uint8_t *)&v36, 0x18u);
    }
  }
  if (v19 <= v20) {
    unint64_t v26 = v20;
  }
  else {
    unint64_t v26 = v19;
  }
LABEL_47:

  return v26;
}

- (uint64_t)vcp_needsFullAnalysisProcessing:()MediaAnalysis
{
  id v5 = [a1 mediaAnalysisProperties];
  if (!objc_msgSend(a1, "mad_isNonLivePhotoImage"))
  {
    if (a3)
    {
      if (!+[VCPVideoCNNAnalyzer isMUBackboneEnabled])
      {
        uint64_t v10 = 0;
        goto LABEL_24;
      }
      char v11 = objc_msgSend(a1, "vcp_needsImageCaptionProcessing");
      if (v5) {
        char v12 = v11;
      }
      else {
        char v12 = 1;
      }
      if ((v12 & 1) == 0 && (int)[v5 mediaAnalysisImageVersion] >= 70) {
        goto LABEL_7;
      }
    }
    else if ((objc_msgSend(a1, "vcp_needsImageCaptionProcessing") & 1) == 0)
    {
      char v13 = objc_msgSend(a1, "vcp_needsVideoCaptionProcessing");
      char v14 = v5 ? v13 : 1;
      if ((v14 & 1) == 0
        && (unint64_t)[v5 mediaAnalysisVersion] >= 0x46
        && (int)[v5 mediaAnalysisImageVersion] >= 70)
      {
        goto LABEL_7;
      }
    }
LABEL_23:
    uint64_t v10 = 1;
    goto LABEL_24;
  }
  char v6 = objc_msgSend(a1, "vcp_needsImageCaptionProcessing");
  if (v5) {
    char v7 = v6;
  }
  else {
    char v7 = 1;
  }
  if ((v7 & 1) != 0 || (int)[v5 mediaAnalysisImageVersion] < 70) {
    goto LABEL_23;
  }
LABEL_7:
  int v8 = [v5 mediaAnalysisTimeStamp];
  int v9 = objc_msgSend(a1, "vcp_modificationDate");
  uint64_t v10 = [v8 isEqualToDate:v9] ^ 1;

LABEL_24:
  return v10;
}

- (BOOL)vcp_needsImageCaptionProcessing
{
  if (+[VCPVideoCaptionAnalyzer mode] != 1) {
    return 0;
  }
  double v2 = [a1 mediaAnalysisProperties];
  v3 = v2;
  if (v2) {
    BOOL v4 = (int)[v2 imageCaptionVersion] < 70;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)vcp_needsVideoCaptionProcessing
{
  if (+[VCPVideoCaptionAnalyzer mode] != 1) {
    return 0;
  }
  double v2 = [a1 mediaAnalysisProperties];
  if (objc_msgSend(a1, "mad_isNonLivePhotoImage"))
  {
    BOOL v3 = 0;
  }
  else if (v2)
  {
    BOOL v3 = (int)[v2 videoCaptionVersion] < 70;
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

- (uint64_t)vcp_needsProcessingForTask:()MediaAnalysis
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 1:
      uint64_t v5 = 0;
      goto LABEL_5;
    case 2:
      return objc_msgSend(a1, "vcp_needSceneProcessing");
    case 3:
      return objc_msgSend(a1, "vcp_needsFaceProcessing");
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 11:
      goto LABEL_8;
    case 10:
      return objc_msgSend(a1, "vcp_needsOCRProcessing");
    case 12:
      if (objc_msgSend(a1, "vcp_needsVisualSearchProcessing")) {
        return 1;
      }
      return objc_msgSend(a1, "vcp_needsStickerGatingProcessing");
    default:
      if (a3 == 255)
      {
        uint64_t v5 = 1;
LABEL_5:
        return objc_msgSend(a1, "vcp_needsFullAnalysisProcessing:", v5);
      }
      else
      {
LABEL_8:
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          char v7 = VCPLogInstance();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            int v8 = VCPTaskIDDescription(a3);
            int v9 = 138412290;
            uint64_t v10 = v8;
            _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEFAULT, "-[PHAsset vcp_needsProcessingForTask] not implemented for %@", (uint8_t *)&v9, 0xCu);
          }
        }
        return 0;
      }
  }
}

- (uint64_t)vcp_isLongMovie
{
  uint64_t result = [a1 isVideo];
  if (result)
  {
    [a1 duration];
    return v3 > (double)(unint64_t)objc_msgSend((id)objc_opt_class(), "vcp_longMovieDurationThreshold");
  }
  return result;
}

@end