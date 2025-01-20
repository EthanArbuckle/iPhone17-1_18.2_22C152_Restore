@interface IncrementalSearchOperation
@end

@implementation IncrementalSearchOperation

void __35___IncrementalSearchOperation_main__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    *a4 = 1;
  }
  else
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) >= 0x40uLL)
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 264);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      v9 = *(void (**)(uint64_t, id, unsigned char *))(v7 + 16);
      memcpy(__dst, (const void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), sizeof(__dst));
      v9(v7, WeakRetained, __dst);

      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = 0;
    }
    uint64_t v10 = [v6 range];
    v11 = *(void **)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = v11[4];
    v11 += 4;
    void *v11 = v12 + 1;
    v13 = &v11[2 * v12];
    v13[1] = v10;
    v13[2] = v14;
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

@end