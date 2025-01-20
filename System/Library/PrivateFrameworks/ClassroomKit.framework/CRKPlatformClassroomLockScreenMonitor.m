@interface CRKPlatformClassroomLockScreenMonitor
+ (CRKClassroomLockScreenMonitoring)sharedMonitor;
@end

@implementation CRKPlatformClassroomLockScreenMonitor

+ (CRKClassroomLockScreenMonitoring)sharedMonitor
{
  if (sharedMonitor_onceToken != -1) {
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_94);
  }
  v2 = (void *)sharedMonitor_monitor;

  return (CRKClassroomLockScreenMonitoring *)v2;
}

void __54__CRKPlatformClassroomLockScreenMonitor_sharedMonitor__block_invoke()
{
  id v2 = (id)objc_opt_new();
  uint64_t v0 = [v2 makeMonitor];
  v1 = (void *)sharedMonitor_monitor;
  sharedMonitor_monitor = v0;
}

@end