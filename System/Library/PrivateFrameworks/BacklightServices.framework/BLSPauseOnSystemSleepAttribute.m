@interface BLSPauseOnSystemSleepAttribute
+ (id)pauseOnSystemSleep;
- (BOOL)canBePaused;
@end

@implementation BLSPauseOnSystemSleepAttribute

+ (id)pauseOnSystemSleep
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (BOOL)canBePaused
{
  return 0;
}

@end