@interface IMBDefaultSectionHeaderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation IMBDefaultSectionHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Business.IMBDefaultSectionHeader";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(IMBDefaultSectionHeaderAccessibility *)self _accessibilityStringForLabelKeyValues:@"headerLabel"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)IMBDefaultSectionHeaderAccessibility;
  return *MEMORY[0x263F1CEF8] | [(IMBDefaultSectionHeaderAccessibility *)&v3 accessibilityTraits];
}

@end