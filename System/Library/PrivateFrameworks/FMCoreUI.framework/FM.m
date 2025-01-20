@interface FM
@end

@implementation FM

uint64_t __58__FM_Workaround_30408319_Button_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateIntrinsicContentSize];
  v2 = *(void **)(a1 + 32);
  return [v2 setNeedsLayout];
}

@end