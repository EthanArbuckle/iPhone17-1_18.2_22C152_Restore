@interface CreateDeviceForEndpointStream
@end

@implementation CreateDeviceForEndpointStream

void __brokeredPlugin_CreateDeviceForEndpointStream_block_invoke(uint64_t a1)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(a1 + 32) + 40), *(const void **)(a1 + 40));
  DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterAddListener(DefaultLocalCenter, *(const void **)(a1 + 48), (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))brokeredPlugin_DeviceUnpluggedNotificationCallback, @"FigHALAudioDeviceUnplugged", *(void *)(a1 + 40));
  v3 = *(const void **)(a1 + 40);

  CFRelease(v3);
}

@end