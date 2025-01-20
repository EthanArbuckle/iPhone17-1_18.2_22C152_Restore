@interface CFUUIDDeallocate
@end

@implementation CFUUIDDeallocate

void ____CFUUIDDeallocate_block_invoke(uint64_t a1)
{
  if (_uniquedUUIDs) {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)_uniquedUUIDs, (const void *)(*(void *)(a1 + 32) + 16));
  }
}

@end