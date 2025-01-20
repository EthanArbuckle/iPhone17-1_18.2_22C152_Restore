@interface NPRemoveEmojis
@end

@implementation NPRemoveEmojis

void ___NPRemoveEmojis_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v6)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3, a4);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v6 addObject:v11];
}

@end