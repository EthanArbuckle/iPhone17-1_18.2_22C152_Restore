@interface _DBLaunchAppFromHomeZoomAnimation
- (DBIconView)iconView;
- (_DBLaunchAppFromHomeZoomAnimation)initWithSettings:(id)a3;
- (void)startAnimationWithCompletion:(id)a3;
@end

@implementation _DBLaunchAppFromHomeZoomAnimation

- (_DBLaunchAppFromHomeZoomAnimation)initWithSettings:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DBLaunchAppFromHomeZoomAnimation;
  v5 = [(DBDashboardAnimation *)&v9 initWithSettings:v4];
  if (v5)
  {
    uint64_t v6 = [v4 iconView];
    iconView = v5->_iconView;
    v5->_iconView = (DBIconView *)v6;
  }
  return v5;
}

- (void)startAnimationWithCompletion:(id)a3
{
  v90[1] = *MEMORY[0x263EF8340];
  id v64 = a3;
  v66 = [(DBDashboardAnimation *)self appDockViewController];
  id v4 = [(DBDashboardAnimation *)self fromTransitionContainerView];
  v5 = [(DBDashboardAnimation *)self fromView];
  uint64_t v6 = [(_DBLaunchAppFromHomeZoomAnimation *)self iconView];
  v65 = [(DBDashboardAnimation *)self toIdentifier];
  v7 = [(DBDashboardAnimation *)self toTransitionContainerView];
  v8 = [(DBDashboardAnimation *)self toView];
  v63 = [(DBDashboardAnimation *)self rootContainerView];
  v62 = [(DBDashboardAnimation *)self rootContainerBackgroundColor];
  objc_super v9 = [v6 matchingIconViewWithConfigurationOptions:4];
  [v9 setShowsSquareCorners:1];
  [v6 iconImageFrame];
  objc_msgSend(v7, "convertRect:fromView:", v6);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  id v18 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v7 addSubview:v18];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);
  [v18 setClipsToBounds:1];
  v19 = [v18 layer];
  [v19 setCornerCurve:*MEMORY[0x263F15A20]];

  [v18 addSubview:v9];
  [v18 bounds];
  UIRectGetCenter();
  objc_msgSend(v9, "setCenter:");
  [v9 setLabelHidden:1];
  [v7 size];
  double v21 = v20;
  [v6 iconImageFrame];
  double v23 = v22;
  [v7 size];
  double v25 = v24;
  [v6 iconImageFrame];
  double v27 = v26;
  [v6 iconImageFrame];
  double v29 = v28;
  [v7 size];
  CGFloat v31 = v29 / v30;
  [v6 iconImageFrame];
  double v33 = v32;
  [v7 size];
  CGFloat v35 = v33 / v34;
  [v18 addSubview:v8];
  [v8 setAlpha:0.0];
  CGAffineTransformMakeScale(&v87, v31, v35);
  [v8 setTransform:&v87];
  [v18 bounds];
  UIRectGetCenter();
  objc_msgSend(v8, "setCenter:");
  v61 = v4;
  if (v4)
  {
    v36 = [DBAnimationView alloc];
    v37 = -[DBAnimationView initWithFrame:](v36, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v4 addSubview:v37];
    [v4 bounds];
    -[DBAnimationView setFrame:](v37, "setFrame:");
    [(DBAnimationView *)v37 addSubview:v5];
    [(DBAnimationView *)v37 bounds];
    objc_msgSend(v5, "setFrame:");
  }
  else
  {
    objc_opt_class();
    id v38 = v5;
    if (v38 && (objc_opt_isKindOfClass() & 1) != 0) {
      v37 = (DBAnimationView *)v38;
    }
    else {
      v37 = 0;
    }
  }
  v90[0] = @"filters.gaussianBlur.inputRadius";
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v90 count:1];
  [(DBAnimationView *)v37 setKeysToAnimate:v39];

  v60 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
  [v60 setName:@"gaussianBlur"];
  [v60 setValue:&unk_26E17F160 forKey:@"inputRadius"];
  v40 = [(DBAnimationView *)v37 layer];
  v89 = v60;
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v89 count:1];
  [v40 setFilters:v41];

  [MEMORY[0x263F158F8] begin];
  v42 = (void *)MEMORY[0x263F82E00];
  v85[0] = MEMORY[0x263EF8330];
  v85[1] = 3221225472;
  v85[2] = __66___DBLaunchAppFromHomeZoomAnimation_startAnimationWithCompletion___block_invoke;
  v85[3] = &unk_2649B3E90;
  v86 = v37;
  v82[0] = MEMORY[0x263EF8330];
  v82[1] = 3221225472;
  v82[2] = __66___DBLaunchAppFromHomeZoomAnimation_startAnimationWithCompletion___block_invoke_109;
  v82[3] = &unk_2649B6200;
  id v83 = v5;
  v84 = v86;
  v58 = v86;
  id v59 = v5;
  [v42 _animateUsingSpringWithDuration:0 delay:v85 options:v82 mass:0.5 stiffness:0.0 damping:3.0 initialVelocity:1000.0 animations:500.0 completion:0.0];
  v43 = (void *)MEMORY[0x263F82E00];
  v80[0] = MEMORY[0x263EF8330];
  v80[1] = 3221225472;
  v80[2] = __66___DBLaunchAppFromHomeZoomAnimation_startAnimationWithCompletion___block_invoke_112;
  v80[3] = &unk_2649B3E90;
  id v44 = v8;
  id v81 = v44;
  [v43 animateWithDuration:v80 animations:0.07];
  v45 = [MEMORY[0x263F157D8] animationWithKeyPath:@"cornerRadius"];
  [v45 setValues:&unk_26E17EFD8];
  [v45 setKeyTimes:&unk_26E17EFF0];
  [v45 setDuration:0.5];
  v46 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB0]];
  v88[0] = v46;
  v47 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
  v88[1] = v47;
  v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v88 count:2];
  [v45 setTimingFunctions:v48];

  v49 = [v18 layer];
  [v49 addAnimation:v45 forKey:@"cornerRadius"];

  [v66 setActiveBundleIdentifier:v65 animated:1];
  v50 = (void *)MEMORY[0x263F82E00];
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __66___DBLaunchAppFromHomeZoomAnimation_startAnimationWithCompletion___block_invoke_125;
  v71[3] = &unk_2649B6228;
  id v72 = v44;
  id v73 = v7;
  id v74 = v18;
  double v78 = v21 / v23;
  double v79 = v25 / v27;
  id v75 = v9;
  id v76 = v63;
  id v77 = v62;
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __66___DBLaunchAppFromHomeZoomAnimation_startAnimationWithCompletion___block_invoke_2;
  v67[3] = &unk_2649B6250;
  id v69 = v74;
  id v70 = v64;
  id v68 = v75;
  id v57 = v74;
  id v51 = v75;
  id v52 = v64;
  id v53 = v62;
  id v54 = v63;
  id v55 = v7;
  id v56 = v44;
  [v50 _animateUsingSpringWithDuration:0 delay:v71 options:v67 mass:0.5 stiffness:0.0 damping:3.0 initialVelocity:1000.0 animations:500.0 completion:0.0];
  [MEMORY[0x263F158F8] commit];
}

- (DBIconView)iconView
{
  return self->_iconView;
}

- (void).cxx_destruct
{
}

@end