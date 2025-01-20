@interface HUIDarkTextView
@end

@implementation HUIDarkTextView

void __57___HUIDarkTextView_setVisualStylingProvider_forCategory___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) nameLabel];
  [v2 automaticallyUpdateView:v3 withStyle:0];

  v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) valueLabel];
  [v4 automaticallyUpdateView:v5 withStyle:1];
}

@end