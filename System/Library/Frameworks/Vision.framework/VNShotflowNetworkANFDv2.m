@interface VNShotflowNetworkANFDv2
+ (const)importantClasses;
+ (id)modelName;
+ (unint64_t)mumberPosClasses;
@end

@implementation VNShotflowNetworkANFDv2

+ (id)modelName
{
  return @"shotflow-8k6zuzd9wy_46860_opt_quantized.espresso";
}

+ (const)importantClasses
{
  if (+[VNShotflowNetworkANFDv2 importantClasses]::onceToken != -1) {
    dispatch_once(&+[VNShotflowNetworkANFDv2 importantClasses]::onceToken, &__block_literal_global_183);
  }
  return (const void *)+[VNShotflowNetworkANFDv2 importantClasses]::importantClasses;
}

void __43__VNShotflowNetworkANFDv2_importantClasses__block_invoke()
{
}

+ (unint64_t)mumberPosClasses
{
  return 6;
}

@end