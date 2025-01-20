@interface VNRecognizeDocumentElementsRequest(MediaAnalysis)
+ (id)vcp_sceneRequest;
@end

@implementation VNRecognizeDocumentElementsRequest(MediaAnalysis)

+ (id)vcp_sceneRequest
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F45900]);
  v1 = v0;
  if (v0)
  {
    [v0 setRevision:1];
    [v1 setMetalContextPriority:1];
    [v1 setPreferBackgroundProcessing:1];
    if (DeviceHasANE())
    {
      v2 = [MEMORY[0x1E4F458E8] defaultANEDevice];
      [v1 setProcessingDevice:v2];
    }
    v3 = [v1 textElements];
    [v3 setRecognize:1];

    v4 = [v1 machineReadableCodeElements];
    [v4 setRecognize:1];

    v5 = [v1 documentElements];
    [v5 setRecognize:1];

    id v6 = v1;
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      uint64_t v10 = objc_opt_class();
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "Failed to create %@", (uint8_t *)&v9, 0xCu);
    }
  }
  return v1;
}

@end