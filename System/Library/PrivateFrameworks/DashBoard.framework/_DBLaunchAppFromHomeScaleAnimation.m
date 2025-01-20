@interface _DBLaunchAppFromHomeScaleAnimation
- (void)startAnimationWithCompletion:(id)a3;
@end

@implementation _DBLaunchAppFromHomeScaleAnimation

- (void)startAnimationWithCompletion:(id)a3
{
  v39[1] = *MEMORY[0x263EF8340];
  id v25 = a3;
  v27 = [(DBDashboardAnimation *)self appDockViewController];
  v4 = [(DBDashboardAnimation *)self fromTransitionContainerView];
  v5 = [(DBDashboardAnimation *)self fromView];
  v26 = [(DBDashboardAnimation *)self toIdentifier];
  v6 = [(DBDashboardAnimation *)self toTransitionContainerView];
  v7 = [(DBDashboardAnimation *)self toView];
  v24 = [(DBDashboardAnimation *)self rootContainerView];
  v8 = [(DBDashboardAnimation *)self rootContainerBackgroundColor];
  if (v4)
  {
    v9 = [DBAnimationView alloc];
    v10 = -[DBAnimationView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v4 insertSubview:v10 atIndex:0];
    [v4 bounds];
    -[DBAnimationView setFrame:](v10, "setFrame:");
    [(DBAnimationView *)v10 addSubview:v5];
    [(DBAnimationView *)v10 bounds];
    objc_msgSend(v5, "setFrame:");
  }
  else
  {
    objc_opt_class();
    id v11 = v5;
    if (v11 && (objc_opt_isKindOfClass() & 1) != 0) {
      v10 = (DBAnimationView *)v11;
    }
    else {
      v10 = 0;
    }
  }
  v39[0] = @"filters.gaussianBlur.inputRadius";
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];
  [(DBAnimationView *)v10 setKeysToAnimate:v12];

  v13 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
  [v13 setName:@"gaussianBlur"];
  [v13 setValue:&unk_26E17F160 forKey:@"inputRadius"];
  v14 = [(DBAnimationView *)v10 layer];
  v38 = v13;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];
  [v14 setFilters:v15];

  [v6 addSubview:v7];
  [v6 bounds];
  objc_msgSend(v7, "setFrame:");
  [v7 setAlpha:0.0];
  CGAffineTransformMakeScale(&v37, 0.95, 0.95);
  [v7 setTransform:&v37];
  v16 = [(DBDashboardAnimation *)self toIdentifier];
  [v27 setActiveBundleIdentifier:v16 animated:1];

  v17 = (void *)MEMORY[0x263F82E00];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __67___DBLaunchAppFromHomeScaleAnimation_startAnimationWithCompletion___block_invoke;
  v32[3] = &unk_2649B4848;
  id v33 = v24;
  id v34 = v8;
  v35 = v10;
  id v36 = v7;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __67___DBLaunchAppFromHomeScaleAnimation_startAnimationWithCompletion___block_invoke_2;
  v28[3] = &unk_2649B6250;
  id v30 = v5;
  id v31 = v25;
  v29 = v35;
  id v18 = v5;
  v19 = v35;
  id v20 = v25;
  id v21 = v7;
  id v22 = v8;
  id v23 = v24;
  [v17 _animateUsingSpringWithDuration:0 delay:v32 options:v28 mass:0.5 stiffness:0.0 damping:3.0 initialVelocity:1000.0 animations:500.0 completion:0.0];
}

@end