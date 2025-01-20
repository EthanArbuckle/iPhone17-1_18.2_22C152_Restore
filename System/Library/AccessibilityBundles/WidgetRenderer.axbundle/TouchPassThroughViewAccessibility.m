@interface TouchPassThroughViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_axWindowScene;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
@end

@implementation TouchPassThroughViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WidgetRenderer.TouchPassThroughView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScene", @"_FBSScene", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FBSScene", @"hostProcess", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BSProcessHandle", @"bundleIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHUISWidgetScene", @"widget", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHSWidget", @"containerBundleIdentifier", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(TouchPassThroughViewAccessibility *)self _axWindowScene];
  v4 = [v3 safeValueForKey:@"widget"];
  v5 = [v4 safeStringForKey:@"containerBundleIdentifier"];

  if (v5)
  {
    uint64_t v6 = AXAppNameForBundleId();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TouchPassThroughViewAccessibility;
    uint64_t v6 = [(TouchPassThroughViewAccessibility *)&v9 accessibilityLabel];
  }
  v7 = (void *)v6;

  return v7;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(TouchPassThroughViewAccessibility *)self _axWindowScene];
  objc_super v9 = [v8 safeValueForKeyPath:@"_FBSScene.hostProcess"];
  v10 = [v9 safeStringForKey:@"bundleIdentifier"];

  if (([v10 isEqualToString:@"com.apple.PosterBoard"] & 1) != 0
    || ([v10 isEqualToString:@"com.apple.clockface"] & 1) != 0
    || ([v10 isEqualToString:@"com.apple.NanoSettings"] & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v13 = [(TouchPassThroughViewAccessibility *)self _accessibilityParentView];
    objc_msgSend(v13, "convertPoint:toView:", 0, x, y);
    double v15 = v14;
    double v17 = v16;
    v18 = [v13 window];
    objc_msgSend(v18, "convertPoint:toWindow:", 0, v15, v17);

    v19 = [(TouchPassThroughViewAccessibility *)self _accessibilityAccessibleDescendants];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v20 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v20)
    {
      id v21 = v20;
      v11 = 0;
      uint64_t v22 = *(void *)v30;
      double v23 = 3.40282347e38;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v19);
          }
          v25 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          [v25 accessibilityActivationPoint];
          AX_CGPointGetDistanceToPoint();
          if (v26 < v23)
          {
            double v27 = v26;
            id v28 = v25;

            double v23 = v27;
            v11 = v28;
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v21);
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)_axWindowScene
{
  v2 = [(TouchPassThroughViewAccessibility *)self _accessibilityWindow];
  id v3 = [v2 windowScene];

  return v3;
}

@end