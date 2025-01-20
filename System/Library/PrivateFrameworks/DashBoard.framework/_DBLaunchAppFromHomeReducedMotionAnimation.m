@interface _DBLaunchAppFromHomeReducedMotionAnimation
- (void)startAnimationWithCompletion:(id)a3;
@end

@implementation _DBLaunchAppFromHomeReducedMotionAnimation

- (void)startAnimationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(DBDashboardAnimation *)self appDockViewController];
  v6 = [(DBDashboardAnimation *)self fromTransitionContainerView];
  v7 = [(DBDashboardAnimation *)self fromView];
  v8 = [(DBDashboardAnimation *)self toIdentifier];
  v9 = [(DBDashboardAnimation *)self toTransitionContainerView];
  v10 = [(DBDashboardAnimation *)self toView];
  v11 = [(DBDashboardAnimation *)self rootContainerView];
  v12 = [(DBDashboardAnimation *)self rootContainerBackgroundColor];
  if (v6)
  {
    [v6 addSubview:v7];
    [v6 bounds];
    objc_msgSend(v7, "setFrame:");
  }
  [v9 addSubview:v10];
  [v9 bounds];
  objc_msgSend(v10, "setFrame:");
  [v10 setAlpha:0.0];
  v13 = [(DBDashboardAnimation *)self toIdentifier];
  [v5 setActiveBundleIdentifier:v13 animated:1];

  v14 = (void *)MEMORY[0x263F82E00];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __75___DBLaunchAppFromHomeReducedMotionAnimation_startAnimationWithCompletion___block_invoke;
  v21[3] = &unk_2649B3ED8;
  id v22 = v11;
  id v23 = v12;
  id v24 = v10;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __75___DBLaunchAppFromHomeReducedMotionAnimation_startAnimationWithCompletion___block_invoke_2;
  v19[3] = &unk_2649B3F00;
  id v20 = v4;
  id v15 = v4;
  id v16 = v10;
  id v17 = v12;
  id v18 = v11;
  [v14 animateWithDuration:v21 animations:v19 completion:0.5];
}

@end