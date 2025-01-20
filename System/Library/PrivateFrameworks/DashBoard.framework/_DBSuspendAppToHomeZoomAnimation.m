@interface _DBSuspendAppToHomeZoomAnimation
- (DBIconView)iconView;
- (_DBSuspendAppToHomeZoomAnimation)initWithSettings:(id)a3;
- (void)setIconView:(id)a3;
- (void)startAnimationWithCompletion:(id)a3;
@end

@implementation _DBSuspendAppToHomeZoomAnimation

- (_DBSuspendAppToHomeZoomAnimation)initWithSettings:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DBSuspendAppToHomeZoomAnimation;
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
  v89[1] = *MEMORY[0x263EF8340];
  id v61 = a3;
  v64 = [(DBDashboardAnimation *)self appDockViewController];
  id v4 = [(DBDashboardAnimation *)self fromTransitionContainerView];
  v5 = [(DBDashboardAnimation *)self fromView];
  uint64_t v6 = [(_DBSuspendAppToHomeZoomAnimation *)self iconView];
  v63 = [(DBDashboardAnimation *)self toIdentifier];
  v7 = [(DBDashboardAnimation *)self toTransitionContainerView];
  v8 = [(DBDashboardAnimation *)self toView];
  v60 = [(DBDashboardAnimation *)self rootContainerView];
  v59 = [(DBDashboardAnimation *)self rootContainerBackgroundColor];
  [v6 iconImageFrame];
  objc_msgSend(v6, "convertRect:toView:", v4);
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  v58 = v7;
  if (v7)
  {
    v17 = [DBAnimationView alloc];
    v18 = -[DBAnimationView initWithFrame:](v17, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v7 addSubview:v18];
    [v7 bounds];
    -[DBAnimationView setFrame:](v18, "setFrame:");
    [(DBAnimationView *)v18 addSubview:v8];
    [(DBAnimationView *)v18 bounds];
    objc_msgSend(v8, "setFrame:");
  }
  else
  {
    objc_opt_class();
    id v19 = v8;
    if (v19 && (objc_opt_isKindOfClass() & 1) != 0) {
      v18 = (DBAnimationView *)v19;
    }
    else {
      v18 = 0;
    }
  }
  v89[0] = @"filters.gaussianBlur.inputRadius";
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:1];
  [(DBAnimationView *)v18 setKeysToAnimate:v20];

  v57 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
  [v57 setName:@"gaussianBlur"];
  [v57 setValue:&unk_26E17F100 forKey:@"inputRadius"];
  v21 = [(DBAnimationView *)v18 layer];
  v88 = v57;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v88 count:1];
  [v21 setFilters:v22];

  v23 = [(DBAnimationView *)v18 layer];
  [v23 setShouldRasterize:0];

  CGAffineTransformMakeScale(&v87, 0.95, 0.95);
  [(DBAnimationView *)v18 setTransform:&v87];
  v24 = [v6 matchingIconViewWithConfigurationOptions:4];
  [v24 setShowsSquareCorners:1];
  [v24 setLabelHidden:1];
  [v24 setShadowHidden:1];
  v55 = v6;
  id v25 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v25 addSubview:v24];
  [v4 addSubview:v25];
  [v4 bounds];
  objc_msgSend(v25, "setFrame:");
  v26 = [v25 layer];
  [v26 setCornerRadius:13.5];

  [v25 setClipsToBounds:1];
  [v25 addSubview:v5];
  [v25 bounds];
  objc_msgSend(v5, "setFrame:");
  [v25 size];
  double v28 = v27;
  [v24 iconImageFrame];
  CGFloat v30 = v28 / v29;
  [v25 size];
  double v32 = v31;
  [v24 iconImageFrame];
  CGAffineTransformMakeScale(&v86, v30, v32 / v33);
  [v24 setTransform:&v86];
  [v25 bounds];
  UIRectGetCenter();
  objc_msgSend(v24, "setCenter:");
  [v24 iconImageFrame];
  double v35 = v34;
  [v5 size];
  double v37 = v35 / v36;
  [v24 iconImageFrame];
  double v39 = v38;
  [v5 size];
  double v41 = v39 / v40;
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F157D8] animationWithKeyPath:@"cornerRadius"];
  v42 = v56 = v4;
  [v42 setValues:&unk_26E17EF60];
  [v42 setKeyTimes:&unk_26E17EF78];
  [v42 setDuration:0.25];
  v43 = [v25 layer];
  [v43 addAnimation:v42 forKey:@"cornerRadius"];

  [v64 setActiveBundleIdentifier:0 animated:1];
  v44 = (void *)MEMORY[0x263F82E00];
  v84[0] = MEMORY[0x263EF8330];
  v84[1] = 3221225472;
  v84[2] = __65___DBSuspendAppToHomeZoomAnimation_startAnimationWithCompletion___block_invoke;
  v84[3] = &unk_2649B3E90;
  id v45 = v5;
  id v85 = v45;
  [v44 animateWithDuration:0 delay:v84 options:0 animations:0.14 completion:0.055];
  v46 = (void *)MEMORY[0x263F82E00];
  v70[0] = MEMORY[0x263EF8330];
  v70[1] = 3221225472;
  v70[2] = __65___DBSuspendAppToHomeZoomAnimation_startAnimationWithCompletion___block_invoke_2;
  v70[3] = &unk_2649B5E58;
  id v71 = v60;
  id v72 = v59;
  uint64_t v78 = v10;
  uint64_t v79 = v12;
  uint64_t v80 = v14;
  uint64_t v81 = v16;
  id v73 = v25;
  id v74 = v45;
  double v82 = v37;
  double v83 = v41;
  v75 = v18;
  id v76 = v24;
  id v77 = v55;
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __65___DBSuspendAppToHomeZoomAnimation_startAnimationWithCompletion___block_invoke_3;
  v65[3] = &unk_2649B5E80;
  id v66 = v76;
  id v67 = v8;
  v68 = v75;
  id v69 = v61;
  id v54 = v61;
  v53 = v75;
  id v62 = v8;
  id v47 = v76;
  id v48 = v55;
  id v49 = v45;
  id v50 = v25;
  id v51 = v59;
  id v52 = v60;
  [v46 _animateUsingSpringWithDuration:0 delay:v70 options:v65 mass:0.5 stiffness:0.0 damping:3.0 initialVelocity:1000.0 animations:500.0 completion:0.0];
  [MEMORY[0x263F158F8] commit];
}

- (DBIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end