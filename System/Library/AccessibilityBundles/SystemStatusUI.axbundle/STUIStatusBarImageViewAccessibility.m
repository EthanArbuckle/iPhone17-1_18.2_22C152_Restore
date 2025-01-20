@interface STUIStatusBarImageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOption;
@end

@implementation STUIStatusBarImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarImageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarImageViewAccessibility;
  return *MEMORY[0x263F813F0] | [(STUIStatusBarImageViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F81368];
}

- (unsigned)_accessibilityMediaAnalysisOption
{
  return 0;
}

@end