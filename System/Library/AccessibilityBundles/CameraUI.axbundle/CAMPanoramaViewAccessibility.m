@interface CAMPanoramaViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation CAMPanoramaViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMPanoramaView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(CAMPanoramaViewAccessibility *)self safeValueForKey:@"_instructionLabel"];
  -[CAMPanoramaViewAccessibility convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  if (objc_msgSend(v8, "pointInside:withEvent:", v7))
  {
    id v9 = v8;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CAMPanoramaViewAccessibility;
    -[CAMPanoramaViewAccessibility _accessibilityHitTest:withEvent:](&v12, sel__accessibilityHitTest_withEvent_, v7, x, y);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

@end