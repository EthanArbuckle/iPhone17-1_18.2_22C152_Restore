@interface DKNotificationWatchNearbyMonitor
@end

@implementation DKNotificationWatchNearbyMonitor

uint64_t __42___DKNotificationWatchNearbyMonitor_start__block_invoke(uint64_t a1, int a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F34FB8] admissionCheckChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v5 = 138412290;
    *(void *)&v5[4] = @"com.apple.coreduetd.nearbydeviceschanged";
    _os_log_impl(&dword_225002000, v3, OS_LOG_TYPE_DEFAULT, "Notification handler called for %@", v5, 0xCu);
  }

  *(void *)v5 = 0;
  uint64_t result = notify_get_state(a2, (uint64_t *)v5);
  if (!result) {
    return +[_DKNotificationWatchNearbyMonitor setIsWatchNearby:*(void *)v5 != 0];
  }
  return result;
}

@end