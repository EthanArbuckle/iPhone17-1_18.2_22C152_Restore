@interface VNTorsoprintGeneratorPrivateRevision3MD2HumanDetectorBased
+ (const)modelVersionForOptions:(id)a3;
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
@end

@implementation VNTorsoprintGeneratorPrivateRevision3MD2HumanDetectorBased

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return @"torso_v3_md2_fp16.espresso";
}

+ (const)modelVersionForOptions:(id)a3
{
  return &vision::mod::TorsoprintGenerator::modelVersion_anodv3_torso_v3_MD2;
}

@end