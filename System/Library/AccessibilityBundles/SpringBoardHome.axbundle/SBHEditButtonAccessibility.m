@interface SBHEditButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (int64_t)_accessibilitySortPriority;
@end

@implementation SBHEditButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHEditButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"edit.button.label");
}

- (int64_t)_accessibilitySortPriority
{
  return 1;
}

@end