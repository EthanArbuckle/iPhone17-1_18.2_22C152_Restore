@interface UIDocumentPickerUnavailableViewController
@end

@implementation UIDocumentPickerUnavailableViewController

void __84___UIDocumentPickerUnavailableViewController__buttonBackgroundImageForState_traits___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F1C478];
  v6.origin.x = *(CGFloat *)MEMORY[0x263F00148];
  v6.origin.y = *(CGFloat *)(MEMORY[0x263F00148] + 8);
  v6.size.width = *(CGFloat *)(a1 + 32);
  v6.size.height = *(CGFloat *)(a1 + 40);
  CGRect v7 = CGRectInset(v6, 0.5, 0.5);
  objc_msgSend(v2, "bezierPathWithRoundedRect:cornerRadius:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height, 3.0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setLineWidth:1.0];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3 == 1)
  {
    [v4 fill];
  }
  else if (!v3)
  {
    [v4 stroke];
  }
}

@end