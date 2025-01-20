@interface _WGWidgetListScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (CGRect)_axAdjustedFrameForFrame:(CGRect)a3;
- (id)focusGroupIdentifier;
- (int64_t)accessibilityContainerType;
@end

@implementation _WGWidgetListScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_WGWidgetListScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WGWidgetWrapperView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WGMajorListViewController", @"headerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WGMajorListViewController", @"footerView", "@", 0);
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  id v4 = a3;
  v5 = [v4 _accessibilityAncestorIsKindOf:MEMORY[0x24566AD50](@"WGWidgetWrapperView")];
  v6 = v5;
  if (!v5) {
    v5 = v4;
  }
  [v5 accessibilityFrameForScrolling];
  if (v6) {
    -[_WGWidgetListScrollViewAccessibility _axAdjustedFrameForFrame:](self, "_axAdjustedFrameForFrame:");
  }
  v9.receiver = self;
  v9.super_class = (Class)_WGWidgetListScrollViewAccessibility;
  BOOL v7 = -[_WGWidgetListScrollViewAccessibility _accessibilityScrollToFrame:forView:](&v9, sel__accessibilityScrollToFrame_forView_, 0);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21A78]);

  return v7;
}

- (BOOL)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4
{
  id v4 = self;
  -[_WGWidgetListScrollViewAccessibility _axAdjustedFrameForFrame:](self, "_axAdjustedFrameForFrame:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6.receiver = v4;
  v6.super_class = (Class)_WGWidgetListScrollViewAccessibility;
  LOBYTE(v4) = -[_WGWidgetListScrollViewAccessibility _accessibilityScrollToFrame:forView:](&v6, sel__accessibilityScrollToFrame_forView_, 0);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21A78]);
  return (char)v4;
}

- (CGRect)_axAdjustedFrameForFrame:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  BOOL v7 = [(_WGWidgetListScrollViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_0 startWithSelf:1];
  v8 = [v7 _accessibilityViewController];

  objc_super v9 = [v8 safeValueForKey:@"headerView"];
  [v9 accessibilityFrame];
  CGFloat v10 = CGRectGetHeight(v17) + 50.0;

  v11 = [v8 safeValueForKey:@"footerView"];
  [v11 accessibilityFrame];
  double v12 = CGRectGetHeight(v18);

  double v13 = x;
  double v14 = y - v10;
  double v15 = width;
  double v16 = height + v10 + v12;
  result.size.double height = v16;
  result.size.CGFloat width = v15;
  result.origin.double y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (a3 == 3)
  {
    return [(_WGWidgetListScrollViewAccessibility *)self accessibilityScrollUpPage];
  }
  else
  {
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)_WGWidgetListScrollViewAccessibility;
    return -[_WGWidgetListScrollViewAccessibility accessibilityScroll:](&v6, sel_accessibilityScroll_);
  }
}

- (id)focusGroupIdentifier
{
  if ([(_WGWidgetListScrollViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    uint64_t v3 = [(_WGWidgetListScrollViewAccessibility *)self _accessibilityDefaultFocusGroupIdentifier];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_WGWidgetListScrollViewAccessibility;
    uint64_t v3 = [(_WGWidgetListScrollViewAccessibility *)&v5 focusGroupIdentifier];
  }

  return v3;
}

@end