@interface AXReplayKitClientDelegate
- (void)didStartRecordingOrBroadcast;
- (void)didStopRecordingOrBroadcast;
@end

@implementation AXReplayKitClientDelegate

- (void)didStopRecordingOrBroadcast
{
  v2 = AXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_242499000, v2, OS_LOG_TYPE_DEFAULT, "Notifying VO that recording is stopping", v3, 2u);
  }

  UIAccessibilityPostNotification(0x40Eu, MEMORY[0x263EFFA80]);
}

- (void)didStartRecordingOrBroadcast
{
  v2 = AXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_242499000, v2, OS_LOG_TYPE_DEFAULT, "Notifying VO that recording is starting", v3, 2u);
  }

  UIAccessibilityPostNotification(0x40Eu, MEMORY[0x263EFFA88]);
}

@end