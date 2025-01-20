@interface PHAsset(FullAnalysis)
+ (uint64_t)vcp_fullAnalysisGenerativeModelAdditionalTypes;
+ (uint64_t)vcp_fullAnalysisImageOnlyTypes;
+ (unint64_t)vcp_fullAnalysisTypesForAssetType:()FullAnalysis;
- (unint64_t)vcp_fullAnalysisTypes;
- (unint64_t)vcp_fullAnalysisTypesForResources:()FullAnalysis;
@end

@implementation PHAsset(FullAnalysis)

+ (unint64_t)vcp_fullAnalysisTypesForAssetType:()FullAnalysis
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((a3 & 3) != 0)
  {
    uint64_t v4 = (a3 << 62 >> 63) & 0x32C04C1A41090 | *(void *)"\b\nH@";
    goto LABEL_10;
  }
  if ((a3 & 4) != 0)
  {
    uint64_t v4 = 0x32C0040E4D898;
LABEL_10:
    if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled]) {
      return v4;
    }
    else {
      return v4 & 0xFFFEF7FFFFFFFFFFLL;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      uint64_t v8 = a3;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEFAULT, "Unexpected media type (%lu)", (uint8_t *)&v7, 0xCu);
    }
  }
  return 0;
}

+ (uint64_t)vcp_fullAnalysisImageOnlyTypes
{
  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled]) {
    uint64_t v0 = 0x1000000000000;
  }
  else {
    uint64_t v0 = 0;
  }
  if (+[VCPVideoCaptionAnalyzer mode] == 1) {
    return v0 | 0x2000000000000;
  }
  else {
    return v0;
  }
}

+ (uint64_t)vcp_fullAnalysisGenerativeModelAdditionalTypes
{
  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled]) {
    uint64_t v0 = 0x1080000000000;
  }
  else {
    uint64_t v0 = 0;
  }
  if (+[VCPVideoCaptionAnalyzer mode] == 1) {
    return v0 | 0x2200000000000;
  }
  else {
    return v0;
  }
}

- (unint64_t)vcp_fullAnalysisTypes
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([a1 isPhoto])
  {
    uint64_t v2 = *(void *)"\b\nH@";
    if (objc_msgSend(a1, "vcp_isLivePhoto")) {
      uint64_t v2 = *(void *)"\b\nH@" | 0x40032C04D5A41090;
    }
    goto LABEL_6;
  }
  if ([a1 isVideo])
  {
    uint64_t v2 = 0x40032C0040E4D898;
LABEL_6:
    if (!+[VCPVideoCNNAnalyzer isMUBackboneEnabled]) {
      v2 &= 0xFFFEF7FFFFFFFFFFLL;
    }
    if (+[VCPVideoCaptionAnalyzer mode] == 1) {
      return v2;
    }
    else {
      return v2 & 0xFFFDDFFFFFFFFFFFLL;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    uint64_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [a1 localIdentifier];
      int v6 = 138412546;
      int v7 = v5;
      __int16 v8 = 1024;
      int v9 = [a1 mediaType];
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[%@] Unexpected media type (%d)", (uint8_t *)&v6, 0x12u);
    }
  }
  return 0;
}

- (unint64_t)vcp_fullAnalysisTypesForResources:()FullAnalysis
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![a1 isPhoto])
  {
    if ([a1 isVideo])
    {
      if (objc_msgSend(a1, "vcp_isVideoSlowmo")
        && (objc_msgSend(v4, "vcp_hasLocalSlowmo:", objc_msgSend(a1, "vcp_hasAdjustments:", v4)) & 1) != 0
        || (objc_msgSend(a1, "vcp_isVideoSlowmo") & 1) == 0
        && objc_msgSend(v4, "vcp_hasLocalMovie:", objc_msgSend(a1, "hasAdjustments")))
      {
        BOOL v6 = +[VCPVideoCNNAnalyzer isMUBackboneEnabled];
        int64_t v7 = +[VCPVideoCaptionAnalyzer mode];
        unint64_t v8 = 0x40032C0040E4D898;
        goto LABEL_22;
      }
      if (objc_msgSend(v4, "vcp_hasLocalPhoto:", objc_msgSend(a1, "hasAdjustments")))
      {
        BOOL v6 = +[VCPVideoCNNAnalyzer isMUBackboneEnabled];
        int64_t v7 = +[VCPVideoCaptionAnalyzer mode];
        unint64_t v8 = 0x3000000000800;
LABEL_22:
        if (!v6) {
          v8 &= 0x7FFEF7FFFFFFFFFFuLL;
        }
        goto LABEL_24;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 4)
    {
      int v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [a1 localIdentifier];
        int v14 = 138412546;
        v15 = v10;
        __int16 v16 = 1024;
        int v17 = [a1 mediaType];
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEFAULT, "[%@] Unexpected media type (%d)", (uint8_t *)&v14, 0x12u);
      }
    }
    unint64_t v12 = 0;
    goto LABEL_28;
  }
  if (objc_msgSend(v4, "vcp_hasLocalPhoto:", objc_msgSend(a1, "hasAdjustments")))
  {
    uint64_t v5 = *(void *)"\b\nH@";
    if (objc_msgSend(a1, "vcp_isLivePhoto")
      && objc_msgSend(v4, "vcp_hasLocalMovie:", objc_msgSend(a1, "hasAdjustments")))
    {
      uint64_t v5 = *(void *)"\b\nH@" | 0x40032C04D5A41090;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  BOOL v11 = +[VCPVideoCNNAnalyzer isMUBackboneEnabled];
  int64_t v7 = +[VCPVideoCaptionAnalyzer mode];
  unint64_t v8 = v5 & 0xFFFEF7FFFFFFFFFFLL;
  if (v11) {
    unint64_t v8 = v5;
  }
LABEL_24:
  if (v7 == 1) {
    unint64_t v12 = v8;
  }
  else {
    unint64_t v12 = v8 & 0xFFFDDFFFFFFFFFFFLL;
  }
LABEL_28:

  return v12;
}

@end