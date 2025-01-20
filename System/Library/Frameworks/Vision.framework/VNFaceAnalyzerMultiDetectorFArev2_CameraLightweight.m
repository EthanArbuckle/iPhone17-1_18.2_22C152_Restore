@interface VNFaceAnalyzerMultiDetectorFArev2_CameraLightweight
+ (const)modelVersionForOptions:(id)a3;
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
- (BOOL)_isFaceprintJunk:(shared_ptr<vision::mod::ImageDescriptorBufferAbstract>)a3;
@end

@implementation VNFaceAnalyzerMultiDetectorFArev2_CameraLightweight

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return @"facerec_fa1.3_lightweight_fp16.espresso";
}

+ (const)modelVersionForOptions:(id)a3
{
  return &vision::mod::FaceprintAndAttributes::modelVersion_fa1_3_lightweight;
}

- (BOOL)_isFaceprintJunk:(shared_ptr<vision::mod::ImageDescriptorBufferAbstract>)a3
{
  return 0;
}

@end