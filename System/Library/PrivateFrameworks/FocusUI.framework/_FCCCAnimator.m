@interface _FCCCAnimator
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation _FCCCAnimator

- (void)animateTransition:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x263F82E00];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35___FCCCAnimator_animateTransition___block_invoke;
  v8[3] = &unk_264542B68;
  id v9 = v3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35___FCCCAnimator_animateTransition___block_invoke_2;
  v6[3] = &unk_264542CC8;
  id v7 = v9;
  id v5 = v9;
  objc_msgSend(v4, "fcui_animateWithAnimationType:actions:completion:", 0, v8, v6);
}

- (double)transitionDuration:(id)a3
{
  return 0.81151;
}

@end