@interface UIStatusBarDoubleHeightItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UIStatusBarDoubleHeightItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarDoubleHeightItemView";
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
  return (id)[(UIStatusBarDoubleHeightItemViewAccessibility *)self safeValueForKey:@"_contentsString", a2, self];
}

- (unint64_t)accessibilityTraits
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarDoubleHeightItemViewAccessibility;
  return [(UIStatusBarDoubleHeightItemViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0];
}

@end