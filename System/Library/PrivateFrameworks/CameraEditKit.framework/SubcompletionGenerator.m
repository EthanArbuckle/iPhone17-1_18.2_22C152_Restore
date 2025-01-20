@interface SubcompletionGenerator
@end

@implementation SubcompletionGenerator

id ___SubcompletionGenerator_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained CEKC2GroupCompletionAnimationDidBegin:v3];

  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___SubcompletionGenerator_block_invoke_2;
  v10[3] = &unk_1E63CD980;
  objc_copyWeak(v16, (id *)(a1 + 72));
  id v11 = v3;
  long long v13 = *(_OWORD *)(a1 + 48);
  v16[1] = *(id *)(a1 + 80);
  uint64_t v5 = *(void *)(a1 + 64);
  v6 = *(void **)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = v5;
  id v12 = v6;
  id v7 = v3;
  v8 = _Block_copy(v10);

  objc_destroyWeak(v16);
  return v8;
}

void ___SubcompletionGenerator_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  [WeakRetained CEKC2GroupCompletionAnimationDidComplete:*(void *)(a1 + 32) finished:a2 retargeted:a3];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v7 + 24)) {
    char v8 = a2;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v9 + 24)) {
    char v10 = 1;
  }
  else {
    char v10 = a3;
  }
  *(unsigned char *)(v9 + 24) = v10;
  if (!--*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (*(unsigned char *)(a1 + 88))
    {
      id v11 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      id v12 = (__CFRunLoop *)[v11 getCFRunLoop];

      long long v13 = (const void *)*MEMORY[0x1E4F1D418];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ___SubcompletionGenerator_block_invoke_3;
      block[3] = &unk_1E63CD958;
      long long v16 = *(_OWORD *)(a1 + 64);
      id v15 = *(id *)(a1 + 40);
      long long v17 = *(_OWORD *)(a1 + 48);
      CFRunLoopPerformBlock(v12, v13, block);
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void *___SubcompletionGenerator_block_invoke_3(void *result)
{
  if (!*(void *)(*(void *)(result[5] + 8) + 24))
  {
    *(unsigned char *)(*(void *)(result[6] + 8) + 24) = 1;
    return (void *)(*(uint64_t (**)(void, void, void))(result[4] + 16))(result[4], *(unsigned __int8 *)(*(void *)(result[7] + 8) + 24), *(unsigned __int8 *)(*(void *)(result[8] + 8) + 24));
  }
  return result;
}

@end