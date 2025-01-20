@interface GDDaemonEventHandlers
+ (void)registerForLaunchEvents;
@end

@implementation GDDaemonEventHandlers

+ (void)registerForLaunchEvents
{
  v2 = GDDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C6DE6000, v2, OS_LOG_TYPE_DEFAULT, "GDDaemonEventHandlers: registerLaunchEventHandlers called", v4, 2u);
  }

  v3 = MEMORY[0x1E4F14428];
  xpc_set_event_stream_handler("com.apple.notifyd.matching", MEMORY[0x1E4F14428], &unk_1F220AAD8);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", v3, &unk_1F220AAF8);

  xpc_set_event_stream_handler("com.apple.locationd-events", v3, &unk_1F220AB18);
}

@end