@interface VNTorsoprintGeneratorPrivateRevision5MD2HumanDetectorBased
+ (const)modelVersionForOptions:(id)a3;
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
@end

@implementation VNTorsoprintGeneratorPrivateRevision5MD2HumanDetectorBased

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return @"torso_v5_md2.espresso";
}

+ (const)modelVersionForOptions:(id)a3
{
  return &vision::mod::TorsoprintGenerator::modelVersion_anodv3_torso_v5_MD2;
}

@end