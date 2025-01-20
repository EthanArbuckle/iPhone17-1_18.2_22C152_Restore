@interface PREditingCancelButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation PREditingCancelButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PREditingCancelButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"editing.cancel.button.label");
}

@end