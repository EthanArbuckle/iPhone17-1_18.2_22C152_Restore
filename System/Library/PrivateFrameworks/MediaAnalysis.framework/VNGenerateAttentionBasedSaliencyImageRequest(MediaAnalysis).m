@interface VNGenerateAttentionBasedSaliencyImageRequest(MediaAnalysis)
+ (uint64_t)vcp_sceneRequest;
@end

@implementation VNGenerateAttentionBasedSaliencyImageRequest(MediaAnalysis)

+ (uint64_t)vcp_sceneRequest
{
  v0 = (void *)MEMORY[0x1E4F45870];
  uint64_t v1 = objc_opt_class();
  return objc_msgSend(v0, "vcp_sceneRequestWithRequestClass:andRevision:", v1, 3737841667);
}

@end