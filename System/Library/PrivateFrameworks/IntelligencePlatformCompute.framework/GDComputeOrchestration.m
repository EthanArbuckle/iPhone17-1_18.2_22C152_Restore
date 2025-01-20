@interface GDComputeOrchestration
+ (id)nullEventReporter;
+ (id)start;
@end

@implementation GDComputeOrchestration

+ (id)start
{
  return +[GDComputeOrchestrationInner start];
}

+ (id)nullEventReporter
{
  v2 = objc_opt_new();

  return v2;
}

@end