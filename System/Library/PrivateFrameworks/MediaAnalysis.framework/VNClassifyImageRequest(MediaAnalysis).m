@interface VNClassifyImageRequest(MediaAnalysis)
+ (id)vcp_sceneRequest;
@end

@implementation VNClassifyImageRequest(MediaAnalysis)

+ (id)vcp_sceneRequest
{
  v0 = objc_msgSend(MEMORY[0x1E4F45870], "vcp_sceneRequestWithRequestClass:andRevision:", objc_opt_class(), 3737841667);
  [v0 setMaximumLeafObservations:15];
  [v0 setMaximumHierarchicalObservations:15];
  return v0;
}

@end