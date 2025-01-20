@interface UIViewController(JFXAdditions)
+ (id)jfxTopmostPresentedController;
- (double)jfxCenterAdjustedForOrientationForPortraitFrame:()JFXAdditions relativeToParentFrame:withOrientation:;
- (double)jfxDisplayScale;
- (id)jfxAddChildViewControllerFromStoryboard:()JFXAdditions containerView:constrainToContainer:relativeToSafeArea:;
- (uint64_t)jfxAddChildViewController:()JFXAdditions containerView:;
- (uint64_t)jfxRemoveFromParentViewController;
- (void)jfxAddChildViewController:()JFXAdditions;
- (void)jfxAddChildViewController:()JFXAdditions constrainRelativeToSafeAreas:;
- (void)jfxAddChildViewController:()JFXAdditions containerView:constrainToContainer:relativeToSafeArea:;
@end

@implementation UIViewController(JFXAdditions)

- (double)jfxDisplayScale
{
  v1 = [a1 traitCollection];
  [v1 displayScale];
  double v3 = v2;

  if (v3 == 0.0)
  {
    v4 = [MEMORY[0x263F1C920] mainScreen];
    [v4 scale];
    double v3 = v5;
  }
  return v3;
}

- (void)jfxAddChildViewController:()JFXAdditions
{
  id v4 = a3;
  id v5 = [a1 view];
  [a1 jfxAddChildViewController:v4 containerView:v5];
}

- (uint64_t)jfxAddChildViewController:()JFXAdditions containerView:
{
  return [a1 jfxAddChildViewController:a3 containerView:a4 constrainToContainer:0 relativeToSafeArea:0];
}

- (void)jfxAddChildViewController:()JFXAdditions constrainRelativeToSafeAreas:
{
  id v6 = a3;
  id v7 = [a1 view];
  [a1 jfxAddChildViewController:v6 containerView:v7 constrainToContainer:1 relativeToSafeArea:a4];
}

- (id)jfxAddChildViewControllerFromStoryboard:()JFXAdditions containerView:constrainToContainer:relativeToSafeArea:
{
  id v10 = a3;
  id v11 = a4;
  v12 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  if (v13 == 1)
  {
    v14 = (void *)MEMORY[0x263F1C9E8];
    v15 = [v10 stringByAppendingString:@"-ipad"];
    v16 = [v14 storyboardWithName:v15 bundle:0];

    if (v16) {
      goto LABEL_4;
    }
  }
  v16 = [MEMORY[0x263F1C9E8] storyboardWithName:v10 bundle:0];
  if (v16)
  {
LABEL_4:
    v17 = [v16 instantiateInitialViewController];
    [a1 jfxAddChildViewController:v17 containerView:v11 constrainToContainer:a5 relativeToSafeArea:a6];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)jfxAddChildViewController:()JFXAdditions containerView:constrainToContainer:relativeToSafeArea:
{
  v49[4] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = v12;
  if (v11 && v12)
  {
    v14 = [v11 view];
    [a1 addChildViewController:v11];
    [v13 addSubview:v14];
    if (a5)
    {
      [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
      v15 = (void *)MEMORY[0x263F08938];
      v16 = [v14 leftAnchor];
      v42 = v15;
      if (a6)
      {
        v17 = [v13 safeAreaLayoutGuide];
        uint64_t v18 = [v17 leftAnchor];
      }
      else
      {
        uint64_t v18 = [v13 leftAnchor];
        v17 = (void *)v18;
      }
      uint64_t v40 = [v16 constraintEqualToAnchor:v18];
      v49[0] = v40;
      v19 = [v14 rightAnchor];
      if (a6)
      {
        id v6 = [v13 safeAreaLayoutGuide];
        uint64_t v20 = [v6 rightAnchor];
      }
      else
      {
        uint64_t v20 = [v13 rightAnchor];
        v34 = (void *)v20;
      }
      v36 = (void *)v20;
      v37 = v6;
      uint64_t v38 = [v19 constraintEqualToAnchor:v20];
      v49[1] = v38;
      [v14 topAnchor];
      v46 = v45 = (void *)v18;
      v47 = v19;
      if (a6)
      {
        v32 = [v13 safeAreaLayoutGuide];
        uint64_t v21 = [v32 topAnchor];
      }
      else
      {
        uint64_t v21 = [v13 topAnchor];
        v33 = (void *)v21;
      }
      v35 = (void *)v21;
      v39 = [v46 constraintEqualToAnchor:v21];
      v49[2] = v39;
      v22 = [v14 bottomAnchor];
      v41 = a1;
      v43 = v17;
      v44 = v16;
      if (a6)
      {
        id v6 = [v13 safeAreaLayoutGuide];
        [v6 bottomAnchor];
      }
      else
      {
        [v13 bottomAnchor];
      v23 = };
      v24 = [v22 constraintEqualToAnchor:v23];
      v49[3] = v24;
      v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:4];
      [v42 activateConstraints:v25];

      if (a6)
      {

        v27 = v46;
        v26 = v19;
        v28 = v37;
        v29 = (void *)v38;
        a1 = v41;
        v47 = (void *)v40;
        v22 = v32;
        v30 = v35;
        v31 = v36;
      }
      else
      {
        v30 = v23;
        v31 = v46;
        v28 = (void *)v38;
        v27 = v39;
        a1 = v41;
        v45 = (void *)v40;
        v29 = v33;
        v26 = v34;
      }
    }
    [v11 didMoveToParentViewController:a1];
  }
  else
  {
    v14 = JFXLog_viewerUI();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_234C41000, v14, OS_LOG_TYPE_DEFAULT, "Error trying to add a View Controller into a container view", buf, 2u);
    }
  }
}

- (uint64_t)jfxRemoveFromParentViewController
{
  [a1 willMoveToParentViewController:0];
  double v2 = [a1 view];
  [v2 removeFromSuperview];

  return [a1 removeFromParentViewController];
}

- (double)jfxCenterAdjustedForOrientationForPortraitFrame:()JFXAdditions relativeToParentFrame:withOrientation:
{
  if ((unint64_t)(a11 - 3) > 1)
  {
    double v19 = a1 + CGRectGetWidth(*(CGRect *)&a1) * 0.5;
    v24.origin.x = a1;
    v24.origin.y = a2;
    v24.size.width = a3;
    v24.size.height = a4;
    CGRectGetHeight(v24);
  }
  else
  {
    double v19 = a2 + CGRectGetHeight(*(CGRect *)&a1) * 0.5;
    if (a11 == 4)
    {
      v22.origin.x = a5;
      v22.origin.y = a6;
      v22.size.width = a7;
      v22.size.height = a8;
      double v19 = CGRectGetWidth(v22) - v19;
    }
    v23.origin.x = a1;
    v23.origin.y = a2;
    v23.size.width = a3;
    v23.size.height = a4;
    CGRectGetWidth(v23);
  }
  return v19;
}

+ (id)jfxTopmostPresentedController
{
  v0 = [MEMORY[0x263F1C408] sharedApplication];
  v1 = [v0 delegate];
  double v2 = [v1 window];
  double v3 = [v2 rootViewController];

  id v4 = [v3 presentedViewController];

  if (v4)
  {
    do
    {
      id v5 = [v3 presentedViewController];

      id v6 = [v5 presentedViewController];

      double v3 = v5;
    }
    while (v6);
  }
  else
  {
    id v5 = v3;
  }
  return v5;
}

@end