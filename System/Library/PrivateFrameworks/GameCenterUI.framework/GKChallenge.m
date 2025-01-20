@interface GKChallenge
@end

@implementation GKChallenge

void __61__GKChallenge_UI__loadImageWithSource_URLString_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v3 = [*(id *)(a1 + 32) defaultImage];
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __61__GKChallenge_UI__loadImageWithSource_URLString_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

@end