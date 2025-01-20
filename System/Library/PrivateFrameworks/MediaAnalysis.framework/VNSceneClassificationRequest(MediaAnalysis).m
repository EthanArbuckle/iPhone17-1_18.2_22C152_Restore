@interface VNSceneClassificationRequest(MediaAnalysis)
+ (id)vcp_sceneRequest;
@end

@implementation VNSceneClassificationRequest(MediaAnalysis)

+ (id)vcp_sceneRequest
{
  v0 = objc_msgSend(MEMORY[0x1E4F45870], "vcp_sceneRequestWithRequestClass:andRevision:", objc_opt_class(), 3737841665);
  if (objc_opt_respondsToSelector()) {
    [v0 setMaximumLeafObservations:15];
  }
  if (objc_opt_respondsToSelector()) {
    [v0 setMaximumHierarchicalObservations:15];
  }
  return v0;
}

@end