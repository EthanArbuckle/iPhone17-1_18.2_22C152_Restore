@interface _DBAppSwitchDosidoAnimation
- (void)startAnimationWithCompletion:(id)a3;
@end

@implementation _DBAppSwitchDosidoAnimation

- (void)startAnimationWithCompletion:(id)a3
{
  v36[1] = *MEMORY[0x263EF8340];
  id v23 = a3;
  v4 = [(DBDashboardAnimation *)self appDockViewController];
  v5 = [(DBDashboardAnimation *)self fromTransitionContainerView];
  v22 = [(DBDashboardAnimation *)self fromView];
  v6 = [(DBDashboardAnimation *)self toIdentifier];
  v7 = [(DBDashboardAnimation *)self toTransitionContainerView];
  v8 = [(DBDashboardAnimation *)self toView];
  v9 = [(DBDashboardAnimation *)self rootContainerView];
  v10 = [(DBDashboardAnimation *)self rootContainerBackgroundColor];
  v25 = v7;
  [v7 addSubview:v8];
  [v7 bounds];
  objc_msgSend(v8, "setFrame:");
  CGAffineTransformMakeScale(&v34, 0.95, 0.95);
  [v8 setTransform:&v34];
  v11 = objc_alloc_init(DBAnimationView);
  v36[0] = @"filters.gaussianBlur.inputRadius";
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:1];
  [(DBAnimationView *)v11 setKeysToAnimate:v12];

  v24 = v5;
  [v5 addSubview:v11];
  [v5 bounds];
  -[DBAnimationView setFrame:](v11, "setFrame:");
  [(DBAnimationView *)v11 addSubview:v22];
  v13 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
  [v13 setName:@"gaussianBlur"];
  [v13 setValue:&unk_26E17F0E0 forKey:@"inputRadius"];
  v14 = [(DBAnimationView *)v11 layer];
  v35 = v13;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
  [v14 setFilters:v15];

  [v4 setActiveBundleIdentifier:v6 animated:1];
  v16 = (void *)MEMORY[0x263F82E00];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __60___DBAppSwitchDosidoAnimation_startAnimationWithCompletion___block_invoke;
  v29[3] = &unk_2649B4848;
  id v30 = v9;
  id v31 = v10;
  id v32 = v8;
  v33 = v11;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __60___DBAppSwitchDosidoAnimation_startAnimationWithCompletion___block_invoke_94;
  v26[3] = &unk_2649B5328;
  v27 = v33;
  id v28 = v23;
  id v17 = v23;
  v18 = v33;
  id v19 = v8;
  id v20 = v10;
  id v21 = v9;
  [v16 _animateUsingSpringWithDuration:0 delay:v29 options:v26 mass:0.91 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:400.0 completion:0.0];
}

@end