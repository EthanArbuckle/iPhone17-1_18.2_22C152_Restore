@interface GetPAPRegistryMutexAndList
@end

@implementation GetPAPRegistryMutexAndList

CFMutableDictionaryRef __pap_GetPAPRegistryMutexAndList_block_invoke()
{
  pap_GetPAPRegistryMutexAndList_sListLock = FigSimpleMutexCreate();
  CFMutableDictionaryRef result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  pap_GetPAPRegistryMutexAndList_sList = (uint64_t)result;
  return result;
}

@end