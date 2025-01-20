@interface Invalidate
@end

@implementation Invalidate

void __queryManagerGetInfo_Invalidate_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(DerivedStorage + 16))
  {
    int v4 = -72233;
  }
  else
  {
    uint64_t v3 = DerivedStorage;
    CFDictionaryApplyBlock();
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(v3 + 24));
    int v4 = 0;
    *(unsigned char *)(v3 + 16) = 1;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
}

@end