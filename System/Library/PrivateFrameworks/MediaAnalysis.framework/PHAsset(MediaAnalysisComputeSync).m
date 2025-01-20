@interface PHAsset(MediaAnalysisComputeSync)
+ (uint64_t)mad_disableComputeSync;
+ (void)vcp_requiredAnalysisForNextAnalysisStage:()MediaAnalysisComputeSync;
- (BOOL)mad_isEligibleForComputeSyncDownloadWithAnalysisTask:()MediaAnalysisComputeSync;
- (id)mad_refetchAsset;
- (uint64_t)mad_analysisStageAfterCompletingAnalysis:()MediaAnalysisComputeSync;
- (uint64_t)mad_analysisStageAfterDroppingAnalysis:()MediaAnalysisComputeSync;
- (uint64_t)mad_isEligibleForAnalysis:()MediaAnalysisComputeSync;
- (uint64_t)mad_isEligibleForComputeSync;
- (uint64_t)mad_isEligibleForComputeSyncIngestion;
- (uint64_t)mad_needsProcessingForComputeSyncWithAnalysis:()MediaAnalysisComputeSync;
@end

@implementation PHAsset(MediaAnalysisComputeSync)

+ (uint64_t)mad_disableComputeSync
{
  return 0;
}

- (uint64_t)mad_isEligibleForComputeSync
{
  if (!_os_feature_enabled_impl()
    || (objc_msgSend((id)objc_opt_class(), "mad_disableComputeSync") & 1) != 0)
  {
    return 0;
  }
  v3 = [a1 photoLibrary];
  uint64_t v2 = [v3 isSystemPhotoLibrary];

  return v2;
}

- (uint64_t)mad_isEligibleForComputeSyncIngestion
{
  {
    v3 = [a1 photoLibrary];
    char v4 = [v3 isCloudPhotoLibraryEnabled];

    -[PHAsset(MediaAnalysisComputeSync) mad_isEligibleForComputeSyncIngestion]::eligible = v4;
  }
  return -[PHAsset(MediaAnalysisComputeSync) mad_isEligibleForComputeSyncIngestion]::eligible;
}

+ (void)vcp_requiredAnalysisForNextAnalysisStage:()MediaAnalysisComputeSync
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 100:
      return &unk_1F15EE448;
    case 950:
      return &unk_1F15EE478;
    case 200:
      return &unk_1F15EE460;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = a3;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "Unknown analysis stage (%d), no analysis required", (uint8_t *)v6, 8u);
    }
  }
  return 0;
}

- (uint64_t)mad_isEligibleForAnalysis:()MediaAnalysisComputeSync
{
  int v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 1:
    case 4:
    case 6:
    case 7:
    case 8:
    case 13:
    case 14:
    case 15:
    case 17:
    case 18:
      goto LABEL_2;
    case 2:
      if ((([a1 sourceType] & 1) != 0
         || ([a1 sourceType] & 4) != 0
         || ([a1 sourceType] & 0x20) != 0)
        && ([a1 isPartOfBurst] & 1) == 0)
      {
        goto LABEL_51;
      }
      return 0;
    case 3:
      if (([a1 sourceType] & 1) == 0
        && ([a1 sourceType] & 4) == 0
        && ([a1 sourceType] & 0x20) == 0
        || ([a1 isPartOfBurst] & 1) != 0)
      {
        return 0;
      }
      v8 = [a1 photoLibrary];
      if ([v8 isSystemPhotoLibrary])
      {
        char v9 = [a1 isGuestAsset];

        if (v9) {
          return 0;
        }
      }
      else
      {
      }
      goto LABEL_51;
    case 5:
      return ([a1 sourceType] & 1) != 0
          || ([a1 sourceType] & 4) != 0
          || ([a1 sourceType] & 0x20) != 0;
    case 9:
      goto LABEL_13;
    case 10:
      if ((([a1 sourceType] & 1) != 0
         || ([a1 sourceType] & 4) != 0
         || ([a1 sourceType] & 0x20) != 0)
        && ([a1 isPartOfBurst] & 1) == 0
        && (objc_msgSend(a1, "vcp_isPano") & 1) == 0)
      {
        goto LABEL_51;
      }
      return 0;
    case 11:
      if (([a1 sourceType] & 1) == 0
        && ([a1 sourceType] & 4) == 0
        && ([a1 sourceType] & 0x20) == 0)
      {
        return 0;
      }
      if ((objc_msgSend(a1, "vcp_isLivePhoto") & 1) == 0)
      {
        uint64_t result = [a1 isVideo];
        if (!result) {
          return result;
        }
      }
      v10 = [a1 mediaAnalysisProperties];
      unint64_t v11 = [v10 mediaAnalysisVersion];

      if (v11 >= 0x27) {
        return 0;
      }
      goto LABEL_51;
    case 12:
    case 16:
      if (([a1 sourceType] & 1) == 0
        && ([a1 sourceType] & 4) == 0
        && ([a1 sourceType] & 0x20) == 0
        || ([a1 isPartOfBurst] & 1) != 0)
      {
        return 0;
      }
      uint64_t result = [a1 isPhoto];
      if (!result) {
        return result;
      }
      goto LABEL_51;
    default:
      if (a3 == 0x7FFFFFFF)
      {
LABEL_2:
        if (([a1 sourceType] & 1) != 0
          || ([a1 sourceType] & 4) != 0
          || ([a1 sourceType] & 0x20) != 0)
        {
LABEL_51:
          int v7 = [a1 isTrashed];
          return v7 ^ 1u;
        }
        return 0;
      }
LABEL_13:
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v6 = VCPLogInstance();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v12[0] = 67109120;
          v12[1] = v3;
          _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "Unknown taskID (%d), any untrashed asset will be considered eligible", (uint8_t *)v12, 8u);
        }
      }
      if (([a1 sourceType] & 1) == 0
        && ([a1 sourceType] & 4) == 0
        && ([a1 sourceType] & 0x20) == 0)
      {
        return 0;
      }
      int v7 = [a1 isTrashed];
      return v7 ^ 1u;
  }
}

- (BOOL)mad_isEligibleForComputeSyncDownloadWithAnalysisTask:()MediaAnalysisComputeSync
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = [a1 mediaAnalysisProperties];
  v6 = v5;
  if (v5)
  {
    switch(a3)
    {
      case 1:
        if ([v5 cloudAnalysisStage] != 900) {
          goto LABEL_16;
        }
        goto LABEL_20;
      case 2:
        if ([v5 cloudAnalysisStage] == 100
          || [v6 cloudAnalysisStage] == 200
          || [v6 cloudAnalysisStage] == 900)
        {
          goto LABEL_20;
        }
        goto LABEL_16;
      case 3:
      case 10:
      case 12:
        if ([v5 cloudAnalysisStage] == 200
          || [v6 cloudAnalysisStage] == 900)
        {
LABEL_20:
          BOOL v11 = 1;
        }
        else
        {
LABEL_16:
          BOOL v11 = [v6 cloudAnalysisStage] == 950;
        }
        break;
      default:
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          char v9 = VCPLogInstance();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            v10 = [a1 localIdentifier];
            int v13 = 138412546;
            v14 = v10;
            __int16 v15 = 1024;
            int v16 = a3;
            _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "[%@] Unsupported taskID (%d), ineligible for compute sync analysis download", (uint8_t *)&v13, 0x12u);
          }
        }
        goto LABEL_14;
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      int v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = [a1 localIdentifier];
        int v13 = 138412290;
        v14 = v8;
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[%@] missing MediaAnalysisProperties, ineligible for compute sync analysis download", (uint8_t *)&v13, 0xCu);
      }
    }
LABEL_14:
    BOOL v11 = 0;
  }

  return v11;
}

- (uint64_t)mad_needsProcessingForComputeSyncWithAnalysis:()MediaAnalysisComputeSync
{
  if (a3 == 10)
  {
    char v4 = [a1 characterRecognitionProperties];
    if ([v4 algorithmVersion] == 8 || objc_msgSend(v4, "algorithmVersion") == 0x7FFF)
    {
      v5 = [v4 adjustmentVersion];
      v6 = [a1 adjustmentVersion];
      uint64_t v7 = [v5 isEqualToDate:v6] ^ 1;
    }
    else
    {
      uint64_t v7 = 1;
    }

    return v7;
  }
  else
  {
    return objc_msgSend(a1, "vcp_needsProcessingForTask:");
  }
}

- (uint64_t)mad_analysisStageAfterCompletingAnalysis:()MediaAnalysisComputeSync
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v27 = [&unk_1F15EE490 countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (v27)
  {
    __int16 v28 = 0;
    uint64_t v26 = *(void *)v35;
    *(void *)&long long v5 = 138413314;
    long long v24 = v5;
    while (2)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(&unk_1F15EE490);
        }
        uint64_t v7 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        context = (void *)MEMORY[0x1C186D320]();
        __int16 v8 = [v7 intValue];
        char v9 = objc_msgSend((id)objc_opt_class(), "vcp_requiredAnalysisForNextAnalysisStage:", v8);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v46 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v31;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v31 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * j), "unsignedIntegerValue", v24);
              if (v14 != a3
                && objc_msgSend(a1, "mad_isEligibleForAnalysis:", v14)
                && objc_msgSend(a1, "mad_needsProcessingForComputeSyncWithAnalysis:", v14))
              {
                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  int v16 = VCPLogInstance();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v17 = [a1 localIdentifier];
                    VCPTaskIDDescription(a3);
                    id v18 = (id)objc_claimAutoreleasedReturnValue();
                    v19 = VCPTaskIDDescription(v14);
                    *(_DWORD *)buf = v24;
                    v39 = v17;
                    __int16 v40 = 1024;
                    int v41 = v8;
                    __int16 v42 = 1024;
                    *(_DWORD *)v43 = v28;
                    *(_WORD *)&v43[4] = 2112;
                    *(void *)&v43[6] = v18;
                    __int16 v44 = 2112;
                    v45 = v19;
                    _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_DEBUG, "[ComputeSyncStage][%@] Unable to reach next stage %d (current stage %d) after completing %@ due to incomplete %@", buf, 0x2Cu);
                  }
                }
                int v15 = 0;
                __int16 v25 = v28;
                goto LABEL_22;
              }
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v46 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
        int v15 = 1;
LABEL_22:

        if (!v15) {
          return v25;
        }
        __int16 v28 = v8;
      }
      uint64_t v27 = [&unk_1F15EE490 countByEnumeratingWithState:&v34 objects:v47 count:16];
      __int16 v28 = v8;
      if (v27) {
        continue;
      }
      break;
    }
  }
  else
  {
    __int16 v8 = 0;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v20 = VCPLogInstance();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = [a1 localIdentifier];
      v22 = VCPTaskIDDescription(a3);
      *(_DWORD *)buf = 138412802;
      v39 = v21;
      __int16 v40 = 1024;
      int v41 = v8;
      __int16 v42 = 2112;
      *(void *)v43 = v22;
      _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEBUG, "[ComputeSyncStage][%@] Reaching stage %d after completing %@", buf, 0x1Cu);
    }
  }
  return v8;
}

- (uint64_t)mad_analysisStageAfterDroppingAnalysis:()MediaAnalysisComputeSync
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v31 = [&unk_1F15EE4A8 countByEnumeratingWithState:&v38 objects:v51 count:16];
  if (v31)
  {
    int v32 = 0;
    uint64_t v30 = *(void *)v39;
    *(void *)&long long v6 = 138413314;
    long long v28 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(&unk_1F15EE4A8);
        }
        __int16 v8 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        context = (void *)MEMORY[0x1C186D320]();
        int v9 = [v8 intValue];
        int v10 = (__int16)v9;
        uint64_t v11 = objc_msgSend((id)objc_opt_class(), "vcp_requiredAnalysisForNextAnalysisStage:", (__int16)v9);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v50 count:16];
        if (v13)
        {
          int v29 = v3;
          uint64_t v14 = *(void *)v35;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v35 != v14) {
                objc_enumerationMutation(v12);
              }
              uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * j), "unsignedIntegerValue", v28);
              if (v16 == a3)
              {
                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  id v18 = VCPLogInstance();
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                  {
                    v19 = [a1 localIdentifier];
                    v20 = VCPTaskIDDescription(a3);
                    *(_DWORD *)buf = 138412802;
                    v43 = v19;
                    __int16 v44 = 1024;
                    int v45 = (__int16)v32;
                    __int16 v46 = 2112;
                    *(void *)v47 = v20;
                    _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_DEBUG, "[ComputeSyncStage][%@] Falling to stage %d after dropping %@", buf, 0x1Cu);
                  }
LABEL_24:
                }
LABEL_25:
                int v17 = 0;
                int v3 = v32;
                goto LABEL_26;
              }
              if (objc_msgSend(a1, "mad_isEligibleForAnalysis:", v16)
                && objc_msgSend(a1, "mad_needsProcessingForComputeSyncWithAnalysis:", v16))
              {
                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  id v18 = VCPLogInstance();
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                  {
                    v21 = [a1 localIdentifier];
                    VCPTaskIDDescription(a3);
                    id v22 = (id)objc_claimAutoreleasedReturnValue();
                    v23 = VCPTaskIDDescription(v16);
                    *(_DWORD *)buf = v28;
                    v43 = v21;
                    __int16 v44 = 1024;
                    int v45 = v10;
                    __int16 v46 = 1024;
                    *(_DWORD *)v47 = (__int16)v32;
                    *(_WORD *)&v47[4] = 2112;
                    *(void *)&v47[6] = v22;
                    __int16 v48 = 2112;
                    v49 = v23;
                    _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_DEBUG, "[ComputeSyncStage][%@] Unable to reach next stage %d (current stage %d) after dropping %@ due to incomplete %@", buf, 0x2Cu);
                  }
                  goto LABEL_24;
                }
                goto LABEL_25;
              }
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v50 count:16];
            if (v13) {
              continue;
            }
            break;
          }
          int v17 = 1;
          int v32 = v9;
          int v3 = v29;
        }
        else
        {
          int v17 = 1;
          int v32 = v9;
        }
LABEL_26:

        if (!v17)
        {
          LOWORD(v32) = v3;
          return (__int16)v32;
        }
      }
      uint64_t v31 = [&unk_1F15EE4A8 countByEnumeratingWithState:&v38 objects:v51 count:16];
      if (v31) {
        continue;
      }
      break;
    }
  }
  else
  {
    LOWORD(v32) = 0;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    long long v24 = VCPLogInstance();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      __int16 v25 = [a1 localIdentifier];
      uint64_t v26 = VCPTaskIDDescription(a3);
      *(_DWORD *)buf = 138412802;
      v43 = v25;
      __int16 v44 = 1024;
      int v45 = (__int16)v32;
      __int16 v46 = 2112;
      *(void *)v47 = v26;
      _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_DEBUG, "[ComputeSyncStage][%@] Reaching stage %d after dropping %@", buf, 0x1Cu);
    }
  }
  return (__int16)v32;
}

- (id)mad_refetchAsset
{
  v30[6] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F390A8]);
  int v3 = [a1 photoLibrary];
  [v2 setPhotoLibrary:v3];

  uint64_t v4 = *MEMORY[0x1E4F39540];
  v30[0] = *MEMORY[0x1E4F394F0];
  v30[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F39430];
  v30[2] = *MEMORY[0x1E4F39478];
  v30[3] = v5;
  uint64_t v6 = *MEMORY[0x1E4F394D8];
  v30[4] = *MEMORY[0x1E4F39578];
  v30[5] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:6];
  [v2 setFetchPropertySets:v7];

  __int16 v8 = VCPSignPostLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  int v10 = VCPSignPostLog();
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v25) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "MADRefetchAsset", "", (uint8_t *)&v25, 2u);
  }

  id v12 = (void *)MEMORY[0x1E4F38EC0];
  uint64_t v13 = [a1 localIdentifier];
  int v29 = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  int v15 = [v12 fetchAssetsWithLocalIdentifiers:v14 options:v2];

  uint64_t v16 = VCPSignPostLog();
  int v17 = v16;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v25) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v17, OS_SIGNPOST_INTERVAL_END, v9, "MADRefetchAsset", "", (uint8_t *)&v25, 2u);
  }

  if ([v15 count])
  {
    if ((unint64_t)[v15 count] >= 2 && (int)MediaAnalysisLogLevel() >= 4)
    {
      id v18 = VCPLogInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [a1 localIdentifier];
        int v20 = [v15 count];
        int v25 = 138412546;
        uint64_t v26 = v19;
        __int16 v27 = 1024;
        int v28 = v20;
        _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_DEFAULT, "[%@] Re-fetched %d assets, using first one", (uint8_t *)&v25, 0x12u);
      }
    }
    v21 = [v15 objectAtIndexedSubscript:0];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v22 = VCPLogInstance();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = [a1 localIdentifier];
        int v25 = 138412290;
        uint64_t v26 = v23;
        _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_ERROR, "[%@] Failed to re-fetch asset to obtain updated properties", (uint8_t *)&v25, 0xCu);
      }
    }
    v21 = 0;
  }

  return v21;
}

@end