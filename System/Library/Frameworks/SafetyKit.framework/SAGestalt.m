@interface SAGestalt
+ (BOOL)deviceSupportsKappa;
+ (BOOL)inAirplaneMode;
+ (BOOL)isInternalBuild;
+ (BOOL)isProductionFused;
@end

@implementation SAGestalt

+ (BOOL)inAirplaneMode
{
  return localMGGetBoolAnswer(@"AirplaneMode");
}

+ (BOOL)deviceSupportsKappa
{
  return localMGGetBoolAnswer(@"DeviceSupportsCollisionSOS");
}

+ (BOOL)isProductionFused
{
  return localMGGetBoolAnswer(@"SigningFuse");
}

+ (BOOL)isInternalBuild
{
  return localMGGetBoolAnswer(@"InternalBuild");
}

@end