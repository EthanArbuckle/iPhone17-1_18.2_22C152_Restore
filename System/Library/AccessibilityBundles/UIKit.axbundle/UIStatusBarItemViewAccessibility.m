@interface UIStatusBarItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsNotFirstElement;
- (BOOL)accessibilityElementsHidden;
- (id)_accessibilityAddToDragSessionCustomAction;
- (id)accessibilityHint;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOption;
@end

@implementation UIStatusBarItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIStatusBarItemView", @"isVisible", "B", 0);
  objc_storeStrong(v4, obj);
}

- (id)_accessibilityAddToDragSessionCustomAction
{
  return 0;
}

- (id)accessibilityHint
{
  return AXStatusBarItemHint(self);
}

- (BOOL)accessibilityElementsHidden
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarItemViewAccessibility;
  if ([(UIStatusBarItemViewAccessibility *)&v3 accessibilityElementsHidden]) {
    return 1;
  }
  else {
    return ([(UIStatusBarItemViewAccessibility *)v5 safeBoolForKey:@"isVisible"] ^ 1) & 1;
  }
}

- (BOOL)_accessibilityIsNotFirstElement
{
  return 1;
}

- (unsigned)_accessibilityMediaAnalysisOption
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarItemViewAccessibility;
  return [(UIStatusBarItemViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0];
}

@end