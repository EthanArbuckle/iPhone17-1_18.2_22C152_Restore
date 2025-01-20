@interface NRPairedDeviceRegistry(BoundedWait)
+ (id)blt_boundedWaitForActivePairedDevice;
+ (void)blt_boundedWaitForActivePairedDevice;
@end

@implementation NRPairedDeviceRegistry(BoundedWait)

+ (id)blt_boundedWaitForActivePairedDevice
{
  if (blt_boundedWaitForActivePairedDevice_onceToken != -1) {
    dispatch_once(&blt_boundedWaitForActivePairedDevice_onceToken, &__block_literal_global_2);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&blt_boundedWaitForActivePairedDevice_deviceLock);
  id v0 = (id)blt_boundedWaitForActivePairedDevice_device;
  os_unfair_lock_unlock((os_unfair_lock_t)&blt_boundedWaitForActivePairedDevice_deviceLock);
  if (!v0)
  {
    v1 = blt_general_log();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      +[NRPairedDeviceRegistry(BoundedWait) blt_boundedWaitForActivePairedDevice](v1);
    }

    v2 = [MEMORY[0x263F57730] sharedInstance];
    id v0 = [v2 getActivePairedDevice];
  }
  return v0;
}

+ (void)blt_boundedWaitForActivePairedDevice
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "Still waiting on active paired device. Checking NRPairedDeviceRegistry getActivePairedDevice instead.", v1, 2u);
}

@end