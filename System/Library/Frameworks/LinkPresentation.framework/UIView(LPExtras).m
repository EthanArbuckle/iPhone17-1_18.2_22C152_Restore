@interface UIView(LPExtras)
+ (LPFlippedView)_lp_createFlippedView;
- (BOOL)_lp_isLTR;
- (double)_lp_backingScaleFactor;
- (uint64_t)_lp_disableAutomaticVibrancy;
- (uint64_t)_lp_prefersDarkInterface;
- (uint64_t)_lp_setCornerRadius:()LPExtras;
- (uint64_t)_lp_setForceLTR:()LPExtras;
- (void)_lp_applyAndRegisterForUpdatesToValue:()LPExtras withApplyCallback:;
- (void)_lp_insertSubview:()LPExtras aboveSubview:;
- (void)_lp_insertSubview:()LPExtras belowSubview:;
- (void)_lp_setCompositingFilter:()LPExtras;
- (void)_lp_setCornerRadius:()LPExtras continuous:;
- (void)_lp_setOpacity:()LPExtras;
- (void)_lp_setShadowColor:()LPExtras;
- (void)_lp_setShadowOffset:()LPExtras;
- (void)_lp_setShadowOpacity:()LPExtras;
- (void)_lp_setShadowRadius:()LPExtras;
@end

@implementation UIView(LPExtras)

- (void)_lp_setOpacity:()LPExtras
{
  float v2 = a2;
  id v4 = [a1 layer];
  *(float *)&double v3 = v2;
  [v4 setOpacity:v3];
}

- (void)_lp_setShadowRadius:()LPExtras
{
  id v3 = [a1 layer];
  [v3 setShadowRadius:a2];
}

- (void)_lp_setShadowOffset:()LPExtras
{
  id v5 = [a1 layer];
  objc_msgSend(v5, "setShadowOffset:", a2, a3);
}

- (void)_lp_setShadowColor:()LPExtras
{
  id v6 = a3;
  uint64_t v4 = [v6 CGColor];
  id v5 = [a1 layer];
  [v5 setShadowColor:v4];
}

- (void)_lp_setShadowOpacity:()LPExtras
{
  float v2 = a2;
  id v4 = [a1 layer];
  *(float *)&double v3 = v2;
  [v4 setShadowOpacity:v3];
}

- (void)_lp_setCompositingFilter:()LPExtras
{
  id v5 = a3;
  id v4 = [a1 layer];
  [v4 setCompositingFilter:v5];
}

- (void)_lp_insertSubview:()LPExtras aboveSubview:
{
  id v7 = a3;
  id v6 = a4;
  if (v6) {
    [a1 insertSubview:v7 aboveSubview:v6];
  }
  else {
    [a1 addSubview:v7];
  }
}

- (void)_lp_insertSubview:()LPExtras belowSubview:
{
  id v7 = a3;
  id v6 = a4;
  if (v6) {
    [a1 insertSubview:v7 belowSubview:v6];
  }
  else {
    [a1 insertSubview:v7 atIndex:0];
  }
}

- (double)_lp_backingScaleFactor
{
  float v2 = [a1 window];

  if (v2)
  {
    double v3 = [a1 window];
    id v4 = [v3 screen];
    [v4 scale];
    double v6 = v5;
  }
  else
  {
    double v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v3 scale];
    double v6 = v7;
  }

  return v6;
}

- (uint64_t)_lp_setForceLTR:()LPExtras
{
  if (a3) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 4;
  }
  return [a1 setSemanticContentAttribute:v3];
}

- (BOOL)_lp_isLTR
{
  return !+[LPTestingOverrides forceRTL]
      && [a1 effectiveUserInterfaceLayoutDirection] == 0;
}

- (void)_lp_setCornerRadius:()LPExtras continuous:
{
  id v9 = [a1 layer];
  [v9 setCornerRadius:a2];

  double v7 = (uint64_t *)MEMORY[0x1E4F39EA8];
  if (!a4) {
    double v7 = (uint64_t *)MEMORY[0x1E4F39EA0];
  }
  uint64_t v8 = *v7;
  id v10 = [a1 layer];
  [v10 setCornerCurve:v8];

  if (a2 != 0.0)
  {
    id v11 = [a1 layer];
    [v11 setMasksToBounds:1];
  }
}

- (uint64_t)_lp_setCornerRadius:()LPExtras
{
  return objc_msgSend(a1, "_lp_setCornerRadius:continuous:", 1);
}

- (uint64_t)_lp_prefersDarkInterface
{
  v1 = [a1 traitCollection];
  uint64_t v2 = objc_msgSend(v1, "_lp_prefersDarkInterface");

  return v2;
}

- (uint64_t)_lp_disableAutomaticVibrancy
{
  return [a1 _setOverrideUserInterfaceRenderingMode:1];
}

+ (LPFlippedView)_lp_createFlippedView
{
  v0 = objc_alloc_init(LPFlippedView);

  return v0;
}

- (void)_lp_applyAndRegisterForUpdatesToValue:()LPExtras withApplyCallback:
{
  id v6 = a3;
  double v7 = a4;
  v7[2](v7, a1, v6);
  uint64_t v8 = [v6 dependentTraits];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__UIView_LPExtras___lp_applyAndRegisterForUpdatesToValue_withApplyCallback___block_invoke;
  v12[3] = &unk_1E5B05B38;
  id v9 = v7;
  v14 = v9;
  id v10 = v6;
  id v13 = v10;
  id v11 = (id)[a1 registerForTraitChanges:v8 withHandler:v12];
}

@end