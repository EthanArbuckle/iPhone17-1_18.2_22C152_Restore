@interface SBHEditingDoneButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (int64_t)_accessibilitySortPriority;
@end

@implementation SBHEditingDoneButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHEditingDoneButton";
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
  return accessibilityLocalizedString(@"done.button.label");
}

- (int64_t)_accessibilitySortPriority
{
  return 1;
}

@end