@interface IOHIDServiceTerminate
@end

@implementation IOHIDServiceTerminate

void ___IOHIDServiceTerminate_block_invoke(uint64_t a1, uint64_t a2)
{
  __IOHIDServiceNotification(*(void *)(a1 + 32), a2, 0xE0000010);
  v3 = *(const void **)(a1 + 32);

  CFRelease(v3);
}

@end