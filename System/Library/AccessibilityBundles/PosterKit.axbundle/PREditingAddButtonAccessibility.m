@interface PREditingAddButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation PREditingAddButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PREditingAddButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"editing.add.button.label");
}

@end