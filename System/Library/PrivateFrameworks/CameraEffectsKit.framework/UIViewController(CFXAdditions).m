@interface UIViewController(CFXAdditions)
- (CFXCounterRotationView)counterRotationViewForSnapshot:()CFXAdditions atCenterPoint:toWindowOrientation:fromWindowOrientation:;
- (void)animateCounterRotationView:()CFXAdditions fadeOut:toWindowOrientation:fromWindowOrientation:forTransitionToSize:withTransitionCoordinator:postTransitionBlock:postRemoveFromSuperviewBlock:;
- (void)displaySnapshot:()CFXAdditions atCenterPoint:atIndex:forTransitionToSize:fadeOut:withTransitionCoordinator:preTransitionBlock:postTransitionBlock:;
@end

@implementation UIViewController(CFXAdditions)

- (void)displaySnapshot:()CFXAdditions atCenterPoint:atIndex:forTransitionToSize:fadeOut:withTransitionCoordinator:preTransitionBlock:postTransitionBlock:
{
  id v33 = a10;
  v22 = a11;
  id v23 = a12;
  id v24 = a7;
  v25 = [a1 view];
  v26 = [v25 window];
  uint64_t v27 = [v26 _toWindowOrientation];

  v28 = [a1 view];
  v29 = [v28 window];
  uint64_t v30 = [v29 _fromWindowOrientation];

  v31 = objc_msgSend(a1, "counterRotationViewForSnapshot:atCenterPoint:toWindowOrientation:fromWindowOrientation:", v24, v27, v30, a2, a3);

  v32 = [a1 view];
  [v32 insertSubview:v31 atIndex:a8];

  if (v22) {
    v22[2](v22);
  }
  objc_msgSend(a1, "animateCounterRotationView:fadeOut:toWindowOrientation:fromWindowOrientation:forTransitionToSize:withTransitionCoordinator:postTransitionBlock:postRemoveFromSuperviewBlock:", v31, a9, v27, v30, v33, v23, a4, a5, 0);
}

- (CFXCounterRotationView)counterRotationViewForSnapshot:()CFXAdditions atCenterPoint:toWindowOrientation:fromWindowOrientation:
{
  id v8 = a5;
  v9 = [a1 view];
  [v9 bounds];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;

  UIRectGetCenter();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  v22 = objc_alloc_init(CFXCounterRotationView);
  [(CFXCounterRotationView *)v22 setUserInteractionEnabled:0];
  [(CFXCounterRotationView *)v22 addSubview:v8];
  id v23 = (void *)MEMORY[0x263F1CB60];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __121__UIViewController_CFXAdditions__counterRotationViewForSnapshot_atCenterPoint_toWindowOrientation_fromWindowOrientation___block_invoke;
  v29[3] = &unk_264C0A178;
  id v24 = v22;
  uint64_t v32 = v11;
  uint64_t v33 = v13;
  uint64_t v34 = v15;
  uint64_t v35 = v17;
  uint64_t v36 = v19;
  uint64_t v37 = v21;
  uint64_t v30 = v24;
  id v31 = v8;
  double v38 = a2;
  double v39 = a3;
  uint64_t v40 = 0;
  id v25 = v8;
  [v23 performWithoutAnimation:v29];
  v26 = v31;
  uint64_t v27 = v24;

  return v27;
}

- (void)animateCounterRotationView:()CFXAdditions fadeOut:toWindowOrientation:fromWindowOrientation:forTransitionToSize:withTransitionCoordinator:postTransitionBlock:postRemoveFromSuperviewBlock:
{
  id v18 = a5;
  id v19 = a10;
  id v20 = a11;
  double v21 = 0.0;
  double v22 = 0.0;
  if (a7 != 1)
  {
    if (a7 == 3)
    {
      double v22 = 1.57079633;
    }
    else if (a7 == 4)
    {
      double v22 = -1.57079633;
    }
    else
    {
      double v22 = 3.14159265;
      if (a7 != 2) {
        double v22 = 0.0;
      }
    }
  }
  if (a8 != 1)
  {
    if (a8 == 3)
    {
      double v21 = 1.57079633;
    }
    else if (a8 == 4)
    {
      double v21 = -1.57079633;
    }
    else
    {
      double v21 = 3.14159265;
      if (a8 != 2) {
        double v21 = 0.0;
      }
    }
  }
  double v23 = v21 - v22;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __206__UIViewController_CFXAdditions__animateCounterRotationView_fadeOut_toWindowOrientation_fromWindowOrientation_forTransitionToSize_withTransitionCoordinator_postTransitionBlock_postRemoveFromSuperviewBlock___block_invoke;
  v32[3] = &unk_264C0B080;
  id v33 = v18;
  double v34 = v23;
  double v35 = a1;
  double v36 = a2;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __206__UIViewController_CFXAdditions__animateCounterRotationView_fadeOut_toWindowOrientation_fromWindowOrientation_forTransitionToSize_withTransitionCoordinator_postTransitionBlock_postRemoveFromSuperviewBlock___block_invoke_2;
  v27[3] = &unk_264C0B0A8;
  char v31 = a6;
  id v28 = v33;
  id v29 = v19;
  id v30 = v20;
  id v24 = v20;
  id v25 = v33;
  id v26 = v19;
  [a9 animateAlongsideTransition:v32 completion:v27];
}

@end