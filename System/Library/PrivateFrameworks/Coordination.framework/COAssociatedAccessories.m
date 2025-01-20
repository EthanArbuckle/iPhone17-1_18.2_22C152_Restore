@interface COAssociatedAccessories
@end

@implementation COAssociatedAccessories

void ___COAssociatedAccessories_block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 mediaProfile];
  id v8 = [v3 accessory];

  v4 = v8;
  if (v8)
  {
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setByAddingObject:v8];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v4 = v8;
  }
}

@end