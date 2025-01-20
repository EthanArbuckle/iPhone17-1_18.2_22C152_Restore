@interface SFMoreMenuButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation SFMoreMenuButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFMoreMenuButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilitySafariServicesLocalizedString(@"more.button");
}

@end