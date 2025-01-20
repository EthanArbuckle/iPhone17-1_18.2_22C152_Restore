@interface _SBSystemApertureIndicatorContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityContainerView;
- (id)accessibilityLabel;
- (id)accessibilityPath;
@end

@implementation _SBSystemApertureIndicatorContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SBSystemApertureIndicatorContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSensorActivityDataProvider", @"activeSensorActivityAttributions", "@", 0);
  [v3 validateClass:@"SBSystemApertureViewController" hasInstanceVariable:@"_orderedContainerViews" withType:"NSMutableArray"];
}

- (BOOL)isAccessibilityElement
{
  v2 = [(_SBSystemApertureIndicatorContainerViewAccessibility *)self accessibilityLabel];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)accessibilityLabel
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v3 = [(id)*MEMORY[0x263F1D020] safeValueForKey:@"sensorActivityDataProvider"];
  v4 = [v3 safeSetForKey:@"activeSensorActivityAttributions"];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v6)
  {

LABEL_16:
    v17.receiver = self;
    v17.super_class = (Class)_SBSystemApertureIndicatorContainerViewAccessibility;
    uint64_t v14 = [(_SBSystemApertureIndicatorContainerViewAccessibility *)&v17 accessibilityLabel];
    goto LABEL_22;
  }
  uint64_t v7 = v6;
  LOBYTE(v8) = 0;
  LOBYTE(v9) = 0;
  uint64_t v10 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v5);
      }
      v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      if (v8)
      {
        BOOL v8 = 1;
        if (!v9) {
          goto LABEL_8;
        }
      }
      else
      {
        BOOL v8 = [*(id *)(*((void *)&v18 + 1) + 8 * i) safeIntegerForKey:@"sensor"] == 0;
        if (!v9)
        {
LABEL_8:
          BOOL v9 = [v12 safeIntegerForKey:@"sensor"] == 1;
          continue;
        }
      }
      BOOL v9 = 1;
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v7);

  if (v8 && v9)
  {
    v13 = @"camera.mic.in.use";
    goto LABEL_21;
  }
  if (v8)
  {
    v13 = @"camera.in.use";
    goto LABEL_21;
  }
  if (!v9) {
    goto LABEL_16;
  }
  v13 = @"mic.in.use";
LABEL_21:
  uint64_t v14 = accessibilityLocalizedString(v13);
LABEL_22:
  v15 = (void *)v14;

  return v15;
}

- (id)accessibilityPath
{
  BOOL v3 = [(_SBSystemApertureIndicatorContainerViewAccessibility *)self _accessibilityContainerView];
  v4 = v3;
  if (v3)
  {
    [v3 accessibilityFrame];
    CGFloat x = v26.origin.x;
    CGFloat y = v26.origin.y;
    CGFloat width = v26.size.width;
    CGFloat height = v26.size.height;
    CGRect v27 = CGRectInset(v26, -5.0, -5.0);
    double v21 = v27.size.height;
    CGFloat v9 = v27.origin.x;
    double v23 = v27.origin.x;
    double v10 = v27.origin.y;
    double v11 = v27.size.width;
    double v12 = CGRectGetWidth(v27);
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    double v22 = v12 / CGRectGetWidth(v28);
    v29.origin.CGFloat x = v9;
    v29.origin.CGFloat y = v10;
    v29.size.CGFloat width = v11;
    v29.size.CGFloat height = v21;
    double v13 = CGRectGetHeight(v29);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    double v14 = v13 / CGRectGetHeight(v30);
    v15 = [v4 layer];
    [v15 cornerRadius];
    double v17 = fmax(v22, v14) * v16;

    uint64_t v18 = objc_msgSend(MEMORY[0x263F1C478], "_bezierPathWithArcRoundedRect:cornerRadius:", v23, v10, v11, v21, v17);
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)_SBSystemApertureIndicatorContainerViewAccessibility;
    uint64_t v18 = [(_SBSystemApertureIndicatorContainerViewAccessibility *)&v24 accessibilityPath];
  }
  long long v19 = (void *)v18;

  return v19;
}

- (id)_accessibilityContainerView
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  BOOL v3 = [v2 safeValueForKey:@"systemApertureControllerForMainDisplay"];

  v4 = [v3 safeValueForKey:@"_systemApertureViewController"];
  id v5 = [v4 safeArrayForKey:@"_orderedContainerViews"];
  if ([v5 count])
  {
    uint64_t v6 = [v5 firstObject];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

@end