@interface HMDUserDataControllerTimerCreator
- (id)createExponentialBackoffTimerForZoneFetch;
@end

@implementation HMDUserDataControllerTimerCreator

- (id)createExponentialBackoffTimerForZoneFetch
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F65428]) initWithMinimumTimeInterval:3 maximumTimeInterval:0 exponentialFactor:1.0 options:86400.0];
  return v2;
}

@end