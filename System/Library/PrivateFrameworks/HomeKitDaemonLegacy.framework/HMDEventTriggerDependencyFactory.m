@interface HMDEventTriggerDependencyFactory
- (HMDLaunchHandler)launchHandler;
- (id)createTimerWithTimeInterval:(double)a3 options:(unint64_t)a4;
@end

@implementation HMDEventTriggerDependencyFactory

- (HMDLaunchHandler)launchHandler
{
  return +[HMDLaunchHandler sharedHandler];
}

- (id)createTimerWithTimeInterval:(double)a3 options:(unint64_t)a4
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:a4 options:a3];
  return v4;
}

@end