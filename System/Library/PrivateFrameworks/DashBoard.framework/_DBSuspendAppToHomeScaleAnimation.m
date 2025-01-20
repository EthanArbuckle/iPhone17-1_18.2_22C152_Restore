@interface _DBSuspendAppToHomeScaleAnimation
- (void)startAnimationWithCompletion:(id)a3;
@end

@implementation _DBSuspendAppToHomeScaleAnimation

- (void)startAnimationWithCompletion:(id)a3
{
  v35[1] = *MEMORY[0x263EF8340];
  id v23 = a3;
  v25 = [(DBDashboardAnimation *)self appDockViewController];
  v4 = [(DBDashboardAnimation *)self fromTransitionContainerView];
  v5 = [(DBDashboardAnimation *)self fromView];
  v24 = [(DBDashboardAnimation *)self toIdentifier];
  v6 = [(DBDashboardAnimation *)self toTransitionContainerView];
  v7 = [(DBDashboardAnimation *)self toView];
  v8 = [(DBDashboardAnimation *)self rootContainerView];
  v9 = [(DBDashboardAnimation *)self rootContainerBackgroundColor];
  if (v6)
  {
    v10 = [DBAnimationView alloc];
    v11 = -[DBAnimationView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v6 addSubview:v11];
    [v6 bounds];
    -[DBAnimationView setFrame:](v11, "setFrame:");
    [(DBAnimationView *)v11 addSubview:v7];
    [(DBAnimationView *)v11 bounds];
    objc_msgSend(v7, "setFrame:");
    CGAffineTransformMakeScale(&v33, 0.95, 0.95);
    [(DBAnimationView *)v11 setTransform:&v33];
  }
  else
  {
    objc_opt_class();
    id v12 = v7;
    if (v12 && (objc_opt_isKindOfClass() & 1) != 0) {
      v11 = (DBAnimationView *)v12;
    }
    else {
      v11 = 0;
    }
  }
  v35[0] = @"filters.gaussianBlur.inputRadius";
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
  [(DBAnimationView *)v11 setKeysToAnimate:v13];

  v14 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
  [v14 setName:@"gaussianBlur"];
  [v14 setValue:&unk_26E17F100 forKey:@"inputRadius"];
  v15 = [(DBAnimationView *)v11 layer];
  v34 = v14;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
  [v15 setFilters:v16];

  [v4 addSubview:v5];
  [v4 bounds];
  objc_msgSend(v5, "setFrame:");
  [v25 setActiveBundleIdentifier:0 animated:1];
  v17 = (void *)MEMORY[0x263F82E00];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __66___DBSuspendAppToHomeScaleAnimation_startAnimationWithCompletion___block_invoke;
  v28[3] = &unk_2649B4848;
  id v29 = v8;
  id v30 = v9;
  v31 = v11;
  id v32 = v5;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __66___DBSuspendAppToHomeScaleAnimation_startAnimationWithCompletion___block_invoke_2;
  v26[3] = &unk_2649B3F00;
  id v27 = v23;
  id v18 = v23;
  id v19 = v5;
  v20 = v11;
  id v21 = v9;
  id v22 = v8;
  [v17 _animateUsingSpringWithDuration:0 delay:v28 options:v26 mass:0.5 stiffness:0.0 damping:3.0 initialVelocity:1000.0 animations:500.0 completion:0.0];
}

@end