@interface GPUPerformanceStateMid
+ (id)description;
+ (id)profileFriendlyName;
- (GPUPerformanceStateMid)init;
@end

@implementation GPUPerformanceStateMid

+ (id)description
{
  return @"Set GPU Performance State to medium level. GPU workloads will attempt to run at medium performance state unless thermally throttled.";
}

+ (id)profileFriendlyName
{
  return @"Medium";
}

- (GPUPerformanceStateMid)init
{
  v3.receiver = self;
  v3.super_class = (Class)GPUPerformanceStateMid;
  return [(GPUPerformanceStateDefault *)&v3 initWithGPUPerformanceState:2];
}

@end