@interface MXExtensionMatchingMerger
@end

@implementation MXExtensionMatchingMerger

void __58___MXExtensionMatchingMerger_receiveExtensions_withIndex___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 56);
  if (v2 <= 2)
  {
    uint64_t v3 = *(void *)(a1 + 32) + 8 * v2;
    id v4 = *(id *)(a1 + 40);
    v5 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v4;
  }
  v6 = *(void **)(a1 + 32);
  if (v6[2])
  {
    objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:");
    v6 = *(void **)(a1 + 32);
  }
  if (v6[3])
  {
    objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:");
    v6 = *(void **)(a1 + 32);
  }
  if (v6[4])
  {
    v7 = *(void **)(a1 + 48);
    objc_msgSend(v7, "addObjectsFromArray:");
  }
}

void __45___MXExtensionMatchingMerger_clearExtensions__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = 0;
}

@end