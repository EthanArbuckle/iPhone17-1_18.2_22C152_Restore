@interface SearchTextFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
@end

@implementation SearchTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ProductPageExtension.SearchTextField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SearchTextFieldAccessibility;
  return *MEMORY[0x263F1CF30] | [(SearchTextFieldAccessibility *)&v3 accessibilityTraits];
}

- (unint64_t)_accessibilityAutomationType
{
  return 45;
}

@end