@interface UIViewController
- (void)rpccui_layoutViewIfNeededAndAppearingOrAppearedWithAnimation:(int64_t)a3;
- (void)rpccui_layoutViewIfNeededAndAppearingOrAppearedWithSelectionAnimation;
@end

@implementation UIViewController

- (void)rpccui_layoutViewIfNeededAndAppearingOrAppearedWithAnimation:(int64_t)a3
{
  if ([(UIViewController *)self bs_isAppearingOrAppeared])
  {
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      id v5 = [(UIViewController *)self view];
      [v5 layoutIfNeeded];
    }
    else
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_11448;
      v6[3] = &unk_68F10;
      v6[4] = self;
      +[UIView rpccui_animateWithAnimationType:a3 actions:v6 completion:0];
    }
  }
}

- (void)rpccui_layoutViewIfNeededAndAppearingOrAppearedWithSelectionAnimation
{
}

@end