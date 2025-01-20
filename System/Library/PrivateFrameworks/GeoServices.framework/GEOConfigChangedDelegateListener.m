@interface GEOConfigChangedDelegateListener
@end

@implementation GEOConfigChangedDelegateListener

uint64_t __49___GEOConfigChangedDelegateListener_callListener__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "valueChangedForGEOConfigKey:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

@end