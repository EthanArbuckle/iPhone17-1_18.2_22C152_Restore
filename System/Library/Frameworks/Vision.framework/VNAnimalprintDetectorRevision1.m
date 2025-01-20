@interface VNAnimalprintDetectorRevision1
+ (const)modelVersionForOptions:(id)a3;
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
@end

@implementation VNAnimalprintDetectorRevision1

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return @"pet_v1_md2_fp16.espresso";
}

+ (const)modelVersionForOptions:(id)a3
{
  return &vision::mod::PetprintGenerator::modelVersion_anodv3_pet_v1_md2;
}

@end