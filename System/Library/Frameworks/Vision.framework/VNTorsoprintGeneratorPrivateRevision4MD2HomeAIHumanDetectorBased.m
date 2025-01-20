@interface VNTorsoprintGeneratorPrivateRevision4MD2HomeAIHumanDetectorBased
+ (const)modelVersionForOptions:(id)a3;
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
@end

@implementation VNTorsoprintGeneratorPrivateRevision4MD2HomeAIHumanDetectorBased

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return @"torso_v4_md2.espresso";
}

+ (const)modelVersionForOptions:(id)a3
{
  return &vision::mod::TorsoprintGenerator::modelVersion_anodv3_torso_v4_MD2;
}

@end