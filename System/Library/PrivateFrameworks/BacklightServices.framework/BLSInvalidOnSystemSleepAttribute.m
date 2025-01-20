@interface BLSInvalidOnSystemSleepAttribute
+ (id)invalidateOnSystemSleep;
- (BOOL)canBePaused;
@end

@implementation BLSInvalidOnSystemSleepAttribute

+ (id)invalidateOnSystemSleep
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (BOOL)canBePaused
{
  return 0;
}

@end