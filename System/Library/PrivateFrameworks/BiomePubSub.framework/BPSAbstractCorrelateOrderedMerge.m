@interface BPSAbstractCorrelateOrderedMerge
@end

@implementation BPSAbstractCorrelateOrderedMerge

void __51___BPSAbstractCorrelateOrderedMerge_requestDemand___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  v5 = [MEMORY[0x1E4F1CA98] null];
  if ([v8 isEqual:v5])
  {
  }
  else
  {
    v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    uint64_t v7 = [v6 integerValue];

    if (!v7)
    {
      [*(id *)(a1 + 32) setObject:&unk_1F040EE68 atIndexedSubscript:a3];
      [v8 requestDemand:1];
    }
  }
}

void __59___BPSAbstractCorrelateOrderedMerge_isWaitingForMoreValues__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  int v9 = [v7 containsObject:v8];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !v9 || (v9 & 1) == 0 && ![v10 count])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __52___BPSAbstractCorrelateOrderedMerge__isBuffersEmpty__block_invoke(uint64_t a1, void *a2)
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

void __52___BPSAbstractCorrelateOrderedMerge_nextValueIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  id v5 = [MEMORY[0x1E4F1CA98] null];
  char v6 = [v12 isEqual:v5];

  uint64_t v7 = v12;
  if ((v6 & 1) == 0)
  {
    id v8 = [v12 firstObject];
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

    uint64_t v7 = v12;
  }
}

@end