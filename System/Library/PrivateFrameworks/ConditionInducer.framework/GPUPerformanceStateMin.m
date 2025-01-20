@interface GPUPerformanceStateMin
+ (id)description;
+ (id)profileFriendlyName;
- (GPUPerformanceStateMin)init;
@end

@implementation GPUPerformanceStateMin

+ (id)description
{
  return @"Set GPU Performance State to minimum level. GPU workloads will run at minimum performance state.";
}

+ (id)profileFriendlyName
{
  return @"Minimum";
}

- (GPUPerformanceStateMin)init
{
  v3.receiver = self;
  v3.super_class = (Class)GPUPerformanceStateMin;
  return [(GPUPerformanceStateDefault *)&v3 initWithGPUPerformanceState:1];
}

@end