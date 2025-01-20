@interface CalloutViewSpatialAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityUseAccessibilityFrameForHittest;
- (CGRect)accessibilityFrame;
- (void)updateText:(int64_t)a3;
@end

@implementation CalloutViewSpatialAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.CalloutViewSpatial";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.CalloutViewSpatial", @"updateText:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.CalloutViewSpatial", @"boxLayer", "@", 0);
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  v25.receiver = self;
  v25.super_class = (Class)CalloutViewSpatialAccessibility;
  [(CalloutViewSpatialAccessibility *)&v25 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_opt_class();
  v11 = [(CalloutViewSpatialAccessibility *)self safeValueForKey:@"boxLayer"];
  v12 = __UIAccessibilityCastAsClass();

  if (v12)
  {
    uint64_t v13 = [v12 path];
    if (v13)
    {
      v14 = (const CGPath *)v13;
      objc_opt_class();
      v15 = __UIAccessibilityCastAsClass();
      v16 = [v15 layer];
      CGRect BoundingBox = CGPathGetBoundingBox(v14);
      objc_msgSend(v16, "convertRect:fromLayer:", v12, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height);

      UIAccessibilityFrameForBounds();
      double v4 = v17;
      double v6 = v18;
      double v8 = v19;
      double v10 = v20;
    }
  }

  double v21 = v4;
  double v22 = v6;
  double v23 = v8;
  double v24 = v10;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)updateText:(int64_t)a3
{
  double v5 = [(CalloutViewAccessibility *)self axCalloutText];
  v6.receiver = self;
  v6.super_class = (Class)CalloutViewSpatialAccessibility;
  [(CalloutViewSpatialAccessibility *)&v6 updateText:a3];
  [(CalloutViewAccessibility *)self axDidUpdateFromPreviousCalloutText:v5];
}

@end