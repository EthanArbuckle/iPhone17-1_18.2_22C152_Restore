@interface UTDynamicGetTagSpecification
@end

@implementation UTDynamicGetTagSpecification

void ___UTDynamicGetTagSpecification_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  v11 = (void *)[[NSString alloc] initWithBytes:*(void *)a3 length:*(unsigned int *)(a3 + 8) encoding:4];
  if (v11)
  {
    v14 = v11;
    id v12 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v11];
    if (!v12)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v12 forKeyedSubscript:v14];
    }
    v13 = (void *)[[NSString alloc] initWithBytes:*(void *)a5 length:*(unsigned int *)(a5 + 8) encoding:4];
    if (v13) {
      [v12 addObject:v13];
    }

    v11 = v14;
  }
}

@end