@interface AFErrorSetUnderlyingErrorRecursively
@end

@implementation AFErrorSetUnderlyingErrorRecursively

void ___AFErrorSetUnderlyingErrorRecursively_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v11 = 0;
  int v5 = _AFErrorSetUnderlyingErrorRecursively(a2, &v11, *(void *)(a1 + 40), *(void *)(a1 + 48));
  id v6 = v11;
  if (v5)
  {
    v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v7)
    {
      uint64_t v8 = [*(id *)(a1 + 32) mutableCopy];
      uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    [v7 replaceObjectAtIndex:a3 withObject:v6];
  }
}

@end