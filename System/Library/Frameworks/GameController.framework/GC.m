@interface GC
@end

@implementation GC

void __GC_IOHIDSetLEDs_block_invoke(uint64_t a1)
{
  IOHIDServiceClientSetElementValue();
  IOHIDServiceClientSetElementValue();
  IOHIDServiceClientSetElementValue();
  IOHIDServiceClientSetElementValue();
  v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

@end