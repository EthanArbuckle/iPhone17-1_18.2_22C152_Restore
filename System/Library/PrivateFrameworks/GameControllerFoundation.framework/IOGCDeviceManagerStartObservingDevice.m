@interface IOGCDeviceManagerStartObservingDevice
@end

@implementation IOGCDeviceManagerStartObservingDevice

void ____IOGCDeviceManagerStartObservingDevice_block_invoke(uint64_t a1, int a2)
{
  if (a2 == -536870896) {
    __IOGCDeviceManagerStopObservingDevice(*(void *)(a1 + 32), *(CFTypeRef *)(a1 + 40), 1);
  }
}

@end