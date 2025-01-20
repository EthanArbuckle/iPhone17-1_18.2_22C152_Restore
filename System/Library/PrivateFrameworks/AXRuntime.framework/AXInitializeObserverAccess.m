@interface AXInitializeObserverAccess
@end

@implementation AXInitializeObserverAccess

CFMutableDictionaryRef ___AXInitializeObserverAccess_block_invoke()
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D540]);
  ObserverDictionary = (uint64_t)result;
  return result;
}

@end