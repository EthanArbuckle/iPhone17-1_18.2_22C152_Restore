@interface _CSActivityPickerAnimator
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation _CSActivityPickerAnimator

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F42FF0];
  [(_CSActivityPickerAnimator *)self transitionDuration:v4];
  double v7 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47___CSActivityPickerAnimator_animateTransition___block_invoke;
  v11[3] = &unk_1E6AD87F8;
  id v12 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47___CSActivityPickerAnimator_animateTransition___block_invoke_3;
  v9[3] = &unk_1E6AD8A40;
  id v10 = v12;
  id v8 = v12;
  [v5 _animateUsingSpringWithDuration:2 delay:v11 options:v9 mass:v7 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:38.0 completion:0.0];
}

- (double)transitionDuration:(id)a3
{
  id v3 = a3;
  double v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v3 _duration];
    double v4 = v5;
  }

  return v4;
}

@end