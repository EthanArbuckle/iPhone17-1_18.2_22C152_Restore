@interface IOHIDServiceClientCreate
@end

@implementation IOHIDServiceClientCreate

CFSetRef ___IOHIDServiceClientCreate_block_invoke()
{
  CFSetRef result = CFSetCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)_servicePropertyCacheKeys, 15, MEMORY[0x1E4F1D548]);
  __serviceKeysSet = (uint64_t)result;
  return result;
}

@end