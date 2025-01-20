@interface _DBAppSwitchReducedMotionAnimation
- (void)startAnimationWithCompletion:(id)a3;
@end

@implementation _DBAppSwitchReducedMotionAnimation

- (void)startAnimationWithCompletion:(id)a3
{
  id v4 = a3;
  v16 = [(DBDashboardAnimation *)self appDockViewController];
  v5 = [(DBDashboardAnimation *)self fromTransitionContainerView];
  v6 = [(DBDashboardAnimation *)self fromView];
  v7 = [(DBDashboardAnimation *)self toIdentifier];
  v8 = [(DBDashboardAnimation *)self toTransitionContainerView];
  v9 = [(DBDashboardAnimation *)self toView];
  v10 = [(DBDashboardAnimation *)self rootContainerView];
  v11 = [(DBDashboardAnimation *)self rootContainerBackgroundColor];
  [v8 addSubview:v9];
  [v8 bounds];
  objc_msgSend(v9, "setFrame:");
  [v5 addSubview:v6];
  [v5 bounds];
  objc_msgSend(v6, "setFrame:");
  [v16 setActiveBundleIdentifier:v7 animated:1];
  v12 = (void *)MEMORY[0x263F82E00];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __67___DBAppSwitchReducedMotionAnimation_startAnimationWithCompletion___block_invoke;
  v19[3] = &unk_2649B3ED8;
  id v20 = v10;
  id v21 = v11;
  v22 = self;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67___DBAppSwitchReducedMotionAnimation_startAnimationWithCompletion___block_invoke_2;
  v17[3] = &unk_2649B3F00;
  id v18 = v4;
  id v13 = v4;
  id v14 = v11;
  id v15 = v10;
  [v12 animateWithDuration:v19 animations:v17 completion:0.5];
}

@end