@interface UIView(GKUIBackdropView)
+ (id)_gkStandardBackdropView;
- (id)_gkApplyFakeStatusBarView;
- (id)_gkBackdropView;
- (uint64_t)_gkSetDrawsAsBackdropOverlay:()GKUIBackdropView;
- (void)_gkApplyBackdropViewIfNeededWithGroupName:()GKUIBackdropView;
- (void)_gkApplyBackdropViewWithGroupName:()GKUIBackdropView;
- (void)_gkSetDrawsAsKnockout:()GKUIBackdropView inBackdrop:;
- (void)_gkUseAsModalSheetBackgroundWithGroupName:()GKUIBackdropView;
@end

@implementation UIView(GKUIBackdropView)

- (uint64_t)_gkSetDrawsAsBackdropOverlay:()GKUIBackdropView
{
  objc_msgSend(a1, "_setDrawsAsBackdropOverlay:");

  return [a1 setAlpha:0.35];
}

- (void)_gkSetDrawsAsKnockout:()GKUIBackdropView inBackdrop:
{
  id v7 = a4;
  if (GKHasSlowerGraphicsHardware_onceToken_0 != -1) {
    dispatch_once(&GKHasSlowerGraphicsHardware_onceToken_0, &__block_literal_global_51);
  }
  if ((unint64_t)GKHasSlowerGraphicsHardware_processorCount_0 > 1)
  {
    if (a3) {
      uint64_t v6 = 7;
    }
    else {
      uint64_t v6 = 0;
    }
    [a1 _setBackdropMaskViewFlags:v6];
    [v7 updateMaskViewsForView:a1];
  }
  else if ([a1 _drawsAsBackdropOverlay] != a3)
  {
    [a1 _setDrawsAsBackdropOverlay:a3];
  }
}

+ (id)_gkStandardBackdropView
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:2010];

  return v0;
}

- (id)_gkApplyFakeStatusBarView
{
  [a1 frame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  v8 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v8 statusBarHeight];
  double v10 = v9;

  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v3, v5, v7, v10);
  v12 = [(id)objc_opt_class() _gkStandardBackdropView];
  [v11 setAutoresizingMask:34];
  [v11 addSubview:v12];
  [a1 addSubview:v11];

  return v11;
}

- (id)_gkBackdropView
{
  id v1 = a1;
  if (v1)
  {
    do
    {
      double v2 = v1;
      double v3 = objc_getAssociatedObject(v1, @"GKBackdropView");
      id v1 = [v1 superview];
    }
    while (v1 && !v3);
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (void)_gkApplyBackdropViewWithGroupName:()GKUIBackdropView
{
  id v5 = a3;
  double v4 = objc_getAssociatedObject(a1, @"GKBackdropView");
  if (v5) {
    [v4 setGroupName:v5];
  }
  [a1 insertSubview:v4 atIndex:0];
}

- (void)_gkApplyBackdropViewIfNeededWithGroupName:()GKUIBackdropView
{
  id v7 = a3;
  double v4 = objc_getAssociatedObject(a1, @"GKBackdropView");
  if (!v4)
  {
    double v4 = [(id)objc_opt_class() _gkStandardBackdropView];
    objc_setAssociatedObject(a1, @"GKBackdropView", v4, (void *)1);
    if (v7) {
      [v4 setGroupName:v7];
    }
    [a1 insertSubview:v4 atIndex:0];
    if (*MEMORY[0x1E4F63830])
    {
      id v5 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v6 = [v5 userInterfaceIdiom];

      if (v6 != 1)
      {
        [v4 frame];
        objc_msgSend(v4, "setFrame:");
        [v4 setAutoresizingMask:0];
      }
    }
  }
}

- (void)_gkUseAsModalSheetBackgroundWithGroupName:()GKUIBackdropView
{
  objc_msgSend(a1, "_gkApplyBackdropViewIfNeededWithGroupName:");
  double v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1)
  {
    double v4 = [MEMORY[0x1E4F63A10] sharedTheme];
    [v4 formSheetCornerRadius];
    double v6 = v5;
    id v7 = [a1 layer];
    [v7 setCornerRadius:v6];

    [a1 setClipsToBounds:1];
  }
}

@end