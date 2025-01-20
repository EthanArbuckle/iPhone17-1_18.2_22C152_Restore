@interface SBHEditingWidgetButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (int64_t)_accessibilitySortPriority;
@end

@implementation SBHEditingWidgetButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHEditingWidgetButton";
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
  return accessibilityLocalizedString(@"add.widget.button.label");
}

- (int64_t)_accessibilitySortPriority
{
  return 1;
}

@end