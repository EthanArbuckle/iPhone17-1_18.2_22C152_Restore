@interface BLSRuntime
+ (BOOL)isHostProcess;
+ (void)setIsHostProcess:(BOOL)a3;
@end

@implementation BLSRuntime

+ (BOOL)isHostProcess
{
  os_unfair_lock_lock((os_unfair_lock_t)&_lock);
  char v2 = _isHostProcess;
  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
  return v2;
}

+ (void)setIsHostProcess:(BOOL)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&_lock);
  _isHostProcess = a3;

  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
}

@end