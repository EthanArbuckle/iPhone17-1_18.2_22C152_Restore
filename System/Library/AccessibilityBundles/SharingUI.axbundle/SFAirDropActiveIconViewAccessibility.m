@interface SFAirDropActiveIconViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation SFAirDropActiveIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFAirDropActiveIconView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"placeholder.view.label");
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"placeholder.view.hint");
}

- (id)accessibilityValue
{
  return accessibilityLocalizedString(@"placeholder.view.value");
}

@end