@interface GEOConfigAddListenerForKey
@end

@implementation GEOConfigAddListenerForKey

void ___GEOConfigAddListenerForKey_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = [a5 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void ___GEOConfigAddListenerForKey_block_invoke_2(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = a1[4];
  id v12 = a3;
  id v13 = a2;
  v14 = [v10 objectForKeyedSubscript:v11];
  v15 = (id *)(*(void *)(a1[6] + 8) + 40);
  if (v14) {
    objc_storeStrong(v15, v14);
  }
  else {
    [v10 setObject:*v15 forKeyedSubscript:a1[4]];
  }

  uint64_t v16 = (*(void (**)(void))(a1[5] + 16))();

  uint64_t v17 = *(void *)(a1[7] + 8);
  v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;
}

@end