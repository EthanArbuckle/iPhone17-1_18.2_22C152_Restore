@interface PreviewImageForAsset
@end

@implementation PreviewImageForAsset

void ___PreviewImageForAsset_block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v10 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F150B0]];

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

@end