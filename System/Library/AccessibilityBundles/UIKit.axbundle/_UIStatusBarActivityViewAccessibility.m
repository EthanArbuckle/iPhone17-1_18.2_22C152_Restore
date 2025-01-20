@interface _UIStatusBarActivityViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIStatusBarActivityViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarActivityView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"status.activity.inprogress");
}

- (unint64_t)accessibilityTraits
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarActivityViewAccessibility;
  return [(_UIStatusBarActivityViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0] | *MEMORY[0x263F81368];
}

- (id)accessibilityHint
{
  return AXStatusBarItemHint(self);
}

@end