@interface PGHitTestExtendableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PGHitTestExtendableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PGHitTestExtendableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PGHitTestExtendableViewAccessibility;
  v8 = -[PGHitTestExtendableViewAccessibility _accessibilityHitTest:withEvent:](&v18, sel__accessibilityHitTest_withEvent_, v7, x, y);
  if (!v8)
  {
    objc_opt_class();
    v9 = __UIAccessibilityCastAsClass();
    v10 = [(PGHitTestExtendableViewAccessibility *)self safeValueForKey:@"hitTestExtenderView"];
    v11 = __UIAccessibilitySafeClass();

    v12 = [v11 safeUIViewForKey:@"_tab"];

    objc_msgSend(v9, "convertPoint:toView:", v12, x, y);
    if (objc_msgSend(v12, "pointInside:withEvent:", v7))
    {
      v13 = [(PGHitTestExtendableViewAccessibility *)self _accessibilityViewController];
      v14 = __UIAccessibilitySafeClass();

      v15 = [v14 safeValueForKey:@"_stashView"];

      objc_msgSend(v9, "convertPoint:toView:", v15, x, y);
      objc_msgSend(v15, "_accessibilityHitTest:withEvent:", v7);
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
  }
  id v16 = v8;
LABEL_6:

  return v16;
}

@end