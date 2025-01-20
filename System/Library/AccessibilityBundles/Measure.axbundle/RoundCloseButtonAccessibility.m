@interface RoundCloseButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation RoundCloseButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.RoundCloseButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"CLOSE_BUTTON");
}

@end