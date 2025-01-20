@interface CFCachedURLResponseSetBecameFileBackedCallBackBlock
@end

@implementation CFCachedURLResponseSetBecameFileBackedCallBackBlock

void ___CFCachedURLResponseSetBecameFileBackedCallBackBlock_block_invoke(uint64_t a1)
{
  uint64_t v2 = CFURLCacheCopySharedURLCache();
  if (v2)
  {
    v3 = (void *)v2;
    uint64_t v4 = *(void *)(v2 + 16);
    if (v4)
    {
      pthread_mutex_lock((pthread_mutex_t *)(v4 + 456));
      uint64_t v5 = v3[2];
      v6 = *(__CFDictionary **)(v5 + 520);
      if (v6)
      {
        CFDictionaryRemoveValue(v6, *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
        uint64_t v5 = v3[2];
      }
      pthread_mutex_unlock((pthread_mutex_t *)(v5 + 456));
    }
    CFRelease(v3);
  }
  v7 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v7)
  {
    CFRelease(v7);
  }
}

@end