@interface SBUIViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesInvalidFrames;
- (BOOL)_accessibilityPointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_axPerformGestureForAction:(id)a3;
- (BOOL)_isTransparentFocusRegion;
- (double)_axScaleTransformForFocusLayerLineWidth;
@end

@implementation SBUIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBReusableSnapshotItemContainer"];
  [v3 validateClass:@"SBFolderContainerView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_isTransparentFocusRegion", "B", 0);
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  id v3 = [(SBUIViewAccessibility *)self accessibilityIdentification];
  char v4 = [v3 isEqualToString:@"UnlockSpringViewWithBadHeight"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBUIViewAccessibility;
  return [(SBUIViewAccessibility *)&v6 _accessibilityOverridesInvalidFrames];
}

- (BOOL)_accessibilityPointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(SBUIViewAccessibility *)self accessibilityIdentification];
  char v9 = [v8 isEqualToString:@"UnlockSpringViewWithBadHeight"];

  if (v9)
  {
    BOOL v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBUIViewAccessibility;
    BOOL v10 = -[SBUIViewAccessibility _accessibilityPointInside:withEvent:](&v12, sel__accessibilityPointInside_withEvent_, v7, x, y);
  }

  return v10;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  id v3 = [(SBUIViewAccessibility *)self accessibilityIdentifier];
  if ([v3 isEqualToString:@"CameraButton"])
  {
    BOOL v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBUIViewAccessibility;
    BOOL v4 = [(SBUIViewAccessibility *)&v6 _accessibilitySupportsActivateAction];
  }

  return v4;
}

- (BOOL)_axPerformGestureForAction:(id)a3
{
  id v3 = (void *)MEMORY[0x263F22968];
  id v4 = a3;
  v5 = [v3 server];
  uint64_t v6 = [v4 gesture];

  LOBYTE(v4) = [v5 performMedusaGesture:v6];
  return (char)v4;
}

- (BOOL)_isTransparentFocusRegion
{
  v19.receiver = self;
  v19.super_class = (Class)SBUIViewAccessibility;
  unsigned int v3 = [(SBUIViewAccessibility *)&v19 _isTransparentFocusRegion];
  if ([(SBUIViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    objc_opt_class();
    id v4 = __UIAccessibilityCastAsClass();
    v5 = [v4 superview];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v4 frame];
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      [v5 frame];
      v21.origin.double x = v14;
      v21.origin.double y = v15;
      v21.size.width = v16;
      v21.size.height = v17;
      v20.origin.double x = v7;
      v20.origin.double y = v9;
      v20.size.width = v11;
      v20.size.height = v13;
      v3 |= CGRectEqualToRect(v20, v21);
    }
  }
  return v3;
}

- (double)_axScaleTransformForFocusLayerLineWidth
{
  unsigned int v3 = [(SBUIViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"ax-focusLayerView"];

  if (v4)
  {
    objc_opt_class();
    v5 = __UIAccessibilityCastAsClass();
    double v6 = v5;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    if (v5)
    {
      [v5 transform3D];
      double v7 = *(double *)&v12 + *((double *)&v14 + 1) + *(double *)&v17;
    }
    else
    {
      double v7 = 0.0;
    }
    double v9 = 1.0 / (v7 / 3.0);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBUIViewAccessibility;
    [(SBUIViewAccessibility *)&v11 _axScaleTransformForFocusLayerLineWidth];
    return v8;
  }
  return v9;
}

@end