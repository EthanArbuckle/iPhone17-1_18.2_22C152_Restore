@interface IOHIDEventSystemConnectionDispatchEventForVirtualService
@end

@implementation IOHIDEventSystemConnectionDispatchEventForVirtualService

void ___IOHIDEventSystemConnectionDispatchEventForVirtualService_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _IOHIDServiceDispatchEvent(*(void *)(a1 + 32), *(void **)(a1 + 40), a3);
  CFRelease(*(CFTypeRef *)(a1 + 40));
  v4 = *(const void **)(a1 + 32);

  CFRelease(v4);
}

@end