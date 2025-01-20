@interface MADRequest(MediaAnalysis)
- (id)vcp_taskWithImageAsset:()MediaAnalysis andSignpostPayload:;
@end

@implementation MADRequest(MediaAnalysis)

- (id)vcp_taskWithImageAsset:()MediaAnalysis andSignpostPayload:
{
  id v6 = a3;
  id v7 = a4;
  if (([a1 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([a1 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([a1 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([a1 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([a1 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([a1 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([a1 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([a1 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([a1 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([a1 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([a1 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([a1 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([a1 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([a1 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([a1 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([a1 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([a1 isMemberOfClass:objc_opt_class()] & 1) != 0
    || [a1 isMemberOfClass:objc_opt_class()])
  {
    v8 = [(id)objc_opt_class() taskWithRequest:a1 imageAsset:v6 andSignpostPayload:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end