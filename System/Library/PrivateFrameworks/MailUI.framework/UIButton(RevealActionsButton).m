@interface UIButton(RevealActionsButton)
+ (id)mf_revealActionsButtonWithAccessibilityIdentifier:()RevealActionsButton;
- (id)mf_revealActionButtonPointerStyleInView:()RevealActionsButton;
@end

@implementation UIButton(RevealActionsButton)

+ (id)mf_revealActionsButtonWithAccessibilityIdentifier:()RevealActionsButton
{
  v3 = (void *)MEMORY[0x1E4FB14D0];
  id v4 = a3;
  v5 = [v3 buttonWithType:0];
  v6 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_symbolConfigurationForView:", 16);
  [v5 setPreferredSymbolConfiguration:v6 forImageInState:0];

  v7 = [MEMORY[0x1E4FB1818] systemImageNamed:*MEMORY[0x1E4F35088]];
  [v5 setImage:v7 forState:0];

  [v5 setAccessibilityIdentifier:v4];
  [v5 setShowsLargeContentViewer:1];
  return v5;
}

- (id)mf_revealActionButtonPointerStyleInView:()RevealActionsButton
{
  id v4 = (void *)MEMORY[0x1E4FB1AB0];
  v5 = (objc_class *)MEMORY[0x1E4FB1D48];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithView:a1];
  v8 = [v4 effectWithPreview:v7];

  v9 = [a1 imageView];
  [v9 frame];
  UIRectGetCenter();
  objc_msgSend(v6, "convertPoint:fromView:", a1);

  objc_msgSend(v6, "mui_currentScreenScale");
  UIRectCenteredAboutPointScale();
  CGRect v15 = CGRectOffset(v14, 0.0, 1.0);
  v10 = objc_msgSend(MEMORY[0x1E4FB1AE0], "shapeWithRoundedRect:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
  v11 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v8 shape:v10];

  return v11;
}

@end