@interface IOHIDEventSystemConnectionRemoveVirtualService
@end

@implementation IOHIDEventSystemConnectionRemoveVirtualService

void ___IOHIDEventSystemConnectionRemoveVirtualService_block_invoke(uint64_t a1)
{
  _IOHIDServiceTerminate(*(void **)(a1 + 32));
  v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

@end