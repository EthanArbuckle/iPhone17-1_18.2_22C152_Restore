@interface UIView
@end

@implementation UIView

void __60__UIView_BatteryCenterUI__observeContentSizeCategoryChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) traitCollection];
  v2 = [v3 preferredContentSizeCategory];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

@end