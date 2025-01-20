@interface VNFaceAnalyzerMultiDetectorFPrev3_1FArev1_3_MD3
+ (const)modelVersionForOptions:(id)a3;
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
- (BOOL)_isFaceprintJunk:(shared_ptr<vision::mod::ImageDescriptorBufferAbstract>)a3;
@end

@implementation VNFaceAnalyzerMultiDetectorFPrev3_1FArev1_3_MD3

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return @"facerec_fp3.1.3b_fa1.3.espresso";
}

+ (const)modelVersionForOptions:(id)a3
{
  return &vision::mod::FaceprintAndAttributes::modelVersion_fp3_1_3_fa1_3;
}

- (BOOL)_isFaceprintJunk:(shared_ptr<vision::mod::ImageDescriptorBufferAbstract>)a3
{
  return 0;
}

@end