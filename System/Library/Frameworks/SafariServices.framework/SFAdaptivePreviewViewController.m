@interface SFAdaptivePreviewViewController
@end

@implementation SFAdaptivePreviewViewController

uint64_t __58___SFAdaptivePreviewViewController_setLinkPreviewEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePreferredContentSize];
}

uint64_t __63___SFAdaptivePreviewViewController__updatePreferredContentSize__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];

  v3 = *(void **)(a1 + 40);

  return [v3 layoutIfNeeded];
}

@end