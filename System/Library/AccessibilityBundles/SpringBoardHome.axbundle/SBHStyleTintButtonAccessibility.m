@interface SBHStyleTintButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation SBHStyleTintButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHStyleTintButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"home.screen.open.wallpaper.color.picker");
}

@end