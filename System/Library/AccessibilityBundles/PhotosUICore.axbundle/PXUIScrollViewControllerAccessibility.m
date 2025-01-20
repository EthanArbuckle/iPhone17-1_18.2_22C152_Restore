@interface PXUIScrollViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)scrollViewActiveRect;
- (void)_axAdjustScrollViewInsetsWithNavController:(id)a3;
@end

@implementation PXUIScrollViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXUIScrollViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PXUIScrollViewController" hasInstanceVariable:@"_scrollView" withType:"_PXUIScrollView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXUIScrollViewController", @"scrollViewActiveRect", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (void)_axAdjustScrollViewInsetsWithNavController:(id)a3
{
  id v4 = a3;
  v5 = [(PXUIScrollViewControllerAccessibility *)self accessibilityIdentification];
  int v6 = [v5 isEqualToString:@"AXPhotosDetailsUIViewController"];

  if (v6)
  {
    v7 = [(PXUIScrollViewControllerAccessibility *)self safeUIViewForKey:@"_scrollView"];
    v8 = [v7 window];
    v9 = [v8 windowScene];
    v10 = [v9 statusBarManager];
    [v10 statusBarFrame];
    double v12 = v11;

    if (v4)
    {
      v13 = [v4 navigationBar];
      [v13 bounds];
      double v12 = v12 + CGRectGetHeight(v23);
    }
    MEMORY[0x2455E3C60](@"PUNavigationController");
    if (objc_opt_isKindOfClass())
    {
      v14 = [v4 safeValueForKey:@"_extendedToolbar"];
      v15 = [v14 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_5];
    }
    else
    {
      v15 = 0;
    }
    objc_opt_class();
    v16 = [v15 firstObject];
    v17 = __UIAccessibilityCastAsClass();

    if (v17)
    {
      [v17 frame];
      double v19 = v18;
    }
    else
    {
      double v19 = 0.0;
    }
    v20 = [MEMORY[0x263F1CBC8] _applicationKeyWindow];
    v21 = [v20 rootViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [v21 tabBar];
      [v22 bounds];
      double v19 = v19 + CGRectGetHeight(v24);
    }
    objc_msgSend(v7, "_accessibilitySetVisibleContentInset:", v12, 0.0, v19, 0.0);
  }
}

uint64_t __84__PXUIScrollViewControllerAccessibility__axAdjustScrollViewInsetsWithNavController___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2455E3C60](@"PUScrubberView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (CGRect)scrollViewActiveRect
{
  v21.receiver = self;
  v21.super_class = (Class)PXUIScrollViewControllerAccessibility;
  [(PXUIScrollViewControllerAccessibility *)&v21 scrollViewActiveRect];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  double height = v9;
  double v11 = [(PXUIScrollViewControllerAccessibility *)self accessibilityIdentification];
  int v12 = [v11 isEqualToString:@"AXExplorerViewControllerScrollViewController"];

  if (v12)
  {
    CGFloat v13 = -100.0;
    double v14 = 0.0;
LABEL_5:
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.double height = height;
    CGRect v23 = CGRectInset(v22, v13, v14);
    CGFloat x = v23.origin.x;
    CGFloat y = v23.origin.y;
    CGFloat width = v23.size.width;
    double height = v23.size.height;
    goto LABEL_6;
  }
  v15 = [(PXUIScrollViewControllerAccessibility *)self accessibilityIdentification];
  int v16 = [v15 isEqualToString:@"AXPhotosDetailsUIViewController"];

  if (v16)
  {
    double v14 = -height;
    CGFloat v13 = 0.0;
    goto LABEL_5;
  }
LABEL_6:
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.double height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

@end