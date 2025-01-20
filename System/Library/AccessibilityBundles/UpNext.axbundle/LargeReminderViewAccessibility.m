@interface LargeReminderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
@end

@implementation LargeReminderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UpNext.LargeReminderView";
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
  v2 = accessibilityLocalizedString(@"reminder.title");
  objc_opt_class();
  v3 = __UIAccessibilityCastAsClass();
  v6 = accessibilityLabelFromSortedLabelsInsideView(v3);
  v4 = __UIAXStringForVariables();

  return v4;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"reminder.hint");
}

@end