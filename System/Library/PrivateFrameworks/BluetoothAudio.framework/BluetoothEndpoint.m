@interface BluetoothEndpoint
@end

@implementation BluetoothEndpoint

void __BluetoothEndpoint_Disassociate_block_invoke(uint64_t a1)
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = *(void (**)(uint64_t))(v4 + 32);
  if (v5) {
    v5(v2);
  }
  v6 = *(const void **)(a1 + 32);
  CFRelease(v6);
}

@end