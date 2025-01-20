@interface IOHIDManagerDeviceRemoved
@end

@implementation IOHIDManagerDeviceRemoved

uint64_t ____IOHIDManagerDeviceRemoved_block_invoke(uint64_t result, uint64_t a2)
{
  if (!*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v3 = result;
    result = IOHIDDeviceGetRegistryEntryID(a2);
    if (*(void *)(v3 + 40) == result) {
      *(void *)(*(void *)(*(void *)(v3 + 32) + 8) + 24) = a2;
    }
  }
  return result;
}

@end