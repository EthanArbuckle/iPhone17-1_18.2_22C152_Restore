@interface SCDynamicStoreDeallocate
@end

@implementation SCDynamicStoreDeallocate

void ____SCDynamicStoreDeallocate_block_invoke(uint64_t a1)
{
  v2 = (__CFSet *)_sc_store_sessions;
  v3 = *(const void **)(a1 + 32);

  CFSetRemoveValue(v2, v3);
}

@end