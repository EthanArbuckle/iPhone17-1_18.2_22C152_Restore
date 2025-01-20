@interface DeviceUnpluggedNotificationCallback
@end

@implementation DeviceUnpluggedNotificationCallback

void __brokeredPlugin_DeviceUnpluggedNotificationCallback_block_invoke(uint64_t a1)
{
  DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener(DefaultLocalCenter, *(const void **)(a1 + 32), (int)brokeredPlugin_DeviceUnpluggedNotificationCallback, @"FigHALAudioDeviceUnplugged", *(void **)(a1 + 40));
  CFArrayRef v3 = *(const __CFArray **)(*(void *)(a1 + 48) + 40);
  v8.length = CFArrayGetCount(v3);
  v8.location = 0;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v3, v8, *(const void **)(a1 + 40));
  if (FirstIndexOfValue != -1)
  {
    CFIndex v5 = FirstIndexOfValue;
    v6 = *(__CFArray **)(*(void *)(a1 + 48) + 40);
    CFArrayRemoveValueAtIndex(v6, v5);
  }
}

@end