@interface UIView(ITKUtilities)
+ (uint64_t)itk_animateWithDuration:()ITKUtilities animations:;
- (BOOL)itk_configureToFillSuperView;
- (NSString)summaryDescription;
- (double)itk_backingScaleFactor;
- (double)itk_roundRectToViewScale:()ITKUtilities;
- (double)itk_safeAreaBounds;
- (double)itk_viewLengthFromWindowLength:()ITKUtilities;
- (double)itk_windowLengthFromViewLength:()ITKUtilities;
- (id)itk_autoFadeOutLayerWithPath:()ITKUtilities fadeOutDelay:;
- (id)itk_autoFadeOutLayerWithQuad:()ITKUtilities fadeOutDelay:;
- (id)itk_autoFadeOutShapePointLayer;
- (id)itk_autoFadeOutShapeRectLayer;
- (id)itk_constraintsToFillLayoutGuide:()ITKUtilities;
- (id)itk_constraintsToFillView:()ITKUtilities;
- (id)itk_renderImageFromViewBackingStoreWithSubrect:()ITKUtilities;
- (uint64_t)itk_autoFadeOutLayerWithPath:()ITKUtilities;
- (uint64_t)itk_autoFadeOutLayerWithQuad:()ITKUtilities;
- (uint64_t)itk_isFlipped;
- (uint64_t)itk_renderImageFromViewBackingStore;
- (uint64_t)itk_setHidden:()ITKUtilities animated:;
- (uint64_t)itk_viewPointRatioFromWindow;
- (uint64_t)itk_windowPointRatioFromView;
- (uint64_t)setItk_transform:()ITKUtilities;
- (uint64_t)setItk_userInteractionEnabled:()ITKUtilities;
- (void)setItk_backgroundColor:()ITKUtilities;
@end

@implementation UIView(ITKUtilities)

- (void)setItk_backgroundColor:()ITKUtilities
{
  id v4 = (id)[a3 copy];
  [a1 setBackgroundColor:v4];
}

- (uint64_t)setItk_userInteractionEnabled:()ITKUtilities
{
  return [a1 setUserInteractionEnabled:1];
}

- (uint64_t)itk_isFlipped
{
  return 1;
}

- (double)itk_backingScaleFactor
{
  v1 = [a1 window];
  v2 = [v1 screen];
  [v2 scale];
  double v4 = v3;

  return v4;
}

- (uint64_t)setItk_transform:()ITKUtilities
{
  long long v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  v5[2] = a3[2];
  return [a1 setTransform:v5];
}

- (double)itk_safeAreaBounds
{
  [a1 bounds];
  double v3 = v2;
  [a1 safeAreaInsets];
  double v5 = v4;
  if (itk_isiOS())
  {
    objc_msgSend(a1, "itk_viewPointRatioFromWindow");
    if (v6 != 1.0 && fabs(v6 + -1.0) >= 0.000000999999997) {
      double v5 = 0.0;
    }
  }
  double v7 = v3 + v5;
  if ((objc_msgSend(a1, "itk_isFlipped") & 1) == 0)
  {
    ITKFlipRect();
    return v8;
  }
  return v7;
}

- (uint64_t)itk_viewPointRatioFromWindow
{
  return objc_msgSend(a1, "itk_viewLengthFromWindowLength:", 1.0);
}

- (uint64_t)itk_windowPointRatioFromView
{
  return objc_msgSend(a1, "itk_windowLengthFromViewLength:", 1.0);
}

- (uint64_t)itk_setHidden:()ITKUtilities animated:
{
  uint64_t result = [a1 isHidden];
  if (result != a3)
  {
    if (a4)
    {
      int v8 = [a1 isHidden];
      double v9 = 1.0;
      if (v8) {
        double v9 = 0.0;
      }
      objc_msgSend(a1, "setItk_alpha:", v9);
      if ((a3 & 1) == 0) {
        [a1 setHidden:0];
      }
      v10 = (void *)MEMORY[0x263F82E00];
      [MEMORY[0x263F82E00] inheritedAnimationDuration];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __47__UIView_ITKUtilities__itk_setHidden_animated___block_invoke;
      v13[3] = &unk_26538E118;
      v13[4] = a1;
      char v14 = a3;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __47__UIView_ITKUtilities__itk_setHidden_animated___block_invoke_2;
      v11[3] = &unk_26538E140;
      v11[4] = a1;
      char v12 = a3;
      return objc_msgSend(v10, "animateWithDuration:animations:completion:", v13, v11);
    }
    else
    {
      return [a1 setHidden:a3];
    }
  }
  return result;
}

- (BOOL)itk_configureToFillSuperView
{
  double v2 = [a1 superview];

  if (v2)
  {
    [a1 setTranslatesAutoresizingMaskIntoConstraints:1];
    [a1 setAutoresizingMask:18];
    double v3 = [a1 superview];
    [v3 bounds];
    objc_msgSend(a1, "setFrame:");
  }
  return v2 != 0;
}

- (double)itk_viewLengthFromWindowLength:()ITKUtilities
{
  ITKRectWithSize();
  objc_msgSend(a1, "convertRect:fromView:", 0);
  return v2;
}

- (double)itk_windowLengthFromViewLength:()ITKUtilities
{
  ITKRectWithSize();
  objc_msgSend(a1, "convertRect:toView:", 0);
  return v2;
}

- (id)itk_autoFadeOutShapeRectLayer
{
  v1 = [a1 layer];
  double v2 = objc_msgSend(v1, "itk_autoFadeOutShapeRectLayer");

  return v2;
}

- (id)itk_autoFadeOutShapePointLayer
{
  v1 = [a1 layer];
  double v2 = objc_msgSend(v1, "itk_autoFadeOutShapePointLayer");

  return v2;
}

- (uint64_t)itk_autoFadeOutLayerWithPath:()ITKUtilities
{
  return objc_msgSend(a1, "itk_autoFadeOutLayerWithPath:fadeOutDelay:", 1.0);
}

- (uint64_t)itk_autoFadeOutLayerWithQuad:()ITKUtilities
{
  return objc_msgSend(a1, "itk_autoFadeOutLayerWithQuad:fadeOutDelay:", 1.0);
}

- (id)itk_autoFadeOutLayerWithQuad:()ITKUtilities fadeOutDelay:
{
  double v6 = [a4 path];
  double v7 = objc_msgSend(a1, "itk_autoFadeOutLayerWithPath:fadeOutDelay:", v6, a2);

  return v7;
}

- (id)itk_autoFadeOutLayerWithPath:()ITKUtilities fadeOutDelay:
{
  double v4 = (objc_class *)MEMORY[0x263F15880];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [a1 bounds];
  objc_msgSend(v6, "setFrame:");
  uint64_t v7 = objc_msgSend(v5, "itk_CGPath");

  [v6 setPath:v7];
  objc_msgSend(MEMORY[0x263F825C8], "itk_randomColor");
  id v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v8, "CGColor"));

  [v6 setFillColor:0];
  [v6 setLineWidth:2.0];
  id v9 = [MEMORY[0x263F825C8] clearColor];
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v9, "CGColor"));

  v10 = [a1 layer];
  [v10 addSublayer:v6];

  id v12 = v6;
  itk_dispatchMainAfterDelay();

  return v12;
}

- (id)itk_constraintsToFillView:()ITKUtilities
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = a1;
  id v7 = v4;
  if (v7)
  {
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = [v6 leadingAnchor];
    id v9 = [v7 leadingAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    [v5 addObject:v10];

    v11 = [v6 trailingAnchor];
    id v12 = [v7 trailingAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    [v5 addObject:v13];

    char v14 = [v6 topAnchor];
    v15 = [v7 topAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    [v5 addObject:v16];

    v17 = [v6 bottomAnchor];
    v18 = [v7 bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    [v5 addObject:v19];
  }
  else
  {
    objc_msgSend(MEMORY[0x263F4BE58], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((v2) != nil)", "-[UIView(ITKUtilities) itk_constraintsToFillView:]", 0, 0, @"Expected non-nil value for '%s'", "v2");
  }
  v20 = (void *)[v5 copy];

  return v20;
}

- (id)itk_renderImageFromViewBackingStoreWithSubrect:()ITKUtilities
{
  v10 = [MEMORY[0x263F827B0] defaultFormat];
  v11 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:format:", v10, a4, a5);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__UIView_ITKUtilities__itk_renderImageFromViewBackingStoreWithSubrect___block_invoke;
  v14[3] = &unk_26538E190;
  v14[4] = a1;
  *(double *)&v14[5] = a2;
  *(double *)&v14[6] = a3;
  *(double *)&v14[7] = a4;
  *(double *)&v14[8] = a5;
  id v12 = [v11 imageWithActions:v14];

  return v12;
}

- (uint64_t)itk_renderImageFromViewBackingStore
{
  [a1 bounds];
  return objc_msgSend(a1, "itk_renderImageFromViewBackingStoreWithSubrect:");
}

- (id)itk_constraintsToFillLayoutGuide:()ITKUtilities
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = a1;
  id v7 = v6;
  if (v4)
  {
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = [v7 leadingAnchor];
    id v9 = [v4 leadingAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    [v5 addObject:v10];

    v11 = [v7 trailingAnchor];
    id v12 = [v4 trailingAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    [v5 addObject:v13];

    char v14 = [v7 topAnchor];
    v15 = [v4 topAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    [v5 addObject:v16];

    v17 = [v7 bottomAnchor];
    v18 = [v4 bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    [v5 addObject:v19];
  }
  else
  {
    objc_msgSend(MEMORY[0x263F4BE58], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((layoutGuide) != nil)", "-[UIView(ITKUtilities) itk_constraintsToFillLayoutGuide:]", 0, 0, @"Expected non-nil value for '%s'", "layoutGuide");
  }
  v20 = (void *)[v5 copy];

  return v20;
}

- (double)itk_roundRectToViewScale:()ITKUtilities
{
  double v3 = [a1 traitCollection];
  [v3 displayScale];

  return a2;
}

+ (uint64_t)itk_animateWithDuration:()ITKUtilities animations:
{
  return objc_msgSend(a1, "itk_animateWithDuration:animations:completion:", a3, 0);
}

- (NSString)summaryDescription
{
  [a1 frame];
  return NSStringFromCGRect(*(CGRect *)&v1);
}

@end