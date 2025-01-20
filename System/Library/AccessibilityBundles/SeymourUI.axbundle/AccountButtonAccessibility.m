@interface AccountButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AccountButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.AccountButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"account.button");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AccountButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(AccountButtonAccessibility *)&v3 accessibilityTraits];
}

@end