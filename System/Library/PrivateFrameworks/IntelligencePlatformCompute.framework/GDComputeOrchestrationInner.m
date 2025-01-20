@interface GDComputeOrchestrationInner
+ (id)start;
@end

@implementation GDComputeOrchestrationInner

+ (id)start
{
  id v2 = specialized static ComputeOrchestration.start()();

  return v2;
}

@end