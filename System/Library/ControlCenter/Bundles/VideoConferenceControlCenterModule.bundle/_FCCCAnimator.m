@interface _FCCCAnimator
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation _FCCCAnimator

- (void)animateTransition:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_183F8;
  v6[3] = &unk_68F10;
  id v7 = a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1844C;
  v4[3] = &unk_69310;
  id v5 = v7;
  id v3 = v7;
  +[UIView rpccui_animateWithAnimationType:0 actions:v6 completion:v4];
}

- (double)transitionDuration:(id)a3
{
  return 0.72;
}

@end