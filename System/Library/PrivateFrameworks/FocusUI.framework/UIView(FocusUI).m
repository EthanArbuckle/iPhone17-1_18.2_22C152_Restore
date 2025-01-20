@interface UIView(FocusUI)
+ (uint64_t)fcui_animateWithAnimationType:()FocusUI actions:completion:;
+ (uint64_t)fcui_animateWithDefaultParameters:()FocusUI completion:;
+ (uint64_t)fcui_animateWithSelectionParameters:()FocusUI completion:;
@end

@implementation UIView(FocusUI)

+ (uint64_t)fcui_animateWithAnimationType:()FocusUI actions:completion:
{
  if (a3 == 1) {
    double v3 = 50.0;
  }
  else {
    double v3 = 38.0;
  }
  return objc_msgSend(a1, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, dbl_21FF06410[a3 == 1], 0.0, 2.0, 300.0, v3, 0.0);
}

+ (uint64_t)fcui_animateWithDefaultParameters:()FocusUI completion:
{
  return objc_msgSend(a1, "fcui_animateWithAnimationType:actions:completion:", 0, a3, a4);
}

+ (uint64_t)fcui_animateWithSelectionParameters:()FocusUI completion:
{
  return objc_msgSend(a1, "fcui_animateWithAnimationType:actions:completion:", 1, a3, a4);
}

@end