@interface _PGPictureInPictureContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation _PGPictureInPictureContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_PGPictureInPictureContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_PGPictureInPictureContainerView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"PGHitTestExtendableView"];
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_PGPictureInPictureContainerViewAccessibility;
  v8 = -[_PGPictureInPictureContainerViewAccessibility _accessibilityHitTest:withEvent:](&v20, sel__accessibilityHitTest_withEvent_, v7, x, y);
  if (!v8)
  {
    objc_opt_class();
    v9 = __UIAccessibilityCastAsClass();
    v10 = [v9 superview];
    MEMORY[0x24565A9F0](@"PGHitTestExtendableView");
    if (objc_opt_isKindOfClass())
    {
      v11 = [v9 superview];
    }
    else
    {
      v11 = 0;
    }

    v12 = [v11 safeValueForKey:@"hitTestExtenderView"];
    v13 = __UIAccessibilitySafeClass();

    v14 = [v13 safeUIViewForKey:@"_tab"];

    objc_msgSend(v9, "convertPoint:toView:", v14, x, y);
    if (objc_msgSend(v14, "pointInside:withEvent:", v7))
    {
      v15 = [v11 _accessibilityViewController];
      v16 = __UIAccessibilitySafeClass();

      v17 = [v16 safeValueForKey:@"_stashView"];

      objc_msgSend(v9, "convertPoint:toView:", v17, x, y);
      objc_msgSend(v17, "_accessibilityHitTest:withEvent:", v7);
      id v18 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
  }
  id v18 = v8;
LABEL_9:

  return v18;
}

@end