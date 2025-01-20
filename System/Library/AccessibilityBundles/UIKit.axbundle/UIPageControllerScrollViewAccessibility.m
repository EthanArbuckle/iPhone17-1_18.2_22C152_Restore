@interface UIPageControllerScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (double)_accessibilityScrollAnimationDurationDelay;
- (double)_accessibilityScrollHeightDistance;
- (double)_accessibilityScrollWidthDistance;
- (id)_accessibilityScrollStatus;
- (void)_accessibilitySendScrollStatus;
@end

@implementation UIPageControllerScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPageControllerScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (double)_accessibilityScrollAnimationDurationDelay
{
  return 0.449999988;
}

- (void)_accessibilitySendScrollStatus
{
  v3[2] = self;
  v3[1] = (id)a2;
  v3[0] = [(UIPageControllerScrollViewAccessibility *)self _accessibilityScrollStatus];
  id argument = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v3[0]];
  [argument setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21A70]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE30], argument);
  objc_storeStrong(&argument, 0);
  objc_storeStrong(v3, 0);
}

- (double)_accessibilityScrollWidthDistance
{
  [(UIPageControllerScrollViewAccessibility *)self visibleBounds];
  return v2;
}

- (double)_accessibilityScrollHeightDistance
{
  [(UIPageControllerScrollViewAccessibility *)self visibleBounds];
  return v2;
}

- (id)_accessibilityScrollStatus
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UIPageControllerScrollViewAccessibility *)self safeValueForKey:@"_pageController"];
  if (location[0])
  {
    id v4 = (id)[location[0] safeValueForKey:@"visibleIndex"];
    uint64_t v5 = [v4 integerValue];

    uint64_t v15 = v5;
    id v6 = (id)[location[0] safeValueForKey:@"pageCount"];
    uint64_t v7 = [v6 integerValue];

    uint64_t v14 = v7;
    v8 = NSString;
    id v11 = accessibilityLocalizedString(@"scroll.page.summary");
    id v10 = (id)AXFormatInteger();
    id v9 = (id)AXFormatInteger();
    id v18 = (id)objc_msgSend(v8, "stringWithFormat:", v11, v10, v9);
  }
  else
  {
    v12.receiver = v17;
    v12.super_class = (Class)UIPageControllerScrollViewAccessibility;
    id v18 = [(UIPageControllerScrollViewAccessibility *)&v12 _accessibilityScrollStatus];
  }
  int v13 = 1;
  objc_storeStrong(location, 0);
  double v2 = v18;

  return v2;
}

@end