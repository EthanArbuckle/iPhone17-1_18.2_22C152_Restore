@interface _DBSuspendAppToHomeReducedMotionAnimation
- (void)startAnimationWithCompletion:(id)a3;
@end

@implementation _DBSuspendAppToHomeReducedMotionAnimation

- (void)startAnimationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(DBDashboardAnimation *)self fromTransitionContainerView];
  v6 = [(DBDashboardAnimation *)self fromView];
  v7 = [(DBDashboardAnimation *)self toTransitionContainerView];
  v8 = [(DBDashboardAnimation *)self toView];
  v9 = [(DBDashboardAnimation *)self rootContainerView];
  v10 = [(DBDashboardAnimation *)self rootContainerBackgroundColor];
  [v5 addSubview:v6];
  [v5 bounds];
  objc_msgSend(v6, "setFrame:");
  id v11 = v8;
  id v12 = v11;
  if (v7)
  {
    [v7 addSubview:v11];
    [v7 bounds];
    objc_msgSend(v11, "setFrame:");
    id v12 = v7;
  }
  [v12 setAlpha:0.999];
  v13 = (void *)MEMORY[0x263F82E00];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __74___DBSuspendAppToHomeReducedMotionAnimation_startAnimationWithCompletion___block_invoke;
  v21[3] = &unk_2649B4848;
  id v22 = v9;
  id v23 = v10;
  id v24 = v12;
  id v25 = v6;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __74___DBSuspendAppToHomeReducedMotionAnimation_startAnimationWithCompletion___block_invoke_2;
  v19[3] = &unk_2649B3F00;
  id v20 = v4;
  id v14 = v4;
  id v15 = v6;
  id v16 = v12;
  id v17 = v10;
  id v18 = v9;
  [v13 animateWithDuration:v21 animations:v19 completion:0.5];
}

@end