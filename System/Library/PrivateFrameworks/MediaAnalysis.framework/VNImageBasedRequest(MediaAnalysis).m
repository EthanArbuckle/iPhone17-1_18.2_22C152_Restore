@interface VNImageBasedRequest(MediaAnalysis)
+ (id)vcp_sceneRequestWithRequestClass:()MediaAnalysis andRevision:;
+ (uint64_t)_allowANE;
- (uint64_t)_configureRequestWithRevision:()MediaAnalysis;
@end

@implementation VNImageBasedRequest(MediaAnalysis)

+ (uint64_t)_allowANE
{
  return 1;
}

- (uint64_t)_configureRequestWithRevision:()MediaAnalysis
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [a1 setMetalContextPriority:1];
  [a1 setPreferBackgroundProcessing:1];
  if (DeviceHasANE() && [(id)objc_opt_class() _allowANE])
  {
    v5 = [MEMORY[0x1E4F458E8] defaultANEDevice];
    [a1 setProcessingDevice:v5];
  }
  id v11 = 0;
  uint64_t v6 = [a1 setRevision:a3 error:&v11];
  id v7 = v11;
  if ((v6 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
  {
    v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      uint64_t v13 = v9;
      __int16 v14 = 2048;
      uint64_t v15 = a3;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "Failed to set %@::setRevision %lu: %@", buf, 0x20u);
    }
  }
  return v6;
}

+ (id)vcp_sceneRequestWithRequestClass:()MediaAnalysis andRevision:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(a3);
  id v7 = v6;
  if (v6)
  {
    if ([v6 _configureRequestWithRevision:a4])
    {
      id v8 = v7;
      goto LABEL_13;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        uint64_t v13 = a3;
        v10 = "Failed to configure %@";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      uint64_t v13 = a3;
      v10 = "Failed to create %@";
LABEL_10:
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0xCu);
    }
LABEL_11:
  }
  id v8 = 0;
LABEL_13:

  return v8;
}

@end