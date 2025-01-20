@interface CRKCardViewControllerTransitionAnimator
@end

@implementation CRKCardViewControllerTransitionAnimator

void __118___CRKCardViewControllerTransitionAnimator_transitionFromCardViewController_toCardViewController_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setAnimations:0];
  [*(id *)(a1 + 40) removeFromParentViewController];
  [*(id *)(a1 + 48) removeFromSuperview];
  [*(id *)(a1 + 40) didMoveToParentViewController:0];
  uint64_t v4 = [*(id *)(a1 + 32) completion];
  id v6 = (id)v4;
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }
  [*(id *)(a1 + 32) setCompletion:0];
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
}

void __130___CRKCardViewControllerTransitionAnimator__prepareAnimationFromCardViewController_toCardViewController_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) layer];
  [v1 setOpacity:0.0];
}

uint64_t __130___CRKCardViewControllerTransitionAnimator__prepareAnimationFromCardViewController_toCardViewController_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  double x = v9.origin.x;
  double y = v9.origin.y;
  double Width = CGRectGetWidth(v9);
  uint64_t v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "contentHeightForWidth:");

  return objc_msgSend(v5, "setFrame:", x, y, Width, v6);
}

void __130___CRKCardViewControllerTransitionAnimator__prepareAnimationFromCardViewController_toCardViewController_withAnimationCoordinator___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) layer];
  LODWORD(v3) = 1.0;
  [v2 setOpacity:v3];

  id v4 = [*(id *)(a1 + 40) layer];
  [v4 setOpacity:0.0];
}

uint64_t __130___CRKCardViewControllerTransitionAnimator__prepareAnimationFromCardViewController_toCardViewController_withAnimationCoordinator___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsLayout];
}

@end