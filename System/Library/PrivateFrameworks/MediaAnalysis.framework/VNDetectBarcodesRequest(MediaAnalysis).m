@interface VNDetectBarcodesRequest(MediaAnalysis)
+ (id)mad_defaultRequest;
@end

@implementation VNDetectBarcodesRequest(MediaAnalysis)

+ (id)mad_defaultRequest
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F45768]);
  int v1 = _os_feature_enabled_impl();
  char v2 = v1;
  if (v1) {
    uint64_t v3 = 3737841665;
  }
  else {
    uint64_t v3 = 3737841664;
  }
  id v13 = 0;
  char v4 = [v0 setRevision:v3 error:&v13];
  id v5 = v13;
  if (v4)
  {
    uint64_t v6 = *MEMORY[0x1E4F45B78];
    v14[0] = *MEMORY[0x1E4F45BA0];
    v14[1] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    [v0 setSymbologies:v7];

    if ((v2 & 1) == 0) {
      [v0 setUseSegmentationPregating:1];
    }
    if (DeviceHasANE())
    {
      v8 = [MEMORY[0x1E4F458E8] defaultANEDevice];
      [v0 setProcessingDevice:v8];
    }
    id v9 = v0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [v5 description];
        *(_DWORD *)buf = 67109378;
        int v16 = v3;
        __int16 v17 = 2112;
        v18 = v11;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEFAULT, "Failed to set revision %u for VNDetectBarcodesRequest with error: %@", buf, 0x12u);
      }
    }
    id v9 = 0;
  }

  return v9;
}

@end