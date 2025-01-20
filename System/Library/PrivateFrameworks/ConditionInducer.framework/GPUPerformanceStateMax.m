@interface GPUPerformanceStateMax
+ (id)description;
+ (id)profileFriendlyName;
- (GPUPerformanceStateMax)init;
@end

@implementation GPUPerformanceStateMax

+ (id)description
{
  return @"Set GPU Performance State to maximum level. GPU workloads will attempt to run at maximum performance state unless thermally throttled.";
}

+ (id)profileFriendlyName
{
  return @"Maximum";
}

- (GPUPerformanceStateMax)init
{
  v3.receiver = self;
  v3.super_class = (Class)GPUPerformanceStateMax;
  return [(GPUPerformanceStateDefault *)&v3 initWithGPUPerformanceState:3];
}

@end