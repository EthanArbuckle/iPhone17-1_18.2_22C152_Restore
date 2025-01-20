@interface UIView
+ (void)rpccui_animateWithAnimationType:(int64_t)a3 actions:(id)a4 completion:(id)a5;
+ (void)rpccui_animateWithDefaultParameters:(id)a3 completion:(id)a4;
+ (void)rpccui_animateWithSelectionParameters:(id)a3 completion:(id)a4;
@end

@implementation UIView

+ (void)rpccui_animateWithAnimationType:(int64_t)a3 actions:(id)a4 completion:(id)a5
{
  if (a3 == 1) {
    double v5 = 50.0;
  }
  else {
    double v5 = 38.0;
  }
  _[a1 _animateUsingSpringWithDuration:2 delay:a4 options:a5 mass:dbl_552F0[a3 == 1] stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:v5 completion:0.0];
}

+ (void)rpccui_animateWithDefaultParameters:(id)a3 completion:(id)a4
{
}

+ (void)rpccui_animateWithSelectionParameters:(id)a3 completion:(id)a4
{
}

@end