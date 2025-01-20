@interface CNPropertyLabelButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityHint;
@end

@implementation CNPropertyLabelButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPropertyLabelButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"contact.card.label.chooser.hint");
}

@end