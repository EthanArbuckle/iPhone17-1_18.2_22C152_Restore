@interface UIDocumentPickerContainerURLItem
@end

@implementation UIDocumentPickerContainerURLItem

void __48___UIDocumentPickerContainerURLItem_cacheValues__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeCachedValues];
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 104);
  *(void *)(v3 + 104) = v2;

  uint64_t v5 = [*(id *)(a1 + 48) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v5;

  uint64_t v8 = [*(id *)(a1 + 56) copy];
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 120);
  *(void *)(v9 + 120) = v8;

  uint64_t v11 = [*(id *)(a1 + 64) copy];
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 128);
  *(void *)(v12 + 128) = v11;

  *(void *)(*(void *)(a1 + 32) + 96) = *(void *)(a1 + 96);
  uint64_t v14 = [*(id *)(a1 + 72) copy];
  uint64_t v15 = *(void *)(a1 + 32);
  v16 = *(void **)(v15 + 152);
  *(void *)(v15 + 152) = v14;

  uint64_t v17 = [*(id *)(a1 + 80) copy];
  uint64_t v18 = *(void *)(a1 + 32);
  v19 = *(void **)(v18 + 160);
  *(void *)(v18 + 160) = v17;

  uint64_t v20 = [*(id *)(a1 + 88) copy];
  uint64_t v21 = *(void *)(a1 + 32);
  v22 = *(void **)(v21 + 176);
  *(void *)(v21 + 176) = v20;

  *(unsigned char *)(*(void *)(a1 + 32) + 168) = *(unsigned char *)(a1 + 104);
}

@end