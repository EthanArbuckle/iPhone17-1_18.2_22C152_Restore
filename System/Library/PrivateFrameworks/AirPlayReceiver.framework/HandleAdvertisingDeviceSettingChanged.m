@interface HandleAdvertisingDeviceSettingChanged
@end

@implementation HandleAdvertisingDeviceSettingChanged

void ___HandleAdvertisingDeviceSettingChanged_block_invoke(uint64_t a1)
{
  _NotifySessionsSystemInfoChange(*(void *)(a1 + 32));
  v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

@end