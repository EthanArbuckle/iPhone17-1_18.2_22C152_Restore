@interface VNAnimalprintDetectorPrivateRevision2MD3
+ (const)modelVersionForOptions:(id)a3;
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
@end

@implementation VNAnimalprintDetectorPrivateRevision2MD3

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return @"pet_v2_md3_fp16.espresso";
}

+ (const)modelVersionForOptions:(id)a3
{
  return &vision::mod::PetprintGenerator::modelVersion_anodv4_pet_v2_md3;
}

@end