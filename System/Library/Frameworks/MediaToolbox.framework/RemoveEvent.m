@interface RemoveEvent
@end

@implementation RemoveEvent

void __fpic_RemoveEvent_block_invoke(uint64_t a1)
{
  fpic_ServiceCurrentEvent(*(void *)(a1 + 32), MEMORY[0x1E4F1F9F8]);
  v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

@end