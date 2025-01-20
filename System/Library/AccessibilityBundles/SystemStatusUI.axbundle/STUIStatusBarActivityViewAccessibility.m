@interface STUIStatusBarActivityViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation STUIStatusBarActivityViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarActivityView";
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
  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarActivityViewAccessibility;
  return *MEMORY[0x263F813F0] | [(STUIStatusBarActivityViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F81368];
}

@end