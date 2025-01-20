@interface BPSAbstractOrderedMerge
@end

@implementation BPSAbstractOrderedMerge

void __42___BPSAbstractOrderedMerge_requestDemand___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  v5 = (void *)MEMORY[0x1AD11D920]();
  v6 = [MEMORY[0x1E4F1CA98] null];
  if ([v9 isEqual:v6])
  {
  }
  else
  {
    v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    uint64_t v8 = [v7 integerValue];

    if (!v8)
    {
      [*(id *)(a1 + 32) setObject:&unk_1F040EE08 atIndexedSubscript:a3];
      [v9 requestDemand:1];
    }
  }
}

void __50___BPSAbstractOrderedMerge_isWaitingForMoreValues__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  v7 = *(void **)(a1 + 32);
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
  int v9 = [v7 containsObject:v8];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !v9 || (v9 & 1) == 0 && ![v10 count])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __43___BPSAbstractOrderedMerge__isBuffersEmpty__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [MEMORY[0x1E4F1CA98] null];
  if ([v5 isEqual:v3])
  {
  }
  else
  {
    uint64_t v4 = [v5 count];

    if (v4) {
      goto LABEL_5;
    }
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
LABEL_5:
}

void __43___BPSAbstractOrderedMerge_nextValueIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  id v5 = [MEMORY[0x1E4F1CA98] null];
  char v6 = [v12 isEqual:v5];

  v7 = v12;
  if ((v6 & 1) == 0)
  {
    uint64_t v8 = [v12 firstObject];
    if (v8)
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v11 = *(void *)(v9 + 40);
      id v10 = (id *)(v9 + 40);
      if (!v11)
      {
LABEL_6:
        objc_storeStrong(v10, v8);
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
        goto LABEL_7;
      }
      if (objc_msgSend(*(id *)(a1 + 32), "compareFirst:withSecond:", v8) == -1)
      {
        id v10 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        goto LABEL_6;
      }
    }
LABEL_7:

    v7 = v12;
  }
}

@end