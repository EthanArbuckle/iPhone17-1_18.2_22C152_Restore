@interface VNCreateSceneprintRequest(MediaAnalysis)
+ (uint64_t)vcp_sceneRequest;
+ (uint64_t)vcp_sceneRequestForWallpaper;
@end

@implementation VNCreateSceneprintRequest(MediaAnalysis)

+ (uint64_t)vcp_sceneRequest
{
  v0 = (void *)MEMORY[0x1E4F45870];
  uint64_t v1 = objc_opt_class();
  return objc_msgSend(v0, "vcp_sceneRequestWithRequestClass:andRevision:", v1, 3737841671);
}

+ (uint64_t)vcp_sceneRequestForWallpaper
{
  return 0;
}

@end