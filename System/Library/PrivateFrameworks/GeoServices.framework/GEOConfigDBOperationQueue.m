@interface GEOConfigDBOperationQueue
@end

@implementation GEOConfigDBOperationQueue

uint64_t __47___GEOConfigDBOperationQueue_enqueueOperation___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 24) addObject:a1[5]];
  uint64_t result = [*(id *)(a1[4] + 24) count];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __44___GEOConfigDBOperationQueue_flushOnDBQueue__block_invoke_331(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v5), "performOperation", (void)v8))
        {
          uint64_t v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = 1;
LABEL_11:

  return v6;
}

uint64_t __35___GEOConfigDBOperationQueue_flush__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) flushOnDBQueue];
}

void __35___GEOConfigDBOperationQueue_init___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained flush];
}

void __44___GEOConfigDBOperationQueue_flushOnDBQueue__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
    uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = v2;
  }
}

@end