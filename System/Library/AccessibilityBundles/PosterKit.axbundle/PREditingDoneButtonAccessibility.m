@interface PREditingDoneButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation PREditingDoneButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PREditingDoneButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"editing.done.button.label");
}

@end