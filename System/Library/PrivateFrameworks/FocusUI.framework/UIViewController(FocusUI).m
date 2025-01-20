@interface UIViewController(FocusUI)
- (uint64_t)fcui_layoutViewIfNeededAndAppearingOrAppearedWithSelectionAnimation;
- (void)fcui_layoutViewIfNeededAndAppearingOrAppearedWithAnimation:()FocusUI;
@end

@implementation UIViewController(FocusUI)

- (void)fcui_layoutViewIfNeededAndAppearingOrAppearedWithAnimation:()FocusUI
{
  if (objc_msgSend(a1, "bs_isAppearingOrAppeared"))
  {
    if ([MEMORY[0x263F82E00] _isInAnimationBlockWithAnimationsEnabled])
    {
      id v5 = [a1 view];
      [v5 layoutIfNeeded];
    }
    else
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __88__UIViewController_FocusUI__fcui_layoutViewIfNeededAndAppearingOrAppearedWithAnimation___block_invoke;
      v6[3] = &unk_264542B68;
      v6[4] = a1;
      objc_msgSend(MEMORY[0x263F82E00], "fcui_animateWithAnimationType:actions:completion:", a3, v6, 0);
    }
  }
}

- (uint64_t)fcui_layoutViewIfNeededAndAppearingOrAppearedWithSelectionAnimation
{
  return objc_msgSend(a1, "fcui_layoutViewIfNeededAndAppearingOrAppearedWithAnimation:", 1);
}

@end