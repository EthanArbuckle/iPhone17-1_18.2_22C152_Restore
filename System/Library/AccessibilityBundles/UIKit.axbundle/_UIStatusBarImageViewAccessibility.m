@interface _UIStatusBarImageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityHint;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOption;
@end

@implementation _UIStatusBarImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarImageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarImageViewAccessibility;
  return [(_UIStatusBarImageViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0] | *MEMORY[0x263F81368];
}

- (id)accessibilityHint
{
  return AXStatusBarItemHint(self);
}

- (unsigned)_accessibilityMediaAnalysisOption
{
  return 0;
}

@end