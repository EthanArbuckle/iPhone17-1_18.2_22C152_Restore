@interface UIView
@end

@implementation UIView

void __54__UIView_GKAdditions___gkEnumerateSubviewsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  [v5 _gkEnumerateSubviewsUsingBlock:*(void *)(a1 + 32)];
}

@end