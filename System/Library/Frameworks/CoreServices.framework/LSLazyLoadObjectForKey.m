@interface LSLazyLoadObjectForKey
@end

@implementation LSLazyLoadObjectForKey

void ___LSLazyLoadObjectForKey_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void ___LSLazyLoadObjectForKey_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v2)
  {
    uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    if (v2) {
      [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
    }
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end